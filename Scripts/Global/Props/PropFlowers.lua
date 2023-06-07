--
--  PropFlowers.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function PropFlowers(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Flowers.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Flowers"--DIALOG=<<Flowers>>
		Ob.pickupSpriteName = 'MM_Flowers'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Flowers.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'Flowers'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanFlowers1'
		
		-- set up anims
		Ob.loopAnim = 'UseLillies'
		
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8011'
		
		Ob.propLine = "/MMAJ001RA/"--DIALOG=<<I am a grieving widow.>>
	end

--  I N I T  **************************************************************************************
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end
	
--**************************************************************************************************

	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		--edit remove goalmanager stuff
		--[[if (self.bReincarnated ~= 1) then
			--Now use the flower to get into the graveyard
			Global.goalManager:activate('Graveyard')
		end]]

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
		
	end

--**************************************************************************************************

	return Ob
end


