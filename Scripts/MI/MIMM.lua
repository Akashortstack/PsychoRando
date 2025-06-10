function MIMM(Ob)
	if not Ob then
		Ob = CreateObject('LevelScript')
		--Ob.theme = 'intentloop'
		Ob.VELOCITY_TIMER = 50
		Ob.speedFactor = 1
		Ob.BOOST_TIMER = 51
		Ob.BOOSTINTRO_TIMER = 52
		Ob.ledgeDirtEmitterName = ''
		Ob.confettiFX = nil	-- reference to our fabulous confetti FX
		Ob.defaultAmbientSoundName = 'MIAmb'		
		Ob.dependencies = {
			textures = {
				'textures/fxtextures/lensflares/lensflare3.tga',
				'textures/fxtextures/lo_laserblam.tga',
				'textures/bubblemask.tga',
				'textures/fxtextures/MI_Blam.tga',
				'textures/hud/quick_levitationtrainerbig.dds',
			},
			animations = {
				'Anims/Bobby/Props/BalanceBall_bubble.jan',
				'Anims/Bobby/Props/RunBall_bubble.jan',
				'Anims/Campkids/Props/psiblast_bubble.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/Idle_BowAndWave.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/MI_PlatformPetalCage/Close.jan',
				'Anims/MI_PlatformPetalCage/Open_half.jan',
				'Anims/MI_Turnstyle/MI_TurnstyleSpin.jan',
				'Anims/Milla/Milla_danceLoop01.jan',
				'Anims/Milla/Milla_danceLoop02.jan',
				'Anims/Milla/Milla_danceLoop03.jan',
				'Anims/Milla/Milla_danceLoop04.jan',
				'Anims/Milla/Milla_danceLoop05.jan',
				'Anims/Milla/Milla_danceLoop06.jan',
				'Anims/Milla/Milla_danceLoop07.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/Dance03.jan',
			}
		}
	end

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		if (self:isLevelCompleted() ~= 1) then
			--edit removed
			--EnablePower(kPOWER_LEVITATION, 1)
			--Global:saveGlobal('bHasLevitationLearnersPermit', 1)
			Global:setLevelToCompleted('SA')
		end
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)

		--Flag to determine whether or not we ar racing alone
		self.bRaceAlone = Global:loadGlobal('bMICompleted')
		
		self.race = FindScriptObject('Race')
		
		--jack up the max view distance
		Global.player:setLookTargetSearchDist(1000)
		self.oldRange = Global.player.PsiBlastRange
		Global.player.PsiBlastRange = 1000

		-- Disable Raz's trace-to-valid-floor, because MIMM is all about the big air
		MM_DisableOOWKludge(1)
		
		-- Disable the ball pop for MIMM
		MI_DisableFallOffBall(1)
		
		-- Set up the skybox
		SetSkyBox('Levels/SkyBox/MIMM_Skybox.plb')
		
		-- Clear override for the camera's altitude when Raz is on the psi-ball
		SetChaseCameraPhysicsAltitude(PHYSICSSTATE_MOUNTINGBALL, 0)
		SetChaseCameraPhysicsAltitude(PHYSICSSTATE_RIDINGBALL, 0)
		
		-- Create confettiFX to be played if you win
		self.confettiFX = SpawnScript('BV.Effects.ConfettiFX', 'ConfettiFX')
		self.confettiFX:setPosition(-2228, 113542,205522)
        
		-- Set the shadow culling bias, which is needed for floors made up of very large, non-axis-aligned polys
		SetShadowCullingBias(-1000)
		
		self.defaultFOV=GetCameraFieldOfView()
		self.currentFOV = self.defaultFOV
		self.sr = SpawnScript('Global.OtherEntities.SplineRecorder', 'SplineRecorder', '', 0)
		self.tracker = SpawnScript('Global.OtherEntities.RacePositionTracker', 'RaceTracker', '', 0)
		self.razSpriteName = 'Textures/LevelTextures/MI_MillaBrain/MIMM_RaceBar_Raz.tga'
		self.tracker:registerTrackee(Global.player,self.razSprite)
		
		--Got to the race, which completes te TopFloor goal
		Global.goalManager:activate('WinRace')

		self.racers = {}
		self.numRacers = 0
		
		if (self.bRaceAlone ~= 1) then
			self.bobby = SpawnScript('MI.Characters.BobbySplineRacer', 'Bobby', '', 1)

			if self.bobby then
				self.tracker:registerTrackee(self.bobby)
				self.numRacers = self.numRacers+1
				self.racers[self.numRacers] = self.bobby
				self.bobby.totalSeconds=self.bobby.totalSeconds*self.speedFactor
			end	
			
			self.clem = SpawnScript('MI.Characters.ClemSplineRacer', 'Clem', '', 1)
			if self.clem then
				self.tracker:registerTrackee(self.clem)
				self.numRacers = self.numRacers+1
				self.racers[self.numRacers] = self.clem
				self.clem.totalSeconds=self.clem.totalSeconds*self.speedFactor
			end	
	
			self.crystal = SpawnScript('MI.Characters.CrystalSplineRacer', 'Crystal', '', 1)
			if self.crystal then
				self.tracker:registerTrackee(self.crystal)
				self.numRacers = self.numRacers+1
				self.racers[self.numRacers] = self.crystal
				self.crystal.totalSeconds=self.crystal.totalSeconds*self.speedFactor
			end	
		end

		
		--Gather all LSOs that need to be reset when the race is reset
		self.resetList = {}
		self.resetCount = 0
		local t = FindScriptObject('Turnstile1')
		if t then
			self.resetCount=self.resetCount+1
			self.resetList[self.resetCount] = t
		end
		
		local t = FindScriptObject('Turnstile2')
		if t then
			self.resetCount=self.resetCount+1
			self.resetList[self.resetCount] = t
		end

		local t = FindScriptObject('Turnstile3')
		if t then
			self.resetCount=self.resetCount+1
			self.resetList[self.resetCount] = t
		end
		
		-- Enable the dancing idles
		AddExtraRazIdle('dance01', 1)
		
		RegisterTriggerVolume(self,'tv_RaceEnd')

		-- you move at too high a speed for standard GIO behavior
		self.oldFreeze, self.oldThaw = GetFreezeThawDists()
		SetFreezeThawDists(12000, 12000)

		self.boostFX = self:getPool('MI.Effects.Boost'):get()
		
		self:setState('StartMusic')

	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
    	PreloadAnimData('anims/bobby/runball.jan')
    	PreloadAnimData('anims/bobby/props/runball_bubble.jan')
    	PreloadAnimData('anims/campkids/ballride1.jan')
		--edit, hide Bobby and his levitation ball if QOL True
		local settings = FindScriptObject('RandoSeed')
		if settings.easymillarace == TRUE then
			self.bobby:hide()
			self.bobby.ball:hide()
		end
		
	end

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Dummy = {num = 25, censorCode = 'CensorDummy', scriptName = nil}	}
	end

	function Ob:stateResetRacePrelim()
		local r = FindScriptObject('Race')
		self:setState(nil)
		r:setState('JournalRestartRace')
	end
	
	function Ob:stateWinRace()
		JournalRemoveGameMenuItem()
		Global.cutsceneScript:runCutscene('WinRace', 1)

--[[
		self.tracker:reset(1)
		self.tracker:throbSprite(self.razSprite)
		if self.numRacers>0 then
			for i=1,self.numRacers do
				DetachFromSpline(self.racers[i])
				self.racers[i]:setVelocity(0,0,0)
			end	
		end	
]]--		

		--Global.levelScript.cutsceneScript:runCutscene('WinRace')
		
		Global.levelScript:loadNewLevel('MILL')
		self:setState(nil)
	end
	
	function Ob:stateLoseRace()
		JournalRemoveGameMenuItem()
		Global.cutsceneScript:runCutscene('LoseRace', 1)

		Global.player:setPosition(self.race.restartLoc:getPosition())
		Global.player:setOrientation(self.race.restartLoc:getOrientation())
		MoveCameraToIdeal()
		self.forceStart = 1
		local sc=FindScriptObject('ScreenControl')
		sc.cycle = 1
		self.currentlyRacing = nil
		self:setState('ResetRace')
	end

	function Ob:stateStartMusic()
		self.rLevelTheme = LoadSound('intentloop')
		self.rLevelMusicInstance = PlaySound(nil,self.rLevelTheme,1,0)
		if self.rLevelMusicInstance and self.rLevelTheme then
			SoundSetParameterControl(self.rLevelTheme, self.rLevelMusicInstance, 'LowPassRolloff', 0)
		end	
		self:setState(nil)
	end


	function Ob:stateResetRace()
		self.boostFX:stop()

		self.razWon = nil
		self.razLost = nil
		self.tracker:reset()
		local yoff=200
		if not self.px then
			self.px,self.py,self.pz = Global.player:getPosition()
			self.pox,self.poy,self.poz = Global.player:getOrientation()
			yoff = 0
		else
			local r = FindScriptObject('Race')
			if r then
				r:quitRace()
			end			
		end	
		if self.numRacers>0 then
			for i=1, self.numRacers do
				self.racers[i]:reset()
			end
		end	
		if self.resetCount>0 then
			for i = 1,self.resetCount do
				self.resetList[i]:setState('Reset')
			end
		end
		self:setState('RazAtStart')
	end
	
	function Ob:stateRazAtStart()
		local yoff=300
		self:sleep(.1)
		Global.player:setVelocity(0,0,0)
		Global.player:setPosition(self.px-150,self.py+yoff,self.pz-150)
		Global.player:setOrientation(self.pox,self.poy,self.poz)
		Global.player:makeVisible()
		MoveCameraToIdeal()
		PausePlayerControls(0)

		if (self.bRaceAlone ~= 1) then
			self:initRacerPositions()
		end

		local r = FindScriptObject('Race')
		if self.forceStart then
			r:forceBeginRace()
			self.forceStart = nil
		end	
		self:setState(nil)
	end	
		
	--Initialize racer positions
	function Ob:initRacerPositions()
		if not self.clemX then
			self.clemX,self.clemY,self.clemZ=FindScriptObject('Clem'):getPosition()
			self.clemoX,self.clemoY,self.clemoZ=FindScriptObject('Clem'):getOrientation()
		end
		self.clem:setPosition(self.clemX,self.clemY,self.clemZ)
		self.clem:setOrientation(self.clemoX,self.clemoY,self.clemoZ)

		if not self.crystalX then
			self.crystalX,self.crystalY,self.crystalZ=FindScriptObject('Crystal'):getPosition()
			self.crystaloX,self.crystaloY,self.crystaloZ=FindScriptObject('Crystal'):getOrientation()
		end
		self.crystal:setPosition(self.crystalX,self.crystalY,self.crystalZ)
		self.crystal:setOrientation(self.crystaloX,self.crystaloY,self.crystaloZ)

		if not self.bobbyX then
			self.bobbyX,self.bobbyY,self.bobbyZ=FindScriptObject('Bobby'):getPosition()
			self.bobbyoX,self.bobbyoY,self.bobbyoZ=FindScriptObject('Bobby'):getOrientation()
		end
		self.bobby:setPosition(self.bobbyX,self.bobbyY,self.bobbyZ)
		self.bobby:setOrientation(self.bobbyoX,self.bobbyoY,self.bobbyoZ)
	end

	--Reset all censors to initial positions	
	function Ob:resetCensors()
		--Kill any censors left over
		foreach_entity_oftype('MI.Characters.CensorDummy', function(censor) if (censor.bPooled ~= 1) then censor:killSelf() end end)

		--Tell scriptSpawner to spawn again
		local scriptSpawner = FindScriptObject('ScriptSpawner1')
		scriptSpawner.bCanSpawn = 1
	end
	
	function Ob:onCustomMenuSelection(data,from)
		if data == 'ResetRace' then
			--PausePlayerControls(1)
			Global.levelScript.razLost = 1
			Global.levelScript.tracker:reset()
			self:setState('ResetRacePrelim')
			--Global.levelScript.tracker:reset()
		end
	end
	
	function Ob:stateFOV(data,from)
		local x,y,z = GetTotalVelocity(Global.player)
		x=max(abs(x),abs(y))
		x=max(abs(x),abs(z))
		local newfov = self.defaultFOV
		if x>1000 then
			newfov = self.defaultFOV+((1*((x-1000)/200)))
		end
		if newfov~=self.currentFOV then	
			--SetCameraFieldOfView(newfov,.1)	
		end
		self.currentFOV=newfov
	end	

	--function Ob:onCrossedTriggerPlane(data,from)
	--	if (from == Global.player) and data == 'tv_RaceEnd' then
	--		self:setState('WinRace')
	--	end
	--end
	
	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		SetFreezeThawDists(self.oldFreeze, self.oldThaw)
		Global.player.PsiBlastRange = self.oldRange
		JournalRemoveGameMenuItem()
	end
	
	function Ob:onTimer(id,from)
		%Ob.Parent.onTimer(self,id,from)
		id = tonumber(id)
		if id == self.BOOST_TIMER then
			self:killBoost()
		elseif id == self.BOOSTINTRO_TIMER then
			self:killBlast()
		else
			if (id) then
				id = tostring(id)
			end
			%Ob.Parent.onTimer(self, id)
		end
	end

	-- BOOST ***********************************************************************************************
	
	function Ob:boostPlayer()
		self.boostFX:attach(Global.player, nil, 1)
		self:createTimer(100,self.BOOSTINTRO_TIMER)
		self:createTimer(3000,self.BOOST_TIMER)

		--Listen for control handler changed messages so we can kill the boost sparkles if raz quits the ball
		Global.player:addSpamListener('ControlHandlerChanged', self)

		self.bPlayerBoosted = 1
	end

	function Ob:killBlast()
		self:killTimer(self.BOOSTINTRO_TIMER)
	end
	
	function Ob:killBoost()
		self:killBlast()	--just in case

		self:killTimer(self.BOOST_TIMER)
		self.boostFX:stop()

		--Listen for control handler changed messages so we can kill the boost sparkles if raz quits the ball
		Global.player:removeSpamListener('ControlHandlerChanged', self)

		self.bPlayerBoosted = 0
	end

	function Ob:listenerControlHandlerChanged(type)
		if (self.bPlayerBoosted == 1) and (type ~= kCONTROL_BALL) then
			self:killBoost()
		end
	end

	-- *****************************************************************************************************

	function Ob:getHintResponse()
	
		--Default to this
		return {
			{
				voice = "/GLAL003FO/",--DIALOG=<<Don\'t forget you can still PSI Blast when your on the ball. >>
			},
			{
				voice = "/GLAL004FO/",--DIALOG=<<Ranged weapons are always useful in a race.>>
			}
		}
	end
	
	return Ob
end

