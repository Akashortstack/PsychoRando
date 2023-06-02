--		NIMP.lua
--
--      
--
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Amy Unger
---------------------------------------------------------------------------------

function NIMP(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
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
				'Anims/Objects/InventoryToss.jan',
				'Anims/DartNew/DamageFront_medium.jan',
				'Anims/DartNew/DoubleJump.jan',
				'Anims/DartNew/landsoft.jan',
				'Anims/DartNew/longjump.jan',
				'Anims/DartNew/standstill.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/DartNew/run.jan',
				'anims/DartNew/walk.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/ni_brambles/shake.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			}
		}
		
		Ob.theme = 'Nightmare'		
		Ob.sasha = nil
		Ob.bPlayedStepsDlg = 0
		Ob.bEnteredCaravan = 0
		Ob.bDoorOpened = 0
		Ob.caravanInterior = nil
		Ob.bunny = nil
		Ob.bCheckForCombatMood = 1
		
		local gassies = Global:loadGlobal('tNIMPGassies') or {}
		Global:saveGlobal('tNIMPGassies', gassies)
	end

	function Ob:onPreBeginLevel()
		self.tAmbientSoundLoops = {
			tv_Amb = { soundCueName = 'NIAmb' },
		}		
		
		--Adjust NIPhase variable (for loading from level menu)
		local niPhase = Global:loadGlobal('NIPhase')
		if (not niPhase) then
			if (Global:loadGlobal('bNICompleted') == 1) then
				niPhase = 4
			--edit removed to stop weird stuff
			--[[
			elseif (Global:loadGlobal('bMICompleted') == 1) then
				niPhase = 3
			elseif (Global:loadGlobal('bSACompleted') == 1) then
				niPhase = 2]]
			else
				niPhase = 1
			end
			Global:saveGlobal('NIPhase', niPhase)
		end
		
		%Ob.Parent.onPreBeginLevel(self)
	end
	
	function Ob:onBeginLevel()
		--This has to go before LevelScript's onBeginLevel for setPlayerRespawnPointName to work
		
		-- the lungFishGlassWall is used to make sure that the player can't get wedged in a weird spot when getting blown by the lungfish
		-- it needs to be deleted during certain stages of the level
		local lungFishGlassWall = FindScriptObject('lungfishblocker')
		
		local startState = nil

		--edit removing most of this to prevent spawn issues after completing other levels
		--[[
		if (Global:loadGlobal('bNICompleted') == 1) then
			if (not Global:getPlayerRespawnPointName()) then
	            Global:setPlayerRespawnPointName('respawnpoint1')
	        end
		elseif (Global:loadGlobal('bMICompleted') == 1) then	-- spawn by tree
			Global:setPlayerRespawnPointName('respawnpoint3')
			DomainSleep('CENSORS_bathTub', 1)
			if lungFishGlassWall then
				lungFishGlassWall:killSelf()
			end
		else]]
		if --[[(Global:loadGlobal('bSACompleted') == 1) or ]](Global:loadGlobal('brokeNIMPEgg') == 1) then	-- spawn at egg
            Global:setPlayerRespawnPointName('respawnpoint1')
		else
			SetSwitchableCollisionEnable(2,1)
            Global:setPlayerRespawnPointName('respawnpoint0')
			startState = 'Intro'
			if lungFishGlassWall then
				lungFishGlassWall:killSelf()
			end
		end
		
		if (Global:getPlayerRespawnPointName() == 'respawnpoint0' or Global:getPlayerRespawnPointName() == 'DartStart') then
			SetSwitchableCollisionEnable(2,1)
		end

		%Ob.Parent.onBeginLevel(self)
		
		--  Skybox Parameters
		SetSkyBox('Levels/SkyBox/NI_SkyBox.plb')
		
		-- dynamic light for after defeating the lungfish
		self.lungfishLightID = FindLight(nil, 'lungfishlight')
		SetLightBrightness(self.lungfishLightID, 0, 1)	-- turn it off
		SetLightRadius(self.lungfishLightID, 600)
		
		-- Phasing
		local niPhase = Global:loadGlobal('NIPhase')
		if (niPhase == 1) then
			RegisterTriggerVolume(self, 'tv_enterCaravan')
			RegisterTriggerVolume(self, 'tv_cueDoorOpening')
			RegisterTriggerVolume(self, 'tv_caravanSteps',0)
			RegisterTriggerVolume(self, 'tv_playLFCutscene')
		elseif( niPhase == 2) then
			RegisterTriggerVolume(self, 'tv_towerbase')
			RegisterTriggerVolume(self, 'tv_yawHint08')-- can use this to trigger pulled out to learn Levitation CS
			RegisterTriggerVolume(self, 'tv_LungfishLightTrigger')
			Global.goalManager:activate('BigMonster', nil, 1)
		elseif (niPhase == 3) then
			RegisterTriggerVolume(self, 'tv_towertop')
			Global.goalManager:activate('GetInsideTower', 1 ,1)
			self:activateLungfishLight()
		elseif( niPhase == 4 ) then
		
		else
		
		end
		
		RegisterTriggerVolume(self, 'tv_fakelungfish' )
		RegisterTriggerVolume(self, 'tv_dripmesh' )
		
		-- bunny advancement stuff
		RegisterTriggerVolume(self, 'tv_BunnyGoTo8')
		RegisterTriggerVolume(self, 'tv_BunnyGoTo15')
		RegisterTriggerVolume(self, 'tv_BunnyGoTo16')
		RegisterTriggerVolume(self, 'tv_BunnyGoTo17')
		RegisterTriggerVolume(self, 'tv_BunnyGoTo25')
		RegisterTriggerVolume(self, 'tv_BunnyGoTo28')
        
		-- Fog around caravan
		self.fog = SpawnScript('NI.Effects.CaravanGroundFogFX', 'fog', '', 1)
		self.fog:run()

		self.sasha = SpawnScript('SA.Characters.Sasha', 'Sasha')
		
		self.caravanDoor = FindScriptObject('CaravanDoor')
		self.caravan = FindScriptObject('Caravan')
		self.eggInside = FindScriptObject('EggInside')
		self.eggInside:makeInvisible()
		
		self.caravanInteriorBack = FindScriptObject('CaravanInteriorBack')
		SetPhysicsFlag(self.caravanInteriorBack, PHYSICS_COLLIDEE, 0)
		
		self.caravanInterior = FindScriptObject('CaravanInterior')
		SetPhysicsFlag(self.caravanInteriorBack, PHYSICS_COLLIDER, 0)
        
		--hack, set absolutely, cuz testing screws it up		
		-- OUCH: duplicate HACK from LLLL... :(
   		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 6000)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, 10000)
		self.frictionConst = GetPhysicsConstant(PHYSICS_FRICTION)
		self.walkAccelConst = GetPhysicsConstant(PHYSICS_GroundWalkAccel)

		--For raz's reaction to second vault
		Global.player:addSpamListener('Vault', self)
		
		self.dripFX = SpawnScript('AS.Effects.WaterDripFX','tubWaterDrip','',1)
		
		-- create the triggersphere for the line
		self.rTurnipLineSphere = TriggerSphere_New(50.7135,-617,-12721, 1000)
		Trigger_RegisterListener(self.rTurnipLineSphere, self)

		--Register for oatmeal messages so we can turn the geometry on and off when teleporting.
		self.caravanOatmeal = FindScriptObject('NIMPOatmeal1') --The oatmeal by the caravan
		foreach_entity_oftype('Global.Characters.Oatmeal', function(o) o:addListener(%self) end)
		SetEntityDomain(self.caravanOatmeal, 'Prologue_domain')
		
		self:setState(startState)
	end
	

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Melee = {num = 3, censorCode = 'Melee', scriptName = nil},
									Suicide =  {num = 5, censorCode = 'Suicide', scriptName = nil},
									Minion = {num = 5, censorCode = 'Minion', scriptName = nil},
									Sniper = {num = 2, censorCode = 'Sniper', scriptName = nil},
		}
	end
	

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		
		local gassies = Global:loadGlobal('tNIMPGassies')
		for name, value in gassies do
			local meat = fso(name)
			meat:setState('Transform')
		end
		self.sasha:setPosition(-10000, -10000, -10000)
		SetPhysics(self.sasha, kPHYSICS_NONE)

		
		self.bunny = FindScriptObject('bunny')
		if Global:loadGlobal('bNICompleted') then
			self.bunny:killSelf()
			self.bunny = nil
		end

		if (Global:load('bMyOwnCreationPlayed') ~= 1) then
			local firstSpawner = FindScriptObject('CensorPortal1')
			firstSpawner.beginStateOpen = function(self)
				SetEntityFlag(self.animator, ENTITY_NOSIMULATE, 0)
				Global.cutsceneScript:runCutscene('MyOwnCreation')
				self.beginStateOpen = nil	-- Only do this once!
			end
		end
		self:runRevisitHint()	

	end

	function Ob:onEndLevel()
		self:setNormalLookBox()
		%Ob.Parent.onEndLevel(self)		
	end
	
	function Ob:stateIntro()
		if( 1 ~= Global:load( 'bIntroPlayed') ) then
			self:playVideo('cutScenes/prerendered/niin.xmv')
			Global.cutsceneScript:runCutscene('Intro', 1, 1, 0)
		end
		self:setState(nil)
	end
	
	function Ob:stateOpenDoor()
		self.eggInside:stopOrPlayStaticSound(1)	-- 1 means play
		local door = FindScriptObject('CaravanDoor')
		if door then
			local rx, ry, rz = door:getOrientation()
			door:rotateTo(0, ry + 40, 0, 0, 0, -60, 0)
		end
		self.bDoorOpened = 1		
		self:setState(nil)
	end
	
	function Ob:stateCaravanSteps()
        self.bPlayedRazStepsDlg = 1
		Global.player:sayLine("/NIVI001RA/", 1, 1, nil, 1, nil, 1) -- DIALOG=<<Sasha, I'm going inside of the caravan.>>
        self.sasha:sayLine("/NIVI002SA/", 1, 1, nil, 1, nil, 1) -- DIALOG=<<What do you see inside?>>
		self.bPlayedSashaStepsDlg = 1
		self:setState(nil)
	end
	
	function Ob:stateEnterCaravan()
		self.eggInside:stopOrPlayStaticSound(0)	-- 0 means stop
		if self.bPlayedSashaStepsDlg == 1 then
			Global.player:sayLine("/NIVI003RA/", 1, 1, nil, 1, nil, 1) -- DIALOG=<<I'm not sure. It's getting fuzzy.>>
		end
		self.bEnteredCaravan = 1
		self:sendMessage(self.eggInside, 'EnteredCaravan', 0)
		self:setState(nil)
	end
	
	function Ob:stateDogenScene()
		self:playVideo('cutScenes/prerendered/nid1.xmv')
		Global:save('bNID1Played', 1)
		UnregisterTriggerVolume(self, 'tv_towerbase')
		Yield()
		--STAGEDIRECTION= <<RIGHT AFTER RAZ SEES NID1. THESE LINES PLAY WITHOUT PAUSING THE GAME>> --LINECODE=NIAD001**
		Global.player:sayLine("/NIAD002RA/",1, 1, nil, 1, nil, 1) --DIALOG=<<Don't worry Dogen, I'm coming up there to save you!>>
		self.sasha:sayLine("/NIAD003SA/",1, 1, nil, 1, nil, 1) --DIALOG=<<What is wrong, Rasputin?>>
		Global.player:sayLine("/NIAD004RA/",1, 1, nil, 1, nil, 1) --DIALOG=<<No time to explain, Sasha.  I gotta climb this spooky thorn tower.>>

		--Activate tower climbing goal
		Global.goalManager:activate('GetInsideTower')

		self:setState(nil)
	end
	
	--For Raz's reaction after seeing second vault
	function Ob:listenerVault(reelName)
		if (reelName == 'NIMPVault2' and 1 ~= Global:loadGlobal('bNICompleted') )then
			self:setState('CheapBrainTumbler')
		end
	end
	function Ob:stateCheapBrainTumbler()
		Global.player:sayLine("/NIAA000RA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<Okay, what the hell was that???>>
		Global.player:sayLine("/NIAA001RA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<I'm seeing some crazy stuff in here Sasha. This can't be right.>>
		self.sasha:sayLine("/NIAA002SA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<Ach.  Why did I buy the CHEAP brain tumbler?>>
		self:setState(nil)
	end
	

	function Ob:onEnteredTriggerVolume(TV, who)
		if who == Global.player then
			if TV == 'tv_cueDoorOpening' then
				if self.bDoorOpened ~= 1 then
					self:setState('OpenDoor')
				end
			elseif TV == 'tv_caravanSteps' then
				if self.bPlayedRazStepsDlg ~=1 then
					self:setState('CaravanSteps')
				end
			elseif TV == 'tv_towerbase'then
				if IsPowerEnabled(kPOWER_LEVITATION) == 1 then
					UnregisterTriggerVolume(self, 'tv_towerbase')
				else
					self:setState('DogenScene')
				end
			elseif TV == 'tv_towertop' and Global:loadGlobal('bNICompleted') ~= 1 then
				self:playVideo('cutScenes/prerendered/nid2.xmv')

				--Completed goal for entering tower, follow brain!
				Global.goalManager:activate('DogensBrain')
				
                -- BRAD - don't go to NIBA here, we're going inside the tower
				local entity = FindScriptObject('LabStart')
				Global.player:setPosition(entity:getPosition())
				Global.player:setOrientation(entity:getOrientation())
				MoveCameraToIdeal()
				
                --self.cutsceneScript:fadeToBlack(0)
				--self:loadNewLevel('NIBA', 1, 1)	-- load NIBA
			elseif TV == 'tv_fakelungfish' then
				self:setDeepLookBox()
			elseif TV == 'tv_dripmesh' then 
				self.dripFX:run()
			elseif TV == 'tv_LungfishLightTrigger' then
				self:activateLungfishLight()
				UnregisterTriggerVolume(self, 'tv_LungfishLightTrigger')
			elseif (strfind(TV, 'tv_BunnyGoTo')) and self.bunny then
				-- these are special triggers that are named 'tv_BunnyGoToXXX'
				-- the number is extracted below and then the bunny is told to go to the new waypoint
				local waypointNum = gsub(TV, 'tv_BunnyGoTo', '')
				self.bunny:setDestinationWaypoint(tonumber(waypointNum))
			elseif (TV == self.rTurnipLineSphere) then
				if (Global:load('bHeardTurnipLine') ~= 1) then
					Global.player:sayLine("/NIAE000RA/", 0, 1, nil, 1)
					Global:save('bHeardTurnipLine', 1)
				end
			end
		end
		%Ob.Parent.onEnteredTriggerVolume(self, TV, who)
	end

	function Ob:onExitedTriggerVolume(TV, who)
		if who == Global.player then
			if TV == 'tv_fakelungfish' then
				self:setNormalLookBox()
			elseif TV == 'tv_dripmesh' then 
				if self.dripFX then self.dripFX:stop(1) end
			end
		end
		%Ob.Parent.onExitedTriggerVolume(self, TV, who)
	end
	
	function Ob:onCrossedTriggerPlane(tvName, from)
		if (from == Global.player) then
			if tvName == 'tv_enterCaravan' and self.bEnteredCaravan ~= 1 then
				UnregisterTriggerVolume(self, 'tv_cueDoorOpening')	-- this prevents any chance of saylines playing again
				UnregisterTriggerVolume(self, 'tv_caravanSteps')
				UnregisterTriggerVolume(self, 'tv_enterCaravan')
				
				self:setRazEggInteriorEnvironment()
			
				FindScriptObject('CaravanRailCam'):turnOff()
				self.eggCam = Global.camControl:pushAndSetChase(self, 200, 5, 100)

				self:setState('EnterCaravan')
			elseif tvName == 'tv_playLFCutscene' then
				-- play the prerender here - sasha pulls raz out of the level
				--stop all the music and ambience
				StopAllSounds()
				self:playVideo('cutScenes/prerendered/nice.xmv')
				Global.cutsceneScript:fadeToBlack(0)
				Global:saveGlobal('NIPhase', 2)
				Global.goalManager:activate('BigMonster')
				--edit return to CU instead
				Global.levelScript:returnToCU()
				--Global.levelScript:loadNewLevel('CASA', 0, 1)
			elseif tvName == 'tv_yawHint08' then
				self.cutsceneScript:runCutscene('GoToMI', 0, 0)
			elseif (strfind(tvName, 'tv_BunnyGoTo')) and self.bunny then
				-- these are special triggers that are named 'tv_BunnyGoToXXX'
				-- the number is extracted below and then the bunny is told to go to the new waypoint
				local waypointNum = gsub(tvName, 'tv_BunnyGoTo', '')
				self.bunny:setDestinationWaypoint(tonumber(waypointNum))
			end
		end
	end
	
	function Ob:onPreTeleport(data, from)
		if (from == self.caravanOatmeal) then
			self:setRazEggInteriorEnvironment()
			DomainSleep('Prologue_domain', 1)
		elseif (data == self.caravanOatmeal.Name) then
			self:setRazCaravanEnvironment()
			DomainSleep('Prologue_domain', 0)
		else
			HardBreak('Got message from rogue oatmeal!')
		end
	end

	function Ob:setRazEggInteriorEnvironment()
		-- enable the geometry to block Raz in
		SetAnimatedTexturePlayMode('Textures/LevelTextures/MC_MeatCircus/MC_tv_static01.tga',kANIMTEXMODE_STOP,0,self.caravanInterior)
		SetAnimatedTexturePlayMode('Textures/LevelTextures/MC_MeatCircus/MC_tv_static01.tga',kANIMTEXMODE_STOP,0,self.caravanInteriorBack)
		SetAnimatedTexturePlayMode('Textures/LevelTextures/MC_MeatCircus/MC_tv_static01.tga',kANIMTEXMODE_STOP,0,self.eggInside)
		
		--make the caravan disappear and switch collision geometry
		self.eggInside:makeVisible()
		self.caravan:makeInvisible()
		self.caravanInterior:makeInvisible()
		self.caravanInteriorBack:makeInvisible()
		self.caravanDoor:makeInvisible()
		
		SetPhysicsFlag(fso('CaravanVault'), PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(fso('NIMPOatmeal1'), PHYSICS_APPLYGRAVITY, 0)
		
		SetSwitchableCollisionEnable(1,1)
		SetSwitchableCollisionEnable(2,0)
	end
	
	function Ob:setRazCaravanEnvironment()
		self.bDoorOpened = 0
		FindScriptObject('CaravanDoor'):setOrientation(4.845, -139.921, -0.248993)
		
		self.eggInside:makeInvisible()
		self.caravan:makeVisible()
		self.caravanInterior:makeVisible()
		self.caravanInteriorBack:makeVisible()
		self.caravanDoor:makeVisible()
		
		SetSwitchableCollisionEnable(1,0)
		SetSwitchableCollisionEnable(2,1)

		SetPhysicsFlag(fso('CaravanVault'), PHYSICS_APPLYGRAVITY, 1)
		SetPhysicsFlag(fso('NIMPOatmeal1'), PHYSICS_APPLYGRAVITY, 1)
	end
	
	function Ob:onBrokeEgg()	-- called by the egg LSO when its played the nivi cutscene
		self:setRazCaravanEnvironment()
		Global:saveGlobal('brokeNIMPEgg', 1)
	end
	
	function Ob:onGassyMeatFarting(name)
		local gassies = Global:loadGlobal('tNIMPGassies')
		gassies[name] = 1
		Global:saveGlobal('tNIMPGassies', gassies)
	end
	
	function Ob:activateLungfishLight()
		SetLightBrightness(self.lungfishLightID, 1, 1000)
	end
	
	function Ob:setDeepLookBox()
		SetPlayerLookBox(250, 700, 5000)
	end
	
	function Ob:setNormalLookBox()
		SetPlayerLookBox(250, 700, 2000)
	end
	
	function Ob:getHintResponse()
		--Default to this
		if (Global:loadGlobal('brokeNIMPEgg') ~= 1) then 
			-- before breaking the egg
			return {
				{
					voice = "/GLAM000FO/",--DIALOG=<<Let\'s check out what\'s inside that caravan. Don\'t be afraid of your past.>>
				},
			}
		elseif (Global:load('bNID1Played') == 1) then
			-- seen the dogen scene
			return {
				{
					voice = "/GLAM005FO/"--DIALOG=<<We gotta get up to the top of that vine tower!>>
				},
			}				
		elseif (Global:load('bFakeLungfishDead') ~= 1 and Global:loadGlobal('bSACompleted') == 1) then
			-- after SA, before killing the lungfish
			return {
				{
					voice = "/GLAM001FO/"--DIALOG=<<Hey, you heard the man. Follow the bunny.>>
				},
			}			
		elseif (Global:load('bFakeLungfishDead') == 1 and Global:loadGlobal('bSACompleted') == 1) then
			-- after SA, after killing the lungfish
			return {
				{
					voice = "/GLAM002FO/"--DIALOG=<<Keep after that bunny!>>
				},
				{
					voice = "/GLAM003FO/"--DIALOG=<<Watch out for those killer plants. You can\'t hurt them when they\'re all coiled up.>>
				},
				{
					voice = "/GLAM004FO/"--DIALOG=<<Stay on the ground if you want to fight, but you could probably avoid some of it if you took the higher route. >>
				},
			}				
		else
			return %Ob.Parent.getHintResponse(self)
		end
	end
	
	function Ob:setState(state)
		%Ob.Parent.setState(self, state)
		state = state or 'nil'
		GamePrint('going to '..state)
	end

	return Ob
end


