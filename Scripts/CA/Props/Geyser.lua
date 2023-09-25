function Geyser(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		Ob.itemPlugging = '' -- Editable
		Ob.tvName = '' -- Editable
		Ob.TIMER_SPEW = '8000'
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.idleEmitter = SpawnScript('CA.Effects.GeyserIdleFX')
		self.plumeEmitter = SpawnScript('CA.Effects.GeyserPlumeFX')
		self.pluggedEmitter = SpawnScript('CA.Effects.GeyserPluggedFX')
		self.breakFreeEmitter = self.plumeEmitter
		self.blockedByShieldEmitter = SpawnScript('CA.Effects.GeyserUnderShieldFX')
		self.completionSound = LoadSound('YouWin')

		if self.itemPlugging and self.itemPlugging ~= '' and Global:load('bSolvedGeyserPuzzle') ~= 1 then
			self.itemPlugging = FindScriptObject(self.itemPlugging)
			--edit remove
			--if self.itemPlugging.bInInventory == 1 then self.itemPlugging = nil end
			if self.itemPlugging then 
				self.bPlugged = 1
				Global.notSaved.pluggedGeyser = self.Name
			end
			self.pluggedEmitter:run(self)
			self:loadMesh('Levels/CA_Campgrounds/Props/GeyserTubeBlocked.plb')
		else
			--edit removed
			--self.itemPlugging = nil
			Global.notSaved.normalGeyser = self.Name
		end
		if self.tvName and self.tvName ~= '' then
			if self.tvName == 'test_volume' then
				self.sphere = TriggerSphere_New(0, 0, 0, 100, self)
				Trigger_RegisterListener(self.sphere, self)
			else
				RegisterTriggerVolume(self, self.tvName)
			end
		end
		self:createTimer(10000, self.TIMER_SPEW)
		
		SetSimulationCullDistance( self, 6000)
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		--edit moved to use 
		self.itemPlugging = FindScriptObject(self.itemPlugging)
		--edit removed
		--if not Global.notSaved.pluggedGeyser then Global:save('bSolvedGeyserPuzzle', 1) end
		if self.itemPlugging and self.itemPlugging ~= '' and Global:load('bSolvedGeyserPuzzle') ~= 1 then 
			self.itemPlugging:beNotPickupable() 
			self.oldItemOnItem = self.itemPlugging.onItem
			self.itemPlugging:setEntityInterestLevel(1)
			SetMaxViewDistance(self.itemPlugging, 1000)
			SetEntityCollideSphere(self.itemPlugging, 50)
			SetPhysicsFlag(self.itemPlugging, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(self.itemPlugging, PHYSICS_NOT_REALLY_COLLIDEE, 0)
			self.itemPlugging.onItem = function(self, itemName, from)
				Global.player:sayLine("/CAJT001RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Man, it\'s wedged into that little geyser!>>
			end
			self.itemPlugging.onNewMoveMelee = function(self)
				Global.player:sayLine("/CAJT002RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<Nope. Still won\'t budge.>>
			end
			self.itemPlugging.onPsiBlast = self.itemPlugging.onNewMoveMelee
			self.itemPlugging.onTKFail = self.itemPlugging.onNewMoveMelee
			self.itemPlugging.onConfusion = self.itemPlugging.onNewMoveMelee
			self.itemPlugging.onFireFail = self.itemPlugging.onNewMoveMelee
			self.itemPlugging.onPowerFailed = self.itemPlugging.onNewMoveMelee
			-- temp position hack; move in maya
			self.itemPlugging:setPosition(self.itemPlugging:getPosInFrontOf(0, 70))
		else
			self.idleEmitter:run(self)
		end
	end

	function Ob:stateSpew()
		if self.bPlugged == 1 then
		else
			if self.bShieldInside == 1 and Global:load('bSolvedGeyserPuzzle') ~= 1 then
				self.blockedByShieldEmitter:run()
				self:solvePuzzle()
			else
				if self.bShieldInside == 1 then
					self.blockedByShieldEmitter:run(self)
				else
					self.plumeEmitter:run(self)
				end
			end
		end
		self:setState(nil)
	end



	function Ob:solvePuzzle()
		Global:save('bSolvedGeyserPuzzle', 1)
		if self.bPlugged == 1 then
			if self.itemPlugging then
				--edit for Rando 
				self.itemPlugging:bePickupable()
				--[[self.itemPlugging.onAnimCompleted = function(self, data, from)
					self:bePickupable()
				end]]
				PlaySound(nil, self.completionSound)
				--edit remove
				--LoadAnim(self.itemPlugging, 'Anims/CA_OldSkull/OldSkull_geyser.jan', 0, 0)
				self.itemPlugging.onItem = self.oldItemOnItem
			end
			self.pluggedEmitter:stop()
			self.idleEmitter:run(self)
			self.breakFreeEmitter:run(self)
			self:makeInvisible(1)
			self.bPlugged = 0
		else
			local blockedGeyser = FindScriptObject(Global.notSaved.pluggedGeyser)
			if blockedGeyser then
				blockedGeyser:solvePuzzle()
			end
		end
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if from and from.Type == 'PsiShield' then
			self.bShieldInside = 1
			if self.state_name or self.plumeEmitter.bDone ~= 1 then
				self.plumeEmitter:stop()
				self.blockedByShieldEmitter:run(self)
				if Global:load('bSolvedGeyserPuzzle') ~= 1 and self.bPlugged ~= 1 then
					self:solvePuzzle()
				end
			end
		end
	end
	
	function Ob:onExitedTriggerVolume(data, from)
		if from and from.Type == 'PsiShield' then
			self.bShieldInside = 0
		end
	end

	function Ob:onTimer(id)
		if id == self.TIMER_SPEW then
			self:setState('Spew')
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
		if (self.idleEmitter) then
			SetEntityFlag(self.idleEmitter, ENTITY_NOSIMULATE, bCull)
		end
		if (self.plumeEmitter) then
			SetEntityFlag(self.plumeEmitter, ENTITY_NOSIMULATE, bCull)
		end
		if (self.pluggedEmitter) then
			SetEntityFlag(self.pluggedEmitter, ENTITY_NOSIMULATE, bCull)
		end
		if (self.blockedByShieldEmitter) then
			SetEntityFlag(self.blockedByShieldEmitter, ENTITY_NOSIMULATE, bCull)
		end
    end
    
	return Ob
end

