function WWMA(Ob)

	if (not Ob) then
		Ob = CreateObject('LevelScript')
		Ob.tRespawnPosPerScale = {}
		Ob.tRespawnPosPerScale['A'] = { x = -43728, y = 8813, z = 5952 }
		Ob.tRespawnPosPerScale['B'] = { x = -27966, y = 8, z = 5319 }
		Ob.tRespawnPosPerScale['C'] = { x = 18817, y = -19923, z = 7143 }
		Ob.sCurrScale = 'A'
		-- for the snail collection
		Ob.MAX_SNAILS = 10
		Ob.iSnailCount = 0
		Ob.bCollectedAllSnails = 0
		Ob.rWineGlass = nil
		Ob.rWineGlassTSHandle = nil
		Ob.theme = 'WaterlooWorld'

		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'WW.Characters.Snail',
			},
			textures = {
				'Textures/LevelTextures/WW_WaterlooWorld/SnailCounter.dds'
			},
			animations = {
				'Anims/DartNew/WWladderAtoB.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/climbledge.jan',
				'Anims/DartNew/landsoft.jan',
				'Anims/WW_Gears/WW_gearsSpin.jan',
				'Anims/WW_Gears/WW_gearsStuck.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/Censor1L/Burly_DamageFrontPriority.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmUp_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Rifle.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Grabbed.jan',
				'Anims/DartNew/Hop_water.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
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
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/WW_Drawbridge/DrawbridgeAnimationUp.jan',
				'Anims/WW_Gears/WW_quillpinStuck.jan',
				'Anims/WW_TreeGIOs/WWMA_OrchardAliveTreesSCC_shake.jan',
				'Anims/WW_TreeGIOs/WWMA_OrchardBirdFigTreesSCC_shake.jan',
				'Anims/WW_cork/CloseAnim.jan',
				'Anims/WW_cork/OpenCloseAnim.jan',
				'Anims/WW_cork/floating.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
				'Anims/WW_BreakeablePlato/BrekeableDoorIddle.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
				'anims/ww_bushes/ww_bushshake.jan',
				'anims/ww_globe/globespin.jan',
				'anims/ww_hay/ww_hay_bouncy.jan',
				'anims/ww_hay/ww_hay_bouncyhaystack.jan',
				'anims/ww_plankwall/ww_plankbrakes.jan',
				'anims/ww_treegios/wwma_generictrees_shake.jan',
			}
		}        
        end

--*************************************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		FindScriptObject('ScaleBRefOrigin').onDestroyed = function(self, arg)
															  if (arg ~= 1) then
																  HardBreak('ScaleBRefOrigin destroyed')
																  StackTrace()
															  end
														  end

		FindScriptObject('ScaleBRefOrigin').killSelf = function(self)
														   HardBreak('ScaleBRefOrigin killed')
														   StackTrace()															  
													   end
	end

	function Ob:onPreBeginLevel()
		Global:save('playerRespawnPointName', nil)
		%Ob.Parent.onPreBeginLevel(self)
		-- turning off domains
		DomainSleep('ScaleADOMAIN',0)
		DomainSleep('LSOScaleADOMAIN',0)
		DomainSleep('ScaleBDOMAIN',1)
		DomainSleep('LSOScaleBDOMAIN',1)
		DomainSleep('ScaleCDOMAIN',1)
		DomainSleep('LSOScaleCDOMAIN',1)
--		if (Global:load('GamePieceCowKilled') ~= 1) then
--			Global:save('GamePieceCowActive', 1)
--		end
		Global:save('GamePieceCowKilled', 1)
		-- set the bridges to be broken
		if (not Global:load('Bridge1Fixed')) then
			Global:save('Bridge1Fixed', 1)
		end
		if (not Global:load('Bridge2Fixed')) then
			Global:save('Bridge2Fixed', 1)		
		end

		-- tweak the talking doors
		local door = FindScriptObject('talkingDoor', 1)
		if (door) then
			door.animBasePath = ''			
			door.animsTable = {}
		end
		door = FindScriptObject('talkingDoor2', 1)
		if (door) then
			door.animBasePath = ''	
			door.animsTable = {}		
		end
		door = FindScriptObject('talkingDoor3', 1)
		if (door) then
			door.animBasePath = ''			
			door.animsTable = {}
		end
		door = FindScriptObject('talkingDoor4', 1)
		if (door) then
			door.animBasePath = ''			
			door.animsTable = {}
		end
		door = FindScriptObject('talkingDoor5', 1)
		if (door) then
			door.animBasePath = ''			
			door.animsTable = {}
		end

		self.tAmbientSoundLoops = {
			tv_scaleAkillrespawnpoint0 = { soundCueName = 'WWParlorAmb' },
			tv_killrespawnpoint1 = { soundCueName = 'WWAmb' },
		}

		-- default the bridge to be down
		if (not Global:load('DrawBridgeDown')) then
			Global:save('DrawBridgeDown', 1)
		end
	end

--*************************************************************************************************

	function Ob:onBeginLevel()
		--edit Removed
		--Global:setLevelToCompleted('MM')

		%Ob.Parent.onBeginLevel(self)
		self.cutsceneScript:fadeToBlack(0)
		SetSkyBox('Levels/WW_WaterlooWorld/WW_skydome.plb')

		--edit Create WWPuzzlePlacer
		self.puzzles = SpawnScript('WW.WWPuzzlePlacer', 'WWPuzzlePlacer')

		-- place napoleon in scale B
		local napoleonB = SpawnScript('WW.Characters.Napoleon', 'NapoleonScaleB', 'self.sScale = \'B\'')
--		SetEntityDomain(napoleonB,'LSOScaleBDOMAIN')
		napoleonB:setPosition( -27238.9, 128.8, 6839 )
		napoleonB:setOrientation(0, 76, 0)
		-- place napoleon in scale C
		local napoleonC = SpawnScript('WW.Characters.Napoleon', 'NapoleonScaleC', 'self.sScale = \'C\'')
--		SetEntityDomain(napoleonC,'LSOScaleCDOMAIN')
		local x, y, z = self:getTargPosition('C',  -27238.9, 128.8, 6839, 1)
		napoleonC:setPosition(x, y, z)
		napoleonC:setOrientation(0, 76, 0)

		-- set up the ladder trigger for scale switching
		local napoleonA = FindScriptObject('Napoleon')	
		if (napoleonA) then
			self.scaleALadder = FindNearestEntity(napoleonA, 5000, 'global.props.Ladder')
			self.scaleALadder = FindNearestEntity(napoleonA, 5000, 'global.props.Ladder',self.scaleALadder)
		end
		-- specify a function
		if (self.scaleALadder) then
			self.scaleALadder.onLadderUp = function(self, bStart)
										  if (bStart == 1) then
											  Global.levelScript:trackHeightOnLadder()
										  else
											  Global.levelScript:trackHeightOnLadder(1)
										  end
									  end
		end
		-- set up the ladder trigger for scale switching		
		if (napoleonB) then
			self.scaleBLadder = FindScriptObject('splLaddscalealadder')
		end
		self.scaleBLadder.railCamB = FindScriptObject('railCam01')
		self.scaleBLadder.railCamB.bPlayerInTrigVol = 1
		-- specify a function
		if (self.scaleBLadder) then
			self.scaleBLadder.onLadderUp = function(self, bStart)
										  if (bStart == 1) then
											  Global.levelScript:trackHeightOnLadder()											  
										  else
											  Global.levelScript:trackHeightOnLadder(1)
										  end									  
									  end
			self.scaleBLadder.onPlayerAttach = function(self)
												   if (Global.levelScript.cutsceneScript.cutscenePlaying ~= 1) then
													   self.railCamB:turnOn()
												   end
											   end
			self.scaleBLadder.onPlayerDetach = function(self)
--												   if (Global.levelScript.cutsceneScript.cutscenePlaying ~= 1) then
													   self.railCamB:turnOff()
--												   end
											   end
		end

		RegisterTriggerVolume(self, 'tv_Soldier1Introduction')
		RegisterTriggerVolume(self, 'tv_Orchard')
		RegisterTriggerVolume(self, 'tv_Board')
		RegisterTriggerVolume(self, 'tv_strongdoor')
		RegisterTriggerVolume(self, 'tv_RazTakeStrongHold')
		RegisterTriggerVolume(self, 'tv_onCarpentersRoof')	--For deactivating goal
		
		Global.player:addSpamListener('Vault', self) --For deactivating vault goal
		
		-- turn off the victory flag initially
		local n2f = FindScriptObject('N2FSymbol')
		n2f:hide()
		-- turn it around
		local ox, oy, oz = n2f:getOrientation()
		n2f:setOrientation(ApplyOrientation(ox, oy, oz, 0, 180, 0))
		
		-- collect locators for spawning the snail cannons
        self.cannonPoints = 	{ n = 0 }
		--self.censorPoints =		{ n = 0 }
		
		local me = self
		
		local registerCannonPoints = function(point)
			tinsert(%me.cannonPoints, point)
		end
		
		--local registerCensorPoints = function(point)
		--	tinsert(%me.censorPoints, point)
		--end
		
		iterate('CannonLocator', registerCannonPoints)
		
		--iterate('CensorLocator', registerCensorPoints)
		
		self.cannonPool = Global.levelScript:getPool('Global.Enemies.SnailCannon')
		self.cannonPool:setLowerLimit(1)
		
		--self.censorPool = Global.levelScript:getPool('Global.Enemies.CensorBurly')
		--self.censorPool:setLowerLimit(1)

		-- for the stronghold
		self.rStrongHoldCollision = FindScriptObject('Gatecolision')				
		
		Global.goalManager:activate('HelpFred')
		
		--this stays on until the 'strongdoor' is burned away
		SetSwitchableCollisionEnable(1,1)

		self.rSnailCollectionSound = LoadSound('SnailCollect')

		if Global:load('AllSnailsCollected') == 1 then
			self.bCollectedAllSnails = 1
		end
	end

--*************************************************************************************************

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
--		if (Global.player:isInInventory('ScaleToA') ~= 1) then
--			local scaleAProp = FindScriptObject('ScaleToA')
--			if scaleAProp then
--				scaleAProp:addToInventory()
--			end
--		end

--		if (Global.player:isInInventory('ScaleToB') ~= 1) then       
--			local scaleBProp = FindScriptObject('ScaleToB')
--			if scaleBProp then
--				scaleBProp:addToInventory()
--			end
--		end
		
--		if (Global.player:isInInventory('ScaleToC') ~= 1) then
--			local scaleCProp = FindScriptObject('ScaleToC')
--			if scaleCProp then
--				scaleCProp:addToInventory()
--			end
--		end		


		--edit Spawn Rando Rewards if already done, but not picked up.
		if Global:load('bCarpenterBecomesPiecePlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:carpenterHelp()
		end

		if Global:load('bPeasantOneBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant1Help()
		end

		if Global:load('bPeasantTwoBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant2Help()
		end

		if Global:load('bPeasantThreeBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant3Help()
		end

		if Global:load('bKnightBecomesPiecePlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:knightHelp()
		end


		-- placing the fireplace particle emitter
		self.firePlaceEmitter = SpawnScript('WW.Effects.fireFX')
		SetEntityDomain(self.firePlaceEmitter, 'LSOScaleADOMAIN')
		self.firePlaceEmitter:setPosition(-44408,8894,5309)
		self.firePlaceEmitter:run()

		-- turn the fireplace collision off
		self.firePlaceCollision = FindScriptObject('FirePlaceCollision')
		if (self.firePlaceCollision) then
			SetPhysicsFlag(self.firePlaceCollision, PHYSICS_COLLIDEE, 0)
			RegisterTriggerVolume(self, 'tv_FirePlace', 0)
		end

		-- set fred on the right position
--		local fred = FindScriptObject('Fred')
--		fred:setPosition(-43685.7, 9080.5, 5557)		
--		fred:setOrientation(-21.747, 25.105, 8.672)

		-- scale the signs in scale B
		local iSignColRad = 40
		local orchardSign = FindScriptObject('OrchardSign')
		if (orchardSign) then
			SetEntityCollideSphere(orchardSign, iSignColRad, 0, 130, 0)
			orchardSign:setScale(0.1, 0.1, 0.1)
			SetPhysicsFlag(orchardSign, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(orchardSign, PHYSICS_MOVINGGEOMETRY, 0)
		end
		local carpenterSign = FindScriptObject('CarpenterSign')
		if (carpenterSign) then
			SetEntityCollideSphere(carpenterSign, iSignColRad, 0, 130, 0)			
			carpenterSign:setScale(0.1, 0.1, 0.1)
			SetPhysicsFlag(carpenterSign, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(carpenterSign, PHYSICS_MOVINGGEOMETRY, 0)
		end
		local peasantSign1 = FindScriptObject('PeasantSign')
		if (peasantSign1) then
			SetEntityCollideSphere(peasantSign1, iSignColRad, 0, 130, 0)
			peasantSign1:setScale(0.1, 0.1, 0.1)		
			SetPhysicsFlag(peasantSign1, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(peasantSign1, PHYSICS_MOVINGGEOMETRY, 0)
		end
		local peasantSign2 = FindScriptObject('PeasantSign1')
		if (peasantSign2) then
			SetEntityCollideSphere(peasantSign2, iSignColRad, 0, 130, 0)
			peasantSign2:setScale(0.1, 0.1, 0.1)
			SetPhysicsFlag(peasantSign2, PHYSICS_COLLIDEE,  1)
			SetPhysicsFlag(peasantSign2, PHYSICS_MOVINGGEOMETRY, 0)
		end
		local peasantSign3 = FindScriptObject('PeasantSign2')
		if (peasantSign3) then
			SetEntityCollideSphere(peasantSign3, iSignColRad, 0, 130, 0)
			peasantSign3:setScale(0.1, 0.1, 0.1)
			SetPhysicsFlag(peasantSign3, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(peasantSign3, PHYSICS_MOVINGGEOMETRY, 0)
		end
		local restaurantSign = FindScriptObject('RestaurantSign')
		if (restaurantSign) then
			SetEntityCollideSphere(restaurantSign, iSignColRad, 0, 130, 0)
			restaurantSign:setScale(0.1, 0.1, 0.1)
			SetPhysicsFlag(restaurantSign, PHYSICS_COLLIDEE, 1)
			SetPhysicsFlag(restaurantSign, PHYSICS_MOVINGGEOMETRY, 0)
		end

		-- place watermill in scale B
		local mill = FindScriptObject('watermill')
		if (mill) then
			local x, y, z = self:getTargPosition('B', mill, nil, nil, 1)
			local editvar = 'self.meshName = \'levels/ww_waterlooworld/props/WW_watermill.plb\' self.bRotateRoll = -1'
			local millScaleB = SpawnScript('Global.Props.RotatingGeometry', mill.Name..'ScaleB', editvar)
			SetEntityDomain(millScaleB,'LSOScaleBDOMAIN')
			millScaleB:setPosition(x, y, z)
			millScaleB:setOrientation(mill:getOrientation())
			SetPhysicsFlag(millScaleB, PHYSICS_COLLIDEE, 0)
			millScaleB:setScale(0.1, 0.1, 0.1)
		end

		-- turn off collision for the animated doors
		local door = FindScriptObject('talkingDoor', 1)
		if (door) then
			SetPhysicsFlag(door,PHYSICS_COLLIDEE,0)
			SetPhysicsFlag(door,PHYSICS_COLLIDER,0)
			SetPhysicsFlag(door,PHYSICS_NOPHYSICS,1)
		end
		door = FindScriptObject('talkingDoor2', 1)
		if (door) then
			SetPhysicsFlag(door,PHYSICS_COLLIDEE,0)
			SetPhysicsFlag(door,PHYSICS_COLLIDER,0)
			SetPhysicsFlag(door,PHYSICS_NOPHYSICS,1)
		end
		door = FindScriptObject('talkingDoor3', 1)
		if (door) then
			SetPhysicsFlag(door,PHYSICS_COLLIDEE,0)
			SetPhysicsFlag(door,PHYSICS_COLLIDER,0)
			SetPhysicsFlag(door,PHYSICS_NOPHYSICS,1)
		end
		door = FindScriptObject('talkingDoor4', 1)
		if (door) then
			SetPhysicsFlag(door,PHYSICS_COLLIDEE,0)
			SetPhysicsFlag(door,PHYSICS_COLLIDER,0)
			SetPhysicsFlag(door,PHYSICS_NOPHYSICS,1)
		end
		door = FindScriptObject('talkingDoor5', 1)
		if (door) then
			SetPhysicsFlag(door,PHYSICS_COLLIDEE,0)
			SetPhysicsFlag(door,PHYSICS_COLLIDER,0)
			SetPhysicsFlag(door,PHYSICS_NOPHYSICS,1)		
		end

		-- set the right texture for the peasant 3 door
		if Global:load('GamePieceSoldier2Active') then
			self:setDoorThreeUnavail(0)
		else					
			self:setDoorThreeUnavail(1)
		end
		
		local curse = FindScriptObject('watercurse')
		if curse ~= nil then
			curse.trigPlaneYOffset = 130
		end
		
		--self:hidePeasant3Item()
		
		local p3stack = FindScriptObject('Bighaypilesack')
		if p3stack ~= nil then
			p3stack:addListener( self )
		end	
		
		if Global:loadGlobal('bWWCompleted') == 1 then
			FindScriptObject('NSymbol'):killSelf()
			FindScriptObject('NapoleonSymbolSCC'):killSelf()
			FindScriptObject('NapoleonHexSCB'):killSelf()
			FindScriptObject('NapoleonHexSCC'):killSelf()
		else
			FindScriptObject('FSymbol'):killSelf()  
			FindScriptObject('FredSymbolSCC'):killSelf()  
			FindScriptObject('FredHexSCB'):killSelf() 
			FindScriptObject('FredHexSCC'):killSelf() 
		end
        self:setState('Intro')
	end

--*************************************************************************************************

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		WWHexTable = nil
	end

--*************************************************************************************************
	
	function Ob:stateIntro()
		if (Global:load('bWWINPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('WWIN', 1)
			Global:save('bWWINPlayed', 1)
		elseif Global:loadGlobal('bWWCompleted') ==1 then
			self:runRevisitHint()
		end
		
		self:setState(nil)
	end

--*************************************************************************************************

	function Ob:stateTrackRazLadderHeight()	
		local height = 8900
		local cutsceneToPlay = 'ScaleToB'
		if (self.sCurrScale == 'B') then
			--		height = 1880  -- this'll be something else
			height = 1750
			cutsceneToPlay = 'ScaleToA'
		end
		local x, y, z = Global.player:getPosition()
		local bInterp = 1
		if (y >= height) then			
			if (cutsceneToPlay == 'ScaleToA') then
				bInterp = 1
			end
			self.cutsceneScript:runCutscene(cutsceneToPlay, 0, bInterp, 0, 1)
			self:setState(nil)
		end
	end

--*************************************************************************************************

	function Ob:trackHeightOnLadder(bStop)
		if (bStop == 1) then
			if (self.state_name == 'TrackRazLadderHeight') then
				self:setState(nil)
			end
		else
			self:setState('TrackRazLadderHeight')
		end
	end

--*************************************************************************************************

	function Ob:collectedSnail()
		self.iSnailCount = self.iSnailCount + 1
		self:playSound(self.rSnailCollectionSound, 0, 0, 1)
		self:updateSnailCount(self.iSnailCount)
		if (self.iSnailCount == self.MAX_SNAILS and self.bCollectedAllSnails == 0) then
			--self.cutsceneScript:runCutscene('CollectedAllSnails')
			Global:save('AllSnailsCollected', 1)
			self.snail = SpawnScript('WW.Characters.Snail', 'TempSnail', '')
			self.snail.bCollected = 1
			Global.cutsceneScript:runCutscene('SnailsBecomePiece')
			self.bCollectedAllSnails = 1   
			self:disableSnailCounter()			
			--Done collecting snails, now feed the knight
			if (Global.goalManager:isActive('SnailOrchard') == 1) then
				Global.goalManager:activate('FeedKnight')
			end
		end
	end

--*************************************************************************************************

	function Ob:updateSnailCount(count) 
		local initX = 480
		local initY = 230
		if (not self.rSnailCounterPicHandle) then
			self.bShowingCounter = 1
			-- show the snail pic
			self.rSnailCounterPicHandle = AddSpriteHandle('Textures/LevelTextures/WW_WaterlooWorld/SnailCounter.dds', initX, initY, 1, 1.2, 1.2, nil, nil, 2)
			SpriteFadeOnHUD(self.rSnailCounterPicHandle,0)
			-- show the slash
			self.rSnailCounterSlashHandle = AddSpriteHandle('textures/hud/Number_Slash.tga', initX + 19, initY + 47, 1, 1, 1, nil, nil, 2)			
			SpriteFadeOnHUD(self.rSnailCounterSlashHandle,0)
			-- show the max num
			self.tSnailCounterMaxNumHandles = {}
			self:showNum(self.MAX_SNAILS, initX + 27, initY + 54, self.tSnailCounterMaxNumHandles)
		end
		if (not self.tSnailCounterNumHandles) then
			self.tSnailCounterNumHandles = {}		  
		end
		self:showNum(count, initX, initY + 40, self.tSnailCounterNumHandles)
	end

	function Ob:disableSnailCounter()
		self.bShowingCounter = 0
		if (self.rSnailCounterPicHandle) then
			RemoveSprite(self.rSnailCounterPicHandle)
			self.rSnailCounterPicHandle = nil
		end
		if (self.rSnailCounterSlashHandle) then			        
			RemoveSprite(self.rSnailCounterSlashHandle)
			self.rSnailCounterSlashHandle = nil
		end
		-- clear the sprites out
		for k, v in self.tSnailCounterNumHandles do
			if (self.tSnailCounterNumHandles[k]) then
				RemoveSprite(self.tSnailCounterNumHandles[k])
				self.tSnailCounterNumHandles[k] = nil
			end
		end
		-- clear the sprites out
		for k, v in self.tSnailCounterMaxNumHandles do
			if (self.tSnailCounterMaxNumHandles[k]) then
				RemoveSprite(self.tSnailCounterMaxNumHandles[k])
				self.tSnailCounterMaxNumHandles[k] = nil
			end
		end
	end	   

	function Ob:showNum(num, x, y, tHandles)
		local digit = 0
		-- clear the sprites out
		for k, v in tHandles do
			if (tHandles[k]) then
				RemoveSprite(tHandles[k])
			end
		end
		-- show the tens
		if (num >= 10) then
			digit = floor(num / 10)
			tHandles[1] = AddSpriteHandle('Textures/hud/Number_'..digit..'.tga', x, y, 1, 1, 1, nil, nil, 2)
			SpriteFadeOnHUD(tHandles[1],0)
		end
		-- show the ones
		digit = num - (digit * 10)
		tHandles[2] = AddSpriteHandle('Textures/hud/Number_'..digit..'.tga', x + 12, y, 1, 1, 1, nil, nil, 2)
		SpriteFadeOnHUD(tHandles[2],0)
	end

--*************************************************************************************************

	-- for scaling functionality

	function Ob:scaleTo(sTargetScale, forceX, forceY, forceZ, forceYaw)
		-- do the transitioning craziness
		
		-- turn on the right domain
		if (sTargetScale == 'A') then
			DomainSleep('ScaleADOMAIN',0)
			DomainSleep('LSOScaleADOMAIN',0)
			DomainSleep('ScaleBDOMAIN',1)
			DomainSleep('LSOScaleBDOMAIN',1)
			DomainSleep('ScaleCDOMAIN',1)
			DomainSleep('LSOScaleCDOMAIN',1)
		elseif (sTargetScale == 'B') then
			DomainSleep('ScaleADOMAIN',1)
			DomainSleep('LSOScaleADOMAIN',1)
			DomainSleep('ScaleBDOMAIN',0)
			DomainSleep('LSOScaleBDOMAIN',0)
			DomainSleep('ScaleCDOMAIN',1)
			DomainSleep('LSOScaleCDOMAIN',1)
		else
			DomainSleep('ScaleADOMAIN',1)
			DomainSleep('LSOScaleADOMAIN',1)
			DomainSleep('ScaleBDOMAIN',1)
			DomainSleep('LSOScaleBDOMAIN',1)
			DomainSleep('ScaleCDOMAIN',0)
			DomainSleep('LSOScaleCDOMAIN',0)
		end
		
		-- set the player at the proper position
		local destx, desty, destz
		if (not forceX and not forceY and not forceZ) then
			destx, desty, destz = self:getTargPosition(sTargetScale)
		else
			destx = forceX
			desty = forceY
			destz = forceZ
		end
		if (destx and desty and destz) then
			Global.player:setPosition(destx, desty, destz)
			if (forceYaw) then
				Global.player:setOrientation(0, forceYaw, 0)
			end
			self.sCurrScale = sTargetScale
		end		
		
		-- spawn enemies if we're going to scale C
		self:destroyEnemies()
		if (sTargetScale == 'C') then
			self:spawnCannons()
		end
	end

--*************************************************************************************************

	function Ob:spawnCannons()
		self:spawnEnemiesFromTableLocations(self.cannonPool, self.cannonPoints)
		--self:spawnEnemiesFromTableLocations(self.censorPool, self.censorPoints)
	end
	
--*************************************************************************************************
	
	function Ob:spawnEnemiesFromTableLocations(enemyPool, table)
		local hexController = FindScriptObject('HexController')
		local i
		local maxCannons = getn(table)
		for i = 1, maxCannons do
			local bSkip = 0
			
			-- HACK: locator '4' is a special case... :(
			-- if the salt shaker is still there, then we should not create him - he sits right under it
			if (i == 4 and Global:load('WineGlassMoved') ~= 1) then
				bSkip = 1
			end
			
			-- see if we've already killed this snail
			local savedVarName = 'SnailDead_' .. table[i].Name
			local killed = Global:load(savedVarName)
			if (killed == 1) then
				bSkip = 1
			end
			
            local x, y, z = table[i]:getPosition()
			x, y, z = self:getTargPosition('B', x, y, z, 1)		-- convert these numbers from C scale to B scale
			local hex = hexController:getHexFromPosition(x, y, z)
			if (hex) and (not hex.rOwner) and (bSkip ~= 1) then
				local enemy = enemyPool:get()
				enemy:setPosition(table[i]:getPosition())
				enemy:setOrientation(table[i]:getOrientation())
				enemy.spawnPointName = table[i].Name
				---- HACK - give these censors a leash so that they will 'guard' their snail cannon pals
				--if (enemy.Type == 'global.enemies.CensorBurly') then
				--	enemy.sightRange = 3000
				--	enemy.wakeupRadius = 2000
				--	enemy.chaseRadius = 2500
				--	enemy.forgetRadius = 2800	   
				--	enemy.bUseSelfDestructTimer = 0 			
				--end
			end
		end
	end
	
--*************************************************************************************************

    function Ob:destroyEnemies()
		local callback = function(ent)
			ent.bDieQuietly = 1
			--ent:setState('Die')
			-- some of these snail cannons will be sim culled... we want to kill them too
			ent:die()
		end

		foreach_entity_oftype('Global.Enemies.SnailCannon', callback)
		--foreach_entity_oftype('Global.Enemies.CensorBurly', callback)
	end

--*************************************************************************************************

	function Ob:setSnailDeadSavedVars(value)
		local me = self
		local removeVars = function(point)
			local savedVarName = 'SnailDead_' .. point.Name
			Global:save(savedVarName, %value)
		end

		iterate('CannonLocator', removeVars)
	end

--*************************************************************************************************
	
	function Ob:getTargPosition(sTargetScale, EntOrX, OrigY, OrigZ, bForce)
		local destx, desty, destz
		if (self.sCurrScale == sTargetScale and bForce ~= 1) then
			return nil
		end
		if ((self.sCurrScale == 'A' or sTargetScale == 'A') and bForce ~= 1) then
			if (self.tRespawnPosPerScale[sTargetScale]) then			
				destx = self.tRespawnPosPerScale[sTargetScale].x
				desty = self.tRespawnPosPerScale[sTargetScale].y
				destz = self.tRespawnPosPerScale[sTargetScale].z
			else
				GamePrint('Warning, not setting to the proper scale')
			end
		else
			-- do scale switching
			-- get the origin
			local oldScalex0, oldScaley0, oldScalez0
			local newScalex0, newScaley0, newScalez0
			local scaleFactor = 10
			if (sTargetScale == 'C') then
				oldScalex0, oldScaley0, oldScalez0 = FindScriptObject('ScaleBRefOrigin'):getPosition()
				newScalex0, newScaley0, newScalez0 = FindScriptObject('ScaleCRefOrigin'):getPosition()
			else
				oldScalex0, oldScaley0, oldScalez0 = FindScriptObject('ScaleCRefOrigin'):getPosition()
				newScalex0, newScaley0, newScalez0 = FindScriptObject('ScaleBRefOrigin'):getPosition()
				scaleFactor = 1 / scaleFactor
			end
			if (not EntOrX) then
				EntOrX = Global.player
			end			
			-- get the player position
			local x, y, z
			if (EntOrX and OrigY and OrigZ) then
				x = EntOrX
				y = OrigY
				z = OrigZ
			else
				x, y, z = EntOrX:getPosition()
			end
			-- construct the vector on the current scale
			local vx0 = x - oldScalex0
			local vy0 = y - oldScaley0
			local vz0 = z - oldScalez0
			-- scale appropriately
			destx = vx0 * scaleFactor
			desty = vy0 * scaleFactor
			destz = vz0 * scaleFactor
			-- add the origin back in
			destx = destx + newScalex0
			desty = desty + newScaley0
			destz = destz + newScalez0

			-- cap off the height in going to scale B
			if (sTargetScale == 'B' and bForce ~= 1) then
				if (desty > 1650) then
					desty = 1650
				end
			end
		end
		return destx, desty, destz
	end    							  

--*************************************************************************************************

	function Ob:onEnteredTriggerVolume(data, from)
		if (from and from == Global.player and data == 'tv_Soldier1Introduction' and Global:load('bSoldier1IntroductionPlayed') ~= 1) then	
			self.cutsceneScript:runCutscene('ScaleBIntroShot')
			--Bridge was destroyed, activate Carpenter goal
			Global.goalManager:activate('Carpenter')
			Global.goalManager:activate('Peasant1')
		elseif (from and from == Global.player and data == 'tv_onCarpentersRoof' and Global:load('bSoldier2IntroductionPlayed') ~= 1) then	
			if (Global.goalManager:isActive('ReachRoof') == 1) and (Global:load('bCrackedVault') ~= 1) then
				Global.goalManager:activate('CrackVault')
			end
		elseif (from and from == Global.player and data == 'tv_Orchard' and self.bCollectedAllSnails ~= 1) then
			HideFordCheering(0)
			self:updateSnailCount(self.iSnailCount)
			self.razInOrchard = 1
		elseif (from and from == Global.player and data == 'tv_FirePlace') then
			if (self.firePlaceCollision) then
				SetPhysicsFlag(self.firePlaceCollision, PHYSICS_COLLIDEE, 1)
			end
		elseif (from == Global.player and data == 'tv_strongdoor') then
			self.rStrongDoor = FindScriptObject('strongdoor', 1)
			if self.rStrongDoor  and IsDead(self.rStrongDoor) ~= 1 then
				self.rStrongDoor.firestartResistance = kFS_RESIST_DEFAULT_BURN
				self.rStrongDoor:setEntityInterestLevel(kDOOR_INTEREST)
				SetEntityFlag(self.rStrongDoor, ENTITY_NOSIMULATE, 0)
				self.rStrongDoor.height = 100
				self.rStrongDoor.forceMeshDistribution = 1
				SetMaxViewDistance(self.rStrongDoor, 1000)
			end
		elseif (from == Global.player and data == 'tv_RazTakeStrongHold' and Global:load('bRazTakeStrongholdPlayed') ~= 1 and Global:load('bWWCompleted') ~= 1) then
			UnregisterTriggerVolume(self, 'tv_RazTakeStrongHold')
			Global.cutsceneScript:runCutscene('RazTakeStronghold')
		else
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

--*************************************************************************************************

	function Ob:onExitedTriggerVolume(data, from)
		if (from and from == Global.player and data == 'tv_Orchard') then		
			if self.bShowingCounter == 1 then
				RestoreFordCheering() 
				self:disableSnailCounter()
			end
			self.razInOrchard = nil
		elseif (from and from == Global.player and data == 'tv_FirePlace') then
			if (self.firePlaceCollision) then
				SetPhysicsFlag(self.firePlaceCollision, PHYSICS_COLLIDEE, 0)
			end
		elseif (from == Global.player and data == 'tv_strongdoor') then
			self.rStrongDoor = FindScriptObject('strongdoor', 1)
			if self.rStrongDoor and IsDead(self.rStrongDoor) ~= 1 then
				self.rStrongDoor.firestartResistance = 0
				self.rStrongDoor:setEntityInterestLevel(0)
			end
		else
			%Ob.Parent.onExitedTriggerVolume(self, data, from)
		end
	end

--*************************************************************************************************

	function Ob:onCrossedTriggerPlane(data,from, data2)					
		if (from == Global.player and data2 == 0 and data == 'tv_Board') then
			if (self.cutsceneScript.cutscenePlaying == 0) then	
				local interp = 1
				self.cutsceneScript:runCutscene('ScaleToBJump', 0, interp, 0)			
			end
		end
	end	
	
	function Ob:onGPGFireDissipate( data, from )
		--edit removed condition
		--if (Global:load('GamePieceMilitia3Active') ~= 1 and Global:load('GamePieceMilitia3Killed') ~= 1) then	
		local burned = fso('WWPuzzlePlacer')	
		burned:HaybalePuzzle()
		--end
	end

--*************************************************************************************************

	function Ob:conditionallySkipLine(arg)
		if arg == 'knight' then
			if Global:load('bKnightBecomesPiecePlayed') == 1 then 
				return 1 
			end
		elseif arg == 'peasant' then
			if Global:load('bPeasantOneBecomesSoldierPlayed') == 1 or Global:load('bPeasantOneBecomesSoldierPlayed') == 1 or Global:load('bPeasantOneBecomesSoldierPlayed') == 1 then
				return 1
			end
		elseif arg == 'bridge' then
			if Global:load('Bridge1Fixed') == 1 then
				return 1
			end
		elseif arg == 'carpenter' then
			if Global:load('bCarpenterBecomesPiecePlayed') == 1 then
				return 1
			end
		end
		return 0
	end

--*************************************************************************************************

	function Ob:listenerVault(reelName)
		if (reelName == 'WWVault1') then
			Global:save('bCrackedVault', 1)
			Global.goalManager:deactivate('CrackVault')
		end
	end

--*************************************************************************************************

	function Ob:getHintResponse()

		if ( 1 == self:isRazInSnailPatch() and 1 ~= Global:load('bSnailsBecomePiecePlayed') ) then	
			--((in the snail garden))
			return { { voice = "/GLAG006FO/" }, }--DIALOG=<<I would use telekinesis here.>>
		elseif( 1 ~= self:isCarpenterRecruited() ) then
			--((before the carpenter has been recruited))
			return { { voice = "/GLAQ000FO/" },--DIALOG=<<Well, we\'ll never get our troops over that river while the bridge is out.>>
					{ voice = "/GLAQ001FO/" }, }--DIALOG=<<We need to get a carpenter to fix it!>>
		elseif ( 1 ~= self:isBridgeFixed() ) then	
			--((after the carpenter has been recruited, but before any piece has been moved w/tk))
			return { { voice = "/GLAQ002FO/" }, }--DIALOG=<<If I were there I would use telekinesis to move the game pieces around.>>
		elseif ( 1 ~= self:isPeasant1Recruited() ) then	
			--((after the bridge is fixed, before peasant 1 is recruited))
			return { { voice = "/GLAQ003FO/" },--DIALOG=<<You can\'t win a war without soldiers. >>
				{ voice = "/GLAQ004FO/" }, }--DIALOG=<<Let\'s go see if we can sign up a standing army.>>
		elseif ( 1 ~= self:isMilitiaMan1Positioned() ) then	
			--((after militia man 1 has been recruited but not positioned properly yet))
			return { { voice = "/GLAQ005FO/" }, }--DIALOG=<<Put our militia man next to Napoleon\'s soldier piece so they can fight!>>
		elseif ( 1 == self:razTalkedToPeasant2() and 1 ~= self:isPeasant2Recruited() ) then	
			--((after you talk to peasant 2 but before you recruit him))
			return { { voice = "/GLAQ006FO/" },--DIALOG=<<Ooh, we gotta get that guy some money before he\'ll fight.>>
				{ voice = "/GLAQ007FO/" }, }--DIALOG=<<Heh heh! Let\'s ransack Fred\'s parlor!>>
		elseif ( 1 == self:razTalkedToPeasant3() and 1 ~= self:isPeasant3Recruited() and 1 ~= Global.player:isInInventory('Peasant3Item') ) then	
			--((after you talk to peasant 3 but before you recruit him))
			return { { voice = "/GLAQ008FO/" }, }--DIALOG=<<We gotta go through that building over there and find that guy\'s musket!>>
		elseif ( 1 ~= self:allSoldiersFought() ) then	
			--((before you've fought all the soldiers))
			return { { voice = "/GLAQ002FO/" }, }--DIALOG=<<If I were there I would use telekinesis to move the game pieces around.>>
		elseif ( 1 ~= self:isKnightRecruited() and 1 ~= self:razTalkedToKnight() ) then	
			--((after you've fought all the soldiers, but before you've got the knight))
			return { { voice = "/GLAQ009FO/" }, }--DIALOG=<<Okay, we just gotta get that drawbridge down, and get a hearty knight to storm Napoleon\'s stronghold and we\'ll win.>>
		elseif (1 ~= self:isKnightRecruited() and 1 ~= self:razHasSnails() ) then	
			--((after you talk to hearty knight about hunger, but before you catch the snails))
			return { { voice = "/GLAQ010FO/" },--DIALOG=<<We gotta get some fancy food for that fat guy to eat.>>
					{ voice = "/GLAQ011RA/" },--DIALOG=<<You didn\'t even see him. How do you know he\'s fat?>>
					{ voice = "/GLAQ012FO/" }, }--DIALOG=<<He sounds fat.>>
		elseif ( 1 ~= self:isDrawbridgeDown() ) then	
			--((after the knight is recruited if the draw bridge isn't down))
			return { { voice = "/GLAQ014FO/" }, }--DIALOG=<<We\'re going to have to infiltrate the grounds of the stronghold and see if we can\'t get the drawbridge down for fatty. >>
		else
			return %Ob.Parent.getHintResponse(self)
		end
	end

	function Ob:isRazInSnailPatch()
		return self.razInOrchard
	end

	function Ob:isCarpenterRecruited()
		return Global:load('bCarpenterBecomesPiecePlayed')
	end

	function Ob:isBridgeFixed()
		return Global:load('Bridge1Fixed') == 1
	end

	function Ob:isPeasant1Recruited()
		return Global:load('bPeasantOneBecomesSoldierPlayed')
	end

	function Ob:isMilitiaMan1Positioned()
		return Global:load('GamePieceSoldier1Killed')
	end

	function Ob:razTalkedToPeasant2()
		return Global:load('bHousePeasantTwo1stTimePlayed') or Global:load('bHousePeasantTwoSoldierGonePlayed')
	end

	function Ob:isPeasant2Recruited()
		return Global:load('bPeasantTwoBecomesSoldierPlayed') or Global:load('bPeasantTwoBecomesSoldierQuickPlayed')
	end

	function Ob:razTalkedToPeasant3()
		return Global:load('bHousePeasantThree1stTimePlayed') or Global:load('bHousePeasantThreeSoldierGonePlayed')
	end

	function Ob:isPeasant3Recruited()
		return Global:load('bPeasantThreeBecomesSoldierPlayed')
	end

	function Ob:allSoldiersFought()
		return Global:load('GamePieceSoldier1Killed') == 1 and Global:load('GamePieceSoldier2Killed') == 1 and Global:load('GamePieceSoldier3Killed') == 1
	end

	function Ob:razTalkedToKnight()
		return Global:load('bHouseKnight1stTimePlayed')
	end

	function Ob:razHasSnails()
		return Global:load('AllSnailsCollected') == 1
	end

	function Ob:isKnightRecruited()
		return Global:load('bKnightBecomesPiecePlayed')
	end

	function Ob:isDrawbridgeDown()
		return Global:load('DrawBridgeDown') == 1
	end	

	function Ob:revisitingSetup()
		Global:save('GamePieceCow1Active', 1)
		Global:save('GamePieceCow2Active', 1)
		Global:save('GamePieceCow3Active', 1)
	end
	
	function Ob:hidePeasant3Item()
		--edit removed, done by WWPuzzlePlacer.lua instead

	end
	
	function Ob:showPeasant3Item()
		--edit removed, moved to onGPGFireDissipate 
		--self.puzzles:p3Puzzle()
		--Global.cutsceneScript:runCutscene('FoundRifle')
	end

	function Ob:setDoorThreeUnavail(bOn)
		local door = FindScriptObject('talkingDoor5', 1)
		if door then
			if (bOn == 1) then
				self.bDoorThreeUnavail = 1
				SetBaseTexture(door, 'Textures/LevelTextures/WW_WaterlooWorld/peasant_door_note.dds')
			else
				self.bDoorThreeUnavail = 0
				RestoreBaseTexture(door)
			end
		end
	end
		
	return Ob
end
