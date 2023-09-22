function THFBCutscenes(Ob)
	local Ob = CreateObject('Global.Camera.CutsceneScript')

--**************************************************************************************************

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.jasper = FindScriptObject('Jasper')
		self.crashedLine = 0
	end

--**************************************************************************************************

	function Ob:stateSetupCSJasperBossIntro()
		self:fadeToBlack(0)
		self.jasper:startFight()
		self:setState('JasperBossIntro')
	end
			
	function Ob:stateJasperBossIntro()
		
		self:playVideo('cutscenes/prerendered/thbi.bik')
		SoundUnmuteCategory(kSOUNDCAT_ALL)
		self:cutTo(-1658,4670,-719, -58,-148,0)
		self:camPathTo(1100,4602,-877, -57,158,0, nil, 8,0,2, 0)
		self:fadeIn(1)
		PlaySound(nil, LoadSound('Applause'))
		self:sleep(8)
		self:fadeToBlack(0.5, 1)
		self:cutTo(1472,382,1422, 1,62,0)
		self:camPathTo(2169.0,132.5,1719.7, -2.1,67.5,0.0, nil, 6,0,2,0)
		self:fadeIn(0.5)
		
		self:sleep(6)
		self:fadeToBlack(0.5, 1)
		
		self:setState('CleanupCSJasperBossIntro')
	end
	
	
	function Ob:stateCleanupCSJasperBossIntro()
		SoundUnmuteCategory(kSOUNDCAT_ALL)
		JournalAddMovie('cutscenes/prerendered/thbi.bik')
		self:endCutscene(1)	
		self:fadeIn(0.5)
		self.jasper.ink:startInkSlow()
	end

--**************************************************************************************************
	
	function Ob:stateJasperDeath()
		Global.player:makeInvisible()
		Global.levelScript:stopLevelTheme()
		PlaySound(nil, LoadSound('JasperCrash'))
		PlaySound(nil, LoadSound('LaughTrack'))
		
		Global.levelScript:killHarpies()
		Global.levelScript:killThistles()
		Global.levelScript:killHounds()
		self.jasper:setAnim(self.jasper.animsTable.InjuredDamage)
		self:oneShot(self.jasper, 900, 100, 200, 10, 5)
		self.jasper:sayLine("/THBR025JA/", 1, 1) --Ahhhh! Oohhhh! (cough)
		self.jasper:sayLine("/THBR026JA/", 1, 1) --What's the matter? Can't you take a little criticism?
		local a,b,c,d,e,f = self:oneShot(self.jasper, 2200, 2000, 200, 10, 5, nil, 1)
		self:camPathTo(a,b,c,d,e,f, nil, 10, 2,2, 0)
		self.jasper:sayLine("/THBR027JA/", 0, 1) --Ooohhh ooohohohohhhh...
		self:sleep(8)
		self:fadeToBlack(2,1)
	
		self:playVideo('cutscenes/prerendered/thbf.bik')
		self:setState('CleanupCSJasperDeath')
	end
	
	function Ob:stateCleanupCSJasperDeath()
		JournalAddMovie('cutscenes/prerendered/thbf.bik')
		self:fadeToBlack(0)
		self:endCutscene(1)	
		Global.goalManager:deactivate('Gloria')
		Global:setLevelToCompleted('TH')
		Global.player:makeVisible()
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('ASGR', nil, 1)
	end
	
--**************************************************************************************************
	
	function Ob:stateSetupCSDestroyArcLamp()
		self.bDestroyedLamp = 0
		self.jasper.hover.target = self.jasper.arcLamp
		self.jasper.ink.target = self.jasper.arcLamp
		self:setState('DestroyArcLamp')
	end
			
	function Ob:stateDestroyArcLamp()
		Global.cutsceneScript:cutTo(-1900,5408,-1734, -49,-135,0)
		if (Global:load('bDestroyArcLampPlayed') == 1) then
			self.jasper:sayLine("/THBR023JA/", 0, 1) --Another spotlight! I thought I got 'em all!
		else
			self.jasper:sayLine("/THBR020JA/", 0, 1) --You'll pay for that one, SPOTLIGHT!
		end
		self:sleep(3)
		
		self.jasper.ink:startInkMode(self.jasper.ink.INKMODE_SPRAY, 1)
		self:sleep(1)
		self.jasper.arcLamp:destroy()
		self.bDestroyedLamp = 1
		if (Global:load('bDestroyArcLampPlayed') == 1) then
			self.jasper:sayLine("/THBR024JA/",1,1) --I'll give you what I gave your brother over there. Huh? How do you like that!?
		else
			self.jasper:sayLine("/THBR021JA/",1,1) --Take that, wretched regugitator of the sun!
		end
		self:sleep(1)
		self:setState('CleanupCSDestroyArcLamp')
	end
	
	function Ob:stateCleanupCSDestroyArcLamp()
		self.jasper.hover.target = Global.player
		self.jasper.ink.target = Global.player
		if (self.bDestroyedLamp ~= 1) then
			self.jasper.arcLamp:destroy()
		end
		--self:sleep(1)
		self:endCutscene()
	end
	
--**************************************************************************************************

	function Ob:stateJasperBlinded()
		self:cutTo(2143,4582,-1727, -30,143,0)	
				
		self.jasper:sayLine(self.jasper.blindedCRH:sayNextLine(1), 0, 1)
		while (self.jasper.bCrashAnimPlayed ~= 1) do Yield() end				
		
		if (self.jasper.arcLamp.Name == 'ArcLamp1') then
			self:cutTo(-767,1009,-1170, -23,-160,0,104)
			Yield()
			Global.player:setPosition(-452.4,2936,-347.1,  0,44.5,0)
		elseif (self.jasper.arcLamp.Name == 'ArcLamp2') then
			self:cutTo(15,1033,-497, -26,129,0)
		elseif (self.jasper.arcLamp.Name == 'ArcLamp3') then
			self:cutTo(-1515,813,834, -13,-76,0,104)
		end
		
		self:sleep(1)
		if (self.crashedLine == 0) then
			self.jasper:sayLine("/THBW000JA/",0,1)  --I'll give you all good write-ups in the review if you KILL THAT KID WITH THE GOGGLES!
		elseif (self.crashedLine == 1) then
			self.jasper:sayLine("/THBW001JA/",0,1)  --Kill him! Get him!
		elseif (self.crashedLine == 2) then
			self.jasper:sayLine("/THBW002JA/",0,1) -- Kill him before he gets over here.
		end
		self.crashedLine = mod(self.crashedLine + 1, 3)
		
		self:sleep(2)
		
		self:setState('CleanupCSJasperBlinded')
	end				
	
	function Ob:stateCleanupCSJasperBlinded()
		self.jasper:setAnim(self.jasper.animsTable.Idle1)
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .1, 1)
		self.jasper:createTimerSecs(self.jasper.getUpTime, self.jasper.TIMER_GETUP)
		self:endCutscene()
	end
				
--**************************************************************************************************
																				  
	return Ob
end

