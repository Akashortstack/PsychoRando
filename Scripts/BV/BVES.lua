function BVES(Ob)
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			textures = { 
				'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep1.tga',
				'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep2.tga',
				'Textures/UI/Sayline Heads/BVraz.dds',
			},
			scripts = {
				'BV.Characters.PokerPainter',
				'BV.Effects.CardTornadoFX',
				'BV.Effects.BullTornadoFX',
				'BV.Props.MagicPainting',
				'BV.Props.Rose',
			},
			animations = { 
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/BodyParts/LookUp_headJA_1.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/KnockDownFront_start.jan',
				'Anims/DartNew/KnockDown_end.jan',
				'Anims/DartNew/KnockDown_loop.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Raz_RideBull.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/Somersault.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/cardamazed.jan',
				'anims/dartnew/givecard.jan',
				'anims/dartnew/givecard_idle.jan',
				'anims/llll_fern1/llll_fernshake.jan',
			},
		}


		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.levelType = 'mental'
		Ob.rCardHouse = nil
		Ob.rEdgar = nil
		Ob.rBVTheme = nil
		Ob.rLampita = nil
		Ob.rLampitaCam = nil
		Ob.player = nil
		Ob.Fountain1SoundLocator = nil
		Ob.Fountain2SoundLocator = nil
		Ob.CardSoundLocator = nil
		Ob.EyeSoundLocator = nil
		Ob.cardStack = nil
		Ob.endLevelTV = 'tv_BVLLEndLevelTrigger'
		Ob.TIMER_START_BULL = '7001'
		Ob.ledgeDirtEmitterName = 'BV.Effects.BVLedgeDirtFX'
		Ob.trampolineVFX = 'Global.Effects.BVRaz.BVBounceWooshFX'

		Ob.leftFootPaintTexture = 'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep1.tga'
		Ob.rightFootPaintTexture = 'Textures/LevelTextures/BV_BlackVelvetopia/BV_raz_footstep2.tga'

		Ob.paintingVFXOffsets = 
		{
			LoadBVRBPainting = {x=0, y=300, z=200},
			LoadBVRBPaintingSwirl = {x=0, y=0, z=0},
			DragonPainting = {x = 0, y = 300, z = 200},
			EaglePainting = {x = 0, y = 300, z = 200},
			DragonPaintingSwirl = {x = 0, y = 0, z = 0},
			EaglePaintingSwirl = {x = 0, y = 0, z = 0},
			CobraPainting = {x = 0, y = 300, z = 200},
			TigerPainting = {x = 0, y = 300, z = 200},
			CobraPaintingSwirl = {x = 0, y = 0, z = 0},
			TigerPaintingSwirl = {x = 0, y = 0, z = 0},
		}

		Ob.defaultAmbientSoundName = 'BVAmb'
		Ob.theme = 'BlackVelvetopia'
	end
	
	function Ob:onBeginLevel()
		--Player must have completed at least up to MM
		--Global:setLevelToCompleted('MM')

		%Ob.Parent.onBeginLevel(self)
		--SetLightRadius(FindLight(FindScriptObject('Bull1'), 'pointLight1'), 2500)

		-- We have to remember to reload the correct mesh when we exit the level
		LoadNewPlayerMesh('characters/bv_raz.plb')
		SetShadowColor(0, 0, 0, 0.5)
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)
		SetEntityFlag(Global.player, ENTITY_LIT_SHADOW, 1)

		--get necessary references
		self.rEdgar = FindScriptObject('Edgar1')
		self.rLampita = FindScriptObject('BVLL_Flamenco')
		self.rFountainSound = LoadSound('Fountain')		
		self.rEyeSound = LoadSound('portrait_ethereal_melody')		
		self.rCardSound = LoadSound('cards_fly_lp')		
		self.rWindSound = LoadSound('wind_eerie_lp')
		self.levelScript = FindScriptObject('LevelScript')
		if (Global:loadGlobal('bBVCompleted') ~= 1) then
			self.rBullController = FindScriptObject('BullController')
		end
		self.charItemMatrix = SpawnScript('BV.BVCharItemMatrix','CharItemMatrix','',1)
		FadeToColor(0,0,0,0,0, 0,0,0,255,0, 0)
		
		RegisterTriggerVolume(self, self.endLevelTV)
		
		-- only want house of cards to show up before edgar plays his cut scene
		--if 0 and Global.player.saved.BVINSeen ~= 1 then
		--	local hocLoc = FindScriptObject('HOC1')
		--	local lx,ly,lz
		--	lx,ly,lz = hocLoc:getPosition()
		--	self.cardStack = SpawnScript('BV.Props.CardStack','CardStack','', 1)
		--	self.cardStack:setPosition(lx,ly,lz)
		--	lx,ly,lz = hocLoc:getOrientation()
		--	self.cardStack:setOrientation(lx,ly,lz)
		--else
			local cs=FindScriptObject('CardStack', 1)
			if cs then
				SetEntityVisible(cs,0)
			end
--			local hocLoc = FindScriptObject('HOC1')
--			if hocLoc then 
--				SetEntityVisible(hocLoc,0)
--			end				
		--end

		--initialize the journal if it's not set up
--		if (not Global.player.saved.BV.journal) then
--			Global.player.saved.BV.journal = {}
--		end
		--create the first entry if it's not there
--		if (not Global.player.saved.BV.journal['GoalLiberateEdgar']) then
--			Global.player.saved.BV.journal['GoalLiberateEdgar'] = JournalAddGoal('Liberate Edgar\'s mind.')
--			Global.player.saved.BV.journal['Return Cards'] = JournalAddGoal('Return the 4 queens to Edgar.')
--		end

		--Try to match BVRB's fog, see how that looks...
		SetDistanceFogEnable(1)
		SetDistanceFogColor(0.15,0,0.4)
		SetDistanceFogRange(200, 20000)
		
		self.Fountain1SoundLocator = FindScriptObject('Fountain1SoundLocator')
		self.Fountain2SoundLocator = FindScriptObject('Fountain2SoundLocator')
		self.CardSoundLocator = FindScriptObject('CardSoundLocator')
		self.EyeSoundLocator = FindScriptObject('EyeSoundLocator')

		if (Global:loadGlobal('bBVCompleted') ~= 1) then
			fso('pokertable'):hide()
			-- make lampita cry
			if (self.rLampita ~= nil) then
				self.rLampita:setNewAction('Cry')
			end
			self:createTimerSecs(10, self.TIMER_START_BULL)	
		else
			SetCurrentCamera(1)
			Global.cutsceneScript:cutTo(-2759,282,-1493, -3,-21,0)
			SetCurrentCamera(0)
			
			local petals = FindScriptObject('fallingpetals')			
			if petals then
				petals:stop()
				petals:killSelf()
			end
			
			--set up the dogs
			self.collie = SpawnScript('BV.Characters.PokerPainter', 'Collie', 'self.painterType=\'collie\'')
			self.dalmation = SpawnScript('BV.Characters.PokerPainter', 'Dalmation', 'self.painterType=\'dalmation\'')
			self.stBernard = SpawnScript('BV.Characters.PokerPainter', 'StBernard', 'self.painterType=\'stbernard\'')
			self.bullDog = SpawnScript('BV.Characters.PokerPainter', 'BullDog', 'self.painterType=\'bulldog\'')
		end

		if (Global:loadGlobal('bBVCompleted') == 1 and Global:load('bReentryIntroPlayed') ~= 1) then
			local tCS = {postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf=self, bEndCutsceneFadesIn = 0, sName = 'ReentryIntro'}
			Global.cutsceneScript:runCutsceneWithSettings(tCS)
		elseif Global:load('PaintingEntered') then
			Global.cutsceneScript:runCutscene('ReturnToHook', nil, 1,0)
		elseif (Global.player.saved.BV.returnedFromPainting == 'LoadBVESPainting') then
			self:setState('ReturnedFromBVRBEndPainting')
		else
			self:setState(nil)
			FadeToColor(0,0,0,255,0, 0,0,0,0,0, 1)		
			foreach_entity_oftype('BV.Props.LevelLoadPainting', function(ent) ent.bCanLoad = 1 end)
		end

		--edit spawn BVItemPlacer
		self.itemPlacer = SpawnScript('BV.BVItemPlacer', 'BVItemPlacer')
		

		self.rTornadoSoundHandle = LoadSound('Tornado')
		Global.player.charName = 'BVraz'
	end

	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		--edit
		self.itemPlacer:wrestlerChecks()
		
		if self.Fountain1SoundLocator then
			self.Fountain1SoundLocator:playSound(self.rFountainSound)
		end
		if self.Fountain2SoundLocator then
			self.Fountain2SoundLocator:playSound(self.rFountainSound)
		end

		if (Global:loadGlobal('bBVCompleted') ~= 1) then
			-- place the card flying fx
			self.CardTornadoFX = SpawnScript('BV.Effects.CardTornadoFX', 'CardTornadoFX')
			self.CardTornadoFX:run(0, 0, 0)
			-- create the bull tornado fx
			self.BullTornadoFX = SpawnScript('BV.Effects.BullTornadoFX', 'BullTornadoFX')
		end


		if (self.waterFXManager) then
			self.waterFXManager:changeSplashSound('FS_Puddle_Land')
		end
		
	end

	function Ob:onEndLevel(bDestroyed)
        -- Restore the regular player mesh
		LoadNewPlayerMesh('characters/dartnew.plb')
		Global.player.charName = 'Raz'
		
		%Ob.Parent.onEndLevel(self, bDestroyed)
	end
	
	function Ob:stateCleanupCSTowerDone()		
		--self:setState('PlayBVOT')		
		UnLoadPriorityAnim(Global.player, 1, 0.2)
		Global.player:setPosition(-49.3, -7.6, -554.6)
		Global.player:setOrientation(0, -23, 0)
		MoveCameraToIdeal()
		self:setState(nil)
	end

	
	function stateGiveCardCutscene()
		self:beginCutscene('GiveCard')
		self:endCutscene('GiveCard')
	end

	function Ob:statePlayBVOT()
		RumbleLeft( 0, 0, 0)
		RumbleRight( 0, 0, 0)		
		self:killTimer(self.TIMER_START_BULL)
		self:stopLevelTheme()
		self:playVideo('cutScenes/prerendered/bvot.xmv')
		--Global:saveGlobal('bBVCompleted',1)
		self:loadNewLevel('BVMA')
		--if (self.demoLevel == 1) then 
--			FadeToColor(0,0,0,255, '',0,0,0,255, '',1)
--			self:dontRunPlayerControls(1)
--			self:sleep(1)
--			FadeToColor(0,0,0,255, '',0,0,0,255, 'Textures/MenuUI/Loading_screens/bvrb_END.tga',2)
--			self:sleep(4)
--			ReturnToStartMenu()
		--[[
		else
			--this should really load the bullfight level
			Global.levelScript:loadNewLevel('ASCO',0,1)
		end]]--
        self:setState(nil)
	end
	
	function Ob:onEnteredTriggerVolume(data, from)
		if data == self.endLevelTV and from == Global.player then
			if (self.state_name ~= 'PlayBVOT') then
				self:setState('PlayBVOT')
			end
			
		end
	end

	function Ob:onTimer(data,from) 		   
   		if data == self.TIMER_START_BULL then
			if (self.rBullController and self.rBullController.bReset ~= 1 and self.rBullController.bConfused ~= 1) then
				self.rBullController:startBulls()
			end
		else
			%Ob.Parent.onTimer(self, data)
		end		
	end

	function Ob:onBullSplinePointArrive(value)
		if (value and self.BullTornadoFX) then
			if (value == '2') then
				self.BullTornadoFX:run(0, 0, 0)
				self.BullTornadoFX:playSound(self.rTornadoSoundHandle)
			elseif (value == '12') then
				self.BullTornadoFX:stop()
				self.BullTornadoFX:stopSound(self.rTornadoSoundHandle)
			end
		end
	end
	
	return Ob
end
