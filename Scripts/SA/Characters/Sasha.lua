function Sasha(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/Sasha.plb' -- Editable
		Ob.animsDir = 'Sasha'
		Ob.charName = 'Sasha_sayline'
		Ob.height = 200
		Ob.initialState = nil
		Ob.lampsShot = 0
--		Ob.face3CSTV = 'tv_grav_5'
		Ob.TIMER_TUTORIAL = '4001'
		Ob.TIMER_BRUSH = '4002'
		Ob.TUTORIAL_TIME = 12000
		Ob.BRUSH_TIME = 15000
		
		Ob.Telekinesis = TKBEHAVIOR_THRASH
		Ob.TK_YOffset = 120
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Sasha.tga'
		
		Ob.animsTable = {
					idle = {fileName = 'SashaPoseA', preload = 1, loop = 1},
					brush = {fileName = 'Sasha_idle1', preload = 1, next = 'idle', loop = 0},
					open = {fileName = 'Portal_open', preload = 1, blendTime = 0.0},
					close = {fileName = 'Portal_close', preload = 1},
					portalTalk = {fileName = 'Portal_talk', preload = 1},
					Flinch = {fileName = 'sasha_psiblast_reaction', preload = 1},
					TK = {fileName = 'sashatk', preload = 1, loop = 1},
					Confusion = {fileName = 'sasha_psi_confusion', preload = 1},
					Talk = {fileName = 'sasha_talk', preload = 1, loop = 1},
					Gesture1 = {fileName = 'SashaGesture1', preload = 1, loop = 0, next = 'idle'},
					Gesture2 = {fileName = 'SashaGesture2', preload = 1, loop = 0, next = 'idle'},
					Gesture3 = {fileName = 'SashaGesture3', preload = 1, loop = 0, next = 'idle'},
		}
		
		Ob.tPsiReactTable = { 	
						Squash = {animToPlay = 'Flinch', lineCode="/SASS010SA/"},--DIALOG=<<Ow!>>
						PsiBlast = {animToPlay = 'Flinch', lineCode="/SASS010SA/" },--DIALOG=<<Ow!>>
						NewMoveMelee = {animToPlay = 'Flinch', lineCode="/SASS010SA/"},--DIALOG=<<Ow!>>
						
						Confusion = {animToPlay = 'Confusion', lineCode="/SASS007SA/"},--DIALOG=<<Enough!>>
						TKPickup = {animToPlay = 'TK', lineCode="/SASS007SA/" },--DIALOG=<<Enough!>>
						TKRelease = {animToPlay = 'idle'},
						
						FireStart = {lineCode = "/SASS007SA/" },--DIALOG=<<Enough!>>
		}							
	end
	
	
	
	
	--Start playing all the dialog just like in the old days:
	--		self.CRH:chatterStart()
	--Start a group chatter.  This will randomly pick one of the three groups (a,b or c) and then run through all its 
	--associated lines of dialog before stopping.
	--		self.CRH:chatterStart(1)
	
-- *************************************************************************************************************	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		self:setAnim(self.animsTable.idle)

		SetEntityFlag(self, ENTITY_STENCIL_RECEIVER, 1)
		SetMeshProperty(self, kMESH_SORT_END, 1)
		if (GetCurrentLevelName() == 'SACU') then
			self.doorOuter = SpawnScript('Global.Props.Geometry', 'SashaDoorOuter', 'self.meshName = \'Levels/SA_SashasBrain/Props/SA_PortalExterior.plb\' self.bCollidee = 0 self.bForceSimulate = 1', 1)
			self.doorInner = SpawnScript('Global.Props.Geometry', 'SashaDoorInner', 'self.meshName = \'Levels/SA_SashasBrain/Props/SA_PortalInterior.plb\' self.bCollidee = 0 self.bForceSimulate = 1', 1)
			SetEntityFlag(self.doorOuter, ENTITY_STENCIL_CASTER, 1)
			SetMeshProperty(self.doorOuter, kMESH_SORT_END, 1)
			SetEntityFlag(self.doorInner, ENTITY_STENCIL_RECEIVER, 1)
			SetMeshProperty(self.doorInner, kMESH_SORT_END, 1)
			self.doorOuter:makeInvisible()
			self.doorInner:makeInvisible()
		end

		SetMeshIsBackwards(self, 1)
		SetEntityLookOffsetPos(self, 0, 250, 0)
		SetEntityCollideSphere(self, 50, 0,50,0, 0)	-- legs and feet
		SetEntityCollideSphere(self, 50, 0,150,0, 1)	-- torso
		SetEntityCollideSphere(self, 30, 0,230,0, 2)	-- head
		SetPhysicsFlag(self, PHYSICS_ORIENTTOGRAVITY, 1)
		SetPhysicsFlag(self,PHYSICS_CHECKTRIGGERS,1)
		
		-- this trigger vol isnt used so I'm commenting out the register code
--		local triggerHandle = TriggerOBB_Lookup(nil, self.face3CSTV)
--		if (triggerHandle) then
--			RegisterTriggerVolume(self, self.face3CSTV)
--		end
        self.lampPedal = FindScriptObject('LampPedal', 1)
		self:createTimer(self.BRUSH_TIME, self.TIMER_BRUSH)

	  	self.rantTable = {
						{line = "/SASS001SA/", },	--DIALOG=<<Ahhhhh!>>
						{line = "/SASS002SA/", },	--DIALOG=<<Ach!>>
						{line = "/SASS003SA/", },	--DIALOG=<<Ai-ai-ai-ai-ai!>>
						{line = "/SASS004SA/", },	--DIALOG=<<Razputin!>>
						{line = "/SASS005SA/", },	--DIALOG=<<Oooh-ooh-oooh...>>
						{line = "/SASS006SA/", },	--DIALOG=<<Peel me off and put me down!>>
						{line = "/SASS007SA/", },	--DIALOG=<<Enough!>>
						{line = "/SASS008SA/", },	--DIALOG=<<Oof!>>
						{line = "/SASS009SA/", },	--DIALOG=<<Uggg!>>
						{line = "/SASS010SA/", },	--DIALOG=<<Ow!>>
						{line = "/SASS011SA/", },	--DIALOG=<<Gahhhh!>>
		}
		self.CRH=SpawnScript('Global.Util.CharResponseHandler','','',0)
		self.CRH.owner=self
		self.CRH.type=self.CRH_SEQUENTIAL_THEN_RANDOM
		self.CRH:addDialog(self.rantTable,nil,nil,nil,nil,nil,1)
		self.CRH.defaultMinPause=4
		self.CRH.defaultMaxPause=10
		
		
		self.stampedTable = {
						{line = "/SAAG000SA/", maxPlays=-1, filterCode='phase1', },	--DIALOG=<<Enough horseplay Razputin! Destroy him!>>
						{line = "/SAAG001SA/", maxPlays=-1, filterCode='phase1', },	--DIALOG=<<The small censors are feeding into his strength. You must stop them!>>
						{line = "/SAAG002SA/", maxPlays=-1, filterCode='phase1', },	--DIALOG=<<Destroy the valves that are emitting the small censors, Razputin!>>
						{line = "/SAAG003SA/", maxPlays=-1, filterCode='phase1', },	--DIALOG=<<Raz! Shoot the valves! It\'s no use shooting the monster until you\'ve destroyed every valve!>>
						{line = "/SAAG004SA/", maxPlays=-1, filterCode='phase1', preCallBack='LockOnReminder'},	--DIALOG=<<Don\'t forget to use your mental focus to lock on the valves as a target, and then blast them!>>
						{line = "/SAAG006SA/", maxPlays=1, filterCode='phase1', },	--DIALOG=<<Say, Razputin. Do you think you could reach in my pocket and hand me my cigarettes? >>
						{line = "/SAAG007SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Excellent! You\'ve shut down the valves so he cannot be rejuvenated. Now destroy him!>>
						{line = "/SAAG008SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Use your mental focus Razputin! It will help you shoot accurately, and also help you with your evasive maneuvers!>>
						{line = "/SAAG009SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<When focused, you can tumble to the side, avoid his stamp, and circle around behind the monster!>>
						{line = "/SAAG010SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Watch out for those tumbling boils he\'s throwing at you. They\'re full of censors!>>
						{line = "/SAAG011SA/", maxPlays=-1, filterCode='phase2',preCallBack='PalmBombReminder' },	--DIALOG=<<You can kill many small censors in one blow, if you jump up in the air above them and then smash the ground with your psychic fist.>>
						{line = "/SAAG013SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Oh, you. What a pleasant surprise.>>
						{line = "/SAAG014SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Enough, Razputin! The beast must die, now!>>
						{line = "/SAAG015SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<If you are mentally focused, and executing a sideways tumble, it will be very hard for him to stamp you.>>
						{line = "/SAAG016SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Razputin, if you could finish this off soon, I might get out of it with only a mild concussion.>>
						{line = "/SAAG017SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<What? Who\'s there? I think I\'ve lost my vision!>>
						{line = "/SAAG018SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Why no, Aunt Bernie, of course I didn\'t get your phone calls or else I would have responded right away. >>
						{line = "/SAAG019SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<My name is Yan Yanssen, I live in Wisconsin, I work in the lumber yard there...>>
						{line = "/SAAG020SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<La di da... do do da dum...>>
						{line = "/SAAG021SA/", maxPlays=-1, filterCode='phase2', },	--DIALOG=<<Wow. Okay, that last hit brought me back. Where was I?>>
		}
		self.stampedCRH=SpawnScript('Global.Util.CharResponseHandler','','',0)
		self.stampedCRH.owner=self
		self.stampedCRH.bLinePriority = 1
		self.stampedCRH.type=self.stampedCRH.ALWAYS_SEQUENTIAL
		self.stampedCRH:addDialog(self.stampedTable)
		self.stampedCRH:setFilter('phase1')

		--so he faces the lamps
		self:setOrientation(180,-40,-90)

		--edit removed to keep from being invisible during tutorial too
		--[[if (Global:load('CALevelState', 'CA') == 7) then
			self:makeInvisible()
		end]]
	end

	function Ob:onLockOnReminder()
		PrintMessage("/SAZE004TO/")  --DIALOG=<<Use /LeftFlipper/ to lock mental focus.>>
	end
	
	function Ob:onPalmBombReminder()
		PrintMessage("/SAZE005TO/") --DIALOG=<<Press /XButton/ while airborne to execute a Palm Bomb>>
	end
								  

	function Ob:doorCleanup()
		self.doorOuter:makeInvisible()
		self.doorInner:makeInvisible()
		self:makeInvisible()
		
		SetPhysicsFlag(self, PHYSICS_ORIENTTOGRAVITY, 1)
	end
	
-- *************************************************************************************************************	

	function Ob:doorSetup(loc)
       	SetVelocity(self, 0, 0, 0)
       	SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)

       	if (not loc) then
       		loc = self
       	else
	       	self:setPosition(loc:getPosition())
       		self:setOrientation(loc:getOrientation())
       	end
       	
       	self.doorOuter:setPosition(loc:getPosition())
       	self.doorOuter:setOrientation(loc:getOrientation())
       	
       	self.doorInner:setPosition(loc:getPosition())
       	self.doorInner:setOrientation(loc:getOrientation())
	end

-- *************************************************************************************************************
	function Ob:beginStateEmergeFromDoor()
		self:killTimer(self.TIMER_BRUSH)
		
		self.doorOuter:makeVisible()
		self.doorInner:makeVisible()
		
       	self:makeVisible()
	end
		
	function Ob:stateEmergeFromDoor()
		self.doorOuter:loadAnim('Anims/SA_SashaBrain/PortalDoor_open.jan', 0.1, 0)
		self.doorInner:loadAnim('Anims/SA_SashaBrain/PortalDoor_open.jan', 0.1, 0)
		
		self:playAnimBlocking(self.animsTable.open)
		
		self:setAnim(self.animsTable.portalTalk)
		
		self:setState(nil)
	end
	
-- *************************************************************************************************************
	
	function Ob:stateCloseDoor()
		self.doorOuter:loadAnim('Anims/SA_SashaBrain/PortalDoor_close.jan', 0.1, 0)
		self.doorInner:loadAnim('Anims/SA_SashaBrain/PortalDoor_close.jan', 0.1, 0)
		
		self:playAnimBlocking(self.animsTable.close)
		
		self:doorCleanup()
		
		--SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 1)
		--self:createTimer(self.BRUSH_TIME, self.TIMER_BRUSH)
		
		self:setState(nil)
	end
	
	
-- *************************************************************************************************************
	function Ob:onItem(data, from)
		-- Dialog Domain SAFG
		if (Global.levelScript.bplayedSAFB2 == 1) then
			self:sayLine("/SAFB014SA/",0, 1, nil, 1, nil, 1) --DIALOG=<<It was just a thought I was having. And it's not dead. It has just returned to its basic form-raw psychic energy, or PSI Mist. Go absorb it. It's good for your mental health.>>
		else
			self:sayLine("/SAFG001SA/",0, 1, nil, 1, nil, 1) --DIALOG=<<Destroy those Tiffany monstrosities!>>
		end
	end
-- *************************************************************************************************************
	
	--WARNING!!!! DO NOT MESS WITH THIS CODE, THE TIMING IS VERY FRAGILE!
	function Ob:onLampDestroyed(data, from)
		self.mutex = 1
		self.curNumShot = from.num
		self.lampsShot = self.lampsShot + 1
		self:setState('LampDestroyed')
	end

	function Ob:onLampMeleed(data, from)
		Global.cutsceneScript:runCutscene('LampBlastFail')
	end
	
	function Ob:onLampNotZLocked(data, from)
		Global.cutsceneScript:runCutscene('ZLockFail')
	end
	
	--WARNING!!!! DO NOT MESS WITH THIS CODE, THE TIMING IS VERY FRAGILE!
	function Ob:stateLampDestroyed()
		if self.lampsShot < 3 then -- stage 1: shoot lamps at random
			-- Dialog Domain SAFH
			self:sayLine("/SAFH002SA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<Well done Raz. Keep shooting!>>
		elseif self.lampsShot == 3 then
			Global.cutsceneScript:runCutscene('SAIN2', 0)
			self:createTimer(self.TUTORIAL_TIME, self.TIMER_TUTORIAL)
			self:displayUIHelp()
			-- turn off the zlockable-ness for lamp 1
			local lamp = FindScriptObject('Lamp1')
			SetEntityFlag(lamp, ENTITY_ZLOCK, 0)
		else
			if (self.lampZLocked ~= 1) then
				Global.cutsceneScript:runCutscene('ZLockFail', 1, nil,nil, 1)
				local lamp = FindScriptObject('Lamp1')
				SetEntityFlag(lamp, ENTITY_ZLOCK, 0)
			elseif self.lampsShot == 6 then						   
				self:killTimer(self.TIMER_TUTORIAL)
				Global.cutsceneScript:runCutscene('SAFB1', 0, 0, 1, 1)
				self:setState(nil)
				return
			else
				if self.curNumShot == self.lampsShot - 3 then
					self:sayLine("/SAFH003SA/", 1, 1, nil, 1, nil, 1) --DIALOG=<<Good.  Again!>>
				else
					self.lampsShot = 3
					Global.cutsceneScript:runCutscene('DudeSeriouslyShootLampsInOrder', 1,nil,nil,1)
				end
			end
		end
		self:setState(nil)
		self.mutex = 0
	end
	
--[[
	function Ob:stateE3DemoTutorialEnd()
		self:killTimer(self.TIMER_BRUSH)
		self:killTimer(self.TIMER_TUTORIAL)
		
		local i = 1
		local lamp = FindScriptObject('Lamp'..i)
		while lamp do
			lamp:killSelf()
			i = i + 1
			lamp = FindScriptObject('Lamp'..i)
		end
		
		Global.cutsceneScript:runCutscene('E3TutorialEndCutscene1', 1)
		Global.cutsceneScript:runCutscene('E3TutorialEndCutscene2', 1,0)
		self:setState(nil)
	end
]]--
	
-- *************************************************************************************************************
	function Ob:onTimer(id)
		if id == self.TIMER_TUTORIAL then
			self:displayUIHelp()
 		elseif id == self.TIMER_BRUSH  and self.flattened ~= 1 and self.bSBHidden ~= 1 then
			self:setAnim(self.animsTable.brush)
		else
			%Ob.Parent.onTimer(self, id)
		end
	end
-- *************************************************************************************************************    
	function Ob:displayUIHelp()
		if (Global.cutsceneScript.cutscenePlaying ~= 1) then
			if self.lampsShot >= 3 then
				PrintMessage("/SAZE000TO/", 0)--DIALOG=<<Press /Joystick/ while holding /LeftFlipper/ to switch targets.>>
			else
				if self.whichMessage == 1 then
					self.whichMessage = 0
					-- forcefully map the right trigger to psi blast when we print this message
					Global.player:mapPowerToButton(kPOWER_PSIBLAST, kQUICKPICK_TRIGR)
					PrintMessage("/SAZE001TO/", 0)--DIALOG=<<Press /RightFlipper/ to shoot.>>
				else
					self.whichMessage = 1
					PrintMessage("/SAZE006TO/", 0)--DIALOG=<<Hold /LeftFlipper/ to lock on to a target.>>
				end
			end
		end
	end
-- *************************************************************************************************************	
	function Ob:stateFakeDialog()
		-- Dialog Domain SAFI
		self:sayLine("/SAFI004SA/",1, 1, nil, 1, nil, 1) --DIALOG=<<Razputin! you must blast the locks off the emergency shut-down valves!>>
		self:sayLine("/SAFI005SA/",1, 1, nil, 1, nil, 1) --DIALOG=<<It's the only way to close off the leak!>>
		self:sayLine("/SAFI006SA/",1, 1, nil, 1, nil, 1) --DIALOG=<<Shut down all the valves on this face to get it under comtrol!>>
		self:sayLine("/SAFI007SA/",1, 1, nil, 1, nil, 1) --DIALOG=<<Hurry, Razputin!>>
		self:setState(nil)
	end
-- *************************************************************************************************************

	function Ob:RemoveOrientToGravityFlag()
		SetPhysicsFlag(self, PHYSICS_ORIENTTOGRAVITY, 0)
	end
	
	function Ob:onTKPickup(data, from)
		%Ob.Parent.onTKPickup(self, data, from)
		self:killTimer(self.TIMER_BRUSH)
	end
	
	function Ob:onTKRelease(data, from)
		%Ob.Parent.onTKRelease(self, data, from)
		self:createTimer(self.BRUSH_TIME, self.TIMER_BRUSH)
	end
	
	return Ob
end

