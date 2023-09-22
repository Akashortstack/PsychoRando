function Megaphone(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Characters/CharacterProps/TH_Megaphone.plb'
		Ob.iShooDist = 5000
		Ob.pickupSpriteName = 'TH_Megaphone'
		Ob.HeldPosX = 3.8
		Ob.HeldPosY = 8.2
		Ob.HeldPosZ = .3
		Ob.HeldRotX = -14.145
		Ob.HeldRotY = 339.044
		Ob.HeldRotZ = 21.248
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_TH_Megaphone.jan'
		Ob.tAllowableStates = { 'Stand', 'Movement', 'Idle General', 'Bubble Idle', 'Bubble Walk' }
		Ob.bUseOnly = 1
		Ob.displayName = '/GLZD600TO/'
 	end

--*************************************************************************************	
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.becky = FindScriptObject('Becky')
		self.rActivateSoundHandle = LoadSound('Megaphone')
	end

--*************************************************************************************	

	function Ob:stateDialog()
		Global.player:sayLine("/THBT007RA/", 1, 1, nil, 1, nil, 1 ) --<<Becky, can you hear me?
		Global.player:sayLine("/THBT009RA/", 1, 1, nil, 1, nil, 1 ) --<<Must be out of range.
		self:setState(nil)
	end
	
--*************************************************************************************

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

--*************************************************************************************	
	
	function Ob:onActivateFromInventory(data,from)
		if (Global.levelScript.Type == 'th.THMS') then
				if self.becky:distance(Global.player) > 3800 then
					self:setState('Dialog')
				else
					-- check allowable states
					local state = GetActionState(fso('Dart'))
					local bFound = 0
					for k, v in self.tAllowableStates do
						if state == self.tAllowableStates[k] then
							bFound = 1
							break
						end							
					end
					if (bFound == 1) then	
						self.becky:setState('SelectPlay')
					end
				end		
		end

	end
	
--*************************************************************************************	
	
	return Ob
end
