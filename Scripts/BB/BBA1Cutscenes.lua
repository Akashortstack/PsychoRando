
function BBA1Cutscenes(Ob)
	if not Ob then
		Ob = CreateObject('Global.Camera.CutsceneScript')
		Ob.dependencies = {
			scripts = { 'BB.Effects.MortarExplosion' },
--			meshes = {  },
--			textures = {  },	
		}
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.elton = FindScriptObject('Elton')
		self.coach = FindScriptObject('Coach')
		self.explosions = FindScriptObject('ExplosionManager')
		self.tutorial = FindScriptObject('Tutorial')
		self.projector = FindScriptObject('Projector')
		self.projectorLight = FindScriptObject('projectorlight')
	end

	function Ob:stateBBIntroContinued()
		-- fade out
		self:fadeToBlack(0)
        
		-- set up references
		local explosion = SpawnScript('BB.Effects.MortarExplosion', 'EltonExplosion', '')
		self.explosions = FindScriptObject('ExplosionManager')
		self.tutorial = FindScriptObject('Tutorial')
		self.elton:setEntityInterestLevel(0)
		
        -- disable banter
		self:sendMessage(self.tutorial, 'BanterOff', '')
		
		-- turn on coach projection
		self.tutorial:setPropagandaTexture(1)
		
		-- disable explosions for this cutscene
		self.explosions:turnOff()
		
		self.explosionSound = LoadSound('LandMines')
        
		-- swap the office domain
		DomainSleep('officeDOMAIN', 1)
		DomainSleep('boatDOMAIN', 0)
		Global.levelScript.boatback:makeVisible()
        -- reposition elton so that he is not in the wall
        self.elton:setPosition(-16140, -2385.4, 13098.8)
		self.elton:setOrientation(0, 140.6, 0)
		-- turn off the projector
		local projector = FindScriptObject('Projector')
		projector:stop()
		projector:killSelf()
		-- ambient sound
		StopSound(Global.levelScript.officeAmbSound)
		PlaySound(nil, Global.levelScript.ambSound, 1)
		--create plane sound timer
		Global.levelScript:createTimer(20000, Global.levelScript.PLANESOUND_TIMER)
		Global.levelScript.domainOffice = 1
        
		-- set player position
		Global.player:setPosition(-15328.7, -2166.2, 12473.7)
		SnapEntityToGround(Global.player)
		Global.player:setOrientation(0, -174.2, 0)
		LoadAnim(Global.player, 'Anims/DartNew/DartIdle02.jan')
		
		self:fadeIn(0.1)
		
        -- cut to elton
		LoadAnim(Global.player, 'Anims/DartNew/Listen.jan')
        self:cutTo(-15855,-2223,13050, -18,77,0) 
		self:camPathTo(-15632,-2252,12608, -1,-25,0, nil, 5, .4, 1.4)
		self.elton:setState(nil) -- necessary in case the player has just activated elton, and he's in stateActivate.  Tricksy bugses.
		self.elton:setAnim(self.elton.animsTable.run)
		self.elton:sayLine("/BBAD034EF/", 1, 1, nil, 1) --DIALOG=<<Charrrrrrrrgggg->>
		self:sleep(.1)
        
		-- elton explodes
		self.elton:explode()
		LoadAnim(Global.player, 'Anims/DartNew/Listen.jan')
		self:sleep(.5)
		self.coach:sayLine("/BBAD036CO/", 1, 1) --DIALOG=<<HAHAHAHA.>>
		
		-- cut to raz
		self:cutTo(-15256,-2258,12264, -8,150,0)
		self:camPathTo(-15273,-2263,12293, -8,150,0, nil, 5, .5, .5)
        LoadBlendAnim(Global.player, 'anims/dartnew/generalfacial/scared_.pba', 0, 0, 0.3)
		self:sleep(1)
		StopAllBlendAnims(Global.player, .1) 
        Global.player.bHasCustomBabble = 1
		LoadAnim(Global.player, 'Anims/DartNew/BBAD037RA.jan', .1, .2)
        Global.player:sayLine("/BBAD037RA/", 1, 1) --DIALOG=<<What kind of obstacle course is this? That kid just got killed!>>
		Global.player.bHasCustomBabble = 0
		LoadAnim(Global.player, 'Anims/DartNew/Listen.jan')
		
        -- cut and pan to coach
		self:cutTo(-15260,-2255,12585, 0,13,0)
		self:camPathTo(-15265,-2255,12563, 0,13,0, nil, 5, .5, .5, 0)
		self.coach:sayLine("/BBAD038CO/", 1, 1) --DIALOG=<<A MENTAL obstacle course, you bleeding heart!>>
		self:sleep(.5)
		
		-- cut and campath
		self:cutTo(-15374,-2205,12140, 8,-16,0)
		self:camPathTo(-15259,-2146,11739, 8,-16,0, nil, 12, 1, 1, 0)
		self.coach:sayLine("/BBAD039CO/", 1, 1) --DIALOG=<<He\'s not dead. His astral projection just got kicked out of my mind.>>
		self.coach:sayLine("/BBAD040CO/", 1, 1) --DIALOG=<<And I\'ll kick your ass-tral projection outta here too, if you don\'t get moving right now!>>
		self:sleep(.5)
		
		-- ending shot
		self:cutTo(-16032,-2041,12732, -7,-51,0)
		
		self:setState('CleanupCSBBIntroContinued')
	end
	
	-- the cleanup state
	function Ob:stateCleanupCSBBIntroContinued()
		self.elton:setEntityInterestLevel(kPERSON_INTEREST)
		self.elton:killSelf()
		Global.player:setPosition(-15328.7, -2366.2, 12473.7)
		Global.player:setOrientation(0, -174.2, 0)
		self:fadeIn(0)
		
		-- enable explosions again
		self.explosions:turnOn()
		
		-- turn off coach screen
		self.tutorial:setPropagandaTexture()
		
		-- enable banter
		self:sendMessage(self.tutorial, 'BanterOn', '')
		
		-- swap the office with the boat
		if (Global.levelScript.domainOffice ~= 1) then
			Global.levelScript:swapOffice()
		end
		
		
		-- ending shot
		self:cutTo(-16032,-2041,12732, -7,-51,0)
		
		self:endCutscene()
	end
	
--**************************************************************************************************
	
	-- Here begins a horribly unwieldy hack pair of cutscenes, one before dialog tree, one after.
	-- It was faster than bringing this up to date to use our cool new shit.
	function Ob:stateDogenIntro()
		-- fade out
		self:fadeToBlack(0)
		
		-- set up references
		self.dogen = FindScriptObject('dogen') or FindScriptObject('Dogen')
		self.explosions = FindScriptObject('ExplosionManager')
        self.coach = FindScriptObject('Coach')
		
		-- disable explosions for this cutscene
		self.explosions:turnOff()
		
        -- make coach shut up
		self.coach:shutUp()
		self.tutorial:shutUp()
        
		-- set player position
		Global.player:setPosition(7053, 5104, 8507)
		Global.player:setOrientation(0, 32, 0)
		Global.player:setVelocity(0, 0, 0)
		LoadAnim(Global.player, 'Anims/DartNew/Listen.jan')
		
		self:fadeIn(0.25)
		
		-- cut to raz
		self:cutTo(7049,5215,8713, -12,-12,0)
		Global.player:sayLine("/BBBI600RA/", 1, 1) --DIALOG=<<Hey, Dogen. What's wrong?>>
		
		-- cut to dogen
		self:cutTo(6935,5215,8652, -14,-88,0)
		self:camPathTo(6811,5250,8753, -4,-66,0, nil, 2, .2, .1, 0)
		self.dogen:sayLine("/BBBI601DO/", 1, 1) --DIALOG=<<I keep blowing up.>>
			
		-- must set the cleanup state
		self:setState('CleanupCSDogenIntro')
	end
	
	function Ob:stateCleanupCSDogenIntro()
		self:endCutscene()
		Global.player:doNothing()
		self:dontRunPlayerControls(1)
		Global.player:setNewAction('Stand')
		Global.player:setVelocity(0,0,0)
		self:setState('DialogChoice')
	end

    function Ob:stateDialogChoice()
		self:dontRunPlayerControls(0)
		SetCamera(kCAMERA_SCRIPT)
		self.dogen.selection = DialogChoiceBubble(self.dogen.tChoices, 1, 1) 
		Global.cutsceneScript:runCutscene('DogenResponse')
	end

	function Ob:stateDogenResponse()
		self.coach = FindScriptObject('Coach')
		
        -- make coach shut up
		self.coach:shutUp()
		
		-- cut to raz
		self:cutTo(7049,5215,8713, -12,-12,0)
		Global.player:sayLine(self.dogen.tDialog[self.dogen.selection], 1, 1)
		
		-- cut to dogen
		self:cutTo(6935,5215,8652, -14,-88,0)
		self.dogen:setAnim(self.dogen.animsTable.idle1, nil, 1)
		self.dogen:sayLine("/bbbi120do/", 1, 1) --DIALOG=<<Mmm-kay.>>
		self:setState('CleanupCSDogenResponse')
	end

	function Ob:stateCleanupCSDogenResponse()
		self:fadeToBlack(0)
		Global.player:setPosition(7053, 5104, 8507)
		Global.player:setOrientation(0, 32, 0)
		-- enable explosions again
		self.explosions:turnOn()
        
		self:endCutscene()
		self.dogen:setState('PostIntro')
	end

	function Ob:statePostBBLI()
		Global.player:setPosition(-2826.2, -1737.6, 6785)
		Global.player:setOrientation(0, 108.6, 0)
		SetCameraPosition(-3201,-1490,6885)
		SetCameraOrientation(-14,-75,0)
		LoadAnim(Global.player, 'Anims/DartNew/LandAfterBBLI.jan', 0, 0)
		self:sleep(2)
		self:setState('CleanupCSPostBBLI')
	end

	
	function Ob:stateCleanupCSPostBBLI()
		self:endCutscene()
	end
	
--**************************************************************************************************

	function Ob:stateExitPlane()
		Global.player:loadAnim('anims/dartnew/skydive.jan', 0.3, 1)
		self:camPathTo(13842,5822,11322, -58,164,0, nil, 0.5,0.25,0.25, 1)
		self:fadeToBlack(2,1)
		self:endCutscene(1)
		Global.levelScript:loadNewLevel(Global.levelScript.nextLevel,0,1)
 	end

--  F O R  T H E  I N T R O  C U T S C E N *******************************************
	
	function Ob:setUpIntro()
		-- disable explosions for this cutscene
		self.explosions:turnOff()
		
		-- turn off elton's interest
		self.elton:setEntityInterestLevel(0)
		
        -- disable banter
		self:sendMessage(self.tutorial, 'BanterOff', '')
		
		-- turn on coach projection
		self.tutorial:setPropagandaTexture(1)
		
		self.projector:stop()
	end
	
--**************************************************************************************************
	
	function Ob:turnOnProjector()
		self.projectorLight:makeVisible()
        self.projector:start() 
	end
	
--**************************************************************************************************
	
	function Ob:cleanupIntro()
		self.projector:start() 
        -- fake a message to tutorial
		Global.player:sendMessage(self.tutorial, 'CrossedTriggerPlane', 'fake_Office')
		self.projectorLight:makeVisible()
		-- set up elton
		self.elton:setEntityInterestLevel(kPERSON_INTEREST)
		-- disable explosions for this cutscene
		self.explosions:turnOn()
	end

	function Ob:stateCleanupCSBBA1Introduction()
		self:endCutscene()
		-- indicate that the cutscene is over with instruction
		PrintMessage("/BBZE013TO/")--DIALOG=<<Press /xbutton/ to punch Coach>>
	end

--**************************************************************************************************

	--edit Removed to Stop player from teleporting after collecting steamertrunk in BB
	--[[function Ob:stateCleanupCSEmoBagCollection()
		SetCameraFieldOfView(self.fov)

		-- end psychedelic effect
		SetPsychedelicAlpha(0)
		SetEntityFlag(self.emoBag, ENTITY_POST_EFFECTS, 0)
		SetEntityFlag(self.emoTag, ENTITY_POST_EFFECTS, 0)
		SetMotionBlurState(kMOTIONBLURSTATE_NONE, 0)

		-- remove ambient lights
		SetEntityAmbientLight(self.emoBag, 0, 0, 0)
		SetEntityAmbientLight(self.emoTag, 0, 0, 0)

		self.emoTag:makeInvisible()
		StopSound(self.rBaggageMusic)
		SoundUnmuteCategory(kSOUNDCAT_ALL)
		SoundResumeCategory(kSOUNDCAT_MUSIC)
		
		if (self.emoBag.sBaggageType == 'steamertrunk') then
			self:placeChar(Global.player, -7723.7, -2453.2, 8037.8, 0.0, 88.9, 0.0)
		end
		
		self:endCutscene(1)
		MoveCameraToIdeal()
		self:fadeIn(0.5)
	end]]

--**************************************************************************************************
	
	return Ob
end

