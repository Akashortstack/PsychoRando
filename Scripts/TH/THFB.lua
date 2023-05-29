--		THFB.lua
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Thien Tran
---------------------------------------------------------------------------------

function THFB(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_Candle_spineJA_1.jan',
				'Anims/DartNew/BodyParts/Hold_TH_Megaphone.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Objects/InventoryToss_largeobjects.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/th_theater/trapdoorclose.jan',
				'anims/th_theater/trapdooropen.jan',
				'anims/th_theater/OrchestraBounce.jan',
			}
		}
				
		Ob.inactiveHeight = 1000
		Ob.activationTime = 1		
        Ob.ledgeDirtEmitterName = 'TH.Effects.THLedgeDirtFX'
		Ob.theme = 'THCriticBoss'
		Ob.numTrapDoors = 10
		Ob.bBossBattle = 1
		Ob.bCustomSoundUnmute = 1
	end
	
--********************************************************************************					

	function Ob:onSpawn()
		self.thistleTable = {}
		self.harpieTable = {}
		self.houndTable = {}		
		%Ob.Parent.onSpawn(self)
	end
																				  
	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('MM')
		%Ob.Parent.onBeginLevel(self)
		self.camControl:pushAndSetChase(nil, 1200, 10, 300)
		
		SetPlayerLookBox(400,1000)
		SetRenderSplineThickness(7)		
		
		Global.player:addSpamListener('RazRespawn', self)
		
		self.arcLamp1 = FindScriptObject('ArcLamp1')
		self.arcLamp2 = FindScriptObject('ArcLamp2')
		self.arcLamp3 = FindScriptObject('ArcLamp3')

		self.candle1 = FindScriptObject('Candle')
		self.candle2 = FindScriptObject('Candle2')
		self.candle3 = FindScriptObject('Candle3')
   		
		SetCollideLayer(FindScriptObject('SideRail'), LAYER_TH_INKBALL, 1)
		
		Global.goalManager:activate('DefeatJasper')
		Global:save('bDestroyArcLampPlayed',nil)
	end

--********************************************************************************					

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		self.trapDoors = self:getPool('TH.Props.TrapDoor')
		self.trapDoors:setLowerLimit(self.numTrapDoors)

		self.thistlePool = self:getPool('TH.Characters.Thistle')		
		self.harpiePool = self:getPool('TH.Characters.Harpie')		
		self.houndPool = self:getPool('TH.Characters.Hound')		
		
		-- Grab Thistle spawn points
		for k,enemy in { 'thistle', 'hound', 'harpie'} do 
			GamePrint(k .. "   " .. enemy)
			local i = 1
			while 1 do
				local spawn = FindScriptObject(enemy .. 'Spawn' .. i, 1)
				if not spawn then break end
				self[enemy..'Table'][i] = {}
				self[enemy..'Table'][i].spawnPoint = spawn
				self[enemy..'Table'].n = i
				i = i+1
			end
			-- make all of the enemies we'll need for the level
			self[enemy..'Pool']:setLowerLimit(getn(self[enemy..'Table'])+1)
			
		end

		self.notes = SpawnScript('Global.Props.Geometry', 'MusicNotes', 'self.meshName = "Levels/TH_GloriasBrain/Props/NoteBars.plb"')
		
		self.jasper = FindScriptObject('Jasper')
		self.cutsceneScript:runCutscene('JasperBossIntro', 0,0,1)		
	end

--********************************************************************************					

	Ob.harpieToSpawnPhase1 = 0
	Ob.harpieToSpawnPhase2 = 0
	Ob.harpieToSpawnPhase3 = 6
	
	Ob.thistleToSpawnPhase1 = 0
	Ob.thistleToSpawnPhase2 = 3
	Ob.thistleToSpawnPhase3 = 2
	
	Ob.houndToSpawnPhase1 = 2
	Ob.houndToSpawnPhase2 = 1
	Ob.houndToSpawnPhase3 = 1

	function Ob:spawnEnemies(phase)
		
		GamePrint("SPAWN ENEMIES phase " .. phase)
		for k,enemy in { 'thistle', 'hound', 'harpie'} do 
			--the number to spawn, depending on the phase
			local toSpawn = self[enemy .. 'ToSpawnPhase' .. phase]
			GamePrint("ENEMY " .. enemy .. " # " .. toSpawn)
			local i
			local pool = self[enemy..'Pool']
			toSpawn = toSpawn - pool.notpooled.n
			for i = 1, toSpawn do
				GamePrint('I ' .. i)
				-- if the enemy doesn't exist for this spawn point, then we need to create it
				--local spawn = FindScriptObject(enemy .. i, 1)
				--if (spawn) and (spawn.bPooled == 1) then
				
				spawn = pool:get()
				if (spawn) then
					spawn:setPosition(self[enemy..'Table'][i].spawnPoint:getPosition())
					spawn:setOrientation(self[enemy..'Table'][i].spawnPoint:getOrientation())
					spawn.hx, spawn.hy, spawn.hz = spawn:getPosition()
					if (enemy == 'harpie') then
						spawn:activate()
					else
						spawn:activateThruTrapDoor()
					end
				end
				
				--end
			end
		end
	end
					   	
--********************************************************************************	
						
	function Ob:listenerRazRespawn(value, from)
		self:setState('Respawn')
	end
		
	function Ob:stateRespawn()
		self.arcLamp1:reset()
		self.arcLamp2:reset()
		self.arcLamp3:reset()
		self.candle1:reset()
		self.candle2:reset()
		self.candle3:reset()
		self.jasper:reset()
		self:killHarpies()
		self:killThistles()
		self:killHounds()
		self.jasper.ink:stop()
		
		while (Global.player.respawnMilestone ~= Global.player.RESPAWN_DONE) do Yield() end
		self.jasper.ink:startInkSlow()
		Global:save('bDestroyArcLampPlayed',nil)
		self:setState(nil)
	end
	
--********************************************************************************	
	
	function Ob:killHarpies()	
		self.harpiePool:applyToAll(function(self) self:deactivate(1) end, self.harpiePool.APPLY_TO_UNPOOLED_ONLY)
	end 
  
--********************************************************************************	
	
	function Ob:killHounds()	
		self.houndPool:applyToAll(function(self) self:deactivate(1) end, self.harpiePool.APPLY_TO_UNPOOLED_ONLY)
	end 
--********************************************************************************	
	
	function Ob:killThistles()	
		self.thistlePool:applyToAll(function(self) self:deactivate(1) end, self.harpiePool.APPLY_TO_UNPOOLED_ONLY)
	end 
	
	function Ob:getHintResponse()
			return { { voice = "/GLAP013FO/" }, --<<Let's float up to the catwalks and blind him with those spotlights so he'll let down his guard.
					{ voice = "/GLAP014FO/"	} } --<<Zig zag on the way up to avoid the fat man's attacks.
	end
	
	return Ob
end

