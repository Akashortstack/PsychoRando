--      ASLB.lua
--
--      Asylum Lab Level Script
--
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--

function ASLB(Ob)
	if (Ob == nil) then
		-- Constructor
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/Crows/Alarmed.jan',
				'Anims/Crows/Confused.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/BodyParts/HoldFishWhistle.jan',
				'Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmDn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_PinchPalmDn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/KissBrain.jan',
				'Anims/DartNew/KissBrain_Idle.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/Raz_menaceLobotoArm.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Pokeylope/Pokeylope_Flail.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/DartNew/BodyParts/Hold_Pokeylope_ShoulderJALf_1.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
			}
		}
		
		Ob.theme = 'LobotosLab'
		Ob.levelType = 'real'
	end
	
--***************************************************************************************  
	
	function Ob:onBeginLevel()
		--Player must have gotten at least this far
	--	Global:setLevelToCompleted('TH')
	--	Global:setLevelToCompleted('WW')
--		Global:setLevelToCompleted('BV')
		
		--Save that we have been here, to enable the elevator in ASGR
		Global:saveGlobal('bHasSeenASLB', 1)
		
		%Ob.Parent.onBeginLevel(self)
		SetTKClawSnapType('TKClaw', 'TKClaw')
		
		--  Skybox Parameters
		SetSkyBox('Levels/AS_Asylum/ASLB_Skybox.plb')
		
		--register trigger volumes for stair puzzle
		self.ASLSSceneSphere = AddTriggerSphere(-251, 2370, -125, 200)
		RegisterTriggerSphereListener(self.ASLSSceneSphere, self)
		
		self.PokeyBrainSphere = AddTriggerSphere(-115, 2500, -1145, 150)
--			self:setPosition(-115, 2500, -1145)
		RegisterTriggerSphereListener(self.PokeyBrainSphere, self)
		
		-- spawn Characters		
		if (Global:load('bLobotoBlastedPlayed') ~= 1) then 
			self.lobato = SpawnScript('AS.Characters.Lobato', 'Lobato')		
			self.sheegor = SpawnScript('AS.Characters.Sheegor', 'Sheegor')
			self.pokeyProp = SpawnScript('AS.Props.PokeyProp', 'PokeyProp')

			self.pokeylope = SpawnScript('AS.Characters.Pokeylope', 'Pokeylope')
			SetEntityDomain(self.pokeylope, 'turnofflab_DOMAIN')
			if Global.player:isInInventory('PokeyProp') == 1 then
				self.pokeylope:makeInvisible()
			end
			self.pokeyBrain = SpawnScript('AS.Props.Brain', 'PokeyBrain')
			self.pokeyBrain:setBrainType(self.pokeyBrain.POKEY_BRAIN)
			self.tableBrain = SpawnScript('AS.Props.Brain', 'TableBrain')
			self.tableBrain:setBrainType(self.tableBrain.DILAPIDATED_BRAIN)
			-- Why do we manually spawn all that shit?  Anyway, gotta domain it.
--			SetEntityDomain(self.lobato, 'turnofflab_DOMAIN')
			SetEntityDomain(self.tableBrain, 'turnofflab_DOMAIN')
		end

		self.sasha = SpawnScript('AS.Characters.Sasha', 'Sasha')
		self.milla = SpawnScript('AS.Characters.Milla', 'Milla')
		
		self.lili = SpawnScript('AS.Characters.Lili', 'Lili')
		self.lili:setPosition(-20, 3250, -860)
		self.lili:setOrientation(0, 13.1, 0)
				
		if Global.player:isInInventory('Cake') ~= 1 then
			self.cake = SpawnScript('AS.Props.Cake', 'Cake')
			self.cake:beNotPickupable()
			self.cake:bePickupable()
		end
		
		self.cage = SpawnScript('AS.Props.Cage','Cage')
		self.cage:setPosition(-404, 1570, -404)		
		
		self.stairs = FindScriptObject('stairs')			   
		if (self.stairs == nil) then
			self.stairs = SpawnScript('AS.Props.Stairs', 'stairs', '', 1)
		end


		self.brainTank = SpawnScript('AS.Props.BrainTank', 'BrainTank', '', 1)
		self.brainTank:setPosition(-307, 2541, -1651.2)
 		self.brainTankClaw = SpawnScript('AS.Characters.BrainTankClaw', 'BrainTankClaw', '', 1)
		SetEntityDomain(self.brainTank, 'turnofflab_DOMAIN')
		SetEntityDomain(self.brainTankClaw, 'turnofflab_DOMAIN')
		
		if (Global:load('bLobotoBlastedPlayed') ~= 1) then -- we are revisiting After blasting loboto but before freeing lili
			self.brainHelper1 = SpawnScript('AS.Props.BrainHelper', 'BrainHelper1')
	--		self.brainHelper1:setPosition(self.pokeyBrain.ped1locX, self.pokeyBrain.ped1locY, self.pokeyBrain.ped1locZ)
			self.brainHelper2 = SpawnScript('AS.Props.BrainHelper', 'BrainHelper2')
	--		self.brainHelper2:setPosition(self.pokeyBrain.ped2locX, self.pokeyBrain.ped2locY, self.pokeyBrain.ped2locZ)
			self.brainHelper3 = SpawnScript('AS.Props.BrainHelper', 'BrainHelper3')
			self.brainHelper3:setPosition(self.pokeyBrain.tanklocX, self.pokeyBrain.tanklocY, self.pokeyBrain.tanklocZ)
		end


--      self.millaBrain = SpawnScript('Global.Collectibles.BrainJar', 'BrainJarMilla')
--		self.millaBrain:setPosition(
--		self.millaBrain:be
--      self.sashaBrain = SpawnScript('Global.Collectibles.BrainJar', 'BrainJarSasha')
		
		--[[
		self.crowBrain = SpawnScript('Co_Brain','crowBrain')
		self.crowBrain:setPosition(-50, 900, -80)
		
		self.brainCrow = SpawnScript('AS.Characters.AS_ClairvoyanceCrow','brainCrow')
		self.brainCrow:setPosition(-50, 1100, -80)
		self.brainCrow:setOrientation(0,-35,0)
		SetPhysicsFlag(self.brainCrow, PHYSICS_APPLYGRAVITY, 0)
		]]--
		
--		self.gasFlame = SpawnScript('AS.Effects.GasFlameFX', 'gasFX')
--		self.gasFlame:run()

		SetEntityFlag(FindScriptObject('habitrail'), ENTITY_SEETHROUGH, 1)
		
		-- for the tea room
		RegisterTriggerVolume(self, 'tv_TeaRoomIntro', 0)
		
		--for the outside railing camera
		RegisterTriggerVolume(self, 'tv_TeaRoomIntro', 0)
		RegisterTriggerVolume(self, 'tv_OutsideCam1')
		RegisterTriggerVolume(self, 'tv_OutsideCam2')
		self.outsideCamLoc = FindScriptObject('OutsideCamLoc')		
		
		self:setState('LevelSetup')
	end

						
	function Ob:stateLevelSetup()			
		self.rAmbientSound = LoadSound('ASLB_Amb')
		PlaySound(nil, self.rAmbientSound, 1, 0)

--		local sawSheegorScene = Global:loadGlobal('SawSheegorScene')
--		if (sawSheegorScene ~= 1) then
--			self:playVideo('cutScenes/prerendered/asls.xmv')
--			Global:saveGlobal('SawSheegorScene', 1)	
--		end
		local hasPokeylope = Global:loadGlobal('GotPokeylope')
		if hasPokeylope == 1 then
			if (self.pokeylope ~= nil) then
				self.pokeylope:setPosition(-2000,-2000,-2000)
			end
			if (self.cake ~= nil) then
				self.cake:killSelf()
			end
			local pokeyBrain = FindScriptObject('PokeyBrain')
			if (pokeyBrain ~= nil) then
				pokeyBrain:moveToPedstalTwo()
			end		
		end
		SetChaseCameraAzimuth(155)
		self:setState(nil)
	end
	
	function Ob:statePlayTeaRoomIntro()
		self.sheegor = FindScriptObject('Sheegor')
		self.sheegor:stopIdleChatter()		
		
		local tSettings2 = {
			sName = 'TeaRoomCore',
			postCutsceneCallback = self.sheegor.startIdleChatter,
			postCutsceneCallbackSelf = self.sheegor,
			postCutsceneCallbackArg = 5,
			bKeepHandler = 0,
		}
		
		local tSettings1 = {
			sName = 'TeaRoomNotBusted',
			bBlocking = 1,
			postCutsceneCallback = Global.cutsceneScript.runCutsceneWithSettings,
			postCutsceneCallbackSelf = Global.cutsceneScript,
			postCutsceneCallbackArg = tSettings2,
			bKeepHandler = 0,
		}
        
		Global:save('bTeaRoomCorePlayed',1)	-- should be set in cutscene... but Just in case.
        Global.cutsceneScript:runCutsceneWithSettings(tSettings1)
		
		self:setState(nil)
	end
	
	function Ob:onCrossedTriggerPlane(data,from, bFromBack)
		if (from == Global.player and (data == 'tv_OutsideCam1' or data == 'tv_OutsideCam2')) then
			if (bFromBack ~= 1) then
				PlayerLockInputTransform()
				self.outsideCam = Global.camControl:pushAndSetChase(self, 1500, 30, 200)
				Global.camControl:setSecondaryTarget(self.outsideCamLoc, kSECONDARYFLAG_AUTO_ROTATE, 0)
			else
				Global.camControl:setSecondaryTarget(nil)
				Global.camControl:removeCam(self.outsideCam)
			end
		end
	end
	
	function Ob:onEnteredTriggerVolume(data,from)
		if from == Global.player then
			if (data == self.ASLSSceneSphere) then
				if (Global:loadGlobal('SeenASLSCutscene') ~= 1) then
					self:playVideo('cutScenes/prerendered/asls.xmv')	
					Global.cutsceneScript:runCutscene('LabIntro')
					Global:saveGlobal('SeenASLSCutscene', 1)
					Global.goalManager:activate('RescueBrains')
				end
			elseif (data == 'tv_TeaRoomIntro' and Global:load('bTeaRoomCorePlayed') ~= 1 ) then
				if Global.levelScript.cutsceneScript.cutscenePlaying ~= 1 then
					self:setState('PlayTeaRoomIntro')
				end
			elseif (data == 'tv_TeaRoomIntro' and Global.player:isInInventory('PokeyProp') == 1 ) then
				Global.player:setSelectedItem('PokeyProp')
				self:sendMessage(FindScriptObject('Sheegor'), 'Item', 'PokeyProp', 0 )
				--edit
				local pokeyBrain = FindScriptObject('PokeyBrain')
				if (pokeyBrain ~= nil) then
					pokeyBrain:moveToPedstalTwo()
				end
			end
		elseif from then
			local ob = FindScriptObject('PokeyBrain')
			if (from.Name == 'PokeyBrain' and data == self.PokeyBrainSphere) then
--				from:moveToPedstalTwo()
			end
		end
	end
	
	function Ob:getHintResponse()
		
		if( Global:load('bLobotoBlastedPlayed') == 1) then
			return {
				{
					voice = "/GLAJ026FO/",--DIALOG=<<Let\'s help Sasha and Milla blast your girlfriend out of that chair!>>
				}
			}
		end
		
		if (Global:loadGlobal('GotPokeylope') == 1) then
			return {
				{
					voice = "/GLAJ025FO/",--DIALOG=<<Use telekinesis to put that little turtle\'s brain in that tank\'s cockpit!>>
				}
			}
		end
		
		if (Global.player:isInInventory('PokeyProp') == 1) then
			return {
				{
					voice = "/GLAJ024FO/",--DIALOG=<<Let\'s give this turtle back to that sad girl with the oven mitts on.>>
				}
			}
		end
		
		if( Global.player:isInInventory('Cake') == 1 ) then
		--If player is near pokeylope and has the cake
			local pokeylope = FindScriptObject('Pokeylope')
			if (pokeylope) then
				local px, py, pz = pokeylope:getPosition()
				if (GetDistance(px, py, pz, Global.player:getPosition()) < 1000) then
					return {
						{
							voice = "/GLAJ023FO/",--DIALOG=<<He\'s coming for the cake! Lure him under that hatch in his cage, and then use telekinesis to lift him out!>>
						}
					}
				end
			end
			
			return {
					{
						voice = "/GLAJ022FO/",--DIALOG=<<We need to free the turtle hostage. Perhaps that chocolate cake could be deployed in a rescue capacity.>>
					}
				}
		end
		
		if (Global:load('bTeaRoomCorePlayed') == 1) then
			return {
				{
					voice = "/GLAJ022FO/",--DIALOG=<<We need to free the turtle hostage. Perhaps that chocolate cake could be deployed in a rescue capacity.>>
				}
			}
		end
		
		if (Global:loadGlobal('SeenASLSCutscene') == 1) then 
			return {
				{
					voice = "/GLAJ024FO/",--DIALOG=<<Let\'s give this turtle back to that sad girl with the oven mitts on.>>
				}
			}
		end
		
		if (self.bPassedStairs == 1) then 
			return {
				{
					voice = "/GLAJ016FO/",--DIALOG=<<Keep moving up! We gotta get to the top!>>
				}
			}
		end
		
		return {
			{
				voice = "/GLAJ017FO/",--DIALOG=<<Watch out for that guard crow. >>
			},
			{
				voice = "/GLAJ018FO/",--DIALOG=<<He might not be too alert if you smacked him with a confusion grenade I\'ll bet...>>
			}
		}
	end

	-- Kills conversations so you can start a new one, and not have Raz be involved in 2 or 3 conversations at once.
	function Ob:killAllConversations()
		local sheegor = FindScriptObject('Sheegor')
		local lili = FindScriptObject('Lili')
		if sheegor and sheegor.rPsiReactResponse and sheegor.rPsiReactResponse.chattering == 1 then
			sheegor.rPsiReactResponse:chatterStop()
		end
		if lili and lili.activateCRH.chattering == 1 then
			lili.activateCRH:chatterStop()
		end
	end
	
	return Ob
end

