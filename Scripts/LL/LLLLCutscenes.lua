
function LLLLCutscenes(Ob)
	if (not Ob) then
		Ob = CreateObject('Global.Camera.CutsceneScript')
	end
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self.lungfish = FindScriptObject('Lungfish')
		
	end


--**************************************************************************************************

	--this is when the lungfish first starts to suck and raz sees debris coming from behind
	function Ob:stateSetupCSStartSucking()
		self.lungfish.waterArms.bActive = 0
		Global.player.block = 1
		self:fadeToBlack(0)
		self.lungfish:setPhase(1,1, 1)
		SetEntityVisible(self.lungfish.mouthSuckFX, 0)
		self.lungfish:stopSound(self.lungfish.suckSound)
	    self.oldSuckBlowForce = self.lungfish.bubble.suckBlowForce
		self.lungfish.bubble.suckBlowForce = 3
		 
		--place raz in middle
        Global.player:setPosition(5023.9, 62.1, 157.6)
		Global.player:setOrientation(0, 38.4, 0)
		self.debris = self.lungfish.debrisPool:get()
		self.debris:setPosition(4536,75,-360)
		self.debris.bIntroDebris = 1
		self.debris.suckInPhase = 2

		self:setState('StartSucking')
	end
	
	function Ob:stateStartSucking()
		self.lungfish:setAnim(self.lungfish.animsTable.SuckAirStart)
		self:sleep(0.5)
		--close up lungfish
        self:oneShot(self.lungfish, 1100, 300, 400, -30, -5, 0)
		self:fadeIn(0)
		
		self:sleep(2)
		SetEntityVisible(self.lungfish.mouthSuckFX, 1)
		self.lungfish:playSound(self.lungfish.suckSound,0,0,1)
		self:sleep(2)
		
		self.debris:setState('SuckIn')
		
		--looking at raz, and behind raz at debris coming
		self:oneShot(Global.player, 500, 200, 75, 20, -10, 0)
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, Global.levelScript.walkAccelConst)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, Global.levelScript.frictionConst)

		Global.player:doNothing()
		Global.player:loadAnim('Anims/DartNew/TurnStartled.jan', 0.1, 0)		
		self:sleep(2)
		self:setState('CleanupCSStartSucking')
	end
	
	function Ob:stateCleanupCSStartSucking()
		self.lungfish.waterArms.bActive = 1
		Global.player.block = 0
		self:fadeIn(0)
		SetEntityInterestLevel(self.lungfish, kBOSS_INTEREST)
		self.lungfish.strafe:createTimerSecs(self.lungfish.strafe.moveRandTime, self.lungfish.strafe.MOVERANDTIMER)
		if (self.debris) then
			self.debris.bIntroDebris = 0
			self.debris:setPosition(4536,75,-360)
			self.debris:setState('SuckIn')
			self.debris.bIntroDebris = 0
			self.debris.suckInPhase = 2
			self.debris:createTimerSecs(self.debris.phase2Time, self.debris.PHASE2TIMER)
		end
		Global.player:setNewAction('Stand')
		RotateTowards2D(Global.player, 4536,123,-360, 20000, 0)
	    self.lungfish.bubble.suckBlowForce = self.oldSuckBlowForce
		SetEntityVisible(self.lungfish.mouthSuckFX, 1)
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 2000)
		SetPhysicsConstant(Global.player, PHYSICS_FRICTION, 2000)

		SetDistanceFogRange(4000, 7000)
		SetDetailCullingRange(0.7, 0.5)								
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 0)		
		self:endCutscene()
	end
	
--**************************************************************************************************
	--this is when the lungfish sucks raz in because he was too close to the lungfish during suckage
	function Ob:stateSetupCSSuckInRaz()
		self.lungfish.waterArms.bActive = 0
		Global.player.block = 1
		self.lungfish.bPaused = 1
		self:fadeToBlack(0)
		Global.player:interruptPowers()
		Global.player:stopMelee()
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, Global.levelScript.walkAccelConst)
		SetPhysicsConstant(nil, PHYSICS_FRICTION, Global.levelScript.frictionConst)
		if (Global.notSaved.suckerfished) then
			Global.notSaved.suckerfished:setState(nil)
		end

		--stop debris coming in
		local notpooled = self.lungfish.debrisPool:getNotPooled()
		for k, v in notpooled do
			if (type(v) == 'table') then	-- because n is in notpooled too
				v:stopSuckIn(nil)
			end
		end
		
		self.lungfish:setAnim(self.lungfish.animsTable.SuckAir)
		PESetActive(self.lungfish.warningBubbles, 0)
			
		SetVelocity(Global.player, 0,0,0)
		Global.player:setNewAction('Do Nothing')
		
		self.lungfish.warningArms:turnOff()
		self:setState('SuckInRaz')
	end
	
	function Ob:stateSuckInRaz()
		local lx,ly,lz = self.lungfish:getPosition()
		local fx,fy,fz = GetEntityForwardVector(self.lungfish)
		local dist = 600
		--raz position in front
		local nx,ny,nz = lx+fx*dist,ly+300,lz+fz*dist
		--mouth
		local mx,my,mz = lx+fx*100,ly+fy*200+300,lz+fz*100
		Global.player:setPosition(nx,ny,nz)
		Yield()
		--raz faces away from lungfish
		fx,fy,fz = VectorToEuler(fx,fy,fz)
		Global.player:setOrientation(fx,fy+180,fz)
		SnapEntityToGround(Global.player)
		Yield()			   
		self:fadeIn(0) 
		--shot of raz running but goin nowhere
		self:oneShot(Global.player, 400, 150, 150, -20, 5, nil,nil, Global.player)
		Global.player:loadAnim('Anims/DartNew/Lungfish_suckedin.jan', 0.1, 0)
		self:sleep(1)
		nx,ny,nz = Global.player:getPosition()

		--setup  suck path
		local tPath = {}
		tPath[0] = {xpos = nx, ypos = ny, zpos = nz}
		tPath[1] = {xpos = mx, ypos = my, zpos = mz}
		self.hPath1 = CreateAbsolutePath( Global.player, 0.75, kSPLINEPATH_ONCE, tPath)
		SplineDisplay(Global.player, 0)
		SplineForceMove( Global.player, 1)
		SplineUnidirectional( Global.player, 1)
		SplineOrientationFlag(Global.player, 1)
		SplineCharacter( Global.player, 1 )
		--Global.player:loadAnim('Anims/DartNew/Somersault.jan', 0.1, 1)
		
		local a,b,c, d,e,f = self:oneShot(self.lungfish, 800, 300, 400, -30, 0, 0, 1)
        self:sleep(0.25)
		PlaySound(nil, self.lungfish.suckRazWarnSound)
		self:camPathTo(a,b,c, d,e,f, nil, 0.4,0.1,0.1, 1)
		DetachFromSpline(Global.player)
		SetEntityVisible(Global.player, 0)
		SetEntityVisible(self.lungfish.mouthSuckFX, 0)
		self.lungfish:stopSound(self.lungfish.suckSound)
		
		PESetActive(Global.levelScript.blowParticle,0)
		PESetActive(Global.levelScript.suckParticle,0)
		PEAgeParticles(Global.levelScript.suckParticle,0.8)
		
		self.lungfish:setAnim(self.lungfish.animsTable.InhaleRaz)
		
		self:sleep(2)
		PlaySound(nil, self.lungfish.razInsideSound)
		self:sleep(0.75)
		PlaySound(nil, self.lungfish.razInsideSound)
		self:sleep(0.5)
		PlaySound(nil, self.lungfish.razInsideSound)
		self:sleep(1)

		--find a spot for raz to land
		local lx,ly,lz = self.lungfish:getPosition()
		local fx,fy,fz = GetEntityForwardVector(self.lungfish)
		local hx,hy,hz = self.lungfish.bubble.home:getPosition()
		local dist = 1000
		local mx,my,mz = lx+fx*100,ly+fy*200+300,lz+fz*100
		local tx,ty,tz = lx+fx*dist,hy,lz+fz*dist
		dist = GetDistance(tx,ty,tz, mx,my,mz)
		Global.player:loadAnim('Anims/DartNew/Somersault.jan', 0.1, 1)
		PlaySound(nil, self.lungfish.spitRazSound)
		ShootEntityAtTarget(Global.player, mx,my,mz, tx,ty,tz, dist / 1500)
		self:oneShot(self.lungfish, 2000, 300, -100, -25, -13, 5)
		SetEntityVisible(Global.player, 1)
		self:sleep(0.5)
		Global.player:loadAnim('anims/dartnew/CrawlOutOfWater.jan', 0.3, 0)
		--SetVelocity(Global.player, 0,0,0)
		self:sleep(1)
		self:oneShot(Global.player, 800, 250,150, 210)
		self:sleep(1)
		self:setState('CleanupCSSuckInRaz')								  
	end
	
	function Ob:stateCleanupCSSuckInRaz()
		--Global.player:setNewAction('Stand')
		Global.player.block = 0
		self.lungfish.bPaused = 0
		self.lungfish.waterArms.bActive = 1
		self:fadeIn(0) 
		SetEntityVisible(Global.player, 1)
		SetEntityVisible(self.lungfish.mouthSuckFX, 1)
		PESetActive(Global.levelScript.suckParticle,1)
		
		
		if (self.hPath1) then 
			DetachFromSpline(Global.player)
			DestroyPath(self.hPath1) 
		end
		self.hPath1 = nil
		--suckin dropped debris
		local notpooled = self.lungfish.debrisPool:getNotPooled()
		for k, v in notpooled do
			if (type(v) == 'table') then	-- because n is in notpooled too
				v:suckIn()
			end
		end
		self.lungfish:playSound(self.lungfish.suckSound,0,0,1)

        self.lungfish:setAnim(self.lungfish.animsTable.SuckAir)
		self:endCutscene()
		
		self:sendMessageEx(Global.player, 'DamageDart', '', 'fi', 3, kDART_DAMAGE_MOD_NO_KNOCK_BACK)
		self.lungfish.warningArms:turnOn()
		
		--SetChaseCameraAzimuthRel(0)	
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, 2000)
		SetPhysicsConstant(Global.player, PHYSICS_FRICTION, 2000)
	end

--**************************************************************************************************
	
	--lungfish gets hurt badly, roars and then starts pushing the bubble
	function Ob:stateSetupCSGoToPhase2()
		while (self.lungfish.waterArms.bRazInside == 0) do Yield() end
		self.lungfish.waterArms.bActive = 0
		Yield()
		self:fadeToBlack(0)
		SetEntityVisible(self.lungfish.mouthSuckFX, 0)
		SetEntityVisible(self.lungfish.mouthBlowFX, 0)
		PESetActive(Global.levelScript.blowParticle,0)
		PESetActive(Global.levelScript.suckParticle,0)
		PEAgeParticles(Global.levelScript.suckParticle,0.8)
		Global.player.lockHub:Deactivate()
		SetPhysicsConstant(nil, PHYSICS_GroundWalkAccel, Global.levelScript.walkAccelConst)
		SetPhysicsConstant(Global.player, PHYSICS_FRICTION, Global.levelScript.frictionConst)

		--drop all debris being sucked in
		local notpooled = self.lungfish.debrisPool:getNotPooled()
		for k, v in notpooled do
			if (type(v) == 'table') then	-- because n is in notpooled too
				v:stopSuckIn()
			end
		end
		self.lungfish:killTimer(self.lungfish.BLOWDEBRISTIMER)
		self.lungfish.strafe:setState(nil)
		
		--place raz in middle
		local x,y,z = self.lungfish.bubble:getPosition()
        Global.player:setPosition(x,y+500,z)
		Yield()
		SnapEntityToGround(Global.player)
		Yield()
		x,y,z = self.lungfish:getPosition()
		RotateTowards2D(Global.player, x,y,z, 20000)
		SetDistanceFogRange(8000, 15000)
		SetDetailCullingRange(0.6, 0.4)				
		
		self:setState('GoToPhase2')
	end
	
	function Ob:stateGoToPhase2()
		self:fadeIn(0)
		StopSound(self.lungfish.suckSound)
									   
		--cut to closeup of lungfish getting injured and starting to push
		self:oneShot(self.lungfish, 1000, 300, nil, -30 )
		self.lungfish:setAnim(self.lungfish.animsTable.ToPhase2)
		self.lungfish:damageFlash()
		
		while (self.lungfish:getAnimCompletion('SwimDamage.jan') < 0.5) do Yield() end
		PlaySound(nil, self.lungfish.roarSound)
		local a,b,c,d,e,f = self:oneShot(self.lungfish, 500, 300, 400, -20, nil, nil, 1)
		self:camPathTo(a,b,c, d,e,f, nil, 0.5, 0.2, 0.2)
		while (self.lungfish:getAnimCompletion('SwimDamage.jan') < 1.0) do Yield() end
		--far shot of lungfish pushing
		--self:oneShot(self.lungfish, 2500, 1200, 500, -150, -12, 0)
		if (self.lungfish.part == 1) then
			self:cutTo(6655,1705,4456, -13,36,0, 104)
		elseif (self.lungfish.part == 2) then
			self:cutTo(-10949,4555,-8657, -16,-112,0, 104)
		end

		self.lungfish:setPhase(self.lungfish.part, 2, 1)
		self.lungfish.bPaused = 0
	    SplineSpeedRel( self.lungfish.bubble, 0.5)
		self:sleep(2)
		self:setState('CleanupCSGoToPhase2')   
	end
	
	function Ob:stateCleanupCSGoToPhase2()		
		self:fadeToBlack(0)
		if (self.lungfish.phase ~= 2) then
			self.lungfish:setPhase(self.lungfish.part, 2, 1)
		end
		self.lungfish.bubble:setRadius(self.lungfish.bubble.minRadius)
		self.lungfish.bPaused = 0
	    --edit need to match the QOL speed, original ( self.lungfish.bubble, 1)
		SplineSpeedRel(self.lungfish.bubble, self.lungfish.bubble.splineSpeed)
		Yield()
		--place raz in middle
		local x,y,z = self.lungfish.bubble:getPosition()
        Global.player:setPosition(x,y+500,z)
		Yield()
		SnapEntityToGround(Global.player)
		Yield()
		
		x,y,z = self.lungfish:getPosition()
		RotateTowards2D(Global.player, x,y,z, 20000)
		self.lungfish.waterArms.bActive = 1
    
		SetDistanceFogRange(3000, 5000)
		SetDetailCullingRange(0.9, 0.8)		
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)						
		self:endCutscene()
		
		--lungfish pov
		self.lungfish:setLungfishPOV(1)
	end

--**************************************************************************************************

	function Ob:stateDoneWithPhase2()								   
		self.lungfish:setLungfishPOV(0)
		SetDistanceFogRange(8000, 15000)
		SetDetailCullingRange(0.6, 0.4)				
		if (self.lungfish.part == 3) then
			self:cutTo(-3583,2692,-6045, -6,117,0, 104)
		else
			self:cutTo(-4966,2418,-7633, 1,145,0, 104)
		end
		self:sleep(2)
		self:setState('CleanupCSDoneWithPhase2')   
	end
	
	function Ob:stateCleanupCSDoneWithPhase2()		
		--face the lungfish
		local lx,ly,lz = self.lungfish:getPosition()
		RotateTowards2D(Global.player, lx,ly,lz, 2000)
		--camera faces the lungfish too
		local rx,ry,rz = Global.player:getPosition()
		local vx,vy,vz = VectorToEuler(rx-lx,ry-ly,rz-lz)
		SetDistanceFogRange(4000, 7000)
		SetDetailCullingRange(0.7, 0.5)							
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 0)					
		self:endCutscene()				
		self.lungfish:setLungfishPOV(0)		
	end

--**************************************************************************************************
	
	--lungfish enters phase 3, where he enters the bubble and starts lure jabbing and swinging
	function Ob:stateSetupCSLungfishEnters()
		while (self.lungfish.waterArms.bRazInside == 0) do Yield() end
		
		self:cutTo(-5934,3355,-9656, -4,-171,0)
		self.lungfish:killTimer(self.lungfish.BLOWDEBRISTIMER)
		SetPhysicsFlag(self.lungfish, PHYSICS_APPLYGRAVITY, 1)
		
		--place raz in middle
		local x,y,z = self.lungfish.bubble:getPosition()
		Global.player:moveToPosition(x,y,z)
		x,y,z = self.lungfish:getPosition()
		RotateTowards2D(Global.player, x,y,z, 20000)
		self.lungfish:decide()
		SetDistanceFogRange(8000, 15000)
		SetDetailCullingRange(0.6, 0.4)				
		self.lungfish.bInside = 1		
		self:setState('LungfishEnters')	
	end
	
	
	function Ob:stateLungfishEnters()	
		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 0)
		--shot of lungfish entering
		self:cutTo(-5652,2772,-4200, -8,15,0, 104)
		PlaySound(nil, self.lungfish.roarSound)	
			
		PlaySound(nil, LoadSound('BubbleSplash'))
		
		self:sleep(1)
		PlaySound(nil, LoadSound('LungfishFootfall'))
		self:sleep(1)
		
		self:setState('CleanupCSLungfishEnters')	
	end
	
	function Ob:stateCleanupCSLungfishEnters()	
		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 0)
		FindScriptObject('railslideVISUAL'):killSelf()
		FindScriptObject('railslideCOLLISION'):killSelf()
		SetDistanceFogRange(4000, 6000)
		SetDetailCullingRange(0.7, 0.6)				
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 0)		
		self:endCutscene()
		self.lungfish:setLungfishPOV(0)		
	end

--**************************************************************************************************

	--going up the stairs in path 1								  
	function Ob:stateSetupCSPart1Path9Cut()
		while (self.lungfish.waterArms.bRazInside == 0) do Yield() end
		Global:save('Part1Path9CutSeen', 1)
		SplineSpeedRel(self.lungfish.bubble, 0.5)
		--place raz at safe place
		local point = FindScriptObject('respawnpart1Path9')
		local x,y,z = point:getPosition()
		local ox,oy,oz = point:getOrientation()
		Global.player:setPosition(x,y,z)
		Global.player:setOrientation(ox,oy,oz)
		
		--lungfish pov
		self.lungfish:setLungfishPOV(0)
		SetDistanceFogRange(8000, 15000)
		SetDetailCullingRange(0.6, 0.4)				
		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 0)
		self:setState('Part1Path9Cut')
	end
			
	function Ob:statePart1Path9Cut()
		self.lungfish:setAnim(self.lungfish.animsTable.PushBubbleSide)
		self:cutTo(-1621,-247,-10563, -11,35,0, 104)
		--self.lungfish:playSound(self.lungfish.swimSound)
		self:sleep(4)
		self:setState('CleanupCSPart1Path9Cut')
	end
		
	function Ob:stateCleanupCSPart1Path9Cut()
		--place raz at safe place
		while (self.lungfish.waterArms.bRazInside == 0) do Yield() end
		local point = FindScriptObject('respawnpart1Path10')
		local x,y,z = point:getPosition()
		local ox,oy,oz = point:getOrientation()
		Global.player:setPosition(x,y,z)
		Global.player:setOrientation(ox,oy,oz)
		SplineSpeedRel(self.lungfish.bubble, self.lungfish.bubble.splineSpeed)

		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 1)
		SetDistanceFogRange(3000, 5000)
		SetDetailCullingRange(0.9, 0.8)				
		self:endCutscene()
		--lungfish pov
		self.lungfish:setLungfishPOV(1)
				
	end				
	
--**************************************************************************************************

	--going down the spigot (?) in path 2								  
	function Ob:stateSetupCSPart2Path20Cut()
		while (self.lungfish.waterArms.bRazInside ~= 1     --wait for raz to not be outside water
				--or self.lungfish.bubble.currWaypoint < 19 --wait for bubble to reach waypoint 19
				) do  
					Yield() 
		end		
		self.lungfish.waterArms.bActive = 0
		
		SplinePositionAtWaypoint(self.lungfish.bubble, 19)
		
		--place raz at safe place
		local point = FindScriptObject('respawnpart2Path19')
		local x,y,z = point:getPosition()
		local ox,oy,oz = point:getOrientation()
		Global.player:setPosition(x,y,z)
		Global.player:setOrientation(ox,oy,oz)
		SplineSpeedRel( self.lungfish.bubble, 0.25)
		--self.oldOffset = self.lungfish.strafe.radialOffset
		--self.lungfish.strafe.radialOffset = 200
		
		--lungfish pov
		self.lungfish:setLungfishPOV(0)
		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 0)
		
		SetDistanceFogRange(8000, 15000)
		SetDetailCullingRange(0.6, 0.4)				

		self:setState('Part2Path20Cut')
	end
			
	function Ob:statePart2Path20Cut()
		self.lungfish:setAnim(self.lungfish.animsTable.PushBubbleDown)
		--self.lungfish:playSound(self.lungfish.swimSound)
		self:cutTo(-6194,5513,-4839, -9,-143,0, 104)

		self:sleep(5)
		self:setState('CleanupCSPart2Path20Cut')
	end
	
	function Ob:stateCleanupCSPart2Path20Cut()		
		while (self.lungfish.waterArms.bRazInside == 0) do Yield() end
		--SetEntityFlag(self.lungfish, ENTITY_CAMERA_ALPHA, 1)
		SplineSpeedRel(self.lungfish.bubble, self.lungfish.bubble.splineSpeed)
		--self.lungfish.strafe.radialOffset = self.oldOffset
		--place raz at safe place
		local point = FindScriptObject('respawnpart2Path19')
		local x,y,z = point:getPosition()
		local ox,oy,oz = point:getOrientation()
		Global.player:setPosition(x,y,z)
		Global.player:setOrientation(ox,oy,oz)
		self.lungfish.waterArms.bActive = 1
	    
		SetDistanceFogRange(3000, 5000)
		SetDetailCullingRange(0.9, 0.8)				
		self:endCutscene()
		--lungfish pov
		self.lungfish:setLungfishPOV(1)
		self.lungfish.strafe:moveTo(0,30)
		self.lungfish.bubble:grow()
		SetCameraFieldOfView(80, 4)
	end				

--**************************************************************************************************
							  
	function Ob:stateNailsHitLungfish()
		--cut to hurt lungfish
		self:oneShot(self.lungfish, 1200, 300, nil, -30 )
		local vfx = self.lungfish.nailProjectilePool:get()
		local lx,ly,lz = self.lungfish:getPosition()
		
		local fx,fy,fz = GetEntityForwardVector(self.lungfish)
		local nx,ny,nz = lx+fx*700, ly+300, lz+fz*700
		vfx:setPosition(nx,ny,nz)
		
		local vx,vy,vz = VectorToEuler(NormalizeVector(lx-nx,ly-ny,lz-nz))
		
		RotateTowards2D(vfx, lx,ly,lz, 20000)
		RotateEntityY(vfx, 180)
		vfx:runThenPool()
		
		--while (self.lungfish.bHitByNails ~= 0) do Yield() end
		self:sleep(1.5)
		self:endCutscene()			
	end	
	
--**************************************************************************************************

	function Ob:stateLungfishDazed()
		self:oneShot(self.lungfish, 950, 130, 380, 30, 5)
		self:sleep(5)
	
		self:fadeToBlack(0.5,1)
		SetEntityFlag(Global.player,ENTITY_LOOKATINTERESTINGTHINGS,0)
		
		--PreScene Setup
		local x,y,z = self.lungfish:getPosition()
        RotateTowards2D(Global.player, x,y,z, 20000)
		Global.player:setPosition(-4234.5, 2055.3, -4415.2)
		Global.player:setOrientation(0, -164.1, 0)
		self.lungfish:setPosition(-4245.4, 2035.3, -5426.6)
		self.lungfish:setOrientation(0, -6.4, 0)
		self:oneShot(Global.player, 180, 100,120, -30, 10)
		
		--Start Scene
		self:fadeIn(0.5,1)
		self.ford = FindScriptObject('InstaHintFord')
		self.ford:appear(0)
		
		self:sleep(0.5)
		
        self.ford:sayLine("/LLAB000FO/",1,1)--DIALOG=<<Poor little thing.>>
		Global.player:loadAnim('Anims/DartNew/BodyParts/Listen_FordHints_priority.jan', 0.1, 1)
		Global.player:loadAnim('Anims/DartNew/Listen.jan', 0.1, 1)
		
		self:oneShot(self.lungfish, 950, 130, 380, 30, 5)
        Global.player:sayLine("/LLAB001RA/",1,1)--DIALOG=<<That \"poor little thing\" just tried to kill me about eight different ways.>>
		
		self:oneShot(Global.player, 180, 100,120, -30, 10)
		self.ford:loadAnim('anims/janitor/Hint_LookatRaz_loop.jan', 0.1, 1)
		self.ford:sayLine("/LLAB002FO/",1,1)--DIALOG=<<That\'s not it\'s fault.>>
		
		self.ford:loadAnim('anims/janitor/Hint_loop.jan', 0.1, 1)
		self.ford:sayLine("/LLAB003FO/",1,1)--DIALOG=<<This was once just a normal sized lungfish, minding it\'s own business in a mucus-lined air bubble beneath a semi-dry lake bed.>>
		
		Global.cutsceneScript:oneShot(self.lungfish, 650, 530, 430, 95, 20)
		self.ford:sayLine("/LLAB004FO/",1,1)--DIALOG=<<But judging by the work done on it, I suspect Morry has mutated it, accelerated it\'s growth, and has placed an implant in its brain to make it do his evil bidding.>>
		
		self:oneShot(Global.player, 180, 100,120, -30, 10)
		UnLoadPriorityAnim(Global.player, 1, 0.1)
		Global.player:loadAnim('Anims/DartNew/standstill.jan', 0.1, 1)
		Global.player:sayLine("/LLAB005RA/",1,1)--DIALOG=<<Whoa. Poor little thing.>>
		
		self.ford:loadAnim('anims/janitor/Hint_LookatRaz_loop.jan', 0.1, 1)
		self.ford:sayLine("/LLAB006FO/",1,1)--DIALOG=<<Yeah. Go in side there and try to smash the implant! Use the Psycho-Portal I saw you steal from Sasha\'s lab.>>
		
		UnLoadPriorityAnim(Global.player, 1, 0.1)
		Global.player:loadAnim('Anims/DartNew/BodyParts/Listen_FordHints_priority.jan', 0.1, 1)
		Global.player:sayLine("/LLAB007RA/",1,1)--DIALOG=<<Oh, uh, yeah. That works on big, scary monsters?>>
		self.ford:loadAnim('anims/janitor/Hint_loop.jan', 0.1, 1)
		self.ford:sayLine("/LLAB008FO/",1,1)--DIALOG=<<Oh, monster-schmonster! That thing is more afraid of you than you are of it! >>
		self.ford:loadAnim('anims/janitor/Hint_LookatRaz_loop.jan', 0.1, 1)
		self.ford:sayLine("/LLAB009FO/",1,1)--DIALOG=<<Now get in there!>>
		self.ford:disappear()
		self:fadeToBlack(0.5,1)
		self:setState('CleanupCSLungfishDazed')
	end
        
	--Clean Up Scene
	function Ob:stateCleanupCSLungfishDazed()
		if (self.ford) then self.ford:disappear() end
		Global.player:loadAnim('Anims/DartNew/standstill.jan', 0.1, 1)
		SetEntityFlag(Global.player,ENTITY_LOOKATINTERESTINGTHINGS,1)
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)		
		self:endCutscene(1)
		self:fadeIn(0.5)
	end

--************************************************************************************************** 

	return Ob
end

