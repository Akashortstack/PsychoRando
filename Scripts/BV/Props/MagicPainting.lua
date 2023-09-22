function MagicPainting(Ob)
	if (Ob == nil) then
		Ob = CreateObject('BV.Props.ShopItem')
		Ob.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_MagicPainting.plb' -- Editable
		-- Currently allowed values: Ladder, Window
		Ob.sPaintingType = 'Window' -- Editable
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan'
		Ob.HeldPosX = 32.0   
		Ob.HeldPosY = -60.2    
		Ob.HeldPosZ = 23.9    
		Ob.HeldRotX = 161.923
		Ob.HeldRotY = 59.341  
		Ob.HeldRotZ = -74.026
		Ob.bLarge = 1
		Ob.invSortKey = 10
		Ob.bAddToInv = 1
        -- if you dont want the player to put it back in the sack
		--Ob.bDontPack = nil -- Editable 
		-- if you want it to be in his hands immediately
		Ob.bAutoSelect = nil -- Editable		
		--Ob.heldscale = .2
		Ob.bPutAwayOnMelee = 1
		Ob.dependencies = {
			meshes = { 'Levels/BV_BlackVelvetopia/Props/WindowpaintingExpanded.plb',
						'Levels/BV_BlackVelvetopia/Props/BVRB_RosePainting_Bloom.plb',
						'Levels/BV_BlackVelvetopia/Props/BVRB_VinePainting_Grow.plb',
						'Levels/BV_BlackVelvetopia/Props/BV_ladderpainting.plb',
						'Levels/BV_BlackVelvetopia/Props/BV_windowpainting.plb',
						'Levels/BV_BlackVelvetopia/Props/BV_rosepainting.plb',
						'Levels/BV_BlackVelvetopia/Props/BV_vinepainting.plb',
						'Levels/BV_BlackVelvetopia/Props/BVES_PortalPainting.plb',
						'Levels/BV_BlackVelvetopia/Props/ArchwayPaintingInventory.plb',
						},
			textures = {
				'Textures/ParticleTextures/bv_rosepetal.dds',
				'Textures/icons/inventoryitems/rosepainting.dds',
				'Textures/icons/inventoryitems/windowpainting.dds',
				'Textures/icons/inventoryitems/vinepainting.dds',
				'Textures/icons/inventoryitems/ladderpainting.dds',
				'Textures/icons/inventoryitems/archwaypainting.dds',
			},
			scripts = {
				'BV.Props.Rose',
				'BV.Effects.GuitarPaintFX',
				'BV.Effects.TikiPaintFX',
				'BV.Effects.RoseArtFX',
				'BV.Effects.VinePaintFX',
				'BV.Props.MagicPaintingLadder',
				'gen_proploader',
				'BV.Props.MagicPaintingArchway',
			},
			animations = {
				'anims/dartnew/hangpainting.jan',
			},
		}
		Ob.ownerName = 'DUMMY_OWNER_NAME' -- so that the 'is clairvoyable' check in the engine won't fail.
	end

	function Ob:onPreBeginLevel()
		if self.sPaintingType == 'Edgar' then
			self:killSelf()
			return
		end
		%Ob.Parent.onPreBeginLevel(self)
		if Global.player.saved.BV[self:getSaveGameName()] or Global.player:isInInventory(self.Name) == 1 then 
			self.bSold = 1
		end
	end

	function Ob:onBeginLevel()
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		if self.sPaintingType == 'Ladder' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_ladderpainting.plb'
			self.pickupSpriteName = 'LadderPainting'
			self.vfx = SpawnScript('BV.Effects.GuitarPaintFX')
			--edit name, NEEDS LOCALIZATION
			self.displayName = "Guitar Painting"--DIALOG=<<Guitar Painting>>
		elseif self.sPaintingType == 'Window' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_windowpainting.plb'
			self.pickupSpriteName = 'WindowPainting'
			self.vfx = SpawnScript('BV.Effects.TikiPaintFX')
			--edit name, NEEDS LOCALIZATION
			self.displayName = "Window Painting"--DIALOG=<<Window Painting>>
		elseif self.sPaintingType == 'Rose' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_rosepainting.plb'
			self.pickupSpriteName = 'RosePainting'
			self.vfx = SpawnScript('BV.Effects.RoseArtFX')
			--edit name, NEEDS LOCALIZATION
			self.displayName = "Rose Painting"--DIALOG=<<Rose Painting>>
		elseif self.sPaintingType == 'Vine' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_vinepainting.plb'
			self.pickupSpriteName = 'VinePainting'
			self.vfx = SpawnScript('BV.Effects.VinePaintFX')
			--edit name, NEEDS LOCALIZATION
			self.displayName = "Vine Painting"--DIALOG=<<Vine Painting>>
		elseif self.sPaintingType == 'Edgar' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/BVES_PortalPainting.plb'
			self.pickupSpriteName = 'BVESPortalPainting'
		elseif self.sPaintingType == 'Archway' then
			self.meshName = 'Levels/BV_BlackVelvetopia/Props/ArchwayPaintingInventory.plb'
			self.pickupSpriteName = 'ArchwayPainting'  -- need to get a sprite
			SetEntityVisible(FindScriptObject('NewIntro_WindowPaintingCap'), 0)
			--edit name, NEEDS LOCALIZATION
			self.displayName = "Archway Painting"--DIALOG=<<Archway Painting>>
		end
		%Ob.Parent.onBeginLevel(self)
		self.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan'
		-- set up hold offsets for each painting
		if self.sPaintingType == 'Ladder' then
			self.HeldPosX = 30.5   
			self.HeldPosY = 3.8  
			self.HeldPosZ = 2.9    
			self.HeldRotX = 151.229
			self.HeldRotY = 34.367 
			self.HeldRotZ = -80.217
		elseif self.sPaintingType == 'Window' then
			self.HeldPosX = 32.2   
			self.HeldPosY = 3.9  
			self.HeldPosZ = -11.6    
			self.HeldRotX = 149.054
			self.HeldRotY = 34.715 
			self.HeldRotZ = -83.026
		elseif self.sPaintingType == 'Rose' then
			self.HeldPosX = 25.0   
			self.HeldPosY = -0.1  
			self.HeldPosZ = 6.4    
			self.HeldRotX = 156.188
			self.HeldRotY = 34.672 
			self.HeldRotZ = -83.12
		elseif self.sPaintingType == 'Vine' then
			self.HeldPosX = 42.9   
			self.HeldPosY = 4.3  
			self.HeldPosZ = -1.8    
			self.HeldRotX = 154.102
			self.HeldRotY = 38.626 
			self.HeldRotZ = -70.265
		elseif self.sPaintingType == 'Edgar' then
			self.HeldPosX = 17.7   
			self.HeldPosY = -0.8  
			self.HeldPosZ = 0.2    
			self.HeldRotX = 146.492
			self.HeldRotY = 34.945 
			self.HeldRotZ = -92.699
		elseif self.sPaintingType == 'Archway' then
			self.HeldPosX = 17.7   
			self.HeldPosY = -0.8  
			self.HeldPosZ = 0.2    
			self.HeldRotX = 146.492
			self.HeldRotY = 34.945 
			self.HeldRotZ = -92.699
		end
		
		self:shutOffCollision()
		self.levelScript = FindScriptObject('LevelScript')

		self.soundWindowOpen = LoadSound('Window_Grow')
		self.soundWindowClose = LoadSound('Window_Shrink')
		self.soundRose = LoadSound('RoseGrow')
		self.rPaintingMagicSound = LoadSound('MagicPainting')				
		self.soundVineGrow = LoadSound('VinePainting')
		
		SetSimulationCullDistance( self, 5000)
	end

	function Ob:getSaveEditables()
		return 'self.meshName = \''..self.meshName..'\' self.sPaintingType = \''..self.sPaintingType..'\' '..%Ob.Parent.getSaveEditables(self)
	end

	function Ob:fetchAppropriateEntities()
		if self.sPaintingType == 'Ladder' then
			self.spawnedEntity = self:spawnAdditionalEntity('BV.Props.MagicPaintingLadder', self.Name..'ladder', '')
		elseif self.sPaintingType == 'Window' then
			self.spawnedEntity = self:spawnAdditionalEntity('gen_proploader', self.Name..'Expanded', 'self.meshname=\'Levels/BV_BlackVelvetopia/Props/WindowpaintingExpanded.plb\'')
			SetEntityFlag(self.spawnedEntity, ENTITY_NOSIMULATE, 0)
			SetEntityFlag(self.spawnedEntity, ENTITY_CANNOTBESTOODON, 0)
			SetEntityCollideGeometry(self.spawnedEntity)
			SetPhysicsFlag(self.spawnedEntity, PHYSICS_COLLIDEE, 0)
			RegisterTriggerVolume(self, 'tv_secretroom1')
			RegisterTriggerVolume(self, 'tv_secretroom2')
			RegisterTriggerVolume(self, 'tv_secretroom3')
			-- not in demo level, *sigh*
            if TriggerOBB_Lookup(nil, 'tv_secretroom4') then
				RegisterTriggerVolume(self, 'tv_secretroom4')
			end
		elseif self.sPaintingType == 'Archway' then
			RegisterTriggerVolume(self, 'tv_secretroom1')
			self.spawnedEntity = self:spawnAdditionalEntity('BV.Props.MagicPaintingArchway', self.Name..'Animated', '')
		elseif (self.sPaintingType == 'Rose' and (Global.levelScript.Type == 'bv.BVRB' or Global.levelScript.Type == 'bv.BVRD')) then
			self.spawnedEntity = self:spawnAdditionalEntity('BV.Props.Rose', self.Name..'Rose', '')
			self.animatedRose = self:spawnAdditionalEntity('ScriptBase', self.Name..'Animated', '')
			self.animatedRose:loadMesh('Levels/BV_BlackVelvetopia/Props/BVRB_RosePainting_Bloom.plb')
		elseif self.sPaintingType == 'Stairs' then
		elseif self.sPaintingType == 'Vine' then
			self.spawnedEntity = self:spawnAdditionalEntity('ScriptBase', self.Name..'Animated', '')
			self.spawnedEntity:loadMesh('Levels/BV_BlackVelvetopia/Props/BVRB_VinePainting_Grow.plb')
			--SetEntityCollideGeometry(self.spawnedEntity)
			SetPhysicsFlag(self.spawnedEntity, PHYSICS_COLLIDEE, 0)
			SetMeshIsBackwards(self, 1)
		elseif self.sPaintingType == 'Edgar' then
			RegisterTriggerVolume(self, 'tv_EdgarPaintingMagicHook01')		
			if TriggerOBB_Lookup(nil, 'tv_EdgarPaintingMagicHook02') then RegisterTriggerVolume(self, 'tv_EdgarPaintingMagicHook02') end
			RegisterTriggerVolume(self, 'tv_EdgarPaintingMagicHook03')			
			RegisterTriggerVolume(self, 'tv_EdgarPaintingMagicHook04')				
			local x,y,z = self:getPosition()
			self.emitter = CreateParticleEmitter(self.Name .. 'Emitter',500) -- Change name if needed
			local fx,fy,fz = GetEntityForwardVector(self)
			fx,fy,fz = RotateVector(0,180,0,fx,fy,fz)
			SetPosition(self.emitter, x+fx*200, y+fy*200+200, z+fz*200)
			--AttachEntityToEntity(self.emitter, self, 1)
			local ox,oy,oz = self:getOrientation()
			SetOrientation(self.emitter, ox,oy+5,oz)
			PESetDistribution(self.emitter,kPD_BOX,kPDV_NONE,-250,-300,-250,250,300,250)
			PESetParticleForce(self.emitter,-fx*100,-fy*100,-fz*100)
			PESetParticleBlendMode(self.emitter,kBLENDMODE_ALPHA_BLEND)
			PESetApplyGravity(self.emitter,0)
			PESetPointSprite(self.emitter,0)
			PESetZSprite(self.emitter,0)
			PESetNoSpread(self.emitter,0)
			PESetRelative(self.emitter,0)
			PESetOriented(self.emitter,0)
			PESetCollideWithGround(self.emitter,0)
			PESetConeAngle(self.emitter,0,180)
			PESetParticleSpeed(self.emitter,3,5)
			PESetParticleSize(self.emitter,15,30)
			PESetParticleRotation(self.emitter,-90,90,1)
			PESetParticleLifetime(self.emitter,2,2)
			PESetParticlesPerSec(self.emitter,10,30)
			PESetStartColor(self.emitter,255,255,255,20)
			PESetEndColor(self.emitter,255,255,255,200)
			PESetTexture(self.emitter,'Textures/ParticleTextures/bv_rosepetal.dds')		
			self.affector = CreateSphericalParticleAffector(self.Name .. 'Affector',400.000,1,0,0.000)
			SetPosition(self.affector, x+fx*-50, y+300, z+fz*-50)
			--AttachEntityToEntity(self.affector, self, 1)
			SetPrimaryAffector(self.emitter,self.affector)	
			PESetActive(self.emitter,0)		
		end
	end

	-- This field gets stored in Raz, and the value is the name of the hook the painting is hung on.
	function Ob:getSaveGameName()
		return self.Name..'Hanger'
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self:fetchAppropriateEntities()
		if Global.player.saved.BV[self:getSaveGameName()] then 
			self:beNotPickupable()
			self.bLoading = 1
			local hungOn = FindScriptObject(Global.player.saved.BV[self:getSaveGameName()])
			self:hangImmediately(hungOn)
			--self:onHung(hungOn, hungOn)			
		else
			self:setState(nil)
		end
	end

	-- **************************** VINE *******************************

	function Ob:stateVineHung()
		self.hung = 1
		if self.from.Name == 'MagicHook03' then self:turnOnCollision() 
		else
			SetEntityCollideGeometry(self)
			SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		end
		SetEntityVisible(self.spawnedEntity, 1)
		SetEntityAlpha(self.spawnedEntity, 1, 0)
		local ox, oy, oz = self:getOrientation()
		oy = oy + 90
		self.spawnedEntity:setOrientation(ox, oy, oz)
		self.spawnedEntity:setPosition(self:getPosInFrontOf(100))
		if (self.bLoading ~= 1) then
			-- do the cam stuff
			Global.levelScript.cutsceneScript:runCutscene('VinePaintingHung', 1, 0, 0, nil, nil, nil, 1)
		end
		SetEntityAlpha(self, 0, 1)
		self:shutOffCollision()
		SetEntityVisible(self.spawnedEntity, 0)
		self.from:vineUp(self.bLoading)
		self.bLoading = 0
		self:setState(nil)
	end

	function Ob:stateDisappearVine()
		self.levelScript:beginCutscene('DisappearVine', self, 1)
		self.from:vineDown()
		self.hung = 0
		SetEntityAlpha(self, 1, 1)
		self:turnOnCollision()
		
		%Ob.Parent.addToInventory(self)
		self.levelScript:endCutscene('DisappearVine')
		self:setState(nil)
	end

	-- **************************** ROSE *******************************

	function Ob:stateRoseHung()
		if self.bLoading == 1 then
			self:killSelf()
			self:setState(nil)
			return
		end
		self:setHookVisible(1) 
		PlaySound(self, self.soundRose)
		SetEntityAlpha(self.from, 0, 0)
		SetEntityAlpha(self, 0, 1)
		self.animatedRose:setPosition(self:getPosInFrontOf(-100))		
		self.animatedRose:setOrientation(self:getOrientation())
		-- run the rose anim
		LoadAnim(self.animatedRose, 'Anims/BVRB/BVRB_RosePainting_Bloom.jan', 0, 0)
		
		if (self.vfx) then 
			--AttachEntityToEntity(self.vfx, self.animatedRose, 0)
			self.vfx:attach(self.animatedRose, 'stem_joint1')
			self.vfx:run()
		end
		
		SetEntityVisible(self.animatedRose, 1)
		SetEntityAlpha(self.animatedRose, 0,0)
		SetEntityAlpha(self.animatedRose, 1, 1)

--		self:sleep(1)
		
		
		
		while (GetAnimCompletion(self.animatedRose) ~= 1) do
			Yield()
		end		
		SetEntityVisible(self.animatedRose, 0)
		self.vfx:stop()
		
		SetEntityAlpha(self.spawnedEntity, 1, 0)
		SetEntityVisible(self.spawnedEntity, 1)
		self.spawnedEntity:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
		SetMaxViewDistance(self.spawnedEntity, 350)
		local sx, sy, sz = self:getPosition()
		local fx, fy, fz = GetEntityForwardVector(self)
		fx = -1*fx fy = -1*fy fz = -1*fz
		self.spawnedEntity:setPosition(sx+fx*75, sy+fy*75, sz+fz*75)
		local ox, oy, oz = self:getOrientation()
		self.spawnedEntity:setOrientation(ox, oy+90, oz)
		Yield()
		self.spawnedEntity:addToInventory()
		self:sleep(1)
		if self.from then
			self.from:setEntityInterestLevel(kOBJECTMINOR_INTEREST)
		end 
		SetEntityAlpha(self.from, 1, 1)
		self:setState(nil)
		self:killSelf()
	end

	-- **************************** LADDER *******************************

	function Ob:stateLadderHung()
		self.hung = 1
		SetEntityAlpha(self, 0, 1)
		self.spawnedEntity.hook = self.from
		self.spawnedEntity:setPosition(self:getPosition())
		self.spawnedEntity:setOrientation(self:getOrientation())
		self.spawnedEntity:extend(self.bLoading)
		self:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
		SetMaxViewDistance(self, 400)
		self.bLoading = 0
		self:setState(nil)
	end

	function Ob:stateDisappearLadder()
		self.levelScript:beginCutscene('DisappearLadder', self, 1)
		SetEntityAlpha(self, 1, 1)
		self.spawnedEntity:retract()
  		self.spawnedEntity:setPosition(-10000, -10000, -10000)
  		self.spawnedEntity:setEntityInterestLevel(0)
		self.hung = 0
		%Ob.Parent.addToInventory(self)
		self.levelScript:endCutscene('DisappearLadder')
		self:setState(nil)
	end

	-- **************************** WINDOW *******************************

	function Ob:stateWindowHung()
		self.hung = 1
		if self.from.normalWall then 
			if self.bLoading ~= 1 then
				PlaySound(self, self.soundWindowOpen)
			end
			
			SetEntityVisible(self.spawnedEntity, 1)
			SetEntityAlpha(self.spawnedEntity, 0, 0)
            LoadAnim(self.spawnedEntity, 'Anims/BVRB/BVRB_TikiHutPainting_Expand.jan', 0, 0)
			self:sleep(0.1)
--			if self.from.Name == 'MagicHook03' then
--				local ox, oy, oz = self.from:getOrientation()
--				self.spawnedEntity:setOrientation(ApplyOrientation(ox, oy, oz, 0, 0, 20))
--				ox, oy, oz = self.from:getPosition()
--				self.spawnedEntity:setPosition(ox, oy+270, oz+170)
--			else
				self.spawnedEntity:setOrientation(self.from:getOrientation())
				--self.spawnedEntity:setPosition(self.from:getPosition())
				self.spawnedEntity:setPosition(self.from:getPosInFrontOf(0, -50))
--			end
			SetEntityAlpha(self.spawnedEntity, 1, 1)
			SetEntityAlpha(self.from, 0, 1)
			local frames = 0
			
			if self.bLoading ~= 1 and self.from and self.from.Name == 'MagicHook02' and GetPlayerDist(self) < 500 then
				self.levelScript.camControl:pushAndSetScript(self)
				local shot1cam = {} 
				local cx,cy,cz = GetCameraPosition()
				local cox,coy,coz = GetCameraOrientation()
				local fov = GetCameraFieldOfView()
				shot1cam[0] = {xpos = cx, ypos = cy, zpos = cz, xang = cox, yang = coy, zang = coz, field_of_view = fov}
				shot1cam[1] = {xpos = -3179, ypos = 3513, zpos = -12636, xang = -6, yang = -95, zang = 0, field_of_view = fov}
				self.shot1pathID = CreateCameraPath(shot1cam, 4 , 0.5 , 0.5)
				RunCameraPath(self.shot1pathID,0)
			end
			self.from:setWallCollision(0)
			SetPhysicsFlag(self.spawnedEntity, PHYSICS_COLLIDEE, 1)
			self:sleep(2)
			SetEntityAlpha(self, 0, .5)

			self:sleep(1)
			self.from:alphaWallVisuals(0, 1)
			self:sleep(1)

			if self.from.Name == 'MagicHook04' then
				-- shut off the collision
				-- get the associated script objects
				local CollisionWithoutPainting = FindScriptObject('NewIntro_CollisionWithoutPainting')
				local WallOpen = FindScriptObject('NewIntro_WallOpen')
				local WindowPaintingCap = FindScriptObject('NewIntro_WindowPaintingCap')
				-- turn off archway
				if (CollisionWithoutPainting and WallOpen and WindowPaintingCap) then
					SetEntityVisible(WallOpen, 1)
					SetEntityVisible(CollisionWithoutPainting, 1)
					SetPhysicsFlag(CollisionWithoutPainting, PHYSICS_COLLIDEE, 0)
					SetEntityVisible(WindowPaintingCap, 1)
				else
					GamePrint('ERROR: necessary objects not found')
				end
			end
			
			if self.bLoading ~= 1 and self.from and self.from.Name == 'MagicHook02' and GetPlayerDist(self) < 500 then
				DeleteCameraPath(self.shot1pathID)
				self.levelScript.camControl:removeCam(self)
			end
		elseif self.bLoading ~= 1 then
			PrintNote('Windows do not currently work on this hook.')
		end
		self.bLoading = 0
		self:setState(nil)
	end

	function Ob:stateDisappearWindow()
		if self.from.normalWall then
			self.levelScript:beginCutscene('DisappearWindow', self, 1)
			PlaySound(self, self.soundWindowClose)
			self.from:alphaWallVisuals(1, 1)
			SetEntityAlpha(self.from, 1, 1) 
			SetEntityAlpha(self, 1, 1) 
			SetEntityAlpha(self.spawnedEntity, 0, 1) 

			LoadAnim(self.spawnedEntity, 'Anims/BVRB/BVRB_TikiHutPainting_Contract.jan', 0, 0)

			local frames = 0
			while frames < 60 do
				frames = frames + GetFrame60ths()
				Yield()
			end
			SetPhysicsFlag(self.spawnedEntity, PHYSICS_COLLIDEE, 0)
			SetEntityVisible(self.spawnedEntity, 0)
			self.from:setWallCollision(1)
		end
		self.hung = 0

		if self.from.Name == 'MagicHook04' then
			-- shut off the collision
			-- get the associated script objects
			local CollisionWithoutPainting = FindScriptObject('NewIntro_CollisionWithoutPainting')
			local WallOpen = FindScriptObject('NewIntro_WallOpen')
			local Wallcloseddecal = FindScriptObject('NewIntro_Wallcloseddecal')		
			-- turn off archway
			if (CollisionWithoutPainting and WallOpen and Wallcloseddecal) then
				SetEntityVisible(WallOpen, 0)
				SetEntityVisible(Wallcloseddecal, 0)
				SetEntityVisible(CollisionWithoutPainting, 1)
				SetPhysicsFlag(CollisionWithoutPainting, PHYSICS_COLLIDEE, 1)
				SetEntityVisible(FindScriptObject('NewIntro_WindowPaintingCap'), 0)			
			else
				GamePrint('ERROR: necessary objects not found')
			end
		end

		%Ob.Parent.addToInventory(self)
		if self.from.normalWall then
			self.levelScript:endCutscene('DisappearWindow')
		end
		self:setState(nil)
	end

	-- **************************** ARCHWAY *******************************

	function Ob:stateArchwayHung()
		self.hung = 1
		if self.from.normalWall then 
			if self.bLoading ~= 1 then
				--				PlaySound(self, self.soundWindowOpen)
			end
			SetEntityAlpha(self, 0, .2)
			self.spawnedEntity:extend(self.bLoading)
			if ((Global:load('ArchwayPaintingHungSeen') ~= 1) and (self.Name == 'ArchPainting') and self.bLoading ~= 1) then
--				Global.levelScript.cutsceneScript:runCutscene('ArchwayPaintingHung')
				local painter = FindScriptObject('PaintingDude02')
				if (painter and painter.state_name and painter.state_name == 'ConfirmPurchase') then
					painter:shutUp()
					painter:sayLine("/BVST018SB/", 1, 0, nil, 0, nil, 1)--DIALOG=<<Good, good, good.  There you go!>>
				end				
				Global.player:sayLine("/BVWX036RA/", 0, 1, nil, 0, nil, 1) -- DIALOG=<<Nice! Now I can get Edgar�s cards!>>		
				Global:save('ArchwayPaintingHungSeen', 1)				
			end

			while (GetAnimCompletion(self.spawnedEntity) ~= 1) do				
				Yield()
			end
			
		elseif self.bLoading ~= 1 then
			PrintNote('Windows do not currently work on this hook.')
		end
		self.bLoading = 0
		self:shutOffCollision()
		SetSwitchableCollisionEnable(1, 0)

		-- hack --
		self:makeInvisible()
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)	
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)		

		self:setState(nil)
	end

	function Ob:stateDisappearArchway()
		self.spawnedEntity:retract(self.bAddToInv, FindScriptObject('NewIntro_WallClosed'))

		SetEntityVisible(FindScriptObject('NewIntro_CollisionWithoutPainting'), 1)
		SetPhysicsFlag(FindScriptObject('NewIntro_CollisionWithoutPainting'), PHYSICS_COLLIDEE, 1)
		
		self.hung = 0		
		if (self.bAddToInv == 1) then
			SetEntityVisible(self, 1)
			SetEntityAlpha(self, 1, 0) 
			%Ob.Parent.addToInventory(self)
		end

		self:turnOnCollision()
		SetSwitchableCollisionEnable(1, 1)
		self:setState(nil)
	end

	function Ob:cleanupArchway()
		Global.player.saved.BV[self:getSaveGameName()] = nil
		self.from:setEntityInterestLevel(kOBJECTMINOR_INTEREST)
		self:setHookVisible(1, 3)
		self.proximityLine = nil
		Global.player:myProximityHintChanged(self)
		local WallClosed = FindScriptObject('NewIntro_WallClosed')
		local CollisionWithoutPainting = FindScriptObject('NewIntro_CollisionWithoutPainting')
		local WindowPaintingCap = FindScriptObject('NewIntro_WindowPaintingCap')
		local WallOpen = FindScriptObject('NewIntro_WallOpen')
		local ArchOpenDecals = FindScriptObject('NewIntro_ArchOpenDecals')
		local PaintingOpen = FindScriptObject('NewIntro_PaintingOpen')
		local Wallcloseddecal = FindScriptObject('NewIntro_Wallcloseddecal')

		-- turn off archway
		if (WallClosed and CollisionWithoutPainting and WindowPaintingCap) then
			SetEntityVisible(WallClosed, 1)
			SetEntityVisible(CollisionWithoutPainting, 1)
			SetPhysicsFlag(CollisionWithoutPainting, PHYSICS_COLLIDEE, 1)
			Wallcloseddecal:makeVisible()
		else
			GamePrint('ERROR: necessary objects not found')
		end
		-- turn on wall
		if (WallOpen and ArchOpenDecals) then
			SetEntityVisible(WallOpen, 0)
			SetEntityVisible(ArchOpenDecals, 0)
			SetEntityVisible(PaintingOpen, 0)
			SetEntityVisible(WindowPaintingCap, 0)
			SetSwitchableCollisionEnable(1, 1)		
		else
			GamePrint('ERROR: necessary objects not found')
		end		
		FindScriptObject('ArchCSPaintingAnimated'):killSelf()
		FindScriptObject('ArchCSPaintingAnimatedcanvas'):killSelf()
		self:killSelf()		
	end


--*************************************************************************************************
	
	function Ob:onCrossedTriggerPlane(data,from)
		if from == Global.player and self.hung == 1 and self.sPaintingType == 'Edgar' and data == 'tv_EdgarPainting'..self.from.Name then
			self:setState('EnterBVES')
		end
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if from == Global.player and self.hung == 1 and (self.sPaintingType == 'Window' or self.sPaintingType == 'Archway') then
			self.proximityLine = nil
			Global.player:myProximityHintChanged(self)
			self:setEntityInterestLevel(0)
		elseif self.hung ~= 1 then
			-- Check hung, to intercept back attempts to pick up the item
			%Ob.Parent.onEnteredTriggerVolume(self, data, from)
		end
	end

	function Ob:onNewMoveCollide(a, from, b, c)
		if self.hung ~= 1 then
			-- Check hung, to intercept back attempts to pick up the item
			%Ob.Parent.onNewMoveCollide(self, a, from, b, c)
		end
	end
	
	function Ob:onExitedTriggerVolume(data, from)
		if from == Global.player and self.hung == 1 and (self.sPaintingType == 'Window' or self.sPaintingType == 'Archway') then
			self.proximityLine = "/BVZF005TO/"--DIALOG=<<Press /YButton/ to take the painting down.>>
			Global.player:myProximityHintChanged(self)
			self:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
		end
	end

	-- ************************ MESSAGES *********************

	function Ob:onActivateFail(data, from)
		Global.player:sayLine("/BVRO005RA/", 0, 1, nil, 1, nil, 1)	--DIALOG=<<I should find a proper hook for this painting, so it will come to life like that dog said.>>
	end

	function Ob:onActivateFromInventory(data, from)
		local targ = GetLookTarget(Global.player)
		if (targ) then
		else
			%Ob.Parent.onActivateFromInventory(self, data, from)
		end
	end

	function Ob:onHung(data, from)
		self.from = from
		Global.cutsceneScript.hook = self.from
		Global.cutsceneScript.painting = self
		if (self.sPaintingType == 'Archway') then
			Global.cutsceneScript:runCutscene('HangPainting', 0, 1, 0, nil, nil, nil, 1)
		else
			Global.cutsceneScript:runCutscene('HangPainting', 0, 0, 0, nil, nil, nil, 1)
		end
	end		
	
	function Ob:hangImmediately(hook)	
		self.from = hook
    		if self.sPaintingType ~= 'Rose' then 
			hook:setEntityInterestLevel(0) 
		end
  		SetMaxViewDistance(self, 400)
  		self:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
  		if self.bLoading ~= 1 then
  			Global.player:releaseSelectedItem()
  			-- play the generic painting sound
  			if (self.rPaintingMagicSound) then
  				PlaySound(nil, self.rPaintingMagicSound)
  			end
  		end
          --[[
  		if hook.Name == 'MagicHook03' and self.sPaintingType == 'Window' then
  			local ox, oy, oz = hook:getOrientation()
  			self:setOrientation(ApplyOrientation(ox, oy, oz, 0, 0, 20))
  			ox, oy, oz = hook:getHangPoint(self)
  			SetMaxViewDistance(self, 800)
  			self:setPosition(ox, oy+250, oz+150)
  		elseif hook.Name == 'MagicHook03' and self.sPaintingType == 'Ladder' then
  			self:setOrientation(hook:getOrientation())
  			local x, y, z = hook:getHangPoint(self)
  			self:setPosition(x, y+90, z)
    	    ]]--
  		if hook.Name == 'MagicHook04' and self.sPaintingType == 'Ladder' then
  			local ox, oy, oz = hook:getOrientation()
  			self:setOrientation(ApplyOrientation(ox, oy, oz, 0, 5, 0))
  			ox, oy, oz = hook:getHangPoint(self)
  			self:setPosition(ox+20, oy, oz)
  		else
  			self:setOrientation(hook:getOrientation())
  			self:setPosition(hook:getHangPoint(self))
  		end
  		Global.player.saved.BV[self:getSaveGameName()] = hook.Name
  		if self['stateDisappear'..self.sPaintingType] then self:setHookVisible(0) end
  		self.proximityLine = "/BVZF005TO/"--DIALOG=<<Press /YButton/ to take the painting down.>>
  		Global.player:myProximityHintChanged(self)
  		if self.vfx then 
  		    local x, y, z = self:getPosInFrontOf(-30)
  			if self.sPaintingType == 'Ladder' then 
  				x, y, z = self:getPosInFrontOf(-50, 50)
  			end
  --[[			if self.sPaintingType == 'Rose' then 
  				x, y, z = self:getPosInFrontOf(-80, 50)
  			end]]--
  			if (self.sPaintingType ~= 'Rose') then
  				self.vfx:run(x, y, z, self:getOrientation())
  			end
  		end
  		self:setState(self.sPaintingType..'Hung')
	end
	
	-- ************************ USEFUL FUNCTIONS **********************

	function Ob:spawnAdditionalEntity(script, name, editables)
		local ent = FindScriptObject(name, 1)
		if not ent then
			ent = SpawnScript(script, name, editables, 1)
		end
		if Global.player:isInInventory(ent.Name) ~= 1 then
			SetEntityVisible(ent, 0)
			ent:setPosition(-10000, -10000, -10000)
			ent:setEntityInterestLevel(0)
			SetMaxViewDistance(ent, 0)
			SetPhysicsFlag(ent, PHYSICS_COLLIDEE, 0)
		end
		return ent
	end

	function Ob:addToInventory(a, b)
		self.bAddToInv = 1
		if self.state_name then
			-- Hmm, for now don't do anything....  Let it finish its state.
		elseif self.hung == 1 then
			Global.player.saved.BV[self:getSaveGameName()] = nil
			self.from:setEntityInterestLevel(kOBJECTMINOR_INTEREST)
			self:setHookVisible(1, 3)
			self.proximityLine = nil
			Global.player:myProximityHintChanged(self)
			self:setState('Disappear'..self.sPaintingType)
		else
			%Ob.Parent.addToInventory(self, a, b)
		end
	end

	--Make a hook (in)visible
	--Parameters
	--  1 = Visible
	--  0 = Invisible
	--time - to fade in (when bVis == 1) 
	function Ob:setHookVisible(bVis,time)
		if bVis and self.from and self.from.Type == 'bv.props.MagicPaintingHook' then
			if bVis == 1 then
				self:turnOnCollision()
				self.from:setVisible(1, time)
				self.from.proximityLine = nil
				Global.player:myProximityHintChanged(self.from)
			else
				if self.sPaintingType ~= 'Vine' then self:shutOffCollision() end
				self.from:setVisible(0)
			end
		end
	end

  	function Ob:onClairvoyance(data, from)
		if self.sPaintingType == 'Vine' then
			self:playVideo('cutScenes/prerendered/ClairVis_Vine.xmv')
		elseif self.sPaintingType == 'Ladder' then
			self:playVideo('cutScenes/prerendered/ClairVis_Guitar.xmv')
		elseif self.sPaintingType == 'Window' then
			self:playVideo('cutScenes/prerendered/ClairVis_TikiHut.xmv')
		elseif self.sPaintingType == 'Rose' then
			self:playVideo('cutScenes/prerendered/ClairVis_Rose.xmv')
		elseif self.sPaintingType == 'Archway' then
			self:playVideo('cutScenes/prerendered/ClairVis_Archway.xmv')
		else
			%Ob.Parent.onClairvoyance(self, data, from)
		end
	end 

	-- You'd think you could just set PHYSICS_COLLIDEE to false.  Ha!  You'd be a fool!
	-- You have to keep some collision so you can be noticed.
	function Ob:shutOffCollision()
		if self.sPaintingType == 'Archway' then
			SetEntityCollideSphere(self, 3, 0, -150, -20)
		else
			SetEntityCollideSphere(self, 3, 0, 0, -20)
		end
		SetEntityAuraColor(self, 0, 0, 0, 0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
	end							 

	function Ob:turnOnCollision()
		SetEntityCollideGeometry(self)
		SetEntityAuraColor(self, Global.levelScript.objectAura:get())
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
	end

	-- CPed from Prop.  Can you tell it's a build day?
	function Ob:scaleLSO( scalefactor, timeinseconds )
		local currenttime = timeinseconds
		local curscale, Y, Z = self:getScale()
		while ( currenttime > 0 ) do
                     
			currenttime = currenttime - ( GetFrame60ths()/60 )
            
			if(currenttime < 0) then
				currenttime = 0
			end
            
			local remainingtime = (timeinseconds - currenttime) / timeinseconds --as a fraction of 1
			local newscale = curscale + (remainingtime * (scalefactor - curscale))
			self:setScale( newscale, newscale, newscale )
			Yield()
            
		end
		self:setScale( scalefactor )
	end

	function Ob:removeFromHook(bAddToInv)
		self.bAddToInv = bAddToInv
		if self.state_name then
			-- Hmm, for now don't do anything....  Let it finish its state.
		elseif self.hung == 1 then
			Global.player.saved.BV[self:getSaveGameName()] = nil
			self.from:setEntityInterestLevel(kOBJECTMINOR_INTEREST)
			self:setHookVisible(1, 3)
			self.proximityLine = nil
			Global.player:myProximityHintChanged(self)
			self:setState('Disappear'..self.sPaintingType)
		end
	end

	-- I don't know what the fuck is changing this value, but I'll figure it out after the demo.
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		if (self.sPaintingType == 'Rose') then
			Global:save('b' .. self.Name .. 'Collected', 1)
		end
	end
	
	function Ob:onSelected()
		PreloadAnimData('anims/dartnew/hangpainting.jan')
		Global.player:myProximityHintChanged(Global.player:getLookTarget())
	end
	
	function Ob:onSimulationCulled( bCull )
		%Ob.Parent.onSimulationCulled(self, bCull)
		if (self.vfx) then 
			SetEntityFlag(self.vfx, ENTITY_NOSIMULATE, bCull)		
		end
    end
    
	return Ob
end
