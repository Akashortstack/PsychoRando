function MCTC(Ob)
	-- Constructor
	if (not Ob) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/CO_RankUP/Spin.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Emotional Baggage/dufflebagTag_default.jan',
				'Anims/Emotional Baggage/dufflebagTag_happy.jan',
				'Anims/Emotional Baggage/hatboxTag_default.jan',
				'Anims/Emotional Baggage/hatboxTag_happy.jan',
				'Anims/Emotional Baggage/purseTag_default.jan',
				'Anims/Emotional Baggage/purseTag_happy.jan',
				'Anims/Emotional Baggage/steamertrunkTag_default.jan',
				'Anims/Emotional Baggage/steamertrunkTag_happy.jan',
				'Anims/Emotional Baggage/suitcaseTag_default.jan',
				'Anims/Emotional Baggage/suitcaseTag_happy.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/DartNew/BodyParts/hold_jar_spineja.jan',
				'Anims/KnifeThrower/Sword_hit.jan',
				'Anims/KnifeThrower/Sword_shake.jan',
				'Anims/KnifeThrower/attack_knife.jan',
				'Anims/MC_MeatGrinder/MeatGrinderGrind.jan',
				'Anims/MC_MeatGrinder/MeatGrinderGrindEnd.jan',
				'Anims/MeatCircus_Bunny/Hanging.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleBackward.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/RailTumbleLeft.jan',
				'anims/dartnew/RailTumbleRight.jan',
				'anims/fat_lady/jump_1.jan',
				'anims/mc_ambientanims/piggydooropen.jan',
				'anims/mc_ambientanims/ridedooropen.jan',
			}
		}
				
		Ob.caravanTriggerName = 'tv_caravan'
		Ob.victoryTriggerName = 'tv_bunnyvictory'

		Ob.caravanDomainTrigger = 'tv_CaravanDomain'
		Ob.tentInteriorDomainTrigger = 'tv_TentInteriorDOMAIN'		

		Ob.caravanDomainName = 'Caravan'
		Ob.tentInteriorDomainName = 'TentInterior'
		Ob.tentExteriorDomainName = 'TentExterior'
		
		Ob.bSetToCircusAudio = 0
	end

-- 	Ob.rail_transitions = {
-- 		-- rails are named 275, 243, 267
-- 		{ 71840, 1472 , 66987 },
-- 		{ 71706.3, 1531.0, 66894.1},
-- 		{ 71173.7, 2169.2, 66204.2},
-- 		{ 70011.9, 3436.9, 64817.6},
-- 		{ 68368, 4782, 63731 },
-- 		{ 65190, 7430, 61497 },
-- 		{ 62070, 10083, 59300},
-- 		{ 60867.9, 11137.2, 58385.0},
-- 		{ 58780, 13229, 56269},
-- 		{ 56737, 15776, 53329},
-- 		{ 56091, 16670, 52254},
-- 		{ 55550, 17299, 51553 },
-- 		{ 54694.6, 18072.4, 50826.3},
-- 		{ 52173.9, 20035.0, 49283.8},
-- 		{ 49190.6, 22299.3, 47550.1},
-- 		{ 49012.9, 22446.6, 47424.6},
-- 		{ 44953.5, 27060.3, 42353.4},
-- 		{ 43428.5, 28875.3, 40292.0},
-- 		{ 41691.0, 30869.4, 38090.0},
-- 		{ 35464.6, 37068.5, 31614.1},
-- 		{ 33493.7, 39089.2, 29553.0},
-- 		{ 31972.7, 40530.1, 28171.7},
-- 		{ 30807.7, 41497.2, 27333.8},
-- 		{ 27905.5, 43920.5, 25295.0},
-- 		{ 26396.7, 45288.0, 24054.5},
-- 		{ 22803.8, 48506.9, 21112.6},
-- 		{ 22247.9, 48968.5, 20708.9},
-- 		{ 17262.1, 53645.8, 16264.4},
-- 		{ 16273.8, 54304.4, 15798.2},
-- 		{ 15960.2, 54496.9, 15647.0},
-- 		{ 15538.5, 54861.3, 15343.3},
-- 		{ 14928.6, 55526.5, 14652.8},
-- 		{ 14203.7, 56515.4, 13490.5},
-- 		{ 11727.9, 58855.3, 11237.0},
-- 		{ 9695.6, 60603.7, 9651.5},
-- 		{ 7038.3, 62950.2, 7503.3},
-- 		{ 6741.7, 63295.6, 7174.4},
-- 		{ 3239.7, 66496.8, 4164.4},
-- 		{ 1942.2, 67729.3, 2939.9},
-- 		{ 1151.5, 68627.4, 1947.8},
-- 		{ 529.7, 69574.3, 719.8},
-- 		{ 41.6, 70132.3, 20.9},
-- 	}

	function Ob:onSpawn()
		self.censorPoolTable = { DemonBunny = {num = 3, censorCode = 'DemonBunny', scriptName = nil}, }
		%Ob.Parent.onSpawn(self)

		--Keep a list of knife throwers so that we can check if Raz is in their trigger (for hints)
		self.knifeThrowers = {}
	end

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		-- check to see if intro cutscene has played, if so set the theme, otherwise start with silence		
		if (Global:load('bCaravanIntroPlayed') ~= 1) then		
			self.defaultAmbientSoundName = 'NIAmb'
			self.theme = nil
		else
			self.defaultAmbientSoundName = 'MCTCAmb'
			self.theme = 'MeatCircus'
			self.bSetToCircusAudio = 1
		end
	end
	
	function Ob:onBeginLevel()
		--Give Raz all powers, for testing purposes only.
		self:setupRailslides()

		--Player must have gotten at least this far
		--Global:setLevelToCompleted('TH')
		--Global:setLevelToCompleted('WW')
		--Global:setLevelToCompleted('BV')
		
		-- Post brain raz mode variables.. from here on, no more mental worlds.  only real world you return to is CAJA
		Global:saveGlobal('bFordReturnToCAJADisabled',1)
		Global:saveGlobal('LastBrainingLevel', nil)
		
		%Ob.Parent.onBeginLevel(self)
		
		--Register for teleport events to trigger cutscenes
		self.bunnyTentEntrance = FindScriptObject('TentEntrance1')
		if (not self.bunnyTentEntrance) then 
			GamePrint('WARN: Couldn\'t find bunny tent entrance teleporter')
		else
			self.bunnyTentEntrance:addEventListener(self)

			--Turn off entrance teleporter so the cutscene can play properly
			if Global:load('bHasSeenTentIntro') == 1 then
				self.bunnyTentEntrance:enable()
			else
				self.bunnyTentEntrance:disable()
			end
		end

		self.bunnyTentExit = FindScriptObject('TentEntrance2')
		if (not self.bunnyTentExit) then 
			GamePrint('WARN: Couldn\'t find bunny tent exit teleporter')
		else
			self.bunnyTentExit:addEventListener(self)

			--If player is going to see the love ride cutscene, then turn off the teleporter
			--so the cutscene can play
			if (Global:load('bHasSeenLoveRide') ~= 1) then
				self.bunnyTentExit:disable()
			end
		end

		--Register victory trigger		
		if (self.victoryTriggerName) then
			local handle = TriggerOBB_Lookup(nil, self.victoryTriggerName)
			if (handle) then
				Trigger_RegisterListener(handle, self)
			else
				GamePrint('Couldn\'t find victory trigger.')
			end
		end

		self.ole = FindScriptObject('LilOle')
		self.bunny = FindScriptObject('Bunny0')
		
		--Register domain triggers
		local trig1 = TriggerOBB_Lookup(nil, self.tentInteriorDomainTrigger)
		local trig2 = TriggerOBB_Lookup(nil, self.caravanDomainTrigger)
		if (trig1 and trig2) then
			Trigger_RegisterListener(trig1, self)
			Trigger_RegisterListener(trig2, self)
			
			--Only sleep domains if triggers are there
			self:setDomain(self.caravanDomainName, 0)
			self:setDomain(self.tentInteriorDomainName, 0)
		else
			GamePrint('WARN: Couldn\'t find domain triggers!')
		end

		local handle = TriggerOBB_Lookup( nil, self.caravanTriggerName )
		if (handle and handle ~= 0) then
			Trigger_RegisterListener( handle, self )
		else
			self.caravanTriggerName = AddTriggerSphere(35563.14, 214.45, 52.02, 40)
			RegisterTriggerSphereListener(self.caravanTriggerName, self)
			GamePrint('WARN: Couldn\'t find caravan trigger '..(self.triggerName or 'nil'))
		end

		--Register for DartDie events
		Global.player:addSpamListener('DartDie', self)
		
		SetSkyBox('Levels/SkyBox/MC_SkyBox.plb')

		--Can't be in MC without the goal being active!
		Global.goalManager:activate('MeatCircus')
		Global.goalManager:activate('ProtectOle') --Persists throughout level until MCBB

		local texID = LoadTexture('Textures/LevelTextures/MC_MeatCircus/MC_Tightrope.tga')
		if texID then
			SetRenderSplineTexture(texID)
		end

		self.tentSound = LoadSound('TentRustle')
		
		-- Spawn the fortune teller (redemption machine)
		self.redemptionMachine = SpawnScript('Global.Characters.RedemptionMachine', 'RedemptionMachine')
		self.redemptionMachine:setPosition(61, 91, 1056)
		self.redemptionMachine:setOrientation(0,-130,0)		

		-- Spawn and intialize Raz's dad's ghost
		self.rGhostDad = SpawnScript('MC.Props.GoodDadGhost')
		self.rGhostDad:initialize(15, 30, 0, 45, 400, 1000, 100, 400, 3, 0.7)
		self.rGhostDad:enable()
		
		-- Spawn a fake butcher, just to do saylines
		self.butcher = SpawnScript('ScriptBase', 'Butcher', 'self.charName = \'ButcherSilhouette\'')
		

		--Put all tightropes in the tent interior domain.  Kind of hacky, but what are you gonna do about it?  Huh?		
		foreach_entity_oftype('global.props.Tightrope', function(t) SetEntityDomain(t, 'TentInteriorDOMAIN') end)

		-- Hack workaround for collision reappearing to haunt us
		local ent = FindScriptObject('MeatGoo')
		if ent then SetPhysicsFlag(ent, PHYSICS_COLLIDEE, 0) end
		
		-- Fog around caravan
		self.fog = SpawnScript('NI.Effects.CaravanGroundFogFX', 'fog', '', 1)
		self.fog:run()
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		--[[ --edit Prevent entering last level unless player has completed goals,
		check for any settings requirements,
		spawn DoorFatLady.lua prop as a visual blocker
		]]
		local seedsettings = fso('RandoSeed', 'RandoSeed')
		local victoryMet = TRUE
		local rank101Met = TRUE
		local brainsMet = TRUE
		local scavhuntMet = TRUE
		local alllevelsmet = TRUE

		--check if Coach Oleander defeated
		if seedsettings.beatoleander == TRUE then
			if (Global:loadGlobal('bSavedLili') == 1) then
				GamePrint('Lili Saved!')
			else
				victoryMet = FALSE
			end
		end

		if seedsettings.rank101 == TRUE then
			if (Global:loadGlobal('rank') >= 101) then
				GamePrint('Rank 101 Achieved!')
			else
				rank101Met = FALSE
			end
		end

		if seedsettings.brainhunt == TRUE then
			--check if all 19 brains have been redeemed
			if (Global:loadGlobal('totalBrainsRedeemed') == 19) then
				GamePrint('All Brains Redeemed!') 
			else 
				brainsMet = FALSE
			end
		end

		if seedsettings.scavengerhunt == TRUE then
			--check if all 16 scav items have been redeemed
			if (Global:loadGlobal('bRedeemed16ScavengerItems') == 1) then
				GamePrint('All ScavHunt Redeemed!')
			else 
				scavhuntMet = FALSE
			end
		end

		if seedsettings.beatalllevels == TRUE then
			--check if all levels completed
			if (Global:loadGlobal('bBBCompleted') == 1) and (Global:loadGlobal('bSACompleted') == 1) and (Global:loadGlobal('bMICompleted') == 1) and (Global:loadGlobal('bNICompleted') == 1) and (Global:loadGlobal('bLOCompleted') == 1) and (Global:loadGlobal('bMMCompleted') == 1) and (Global:loadGlobal('bTHCompleted') == 1) and (Global:loadGlobal('bWWCompleted') == 1) and (Global:loadGlobal('bBVCompleted') == 1) then
				GamePrint('All Levels Completed!')
			else 
				alllevelsmet = FALSE
			end
		end
		
		
		if victoryMet == FALSE or brainsMet == FALSE or scavhuntMet == FALSE or rank101Met == FALSE or alllevelsmet == FALSE then
			GamePrint('Missing Win Condition, Spawn Fat Lady')
			remove = fso('MCTCtoMCBB')
			remove:killSelf()
			--spawn DoorFatLady
			local door = SpawnScript('global.props.DoorFatLady', 'NO_ENTRY')
			door:setPosition(-1615, -1597, 16200)
			door:setOrientation(0, -178, 0)
		else
			GamePrint('Remove Fat Lady')
			--register the end of level trigger volume to add a brain for completing this level
			RegisterTriggerVolume(self, 'tv_MCTCtoMCBB')
		end

		

		if (Global:load('bCaravanIntroPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('CaravanIntro')
		end
	end
	
	--Initiates the bunny-exchange sequence between Raz and Ole, which happens when Raz activates
	--a confused bunny.
	function Ob:startBunnyExchange()
		self:killDemonBunnies()	-- DemonBunnies are bad!  mmmkay?
		self.ole:bunnyExchangeInit()
		self.bunny:bunnyExchangeInit()
		
		local pathName = self.ole.currentPathName
		self.bunnyExchangeNum = (pathName and strsub(pathName, strlen(pathName))) or '0'
		self:setState('BunnyExchange')
	end

	function Ob:stateBunnyExchange()
		--Run bunny exchange cutscene
		Global.cutsceneScript:runCutscene( 'BunnyExchange'..self.bunnyExchangeNum, 1 )
		self:setState(nil)
	end
	
	function Ob:endStateBunnyExchange()
		self.bunny:endBunnyExchange()
		self.ole:endBunnyExchange()
	end	

	--Kills all demon bunnies in the level
	function Ob:killDemonBunnies()
		-- kill all the bunnies
		local func = function(demonBunny) 
			demonBunny:makeDeathCallbacks()
			demonBunny:killSelf() 
		end
		foreach_entity_oftype('mc.characters.DemonBunny', func)
	end

	--Runs tent intro cutscene
	function Ob:stateTentIntro()
		-- Abort the teleport sequence
		self.bunnyTentEntrance:setState(nil)
	
		--Run the cutscene
		GamePrint('Starting tent intro')
		Global.cutsceneScript:runCutscene('OleIntro', 1)
		
		--Save that we have seen it
		Global:save('bHasSeenTentIntro',1)
		
		--Turn on the entrance teleporter
		self.bunnyTentEntrance:enable()

		--Make the demon bunny attack Ole after the cutscene
		local demonBunny = self:getDemonBunny()
		demonBunny:pickTarget()
		demonBunny:setState('Chase')

		--Start Ole
		self:oleStart()
		self:setState(nil)
	end
	
	function Ob:stateBunnyTentEnd()
		Global.cutsceneScript:runCutscene('BunnyTentEnd')

		--Need to stop the teleport state of the exit, because the cutscene is playing
		Yield()
		self.bunnyTentExit:setState(nil)
		Global:save('bHasSeenTentEnd', 1)

		--Oops
		self:setState(nil)
	end

	function Ob:stateLoveRide()
		-- Abort the teleport sequence
		self.bunnyTentEntrance:setState(nil)
	
		--Run the cutscene
		Global.cutsceneScript:runCutscene('LoveRide', 1)

		--Save that we have seen it
		Global:save('bHasSeenLoveRide',1)
		
		--Turn on the exit teleporter
		self.bunnyTentExit:enable()
		
		self:setState(nil)
	end

	--Starts Ole's bunny collection	
	function Ob:oleStart()
		GamePrint('Starting oleStart')
		self.bunnyTentExit:disable()

		Global:save('bHasSeenTentEnd', 0)
		Global:save('bHasSeenLoveRide', 0)

		--To prevent the hud from covering up ole's health bar
		self.bBossBattle = 1

		self.ole:startBunnyCollection()
		FindScriptObject('BunnyGrinder1'):turnOn()
	end
	
	--Enables the teleporter at the end	
	function Ob:oleDone()
		self.bBossBattle = 0
	end
	
	--When raz dies reset Ole
	function Ob:listenerDartDie()
		if (self.ole and (self.ole.bCollecting == 1)) then
			self.ole:reset()
			self.ole:setState(nil)
		end
	end

	--Hide all safety nets
	function Ob:hideSafetyNets()
		foreach_entity_oftype('MC.Props.SafetyNet', function(net) net:hide() end)
	end

	function Ob:onPreTeleport(data, from)
		if(from == self.bunnyTentEntrance) then
			self:playSound(self.tentSound)

			--Play cutscene if it hasn't been seen yet.
			local hasSeenCutscene = Global:load('bHasSeenTentIntro')
			if (hasSeenCutscene ~= 1) then
				self:setState('TentIntro')
			end
		elseif (from == self.bunnyTentExit) then
			if ((self.bunnyTentExit:isEnabled() ~= 1) and (Global:load('bHasSeenTentEnd') == 1) 
					and (Global:load('bHasSeenLoveRide') ~= 1)) then
				self:playSound(self.tentSound)
				self:setState('LoveRide')
			elseif (self.bunnyTentExit:isEnabled() == 1) then
				self:playSound(self.tentSound)
			end
		end
	end

	function Ob:onPostTeleport(data, from)
		if (from == self.bunnyTentEntrance) then
			self:hideSafetyNets()
			if (Global:load('bOleReachedTop') ~= 1) then
				--If Ole hasn't yet reached the top, then start the puzzle
				self:oleStart()
			else
				--Otherwise just turn on all the bunny grinders
				foreach_entity_oftype('MC.Props.MeatGrinder', function (mg) mg:turnOn() end)
			end
		end
	end

	function Ob:onEnteredTriggerVolume(data, from)
    	if (data == 'tv_MCTCtoMCBB' and from == Global.player) then 
    		-- this is the extra brain of health for beating MC
    		if (Global:load('bMCTCCompleted') ~= 1) then
				Global:save('bMCTCCompleted', 1)
				Global.player:incrementMaxHealth(4)
			end
			self:loadNewLevel('MCBB')
		elseif (data == self.caravanTriggerName and from == Global.player) then
			-- start the circus music and stop the ni ambience
			self:setToCircusAudio()
			--When player enters caravan, play TentEntrance cutscene
			Global.cutsceneScript:runCutscene('EnterBunnyTent')
		elseif (data == self.tentInteriorDomainTrigger) then
			if (from == Global.player) then
				--Player is in the trigger, unsleep the domain, and sleep the exterior
				self:setDomain(self.tentInteriorDomainName, 1)
				self:setDomain(self.tentExteriorDomainName, 0)
			else
				--Any entities that come within the trigger belong in the domain
				--SetEntityDomain(from, self.tentInteriorDomainName)
			end
		elseif (data == self.caravanDomainTrigger) then
			if (from == Global.player) then
				--Player is in the trigger, unsleep the domain, and sleep the exterior
				self:setDomain(self.caravanDomainName, 1)
				self:setDomain(self.tentExteriorDomainName, 0)
			else
				--Any entities that come within the trigger belong in the domain
				--SetEntityDomain(from, self.caravanDomainName)
			end
		elseif ((from == Global.player) and (data == self.victoryTriggerName)) then
			if ((Global:load('bOleReachedTop') == 1) and (Global:load('bHasSeenTentEnd') ~= 1)) then
				self:setState('BunnyTentEnd')
			end
		end
	end

	function Ob:onExitedTriggerVolume(data, from)
    	--When player enters caravan, play TentEntrance cutscene
		if (data == self.tentInteriorDomainTrigger) then
			if (from == Global.player) and (GetPhysicsFlag(Global.player, PHYSICS_CHECKTRIGGERS) == 1) then
				--Player is in the trigger, unsleep the domain, and sleep the exterior
				self:setDomain(self.tentInteriorDomainName, 0)
				self:setDomain(self.tentExteriorDomainName, 1)
			else
				--[[
				if (GetEntityDomain(from) == self.tentInteriorDomainName) then
					--Any entities that come within the trigger belong in the domain
					SetEntityDomain(from, self.tentExteriorDomainName)
				end
				]]--
			end
		elseif (data == self.caravanDomainTrigger) then
			if (from == Global.player) and (GetPhysicsFlag(Global.player, PHYSICS_CHECKTRIGGERS) == 1) then
				--Player is in the trigger, unsleep the domain, and sleep the exterior
				self:setDomain(self.caravanDomainName, 0)
				self:setDomain(self.tentExteriorDomainName, 1)
			else
				--[[
				if (GetEntityDomain(from) == self.caravanDomainName) then
					--Any entities that come within the trigger belong in the domain
					SetEntityDomain(from, self.tentExteriorDomainName)
				end
				]]--
			end
		end
	end

	function Ob:getHintResponse()
		--Check to see if we are in a knife thrower trigger
		for i, knifeThrower in self.knifeThrowers do
			if (type(knifeThrower) == 'table') and (knifeThrower.bPlayerInTrigger == 1) then
				return {
					{
						voice = "/GLAT002FO/",--DIALOG=<<You can\'t kill those knife throwers. And somebody\'s already ripped their arms off, but you can swing on their knives once they\'re stuck in the board.>>
					}
				}
			end
		end

		if (self.ole.bCollecting == 1) then
			return {
				{
					voice = "/GLAT001FO/",--DIALOG=<<Use your TK to grab those bunnies! Or try confusing them! >>
				}
			}
		end

		--Default to this
		return {
			{
				voice = "/GLAT000FO/",--DIALOG=<<Follow that kid! Don\'t let him get hurt while your brains are connected!>>
			}
		}
	end

	--Override this so we can look up the demon bunny that gets spawned.
	function Ob:getEZSceneActor(name)
		if (name == 'demonbunny0') then
			return self:getDemonBunny()
		else
			return FindScriptObject(name)
		end
	end

	function Ob:getDemonBunny()
		--Find the demon bunny in the spawned censors list
		for name, entity in self.tCensorsSpawned do
			if (entity:IsA('MC.Characters.DemonBunny') == 1) then
				return entity
			end
		end
	end

	--Override loadNewLevel so that we can autosave before going into MCBB
	function Ob:loadNewLevel(levelName, ...)
		if (levelName == 'MCBB') then
			--Autosave before entering MCBB
			-- stop sound before autosave
			StopAllSounds()
			Autosave()
		end
		%Ob.Parent.loadNewLevel(self, levelName, asArgs(arg))
	end

	function Ob:isValid(t1, t2, idx)
		return t1[idx] ~= -1 and t2[idx] ~= -1
	end

	function Ob:setupRailslides()
		local LEFT = 1
		local MIDDLE = 2
		local RIGHT = 3

		--local rLeft = fso('splRailLovL')
		local rLeft, rRight
		local rMiddle = fso('splRailLovM')
		--local rRight = fso('splRailLovR')

		--rLeft.bOneWay = 1
		rMiddle.bOneWay = 1
		--rRight.bOneWay = 1

		--rLeft:resetTransition()
		rMiddle:resetTransition()
		--rRight:resetTransition()

		--Spline_ClearSkips(rLeft)
		Spline_ClearSkips(rMiddle)
		--Spline_ClearSkips(rRight)

		if rLeft then
			Spline_AddSkip(rLeft, 65016.9)
			Spline_AddSkip(rLeft, 64740.4)
			Spline_AddSkip(rLeft, 64477.6)
			Spline_AddSkip(rLeft, 64109.6)
			Spline_AddSkip(rLeft, 40729.1, 35688.4)
			Spline_AddSkip(rLeft, 32982.7, 26512.8)
			Spline_AddSkip(rLeft, 22421.6, 17069.0)
			Spline_AddSkip(rLeft, 10490.8, 10030.7)
			Spline_AddSkip(rLeft, 8453.6, 8112)
			Spline_AddSkip(rLeft, 4814.7, 4440)

	    end

		if rMiddle then
			Spline_AddSkip(rMiddle, 4873.1)
			Spline_AddSkip(rMiddle, 5147.0)
			Spline_AddSkip(rMiddle, 5437.1)
			Spline_AddSkip(rMiddle, 9581.2)
			Spline_AddSkip(rMiddle, 9780.7)
			Spline_AddSkip(rMiddle, 38150, 38962.9)

			Spline_AddSkip(rMiddle, 57517.4, 57824.2)
			Spline_AddSkip(rMiddle, 59200.3, 59581)
			Spline_AddSkip(rMiddle, 60929, 61242.1)

			Spline_AddSkip(rMiddle, 64129, 64482.0)
			Spline_AddSkip(rMiddle, 65630, 65968.0)
			Spline_AddSkip(rMiddle, 66801.9,67166.7)
			Spline_AddSkip(rMiddle, 73009.8, 73258.1)
		end

		if rRight then
			Spline_AddSkip(rRight, 60880.2)
			Spline_AddSkip(rRight, 60612.9)
			Spline_AddSkip(rRight, 60527.9)
			Spline_AddSkip(rRight, 37809.3, 27956.4)
			Spline_AddSkip(rRight, 20897.7, 16014.3)
			Spline_AddSkip(rRight, 11858, 11482.7)
			Spline_AddSkip(rRight, 9628.5, 9120.5)
			Spline_AddSkip(rRight, 7211.3, 6821)
			Spline_AddSkip(rRight, 3049, 2688)
		end

		local table = self.rail_transitions
		if table then
		for i=1,getn(table)-1 do
			local tCur = table[i]
			local tNxt = table[i+1]

			if self:isValid(tCur, tNxt, LEFT) and self:isValid(tCur, tNxt, MIDDLE) then
				RailAddTransition(rLeft, tCur[LEFT], tNxt[LEFT],
								  rMiddle, tCur[MIDDLE], tNxt[MIDDLE])
			end

			if self:isValid(tCur, tNxt, RIGHT) and self:isValid(tCur, tNxt, MIDDLE) then
				RailAddTransition(rMiddle, tCur[MIDDLE], tNxt[MIDDLE],
								  rRight, tCur[RIGHT], tNxt[RIGHT])
			end
		end
	    end
	end

	function Ob:setToCircusAudio()
		if self.bSetToCircusAudio == 0 then
			self:setLevelTheme('MeatCircus')
			if self.rCurrAmbientSoundHandle then
				self:stopSound(self.rCurrAmbientSoundHandle)
				self.rCurrAmbientSoundHandle = LoadSound('MCTCAmb')
				self:playSound(self.rCurrAmbientSoundHandle, 0, 0, 1)
			end
		end
	end

	return Ob
end
