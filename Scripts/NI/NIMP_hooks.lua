function NIMP_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    function Ob:onPreBeginLevel()
		self.tAmbientSoundLoops = {
			tv_Amb = { soundCueName = 'NIAmb' },
		}		
		--[[Adjust NIPhase variables, skipping Phases 2 and 3
        Other phases cause unwanted cutscenes and spawn points when returning to level]]
		local niPhase = Global:loadGlobal('NIPhase')
		if (not niPhase) then
			if (Global:loadGlobal('bNICompleted') == 1) then
				niPhase = 4
			else
				niPhase = 1
			end
			Global:saveGlobal('NIPhase', niPhase)
		end
		
		%Ob.Parent.onPreBeginLevel(self)
	end

	--FULL FUNCTION OVERRIDE
	--[[Removing and adjusting a LOT of flags set during this section to make the level work correctly.
	Normally has four seperate phases, Phase 2 has been modified to combine with Phase 3, prevents getting
	kicked out of the level multiple times]]
	function Ob:onBeginLevel()
		--This has to go before LevelScript's onBeginLevel for setPlayerRespawnPointName to work
		
		-- the lungFishGlassWall is used to make sure that the player can't get wedged in a weird spot when getting blown by the lungfish
		-- it needs to be deleted during certain stages of the level
		local lungFishGlassWall = FindScriptObject('lungfishblocker')
		
		local startState = nil

		--if Dogen Cutscene outside tower has been seen, but level not completed, spawn outside the tower
		if (Global:load('bNID1Played') == 1) and (Global:loadGlobal('bNICompleted') ~= 1) then
			Global:setPlayerRespawnPointName('respawnpoint3')
		--if egg has been broken, either before or after finishing level, spawn at the egg
		elseif (Global:loadGlobal('brokeNIMPEgg') == 1) then
            Global:setPlayerRespawnPointName('respawnpoint1')
		else
		--first time entry, egg not broken. Spawn at caravan
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
		
		--Skybox Parameters
		SetSkyBox('Levels/SkyBox/NI_SkyBox.plb')
		
		--dynamic light for after defeating the lungfish
		self.lungfishLightID = FindLight(nil, 'lungfishlight')
		SetLightBrightness(self.lungfishLightID, 0, 1)	-- turn it off
		SetLightRadius(self.lungfishLightID, 600)
		
		--register trigger volumes based on phase
		local niPhase = Global:loadGlobal('NIPhase')
		if (niPhase == 1) then
			RegisterTriggerVolume(self, 'tv_enterCaravan')
			RegisterTriggerVolume(self, 'tv_cueDoorOpening')
			RegisterTriggerVolume(self, 'tv_caravanSteps',0)
			RegisterTriggerVolume(self, 'tv_playLFCutscene')
		elseif( niPhase == 2) then
			RegisterTriggerVolume(self, 'tv_towerbase')
			--remove this so Raz doesn't get pulled to learn Levitation while going up the tower
			--RegisterTriggerVolume(self, 'tv_yawHint08')-- can use this to trigger pulled out to learn Levitation CS
			RegisterTriggerVolume(self, 'tv_LungfishLightTrigger')
			--moved from Phase 3, triggers cutscene at top of tower to enter Brain Tank boss
			RegisterTriggerVolume(self, 'tv_towertop')

			Global.goalManager:activate('BigMonster', nil, 1)

		--edit removed Phase 3 entirely

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
        	
   		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 6000)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, 10000)
		self.frictionConst = GetPhysicsConstant(PHYSICS_FRICTION)
		self.walkAccelConst = GetPhysicsConstant(PHYSICS_GroundWalkAccel)
		
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

	--FULL FUNCTION OVERRIDE
	--[[Changing one very specific line inside this function for now, a better method would be nice]]
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
				--[[First Dogen cutscene at bottom of tower
				normally checks if levitation active to deactivate cutscene
				changed to check if the cutscene itself has been seen already
				]]
				if Global:load('bNID1Played') == 1 then
					UnregisterTriggerVolume(self, 'tv_towerbase')
				else
					self:setState('DogenScene')
				end
			elseif TV == 'tv_towertop' and Global:loadGlobal('bNICompleted') ~= 1 then
				self:playVideo('cutScenes/prerendered/nid2.xmv')

				--entering tower, follow brain!
				Global.goalManager:activate('DogensBrain')
				
				local entity = FindScriptObject('LabStart')
				Global.player:setPosition(entity:getPosition())
				Global.player:setOrientation(entity:getOrientation())
				MoveCameraToIdeal()
				
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

	--FULL FUNCTION OVERRIDE
	--[[One small change to make sure we return to CU after seeing the Shadow Lungfish cutscene]]
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
				--play the prerender here - sasha pulls raz out of the level
				--stop all the music and ambience
				StopAllSounds()
				self:playVideo('cutScenes/prerendered/nice.xmv')
				Global.cutsceneScript:fadeToBlack(0)
				Global:saveGlobal('NIPhase', 2)
				Global.goalManager:activate('BigMonster')
				--return to CU instead
				Global.levelScript:returnToCU()
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





end