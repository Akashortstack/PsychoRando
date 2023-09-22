function LevelScript(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		Ob.cutscenePlaying = 0

		Ob.numMarkersInLevel = 0
		Ob.numCardsInLevel = 0
		Ob.numScavItemsInLevel = 0
		Ob.numBrainsInLevel = 0
		Ob.numVaultsInLevel = 0
		Ob.numCobwebsInLevel = 0
		Ob.dependencies = {
			scripts = {
				'Global.Collectibles.CobwebDuster',
				'Global.Collectibles.SmellingSalts',
			},
			animations = {
				'Anims/Pokeylope/Pokeylope_Flail.jan',
				'Anims/Pokeylope/Pokeylope_Idle.jan',
			},
			textures = {
				'Textures/icons/InventoryItems/Journal_Cobweb.dds',
			}
		}

		Ob.bCheckForCombatMood = 0
		-- Define the censorPoolTable in your level script, and lay out the number and type of censors in the level
		-- The censorCode should come from the table below
		-- The scriptName should be nil... it automatically gets filled in during the loading of the level
		-- Feel free to add any and all new censor types to the table
		-- Any 'World Builder Friendly' scripts (spawners, etc...) should use these censor codes as editables,
		--		and then use the table to convert them into their proper scriptNames
		
		--EXAMPLE: Ob.censorPoolTable = {	Melee = {num = 15, censorCode = 'BV_Level1', scriptName = nil},
		--									Sniper = {num = 5, censorCode = 'Level2', scriptName = nil}, }
		
		Ob.rLevelTheme = nil	
		Ob.rCurrentlyPlayingMusic = nil
		Ob.TIMER_SPLINE = '1'
		-- Set this to the string cue for your level theme
		Ob.theme = nil
		Ob.bSaveMusic = 0
		Ob.bDontPlayThemeAtStart = 0
		Ob.iSoundPauseTime = 100
		Ob.TIMER_SOUND = '8888'
		Ob.TIMER_UPDATE_COMBAT_STATUS = '8889'
		Ob.UPDATE_COMBAT_STATUS_TIME = 1000
		Ob.TIMER_MOOD_DELAY = '8890'
		Ob.MOOD_DELAY_TIME = 1000

		Ob.MUSIC_MOOD_OFF = 0
		Ob.MUSIC_MOOD_AMBIENT = 1
		Ob.MUSIC_MOOD_COMBAT = 2
		Ob.MUSIC_MOOD_MED = 3
		Ob.MUSIC_MOOD_HIGH = 4
		Ob.iPrevMood = 1  -- to ambient music by default
		Ob.iDefaultMood = Ob.iPrevMood
		Ob.iCurrMood = 1
		Ob.bLockCurrMood = 0
		Ob.bProcessFootfalls = 0
		
		Ob.sCutsceneScriptName = nil	-- name of cutscene script file for this level
		
		Ob.footSoundsTableFile = 'Scripts/Global/Sound/FootSounds.lua'

		Ob.defaultFootSoundName = 'FS_Dirt' -- if all else fails play this sound everywhere
		Ob.defaultSlideSoundName = 'TubeSlide'
		Ob.defaultUDRLClimbSoundName = 'ClimbRope'

		Ob.defaultAmbientSoundName = nil -- The default ambient sound to play

		Ob.ledgeDirtEmitterName = 'Global.Effects.LedgeDirtFX'
		Ob.levelType = 'mental'
		Ob.targetMinRank = 50;

		-- R, G, B, A
		Ob.objectAura = {52, 180, 233, 255}
		Ob.enemyAura = {198, 87, 255,255}
		Ob.NPCAura = {31, 235, 175,255}
		Ob.objectAura.get = function(self) return self[1], self[2], self[3], self[4] end
		Ob.NPCAura.get = function(self) return self[1], self[2], self[3], self[4] end
		Ob.enemyAura.get = function(self) return self[1], self[2], self[3], self[4] end

		Ob.sLOAnimsCustomDir = 'lo'

		Ob.dartStart = nil
		
		-- if you ever mess with this sure to change it back or goodies will spawn incorrectly
		-- please don't change the variable explicitly! (it uses bit fields, so you might squash something!)
		-- check boot.lua for constants and use these functions to alter the behavior:
		-- Global.levelScript:enableGoodie(type)
		-- Global.levelScript:disableGoodie(type)
		-- Global.levelScript:enableAllGoodies()
		-- Global.levelScript:isGoodieEnabled(type)
		-- kGOODIE_HEALTH
		-- kGOODIE_PSIBLAST
		-- kGOODIE_CONFUSION
		Ob.xGoodiesDisabled = 0 

		Ob.bCustomLevelStart = 0
		Ob.bPauseMoodChange = 0
	end

	--This function preloads global inventory item classes.  It must be called from OPBL instead of onPreLoad because
	--it needs to check level type.
	function Ob:preloadInventory()
		--Items in inventory in all levels
		local allItemClasses = {
			"Global.Collectibles.DreamFluff",
			"Global.Collectibles.CobwebDuster",
			"Global.Collectibles.SmellingSalts",
			"Global.Props.InstaHintFordItem",
		}

		--Items only in real world levels
		local realWorldItemClasses = {
			"AS.Props.AS_CrowFeather",
			"AS.Props.AS_hand",
			"AS.Props.AS_Painting",
			"AS.Props.AS_SeaUrchinWhistle",
			"AS.Props.AS_StraightJacket",
			"AS.Props.Cake",
			"AS.Props.LilisBracelet",
			"AS.Props.PokeyProp",
			"Global.Props.Brainer",
			"Global.Collectibles.DowsingRod",
			"CA.Props.ScavCrowFeather",
			"CA.Props.Button",
			"CA.Props.Roast",
		}

		--Preload items that exist in all levels
		for k, className in allItemClasses do
			self:preloadClass(className)
		end

		--Preload inventory items that exist only in the real world
		if (self.levelType == 'real') then
			for k, className in realWorldItemClasses do
				self:preloadClass(className)
			end
		end
	end
	
	function Ob:setupJournal()
		-- xxx need linecodes below
		-- memories page need to add a picture of the levels' subject character
	      	--if(Global.saved.Global.memories == nil) then
	       -- 	Global.saved.Global.memories = {}
		--end
		
		-- first check to see if this level has been saved if not save it
		local szCurrenttable  = 'memories' ..  self:getLevelPrefix()
		if(Global:loadGlobal(szCurrenttable) ~= 1) then
		    Global:saveGlobal(szCurrenttable, 1)
		end
		
		local globalScript = fso('Global')
		-- add the journal stuff if the level has been entered					    
		if(Global.saved.Global ~= nil) then
			if(Global:loadGlobal('memoriesCA') ~= nil ) then
			  RegisterScrapbookEnvelope('/GLZD441TO/','camp','CA') -- whispering rock
			  -- add intro.bik because its run outside of the level
                          JournalAddMovie( 'cutScenes/prerendered/intro.bik')           
			end
			if(Global:loadGlobal('memoriesBB') ~= nil ) then
			  RegisterScrapbookEnvelope('/GLZD452TO/','coach','BB')--OLEANDER, MORCEAU
			end
			if(Global:loadGlobal('memoriesNI')  ~= nil) then
			  RegisterScrapbookEnvelope('/GLZD454TO/','BrainTumbler','NI') -- SELF: VIA BRAIN TUMBLER
			end
			if(Global:loadGlobal('memoriesMI')  ~= nil) then
			  RegisterScrapbookEnvelope('/GLZD467TO/','milla','MI')--VODELLO,  MILLA
			end
			if(Global:loadGlobal('memoriesSA')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD462TO/','Sasha_sayline','SA')--NEIN, SASHA
			end
			if(Global:loadGlobal('memoriesLL') ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD468TO/','LungfishLair','LL')--BENEATH OBLONGATA
			end
			if(Global:loadGlobal('memoriesMM')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD478TO/','boyd','MM') --COOPER, BOYD
			end
			if(Global:loadGlobal('memoriesTH')  ~= nil) then
			  RegisterScrapbookEnvelope('/GLZD482TO/','gloria','TH')--VON GOUTEN, GLORIA
			end
			if(Global:loadGlobal('memoriesWW')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD486TO/','fred','WW') -- BONAPARTE, FRED
			end
			if(Global:loadGlobal('memoriesBV')  ~= nil) then
			  RegisterScrapbookEnvelope('/GLZD487TO/','edgar','BV') -- TEGLEE, EDGAR
			end
			if(Global:loadGlobal('memoriesMC')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD503TO/','KidCoach','MC') -- YOUNG OLEANDER/SELF
			end
			 if(Global:loadGlobal('memoriesAS')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD492TO/','asylum','AS') --THORNEY TOWERS 
			end
			if(Global:loadGlobal('memoriesLO')  ~= nil) then
			   RegisterScrapbookEnvelope('/GLZD472TO/','lungfish','LO') --LUNGFISH, THE HULKING 
			end


		end
	end

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)

		--Keep track of which levels have been loaded in a global array
		if (not LevelHistory) then
			setglobal('LevelHistory', {})
		end
		tinsert(LevelHistory, GetCurrentLevelName())
		if (getn(LevelHistory) > 32) then
			tremove(LevelHistory, 1)
		end
		
		--Removed this for now, to make sure its not being used anywhere.  demoLevel is always nil.
		--if Global:loadGlobal('bForceDemo') == 1 then self.demoLevel = 1 end
		self.demoLevel = nil

		--self.musicStack = UtilityClasses:Stack()
		Global.levelScript = self
		--create the Pooled Domain, which is always asleep
		CreateChildDomain('Level', 'PooledDOMAIN')
		DomainSleep('PooledDOMAIN', 1)
		
		self.censorCodeTable =	{ 	Level1		= 'Global.Enemies.CensorLvl1',
									Level2		= 'Global.Enemies.CensorLvl2',
									Melee		= 'Global.Enemies.CensorMelee',
									Sniper		= 'Global.Enemies.CensorSniper',
									Swarm		= 'Global.Enemies.CensorSwarm',
									Beefy		= 'Global.Enemies.CensorMelee',
									Sniper		= 'Global.Enemies.CensorMelee', 
									Suicide		= 'Global.Enemies.CensorSuicide',	
									Demon		= 'Global.Enemies.Demon',
									Rat			= 'Global.Enemies.ConfusionRat',
									DemonBunny 	= 'MC.Characters.DemonBunny',
									Burly		= 'Global.Enemies.CensorBurly',
									Minion		= 'SA.Characters.MegaCensorMinion',
									CensorDummy	= 'MI.Characters.CensorDummy',
		                        }
	end

	function Ob:onPreBeginLevel()
		--Call ScriptBase's onPreBeginLevel
		%Ob.Parent.onPreBeginLevel(self)
		
		--get the bUsedSalts var, and save it as a levelscript var, so the global can be reset, all scripts should reference this levelscript var
		self.bUsedSalts = Global:loadGlobal('bUsedSalts')
		Global:saveGlobal('bUsedSalts', 0)
		
		-- reset reverb
		if ( self.levelType == 'mental' or self.Type == 'ca.CAJA' ) then
			LoadSoundData('CommonMen')
		end
		local rReverbKillSound = LoadSound('ReverbKill')
		self:playSound(rReverbKillSound, 0, 0, 1)

		-- setting to 0, in case someone save/loads while they're inhibited?
		Global.bInhibitFigments = 0

		-- setting reentry vars
		local levelPrefix = strsub(GetCurrentLevelName(), 1, 2)
		levelPrefix = strupper(levelPrefix)
		if (Global:loadGlobal('b'..levelPrefix..'Completed') == 1) then
			Global:setLevelToCompleted(levelPrefix)
			-- call the function
			if self.revisitingSetup then
				self:revisitingSetup()
			end
		end
		
		--Set this level has having been "entered".  The conditional check isn't necessary, but it saves on spam
		if (Global:loadGlobal('b'..levelPrefix..'Entered') ~= 1) then
			self.bFirstTimeInLevel = 1
			if (self.onFirstTimeInLevel) then
				self:onFirstTimeInLevel()
			end
			Global:saveGlobal('b'..levelPrefix..'Entered', 1)
		end
	
		--Special processing in mental levels	
		if (Global:isMentalLevel() == 1) then
			--Save last sub level for this prefix
			Global:save('lastSubLevel', GetCurrentLevelName())
		end

		--Whether or not the game was loaded from the main menu.  If it was not, then allo
		--for skipping ahead ranks when loading levels.
		self.bLoadedFromMainMenu = Global:loadGlobal('bLoadedFromMainMenu') or 0

		--Resets Raz's animation speed, etc after an LO level
		self:endSlowLORaz()

		SetShadowColor(0, 0, 0, 0.4)
		SetShadowBlendMode(kBLENDMODE_ALPHA_BLEND)
		SetEntityFlag(Global.player, ENTITY_LIT_SHADOW, 0)

		--Clear out any print messages
		DeletePrintMessages()

		--Stop all sounds
		SoundMuteCategory(kSOUNDCAT_ALL, 0)
		
		-- journal memory page stuff
		self:setupJournal()

		--Preload global inventory items		
		self:preloadInventory()
	end								     

	function Ob:onBeginLevel()
		--Call ScriptBase's onBeginLevel
		%Ob.Parent.onBeginLevel(self)

		--Save this level as the last sub-level within this mental level (if it is a mental level)
		if (self.levelType == 'mental') then
			Global:save('lastSubLevel', GetCurrentLevelName())
		end

		--if this is a revisit, set the flag
		if (self.levelType == 'mental') then
			local levelPrefix = strsub(GetCurrentLevelName(), 1,2)
			if (Global:loadGlobal('b' .. levelPrefix .. 'Completed') == 1) then
				Global:save('bRevisited', 1)
			end
		end
		
		--Initialize the debug menu
		Debug:initDebugMenu()

		GamePrint('LOADING LEVEL '..self.Type)

		SetTKClawSnapType('TKClaw', 'dummy')

		self.camControl = self:getCameraControl()
		Global.camControl = self.camControl
		self.camControl:initSettings(self.initCamRadius, self.initCamAltitude, self.initCamTargetHeight, self.initCamFOV)

		-- Debug stuff to rank up properly when skipping about.
		if self.bLoadedFromMainMenu ~= 1 then
			self:preparePlayer()
		else
			Global.player:savePowerMappings()
		end
		
		
		--This will enable any powers that should be enabled based on the player's game state
		self:enableAppropriatePowers()
		
		for k, v in Global.player.Inventory do
			local obj = FindScriptObject(k, 1)
			if obj and obj.onLevelLoad then obj:onLevelLoad(self) end
		end

		-- set up all of our pools for the censors in the level
		if (self.censorPoolTable) then
			local censorPool
			for k, v in self.censorPoolTable do
				if (v.num > 0) then
					v.scriptName = self:getCensorScriptName(v.censorCode)
					censorPool = self:getPool(v.scriptName)
					-- cache the edit vars, then add on the proper vars to make them start out dead and invisible
					censorPool:setLowerLimit(v.num)		-- this will actually create the censors
				end
			end
		end
		
		self.confusionFXPool = self:getPool('Global.Effects.ConfusionFX')
		self.confusionFXPool:setLowerLimit(8)

		-- make sure that our ammo is preloaded
		self:getPool('Global.Collectibles.HealthAmmo'):setLowerLimit(3)
		self:getPool('Global.Collectibles.ConfusionAmmo'):setLowerLimit(3)
		self:getPool('Global.Collectibles.PsiBlastAmmo'):setLowerLimit(3)
		self:getPool('Global.Collectibles.ArrowheadAmmo'):setLowerLimit(3)

		--spawn the Cutscene script specifically for this level (ie CAGPCutscenes.lua).  
		self.cutsceneScript = SpawnScript(self.sCutsceneScriptName or self.Type..'Cutscenes',self.Type..'Cutscenes','',1,1,1,1)
		--if it doesn't exist, try to spawn the cutsceneScript of this 'zone' (ie CACutscenes.lua)
		if (not self.cutsceneScript) then
			self.cutsceneScript = SpawnScript(strsub(self.Type, 1, 5)..'Cutscenes',self.Type..'Cutscenes','',1,1,1)
		end
		--if that doesn't exist, spawn the base cutscene script
		if (not self.cutsceneScript) then
			--spawn the base cutscene script class
			self.cutsceneScript = SpawnScript('Global.Camera.CutsceneScript', self.Type..'Cutscenes', '', 1,1,1,1)
			if (not self.cutsceneScript) then
				GamePrint('ERROR:  cutsceneScript not spawned.  It shoulda been though.  Why didn\'t it?')
			end
		end
		
		self:createTimer(self.UPDATE_COMBAT_STATUS_TIME, self.TIMER_UPDATE_COMBAT_STATUS)
		Global.cutsceneScript = self.cutsceneScript
		
		self:loadFootSounds()
		
		self.waterFXManager = SpawnScript('Global.Effects.WaterFXManager', 'WaterFXManager')

		-- for the insta hint stuff
		self.rInstaHintFord = SpawnScript('Global.Characters.InstaHintFord', 'InstaHintFord')

		if (self.Type == 'bb.BBA1') or (self.Type == 'bb.BBA2') or (self.Type == 'bb.BBLT') then
			self:disableGoodie(kGOODIE_ARROWHEAD)
		end					  
		
		--Starts the player at the appropriate spawn point.
		if self.bCustomLevelStart ~= 1 then
			self:startPlayer()
		end
	end

	function Ob:onPostBeginLevel()	
		%Ob.Parent.onPostBeginLevel(self)
		if self.levelType == 'mental' then
			LoadAnim(Global.player, 'Anims/DartNew/Helmet/DartHelmetDn.jan',0.0,0,0)
		else
			--Global.player.lives = 1
			LoadAnim(Global.player, 'Anims/DartNew/Helmet/DartHelmetUp.jan',0.0,0,0)
		end

		MoveCameraToIdeal()

		if Global:loadGlobal('bCabinned') == 1 then
			Global:saveGlobal('bCabinned', 0)
			Global.player:adjustHealth(10000) -- give him max health, max lives
			Global.player.stats.dartLives = Global.player.stats.maxLives
			if (self:getLevelName() == 'LLLL' and Global:load('LungfishDazed') == 1) then
				Global.cutsceneScript:runCutscene('CabinnedDazed', 0, 1)
			else
				Global.cutsceneScript:runCutscene('Cabinned', 0, 1)
			end
		elseif Global:loadGlobal('bKickedOut') == 1 then
			Global.player:adjustHealth(10000) -- give him max health, max lives
			Global.player.stats.dartLives = Global.player.stats.maxLives
			Global:saveGlobal('bKickedOut', 0)
			local lastLevelPrefix = strupper(strsub(Global:loadGlobal('LastLevel'), 1, 2))
			-- clear out the respawn point info if not exited with salts
			if self.bUsedSalts ~= 1 then
				Global:clearPlayerRespawnPointName(lastLevelPrefix)
			end
			
			--The mind that we are being kicked out from is not always the last level we played, if
			--the player went through the CU.  Check LastBrainingLevel instead.
			local lastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
			if (lastBrainingLevel) then
				--Because this requires multiple level loads and is hard to replicate, pop up a hard-break
				--if this is true.
				if (self:getLevelName() == 'CASA') and (lastBrainingLevel ~= 'SACU') then
					HardBreak('Had a LastBrainingLevel in CASA.  This should never happen!  Go get Joe.')
				end

				--Get the prefix of the level they were kicked out of
				local lastBrainingLevelPrefix = strupper(strsub(lastBrainingLevel, 1, 2))
				GamePrint('Kicked out to real world from '..lastBrainingLevel)
				
				--only play the kicked out of mind/smelling salt cutscenes if it was not a revisit
				if (Global:load('bRevisited', lastBrainingLevelPrefix) ~= 1) then
					GamePrint('Kicked out to real world.')
					self:playKickedOutVideo(lastBrainingLevelPrefix)
				end

				--Clear out the LastBrainingLevel since we've been kicked out.
				Global:saveGlobal('LastBrainingLevel', nil)
			else
				if (self:getLevelName() ~= 'CASA') then
					GamePrint('ERROR: Kicked out to level other than CASA without LastBrainingLevel set.')
				end
			end
		end

		-- legacy support: only put in default hazard surface controller if one hasn't already been initialized.
		if not self.forwardTriggerSurfaceMessages then
			self.forwardTriggerSurfaceMessages = SpawnScript('Global.OtherEntities.HazardSurfaceController')
		end
		
		self:setSimulationCulling()	

		-- ambience table
		if (self.tAmbientSoundLoops) then
			for k, v in self.tAmbientSoundLoops do
				-- register the trigger volumes
				RegisterTriggerVolume(self, k, 0)				
			end
		end
		--Play default ambient also
		if (self.defaultAmbientSoundName) then
			local handle = LoadSound(self.defaultAmbientSoundName)
			if (handle) then
				PlaySound(nil, handle, 1)
				self.rCurrAmbientSoundHandle = handle
			else
				GamePrint('WARN: Couldn\'t find sound handle for \''..self.defaultAmbientSoundName..'\'')
			end
		end

		-- resume sounds
		if (self.bCustomSoundUnmute ~= 1) then
			SoundUnmuteCategory(kSOUNDCAT_ALL)
		end

		-- do the music stuff last
		if (Global:load('LevelMusicName') and self.bSaveMusic == 1) then
			self.theme = Global:load('LevelMusicName')
		end
		self:initializeMusicMood()
		if (self.bDontPlayThemeAtStart ~= 1) then
			self:setLevelTheme(self.theme)
		end
		
		self.popUpWindowSound = LoadSound('PopUpWindow')
	end
	
	-- is this level considered a 'training' level?
	-- we do special things based on this consideration
	function Ob:isTrainingLevel()
       	local levelName = self:getLevelPrefix()
		if (levelName == 'BB') and (Global:isLevelCompleted('BB') ~= 1) then
			return 1
		end
		return 0
	end

	--This will play the video for the player getting kicked out of a mind.
	--	lastLevelPrefix:  The prefix of the mental level the player is getting kicked out of (Default is the last level)
	--  bWin:  Passing 1 will cause the winning version to be played (default is 0).
	function Ob:playKickedOutVideo(lastLevelPrefix, bWin)
		if (Global.cutsceneScript.cutscenePlaying ~= 1) then
			lastLevelPrefix = lastLevelPrefix or Global:loadGlobal('LastLevel')
			lastLevelPrefix = strupper(strsub(lastLevelPrefix, 1, 2))
			local szVideoName = self:getKickedOutVideoName(lastLevelPrefix)
			if (szVideoName) then
				szVideoName = szVideoName..(bWin == 1 and '_win' or '_lose')
				self:playVideo(szVideoName)
			end
		else
			GamePrint('WARN: Tried to play kicked out video while cutscene was playing.')
		end
	end

	--The name just looks nicer this way.
	function Ob:playWinningVideo(lastLevelPrefix)
		self:playKickedOutVideo(lastLevelPrefix, 1)
	end

	--This will determine which kicked out video to lay based on the prefix of the mental level
	function Ob:getKickedOutVideoName(lastLevelPrefix)
		local videoName
		if (lastLevelPrefix == 'MM') then
			videoName = 'aseb'
		elseif (lastLevelPrefix == 'WW') then
			videoName = 'asef'
		elseif (lastLevelPrefix == 'TH') then
			videoName = 'aseg'
		elseif (lastLevelPrefix == 'LO') then
			videoName = 'llel'
		elseif (lastLevelPrefix == 'BB') then
			videoName = 'caec'
		elseif (lastLevelPrefix == 'MI') then
			videoName = 'caem'
		elseif (lastLevelPrefix == 'SA') then
			videoName = 'saes'
		end
		return videoName
	end
	
	-- self.tSimulationCulling = { { instance='Rifle12', distance=5000 },
	--								{ instance='Rifle11' }, --default distance 6000
	--								{ class='MM.Props.Sedan', distance=0 },
	--								{ subclass='Global.Props.Geometry', distance=-1 }, }								
	function Ob:setSimulationCulling()
		local defaultDistance = 6000
		local SetIfSmaller = function(ent, dist)
			local olddist = GetSimulationCullDistance(ent)
			if olddist ~= 0 then dist = min(dist, olddist) end
			SetSimulationCullDistance(ent, dist)
		end

		if self.tSimulationCulling then
			for k, v in self.tSimulationCulling do
				if v.instance then
					SetIfSmaller( fso(v.instance), v.distance or defaultDistance ) 
				elseif v.class then
					foreach_entity_ofexacttype( v.class, function(ent) %SetIfSmaller( ent, %v.distance or %defaultDistance ) end )
				elseif v.subclass then
					foreach_entity_oftype( v.subclass, function(ent) %SetIfSmaller( ent, %v.distance or %defaultDistance ) end )
				end
			end
		end
	end
	
	--Starts the player in the appropriate position.  This is determined in the following order:
	--	1) If a 'teleport' variable is saved, then the player will use the teleporter of that name.
	--  2) If an oatmeal is specified in 'OatmealName', and an oatmeal by that name exists in the level,
	--		then the player will spawn at that Oatmeal.
	--  3) If the player was kicked out of a mind, then the locator 'BrainLocXX' will be used to start Raz, where 
	--		'XX' is the level prefix of the mental level he just came from.
	--	4) If a respawn point was set in the 'playerRespawnPointName' variable.  This is generally set
	--		by a GEN_respawnpoint object placed by the WB, but could be set explicitly by a call to
	--		GlobalClass:setRespawnPointName()
	--	5) If the player is exiting from a mental level into the real world, he is placed according to
	--		a set of variables saved when he entered with the prefix 'real'
	--	6) The player is placed according to the GEN_dartstart object placed in the level.
	--	7) If none exists, the player can be set to a default position set by the levelscript in variables
	--		with the prefix 'default'.
	--	8) If none of these exist, the player remains at 0,0,0.
	function Ob:startPlayer()
		--Look for teleport location
		local teleName = Global:load('teleport', 'levelLoad')
	
		--Look for oatmeal load
		local oatmeal = Global:loadGlobal('OatmealName', 'levelLoad')
		if (oatmeal) then 
			oatmeal = FindScriptObject(oatmeal)
			if (not oatmeal) then 
				GamePrint('WARN: Couldn\'t find oatmeal :'..Global:loadGlobal('OatmealName', 'levelLoad'))
			end
		end

		--Look for respawn point
		local respawnPointName, levelName = Global:getPlayerRespawnPointName()
		local respawnPoint = nil
		if levelName == self:getLevelName() then
			respawnPoint = FindScriptObject(respawnPointName,1)
		else
			if (respawnPointName) then
				GamePrint('Found respawn point for '..levelName..': '..respawnPointName)
			end
		end

		local kickoutLocation 
		if (Global:loadGlobal('bKickedOut') == 1) then
			local lastLevelName = Global:loadGlobal('LastBrainingLevel')
			if (lastLevelName) then
				local lastLevelPrefix = strsub(lastLevelName, 1, 2)
				kickoutLocation = self:getKickoutLocation(lastLevelPrefix)
				if (not kickoutLocation) then
					HardBreak('Couldn\'t find kickout location')
				end
			end
			--Clear out LastBrainingLevel in onPostBeginLevel but only if kicked out.
		end
		
		if teleName then
			GamePrint('Raz spawning at teleport ' .. teleName)
--			Global:setPlayerRespawnPointName(teleName)
			local launchAt = Global:load('teleLaunchAt', 'levelLoad')
			Global:save('teleport', nil, 'levelLoad')
			local tele = FindScriptObject(teleName)
			local dx, dy, dz = tele:getPosition()
			Global.player:setPosition(dx, dy, dz)
			Global.player:setOrientation(tele:getOrientation())
			
			if launchAt then
				local launchTime = Global:load('teleLaunchTime', 'levelLoad')
				Global:save('teleLaunchAt', nil, 'levelLoad')
				launchAt = FindScriptObject(launchAt)
				local tx, ty, tz = launchAt:getPosition()
				RotateTowards2D(Global.player, tx, ty, tz, 20000)
				local ux, uy, uz = GetEntityUp(Global.player)
				local wayPts, numPts = MovementUtils:getFakeGravSpline(dx, dy, dz, tx, ty, tz, launchTime, ux, uy, uz)
				self.jumpSpline = CreateAbsolutePath(Global.player, launchTime, kSPLINEMODE_ONCE, wayPts)
				SplineOrientationFlag(Global.player,0)
				self:createTimerSecs(launchTime, self.TIMER_SPLINE)	-- need to distroy spline later
			elseif tele.bDontSnap ~= 1 then
				SnapEntityToGround(Global.player)
			end
		elseif oatmeal then
			GamePrint('Spawning player at oatmeal: '..oatmeal.Name)
			Global:saveGlobal('OatmealName', nil, 'levelLoad')
			oatmeal:endTeleport()
		elseif kickoutLocation then
			GamePrint('Raz spawning at kickout location '..kickoutLocation.Name)
			Global.player:setEverything(kickoutLocation)
			SnapEntityToGround(Global.player)
		elseif respawnPoint then
			GamePrint('Raz spawning at respawnPoint '..respawnPoint.Name)
			Global.player:setEverything(respawnPoint)
			if respawnPoint.bDontSnap ~= 1 then
				SnapEntityToGround(Global.player)
			end
		elseif self.dartStart then  
			GamePrint('Raz spawning at DartStart ' .. self.dartStart.Name)
			Global.player:setEverything(self.dartStart)
			if self.dartStart.bDontSnap ~= 1 then
				SnapEntityToGround(Global.player)
			end
		elseif self.defaultX ~= nil then 
			-- default starting position, in case you load a sublevel or something directly from the menu
			-- mainly for testing purposes
			GamePrint('Raz spawning at Default')
			Global.player:setPosition(self.defaultX, self.defaultY, self.defaultZ)
			if self.defaultOrientX ~= nil then
				Global.player:setOrientation(self.defaultOrientX, self.defaultOrientY, self.defaultOrientZ)
			end
		end	
	end

	function Ob:getKickoutLocation(lastLevelPrefix)
		return FindScriptObject('BrainLoc'..lastLevelPrefix)
	end

	
	--Advances and equips a player to an appropriate rank and state.  Used only for testing 
	--and debugging, should not be used in the final game.
	function Ob:preparePlayer()
		if GetMappedPower(kQUICKPICK_TRIGR) == kPOWER_NONE then MapPowerToButton(kPOWER_PSIBLAST,kQUICKPICK_TRIGR) end
		if GetMappedPower(kQUICKPICK_WHITE) == kPOWER_NONE then MapPowerToButton(kPOWER_LEVITATION,kQUICKPICK_WHITE) end
		if GetMappedPower(kQUICKPICK_BLACK) == kPOWER_NONE then MapPowerToButton(kPOWER_SHIELD,kQUICKPICK_BLACK) end

		Global.player:savePowerMappings()

		--Reset rank from 1, so that rank based powers will be reenabled
		local startRank = Global.player.stats.rank or 1
		Global.player:setRank(1)

		local brainJars = 0
		local bGetFakePowers = 0
		--edit removed bGetFakePowers for Rando Testing
		--Game wasn't loaded from the main menu.  Allow for ranking funny business.
		if self:getLevelPrefix() == 'LO' and startRank < 20 then
			--bGetFakePowers = 1
			startRank = 20
		elseif self:getLevelName() == 'ASGR' and startRank < 30 then
			--bGetFakePowers = 1
			startRank = 30
		elseif self:getLevelPrefix() == 'MM' and startRank < 40 then
			--bGetFakePowers = 1
			startRank = 40
		elseif self:getLevelName() == 'ASCO' and startRank < 45 then
			--bGetFakePowers = 1
			startRank = 45
			brainJars = 3
		elseif self:getLevelPrefix() == 'TH' and startRank < 55 then
			--bGetFakePowers = 1
			startRank = 55
			brainJars = 7
		elseif self:getLevelPrefix() == 'WW' and startRank < 60 then
			--bGetFakePowers = 1
			startRank = 60
			brainJars = 7
		elseif self:getLevelPrefix() == 'BV' and startRank < 65 then
			--bGetFakePowers = 1
			startRank = 65
			brainJars = 7
		elseif (self:getLevelName() == 'ASUP') and startRank < 70 then
			--bGetFakePowers = 1
			startRank = 68
			brainJars = 7
		elseif (self:getLevelName() == 'ASLB') and startRank < 70 then
			--bGetFakePowers = 1
			startRank = 70
			brainJars = 16
		elseif ((self:getLevelPrefix() == 'MC') or (self:getLevelName() == 'ASRU')) and startRank < 75 
				and startRank < 75 then
			--bGetFakePowers = 1
			startRank = 75
			brainJars = 19

			--edit removed for RandoTesting
			--[[if (Global:loadGlobal('bSavedLili') ~= 1) then
				--Give Raz lili's brain
				Global.player:incrementMaxHealth(1)
				Global:saveGlobal('bSavedLili', 1)
			end]]
		end

		--Because all fake ranks are above 30, we can enable all powers if rank was faked
		if (bGetFakePowers == 1) then
			Global:saveGlobal('bFirestartingAvailable', 2)
			Global:saveGlobal('bTelekinesisAvailable', 2)
			Global:saveGlobal('bInvisibilityAvailable', 2)
		end

		Global.player:setRank(startRank)

		--The list of brains to be picked up (in order of difficulty)
		local brains = { 
			'Kitty', 'Franke', 'JT', -- asgr
			'Chloe', 'Chops', 'Milka', 'Maloof', -- asco
			'Benny', 'Bobby', 'Clem', 'Crystal', 'Dogen', 'Elka', 'Nils', 'Phoebe', 'Quentin', -- asup
			'Vernon', 'Mikhail', 'Elton', -- aslb
		}
		
		--Add the specified brains to the player's inventory, FOR MORE HEALTH!
		for i = 1, brainJars, 1 do
			if not brains[i] then 
				GamePrint('Not enough brains!')
				break
			end

			--Only if they haven't gotten it yet
			if (not Global.player.stats.brains[strlower(brains[i])]) then
				self:sendMessage(Global.player, 'Brain', brains[i], 1)
				self:sendMessage(Global.player, 'BrainRedeemed', brains[i], 1)
			end
		end

		--Make sure we have a CALevelState
		if (not Global:load('CALevelState', 'CA')) then
			if (Global:loadGlobal('bLOCompleted') == 1) then
				Global:save('CALevelState', 7, 'CA')
			else
				Global:save('CALevelState', 1, 'CA')
			end
		end
		
		--Give global items to the player when loading from the level menu
  		if (Global.player:isInInventory('Brainer') ~= 1) then
  			local brainer = SpawnScript('Global.Props.Brainer', 'Brainer')
  			Global.player:addToInventory(brainer,0,1)
  		end
  		if (Global.player:isInInventory('Bacon') ~= 1) then
  			local bacon = SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
  			Global.player:addToInventory(bacon,0,1)
  		end
  		if (Global.player:isInInventory('SmellingSalts') ~= 1) then
  			local salts = SpawnScript('Global.Collectibles.SmellingSalts', 'SmellingSalts')
  			Global.player:addToInventory(salts,0,1)
  		end
	end

	--Enable powers depending on whether or not levels have been completed.
	function Ob:enableAppropriatePowers()
		--First clear out all powers
		if Global:loadGlobal('bUsedAllPowersCheat') == 1 then
			EnablePower(kPOWER_ALL)
			Global.player:restorePowerMappings()
			return

		--edit to prevent game from removing custom dropped powers
		--else
			--DisablePower(kPOWER_ALL)
		end

		--Reenable rank-based powers by resetting rank
		--edit to prevent game from removing custom dropped powers
		--local rank = Global.player.stats.rank
		--Global.player:setRank(1, 0)
		--Global.player:setRank(rank or 1, 0)
		
		--Apply aquired powers based on their associated variables
		--edit for Marksmanship
		if (Global:loadGlobal('bGotMarksmanship') == 1) then
			EnablePower(kPOWER_PSIBLAST)
		--edit to remove learners permit				
		--elseif (Global:loadGlobal('bHasPsiBlastLearnersPermit') == 1) then
			--EnablePower(kPOWER_PSIBLAST, 1)
		else
			DisablePower(kPOWER_PSIBLAST)			
		end

		--edit for Rando Levitation	
		if (Global:loadGlobal('bGotRandoLevitation') == 1) then
			EnablePower(kPOWER_LEVITATION)
		--edit to remove learners permit				
		--elseif (Global:loadGlobal('bHasLevitationLearnersPermit') == 1) then
			--EnablePower(kPOWER_LEVITATION, 1)
		else
			DisablePower(kPOWER_LEVITATION)			
		end

		--edit for RandoShield
		if Global:loadGlobal('bGotRandoShield') == 1 then
			EnablePower(kPOWER_SHIELD)
		else
			DisablePower(kPOWER_SHIELD)
		end

		--edit to RandoClairvoyance
		if Global:loadGlobal('bGotRandoClairvoyance') == 1 then
			EnablePower(kPOWER_CLAIRVOYANCE)
		else
			DisablePower(kPOWER_CLAIRVOYANCE)
		end

		--edit to RandoConfusion
		if Global:loadGlobal('bGotRandoConfusion') == 1 then
			EnablePower(kPOWER_CONFUSION)
		else
			DisablePower(kPOWER_CONFUSION)
		end

		-- ****************************************************************************		
		--edit Custom bGot checks for custom rando items

		if Global:loadGlobal('bGotTelekinesis') == 1 then
			EnablePower(kPOWER_TELEKINESIS)
		else
			DisablePower(kPOWER_TELEKINESIS)
		end

		if Global:loadGlobal('bGotFirestarting') == 1 then
			EnablePower(kPOWER_FIRESTARTING)
		else
			DisablePower(kPOWER_FIRESTARTING)
		end

		if Global:loadGlobal('bGotInvisibility') == 1 then
			EnablePower(kPOWER_INVISIBILITY)
		else
			DisablePower(kPOWER_INVISIBILITY)
		end
		-- ****************************************************************************		

		

		--Restore the player's saved power mappings
		Global.player:restorePowerMappings()
	end
	
-- ****************************************************************************			
	
	function Ob:onDestroyed(blevelUnloading)
		Global.player:fireDissipate()
		if self.jumpSpline then
			DestroyPath(self.jumpSpline)
			self.jumpSpline = nil
			KillTimer(self, self.TIMER_SPLINE)
		end
	end	
	
-- *************************************************************************************************************
	function Ob:onTimer(id)
		if id == self.TIMER_SPLINE then		-- this timer used for teleporters
			KillTimer(self, id)
			DetachFromSpline(Global.player)
			DestroyPath(self.jumpSpline)
			self.jumpSpline = nil
		elseif id == self.TIMER_SOUND then
			self:killTimer(self.TIMER_SOUND)
		elseif id == self.TIMER_UPDATE_COMBAT_STATUS then
			if (self.bCheckForCombatMood == 1) then
				if self:isRazInCombat() == 1 then
--				PrintNote('in combat')
					-- INSERT FUNCTION CALL TO MUSIC SAYING RAZ IS IN COMBAT
					if (self.iCurrMood ~= self.MUSIC_MOOD_COMBAT) then
						self:setMusicMood(self.MUSIC_MOOD_COMBAT, 1)			
						self.bLockCurrMood = 1						
					end
				else
					-- INSERT FUNCTION CALL TO MUSIC SAYING RAZ IS NOT IN COMBAT
					if (self.iCurrMood == self.MUSIC_MOOD_COMBAT) then
						if (self.iCurrMood == self.MUSIC_MOOD_COMBAT) then
							--						PrintNote('not in combat')
							self:restoreMusicMood()	
						end
					end
				end
			end
		elseif id == self.TIMER_MOOD_DELAY then
			self.bPauseMoodChange = 0
			self:killTimer(self.TIMER_MOOD_DELAY)
			if self.iStoredMood then
				self:setMusicMood(self.iStoredMood)
				self.iStoredMood = nil
			end
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

-- *************************************************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if (from == Global.player) then
			if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
				if (self.tMusicMoodTrigVols[data].mood) then
					self.sMoodTrigVolEntered = data
					self:setMusicMood(self.tMusicMoodTrigVols[data].mood)		
				end
			end
			-- for ambience
			if (self.tAmbientSoundLoops and self.tAmbientSoundLoops[data]) then
				local handle = LoadSound(self.tAmbientSoundLoops[data].soundCueName)
				if (handle) then
					self.tAmbientSoundLoops[data].soundInstance = PlaySound(nil, handle, 1)
					self.rCurrAmbientSoundHandle = handle
				end
			end
		end
	end

-- *************************************************************************************************************

	function Ob:onExitedTriggerVolume(data,from)
		if (from == Global.player) then
			if (self.tMusicMoodTrigVols and self.tMusicMoodTrigVols[data]) then
				if self.sMoodTrigVolEntered == data then
					self:restoreMusicMood(self.iDefaultMood)
				end
			end
			-- for ambience
			if (self.tAmbientSoundLoops and self.tAmbientSoundLoops[data]) then
				local handle = LoadSound(self.tAmbientSoundLoops[data].soundCueName)
				if (handle) then
					if (IsSoundPlaying(handle) == 1 and self.tAmbientSoundLoops[data].soundInstance) then
						StopSoundInstance(handle, self.tAmbientSoundLoops[data].soundInstance)
						self.rCurrAmbientSoundHandle = nil
					end
				end
			end
		end
	end 

-- *************************************************************************************************************

	function Ob:getLevelName()
		--return strsub(GetCurrentLevelName(), 4)
		return GetCurrentLevelName()
	end

-- *************************************************************************************************************

	function Ob:getLevelPrefix()
		return strupper(strsub(GetCurrentLevelName(), 1, 2))
	end

-- **********************************************************************************************************							   
	
	function Ob:beginCutscene(name, source, bUninterruptible, bKeepHandler)
		GamePrint('Beginning cutscene '..name)
		if self.currCSName then
			GamePrint('ERROR: Can\'t nest cutscenes.  Attempted to start '..name..' when '..self.currCSName..' was already playing.')
			StackTrace()
			return nil
		end
		if not name then
			GamePrint('ERROR: Cutscenes must be named.  Not entering requested cutscene.')
			return nil
		end
		self.currCSName = name or ''
		self.currCSSource = source or self
		self.bUninterruptible = bUninterruptible
		self.bKeepHandler = bKeepHandler or 0
		self:dontRunPlayerControls(1, self.bKeepHandler)
		
		self.camControl:pushAndSetScript(self)
		EnableAuras(0)
		RegisterCutscene(self)
		
		Global.player:stopMelee()
		Global.player:interruptPowers()
		--EnableRumble(0)
		SetCameraShakeEnable(0)
		SoundSetDucking(1)
		Global.player:killAllRazFX()         --kill any Raz effects that might be running
		SetVelocity(Global.player, 0,0,0)
		Global.player:goToDefaultState()
		Global.player:setNewAction('Stand')
		LoadAnim(Global.player, 'Anims/DartNew/Listen.jan', .2, 1) 
		self.cutscenePlaying = 1
		self.bCutsceneOverridden = 0
		
		return self.cutscenePlaying
	end

-- **********************************************************************************************************							   
	
	function Ob:endCutscene(name, bSetChaseCameraPaused)
		GamePrint('Ending cutscene '..name)
		if self.currCSName ~= name then
			GamePrint('ERROR: Attempted to end cutscene '..name..' but '..(self.currCSName or '(nil name)')..' was the active cutscene.')
			return nil
		end
		-- Mark the current cutscene as nil before running the cleanup function, in case they want to run another cutscene
		-- from the cleanup state.
		local csName = self.currCSName
		self.currCSName = nil
		--CameraUtils:restoreCamera(self.currCSCam)
		EnableAuras(1)
		UnregisterCutscene(self)
		self:dontRunPlayerControls(0, self.bKeepHandler)
		
		if not (self.bKeepCameraControl and self.bKeepCameraControl==1) then
			self.camControl:removeCam(self, bSetChaseCameraPaused)
		end			
		self.cutscenePlaying = 0
		-- Now call the cleanup function.
		if type(self.currCSSource['stateCleanupCS'..csName]) == 'function' then
			self.currCSSource:setState('CleanupCS'..csName)
		else
			GamePrint('WARNING: Cutscene '..csName..' has no cleanup state in source object '..self.currCSSource.Name)
		end
	end

-- **********************************************************************************************************							   
	
	function Ob:onCutsceneOverride()
		if self.bUninterruptible == 1 then return end
		self.bCutsceneOverridden = 1
		--never set the paused chase flag when interrupted
		if self.bKeepCameraControl then
			self.bKeepCameraControl = nil
		end			
		if not self.currCSName then
			GamePrint('ERROR: Cutscene overridden, but no cutscene was running.')
			return
		end
		self:endCutscene(self.currCSName, 0)
		MoveCameraToIdeal()
	end

-- **********************************************************************************************************							   

	--[[@ setLevelTheme(music)
		Sets the level theme, and immediately starts playing it if an override isn't currently in place (see overrideTheme).
	Args
		music: String or sound handle of music to play.
	]]--
	function Ob:setLevelTheme(theme, bDoCrossFade)
		local oldTheme = self.rLevelTheme
		-- save the theme
		if (self.bSaveMusic == 1) then
			Global:save('LevelMusicName', theme)
		end
		if theme and type(theme) == 'string' then
			self.rLevelTheme = LoadSound(theme)
		else
			self.rLevelTheme = theme
		end
		if oldTheme and IsSoundPlaying(oldTheme) == 1 and bDoCrossFade ~= 1 then
			StopSound(oldTheme)
		end
		if self.rLevelTheme and self.bMusicOverridden ~= 1 then 
			self.rLevelMusicInstance = PlaySound(nil, self.rLevelTheme, 1, 0) 
		end
	end

-- **********************************************************************************************************							   

	function Ob:resumeLevelTheme()
		if self.rLevelTheme and IsSoundPlaying(self.rLevelTheme) ~= 1 then
			self:playSound(self.rLevelTheme, 0, 0, 1)
		end
	end

	function Ob:stopLevelTheme()
		if self.rLevelTheme then
			self:stopSound(self.rLevelTheme)
		end
	end

-- **********************************************************************************************************							   

	--[[@ restoreTheme(music)
		Use in conjunction with restoreTheme to temporarily override the level theme.
	Args
		music: String or sound handle of music to play instead of the level theme.
	]]--
	function Ob:overrideTheme(music, bCrossFade)
		self.bMusicOverridden = 1
		local oldOverride = self.rMusicOverride
		if music and type(music) == 'string' then
			self.rMusicOverride = LoadSound(music)
		else
			self.rMusicOverride = music
		end
		if self.rLevelTheme and IsSoundPlaying(self.rLevelTheme) and bCrossFade ~= 1 then
			StopSound(self.rLevelTheme)
		end
		if oldOverride and IsSoundPlaying(oldOverride) then
			StopSound(oldOverride)
		end
		if self.rMusicOverride then
			PlaySound(nil, self.rMusicOverride, 1, 0)
		end
	end

-- **********************************************************************************************************							   

	--[[@ restoreTheme()
		If you've overridden the theme with your own cutscene music or somesuch, restore with this call.
	]]--
	function Ob:restoreTheme()
		if self.bMusicOverridden == 1 then
			self.bMusicOverridden = 0
			if self.rMusicOverride then
				if IsSoundPlaying(self.rMusicOverride) then
					StopSound(self.rMusicOverride)
				end
				self.rMusicOverride = nil
			end
			self:setLevelTheme(self.rLevelTheme)
		end
	end
	
	
-- **********************************************************************************************************							   

	function Ob:setMusicMood(mood, bForce, bDontDelay)		
		if (self.bPauseMoodChange ~= 1) then
			local bMood = 0
			if (mood) then		
				bMood = 1
				if (self.bLockCurrMood == 0 or bForce == 1) then
					local triggerval = 0
					self.iPrevMood = self.iCurrMood
					self.iCurrMood = mood
					-- note: all the values here are going to be changed...
					if (mood == self.MUSIC_MOOD_OFF) then
						triggerval = 0
					elseif (mood == self.MUSIC_MOOD_AMBIENT) then
						triggerval = 0.10
					elseif (mood == self.MUSIC_MOOD_COMBAT) then
						triggerval = 0.25
					elseif (mood == self.MUSIC_MOOD_MED) then
						triggerval = 0.25
					elseif (mood == self.MUSIC_MOOD_HIGH) then
						triggerval = 0.35
					else
						bMood = 0
					end
					SoundSetTriggerVariable(0, triggerval)
					if (bForce) then
						self.bLockCurrMood = 0
					end					
					if (bDontDelay ~= 1) then
						self.bPauseMoodChange = 1						
						self:createTimer(self.MOOD_DELAY_TIME, self.TIMER_MOOD_DELAY)
					end
				elseif (self.bLockCurrMood == 1) then
					self.iPrevMood = mood
				end
			end
			if bMood ~= 1 then
				GamePrint('ERROR: Invalid mood '..(mood or 'nil')..'.')
				StackTrace()
			end
		else
			self.iStoredMood = mood
		end
	end

-- **********************************************************************************************************							   

	function Ob:restoreMusicMood(iPrevMoodOverride)		
		if (self.iPrevMood or iPrevMoodOverride) then
			local mood = iPrevMoodOverride or self.iPrevMood
			self:setMusicMood(mood)
			self.bLockCurrMood = 0
		end
	end

-- **********************************************************************************************************							   

	-- to set up a table of moods for trigger volumes, set up like this in the levelscript
    -- self.tMusicMoodTrigVols = 
	--   { <name of the trigger volume> = { trigVolName = <name of the trigger volume>, mood = <mood const, e.g. self.MUSIC_MOOD_COMBAT }

	function Ob:initializeMusicMood()
		self:setMusicMood(self.iCurrMood, nil, 1)

		-- check to see if the level has any triggers
		for i = 1, 5 do
			local sTrigBase = 'tv_MOOD_SILENT'
			local currMood = self.MUSIC_MOOD_OFF
			if i == 2 then
				sTrigBase = 'tv_MOOD_AMBIENT'
				currMood = self.MUSIC_MOOD_AMBIENT
			elseif i == 3 then
				sTrigBase = 'tv_MOOD_MEDIUM'
				currMood = self.MUSIC_MOOD_MED
			elseif i == 4 then
			    sTrigBase = 'tv_MOOD_COMBAT'
				currMood = self.MUSIC_MOOD_COMBAT
			elseif i == 5 then
			    sTrigBase = 'tv_MOOD_HIGH'
				currMood = self.MUSIC_MOOD_HIGH
			end

			if (not self.tMusicMoodTrigVols) then
				self.tMusicMoodTrigVols = {}
			end
			-- iterate to see if there's any triggers
			local index = 1
			while (1) do
				local tName = sTrigBase..index
				local trigHandle = TriggerOBB_Lookup(nil, tName)
				if trigHandle then
					-- found trig vol
					self.tMusicMoodTrigVols[tName] = { }
					self.tMusicMoodTrigVols[tName].trigVolName = tName
					self.tMusicMoodTrigVols[tName].mood = currMood			
					index = index + 1
				else
					break
				end
			end
		end

		-- read in the table of trig vols
		if (self.tMusicMoodTrigVols) then
			local max = getn(self.tMusicMoodTrigVols)			
			for k, v in self.tMusicMoodTrigVols do
				if (self.tMusicMoodTrigVols[k].trigVolName) then
--					RegisterTriggerVolume(self, self.tMusicMoodTrigVols[k].trigVolName, 0)
					RegisterTriggerVolume(self, k, 0)
				end
			end			
		end		
	end

-- **********************************************************************************************************							   

	function Ob:loadNewLevel(levelName, skipFade, overrideDebug, DebugNextLevel)
		if Global.debugLevelLoads == 1 and overrideDebug ~= 1 then
			self.lastControlHandler = GetControlHandler()
   			SetScriptControlHandler(self)		
			self.loadLevelText = DisplayText('/XBUTTON/: Load '..levelName, 100, 80)
			SetTextPriority(self.loadLevelText,51);
			if DebugNextLevel then
				self.beatLevelText = DisplayText('/YBUTTON/: Beat '..levelName..' and load '..DebugNextLevel, 100, 110)
			else
				self.beatLevelText = DisplayText('/YBUTTON/: Beat '..levelName..' and reload '..GetCurrentLevelName(), 100, 110)
			end
			SetTextPriority(self.beatLevelText,51);
			self.cancelText = DisplayText('/ABUTTON/: Cancel', 100, 140)
			SetTextPriority(self.cancelText,51);
			self.levelToLoad = levelName
			self.levelToLoadIfBeat = DebugNextLevel
			DebugSetGameSpeed(.01)
		else
			self:xLoadNewLevelImpl(levelName, skipFade)
		end
	end

	function Ob:xLoadNewLevelImpl(levelName, skipFade, lastLevelOverride)
		if skipFade ~= 1 then
			local r,g,b,a,tganame = FadeGetCurrentState()
			FadeToColor(r,g,b,a,tganame, 0,0,0,255, nil, 0.25)
		end

		--If we are going from a real level to a mental level, then we should look for the last
		--  sub-level the player was in and put them there.
		if (self.levelType == 'real') then
			local levelPrefix = strsub(levelName, 1, 2)
			if (Global:isMentalLevel(levelPrefix) == 1) then
				--Going from real to mental, use lastSubLevel if it exists
				local lastSubLevel = Global:load('lastSubLevel', levelPrefix)
				levelName = lastSubLevel or levelName
			end
		end

		GetPlayerLSO().forceItemPutaway = 1
		GetPlayerLSO():replaceSelectedItemInPsack(1,1)
		UnLoadPriorityAnim(GetPlayerLSO(),1,0.2)

		if (self.levelToLoad ~= GetCurrentLevelName()) then
	  		Global:saveGlobal('LastLevel', lastLevelOverride or GetCurrentLevelName())
		end
		Global:saveGlobal('LastLevelType', self.levelType)
		Global:saveGlobal('LoadingNewLevel', 1) -- Used to figure out if we were loaded from level menu
		
		LoadNewLevel(levelName)
	end

	--Returns to the player to the CU 
	function Ob:returnToCU()
		if (self.levelType == 'mental') then
			Global:save('teleport', 'respawn'..self:getLevelPrefix(), 'levelLoad')
		else
			GamePrint('WARN: Trying to go to the CU from the real world!')
		end
		self:loadNewLevel('CASA')
	end

-- **********************************************************************************************************							   

	function Ob:handleScriptControls(iControl)
		if not iControl then
			iControl = ControlTable -- default to global value to make invocation from engine easier
		end
		if iControl.button_pressed.JOY_A == 1 or iControl.button_pressed.JOY_X == 1 or iControl.button_pressed.JOY_Y == 1 then
			RemoveText(self.loadLevelText)
			RemoveText(self.beatLevelText)
			RemoveText(self.cancelText)
			SetControlHandler(self.lastControlHandler)
			DebugSetGameSpeed(1)
		end
		if iControl.button_pressed.JOY_X == 1 then 
			self:xLoadNewLevelImpl(self.levelToLoad)
		elseif iControl.button_pressed.JOY_Y == 1 then 
			Global:setLevelToCompleted(strsub(self.levelToLoad, 1, 2))
			Global:saveGlobal('LastLevel', self.levelToLoad)
			if self.levelToLoadIfBeat then
				self.levelToLoad = self.levelToLoadIfBeat
			else
				self.levelToLoad = GetCurrentLevelName()
			end
			self:xLoadNewLevelImpl(self.levelToLoad, nil, self.levelToLoad)
		elseif iControl.button_pressed.JOY_A == 1 then
			--if Global.levelScript.cutsceneScript.cutscenePlaying == 1 then
				--self.cutsceneScript:endCutscene()
			--end
		end
	end

-- **********************************************************************************************************							   
	
	function Ob:getCameraControl()
	    local camControl = FindScriptObject('CameraControl', 1)
		if (not camControl) then
			camControl = SpawnScript('Global.Camera.CameraControl', 'CameraControl', '', 1, 1)
		end
		return camControl
	end
	
-- **********************************************************************************************************							   

	-- By default, pools created in this manner call resetEntity on the pooled objects when retrieved.
	-- If that's not good for some object, feel free to add some flexibility to this function.
	-- If you pass in an editVars argument, it'll look for a pool that creates objects with those editvars set.
	-- So yes, you can have multiple separate pools that create Global.Props.Geometry, assuming the editvar strings
	-- are different.
	function Ob:getPool(type, editVars)		
		-- Find a pool with matching object type and editvars
		editVars = editVars or ''
		local i = 1
		local pool = FindScriptObject('Pool'..strlower(type)..i, 1)
		while pool and pool.editVars ~= editVars do
			i = i+1
			pool = FindScriptObject('Pool'..strlower(type)..i, 1)
		end
		if not pool then
			local editVarString = ''
			if editVars then
				editVars = gsub(editVars, '\'', '\\\'')
				editVars = 'self.editVars = \''..editVars..'\''
			else
				editVars = ''
			end
			pool = SpawnScript('Global.Util.Pool', 'Pool'..strlower(type)..i, 'self.typeToCreate = \''..type..'\' '..editVars, 0)
		end
		return pool
	end

-- **********************************************************************************************************	
	
	function Ob:getCensorScriptName(censorCode)
		if (self.censorCodeTable[censorCode]) then
			return self.censorCodeTable[censorCode]
		end
		
		GamePrint('ERROR: Unknown Censor Code \'' .. censorCode .. '\' being passed to getCensorScriptName() in LevelScript')
		return nil
	end

-- **********************************************************************************************************							   
	
	--returns the particle emitter pool specified in type, which is the fully qalified class name
	function Ob:getPEPool(type)
		local pool = FindScriptObject(strlower(type), 1)
		if not pool then
			pool = SpawnScript(type, strlower(type), '', 0)
		end
		return pool
	end				   

	function Ob:loadFootSounds()
		self.footSoundHandles = {}
		self.landSoundHandles = {}
		self.slideSoundHandles = {}
		self.UDRLClimbSoundHandles = {}

		-- Footstep and land sounds

		DoFile(self.footSoundsTableFile)
		if (not GlobalFootSoundTable) then
			GamePrint('Foot Sounds table did not load')
			for i = 0, 15 do
				self.footSoundHandles[i] = LoadSound(self.defaultFootSoundName)
				self.landSoundHandles[i] = LoadSound(self.defaultFootSoundName .. '_Land')
			end
		else
			for i = 0, 9 do
				if (GlobalFootSoundTable[i + 1] == nil or GlobalFootSoundTable[i + 1] == '') then
					self.footSoundHandles[i] = LoadSound(self.defaultFootSoundName)
					self.landSoundHandles[i] = LoadSound(self.defaultFootSoundName .. '_Land')
				else	
					self.footSoundHandles[i] = LoadSound(GlobalFootSoundTable[i + 1])
					self.landSoundHandles[i] = LoadSound(GlobalFootSoundTable[i + 1] .. '_Land')
				end
			end
			
			local prefix = self:getLevelPrefix()
			
			for i = 10, 15 do
				if (LevelFootSoundTable[prefix] ~= nil) then
					if (LevelFootSoundTable[prefix][i - 9] == nil or LevelFootSoundTable[prefix][i - 9] == '') then
						self.footSoundHandles[i] = LoadSound(self.defaultFootSoundName)
						self.landSoundHandles[i] = LoadSound(self.defaultFootSoundName .. '_Land')
					else	
						self.footSoundHandles[i] = LoadSound(LevelFootSoundTable[prefix][i - 9])
						self.landSoundHandles[i] = LoadSound(LevelFootSoundTable[prefix][i - 9] .. '_Land')
					end
				else
					self.footSoundHandles[i] = LoadSound(self.defaultFootSoundName)
					self.landSoundHandles[i] = LoadSound(self.defaultFootSoundName .. '_Land')
				end
			end
		end

		-- sanity check
		for i = 0, 15 do
			if (self.footSoundHandles[i] == 0) ~= (self.landSoundHandles[i] == 0) then
				GamePrint(TT_Warning, format("Found foot sound but not land sound (or vice versa): %d", i))
			end
		end


		-- load in custom slide sound
		if (not GlobalSlideSoundTable) then
			GamePrint('Slide Sounds table did not load')
			for i = 0, 15 do
				self.slideSoundHandles[i] = LoadSound(self.defaultSlideSoundName)
			end
		else
			for i = 0, 9 do
				if (GlobalSlideSoundTable[i + 1] == nil or GlobalSlideSoundTable[i + 1] == '') then
					self.slideSoundHandles[i] = LoadSound(self.defaultSlideSoundName)
				else	
					self.slideSoundHandles[i] = LoadSound(GlobalSlideSoundTable[i + 1])
				end
			end
			
			local prefix = self:getLevelPrefix()
			
			for i = 10, 15 do
				if (LevelSlideSoundTable[prefix] ~= nil) then
					if (LevelSlideSoundTable[prefix][i - 9] == nil or LevelSlideSoundTable[prefix][i - 9] == '') then
						self.slideSoundHandles[i] = LoadSound(self.defaultSlideSoundName)
					else	
						self.slideSoundHandles[i] = LoadSound(LevelSlideSoundTable[prefix][i - 9])
					end
				else
					self.slideSoundHandles[i] = LoadSound(self.defaultFootSoundName)
				end
			end
		end
		-- load in custom climb sounds
		if (not GlobalUDRLClimbSoundTable) then
			GamePrint('Slide Sounds table did not load')
			for i = 0, 15 do
				self.UDRLClimbSoundHandles[i] = LoadSound(self.defaultUDRLClimbSoundName)
			end
		else
			for i = 0, 9 do
				if (GlobalUDRLClimbSoundTable[i + 1] == nil or GlobalUDRLClimbSoundTable[i + 1] == '') then
					self.UDRLClimbSoundHandles[i] = LoadSound(self.defaultUDRLClimbSoundName)
				else	
					self.UDRLClimbSoundHandles[i] = LoadSound(GlobalUDRLClimbSoundTable[i + 1])
				end
			end
			
			local prefix = self:getLevelPrefix()
			
			for i = 10, 15 do
				if (LevelUDRLClimbSoundTable[prefix] ~= nil) then
					if (LevelUDRLClimbSoundTable[prefix][i - 9] == nil or LevelUDRLClimbSoundTable[prefix][i - 9] == '') then
						self.UDRLClimbSoundHandles[i] = LoadSound(self.defaultUDRLClimbSoundName)
					else	
						self.UDRLClimbSoundHandles[i] = LoadSound(LevelUDRLClimbSoundTable[prefix][i - 9])
					end
				else
					self.UDRLClimbSoundHandles[i] = LoadSound(self.defaultFootSoundName)
				end
			end
		end
	end
	
	function Ob:playLandSound(soundID)
		PlaySound(nil, self.landSoundHandles[soundID],0,0)
	end

	function Ob:playFootSound(soundID)
  		PlaySound(nil,self.footSoundHandles[soundID],0,0)
	end

	function Ob:playUDRLClimbSound(soundID)
  		PlaySound(nil,self.UDRLClimbSoundHandles[soundID],0,0)
	end

	function Ob:getSlideSound(soundID)
		return self.slideSoundHandles[soundID]
	end
				    	

-- ************************************************************************************************
	--[[@ isRazInCombat()
	Category
		Lso Helper
	Date
	
	Args
		none
	Returns
		1 if raz is currently fighting censors, 0 if he is not
	Example
	
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		currently this function only works for telling you if raz is fighting a censor.  as more enemies are added
		to the game they should update this function to also check if raz is fighting one of those enemies
	]]--
	
	function Ob:isRazInCombat()
        if not Global.notSaved.seenByCensorFrame then
			return 0
		end
		
		local frameCount = GetGameTimeSecs()*30
		if (frameCount > Global.notSaved.seenByCensorFrame + 60) then	-- 60 = 2 secs
			return 0
		else
			return 1
		end
	end
	
	
-- ************************************************************************************************

       --[[@ footfall(event)
	 	Override this function to implement level-specific footprint handling.
		You'll also want to set bProcessFootfalls to 1.
		You probably want to know which surface number you're on; that's in Global.player.
		currTriggerSurfaceIDNum and
		prevTriggerSurfaceIDNum
	Args
		event: the foot ('left' or 'right'); passed by Dart.lua
		runType: 'Creep', 'Walk', or 'Run'
	Returns
		1 if the levelscript handled the event; 0 otherwise.
	]]--
    	function Ob:footfall(foot, runType)
		return 0
	end
	
	-- Call this for generic footprint handling.  Easy to just plop this into your footfall override.
	-- You'll want to define self.leftFootprintTexture and self.rightFootprintTexture in your level script (file path to the texture).
	function Ob:genericFootprint(foot, runType)
		if Global.player.currTriggerSurfaceIDNum == 1 then
			local x, y, z, fx, fy, fz = Global.player:getFootPos(((foot == 'left') and 1) or 0)
			local ux, uy, uz = GetEntityUp(Global.player)
			local px, py, pz = Global.player:getPosition()
			AttachDecal((foot == 'left' and self.leftFootprintTexture) or self.rightFootprintTexture, 10, x+100*ux, y+100*uy, z+100*uz, -ux, -uy, -uz, 48, 48, fx, fy, fz, 1, 1, 1, 1, 0, 1)
			return 1
		end
		return 0
	end
	
-- ********************************************************************************************************						

	--[[@ setDomain(name, bEnabled)
		Handy thing that tests for existence of normal and LSO version; only prints a warning if neither exists.
	Args
		name: domain name without LSO in front or DOMAIN in back
		bEnabled: 1 for awake
	]]--
	function Ob:setDomain(name, bEnabled)
		local bExists = 0
		local dName = name
		-- figure out what to call it
		if (not strfind(name, 'DOMAIN')) then
            dName = name..'DOMAIN'
		end
		local dLSOName = 'LSO'..dName
		
		-- set the domain
		if (DomainExists(dLSOName) == 1) then
			bExists = 1
			DomainSleep(dLSOName, (bEnabled == 1 and 0) or 1)
		end
		if (DomainExists(dName) == 1) then
			bExists = 1
			DomainSleep(dName, (bEnabled == 1 and 0) or 1)
		end
		if bExists ~= 1 then
			GamePrint('WARNING: Could not enable/disable either '..dName..' or '..dLSOName)
		end
	end
	
-- ********************************************************************************************************						

	function Ob:disableLedgeFX()
		self.templedgeDirtFX  = Global.player.ledgeDirtFX 
		Global.player.ledgeDirtFX = nil
	end

-- ********************************************************************************************************						

	function Ob:reEnableLedgeFX()
		if (self.templedgeDirtFX) then
			Global.player.ledgeDirtFX = self.templedgeDirtFX
		end
	end

-- ********************************************************************************************************						

	function Ob:addTutorialBox(msg, tex, bBlocking, sound)
		if (Global:loadGlobal('bDisableTutorialBoxes') ~= 1) then
			SetCameraShakeEnable(0)
			if (sound) then
				if IsSoundPlaying(sound) ~= 1 then
					PlaySound(nil, sound, 0)
				end
			else
				if IsSoundPlaying(self.popUpWindowSound) ~= 1 then
					PlaySound(nil, self.popUpWindowSound, 0)
				end
			end
			AddTutorialBox(msg, tex)

			if (bBlocking == 1) then
				Yield()	--AddTutorialBox() won't let the next frame go until its done.
			end
		else
			GamePrint('Skipped Tutorial Box ['..msg..']: '..GetLocalizedText(msg))
		end
	end
	
-- ********************************************************************************************************						

	function Ob:isCutscenePlaying()
		if (Global.levelScript.cutscenePlaying == 1 or Global.cutsceneScript.cutscenePlaying == 1) then
			return 1
		end
		return 0
	end
	
	function Ob:startSlowLORaz()
		-- If you change this, change it in LOCB.
		--edit removing for Qol?
		SetAnimSpeedScale(Global.player, .55)
		self.oldEnglish = GetPhysicsConstant(PHYSICS_MAXENGLISHSPEED)
		self.oldEnglish2 = GetPhysicsConstant(PHYSICS_MAXENGLISHSPEED2)
		SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED, 200)
		SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED2, 400)
		self.bUseLOAnims = 1

		--Add special monster idles
		AddExtraRazIdle('megaidle', 1, 0)
		AddExtraRazIdle('MegaIdle2', 1, 0)
		AddExtraRazIdle('MegaIdle4', 1, 0)
		AddExtraRazIdle('MegaIdle5', 1, 0)
	end
	
	function Ob:endSlowLORaz()
		Global.player.Razilla = 0
		SetAnimSpeedScale(Global.player, 1)
		--SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED, self.oldEnglish)
		--SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED2, self.oldEnglish2)
		SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED, 550)
		SetPhysicsConstant(Global.player, PHYSICS_MAXENGLISHSPEED2, 90000)
		self.bUseLOAnims = 0
	end

	-- Returns an actor corresponding to the name provided in an EZScene file.  Usually is just FindScriptObject.
	function Ob:getEZSceneActor(name)
		return FindScriptObject(name)
	end


	function Ob:enableGoodie(type)
		self.xGoodiesDisabled = BitAnd(self.xGoodiesDisabled, BitNot(type))		
	end
	
	function Ob:disableGoodie(type)
		GamePrint('DISABLE TYPE = ' .. type)
		self.xGoodiesDisabled = BitOr(self.xGoodiesDisabled, type)		
	end
	
	function Ob:isGoodieEnabled(type)
		if (BitAnd(self.xGoodiesDisabled, type) == 0) then
			return 1
		end
		return 0
	end
	
	function Ob:enableAllGoodies()
		self:enableGoodie(kGOODIE_HEALTH)
		self:enableGoodie(kGOODIE_PSIBLAST)
		self:enableGoodie(kGOODIE_CONFUSION)
		self:enableGoodie(kGOODIE_ARROWHEAD)
	end

	function Ob:getHintResponse()
		local prefix = self:getLevelPrefix()
		local response

		--Global:saveGlobal('b'.. prefix ..'Completed', 1);
		--Global.player.stats.cardsRedeemed = 90
		--Global.player.stats.rank = self.targetMinRank - 1
		--Global.player.stats.rank = self.targetMinRank + 1

		if Global:loadGlobal('b'.. prefix ..'Completed') == 1 then
			response = {
				{line = 'Not much to do here except clean up all the cobwebs, collect all the figments, and get any vaults that are left.',
				voice = "/GLAU003FO/"}--DIALOG=<<Not much to do here except clean up all the cobwebs, collect all the figments, and get any vaults that are left.>>
			}
		elseif 3 > Global.player.stats.cardsRedeemed/9 and 'mental' ~= self.levelType then
			response = {
				{line = 'Don\'t turn up your nose at recycling. You gather up those PSI Cards, and get your self some Cores, and come down to my lab and we\'ll rank you up quick!',
				voice = "/GLAU000FO/"}--DIALOG=<<Don\'t turn up your nose at recycling. You gather up those PSI Cards, and get your self some Cores, and come down to my lab and we\'ll rank you up quick!>>
			}
		elseif Global.player.stats.rank < self.targetMinRank then
			response = {
				{line = 'Maybe if you were a higher rank, you could get some psi powers that could help you out.',
				voice = "/GLAU001FO/"}--DIALOG=<<Maybe if you were a higher rank, you could get some psi powers that could help you out.>>
			}
		else
			response = {
				{line = 'You can rank up if you collect more figments, sort more emotional baggage, or collect more mental cobwebs.',
				voice = "/GLAU002FO/"}--DIALOG=<<You can rank up if you collect more figments, sort more emotional baggage, or collect more mental cobwebs.>>
			}

		end

		return response
	end

	function Ob:isLevelCompleted(levelName)
		levelName = levelName or GetCurrentLevelName()
		local levelPrefix = strsub(levelName, 1, 2)
		levelPrefix = strupper(levelPrefix)
		if levelPrefix then
			if (Global:loadGlobal('b'..levelPrefix..'Completed') == 1) then
				return 1
			else
				return 0
			end
		end		
	end

	function Ob:onEndLevel()
		Global.player:doNothing()
		%Ob.Parent.onEndLevel(self)
		DebugSetGameSpeed(1)
	end
	

	-- Non-blocking decomp function, tells you what revisiting levels is all about.
	-- It could just be a runCutscene right now, but I'm hedging my bets-- I anticipate changes.
	function Ob:runRevisitHint(bBlocking)
		if Global:loadGlobal('b'..self:getLevelPrefix()..'Completed') == 1 then
			Global:save('bLevelRevisted', 1)
		end
		if Global:load('bRevisitLevelFirstTimePlayed') ~= 1 and Global:loadGlobal('b'..self:getLevelPrefix()..'Completed') == 1 then
			Global.cutsceneScript:runCutscene('RevisitLevelFirstTime', bBlocking)
		else
			Global.cutsceneScript:fadeIn(0)
		end
	end
	
	return Ob
end
