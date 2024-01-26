function scavEagleClaw(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Levels/CA_Campgrounds/Props/ca_scaveagleclaw.plb' -- Editable
		Ob.collSphereRadius = 50 -- Editable
		Ob.pickupRadius = 250 -- Editable
		Ob.maxViewDistance = 2000
		Ob.lookOffsetPosY = 50
		Ob.bZLock = 1
		Ob.Telekinesis = kTKBEHAVIOR_STANDARD
		Ob.bAutoSelect = 1
		Ob.heldscale = 0.2
		Ob.bCollected = 0
		Ob.displayName = "/CAZB003TO/"	--DIALOG=<<Scavenger Hunt Item>>
		Ob.pickupSpriteName = 'Scav_EagleClaw'	-- Editable
		Ob.bDontPutAwayHeldItem = 1
		Ob.scriptToDisplayNameMapping = 
		{
			scavDoubloon = "/GLZB019TO/",--DIALOG=<<Gold doubloon>>
			scavEagleClaw = "/GLZB020TO/",--DIALOG=<<Eagle claw>>
			ScavDiversHelmet = "/GLZB021TO/",--DIALOG=<<Diver\'s helmet>>
			ScavComic = "/GLZB022TO/",--DIALOG=<<Psychonauts comic #1>>
			ScavHuntPipe = "/GLZB023TO/",--DIALOG=<<Cherry wood pipe>>
			ScavSandwich = "/GLZB024TO/",--DIALOG=<<Turkey sandwich>>
			scavVoodooDollie = "/GLZB025TO/",--DIALOG=<<Voodoo doll>>
			ScavSkull = "/GLZB026TO/",--DIALOG=<<Miner\'s skull>>
			ScavPirateScope = "/GLZB027TO/",--DIALOG=<<Pirate scope>>
			ScavGoldenAcorn = "/GLZB028TO/",--DIALOG=<<Golden acorn>>
			ScavEye = "/GLZB029TO/",--DIALOG=<<Glass eye>>
			ScavEgg = "/GLZB030TO/",--DIALOG=<<Egg>>
			ScavIdol = "/GLZB031TO/",--DIALOG=<<Fertility idol>>
			ScavBone = "/GLZB032TO/",--DIALOG=<<Dinosaur bone>>
			scavFossil = "/GLZB033TO/",--DIALOG=<<Fossil>>
			ScavHuntGoldWatch = "/GLZB034TO/",--DIALOG=<<Gold Watch>>
		}
		Ob.SIM_CULL_DIST = 3000
		
		Ob.dependencies = {
			textures = {
				'Textures/UI/Sayline Heads/FordScout_sayline.tga',
			},
		}
	end																	   

													   
-- ********************************************************************************************************
	function Ob:onBeginLevel()
		Global.levelScript.numScavItemsInLevel = Global.levelScript.numScavItemsInLevel + 1
		if Global.player.stats.scavengerHuntItems ~= nil and Global.player.stats.scavengerHuntItems[self.Name] ~= nil then
			self.bCollected = 1
			self:killSelf()
			return
		end
		%Ob.Parent.onBeginLevel(self)
		self.rCollectedSoundHandle = LoadSound('ScavengerHunt')
		self.displayName = self.scriptToDisplayNameMapping[self.Name]
		SetSimulationCullDistance(self, self.SIM_CULL_DIST)
		self:setState(nil)
	end

-- ********************************************************************************************************

	function Ob:statePickup()
		self:playSound(self.rCollectedSoundHandle, 0, 0, 1)
		self:sendMessage(Global.player, 'ScavengerHuntItem', self.Name)
		Global.player:replaceSelectedItemInPsack()
		Global.player.invDisplayer:invItemAdded(self,0,0)
		
		-- save that you've found this item
		--## need to add status to journal
		local nItems
		if (Global:loadGlobal('ScavengerItemCount')) then
			nItems = tonumber(Global:loadGlobal('ScavengerItemCount'))
			nItems = nItems + 1
			Global:saveGlobal('ScavengerItemCount', tostring(nItems))
			if nItems == 8 then
				-- save variable for ford
				Global:saveGlobal('bCollected8ScavengerItems', 1)

				--edit to make tutorial window pop-up if disable tutorials is on
				if Global:loadGlobal('bDisableTutorialBoxes') == 1 then
					Global:saveGlobal('bDisableTutorialBoxes', 0)
				end

				Global.levelScript:addTutorialBox("/GLZG042TO/", 'Textures/UI/Sayline Heads/FordScout_sayline.tga')--DIALOG=<<Hey, you\'ve finished half of the scavenger hunt, so you\'ve qualified for the first half of your prize! Go see Ranger Ford for your big promotion!>>

				--edit turn off tutorials again if QOL is on
				local settings = FindScriptObject('RandoSeed')
				if settings.removetutorials == TRUE then
					Global:saveGlobal('bDisableTutorialBoxes', 1)
				end

				Global.goalManager:activate('ScavengerHunt1')
			elseif nItems == 16 then
				Global:saveGlobal('bCollected16ScavengerItems', 1)

				--edit to make tutorial window pop-up if disable tutorials is on
				if Global:loadGlobal('bDisableTutorialBoxes') == 1 then
					Global:saveGlobal('bDisableTutorialBoxes', 0)
				end

				Global.levelScript:addTutorialBox("/GLZG043TO/", 'Textures/UI/Sayline Heads/FordScout_sayline.tga')--DIALOG=<<SCAVENGER HUNT COMPLETE! Congratulations! You found everything! Go see Ranger Ford for the final prize! Nice work!>>
				
				--edit turn off tutorials again if QOL is on
				local settings = FindScriptObject('RandoSeed')
				if settings.removetutorials == TRUE then
					Global:saveGlobal('bDisableTutorialBoxes', 1)
				end
				
				Global.goalManager:activate('ScavengerHunt2')
			end
		else
			Global:saveGlobal('ScavengerItemCount', '1')
		end
		
		self:killSelf()
	end

-- ********************************************************************************************************	

	function Ob:onItem(itemName, from)
		local x, y, z = self:getPosition()
		if (GetDistance(x, y, z, Global.player:getPosition()) < self.pickupRadius) then
			self:setState('Pickup')
		end
	end
	
-- ********************************************************************************************************	
    return Ob
    
end
