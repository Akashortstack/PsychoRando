--
--  PropHedgeTrimmers.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function PropHedgeTrimmers(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_HedgeTrimmers.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Hedge Trimmers"--DIALOG=<<Hedge Trimmers>>
		
		Ob.pickupSpriteName = 'MM_Clippers'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_HedgeTrimmers.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'HedgeTrimmers'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanHedgeTrimmers1'
		
		-- set up anims
		Ob.startAnim = 'UseClippers_start'
		Ob.loopAnim = 'UseClippers_loop'
		Ob.endAnim = 'UseClippers_end'
		
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8012'
		
		Ob.propLine = "/MMAJ002RA/"--DIALOG=<<I like to trim hedges.>>
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end
	
--**************************************************************************************************

	-- SEE PROPBASE for other important parts of this state (begin, end)
	-- an override of this function is needed, because the prop also has an animation here
	function Ob:statePlayAnims()
		UnLoadPriorityAnim(Global.player, 1)	
		-- play start anim, if one exists
		if (self.startAnim) then
            LoadAnim(self, 'Anims/DartNew/Clippers_UseClippers_start.jan', .2, 0)
			LoadAnim(Global.player, self.path..self.startAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.startAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.startAnim..'.jan')
			end
		end
		-- play loop anim, if one exists
		if (self.loopAnim) then
            LoadAnim(self, 'Anims/DartNew/Clippers_UseClippers_loop.jan', .2, 0)
			LoadAnim(Global.player, self.path..self.loopAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.loopAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.loopAnim..'.jan')
			end
		end
		-- play end anim, if one exists
		if (self.endAnim) then
			LoadAnim(self, 'Anims/DartNew/Clippers_UseClippers_end.jan', .2, 0)
			LoadAnim(Global.player, self.path..self.endAnim..'.jan', .2, 0)
			local comp = GetAnimCompletion(Global.player, 0, self.endAnim..'.jan')
			while comp and comp < .9 and GetActionState(Global.player) == 'Stand' do
				Yield()
				comp = GetAnimCompletion(Global.player, 0, self.endAnim..'.jan')
			end
		end
		self:setState(nil)
	end

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
	
--**************************************************************************************************

	return Ob
end


