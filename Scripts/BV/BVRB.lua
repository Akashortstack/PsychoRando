function BVRB(Ob)
	-- Constructor
	if (Ob == nil) then									   
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = { 'BV.Effects.BVLedgeDirtFX',
						'Global.Effects.BVRaz.BVBounceWooshFX',
						'Global.Collectibles.PsiPower',
						'BV.Effects.SewerPaintDripFX',
						'BV.Effects.ShowerPaintFX',
						'BV.Props.MagicPainting',
						'BV.BVCharItemMatrix',
						'Global.Props.Geometry',
						'BV.Effects.PaintFountainsFX',
						'BV.Effects.FireWoodFireFX',
						'Global.Effects.PsiPowerUpFX',
			},
			meshes = { 'Levels/SkyBox/BVRB_Skybox.plb',
						'characters/bv_raz.plb',
						'Characters/CharacterProps/Raz_BVKisses.plb',
						'characters/dartnew.plb',
						'Characters/LuchaLibreArm.plb',
						'GlobalModels/GO_GlobalObjects/meritbadges/confusion.plb',
						'GlobalModels/FX_Models/BVdripEmitter.plb', 
			},
			textures = { 'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep1.tga',
							'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep2.tga',
							'Textures/LevelTextures/BV_BlackVelvetopia/BV_tightrope.tga',
							'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep1.tga',
							'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep2.tga',
							'textures/sprites/clairvoyance handlers/raz_edgarnerd.dds',
							'textures/sprites/clairvoyance handlers/raz_worm.dds',
							'textures/sprites/clairvoyance handlers/raz_gazelle.dds',
							'textures/sprites/clairvoyance handlers/raz_cheeseyknight.dds',
							'Textures/UI/Sayline Heads/BVraz.dds'
			},
			animations = { 
				'Anims/Bull/Toss_Rt.jan',
				'Anims/Bull/Toss_Lf.jan',
				'Anims/BVRB/ArchwayPainting_grow.jan',
				'anims/bvrb/bvrb_awning.jan',
				'Anims/BVRB/LadderUp_Fail.jan',
				'Anims/BVRB/LadderDown_Fail.jan',
				'Anims/BVRB/BVRB_LadderGuitar_Contract.jan',
				'Anims/BVRB/BVRB_LadderGuitar_Grow.jan',
				'Anims/BVRB/BVRB_RosePainting_Bloom.jan',
				'Anims/BVRB/BVRB_TikiHutPainting_Contract.jan',
				'Anims/BVRB/BVRB_TikiHutPainting_Expand.jan',
				'Anims/BV_PortalPaintings/ElOdioPainting_Front.jan',
				'Anims/BV_PortalPaintings/ElOdioPainting_Loop.jan',
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Censor1L/Burly_DamageFrontPriority.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Expelled.jan',
				'Anims/DartNew/Jump_In_End.jan',
				'Anims/DartNew/KnockDown_end.jan',
				'Anims/DartNew/KnockDown_loop.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/Raz_RideBull.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/Somersault.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/LuchaLibre/Expelled.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/bv_portalpaintings/elodiopainting_back.jan',
				'anims/bvrb/archwaypainting_contract.jan',
				'anims/bvrb/archwaypainting_grow.jan',
				'anims/bvrb/hangpaintingjangle.jan',
				'anims/dartnew/hangpainting.jan',
				'anims/dartnew/knockdown_end.jan',
				'anims/dartnew/knockdown_loop.jan',
				'anims/dartnew/knockdownfront_start.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/streetpainters/bvwx_stbernard.jan',
				'cutScenes/LuchaPaintings/Arm_GrabCard.jan',
				'cutScenes/LuchaPaintings/Card_GrabCard.jan',
				'anims/bv_gios/gio_shake.jan',
				'anims/llll_fern1/llll_fernshake.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dusterretract.jan',
				'anims/objects/duster/dustershoot.jan',
			},
		}
		
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.levelType = 'mental'
		Ob.rPlayer = nil		
		Ob.ledgeDirtEmitterName = 'BV.Effects.BVLedgeDirtFX'
		Ob.trampolineVFX = 'Global.Effects.BVRaz.BVBounceWooshFX'

--[[
		Ob.leftFootPaintTexture = 'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep1.tga'
		Ob.rightFootPaintTexture = 'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep2.tga'
]]--

		Ob.paintingVFXOffsets = 
		{
			LoadBVESPainting = {x=0, y=300, z=200},
			LoadBVESPaintingSwirl = {x=0, y=0, z=0},

			DragonPainting = {x=0, y=300, z=200},
			EaglePainting = {x=0, y=300, z=200},
			CobraPainting = {x=0, y=300, z=200},
			TigerPainting = {x=0, y=300, z=200},
			DragonPaintingSwirl = {x=0, y=0, z=0},
			EaglePaintingSwirl = {x=0, y=0, z=0},
			CobraPaintingSwirl = {x=0, y=0, z=0},
			TigerPaintingSwirl = {x=0, y=0, z=0},

			DragonPaintingDefeated = {x=0, y=300, z=200},
			EaglePaintingDefeated = {x=0, y=300, z=200},
			CobraPaintingDefeated = {x=0, y=300, z=200},
			TigerPaintingDefeated = {x=0, y=300, z=200},
			DragonPaintingDefeatedSwirl = {x=0, y=0, z=0},
			EaglePaintingDefeatedSwirl = {x=0, y=0, z=0},
			CobraPaintingDefeatedSwirl = {x=0, y=0, z=0},
			TigerPaintingDefeatedSwirl = {x=0, y=0, z=0},
		}
		
		-- Set up special chase cam params
		-- !Erik Please don't mess with these values unless there's a good reason  ; )  They're important for the level to function correctly.
		
		Ob.initCamRadius = 500
		Ob.initCamAltitude =  7.1
		Ob.initCamTargetHeight = 200
		Ob.initCamFOV = 150
		Ob.bCheckForCombatMood = 1
		Ob.defaultAmbientSoundName = 'BVAmb'
		Ob.bDontPlayThemeAtStart = 1
		Ob.MOOD_DELAY_TIME = 2000
	end

--**************************************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Melee = {num = 2, censorCode = 'Melee', scriptName = nil},
									Suicide =  {num = 2, censorCode = 'Suicide', scriptName = nil},
									Burly = {num = 2, censorCode = 'Burly', scriptName = nil},
		}
	end
	
	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--edit Removed
		Global:setLevelToCompleted('MM')

		%Ob.Parent.onBeginLevel(self)
		
		SetSkyBox('Levels/SkyBox/BVRB_Skybox.plb')

		--SetLightRadius(FindLight(FindScriptObject('Bull1'), 'pointLight1'), 2500)

		Global.player.stats.totalEmotionalBaggage = 4;  

		-- We have to remember to reload the correct mesh when we exit the level
		LoadNewPlayerMesh('characters/bv_raz.plb')
		SetShadowColor(0, 0, 0, 0.5)
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)
		SetEntityFlag(Global.player, ENTITY_LIT_SHADOW, 1)
		
		local manholeController = FindScriptObject('manholecontroller1', 1)
		if manholeController then manholeController:killSelf() end
		manholeController = FindScriptObject('manholecontroller2', 1)
		if manholeController then manholeController:killSelf() end

		--get necessary references
		self.rBVTheme = LoadSound('BlackVelvetRun')
		self.rBVSGTheme = LoadSound('BlackVelvetopia')
		self.rRazUff = LoadSound('GL007DA')
		self.rRazHitGround = LoadSound('wrestler_step_01')
		if self.demoLevel ~= 1 then self.matador = FindScriptObject('Matador') end
		self.bulldawg = FindScriptObject('Placardor1')
		if (Global:loadGlobal('bBVCompleted') ~= 1) then
			self.bullController = FindScriptObject('BullController')
		end
		self.stBernard = FindScriptObject('PaintingDude02')
		if (Global:load('tigerDefeated') == 1) then
			self.tigerPainting = FindScriptObject('TigerPaintingDefeated')
		else
			self.tigerPainting = FindScriptObject('TigerPainting')
		end
		if (Global:load('dragonDefeated') == 1) then
			self.dragonPainting = FindScriptObject('DragonPaintingDefeated')
		else
			self.dragonPainting = FindScriptObject('DragonPainting') 
		end
		if (Global:load('eagleDefeated') == 1) then
			self.eaglePainting = FindScriptObject('EaglePaintingDefeated')
		else
			self.eaglePainting = FindScriptObject('EaglePainting')
		end
		if (Global:load('cobraDefeated') == 1) then
			self.cobraPainting = FindScriptObject('CobraPaintingDefeated')
		else
			self.cobraPainting = FindScriptObject('CobraPainting')
			if Global:load('defeatedByCobra') == 1 then
				--Give the player a little hint in the form of a goal
				Global.goalManager:activate('LearnConfusion')
			end
		end
		self.frontPainting = FindScriptObject('LoadBVESPainting')
		self.rearPainting = FindScriptObject('ElOdioRearPainting')
		self.archCSPainting = FindScriptObject('ArchCSPainting')
		self.archPainting = FindScriptObject('ArchPainting')
		
		if (Global:loadGlobal('bBVCompleted') == 1) then
			FindScriptObject('PaintingDude01fixedScriptCam'):turnOff()
			FindScriptObject('PaintingDude02fixedScriptCam'):turnOff()
			FindScriptObject('PaintingDude03fixedScriptCam'):turnOff()
			
			if (Global:load('bAnotherRosePainting1Collected') ~= 1) then
				self.anotherRosePainting1 = SpawnScript('BV.Props.MagicPainting', 'AnotherRosePainting1', 'self.sPaintingType=\'Rose\' self.ownerName=\'PaintingDude01\'')
				self.anotherRosePainting1:setPosition(151.5, -200, 4141.3)
				self.anotherRosePainting1:setOrientation(0, -125, 0)
			end
			if (Global:load('bAnotherRosePainting2Collected') ~= 1) then
				self.anotherRosePainting2 = SpawnScript('BV.Props.MagicPainting', 'AnotherRosePainting2', 'self.sPaintingType=\'Rose\' self.ownerName=\'PaintingDude01\'')
				self.anotherRosePainting2:setPosition(-9375,1264,935)
				self.anotherRosePainting2:setOrientation(0, 160, -15)
			end
			if (Global:load('bAnotherRosePainting3Collected') ~= 1) then
				self.anotherRosePainting3 = SpawnScript('BV.Props.MagicPainting', 'AnotherRosePainting3', 'self.sPaintingType=\'Rose\' self.ownerName=\'PaintingDude01\'')
				self.anotherRosePainting3:setPosition(-8014.7, 929.2, -10538.6)
				self.anotherRosePainting3:setOrientation(0, 111, 0)
			end
		end

		self.charItemMatrix = SpawnScript('BV.BVCharItemMatrix','CharItemMatrix','',1)

	    	--Register Raz to Secret Garden TV
		RegisterTriggerVolume(self, 'tv_secretgarden')
		RegisterTriggerVolume(self, 'tv_OpenThirdGate')
		RegisterTriggerVolume(self, 'tv_sayHighSchoolLines')

		SetDistanceFogEnable(1)
		SetDistanceFogColor(0.075,0,0.25)
		SetDistanceFogRange(2000, 8000)

		Global.cutsceneScript:fadeToBlack(0)

		self.kissHelmet = SpawnScript('Global.Props.Geometry', nil, 'self.meshName = \'Characters/CharacterProps/Raz_BVKisses.plb\'')
		SetEntityAlpha(self.kissHelmet, 0, 0)
		self.kissHelmet:hide()
		self.kissHelmet.onTimer = function(self, id)
			self:killTimer(id)
			if id == '1' then
				SetEntityAlpha(self, 0, 4)
			else
				DetachEntityFromParent(self)
				self:hide()
			end
		end
		
		SpawnScript('BV.Effects.PaintFountainsFX'):run()
		
	    -- add self as a trig surface listener
		Global.player:addSpamListener('TriggerSurface', self)
		
		-- set up the tightrope visuals
		SetRenderSplineTexture(LoadTexture('Textures/LevelTextures/BV_BlackVelvetopia/BV_tightrope.tga'))
        SetRenderSplineThickness(7)
		SetRenderSplineDensity(0.02)
		
		self.wrestlerHand = SpawnScript('Global.Props.Geometry', 'WrestlerHand', 'self.meshName = \'Characters/LuchaLibreArm.plb\' self.startCollidee = 0 self.bForceSimulate = 1',1)
		SetEntityVisible(self.wrestlerHand, 0)
		SetPhysicsFlag(self.wrestlerHand, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.wrestlerHand, PHYSICS_COLLIDER, 0)

		Global.player:addSpamListener('Clairvoyance', self)
		SetSwitchableCollisionEnable(2,1)  --this turns on the camera geometry for the window shutters.  if there were more time, we should just make this set a part of the original level camera geometry

		self:setState('LevelSetup')
		Global.player.charName = 'BVraz'
		
		-- We exceed max mesh frags at default freeze/thaw dists.
		self.oldFreeze, self.oldThaw = GetFreezeThawDists()
		SetFreezeThawDists(4000, 4000)

		--edit to save first BV entry
		if Global:loadGlobal('bBVFirstEntry') ~= 1 or Global:loadGlobal('bBVFirstEntry') == nil then
			Global:saveGlobal('bBVFirstEntry',1)
		end
	end

	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		if (self.waterFXManager) then
			self.waterFXManager:changeSplashSound('FS_Puddle_Land')
		end
		-- make sure the cam for the gates are off if the gates are open
		local cam, trigger
		if Global:load('TKGate2Open') == 1 then
			-- first tk gate open
			cam = FindScriptObject('UpperTKGateCam')
			if cam then
				cam:turnOff()
			end
			trigger = FindScriptObject('TKTrigger2')
			trigger.bSupporting = 1			
			trigger:setToPressed()
		end
		if Global:load('TKGate8Open') == 1 then
			-- first tk gate open
			cam = FindScriptObject('UpperTKGateCam2')
			if cam then
				cam:turnOff()
			end
			trigger = FindScriptObject('TKTrigger9')
			trigger.bSupporting = 1
			trigger:setToPressed()			
		end		
		if Global:load('TKGate1Open') == 1 then
			-- first tk gate open
			cam = FindScriptObject('LowerTKGateCam')
			if cam then
				cam:turnOff()
			end
			trigger = FindScriptObject('TKTrigger1')
			trigger.bSupporting = 1
			trigger:setToPressed()
		end		
	end

--********************************************************************************************
	
	function Ob:stateLevelSetup()

		-- Paint drip VFX
		SetEntityVisible(SpawnScript('Global.Props.Geometry', 'PaintDripGeom', 'self.meshName = \'GlobalModels/FX_Models/BVdripEmitter.plb\''), 0)
		SpawnScript('BV.Effects.ShowerPaintFX'):run()
		SpawnScript('BV.Effects.SewerPaintDripFX'):run()

		-- confusion to be enabled later, by the Matador
		--edit keep confusion if found somewhere else
		--[[if Global:loadGlobal('bGotConfusion') ~= 1 then
			if (self.demoLevel ~= 1) then
				DisablePower(kPOWER_CONFUSION)
			end
		end]]
		  
        local tramp = FindScriptObject('TrampolineAwning')
		if tramp then tramp.sound = LoadSound('raz_awning_bounce') end
	       	tramp = FindScriptObject('TrampolineAwning1')
		if tramp then tramp.sound = LoadSound('raz_awning_bounce') end
	       	tramp = FindScriptObject('TrampolineAwning2')
		if tramp then tramp.sound = LoadSound('raz_awning_bounce') end

		-- just for music
		if (Global:load('ArchwayPaintingHungSeen') ~= 1 ) then
			self:setLevelTheme(self.rBVSGTheme)
		else
			self:setLevelTheme(self.rBVTheme)
		end

		if (Global:load('BVRBIntroSeen') ~= 1) then
			local archwayCSPainting = FindScriptObject('ArchCSPainting')
			local archwayPainting = FindScriptObject('ArchPainting')
			local hook4 = FindScriptObject('MagicHook04')
			if (archwayCSPainting and hook4 and archwayPainting) then
				archwayCSPainting.bLoading = 1
				archwayCSPainting:hangImmediately(hook4)
				
				archwayCSPainting.bLoading = 0
				SetEntityVisible(archwayPainting, 0)
			else
				GamePrint('could not find arch painting or hook')
			end
			Global.cutsceneScript:runCutscene('Intro', 1, 1)

		elseif Global:load('DefeatedByWrestler') then
			Global.cutsceneScript:runCutscene('ReturnFromBVWALost', 1)
			if (Global:load('bBulldogSuccessCutsceneRan') ~= 1 and Global.player.saved.BV.bMatadorPlacated == 1) then
				Global.cutsceneScript:runCutscene('BulldogSuccessCutscene', 1)
			end
		elseif Global:load('PaintingEntered') then
			local interp = 1
			local painting = Global.cutsceneScript:getPaintingToComeOutOf(Global:load('PaintingEntered'))		
			if painting and painting.Name == 'LoadBVESPainting' then
				interp = 0
			end
			Global.cutsceneScript:runCutscene('ReturnToHook', 1, interp)
		else
			Global.cutsceneScript:fadeIn(1)
			if (Global:loadGlobal('bBVCompleted') ~= 1) then
				self.bullController:startBulls()	
			end
			MoveCameraToIdeal()
			self:dontRunPlayerControls(0)
			self:setupPaintings(0)
		end

		self:setState(nil)
	end

	function Ob:onFirstTimeInLevel()
		Global.goalManager:activate('ReturnQueens')
		--Set up goals
		for i, suit in {'Clubs', 'Hearts', 'Diamonds', 'Spades'} do
			Global.goalManager:activate('QueenOf'..suit, 1)
		end
	end
	
--**************************************************************************************************

	function Ob:setupPaintings(setupRaz)
		if (setupRaz == 1) then 
			local whichWrestler = Global:load('ReturningFromWrestler')
			if (whichWrestler == 'tiger') then
				Global.player:setPosition(-4066.3, 314.8, -3102.1)
				Global.player:setOrientation(0, 29.2, 0)
				SetChaseCameraAzimuth(-27)
			elseif (whichWrestler == 'dragon') then
				Global.player:setPosition(-7206.1, 588.3, -3720.5)
				Global.player:setOrientation(0, -70, 0)
				SetChaseCameraAzimuth(-120)
			elseif (whichWrestler == 'eagle') then
				Global.player:setPosition(-2513, 1123.9, -8641.4)
				Global.player:setOrientation(0, -30, 0)
				SetChaseCameraAzimuth(115)
			elseif (whichWrestler == 'cobra') then
				Global.player:setPosition(898.1, 1437, -5976.3)
				Global.player:setOrientation(0, 74.6, 0)
				SetChaseCameraAzimuth(29.7)
			end
		end
		
		if (Global:load('tigerDefeated') ~= 1 and Global.player.saved.BV.tigerPaintingIntroSeen == 1) then
			self.tigerPainting:loadAnim('Anims/BV_PortalPaintings/LuchaPainting_loop.jan', 0.100000, 1)
		end
		if (Global:load('dragonDefeated') ~= 1 and Global.player.saved.BV.dragonPaintingIntroSeen == 1) then
			self.dragonPainting:loadAnim('Anims/BV_PortalPaintings/LuchaPainting_loop.jan', 0.100000, 1)
		end
		if (Global:load('eagleDefeated') ~= 1 and Global.player.saved.BV.eaglePaintingIntroSeen == 1) then
			self.eaglePainting:loadAnim('Anims/BV_PortalPaintings/LuchaPainting_loop.jan', 0.100000, 1)
		end
		if (Global:load('cobraDefeated') ~= 1 and Global.player.saved.BV.cobraPaintingIntroSeen == 1) then
			self.cobraPainting:loadAnim('Anims/BV_PortalPaintings/LuchaPainting_loop.jan', 0.100000, 1)
		end
		
		self.frontPainting:loadAnim('Anims/BV_PortalPaintings/ElOdioPainting_Loop.jan', 0.1, 1)
   		self.rearPainting:loadAnim('Anims/BV_PortalPaintings/ElOdioPainting_Loop.jan', 0.1, 1)
   		SetEntityCollideGeometry(self.rearPainting)
   	 	foreach_entity_oftype('BV.Props.LevelLoadPainting', function(ent) ent.bCanLoad = 1 end)
		foreach_entity_oftype('BV.Props.Painting', function(ent) ent.bCanLoad = 1 end)

		if self.tigerPainting then -- missing in demo levels
			SetPhysicsFlag(self.tigerPainting, PHYSICS_COLLIDEE, 1)
			SetEntityCollideGeometry(self.tigerPainting)
		end
		if self.cobraPainting then -- missing in demo levels
			SetPhysicsFlag(self.cobraPainting, PHYSICS_COLLIDEE, 1)
			SetEntityCollideGeometry(self.cobraPainting)
		end
		SetPhysicsFlag(self.dragonPainting, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self.eaglePainting, PHYSICS_COLLIDEE, 1)
		SetEntityCollideGeometry(self.dragonPainting)
		SetEntityCollideGeometry(self.eaglePainting)
	end
	
-- *********************************************************************************

   	function Ob:onEnteredTriggerVolume(tvName, who)
		if who ~= Global.player then return end
		if tvName=='tv_secretgarden' then
			UnlockAchievement('ACH_BV_GARDENSEEN')
			self:setLevelTheme(self.rBVSGTheme)
		elseif tvName=='tv_OpenThirdGate' then
			local cam = FindScriptObject('UpperTKGateCam2')
			if (cam.bActive == 1) then cam:turnOff() end
		elseif tvName == 'tv_sayHighSchoolLines' then
			if Global:load('bHasSaidHighSchoolLines') ~= 1 then
				if self.state_name ~= 'LevelSetup' then
					Global:save('bHasSaidHighSchoolLines', 1)
					self:setState('SayHighSchoolLines')
				end
			end
		end
	end

	function Ob:stateSayHighSchoolLines()
		Global.player:sayLine("/BVWT030RA/", 1, nil, nil, 1)
		Global.player:sayLine("/BVWT031RA/", nil, nil, nil, 1)
		self:setState(nil)
	end
	
	function Ob:onExitedTriggerVolume(tvName, who)
		if tvName=='tv_secretgarden' and Global.player==who then
			self:setLevelTheme(self.rBVTheme)
		end
	end

	function Ob:listenerTriggerSurface(new,from,old)
		if (new == 1) then
			self:setMusicMood(self.MUSIC_MOOD_MED)
		else
			self:setMusicMood(self.MUSIC_MOOD_AMBIENT)
		end
	end

	function Ob:onEndLevel(bDestroyed)
        -- Restore the regular player mesh
		LoadNewPlayerMesh('characters/dartnew.plb', 1)
		Global.player.charName = 'Raz'
		%Ob.Parent.onEndLevel(self, bDestroyed)
		SetFreezeThawDists(self.oldFreeze, self.oldThaw)
	end
	
	function Ob:onTriggered(data,from)
		local cam
		if (from.Name == 'TKTrigger2') then
			cam = FindScriptObject('UpperTKGateCam')
		elseif (from.Name == 'TKTrigger9') then
			cam = FindScriptObject('UpperTKGateCam2')
		elseif (from.Name == 'TKTrigger1') then
			cam = FindScriptObject('LowerTKGateCam')
		end
	
		if (data == '1') then
			cam:turnOff()
		end
	end

	function Ob:listenerClairvoyance(bOn)
		local cam = FindScriptObject('UpperTKGateCam')
		if (bOn == 1) then
			cam:turnOff()
		elseif (FindScriptObject('TKTrigger2').bEnabled ~= 1) then
			cam:turnOn()
		end
	end

	-- For invoking from the GetConfusion cutscene.

	function Ob:csShowConfusionBadge()
		--edit Removed to stop ConfusionPower from Appearing
		--if (not FindScriptObject('ConfusionPower')) then
		--	local c = SpawnScript('Global.Collectibles.PsiPower', 'ConfusionPower', 'self.power = \'Confusion\'')
		--	c:setPosition(1140, 1795, -3660)
		--end
	end
	
	function Ob:stateActivateConfusionPower()
		--edit Removing Confusion Powerup
		--local confusionPower = FindScriptObject('ConfusionPower')
		--if (not confusionPower) then
		--	confusionPower = SpawnScript('Global.Collectibles.PsiPower', 'ConfusionPower', 'self.power = \'Confusion\'')
		--	confusionPower:setPosition(1140, 1795, -3660)
		--end
		--confusionPower:onItem()
		--Wait for player to pickup confusion power
		--while (IsDead(confusionPower) ~= 1) do
			Yield()
		--end
		--Global.levelScript:addTutorialBox("/BVZF008TO/", 'Textures/icons/PsiPowers/Confusion.dds')--DIALOG=<<You can cloud the minds of others using the power of CONFUSION. But if you use it too much, you will need to pick up more CONFUSION GRENADES to energize the confusing aspect of your mind. /ConfusionAmmo/>>
		Global.goalManager:deactivate('LearnConfusion')
		
		self:setState(nil)
	end

	function Ob:getHintResponse()			
		if (IsPowerEnabled(kPOWER_CONFUSION) == 1) then 
			return {
				{
					voice = "/GLAR004FO/" --<<Throw a confusion grenade at that Bull. That should buy you some time.
				},
			}
		else
			return {
				{
					voice = "/GLAR000FO/" --<<Buy all the paintings you can, and look for hooks to hang them on.
				},
				{
					voice = "/GLAR001FO/" --<<And for crying out loud STAY OFF THE STREET.
				},
				{
					voice = "/GLAR002FO/" --<<You can't outrun that bull. You're going to have to sneak around on side streets.
				},
				{
					voice = "/GLAR003FO/" --<<Maybe you can hide out in a window if those ladies don't see you coming.
				},				
			}
		end
	end

	return Ob
end
