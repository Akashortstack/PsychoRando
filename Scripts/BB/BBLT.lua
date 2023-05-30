
--      BBLT.lua
--
--      Level Script
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential and Asian Pimp
--
--

-- Script File for Basic Braining Log Trap
function BBLT(Ob)
	if not Ob then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/DoubleJump.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/longjump.jan',
				'Anims/DartNew/standstill.jan',
				'anims/DartNew/RailSlide45angle.jan',
				'anims/DartNew/RailSlideFlat.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/DartNew/run.jan',
				'anims/DartNew/walk.jan',
			}
		}
		
		Ob.Dart = nil
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.drumSnd = 0
		Ob.ended = nil
		Ob.theme = 'BBLTMusic'
	end

-- ****************************************************************************

	function Ob:onBeginLevel()
		-- save that BBA1 has been beaten
		Global:save('bBBA2Completed', 1)
		
		self.tAmbientSoundLoops = {
			tv_VictorySound = { soundCueName = 'VictoryRoomAmb' },
		}

		%Ob.Parent.onBeginLevel(self)
		self.Dart = FindScriptObject('Dart')
		
		-- cmg fog stats
		SetDistanceFogEnable(1)
		SetDistanceFogColor(0.3,0.1,0.1)
		SetDistanceFogRange(10,20000)
		--self.initCam = Global.camControl:pushAndSetChase(self, 500, 5)
	
		-- OG fog stats
		--SetDistanceFogColor(0.192, 0,0)
		--SetDistanceFogRange(500,20000)
                
   		RegisterTriggerVolume(self, 'tv_Endload')
   		RegisterTriggerVolume(self, 'tv_Logrespawn')
		RegisterTriggerVolume(self, 'tv_Logroll')
		RegisterTriggerVolume(self, 'tv_FinishLoad')
		-- commenting out since i'm using a point ambient sound
--		RegisterTriggerVolume(self, 'tv_ambSound')
		RegisterTriggerVolume(self, 'tv_moodOff')
		RegisterTriggerVolume(self, 'tv_VicotryArea', 0)
		self.log=FindScriptObject('BB_CrazyLogs')
		self.logAmbSound = LoadSound('LogTunnelAmb')
				
		-- set up coach tutorial
		-- first the coach
		self.coach = FindScriptObject('Coach', 1) or SpawnScript('BB.Characters.Coach', 'Coach', '')
		self.coach:setPosition(-77, 0, 0)
		self.coach:setOrientation(0, 90, 0)
		self.coach:hide()
		-- now the tutorial
		if (Global:loadGlobal('bBBCompleted') ~= 1 and Global:load('bBBLTIntroPlayed') ~= 1) then
			self.tutorial = SpawnScript('BB.Props.Tutorial', 'Tutorial', '')
		end
		
		-- the white room should be chained when we revisit this level
		if (Global:loadGlobal('bBBCompleted') ~= 1) then
			-- standard... non completed run
			local chainedDoor = FindScriptObject('ReturnBlocker')
			chainedDoor:makeInvisible()
		else
			-- revisitation - hide the opened door
			local openDoor = FindScriptObject('BunnyRoomDoor')
			openDoor:makeInvisible()
		end
		
		-- now the screens
		AssignCameraToChannel(1, 1)
		-- now the cam
		SetCurrentCamera(1)
		SetCamera(kCAMERA_SCRIPT)
		SetCameraPosition(70,133,-1)
		SetCameraOrientation(2,91,0)
		SetCameraChannelFilter(1, kFILTERTYPE_LUMINANCE)
		SetCurrentCamera(0)
		
		-- domain should be sleeping initially
		DomainSleep('VicotryAreaDOMAIN', 1)
		
		-- set up shadow color
		SetShadowColor(0, 0, 0, 0.5)
	end
	
	function Ob:stateEndLevel()
		--PrintMessage('You win!')
		self:stopLevelTheme()
		self.cutsceneScript:fadeToBlack(.25)
		self:sleep(.25)
		if Global:loadGlobal('bBBCompleted') ~= 1 then
			self:playVideo('cutScenes/prerendered/cabv.xmv')
			if IsOXMBuild() == 1 then
				ShowDemoEndScreen(1)
				self:setState(nil)
				return
			end
			Global:setLevelToCompleted('BB')
		end
		Global:save('ReturnFromBBTemp', 1,'BB')
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--self:loadNewLevel('CAKC', 0, 1)
		self:setState(nil)
	end

-- ****************************************************************************

	function Ob:stateFinished()
		if (Global:loadGlobal('bBBCompleted') ~= 1) then
			Global.player:sayLine("/BBVI001RA/", 1, 1, nil, 1, nil, 1) -- DIALOG=<<Hello!>>
			Global.player:sayLine("/BBVI002RA/", 1, 1, nil, 1, nil, 1) -- DIALOG=<<Hello?>>
			Global.player:sayLine("/BBVI003RA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<Guess I\'m early.>>
		end
		
		self:setState(nil)
	end
    
-- ****************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if from ~= Global.player then return end
		if data=='tv_Endload' then
			if not self.ended then
				self.ended=1
				self:setState('EndLevel')
			end	
		elseif data=='tv_Logrespawn' then 
			self.log:setState('Orient')
			if (Global:load('bBBLTLogIntroPlayed') ~= 1) then
				Global.cutsceneScript:runCutscene('BBLTIntro')
				Global:save('bBBLTLogIntroPlayed', 1)
			end
		elseif data=='tv_Logroll' then 
			self.log:setState('RotationLoop')
		elseif data == 'tv_FinishLoad' and not self.bFinished then
			self.bFinished = 1
			self:setState('Finished')
		elseif data=='tv_ambSound' then 
			PlaySound(nil, self.logAmbSound)	
		elseif data == 'tv_VicotryArea' then
			DomainSleep('VicotryAreaDOMAIN', 0)
		else
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

-- ****************************************************************************
	
	function Ob:onExitedTriggerVolume(data,from)
		if from ~= Global.player then return end
		if data == 'tv_ambSound' then 			
			StopSound(self.logAmbSound)	
		else
			%Ob.Parent.onExitedTriggerVolume(self, data, from)
		end
	end
    
-- ****************************************************************************

	function Ob:onCrossedTriggerPlane(data,from,bFromBack)
		if from ~= Global.player then return end
		if (data == 'tv_moodOff') then
		 	if (bFromBack == 0) then
				self:setMusicMood(self.MUSIC_MOOD_OFF, 1)
			else
				self:restoreMusicMood()		
			end
		end
	end

-- ****************************************************************************
	
	return Ob
   
end

