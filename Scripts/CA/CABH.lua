--*
--*              'CABH.lua'
--*					
--*
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.
--*            All Rights Reserved.
--*        Proprietary and Confidential...
--*					...and Pimp, of course


function CABH(Ob)
	if not Ob then
		Ob = CreateObject('CA.CALevelScript')
		Ob.dependencies = {
			scripts = {
				'CA.Props.Canoe'
			},
			animations = {
				'Anims/Benny/Scared.jan',
				'Anims/Benny/Talk.jan',
				'Anims/Bobby/B_Breathe.jan',
				'Anims/Bobby/CABH234BobbyButton.jan',
				'Anims/Bobby/Cower.jan',
				'Anims/Bobby/Talk_point.jan',
				'Anims/Bobby/TKed_end.jan',
				'Anims/Bobby/TKed_loop.jan',
				'Anims/Bobby/TKed_start.jan',
				'Anims/CA_ArrowheadMover/spin.jan',
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/Campkids/ArmInArmBlock_franke.jan',
				'Anims/Campkids/FishTalk_elton.jan',
				'Anims/Campkids/Kissing_elton.jan',
				'Anims/Campkids/LookAround.jan',
				'Anims/Campkids/No.jan',
				'Anims/Campkids/Talk_handneck_end.jan',
				'Anims/Campkids/Talk_handneck_start.jan',
				'Anims/Campkids/Talk_lookLt_start.jan',
				'Anims/Campkids/Talk_lookLt_end.jan',
				'Anims/Campkids/Talk_lookRt_end.jan',
				'Anims/Campkids/Talk_lookRt_start.jan',
				'Anims/Campkids/Talk_shrug.jan',
				'Anims/Campkids/Wink.jan',
				'Anims/Campkids/Yes.jan',
				'Anims/DartNew/Grabbed.jan',
				'Anims/DartNew/Hop_water.jan',
				'Anims/DartNew/CrawlOutofWater.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Talk_1.jan',
				'Anims/DartNew/Talk_2.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/TeleportLookAround_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/Victory.jan',
				'Anims/DartNew/VictoryDance.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/gesture02.jan',
				'Anims/Janitor/A_Thoughtful_IN_scout.jan',
				'Anims/Janitor/A_Thoughtful_LOOP_scout.jan',
				'Anims/Janitor/A_Thoughtful_OUT_scout.jan',
				'Anims/Janitor/A_RazPoint_scout.jan',
				'Anims/Janitor/A_TurnToCam_scout.jan',
				'Anims/Janitor/A_awShucks_scout.jan',
				'Anims/Janitor/A_git_scout.jan',
				'anims/janitor/a_startled_scout.jan',
				'Anims/Janitor/B_breathe_scout.jan',
				'Anims/Lili/Flinch_spineJB_1.jan',
				'Anims/Milla/Meditate_flinch.jan',
				'Anims/Milla/Meditate_talk.jan',
				'Anims/Water_Arm/PointAtRaz.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/benny/run.jan',
				'anims/benny/runscared.jan',
				'anims/lili/meditate.jan',
				'globalmodels/fx_models/splash/splash.jan',
				'anims/ca_lamps/freestanding_shake.jan',
				'anims/ca_lamps/lamplantern_shake.jan',
				'anims/ca_lamps/mounted_shake.jan',
				'anims/ca_plantshake/fern_flower_wheat.jan',
			}
		}

		Ob.defaultX = 8693
		Ob.defaultY = 580
		Ob.defaultZ = 10384
		Ob.defaultOrientX = 8693
		Ob.defaultOrientY = 580
		Ob.defaultOrientZ = 10384
		Ob.bLoadedLLLL = 0

		Ob.leftFootPaintTexture = 'Textures/LevelTextures/CA_Campgrounds/CA_sand_footprint_left.tga'
		Ob.rightFootPaintTexture = 'Textures/LevelTextures/CA_Campgrounds/CA_sand_footprint_right.tga'
	end
    
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)		
		Global:saveGlobal('bCABHEntered', 1)
		
		if (Global:load('CALevelState') == 7) then
			SetPhysicsFlag(FindScriptObject('BobbyblocksCollideGEO'), PHYSICS_COLLIDEE, 0)
		end

		--edit adding Linda Call in daytime
		-- Register so AS_SeaUrchinWhistle can call Trigger_ContainsEntity
		self.WhistleVolume = TriggerOBB_Lookup(nil, 'tv_whistleblow')
		Trigger_RegisterListener(self.WhistleVolume, self)
		
		self.hackTV = TriggerOBB_Lookup(nil, 'tv_CanoeHack')					  
		Trigger_RegisterListener(self.hackTV, self)
				   
		SpawnScript('CA.Props.WaterCurse', 'WaterCurse', '',  1)
																				  
		-- the canoe should not be at the main dock until you have the permit, state 6
		local canoe
		if( 4 < Global:load('CALevelState') ) then 
			local parkedPosition = Global:load('ParkedCanoePosition', 'CA')
			if (parkedPosition == nil) then
				Global:save('ParkedCanoePosition', 1,'CA')
				parkedPosition = 1
			end
			
			canoe = SpawnScript('CA.Props.Canoe','Canoe','',1)
			canoe:setupParkedPosition(parkedPosition)
			canoe:setCanoePosition()
		end
		
		-- bugs
		self.globalbugs = SpawnScript('Global.Effects.HindenbugEmitter', 'GlobalBugs', '', 1)
		self.globalbugs:attachEmitter(Global.player)
		self.globalbugs:turnOn()
		
		-- and pollen
		self.pollen = SpawnScript('Global.Effects.PollenEmitter', 'Pollen', '', 1)
		self.pollen:attachEmitter(Global.player)
		self.pollen:turnOn()
		
		-- Water tweaks
		local water = FindScriptObject('genproploadertempwater')
		if ( water ) then
			water.reflectionEntities = {}
			water.reflectionEntities[1] = Global.player
			if canoe then
				water.reflectionEntities[2] = canoe
			end
		end
		
		-- Water Params
		SetReflectionScale(0.25)
		SetFresnelBumpScale(0.1)
		SetReflectionBumpScale(0.75)				
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/waterNoise2.tga','Textures/FXTextures/Water/Bumps/SmoothWaterBump.atx')

		-- darker shadows in here.
		SetShadowColor(0,0,0,.7)				

		if Global:load('bCABHWaterCursePlayed') ~= 1 then
			RegisterTriggerVolume(self, 'tv_WaterCurseCS', 0)
		end	
	
		--edit Removing bathosphere entirely, go find the Lungfish call instead!

		local bathosphere = FindScriptObject('bathosphere')
		if bathosphere then
			bathosphere:killSelf()
		end
		local bathosdoor = FindScriptObject('BathosphereDoor')
		if bathosdoor then
			bathosdoor:killSelf()
		end

		--[[ if LO is beaten, don't bring up the bathosphere again
		if (Global:loadGlobal('bLOCompleted') == 1) then
			local bathosphere = FindScriptObject('bathosphere')
			if bathosphere then
				bathosphere:killSelf()
			end
			local bathosdoor = FindScriptObject('BathosphereDoor')
			if bathosdoor then
				bathosdoor:killSelf()
			end
		else
			RegisterTriggerVolume(self, 'tv_Bathosphere')
			FindScriptObject('Sealnet'):killSelf()
		end]]
		
		if( nil ~= FindScriptObject('Canoe') ) then
			self:setState('CanoeHack')
		else
			self:setState(nil)
		end
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)		
		if Global:loadGlobal('bLLCompleted') == 1 and Global:loadGlobal('bLOCompleted') ~= 1 then
			Global.player:setPosition(14423.3, 659.3, 15428.4)
		end
	end
	
	function Ob:stateCanoeHack()
		Yield()
		if Trigger_ContainsEntity(self.hackTV, Global.player) == 1 then
			-- Raz at Milla's, so put the canoe there
			local canoe = FindScriptObject('Canoe')
			Global:save('ParkedCanoePosition', 2,'CA')
			canoe:setupParkedPosition(2)
			canoe:setCanoePosition()
		else
			local canoe = FindScriptObject('Canoe')
			-- Raz not at Milla's, so put the canoe at the dock
			Global:save('ParkedCanoePosition', 1,'CA')
			canoe:setupParkedPosition(1)
			canoe:setCanoePosition()
		end
		self:setState(nil)
	end
	
   	function Ob:onEnteredTriggerVolume(data,from)
        %Ob.Parent.onEnteredTriggerVolume(self, data, from)
		local state = Global:load('CALevelState')
		if (from ~= Global.player) then return end
		
		local state = Global:load('CALevelState')
		
		if (data == 'tv_Bathosphere' and state >= 7) then
			if Global:loadGlobal('bLLCompleted') ~= 1 then
				self:loadNewLevel('LLLL',0,0)
			elseif Global:loadGlobal('bLOCompleted') ~= 1 then
				self:loadNewLevel('LOMA', 0,0, 'ASGR')
			end
		elseif data == 'tv_WaterCurseCS' and Global:load('bCABHWaterCursePlayed') ~= 1 
			and FindScriptObject('Elton') and state < 7 and state > 1 then
			
			Global.cutsceneScript:runCutscene('CABHWaterCurse')
		end
	end
	
    return Ob
end		
