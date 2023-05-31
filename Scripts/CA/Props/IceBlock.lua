--
--  IceBlock.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--
-- For a scavenger hunt puzzle.

function IceBlock(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.Geometry', 'IceBlock')
		Ob.firestartResistance = 2
		Ob.itemEncased = '' -- Editable
		Ob.itemEncasedReference = nil
       	Ob.meshName = 'Levels/CA_Campgrounds/Props/CA_ScavIceCube.plb' -- Editable
		Ob.curScaleY = 1
		Ob.curX = 0
		Ob.curY = 0
		Ob.curZ = 0
		Ob.fireStartY = -20
		Ob.collSphereRadius = 70
		Ob.TIMER_DIE = '3001'
		Ob.TIME_DIE = 500
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.curX, self.curY, self.curZ = self:getPosition()
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.itemEncasedReference = FindScriptObject(self.itemEncased,1)
		if self.itemEncasedReference and self.itemEncasedReference.bCollected ~= 1 then
			self.itemEncasedReference:beNotPickupable()
		else
			self:killSelf()
		end
		local door = FindScriptObject('ActivatedFridgeDoor',1)
		if door ~= nil then
			door:addListener(self, 'Open')
			door:addListener(self, 'Activate')
		end
		SetEntityInterestLevel(self,0)
		if (Global:load('ActivatedFridgeDoorOpen') == 1) then
			self:listenerOpen()			
		end
		
		self:setState(nil)
	end

	-- Melting goes on autopilot after 0.5 (since the tiny object becomes hard to acquire as a target)
	-- Once scaled down, it releases the target
	function Ob:stateMelt()
		local decrement = 0.45 * GetFrameSecs()
		self.curScaleY = self.curScaleY - decrement
		if self.curScaleY > 0 then
			SetEntityCollideSphere(self, self.collSphereRadius / self.curScaleY, 0, self.collSphereRadius/self.curScaleY/2,0)
			self:setScale(1, self.curScaleY, 1)
			self.curY = self.curY - decrement
			self:setPosition(self.curX, self.curY, self.curZ)
		else
			self:setScale(1,0,1)
			self:Melted()
			self:setState(nil)
		end
	end
	
    function Ob:onFireBurn()
		%Ob.Parent.onFireBurn(self)
		--self:setState('Melt') -- this state makes the ice continue to melt and then not do anything
		if ( self.curScaleY > 0.5 ) then
			self:stateMelt()
			if ( self.curScaleY <= 0.5 ) then
				self:setState('Melt')
			end
		end
	end
	
	function Ob:onFireEnd()	-- override this so explode FX dont play but instead more steam FX play
        -- dont call our parent so that explode FX dont play
	end
	
	function Ob:listenerActivate()
		local door = FindScriptObject('ActivatedFridgeDoor',1)
		if door ~= nil then
			SetEntityInterestLevel(door,0)
		end		
	end
	
	function Ob:listenerOpen()
		SetEntityInterestLevel(self,kHELDOBJECT_INTEREST)
		local door = FindScriptObject('ActivatedFridgeDoor',1)
		if door ~= nil then
			SetEntityInterestLevel(door,0)
		end		
	end
	
	function Ob:Melted()
		self.itemEncasedReference:bePickupable()
		self.itemEncasedReference = nil
		self:createTimer(self.TIME_DIE, self.TIMER_DIE)
	end
	
	function Ob:onTimer(id)
        if id == self.TIMER_DIE then
			self:stopSmokeFX()
			self:killSelf()
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	
	return Ob
end

