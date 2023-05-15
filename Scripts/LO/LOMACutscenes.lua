--      LOMACutscenes.lua
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

function LOMACutscenes(Ob)
	if not Ob then
		Ob = CreateObject('Global.Camera.CutsceneScript')
		Ob.dependencies = {
			scripts = { 'LO.Characters.NewsCaster',
						'LO.Characters.Tank',
						'LO.Characters.Zealot',  },
--			meshes = {  },
			textures = { 'Textures/icons/PsiPowers/Shield.dds',
							'Textures/LevelTextures/LO_Lungfishopolis/LO_NewsOverlay.dds', },	
		}
		
	end

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.tHeadLines = {}
		self.tHeadLines['TankIntroduction'] = "/LOZJ001TO/"
		self.tHeadLines['ElecTruckIntroduction'] = "/LOZJ000TO/"
		self.tHeadLines['ElecTruckIntroduction11'] = "/LOZJ000TO/"
		self.tHeadLines['PlaneIntroduction'] = "/LOZJ003TO/"
		self.tHeadLines['TurretIntroduction'] = "/LOZJ002TO/"
		self.tHeadLines['EndIsNeigh'] = "/LOZJ004TO/"
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.newsBroadcaster = FindScriptObject('NewsCaster')
		if (not self.newsBroadcaster) then
			self.newsBroadcaster = SpawnScript('LO.Characters.NewsCaster', 'NewsCaster')
			self.newsBroadcaster:setPosition(-10000,-10000,-10000)
			SetPhysicsFlag(self.newsBroadcaster, PHYSICS_NOPHYSICS, 1)
		end
		
		--Create a tank (to be used as a CS prop)
		self.tank = SpawnScript('LO.Characters.Tank', 'TankProp')
		self.tank:stopAttack()
		self.tank:hide()

	end

	--Override runCutscene so that we can disable raz's gravity and clear his velocity when the cutscene starts.
	--This prevents him from falling through the water plane while the cutscene is running.
	function Ob:xRunCutsceneWithSettings(...)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		SetVelocity(Global.player, 0, 0, 0)
		local returnValue = %Ob.Parent.xRunCutsceneWithSettings(self, asArgs(arg))
		if (returnValue == 0) then
			--Cutscene didn't really get run!
			SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		end
		return returnValue
	end

	--Restore gravity after cutscene.
	function Ob:endCutscene(...)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		%Ob.Parent.endCutscene(self, asArgs(arg))		 
		 --Restore normal sayline position
		ResetSaylinePosition()

	end									      

--**************************************************************************************************
	
	function Ob:stateZealotIntroduction()	
		self:playVideo('cutScenes/prerendered/LOZ1.xmv')
		self:setState('CleanupCSZealotIntroduction')
	end
	
	function Ob:stateCleanupCSZealotIntroduction()
		JournalAddMovie('cutscenes/prerendered/loz1.xmv')
		self:endCutscene()
		--Goal to free dissidents
		Global.goalManager:activate('DestroyTower')
		Global.goalManager:activate('LearnPsiShield')
	end

--**************************************************************************************************
	
	function Ob:stateZealotJailBreakout()	
		self:sleep(0.5)
		self:playVideo('cutScenes/prerendered/LOZ2.bik')

		self:setState('CleanupCSZealotJailBreakout')
	end
	
	function Ob:stateCleanupCSZealotJailBreakout()
		JournalAddMovie('cutscenes/prerendered/loz2.bik')
		Global.goalManager:activate('GiantCannon')

		--edit Removed to prevent getting Shield from Cutscene
		
		--EnablePower(kPOWER_SHIELD)
		--if GetMappedPower(kQUICKPICK_BLACK) == kPOWER_NONE then MapPowerToButton(kPOWER_SHIELD,kQUICKPICK_BLACK) end
		
		Global:saveGlobal('bGotShield', 1)
		self:fadeToBlack(0)
		self:fadeIn(0.25)
		self:endCutscene()

		--Tell the player a little sumthin about shield
		Global.levelScript:addTutorialBox("/LOZF001TO/", 'Textures/icons/PsiPowers/Shield.dds')--DIALOG=<<Use your PSYCHIC SHIELD to protect you from damage, and reflect SOME enemy attacks back at the attacker! NOTE: You will not be able to maintain a PSYCHIC SHIELD forever, and when this part of your mind is exhausted, you will need to wait a while before you use it again.>>
	end
	
--**************************************************************************************************

	function Ob:stateCleanupCSBlimpPilotBreakout()
		FindScriptObject('BPIZealot'):makeInvisible()
		local blimp = FindScriptObject('blimp')
		if (blimp.state_name ~= 'MoveIt') then
			blimp:moveToEnd()
		end
		self:endCutscene()

		Global:save('bBlimpPilotSaved', 1)

		--Now bounce on blimp to get over dam		
		if (Global.goalManager:isActive('GiantCannon') ~= 1) then
			Global.goalManager:activate('Dam')
		end
	end

--**************************************************************************************************

	function Ob:stateCleanupCSThePlan()
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateShipsNotDocked()	
		DomainSleep('city4domain', 1)
		DomainSleep('LSOcity4domain', 1)
		local csBoat = FindScriptObject('floatingBoat7')
		self.zealot1 = FindScriptObject('CutsceneZealot1', 1) or SpawnScript('LO.Characters.Zealot', 'CutsceneZealot1', '', 1)
		self.zealot1:setPosition(csBoat:getRelativePosition(-300, 100, 0))
		self.zealot1:setOrientation(0, -135, 0)

		self.zealot2 = FindScriptObject('CutsceneZealot2', 1) or SpawnScript('LO.Characters.Zealot', 'CutsceneZealot2', '', 1)
		self.zealot2:setPosition(csBoat:getRelativePosition(-320, 100, 0))
		self.zealot2:setOrientation(0, -161, 0)

		Global.player:hide()
		Global.cutsceneScript:cutTo(17812,2239,-4561, -19,-155,0)
		self:fadeIn(0.25)
		
		Global.cutsceneScript:camPathTo(17841.71, 2185.28, -4192.31, -16.33, -139.13, 0, 150, 6, .25, 1, 0)

		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZM003Z1/", 1, 1) --DIALOG=<<Goggalor! Come in! We have commandeered these vessels in your name!>>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)		
		
		self.zealot2:setAnim(self.zealot2.animsTable.Talk)				
		self.zealot2:sayLine("/LOZM004Z2/", 1, 1) --DIALOG=<<We can put them in position to help you cross Kochamara Channel, to get to Kochamara Island, and destroy Kochamara Tower!>>
		self.zealot2:setAnim(self.zealot2.animsTable.Idle)	

		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZN000Z1/", 1, 1) --DIALOG=<<The thing is that, uh, although we have the utmost faith that you will soon contain that area, Goggalor.... We... Uh.. >>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)		

		self.zealot2:setAnim(self.zealot2.animsTable.Talk)				
		self.zealot2:sayLine("/LOZM006Z2/", 1, 1) --DIALOG=<<We just think it best... to... er...>>
		self.zealot2:setAnim(self.zealot2.animsTable.Idle)	

		Global.cutsceneScript:cutTo(15208.54, 3459.01, -4803.82, -19.49, -72.3, 0)	
		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZM007Z1/", 1, 1) --DIALOG=<<We�ve decided to maintain our position out here.>>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)		

		Global.cutsceneScript:cutTo(19658.86, 4523.61, -10150.77, -10.56, -72.25, 0)	
		self.zealot2:setAnim(self.zealot2.animsTable.Talk)				
		self.zealot2:sayLine("/LOZM008Z2/", 1, 1) --DIALOG=<<Just until you clear the area of all hostiles.>>
		self.zealot2:setAnim(self.zealot2.animsTable.Idle)	
		
		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZM009Z1/", 1, 1) --DIALOG=<<Yes.>>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)	

		Global.cutsceneScript:cutTo(17862.05, 2215.83, -4189.77, -18.91, -145.68, 0)	
		self.zealot2:setAnim(self.zealot2.animsTable.Talk)				
		self.zealot2:sayLine("/LOZM010Z2/", 1, 1) --DIALOG=<<For insurance reasons, Goggalor.>>
		self.zealot2:setAnim(self.zealot2.animsTable.Idle)	

		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZM011Z1/", 1, 1) --DIALOG=<<Yes! That, and for Freedom!>>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)	

		self:setState('CleanupCSShipsNotDocked')
	end

	function Ob:stateCleanupCSShipsNotDocked()
        self:fadeToBlack(0)
        Global.player:show()
        Global.levelScript:enablePlaneCounter()
		self:fadeIn(.25)
		Global.goalManager:activate('DestroyPlanes')
		
		self:endCutscene()
	end
	
--**************************************************************************************************

	function Ob:stateShipsDocked()	
		Global.levelScript:disablePlaneCounter()
		self:fadeToBlack(0)

		Global.player:hide()
		self:toggleBoats(Global.notSaved.cutsceneBoats, 0)
		
		local csBoat = FindScriptObject('floatingBoat7')

		self.zealot1 = FindScriptObject('CutsceneZealot1', 1) or SpawnScript('LO.Characters.Zealot', 'CutsceneZealot1', '', 1)
		self.zealot1:setPosition(csBoat:getRelativePosition(-300, 100, 0))
		self.zealot1:setOrientation(0, -135, 0)

		self.zealot2 = FindScriptObject('CutsceneZealot2', 1) or SpawnScript('LO.Characters.Zealot', 'CutsceneZealot2', '', 1)
		self.zealot2:setPosition(csBoat:getRelativePosition(-320, 100, 0))
		self.zealot2:setOrientation(0, -161, 0)

        self:cutTo(17767, 2224, -4246, -19.59, -133.22, 0)
		self:fadeIn(0.25, 1)
        
		self.zealot1:setAnim(self.zealot1.animsTable.Talk)
		self.zealot1:sayLine("/LOZI022Z1/", 0, 1) --DIALOG=<<FREEDOM!>>
		self.zealot1:setAnim(self.zealot1.animsTable.Idle)

		self.zealot2:setAnim(self.zealot2.animsTable.Talk)	
		self.zealot2:sayLine("/LOZI022Z1/", 1, 1) --DIALOG=<<FREEDOM!>>			
		self.zealot2:setAnim(self.zealot2.animsTable.Idle)	
		self:sleep(1)

		self:cutTo(21148,2936,-10218, -40,-161,0)
		self:camPathTo(22110,5711,-2184, 5,-163,0, 150, 8,2,2,1)
		self:setState('CleanupCSShipsDocked')
	end

	function Ob:stateCleanupCSShipsDocked()
		self:toggleBoats(Global.notSaved.dockingBoats, 1)
		Global.goalManager:activate('TowerIsland')
		self:fadeToBlack(0)
        Global.player:show()
		self:fadeIn(0.25)
		
		self:endCutscene()
	end

	function Ob:toggleBoats(whichBoats, bVisible)
		for k, v in whichBoats do
			if k ~= 'n' then
				if bVisible then
					v:show()
					v:setState('Float')
				else
					v:hide()
					v:setState(nil)
				end
			end
		end
	end

--**************************************************************************************************

	function Ob:stateSetupCSTankIntroduction()
		--Deploy the tanks!
		Global.levelScript:deployGroup(1)
		self:setState(self.currCSName)
	end

	function Ob:stateCleanupCSTankIntroduction()
		Global.levelScript.rInstaHintFord:enemySawPlayer('lo.characters.tank')
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateCleanupCSElecTruckIntroduction()
		Global.levelScript.rInstaHintFord:enemySawPlayer('lo.characters.electrotruck')
		self:endCutscene()
	end

	function Ob:stateCleanupCSElecTruckIntroduction11()
		Global.levelScript.rInstaHintFord:enemySawPlayer('lo.characters.electrotruck')
		self:endCutscene()
	end

--**************************************************************************************************
	
	function Ob:stateCleanupCSPlaneIntroduction()
		Global.levelScript.rInstaHintFord:enemySawPlayer('lo.characters.plane')
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateCleanupCSTurretIntroduction()
		Global.levelScript.rInstaHintFord:enemySawPlayer('lo.characters.missilesilo')
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateCleanupCSReentryIntro()
		self:endCutscene(1)
	end												     

--**************************************************************************************************

	function Ob:showNewsBar()
		self.newsSprite = AddSpriteHandle('Textures/LevelTextures/LO_Lungfishopolis/LO_NewsOverlay.dds', 0, 0,1, 1, 1,1,1,0)		
		SpriteAdjust(self.newsSprite, 50, 320, 1, 1.15, 1.15, 0)
		local headline = self.tHeadLines[self.currCSName] or self.tHeadLines[self.currEZSceneName]
		if (headline) then
			self.textHandle = DisplayText(headline, 189, 389, .9, 1.6, 3)
			self.textHandle2 = DisplayText(headline, 188, 389, .9, 1.6, 3)
		end

		--Move sayline position up to avoid writing over news bar
		--SetSaylinePosition(115,315)
	end

	function Ob:hideNewsBar()
		if (self.newsSprite) then
			RemoveSprite(self.newsSprite)
		end
		if (self.textHandle) then
			RemoveText(self.textHandle)
		end
		if (self.textHandle2) then
			RemoveText(self.textHandle2)
		end
	end

--**************************************************************************************************
												  												  
	return Ob
end

