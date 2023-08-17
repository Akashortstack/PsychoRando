--
--  CookFord.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential
--
-- 
--  Kee Chi

function CookFord(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Characters.DialogTreeActor')
		Ob.meshName = 'Characters/janitorcook.plb'
		Ob.TK_YOffset = 150
		
		Ob.animsDir = 'Janitor'
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Mouth.tga'
		Ob.clairFollows = 1	
		Ob.height = 250

		Ob.animsTable = {
			cookFlip = {fileName = 'FlipBurger_cook', preload = 1, loop = 1},
			cookScrapeFlip = {fileName = 'ScrapeFlip_cook', preload = 1, loop = 1},
			cookScrape = {fileName = 'Scrape_cook', preload = 1, loop = 1, blendTime = 0.2},
			cookTalk1 = {fileName = 'Talk1_cook', preload = 1, loop = 0},
			cookTalk2 = {fileName = 'Talk2_cook', preload = 1, loop = 0},
			cookOpenShop = {fileName = 'SellFluff_cook', preload = 1, loop = 0, next = 'cookScrape'},
			flinch = {fileName = 'PsiReaction', preload = 1, loop = 0, blendTime = 0},
			jumpOn = {fileName = 'JumpOn_Reaction', preload = 1, loop = 0, blendTime = 0.1},
			ninjaConfusionLoop = {fileName = 'Ninja_Confusion_loop', preload = 1, loop = 1, blendTime = 0.2},
			ninjaConfusionEnd = {fileName = 'Ninja_Confusion_end', preload = 1, loop = 0, blendTime = 0.1},
			TKed = {fileName = 'FordTK', preload = 1, loop = 1, blendTime = 0},
		}
		Ob.punchedTableChef = {
			{line = "/CAHJ000FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Ow!>>
			{line = "/CAHJ001FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Aye!>>
			{line = "/CAHJ002FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Oof!>>
			{line = "/CAHH000FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineDone'}, --DIALOG=<<I will flip you like a half-done burger, boy.>>
			{line = "/CAHH001FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineDone'}, --DIALOG=<<I will take out your intestines, fry 'em into hash browns, and sew 'em back into your body before you ever get the chance to try that again!>>
			{line = "/CAHH002FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineDone'}, --DIALOG=<<How'd you like to be branded with a hot spatula, eh?>>
		}
		
		Ob.spatula = nil
		Ob.rCurrItem = nil
		Ob.bUserExit = 0
		Ob.charName = 'FordCook_sayline'
		Ob.bInPurchaseDialog = 0

	end

--  I N I T   F U N C T I O N S   A N D   S T A T E S  ********************************************

	function Ob:onSpawn()
		self.tItems = { }

		self.tShopDialog = {
			{line = "/CAGE003FO/", group = 'a', maxPlays = -1, filterCode = 'global.collectibles.DreamFluff' },--DIALOG=<<Dream fluffs! Delicious, nutritious and cheap!>>
			{line = "/CAGE004FO/", group = 'a', maxPlays = -1, filterCode = 'global.collectibles.DreamFluff' },--DIALOG=<<Each one is packed with concentrated mental health!>>
			{line = "/CAGE005FO/", group = 'a', maxPlays = -1, filterCode = 'global.collectibles.DreamFluff' },--DIALOG=<<You shouldn\'t go anywhere without a pocket full of those!>>

			{line = "/CAGE007FO/", group = 'b', maxPlays = -1, filterCode = 'global.collectibles.PSIChallengeCore' },--DIALOG=<<Now you take that PSI CORE there...>>
			{line = "/CAGE008FO/", group = 'b', maxPlays = -1, filterCode = 'global.collectibles.PSIChallengeCore' },--DIALOG=<<Put it together with nine PSI CARDS, and you\'ll have yourself a brand new PSI Challenge Marker!>>
			{line = "/CAGE009FO/", group = 'b', maxPlays = -1, filterCode = 'global.collectibles.PSIChallengeCore' },--DIALOG=<<Which is worth a whole rank, you know.>>

			{line = "/CAGE012FO/", group = 'c', maxPlays = -1, filterCode = 'global.collectibles.CobwebDuster' },--DIALOG=<<Oh that\'s my last Cobweb Duster.>>
			{line = "/CAGE013FO/", group = 'c', maxPlays = -1, filterCode = 'global.collectibles.CobwebDuster' },--DIALOG=<<Take that into someone\'s mind with ya, you can clean up!>>
			{line = "/CAGE014FO/", group = 'c', maxPlays = -1, filterCode = 'global.collectibles.CobwebDuster' },--DIALOG=<<They\'re happy to be rid of the webs, and you can turn them in for PSI Cards!>>

			{line = "/CAGE017FO/", group = 'd', maxPlays = -1, filterCode = 'global.collectibles.DowsingRod' },--DIALOG=<<Now that dowsing rod will help you find arrowheads that are buried DEEP.>>
			{line = "/CAGE018FO/", group = 'd', maxPlays = -1, filterCode = 'global.collectibles.DowsingRod' },--DIALOG=<<That\'s where all the really valuable ones are, you know. >>
			{line = "/CAGE019FO/", group = 'd', maxPlays = -1, filterCode = 'global.collectibles.DowsingRod' },--DIALOG=<<Find three or four deep deposits and that baby pays for itself.>>
			{line = "/CAGE020FO/", group = 'd', maxPlays = -1, filterCode = 'global.collectibles.DowsingRod' },--DIALOG=<<It costs you money because it MAKES you money!>>

			{line = "/CAGE023FO/", group = 'e', maxPlays = -1, filterCode = 'global.collectibles.PSIBallColor' },--DIALOG=<<Now with that, you can change the color of some of your PSI powers, like your levitation ball, and what have you and whatnot.>>
			{line = "/CAGE024FO/", group = 'e', maxPlays = -1, filterCode = 'global.collectibles.PSIBallColor' },--DIALOG=<<Kind of a vanity thing. In my day PSI powers were all gray and we thought that was grand. We were happy just to HAVE PSI powers. But you know kids these days. >>

			{line = "/CAGE026FO/", group = 'f', maxPlays = -1, filterCode = 'global.collectibles.CabinPoster' },--DIALOG=<<Got some posters here.>>
			{line = "/CAGE027FO/", group = 'f', maxPlays = -1, filterCode = 'global.collectibles.CabinPoster' },--DIALOG=<<You can hang them in your cabin. >>
			{line = "/CAGE028FO/", group = 'f', maxPlays = -1, filterCode = 'global.collectibles.CabinPoster' },--DIALOG=<<Make it just like home!>>

			{line = "/CAGE029RA/", group = 'g', maxPlays = 1, ownerOverride = Global.player, filterCode = 'noArrowheads' },--DIALOG=<<Hey, can you put that on my tab?>>
			{line = "/CAGE030FO/", group = 'g', maxPlays = 1, filterCode = 'noArrowheads' },--DIALOG=<<Sorry, Mac. No can do. We only trade in hard, cold, Psitanium Arrowheads here. >>
			{line = "/CAGE031FO/", group = 'g', maxPlays = 1, filterCode = 'noArrowheads' },--DIALOG=<<If you don\'t have enough, why don\'t you run around outside a bit and dig some up?>>
			{line = "/CAGE032FO/", group = 'g', maxPlays = 1, filterCode = 'noArrowheads', callback = 'LineEnd' },--DIALOG=<<Or crack open some mental vaults. Always something valuable in a vault!>>
			{line = "/CAGE033RA/", group = 'g', maxPlays = -1, ownerOverride = Global.player, filterCode = 'noArrowheads' },--DIALOG=<<I don\'t have enough arrowheads for that!>>
			{line = "/CAGE034FO/", group = 'g', maxPlays = -1, filterCode = 'noArrowheads' },--DIALOG=<<Well then, quit lookin at it!>>

			{line = "/CAGE035FO/", group = 'h', maxPlays = 1, filterCode = 'noRank' },--DIALOG=<<Ah, it doesn\'t look like you\'ve got the rank you need there, kiddo.>>
			{line = "/CAGE036FO/", group = 'h', maxPlays = 1, filterCode = 'noRank' },--DIALOG=<<And there\'s no excuse for that! Plenty of ways to get promoted around here!>>
			{line = "/CAGE037FO/", group = 'h', maxPlays = 1, filterCode = 'noRank' },--DIALOG=<<Collecting mental figments and cobwebs helps you rank up. So does finding PSI challenge markers, or building them out of PSI-cards and cores.>>
			{line = "/CAGE038FO/", group = 'h', maxPlays = 1, filterCode = 'noRank', callback = 'LineEnd' },--DIALOG=<<You also rank up when you sort people\'s emotional baggage, and if you want to skip a bunch of ranks at once, you should talk to the camp Ranger about his scavenger hunt contest.  >>
			{line = "/CAGE039RA/", group = 'h', maxPlays = -1, ownerOverride = Global.player, filterCode = 'noRank' },--DIALOG=<<I don\'t have a high enough rank to buy that yet!>>
			{line = "/CAGE040FO/", group = 'h', maxPlays = -1, filterCode = 'noRank', callback = 'LineEnd' },--DIALOG=<<Not yet. But maybe in a few years.>>

			{line = "/CAGE045FO/", group = 'z', maxPlays = -1, filterCode = 'maxInv', callback = 'LineEnd' },--DIALOG=<<What else can I do you for?>>

			{line = "/CAGE041RA/", group = 'i', maxPlays = -1, filterCode = 'Purchase', ownerOverride = Global.player },			--DIALOG=<<I\'ll take it!>>
			{line = "/CAGE042FO/", group = 'i', maxPlays = -1, filterCode = 'Purchase', nonHaltingCallBack = 'PurchaseLineEnd' },--DIALOG=<<Alrighty then. >>
			{line = "/CAGE045FO/", group = 'i', maxPlays = -1, filterCode = 'Purchase', callback = 'LineEnd' },--DIALOG=<<What else can I do you for?>>

			{line = "/CAGE041RA/", group = 'j', maxPlays = -1, filterCode = 'Purchase', ownerOverride = Global.player },--DIALOG=<<I\'ll take it!>>
			{line = "/CAGE043FO/", group = 'j', maxPlays = -1, filterCode = 'Purchase', nonHaltingCallBack = 'PurchaseLineEnd' },--DIALOG=<<Excellent choice!>>
			{line = "/CAGE045FO/", group = 'j', maxPlays = -1, filterCode = 'Purchase', callback = 'LineEnd' },--DIALOG=<<What else can I do you for?>>

			{line = "/CAGE041RA/", group = 'k', maxPlays = -1, filterCode = 'Purchase', ownerOverride = Global.player },--DIALOG=<<I\'ll take it!>>
			{line = "/CAGE044FO/", group = 'k', maxPlays = -1, filterCode = 'Purchase', nonHaltingCallBack = 'PurchaseLineEnd' },--DIALOG=<<Sold! To the big-headed kid with the gloves!>>
			{line = "/CAGE045FO/", group = 'k', maxPlays = -1, filterCode = 'Purchase', callback = 'LineEnd' },--DIALOG=<<What else can I do you for?>>

			{line = "/CAGE046RA/", group = 'l', maxPlays = -1, filterCode = 'CloseShop', ownerOverride = Global.player },--DIALOG=<<That\'s it for now.>>
			{line = "/CAGE047FO/", group = 'l', maxPlays = -1, filterCode = 'CloseShop' },--DIALOG=<<Alright. Go get more arrowheads and come back.>>
			{line = "/CAGE048FO/", group = 'l', maxPlays = -1, filterCode = 'CloseShop' },--DIALOG=<<Support your local merchants!>>
		
			{line = "/CALE005FO/", group = 'm', maxPlays = -1, filterCode = 'global.collectibles.MentalMagnet' },--DIALOG=<<Ahh, now here's something every young PSI Cadet needs.>>
		
		}
		%Ob.Parent.onSpawn(self)

		self.tIdleAnims = {
			Cook = {
				tAnimEvents = {
					scrape = { animName = 'cookScrape', minDuration = 3000, maxDuration = 8000 },
					flip = { animName = 'cookFlip', minDuration = 3000, maxDuration = 8000 },
				}
			}
		}

		local confusionReactTable = {
			{line = "/CAGD022FO/", group = 'a', maxPlays = -1},--DIALOG=<<Oooh-ooooh...>>
			{line = "/CAGD024FO/", group='a', maxPlays = -1},--DIALOG=<<This part of the forest is off limits! Now git!>>
		}

		self.fireStartTable = {
			{line = "/CAHH001FO/", group = 'a', maxPlays = -1}, --DIALOG=<<I will take out your intestines, fry 'em into hash browns, and sew 'em back into your body before you ever get the chance to try that again!>>
		
		}

		self.tPsiReactTable = {
			NewMoveMelee = {
				animToPlay = 'flinch', lineCode = self.punchedTableChef, bRandomCRH = 0
			},
			PsiBlast = {
				animToPlay = 'flinch', lineCode = self.punchedTableChef, bRandomCRH = 0
			},
			Squash = {
				animToPlay = 'jumpOn', preCallback = self.bounce, lineCode = self.punchedTableChef, bRandomCRH = 0
			},	
			Confusion = {
				animToPlay = 'ninjaConfusionLoop', loop = 1, lineCode = confusionReactTable
			},
			ConfusionDone = {
				animToPlay = 'ninjaConfusionEnd', loop = 0
			},
			TKPickup = {
				animToPlay = 'TKed', lineCode = "/CAGC022FO/", loop = 1 --DIALOG=<<Okay, that\'s funny. Now PUT ME DOWN.>>
			},
			TKRelease = {
				reset = 1
			},	 
			FireStart = {
				animToPlay = 'flinch', lineCode = self.fireStartTable
			},	  

		}
	end

	function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
		self.charName = 'FordCook_sayline'
		SetMaxViewDistance(self, 700)
		self.tItems[1] = FindScriptObject('CobwebDuster')
		self.tItems[2] = FindScriptObject('PSIBallColor')
		self.tItems[3] = FindScriptObject('MentalMagnet')
		self.tItems[4] = FindScriptObject('DreamFluff')
		self.tItems[5] = FindScriptObject('PSIChallengeCore')
		self.tItems[6] = FindScriptObject('DowsingRod')
		SetEntityCollideCylinder(self, 30, self.height)

		-- took out all the checks and placed them in the ShopController
		
        local shopEditVars = 'self.sShopKeeper = \''..self.Name..'\' self.iCamOrientVecX = \'0\' self.iCamOrientVecY = \'0\' self.iCamOrientVecZ = \'1\' self.sItemPositionLocatorName = \'shop\''
		self.rShopController = SpawnScript('Global.Props.ShopController', self.Name..'ShopController', shopEditVars, 0) 
		self.rShopController:setInventoryItems(self.tItems)
		self.rShopController.CAM_HEIGHT = 0
		self.rShopController.CAM_DIST = 150
		-- set up spatula prop
		self.spatula = SpawnScript('gen_proploader', 'Spatula', 'self.meshname=\'characters/characterprops/Janitor_Spatula.plb\'', 1) 
		AttachEntityToEntityBone(self.spatula, self, 'handJEndLf_1')
		self.spatula:setPosition(-0.008,0.013,0.036)
		self.spatula:setOrientation(-26.819,18.038,-1.406)

        self.rShopCRH = SpawnScript('Global.Util.CharResponseHandler',self.Name..'ShopCRH','',0)
		self.rShopCRH.owner = self
		self.rShopCRH.type=self.ALWAYS_SEQUENTIAL
		self.rShopCRH.bLinePriority = 1		
		self.rShopCRH:addDialog(self.tShopDialog)

		self:setRandomIdles(self.tIdleAnims, 1)
	end

	function Ob:stateCloseShop()
		-- Dialog Domain CAAC
		--STAGEDIRECTION= <<upon exit:>>		
		-- Dialog Domain CAQL
--		self:sayLine("/CAQL016FO/",0,1) --DIALOG=<<Now leave me alone. I'm cooking!>>
		self.rShopCRH:chatterStop()
		self.rShopCRH:setFilter('CloseShop')
		self.rShopCRH:chatterStart(1)
		self:setState(nil)
	end

--  G E N E R A L   F U N C T I O N S ********************************************

	function Ob:setUp()
		-- maybe start the dialog stuff here
		if (self.rShopController ~= nil) then			
			local result = self.rShopController:startShop(self.rCurrItem)
		end		
	end

--  M E S S A G E  H A N D L E R S ********************************************

	function Ob:onItem(itemName, from)		
		self:shutUp()
		self.rShopCRH:chatterStop()

		if (itemName == 'Button') then
			Global.cutsceneScript:runCutscene('Ford234ChefButton')
			self:setState(nil)
			return
		end
		
		local ob = FindScriptObject(itemName)
		if (ob) then
			%Ob.Parent.onItem(self, itemName, from)
		else
			local cutscenename = 'FordInteractionOne'
			if (Global:load('FordInteractionOneSeen') == 1) then
				if (Global:load('FordInteractionTwoSeen') == 1) then
					cutscenename = 'FordInteractionThree'
				else
					cutscenename = 'FordInteractionTwo'
				end
			end
			Global.levelScript.cutsceneScript:runCutscene(cutscenename)
		end
	end

	function Ob:onShopItemSelected(data, from)
		self.rCurrItem = FindScriptObject(data)
		if (self.rCurrItem and 	self.bInPurchaseDialog == 0) then
			self.rShopCRH:chatterStop()
			self.rShopCRH:setFilter(self.rCurrItem.Type)
			self.rShopCRH:chatterStart(1)
		end			
	end
	
	function Ob:onShopItemPurchaseRequest(data, from)
		GamePrint('got shop item purchse req '..GetGameTimeSecs())
		self.bInPurchaseDialog = 1
		self.rCurrItem = FindScriptObject(data)
		local price = self.rCurrItem:getPrice()
		local rank = self.rCurrItem:getRank()
		if (Global.player.stats.rank and Global.player.stats.rank < rank) then
			self.rShopCRH:chatterStop()
			self.rShopCRH:setFilter('noRank')
			self.rShopCRH:chatterStart(1)	
			self:sendMessage(self.rShopController, 'ConfirmPurchase', 'noRank')			
		elseif (Global.player.stats.arrowheads and Global.player.stats.arrowheads >= price) then -- enough arrowheads, sell
			-- check for max items player can carry					
			if self.rCurrItem.Type == 'global.collectibles.DreamFluff' or self.rCurrItem.Type == 'global.collectibles.PSIChallengeCore' then
				local num = 0
				if self.rCurrItem.Type == 'global.collectibles.DreamFluff' then
					num = Global:loadGlobal('DreamFluffsInInv')
				else
					num = Global.player.stats.coresInInv
				end
				num = num or 0
				if num >= self.rCurrItem.iNumDartCanCarry then
					AddTutorialBox("/CAZF021TO/")
					self.rShopCRH:chatterStop()
					self.rShopCRH:setFilter('maxInv')
					self.rShopCRH:chatterStart(1)	
					self:sendMessage(self.rShopController, 'ConfirmPurchase', 'MaxInv')			
				else
					self.rShopCRH:chatterStop()
					self.rShopCRH.type = self.CRH_ALWAYS_RANDOM
					self.rShopCRH:setFilter('Purchase')
					self.rShopCRH:chatterStart(1)
				end
			else
				self.rShopCRH:chatterStop()
				self.rShopCRH.type = self.CRH_ALWAYS_RANDOM
				self.rShopCRH:setFilter('Purchase')
				self.rShopCRH:chatterStart(1)	
			end
		else
			self.rShopCRH:chatterStop()
			self.rShopCRH:setFilter('noArrowheads')
			self.rShopCRH:chatterStart(1)
			self:sendMessage(self.rShopController, 'ConfirmPurchase', 'noArrow')			
		end	
	end

	function Ob:onShopClose(data, from)
		if (data and data == 'userexit') then
			self.bUserExit = 1
		end
		self:setState('CloseShop')
	end

	function Ob:onShopStart()
		self:setUp()
	end

	function Ob:onLineEnd()
		self.bInPurchaseDialog = 0
		self.rShopCRH.type=self.ALWAYS_SEQUENTIAL	
		self.rShopCRH:chatterStop()
		if self.rCurrItem then
			self:onShopItemSelected(self.rCurrItem.Name, self)
		end
	end

	function Ob:onPurchaseLineEnd()
		GamePrint('sending msg '..GetGameTimeSecs())
		self.rShopController:onConfirmPurchase('purchase')
	end

	function Ob:onAttemptedThievery()
		-- run cutscene
		Global.cutsceneScript:runCutscene('FordOpenShop')
	end
	
	return Ob

end
