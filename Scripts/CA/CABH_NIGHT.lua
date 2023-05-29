 --*
--*              'CABH_NIGHT.lua'
--*					
--*
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.
--*            All Rights Reserved.
--*        Proprietary and Confidential...
--*					...and Pimp, of course


function CABH_NIGHT(Ob)
	if not Ob then
		Ob = CreateObject('CA.CALevelScript')
		Ob.dependencies = {
			scripts = {
					'Global.Effects.LungfishWakeFX',
			},
			animations = {
				'Anims/CA_ArrowheadMover/spin.jan',
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/Campkids/Kissing_elton.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/BodyParts/HoldFishWhistle.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/BodyParts/LookDown.jan',
				'Anims/DartNew/CrawlOutofWater.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Grabbed.jan',
				'Anims/DartNew/Hop_water.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/Talk_1.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/VictoryDance.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Janitor/A_RazPoint_IN_scout.jan',
				'Anims/Janitor/A_ahHa_In_scout.jan',
				'Anims/Janitor/A_ahHa_Out_scout.jan',
				'Anims/Janitor/A_HeadShake_scout.jan',
				'Anims/Janitor/A_HeadNod_scout.jan',
				'Anims/Janitor/A_RazPoint_scout.jan',
				'Anims/Janitor/A_RazPoint_OUT_scout.jan',
				'Anims/Janitor/A_Startled_scout.jan',
				'Anims/Janitor/A_Thoughtful_IN_scout.jan',
				'Anims/Janitor/A_Thoughtful_LOOP_scout.jan',
				'Anims/Janitor/A_Thoughtful_OUT_scout.jan',
				'Anims/Janitor/A_TurnToCam_scout.jan',
				'Anims/Janitor/A_awShucks_scout.jan',
				'Anims/Objects/DowsingRod/DRod_Twitch.jan',
				'Anims/Objects/InventoryToss.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/Run_OnFire.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'cutScenes/ASCL/CACL_A_Lungfish.jan',
				'cutScenes/ASCL/CACL_A_Raz.jan',
				'anims/ca_lamps/freestanding_shake.jan',
				'anims/ca_lamps/lamplantern_shake.jan',
				'anims/ca_lamps/mounted_shake.jan',
				'anims/ca_plantshake/fern_flower_wheat.jan',
			},
			textures = {  
				'textures/ui/sayline heads/lungfish.dds'
			},
		}
		Ob.sCutsceneScriptName = 'CA.CABHCutscenes'
		Ob.sSkyBoxPath = 'Levels/SkyBox/CA_Skybox_Night.plb'
		Ob.theme = 'WaterCurseMusic'

		Ob.sLoopingAmbSoundCueName = 'CANightAmb'
		Ob.sOneShotAmbSoundCueName = nil
		Ob.defaultX = 8693
		Ob.defaultY = 580
		Ob.defaultZ = 10384
		Ob.defaultOrientX = 8693
		Ob.defaultOrientY = 580
		Ob.defaultOrientZ = 10384
		Ob.bLoadedLLLL = 0
	end
    
    function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		Global:save('CALevelState', 7,'CA') 
	end
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)		
		
		-- Register so AS_SeaUrchinWhistle can call Trigger_ContainsEntity
		self.WhistleVolume = TriggerOBB_Lookup(nil, 'tv_whistleblow')
		Trigger_RegisterListener(self.WhistleVolume, self)
				   
		SpawnScript('CA.Props.WaterCurse', 'WaterCurse', '',  1)

--[[
  		if (Global:load('TempRespawnAtDocks', 'CA') == 1) then
			Global.player:setPosition(17144, 359, 10041)
  			Global:save('TempRespawnAtDocks', 0, 'CA')
			--PrintNote('You defeat Millas Dance Party and learn Levitation')
  			--PrintNote('Hint: Go back and see Sasha')
  		end		
]]--

		local parkedPosition = Global:load('ParkedCanoePosition', 'CA')
		if (parkedPosition == nil) then
			Global:save('ParkedCanoePosition', 1,'CA')
			parkedPosition = 1
		end
		
		local canoe = SpawnScript('CA.Props.Canoe','Canoe','',1)
		canoe:setupParkedPosition(parkedPosition)
		canoe:setCanoePosition()
		
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
        
		-- Water tweaks
		local water = FindScriptObject('genproploadertempwater')
		if ( water ) then
			water.reflectionEntities = {}
			water.reflectionEntities[1] = Global.player
			water.reflectionEntities[2] = canoe
		end
		
		-- Water params		
		SetReflectionScale(0.25)
		SetFresnelBumpScale(0.1)
		SetReflectionBumpScale(0.75)
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/LO_waterNoise2.tga','Textures/FXTextures/Water/Bumps/SmoothWaterBump.atx')

		-- trigger for milla getting kidnapped cutscene
		RegisterTriggerVolume(self, 'tv_MillaKidnappingScene', 0)
		
-- 		self:setState(nil)		
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)		

		if (Global:load('CALevelState') == 7) then
			SetPhysicsFlag(FindScriptObject('BobbyblocksCollideGEO'), PHYSICS_COLLIDEE, 0)
			if (Global:load('bLiliKidnapped') ~= 1) then
				self:setState('PlayCALK')
			end
		end
		
		if Global:loadGlobal('bLLCompleted') == 1 and Global:loadGlobal('bLOCompleted') ~= 1 then
			Global.player:setPosition(14423.3, 659.3, 15428.4)
		end
		
		--edit Removing bathosphere entirely, go find the Lungfish Call instead!

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
	end
	
	function Ob:statePlayCALK()
		-- if we're coming from a teleporter
		if Global:load('TreeStumpTeleport', 'levelLoad') then
			while (Global.cutsceneScript.cutscenePlaying == 1) do 
				Yield() 
			end
		end
		self:playVideo('cutScenes/prerendered/calk.xmv')
		Global:save('bLiliKidnapped', 1)
		Global.cutsceneScript:runCutscene('CABH7PostLiliKidnapping', 1)
		Global.goalManager:activate('RescueLili') -- Explicitly activate this so that it doesn't go away.
		Global.goalManager:activate('DefeatLungfish')
		
		self:setState(nil)
	end
	
   	function Ob:onEnteredTriggerVolume(data,from)
		if (from ~= Global.player) then return end
		
		if (data == 'tv_Bathosphere' and Global:load('CALevelState') >= 7) then
			self:loadNewLevel('LLLL',0,0)
		elseif (data == 'tv_MillaKidnappingScene' and 
				Global:load('bCABH7MillaKidnappingProxPlayed') ~= 1 and
				Global:loadGlobal('bLOComplete') ~= 1) then
			Global.cutsceneScript:runCutscene('CABH7MillaKidnappingProx')
		else
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

    return Ob
end		
