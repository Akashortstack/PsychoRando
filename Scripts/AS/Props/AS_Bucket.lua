
function AS_Bucket(Ob)
-- constructor

	if not Ob then
		Ob = CreateObject('Global.Props.Geometry')
		-- set up record keeping for crows, because they need to know when the bucket drops
		Ob.iTotalCrows = 0
		-- the speed with which the bucket crashes down
		Ob.iSpeedDown = 3.5
		-- the speed with which it goes up
		Ob.iSpeedUp = 2							
		-- the height it goes up from its placed position
		Ob.iHeight = 1700
		-- how much the bucket will quiver whenever a crow lands on it
		Ob.iQuiverFactor = 10
		-- how many crows there need to be on the bucket in order for it to go or stay down
		Ob.iThreshold = 4
		Ob.sCrowTrigger = nil	-- triggerSphere used to detect if the crows are on the jar.  Much safer than having them send us a message
		
		Ob.maxViewDistance = 350
	end
	

	
--  I N I T   F U N C T I O N S   A N D   S T A T E S  ********************************************

	function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
		self:loadMesh('Levels/AS_Asylum/Props/AS_Bucket.plb')
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 1)
		SetEntityCollideSphere(self, 70, 0, 90, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 1)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 1)
		SetSimulationCullDistance(self, 0)
				
		-- homebase position of the bucket
		self.px, self.py, self.pz = self:getPosition()
		
		-- amount of crows needed before the bucket returns to the ground
		self.iThreshold = 4
		
		-- to keep track of crows
		self.tCrows = {}
		
	end
	
	function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
		--edit look for randomized item instead of Milka's Brain
		self.Brain = FindScriptObject(self.randoitem,1)
		if self.Brain then
			--edit stop uncollected animations to allow attaching
			if self.Brain.mover then
				DetachEntityFromParent(self.Brain)
				KillScript(self.Brain.mover)
				self.Brain.mover = nil
			end
			--edit raise the Y value from 25 to make it easier to see
			self.Brain:setPosition(self.px, self.py+75, self.pz)
			SetMaxViewDistance(self.Brain, 0)
			AttachEntityToEntity(self.Brain, self, 1)
			SetEntityCollideIgnoreEntity(self, self.Brain, -1)
			self:setEntityInterestLevel(kBRAIN_INTEREST)
		end
		
	end

--*************************************************************************************************

	function Ob:beginStateDown()
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		if (self.Brain) then
			SetPhysicsFlag(self.Brain, PHYSICS_COLLIDEE, 0)
		end
	end

	function Ob:stateDown()
		-- let the crows know to go down with the bucket
		for i, v in self.tCrows do
			self:sendMessage(v, 'BucketDown', '')
		end
		Yield()
		-- move bucket down
		--SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 1)
		self:moveToPos(self.px, self.py, self.pz, self.iSpeedDown)
		-- let the crows know when done
		for i, v in self.tCrows do
			self:sendMessage(v, 'BucketDone', '')
		end
        
		self:setState(nil)
	end
	
	function Ob:endStateDown()
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 1)
		if (self.Brain) then
			SetPhysicsFlag(self.Brain, PHYSICS_COLLIDEE, 1)
		end
	end

--*************************************************************************************************
	
	function Ob:beginStateUp()
        SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		if (self.Brain) then
			SetPhysicsFlag(self.Brain, PHYSICS_COLLIDEE, 0)
		end
		self.bUp = nil
	end
	
	function Ob:stateUp()
		-- give the crows a chance to scatter
		self:sleep(.6)
		
		-- let the crows know to go up with the bucket 
		for i, v in self.tCrows do
			v:onBucketUp()
		end
		-- move the bucket up
		self:moveToPos(self.px, self.py + self.iHeight, self.pz, self.iSpeedUp)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		self.bDown = 0
		
		self:setState(nil)
	end
	
	function Ob:endStateUp()
        SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		if (self.Brain) then
			SetPhysicsFlag(self.Brain, PHYSICS_COLLIDEE, 1)
		end
		self.bUp = 1
	end

--*************************************************************************************************
	
	function Ob:stateQuiver()
		local px, py, pz = self:getPosition()
		if (self.py ~= py) then
			self:moveToPos(px, py-self.iQuiverFactor, pz, .05)
			self:moveToPos(px, py, pz, .1)
		end
		
		self:setState(nil)
	end
	
--  M E S S A G E   H A N D L E R S  **************************************************************

	-- when a crow flies off, it sends a release msg
	-- the bucket goes up only if iThreshold-1 or less crows left
	function Ob:release(from)
        if (not self.tCrows[from.Name].bTrapped or self.tCrows[from.Name].bTrapped == 1) then
			self.iTotalCrows = self.iTotalCrows - 1
		end
		
        self.tCrows[from.Name].bTrapped = 0
		self.tCrows[from.Name].bDontFly = 0
		
		if (self.iTotalCrows < self.iThreshold) then
			self:setState('Up')
		end
	end

--*************************************************************************************************
	
	-- when a crow returns to the bucket, it sends a trap msg	
	-- the bucket goes down only if there are iThreshold or more crows back
	function Ob:trap(from)
		self.tCrows[from.Name].bTrapped = 1
		self.iTotalCrows = self.iTotalCrows + 1
		self.tCrows[from.Name].bDontFly = 1
		
        if (self.iTotalCrows >= self.iThreshold) then
			self:setState('Down')
		else
			self:setState('Quiver')
		end
	end

--*************************************************************************************************
	
    function Ob:onItem(data, from)
		if (GetPlayerInvisibility() == 1 and self.Brain) then
            DetachEntityFromParent(self.Brain)
			SetMaxViewDistance(self.Brain, 350)
			SendMessage(self,self.Brain,'PickupBrain','','')
			self.Brain = nil
		end
    end

--  O T H E R  F U N C T I O N Z  ******************************************************************

	function Ob:register(crow)
		if (self.tCrows[crow.Name] == nil) then
			self.tCrows[crow.Name] = crow 
			self.iTotalCrows = self.iTotalCrows + 1
			SetEntityCollideIgnoreEntity(self, self.tCrows[crow.Name], -1)
			
			-- set some things up for the crow
			crow.iBucketHeight = self.iHeight
			crow.iBucketSpeedUp = self.iSpeedUp
			crow.iBucketSpeedDown = self.iSpeedDown
		end
	end
--*************************************************************************************************

	return Ob
end

