--
-- GPCSecretDoor
--
--
-- Psychonauts
-- (c) 2000 - 2003 Double Fine Productions
-- Proprietary and Confidential
--
function GPCSecretDoor(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.Geometry')
		Ob.meshName = 'Levels/CA_Campgrounds/Props/GPC_Hatch.plb' -- Editable
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		-- set the right collision
		local x, y, z = self:getPosition()
		local rx, ry, rz = self:getOrientation()
		self.rOpenCollision = SpawnScript('Global.Props.Geometry', self.Name..'OpenCollision', 'self.meshName = \'Levels/CA_Campgrounds/Props/GPC_HatchCollisionUp.plb\'')
		self.rOpenCollision:setPosition(x, y, z)
		self.rOpenCollision:setOrientation(rx, ry, rz)
		
		self.rClosedCollision = SpawnScript('Global.Props.Geometry', self.Name..'ClosedCollision', 'self.meshName = \'Levels/CA_Campgrounds/Props/GPC_HatchCollisionDown.plb\'')
		self.rClosedCollision:setPosition(x, y, z)
		self.rClosedCollision:setOrientation(rx, ry, rz)

		-- create the cs button
		self.rButtonForCS = SpawnScript('ScriptBase', 'CSGPCButton')
		self.rButtonForCS:loadMesh('Characters/CharacterProps/Raz_GPCButton.plb')		
--		self.rButtonForCS:setScale(2, 2, 2)
		self.rButtonForCS.setupForCS = function(self)
										   self:makeVisible()
										   AttachEntityToEntityBone(self,Global.player, 'handJEndLf_2', 0)
									   end
		self.rButtonForCS.cleanupForCS = function(self)
											 DetachEntityFromParent(self)
											 self:killSelf()
										 end
		self.rButtonForCS:makeInvisible()

		--edit Leave this always open
		self:open()
		-- check the saved Var
		--[[if (Global:load('bCAGPHatchOpenPlayed') ~= 1) then
			self:close()
		else
			self:open()
		end
		]]
		self:setState(nil)
	end

	function Ob:cleanupForCS()
		self:open()
	end

	function Ob:open()
		-- opened
		self.bOpen = 1
		SetPhysicsFlag(self.rClosedCollision, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.rOpenCollision, PHYSICS_COLLIDEE, 1)					
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		SetMaxViewDistance(self, 0)
		self:setEntityInterestLevel(0)

		local tp = FindScriptObject('CAGPtoCASA1')
		tp:enable()

		self:loadAnim('Anims/GPC/HatchOpen.jan')
	end

	function Ob:close()
		-- close
		self.bOpen = 0
		SetPhysicsFlag(self.rClosedCollision, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self.rOpenCollision, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetEntityCollideSphere(self, 80)
		SetMaxViewDistance(self, 500)
		self:setEntityInterestLevel(kDOOR_INTEREST)

		local tp = FindScriptObject('CAGPtoCASA1')
		tp:disable()

		self:loadAnim('Anims/GPC/HatchClosed.jan')
	end

	-- called from cutscene script to use up the button.
	function Ob:killButton()
		local button = FindScriptObject('Button', 1)
		if button then
			button:killSelf()
		end
	end

	function Ob:onItem(itemName, from)
		if itemName == 'Button' then
			Global.cutsceneScript:runCutscene('CAGPHatchOpen')
		else
			Global.player:sayLine("/CADD006RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Call me crazy, but I have a weird feeling that the button Sasha gave me goes here.>>
		end
	end

	return Ob
end

