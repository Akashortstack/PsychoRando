--
--	AS_hand.lua                
--	This is Gloria's Trophy script.  Raz uses the trophy as part of his Loboto disguise.
--	  
--  from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*

function AS_hand(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Levels/AS_Asylum/Props/AS_LobotoDisguise_Trophy.plb'
		Ob.heldscale = 1
		Ob.usedFromInterface = 1
		
		Ob.HeldPosX = 0.1;
		Ob.HeldPosY = 22.8;
		Ob.HeldPosZ = -1.5;
		Ob.HeldRotX = -1.414;
		Ob.HeldRotY = 27.523;
		Ob.HeldRotZ = 23.751;
		Ob.WearPosX = 0
		Ob.WearPosY = 0
		Ob.WearPosZ = 1
		Ob.WearRotX = 151.316
		Ob.WearRotY = -28.6218
		Ob.WearRotZ = 9.19229
		Ob.overrideClutchAnim = 0
		Ob.bIsCostumeItem = 0
		Ob.bIsSelected = 0
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistLoosePalmDn_ArmLf.jan'
		Ob.player = nil
		Ob.bIsWornByPlayer = nil
		Ob.AS = nil
		
		--edit removed, defaults to 'all'
		--Ob.level = 'real'

		Ob.pickupSpriteName = 'GloriaTrophy'

		--edits to make names appear in all levels. *STILL NEEDS LOCALIZATION*
   		Ob.displayName = "Gloria's Trophy"--DIALOG=<<Gloria\'s Trophy>>
   		
   		Ob.dependencies = {
   			meshes = {
   				'Levels/AS_Asylum/Props/AS_LobotoDisguise_Trophy.plb',
   			},
   			scripts = {
   				'AS.Effects.TrohpyGlintFX',
   			},
   		}
	end
    
--  S T A T E   I N I T  **************************************************************** 

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetEntityInterestLevel(self, 8)
		SetEntityLookOffsetPos(self, 0, 50, 0)
		SetMaxViewDistance(self,400)
		SetEntityFlag(self,ENTITY_DRAWSHADOW,0)
		SetEntityCollideSphere(self, 5)
		SetPhysicsFlag(self,PHYSICS_COLLIDER, 1)
		if (Global:load('CrispinIntroSeen', 'AS') == 1 and strsub(GetCurrentLevelName(),1,2) == 'AS') then 
			self.bIsCostumeItem = 1
--			self.overrideClutchAnim = 1
		end

		--If item is not in inventory then run its glinty effects.
		self.glintFX = FindScriptObject('trophyGlintFX',1)
		if( not self.glintFX ) then
			GamePrint('Creating and attaching.')
			self.glintFX = SpawnScript('AS.Effects.TrohpyGlintFX','trophyGlintFX','',1)
			self.glintFX:attach(self)
		end
		self.playingGlint = 0
		if((not self.bInInventory) or self.bInInventory ~= 1) then
			self:startGlint()
		end
		
		SetSimulationCullDistance( self, 6000)
		
		--edit to make collectible anywhere
		--self:setState(nil)                                              
	end                                               
    
--  S T A T E S  ************************************************************************ 

	function Ob:setHomePosition()
		if Global:loadGlobal('bTHCompleted') == 1 then -- Theatre not done
			self:setPosition(2680, 70, 1495)			
		else
			self:setPosition(3150, 100, 1295)
		end
	end
	
	function Ob:stateNoUse()
		Global.player:sayLine("/ASAD000RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<Gloria didn\'t win that trophy for me to mess around with it.>>
		Global.player:sayLine("/ASAD001RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<She won it so I could use it as a disguise!>>
		self:setState(nil)
	end                      
	
	function Ob:putInRazHandForCutscene()
		Global.player:replaceSelectedItemInPsack(1, 1)
		self:beNotPickupable()
		LoadPriorityAnim(Global.player,self.clutchAnim,1,0.2,1)		
		self.posX,self.posY,self.posZ = self:getPosition()
		AttachInventoryEntityToPlayer(self)
	end

	function Ob:putInGloriaHandForCutscene()
		self:beNotPickupable()
		DetachEntityFromParent(self)
		SetVelocity(self, 0, 0, 0)
		AttachEntityToEntityBone(self, FindScriptObject ('AS_Gloria'),'handJARt_1',1)
		self:setOrientation(60,90,0)
		self:setPosition(-20,-20,-5)
		UnLoadPriorityAnim(Global.player,1,0.5)
	end

	function Ob:putBackAfterCutscene()	   
		DetachEntityFromParent(self)
		SetVelocity(self, 0, 0, 0)
		self:setOrientation(0,0,0)
		UnLoadPriorityAnim(Global.player,1,0.5)
		self:setHomePosition()
		self:bePickupable()
	end
	
--  M E S S A G E   H A N D L E R S  ****************************************************

	function Ob:onItem(itemName, from)

		--edit to make Collectible anywhere
		%Ob.Parent.onItem(self, itemName, from)
		Global.player:sayLine("/ASAD002RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Finally! Recognition for my acting talents!>>
		--if (Global:loadGlobal('bTHCompleted') ~= 1) then
			-- send a message to gloria
		--	local rGloria = FindScriptObject ('AS_Gloria')
		--	if (rGloria ~= nil) then
		--		self:sendMessage(rGloria,'ActivatedTrophy','','')
		--	end			
		--else 
		--	%Ob.Parent.onItem(self, itemName, from)
		--	Global.player:sayLine("/ASAD002RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Finally! Recognition for my acting talents!>>
		     
	end
	
	function Ob:onTKPickup(data, from)--DIALOG=<<Finally! Recognition for my acting talents!>>
		if Global:loadGlobal('bTHCompleted') ~= 1 then
			Global.player:interruptPowers()		
			self:onItem('')
		else
			%Ob.Parent.onTKPickup(self, data, from)
		end
	end

--***************************************************************************************
	
	function Ob:onActivateFail(data, from)
		self:setState('NoUse')
	end
	
--***************************************************************************************


	function Ob:onActivateFromInventory(data, from)
		-- only do 'raar' and anim if 1) player is standing   2) they Dont have a look target  3) they are currently wearing trophy arm
		if Global.player:IsStanding() == 1 then
			local target = Global.player:getLookTarget()
			if target == nil or (target and target.Name ~= 'AS_Gloria') then
				if self.overrideClutchAnim == 1 then
					Global.player:loadAnim('Anims/DartNew/Raz_menaceLobotoArm.jan', 0.2, 0)
					Global.player:sayLine("/ASAD003RA/", 0, 1, nil, 1, nil, 1) -- like a pirate--DIALOG=<<Raaar!>>
				end
			end
		end
	end
	  
--***************************************************************************************   

	function Ob:onSelected(data, from)
		self.bIsSelected = 1
		self:attachSelfToDart()
		self:startGlint()
	end
    
-- *********************************************************************************************    

    function Ob:onReplaced(data, from)
        local straightJacket = FindScriptObject('StraightJacket')
        local lobatoPainting = FindScriptObject('LobatoPainting')
        -- want to keep this flag set if player is replacing its currently held item with another piece of the costume
        if (Global.player.HeldItem ~= 'LobatoPainting' and Global.player.HeldItem ~= 'StraightJacket') then
            self.bIsWornByPlayer = nil
			Global.player.clawCostumeItem = nil
            self.bIsSelected = 0
            GamePrint('Loboto Hand removed from Costume')
            -- if one part of the costume is taken off all of it needs to come off
            if (straightJacket and straightJacket.bIsWornByPlayer) then
                self:sendMessage(straightJacket, 'RemoveCostume', '',1)
            end
            if (lobatoPainting and lobatoPainting.bIsWornByPlayer) then
                self:sendMessage(lobatoPainting, 'RemoveCostume', '',1)
            end
        end
		self:stopGlint()
    end

--***************************************************************************************
    
    function Ob:onRemoveCostume(data, from)
        if (self.bIsSelected == 1) then
            self:takeOffCostume()
        end
    end

--***************************************************************************************
    function Ob:onTalkedToCrispin(data,from)
        self.bIsCostumeItem = 1
    end

--***************************************************************************************																 
-- General Functions
--***************************************************************************************

	function Ob:attachSelfToDart()
		self:setState('AttachSelfToDart')
	end

	function Ob:stateAttachSelfToDart()
		if (self.bIsCostumeItem == 1) then
			self.bIsWornByPlayer = 1
			Global.player.clawCostumeItem = self
			Global.player:setNewAction('Stand')
			Yield()
			if(self.overrideClutchAnim == 1) then
				AttachEntityToEntityBone(self, Global.player,'spineJB_1', 0)
				SetOrientation(self, self.WearRotX, self.WearRotY, self.WearRotZ)
				SetPosition(self, self.WearPosX, self.WearPosY, self.WearPosZ)
			else
				AttachInventoryEntityToPlayer(self)
			end
			Global.goalManager:deactivate('Claw')
		else
			if (strsub(GetCurrentLevelName(),1,2) ~= 'AS') then
				Global.player:sayLine("/GLGO046RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<I\'m not going to wear my costume here. People will think I\'m crazy!>>
			end
		end
		self:setState(nil)
	end

	function Ob:takeOffCostume()
		self.bIsWornByPlayer = nil
		self.bIsSelected = 0
		Global.player.clawCostumeItem = nil
		Global.player.forceItemPutaway=1
		Global.player:replaceItemInPsack(self)
		self.glintFX:stop()
	end
    
	function Ob:setArmStatus(bUseAsArm)
		if bUseAsArm == 1 and Global:load('CrispinIntroSeen', 'AS') == 1 then
			self.overrideClutchAnim = 1
			if(self.bIsSelected == 1) then  -- need to stop using clutch anim and attach claw to raz
				UnLoadPriorityAnim(Global.player,1,0)  -- this stops the clutch animation
				self:setState('AttachSelfToDart')       -- this puts the claw in the right spot on Raz
			end
		else
			self.overrideClutchAnim = 0
		end
	end
    
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		self:stopGlint()

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
	end

	function Ob:onRemovedFromInventory(data, from)
		%Ob.Parent.onRemovedToInventory(self, data, from)
		self:startGlint()
	end
    
    function Ob:startGlint()
		if(self.glintFX and self.bPlayingGlint == 0) then
			self.glintFX:run()
		end
	end
    
    function Ob:stopGlint()
		if(self.glintFX and self.glintFX.bPlayingGlint == 1) then
			self.glintFX:stop(1)
		end
    end
    
    function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
		if (self.glintFX) then
			SetEntityFlag(self.glintFX, ENTITY_NOSIMULATE, bCull)
		end
    end
    
	return Ob
end
