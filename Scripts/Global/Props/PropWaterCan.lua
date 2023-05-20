--
--  PropWaterCan.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function PropWaterCan(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_WaterCan.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Watering Can"	--DIALOG=<<Watering Can>>

		Ob.pickupSpriteName = 'MM_WateringCan'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_WaterCan.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'WaterCan'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanWaterCan1'
		
        -- set up anims
        Ob.loopAnim = 'UseWateringCan'
        
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8021'
        
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end

--**************************************************************************************************
	
	function Ob:onActivateFromInventory()
		local targ = GetLookTarget(Global.player)
		if (not is_subclass_of(targ, 'MM.Characters.GmanBase')) then
			Global.player:sayLine("/MMAJ007RA/", 0,1,nil,1)--DIALOG=<<I\'m watering!>>
		end
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


