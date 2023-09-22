function PropPhone(Ob)
	if not Ob then
		Ob = CreateObject('MM.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Phone.plb'

		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable       
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable
		--edit name, NEEDS LOCALIZATION
		Ob.displayName = "Phone" --DIALOG=<<Phone>>
		Ob.pickupSpriteName = 'MM_Phone'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Phone.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'Phone'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanPhone1'
		
		-- set up anims
		Ob.loopAnim = 'UsePhone'
		
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8013'
		
		Ob.propLine = "/MMAJ005RA/"--DIALOG=<<I am a skilled phone repairer.>>
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.ringSound = LoadSound('PhoneRing')
	end
	
--**************************************************************************************************
	
	function Ob:startRing()
		self:playSound(self.ringSound, 1, 0, 1)
	end
	
--**************************************************************************************************
	
	function Ob:stopRing()
		self:stopSound(self.ringSound)
	end


--**************************************************************************************************
	
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		self:stopRing()
		if (self.bReincarnated ~= 1) then
			if (Global:load('bPickUpPhonePlayed') ~= 1 and GetCurrentLevelName() == 'MMI2') then
				Global.cutsceneScript:runCutscene('PickUpPhone',nil,nil,nil,0,nil, nil, 1)
			end
		end
	end

--**************************************************************************************************


	return Ob
end


