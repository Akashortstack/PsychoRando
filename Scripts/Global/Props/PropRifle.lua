function PropRifle(Ob)
	if not Ob then

		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Rifle.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Rifle" --DIALOG=<<Rifle>>

		Ob.pickupSpriteName = 'MM_Rifle'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Rifle.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'Rifle'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanRifle1'
		
		-- set up anims
        Ob.loopAnim = 'UseRifle'
        
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8016'
        
		Ob.propLine = "/MMAJ006RA/"--DIALOG=<<It\'s fake. I\'m worried the other assassins are going to make fun of me.>>
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
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


