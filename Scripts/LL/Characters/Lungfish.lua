
function Lungfish(Ob)
	function construct()
		local Ob = CreateObject('Global.Enemies.BossMain')
	
		Ob.meshName = 'Characters/Lungfish.plb'		
		Ob.charName = 'Lungfish'
		Ob.animsDir = 'Lungfish'
		Ob.dependencies = {
			textures = {
				'textures/fxtextures/lensflares/lensflare4.tga',
				'textures/particletextures/ni_meatvent.dds',
				'textures/ui/healthbar.dds',
				'Textures/LevelTextures/LL_LungfishLair/LL_Healthbar_Lungfish.dds',
				'textures/leveltextures/ll_lungfishlair/ll_lungfish_view.dds'
		  },
		} 
    
		Ob.animsTable = { 	Walk = { fileName='LungfishWalk', preload = 1, blendTime = 0.1, loop = 1 },
							Idle = { fileName='LungfishPoseA_Breathe', preload = 1, blendTime = 0.1, loop = 1 },						
							PushBubble = { fileName='PushBubble', preload = 1, blendTime = 0.2, loop = 1 },
							SuckAir = { fileName='SuckAir', preload = 1, blendTime = 0.3, loop = 1 },
							BlowAir = { fileName='BlowAir', preload = 1, blendTime = 0.3, loop = 1, speed=0.5 },
							Swim = { fileName='Swim', preload = 1, blendTime = 0.3, loop = 1 },
							InhaleRaz = { fileName='InhaleRaz', preload = 1, blendTime = 0.2, loop = 0, next = 'SuckAir' },
							ToPhase2 = { fileName='SwimDamage', preload = 1, blendTime = 0, loop = 0 },
							NailDamage = { fileName='DebrisDamage', preload = 1, blendTime = 0.1, loop = 0, next = 'SuckAir' },
							
							Dazed = { fileName='Lungfish_get_hypno', preload = 1, blendTime = 0.1, loop = 0, next = 'DazedCycle'},
							DazedCycle = { fileName='lungfish_hypno_cycle', preload = 1, blendTime = 0.1, loop = 0, next = 'ToLimp' },
							ToLimp = { fileName='Lungfish_hypno2limp', preload = 1, blendTime = 0.1, loop = 0, next = 'Limp'  },
							Limp = { fileName='Lungfish_limp_pose', preload = 1, blendTime = 0.1, loop = 1 },
							
							LureJabStart = { fileName='LureJab_start', preload = 1, blendTime = 0.1, loop = 0 },
							LureJabEnd = { fileName='LureJab_end', preload = 1, blendTime = 0.1, loop = 0 },
							
							LureSwingStart = { fileName='LureJabSwing_start', preload = 1, blendTime = 0.1, loop = 0},
							LureSwingLoop = { fileName='LureJabSwing_loop', preload = 1, blendTime = 0.1, loop = 0 },
							LureSwingEnd = { fileName='LureJabSwing_end', preload = 1, blendTime = 0.1, loop = 0 },
							
							ClawAttack = { fileName='lungfish_hthattack', preload = 1, blendTime = 0.1, loop = 0 },
	
							LureStuck = { fileName='LureStuck', preload = 1, blendTime = 0.1, loop = 1},
							LureStuckDamage = { fileName='LureStuckDamage', preload = 1, blendTime = 0.1, loop = 0, next = 'LureStuck'},
							LureRelease = { fileName='LureRelease', preload = 1, blendTime = 0.1, loop = 0},
							
							PushBubbleDown = { fileName='PushBubble_Down', preload = 1, blendTime = 0, loop = 0, next = 'PushBubble' },
							PushBubbleSide = { fileName='PushBubble_Start', preload = 1, blendTime = 0, loop = 0, next = 'PushBubble' },
							SuckAirStart = { fileName='SuckAir_start', preload = 1, blendTime = 0, loop = 0, next = 'SuckAir' },
							
							
							
		}
		
		--Basic braining variables		
		Ob.brainLevel = 'LOMA'
		Ob.brainingMovie = 'llil.bik'
	
		Ob.phase = -1   --1 is sucking/blowing, 2 is moving
		Ob.part = -1   --0 is before fight, 1 and 2 for the 2 sucking/blowing/moving cycles, 3 is final battle, 4 is after he is dazed but before LO completed
		
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Lungfish.tga'
		
		--Ob.flounders = 5
		Ob.debrisToPool = 6
		Ob.nailFXToPool = 3
		Ob.crayfishToPool = 4
		Ob.crayfishDropTime = 5
		Ob.suckerfishToPool = 3
		Ob.suckerfishDropTime = 8 
		
		Ob.BLOWDEBRISTIMER = '1'
		Ob.SUCKDEBRISTIMER = '2'
		Ob.SHRINKAGAINTIMER = '3'
		Ob.GROWAGAINTIMER = '4'
		Ob.CRAYFISHDROPTIMER = '5'
		Ob.SUCKERFISHDROPTIMER = '6'
		Ob.DECIDEAGAINTIMER = '7'
		
		Ob.pauseTime = 2
		Ob.bDazed = 0
		Ob.bInside = 0
		Ob.bPaused = 0
		Ob.bCycle = 1    --indicates when done shrinking or growing, that it should repeat the process
			
		Ob.blowTime = 14 --secs to shrink or grow		
		Ob.debrisRate = 1.6  --one debris every x seconds
		
		Ob.initialState = nil 
		
		--when the level is low enough to move to phase 2
		Ob.part1HealthThresh = 0.75  
		Ob.part2HealthThresh = 0.50  
		
		--for part 3
		Ob.iBreakOutDistance = 600
		Ob.iBreakOutAngle = 30																							   
		Ob.iChaseSpeedScale	= 1
		
		Ob.ImmuneToPsiBlast = kPSIBLASTIMMUNE_REFLECT	--lungfish is immune to psiblast unless stuck by a clam
		Ob.ImmuneToMelee = kMELEEIMMUNE_STANDARD
		return Ob
	end	
	if not Ob then
		Ob = construct()
	end
	construct = nil
	
-- ************************************************************************************************

	function Ob:onSpawn()
		--these modes aren't really modes
		self.modes = { 	
			--MODECLAWATTACK = { name = 'ClawAttack', scriptName = 'LL.Characters.LungfishModeClawAttack', order = 2},
			MODELUREJAB = { name = 'LureJab', scriptName = 'LL.Characters.LungfishModeLureJab', order = 1},
			MODECHASE = { name = 'Chase', scriptName = 'LL.Characters.LungfishModeChase', order = 2},
		}
		%Ob.Parent.onSpawn(self)
	end

	function Ob:setNotDazed()
		SetEntityVisible(self, 0)
		--dummy lure for lungfish pov
		self.povLure = SpawnScript('Global.Props.Geometry', 'POVLure', '', 1)
		self.povLure:loadMesh('Characters/CharacterProps/Lungfish_Lure.plb')   --so its cached
		self.povLure:setScale(0.75)
		self.povLure:loadAnim('Anims/Lungfish/lure/LureSway.jan', 0, 1)
		AttachEntityToEntity(self.povLure, self, 0)
		self.povLure:setPosition(0,700,400)
		SetEntityVisible(self.povLure, 0)
		SetEntityFlag(self.povLure, ENTITY_CAMERA_ALPHA, 1)	

		--set up physical geometry to block raz from going under camera
		self.triangle = SpawnScript('Mover', 'triangle')
		self.triangle:loadMesh('Levels/LL_LungfishLair/Props/LLLL_lungfishMovingCollision.plb')
		SetMeshIsBackwards(self.triangle, 1)
		AttachEntityToEntity(self.triangle, self, 0)
		self.triangle:setPosition(0,-700,0)
		SetPhysicsFlag(self.triangle, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.triangle, PHYSICS_COLLIDER, 0)

		--mouth whirlpool fx
		self.mouthBlowFX = SpawnScript('Global.Props.Geometry', 'LungfishMouthBlowFX', '', 1)
		self.mouthBlowFX:loadMesh('Levels/LL_LungfishLair/Props/FX_BlowingWind.plb')   --so its cached
		AttachEntityToEntity(self.mouthBlowFX, self)
		self.mouthBlowFX:setPosition(0,300,150)
		SetEntityVisible(self.mouthBlowFX, 0)

		self.mouthSuckFX = SpawnScript('Global.Props.Geometry', 'LungfishMouthSuckFX', '', 1)
		self.mouthSuckFX:loadMesh('Levels/LL_LungfishLair/Props/FX_SuckingWind.plb')
		AttachEntityToEntity(self.mouthSuckFX, self)
		self.mouthSuckFX:setPosition(0,300,150)
		SetEntityVisible(self.mouthSuckFX, 0)

		--strafe		
		self.strafe = SpawnScript('LL.Characters.LungfishStrafe', 'LungfishStrafe', '', 1)
		self.strafe.bossMain = self

		--debris
		self.debrisPool = Global.levelScript:getPool('LL.Characters.LungfishDebris')
		self.debrisPool:setLowerLimit(self.debrisToPool)
		--tableemitters for nail fx
		self.nailProjectilePool = Global.levelScript:getPool('LL.Effects.NailBoxProjectileFX')
		self.nailExplosionPool = Global.levelScript:getPool('LL.Effects.NailBoxExplosionFX')
		self.nailProjectilePool:setLowerLimit(self.nailFXToPool)
		self.nailExplosionPool:setLowerLimit(self.nailFXToPool)

		--mace
		self.mace = SpawnScript('Global.Props.Geometry', 'LungfishMace', 'self.meshName = "Characters/CharacterProps/Lungfish_Mace.plb"', 1)
		AttachEntityToEntityBone(self.mace, self, 'luretreatJEnd_1')
		self.mace:setPosition(0,50,0)
		SetEntityVisible(self.mace, 0)	

		self.glow = CreateParticleEmitter('glowPE',150)
		PESetTexture(self.glow,'textures/fxtextures/lensflares/lensflare4.tga')
		PESetParticleBlendMode(self.glow,kBLENDMODE_ADD_ALPHA)
		PESetParticleForce(self.glow,0.000000,0.000000,0.000000)
		PESetPointSprite(self.glow,1)
		PESetNoSpread(self.glow,0)
		PESetConeAngle(self.glow,90.000000,90.000000)
		PESetParticleSpeed(self.glow,0.000000,0.000000)
		PESetParticleStartEndSize(self.glow,150.000000,250.000000)
		PESetParticleRotation(self.glow,0,0,0)
		PESetParticleLifetime(self.glow,0.100000,0.150000)
		PESetParticlesPerSec(self.glow,1000.000000,1100.000000)
		PESetStartColor(self.glow,70,13,13,40)
		PESetEndColor(self.glow,21,0,0,0)
		AttachEntityToEntityBone(self.glow, self, 'luretreatJEnd_1', 0)
		SetPosition(self.glow,0,-30,0)
		PESetActive(self.glow,0)

		--warning bubbles when raz is close to being sucked in
		self.warningBubbles = CreateParticleEmitter('WarningBubbles',120)
		PESetDistribution(self.warningBubbles, kPD_MESH, kPDV_DEFAULT, Global.player, 0, 0)
		PESetTexture(self.warningBubbles,'textures/particletextures/ni_meatvent.dds')
		PESetTexAnimInfo(self.warningBubbles, 4,-1,0,0)
		PESetParticleBlendMode(self.warningBubbles, kBLENDMODE_ALPHA_BLEND)
		PESetParticleSpeed(self.warningBubbles, 10,75)
		PESetParticleSize(self.warningBubbles, 12,15)
		PESetParticleRotation(self.warningBubbles, 0,0,0)
		PESetParticleLifetime(self.warningBubbles, 0.250,0.750)
		PESetParticlesPerSec(self.warningBubbles, 180,200)
		PESetStartColor(self.warningBubbles, 255,255,255,255)
		PESetEndColor(self.warningBubbles, 255,255,255,255)
		AttachEntityToEntity(self.warningBubbles, Global.player, 0)
		PESetActive(self.warningBubbles, 0)

		-- Warning Bubble Affector
		-- Adjust the radius to align with the radius of the warning zone trigger volume (plus some fudge, for visual flourish)
		self.warningAffector = CreateCylindricalParticleAffector('WarningAffector', 300, self.bubble.suckInRazWarningRadius+600, 3, 0, 0)
		PASetFlag(self.warningAffector, kPARTICLEAFFECTOR_FALLOFF, 1)
		SetPrimaryAffector(self.warningBubbles, self.warningAffector)
		AttachEntityToEntity(self.warningAffector, self, 0)

		self.suckSound = LoadSound('LungfishSucking')		
		self.blowSound = LoadSound('LungfishBlowing')		
		self.swimSound = LoadSound('LungfishSwimming')		
		self.dazedSound = LoadSound('LungfishDazed')		
		self.roarSound = LoadSound('LungfishBigRoar')
		self.breatheSound = LoadSound('LungfishBreathing')	--this is currently not used?!?!?!
		self.spitRazSound = LoadSound('LungfishSpitRaz')
		self.suckRazWarnSound = LoadSound('LungfishSuckRazWarning')
		self.razInsideSound = LoadSound('RazInsideLungfish')
	end
		
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetEntityCollideSphere(self, 400, 0, 400, 0) 
		
		SetEntityLookOffsetPos(self,0,700,100)
 		SetMaxViewDistance(self, 10000)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetCollideLayer(self, LAYER_LL_LUNGFISH, 1)		
		IgnoreCollideLayer(self, LAYER_LL_CLAM, 1)		
		IgnoreCollideLayer(self, LAYER_LL_STUFF, 1)		
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		SetMeshIsBackwards(self, 1)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 0)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
		SetEntityFlag(self, ENTITY_CAMERA_ALPHA, 0)
		
		--Global.player:moveToPosition(FindScriptObject('RAZSTART'):getPosition())
		self.currDamage = 0
		
		--bubble		
		self.bubble = SpawnScript('LL.Characters.LungfishBubble', 'LungfishBubble', '', 1)
		self.bubble.bossMain = self

		if (Global:load('LungfishDazed') ~= 1) then
			self:setNotDazed()
		end

		--water arms
		self.waterArms = SpawnScript('LL.Characters.LungfishWaterArms', 'LungfishWaterArms', '', 1)
		self.waterArms.bossMain = self
		
		--warning arms
		self.warningArms = SpawnScript('LL.Characters.LungfishWarningArms', 'LungfishWarningArms', '', 1)
		
		--crayfish
		self.crayfishPool = Global.levelScript:getPool('LL.Props.Crayfish')
		self.crayfishPool:setLowerLimit(self.crayfishToPool)
		self:createTimerSecs(self.crayfishDropTime, self.CRAYFISHDROPTIMER)
		
		--suckerfish
		self.suckerfishPool = Global.levelScript:getPool('LL.Props.Suckerfish')
		self.suckerfishPool:setLowerLimit(self.suckerfishToPool)
		self:createTimerSecs(self.suckerfishDropTime, self.SUCKERFISHDROPTIMER)

--[[
		--flounders
		for i = 1, self.flounders do 
			local flounder = SpawnScript('LL.Props.Flounders', 'Flounder'..i, '', 1)
			--flounder:setState('Float')
		end	
]]--
		if (Global:load('LungfishDazed') == 1) then
			Global:setPlayerRespawnPointName('RazStartLungfishDazed', 'LLLL')
		end
		Global.player:addSpamListener('Invisibility', self)
		
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.clairVoyHandler = self.onClairvoyance	 
		
		local loc
		if (Global:load('LungfishDazed') == 1) then
			loc = FindScriptObject('LungfishDazedStart')
			self:setPosition(loc:getPosition())
			self:setOrientation(loc:getOrientation())
			
			loc = FindScriptObject('RazStartLungfishDazed')
			Global.player:setPosition(loc:getPosition())
			Global.player:setOrientation(loc:getOrientation())
			self:setEntityInterestLevel(kBOSS_INTEREST)
			SetEntityVisible(self, 1)
			self:setAnim(self.animsTable.Limp)
		else
			loc = FindScriptObject('RAZSTART')
			Global.player:setPosition(loc:getPosition())
			Global.player:setOrientation(loc:getOrientation())
			self:setEntityInterestLevel(0)
			self:setPhase(0,1, 1)
		end
	end

-- ************************************************************************************************
	
	--if bNatural == nil, then setPhase was called out of order (for debugging)
	function Ob:setPhase(part, phase, bNatural)
		--GamePrint("LUNGFISH SETPHASE")
		if (not (part == self.part and phase == self.phase)) then
			self.part = part
			self.phase = phase
			self.bubble:setPhase(part,phase, bNatural)
			self.strafe:setPhase(part,phase, bNatural)
            if (phase == 1) then
				if (part ~= 3) then self.bCycle = 1 end
				self:setEntityInterestLevel(kBOSS_INTEREST)
				self:setLungfishPOV(0)
				if (part > 0) then SetEntityVisible(self, 1) end				
				self.onClairvoyance = self.clairVoyHandler				
			end			
			if (phase == 2) then			
				self.bCycle = 0
				self.onClairvoyance = 0
				self:setEntityInterestLevel(kOBJECTMINOR_INTEREST)
				self:onStartMoving()
				if (not bNatural) then
					self:setLungfishPOV(1)					
				end
			end
			if (part == 3) then
				self.onClairvoyance = self.clairVoyHandler
				SetEntityVisible(self.mace, 1)
				PESetActive(self.glow,1)
				
				self:stopSound(self.swimSound)
				self:playSound(self.breatheSound)
				Global.levelScript:setMusicMood(Global.levelScript.MUSIC_MOOD_COMBAT)
				
				Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_AUTO_ROTATE, 1)
				SetChaseCameraAutoRotateRange(20, 15)

				if ( not bNatural) then
					Global.player:setPosition(-3783.9, 2173, -4661.3)
					Global.player:setOrientation(0, -114.1, 0)
					self.bCycle = 0
				end
			end 
		end
	end

-- ************************************************************************************************

	function Ob:setLungfishPOV(bOn)
		if (bOn == 1) then
			self.camMask = AddSpriteHandle('textures/leveltextures/ll_lungfishlair/ll_lungfish_view.dds', 60,-10, 0.5, 1.4,0.95)
			--self.camMask = AddSpriteHandle('textures/leveltextures/ll_lungfishlair/ll_lungfish_view.dds', 190, 110,  0.5, 2.4,1.8)
			SpriteFadeOnHUD(self.camMask,0)
			
			AttachCameraToEntity(self, 0,400,300, -35,180,0)
			SetCameraFieldOfView(160)
			SetCameraRotateToTarget(1)
			SetEntityVisible(self.povLure, 1)
			SetEntityAlpha(self, 0, 0)
			SetPhysicsFlag(self.triangle, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(self.triangle, PHYSICS_COLLIDER, 1)
			SetEntityFlag(self,  ENTITY_ZLOCK ,0)
			
			--SetMotionBlurScale(1.1)
		else
			if (self.camMask) then
				RemoveSprite(self.camMask)
				self.camMask = nil
			end
			AttachCameraToEntity(nil)
			SetCameraFieldOfView(104)
			SetEntityVisible(self.povLure, 0)
			
			SetEntityAlpha(self, 1, 0)
			SetCameraRotateToTarget(0)
			SetEntityFlag(self,  ENTITY_ZLOCK ,1)
			
			--SetMotionBlurScale(1.01)

			SetPhysicsFlag(self.triangle, PHYSICS_COLLIDEE, 0)
			SetPhysicsFlag(self.triangle, PHYSICS_COLLIDER, 0)

			if (self.phase == 1 and (self.part == 1 or self.part == 2))	then
				Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_AUTO_ROTATE, 1)
				SetChaseCameraAutoRotateRange(20, 15)
			end
		end
	end
	
-- ************************************************************************************************
	
	function Ob:updateOrigin(loc)
		self.bubble:updateOrigin(loc)
		self.strafe:updateOrigin(loc)
	end

-- ************************************************************************************************

	function Ob:onCollide(data,from)
 		--GamePrint("COLLIDE WITH " .. (from and from.Name or "GEOMETRY"))
	end
	function Ob:onNewMoveCollide(data,from)
 		--GamePrint("NEW MOVE COLLIDE WITH " .. (from and from.Name or "GEOMETRY"))
		if (self.phase == 1 and self.part ~= 3 and (from == Global or from.bObstacle == 1) and Global.levelScript.cutsceneScript.state_name ~= 'StartSucking') then
		 	self.strafe:moveToRand(1)
		end
	end

-- ************************************************************************************************
	
	--[[
	function Ob:listenerInvisibility(data,from)
		self:decide()
	end
]]--
-- ************************************************************************************************

	function Ob:onStartShrinking()
		--start sucking debris
		if (self.phase == 1) then
			local notpooled = self.debrisPool:getNotPooled()
			for k, v in notpooled do
				if (type(v) == 'table') then	-- because n is in notpooled too
					v:suckIn()
				end
			end
			self:createTimerSecs(self.debrisRate, self.SUCKDEBRISTIMER)
		end	
		--SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 2000)
		--SetPhysicsConstant(nil, PHYSICS_FRICTION, 2000)

		PESetActive(Global.levelScript.blowParticle,0)
		if (self.phase == 1) then
			PESetActive(Global.levelScript.suckParticle,1)
			SetEntityVisible(self.mouthSuckFX, 1)
		end
		
		PlaySound(nil, self.suckSound)
	end

-- ************************************************************************************************
	
	function Ob:onStartGrowing()
		--start blowing debris
		if (self.phase == 1) then
			self:createTimerSecs(self.debrisRate, self.BLOWDEBRISTIMER)
		end
		--SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 2000)
		--SetPhysicsConstant(nil, PHYSICS_FRICTION, 2000)

		if (self.phase == 1) then
			PESetActive(Global.levelScript.blowParticle,1)
			SetEntityVisible(self.mouthBlowFX, 1)
			PlaySound(nil, self.blowSound)
		end
		PESetActive(Global.levelScript.suckParticle,0)
	end	
	
-- ************************************************************************************************
	
	function Ob:onDoneShrinking()
		self:killTimer(self.SUCKDEBRISTIMER)
		if (self.bCycle == 1) then
			self:createTimerSecs(self.pauseTime, self.GROWAGAINTIMER)
		end
		PESetActive(Global.levelScript.suckParticle,0)
		PEAgeParticles(Global.levelScript.suckParticle,0.8)

		StopSound(self.suckSound)
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, Global.levelScript.walkAccelConst)
		SetPhysicsConstant(Global.player, PHYSICS_FRICTION, Global.levelScript.frictionConst)
		SetEntityVisible(self.mouthSuckFX, 0)
		if (self.bubble.bMoving ~= 1) then
			self:setAnim(self.animsTable.Swim)
		end
		local notpooled = self.debrisPool:getNotPooled()
		for k, v in notpooled do
			if (type(v) == 'table') then	-- because n is in notpooled too
				v:stopSuckIn(nil)
			end
		end
			
	end

-- ************************************************************************************************
	
	function Ob:onDoneGrowing()
		--GamePrint("DONE GROWING")
		self:killTimer(self.BLOWDEBRISTIMER)
		if (self.bCycle == 1) then
			self:createTimerSecs(self.pauseTime, self.SHRINKAGAINTIMER)
		--elseif (self.part == 3) then
			--Global.levelScript.cutsceneScript:runCutscene('LungfishEnters')
		elseif (self.part == 2 and self.phase == 2) then
			self.bGoToPhase3 = 1
		end
        PESetActive(Global.levelScript.blowParticle,0)

        self:stopSound(self.blowSound)
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, Global.levelScript.walkAccelConst)
		SetPhysicsConstant(Global.player, PHYSICS_FRICTION, Global.levelScript.frictionConst)
		SetEntityVisible(self.mouthBlowFX, 0)
		if (self.bubble.bMoving ~= 1) then
			self:setAnim(self.animsTable.Swim)
		end
	end

-- ************************************************************************************************

	function Ob:onStartMoving()												   
		--if sucking in, drop all debris
		if (self.bubble.bShrinking == 1) then	
			local notpooled = self.debrisPool:getNotPooled()
			for k, v in notpooled do
				if (type(v) == 'table') then	-- because n is in notpooled too
					v:setState(nil)
					v.bHarmful = 0
				end
			end
		end
		StopSound(self.blowSound)
		StopSound(self.suckSound)
		
		PESetActive(Global.levelScript.blowParticle,0)
		PESetActive(Global.levelScript.suckParticle,0)
		SetEntityVisible(self.mouthBlowFX, 0)
		SetEntityVisible(self.mouthSuckFX, 0)
		PEAgeParticles(Global.levelScript.suckParticle,0.8)
		
	end

-- ************************************************************************************************
	
	function Ob:onTimer(data,from)
	 	if (data == self.BLOWDEBRISTIMER and self.bPaused ~= 1) then
	 	--if (data == self.BLOWDEBRISTIMER) then
			if (self.phase == 1) then
				local debris = self.debrisPool:get()
				debris:shootOut()
			else
				self:killTimer(self.BLOWDEBRISTIMER)
			end
		elseif (data == self.SUCKDEBRISTIMER and self.bPaused ~= 1) then
			if (self.phase == 1 and self.part ~= 3) then
				local debris = self.debrisPool:get()
				debris:suckInFromNowhere()
			else
				self:killTimer(self.SUCKDEBRISTIMER)
			end
		elseif (data == self.GROWAGAINTIMER) then
			if (self.phase == 1 and Global.cutsceneScript.cutscenePlaying ~= 1) then
				self.bubble:grow()
				self:killTimer(self.GROWAGAINTIMER)
			end
		elseif (data == self.SHRINKAGAINTIMER) then
			if (self.phase == 1) then
				self.bubble:shrink()
			end
			self:killTimer(self.SHRINKAGAINTIMER)
		elseif (data == self.CRAYFISHDROPTIMER and self.bPaused ~= 1 and self.crayfishPool.pooled.n > 0 and Global.cutsceneScript.cutscenePlaying ~= 1) then
			local crayfish = self.crayfishPool:get()
			crayfish:drop()
		elseif (data == self.SUCKERFISHDROPTIMER and self.bPaused ~= 1 and self.suckerfishPool.pooled.n > 0 and Global.cutsceneScript.cutscenePlaying ~= 1) then
			local suckerfish = self.suckerfishPool:get()
			suckerfish:drop()
		elseif (data == self.DECIDEAGAINTIMER) then
			self:killTimer(self.DECIDEAGAINTIMER)
			self:decide()
		end
	end
	
-- ************************************************************************************************
																								   
	function Ob:onNewMoveMelee(data,from)
		if (self.modeLureJab.bCaughtClam == 1 and self.state_name ~= 'Dazed') then
			self.currDamage = self.currDamage + 0.0556
			self:subtractHealthLevel(0.0556)
			self:damageFlash()
			self:setAnim(self.animsTable.LureStuckDamage)
			if (self.currDamage >= 0.1666 and self.modeLureJab.clam) then
				self.currDamage = 0
				self.modeLureJab.clam:releaseLungfish()
			end
		end
	end

-- ************************************************************************************************

	function Ob:beginStateDazed()
		Global.cutsceneScript:runCutscene('LungfishDazed')
	end
	
	function Ob:stateDazed()
		self.bUninterruptibleState = 1
		Global:save('LungfishDazed', 1)
		--edit make sure this gets saved
		Global:saveGlobal('bLLCompleted', 1)
		PESetActive(self.glow,0)
		SetEntityAlpha(self.mace, 0, 2)	
		self:setAnim(self.animsTable.Dazed)
		self:removeHealthBars()		
		self:stopSound(self.breatheSound)
		PlaySound(nil, self.dazedSound)
		Global.levelScript:setLevelTheme('LungfishLair')
		--PlaySound(nil, LoadSound('LungfishDeath'))
		
		self:sleep(4)
		self.bUninterruptibleState = 0
		self:setState(nil)
	end	
	
	function Ob:endStateDazed()
		Global.goalManager:deactivate('DefeatLungfish')
		Global.goalManager:activate('RescueLili',1)
		Global.camControl:setSecondaryTarget(nil, kSECONDARYFLAG_AUTO_ROTATE, 1)
		--edit load CABH so Raz isn't trapped underwater with the Lungfish
		Global.levelScript:loadNewLevel('CABH_NIGHT',0,0)
		--Global.cutsceneScript:runCutscene('FordHint')
	end				

-- ************************************************************************************************

	function Ob:onBasicBraining(data, from)
		if (Global:load('LungfishDazed') == 1) then 
			local x,y,z = Global.player:getPosition()
			local ox,oy,oz = Global.player:getOrientation()
			Global:setLevelToCompleted('LL')
			Global:save('LungfishDazedRazPos', {x,y,z})
			Global:save('LungfishDazedRazOri', {ox,oy,oz})

			self:enterBrain()
		end
	end

-- ************************************************************************************************

	function Ob:stateFaceRaz()
		local x,y,z = Global.player:getPosition()
		RotateTowards2D(self, x,y,z, 200)  --slow see he doesn't hit raz all the time
		
	end	
	
-- ************************************************************************************************

	function Ob:stateStartBattle()
		self:playVideo('cutscenes/prerendered/llbf.xmv', 0, 35333)
		Global.levelScript:setLevelTheme('Lungfish')		
		Global.levelScript:setMusicMood(Global.levelScript.MUSIC_MOOD_AMBIENT)
		
		Global.levelScript.cutsceneScript:runCutscene('StartSucking', 1, 0, 1, 0)
		self:setupHealthBars()
		Global.levelScript.camControl:pushAndSetChase(self, 900, 8, 250, 104)
		MoveCameraToIdeal()
		--self:createTimerSecs(self.swimSoundTime, self.SWIMSOUNDTIMER)
		PlaySound(nil, self.swimSound)
		SetPlayerLookBox(2000, 1000)
		PlayerSetLookTargetSearchDist(Global.player, 5000)
		Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_AUTO_ROTATE, 1)
		SetChaseCameraAutoRotateRange(20, 15)

		self:setState(nil)
	end
	
	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		PlayerSetLookTargetSearchDist(Global.player, 1000)
	end
	
-- ************************************************************************************************
		
	function Ob:goToPhase2()
		self.strafe:endMode()
		Global.levelScript.cutsceneScript:runCutscene('GoToPhase2')
	end
		
-- ************************************************************************************************
		
	function Ob:setupHealthBars()
        self:removeHealthBars()		
		--screen coordinates of bar
		self.healthBarX = 375
		self.healthBarY = 28
		--how much to scale the texture
		self.healthBarScaleX = 0.60
		self.healthBarScaleY = 0.9
		--the pixel dimensions of texture
		self.healthBarWidth = 256
		self.healthBarHeight = 32
		--the current level, starts at 1, goes to 0
		self.healthBarLevel = 1.0
		self.healthBarBorderX = 220
		self.healthBarBorderY = 0
		--how much to scale the texture
		self.healthBarBorderScaleX = 0.60
		self.healthBarBorderScaleY = 0.60
		--draw the bar and border
		
		self.healthBar = AddSprite('textures/ui/healthbar.tga' , self.healthBarX , self.healthBarY, 1, 1, 0)
		SpriteAdjust(self.healthBar, self.healthBarX, self.healthBarY, 1, self.healthBarScaleX, self.healthBarScaleY, 0)
		self.healthBarBorder = AddSprite('Textures/LevelTextures/LL_LungfishLair/LL_Healthbar_Lungfish.tga' , self.healthBarBorderX , self.healthBarBorderY, 1, 1, 0)
		SpriteAdjust(self.healthBarBorder, self.healthBarBorderX, self.healthBarBorderY, 1, self.healthBarBorderScaleX, self.healthBarBorderScaleY, 0)	
    end
	
	
	function Ob:removeHealthBars()
		if self.healthBar then
			RemoveSprite(self.healthBar)
			RemoveSprite(self.healthBarBorder)
			self.healthBar=nil
			self.healthBarBorder=nil
		end            
	end        
			
	--adjust the health bars (absolute)
	function Ob:setHealthLevel(iPercentLeft)
		self.healthBarLevel = min(max(iPercentLeft, 0), 1)
		SpriteAdjust(self.healthBar, nil,nil,nil,nil,nil,nil, iPercentLeft, 1)
		--SpriteAdjust(self.healthBar, self.healthBarX - (self.healthBarScaleX * self.healthBarWidth * (1 - self.healthBarLevel) / 2), self.healthBarY, 1, self.healthBarLevel * self.healthBarScaleX, self.healthBarScaleY, 0)
		if (self.healthBarLevel <= 0 and self.bDazed ~= 1) then
			self.bDazed = 1
			self:endAllModesSafe()
			self:setState('Dazed')
		elseif (self.part ~= 3 and self.healthBarLevel <= self['part'..self.part..'HealthThresh'] and self.phase == 1 and Global.levelScript.cutsceneScript.cutscenePlaying ~= 1) then
			self:endAllModes()
			self:goToPhase2()
		end
	end

	--subtract a certain amount of health, 0 to 1
	function Ob:subtractHealthLevel(iSubtractor)
		self:setHealthLevel(self.healthBarLevel - iSubtractor)
	end

	--add a certain amount of health, 0 to 1, 
	function Ob:addHealthLevel(iAdd)
		self:setHealthLevel(self.healthBarLevel + iAdd)
	end

-- ***********************************************************************************************
	
	function Ob:endAllModes()
	 	%Ob.Parent.endAllModes(self)
		self.bubble:endMode()
		self.strafe:endMode()
		
		self:killTimer(self.BLOWDEBRISTIMER)
		self:killTimer(self.SUCKDEBRISTIMER)
		self:killTimer(self.SHRINKAGAINTIMER)
		self:killTimer(self.GROWAGAINTIMER)
	end

	function Ob:killAllDebris()
		if (self.debrisPool) then
			local notpooled = self.debrisPool:getNotPooled()
			for k, v in notpooled do
				if (type(v) == 'table' and v ~= self) then	-- because n is in notpooled too
					v:killSelf()
				end
			end
		end
	end

-- ***********************************************************************************************

   Ob.dialogTableLine = {
					"/GLZA049TO/",--DIALOG=<<Could you take me back to camp now?>>
					"/GLZA050TO/",--DIALOG=<<Could you take me back to the Asylum?>>
					"/GLZA051TO/",--DIALOG=<<Nothing. I just wanted to make sure you\'re not dead.>>
	}
	
	Ob.dialogTableVoice = {
					"/LLAC006RA/",--DIALOG=<<Could you take me back to camp now?>>
					"/LLAC007RA/",--DIALOG=<<Could you take me back to the Asylum?>>
					"/LLAC008RA/",--DIALOG=<<Nothing. I just wanted to make sure you\'re not dead.>>
	}

	function Ob:onItem()
		if (Global:load('LungfishDazed') == 1) then
			Global.player:sayLine("/LLAB005RA/")  --Raz Whoa. Poor little thing. 
		end
	
	end

-- ***********************************************************************************************
  	
	function Ob:onClairvoyance(data, from)
		if (self.phase == 2) then
			self:setLungfishPOV(1)
		end
		self:makeInvisible(1)
		Global.player:setClairvoyanceTarget(self, self.clairFollows)
		self:dontRunPlayerControls(0)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
	end 

	function Ob:onCancelClairvoyance()
		if (self.phase == 2) then
			self:setLungfishPOV(1)
		else
			self:makeVisible()
			SetEntityFlag(self, ENTITY_ALWAYS_POSE, 0)
		end
	end
	
-- ***********************************************************************************************
	
	function Ob:forDave()
		self:killTimer(self.BLOWDEBRISTIMER)
		self:killTimer(self.SUCKDEBRISTIMER)
		self:killTimer(self.GROWAGAINTIMER)
		self:killTimer(self.SHRINKAGAINTIMER)
		self:killTimer(self.CRAYFISHDROPTIMER)
		self:killTimer(self.SUCKERFISHDROPTIMER)
		self:setPhase(3,1)
		self.bubble:setRadius(self.bubble.maxRadius * 0.8)
        DomainSleep('E_Arena2DOMAIN', 0)
		--DomainSleep('E_Arena2LSOsDOMAIN', 0)
	end
	
	function Ob:forDave2()
		StopSound(self.breatheSound)
	 	KillScript(self.bubble.helper)
		KillScript(self.mouthSuckFX)
		KillScript(self.mouthBlowFX)
		KillScript(self)
	end
-- ***********************************************************************************************
							   						   
	return Ob
end

