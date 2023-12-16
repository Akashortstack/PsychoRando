function PropPlunger(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Plunger.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Plunger" --DIALOG=<<Plunger>>

		Ob.pickupSpriteName = 'MM_Plunger'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Plunger.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable

		--edit remove
		--Ob.bAutoSelect = 1
		
		Ob.GmanPropName = 'Plunger'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanPlunger1'

		--edit removed because too shiny?
		--Ob.interestFXName = 'Global.Effects.SupremeInterestFX'
		
		-- set up anism
        Ob.loopAnim = 'UsePlunger_loop'
        
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8015'
		
		Ob.propLine = "/MMAJ004RA/"--DIALOG=<<I work in the sewers.>>
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
			--Plunger has been found.  Deactivate goal
			Global.goalManager:deactivate('Plunger')
			Global.goalManager:activate('Sewers')
		end]]
		self:show()

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

	end
	
--**************************************************************************************************


	return Ob
end


