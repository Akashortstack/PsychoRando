--*
--*              "PSIChallengeCard.lua"                
--*  
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.  
--*            All Rights Reserved.
--*        Proprietary and Confidential
--*
--edit name
function RandoPsiCard(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.dependencies = {
			scripts = { 'Global.Effects.PsiChallengeCardFX' },
			meshes = { 'GlobalModels/CO_Collectibles/PsiCard.plb' },
--			textures = {  },	
		}

		Ob.scaleX = 1.5
		Ob.scaleY = 1.5
		Ob.scaleZ = 1.5
		Ob.HeldPosX = 20
		Ob.HeldPosY = 20
		Ob.HeldRotZ = 10
		Ob.iTriggerSphereRadius = 75
		Ob.iTriggerSphereOffset = 30
		Ob.value = 1
		Ob.level = 'all'
		Ob.displayName = "/GLZB010TO/"--DIALOG=<<PSI Challenge Card>>
		Ob.pickupSpriteName = 'PsiChallengeCard'
		Ob.bOnSpline = 0	-- only used by cobweb loom when it spawns a card and puts it on a spline
		Ob.potentialCards = {'arrow', 'cave', 'lines', 'omega', 'waves', 'plus', 'square', 'star', 'triangle'}
		Ob.bUseDefaultUncollectedAnim = 0 --We use a special fly animation for this baby
		Ob.bDontPutAwayHeldItem = 1
		Ob.SIM_CULL_DIST = 6000
	end	
	
	function Ob:onBeginLevel()
		--self.meshName = 'GlobalModels/CO_Collectibles/PsiChallengeCard_'..self.potentialCards[RandInt(1, getn(self.potentialCards))]..'.plb'
		SetSimulationCullDistance(self, self.SIM_CULL_DIST)
		self.meshName = 'GlobalModels/CO_Collectibles/PsiCard.plb'
		if self.bDynamicallyCreated ~= 1 then
			-- Don't count dynamically created cards toward level totals in journal.
			Global.levelScript.numCardsInLevel = Global.levelScript.numCardsInLevel + 1
		end
		if self.bDynamicallyCreated ~= 1 and RegisterCollectible(self) ~= 1 then	-- only want to register ourself if we werent spawned
			self:killSelf()
			return
		end

		--edit
		if Global.player.stats.RandoPsiCard[self.Name] == 'collected' then
			self:killSelf()
		end

		%Ob.Parent.onBeginLevel(self)
		Global.levelScript:getPool('Global.Effects.PsiChallengeCardFX'):setLowerLimit(5)
		self.effect = Global.levelScript:getPool('Global.Effects.PsiChallengeCardFX'):get()
		self.effect:setPosition(self:getPosInFrontOf(0, 60))
		self.effect:run()
		self.rCollectedSoundHandle = LoadSound('PsiCard')
		
		--Load animation of card flying around
		LoadAnim(self, 'Anims/PsiChallenge/PsiCardSpin_loop.jan', 1)
		self:setState(nil)
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

	function Ob:addToInventory()
		self:playSound(self.rCollectedSoundHandle, 0, 0, 1)
		self:beNotPickupable()	
		if self.bOnSpline == 1 then	-- just in case we get picked up before we finish on the spline
			DetachFromSpline(self)
			self.bOnSpline = 0
		end
		self:sendMessage(Global.player, 'CollectedPSIChallengeCard', self.value, 1)

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoPsiCard', self.Name, 1)
		
		if self.bDynamicallyCreated ~= 1 then -- only want to register ourself if we werent spawned
			CollectiblePickedUp(self)
		end
--		if (self.HeldItem == nil or self.HeldItem.Type ~= ')
--		Global.player:replaceSelectedItemInPsack()
		--Global.player.invDisplayer:invItemAdded(self,0,0)
		-- remove self from the inventory

		--edit to killself and get rid of effects
		self:killSelf()
		--if self.bDynamicallyCreated ~= 1 then -- only want to register ourself if we werent spawned
			--Global.player:removeFromInventory(self)
			--self:killSelf()
		--else
--			local pool = Global.levelScript:getPool('Global.Collectibles.PSIChallengeCard')
--			pool:pool(self)
		
	end

	function Ob:onDestroyed(bBecause)
		%Ob.Parent.onDestroyed(self, bBecause)
		if self.effect and bBecause ~= 1 then
			self.effect:stop(1, 1)
			self.effect = nil
		end
	end

	function Ob:killSelf()
		%Ob.Parent.killSelf(self)
		-- Why am I duping this?  Intermittent, non-reproable reports of lingering effects.  I don't know how
		-- something could avoid its onDestroyed, but I'm giving this a shot.
		if self.effect and bBecause ~= 1 then
			self.effect:stop(1, 1)
			self.effect = nil
		end
	end

	function Ob:onSplinePointArrive(data,from)	-- this function is only used if we were spawned by the cobweb loom
		if (self.effect ~= nil) then
			self.effect:stop(1,1)
			self.effect = nil
		end
		if data == self.lastSplinePt then	-- incase we finish on the spline before we get picked up
			DetachFromSpline(self)
			SetVelocity(self, 0, 0, 0)
			self.bOnSpline = 0
		end
	end
	
	-- function used by cobweb loom since we want to attach our visual FX to self here and detach ourself from our parent
	-- so that everything looks right when we attach ourself to the spline
	function Ob:useSpline(splineHandle, time, loopMode, lastPoint)
		self.lastSplinePt = tostring(lastPoint)
		DetachEntityFromParent(self)	-- we wont move on the spline if we dont detach ourself from mover
		if (self.effect ~= nil) then
			self.effect:attach(self)	-- otherwise it wont follow the spline
		end
		self.bOnSpline = 1
		UsePath(splineHandle, self, time, loopMode)	-- card code takes care of detaching itself from spline		
	end
	
	function Ob:onSimulationCulled(bCull)
		%Ob.Parent.onSimulationCulled(self, bCull)
		if bCull == 1 then
			if self.effect then 
				self.effect:stop(0, 1)
				self.effect = nil
			end
		else
			if not self.effect and self.bInteresting == 1 then
				self.effect = Global.levelScript:getPool('Global.Effects.PsiChallengeCardFX'):get()
				self.effect:setPosition(self:getPosInFrontOf(0, 60))
				self.effect:run()
			end
		end
	end

	return Ob
end
