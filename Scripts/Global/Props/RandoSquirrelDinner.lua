
function RandoSquirrelDinner(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Levels/CA_Campgrounds/Props/SquirrelDinner.plb'	-- Editable
        --edit
		Ob.displayName = "Squirrel Roast Dinner" --DIALOG=<<Squirrel Roast Dinner>> /CAZB001TO/
		Ob.pickupSpriteName = 'SquirrelDinner' -- Editable
		Ob.iTriggerSphereRadius = 50
		Ob.level = 'all'

        Ob.HeldPosX = -9.6;
		Ob.HeldPosY = -0.2;
		Ob.HeldPosZ = -2.88;
		Ob.HeldRotX = 97.13;
		Ob.HeldRotY = 2.691;
		Ob.HeldRotZ = -80.595;
        Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan'

		Ob.dependencies = {
			meshes = {
				'Levels/CA_Campgrounds/Props/SquirrelDinner.plb',
			},
		}
	end
	
-- **********************************************************************************************************
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
        --edit make a little bigger?
        self:setScale(1.5, 1.5, 1.5) 
        self:setState(nil)
	end
	
	function Ob:addToInventory(bHoldImmediately, bSilent)
        if (self.rMovementThread) then
			self.rMovementThread:killSelf()
		end
		self:beNotPickupable()
		self.player:addToInventory(self, (self.bAutoSelect == 1 and 1) or bHoldImmediately, bSilent)

		--edit make a sound!
		PlaySound(nil, LoadSound('YouWin'))
		
		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
		--edit save found
		Global:saveGlobal('bGotSquirrelDinner', 1)
		--edit open any closed teleports to CARE
		fso('TeleportManager'):OpenTeleportsToCARE()

		self:setState(nil)		

	end
	
	return Ob
end
