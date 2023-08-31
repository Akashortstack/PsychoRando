--
--  PropRifle.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function PropRifle(Ob)
	if not Ob then
		Ob = CreateObject('MM.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Rifle.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable
		--edit name, NEEDS LOCALIZATION
		Ob.displayName = "Prop Rifle" --DIALOG=<<Prop Rifle>>
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
	
	return Ob
end


