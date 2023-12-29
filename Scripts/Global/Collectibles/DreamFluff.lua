
function DreamFluff(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.ShopItem')

		Ob.displayName = "/GLZB013TO/"--DIALOG=<<Dream Fluff>>
		Ob.sItemExplanation = "/GLZB057TO/" --DIALOG=<<Replenishes MENTAL HEALTH.>>
		Ob.pickupSpriteName = 'DreamFluff'

		--Ob.HeldPosX = 2.3 -- Editable
		--Ob.HeldPosY = 65.3 -- Editable
		--Ob.HeldPosZ = 42.6 -- Editable
		
		Ob.bPolite = 0

		Ob.AMOUNT_HEALTH = 30
		Ob.initialState = nil
		Ob.iPrice = 100 -- Editable
		Ob.inventoryScale = 1
		Ob.heldScale = .3
		Ob.bInventoryStack = 1
		Ob.level = 'all'
		Ob.bUseOnly = 1
		Ob.tShopCamInfo = {
			x = 6336,
			y = 167,
			z = -6371,
			rx = 0, 
			ry = -165,
			rz = 0,
		}
		Ob.iNumDartCanCarry = 3
		
		Ob.dependencies = {
			meshes = {
				'Characters/CharacterProps/DreamFluff.plb',
			},
			scripts = {
				'Global.Effects.DreamFluffFX',
			},
			animations = {
				'Anims/Dreamfluff/open.jan',
				'Anims/Dreamfluff/closed.jan',
			},
		}
	end

	function Ob:onSpawn()
		self.iNumStock = -1
		%Ob.Parent.onSpawn(self)
		local num = Global:loadGlobal('DreamFluffsInInv')
		num = num or 0		
		self.iPrice = 50
	end

	function Ob:onBeginLevel()
		self.sItemDescription = "/GLZB013TO/"--DIALOG=<<Dream Fluff>>
		Global.levelScript:getPool('Global.Effects.DreamFluffFX'):setLowerLimit(1)
		self.meshName = 'Characters/CharacterProps/DreamFluff.plb'
		%Ob.Parent.onBeginLevel(self)
		self:setScale(0.5, 0.5, 0.5)
		SetEntityCollideSphere(self, 50, 0, 0, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		self.rUseSoundHandle = LoadSound('DreamFluff')
		
		self.fxPool = Global.levelScript:getPool('Global.Effects.DreamFluffFX')
		self.fxPool:setLowerLimit(1)
	end
	
	function Ob:onPlayFX()
		-- don't play fx or do anything if the player is dead
		if (Global.player.bDartIsDying ~= 1) then
			local fx = self.fxPool:get()
			fx:attach(Global.player)
			fx:runThenPool()
			-- don't fill up health if we're using it politely
			-- polite usage IMMEDIATELY fills up raz's health to avoid weird cases
			if (self.bPolite ~= 1) then
				Global.player:adjustHealth(Global.player.stats.maxHealth)
				-- make the player vulnerable again
				Global.player.block = 0
			end
		end
	end


	function Ob:beginStateUse()
		self.bPolite = 0
		-- make the player invulnerable during this sequence so that he doesn't get a cheap shot
		Global.player.block = 1		
	end

	function Ob:stateUse()
		UnLoadPriorityAnim(Global.player, 1, 0)
		Global.player:playAnimOnPlayer('OpenDreamFluff.jan')
		self:loadAnim('Anims/Dreamfluff/open.jan')
		
		-- specifically wait until we come back from the inventory
		Yield()
		Global.player:doNothing()
		
		local result = GetAnimCompletion(self)
		while result and (result < 0.5) do 
			Yield()
			result = GetAnimCompletion(self)
		end
		SetEntityAlpha(self, 0, 0.5);
		while result and (result < 1) do 
			Yield()
			result = GetAnimCompletion(self)
		end
		
		Global.player:loadAnim('Anims/DartNew/standstill.jan', .2, 1)
		Global.player:setNewAction('Stand')
		self:loadAnim('Anims/Dreamfluff/closed.jan')
		
		-- make the player vulnerable again
		Global.player.block = 0
		
		local num = Global:loadGlobal('DreamFluffsInInv')
		if num then
			num = num - 1
			Global:saveGlobal('DreamFluffsInInv', num)
		end
		
		self:killSelf()
	end
	
	function Ob:endStateUse()
		-- make the player vulnerable again
		Global.player.block = 0
	end

	function Ob:beginStateUsePolitely()
		-- fill up the player's health IMMEDIATELY so we can avoid strange things happening during the fluff's anim
		self.bPolite = 1
		Global.player:adjustHealth(Global.player.stats.maxHealth)	
		--edit to extinguish player, avoid wasting fluffs
		Global.player:extinguish()	
		
		local num = Global:loadGlobal('DreamFluffsInInv')
		if num then
			num = num - 1
			Global:saveGlobal('DreamFluffsInInv', num)
		end
		SetEntityDomain(self, 'Level')
		SetEntityFlag(self, ENTITY_NOSIMULATE, 0)
		SetSimulationCullDistance(self, 0)
		self:makeVisible()
		AttachEntityToEntity(self, Global.player)
		self:setScale(2)
		self:setPosition(0, 220, 0)
		self:setOrientation(0, 180, 0)
	end

	function Ob:stateUsePolitely()
		self:playSound(self.rUseSoundHandle, 0, 0, 1)
		local bShowAlways = 1
		self.text = DisplayText("/GLZD580TO/", 100, 160, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, bShowAlways)
		self:loadAnim('Anims/Dreamfluff/open.jan')
		
		local result = GetAnimCompletion(self)
		while result and (result < 0.5) do 
			Yield()
			result = GetAnimCompletion(self)
		end
		SetEntityAlpha(self, 0, 0.5);
		while result and (result < 1) do 
			Yield()
			result = GetAnimCompletion(self)
		end
		
		
		self:loadAnim('Anims/Dreamfluff/closed.jan')
		RemoveText(self.text)
		self:setState(nil)
	end

	function Ob:endStateUsePolitely()
		DetachEntityFromParent(self)
		RemoveText(self.text)
		self.text = nil
		self:killSelf()
	end

	function Ob:addToInventory()
		%Ob.Parent.addToInventory(self)
	end

	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		if (self.bReincarnated ~= 1) then
			if (Global:loadGlobal('DreamFluffCollected') ~= 1) then
				Global:saveGlobal('DreamFluffCollected', 1)
				Global.levelScript:addTutorialBox("/GLZB064TO/", 'Textures/Collectibles/dreamfluff.dds', 0)
			end
			local num = Global:loadGlobal('DreamFluffsInInv') or 0
			num = num + 1
			Global:saveGlobal('DreamFluffsInInv', num)
		end
	end

	function Ob:onActivateFromInventory(data, from)
		if Global.player.stats.psiHealth == Global.player.stats.maxHealth then
			Global.player:onPowerFailed()
		else	
			self:playSound(self.rUseSoundHandle, 0, 0, 1)
			self:setState('Use')
		end
	end

	function Ob:onSelected()
		self:onActivateFromInventory()
	end
	
	return Ob
end
