--*
--*              "MaxLivesUp.lua"                
--*  
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*

function RandoLivesUp(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'GlobalModels/CO_Collectibles/MaxLivesUp.plb'
		Ob.collSphereRadius = 20
		Ob.level = 'all'
		Ob.interestFXName = 'Global.Effects.SupremeInterestFX'
		Ob.displayName = "/GLZB008TO/"--DIALOG=<<Max Lives Increased!>>
--		Ob.displayName = "Maximum Projection Depth Increased!"--NEW temp dialog, but I dont want to put it in yet cause im not supposed to
		Ob.pickupSpriteName = 'MaxLivesUp'
		Ob.bDontPutAwayHeldItem = 1
	end	

	function Ob:onBeginLevel()

		--edit
		if Global.player.stats.RandoLivesUp[self.Name] == 'collected' then
			self:killSelf()
		end
	
		self.rCollectedSoundHandle = LoadSound('OneUp')
		%Ob.Parent.onBeginLevel(self)
	end

	--Override bePickupable because it attaches the interestFX in the wrong spot.
	function Ob:bePickupable()
		%Ob.Parent.bePickupable(self)
		self.interestFX:attach(self, GetRootJointName(self))
	end

	function Ob:statePickup()
		self:beNotPickupable()
		self:sendMessage(Global.player, 'MaxLivesUp')
		CollectiblePickedUp(self)
		Global.player.invDisplayer:invItemAdded(self,0,0,nil,1,0)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoLivesUp', self.Name, 1)

		self:killSelf()
	end

	function Ob:onItem(itemName, from)
		if (itemName == '') then
			self:setState('Pickup')
		end
	end
		
	return Ob
end
