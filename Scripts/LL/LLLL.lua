
function LLLL(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			textures = {
				'textures/fxtextures/llll_debris.dds',
			},
			animations = {
				'Anims/CA_ArrowheadMover/spin.jan',
				'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Lungfish_suckedin.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SuckerFished_Struggle.jan',
				'Anims/DartNew/TurnStartled.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Objects/InventoryToss.jan',
				'GlobalModels/FX_Models/splash/splash.jan',
				'GlobalModels/FX_Models/splash/splashIdle.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/dartnew/netUp.jan',
				'anims/dartnew/CrawlOutOfWater.jan',
				'anims/dartnew/WaterHandsGrab.jan',
				'anims/llll_fern1/llll_fernshake.jan',
			}
		}
				
		Ob.levelType = 'real'
       	Ob.theme = 'LungfishLair'
		Ob.bBellRang = 0
		Ob.leftFootprintTexture = 'Textures/LevelTextures/LL_LungfishLair/LLLL_footprint_left.tga'
		Ob.rightFootprintTexture = 'Textures/LevelTextures/LL_LungfishLair/LLLL_footprint_right.tga'
		Ob.STARTBATTLETIMER = '1'
		Ob.updateTime = 2
		Ob.TIMER_UPDATE = '2'

		Ob.bProcessFootfalls = 1
		Ob.bBossBattle = 0

	end
	
	function Ob:onBeginLevel()
		-- Debug hacks
		--Player must have gotten at least this far
		--edit remove set level to complete
		--Global:setLevelToCompleted('NI')
		if Global.player:isInInventory('Brainer') ~= 1 then
			Global.player:addToInventory(SpawnScript('Global.Props.Brainer', 'Brainer', '', 1), 0, 1)
		end
		
		%Ob.Parent.onBeginLevel(self)
		self.forwardTriggerSurfaceMessages = self
		--if we've finished LO, then this is a revisit of LL
		if (Global:load('LungfishDazed') == 1) then
			--if we've beaten the lungfish but not beaten LO, then spawn in the third phase, with Lungfish dazed still
			Global:setPlayerRespawnPointName('RazStartLungfishDazed')
			DomainSleep('A_Arena1DOMAIN', 1)
			DomainSleep('A_Arena1LSOsDOMAIN', 1)			
			DomainSleep('B_Part2path0DOMAIN', 1)
			DomainSleep('B_Part2path0LSOsDOMAIN', 1)
			DomainSleep('C_Part2path1DOMAIN', 1)
			DomainSleep('C_Part2path1LSOsDOMAIN', 1)
			DomainSleep('D_Part2path3DOMAIN', 1)
			DomainSleep('E_Arena2DOMAIN', 0)
			DomainSleep('E_Arena2LSOsDOMAIN', 0)	
			FindScriptObject('railslideVISUAL'):makeInvisible()
			SetPhysicsFlag(FindScriptObject('railslideCOLLISION'), PHYSICS_COLLIDEE, 0)			
		else	
			--fresh start of LL
			Global:setPlayerRespawnPointName('RAZSTART')
			DomainSleep('C_Part2path1DOMAIN', 1)
			DomainSleep('C_Part2path1LSOsDOMAIN', 1)
			DomainSleep('D_Part2path3DOMAIN', 1)
			DomainSleep('E_Arena2DOMAIN', 1)
			DomainSleep('E_Arena2LSOsDOMAIN', 1)
			DomainSleep('part1PathDOMAIN', 1)
			DomainSleep('part2PathDOMAIN', 1)
			DomainSleep('respawnPointsDOMAIN', 1)
			
			RegisterTriggerVolume(self, 'tv_RingBell')
			RegisterTriggerVolume(self, 'tv_Part2Path20Cut')
			FindScriptObject('railslideVISUAL'):makeInvisible()
			SetPhysicsFlag(FindScriptObject('railslideCOLLISION'), PHYSICS_COLLIDEE, 0)			
		end
		
		if (Global:loadGlobal('bCabinned') == 1) then
			-- LevelScript.lua will handle this case
			self.bSkipVideo = 1
		end
		
		--hack, set absolutely, cuz testing screws it up		
   		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 6000)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, 10000)
		self.frictionConst = GetPhysicsConstant(PHYSICS_FRICTION)
		self.walkAccelConst = GetPhysicsConstant(PHYSICS_GroundWalkAccel)
		Global.player:addSpamListener('RazRespawn', self)
		SetEntityFlag(FindScriptObject('bathoSphere'), ENTITY_CANNOTBESTOODON, 1)
	end

--********************************************************************************

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.lungfish = FindScriptObject('Lungfish')
		
		if (Global:load('LungfishDazed') ~= 1) then
			--  S U C K I N G   F X
			-- put the emitter in the center of the bubble	
			self.suckParticle = CreateParticleEmitter('suck',100)
			PESetDistribution(self.suckParticle,kPD_CYLINDER,kPDV_NONE,0,0,0,1500.0,1500.0,100.0)
			PESetTexture(self.suckParticle,'textures/fxtextures/llll_debris.dds')
			PESetTexAnimInfo(self.suckParticle,8,-1,0,0.000)
			PESetParticleBlendMode(self.suckParticle,kBLENDMODE_ALPHA_BLEND)
			PESetParticleForce(self.suckParticle,0.0,50.0,0.0)
			PESetApplyGravity(self.suckParticle,0)
			PESetNoSpread(self.suckParticle,1)
			PESetParticleSpeed(self.suckParticle,0.0,0.0)
			PESetParticleSize(self.suckParticle,10.0,40.0)
			PESetParticleRotation(self.suckParticle,-180.000,180.000)
			PESetParticleLifetime(self.suckParticle,1.5,2.0)
			PESetParticlesPerSec(self.suckParticle,40.0,50.0)
			PESetStartColor(self.suckParticle,192,192,192,0)
			PESetEndColor(self.suckParticle,192,192,192,192)
			AttachEntityToEntity(self.suckParticle, self.lungfish.bubble)
			SetPosition(self.suckParticle, 0,0,0)
			PESetActive(self.suckParticle, 0)
			
			-- stick the affector on the lungfish
			self.suckAffector = CreateCylindricalParticleAffector('self.suckAffector',600.000,6000.000,0.500,0.000,0.000)
			PASetTurbulence(self.suckAffector,0.0,100.0,0.0)
			PASetFlag(self.suckAffector, kPARTICLEAFFECTOR_FALLOFF, 1)
			SetPrimaryAffector(self.suckParticle,self.suckAffector)
			AttachEntityToEntity(self.suckAffector, self.lungfish)
			SetPosition(self.suckAffector, 0,-300,0)
			
			--  B L O W I N G  FX
			-- stick the emitter to the lungfish mouth area		
			-- orient pitch 90, and align yaw with the direction of Linda
			self.blowParticle = CreateParticleEmitter('blow',150)
			PESetTexture(self.blowParticle,'textures/fxtextures/llll_debris.dds')
			PESetTexAnimInfo(self.blowParticle,8,-1,0,0.000)
			PESetParticleBlendMode(self.blowParticle,kBLENDMODE_ALPHA_BLEND)
			PESetParticleForce(self.blowParticle,0.000000,0.000000,900.000000)
			PESetNoSpread(self.blowParticle,1)
			PESetCollideWithGround(self.blowParticle,1)
			PESetConeAngle(self.blowParticle,0.000000,60.000000)
			PESetParticleSpeed(self.blowParticle,2000.000000,3500.000000)
			PESetParticleSize(self.blowParticle,15.000000,40.000000)
			PESetParticleRotation(self.blowParticle,-720.000,720.000)
			PESetParticleLifetime(self.blowParticle,1.000000,1.500000)
			PESetParticlesPerSec(self.blowParticle,100.000000,100.000000)
			PESetStartColor(self.blowParticle,192,192,192,192)
			PESetEndColor(self.blowParticle,192,192,192,0)
			AttachEntityToEntity(self.blowParticle, self.lungfish)
			SetPosition(self.blowParticle,100,400,0)
			SetOrientation(self.blowParticle, 90,0,0)
			PESetActive(self.blowParticle,0)
			
			-- put the affector in the center of the bubble
			self.blowAffector = CreateCylindricalParticleAffector('self.blowAffector',1500.000,3000.000,470.000,0.000,0.000)
			PASetTurbulence(self.blowAffector,0.0,-300.0,0.0)
			PASetFlag(self.blowAffector, kPARTICLEAFFECTOR_FALLOFF, 1)
			PASetFlag(self.blowAffector, kPARTICLEAFFECTOR_DRAG, 1)
			SetPrimaryAffector(self.blowParticle,self.blowAffector)
			AttachEntityToEntity(self.blowAffector, self.lungfish.bubble)
			SetPosition(self.blowAffector, 0,0,0)

			if self.bSkipVideo ~= 1 then
				self:playVideo('cutscenes/prerendered/llbt.xmv')
			end
		end
		
		self.ambSounds = LoadSound('LLAmb')
		self.mutedSounds = LoadSound('MutedInsideWater')
		
		PlaySound(nil, self.ambSounds , 1)
		self:setLevelTheme('LungfishLair')
		SetDistanceFogEnable(1)
		SetDistanceFogColor(0,0.1,0.1)
		if (Global:load('LungfishDazed') ~= 1) then
			SetDistanceFogRange(8000, 15000)
			SetDetailCullingRange(0.6, 0.4)										
		else
			SetDistanceFogRange(6000, 8000)
			SetDetailCullingRange(0.7, 0.5)	
			self.lungfish.bInside = 1		--if dazed, then inside												
		end
	end	

	--We don't really need this because OBL handles this in a custom way, but it keeps levelscript from
	--complaining.
	function Ob:getKickoutLocation(lastLevelPrefix)
		return FindScriptObject('RazStartLungfishDazed')
	end
	
--********************************************************************************

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		--GamePrint("LLLL onEndLevel()")
   		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, self.walkAccelConst)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, self.frictionConst)		
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)
	end

--********************************************************************************
	
	function Ob:onEnteredTriggerVolume(data,from)
		if (from == Global.player and data == 'tv_RingBell' and self.bBellRang == 0) then
			self.bBellRang = 1
			self:createTimerSecs(0.5, self.STARTBATTLETIMER)
		end										
	end

--********************************************************************************

	function Ob:onCrossedTriggerPlane(data,from)
		--this cutscene can be triggered here or in onSPlinePointArrive of LungfishBubble, whichever happens first
		if (from == Global.player and data == 'tv_Part2Path20Cut' and Global:load('Part2Path20CutSeen') ~= 1) then
			--GamePrint('Raz crossed trigger plane, running cutscene')
			Global:save('Part2Path20CutSeen', 1)
            Global.levelScript.cutsceneScript:runCutscene('Part2Path20Cut', nil,nil, 0)
		end
	end
--********************************************************************************
	
	function Ob:onTimer(data,from)
		if (data == self.STARTBATTLETIMER) then
			self:killTimer(self.STARTBATTLETIMER)
			FindScriptObject('Lungfish'):setState('StartBattle')
		else			
			%Ob.Parent.onTimer(self, data)
		end
	end
						
--********************************************************************************

	--this is called when raz dies and respawns
 	function Ob:listenerRazRespawn(value, from)
		---GamePrint("LISTENER RAZ RESPAWN")
	
		self:setState('Respawn')
	end 

	function Ob:stateRespawn()
		self.bUninterruptibleState = 1
		self.lungfish.bPaused = 1
		local oldWalkConst = GetPhysicsConstant(PHYSICS_GroundWalkAccel)
		local oldFrictionConst = GetPhysicsConstant(PHYSICS_FRICTION)
		
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, self.walkAccelConst)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, self.frictionConst)
		SetVelocity(Global.player, 0,0,0)
		
		if (self.lungfish.bInside == 1 and Global:load('LungfishDazed') ~= 1) then
			self.lungfish:endAllModes()
			self.lungfish:setAnim(self.lungfish.animsTable.Idle)
		end

		--wait till screen fades to black
		while (Global.player.respawnMilestone < Global.player.RESPAWN_FADEDTOBLACK) do Yield() end

		--detach from spline
		if (self.lungfish.phase == 2) then
			DetachFromSpline(self.lungfish.bubble)
			DestroyPath(self.lungfish.bubble.hPath)
			self.lungfish.bubble.bMoving = 0
			SetVelocity(self.lungfish.bubble, 0,0,0)
			if (self.lungfish.strafe.state_name == 'MoveWithBubble') then
			 	self.lungfish.strafe:setState(nil)
			end
			
			self.lungfish:setLungfishPOV(0)
			SetDistanceFogRange(4000, 7000)
			SetDetailCullingRange(0.7, 0.5)							
            StopSound(self.lungfish.moveSound)
		end
        
		if (self.lungfish.bInside ~= 1) then
			self.lungfish.strafe:moveTo(0,0)
		else
			if (self.lungfish.modeLureJab.clam) then
				self.lungfish.modeLureJab.clam.bCaughtLungfish = 0
				self.lungfish.modeLureJab.bCaughtClam = nil
				self.lungfish.modeLureJab.clam = nil 
				self.lungfish.ImmuneToMelee = kMELEEIMMUNE_STANDARD
				self.lungfish:stopSound(self.lungfish.modeLureJab.stuckSound)
				self.lungfish.modeLureJab:killTimer(self.lungfish.modeLureJab.TIMER_STUCK)
			end		
		end
		Yield()
		
		if (self.lungfish.part == 1) then
			self.lungfish:setPhase(1, 1, 1)
			self.lungfish:setHealthLevel(1.0)

			DomainSleep('A_Arena1DOMAIN', 0)
			DomainSleep('A_Arena1LSOsDOMAIN', 0)
			DomainSleep('B_Part2path0DOMAIN', 0)
			DomainSleep('B_Part2path0LSOsDOMAIN', 0)			                         
			DomainSleep('C_Part2path1DOMAIN', 1)
			DomainSleep('C_Part2path1LSOsDOMAIN', 1)
			DomainSleep('D_Part2path3DOMAIN', 1)
			DomainSleep('E_Arena2DOMAIN', 1)
			DomainSleep('E_Arena2LSOsDOMAIN', 1)
		elseif (self.lungfish.part == 2) then
			self.lungfish:setPhase(2, 1, 1)
			self.lungfish:setHealthLevel(self.lungfish.part1HealthThresh)
		elseif (self.lungfish.part == 3 and Global:load('LungfishDazed') ~= 1) then 
			self.lungfish:setHealthLevel(self.lungfish.part2HealthThresh) 
		end
		Global.cutsceneScript.respawnYaw = 'Lungfish'
		
		--wait till raz is positioned in respawn point										 
		while (Global.player.respawnMilestone < Global.player.RESPAWN_PLAYERPOSITIONED) do Yield() end
		if (self.lungfish.bInside == 1 and Global:load('LungfishDazed') ~= 1) then
			local razX,razY,razZ = Global.player:getPosition()
			RotateTowards2D(self.lungfish, razX,razY,razZ, 20000)
		end
				
		--wait till raz's respawn state is done
		while (Global.player.respawnMilestone < Global.player.RESPAWN_DONE) do Yield() end
		
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, oldWalkConst)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, oldFrictionConst)
		if (self.lungfish.bInside == 1 and Global:load('LungfishDazed') ~= 1) then
			self.lungfish:createTimerSecs(1, self.lungfish.DECIDEAGAINTIMER)
		end

		self.lungfish.bPaused = 0
		self.bUninterruptibleState = 0		--this wont run, but it doesn't matter
		self:setState(nil)
	end								   

	function Ob:footfall(foot, runType)
		self:genericFootprint(foot, runType)
	end
	
--********************************************************************************

	function Ob:getHintResponse()
		if (Global:load('LungfishDazed') == 1) then
			return {
				{
					voice = "/GLAJ002FO/",--DIALOG=<<Take that little door you found in Sasha\'s lab and use it on the monster.>>
				},
				{
					voice = "/GLAJ003FO/",--DIALOG=<<We have to get in it\'s head if we\'re going to find out where it took the girl!>>
				}
			}
		elseif (fso("Lungfish").part == 1 or fso("Lungfish").part == 2) then
			return {
				{
					voice = "/GLAJ000FO/",--DIALOG=<<Dodge that garbage it\'s spitting out!>>
				},
				{
					voice = "/GLAJ001FO/",--DIALOG=<<And when it\'s sucking it back up, bust open one of those nail boxes and see how it likes the taste of those!>>
				}
			}
		else
			return nil
		end
	end
	

					
	return Ob
end

--fso('Lungfish'):setState('StartBattle')
--fso('Lungfish'):setPhase(2,2)
--fso('Lungfish'):setHealthLevel(0.75)
--Global.player:adjustHealth(25)
