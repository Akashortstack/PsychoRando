

function ShopItem(Ob)
	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.sItemUp = nil
		Ob.sItemDown = nil
		Ob.sItemLeft = nil
		Ob.sItemRight = nil
		Ob.rItemUp = nil
		Ob.rItemDown = nil
		Ob.rItemLeft = nil
		Ob.rItemRight = nil
		Ob.sItemDescription = '' -- Editable
		Ob.rPlayer = nil
		Ob.bSold = 0
		Ob.bUseDefaultUncollectedAnim = 0
		-- if the num stock is > 1, then it'll decrease inventory
		-- if the num stock is < 0, the infinite stock and it'll
		-- always spawn the item
		Ob.iNumStock = 1 -- Editable
		Ob.iPrice = 0 -- Editable
		Ob.iRank = 1 -- Editable
		Ob.Telekinesis = kTKBEHAVIOR_NONE
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		if (self.sItemUp) then
			self.rItemUp = FindScriptObject(self.sItemUp)
			if (Global.player:isInInventory(self.sItemUp) == 1) then
				self.rItemUp = nil
			end
		end

		if (self.sItemDown) then
			self.rItemDown = FindScriptObject(self.sItemDown)
			if (Global.player:isInInventory(self.sItemDown) == 1) then
				self.rItemDown = nil
			end
		end

		if (self.sItemLeft) then
			self.rItemLeft = FindScriptObject(self.sItemLeft)
			if (Global.player:isInInventory(self.sItemLeft) == 1) then
				self.rItemLeft = nil
			end
		end

		if (self.sItemRight) then
			self.rItemRight = FindScriptObject(self.sItemRight)
			if (Global.player:isInInventory(self.sItemRight) == 1) then
				self.rItemRight = nil
			end
		end
	end

	function Ob:bePickupable()
		%Ob.Parent.bePickupable(self)
		--edit to allow Cobweb Duster to have interestFX if randomized
		if self.bSold == 0 then
			self.interestFX:stop(1, 0, 1)
			self.interestFX = nil
		end
	end

	function Ob:onItem(itemName, from)
		if (self.bSold ~= 1) then -- stop! thief!!
			-- will fix
			self:sendWorldMessage('AttemptedThievery', 1000,self.Name,0)
		else			
			%Ob.Parent.onItem(self, itemName, from)
		end
	end
	
	function Ob:getItem(direction)
		if (direction == 'UP') then
			if IsDead(self.rItemUp) == 1 then
				self.rItemUp = nil
			end
			return self.rItemUp
		elseif (direction == 'DOWN') then
			if IsDead(self.rItemDown) == 1 then
				self.rItemDown = nil
			end
			return self.rItemDown
		elseif (direction == 'LEFT') then
			if IsDead(self.rItemLeft) == 1 then
				self.rItemLeft = nil
			end
			return self.rItemLeft
		elseif (direction == 'RIGHT') then
			if IsDead(self.rItemRight) == 1 then
				self.rItemRight = nil
			end
			return self.rItemRight
		else
			GamePrint('WARNING: You must pass in either UP DOWN LEFT or RIGHT.  Not: '..(direction or 'nil')..'.')
			return nil
		end	
	end
	
	function Ob:getItemDescription()
		return self.sItemDescription
	end

	function Ob:getItemExplanation()		
		if (self.sItemExplanation ~= nil) then
			return self.sItemExplanation
		else
			return nil
		end
	end	
	
	function Ob:setPrice(price)
		self.iPrice = price
	end

	function Ob:getPrice()
		return self.iPrice
	end		

	function Ob:getRank()
		return self.iRank
	end

	function Ob:sold()
		local newItem = nil
--		if (self.iNumStock == nil or self.iNumStock <= 0) then -- infinite inventory
		if (self.iNumStock and self.iNumStock > 0) then -- infinite inventory
			newItem = self
		else
			newItem = self:removeFromNeighbors()
		end
		return newItem
	end

	function Ob:removeFromNeighbors()
		local newItem
		if (self.rItemUp) then
			self.rItemUp:disconnect(self)
			newItem = self.rItemUp
		end
		if (self.rItemDown) then
			self.rItemDown:disconnect(self)
			newItem = self.rItemDown
		end
		if (self.rItemLeft) then
			self.rItemLeft:disconnect(self)
			newItem = self.rItemLeft
		end
		if (self.rItemRight) then
			self.rItemRight:disconnect(self)
			newItem = self.rItemRight
		end
		return newItem
	end
	
	function Ob:disconnect(item)
		if item == self.rItemUp then
			if self.rItemUp.rItemLeft and IsDead(self.rItemUp.rItemLeft) ~= 1 then
				self.rItemUp = self.rItemUp.rItemLeft
			elseif self.rItemUp.rItemRight and IsDead(self.rItemUp.rItemRight) ~= 1 then
				self.rItemUp = self.rItemUp.rItemRight
			else
				self.rItemUp = nil
			end
		elseif item == self.rItemDown then
			if self.rItemDown.rItemLeft and IsDead(self.rItemDown.rItemLeft) ~= 1 then
				self.rItemDown = self.rItemDown.rItemLeft
			elseif self.rItemDown.rItemRight and IsDead(self.rItemDown.rItemRight) ~= 1 then
				self.rItemDown = self.rItemDown.rItemRight
			else
				self.rItemDown = nil
			end
		elseif item == self.rItemLeft then
			self.rItemLeft = self.rItemLeft.rItemLeft
		elseif item == self.rItemRight then
			self.rItemRight = self.rItemRight.rItemRight
		end
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if self.bSold == 1 then
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

	function Ob:onNewMoveCollide(a, from, b, c)
		if self.bSold == 1 then
			%Ob.Parent.onNewMoveCollide(self, a, from, b, c)
		end
	end

	function Ob:setNeighbors(up, down, left, right)		
		self.rItemUp = up
		self.rItemDown = down
		self.rItemLeft = left
		self.rItemRight = right
	end

	function Ob:getSaveEditables()
		return %Ob.Parent.getSaveEditables(self)..'self.iNumStock = \''..self.iNumStock..'\' self.bSold = \''..self.bSold..'\' '
	end

	return Ob
	
end
