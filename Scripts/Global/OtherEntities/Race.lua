
function Race(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		Ob.TIMER_RACE = 1001
		Ob.SPRITE_TIMER = 1002
		Ob.startTP = '' -- Editable
		Ob.endTP = '' -- Editable
		Ob.restartLoc = '' -- Editable

		Ob.assistanceSpeed = 3000 -- Below this speed we will assist the player's acceleration
		Ob.normalAcceleration = 3300 -- The default acceleration
		Ob.assistedAcceleration = 9900 -- Acceleration when fully assisted
		
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = { 
				'Global.OtherEntities.UIElement',
			},
		}
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		RegisterTriggerVolume(self, self.startTP)
		if not self.endTP or self.endTP == '' then self.endTP = self.startTP 
       	else
			RegisterTriggerVolume(self, self.endTP) 
		end
		self.readySprite = SpawnScript('Global.OtherEntities.Sprite','readySprite','',1)
		self.readySprite.path='Textures/LevelTextures/MI_MillaBrain/race_start_ready_border.tga'
		self.readySprite.width = 607
		self.readySprite.height = 380
		self.readySprite.x = 100
		self.readySprite.y = 100
		--self.readySprite:adjust(200,200,0)
		self.readySprite:enable(1)
		self.readySprite:disable()
		self.readySound=LoadSound('Race_Ready')

		self.setSprite = SpawnScript('Global.OtherEntities.Sprite','setSprite','',1)
		self.setSprite.path='Textures/LevelTextures/MI_MillaBrain/race_start_set_border.tga'
		self.setSprite.width = 607
		self.setSprite.height = 380
		self.setSprite.x = 100
		self.setSprite.y = 100
		self.setSprite:enable(1)
		self.setSprite:disable()
		self.setSound=LoadSound('Race_Set')

		self.goSprite = SpawnScript('Global.OtherEntities.Sprite','goSprite','',1)
		self.goSprite.path='Textures/LevelTextures/MI_MillaBrain/race_start_go_border.tga'
		self.goSprite.width = 607
		self.goSprite.height = 380
		self.goSprite.x = 100
		self.goSprite.y = 100
		self.goSprite:enable(1)
		self.goSprite:disable()
		self.goSound=LoadSound('Race_Go')
		
		self.restartLoc = FindScriptObject(self.restartLoc)
	end
	
	function Ob:quitRace()
		self.bRaceOver = 1
		self:updateTimer()
		self:killTimer(self.TIMER_RACE)
		self:setState(nil)
	end
	
	function Ob:startSpriteScale(s,t,z)
		self.spriteScaling = 1
		self.spriteScaleCurrent = 1.0
		self.spriteScaleFactor = -t
		self.spriteScaleZoom = z
		self.spriteRotate = 0.00
		self.spriteRotateFactor = 360*t
		s:enable(1)
		s:adjust2(nil,nil,1,1,1)
		self.spriteScale = s
		self:createTimer(50,self.SPRITE_TIMER)
	end
	
	function Ob:forceBeginRace()
		Global.player:setVelocity(0,0,0)
		--Global.player:setPosition(-122685,218740,-113803)
		Global.player:setPosition(-122685,218490,-113803)
		Global.player:setOrientation(0,6,0)
		self:beginRace()
	end

	function Ob:beginRace()
		if not Global.levelScript.currentlyRacing then
			if not self.raceBeginning then
				self.raceBeginning = 1
				self:setState('BeginRace')
			end	
		end	
	end

	function Ob:stateBeginRace()
		Global.levelScript.currentlyRacing = 1
		
		Global.player:setVelocity(0,0,0)
		
--		local ball = GetPhysicsState(Global.player,PHYSICSSTATE_RIDINGBALL)
--		if ball == 1 then
--			Global.player:setPosition(-122685,218490,-113803)
--		else
			Global.player:setPosition(-122685,218490+200,-113803)
--		end	
		Global.player:setOrientation(0,6,0)

		--Reset all the censors
		Global.levelScript:resetCensors()

		--Run the starting cutscene (this replaces all the garbage below
		--runCutscene(sName, [bBlocking], [bSetChaseCameraPaused], [bInterruptible], [bKeepHandler], [bKeepActions], [bKeepCamera])
		Global.levelScript.cutsceneScript:runCutscene('StartRace', 1, nil, 0)
		JournalAddGameMenuItem('/MIZE014TO/','ResetRace')
		
		self.bTimeRace = (Global:loadGlobal('bMICompleted') == 1) or 0

		self.bRazLost = 0

		--Only time the race if we are revisiting.		
		self:setState('Race')
		return
	end
	
	function Ob:setState(nameOrFunc)
		%Ob.Parent.setState(self, nameOrFunc)
	end

	function Ob:beginStateRace()
		Global.levelScript.tracker:start()
		self:initTimer()
	end
	
	--Displays race time in the top of the screen
	function Ob:stateRace()
		self.bRaceOver = 0
		--Update the timer
		self:updateTimer()
	
		--Apply help boost if necessary
		self:applyHelpBoost()

		--edit, speed up the game if easymillarace is True, but not on revisit for figments
		local settings = FindScriptObject('RandoSeed')
		if settings.easymillarace == TRUE and (Global:loadGlobal('bMICompleted') ~= 1) then
			DebugSetGameSpeed(1.5)
		end		
	end

	function Ob:endStateRace()
		Global.levelScript.tracker:stop()
		self:stopTimer()
		--edit reset game speed, in case it was sped up from QOL
		DebugSetGameSpeed(1)

	end

	function Ob:applyHelpBoost()
		--Calculate current speed
		local speed = GetDistance(0, 0, 0, GetVelocity(Global.player))
		
		--If above speed threshold, then set the normal acceleration
		if (speed >= self.assistanceSpeed) then
			SetPhysicsConstant(Global.player, PHYSICS_BubbleAccel, self.normalAcceleration)
			return
		end
		
		--Using this is linear
		local scale = (1 - (speed / self.assistanceSpeed))
		--Apply logarithmic dropoff
		scale = log10(scale * 9 + 1)
		
		--Give the player the appropriate amount of acceleration
		local acceleration = ((self.assistedAcceleration - self.normalAcceleration) * scale)
			+ self.normalAcceleration
		SetPhysicsConstant(Global.player, PHYSICS_BubbleAccel, acceleration)
	end
	
	function Ob:initTimer()
		if (self.bTimeRace == 1) then
			--Set up race timing variables
			self.startTime = GetGameTimeSecs()
			self.textHandle = nil
			self.raceTime = nil

			self.bestTime = Global:load('BestRaceTime')
		end
	end	
	
	function Ob:updateTimer()
		if (self.bTimeRace == 1) then
			-- display best time display only at the very end
			-- this function will be called one last time at the end, so don't update the time then
            local time
            
			if (self.bRaceOver ~= 1) then
				-- determine display string
				time = GetGameTimeSecs() - self.startTime
				self.timeString = '//'..self:formatTime(time)
			elseif (self.bRaceOver == 1 and self.bestTime) then 
				self.timeString = "/MIZE010TO/ "..self:formatTime(self.bestTime)..'\n'..self.timeString
			end
			
			-- create display handle
			if (not self.timeDisplay) then
				self.timeDisplay = SpawnScript('Global.OtherEntities.UIElement', 'TimeDisplay')
				self.timeDisplay:createText(self.timeString, 140, 70,.8,.8, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
			else
				self.timeDisplay:adjustText(nil,nil,nil,nil,nil,nil,nil,nil,nil,nil, self.timeString)
			end
		end		
	end

	function Ob:stopTimer()
		if (self.bTimeRace == 1) then
			self.endTime = GetGameTimeSecs()
			self.raceTime = self.endTime - self.startTime
		end
	end

	function Ob:formatTime(time)
		local minutes = self:padZeros(floor(time / 60))
		local seconds = self:padZeros(floor(mod(time, 60)))
		local hundreths = self:padZeros(floor(mod(time, 1) * 100))
		local timeText = minutes..':'..seconds..':'..hundreths
		return timeText
	end
	
	function Ob:padZeros(time)
		return ((time < 10) and ('0'..time)) or time
	end

	function Ob:stateJournalRestartRace()
		JournalRemoveGameMenuItem()
		local sc=FindScriptObject('ScreenControl')
		sc.cycle = 0
		self:killTimer(self.TIMER_RACE)

		Global.levelScript.forceStart = 1
		sc.cycle = 1
		Global.levelScript.currentlyRacing = nil
		ExitJournal()

		Global.cutsceneScript:fadeToBlack(0, 0)
		Global.levelScript:setState('ResetRace')
		self:setState(nil)
	end
	
	

	function Ob:pauseRace()
		self:killTimer(self.TIMER_RACE)
	end

	function Ob:resumeRace()
		self:createTimer(1000, self.TIMER_RACE)
	end

	function Ob:onTimer(id)
		id = tonumber(id)
		if id == self.TIMER_RACE then
			--RemoveText(self.curtext)
			--self.goSprite:disable()
			Global.levelScript.tracker:startTrackingPositions()
			self:killTimer(self.TIMER_RACE)
		elseif id == self.SPRITE_TIMER then
			self.spriteScaleCurrent = self.spriteScaleCurrent + self.spriteScaleFactor
			self.spriteScaleFactor = self.spriteScaleFactor* self.spriteScaleZoom
			--self.spriteRotate = self.spriteRotate + self.spriteRotateFactor
			self.spriteRotate = 0
			if self.spriteScaleCurrent<=0 then 
				self.spriteScaleCurrent= 0
				self.spriteRotate = 0
			end	
			self.spriteScale:adjust2(nil,nil,1,self.spriteScaleCurrent,self.spriteScaleCurrent,self.spriteRotate)
			if self.spriteScaleCurrent <=0 then
				self.spriteScale:disable()
				self:killTimer(self.SPRITE_TIMER)
				self.spriteScaling = nil
			end	
		end
	end
	
	function Ob:win()
		self.bRaceOver = 1
		self:quitRace()
		Global.levelScript:setState('WinRace')
		self:setState(nil)
	end

	function Ob:lose()
		self.bRaceOver = 1
		self:updateTimer()
		self:killTimer(self.TIMER_RACE)
		Global.levelScript.tracker:reset()
		Global.levelScript:setState('LoseRace')
		self:setState(nil)
	end

	function Ob:onCrossedTriggerPlane(tpName, from, direction)
		if 1 then
--			return
		end
		
		if (not Global.levelScript.razWon) and (not Global.levelScript.razLost) then
			if tpName == self.startTP and direction == 0 then
				self:beginRace()
			elseif tpName == self.endTP then
				--Raz has already crossed the finish line, so no point in processing more of these events
				if (self.bRaceOver == 1) then
					return
				end

				--Win conditions are different for revisiting
				if (Global:loadGlobal('bMICompleted') ~= 1) then
					if from == Global.player then
						if (self.bRazLost == 1) then
							self:lose()
						else
							self:win()
						end
					else
						self.bRazLost = 1
					end	
				else
					self:setState(nil) --Forces race time to be calculated

					--Must beat best time to win
					if (self.bestTime and (self.bestTime < self.raceTime)) then
						self:lose()
					else
						GamePrint('Saving Race Time: '..self.raceTime)
						Global:save('BestRaceTime', self.raceTime)
						self:win()
					end
				end
			end
		end	
	end
	
	function Ob:onEnteredTriggerVolume(tpName, from)
		self:onCrossedTriggerPlane(tpName, from, 1)
	end

	return Ob
end


