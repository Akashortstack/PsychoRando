--
--  Crow.lua
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary, Confidential and shazam
--

function Crow(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/Crow.plb'
		Ob.animsDir = 'Crows'
		Ob.height = 100
		Ob.initialState = nil
		
		-- for clairvoyance to work properly
		Ob.maxViewDistance = 5000
		Ob.clairFOV = 120

		Ob.clairFollows = 0
		
		Ob.clairRotY = 180
		Ob.bClairvoyancePlayerControl = 1
		
		-- for looking during clairvoyance
		Ob.lookTarget = nil -- Editable
		
		-- timers
		Ob.FLY_TIMER = '13001'
		Ob.flySecs = 5000
		
		Ob.Telekinesis = kTKBEHAVIOR_NONE
		Ob.tPsiReactTable = {
				Confusion = {animToPlay = 'confused', nextAnimToPlay = 'idle1'},
		}
		Ob.firestartResistance = 0
	
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'MM.Props.Feather',
			},
		}        
        end

--  I N I T  **************************************************************************************
	
	function Ob:onSpawn()
		-- the spline tables
		self.tFlyAwaySplines = {}
		self.tFlyBackSplines = {}		
		SetEntityGravityDir(self, GetEntityUp(self))
		%Ob.Parent.onSpawn(self)
	end

--*************************************************************************************************

	function Ob:onPreBeginLevel()
		SetEntityGravityDir(self, GetEntityUp(self))
		%Ob.Parent.onPreBeginLevel(self) 
		self.animsTable = {
					idle1 = {fileName = 'LookAround', preload = 1, loop = 1},
					idle2 = {fileName = 'LookAround_2', preload = 1, loop = 1},
					
					fly = {fileName = 'Fly_loop', preload = 1, loop = 1},
					land = {fileName = 'Fly_end', preload = 1, loop = 0},
					confusion = {fileName = 'Confused', preload = 1, loop = 0, blendTime = 0},
				}
	end
	
--*************************************************************************************************
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)		
		if (Global.levelScript.registerGravity) then Global.levelScript:registerGravity(self) end
		SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
		SetMeshIsBackwards(self, 1)
		
		
		if (FindScriptObject('Feather')) then
			self:setPosition(48001.4, -29914.5, -2844.2)
		else
			-- set up the spline[s]
			-- away
			local i, j = 1, 1
			local wpt = FindScriptObject(self.Name..'Spline'..i..'Away'..j, 1)
			while (wpt) do
				self.tFlyAwaySplines[i] = {}
				while (wpt) do
				local px, py, pz = wpt:getPosition()
					self.tFlyAwaySplines[i][j-1] = {xpos = px, ypos = py, zpos = pz}
					j = j + 1
					wpt = FindScriptObject(self.Name..'Spline'..i..'Away'..j, 1)
				end
				i = i + 1
				wpt = FindScriptObject(self.Name..'Spline'..i..'Away'..j, 1)
			end
			-- back
			i, j = 1, 1
			wpt = FindScriptObject(self.Name..'Spline'..i..'Back'..j, 1)
			while (wpt) do
				self.tFlyBackSplines[i] = {}
				while (wpt) do
					local px, py, pz = wpt:getPosition()
					self.tFlyBackSplines[i][j-1] = {xpos = px, ypos = py, zpos = pz}
					j = j + 1
					wpt = FindScriptObject(self.Name..'Spline'..i..'Back'..j, 1)
				end
				i = i + 1
				wpt = FindScriptObject(self.Name..'Spline'..i..'Back'..j, 1)
			end
			self.curSpline = self.tFlyAwaySplines[RandInt(1, getn(self.tFlyAwaySplines))]
		end
		
		-- set up look target
		if (self.lookTarget) then
			self.lookTarget = FindScriptObject(self.lookTarget)
		end
		
		self:setState('Idle')
	end

--*************************************************************************************************

	function Ob:onDestroyed(bBecause)
		if bBecause ~= 1 then Global.levelScript:unregisterGravity(self) end
		%Ob.Parent.onDestroyed(self, bBecause)
	end

--  S T A T E S  **********************************************************************************

	function Ob:stateIdle()
		self:setAnim(self.animsTable['idle'..RandInt(1,2)])
		
		self:setState(nil)
	end
	
--*************************************************************************************************

	function Ob:stateFly()
		self:setAnim(self.animsTable.fly)
		local px, py, pz = self.curSpline[getn(self.curSpline)].xpos, self.curSpline[getn(self.curSpline)].ypos, self.curSpline[getn(self.curSpline)].zpos
		RotateTowards3D(self, px, py, pz, 500, 1, 1)
		self:killTimer(self.FLY_TIMER)
		self.rFlyPath = CreateSplinePath(kSPLINEPATH_ONCE, self.curSpline)
		UsePath(self.rFlyPath, self, 10, kSPLINEPATH_ONCE)
		SplineOrientationFlag(self, 0)
		
		self:setState(nil)
	end
	
--*************************************************************************************************

	function Ob:stateLand()
		self:playAnimBlocking(self.animsTable.land)
		if (self.lookTarget) then
			local px,py,pz = self.lookTarget:getPosition()
			RotateTowards3D(self, px,py,pz, 500, 1, 1)
		end
		
		self:setState('Idle')
	end
	
	function Ob:endStateLand()
		self.bLanded = 1
		-- set physics
		--self:createTimer(self.flySecs, self.FLY_TIMER)
	end
	
--*************************************************************************************************

	function Ob:landImmediately()
		self.bLanded = 1
		DetachFromSpline(self)
		self:setVelocity(0,0,0)
		if (self.rFlyPath) then
			DestroyPath(self.rFlyPah)
			self.rFlyPath = nil
		end
		Global.cutsceneScript:placeChar(self, 48001.4, -29914.5, -2844.2, -159.4, -166.8, -85.9)
		self:setState('Idle')
	end

--*************************************************************************************************

	function Ob:beginStatePunched()
		self.bHasBeenPunched = 1
	end
	
	function Ob:statePunched()
		-- drop feather and fly away
		--edit Removed, feather in collectible pool
		--[[if (not FindScriptObject('Feather', 1)) then
			-- drop feather
			local px, py, pz = self:getPosition()
			self.feather = SpawnScript('MM.Props.Feather', 'Feather', 'self.px='..px..';self.py='..py..';self.pz='..pz..';self.target=\''..self.Name..'\'')
		end]]
		self:chooseSpline()
        
		self:setState('Fly')
	end
	
--  M E S S A G E  H A N D L E R S  ***************************************************************

	function Ob:onTimer(id, from)
		if (id == self.FLY_TIMER) then
			self:killTimer(self.FLY_TIMER)
			self:chooseSpline()
			self:setState('Fly')
		else
			%Ob.Parent.onTimer(self, id)
		end
	end
	
--*************************************************************************************************
	
	function Ob:onItem()
		Global.player:sayLine("/MMAV000RA/", 0, 1, nil, 1, nil, 1)
		self:onNewMoveMelee()
	end
	
--*************************************************************************************************
	
	function Ob:onSplinePointArrive(data, from)
		data = tonumber(data)
		if (data == self.curEndWaypoint) then
			DetachFromSpline(self)
			self:setVelocity(0,0,0)
			DestroyPath(self.rFlyPath)
			self.rFlyPath = nil			
			self:setState('Land')
		end
	end
	
--*************************************************************************************************

	function Ob:onNewMoveMelee()
		if self.bHasBeenPunched ~= 1 then
			self:setState('Punched')
		end
	end

--*************************************************************************************************

	function Ob:onPsiBlast()
		self:onNewMoveMelee()
	end

--*************************************************************************************************
	
	function Ob:onFireStart()
		%Ob.Parent.onFireStart(self)
		self:onNewMoveMelee()
	end

	
--  O T H E R  F U N C T I O N S  *****************************************************************

	function Ob:chooseSpline()
		if self.curSpline and (self.curSpline.bBack) then
			self.curSpline = self.tFlyBackSplines[RandInt(1, getn(self.tFlyBackSplines))]
			self.curEndWaypoint = getn(self.curSpline) + 1
			self.curSpline.bBack = nil
		else
			self.curSpline = self.tFlyAwaySplines[RandInt(1, getn(self.tFlyAwaySplines))]
			self.curEndWaypoint = getn(self.curSpline) + 1
			self.curSpline.bBack = 1
		end
	end
							 
--*************************************************************************************************

	return Ob
end

