function AS_Painting(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Levels/AS_Asylum/Props/AS_LobotoDisguise_Portrait.plb'
        
		Ob.heldscale = 1
		Ob.needstarget = 1
		Ob.usedFromInterface = 1

		Ob.HeldPosX = 32.0   
		Ob.HeldPosY = -60.2    
		Ob.HeldPosZ = 23.9    
		Ob.HeldRotX = 161.923
		Ob.HeldRotY = 59.341  
		Ob.HeldRotZ = -74.026

		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan'
		Ob.overrideClutchAnim = 0
		Ob.bIsCostumeItem = 0
		Ob.WearPosX = 0
		Ob.WearPosY = 0
		Ob.WearPosZ = 0
		Ob.WearRotX = 80    
		Ob.WearRotY = -90 
		Ob.WearRotZ = 0    
		
		Ob.player = nil
		Ob.rEdgarLocation = nil
		
		Ob.bPaintingVisible = 0
		Ob.bAccessible = 0
		Ob.bIsWornByPlayer = nil
		Ob.bHasTalkedToCrispin = nil

		--edit removed, default is 'all'
		--Ob.level = 'real'

		Ob.pickupSpriteName = 'LobotoPortrait'
   		Ob.displayName = "/GLZB044TO/"--DIALOG=<<Lobato\'s Portrait>>

   		Ob.dependencies = {
   			meshes = {
   				'Levels/AS_Asylum/Props/AS_LobotoPortrait.plb',
   				'Levels/AS_Asylum/Props/AS_LobotoDisguise_Portrait.plb',
   			},
   		}
	end

    
--  S T A T E   I N I T  **************************************************************** 
		
	function Ob:onBeginLevel()
		-- call parent's stateinit
		if Global.player:isInInventory('LobatoPainting') ~= 1 then
			--edit to make prop appear properly
			self.meshName = 'Levels/AS_Asylum/Props/AS_LobotoDisguise_Portrait.plb'
			--self.meshName = 'Levels/AS_Asylum/Props/AS_LobotoPortrait.plb'
		--else
			--self.meshName = 'Levels/AS_Asylum/Props/AS_LobotoDisguise_Portrait.plb'
		end
		%Ob.Parent.onBeginLevel(self)
		self.player = GetPlayerLSO()
		--edit removed to make collectible Anywhere
		--self.paintingTarget = FindScriptObject('TargetPainting')
		--self.rEdgarLocation = FindScriptObject('EdgarPaintLocation')
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self,400)
		SetEntityFlag(self,ENTITY_DRAWSHADOW,0)
		SetEntityCollideSphere(self, 5)
		--edit removed to make collectible Anywhere
		--if Global:loadGlobal('bBVCompleted') ~= 1 then
		--	if ( self.paintingTarget ) then
		--		self:setPosition(self.paintingTarget:getPosition())
		--	end
		--	local x, y, z = 0,0,0
		--	if ( self.rEdgarLocation ) then
		--		self.rEdgarLocation:getPosition()
		--	end
			-- face the painter
		--	RotateTowards2D( self , x , y , z , 1200 )
		--	self:hide()
		--else
		--	if Global.player:isInInventory('LobatoPainting') ~= 1 then
		--		if (Global.levelScript.Type == 'as.ASCO') then
		--			local edgar = FindScriptObject('AS_Edgar')
		--			if (Global:load('bASCOCompletedBVPlayed') == 1) then
		--				edgar:positionPaintingForCutscene()
		--				edgar:popDogPaintingForCutscene()
		--				self:setState('BecomePickupable')
		--			else
		--				self:beNotPickupable()
		--				self:setPosition(self.paintingTarget:getPosition())
		--			end					
		--		end
		--	end
		--end
		if (Global:load('CrispinIntroSeen', 'AS') == 1 and strsub(GetCurrentLevelName(),1,2) == 'AS') then 
			self.overrideClutchAnim = 1 -- we have talked to crispin so now the painting should be a costume item
			self.bIsCostumeItem = 1
		end
		
		Global.player:addSpamListener('Invisibility', self )
	end
	
	function Ob:listenerInvisibility( invisible )
		if( 1 == invisible ) then
			self:makeInvisible()
		else
			self:makeVisible()
		end
	end
	
--  F U N C T I O N S  ******************************************************************* 
	function Ob:stateBecomePickupable()
		Yield()
		self:bePickupable()
		self:setState(nil)
	end

	function Ob:bePickupable()
		%Ob.Parent.bePickupable(self)
		if (self.interestFX ~= nil) then
			self.interestFX:attach(self)
		end
	end		
       	
	function Ob:accessDenied()
	end
	
	function Ob:accessGranted() 
		LoadMesh(self,'Levels/AS_Asylum/Props/AS_LobotoDisguise_Portrait.plb')			
		SetEntityVisible(self, 1)
		SetEntityAlpha(self, 1, 1)
		self.bAccessible = 1
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self,500)
	end
	
		
--  M E S S A G E   H A N D L E R S  *****************************************************

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
	
	function Ob:onAccessGranted(data, from)
		self:accessGranted()
	end
																																												 
--*************************************************************************************** 
    																																												 
	function Ob:onActivateFail(data, from)
		local trophy = FindScriptObject('LobatoHand')
		if trophy ~= nil then
			if trophy.bIsSelected == 1 then
				trophy:onActivateFromInventory()
			end
		end
	end

--***************************************************************************************   --DIALOG=<<I don\'t want to hang it there. It\'s part of my costume!>>

	function Ob:onSelected(data, from)
		self:attachSelfToDart()
	end
    
-- *********************************************************************************************    

	function Ob:onReplaced(data, from)
		-- want to keep this flag set if player is replacing its currently held item with another piece of the costume
		if (self.bIsWornByPlayer and self.player.HeldItem ~= 'LobatoHand' and self.player.HeldItem ~= 'StraightJacket') then
			self.bIsWornByPlayer = nil
			Global.player.paintingCostumeItem = nil
			-- if one part of the costume is taken off all of it needs to come off
			local straightJacket = FindScriptObject('StraightJacket')
			local lobatoHand = FindScriptObject('LobatoHand')
			if (lobatoHand and lobatoHand.bIsSelected) then
				self:sendMessage(lobatoHand, 'RemoveCostume', '',1)
			end
			if (straightJacket and straightJacket.bIsWornByPlayer) then
				self:sendMessage(straightJacket, 'RemoveCostume', '',1)
			end
		end
	end

--************************************************************************************************* 

	function Ob:onRemoveCostume(data, from)
		if (self.bIsWornByPlayer) then
			self:takeOffCostume()
		end
	end

--***************************************************************************************

	function Ob:onTalkedToCrispin(data,from)
		self.overrideClutchAnim = 1 -- we have talked to crispin so now the painting should be a costume item
		self.bIsCostumeItem = 1
	end

--***************************************************************************************																 
-- General Functions
--***************************************************************************************

	function Ob:takeOffCostume()
		self.bIsWornByPlayer = nil
		Global.player.paintingCostumeItem = nil
		self.player.forceItemPutaway=1
		self.player:replaceItemInPsack(self)
	end

	function Ob:attachSelfToDart()
		if (self.bIsCostumeItem == 1) then
			Global.player.paintingCostumeItem = self
			self.bIsWornByPlayer = 1
			self.player:setNewAction('Stand')
			AttachEntityToEntityBone(self, self.player,'headJEnd_1', 1)
			SetOrientation(self, self.WearRotX, self.WearRotY, self.WearRotZ)
			SetPosition(self, self.WearPosX, self.WearPosY, self.WearPosZ)
			Global.goalManager:deactivate('Face')
		else
			if (strsub(GetCurrentLevelName(),1,2) ~= 'AS') then
				Global.player:sayLine("/GLGO046RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<I\'m not going to wear my costume here. People will think I\'m crazy!>>
			end
		end
		self:setState(nil)
	end

--	function Ob:hide()
--		DebugPrint('hide')	
--	end
	
--	function Ob:show()
--		DebugPrint('show')	
--	end
	
--	function Ob:makeInvisible()
--		DebugPrint('makeInvisible')	
--	end
	
--	function Ob:makeVisible()
--		DebugPrint('makeVisible')
--	end
	
	return Ob
end

