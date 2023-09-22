function PropBase(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		
        	-- custom player anims
		Ob.path = 'Anims/DartNew/'
		Ob.startAnim = nil
		Ob.loopAnim = nil
		Ob.endAnim = nil
		
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8010'
		Ob.playAnimTime = 7000
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		SetEntityGravityDir(self, GetEntityUp(self))
		%Ob.Parent.onBeginLevel(self)
	end
	
--**************************************************************************************************

	function Ob:onTimer(id)
		if (id == self.PLAY_ANIM_TIMER and self.bDisabled ~= 1) then
			if (Global.player.HeldItem == self.Name and Global.player:getActionState() == 'Stand' and not self.bProcessing) then
				self:killTimer(self.PLAY_ANIM_TIMER)
				self:setState('PlayAnims')
			end
		else
			%Ob.Parent.onTimer(self, id)
		end
	end
	
--**************************************************************************************************

	function Ob:beginStatePlayAnims()
		self.bProcessing = 1
		ResetIdleAnimationTimer(Global.player)
	end
	
	function Ob:statePlayAnims()
		UnLoadPriorityAnim(Global.player, 1)	
		-- play start anim, if one exists
		if (self.startAnim) then
            LoadAnim(Global.player, self.path..self.startAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.startAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.startAnim..'.jan')
			end
		end
		-- play loop anim, if one exists
		if (self.loopAnim) then
            LoadAnim(Global.player, self.path..self.loopAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.loopAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.loopAnim..'.jan')
			end
		end
		-- play end anim, if one exists
		if (self.endAnim) then
			LoadAnim(Global.player, self.path..self.endAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.endAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.endAnim..'.jan')
			end
		end
		self:setState(nil)
	end
	
	function Ob:endStatePlayAnims()
        LoadAnim(Global.player, 'Anims/DartNew/Listen.jan')

		self.bProcessing = nil
		self:createTimer(self.playAnimTime, self.PLAY_ANIM_TIMER)
		if (Global.player.HeldItem == self.Name) then 
			LoadPriorityAnim(Global.player, self.clutchAnim, 1, .05) 
		end
	end

--**************************************************************************************************

	function Ob:onRemovedFromInventory(data, from)
		self:setState(nil)
		self:killTimer(self.PLAY_ANIM_TIMER)
		%Ob.Parent.onRemovedFromInventory(self, data, from)
	end

--**************************************************************************************************

	function Ob:onActivateFromInventory(data, from)
		%Ob.Parent.onActivateFromInventory(self, data, from)
		-- say the prop line when you activate without a look entity
        if (not GetLookTarget(Global.player)) then 
			Global.player:sayLine(self.propLine, 0, 1, nil, 1) 
		end
	end
	
--**************************************************************************************************

	function Ob:onSelected()
		if (self.propLine and Global.cutsceneScript.cutscenePlaying ~= 1) then
			Global.player:sayLine(self.propLine, 0, 1, nil, 1)
		end

		self:createTimer(self.playAnimTime, self.PLAY_ANIM_TIMER)
	end

--**************************************************************************************************
	
	function Ob:onReplaced(data, from)
		self:setState(nil)
		self:killTimer(self.PLAY_ANIM_TIMER)

		if (%Ob.Parent.onReplaced) then %Ob.Parent.onReplaced(self, data, from) end
	end
								   
--**************************************************************************************************

	function Ob:xCanClairvoyOwner()
		if Global.levelScript.insideBasement ~= 1 then
			return %Ob.Parent.xCanClairvoyOwner(self)
		end
	end
	
--**************************************************************************************************

	function Ob:disableAnim()	
		self.bDisabled = 1
	end

--**************************************************************************************************

	function Ob:enableAnim()
		self.bDisabled = 0
	end

--**************************************************************************************************

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
	
	return Ob
end


