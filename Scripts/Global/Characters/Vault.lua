--      Vault
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--

function Vault(Ob)
	if (not Ob) then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/Vault.plb'
		Ob.headOffsetY = 60
		Ob.TK_YOffset = 140
		-- ****** Reels are located in Global.Collectibles.ScrapbookHandler
        Ob.reelName = ''	-- Editable
		Ob.reelSleeveTitle = 'Must_be_8_leters_or_Less'	-- Editable
		Ob.animsDir = 'Vaults'
		Ob.animsTable = {   Close = {fileName = 'CloseMouth', preload = 1, loop = 0},
			Open = {fileName = 'OpenMouth', preload = 1, loop = 0},
			Recover = {fileName = 'Recover', preload = 1, loop = 0, blendTime = 0.2},
			Run = {fileName = 'Run', preload = 1, blendTime = 0.2, loop = 1},
			Walk = {fileName = 'Walk', preload = 1, blendTime = 0.2, loop = 1},
			TakeDamage = {fileName = 'TakeDamage', preload = 1, loop = 0, blendTime = 0.2},
			Idle = {fileName = 'Idle', preload = 1, loop = 1, blendTime = 0.2},
			Hop = {fileName = 'Hop', preload = 1, loop = 0, blendTime = 0.2},
			-- 	TurnLeft = {fileName = 'Hop', preload = 1, loop = 0, blendTime = 0.2, degrees = -90, durationInFrames = 10},
			--	TurnRight = {fileName = 'Hop', preload = 1, loop = 0, blendTime = 0.2, degrees = 90, durationInFrames = 10},
			--	Turn180 =  {fileName = 'Turn_180', loop = 0, preload = 1, blendTime = 0.2, durationInFrames = 19, degrees = 180},
			Opened = {fileName = 'OpenMouthPose', preload = 1, loop = 0},
			confused = {fileName = 'Confused', preload = 1, loop = 1, blendTime = 0},
			TKed = {fileName = 'TK', preload = 1, loop = 1,blendTime = 0},
			IdleNoLoop = {fileName = 'Idle', preload = 1, loop = 0 },
		}
                        
		Ob.idleAction = 'Idle'
		Ob.walkAction = 'Walk'
		
        Ob.Dying = 0					--Is Vault currently dying?
		Ob.TIMER_HOP = '6001'
		Ob.HOP_TIME_MIN = 1000
		Ob.HOP_TIME_MAX = 3000
		
		Ob.vaultOpenSound = 'VaultOpening'
		Ob.runSound = 'VaultFS'
		
		Ob.bDetailCull = 0 -- Editable
		
		-- Flee data
		--edit to make smaller
		Ob.triggerRadius = 450			--Start fleeing at this point
		Ob.safeRetreatDist = 470        --Stop fleeing

		Ob.ts_flee = nil	-- reference to trigger sphere telling us to flee from player
		Ob.lookAheadDist = 1000
		Ob.fleeHeight = 18
		Ob.height = 150
        Ob.rotationSpeed = 200
		
		Ob.tNameToTitleMap = {
			BVRBVault1 = "/GLZH007TO/",--DIALOG=<<Edgar\'s Lament>>
			BVRBVault2 = "/GLZH008TO/",--DIALOG=<<Edgar\'s Love>>
			SACUVault1 = "/GLZH005TO/",--DIALOG=<<Sasha\'s First Loss>>
			SACUVault2 = "/GLZH006TO/",--DIALOG=<<Sasha\'s Second Sight>>
			NIMPVault1 = "/GLZH015TO/",--DIALOG=<<Razputin\'s Getaway>>
			NIMPVault2 = "/GLZH016TO/",--DIALOG=<<The World Shall Taste my Eggs!>>
			BBVault1 = "/GLZH001TO/",--DIALOG=<<Oleander\'s Pride>>
			BBVault2 = "/GLZH002TO/",--DIALOG=<<Oleander\'s Shame>>
			MIVault1 = "/GLZH003TO/",--DIALOG=<<Milla\'s Adventures!>>
			MIVault2 = "/GLZH004TO/",--DIALOG=<<Milla\'s Children>>
			LOMAVault1 = "/GLZH013TO/",--DIALOG=<<Lungfish and Loboto>>
			LOMAVault2 = "/GLZH014TO/",--DIALOG=<<Lungfishopolis Under Siege!>>
			MMVault1 = "/GLZH009TO/",--DIALOG=<<Boyd: Fired Again!>>
			MMVault2 = "/GLZH010TO/",--DIALOG=<<Boyd: Hired Again!>>
			THVault1 = "/GLZH011TO/",--DIALOG=<<Gloria\'s Cruel Training>>
			THVault2 = "/GLZH012TO/",--DIALOG=<<Gloria\'s Fallen Star>>
			WWVault1 = "/GLZH000TO/",
			WWVault2 = "/GLZH017TO/",--DIALOG=<<Fred vs. Napoleon>>
			MCVault1 = "/GLZH018TO/",--DIALOG=<<The Butcher>>
		}
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Dogcatcher.dds'
		Ob.dependencies = {
			textures = {
				'Textures/Objects/vault_reel_front.tga',
			},
		}
	end

	function Ob:onSpawn()
        -- set misc entity properties
		self.proximityLine = "/GLZF000TO/"--DIALOG=<<Punch vault to open.>>
		self.saveVariable = 'bVault'..self.reelName
		%Ob.Parent.onSpawn(self)
	end
        
    
--  I N I T   F U N C T I O N S   A N D   S T A T E S  ********************************************
	function Ob:onBeginLevel()
		self.tPsiReactTable = {
            TKPickup = {
				preCallback = self.preTKGrabCallback,
				animToPlay = 'TKed',
				loop = 1,
			},
			TKRelease = {
				animToPlay = 'IdleNoLoop',
				preCallback = self.preTKReleaseCallback,
			},
			Confusion = {
				preCallback = self.preConfusionCallback,
				animToPlay = 'confused',
				loop = 1,
			},
			ConfusionDone = {
				animToPlay = 'IdleNoLoop',
				preCallback = self.preConfusionDoneCallback,
			},
		}
		Global.levelScript.numVaultsInLevel = Global.levelScript.numVaultsInLevel + 1

		--edit
		if Global.player.stats.CollectedVault[self.Name] == 'collected' then
			self:killSelf()
		end

		--edit Removed
		--[[
		if (Global:loadGlobal(self.saveVariable) == 1) then
			self:killSelf()	-- true if we were already collected
			return
		else
	  		%Ob.Parent.onBeginLevel(self) -- parent takes care of our collision
		end]]
		%Ob.Parent.onBeginLevel(self) -- parent takes care of our collision

		
		SetPhysicsFlag(self, PHYSICS_NAVIGATION, 1)

		-- Setting the nav group explicitly will cause the physics system to
		-- constrain the entity to the appropriate nav polys
		SetNavGroup(self, 0)

		-- load sounds
		self.vaultOpenSound = self:loadSound(self.vaultOpenSound)
		self.runSound = self:loadSound(self.runSound)
        
		-- spawn and init the reel
--		self.reel = SpawnScript('Prop',self.Name .. 'Reel','',1)
--		self.reel:loadMesh('GlobalModels/Objects/HeldObjects/BV_Vault_reel.plb')
--		self.reel:setScale(1.5,1.5,1.5)
--		SetEntityVisible(self.reel,0)
--		AttachEntityToEntityBone(self.reel,self,'toungeJC_1')
--		self.reel:setOrientation(40,0,0)
--		self.reel:setPosition(0,0,17)
        
		self.ts_flee = TriggerSphere_New(0,0,0, self.triggerRadius, self)
		Trigger_RegisterListener(self.ts_flee, self)
			
		-- melee sound
		self.rMeleeImpactSound = self:loadSound('raz_melee_hit')
		self.homex, self.homey, self.homez = self:getPosition()
        self.lastx, self.lasty, self.lastz = self:getPosition()

		--edit reduced from 2.8 to 2.6
		self:setScale(2.6,2.6,2.6)      --Embiggen the vault because otherwise it's half submerged in paint
		SetMeshIsBackwards(self, 1)
		
		-- make the vaults teeny in LOMA
		if (GetCurrentLevelName() == 'LOMA') then
			self:setScale(0.5)
			SetEntityCollideCylinder(self, 20, 130)
			MakeSharedTableWritable(self.animsTable)
			self.animsTable.Walk.speed = 2.0
		else
			SetEntityCollideSphere(self, 120, 0, 80, 30)  -- set collide sphere ourself so its more accurate
		end
        
		self:setAnim(self.animsTable.Idle)
		
		-- crumbs for debug purpose only
		--self.crumb = SpawnScript('Debug.Breadcrumb')
		--self.crumb:setState('Off')

		SetPushParams(self, Global.PUSH_HARDEST, 200)

		-- set the reel title name based on the reel name
		if (self.reelName) then
			self.reelSleeveTitle = self.tNameToTitleMap[self.reelName]
		end
		
		SetSimulationCullDistance(self, 3000)
		self:setState('Hop')
	end
	
-- ***************************************************************************************
	function Ob:stateHop()
        self:playAnimBlocking(self.animsTable.Recover)
		self:setAnim(self.animsTable.Idle)
		self:createTimer(RandInt(self.HOP_TIME_MIN, self.HOP_TIME_MAX), self.TIMER_HOP)
		self:setState(nil)
	end	

-- ***************************************************************************************
    
	--Got Melee'd.  Vault must die. 
	function Ob:stateDie()
		--edit sendMessage to Dart
        self:sendMessage(Global.player, 'CollectedVault', self.Name, 1)

		Global.cutsceneScript.vault = self
		Global.cutsceneScript:runCutscene('VaultCollection',1,0,0)
		
		self:setState(nil)
		
        
	
															
								
-- all this moved into global cutscene script
--[[		
		self.Dying = 1
		self:killAllTimers()
		self.proximityLine = nil
		Global.player:myProximityHintChanged(self)
		-- impact sound
		self:playSound(self.rMeleeImpactSound)

		local arrowhead = SpawnScript('Global.Collectibles.MentalArrowhead')
		local x,y,z = Global.player:getPosition()
		local ox,oy,oz = GetEntityOrientationVector(Global.player,0,0.5,1);
		x = x + ox * 150;
		y = y + oy * 150;
		z = z + oz * 150;
		arrowhead:setPosition(x,y,z);
		arrowhead:setOrientation(Global.player:getOrientation())
		
		self:setAnim(self.animsTable.TakeDamage)
		
--		SetEntityVisible(self.reel,1)
		self:playSound(self.vaultOpenSound)
		self:playAnimBlocking(self.animsTable.Open)
	
		self:sleep(.2)
		Global:saveGlobal(self.saveVariable, 1)
		self:sendMessage(Global.player, 'Vault', self.reelName)
		Global.scrapbookHandler:onScrapbookActivate(self.reelName,nil,self.reelSleeveTitle)
		JournalAddScrapbookItem(self.reelName,self.reelSleeveTitle)
        
		SetEntityAlpha(self, 0, 0.5) 
--		SetEntityAlpha(self.reel, 0, 0.5) 
		self:sleep(.2)
		
		if (Global:loadGlobal('SeenVaultTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenVaultTutorialPopup', 1)
			Global.levelScript:addTutorialBox("/GLZG035TO/", 'Textures/Objects/vault_reel_front.tga')--DIALOG=<<To view this MEMORY again, check out the MEMORIES page in your JOURNAL. /Journal/>>
		end
		
--		self.reel:killSelf()
		self:killSelf()
		self:setState(nil)
]]--
	end

-- ***************************************************************************************    

	function Ob:beginStateFlee()
		self:killAllTimers()
		self:setAnim(self.animsTable.Recover)
	end

	-- Yeah, yeah, should be a special subclass just for tutorial vaults.
	function Ob:stateTutorial()
		Global.cutsceneScript:runCutscene('VaultTutorial', 1)
		self:setState('Flee')
	end
	
	function Ob:stateFlee()
		self:playAnimBlocking(self.animsTable.Recover)
		local flee = 1
		local fleeDist = 400
		if (GetCurrentLevelName() == 'LOMA') then
			fleeDist = 100
		end
		self:enterStatePathWalkTo(self.fleeCallback, Global.player, nil, nil, nil, nil, nil, flee, fleeDist)
--		local fx,fy,fz = self:findFleeLocation()
--		if fy then	-- true if we have a location
--			--self.crumb:AddCrumbPos(fx, fy, fz, 25)	-- only if needed when debugging
--			self:pathWalkTo(self.fleeCallback, fx, fy, fz)
--			if self.bPlayerInTV ~= 1 then	-- check to see if we should continue to run
--				self:setState('Hop')
--			end
--		else
--			self:setAnim(self.animsTable.Idle)
--        end
	end
	
	function Ob:fleeCallback(arg)
		local dist = GetPlayerDist(self)
		if (dist > self.safeRetreatDist) then
			self:setState('Hop')
		end
	end
	
--	function Ob:fleeCallback()
--		if self.Dying == 1 then
--			return 1
--		else
--			return 0
--		end
--	end

-- ***************************************************************************************    	
--	function Ob:findFleeLocation()
--		-- get point at correct height up from our start pos
--		local ux, uy, uz = GetEntityUp(self)
--		local x,y,z = self:getPosition()
--		x,y,z = x+ux*self.fleeHeight, y+uy*self.fleeHeight, z+uz*self.fleeHeight
--		local vx,vy,vz = Global.player:vectorTo(self)	-- get vector from player to vault
--		
--		
--		-- look for a valid location to run to based off this vector
--		local tx,ty,tz = x+vx*self.lookAheadDist,y+vy*self.lookAheadDist,z+vz*self.lookAheadDist
--        local angle = 20
--		if IsPositionOnPath( tx,ty,tz ) == 1 then
--			return tx, ty, tz
--		else
--			local cx, cy, cz = vx,vy,vz -- MAKE A COPY
--			while IsPositionOnPath( tx,ty,tz ) ~= 1 and angle <= 180 do
--				cx,cy,cz = RotateVector(0,angle,0,vx,vy,vz)
--				tx,ty,tz = x+cx*self.lookAheadDist,y+cy*self.lookAheadDist,z+cz*self.lookAheadDist
--				if IsPositionOnPath(tx, ty, tz) == 1 then
--					return tx, ty, tz
--				else
--					cx,cy,cz = RotateVector(0, -1 * angle,0,vx,vy,vz)
--					tx,ty,tz = x+cx*self.lookAheadDist,y+cy*self.lookAheadDist,z+cz*self.lookAheadDist
--					if IsPositionOnPath(tx, ty, tz) == 1 then 
--						return tx, ty, tz
--					else
--						angle = angle + 20
--					end
--				end
--			end
--		end
--		return nil
--	end

--*************************************************************************************************
--*****	MESSAGE HANDLERS	***********************************************************************
--*************************************************************************************************
	function Ob:onNewMoveMelee(whichAttack, from, power)
		if (%Ob.Parent.onNewMoveMelee) then		
			%Ob.Parent.onNewMoveMelee(self, whichAttack, from, power)
		end
        if self.Dying == 1 then return end
		if self.bSBConfused == 1 then
			self:onConfusionDone()
		end
		self:killAllTimers()
		self.Dying = 1
		self:setState('Die')
	end
-- ***************************************************************************************    	
	function Ob:preConfusionCallback()
		self:killTimer(self.TIMER_HOP)
		self:setState(nil)
		return 0	-- 0 means play the anim
	end
	
	function Ob:preConfusionDoneCallback()
		--GamePrint('PRE CONFUSION DONE!')
		self:setState('WaitForGround')
		return 0
	end
	
	function Ob:preTKGrabCallback()
		--GamePrint('PRE TK GRAB!')
		self:killTimer(self.TIMER_HOP)
		self:setState(nil)
		return 0	-- 0 means play the anim
	end
	
	function Ob:preTKReleaseCallback()
		--GamePrint('PRE TK RELEASE!')
		self:setState('WaitForGround')
		return 0
	end

	function Ob:stateWaitForGround()
		local bOnGround = GetPhysicsState(self, PHYSICSSTATE_ONGROUND)
		if (bOnGround == 1) then
			if (self.bPlayerInTV == 1) then
				self:setState('Flee')
			else
				self:setState(nil)
			end
		end
	end
	
	function Ob:endStateWaitForGround()
		self:createTimer(RandInt(self.HOP_TIME_MIN, self.HOP_TIME_MAX), self.TIMER_HOP)
	end
	
--*************************************************************************************************
	function Ob:killAllTimers()
		if %Ob.Parent.killAllTimers then
			%Ob.Parent.killAllTimers(self)
		end
		self:killTimer(self.TIMER_HOP)
	end
--*************************************************************************************************	

	function Ob:onTimer(id)
		%Ob.Parent.onTimer(self,id)
		if id == self.TIMER_HOP then
			if (not self.state_name) then
				self:killTimer(id)
				self:setState('Hop')
			end
		end
	end
--*************************************************************************************************
	
	function Ob:onEnteredTriggerVolume(data, from)
		if data == self.ts_flee and from == Global.player and self.Dying ~= 1 then
			self.bPlayerInTV = 1
			if self.bTutorialVault == 1 and Global:load('bVaultTutorialPlayed') ~= 1 then
				self:setState('Tutorial')
			elseif self.bSBConfused ~= 1 then
				self:setState('Flee')
			end
		end
	end

--*************************************************************************************************
	
	function Ob:onExitedTriggerVolume(data, from)
		if data == self.ts_flee and from == Global.player and self.Dying ~= 1 then
			self.bPlayerInTV = 0
		end
	end
	
-- ***************************************************************************************    
	
	function Ob:onNewMoveCollide(nx, from, ny, nz)
		if (%Ob.Parent.onNewMoveCollide) then
			%Ob.Parent.onNewMoveCollide(self, nx, from, ny, nz)
		end
		if from and strfind(strlower(from.Type),'gio') then
			self:sendMessage(from, 'NewMoveMelee')
		end
	end
		
-- ***************************************************************************************    
	function Ob:onPlayRunSound()
		self:playSound(self.runSound, 0, 0)
	end
-- ***************************************************************************************    

	function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
--		if (self.reel) then
--			SetEntityFlag(self.reel, ENTITY_NOSIMULATE, bCull)
--		end
	end
	
	return Ob
end

