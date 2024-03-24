--		TKBrainTank.lua
--
--		Based off of 'BossMainTEMPLATE'
--
--		(c) 2004 Double Fine Productions, Inc.
--		All Rights Reserved.
--		Proprietary and Confidential and BRAIN TANKE MOMOMOMO
--		

function TKBrainTank(Ob)
	if not Ob then
		Ob = CreateObject('Global.Enemies.BossMain')
	
		--fill in the mesh of the boss
		Ob.meshName = 'Characters/BraintankNoTreads.plb'

		Ob.healthBarX = 310
		Ob.healthBarY = 25
		
		Ob.healthBarBorderX = 150
		Ob.healthBarBorderY = 0
		Ob.healthBorderTexture = 'Textures/LevelTextures/NI_Nightmares/NI_Healthbar_BrainTankSheild.tga'
		
		Ob.animsDir = 'Braintanks'				
		--fill in the table of his animations, for ActionActor functionality
		Ob.animsTable = {   Idle = { fileName = 'Idle', preload = 1, blendTime = 0, loop = 1},
							Fire = { fileName = 'Psi_Firing', preload = 1, loop = 1},
							BrainSwirl = { fileName = 'BrainSwirl', preload = 1, loop = 0}
		}
	
		--optionally fill in its initial state (somehow, at some point, it must be set to the 'Decide' state. probably needs to be done by LevelScript, after an intro cutscene or seomthing)
		Ob.initialState = 'Decide'
		Ob.ImmuneToPsiBlast = kPSIBLASTIMMUNE_REFLECT	-- we want the tank to reflect psi blasts during phase 1 of battle
	
		Ob.maxViewDistance = 0	-- set to zero until raz gets sight of him
		Ob.height = 300
		Ob.lookOffsetHeight = 300
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		
		Ob.targettable = 0
		Ob.collSphereRadius = 600
		Ob.height = 200
		Ob.hp = 1
		
		Ob.hits = 0
		
		Ob.RAZBLASTEDTIMER = '2061'
		Ob.RAZBLASTWARNINGTIMER = '2062'
		Ob.SLOP1FXTIMER = '2063'
		Ob.SLOP2FXTIMER = '2064'
		Ob.SLOP3FXTIMER = '2065'
		Ob.SHOWHEALTHTIMER = '2066'
		
		Ob.centerX = -100
		Ob.centerY = 300
		Ob.centerZ = -2200

		Ob.refillMode = 0
		Ob.bShowHealthBarDuringCutscenes = 1		
		
		Ob.bAlreadyHit = 0
	end
-- ***********************************************************************************************
	function Ob:onSpawn()
		--fill in the enumeration of all modes this boss can be in, add your own.  
		--name is the name of the mode, it is also used to reference the mode, ie (self['mode' .. self.modes[MODECHASE][name]])
		--scriptName is the fully qualified name of the script, used by SpawnScript
		--order is the order in which the modes' decision function will be called, when determining what to do next.  lower numbers 
		--mean that mode's decision function will be called first.
		self.modes = 
		{ 	
			MODEFILLWALL = 		{ name = 'FILLWALL', 		scriptName = 'AS.Characters.TKBrainTankFillWall', order = 1 }, 
			MODECHILL = 		{ name = 'CHILL', 		scriptName = 'AS.Characters.TKBrainTankChill', order = 2 }, 
		}	
		%Ob.Parent.onSpawn(self)
	end
   
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetTKClawSnapType('TKClaw','TKClaw')
		SetMeshIsBackwards(self,1)
		self.dome = SpawnScript('Global.Props.Geometry', 'dome', 'self.meshName = \'Characters/CharacterProps/BraintankDome_2.plb\'')
		self.leftTread = SpawnScript('Global.Props.Geometry', 'leftTread', 'self.meshName = \'Characters/CharacterProps/Braintank_TreadsLf.plb\'')
		self.rightTread = SpawnScript('Global.Props.Geometry', 'rightTread', 'self.meshName = \'Characters/CharacterProps/Braintank_TreadsRt.plb\'')
		
--		AttachEntityToEntity(self.dome, self)
--		AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
		AttachEntityToEntityBone(self.leftTread, self, 'treadLfFrontJ_1',1)
		AttachEntityToEntityBone(self.rightTread, self, 'treadRtFrontJ_1',1)
--		self.dome:setPosition(0,380,210)
        
		self.snapHelper = SpawnScript('Global.OtherEntities.SnapTargetHelper')
		AttachEntityToEntityBone(self.snapHelper, self, 'brainAllJ_1',1)
		self.snapHelper:setSnapRange(0)
		self.snapHelper:setOwner(self,1)
																			
		self:setEntityInterestLevel(kBOSS_INTEREST)
		
		self:setHealthBar(1)
	
--		SetEntityCollideSphere(self, self.collSphereRadius, 0,300,0)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		self:setAnim(self.animsTable.Idle)
		
		SetChaseCameraRadius(1200)
		SetChaseCameraAltitude(0)
		SetCameraTargetHeight(400)
		
		self.debrisManager = SpawnScript('AS.Props.DebrisManager', 'DebrisManager')
		self.debrisManager.tank = self
		
		self:setPosition(self.centerX,self.centerY,self.centerZ)
		
		self.psiBlast = SpawnScript('PsiBlast', self.Name .. 'PsiBlast')
		
		self:setScale(2.5)
--		self:setPosition(0,250,0)
		
	 	
		Global.player:addSpamListener('RazRespawn', self)
		Global.player:addSpamListener('RespawnDeathDone', self)
		
		self.clawPool = Global.levelScript:getPool('AS.Characters.TKBrainTankClaw')
		self.clawPool:setLowerLimit(30)
		
		self.fancyCam = SpawnScript('AS.Props.FancyCamera')
		self.brainRaz = SpawnScript('AS.Characters.BrainRaz')

		self.brainPropForCutscene = SpawnScript('ScriptBase', 'brainProp')
		self.brainPropForCutscene:loadMesh('GlobalModels/Objects/HeldObjects/brainPup.plb' )

		self.intoBrainFX1 = SpawnScript('Global.Effects.IntoTheBrainTankFX')
		self.intoBrainFX2 = SpawnScript('Global.Effects.IntoTheBrainTankFX')
				
		self.smashGlassFX = SpawnScript('AS.Effects.BrainTankTopPopFX')
		self.smashGlass2FX = SpawnScript('AS.Effects.BrainTankTopPop2FX')
		self.smashGlass3FX = SpawnScript('AS.Effects.BrainTankTopPop3FX')
		
		self.brainJuiceSlopFXName = 'AS.Effects.BrainJuiceSlopFX'
		Global.levelScript:getPool(self.brainJuiceSlopFXName):setLowerLimit(5)

		self.chargeUpFX = SpawnScript('AS.Effects.ASRU_BlastChargeFX')
		
		self.knockBackSphere = TriggerSphere_New(self.centerX,self.centerY,self.centerZ, 850)
		Trigger_RegisterListener(self.knockBackSphere, self)

		self.razIntoTankSphere = TriggerSphere_New(self.centerX,self.centerY,self.centerZ, 1250)
		
		self.TKHitGlass = self:loadSound('GIOCollision_Glass')
		self.juiceSlop = self:loadSound('BrainJuice')
		self.youWinSound = LoadSound('YouWin')
		
		if ((Global:loadGlobal('RazIsABrainNow') ~= 1) and (Global:loadGlobal('RazIsAlmostABrainNow') ~= 1)) then
			Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_AUTO_ROTATE, 1)		
			self:decide()
		end
		
		-- preload the other dome models that we swap in later
		self.dome:loadMesh('Characters/CharacterProps/BraintankDome_5.plb')
		self.dome:loadMesh('Characters/CharacterProps/BraintankDome_4.plb')
		self.dome:loadMesh('Characters/CharacterProps/BraintankDome_3.plb')
		self.dome:loadMesh('Characters/CharacterProps/BraintankDome_2.plb')
		
		AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
		self.dome:setScale(2.5)	
		self.dome:setPosition(0,0,0)
		self.dome:setOrientation(0,0,0)
		local blockingDoor = FindScriptObject('doorblock',1)
		if blockingDoor ~= nil then
			blockingDoor:setPosition(-100,400,2422)
			SetEntityVisible(blockingDoor,1)
		end
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
--		SetSkeletonScale(self, 2.5,2.5,2.5)	
	end
	
	function Ob:startBattle()
		self:resetBattle()
		self:setPhase()
	end

	function Ob:resetBattle()
		self.debrisManager:setState('UpdateFlyingDebris')	
		self.refillMode = 1
		self.hp = 1
		self:setHealthBar(self.hp)
		self.hits = 0
		self:decide()
	end
	
	function Ob:setScale(scale)
		%Ob.Parent.setScale(self,scale)	
		self.dome:setScale(scale)	
		self.leftTread:setScale(scale)	
		self.rightTread:setScale(scale)	
	end
	
	function Ob:setPosition(x,y,z)
		%Ob.Parent.setPosition(self,x,y,z)	
		self.debrisManager:setPosition(x,y,z)
	end
		
	function Ob:getShootOrigin()
		return self:getBoneWorldPosition('brainAllJ_1')
	end
			
	function Ob:goTargettable()
		if (self.targettable ~= 1) then
			self.targettable = 1
			Global.player.TK_Max_Distance = 2000
			self.maxViewDistance = 10000
			self.snapHelper:setSnapRange(2000)
		end
	end									   
	
	function Ob:goUntargettable()
		if (self.targettable ~= 0) then
			self.targettable = 0
			Global.player.TK_Max_Distance = 1500
			self:killTimer(self.RAZBLASTWARNINGTIMER)
			self:setScale(2.5)
			self.maxViewDistance = 0
			self.snapHelper:setSnapRange(500)
		end
	end
	
	
	function Ob:firePsiBlast()
		--give warning
		self.chargeUpFX:attach(self, 'brainAllJ_1',1)
		self.chargeUpFX:run()
		
		self:createTimer(200, self.RAZBLASTWARNINGTIMER)
		self.flashCount = 0
--		self:setScale(3)		
	end
	
	function Ob:firePsiBlastPOW()		
--		self:setScale(2.5)
		local rx,ry,rz = Global.player:getBoneWorldPosition('HeadJA_1')
		local tx,ty,tz = self:getBoneWorldPosition('brainAllJ_1')

		local bHit, nx,ny,nz, hitEnt
		bHit, rx,ry,rz, nx,ny,nz, hitEnt = CheckForCollision(tx,ty,tz, rx,ry,rz)
		
		local bCalculateBlastDeathTime = 1
		self.psiBlast:launchPsiBlast(tx,ty,tz, rx,ry,rz, bCalculateBlastDeathTime)
		
		self.debrisManager.timeWithLOSTotal = 0
		
		if (Global.player.rPsiShield:IsActive() ~= 1 and hitEnt == Global.player) then
			self:damageRaz()
			self:sendMessage(Global.player, 'DamageDart', 4)			
		end
		self.chargeUpFX:stop()
	end
	
	function Ob:damageRaz()
		local sx, sy, sz = self:getPosition()
		local px, py, pz = Global.player:getPosition()
		local dx = px - sx
		local dy = py - sy
		local dz = pz - sz
		local oX, oY, oZ = GetEntityForwardVector(Global.player)
		local angle = GetAngleBetween(dx, dy, dz, -oX, oY, -oZ)
		RumbleLeft(0.3, .5, 0)
		RumbleRight(0.3, .5, 0)
		
--		GamePrint(self.currentMode)
--		self.currentMode = 'Combo'
		if (abs(angle) < 90) then
			Global.player:doNothing()
			self:dontRunPlayerControls (1)			
			LoadAnim(Global.player, 'Anims/DartNew/KnockbackFrontal.jan', 0.1, 0)
			self:createTimer(1000, self.RAZBLASTEDTIMER)
		else
			Global.player:doNothing()
			self:dontRunPlayerControls (1)
			LoadAnim(Global.player, 'Anims/DartNew/Knockforward.jan', 0.1, 0)				
			self:createTimer(1000, self.RAZBLASTEDTIMER)
		end
		self.bCanDamageRaz = 0
		
	end
																		 
	function Ob:stateFaceRaz()
		local angle = self:angleBetween(Global.player)
		local x,y,z = Global.player:getPosition()
		RotateTowards2D(self, x,y,z, 15)		
		if (angle < -1) then
			SetEntityTexCoordVel(self.leftTread, 0, -.3)
			SetEntityTexCoordVel(self.rightTread, 0, .3)
		elseif (angle > 1) then
			SetEntityTexCoordVel(self.leftTread, 0, .3)
			SetEntityTexCoordVel(self.rightTread, 0, -.3)
		else
			SetEntityTexCoordVel(self.leftTread, 0, 0)
			SetEntityTexCoordVel(self.rightTread, 0, 0)			
--			SetEntityTexCoordVel(self.leftTread, 0, 0.0001)
--			SetEntityTexCoordVel(self.rightTread, 0, 0.0001)			
		end
	end
    

	function Ob:propRock()	
--		self.
	end
	
	function Ob:reloadTankIsDeadStuff()
		local x,y,z = self:getBoneWorldPosition('brainAllJ_1')
		Global.levelScript:getPool(self.brainJuiceSlopFXName):get():runThenPool(x-50,y+230,z+50)
		Global.levelScript:getPool(self.brainJuiceSlopFXName):get():runThenPool(x+50,y+230,z-50)
		
		self:createTimer(200, self.SLOP1FXTIMER)
		self:createTimer(800, self.SLOP2FXTIMER)
		self:createTimer(1200, self.SLOP3FXTIMER)
		self.hits = 3
		LoadMesh(self.dome, 'Characters/CharacterProps/BraintankDome_5.plb')
		self.dome:setScale(2.5)
		AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
		self.dome:setPosition(0,0,0)
		self.dome:setOrientation(0,0,0)
		for i = 1, self.debrisManager.numTKDebrisGround do
			if (self.debrisManager.groundTKDebrisTable[i].debris ~= 0) then
				SetEntityAlpha(self.debrisManager.groundTKDebrisTable[i].debris,0,1)
				SetEntityVisible(self.debrisManager.groundTKDebrisTable[i].debris,0)
			end
			if (self.debrisManager.TKRubblePiles[i] ~= nil) then
				SetEntityAlpha(self.debrisManager.TKRubblePiles[i],0,1)
				SetEntityVisible(self.debrisManager.TKRubblePiles[i],0)
			end
		end			
		self:setHealthBar(0)
		self:hideHealthBar()		
		self:setOrientation(0,140,0)
		self.fancyCam:setState(nil)
		Global.camControl:setSecondaryTarget(nil, kSECONDARYFLAG_AUTO_ROTATE, 0)		
	end
	
	function Ob:setUpRazIntoTank()
		Global.levelScript:stopLevelTheme()
		self:killTimer(self.RAZBLASTWARNINGTIMER)
		self.chargeUpFX:stop()
		self.debrisManager:setState('DropDebris')
		Global.player:setPosition(1293.37, 20, -4371)			
		Global.player:setOrientation(0, -36, 0)			
		MoveCameraToIdeal()
		Trigger_RegisterListener(self.razIntoTankSphere, self)
--		SetPhysicsFlag(fso('wallcollision'), PHYSICS_COLLIDEE, 0)		
	end

	function Ob:stateRazKilledTankButIsNotYetABrainStuff()
		self:reloadTankIsDeadStuff()
		self:setUpRazIntoTank()
		Yield()
		SetChaseCameraRadius(800)
		SetChaseCameraAltitude(0)
		SetCameraTargetHeight(200)
		self:setState(nil)
	end
	
	function Ob:stateRazIsABrainNowStuff()
		Yield()
		self:reloadTankIsDeadStuff()
		self:setState('BrainRaz')
	end
	
	function Ob:smashGlassForCutscene()	
		local x,y,z = self:getBoneWorldPosition('brainAllJ_1')
		self:playSound(self.TKHitGlass)
		self:playSound(self.juiceSlop)
		self.hp = self.hp - .334
		self:setHealthBar(self.hp)
		if (self.hits == 1) then
--			self.brainJuiceSlopFX
			LoadMesh(self.dome, 'Characters/CharacterProps/BraintankDome_3.plb')
			self.dome:setScale(2.5)
			AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
			self.dome:setPosition(0,0,0)
			self.dome:setOrientation(0,0,0)
			self.smashGlassFX:setPosition(x,y+200,z)
			self.smashGlassFX:run()
			Global.levelScript:getPool(self.brainJuiceSlopFXName):get():runThenPool(x-50,y+230,z+50)
			Global.levelScript:getPool(self.brainJuiceSlopFXName):get():runThenPool(x+50,y+230,z-50)
			
			self:createTimer(200, self.SLOP1FXTIMER)
			self:createTimer(800, self.SLOP2FXTIMER)
			self:createTimer(1200, self.SLOP3FXTIMER)
			
--			self:setState(nil)	
		elseif (self.hits == 2) then
			LoadMesh(self.dome, 'Characters/CharacterProps/BraintankDome_4.plb')
			self.dome:setScale(2.5)
			AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
			self.dome:setPosition(0,0,0)
			self.dome:setOrientation(0,0,0)
			self.smashGlass2FX:setPosition(x,y+200,z)
			self.smashGlass2FX:run()
--			self:setState(nil)
		elseif (self.hits == 3) then
			LoadMesh(self.dome, 'Characters/CharacterProps/BraintankDome_5.plb')
			self.dome:setScale(2.5)
			AttachEntityToEntityBone(self.dome, self, 'liquidsurfaceAllJA_1',1)
			self.dome:setPosition(0,0,0)
			self.dome:setOrientation(0,0,0)
			self.smashGlass3FX:setPosition(x,y+200,z)
			self.smashGlass3FX:run()
			self:playSound(self.youWinSound)
		end
	end
	
	function Ob:startRefillForCutscene()
		self:hideHealthBar()
		if (self.hits == 3) then
			self.refillMode = 0
		else
			self.refillMode = 1
		end		
	end

	function Ob:stateRazIntoTank()
		self:playVideo('Cutscenes/prerendered/ASSP.xmv')
		self:setState('BrainRaz')
	end
	
	function Ob:statePostCutscene()
		self.bAlreadyHit = 0
		if (self.hits == 3) then
			Global:saveGlobal('RazIsAlmostABrainNow', 1)
			Global.camControl:setSecondaryTarget(nil, kSECONDARYFLAG_AUTO_ROTATE, 0)		
			self.fancyCam:setState(nil)
			self:hideHealthBar()		
			self:setUpRazIntoTank()
			self:setState(nil)
		else
			self:decide()
			self:createTimer(100, self.SHOWHEALTHTIMER)
		end										  
	end
	
     				
	function Ob:stateBrainRaz()										   
		self.brainRaz:setPosition(1293.37, 20, -4371)			
		self.fancyCam:setState(nil)
		self:killTimer(self.RAZBLASTWARNINGTIMER)
		self:goTargettable()
		self.snapHelper:setSnapRange(2000)
		Yield()
		Global:saveGlobal('RazIsAlmostABrainNow', 0)
		self.brainRaz:takeOverRaz()
		self:setState(nil)
	end					  
	
	function Ob:playITMFX() -- called by ASRUBothBrainsInTank cutscene
		self.intoBrainFX1:attach(self.brainPropForCutscene,nil,1)
		self.intoBrainFX1:run()
		self.intoBrainFX2:attach(self, 'BrainALLJ_1',1)
		self.intoBrainFX2:run()
	end																						  
	
	function Ob:stateWin()
		self.brainRaz:releaseRaz()		 
		AttachEntityToEntityBone(self.brainPropForCutscene, self, 'extraBrainJ_1',0)
		
		--edit write Victory if settings require it
		Global:saveGlobal('bOleanderDefeated', 1)
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.beatoleander == TRUE and seedsettings.requireMC == FALSE then
			if seedsettings.brainhunt == FALSE or (Global:loadGlobal('totalBrainsRedeemed') >= seedsettings.brainsrequired) then
				--write to text file for client to read
				local h = fopen("victory.txt", "w")
				fwrite(h, "victory\n")
				fclose(h)
			end
		end

--		self.brainPropForCutscene:setScale(5)
		SetScale(self.brainPropForCutscene,2.5,2.5,2.5)
		Global.cutsceneScript:runCutscene('ASRUBothBrainsInTank',1,0,0)
		Global:saveGlobal('RazIsABrainNow', 0)
		-- unlock achievement
		UnlockAchievement('ACH_COMP_AS')
		--edit send back to the CU instead, to avoid logic breaks		
		Global.levelScript:returnToCU()
		self:setState(nil)
	end					  

--	function Ob:setState(newState)
--		if self.state_name == 'FaceRaz' and newState ~= 'FaceRaz' then
--			GamePrint('ERROR: Moving from FaceRaz, to '..(newState or 'nil'))
--			StackTrace()
--		end
--		%Ob.Parent.setState(self, newState)
--	end

	function Ob:tankHit()
		if self.bAlreadyHit ~= 1 then
			self.bAlreadyHit = 1
			self.debrisManager:killTimer(self.debrisManager.TOSSTIMER)
			self.debrisManager:killTimer(self.debrisManager.CHECKFORHOLETIMER)
			self.hits = self.hits + 1
			self.debrisManager.timeWithLOSTotal = 0
			Global.goalManager:activate('DestroyBrain')
			if self.hits == 3 then
				Global.levelScript:stopLevelTheme()
				Global.cutsceneScript:runCutscene('ASRUGlassBreakLastTime',0,0,0)
			else
				Global.cutsceneScript:runCutscene('ASRUGlassBreak',0,0,0)
			end
		else
			self:smashGlassForCutscene()
		end
	end
	  				
	function Ob:onTKCollide()	  
		if Global.player.bBrainMode == 1 then
			self:setState('Win')			
		else
			self:tankHit() 
		end
	end


	function Ob:onTimer(timerID)
--		GamePrint("TIMER >>>>> " .. data)
		if (timerID == self.SHOWHEALTHTIMER) then
			self:killTimer(self.SHOWHEALTHTIMER)
			self:showHealthBar(self.hp)		
		elseif (timerID == self.RAZBLASTEDTIMER) then
			self:killTimer(self.RAZBLASTEDTIMER)
			if (Global.player.dartisdying ~= 1) then	
				self:dontRunPlayerControls (0)
			end
		elseif (timerID == self.RAZBLASTWARNINGTIMER) then
			self.debrisManager.timeWithLOSTotal = 0
--			self:damageFlash(.2)
			self:killTimer(self.RAZBLASTWARNINGTIMER)
			self.flashCount = self.flashCount + 1
--			GamePrint(self.flashCount)
			if ((self.hits == 0 and self.flashCount == 10) or 
				(self.hits == 1 and self.flashCount == 10)  or 
				(self.hits == 2 and self.flashCount == 10)) then
				self:firePsiBlastPOW()
				self.flashCount = 0
			else
				if (self:isThereLOS(0) == 1) then
					self:createTimer(200, self.RAZBLASTWARNINGTIMER)
				else
					self.chargeUpFX:stop()
					self.flashCount = 0
				end				
			end
		elseif (timerID == self.SLOP1FXTIMER or timerID == self.SLOP2FXTIMER or timerID == self.SLOP3FXTIMER) then
			self:killTimer(timerID)
			self:playSound(self.juiceSlop)
			local randNum = RandInt(-70, 70)
			local randNum2 = RandInt(-70, 70)
			local x,y,z = self:getBoneWorldPosition('brainAllJ_1')
			Global.levelScript:getPool(self.brainJuiceSlopFXName):get():runThenPool(x+randNum,y+230,z+randNum)
			if (self.hits == 1) then
				randNum = RandInt(1200,2000)
			elseif (self.hits == 2) then
				randNum = RandInt(1000,1600)
			elseif (self.hits == 3) then
				randNum = RandInt(800,1200)
			end		
			self:createTimer(randNum, timerID)
		end

	end

	function Ob:listenerRazRespawn()
--		GamePrint('WTF!!')
		if (Global:loadGlobal('RazIsABrainNow') == 1) then
			-- HACK - moved this down into a new listener - it was happening too early - Brad
			--self.brainRaz:setPosition(1293.37, 20, -4371)			
		elseif (Global:loadGlobal('RazIsAlmostABrainNow') == 1) then
			-- HACK - moved this down into a new listener - it was happening too early - Brad
			--Global.player:setPosition(1293.37, 20, -4371)			
		else
			self:resetBattle()			
			Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_AUTO_ROTATE, 1)		
		end
		
	end
	
	function Ob:listenerRespawnDeathDone()
		if (Global:loadGlobal('RazIsABrainNow') == 1) then
			self.brainRaz:setPosition(1293.37, 20, -4371)
		elseif (Global:loadGlobal('RazIsAlmostABrainNow') == 1) then
			Global.player:setPosition(1293.37, 20, -4371)
		end
	end


	function Ob:isThereLOS(mode)
		return self.debrisManager:isThereLOS(mode)
	end

	function Ob:setPhase()
		self.debrisManager:setPhase()
		local slime = FindScriptObject('Slime')
		if (slime ~= nil) then
			if (self.hits == 0) then
				slime.sufacesToCheck = 2
			elseif (self.hits == 1) then
				slime.sufacesToCheck = 2
			elseif (self.hits == 2) then
				slime.sufacesToCheck = 2
			end		
		end		
	end


	function Ob:onEnteredTriggerVolume(data, from)
		if (from and from == Global.player) then
			if (data == self.knockBackSphere and self.hits < 3) then
				local claw = self.clawPool:get()
				claw:smack()
			elseif (data == self.razIntoTankSphere) then
				self:setState('RazIntoTank')
			end

		end
	end

	return Ob
end
