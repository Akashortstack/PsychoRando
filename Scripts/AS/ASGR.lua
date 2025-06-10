function ASGR(Ob)
	if not Ob then
	Ob = CreateObject('AS.ASLevelScript')
	Ob.dependencies = {
		scripts = {
				'Global.Effects.LungfishWakeFX',
		},
		animations = {
			'Anims/Boyd/ASBO001BO.jan',
			'Anims/Boyd/Confusion.jan',
			'Anims/Boyd/Firestarting.jan',
			'Anims/CO_CollectibleMover/CollectibleMover.jan',
			'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
			'Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan',
			'Anims/DartNew/BodyParts/HoldFishWhistle.jan',
			'Anims/DartNew/BodyParts/Hold_FistLoosePalmDn_ArmLf.jan',
			'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
			'Anims/DartNew/BodyParts/Hold_PinchPalmDn_ArmLf.jan',
			'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan',
			'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
			'Anims/DartNew/ConfusionBomb.jan',
			'Anims/DartNew/FishWhistle.jan',
			'Anims/DartNew/FordHint.jan',
			'Anims/DartNew/KissBrain.jan',
			'Anims/DartNew/KissBrain_Idle.jan',
			'Anims/DartNew/Melee/Chop1.jan',
			'Anims/DartNew/Melee/Chop2.jan',
			'Anims/DartNew/Melee/Crane.jan',
			'Anims/DartNew/MeleeArms/TK/Grab.jan',
			'Anims/DartNew/MeleeArms/TK/Lift.jan',
			'Anims/DartNew/Pack/pack_closing.jan',
			'Anims/DartNew/Pack/pack_opening.jan',
			'Anims/DartNew/PsiGrab_armJALf_1.jan',
			'Anims/DartNew/PsiGrab_armJARt_1.jan',
			'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
			'Anims/DartNew/Raz_menaceLobotoArm.jan',
			'Anims/DartNew/Shield_Loop.jan',
			'Anims/DartNew/UseBacon.jan',
			'Anims/DartNew/balloonrun.jan',
			'Anims/DartNew/balloonwalk.jan',
			'Anims/DartNew/balloonwalkslow.jan',
			'Anims/Dartnew/FeatherTickle.jan',
			'Anims/Gloria/ASGD001GL.jan',
			'Anims/Gloria/ASGD003GL.jan',
			'Anims/Objects/InventoryToss.jan',
			'Anims/DartNew/BalloonSpeedMount.jan',
			'Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan',
			'Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan',
			'Anims/DartNew/DoubleJump.jan',
			'Anims/DartNew/PsiBlast_HeadButt.jan',
			'Anims/DartNew/Shield_start.jan',
			'Anims/DartNew/balloonidlefb.jan',
			'Anims/DartNew/hop.jan',
			'Anims/DartNew/landsoft.jan',
			'Anims/DartNew/psifloata.jan',
			'Anims/DartNew/standready.jan',
			'Anims/DartNew/tk.jan',
			'Anims/Thought_Bubble/BubbleDoubleJump.jan',
			'Anims/Thought_Bubble/BubbleIdle.jan',
			'Anims/Thought_Bubble/MidAirMountBubble.jan',
			'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
			'Anims/Thought_Bubble/PsiFloatBubbleOpen.jan',
			'Anims/Thought_Bubble/PsiFloatBubblePop.jan',
			'anims/DartNew/CartwheelLeft.jan',
			'anims/DartNew/StrafeBack.jan',
			'anims/DartNew/StrafeLeft.jan',
			'anims/DartNew/StrafeRight.jan',
			'anims/DartNew/TrnLfCycle.jan',
			'anims/DartNew/TrnRtCycle.jan',
			'anims/DartNew/TumbleBackward.jan',
			'anims/DartNew/TumbleForward.jan',
			'anims/DartNew/creep.jan',
			'anims/DartNew/run.jan',
			'anims/DartNew/walk.jan',
			'anims/Dartnew/tk_turn.jan',
			'cutScenes/ASCL/ASCL_A_Lungfish.jan',
			'cutScenes/ASCL/ASCL_A_Raz.jan',
			'anims/as_cattail/cattail.jan',
			'anims/as_cattail/cattail_short.jan',
			'anims/as_venusflytrap/trapclose.jan',
			'anims/ca_plantshake/fern_flower_wheat.jan',
			'GlobalModels/FX_Models/splash/splash.jan',
			'GlobalModels/FX_Models/splash/splashIdle.jan',
		},
		textures = {  
			'textures/ui/sayline heads/lungfish.dds'
		},	
	}

	Ob.dart = nil
	Ob.currespawnpoint = 1
	Ob.realworldpoint = 1
	Ob.curlevelstate = 1
	Ob.levelType = 'real'
	Ob.rMainTheme = nil
	Ob.rGloriaTheme = nil
	Ob.rCurrentTheme = nil
	Ob.rDesiredTheme = nil
	Ob.rAmbientSound = nil
	Ob.theme = 'AsylumExt'
	
	Ob.fogR = 0.23
	Ob.fogG = 0.25
	Ob.fogB = 0.01
	Ob.fogNear = -20
	Ob.fogFar = 6000
	
	--	Cutscene Parameters
	Ob.ASIN_LungfishJan = 'cutScenes/ASIN/ASIN_Lungfish.jan'
	Ob.ASIN_RazJan = 'cutScenes/ASIN/ASIN_Raz.jan'
	Ob.ASIN_RazPba = 'cutScenes/ASIN/ASIN_Raz.pba'
	Ob.ASIN_Music = nil
	
	Ob.ASCL_LungfishJan = 'cutScenes/ASCL/ASCL_Lungfish.jan'
	Ob.ASCL_RazJan = 'cutScenes/ASCL/ASCL_Raz.jan'
	Ob.ASCL_Music = nil
	
	Ob.cutsceneDone = 0
	
	Ob.firstHintTriggerName = 'tv_domain1'

	-- constant for the e3 demo
	Ob.E3DEMO = nil

	Ob.bDontPlayThemeAtStart = 1
	end

--  I N I T   F U N C T I O N S   A N D   S T A T E S  ********************************************

	function Ob:onPreBeginLevel()
		%Ob.Parent.onPreBeginLevel(self)
		self.hackLastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
	end

	function Ob:onBeginLevel()
		Global:setLevelToCompleted('LO')

		self.rMusicIntroTrigHandle = TriggerOBB_Lookup(nil, 'tv_ASGRExtMusic')
		Trigger_RegisterListener(self.rMusicIntroTrigHandle, self)
			
		%Ob.Parent.onBeginLevel(self)

		FadeToColor(0,0,0,0,0,0,0,0,255,0,0);
		--  reference scripts
		self.Boyd = (Global:loadGlobal('bMMCompleted') ==1 and FindScriptObject('Milkman')) or FindScriptObject('AS_Boyd') 
		self.Gloria = FindScriptObject ('AS_Gloria')
		self.gate = FindScriptObject('asgrMaingateClosed')

		--edit to make gate always open
		if (self.gate) then
			self:sendMessage(self.gate, 'Open')
		end
		
		self.RazTransitPoint = FindScriptObject ('waypointRazTransit')

		-- Water Params
		SetReflectionScale(-0.25)
		SetFresnelBumpScale(0.01)
		SetReflectionBumpScale(0.75)		
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/LO_waterNoise2.tga','Textures/FXTextures/Water/Bumps/SmoothWaterBump.atx')		

		DomainSleep('GloriasGardenDomain', 0)
		--  Set Fog Parameters
		SetDistanceFogEnable(0)
		SetDistanceFogColor(self.fogR, self.fogG, self.fogB)
		SetDistanceFogRange(self.fogNear, self.fogFar)

		--  Skybox Parameters
		--	large skydome necessitates extended far draw distance
		SetSkyBox('Levels/AS_Asylum/ASGR_Skybox.plb')
		SetViewportFarZ(40000)
		
		RegisterTriggerVolume(self,'tv_camHedge1')
		RegisterTriggerVolume(self,'tv_camHedge2')

		-- default starting position so if the level is started in an invalid state raz is not floating
		--[[
		self.dart = FindScriptObject('Dart')
		if ((GetPlayerLSO().spawnpoint) == nil) then
			Global.player:initPosition(self.RazTransitPoint:getPosition())
			SetCamera(kCAMERA_CHASE);
			SetNewAction(Global.player,'Stand')
			self:dontRunPlayerControls(0)
			SetEntityVisible(Global.player,1);
		end
        ]]--

		if Global.player:isInInventory('Brainer') ~= 1 then
			Global.player:addToInventory(SpawnScript('Global.Props.Brainer', 'Brainer'),0,1)
		end
		
		if Global.player:isInInventory('SeaUrchinWhistle') ~= 1 then
			Global.player:addToInventory(SpawnScript('AS.Props.AS_SeaUrchinWhistle','SeaUrchinWhistle'),0,1)
		end
		
		if Global.player:isInInventory('LilisBracelet') == 1 then
			local bracelet = FindScriptObject('LilisBracelet')
			if( nil ~= bracelet ) then
				bracelet:killSelf()
			end
		end
		
		local clairCrowTest = SpawnScript('AS.Characters.AS_ClairvoyanceCrow','crow666')
		
		-- messages from this TV aren't used; registration is necessary to make Trigger_ContainsEntity work, in AS_SeaUrchinWhistle.
		self.WhistleVolume = TriggerSphere_New(-45,-1900,9900, 1000)
		Trigger_RegisterListener(self.WhistleVolume, self)		

		SoundMuteAll()  -- stop all sounds from playing
		
		PlaySound(nil, self.rAmbientSound, 1, 0)
		self.rASExtIntroTheme = LoadSound('AsylumExtIntro')	
			
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

		--Need to run cutscene right away to avoid the single frame, so do it here
		if (Global:load('bElevatorDropping') == 1) then
			Global.cutsceneScript:runCutscene('ElevatorDrop2')
			Global:save('bElevatorDropping', nil)
		else
			local lastPrefix = ''
			if Global:loadGlobal('LastLevel') then lastPrefix = strsub(Global:loadGlobal('LastLevel'), 1, 2) end

			if Global:loadGlobal('bSeenASIN') ~= 1 and lastPrefix ~= 'MM' then
				self:playVideo('cutScenes/prerendered/ASIN.xmv')
				Global:saveGlobal('bSeenASIN', 1)
				Global.player:setSelectedItem('SeaUrchinWhistle',1)
				Global.goalManager:activate('RescueLili', nil, 1)
			end
		
			self:setState(nil)

			if Global:loadGlobal('bMMCompleted') == 1 then
				local basket = FindScriptObject('AS_MilkmanBasket', 1)
				if basket then KillScript(basket) end
			end

			if lastPrefix == 'MM' then
				if Global:loadGlobal('bMMCompleted') ~= 1 then
					Global.player.saved.ASGR.snubbedByCrows = TRUE -- snub cutscene not compatible with this one.  Debug situation only.
					self:setState('MMIncomplete')
				else
					Global.player.saved.ASGR.snubbedByCrows = TRUE -- snub cutscene not compatible with this one.  Debug situation only.
					
					-- the gate should already be open since that's where the prerender leaves it
					if (self.gate) then
						self:sendMessage(self.gate, 'Open')
					end
					
					Global.goalManager:activate('ReachLab')
					
					--If we are loading ASGR for the first time after beating MM, then place him next to boyd
					if (Global:load('bPlacedRazAfterMM') ~= 1) then
						Global.player:setEverything(FindScriptObject('AS_hypnoMM'))
					end
				end
			elseif lastPrefix == 'TH' then
				if (Global:loadGlobal('bTHCompleted') == 1) then
					if (Global:loadGlobal('bTHCompletedPlayed') ~= 1) then
						-- Set some stuff for debug porpoises.
						Global:save('bGloriaIntroPlayed', 1)
						Global:save('GloriaIntroPlayed', 1)
		
						self.startPoint = FindScriptObject ('AS_hypnoTH')
						if Global:load('bTHCompletedPlayed') ~= 1 then
							self:playWinningVideo('TH')
							Global.goalManager:deactivate('Gloria')
							Global.cutsceneScript:runCutscene('THCompleted')
						end
					end
				else
					self:setState('THIncomplete')
				end
			elseif (Global:loadGlobal('LastLevel') == 'ASLB') then
				--Came from ASLB elevator, so look at him from the side with the camera
				SetChaseCameraAzimuth(110, Global.player)
			end

			--edit check setting, if inventory contains all disguise pieces leave elevator open, prevent cutscenes in ASUP and ASCO later
			local settings = FindScriptObject('RandoSeed')
			if settings.earlyelevator == TRUE and Global.player:isInInventory('LobatoPainting') == 1 and Global.player:isInInventory('LobatoHand') == 1 and Global.player:isInInventory('StraightJacket') == 1 then
				Global:saveGlobal('bHasSeenASLB', 1)
				Global:save('bElevatorArrivePlayed', 1)
				Global:saveGlobal('SeenSheegorWarning', 1)
				Global:save('CrispinIntroSeen', 1)
			end

			--edit moved from onBeginLevel for settings
			--Disable elevator to ASLB if player hasn't yet been there.
			local bHasSeenASLB = Global:loadGlobal( 'bHasSeenASLB' )
			if( ( not bHasSeenASLB ) or ( bHasSeenASLB == 0 ) ) then
				local elevator = FindScriptObject( 'elevator1' )
				elevator:disable()
			end	

			SoundMuteNone()
			
			--edit removed to prevent gloria's trophy from moving if spawned in ASGR
			--[[local hand = FindScriptObject('LobatoHand')
			if hand and hand.bInInventory ~= 1 then 
				hand:setHomePosition() 
			end]]
			
		end
		
		if (Trigger_ContainsEntity(self.rMusicIntroTrigHandle, Global.player) == 1) then
			self:setLevelTheme('AsylumExtIntro')
		else
			self:setLevelTheme(self.theme)			
		end
		self:setDomain('snowglobe_', 1)
	end

	function Ob:getKickoutLocation(lastLevelPrefix)
		--These shouldn't be hard coded, it should have a locator, but I'm copying and pasting
		--from another part of code.  (JLV)

		if (lastLevelPrefix == 'MM') then
			--Getting kicked out of boyd's mind has a special locator if he was rebrained.
			if (Global:load('bRevisited', 'MM') == 1) then
				local locator = SpawnScript('Locator')
				locator:setPosition(517.7, 235.0, 3594.0)
				locator:setOrientation(0.0, -103.6, 0.0)
				return locator
			end
		end
		return %Ob.Parent.getKickoutLocation(self, lastLevelPrefix)
	end

	-- lil helper function that can be called from another
	function Ob:startAndStopMusic()
		if (self.rCurrentTheme ~= self.rDesiredTheme) then
			-- stop current level music
			if (self.rCurrentTheme ~= nil) then
				StopSound(self.rCurrentTheme)
			end
			self.rCurrentTheme = self.rDesiredTheme
			-- play new level music
			PlaySound(nil, self.rCurrentTheme, 1, 0)
		end
	end
	
	-- put this in another state because Gloria's triggervolume could potentially change the music
	function Ob:stateStartMusic()
		Yield()
		self:startAndStopMusic()
	end

--*************************************************************************************************  

	function Ob:stateLevelSetup()	
	end

	
--  C U T S C E N E   S T A T E S  ****************************************************************

                                                                                                       
    function Ob:stateTestCam() 
		    
        SetCamera(kCAMERA_SCRIPT)
		
		--shot 1                                                                      
        local shot1cam = {} 
		shot1cam[0] = {xpos = -302, ypos = -1893, zpos = 31247, xang = 7, yang = -1, zang = 0, field_of_view = 90}
        shot1cam[1] = {xpos = 71, ypos = -1906, zpos = 13432, xang = 5, yang = 3, zang = 0, field_of_view = 90}
        --alt:     shot1cam[1] = {xpos = 71, ypos = -1906, zpos = 13432, xang = 5, yang = 3, zang = 0, field_of_view = 90}
        local shot1pathID = CreateCameraPath(shot1cam, 6 , 0 , 2.0)
        RunCameraPath(shot1pathID,1)
        
		--shot 2
    	local shot2cam = {}
        shot2cam[0] = {xpos = -1671, ypos = -1948, zpos = 10193, xang = -1, yang = -135, zang = 0, field_of_view = 90}                     
        shot2cam[1] = {xpos = -878, ypos = -1835, zpos = 9354, xang = -2, yang = -145, zang = 0, field_of_view = 90}
        shot2cam[2] = {xpos = -746, ypos = -1815, zpos = 9233, xang = -2, yang = -145, zang = 0, field_of_view = 90}  
        local shot2pathID = CreateCameraPath(shot2cam, 5 , 0 , 4.0)
		RunCameraPath(shot2pathID,1)
        
        self:sleep(2)
        
        --spit out shot
        SetCameraPosition(-223,-1874,9829)
        SetCameraOrientation(9,-141,0)
--        camanim[0] = {xpos = -223, ypos = -1874, zpos = 9829, xang = 9, yang = -141, zang = 0, field_of_view = 90}
        self:sleep(2)
        
    
        DeleteCameraPath(shot1pathID)
        DeleteCameraPath(shot2pathID)
		
        SetCamera(kCAMERA_CHASE)
        
    end
	
--*************************************************************************************************
	
	function Ob:stateMMIncomplete()
		self.Boyd:sayLine("/ASBN000BO/", 0, 0, nil, 1, nil, 1)--DIALOG=<<You, you\'re part of it! Stay away!>>
		self:setState(nil)
	end

--*************************************************************************************************

	function Ob:stateTHIncomplete()
		self.Gloria:sayLine("/ASBP000GL/", 0, 0, nil, 1, nil, 1)--DIALOG=<<You can walk away from the stage young man, but showbusiness will always be a part of you.>>
		self:setState(nil)
	end

--*************************************************************************************************

--*************************************************************************************************
		
    function Ob:stateSnubbedByCrows() 
    
        Global.player.saved.ASGR.snubbedByCrows = TRUE
        
        Global.player:sayLine("/ASAB000RA/",1,1,nil,1)--DIALOG=<<Have you crows seen a-->>
        Global.player:sayLine("/ASAB001RA/",1,1, nil, 1)--DIALOG=<<Hey! I was talking to you, jerks!>>
        self:setState(nil)
    end

--*************************************************************************************************

    function Ob:stateTalkToCrows()
        if (not Global.player.saved.ASGR.crowTalkCount) then
            Global.player.saved.ASGR.crowTalkCount = 0
        end
        
        Global.player.saved.ASGR.crowTalkCount = Global.player.saved.ASGR.crowTalkCount + 1        
        
        if (Global.player.saved.ASGR.crowTalkCount == 1) then
            Global.player:sayLine("/ASAB002RA/",0,1)--DIALOG=<<Hey, could you guys hold still for a minute?>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 2) then
            Global.player:sayLine("/ASAB003RA/",0,1)--DIALOG=<<I\'m trying to read your minds.>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 3) then
            Global.player:sayLine("/ASAB004RA/",0,1)--DIALOG=<<Gah, it\'s no use! All they think about is worms.>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 4) then
            Global.player:sayLine("/ASAB005RA/",0,1)--DIALOG=<<So gross.>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 5) then
            Global.player:sayLine("/ASAB006RA/",0,1)--DIALOG=<<How about you?>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 6) then
            Global.player:sayLine("/ASAB007RA/",0,1)--DIALOG=<<Seen any suspicious characters around here lately?>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 7) then--DIALOG=<<Seen any suspicious characters around here lately?>>
            Global.player:sayLine("/ASAB008RA/",0,1)--DIALOG=<<Yeah, yeah. Bugs are delicious.>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 8) then--DIALOG=<<Yeah, yeah. Bugs are delicious.>>
            Global.player:sayLine("/ASAB009RA/",0,1)--DIALOG=<<Tell me something I don\'t already know.>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 9) then--DIALOG=<<Tell me something I don\'t already know.>>
            Global.player:sayLine("/ASAB010RA/",0,1)--DIALOG=<<I don\'t suppose you all want to pull together and lift me up into that tower?>>
        elseif (Global.player.saved.ASGR.crowTalkCount == 10) then--DIALOG=<<I don\'t suppose you all want to pull together and lift me up into that tower?>>
            Global.player:sayLine("/ASWV008RA/",0,1)--DIALOG=<<(sigh)>>
        else
            Global.player:sayLine("/ASAB011RA/",0,1) -- bored to death--DIALOG=<<Yeah, yeah. Caw, caw, caw!>>
        end
        self:setState(nil)
    
    end


--*************************************************************************************************
    
	
--  M E S S A G E   H A N D L E R S  **************************************************************

--*************************************************************************************************
                
    function Ob:onTalkToCrows(data,from)
        self:setState('TalkToCrows')                
    end
	
--*************************************************************************************************
                
    function Ob:onSnubbedByCrows(data,from)
        self:setState('SnubbedByCrows')                
    end
	
--*************************************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if (data == 'tv_fixedCam' and from == Global.player) then
			SetCamera(kCAMERA_CHASE)
			SetChaseCameraFixedPosition(3027, 436, 1069, 0)
		end
		%Ob.Parent.onEnteredTriggerVolume(self,data,from)
	end
	
--*************************************************************************************************
	
	function Ob:onExitedTriggerVolume(data,from)
		if (data == 'tv_fixedCam' and from == Global.player) then
			SetCamera(kCAMERA_CHASE)
			MoveCameraToIdeal()		
		elseif (data == 'tv_ASGRExtMusic') then
			if (IsSoundPlaying(self.rASExtIntroTheme) == 1) then
				-- play the regular asylum music
				self:setLevelTheme(self.theme, 1)
			end
		end
		%Ob.Parent.onExitedTriggerVolume(self,data,from)
	end

--*************************************************************************************************

	function Ob:getHintResponse()

		if (Global:load('bASBoydIntroPlayed') ~= 1) then 
			return {
				{
					voice = "/GLAJ005FO/",--DIALOG=<<We\'re by the old, abandoned insane asylum. I\'ll bet Oleander has his headquarters up inside.>>
				},
				{
					voice = "/GLAJ006FO/",--DIALOG=<<And keep your eyes peeled for stolen brains.>>
				},
				{
					voice = "/GLAJ007FO/",--DIALOG=<<The thief might have dropped some along the way.>>
				},
				{
					voice = "/GLAJ008FO/",--DIALOG=<<I\'ll bet those crows can see where some of them are...>>
				},
			}
		elseif (Global:loadGlobal('bMMCompleted') ~= 1) then 
			return {
				{
					voice = "/GLAJ009FO/",--DIALOG=<<Go into this guard\'s mind, and see if you can find a way to make him open the gate!>>
				}
			}
		else
			return {
				{
					voice = "/GLAJ010FO/",--DIALOG=<<Lets find a way into that asylum!>>
				}
			}
		end
	end

	return Ob
end

