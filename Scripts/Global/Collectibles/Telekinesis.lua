function Telekinesis(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.power = 'Telekinesis' -- Editable
		--edit for Telekinesis texture, using Clairvoyance Mesh as base
		Ob.meshName = 'GlobalModels/GO_GlobalObjects/meritbadges/clairvoyance.plb'
		
		--edit Extra Visibility, helps in night levels
		Ob.interestFXName = 'Global.Effects.SupremeInterestFX'

		Ob.dependencies = {
			textures = {
				'Textures/icons/PsiPowers/Telekinesis.dds' --Since we load replace the texture after-the-fact, we tell the game we depend on it so it gets preloaded
			}
		}
	end	
	
	function Ob:onBeginLevel()
		--edit to make mesh match Clairvoyance, moved to Ob.meshname
	
		--self.meshName = 'GlobalModels/GO_GlobalObjects/meritbadges/'..strlower(self.power)..'.plb'
		
		--edit
		if Global.player.stats.RandoTelekinesis[self.Name] == 'collected' then
			self:killSelf()
		end

		self.pickupSpritePath = 'Textures/icons/PsiPowers/'..self.power..'.tga'
		
		if self.power == 'Clairvoyance' then
			self.displayName = "/GLZD259TO/" --DIALOG=<<Clairvoyance>>
		elseif self.power == 'Telekinesis' then
			self.displayName = "/GLZD255TO/" --DIALOG=<<Telekinesis>>
		elseif self.power == 'Firestarting' or self.power == 'Pyrokinesis' then
			self.displayName = "/GLZD256TO/" --DIALOG=<<Pyrokinesis>>
		elseif self.power == 'Shield' then
			self.displayName = "/GLZD257TO/" --DIALOG=<<Shield>>
		elseif self.power == 'Confusion' then
			self.displayName = "/GLZD262TO/" --DIALOG=<<Confusion>>
		elseif self.power == 'Invisibility' then
			self.displayName = "/GLZD258TO/" --DIALOG=<<Invisibility>>
		elseif self.power == 'Levitation' then
			self.displayName = "/GLZD260TO/" --DIALOG=<<Levitation>>
		elseif self.power == 'Marksmanship' then
			self.displayName = "/GLZD261TO/" --DIALOG=<<Marksmanship>>
		end
        
		%Ob.Parent.onBeginLevel(self)
		--edit, swapping texture to match power_LIT
		SetBaseTexture(self,'Textures/icons/PsiPowers/Telekinesis_LIT.dds')

		--edit removing PsiPowerFX for Visibility
		--self.effect = SpawnScript('Global.Effects.PsiPowerUpFX')
		--self.effect:run(self)

		--edit to fix scale and orientation
		self:setScale(30)
		self.mover:setOrientation(ApplyOrientation(0, 0, 0, self.mover:getOrientation()))
		self:setState(nil)
	end

	function Ob:onPostBeginLevel()
		--edit remove
		--[[if Global:loadGlobal('bGot'..self.power) == 1 then
			self:killSelf()
			return
		end]]
		%Ob.Parent.onPostBeginLevel(self)
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

	function Ob:beginStatePickup()
		self:beNotPickupable()
	end

	function Ob:statePickup()
		Global.player:replaceSelectedItemInPsack()
		Global.player.invDisplayer:invItemAdded(self,0,0,nil,1)
		
		--edit, effect removed for Visibility
		--self.effect:stop()

		self:makeInvisible(1)
		self:sleep(.5)
		--edit removed cutscene
		--self:playVideo('cutScenes/prerendered/'..strlower(self.power)..'meritbadge.xmv')
		
		if self:getConstant() == kPOWER_CLAIRVOYANCE then
			Yield()
			Global.levelScript:addTutorialBox("/GLZF028TO/")
		end

		--edit, effect removed for Visibility
		--self.effect:killSelf()
		--self.effect = nil

		--edit to create Progressive Powerups
		if self.power == 'Telekinesis' then
			if (Global:loadGlobal('bGot'..self.power, 1) ~= 1) then
				Global:saveGlobal('bGot'..self.power, 1)
			elseif (Global:loadGlobal('bTelekinesisUp') ~= 1) then
				Global:saveGlobal('bTelekinesisUp', 1)
			end
		end
		--edit removed for progressive powerup, handled in RankPowerManager.lua
		--Global:saveGlobal('bGot'..self.power, 1)

		EnablePower(self:getConstant())

		-- Show any max ammo ups in the level, if they exist.
		if self.power == 'Confusion' then
			local showFunc = function(ent) ent:show() end
			foreach_entity_ofexacttype('global.collectibles.MaxConfusionUp', showFunc)
		end

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoTelekinesis', self.Name, 1)
		
		-- I believe these are the only two powers in the game acquired this way, if others
		-- are for some reason, god save us all.
        --edit Removes auto customize for these powers
		--[[
        if (self:getConstant() == kPOWER_CLAIRVOYANCE) then
			MapPowerToButton(kPOWER_CLAIRVOYANCE,kQUICKPICK_BLACK)		
		elseif (self:getConstant() == kPOWER_CONFUSION) then
			MapPowerToButton(kPOWER_CONFUSION,kQUICKPICK_BLACK)		
		end]]

		if (self.power == 'Clairvoyance') then
			Global.goalManager:activate('TryClair')
		end

		self:killSelf()
	end

	function Ob:getConstant()
		local constant
		if self.power == 'Clairvoyance' then
			constant = kPOWER_CLAIRVOYANCE
		elseif self.power == 'Telekinesis' then
			constant = kPOWER_TELEKINESIS
		elseif self.power == 'Firestarting' then
			constant = kPOWER_FIRESTARTING
		elseif self.power == 'Shield' then
			constant = kPOWER_SHIELD
		elseif self.power == 'Confusion' then
			constant = kPOWER_CONFUSION
		elseif self.power == 'Invisibility' then
			constant = kPOWER_INVISIBILITY
		end
		return constant
	end

	function Ob:onDestroyed(bBecause)
		%Ob.Parent.onDestroyed(self, bBecause)
		if self.effect and bBecause ~= 1 then
			self.effect:killSelf()
			self.effect = nil
		end
	end

	function Ob:onItem(itemName, from)
		self:setState('Pickup')
	end
	
	return Ob
end
