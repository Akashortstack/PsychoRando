function PropHelmet(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('Global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_HelicopterHelmet.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Helicopter Helmet"--DIALOG=<<Helicopter Helmet>>
		
		Ob.pickupSpriteName = 'MM_helihelmet'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_PilotHelmet.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		
		--edit remove
		--Ob.bAutoSelect = 1

		Ob.GmanPropName = 'Helmet'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'Chopper1'
		
		-- set up anims
		Ob.loopAnim = 'UsePilotHelmet'
		
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8011'
		
		Ob.propLine = "/MMAO016RA/"--DIALOG=<<Stop, helicopter! Land and let me in! I want to see the view from up there please!>>
	end

--  I N I T  **************************************************************************************
	
	function Ob:onClairvoyance(data, from)
		if Global.levelScript.bCanFindMilkman ~= 1 then
			Global.player:sayLine(self.propLine, 0, 1, nil, 1, nil, 1)--DIALOG=<<Stop, helicopter! Land and let me in! I want to see the view from up there please!>>
			SetControlHandler(kCONTROL_PLAYER)
		elseif Global:load('bChopperClairPlayed') ~= 1 then
			Global.cutsceneScript:runCutscene('ChopperClair', nil, 1)
			Global.goalManager:activate('Hideout')
		else
			Global.cutsceneScript:runCutscene('ChopperClairAgain',nil,nil,nil,nil,nil,nil,1)
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


