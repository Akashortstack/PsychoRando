
function CAGP_NIGHT(Ob)
	if( not Ob ) then 
		Ob = CreateObject('CA.CALevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/CA_ArrowheadMover/spin.jan',
				'Anims/CA_OldSkull/OldSkull_geyser.jan',
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/TeleportLookAround_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Objects/DowsingRod/DRod_Twitch.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/PsiChallenge/Collect.jan',
				'Anims/TK_Mover/Tumble.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Squirrel/Acorn_EmergWAcorn.jan',
				'Anims/Squirrel/Acorn_GrabAcorn.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/Run_OnFire.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/ca_lamps/freestanding_shake.jan',
				'anims/ca_lamps/lamplantern_shake.jan',
				'anims/ca_plantshake/fern_flower_wheat.jan',
				'Anims/Janitor/A_B_scout.jan',
				'Anims/Janitor/A_TurnLf_scout.jan',
				'Anims/Janitor/A_TurnRt_scout.jan',
				'Anims/Janitor/A_breathe_scout.jan',
				'Anims/Janitor/Breathe_janitor.jan',
				'Anims/Janitor/FordTK.jan',
				'Anims/Janitor/GiveBacon.jan',
				'Anims/Janitor/Idle1_janitor.jan',
				'Anims/Janitor/JumpOn_Reaction.jan',
				'Anims/Janitor/Ninja_Confusion_end.jan',
				'Anims/Janitor/Ninja_Confusion_loop.jan',
				'Anims/Janitor/Ninja_Idle1.jan',
				'Anims/Janitor/Ninja_TK.jan',
				'Anims/Janitor/Ninja_slap.jan',
				'Anims/Janitor/PointLeft.jan',
				'Anims/Janitor/PointLeftLoop.jan',
				'Anims/Janitor/PointLeft_End.jan',
				'Anims/Janitor/PointLeft_start.jan',
				'Anims/Janitor/PointUp.jan',
				'Anims/Janitor/PointUpLoop.jan',
				'Anims/Janitor/PointUp_End.jan',
				'Anims/Janitor/PointUp_start.jan',
				'Anims/Janitor/Point_janitor.jan',
				'Anims/Janitor/PsiReaction.jan',
				'Anims/Janitor/PullOutFunnel.jan',
				'Anims/Janitor/RB_A_scout.jan',
				'Anims/Janitor/Rake_end_janitor.jan',
				'Anims/Janitor/Rake_git.jan',
				'Anims/Janitor/Rake_loop_janitor.jan',
				'Anims/Janitor/Rake_start_janitor.jan',
				'Anims/Janitor/Rake_talkloop_janitor.jan',
				'Anims/Janitor/Sweep_end_janitor.jan',
				'Anims/Janitor/Sweep_loop1_janitor.jan',
				'Anims/Janitor/Sweep_loop2_janitor.jan',
				'Anims/Janitor/Sweep_start_janitor.jan',
				'Anims/Janitor/Talk_grumpy.jan',
				'Anims/Janitor/Turn180_janitor.jan',
				'Anims/Janitor/TurnLf_janitor.jan',
				'Anims/Janitor/TurnRt_janitor.jan',
				'Anims/Janitor/WalkSweep_janitor.jan',
				'Anims/Janitor/Walk_janitor.jan',
				'Anims/Janitor/Walk_scout.jan',
				'Anims/Janitor/WaxCanoe_end_skipper.jan',
				'Anims/Janitor/WaxCanoe_loop_skipper.jan',
				'Anims/Janitor/WaxCanoe_start_skipper.jan',
				'Anims/Janitor/camtutorial_idle.jan',
				'Anims/Janitor/camtutorial_talk1.jan',
				'Anims/Janitor/camtutorial_talk2.jan',
				'Anims/Janitor/talk1.jan',
				'Anims/Janitor/talk2.jan',
				'Anims/Janitor/talk_loop.jan',
				'Anims/DartNew/Determined.jan',
			}
		}
		Ob.sSkyBoxPath = 'Levels/SkyBox/CA_Skybox_Night.plb'
		Ob.theme = 'CampNight'
		Ob.sLoopingAmbSoundCueName = 'CANightAmb'
		Ob.sOneShotAmbSoundCueName = nil
	end

    function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		Global:save('CALevelState', 7,'CA') 
	end
			  
	function Ob:onBeginLevel()
		
		%Ob.Parent.onBeginLevel(self)
		
		local state = Global:load('CALevelState', 'CA')
		
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
		
		-- and water
		self.waterFX = SpawnScript('CA.Effects.CAGPWaterFX')
		self.waterFX:run()				
		
		RegisterTriggerVolume(self, 'tv_LiliWoods')		
		
	end    
	
--*************************************************************************************************

	function Ob:onEnteredTriggerVolume(sTVolume, who)
		local state = Global:load('CALevelState')
		local CALUSeen = Global:load('CALUSeen')
		local CALPSeen = Global:load('CALPSeen')

		if who==Global.player and sTVolume=='tv_LiliWoods' then
			if state==2 then 
				if not CALUSeen then
					Global:save('CALUSeen', 1)
					self:playVideo('cutScenes/prerendered/calu.xmv')
				end	
			elseif state>2 and state<6 then
				if not CALPSeen and Global:load('CALDSeen') ~= 1 then
					Global:save('CALPSeen', 1)
					self:playVideo('cutScenes/prerendered/calp.xmv')
				end
			end
		else
			%Ob.Parent.onEnteredTriggerVolume(self, sTVolume, who)
		end
	end

--*************************************************************************************************
	--edit add requirements to enter CABH and CARE 
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)		

		--edit require Oarsman's Badge for Lake access
		if Global:loadGlobal('bGotOrsmansBadge') ~= 1 then
			self:ChangeCABHTeleporter('CAGPtoCABH1')
		end

		--edit require Squirrel Dinner for Recreation access
		if Global:loadGlobal('bGotSquirrelDinner') ~= 1 then
			self:ChangeCARETeleporter('CAGPtoCARE1')
		end

	end

	function Ob:ChangeCABHTeleporter(name)
		local teleporter = fso(name)
		teleporter.destLevel = nil
		teleporter.warningText = "The Lake is Closed! Find the Oarsman's Badge!"
		-- coordinates go here
		teleporter.dx = 7673
		teleporter.dy = -7
		teleporter.dz = 1816
		teleporter.dox = 0
		teleporter.doy = 119
		teleporter.doz = 0
	end

	function Ob:ChangeCARETeleporter(name)
		local teleporter = fso(name)
		teleporter.destLevel = nil
		teleporter.warningText = "Reception Area Closed! Find the Squirrel Dinner!"
		-- coordinates go here
		teleporter.dx = -4637
		teleporter.dy = 569
		teleporter.dz = -1043
		teleporter.dox = 0
		teleporter.doy = 93
		teleporter.doz = 0
	end
	
    return Ob
end
