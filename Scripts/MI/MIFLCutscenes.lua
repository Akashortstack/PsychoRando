function MIFLCutscenes(Ob)
	if not Ob then
		Ob = CreateObject('Global.Camera.CutsceneScript')
		Ob.dependencies = {
			textures = {
				'textures/icons/inventoryitems/learnerspermit_levitation.tga', },
		}
	end
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.milla = FindScriptObject('MI_milla')
		self.quentin = FindScriptObject('Quentin')
	end

	function Ob:stateIntro()
		Global.player:loadAnim('anims/dartnew/default_pose_lf.jan',0,0)
  
-- commenting out the milla blend anims as they dont seem to exist anymore!! omg

--		LoadBlendAnim(self.milla,'Anims/Milla/MITU/MITU001MI.pba', 0)
		self.milla:sayLine("/MITU001MI/", 1, 1) -- DIALOG=<<Look who made the scene!>>
		Global.player:sayLine("/MITU301RA/", 1, 1) -- DIALOG=<<Agent Vodello? Where are you?>>
		
		self:cutTo(-18690,6678,38619,8,44,0)	-- cut to milla on TV
--		LoadBlendAnim(self.milla,'Anims/Milla/MITU/MITU003MI.pba', 0)
		self.milla:sayLine("/MITU003MI/", 1, 1) -- DIALOG=<<On TV of course!  Where I was always meant to be!>>
--		LoadBlendAnim(self.milla,'Anims/Milla/MITU/MITU004MI.pba', 0)
		self.milla:sayLine("/MITU004MI/", 1, 1) -- DIALOG=<<I mean look at my hair darling.  How can hair this fabulous not be on TV?>>
		self.milla:sayLine("/MITU200MI/", 1, 1) -- DIALOG=<<Now darling, the best way to learn Levitation is to just try it!>>
		self.milla:sayLine("/MITU201MI/", 1, 1) -- DIALOG=<<I'm going to give you a Levitation Learner's Permit.  It will only work while you're in my mind.>>
		
		--[[ --edit removing all this, no early levitation!
		-- flash the levitation sprite up on da screenie
		local powerAdderFaker = SpawnScript('ScriptBase','PowerAdderFaker')		
		powerAdderFaker.pickupSpriteName = 'LearnersPermit_Levitation.tga'
		powerAdderFaker.displayName = "/MIZB000TO/"--DIALOG=<<Levitation Learner\'s Permit>>
		Global.player.invDisplayer:invItemAdded(powerAdderFaker,0,0,1,1,1)
		
		EnablePower(kPOWER_LEVITATION, 1)
		MapPowerToButton(kPOWER_LEVITATION,kQUICKPICK_WHITE)
		]]
		self.milla:sayLine("/MITU202MI/", 1, 1) -- DIALOG=<<After you finish my course, I'll give you the real thing, baby.>>
		self.milla:sayLine("/MITU203MI/", 1, 1) -- DIALOG=<<First you gotta show me that you know how to use it!>>

		--Show quentin making the jump
		self:sleep(0.5)
		self:cutTo(-18575.19, 6803.75, 38414.1, -7.88, -8.4, 0)
		self.quentin:firstJump()
		self:sleep(2.5)
		self:camPathTo(-19276.9, 7519.33, 37041.46, -23.21, -23.97, 0, nil, 4, 0.25, 0.5, 1)
		self:sleep(1.0)

		Global.levelScript.bIntroCSPlayed = 1
		self:setState('CleanupCSIntro')
	end
	
	function Ob:stateCleanupCSIntro()
		Global.levelScript.bIntroCSPlayed = 1
		self.quentin:firstJumpCallback()
		self:endCutscene()
	end

	--Start the next tutorial	
	function Ob:stateCleanupCSQuentinsSecondJump()
		Global.levelScript.tutorial:startTutorial('doubleBubbleJumpFloat')
		self:endCutscene()
	end
	
	function Ob:stateTutorialFinished()
        Global.player:setPosition(-19687.5, 7011.3+200, 29942.9)
		Global.player:setOrientation(0, -163.2, 0)
        self:cutTo(-19602,7964,30672, -4,8,0)
		self:camPathTo(-19785,7736,29605, -9,7,0, nil, 5, 1, 2, 1)
		self:cutTo(-19800,9465,29334,-8,11,0)
		self.milla:sayLine("/MITU075MI/", 1, 1)-- DIALOG=<<Outstanding!>>
		self.milla:sayLine("/MITU032MI/", 1, 1) -- DIALOG=<<Okay, now, just between you and me, this end of the party is dead>>
		self.milla:sayLine("/MITU033MI/", 1, 1) -- DIALOG=<<Come and find me on the other side of the party and I'll give you that merit badge for real>>
		self.milla:sayLine("/MITU034MI/", 1, 1) -- DIALOG=<<Never keep a girl waiting long young man!>>
		self.milla:sayLine("/MITU035MI/", 1, 1) -- DIALOG=<<kiss>>
		self:sleep(1.8)
		self:setState('CleanupCSTutorialFinished')
	end
	
	function Ob:stateCleanupCSTutorialFinished()
		self.bouncer = FindScriptObject('BigBouncer')
        self.bouncer:openUp() 
		self:endCutscene()
	end
	
  	function Ob:onTutorialComplete()	-- this is a hack for now.  need to replace with something that knows which tutorial ended
  		if (Global:load('FinishedTutorial') ~= 1) then
  			Global:save('FinishedTutorial', 1)
  			self:runCutscene('TutorialFinished', 0, 0)
  		end
	end
	
	function Ob:stateMIFL1ChallengeCompleted()
		Global.player:makeInvisible()
		FindScriptObject('ThoughtBubble'):makeInvisible()
		
		--self:cutTo(-20278.5,6122.4,26148.2, 50.03,17.52,2.02, 140)


		--self:cutTo(-20117,9257,22542,-43,167,0)
		
		self:cutTo(-20851,9705,22203,-44,-173,0)
		self:sleep(2)
		self.milla:sayLine("/MIAA005MI/", 1, 1)--DIALOG=<<Woo hoo! You are the sugar in my bowl darling.>>
		self.milla:sayLine("/MIAA006MI/", 0, 1)--DIALOG=<<Now just follow the flowers, won't you? And try to stay rolling at all times! That is the theme of this party!>>
		self:camPathTo(-19575,7070,23806,-4,139,0,nil,6,.4,.4)
		
		--self:cutTo(-20762,4807,24604,80,135,0)

		self:sleep(8)

		self:setState('CleanupCSMIFL1ChallengeCompleted')
	end
	
	function Ob:stateCleanupCSMIFL1ChallengeCompleted()
		self.milla.crh:chatterStop()
		Global.player:makeVisible()
		FindScriptObject('ThoughtBubble'):makeVisible()
		self:endCutscene()
	end

	
	function Ob:stateBallReturn()
		--Global.player:makeInvisible()
		--FindScriptObject('ThoughtBubble'):makeInvisible()
		
		--self:cutTo(-20278.5,6122.4,26148.2, 50.03,17.52,2.02, 140)


		--self:cutTo(-20117,9257,22542,-43,167,0)

		local br = Global.cutsceneScript.targetBallReturn
		--So that the ball return doesn't pop out
		if (br) then
			SetEntityAlpha(br, 0, 0)
			SetEntityVisible(br, 1)
		end
		
		local x,y,z = Global.player:getPosition()
		local ox,oy,oz = Global.player:getOrientation()
		
		local cx = x
		local cy = y
		local cz = z
		local cox = ox
		local coy = oy
		local coz = oz
		local ctime = 2
		
		local millaDialog	--The filtercode to use to play milla dialog (if there is any)

		if (br) then
			if  br.Name == 'MIFL_ballReturn1' then
				cx = -19286
				cy = 11552
				cz = 24181
				cox = -80
				coy = -162
				coz = 0
				ctime = 2
				millaDialog = {
					"/MIAA007MI/", --DIALOG=<<Fantastic! What style you have young man!>>
				}
			elseif br.Name == 'MIFL_ballReturn2' then
				cx = -20104
				cy = 10793+600
				cz = 26877
				cox = -80
				coy = 18
				coz = 0
				ctime = 2+1
				millaDialog = {
					"/MIAA011MI/", --DIALOG=<<Thank you sweetie. I feel so much better now!>>
				}
			elseif br.Name == 'MIFL3_ballReturn4' then
				cx = -21825
				cy = 28474
				cz = 31382
				cox = -37.77
				coy = 148.97
				coz = 0
				ctime = 2
			end	
		end

		self:camPathTo(cx,cy,cz,cox,coy,coz,nil,ctime,.2,.2)
		if (millaDialog) then
			for i = 1, getn(millaDialog), 1 do
				self.milla:sayLine(millaDialog[i], 1, 1)--DIALOG=<<Woo hoo! You are the sugar in my bowl darling.>>
			end
			millaDialog = nil
		end
		self:camPathWait() -- Wait for cam path to finish in case they skipped lines

		if br then
			local cx,cy,cz,cox,coy,coz = self:oneShot(Global.cutsceneScript.targetBallReturn,550,550,10,nil,nil,nil,1)
			local ctime = 2.5
			
			if br.Name == 'MIFL_ballReturn1' then
				cx = -20598
				cy = 7284
				cz = 25584
				cox = -80
				coy = -162
				coz = 0
				ctime = 2.5
				millaDialog = {
					"/MIAA008MI/", --DIALOG=<<Now I'm not saying that you will fall, but if you ever did, I'll put a ball return down here for you.>>
					"/MIAA009MI/", --DIALOG=<<Just jump in there if you need to come back up here in a hurry.>>
				}
			elseif br.Name == 'MIFL_ballReturn2' then
				cx = -20961
				cy = 11009
				cz = 25092
				cox = -80
				coy = 18
				coz = 0
				ctime = 2.5
			elseif br.Name == 'MIFL3_ballReturn4' then
				cx = -22352
				cy = 23897
				cz = 31175
				cox = -45.33
				coy = -167.95
				coz = 0
				ctime = 2.5
			end	

			self:camPathTo(cx,cy,cz,cox,coy,coz,nil,ctime,.3,.3)

			if (millaDialog) then
				for i = 1, getn(millaDialog), 1 do
					self.milla:sayLine(millaDialog[i], 1, 1)--DIALOG=<<Woo hoo! You are the sugar in my bowl darling.>>
				end
				millaDialog = nil
			end
			self:camPathWait() -- Wait for cam path to finish in case they skipped lines
			
			SetEntityAlpha(br, 1, 2)
			self:sleep(1)
			br:loadAnim('Anims/MI_BallBlaster/Retract.jan',0.0,0)

			self:sleep(2)
		else
			GamePrint('error: cannot find ball return!')	
		end
		
		
		
		self:setState('CleanupCSBallReturn')
	end

	function Ob:stateCleanupCSBallReturn()
		--Global.player:makeVisible()
		--FindScriptObject('ThoughtBubble'):makeVisible()
		local br = Global.cutsceneScript.targetBallReturn
		if br then
			SetEntityAlpha(br, 0, 0)
			SetEntityVisible(br,1)
			SetEntityAlpha(br, 1, 1)
			RegisterNavObstacle(br, 200)
  			Global.cutsceneScript.targetBallReturn = nil
   			if br.Name == 'MIFL_ballReturn2' then
   				Global.cutsceneScript.ballreturn2Activated = 1
   			end
		end
		if Global.cutsceneScript.activatePetalPlatform then
			Global.cutsceneScript.activatePetalPlatform:setState('MoveIt')
			Global.cutsceneScript.activatePetalPlatform = nil
		end
		self:endCutscene()
	end
	
	function Ob:stateFloatOverHereDarling()
		self:cutTo( -19966.6, 11189.7, 23558.6, -25.533, -161.845, 0 )	-- cut to player
		self:sleep(0.5)
		self:camPathTo( -19801.1, 11224.4, 25042.9, -36.7621, 174.114,0, nil, 4, 0.25, .75, 0 )	-- cam path to rings
		self.milla:sayLine("/MITU401MI/", 1, 1) -- DIALOG=<<Darling, float over here, will you? These rings aren't spinning and they're ruining my party!>>
		self:sleep(1)
		Global.cutsceneScript.targetBallReturn = nil			
		self:setState('CleanupCSFloatOverHereDarling')
	end
	
	function Ob:stateCleanupCSFloatOverHereDarling()
		Global.cutsceneScript.targetBallReturn = nil			
		self:endCutscene()
	end
	
	function Ob:stateMIFL2ChallengeCompleted()
		self:cutTo(-18011,22892,25609,-18,-41,0)
		self:camPathTo(-18011,22892,25609,27,-41,0,nil,2.5,.1,.1)
		
		--self.milla.crh:chatterStart(1, 1, nil, 'Challenge2Complete')
		self:sleep(2.5)

		--self.milla.crh:wait()
		
		self:setState('CleanupCSMIFL2ChallengeCompleted')
	end

	function Ob:stateCleanupCSMIFL2ChallengeCompleted()
		self.milla.crh:chatterStop()
		self:endCutscene()
	end
	
	function Ob:statePlungerIntro()
		local phoebe = FindScriptObject('Phoebe')
		local plunger = FindScriptObject('MIFL2Plunger')
		local tambourine = FindScriptObject('TamboFun1')

		--Place Raz at the top of the ladder so we don't lose the domain
		--Global.player:setPosition(-20065.86, 14744.44, 26696.52, -0.00, 100.37, -0.00)
		Global.player:setPosition(-20065.9, 14740.3, 26696.5, 0.0, 105.7, 0.0)
		LoadAnim(Global.player, 'Anims/DartNew/standstill.jan', 0.0, 1)
	
		--Pan down through the room
		self:cutTo(-21094,19151,20884, 32,-163,0,126)
		self:sleep(0.4)
		self:camPathTo(-20874,17976,21585, -49,-160,0, 149, 6, 1, 1.5, 1)
                
		--Shoot phoebe out of the plunger
		self:cutTo(-20089,15445,27183, -12,-37,0, 127, 6, .5, .2, 0)
		phoebe:plungerScene()
		self:sleep(0.9)
		plunger:playSound('PinballPlunger', 0, 0, 1)
		plunger:loadAnim('Anims/MI_Plunger/MI_Plunger.jan',0.0,0)	
		self:sleep(0.6)

		--Cut up to watch her float down
        self:cutTo(-21600,18880,24241, -52,-54,0, 157)
		self:camPathTo(-21600,18880,24241, -8,-31,0,150, 1, 0, .4, 1)
		self:camPathTo(-21600,18880,24241, -8,-31,0,104, 3, 1, 0, 0)
		self.phoebeFloatSound = phoebe:playSound('PsiBubbleHum', 1, 0, 1)
		self:sleep(2.8)
		phoebe:stopSound('PsiBubbleHum', self.phoebeFloatSound)
		tambourine:playSound('TambourineTrampoline', 0, 0, 1)
		self:sleep(0.6)
		
		--Zoom in on Raz		
        self:cutTo(-19362,14893,26545, -10,80,0, 114, 5.5, 1, 3, 0)

		--Walk forward, turning 
		SnapEntityToGround(Global.player)
        LoadAnim(Global.player, 'Anims/DartNew/walkmove.jan', 0.25, 1)

		for frame = 1, 30, 1 do
			RotateEntityY(Global.player, 1.5)
			Yield()
		end
		for frame = 1, 30, 1 do
			RotateEntityY(Global.player, -1.5)
			Yield()
		end
--[[	
		--Look around	
		LoadAnim(Global.player, 'Anims/DartNew/dartidle01.jan', 0, 0)
		Yield()
		while(GetAnimCompletion(Global.player, -1, 'dartidle01.jan') < 1) do
			Yield()
]]--		end

		self:fadeToBlack(0.5, 1)

		--Run cleanup		
		self:setState('CleanupCSPlungerIntro')
	end
	
	function Ob:stateCleanupCSPlungerIntro()
		local phoebe = FindScriptObject('Phoebe')
		if (phoebe and self.phoebeFloatSound) then
			phoebe:stopSound('PsiBubbleHum', self.phoebeFloatSound)
			self.phoebeFloatSound = nil
		end
		self:placeChar(Global.player, -19737.2,14737.9,26479, 0,100.3,0)
		self:endCutscene()
	end
	
	-- need to override this so that raz keeps his ball for all the cutscene in MI
	function Ob:runCutscene(sName, bBlocking, bSetChaseCameraPaused, bInterruptible, bKeepHandler, bKeepActions, bKeepCamera)
		if (not bKeepHandler) then
			%Ob.Parent.runCutscene(self, sName, bBlocking, bSetChaseCameraPaused, bInterruptible, 1, bKeepActions, bKeepCamera)
		else
			%Ob.Parent.runCutscene(self, sName, bBlocking, bSetChaseCameraPaused, bInterruptible, bKeepHandler, bKeepActions, bKeepCamera)
		end
	end
																	   
	return Ob
end

