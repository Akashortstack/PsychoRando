function MILL(Ob)
	if not Ob then
		Ob = CreateObject('LevelScript')
		Ob.theme = 'intentloop'
		Ob.ledgeDirtEmitterName = ''
		Ob.defaultAmbientSoundName = 'MIAmb'
		Ob.dependencies = {
			textures = {
				'textures/hud/quick_levitationtrainerbig.dds',
			},
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/MI_PlatformPetalCage/Close.jan',
				'Anims/MI_PlatformPetalCage/Open_half.jan',
				'Anims/MI_PunchyDoor/MI_PunchyDoor2.jan',
				'Anims/Milla/MITU/MITU_BigFinish_A.jan',
				'Anims/Milla/MITU/MITU_BigFinish_B_Milla.jan',
				'Anims/Milla/MITU/MITU_BigFinish_B_Raz.jan',
				'Anims/Milla/Milla_danceLoop01.jan',
				'Anims/Milla/Milla_danceLoop02.jan',
				'Anims/Milla/Milla_danceLoop03.jan',
				'Anims/Milla/Milla_danceLoop04.jan',
				'Anims/Milla/Milla_danceLoop05.jan',
				'Anims/Milla/Milla_danceLoop06.jan',
				'Anims/Milla/Milla_danceLoop07.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/Dance01.jan',
				'anims/dartnew/Dance02.jan',
				'anims/dartnew/Dance03.jan',
				'anims/dartnew/Dance04.jan',
				'anims/dartnew/Dance05.jan',
				'anims/dartnew/DanceLoop_01.jan',
				'anims/dartnew/DanceLoop_02.jan',
				'anims/dartnew/DanceLoop_03.jan',
				'anims/mi_speakers/speaker5.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			}
		}
	end

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		if (self:isLevelCompleted() ~= 1) then
			--edit removed, don't get levitation early
			--EnablePower(kPOWER_LEVITATION, 1)
			--Global:saveGlobal('bHasLevitationLearnersPermit', 1)
			Global:setLevelToCompleted('SA')
		end
	end

	function Ob:onBeginLevel()

		Global.levelScript.forwardTriggerSurfaceMessages = nil
		%Ob.Parent.onBeginLevel(self)
		
		d=FindScriptObject('Discolight')
		if d then
			d:hide()
		end	
		
		if (self:isLevelCompleted() ~= 1) then
			self.tutorial = SpawnScript('MI.MILLTutorial','MILLTutorial','',1)
			--self.badge = SpawnScript('MI.Props.LevitationBadge','Badge','',1)
		end

		Global.goalManager:activate('TurnOnBigFan')
		

		--local s = SpawnScript('MI.Props.Spinner', 'spinner1', 'self.spinTime = 10', 1)
		--s:setPosition(16795.4, -2750.2, -20522.3)
		--s:setOrientation(0, 99.59999999999999, 0)
		--s = SpawnScript('MI.Props.Spinner', 'spinner2', 'self.spinTime = 10', 1)
		--s:setPosition(17400.3, -2388.8, -21051.8)
		--s:setOrientation(0, 139.8, 0)
		--s = SpawnScript('MI.Props.Spinner', 'spinner3', 'self.spinTime = 10', 1)
		--s:setPosition(17978.9, -1092, -21519.1)
		--s:setOrientation(0, 134.3, 0)
		
		self.challenge1 = SpawnScript('MI.Props.Challenge1MILL1','challenge1','',0)
		
		RegisterTriggerVolume(self,'tv_lighton')
		if Global.levelScript:isLevelCompleted() == 1 then
			--Get rid of Milla
			local milla = FindScriptObject('Milla')
			milla:killSelf()
			
			--Turn the fan on, and set the switch as on
			local bigFan = FindScriptObject('BigFan')
			self:sendMessage(bigFan, 'ToggleStatus')
			local fanSwitch = FindScriptObject('FanSwitch')
			fanSwitch.bIsPressed = 1
			
			--Unlock the end door
			self:unlockDoor()
		else
			RegisterTriggerVolume(self,'tv_rollingrockstar')
		end

		s=FindScriptObject('switchhoop1')
		s:makeInvisible()
		s=FindScriptObject('switchhoop2')
		s:makeInvisible()
		s=FindScriptObject('switchhoop3')
		s:makeInvisible()
		
		SetDistanceFogRange(0,20000)

		-- Enable the dancing idles
		AddExtraRazIdle('dance01', 1)

		if (Global:load('bIntroFlyByPlayed') ~= 1) then
			Global.levelScript.cutsceneScript:runCutscene('IntroFlyBy')
		end
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		if self.rLevelMusicInstance and self.rLevelTheme then
			SoundSetParameterControl(self.rLevelTheme, self.rLevelMusicInstance, 'LowPassRolloff', 0)
		end	
	end

	function Ob:unlockDoor()	
		local pd = FindScriptObject('MILLPunchyDoor')
		if pd then
			if pd.locked then
				pd:unlock()
				local f=FindScriptObject('forcefield')
				if f then
					SetEntityAlpha(f, 0, 0)
					f:hide()
				end
			end	
		end
	end
	
	function Ob:onCrossedTriggerPlane(data,from,dir)
		dir=tonumber(dir)
		if data=='tv_lightoff' then
			d=FindScriptObject('Discolight')
			if dir == 0 then -- turn light off
				d:hide()
			else
				d:show()
			end
		end
	end


	function Ob:onSpinnerMessage(msg, from)
		if from.id == 'defaultSpinnerGroup' then
			self.bMainGroupSpinning = (msg == 'spinning' and 1) or 0
		else
			self.bSecretGroupSpinning = (msg == 'spinning' and 1) or 0
		end
		if self.bMainGroupSpinning == 1 and self.bOpenedDoor ~= 1 then
			self.bOpenedDoor = 1
			Global.levelScript.cutsceneScript:runCutscene('OpenDoor')
		end
	       	if self.bMainGroupSpinning == 1 and self.bSecretGroupSpinning == 1 and self.bGaveMegaFigment ~= 1 then
			self.bGaveMegaFigment = 1
			Global.levelScript.cutsceneScript:runCutscene('GiveMegaFigment')
		end
	end
	
	function Ob:onEnteredTriggerVolume(data, from)
		--GamePrint('entered tv!!!!!!')
		if from==Global.player and data == 'tv_rollingrockstar' then
			Global.levelScript.cutsceneScript:runCutscene('YouWin', 0,nil,nil, 0)
		end
	end

	function Ob:getHintResponse()
		local bigFan = FindScriptObject('BigFan')
	
		if (bigFan.bIsOn == 1) then 
			return {
				{
					voice = "/GLAL006FO/",--DIALOG=<<Get those rings spinning!>>
				}
			}
		else
			return {
				{
					voice = "/GLAL005FO/",--DIALOG=<<Use your PSI Float in those columns of bubbles to float up to the top of the room, and then figure out how to turn the big fan on.>>
				}
			}
		end
	end

	return Ob
end

