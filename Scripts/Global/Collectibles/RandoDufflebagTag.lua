function RandoDufflebagTag(Ob)

	-------------------------------------------------------------------
	--               	CONSTRUCTOR
	-------------------------------------------------------------------

	if (Ob == nil) then 	
		Ob = CreateObject('Global.Props.HeldObject')
		-- Types: dufflebag_tag, hatbox_tag, purse_tag, steamertrunk_tag, suitcase_tag
		Ob.sBaggageType = 'dufflebag_tag' -- Editable
		Ob.invSortKey = 15
		--edit
		Ob.level = 'all'
		Ob.collSphereRadius = 50
		
		
		Ob.bUseDefaultUncollectedAnim = 0
		Ob.bDontPutAwayHeldItem = 1
		--edit
		--Ob.bAttachTrigger = 0
		Ob.dependencies = {
			textures = {
				'Textures/icons/InventoryItems/DufflebagTag.dds',
				'Textures/icons/InventoryItems/HatboxTag.dds',
				'Textures/icons/InventoryItems/PurseTag.dds',
				'Textures/icons/InventoryItems/SteamertrunkTag.dds',
				'Textures/icons/InventoryItems/SuitcaseTag.dds',  		
			}
		}
	end

	-------------------------------------------------------------------
	--               	SCRIPT INITIALIZATION
	-------------------------------------------------------------------                     
	function Ob:onBeginLevel()	
		if not self.sBaggageType then
			GamePrint('ERROR: No tag type found.  Defaulting to hatbox_tag.')
			self.sBaggageType = 'hatbox_tag'
		end

		--edit
		if Global.player.stats.RandoDufflebagTag[self.Name] == 'collected' then
			self:killSelf()
		end

		--edit Removed
		--[[self.sBaggageType = strlower(self.sBaggageType)
		if Global.player.stats.bagTagsCollected[self:getBagType()] == 1 then
			self:killSelf()
			return nil			   
		end
		]]

        --edit        
		self.meshName = 'GlobalModels/Objects/HeldObjects/dufflebag_tag.plb'
		

		%Ob.Parent.onBeginLevel(self)
		self.HeldPosX = 7.9;
		self.HeldPosY = 31.5;
		self.HeldPosZ = 0;
		self.HeldRotX = 3.905;
		self.HeldRotY = -18.234;
		self.HeldRotZ = 15.362;
		self.clutchAnim = 'Anims/DartNew/BodyParts/Hold_PinchPalmIn_ArmLf.jan'
		SetEntityCollideSphere(self, 40, 20, 100, 0, 0)
		SetEntityCollideSphere(self, 40, 20, 40, 0, 1)
		SetEntityLookOffsetPos(self,0,80,0)
		if (self.sBaggageType == 'dufflebag_tag') then
			self.displayName = "/GLZB001TO/"--DIALOG=<<Dufflebag Claim Ticket>>
			self.pickupSpriteName = 'DufflebagTag'
		elseif (self.sBaggageType == 'hatbox_tag') then
			self.displayName = "/GLZB002TO/"--DIALOG=<<Hatbox Claim Ticket>>
			self.pickupSpriteName = 'HatboxTag'
		elseif (self.sBaggageType == 'purse_tag') then
			self.displayName = "/GLZB003TO/"--DIALOG=<<Purse Claim Ticket>>
			self.pickupSpriteName = 'PurseTag'
		elseif (self.sBaggageType == 'steamertrunk_tag') then
			self.displayName = "/GLZB004TO/"--DIALOG=<<Steamer Trunk Claim Ticket>>
			self.pickupSpriteName = 'SteamertrunkTag'
		elseif (self.sBaggageType == 'suitcase_tag') then
			self.displayName = "/GLZB005TO/"--DIALOG=<<Suitcase Claim Ticket>>
			self.pickupSpriteName = 'SuitcaseTag'
		end       
		if strfind(FindScriptObject('LevelScript').Type, 'BV') then
			--edit
			SetBaseTexture(self, 'Textures/Collectibles/co_dufflebag_tag_BV.dds')
		end
        
		self:setScale(3)
		
		SetEntityFlag(self, ENTITY_CANNOTBESTOODON, 1)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetEntityInterestLevel(self, kEMOTIONAL_BAGGAGE_INTEREST)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 1)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 1)
		
		-- set up light rig
		SetEntityFlag(self, ENTITY_LIGHT_RIG, 1)
		SetEntityLightRigScale(self, 1.5, 3, 1.5)

		if (self.sBaggageType == 'dufflebag_tag') then
			self:loadAnim('Anims/Emotional Baggage/dufflebagTag_idle.jan', 0.1, 1)
		elseif (self.sBaggageType == 'hatbox_tag') then
			self:loadAnim('Anims/Emotional Baggage/hatboxTag_idle.jan', 0.1, 1)
		elseif (self.sBaggageType == 'purse_tag') then
			self:loadAnim('Anims/Emotional Baggage/purseTag_idle.jan', 0.1, 1)
		elseif (self.sBaggageType == 'steamertrunk_tag') then
			self:loadAnim('Anims/Emotional Baggage/steamertrunkTag_idle.jan', 0.1, 1)
		elseif (self.sBaggageType == 'suitcase_tag') then
			self:loadAnim('Anims/Emotional Baggage/suitcaseTag_idle.jan', 0.1, 1)
		end
		SetPhysicsFlag(self, PHYSICS_ORIENTTOGRAVITY, 1)
		SetEntityGravityDir(self, GetEntityUp(self))
		
	end    

	function Ob:getSaveEditables()
		return 'self.sBaggageType = \''..self.sBaggageType..'\''
	end
	
	-------------------------------------------------------------------
	--               	STATES
	-------------------------------------------------------------------
	function Ob:statePickup()
		local bagType = self:getBagType() -- so that our type matches up with the bags
		if (self.sBaggageType == 'dufflebag_tag') then
			self:loadAnim('Anims/Emotional Baggage/dufflebagTag_default.jan', 0, 0)
		elseif (self.sBaggageType == 'hatbox_tag') then
			self:loadAnim('Anims/Emotional Baggage/hatboxTag_default.jan', 0, 0)
		elseif (self.sBaggageType == 'purse_tag') then
			self:loadAnim('Anims/Emotional Baggage/purseTag_default.jan', 0, 0)
		elseif (self.sBaggageType == 'steamertrunk_tag') then
			self:loadAnim('Anims/Emotional Baggage/steamertrunkTag_default.jan', 0, 0)
		elseif (self.sBaggageType == 'suitcase_tag') then
			self:loadAnim('Anims/Emotional Baggage/suitcaseTag_default.jan', 0, 0)
		end	
		Yield()   --so the default anim loads so the clutch looks right
		--edit to sendMessage to Dart
		self:sendMessage(Global.player, 'CollectedDufflebagTag', self.Name, 1)
		GamePrint('GotItem '..self.Name)

		Global.player.invDisplayer:journalItemAdded(self)
		self:killSelf()
	end
	
	
	function Ob:getBagType()
		local bagType
		if (self.sBaggageType == 'dufflebag_tag') then
			bagType = 'dufflebag'
		elseif (self.sBaggageType == 'hatbox_tag') then
			bagType = 'hatbox'
		elseif (self.sBaggageType == 'purse_tag') then
			bagType = 'purse'
		elseif (self.sBaggageType == 'steamertrunk_tag') then
			bagType = 'steamertrunk'
		elseif (self.sBaggageType == 'suitcase_tag') then
			bagType = 'suitcase'
		else
			bagType = 'ERROR: invalid tag type '..(self.sBaggageType or 'nil')
		end	
		return bagType
	end

	-------------------------------------------------------------------
	--               MESSAGE HANDLERS
	-------------------------------------------------------------------
	
	function Ob:onItem(itemName, from)
		if (itemName == '') then
			self:setState('Pickup')
			local emitter = Global.levelScript:getPool('Global.Effects.CollectFX'):get()
			emitter:attach(Global.player)
			emitter:runThenPool()
		else
			from:sendMessage(FindScriptObject(itemName), 'ActivateFail', self.Name)
		end
	end

	function Ob:onActivateFail(data, from)
	--[[
		if data == '0' then  --trying to use in thin air 
           		if (self.sBaggageType == 'dufflebag_tag') then
                		Global.player:sayLine("If I find a duffel-bag, I can sort it with this tag.",0,1)
            		elseif (self.sBaggageType == 'hatbox_tag') then
                		Global.player:sayLine("If I find a hat box, I can sort it with this tag.",0,1)
        		elseif (self.sBaggageType == 'purse_tag') then
                		Global.player:sayLine("If I find a purse, I can sort it with this tag.",0,1)
        		elseif (self.sBaggageType == 'steamertrunk_tag') then
                		Global.player:sayLine("If I find a steamer trunk, I can sort it with this tag.",0,1)
        		elseif (self.sBaggageType == 'suitcase_tag') then
                		Global.player:sayLine("If I find a suitcase, I can sort it with this tag.",0,1)
            		end
        	else  -- trying to use on an object
            		Global.player:sayLine("This tag is meant for sorting emotional baggage, not that.",0,1)   
    		end 
	]]--
    end

	return Ob

end

