function DowsingRod(Ob)

	if (Ob == nil) then
		Ob = CreateObject('Global.Props.ShopItem')
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/dowsingRod.plb'
		Ob.initialState = nil
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan'
		Ob.inventoryscale = 1
		Ob.displayName = "/GLZB016TO/"--DIALOG=<<Dowsing Rod>>
		Ob.sItemExplanation = "/GLZB059TO/" --DIALOG=<<Locates deep, valuable ARROWHEADS.>>
		Ob.pickupSpriteName = 'DowsingRod'

		Ob.rumbleSpeed = 0
		Ob.bLarge = 1
		Ob.bUseOnly = 1

		Ob.level = 'all'	-- this will make this object stay in raz's inventory forever once he gets it

		Ob.idleAnim = 'Anims/Objects/DowsingRod/DRod_Idle.jan'
		Ob.shakeAnim = 'Anims/Objects/DowsingRod/DRod_Twitch.jan'

		Ob.TIMER_RUMBLE_START = '6001'
		Ob.TIMER_RUMBLE_END = '6002'
		Ob.TIMER_GAUGE_DECREMENT = '6003'

		-- Determines delay between rumbles
		Ob.MAX_SENSE_DIST = 3500
		Ob.MIN_VIB_DELAY = 5
		Ob.MAX_VIB_DELAY = 1000


		-- determines rumble intensities
		Ob.MIN_RUMBLE_INTENSITY = .1
		Ob.MAX_RUMBLE_INTENSITY = .5

		-- controls gauge cooldown speed
		Ob.MIN_BAR_DECREMENT = 1
		Ob.MAX_BAR_DECREMENT = 20
		Ob.ACTIVATE_INCREMENT = 15

		-- SHOP STUFF
		Ob.iNumStock = 1 -- Editable
		Ob.iPrice = 50
        Ob.iRank = 10 -- Editable
		Ob.sItemDescription = "/GLZB016TO/" --DIALOG=<<Dowsing Rod>>
		Ob.tShopCamInfo = {
			x = 6218,
			y = 167,
			z = -6342,
			rx = 0,
			ry = -165,
			rz = 0,
		}
		-- Shop shelf location  Pos:(6229.11, 271.529, -6219.5) Orientation:(125,15,0)
		-- END SHOP STUFF
		Ob.bPutAwayOnMelee = 1
		Ob.level = 'real'

		--after this long of using the rod, if there isn't a megahead within a great distance, say failure line
		Ob.TIMER_FAILURE = '6004'
		Ob.failureTime = 3000

		Ob.dependencies = {
			scripts = {
				'Global.OtherEntities.Gauge',
				'Global.OtherEntities.Sprite',
				'Global.Effects.DowsingRodFX',
			},
			textures = {
				'Textures/HUD/DowsingRod_Counter_PC.tga',
				'Textures/HUD/DowsingRod_CounterBAR.tga',
				'Textures/HUD/DowsingRod_CounterBarTop.tga',
			},
			meshes = {
				Ob.meshName,
			},
		}
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetMeshIsBackwards(self,1)
		LoadAnim(self, self.idleAnim, 0, 0)
		self.gauge = SpawnScript('Global.OtherEntities.Gauge', nil, 'self.borderTexture = \'Textures/HUD/DowsingRod_Counter_PC.tga\' self.gaugeTexture = \'Textures/HUD/DowsingRod_CounterBAR.tga\' \
						self.gaugeX = 60 self.gaugeY = 160 self.borderX = -50 self.borderY = -30 \
						self.bHorizontal = 0 self.borderPixelWidth = 128 self.borderPixelHeight = 256 self.borderScaleX = 1 self.borderScaleY = 1 \
						self.pixelWidth = 16 self.pixelHeight = 256 self.bReverse = 1 \
						self.scaleX = 1 self.scaleY = 1 self.bDontFade = 1')
		self.gauge:adjust(0)
		self.gauge:hide()
		self.gaugeTop = SpawnScript('Global.OtherEntities.Sprite', nil, 'self.path = \'Textures/HUD/DowsingRod_CounterBarTop.tga\' self.width=32 self.height=16 self.bDontFade = 1', 0)
	      	self.gaugeTop:disable()
		self.fx = SpawnScript('Global.Effects.DowsingRodFX')
		self.rSoundHandle = LoadSound('DowsingRod')
		self.hPullSound = self:loadSound( 'ArrowheadDeepPull' )
		self.hPopSound = self:loadSound( 'ArrowheadDeepPop' )
	end

	function Ob:onActivateFromInventory()
		if Global.cutsceneScript.cutscenePlaying == 1 then return end
		if not self.currentHead then return end
		local dist = GetPlayerDist(self.currentHead)
		self.gauge:adjust(min(self.gauge.percent + self.ACTIVATE_INCREMENT, 100))
		if self.gauge.percent >= 100 then
			self:setState('Victory')
		end
		-- pop up any minor arrowheads while we dowse
		local target = Global.player:getLookTarget()
		if target and target.Type == 'global.collectibles.Arrowhead' then
			target:onActivateWithRod()
		end
	end

	function Ob:beginStateVictory()
		self.gauge:show()
		self.gauge:adjust(100)
	       	self.gaugeTop:enable()
		self.gaugeTop:adjust(40, 122, 1, 1.2, 1.2)
	end


	function Ob:stateVictory()
		self.currentHead:pickUp()
		self.currentHead = nil
		self:playSound( self.hPullSound, nil, 1, 1 )
		self:playSound( self.hPopSound, nil, 1, 1 )
		self:sleep( 2 )
		self:setState('Dowsing')
	end

	function Ob:endStateVictory()
		self.gaugeTop:disable()
		self.gauge:adjust(0)
		self.gauge:hide()
	end

	function Ob:onSelected()
		self:setState(nil)
		self:setState('Dowsing')
	end

	function Ob:beginStateDowsing()
		self.gauge:show()
		self.gauge:adjust(0)
		self:createTimer(50, self.TIMER_GAUGE_DECREMENT)
		self:createTimer(self.failureTime, self.TIMER_FAILURE)
		LoadAnim(self, (self.rumbleSpeed <= 0 and self.idleAnim) or self.shakeAnim, .1, 1)
		self.fx:run()
		self.rSoundInstance = self:playSound(self.rSoundHandle, 0, 0, 1)
	end

	function Ob:stateDowsing()
		if self.timersInUse and (self.timersInUse[self.TIMER_RUMBLE_START] or self.timersInUse[self.TIMER_RUMBLE_END]) then
		else
			local head = FindNearestEntity(Global.player, self.MAX_SENSE_DIST, 'Global.Collectibles.MegaArrowhead')
			self.currentHead = head
			if head then
				local sx, sy, sz = Global.player:getPosition()
				local hx, hy, hz = head:getPosition()
				local dist = GetPlayerDist(head)
				local range = self.MAX_VIB_DELAY - self.MIN_VIB_DELAY
				local delay = (dist/self.MAX_SENSE_DIST)*range + self.MIN_VIB_DELAY
				delay = min(delay, self.MAX_VIB_DELAY)
				delay = max(delay, self.MIN_VIB_DELAY)

				-- PE adjustments
				-- Stars scale in size; larger when closer
				local distRatio = 1-(max(400, min(dist, self.MAX_SENSE_DIST))-400)/(self.MAX_SENSE_DIST-400)
				PESetParticleStartEndSize(self.fx:findEmitter('Stars'),0.00,200+200*distRatio)
				-- Purple ramps 0-15 based on dot product towards arrowhead
				local fx, fy, fz = GetEntityForwardVector(Global.player)
				local vx, vy, vz = sx-hx, sy-hy, sz-hz
				local towards = 1-(DotProduct(vx, 0, vz, fx, 0, fz, 1)+1)/2
				PESetParticlesPerSec(self.fx:findEmitter('GlowPurple'),0.00,towards*15)
				-- Blue ramps 15-0 based on dot product towards arrowhead
				PESetParticlesPerSec(self.fx:findEmitter('GlowBlue'),15.00,(1-towards)*15)
				-- Sonar ramps based on facing and distance, 1-10
				towards = min(1, towards*towards/.25)
				PESetParticlesPerSec(self.fx:findEmitter('Sonar'),1.00,(towards+distRatio)*10/2)
				-- set the audio accordingly
				SoundSetParameterControl(self.rSoundHandle, self.rSoundInstance, 'Pitch', distRatio)

				-- New rumble speed/intensity logic.
				if GetDistance(sx, 0, sz, hx, 0, hz) < 200 then
					delay = self.MIN_VIB_DELAY
				    distRatio = distRatio+.3*distRatio
				end
				self.rumbleSpeed = distRatio
				self:createTimer(delay, self.TIMER_RUMBLE_START)
			else
				PESetParticleStartEndSize(self.fx:findEmitter('Stars'),0.00,200)
				PESetParticlesPerSec(self.fx:findEmitter('GlowPurple'),0.00,0)
				PESetParticlesPerSec(self.fx:findEmitter('GlowBlue'),15.00,0)
				PESetParticlesPerSec(self.fx:findEmitter('Sonar'),1.00,0)
			end
		end
	end

	function Ob:endStateDowsing()
		self:killAllTimers()
		RumbleSpeed(0, 0)
		self.gauge:hide()
		self:killTimer(50, self.TIMER_GAUGE_DECREMENT)
		LoadAnim(self, self.idleAnim, .1, 1)
		self.rumbleSpeed = 0
		self.fx:stop(1)
		self.gaugeTop:disable()
		self:stopSound(self.rSoundHandle, self.rSoundInstance)
	end

	function Ob:setInvisibility(bSet)
		%Ob.Parent.setInvisibility(self, bSet)
		if self.fx and self.state_name == 'Dowsing' then
			if bSet == 1 then
				self.fx:stop()
			else
				self.fx:run()
			end
		end
	end

	function Ob:onReplaced()
		self:setState(nil)
	end

	function Ob:onTimer(id)
		if id == self.TIMER_FAILURE then
			self:killTimer(id)
			local head = FindNearestEntity(Global.player, self.MAX_SENSE_DIST, 'Global.Collectibles.MegaArrowhead')
            if (not head) then
				Global.player:sayLine("/GLGO054RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<Hmmm. I\'m not picking up anything. Must not be any deep arrowheads nearby.>>
			end
		elseif id == self.TIMER_RUMBLE_START then
			RumbleSpeed(self.rumbleSpeed, self.rumbleSpeed)
			self:killTimer(id)
			self:createTimer(100, self.TIMER_RUMBLE_END)
		elseif id == self.TIMER_RUMBLE_END then
			RumbleSpeed(0, 0)
			self:killTimer(id)
		elseif id == self.TIMER_GAUGE_DECREMENT then
			if self.gauge.percent == 0 then return end
			if not self.currentHead then return end
			local decrement = GetPlayerDist(self.currentHead)
			decrement = decrement / self.MAX_SENSE_DIST
			decrement = decrement * (self.MAX_BAR_DECREMENT-self.MIN_BAR_DECREMENT) + self.MIN_BAR_DECREMENT
			-- I crop off decay at 70 percent, because it feels better to have the top end not quite exponential.
			-- I could also pretend the gauge went up to 120 or so for a similar effect.
			decrement = max(.025*decrement * min(70, self.gauge.percent), .15)
			self.gauge:adjust(max(self.gauge.percent - decrement, 0))
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)

		if (self.bReincarnated ~= 1) then
			Global.player:collectDowsingRodText()
			Global:saveGlobal('DowsingRodCollected', 1)

			Global.goalManager:deactivate('GetDowsingRod')
			if (Global.player.stats.arrowheads < 800) then
				Global.goalManager:activate('UseDowsingRod')
			end
		end
	end

	function Ob:onDomainChange(old, new)
		%Ob.Parent.onDomainChange(self, old, new)
		if self.fx then
			SetEntityDomain(self.fx, new)
		end
	end

	return Ob
end
