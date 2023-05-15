--      ShopController.lua
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Kee Chi

function ShopController(Ob)

	if (Ob == nil) then
		Ob = CreateObject('ScriptBase')
		Ob.tItems = nil
		Ob.tItemsWithPosInfo = nil
		Ob.sItemPositionLocatorName = nil -- Editable
		Ob.tItemPositionLocators = nil
		Ob.sCameraPositionLocator = nil  -- Editable
		Ob.rCameraPositionLocator = nil
		Ob.bHaveCameraInfo = 0
		Ob.camX = nil
		Ob.camY = nil
		Ob.camZ = nil
		Ob.camRX = nil
		Ob.camRY = nil
		Ob.camRZ = nil
		Ob.rCurrItem = nil
		Ob.STICK_THRESH = 50
		Ob.DEFAULT_FOV = 150
		Ob.CAM_INTERP_TIME = 0.5
		Ob.CAM_DIST = 350
		Ob.CAM_HEIGHT = 220
		Ob.block = 1
		Ob.sShopKeeper = nil -- Editable
		Ob.rShopKeeper = nil
		Ob.rPlayer = nil
		Ob.rHelpTextHandle = nil
	       		
		if(GetLanguage() == 1 ) then
 			Ob.HELP_TEXT_X = 500
 			Ob.HELP_TEXT_Y = 350
 			Ob.HELP_TEXT2_X = 500
 			Ob.HELP_TEXT2_Y = 385
 			Ob.HELP_TEXT3_X = 500
 			Ob.HELP_TEXT3_Y = 420
 		else
			Ob.HELP_TEXT3_X = 470	 -- info       	        
 			Ob.HELP_TEXT3_Y = 380 
 			Ob.HELP_TEXT_X = 470	 -- select
 			Ob.HELP_TEXT_Y = 420
 			Ob.HELP_TEXT2_X = 470	 -- exit
 			Ob.HELP_TEXT2_Y = 460			       	     
 		       	
 		end

		Ob.DESC_TEXT_X = 100
		Ob.DESC_TEXT_Y = 90
		Ob.EXPLANATION_TEXT_X = 380
		Ob.EXPLANATION_TEXT_Y = 230
		Ob.ARROW_RIGHT_X = 550
		Ob.ARROW_LEFT_X = 60
		Ob.ARROW_LRY = 230
		Ob.ARROW_UD_X = 310
		Ob.ARROW_UP_Y = 30
		Ob.ARROW_DOWN_Y = 400
		Ob.ARROW_BOUNCE_INCREMENT = 7
		Ob.ARROW_BOUNCE_DURATION = 750
		Ob.levelScript = nil	
		Ob.rCamPathID = nil
		Ob.iCamOrientVecX = 0 -- Editable
		Ob.iCamOrientVecY = 0 -- Editable
		Ob.iCamOrientVecZ = 1 -- Editable
		Ob.bPreserveCam = 0
		Ob.rPlayerArrowHeadHandle = nil
		Ob.bPlayerHit = 0
		Ob.bShopEmpty = 0
		Ob.bUserExit = 0
		Ob.bSoldOut = 0

		Ob.TIMER_UI_FLASH = '3001'
		Ob.TIMER_UI_FLASH_END = '3001'
		
		Ob.PSICHALLENGE_COUNTER_X = 450
		Ob.PSICHALLENGE_COUNTER_Y = 230
		
		Ob.TIMER_UI_COUNTER = '3002'
		Ob.UI_COUNTER_TIME = 2300

		Ob.TIMER_UI_COUNTER_APPEAR = '3003'
		Ob.UI_COUNTER_APPEAR_TIME = 400

		Ob.rankTextLinecode = "/GLZG040TO/"--DIALOG=<<Rank:>>
		Ob.arrowheadTextLinecode = "/GLZG039TO/"--DIALOG=<</Arrowhead/>>
		Ob.buyTextLinecode = "/GLZG038TO/"--DIALOG=<</YBUTTON/ Buy>>
		Ob.exitTextLinecode = "/GLZG041TO/"--DIALOG=<</BBUTTON/ Exit>>
		Ob.explanationTextLinecode = "/GLZG045TO/"--DIALOG=<</BUTTON/ Exit>>
	
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'Global.OtherEntities.UIElement',
			},
		}
        end                                


	function Ob:onSpawn()
		self.tCamPath1Points = {}
		%Ob.Parent.onSpawn(self)
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.rPlayer = GetPlayerLSO()
		self.levelScript = FindScriptObject('LevelScript')
		if (self.sShopKeeper) then
			self.rShopKeeper = FindScriptObject(self.sShopKeeper)
		end
		if (self.sCameraPositionLocator ~= nil) then
			self.rCameraPositionLocator = FindScriptObject(self.sCameraPositionLocator)
			if (self.rCameraPositionLocator ~= nil) then
				self.bHaveCameraInfo = 1
				self.camX, self.camY, self.camZ = self.rCameraPositionLocator:getPosition()
				self.camRX, self.camRY, self.camRZ = self.rCameraPositionLocator:getOrientation()
			end
		end		
		self.rSaleSound = LoadSound('shop_purchase')
		self.rNegSound = LoadSound('Negative')
	end	

	function Ob:stateSetupShop()
--		self:dontRunPlayerControls(1)
		-- get the former cam FOV
		self.rPlayer:isInShop(self)		
		HideHUD(1)
		ShowHUDCollectible(1, 1)
		ShowHUDCollectible(2, 1)
		self.camFOV = GetCameraFieldOfView()
		if (GetCamera() == kCAMERA_SCRIPT) then
			self.bPreserveCam = 1
		else
			self.bPreserveCam = 0
			if ((self.levelScript) and (self.levelScript.camControl)) then
				self.levelScript.camControl:pushAndSetScript(self)
			else
				SetCamera(kCAMERA_SCRIPT)
			end
		end
		SetCameraFieldOfView(self.DEFAULT_FOV)
		-- set the camera position and orientation if the information was provided
		if (self.bHaveCameraInfo == 1) then
			SetCameraPosition(self.camX, self.camY, self.camZ)
			SetCameraOrientation(self.camRX, self.camRY, self.camRZ)
		end		
		-- show helpful display info
		self.rHelpTextHandle = DisplayText(self.buyTextLinecode, self.HELP_TEXT_X, self.HELP_TEXT_Y)
		self.rHelpTextHandle2 = DisplayText(self.exitTextLinecode, self.HELP_TEXT2_X, self.HELP_TEXT2_Y)
		--self:setState(nil) -- this is placed before the handler line to ensure this is set
		-- the right and left arrows
		if (not self.rRightArrowUIElement) then
			self.rRightArrowUIElement = SpawnScript('global.otherentities.UIElement', self.Name..'RightArrow')
		end
		self.rRightArrowUIElement:createSprite('Textures/UI/arrow.tga', self.ARROW_RIGHT_X, self.ARROW_LRY, nil, 0.75, 0.75, 180)
		self.rRightArrowUIElement:bounce(self.ARROW_BOUNCE_INCREMENT, 0, self.ARROW_BOUNCE_DURATION)
		self.rRightArrowUIElement:hide()
		if (not self.rLeftArrowUIElement) then
			self.rLeftArrowUIElement = SpawnScript('global.otherentities.UIElement', self.Name..'LeftArrow')
		end
		self.rLeftArrowUIElement:createSprite('Textures/UI/arrow.tga', self.ARROW_LEFT_X, self.ARROW_LRY, nil, 0.75, 0.75)
		self.rLeftArrowUIElement:bounce(-self.ARROW_BOUNCE_INCREMENT, 0, self.ARROW_BOUNCE_DURATION)
		self.rLeftArrowUIElement:hide()
		if (not self.rUpArrowUIElement) then
			self.rUpArrowUIElement = SpawnScript('global.otherentities.UIElement', self.Name..'UpArrow')
		end
		self.rUpArrowUIElement:createSprite('Textures/UI/arrow.tga', self.ARROW_UD_X, self.ARROW_UP_Y, nil, 0.75, 0.75, 90)
		self.rUpArrowUIElement:bounce(0, self.ARROW_BOUNCE_INCREMENT, self.ARROW_BOUNCE_DURATION)
		self.rUpArrowUIElement:hide()
		if (not self.rDownArrowUIElement) then			
			self.rDownArrowUIElement = SpawnScript('global.otherentities.UIElement', self.Name..'DownArrow')
		end
		self.rDownArrowUIElement:createSprite('Textures/UI/arrow.tga', self.ARROW_UD_X, self.ARROW_DOWN_Y, nil, 0.75, 0.75, 270)
		self.rDownArrowUIElement:bounce(0, -self.ARROW_BOUNCE_INCREMENT, self.ARROW_BOUNCE_DURATION)
		self.rDownArrowUIElement:hide()

		SetScriptControlHandler(self)	
		self:setState('ShowItem')
	end


	function Ob:stateShowItem()
		if (self.rCurrItem) then			
			local camx, camy, camz, camrx, camry, camrz = self:getCamInfo(self.rCurrItem)
			local currcamx, currcamy, currcamz = GetCameraPosition()
			local currcamrx, currcamry, currcamrz = GetCameraOrientation()
			-- delete any previous camera path
			if (self.rCamPathID) then
				DeleteCameraPath(self.rCamPathID)
			end
			-- create the camera path
			self.tCamPath1Points[0] = {xpos = currcamx, ypos = currcamy, zpos = currcamz, xang = currcamrx, yang = currcamry, zang = currcamrz, field_of_view = self.DEFAULT_FOV }
			self.tCamPath1Points[1] = {xpos = camx, ypos = camy, zpos = camz, xang = camrx, yang = camry, zang = camrz, field_of_view = self.DEFAULT_FOV }
			self.rCamPathID = CreateCameraPath(self.tCamPath1Points, self.CAM_INTERP_TIME, 0, 0)
			RunCameraPath(self.rCamPathID, 1)

			if (self.rHelpTextHandle) then
				RemoveText(self.rHelpTextHandle)
			end
			if (self.rHelpTextHandle2) then
				RemoveText(self.rHelpTextHandle2)
			end
			if (self.rHelpTextHandle3) then
				RemoveText(self.rHelpTextHandle3)
			end

			if (self.rDescUIElement) then
				self.rDescUIElement:changeText(self.rCurrItem:getItemDescription())
			else
				self.rDescUIElement = SpawnScript('global.otherentities.UIElement', self.Name..'Description')
				self.rDescUIElement:createText(self.rCurrItem:getItemDescription(), self.DESC_TEXT_X, self.DESC_TEXT_Y, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, 300)
			end
			if (self.CostUIElement) then
				self.CostUIElement:changeText(self.arrowheadTextLinecode .. ' ' .. self.rCurrItem.iPrice)
			else
				self.CostUIElement = SpawnScript('Global.OtherEntities.UIElement', self.Name..'PlayerArrowCount')
				self.CostUIElement:createText(self.arrowheadTextLinecode .. ' ' .. self.rCurrItem.iPrice, self.DESC_TEXT_X, self.DESC_TEXT_Y + 40)
			end
			self.rHelpTextHandle = DisplayText(self.buyTextLinecode, self.HELP_TEXT_X, self.HELP_TEXT_Y)
			self.rHelpTextHandle2 = DisplayText(self.exitTextLinecode, self.HELP_TEXT2_X, self.HELP_TEXT2_Y)
			if (self.rRankUIElement) then
				self.rRankUIElement:changeText(self.rankTextLinecode.. ' ' .. self.rCurrItem.iRank)
			else
				self.rRankUIElement = SpawnScript('Global.OtherEntities.UIElement', self.Name..'PlayerRankCount')
				self.rRankUIElement:createText(self.rankTextLinecode .. ' ' .. self.rCurrItem.iRank, self.DESC_TEXT_X, self.DESC_TEXT_Y + 65)
			end
			
			if (self.rCurrItem:getItemExplanation() ~= nil) then
				self.rHelpTextHandle3 = DisplayText(self.explanationTextLinecode, self.HELP_TEXT3_X, self.HELP_TEXT3_Y)
			else
				if (self.rHelpTextHandle3 ~= nil) then
					RemoveText(self.rHelpTextHandle3)
				end
			end

--			if (self.rPlayerArrowHeadHandle) then
--				RemoveText(self.rPlayerArrowHeadHandle)
--			end
			--self.rPlayerArrowHeadHandle = DisplayText('You have: '..self.rPlayer.stats.arrowheads, self.HELP_TEXT_X, self.HELP_TEXT_Y + 80)
			-- show the arrows
			local rightalpha = 0
			local leftalpha = 0	
			if (self.rCurrItem:getItem('RIGHT')) then 
				self.rRightArrowUIElement:show()
			else
				self.rRightArrowUIElement:hide()
			end
			if (self.rCurrItem:getItem('LEFT')) then 
				self.rLeftArrowUIElement:show()
			else
				self.rLeftArrowUIElement:hide()
			end
			if (self.rCurrItem:getItem('UP')) then 
				self.rUpArrowUIElement:show()
			else
				self.rUpArrowUIElement:hide()
			end
			if (self.rCurrItem:getItem('DOWN')) then 
				self.rDownArrowUIElement:show()
			else
				self.rDownArrowUIElement:hide()
			end
			if (self.rShopKeeper) then
				self:sendMessage(self.rShopKeeper, 'ShopItemSelected', self.rCurrItem.Name, 0)
			end

			-- set the glow on the item
			SetEntityAura(self.rCurrItem, 0, 255, 0, 255, 0.5)

			self:setState(nil)
		else		
			self:setState('CleanUp')
		end
		self.block = 0 -- unblock the selection mechanism
	end

	function Ob:endStateShowItem()
		-- to make sure that it's unblocked
		self.block = 0
	end


	function Ob:stateCleanUp()
		self.block = 1 -- make sure the shop is block until properly started
		if self.rCurrItem ~= nil then			
			-- turn glow off
			SetEntityAura(self.rCurrItem, 0, 0, 0, 0, 0.2)
		end
		
		self.rPlayer:isInShop(nil)
		self:restorePreviousItem()
		
		if (self.camFOV) then
			SetCameraFieldOfView(self.camFOV)
		end
		-- cleanup the help text
		if (self.rDescUIElement) then
			self.rDescUIElement:hide()
		end
		if (self.rHelpTextHandle) then
			RemoveText(self.rHelpTextHandle)
		end
		if (self.rHelpTextHandle2) then
			RemoveText(self.rHelpTextHandle2)
		end
		if (self.rHelpTextHandle3) then
			RemoveText(self.rHelpTextHandle3)
		end
		if (self.CostUIElement) then
			self.CostUIElement:hide()
		end
		if (self.rRankUIElement) then
			self.rRankUIElement:hide()
		end
--		if (self.rPlayerArrowHeadHandle) then
--			RemoveText(self.rPlayerArrowHeadHandle)
		--		end
		HideHUD(0)
		ShowHUDCollectible(1, 0)
		ShowHUDCollectible(2, 0)

		self.rRightArrowUIElement:hide()
		self.rLeftArrowUIElement:hide()
		self.rUpArrowUIElement:hide()
		self.rDownArrowUIElement:hide()

--		if (self.levelScript and self.levelScript.camControl and self.bPreserveCam ~= 1) then
		if (self.bPreserveCam ~= 1) then
			if (self.levelScript and self.levelScript.camControl) then
				self.levelScript.camControl:removeCam(self)
			else
				SetCamera(kCAMERA_CHASE)
			end
		end
		-- close shop
		if (self.rShopKeeper) then
			local arg = ''
			if (self.bUserExit == 1) then
				arg = 'userexit'
			end
			if (not self.rCurrItem) then
				arg = 'empty'
			end
			if (self.bPlayerHit == 1) then
				arg = 'playerhit'
				self.bPlayerHit = 1
			end
			self:sendMessage(self.rShopKeeper, 'ShopClose', arg, 0)
			self.bUserExit = 0
		end	
		SetControlHandler(kCONTROL_PLAYER)
		self:setState(nil)
	end

	function Ob:statePurchaseItem()
		if (self.rCurrItem) then
			if (not self.rShopKeeper) then
				-- default if there's not shopkeeper
				local price = self.rCurrItem:getPrice()	
				if (self.rPlayer.stats.arrowheads and self.rPlayer.stats.arrowheads >= price) then -- enough arrowheads, sell
					self:sellCurrentItem()
				else
					Global.player:sayLine("/CAGE033RA/", 1, 1, nil, 1, nil, 1 )--DIALOG=<<I don\'t have enough arrowheads for that!>>
					FindScriptObject('Ford'):sayLine("/CAGE034FO/", 1, 0, nil, 1, nil, 1 )--DIALOG=<<Well then, quit lookin\' at it!>>
					self:setState(nil)
				end
				self.block = 0
			else
				-- send the owner the message
				self.rShopKeeper:onShopItemPurchaseRequest(self.rCurrItem.Name)
				self:setState(nil)
				self.block = 1
			end
		else
			self.block = 0
		end
	end

	function Ob:stateSell()
		self:sellCurrentItem()
		self:setState(nil)
	end

	function Ob:onActivateScriptController()
	end


	function Ob:onDeactivateScriptController()
	end

	function Ob:onConfirmPurchase(data, from)
		GamePrint('recieving msg '..GetGameTimeSecs())
		if (data == 'purchase') then -- purchased
			self:sellCurrentItem()
		elseif (data == 'noArrow') then
			self:playSound(self.rNegSound, 0, 0, 1)
			self:insuffArrow()
			self:setState('ShowItem')
		elseif (data == 'noRank') then
			self:playSound(self.rNegSound, 0, 0, 1)
			self:insuffRank()
			self:setState('ShowItem')
		else
			self:setState('ShowItem')
		end
	end

	function Ob:insuffArrow()
		if self.CostUIElement then
			self.CostUIElement:flashTextColor(255, 0, 0, 1000)
		end
	end

	function Ob:insuffRank()
		if self.rRankUIElement then
			self.rRankUIElement:flashTextColor(255, 0, 0, 1000)
		end
	end

	function Ob:onResumeShop(data, from)
		self:setState('ShowItem')
	end
	
	function Ob:onRazHurt()
		self.bPlayerHit = 1
		self:setState('CleanUp')
	end

	function Ob:handleScriptControls(iControl)
	
		if ( iControl == nil ) then
			iControl = ControlTable -- default to global value to make invocation from engine easier
		end
		-- Check for the Y button being pressed
		-- If it is then exit back to the player control handler
		if (self.block == 0) then
			if(abs(iControl.side) > self.STICK_THRESH) then 
				self.block = 1
				if (iControl.side > 0) then
					self:scrollToItem('RIGHT')					
				else
					self:scrollToItem('LEFT')
				end
			elseif (abs(iControl.forward) > self.STICK_THRESH) then 
				self.block = 1
				if (iControl.forward > 0) then
					self:scrollToItem('DOWN')					
				else
					self:scrollToItem('UP')
				end
			elseif (iControl.button_pressed.JOY_Y == 1) then
				self.block = 1
				self:setState('PurchaseItem')				
			elseif (iControl.button_pressed.JOY_X == 1) then
				if (self.rCurrItem:getItemExplanation() ~= nil) then				
					--We will assume that any pickup sprite for inventory items will get preloaded elsewhere (crosses fingers)
					if (self.rCurrItem.pickupSpriteName and self.rCurrItem.pickupSpriteName ~= 'Unnamed Object') then
						GamePrint(self.rCurrItem.pickupSpriteName)
						Global.levelScript:addTutorialBox(self.rCurrItem:getItemExplanation(), 'Textures/icons/InventoryItems/' .. self.rCurrItem.pickupSpriteName .. '.tga')
					else
						Global.levelScript:addTutorialBox(self.rCurrItem:getItemExplanation())
					end
				end
			elseif (iControl.button_pressed.JOY_B == 1) then 
				self.bUserExit = 1
				self:setState('CleanUp')
			end
		end
	end


	function Ob:startShop(item)		
		if (self.rCurrItem) then
			if (item) then
				self.rCurrItem = item
			end
			self:setState('SetupShop')
			return 1
		else
			return nil
		end
	end

	function Ob:closeShop(userexit)
		if (userexit and userexit == 1) then
			self.bUserExit = 1
		end
		self:setState('CleanUp')
	end

	function Ob:setCameraInformation(x, y, z, rx, ry, rz)
		if (x and y and z and rx and ry and rz) then -- make sure nothing is nil
			self.bHaveCameraInfo = 1
			self.camX = x
			self.camY = y
			self.camZ = z
			self.camRX = rx
			self.camRY = ry
			self.camRZ = rz
		end
	end

	function Ob:setItemZoomInformation(x, y, z)
		if (x and y and z) then -- make sure nothing is nil
			self.bHaveZoomLocationInfo = 1
			self.zoomX = x
			self.zoomY = y
			self.zoomZ = z
		end
	end

	function Ob:setInventoryItems(items)		
		self.tItems = items
		-- set the first item on the table to be the first item selected		
		local maxn = 0
		maxn, self.rCurrItem = next( self.tItems )

		--gather data that would require other stateInits to be called already
		self:setPositionTable() -- initialize the position table
		self:setItemPosition() -- set the items to have the right positions
	end

	function Ob:setPositionTable(position)
		if (position) then
			self.tItemPositionLocators = position
		else
			if (self.sItemPositionLocatorName) then
				self.tItemPositionLocators = self:getWayPointTable(self.sItemPositionLocatorName)
			end
		end
	end

	function Ob:restorePreviousItem()
		-- put the item that was on the screen back to it's original position
		if (self.prevX and self.prevY and self.prevZ and self.rPrevItem) then				
			-- temp, will put in smooth translation
			--self.rPrevItem:setPosition(self.prevX, self.prevY, self.prevZ)
			self.rPrevItem:moveToPos(self.prevX, self.prevY, self.prevZ, self.ZOOM_TIME)
		end
	end
	
	function Ob:scrollToItem(direction)
		-- check to see if the direction given is allowed
		if (direction and self.rCurrItem) then			
			local rNewItem = self.rCurrItem:getItem(direction)
			if (rNewItem ~= nil) then
				-- turn glow off
				SetEntityAura(self.rCurrItem, 0, 0, 0, 0, 0.5)
				self.rCurrItem = rNewItem
				self:setState('ShowItem')
			else
				self.block = 0
			end
		end
	end

	function Ob:sellCurrentItem()
		-- charge the player
		local soldItem = self.rCurrItem
		local purchasePrice = soldItem:getPrice()
		local price = soldItem:getPrice()
		--UI_AdjustCollectible('arrowhead', (0 - price), self)
		price = '-'..price
		SendMessage(self.rPlayer, self.rPlayer, 'Arrowhead', price, 0)
		self:playSound(self.rSaleSound, 0, 0, 1)
		self.prevX = nil
		self.prevY = nil
		self.prevZ = nil
		self.rPrevItem = nil
		if (soldItem.Type == 'global.collectibles.PSIChallengeCore') then
			self.iNumToShow = Global.player.stats.coresInInv + 1
			self:queueUpInvNumDisplay()
		elseif (soldItem.Type == 'global.collectibles.DreamFluff') then
			self.iNumToShow = Global:loadGlobal('DreamFluffsInInv')
			self.iNumToShow = self.iNumToShow or 0
			self.iNumToShow = self.iNumToShow + 1
			self:queueUpInvNumDisplay()
		end
		-- show the price
		if ((soldItem.iNumStock) and ((soldItem.iNumStock > 1) or (soldItem.iNumStock < 0))) then			
			-- spawn a new item
			local type = soldItem.Type			
			local num = abs(soldItem.iNumStock)
			local spawneditem = SpawnScript(soldItem.Type,soldItem.Name..num,'',1)
			soldItem.iNumStock = soldItem.iNumStock - 1
			self.rPlayer:addToInventory(spawneditem, 0)
			spawneditem.bSold = 1
			SetMaxViewDistance(spawneditem, 0)
		else
			soldItem.bSold = 1
			SetMaxViewDistance(soldItem, 0) -- temp
			soldItem.iNumStock = soldItem.iNumStock - 1
			local newItem = soldItem:sold()
			self.rPlayer:addToInventory(soldItem, 0)
			self.rCurrItem = newItem
			if (self.rCurrItem == nil) then
				self.bShopEmpty = 1
			end
		end
		self:setState('ShowItem')
		if purchasePrice ~= 0 then
			if date("%m/%d") == "12/05" then
				GamePrint("If this were ExxMas, you'd have an achievement")
			elseif date("%m/%d") == "12/25" then
				UnlockAchievement('ACH_CHRISTMAS')
			end
		end
	end

	function Ob:getWayPointTable(prefix)
		local col = 1
		local row = 1
		local waypoint = nil
		local waypointTable = {}
		if (prefix and prefix ~= '') then
			while 1 do 
				col = 1
				-- iterate through the rows
				waypoint = FindScriptObject(prefix..'row'..row..'col'..col, 1)
				if not waypoint then break end
				waypointTable[row] = {}
				while 1 do
					-- iterate through the cols
					waypoint = FindScriptObject(prefix..'row'..row..'col'..col, 1)
					if not waypoint then break end
					waypointTable[row][col] = waypoint
					col = col + 1
				end			
				row = row + 1
			end
		end
		if (getn(waypointTable) == 0) then
			waypointTable = nil
		end
		return waypointTable
	end

	-- TODO!!!  Need to do better reconnections for multiple rows!!!!!

	function Ob:setItemPosition()
		if (self.tItems and self.tItemPositionLocators) then
			-- go through all the items
			local maxrow = getn(self.tItemPositionLocators)
			local maxitems = getn(self.tItems)
			local row = 1
			local col = 1
			local maxcol = getn(self.tItemPositionLocators[row])
			local i = 1
			self.tItemsWithPosInfo = {}
			self.tItemsWithPosInfo[row] = {} -- initialize the first row
			for i = 1, maxitems do
				if (self.tItems[i]) then
					-- add to the table
					if (col > maxcol) then -- go to the next row
						row = row + 1
						maxcol = getn(self.tItemPositionLocators[row])
						if (maxcol > 0) then
							self.tItemsWithPosInfo[row] = {}
						end
						col = 1
					end
					self.tItemsWithPosInfo[row][col] = self.tItems[i]
					self.tItems[i].rPosLocator = self.tItemPositionLocators[row][col]
					col = col + 1
				end
			end
			
--			for row = 1, maxrow do				
--				maxcol = getn(self.tItemPositionLocators[row])			
--				self.tItemsWithPosInfo[row] = {}
--				for col = 1, maxcol do
--					if (self.tItems[i]) then
--						self.tItemsWithPosInfo[row][col] = self.tItems[i]
--						i = i + 1
--					else
--						break
--					end
--				end
--				if (i >= maxitems) then
--					break
--				end
--			end
			-- set the right left up and down pointers
			maxrow = getn(self.tItemsWithPosInfo)
			local left = nil
			local right = nil
			local up = nil
			local down = nil
			for row = 1, maxrow do
				maxcol = getn(self.tItemsWithPosInfo[row])
				for col = 1, maxcol do
					left = nil
					right = nil
					up = nil
					down = nil
					-- set the up
					if (row > 1) then
						up = self.tItemsWithPosInfo[row - 1][col]
					end
					-- set the down
					if (row < maxrow) then
						down = self.tItemsWithPosInfo[row + 1][col]
					end
					-- set the left
					if (col > 1) then
						left = self.tItemsWithPosInfo[row][col - 1]
					end
					if (col < maxcol) then
						right = self.tItemsWithPosInfo[row][col + 1]
					end
					self.tItemsWithPosInfo[row][col]:setNeighbors(up, down, left, right)
				end
			end

			-- disconnect and remove all bought items
			for i = 1, maxitems do
				if (self.tItems[i]) then
					-- check to see if in inventory
					if self.tItems[i].Type == 'global.collectibles.MentalMagnet' then
						if Global:loadGlobal('bHasMentalMagnet') == 1 then
							self.tItems[i]:removeFromNeighbors()
							self.tItems[i]:killSelf()
							self.tItems[i] = nil
						end
					elseif self.tItems[i].Type == 'global.collectibles.PSIBallColor' then
						if Global:loadGlobal('bCanChangePSIBallColor') == 1 then
							self.tItems[i]:removeFromNeighbors()
							self.tItems[i]:killSelf()
							self.tItems[i] = nil
						end
					else
						if Global.player:isInInventory(self.tItems[i].Name) == 1 then
							if self.tItems[i].removeFromNeighbors then
								self.tItems[i]:removeFromNeighbors()
							end
							self.tItems[i] = nil
						end
					end
				end
			end

			local temp = 0
			temp, self.rCurrItem = next( self.tItems )
		end
	end


	function Ob:getCamInfo(item)
		if (item) then
			local x, y, z, rx, ry, rz
			if (item.tShopCamInfo) then
				return item.tShopCamInfo.x, item.tShopCamInfo.y, item.tShopCamInfo.z, item.tShopCamInfo.rx, item.tShopCamInfo.ry, item.tShopCamInfo.rz
			end
			if (item.rPosLocator) then
				GamePrint('getting pos from locator')
				x, y, z = item.rPosLocator:getPosition()
				rx, ry, rz = item.rPosLocator:getOrientation()				
			else
				x, y, z = item:getPosition()
				rx, ry, rz = item:getOrientation()
			end
			-- get the position
			local vx, vy, vz
			if (item.rPosLocator) then
				vx, vy, vz = GetEntityOrientationVector(item.rPosLocator, self.iCamOrientVecX,self.iCamOrientVecY,self.iCamOrientVecZ)				
			else 
				vx, vy, vz = GetEntityOrientationVector(item, self.iCamOrientVecX,self.iCamOrientVecY,self.iCamOrientVecZ)
			end
			x = x + (vx * self.CAM_DIST)
			y = y + self.CAM_HEIGHT
			z = z + (vz * self.CAM_DIST)
			-- set the right orientation
			--ry = ry + 180
			-- return the vals
			return x, y, z, rx, ry, rz			
		else 
			return nil
		end
	end

	function Ob:onTimer(id)
		if (id == self.TIMER_UI_FLASH) then
			self:adjSprite()
		elseif (id == self.TIMER_UI_FLASH_END) then
			self:killTimer(self.TIMER_UI_FLASH_END)		
			self:resetSprite()
		elseif (id == self.TIMER_UI_COUNTER) then
			self:clearNum()
			self:killTimer(self.TIMER_UI_COUNTER)
		elseif (id == self.TIMER_UI_COUNTER_APPEAR) then
			if self.iNumToShow then
				self:showInvNumber(self.iNumToShow)
				self.iNumToShow = nil
			end
			self:killTimer(self.TIMER_UI_COUNTER_APPEAR)
		end
		%Ob.Parent.onTimer(self, id)
	end

	function Ob:queueUpInvNumDisplay()
		self:createTimer(self.UI_COUNTER_APPEAR_TIME, self.TIMER_UI_COUNTER_APPEAR)
	end

	function Ob:showInvNumber(num)
		if (not self.tCounterNumHandles) then
			self.tCounterNumHandles = {}
		end
		self:showNum(num, self.PSICHALLENGE_COUNTER_X, self.PSICHALLENGE_COUNTER_Y, self.tCounterNumHandles)
		self:createTimer(self.UI_COUNTER_TIME, self.TIMER_UI_COUNTER)
	end

	function Ob:showNum(num, x, y, tHandles)
		local digit = 0
		-- clear the sprites out
		for k, v in tHandles do
			if (tHandles[k]) then
				RemoveSprite(tHandles[k])
			end
		end
		-- show the tens
		if (num >= 10) then
			digit = floor(num / 10)
			tHandles[1] = AddSpriteHandle('Textures/hud/Number_'..digit..'.tga', x, y, 1, 1, 1, nil, nil, 1)
		end
		-- show the ones
		digit = num - (digit * 10)
		tHandles[2] = AddSpriteHandle('Textures/hud/Number_'..digit..'.tga', x + 12, y, 1, 1, 1, nil, nil, 1)
	end

	function Ob:clearNum()
		if self.tCounterNumHandles then 
			for k, v in self.tCounterNumHandles do
				if (self.tCounterNumHandles[k]) then
					RemoveSprite(self.tCounterNumHandles[k])
					self.tCounterNumHandles[k] = nil
				end
			end
		end
	end

	function Ob:setState(state)
		%Ob.Parent.setState(self, state)
		state = state or 'nil'
		GamePrint('going to state '..state)
		StackTrace()
	end

	--edit to inject custom shop items
	function Ob:RandoShopSetup()
		-- set the first item on the table to be the first item selected		
		local maxn = 0
		maxn, self.rCurrItem = next( self.tItems )

		--gather data that would require other stateInits to be called already
		self:setPositionTable() -- initialize the position table
		self:setItemPosition() -- set the items to have the right positions
	end

	return Ob
	
end
