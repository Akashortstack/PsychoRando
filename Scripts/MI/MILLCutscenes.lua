--      MILLCutscenes.lua
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--

function MILLCutscenes(Ob)
	if not Ob then
		Ob = CreateObject('Global.Camera.CutsceneScript')
		Ob.LINE_TIMER = 1
		
		Ob.floatKidPrefix = 'FloatKid'
	end
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.milla = FindScriptObject('Milla')
		self.forcefieldSound = LoadSound('WallDown')
	end


	function Ob:stateIntroFlyBy()
		self:fadeToBlack(0)
		--Start the campkids floating
		self:startFloatKids()
		--[[  killling this campath stuff, and making another simpler, less dizzying one
		--Create the cam path table
		self:cutTo(15944, -4771, -21064, -6.40, 164.49, 0)
		self:sleep(0.5)

		local camPathTable = {}
		self:createCamPathEntry(15944, -4771, -21064, -6.40, 164.49, 0, 104, camPathTable)
		self:createCamPathEntry(16244, -4025, -20191, -11.11, 176.54, 0, 104, camPathTable)
		self:createCamPathEntry(17990, -3053, -20826, -0.81, -165.93, 0, 104, camPathTable)
		self:createCamPathEntry(18303, -3102, -21844, 29.22, -49.43, 0, 104, camPathTable)
		self:createCamPathEntry(17458, -2984, -22340, -4.74, 49.02, 0, 104, camPathTable)
		self:createCamPathEntry(16336, -997, -21237, -2.91, 70.97, 0, 104, camPathTable)
		self:createCamPathEntry(15733, -702, -20335, -5.56, 34.26, 0, 104, camPathTable)
]]--
		--[[
		for index, entry in camPathTable do
			if (entry.sphere) then
				entry.sphere:killSelf()
			end
			entry.sphere = showSphere(entry.xpos, entry.ypos, entry.zpos)
		end
		--Do the cam path around the scene		
		self:camPath(camPathTable, 11.5, 1, 1, 0)
		]]--


		self:cutTo(19983.1,-591.3,-20595.9, -14.5,22.2,-0.0,104.0)
		self:fadeIn(1, 1)
		self:sleep(1)
		self:camPathTo(15524.4,-618.0,-20575.6, -17.1,32.4,0.0,104.0, 8, 2,4, 0)
		--Have milla speak her lines
		self.milla:sayLine("/MITU226MI/", 1, 1) -- DIALOG=<<Okay, if you want to get up to where the action is, you are going to have to do a lot of floating in this room, baby.>>

		self.milla:sayLine("/MITU227MI/", 1, 1) -- DIALOG=<<Good thing you are so light on your feet.>>
		
		local a,b,c,d,e,f = self:getChaseIdeal()
		self:camPathTo(a,b,c,d,e,f, nil, 6, 2,2, 0)

		--When they are done, show the float hint
		PrintMessage("/MIZE009TO/",0)--DIALOG=<<Press /LeftFlipper/ while airborn to float.>>
		self.bSawFloatHint = 1

		--Wait for cam path to complete
		self:camPathWait()
		self:setState('CleanupCSIntroFlyBy')
	end
	
	function Ob:startFloatKids()
		local i = 0
		local floatKid = FindScriptObject(self.floatKidPrefix..i, 1)
		while (floatKid) do
			floatKid:splineScene(1, 13)
			i = i+1
			floatKid = FindScriptObject(self.floatKidPrefix..i, 1)
		end
	end
	
	function Ob:stopFloatKids()
		--Find all the float kids
		local i = 0
		local floatKid = FindScriptObject(self.floatKidPrefix..i, 1)
		while (floatKid) do
			floatKid:endSplineScene()
			i = i+1
			floatKid = FindScriptObject(self.floatKidPrefix..i, 1)
		end
	end
	
	function Ob:stateCleanupCSIntroFlyBy()
		if (self.bSawFloatHint ~= 1) then
			PrintMessage("/MIZE009TO/",0)--DIALOG=<<Press /LeftFlipper/ while airborn to float.>>
		end
		self:stopFloatKids()	
		local t=FindScriptObject('MILLtoMIMM',1)
		if t then
			t.bCanTele = 0
		end
		self:endCutscene()
	end
																					  
																				  
	function Ob:stateYouWin()
		EnableLooking(Global.player, 0)
		
		local x,y,z = 23419.37,-1293.11,-26325.79
		local ox,oy,oz = -22.30,-49.70,-1.62
		--if Global.levelScript.tx then
		--	x = Global.levelScript.tx
		--	y = Global.levelScript.ty
		--	z = Global.levelScript.tz
		--	ox = Global.levelScript.tox
		--	oy = Global.levelScript.toy
		--	oz = Global.levelScript.toz
		--end			
		self.milla.bBlockDance = 1
		Global.player:makeInvisible()
		SetPhysicsFlag(self.milla, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.milla, PHYSICS_COLLIDEE, 0)
		self:cutTo(23767,-1353,-26380, -1,-20,0)
		self.milla:loadAnim('Anims/Milla/MITU/MITU_BigFinish_A.jan',0.2,0)
		--self.milla:sayLine("/MITU_Big_Finish/", 1)
		self.milla:sayLine("/MITU083MI/", 1,1)--DIALOG=<<Who\'s that I see?>>
		self.milla:sayLine("/MITU084MI/", 1,1)--DIALOG=<<It\'s Razputin, the Rolling Rock Star! In the flesh!>>
		self.milla:sayLine("/MITU085MI/", 1,1)--DIALOG=<<And just in time. This party was dying without you darling.>>
		self.milla:sayLine("/MITU086MI/", 1,1)--DIALOG=<<Here, I have a little party favor for you.>>
		self:playVideo('cutScenes/prerendered/LevitationMeritBadge')
		
		self.milla:loadAnim('Anims/Milla/Milla_danceLoop07.jan',0,1)
		Global.player:makeVisible()
		Global.player:setPosition(23840.34,-1506.17,-26509.18)
		Global.player:setOrientation(0,143.50,0)
		
		self:cutTo(x,y,z,ox,oy,oz)
		
		self.flyPathRunning = nil
		self.bCamPathLock = nil
		self:camPathTo(23670.30,-1452.25,-26453.00, 17.83,-61.79,3.27, nil, 3.3, .1, .1)
		
		self:sleep(.3)
		
		self.milla:loadAnim('Anims/Milla/MITU/MITU_BigFinish_B_Milla.jan',0.4,0)
		Global.player:loadAnim('Anims/Milla/MITU/MITU_BigFinish_B_Raz.jan',0.2,0)
		self.milla:sayLine("/MITU087MI/", 1,1)--DIALOG=<<So cute! <kiss noise>>>
		self:sleep(2)
		self:fadeToBlack(0.75, 1)
		self:setState('CleanupCSYouWin')
	end

	function Ob:stateCleanupCSYouWin()
		self:fadeToBlack(0)
		self:endCutscene(1)
		EnableLooking(Global.player, 1)

		--Complete levitation merit badge goal
		Global.goalManager:activate('BrainTumbler2')

		if Global:loadGlobal('bMICompleted') ~= 1 then
			--Player must have gotten at least this far
			Global:setLevelToCompleted('MI')
		end
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('CABH',0,1)
	end

	function Ob:stateOpenDoor()
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		self.savepx,self.savepy,self.savepz = Global.player:getPosition()
		self:camPathTo(19338,-1399,-22813, -5,-53,1, 104, 2,1,1,1)
		local pd = FindScriptObject('MILLPunchyDoor')
		self:sleep(.5)
		local f=FindScriptObject('forcefield')
		if f then
			SetEntityAlpha(f, 0, 1)
			PlaySound(nil,self.forcefieldSound,1)
			self:sleep(1)
			f:hide()
			self:sleep(.5)
		end
		if pd then
			pd:unlock()
		end
		self:setState('CleanupCSOpenDoor')
	end
	
	function Ob:stateCleanupCSOpenDoor()
		Global.levelScript:unlockDoor()
		if self.savepx then 
			Global.player:setPosition(self.savepx,self.savepy,self.savepz)
		end	
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		--ShootEntityAtTarget(Global.player,self.savepx,self.savepy,self.savepz,self.savepx,self.savepy+100,self.savepz,1)
		SetPhysicsState(Global.player, PHYSICSSTATE_PSIFLOAT, 1)
		self:endCutscene()
	end

	function Ob:stateGiveMegaFigment()
		self:cutTo(17515,479,-21024, -9,-45,0)
		--SetCameraPosition(18002,367,-21515)
		--SetCameraOrientation(-9,-45,0)
		self:sleep(2)
		
		self:setState('CleanupCSGiveMegaFigment')
	end

	function Ob:stateCleanupCSGiveMegaFigment()
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

