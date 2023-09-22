function AS_StraightJacket(Ob)
	if not Ob then
		--edit
		Ob = CreateObject('Global.Props.HeldObject')
		--Ob = CreateObject('Global.Props.HeldObject', 'AS_StraightJacket')
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/AS_straightJacketFolded.plb'
    
		Ob.heldscale = 1
    
		Ob.usedFromInterface = 1
		Ob.HeldPosX = -2.9;
		Ob.HeldPosY = 31.5;
		Ob.HeldPosZ = -5.8;
		Ob.HeldRotX = 163.785;
		Ob.HeldRotY = 79.818;
		Ob.HeldRotZ = -0.549;
		Ob.bIsCostumeItem = 0
		Ob.overrideClutchAnim = 0
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan'
		Ob.player = nil
		Ob.bIsWornByPlayer = nil
		--edit removed, default is 'all'
		--Ob.level = 'real'
	
		Ob.pickupSpriteName = 'StraightJacket'
   		Ob.displayName = "/GLZB041TO/"--DIALOG=<<Straight Jacket>>
   		
   		Ob.dependencies = {
   			meshes = {
   				'GlobalModels/Objects/HeldObjects/AS_straightJacketFolded.plb',
   				'Characters/Dart_StraightJacket.plb',
   			},
   		}
	end	
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self,500)
		SetEntityFlag(self,ENTITY_DRAWSHADOW,1)
		if (Global:load('CrispinIntroSeen', 'AS') == 1 and strsub(GetCurrentLevelName(),1,2) == 'AS') then 
			self.overrideClutchAnim = 1 -- we have talked to crispin so now the painting should be a costume item
			self.bIsCostumeItem = 1
		end
		--edit remove to make collectible anywhere
		--self:accessDenied()
		--self:onPutOnStraightJacket()
		local heldItemName = nil
		if (Global.player.HeldItem ~= nil) then
			local item = FindScriptObject(self.HeldItem)
			if (item ~= nil) then
				heldItemName = Item.Name
			end
		end
		--edit removing this to prevent character model from updating on spawn (removes Raz's Goggles)
		--if (heldItemName ~= 'StraightJacket') then
		--	self:onTakeOffStraightJacket()
		--	LoadNewPlayerMesh('Characters/DartNew.plb')
		--end
		self:setState(nil)                                       
	end                                               
  
	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		self:onTakeOffStraightJacket()
	end
    
--  F U N C T I O N S  ******************************************************************* 

	function Ob:accessDenied()
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self,0)
		SetEntityAlpha(self, 0, 1)
		SetEntityVisible(self,0)
	end
	
	
	function Ob:accessGranted()
    SetEntityVisible(self, 1)
		SetEntityAlpha(self, 1, 1)
    self:setEntityInterestLevel(0)
    SetMaxViewDistance(self,500)
	end


--  M E S S A G E   H A N D L E R S  ****************************************************


	function Ob:onAccessGranted(data, from)
		self:accessGranted()
	end

	
--*************************************************************************************** 
	
	
	function Ob:onActivate(data, from)
		self:addToInventory()
		GamePrint('Added Straight Jacket to Inventory')
	end

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

	function Ob:onSelected(data, from)
		if (self.bIsCostumeItem == 1) then
			self.bIsWornByPlayer = 1
			Global.player.jacketCostumeItem = self
			self:putOnJacket() -- this swaps the mesh
		else
			SetEntityAlpha( self, 1, 0 ) -- show the jacket when holding it
			if (strsub(GetCurrentLevelName(),1,2) ~= 'AS') then
				Global.player:sayLine("/GLGO046RA/", 0, 1, nil, 1, nil, 1)  --I'm not going to wear my costume here. People will think I'm crazy!
			end
		end
	end
    
--***************************************************************************************   --DIALOG=<<I don\'t want to hang it there. It\'s part of my costume!>>
	
	function Ob:onActivateFail(data, from)
		local trophy = FindScriptObject('LobatoHand')
		if trophy ~= nil then
			if trophy.bIsSelected == 1 then
				trophy:onActivateFromInventory()
			end
		end
	end

-- *********************************************************************************************    

	function Ob:onReplaced(data, from)
		-- want to keep this flag set if player is replacing its currently held item with another piece of the costume
		if (self.bIsWornByPlayer and Global.player.HeldItem ~= 'LobatoPainting' and Global.player.HeldItem ~= 'LobatoHand') then
			self.bIsWornByPlayer = nil
			Global.player.jacketCostumeItem = nil
			self:takeOffJacket()    -- this swaps the mesh
			-- if one part of the costume is taken off all of it needs to come off
			local lobatoHand = FindScriptObject('LobatoHand')
			local lobatoPainting = FindScriptObject('LobatoPainting')
			if (lobatoHand and lobatoHand.bIsSelected) then
				self:sendMessage(lobatoHand, 'RemoveCostume', '',1)
			end
			if (lobatoPainting and lobatoPainting.bIsWornByPlayer) then
				self:sendMessage(lobatoPainting, 'RemoveCostume', '',1)
			end
		end
	end

--***************************************************************************************
    
	function Ob:onRemoveCostume(data, from)
		if (self.bIsWornByPlayer) then
			self:takeOffCostume()
		end        
	end

--***************************************************************************************

	function Ob:onTalkedToCrispin(data,from)
		self.overrideClutchAnim = 1 -- we have talked to crispin so now this should be a costume item
		self.bIsCostumeItem = 1
	end

                                                                                         
--***************************************************************************************																 
-- General Functions
--***************************************************************************************

	function Ob:takeOffJacket()
		SetEntityAlpha( self, 1, 0 ) -- unhide the object from player since we are using a puppet instead
        
		-- make sure everything is detached from the player before switching the mesh
		local lobatoHand = FindScriptObject('LobatoHand')
		local lobatoPainting = FindScriptObject('LobatoPainting')
		if (lobatoHand) then
			lobatoHand:setArmStatus(0) -- this signals that the jacket is off, thus the hand should be held
			if(lobatoHand.bIsWornByPlayer) then
				DetachEntityFromParent(lobatoHand)
			end
		end
		if (lobatoPainting and lobatoPainting.bIsWornByPlayer) then
			DetachEntityFromParent(lobatoPainting)
		end
        
		self:onTakeOffStraightJacket()
	end
    
	function Ob:putOnJacket()
		DetachEntityFromParent(self) -- dont want jacket attached to player
		SetEntityAlpha( self, 0, 0 ) -- hide the object from player since we are using a puppet instead
		-- make sure everything is detached from the player before switching the mesh
		local lobatoHand = FindScriptObject('LobatoHand')
		local lobatoPainting = FindScriptObject('LobatoPainting')
		if (lobatoHand) then
			if(lobatoHand.bIsWornByPlayer) then
				DetachEntityFromParent(lobatoHand)
			end
			lobatoHand:setArmStatus(1)  -- this signals that the jacket is on, so the hand should be used as an arm
		end
        
		if (lobatoPainting and lobatoPainting.bIsWornByPlayer) then
			DetachEntityFromParent(lobatoPainting)
		end
        
		self:onPutOnStraightJacket()
        
        Global.goalManager:deactivate('LabCoat')
        
		-- now reattach items
		if (lobatoHand and lobatoHand.bIsWornByPlayer) then
			lobatoHand:attachSelfToDart()
		end
		if (lobatoPainting and lobatoPainting.bIsWornByPlayer) then
			lobatoPainting:attachSelfToDart()
		end
	end
    
	function Ob:takeOffCostume()
		self.bIsWornByPlayer = nil
		Global.player.jacketCostumeItem = nil
		self:takeOffJacket()
		Global.player.forceItemPutaway=1
		Global.player:replaceItemInPsack(self)
	end

	function Ob:onPutOnStraightJacket()
		SetPlayerPhysicsState(PHYSICSSTATE_Straightjacket)
		LoadNewPlayerMesh('Characters/Dart_StraightJacket.plb')
		Global.player:loadAnim('Anims/DartNew/Helmet/DartHelmetUp.jan', 0.1 , 0)
		Global.player:loadAnim('Anims/DartNew/DartIdleShrug.jan', 0.1 , 0)
	end

	function Ob:onTakeOffStraightJacket()
		UnsetPlayerPhysicsState(PHYSICSSTATE_Straightjacket)
		LoadNewPlayerMesh('Characters/DartNew.plb')
		-- No need to reattach the knapsack as LoadNewPlayerMesh already does this
		--AttachKnapsackToPlayer()    -- reattach knapsack 
		Global.player:loadAnim('Anims/DartNew/Helmet/DartHelmetUp.jan', 0.1 , 0)
		Global.player:loadAnim('Anims/DartNew/DartIdleShrug.jan', 0.1 , 0)
	end

	return Ob
end
