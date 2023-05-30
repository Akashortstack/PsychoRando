--
--		'MatadorBoss'
--		Thien Tran
--
--		(c) 2003 Double Fine Productions, Inc.
--		All Rights Reserved.
--		Proprietary and Confidential
--		

function MatadorBoss(Ob)

	if not Ob then
		Ob = CreateObject('Global.Enemies.BossMain')
		
		Ob.dependencies = {
			textures = {
				'textures/leveltextures/bv_blackvelvetopia/bv_healthbar_matador.dds',
			},
		}
		
		Ob.modes = { 
					MODEDODGE = { name = 'Dodge', scriptName = 'BV.Characters.MatadorModeDodge', order = 3 },
					MODEATTACKRAZ = { name = 'AttackRaz', scriptName = 'BV.Characters.MatadorModeAttackRaz', order = 2 } ,
					MODECHARGE = { name = 'Charge', scriptName = 'BV.Characters.MatadorModeCharge', order = 1 },
					
		}
		Ob.meshName = 'Characters/Matador.plb'
		Ob.height = 450
		Ob.maxViewDistance = 1500
		Ob.charName = 'Matador' 
		Ob.animsDir = 'Matador'
		
		Ob.animsTable = {	Idle1 = {fileName = 'Matador_A_breathe', preload = 1, loop = 1, blendTime = 0.2},
							
							IntoBullStart = {fileName = 'MatIntoBull', preload = 1, blendTime = 0.1},       
							IntoBullIdle = {fileName = 'IdleAsBull', preload = 1, blendTime = 0.1, next = 'IntoBullBreathe'},       
							IntoBullBreathe = {fileName = 'BreatheAsBull', preload = 1, blendTime = 0.1, next = 'IntoBullIdle'},       
							Charge = {fileName = 'ChargeAsBull', preload = 1, loop = 1},
							Collide = {fileName = 'RamAsBull', preload = 1, loop = 0, next = 'Dizzy'},
							Dizzy = {fileName = 'DizzyAsBull', preload = 1, loop = 1},

							Speared = {fileName = 'SpearedAsBull', preload = 1, loop = 0 },
							PullSpear = {fileName = 'PullSpearOut', preload = 1, loop = 0 },
							
							SideStep = {fileName = 'SideStep', preload = 1, loop = 0 },
							Walk = {fileName = 'Matador_A_Walk', preload = 1, loop = 1},       
							WalkBack = {fileName = 'Walk_backwards', preload = 1, loop = 1},       
							
							Capein = {fileName = 'CapeIn', preload = 1, loop = 0},
							Capeout = {fileName = 'CapeOut', preload = 1, loop = 0},
							
							Swordin = {fileName = 'SwordIn', preload = 1, loop = 0, speed = 2},
							Swordout = {fileName = 'SwordOut', preload = 1, loop = 0, speed = 2},
							
							Stab = {fileName = 'StabBull', preload = 1, loop = 0, speed = 0.75},
							StabRaz = {fileName = 'matador_B_stab_attack', preload = 1, loop = 0},
							
							Disappear = {fileName = 'CapeTwirl_disappear', preload = 1, loop = 0, speed = 1},
							Appear = {fileName = 'CapeTwirl_appear', preload = 1, loop = 0, next='Idle1', speed = 1},
		}

		Ob.tHurtChatter =
		{
			{line = "/BVAG013MA/", maxPlays = -1, filterCode='a', fullVol=1, group='a'},--DIALOG=<<Ow! >>
			{line = "/BVAG014MA/", maxPlays = -1, filterCode='a', fullVol=1, group='a'},--DIALOG=<<El Odio is hit!>>
			{line = "/BVAG013MA/", maxPlays = -1, filterCode='b', fullVol=1, group='a'},--DIALOG=<<Ow! >>
			{line = "/BVAG015MA/", maxPlays = -1, filterCode='b', fullVol=1, group='a'},--DIALOG=<<El Odio doesn\'t like that!>>
			{line = "/BVAG013MA/", maxPlays = -1, filterCode='c', fullVol=1, group='a'},--DIALOG=<<Ow! >>
			{line = "/BVAG016MA/", maxPlays = -1, filterCode='c', fullVol=1, group='a'},--DIALOG=<<Right in El Odio\'s butt!>>
		}

		Ob.tSpearedIncorrectlyChatter =
		{
			{line = "/BVAG004MA/", maxPlays = 3, group='a', fullVol=1 },--DIALOG=<<Silly boy. I do not think I am a bull. Do you?>>
			{line = "/BVAG005MA/", maxPlays = 3, group='a', fullVol=1},--DIALOG=<<These magic weapons cannot hurt me.>>
		}

		Ob.tConfusedChatter =
		{
			{line = "/BVAG006MA/", maxPlays = -1, group='a', fullVol=1 },--DIALOG=<<Ohhhoo ohhh..>>
			{line = "/BVAG007MA/", maxPlays = -1, group='a', fullVol=1},--DIALOG=<<I... I am the mighty EL ODIO!>>
			{line = "/BVAG008MA/", maxPlays = -1, group='a', fullVol=1},--DIALOG=<<I have all the power OF THE BULL!>>
		}

		Ob.phase = 1
		Ob.spearsLodged = 0
		
		--screen coordinates of bar
		Ob.healthBarX = 300
		Ob.healthBarBorderX = 145
		Ob.healthBorderTexture = 'Textures/LevelTextures/BV_BlackVelvetopia/BV_Healthbar_Matador.tga'
		
		Ob.maxHP = 4
		Ob.hp = 4
		
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Picador.tga'
		Ob.bullRange = 1400
		Ob.bCanUnspear = 1
		Ob.UNSPEAR_DELAY = 20000
		Ob.TIMER_UNSPEARDELAY = '1'
		
		
		Ob.reapperDelay = 3000
		Ob.TIMER_CANREAPPEAR = '2'
		
		Ob.ImmuneToPsiBlast = kPSIBLASTIMMUNE_REFLECT
		Ob.bOverrideMeleeHitSound = 1 
		Ob.bSwordOut = 1
		Ob.bCapeOut = 1
		Ob.TKSnapRange = 300
		Ob.confusionJoint = 'headJA_1'
		Ob.confusionY = 100
		
	end
	
-- ***********************************************************************************************
   
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetMeshIsBackwards(self, 1)
		SetCollideLayer(self, LAYER_BVMA_MATADOR, 1)
		IgnoreCollideLayer(self, LAYER_BVMA_BULL, 1)
		IgnoreCollideLayer(self, LAYER_BVMA_ONGROUND, 1)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
		self.bull = FindScriptObject('Bull')
		self.target = self.bull
		self.clairFollows = self.bull
		SetEntityInterestLevel(self, 0)
		self.sword = SpawnScript('Global.Props.Geometry', 'MatadorSword', 'self.meshName="Characters/CharacterProps/Matador_Sword.plb"')
		SetEntityFlag(self.sword, ENTITY_NOSIMULATE, 0)
		AttachEntityToEntityBone(self.sword, self, 'handEndJRt_1', 0)
		SetPhysicsFlag(self.sword, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.sword, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.sword, PHYSICS_APPLYGRAVITY, 0)
		
		self.cape = SpawnScript('BV.Props.Cape', 'MatadorCape')
		SetEntityFlag(self.cape, ENTITY_NOSIMULATE, 0)
		AttachEntityToEntityBone(self.cape, self, 'handEndJLf_1', 0)
		self.cape:setPosition(0, 0, 0)
		self.cape:setOrientation(55.681, 79.509, -51.934)
		SetPhysicsFlag(self.cape, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.cape, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.cape, PHYSICS_APPLYGRAVITY, 0)
		
		self.capeSpiral1 = SpawnScript('Global.Props.Geometry', 'CapeSpiral1', 'self.meshName="GlobalModels/FX_Models/BV_matador/MatadorTeleportPoofFX.plb"') 
		SetEntityFlag(self.capeSpiral1, ENTITY_NOSIMULATE, 0)
		AttachEntityToEntity(self.capeSpiral1, self, 0)
		SetPhysicsFlag(self.capeSpiral1, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.capeSpiral1, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.capeSpiral1, PHYSICS_APPLYGRAVITY, 0)
		self.capeSpiral1:hide()
		
		self.capeSpiral2 = SpawnScript('Global.Props.Geometry', 'CapeSpiral2', 'self.meshName="GlobalModels/FX_Models/BV_matador/MatadorTeleportPoofFX.plb"') 
		SetEntityFlag(self.capeSpiral2, ENTITY_NOSIMULATE, 0)
		AttachEntityToEntity(self.capeSpiral2, self.capeSpiral1, 0)
		self.capeSpiral2:setOrientation(0,180,0)
		SetPhysicsFlag(self.capeSpiral2, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.capeSpiral2, PHYSICS_COLLIDER, 0)
		SetPhysicsFlag(self.capeSpiral2, PHYSICS_APPLYGRAVITY, 0)
		self.capeSpiral2:hide()
		
		self.teleportFX = SpawnScript('BV.Effects.MatadorTeleportPoofFX', 'CapeTeleportFX')
		self.teleportFX:attach(self)
		
		self.disappearSound = LoadSound('Psi_invisable')
		self.gruntSound = LoadSound('MatadorGrunt')
		self.attackSound = LoadSound('FoilSwish')
		self.spearedSound = LoadSound('BullDamaged')
				
		self.spearPoints = {  {name = 'spineJA_1', spear = nil, pos = {0,0,150}, ori={0,180,0}  },
							{name = 'spineJB_1', spear = nil, pos = {0,0,0}, ori={0,180,0}  },
							{name = 'shoulderJALf_1', spear = nil, pos = {0,0,0}, ori={0,180,0}  },
							{name = 'shoulderJARt_1', spear = nil, pos = {0,0,0}, ori={0,180,0}  },
		}

		self.hurtCRH = SpawnScript('Global.Util.CharResponseHandler')
		self.hurtCRH.owner = self
		self.hurtCRH.type = self.CRH_ALWAYS_SEQUENTIAL
		self.hurtCRH.bLinePriority = 1
		self.hurtCRH:addDialog(self.tHurtChatter)

		self.spearedIncorrectlyCRH= SpawnScript('Global.Util.CharResponseHandler')
		self.spearedIncorrectlyCRH.owner = self
		self.spearedIncorrectlyCRH.type = self.CRH_ALWAYS_SEQUENTIAL
		self.spearedIncorrectlyCRH.bLinePriority = 1
		self.spearedIncorrectlyCRH:addDialog(self.tSpearedIncorrectlyChatter)
	
		self.confusionCRH= SpawnScript('Global.Util.CharResponseHandler')
		self.confusionCRH.owner = self
		self.confusionCRH.type = self.CRH_ALWAYS_SEQUENTIAL
		self.confusionCRH.bLinePriority = 1
		self.confusionCRH:addDialog(self.tConfusedChatter)

		self:setPhase(1)
	end
	
-- ***********************************************************************************************
	
	function Ob:onEnteredTriggerVolume(data,from)
		if (from == self.bull and data == self.bullSphere) then
			--GamePrint('BULL ENTERED MATADOR RANGE')
			self.bBullInRange = 1
		elseif (self.phase == 2 
					and self.bDisappeared ~= 1
					and from.Type == 'bv.props.Spear' 
					and data == self.spearSphere and from.bThrown == 1 
					and self.currentMode ~= self.modes.MODECHARGE) then
			GamePrint('Matador speared trig sphere, disappearing')
			local x,y,z = Global.player:getPosition()
			RotateTowards2D(self, x,y,z, 500)
			if self.spearedIncorrectlyCRH.chattering ~= 1 then 
				self.hurtCRH:chatterStop()
				self.confusionCRH:chatterStop()
				self.spearedIncorrectlyCRH:chatterStart(1) 
				--GamePrint('starting chatter')
				--StackTrace()
			end
			self:disappear()
		end
	end

-- ***********************************************************************************************
	
	function Ob:onExitedTriggerVolume(data,from)
		if (from == self.bull and data == self.bullSphere) then
			--GamePrint('BULL EXITED MATADOR RANGE')
			self.bBullInRange = 0
		end
	end
	
-- ***********************************************************************************************

	function Ob:beginStateFaceBull()
		--GamePrint('BEGIN STATE FACE BULL')
		self:setAnim(self.animsTable.Idle1)
		--self.cape:loadAnim('Anims/Matador/Props/Cape_A_breathe.jan',0.1,0)
	end
	
	function Ob:stateFaceBull()
		local x,y,z = self.bull:getPosition()
		RotateTowards2D(self, x,y,z, 500, 1)		
		
	end


	function Ob:stateFaceRaz()
		local x,y,z = Global.player:getPosition()
		RotateTowards2D(self, x,y,z, 500, 1)		
	end

-- ***********************************************************************************************
	
	function Ob:onConfusion(data,from)
		if (self.phase == 2 and self.bConfused ~= 1) then
			Global.levelScript.bMatadorConfusedOnce = 1
			%Ob.Parent.onConfusion(self)
			--GamePrint('CONFUSED')
			self.bConfused = 1
			SetEntityCollideSphere(self.bull, 0, 0,0,0, 1)
			if (self.modeDodge.state_name ~= 'PullSpear') then
				self:startConfusion()
			end
			--dont let this confusion grenade also confuse the bull
			if (from) then
				from:killSelf()
			end
			self:killTimer(self.TIMER_CONFUSION)
		end
	end

-- ***********************************************************************************************

	function Ob:startConfusion()
		self.bull:matadorDisappeared()
		
		IgnoreCollideLayer(self.bull, LAYER_BVMA_MATADOR, 0)
		IgnoreCollideLayer(self, LAYER_BVMA_BULL, 0)
		--drop spear in hand
		if (self.spearInHand) then
			DetachEntityFromParent(self.spearInHand)
			SetPhysicsFlag(self.spearInHand, PHYSICS_APPLYGRAVITY, 1)
			self.spearInHand:setScale(2,2,2)
			GamePrint("MATADOR CONFUSION DROPPING SPEAR " .. self.spearInHand.Name)
			self.spearInHand.Telekinesis = kTKBEHAVIOR_CUSTOM_THROW
			self.spearInHand = nil
		end
		
		if self.bMatadorConfusedPlayed ~= 1 then
			self:endAllModes()
			--self.bull:endAllModes()
			--self.bull:setAnim(self.bull.animsTable.Hoof)
			self:setAnim(self.animsTable.Dizzy)
			Global.cutsceneScript:runCutscene('MatadorConfused')
			self.bMatadorConfusedPlayed = 1
		else
			--[[
			if self.confusionCRH.chattering ~= 1 then 
				self.hurtCRH:chatterStop()
				self.spearedIncorrectlyCRH:chatterStop()
				self.confusionCRH:chatterStart(1) 
			end
			]]--
			self:decide()  --this will decide on MODECHARGE
		end
	end

-- ***********************************************************************************************
	--[[
	function Ob:onNewMoveCollide(nx,from,ny,nz)
		GamePrint('On NEW MOVE Collide')
	end
	
	function Ob:onTKCollide(nx,from,ny,nz)
		GamePrint('On TK  Collide')
	end
	]]--
	
	function Ob:onCollide(nx,from,ny,nz)
		--GamePrint('On Collide')
		if (Global.cutsceneScript.cutscenePlaying ~= 1) then
			
			if (self.phase == 2 and self.modeCharge.bCharging == 1) then
				--GamePrint('MATADOR COLLIDE WHILE CHARGING')
				local fx,fy,fz = GetEntityForwardVector(self)
				local dp = DotProduct(nx,ny,nz, fx,fy,fz)
				if (from == Global and dp < -0.5 and self.modeCharge.bHitWall ~= 1) then      -- hit the wall
					--GamePrint('HIT WALL')
					self.modeCharge:collided()
				elseif (from == self.bull) then
					--GamePrint('Matador HIT BULL')
					self.bull:hitMatador()
					self.modeCharge:collided()
				end
			end
		end
	end

-- ***********************************************************************************************
	
	function Ob:setPhase(phase)
		phase = tonumber(phase) -- hacky; function is called from cutscene script with string arg
		if (phase == 1) then
			self.phase = 1
			self:setAnim('Idle1')
			self.cape:setAnim('idle1')
			self:endAllModes()
		elseif (phase == 2) then
			SetEntityInterestLevel(self, kBOSS_INTEREST)
			self.bullSphere = TriggerSphere_New(0,0,0, self.bullRange, self)
			Trigger_RegisterListener(self.bullSphere, self)
			self.spearSphere = TriggerSphere_New(0,100,0, 500, self)
			Trigger_RegisterListener(self.spearSphere, self)
			self:setHealthBar(1)		
			self.phase = 2
			self:appear()
		end
	end

-- ***********************************************************************************************
	
	function Ob:speared(spear)
		self:endAllModes()
		self:playSound(self.spearedSound,0,0,1)
		self:playAnimCallback(self.animsTable.Speared, self.spearedCallback)
		self.cape:loadAnim('Anims/Matador/Props/Cape_SpearedAsBull.jan',0.1,0)
		self.hp = max(self.hp-1, 0)
		if (spear) then
			self.spearsLodged = self.spearsLodged + 1
		end

		GamePrint('SPEARED MATADOR  ' .. self.hp)
		self:setHealthBar(self.hp/self.maxHP)
		--self:endAllModes()
		if (self.hp == 0 and self.phase == 2 and self.bNoDie ~= 1) then
			self.bull:endAllModes()
			self:endAllModes()
			
			self:setState('Dying')
			self.bUninterruptibleState = 1
		elseif self.phase == 2 then
			local filter = 'a'
			if self.hp == 1 then
				filter = 'c'
			elseif self.hp == 2 then
				filter = 'b'
			end
			self.confusionCRH:chatterStop()
			self.spearedIncorrectlyCRH:chatterStop()
			self.hurtCRH:setFilter(filter)
			self.hurtCRH:chatterStart(1)
		end
		self.bCanUnspear = 0
		self.bConfused = 0
		SetEntityCollideSphere(self.bull, 200, 0,250, 300, 1)				
		self:createTimer(self.UNSPEAR_DELAY, self.TIMER_UNSPEARDELAY)
	end

	function Ob:stateDying()
		self:sayLine("/BVAG013MA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<Ow! >>
		self:sayLine("/BVAG017MA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<El Odio... Is.... DYING.>>
		self:playVideo('cutscenes/prerendered/bvvi.bik',1)
		Global.cutsceneScript:fadeToBlack(0)
		Global:setLevelToCompleted('BV')
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('ASCO',0,1)
	end

-- ***********************************************************************************************

	function Ob:spearedCallback()
		self:disappear()
	end

-- ***********************************************************************************************
 	
	function Ob:unspeared()
		self.spearsLodged = self.spearsLodged - 1
		
		--dont heal for now
		--[[
		self.hp = min(self.hp+1, self.maxHP)
		self:setHealthBar(self.hp/self.maxHP)
		]]--
	end

--***********************************************************************************************
	
	function Ob:onTimer(data,from)
		if (data == self.TIMER_UNSPEARDELAY) then
			self:killTimer(data)
			self.bCanUnspear = 1
		elseif (data == self.TIMER_CANREAPPEAR) then
			self:killTimer(data)
			self.bCanReappear = 1
		else
			%Ob.Parent.onTimer(self,data,from)
		end
	end
	
-- ***********************************************************************************************
	
	function Ob:maybeReappear()
		if (self.phase == 2 and self.bCanReappear == 1 and self.bDisappeared == 1) then 
			self:appear()
		end
	end
	
-- ***********************************************************************************************
	Ob.disappearTime = 1
	
	function Ob:appear()
		GamePrint("APPEAR")
		self.bDisappeared = 0
		self:setState(nil)
		
		local randNum = RandInt(1,2)
		--here is where the decision to attack raz or the bull happens
		if (randNum == 1 and not self.spearInHand) then
			--find a position near raz
			self.modeAttackRaz:placeNearRaz()
			self.modeAttackRaz.bAttackRaz = 1
			self.bSwordOut = 1
			local x,y,z = Global.player:getPosition()
			RotateTowards2D(self, x,y,z, 20000)
			
			--hacky, if matador is too close to bull, just pick a random spot elsewhere
			if (self:distance(self.bull) < 500) then
				randNum = 2
			end
		end
		
		--pick random position, esp if we picked pos near raz but materialize inside bull
		if (randNum > 1) then
			--make sure to not materialize inside bull
			local rx,ry,rz 
			local bx,by,bz = self.bull:getPosition()
			repeat
				GamePrint('Finding a random position far away enough from bull')
				--find a random position far from bull
				self.modeAttackRaz.bAttackRaz = 0
				rx,ry,rz = RandInt(-1200,1200),0,RandInt(-1200,1200)
			until (GetDistance(rx,ry,rz, bx,by,bz) > 1200)
			
			self:setPosition(rx,ry,rz)
			local x,y,z = self.target:getPosition()
			RotateTowards2D(self, x,y,z, 20000)			
		end
		Global.camControl:yawHintTo(self)
		self.teleportFX:run()
		self.cape:appear()
		self:setState('Appear')
    end
	
	function Ob:stateAppear()
		self:setAnim(self.animsTable.Appear)
	
		self:playSound(self.disappearSound, 0,0,1)
		self:playSound(self.gruntSound, 0,0,1)
		
		SetEntityVisible(self, 1)
		SetEntityAlpha(self, 0, 0)
		SetEntityAlpha(self, 1, self.disappearTime)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		
		SetEntityVisible(self.cape, 1)
		SetEntityAlpha(self.cape, 0, 0)
		SetEntityAlpha(self.cape, 1, self.disappearTime)

		if (self.bSwordOut == 1) then
			SetEntityVisible(self.sword, 1)
			SetEntityAlpha(self.sword, 0, 0)
			SetEntityAlpha(self.sword, 1, self.disappearTime)
		end
		
		for i=1,4 do
			if (self.spearPoints[i].spear) then
				GamePrint('Reappearing spear at spearPoint ' .. i .. '  ' .. self.spearPoints[i].spear.Name )
				SetEntityVisible(self.spearPoints[i].spear, 1)
				SetEntityAlpha(self.spearPoints[i].spear, 0, 0)
				SetEntityAlpha(self.spearPoints[i].spear, 1, self.disappearTime)
				SetPhysicsFlag(self.spearPoints[i].spear, PHYSICS_COLLIDEE, 1)
			end
		end
		
		if (self.spearInHand) then
			GamePrint('Reappearing spear in hand ' .. self.spearInHand.Name )
			SetEntityVisible(self.spearInHand, 1)
			SetEntityAlpha(self.spearInHand, 0, 0)
			SetEntityAlpha(self.spearInHand, 1, self.disappearTime)
			SetPhysicsFlag(self.spearInHand, PHYSICS_COLLIDEE, 1)
		end
		
		self:sleep(self.disappearTime)
		self:setAnim(self.animsTable.Idle1)
		--self.cape:loadAnim('Anims/Matador/Props/Cape_A_breathe.jan',0.1,0)
		--GamePrint("End of state APPEAR, decide()")
		self:decide()
	end
	
-- ***********************************************************************************************
	
	function Ob:disappear()
		GamePrint("DISAPPEAR")
		self:onConfusionDone()
		self.bConfused = 0
		SetEntityCollideSphere(self.bull, 200, 0,250, 300, 1)						
		if Global.player.bClairOn == 1 then
			Global.player:cancelClairvoyance()
		end

		self.confusionCRH:chatterStop()
		self.hurtCRH:chatterStop()
		self.spearedIncorrectlyCRH:chatterStop()
		
		self.bDisappeared = 1
		self.bCanReappear = 0
		self:setAnim(self.animsTable.Idle1)	
		--self.cape:loadAnim('Anims/Matador/Props/Cape_A_breathe.jan',0.1,0)
		
		self:createTimer(self.reapperDelay, self.TIMER_CANREAPPEAR)

		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		
		for i=1,4 do
			if (self.spearPoints[i].spear) then
				GamePrint('Disappearing spear at spearPoint ' .. i .. '  ' .. self.spearPoints[i].spear.Name )
				SetPhysicsFlag(self.spearPoints[i].spear, PHYSICS_COLLIDEE, 0)
			end
		end
		
		if (self.spearInHand) then
			GamePrint('Disappearing spear in hand ' .. self.spearInHand.Name )
			SetPhysicsFlag(self.spearInHand, PHYSICS_COLLIDEE, 0)
		end
		
		self:endAllModes()
		self.teleportFX:run()
		self.cape:disappear()
		self:setState('Disappear')
    end
	
	function Ob:stateDisappear()
		self:setAnim(self.animsTable.Disappear)
		
		self:playSound(self.disappearSound, 0,0,1)
		self:playSound(self.gruntSound, 0,0,1)
		self.bull:matadorDisappeared()
		
		SetEntityAlpha(self.cape, 1, 0)
		SetEntityAlpha(self.cape, 0, self.disappearTime)
		if (self.bSwordOut == 1) then
			SetEntityAlpha(self.sword, 1, 0)
			SetEntityAlpha(self.sword, 0, self.disappearTime)
		end
		for i=1,4 do
			if (self.spearPoints[i].spear) then
				SetEntityAlpha(self.spearPoints[i].spear, 1, 0)
				SetEntityAlpha(self.spearPoints[i].spear, 0, self.disappearTime)
			end
		end
		if (self.spearInHand) then
			SetEntityAlpha(self.spearInHand, 1, 0)
			SetEntityAlpha(self.spearInHand, 0, self.disappearTime)
		end
		
		self:sleep(self.disappearTime*0.75)
		
		SetEntityAlpha(self, 1, 0)
		SetEntityAlpha(self, 0, 0.5)
		
		self:sleep(self.disappearTime*0.25)

		if (self.bSwordOut == 1) then
			SetEntityVisible(self.sword, 0)
		end
		for i=1,4 do
			if (self.spearPoints[i].spear) then
				SetEntityVisible(self.spearPoints[i].spear, 0)
			end
		end
		if (self.spearInHand) then
			SetEntityVisible(self.spearInHand, 0)
		end
		SetEntityVisible(self, 0)
		SetEntityVisible(self.cape, 0)

		--GamePrint("End of state DISAPPEAR")
		self:setState(nil)
	end
	
-- ***********************************************************************************************
	
	function Ob:onNewMoveMelee()
		local x,y,z = Global.player:getPosition()
		RotateTowards2D(self, x,y,z, 500)
		self:disappear()
	end
	
	function Ob:onPsiBlast()
		self:onNewMoveMelee()
	end
	
-- ***********************************************************************************************
	
	
	function Ob:resetPhase()
		if (self.phase == 2) then
			self.spearsLodged = 0
			self.hp = self.maxHP
			self:setHealthBar(self.hp/self.maxHP)
			--take out all spears and put back in bull
			for i=1,4 do 
				self.spearPoints[i].spear = nil
				FindScriptObject('Spear'..i):resetToBull()
			end
			self.bConfused = 0		
			self:onConfusionDone()
			Global.cutsceneScript:placeChar(self, 3.7, -1.2, 262.4, 0.0, -94.2, 0.0)
		end
	end
	
-- ***********************************************************************************************
	

	return Ob
end
