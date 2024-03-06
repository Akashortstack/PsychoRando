function APPlaceholder(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')

		Ob.dependencies = {
			meshes = { 'Characters/MeatCircus_Bunny.plb' }
		}
		Ob.collSphereRadius = 50
		
	end	
	
	function Ob:onBeginLevel()

		self.meshName = 'Characters/MeatCircus_Bunny.plb'

		--edit
		if Global.player.stats.APPlaceholder[self.Name] == 'collected' then
			self:killSelf()
		end
        
		%Ob.Parent.onBeginLevel(self)

		--edit to fix scale and orientation
		--SetScale(self, 1,1,1)
		--self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)

		--edit to add collect soundfx
		self.pickUpSound = LoadSound('ArrowheadPop')

        --edit to change Pickup Image and displayed item name

        self.pickupSpritePath = 'Textures/icons/InventoryItems/BrainJar.tga'
        self.displayName = "AP Item"

	end

	function Ob:beginStatePickup()
		self:beNotPickupable()
	end

	function Ob:statePickup()

        Global.player.invDisplayer:invItemAdded(self,0,0,nil,1,0)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'APPlaceholder', self.Name, 1)
		--edit for soundfx
		PlaySound(nil, self.pickUpSound)

		self:killSelf()
	end

	function Ob:onDestroyed(bBecause)
		%Ob.Parent.onDestroyed(self, bBecause)
		if self.effect and bBecause ~= 1 then
			self.effect:killSelf()
			self.effect = nil
		end
	end

	function Ob:onItem(itemName, from)
		self:setState('Pickup')
	end
	
	return Ob
end
