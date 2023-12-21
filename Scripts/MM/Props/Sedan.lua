
function Sedan(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.Geometry')
		Ob.meshName = 'Levels/MM_MilkmanConspiracy/Vehicles/BlackSedan.plb' -- Editable
		Ob.openCollisionMeshName = 'Levels/MM_MilkmanConspiracy/Props/MM_SedanOpenCol.plb'
		Ob.propInTrunk = nil -- Editable
		Ob.arrowheadInTrunk = nil -- Editable
		Ob.bInteresting = 1
		
		-- set up animations
		Ob.punchedAnim = 'Anims/BlackSedan/TrunkOpen.jan'
		Ob.damagedAnim = 'Anims/BlackSedan/Damage.jan'
		Ob.openPriAnim = 'Anims/BlackSedan/TrunkOpen_priority.jan'
		Ob.idleAnimation = 'Anims/BlackSedan/Idle_loop.jan'
		
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.firestartResistance = 0
		
		-- the trunk will start out open when this is set
		Ob.startOpened = 0 -- Editable                   

		Ob.TIMER_PLAY_PRI = '6001'
		Ob.Confusion = 1
		Ob.height = 250
		Ob.Clairvoyance = 1
		Ob.bClairvoyancePlayerControl = 1
		Ob.clairFollows = 1
		Ob.confusionX = 0
		Ob.confusionY = 400
		Ob.confusionZ = 0	
		Ob.SIM_CULL_DIST = 4000	-- large default, not tuned
	
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'MM.Effects.SedanExhaust',
			},
		}        
        end

--  I N I T  **************************************************************************************
	
	function Ob:onBeginLevel()
		self.openCollision = SpawnScript('Global.Props.Geometry', nil, 'self.meshName = \''..self.openCollisionMeshName..'\'')
		self.openCollision:setEverything(self)
		self.openCollision:hide()
		%Ob.Parent.onBeginLevel(self)
		SnapEntityToGround(self)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 1)
		SetSimulationCullDistance(self, self.SIM_CULL_DIST)
		SetEntityFlag(self, ENTITY_CANNOTBESTOODON, 1)
		
		if self.propInTrunk == '' then self.propInTrunk = nil end

		if ( (self.propInTrunk) and (Global:loadGlobal('bMMCompleted') ~= 1) ) then
			self.propInTrunk = FindScriptObject(self.propInTrunk)
			if self.propInTrunk and self.propInTrunk.bInInventory ~= 1 then
				self.propInTrunk:setPosition(self:getPosInFrontOf(400, 150))
				self.propInTrunk:beNotPickupable()
				self.propInTrunk:hide()
			else
				self.propInTrunk = nil
			end
		else
			self.propInTrunk = nil
		end
		
		LoadAnim(self, self.idleAnimation, .2, 1)
		self:maybeUseExhaust()
		-- rescale
		self:setScale(1.7)

		self.rTrunkOpenSoundHandle = LoadSound('CarTrunk')
		self.rSatSoundSource = SpawnScript('Global.Sound.SoundSource', self.Name..'SatSoundSource', 'self.sCueName = \'SattelliteDish\'')
		if (self.rSatSoundSource) then
			AttachEntityToEntityBone(self.rSatSoundSource,self, 'dishJEnd_1', 0)
		end

		-- This is a safety sphere to launch Raz away from the sedan if he punches it while standing over the hood.
		-- I believe the onSupporting and onSupportingExit combo can now handle all cases of this, and this can 
		-- perhaps be removed-- needs further testing, though.
		self.onHoodSphere = TriggerSphere_New(0, 200, -350, 200, self)
		-- We don't actually care about any messages, but we have to register a listener to make Trigger_ContainsEntity work.
		Trigger_RegisterListener(self.onHoodSphere, self)
		
		self.goodiePosX, self.goodiePosY, self.goodiePosZ = 0, 150, -400
	end

	-- This pair of messages is used to determine if Raz is standing on the sedan, so it can 
	-- launch him up in the air if he punches it while standing on it.
	function Ob:onSupporting(_, from)
		if from == Global.player then
			self.bSupportingPlayer = 1
		end
	end

	function Ob:onSupportingExit(_, from)
		if from == Global.player then
			self.bSupportingPlayer = 0
		end
	end
	
--*************************************************************************************************
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		--edit to make all trunks open from beginning
		self.startOpened = 1

        if (self.startOpened == 1) then
			LoadPriorityAnim(self, self.openPriAnim, 1)
			if (self.propInTrunk and Global.player:isInInventory(self.propInTrunk.Name) ~= 1) then 
				self.propInTrunk:show() 
				self.propInTrunk:bePickupable()
			end
			self:switchCollision()
		end
	end
	
--*************************************************************************************************

	function Ob:switchCollision()
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		self.openCollision:show()
		self.openCollision:setEverything(self)
		self.bOpen = 1
	end

	function Ob:beginStateOpenTrunk()
		self.bProcessing = 1
	end
	
	function Ob:stateOpenTrunk()
		LoadAnim(self, self.punchedAnim, 0, 0)
		self:playSound(self.rTrunkOpenSoundHandle)
		while (self:getAnimCompletion('TrunkOpen.jan', 0) < 1) do
			Yield()
		end
		self:createTimer(1000, self.TIMER_PLAY_PRI)
		self:switchCollision()
		
		if self.propInTrunk then
			self.propInTrunk:show()
			SetEntityAlpha(self.propInTrunk, 0, 0)
			SetEntityAlpha(self.propInTrunk, 1, 1)
		elseif self.arrowheadInTrunk then
			local goodie
			self:spawnGoodies(RandInt(2,5), kGOODIE_ARROWHEAD)
		end
		self:setState(nil)
	end
	
	function Ob:endStateOpenTrunk()
		self.bProcessing = nil
	end
	
--*************************************************************************************************

	function Ob:onDestroyed(bBecause)
		if bBecause ~= 1 then
			if self.exhaust then
				self.exhaust:stop(1)
				self.exhaust:killSelf()
			end
		end
		if %Ob.Parent.onDestroyed then %Ob.Parent.onDestroyed(self, bBecause) end
	end

	function Ob:onSimulationCulled(bCull)
		%Ob.Parent.onSimulationCulled(self, bCull)
		self:maybeUseExhaust()
	end

	-- spawns or kills exhaust, as necessary
	function Ob:maybeUseExhaust()
		if IsSimulationCulled(self)==1 then
			if self.exhaust then
				self.exhaust:stop(1)
				self.exhaust:killSelf()
				self.exhaust = nil
			end
		else
			if not self.exhaust then
				self.exhaust = SpawnScript('MM.Effects.SedanExhaust')
				self.exhaust:attach(self, 'RearJEnd_1', 1)
				self.exhaust:setPosition(40, -45, 80)
				self.exhaust:setOrientation(0, 60, 0)
			end
		end
	end

	function Ob:onNewMoveMelee()
		if self.bOpen ~= 1 and self.bProcessing ~= 1 then
            self:setState('OpenTrunk')
		else
			if Trigger_ContainsEntity(self.onHoodSphere, Global.player) == 1 or self.bSupportingPlayer == 1 then
				local p, y = Global.player:getKnockBackTrajectory(self)
				Global.player:knockBack(nil, nil, p, y)
			end
			LoadAnim(self, self.damagedAnim, 0, 0)
		end
	end
	
--*************************************************************************************************

	function Ob:onPsiBlast()
		self:onNewMoveMelee()
	end
							   
--*************************************************************************************************

	function Ob:onTimer(id)
		if id == self.TIMER_PLAY_PRI then
			LoadPriorityAnim(self, self.openPriAnim, 1)
			if self.propInTrunk and IsDead(self.propInTrunk) ~= 1 and self.propInTrunk.bInInventory ~= 1 then
				self.propInTrunk:bePickupable()
				-- Test for when the item pops out of the trunk and is right next to Raz
				if Trigger_ContainsEntity(self.propInTrunk.pickupSphere, Global.player) == 1 then
					self.propInTrunk:addToInventory(Global.player)
				end
			end
			self:killTimer(id)
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

--*************************************************************************************************

	function Ob:onItem(data,from)
		if (data == '') then
			Global.player:sayLine("/MMAO000RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Who\'s in there?>>
		elseif (data == 'Flowers') then
			 Global.player:sayLine("/MMAO005RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Hey, come out of there. I have some flowers for you.>>
		elseif (data == 'Phone') then
			 Global.player:sayLine("/MMAO006RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Excuse me, you in the car. Phone\'s for you. Why don\'t you come out and get it?>>
		elseif (data == 'Plunger') then
			 Global.player:sayLine("/MMAO007RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Hey, you in the car. Free plunger. Gotta come out to get it.>>
		elseif (data == 'Sign') then
			 Global.player:sayLine("/MMAO008RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Hey, you in the car! Stop! And exit the vehicle please.>>
		elseif (data == 'RollingPin') then
			 Global.player:sayLine("/MMAO009RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Alright, come out of the car right now or I will roll this all over your hood.>>
		elseif (data == 'Rifle') then
			 Global.player:sayLine("/MMAO010RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Okay, come out of the car right now or I\'ll shoot!>>
		elseif (data == 'HedgeTrimmers') then
			 Global.player:sayLine("/MMAO011RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<I\'m going to take these hedge clippers and scratch the heck out of that car if you don\'t show your faces right now.>>
		elseif (data == 'WaterCan') then
			 Global.player:sayLine("/MMAO012RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Hey, looks like you\'re overheating. Why don\'t you come out so I can give you this water for your engine?>>
		end
	end
									   
--*************************************************************************************************

	function Ob:onConfusion()
		%Ob.Parent.onConfusion(self)
		self:loadAnim('Anims/BlackSedan/Confusion.jan', 0.1, 1)
	end

--*************************************************************************************************

	function Ob:onConfusionDone()
		%Ob.Parent.onConfusionDone(self)
		self:loadAnim(self.idleAnimation, 0.1, 1)
	end

--*************************************************************************************************

  	function Ob:onClairvoyance(data, from)
		--self:makeInvisible(1)
		Global.player:setClairvoyanceTarget(self, self.clairFollows)
		self:dontRunPlayerControls(0)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
	end 

	function Ob:onCancelClairvoyance()
		--self:makeVisible()
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 0)
	end

--*************************************************************************************************
	
	function Ob:onDestroyed(bBecause)
		if Global.player.lastClairTarget == self then
			Global.player:cancelClairvoyance()
		end
		%Ob.Parent.onDestroyed(self, bBecause)
	end

--*************************************************************************************************
	
	return Ob
end
