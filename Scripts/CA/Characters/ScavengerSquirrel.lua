--
--  ScavengerSquirrel.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--
--  Mayor McCheese

function ScavengerSquirrel(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.acorn = nil 
		Ob.meshName = 'Characters/Squirrel.plb'
		Ob.animsDir = 'Squirrel'
		Ob.animsTable = {
					idle = 		{fileName = 'Squirrel_AdmireAcorn', loop = 1, blendTime = 0},
					flee = 	{fileName = 'Squirrel_GrabAcorn', loop = 0, blendTime = 0},
					emerge = 	{fileName = 'Squirrel_EmergeWAcorn', loop = 0, blendTime = 0},
				    }
		Ob.firestartResistance = 1
		Ob.Telekinesis = kTKBEHAVIOR_STANDARD
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_VillageIdiot.tga'
		Ob.acornIdle = 'Anims/Squirrel/Acorn_AdmireAcorn.jan'
		Ob.acornFlee = 'Anims/Squirrel/Acorn_GrabAcorn.jan'
		Ob.acornEmerge = 'Anims/Squirrel/Acorn_EmergWAcorn.jan'
		Ob.height = 20
		Ob.TIMER_EMERGE = '5001'
		Ob.noAcorn = 0
	end
	
	function Ob:onBeginLevel()
		self.acorn = FindScriptObject(self.acorn)
		if self.acorn == nil then 
			-- didnt find the acorn, kill de squirrel
			self:killSelf() 
			self.noAcorn = 1
			return
		elseif Global.player.stats.scavengerHuntItems ~= nil and Global.player.stats.scavengerHuntItems['ScavGoldenAcorn'] ~= nil then 
			-- didnt find the acorn, kill de squirrel
			self:killSelf() 	
			self.noAcorn = 1
			return
		elseif self.acorn and self.acorn.bCollected == 1 then 
			-- didnt find the acorn, kill de squirrel... third times the charm
			self:killSelf() 	
			self.noAcorn = 1
			return
		end
		%Ob.Parent.onBeginLevel(self)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)			 
	end

	function Ob:onPostBeginLevel()
		--edit to make work with rando
		self.acorn = FindScriptObject(self.acorn)
		
		%Ob.Parent.onPostBeginLevel(self)
		if (self.acorn ~= nil and self.noAcorn ~= 1) then
			self.acorn:setOrientation(0,0,0)
			self:setOrientation(0,0,0)
			self.acorn:beNotPickupable()
			self.acorn.bUseDefaultUncollectedAnim = 0
			self.acorn:bePickupable()
			local me = self
			self.acorn.onTKPickup = function(self)
				%me.onTKPickup(%me)
			end
			local x, y, z = self:getPosition()
			self.sphere = TriggerSphere_New(x, y, z, 800)
			Trigger_RegisterListener(self.sphere, self)
			self:setAnim(self.animsTable.idle)
			self.invisTestThread = SpawnScript('Locator', self.Name..'InvisTestThread')
			local me = self
			self.invisTestThread.stateCheckInvis = function(self)
				if GetPlayerInvisibility() ~= 1 then
					%me:scare()
				end
			end
			self:setState(nil)
			LoadAnim(self.acorn, self.acornIdle)
		end
	end

	function Ob:onDestroyed(bBecause)
		if %Ob.Parent.onDestroyed then %Ob.Parent.onDestroyed(self, bBecause) end
		if bBecause ~= 1 and self.sphere then 
			Trigger_UnregisterListener(self.sphere, self)
			TriggerSphere_Delete(self.sphere)
		end
	end
	
	function Ob:onEnteredTriggerVolume(data, from)
		if from == Global.player then
			self.bPlayerInside = 1
			self.invisTestThread:setState('CheckInvis')
		end
	end

	function Ob:onExitedTriggerVolume(data, from)
		if from == Global.player then
			self.bPlayerInside = 0
			self.invisTestThread:setState(nil)
			if self.bHidden == 1 then
				self:emerge()
			end
		end
	end

	function Ob:beginStateScare()
		if self.acorn and IsDead(self.acorn) == 1 then self.acorn = nil end
	end

	function Ob:stateScare()
		self.bHidden = 1
		if self.acorn then
			self.acorn:beNotPickupable()
			self.acorn:setOrientation(0,0,0)
			LoadAnim(self.acorn, self.acornFlee , 0, 0)
		end
		self:setOrientation(0,0,0)
		self:playAnimBlocking(self.animsTable.flee)
		self:setState(nil)
	end

	function Ob:endStateScare()
		self:hide()
		if self.acorn and self.acorn.bInInventory ~= 1 then 
			self.acorn:hide() 
		end
	end

	function Ob:scare()
		if self.bHidden == 1 then return end
		self:setState('Scare')
	end

	function Ob:emerge()
		if self.bHidden ~= 1 then return end
		if self.acorn and IsDead(self.acorn) == 1 then self.acorn = nil end
		if not self.acorn or self.acorn.bInInventory == 1 then return end
		self:setState('Emerge')
	end

	function Ob:beginStateEmerge()
		self.bHidden = 0
		self:show()
		if self.acorn and IsDead(self.acorn) == 1 then self.acorn = nil end
		if self.acorn then
			self.acorn:show()
			SetEntityAlpha(self.acorn, 1, .2)
			LoadAnim(self.acorn, self.acornEmerge , 0, 0)
		end
	end

	function Ob:stateEmerge()
		self:playAnimBlocking(self.animsTable.emerge)
		self:setAnim(self.animsTable.idle)
		if self.acorn then
			LoadAnim(self.acorn, self.acornIdle)
			self.acorn:bePickupable()
		end
		self:setState(nil)
	end
	
	function Ob:onTKPickup()
		self:scare()
		InterruptPowers()
		self:createTimer(5000, self.TIMER_EMERGE)
	end
	
	function Ob:onFireStart()
		self:scare()
		InterruptPowers()
	end

	function Ob:onPsiBlast()
		self:scare()
	end

	function Ob:onConfusion()
		%Ob.Parent.onConfusion(self)
		self:scare()
	end

	function Ob:onFireBurn()
	end

	function Ob:onFireAbort()
	end
	
	function Ob:onFireEnd()
	end

	function Ob:onTimer(id)
		if id == self.TIMER_EMERGE then
			if self.bPlayerInside ~= 1 then
				self:killTimer(id)
				self:emerge()
			end
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	return Ob
end

