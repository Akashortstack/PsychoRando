function BVWA(Ob)
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = { 'BV.Effects.ConfettiFX',
						'BV.Props.WrestlerYesNoController',
						'BV.Props.Card',
						'BV.Props.MagicPainting',
						'BV.Props.Rose',
						'BV.Characters.Announcer',
						'gen_proploader', 
			},
			meshes = { 'Characters/LuchaLibreArm.plb',
						'characters/dartnew.plb', 
			},
			textures = { 'Textures/Characters/Lucha Libre/LuchaArm_Eagle.tga',
							'textures/UI/HealthBar.tga',
							'textures/LevelTextures/BV_BlackVelvetopia/BVW_healthbar_raz.tga',
							'textures/leveltextures/bv_blackvelvetopia/bvrb_shadow.dds',
							'textures/LevelTextures/BV_BlackVelvetopia/BVW_healthbar_wrestler.tga',
							'Textures/UI/Sayline Heads/BVraz.dds'
			},	
		}
		
		Ob.levelType = 'mental'
		Ob.wrestler = nil
		Ob.wrestlerName = nil
		Ob.cameraSecondaryTargetMode = 1
		Ob.nDeathThreshold = 0.001
		Ob.confettiFX = nil	-- reference to our fabulous confetti FX
		Ob.bBossBattle = 1
		Ob.bRazNoHealth = 1
		
  		Ob.initCamRadius = 1000
		Ob.initCamAltitude = 8.5
		Ob.initCamTargetHeight = 200
		Ob.initCamFOV = 90
	end
	
--  I N I T **************************************************************************************

	function Ob:onBeginLevel()	 
		self.theme = LoadSound('BlackVelvetAction')
		self.winTheme = LoadSound('YouWin')
		self.winOutTheme = LoadSound('BlackVelvetopia')
		
		--Player must have completed at least up to MM
		Global:setLevelToCompleted('MM')

		%Ob.Parent.onBeginLevel(self)
        
		self.charItemMatrix = SpawnScript('BV.BVCharItemMatrix','CharItemMatrix','',1)
		
		-- We have to remember to reload the correct mesh when we exit the level
		LoadNewPlayerMesh('characters/bv_raz.plb', 1)
		SetShadowColor(0, 0, 0, 0.5)
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)
		SetEntityFlag(Global.player, ENTITY_LIT_SHADOW, 1)

		--FadeToColor(0,0,0,0,0, 0,0,0,255,0, 0)
		self.wrestlerName = Global:load('PaintingEntered')
		if self.wrestlerName then
			local index = strfind(self.wrestlerName, 'Painting')
			if not index then self.wrestlerName = nil
			else
				self.wrestlerName = strlower(strsub(self.wrestlerName, 1, index-1)) 
			end
		end
		if not self.wrestlerName then
			self.wrestlerName=self.wrestler.specialControl.wrestlerID
		end	
		
	
		--Calculate # of wrestlers already defeated---------------------------------------------------
		self.wrestlersDefeated=0
		if Global:load('tigerDefeated') == 1 then
			self.wrestlersDefeated=self.wrestlersDefeated+1
		end			
		if Global:load('dragonDefeated') == 1 then
			self.wrestlersDefeated=self.wrestlersDefeated+1
		end			
		if Global:load('eagleDefeated') == 1 then
			self.wrestlersDefeated=self.wrestlersDefeated+1
		end			
		if Global:load('cobraDefeated') == 1 then
			self.wrestlersDefeated=self.wrestlersDefeated+1
		end			
		
		if self.demoLevel then
			self.wrestlersDefeated=0
		end	
		
		---------------------------------------------------------------------------------------------
		
		self.confettiFX = SpawnScript('BV.Effects.ConfettiFX', 'ConfettiFX')
		self.confettiFX:setPosition(0,0,0)
		self.rYesNoHandler = SpawnScript('BV.Props.WrestlerYesNoController', 'YesNoController', nil, 0)

  		self.wrestler.bRealMatch = 1
		self.floor=SpawnScript('BV.Props.MatCard','floor','self.suit = \''..self.cardSuit..'\'',1)
   		self.card = SpawnScript('BV.Props.Card', 'card'..self.cardSuit, 'self.suit = \''..self.cardSuit..'\'', 1)
		self.card:setPosition(1000,2000,1000)
   		
   		self.announcer = SpawnScript('BV.Characters.Announcer','Announcer','',1)
		self.announcer:setPosition(1000,2000,1000)
		
		self.floor:makeInvisible(1)
		SetEntityGlow(self.card,2,0)
        
        self.razWon=nil
        self.cx=0
        self.cy=0
        self.cz=0
        self.vx=0
        self.vy=0
        self.vz=0
		
		---------------------------------
		
		if self.wrestlerName=='eagle' then
			self.wrestlerHand = SpawnScript('gen_proploader', 'WrestlerHand', 'self.meshname = \'Characters/LuchaLibreArm.plb\'',1)
			SetEntityFlag(self.wrestlerHand, ENTITY_NOSIMULATE, 0)
			--GamePrint('Warning: '..self.wrestlerHand.texture)
			--DebugDumpTextureInfo()
			--SetBaseTexture(self.wrestlerHand, 'Textures/Characters/Lucha Libre/LuchaArm_Eagle.tga','Textures/Characters/Lucha Libre/LuchaLibre_tiger.tga')
			--self.wrestlerHand.texture = 'Textures/Characters/Lucha Libre/LuchaArm_Eagle.tga'
			SetBaseTexture(self.wrestlerHand, 'Textures/Characters/Lucha Libre/LuchaArm_Eagle.tga')
			SetEntityFlag(self.wrestlerHand, ENTITY_DRAWSHADOW, 0)
			self.wrestlerHand:makeInvisible()
		end			
		
		--Misc wrestler entry ramp stuff
		SetEntityFlag(self.entry, ENTITY_CANNOTBESTOODON, 0)
		SetPhysicsFlag(self.entry, PHYSICS_SLIDEONCOLLIDE, 0)

		--Make sure we're faded out for beginning of intro
		Global.cutsceneScript:fadeToBlack(0)
		Global.player.charName = 'BVraz'

		self:setState('LevelSetup')
	end
	
--**************************************************************************************************

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		-- Restore the regular player mesh
		LoadNewPlayerMesh('characters/dartnew.plb', 1)
		Global.player.charName = 'Raz'
	end

--	S T A T E S  ***********************************************************************************
	
	function Ob:beginStateLevelSetup()
		self.bUninterruptibleState = 1
	end
	
	function Ob:stateLevelSetup()
		-- run intro cutscene
		if (Global:load(self.Type..'IntroPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('WrestlerIntro', 1, nil, nil, 0)		
		end
		Global.cutsceneScript:fadeIn(.5)
        
		-- start fight
		self.bGameOver = 0
		Global.player:setPosition(715, 40, 850)
		Global.player:setOrientation(0, -120, 0)
		self.wrestler:setPosition(-715, 40, -850)
		self.wrestler:setOrientation(0, 30, 0)
		self:setupHealthBars()
		self:resetCamera()		
		self:dontRunPlayerControls(0)
		Yield()
		self.wrestler:setState('Decide')
		self.wrestler.lungeControl:startTimer()
		self.wrestler.nLastSpecialHealth = 1
		self.wrestler.nSpecialsLanded = 0
		self.wrestler.bDead = 0

		Global.levelScript.rInstaHintFord:enemySawPlayer( self.wrestler.Type .. self.wrestlerName )
		self.bUninterruptibleState = 0
		self:setState(nil)		
	end
    
--**************************************************************************************************

	function Ob:beginStatePopUpYesNoBox()
		self.bUninterruptibleState = 1
	end
	
	function Ob:statePopUpYesNoBox()
		if (self.rYesNoHandler ~= nil) then
			self:dontRunPlayerControls(1)
			self.yesNoCamHandle = self.camControl:pushAndSetScript(self)
			LoadAnim(Global.player, 'Anims/DartNew/KnockDown_loop.jan', 0.100000, 1)
			self.rYesNoHandler:startYesNo()			
			Global.cutsceneScript:fadeIn(0.5)
		end
		self.confettiFX:stop(1,0,0)
		self.bUninterruptibleState = 0
		self:setState(nil)		
	end
	
--**************************************************************************************************
	
	function Ob:stateReturnToBVRB()
		local r,g,b,a,tganame = FadeGetCurrentState()
		FadeToColor(r,g,b,a,tganame, 0,0,0,255, nil, 0)
		Yield()
	       
		if Global:load(self.wrestlerName..'Defeated') ~= 1 then
			Global:save('DefeatedByWrestler', self.wrestlerName)
		end
		self:loadNewLevel((self.demoLevel == 1 and 'BVRD') or 'BVRB', nil, 1)
	end
	
--**************************************************************************************************

	function Ob:stateCameraCheck()
		local x, y, z = Global.player:getPosition()
		if (y > 500 and self.cameraSecondaryTargetMode == 1) then
			self.cameraSecondaryTargetMode = 0			
			Global.camControl:setSecondaryTarget(nil, kSECONDARYFLAG_AUTO_ROTATE, 1)
		elseif (y < 500 and self.cameraSecondaryTargetMode == 0) then
			self.cameraSecondaryTargetMode = 1
			Global.camControl:setSecondaryTarget(self.wrestler, kSECONDARYFLAG_AUTO_ROTATE, 1)
		end		
	end				
	
--**************************************************************************************************

	function Ob:stateWrestlerWon()
		Global.cutsceneScript:runCutscene('WrestlerWon', 1, 1, nil, 0)
		if (self.wrestlerName == 'cobra' and IsPowerEnabled(kPOWER_CONFUSION) == 0) then
			Global:save('defeatedByCobra', 1)
			self:setState('ReturnToBVRB')
		else
			self:setState('PopUpYesNoBox')
		end
	end
	
--**************************************************************************************************
	
	function Ob:stateRazWon()
        Global.cutsceneScript:runCutscene('RazWon', 0, 1, nil, 0)
		self:setState(nil)
	end
    
--	O T H E R  F U N C T I O N S  ******************************************************************
	
	function Ob:setupHealthBars()
		--SET UP 2 HEALTH BARS----------------------------------------------
        self:removeHealthBars()
		
		--bar 1
		--screen coordinates of bar
		self.healthBar1X = 75
		self.healthBar1Y = 28
		--how much to scale the texture
		self.healthBar1ScaleX = 0.60
		self.healthBar1ScaleY = 0.9
		--the pixel dimensions of texture
		self.healthBar1Width = 256
		self.healthBar1Height = 32
		--the current level, starts at 1, goes to 0
		self.healthBar1Level = 1.0

		self.healthBar1BorderX = -100
		self.healthBar1BorderY = -30
		--how much to scale the texture
		self.healthBar1BorderScaleX = 0.60
		self.healthBar1BorderScaleY = 0.60
		
		--draw the bar and border
		self.healthBar1 = AddSpriteHandle('textures/UI/HealthBar.tga' , self.healthBar1X , self.healthBar1Y, 1, self.healthBar1ScaleX, self.healthBar1ScaleY)
		
		self.healthBar1Border = AddSpriteHandle('textures/LevelTextures/BV_BlackVelvetopia/BVW_healthbar_raz.tga' , self.healthBar1BorderX , self.healthBar1BorderY, 1, self.healthBar1BorderScaleX, self.healthBar1BorderScaleY)
        
		--bar 2
		--screen coordinates of bar
		self.healthBar2X = 312
		self.healthBar2Y = 28
		--how much to scale the texture
		self.healthBar2ScaleX = 0.60
		self.healthBar2ScaleY = 0.9
		--the pixel dimensions of texture
		self.healthBar2Width = 256
		self.healthBar2Height = 32
		--the current level, starts at 1, goes to 0
		self.healthBar2Level = 1.0
		
		self.healthBar2BorderX = 220
		self.healthBar2BorderY = -30
		--how much to scale the texture
		self.healthBar2BorderScaleX = 0.60
		self.healthBar2BorderScaleY = 0.60
		
		--draw the bar and border
		self.healthBar2 = AddSprite('textures/UI/HealthBar.tga' , self.healthBar2X , self.healthBar2Y, 1, self.healthBar2ScaleX, self.healthBar2ScaleY, 180)
		self.healthBar2Border = AddSprite('textures/LevelTextures/BV_BlackVelvetopia/BVW_healthbar_wrestler.tga' , self.healthBar2BorderX , self.healthBar2BorderY, 1, self.healthBar2BorderScaleX, self.healthBar2BorderScaleY)
	end
	
--**************************************************************************************************
    
    function Ob:removeHealthBars()
        if self.healthBar1 then
            RemoveSprite(self.healthBar1)
            RemoveSprite(self.healthBar1Border)
            RemoveSprite(self.healthBar2)
            RemoveSprite(self.healthBar2Border)
            self.healthBar1=nil
        end            
    end        
	
--**************************************************************************************************
			
	--adjust the health bars (absolute), iHealthBar is 1 or 2 (left, right)
	function Ob:setHealthLevel(iHealthBar, iPercentLeft)
		if (iHealthBar == 1) then
			SpriteAdjust(self.healthBar1, nil, nil, 1, nil, nil, 0, iPercentLeft)
		elseif (iHealthBar == 2) then
			SpriteAdjust(self.healthBar2, nil, nil, 1, nil, nil, 180, iPercentLeft)
			self.wrestler.nGlobalSpeedScale = self.wrestler.nMinSpeed + ((self.wrestler.nMaxSpeed - self.wrestler.nMinSpeed) * (1 - self.healthBar2Level))
--			GamePrint('speed ' .. self.wrestler.nGlobalSpeedScale)
			
			if (self.healthBar2Level <= self.wrestler.nLastSpecialHealth - self.wrestler.nWrestlerDamageBeforeSpecial) then
--				GamePrint('Setting CanDoSpecialFlag at ' .. self.healthBar1Level .. 'health')
				self.wrestler.nLastSpecialHealth = self.wrestler.nLastSpecialHealth - self.wrestler.nWrestlerDamageBeforeSpecial
				self.wrestler.bCanDoSpecial = 1
			end
		end
--		GamePrint('Health ' .. self.healthBar2Level)
		if (iHealthBar == 1 and self.healthBar1Level <= self.nDeathThreshold) then
			if (self.bGameOver == 0) then
				if (Global.player.bWrestlerClairOn == 1) then
					Global.player:cancelClairvoyance()
				end
				self.bGameOver = 1
				self.wrestler:endAllAttacks()
				if (self.wrestler.bOnFire == 1) then
					self.wrestler:fireDissipate()
				end
				self:setState('WrestlerWon')		
			end
		elseif (iHealthBar == 2 and self.healthBar2Level <= self.nDeathThreshold) then
			if not self.razWon then
				if (Global.player.bWrestlerClairOn == 1) then
					Global.player:cancelClairvoyance()
				end
				self.razWon=1
				if (self.bGameOver == 0) then
					self:setState('RazWon')
				end
			end                
		end
	end
	
--**************************************************************************************************

	--subtract a certain amount of health, 0 to 1, iHealthBar is 1 or 2 (left, right)
	function Ob:subtractHealthLevel(iHealthBar, iSubtractor)
		--edit lose immediately if instantdeath == True
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.instantdeath == TRUE then
			if iHealthBar==1 then
				iSubtractor=100
			end
		end			
		---------------------------
		-- turn off ford if he's up
		if (self.rInstaHintFord) then
			if self.rInstaHintFord:isActive() == 1 then
				self.rInstaHintFord:forceExit()
			end
		end		
		self['healthBar' .. iHealthBar .. 'Level'] = max(self['healthBar' .. iHealthBar .. 'Level'] - iSubtractor, 0)
		self:setHealthLevel(iHealthBar, self['healthBar' .. iHealthBar .. 'Level'])
	end
	
--**************************************************************************************************
	
	function Ob:spewCard()
		self.card = SpawnScript('BV.Props.Card', 'card'..self.cardSuit, 'self.suit = \''..self.cardSuit..'\'', 1)
		local sx, sy, sz = Global.player:getPosition()
		local fx, fy, fz = GetEntityForwardVector(Global.player)
		self.card:setPosition(sx+fx*200, sy+fy*100+200, sz+fz*200)
		local ox, oy, oz = self.card:getOrientation()
		self.card:setOrientation(ox, oy+90, oz)
		SetEntityGlow(self.card, 2, 0)
		SetEntityVisible(self.card, 1)
	end
	
--**************************************************************************************************
	
	function Ob:miscDialog()
		-- Dialog Domain BVAN
		-- Dialog BaseActor AN
		self.announcer:sayLine("/BVAN012AN/",1, 1, 0, 0, nil, 1)	-- 'FIGHT!'
		self.announcer:sayLine("/BVAN013AN/",1, 1, 0, 0, nil, 1)	-- 'WRESTLE!'
	end
   
--**************************************************************************************************
	
	function Ob:fireOffAnnouncerHelp()
		if self.wrestlerName=='cobra' then
			self.announcer:sayLine("/BVAH001AN/",0, 1, 0, 1, nil, 1)	-- 'Cobra Hint'
		elseif self.wrestlerName=='eagle' then
			self.announcer:sayLine("/BVAH002AN/",0, 1, 0, 1, nil, 1)	-- 'Eagle Hint'
		elseif self.wrestlerName=='dragon' then
			self.announcer:sayLine("/BVAH003AN/",0, 1, 0, 1, nil, 1)	-- 'Dragon Hint'
		elseif self.wrestlerName=='tiger' then
			self.announcer:sayLine("/BVAH004AN/",0, 1, 0, 1, nil, 1)	-- 'Tiger Hint'
		end			
	end		
	
--**************************************************************************************************
	
	function Ob:resetCamera()
		if (self.yesNoCamHandle) then
			Global.camControl:removeCam(self.yesNoCamHandle)
			self.yesNoCamHandle = nil
		end
		Global.camControl:setSecondaryTarget(self.wrestler, kSECONDARYFLAG_AUTO_ROTATE, 1)
		MoveCameraToIdeal()
	end
	
--**************************************************************************************************
	
	function Ob:stateFlashBar()		
		SpriteColor(self.healthBar2, 255,255,255,0)
		self:sleep(0.25)
		SpriteColor(self.healthBar2, 180,180,180,0)
		self:sleep(0.25)
	end
	
	return Ob
end
