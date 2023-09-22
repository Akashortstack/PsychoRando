function RandoPsiChallengeMarker(Ob)

	if (not Ob) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'GlobalModels/CO_Collectibles/Co_PSIChallengeMarker02.plb'	-- Editable
		Ob.spinAnim = 'Anims/PSIChallenge/Spin.jan'
		Ob.iTriggerSphereRadius = 75
		Ob.iTriggerSphereOffset = 30
		Ob.displayName = "/GLZB000TO/"--DIALOG=<<PSI Challenge Marker>>
		Ob.pickupSpriteName = 'PsiChallengeMarker'
		Ob.maxViewDistance = 6000
		Ob.SIM_CULL_DIST = 3000
		Ob.eyeJoint = 'EyeRoot'
		Ob.value = 1
		Ob.dependencies = {
			textures = {
				'textures/fxtextures/lensflares/lensflareyellowsmall.tga',
			},
		}
	end
    
-- **************************************************************************************************
    
	function Ob:onBeginLevel()
		if self.bDynamicallyCreated ~= 1 then 
			-- Spawned markers don't count towards area stats.
			Global.levelScript.numMarkersInLevel = Global.levelScript.numMarkersInLevel + 1
		end
		-- First off, register ourselves with the engine
		if self.bDynamicallyCreated ~= 1 and RegisterCollectible(self) ~= 1 then	-- dont want to register ourself if we were spawned
			self:killSelf()
			return nil
		end

		--edit
		if Global.player.stats.RandoPsiMarker[self.Name] == 'collected' then
			self:killSelf()
		end
		
		%Ob.Parent.onBeginLevel(self)
		SetSimulationCullDistance(self, self.SIM_CULL_DIST)
		
		SetMeshIsBackwards(self,1)
		self:loadAnim(self.spinAnim, 0.2, 1)
		
		-- LOOK TARGET CODE
        SetEntityFlag(self,ENTITY_LOOKATINTERESTINGTHINGS, 1)
		SetHeadJoint(self, self.eyeJoint)
		SetHeadConstraint(self, 360,360,360)
		--SetMeshLookAtParams(self, 0.179875,0.264430,0.058572)
		LookAtEntity(self, Global.player)
		SetMaxViewDistance(self, self.maxViewDistance)
		self.pickUpMusic = LoadSound('PSIMarkerMusic')
        
		self:useFX(1)
		
		self.rCollectedSoundHandle = LoadSound('PsiChallengeMarker')		
		--self:setState('Pulsate')	-- commenting out because you cant even notice it
		self:setEntityInterestLevel(0)
		self:setState(nil)
    end    

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		-- requested that they all be moved up by 100.  Wacky.
		self:setPosition(self:getPosInFrontOf(0, 100))
	end

	function Ob:useFX(bUse)
		if bUse==1 then
			if self.emitter then return end

			--  particle system setup
			--  a nice cheap particle system that picks from four particles at random
			self.emitter = CreateParticleEmitter('PSIChallengeMarkerPE', 75)
			local x,y,z = self:getPosition()
			SetPosition(self.emitter, x,y,z)
			AttachEntityToEntity(self.emitter, self)
			PESetStartColor(self.emitter,202,255,200,218)
			PESetEndColor(self.emitter,255,255,255,0)
			PESetTexture(self.emitter,'textures/fxtextures/lensflares/lensflareyellowsmall.tga')
			PESetParticleBlendMode(self.emitter,kBLENDMODE_ADD_ALPHA)
			PESetParticleForce(self.emitter,0.000000,0.000000,0.000000)
			PESetApplyGravity(self.emitter,0)
			PESetPointSprite(self.emitter,0)
			PESetZSprite(self.emitter,0)
			PESetNoSpread(self.emitter,0)
			PESetRelative(self.emitter,0)
			PESetOriented(self.emitter,0)
			PESetCollideWithGround(self.emitter,0)
			PESetConeAngle(self.emitter,0.000000,180.000000)
			PESetParticleSpeed(self.emitter,30.000000,40.000000)
			PESetParticleSize(self.emitter,40.000000,80.000000)
			PESetParticleRotation(self.emitter,0,0,1)
			PESetParticleLifetime(self.emitter,1.000000,1.000000)
			PESetParticlesPerSec(self.emitter,1.000000,75.000000)
			PESetActive(self.emitter,1)
			PESetDistribution(self.emitter , kPD_SPHERE , kPDV_AXIAL, x,y,z,20,20)
		else
			if self.emitter then
				PESetActive(self.emitter, 0)
				PEReset(self.emitter, 0)
				PEDestroyEmitter(self.emitter)
				self.emitter = nil
			end
		end
	end

--************************************************************************************************* 
-- M E S S A G E  H A N D L E R S ***************************************************************** 
--*************************************************************************************************

	function Ob:onAddedToInventory()
		%Ob.Parent.onAddedToInventory(self)
		self:playSound(self.rCollectedSoundHandle, 0, 0, 1)		
		if tostring(self.Name) == 'challengemarker1' then
            if (Global.player.saved.BV.journal and Global.player.saved.BV.journal['GoalSecretPsi']) then
                JournalCompletedGoal(Global.player.saved.BV.journal['GoalSecretPsi'])
            end
        elseif tostring(self.Name) == 'challengemarker2' then
            if (Global.player.saved.BV.journal and Global.player.saved.BV.journal['GoalEasyPsi']) then
                JournalCompletedGoal(Global.player.saved.BV.journal['GoalEasyPsi'])
            end
        end
		
		-- Let the engine know I have been picked up
		if self.bDynamicallyCreated ~= 1 then
			CollectiblePickedUp(self)
		end
		Global.player.forceItemPutaway = 1
		Global.player:replaceSelectedItemInPsack()
		Global.player.invDisplayer:invItemAdded(self,0,0)
		self:sendMessage(Global.player, 'PSIChallengeMarker', self.value, 1)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoPsiMarker', self.Name, 1)

		UI_AdjustCollectible('PSIMarker', 1, self)
		self:killSelf()
	end

--************************************************************************************************* 
	
	function Ob:onDestroyed(bBecause)
		%Ob.Parent.onDestroyed(self, bBecause)
		if self.emitter and bBecause ~= 1 then
			self:useFX(0)
		end
	end

	function Ob:onItem(itemName, from)
		if itemName == '' then
			if Global.levelScript.Type == 'ca.CAJA' and self.bDynamicallyCreated == 1 then
				Global:saveGlobal('PSIMarkerMachineInUse',0)
				local collector = FindScriptObject('PSIMarkerCollector')
				if collector ~= nil then
					collector.tempMarker = nil
				end
			end
			self:setState('Collect')
		else
			%Ob.Parent.onItem(self, itemName, from)
		end
	end

--************************************************************************************************* 
-- S T A T E S ************************************************************************************ 
--************************************************************************************************* 

	function Ob:statePulsate()
		SetEntityGlow( self , 1.5 , 1)
		self:sleep(1)
		SetEntityGlow( self , .2 , 1 )
		self:sleep(1)
	end

	function Ob:beginStateCollect()
		self:beNotPickupable()
		AttachEntityToEntity(self, Global.player, 0)
		self:setPosition(0, 100, 0)
		self:loadAnim('Anims/PsiChallenge/Collect.jan', .1, 0)
		SetSimulationCullDistance(self, 0)
	end

	function Ob:stateCollect()
		if self:getAnimCompletion('collect.jan') == 1 then
			self:setState(nil)
		end
	end

	function Ob:endStateCollect()
		self:addToInventory()
	end

	function Ob:regenInterestFX()
		%Ob.Parent.regenInterestFX(self)
		if self.interestFX then
			self.interestFX:setPosition(0, 0, 0)
		end
	end

	function Ob:onSimulationCulled(bCull)
		%Ob.Parent.onSimulationCulled(self, bCull)
		self:useFX(1-bCull)
	end

  	return Ob
end
