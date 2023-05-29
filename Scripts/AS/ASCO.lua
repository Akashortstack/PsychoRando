--      AsCo.lua
--
--      Asylum Courtyard Level Script
--
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--

function ASCO(Ob)
	if (Ob == nil) then
		Ob = CreateObject('AS.ASLevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/ASCO_cardTower/CardFall.jan',
				'Anims/ASCO_cardTower/RebuildCards.jan',
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/BodyParts/HoldFishWhistle.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_PinchPalmDn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/ConfusionBomb.jan',
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
				'Anims/Dartnew/FeatherTickle.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/PsiChallenge/Collect.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/WW_Pieces/wobble.jan',
				'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan',
				'Anims/Fred_Bonaparte/ASII002FR.jan',
				'Anims/Fred_Bonaparte/ASII003FR.jan',
				'Anims/Fred_Bonaparte/ASII006FR.jan',
				'Anims/Fred_Bonaparte/ASII010FR.jan',
				'Anims/Orderly/ASII007CR.jan',
				'Anims/Orderly/ASII009CR.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'cutScenes/ASBF/ASBF001_edgar.jan',
				'cutScenes/ASBF/ASBF004ED_edgar.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'cutScenes/ASEI/ASEI001_raz.jan',
				'cutScenes/ASEI/ASEI002a_edgar.jan',
				'cutScenes/ASEI/ASEI003_raz.jan',
				'cutScenes/ASEI/ASEI004_edgar.jan',
				'cutScenes/ASEI/ASEI005_raz.jan',
				'cutScenes/ASEI/ASEI006_edgar.jan',
				'cutScenes/ASEI/ASEI007_edgar.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			}
		}
				
		Ob.dart = nil
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.levelType = 'real'
		Ob.theme = nil
		-- constant for the e3 demo
		Ob.E3DEMO = nil

		-- constant to say that there's an intro cutscene
		Ob.bHasIntroCS = 1

		Ob.fogR = 0.23
		Ob.fogG = 0.25
		Ob.fogB = 0.01
		Ob.fogNear = -20
		Ob.fogFar = 6000
	end
	
--	I N I T   S T A T E S  **************************************************************	
		
	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		self.hackLastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
	end

	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('MI')

		local lastPrefix = Global:loadGlobal('LastLevel')
		if lastPrefix then lastPrefix = strsub(lastPrefix, 1, 2) end
		
		--  reference scripts
		%Ob.Parent.onBeginLevel(self)
		self.Edgar = FindScriptObject('AS_Edgar')
		self.Fred = FindScriptObject('AS_Fred')
		self.Orderly = FindScriptObject('AS_Orderly')
		self.Gnome = FindScriptObject('gnome')
		self.TeddyBear = FindScriptObject('teddybear')
		self.GurneyWheel = FindScriptObject('gurneywheel')
		self.Painting = FindScriptObject('LobatoPainting')
		if Global.player:isInInventory('LobatoPainting') ~= 1 then
			self.Painting:beNotPickupable()
		end

		self.StraightJacket = FindScriptObject('StraightJacket')
		if Global.player:isInInventory('StraightJacket') ~= 1 then
			self.StraightJacket = FindScriptObject('StraightJacket')
			self.StraightJacket:beNotPickupable()
			SetEntityVisible(self.StraightJacket,0)
		end

		if Global.player:isInInventory('Brainer') ~= 1 then
			local brainer = SpawnScript('Global.Props.Brainer', 'Brainer')
			Global.player:addToInventory(brainer,0,1)
		end

		--  Set Fog Parameters
		SetDistanceFogEnable(0)
		SetDistanceFogColor(self.fogR, self.fogG, self.fogB)
		SetDistanceFogRange(self.fogNear, self.fogFar)
      
		--  Skybox Parameters
		--	large skybox necessitates extended draw distance
		SetSkyBox('Levels/AS_Asylum/ASGR_Skybox.plb')
		SetViewportFarZ(40000)

		-- load in a dummy raz puppet to make the switch faster
		self.rDummyPlayer1 = SpawnScript('dummy','DummyRaz','', 1)
		self.rDummyPlayer1:loadMesh('Characters/Dart_StraightJacket.plb')
		self.rDummyPlayer1:setPosition(-2767.8, 1525.3, 443.0)

		-- load in a dummy raz puppet to make the switch faster
		self.rDummyPlayer2 = SpawnScript('dummy','DummyRaz2','', 1)
		self.rDummyPlayer2:loadMesh('Characters/DartNew.plb',1)
		self.rDummyPlayer2:setPosition(-2767.8, 1525.3, 443.0)
		
		SpawnScript('AS.Characters.AS_ClairvoyanceCrow','crow666')
		
		--FadeToColor (0,0,0,255, 0, 0,0,0,255, 0, 0)
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		
		--NOTE:  this code doesn't handle returning from WW or BV for the second time, ie
		-- after you've beaten it and revisiting it again later.  !!!!!!!!!!!
		if (Global:loadGlobal('bASIIPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('LevelIntro')
		elseif (Global:loadGlobal('LastLevel') == 'ASLB') then
			Global.player:initPosition(FindScriptObject('gateElevatorDartPos'):getPosition())
			Global.player:SetLookThing(FindScriptObject('gateElevatorLookTarget'))
			Global.player.spawnpoint = nil
		end
		
		if Global:loadGlobal('bWWCompleted') == 1 then
			if (Global:load('DoorsOpened') ~= 1 ) then
				self:sendMessage(self.Fred, 'WWComplete', '')	   
			end
		end
			
		local lastPrefix = Global:loadGlobal('LastLevel')
		if lastPrefix then lastPrefix = strsub(lastPrefix, 1, 2) end

		if lastPrefix == 'BV' then
			if Global:loadGlobal('bBVCompleted') == 1 then
				if (Global:load('bASCOCompletedBVPlayed') ~= 1) then
					Global.goalManager:deactivate('LiberateEdgar')
					self:playWinningVideo('BV')
					local painting = FindScriptObject('LobatoPainting')
					self:sendMessage(painting, 'AccessGranted', '')			
					painting:setPosition(-1080, 1341,-310)
					painting:setOrientation(-35,-105,0)
					Global.cutsceneScript:runCutscene('ASCOCompletedBV')
				end				
			end
		elseif (lastPrefix == 'WW') then
			if Global:loadGlobal('bWWCompleted') == 1 then
				if (Global:load('bWWCompletePlayed') ~= 1) then 
					Global.goalManager:deactivate('HelpFred')
					self:playWinningVideo('WW')
					Global.cutsceneScript:runCutscene('WWComplete')
				end				
			else
				self:sendMessage(self.Fred, 'WWIncomplete', '')
			end
		end
		
		--  load assets
		self.theme = self:loadSound('Sounds/Music/AsylumInt.sgt')
		PlaySound(nil,self.theme,1,0)
      
		self.rAmbientSound = LoadSound('ASCO_Amb')
		PlaySound(nil, self.rAmbientSound, 1, 0)
		
	end

	--Override playKickedOutVideo so we can play a special cutscene for getting kicked out of BV	
	function Ob:playKickedOutVideo(lastLevelPrefix, bWin)
		if (lastLevelPrefix == 'BV') then
			if (bWin ~= 1) and (Global.cutsceneScript.cutscenePlaying ~= 1) then
				Global.cutsceneScript:runCutscene('BVIncomplete')
				return
			end
		end
		%Ob.Parent.playKickedOutVideo(self, lastLevelPrefix, bWin)
	end

	function Ob:getHintResponse()
		--Default to this
		if (Global:load('DoorsOpened') ~= 1) then
			return {
				{
					voice = "/GLAJ011FO/",--DIALOG=<<We have to get by that creepy guard and take that elevator upstairs. >>
				},
				{
					voice = "/GLAJ012FO/",--DIALOG=<<I\'ll bet that\'s where oleander has the girl.>>
				},
				{
					voice = "/GLAJ013FO/",--DIALOG=<<Maybe you could make some kind of a disguise...>>
				}
			}
		else
			return {
				{
					voice = "/GLAJ014FO/",--DIALOG=<<What are we doing down here? We need to be up in the tower, trying to free your girlfriend!>>
				}
			}
		end
	end

	
--  C U T S C E N E   S T A T E S  ****************************************************************

	
   
--*************************************************************************************************

	
	function Ob:stateLevelPlay()
		--	do post cutscene level load stuff here
		--FadeToColor( 255, 255, 255, 0, 0 , 0, 0, 0, 255, 0, 3 )
	
		if (self.E3DEMO ~= nil) then
			Global.player:setPosition(1845.58,7.04917,814.534)
			Global.player:setOrientation(0, -87.8506, 0)
			if Global.player.saved.realX then
				Global.player:setPosition(Global.player.saved.realX, Global.player.saved.realY, Global.player.saved.realZ)
				Global.player:loadAnim('Anims/DartNew/etherdance.jan', 0.2, 0)
				while (IsPlayingAnim(Global.player) ~= 0) do Yield() end
				Global.player:loadAnim('Anims/DartNew/standready.jan', 0.2, 0)
				Global.player:setNewAction('Stand')
				Global.player.saved.realX = nil
			end
		end
		MoveCameraToIdeal()

		self:dontRunPlayerControls(0)
		self:setState(nil)
	end
   
	return Ob
end

