--		Script.lua
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Thien Tran
--		
---------------------------------------------------------------------------------

function Script_HagathaHome(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.bActive = 0
		Ob.heldscale = 1
		Ob.interestLevel = 5	
		Ob.collSphereRadius = 50
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Scripts_spineJA.jan'
		Ob.dependencies = {
			meshes = {
				'Levels/TH_GloriasBrain/StageProps/KnightofJoyScript.plb',
				'Levels/TH_GloriasBrain/StageProps/MailBoatScriptScript.plb',
				'Levels/TH_GloriasBrain/StageProps/HagathaScript.plb',
			},
			textures = {
				'Textures/icons/InventoryItems/KnightOfJoyScript.dds',
				'Textures/icons/InventoryItems/HagathaScript.dds',
				'Textures/icons/InventoryItems/MailBoatScript.dds',
			},
		}
	end
	
--*******************************************************************************
	
	function Ob:onBeginLevel()
		if (self.Name == 'Script_KnightOfJoy') then
			self.meshName = 'Levels/TH_GloriasBrain/StageProps/KnightofJoyScript.plb'
			self.scriptFlag = 'bHasScript_KnightOfJoy'
			self.prop = FindScriptObject('Knight')
			self.pickupSpriteName = 'KnightOfJoyScript'
			--edit to make work with rando code
			self.scriptName = 'Script_KnightOfJoy'
			self.displayName = "/GLZB061TO/"--DIALOG=<<Knight of Joy Script>>
		elseif (self.Name == 'Script_LoveBoat') then
			self.meshName = 'Levels/TH_GloriasBrain/StageProps/MailBoatScriptScript.plb'
			self.scriptFlag = 'bHasScript_LoveBoat'
			self.prop = FindScriptObject('Boat')
			self.pickupSpriteName = 'MailBoatScript'
			self.scriptName = 'LoveBoat'
			self.displayName = "/GLZB062TO/"--DIALOG=<<Mail Boat Script>>
		elseif (self.Name == 'Script_HagathaHome') then
			self.meshName = 'Levels/TH_GloriasBrain/StageProps/HagathaScript.plb'
			self.scriptFlag = 'bHasScript_HagathaHome'
			self.prop = FindScriptObject('CloudCar')
			self.pickupSpriteName = 'HagathaScript'
			--edit to make work with rando code
			self.scriptName = 'Script_HagathaHome'
			self.displayName = "/GLZB060TO/"--DIALOG=<<Hagatha Home Script>>
		else
			GamePrint('WARN: Created unknown script: '..self.Name)
			self:killSelf()
			return
		end

		--If script has already been found, then kill it
		if (Global:load(self.scriptFlag) == 1) then
			self:killSelf()
			return
		end

		%Ob.Parent.onBeginLevel(self)

		--edit removing for Rando Placement
		--self.hx,self.hy,self.hz = self:getPosition()
		--self.activationTime = Global.levelScript.activationTime or 2
		--self.inactiveHeight = Global.levelScript.inactiveHeight or 1000

		--SetScale(self, 0.5, 0.5, 0.5)

		--edit to allow pickup
		--self:beNotPickupable()

		self.becky = FindScriptObject('Becky')
 	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		--edit remove
		--if self.bInInventory ~= 1 and self.hx then self:deactivate(1) end
	end
	
   	
--*******************************************************************************
	
	function Ob:fakePickupable()
		if self.bInteresting == 1 then
			return
		end
		
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		self.bInteresting = 0
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self, 0)
		self.Telekinesis = kTKBEHAVIOR_NONE
		
		self.interestFX = Global.levelScript:getPool(self.interestFXName):get()
		SetEntityDomain(self.interestFX, GetEntityDomain(self))
		local rootJoint = GetRootJointName(self)
		if rootJoint then
			self.interestFX:run()
			self.interestFX:attach(self, rootJoint)
			self.interestFX:setPosition(0, sphereSize, 0)
		else
			self.interestFX:run(self)
			self.interestFX:attach(self)
			local sx, sy, sz = self:getPosition()
			local lx, ly, lz = GetEntityLookCenter(self)
			self.interestFX:setPosition(lx-sx, ly-sy, lz-sz)
		end
		if self.bUseDefaultUncollectedAnim == 1 then
			if not self.mover then
				self.mover = SpawnScript('Global.Props.Geometry', nil, 'self.meshName = \'Characters/GenericMover.plb\'', 1)
				SetEntityFlag(self.mover, ENTITY_DETAIL_CULLING, 0)
				SetEntityVisible(self.mover, 1)
				SetEntityAlpha(self.mover, 1, 0)
				SetEntityFlag(self.mover, ENTITY_CANNOTBESTOODON, 1)
				SetPhysicsFlag(self.mover, PHYSICS_SLIDEONCOLLIDE, 1)
				SetPhysicsFlag(self.mover, PHYSICS_APPLYGRAVITY, self.applyGravity)
				local me = self
				self.mover.onNewMoveCollide = function(self, data, from)
					%me:onNewMoveCollide(data, from)
				end
			end
			self.mover:setPosition(self:getPosition())
			self.mover:setOrientation(self:getOrientation())
			AttachEntityToEntityBone(self, self.mover, 'rootJ_1')
			self:createTimer(RandInt(5, 2000), self.TIMER_START_MOVER_ANIM) -- so not all movers are n sync
		end
	end
	
--*******************************************************************************
	
	--make this set come down from above						  
	function Ob:activate(bImmediate)
		if (bImmediate == 1) then
			self:setPosition(self.hx,self.hy,self.hz)
			if (self.Name == 'Script_LoveBoat' and Global:load('DragonDestroyed') ~= 1) then
				--hack to make not pickup the love boat script until dragon has died
				self:beNotPickupable()
				self:fakePickupable()
			else
				self:bePickupable()
			end
		else			
			local time = Global.levelScript.activationTime + (RandInt(10,50) / 100)
			--move down on spline
			local tPath = {}
			local x,y,z = self:getPosition()
			tPath[0] = {xpos = x, ypos = y, zpos = z}
			tPath[1] = {xpos = self.hx, ypos = self.hy, zpos = self.hz}
			self.hPath = CreateAbsolutePath( self, time, kSPLINEPATH_ONCE, tPath)
			SplineForceMove( self, 1)
			SplineUnidirectional( self, 1)
			SplineOrientationFlag(self, 0)	    
		end
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetEntityVisible(self, 1)
		SetEntityAlpha(self, 1, 0)
		self.bActive = 1
		
	end
	
--*******************************************************************************
   			
	--make this set rise up
	function Ob:deactivate(bImmediate)
		if (bImmediate == 1) then
			self:setPosition(self.hx,self.hy+self.inactiveHeight,self.hz)
			SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
			SetEntityVisible(self, 0)
			self:beNotPickupable()
		else
			local time = self.activationTime + (RandInt(10,50) / 100)
			self:beNotPickupable()
			--move up on spline
			local tPath = {}
			local x,y,z = self:getPosition()
			tPath[0] = {xpos = x, ypos = y, zpos = z}
			tPath[1] = {xpos = x, ypos = y+self.inactiveHeight, zpos = z}
			self.hPath = CreateAbsolutePath( self, time, kSPLINEPATH_ONCE, tPath)
			SplineForceMove( self, 1)
			SplineUnidirectional( self, 1)
			SplineOrientationFlag(self, 0)	    
		end
		self.bActive = 0
	end

--*******************************************************************************
	
	--Attaches the script to becky's hand during her GetScript animation
	--  desiredFrame: The frame of her GetScript animation to set her at
	function Ob:attachToBecky(desiredFrame)
		--This is kind of hacky.  Trying to sync up her animation to the right point in case the
		--player skipped a line.
		local currentFrame = GetAnimCompletion(self.becky, nil, 'GetScript.jan', 1)
		if (abs(currentFrame - desiredFrame) > 5) then
			GamePrint('Chaning becky\'s GetScript animation from frame '..currentFrame..' to '..desiredFrame)
			SetAnimCompletion(self.becky, 'GetScript.jan', desiredFrame, 1)
		end

		DetachEntityFromParent(self)
		local handBoneName = 'handJEndLf_1'; 
		AttachEntityToEntityBone( self, self.becky, handBoneName );
		self:setOrientation(-120,-90,10)
		self:setPosition(20,0,20)
	end

	--Throws the script to the side, and then makes it invisible
	function Ob:stateThrown()
		DetachEntityFromParent(self)
		local speed = 100
		self:setVelocity(speed * 8, speed * 2, speed * 20)
		self:sleep(2)
		self:setVelocity(0,0,0)
		SetEntityVisible(self,0)
		self:setState(nil)
	end

--*******************************************************************************

 	function Ob:onSplinePointArrive(data,from)
		--GamePrint("ON SPLINE POINT ARRIVE " .. data)
		if (tonumber(data) == 2) then
			DetachFromSpline(self)
			DestroyPath(self.hPath)
			SetVelocity(self, 0,0,0)
			
			if (self.bActive == 0) then
				SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
				SetEntityVisible(self, 0)
				self:beNotPickupable()
			else
				if (self.Name == 'Script_LoveBoat' and Global:load('DragonDestroyed') ~= 1) then
					--hack to make script not pickup the love boat script until dragon has died
					self:beNotPickupable()
					self:fakePickupable()
				else
					self:bePickupable()
				end
			end
		end
	end

--*******************************************************************************

	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data,from)
		self.bPickedUp = 1
		
		--You have to actually give becky the KnightOfJoy script
		if (self.scriptName ~= 'KnightOfJoy') then
			--Give becky the script automagically
--			self.becky.whichScript = self.scriptName
--			self.becky:setState('ReceiveScript')
		end

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
		
	end
--*******************************************************************************

	function Ob:fadeIn()
		self:setState('FadeIn')
	end
	
	function Ob:stateFadeIn()
		SetEntityVisible(self, 1)
		SetEntityAlpha(self, 1, Global.levelScript.activationTime)
		self:sleep(Global.levelScript.activationTime)
		self.bActive = 1
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		self:setState(nil)
	end

--*******************************************************************************

	function Ob:makeInvisible()
		%Ob.Parent.makeInvisible(self)
		if (self.interestFX) then self.interestFX:stop() end
	end
												
--*******************************************************************************

	function Ob:makeVisible()
		%Ob.Parent.makeVisible(self)
		if (self.interestFX) then self.interestFX:run() end
	end

--*******************************************************************************
	
	function Ob:fadeOut()
		self:setState('FadeOut')
	end
	
	function Ob:stateFadeOut()
		if (self.ladder) then self.ladder:deactivate() end
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		SetEntityAlpha(self, 0, Global.levelScript.activationTime)
		self:sleep(Global.levelScript.activationTime)
		SetEntityVisible(self, 0)
		self.bActive = 0
		self:setState(nil)
	end

	return Ob
end

