--      SA.lua
--
--      Sasha's Cube Script
--
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Erik Wolpaw
---------------------------------------------------------------------------------

function SACU(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			textures = { 
				'textures/hud/quick_psiblasttrainerbig.dds'
			},
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/BodyParts/PopperEmptyHold_ArmLf.jan',
				'Anims/DartNew/DamageBack_low.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageFront_low.jan',
				'Anims/DartNew/DamageFront_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Flattened.jan',
				'Anims/DartNew/Flattened_wiggle.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Gesture04.jan',
				'Anims/DartNew/Listen.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SACD.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/Talk_1.jan',
				'Anims/DartNew/Talk_3.jan',
				'Anims/DartNew/Talk_4.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/gesture01.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/HateBalls/Idle_still.jan',
				'Anims/HealthBalls/Idle_still.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/SA_SashaBrain/CensorSwitch_1to2.jan',
				'Anims/SA_SashaBrain/CensorSwitch_2to3.jan',
				'Anims/SA_SashaBrain/CensorSwitch_3to4.jan',
				'Anims/SA_SashaBrain/CensorSwitch_4to5.jan',
				'Anims/SA_SashaBrain/CensorSwitch_5to6.jan',
				'Anims/SA_SashaBrain/CensorSwitch_idle.jan',
				'Anims/SA_SashaBrain/CensorSwitch_open.jan',
				'Anims/SA_SashaBrain/ShutoffMCSmash.jan',
				'Anims/Sasha/Flattened.jan',
				'Anims/Sasha/SACD.jan',
				'Anims/Sasha/SACD002SA.jan',
				'Anims/DartNew/ClimbLedge.jan',
				'Anims/DartNew/DoubleJump.jan',
				'Anims/DartNew/LadderDismount.jan',
				'Anims/DartNew/LedgeJangle.jan',
				'Anims/DartNew/LedgeShimmyLeft.jan',
				'Anims/DartNew/PsiBlast_HeadButt.jan',
				'Anims/DartNew/Trampoline_squash.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/hop.jan',
				'Anims/DartNew/hop_recovery.jan',
				'Anims/DartNew/ladderStop.jan',
				'Anims/DartNew/ladderUp.jan',
				'Anims/DartNew/landsoft.jan',
				'Anims/DartNew/ledge_drop_to_hang.jan',
				'Anims/DartNew/longjump.jan',
				'Anims/DartNew/SACD001RA.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe1CensorFire.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe1Shutoff.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe2Shutoff.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe3Shutoff.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe5CensorFire.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe5Shutoff.jan',
				'Anims/SA_SashaBrain/CensorSpawners/Pipe6Shutoff.jan',
				'Anims/SA_SashaBrain/CensorSpawners/PipeOpen1.jan',
				'Anims/SA_SashaBrain/CensorSpawners/PipeOpen2.jan',
				'Anims/SA_SashaBrain/CensorSpawners/PipeOpen3.jan',
				'Anims/SA_SashaBrain/CensorSpawners/PipeOpen5.jan',
				'Anims/SA_SashaBrain/CensorSpawners/PipeOpen6.jan',
				'Anims/SA_SashaBrain/PortalDoor_close.jan',
				'Anims/SA_SashaBrain/PortalDoor_open.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/180.jan',
				'anims/DartNew/CartwheelLeft.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnLfCycle.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/DartNew/run.jan',
				'anims/DartNew/walk.jan',
				'anims/dartnew/DartIdle01.jan',
				'anims/dartnew/DartIdle02.jan',
				'anims/dartnew/DartIdle03.jan',
				'anims/dartnew/DartIdleShrug.jan',
				'anims/dartnew/default_pose_Lf.jan',
				'anims/dartnew/default_pose_Rt.jan',
				'cutScenes/SACD/SACD_badge.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
				'anims/sa_sashabrain/ShutoffIDLE.jan',
				'anims/sa_sashabrain/censorspawners/pipe2firecensor.jan',
				'anims/sa_sashabrain/censorspawners/pipe3firecensor.jan',
				'anims/sa_sashabrain/censorspawners/pipe6girecensor.jan',
				'anims/sa_sashabrain/censorspawners/switchoff.jan',
				'anims/sa_sashabrain/censorspawners/tutorialspawnerfire.jan',

			}
		}
		
		Ob.levelType = 'mental'
                
--		Ob.rLevelTheme = 'SashasCube'
		Ob.theme = 'SashasCube'
		Ob.secondLevelTheme = 'SashasAction'	-- this should be set as the level theme at a later point in the game
		Ob.bSaveMusic = 1
	end
	
	function Ob:testCam()
		Global.camControl:setSecondaryTarget(fso('MC'), 3, 1)
		SetChaseCameraDistanceAdjustParam(0)
		--SetChaseCameraAutoRotateRange(20, 15)
	end
	
	function Ob:onPreLoad()
		%Ob.Parent.onPreLoad(self)
		--edit spawn SAItemPlacer
		self.ItemPlacer = SpawnScript('SA.SAItemPlacer', 'SAItemPlacer')
	end
	
	function Ob:onSpawn()
		self.censorPoolTable =	{	
									Melee = {num = 5, censorCode = 'Melee', scriptName = nil},
									Sniper = {num = 2, censorCode = 'Sniper', scriptName = nil},
									Suicide = {num = 5, censorCode = 'Suicide', scriptName = nil},
									Minion = {num = 5, censorCode = 'Minion', scriptName = nil},
								}
		self.gravity = SpawnScript('sa.SACUGravity', 'SACUGravity')
		%Ob.Parent.onSpawn(self)
		
		local ladder = FindScriptObject('splLaddShoeLadder')
		SetEntityDomain(ladder, 'Face3Domain')
	end

	function Ob:onBeginLevel()
	
		--Make sure Raz has his learner's permit so that enableAppropriatePowers will turn on psi-blast
		--edit removed
		--Global:saveGlobal('bHasPsiBlastLearnersPermit', 1)
	
		%Ob.Parent.onBeginLevel(self)

		if fso('ClosedCube') then
			fso('ClosedCube'):killSelf()
			GamePrint('WARNING: Erik should take ClosedCube out of SACU.  Please inform him.')
		else
			GamePrint('WARNING: Erik has taken ClosedCube out of SACU.  Matt should now remove the hack code to kill it.')
		end

		DomainSleep('MegaCensorDomain', 1)
		
		Global.player:adjustPsiBlastAmmo(100)
        MM_DisableOOWKludge(1)
		
		--  Set Fog Parameters
		SetDistanceFogEnable(0)
		SetDistanceFogColor(0.1,0.1,0.5)
		SetDistanceFogRange(-80, 6000)
		
		--  Skybox Parameters
		SetSkyBox('Levels/SkyBox/SA_SkyBox.plb')
		SetEnvironmentMap(LoadTexture('Textures/Cubemaps/SACU_Cubemap.dds'))

		--Activate goal to learn psi blast in sasha's mind
		if (self:isLevelCompleted() ~= 1) then
			Global.goalManager:activate('LearnPsiBlast')
		end

		--SpawnScript('SA.Props.SneakyLampController', 'SneakyLampController')
		if (Global:loadGlobal('bSACompleted') == 1 or Global:load('bSAFB1Played') == 1) then
			for i,v in {'Lamp1', 'Lamp2', 'Lamp3'} do
				local lamp = FindScriptObject(v,1)
				if lamp ~= nil then lamp:killSelf() end
			end
		end

		self:setState('DisableKludge')
	end

	function Ob:onPostBeginLevel()
		if Global:load('LevelMusicName') == 'MegaCensor' then
			Global:save('LevelMusicName', 'SashasAction')
		end
		%Ob.Parent.onPostBeginLevel(self)
		
		Global:saveGlobal('bSACUEntered',1)
		-- play the ambient sound
		self.rAmbientSoundHandle = LoadSound('SAAmb')
		self:playSound(self.rAmbientSoundHandle, 1, 0, 1)

		--edit hide all collectibles at first
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(0)
		
		--self:sendMessage(FindScriptObject('ShoeManager'), 'ShutItDown', '')
		local ladder = FindScriptObject('Face3Ladder')
		if ladder then ladder:hide() end
		
		self.mc = FindScriptObject('MC')
		self.gravity:registerGravityNotify(self.mc)
		--note darts message will be sent to this levelscript
		self.gravity:registerGravityNotify(Global.player, self)
		
		if Global:load('SAMadeToMegaCensor') == 1 and Global:loadGlobal('bSACompleted') ~= 1 then
			self:setLevelToMegaCensor()		
		end
		
		FindScriptObject('Face1Spawner2').bPlayCutscene = 1
		FindScriptObject('Face2Spawner2').bPlayCutscene = 1
		FindScriptObject('Face3Spawner2').bPlayCutscene = 1
		--FindScriptObject('Face6Spawner2').bPlayCutscene = 1
		
		FindScriptObject('BottleTramp').bDontDoUpwardTracking = 1
		FindScriptObject('BottleTramp').bDontDoFloatingTarget = 1
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		RestoreFordCheering()
	end
	
	function Ob:stateDisableKludge()
		local sasha = FindScriptObject('Sasha')
		MM_DisableOOWKludge(1)
		
		if ( 1 == Global:load('bASPRRebrainingPlayed', 'AS') and 1 ~= Global:load('bASRUIntroPlayed', 'AS') and 1 ~= Global:load('bReentryRebrainedPlayed') ) then
			local tCS = {postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf=self, bEndCutsceneFadesIn = 0}
			tCS.sName = 'ReentryRebrained'
			Global.cutsceneScript:runCutsceneWithSettings(tCS)
		elseif (Global:loadGlobal('bSACompleted') == 1) then
			local tCS = {postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf=self, bEndCutsceneFadesIn = 0}
			if (Global:load('CALevelState', 'CA') == 7) and (Global:loadGlobal('bMCEntered') ~= 1) then
				if (Global:load('bReentryPostState7FirstTimePlayed') ~= 1 and Global:load('bReentryPreState7Played') ~= 1) then
					tCS.sName = 'ReentryPostState7FirstTime'
				elseif (Global:load('bReentryPostState7SecondTimePlayed') ~= 1) then
					tCS.sName = 'ReentryPostState7SecondTime'
                end
			else
				if (Global:load('bReentryPreState7Played') ~= 1) then
					tCS.sName = 'ReentryPreState7'
				end
			end
			Global.cutsceneScript:runCutsceneWithSettings(tCS)
		elseif (Global:load('bTutorialFinished') ~= 1) then
			if (Global:load('bSAFB3Played') == 1) then  -- done with censor or ammo, now just pull the switch
				Global.cutsceneScript:runCutscene('SAFB3Short', 0, 0, 1, 1)
			elseif (Global:load('bSAFB1Played') == 1) then  --done with lamps
				Global.cutsceneScript:runCutscene('SAFB1', 0, 0, 1, 1)
			else   --start over
				if (Global:load('SAIN1Played') ~= 1) then
					self:playVideo('cutscenes/prerendered/sain_1.xmv')
					Global:save('SAIN1Played', 1)
				end
				Global:setPlayerRespawnPointName(nil)			
				FindScriptObject('LampPedal'):showAllLamps(0, 0)
			end
		end
		MoveCameraToIdeal()
			
		if (Global:load('bTutorialFinished') == 1) then
			DomainSleep('tutorialDOMAIN', 1)
		end
		
		
		if (Global:loadGlobal('bSACompleted') ~= 1 and Global:load('bTutorialFinished') == 1 and Global:load('SAMadeToMegaCensor') ~= 1) then
			SetPhysicsFlag(sasha, PHYSICS_ORIENTTOGRAVITY, 0)
			sasha:makeInvisible()
		end
		
		if (Global:loadGlobal('bSACompleted') ~= 1 and Global:load('bSAFB3Played') ~= 1) then
			sasha:createTimer(sasha.TUTORIAL_TIME, sasha.TIMER_TUTORIAL)
			sasha:onTimer(sasha.TIMER_TUTORIAL)
		end
		local face = Global:load('currentFace')
		if (face == 1) then
			Global.cutsceneScript:getFace(1):setState('Open')
			Global.cutsceneScript:placeChar(Global.player, 297.2,-3658.9,113.1, 180,38,0)
			self.razOnExtrudedFace = 0
			self.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		elseif (face == 2) then
			Global.cutsceneScript:getFace(2):setState('Open')
			Global.cutsceneScript:placeChar(Global.player, -154.2,-4.5,-6.2, 0,-40.3,0.1)
			self.razOnExtrudedFace = 0
			self.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)		
		elseif (face == 3) then
			Global.cutsceneScript:getFace(3):setState('Open')
			Global.cutsceneScript:placeChar(Global.player, 1827.2,-2138.2,-449.7, 0,-46.6,-90)
			self.razOnExtrudedFace = 0
			self.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		elseif (face == 6) then
			Global.cutsceneScript:getFace(6):setState('Open')
			Global.cutsceneScript:placeChar(Global.player, -397.4,-2281.8,-1827.1, -90,0,-48.3)
			self.razOnExtrudedFace = 0
			self.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		end
		self:setState(nil)
	end

	function Ob:getHintResponse()
		if (Global:load('bSAFB3Played') ~= 1) then 
			return {
				{
					voice = "/GLAK000FO/",--DIALOG=<<Why don\'t you just do what Sasha said. Listen to your teacher young man!>>
				}
			}
		elseif (Global:load('bNowRazHasDoneItPlayed') ~= 1) then 
			return {
				{
					voice = "/GLAK001FO/",--DIALOG=<<Well, you might get your merit badge a little faster if you turn up the censor output all the way...>>
				}
			}
		elseif (Global:load('bShutdown6Played') ~= 1) then 
			return {
				{
					voice = "/GLAK002FO/",--DIALOG=<<You gotta find all those leaks that are squirting out censors, and take \'em out!>>
				},
				{
					voice = "/GLAK003FO/",--DIALOG=<<And when you\'re fighting these guys, don\'t forget to lock your mental focus on them for accuracy.>>
				}
			}
		elseif (FindScriptObject('MC').iPhase == 1) then 
			return {
				{
					voice = "/GLAK004FO/",--DIALOG=<<Those little censors seem to be restoring the big guy\'s health. >>
				},
				{
					voice = "/GLAK005FO/",--DIALOG=<<You gotta shut down the leaks the little censors are coming out of!>>
				}
			}
		elseif (FindScriptObject('MC').iPhase == 2) then 
			return {
				{
					voice = "/GLAK006FO/",--DIALOG=<<Take the big guy out! >>
				},
				{
					voice = "/GLAK007FO/",--DIALOG=<<Don\'t forget to hold mental focus while you\'re blasting!>>
				},
				{
					voice = "/GLAK008FO/",--DIALOG=<<Locking focus on him will also make it easier to circle around and get behind him!>>
				}
			}
		else
			return %Ob.Parent.getHintResponse(self)
		end
	end
	


	function Ob:playNewTheme()
		self:setLevelTheme(self.secondLevelTheme)
	end

	--receieved when raz changes faces
	function Ob:onFaceChange(data,from)
		GamePrint('RAZ FACE CHANGE')
		--deal with MC
		if (self.megaCensorStarted == 1) then
			if (Global.player.sacuFace == self.mc.sacuFace and self.mcSameFaceAsRaz ~= 1) then
				--GamePrint('SETTING DISTANCE ADJUST AND AUTO ROTATE')
				self.mcSameFaceAsRaz = 1
				Global.camControl:setSecondaryTarget(self.mc, BitOr(kSECONDARYFLAG_DISTANCE_ADJUST, kSECONDARYFLAG_AUTO_ROTATE), 1)
				SetChaseCameraDistanceAdjustParam(0)
				SetChaseCameraAutoRotateRange(90, 15)
			elseif (Global.player.sacuFace ~= self.mc.sacuFace and self.mcSameFaceAsRaz == 1) then
				--GamePrint('SETTING DISTANCE ADJUST')
				self.mcSameFaceAsRaz = 0
				Global.camControl:setSecondaryTarget(self.mc, kSECONDARYFLAG_DISTANCE_ADJUST, 1)
				SetChaseCameraDistanceAdjustParam(0)
				SetChaseCameraDistanceAdjustRange(2000)
			end
		--deal with facez
		elseif (Global:load('bTutorialFinished') == 1) then
			--GamePrint('CHECKING FAcE')
			if (Global:load('currentFace') and Global:load('currentFace') == Global.player.sacuFace and self.razOnExtrudedFace ~= 1) then
				--GamePrint('RAZ ON EXTRUDED FACE')
				self.razOnExtrudedFace = 1
				Global.camControl:removeCam(self.farCam)
				
				--Global.camControl:setSecondaryTarget(nil, kSECONDARYFLAG_DISTANCE_ADJUST, 1)
				--[[
				--if this is the first time on the open face, run the cutscene that shows the first spawner
				if (Global:load('currentFace') == 1 and self.face1Visited ~= 1) then
					self.face1Visited = 1
					Global.cutsceneScript.firstVisitFace = 1
					self:createTimer(self.playCSTime, self.TIMER_PLAY_SPAWNER_CS)
				elseif (Global:load('currentFace') == 2 and self.face2Visited ~= 1) then
					self.face2Visited = 1
					Global.cutsceneScript.firstVisitFace = 2
					self:createTimer(self.playCSTime, self.TIMER_PLAY_SPAWNER_CS)
				elseif (Global:load('currentFace') == 3 and self.face3Visited ~= 1) then
					self.face3Visited = 1
					Global.cutsceneScript.firstVisitFace = 3
					self:createTimer(self.playCSTime, self.TIMER_PLAY_SPAWNER_CS)
				elseif (Global:load('currentFace') == 6 and self.face6Visited ~= 1) then
					self.face6Visited = 1
					Global.cutsceneScript.firstVisitFace = 6
					self:createTimer(self.playCSTime, self.TIMER_PLAY_SPAWNER_CS)
				end
				]]--
				
				-- handle the sasha magic door intro to face 1
				-- this is based off of the above code, which was an old way to show the spawner valves
				local bRevisit = Global:loadGlobal('bSACompleted')
				if (Global:load('currentFace') == 1) and (self.face1Visited ~= 1) and (bRevisit ~= 1) then
					self.face1Visited = 1
					Global.cutsceneScript.firstVisitFace = 1
					self:createTimer(self.playCSTime, self.TIMER_PLAY_SASHA_DOOR_CS)
				end
				
			elseif (Global:load('currentFace') and Global:load('currentFace') ~= Global.player.sacuFace and self.razOnExtrudedFace == 1) then
				--GamePrint('RAZ OFFFF EXTRUDED FACE')
				self.razOnExtrudedFace = 0
				Global.camControl:removeCam(self.farCam)
				self.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
			end
		end
	end

	--[[	
	Ob.TIMER_PLAY_SPAWNER_CS = '4002'
	Ob.playCSTime = 1000
	--this timer is so raz has a little time for his upvector to adjust fully to the new gravity before playing the cutscene
	function Ob:onTimer(data,from)
		if (data == self.TIMER_PLAY_SPAWNER_CS) then
			if (GetPhysicsState(Global.player, PHYSICSSTATE_ONGROUND) == 1) then
				self:killTimer(data)
				Global.cutsceneScript:runCutscene('ShowNewFaceSpawner')
			end
		else
			%Ob.Parent.onTimer(self, data,from)
		end
	end
	]]--

	Ob.TIMER_PLAY_SASHA_DOOR_CS = '4002'
	Ob.playCSTime = 1000
	--this timer is so raz has a little time for his upvector to adjust fully to the new gravity before playing the cutscene
	function Ob:onTimer(data,from)
		if (data == self.TIMER_PLAY_SASHA_DOOR_CS) then
			if (GetPhysicsState(Global.player, PHYSICSSTATE_ONGROUND) == 1) then
				self:killTimer(data)
				local spawner1_1 = FindScriptObject('Face1Spawner1')
				if (spawner1_1 and spawner1_1.bIsActive == 1) then
					Global.cutsceneScript:runCutscene('SashaDoorHint1')
				end
			end
		else
			%Ob.Parent.onTimer(self, data,from)
		end
	end
	
	
	function Ob:setLevelToMegaCensor()
		DomainSleep('MegaCensorDomain', 0)
		DomainSleep('Face1Domain', 1)
		DomainSleep('Face2Domain', 1)
		DomainSleep('Face3Domain', 1)
		DomainSleep('Face4Domain', 1)
		DomainSleep('Face6Domain', 1)
		DomainSleep('VaultDOMAIN', 1)
		DomainSleep('tutorialDOMAIN', 1)

		self.bBossBattle = 1 -- disable parts of the hud
		Global.levelScript:setLevelTheme('MegaCensor')
		local sasha = FindScriptObject('Sasha')
		AttachEntityToEntityBone(sasha, FindScriptObject('MC'), 'stampFaceJ_1')
		sasha.flattened = 1
		sasha:setPosition(-80,-20,0)
		sasha:setOrientation(0,0,200)
		sasha:loadAnim('Anims/Sasha/Flattened.jan', 0, 1)
		sasha:setScale(1,0.5,1)
		SetPhysicsFlag(sasha, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(sasha, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(sasha, PHYSICS_APPLYGRAVITY, 0)
		--sasha:chatterStart()
		Global.levelScript.megaCensorStarted = 1
		Global.levelScript.camControl:pushAndSetChase(self, 1000, 5, 250, 120)
--		self:placeChar(Global.player,-1130.6, -3658.9, -1256.7,180, -131.6, 0, 0,-1,0)
		Global.player:setPosition(-1130.6, -3658.9, -1256.7)
		Global.player:setOrientation(180, -131.6, 0)
		Global.levelScript.mcSameFaceAsRaz = 1
		Global.camControl:setSecondaryTarget(FindScriptObject('MC'), BitOr(kSECONDARYFLAG_DISTANCE_ADJUST, kSECONDARYFLAG_AUTO_ROTATE), 1)
		SetChaseCameraDistanceAdjustParam(0)
		SetChaseCameraAutoRotateRange(90, 15)
		HideFordCheering(0)
		
		lamp = FindScriptObject('Lamp1',1)
		if lamp ~= nil then lamp:killSelf() end
		lamp = FindScriptObject('Lamp2',1)
		if lamp ~= nil then lamp:killSelf() end
		lamp = FindScriptObject('Lamp3',1)
		if lamp ~= nil then lamp:killSelf() end
	end

	function Ob:killAllCensors()
		local dieQuietly = function(self)
			local domainName = GetEntityDomain(self)
			if (self.bPooled ~= 1) and (IsDomainSleeping(domainName) ~= 1) then
				self.bDieQuietly = 1
				self:setState('Die')
			end
		end
		foreach_entity_oftype('Global.Enemies.Censor', dieQuietly)
	end
	
	return Ob
end

