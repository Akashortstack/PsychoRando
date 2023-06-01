--*
--*              'CAJA.lua'
--*					
--*
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.
--*            All Rights Reserved.
--*        Proprietary and Confidential...
--*					...and of course, Pimp

function CAJA(Ob)
	if not Ob then
		Ob = CreateObject('CA.CALevelScript','CAJA');
		Ob.dependencies = {
			animations = {
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/landsoft.jan',
				'Anims/Benny/Talk.jan',
				'Anims/Bobby/B_Breathe.jan',
				'Anims/Bobby/Talk_point.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Campkids/Breathe.jan',
				'Anims/Campkids/JumpJoy02.jan',
				'Anims/Campkids/No.jan',
				'Anims/Campkids/Point_front.jan',
				'Anims/Campkids/Point_right.jan',
				'Anims/Campkids/Sigh.jan',
				'Anims/Campkids/Talk_crossarms_start.jan',
				'Anims/Campkids/Talk_handneck_end.jan',
				'Anims/Campkids/Talk_handneck_start.jan',
				'Anims/Campkids/Talk_lookRt_start.jan',
				'Anims/Campkids/Talk_lookLt_start.jan',
				'Anims/Campkids/Talk_lookLt_end.jan',
				'Anims/Campkids/Yes.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_FistWidePalmUp_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/LookUp_headJA_1.jan',
				'Anims/DartNew/DartIdle01.jan',
				'Anims/DartNew/GetBacon.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/Ninja_slapped.jan',
				'Anims/DartNew/No.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/Squint.jan',
				'Anims/DartNew/Talk_1.jan',
				'Anims/DartNew/Talk_2.jan',
				'Anims/DartNew/Talk_3.jan',
				'Anims/DartNew/Talk_4.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/TeleportLookAround_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/Throw.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/gesture01.jan',
				'Anims/DartNew/gesture04.jan',
				'Anims/DartNew/run_start.jan',
				'Anims/DartNew/standstill.jan',
				'Anims/DartNew/walkmove.jan',
				'Anims/Dogen/Creep.jan',
				'Anims/Janitor/A_HeadNod_scout.jan',
				'Anims/Janitor/A_RazPoint_IN_scout.jan',
				'Anims/Janitor/A_RazPoint_scout.jan',
				'Anims/Janitor/A_RazPoint_OUT_scout.jan',
				'Anims/Janitor/A_SurprizeIN_scout.jan',
				'Anims/Janitor/A_SurprizeOUT_scout.jan',
				'Anims/Janitor/A_Thoughtful_IN_scout.jan',
				'Anims/Janitor/A_Thoughtful_LOOP_scout.jan',
				'Anims/Janitor/A_Thoughtful_OUT_scout.jan',
				'Anims/Janitor/A_TurnLf_mv_scout.jan',
				'Anims/Janitor/A_TurnRt_mv_scout.jan',
				'Anims/Janitor/A_Viola_scout.jan',
				'Anims/Janitor/A_awShucks_scout.jan',
				'Anims/Janitor/A_git_scout.jan',
				'Anims/Janitor/B_A_scout.jan',
				'Anims/Janitor/B_breathe_scout.jan',
				'Anims/Janitor/GiveBacon_Priority.jan',
				'Anims/Janitor/GivePermit_PermitFloat.jan',
				'Anims/Janitor/Ninja_Breathe.jan',
				'Anims/Janitor/Ninja_Idle1.jan',
				'Anims/Janitor/NogginPoint.jan',
				'Anims/Janitor/PointUp.jan',
				'Anims/Janitor/Talk1_cook.jan',
				'Anims/Janitor/Talk_bah.jan',
				'Anims/Objects/Float.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/PSIChallenge/ShelfIdle.jan',
				'Anims/PSIChallenge/Spin.jan',
				'Anims/PsiChallenge/Collect.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/hop.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/DartNew/run.jan',
				'anims/DartNew/walk.jan',
				'anims/Dartnew/tk_turn.jan',
				'cutScenes/BVBC/Shock2.jan',
				'anims/ca_lamps/lamplantern_shake.jan',
				'anims/ca_plantshake/grass.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
				'Anims/Campkids/Talk_crossarms_end.jan',
			}
		}
		
		Ob.theme = 'JanitorsSacredHall'
		Ob.sLoopingAmbSoundCueName = 'CAJAAmb'
		Ob.sOneShotAmbSoundCueName = ''

		--Triggers to be registered		
		Ob.doorwayTriggerName = 'tv_doorway'
		Ob.observationTriggerName = 'tv_observation'
		Ob.redemptionTriggerName = 'tv_redemption'


	end
    
	function Ob:onBeginLevel()
		self.sOneShotAmbSoundCueName = nil
		local state = Global:load('CALevelState')

		%Ob.Parent.onBeginLevel(self)

		--edit function for placing appropriate rando items
		self.ranks = FindScriptObject('RankUpPlacer')
		if not self.ranks then
			self.ranks = SpawnScript('CA.RankUpPlacer', 'RankUpPlacer')
		end

		self.ford = FindScriptObject('Ford', 1)
		if not self.ford then
			self.ford = SpawnScript('CA.Characters.Ford','Ford','',1)
		end

		-- PsitaniumFX
		self.psitaniumFX = SpawnScript('CA.Effects.PsitaniumChunkFX')
		self.psitaniumFX:run()				

		--Wtf is this?        
		FindScriptObject('LowerTKGateCam'):killSelf()
		
		--Locator for where to put the player when he tries to enter the doorway before he is ready.
		self.playerDoorwayLoc = SpawnScript('Locator', 'PlayerDoorwayLoc')
		self.playerDoorwayLoc:setPosition(-551.33, 1411.73, -2170.9)
		self.playerDoorwayLoc:setOrientation(0, -97.86, 0)
		
		--Register trigger to show redemtion intro
		if (Global:load('bCAJARedemptionMachineIntroPlayed') ~= 1) then
			Trigger_RegisterListener(TriggerOBB_Lookup(nil, self.redemptionTriggerName), self)
		end
		
		-- if this isn't state 7, no kids should be in the brain room
		if (Global:load('CALevelState') ~= 7) then
			foreach_entity_oftype('Global.Props.Geometry', function(ent) if strfind(ent.Name, 'Fake') then ent:killSelf() end end)
		else
			Global:save('bBeenToCAJAInState7', 1 )
			-- kill off all the fake kids that have been rebrained
			foreach_entity_oftype('Global.Props.Geometry', 
				function(ent) 
					local name = gsub(ent.Name, 'Fake', '')
					if strfind(ent.Name, 'Fake') and Global:load('b'..name..'Rebrained') == 1 then 
						ent:killSelf() 
					end 
				end
			)
		end
		
		-- fog for tutorial area
		self.fog = SpawnScript('NI.Effects.CaravanGroundFogFX', 'fog', '', 1)
        self.fog:run()
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		--edit
		self.ranks:randoRanks()
	
		--Run the intro the first time the player  enters the level
		--edit removed first intro, speeds things up and less teleporting
		--[[if (Global:load('bSeenFordIntro') ~= 1) then
			self:setState('FordIntro')]]
		if (Global:load('CALevelState') == 7) then
			--edit removed this one too
			--if (Global:load('bLiliKidnapped') == 1) then
				self:setState('ObservationIntro')
			--else
				--self:setState('DoorwayIntro')
			--end
		else
			self:setState('NoIntro')
		end
	end

	function Ob:stateNoIntro()
		--Yield a couple frames to give the treestump cutscene a chance to start
		for i = 1, 3, 1 do
			Yield()
		end
		
  		-- check to see if a power tutorial is coming after this, if it is set the cutstom CAJACutscenes flag to not fade in.
  		local newPower, powerName = Global.player.rankPowerManager:getPowerToBeTaught()
  		if newPower then Global.cutsceneScript.bDontFadeInAfterIntro = 1 end
  		
		--Wait for treestump cutscene to complete
		while (Global.cutsceneScript.cutscenePlaying == 1) do
			Yield()
		end
		self.ford:setFordPosition('cajaMainPlatform')
		self:teachNewPowers()
		
		if Global.player:isInInventory('Bacon') ~= 1 then
			--Play cutscene where Raz gets the bacon, 
			--this would only play here if you saved during the stateIntro state and then reloaded the level
			Global.cutsceneScript:runCutscene('CAJAISmellBacon', 1)
		end		
		
		self:setState(nil)
	end

	-- Blocks until all new powers have been taught.
	-- returns 1 if and only if new powers were taught.
	function Ob:teachNewPowers(bActivateAfterTutorial)
		local newPower, powerName = Global.player.rankPowerManager:getPowerToBeTaught()
		local bHadPower = 0
		while newPower do
			bHadPower = 1
			EnablePower(newPower)
			self.ford.powerName = powerName
			self.ford.newPower = newPower
			self.ford.bPlayingTutorial = 1
			Global.cutsceneScript:runCutscene('TutorialIntro',1,0,0)
			while self.ford.bPlayingTutorial == 1 or Global.cutsceneScript.currCSName do
				Yield()
			end
			newPower, powerName = Global.player.rankPowerManager:getPowerToBeTaught()
		end
		if bHadPower == 1 and bActivateAfterTutorial == 1 then
			self.ford.bActivated = 1
			self.ford:setState('CAJA')
		end
		return bHadPower
	end

	--State for the first time you enter Ford's sanctuary
	function Ob:stateFordIntro()
		--Yield a couple frames to give the treestump cutscene a chance to start
		Global.cutsceneScript:fadeToBlack(0)
		for i = 1, 3, 1 do
			Yield()
		end
		
  		-- check to see if a power tutorial is coming after this, if it is set the cutstom CAJACutscenes flag to not fade in.
  		local newPower, powerName = Global.player.rankPowerManager:getPowerToBeTaught()
  		if newPower then Global.cutsceneScript.bDontFadeInAfterIntro = 1 end
  		
		--Wait for treestump cutscene to complete
		while (Global.cutsceneScript.cutscenePlaying == 1) do
			Yield()
		end

		--Run intro cutscene				
		Global.cutsceneScript.bDontFadeInAfterIntro = 1
		Global.cutsceneScript:runCutscene('CAJAFordIntro', 1)
		Global:save('bSeenFordIntro', 1)

		--Place ford on the main platform		
		self.ford:setFordPosition('cajaMainPlatform')

		-- Hey, any new powers to teach?
		self:teachNewPowers()

		Global.cutsceneScript:fadeIn(0.2)
		--Enter main dialog tree and wait for it to complete
		self.ford:startTree(self.ford:getCAJADialogTable(), 1)

		--Play cutscene where Raz gets the bacon
		Global.cutsceneScript:runCutscene('CAJAISmellBacon', 1)
		
		self:setState(nil)
	end

	--For state 7 before Lili gets kidnapped
	function Ob:stateDoorwayIntro()
		--Yield a couple frames to give the treestump cutscene a chance to start
		Global.cutsceneScript:fadeToBlack(0)
		for i = 1, 3, 1 do
			Yield()
		end
		
		--Wait for treestump cutscene to complete
		while (Global.cutsceneScript.cutscenePlaying == 1) do
			Global.cutsceneScript.bDontFade = 1
			Yield()
		end
		
		--Put ford in the doorway
		self.ford:setFordPosition('cajaDoorway')
		
		if self:teachNewPowers() ~= 1 then
			Global.cutsceneScript:runCutscene('CAJAGoGetHer', 1)
		end
		
		--Register trigger to keep raz out of the hallway
		Trigger_RegisterListener(TriggerOBB_Lookup(nil, self.doorwayTriggerName), self)
		self:setState(nil)
	end

	--For state 7 after Lili gets kidnapped
	function Ob:stateObservationIntro()
		--Yield a couple frames to give the treestump cutscene a chance to start
		Global.cutsceneScript:fadeToBlack(0)
		for i = 1, 3, 1 do
			Yield()
		end
		
		--Wait for treestump cutscene to complete
		while (Global.cutsceneScript.cutscenePlaying == 1) do
			Yield()
		end
		
		if (Global:load('bSeenFordComeUpHere') == 1) then
			--Put ford at the end of the hallway
			self.ford:setFordPosition('cajaObservationRoom')
		else
			self.ford:setFordPosition('cajaDoorway')		
		end
		
		if (Global:load('bSeenFordComeUpHere') ~= 1) then
			self.ford.bDontFadeInAfterTutorial = 1
		end
		self:teachNewPowers()

		--Play cutscene
		if (Global:load('bSeenFordComeUpHere') ~= 1) then
			Global.cutsceneScript:runCutscene('CAJAComeUpHere', 1)
			Global:save('bSeenFordComeUpHere', 1)
		end

		--Put ford at the end of the hallway
		self.ford:setFordPosition('cajaObservationRoom')

		--Register trigger to play cutscene
		Trigger_RegisterListener(TriggerOBB_Lookup(nil, self.observationTriggerName), self)

		Global.cutsceneScript:fadeIn(0)
		
		self:setState(nil)
	end

	--Explain the observation room, then slap Raz till he agrees to help
	function Ob:stateObservationExplanation()						 
		--Play first part of cutscene
		Global.cutsceneScript:runCutscene('CAJATheRealFordCruller', 1, 1)
		
		--Slapping dialog
		self.ford:setState('SlapRaz')
		self:setState(nil)
	end

	--Explain the redemption machines
	function Ob:stateRedemptionExplanation()
		--play redemption machine scene
		Global.cutsceneScript:runCutscene('CAJARedemptionMachineIntro', 1)		
		self:setState(nil)
	end

	
	function Ob:onEnteredTriggerVolume(data, from)
		if (data == self.doorwayTriggerName and from == Global.player) then
			--Raz tried to get down hallway when he shouldn't.  Kick him out.
			Global.cutsceneScript:runCutscene('CAJAGoGetHer')
			Global.player:setPosition(self.playerDoorwayLoc:getPosition())
			Global.player:setOrientation(self.playerDoorwayLoc:getOrientation())
		elseif data == self.observationTriggerName and from == Global.player then
			--Play observation room explanation if it hasn't been seen yet
			if (Global:load('bSeenObservationExplanation') ~= 1) then
				self:setState('ObservationExplanation')
				Global:save('bSeenObservationExplanation', 1)
			end
		elseif data == self.redemptionTriggerName and from == Global.player then
			--Register trigger to show redemtion intro
			if (Global:load('bCAJARedemptionMachineIntroPlayed') ~= 1) then
				self:setState('RedemptionExplanation')
			end			
		else
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

	-- Called from CAJARedemptionMachineIntro, to see if we should skip the line about getting PK.
	function Ob:shouldPlayBurnLine()
		if Global:loadGlobal('bFirestartingAvailable') == 1 or Global:loadGlobal('bFirestartingAvailable') == 2 or Global:loadGlobal('bFirestarting') == 1 then
			return 1
		end
	end
	
	function Ob:debugKids(name)
		local kid = fso(name) or SpawnScript('CA.Characters.'..name, name, '')
		kid:setPosition(-3938.3, 1435.6, -4847.6)
		kid:show()		
	end
	
    return Ob
end
