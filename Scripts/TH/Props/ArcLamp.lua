function ArcLamp(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
	
		Ob.firestartResistance = 0
		Ob.height = 200
		Ob.TIME_ON_FIRE = 10000
		
		Ob.fireStartX = 0
		Ob.fireStartY = 260
		Ob.fireStartZ = -20
	
		Ob.lightCone = nil -- Editable
		Ob.spotLight = nil -- Editable
		Ob.lightFX = nil -- Editable
		
		Ob.bDestroyed = 0  --by jasper, that is
		--Ob.customFireFXPath = 'Global.Effects.FireSmall'
		
		Ob.bOn = 0
		
		--the amount of time flickered off/on
		Ob.flickerTimeOff = 100
		Ob.flickerTimeOn = 500
		Ob.TIMER_FLICKER = '2002'
		--how many times to flicker
		Ob.flickers = 0
		Ob.maxFlickers = 3
		Ob.candle = nil

		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = { 
			},
			meshes = { 
                                'Levels/TH_GloriasBrain/StageProps/BrokenArcLamp.plb',
                                'levels/th_gloriasbrain/stageprops/uberlight.plb',
			},
			textures = { 
			},	
		}
	
        end

--  I N I T  **************************************************************************************
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:loadMesh('levels/th_gloriasbrain/stageprops/uberlight.plb')
		self:setEntityInterestLevel(kSWITCH_INTEREST)
		SetEntityCollideSphere(self, 100, 0,100,0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetEntityLookOffsetPos(self, 0,self.height,0)
		SetEntityCollideGeometry(self)
	   if (self.lightCone) then
		 	self.lightCone = FindScriptObject(self.lightCone)
			--SetEntityVisible(self.lightCone, 0)
			SetEntityAlpha(self.lightCone, 0, 0)
		end
		if (self.spotLight) then
		 	self.spotLight = FindLight(nil, self.spotLight)
			SetLightBrightness(self.spotLight, 0, 0)
		end
		self.lightFX = SpawnScript('TH.Effects.ArcLamp1FX', self.Name..'LightFX')
		self.lightFX:attach(self)
		self.lightFX:setPosition(0,225,250)
		self.lightFX:setOrientation(120,0,0)
		self.rCandlePlacedSoundHandle = LoadSound('Candle')
		self.rLightUpHandle = LoadSound('Spotlight')
		self.gibs = FindScriptObject('ArcLampGibs')
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		if (Global.levelScript.Type == 'th.THFB') then
			self.bossMain = FindScriptObject('Jasper')
		end
	end

--**************************************************************************************
										   
	function Ob:onFireEnd()
		if (self.bDestroyed == 0) then
			--GamePrint("ON FIRE END")
			%Ob.Parent.onFireEnd(self)
			if (self.bOnFire == 1) then
				self:turnOn() 
				if (Global.levelScript.Type == 'th.THCW' and self.Name == 'CatwalkArclamp' and Global:load('bTHCWPhantomFled') ~= 1) then  --check 1. if THCW and jasper in light cone
					Global:save('bTHCWPhantomFled', 1)
					Global.cutsceneScript:runCutscene('PhantomFlee')
				elseif (Global.levelScript.Type == 'th.THFB' and self.bossMain.bCrashed ~= 1) then
					self.bossMain.arcLamp = self
					self.bossMain:crash()
					Global.cutsceneScript:runCutscene('JasperBlinded')
				end
			end
		end
	end

--**************************************************************************************
	
	function Ob:destroy()
		local gibs = self.gibs:getGibs()
		local x,y,z = self:getPosition()
		gibs:setPosition(x,y+150,z)
		gibs:run()
		self:loadMesh('Levels/TH_GloriasBrain/StageProps/BrokenArcLamp.plb')
		SetEntityCollideSphere(self, 10, 0,10,0)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
	 	self.bDestroyed = 1
		self.firestartResistance = 0
		if (self.candle) then
			self.candle:makeInvisible()
		end
	end

--**************************************************************************************
											   
	function Ob:turnOn()
		self:playSound(self.rLightUpHandle,0,0,1)
		self.bOn = 1
		--turn on the light cone
		if (self.lightCone) then
			--SetEntityVisible(self.lightCone, 1)
			SetEntityAlpha(self.lightCone, 0.2, 0.25 )
		end
		--turn on the spot light
		if (self.spotLight) then
			SetLightBrightness(self.spotLight, 1, 250)
		end
		--turn on the fx
		if (self.lightFX) then
			self.lightFX:run()
		end
	end					  
					  
--**************************************************************************************
  
	function Ob:turnOff()
		self.bOn = 0
		--turn on the light cone
		if (self.lightCone) then
			--SetEntityVisible(self.lightCone, 0)
			SetEntityAlpha(self.lightCone, 0, 0.25)
			
		end
		--turn on the spot light
		if (self.spotLight) then
			SetLightBrightness(self.spotLight, 0, 250)
		end
		--turn off the fx
		if (self.lightFX) then
			self.lightFX:stop()
		end
	end		
	
--**************************************************************************************
	
	function Ob:flicker()
		if (self.bOn == 1) then
			--GamePrint("START FLICKER, OFF")
			self:turnOff()
			self.bFlickeredOff = 1
			self.flickers = 0
			self:createTimer(self.flickerTimeOff, self.TIMER_FLICKER)
		end
	end			  
					  
--**************************************************************************************
	
	function Ob:onTimer(id)
		if id == self.TIMER_FLICKER then
			self:killTimer(id)
			if (self.bFlickeredOff == 1) then
				--GamePrint("FLICKER ON")
				self.flickers = self.flickers + 1
				self.bFlickeredOff = 0
				self:turnOn()
				self:createTimer(self.flickerTimeOn, self.TIMER_FLICKER)
			else
				--GamePrint("FLICKER OFF")
			
				self.bFlickeredOff = 1
				self:turnOff()
				if (self.flickers < self.maxFlickers) then
					--keep on flickering
					self:createTimer(self.flickerTimeOff, self.TIMER_FLICKER)
				else
					self:fireDissipate()
				end
			end
		elseif id == self.TIMER_ON_FIRE then
			self:killTimer(id)
			if Global.levelScript.Type ~= 'th.THFB' then		--only turn off arclamp in THCW or other levels.  ones in THFB will be turned off by jasper
				self:flicker()
				%Ob.Parent.onTimer(self,self.TIMER_ON_FIRE)
			end
		else
			%Ob.Parent.onTimer(self,id)
		end
	end
  
--**************************************************************************************
  
	function Ob:onItem(data,from)
		if (data and data ~= '') then
			DebugPrint(data)
			local ob = FindScriptObject(data)
			--edit
			if (ob.Type == 'th.props.Candle' or ob.Type == 'global.props.Candle' and not self.candle ) then
				Global.player:releaseSelectedItem()
				self:attachCandle(ob)
				-- play the sound
				self:playSound(self.rCandlePlacedSoundHandle, 0, 0, 1)
			end
		else
			local ob
			for name,type in Global.player.Inventory do 
				if (type == 'th.props.Candle') then
					ob = FindScriptObject(name)
					break
				end
			end
			if (not self.candle and ob) then				
				Global.player:setSelectedItem(ob.Name, 1)
				self:onItem(ob.Name)
			elseif (self.bDestroyed == 1) then
				Global.player:sayLine("/THCL000RA/",0, 1, nil, 1, nil, 1)--DIALOG=<<Jasper really did a number on this spotlight. I\'m going to have to use another one.>>
			elseif (not self.candle) then
				Global.player:sayLine("/THCL001RA/",0, 1, nil, 1, nil, 1)--DIALOG=<<Looks like it needs a candle to work.>>
			else
				Global.player:sayLine("/THCL002RA/",0, 1, nil, 1, nil, 1)--DIALOG=<<Now... how can I light that candle?>>
			end
		end
	end
	
	--Moved candle attaching code to a separate method
	function Ob:attachCandle(candle)
		--Remove it from the player's inventory
		if (Global.player:isInInventory('Candle') ~= 1) then
			Global.player:removeFromInventory(candle)
		end
		candle:beNotPickupable()

		self.candle = candle
		self.firestartResistance = 1
		self.candle.firestartResistance = 0

		DetachEntityFromParent(candle)
		AttachEntityToEntity(candle, self, 0)
		candle:setPosition(0, 170, -20)

		candle.bPlacedInLamp = 1
	end
  
--**************************************************************************************
   
   function Ob:reset()
		if (self.candle) then
			self.candle:reset()
        end
		
		self.candle = nil
		self.firestartResistance = 0
		self:loadMesh('levels/th_gloriasbrain/stageprops/uberlight.plb')
	 	self.bDestroyed = 0
		self:turnOff()
		self:killAllTimers()
		self:fireDissipate()
		
		-- make sure that the thermometer is gone
		if (self.firestartingHelper) then
			self.firestartingHelper:killSelf()
			self.firestartingHelper = nil
		end
		self.heat = 0
   end
--**************************************************************************************
    	
	return Ob
end
