--      SACUCutscenes.lua
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--		Directions:  rename this script to {Level}Cutscenes ie 'BVRBCutscenes' and place in the same
--					directory as the level script (ie as BVRB).  to run these cutscenes, from your script
--					call self.levelScript.cutsceneScript:runCutscene(nameOfCutscene), 
--					where state..nameOfCutscene exists in this cutscene script.
--

function SACUCutscenes(Ob)
	if not Ob then
		Ob = CreateObject('Global.Camera.CutsceneScript')
		Ob.TIMER_REMINDER = '50'
		Ob.REMINDER_TIME = 15000
		Ob.whichLine = 1
		Ob.tutorialSpawner = nil
		Ob.censorSwitch = nil
	

		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'SA.Props.TutorialGoodie',
			},
                        meshes = {
                                'cutScenes/SACD/MeritBadge.plb',
                        },
		}        
        end

--**************************************************************************************************

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.sasha = FindScriptObject('Sasha')
		self.doorLocator = SpawnScript('dummy', 'SACUDoorLocator', '', 1)
		self.doorLocator.sasha = self.sasha
		self.doorLocator.getITMHeight = function(self)
			return self.sasha:getITMHeight()
		end
		
		self.badge = SpawnScript('dummy', 'SACDbadge')
		
		SetMeshIsBackwards(self.doorLocator, 1)
		self.tutorialSpawner = FindScriptObject('TutorialSpawner')
		self.censorSwitch = FindScriptObject('CensorSwitch')
		--[[
		-- Commenting this out for now, because SACU isn't properly saving where you last were.  This results in
		-- a blocker if you die a ways into SACU and come back in-- there's no tutorial spawner or censor switch.
		if Global:load('bTutorialFinished') == 1 then
			self.tutorialSpawner:killSelf()
			self.censorSwitch:killSelf()
		else
		]]--	
		self.tutorialSpawner:hide()
		self.censorSwitch:hide()
		DomainSleep('tutorialDOMAIN', 0)
		--end
	end

--**************************************************************************************************
	function Ob:stateSetupCSNowRazHasDoneIt()
	 	self:fadeToBlack(0)
		--GamePrint("IN SETUP CS STATE NOW RAZ HAS DONE IT")
		self:killTimer(self.TIMER_REMINDER)   --this is just needed for when you lds()
		Global.levelScript:playNewTheme()	-- this function exists in SACU.lua
        
		Global:save('bTutorialFinished', 1)
		Global:save('currentFace', 1)
		local face = self:getFace(1)
		face:setState('Open')
		--put raz at center of previous face 
		
		if self.tutorialSpawner then
			self.tutorialSpawner:killSelf()
			self.tutorialSpawner = nil
		end
		if self.censorSwitch then
			self.censorSwitch:killSelf()
			self.censorSwitch = nil
		end
		DomainSleep('tutorialDOMAIN', 1)
		self:setState('NowRazHasDoneIt')
	end
	
	function Ob:stateNowRazHasDoneIt()
		self:playVideo('cutscenes/prerendered/saco.bik')
		
		self:placeChar(Global.player, 297.2,-3658.9,113.1, 180,38,0)
		self:cutTo(4403,1819,-1917, -24,106,-3,104)
		self:fadeIn(1)
		--path aoround crib
		self:camPathTo(3678,1074,2700, -6,51,4, 104, 8,2,2, 1)
		
		--path to raz's face
		self:camPathTo(3622,-4493,3674, -171,-130,-7, 104, 4,1,1, 1)
		
		local a,b,c,d,e,f = self:getChaseIdeal(0, 2500, 30)
		self:camPathTo(a,b,c, d,e,f, 104, 4,1,1, 1)
		self:setState('CleanupCSNowRazHasDoneIt')
	end
	
	function Ob:stateCleanupCSNowRazHasDoneIt()
		self:fadeToBlack(0)
		Yield()
		self:placeChar(Global.player, 297.2,-3658.9,113.1, 180,38,0)
		SetEntityGravityDir(Global.player, 0, -1, 0)
		self:endCutscene(1, 1)
   		Global.levelScript.razOnExtrudedFace = 0
		Global.levelScript.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		JournalAddMovie('cutscenes/prerendered/saco.bik')
		MoveCameraToIdeal()
		self:fadeIn(1,1)
		self:setState(nil)
	end

--**************************************************************************************************

	function Ob:stateSetupCSShutdown1()
		local face = self:getFace(1)
		face:setState('Close')
		Global:save('currentFace', 2)
		self:getFace(2):setState('Open')
		
		--put raz at center of previous face 
		self:placeChar(Global.player, -154.2,-4.5,-6.2, 0,-40.3,0.1)
		self:setState('Shutdown1')
	end
												   
												   
	function Ob:stateShutdown1()				
		self:playVideo('cutscenes/prerendered/SACU_Face1_implosion.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Crib2Caulder.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Face2.bik', 0, 0, 0)
		
		self:fadeToBlack(0)
		self:placeChar(Global.player, -154.2,-4.5,-6.2, 0,-40.3,0.1)
		
		
		self:cutTo(2446,-2729,-3348, 3,-176,-89,104)
		self:fadeIn(1)
		--path aoround mobile
		self:camPathTo(2361,896,-3008, -177,-38,90,104, 8,2,2, 1)
		
		--path to raz
		local a,b,c,d,e,f = self:getChaseIdeal(0, 2500, 30)
		self:camPathTo(a,b,c, d,e,f, 104, 4,1,1, 1)
		
		self:setState('CleanupCSShutdown1')
	end
	
	function Ob:stateCleanupCSShutdown1()
		--self:fadeIn(0.5)
		self:fadeToBlack(0)
		self:endCutscene(1)
		self:placeChar(Global.player, -154.2,-4.5,-6.2, 0,-40.3,0.1)
		
		--Move on to face 2
   		Global.levelScript.razOnExtrudedFace = 0
		Global.camControl:removeCam(Global.levelScript.farCam)
		Global.levelScript.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)  
		MoveCameraToIdeal() 	
		
		self:runCutscene('SashaDoorHint3')
	end

--**************************************************************************************************
		
	function Ob:stateSetupCSShutdown2()
		
		self:getFace(2):setState('Close')
		fso('Dart'):sendMessage(fso('Face2MobileParent'), 'StateChange', 'off')
		fso('Dart'):sendMessage(fso('Face2MobileChild1'), 'StateChange', 'off')
		fso('Dart'):sendMessage(fso('Face2MobileChild2'), 'StateChange', 'off')
		Global:save('currentFace', 3)
		--Send Active Face 3 message
		--SendMessage(self,'Face3Collision','FaceState','on',0)
		self:getFace(3):setState('Open')
		local i = 0
		local censor = FindScriptObject('Lazycensor')
		while censor do
			--censor:show()
			SetEntityGravityDir(censor, 0, 0, -1)
			censor:setState('Idle')
			i = i+1
			censor = FindScriptObject('Lazycensor'..i)
		end
		
		--put raz at center of previous face 
		self:placeChar(Global.player, 1827.2,-2138.2,-449.7, 0,-46.6,-90)
		
		self:setState('Shutdown2')	   
	end
		   
	function Ob:stateShutdown2()
		self:playVideo('cutscenes/prerendered/SACU_Face2_implosion.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Caulder2Shoe.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Face3.bik', 0, 0, 0)
					 
  		self:fadeToBlack(0)
		self:placeChar(Global.player, 1827.2,-2143.5,-447.7, 0,70,-90)

		self:cutTo(-3406,-554,-3303, -104,-2,49,104)		
		self:fadeIn(1)
		--path aoround show face
		self:camPathTo(1895,3762,-3119, -98,-4,-15, 104, 8,2,2, 1)
		--path to raz
		local a,b,c,d,e,f = self:getChaseIdeal(0, 2500, 30)
		self:camPathTo(a,b,c, d,e,f, 104, 4,1,1, 1)
		self:setState('CleanupCSShutdown2')
	end
	
	function Ob:stateCleanupCSShutdown2()
		--self:fadeIn(0.5)
		self:endCutscene()
		self:placeChar(Global.player, 1827.2,-2143.5,-447.7, 0,70,-90)

		--Move on to face 3
   		Global.levelScript.razOnExtrudedFace = 0
		Global.camControl:removeCam(Global.levelScript.farCam)
		Global.levelScript.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		MoveCameraToIdeal()
	end




--**************************************************************************************************

	function Ob:stateSetupCSShutdown3()
		
		self:sendMessage(FindScriptObject('ShoeManager'), 'ShutItDown', '')
		self:getFace(3):setState('Close')
		
		Global:save('currentFace', 6)
		self:getFace(6):setState('Open')

		--put raz at center of previous face 
		self:placeChar(Global.player, -397.4,-2281.8,-1827.1, -90,0,-48.3)
	 	
		self:setState('Shutdown3')					  
	end
	
	function Ob:stateShutdown3()
		self:playVideo('cutscenes/prerendered/SACU_Face3_implosion.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Shoe2Factory.bik', 0, 0, 0)
		self:playVideo('cutscenes/prerendered/SACU_Face6.bik', 0, 0, 0)
		
  		self:fadeToBlack(0)
		self:placeChar(Global.player, -397.4,-2281.8,-1827.1, -90,0,-48.3)

		
		self:cutTo(-2709,-4515,-409, -179,62,1,104)
		self:fadeIn(1)
		--path aoround factory face
		self:camPathTo(-1929,-4506,-3222, 176,32,3, 104, 8,2,2, 1)
		
		--path to raz
		local a,b,c,d,e,f = self:getChaseIdeal(0, 2500, 30)
		self:camPathTo(a,b,c, d,e,f, 104, 4,1,1, 1)
		self:setState('CleanupCSShutdown3')
	end
	
	function Ob:stateCleanupCSShutdown3()
		--self:fadeIn(0.5)
		self:endCutscene()
		self:placeChar(Global.player, -397.4,-2281.8,-1827.1, -90,0,-48.3)
		
		--Move on to face 4
   		Global.levelScript.razOnExtrudedFace = 0
		Global.camControl:removeCam(Global.levelScript.farCam)
		Global.levelScript.farCam = Global.camControl:pushAndSetChase(self, 2500, 30)
		MoveCameraToIdeal()
	end


--**************************************************************************************************

	function Ob:stateShutdown6()
  		self:fadeToBlack(0.5,1)
		
		self:placeChar(Global.player, 1740.1, -3657.8, -168.0, 180.0, 155.4, 0.0)
		self:cutTo(1682.9,-3708.4,-44.7, -157.8,148.4,0.0,104.0)
  		self:fadeIn(0.5,1)
  		Global.player:sayLine("/SAAF000RA/", 1,1)  --DIALOG=<<That\'s it! I\'ve completely blocked off all of Sasha\'s censor outlets!  I can\'t wait to tell him.>>
  		self:fadeToBlack(1,1)


		self:playVideo('cutscenes/prerendered/samc.xmv')
		self:setState('CleanupCSShutdown6')
	end

	function Ob:stateCleanupCSShutdown6()
		JournalAddMovie('cutscenes/prerendered/samc.xmv')
		local controller = FindScriptObject('SneakyLampController', 1)
		if controller then controller:killTimer(controller.TIMER_SPAWN_LAMP) end
		self:getFace(6):setState('Close')
		Global:save('currentFace', nil)
		Global:save('SAMadeToMegaCensor',1) 
		
		self:fadeToBlack(0)
		self.sasha = FindScriptObject('Sasha')
		
		--spawn the megacensor battle!
		DomainSleep('MegaCensorDomain', 0)
		DomainSleep('Face1Domain', 1)
		DomainSleep('Face2Domain', 1)
		DomainSleep('Face3Domain', 1)
		DomainSleep('Face4Domain', 1)
		DomainSleep('Face6Domain', 1)
		DomainSleep('VaultDOMAIN', 1)
		DomainSleep('tutorialDOMAIN', 1)
		
		Global.levelScript:setLevelTheme('MegaCensor')
		--sasha
		SetPhysicsFlag(self.sasha, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.sasha, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.sasha, PHYSICS_APPLYGRAVITY, 0)
		
		AttachEntityToEntityBone(self.sasha, FindScriptObject('MC'), 'stampFaceJ_1')
		self.sasha.flattened = 1
		self:placeChar(self.sasha,-80,-20,0,0,0,200)
		self.sasha:loadAnim('Anims/Sasha/Flattened.jan', 0, 1)
		self.sasha:show()
		self.sasha:makeVisible()
		self.sasha:setScale(1,0.5,1)
		--self.sasha:chatterStart()
		
		--Move on to mega censor
		Global.goalManager:activate('DefeatMegaCensor')
		
		self:endCutscene(1)
		self:placeChar(Global.player,-1130.6, -3658.9, -1256.7,180, -131.6, 0, 0,-1,0)
		
		--force the megacensor vents into registerning themselves as nav obstacles
		RegisterNavObstacle(FindScriptObject('MegaCensorVent1'), 200)
		RegisterNavObstacle(FindScriptObject('MegaCensorVent2'), 200)
		RegisterNavObstacle(FindScriptObject('MegaCensorVent3'), 200)
		RegisterNavObstacle(FindScriptObject('MegaCensorVent4'), 200)
		RegisterNavObstacle(FindScriptObject('MegaCensorVent5'), 200)
		
		Global.camControl:removeCam(Global.levelScript.farCam)
		Global.camControl:pushAndSetChase(self, 1000, 5, 250, 120)
		
   		Global.levelScript.razOnExtrudedFace = 0
		Global.levelScript.megaCensorStarted = 1
		Global.levelScript.mcSameFaceAsRaz = 1
		Global.camControl:setSecondaryTarget(FindScriptObject('MC'), BitOr(kSECONDARYFLAG_DISTANCE_ADJUST, kSECONDARYFLAG_AUTO_ROTATE), 1)
		SetChaseCameraDistanceAdjustParam(0)
		SetChaseCameraAutoRotateRange(90, 15)

		HideFordCheering(0)
		self:fadeIn(0)
		Global.levelScript:addTutorialBox("/SAZF000TO/")--DIALOG=<<When your MENTAL FOCUS is LOCKED, press /AButton/ and move the LEFT /Joystick/ to execute a fast tumble in any direction. Very useful for circling your enemies!>>
	end

--**************************************************************************************************
	-- In which Sasha tells you how to shoot lamps in order.
	function Ob:stateSAIN2()
		self:sleep(1)
		self:playVideo('cutscenes/prerendered/SAIN_2.xmv')
		self:setState('CleanupCSSAIN2')
	end

	function Ob:stateCleanupCSSAIN2()
		self:fadeToBlack(0)
		JournalAddMovie('cutscenes/prerendered/sain_2.xmv')
		-- sleep necessary to prevent multiple psiblast messages.
		self:sleep(.1)
		FindScriptObject('LampPedal'):showAllLamps(0, 1)
		self:sleep(0.5)
		self:endCutscene(1)
		self:fadeIn(0.5)
	end

--**************************************************************************************************

	function Ob:stateZLockFail()
		
		self:sleep(1)
		self:cutTo(-2002,-2078,-214, 8,-125,90)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAI000SA/", 1, 1) --DIALOG=<<Good shooting, Raz, but you are making it harder than it needs to be. >>
		self.sasha:sayLine("/SAAI001SA/", 1, 1) --DIALOG=<<You need to practice locking your mental focus.>>
		self.sasha:sayLine("/SAAI002SA/", 1, 1) --DIALOG=<<It makes targeting and evasive maneuvers much easier.>>
		self.sasha:sayLine("/SAAI003SA/", 0, 1) --DIALOG=<<Let\'s try again, this time lock your mental focus.>>
		self:sleep(2)
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		self:sleep(2)
		self:setState('CleanupCSZLockFail')
	end
	
	function Ob:stateCleanupCSZLockFail()
		FindScriptObject('LampPedal'):showAllLamps(1, 1)
		self.sasha.lampsShot = 3
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateDudeSeriouslyShootLampsInOrder()
		self:fadeToBlack(0)
		self.sasha = FindScriptObject('Sasha')
		
        self:cutTo(-2002,-2078,-214, 8,-125,90)
		
		self:fadeIn(0.2,1)
		-- Dialog Domain SAAB
		
		-- ***we dont have real voice for this line so comment it out until we do and play something else
		-- ***self.sasha:sayLine("/SAAB001SA/", 1, 1) --DIALOG=<<No, Raz, shoot them in order. Let\'s try this again.>>
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		self.sasha:sayLine("/SASE002SA/", 1, 1) --DIALOG=<<Come Now Focus.>>
		self.sasha:sayLine("/SASE012SA/", 1, 1) --DIALOG=<<try it again.>>
		
		self:fadeToBlack(0.2,1)
		self:setState('CleanupCSDudeSeriouslyShootLampsInOrder')
	end

	function Ob:stateCleanupCSDudeSeriouslyShootLampsInOrder()
		FindScriptObject('LampPedal'):showAllLamps(1, 1)
		self:endCutscene(nil, 1)
		MoveCameraToIdeal()
		self.sasha.lampsShot = 3
		self:fadeIn(0.2,1)
		self:setState(nil)
	end

--**************************************************************************************************

	function Ob:stateSAMC()
		self:playVideo('cutscenes/prerendered/samc.xmv')
		self:setState('CleanupCSSAMC')
	end

	function Ob:stateCleanupCSSAMC()
		JournalAddMovie('cutscenes/prerendered/samc.xmv')
		self:endCutscene()
	end
	
--**************************************************************************************************
	function Ob:censorHasLanded()
		self.readyToContinue = 1
	end
	

--**************************************************************************************************
	
	-- SA First Blood.
	-- on the second face of the cube, Sasha teaches raz to psi blast the censors
	function Ob:stateSetupCSSAFB1()
		
		self:fadeToBlack(0.5,1)
		DeletePrintMessages()
		
		-- Put the lamps out of commission permanently, so they don't mess with stuff later.
		local i = 1
		local lamp = FindScriptObject('Lamp'..i)
		while lamp do
			lamp:killSelf()
			i = i + 1
			lamp = FindScriptObject('Lamp'..i,1)
		end
		-- show the spawner and the censorSwitch
		if self.tutorialSpawner then
			self.tutorialSpawner:show()
			self.tutorialSpawner.bIsShown = 1
		end
        self.sasha:killTimer(self.sasha.TIMER_TUTORIAL)
		Global:save('currentFace', 5)
		Global.player:setNewAction('Stand')
		self:placeChar(Global.player, 931.8,-4.5,-126.1, 0,-55.7,0, 0,1,0)
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0, 0,1,0)
		--switch
		SetEntityFlag(self.censorSwitch, ENTITY_ALWAYS_POSE, 1)
		
        if self.censorSwitch then
			PlaySound(nil, LoadSound('CensorDialAppear'))
			self.censorSwitch:loadAnim('Anims/SA_SashaBrain/CensorSwitch_open.jan', 0, 0)
			self.censorSwitch:show()
			SetAnimSpeedScale(self.censorSwitch, 2)
		end
		
		self:setState('SAFB1')
	end
	
	function Ob:stateSAFB1()

		--switch
		self:cutTo(1414,634,460, -29,51,0)
		self:fadeIn(0.5,1)
		--sasha
		self.sasha:sayLine("/SAFB001SA/", 1,1)--DIALOG=<<Now then...>>
		self:sleep(0.5)
		--switch close up
		self:cutTo(601,176,-227, -7,28,0)
		self:sleep(1.5)
		SetEntityFlag(self.censorSwitch, ENTITY_ALWAYS_POSE,  0)
        
		--towrads spawner and platform
		self:cutTo(949,102,-568, 9,169,2)
		-- Tell tutorial spawner to start
		self.tutorialSpawner:turnOn()
		self.censorSwitch:loadAnim('Anims/SA_SashaBrain/CensorSwitch_idle.jan', 0.2, 1)
		
		self.tutorialSpawner.bTurnedOn = 1
		self:sleep(3)
		PlaySound(nil, LoadSound('CensorAlert'))
		--censor close up
		self:cutTo(1225,297,491, 15,178,2, 69)
		self:sleep(1)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB002SA/", 1,1)--DIALOG=<<Is this what you saw in your vision?>>
		
		--raz, sasha shoulder
		self:cutTo(440,222,99, -18,-75,0, 77)
        Global.player:loadAnim('Anims/DartNew/Talk_4.jan', 0.1, 1)
		Global.player:sayLine("/SAAH000RA/", 1,1) --DIALOG=<<Um, well, it sure seemed a lot bigger in my head.>>
		
		--raz sasha and platform
		self:cutTo(480,61,-688, 6,-158,2,83)
        Global.player:loadAnim('Anims/DartNew/listen.jan', 0.1, 1)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAH001SA/", 1,1)--DIALOG=<<Ah, problems often seem larger in our heads than they really are. That's an important lesson to learn.>>
		Global.player:sayLine("/SAAH002RA/", 1,1) --DIALOG=<<But-->>
		
		--censor close up
		self:cutTo(1225,297,491, 15,178,2, 69)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB004SA/", 1,1)--DIALOG=<<This is a censor.>>
		self.sasha:sayLine("/SAFB005SA/", 1,1)--DIALOG=<<An intregal part of any sane person's mind.>>
  		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB006SA/", 1,1)--DIALOG=<<The censors roam through your psyche, looking for thoughts that don't belong.>>
		self.sasha:sayLine("/SAFB007SA/", 1,1)--DIALOG=<<Hallucinations, manias, waking dreams-the censors hunt them down and \"censor\" them out. >>
		
		--raz
		self:cutTo(700,147,-37, -12,-73,0,65)
        Global.player:loadAnim('Anims/DartNew/gesture01.jan', 0.1, 0)
		Global.player:sayLine("/SAFB008RA/", 1, 1)--DIALOG=<<Why do they come after me? I'm not a mania!>>
        Global.player:loadAnim('Anims/DartNew/listen.jan', 0.2, 1)
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Gesture2)
		self.sasha:sayLine("/SAFB009SA/", 1,1)--DIALOG=<<Yes, but you are a foreign entity in my mind. You technically don't belong here. >>
		
		--raz
		self:cutTo(700,147,-37, -12,-73,0,65)
        Global.player:loadAnim('Anims/DartNew/Talk_3.jan', 0.1, 1)
        Global.player:sayLine("/SAAH003RA/",  1,1) --DIALOG=<<Yes, but I was attacked in my own head.>>
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB901SA/", 1,1)--DIALOG=<<Yes. Well. The brain tumbler could be malfunctioning.  Or you could be insane.>>
		self.sasha:sayLine("/SAFB902SA/", 1,1)--DIALOG=<<We'll test for that later. For now....>>
		
		--raz sasha and platform
		self:cutTo(480,61,-688, 6,-158,2,83)
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		self.sasha:sayLine("/SAFB011SA/", 1,1)--DIALOG=<<Blast it!>>
		self:fadeToBlack(0.5,1)

		self:setState('CleanupCSSAFB1')
	end

	--after this, raz needs to shoot the censor
	function Ob:stateCleanupCSSAFB1()
		self:placeChar(Global.player, 931.8,-4.5,-126.1, 0,-55.7,0, 0,1,0)
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0, 0,1,0)
		
        self.censorSwitch:show()
		if self.tutorialSpawner.bIsShown ~= 1 then
			self.tutorialSpawner:show()
			self.tutorialSpawner.bIsShown = 1
		end
		if self.tutorialSpawner.bTurnedOn ~= 1 then
			self.tutorialSpawner:turnOn()
			self.tutorialSpawner.bTurnedOn = 1
		end
		
		self:createTimer(self.REMINDER_TIME, self.TIMER_REMINDER)	 	
		self.whichLine = 1
		self:onTimer(self.TIMER_REMINDER)
		self:endCutscene(1)
		self:fadeIn(0.5)
	end

--**************************************************************************************************
	
	--if raz melees the censor instead of psiblasting
	function Ob:stateSAFB2Fail()
		DeletePrintMessages()
		self:killTimer(self.TIMER_REMINDER)
		
		--sasha
		self:oneShot(self.sasha, 150, 150, 200, 20, 5)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAA000SA/", 1,1)  --DIALOG=<<Yes, yes. We all know you can punch things.>>
		self.sasha:sayLine("/SAAA001SA/", 1,1)  --DIALOG=<<But you\'re supposed to be learning how to use your PSI Blast now.>>
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		self.sasha:sayLine("/SAAA002SA/", 1,1)  --DIALOG=<<Try it without punching.>>
		
		self:setState('CleanupCSSAFB2Fail')
	end
	
	function Ob:stateCleanupCSSAFB2Fail()
       	self:createTimer(self.REMINDER_TIME, self.TIMER_REMINDER) 	
		self:endCutscene()
	end

	
	--if raz uses firestarting on the censor instead of psiblasting
	function Ob:stateSAFB2FailFirestarting()
		DeletePrintMessages()
		self:killTimer(self.TIMER_REMINDER)
		
		--sasha
		self:oneShot(self.sasha, 150, 150, 200, 20, 5)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self:sleep(0.5)
		self.sasha:sayLine("/SAAA001SA/", 1,1)  --DIALOG=<<But you\'re supposed to be learning how to use your PSI Blast now.>>
		self:sleep(0.5)
		self.sasha:sayLine("/SASE001SA/", 1,1)  --DIALOG=<<Again.>>
		
		self:setState('CleanupCSSAFB2Fail')
	end
	
	function Ob:stateCleanupCSSAFB2Fail()
       	self:createTimer(self.REMINDER_TIME, self.TIMER_REMINDER) 	
		self:endCutscene()
	end

	--if raz melees the lamp instead of psiblasting
	function Ob:stateLampBlastFail()
		self:fadeToBlack(.5, 1)
		
		self:cutTo(-2063,-2004,-314, 171,-12,-90)
		DeletePrintMessages()
		self:fadeIn(0.5)
		self:sleep(.4)
	
		self.sasha:sayLine("/SAAA000SA/", 1,1)  --DIALOG=<<Yes, yes. We all know you can punch things.>>
		self.sasha:sayLine("/SAAA001SA/", 1,1)  --DIALOG=<<But you\'re supposed to be learning how to use your PSI Blast now.>>
		self.sasha:sayLine("/SAAA002SA/", 1,1)  --DIALOG=<<Try it without punching.>>
		self:setState('CleanupCSLampBlastFail')
	end
	
	function Ob:stateCleanupCSLampBlastFail()
		Global.player:setPosition(-1827.1, -2498.2, -330.9)
		Global.player:setOrientation(180, -9, -90)
		FindScriptObject('LampPedal'):showAllLamps(1, (self.sasha.lampsShot >= 3) and 1)
		if self.sasha.lampsShot >= 3 then
			self.sasha.lampsShot = 3
		else
			self.sasha.lampsShot = 0
		end
		self:endCutscene()
	end
	
--**************************************************************************************************
	
	--sasha tells raz to get the psi mist
	function Ob:stateSAFB2()
		self.sasha:killTimer(self.sasha.TIMER_BRUSH)
		self.spawnedGoodie = 0
		
		self:killTimer(self.TIMER_REMINDER)
	
		self:fadeToBlack(0.5, 1)
		
        self:placeChar(Global.player, 925.9,-4.5,48.5, 0,-87.8,0)
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0)
		
		Yield()
		
		-- Spawn tutorial goodie
		self.tutorialSpawner.goodie = SpawnScript('SA.Props.TutorialGoodie', 'TutorialGoodie')
		self.tutorialSpawner.goodie.spawner = self.tutorialSpawner
		local x,y,z = FindScriptObject('TutorialLoc1'):getPosition()
		self.tutorialSpawner.goodie:setPosition(x,y,z)
		self.tutorialSpawner.goodie:setOrientation(0,180,0)
		self.tutorialSpawner.goodie:detach(0,1)	-- 0 means dont go away
		SetVelocity(self.tutorialSpawner.goodie, 0,0,0)
		self.tutorialSpawner.goodie:loadAnim('Anims/HealthBalls/Idle_still.jan', 0, 1)
		
		self.tutorialSpawner.goodie.bBouncy = 0
		self.tutorialSpawner.bWaitForGoodie = 1
		self.spawnedGoodie = 1
		
		--sasha
		self:cutTo(724,164,42, 8,118,0,95)
		self:fadeIn(0.5, 1)
		
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB012SA/", 1,1)--DIALOG=<<That's the spirit.>>
		
		--raz
		self:cutTo(748,134,33, -11,-103,0, 90)
        Global.player:loadAnim('Anims/DartNew/gesture01.jan', 0.1, 0)
		Global.player:sayLine("/SAFB013RA/", 1, 1)--DIALOG=<<I killed it.>>
        
		--the health ammo
		self:cutTo(1270,373,837, 20,177,0, 105)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB014SA/", 0,1) --DIALOG=<<It was just a thought I was having. And it's not dead. It has just returned to its basic form--raw psychic energy. Go absorb it. It's good for your mental health.>>
		self:sleep(4)
		--sasha
		self:cutTo(497,79,-453, 9,-157,0, 100)
		while (self.sasha:isSayingLine() == 1) do Yield() end
		self:setState('CleanupCSSAFB2')
	end
	
	--after this raz needs to get the psi mist
	function Ob:stateCleanupCSSAFB2()
		self:placeChar(Global.player, 946.7,-4.5,-105.6, 0,-2.8,0)
		Yield()		
		if (self.spawnedGoodie ~= 1) then
			-- Spawn tutorial goodie
			self.tutorialSpawner.goodie = SpawnScript('SA.Props.TutorialGoodie', 'TutorialGoodie')
			self.tutorialSpawner.goodie.spawner = self.tutorialSpawner
			local x,y,z = FindScriptObject('TutorialLoc1'):getPosition()
			self.tutorialSpawner.goodie:setPosition(x,y,z)
			self.tutorialSpawner.goodie:detach(0,1)	-- 0 means dont go away
			SetVelocity(self.tutorialSpawner.goodie, 0,0,0)
			self.tutorialSpawner.goodie.bBouncy = 0
			self.tutorialSpawner.bWaitForGoodie = 1
			self.spawnedGoodie = 1
			self.tutorialSpawner.goodie:loadAnim('Anims/HealthBalls/Idle_still.jan', 0, 1)
		end

		
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0)
		Global.levelScript.bplayedSAFB2 = 1
       	self:createTimer(self.REMINDER_TIME, self.TIMER_REMINDER)	 	
		self.whichLine = 2
		self:endCutscene()
		self:onTimer(self.TIMER_REMINDER)
		self.sasha:createTimer(self.sasha.BRUSH_TIME, self.sasha.TIMER_BRUSH)
		self.sasha:setAnim(self.sasha.animsTable.idle)
	end
	
--**************************************************************************************************
		
	--sasha leaves
	function Ob:stateSAFB3()
		self:killTimer(self.TIMER_REMINDER)
		self:fadeToBlack(1,1)
        Global.player:setNewAction('Stand')
		self:placeChar(Global.player, 925.9,-4.5,48.5, 0,-87.8,0)
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0)
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self:fadeIn(1)
		self:sleep(0.5)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAH006SA/", 1,1)--DIALOG=<<As you absorb this energy, your mental health increases. >>
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAH007SA/", 1,1)--DIALOG=<<But as you PSI Blast, you expend your will to do damage. >>
		
		--spawn dummy psiblast goodie
		self.tempgoodie = SpawnScript('Global.Props.Geometry', 'DummyAmmo', 'self.meshName=\'Characters/HateBall.plb\'')
		self:placeChar(self.tempgoodie, 792,-4.5,504, 0,-173.3,0)
		SetEntityFlag(self.tempgoodie, ENTITY_NOSIMULATE, 0)
		self.tempgoodie:loadAnim('Anims/HateBalls/Idle_still.jan', 0, 1)
		
		--raz sasha and platform
		self:cutTo(646,88,-569, 7,-173,2, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAH008SA/", 1,1)--DIALOG=<<So be on the look out for these small, dense clusters of raw psychic aggression.>>
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAAH009SA/", 1,1)--DIALOG=<<Absorb these as well to make sure you always have enough firepower.>>
		
		--switch
		self:cutTo(601,176,-227, -7,28,0)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB015SA/", 1,1)--DIALOG=<<Now I'll leave the machine on for you, so you can practice. You have to blast 1000 censors to earn your marksmanship merit badge.>>
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB016SA/", 1,1)--DIALOG=<<Come back every day for practice, and you should have enough in as little as three weeks!>>
		
		--raz
		self:cutTo(748,134,33, -11,-103,0, 90)
        Global.player:loadAnim('Anims/DartNew/Talk_1.jan', 0.1, 1)
        Global.player:sayLine("/SAFB017RA/", 1, 1)--DIALOG=<<Three weeks! I only have a few days to earn ALL my merit badges and become a Psychonaut.>>
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB018SA/", 0,1)--DIALOG=<<Slow and steady wins the race my eager young friend. Now practice. Slowly and carefully.>>
		self:sleep(5)
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		while (self.sasha:isSayingLine() == 1) do Yield() end
		
		--raz
		self:cutTo(748,134,33, -11,-103,0, 90)
        Global.player:loadAnim('Anims/DartNew/Gesture04.jan', 0.1, 1)
		Global.player:sayLine("/SAFB019RA/", 1, 1)--DIALOG=<<Oh man...>>
		self:fadeToBlack(0.5, 1)
														 
		self:setState('CleanupCSSAFB3')
	end

	--after this, sasha leaves, and raz should flip the switch											  
	function Ob:stateCleanupCSSAFB3()
		self.sasha:makeInvisible()
		if (self.tempgoodie) then self.tempgoodie:killSelf() end
		local goodie = Global.levelScript:getPool('Global.Collectibles.PsiBlastAmmo'):get()
		goodie:attach(self.sasha)
		goodie:detach()
		self:placeChar(goodie, 792,-4.5,504, 0,-173.3,0)

		self.whichLine = 3
		self:createTimer(30000, self.TIMER_REMINDER)	 	
		self.tutorialSpawner:turnOn()
		self.tutorialSpawner.spawnFreq = 12000
		
		self:endCutscene(1)
		self:fadeIn(0.5)
	end

--**************************************************************************************************
	
	--sasha leaves
	function Ob:stateSetupCSSAFB3Short()
		self:fadeToBlack(0)
		DeletePrintMessages()
		
		-- show the spawner and the censorSwitch
		if self.tutorialSpawner then
			self.tutorialSpawner:show()
			self.tutorialSpawner.bIsShown = 1
		end
		Global:save('currentFace', 5)
		Global.player:setNewAction('Stand')
		--switch
		SetEntityFlag(self.censorSwitch, ENTITY_ALWAYS_POSE, 1)
		
        if self.censorSwitch then
			PlaySound(nil, LoadSound('CensorDialAppear'))
			self.censorSwitch:loadAnim('Anims/SA_SashaBrain/CensorSwitch_open.jan', 0, 0)
			self.censorSwitch:show()
			SetAnimSpeedScale(self.censorSwitch, 2)
		end
		self:placeChar(Global.player, 925.9,-4.5,48.5, 0,-87.8,0)
		self:placeChar(self.sasha, 548.5,-4.5,105, 0,96.7,0)
		
		self:setState('SAFB3Short')
	end
		
	function Ob:stateSAFB3Short()
		--switch
		self:cutTo(601,176,-227, -7,28,0)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self:fadeIn(1,1)
		
		self.sasha:sayLine("/SAFB015SA/", 1,1)--DIALOG=<<Now I'll leave the machine on for you, so you can practice. You have to blast 1000 censors to earn your marksmanship merit badge.>>
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB016SA/", 1,1)--DIALOG=<<Come back every day for practice, and you should have enough in as little as three weeks!>>
		
		--raz
		self:cutTo(748,134,33, -11,-103,0, 90)
        Global.player:loadAnim('Anims/DartNew/Talk_1.jan', 0.1, 1)
        Global.player:sayLine("/SAFB017RA/", 1, 1)--DIALOG=<<Three weeks! I only have a few days to earn ALL my merit badges and become a Psychonaut.>>
		
		--sasha
		self:cutTo(701,174,49, 7,117,0, 104)
		self.sasha:setAnim(self.sasha.animsTable.Talk)
		self.sasha:sayLine("/SAFB018SA/", 0,1)--DIALOG=<<Slow and steady wins the race my eager young friend. Now practice. Slowly and carefully.>>
		self:sleep(5)
		self.sasha:setAnim(self.sasha.animsTable.Gesture3)
		while (self.sasha:isSayingLine() == 1) do Yield() end
		
		--raz
		self:cutTo(748,134,33, -11,-103,0, 90)
        Global.player:loadAnim('Anims/DartNew/Gesture04.jan', 0.1, 1)
		Global.player:sayLine("/SAFB019RA/", 1, 1)--DIALOG=<<Oh man...>>
		self:fadeToBlack(0.5, 1)
														 
		self:setState('CleanupCSSAFB3Short')
	end

	--after this, sasha leaves, and raz should flip the switch											  
	function Ob:stateCleanupCSSAFB3Short()
		self.sasha:makeInvisible()

		self.whichLine = 3
		self:createTimer(30000, self.TIMER_REMINDER)	 	
		self.tutorialSpawner:turnOn()
		self.tutorialSpawner.spawnFreq = 12000
		self.tutorialSpawner:setupSpawnPoints()
		
		self:endCutscene(1)
		self:fadeIn(0.5)
	end

--**************************************************************************************************

	function Ob:stateSashaGivesAmmo()
		DeletePrintMessages()
		self:killTimer(self.TIMER_REMINDER)
		self:oneShot(self.sasha, 400, 175, 150, 30)
		for i=1,10 do
			local goodie = Global.levelScript:getPool('Global.Collectibles.PsiBlastAmmo'):get()
			goodie:attach(self.sasha)
			goodie:detach()
			self.goodies = i
			self:sleep(0.25)
		end
		self:sleep(2)		
		self:setState('CleanupCSSashaGivesAmmo')
    end
		
	function Ob:stateCleanupCSSashaGivesAmmo()	
		self.goodies = self.goodies or 1
		for i=self.goodies,10 do
			local goodie = Global.levelScript:getPool('Global.Collectibles.PsiBlastAmmo'):get()
			goodie:attach(self.sasha)
			goodie:detach()
		end
		self.goodies = nil
		self:createTimer(self.REMINDER_TIME, self.TIMER_REMINDER)	 	
		self:endCutscene()
	end

--**************************************************************************************************
	
	function Ob:onTimer(id)
		if id == self.TIMER_REMINDER then
			local switch = FindScriptObject('CensorSwitch', 1)
			if not switch or switch.beenTripped == 1 then
				self:killTimer(self.TIMER_REMINDER)
			else
				if (self.cutscenePlaying ~= 1) then
					if self.whichLine == 1 then
						-- forcefully map the right trigger to psi blast when we print this message
						Global.player:mapPowerToButton(kPOWER_PSIBLAST, kQUICKPICK_TRIGR)
						PrintMessage("/SAZE003TO/", 0)--DIALOG=<<Hold /LeftFlipper/ to lock on, then press /RightFlipper/.>>
					elseif self.whichLine == 3 then
						if (self.censorSwitch.setting == 1) then
							-- Dialog Domain SAAD
							Global.player:sayLine("/SAAD003RA/", 0) --DIALOG=<<This is going to take forever.  I wonder if I can speed it up somehow.>>
							self.whichLine = 4
						else
							self:killTimer(self.TIMER_REMINDER)
						end
					elseif self.whichLine == 4 then
						if (self.censorSwitch.setting == 1) then
							Global.player:sayLine("/SAAD004RA/", 0) --DIALOG=<<I wonder what would happen if I turned that dial up.>>
							self.whichLine = 3
						else
							self:killTimer(self.TIMER_REMINDER)
						end
					elseif self.whichLine == 5 then
						self:killTimer(self.TIMER_REMINDER)
						Global.player:sayLine("/SAAH010RA/", 0) --DIALOG=<<Hm. They're coming out faster but still not fast enough.>>
					elseif self.whichLine == 6 then
						self:killTimer(self.TIMER_REMINDER)
						Global.player:sayLine("/SAAH011RA/", 0) --DIALOG=<<Hm. Still not fast enough!>>
					end
				end
			end
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

--**************************************************************************************************

	function Ob:findClosestVisibleLoc(prefix)
		local num = 1
		local loc = FindScriptObject(prefix..num)
		local x, y, z = Global.player:getPosition()
		local bestLoc = nil
		local bestDist = 10000
		local px, py, pz = Global.player:getHead()
		while loc do
			local x, y, z = loc:getPosition()
			local dist = GetDistance(x, y, z, px, py, pz)
			if dist < bestDist and CheckForCollision(x, y, z, px, py, pz, kCOLLIDEFLAG_IGNORECOLLIDESPHERES, 50) ~= 1 then
				bestDist = dist
				bestLoc = loc
			end
			num = num+1
			loc = FindScriptObject(prefix..num, 1)
		end
		if not bestLoc then
			GamePrint('WARNING: no good loc found')
		end
		return bestLoc
	end
	
	function Ob:stateSAF3()
	--[[
		self:sleep(1)
		local csLoc = self:findClosestVisibleLoc('SAF3loc')
		local bFound = (csLoc and 1) or nil
		if csLoc == nil then csLoc = self:getFace(3) end
		self:setUpSashaDoor(csLoc)
		Yield()
		if bFound == 1 then
			self:overShoulder(Global.player, self.doorLocator, 1, 500)
		else
			self:oneShot(self.doorLocator, 300)
		end
		self.sasha:emergeFromDoor(self.doorLocator)
		-- Dialog Domain SAAE
		self.sasha:sayLine("/SAAE005SA/", 1) --DIALOG=<<Super charge your psi blast for maximum power.>>
		self.sasha:closeDoor()
		]]--
		self:setState('CleanupCSSAF3')
	end

	function Ob:stateCleanupCSSAF3()
		--self.sasha:doorCleanup()
		self:endCutscene()
	end


--**************************************************************************************************
	
	function Ob:stateSAF4()
		self:setState('CleanupCSSAF4')
	end

	function Ob:stateCleanupCSSAF4()
		self:endCutscene()
	end

	function Ob:setUpSashaDoor(loc, y, z, p, y, r)
		if not y then
			p, y, r = loc:getOrientation()
			loc, y, z = loc:getPosition()
		end
		self.doorLocator:setPosition(loc, y, z)
		self.doorLocator:setOrientation(p, y, r)
		local x, y, z = Global.player:getPosition()
		RotateTowards2D(self.doorLocator, x, y, z, 20000)
	end

--**************************************************************************************************

	function Ob:stateSACD()
		self.mc = FindScriptObject('MC')
		--self.sasha:chatterStop()
		
		SetPhysicsFlag(self.mc, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.mc, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.mc, PHYSICS_APPLYGRAVITY, 0)
		
		Global.player:makeInvisible()
		self.mc:setAnim(self.mc.animsTable.Death)
		self:oneShot(self.mc, 1500, 500, 500, 20, 10)
		while (self.mc:getAnimCompletion('Death.jan') < 1.0) do Yield() end 
		
		self:fadeToBlack(0.5, 1)
        DetachEntityFromParent(self.sasha)
		self.sasha:setScale(1,1,1)
		SetEntityVisible(self.sasha, 1)

		self.badge:loadMesh('cutScenes/SACD/MeritBadge.plb')
		SetPhysicsFlag(self.sasha, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.sasha, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.sasha, PHYSICS_APPLYGRAVITY, 0)
		SetEntityFlag(self.badge, ENTITY_ALWAYS_POSE, 1)
		SetPhysicsFlag(self.badge, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.badge, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.badge, PHYSICS_APPLYGRAVITY, 0)
		SetEntityFlag(self.badge, ENTITY_ALWAYS_POSE, 1)
		SetEntityFlag(Global.player, ENTITY_ALWAYS_POSE, 1)
		SetEntityFlag(self.sasha, ENTITY_ALWAYS_POSE, 1)
		Global.player:makeVisible()
		self:placeChar(self.mc, 0,-3595,885, 180,90,0)
 		self:placeChar(self.sasha, 153.3,-3657.9,508.4, 180,10,0)
		self:placeChar(self.badge, 153.3,-3657.9,508.4, 180,10,0)
 		self:placeChar(Global.player, 153.3,-3657.9,508.4, 180,10,0)
		SetEntityGravityDir(Global.player, 0, -1, 0)
		SetEntityGravityDir(self.sasha, GetEntityUp(Global.player))
		SetEntityGravityDir(self.badge, GetEntityUp(Global.player))
		self.sasha:loadAnim('Anims/Sasha/SACD002SA.jan', 0,0)
		Global.player:loadAnim('Anims/DartNew/SACD001RA.jan', 0,0)
		self.badge:loadAnim('cutScenes/SACD/SACD_badge.jan', 0,0)
		Yield()
		self:cutTo(13,-3720,248, -171,41,0)
		self:fadeIn(0.5, 0)
 		Global.player:sayLine("/SACD001RA/", 1, 1)--DIALOG=<<So, is this where I get a speech and learn another lesson?>>
		
		--self:sleep(4)
         
 		self:cutTo(299,-3738,301, -163,-22,0)
		self:sleep(.6)
		
 		self.sasha:sayLine("/SACD002SA/", 1,1)--DIALOG=<<No. Here's your merit badge. Let us never speak of this again.>>
		self:sleep(.3)
		self:fadeToBlack(0.5,1)
		self:setState('CleanupCSSACD')
	end

	function Ob:stateCleanupCSSACD()
		self:fadeToBlack(0)
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDER, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		SetEntityFlag(Global.player, ENTITY_ALWAYS_POSE, 0)
		Global.player.block = 0

		self:endCutscene(1)
	end

--**************************************************************************************************
	function Ob:stateMarksmanshipBadge()	
		-- stop all sounds for that there's silence after the prerender
		StopAllSounds()
        self:playVideo('cutscenes/prerendered/marksmanshipbadge.bik', 1)
		self:fadeToBlack(0)
		self:setState('CleanupCSMarksmanshipBadge')
	end
	
	function Ob:stateCleanupCSMarksmanshipBadge()
		self:fadeToBlack(0)
		Global.goalManager:deactivate('LearnPsiBlast')
		Global.goalManager:activate('BrainTumbler1')

		Global:setLevelToCompleted('SA')
		Global.player.block = 0
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('CASA',0,1)
		self:endCutscene()
	end															
--**************************************************************************************************
																
	function Ob:stateMegaCensorMad()
		self.mc = FindScriptObject('MC')
		self.mc:setAnim(self.mc.animsTable.Rage)
		--zoom in
		while (GetAnimCompletion(self.mc) < 0.2) do Yield() end
		
		self:oneShot(self.mc, 1200, 700, 700, 20, 5)
		
		while (GetAnimCompletion(self.mc) < 0.55) do Yield() end
		PlaySound(nil, LoadSound('MegaCensor_No'))
		
		while (GetAnimCompletion(self.mc) < 0.7) do Yield() end
		
		local x,y,z, ox,oy,oz = self:oneShot(self.mc, 500, 800, 800, 20, 5, 0, 1)
		self:camPathTo(x,y,z, ox,oy,oz, nil, 1,0.5,0.5, 1)
		
		while (GetAnimCompletion(self.mc) < 1.0) do Yield() end
		self:setState('CleanupCSMegaCensorMad')
	end
	
	function Ob:stateCleanupCSMegaCensorMad()
		self:endCutscene()
		--self.mc:decide()
	end

	-- Created because the case on the face names changed more often than one could've thought possible.
	function Ob:getFace(num)
		return FindScriptObject('face'..num,1)
	end
							   
--**************************************************************************************************

  	function Ob:stateShowNewFaceSpawner()
  		self:fadeToBlack(0.5,1)	
   		if (self.firstVisitFace == 1) then
   			self:cutTo(3688,754,-878, 8,68,0)
   		elseif (self.firstVisitFace == 2) then
   			self:cutTo(3675,-5092,-1194, -19,95,-90)
   		elseif (self.firstVisitFace == 3) then
   			self:cutTo(-3946,-2619,-2709, 89,180,-81,104)
   		elseif (self.firstVisitFace == 6) then
   			self:cutTo(-3047,-5153,-1139, 165,49,0,104)
   		end
  		self:fadeIn(0.5,1)
  		self:sleep(3)
  		self:fadeToBlack(0.5,1)	
  		self:setState('CleanupCSShowNewFaceSpawner')
  	end
  	
  	function Ob:stateCleanupCSShowNewFaceSpawner()
  		if (Global:load('currentFace') == 1) then
			self:endCutscene(1)
			if (Global:loadGlobal('bSACompleted') ~= 1) then
				self:runCutscene('SashaDoorHint1')
			end
		else
			self:endCutscene(1)
			self:fadeIn(0.5)
  		end
   	end
   
--**************************************************************************************************
   	
	function Ob:stateShowSpawnerTurnOn()
   		if (self.spawner.Name == 'Face1Spawner2') then
   			self:cutTo(-3160,2296,3280, -33,-24,0)
   		elseif (self.spawner.Name == 'Face2Spawner2') then
			self:cutTo(2550,-1397,2837, -4,-15,-87,104)
  		elseif (self.spawner.Name == 'Face3Spawner2') then
   			self:cutTo(3968,-1900,-2749, 101,180,85,104)
   		end
  		self:fadeIn(0.25, 1)	
		
   		self:sleep(3)
  		self:fadeToBlack(0.5,1)	
  		self:setState('CleanupCSShowSpawnerTurnOn')
  	end
 	
  	function Ob:stateCleanupCSShowSpawnerTurnOn()
   		self:endCutscene()
  		self:fadeIn(0.5)
   	end

--**************************************************************************************************
   	
	function Ob:stateShowSpawnerShutdown()
   		while (self.spawnerShutdownDone ~= 1) do Yield() end
  		self:fadeToBlack(0.25,1)	
  		self:setState('CleanupCSShowSpawnerShutdown')
  	end
 	
  	function Ob:stateCleanupCSShowSpawnerShutdown()
   		self:endCutscene(1)
		if (Global:loadGlobal('bSACompleted') == 1) then
			self:fadeIn(0.5)
		end
   	end

--**************************************************************************************************

	function Ob:stateReentryCloseFace()
		self:fadeToBlack(0)
		local face = Global:load('currentFace')
		if (face) then
			local rFace = self:getFace(face)
			rFace:setState('Close')
			Global:save('currentFace', nil)
			if (face == 1) then
				self:playVideo('cutScenes/prerendered/SACU_Face1_implosion.bik', 0, 0, 0)
				Global.player:setPosition(30.3, -4.5, -189.3)
				Global.player:setOrientation(0, -35.6, 0)
			elseif (face == 2) then
				self:playVideo('cutScenes/prerendered/SACU_Face2_implosion.bik', 0, 0, 0)
				Global.player:setPosition(1827.2, -1515.9, -190.7)
				Global.player:setOrientation(0.1, 33.5, -90)
			elseif (face == 3) then
				self:playVideo('cutScenes/prerendered/SACU_Face3_implosion.bik', 0, 0, 0)
				Global.player:setPosition(-285.9, -1863.3, -1827.1)
				Global.player:setOrientation(-90, 0, -18)
			elseif (face == 6) then
				self:playVideo('cutScenes/prerendered/SACU_Face6_implosion.bik', 0, 0, 0)
				Global.player:setPosition(-155.4, -3658.6, -370.8)
				Global.player:setOrientation(180, -140.5, 0)			
			end
			Global.player:snapToGround(100)
			self:sleep(1)
		end
		self:endCutscene()	
   		Global.levelScript.razOnExtrudedFace = 0
		Global:setPlayerRespawnPointName(nil)

		self:fadeIn(1)	
	end
	
--**************************************************************************************************


	function Ob:stateReentryFace1()
		self:sleep(1)
		if (Global:load('currentFace')) then
			local face = self:getFace(Global:load('currentFace'))
			face:setState('Close')
		end
		Global:save('currentFace', 1)
		local face = self:getFace(1)
		face:setState('Open')
		self:playVideo('cutscenes/prerendered/SACU_Face1.bik', 0, 0, 0)

		self:fadeToBlack(0)
		Yield()
		self:placeChar(Global.player, -1632.3, -3.7, 1619.7,0, -179.8, 0)
		self:endCutscene(1, 1)
		Global.levelScript.razOnExtrudedFace = 1
		Global.camControl:removeCam(Global.levelScript.farCam)
		self:fadeIn(1,1)
		self:setState(nil)
	end
	
--**************************************************************************************************

	function Ob:stateReentryFace2()
		self:sleep(1)
		if (Global:load('currentFace')) then
			local face = self:getFace(Global:load('currentFace'))
			face:setState('Close')
		end
		Global:save('currentFace', 2)
		self:getFace(2):setState('Open')
		
		self:playVideo('cutscenes/prerendered/SACU_Face2.bik', 0, 0, 0)
		self:endCutscene()
		self:placeChar(Global.player, 1827.9, -195.5, -1624.9, 0.1, 52.3, -90)
		
   		Global.levelScript.razOnExtrudedFace = 1
		Global.camControl:removeCam(Global.levelScript.farCam)
	end

--**************************************************************************************************

	function Ob:stateReentryFace3()
		self:sleep(1)
		if (Global:load('currentFace')) then
			local face = self:getFace(Global:load('currentFace'))
			face:setState('Close')
		end
		Global:save('currentFace', 3)
		self:getFace(3):setState('Open')
		local i = 0
		local censor = FindScriptObject('Lazycensor')
		while censor do
			SetEntityGravityDir(censor, 0, 0, -1)
			censor:setState('Idle')
			i = i+1
			censor = FindScriptObject('Lazycensor'..i)
		end
		
		--put raz at center of previous face 
		self:playVideo('cutscenes/prerendered/SACU_Face3.bik', 0, 0, 0)
		self:endCutscene()
		self:placeChar(Global.player,-1508.6, -3344.1, -1826.8, -90, 0, -35.6)

		--Move on to face 3
   		Global.levelScript.razOnExtrudedFace = 1
		Global.camControl:removeCam(Global.levelScript.farCam)
	end

--**************************************************************************************************

	function Ob:stateReentryFace6()
		self:sleep(1)
		if (Global:load('currentFace')) then
			local face = self:getFace(Global:load('currentFace'))
			face:setState('Close')
		end
		Global:save('currentFace', 6)
		self:getFace(6):setState('Open')

		--put raz at center of previous face 
		self:placeChar(Global.player, -853.9, -3658.6, -1543.7, 180, -128.8, 0)
		self:playVideo('cutscenes/prerendered/SACU_Face6.bik', 0, 0, 0)
		self:endCutscene()
		
		--Move on to face 4
   		Global.levelScript.razOnExtrudedFace = 1
		Global.camControl:removeCam(Global.levelScript.farCam)
	end

--**************************************************************************************************

	function Ob:stateTurnDial()
		Global.player:makeInvisible()
		self:cutTo(479,137,-352, 0,14,0,136)
		self:sleep(0.5)
		self.censorSwitch:playSound(self.censorSwitch.clickSound)
		self.censorSwitch:loadAnim('Anims/SA_SashaBrain/CensorSwitch_' .. (self.censorSwitch.setting-1) ..'to'.. self.censorSwitch.setting .. '.jan', 0, 0)
		self.turnedDialAnim = 1
		self:sleep(0.5)
		self:fadeToBlack(0.5, 1)
		self:setState('CleanupCSTurnDial')
	end
	
	function Ob:stateCleanupCSTurnDial()
		if (self.turnedDialAnim ~= 1) then
			self.censorSwitch:loadAnim('Anims/SA_SashaBrain/CensorSwitch_' .. (self.censorSwitch.setting-1) ..'to'.. self.censorSwitch.setting .. '.jan', 0, 0)
		end
		self.turnedDialAnim = nil

		if (self.censorSwitch.setting >= 3) then
			self.whichLine = 6
		else		
			self.whichLine = 5
		end
		self:killTimer(self.TIMER_REMINDER)	 	
		self:createTimer(5000, self.TIMER_REMINDER)	 	
		Global.player:makeVisible()

		self:endCutscene(1)
		self:fadeIn(0.5)
	end
	
	
--**************************************************************************************************
	
	return Ob
end

