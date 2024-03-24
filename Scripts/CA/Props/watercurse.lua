
function WaterCurse(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/WaterArm.plb'
		Ob.animsDir = 'Water_Arm'
		Ob.animsTable = {
					grab = 		{fileName = 'Grab', preload = 1, blendTime = 0.0, loop = 0 }, 
					miss = 		{fileName = 'Miss', preload = 1, blendTime = 0.0, loop = 0 },
					
					}
		Ob.CURSETIMER = '1'
		Ob.CURSETIME = 2500
		Ob.curseCount = 0

		Ob.NOPSIFLOATTIMER = '2'
		Ob.NOPSIFLOATTIME = 2500
		
		Ob.yToCheck = 240 -- default... for campground
		Ob.useRespawn = 0 -- default... change this to 1 to use raz's respawn points
		
		Ob.xOff = 100
		Ob.yOff = 10
		Ob.zOff = 100
		Ob.inCanoe = 0
		Ob.adjustedAirEnglishAcceleration = 300 -- original 2000
		Ob.adjustedAirEnglishMaxSpeed = 150     -- original 550
		Ob.curseCountTarget = 2
		
	end

--************************************************************************************************* 
-- GAME STATES
--*************************************************************************************************
--Global.player:loadAnim('anims/dartnew/CrawlOutOfWater.jan', 0, 0)

	function Ob:onBeginLevel()
		if Global.levelScript.Type == 'mi.MIFL' then
			self.meshName = 'Characters/WaterArm_MI.plb'
		end	
		%Ob.Parent.onBeginLevel(self)
        self:setState('CheckRazY')
		self.curseCount = 0
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		SetEntityInterestLevel(self,0)
		SetMeshIsBackwards(self, 1)
		SetEntityAlpha(self, 0,0)
        
		self.MissSound = LoadSound('WaterCurse')
        self.WaterGrabSound = LoadSound('WaterGrab')
        self.WaterPullSound = LoadSound('WaterPull')
        self.ScarySound = LoadSound('Scary')
	
	end

	function Ob:onEndLevel()
		Global.player:setPhysicsConstants() 		
		%Ob.Parent.onEndLevel(self)
	end
	
	function Ob:stateCheckRazY()
		if Global.cutsceneScript.cutscenePlaying == 1 then
			return
		end
		if self.turningOff == 1 then
			self.turnedOff = 1
			self.turnedOn=nil
			self.turningOff = nil
			--SetEntityAlpha(self, 0, .5)
			if self.rotating then
				DetachEntityFromParent(self)
				SetEntityAlpha(self, 0,0)
			end
			self:setState(nil)
			return
		end
		local x, y, z = Global.player:getPosition()
		if (self.inCanoe == 0) then
			if Global.cutsceneScript.cutscenePlaying ~= 1 then
				if (y < self.yToCheck) then
					Global.player:extinguish()
					if (self.curseCountTarget == -1) or (self.curseCount < self.curseCountTarget) then
						self.curseCount = self.curseCount + 1
						self:setState('ArmMiss')
						self:killTimer(self.CURSETIMER)
						self:createTimer(self.CURSETIME, self.CURSETIMER)
					else
						self:setState('ArmGrab')			
					end
				end
			end
		end
	end
	
	function Ob:beginStateArmMiss()
		Global.player:interruptPowers(1)
		SetPhysicsState(Global.player, PHYSICSSTATE_NOPSIFLOAT, 1)
		self:createTimer(self.NOPSIFLOATTIME, self.NOPSIFLOATTIMER)
	end
	
	function Ob:stateArmMiss()		
		if (self.curseCount == 1) then
			PlaySound(nil, self.ScarySound)		
		end		
		local x, y, z = Global.player:getPosition()
--		Global.player:setPosition(x, 270, z)
		Global.player:setPosition(x, self.yToCheck+50, z)
		Global.player:setVelocity(0, 0, 0)
		if self.rotating then
			DetachEntityFromParent(self)
		end	
		self:setPosition(x, self.yToCheck+self.yOff, z)
		if self.rotating then
			local dh = FindScriptObject('DeadlyHazards')
			AttachEntityToEntity(self,dh,1)
		end
		Yield()
		if (Global.levelScript.waterFXManager) then
			Global.levelScript.waterFXManager:FXoff()
		end
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsConstant (Global.player, PHYSICS_AIRENGLISH, self.adjustedAirEnglishAcceleration)
		SetPhysicsConstant (Global.player, PHYSICS_MAXENGLISHSPEED, self.adjustedAirEnglishMaxSpeed )
		ForceRazJump('Anims/DartNew/Hop_water.jan')
		self:setAnim(self.animsTable.miss)
		self:sleep(0.2)
		SetEntityAlpha(self, 0.7, 0.4)
		if (self.curseCount ~= 1) then
			PlaySound(nil, self.MissSound)
		end
		self:sleep(0.4)
		SetEntityAlpha(self, 0,0.3)
		self:sleep(0.4)
		self:setState('CheckRazY')
	end
	
	function Ob:endStateArmMiss()
		Global.player:setPhysicsConstants()
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
	end


	function Ob:stateArmGrab()
		--edit call Deathlink
		local deathlink = fso('Deathlink', 'Deathlink')
		deathlink:triggerDeathlink()
		
		SetEntityAlpha(self, .7,0.7)
		Global.player:setPhysicsConstants() -- just to be sure
		self:dontRunPlayerControls(1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		local x, y, z = Global.player:getPosition()
		local ox, oy, oz = Global.player:getOrientation()
		Global.player:setPosition(x, self.yToCheck+self.yOff+10, z)
		Global.player:setVelocity(0, 0, 0)
--		Global.player:setOrientation(0, 1, 0)
		self:setOrientation(ox, oy, oz)
--		self:setOrientation(0, 1, 0)
		RotateEntityY(self, 180, 0)

		local fwdx, fwdy, fwdz = GetEntityForwardVector(Global.player)
		
		self:setPosition(x + (fwdx * self.xOff), self.yToCheck + self.yOff, z + (fwdz * self.zOff))
--		LoadAnim(Global.player, 'Anims/DartNew/Hop_water.jan', 0.3, 0)
		ForceRazJump('Anims/DartNew/Grabbed.jan')
--		ForceRazJump()
		Yield()
		self:setAnim(self.animsTable.grab)
		
		self:sleep(.3)
--		LoadAnim(Global.player, 'Anims/DartNew/Grabbed.jan', 0.5, 0)
		self:sleep(.4)
		PlaySound(nil, self.WaterGrabSound)
		self:sleep(.8)
		PlaySound(nil, self.WaterPullSound)
		self:sleep(0.2)
		SetEntityAlpha(self, 0,0.2)
		SetEntityAlpha(Global.player, 0,0.2)
		self:sleep(0.6)
		self:setState('DropAtBeach')
	end
	
	function Ob:endStateArmGrab()
		Global.player:setPhysicsConstants()
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		self:dontRunPlayerControls(0)
	end

	function Ob:stateDropAtBeach()

		SetEntityAlpha(Global.player, 1,0)
		if (self.useRespawn == 0) then
			Global.cutsceneScript:runCutscene('CABHCrawlOutOfWater',1,1)
		else
			-- no canoe protection-- but I think this is never hit.
			local x, y, z
			local respawnLSO = nil
			local playerRespawnLSOName = Global:getPlayerRespawnPointName()
			if playerRespawnLSOName then
				respawnLSO = FindScriptObject(playerRespawnLSOName)
			end
			if not respawnLSO then
				GamePrint('ERROR: Dart tried to respawn, but object ' .. playerRespawnLSOName .. ' could not be found.')
			else
				x, y, z = respawnLSO:getPosition()
				Global.player:setPosition(x, y, z)
			end
		end
		
		-- make sure the canoe is where raz is
		local canoe = FindScriptObject('Canoe')
		if( nil ~= canoe ) then
			canoe:setupParkedPosition(1)
			canoe:setCanoePosition()
		end
		
		self:setState('CheckRazY')
		self.curseCount = 0
	end
	
	function Ob:turnOn()
		self.turnedOff=nil
		self.turnedOn=1
		self:setState('CheckRazY')
	end
	
	function Ob:turnOff()
		if not self.turnedOff then
			self.turnedOn=nil
			self.turningOff = 1
		end	
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
		
	return Ob
end

