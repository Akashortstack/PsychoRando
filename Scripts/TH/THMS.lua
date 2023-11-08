function THMS(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = {
				'TH.Props.Megaphone',
			},
			animations = {
				'Anims/Becky/GetScript.jan',
				'Anims/Becky/TalkintoEarpiece.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_Candle_spineJA_1.jan',
				'Anims/DartNew/BodyParts/Hold_Scripts_spineJA.jan',
				'Anims/DartNew/BodyParts/Hold_TH_Megaphone.jan',
				'Anims/DartNew/CantBkwdPoses.jan',
				'Anims/DartNew/CantFwdPoses.jan',
				'Anims/DartNew/CantShimmyLeft.jan',
				'Anims/DartNew/CantShimmyRight.jan',
				'Anims/DartNew/Cantbreathe.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageFront_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/Pack/pack_closing.jan',
				'Anims/DartNew/Pack/pack_opening.jan',
				'Anims/DartNew/PsiGrab_armJALf_1.jan',
				'Anims/DartNew/PsiGrab_armJARt_1.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/RailSlide45angle.jan',
				'Anims/DartNew/RailSlideUphill.jan',
				'Anims/DartNew/Talk_3.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/walkmove.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/Flowers/Act3_loop.jan',
				'Anims/Flowers/Act3_start.jan',
				'Anims/Jasper/BreathIdle.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/Thistles/Act2_end.jan',
				'Anims/Thistles/Act2_loop.jan',
				'Anims/Thistles/Act2_start.jan',
				'Anims/Thistles/Act3_end.jan',
				'Anims/Thistles/Act3_loop.jan',
				'Anims/Thistles/Act3_start.jan',
				'Anims/Thistles/ThistleTalk.jan',
				'Anims/th_Theater/DaynightSwitch/close.jan',
				'Anims/th_Theater/DaynightSwitch/happy.jan',
				'Anims/th_Theater/DaynightSwitch/sad.jan',
				'Anims/th_Theater/DragonFireIdle.jan',
				'Anims/DartNew/BalloonMount.jan',
				'Anims/DartNew/BalloonSpeedMount.jan',
				'Anims/DartNew/BubbleJump.jan',
				'Anims/DartNew/CantHandStandTurn.jan',
				'Anims/DartNew/ClimbLedge.jan',
				'Anims/DartNew/DoubleJump.jan',
				'Anims/DartNew/Firestart_end.jan',
				'Anims/DartNew/Firestart_loop.jan',
				'Anims/DartNew/LadderDismount.jan',
				'Anims/DartNew/LedgeJangle.jan',
				'Anims/DartNew/PsiBlast_HeadButt.jan',
				'Anims/DartNew/cantdismountfwd.jan',
				'Anims/DartNew/hop.jan',
				'Anims/DartNew/ladderStop.jan',
				'Anims/DartNew/ladderUp.jan',
				'Anims/DartNew/standready.jan',
				'Anims/Thought_Bubble/BallMount.jan',
				'Anims/Thought_Bubble/BubbleDoubleJump.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'Anims/Thought_Bubble/PsiFloatBubblePop.jan',
				'anims/DartNew/180.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/LongJump_OnFire.jan',
				'anims/DartNew/Run_OnFire.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnLfCycle.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/Idle_BowAndWave.jan',
				'anims/th_theater/dragonclose.jan',
				'anims/th_theater/dragonopen.jan',
				'anims/th_theater/knight.jan',
				'anims/th_theater/knightidle.jan',
				'anims/dartnew/CrawlOutOfWater.jan',
				'anims/dartnew/WaterHandsGrab.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dusterretract.jan',
				'anims/objects/duster/dustershoot.jan',
				'anims/th_theater/costumerack.jan',
				'anims/th_theater/OrchestraBounce.jan'
			}
		}	
		
		Ob.currSet = nil    --1,2,3
		Ob.bNight = nil  	--0,1  (day,night)
		Ob.DAY = 0
		Ob.NIGHT = 1

		Ob.activationTime = 2 --seconds	it takes for setpiece to come up, or down
		Ob.inactiveHeight = 2000  -- the height it will rise to when not active
		
		Ob.bCanSwitch = 1
        Ob.ledgeDirtEmitterName = 'TH.Effects.THLedgeDirtFX'
		
		--night actors
		Ob.numThistles = 3     --in the pool
		Ob.numHounds = 3
		Ob.numHarpies = 2
	
		--day actors
		Ob.numFlowers = 3     --in the pool
		Ob.numPuppies = 2
		Ob.numBirdies = 2
		
		Ob.numTrapDoors = 10

		--Ob.theme = 'HagathasHome'

		Ob.bCheckForCombatMood = 0

		Ob.tMusicFader = {
			tv_MOOD_MEDIUM1 = 'MediumMood1Fader',
			tv_MOOD_COMBAT1 = 'CombatMood1Fader',
			tv_MOOD_COMBAT2 = 'CombatMood2Fader',
		}

		Ob.defaultAmbientSoundName = 'THAmb'
	end

--********************************************************************************					

	function Ob:onSpawn()
		self.specialActors = {} -- Table storing named actors.  HeadThistle, SqueakyFlower, etc.
		
		self.sets =  { {},  {}, {} }		
		self.figDomains =  { {},  {}, {} }
		-- All the positions of each actor during each day/night combo.
		-- If you specify a key (HeadFlower =), you need to make sure that actor is created in xCreateSpecialActors.
		-- If you specify a key, you can refer to the actor by that name in the cutscene tool.  Otherwise, there's
		-- pretty much no way to refer to it.  Eventually all of them will need keys, but we don't have enough dialog
		-- yet to do that.
		--
		-- NOTE: Each cutscene on a set currently needs to use the same group of actors.  This may change, pending dialog.
		self.introActorPositions = 
		{
		day = {
			{ -- 1
				-- This one has the correct positions for Maypole cutscene.
				flowers = {
				-- ***** X, Y, Z, Pi, Ya, Ro, function name to execute after arrival, argument to pass to function.
					HeadFlower = { 190, 12,467, 0, 158.1125, 0 , 'setState', 'Maypole' }, 
					SqueakyFlower = { 218, 12, 227, 0, -151.1377, 0 , 'setState', 'Maypole'}, 
					FroggyFlower = { 277, 12, 352, 0, -175.9503, 0 , 'setState', 'Maypole'}, 
				},
				puppies = {
					PetPuppy = {-396.3, 11.1, 43.7, 0, -172.2, 0},
				},
				birdies = {
					Birdie1 = {-461.36, 12.66, 44.42, 0, 180, 0},
					Birdie2 = {-254, 400, 127, 0, 180, 0},
				},
			}, 
			{ -- 2
				flowers = {
					HeadFlower = {336.9, -3.6, 91.2, 0, -172.2, 0, nil, nil},
					SqueakyFlower = {-9.2, -1.1, -426.4, 0, -172.2, 0, nil, nil},
					FroggyFlower = {-297.9, -2.7, 19, 0, -172.2, 0, nil, nil},
				},
				puppies = {
					PetPuppy = {307.4, 240, 806.9, 0, -172.2, 0},
					UnknownPuppy = {-642.0, 16.7, -441.0, 0, -172.2, 0},					
					--UnknownPuppy = {-177.2, 120.7, 826.9, 0, -172.2, 0},
				},
				birdies = {
					Birdie1 = {559, 400, 191, 0, 180, 0},
					Birdie2 = {-254, 400, 127, 0, 180, 0},
				},
			},
			{ -- 3
				flowers = {
					HeadFlower = {336.9, -3.6, 91.2, 0, -172.2, 0, nil, nil},
					SqueakyFlower = {-9.2, -1.1, -426.4, 0, -172.2, 0, nil, nil},
					FroggyFlower = {-297.9, -2.7, 19, 0, -172.2, 0, nil, nil},
				},
				puppies = {
					PetPuppy = {452.6, 4, -24.5, 0, -172.2, 0},
					--PetPuppy = {307.4, 119.8, 806.9, 0, -172.2, 0},
					UnknownPuppy = {-570.3, 4, -56, 0, -172.2, 0},
					--UnknownPuppy = {-177.2, 120.7, 826.9, 0, -172.2, 0},
				},
				birdies = {
					Birdie1 = {-59, 400, 191, 0, 180, 0},
					Birdie2 = {-254, 400, 127, 0, 180, 0},
				},
			},
		},
		night = {
			{ -- 1
				-- This one has the correct positions for Hagatha Home cutscene.
				-- You can change it if they're different in the intro CS, since the cutscene places them properly before it plays.
				thistles = {
					HeadThistle = {80.2302, 50.2042, 710.514, 0, 175.0, 0, nil, nil},
					SqueakyThistle = {222.4, 50, 238.9,0, -99.2, 0, nil, nil},
					FroggyThistle = {56.1, 50, 296, 0, 128.4, 0, nil, nil},
				},
				hounds = {
					PetHound = {449.1, 158.4, 883.6, 0, -140.1, 0},
				},
				harpies = {
				},
			},
			{ -- 2
				thistles = {
					HeadThistle = {336.9, 50, 91.2, 0, -172.2, 0, nil, nil},
					SqueakyThistle = {-9.2, 50, -426.4, 0, -172.2, 0, nil, nil},
					FroggyThistle = {-297.9, 50, 19, 0, -172.2, 0, nil, nil},
				},
				hounds = {
					PetHound = {307.4, 119.8, 806.9, 0, -172.2, 0},
					UnknownHound = {-369, 10, -249, 0, -172.2, 0},
					--UnknownHound = {-177.2, 120.7, 826.9, 0, -172.2, 0},
				},
				harpies = {
					Harpie1 = {-724,376,306, 0,180,0},
					Harpie2 = {153,930,740, 0,180,0},
					--{-59, 400, 191, 0, 0, 0},
					--{-254, 400, 127, 0, 0, 0},
				},
			},
			{ -- 3
				thistles = {
					HeadThistle = {336.9, 50, 91.2, 0, -172.2, 0, nil, nil},
					SqueakyThistle = {-9.2, 50, -426.4, 0, -172.2, 0, nil, nil},
					FroggyThistle = {-297.9, 50, 19, 0, -172.2, 0, nil, nil},
				},
				hounds = {
					PetHound = {647,21,251, 0, -172.2, 0},
					UnknownHound = {-492,21,251, 0, -172.2, 0},
					--PetHound = {307.4, 119.8, 806.9, 0, -172.2, 0},
					--UnknownHound = {-177.2, 120.7, 826.9, 0, -172.2, 0},
				},
				harpies = {
					Harpie1 = {-582,944,1209, 0,180,0},
					Harpie2 = {-76,635,143, 0,180,0},
					--{-59, 400, 191, 0, 0, 0},
					--{-254, 400, 127, 0, 0, 0},
				},
			},
		},
		}		

		-- A list of properties for special actors.
		self.specialActorConstants = {
			--Thistles
			HeadThistle = { 
				type = 'TH.Characters.Thistle',
				scriptObject = 'thistle2', 
				scale = { x=1.8, y=2.4, z=1.8 }, 
				collision = { { y=50, radius=50 }, { y=150, radius=50 } }
			},
			FroggyThistle = { 
				type = 'TH.Characters.Thistle',
				scriptObject = 'thistle1', 
				scale = { x=2.2, y=1.6, z=2.2 }, 
				collision = { radius = 60 } 
			},
			SqueakyThistle = { 
				type = 'TH.Characters.Thistle',
				scriptObject = 'thistle0', 
				scale = { x=1.2, y=1.2, z=1.2 }, 
				collision = { radius = 40 } 
			},
			
			HeadThistleDummy = { 
				scriptObject = 'thistle2dummy', 
				scale = { x=1.8, y=2.4, z=1.8 }, 
				collision = { { y=50, radius=50 }, { y=150, radius=50 } },
				type = 'TH.Characters.DummyActor'
			},
			FroggyThistleDummy = { 
				scriptObject = 'thistle1dummy', 
				scale = { x=2.2, y=1.6, z=2.2 }, 
				collision = { radius = 60 },
				type = 'TH.Characters.DummyActor'
			},
			SqueakyThistleDummy = { 
				scriptObject = 'thistle0dummy', 
				scale = { x=1.2, y=1.2, z=1.2 }, 
				collision = { radius = 40 },
				type = 'TH.Characters.DummyActor'
			},

			--Flowers
			HeadFlower = { 
				type = 'TH.Characters.Flower',
				scriptObject = 'flower2', 
				scale = { x=1.8, y=2.4, z=1.8 }, 
				collision = { { y=50, radius=50 }, { y=150, radius=50 } } ,
				maypoleRadius = 175,
				texture = 'Textures/Characters/Flower/BlueFlower.dds',
				charName = 'flower'
			},
			FroggyFlower = { 
				type = 'TH.Characters.Flower',
				scriptObject = 'flower1', 
				scale = { x=2.2, y=1.6, z=2.0 }, 
				collision = { { y=50, radius=50 }, { y=150, radius=50 } } ,				
				maypoleRadius = 200,
				texture = 'Textures/Characters/Flower/OrangeFlower.dds',
				charName = 'flower_orange'
			},
			SqueakyFlower = { 
				type = 'TH.Characters.Flower',
				scriptObject = 'flower0', 
				scale = { x=1.2, y=1.2, z=1.2 }, 
				collision = { { y=50, radius=50 }, { y=150, radius=50 } } ,
				maypoleRadius = 175,
				texture = 'Textures/Characters/Flower/PinkFlower.dds',
				charName = 'flower_pink'
			},
			--hounds
			PetHound = { 
				type = 'TH.Characters.Hound',
				scriptObject = 'hound0', 
			},
			UnknownHound = { 
				type = 'TH.Characters.Hound',
				scriptObject = 'hound1', 
			},
			DummyHound = { 
				type = 'TH.Characters.Hound',
				scriptObject = 'hound2', 
			},
			--puppies
			PetPuppy = { 
				type = 'TH.Characters.Puppy',
				scriptObject = 'puppy0', 
			},
			UnknownPuppy = { 
				type = 'TH.Characters.Puppy',
				scriptObject = 'puppy1', 
			},
			--harpies
			Harpie1 = { 
				type = 'TH.Characters.Harpie',
				scriptObject = 'harpie0', 
			},
			Harpie2 = { 
				type = 'TH.Characters.Harpie',
				scriptObject = 'harpie1', 
			},
			--birdies
			Birdie1 = { 
				type = 'TH.Characters.Birdie',
				scriptObject = 'birdie0', 
			},
			Birdie2 = { 
				type = 'TH.Characters.Birdie',
				scriptObject = 'birdie1', 
			},
		}
						
		%Ob.Parent.onSpawn(self)
	end
																				  
	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('MM')
		%Ob.Parent.onBeginLevel(self)

		self.trapDoors = self:getPool('TH.Props.TrapDoor')
		self.trapDoors:setLowerLimit(self.numTrapDoors)

		self:xCreateSpecialActors()
		
		SetRenderSplineThickness(7)		
		self.rotateFX = SpawnScript('TH.Effects.StageRotatePoofFX', 'RotateFX')
		self.switchFX = SpawnScript('TH.Effects.SetPlunkPoofFX', 'SwitchFX')

		AddExtraRazIdle('Idle_BowAndWave',1)
		self.dayLight = FindLight(nil, 'DayLight1')
		SetLightBrightness(self.dayLight, 1, 0)
		
		-- so that raz is able to talk to jasper
		SetPlayerLookBox(1000, 1000)
		
		-- for cloud car hint
		RegisterTriggerVolume(self, 'tv_CloudCarHint', 0)
		RegisterTriggerVolume(self, 'tv_BonitaRoomCam', 0)
		self.rMoveSoundHandle = LoadSound('SetMove')
		self.rLandSoundHandle = LoadSound('SetLand')
		self.laughSound = LoadSound('LaughTrack')

		Global.player:addSpamListener('RazRespawn', self)
		
		DomainSleep('Set1dayFigmentDOMAIN', 1)
		DomainSleep('Set1nightFigmentDOMAIN', 1)
		DomainSleep('Set2dayFigmentDOMAIN', 1)
		DomainSleep('Set2nightFigmentDOMAIN', 1)
		DomainSleep('Set3dayFigmentDOMAIN', 1)
		DomainSleep('Set3nightFigmentDOMAIN', 1)
		
		
		if (Global:load('StorageRoomDoorOpened') ~= 1) then
			SetSwitchableCollisionEnable(1,1)
		end
		--FindScriptObject('ArclampCam'):turnOff()
	end
	
	function Ob:revisitingSetup()
			--Don't need bonita
			FindScriptObject('Bonita'):killSelf()
			
			--Don't need jasper, but need to put a new chair there, since it's part of his model
			local jasper = FindScriptObject('Jasper')
--			local jasperSeat = SpawnScript('Global.Props.Geometry', 'JasperSeat', 'self.meshName=\'xxx\'')
--			jasperSeat:setPosition(jasper:getPosition())
--			jasperSeat:setOrientation(jasper:getOrientation())
			jasper:killSelf()
			
			--Don't want his camera either
			FindScriptObject('JasperCam'):killSelf()
	end
	
--********************************************************************************					

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		--self.switch = FindScriptObject('DayNightSwitch')
		
		self.enterLeft2 = FindScriptObject('enterLeft2')
		self.enterLeft3 = FindScriptObject('enterLeft3')
		self.enterRight1 = FindScriptObject('enterRight1')
		self.enterRight2 = FindScriptObject('enterRight2')
		
		if (Global:load('bHasScript_KnightOfJoy') ~= 1) then
			local scriptKnightOfJoy = FindScriptObject('Script_KnightOfJoy')
			scriptKnightOfJoy:beNotPickupable()
			SetEntityVisible(scriptKnightOfJoy, 0)
		end
		self.setArch1Right = FindScriptObject('SetArch1Right')
		self.setArch2RightTop = FindScriptObject('SetArch2RightTop')
		self.setArch2Left = FindScriptObject('SetArch2Left')
		self.setArch3Left = FindScriptObject('SetArch3Left')
		self.dragon = FindScriptObject('Dragon')
		self.cloudCar = FindScriptObject('CloudCar')
		self.boat = FindScriptObject('Boat')
		self.mayPole = FindScriptObject('Maypole')
		
		for i = 1,3 do 
			self.sets[i][self.DAY] = FindScriptObject('Set' .. i .. 'day')				   
			self.sets[i][self.NIGHT] = FindScriptObject('Set' .. i .. 'night')				   
			self.figDomains[i][self.DAY] = 'Set'..i..'dayFigmentDOMAIN'
			self.figDomains[i][self.NIGHT] = 'Set'..i..'nightFigmentDOMAIN'
		end
		
		RegisterTriggerVolume(self,'tv_MainStage')
		RegisterTriggerVolume(self,'tv_BackStage')
		
		self.daySwitch = FindScriptObject('DaySwitch')
		self.razPull = SpawnScript('TH.Props.RazPull', 'RazPull')		
				
		self.propSwitchFX = Global.levelScript:getPool('TH.Effects.StageStuffPoofFX')
		self.stageCam = FindScriptObject('stageCam')
				
		--Need some postBeginLevel revisiting garbage
		if (Global:loadGlobal('bTHCompleted') == 1) then
			--Put the candle in the lamp
			--edit here for post-TH fix?
			local candle = SpawnScript('TH.Props.Candle', 'Candle')
			local arcLamp = FindScriptObject('DaySwitch')
			arcLamp:attachCandle(candle)
			self:setState('Revisit')
		else
			self:setupSets()
			if (Global:load('bTHIntroPlayed') ~= 1) then
				Global.cutsceneScript:runCutscene('THIntro')
				Global.goalManager:activate('CureBonita')
				Global.goalManager:activate('ConvinceBonita')
			end
		end
		self:setMusicMood(self.iCurrMood)
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		ClearExtraRazIdles()
	end

--********************************************************************************					

	function Ob:setupSets()
		local initSet = Global:load('THMSCurrSet')
		local initbNight = Global:load('THMSCurrNight')

		if (initSet and initbNight) then
			DomainSleep(self.figDomains[initSet][initbNight], 0)
			self:switchSet(initSet, initbNight, 1,1)
			FindScriptObject('BonitaDoor'):open()
			self.stageCam:turnOn()
		else
			self.stageCam:turnOff()
		end

		if (initSet) then
			if (initbNight == 1) then
				self:setLevelTheme('HagathasHome')
			else
				self:setLevelTheme('HappyFlowers')
			end
		end
	
	end

--********************************************************************************					

	function Ob:stateRevisit()
		if (Global:load('bTHRevisitPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('THRevisit', 1, 1)
		end
		self:setupSets()	 --this will set the state to switchset while the revisit hint plays
		self:runRevisitHint()
	end

--********************************************************************************					

	--nil,nil means turn off all sets
	function Ob:switchSet(set, bNight, bImmediate, bSkipIntro)
		if (self.bCanSwitch == 1 
				and ((set and bNight) or (not set and not bNight))
				and set >= 1 and set <= 3 
				and bNight >= 0 and bNight <= 1) then    --if one arg is nil and the other is not, then dont do anythin

			if( set and bNight ) then
				Global:save('bSwitchedSets', 1)
			end

			self.bCanSwitch = 0
			self.nextSet = set
			self.nextbNight = bNight
			self.bImmediate = bImmediate or 0
			self.bSkipIntro = bSkipIntro or 0
			self:setState('SwitchSet')
		else 
			GamePrint('ERROR: invalid arguments to switchSet( ' .. (set or 'nil') .. ', ' .. (bNight or 'nil') .. ')')
		end
	end

	function Ob:stateSwitchSet()
		if (self.currSet and self.bNight) then 
			self:playSound(self.rMoveSoundHandle, 0, 0, 1)
			--GamePrint("Turning off " .. self.currSet .. " , " .. self.bNight)
			if (self.currSet == 1) then
				self.cloudCar:deactivate(self.bImmediate)
				self.setArch1Right:deactivate(self.bImmediate)
				if (self.nextbNight ~= 1) then
					self.mayPole:deactivate(self.bImmediate)
				end
			elseif (self.currSet == 2) then
				local scriptLoveBoat = FindScriptObject('Script_LoveBoat', 1)
				if (scriptLoveBoat and scriptLoveBoat.bPickedUp ~= 1) then 
					scriptLoveBoat:deactivate(self.bImmediate) 
				end
				if (self.nextbNight == 1) then
					self.dragon:deactivate(self.bImmediate)
				end
				self.setArch2RightTop:deactivate(self.bImmediate)
				self.setArch2Left:deactivate(self.bImmediate)
				if (self.boat.bOnStage == 1)then
					self.boat:deactivate()
				end
			elseif (self.currSet == 3) then
				local scriptHagathaHome = FindScriptObject('Script_HagathaHome', 1)
				if (scriptHagathaHome and scriptHagathaHome.bPickedUp ~= 1) then 
					scriptHagathaHome:deactivate(self.bImmediate) 
				end
				self.setArch3Left:deactivate(self.bImmediate)
				if (self.boat.bOnStage == 1)then
					self.boat:deactivate()
				end
			end
			
			self:tearDownActors(self.currSet, self.bNight)
			self:sleep(0.1)
			
			self.sets[self.currSet][self.bNight]:deactivate(self.bImmediate)
			
			self.currSet = nil
			self.bNight = nil
			
			if (self.bImmediate ~= 1) then self:sleep(self.activationTime+0.1) end			
		end

		--was later, move up here
		self.currSet = self.nextSet
		self.bNight = self.nextbNight
		Global:save('THMSCurrSet', self.currSet)
		Global:save('THMSCurrNight', self.bNight)
		-------------------
		if (self.nextSet and self.nextbNight) then 
			--GamePrint("Turning on " .. self.nextSet .. " , " .. self.nextbNight)
			if (self.nextSet == 1) then
				self.cloudCar:activate(self.bImmediate)
				self.setArch1Right:activate(self.bImmediate)
				if (self.nextbNight ~= 1) then
					self.mayPole:activate(self.bImmediate)
				end
			elseif (self.nextSet == 2) then 
				local scriptLoveBoat = FindScriptObject('Script_LoveBoat', 1)
				if (scriptLoveBoat and scriptLoveBoat.bPickedUp ~= 1) then 
					scriptLoveBoat:activate(self.bImmediate) 
				end
				if (self.nextbNight == 1) then
					self.dragon:activate(self.bImmediate)
				end
				
  				self.setArch2RightTop:activate(self.bImmediate)
				self.setArch2Left:activate(self.bImmediate)
			elseif (self.nextSet == 3) then
				local scriptHagathaHome = FindScriptObject('Script_HagathaHome', 1)
				if (scriptHagathaHome and scriptHagathaHome.bPickedUp ~= 1) then 
					scriptHagathaHome:activate(self.bImmediate) 
				end
				self.setArch3Left:activate(self.bImmediate)
			end
			self.sets[self.nextSet][self.nextbNight]:activate(self.bImmediate)
			--drop actors
			self:setUpActors(self.nextSet, self.nextbNight)

			--[[  moving this earlier up the state.  if it causes problems, move it back here and fix SetArch so that it knows whether to activate the night or day version of itself
			self.currSet = self.nextSet
			self.bNight = self.nextbNight
			Global:save('THMSCurrSet', self.currSet)
			Global:save('THMSCurrNight', self.bNight)
			]]--
			
			if (self.bImmediate ~= 1) then 
				self:sleep(self.activationTime-0.2) 
				self.switchFX:run()
				self:sleep(0.2)
			end
	
			if (self.bNight == 0) then		
				SetLightBrightness(self.dayLight, 1, 1)
			else
				SetLightBrightness(self.dayLight, 0, 1)
			end
		end

		if (self.bImmediate ~= 1) then
			self:stopSound(self.rMoveSoundHandle)
			self:playSound(self.rLandSoundHandle, 0, 0, 1)
		end

		--make sure raz is on the proper ground
		--GamePrint('THMS SNAPPING PLAYER TO GROUND')
		local x,y,z = Global.player:getPosition()
		Global.player:setPosition(x,y+100,z)
		SnapEntityToGround(Global.player)


		self.nextSet = nil
		self.nextbNight = nil
		self.bImmediate = nil
        self.bCanSwitch = 1

		if (self.bSkipIntro ~= 1) then
			self:playIntroCutscene()
		end
		self:setState(nil)
	end

    function Ob:playIntroCutscene()
		-- play appropriate intro to set
		while (Global.cutsceneScript.cutscenePlaying == 1) do Yield() end
		-- figure out day or night
        local setName, dayNight = self:getSceneName()
				
		local csName = 'Intro'..setName..dayNight
		if (Global:load('b'..csName..'Played') ~= 1) then
			Global.cutsceneScript:runCutscene(csName)
		end
	end
	
	function Ob:getSceneName()
		-- this will return a scene name based on the current set and day/night
		local setName, dayNight
		if (self.currSet == 1) then
            		setName = 'Left'
		elseif (self.currSet == 2) then
			setName = 'Middle'
		elseif (self.currSet == 3) then
			setName = 'Right'
		else
			GamePrint('ERROR: current set is not 1, 2, or 3')
			GamePrint(self.currSet)
		end
		
		if (self.bNight == 1) then
			dayNight = 'Night'
		else
			dayNight = 'Day'
		end
		
		return setName, dayNight
	end

	-- appropriately spawn and set home positions for actors belong to this set/time combo.
	function Ob:setUpActors(set, bNight, bImmediate)
		set = set or self.currSet
		bNight = bNight or self.bNight

		self.razPull:drop()

		local table = self.introActorPositions[(bNight == 1 and 'night') or 'day'][set]
		for charType, charInfo in table do -- one table per character type
			for k, v in charInfo do -- iterate through some number of instances of that character type
				local obj  =  self.specialActors[k]
				if obj then
					obj:setHomePosition(v[1], v[2], v[3], v[4], v[5], v[6])
					obj:setState(nil)
					local postSplineAction = v[7] and obj[v[7]]
	
					obj:activate(bImmediate, postSplineAction, v[8], 1)
				end
			end
		end
	end

	function Ob:tearDownActors(set, bNight, bImmediate, bDontPullRaz)
		if (bDontPullRaz ~= 1) then
			self.razPull:pull()
		end
		
		set = set or self.currSet
		bNight = bNight or self.bNight

		local table = self.introActorPositions[(bNight == 1 and 'night') or 'day'][set]
		for charType, charInfo in table do -- one table per character type
			for k, v in charInfo do -- iterate through some number of instances of that character type
				local obj
				
				if type(k) == 'string' then
					obj = self.specialActors[k]
				end
				if obj then
					obj:deactivate(bImmediate)
				end
			end
		end
	end
	
--********************************************************************************					
	
	--toggles from day to night or vice versa
	function Ob:switchDayNight()
		if (self.bCanSwitch == 1) then
			self.bCanSwitch = 0
			self:setState('SwitchDayNight')
		end
	end
	
	function Ob:stateSwitchDayNight()
		--pull up extra set pieces
		if (self.currSet == 1) then
			if (self.bNight ~= 1) then
				self.mayPole:fadeOut()
			end
		elseif (self.currSet == 2) then
			if (self.bNight == 1) then
				self.dragon:fadeOut()
			end
			local scriptLoveBoat = FindScriptObject('Script_LoveBoat', 1)
			if (scriptLoveBoat and scriptLoveBoat.bPickedUp ~= 1) then 
				scriptLoveBoat:fadeOut()
			end
		elseif (self.currSet == 3) then
				local scriptHagathaHome = FindScriptObject('Script_HagathaHome', 1)
			if (scriptHagathaHome and scriptHagathaHome.bPickedUp ~= 1) then 
				scriptHagathaHome:fadeOut()
			end
		end
		local set = self.sets[self.currSet][self.bNight]
		if (set.ladder) then set.ladder:deactivate() end
		
		--wait for things to be pulled up or fadeout
		self:sleep(self.activationTime)
		SetPhysicsFlag(set, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(set.leftFront, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(set.rightFront, PHYSICS_COLLIDEE, 0)
		SetEntityVisible(set, 0)
		SetEntityVisible(set.leftFront, 0)
		SetEntityVisible(set.rightFront, 0)
		
		if (self.bNight == 0) then  --day into night
			self.bNight = 1
			--make sure the incoming set is at home position
			set = self.sets[self.currSet][self.bNight]
			set:setPosition(set.hx, set.hy, set.hz)
			
			SetLightBrightness(self.dayLight, 0, 1)
			self:setLevelTheme('HagathasHome')
			
			--fade in main night set
			SetEntityVisible(self.sets[self.currSet][self.NIGHT].visual, 1)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].visual, 0, 0)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].visual, 1, 1)

			--fade in the two new fronts
			SetEntityVisible(self.sets[self.currSet][self.NIGHT].leftFrontVisual, 1)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].leftFrontVisual, 0, 0)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].leftFrontVisual, 1, 1)

			SetEntityVisible(self.sets[self.currSet][self.NIGHT].rightFrontVisual, 1)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].rightFrontVisual, 0, 0)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].rightFrontVisual, 1, 1)
			
			--waves
			if (self.sets[self.currSet][self.NIGHT].waves) then 
				--fade in the night's waves
				self.sets[self.currSet][self.NIGHT].waves:activate(1)
				SetEntityVisible(self.sets[self.currSet][self.NIGHT].waves, 1)
				SetEntityAlpha(self.sets[self.currSet][self.NIGHT].waves, 0,0)
				SetEntityAlpha(self.sets[self.currSet][self.NIGHT].waves, 1,1)
				
				--fade out the day's waves
				SetEntityAlpha(self.sets[self.currSet][self.DAY].waves, 0,1)
			end  
		else								  --night into day
			self.bNight = 0
			--make sure the incoming set is at home position
			set = self.sets[self.currSet][self.bNight]
			set:setPosition(set.hx, set.hy, set.hz)
			
			SetLightBrightness(self.dayLight, 1, 1)
			self:setLevelTheme('HappyFlowers')
			
			--fade out night main set
			SetEntityVisible(self.sets[self.currSet][self.DAY].visual,1) 
			SetEntityAlpha(self.sets[self.currSet][self.DAY].visual,1,0) 
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].visual, 0, 1)
						
			--fade out the two old fronts
			SetEntityVisible(self.sets[self.currSet][self.DAY].leftFrontVisual, 1)
			SetEntityAlpha(self.sets[self.currSet][self.DAY].leftFrontVisual, 1, 0)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].leftFrontVisual, 0, 1)
			
			SetEntityVisible(self.sets[self.currSet][self.DAY].rightFrontVisual, 1)
			SetEntityAlpha(self.sets[self.currSet][self.DAY].rightFrontVisual, 1, 0)
			SetEntityAlpha(self.sets[self.currSet][self.NIGHT].rightFrontVisual, 0, 1)

			--waves
			if (self.sets[self.currSet][self.NIGHT].waves) then 
				--fade in the day's waves
				self.sets[self.currSet][self.DAY].waves:activate(1)
				SetEntityVisible(self.sets[self.currSet][self.DAY].waves, 1)
				SetEntityAlpha(self.sets[self.currSet][self.DAY].waves, 0,0)
				SetEntityAlpha(self.sets[self.currSet][self.DAY].waves, 1,1)
				
				--fade out the night's waves
				SetEntityAlpha(self.sets[self.currSet][self.NIGHT].waves, 0,1)
			end  
		end
		
		--the physical geometry
		SetEntityVisible(self.sets[self.currSet][self.bNight], 1)
		SetEntityVisible(self.sets[self.currSet][self.bNight].leftFront, 1)
		SetEntityVisible(self.sets[self.currSet][self.bNight].rightFront, 1)
        SetPhysicsFlag(self.sets[self.currSet][self.bNight], PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self.sets[self.currSet][self.bNight].leftFront, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self.sets[self.currSet][self.bNight].rightFront, PHYSICS_COLLIDEE, 1)
		
		if (self.currSet == 1) then
			self.setArch1Right:fadeToMood(self.bNight)
		elseif (self.currSet == 2) then
			self.setArch2RightTop:fadeToMood(self.bNight)
			self.setArch2Left:fadeToMood(self.bNight)
		else
			self.setArch3Left:fadeToMood(self.bNight)
		end
		
		--pull down extra set pieces and actors
		if (self.currSet == 1) then
		 	self.cloudCar:fadeIn()
			if (self.bNight ~= 1) then
				self.mayPole:fadeIn()
			end
		elseif (self.currSet == 2) then
			if (self.bNight == 1) then
				self.dragon:fadeIn()
			end
			local scriptLoveBoat = FindScriptObject('Script_LoveBoat', 1)
  			if (scriptLoveBoat and scriptLoveBoat.bPickedUp ~= 1) then 
				scriptLoveBoat:fadeIn()
			end
		elseif (self.currSet == 3) then
				local scriptHagathaHome = FindScriptObject('Script_HagathaHome', 1)
  			if (scriptHagathaHome and scriptHagathaHome.bPickedUp ~= 1) then 
				scriptHagathaHome:fadeIn()
			end
		end
		
		set = self.sets[self.currSet][self.bNight]
		if (set.ladder) then set.ladder:activate() end
		
		self:sleep(self.activationTime)
		self:setUpActors(self.currSet, self.bNight)
		
		if (self.bNight == 1) then  --day into night
			SetEntityVisible(self.sets[self.currSet][self.DAY].visual, 0)
			SetEntityVisible(self.sets[self.currSet][self.DAY].leftFrontVisual, 0)
			SetEntityVisible(self.sets[self.currSet][self.DAY].rightFrontVisual, 0)
			if (self.sets[self.currSet][self.DAY].waves) then
				SetEntityVisible(self.sets[self.currSet][self.DAY].waves, 0)
			end
		else								  --night into day
			SetEntityVisible(self.sets[self.currSet][self.NIGHT].visual,0) 
			SetEntityVisible(self.sets[self.currSet][self.NIGHT].leftFrontVisual,0) 
			SetEntityVisible(self.sets[self.currSet][self.NIGHT].rightFrontVisual,0) 
			if (self.sets[self.currSet][self.NIGHT].waves) then
				SetEntityVisible(self.sets[self.currSet][self.NIGHT].waves, 0)
			end
		end

		--make sure raz is on the proper ground
		--GamePrint('THMS SNAPPING PLAYER TO GROUND')
		local x,y,z = Global.player:getPosition()
		Global.player:setPosition(x,y+100,z)
		SnapEntityToGround(Global.player)

        --self.switch:reset()
		Global.levelScript.bCanSwitch = 1
		Global:save('THMSCurrSet', self.currSet)
		Global:save('THMSCurrNight', self.bNight)
		
		Global.levelScript.rInstaHintFord:enemySawPlayer('th.characters.harpie')
		Global.levelScript.rInstaHintFord:enemySawPlayer('th.characters.thistle')
		Global.levelScript.rInstaHintFord:enemySawPlayer('th.characters.hound')
		
		self:playIntroCutscene()
		self:setState(nil)
	end

										   										   
--********************************************************************************					
						
	--switches set 'left-ward' (audience-left)
	function Ob:switchLeft()
		if (self.currSet ~= 1 and self.bCanSwitch == 1) then 
			self:switchSet(self.currSet-1, self.bNight)
		end
	end

--********************************************************************************					
						
	--switches set 'right-ward' (audience-right)
	function Ob:switchRight()
		if (self.currSet ~= 3 and self.bCanSwitch == 1) then 
			self:switchSet(self.currSet+1, self.bNight)
		end
	end

--********************************************************************************					

	function Ob:onCrossedTriggerPlane(data,from,bFromBack)
		if (from == Global.player) then
			if (data == 'tv_MainStage') then
				if (bFromBack == 1) then
					DomainSleep('MainStageDOMAIN', 1)
				else
					DomainSleep('MainStageDOMAIN', 0)
				end
			elseif (data == 'tv_BackStage') then
				if (bFromBack == 1) then
					DomainSleep('BackStageDOMAIN', 1)
				else
					DomainSleep('BackStageDOMAIN', 0)
				end
			end
		end
	end

--********************************************************************************					

	-- Special handling for THMS cutscenes.  Just a name mapping.
	function Ob:getEZSceneActor(name)
		local index = strfind(name, 'Thistle')
		if index and self.bNight ~= 1 then
			name = strsub(name, 1, index-1)
			name = name..'Flower'
		else
			index = strfind(name, 'Hound')
			if index and self.bNight ~= 1 then
				name = strsub(name, 1, index-1)
				name = name..'Puppy'
			else
				index = strfind(name, 'Harpy')
				if index and self.bNight ~= 1 then
					name = strsub(name, 1, index-1)
					name = name..'Bird'
				end
			end
		end
		return self.specialActors[name] or FindScriptObject(name)
	end

--********************************************************************************					

	-- Some actors are named specifically, and have special attributes.
	-- Create them here.
	function Ob:xCreateSpecialActors()
		-- create and rescale the thistles
		self:xCreateSpecialActor('HeadThistle')
		self:xCreateSpecialActor('FroggyThistle')
		self:xCreateSpecialActor('SqueakyThistle')
		self:xCreateSpecialActor('HeadThistleDummy')
		self:xCreateSpecialActor('FroggyThistleDummy')
		self:xCreateSpecialActor('SqueakyThistleDummy')
		-- create and rescale the flowers
		self:xCreateSpecialActor('HeadFlower')
		self:xCreateSpecialActor('FroggyFlower')
        self:xCreateSpecialActor('SqueakyFlower')
		-- create the rest of the actors
		self:xCreateSpecialActor('PetHound')
		self:xCreateSpecialActor('PetPuppy')
		self:xCreateSpecialActor('UnknownHound')
		self:xCreateSpecialActor('DummyHound')
		self:xCreateSpecialActor('UnknownPuppy')
		self:xCreateSpecialActor('Harpie1')
		self:xCreateSpecialActor('Harpie2')
		self:xCreateSpecialActor('Birdie1')
		self:xCreateSpecialActor('Birdie2')
	end

	function Ob:xCreateSpecialActor( name )
		local constants = self.specialActorConstants[name]
		local actor, object
		
		local editvars = (constants.charName and constructEditvarString('charName', constants.charName) ) or ''
		object = SpawnScript(constants.type, constants.scriptObject, editvars)
		object.constants = constants
		self:applySpecialActorConstants(object)
		
		--Turn on the special actor flag, and then turn off this entity for later use.
		self.specialActors[name] = object
		self.specialActors[name].bSpecialActor = 1
		self.specialActors[name]:turnOff()

		return self.specialActors[name]
	end

	function Ob:applySpecialActorConstants(actor)
		local constants = actor.constants

		--If a scale was specified, then set the scale.
		if( constants.scale ) then
			actor:setScale( constants.scale.x, constants.scale.y, constants.scale.z )
		end

		--If collision spheres were specified, set it.
		if( constants.collision ) then
			--If there is a radius in the map, then there is only one, otherwise loop through inner maps
			if( constants.collision.radius ) then
				self:applyCollisionSphere(actor, constants.collision, 0)
			else
				local sphere = 0	
				for key, collision in constants.collision do
					self:applyCollisionSphere(actor, collision, sphere)
					sphere = sphere + 1
				end
			end
		end
		
		--Radius of path around the Maypole.  Special constant just for flowers.
		if( constants.maypoleRadius ) then
			actor.maypoleRadius = constants.maypoleRadius
		end
		
		if( constants.texture ) then
			SetBaseTexture(actor, constants.texture)		
		end
	end
	
	function Ob:applyCollisionSphere(actor, collision, sphere)
		local cx, cy, cz = collision.x, collision.y, collision.z
		if not cx then cx = 0 end
		if not cy then cy = collision.radius end
		if not cz then cz = 0 end
		SetEntityCollideSphere( actor, collision.radius, cx, cy, cz, sphere )
		sphere = sphere + 1
	end
		
	function Ob:xRetrieveSpecialActor(name)
		local actor = self.specialActors[name]
		if( nil == actor ) then
			actor = xCreateSpecialActor( name )
			DebugPrint('A THMS '..name..' Special Actor is being created too late.')
			DebugPrint('Tell a GP about this right now please, but you will be able to continue your game.')
			DebugPrint('Sincerely,')
			DebugPrint('Alex Mouton ')
			HardBreak()
		end
		
		return actor
	end

	function Ob:stopMaypole()
 		--Turn off Froggy and Squeaky and put head flower stage center.
 		local squeakyFlower = self.specialActors['SqueakyFlower']
 		local froggyFlower = self.specialActors['FroggyFlower']
 		local headFlower = self.specialActors['HeadFlower']

 		squeakyFlower:setState(nil)
 		squeakyFlower:setAnim(squeakyFlower.animsTable.Breathe)
 		
 		froggyFlower:setState(nil)
 		froggyFlower:setAnim(froggyFlower.animsTable.Breathe)
 		
 		headFlower:setState(nil)
 		headFlower:setAnim(headFlower.animsTable.Breathe)
 	end
	
--********************************************************************************					
	
	function Ob:onEnteredTriggerVolume(data, from)
		if (from == Global.player and self.currSet == 1 and self.bNight == 1 and data == 'tv_CloudCarHint' and Global:load('bCloudCarHintPlayed') ~= 1 and Global:load('bHagathaHomeLeftNight1Played') ~= 1) then
		-- play the cloudcar hint cutscene
			Global.cutsceneScript:runCutscene('CloudCarHint')
		else
			if (from == Global.player) then
				if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
					if (self.tMusicFader[data]) then
						local fader = FindScriptObject(self.tMusicFader[data])
						if fader then
							self.rCurrentFader = fader
							fader:startTrack(self.iCurrTriggerVal)
						end
					end
				end
			end
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

--********************************************************************************                  
	
 	function Ob:listenerRazRespawn(value, from)
		---GamePrint("LISTENER RAZ RESPAWN")
	
		self:setState('Respawn')
	end 

	function Ob:stateRespawn()
		PlaySound(nil, self.laughSound)
		while (Global.player.respawnMilestone < Global.player.RESPAWN_DONE) do Yield() end
		
		SetCameraTargetHeight(150)
		
		self:setState(nil)

	end
			
	function Ob:getHintResponse()
	
		if( self:beforeStorageRoom() == 1 ) then
			--<<before you get the storage room door open
			return { { voice = "/GLAP000FO/" } } --<<Let's go back to the dressing rooms and see if we can't get this Bonita person to take the stage.
		end
		
		if( self:beforeCandle() == 1 ) then
			--<<Scene Dir>>		after storage room is open, before candle is picked up
			return { { voice = "/GLAP001FO/" } } --<<Somewhere in that storage room is a candle that we need.
		end
		
		if( self:beforeSpotlight() == 1 ) then
			--<<Scene Dir>>		after candle, but before they put it in
			return { { voice = "/GLAP002FO/" } } --<<Let's put this candle in that spotlight so the show can begin!
		end
		
		if( self:beforeJasper() == 1 ) then
			--<<Scene Dir>>		after the show begins, before you talk to jasper
			return { { voice = "/GLAP003FO/" }, --<<Well, I think you should go talk to that blowhard up in the balcony and give him a piece of your mind.
					{ voice = "/GLAP004FO/" } } --<<...and see if he knows anything.
		end
		
		if( self:hasKnightOfJoyScript() == 1  and self:hasDeliveredKnightOfJoyScript() ~= 1 ) then				
			--<<Scene Dir>>		after you get the knight of joy script
			return { { voice = "/GLAP005FO/" } } --<<Let's give this script to Becky and see if it's any good.
		end
		
		if( self:beforePropDoorSetChange() == 1 ) then
			--<<Scene Dir>>		if you haven't walked through a prop door and changed the set yet
			return { { voice = "/GLAP006FO/" } } --<<I wonder if those prop doors on the set really work?
		end
		
		if( self:beforeForcedMoodChange() == 1 ) then
			--<<Scene Dir>>		if you haven't forced a mood change yet
			return { { voice = "/GLAP007FO/" } } --<<I'll bet if you punched that strange spotlight with the faces on it, you could change what's going on on stage.
		end
		
		if( self:beforeHagathaLeftNight() == 1 ) then
			--<<Scene Dir>>		after they've done all that...
			return { { voice = "/GLAP008FO/" }, --<<We have to get up to the catwalks and get rid of that Phantom character.
					{ voice = "/GLAP009FO/"	} } --<<I'll bet the right script played on the right set would do it!
		end
		
		--<<Scene Dir>>		after Hagatha home, left, night has played, before Raz has gone up in the catwalks
		return { { voice = "/GLAP010FO/" } } --<<Let's take that prop magic cloud elevator thing up to the catwalks.
	end

	function Ob:beforeStorageRoom()
		return 1 ~= fso('StorageRoomDoor'):isOpen()
	end
	
	function Ob:beforeCandle()
		return 1 ~= Global.player:isInInventory('Candle') and nil == fso('DaySwitch').candle 
	end
	
	function Ob:beforeSpotlight()
		return 1 == Global.player:isInInventory('Candle') and nil == fso('DaySwitch').candle
	end
	
	function Ob:beforeJasper()
		return Global:load('bJasperIntroPlayed') or 0	
	end
	
	function Ob:hasKnightOfJoyScript()
		return Global.player:isInInventory('Script_KnightOfJoy')	
	end
	
	function Ob:hasDeliveredKnightOfJoyScript()
		return 1 == Global:load('bGotKnightOfJoyPlayed')	
	end
	
	function Ob:beforePropDoorSetChange()
		return 1 ~= Global:load('bSwitchedSets')	
	end
	
	function Ob:beforeForcedMoodChange()
		return 1 ~= Global:load('bManualMoodSwitch')
	end
	
	function Ob:beforeHagathaLeftNight()
		return 1 ~= Global:load('bHagathaHomeLeftNight1Played')
	end
	
--********************************************************************************                  

	function Ob:preparePlayer()
		%Ob.Parent.preparePlayer(self)
		if Global.player:isInInventory('Megaphone') ~= 1 and Global:loadGlobal('bTHCompleted') == 1 then
			SpawnScript('TH.Props.Megaphone', 'Megaphone'):addToInventory()
		end
	end

--********************************************************************************                  

	-- overriding to use param controls
	function Ob:setMusicMood(mood, bForce)		
		local bMood = 0
		if (mood) then		
			bMood = 1
			if (self.bLockCurrMood == 0 or bForce == 1) then
				local triggerval = 0
				self.iPrevMood = self.iCurrMood
				self.iCurrMood = mood
				-- note: all the values here are going to be changed...
				if (mood == self.MUSIC_MOOD_OFF) then
					triggerval = 0
				elseif (mood == self.MUSIC_MOOD_AMBIENT) then
					triggerval = 0
				elseif (mood == self.MUSIC_MOOD_COMBAT) then
					triggerval = 1
				elseif (mood == self.MUSIC_MOOD_MED) then
					triggerval = 0.5
				elseif (mood == self.MUSIC_MOOD_HIGH) then
					triggerval = 1
				else
					bMood = 0
				end
				self.iCurrTriggerVal = triggerval
				-- only change if no current fader
				if not Global.levelScript.rCurrentFader then
					if self.rLevelMusicInstance and self.rLevelTheme then
						SoundSetParameterControl(self.rLevelTheme, self.rLevelMusicInstance, 'New Control', triggerval)
					end
				end
				if (bForce) then
					self.bLockCurrMood = 0
				end
			elseif (self.bLockCurrMood == 1) then
				self.iPrevMood = mood
			end
		end
		if bMood ~= 1 then
			GamePrint('ERROR: Invalid mood '..(mood or 'nil')..'.')
			StackTrace()
		end
	end	

--********************************************************************************                  
		
	function Ob:onExitedTriggerVolume(data,from)
		if (from == Global.player) then
			if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
				if (self.tMusicFader[data]) then
					local fader = FindScriptObject(self.tMusicFader[data])
					if fader then
						fader:stopTracking()
					end
				end
			end
		end
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
	end

--********************************************************************************                  
			
    return Ob
end


--Global.player:addToInventory(fso('Script_KnightOfJoy'))
