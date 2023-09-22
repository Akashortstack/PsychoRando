function GlobalClass(Ob)
	function construct()
		local Ob = CreateObject('ScriptBase')

		-- Collide layer constants
		Ob.CL_ENEMIES = 2
		Ob.CL_ENEMY_PROJECTILES = 4 -- For when you want projs to ignore enemies and vice versa, but not enemies to ignore enemies

		Ob.CL_LO_DEBRIS = 3

		Ob.CL_FRED_AND_PIECES = 4
		Ob.CL_TURRET_AND_TRACERS = 4
		Ob.CL_PROJECTILES = 4
		Ob.CL_LO_BARS = 4
		Ob.CL_ASGR_CROWS = 4

		-- Pushability constants
		Ob.PUSH_EASIEST = 33
		Ob.PUSH_EASIEST_SPEED = 400
		Ob.PUSH_HARD_GIO = 233
		Ob.PUSH_HARD_GIO_SPEED = 150
		Ob.PUSH_CENSOR = 151
		Ob.PUSH_CENSOR_SPEED = 225
		Ob.PUSH_HARDEST = 255

		Ob.bSpamSaveData = 1

		Ob.figmentPointsPerLevel = {
			BB=500,
			NI=800,
			SA=600,
			MI=700,
			LO=800,
			MM=600,
			TH=400,
			WW=400,
			BV=400,
			MC=100,
		}
		Ob.cobwebsPerLevel = {
			BB=5,
			NI=5,
			SA=5,
			MI=5,
			LO=5,
			MM=5,
			TH=7,
			WW=7,
			BV=7,
			MC=3,
		}

		--This maps mental levels to the physical level the player came from
		Ob.mentalLevelMap = {
			BB = 'CAKC',
			SA = 'CASA',
			MI = 'CABH',
			NI = 'CASA',
			LO = 'LLLL',
			MM = 'ASGR',
			TH = 'ASGR',
			WW = 'ASCO',
			BV = 'ASCO',
			MC = 'CASA',
		}

		-- A table mapping a given level with all the levels required before it.
		-- MC is missing because it never gets set as completed.
		Ob.tLevelPrereqs = {
			SA = 'BB',
			MI = 'SA',
			NI = 'MI',
			LL = 'NI',
			LO = 'LL',
			MM = 'LO',
			TH = 'MM',
			WW = 'MM',
			BV = 'MM',
		}
		
		-- Set of saved vars for completed levels
		Ob.tCompletedSavedVar = {
		
			-- These are global variables that should be set for each level
			Global = {
				BB = {
				},
				SA = {
					BeenInSashasLab = 1,
					bHasPsiBlastLearnersPermit = 1,
					bGotPsiBlast = 1,
				},
				MI = {
					bHasLevitationLearnersPermit = 1,
					bGotLevitation = 1,
				},
				NI = {
					NIState = 4,
				},
				LL = {
				},
				LO = {
					bGotShield = 1,
					bLOMACompleted = 1,
				},
				MM = {
					bGotClairvoyance = 1,
				},
				TH = {
				},
				WW = {
				},
				BV = {
					bGotConfusion = 1,
				},
			},
	
			-- These are local variables that should be set for EVERY level.
			ALL = {
				lastSubLevel = 'nil',	--The last sub-level the player was in.
				playerRespawnPointName = 'nil',	--The name of the respawn point locator
			},
		
			-- bb
			BB = {
				bIntroPlayed = 1,
				bMoreIntroPlayed = 1,
				GunOff = 1,
				ReturnFromBBTemp = 1,
				bBBLTLogIntroPlayed = 1,
				bBBMinefieldBeaten = 1,
				FigmentIntroductionSeen = 1,
				bFigmentIntroductionPlayed = 1,
				bEmoBagTutorialPlayed = 1,
				bEmoTagTutorialPlayed = 1,
				GunOff = 1,
				PlayedTargetIntro = 1,
				bTowerOfPowerDown = 1,
				gotFirstFigment = 1,
				bBBA2IntroductionPlayed = 1,
				bCampkidTrapezeBridgePlayed = 1,
				bBBMinefieldBeaten = 1,
				bEmoBagTutorialPlayed = 1,
				bEmoTagTutorialPlayed = 1,
				bBBLIVideoPlayed = 1,
				bFlagRaisedFinishFlag = 1,
				bCobwebIntroductionPlayed = 1,
				bBobbyTurretPlayed = 1,
				bPassTargetsPlayed = 1,
				bClemCrystalIntroPlayed = 1,
				bTrapezeIntroPlayed = 1,
			},			
			-- bv
			BV = {
				ArchwayPaintingHungSeen = 1,
				DefeatedByWrestler = nil,
				BVRBIntroSeen = 1,
				bBulldogSuccessCutsceneRan = 1,
				PaintingEntered = nil,
				TKHintSeen = 1,
				ZLockHintSeen = 1,
				ShieldHintSeen = 1,
				lastCheckpoint = nil,
				PsiFloatHintSeen = 1,
				ArchwayPaintingHungSeen = 1,
				PutAwayItemHintSeen = 1,
				SelectItemHintSeen = 1,
				HeartsCollected = 1,
				HeartsRedeemed = 1,
				DiamondsCollected = 1,
				DiamondsRedeemed = 1,
				ClubsCollected = 1,
				ClubsRedeemed = 1,
				SpadesCollected = 1,
				SpacesRedeemed = 1,
				bGotConfusion = 1,
				bBulldogSuccessCutsceneRan = 1,
				bMatadorPlacated = 1,
				tigerPaintingIntroSeen = 1,
				dragonPaintingIntroSeen = 1,
				eaglePaintingIntroSeen = 1,
				cobraPaintingIntroSeen = 1,
				tigerDefeated = 1,
				dragonDefeated = 1,
				eagleDefeated = 1,
				cobraDefeated = 1,
				
			},
			-- ll
			LL = {
				Part2Path20CutSeen = 1,
				Part1Path9CutSeen = 1,
				LungfishDazed = 1,
				Part2Path20CutSeen = 1,
				Part1Path9CutSeen = 1,
				Part2Path20CutSeen = 1
			},
			-- lo
			LO = {
				ShieldWallOff = 1,
				SeenCoachIntro = 1,
				UltraCoachDead = 1,
				bBlimpPilotBreakoutPlayed = 1,
				LOINSeen = 1,
				SawElecTruckIntroduction = 1,
				SawBlimpPilotInstructions = 1,
				bBeamWall2IntroPlayed = 1,
				BeamWall2PuzzleSolved = 1,
				bMicrowaveTunnelDestroyed = 1,
				ShieldWallOff = 1,
				bTankIntroductionPlayed = 1,
				bZealotIntroductionPlayed = 1,
				bPlaneIntroductionPlayed = 1,
				bZealotJailBreakoutPlayed = 1,
				bPickedUpTank = 1,
				TanksThrown = 3,
				TankHits = 3,
				bElecTruckIntroduction11Played = 1,
				bTurretIntroductionPlayed = 1,
				bBigCannonDefeated = 1,
				bThePlanPlayed = 1,
				bReachedDamTop = 1,
				bShipsNotDockedPlayed = 1,
				bShipsDockedPlayed = 1,
			},
			-- mi
			MI = {
				bIntroPlayed = 1,
				FinishedTutorial = 1,
				FinishedPlunger = 1,
				SeenMIIntro = 1,
				bHasSeenPlungerIntro = 1,
				bBouncerArmsOpen = 1,
				FinishedPlunger = 1,
				bIntroFlyByPlayed = 1,
				bGotBowlHint = 1,
				bQuentinsSecondJumpPlayed = 1,
				bTutorialFinishedPlayed = 1,
				bCompletedChallenge1MIFL1 = 1,
				bMIFL1ChallengeCompletedPlayed = 1,
				bActivatedMIFL_ballReturn1 = 1,
				bActivatedMIFL_ballReturn2 = 1,
				bActivatedMIFL2_ballReturn3 = 1,
				bActivatedMIFL3_ballReturn4 = 1,
				bFloatOverHereDarlingPlayed = 1,
				bGoodPartyLineDone = 1,
				bTakeItHigherLineDone = 1,
				bPlungerIntroPlayed = 1,
				bCompletedChallenge1MIFL2 = 1,
				bMIFL2ChallengeCompletedPlayed = 1,
				bOpenDoorPlayed = 1,
				bYouWinPlayed = 1,
				bGotHazardHint = 1,
			},
			-- mm
			MM = {
				DemonEncounter1Complete = 1,
				DemonEncounter2Complete = 1,
				DemonEncounter3Complete = 1,
				BoydClairvoySeen = 1,
				FirstExitBoyds = 1,
				bKeypadPuzzleSolved = 1,
				MMIntroSeen = 1,
				bSniperSquirtJumpPlayed = 1,
				bSquirtIntroPlayed = 1,
				SawSquirtJump = 1,
				bPickUpPhonePlayed = 1,
				MMDMIntroSeen = 1,
				bSignGmenClairvoyanceCluePlayed = 1,
				lastSubLevel = 'MMI2',
				bSniperIntroPlayed = 1,
				bCemeteryArrestPlayed = 1,
				bBoydClairPlayed = 1,
			},
			-- sa
			SA = {
				SeenSAIN = 1,			
				bTutorialFinished = 1,
				currentFace = nil,
				SAMadeToMegaCensor = 1,
			},
			-- ni
			NI = {
				bMyOwnCreationPlayed = 1
			},
			-- th
			TH = {
				PhantomIntroSeen = 1,
				bTHIntroPlayed = 1,
				bBonitaHeckledPlayed = 1,
				bTHMSArcLamp4FirstTime = 1,
				bBeckyFirstLine = 1,
				StorageRoomDoorOpened = 1,
				bAlreadySpokeToJasper = 1,
				bJasperGaveKnightOfJoyScript = 1,
				bBonitaIntroPlayed = 1,
				bCloudCarHintPlayed = 1,
				bHagathaHomeLeftDay1Played = 1,
				bHagathaHomeLeftDay2Played = 1,
				bHagathaHomeLeftDay3Played = 1,
				bHagathaHomeLeftDay4Played = 1,
				bHagathaHomeLeftNight1Played = 1,
				bHagathaHomeMiddleDay1Played = 1,
				bHagathaHomeMiddleDay2Played = 1,
				bHagathaHomeMiddleDay3Played = 1,
				bHagathaHomeMiddleNight1Played = 1,
				bHagathaHomeMiddleNight2Played = 1,
				bHagathaHomeRightDay2Played = 1,
				bHagathaHomeRightDay3Played = 1,
				bHagathaHomeRightDay4Played = 1,
				bHagathaHomeRightNight1Played = 1,
				bHagathaHomeRightNight2Played = 1,
				bIntroLeftDayPlayed = 1,
				bIntroLeftNightPlayed = 1,
				bIntroMiddleDayPlayed = 1,
				bIntroMiddleNightPlayed = 1,
				bIntroRightDayPlayed = 1,
				bIntroRightNightPlayed = 1,
				bJasperCatwalkHintPlayed = 1,
				bJasperIntroPlayed = 1,
				bJasperLastIntroPlayed = 1,
				bLoveBoatRightDayPlayed = 1,
				bPlayInstructionsSeen = 1,
				bTHCWPhantomFled = 1,
				Set3Reached = 1,
				EnteredBonitaRoom = 1,
				DayNightSwitchIntroSeen = 1,
				DragonDestroyed = 1,
				DragonDestroyed = 1,
				bHasScript_KnightOfJoy = 1,
				bHasScript_LoveBoat = 1,
				bHasScript_HagathaHome = 1,
				THMSCurrSet = 1,
				THMSCurrNight = 0,
				StorageRoomDoorOpen = 1,
				bShadow1Seen = 1,
				bShadow2Seen = 1,
				bShadow3Seen = 1,
				bShadow4Seen = 1,
				SwitchCandleLit = 1,
				SwitchHasCandle = 1,
			},
			-- ww
			WW = {
				Bridge1Fixed = 1,
				Bridge2Fixed = 1,
				bActivationCutsceneFredOrNapoleonPlayed = 1,
				bFredSaysCoinMeltedPlayed = 1,
				bFredSaysCoinMeltedInfoPlayed = 1,
				bRazFindsCoinPlayed = 1,
				bFredSignsCaringFormPlayed = 1,
				AllSnailsCollected = 1,
				HeartyKnightFed = 1,
				bActivationCutscenePlayed = 1,
				DrawBridgeDown = 1,
				bSoldier1IntroductionPlayed = 1,
				Soldier1IntroductionSeen = 1,
				Soldier2IntroductionSeen = 1,
				Soldier3IntroductionSeen = 1,
				DrawbridgeCloseSeen = 1,
				GotAnswersFromFred = 1,
				bHouseCarpenter1stTimePlayed = 1,
				bHouseCarpenter2ndTimePlayed = 1,
				bHouseKnight1stTimePlayed = 1,
				bHouseKnight2ndTimePlayed = 1,
				bHousePeasantOne1stTimePlayed = 1,
				bHousePeasantOne2ndTimePlayed = 1,
				bHousePeasantThree1stTimePlayed = 1,
				bHousePeasantThreeSoldierGonePlayed = 1,
				bHousePeasantTwo1stTimePlayed = 1,
				bHousePeasantTwoSoldierGonePlayed = 1,
				bKnightBecomesPiecePlayed = 1,
				bPeasantOneBecomesSoldierPlayed = 1,
				bPeasantThreeBecomesSoldierPlayed = 1,
				bPeasantTwoBecomesSoldierPlayed = 1,
				bSnailsBecomePiecePlayed = 1,
				GamePieceSoldier1Killed = 1,
				GamePieceSoldier2Killed = 1,
				GamePieceSoldier3Killed = 1,
				WineGlassMoved = 1,
				GamePieceCarpenterActive = 0,
				GamePieceMilitia1Active = 0,
				GamePieceMilitia2Active = 0,
				GamePieceMilitia3Active = 0,
				GamePieceSnailActive = 0,
				GamePieceKnightActive = 0,
				bWWINPlayed = 1,
				bRazTakeStrongholdPlayed = 1,
			},			
		}

		 Ob.EndCredits = {
		       { '/GLZD264TO/', 'Tim Schafer'},
		       { '/GLZD265TO/', 'David Dixon'},
			{ '/GLZD266TO/', 'Scott Campbell' },
			{ '/GLZD267TO/', 'Erik Robson' },
			{ '/GLZD268TO/' , 'Dave Russell'},
			{ '/GLZD269TO/' , 'Matt Franklin'},
			{ '/GLZD270TO/' , 'Caroline Esmurdoc'},
			{ '/GLZD271TO/' , 'Jon Stone\nPaul Du Bois\nLance Burton\nLloyd Pique\nWilson Hom'},
			{ '/GLZD271TO/', 'Kee Chi\nThien Tran\nAnna Kipnis\nAndrew Falth\nBrad Muir'},
			{ '/GLZD271TO/', 'Joe Virskus\nAlex Mouton'},
			{ '/GLZD272TO/', 'Dion Hopkins\nKim Cogan'},
			{ '/GLZD272TO/', 'Razmig Mavlian\nNathan Stapley\nMark Hamer\nSean Wagstaff'},
			{ '/GLZD274TO/', 'Raymond Crook\nChris Schultz\nMark Hamer\nTyler Hurd\nRazmig Mavlian'},
			{ '/GLZD273TO/', 'Peter Chan'},
			{ '/GLZD275TO/', 'Fred Selker\nGeoff Soulis\nKjeld Pedersen\nRhandy Cruz\nTerry Redfield'},
			{ '/GLZD274TO/', 'Eric Ingerson\nSandra Christiansen'},
			{ '/GLZD277TO/' , 'Peter McConnell'},
			{ '/GLZD276TO/' , 'Malena Slettom\nCamilla Fossen\nLleslle Aclaro'},
			{ '/GLZD279TO/' , 'Khris Brown'},
			{ '/GLZD278TO/' , 'Bay Area Sound\nClint Bajakian\nJared Emerson-Johnson\nJulian Kwasneski'},
			{ '/GLZD281TO/' , 'Kelli Townley'},
			{ '/GLZD282TO/' , 'Steven Peck'},
			{ '/GLZD283TO/' , 'Josh Pfeiffer'},
			{ '/GLZD284TO/' , 'Seth Benson\nBert Chang\nTony Gomez\nIsaac Marotte\nSam Keshavarz'},	 
		}

		Ob.tLevelAchievementName = {
			BB = 'ACH_COMP_BB',
			SA = 'ACH_COMP_SA',
			MI = 'ACH_COMP_MI',
			LO = 'ACH_COMP_LO',
			MM = 'ACH_COMP_MM',
			TH = 'ACH_COMP_TH',
			WW = 'ACH_COMP_WW',
			BV = 'ACH_COMP_BV',
			AS = 'ACH_COMP_AS',
			MC = 'ACH_COMP_MC',
		}
		Ob.tCollectionAchievementNames = {
			bEmoBagsComplete = 'ACH_COLL_ALLEMOBAG',
			bVaultsComplete = 'ACH_COLL_VAULTS',
			bFigmentsComplete = 'ACH_COLL_ALLFIGMENTS',
		}

		Ob.tRichPresenceNames = {
			--ACTIONLAND_NIGHT = 'Action Land',
			ACTI = 'Action Land',
			ASCO = "Thorney Towers Home for the Disturbed: Lower Floors",
			ASGR = "Thorney Towers Home for the Disturbed: Grounds",
			ASLB = "Thorney Towers Home for the Disturbed: The Lab of Dr. Loboto",
			ASRU = "Thorney Towers Home for the Disturbed: Ruins",
			ASUP = "Thorney Towers Home for the Disturbed: Upper Floors",

			BBA1 = "Coach Oleander's Basic Braining: Obstacle Course 1",
			BBA2 = "Coach Oleander's Basic Braining: Obstacle Course 2",
			BBLT = "Coach Oleander's Basic Braining: Obstacle Course Finale",

			BVES = "Black Velvetopia: Edgar's Sanctuary",
			BVMA = "Black Velvetopia: Matador's Arena",
			BVRB = "Black Velvetopia: Running Against the Bull",
			BVWT = "Black Velvetopia: Wrestling Tiger",
			BVWE = "Black Velvetopia: Wrestling Eagle",
			BVWD = "Black Velvetopia: Wrestling Dragon",
			BVWC = "Black Velvetopia: Wrestling Cobra",

			CABH	   = "Whispering Rock Psychic Summer Camp: Boathouse and Beach",
			--CABH_NIGHT = "Whispering Rock Psychic Summer Camp: Boathouse and Beach",
			CABU	   = "Whispering Rock Psychic Summer Camp: Bunkhouse",
			CAGP	   = "Whispering Rock Psychic Summer Camp: GPC and Wilderness",
			--CAGP_NIGHT = "Whispering Rock Psychic Summer Camp: GPC and Wilderness",
			CAJA	   = "Whispering Rock Psychic Summer Camp: Ford's Sanctuary",
			CAKC	   = "Whispering Rock Psychic Summer Camp: Kids' Cabins",
			--CAKC_NIGHT = "Whispering Rock Psychic Summer Camp: Kids' Cabins",
			CALI	   = "Whispering Rock Psychic Summer Camp: Lodge",
			--CALI_NIGHT = "Whispering Rock Psychic Summer Camp: Lodge",
			CAMA	   = "Whispering Rock Psychic Summer Camp: Main Grounds",
			--CAMA_NIGHT = "Whispering Rock Psychic Summer Camp: Main Grounds",
			CARE	   = "Whispering Rock Psychic Summer Camp: Reception Area",
			--CARE_NIGHT = "Whispering Rock Psychic Summer Camp: Reception Area",

			CASA = "Sasha's Underground Lab",

			LLLL = "Lair of the Lungfish",
			LOCB = "Lungfishopolis: Goggalor versus Kochamara",
			LOMA = "Lungfishopolis",

			MCTC = "Meat Circus: Tent City",
			MCBB = "Meat Circus: The Big Top",

			MIFL = "Milla's Dance Party: The Lounge",
			MIMM = "Milla's Dance Party: The Race",
			MILL = "Milla's Dance Party: The Party",

			MMI1 = "The Milkman Conspiracy: The Neighborhood",
			MMI2 = "The Milkman Conspiracy: Book Depository",
			MMDM = "The Milkman Conspiracy: The Den Mother",

			NIMP = "Nightmare in the Brain Tumbler: The Woods",
			NIBA = "Nightmare in the Brain Tumbler: The Brain Tank",

			SACU = "Sasha's Shooting Gallery",

			STMU = "The Excellent Start Menu",

			THMS = "Gloria's Theater: The Stage",
			THCW = "Gloria's Theater: The Catwalks",
			THFB = "Gloria's Theater: Confrontation",

			WWMA = "Waterloo World",
		}

		return Ob
	end
	if not Ob then
		Ob = construct()
	end
	construct = nil
	
-- ************************************************************************************************

	function Ob:onSpawn()
		Global = self

		-- Set up the localization string table
		self.StringTable = {}
		self.StringTable.Level = {}
		self.StringTable.Global = {}

		-- these variables get saved with saved games, and live for the lifespan of the current game
		self.saved = {}
		-- NOT-SAVED VARIALBES**********************************************************************************
		-- these variables get nuked on every level load
		self.notSaved = {}


		%Ob.Parent.onSpawn(self)
		self.player=GetPlayerLSO()

		-- For compatibility, set up the old Dart.saved and Dart.notSaved to point to our tables
		self.player.saved = self.saved
		self.player.notSaved = self.notSaved

		-- initing savegame info; likely temp as new/load should init these.
	       	self.saved.MM = {} 
	       	self.saved.NI = {}
	       	self.saved.AS = {}
	       	self.saved.BB = {}
	       	self.saved.MI = {}
	       	self.saved.MC = {}
	       	self.saved.TH = {}
	       	self.saved.CA = {}
	       	self.saved.SA = {}
	       	self.saved.BV = {}
	       	self.saved.powers = {}
		self.saved.Inventory = {}
		
		--Set by levelscript.stateInit()
		self.levelScript=nil
		self.level=nil
		self.zone=nil

		--self.debugLevelLoads = IsRunningAtDF()
		self.debugLevelLoads = 0 -- temp removed
		
		self.tIgnoreWarningSavedVar = {
			Global = {
				playerRespawnPointName = 1,				
			},
			BB = {
			},
			BV = {
			},
			CA = {
			},
			LO = {
			},
			LL = {
			},
			MC = {
			},
			MM = {
			},
			NI = {
			},
			SA = {
			},
			TH = {
			},
			WW = {
			},
		}
	end

	function Ob:doRichPresence()
		if SetSteamRichPresenceStatus then
			local location = self.tRichPresenceNames[GetCurrentLevelName()]
			SetSteamRichPresenceStatus(location or "")
		end
	end

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		self.notSaved = {}
		self.player.notSaved = self.notSaved
		local me = self

		-- PLD: rich presence stuff
		call(self.doRichPresence, { self }, "x", nil)

		-- Grab the level settings object if one exists.
		self.levelSettings = nil
		local func = function(settings)
			if %me.levelSettings then
				DebugPrint('ERROR: more than one level settings object in the level.', settings, %me.levelSettings)
			else
				%me.levelSettings = settings
			end
		end
		foreach_lso_ofexacttype('global.otherentities.LevelSettings', func)
		if not self.levelSettings then self.levelSettings = {} end
	end

-- ************************************************************************************************
	--[[@ save(key, value, [level])
	Category
		Global Management
	Args
		key: The string you want to use for saving and loading the given value
		value: is the data you want to save
		level: is an optional param and MUST be a string.  Use it if you want to save and load data between 2 different levels
			   If you do not pass in this parameter the name of the current level you are saving from is used for saving the data.
			   However when you want to load you data again you dont need to pass in the level parameter unless you are loading the
			   data from a level different than the one you saved it in.
	Comments
		This data will only be saved if the player saves their game.
			   ]]--
	function Ob:save(key, value, level)
		if key == 'bFordScavengerHalfPlayed' then
			GamePrint('saving')
		end

		-- ensure the tables exist
		level = level or strsub(GetCurrentLevelName(), 1, 2)
		self.saved[level] = self.saved[level] or {}

		--for CA announcements, the announcements should be played again during each state, so reset some vars
		if (level == 'CA' and key == 'CALevelState'
				and self.saved[level][key] and value and self.saved[level][key] ~= value) then
			self.saved['CA']['NightAnnounced'] = nil
			self.saved['CA']['MillaDocks1Announced'] = nil
			self.saved['CA']['MillaDocks2Announced'] = nil
			self.saved['CA']['DowsingRodAnnounced'] = nil
			self.saved['CA']['CobwebDusterAnnounced'] = nil
			self.saved['CA']['DreamFluffAnnounced'] = nil
			self.saved['CA']['PsiCoreAnnounced'] = nil
			self.saved['CA']['ScavengerHuntAnnounced'] = nil
		end

		-- save the key/value pair
		self.saved[level][key] = value

		-- check to see if this value is in the table, if it's not output warning/error
		level = strupper(level)				
		if (self.tCompletedSavedVar and (self.tCompletedSavedVar[level] and not self.tCompletedSavedVar[level][key])
				and (not self.tCompletedSavedVar.ALL[key])) then
			if not self.tIgnoreWarningSavedVar[level] then
				self.tIgnoreWarningSavedVar[level] = {}
			end
			if not self.tIgnoreWarningSavedVar[level][key] and not self.tIgnoreWarningSavedVar['Global'][key] then
				GamePrint('WARNING: '..key..' is not in the saved var table')
				self.tIgnoreWarningSavedVar[level][key] = 1
			end
		end
		
		--A handy debugging feature.  If bSpamSaveData is set to 1, all save variables will be
		--spammed to the console.
		if (self.bSpamSaveData == 1) then
			local valueString
			if (not value) then
				valueString = 'nil'
			elseif (type(value) == 'table') then
				valueString = '[table]'
			elseif (type(value) == 'string') then
				valueString = '\''..value..'\''
			else
				valueString = tostring(value)
			end
			GamePrint('Saved['..(level or 'nil')..']: '..(key or 'nil')..' = '..valueString)
		end

		-- check to see if everything is collected
		for sAchKeyName, v in self.tCollectionAchievementNames do
			if sAchKeyName == key then
				self:CheckCollectionAchievement(key)
				break
			end
		end

		-- check re-entry
		if key == 'bLevelRevisted' then
			local nNumLevelsRevisited = 0
			for mentalLevelName, v in self.mentalLevelMap do			
				if self.saved[mentalLevelName] and self.saved[mentalLevelName]['bLevelRevisted'] == 1 then
					nNumLevelsRevisited = nNumLevelsRevisited + 1
				end
			end
			if nNumLevelsRevisited == 9 then
				UnlockAchievement('ACH_REVISTED_ALL_LEVELS')
			end
		end
	end

	function Ob:CheckCollectionAchievement(key)
		local bAllMatched = 1
		for mentalLevelName, v in self.mentalLevelMap do
			if not self.saved[mentalLevelName] or self.saved[mentalLevelName] and ( not self.saved[mentalLevelName][key] or self.saved[mentalLevelName][key] ~= 1 ) then
				bAllMatched = 0
				break
			end
		end
		if bAllMatched == 1 then
			UnlockAchievement(self.tCollectionAchievementNames[key])
		end
	end

-- ************************************************************************************************
	
	--[[@ saveGlobal(key, value)
	Category
		Global Management
	Date
	
	Args
		key: The string you want to use for saving and loading the given value
		value: the data you want to save
	Returns
	
	Example
	
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		This function works exactly the same as save(key, value, [level]) except that it passes in "Global" as the name 
		of the level.  Thus allowing you to access the data from every level.
	]]--
	function Ob:saveGlobal(key, value)
		self:save(key, value,'Global')
	end

-- ************************************************************************************************
	
	--[[@ load(key, [level])
	Category
		Global Management
	Args
		key: string value used to look up the data you are loading
        level: Optional param and MUST be a string.  If not passed in this value defaults to the name of the level you are 
				currently in when this load function is being called.
	Returns
		whatever data is found at Global[level][key]
	]]--
	function Ob:load(key, level)
		level = level or strsub(GetCurrentLevelName(), 1, 2)
		return self.saved[level] and self.saved[level][key]
	end

	--[[@ loadTable(from, [misc])
		Like load, but doesn't take a key.  It'll pass back the whole table of stuff saved for this from/misc pair,
		for your iterating pleasure.  So say you're in BV, saving a ton of stuff with Global:save(key, val).  Then
		you could just call this function with no args (if you're in BV still), or with loadTable(nil, 'BV') if you're
		in another level.  Or if you're an item that saves all its own info like Global:saveGlobal(key, val, 'me'), then
		you could get your table back with loadTable('me', 'Global').
	Category
		Global Management
	Args
		from: Ent that saved it, if you passed one in; if not, do not pass in this arg
		misc: Miscellaneous group arg you can pass in; defaults to level prefix, so pass that in if you're loading data from another level
	]]--
	function Ob:loadTable(from, misc)
		misc = misc or strsub(GetCurrentLevelName(), 1, 2)
		from = from or self
		from = (type(from) == "table" and from.Name) or from
		return (self.saved[misc] and self.saved[misc][from])
	end

-- ************************************************************************************************

	--[[@ loadGlobal(key)
	Category
		Global Management
	Date
	
	Args
		key: string value used to look up the data you are loading
	Returns
		Data found at Global["Global"][key]
	Example
	
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		loadGlobal(key) works exactly the same as loadGlobal(key,[level]) except that it passes in "Global" as the name 
		of the level.  Thus allowing you to access the data from every level. 
	]]--
	function Ob:loadGlobal(key)
		return self:load(key,'Global')
	end

-- ************************************************************************************************
	--[[@ prepareNewGame()
	Category
		Global Management
	Date
		10-19-04
	Args

	Returns
		nothing
	Example
		Global:prepareNewGame()
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		This will prepare a new game with all the appropriate save variables and inventory items
		for the start of a new game.  It is intended to be used when the player selects new game
		from the main menu, and is called right before the player leaves CABU for the first time,
		but may also be called from the main menu before loading CAKC to emulate a game from the
		main menu.
	]]--
	function Ob:prepareNewGame()
		--Clear out all saved variables
		ClearRazTable()  
		self:onClearData()

		--This flag is saved for the rest of the game noting the fact that this is a REAL game
		--loaded normally from the main menu, and not a game by a dirty cheater loaded from
		--the level menu
		Global:saveGlobal('bLoadedFromMainMenu',1)
		self.bLoadedFromMainMenu = 1

		self.saved.Inventory.all = {}
		
		--No good reason for raz to start with any powers.
		DisablePower(kPOWER_ALL)
		
		Global.player:loadStats()
	end

-- ************************************************************************************************
	--[[@ setPlayerRespawnPointName('respawnLSOName', ['levelName'])
	Category
		Global Management
	Date
		1-13-04
	Args
		respawnLSOName:  string name of LSO respawn point
		levelName: name of the level this respawn point is in.
	Returns
		nothing
	Example
		Global:savePlayerRespanPoint('respawnpoint1')
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		Use this function to save the players respawn point.  If you dont pass in a levelName this function
		assumes the respawn point is in the currently loaded level.  Otherwise it will save the passed in 
		level name as the level this respawn point belongs to.
		NOTE:This respawn location will only actually get saved if the player saves their game. 
	]]--
	
	function Ob:setPlayerRespawnPointName(respawnLSOName, levelName)
		levelName = levelName or GetCurrentLevelName()
		local data = {pointName = respawnLSOName, levelName = levelName}
		local levelPrefix = strupper(strsub(levelName, 1, 2))
		self:save('playerRespawnPointName', data, levelPrefix)
	end

-- ************************************************************************************************
	--[[@ getPlayerRespawnPointName()
	Category
		Global Management
	Date
		1-13-04
	Args
		none
	Returns
		respawnPointName, LevelName
		respawnPointName: string who's value is the name of the player's respawn point.  
							if no respawnpoint was ever saved this function will end up returning nil.
		LevelName:  name of level that this respawn point belongs to.
	Example
		local respawnLSOName, respawnLevelName = Global:loadPlayerRespanPoint()
		local respawnPoint = nil
		if respawnLevelName == Global.levelScript.Name and respawnLSOName ~= nil then
			respawnPoint = FindScriptObject(respawnLSOName)
		end
		if respawnPoint ~= nil then
			Global.player:setPosition(respawnPoint:getPosition())
		end
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		
	]]--
	
	function Ob:getPlayerRespawnPointName()		
		local LevelName = GetCurrentLevelName()
		LevelName = strsub(LevelName, 1, 2)
		LevelName = strupper(LevelName)
		local data = self:load('playerRespawnPointName', LevelName)
		if data then 
			return data.pointName, data.levelName
		else
			return nil
		end
	end

	function Ob:clearPlayerRespawnPointName(LevelPrefix)
		self:save('playerRespawnPointName', nil, LevelPrefix)		
	end

-- ************************************************************************************************
	--[[@ setPlayerWaterCurseRespawnPointName('respawnLSOName', ['levelName'])
	Category
		Global Management
	Date
		1-13-04
	Args
		respawnLSOName:  string name of LSO respawn point
		levelName: name of the level this respawn point is in.
	Returns
		nothing
	Example
		Global:savePlayerRespanPoint('respawnpoint1')
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		Use this function to save the players respawn point.  If you dont pass in a levelName this function
		assumes the respawn point is in the currently loaded level.  Otherwise it will save the passed in 
		level name as the level this respawn point belongs to.
		NOTE:This respawn location will only actually get saved if the player saves their game. 
	]]--
	
	function Ob:setPlayerWaterCurseRespawnPointName(respawnLSOName, LevelName)
		local data = {pointName = respawnLSOName, levelName = LevelName or Global.levelScript:getLevelName()}
		self:saveGlobal('playerWaterCurseRespawnPointName', data)
	end

-- ************************************************************************************************
	--[[@ getPlayerWaterCurseRespawnPointName()
	Category
		Global Management
	Date
		1-13-04
	Args
		none
	Returns
		respawnPointName, LevelName
		respawnPointName: string who's value is the name of the player's respawn point.  
							if no respawnpoint was ever saved this function will end up returning nil.
		LevelName:  name of level that this respawn point belongs to.
	Example
		local respawnLSOName, respawnLevelName = Global:loadPlayerRespanPoint()
		local respawnPoint = nil
		if respawnLevelName == Global.levelScript.Name and respawnLSOName ~= nil then
			respawnPoint = FindScriptObject(respawnLSOName)
		end
		if respawnPoint ~= nil then
			Global.player:setPosition(respawnPoint:getPosition())
		end
	Replacing
	
	Replaced By
	
	Entity
	
	Blocking
	
	Comments
		
	]]--
	
	function Ob:getPlayerWaterCurseRespawnPointName()
		local data = self:loadGlobal('playerWaterCurseRespawnPointName')
		if data then 
			return data.pointName, data.levelName
		else
			return nil, nil
		end
	end

-- ************************************************************************************************
-- *****
-- *****	Inventory Management
-- *****
-- ************************************************************************************************

	--[[@ loadInventory()
		Called by Raz every level, to see what items he has in his inventory.  Some will delete
		themselves later, if they don't belong in the level.
	Returns
		A table of names (key) and types (value) for inv items that should exist in Raz's inventory.
		If something's in that table that doesn't belong in the level, create it.
	]]--
	function Ob:loadInventory()
		-- Gotta find our own, because LevelScript may not have assigned itself to Global.levelScript yet.
		if not self.levelScript then self.levelScript = FindScriptObject('LevelScript') end

		local ret = {}
		if self.saved.Inventory[Global.levelScript:getLevelPrefix()] then
			for k, v in self.saved.Inventory[Global.levelScript:getLevelPrefix()] do
				ret[k] = v
			end
		end
		if self.saved.Inventory[Global.levelScript.levelType] then
			for k, v in self.saved.Inventory[Global.levelScript.levelType] do
				ret[k] = v
			end
		end
		if self.saved.Inventory['all'] then
			for k, v in self.saved.Inventory['all'] do
				ret[k] = v
			end
		end
		return ret
	end

-- ************************************************************************************************
	
	--[[@ clearInventoryItem(name)
		Call this when Raz loses an item.
	Returns
	]]--
	function Ob:clearInventory(object)
		if not self.saved.Inventory[object.level] then return end
		self.saved.Inventory[object.level][object.Name] = nil
	end

-- ************************************************************************************************

	--[[@ saveInventory(level, name, type)
		Use this when saving off an inventory item for later reincarnation.
	Args
		level: level it belongs in, or 'all' for all, or 'real' for all real, or 'mental' for all mental.
	]]--
	function Ob:saveInventory(object)
		if (object.NoPackStorage == 1) then
			return
		end
		if not self.saved.Inventory[object.level] then self.saved.Inventory[object.level] = {} end
		self.saved.Inventory[object.level][object.Name] = {}
		self.saved.Inventory[object.level][object.Name].Type = object.Type
		self.saved.Inventory[object.level][object.Name].Editables = object:getSaveEditables()
	end

	--[[@ isInInventory(itemName)
		Checks to see if dart has the specified object in his inventory.  This is similar to Global.player.isInInventory,
		except that it will check all of Dart's inventory, including all mental levels.
	Args
		itemName: The name of the item you are looking for
	Returns
		result: 1 if the item is in his inventory, 0 if not
	]]--
	function Ob:isInInventory(itemName)
		for name, category in self.saved.Inventory do
			if (type(category) == 'table') then
				if (category[itemName]) then
					return 1
				end
			end
		end
		return 0
	end
-- ************************************************************************************************

	function Ob:onClearData()
	       	self.saved.MM = {} 
	       	self.saved.NI = {}
	       	self.saved.AS = {}
	       	self.saved.BB = {}
	       	self.saved.MI = {}
	       	self.saved.MC = {}
	       	self.saved.TH = {}
	       	self.saved.CA = {}
	       	self.saved.SA = {}
	       	self.saved.BV = {}
	       	self.saved.powers = {}
		self.saved.Inventory = {}
	end

-- ************************************************************************************************

	--Returns the physical level that is used to enter the given mental level
	function Ob:getPhysicalLevel(prefix)
		prefix = prefix or self:getLevelPrefix()
		prefix = strsub(prefix, 1, 2) --Make sure it REALLY is a prefix
		local levelName = self.mentalLevelMap[prefix]
		if ((prefix == 'CA') and (levelName ~= 'CAJA') and (levelName ~= 'CASA') and 
				(Global:load('CALevelState', 'CA') >= 7)) then
			levelName = levelName..'_NIGHT'
		end
		return levelName
	end

	-- Return 1 if the prefix corresponds to a mental level
	-- Default arg: current level prefix
	function Ob:isMentalLevel(prefix)
		prefix = prefix or (Global.levelScript and Global.levelScript:getLevelPrefix())
		prefix = strsub(prefix, 1, 2) --Make sure it REALLY is a prefix
		if self.mentalLevelMap[prefix] then
			return 1
		end
	end

	-- LEVEL reentry saved var stuff

	function Ob:setLevelToCompleted(levelPrefix)
		--Default to current level
		levelPrefix = levelPrefix or GetCurrentLevelName()

		--Get the level prefix in upper case and save variable
		if (levelPrefix) then
			if (strlen(levelPrefix) >= 4) then
				levelPrefix = strsub(levelPrefix, 1, 2)
			end
			levelPrefix = strupper(levelPrefix)
		else
			GamePrint('WARNING: could not get the level prefix')
			return
		end
		local varName = 'b'..levelPrefix..'Completed'

  		--Only set a level as completed once
  		if (Global:loadGlobal(varName) == 1) then
  			return
  		end

		--Process all previous levels recursively
		--if (self.tLevelPrereqs[levelPrefix]) then
		--	self:setLevelToCompleted(self.tLevelPrereqs[levelPrefix])
		--end

		--Player should get 1 more brain of health for completing this level
		if (levelPrefix ~= 'LL') then
			Global.player:incrementMaxHealth(4)
		end
	
		--Save local variables for this level
		self:processSaveTable(self.tCompletedSavedVar['ALL'], levelPrefix)
		if self.tCompletedSavedVar[levelPrefix] then
			self:processSaveTable(self.tCompletedSavedVar[levelPrefix], levelPrefix)
		else
			GamePrint('WARNING: there is not saved var table for this level')
		end
		
		--If we just beat the level of the character we were braining, then clear out the variable
		local lastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
		if (lastBrainingLevel and (strsub(lastBrainingLevel, 1, 2) == levelPrefix)) then
			Global:saveGlobal('LastBrainingLevel', nil)
		end

		--Clear out ford save if we complete a level with the same prefix.
		local fordLevel = Global:loadGlobal('InstaFordLevelToReturn')
		if fordLevel and (strsub(fordLevel, 1, 2) == levelPrefix) then
			Global:saveGlobal('InstaFordLevelToReturn', nil)
			Global:saveGlobal('InstaFordLastBrainingLevel', nil)
		end
		
		--Save global variables for this level
		if (self.tCompletedSavedVar['Global'][levelPrefix]) then
			self:processSaveTable(self.tCompletedSavedVar['Global'][levelPrefix], 'Global')
		end

		--Call a special handler for this level if one exists.
		if (self['on'..levelPrefix..'Completed']) then
			self['on'..levelPrefix..'Completed'](self)
		end
		
		--Set the save variable
		Global:saveGlobal(varName, 1)
		Global:saveGlobal('b'..levelPrefix..'Entered', 1) -- Surely it's been entered if it's been completed

		-- unlock the achievement
		GamePrint('Looking For '..levelPrefix)
		if self.tLevelAchievementName[levelPrefix] then			
			UnlockAchievement(self.tLevelAchievementName[levelPrefix])
		end
	end

	-- clearing out the level save data
	function Ob:clearLevelSavedData(levelPrefix)
		--Default to current level
		levelPrefix = levelPrefix or GetCurrentLevelName()

		--Get the level prefix in upper case and save variable
		if (levelPrefix) then
			if (strlen(levelPrefix) >= 4) then
				levelPrefix = strsub(levelPrefix, 1, 2)
			end
			levelPrefix = strupper(levelPrefix)
		else
			GamePrint('WARNING: could not get the level prefix')
			return
		end
		local varName = 'b'..levelPrefix..'Completed'

		--Clear the save variable
		Global:saveGlobal(varName, nil)
		Global:saveGlobal('b'..levelPrefix..'Entered', nil)

		if (levelPrefix == 'LL') then
			self:clearLevelSavedData('LO')
		end

		-- clear local variables for this level
		self:clearSaveTable(self.tCompletedSavedVar['ALL'], levelPrefix)
		if self.tCompletedSavedVar[levelPrefix] then
			self:clearSaveTable(self.tCompletedSavedVar[levelPrefix], levelPrefix)
		else
			GamePrint('WARNING: there is not saved var table for this level')
		end
		
		-- clear global variables for this level
		if (self.tCompletedSavedVar['Global'][levelPrefix]) then
			self:clearSaveTable(self.tCompletedSavedVar['Global'][levelPrefix], 'Global')
		end
	end

	function Ob:isLevelCompleted(levelPrefix)
		levelPrefix = levelPrefix or Global.levelScript:getLevelPrefix()
		local varName = 'b'..levelPrefix..'Completed'
		return self:loadGlobal(varName) or 0
	end

	--Sets all the values in the given save table under the given level
	function Ob:processSaveTable(table, level)
		for k, v in table do
			v = ((v ~= 'nil') and v)	--'nil' as a string should mean nil (because it can't be stored)
			Global:save(k, v, level)
		end
	end

	--Clear all the values in the given save table under the given level
	function Ob:clearSaveTable(table, level)
		for k, v in table do
			Global:save(k, nil, level)
		end
	end

	function Ob:adjustCALevelState(newState)
		local current = Global:load('CALevelState', 'CA')
		if ((not current) or newState > current) then
			Global:save('CALevelState', newState, 'CA')
		end
	end

	function Ob:onBBCompleted()
		self:adjustCALevelState(2)
	end

	function Ob:onSACompleted()
		Global:save('BeenInSashasLab', 1, 'CA') -- Must have been in here at least once.
		Global:save('bCUIntroPlayed', 1, 'CA') -- So that you can get into the CU via oatmeal
		self:adjustCALevelState(4)
	end

	function Ob:onMICompleted()
		self:adjustCALevelState(6)
	end

	function Ob:onNICompleted()
		--If NI has been completed, then we must be in CA state 7
		Global:adjustCALevelState(7)
		
		--Make sure Raz restarts at the beginning of MI after Milla gets kidnapped.
		Global:save('lastSubLevel', nil, 'MI')
		Global:setPlayerRespawnPointName(nil, 'MI')
	end

	function Ob:onLLCompleted()
		--If LO has been completed, then Lili has been kidnapped
		Global:save('bLiliKidnapped', 1, 'CA')
	end
	
	function Ob:onBVCompleted()
		--Player should start in BVES after completing BV.
		Global:save('lastSubLevel', 'BVES', 'BV')
	end

-- ************************************************************************************************

	return Ob
end
