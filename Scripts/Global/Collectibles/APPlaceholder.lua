function APPlaceholder(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')

		Ob.dependencies = {
			meshes = { 'Characters/MeatCircus_Bunny.plb', 
					   'APModels/apitem.plb',
					   'APModels/apitem_present.plb', }
		}
		Ob.collSphereRadius = 50
		
	end	
	
	function Ob:onBeginLevel()
		--[[check for AP Item model settings
		0 = Archipelago
		1 = Classic (bunny)
		2 = Present
		Can always add more custom models in the future!
		]]
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.apItemModel == 1 then
			self.meshName = 'Characters/MeatCircus_Bunny.plb' --classic bunny model
		elseif seedsettings.apItemModel == 2 then
			self.meshName = 'APModels/apitem_present.plb' --christmas present model
		else
			self.meshName = 'APModels/apitem.plb' --default to Archipelago Logo Model
		end

		if Global.player.stats.APPlaceholder[self.Name] == 'collected' then
			self:killSelf()
		end
        
		%Ob.Parent.onBeginLevel(self)

		SetEntityAmbientLight(self, 0.8, 0.8, 0.8)


		--edit to fix scale and orientation
		--SetScale(self, 1,1,1)
		--self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)

		--collect soundfx
		self.pickUpSound = LoadSound('ArrowheadPop')

        --Pickup Image and displayed item name
        self.pickupSpritePath = 'Textures/Objects/AP_Symbol.dds'
        self.displayName = "AP Item"

	end

	function Ob:beginStatePickup()
		self:beNotPickupable()
	end

	function Ob:statePickup()

        Global.player.invDisplayer:invItemAdded(self,0,0,nil,1,0)

		--sendMessage to Dart
		self:sendMessage(Global.player, 'APPlaceholder', self.Name, 1)
		--soundfx
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
