function RandoMindUnlock(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')

		Ob.dependencies = {
			meshes = { 'GlobalModels/Objects/HeldObjects/brainPup.plb' }
		}
		Ob.collSphereRadius = 50
        Ob.interestFXName = 'Global.Effects.PsiPowerUpFX'

        Ob.pickupSpritePaths = {
            Coach = "Textures/ui/sayline heads/coach.dds",
            Sasha = "Textures/ui/sayline heads/sasha_sayline.dds",
            Milla = "Textures/ui/sayline heads/milla.dds",
            Linda = "Textures/ui/sayline heads/lungfish.dds",
            Boyd = "Textures/ui/sayline heads/boyd.dds",
            Gloria = "Textures/ui/sayline heads/gloria.dds",
            Fred = "Textures/ui/sayline heads/fred.dds",
            Edgar = "Textures/ui/sayline heads/edgar.dds",
            Oly = "Textures/ui/sayline heads/kidcoach.dds",
        }

        Ob.displayNames = {
            Coach = "Adult Coach's Mind",
            Sasha = "Sasha's Mind",
            Milla = "Milla's Mind",
            Linda = "Linda's Mind",
            Boyd = "Boyd's Mind",
            Gloria = "Gloria's Mind",
            Fred = "Fred's Mind",
            Edgar = "Edgar's Mind",
            Oly = "Kid Coach's Mind",
        }
		
	end	
	
	function Ob:onBeginLevel()

		self.meshName = 'GlobalModels/Objects/HeldObjects/brainPup.plb'

		--edit
		if Global.player.stats.APPlaceholder[self.Name] == 'collected' then
			self:killSelf()
		end
        
		%Ob.Parent.onBeginLevel(self)

		--edit to fix scale and orientation
		SetScale(self, 1.5,1.5,1.5)
		--self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)

		--edit to add collect soundfx
		self.pickUpSound = LoadSound('YouWin')

        --edit to change Pickup Image and displayed item name
        self.pickupSpritePath = self.pickupSpritePaths[self.Name]
        self.displayName = self.displayNames[self.Name]
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
        Global:saveGlobal('b'..self.Name..'mindfound', 1)

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

    function Ob:setPosition(x, y, z)
        y = y+100
		%Ob.Parent.setPosition(self, x, y, z)
        self.interestFX:setPosition(25, 0, 0)
	end
	
	return Ob
end
