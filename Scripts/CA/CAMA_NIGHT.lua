function CAMA_NIGHT(Ob)
	if( not Ob ) then
		Ob = CreateObject('CA.CALevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/CA_ArrowheadMover/spin.jan',
				'anims/ca_lamps/freestanding_shake.jan',
				'anims/ca_lamps/lamplantern_shake.jan',
				'anims/ca_milascar/millascarshake_attackanim.jan',
				'Anims/CA_OldSkull/OldSkull_geyser.jan',
				'anims/ca_plantshake/fern_flower_wheat.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Campkids/UnderCar_Mikhail.jan',
				'Anims/Campkids/UnderCar_Mikhail_Flinch.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/TKed_Struggle_Hard.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/TeleportLookAround_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Objects/DowsingRod/DRod_Twitch.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/PsiChallenge/Collect.jan',
				'Anims/Squirrel/Acorn_EmergWAcorn.jan',
				'Anims/Squirrel/Acorn_GrabAcorn.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/llll_fern1/llll_fernshake.jan',
			}
		}
		Ob.sSkyBoxPath = 'Levels/SkyBox/CA_Skybox_Night.plb'
		Ob.theme = 'CampNightHarm'
		Ob.sLoopingAmbSoundCueName = 'CANightAmb'
		Ob.sOneShotAmbSoundCueName = nil
	end
    
	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		Global:save('CALevelState', 7,'CA') 
	end
	
	function Ob:onBeginLevel()
		
		local state = Global:load('CALevelState')
		
        --Spawn coach for speaker chatter
		if state and state > 1 and state < 7 then
			if not FindScriptObject('Coach') then 
				SpawnScript('CA.Characters.Coach','Coach','',1)
			end
		end
		
		%Ob.Parent.onBeginLevel(self)
		
		-- bugs
		self.globalbugs = SpawnScript('Global.Effects.NightHindenbugEmitter', 'GlobalBugs', '', 1)
		self.globalbugs:attachEmitter(Global.player)
		self.globalbugs:turnOn()
        
		self.bloomingglobalbugs = SpawnScript('Global.Effects.BloomingBugFX', 'BloomingGlobalBugs', '', 1)
		AttachEntityToEntity(self.bloomingglobalbugs, Global.player)
        self.bloomingglobalbugs:setPosition(0,0,0)
		self.bloomingglobalbugs:run()
		
		--[[ 
        -- and pollen
		self.pollen = SpawnScript('Global.Effects.PollenEmitter', 'Pollen', '', 1)
		self.pollen:attachEmitter(Global.player)
		self.pollen:turnOn()
		]]--
		
		-- Set the shadow culling bias, which is needed for floors made up of very large, non-axis-aligned polys
		SetShadowCullingBias(-1000)

		--edit Ford Scavenger Hunt, but at night!
		if (Global:load('bFord2ScavengerProxPlayed') ~= 1) then
			self.ford = SpawnScript('CA.Characters.Ford', 'Ford', '')
		end
		
	end    
    
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		-- kill the parking lot bear if we've got any of the parking lot kids rebrained
		-- this is SUPER special case
		if	(Global.player.stats.brains[strlower('Mikhail')] == 'redeemed') or
			(Global.player.stats.brains[strlower('Maloof')] == 'redeemed') or
			(Global.player.stats.brains[strlower('Benny')] == 'redeemed') then
			local bear = FindScriptObject('Bear1')
			if (bear) then
				bear:killSelf()
			end
		end
	end
    
	return Ob
end
