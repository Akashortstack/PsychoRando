--
--  HeldObject.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function HeldObject(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		Ob.dependencies = {
			scripts = { 'Global.Effects.InterestFX',
						'Global.Props.Geometry',
						'Global.Effects.CollectFX', },
			meshes = {  },
			textures = {  },	
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
			},
		}

		Ob.meshName = nil -- Editable
		Ob.bPersistentMesh = 0 -- Editable
		Ob.scaleX = 1 -- Editable
		Ob.scaleY = 1 -- Editable
		Ob.scaleZ = 1 -- Editable
		Ob.collSphereRadius = nil -- Editable
		Ob.collSphereXOff = 0 -- Editable
		Ob.collSphereYOff = 0 -- Editable
		Ob.collSphereZOff = 0 -- Editable
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable
		Ob.clutchAnim = nil -- Editable
		Ob.inventoryscale = 1 -- Editable
		Ob.heldscale = 1 -- Editable
		Ob.maxViewDistance = 350 -- Editable
		Ob.interestLevel = kHELDOBJECT_INTEREST

		Ob.SIM_CULL_DIST = 5000
		
		Ob.sphereSize = 0

		Ob.bUseDefaultUncollectedAnim = 1

		-- Controls apply gravity and collider.
		Ob.applyGravity = 0 -- Editable
		Ob.ClairvoyanceTarget = nil -- Editable
		Ob.ownerName = nil -- Editable
		Ob.bInInventory = 0
		Ob.pickupSpriteName = 'Unnamed Object'

		-- Set to 1 if the item should get tossed in the psack on attack.
		Ob.bPutAwayOnMelee = 0

		-- If you leave this as prefixBased, this object will live in only its mental world.
		-- If you set it to 'all', it will persist across all levels.
		-- If you set it to 'real', it will persist across all physical levels.
		-- If you set it to 'mental', it will appear in all mental levels.   
		-- Whatever you set it to, do it before HeldObject's onBeginLevel executes.

		--edit Set default to 'all' to allow objects to spawn and persist between levels
		Ob.level = 'all'
		
		Ob.Telekinesis = kTKBEHAVIOR_STANDARD -- Editable
		Ob.iTriggerSphereRadius = nil -- Editable
		Ob.bDontPack = nil -- Editable
		
		--If 1, then the item will only ever be used, and will not send onItem to people.
		Ob.bUseOnly = nil

		Ob.TIMER_START_MOVER_ANIM = '8001'

		Ob.TK_INTERP_TO_PLAYER_TIME = 0.75
		
		--Default script name for interest FX
		Ob.DEFAULT_INTEREST_FX_NAME = 'Global.Effects.InterestFX'
		
		-- set this for items like cards and 1ups for which you dont want the current item put away on collection
		Ob.bDontPutAwayHeldItem = 0

		-- set to 0 to leave the trigger in place; an optimization for things like
		-- emo bag tags whose anims move the entity all over the frickin place
		Ob.bAttachTrigger = 1

		--edit Adding ShopItem.lua functionality for ALL Global HeldObjects
		Ob.sItemUp = nil
		Ob.sItemDown = nil
		Ob.sItemLeft = nil
		Ob.sItemRight = nil
		Ob.rItemUp = nil
		Ob.rItemDown = nil
		Ob.rItemLeft = nil
		Ob.rItemRight = nil
		Ob.sItemDescription = '' -- Editable
		Ob.rPlayer = nil
		Ob.bSold = 0
		-- if the num stock is > 1, then it'll decrease inventory
		-- if the num stock is < 0, the infinite stock and it'll
		-- always spawn the item
		Ob.iNumStock = 1 -- Editable
		Ob.iPrice = 0 -- Editable
		Ob.iRank = 1 -- Editable
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.inShop = 0 -- Editable
	
	end

	-- Ob.invSortKey = nil		-- set this to a number if you want the held item to be grouped
								-- in the inventory screen
	
-- ************************************************************************************************

	function Ob:onPreLoad()
		%Ob.Parent.onPreLoad( self )
		
		if self.pickupSpritePath then
			self:preloadTexture(self.pickupSpritePath)
		elseif( nil ~= self.pickupSpriteName ) then
			self:preloadTexture( 'Textures/icons/InventoryItems/'..self.pickupSpriteName..'.dds' )
		end
		
		if( nil ~= self.meshName ) then
			self:preloadMesh( self.meshName )
		end
	end
	
	function Ob:onBeginLevel()
		self.player = Global.player
		%Ob.Parent.onBeginLevel(self)
		if self.level == 'prefixBased' then 
			self.level = Global.levelScript:getLevelPrefix() 
		end
		if (self.player:isInInventory(self.Name) == 1 and self.bInInventory ~= 1) then
			self:killSelf()
			return nil
		end
		if self:shouldBeInLevel() ~= 1 then
			self:killSelf()
			return nil
		end
		SetEntityAuraColor(self, Global.levelScript.objectAura:get())

		-- self.bPersistentMesh should never be not 0
		if self.bPersistentMesh ~= 0 then
			GamePrint('WARNING: Found bPersistentMesh as non 0 in script ' .. self.Name)
		end
		--self:loadMesh(self.meshName,self.bPersistentMesh)
		self:loadMesh(self.meshName,0)

		if not self.pickupSpriteName then
			GamePrint('WARNING: No sprite specified for inventory collection effect.')
		end

		self:setScale(self.scaleX, self.scaleY, self.scaleZ)
		SetEntityCollideSphere(self, 2)
		SetEntityFlag(self, ENTITY_CANNOTBESTOODON, 1)
		SetPhysicsFlag(self, PHYSICS_SLIDEONCOLLIDE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_NOT_REALLY_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, self.applyGravity)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, self.applyGravity)

		self.pickupableTKValue = self.Telekinesis
		
		--If a special interestFXName has been set, use it, otherwise take the default
		self.interestFXName = self.interestFXName or self.DEFAULT_INTEREST_FX_NAME;
		
		if self.player:isInInventory(self.Name) ~= 1 then
			--edit to prevent pickup if in a Shop
			if (self.inShop == 1) then
				self.initialState = nil
				self:beNotPickupable()
			else
				self:bePickupable()
			end  
			
		else
			self:beNotPickupable()
		end

		--edit Shop Item Code
		if (self.sItemUp) then
			self.rItemUp = FindScriptObject(self.sItemUp)
			if (Global.player:isInInventory(self.sItemUp) == 1) then
				self.rItemUp = nil
			end
		end

		if (self.sItemDown) then
			self.rItemDown = FindScriptObject(self.sItemDown)
			if (Global.player:isInInventory(self.sItemDown) == 1) then
				self.rItemDown = nil
			end
		end

		if (self.sItemLeft) then
			self.rItemLeft = FindScriptObject(self.sItemLeft)
			if (Global.player:isInInventory(self.sItemLeft) == 1) then
				self.rItemLeft = nil
			end
		end

		if (self.sItemRight) then
			self.rItemRight = FindScriptObject(self.sItemRight)
			if (Global.player:isInInventory(self.sItemRight) == 1) then
				self.rItemRight = nil
			end
		end
	end

	--[[ @killSelf()
		Overridden to remove from Dart's inventory if we're in it.
	]]--
	function Ob:killSelf(bKillButDontRemoveFromInventory)
		local flag = bKillButDontRemoveFromInventory or 0
		if flag ~= 1 then
			if self.bInInventory == 1 then
				Global.player:removeFromInventory(self)
			end
		end
		self:beNotPickupable()
		%Ob.Parent.killSelf(self)
	end

       	-- Sometimes the item gets killed without going through killSelf, so double-check here.
	function Ob:onDestroyed(b)
		if %Ob.Parent.onDestroyed then
			%Ob.Parent.onDestroyed(self, b)
		end
		if self.bInInventory == 1 then
			Global.player:removeFromInventory(self, b)
		end
		if self.interestFX and b ~= 1 then
			self.interestFX:stop(1, 0, 1)
			self.interestFX = nil
		end
	end
	--[[ @getSaveEditables
		Return the editables string you'd like to be reincarnated with.  Remember, you'll also get passed bReincarnated = 1.
	]]--
	function Ob:getSaveEditables()
		--edit to make ShopItem Code work
		return (self.meshName and ' self.meshName = \''..self.meshName..'\' self.iNumStock = \''..self.iNumStock..'\' self.bSold = \''..self.bSold..'\' ') or ' '
		--return (self.meshName and ' self.meshName = \''..self.meshName..'\' ') or ' '
	end

	--[[ @shouldBeInLevel
		Returns
			1 if this should be in the current level (use Global.levelScript:getLevelPrefix() and other such functions to
			get that information; they won't be passed in); 0 if not.
	]]--
	function Ob:shouldBeInLevel()
		if self.level == 'all' or self.level == Global.levelScript:getLevelPrefix() or self.level == Global.levelScript.levelType then
			return 1
		else
			return 0
		end
	end


	function Ob:beNotPickupable()
		if self.mover and self.bInteresting == 1 and self.bUseDefaultUncollectedAnim == 1 then
			DetachEntityFromParent(self)
			KillScript(self.mover)
			self.mover = nil
		end
		if self.pickupSphere then
			Trigger_UnregisterListener(self.pickupSphere, self)
			TriggerSphere_Delete(self.pickupSphere)
			self.pickupSphere = nil
		end
		if self.interestFX then 
			self.interestFX:stop(0, 0, 1)
			self.interestFX = nil
		end
		
		--Kill fire if we are on fire
		if(self.bOnFire == 1) then
			self:fireDissipate()
		end
		--Get rid of gauge too, if its there.
		if(self.firestartingHelper) then
			self.firestartingHelper:killSelf()
		end

		self.bInteresting = 0
		self:setEntityInterestLevel(0)
		SetMaxViewDistance(self, 0)
		self.Telekinesis = kTKBEHAVIOR_NONE
	end
	
	function Ob:bePickupable()
		if self.bInteresting == 1 then
			return
		end
		self.bInteresting = 1
		self.Telekinesis = self.pickupableTKValue

		self:setEntityInterestLevel(self.interestLevel)
		SetMaxViewDistance(self, self.maxViewDistance)
		if not self.pickupSphere then
			local x, y, z = self:getPosition()
			self.sphereSize = (self.iTriggerSphereRadius or max((self.collSphereRadius and self.collSphereRadius*1.8) or 200, 150))
			if self.bAttachTrigger == 1 then
				self.pickupSphere = TriggerSphere_New(0,0,0, self.sphereSize, self)
			else
				self.pickupSphere = TriggerSphere_New(x,y,z, self.sphereSize)
			end
			Trigger_RegisterListener(self.pickupSphere, self)		
		end
		self:regenInterestFX()
		if self.bUseDefaultUncollectedAnim == 1 then
			if not self.mover then
				self.mover = SpawnScript('Global.Props.Geometry', nil, 'self.meshName = \'Characters/GenericMover.plb\' self.bForceSimulate = 1', 1)
				SetEntityFlag(self.mover, ENTITY_DETAIL_CULLING, 0)
				SetEntityVisible(self.mover, 1)
				SetEntityAlpha(self.mover, 1, 0)
				SetEntityFlag(self.mover, ENTITY_CANNOTBESTOODON, 1)
				SetPhysicsFlag(self.mover, PHYSICS_SLIDEONCOLLIDE, 1)
				SetPhysicsFlag(self.mover, PHYSICS_COLLIDEE, 1)
				SetPhysicsFlag(self.mover, PHYSICS_NOT_REALLY_COLLIDEE, 1)
				SetPhysicsFlag(self.mover, PHYSICS_COLLIDER, self.applyGravity)
				SetPhysicsFlag(self.mover, PHYSICS_APPLYGRAVITY, self.applyGravity)
				SetSimulationCullDistance(self.mover, self.SIM_CULL_DIST)
				local me = self
				self.mover.onNewMoveCollide = function(self, data, from)
					%me:onNewMoveCollide(data, from)
				end
			end
			self.mover:setPosition(self:getPosition())
			self.mover:setOrientation(self:getOrientation())
			AttachEntityToEntityBone(self, self.mover, 'rootJ_1')
			self:createTimer(RandInt(5, 2000), self.TIMER_START_MOVER_ANIM) -- so not all movers are n sync
		end
		SetEntityCollideSphere(self, 2, self.collSphereXOff, self.collSphereYOff, self.collSphereZOff) 
	end

	function Ob:regenInterestFX()
		if not self.interestFXName then return end
		if IsSimulationCulled(self)==1 then return end
		if self.interestFX then
			-- temporary warning
			GamePrint(TT_Warning, 'Dangling interest fx '..self.interestFX.Name)
			self.interestFX:stop(0, 0, 1)
			self.interestFX = nil
		end

		self.interestFX = Global.levelScript:getPool(self.interestFXName):get()
		SetEntityDomain(self.interestFX, GetEntityDomain(self))
		local rootJoint = GetRootJointName(self)
		if rootJoint then
			self.interestFX:run()
			self.interestFX:attach(self, rootJoint)
			self.interestFX:setPosition(0, 0, 0)
		else
			self.interestFX:run(self)
			self.interestFX:attach(self)
			local sx, sy, sz = self:getPosition()
			local lx, ly, lz = GetEntityLookCenter(self)
			-- LookCenter is in world coords.  Convert to local: translate and rotate.
			local pi, ya, ro = InvertOrientation(self:getOrientation())
			-- Now set the interest fx at their proper position in 
			-- Then set the interest fx at their proper position in local coordinate system.
			self.interestFX:setPosition(RotateVector(pi, ya, ro, lx-sx, ly-sy, lz-sz))
		end
	end

	function Ob:setPosition(x, y, z)
		if self.mover and self.bInteresting == 1 then
			self.mover:setPosition(x, y, z)
		else
			%Ob.Parent.setPosition(self, x, y, z)
		end
	end

	function Ob:setVelocity(vx, vy, vz)
		if self.mover and self.bInteresting == 1 then
			self.mover:setVelocity(vx, vy, vz)
		else
			%Ob.Parent.setVelocity(self, vx, vy, vz)
		end
	end


	function Ob:onItem(itemName, from)
		if itemName == '' then			
			if self.bDontPutAwayHeldItem == 0 then -- so things like cards and 1ups will Not put the current item away
				if Global.player.HeldItem then
					Global.player:replaceSelectedItemInPsack(1, 1)
				end
			end
			local emitter = Global.levelScript:getPool('Global.Effects.CollectFX'):get()
			emitter:attach(Global.player)
			emitter:runThenPool()
			self:addToInventory(self.bAutoSelect)
        else
			from:sendMessage(FindScriptObject(itemName), 'ActivateFail', self.Name)
		end
	end

	function Ob:onNewMoveCollide(_, from)
		if from == Global.player and self.bInteresting == 1 then
			self:onItem('', Global.player)
		end

		--edit might be important for shop items? Leaving out for now
		--function Ob:onNewMoveCollide(a, from, b, c)
		--if self.bSold == 1 then
			--%Ob.Parent.onNewMoveCollide(self, a, from, b, c)
		--end
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if from and from == Global.player and self.bInteresting == 1 and IsSimulationCulled(self) ~= 1 then	-- we only want the player to pick up held objects
			self:onItem('', from)
		end

		--edit More ShopItem Code
		if self.bSold == 1 then
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

	function Ob:onTKPickup(data, from)
		-- make sure that we can't collect in other ways
		self.bInteresting = 0
		Global.player:interruptPowers()		
		-- move the object to Raz
		if (self.mover) then
			DetachEntityFromParent(self)
			self.mover = nil
		end
		self.rMovementThread = MovementUtils:interpolateToEnt(self, Global.player, 'handJALf_2', self.TK_INTERP_TO_PLAYER_TIME, 0, nil, nil, self.tkInterpCallback)
		-- make raz play the anim
		Global.player:tkPickupItem(self)
	end

	function Ob:tkInterpCallback()
		self:onItem('', from)
	end

	function Ob:addToInventory(bHoldImmediately, bSilent)
        if (self.rMovementThread) then
			self.rMovementThread:killSelf()
		end
		self:beNotPickupable()
		self.player:addToInventory(self, (self.bAutoSelect == 1 and 1) or bHoldImmediately, bSilent)
		--self:setVelocity(0, 0, 0)
		self:setState(nil)
	end

	function Ob:onAddedToInventory(data, from)
        self.bInInventory = 1
	end

	function Ob:onRemovedFromInventory(data, from)
		self.bInInventory = 0
	end

	function Ob:onActivateFromInventory(data, from)
		if self.onActivateFail then self:onActivateFail(data, from) end
	end
	
	-- The following function is NEVER CALLED
	-- To get around a bug in this function, Dart.lua installs a patch so that
	-- a new clairvoyance handler gets called for HeldObject.
	-- This was needed so that every packfile did not have to be rebuilt and we could
	-- roll out a patch to the pc version
	function Ob:onClairvoyance(data, from)
		local lookTarget = Global.player:getLookTarget()
		if lookTarget ~= self and lookTarget and lookTarget.onClairvoyance then
			lookTarget:onClairvoyance(data, from)
		elseif self:xCanClairvoyOwner() == 1 then
			FindScriptObject(self.ownerName):onClairvoyance(data, from)
		else
			Global.player:onPowerFailed(kPOWER_CLAIRVOYANCE)
			if IsSaylineDone(Global.player) == 1 then Global.player:sayLine("/GLRA000RA/", 0, 1, nil, 1, nil, 1) end--DIALOG=<<Hm. I\'m not getting anything. I must be out of range or something.>>
			self:dontRunPlayerControls(0)
		end
	end

	function Ob:xCanClairvoyOwner()
		local obj = self.ownerName and FindScriptObject(self.ownerName, 1) 
		if obj and IsDomainSleeping(GetEntityDomain(obj)) ~= 1 and Global.player:distance(obj) < 5000 then return 1 end
	end

	function Ob:onTimer(id)
		if id == self.TIMER_START_MOVER_ANIM then
			if self.mover then LoadAnim(self.mover, 'Anims/CO_CollectibleMover/CollectibleMover.jan') end
			self:killTimer(id)
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	function Ob:onDomainChange(old, new)
		if new == 'InvItems' and self.interestFX then
			GamePrint('ERROR: Attempt to put interestFX into the InvItems domain.')
			StackTrace()
		elseif self.interestFX then 
			SetEntityDomain(self.interestFX, GetEntityDomain(self)) 
		end
	end

	function Ob:onSimulationCulled(bCull)
		%Ob.Parent.onSimulationCulled(self, bCull)
		if bCull == 1 then
			if self.pickupSphere then
				Trigger_UnregisterListener(self.pickupSphere, self)
			end
			if self.interestFX then 
				self.interestFX:stop(0, 0, 1)
				self.interestFX = nil
			end
		else
			if self.pickupSphere then
				Trigger_RegisterListener(self.pickupSphere, self)
			end
			if not self.interestFX and self.bInteresting == 1 then
				self:regenInterestFX()
			end
		end
	end

	function Ob:onEndLevel()
		-- Call parent
		%Ob.Parent.onEndLevel(self)
		-- Remove ourselves, but leave us marked as in the inventory
		self:killSelf(1)
	end

--************************************************************************

	--edit More Shop Item Code
	function Ob:getItem(direction)
		if (direction == 'UP') then
			if IsDead(self.rItemUp) == 1 then
				self.rItemUp = nil
			end
			return self.rItemUp
		elseif (direction == 'DOWN') then
			if IsDead(self.rItemDown) == 1 then
				self.rItemDown = nil
			end
			return self.rItemDown
		elseif (direction == 'LEFT') then
			if IsDead(self.rItemLeft) == 1 then
				self.rItemLeft = nil
			end
			return self.rItemLeft
		elseif (direction == 'RIGHT') then
			if IsDead(self.rItemRight) == 1 then
				self.rItemRight = nil
			end
			return self.rItemRight
		else
			GamePrint('WARNING: You must pass in either UP DOWN LEFT or RIGHT.  Not: '..(direction or 'nil')..'.')
			return nil
		end	
	end

	function Ob:getItemDescription()
		return self.sItemDescription
	end

	function Ob:getItemExplanation()		
		if (self.sItemExplanation ~= nil) then
			return self.sItemExplanation
		else
			return nil
		end
	end	

	function Ob:setPrice(price)
		self.iPrice = price
	end

	function Ob:getPrice()
		return self.iPrice
	end		

	function Ob:getRank()
		return self.iRank
	end

	function Ob:sold()
		local newItem = nil
--		if (self.iNumStock == nil or self.iNumStock <= 0) then -- infinite inventory
		--edit to >=
		if (self.iNumStock and self.iNumStock >= 0) then -- infinite inventory
			newItem = self
		else
			newItem = self:removeFromNeighbors()
		end
		return newItem
	end

	function Ob:removeFromNeighbors()
		local newItem
		if (self.rItemUp) then
			self.rItemUp:disconnect(self)
			newItem = self.rItemUp
		end
		if (self.rItemDown) then
			self.rItemDown:disconnect(self)
			newItem = self.rItemDown
		end
		if (self.rItemLeft) then
			self.rItemLeft:disconnect(self)
			newItem = self.rItemLeft
		end
		if (self.rItemRight) then
			self.rItemRight:disconnect(self)
			newItem = self.rItemRight
		end
		return newItem
	end
	
	function Ob:disconnect(item)
		if item == self.rItemUp then
			if self.rItemUp.rItemLeft and IsDead(self.rItemUp.rItemLeft) ~= 1 then
				self.rItemUp = self.rItemUp.rItemLeft
			elseif self.rItemUp.rItemRight and IsDead(self.rItemUp.rItemRight) ~= 1 then
				self.rItemUp = self.rItemUp.rItemRight
			else
				self.rItemUp = nil
			end
		elseif item == self.rItemDown then
			if self.rItemDown.rItemLeft and IsDead(self.rItemDown.rItemLeft) ~= 1 then
				self.rItemDown = self.rItemDown.rItemLeft
			elseif self.rItemDown.rItemRight and IsDead(self.rItemDown.rItemRight) ~= 1 then
				self.rItemDown = self.rItemDown.rItemRight
			else
				self.rItemDown = nil
			end
		elseif item == self.rItemLeft then
			self.rItemLeft = self.rItemLeft.rItemLeft
		elseif item == self.rItemRight then
			self.rItemRight = self.rItemRight.rItemRight
		end
	end

	function Ob:setNeighbors(up, down, left, right)		
		self.rItemUp = up
		self.rItemDown = down
		self.rItemLeft = left
		self.rItemRight = right
	end
	
	return Ob
end
