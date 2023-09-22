function STMU(Ob)
    if not Ob then
       	Ob = CreateObject( 'LevelScript', 'STMU' )
       	Ob.dependencies = {
			animations = { 
				'Anims/DartNew/MainMenu_Jump.jan',
				'Anims/MenuBrain/Door3Open.jan',
				'Anims/MenuBrain/Door2Open.jan',
				'Anims/MenuBrain/Door1Open.jan',
				'Anims/MenuBrain/Door4Open.jan',
				'Anims/MenuBrain/Door3OpenedIdle.jan',
				'Anims/MenuBrain/Door2OpenedIdle.jan',
				'Anims/MenuBrain/Door1OpenedIdle.jan',
				'Anims/MenuBrain/Door4OpenedIdle.jan',
				'Anims/MenuBrain/Door3Close.jan',
				'Anims/MenuBrain/Door2Close.jan',
				'Anims/MenuBrain/Door1Close.jan',
				'Anims/MenuBrain/Door4Close.jan',
				'Anims/MenuBrain/Door3ClosedIdle.jan',
				'Anims/MenuBrain/Door2ClosedIdle.jan',
				'Anims/MenuBrain/Door1ClosedIdle.jan',
				'Anims/MenuBrain/Door4ClosedIdle.jan',
				'Anims/MenuBrain/Door3Crack.jan',
				'Anims/MenuBrain/Door2Crack.jan',
				'Anims/MenuBrain/Door1Crack.jan',
				'Anims/MenuBrain/Door4Crack.jan',
				'Anims/MenuBrain/Door3CrackedIdle.jan',
				'Anims/MenuBrain/Door2CrackedIdle.jan',
				'Anims/MenuBrain/Door1CrackedIdle.jan',
				'Anims/MenuBrain/Door4CrackedIdle.jan',
			},
			textures = {
				'textures/hud/quick_psiblasttrainerbig.dds'
			}
		}	

        --Ob.defaultAmbientSoundName = 'CollectiveUnconscious'	     
	Ob.bCreditsDone = 0
    end
	--*************************************************************************************************

	function Ob:SetupCreditText()
		
		self.Global = fso('Global');
                
		-- setup the credits text
		self.CreditText = {}   							     
		self.TitleText = {}   
		
                local iRandomizeBG = -1
		self.OpeningCredits = {					    
			{ '/GLZD577TO/', ' ',4}, 
			{ '/GLZD265TO/', 'David Dixon',4},
			{ '/GLZD267TO/', 'Erik Robson',4},			     
			{ '/GLZD269TO/', 'Matt Franklin',4},
			{ '/GLPC068TO/', 'Lance Burton',4},
			{ ' ', 'Kee Chi\nPaul Du Bois\nAndrew Falth',8},			    
            { ' ', 'Brad Muir\nLloyd Pique\nIngar Shu\nJon Stone',6},
            { '/GLZD272TO/', ' ',4},	-- art	
			{ ' ', 'Razmig Mavlian\nNathan Stapley',3},					    
			{ ' ', 'Raymond Crook\nMark Hamer\nTyler Hurd',4},
			{ '/GLZD275TO/', ' ',1}, -- environments
			{ ' ', 'Brian Christian\nRhandy Cruz\nJosh Lindeman',4},
			{ ' ', 'Kjeld Pedersen\nTerry Redfield\nFred Selker',6},
			{ '/GLZD385TO/', 'Dion Hopkins\nSean Wagstaff',6},
            { '/GLZD276TO/' , 'Lleslle Aclaro\nCamilla Fossen\nMalena Annable',8},           
			{ '/GLZD277TO/' , 'Peter McConnell',3},
            { '/GLZD279TO/' , 'Khris Brown',4},
			{ '/GLZD282TO/' , 'Steve Peck',3},
			{ '/GLZD284TO/' , ' ',1}, -- quality assurance
			{ '  ' , 'Juli Logemann\nIsaac Marotte',3},	     			                        
			
		}
		
		--self.SplineCredit1:setMesh('GlobalModels/CO_Collectibles/credits6x6.plb')	
		self.SplineCredit1:setMesh('WorkResource/Levels/Menu/Credits_1line.plb')	     
		self.SplineCredit1:addCreditsText( self.OpeningCredits,0,nil)
		
	       		
		-- linecode, name , background texture index
		-- background texture index, -1 = randomize otherwise the texture is specified by scott 
		self.OpeningCredits = {
			{ '/GLZD264TO/', 'Tim Schafer',6},
			{ '/GLZD266TO/', 'Scott Campbell',8}, 
			{ '/GLZD268TO/' , 'Sandra Christiansen\nEric Ingerson\nDavid Russell',7},
			{ '/GLZD270TO/' , 'Caroline Esmurdoc',8},
			{ '/GLZD271TO/', ' ',1},	       -- programming 				     
		    { ' ', 'Wilson Hom\nAnna Kipnis\nNathan Martz\nAlex Mouton',6},
			{ ' ', 'Thien Tran\nAmy Unger\nJoe Virskus\nErik Wolpaw',8},
			{ ' ', 'Kim Cogan\nMark Hamer',5},
			{ '/GLZD274TO/', ' ',2 },	-- animation
			{ ' ', 'Christopher Magovern\nRazmig Mavlian\nChris Schultz',6},
			{ ' ', 'Tim Alexander\nSteven Chen\nJoseph Ching',6},
			{ ' ', 'Lydia Hui-Ju Lu\nGaurav Mathur\nChristopher McGee',8},
			{ ' ', 'Geoff Soulis\nPaul Zinnes',3}, 
			{ '/GLZD273TO/', 'Scott Campbell\nPeter Chan',6},    						   
            { '/GLZD370TO/' , 'Tim Schafer\nErik Wolpaw',8},	-- Story and Dialog 
			{ '/GLZD278TO/' , 'Clint Bajakian\nJared Emerson-Johnson\nJulian Kwasneski',7},
			{ '/GLZD281TO/' , 'Kelli Townley',8},
			{ '/GLZD283TO/' , 'Bert Chang\nJosh Pfeiffer',4},
            { ' ' , 'Seth Benson\nTony Gomez\nSam Keshavarz',6},	
			{ '/GLZD573TO/' , ' ',4},	           		
                                     		         		      
		}                              
		
		--self.SplineCredit2:setMesh('GlobalModels/CO_Collectibles/Co_Figment6x6.plb')
		self.SplineCredit2:setMesh('WorkResource/Levels/Menu/Credits_2line.plb')
		self.SplineCredit2:addCreditsText( self.OpeningCredits,1,self)
	end

	--*************************************************************************************************
	
	function Ob:onBeginLevel()		       
		%Ob.Parent.onBeginLevel(self)

		--edit display PsychoRando Version on screen
		self.version = SpawnScript('Global.OtherEntities.DisplayVersion', 'PsychoRando')
               
		self.kFADETIME = 0.5
		self.kMAXOPACITY = 0.2
		self.DoorLight  = {}
		self.DoorLight[1] =   FindScriptObject('doorlight4')
		self.DoorLight[2] =   FindScriptObject('doorlight3')
		self.DoorLight[3] =   FindScriptObject('doorlight2')
		self.DoorLight[4] =   FindScriptObject('door1light')
		
		self.DoorJamLight = {}
		self.DoorJamLight[1] =   FindScriptObject('doorjamlight1')
		self.DoorJamLight[2] =   FindScriptObject('doorjamlight2')
		self.DoorJamLight[3] =   FindScriptObject('doorjamlight3')
                self.DoorJamLight[4] =   FindScriptObject('doorjamlight4')
		
		self.DoorRimLight = {}
		self.DoorRimLight[1] =   FindScriptObject('doorrimlight1')
		self.DoorRimLight[2] =   FindScriptObject('doorrimlight2')
		self.DoorRimLight[3] =   FindScriptObject('doorrimlight3')
                self.DoorRimLight[4] =   FindScriptObject('doorrimlight4')


		
		self.DoorHinge = {}
		self.DoorHinge[1] =   FindScriptObject('Doorcenter1')
		self.DoorHinge[2] =   FindScriptObject('Doorcenter2')		   
		self.DoorHinge[3] =   FindScriptObject('Doorcenter3')		       
		self.DoorHinge[4] =   FindScriptObject('Doorcenter4')

		self.DoorText = {}	        
		local yOffset = 65
		local xOffset = 40
		x,y,z = self.DoorHinge[4]:getPosition()
	    --self.DoorText[1] = DisplayText3('/GLZJ001TO/',x-xOffset,y+yOffset,z,0,0,0,2.2,2.2,1,240, 192, 0,0,0,0,1,1)
							    
		self.bStartPressed = 0
	    self.kFAR_CAMERA_RADIUS = 1200
		self.kCLOSE_CAMERA_RADIUS = 1200	          	 
		self.kFAR_CAMERA_HEIGHT = -480	             			 
		self.kCLOSE_CAMERA_HEIGHT = 100		             
										    
		SetSkyBox('Levels/SkyBox/CU_SkyBox.plb')	       
		 -- init the bunkhouse control handler				    
		ActivateMainMenuControlHandler()		             
	
		self.bIsPCBuild = IsPCBuild()
		self.bProfileExist = DoesAnyGameProfileExist()
		self.bContinueExist = DoesContinueExist()

		     
		self.playerDart = FindScriptObject('Dart')
		self.playerDart:setPhysics(kPHYSICS_NONE)		  
		
		--load the doors
		self.Doors = {}
		self.Doors[1] = SpawnScript('Global.Props.Geometry', 'mainDoor3', 'self.meshName = \'Levels/Menu/Props/Door3.plb\' self.firestartResistance = 1') -- new
		
		SetPhysicsFlag(self.Doors[1], PHYSICS_COLLIDEE, 0)

		 -- setup trigger volumes
                RegisterTriggerVolume(self,'tv_door4')					 
		RegisterTriggerVolume(self,'tv_doorarea')

		if(self.bProfileExist == 1) then
		        if(self.bContinueExist == 1) then
				self.Doors[2] = SpawnScript('Global.Props.Geometry', 'mainDoor2', 'self.meshName = \'Levels/Menu/Props/Door2.plb\' self.firestartResistance = 1')  -- continue
				x,y,z = self.DoorHinge[3]:getPosition()
				--self.DoorText[2] = DisplayText3('/GLZJ002TO/',x-xOffset,y+yOffset+10,z,0,0,0,1.7,1.7,1, 0, 240, 96,0,0,0,1,1)  -- continue
				 SetPhysicsFlag(self.Doors[2], PHYSICS_COLLIDEE, 0)	 
				 
				 RegisterTriggerVolume(self,'tv_door3')


			end
			self.Doors[3] = SpawnScript('Global.Props.Geometry', 'mainDoor1', 'self.meshName = \'Levels/Menu/Props/Door1.plb\' self.firestartResistance = 1')  -- load
			
				       
			 x,y,z = self.DoorHinge[2]:getPosition()
			--self.DoorText[3] = DisplayText3('/GLZJ003TO/',x-xOffset,y+yOffset,z,0,0,0,2.2,2.2,1,82, 240, 0,0,0,0,1,1)  -- load
	 										    
		       
			SetPhysicsFlag(self.Doors[3], PHYSICS_COLLIDEE, 0)	  
                        RegisterTriggerVolume(self,'tv_door2')				        
		end          
			              				      

		self.DoorOpenAnim = {}
		self.DoorOpenAnim[1] = 'Anims/MenuBrain/Door3Open.jan';
		self.DoorOpenAnim[2] = 'Anims/MenuBrain/Door2Open.jan';		       
		self.DoorOpenAnim[3] = 'Anims/MenuBrain/Door1Open.jan';
		self.DoorOpenAnim[4] = 'Anims/MenuBrain/Door4Open.jan';
		
		self.DoorOpenIdleAnim = {}
		self.DoorOpenIdleAnim[1] = 'Anims/MenuBrain/Door3OpenedIdle.jan';
		self.DoorOpenIdleAnim[2] = 'Anims/MenuBrain/Door2OpenedIdle.jan';
		self.DoorOpenIdleAnim[3] = 'Anims/MenuBrain/Door1OpenedIdle.jan';
		self.DoorOpenIdleAnim[4] = 'Anims/MenuBrain/Door4OpenedIdle.jan';

		self.DoorCloseAnim = {}
		self.DoorCloseAnim[1] = 'Anims/MenuBrain/Door3Close.jan';
		self.DoorCloseAnim[2] = 'Anims/MenuBrain/Door2Close.jan';
		self.DoorCloseAnim[3] = 'Anims/MenuBrain/Door1Close.jan';
		self.DoorCloseAnim[4] = 'Anims/MenuBrain/Door4Close.jan';
		
		self.DoorClosedIdleAnim = {}
		self.DoorClosedIdleAnim[1] = 'Anims/MenuBrain/Door3ClosedIdle.jan';
		self.DoorClosedIdleAnim[2] = 'Anims/MenuBrain/Door2ClosedIdle.jan';
		self.DoorClosedIdleAnim[3] = 'Anims/MenuBrain/Door1ClosedIdle.jan';
		self.DoorClosedIdleAnim[4] = 'Anims/MenuBrain/Door4ClosedIdle.jan';	   			      

		self.DoorCrackedAnim = {}
		self.DoorCrackedAnim[1] = 'Anims/MenuBrain/Door3Crack.jan';
		self.DoorCrackedAnim[2] = 'Anims/MenuBrain/Door2Crack.jan';
		self.DoorCrackedAnim[3] = 'Anims/MenuBrain/Door1Crack.jan';
		self.DoorCrackedAnim[4] = 'Anims/MenuBrain/Door4Crack.jan';

		self.DoorCrackedIdleAnim = {}
		self.DoorCrackedIdleAnim[1] = 'Anims/MenuBrain/Door3CrackedIdle.jan';
		self.DoorCrackedIdleAnim[2] = 'Anims/MenuBrain/Door2CrackedIdle.jan';
		self.DoorCrackedIdleAnim[3] = 'Anims/MenuBrain/Door1CrackedIdle.jan';
		self.DoorCrackedIdleAnim[4] = 'Anims/MenuBrain/Door4CrackedIdle.jan';


		--shut off all door lights
		SetEntityAlpha(self.DoorLight[1], 0, 0)
		SetEntityAlpha(self.DoorLight[2], 0, 0)
		SetEntityAlpha(self.DoorLight[3], 0, 0)			          
		SetEntityAlpha(self.DoorLight[4], 0, 0)
		SetEntityAlpha(self.DoorJamLight[1], 0, 0)
		SetEntityAlpha(self.DoorJamLight[2], 0, 0)		       
		SetEntityAlpha(self.DoorJamLight[3], 0, 0)		       
		SetEntityAlpha(self.DoorJamLight[4], 0, 0)		  
		SetEntityAlpha(self.DoorRimLight[1], 0, 0)
		SetEntityAlpha(self.DoorRimLight[2], 0, 0)		       
		SetEntityAlpha(self.DoorRimLight[3], 0, 0)		       
		SetEntityAlpha(self.DoorRimLight[4], 0, 0)
									         

		self.bDiableTriggers = 1
		self.startPosx = -372.908
		self.startPosy = 284.708	     
		self.startPosz = 6.93315	  	        
	       		
              
		self.TextUp = LoadSound('MenuPopup')
		self.DoorOpen = LoadSound('door_open_2')
		--self.LoadScreen = LoadSound('LoadScreen')
		self.DoorClose = LoadSound('door_close_1') 
		self.StartButtonSound = LoadSound('SplashScreen')
		self.PostStartButtonSound = LoadSound('PostStart')     		      
				      
		      		       
		self.SplineCredit1 = fso('CreditFigment1')		     
		self.SplineCredit2 = fso('CreditFigment2')
		self:SetupCreditText()
		
		PreloadAnimData( 'Anims/DartNew/walkmove.jan' )
		PreloadAnimData( 'Anims/DartNew/standready.jan' )
										    
		self.currentDoor = nil

                self.bPlayCredits = 0
		
		-- make sure there is no debug stuff for the game    
		Global:prepareNewGame()	    
		
		self:setState(nil)	  	       
		
	end	      
	--*************************************************************************************************

	function Ob:onPostBeginLevel()
  		%Ob.Parent.onPostBeginLevel(self)
		if (IsMainMenuStartPressed() ~=1) then	     
			self:setState('Logo')
			FadeToColor( 0, 0, 0, 0, 0, 255 , 255, 255, 255,'Textures/UI/DFStartupLogo.tga', 2 )
			self.bCreditsDone = 0
			PlaySound(nil,self.StartButtonSound)
		else
			self.playerDart:setOrientation(-67 , 95 , -68 )  
			self.playerDart:setPosition(self.startPosx ,self.startPosy  , self.startPosz     )
			SetCameraPosition(1584.33, 537.3 ,150.817  )
			SetCameraOrientation(-2.29377 ,84.852,17.6502)
			self.bDiableTriggers = 0
			self.bCreditsDone = 1
			self:setState(nil)
			self.bStartPressed = 1
			PlaySound(nil,self.PostStartButtonSound)
		end
		local noCollect = function(ent)
			UnregisterTriggerVolume(ent, 'tv_figment')
		end
		foreach_entity_oftype('global.collectibles.Figment', noCollect)
		foreach_entity_oftype('global.collectibles.SplineFigment', noCollect)
		
		self:createTimerSecs(self.logoPulsateTime, self.TIMER_LOGOPULSATE)
		self.bLogoOn = 1
		self.logo = FindScriptObject('lightraylower')
		    
		Global.player:doNothing()
		--slow camera drift
                self:createTimerSecs(self.driftTime, self.TIMER_DRIFT)
		CameraStartShakePeriodic(self.driftTime, 0,0, 10,10,10, 1)
	end
	
	Ob.logoPulsateTime = 2
	Ob.fadedAlpha = 0.4
	Ob.TIMER_LOGOPULSATE = '7000'
	Ob.driftTime = 1000
	Ob.TIMER_DRIFT = '7001'				    
	
	function Ob:onTimer(data,from)
		if (data == self.TIMER_DRIFT) then
		       CameraStartShakePeriodic(self.driftTime, 0,0, 10,10,10, 1)
		elseif (data == self.TIMER_LOGOPULSATE) then
			if (self.bLogoOn == 1) then
				self.bLogoOn = 0
				self.logo:setAlpha(self.fadedAlpha, self.logoPulsateTime)
			else
				self.bLogoOn = 1
				self.logo:setAlpha(1, self.logoPulsateTime)
			end
		else
			%Ob.Parent.onTimer(self,data,from)
		end
	end
	
	--*************************************************************************************************

	function Ob:stateStartNewGame()
		self:setState(nil)
	end
	
	--*************************************************************************************************

	function Ob:stateLoopCredits()
	      if(self.bStartPressed ~= 1) then				    
		PurgeCreditsText()
		self:SetupCreditText()
		self:sleep(4)
		self.SplineCredit1:onGo()			     
		self.SplineCredit2:onGo()
	      end  
	      self:setState(nil)

	end
	function Ob:onCreditsDone()
	      self.SplineCredit1:StopSpline()
  	      self.SplineCredit2:StopSpline()    
		
	      if(self.bStartPressed ~= 1)  then
		self:setState('LoopCredits')
	      else
		SetEntityAlpha(self.SplineCredit1,0,1)
		SetEntityAlpha(self.SplineCredit2,0,1)
	      end
	      
	end
	
	--*************************************************************************************************

	function Ob:stateStartButton()
	    
	    self.bStartPressed = 1 
            self:onCreditsDone()
	    -- run camera closer to the brain		     
	    local fov = GetCameraFieldOfView()
	    local shot1cam = {} 
	    local cx,cy,cz = GetCameraPosition()		       
   	    local cox,coy,coz = GetCameraOrientation()

	    shot1cam[0] = {xpos = cx, ypos = cy, zpos = cz, xang = cox, yang = coy, zang = coz, field_of_view = fov}
	    shot1cam[1] = {xpos = 1565.1, ypos = 582.2 , zpos = 125.2, xang = 0.7, yang = 84.9 , zang = 20.7, field_of_view = fov}
    	    self.shot1pathID = CreateCameraPath(shot1cam,2 , 0.25 , 0.25)
	    RunCameraPath(self.shot1pathID,3)
	    self.playerDart:setPosition(self.startPosx ,self.startPosy  , self.startPosz   )
	    LoadAnim(self.playerDart,'Anims/DartNew/walkmove.jan')
  	    local x,y,z = self.playerDart:getPosition()
	    local iDist = GetDistance(x, 0 ,z, self.startPosx ,0  , self.startPosz )

		while (iDist < 250) do
			Yield()									 
			x,y,z = self.playerDart:getPosition()
			iDist = GetDistance(x, 0 ,z,self.startPosx ,0  , self.startPosz)    
			if (IsPlayingAnim(self.playerDart,'walkmove.jan')==0) then
				LoadAnim(self.playerDart,'Anims/DartNew/walkmove.jan')			     
			end
	    end									  
	    LoadAnim(self.playerDart,'Anims/DartNew/standready.jan')
             
						      
	    self:sleep(0.75)
	    SetChaseCameraPaused(1)
		
	    --SetCameraPosition(2332.33, 926.475, 225.54 )
	    --SetCameraOrientation(-2.29377 ,84.852,17.6502)	   	 
	    					        
	    local cx,cy,cz = GetCameraPosition()		       
   	    local cox,coy,coz = GetCameraOrientation()

	    StopSound(self.StartButtonSound)
	    PlaySound(nil,self.PostStartButtonSound)
	    
	    
	    self.bDiableTriggers = 0   
	    Yield() 
	    Global.player:setNewAction('Stand')	   			   
	    

	    self:setState(nil)				       
	end				                      
	function Ob:onStartButton()		   
	    self:setState('StartButton')	             
		
	end
	--*************************************************************************************************

	function Ob:stateLogo()
	    --PauseMenuControlHandler(1)

	    --PauseMenuControlHandler(0)
	    self.bDiableTriggers = 1
		-- No need to play the video any more since the dvd installation does
		-- this.
	    --PlayVideo('cutScenes/prerendered/MajescoLogo.bik')
		--PlayVideo('cutScenes/prerendered/DFLogo.bik')
	    FadeToColor( 0, 0, 0, 255, 0, 0 , 0, 0, 0,0, 2 )
	    
	    self.playerDart:setOrientation(-67 , 95 , -68 )  
	    self.playerDart:setPosition(self.startPosx ,self.startPosy  , self.startPosz )	   	  
		
		SetCamera(kCAMERA_SCRIPT)   
	    
	    local cx,cy,cz = 2549.95,856.333,277.443 --GetCameraPosition()		       
   	    local cox,coy,coz = -2.39876,84.787,17.5445 --GetCameraOrientation()
   	    SetCameraPosition(cx,cy,cz);
   	    SetCameraOrientation(cox,coy,coz);

		--SetCameraPosition(1584.33, 537.3 ,150.817  )
	    --SetCameraOrientation(-2.29377 ,84.852,17.6502)
		
	    if(IsOXMBuild() ~=1) then
		self.SplineCredit2.iFastSpeed = 40
	    
		self:sleep(4.5)
		-- run the credits
		self.SplineCredit1:onGo()			     
		--self:sleep(2)
		self.SplineCredit2:onGo()	         
	    end
		
	    
	    self:setState(nil)                  
	end

	--*************************************************************************************************
	function Ob:stateCrackDoor()
		if self.currentDoor == nil then 
			return
		end
		
		--PlaySound(nil,self.LoadScreen)
		LoadAnim(self.Doors[self.currentDoor], self.DoorCrackedAnim[self.currentDoor],0.2,0,1) 

		while (IsPlayingAnim(self.Doors[self.currentDoor]) == 1) do
			Yield()
		end

		LoadAnim(self.Doors[self.currentDoor], self.DoorCrackedIdleAnim[self.currentDoor],0.2,1,1) 
		self:setState(nil)

	end 
	--*************************************************************************************************
	function Ob:stateCloseCrackedDoor()    
	    if self.currentDoor == nil then 
	       	return						   
	    end
 							       
	    LoadAnim(self.Doors[self.currentDoor], self.DoorClosedIdleAnim[self.currentDoor],0.1,0,1) 
	    --StopSound(self.LoadScreen) 
		self:setState(nil)				       

	end   
	--*************************************************************************************************
	function Ob:stateJumpToDoor()
		SetEntityAlpha(self.DoorJamLight[1], 0, 0.2)
		SetEntityAlpha(self.DoorJamLight[2], 0, 0.2)
		SetEntityAlpha(self.DoorJamLight[3], 0, 0.2)
		SetEntityAlpha(self.DoorJamLight[4], 0, 0.2)

		PauseMenuControlHandler(1)
		Global.player:doNothing() 
		
		              
		LoadAnim(self.playerDart,'Anims/DartNew/MainMenu_Jump.jan',0.0,0,1);
		-- timing: allow raz to jump first before the doors start to open
		self:sleep(0.2)
		
		LoadAnim(self.Doors[self.currentDoor], self.DoorOpenAnim[self.currentDoor],0.0,0,1) 
		PlaySound(nil,self.DoorOpen)
		
		self:sleep(0.2)
		SetEntityAlpha(self.DoorLight[self.currentDoor], self.kMAXOPACITY, 0)
		while (IsPlayingAnim(self.playerDart,'MainMenu_Jump.jan') == 1) do
			Yield()
		end
		
		--if self.currentDoor ~= 1 then
		--	LoadAnim(self.Doors[self.currentDoor], self.DoorCloseAnim[self.currentDoor],0.0,0,1) 
		--	SetEntityAlpha(self.DoorLight[self.currentDoor], 0, self.kFADETIME)
		--	self:sleep(0.5)
		--	PlaySound(nil,self.DoorClose)
		--end
                
		while (IsPlayingAnim(self.Doors[self.currentDoor]) == 1) do
			Yield()
		end											     
		self:sleep(0.5)	 
		
		-- run a cam path to point at brain			
	        ShowMainMenuText(0)
		self:onCurrentDoorClosed(self.currentDoor)
		SetCamera(kCAMERA_SCRIPT)	
                local cx,cy,cz = GetCameraPosition()		       
		local cox,coy,coz = GetCameraOrientation()
		local fov = GetCameraFieldOfView()
		local shot1cam = {} 
		shot1cam[0] = {xpos = cx, ypos = cy, zpos = cz, xang = cox, yang = coy, zang = coz, field_of_view = fov}
		
		local ideal_px, ideal_py, ideal_pz
		local ideal_vx, ideal_vy, ideal_vz
		
		if self.currentDoor == 1 then
		
             ideal_px = -640.0
             ideal_py = 355.9
             ideal_pz = 344.5

             ideal_vx = 0.85
             ideal_vy = -0.49
             ideal_vz = -0.20

		elseif self.currentDoor == 2 then
		
             ideal_px = -498.0
             ideal_py = 601.5
             ideal_pz = 42.0

             ideal_vx = 0.63
             ideal_vy = -0.78
             ideal_vz = 0.01

		elseif self.currentDoor == 3 then
		
             ideal_px = -624.5
             ideal_py = 408.4
             ideal_pz = -199.4

             ideal_vx = 0.81
             ideal_vy = -0.58
             ideal_vz = 0.05
		
        end
		
		local ideal_ox, ideal_oy, ideal_oz = VectorToEuler(ideal_vx, ideal_vy, ideal_vz)
		local param_1 = -800
		local param_2 = 0
		local param_3 = 250
		
		shot1cam[1] = {
			xpos = ideal_px + ideal_vx * param_1,
			ypos = ideal_py + ideal_vy * param_1,
			zpos = ideal_pz + ideal_vz * param_1,
			xang = ideal_ox, yang = ideal_oy, zang = ideal_oz,
			field_of_view = fov}
			
		shot1cam[2] = {
			xpos = ideal_px + ideal_vx * param_2,
			ypos = ideal_py + ideal_vy * param_2,
			zpos = ideal_pz + ideal_vz * param_2,
			xang = ideal_ox, yang = ideal_oy, zang = ideal_oz,
			field_of_view = fov}

		shot1cam[3] = {
			xpos = ideal_px + ideal_vx * param_3,
			ypos = ideal_py + ideal_vy * param_3,
			zpos = ideal_pz + ideal_vz * param_3,
			xang = ideal_ox, yang = ideal_oy, zang = ideal_oz,
			field_of_view = fov}

		self.shot1pathID = CreateCameraPath(shot1cam, 1.5, 0.25 , 0.25, 1) -- Apply current camera up vector
		RunCameraPath(self.shot1pathID,0)		         				   
										      
		self:sleep(0.9)		                 		             
                FadeToColor( 0, 0, 0, 0, 0, 255 , 255, 255, 255,0, 0.3 )		    
		while(GetFadeCompletion() < 1) do					 
			Yield()							    
		end	
		SoundPauseAll()							 
		FadeToColor( 255 , 255, 255, 255, 0, 0 , 0, 0, 255,0, 0.1 )	       	  
		while(GetFadeCompletion() < 1) do
		       Yield()
		end		
		LoadAnim(self.playerDart,'Anims/DartNew/DartIdle01.jan',0.0,0,1)	    
		MainMenuProcessSelection(self.currentDoor)	              
		PauseMenuControlHandler(0)	   
		Global.player:setNewAction('Stand') 		         	         			    
		SoundResumeAll()
		self:setState(nil)		             
	end
	--*************************************************************************************************
	function Ob:DoorCameraHint()
	    -- run the camera closer to raz
		-- SetCameraTargetHeight(self.kCLOSE_CAMERA_HEIGHT+200) 
	    --SetChaseCameraRadius(self.kCLOSE_CAMERA_RADIUS-280)
		
	    --self:setState(nil)				         
		
	end
	--*************************************************************************************************
	function Ob:UndoDoorCameraHint()
	    -- run the camera closer to raz
		--SetChaseCameraRadius(self.kCLOSE_CAMERA_RADIUS)
	    --SetCameraTargetHeight(self.kCLOSE_CAMERA_HEIGHT)
	    
	    --self:setState(nil)
		
	end

	--*************************************************************************************************
	function Ob:stateCameraHint()
	    -- run the camera closer to raz
	    --SetChaseCameraRadius(self.kCLOSE_CAMERA_RADIUS)
	    --SetCameraTargetHeight(self.kCLOSE_CAMERA_HEIGHT)
		SetChaseCameraAltitude(55)
	    self:setState(nil)
		
	end
	--*************************************************************************************************
	function Ob:stateUndoCameraHint()
	    -- run the camera closer to raz
	    --SetChaseCameraRadius(self.kFAR_CAMERA_RADIUS)
	    --SetCameraTargetHeight( self.kFAR_CAMERA_HEIGHT)  
	    SetChaseCameraAltitude(14)  	
	    self:setState(nil)
	end

	--*************************************************************************************************
	function Ob:onCurrentDoorClosed(iItem)
		local r,g,b =    240, 192, 0
		if(iItem ==2) then
		      r,g,b = 0,240, 96
		elseif(iItem == 3) then
			r,g,b = 82, 240, 0
		end
		--AdjustColor3(self.DoorText[iItem],r,g,b,255)
              	       
		
	end
	--*************************************************************************************************
	function Ob:onItemSelected(iItem)
		self:setState('JumpToDoor')
		--self.currentDoor		      
		
		
	end
	--*************************************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if (self.bDiableTriggers == 1) then
			--GamePrint('diableTrigger')
		elseif ( self.state_name == 'JumpToDoor') then
			--GamePrint('here')
		elseif (data == 'tv_doorarea') then			   	       
			self:setState('CameraHint')
		elseif (data == 'tv_door1') then
			-- alpha up the light ray
		    local fAlpha = GetEntityAlpha(self.DoorJamLight[1])
		    if (fAlpha < self.kMAXOPACITY) then
				local fInterp = self.kMAXOPACITY-fAlpha
				SetEntityAlpha(self.DoorJamLight[1], self.kMAXOPACITY, self.kFADETIME *fInterp)
				SetEntityAlpha(self.DoorRimLight[1], 1, self.kFADETIME *fInterp)

				
		    end
		    
		    self.currentDoor = 4
		    DrawMainMenuText(4)
		    --AdjustColor3(self.DoorText[4],255,255,255,0)
		    self:DoorCameraHint()
		    self:setState('CrackDoor')
		    PlaySound(nil,self.TextUp)
			
		elseif (data == 'tv_door2' and  self.bProfileExist == 1 ) then
			
		    local fAlpha = GetEntityAlpha(self.DoorJamLight[2])
		    if (fAlpha < self.kMAXOPACITY) then
				local fInterp = self.kMAXOPACITY-fAlpha
				SetEntityAlpha(self.DoorJamLight[2], self.kMAXOPACITY, self.kFADETIME *fInterp)
				SetEntityAlpha(self.DoorRimLight[2], 1, self.kFADETIME *fInterp)

		    end

		    self.currentDoor = 3
		    self:DoorCameraHint()		 
		    DrawMainMenuText(3)
		    --AdjustColor3(self.DoorText[3],82, 240, 0,0)		   
		    PlaySound(nil,self.TextUp)
		    self:setState('CrackDoor')

		elseif (data == 'tv_door3' and self.bProfileExist ==1) then
		    local fAlpha = GetEntityAlpha(self.DoorJamLight[3])
		    if (fAlpha < self.kMAXOPACITY) then
				local fInterp = self.kMAXOPACITY-fAlpha
				SetEntityAlpha(self.DoorJamLight[3], self.kMAXOPACITY, self.kFADETIME *fInterp)
				SetEntityAlpha(self.DoorRimLight[3], 1, self.kFADETIME *fInterp)

		    end
								 
		    self.currentDoor = 2		 
		    self:DoorCameraHint()
		    DrawMainMenuText(2)					        
		    PlaySound(nil,self.TextUp)
		    --AdjustColor3(self.DoorText[2],0,240, 96,0)
		    self:setState('CrackDoor')

		elseif (data == 'tv_door4') then
			local fAlpha = GetEntityAlpha(self.DoorJamLight[4])
		    if (fAlpha < self.kMAXOPACITY) then
				local fInterp = self.kMAXOPACITY-fAlpha
				SetEntityAlpha(self.DoorJamLight[4], self.kMAXOPACITY, self.kFADETIME *fInterp)
				SetEntityAlpha(self.DoorRimLight[4], 1, self.kFADETIME *fInterp)

		    end	 

		    self.currentDoor =1
		    self:DoorCameraHint()
		    DrawMainMenuText(1)			      
		    PlaySound(nil,self.TextUp)
		    --AdjustColor3(self.DoorText[1],240, 192, 0,0)
		    self:setState('CrackDoor')

		end						      
	end

	--*************************************************************************************************
	
	function Ob:onExitedTriggerVolume(data,from)
		if (self.bDiableTriggers == 1) then
			--GamePrint('diableTrigger')
		elseif ( self.state_name == 'JumpToDoor') then
			--GamePrint('here')
		elseif (data == 'tv_doorarea') then
			self:setState('UndoCameraHint')
		elseif (data == 'tv_door1') then
			SetEntityAlpha(self.DoorJamLight[1], 0, self.kFADETIME)
			SetEntityAlpha(self.DoorRimLight[1], 0, self.kFADETIME)

			HideMainMenuText(4)
			self:UndoDoorCameraHint()
			self:setState('CloseCrackedDoor')
											        
		elseif (data == 'tv_door2'and self.bProfileExist ==1) then
	                SetEntityAlpha(self.DoorJamLight[2], 0, self.kFADETIME)		
			SetEntityAlpha(self.DoorRimLight[2], 0, self.kFADETIME)
			HideMainMenuText(3)													  
			self:UndoDoorCameraHint()						    
			self:setState('CloseCrackedDoor')
		elseif (data == 'tv_door3'and self.bProfileExist ==1) then
			SetEntityAlpha(self.DoorJamLight[3], 0, self.kFADETIME)	
			SetEntityAlpha(self.DoorRimLight[3], 0, self.kFADETIME)		  
			HideMainMenuText(2)       
			self:UndoDoorCameraHint()
			self:setState('CloseCrackedDoor')
		elseif (data == 'tv_door4') then
			SetEntityAlpha(self.DoorJamLight[4], 0, self.kFADETIME)	 
			SetEntityAlpha(self.DoorRimLight[4], 0, self.kFADETIME)       
			HideMainMenuText(1)
			self:UndoDoorCameraHint()
			self:setState('CloseCrackedDoor')       
		end
	end

	--*************************************************************************************************
	return Ob					   
end
