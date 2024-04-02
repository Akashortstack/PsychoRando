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

		--edit Ford Scavenger Hunt Cutscene, but at night!
		--only loads if Scavenger Hunt TRUE, saved in CASA
		if (Global:loadGlobal('bRandoScavHuntCutscene') ~= 1) then
			Global:save('bFord2ScavengerProxPlayed', 0)
			Global:saveGlobal('bRandoScavHuntCutscene', 1)
		end

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

		--edit move this Bastard
		local coug = fso('Cougar2')
		if coug ~= nil then
			coug:setPosition(-1126, 3607, 9542)
		end

		--edit require Oarsman's Badge for Lake access
		if Global:loadGlobal('bGotOrsmansBadge') ~= 1 then
			self:ChangeCABHTeleporter('CAMAtoCABH2')
			self:ChangeCABHTeleporter('CAMAtoCABH1')
		end

		--edit require Squirrel Dinner for Recreation access
		if Global:loadGlobal('bGotSquirrelDinner') ~= 1 then
			self:ChangeCARETeleporter('CAMAtoCARE1')
		end

		--edit require Lili's Bracelet for Cabins access
		if Global:loadGlobal('bGotLiliBracelet') ~= 1 then
			self:ChangeCAKCTeleporter('CAMAtoCAKC1')
			self:ChangeCAKCTeleporter('CAMAtoCAKC2')
		end

	end
    
	function Ob:ChangeCABHTeleporter(name)
		local teleporter = fso(name)
		teleporter.destLevel = nil
		teleporter.warningText = "The Lake is Closed! Find the Oarsman's Badge!"
		-- coordinates go here
		teleporter.dx = 391
		teleporter.dy = 4160
		teleporter.dz = 5929
		teleporter.dox = 0
		teleporter.doy = -81
		teleporter.doz = 0
	end

	function Ob:ChangeCARETeleporter(name)
		local teleporter = fso(name)
		teleporter.destLevel = nil
		teleporter.warningText = "Reception Area Closed! Find the Squirrel Dinner!"
		-- coordinates go here
		teleporter.dx = -18521
		teleporter.dy = 644
		teleporter.dz = 12800
		teleporter.dox = 0
		teleporter.doy = -4
		teleporter.doz = 0
	end

	function Ob:ChangeCAKCTeleporter(name)
		local teleporter = fso(name)
		teleporter.destLevel = nil
		teleporter.warningText = "Kids' Cabins Closed! Find Lili's Bracelet!"
		-- coordinates go here
		teleporter.dx = -8949
		teleporter.dy = 4294
		teleporter.dz = 5116
		teleporter.dox = 0
		teleporter.doy = 6
		teleporter.doz = 0
	end

	return Ob
end
