function LOMA(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			textures = {
				'Textures/LevelTextures/LO_Lungfishopolis/PlaneCounter.tga',
			},
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmUp_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/BodyParts/PopperEmptyHold_ArmLf.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Grabbed.jan',
				'Anims/DartNew/Hop_water.jan',
				'Anims/DartNew/Melee/lo/Chop1.jan',
				'Anims/DartNew/Melee/lo/Chop2.jan',
				'Anims/DartNew/Melee/lo/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SmellSalts_cancel.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/Throw.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/TK_Mover/Tumble.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_end.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_loop.jan',
				'Anims/DartNew/Melee/lo/PalmBomb_start.jan',
				'Anims/DartNew/lo/DoubleJump.jan',
				'Anims/DartNew/lo/PsiBlast_HeadButt.jan',
				'Anims/DartNew/lo/Shield_start.jan',
				'Anims/DartNew/lo/hop.jan',
				'Anims/DartNew/lo/hop_recovery.jan',
				'Anims/DartNew/lo/landsoft.jan',
				'Anims/DartNew/lo/longjump.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/LO/TightropeRun.jan',
				'anims/DartNew/LO/TightropeWalk.jan',
				'anims/DartNew/LO/run.jan',
				'anims/DartNew/LO/walk.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/MegaIdle2.jan',
				'anims/dartnew/MegaIdle4.jan',
				'anims/dartnew/MegaIdle5.jan',
				'anims/dartnew/megaidle.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			}
		}
		
		Ob.rPlayerTrigSphere = nil
		Ob.CoachAwake = 0
		Ob.theme = 'Lungfishopolis'
		Ob.coachTheme = 'UltramanBattle'
		Ob.rPlanePatrolSplineHandles = {}
		Ob.TIMER_TEST_POPULATION = '7001'
		Ob.INITIAL_CITIZEN_POPULATION = 6
		Ob.DESIRED_CITIZEN_POPULATION = 16
		Ob.MIN_CITIZEN_DISTANCE = 1000
		Ob.CITIZEN_SPAWN_RADIUS = 1200
		Ob.iAirbaseEnemyCount = 0
		Ob.bClearedAirbase = 0
		Ob.tEnemies = {}
		Ob.iHostileCounterHandle = -1
		Ob.bProcessFootfalls = 1		
		Ob.bUseLOAnims = 1		
		Ob.landDecalTexture = nil
	end

	function Ob:onSpawn()
		self.enemyTable = {}	-- list of all enemies in the level that register with us indexed by ID
		self.groupTable = {}	-- list of num dead per group in enemyTable, and list of which groups have been launched
		self.deathSpawners = {}	-- table where deathSpawner[DEAD] = GROUP where GROUP = group to start when group DEAD dies.
		self.tvSpawners = {}	-- table where tvSpawners[STRING] = GROUP where GROUP = group to start when player enters the 
		self.tvDeploy = {}		-- table where tvDeploy[STRING] = GROUP where GROUP = group to deploy when player enters the 
		self.startQueue = {}	-- table used to queue up groups that need to be started
								-- trigger volume named STRING
		-- ENEMY SPAWNING CODE DONT DELETE
		self.enemyPoolTable = {	
			tank = {num = 3, scriptName = 'LO.Characters.Tank', editvars = nil, pool = nil},
			etruck = {num = 2, scriptName = 'LO.Characters.ElectroTruck', editvars = nil, pool = nil},
			ship = {num = 2, scriptName = 'LO.Characters.GunShip', editvars = nil, pool = nil},
			homingtank = {num = 3, scriptName = 'LO.Characters.HomingTank', editvars = nil, pool = nil},
		}
		
		-- END ENEMY SPAWNING CODE
		%Ob.Parent.onSpawn(self)

		self.leftFootDecal = LoadTexture('Textures/LevelTextures/LO_Lungfishopolis/LO_footprint_left.tga')
		self.rightFootDecal = LoadTexture('Textures/LevelTextures/LO_Lungfishopolis/LO_footprint_right.tga')
	end
	
	function Ob:onPreBeginLevel()
		self.rPlayerTrigSphere = AddTriggerSphere(0,0,0, 1500 ,Global.player)

		self.planeCount = 0

		self.defaultPlaneStartPoint = SpawnScript('Locator')
		self.defaultPlaneStartPoint:setPosition(23523,5109,-9353)
		Global.notSaved.planeGroupCounter = {}
		local blimpInstructionZealot = SpawnScript('LO.Characters.Zealot', 'BPIZealot')
		blimpInstructionZealot:setPosition(7491.19, 160.219, -3821.16)
		blimpInstructionZealot:setOrientation(0, -74.4574, 0)

		-- Tables of hi-res actors for cutscenes
		self.tCSZealots = {n=0}
		for i = 1, 4 do
			tinsert(self.tCSZealots, SpawnScript('Global.Props.Animator', 'CSZealot'..i, 'self.meshName = \'Characters/LFCMiniZealot.plb\' self.charName = \'LFCZealot\''))
		end
		self.tCSCitizens = {n=0}
		for i = 1, 4 do
			tinsert(self.tCSCitizens, SpawnScript('Global.Props.Animator', 'CSCitizen'..i, 'self.meshName = \'Characters/LFCMiniGeneric.plb\' self.charName = \'LFCZealot\''))
		end
		self:cleanupCSActors()
		
		%Ob.Parent.onPreBeginLevel(self)
	end

	function Ob:onBeginLevel()

		Global.levelScript:getPool('Global.Collectibles.HealthAmmo'):setLowerLimit(8)
		-- ENEMY SPAWNING CODE DONT DELETE
		for k, v in self.enemyPoolTable do
			v.pool = self:getPool(v.scriptName, v.editvars)
			v.pool:setLowerLimit(v.num)		-- this will actually create the enemies
		end
		-- END ENEMY SPAWNING CODE
   

		-- Debug hacks
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('NI')
		%Ob.Parent.onBeginLevel(self)
		Global.player.Razilla = 1
		self.RazillaWalk = LoadSound('LOFootsteps')
		self.RazillaLand = LoadSound('LOJumpLand')
		
		-- Commenting out water curse for now - Erik 6/15/2004
		--local curse = SpawnScript('CA.Props.WaterCurse', 'WaterCurse', '',  1)
		--curse.yToCheck = -50
		--curse.useRespawn = 1
		
		Global.levelScript.camControl:pushAndSetChase(self, 400, 30, 150, 150)

		-- set the tugboats and sinkable
		-- leaving in as reference
--		local plat = FindScriptObject('tugplat')
--		if (plat) then
--			self:sendMessage(plat, 'SetSinkable', '1')
--		end

		self:getPool('LO.Effects.BuildingExplosion'):setLowerLimit(8)
		self:getPool('LO.Effects.SmallBuildingExplosion'):setLowerLimit(8)
		self:getPool('LO.Characters.LO_TankPlaneExplosion'):setLowerLimit(8)
		self:getPool('LO.Effects.MissileImpactFX'):setLowerLimit(8)
		self.citizenPool = self:getPool('LO.Characters.Citizen')
		self.citizenPool:setLowerLimit(20)
		self:createTimer(10000, self.TIMER_TEST_POPULATION)
		local spawner = self:findNearestCitizenSpawner(0)
		if (spawner) then
			self:placeCitizens(spawner, self.INITIAL_CITIZEN_POPULATION)
		end

		-- set up shadow color
        SetShadowColor(0, 0, 0, 0.5)
        
        -- Water settings
        SetReflectionScale(1.75)
		SetFresnelBumpScale(0.05)
		SetReflectionBumpScale(0.3)
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/LO_waterNoise2.tga')
		
		self.river = FindScriptObject('watersurface')
		if (self.river) then
			SetEntityFlag(self.river, kMESH_SORT_END, 1);

			--Enable collision
			SetPhysicsFlag(self.river, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(self.river, PHYSICS_COLLIDER, 0)
			SetEntityCollideGeometry(self.river)

			--Make Raz ignore the collision
			SetCollideLayer(self.river, LAYER_LO_WATER, 1)
			IgnoreCollideLayer(Global.player, LAYER_LO_WATER, 1)

			--These two flags will cause goodies to bounce out of the water
			self.bGoodiesCheckTriggers = 1			
			self.river.bBounceGoodiesToPlayer = 1
		else
			GamePrint('Couldn\'t find \'watersurface\' object')
		end

		--near tunnel
		RegisterTriggerVolume(self, 'tv_nearTunnel')
		
		--near dam
		RegisterTriggerVolume(self, 'tv_nearDam')

		--starts electro truck cutscene
		RegisterTriggerVolume(self, 'tv_electrocutscene')
		--starts tanks for cutscene (and if not in cutscene)
		RegisterTriggerVolume(self, 'tv_tankintroCutscene')
		
		--		RegisterTriggerVolume(self, 'tv_StartBlimp')
		SetSkyBox('Levels/SkyBox/LO_SkyBox2.plb')
		-- goals
		RegisterTriggerVolume(self, 'tv_goalDamTop')

		-- sound for the prison breaking
		local prison = FindScriptObject('prison')
		if prison then
			prison.rSoundHandle = LoadSound('JailOpen')
		end

		-- for the volcano ambience
		self.rVolcanoTSHandle = TriggerSphere_New(17499, 1980, -12845, 1800)
		Trigger_RegisterListener(self.rVolcanoTSHandle, self)

		self.rVolcanoAmbientSound = LoadSound('Volcano')

		--edit moved to onPostBeginLevel()
		-- put all the slow raz stuff in this function found in LevelScript.lua
		--self:startSlowLORaz()
		
		if (Global:loadGlobal('bLOCompleted') == 1) then
			RegisterTriggerVolume(self, 'tv_plane1')
			--edit Remove level load from LOMA to LOCB if LOCompleted to prevent softlocks
			local removeload = fso('Teleporter')
			removeload:killSelf()
		end
		Global.notSaved.assKickedByTanksScore = 0 -- tracking number to decide if we should give a hint on not getting your ass kicked by a tank

		-- ENEMY SPAWNING CODE DONT DELETE
		if (self:isLevelCompleted() == 1) then
			--Start all groups immediately on revisiting.  Sim-culling should save us!
			self:startTriggeredGroups(self.tvSpawners)
		end
		self:startTriggeredGroups(self.tvDeploy) -- Start all deploy-only groups immediately
		-- group 0 is a special case that signifies that group should start when the level loads
		if self.deathSpawners[0] then
			self:startGroup(self.deathSpawners[0])
		end
		-- END ENEMY SPAWNING CODE DONT DELETE
		
		--edit moved to onPostBeginLevel for LO QOL
		--So we can keep raz off the ball
		--Global.player:addSpamListener('ControlHandlerChanged', self)

		--For razilla stomping
		Global.player:addSpamListener('Collide', self) 
		
		--Listen for cutscene messages, so we can kill any enemies Raz is holding
		Global.cutsceneScript:addListener(self)

		--More aggressive detail culling in this level, to help with performance
		SetDetailCullingRange(0.8, 0.7)
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		-- put all the slow raz stuff in this function found in LevelScript.lua
		self:startSlowLORaz()

		--edit only add if fasterLO QOL FALSE
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings == FALSE then
			--So we can keep raz off the ball
			Global.player:addSpamListener('ControlHandlerChanged', self)
		end

		-- hack to remove this while Fred's out
		local etruckcs = FindScriptObject('electrotruckCutscene', 1)
		if etruckcs then
			etruckcs:killSelf()
		end

		if Global:load('bBlimpPilotBreakoutPlayed') == 1 then
			FindScriptObject('blimp'):moveToEnd()
			FindScriptObject('BPIZealot'):makeInvisible()
		end

		-- for the jail sound
		local jail = FindScriptObject('prison')
		if jail then
			jail.rSoundHandle = LoadSound('JailOpen')
		end

		--Make sure our goals are set up
		if (Global.goalManager:isActive('DestroyTower') ~= 1) then
			Global.goalManager:activate('FreeLungfish')
			Global.goalManager:activate('DestroyTower')
		end
		
        self.AmbientSound = LoadSound('LOAmb')
        PlaySound(nil, self.AmbientSound, 1)

		self:setState('IntroCS')
		self:setDomain('waterglobe_', 1)
	end

	function Ob:cleanupCSActors()
		for i = 1, getn(self.tCSZealots) do
			self.tCSZealots[i]:hide()
			self.tCSZealots[i].charName = 'LFCZealot'
		end
		for i = 1, getn(self.tCSZealots) do
			self.tCSCitizens[i]:hide()
			self.tCSCitizens[i].charName = 'LFCZealot'
		end
	end
	
	function Ob:stateIntroCS()
		if (Global:loadGlobal('bLOCompleted') == 1) then
			if (Global:load('bReentryIntroPlayed') ~= 1) then
				local tCS = {sName='ReentryIntro', postCutsceneCallback = self.runRevisitHint, postCutsceneCallbackSelf = self}
				Global.cutsceneScript:runCutsceneWithSettings(tCS)
			end
		elseif Global:load('bPlaneIntroductionPlayed') == 1 and Global:load('bShipsDockedPlayed') ~= 1 then -- exit/enter or save/load special case.
			Global.cutsceneScript:runCutscene('PlaneIntroduction')
		elseif Global:load('bShipsDockedPlayed') == 1 then
			Global.cutsceneScript:runCutscene('ShipsDocked')
		else
			if (Global:load('LOINSeen') ~= 1) then
				self:playVideo('cutScenes/prerendered/loin.xmv')
				Global:save('LOINSeen', 1)
			end
		end
		
		self:setState('StartGroups') --Just in case there are groups to start
	end

	function Ob:footfall(whichFoot, walkType)
		PlaySound(nil,self.RazillaWalk,0,0)
		CameraStartShakeDriven((walkType == 'Run' and 3) or 1.5)
	end

	function Ob:listenerCollide(data, from)
		if (from == Global) and (GetPhysicsState(Global.player, PHYSICSSTATE_ONGROUND) == 1) then
			--No need for relgrav safety in LO
			local _, vy = GetTotalVelocity(Global.player)
			if (vy < -400) then
				self:stomp(vy)
			end
		end
	end

	function Ob:stomp(fallVelocity)
		PlaySound(nil,self.RazillaLand,0,0)
		local shake = ((fallVelocity) and (fallVelocity / -50)) or 8
		CameraStartShakeDriven(shake)

		local cooky = BeginMath()

		local qOri = Quat(GetOrientation(Global.player))
		local vUp = qOri * Vector(0,1,0)
		local vRight = qOri * Vector(-1,0,0)
		local vFwd = qOri * Vector(0,0,1)
		local vPos = Vector(GetAbsPosition(Global.player)) + vUp * 10

		local vOffset = qOri * Vector(-20,0,0)
		local SIZE = 64
		vPos:AddEquals(vOffset)
		AttachDecal(self.rightFootDecal,
					10,							-- lifetime
					vPos.x, vPos.y, vPos.z,		-- pos
					-vUp.x, -vUp.y, -vUp.z,		-- projection dir
					SIZE,SIZE,					-- size
					-vFwd.x, -vFwd.y, -vFwd.z,	-- up
					1.0							-- alpha
				)

		vPos:SubEquals(vOffset)
		vPos:SubEquals(vOffset)
		AttachDecal(self.leftFootDecal,
					10,							-- lifetime
					vPos.x, vPos.y, vPos.z,		-- pos
					-vUp.x, -vUp.y, -vUp.z,		-- projection dir
					SIZE,SIZE,					-- size
					-vFwd.x, -vFwd.y, -vFwd.z,	-- up
					1.0							-- alpha
				)

		EndMath(cooky)
	end

	function Ob:testCitizenPopulation()
		if (not self.citizenPool) then
			return
		end
		
		local numToSpawn = self.DESIRED_CITIZEN_POPULATION - getn(self.citizenPool:getNotPooled())
		local rx, ry, rz = Global.player:getPosition()
		if numToSpawn > 0 then
			local spawner = self:findNearestCitizenSpawner(self.MIN_CITIZEN_DISTANCE)
			if not spawner then return end
			-- Spawn in two groups: one at the nearest locator, one at the second nearest.
			self:placeCitizens(spawner, numToSpawn/4)
			-- Spawn the second batch
			local secondSpawner = self:findNearestCitizenSpawner(self.MIN_CITIZEN_DISTANCE)
			self:placeCitizens(secondSpawner or spawner, numToSpawn/4)
		end
	end

	function Ob:placeCitizens(spawner, numToSpawn)
		local count = 0
		local tries = 0 -- This is to prevent an infinite loop for a bad spawner location
		while (count < numToSpawn) and (tries < numToSpawn * 8) do
			local x, y, z = self:findCitizenPlacement(spawner)
			if (x) then
				local guy = self.citizenPool:get()
				guy:setPosition(x, y, z)
				count = count + 1
			end
			tries = tries + 1
		end
	end

	function Ob:findCitizenPlacement(spawner)
		if not spawner then
			GamePrint('WARNING: no citizen spawn points.  No citizens will be spawned.')
			return
		end
		local radius = random()
		--This isn't really desirable
		--radius = 1-radius*radius
		radius = radius * self.CITIZEN_SPAWN_RADIUS
		local yaw = RandInt(1, 360)
		local dYaw = 15
		for i = 0, 360, dYaw do
			yaw = yaw + dYaw
			if (yaw > 180) then 
				yaw = yaw - 360
			end
			local fx, fy, fz = EulerToVector(0, yaw, 0)
			local sx, sy, sz = spawner:getPosition()
			fx, fy, fz = sx+fx*radius, sy+fy*radius, sz+fz*radius
			if (IsPositionOnPath(fx, fy, fz) == 1) then
--				showSphere(fx, fy, fz, 30)
				return fx, fy, fz
			end
		end
	end
	
--[[
	function Ob:testC()
		if not FindScriptObject('CitizenSpawner1') then
			local l = SpawnScript('Locator', 'CitizenSpawner1', '', 1)
			l:setPosition(1219.7, 100, -1647.5)
			l = SpawnScript('Locator', 'CitizenSpawner2', '', 1)
			l:setPosition(-360.8, 30, 448.8)
		end
		self:testCitizenPopulation()
	end
]]--

	function Ob:findNearestCitizenSpawner(minDist)
		if not minDist then minDist = 0 end
		local bestSpawner = { dist = 10000 }

		local spawnerFind = function(ent)
			local rx, ry, rz = Global.player:getPosition()
			local dist = GetDistance(rx, ry, rz, ent:getPosition())
			if dist < %bestSpawner.dist and dist > %minDist then
				%bestSpawner.spawner = ent
				%bestSpawner.dist = dist
			end
		end
		iterate('CitizenSpawner', spawnerFind, 100)
		return bestSpawner.spawner
	end
								 
	function Ob:registerAirbaseDeathListeners()
		local tEntityTable = { 'airbaseElectroTruck1', 'airbaseElectroTruck2', 'airbaseElectroTruck3', 'airbaseMSilo1', 'airbaseMSilo2', 'airbaseMSilo3', 'airbaseTank1', 'airbaseTank2' }
		local max = getn(tEntityTable)
		local ent = nil
		for i = 1, max do
			ent = FindScriptObject(tEntityTable[i])
			if (ent) then
				ent:registerDeathListener(self)
				self.iAirbaseEnemyCount = self.iAirbaseEnemyCount + 1
			end
		end
	end

	function Ob:startAttack(enemies)
		if (enemies) then
			local max = getn(enemies)
			for i = 1, max do
				if (enemies[i] and enemies[i].startAttack and enemies[i].bDead == 0) then
					enemies[i]:startAttack()
				end
			end
		end
	end

	function Ob:stopAttack(enemies)
		if (enemies) then
			local max = getn(enemies)
			for i = 1, max do
				if (enemies[i] and enemies[i].stopAttack and enemies[i].bDead == 0) then
					enemies[i]:stopAttack()
				end
			end
		end		
	end

	function Ob:onEnemyDeath(data, from)
		if from and from.Name == 'BigCannon' then
		else
			self.iAirbaseEnemyCount = self.iAirbaseEnemyCount - 1
			self:UpdateHostileCount(self.iAirbaseEnemyCount)
			if ((Global:load('bShipsDockedPlayed') ~= 1) and self.iAirbaseEnemyCount == 0 and self.bClearedAirbase == 0) then
				self.bClearedAirbase = 1      
				self:DisableHostileCounter()
				self.cutsceneScript:callFunctionAfter(self.cutsceneScript.runCutscene, 1000, 'ShipsDocked')
			end
		end
	end
	
	function Ob:onEnteredTriggerVolume(data, from)
        if (from and from == Global.player) then
		-- ENEMY SPAWNING CODE DONT DELETE	
			if self.tvSpawners[data] then
				--Because the electro truck cutscene references the prison break, don't spawn
				--electro trucks until prisoners have been freed.
				local id = self.tvSpawners[data]
				for i = 1, getn(self.enemyTable[id]), 1 do
					local type = strlower(self.enemyTable[id][i].type)
					if (type == 'etruck') and (Global:loadGlobal('bGotShield') ~= 1) then
						GamePrint('Hasn\'t freed prisoners yet, dont start electro trucks')
						return
					end
				end

				UnregisterTriggerVolume(self, data)
				self:startGroup(self.tvSpawners[data])
				-- END ENEMY SPAWNING CODE
				--[[
			elseif (data == 'tv_StartBlimp') then
				local blimp = FindScriptObject('dirigible')
				if blimp then
					self:sendMessage(blimp, 'GO', '')
				end
		        ]]--
		    elseif self.tvDeploy[data] then
				self:deployGroup(self.tvDeploy[data])
			elseif data == 'tv_tankintroCutscene' then
				self:deployGroup(1)
			elseif (data == self.rVolcanoTSHandle) then
				self:playSound(self.rVolcanoAmbientSound, 1, 0, 1)
			elseif (data == 'tv_goalDamTop') then
				Global.goalManager:activate('SkyscraperIsland')
				Global:save('bReachedDamTop', 1)
				UnregisterTriggerVolume(self, 'tv_goalDamTop')
			elseif (data == 'tv_nearTunnel') then
				self.nearTunnel = 1
			elseif (data == 'tv_plane1' and Global:loadGlobal('bLOCompleted') == 1 and self.planesStarted ~= 1) then
				self.planesStarted = 1
				self:startPlanes(1)
			elseif (data == 'tv_nearDam') and (Global:load('bBigCannonDefeated') == 1) and 
					(Global:load('bBlimpPilotSaved') == 1) and (Global:load('bThePlanPlayed') ~= 1) then
				self.bNearDam = 1
				Global.cutsceneScript:runCutscene('ThePlan')
			elseif (data == 'tv_electrocutscene') and (Global:loadGlobal('bGotShield') == 1) and (Global:load('bElecTruckIntroduction11Played') ~= 1) then
				--In case they weren't deployed yet
				self:deployGroup(11)
				Global.cutsceneScript:runCutscene('ElecTruckIntroduction11')
			end
		end
	end

	function Ob:onExitedTriggerVolume(data, from)
        if (from and from == Global.player) then
			if (data == self.rVolcanoTSHandle) then
				self:stopSound(self.rVolcanoAmbientSound)
			elseif (data == 'tv_nearTunnel') then
				self.nearTunnel = nil
			elseif (data == 'tv_nearDam') then
				self.bNearDam = 0
			end
		end
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		Global.player.Razilla = 0
		-- temporary hack for game speed
--		DebugSetGameSpeed(1)
	end

	function Ob:onTimer(id)
		if id == self.TIMER_TEST_POPULATION then
			self:testCitizenPopulation()
		else
			%Ob.Parent.onTimer(self, id)
		end
	end
	
	--Listen for Raz to get on the ball, and kick him off it
	function Ob:listenerControlHandlerChanged(type)
		if (type == kCONTROL_BALL) then
			--Use a timer so we can see him do the full ball mount
			self:createNamedTimer(500, 'KnockOffBall', 1)
		end
	end
	
	function Ob:onTimerKnockOffBall()
		if (GetControlHandler() == kCONTROL_BALL) then
			Global.player:sayLine("/GLRA077RA/", 0, 1, nil, 1)
			Global.player:playSound('Negative', 0, 0, 1)
			Global.player:interruptPowers(1)
			SetControlHandler(kCONTROL_PLAYER)
		end
	end

	function Ob:onBeginCutscene()
		local item = FindScriptObject(Global.player.HeldItem, 1)
		if (item) and (item:IsA('LO.Characters.LOEnemy') == 1) then
			Global.player:releaseSelectedItem()
			item:die(1)
		end
	end

-- *********************************************************************************
-- ENEMY SPAWN FUNCTIONS ***DO NOT DELETE***
-- *********************************************************************************
	function Ob:registerEnemy(startLoc, type, groupID, destLoc)
		local enemyTable = self:getEnemyTables(groupID)

		local newEnemy = {}
        newEnemy.type = type
		newEnemy.startLoc = startLoc
		if destLoc then
			newEnemy.destLoc = FindScriptObject(destLoc)
		end

		tinsert(enemyTable, newEnemy)		
	end
-- *********************************************************************************   
	
	function Ob:getEnemyTables(groupID)
		if not self.enemyTable[groupID] then
			self.enemyTable[groupID] = {}
			self.groupTable[groupID] = {
				numDead = 0,	-- number of peeps in that group that are dead
				bLaunched = 0,	-- bool that represents if this group has been launched into battle yet
				bDeployed = 0,	-- bool that represents if this group has been deployed or not
			}
		end
		return self.enemyTable[groupID], self.groupTable[groupID]
	end
	
	function Ob:registerSpawnInfo(groupID, byDeathOfGroup, byTriggerVol, bDeployOnly, spawnRate)
		local enemyTable, groupTable = self:getEnemyTables(groupID)
		if (bDeployOnly == 1) and (spawnRate ~= 0) then
			GamePrint('WARN: Group '..tostring(groupID)..' has bDeployOnly but finite spawnRate.  Setting infinite spawnRate.')
			spawnRate = 1
		end
		groupTable.spawnRate = spawnRate
	
		if (byTriggerVol and (byTriggerVol ~= '')) then
			if (bDeployOnly == 1) then
				self.tvDeploy[byTriggerVol] = groupID
			else
				self.tvSpawners[byTriggerVol] = groupID
			end
			RegisterTriggerVolume(self, byTriggerVol)
		elseif byDeathOfGroup then
			self.deathSpawners[byDeathOfGroup] = groupID
		end
	end

-- *********************************************************************************   
	function Ob:registerDeath(entity)
		local ID = entity.LOGroupID
		if (ID) then
			entity.LOGroupID = nil
			self.groupTable[ID].numDead = self.groupTable[ID].numDead + 1	-- increase death toll
			if getn(self.enemyTable[ID]) <= self.groupTable[ID].numDead then	-- all members of this group are dead
				-- check to see if this group's death starts another groups attack
				if self.deathSpawners[ID] then
					self:startGroup(self.deathSpawners[ID])
				end
			end
		end
	end
	
-- *********************************************************************************
	--Start all groups in the level
	function Ob:startTriggeredGroups(tTriggerTable)
		for id, group in self.groupTable do
			if (not tTriggerTable) or (findKeyForValue(tTriggerTable, id)) then
				self:startGroup(id)
			end
		end
	end

	-- use this function to start all enemies with group ID equal to id
	function Ob:startGroup(id)
		if not self.groupTable[id] then return end	-- group doesnt exist

		if self.groupTable[id].bLaunched ~= 1 then
			self.lastGroupStarted = id

			self.groupTable[id].bLaunched = 1

			local bDeploy = (findKeyForValue(self.tvDeploy, id) and 0) or 1  -- If deployment is triggered, then don't deploy immediately
			if (bDeploy == 1) then
				self.groupTable[id].bDeployed = 1
			end

			local enemyTable = self.enemyTable[id]
			if not enemyTable then return end	-- true if given group id doesnt exist.

			--If infinite spawn rate, then spawn them all immediately
			if (self.groupTable[id].spawnRate == 0) then
				local numEnemies = getn(enemyTable)
				for i = 1, numEnemies, 1 do
					self:startEnemy(id, enemyTable[i])
				end
			else
				--Otherwise, put the group ID in the start queue, and then set spawning state
				tinsert(self.startQueue, id)
				if (self.state_name ~= 'StartGroups') then
					self:setState('StartGroups')
				end
			end
		end
	end

	--Start all groups in the queue, spread out one over a few frames
	function Ob:stateStartGroups()
		local id = tremove(self.startQueue, 1)
		
		if (id) then
			local spawnRate = self.groupTable[id].spawnRate
			local enemyTable = self.enemyTable[id]
			local numEnemies = getn(enemyTable)
			local spawnCount = 0
			for i = 1, numEnemies, 1 do
				self:startEnemy(id, enemyTable[i])
				spawnCount = spawnCount + 1
				if (spawnCount >= spawnRate) then
					Yield()
					spawnCount = 0
				end
			end
		else
			self:setState(nil)
		end
	end

	function Ob:startEnemy(groupID, toSpawn)
		local bDeploy = self.groupTable[groupID].bDeployed
	
		local enemyType = strlower(toSpawn.type)
		GamePrint('Start ' .. enemyType)

		local enemy = self.enemyPoolTable[enemyType].pool:get()
		enemy.LOGroupID = groupID	-- used by enemy later to register its death
		enemy:setVelocity(0, 0, 0)
		enemy:setPosition(toSpawn.startLoc:getPosition())
		enemy:setOrientation(toSpawn.startLoc:getOrientation())
		SnapEntityToGround(enemy)
		enemy.rSpawnPosition = toSpawn.destLoc

		toSpawn.rEnemy = enemy -- store off reference to enemy, so we can use it later
		
		if (bDeploy == 1) then
			enemy:deploy()
		end
	end


	function Ob:groupIsDeployed(id)
		if (not self.groupTable[id]) then
			GamePrint('WARN: Invalid group: '..id)
			return
		end
		
		return self.groupTable[id].bDeployed or 0
	end

	function Ob:deployGroup(id)
		if not self.groupTable[id] then return end	-- group doesnt exist

		if self.groupTable[id].bDeployed ~= 1 then
			if (self.groupTable[id].bLaunched ~= 1) then
				self:startGroup(id)
			end
			
			local enemyTable = self.enemyTable[id]
			if not enemyTable then 
				GamePrint('Attempting to deploy a group that doesn\'t exist: '..tostring(id))
				return 
			end	-- true if given group id doesnt exist.

			self.groupTable[id].bDeployed = 1
			for i, enemy in enemyTable do
				if (type(enemy) == 'table') and (enemy.rEnemy) then
					enemy.rEnemy:deploy()
				else
					GamePrint('WARN: Couldn\'t deploy enemy, no enemy reference stored!')
				end
			end
		end
	end

	-- Utility method for PlaneIntroduction: it calls this, which tells cutsceneScript to play
	-- ShipsNotDocked immediately following the planes cutscene.
	function Ob:queueShipsCutscene()
		if (Global:load('bShipsNotDockedPlayed') ~= 1) then
			Global.cutsceneScript.postCutsceneCallback = Global.cutsceneScript.runCutscene
			Global.cutsceneScript.postCutsceneCallbackSelf = Global.cutsceneScript
			Global.cutsceneScript.postCutsceneCallbackArg = 'ShipsNotDocked'
		end
	end

	function Ob:startPlanes(whichGroup)
		for k, v in Global.notSaved.planeGroups[whichGroup] do
			if k ~= 'n' then
				self:sendMessage(v, 'Triggered')
				v:onTriggered()
				self:incrementPlaneCounter()
			end
		end
	end

-- *********************************************************************************
-- END ENEMY SPAWN FUNCTIONS	*** DONT DELETE ***
-- *********************************************************************************

	Ob.COUNTER_X = 150
	Ob.COUNTER_Y = 420
	Ob.COUNTER_SPRITE_X = 120
	Ob.COUNTER_SPRITE_Y = 350

	function Ob:enablePlaneCounter()
		self.planeCountSprite = AddSpriteHandle('Textures/LevelTextures/LO_Lungfishopolis/PlaneCounter.tga', self.COUNTER_SPRITE_X, self.COUNTER_SPRITE_Y, 1, 1, 1, 0)
		self.planeCountText = DisplayText('//'..self.planeCount, self.COUNTER_X, self.COUNTER_Y)   
	end

	function Ob:decrementPlaneCounter()
		self.planeCount = self.planeCount - 1
		if self.planeCountSprite then
			RemoveText(self.planeCountText)
			self.planeCountText = DisplayText('//'..self.planeCount, self.COUNTER_X, self.COUNTER_Y)   
		end
	end

	function Ob:incrementPlaneCounter()
		self.planeCount = self.planeCount + 1
		if self.planeCountSprite then
			RemoveText(self.planeCountText)
			self.planeCountText = DisplayText('//'..self.planeCount, self.COUNTER_X, self.COUNTER_Y)   
		end
	end

	function Ob:disablePlaneCounter()
		RemoveSprite(self.planeCountSprite)
		RemoveText(self.planeCountText)
		self.planeCountSprite = nil
		self.planeCountText = nil
	end

	function Ob:assKickedByTanks()
		if Global.notSaved.assKickedByTanksScore > 3 and Global.player.stats.psiHealth < Global.player.stats.maxHealth/2 then
			Global.notSaved.assKickedByTanksScore = -2
			return 1
		end
	end

	function Ob:getHintResponse()
		local response

		if self:afterPlanes() then
			response = { { voice = "/GLAN009FO/" } } --DIALOG=<<You can use those super tankers to get across the channel.>>
		elseif self:assKickedByTanks() then
			response = { { voice = "/GLAN014FO/" } } --DIALOG=<<Why don\'t you just pick up those pesky tanks and throw them at each other?>>
		elseif self:beforeZealots() then
			response = { { voice = "/GLAN000FO/" } } --DIALOG=<<Well, if I were a monster, 50 stories high, I\'d probably start smashing stuff.>>
		elseif self:beforePrison() then
			response = { { voice = "/GLAN001FO/" } } --DIALOG=<<You hear em. Bust open that prison over there.>>
		elseif self:afterPrison() then
			response = { { voice = "/GLAN006FO/" } } --DIALOG=<<Your PSI Shield would protect you in that tunnel, and maybe even do some damage to the emitters.>>
		elseif self:nearMicrowaveTunnel() then
			response = { { voice = "/GLAN006FO/" } } --DIALOG=<<Your PSI Shield would protect you in that tunnel, and maybe even do some damage to the emitters.>>
		elseif self:nearDam() then
			response = { { voice = "/GLAN007FO/" } } --DIALOG=<<We have to find someone to pilot this blimp for us so we can get over this dam!>>
		elseif self:inAttackPlaneArea() then
			response = { { voice = "/GLAN008FO/" } } --DIALOG=<<Get up on top of these buildings and take out those planes!>>
		else
			return %Ob.Parent.getHintResponse(self)
		end
		
		return response
	end

	function Ob:beforeZealots()
		return Global:load('bZealotIntroductionPlayed')	~= 1
	end

	function Ob:beforePrison()
		return (nil == self:beforeZealots()) and (nil == Global:load('bZealotJailBreakoutPlayed'))
	end
	
	function Ob:afterPrison()
		return (Global:load('bZealotJailBreakoutPlayed') == 1) and (Global:load('bMicrowaveTunnelDestroyed') ~= 1)
	end
	
	function Ob:nearMicrowaveTunnel()
		return (self.nearTunnel == 1) and (Global:load('bMicrowaveTunnelDestroyed') ~= 1)
	end
	
	function Ob:nearDam()
		return (self.bNearDam == 1) and (Global:load('bReachedDamTop') ~= 1)
	end
	
	function Ob:inAttackPlaneArea()
		return Global:load('bPlaneIntroductionPlayed') == 1
	end
	
	function Ob:afterPlanes()
		return Global:load('bShipsDockedPlayed') == 1
	end
	
	function Ob:pauseFXForCutscene()
		SoundMuteCategory(kSOUNDCAT_FX)		
	end

	function Ob:resumeFXForCutscene()
		SoundUnmuteCategory(kSOUNDCAT_FX)
	end
	
	return Ob
end

