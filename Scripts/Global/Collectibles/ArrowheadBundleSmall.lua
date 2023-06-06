--*
--*              "ArrowheadBundleSmall.lua"                
--*  
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*

function ArrowheadBundleSmall(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		--edit value for amount of arrowheads given
		Ob.value = 25

		Ob.dependencies = {
			meshes = { 'Characters/MentalArrowhead.plb' }
		}
		Ob.collSphereRadius = 50
		
	end	
	
	function Ob:onBeginLevel()

		self.meshName = 'Characters/MentalArrowhead.plb'

		--edit
		if Global.player.stats.ArrowheadBundleSmall[self.Name] == 'collected' then
			self:killSelf()
		end
        
		%Ob.Parent.onBeginLevel(self)

		--edit to fix scale and orientation
		SetScale(self, 0.5,0.5,0.5)
		self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)
	end

	function Ob:onPostBeginLevel()
		
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
		--edit
		UI_AdjustCollectible('arrowhead', self.value, self)
		SendMessage(self, self.player, 'Arrowhead', self.value)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'ArrowheadBundleSmall', self.Name, 1)

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
