--*
--*		"CABU.lua"
--*		Wilson Hom
--*		from  P S Y C H O N A U T S
--*
--*		(c) 2003 Double Fine Productions, Inc.
--*		All Rights Reserved.
--*		Proprietary and Confidential and pimp
--*

-- Constructor ****************************************************************

function CABU(Ob)
    if not Ob then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = { 'CA.Characters.Ford',
				'Global.Collectibles.PSIChallengeCore',
				'Global.Collectibles.PsiChallengeMarker',
				'Global.Collectibles.PSIChallengeCard', },
			meshes = { 'CU.plb' },
			textures = {  
				'Textures/icons/InventoryItems/Journal.tga',
				'Textures/MenuUI/Journal/GraphPaper.tga',
				'Textures/MenuUI/Journal/GraphPaper.dds',
			},
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/DartNew/Listen.jan',
				'Anims/DartNew/talk_2.jan',
				'Anims/DartNew/talk_4.jan',
				'Anims/Janitor/A_B_scout.jan',
				'Anims/Janitor/A_TurnLf_scout.jan',
				'Anims/Janitor/A_TurnRt_scout.jan',
				'Anims/Janitor/A_breathe_scout.jan',
				'Anims/Janitor/Breathe_janitor.jan',
				'Anims/Janitor/FordTK.jan',
				'Anims/Janitor/GiveBacon.jan',
				'Anims/Janitor/Idle1_janitor.jan',
				'Anims/Janitor/JumpOn_Reaction.jan',
				'Anims/Janitor/Ninja_Confusion_end.jan',
				'Anims/Janitor/Ninja_Confusion_loop.jan',
				'Anims/Janitor/Ninja_Idle1.jan',
				'Anims/Janitor/Ninja_TK.jan',
				'Anims/Janitor/Ninja_slap.jan',
				'Anims/Janitor/PointLeft.jan',
				'Anims/Janitor/PointLeft_End.jan',
				'Anims/Janitor/PointLeft_start.jan',
				'Anims/Janitor/PointUp.jan',
				'Anims/Janitor/PointUp_End.jan',
				'Anims/Janitor/PointUp_start.jan',
				'Anims/Janitor/Point_janitor.jan',
				'Anims/Janitor/PsiReaction.jan',
				'Anims/Janitor/PullOutFunnel.jan',
				'Anims/Janitor/RB_A_scout.jan',
				'Anims/Janitor/Rake_loop_janitor.jan',
				'Anims/Janitor/Sweep_end_janitor.jan',
				'Anims/Janitor/Sweep_loop1_janitor.jan',
				'Anims/Janitor/Sweep_loop2_janitor.jan',
				'Anims/Janitor/Sweep_start_janitor.jan',
				'Anims/Janitor/Talk_grumpy.jan',
				'Anims/Janitor/Turn180_janitor.jan',
				'Anims/Janitor/TurnLf_janitor.jan',
				'Anims/Janitor/TurnRt_janitor.jan',
				'Anims/Janitor/WalkSweep_janitor.jan',
				'Anims/Janitor/Walk_janitor.jan',
				'Anims/Janitor/Walk_scout.jan',
				'Anims/Janitor/WaxCanoe_end_skipper.jan',
				'Anims/Janitor/WaxCanoe_loop_skipper.jan',
				'Anims/Janitor/WaxCanoe_start_skipper.jan',
				'Anims/Janitor/camtutorial_idle.jan',
				'Anims/Janitor/camtutorial_talk1.jan',
				'Anims/Janitor/camtutorial_talk2.jan',
				'Anims/Janitor/talk1.jan',
				'Anims/Janitor/talk2.jan',
				'Anims/Janitor/talk_loop.jan',
				'Anims/PSIChallenge/ShelfIdle.jan',
				'Anims/PSIChallenge/Spin.jan',
				'Anims/PsiChallenge/PsiCardSpin_loop.jan',
				'Anims/PsiChallenge/TutorialIdle.jan',
				'Anims/CA_bunkhouseUI/ChalkBoardPosition.jan',
				'Anims/CA_bunkhouseUI/ChalkBoardSleep.jan',
				'Anims/Coach/BunkhouseUI.jan',
				'Anims/DartNew/BunkIdle.jan',
				'Anims/DartNew/BunkIdle_upper.jan',
				'Anims/DartNew/BunkLower.jan',
				'Anims/DartNew/BunkSleepUpper.jan',
				'Anims/DartNew/BunkUpper.jan',
				'Anims/DartNew/ChalkPositionUpper.jan',
				'Anims/DartNew/ChalkThinkingUpper.jan',
				'Anims/DartNew/ChalkWriting2Upper.jan',
				'Anims/DartNew/ChalkWritingUpper.jan',
				'Anims/DartNew/ChalkWriting2.jan',
				'Anims/DartNew/runmove.jan',
				'Anims/DartNew/ChalkPosition.jan',
				'Anims/DartNew/ChalkThinking.jan',
				'Anims/DartNew/ChalkWriting.jan',
				'Anims/DartNew/BunkSleep.jan',
			},
		}

		Ob.meshname = 0
		Ob.destination = 'CU.plb'
		Ob.playerDart = 0

		Ob.levelType = 'real'

		Ob.curEndPointIndex = 0
		Ob.lastIndex = nil

		-- Load up the campkids that will idle on empty bunks
		Ob.nils = nil
		Ob.maloof = nil
		Ob.dogen = nil

		-- Load Coach script object
		Ob.coach = nil

		-- chalk script 
		Ob.chalk = nil

		-- State variable to tell me what engine is currently doing
		Ob.CurState = 'running'


		-- Keyboard alternating flag.. flag to indicate to anlternate to the other writing anim
		Ob.KeyboardAltFlag = 1

		-- sound handles
		Ob.ChalkboardTurn = LoadSound('ChalkboardTurn')
		
		Ob.LastSoundHandle = 1
		Ob.bPlayIdles = 0    

		-- first available profile
		Ob.iFirstAvailableProfile = 1

		Ob.hAmbientSound = nil
		Ob.CropMesh = nil
		Ob.LightsOut = nil
	end
	
	-- ****************************************************************************

	function Ob:onSpawn()
		self.startPoints = {}
		self.startPoints[1] = {}
		self.startPoints[1].x = -7770.18
		self.startPoints[1].y = 4687.24
		self.startPoints[1].z = -13074.6  
		self.startPoints[1].o = -30
		
		-- from bunk1 to bunk2
		self.startPoints[2] = {}
		self.startPoints[2].x = -7406.98
		self.startPoints[2].y = 4687.24
		self.startPoints[2].z = -13069.9 
		self.startPoints[2].o = -123   
		
		self.startPoints[3] = {}
		self.startPoints[3].x =  -7468.12 
		self.startPoints[3].y = 4687.24
		self.startPoints[3].z = -13443           
		self.startPoints[3].o = 67
		
		-- alternate entry for bunk2 (from bunk3 to bunk2)
		self.startPoints[4] = {}
		self.startPoints[4].x =  -7211.95
		self.startPoints[4].y = 4687.24
		self.startPoints[4].z = -13359.8  
		self.startPoints[4].o = -120
		
		self.endPoints = {}
		self.endPoints[1] = {}
		self.endPoints[1].x =   -7836.21
		self.endPoints[1].y = 4687.24
		self.endPoints[1].z =   -12810.8

		
		self.endPoints[2] = {} 
		self.endPoints[2].x = -7423.5
		self.endPoints[2].y = 4694.41
		self.endPoints[2].z = -13435
		
   		self.endPoints[3] = {}			       
		self.endPoints[3].x = -7225.49 
		self.endPoints[3].y = 4692.52		       
		self.endPoints[3].z = -13365.6   
		
		-- set the anims
		self.RazAnimateIntoBunk = {} 
		self.RazAnimateIntoBunk[1] = 'Anims/DartNew/BunkUpper.jan'
		self.RazAnimateIntoBunk[2] = 'Anims/DartNew/BunkUpper.jan'
		self.RazAnimateIntoBunk[3] = 'Anims/DartNew/BunkLower.jan'                             
		
		
		self.RazSleep = {}
		self.RazSleep[1] = 'Anims/DartNew/BunkSleepUpper.jan'
		self.RazSleep[2] = 'Anims/DartNew/BunkSleepUpper.jan'
		self.RazSleep[3] = 'Anims/DartNew/BunkSleep.jan'
		
		
		self.BunkIdles = {}
		self.BunkIdles[1] = 'Anims/DartNew/BunkIdle_upper.jan'
		self.BunkIdles[2] = 'Anims/DartNew/BunkIdle_upper.jan'
		self.BunkIdles[3] = 'Anims/DartNew/BunkIdle.jan'
		
		
		self.RazChBoardScootAnim = {}
		self.RazChBoardScootAnim[1] = 'Anims/DartNew/ChalkPositionUpper.jan'  -- the first 2 will be different once the upper bunk anims are done
		self.RazChBoardScootAnim[2] = 'Anims/DartNew/ChalkPositionUpper.jan'
		self.RazChBoardScootAnim[3] = 'Anims/DartNew/ChalkPosition.jan'
		
		self.RazThinkingAnimJan = {}
		self.RazThinkingAnimJan[1] = 'Anims/DartNew/ChalkThinkingUpper.jan' 
		self.RazThinkingAnimJan[2] = 'Anims/DartNew/ChalkThinkingUpper.jan' 
		self.RazThinkingAnimJan[3] = 'Anims/DartNew/ChalkThinking.jan' 
		
		self.RazWriting1AnimJan = {}
		self.RazWriting1AnimJan[1] = 'Anims/DartNew/ChalkWritingUpper.jan'   
		self.RazWriting1AnimJan[2] = 'Anims/DartNew/ChalkWritingUpper.jan'   
		self.RazWriting1AnimJan[3] = 'Anims/DartNew/ChalkWriting.jan'   
		
		self.RazWriting2AnimJan = {}
		self.RazWriting2AnimJan[1] = 'Anims/DartNew/ChalkWriting2Upper.jan'   
		self.RazWriting2AnimJan[2] = 'Anims/DartNew/ChalkWriting2Upper.jan'   
		self.RazWriting2AnimJan[3] = 'Anims/DartNew/ChalkWriting2.jan' 
		
		self.RazWriting1filename = {}
		self.RazWriting1filename[1] = 'ChalkWritingUpper.jan'   
		self.RazWriting1filename[2] = 'ChalkWritingUpper.jan'   
		self.RazWriting1filename[3] = 'ChalkWriting.jan'   
		
		self.RazWriting2filename = {}
		self.RazWriting2filename[1] = 'ChalkWriting2Upper.jan'   
		self.RazWriting2filename[2] = 'ChalkWriting2Upper.jan'   
		self.RazWriting2filename[3] = 'ChalkWriting2.jan'  
		
		
		self.ChalkboardAnim = {} 
		self.ChalkboardAnim[1] = 'Anims/CA_bunkhouseUI/ChalkBoardPosition.jan'
		self.ChalkboardAnim[2] = 'Anims/CA_bunkhouseUI/ChalkBoardPosition.jan'
		self.ChalkboardAnim[3] = 'Anims/CA_bunkhouseUI/ChalkBoardPosition.jan'
		
		-- these are the chalkboard scriptobject names
		self.ChalkBoardName = {}
		self.ChalkBoardName[1] = 'bunkbedChalkboard7'
		self.ChalkBoardName[2] = 'bunkbedChalkboard3'
		self.ChalkBoardName[3] = 'bunkbedChalkboard'
		
		self.ChalkBoardName[4] = 'bunkbedChalkboard6'
		self.ChalkBoardName[5] = 'bunkbedChalkboard4'
		self.ChalkBoardName[6] = 'bunkbedChalkboard2'
		
		-- chalkboard campath
		self.chalkboardCamPath = {}
		self.chalkboardCamPath[1] = {}
		self.chalkboardCamPath[1].x =   -7570.23
		self.chalkboardCamPath[1].y =   5080.35	
		self.chalkboardCamPath[1].z =    -12567.8       
		self.chalkboardCamPath[1].ox =   -24.9654
		self.chalkboardCamPath[1].oy =   69.4674
		self.chalkboardCamPath[1].oz =   2.31924e-005
		
		self.chalkboardCamPath[2] = {}
		self.chalkboardCamPath[2].x =   -7627.32
		self.chalkboardCamPath[2].y =   5075.11	
		self.chalkboardCamPath[2].z =   -13161.4
		self.chalkboardCamPath[2].ox =  -21.2561
		self.chalkboardCamPath[2].oy =  -17.6835
		self.chalkboardCamPath[2].oz =  1.55971e-005
        
		self.chalkboardCamPath[3] = {}
		self.chalkboardCamPath[3].x =  -7319.68
		self.chalkboardCamPath[3].y =  4893.67
		self.chalkboardCamPath[3].z =  -13020.4
		self.chalkboardCamPath[3].ox = -20.9706
		self.chalkboardCamPath[3].oy = -45.6427
		self.chalkboardCamPath[3].oz = -2.82668e-007
		
		
		
		-- raz sleep campath
		self.razSleepCamPath = {}
		self.razSleepCamPath[1] = {}
		self.razSleepCamPath[1].x =   -7800.76
		self.razSleepCamPath[1].y =   5036.66
		self.razSleepCamPath[1].z =   -12749	
		self.razSleepCamPath[1].ox =   -36.2904
		self.razSleepCamPath[1].oy =    90.2936
		self.razSleepCamPath[1].oz =   0.00005286
		
		self.razSleepCamPath[2] = {}
		self.razSleepCamPath[2].x =   -7509.47
		self.razSleepCamPath[2].y =   5045.93	
		self.razSleepCamPath[2].z =   -13394.5
		self.razSleepCamPath[2].ox =  -37.5896
		self.razSleepCamPath[2].oy =   -3.0951
		self.razSleepCamPath[2].oz =   0.000109661
		
		self.razSleepCamPath[3] = {}
		self.razSleepCamPath[3].x =  -7179.1
		self.razSleepCamPath[3].y =  4880.46
		self.razSleepCamPath[3].z =  -13264.1
		self.razSleepCamPath[3].ox = -27.0049
		self.razSleepCamPath[3].oy = -64.5675
		self.razSleepCamPath[3].oz = 0.000002

		-- coach camPath 
		self.coachCutsceneCamPath = {}
		self.coachCutsceneCamPath[1] = {}
		self.coachCutsceneCamPath[1].x =  -7573.64
		self.coachCutsceneCamPath[1].y =   5000.65
		self.coachCutsceneCamPath[1].z =  -12838.2
		self.coachCutsceneCamPath[1].ox =  -14.1451
		self.coachCutsceneCamPath[1].oy =  -25.6656
		self.coachCutsceneCamPath[1].oz =  0.00318198
		
		self.coachCutsceneCamPath[2] = {}
		self.coachCutsceneCamPath[2].x =  -7500.51
		self.coachCutsceneCamPath[2].y =   5034.86
		self.coachCutsceneCamPath[2].z =  -13279
		self.coachCutsceneCamPath[2].ox = -36.8733
		self.coachCutsceneCamPath[2].oy =  -55.4875
		self.coachCutsceneCamPath[2].oz =   0.000006

		self.coachCutsceneCamPath[3] = {}
		self.coachCutsceneCamPath[3].x =  -7257.52
		self.coachCutsceneCamPath[3].y =   4843.6
		self.coachCutsceneCamPath[3].z =   -13205.1
		self.coachCutsceneCamPath[3].ox =  -8.52488
		self.coachCutsceneCamPath[3].oy =   4.38361
		self.coachCutsceneCamPath[3].oz =   0.00549993

		self.BunkKidsSounds = {}

		-- Chalkboard text ID's
		self.chalkboardId = {}

		-- camera paths
		self.BunkCamPath = {}
		self.BunkCamPath[1] = {}
		self.BunkCamPath[1].x =  -7527.0
		self.BunkCamPath[1].y =   4991.0
		self.BunkCamPath[1].z =  -12830.0
		self.BunkCamPath[1].ox =  -11.0
		self.BunkCamPath[1].oy =  108.0
		self.BunkCamPath[1].oz =  0
		
		
		self.BunkCamPath[2] = {}
		self.BunkCamPath[2].x =  -7367.0	
		self.BunkCamPath[2].y =   5036.0
		self.BunkCamPath[2].z =  -13146.0
		self.BunkCamPath[2].ox =  -19.0
		self.BunkCamPath[2].oy =  30.0
		self.BunkCamPath[2].oz =  0
		
		
		self.BunkCamPath[3] = {}
		self.BunkCamPath[3].x =  -7523.0
		self.BunkCamPath[3].y =   4997.0
		self.BunkCamPath[3].z =  -13174.0
		self.BunkCamPath[3].ox =  -17.0
		self.BunkCamPath[3].oy =  -82.0
		self.BunkCamPath[3].oz =  0
		
		self.kTIMERID = '1234'
		%Ob.Parent.onSpawn(self)
	end
	
    function Ob:onBeginLevel()		       
		%Ob.Parent.onBeginLevel(self)

		self.playerDart = FindScriptObject( 'Dart' )
		
		-- init the bunkhouse control handler
		ActivateBunkControlHandler()
		BunkhouseUIPauseControls(1)
		FadeToColor( 0, 0, 0, 255, 0, 0 , 0,0, 0,0, 2 )
		
		-- set raz's initial position
		self.curEndPointIndex = 0
		self.lastIndex = nil					     
		
		self.KeyboardAltFlag = 1

		-- Hide the HUD				   
		HideHUD(1)
		
		-- load  meshes and scripts
		-- coach 
		self.coach = SpawnScript('CA.Characters.Coach','Coach','self.meshName=\'characters/coach.plb\' self.firestartResistance = 1',1)
		SetEntityVisible(self.coach,0)
		self.coach:setPosition(-7272.8,4695.18,-13498.1)
		self.coach:setOrientation(0,-35,0)
		SetPhysicsFlag(self.coach, PHYSICS_COLLIDEE, 0)
		
		
		-- crop mesh
		self.CropMesh = fso('CoachCrop')
		if(self.CropMesh == nil) then
			self.CropMesh = SpawnScript('ScriptBase', 'CoachCrop')
			self.CropMesh:loadMesh('Characters/CharacterProps/Coach_Crop.plb')
		end
		SetEntityVisible(self.CropMesh,0)       

		
		-- nils	bunk#1							      
		self.nils = SpawnScript('Global.Props.Geometry','NilsPushup','self.meshName=\'characters/Nils.plb\' self.firestartResistance = 1',1)
		self.nils:setPosition(-7099.97, 4940, -13275)
		self.nils:setOrientation(0,0,0)
		self.nils:loadAnim('Anims/Campkids/Pushup_nils.jan', 0.0, 1)
		SetPhysicsFlag(self.nils, PHYSICS_COLLIDEE, 0)
		SetEntityFlag(self.nils,ENTITY_DRAWSHADOW,1)
		SetEntityFlag(self.nils, ENTITY_ALWAYS_POSE, 1)

		
		-- maloof  bunk#2 
		self.maloof = SpawnScript('Global.Props.Geometry','MaloofCry','self.meshName=\'characters/Maloof.plb\' self.firestartResistance = 1',1)
		self.maloof:setPosition(-7516.21,4784.23, -13400.7)
		self.maloof:setOrientation(0,-30,0)
		self.maloof:loadAnim('Anims/Campkids/Crying_maloof.jan', 0.0, 1)
		SetPhysicsFlag(self.maloof, PHYSICS_COLLIDEE, 0)
		SetEntityFlag(self.maloof, ENTITY_ALWAYS_POSE, 1)
									  
		-- dogen	 bunk#3
		self.dogen = SpawnScript('Global.Props.Geometry','DogenSleep','self.meshName=\'characters/dogen.plb\' self.firestartResistance = 1',1)
		self.dogen:setPosition(-7920,4780.23,-12710.7)
		self.dogen:setOrientation( 0,180,-10)
		self.dogen:loadAnim('Anims/Dogen/Sleep.jan', 0.0, 1)
		SetPhysicsFlag(self.dogen, PHYSICS_COLLIDEE, 0)
		SetEntityFlag(self.dogen,ENTITY_DRAWSHADOW,1)
		SetEntityFlag(self.dogen, ENTITY_ALWAYS_POSE, 1)


		-- chalk script
		self.chalk = SpawnScript('Global.Props.Geometry', 'BU_Chalk', 'self.meshName=\'Characters/CharacterProps/BoydChalk.plb\' self.firestartResistance = 1', 1) 
		SetEntityVisible(self.chalk,0)

		-- turn off collide on all the chalkboards
		local chalkboardScript = fso(self.ChalkBoardName[1])
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		chalkboardScript = fso(self.ChalkBoardName[2])
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		chalkboardScript = fso(self.ChalkBoardName[3])
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		chalkboardScript = fso(self.ChalkBoardName[4])
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		chalkboardScript = fso(self.ChalkBoardName[5])
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		chalkboardScript = fso(self.ChalkBoardName[6])
		SetEntityFlag(chalkboardScript,ENTITY_NOSIMULATE,0)
		SetPhysicsFlag(chalkboardScript, PHYSICS_COLLIDEE, 0)
		
		
		-- set a state flag to assist in helping various timing
		self.CurState = 'running'
        ------------------------------------------------------------------------------------------------- 
		-- setup inital positions
		self.playerDart:setPhysics(kPHYSICS_NONE)
		self.playerDart:setOrientation(0,-29.7548,0)
		self.playerDart:setPosition(-7298.56, 4687.24,-13409.4)
		self.playerDart:loadAnim('Anims/Dartnew/dartidle02.jan', 0, 1)
		SetCameraPosition( -7574.1,4931.18, -12942.5)
		SetCameraOrientation(-8.98488,-28.8622, 0.000083596)
		
		-------------------------------------------------------------------------------------------------
		
		self.currentMaloofSound = 1
		self.Maloofsounds = {}
                self.Maloofsounds[1] = '/CAHA000MF/'
		self.Maloofsounds[2] = '/CAHA001MF/'
		self.Maloofsounds[3] = '/CAHA002MF/'
		for i = 1, 3 do
			local pszDisplayName = BunkhouseUIGetBunkDisplayName(i)
			if(pszDisplayName ~= nil) then
				self:SetChalkboardText(i,pszDisplayName)
			end
		end	    
		self:SetChalkboardText(4,'Dogen')
		self:SetChalkboardText(5,'Maloof')
		self:SetChalkboardText(6,'Nils')
		
		self.MattressBounce = LoadSound('MattressBounce')
		self.MattressJumpUp = LoadSound('MattressJumpUp')
		self.MattressSlide = LoadSound('MattressSlide')
		
		self.ChalkboardTurn = LoadSound('ChalkboardTurn')

		self.BunkKidsSounds[1] =  LoadSound('DoganThumbsuck')
		self.BunkKidsSounds[2] =  LoadSound('MaloofCrying')
		self.BunkKidsSounds[3] =  LoadSound('NillsPushup')   
		self.LightsOut =  LoadSound('LightsOut')   
		
		self.Grab = LoadSound('CantileverGrab')
		self.Climb = LoadSound('ledge_climb')


		-- Fog around ford
		self.fog = SpawnScript('NI.Effects.CaravanGroundFogFX', 'fog', '', 1)
		self.fog:run()
		
		--precaching all this anim data to prevent stuttering voice
		PreloadAnimData( 'anims/janitor/idle1_janitor.jan' )
		PreloadAnimData( 'anims/janitor/camtutorial_idle.jan' )
		PreloadAnimData( 'anims/dartnew/listen.jan' )
		PreloadAnimData( 'anims/psichallenge/shelfidle.jan')
		PreloadAnimData( 'anims/psichallenge/spin.jan' )
		PreloadAnimData( 'anims/janitor/pointleft_start.jan' )
		PreloadAnimData( 'anims/janitor/pointleft.jan' )
		PreloadAnimData( 'anims/co_collectiblemover/collectiblemover.jan' )
		PreloadAnimData( 'anims/janitor/pointleft_end.jan' )
		PreloadAnimData( 'anims/dartnew/talk_2.jan' )
		PreloadAnimData( 'anims/janitor/camtutorial_talk1.jan' )
		PreloadAnimData( 'anims/psichallenge/psicardspin_loop.jan' )
		PreloadAnimData( 'anims/janitor/pointup_start.jan' )
		PreloadAnimData( 'anims/janitor/pointup_end.jan' )
		PreloadAnimData( 'anims/psichallenge/tutorialidle.jan' )
		PreloadAnimData( 'anims/janitor/camtutorial_talk2.jan' )
		PreloadAnimData( 'anims/dartnew/talk_4.jan' )
				
		self:setState(nil)	  
    end	      

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		-- play the ambient sounds
	    
		self.ambNightSound = LoadSound('AmbNight')
		PlaySound(nil,self.ambNightSound)
		
		self.hAmbientSound = LoadSound('CampAmbientLoop') -- doesnt loop
		--self:createTimer(5000,self.kTIMERID )
		
		self.nightAmbMuffled = LoadSound('CANightAmbMuffled')
		PlaySound(nil,self.nightAmbMuffled)
		
		self.campInside = LoadSound('CampInside')
		PlaySound(nil, self.campInside)
		FadeToColor( 0, 0, 0, 0, 0, 0 , 0, 0, 255,0, 0 )
	end

	-- ****************************************************************************
	function Ob:onTimer(id)
		if(id ==  self.kTIMERID) then
			--self.maloof:sayLine( self.Maloofsounds[self.currentMaloofSound],0,1,nil,1) 
			--self.currentMaloofSound = self.currentMaloofSound+1
			--if(self.currentMaloofSound > 3) then
			--	self.currentMaloofSound = 1
			--end
		else
			%Ob.Parent.onTimer(self, id)

		end
		
		-- if (id == self.kTIMERID) then
		--  PlaySound(nil,self.hAmbientSound)
		--  KillTimer(self,self.kTIMERID)
		--  self:createTimer(RandInt(6000,25000),self.kTIMERID )

		--else
		%Ob.Parent.onTimer(self, id)
		-- end
	end

	-- ****************************************************************************

    function Ob:stateLevelLoad()
		
        self:setState(nil)
        
    end											 
    function Ob:onEndLevel()
		HideHUD(0)
		%Ob.Parent.onEndLevel(self)
		self:setState(nil)				      
    end
	-- ****************************************************************************

    function Ob:onActivate()
		--DeactivateBunkControlHandler()
		self:setState(self.stateLevelLoad)
        
    end
	-- ****************************************************************************

    function Ob:onBunkhouseIntro(idBunk)
		self.iFirstAvailableProfile = idBunk

		self:setState('BunkhouseIntro')										
        
    end
	-- ****************************************************************************

    function Ob:stateBunkhouseIntro(idBunk)
                --FadeToColor( 0, 0, 0, 255, 0, 0 , 0, 0, 0,0, 1.5 )
		Yield()
		-- runs an inital camera path
                self:sleep(1.9) -- this sleep is so the camera looks at raz for a bit then runs the campath
		
		SnapEntityToGround(self.playerDart)
		self.playerDart:setOrientation(0,-29.7548,0)
		
		local iProf = self.iFirstAvailableProfile
		local path = self.BunkCamPath[iProf]

                Global.levelScript.cutsceneScript:camPathTo(path.x,path.y,path.z,path.ox,path.oy,path.oz,90, 1,0.5,0.5, 0)
		self:sleep(1)
						        
                -- self:onChangeBunk(idBunk)
		--self:setState(nil)
    end				         						     
							       

	-- ****************************************************************************

    function Ob:onChangeBunk(idBunk)
		self.bPlayIdles = 0
		
		if self.curEndPointIndex == idBunk then
			BunkhouseUIAnimComplete(1)
			GamePrint('no change')
			return
		end										    
		-- GamePrint('changing')
		BunkhouseUIPauseControls(0)
		
		-- Disable the bunkhouse controls till the anims are done
		BunkhouseUIAnimComplete(0)
		
		-- set the keyboard to not be shown
		BunkhouseUIShowKeyboardUI(0)
		
		-- need to turn the current chalkboard back to original rotation
		if(self.lastIndex ~= nil) then
			local chalkboardScript = fso(self.ChalkBoardName[self.lastIndex])
			chalkboardScript:loadAnim('Anims/CA_bunkhouseUI/ChalkBoardSleep.jan' , 0.2, 0) 
		end
		
		
		self.curEndPointIndex = idBunk
		local index = self.curEndPointIndex
		
		local startPtIndex = index
		
		-- bunk2 has 2 different start points the location to run from
		-- is different depending on which bunk raz is coming from
		if index == 2 then
			if self.lastIndex == 3 then startPtIndex = 4 end
		end          

		self.lastIndex = index
		
		self.playerDart:setOrientation(0,self.startPoints[startPtIndex].o,0)
		self.playerDart:setPosition(self.startPoints[startPtIndex].x, self.startPoints[startPtIndex].y,self.startPoints[startPtIndex].z)
		SetNewAction(self.playerDart,'Stand')
		
		-- detach the chalk from raz's hand and set it invisible. 
		DetachEntityFromParent(self.chalk)
	        SetEntityVisible(self.chalk,0)

		-- set the locally created state variable that raz is running
		self.CurState = 'running'
		

		self:setState('WalkToBunk')
		
	end

	-- ****************************************************************************

	function Ob:stateWalkToBunk()
        local index = self.curEndPointIndex
		PreloadAnimData(self.RazAnimateIntoBunk[index])		        
        
		-- set raz to a run action then do a walk to	    
		SetNewAction(self.playerDart,'Run')
       	self.playerDart:walkTo(self.endPoints[index].x,self.endPoints[index].z)
	       self.playerDart:setPosition( self.endPoints[index].x,self.endPoints[index].y,self.endPoints[index].z) -- overshoot correction
        self.playerDart:setVelocity(0, 0,0) 
	

		
        StopSound( self.BunkKidsSounds[self.LastSoundHandle])
        -- play the campkids sounds
		PlaySound(nil,self.BunkKidsSounds[index],1)
		self.LastSoundHandle = self.curEndPointIndex

		-- run the correct jump on bed anim then do the idle after its complete
		-- no blend, because we want the run to stop running immediately
        self.playerDart:setOrientation(0,self.startPoints[index].o,0)
       	--Yield()   
		-- after the walk is done run the anim to jump in the bed
		self.playerDart:loadAnim(self.RazAnimateIntoBunk[index] , 0, 0)
		PreloadAnimData(self.BunkIdles[index])
		PreloadAnimData(self.RazChBoardScootAnim[index])
		
        -- if this is the last bunk (the lower one) just play the sound immediately
		
		local iFrame = 0
		local bMattressPlayed = 0
		local bGrabPlayed = 0		     
		local bClimbPlayed = 0 		    
		local bSoundPlaying = 0
		-- set the idle after the anim stopped playing
		local subStr = strsub(self.RazAnimateIntoBunk[index], 15)
        while (IsPlayingAnim(self.playerDart) == 1) do
			iFrame = GetAnimCompletion(self.playerDart, 0 ,subStr ,1)
			
			if(index ~= 3) then
				if(iFrame>=36.88 and bMattressPlayed == 0 ) then
					PlaySound(nil, self.MattressJumpUp)	
					bMattressPlayed = 1
				end
				if(iFrame>=11.55 and bGrabPlayed == 0) then
					PlaySound(nil, self.Grab)
					bGrabPlayed = 1

				end
				if(iFrame>=22.55 and bClimbPlayed == 0) then
					PlaySound(nil, self.Climb)
					bClimbPlayed = 1

				end
				

			
			end
			bSoundPlaying = IsSoundPlaying(self.MattressJumpUp)
                        if( index == 3 and  iFrame>=7.7 and iFrame < 9 and bSoundPlaying == 0) then
				PlaySound(nil, self.MattressJumpUp)	  
			end
			
			Yield()	    
		end
		
		-- IDLES -------------------------------------------------------------
		local blend = 0.1
		if index==3 then blend = 0.3 end
		self.playerDart:loadAnim(self.BunkIdles[index] , blend, 1)
       	
		-- set the state variable that raz is idling in bed
		self.CurState = 'bedidle'

		-- reenable the bunkhouse buttons
		BunkhouseUIAnimComplete(1)
		
		self.bPlayIdles = 1  
		self.MatressSoundIdleTimer = 4
		self:setState('PlayIdles')
	end	 

	-- ****************************************************************************
	function Ob:statePlayIdles()
		
		local iCurIdleFrame = 0
		local subStr = strsub(self.BunkIdles[self.curEndPointIndex], 15)  
		while(self.bPlayIdles == 1 ) do
			iCurIdleFrame = GetAnimCompletion(self.playerDart, 0 ,subStr ,1)
			local bSoundPlaying = IsSoundPlaying(self.MattressBounce)
			if(iCurIdleFrame>=167 and iCurIdleFrame <= 170 and bSoundPlaying == 0) then
				PlaySound(nil,self.MattressBounce)
			end
			
			-- do this only for nils pushup because it is not looping
			if(self.curEndPointIndex  == 3) then
				iCurIdleFrame = GetAnimCompletion(self.nils, 0 ,'Pushup_nils.jan' ,1)
				bSoundPlaying = IsSoundPlaying(self.BunkKidsSounds[3])
				if(iCurIdleFrame>=22 and iCurIdleFrame <= 24 and bSoundPlaying == 0) then
					PlaySound(nil,self.BunkKidsSounds[3])	  
				end			        		    
			end
			
			Yield()
		end
		self:setState(nil)
	end
	-- ****************************************************************************

    function Ob:onSetProfileName(idBunk)
		self:setState('WriteOnChalkboard')
	end
	-- ****************************************************************************
	function Ob:beginStateWriteOnChalkboard()
		PreloadAnimData(self.RazThinkingAnimJan[self.curEndPointIndex])
		PreloadAnimData(self.RazWriting1AnimJan[self.curEndPointIndex])
		PreloadAnimData(self.RazWriting2AnimJan[self.curEndPointIndex])
		PreloadAnimData(self.RazSleep[self.curEndPointIndex])
	end
    function Ob:stateWriteOnChalkboard()
		-- check if raz is already in the keyboard state then just display the keyboard
		if self.CurState ==  'keyboardready' then	
			BunkhouseUIShowKeyboardUI(1) 
			self:setState(nil) 
			return
		end
		-- Disable controls with BunkhouseUIAnimComplete(0)
		BunkhouseUIAnimComplete(0)
		
		-- play the correct chalk board anim for the bunk
		self.playerDart:loadAnim(self.RazChBoardScootAnim[self.curEndPointIndex] , 0.2, 0)
		PlaySound(nil,self.MattressSlide)  	   

		-- get the chalkboard scriptobject and load the proper anim 
		local chalkboardScript = fso(self.ChalkBoardName[self.curEndPointIndex])
		chalkboardScript:loadAnim(self.ChalkboardAnim[self.curEndPointIndex] , 0.2, 0)
		
		
		local iFrame = 0
		local subStr = strsub(self.RazChBoardScootAnim[self.curEndPointIndex], 15)
		while (IsPlayingAnim(self.playerDart) == 1) do
			iFrame = GetAnimCompletion(self.playerDart, 0 ,subStr ,1)
			local bSoundPlaying = IsSoundPlaying(self.ChalkboardTurn)

			if(iFrame > 89 and iFrame < 91 and  bSoundPlaying == 0) then
				PlaySound(nil,self.ChalkboardTurn)
			end
			
			Yield()
		end
		
		-- load the thinking anim (looping)
		self.playerDart:loadAnim(self.RazThinkingAnimJan[self.curEndPointIndex] , 0.2, 1)
		
		-- pop the chalkboard into raz's hand
		SetEntityVisible(self.chalk,1)
		AttachEntityToEntityBone(self.chalk, self.playerDart, 'handJEndRt_2')
		self.chalk:setOrientation(-10,0,-15)
		
		-- all the anims done now enable the keyboard to be shown
		BunkhouseUIShowKeyboardUI(1)
		BunkhouseUIAnimComplete(1)
		
		-- set the alt flag back to 1
		self.KeyboardAltFlag = 1
		
		-- set the state variable that raz is thinking anim and is ready for keyboard
		self.CurState = 'keyboardready'

		self:setState(nil)
	end
	-- ****************************************************************************
    function Ob:onKeyboardCancel()
		-- disable the controls and the keyboard cause the anim will
		-- reset raz to the original spot and i must wait till the anim 
		-- is done then reenable the buttons. the keyboard will be reenabled normally
		-- through the stateWriteOnChalkboard function
		BunkhouseUIShowKeyboardUI(0)
		BunkhouseUIAnimComplete(0)
		
		-- go back to thinking
		self.playerDart:loadAnim(self.RazThinkingAnimJan[self.curEndPointIndex] , 0.2, 1)
		
		BunkhouseUIAnimComplete(1)

	end
	-- ****************************************************************************
	function Ob:onKeyboardPress()
		-- load the writing anim 
		-- only play the writing anim if its not already running
		if self.KeyboardAltFlag ==1 then
	        if IsPlayingAnim(self.playerDart,self.RazWriting2filename[self.curEndPointIndex]) ~= 1 then
				self.playerDart:loadAnim(self.RazWriting1AnimJan[self.curEndPointIndex] , 0.2, 1,0)                         
				self.KeyboardAltFlag = 2

			end
		else
			if IsPlayingAnim(self.playerDart,self.RazWriting1filename[self.curEndPointIndex]) ~= 1 then
				self.playerDart:loadAnim(self.RazWriting2AnimJan[self.curEndPointIndex] , 0.2, 1,0)                         
				self.KeyboardAltFlag = 1
			end

		end
	end
	-- ****************************************************************************   
	function Ob:onKeyboardRelease()
		-- when a keyboard button is not pressed anymore then return the anim to 
		-- the thinking anim. This message handler will only be called from engine 
		-- only when a button is pressed and another button is not pressed within 
		-- a certain time out.
		self.playerDart:loadAnim(self.RazThinkingAnimJan[self.curEndPointIndex] , 0.6, 1)                         
		
	end
	
	-- ****************************************************************************
	function Ob:onProfileCreated()
	    --This prepares the player's save data for a new game.
		Global:prepareNewGame()

		self:setState('ProfileCreated')
	end
	-- ****************************************************************************
	function Ob:stateProfileCreated()
		-- when profile is created then go into sleep animation and set the anim flag to uncomplete
		BunkhouseUIAnimComplete(0)
		
		-- change the text on the chalkboard
		local pszDisplayName = BunkhouseUIGetBunkDisplayName(self.curEndPointIndex)
		self:SetChalkboardText(self.curEndPointIndex,pszDisplayName)


		
		-- detach the chalk from raz's hand. should also do it when a profile creation is complete
		DetachEntityFromParent(self.chalk) 
		SetEntityVisible(self.chalk,0)
		
		PlaySound(nil,self.ChalkboardTurn)
		
		-- do the raz sleeping animation here:
		self.playerDart:loadAnim(self.RazSleep[self.curEndPointIndex] , 0.2,0)
		
		
		local chalkboardScript = fso(self.ChalkBoardName[self.curEndPointIndex])
		chalkboardScript:loadAnim('Anims/CA_bunkhouseUI/ChalkBoardSleep.jan' , 0.2, 0)
		
		
		-- engine should now set the CoachCutscene state
		--  when the anim is done set the flag to complete
		BunkhouseUIAnimComplete(1)
		self:setState(nil)
	end
	-- ****************************************************************************
	
	function Ob:onCoachCutscene()
		self:setState('RazSleep')
	end
	
	-- ****************************************************************************

	function Ob:stateRazSleep()
		
		-- kill the sound timer
		--KillTimer(self,self.kTIMERID)
		-- cam path to the chlakboard
		local camx,camy,camz = GetCameraPosition()
		Global.levelScript.cutsceneScript:camPathTo(self.chalkboardCamPath[self.curEndPointIndex].x,
													self.chalkboardCamPath[self.curEndPointIndex].y,self.chalkboardCamPath[self.curEndPointIndex].z,
													self.chalkboardCamPath[self.curEndPointIndex].ox, self.chalkboardCamPath[self.curEndPointIndex].oy ,self.chalkboardCamPath[self.curEndPointIndex].oz,
													90, 2,0.7,0.3, 1)
		
		--  stare at chalkboard for a sec
		self:sleep(1)
		
		-- run camera to look at raz
		camx,camy,camz = GetCameraPosition()
		Global.levelScript.cutsceneScript:camPathTo(self.razSleepCamPath[self.curEndPointIndex].x,
													self.razSleepCamPath[self.curEndPointIndex].y,self.razSleepCamPath[self.curEndPointIndex].z,
													self.razSleepCamPath[self.curEndPointIndex].ox, self.razSleepCamPath[self.curEndPointIndex].oy ,self.razSleepCamPath[self.curEndPointIndex].oz, 90, 2,0.7,0.3, 1)
		
		-- wait till this anim is done
		local subStr = strsub(self.RazSleep[self.curEndPointIndex], 15)
		
		local iFrame = 0
		while (iFrame < 249) do		   
			iFrame = GetAnimCompletion(self.playerDart, 0 ,subStr ,1)		 
			Yield()       
		end
		
        self:loadNewLevel('CASA')

		--self:setState('CoachCutscene')		    
	end
	
	--this function was just used for debugging
	function Ob:setupDream()
		self:setState(nil)
		--setup controls
		DeactivateBunkControlHandler()
		BunkhouseUIPauseControls(0)
		
		--create dummy ford
		self.ford = SpawnScript('CA.Characters.Ford', 'Ford')
		self.ford:setState(nil)
		self.ford:setScale(1.5)
		self.ford.broom:killSelf()
		self.ford.dustpan:killSelf()
		Global.cutsceneScript:placeChar(self.ford, 35049.1, -16.4, -1106.9, 0, -155.5, 0)
		
		--set up raz
		Global.player:loadAnim('Anims/DartNew/standstill.jan', 0, 1)
		Global.cutsceneScript:placeChar(Global.player, 34968,-17.4,-1358.7 , 0,28.4,0)
		
		self.dummyCore = SpawnScript('Global.Collectibles.PSIChallengeCore', 'dummyCore')
		Global.cutsceneScript:placeChar(self.dummyCore, 34913.3, 150, -1064.1, 0, -156.1, 0)
		self.dummyCore.psiCoreFX:stop()
        SetEntityAlpha(self.dummyCore, 0,0)
	end
	
	function Ob:stateDream()
		StopSound(self.BunkKidsSounds[1])	  
		StopSound(self.BunkKidsSounds[2])	  
		StopSound(self.BunkKidsSounds[3])	  
		StopSound(self.nightAmbMuffled)	  
		StopSound(self.campInside)	  
		PlaySound(nil, LoadSound('WaterCurseMusic'))
		PlaySound(nil, LoadSound('CollectiveUnconscious'))
		
		--KillTimer(self,self.kTIMERID)  
        DeactivateBunkControlHandler()		      
		BunkhouseUIPauseControls(0)

		--create dummy ford
		self.ford = SpawnScript('CA.Characters.Ford', 'Ford')
		self.ford:setState(nil)
		self.ford:setScale(1.5)
		
		self.ford.broom:killSelf()
		self.ford.dustpan:killSelf()
		self.ford:setAnim(self.ford.animsTable.dreamIdle)
		Global.cutsceneScript:placeChar(self.ford, 35049.1, -16.4, -1106.9, 0, -155.5, 0)
		
		--crazy motion blur awakening
		Global.cutsceneScript:runCutscene('CABUCamIntro', 1, nil, 0)
		
		--setup controls
		Global.player:dontRunPlayerControls(1)
		SetCamera(kCAMERA_SCRIPT)
		Global.cutsceneScript:cutTo(34964,144,-1290, 35,-158,-3,46)
		EnableAuras(0)
		HideHUD(1,2)
		Global.cutsceneScript:fadeIn(0.1)
		
		--set up raz
		self.razX,self.razY,self.razZ = Global.player:getPosition()
		self.razOX,self.razOY,self.razOZ = Global.player:getOrientation()
		Global.player:loadAnim('Anims/DartNew/standstill.jan', 0, 1)
		Global.cutsceneScript:placeChar(Global.player, 34968,-17.4,-1358.7 , 0,28.4,0)
		--create psi core
		self.dummyCore = SpawnScript('Global.Collectibles.PSIChallengeCore', 'dummyCore')
		Global.cutsceneScript:placeChar(self.dummyCore, 34890, 160, -1064.1, 0, -156.1, 0)
        self.dummyCore:makeVisible()
		self.dummyCore.psiCoreFX:stop()
		SetEntityAlpha(self.dummyCore, 0,0)
		
		--fade ford in
		self.ford:sayLine("/CAGA000FO/", 1,1)--DIALOG=<<Okay, quick eye exam before we start.>>
		
		--two shot
		Global.cutsceneScript:cutTo(34829,71,-752, 4,-23,0,69)
		Global.player:loadAnim('Anims/DartNew/dartidle02.jan', 0.1, 0)
		self:sleep(2)
		Global.player:sayLine("/CAGA001RA/", 1,1)--DIALOG=<<Huh?>>
		
		--part 1, test left and right axis
		
		--create psi marker
		self.dummyMarker = SpawnScript('Global.Collectibles.PsiChallengeMarker', 'dummyMarker')
		Global.cutsceneScript:placeChar(self.dummyMarker, 34349.9, 150, -975, 0, 108.4, 0)

		--behind raz
		local a,b,c,d,e,f = Global.cutsceneScript:getChaseIdeal()
		Global.cutsceneScript:cutTo(a,b,c,d,e,f, 104)
		Global.player:loadAnim('Anims/DartNew/listen.jan', 0.1, 1)
		
		self.ford:setAnim(self.ford.animsTable.pointLeftStart)
		--self.ford:loadAnim('Anims/Janitor/PointLeft.jan', 0.1, 0)
		self.ford:sayLine("/CAGA002FO/", 1,1)   --DIALOG=<<Look over that way if you will. >>
		
		SetCamera(kCAMERA_CHASE)
		SetCamInvertYaw(0)
		SetCamInvertPitch(0)
		Global.player:dontRunPlayerControls(0)
		PrintMessage("/CAZE001TO/", 0, -1)--DIALOG=<<Use right Joystick /Joystick/ to look right>>
		self.testingLeftRightAxis = 1
		self.totalTurn = 0
		SetScriptControlHandler( self )
		self.ford.examCRH:setFilter('first')
		self.ford.examCRH:chatterStart()
		
		while (self.totalTurn == 0) do 
			--GamePrint('YIELD 1')
			Yield() 
		end

		--calculate which way the player turned and set invert if necessary
		--GamePrint('SET THE YAW INVERSION ' .. self.totalTurn)		
		if (self.totalTurn > 0) then
			--GamePrint('Inverting')
			SetCamInvertYaw(1)
		else
			--GamePrint('Not Inverting')		
			SetCamInvertYaw(0)
		end
		
		--wait till marker is visible for ~ 1 seconds
		self.visibleTime = 0
		while (self.visibleTime < 40) do 
			if (EntityVisibleFromCamera(self.dummyMarker) == 1) then
				self.visibleTime = self.visibleTime + 1
			end
			--GamePrint('YIELD 2')
			Yield() 
		end
		
		self.ford.examCRH:chatterStop()
		
		--GamePrint('SEEN THE MARKER')	
		DeletePrintMessages()
		--the camera has turned to look at challenge marker
		self.testingLeftRightAxis = nil
		SetControlHandler(kCONTROL_PLAYER)
		Global.player:dontRunPlayerControls(1)
		SetCamera(kCAMERA_SCRIPT)
		
		--back to raz looking at marker
		self.ford:setAnim(self.ford.animsTable.pointLeftEnd)
		Global.cutsceneScript:placeChar(Global.player, 34968,-17.4,-1358.7,0,-60,0)

		SetEntityFlag(self.ford, ENTITY_LOOKATINTERESTINGTHINGS, 1)
		LookAtEntity(self, Global.player)
		SetEntityFlag(Global.player, ENTITY_LOOKATINTERESTINGTHINGS, 0)		
		Global.cutsceneScript:cutTo(34776,20,-1447, 22,-129,0, 83)
		Global.player:loadAnim('Anims/DartNew/talk_2.jan', 0.1, 0)
		Global.player:sayLine("/CAGA008RA/", 1,1)--DIALOG=<<Wow, what\'s that?>>
		
		--close up marker
		Global.cutsceneScript:cutTo(35002,143,-1486, -11,140,0, 116)
		Global.cutsceneScript:camPathTo(34670,103,-1338, 4,139,0, 49, 5,1,1,0)
		self.ford:setAnim(self.ford.animsTable.dreamTalk1)
		local sound = LoadSound('PsiChallengeMarker')
		self:playSound(sound, 0, 0, 1)
		self.ford:sayLine("/CAGA009FO/", 1,1)--DIALOG=<<That\'s a PSI CHALLENGE MARKER. The staff scatters these all over the camp to test the students. Every one of these you find advances you a whole rank.>>
		
		--raz looking at marker
		Global.cutsceneScript:cutTo(34691,65,-1322, 5,-88,0, 49)
		Global.player:loadAnim('Anims/DartNew/listen.jan', 0.1, 1)
		Global.player:sayLine("/CAGA010RA/", 1,1)--DIALOG=<<Ah ha...>>
		
		self.dummyMarker:killSelf()
		
		--part 2, test up and down axis
		--create card
		self.dummyCard = SpawnScript('Global.Collectibles.PSIChallengeCard', 'dummyCard')
		Global.cutsceneScript:placeChar(self.dummyCard, 35248.3, 800, -565, 0, -153.1, 0)
		Global.cutsceneScript:placeChar(self.ford, 35049.1, -16.4, -1106.9, 0, -155.5, 0)
		Global.cutsceneScript:placeChar(Global.player, 34968,-17.4,-1358.7 , 0,28.4,0)
		
		--close up ford
		Global.cutsceneScript:cutTo(34862,220,-1308, 5,-133,0, 58)
		self.ford:setAnim(self.ford.animsTable.pointUpStart)
		self.ford:sayLine("/CAGA011FO/", 1,1)   --DIALOG=<<Now, look up for me if you will.>>
		SetEntityFlag(Global.player, ENTITY_LOOKATINTERESTINGTHINGS, 1)
		
		local a,b,c,d,e,f = Global.cutsceneScript:getChaseIdeal()
		Global.cutsceneScript:cutTo(a,b,c,d,e,f,104)
		Global.player:dontRunPlayerControls(0)
		SetCamera(kCAMERA_CHASE)
		
		PrintMessage("/CAZE002TO/", 0, -1)--DIALOG=<<Use right Joystick /Joystick/ to look up>>
		self.testingUpDownAxis = 1
		self.totalTurn = 0
		SetScriptControlHandler( self )
		self.ford.examCRH:setFilter('second')
		self.ford.examCRH:chatterStart()

		--GamePrint('SCRIPT CONTROL HANDLER SET')
		
		while (self.totalTurn == 0) do 
			--GamePrint('YIELD 1')
			Yield() 
		end

		--calculate which way the player turned and set invert if necessary
		--GamePrint('SET THE PITCH INVERSION ' .. self.totalTurn)		
		if (self.totalTurn < 0) then
			--GamePrint('Inverting Pitch')
			SetCamInvertPitch(1)
			SetCamFirstPersonInvertPitch(0)
		else
			--GamePrint('Not Inverting Pitch')
			SetCamInvertPitch(0)
			SetCamFirstPersonInvertPitch(1)
		end
		
		--wait till marker is visible for ~ 1 seconds
		self.visibleTime = 0
		while (self.visibleTime < 40) do 
			if (EntityVisibleFromCamera(self.dummyCard) == 1) then
				self.visibleTime = self.visibleTime + 1
			end
			--GamePrint('YIELD 2')
			Yield() 
		end
		
		self.ford.examCRH:chatterStop()
		--GamePrint('SEEN THE CARD')	
		DeletePrintMessages()
		self.testingUpDownAxis = nil
		
		--the camera has turned to look at challenge marker
		SetControlHandler(kCONTROL_PLAYER)
		Global.player:dontRunPlayerControls(1)
		SetCamera(kCAMERA_SCRIPT)

		--raz looking at card
		self.ford:setAnim(self.ford.animsTable.pointUpEnd)		
		Global.cutsceneScript:cutTo(34926,255,-947, -19,-17,0, 69)
		Global.player:loadAnim('Anims/DartNew/listen.jan', 0.1, 1)
		Global.player:sayLine("/CAGA016RA/", 1,1)--DIALOG=<<Huh.>>
		self:sleep(0.5)
		
		--over shoulder, at card
		Global.cutsceneScript:cutTo(34398,66,-1614, 16,-133,0, 120)
		self.ford:setAnim(self.ford.animsTable.dreamTalk1)
		self.ford:sayLine("/CAGA017FO/", 0,1,nil,1)--DIALOG=<<Some of the old markers have fallen apart. You\'ll find bits of \'em flapping around loose.>>
		self:sleep(2)
		local sound = LoadSound('PsiCard')
		self:playSound(sound, 0, 0, 1)
		Global.cutsceneScript:camPathTo(34949,762,-961, 12,-141,0, nil, 6,1,1, 0)
		while (self.ford:isSayingLine() == 1) do Yield() end
		self.ford:sayLine("/CAGA018FO/", 1,1)--DIALOG=<<If you find enough of these PSI CARDS, you can put \'em together to make a brand new Challenge Marker...>>
		
		--Raz OTS, psi core appears
		self.dummyCore:loadAnim('Anims/PsiChallenge/TutorialIdle.jan', 0, 1)
		Global.cutsceneScript:cutTo(34662,141,-1621, -1,-151,0, 85)
		self.dummyCore.psiCoreFX:run()
		SetEntityAlpha(self.dummyCore, 1)
		local sound = LoadSound('PsiCore')
		self:playSound(sound, 0, 0, 1)
		self.ford:setAnim(self.ford.animsTable.dreamTalk2)
		self.ford:sayLine("/CAGA019FO/", 1,1)--DIALOG=<<...But you have to buy a PSI CORE at the camp store to hold them together.>>
		
		--profile two shot
		self.dummyCore.psiCoreFX:stop()
		self.dummyCore:killSelf()		
		Global.cutsceneScript:cutTo(33810,22,-932, 10,-77,0, 56)
		self.ford:setAnim(self.ford.animsTable.dreamTalk1)
		self.ford:sayLine("/CAGA020FO/", 1,1)--DIALOG=<<Keep ranking up and before you know it you\'ll be able to use brand new psychic powers. Stuff you didn\'t even know you could do. >>
		self.ford:setAnim(self.ford.animsTable.dreamIdle)

		--raz 
		Global.cutsceneScript:cutTo(34750,67,-1557, 14,-141,0, 69)
		Global.player:loadAnim('Anims/DartNew/talk_4.jan', 0.2, 1)
		Global.player:sayLine("/CAGA021RA/", 1,1)--DIALOG=<<And then when do I become a Psychonaut? >>
		self:sleep(0.5)
		SetEntityFlag(Global.player, ENTITY_LOOKATINTERESTINGTHINGS, 0)
		Global.cutsceneScript:cutTo(34934,64,-919, 4,-10,0, 47.3)
		Global.cutsceneScript:camPathTo(34963,71,-1074, 2,-7,0,47.1, 6,0,3, 0)
		Global.player:sayLine("/CAGA022RA/", 1,1)--DIALOG=<<Because I have to do that before my dad shows up to take me home...>>
		
		self:sleep(0.25)
		self.ford:killSelf()
		
		--profile two shot
		Global.cutsceneScript:cutTo(34492,180,-1638, -2,-131,0, 103)
		Global.player:loadAnim('Anims/DartNew/dartidle02.jan', 0.3, 0)
		self:sleep(1)
		Global.player:sayLine("/CAGA023RA/", 1,1)--DIALOG=<<Hey, where\'d he go?>>
		self:sleep(1.2)
		
		--raz
		Global.cutsceneScript:cutTo(34969,91,-1020, -2,-7,0, 89)
		Global.cutsceneScript:camPathTo(34951,99,-795, -2,-7,0, 116, 8,3,3, 0)
		
		Global.player:sayLine("/CAGA024RA/", 0,1,nil,1)--DIALOG=<<That guy looked so familiar...>>
		
		--self:sleep()
		Global.cutsceneScript:fadeToBlack(3,1)

		-- show tutorial on how to change yaw setting
		if (Global:loadGlobal('SeenYawSettingTutorial') ~= 1) then
			Global:saveGlobal('SeenYawSettingTutorial', 1)
			Global.levelScript:addTutorialBox("/CAZF004TO/", 'Textures/icons/InventoryItems/Journal.tga')--DIALOG=<<To change your camera preferences, press START /StartButton/ to open your JOURNAL, and select OPTIONS from the first page.>>
		end
		
		-- load the new level
		LoadNewLevel('Levels/Cakc.plb')
		SetEntityFlag(Global.player, ENTITY_LOOKATINTERESTINGTHINGS, 1)
		
		self:setState(nil)
	end
	
	
	function Ob:handleScriptControls(iControl)
		--GamePrint('HANDLE SCRIPT CONTROLS')
		if ( iControl == nil ) then
			iControl = ControlTable -- default to global value to make invocation from engine easier
		end
		if (self.testingLeftRightAxis == 1) then
			--GamePrint('rotateY ' .. iControl.rotatey)
			self.totalTurn = self.totalTurn + iControl.rotatey
		elseif (self.testingUpDownAxis == 1) then
			--GamePrint('rotateX ' .. iControl.rotatex)
			self.totalTurn = self.totalTurn + iControl.rotatex
		end
	end
	
	-- ****************************************************************************

	
	function Ob:stateCoachCutscene()
		local s = LoadSound('CoachEnterCabin')
		PlaySound(nil,s,1)
		while IsSoundPlaying(s)==1 do
			Yield()
		end
		
		-- set the coach to the doorway position
		SetEntityVisible(self.coach,1)
		SetEntityVisible(self.CropMesh,1)

		self.coach:setPosition(-7272.8,4695.18,-13498.1)
		self.coach:setOrientation(0,-35,0)
		
		AttachEntityToEntityBone(self.CropMesh,self.coach,'handJEndRt_1')				    
		self.CropMesh:setOrientation(0,0,220)

		self.coach:loadAnim('Anims/Coach/BunkhouseUI.jan' , 0.2, 0)  
		
		-- start the first line before the cam path to coach      
		self.coach:sayLine("/CALG001CO/",0,1)--DIALOG=<<Alright settle down in here! BIG DAY tomorrow!>>
		self:sleep(0.2)
		LoadBlendAnim(Global.player,'Anims/DartNew/GeneralFacial/WideEyedSurprise.pba', 0,1,0)
		self:sleep(0.5)
		
		-- set camera to the coach
		Global.levelScript.cutsceneScript:camPathTo(self.coachCutsceneCamPath[self.curEndPointIndex].x,
													self.coachCutsceneCamPath[self.curEndPointIndex].y,self.coachCutsceneCamPath[self.curEndPointIndex].z,
				         								self.coachCutsceneCamPath[self.curEndPointIndex].ox, self.coachCutsceneCamPath[self.curEndPointIndex].oy ,self.coachCutsceneCamPath[self.curEndPointIndex].oz,
													90, 0.4,0.2,0.2, 1)   
		
		-- wait till the full line is finished before the next line starts
		self:sleep(3.3)        
		-- stop music
		--StopSound(self.ambNightSound)   
		--StopSound( self.hAmbientSound)   	    
		--StopSound( self.nightAmbMuffled)   				     
		StopSound( self.campInside)   
		
		self.coach:sayLine("/CALG002CO/",1,1)--DIALOG=<<I want to see each and every one of you runts in my classroom at oh-six-hundred hours on the dot!>>
		self.coach:sayLine("/CALG003CO/",1,1)--DIALOG=<<I'm the early bird and you're the worms, got it?>>
		self.coach:sayLine("/CALG004CO/",1,1)--DIALOG=<<Now...>>
		self.coach:sayLine("/CALG005CO/",1,1)--DIALOG=<<LIGHTS OUT!>>

		-- lights out stuff
		PlaySound(nil,self.LightsOut)
		
		-- screen fade
		self:fadeToColorBlock(0,0,0,0,0,0,0,0,255,0,0) 
		self:sleep(2)
		self:setState('Dream')
	end
	-- ****************************************************************************
	function Ob:SetChalkboardText(index,szText)
        local chalkboardScript = fso(self.ChalkBoardName[index])
		local x	= 23
		local y	= -3
		local z = -3
		
		local ox = 0
		local oy = 180			      
		local oz = 93
		
		if self.chalkboardId[index] ~= nil then
			RemoveText3(self.chalkboardId[index])
		end
        self.chalkboardId[index] = DisplayText3(szText,x,y,z,ox,oy,oz,0.26,0.26,4,255,255,255,0,0,0,0)
		
		-- set the first available profile		  
		if(self.iFirstAvailableProfile == 1 and szText == '') then			        
			self.iFirstAvailableProfile = index
		end
		
		Text3DAttachToBone(self.chalkboardId[index],chalkboardScript,'rootJ_1')
		
		
	end
	-- ****************************************************************************
	function Ob:onDeleteProfile(idBunk)
		RemoveText3(self.chalkboardId[idBunk])

	end
	-- ****************************************************************************
	function Ob:fadeToColorBlock(r,g,b,a,tganame,dr,dg,db,da,dtganame,time)
		FadeToColor(r,g,b,a,tganame,dr,dg,db,da,dtganame,time)
		-- yield till alpha is fully transparent
		local cr,cg,cb,ca,ctganame = FadeGetCurrentState()
		while ca ~= da do
			Yield()
			cr,cg,cb,ca,ctganame = FadeGetCurrentState()
		end    
	end
	-- ****************************************************************************
	
	return Ob					   
end					  
