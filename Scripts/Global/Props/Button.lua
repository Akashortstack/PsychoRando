function Button(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		
        --edit name, needs localization
		
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan'
		Ob.HeldPosX = 13
		Ob.HeldPosY = 4
		Ob.HeldPosZ = .5
		Ob.HeldRotX = 88.701
		Ob.HeldRotY = 0
		Ob.HeldRotZ = 0
		Ob.pickupSpriteName = 'GPC_Button'		
		Ob.collSphereRadius = 30

		Ob.dependencies = {
			meshes = {
				'Characters/CharacterProps/Raz_GPCButton.plb',
			},
			
		}
	end

    function Ob:onBeginLevel()
        --edit
        self.meshName = 'Characters/CharacterProps/Raz_GPCButton.plb'
        self.pickupSpritePath = 'Textures/icons/InventoryItems/GPC_Button.tga'
        self.displayName = "Button"--DIALOG=<<Sasha\'s Button>>
		
        %Ob.Parent.onBeginLevel(self)
		self:setScale(3)
    end

    function Ob:setPosition(x, y, z)
		%Ob.Parent.setPosition(self, x, y, z)
		if self.effect then
			self.effect:setPosition(self:getPosInFrontOf(0, 30))
		end
	end

	function Ob:setOrientation(x, y, z)
		%Ob.Parent.setOrientation(self, x, y, z)
		if self.effect then
			self.effect:setOrientation(self:getOrientation())
		end
	end

	function Ob:onAddedToInventory()
		%Ob.Parent.onAddedToInventory(self)		
		--sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

		--edit save bButtonCollected
		Global:saveGlobal('bButtonCollected', 1)

	end


    function Ob:statePickup()
        Global.player.invDisplayer:invItemAdded(self,0,0,nil,1)
		self:killSelf()
	end

	function Ob:onActivateFromInventory()
		local target = GetLookTarget(Global.player)
		if (target) then
			if (is_subclass_of(target, 'CA.Characters.Campkid') ~= 1 and target.Type ~= 'ca.characters.Ford'
				 and target.Type ~= 'ca.characters.Ford' and target.Type ~= 'ca.characters.CookFord'
				  and target.Type ~= 'ca.characters.Coach' and target.Name ~= 'gpcsecretdoor' 
				  and target.Name ~= 'GPCdoor') then
				Global.player:sayLine("/GLGO039RA/", 0, 1, nil, 1, nil, 1) --No, I don't want to lose this button. I might not get into Sasha's secret lab without it.
			end
		else
			Global.player:sayLine("/GLGO038RA/", 0, 1, nil, 1, nil, 1) --This is that button Sasha gave me. It's a clue to the location of his secret lab.
		end
	end
	
	return Ob
end

