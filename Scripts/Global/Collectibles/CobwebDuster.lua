function CobwebDuster(Ob)

	if (not Ob) then
		Ob = CreateObject('Global.Props.ShopItem')
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/Duster.plb'
		
		-- HELD OBJECT VARS
		Ob.displayName = "/GLZB015TO/"--DIALOG=<<Cobweb Duster>>
		Ob.pickupSpriteName = 'CobwebDuster'
		Ob.heldscale = 1
		Ob.level = 'all'
		Ob.iTriggerSphereRadius = 50
		Ob.HeldRotX = -17.771;
		Ob.HeldRotY = -29.144;
		Ob.HeldRotZ = -6.658;
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan'
		Ob.bUseOnly = 1

		--edit
		Ob.bSold = 1
		Ob.bUseDefaultUncollectedAnim = 1

		-- END HELD OBJECT VARS
		
		Ob.bLarge = 1	-- used by Global.OtherEntities.InvAdder.lua
    
		-- GRABBER VARS
        Ob.grabberOffX = 0
		Ob.grabberOffY = -23.5
		Ob.grabberOffZ = 16.1
        Ob.grabberJoint = 'nobJ_1'
        
		Ob.dusterFXJoint = 'pinJ1_1'
		Ob.speed = 1000	-- game distance units per second
		Ob.splineTime = 0
		-- SHOP STUFF
		Ob.iPrice = 800
		Ob.iRank = 20 -- Editable
		Ob.iNumStock = 1 -- Editable

		Ob.tShopCamInfo = {
			x = 6347,
			y = 248,
			z = -6369,
			rx = 0, 
			ry = -165,
			rz = 0,
		}
		Ob.sItemDescription = "/GLZB015TO/" --DIALOG=<<Cobweb Duster>>
		Ob.sItemExplanation = "/GLZB054TO/" --DIALOG=<<Collects MENTAL COBWEBS.>>
		-- Shop shelf location Pos:(6342.85,328.26,-6287.73) Ori:(-90,45,0)
		-- END SHOP STUFF
		
		-- ANIM STUFF
		-- NOTE that this anims table is our own verision.  NOT one that is usable with the setanim, and playanimblocking functions
		-- since we dont inherit from animator.
		
		Ob.animsTable = {   DusterRetract = {fileName = 'anims/objects/duster/dusterretract.jan', loop = 0, block = 0},
							DusterShoot = {fileName = 'anims/objects/duster/dustershoot.jan', loop = 0, block = 1},
							GrabberShoot = {fileName = 'anims/objects/duster/Duster_spinner_Shoot.jan', loop = 0, block = 1 },
							GrabberRetract = {fileName = 'anims/objects/duster/Duster_spinner_Retract.jan', loop = 0},
							GrabberSpin = {fileName = 'anims/objects/duster/Duster_spinner_SpinCycle.jan', loop = 1},
						}
		-- END ANIM STUFF
		
		-- OBJECT REFS
		Ob.dusterFX = nil	-- reference to the FX
		Ob.grabber = nil	-- reference to grabber part of cobwebDuster
		Ob.target = nil
		-- END OBJECT REFS
		
		-- SPLINE REF
		Ob.splineHandle = nil
		Ob.lastSplinePoint = '2'
		-- END SPLINE REF
		
		-- BOOLS
		Ob.bDusting = 0
		Ob.bShooting = 0
		Ob.bCollectFailed = 0
		-- END BOOLS
		
		Ob.dependencies = {
			meshes = {
				Ob.meshName,
				'GlobalModels/Objects/HeldObjects/Duster_Spinners.plb',
			},
			scripts = {
				'Global.Props.MovingSphere',
				'Global.Effects.DusterEndFX',
			},
			textures = {
				'Textures/woodplank.tga',
			},
		}		
	end
    

--************************************************************************************************* 	

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		if self.grabber == nil then
			local editvars = constructEditvarString('meshName', 'GlobalModels/Objects/HeldObjects/Duster_Spinners.plb', 'bLoadMeshLockTextures', 1,'collSphereRadius', 20, 'bApplyGravity', 0, 'bCollidee', 0, 'bCollider', 0)
			self.grabber = SpawnScript('Global.Props.MovingSphere', self.Name .. 'Grabber', editvars)
			self.grabber.duster = self
				self.grabber.setAnim = function(self, destAnim, block)
					self.duster:setAnim(destAnim, self, block)
				end
			self.grabber.onSplinePointArrive = function(self, data,from)
					self.duster:onSplinePointArrive(data,from)
				end
			self.grabber.onNewMoveCollide = function(self, nx, from, ny, nz)
					self.duster:onNewMoveCollide(nx, from, ny, nz)
				end
			self:attachGrabber(1)
		end
	end
	function Ob:onBeginLevel()	

		%Ob.Parent.onBeginLevel(self)
        	self.splinePts = {}
		self.grabber:setPosition(self.grabberOffX, self.grabberOffY, self.grabberOffZ)
		self.grabber:setOrientation(0,0,0)
        -- setup the FX	-- FX get screwed up between levels so lets just load it every level.  shhhh... dont tell anyone
		if not self.dusterFX or IsDead(self.dusterFX) == 1 then
			local oldFX = FindScriptObject('CobwebDusterFX', 1)
			if oldFX and IsDead(oldFX) ~= 1 then
				self.dusterFX = oldFX
			else
				self.dusterFX = SpawnScript('Global.Effects.DusterEndFX', 'CobwebDusterFX')
			end
			self.dusterFX:attach(self.grabber)
		end
		-- Need to make sure we dont block during the playing of these anims during setup since we cant yield without a thread
		self:setAnim('DusterRetract', self, 0)	-- our setAnim Function takes animName, entity, and block
		self.hHoseTexture = LoadTexture('Textures/woodplank.tga')
		self.hosePeriod = 0.5
		self.hoseSplineThickness = 5
		self.hoseSplineDensity = 0.02
		self.hoseSplineResolution = 4

		self.rGrabberShootSoundHandle = LoadSound('CobwebDusterGrabberOut')
		self.rGrabberRetractSoundHandle = LoadSound('CobwebDusterGrabberIn')
		self.rCoilInSoundHandle = LoadSound('CobwebDusterCoilIn')
		self.rCoilOutSoundHandle = LoadSound('CobwebDusterCoilOut')
		self.bUsingLoom = 0

		

		self:setState(nil)	
	end                                               

	function Ob:onPostBeginLevel()

		%Ob.Parent.onPostBeginLevel(self)
		if GetEntityDomain(self.grabber) ~= 'InvItems' then 
			self.grabber:setAnim('GrabberRetract') 
		end-- grabber's setAnim only takes animName and block

		
		--edit to work properly inside the shop, no animation or interestFX
		local cobweb = FindScriptObject('RandoSeed')
		if cobweb.randomizecobwebduster == FALSE and (Global.player:isInInventory('CobwebDuster') ~= 1) then
			self.bSold = 0
			self.interestFX:stop(1, 0, 1)
			self.interestFX = nil
			DetachEntityFromParent(self)
			KillScript(self.mover)
			self.mover = nil
			
		end
	

	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		if self.grabber ~= nil then
			self.grabber:killSelf()
			self.grabber = nil
		end
	end
	
--************************************************************************************************* 	
	-- This function shoots out the grabber then transitions to the duster moving state
	function Ob:stateShootDuster()
		if not self.target then
			self.bDusting = 0
			self.bDontPack = 0	-- Raz is now allowed to put the duster in his backpack if he wants
			self:setState(nil)
        else
			self.bShooting = 1
			self:setupShootSpline()
			LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan', 1, 0, 0)
			self:setAnim('DusterShoot')
			self:playSound(self.rCoilOutSoundHandle)
			self.grabber:setAnim('GrabberShoot')
			self:playSound(self.rGrabberShootSoundHandle)
			self:renderHose()
			self:setState('DusterMoving')
		end
	end

--************************************************************************************************* 	
	-- This function is for updating the "duster tube" effect every frame and the grabber if needeed
	function Ob:beginStateDusterMoving()
		LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan', 1, 0, 0)
        self.grabber:setAnim('GrabberSpin')
		self:attachGrabber(0)
		UsePath(self.splineHandle, self.grabber, self.splineTime, kSPLINEPATH_ONCE)
	end

	function Ob:stateDusterMoving()
        -- INSERT GRABBER HOSE API CALL
		self:renderHose()
	end

--************************************************************************************************* 	
	-- This function should be called when the grabber reaches the cobweb.
	-- This function plays the collection effect then transitions to the retraction state
	function Ob:beginStateCollectCobweb()
		-- stop the out sound
		self:stopSound(self.rCoilOutSoundHandle)
		self.dusterFX:run()
		self.target:collect()
	end

	function Ob:stateCollectCobweb()
 		self:renderHose()
	end

	function Ob:endStateCollectCobweb()
		if (self.bUsingLoom == 1) then
			self:destroySpline()		
			self.bUsingLoom = 0
		end
	end

--************************************************************************************************* 	
	-- This function is for updating the "duster tube" effect every frame as the grabber retracts after grabbing
	-- a cobweb.
	
	function Ob:beginStateRetracting()
		self:stopSound(self.rCoilOutSoundHandle)
		self:playSound(self.rCoilInSoundHandle)		
		self:setupRetractSpline()
        LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan', 1, 0, 0)
		self:setAnim('DusterRetract')
		UsePath(self.splineHandle, self.grabber, self.splineTime, kSPLINEPATH_ONCE)
 		self:renderHose()
	end
	
	function Ob:stateRetracting()
		local x,y,z = self:getGrabberAttachment()
		self.splinePts[1] = { xpos = x, ypos = y, zpos = z }
		AdjustSplinePath(self.splineHandle, 0, self.splinePts)
		local dist = self:renderHose()
		if dist > 3000 then -- safety for teleportation
			self:setState(nil)
		end
	end

	function Ob:endStateRetracting()
		-- stop the in sound
		self:stopSound(self.rCoilInSoundHandle)
		self:playSound(self.rGrabberRetractSoundHandle)		
		self.grabber:setAnim('GrabberRetract')
		self.dusterFX:stop(1)
        LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan', 1, 0, 0)
		self:attachGrabber(1)
		if self.bCollectFailed == 1 then
			self.bCollectFailed = 0
		else
			self.target:die()
		end
		self.target = nil
        self.bDusting = 0
		self.bDontPack = 0	-- Raz is now allowed to put the duster in his backpack if he wants
	end

--************************************************************************************************* 
-- MESSAGE HANDLERS
--*************************************************************************************************

	function Ob:onActivateFromInventory(data, from)
		if Global.cutsceneScript.cutscenePlaying == 1 then return end
        if self.bDusting ~= 1 then
			self.bDontPack = 1	-- this prevents raz from putting away the item until we are finished
			self.target = GetLookTarget(Global.player)	-- checking against nil target is done in the shootduster state
			if (self.target == nil or self.target.Type ~= 'Global.Props.CobwebDuster') then
				self.bDusting = 1
				self:setState('ShootDuster')
			end
		end
	end

--************************************************************************************************* 
	function Ob:onDomainChange(old, new)
		if (new ~= 'Dummy') then
			if (self.grabber) then
				SetEntityDomain(self.grabber,new)
			end
			if self.dusterFX then 
				SetEntityDomain(self.dusterFX,new)
				self.dusterFX:onDomainChange(old, new)
			end
			
			%Ob.Parent.onDomainChange(self, old, new)
		end
	end	
	

--************************************************************************************************* 
	function Ob:onNewMoveCollide(nx, from, ny, nz)
		if (%Ob.Parent.onNewMoveCollide) then
			%Ob.Parent.onNewMoveCollide(self, nx, from, ny, nz)
		end
		if from ~= 'Global' and self.bShooting == 1 then
			self.bShooting = 0
			self.bUsingLoom = 0
			if strlower(from.Type) == 'global.collectibles.cobweb' then
				self:destroySpline()
				self:setState('CollectCobweb')
			-- the loom acts like a cobweb, and calls cobweb done on the duster
			elseif strlower(from.Type) == 'global.props.cobwebloom' then
				from:onItem(self.Name, Global.player)
				self:setState('CollectCobweb')
				self.bUsingLoom = 1
			else
				self:sendMessage(from, 'Dusted')
				self:destroySpline()
				self.bCollectFailed = 1
				self:setState('Retracting')
			end
        end
    end
--************************************************************************************************* 
	
	 function Ob:onSplinePointArrive(data,from)
		if data == self.lastSplinePoint then
			if self.bShooting == 1 then
				self:destroySpline()
                self.bShooting = 0
				if self.target and strlower(self.target.Type) == 'global.collectibles.cobweb' then
					self:setState('CollectCobweb')
				-- the loom acts like a cobweb, and calls cobweb done on the duster
				elseif self.target and strlower(self.target.Type) == 'global.props.cobwebloom' then					
					self.target:onItem(self.Name, Global.player)
					self:setState('CollectCobweb')
					self.bUsingLoom = 1
				else
					if self.target then self:sendMessage(self.target, 'Dusted', 1) end
					self.bCollectFailed = 1
					self:setState('Retracting')
				end
				return
			elseif self.state_name == 'Retracting' then
				self:destroySpline()
				self:setState(nil)
				return
			else
				GamePrint('ERROR: Cobweb duster got onSplinePointArrive while not shooting and not retracting.')
			end
		end
	end
--************************************************************************************************* 
	function Ob:cobwebDone()	-- called by Global.Collectibles.Cobweb.lua
		self:setState('Retracting')
	end

--************************************************************************************************* 
--***F U N C T I O N S***************************************************************************** 
--************************************************************************************************* 

--************************************************************************************************* 
	-- This is my own version of setAnim since we dont inherit from Animator.
	-- Thus I make lots of assumptions as to how my anims table is set up and what data is there
	-- This function can plan blocking or nonblocking anims.
	-- I wanted to create this function so that I can play blocking anims as many times as I want without
	-- having to do the "GetAnimCompletion" calls every time I played a blocking anim, and for other similar reasons
	  
	
	function Ob:setAnim(destAnim, entity, block)
		local tableEntry = self.animsTable[destAnim]
		
		-- Get relevant info from table entries
		local blendTime, loop, priority, fileName
		blendTime = tableEntry.blendTime or 0
		loop = tableEntry.loop or 1	-- Looping defaults to true if we arent blocking
		block = block or tableEntry.block or 0
		fileName = tableEntry.fileName
        entity = entity or self
		
		
		block = block or 0
		if block == 1 then
			loop = 0
		end
        
		if fileName ~= entity.currentAction or entity.bLooping ~= 1 then
			LoadAnim(entity, fileName, blendTime, loop)
			-- Store our current anim filename and table entry, if applicable
			entity.currentAction = fileName
			entity.currentActionTableEntry = tableEntry
			entity.bLooping = loop
		end
		if block == 1 then
			Yield()
			local result = GetAnimCompletion(entity, priority, fileName)
			while result and (result < 1) do 
				Yield()
				result = GetAnimCompletion(entity, priority, fileName)
			end
		end
	end
	
--************************************************************************************************* 

	function Ob:setupShootSpline()
		self:destroySpline()
		local x,y,z = self.grabber:getPosition()
		self.splinePts[0] = { xpos = x, ypos = y, zpos = z }   
		if self.target.grabberOffsetX ~= nil then
			x,y,z = self.target:getPosition()
			x = x + self.target.grabberOffsetX
			y = y + self.target.grabberOffsetY
			z = z + self.target.grabberOffsetZ
		else
			x,y,z = self.target:getHead()
		end
		self.splinePts[1] = { xpos = x, ypos = y, zpos = z }
		local dist = self.grabber:distance(self.target)
		self.splineTime = dist / self.speed
		self.splineHandle = CreateSplinePath( kSPLINEPATH_ONCE, self.splinePts )	
	end

  	function Ob:renderHose()
		local sx,sy,sz = self:getGrabberAttachment() -- GetJointWorldPos(self, 'nobJ_1')
		local tx,ty,tz = self.grabber:getPosition()

		local period = self.hosePeriod
		local cycleTime = GetPeriodicGameTimeSecs(period)
		local t
 		local spts = {}
		spts[0] = { xpos = sx, ypos = sy, zpos = sz }
		spts[1] = { xpos = sx+0.1*(tx-sx), ypos = sy+0.1*(ty-sy), zpos = sz+0.1*(tz-sz) }
		t = (cycleTime/period + 0.35) * 360
		spts[2] = { xpos = sx+0.35*(tx-sx), ypos = sy+0.35*(ty-sy)+15*sin(t), zpos = sz+0.35*(tz-sz) }
		t = (cycleTime/period + 0.65) * 360
		spts[3] = { xpos = sx+0.65*(tx-sx), ypos = sy+0.65*(ty-sy)+15*sin(t), zpos = sz+0.65*(tz-sz) }
		spts[4] = { xpos = sx+0.9*(tx-sx), ypos = sy+0.9*(ty-sy), zpos = sz+0.9*(tz-sz) }
		spts[5] = { xpos = tx, ypos = ty, zpos = tz }
		RenderSpline(self.hHoseTexture, self.hoseSplineThickness, self.hoseSplineDensity, self.hoseSplineResolution, spts)
		return GetDistance(sx, sy, sz, tx, ty, tz)
	end

--************************************************************************************************* 
	function Ob:setupRetractSpline()
		self:destroySpline()
		local x,y,z = self:getPosition() -- XXX this should really be the attachment position for the grabber
        self.splinePts[1] = { xpos = x, ypos = y, zpos = z }
		x,y,z = self.grabber:getPosition()
		self.splinePts[0] = { xpos = x, ypos = y, zpos = z }   
		local dist = self.grabber:distance(self)
		self.splineTime = dist / self.speed
        self.splineHandle = CreateSplinePath( kSPLINEPATH_ONCE, self.splinePts )	
	end
--*************************************************************************************************
	function Ob:destroySpline()
		if self.splineHandle then
			DetachFromSpline(self.grabber)
			self.grabber:setVelocity(0,0,0)
			DestroyPath(self.splineHandle)
			self.splineHandle = nil
		end
	end
--************************************************************************************************* 
	function Ob:attachGrabber(bool)
		if bool == 1 then
			AttachEntityToEntity(self.grabber,self)
			self.grabber:setPosition(self.grabberOffX, self.grabberOffY, self.grabberOffZ)
			self.grabber:setOrientation(0,0,0)
		else
			DetachEntityFromParent(self.grabber)
		end
	end
--************************************************************************************************* 
	function Ob:getGrabberAttachment()
		local x,y,z = self:getPosition()
		local pitch,yaw,roll = self:getOrientation()
		local dx,dy,dz = RotateVector(pitch, yaw, roll, self.grabberOffX, self.grabberOffY, self.grabberOffZ)
		return x+dx, y+dy, z+dz
	end
	
--************************************************************************************************* 

	function Ob:makeInvisible(bAlpha)
		%Ob.Parent.makeInvisible(self, bAlpha)
		self.grabber:makeInvisible(bAlpha)
	end

	function Ob:makeVisible()
		%Ob.Parent.makeVisible(self)
		self.grabber:makeVisible()
	end

	function Ob:setInvisibility(bSet)
		%Ob.Parent.setInvisibility(self, bSet)
		if ( self.grabber ) then
			self.grabber:setInvisibility(bSet)
		end
	end

	function Ob:onAddedToInventory(data, from)		
		%Ob.Parent.onAddedToInventory(self, data, from)

		if (self.bReincarnated ~= 1) then
			Global.player:collectDusterText()
			Global:saveGlobal('CobwebDusterCollected', 1)
			Global.goalManager:deactivate('CobwebDuster')
		end

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

		
	end

	function Ob:onHidItem()
		if self.rCoilOutSoundHandle then
			self:stopSound(self.rCoilOutSoundHandle)
		end
		if self.rCoilInSoundHandle then
			self:stopSound(self.rCoilInSoundHandle)		
		end
	end

	function Ob:killSelf(bKillButDontRemoveFromInventory)
		if self.grabber and IsDead(self.grabber) ~= 1 then
			self.grabber:killSelf()
		end
		%Ob.Parent.killSelf(self, bKillButDontRemoveFromInventory)
	end
	
   	return Ob
end

-- 	DEBUG LINES FOR CUTTING AND PASTING INTO DOUGIE
--	Global.player:addToInventory(SpawnScript('Global.Collectibles.CobwebDuster', 'duster', '', 1))
--	Global.player:removeFromInventory(fso('duster'))
