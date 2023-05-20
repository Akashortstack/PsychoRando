--*
--*              "MaxAmmoUp.lua"                
--*  
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*

function RandoAmmoUp(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Characters/MaxAmmoCapacity.plb'
		Ob.collSphereRadius = 20
		Ob.level = 'all'
		Ob.displayName = "/GLZB006TO/"--DIALOG=<<Ammo Up>>
		Ob.pickupSpriteName = 'MaxAmmoUp'
		Ob.interestFXName = 'Global.Effects.SupremeInterestFX'
		Ob.bDontPutAwayHeldItem = 1
	end	

	function Ob:onBeginLevel()
		--edit
		if Global.player.stats.RandoAmmoUp[self.Name] == 'collected' then
			self:killSelf()
		end

		%Ob.Parent.onBeginLevel(self)
	end

	--Override bePickupable because it attaches the interestFX in the wrong spot.
	function Ob:bePickupable()
		%Ob.Parent.bePickupable(self)
		self.interestFX:attach(self, GetRootJointName(self))
	end

	function Ob:statePickup()
		self:beNotPickupable()
		self:sendMessage(Global.player, 'MaxAmmoUp')
		CollectiblePickedUp(self)
		Global.player.invDisplayer:invItemAdded(self,0,0,nil,1,0)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoAmmoUp', self.Name, 1)

		self:killSelf()
	end

	function Ob:onItem(itemName, from)
		if (itemName == '') then
			self:setState('Pickup')
		end
	end
		
	return Ob
end
