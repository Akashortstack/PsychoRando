function LOCB(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = { 'LO.Characters.UltraCoach' },
			animations = {
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Dizzy.jan',
				'Anims/DartNew/KnockDownBack_start.jan',
				'Anims/DartNew/KnockDownFront_start.jan',
				'Anims/DartNew/KnockDown_end.jan',
				'Anims/DartNew/KnockDown_loop.jan',
				'Anims/DartNew/Knockforward.jan',
				'Anims/DartNew/Melee/lo/Chop1.jan',
				'Anims/DartNew/Melee/lo/Chop2.jan',
				'Anims/DartNew/Melee/lo/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/Shocked.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/Lungfish_Citizens/heartattack.jan',
				'Anims/Lungfish_Citizens/zealot_freed.jan',
				'Anims/Lungfish_Citizens/zealot_jump.jan',
				'Anims/Lungfish_Citizens/zealot_pointL.jan',
				'Anims/Lungfish_Citizens/zealot_pointR.jan',
				'Anims/Lungfish_Citizens/zealot_run.jan',
				'Anims/Lungfish_Citizens/zealot_talk.jan',
				'Anims/Lungfish_Citizens/zealot_trapped.jan',
				'Anims/Lungfish_Citizens/zealot_breathe.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_end.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_loop.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_start.jan',
				'Anims/DartNew/lo/DoubleJump.jan',
				'Anims/DartNew/lo/PsiBlast_HeadButt.jan',
				'Anims/DartNew/lo/Shield_start.jan',
				'Anims/DartNew/lo/hop.jan',
				'Anims/DartNew/lo/landsoft.jan',
				'Anims/DartNew/lo/longjump.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/MegaIdle2.jan',
				'anims/dartnew/MegaIdle4.jan',
				'anims/dartnew/MegaIdle5.jan',
				'anims/dartnew/megaidle.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
			}
		}

		Ob.rPlayerTrigSphere = nil
		Ob.CoachAwake = 0
       	Ob.theme = 'Lungfishopolis'
		Ob.coachTheme = 'UltramanBattle'
		Ob.bUseLOAnims = 1
		Ob.bProcessFootfalls = 1		
		Ob.bBossBattle = 1
	end
	
	function Ob:onPreBeginLevel()
		self.rPlayerTrigSphere = AddTriggerSphere(0,0,0, 1500 ,Global.player)
		%Ob.Parent.onPreBeginLevel(self)
	end

	function Ob:onBeginLevel()
		-- Debug hacks
		-- ##build night hack begin
        FindScriptObject('towerdoor'):makeVisible()
		-- ##build night hack end

		--Player must have gotten at least this far
		--Global:setLevelToCompleted('NI')
		Global:saveGlobal('bGotShield', 1)
		Global:saveGlobal('bLOMACompleted', 1)

		%Ob.Parent.onBeginLevel(self)
				
		self.RazillaWalk = LoadSound('LOFootsteps')
		self.RazillaLand = LoadSound('LOJumpLand')

-- 		stuff to take out the shield wall/laser/etc until I can remove them properly
		Global:save('bZealotIntroductionPlayed', 1)
		Global:save('ShieldWallOff', 1)
		
--		self.ShieldWall = SpawnScript('LO.Props.ShieldWall', 'ShieldWall', '', 1)
		
		self.UltraCoach = SpawnScript('LO.Characters.UltraCoach', 'UltraCoach', '', 1)
--		self.Zealot = SpawnScript('LO.Characters.Zealot', 'BossBattleSatelliteZealot', '', 1)
--		self.Zealot:setPosition(-598, 193, -1203)
		
		self.CoachSphere = TriggerSphere_New(1446, 529, -23, 800)
		Trigger_RegisterListener(self.CoachSphere, self)
		self.LOVESceneSphere = TriggerSphere_New(4928, 3200, -48, 500)
		Trigger_RegisterListener(self.LOVESceneSphere, self)
		self.WindSoundSphere = TriggerSphere_New(4928, 2500, -48, 1200)
		Trigger_RegisterListener(self.WindSoundSphere, self)
		self.KeepAwaySphere = TriggerSphere_New(4928, 1200, -48, 1200)
		Trigger_RegisterListener(self.KeepAwaySphere, self)
		
		Global.player:addSpamListener('RazRespawn', self)

		Global.player.damageRecoveryTime = 2000

		if (Global:load('ZealotIntroSeen') == 1) then
			if (Global:load('ShieldWallOff') ~= 1) then
				self.UltraCoach = FindScriptObject('UltraCoach')
				self.UltraCoach.laser:turnOn()	
			end
		end

		self.UltraCoach.laser:turnOff()	
		
		-- Water settings
		SetReflectionScale(1.75)
		SetFresnelBumpScale(0.03)
		SetReflectionBumpScale(0.5)
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/LO_waterNoise2.tga')
				
		SetSkyBox('Levels/SkyBox/LO_SkyBox2.plb')

		Global.camControl:pushAndSetChase(self, nil, -5, 225)

		-- put all the slow raz stuff in this function found in LevelScript.lua
		self:startSlowLORaz()		

		self.rWindSoundHandle = LoadSound('TowerWind')
		
		Global.goalManager:activate('DefeatKochamera')
		
		--So we can keep raz off the ball
		Global.player:addSpamListener('ControlHandlerChanged', self)

		--For razilla stomping
		Global.player:addSpamListener('Collide', self) 
		
		self.leftFootDecal = LoadTexture('Textures/LevelTextures/LO_Lungfishopolis/LO_footprint_left.tga')
		self.rightFootDecal = LoadTexture('Textures/LevelTextures/LO_Lungfishopolis/LO_footprint_right.tga')
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		local w = FindScriptObject('waterbeforedam')
		if ( w ) then
			w.reflectionDomain = 'waterglobe_DOMAIN' -- doesn't exist yet but will fix the raz invisible problem
		end
		
		if (Global:load('bEndIsNeighPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('EndIsNeigh')
		end
		
		if (Global:load('UltraCoachDead') == 1) then					
			self.UltraCoach:deathStuff()					
		end	
	end

	function Ob:footfall(whichFoot, walkType)
		PlaySound(nil,self.RazillaWalk,0,0)
		CameraStartShakeDriven((walkType == 'Run' and 3) or 1.5)
	end

	function Ob:listenerCollide(data, from)
		if (from == Global) and (GetPhysicsState(Global.player, PHYSICSSTATE_ONGROUND) == 1) then
			--No need for relgrav safety in LO
			local _, vy = GetTotalVelocity(Global.player)
			if (vy < -400) then
				self:stomp(vy)
			end
		end
	end

	function Ob:stomp(fallVelocity)
		PlaySound(nil,self.RazillaLand,0,0)
		local shake = ((fallVelocity) and (fallVelocity / -50)) or 8
		CameraStartShakeDriven(shake)

		local cooky = BeginMath()

		local qOri = Quat(GetOrientation(Global.player))
		local vUp = qOri * Vector(0,1,0)
		local vRight = qOri * Vector(-1,0,0)
		local vFwd = qOri * Vector(0,0,1)
		local vPos = Vector(GetAbsPosition(Global.player)) + vUp * 10

		local vOffset = qOri * Vector(-20,0,0)
		local SIZE = 64
		vPos:AddEquals(vOffset)
		AttachDecal(self.rightFootDecal,
					10,							-- lifetime
					vPos.x, vPos.y, vPos.z,		-- pos
					-vUp.x, -vUp.y, -vUp.z,		-- projection dir
					SIZE,SIZE,					-- size
					-vFwd.x, -vFwd.y, -vFwd.z,	-- up
					1.0							-- alpha
				)

		vPos:SubEquals(vOffset)
		vPos:SubEquals(vOffset)
		AttachDecal(self.leftFootDecal,
					10,							-- lifetime
					vPos.x, vPos.y, vPos.z,		-- pos
					-vUp.x, -vUp.y, -vUp.z,		-- projection dir
					SIZE,SIZE,					-- size
					-vFwd.x, -vFwd.y, -vFwd.z,	-- up
					1.0							-- alpha
				)

		EndMath(cooky)
	end


	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		Global.player.damageRecoveryTime = 3000
		Global.levelScript:enableAllGoodies()
		-- put all the UNslow raz stuff in this function found in LevelScript.lua
		self:endSlowLORaz()
	end
	
	function Ob:onCrossedTriggerPlane(data,from, bFromBack)
		if (from == Global.player and data == 'tv_ZealotTowerHint' and bFromBack ~= 1 and Global:load('bUltraCoachDiesPlayed') == 1) then
			if (Global:load('bZealotFirstTowerHintPlayed') ~= 1) then
				Global.cutsceneScript:runCutscene('ZealotFirstTowerHint')
			else
				Global.cutsceneScript:runCutscene('ZealotSecondTowerHint')
			end
		end
	end
	
	function Ob:stateEndLevel()
		self:playVideo('cutScenes/prerendered/love.xmv')
		self:playVideo('cutScenes/prerendered/lllv.xmv')
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('ASGR',0,1)		
		self:setState(nil)
	end
	
	function Ob:onEnteredTriggerVolume(data, from)
		if (from and from == Global.player) then
			if (data == self.CoachSphere and self.CoachAwake ~= 1) then
				self.UltraCoach = FindScriptObject('UltraCoach')
				if (Global:loadGlobal('bCoachIntroPlayed') ~= 1) then
					self:playVideo('cutScenes/prerendered/louc.xmv')	
					Global:saveGlobal('bCoachIntroPlayed',1)
					Global.cutsceneScript:runCutscene('LOCBIntro')
				else
					if (Global:load('UltraCoachDead') ~= 1) then					
						self.UltraCoach:WakeUpBoss()
					end
				end				
				
				if (Global:load('UltraCoachDead') ~= 1) then					
					self:setLevelTheme(self.coachTheme)
					self.CoachAwake = 1
				end
				self.UltraCoach.laser:turnOff()											
				SetEntityVisible(self.UltraCoach.laser, 0)
			elseif (data == self.LOVESceneSphere and self.UltraCoach.bDead == 1) then
				Global:setLevelToCompleted('LO')
				self:setState('EndLevel')
--				ReturnToStartMenu()				
			elseif (data == self.KeepAwaySphere and self.UltraCoach.bDead ~= 1) then
				self.UltraCoach:keepAway()
			end
			if (data == self.WindSoundSphere) then
				self:playSound(self.rWindSoundHandle, 0, 0, 1)
			end
		end
	end

	function Ob:onExitedTriggerVolume(data, from)
		if (from == Global.player) then
			self:stopSound(self.rWindSoundHandle)
		end
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
	end

	function Ob:listenerRazRespawn()
		self.UltraCoach:PutBossToSleep()
		self.CoachAwake = 0	
	end

	--Listen for Raz to get on the ball, and kick him off it
	function Ob:listenerControlHandlerChanged(type)
		if (type == kCONTROL_BALL) then
			--Use a timer so we can see him do the full ball mount
			self:createNamedTimer(500, 'KnockOffBall', 1)
		end
	end
	
	function Ob:onTimerKnockOffBall()
		if (GetControlHandler() == kCONTROL_BALL) then
			Global.player:sayLine("/GLRA077RA/", 0, 1, nil, 1)
			Global.player:playSound('Negative', 0, 0, 1)
			Global.player:interruptPowers(1)
			SetControlHandler(kCONTROL_PLAYER)
		end
	end

	function Ob:getHintResponse()
		local response

--		if self:tanksKickingAss() then
--			response = { { voice = "Why don't you just pick up those pesky tanks and throw them at each other?" } }
		if self:duringTowerClimb() then
			response = { { voice = "/GLAN013FO/" } }			--DIALOG=<<Okay, now get up that tower and take out the communications equipment at the top!>>
		elseif self:duringKochamaraFight() then
			response = { { voice = "/GLAN010FO/" },--DIALOG=<<If you pay attention to this guys actions, you can tell how he\'s about to attack.>>
						{ voice = "/GLAN011FO/" },--DIALOG=<<Wait for him to let down his shield, and then attack.>>
						{ voice = "/GLAN012FO/" } }--DIALOG=<<And don\'t forget to use your own shield!>>
		else
			response = self.Parent:getHintResponse()
		end
		
		return response
	end
	
	function Ob:duringKochamaraFight()
		return nil ~= Global:load('bLOCBIntroPlayed')
	end
	
	function Ob:duringTowerClimb()
		return nil ~= Global:load('bUltraCoachDiesPlayed')
	end

	function Ob:pauseFXForCutscene()
		SoundMuteCategory(kSOUNDCAT_FX)		
	end

	function Ob:resumeFXForCutscene()
		SoundUnmuteCategory(kSOUNDCAT_FX)
	end
			
	return Ob
end

