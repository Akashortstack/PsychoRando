--      MCBB.lua
--
--      Level Script
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential and Asian Pimp
--
--      
--

function MCBB(Ob)
	-- Constructor
	if (not Ob) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = { 'Global.Characters.Watercurse',
						'MC.Props.TKMonsterPowerUp',
						'MC.Characters.EvilDad',
						'Global.Props.Geometry',
						'MC.Characters.KidCoach',
						'MC.Props.MeatPackage',
						'MC.Effects.FieryUDRLFx',
						'MC.Effects.FireRingFX', 
				        'CA.Props.FloatingPlatform'
			          },
			meshes = {'Levels/MC_MeatCircus/MeatSarlacc/PileOMeat.plb',  
				      'Levels/MC_MeatCircus/Props/meatplatform.plb',
			         },
			textures = { 'Textures/LevelTextures/MC_MeatCircus/MC_Tightrope.dds',
			             'Textures/MenuUI/Journal/GraphPaper.dds' },
			animations = {
				'Anims/DartNew/etherdance.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Grabbed.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Melee/Jab1.jan',
				'Anims/DartNew/Melee/Jab2.jan',
				'Anims/DartNew/Melee/Uppercut.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/JugglingClubs/JuggleLoop.jan',
				'Anims/JugglingClubs/JuggleThrow.jan',
				'Anims/Kid_Coach/Fly_end.jan',
				'Anims/Kid_Coach/KidCoach_chase_bunny.jan',
				'Anims/Kid_Coach/KidCoach_psi_confusion.jan',
				'Anims/Kid_Coach/KidCoach_psiblast_reaction.jan',
				'Anims/Kid_Coach/KidCoach_reactToFire.jan',
				'Anims/Kid_Coach/KidCoach_stagger.jan',
				'Anims/Kid_Coach/KidCoach_turnL.jan',
				'Anims/Kid_Coach/KidCoach_turnR.jan',
				'Anims/Kid_Coach/KidCoach_walk.jan',
				'Anims/Kid_Coach/LandwBunny.jan',
				'Anims/Kid_Coach/TK.jan',
				'Anims/MC_ButcherPaper/Unfold.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/DartNew/lo/standstill.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/LO/run.jan',
				'anims/DartNew/LO/walk.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/dartnew/MegaIdle2.jan',
				'anims/dartnew/MegaIdle4.jan',
				'anims/dartnew/MegaIdle5.jan',
				'anims/dartnew/megaidle.jan',
			}	
		}
		
		Ob.currentPhase = 1
		Ob.theme = 'MCButcherBoss'
		Ob.defaultAmbientSoundName = 'MCBBAmb'
		Ob.bProcessFootfalls = 1		
		Ob.bBossBattle = 1
		Ob.bDontPlayThemeAtStart = 1

		Ob.tUDRLPlatformPos =
		{
		    { x = -325.1, y = 31807.5, z = -185.1},
		    { x = 1557.2, y = 32222.0, z = -1737.2},
		    { x = 3038.4, y = 32771.9, z = 603.5},
		    { x = -520.2, y = 33225.7, z = 1138.5},
		}
	end

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		-- place appropriate locators
		local locator = SpawnScript('Locator', 'EvilDadStartPoint')
		locator:setPosition(-3436, 1738, 5651)
		locator:setOrientation(0, 171, 0)
		locator = SpawnScript('Locator', 'ButcherStartPoint')
		locator:setPosition(-3262.79, -26.0591, 3191.73)
		locator:setOrientation(0, 131.596, 0)
		self.rWater = FindScriptObject('Water')
		self.waterCurse = SpawnScript('Global.Characters.Watercurse', 'WaterCurse', 'self.sSecondaryTrigVolName = \'tv_Water2\'')
		self.waterCurse.useRespawn = 1
		self.rTKMonsterPowerUp = SpawnScript('MC.Props.TKMonsterPowerUp', 'TKMonsterPowerUp')
	end

	function Ob:onBeginLevel()
		SpawnScript('MC.Characters.EvilDad', 'EvilDad')
		self.rButcher = FindScriptObject('Butcher')
		self.rEvilDad = FindScriptObject('EvilDad')
		self.rTwoHeadedButcher = FindScriptObject('TwoHeadedButcher')

		--Player must have gotten at least this far
		--Global:setLevelToCompleted('TH')
		--Global:setLevelToCompleted('WW')
		--Global:setLevelToCompleted('BV')

		%Ob.Parent.onBeginLevel(self)		

		RegisterTriggerVolume(self, 'tv_Phase2Exit')

		local texID = LoadTexture('Textures/LevelTextures/MC_MeatCircus/MC_Tightrope.tga')
		if texID then
			SetRenderSplineTexture(texID)
		end

		self.rMeatPile = SpawnScript('Global.Props.Geometry', 'MeatPile', 'self.meshName = \'Levels/MC_MeatCircus/MeatSarlacc/PileOMeat.plb\'')
		self.rMeatPile:makeInvisible()

		-- Spawn and intialize Raz's dad's ghost
		self.rGhostDad = SpawnScript('MC.Props.GoodDadGhost')
		self.rGhostDad:initialize(15, 30, nil, nil, 500, 800, 300, 500, 4, 0.7)

		Global.levelScript:getPool('Global.Collectibles.HealthAmmo'):setLowerLimit(3)
		Global.levelScript:getPool('Global.Collectibles.ConfusionAmmo'):setLowerLimit(3)
		Global.levelScript:getPool('Global.Collectibles.PsiBlastAmmo'):setLowerLimit(3)

		self.rAnimatedTentTear = FindScriptObject('torncloth')
		if self.rAnimatedTentTear then self.rAnimatedTentTear:makeInvisible() end
		self.RazillaWalk = LoadSound('ButcherFootsteps')

		-- make the shadow darker
		SetShadowColor(0, 0, 0, 0.5)

		-- extend Raz's look box
		SetPlayerLookBox(250, 700, 10000)

		-- make the tubwater start out low
		self.rTubWater = FindScriptObject('TubWater')
		-- crate the trigger mesh
		self.rTubTriggerHandle = TriggerMesh_New('Levels/MC_MeatCircus/Props/TVwatermesh.plb', self.rTubWater)
		Trigger_RegisterListener(self.rTubTriggerHandle, self)

		-- make sure tent tear is not collidee
		local torncloth = FindScriptObject('torncloth')
		if torncloth then
			SetPhysicsFlag(torncloth, PHYSICS_COLLIDEE, 0)
		end		

		SetDistortionColor(1,1,1)

		-- start phase
		self:setState('Start')
	end

	function Ob:stateStart()
		--Fade screen to black, so we don't get a flash before the cutscene
		Global.cutsceneScript:fadeToBlack(0)
		
		self.currentPhase = 0
		self.nextPhase = Global:load('StartPhase') or 1
		self:setState('PhaseTransition')
	end

	function Ob:startPhase(phaseNum)	
		--Set current phase variable
		self.currentPhase = phaseNum

		--Set up actors		
		if (self.rButcher and self.rButcher.onPhaseStart) then
			self.rButcher:onPhaseStart(phaseNum)
		end
		if (self.rEvilDad and self.rEvilDad.onPhaseStart) then
			self.rEvilDad:onPhaseStart(phaseNum)
		end	
		if (self.rTwoHeadedButcher and self.rTwoHeadedButcher.onPhaseStart) then
			self.rTwoHeadedButcher:onPhaseStart(phaseNum)
		end		

		--Phase specific code
		local startLoc = FindScriptObject('DartStart')	--Raz's start position (default)
		if (phaseNum == 1) then
			self.rGhostDad:enable()
		elseif (phaseNum == 2) then
			startLoc = FindScriptObject('respwaner2')	--Raz has a special start position in phase2
			-- start the fire
			self.rRingFireFX = SpawnScript('MC.Effects.FireRingFX')
			self.rRingFireFX:run()
			self.rUDRLFireFX = SpawnScript('MC.Effects.FieryUDRLFx')
			self.rUDRLFireFX:run()
			-- UDRL Cam Spheres
			self.rUDRLCamSphere1 = TriggerSphere_New(1247.7, 32025.2, 91.7, 1200)
			self.rUDRLCamSphere2 =TriggerSphere_New(1247.7, 32225.2, 91.7, 1200)

			Trigger_RegisterListener(self.rUDRLCamSphere1, self)
			Trigger_RegisterListener(self.rUDRLCamSphere2, self)

			-- make the fires do less damage
			
			--[[
	        -- UDRL Meat Platforms
	        if self.tUDRLPlatformPos then
				for i, platPos in self.tUDRLPlatformPos do
					SpawnScript('CA.Props.FloatingPlatform', 'MeatPlatform', 'self.sMeshName = \'Levels/MC_MeatCircus/Props/meatplatform.plb\'  self.bounceAmbient = 5 self.bounceOnMount = 20 self.sBounceCueName = \'FS_Meat_Land\'', 1, 1, 0, 0,  platPos.x, platPos.y, platPos.z)
				end
			end
	        ]]--

			-- start the tub o water
			self.rTubWater:start()
--				self.rWater:startMoving(60)
			self.rGhostDad:enable()
		elseif (phaseNum == 3) then
			self.rGhostDad:enable()
		elseif (phaseNum == 4) then
			self.rGhostDad:disable()
			startLoc = FindScriptObject('THBTentDartStart')
			self.rTKMonsterPowerUp:showGauge()
			self.rTKMonsterPowerUp:collected()
		end

		--Place raz at start positon.
		Global.player:setPosition(startLoc:getPosition())
		Global.player:setOrientation(startLoc:getOrientation())

		--Set goal
		Global.goalManager:activate('ButcherPhase'..phaseNum)
	end
	
	function Ob:statePhaseTransition()
		local currentPhase = self.currentPhase
		local nextPhase = self.nextPhase
		
		if (nextPhase ~= 1) then
			self:setLevelTheme(self.theme)
		end
		
		if (nextPhase == 1) then
			--Play introductory video
			self:playVideo('cutScenes/prerendered/mcbi.xmv')
			self:setLevelTheme(self.theme)

			--Set up Butcher
			self.rButcher:turnOn()

			--Play cutscene showing the butcher in all his glory
			Global.cutsceneScript:runCutscene('ButcherIntro', 1)
		elseif (nextPhase == 2) then
			--Spawn the meat package so we can use it
			self.rMeatPackage = SpawnScript('MC.Props.MeatPackage','MeatPackage')
			--Run part of cutscene that is in main tent
			if (currentPhase == 1) then
				--Only show if coming from phase 1 (not level start)
				Global.cutsceneScript:runCutscene('PhaseTransition12a', 1)
			end
			--Run part of cutscene that is in water tent
			Global.cutsceneScript:runCutscene('PhaseTransition12b', 1, 1)
			--Run part of cutscene that has the Dad traversing the path
			Global.cutsceneScript:runCutscene('PhaseTransition12c', 1)
		elseif (nextPhase == 3) then

-- DEBUG CODE ONLY ------------------
if (not FindScriptObject('TentHole')) then
	local tentHole = SpawnScript('MC.Props.TentHole', 'TentHole')
	tentHole:setPosition(4370.97, 42890.41, -1724.49)
end
-------------------------------------

			--Run part of cutscene that is in water tent
			if (currentPhase == 2) then
				--Only show if coming from phase 2 (not level start)
				Global.cutsceneScript:runCutscene('PhaseTransition23a', 1)
			end
			
			--Set up EvilDad and Butcher
			self.rButcher:turnOn()
			self.rButcher:turnCleaverFireOn(1)
			self.rEvilDad:turnOn()
			self.rEvilDad:grow()
			
			--Should probably have him as a placed LSO
			self.rOle = FindScriptObject('LilOle')
			if (not self.rOle) then
				self.rOle = SpawnScript('MC.Characters.KidCoach', 'LilOle', '', 1)
			end
			--Run part of cutscene that is in main tent
			Global.cutsceneScript:runCutscene('PhaseTransition23b', 1)
			self.rOle:makeInvisible()
		elseif (nextPhase == 4) then
			Global.cutsceneScript:runCutscene('PhaseTransition34a', 1)
		elseif (nextPhase == 5) then
			UnlockAchievement('ACH_COMP_MC')
			FadeToColor( 0, 0, 0, 0, 0, 255 , 255, 255, 255,0, 0 )
			Yield()
			self:playVideo('cutScenes/prerendered/mcvi.xmv')
			self:playVideo('cutScenes/prerendered/fini.xmv')
			Yield()
			InitEndingCredits()
			
		end

		if (nextPhase < 5) then		
			--PrintNote('starting phase '..nextPhase)
			self:startPhase(nextPhase)
		else
			Global:saveGlobal('bMCCompleted', 1)
			--self:loadNewLevel('STMU')
		end
		
		if (nextPhase == 3) then
			Global.cutsceneScript:runCutscene('Phase3Intro', 1)
		elseif (nextPhase == 4) then
			Global.cutsceneScript:runCutscene('Phase4Intro', 1)
		end
		self:setState(nil)		
	end

	function Ob:endPhase()
		local phaseNum = self.currentPhase
	
		--Call endPhase methods of actors
		if (self.rButcher and self.rButcher.onPhaseEnd) then
			self.rButcher:onPhaseEnd(phaseNum)
		end
		if (self.rEvilDad and self.rEvilDad.onPhaseEnd) then
			self.rEvilDad:onPhaseEnd(phaseNum)
		end	
		if (self.rTwoHeadedButcher and self.rTwoHeadedButcher.onPhaseEnd) then
			self.rTwoHeadedButcher:onPhaseEnd(phaseNum)
		end
		if (self.rGhostDad) then
			self.rGhostDad:disable()
		end
		if (self.rWater) then
			self.rWater:stopMoving()
			SetDistortionFullScreen(0) --Just in case, shouldn't need to do this
			SetDistortionColor(1,1,1)
		end


		--Clear goal
		Global.goalManager:activate('ButcherPhase'..phaseNum)

		--Set next phase number and go to transition.  Save phase number for game reload
		self.nextPhase = phaseNum + 1
		Global:save('StartPhase', self.nextPhase)

		self:setState('PhaseTransition')
	end

	function Ob:makeRazFall(bMakeRazFall)
		self.bMakeRazFal = bMakeRazFall
		if (bMakeRazFall == 1) then
			Global.player:addSpamListener('NewGroundCollide', self)
		else
			Global.player:removeSpamListener('NewGroundCollide', self)
		end
	end
	
	function Ob:listenerNewGroundCollide()
		GamePrint('Raz falling on his face!')
		LoadAnim(Global.player, 'Anims/DartNew/FacePlant.jan', 0.1, 0)
	end

	function Ob:onEndLevel()
		if (%Ob.Parent.onEndLevel) then
			%Ob.Parent.onEndLevel(self)
		end
		Global.player:TKMonster(0)
		SetRenderSplineThickness(3)
		Global:saveGlobal('playerRespawnPointName', nil)
		Global:saveGlobal('playerWaterCurseRespawnPointName', nil)
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if (from == Global.player) then
			if (data == 'tv_Phase2Exit') then
				--Ensure that it doesn't trigger again during cutscene
				if (self.state_name ~= 'PhaseTransition') then
					self:endPhase()
				end
			elseif (data == self.rTubTriggerHandle) then
				if self.waterCurse then
					-- for grabbing the player from the tub
					self.waterCurse:grabPlayer()
				end
			elseif (data == self.rUDRLCamSphere1 or data == self.rUDRLCamSphere2) then
				self:setUDRLCam(1)
			end
		end
		%Ob.Parent.onEnteredTriggerVolume(self, from, data)
	end

	function Ob:onExitedTriggerVolume(data, from)
		if (from == Global.player) then
			if (data == self.rUDRLCamSphere1 or data == self.rUDRLCamSphere2) then		
				self:setUDRLCam(0)
			end
		end
		%Ob.Parent.onExitedTriggerVolume(self, from, data)
	end

	function Ob:setUDRLCam(bEnable)
		if bEnable == 1 then
			GamePrint('SETTING CAM')
			if self.rEvilDad then
				Global.camControl:setSecondaryTarget(self.rEvilDad, kSECONDARYFLAG_AUTO_ROTATE, 1)
			end
		else
			GamePrint('UNSETTING CAM')
			Global.camControl:setSecondaryTarget(nil)
		end
	end

	function Ob:footfall(whichFoot, walkType)
		if (Global.player.bTKMonsterActive == 1) then
			PlaySound(nil,self.RazillaWalk,0,0)
			CameraStartShakeDriven((walkType == 'Run' and 2) or 1)
		else
			%Ob.Parent.footfall(self, whichFoot, walkType)
		end
	end

	function Ob:getHintResponse()
		--Default to this
		if (self.currentPhase == 1) then 
			return {
				{
					voice = "/GLAT003FO/",--DIALOG=<<Next time his cleaver gets stuck in the ground, run up his arm and punch him in his fat head.>>
				}
			}
		elseif (self.currentPhase == 2) then 
			return {
				{
					voice = "/GLAT004FO/",--DIALOG=<<Listen to your father! Keep moving or you\'re going to drown!>>
				}
			}
		elseif (self.currentPhase == 3) then 
			return {
				{
					voice = "/GLAT005FO/",--DIALOG=<<Okay, do NOT run up the flaming arms. >>
				},
				{
					voice = "/GLAT006FO/",--DIALOG=<<Hmm. Try TKing some of your Dad\'s flaming clubs into the butcher.>>
				},
				{
					voice = "/GLAT007FO/",--DIALOG=<<And then, if he ends up, say, curled up in agony, THEN you can punch him in his fat head.>>
				},
			}
		elseif (self.currentPhase == 4) then 
			return {
				{
					voice = "/GLAT008FO/",--DIALOG=<<Yeah, put your head between your legs and kiss your ass good bye!>>
				},
				{
					voice = "/GLAT009FO/",--DIALOG=<<Hang onto that power your dad gave you, because it\'s the only chance we\'ve got.>>
				}
			}
		else
			return %Ob.Parent.getHintResponse(self)
		end
	end

	return Ob
end

