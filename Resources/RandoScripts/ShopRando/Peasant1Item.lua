--      Note.lua
--  
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--     
--

function Peasant1Item(Ob)

	if (not Ob) then
		Ob = CreateObject('Global.Props.HeldObject')
		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Fred's Letter"--DIALOG=<<Fred\'s Letter>>

		Ob.meshName = 'Levels/WW_WaterlooWorld/Props/WW_FredsNote.plb'
		--edit remove
		--Ob.bAutoSelect=1
		Ob.pickupSpriteName = 'WW_FredsNote'  -- Editable
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistLoosePalmUp_ArmLf.jan'  -- Editable

		--edit Shop Variables

		-- SHOP STUFF
		Ob.iPrice = 0
		Ob.iNumStock = 1 -- Editable
		Ob.iRank = 1 -- Editable
		Ob.sItemDescription = "Fred's Note" --DIALOG=<<Fred's Note>>
		Ob.sItemExplanation = "Fred's Note" --DIALOG=<<Fred's Note>>
		Ob.tShopCamInfo = {
			x = 6220,
			y = 248,
			z = -6331,
			rx = 0, 
			ry = -165,
			rz = 0,
		}
		Ob.inShop = 0
		-- END SHOP STUFF
	end

	function Ob.onActivateFail(data, from)
		Global.player:sayLine("/WWBY000RA/", 0, 1, nil, 1, nil, 1) --<<I'm saving this note for that guy who thinks Fred doesn't care about him.>>--
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

	--edit removed to make Collectible
	--function Ob:onItem(itemName, from)
	--	%Ob.Parent.onItem(self, itemName, from)
	--	if itemName ~= '' and Global.player:getLookTarget() == nil then
	--		from:sendMessage(FindScriptObject(itemName), 'ActivateFail', self.Name)
	--	end
	--end	

	return Ob

end