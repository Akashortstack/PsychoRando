function THCW(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = {
				'TH.Props.Megaphone',
			},
			animations = {
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Censor1L/Burly_DamageFrontPriority.jan',
				'Anims/DartNew/BodyParts/Hold_Candle_spineJA_1.jan',
				'Anims/DartNew/BodyParts/Hold_TH_Megaphone.jan',
				'Anims/DartNew/CantBkwdPoses.jan',
				'Anims/DartNew/CantFwdPoses.jan',
				'Anims/DartNew/Cantbreathe.jan',
				'Anims/DartNew/DamageFront_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/HolyShiteFall.jan',
				'Anims/DartNew/Listen.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/Pack/pack_closing.jan',
				'Anims/DartNew/Pack/pack_opening.jan',
				'Anims/DartNew/PsiGrab_armJALf_1.jan',
				'Anims/DartNew/PsiGrab_armJARt_1.jan',
				'Anims/DartNew/RailSlide45angle.jan',
				'Anims/DartNew/RailSlideUphill.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/balloonwalk.jan',
				'Anims/DartNew/balloonwalkslow.jan',
				'Anims/DartNew/walkmove.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Phantom/BlockLight_end.jan',
				'Anims/Phantom/BlockLight_start.jan',
				'Anims/DartNew/BalloonSpeedMount.jan',
				'Anims/DartNew/BubbleJump.jan',
				'Anims/DartNew/CantHandStandTurn.jan',
				'Anims/DartNew/ClimbLedge.jan',
				'Anims/DartNew/DoubleJump.jan',
				'Anims/DartNew/Firestart_end.jan',
				'Anims/DartNew/Firestart_loop.jan',
				'Anims/DartNew/LadderDismount.jan',
				'Anims/DartNew/MidAirBallMount.jan',
				'Anims/DartNew/Trampoline_squash.jan',
				'Anims/DartNew/TrapezeDismountFwd.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/balloonidlefb.jan',
				'Anims/DartNew/cantdismountfwd.jan',
				'Anims/DartNew/hop_recovery.jan',
				'Anims/DartNew/ladderStop.jan',
				'Anims/DartNew/ladderUp.jan',
				'Anims/DartNew/landsoft.jan',
				'Anims/DartNew/longjump.jan',
				'Anims/DartNew/netJangle.jan',
				'Anims/DartNew/psifloata.jan',
				'Anims/DartNew/psifloatb.jan',
				'Anims/DartNew/standready.jan',
				'Anims/Thought_Bubble/BubbleDoubleJump.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'Anims/Thought_Bubble/PsiFloatBubbleIdle.jan',
				'Anims/Thought_Bubble/PsiFloatBubbleOpen.jan',
				'Anims/Thought_Bubble/PsiFloatBubblePop.jan',
				'anims/DartNew/180.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnLfCycle.jan',
				'anims/DartNew/TrnRtCycle.jan',
				'anims/DartNew/creep.jan',
				'anims/DartNew/run.jan',
				'anims/DartNew/walk.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/th_theater/trapdoorclose.jan',
				'anims/th_theater/trapdooropen.jan',
				'anims/dartnew/CantShimmyLeft.jan',
				'anims/dartnew/CantShimmyRight.jan',
				'anims/dartnew/trapeze_BkwdPoses.jan',
				'anims/dartnew/trapeze_FwdPoses.jan',
			}
		}
		
        Ob.ledgeDirtEmitterName = 'TH.Effects.THCWLedgeDirtFX'
		
		Ob.theme = 'Catwalks'
		Ob.TIMER_SHADOW2YAWHINT = '2'
		Ob.TIMER_SHADOW4YAWHINT = '3'
		Ob.TIMER_SHADOW1DELAY = '4'
		
		Ob.catwalkGroundMaterial = 10
		Ob.defaultAmbientSoundName = 'THCWAmb'
	end
	
--*******************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Melee = {num = 6, censorCode = 'Melee', scriptName = nil},
									Suicide =  {num = 2, censorCode = 'Suicide', scriptName = nil},
									Burly = {num = 2, censorCode = 'Burly', scriptName = nil},
		}
	end

--*******************************************************************************
		
	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		Global:setLevelToCompleted('MM')
		%Ob.Parent.onBeginLevel(self)
		
		self.sandBagPool = Global.levelScript:getPool('TH.Props.Sandbag')
		self.sandBagPool:setLowerLimit(12)
		self.sandBagFXPool = Global.levelScript:getPool('TH.Effects.SandBagPoofFX')
		self.sandBagFXPool:setLowerLimit(12)

		--Create an effects pool for catwalk dust effects
		self.footPoofFXPool = Global.levelScript:getPool('TH.Effects.THFootPoofFX')
		self.footPoofFXPool:setLowerLimit(3)	--Shouldn't be more than this really...

		self.elevator = FindScriptObject('Elevator')
		
		RegisterTriggerVolume(self, 'tv_LoadTHFB')
		RegisterTriggerVolume(self, 'tv_PhantomIntro')
		
		--shadows
		RegisterTriggerVolume(self, 'tv_shadow1')
		RegisterTriggerVolume(self, 'tv_shadow2')
		RegisterTriggerVolume(self, 'tv_shadow3')
		RegisterTriggerVolume(self, 'tv_shadow4')
		
		SetLightBrightness(FindLight(nil, 'spotLight1'), 0.25, 0)
		SetLightBrightness(FindLight(nil, 'spotLight2'), 0.25, 0)
		SetLightBrightness(FindLight(nil, 'spotLight3'), 0.25, 0)
		SetLightBrightness(FindLight(nil, 'spotLight4'), 0.25, 0)
		
		--Let player see the phantom once each time they visit the level, unless player is revsiting.
		if (Global:loadGlobal('bTHCompleted') ~= 1) then
			Global:save('bShadow1Seen', 0)
			Global:save('bShadow2Seen', 0)
			Global:save('bShadow3Seen', 0)
			Global:save('bShadow4Seen', 0)
			
			--also kill the Exitdoor if not revisiting
			FindScriptObject('Exitdoor'):killSelf()
		end
		
		--Register for NewGroundCollide events so that we can spawn dust effects.
		Global.player:addSpamListener('NewGroundCollide', self)
		Global.player:addSpamListener('RazRespawn', self)
		
		Global.goalManager:deactivate('RideBalloon')
		Global.goalManager:activate('Phantom')
	end


 	function Ob:listenerRazRespawn(value, from)
		--Let player see the phantom, unless player is revsiting.
		local sandbags = self:getPool('TH.Props.Sandbag')
		sandbags:applyToAll(function(ent) ent:explode() end, sandbags.APPLY_TO_UNPOOLED_ONLY)
		
		if (Global:load('bTHCompleted') ~= 1) then
			Global:save('bShadow1Seen', 0)
			Global:save('bShadow2Seen', 0)
			Global:save('bShadow3Seen', 0)
			Global:save('bShadow4Seen', 0)
		end
	end
	
--*******************************************************************************

	function Ob:onEndLevel()
		Global.player:removeSpamListener('NewGroundCollide', self)
		%Ob.Parent.onEndLevel(self)
	end
	
--*******************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if (data == 'tv_shadow1' and from == Global.player and Global:load('bShadow1Seen') ~= 1) then
			if (Global:loadGlobal('bTHCompleted') ~= 1) then
				self:createTimer(1000, self.TIMER_SHADOW1DELAY)
			end
			Global.camControl:pushAndSetChase(self, 500, 0)
			MoveCameraToIdeal()
			SetChaseCameraAzimuth(-37)
		elseif (data == 'tv_shadow2' and from == Global.player and Global:load('bShadow2Seen') ~= 1) then
			Global:save('bShadow2Seen', 1)
			if (Global:loadGlobal('bTHCompleted') ~= 1) then
				SetAnimatedTexturePlayMode('Textures/LevelTextures/TH_GloriasBrain/THCW_Catwalks/PhantomShadow/PhantomLurk01.dds', kANIMTEXMODE_LOOPONCE)
			end
			self:createTimer(1000, self.TIMER_SHADOW2YAWHINT)
		elseif (data == 'tv_shadow3' and from == Global.player and Global:load('bShadow3Seen') ~= 1) then
			Global:save('bShadow3Seen', 1)
			if (Global:loadGlobal('bTHCompleted') ~= 1) then
				SetAnimatedTexturePlayMode('Textures/LevelTextures/TH_GloriasBrain/THCW_Catwalks/PhantomShadow/PhantomSpot01.dds', kANIMTEXMODE_LOOPONCE)
			end
		elseif (data == 'tv_shadow4' and from == Global.player and Global:load('bShadow4Seen') ~= 1) then
			Global:save('bShadow4Seen', 1)
			if (Global:loadGlobal('bTHCompleted') ~= 1) then
				SetAnimatedTexturePlayMode('Textures/LevelTextures/TH_GloriasBrain/THCW_Catwalks/PhantomShadow/PhantomLurk01.dds', kANIMTEXMODE_LOOPONCE)
			end
			self:createTimer(1000, self.TIMER_SHADOW4YAWHINT)
		end
	end

--*******************************************************************************
	
	function Ob:onExitedTriggerVolume(data,from)
		if (data == 'tv_shadow1' and from == Global.player) then
			Global.camControl:removeCam(self)
		end
	end

--*******************************************************************************

	function Ob:onCrossedTriggerPlane(data,from)
		if (from == Global.player and data == 'tv_LoadTHFB') then
			self:loadNewLevel('THFB', nil, 1)
		elseif (from == Global.player and data == 'tv_PhantomIntro' and Global:load('PhantomIntroSeen') ~= 1 and Global:load('bTHCWPhantomFled') ~= 1) then
			Global:save('PhantomIntroSeen', 1)
			Global.cutsceneScript:runCutscene('PhantomIntro')
		end
	end

--*******************************************************************************

	function Ob:onTimer(data,from)
		%Ob.Parent.onTimer(self, data, from)
		self:killTimer(data)
		if (data == self.TIMER_SHADOW1DELAY) then
			Global:save('bShadow1Seen', 1)
			SetAnimatedTexturePlayMode('Textures/LevelTextures/TH_GloriasBrain/THCW_Catwalks/PhantomShadow/PhantomSpot01.dds', kANIMTEXMODE_LOOPONCE)
		elseif (data == self.TIMER_SHADOW2YAWHINT) then
			SetChaseCameraHintAzimuth(-85)
		elseif (data == self.TIMER_SHADOW4YAWHINT) then
			SetChaseCameraHintAzimuth(-3)
		end
	end

--*******************************************************************************

	function Ob:listenerNewGroundCollide(data,from)
		--If colliding with catwalk, kick up some dust.
		if( GetGroundMaterial(Global.player) == self.catwalkGroundMaterial ) then
			self.footPoofFXPool:get():attach(Global.player,nil,1,1) --Run on Raz then pool.
		end	
	end

--*******************************************************************************

	function Ob:getHintResponse()
		if( self:foundPhantom() ) then
			return { { voice = "/GLAP012FO/" } } --<<Let's turn a light on this guy so we can see who he is.
		end
		
		return { { voice = "/GLAP011FO/" } } --<<Those spotlights couldn't find you if you were invisible.	
	end

	function Ob:foundPhantom()
		return 1 == Global:load('bPhantomIntroPlayed')
	end
	
	return Ob
end

