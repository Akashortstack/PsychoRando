function MIFL(Ob)
	if not Ob then
		Ob = CreateObject('LevelScript')
		Ob.theme = 'intentloop'
		Ob.tutorial = nil
		Ob.bIntroCSPlayed = 0
		Ob.demonRoomTheme = 'demon_room_ambient'
		Ob.mainTheme = nil	-- same as theme
		Ob.ledgeDirtEmitterName = ''
		Ob.defaultAmbientSoundName = 'MIAmb'
		Ob.dependencies = {
			textures = {
				'textures/particletextures/mi_glitter_strip.tga',
				'textures/icons/inventoryitems/learnerspermit_levitation.tga',
				'textures/hud/quick_levitationtrainerbig.dds',
			},
			animations = {
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Campkids/Props/JumpOnBubble_bubble.jan',
				'Anims/Campkids/Props/KnockedDown_bubble.jan',
				'Anims/Campkids/Props/balance2_bubble.jan',
				'Anims/Campkids/Props/Quentin_first_jump_bubble.jan',
				'Anims/Campkids/Props/Quentin_mifl_idle_bubble.jan',
				'Anims/Campkids/Props/Quentin_second_jump_bubble.jan',
				'Anims/Campkids/props/balance_bubble.jan',
				'Anims/Campkids/Props/ramp_jump_cutscene_bubble.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FacePlant.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Hop_water.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Demon_Chest/Open.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/MI_PlatformPetalCage/Close.jan',
				'Anims/MI_PlatformPetalCage/Open_half.jan',
				'Anims/Milla/MITU/MITU032MI.jan',
				'Anims/Milla/MITU/MITU033MI.jan',
				'Anims/Milla/MITU/Milla_Tutorial_blowkiss.jan',
				'Anims/Milla/Milla_danceLoop01.jan',
				'Anims/Milla/Milla_danceLoop02.jan',
				'Anims/Milla/Milla_danceLoop03.jan',
				'Anims/Milla/Milla_danceLoop04.jan',
				'Anims/Milla/Milla_danceLoop05.jan',
				'Anims/Milla/Milla_danceLoop06.jan',
				'Anims/Milla/Milla_danceLoop07.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/MI_BallBlaster/Deploy.jan',
				'Anims/MI_BallBlaster/Retract.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/mi_punchydoor/mi_punchydoor2.jan',
				'anims/mi_speakers/speaker1.jan',
				'anims/mi_speakers/speaker4.jan',
				'anims/mi_speakers/speaker5.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			}
		}

		Ob.tMusicFader = {
			tv_MOOD_COMBAT1 = 'CombatMood1Fader',
			tv_MOOD_COMBAT2 = 'CombatMood2Fader',
			tv_MOOD_COMBAT3 = 'CombatMood3Fader',
		}

	end

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		if (self:isLevelCompleted() ~= 1) then
			--edit removed, don't get levitation early
			--EnablePower(kPOWER_LEVITATION, 1)
			--Global:saveGlobal('bHasLevitationLearnersPermit', 1)
			--Global:setLevelToCompleted('SA')
			--[[
			if GetMappedPower(kQUICKPICK_TRIGR) == kPOWER_LEVITATION then MapPowerToButton(kPOWER_NONE,kQUICKPICK_TRIGR) end
			if GetMappedPower(kQUICKPICK_BLACK) == kPOWER_LEVITATION then MapPowerToButton(kPOWER_NONE,kQUICKPICK_BLACK) end
			MapPowerToButton(kPOWER_LEVITATION,kQUICKPICK_WHITE)
			]]
		end
	end

	function Ob:onBeginLevel()
		self.defaultAzimuth=GetChaseCameraAzimuth()
		
		self.azimuth1Cur = 0
		self.azimuth1Dest = 20
		self.azimuth1Add = .5

		%Ob.Parent.onBeginLevel(self)

		SetSkyBox('Levels/SkyBox/MI_MIFLskybox.plb', 0)

		-- need to load level themes ourself since we need to swap them in and out
		self.demonRoomTheme = LoadSound(self.demonRoomTheme)
		self.mainTheme = LoadSound(self.theme)

		--Disable Raz's trace-to-valid-floor, because MIFL is all about the big air
		MM_DisableOOWKludge(1)
		--Disable ball popping
		MI_DisableFallOffBall(1)
		
		self.milla = FindScriptObject('MI_milla')

		if (Global:load('FinishedTutorial') ~= 1) then
			self.challengeTut = SpawnScript('MI.Props.ChallengeTutMIFL1','challengeTut')
			local s=FindScriptObject('TutFloatHoop1',1)
			if s then s.axis = 'Z' end
			s=FindScriptObject('TutFloatHoop2',1)
			if s then s.axis = 'Z' end
			s=FindScriptObject('TutFloatHoop3',1)
			if s then s.axis = 'Z' end
			self.tutorial = SpawnScript('MI.MIFLTutorial','MIFLTutorial','',1)
		else
			local s=FindScriptObject('TutFloatHoop1',1)
			if s then s:killSelf() end
			s=FindScriptObject('TutFloatHoop2',1)
			if s then s:killSelf() end
			s=FindScriptObject('TutFloatHoop3',1)
			if s then s:killSelf() end
		end

		if (Global:load('FinishedPlunger') ~= 1) then
			self.plungerTut = SpawnScript('MI.Props.PlungerTutMIFL1','plungerTut')
			local s=FindScriptObject('PlungerFloatHoop4',1)
			if s ~= nil then s.axis = 'Z' end
		else
			local s=FindScriptObject('PlungerFloatHoop1',1)
			if s ~= nil then s:killSelf() end
			s=FindScriptObject('PlungerFloatHoop2',1)
			if s ~= nil then s:killSelf() end
			s=FindScriptObject('PlungerFloatHoop3',1)
			if s ~= nil then s:killSelf() end
			s=FindScriptObject('PlungerFloatHoop4',1)
			if s then s:killSelf() end
		end
		
		self.challenge1 = SpawnScript('MI.Props.Challenge1MIFL1','challenge1','',0)
		self.challenge2 = SpawnScript('MI.Props.Challenge2MIFL1','challenge2','',0)
		self.challenge3 = SpawnScript('MI.Props.Challenge1MIFL2','challenge3','',0)
		
		self.shatterPE=SpawnScript('MI.Effects.RingShatterFX','shatter','',1)
		
		Global.goalManager:activate('Bouncer')
		
		self.quentionJump2Trigger = 'tv_bouncerClose' --Triggers Quentin's second jump and float tutorial
		RegisterTriggerVolume(self, 'tv_bowl1')
--		RegisterTriggerVolume(self, 'tv_yawhint1')
        RegisterTriggerVolume(self, 'tv_YawHintNets')
		RegisterTriggerVolume(self, 'tv_LSODemonDomain')
		RegisterTriggerVolume(self, 'tv_DoubleBubbleJumpStart')
		RegisterTriggerVolume(self, 'tv_plungerCutscene')
		RegisterTriggerVolume(self, self.quentionJump2Trigger) 
		RegisterTriggerVolume(self, 'tv_orphanage')
		RegisterTriggerVolume(self, 'tv_hazmat')
		
		local x,y,z = FindScriptObject('demonRoomSphereLoc'):getPosition()
		--self.demonRoomSphere = AddTriggerSphere(x + 100 ,y,z, 930)	-- x = -7651.2 y = 77.1	z = -17400
		self.demonRoomSphere = TriggerSphere_New(x + 100, y, z, 930)
		RegisterTriggerVolume(self, self.demonRoomSphere)
		
		-- Horizontal Fan Particles
		local emitter = CreateParticleEmitter('',1000)
		PESetDistribution(emitter,kPD_CYLINDER,kPDV_AXIAL,0,0,0,376.000000,376.000000,3000.000000)
		PESetTexture(emitter,'textures/particletextures/mi_glitter_strip.tga')
		PESetTexAnimInfo(emitter,13,0,0,7.000)
		PESetParticleBlendMode(emitter,kBLENDMODE_ALPHA_BLEND)
		PESetParticleForce(emitter,0.000000,0.000000,0.000000)
		PESetActive(emitter,1)
		PESetNoSpread(emitter,1)
		PESetRelative(emitter,0)
		PESetParticleSpeed(emitter,300.000000,2000.000000)
		PESetParticleSize(emitter,40.000000,40.000000)
		PESetParticleRotation(emitter,0.000,45.000, 1)
		PESetParticleLifetime(emitter,2.000000,2.000000)
		PESetParticlesPerSec(emitter,100.000000,100.000000)
		-- Affector No Worky.. but i'm holding on to it for Lance
		--[[
		Affector = CreateCylindricalParticleAffector('Affector',5730.000,500.000,10.000,50.000,40.000)
		SetPrimaryAffector(Emitter,Affector)
		SetPosition(Affector, -21698,12368,22469)
		SetOrientation(Affector90,20,0)
		]]--
		-- Location / orientation stuff
		SetPosition(emitter, -21698,12368,22569)
		SetOrientation(emitter, 90,20,0)
		self.horizontalFanPE = emitter
		
		SetShadowColor(0, 0, 0, 0.5)

		SetDistanceFogEnable(1)
		SetDistanceFogColor (.1,0,.2)
		SetDistanceFogRange(0,17500)
		
		-- set the sound for the horizontal thrust
		local fan = FindScriptObject('MIFLfanvolume')
		if (fan) then
			fan.sFloatSound = 'FanDraft'
		end
		
		FindScriptObject('rampCamTop'):turnOff()
		FindScriptObject('rampCamBottom'):turnOff()

		-- if we're revisiting, then we want to destroy everything on those platforms
		if (Global:loadGlobal('bMICompleted') == 1) then
			-- remove all dancers
			foreach_entity_oftype('MI.Characters.NewEraDancer', function(ent) ent:killSelf() end)
			-- remove all thought bubbles
			foreach_entity_oftype('MI.Props.SimpleThoughtBubble', function(ent) ent:killSelf() end)
			-- remove all camp kids
			foreach_entity_oftype('MI.Characters.CampKid', function(ent) ent:killSelf() end)		
		else
			-- standard level, get rid of the revisit censors
			foreach_entity_oftype('Global.Enemies.CensorMelee', function(ent)
                                                                    if (strsub(ent.Name, 1, 7) == 'Revisit') then
																		ent:killSelf()
                                                                    end
                                                                end)
		end
		
		-- Enable the dancing idles
		AddExtraRazIdle('dance01', 1)

		self.rDemonRoomAmb = LoadSound('demon_room_amb')
	end

	function Ob:startPlayer()
		local cs = self:getIntroCutsceneName()
		if cs then
			GamePrint('Custom MIFL start for Raz: forcing gen_dartstart placement.')
			-- clear out oatmeal if player used one into this level.
			Global:saveGlobal('OatmealName', nil, 'levelLoad')
			Global.player:setEverything(self.dartStart)
			if self.dartStart.bDontSnap ~= 1 then
				SnapEntityToGround(Global.player)
			end
		else
			%Ob.Parent.startPlayer(self)
		end
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		SetDistanceFogEnable(1)
		SetDistanceFogColor (.1,0,.2)
		SetDistanceFogRange(0,17500)

		if (Global:loadGlobal('bMICompleted') == 1) then
			--Special intros for level revisiting
			local tCS = {postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf=self, bEndCutsceneFadesIn = 0, bKeepHandler = 1}
			tCS.sName = self:getIntroCutsceneName()
			if tCS.sName then
				Global.cutsceneScript:runCutsceneWithSettings(tCS)
			end
		elseif (Global:load('FinishedTutorial') ~= 1) then
			self.cutsceneScript:runCutscene('Intro', 0, 0)
		end
		-- to set the music mood since special case
		self:setMusicMood(self.iCurrMood)
	end

	function Ob:getIntroCutsceneName()
		if (Global:loadGlobal('bMICompleted') == 1) then
			if ( 1 == Global:load('bASPRRebrainingPlayed', 'AS') and 1 ~= Global:load('bASRUIntroPlayed', 'AS') and 1 ~= Global:load('bRevisitIntroRebrainedPlayed') ) then
				return 'RevisitIntroRebrained'
			elseif (Global:loadGlobal('bMCEntered') == 1) or (Global:load('CALevelState', 'CA') < 7) then
				if (Global:load('bRevisitIntroEarlyPlayed') ~= 1) then
					return 'RevisitIntroEarly'
				end
			else
				if (Global:load('bRevisitIntroState7Played') ~= 1) then
					return 'RevisitIntroState7'
				end
			end
		end
		return nil
	end
	
	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Melee = {num = 2, censorCode = 'Melee', scriptName = nil},
									Minion = {num = 3, censorCode = 'Minion', scriptName = nil},
									Suicide = {num = 2, censorCode = 'Suicide', scriptName = nil},
			}
	end
	

	function Ob:stateAzimuthHint1()
		if self.azimuth1Dest ~= self.azimuth1Cur then
			self.azimuth1Cur = self.azimuth1Cur+self.azimuth1AddCur
			SetChaseCameraAzimuth(self.azimuth1Cur)
		else
			self:setState(nil)	
		end	
	end
	
	function Ob:onEnteredTriggerVolume(data,from)
		if (from == Global.player) then 
			if data == 'tv_bowl1' then
				if (Global:load('bGotBowlHint') ~= 1) then
					self.milla.crh:chatterStart(1, nil, nil, 'BowlRoomHint')
					Global:save('bGotBowlHint', 1)
				end
			elseif data == 'tv_bouncercam' then
				self.saveCamAlt = GetChaseCameraAltitude()
				--SetChaseCameraAltitude(-4)
				self.bouncerCamHandle = Global.levelScript.camControl:pushAndSetChase(self, nil, -4, nil, nil)
			elseif data == 'tv_LSODemonDomain' then
				self:setLevelTheme(self.demonRoomTheme)
				self:playSound(self.rDemonRoomAmb, 0, 0, 1)
				if (Global:load('bGotDemonRoomLines') ~= 1) then
					self.milla.crh:chatterStart(1, 0, nil, 'DemonRoom')
					Global:save('bGotDemonRoomLines', 1)
				end
				--Clear dance idles so that Raz doesn't dance
				ClearExtraRazIdles()
				--Achievement!
				UnlockAchievement('ACH_MI_DEMONROOM_SEEN')
			elseif data == 'tv_jumphoopplat1' then
				SetChaseCameraHintAzimuth(33)
			elseif data == 'tv_plungerCutscene' then
				if (Global:load('bPlungerIntroPlayed') ~= 1) then
					Global.cutsceneScript:runCutscene('PlungerIntro')
				end
			elseif data == 'tv_orphanage' then
				if (Global:load('bGotOrphanageLine') ~= 1) then
					self.milla.crh:chatterStart(1, 0, nil, 'Orphanage')
					Global:save('bGotOrphanageLine', 1)
				end
			elseif data == 'tv_hazmat' then
				if (Global:load('bGotHazardHint') ~= 1) and (self:isLevelCompleted() ~= 1) then
					self.milla.crh:chatterStart(1, 0, nil, 'hazardHint')
					Global:save('bGotHazardHint', 1)
				end
			end

			if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
				if (self.tMusicFader[data]) then
					local fader = FindScriptObject(self.tMusicFader[data])
					if fader then
						self.rCurrentFader = fader
						fader:startTrack(self.iCurrTriggerVal)
					end
				end
			end
		end
		%Ob.Parent.onEnteredTriggerVolume(self, data, from)
	end

	function Ob:onExitedTriggerVolume(data,from)
		if (from == Global.player) then
			if data == 'tv_bowl1' then 
				--if not Global.levelScript.chal1Complete then
					--local bowlloc=FindScriptObject('bowlloc')
					--GamePrint("REMOVING CHASE CAM ADJUST FOR BOWL " .. (self.bowlCamHandle or "NOHANDLE"))
					--FindScriptObject('chaseCamAdjustPlatforms'):turnOff()
					--Global.levelScript.camControl:removeCam(self.bowlCamHandle)
				--end	
			elseif data == 'tv_bouncercam' then
				--[[if self.saveCamAlt then 
					SetChaseCameraAltitude(self.saveCamAlt)
				end	]]--
				Global.levelScript.camControl:removeCam(self.bouncerCamHandle)
			elseif data == 'tv_LSODemonDomain' then	
				self:setLevelTheme(self.mainTheme)
				self:stopSound(self.rDemonRoomAmb)
				-- Reenable the dancing idles
				AddExtraRazIdle('dance01', 1)
			elseif data == self.demonRoomSphere then
				self.milla.crh:chatterStop()
			end
			if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
				if (self.tMusicFader[data]) then
					local fader = FindScriptObject(self.tMusicFader[data])
					if fader then
						fader:stopTracking()
					end
				end
			end			
		end
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
	end

	function Ob:onCrossedTriggerPlane(data,from,bFromBack)
		if data == 'tv_DoubleBubbleJumpStart' then
				if bFromBack == 0 then
					self.doubleBubbleJumpStart = 1	
				elseif 	bFromBack == 1 then
					self.doubleBubbleJumpStart = nil	
				end	
		elseif (data == self.quentionJump2Trigger) and (from == Global.player) then
			if (self:isLevelCompleted() ~= 1) and (Global:load('FinishedTutorial') ~= 1) and self.bPlayedQuentinJump ~= 1 then
				Global.cutsceneScript:runCutscene('QuentinsSecondJump')
				self.bPlayedQuentinJump = 1
			end
	 	elseif (from == Global.player and bFromBack == 0 and data == 'tv_YawHintNets') then
			local ox,oy,oz = Global.player:getOrientation()
		 	SetChaseCameraHintAzimuth(NormalizeAngle(oy+180))
		end
	end
	
	function Ob:getHintResponse()
	
		local bChallengesCompleted = (self.challenge1.completed == 1) and (self.challenge2.completed == 1) and (self.challenge3.completed == 1)
	
		--Default to this
		if (bChallengesCompleted) then 
			return {
				{
					voice = "/GLAL001FO/",--DIALOG=<<Stay on your bubble, Raz.>>
				},
				{
					voice = "/GLAL002FO/",--DIALOG=<<Keep trying to get higher, and if you see any of those big rings, keep \'em spinning.>>
				}
			}
		else
			return {
				{
					voice = "/GLAL000FO/",--DIALOG=<<Do whatever Milla says, young man. You\'re in her classroom now.>>
				}
			}
		end
	end


--********************************************************************************                  

	-- overriding to use param controls
	function Ob:setMusicMood(mood, bForce)		
		local bMood = 0
		if (mood) then		
			bMood = 1
			if (self.bLockCurrMood == 0 or bForce == 1) then
				local triggerval = 0
				self.iPrevMood = self.iCurrMood
				self.iCurrMood = mood
				-- note: all the values here are going to be changed...
				if (mood == self.MUSIC_MOOD_OFF) then
					triggerval = 0
				elseif (mood == self.MUSIC_MOOD_AMBIENT) then
					triggerval = 0
				elseif (mood == self.MUSIC_MOOD_COMBAT) then
					triggerval = 1
				elseif (mood == self.MUSIC_MOOD_MED) then
					triggerval = 0.5
				elseif (mood == self.MUSIC_MOOD_HIGH) then
					triggerval = 1
				else
					bMood = 0
				end
				self.iCurrTriggerVal = triggerval
				-- only change if no current fader
				if not Global.levelScript.rCurrentFader then
					if self.rLevelMusicInstance and self.rLevelTheme then
						SoundSetParameterControl(self.rLevelTheme, self.rLevelMusicInstance, 'LowPassRolloff', triggerval)
					end
				end
				if (bForce) then
					self.bLockCurrMood = 0
				end
			elseif (self.bLockCurrMood == 1) then
				self.iPrevMood = mood
			end
		end
		if bMood ~= 1 then
			GamePrint('ERROR: Invalid mood '..(mood or 'nil')..'.')
			StackTrace()
		end
	end	

--********************************************************************************                  
	

	return Ob
end

