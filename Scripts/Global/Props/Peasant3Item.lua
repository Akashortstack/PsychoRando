--      Rifle.lua
--  
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--     
--

function Peasant3Item(Ob)

	if (not Ob) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.displayName = "/GLZB052TO/"--DIALOG=<<Musket>>
		Ob.meshName = 'levels/ww_waterlooworld/props/ww_gun.plb' -- Editable
        Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan'
		Ob.pickupSpriteName = 'WW_Gun copy'  -- Editable
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Rifle.jan' -- Editable
		Ob.HeldPosX = 1.9
		Ob.HeldPosY = 0.2
		Ob.HeldPosZ = -58.5
	end

	function Ob:onActivateFail(data, from)
		Global.player:sayLine("/WWBY003RA/", 0, 1, nil, 1, nil, 1) --<<What good is this musket! It's not even loaded?>>--
	end

	function Ob:onActivateFromInventory(data, from)
		local target = Global.player:getLookTarget()
		if target and target.tItemNamesWithInteraction and target.tItemNamesWithInteraction[self.Name] then
			-- do nothing, there's interaction
			return
		else
			self:onActivateFail()
		end
	end

	--edit
	function Ob:addToInventory(bHoldImmediately, bSilent)
        if (self.rMovementThread) then
			self.rMovementThread:killSelf()
		end
		self:beNotPickupable()
		self.player:addToInventory(self, (self.bAutoSelect == 1 and 1) or bHoldImmediately, bSilent)
		--self:setVelocity(0, 0, 0)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

		self:setState(nil)
	end

	--edit removed to make Collectible
	--function Ob:onItem(itemName, from)
	--	%Ob.Parent.onItem(self, itemName, from)		
	--	if itemName ~= '' and Global.player:getLookTarget() == nil then
	--		from:sendMessage(FindScriptObject(itemName), 'ActivateFail', self.Name)
	--	end
	--end	

	return Ob

end
