
function Watercurse(Ob)
	if (Ob == nil) then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/WaterArm.plb'
		Ob.animsDir = 'Water_Arm'
		Ob.animsTable = {
			grab = 		{fileName = 'Grab', preload = 1, blendTime = 0.1, loop = 0 }, 
			miss = 		{fileName = 'Miss', preload = 1, blendTime = 0.0, loop = 0 },			
		}
		Ob.CURSETIMER = '1'
		Ob.CURSETIME = 2500
		Ob.curseCount = 0

		Ob.NOPSIFLOATTIMER = '2'
		Ob.NOPSIFLOATTIME = 2500
		
		Ob.useRespawn = 0 -- Editable
		
		-- default... change this to 1 to use raz's respawn points
		
		Ob.xOff = 100
		Ob.yOff = 0
		Ob.zOff = 100
		Ob.inCanoe = 0
		Ob.adjustedAirEnglishAcceleration = 200 -- original 2000
		Ob.adjustedAirEnglishMaxSpeed = 150     -- original 550

		Ob.sTriggerPlaneName = nil -- Editable
		Ob.turnedOn = 1 -- on by default
		Ob.sleepScale = 1 -- this is so that all sleep times can be doubled to make the LO arms work

		Ob.sSecondaryTrigVolName = nil -- Editable
		Ob.bIgnoreOnLadder = 1	
		Ob.bFreezeCameraOnGrab = 0  
		
		-- for trigger mesh support
		Ob.bUseTriggerMesh = 0  -- Editable
		Ob.rTriggerMeshHandle = nil
		Ob.sTriggerMeshPath = nil -- Editable

		--definitions for LO specific watery arms
		Ob.LO_CURSETIME = 5000
		Ob.LO_sleepScale = 1 -- this is so that all sleep times can be doubled to make the LO arms work
		Ob.LO_AnimSpeedScale = 1
	end

--************************************************************************************************* 
-- GAME STATES
--*************************************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.spamListeners = {}
		self.tTriggerHandles = {}
		self.trigPlaneYOffset = -20
	end

	function Ob:onBeginLevel()
		self.levelName = GetCurrentLevelName()
		if Global.levelScript:getLevelPrefix() == 'WW' then
			self.meshName = 'Characters/waterarm_mi.plb'
		end
		
		%Ob.Parent.onBeginLevel(self)
		self.curseCount = 0
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		SetEntityInterestLevel(self,0)
		SetMeshIsBackwards(self, 1)
		SetEntityAlpha(self, 0, 0)
        
		self.MissSound = LoadSound('WaterCurse')
        self.WaterGrabSound = LoadSound('WaterGrab')
        self.WaterPullSound = LoadSound('WaterPull')
        self.ScarySound = LoadSound('Scary')

		-- register trigger vols
		local handle
		local index = 1
		if (self.sTriggerPlaneName) then
			while (1) do
				handle = TriggerOBB_Lookup(nil, self.sTriggerPlaneName..index)
				if (not handle) then
					break
				end
				self.tTriggerHandles[index] = handle
				index = index + 1
				Trigger_RegisterListener(handle, self)
			end
		end		
		if (self.sSecondaryTrigVolName) then
			RegisterTriggerVolume(self, self.sSecondaryTrigVolName, 0)
		end
		-- for trigger meshes
		if self.bUseTriggerMesh == 1 then
			if self.sTriggerMeshPath then
				self.rTriggerMeshHandle = TriggerMesh_New(self.sTriggerMeshPath, 0,0,0)
			elseif Global.levelSettings.waterMeshPath then
				if not Global.levelSettings.waterMesh then
					Global.levelSettings.waterMesh = TriggerMesh_New(Global.levelSettings.waterMeshPath, 0,0,0)					
				end
				self.rTriggerMeshHandle = Global.levelSettings.waterMesh
			end
			if self.rTriggerMeshHandle then
				Trigger_RegisterListener(self.rTriggerMeshHandle, self)
			end
		end
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			self.CURSETIME = self.LO_CURSETIME
			self.sleepScale = self.LO_sleepScale
			SetAnimSpeedScale(self,self.LO_AnimSpeedScale)
			self.curseCountTarget = 1
		else
			self.sleepScale = .5
			SetAnimSpeedScale(self,1.2)
			self.curseCountTarget = 2
		end
	end
	
	function Ob:onEndLevel()
		Global.player:setPhysicsConstants() 		
		%Ob.Parent.onEndLevel(self)
	end

	function Ob:onSimulationCulled(bSleep)
		%Ob.Parent.onSimulationCulled(self, bSleep)
		if bSleep==1 then
			if self.state_name then
				GamePrint(TT_Warning, format("watercurse sleeping while in state %s", self.state_name))
			end
			-- This should do the majority of the cleanup
			self:setState(nil)
			-- and this is in case timers don't go off while sleeping
			SetPhysicsState(Global.player, PHYSICSSTATE_NOPSIFLOAT, 0)
		end
	end
			
	function Ob:grabPlayer()
		Global.player:extinguish()
		Global.player:interruptPowers(1)
		self.origX, self.origY, self.origZ = Global.player:getPosition()
		self.origY = self.origY + self.trigPlaneYOffset
		--GamePrint(self.origY .. 'self.curseCount: ' .. self.curseCount)

		if Global.levelScript:getLevelPrefix() ~= 'MC' and ((not self.curseCountTarget) or (self.curseCount < self.curseCountTarget)) then
			self.curseCount = self.curseCount + 1
			self.bPullingDown = 1
			self:setState('ArmMiss')
			self:killTimer(self.CURSETIMER)
			self:createTimer(self.CURSETIME, self.CURSETIMER)
		else
			Global.player.block = 1
			self.bPullingDown = 1
			self:setState('ArmGrab')			
		end
	end
	
	function Ob:beginStateArmMiss()
		SetPhysicsState(Global.player, PHYSICSSTATE_NOPSIFLOAT, 1)
		self:createTimer(self.NOPSIFLOATTIME, self.NOPSIFLOATTIMER)
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			self.CURSETIME = self.LO_CURSETIME
			self.sleepScale = self.LO_sleepScale
			SetAnimSpeedScale(self,self.LO_AnimSpeedScale)
			SetAnimSpeedScale(Global.player,.90)
		else
			self.sleepScale = .5
			SetAnimSpeedScale(self,1.2)
		end
		Global.player.bWaterCurse = 1
	end
	function Ob:stateArmMiss()
		if (self.curseCount == 1) then
			PlaySound(nil, self.ScarySound)		
		end		
		if GetControlHandler() ~= kCONTROL_PLAYER and GetControlHandler() ~= kCONTROL_LADDER then
			SetControlHandler(kCONTROL_PLAYER)
		end
		local x, y, z = Global.player:getPosition()
		if GetControlHandler() ~= kCONTROL_LADDER or self.bIgnoreOnLadder == 0 then			
			--		Global.player:setPosition(x, 270, z)
			Global.player:setPosition(x, self.origY+60, z)
			Global.player:setVelocity(0, 0, 0)
		end
		if self.rotating then
			DetachEntityFromParent(self)
		end	
		self:setPosition(x, self.origY+60, z)
		if self.rotating then
			local dh = FindScriptObject('DeadlyHazards')
			AttachEntityToEntity(self,dh,1)
		end
		Yield()
		if (Global.levelScript.waterFXManager) then
			Global.levelScript.waterFXManager:FXoff()
		end
		if GetControlHandler() ~= kCONTROL_LADDER or self.bIgnoreOnLadder == 0 then
			SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 0)
			SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
			SetPhysicsConstant (Global.player, PHYSICS_AIRENGLISH, self.adjustedAirEnglishAcceleration)
			SetPhysicsConstant (Global.player, PHYSICS_MAXENGLISHSPEED,   self.adjustedAirEnglishMaxSpeed )
			ForceRazJump('Anims/DartNew/Hop_water.jan')
		end
		self:setAnim(self.animsTable.miss)
		self:sleep(0.2 * self.sleepScale)
		SetEntityAlpha(self, .9,0.2)
		PlaySound(nil, self.MissSound)
		self:sleep(0.4 * self.sleepScale)
		SetEntityAlpha(self, 0,0.2)
		self:sleep(0.4 * self.sleepScale)
		self:setState(nil)
	end
	function Ob:endStateArmMiss()
		self.bPullingDown = 0
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			--edit for LO QOL
			local randosettings = FindScriptObject('RandoSeed')
			if randosettings.fasterLO == TRUE then
				SetAnimSpeedScale(Global.player,.75)
			else
				SetAnimSpeedScale(Global.player,.55)
			end
		end
		Global.player:setPhysicsConstants()
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		Global.player.bWaterCurse = nil
	end


	function Ob:beginStateArmGrab()
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			self.CURSETIME = self.LO_CURSETIME
			self.sleepScale = self.LO_sleepScale
			SetAnimSpeedScale(self,self.LO_AnimSpeedScale)
		else
			self.sleepScale = 1
			SetAnimSpeedScale(self,1)
		end
		Global.player.bWaterCurse = 1
		
		if (self.bFreezeCameraOnGrab == 1) then
			self.scriptCam = Global.camControl:pushAndSetScript(self)
		end
	end
	
	function Ob:stateArmGrab()
		SetEntityAlpha(self, .7,0.7)

		-- send message out to listeners
		if (self.spamListeners) then
			for i, v in self.spamListeners do
				if (v and v.listenerWaterCurseGrab) then
					v:listenerWaterCurseGrab()
				end
			end
   		end

		Global.player:setPhysicsConstants() -- just to be sure
		Global.player:stopMelee()
		Global.player:interruptPowers()
		Global.player:fireDissipate()
		Global.player:doNothing()
		self:dontRunPlayerControls(1)
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		local x, y, z = Global.player:getPosition()
		local ox, oy, oz = Global.player:getOrientation()
		Global.player:setPosition(x, self.origY+30, z)
		Global.player:setVelocity(0, 0, 0)
--		Global.player:setOrientation(0, 1, 0)
		self:setOrientation(ox, oy, oz)
--		self:setOrientation(0, 1, 0)
		RotateEntityY(self, 180, 0)

		if (Global.levelScript.waterFXManager) then
			Global.levelScript.waterFXManager:FXoff()
		end
		
		local fwdx, fwdy, fwdz = GetEntityForwardVector(Global.player)
		
		self:setPosition(x + (fwdx * self.xOff), self.origY + self.yOff, z + (fwdz * self.zOff))
--		ForceRazJump()
		Yield()
		
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			SetAnimSpeedScale(self,.55)
		end
		
		self:setAnim(self.animsTable.grab)
		if (self.sleepScale ~= 1) then
			self:sleep(.2)
		end

		LoadAnim(Global.player, 'Anims/DartNew/Grabbed.jan', 0, 0.2)
		
		self:sleep(.7 * self.sleepScale)
		PlaySound(nil, self.WaterGrabSound)
		self:sleep(.8 * self.sleepScale)
		PlaySound(nil, self.WaterPullSound)
		self:sleep(0.2 * self.sleepScale)

		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			self:sleep(1.5)	
		end
		
		Global.cutsceneScript:fadeToBlack(0.5)
		SetEntityAlpha(self, 0,0.2)
		SetEntityAlpha(Global.player, 0,0.2)
		self:sleep(0.6 * self.sleepScale)
		self:setState('DropAtBeach')
	end
	function Ob:endStateArmGrab()
		Global.player.block = 0
		if (self.bFreezeCameraOnGrab == 1) then
			Global.camControl:removeCam(self.scriptCam)
		end
		Global.player:setPhysicsConstants()
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		self:dontRunPlayerControls(0)
		Global.player.bWaterCurse = nil
	end


	function Ob:stateDropAtBeach()
		-- send message out to listeners 
		-- NOTE: moved this to before it moves raz, to fix water in MC.
		if (self.spamListeners) then
			for i, v in self.spamListeners do
				if (v and v.listenerWaterCurseDropAtBeach) then
					v:listenerWaterCurseDropAtBeach()
				end
			end
   		end
		
		SetEntityAlpha(Global.player, 1,0)

		if (Global.levelScript.waterFXManager) then
			Global.levelScript.waterFXManager:FXoff()
		end
		if (self.useRespawn == 0) then
			local parkedPosition = Global:load('ParkedCanoePosition', 'CA')
			if (parkedPosition ~= 2) then
				Global.player:setPosition(8682, 682, 14706)
			else -- canoe is at milla, drop raz there
				local canoe = FindScriptObject('Canoe')
				if( nil ~= canoe ) then
					FindScriptObject('Canoe'):setupParkedPosition(parkedPosition)
					FindScriptObject('Canoe'):setCanoePosition()
					FindScriptObject('Canoe'):setRazPosition()
				end		
			end
		else
			SetControlHandler(kCONTROL_PLAYER)		
			local x, y, z
			local respawnLSO = nil
			local playerRespawnLSOName = Global:getPlayerWaterCurseRespawnPointName()
			if playerRespawnLSOName then
				respawnLSO = FindScriptObject(playerRespawnLSOName)
			end
			if not respawnLSO then
				respawnLSO = FindScriptObject('dartstart',1)		
			end
			if not respawnLSO then
				GamePrint('ERROR: Dart tried to respawn, but object ' .. (playerRespawnLSOName or 'nil') .. ' could not be found.')
			else
				x, y, z = respawnLSO:getPosition()
				Global.player:setPosition(x, y, z)
			end
		end
		SnapEntityToGround(Global.player)
		MoveCameraToIdeal()
		Global.cutsceneScript:fadeIn(0.5)
		

		self.bPullingDown = 0
		self.curseCount = 0
		self:setState(nil)
	end

	
	function Ob:turnOn()
		self.turnedOff=0
		self.turnedOn=1
	end
	
	function Ob:turnOff()
		if not self.turnedOff then
			self.turnedOn=1
			self.turnedOff = 1
			--SetEntityAlpha(self, 0, .5)
			if self.rotating then
				DetachEntityFromParent(self)
				SetEntityAlpha(self, 0,0)
			end
		end	
	end

	function Ob:addSpamListener(listener)
		if (not self.spamListeners) then 
			self.spamListeners = {} 
		end
		self.spamListeners[listener.Name] = listener
	end	

	function Ob:onTimer(id)
		if (id == self.CURSETIMER) then
			self:killTimer(self.CURSETIMER)
			self.curseCount = 0
		elseif (id == self.NOPSIFLOATTIMER) then
			self:killTimer(self.NOPSIFLOATTIMER)
			SetPhysicsState(Global.player, PHYSICSSTATE_NOPSIFLOAT, 0)
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	function Ob:onCrossedTriggerPlane(data,from, data2)			
		if Global.cutsceneScript.cutscenePlaying == 1 then
			return
		end
		GamePrint('onCrossedTriggerPlane data2:' .. data2)			
		Global.player:interruptPowers(1)
		if (from == Global.player and data2 == 0 and self.turnedOn == 1 and self.bPullingDown ~= 1) then
			self:grabPlayer()
		elseif (type(from.hitWater) == 'function') then
			from:hitWater()
		end
	end

	function Ob:onEnteredTriggerVolume(data, from, handle, x,y,z)		
		if Global.cutsceneScript.cutscenePlaying == 1 then
			return
		end
		--DrawSphere(x,y,z,50)
		--GamePrint('onEnteredTriggerVolume data:' .. data)
		if (from == Global.player and self.bUseTriggerMesh == 1 and data == self.rTriggerMeshHandle and self.bPullingDown ~= 1) then
			self:grabPlayer()
		elseif (from == Global.player and self.sSecondaryTrigVolName and data == self.sSecondaryTrigVolName and self.bPullingDown ~= 1) then
			-- only pull down on ladder, since this is for ladder only
			if GetControlHandler() == kCONTROL_LADDER then
				self.bIgnoreOnLadder = 0
				self:grabPlayer()
			end
		elseif (from == Global.player and self.turnedOn == 1 and self.bPullingDown ~= 1) then
			self.bIgnoreOnLadder = 1
			self:grabPlayer()
		elseif (type(from.hitWater) == 'function') then
			from:hitWater(x,y,z)
		end
	end
		
	return Ob
end

