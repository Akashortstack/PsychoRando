function RandoOarsmansBadge(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')

		Ob.dependencies = {
			meshes = { 'Levels/CA_Campgrounds/Props/OarsmansBadge.plb' }
		}
		
	end	
	
	function Ob:onBeginLevel()

		self.meshName = 'Levels/CA_Campgrounds/Props/OarsmansBadge.plb'
        self.pickupSpritePath = 'Textures/icons/PsiPowers/Orsman.tga'
        self.displayName = "Oarsman's Badge"--DIALOG Oarsman's Badge, Needs Localization
        
		%Ob.Parent.onBeginLevel(self)
        --edit to fix scale and orientation
		self:setScale(15)
        self.mover:setOrientation(ApplyOrientation(0, 180, 90, self.mover:getOrientation()))

		--self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))

	end

	function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        self:setPosition(self:getPosInFrontOf(0, 0, -100))

	end

	function Ob:setPosition(x, y, z)
		%Ob.Parent.setPosition(self, x, y, z)
		if self.effect then
			self.effect:setPosition(self:getPosInFrontOf(0, 30))
		end
	end

	function Ob:setOrientation(x, y, z)
		%Ob.Parent.setOrientation(self, x, y, z)
		if self.effect then
			self.effect:setOrientation(self:getOrientation())
		end
	end

	function Ob:beginStatePickup()
		self:beNotPickupable()
	end

	function Ob:statePickup()

		--sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

        Global.player.invDisplayer:invItemAdded(self,0,0,nil,1)
        Global:saveGlobal('bGotOrsmansBadge', 1)
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