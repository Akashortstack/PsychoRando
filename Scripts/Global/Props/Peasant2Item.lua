function Peasant2Item(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'levels/ww_waterlooworld/props/ww_PricelessCoin.plb'
		Ob.dependencies = {
			scripts = {	'Global.Effects.CollectFX', },
--			meshes = {  },
			--edit for icon texture(?)
			textures = { 'Textures/icons/InventoryItems/WW_PricelessCoin.dds', },	
		}
		--edit
		Ob.pickupSpriteName = 'WW_PricelessCoin'
		-- set up holding
		Ob.HeldPosX = 18.8 -- Editable
		Ob.HeldPosY = -7.5 -- Editable
		Ob.HeldPosZ = -2.6 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Priceless Coin"	--DIALOG=<<Priceless Coin>>

		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistLoosePalmUp_ArmLf.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		
        -- set up anims
        Ob.loopAnim = 'Priceless Coin'
        
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8021'
        
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end

--**************************************************************************************************
	
	function Ob:onActivateFail(data, from)
		if Global:load('bHousePeasantTwo1stTimePlayed') == 1 then
			Global.player:sayLine("/WWBY001RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<I should give this to that guy who will fight for money.>>
		else
			Global.player:sayLine("/WWBY002RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<I\'m saving this coin until I find someone who could really use the money.>>
		end
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


	
--**************************************************************************************************
	
	return Ob
end
