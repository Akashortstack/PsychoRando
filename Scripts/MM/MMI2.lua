function MMI2(Ob)
	if not Ob then
		Ob = CreateObject('mm.MMI_Base')
		Ob.dependencies = {
			scripts = {
				--Make sure all props are preloaded, because they can be brought back and forth between levels
				'MM.Props.PropHelmet',
				'MM.Props.PropPhone',
				'MM.Props.PropFlowers',
				'MM.Props.PropHedgeTrimmers',
				'MM.Props.PropPlunger',
				'MM.Props.PropRifle',
				'MM.Props.PropRollingPin',
				'MM.Props.PropSign',
				'MM.Props.PropWaterCan',
                'MM.Characters.Milkman',
                'MM.Props.CensorSedan',
                'MM.Props.Feather',
			},
			animations = {
				'Anims/BlackSedan/wDoors_Flinch.jan',
				'Anims/BlackSedan/wDoors_Spawn.jan',
				'Anims/Censor1L/SpawnTrans.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Flowers.jan',
				'Anims/DartNew/BodyParts/Hold_MM_GodsEye.jan',
				'Anims/DartNew/BodyParts/Hold_MM_HedgeTrimmers.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Phone.jan',
				'Anims/DartNew/BodyParts/Hold_MM_PilotHelmet.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Plunger.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Rifle.jan',
				'Anims/DartNew/BodyParts/Hold_MM_RollingPin.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Sign.jan',
				'Anims/DartNew/BodyParts/Hold_MM_WaterCan.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/DemonDitch_GrabReaction.jan',
				'Anims/DartNew/GrabbedByDemon.jan',
				'Anims/DartNew/HolyShiteFall.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/RailObstacleCrash.jan',
				'Anims/DartNew/RailSlideUphill.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/SpitOut.jan',
				'anims/DartNew/standReady_Idle01.jan',
				'anims/DartNew/standReady_Idle02.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/UseLillies.jan',
				'Anims/DartNew/UsePhone.jan',
				'Anims/DartNew/UsePilotHelmet.jan',
				'Anims/DartNew/UseRifle.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/balloonwalk.jan',
				'Anims/DartNew/balloonwalkslow.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/RailTumbleLeft.jan',
				'anims/dartnew/RailTumbleRight.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'Anims/DenMother/DM_GodseyeLfIdle.jan',
				'Anims/DenMother/DM_GodseyeLfRotate.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'anims/gman/ArrestSequenceLookDown_Idle.jan',
				'anims/gman/gman_diebackflip.jan',
				'Anims/Gman/WaterCanBalance.jan',
				'Anims/Gman/WaterCanYorick.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/Thought_Bubble/BallPop.jan',
				'Anims/Thought_Bubble/BubbleDoubleJump.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/PsiFloatBubbleIdle.jan',
				'Anims/Thought_Bubble/PsiFloatBubbleOpen.jan',
				'Anims/Thought_Bubble/PsiFloatBubblePop.jan',
				'anims/mm_gios/hedges_shake.jan',
				'anims/mm_gios/pottedplant_shake.jan',
				'anims/mm_gios/umbrellatable_shake.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
				'Anims/Rainbow_Squirts/PeekHACK_start.jan',
				'Anims/Rainbow_Squirts/PeekHACK_end.jan'
			},
			meshes = {
				'GlobalModels/FX_Models/Gibs/CensorBodyGib.plb',
				'GlobalModels/FX_Models/Gibs/CensorRArmGib.plb',
				'GlobalModels/FX_Models/Gibs/CensorGlassesGib.plb',
				'GlobalModels/FX_Models/Gibs/CensorLArmGib.plb',
				'GlobalModels/FX_Models/CensorStampSwipe.plb',
				'Characters/CharacterProps/Censor_MM_Hat.plb',
			},
			textures = {
				'textures/ui/sayline heads/boyd.dds',
			},
		}
		
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.drumSnd = 0
		Ob.ended = nil
		Ob.bNoArrests = nil
		Ob.theme = 'MilkmanConspiracy'

		Ob.bProcessFootfalls = 1
		Ob.leftFootprintTexture = 'Textures/LevelTextures/MM_MilkmanConspiracy/MM_footprint_left.tga'
		Ob.rightFootprintTexture = 'Textures/LevelTextures/MM_MilkmanConspiracy/MM_footprint_right.tga'

		Ob.NUM_CHOPPERS = 17
		
		Ob.iCurrMood = 3
		Ob.bCheckForCombatMood = 0
	end

function Ob:onPreLoad()
	GamePrint('PRELOADING MMI2 =========================================================================')
	%Ob.Parent.onPreLoad(self)
end	

-- ****************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		-- DEMON: preload the demon
		self.censorPoolTable = {	Demon = {num = 1, censorCode = 'Demon', scriptName = nil},	}

		self.tAmbientSoundLoops = {
			tv_houseintDOMController = { soundCueName = 'MMHouseAmb' },
			tv_MMI1DOMController = { soundCueName = 'MMAmb' },
		}
	end

-- ****************************************************************************

	function Ob:onPreBeginLevel()
		self:setDomain('DeadBodyGIOS', 0)
		%Ob.Parent.onPreBeginLevel(self)
	end

	function Ob:onBeginLevel()
		--Global:setLevelToCompleted('LO')
		Global:saveGlobal('bGotClairvoyance', 1)
        
		%Ob.Parent.onBeginLevel(self)
        
		-- set up domains
		--DomainSleep('MMI1DOMAIN', 1)
		self:setDomain('copterClairvoy', 0)
		--self:setDomain('houseint', 1)
		--self:setDomain('basement', 0)
		self:setDomain('boydClairvoy', 0)
		
		-- register trigger volumes
		RegisterTriggerVolume(self, 'tv_ChopperView', 0)
		RegisterTriggerVolume(self, 'tv_squirtenter', 0)
		RegisterTriggerVolume(self, 'tv_knockOff1', 0)
		RegisterTriggerVolume(self, 'tv_knockOff2', 0)
		RegisterTriggerVolume(self, 'tv_insideDepot', 1)
		RegisterTriggerVolume(self, 'tv_squirtjump', 0)
		
		--for instahint ford
		RegisterTriggerVolume(self, 'tv_OutsideDenMomHouse', 0)
		RegisterTriggerVolume(self, 'tv_DoNotEnterRifle', 0)
		RegisterTriggerVolume(self, 'tv_gravityreset2', 0)
		RegisterTriggerVolume(self, 'tv_BrokenIslandCam', 0)
		RegisterTriggerVolume(self, 'tv_Arboretum', 0)
		RegisterTriggerVolume(self, 'tv_Basement', 0)
		RegisterTriggerVolume(self, 'tv_Arrestrespawn5', 0)
        
		RegisterTriggerVolume(self, 'tv_SewerTeleRailCam01', 0)
		
		-- set up skybox
		SetSkyBox('Levels/SkyBox/mm_skybox.plb', 1)
		
		-- spawn an arrest controller
		self.arrest = FindScriptObject('Arrest', 1) or SpawnScript('MM.Props.ArrestController', 'Arrest', '')
		
		-- to get trigger surface messages from raz:
		--Global.levelScript.forwardTriggerSurfaceMessages = self
		self.surfacecontroller = SpawnScript('MM.Props.SurfaceController', 'SurfaceController', '')
		
		-- adjust raz's bounding box
		SetPlayerLookBox(2500,2500)

		----- HACK HACK HACK HACK Remove if necessary - Kee
		local teleporter = FindScriptObject('transsquirtenter')
		if (teleporter) then teleporter:killSelf() end
		---- end HACK HACK HACK HACK 
		
        -- trigger volumes
		for i = 1, 100 do
			if (TriggerOBB_Lookup(nil, 'tv_PhantomChopper'..i)) then
				RegisterTriggerVolume(self, 'tv_PhantomChopper'..i, 0)
			end
		end
		
		-- DEMON: trigger volumes
		RegisterTriggerVolume(self, 'tv_RazAbduction1', 0)
		RegisterTriggerVolume(self, 'tv_RazAbduction2a', 0)
		RegisterTriggerVolume(self, 'tv_RazAbduction2b', 0)
		RegisterTriggerVolume(self, 'tv_RazAbduction2c', 0)
		RegisterTriggerVolume(self, 'tv_RazAbduction3', 0)
		RegisterTriggerVolume(self, 'tv_GoodHole', 0)
		RegisterTriggerVolume(self, 'tv_clairPuzzleSolved', 0)
		
		-- tv for the clairvoyance clue cutscene
		RegisterTriggerVolume(self, 'tv_ClairvoyanceClueCS', 0)

		-- domaining is now done with the classic method
--		-- DEMON: make the demon domains inactive
--		DomainSleep('Demon', 1)
--		DomainSleep('DemonLsos', 1)

		self:setupRailslides()

		--just to use sayline head in ChopperClair cutscene
		local gmanEditVars = constructEditvarString('meshName', 'Characters/Gman.plb', 
													'charName', 'GMan')
		self.pilot = SpawnScript('ScriptBase', 'DummyPilot')
		self.pilot:loadMesh('Characters/Gman.plb')
		self.pilot.charName = 'GMan'
		self.pilot:makeInvisible()
		self.pilot:setScale(1.5)
		self.dummyGman1 = SpawnScript('ScriptBase', 'DummyGman1')
		self.dummyGman1:loadMesh('Characters/Gman.plb')
		self.dummyGman1.charName = 'GMan'
		self.dummyGman1:makeInvisible()
		self.dummyGman1:setScale(1.5)
		SetAnimSpeedScale(self.dummyGman1, 0.9)
		self.dummyGman2 = SpawnScript('ScriptBase', 'DummyGman2')
		self.dummyGman2:loadMesh('Characters/Gman.plb')
		self.dummyGman2.charName = 'GMan'
		self.dummyGman2:makeInvisible()
		self.dummyGman2:setScale(1.5)
		SetAnimSpeedScale(self.dummyGman2, 0.95)
		
		self.dummyBoyd = SpawnScript('ScriptBase', 'Boyd')
		self.dummyBoyd.charName = 'Boyd'
		
		self.cookieBomb = SpawnScript('Global.Props.Geometry', 'CookieBomb', 'self.meshName="levels/mm_milkmanconspiracy/props/MM_cookieBomb.plb"')
		self.cookieBomb:makeInvisible()
		self.cookieBomb:setScale(0.4)
		self.cookieBombFX = SpawnScript('BB.Effects.BigMuzzleBlast', 'CookieBombFX')
		self.dummyChopper = SpawnScript('Global.Props.Geometry', 'DummyChopper', 'self.meshName="Levels/MM_MilkmanConspiracy/Vehicles/Chopper.plb"')
		self.dummyChopper:makeInvisible()
		SetEntityFlag(self.dummyChopper, ENTITY_NOSIMULATE, 0)
		SetSimulationCullDistance(self.dummyChopper, 0)
		local tChopperPath = {}
		tChopperPath[0] = {xpos = 47396, ypos = -29364, zpos = 2481}
		tChopperPath[1] = {xpos = 39221, ypos = -29426, zpos = 2758}
		self.hChopperPath = CreateAbsolutePath( self.dummyChopper, 2, kSPLINEPATH_ONCE, tChopperPath)
		SplineForceMove( self.dummyChopper, 1)
		SplineUnidirectional( self.dummyChopper, 1)
		SplineOrientationFlag(self.dummyChopper, 1)
		SplineCharacter( self.dummyChopper, 0 )
		
		-- create the squirrel that's going to be in the demon cutscene
		self.cutsceneSquirrel = SpawnScript('MM.Props.SpySquirrel', 'SpySquirrel', '')
		self.cutsceneSquirrel:hide()
		
		DomainSleep('DenMomBaseDOMAIN', 1)

        if (Global:load('bChopperClairPlayed') == 1 and Global.player:isInInventory('Phone') ~= 1) then
			self:spawnPhone()
			Global.cutsceneScript:placeChar(self.phone, 44038.9,-29704.7,2508.1, 29,92.1,38.8)
			
		end
        
		--Just in case they were playing from the debug menu
		Global.goalManager:activate('BoydsMind')
		
		-- create the helmet if it hasnt been picked up yet
		if (Global:loadGlobal('bMMCompleted') ~= 1 and 
			Global:load('bSniperSquirtJumpPlayed') == 1 and 
			Global.player:isInInventory('Helmet') ~= 1) then
			
			local helmet = SpawnScript('MM.Props.PropHelmet', 'Helmet', '')
			helmet:setPosition(42921.7, -29806.8, 2366.5)
		end
		
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		
		local emitterMaker = function(ent)
			local emitter = SpawnScript('MM.Effects.DemonFire')
			ent.forceMeshDistribution = 1
			emitter:attach(ent, nil, 1)
			SetEntityDomain(emitter, 'demonDOMAIN')
		end
		iterate('flameFX', emitterMaker)
		
		--kill!
		for i = 1,8 do
			local chopper = FindScriptObject('chopper' .. i)
			if chopper then chopper:killSelf() end
		end
		for i = 1,self.NUM_CHOPPERS do
			local chopper = SpawnScript('MM.Props.Chopper', 'chopper'..i)
			-- Fake like it's paused, to get it to start at a predetermined point.
			chopper.splineSavedT = i/self.NUM_CHOPPERS
			chopper.splineSavedPeriod = 120
			chopper.splineSavedMode = chopper.splineDir
			chopper.splineSavedDir = chopper.splineDir
			chopper.paused = 1
			if Global:load('FirstExitBoyds') == 1 and Global:loadGlobal('bMMCompleted') ~= 1then
				chopper:onRazOutside()
			end
		end
			
		-- run the revisit cutscene if we haven't seen it yet
        if (Global:loadGlobal('bMMCompleted') == 1) then
			if (Global:load('bRevisitIntroMMPlayed') ~= 1) then
				local tCS = {sName='RevisitIntroMM', postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf = self, bEndCutsceneFadesIn = 0}
				Global.cutsceneScript:runCutsceneWithSettings(tCS)
			end
		elseif (Global:load('bSniperIntroPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('SniperIntro', 0, 1, 0, 0, 0)
		end
		
		if (Global.goalManager:isActive('Sewers') == 1) then
			--Set goal as completed first time in sewer.
			Global.goalManager:activate('Assassin')
		end		
	end


	function Ob:getHintResponse()
		if (self.outsideDenMomHouse == 1) then 
			return {
				{voice = "/GLAO021FO/",},--DIALOG=<<Every play doorbell ditch? >>
				{voice = "/GLAO022FO/",},--DIALOG=<<Let\'s make sure we\'re out of sight before she makes it to the door. >>
				{voice = "/GLAO023FO/",},--DIALOG=<<And when she opens it, take her out!>>
			}
		elseif (Global.goalManager:isActive('Assassin') == 1) then 
			return {
				{voice = "/GLAO018FO/",},--DIALOG=<<Looks like they got a sniper. If you time it right, your shield should get you through there.>>
			}
		elseif (self.insideBasement == 1) then 
			return {
				{voice = "/GLAO016FO/",},--DIALOG=<<I can\'t see a thing.>>
				{voice = "/GLAO017FO/",},--DIALOG=<<Try your clairvoyance on those security cameras. I\'ll bet they can see in the dark.>>
			}
		elseif (self.insideGraveyard == 1 and Global.player:isInInventory('Flowers') == 1) then
			if (Global:load('bBramblesBurnPlayed') ~= 1) then
				return {
					{voice = "/GLAO011FO/",},--DIALOG=<<You could probably burn those big vines off that mausoleum.>>
				}
			elseif( Global:load('bCemeteryArrestPlayed') ~= 1 ) then
				return {
					{voice = "/GLAO012FO/",},--DIALOG=<<Lets get inside that mausoleum!>>
				}
			end
		elseif (self.insideArboretum == 1 and Global.player:isInInventory('Flowers') ~= 1) then
			if (Global.player:isInInventory('Feather') == 1) then -- and Global:load('CrowFeatherClairvoyed') ~= 1) then 
				return {
					{voice = "/GLAO010FO/",}--DIALOG=<<If you used clairvoyance on the that crow feather, you might get a birds-eye view of the situation.>>
				}
			else		
				return {
					{voice = "/GLAO009FO/",},--DIALOG=<<Lets search this place for flowers.>>
				}
			end	
		elseif (Global:load('bChopperClairPlayed') == 1) then 
			return {
				{voice = "/GLAO020FO/",}--DIALOG=<<That telephone would be a good disguise for getting up to those phone company wires.>>
			}
		elseif (Global:load('bSniperSquirtJumpPlayed') == 1) then 
			return {
				{voice = "/GLAO019FO/",}--DIALOG=<<Use your clairvoyance on one of those helicopters and we\'ll be able to search for the Milkman from the air.>>
			}
		elseif (Global:load('bClairvoyKeypadPlayed') == 1 and Global:load('bKeypadPuzzleSolved') ~= 1) then
				return {
					{voice = "/GLAO015FO/",}--DIALOG=<<I forgot the combo. If you forgot it too, we\'re going to have to make that G Man come out again.>>
				}
		elseif (Global:load('KeyPadGmanEnteredCode') == 1 and Global:load('bClairvoyKeypadPlayed') ~= 1) then
				return {
					{voice = "/GLAO014FO/",}--DIALOG=<<I\'ll bet if we could see what that G-man sees, we would know the right combination.>>
				}
		elseif (Global:load('bCemeteryArrestPlayed') == 1) then 
			return {
				{voice = "/GLAO013FO/",}--DIALOG=<<We have to find a way through the sewers to the book depository.>>
			}
		elseif (Global.player:isInInventory('Flowers') == 1 ) then 
			return {
				{voice = "/GLAO002FO/",}--DIALOG=<<Lets go to the graveyard!>>
			}
		elseif (Global.player:isInInventory('Flowers') ~= 1 and Global:load('EnteredGraveyard') == 1) then 
				return {
					{voice = "/GLAO005FO/",},--DIALOG=<<Hmmm. Looks like we\'ll need some flowers as a disguise.>>
					{voice = "/GLAO006FO/",},--DIALOG=<<To the Arboretum!>>
					{voice = "/GLAO007RA/", rOwnerOverride = Global.player,},--DIALOG=<<The what?>>
					{voice = "/GLAO008FO/",},--DIALOG=<<The plant place. It\'s like a garden, but more shrubby and scientific.>>
				}
		elseif (Global.player:isInInventory('Sign') == 1) then 
			return {
				{voice = "/GLAO002FO/",}--DIALOG=<<Lets go to the graveyard!>>
			}
		elseif (Global:load('bSignGmenClairvoyanceCluePlayed') == 1 and Global.player:isInInventory('Sign') ~= 1) then 
			return {
				{voice = "/GLAO003FO/",},--DIALOG=<<That is the worst road crew disguise I have ever seen.>>
				{voice = "/GLAO004FO/",},--DIALOG=<<But if it works for them, it should work for us. We just gotta hold up one of those signs.>>
			}
		elseif (Global:loadGlobal('bGotClairvoyance') == 1 and Global:load('bBoydClairPlayed') == 1 ) then 
			return {
				{voice = "/GLAO002FO/",}--DIALOG=<<Lets go to the graveyard!>>
			}
		elseif (Global:loadGlobal('bGotClairvoyance') == 1 and Global:load('bBoydClairPlayed') ~= 1 ) then 
			return {
				{voice = "/GLAO001FO/",}--DIALOG=<<Use you Clairvoyance power on that loony. I\'d like to see what color the sky is in his world.>>
			}
		elseif (Global:loadGlobal('bGotClairvoyance') ~= 1) then 
			return {
				{voice = "/GLAO000FO/",}--DIALOG=<<Open the fridge! Like he said!>>
			}
		else
			return %Ob.Parent.getHintResponse(self)
		end
	end

	function Ob:beforeFridge()
		return IsPowerEnabled(kPOWER_CLAIRVOYANCE) ~= 1
	end
	
	function Ob:beforeClair()
		return Global:load('bBoydClairPlayed') ~= 1
	end
	
	function Ob:beforeCemetery()
		return Global:load('bCemeteryArrestPlayed') ~= 1
	end
	
	function Ob:beforeSewers()
		return Global.player:isInInventory('Plunger') ~= 1
	end
	
	function Ob:beforeSniper()
		return Global:load('bSniperSquirtJumpPlayed') ~= 1
	end
	
	function Ob:beforeChopper()
		return Global:load('bChopperClairPlayed') ~= 1
	end
	
	function Ob:beforeMom()
		return 1
	end
	
	function Ob:revisitingSetup()
		-- kill all rainbow squirts
		foreach_entity_oftype('MM.Characters.CookieSquirt', function(ent) ent:killSelf() end)
		foreach_entity_oftype('MM.Characters.DoorbellSquirt', function(ent) ent:killSelf() end)
		
		-- kill all gmen
        foreach_entity_oftype('MM.Characters.GmanBase', function(ent) ent:killSelf() end)
		
		-- helicopters
		foreach_entity_oftype('MM.Props.Chopper', function(ent) ent:killSelf() end)
        
		-- kill all spy objects
		foreach_entity_oftype('MM.Props.Spies', function(ent) ent:killSelf() end)
		
		-- kill all of the gman props
		foreach_entity_oftype('MM.Props.PropBase', function(ent) ent:killSelf() end)
		
		-- get rid of all of the dotted lines that the gmen use
		foreach_entity_oftype('Global.Props.Geometry', 	function(ent)
															if (strsub(ent.Name, 1, 10) == 'DottedLine') then
																ent:killSelf()
															end
														end)
														
		-- catch all to make sure that the gmen don't try to arrest you
		self.bNoArrests = 1
		
		-- create the milkman and the censor sedan so that they can do battle
		local milkmanLoc = FindScriptObject('RevisitMilkman')
		local milkman = SpawnScript('MM.Characters.Milkman', 'Milkman')
		milkman:setPosition(milkmanLoc:getPosition())
		milkman:setOrientation(milkmanLoc:getOrientation())
		
        local censorSedanLoc = FindScriptObject('RevisitCensorSedan')
		local censorSedan = SpawnScript('MM.Props.CensorSedan', 'CensorSedan')
		censorSedan:setPosition(censorSedanLoc:getPosition())
		censorSedan:setOrientation(censorSedanLoc:getOrientation())
		SnapEntityToGround(censorSedan)

		self:setDomain('DeadBodyGIOS', 1)

		Global:setPlayerRespawnPointName('DenMomLoc')
		--self:setDomain('MMI1', 1)
	end

-- S T A T E S  ***************************************************************

-- ****************************************************************************
	
--    **********************************************************

	--for the SniperSquirtJump cutscene
	function Ob:placeDummiesForSquirtJump()
		self.pilot:makeVisible()
		self.dummyGman1:makeVisible()
		self.dummyGman2:makeVisible()
		self.cookieBomb:makeVisible()
		
		Global.cutsceneScript:placeChar(self.pilot, 43162.6, -30833.9, 454.2,  0, 89.4, 0)
		Global.cutsceneScript:placeChar(self.dummyGman1, 43289.6, -30833.9, 296, 0, 39.2, 0)
		Global.cutsceneScript:placeChar(self.dummyGman2, 43545.6, -30833.9, 512, 0, -128.8, 0)
		
		self.pilot:loadAnim('anims/gman/ArrestSequenceLookDown_Idle.jan', 0, 1)
		self.dummyGman1:loadAnim('anims/gman/ArrestSequenceLookDown_Idle.jan', 0, 1)
		self.dummyGman2:loadAnim('anims/gman/ArrestSequenceLookDown_Idle.jan', 0, 1)
		
		self.cookieBomb:setPosition(43415.5,-30828,421.2)
		self.cookieBomb:setOrientation(0,150,0)
		self.cookieBombFX:setPosition(43415.5,-30828,421.2)
		
		--make choppers invis
		for i = 1,self.NUM_CHOPPERS do
			FindScriptObject('chopper' .. i).chopperMesh:makeInvisible()
		end
	end
	
	--for the SniperSquirtJump cutscene
	function Ob:cookieBombExplode()
		self.cookieBombFX:run()
		self.cookieBomb:makeInvisible()
		FindScriptObject('SniperSquirt'):makeInvisible()
		self.pilot:loadAnim('anims/gman/gman_diebackflip.jan', 0, 0)
		self.dummyGman1:loadAnim('anims/gman/gman_diebackflip.jan', 0, 0)
		self.dummyGman2:loadAnim('anims/gman/gman_diebackflip.jan', 0, 0)
	end
	
	--for the SniperSquirtJump cutscene
	function Ob:resetDummiesForSquirtJump()
		self.pilot:makeInvisible()
		self.dummyGman1:makeInvisible()
		self.dummyGman2:makeInvisible()
		self.cookieBomb:makeInvisible()
		FindScriptObject('SniperSquirt'):makeInvisible()
		--make choppers invis
		for i = 1,self.NUM_CHOPPERS do
			FindScriptObject('chopper' .. i).chopperMesh:makeVisible()
		end
	end	
	
	--for the SniperSquirtJump cutscene
	function Ob:chopperFlyBy()
		SplinePositionAtWaypoint(self.dummyChopper, 0)
	end
	
	function Ob:footfall(foot, runType)
		self:genericFootprint(foot, runType)
	end

--  M E S S A G E S  **********************************************************
	
	function Ob:onEnteredTriggerVolume(tv, from)
		if from ~= Global.player then
			%Ob.Parent.onEnteredTriggerVolume(self, tv, from)
			return
		end
		if tv == 'tv_clairPuzzleSolved' then
			if from == Global.player and Global.player.bClairOn == 1 and Global:load('bCanceledClairOnce') ~= 1 then
				Global:save('bCanceledClairOnce', 1)
				Global.player:cancelClairvoyance()
			end
		elseif tv == 'tv_OutsideDenMomHouse' then
			self.outsideDenMomHouse = 1
		elseif tv == 'tv_DoNotEnterRifle' then
			self.insideSniperArea = 1
		elseif tv == 'tv_Basement' then
			self.insideBasement = 1
		elseif tv == 'tv_Arboretum' then
			self.insideArboretum = 1
		elseif tv == 'tv_BrokenIslandCam' then
			self.insideRoadCrewHint = 1
		elseif tv == 'tv_gravityreset2' then
			Global:save('EnteredGraveyard', 1)
			self.insideGraveyard = 1
		elseif tv == 'tv_insideDepot' then
			self.bCanFindMilkman = 1
		elseif tv == 'tv_squirtenter' then
			self:playVideo('cutScenes/prerendered/mmdm.xmv')
			Global:save('MMDMSeen', 1)
			--Got to the house and got inside
			Global.goalManager:deactivate('Hideout')
			Global.levelScript:loadNewLevel('MMDM')
		elseif strfind(tv, 'tv_PhantomChopper') then
			if Global.cutsceneScript.currCSName ~= 'RespawnScene' and Global.cutsceneScript.currCSName ~= 'FallingDeathScene' then
				Global.cutsceneScript:runCutscene('FallingDeathScene', nil, nil, 0)
		    end
    	elseif tv == 'tv_RazAbduction1' then
			-- DEMON - post plunger abduction
			local done = Global:load('DemonEncounter1Complete')
			local plunger = FindScriptObject('Plunger')
			if (plunger and plunger.bInInventory == 1) and (done ~= 1) then
				Global:save('DemonAbductionLocatorName', 'RazAbduction1')
				Global.cutsceneScript:runCutscene('DemonAbduction', 0, 1, 0, 0, 0)
			end
        	elseif tv == 'tv_RazAbduction3' then
			-- DEMON - post phone abduction
			local done = Global:load('DemonEncounter3Complete')
            		local phone = FindScriptObject('Phone')
			if (phone and phone.bInInventory == 1) and (done ~= 1) then
				Global:save('DemonAbductionLocatorName', 'RazAbduction3')
				Global.cutsceneScript:runCutscene('DemonAbduction', 0, 1, 0, 0, 0)
			end
		elseif tv == 'tv_GoodHole' then
			if Global.cutsceneScript.goodDemonHoleReady == 1 then
				-- DEMON - good demon hole return sequence
				local locatorName = Global:load('DemonAbductionLocatorName')
				if (locatorName == 'RazAbduction1') then
					Global:save('DemonEncounter1Complete', 1)
				--elseif (locatorName == 'RazAbduction2') then
				--	Global:save('DemonEncounter2Complete', 1)
				elseif (locatorName == 'RazAbduction3') then
					Global:save('DemonEncounter3Complete', 1)
				end
       			Global.cutsceneScript:runCutscene('GoodDemonHoleReturn', 0, 1, 0)
			end
        elseif tv == 'tv_squirtjump' then
			if Global:load('bSniperSquirtJumpPlayed') ~= 1 then
				FindScriptObject('SniperSquirt').charName = 'RainbowSquirt_sayline'
				local assassin = FindScriptObject('Assassin')
				if assassin then
					assassin:onOff()
				end
				Global.player:replaceSelectedItemInPsack(1, 1)
				Global.cutsceneScript:runCutscene('SniperSquirtJump')
				Global.goalManager:deactivate('Assassin')
			end
		elseif tv == 'tv_ClairvoyanceClueCS' then
			if Global.player.HeldItem ~= 'Sign' then
				Global.cutsceneScript:runCutscene('SignGmenClairvoyanceClue')
			end
		else
			%Ob.Parent.onEnteredTriggerVolume(self, tv, from)
			-- for demon music
			if tv == 'tv_MOOD_SILENT1' then
				self:overrideTheme('MMDenMother')
			end
		end
	end

	function Ob:onExitedTriggerVolume(tv, from)
		if from == Global.player and tv == 'tv_OutsideDenMomHouse' then
			self.outsideDenMomHouse = 0
		elseif from == Global.player and tv == 'tv_DoNotEnterRifle' then
			self.insideSniperArea = 0
		elseif from == Global.player and tv == 'tv_Basement' then
			self.insideBasement = 0
		elseif from == Global.player and tv == 'tv_DoNotEnterFlowers' then
			self.insideGraveyard = 0
		elseif from == Global.player and tv == 'tv_Arboretum' then
			self.insideArboretum = 0
		elseif from == Global.player and tv == 'tv_BrokenIslandCam' then
			self.insideRoadCrewHint = 0
		elseif from == Global.player and tv == 'tv_insideDepot' then
			self.bCanFindMilkman = 0
			-- for demon music
		elseif from == Global.player and tv == 'tv_MOOD_SILENT1' then
			self:restoreTheme()
		end
		%Ob.Parent.onExitedTriggerVolume(self, tv, from)
	end 
	
-- ****************************************************************************

	function Ob:onCemeteryClue()
		self.insideGraveyard = 0
		Global.cutsceneScript:runCutscene('CemeteryArrest', 0, 1, nil, nil, nil, nil, 1)
	end

-- ****************************************************************************

	--for the cutscene ChopperClair
	function Ob:spawnPhone()
		if (self.bSpawnedPhone ~= 1) then
			self.phone = SpawnScript('MM.Props.PropPhone', 'Phone')
			self.phone:startRing()
			self.bSpawnedPhone = 1
		end
	end

	function Ob:setDomain(name, bAwake)
		%Ob.Parent.setDomain(self, name, bAwake)
		if name == 'basement' then
			--if Global.player.bClairOn == 1 and Global.player.lastClairTarget and Global.player.lastClairTarget.Type == 'MM.Props.Camera' then
			if bAwake == 1 then
				SetDynamicLightIntensity(.2)
				SetStaticLightIntensity(0)
				SetDistanceFogEnable(0)
				if (Global.camControl) then
					Global.camControl:setSecondaryTarget(FindScriptObject('camera1'), nil, 0)
				end
			else				
				SetDynamicLightIntensity(1)
				SetStaticLightIntensity(1)
				SetDistanceFogEnable(1)
				if (Global.camControl) then
					Global.camControl:setSecondaryTarget(nil)
				end
			end
		end
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		kTRIGGERSURFACE_SEWAGE = 10

	end

	function Ob:setupRailslides()
		for iTable = 1,getn(g_MMI1_RailTransitions) do
			local transition_table = g_MMI1_RailTransitions[iTable]

			-- first pair in table is the names of the two railslides
			local rail_left = FindScriptObject(transition_table[1][1])
			local rail_right = FindScriptObject(transition_table[1][2])
			if not rail_left or not rail_right then
				GamePrint(TT_Warning, format('Can\'t find railslide %s or %s',
											 (transition_table[1][1]),
											 (transition_table[1][2])))
			else
				rail_left:resetTransition()
				rail_right:resetTransition()
				for iTime = 2,getn(transition_table)-1 do
					local tCur = transition_table[iTime]
					local tNext = transition_table[iTime+1]
					RailAddTransition(rail_left, tCur[1], tNext[1],
									  rail_right, tCur[2], tNext[2])
				end
			end
		end
		g_MMI1_RailTransitions = nil	-- let it get collected
	end

	return Ob
end

-- The numbers were generated by flying around with the camera
-- and using this bit of .lua (put in your user.lua).
--
-- gDebugDigital[JOY_POV_W] = function() examineRails() end
-- function examineRails()
-- 	   local x,y,z = GetCameraPosition()
-- 	   Rail_ShowClosestPoints(x,y,z, 'splRail2', 'splRail3')
-- end
-- 
-- You get output that looks like
-- 1: dist 1020.6   t 0.0   name splRail2
-- 2: dist 855.3   t 0.0   name splRail3
--
-- Take the "t" values and plug them into the following table.
--
-- When you want to test this out, copy MMI2.lua over to the xbox
-- Execute the following in nettest:
-- reload('mm.MMI2')
-- Global.levelScript:setupRailslides()
g_MMI1_RailTransitions = {
	{ 
		{ 'splRailrail4_f', 'splRailrail3_f' },
		{     12811.0,     12968.0 },
		{      10205,         10378},
		{       0,             0 },
	},
	{
		{ 'splRailrail1_f', 'splRailrail2_f' },
		{     86597.1,     85559.6 },
		{     79607.1,     78560.3 },
		{     77203.2,     76323.5 },
		{     73865.4,     73473.4 },
		{     71742.7,     71322.6 },
		{     67695.3,     67088.3 },
		{     58676.3,     58124.5 },
		{     55628.7,     55574.7 },
		{     48356.0,     48583.9 },
		{     44216.8,     43864.3 },		
		{     31856.4,     31852.7 },
		{     28169.3,     28695.6 },
		{     25019.5,     25615.4 },
		{     21784.7,     21625.7 },
		{     16011.1,     15591.4 },
		{     11684.6,     11531.7 },
		{     6543.1,      6774.3 },
		{     4475.4,      4538.6 },
		{       0,             0 },
				
	},
}

