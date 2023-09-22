function Candle(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.bPlacedInLamp = 0
		Ob.meshName = 'levels/th_gloriasbrain/stageprops/Candle.plb'
		Ob.firestartResistance = 1
		Ob.fireStartY = 75
        
		--Ob.overrideJoint = 'spineJA_1'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Candle_spineJA_1.jan'
		Ob.pickupSpriteName = 'TH_candle'
        Ob.displayName = "/GLZB063TO/"	--DIALOG=<<Candle>>
	end

--  I N I T  **************************************************************************************
	
	function Ob:onBeginLevel()
		if (GetCurrentLevelName() == 'THCW' and Global:loadGlobal('bTHCompleted') == 1) then
			self:killSelf()
			return
		end
		%Ob.Parent.onBeginLevel(self)
		self:setEntityInterestLevel(kHELDOBJECT_INTEREST)
		SetEntityCollideSphere(self, 100, 0,100,0)
		self.hx,self.hy,self.hz = self:getPosition()
	end	
		
		
--**************************************************************************************
		
	function Ob:reset()
		if Global.player:isInInventory(self.Name) then
			Global.player:removeFromInventory(self)
		end
		if (self.bPlacedInLamp == 1) then
			DetachEntityFromParent(self)
			self.bPlacedInLamp = 0
		end
		self.firestartResistance = 1
		self:setPosition(self.hx,self.hy,self.hz)
		self:bePickupable()
		SetEntityVisible(self, 1)
	end
	
--**************************************************************************************
	
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		if (GetCurrentLevelName() == 'THFB') then
			Global:clearInventory(self)
		else
			--edit sendMessage to Dart
			self:sendMessage(Global.player, 'RandoProp', self.Name, 1)	
		end
		self:fireDissipate()	
		Global:save('bGotCandle', 1)
		--edit remove goalmanager stuff
		--[[if (Global.goalManager:isActive('FindCandle') == 1) then
			Global.goalManager:activate('LightCandle')
		end]]

		
	end
	
--**************************************************************************************
	
	return Ob
end
