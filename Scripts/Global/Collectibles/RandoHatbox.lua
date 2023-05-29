--
--
--
-- !!!!!CUSTOM RANDO ITEM!!!!!
--
--
--    EmotionalBaggage.lua
--
--    from  P S Y C H O N A U T S
--	  Thien Tran
--    (c) 2003 Double Fine Productions, Inc.
--    All Rights Reserved.
--    Proprietary and Confidential
--
--    Naming Conventions:
--		b - boolean
-- 		s - string
--		i - number
--		r - reference
-- 		t - table
--
--  ***********************************************************************************************

-- Dialog Domain BVEB
-- Dialog BaseActor RA


--edit name
function RandoHatbox(Ob)

	-------------------------------------------------------------------
	--               	CONSTRUCTOR
	-------------------------------------------------------------------

	if (Ob == nil) then 	
		Ob = CreateObject('Prop')
		--Types: dufflebag, hatbox, purse, steamertrunk, suitcase
		Ob.sBaggageType = 'hatbox' -- Editable
		Ob.animTimerID = '1'
		Ob.dieTimerID = '2'
		Ob.ts_collect = nil	-- reference to trigger sphere used to detect player for purpose of collecting emo bag tag
		Ob.noticePlayerRadius = 200
		Ob.bCollected = 0
		--edit
		Ob.level = 'all'

		Ob.SIM_CULL_DIST = 2000	
		Ob.maxViewDistance = 1200

		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_BellHop.tga'
		Ob.bClairvoyancePlayerControl = 1
		Ob.clairOffY = 200
	end
    
	-------------------------------------------------------------------
	--               	SCRIPT INITIALIZATION
	-------------------------------------------------------------------                     
	
	function Ob:onBeginLevel()		  
		if not self.sBaggageType then
			GamePrint('Warning: EB type not specified.  Defaulting to HatBox.')
			self.sBaggageType = 'hatbox'
		end
		self.sBaggageType = strlower(self.sBaggageType)
		if self.sBaggageType == 'dufflebag' or self.sBaggageType == 'hatbox' or self.sBaggageType == 'purse' or self.sBaggageType == 'steamertrunk' or self.sBaggageType == 'suitcase' then
			-- valid type
		else
			GamePrint('ERROR: There is no such baggage type as '..(self.sBaggageType or 'nil')..'.  I recommend you change it.')
			self:setState('ErrorKill')
			return
		end

		--edit
		if Global.player.stats.RandoHatbox[self.Name] == 'collected' then
			self:killSelf()
		end

		self.leftTear = SpawnScript('Global.Effects.EmoBagTearFX', self.Name..'LeftTear')
		self.rightTear = SpawnScript('Global.Effects.EmoBagTearFX', self.Name..'RightTear')
		
		--edit Removed
		--if Global.player.stats.baggageCollected[self.sBaggageType] == 1 then
		--	self:killSelf()
		--	return nil
		--end
		%Ob.Parent.onBeginLevel(self)
		--edit
		self:loadMesh('GlobalModels/CO_Collectibles/CO_hatbox.plb')
		self:setScale(2)
		-- need to use this version of setscale
		-- Actually, you can't use that particular hack, because this has collision geometry.  Uses always pose, below.
		--SetScale(self, 2,2,2)
        
		local levelPrefix = strsub(GetCurrentLevelName(),1,2)
		if ( levelPrefix == 'BV' ) then
			--edit
			SetBaseTexture(self, 'Textures/Collectibles/co_hatbox_BV.dds')
		end
		SetActionTable(self, 'Anims/Emotional Baggage/hatbox.asd')

		if (self.leftTear ~= nil) then
			local domain = GetEntityDomain(self)
			SetEntityDomain(self.leftTear, domain)
		end
		if (self.rightTear ~= nil) then
			local domain = GetEntityDomain(self)
			SetEntityDomain(self.rightTear, domain)
		end
		
		if (self.sBaggageType == 'dufflebag') then
			self.whimperSound = self:loadSound('Dufflebag')
			SetEntityCollideSphere(self, 60, 0, 60, 60, 0)
			SetEntityCollideSphere(self, 60, 0, 60, -60, 1)
			SetEntityLookOffsetPos(self,0,60,0)
			self.noticePlayerRadius = 150
			self.rightTear:attach(self, 'headJ_1|eyeballRt_1', 1)
		elseif (self.sBaggageType == 'hatbox') then
			self.whimperSound = self:loadSound('Hatbox')
			SetEntityCollideSphere(self, 80, 0, 80, 0, 0)
			SetEntityCollideSphere(self, 80, 0, 180, 0, 1)
			SetEntityLookOffsetPos(self,0,80,0)
			self.noticePlayerRadius = 150
			self.rightTear:attach(self, 'eyeballJRt_1', 1)
		elseif (self.sBaggageType == 'purse') then
			self.whimperSound = self:loadSound('Purse')
			SetEntityCollideSphere(self, 50, 0, 50, 0)
			SetEntityLookOffsetPos(self,0,50,0)
			self.noticePlayerRadius = 100
			self.rightTear:attach(self, 'eyeballJRt_1', 1)
		elseif (self.sBaggageType == 'steamertrunk') then
			self.whimperSound = self:loadSound('Trunk')
			--SetEntityCollideSphere(self, 100, -95, 80, 0, 0) 
			--SetEntityCollideSphere(self, 100, 95, 80, 0, 1)           
			SetEntityCollideGeometry(self)
			SetEntityLookOffsetPos(self,0,100,0)
			self.rightTear:attach(self, 'eyeballJRt_1', 1)
			self.noticePlayerRadius = 200
		elseif (self.sBaggageType == 'suitcase') then
			self.whimperSound = self:loadSound('Suitcase')
			SetEntityCollideSphere(self, 60, 0, 60, 0)
			SetEntityLookOffsetPos(self,0,60,0)
			self.noticePlayerRadius = 100
			self.rightTear:attach(self, 'eyeballJRt_1', 1)
		end                                  
		self.leftTear:attach(self, 'eyeballJLf_1', 1)
		self.leftTear:setOrientation(0,180,0)
		
		SetMeshIsBackwards(self, 1)			   
		SetEntityFlag(self, ENTITY_CANNOTBESTOODON, 1)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_NOPHYSICS, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetEntityInterestLevel(self, kEMOTIONAL_BAGGAGE_INTEREST)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 0)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 1)
		SetSimulationCullDistance(self, self.SIM_CULL_DIST)
		
		-- set up light rig
		SetEntityFlag(self, ENTITY_LIGHT_RIG, 1)
		SetEntityLightRigScale(self, 3, 1, 3)

		--edit moved to SetCollectRadius()
		--[[ set up trigger sphere so we can detect when the player is near and thus check if the player has our matching emo bag tag
		local x,y,z = self:getPosition()
		self.ts_collect = TriggerSphere_New(x, y, z, self.noticePlayerRadius)
		Trigger_RegisterListener(self.ts_collect, self)		
		]]
		
		self.matchSound = self:loadSound('EmotBaggage_Succes')
		self.noMatchSound = self:loadSound('flower_off')
		
		self:setNewAction('Idle1')
		local randInt = random(5, 10)
		self:setNewAction('Idle2')	-- note that this animation runs once then switches to the Idle1 action state
		self.powerupSound = self:loadSound('poweruprecieved')
	end 
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self:playSound(self.whimperSound)
		
	end

	function Ob:getSaveEditables()
		return 'self.sBaggageType = \''..self.sBaggageType..'\''
	end
	
	function Ob:stateErrorKill()
		GamePrint('Errant emobag killing self.')
		self:killSelf()
	end
	
    -------------------------------------------------------------------
	--               	STATES
	-------------------------------------------------------------------
	function Ob:stateDie()
		self:sendMessage(Global.player, 'EmotionalBaggage', self.sBaggageType)
		self:killSelf()
	end
	
	function Ob:onDomainChange(old, new)
		%Ob.Parent.onDomainChange(self, old, new)
		if (self.leftTear ~= nil) then
			SetEntityDomain(self.leftTear, new)
		end
		if (self.rightTear ~= nil) then
			SetEntityDomain(self.rightTear, new)
		end
	end
	
	function Ob:beginStateCollection()
		SetSimulationCullDistance(self, 0)
	end
	
	function Ob:stateCollection()
		--pass 'args' to cutscene script
		Global.levelScript.cutsceneScript.matchMusic = self.matchMusic
		Global.levelScript.cutsceneScript.emoBag = self
		-- stop the crying sound
		StopSound(self.whimperSound)
		self.leftTear:stop()
		self.rightTear:stop()
		Global.levelScript.cutsceneScript:runCutscene('EmoBagCollection', 1, nil,nil,nil,nil, 1)
		Global.levelScript.emoBagCollectionRunning = 0
		self:setState('Die')
	end

	-------------------------------------------------------------------
	--               MESSAGE HANDLERS
	-------------------------------------------------------------------
	function Ob:onTimer(id)
	 	if(id == self.dieTimerID) then  -- die
			self:killTimer(id)
			self:setState('Die')
		end
	end
	
	function Ob:beginStateActivated()
		self.bProcessingActivated = 1
	end
	
	--if i'm activated while raz holding a tag
	function Ob:stateActivated()
		--edit stat type
		if (Global.player.stats.CollectedHatboxTag >= 1) then -- player has collected our matching tag
			--edit to sendMessage to Dart
			self:sendMessage(Global.player, 'CollectedHatbox', self.Name, 1)
			GamePrint('GotItem '..self.Name)

			self.bCollected = 1
			Global.player:setNewAction('Stand')
            self:killTimer(self.dieTimerID)
			StopSound(self.whimperSound)
			self:playSound(self.matchSound)
			Global.levelScript.emoBagCollectionRunning = 1
			self:setState('Collection')
		else	-- player hasnt picked up our tag yet
			self:playSound(self.noMatchSound,0,0)
			if (self.sBaggageType == 'dufflebag') then
				Global.player:sayLine("/GLEB000RA/",1, 1, nil, 1, nil, 1)	--DIALOG=<<This guy needs a duffle bag tag.>>
			elseif (self.sBaggageType == 'hatbox') then
				Global.player:sayLine("/GLEB001RA/",1, 1, nil, 1, nil, 1)	--DIALOG=<<This hat box needs a hat box tag.>>
			elseif (self.sBaggageType == 'purse') then
				Global.player:sayLine("/GLEB002RA/",1, 1, nil, 1, nil, 1)	--DIALOG=<<I need the purse tag here.>>
			elseif (self.sBaggageType == 'steamertrunk') then
				Global.player:sayLine("/GLEB003RA/",1, 1, nil, 1, nil, 1)	--DIALOG=<<I need the steamer trunk tag for this guy.>>
			elseif (self.sBaggageType == 'suitcase') then
				Global.player:sayLine("/GLEB004RA/",1, 1, nil, 1, nil, 1)	--DIALOG=<<Suitcase tag.  That\'s what I need here.>>
            		end
			if (Global.levelScript.demoLevel == 1 and self.sBaggageType == 'steamertrunk' and Global:load('EmoBagHintSeen') ~= 1) then
				Global:save('EmoBagHintSeen',1)
				Global.levelScript:addTutorialBox("/GLZG005TO/", 'Textures/icons/inventoryitems/SteamertrunkTag.dds')--DIALOG=<<This Steamer Trunk is lost without his Claim Ticket.  Find it for him and sort this Emotional Baggage out.>>
			end
			self:setState(nil)			
		end
	end							
	
	function Ob:endStateActivated()
		self.bProcessingActivated = nil
	end

  	function Ob:onClairvoyance(data, from)
		Global.player:setClairvoyanceTarget(self)
	end 
	
	function Ob:onItem()
		self:setState('Activated')
	end
	
--***********************************************************************************************************
	function Ob:onEnteredTriggerVolume(data, from)
		if (from == Global.player and self.bCollected ~= 1 
			and Global.cutsceneScript.cutscenePlaying ~= 1 and Global.levelScript.cutscenePlaying ~= 1
			and Global.levelScript.emoBagCollectionRunning ~= 1 and self.bProcessingActivated ~= 1) then
			
			self:setState('Activated')
		
		end
	end
--***********************************************************************************************************
	function Ob:onDestroyed(bBecause)
		if bBecause ~= 1 then
			if self.leftTear then self.leftTear:killSelf() end
			if self.rightTear then self.rightTear:killSelf() end
			if self.ts_collect then
				TriggerSphere_Delete(self.ts_collect)
				self.ts_collect = nil
			end
		end
	end
	
--***********************************************************************************************************

	--edit Custom function to create new collect radius after randomization
	function Ob:SetCollectRadius()
		local x,y,z = self:getPosition()
		self.ts_collect = TriggerSphere_New(x, y, z, self.noticePlayerRadius)
		Trigger_RegisterListener(self.ts_collect, self)
	end

	return Ob
end

