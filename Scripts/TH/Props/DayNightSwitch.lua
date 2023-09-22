function DayNightSwitch(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('ScriptBase')
		
		Ob.height = 20
		Ob.rotateSpeed = 300
		Ob.lightCone = 'ArcLightBeam'		
		Ob.bRotating = 0
		
		--arclamp vars		
		Ob.customFireFXPath = 'Global.Effects.FireSmallNoScale'
		Ob.firestartResistance = 0
		Ob.height = 200
		
		Ob.fireStartX = -50
		Ob.fireStartY = 150
		Ob.fireStartZ = 0
	
		Ob.bOn = 0
		
		Ob.MOOD_HAPPY = 0 
		Ob.MOOD_SAD = 1
		Ob.mood = Ob.MOOD_HAPPY
		
		Ob.candle = nil
		
		Ob.razChatterTable = {
			{line = "/THCI000RA/", ownerOverride = Global.player, group='a'},--DIALOG=<<I think Becky\'s not telling me the whole story. >>
			{line = "/THCI001RA/", ownerOverride = Global.player, group='a'},--DIALOG=<<I should go give her a piece of my mind.>>
		}	
	end

--*************************************************************************************
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:loadMesh('Levels/TH_GloriasBrain/Props/DayNightSwitch.plb')
		self:setEntityInterestLevel(kOBJECTMAJOR_INTEREST)
		
		--self.trigSphere = TriggerSphere_New(0,0,0, 500, self)
		self.rActivateSoundHandle = LoadSound('MoodOverride')
		
		--arclamp stuff
		SetEntityLookOffsetPos(self, 0,self.height,0)
		SetEntityCollideGeometry(self)
		self.happyLight = FindScriptObject('HappyLight')
		SetEntityAlpha(self.happyLight, 0,0)
		self.sadLight = FindScriptObject('SadLight')
		SetEntityAlpha(self.sadLight, 0,0)
		
		local introLight = FindLight(nil, 'IntroSpotlight')
		SetLightBrightness(introLight, 0, 0)
		
		self.daySpotLight = FindLight(nil, 'DaySpotlight')
		self.nightSpotLight = FindLight(nil, 'NightSpotlight')
		SetLightBrightness(self.daySpotLight, 0, 0)
		SetLightBrightness(self.nightSpotLight, 0, 0)
		
		self.rCandlePlacedSoundHandle = LoadSound('Candle')
		self.rLightUpHandle = LoadSound('Spotlight')
	
		self:loadAnim('Anims/th_Theater/DaynightSwitch/openidle.jan', 0, 0)
		
		if Global:load('SwitchHasCandle') == 1 then
			self:attachCandle(FindScriptObject('Candle'))
		end
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		
		if Global:load('SwitchCandleLit') == 1 then
			self:ignite()
			self:killTimer(self.TIMER_ON_FIRE)
			
			local initbNight = Global:load('THMSCurrNight')
			if (initbNight == 1) then
				self:loadAnim('Anims/th_Theater/DaynightSwitch/sad.jan', 0, 0)
				self.mood = self.MOOD_SAD
			else
				self:loadAnim('Anims/th_Theater/DaynightSwitch/happy.jan', 0, 0)
				self.mood = self.MOOD_HAPPY
			end
			
			self:turnOn()
		end
		
		self.razCRH = SpawnScript('Global.Util.CharResponseHandler')
		self.razCRH.owner = self
		self.razCRH.type = self.CRH_ALWAYS_SEQUENTIAL
		self.razCRH.bLinePriority = 1
		self.razCRH:addDialog(self.razChatterTable)
		
	end

--*************************************************************************************
	
   	function Ob:onNewMoveMelee(whichAttack, from, power)
		if (self.bOn == 1 and self.bRotating ~= 1) then
			Global.cutsceneScript:runCutscene('SwitchDayNight', 0,0,0)
			self:setState('Rotate')
		end
	end

--*************************************************************************************
	
	function Ob:stateRotate()
		self.bRotating = 1
		self:playSound(self.rActivateSoundHandle, 0, 0, 1)
		if (self.mood == self.MOOD_HAPPY) then
			self.mood = self.MOOD_SAD
			SetEntityAlpha(self.happyLight, 0,0.5)
			SetLightBrightness(self.daySpotLight, 0, 250)			
			self:loadAnim('Anims/th_Theater/DaynightSwitch/sad.jan', 0, 0)
			while (self:getAnimCompletion('sad.jan') < 1) do Yield() end
			SetEntityAlpha(self.sadLight, 0.25,0.5)
			SetLightBrightness(self.nightSpotLight, 1, 250)			
		elseif (self.mood == self.MOOD_SAD) then
			self.mood = self.MOOD_HAPPY
			SetEntityAlpha(self.sadLight, 0,0.5)
			SetLightBrightness(self.nightSpotLight, 0, 250)			
			self:loadAnim('Anims/th_Theater/DaynightSwitch/happy.jan', 0, 0)
			while (self:getAnimCompletion('happy.jan') < 1) do Yield() end
			SetEntityAlpha(self.happyLight, 0.25,0.5)
			SetLightBrightness(self.daySpotLight, 1, 250)
		end
		self.bRotating = 0
		self:setState(nil)
	end

--*************************************************************************************

	function Ob:onItem(data,from)
		if (data and data ~= '') then
			DebugPrint(data)
			local ob = FindScriptObject(data)
			--edit to make Global props
			if (ob.Type == 'global.props.Candle' and not self.candle ) then
				Global.player:releaseSelectedItem()
				self:attachCandle(ob)
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
			if (ob) then				
				Global.player:setSelectedItem(ob.Name, 1)
				self:onItem(ob.Name)
			elseif (not self.candle) then
				Global.player:sayLine("/THCL001RA/",0, 1, nil, 1, nil, 1)--DIALOG=<<Looks like it needs a candle to work.>>
			elseif (self.candle and self.bOn ~= 1) then
				Global.player:sayLine("/THCL002RA/",0, 1, nil, 1, nil, 1)--DIALOG=<<Now... how can I light that candle?>>
			elseif (self.candle and self.bOn == 1) then
				Global:save('bManualMoodSwitch', 1 )
				if (self.mood == self.MOOD_HAPPY) then
					Global.player:sayLine("/THCM000RA/",0, 1, nil, 1, nil, 1) --DIALOG=<<Gloria must be in a good mood now.>>
				else
					Global.player:sayLine("/THCM001RA/",0, 1, nil, 1, nil, 1)  --DIALOG=<<Ooh, I\'ll bet Gloria is in a bad mood now>>
				end
			end
		end
	end


--*************************************************************************************
	
	--[[
	function Ob:onEnteredTriggerVolume(data,from)
		if (from == Global.player and data == self.trigSphere and Global:load('DayNightSwitchIntroSeen') ~= 1) then
			Global:save('DayNightSwitchIntroSeen', 1)
			Trigger_UnregisterListener(self.trigSphere, self)
			Global.cutsceneScript:runCutscene('DayNightSwitchIntro')
		end	
	end
	]]--
--*************************************************************************************


	function Ob:onFireEnd()
		--GamePrint("ON FIRE END")
		%Ob.Parent.onFireEnd(self)
		if (self.bOnFire == 1 and self.bOn ~= 1) then
			if (Global:load('bBonitaHeckledPlayed') ~= 1) then
				Global.cutsceneScript:runCutscene('BonitaHeckled')
			end
			--this fire will last forever
			self:killTimer(self.TIMER_ON_FIRE)
			if (self.firestartingHelper) then
				self.firestartingHelper:killSelf()
			end
			
			Global:save('SwitchCandleLit', 1)
			self.proximityLine = "/THZF000TO/"--DIALOG=<<Punch switch to change moods>>
			Global.player:myProximityHintChanged(self)
			Global.goalManager:activate('Phantom')
			Global.goalManager:activate('ReachCatwalks')
			--edit to open backstage door and prevent softlock
			local door = FindScriptObject('StorageRoomDoor', 1)
			if (door) then
				door:open()
			end
			SetSwitchableCollisionEnable(1,0)
			Global:save('StorageRoomDoorOpened', 1)
			
		end
	end
	
--*************************************************************************************
		
	function Ob:turnOn()
		if (self.bOn ~= 1) then
			self:playSound(self.rLightUpHandle)
		
			self.bOn = 1
			--turn on the light cone and spotlight
			if (self.mood == self.MOOD_SAD) then
				SetEntityAlpha(self.sadLight, 0.25,0.5)
				SetLightBrightness(self.nightSpotLight, 1, 250)
			else
				SetEntityAlpha(self.happyLight, 0.25,0.5)
				SetLightBrightness(self.daySpotLight, 1, 250)
			end
		end
	end					  
					  
--**************************************************************************************
  
	function Ob:turnOff()
		if (self.bOn == 1) then
			self.bOn = 0
			--turn on the light cone
			SetEntityAlpha(self.sadLight, 0,0.5)
			SetEntityAlpha(self.happyLight, 0,0.5)
			
			--turn off the spot light
			SetLightBrightness(self.daySpotLight, 0, 250)
			SetLightBrightness(self.nightSpotLight, 0, 250)
		end
	end		
	
--*************************************************************************************
	
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
		candle:setPosition(-50, 100, 0)

		candle.bPlacedInLamp = 1
		Global:save('SwitchHasCandle', 1)
	end
  
--**************************************************************************************
	
	function Ob:startRazChatter()
		self.razCRH:chatterStart(1)
	end

--**************************************************************************************
   
	return Ob
end

