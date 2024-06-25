
function LungfishBubble(Ob)

	if (not Ob) then
		Ob = CreateObject('ScriptBase')
		
		Ob.bossMain = nil				--the reference to the main boss entity
		
		--fill in the mesh of the boss
		Ob.meshName = 'Levels/LL_LungfishLair/Props/LL_Bubble.plb'
		
		--for phase 2, the path locators should be prefixed 'part1Loc1' etc....
		Ob.part1Locs = 16				--number of locators for part 1
		Ob.part2Locs = 20				--number of locators for part 2
	
		Ob.path1Time = 120
		Ob.path2Time = 120	
			
		Ob.currLocNum = 1				--the locator you want to move towards
		Ob.currLoc = nil				--the locator you want to move towards
		
		Ob.shrinkSpeed = 4				--also for growing
	
			--radius	
		Ob.maxRadius = 3000
		Ob.minRadius = 1200
		Ob.currRadius = 3000
		Ob.currScale = 1
		
		--'modes'
		Ob.bShrinking = 0
		Ob.bGrowing = 0
		Ob.bMoving	= 0
		
		--the amount the trig sphere is smaller by than the visual bubble
		Ob.trigSphereRange = 100
		--the bare minimum difference
		Ob.trigSphereMin = 75
		--the warning sphere diff'
		Ob.warnSphereDiff = 500
		Ob.currWaypoint = 0
		
		Ob.canSuckRazDelay = 3
		Ob.CANSUCKRAZTIMER = '1'
		Ob.bCanSuckRaz = 1
		Ob.suckInRazRadius = 400		
		Ob.suckInRazWarningRadius = 600		
	
		-- Tweaks for suck/blow
		Ob.fWindSpeed = 1200			-- same units as other velocity
		Ob.fSquareDrag = 0.001			-- the higher this is, the "lighter" raz feels
		Ob.fRazBrakeAccel = 500		-- the lower, the faster raz moves if player doesn't touch joystick

		Ob.home = nil					--the locator that represents the center of the bubble, in phase 1 only
	end
-- ***********************************************************************************************
   
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		--the amount to scale down the mock sphere every second
		self.scaleSpeed = (self.shrinkSpeed * ((self.maxRadius-self.minRadius) / self.maxRadius)) / (self.maxRadius - self.minRadius)
			
		if (Global:load('LungfishDazed') == 1) then
			self:setPosition(FindScriptObject('Bubble2'):getPosition())
			self:loadMesh('Levels/LL_LungfishLair/Props/LL_Bubble.plb')
			self.trigSphere = TriggerSphere_New(0,0,0, self.currRadius, self)
			self.warnTrigSphere = TriggerSphere_New(0,0,0, self.currRadius-self.warnSphereDiff, self)
			self:setRadius(2400)
		else  --haven't beaten LL
			self.trigSphere = TriggerSphere_New(0,0,0, self.currRadius, self)
			self.warnTrigSphere = TriggerSphere_New(0,0,0, self.currRadius-self.warnSphereDiff, self)
			RegisterTriggerVolume(self, 'tv_slowPath1')
			RegisterTriggerVolume(self, 'tv_slowPath2')
			RegisterTriggerVolume(self, 'tv_slowPath3')
			RegisterTriggerVolume(self, 'tv_slowPath4')
			self:loadMesh('Levels/LL_LungfishLair/Props/LL_Bubble.plb')
			self:setRadius(self.currRadius)
			self:setPosition(FindScriptObject('BubbleStart'):getPosition())
		end
		SetEntityCollideSphere(self, 0, 0, 0, 0) 
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
		
		--bubble distorton settings
		SetEntityDistortionScale(self, 10)
		SetEntityDistortionColor(self, 0.3, 0.5, 0.95) -- hazy water

		--global distortion settings
		SetDistortionScale(3)
		SetDistortionColor(0.1, 0.5, 0.8)         --blueish

		--mark the lungfish bubble as a sorting sphere for the level
		SetEntitySortingSphere(self, 1)
	end
    	   
-- ***********************************************************************************************
	
	--here are all the numbers pertaining to the spline that match up:
	--onSplinePointArrive,  self.currWayPoint (used for SplinePositionAtWayPoint()), the spline path locator suffix (part1path1), the respawn locator (respawnpart1path1)
	
	--total length:		21 points (as an example) 
	--onSplinePointArrive:  N/A				1				2  			...	19				20	
	--self.curWayPoint:		0				0				1			...	18				19
	--locator suffix:		Bubble0			1				2			...	19				Bubble1	
	--respawn suffix:		N/A  			N/A  			0				17				N/A
	--(the respawn point is the point where raz will respawn IF hes reached the corresponding column.  
	--the bubble will re-set to the waypoint behind the one just passed
	 
	 --water respawning example:
	 --if you've just receieved onSplinePointArrive(19), then self.currWayPoint = 18
	 --then if you enter the water, you will respawn at 17, and SplinePositionAtWaypoint(17) will be called (currWayPoint-1)
	 
	function Ob:startSplineMove()
		local loc
		local tPath = {}
		local x,y,z = self:getPosition()
		self.respawnStartX,self.respawnStartY,self.respawnStartZ = x,y,z
		tPath[0] = {xpos = x, ypos = y, zpos = z}
		for i=1,self['part' .. self.bossMain.part .. 'Locs'] do
			loc = FindScriptObject('part' .. self.bossMain.part .. 'Path' .. i)
			x,y,z = loc:getPosition()
			tPath[i] = {xpos = x, ypos = y, zpos = z}
		end
		x,y,z = FindScriptObject('Bubble' .. self.bossMain.part):getPosition()
		tPath[self['part' .. self.bossMain.part .. 'Locs']+1] = {xpos = x, ypos = y, zpos = z}
		self.hPath = CreateAbsolutePath( self, self['path' .. self.bossMain.part .. 'Time'], kSPLINEPATH_ONCE, tPath)
        self.currWaypoint = 0
		--SplineDisplay(self, 1)
		SplineForceMove( self, 1)
		SplineUnidirectional( self, 1)
		SplineOrientationFlag(self, 0)
	    self.bMoving = 1
		--edit make it faster! Original is 1
		self.settings = FindScriptObject('RandoSeed')
		if self.settings.fasterLLLL ~= nil and self.settings.fasterLLLL = TRUE then
			self.splineSpeed = 1.5
		else
			self.splineSpeed = 1
		end
		Global.player.waterRespawnLSOName = 'respawnBubble' .. (self.bossMain.part-1)
			
		--start orienting towards first marker
		loc = FindScriptObject('part' .. self.bossMain.part .. 'Path' .. 1)
		if (loc) then
			self.bossMain:updateOrigin(loc)
			self.bossMain.strafe:moveTo(0,0)			
		end		
		--self:setAnim(self.animsTable.Undulate)
		self.bossMain:setAnim(self.bossMain.animsTable.PushBubble)
		
		Global:save('Part2Path20CutSeen', 0)
		Global:save('Part1Path9CutSeen', 0)
		
	end

-- ***********************************************************************************************
 
	function Ob:onSplinePointArrive(data,from)
		GamePrint("ON SPLINE POINT ARRIVE " .. data)
		self.currWaypoint = tonumber(data)-1
				
		local loc, currLoc  --loc is the next locator, currLoc is one we just passed
		if (not (self.bossMain.part == 2 and tonumber(data) > 20)) then
			SetCameraFieldOfView(160)
		end
		
		--if reached the end
		if (tonumber(data) == self['part' .. self.bossMain.part .. 'Locs']+2) then
			--self:setAnim(self.animsTable.SquashTop)	
			--GamePrint("REACHED END, KILLING SPLINE")
			if (self.bossMain.part ~= 2) then
				Global.cutsceneScript:runCutscene('DoneWithPhase2')
			end
			DetachFromSpline(self)
			DestroyPath(self.hPath)
			self.bMoving = 0
			SetVelocity(self, 0,0,0)
			if (self.bossMain.strafe.state_name == 'MoveWithBubble') then
			 	self.bossMain.strafe:setState(nil)
			end
			
		 	loc = FindScriptObject('Bubble' .. self.bossMain.part)
			currLoc = FindScriptObject('Bubble' .. self.bossMain.part)
			--move to the center front of the next bubble (oy is in world coordinates)
			self.bossMain:setPhase(self.bossMain.part+1, 1, 1)
			
		elseif (tonumber(data) >=  self['part' .. self.bossMain.part .. 'Locs']+1) then		--second to last in path
			--GamePrint("ARRIVED AT SECOND TO LAST SPLINE")
			
			--if reached last locator, find the next bubble, and start growing
		 	loc = FindScriptObject('Bubble' .. self.bossMain.part)
			currLoc = FindScriptObject('part' .. self.bossMain.part .. 'Path' .. (tonumber(data)-1))
			--GamePrint("ORIENTING TO NEXT BUBBLE " .. loc.Name)
			--move to the center front of the next bubble (oy is in world coordinates)
--			self.bossMain.strafe:moveTo(0,0)
		else
			--GamePrint("ARRIVED IN MIDDLE OF SPLINE")
			--else find the next locator
			loc = FindScriptObject('part' .. self.bossMain.part .. 'Path' .. data)
			currLoc = FindScriptObject('part' .. self.bossMain.part .. 'Path' .. (tonumber(data)-1))
--			self.bossMain.strafe:moveTo(0,0)
		end
		
		self.bossMain.strafe:updateOrigin(loc)
		
	    if (self.bossMain.part == 2 and tonumber(data) < 20) then
			Global:save('Part2Path20CutSeen', 0)
		end
		
		if (self.bossMain.part == 2 and (tonumber(data) == 8 or tonumber(data) == 9)) then -- or tonumber(data) == 20)) then
			self.bossMain.strafe:moveTo(0,30)
	    elseif (self.bossMain.part == 2 and tonumber(data) == 20 and Global:load('Part2Path20CutSeen') == 1) then
			--self.bossMain.strafe:moveTo(0,30, 1200)
			self:grow()
			self.bossMain.strafe:moveTo(0,30)
			SetCameraFieldOfView(80, 4)
	    elseif (self.bossMain.part == 2 and tonumber(data) == 21) then
			self.bossMain.strafe:moveTo(0,0)		
			
		--elseif (self.bossMain.part == 3) then
			--GamePrint("THIS SHOULD BE WHEN THE LUNGFISH IS GROWING AND BACKING UP BEFORE PHASE 3")
			--self.bossMain.strafe:moveTo(0,3)
		else
			self.bossMain.strafe:moveTo(0,0)
		end
		
		--for respawning (this synthesized string is only used after the 2nd waypoint)
		--GamePrint("ASSIGNING NEW RESPAWNLSO " .. 'respawnpart' .. self.bossMain.part .. 'Path' .. (tonumber(data)-2))
		Global.player.waterRespawnLSOName = 'respawnpart' .. self.bossMain.part .. 'Path' .. (tonumber(data)-2)

		--miscellaneous maintenance
		if (self.bossMain.part == 1) then
			--A,C,D
			if (tonumber(data) < 5) then
				DomainSleep('A_Arena1DOMAIN', 0)
				DomainSleep('A_Arena1LSOsDOMAIN', 0)			
				DomainSleep('C_Part2path1DOMAIN', 1)
				DomainSleep('C_Part2path1LSOsDOMAIN', 1)
				DomainSleep('D_Part2path3DOMAIN', 1)
			else
				DomainSleep('A_Arena1DOMAIN', 1)
				DomainSleep('A_Arena1LSOsDOMAIN', 1)
				DomainSleep('D_Part2path3DOMAIN', 0)
				
				if (tonumber(data) < 18) then
					DomainSleep('C_Part2path1DOMAIN', 0)
					DomainSleep('C_Part2path1LSOsDOMAIN', 0)
				else
					DomainSleep('C_Part2path1DOMAIN', 1)
					DomainSleep('C_Part2path1LSOsDOMAIN', 1)
				end
			end
			--B
			if (tonumber(data) < 12) then
				DomainSleep('B_Part2path0DOMAIN', 0)
				DomainSleep('B_Part2path0LSOsDOMAIN', 0)
				DomainSleep('E_Arena2DOMAIN', 1)
				DomainSleep('E_Arena2LSOsDOMAIN', 1)		
			else
				DomainSleep('B_Part2path0DOMAIN', 1)
				DomainSleep('B_Part2path0LSOsDOMAIN', 1)
				DomainSleep('E_Arena2DOMAIN', 0)
				DomainSleep('E_Arena2LSOsDOMAIN', 0)
			end

			--[[  too much hitch
			if (tonumber(data) == 17) then
				for i=1,30 do 							
					local crayfish = self.bossMain.crayfishPool:get()
					SetAnimSpeedScale(crayfish, RandInt(80,120)/100)
					crayfish:drop()
				end
			end
			]]--
			
			--cut to outside to show lungfish turning
			if (tonumber(data) == 10 and Global:load('Part1Path9CutSeen') ~= 1) then
				Global.levelScript.cutsceneScript:runCutscene('Part1Path9Cut', nil,nil, 0)
			end
		end
		--this cutscene can be triggered here or in onCrossedTrggerPlane of LLLL, whichever happens first
		if (self.bossMain.part == 2 and tonumber(data) == 20 and Global:load('Part2Path20CutSeen') ~= 1) then
			--cut to outside to show lungfish turning
			GamePrint('BUBBLE REACHED 2.20, running cutscene')
			Global:save('Part2Path20CutSeen', 1)
            Global.levelScript.cutsceneScript:runCutscene('Part2Path20Cut', nil,nil, 0)
		end
		
		if (tonumber(data) == 12) then
			if (self.bossMain.part == 2) then
				FindScriptObject('railslideVISUAL'):makeVisible()
				SetPhysicsFlag(FindScriptObject('railslideCOLLISION'), PHYSICS_COLLIDEE, 1)
				
			end
			--clean up leftover debris when you can't see em anymore (in the middle of the path)
			for k, v in self.bossMain.debrisPool.notpooled do
				if (type(v) == 'table') then	-- because n is in notpooled too
					self.bossMain.debrisPool:pool(v)
				end
			end
		end
	end
			
-- ***********************************************************************************************
	
	--shrink towards the lungfish
	function Ob:shrink()
		--GamePrint("Start SHRINKING")
		self.bShrinking = 1
		self.bossMain:onStartShrinking()
		if (self.bMoving == 0) then
			self.bossMain:setAnim(self.bossMain.animsTable.SuckAir)
		end
		if (Global.levelScript.cutsceneScript.state_name == 'SetupCSStartSucking') then
			self.bShrinkToCenter = 0
		else
			self.bShrinkToCenter = RandInt(0,1)
		end
		self:setState('Shrink')
	end
	
	function Ob:beginStateShrink()
		self.oldBrake = GetPhysicsConstant(PHYSICS_GroundBrakeAccel)
		SetPhysicsConstant(nil, PHYSICS_GroundBrakeAccel, self.fRazBrakeAccel)
	end
	function Ob:endStateShrink()
		SetPhysicsConstant(nil, PHYSICS_GroundBrakeAccel, self.oldBrake)
	end
	
	function Ob:stopShrinking()
		self.currRadius = self.minRadius
		self.currScale = self.minRadius / self.maxRadius
		self.bShrinking = 0
		self:setState(nil)
		self.bossMain:onDoneShrinking()  --this must come after setting state nil
	end

	function Ob:stateShrink()
		if GetFrameSecs() == 0 then return end

		if (self.bossMain.bPaused == 0) then
			if (self.currRadius <= self.minRadius) then
				--GamePrint("STOP SHRINKING")
				self:stopShrinking()
			else
				--GamePrint("SHRINK")
				local sine = abs(sin(abs(self.currRadius-self.minRadius) * 180 / (self.maxRadius-self.minRadius)))
				local dampen = max(0.01, sqrt(sine))
				
				self.currRadius = self.currRadius - self.shrinkSpeed * GetFrame60ths() * dampen
				self.currScale = self.currScale - self.scaleSpeed * GetFrame60ths() * dampen
					
				if (self.bShrinkToCenter == 0) then
					local x,y,z = self:getPosition()
					local vx,vy,vz = self:vectorTo(self.bossMain)			
					local nx = x + vx * (self.shrinkSpeed) * GetFrame60ths() * dampen
					local ny = y + vy * (self.shrinkSpeed) * GetFrame60ths() * dampen
					local nz = z + vz * (self.shrinkSpeed) * GetFrame60ths() * dampen
					self:setPosition(nx,ny,nz)     
				end       
			end
	
			self:setRadius(self.currRadius)
			
			--so that the lungfish moves with bubble
			if (self.bossMain.strafe.state_name ~= 'MoveWithBubble' and self.bossMain.strafe.state_name ~= 'MoveTo') then
				--GamePrint("BUBBLE SRHINK CALLING SETRADIAL")
				self.bossMain.strafe:setRadialPos(self.bossMain.strafe.currAngle)
			end
			--pull raz towards lungfish
			if (Global.cutsceneScript.cutscenePlaying ~= 1 and Global.player.dartisdying ~= 1 and self.bossMain.bPaused ~= 1
					and self.bossMain.phase == 1 and self.bCanSuckRaz == 1 ) then
				
				local cooky = BeginMath()
				local vBoss = Vector(self.bossMain:getPosition())
				self:BlowEntity(Global.player, vBoss, self.fWindSpeed, 1)
				local dist = Global.player:distance(vBoss.x,vBoss.y-200,vBoss.z)
				EndMath(cooky)
				if (dist < self.suckInRazRadius) then
					self.bCanSuckRaz = 0
					self:createTimerSecs(self.canSuckRazDelay, self.CANSUCKRAZTIMER)
					Global.cutsceneScript:runCutscene('SuckInRaz', 0, 0, 0, 0)
				elseif (dist < self.suckInRazWarningRadius) then
					PESetActive(self.bossMain.warningBubbles, 1)
				elseif (dist >= self.suckInRazWarningRadius) then
					PESetActive(self.bossMain.warningBubbles, 0)
				end
			end
		end
	end
	
	function Ob:endStateShrink()
		PESetActive(self.bossMain.warningBubbles, 0)
	end
	
	
	
-- ***********************************************************************************************
	
	function Ob:grow()
		--GamePrint("START GROWING")
		self.bGrowing = 1
		self.bossMain:onStartGrowing()
		if (self.bMoving == 0) then
			self.bossMain:setAnim(self.bossMain.animsTable.BlowAir)
		end
		self:setState('Grow')
	end
	
	function Ob:beginStateGrow()
		self.oldBrake = GetPhysicsConstant(PHYSICS_GroundBrakeAccel)
		SetPhysicsConstant(nil, PHYSICS_GroundBrakeAccel, self.fRazBrakeAccel)
	end
	function Ob:endStateGrow()
		SetPhysicsConstant(nil, PHYSICS_GroundBrakeAccel, self.oldBrake)
	end
	
	function Ob:stopGrowing()
		self.currRadius = self.maxRadius
		self.currScale = 1.0
		self.bGrowing = 0
		self:setState(nil)
		self.bossMain:onDoneGrowing()    --this must come after setting state nil
	end
	
	function Ob:stateGrow()
		if GetFrameSecs() == 0 then return end

		if (self.bossMain.bPaused == 0) then
			if (self.bossMain.part ~= 3 and self.currRadius >= self.maxRadius) then
				--GamePrint("STOP GROWING")
				self:stopGrowing()
			elseif (self.bossMain.part == 2 and self.bossMain.phase == 2 and self.currRadius >= 2400) then
				--GamePrint("STOP GROWING")
				self.currRadius = self.maxRadius * 0.8
				self.currScale = 0.8
				self.bGrowing = 0
				self:setState(nil)
				self.bossMain:onDoneGrowing()    --this must come after setting state nil
				return
			else
				--GamePrint("GROW")
			
				local sine = abs(sin(abs(self.currRadius-self.maxRadius) * 180 / (self.maxRadius-self.minRadius)))
				local dampen = max(0.01, sqrt(sine))
				
				self.currRadius = self.currRadius + self.shrinkSpeed * GetFrame60ths() * dampen
				self.currScale = self.currScale + self.scaleSpeed * GetFrame60ths() * dampen
				
				local x,y,z = self:getPosition()
				local vx,vy,vz = self:vectorTo(self.home)
				local nx = x + vx * (self.shrinkSpeed) * GetFrame60ths() * dampen
				local ny = y + vy * (self.shrinkSpeed) * GetFrame60ths() * dampen
				local nz = z + vz * (self.shrinkSpeed) * GetFrame60ths() * dampen
				self:setPosition(nx,ny,nz)
			end
	
			self:setRadius(self.currRadius)
			--so that the lungfish moves with bubble
			if (self.bossMain.strafe.state_name ~= 'MoveWithBubble' and self.bossMain.strafe.state_name ~= 'MoveTo') then
				--GamePrint("BUBBLE GROW CALLING SETRADIAL")
				self.bossMain.strafe:setRadialPos(self.bossMain.strafe.currAngle)
			end
			
			--push raz away from lungfish
			if (Global.cutsceneScript.cutscenePlaying ~= 1  and Global.player.dartisdying ~= 1 and self.bossMain.bPaused ~= 1 and self.bossMain.phase == 1) then
				local cook = BeginMath()
				self:BlowEntity(Global.player,Vector(self.bossMain:getPosition()),self.fWindSpeed,0)
				EndMath(cook)
			end
		end
	end
							 
	-- Helper for stateGrow/stateShrink
	-- Blow |ent| towards or away from |vWindSource|
	-- (direction is governed by |bTowardsSource|)
	function Ob:BlowEntity(ent, vWindSource, fWindSpeed, bTowardsSource)
		local dt = GetFrameSecs()
		if dt == 0 then return end
		local cooky = BeginMath()

		local vWindDir = Vector(ent:getPosition()) - vWindSource
		vWindDir:Normalize()
		if bTowardsSource == 1 then
			vWindDir:MulEquals(-1)
		end

		local vWind = vWindDir * (self:getWindAccel_drag2(ent, vWindDir, fWindSpeed) * dt)
		-- Remove "up" component to prevent raz from popping off ground
		local vUp = Vector(GetEntityUp(ent))
		vWind:SubEquals(vUp * VectorDot(vWind, vUp))
		ApplyVelocity(ent, vWind:AsComponents())

		EndMath(cooky)
	end

	-- Helper for BlowEntity
	-- Models a force proportional to square of wind's relative velocity
	-- (roughly accurate for larger bodies or high wind speed)
	-- Returns an acceleration >= 0 in the vWindDir direction
	--
	function Ob:getWindAccel_drag2(ent, vWindDir, fWindSpeed)
		local cooky = BeginMath()
		local fEntityAirSpeed = fWindSpeed - VectorDot(vWindDir, Vector(GetVelocity(ent)))
		EndMath(cooky)

		-- If moving with wind, and running faster than it, apply no force at all
		fEntityAirSpeed = max(0, fEntityAirSpeed)
		return fEntityAirSpeed * fEntityAirSpeed * self.fSquareDrag
	end

-- ***********************************************************************************************
	
	--in world units
	function Ob:setRadius(radius)
		--local a,b,c,d = TriggerSphere_GetSphere(self.trigSphere)
		--if (GetFrameSecs() > 0) then GamePrint("BEFORE SETRADIUS------------------" .. a .. "  " .. b .. "  " .. c) end
		self.currRadius = radius
		self.currScale = radius / self.maxRadius
		
		if (self.trigSphere) then
			local trigSphereDiff = ((self.currRadius - self.minRadius) * self.trigSphereRange / 2800) + self.trigSphereMin
			TriggerSphere_SetRadius(self.trigSphere, radius-trigSphereDiff)
			TriggerSphere_SetRadius(self.warnTrigSphere, radius-trigSphereDiff-self.warnSphereDiff)
		end
		self:setScale(self.currScale,self.currScale,self.currScale)
		
		--a,b,c,d = TriggerSphere_GetSphere(self.trigSphere)
		--if (GetFrameSecs() > 0) then GamePrint("---AFTER SETRADIUS------------------" .. a .. "  " .. b .. "  " .. c) end
	end			

-- ***********************************************************************************************
   
   --call this when lungfish moves to a new part of the battle, to update variables
	function Ob:setPhase(part,phase, bNatural)
		--GamePrint("LUNGFISH BUBBLE SETPHASE")
	
		if (part == 0) then		--before fight
			self.home = FindScriptObject('BubbleStart')
			self.bossMain:updateOrigin(self.home)
			Global.player.waterRespawnLSOName = 'respawn' .. self.home.Name
			self:setRadius(4000)
			--self:setAnim(self.animsTable.UndulateSlow)
			
		elseif (part == 1 and phase == 1) then		--start of the fight
			self.home = FindScriptObject('Bubble0')
			self.bossMain:updateOrigin(self.home)
			Global.player.waterRespawnLSOName = self.Name
			Global:setPlayerRespawnPointName(self.Name)
			self:setRadius(self.maxRadius)
			self:shrink()		  --start grow shrink cycle
		elseif (part == 1 and phase == 2) then   --move towards the second bubble
			if (not bNatural) then
				self.home = FindScriptObject('Bubble0')
				self.bossMain:updateOrigin(self.home)
			end
			Global:setPlayerRespawnPointName('respawnBubble0')
			self:startSplineMove()
			self:shrink()		  
		elseif (part == 2 and phase == 1) then   -- at the start of the second bubble
			self.home = FindScriptObject('Bubble1')
			self.bossMain:updateOrigin(self.home)
			Global.player.waterRespawnLSOName = self.Name
			Global:setPlayerRespawnPointName(self.Name)
			if (not bNatural) then
				self:setRadius(self.maxRadius)
			end
			self:shrink()		  --start grow shrink cycle
			if (not bNatural) then 
   				DomainSleep('A_Arena1DOMAIN', 1)
				DomainSleep('A_Arena1LSOsDOMAIN', 1)
				DomainSleep('B_Part2path0DOMAIN', 1)
				DomainSleep('B_Part2path0LSOsDOMAIN', 1)
				DomainSleep('C_Part2path1DOMAIN', 1)
				DomainSleep('C_Part2path1LSOsDOMAIN', 1)
				DomainSleep('D_Part2path3DOMAIN', 1)
				DomainSleep('E_Arena2DOMAIN', 0)
				DomainSleep('E_Arena2LSOsDOMAIN', 0)
 		end
		elseif (part == 2 and phase == 2) then	 --move towards final bubble
			--if done for debuggin purposes
			if (not bNatural) then
				self.home = FindScriptObject('Bubble1')
				self.bossMain:updateOrigin(self.home)
			end
			Global:setPlayerRespawnPointName('respawnBubble1')
			self:startSplineMove()
			self:shrink()		  
			if (not bNatural) then 
				DomainSleep('A_Arena1DOMAIN', 1)
				DomainSleep('A_Arena1LSOsDOMAIN', 1)
   				DomainSleep('B_Part2path0DOMAIN', 1)
				DomainSleep('B_Part2path0LSOsDOMAIN', 1)
				DomainSleep('C_Part2path1DOMAIN', 1)
				DomainSleep('C_Part2path1LSOsDOMAIN', 1)
				DomainSleep('D_Part2path3DOMAIN', 1)
				DomainSleep('E_Arena2DOMAIN', 0)
				DomainSleep('E_Arena2LSOsDOMAIN', 0)
			end

		elseif (part == 3) then	 				--entered final bubble
			self.home = FindScriptObject('Bubble2')
			self.bossMain:updateOrigin(self.home)
			Global.player.waterRespawnLSOName = self.Name
			Global:setPlayerRespawnPointName('respawn' .. self.home.Name)
			if (not bNatural) then
				self:setRadius(2400)
				DomainSleep('A_Arena1DOMAIN', 1)
				DomainSleep('A_Arena1LSOsDOMAIN', 1)
   				DomainSleep('B_Part2path0DOMAIN', 1)
				DomainSleep('B_Part2path0LSOsDOMAIN', 1)
				DomainSleep('C_Part2path1DOMAIN', 1)
				DomainSleep('C_Part2path1LSOsDOMAIN', 1)
				DomainSleep('D_Part2path3DOMAIN', 1)
				DomainSleep('E_Arena2DOMAIN', 0)
				DomainSleep('E_Arena2LSOsDOMAIN', 0)
			end
			--self:grow()
			--GamePrint("SETPHASE 3")
			
			if (self.bossMain.bGoToPhase3 == 1) then
				--GamePrint("SETPHASE 3 GO TO PHASE 3")
				Global.levelScript.cutsceneScript:runCutscene('LungfishEnters')
			end
		end   																			
	end

-- ***********************************************************************************************

	function Ob:setPosition(x,y,z)
	 	SetPosition(self, x,y,z)
	end
	
-- ***********************************************************************************************
	
	function Ob:updateOrigin(loc)
	 	self:setPosition(loc:getPosition())
	end

-- ***********************************************************************************************

	function Ob:endMode()
		if (self.bMoving == 1) then
			self:pauseSpline()
		end
		self:setState(nil)
		self.bGrowing = 0
		self.bShrinking = 0
		self.bGrowing = 0
		
	end
	
-- ***********************************************************************************************
	
	function Ob:pauseSpline()
	    SplineSpeedRel( self, 0)
		self.bMoving = 0
	end

	function Ob:continueSpline()
		--edit from (self, 1)
	    SplineSpeedRel( self, self.splineSpeed)
		self.bMoving = 1
		
	end
	
-- ***********************************************************************************************
	 		  
	function Ob:onEnteredTriggerVolume(data,from)			  
		if (from == Global.player and self.bossMain.phase == 2 and strsub(data, 1,11) == 'tv_slowPath' and self.bossMain.waterArms.state_name ~= 'RespawnRaz') then
			GamePrint("ENTERING SLOW ZONE")
			--edit go faster! original 0.5
			if self.settings.fasterLLLL ~= nil and self.settings.fasterLLLL = TRUE then
				self.splineSpeed = 1
			else
				self.splineSpeed = 0.5
			end			
			SplineSpeedRel( self, self.splineSpeed)
		end
	end

	function Ob:onExitedTriggerVolume(data,from)			  
		if (from == Global.player and self.bossMain.phase == 2 and strsub(data, 1,11) == 'tv_slowPath' and self.bossMain.waterArms.state_name ~= 'RespawnRaz') then
			GamePrint("EXITING SLOW ZONE")
			--edit go faster! original is 1
			if self.settings.fasterLLLL ~= nil and self.settings.fasterLLLL = TRUE then
				self.splineSpeed = 1.5
			else
				self.splineSpeed = 1
			end
			SplineSpeedRel( self, self.splineSpeed)
		end
	end
   
   	function Ob:onTimer(data,from)
		if (data == self.CANSUCKRAZTIMER) then
			self:killTimer(self.CANSUCKRAZTIMER)
			self.bCanSuckRaz = 1
		end	
	end			
	return Ob
end
