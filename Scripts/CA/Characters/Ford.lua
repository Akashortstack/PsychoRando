function Ford(Ob)
	function construct()
		local Ob = CreateObject('Global.Characters.ActionActor')
		Ob.dependencies = {
			scripts = { 'CA.Props.TutorialFireProp',
						'CA.Props.TutorialFirePropCar',
						'CA.Characters.TutorialCensor',
						'CA.Props.TutorialTKHoop',
						'CA.Props.TutorialTKProp',
						'Global.Props.Geometry',
						'Global.Props.InstaHintFordItem',
						'Locator',
						'CA.Props.FordTutorials',
						'Global.Util.CharResponseHandler', },
			meshes = {	'Levels/CA_Campgrounds/Props/Tent.plb',
						'Levels/CA_Campgrounds/Props/LionToy.plb',
						'Levels/CA_Campgrounds/Props/CA_funnel.plb',
						'Levels/MC_MeatCircus/GIOs/ClownCan.plb',
						'Levels/CA_Campgrounds/Props/Hoop.plb',
						'characters/genericmover.plb',
				        'Levels/CA_Campgrounds/Props/PsiBlastPermit.plb' },
			textures = { 'Textures/Sprites/Clairvoyance Handlers/Raz_Sailor.tga',
							'Textures/Sprites/Clairvoyance Handlers/Raz_PileOfDirt.tga',
							'Textures/Sprites/Clairvoyance Handlers/Raz_NinjaOutfit.tga',
							'Textures/Sprites/Clairvoyance Handlers/Raz_PileOfLeaves.tga', 
						},	
		}
		
		Ob.sPermitMeshName = 'Levels/CA_Campgrounds/Props/PsiBlastPermit.plb'
		Ob.maxViewDistance = 350

		
		Ob.height = 330
		Ob.animsDir = 'Janitor'

		Ob.TK_YOffset = 190
		Ob.confusionDuration = 9000

		Ob.disguises = {}
		Ob.disguises['FordSkipper_sayline'] = 'Textures/Sprites/Clairvoyance Handlers/Raz_Sailor.tga'
		Ob.disguises['FordJanitor_sayline'] = 'Textures/Sprites/Clairvoyance Handlers/Raz_PileOfDirt.tga'
		Ob.disguises['FordNinja_sayline'] = 'Textures/Sprites/Clairvoyance Handlers/Raz_NinjaOutfit.tga'
		Ob.disguises['FordScout_sayline'] = 'Textures/Sprites/Clairvoyance Handlers/Raz_PileOfLeaves.tga'

		Ob.clairFollows = 1
		Ob.animsTable = {
					janitorBreath = {fileName = 'Breathe_janitor', preload = 1, loop = 1},
					janitorIdle = {fileName = 'Idle1_janitor', preload = 1, loop = 0},
					janitorPoint = {fileName = 'Point_janitor', preload = 1, loop = 0},
					janitorSweepStart = {fileName = 'Sweep_start_janitor', preload = 1, loop = 0},
					janitorSweepEnd = {fileName = 'Sweep_end_janitor', preload = 1, loop = 0},
					janitorSweepLoop1 = {fileName = 'Sweep_loop1_janitor', preload = 1, loop = 0},
					janitorSweepLoop2 = {fileName = 'Sweep_loop2_janitor', preload = 1, loop = 1},
					janitorWalkSweep = {fileName = 'WalkSweep_janitor', preload = 1, loop = 0},
					janitorWalkCycle = {fileName = 'Walk_janitor', preload = 1, loop = 0},
					janitorTurnLf = {fileName = 'TurnLf_janitor', preload = 1, loop = 0},
					janitorTurnRt = {fileName = 'TurnRt_janitor', preload = 1, loop = 0},
					janitorTurn180 = {fileName = 'Turn180_janitor', preload = 1, loop = 0},
					janitorTalkGrumpy = {fileName = 'Talk_grumpy', preload = 1, loop = 1},
					
                    scoutPoseAB = {fileName = 'A_B_scout', preload = 1, loop = 0},
					scoutBreathA = {fileName = 'A_breathe_scout', preload = 1, loop = 1},
                    scoutWalk = {fileName = 'Walk_scout', preload = 1, loop = 0},
					scoutLeft90 = {fileName = 'A_TurnLf_scout', preload = 1, loop = 0},
					scoutRight90 = {fileName = 'A_TurnRt_scout', preload = 1, loop = 0},
					scoutRakeLoop = {fileName = 'Rake_loop_janitor', preload = 1, loop = 1},
					
					skipperWaxStart = {fileName = 'WaxCanoe_start_skipper', preload = 1, loop = 0, blendTime = 0.2},
					skipperWaxLoop = {fileName = 'WaxCanoe_loop_skipper', preload = 1, loop = 1, blendTime = 0.2},
					skipperWaxEnd = {fileName = 'WaxCanoe_end_skipper', preload = 1, loop = 0},
					
					ninjaIdle = {fileName = 'Ninja_Idle1', preload = 1, loop = 1, blendTime = 0.5},
					ninjaSlap = {fileName = 'Ninja_slap', preload = 1, loop = 0, blendTime = 0.1},
					ninjaConfusionLoop = {fileName = 'Ninja_Confusion_loop', preload = 1, loop = 1, blendTime = 0.2},
					ninjaConfusionEnd = {fileName = 'Ninja_Confusion_end', preload = 1, loop = 0, blendTime = 0.1},
					ninjaTKed = {fileName = 'Ninja_TK', preload = 1, loop = 1, blendTime = 0.2},
					ninjaFunnel = {fileName = 'PullOutFunnel', preload = 1, loop = 0, blendTime = 0.3, next = 'Ninja_Idle1'},
					
					flinch = {fileName = 'PsiReaction', preload = 1, loop = 0, blendTime = 0},
					jumpOn = {fileName = 'JumpOn_Reaction', preload = 1, loop = 0, blendTime = 0.1},
					TKed = {fileName = 'FordTK', preload = 1, loop = 1, blendTime = 0},
					
					talkLoop = {fileName = 'talk_loop', preload = 1, loop = 0, blendTime = 0.2, next = 'dreamIdle'},
					talk1 = {fileName = 'talk1', preload = 1, loop = 1, blendTime = 0.2},
					talk2 = {fileName = 'talk2', preload = 1, loop = 1, blendTime = 0.2},
					
					--these are for CA dream tutorial
					pointLeftStart = {fileName = 'PointLeft_start', preload = 1, loop = 0, blendTime = 0.1, next = 'pointLeftLoop'},
					pointLeftLoop = {fileName = 'PointLeft', preload = 1, loop = 1, blendTime = 0.1},
					pointLeftEnd = {fileName = 'PointLeft_End', preload = 1, loop = 0, blendTime = 0.1, next = 'dreamIdle'},
					
					pointUpStart = {fileName = 'PointUp_start', preload = 1, loop = 0, blendTime = 0.1},
					pointUpEnd = {fileName = 'PointUp_End', preload = 1, loop = 0, blendTime = 0.1, next = 'dreamIdle'},
					
					dreamTalk1 = {fileName = 'camtutorial_talk1', preload = 1, loop = 0, blendTime = 0.2, next = 'dreamIdle'},
					dreamTalk2 = {fileName = 'camtutorial_talk2', preload = 1, loop = 1, blendTime = 0.2},
					dreamIdle = {fileName = 'camtutorial_idle', preload = 1, loop = 1, blendTime = 0.2},
					
					giveObject = {fileName = 'GiveBacon', preload = 1, loop = 0, blendTime = 0.2},

		   		}
		Ob.janitorMeshName = 'Characters/Janitor.plb'
		Ob.scoutMeshName = 'Characters/JanitorScoutmaster.plb'
		Ob.skipperMeshName = 'Characters/JanitorSkipper.plb'
		Ob.ninjaMeshName = 'Characters/JanitorNinja.plb'
		Ob.levelName = ''
		Ob.stopTalkDist = 500
		Ob.caLevelState = nil
		
		-- Ford's props
		Ob.broom = nil
		Ob.dustpan = nil
		Ob.rake = nil
		
		Ob.bEveFileFullVol = 0
		
		--Positions to put ford under certain circumstances.
		--Position is required, but missing orientation components will be default to 0
		Ob.positions = {
			cajaMainPlatform = { x = 915.77, y = 1192.49, z = -1595.21, yaw = 150 },
			cajaDoorway = { x = -780.46, y = 1411.73, z = -2201.66, yaw = 89.59 },
			cajaObservationRoom = { x = -3807.72, y = 1529.15, z = -5198.31, yaw = -174.96 },
		}

		
		--Positions to put raz which correspond with the above ford locations
		--Position is required, but missing orientation components will be default to 0
		Ob.razPositions = {
			cajaMainPlatform = { x = 1054, y = 1193, z = -1787, yaw = -35 },
			cajaDoorway = { x = -545, y = 1412, z = -2175, yaw = -109},
			cajaObservationRoom = { x = -4013, y = 1528, z = -5165, yaw = 150 },
		}

	
		--Create locators for positions table based on their values		
		for name, table in Ob.positions do
			if (type(table) == 'table') then
				local locator = SpawnScript('Locator', name)
				locator:setPosition(table.x, table.y, table.z)
				locator:setOrientation(table.pitch or 0, table.yaw or 0, table.roll or 0)
				Ob.positions[name] = locator
			end
		end
		
		for name, table in Ob.razPositions do
			if (type(table) == 'table') then
				local locator = SpawnScript('Locator', name..'Raz')
				locator:setPosition(table.x, table.y, table.z)
				locator:setOrientation(table.pitch or 0, table.yaw or 0, table.roll or 0)
				Ob.razPositions[name] = locator
			end
		end
		
		Ob.TIMER_INVISCENSOR = '6000'
		Ob.TIMER_CHECKRAZVISIBILITY = '6001'
		
		Ob.TKTUTORIAL_FAIL				= 0
		Ob.TKTUTORIAL_WAIT_FOR_PICKUP	= 1
		Ob.TKTUTORIAL_WAIT_FOR_AIM		= 2
		Ob.TKTUTORIAL_WAIT_FOR_THROW	= 3

		return Ob
	end
	if not Ob then
		Ob = construct()
	end
	construct = nil
	
--  I N I T  **************************************************************************************
									
	function Ob:onPreLoad()
		local levelName = GetCurrentLevelName()
		if levelName == 'CARE' then
			%Ob.preloadClass( %Ob, 'gen_proploader' )
			%Ob.preloadMesh( %Ob, 'Characters/Janitor.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Broom.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Dustpan.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/fordjanitor_sayline.dds' )
		elseif levelName == 'CAKC' then
			%Ob.preloadClass( %Ob, 'gen_proploader' )
			%Ob.preloadMesh( %Ob, 'Characters/Janitor.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Broom.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Dustpan.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/fordjanitor_sayline.dds' )
		elseif levelName == 'CABH' then
			%Ob.preloadMesh( %Ob, 'Characters/JanitorSkipper.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/FordSkipper_sayline.dds' )
		elseif levelName == 'CAGP' then
			%Ob.preloadClass( %Ob, 'gen_proploader' )
			%Ob.preloadMesh( %Ob, 'Characters/JanitorScoutmaster.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Rake.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/FordScout_sayline.dds' )
		elseif levelName == 'CAJA' then
			%Ob.preloadMesh( %Ob, 'Characters/JanitorNinja.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/FordNinja_sayline.dds' )
		elseif levelName == 'CAMA' then
			%Ob.preloadClass( %Ob, 'gen_proploader' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Rake.plb' )
			%Ob.preloadMesh( %Ob, 'Characters/Janitor.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/fordjanitor_sayline.dds' )
		else
			%Ob.preloadClass( %Ob, 'gen_proploader' )
			%Ob.preloadMesh( %Ob, 'Characters/Janitor.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Broom.plb' )
			%Ob.preloadMesh( %Ob, 'characters/characterprops/Janitor_Dustpan.plb' )
			%Ob.preloadTexture( %Ob, 'textures/ui/sayline heads/fordjanitor_sayline.dds' )
		end
		
		%Ob.Parent.onPreLoad( %Ob )
	end
	
	function Ob:onCAREBeginLevel()
		self.meshName = self.janitorMeshName
		self.charName = 'FordJanitor_sayline'

		self.tPsiReactTable.NewMoveMelee.lineCode = self.punchedTableJanitor
		self.tPsiReactTable.PsiBlast.lineCode = self.punchedTableJanitor
		self.tPsiReactTable.Squash.lineCode = self.punchedTableJanitor
		self.tPsiReactTable.FireStart.lineCode = self.punchedTableJanitor
		self.confusionReactTable[2].line = "/CAGD023FO/"--DIALOG=<<I told you them burgers ain\'t ready!>>
		self.tPsiReactTable.Confusion.lineCode = self.confusionReactTable
		
		if (self:getState() == 7) then
			if (Global.player:getBrainStatus('Clem') == 'redeemed' or Global.player:getBrainStatus('Crystal') == 'redeemed') then
				self.hState7ProxCutsceneVol = TriggerSphere_New(0,0,0, 500, self)
				Trigger_RegisterListener(self.hState7ProxCutsceneVol, self)
			end
		 
			self.activateTable = {
							{line = "/CAFW004RA/", ownerOverride = Global.player, maxPlays = -1, group='a',filterCode='state7'}, --DIALOG=<<Won\'t you help?>>
							{line = "/CAFW005FO/", maxPlays = -1, group='a',filterCode='state7'}, --DIALOG=<<I\'m a janitor. Let me know when somebody drops a carton of eggs or something.>>
			}
			
			self.pokeyTable = {
							{line = "/GLGO035RA/",ownerOverride=Global.player,group='a', maxPlays = -1}, --DIALOG=<<I'd like you to meet Mr. Pokeylope.>>
							{line = "/CAIY000FO/", maxPlays = -1, group='a'}, --DIALOG=<<Hello, Mr. Pokeylope.>>
							{line = "/CAIY001FO/", maxPlays = -1, group='a'}, --DIALOG=<<Don't crap on my floor. I just mopped.>>
			}
		end
	end
	
	function Ob:onCAKCBeginLevel()
		if self:getState() == 1 then
			self.meshName = self.janitorMeshName
			self.charName = 'FordJanitor_sayline'
			RegisterTriggerVolume(self,'tv_FordBlock',1)

			self.tPsiReactTable.NewMoveMelee.lineCode = self.punchedTableJanitor
			self.tPsiReactTable.PsiBlast.lineCode = self.punchedTableJanitor
			self.tPsiReactTable.Squash.lineCode = self.punchedTableJanitor
			self.tPsiReactTable.FireStart.lineCode = self.punchedTableJanitor
			self.confusionReactTable[2].line = "/CAGD023FO/"--DIALOG=<<I told you them burgers ain\'t ready!>>
			self.tPsiReactTable.Confusion.lineCode = self.confusionReactTable
		else
		
			self:killSelf()
			return
		end	
	end
	
	function Ob:onCABHBeginLevel()
		self.meshName = self.skipperMeshName
		self.charName = 'FordSkipper_sayline'

		self.tPsiReactTable.NewMoveMelee.lineCode = self.punchedTableAdmiral
		self.tPsiReactTable.PsiBlast.lineCode = self.punchedTableAdmiral
		self.tPsiReactTable.Squash.lineCode = self.punchedTableAdmiral
		self.tPsiReactTable.FireStart.lineCode = self.punchedTableAdmiral
		self.confusionReactTable[2].line = "/CAGD025FO/"--DIALOG=<<Stop starin\' at my mops!>>
		self.tPsiReactTable.Confusion.lineCode = self.confusionReactTable
		
		if (self:getState() == 7) then
			
			if (Global:loadGlobal('bLOCompleted') == 1) then
				self.activateTable = {
								{line = "/CAFW002RA/", ownerOverride = Global.player, maxPlays = -1, group='a'}, --DIALOG=<<People are missing, kids' brains have been stolen, Coach Oleander is trying to take over the world...>>
								{line = "/CAFW004RA/", ownerOverride = Global.player, maxPlays = -1, group='a'}, --DIALOG=<<Won\'t you help?>>
								{line = "/CAFX007FO/", maxPlays = -1, group='a'}, --DIALOG=<<Yes, the world is a crazy place son. But don\'t worry.>>
								{line = "/CAFX008FO/", maxPlays = -1, group='a'}, --DIALOG=<<The canoes are safe.>>
				}
			else
				self.activateTable = {
								{line = "/CAFX006RA/", ownerOverride = Global.player, maxPlays = -1, group='a'}, --DIALOG=<<Admiral, the monster is still out there, and Coach Oleander is trying to take over the world!>>
								{line = "/CAFX007FO/", maxPlays = -1, group='a'}, --DIALOG=<<Yes, the world is a crazy place son. But don\'t worry.>>
								{line = "/CAFX008FO/", maxPlays = -1, group='a'}, --DIALOG=<<The canoes are safe.>>
				}
			end
			
			self.pokeyTable = {
							{line = "/GLGO035RA/",ownerOverride=Global.player,group='a', maxPlays = -1}, --DIALOG=<<I'd like you to meet Mr. Pokeylope.>>
							{line = "/CAIZ000FO/", maxPlays = -1, group='a'}, --DIALOG=<<Mr. Pokeylope. Stay away from the canoes, and we won't have any problems. Understand? >>
			}
		end
	end
	
	function Ob:onCAGPCAMABeginLevel()
		self.meshName = self.scoutMeshName
		self.charName = 'FordScout_sayline'

		self.tPsiReactTable.NewMoveMelee.lineCode = self.punchedTableRanger
		self.tPsiReactTable.PsiBlast.lineCode = self.punchedTableRanger
		self.tPsiReactTable.Squash.lineCode = self.punchedTableRanger
		self.tPsiReactTable.FireStart.lineCode = self.punchedTableRanger
		self.confusionReactTable[2].line = "/CAGD026FO/"--DIALOG=<<You will call me ADMIRAL, Sonny!>>
		self.tPsiReactTable.Confusion.lineCode = self.confusionReactTable
		
		if (self:getState() == 7) then
			self.activateTable = {
							{line = "/CAFW004RA/", ownerOverride = Global.player, maxPlays = -1, group='a'}, --DIALOG=<<Won\'t you help?>>
							{line = "/CAFY002FO/", maxPlays = -1, group='a'}, --DIALOG=<<I\'m a Ranger. I\'ve got enough problems wrangling these leaves! Now git!>>
			}
			
			
			self.pokeyTable = {
							{line = "/GLGO035RA/",ownerOverride=Global.player,group='a', maxPlays = -1}, --DIALOG=<<I'd like you to meet Mr. Pokeylope.>>
							{line = "/CAJA001FO/", maxPlays = -1, group='a'}, --DIALOG=<<Hello, Mr. Pokeylope. >>
							{line = "/CAJA002FO/", maxPlays = -1, group='a'}, --DIALOG=<<Could you please tell your friend that these woods are off limits?>>
			}
		end
	end
	
	function Ob:onCAJABeginLevel()
		self.meshName = self.ninjaMeshName
		self.charName = 'FordNinja_sayline'
		self:setFordPosition('cajaMainPlatform')
		-- spawn the tutorial script
		self.tutorial = SpawnScript('CA.Props.FordTutorials', 'Tutorial')
		
		self:resetTKCensorForTutorial()
		
		if self.fireProp1 == nil then
			self:spawnBurnableStuffForTutorial()	
		end

		if self.TKCan == nil then
			self:spawnTKCanForTutorial()
		end

		if self.TKHoop1 == nil then
			self:spawnTKHoopsForTutorial()
		end

		self.pokeyTable = {
			{line = "/GLGO035RA/",ownerOverride=Global.player,group='a', maxPlays = -1}, --DIALOG=<<I'd like you to meet Mr. Pokeylope.>>
			{line = "/CAKJ009FO/", maxPlays = -1, group='a'}, --DIALOG=<<Well I\'m glad to see you made some new friends, after all your old ones got their brains sucked out.>>
		}			

		self.rSlapSoundHandle = LoadSound('Slap')
		self:createTimer(1000, self.TIMER_CHECKRAZVISIBILITY)			
	end
		
	function Ob:onBeginLevel()
		self.levelName = GetCurrentLevelName()
		self.activateTable = {
			-- Dialog Domain CAPO
			{line = "/CAPO001RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state1'}, --DIALOG=<<Mr. Cruller?>>
			{line = "/CAPO002FO/", maxPlays = -1, filterCode = 'state1', callback = 'Done'}, --DIALOG=<<I told you! Get up that big tree over yonder and get into Coach Oleander�s class so he can start tormenting ya!>>
			
			{line = "/CAPO003RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state2'}, --DIALOG=<<Where did you�>>
			{line = "/CAPO004FO/", maxPlays = -1, filterCode = 'state2', callback = 'Done'}, --DIALOG=<<Under the GPC! Maybe it�s your ears I should be moppin!>>
			
			{line = "/CAPO005RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state3'}, --DIALOG=<<I�m learning some advanced techniques from Sasha Nein right now.>>
			{line = "/CAPO006FO/", maxPlays = -1, filterCode = 'state3', callback = 'Done'}, --DIALOG=<<You let me know when you�re done with that your little zip-zappy head games and we�ll get to some extreme mopping. Okay?>>
			
			{line = "/CAPO007RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state4'}, --DIALOG=<<Hey, wanna watch me shoot something?>>
			{line = "/CAPO008FO/", maxPlays = -1, filterCode = 'state4', callback = 'Done'}, --DIALOG=<<Wanna see me wring your neck like a mop?>>
			
			{line = "/CAPO009RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state5'}, --DIALOG=<<Hey, after I learn Levitation, I could maybe help you get up to higher places to clean.>>
			{line = "/CAPO010FO/", maxPlays = -1, filterCode = 'state5', callback = 'Done'}, --DIALOG=<<Now, that�s the first sensible thing you�ve said all day.>>
			
			{line = "/CAPO011RA/", ownerOverride = Global.player, maxPlays = -1, filterCode = 'state6'}, --DIALOG=<<Hey, Mr. Cruller! I�m a trained Levitator now!>>
			{line = "/CAPO012FO/", maxPlays = -1, filterCode = 'state6', callback = 'Done'}, --DIALOG=<<Levitation!>>
		}

		self.punchedTableJanitor = {
			{line = "/CAHJ000FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Ow!>>
			{line = "/CAHJ001FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Aye!>>
			{line = "/CAHJ002FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Oof!>>
			{line = "/CAHG000FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<Ah, eager to get whacked on the head with a broom handle too, l I see!>>
			{line = "/CAHG001FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<Hey! I should wring you out like a wet mop!>>
			{line = "/CAHG002FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<How about I clean your clock instead of the floor, eh?>>
			{line = "/CAQZ034FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<If I wasn't the one who'd have to clean it up, I'd mash ya into a puddle of goo>>
		}

		self.punchedTableRanger = {
			{line = "/CAHJ000FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Ow!>>
			{line = "/CAHJ001FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Aye!>>
			{line = "/CAHJ002FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Oof!>>
			{line = "/CAHJ003FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will rake you into the next dimension if you don't knock that off.>>
			{line = "/CAHJ004FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will whittle you into a neckerchief holder in two seconds, you hear me?>>
			{line = "/CAHJ005FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I know places in these woods, I could hide a body so nobody would find it, ever.>>
			{line = "/CAHJ006FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will burn you like a pile of autumn leaves if you do that again.>>
		}

		self.punchedTableChef = {
			{line = "/CAHJ000FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Ow!>>
			{line = "/CAHJ001FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Aye!>>
			{line = "/CAHJ002FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Oof!>>
			{line = "/CAHH000FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will flip you like a half-done burger, boy.>>
			{line = "/CAHH001FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will take out your intestines, fry 'em into hash browns, and sew 'em back into your body before you ever get the chance to try that again!>>
			{line = "/CAHH002FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<How'd you like to be branded with a hot spatula, eh?>>
		}

		self.punchedTableAdmiral = {
			{line = "/CAHJ000FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Ow!>>
			{line = "/CAHJ001FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Aye!>>
			{line = "/CAHJ002FO/", maxPlays = -1, group = 'a', iRandPicksFromGroup = 1}, --DIALOG=<<Oof!>>
			{line = "/CAHI000FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will take one of these paddles to your psychic be-hind if you don't knock that off!>>
			{line = "/CAHI001FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I will sink you so deep in that lake, no dredge crew would ever find ya.>>
			{line = "/CAHI002FO/", maxPlays = -1, group = 'b', iRandPicksFromGroup = 1, callback = 'LineEnd'}, --DIALOG=<<I'll make a canoe out of your hide, you try that one more time!>>
		}
		
		self.punchedTableNinja = {
			{line = "/CAKJ000FO/", maxPlays = -1, callback = 'PostReactionInDialogStart'} --DIALOG=<<Son, I will teleport you deep into that solid rock over there, you don\'t knock that off.>>		
		}

		self.blastTableNinja = {
			{line = "/CAKJ001FO/", maxPlays = -1, callback = 'PostReactionInDialogStart'} --DIALOG=<<Why did I give him that dang learner\'s permit?>>
		}
			
		self.fireStartTableNinja = {
			{line = "/CAKJ002FO/", maxPlays = -1, callback = 'PostReactionInDialogStart'} --DIALOG=<<I didn\'t train you in that so you could set me on fire. Now knock it off!>>		
		}
			
		self.TKTableNinja = {
			{line = "/CAKJ003FO/", maxPlays = -1, callback = 'PostReactionInDialogStart'} --DIALOG=<<Very nice. Now set me down easy and go pick up something that won\'t blow up your head if you make it mad.>>
		}
		
		self.confusionTableNinja = {
			{line = "/CAKJ006FO/", maxPlays = -1, callback = 'PostReactionInDialogStart'} --DIALOG=<<Oh no. The attacks are starting even in here! Have to get a bigger Psitanium boulder under the glass...>>
		
		}
			
		self.tPsiReactTable = {
			NewMoveMelee = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'flinch', bRandomCRH = 0, lineCode = self.punchedTableNinja -- linecode overridden for other non ninja fords
			},
			PsiBlast = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'flinch', bRandomCRH = 0, lineCode = self.blastTableNinja -- linecode overridden for other non ninja fords
			},
			Squash = {
				animToPlay = 'jumpOn', preCallback = self.bounce, bRandomCRH = 0, lineCode = self.punchedTableNinja -- linecode overridden for other non ninja fords
			},
			TKPickup = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'TKed', lineCode = "/CAGC022FO/" --DIALOG=<<Okay, that\'s funny. Now PUT ME DOWN.>>
			},
			TKRelease = {
				reset = 1
			},	 
			FireStart = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'flinch', lineCode = self.fireStartTableNinja -- linecode overridden for other non ninja fords
			},	  
			Confusion = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'ninjaConfusionLoop', loop = 1
			},
			ConfusionDone = {
				animToPlay = 'ninjaConfusionEnd', loop = 0
			},
			
			
		}
		
		if self.levelName == 'CAJA' then
			self.tPsiReactTable.TKPickup = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'ninjaTKed', lineCode = self.TKTableNinja, loop = 1 --DIALOG=<<Very nice. Now set me down easy and go pick up something that won\'t blow up your head if you make it mad.>>
			}
			self.tPsiReactTable.Confusion = {
				preCallback = self.preReactionInDialogStop, animToPlay = 'ninjaConfusionLoop', lineCode = "/CAKJ005FO/"--DIALOG=<<Ahh, what... no... I have to flip the burgers... no... mop the... the rake-- ahh! My canoes!>>
			}
			self.tPsiReactTable.ConfusionDone = {
				animToPlay = 'ninjaConfusionEnd', lineCode = self.confusionTableNinja, loop = 0
			}
			self.tPsiReactTable.TKCollide = {
				animToPlay = 'flinch', loop = 0
			}
		else
			-- This is used for a few of his reactions
			self.confusionReactTable = {
				{line = "/CAGD022FO/", group = 'a', maxPlays = -1},--DIALOG=<<Oooh-ooooh...>>
				{group='a', maxPlays = -1},
			}
		end
				
		if (GetCurrentLevelName() == 'CABU') then
			self.examRantTable = {
									{line = "/CAGA004FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='first'}, --DIALOG=<<No, that way.>>
									{line = "/CAGA005FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='first'}, --DIALOG=<<Look over there.>>
									{line = "/CAGA006FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='first'}, --DIALOG=<<Over there.>>
									{line = "/CAGA007FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='first'}, --DIALOG=<<Clocks a-tickin', Sonny!.>>
									
									{line = "/CAGA013FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='second'}, --DIALOG=<<.Up. Up there..>>
									{line = "/CAGA014FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='second'}, --DIALOG=<<Come on..>>
									{line = "/CAGA015FO/", maxPlays = -1, minPause=3, maxPause=5, filterCode='second'}, --DIALOG=<<You see where I'm pointing?>>
			}
			self.examCRH = SpawnScript('Global.Util.CharResponseHandler','','',0)
			self.examCRH.owner = self
			self.examCRH.bLinePriority = 1
			self.examCRH.type = self.examCRH.ALWAYS_SEQUENTIAL
			self.examCRH:addDialog(self.examRantTable)
		end			

		if self.levelName == 'CARE' then
			self:onCAREBeginLevel()
		elseif self.levelName == 'CAKC' then
			self:onCAKCBeginLevel()
		elseif self.levelName == 'CABH' then
			self:onCABHBeginLevel()													  
		elseif self.levelName == 'CAGP' or self.levelName == 'CAMA' then
			self:onCAGPCAMABeginLevel()
		elseif self.levelName == 'CAJA' then
			self:onCAJABeginLevel()
		else
			self.meshName = self.janitorMeshName
			self.charName = 'FordJanitor_sayline'
		end
		
		self.disguise = self.disguises[self.charName]
		
		%Ob.Parent.onBeginLevel(self)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 1)

		SetMeshIsBackwards(self, 1)
		
		if self.levelName == 'CARE' then
            self.broom = SpawnScript('gen_proploader', 'Broom', 'self.meshname=\'characters/characterprops/Janitor_Broom.plb\'', 1) 
			self.dustpan = SpawnScript('gen_proploader', 'Dustpan', 'self.meshname=\'characters/characterprops/Janitor_Dustpan.plb\'', 1) 
			self:setScale(1.5)
            -- set prop positions											
			AttachEntityToEntityBone(self.broom, self, 'handJEndRt_1')
			self.broom:setPosition(-0.01, 0.062,-0.004)
                        self.broom:setOrientation(115.824,-23.252,-49.321)
			self.broom:setScale(1.5)
			AttachEntityToEntityBone(self.dustpan, self, 'handJEndLf_1')
			self.dustpan:setPosition(0.015,0.052,0.018)
			self.dustpan:setOrientation(69.4,15.113,24.935)
			self.dustpan:setScale(1.5)
			self:setPosition(-21603, 596,-316)
			self:setOrientation(0, 164, 0)
			RegisterTriggerVolume(self, 'tv_FordIntro', 1)
            self:setState('CARE')
		elseif self.levelName == 'CAKC' then   
			if (Global:load('CALevelState') == 1) then 
				self:setPosition(-4911.14404296875,5591.75,-6483.38818359375)
				self:setOrientation(0,-161.6145782470703,0)
				self.broom = SpawnScript('gen_proploader', 'Broom', 'self.meshname=\'characters/characterprops/Janitor_Broom.plb\'', 1) 
				self.dustpan = SpawnScript('gen_proploader', 'Dustpan', 'self.meshname=\'characters/characterprops/Janitor_Dustpan.plb\'', 1) 
				-- set prop positions
				AttachEntityToEntityBone(self.broom, self, 'handJEndRt_1')
				self.broom:setPosition(-0.01, 0.062,-0.004)
				self.broom:setOrientation(115.824,-23.252,-49.321)
				AttachEntityToEntityBone(self.dustpan, self, 'handJEndLf_1')
				self.dustpan:setPosition(0.015,0.052,0.018)
				self.dustpan:setOrientation(69.4,15.113,24.935)
				self:setState('CAKC')
			end
		elseif self.levelName == 'CABH' then
			self:setPosition(8370.25, 768.582, 15278.4)
			self:setOrientation(0,-39.574,0)
			self:setState('CABH')
		elseif self.levelName == 'CAGP' then
			self.TK_YOffset = 250
			self:setScale(1.5)
			self.height = self.height * 1.5
			self.rake = SpawnScript('gen_proploader', 'Rake', 'self.meshname=\'characters/characterprops/Janitor_Rake.plb\'', 1) 
			-- set prop positions
			AttachEntityToEntityBone(self.rake, self, 'handJRt_1')
			self.rake:setPosition(0,0,0)
			self.rake:setOrientation(0,0,0)
			self:setAnim(self.animsTable.janitorIdle)
            RegisterTriggerVolume(self, 'tv_FordScavengerProx', 0)
			
			self:setState('CAGP')
		elseif self.levelName == 'CAMA' then
			self:setPosition(-9040.5, 4224.42, 3971.11)
			self:setOrientation(0, -175.1, 0)
			self:setScale(1.5)
			self.height = self.height * 1.5
			self.rake = SpawnScript('gen_proploader', 'Rake', 'self.meshname=\'characters/characterprops/Janitor_Rake.plb\'', 1) 
			-- set prop positions
			AttachEntityToEntityBone(self.rake, self, 'handJRt_1')
			self.rake:setPosition(0,0,0)
			self.rake:setOrientation(0,0,0)
			
			self:setState('CAMA')
		elseif self.levelName == 'CAJA' then
			self.TK_YOffset = 250
			self:setPosition(1176.4, 1192.6, -2040)
			self:setOrientation(0, 48.1, 0)

            self:setState('CAJA')
		else
			self.broom = SpawnScript('gen_proploader', 'Broom', 'self.meshname=\'characters/characterprops/Janitor_Broom.plb\'', 1) 
			self.dustpan = SpawnScript('gen_proploader', 'Dustpan', 'self.meshname=\'characters/characterprops/Janitor_Dustpan.plb\'', 1) 
			-- set prop positions
			AttachEntityToEntityBone(self.broom, self, 'handJEndRt_1')
			self.broom:setPosition(-0.01, 0.062,-0.004)
			self.broom:setOrientation(115.824,-23.252,-49.321)
			AttachEntityToEntityBone(self.dustpan, self, 'handJEndLf_1')
			self.dustpan:setPosition(0.015,0.052,0.018)
			self.dustpan:setOrientation(69.4,15.113,24.935)
			self:setAnim(self.animsTable.janitorIdle)
			self:setState(nil)
		end
		
		SetEntityCollideCylinder(self, self.height/4, self.height)
        
		if (self.pokeyTable) then
			self.pokeyHandler = SpawnScript('Global.Util.CharResponseHandler','','',0)
			self.pokeyHandler.owner = self
			self.pokeyHandler.bLinePriority = 1
            self.pokeyHandler.type = self.pokeyHandler.ALWAYS_SEQUENTIAL
			self.pokeyHandler:addDialog(self.pokeyTable)
		end
		
		self.responseHandler = SpawnScript('Global.Util.CharResponseHandler','','',0)
		self.responseHandler.owner = self
		self.responseHandler.bLinePriority = 1
		self.responseHandler:addDialog(self.activateTable)
		self.responseHandler.type = self.responseHandler.ALWAYS_SEQUENTIAL
		
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		self:restoreAmmoForTutorial()
	end
	
	--Moves ford to a predefined position, and saves it.  The saved value is used
	--	when he is moved elsewhere, so he can be put back
	function Ob:setFordPosition(nameOrLocator)
		--Get locator reference
		local locator
		if (type(nameOrLocator) == 'string') then
			locator = self.positions[nameOrLocator]
		elseif (type(nameOrLocator) == 'table') then
			locator = nameOrLocator
		else
			GamePrint('WARN: Bad argument for setFordPosition')
		end
		
		--Set and save position
		self:setPosition(locator:getPosition())
		self:setOrientation(locator:getOrientation())
		self.lastFordPosition = locator
	end
	

	function Ob:setRazPosition(fordPosition) --take fordPosition and translate it to raz's table
		--Get locator reference
		local locator
		if (type(fordPosition) == 'string') then
			locator = self.razPositions[fordPosition]
		elseif (type(fordPosition) == 'table') then
			locator = fordPosition
		else
			GamePrint('WARN: Bad argument for setRazPosition')
		end
		
		--Set position
		Global.player:setPosition(locator:getPosition())
		Global.player:setOrientation(locator:getOrientation())
	end
	
	function Ob:fordGoToLastPosition()
		self:setFordPosition(self.lastFordPosition)
	end
	
--*************************************************************************************************
-- States	
--*************************************************************************************************	
	function Ob:stateCARE()
		self:setAnim(self.animsTable.janitorSweepLoop2)
        self:sleep(RandInt(5,10))
		self:setAnim(self.animsTable.janitorSweepLoop1)
		self:sleep(RandInt(5,10))
		self:playAnimBlocking(self.animsTable.janitorIdle)
		self:playAnimBlocking(self.animsTable.janitorBreath)
	end
	
--*************************************************************************************************	

	function Ob:stateCABH()
		self:playAnimBlocking(self.animsTable.skipperWaxStart)
		self:setAnim(self.animsTable.skipperWaxLoop)
		self:setState(nil)
	end

--*************************************************************************************************	
	
	function Ob:stateCAGP()
		self:setAnim(self.animsTable.scoutRakeLoop)
		self:setState(nil)
	end
	
--*************************************************************************************************	
	
	function Ob:stateCAKC()
		self:playAnimBlocking(self.animsTable.janitorSweepStart)
		self:setAnim(self.animsTable['janitorSweepLoop'..RandInt(1, 2)], nil, 1)
		self:playAnimBlocking(self.animsTable.janitorSweepEnd)
        self:playAnimBlocking(self.animsTable.janitorIdle)
	end
	
--*************************************************************************************************
	
	function Ob:stateCAJA()
		self:setAnim(self.animsTable.ninjaIdle)
	
		--Launch into big dialog table		
		if (self.bActivated == 1) then
--			if Global:load('CALevelState') == 7 and Global:load('bLiliKidnapped') ~= 1 then
--				Global.levelScript:teachNewPowers(1)
--				Global.cutsceneScript:runCutscene('CAJAGoGetHer', 1)
--			end
				Global.levelScript:teachNewPowers(1)
				-- the above call will never return if there are new powers to teach: it will set our state to
				-- something else.
	
				--local bHadPower = Global.levelScript:teachNewPowers()
				--if bHadPower ~= 1 and Global:load('CALevelState') == 7 and Global:load('bLiliKidnapped') ~= 1 and Global:load('bCAJAGoGetHerPlayed') ~= 1 then
					--Global.cutsceneScript:runCutscene('CAJAGoGetHer', 1)
				--else
					Global.player:dontRunPlayerControls(1)
					Global.player:setNewAction('Stand')
					self:setAnim(self.animsTable.dreamIdle)
					LookAtEntity(self, Global.player)
					SetCamera(kCAMERA_SCRIPT)
				
					--Raz gets Ford's attention
					Global.player:sayLine("/CAKD000RA/", 1, 1, nil, 0, nil, 1)--DIALOG=<<Agent Cruller?>>
			
			--TODO: Ford should turn to raz at this point, but we currently dont have a way to do that	
				
					--Ford responds differently based on whether or not Raz has told him the big plot
					--(No sound files yet, play text saylines
					if (Global:load('bSeenObservationExplanation') ~= 1) then
						--self:sayLine("/CAKD001FO/", 1) --DIALOG=<<So, how goes the training?>>
						self:sayLine("/CAKD001FO/", 1, 1, nil, 0, nil, 1)--DIALOG=<<So, how goes the training?>>
					else
						--self:sayLine("/CAKD002FO/", 1) --DIALOG=<<What's the current situation?>>
						self:sayLine("/CAKD002FO/", 1, 1, nil, 0, nil, 1)--DIALOG=<<What\'s the current situation?>>
					end
		
					--Enter main dialog tree
					self:startTree(self:getCAJADialogTable(),1)
					SetCamera(kCAMERA_CHASE)
					Global.player:dontRunPlayerControls(0)
				--end
--			end
		end
		self:setState(nil)
	end
	
	function Ob:endStateCAJA()
		Global.player:dontRunPlayerControls(0)
	end	

--*************************************************************************************************
	
	function Ob:stateCAMA()
        self:setAnim(self.animsTable.scoutRakeLoop)
		if (Global:load('bFord2ScavengerProxPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('Ford2ScavengerProx', 1, 0, 0) -- tim said to make this one unskippable
		end
		
		self:setState(nil)
	end
	
--*************************************************************************************************
	
	function Ob:beginStateTalk()
		-- this is temp behavior until we know what ford is actually going to do when raz activates him
--[[
        if self.levelName == 'CAGP' then
			self:setAnim(self.animsTable.scoutBreathA)
        else
			self:setAnim(self.animsTable.janitorBreath)
		end
]]--
	end
	
	function Ob:stateTalk()
		-- this is temp behavior until we know what ford is actually going to do when raz activates him
		local dist = GetPlayerDist(self)
		if dist >= self.stopTalkDist then
			self:setState(self.levelName)	-- when raz is out of range go back to what you were doing
		end
	end
    
	function Ob:stateTalkCABH()
		if (self.caLevelState == 7) then
			if (Global:loadGlobal('bLOCompleted') == 1 and Global:load('bFord7AdmiralActivateAfterLOPlayed') ~= 1 ) then
				Global.cutsceneScript:runCutscene('Ford7AdmiralActivateAfterLO')
			elseif (Global:loadGlobal('bLOCompleted') ~= 1 and Global:load('bFord7AdmiralActivatePlayed') ~= 1 ) then
				Global.cutsceneScript:runCutscene('Ford7AdmiralActivate')
			else
				self.responseHandler:chatterStart(1)
			end
			self:setState(nil)
		elseif (self.caLevelState == 5) then
			local bGavePassToFord = Global:load('GaveCanoePassToFord', 'CA')
			if (bGavePassToFord ~= 1) then
				Global:save('GaveCanoePassToFord', 1,'CA')
				FindScriptObject('Canoe'):setCanoeUsable()
				self:setState('FordAcceptsCanoePass')
			else
				Global.levelScript.cutsceneScript:runCutscene('FordStateNone')
				self:setState(nil)
			end
		elseif (self.caLevelState > 5 and self.caLevelState < 7) then
			Global.cutsceneScript:runCutscene('Ford6AdmiralActivate')
			self:setState('CABH')
		elseif (self.caLevelState < 5) then
			if (Global:load('FordState1234IntroSeen') == 1) then
				Global.levelScript.cutsceneScript:runCutscene('FordState1234')
			else
				Global.levelScript.cutsceneScript:runCutscene('FordState1234Intro')
			end
			self:setState(nil)
		end
	end
	
	-- this function blocks only call this from within a state!
	-- precondition: self.levelName == 'CAGP'
	function Ob:collectScavItems() 
        if (Global:loadGlobal('bCollected16ScavengerItems') == 1 and Global:load('bFordScavengerFullPlayed') ~= 1) then
			UnlockAchievement('ACH_SCAVENGER_COMPL')
			Global.cutsceneScript:runCutscene('FordScavengerFull', 1)
			Global.goalManager:deactivate('ScavengerHunt1',1)
			Global.goalManager:deactivate('ScavengerHunt2')
			--edit to fix redeem Scav Hunt items bug
			Global:saveGlobal('bRedeemed16ScavengerItems', 1)

		elseif (Global:loadGlobal('bCollected8ScavengerItems') == 1 and Global:load('bFordScavengerHalfPlayed') ~= 1 and Global:load('bFordScavengerFullPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('FordScavengerHalf', 1)
			Global.goalManager:deactivate('ScavengerHunt1')
		else  --cuz the ford7rangeractivate cutscene didn't fade in, to prevent 1-frame hitch between the two back to back cutscenes
			Global.cutsceneScript:fadeIn(1)
		end
	end

--*************************************************************************************************	
	
	function Ob:stateTalkCAGP()
		if (self.caLevelState == 7) then
			if (Global:load('bFord7RangerActivatePlayed') ~= 1) then
				Global.levelScript.cutsceneScript:runCutscene('Ford7RangerActivate', 1)
				self:collectScavItems()
			else
				self:collectScavItems()
				self.responseHandler:chatterStart(1)
			end
		elseif (self.caLevelState < 5 and Global:load('bSeenCASA') == 1) then
			Global.cutsceneScript:runCutscene('Ford2RangerActivate', 1)
			self:collectScavItems()
		elseif (self.caLevelState < 5 and Global:load('bSeenCASA') ~= 1) then
			Global.levelScript.cutsceneScript:runCutscene('FordState234', 1)
			self:collectScavItems()
		elseif (self.caLevelState == 5) then
			--Global.levelScript.cutsceneScript:runCutscene('FordState5', 1)
			Global.levelScript.cutsceneScript:runCutscene('Ford5RangerActivate', 1)
			self:collectScavItems()
		elseif (self.caLevelState == 6) then
			Global.levelScript.cutsceneScript:runCutscene('FordState6', 1)
			self:collectScavItems()
		else
			self:collectScavItems()
		end

		
		self:setState('CAGP')
	end
--*************************************************************************************************	
	
	function Ob:stateTalkCAJA()
		-- next check to see if there are any new brains to redeem
		if Global.player.stats.totalBrainsHeld > 0 then	-- true if there are new brains ready to redeem
			self:setState('RedeemBrains')
		else
			Global.player:dontRunPlayerControls(1) -- This gets cleared out inside the state
			self:setState('CAJA')
		end
	end
	
--*************************************************************************************************	

	function Ob:stateFordAcceptsCanoePass()
		Global.levelScript.cutsceneScript:runCutscene('Ford5AdmiralCanoePass')
		self:setState(nil)
	end
	
--*************************************************************************************************	

	function Ob:stateActivated()
        
        if self.levelName == 'CARE' then
			self.responseHandler:setFilter('state'..self.caLevelState)
			
            if (self.caLevelState == 1) then
				if (Global:load('FordState1Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState1Try2')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 2) then
				if (Global:load('FordState2Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState2Try2')
				elseif (Global:load('FordState2Try3Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState2Try3')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 3) then
				if (Global:load('FordState3Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState3Try2')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 4) then
				if (Global:load('FordState4Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState4Try2')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 5) then
				if (Global:load('FordState5Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState5Try2')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 6) then
				if (Global:load('FordState6Try2Seen') ~= 1) then
					Global.levelScript.cutsceneScript:runCutscene('FordState6Try2')
				else
					self.responseHandler:chatterStart()
				end
			elseif (self.caLevelState == 7) then
				if (Global:load('bFord7JanitorActivatePlayed') ~= 1) then
					Global.cutsceneScript:runCutscene('Ford7JanitorActivate')
				else
					self.responseHandler:chatterStart(1)
				end
			end
		end
		
		self:setState(nil)
	end

	function Ob:stateSlapRaz()

		Global.player:dontRunPlayerControls(1)
		Global.player:setNewAction('Stand')
		SetCamera(kCAMERA_SCRIPT)

		-- Shot of Ford talkin
        --  if this line was heard in the cutscene that leads up to this then dont play it again
		if Global:load('bHeardAreYouReadyLine') ~= 1 then
            self:sayLine("/CAKC018FO/", 1, 0, nil, 1, nil, 1)--DIALOG=<<Are you ready?>>
		end

		-- Shot for the dialogue bubble
		Global.cutsceneScript:cutTo(-3845.4,1617.4,-4686.4, 17.9,5.9,-0.0,134.1)       	
		
		--Get dialog selection		
		local slapDialog = {
			"/GLZA036TO/",--DIALOG=<<Yes!>>
			"/GLZA039TO/",--DIALOG=<<No. Not yet.>>
		}
		
		--Keep asking until he says yes
		local choice = 0
		while (choice ~= 1) do
			choice = DialogChoiceBubble(slapDialog, 1)
	
			--Play appropriate line
			if (choice == 2) then
				--self:sayLine("/CAKC020RA/", 1) --DIALOG=<<No. Not yet.>>
				Global.player:sayLine("/CAKC020RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<No. Not yet.>>

				--Play slapping animation
				Global.cutsceneScript:cutTo(-3712.3,1669.3,-4985.7, -4.4,37.0,0.0,93.8)
				LoadAnim(Global.player, 'Anims/DartNew/Ninja_slapped.jan', 0.3, 0)
				
				self:setAnim(self.animsTable.ninjaSlap)
				self:sleep(0.3)				
				self:playSound(self.rSlapSoundHandle, 0, 0, 1)
				self:sleep(0.4)
				
				--And back to idle
				LoadAnim(Global.player, 'Anims/DartNew/standstill.jan', 0.3, 1)
				self:setAnim(self.animsTable.ninjaIdle)
				
				--self:sayLine("/CAKC021FO/", 1) --DIALOG=<<How about now?>>
				self:sayLine("/CAKC021FO/", 1, 0, nil, 1, nil, 1)--DIALOG=<<How about now?>>
				Global.cutsceneScript:cutTo(-3845.4,1617.4,-4686.4, 17.9,5.9,-0.0,134.1)       	
			end
		end

		--self:sayLine("/CAKC019RA/", 1) --DIALOG=<<Yes!>>
		Global.player:sayLine("/CAKC019RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<Yes!>>
		
		--Player said yes, finish dialog

		--edit removed
		--Global.cutsceneScript:runCutscene('CAJAFindMonster', 1)
		

		SetCamera(kCAMERA_CHASE)
		Global.player:dontRunPlayerControls(0)

		--edit to lead directly into dialogue, turn in brains
		self.bActivated = 1
		self:setState('TalkCAJA')
		
		--edit removed
		--self:setState(nil)

	end

	--Attaches bacon to Ford's right hand	
	function Ob:attachBacon()
		--Get bacon object
		local bacon = FindScriptObject('Bacon', 1)
		if not bacon then
			bacon = SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
		end
		bacon:beNotPickupable()

		--In case it was in inventory (which it shouldn't have been, this is just for debug)
		SetEntityDomain(bacon, 'Level')		

		--Attach bacon and position it in Ford's hand		
		AttachEntityToEntityBone(bacon, self, 'handJEndRt_1')
		bacon:setOrientation(0,0,0)
		bacon:setPosition(0,0,0)
	end
	
	--attaches bacon to Raz's left hand
	function Ob:handRazBacon()
		--Get bacon object
		local bacon = FindScriptObject('Bacon', 1)
		if not bacon then
			bacon = SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
		end
		bacon:beNotPickupable()

		--Detach it
		DetachEntityFromParent(bacon)
		bacon:setOrientation(0,0,0)
                
		--Attach to Raz's hand
		AttachEntityToEntityBone(bacon, Global.player, 'handJEndLf_2')
		bacon:setOrientation(0,0,0)
		bacon:setPosition(0,0,0)
	end

	--Bacon to inventory
	function Ob:giveBacon()

        --Get bacon object	
		local bacon = FindScriptObject('Bacon', 1) or SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
		
		--first detach
		DetachEntityFromParent(bacon)
		
		--Add it to inventory if it isn't already, otherwise just put it back in Inventory domain
		if (Global.player:isInInventory('Bacon') ~= 1) then
			Global.player:addToInventory(bacon,0,1)
		else
			SetEntityDomain('Bacon', 'InvItems')
		end
	end

	function Ob:givePermitAnim()
		--Spawn dummy mesh
		self.permit = SpawnScript('ScriptBase','DummyPermit')		
		self.permit:loadMesh(self.sPermitMeshName)
		self.permit:makeInvisible()
                
		--play anim
		LoadAnim(self, 'Anims/Janitor/GiveBacon.jan', 0.3, 0)
                
		--Attach and position
		AttachEntityToEntityBone(self.permit, self, 'handJEndRt_1')
		self.permit:setPosition(-13.4, 2.8, 7.3)
        self.permit:setOrientation(133, 1, 65.2)
		self.permit:makeVisible()
	end
	
	function Ob:permitFloat()
		--Spawn generic Mover
		self.permitMover = SpawnScript('dummy', 'PermitMover')
		self.permitMover:loadMesh('characters/genericmover.plb')
                
		DetachEntityFromParent(self.permit)
		
		--Place mover in current detached position
		self.permitMover:setPosition(self.permit:getPosition())
		self.permitMover:setOrientation(self.permit:getOrientation())
                
		--Attach to Mover
        AttachEntityToEntityBone(self.permit, self.permitMover, 'rootJ_1')
                
        --Play Float Animation
		LoadAnim(self.permitMover, 'Anims/Objects/Float.jan', 0, 1)
	end

	--Gives raz the PsiBlast Learner's Permit
	function Ob:giveLearnersPermit()
		Global:saveGlobal('bHasPsiBlastLearnersPermit', 1)
		Global.goalManager:activate('BadgeReturn')

		-- flash the sprite up on da screenie		
		local powerAdderFaker = SpawnScript('ScriptBase','PowerAdderFaker')		
		powerAdderFaker.pickupSpriteName = 'LearnersPermit_Marksmanship'
		powerAdderFaker.displayName = "/CAZB007TO/"--DIALOG=<<Marksmanship Learner\'s Permit>>
		Global.player.invDisplayer:invItemAdded(powerAdderFaker,0,0,1,1,1)
		
		--Enable the power as a learner's permit (thats what the 1 is for)
		EnablePower(kPOWER_PSIBLAST, 1)
		MapPowerToButton(kPOWER_PSIBLAST,kQUICKPICK_TRIGR)
		
		--Clean up permit
		self.permit:killSelf()
		self.permitMover:killSelf()
	end
	
	function Ob:pullOutFunnel()
		self:playAnimCallback(self.animsTable.ninjaFunnel, self.detachFunnel)
	end

	function Ob:onAttachFunnel()
		self:attachFunnel()
	end
	
	function Ob:attachFunnel()
		if (not self.funnel) then
			self.funnel = SpawnScript('Global.Props.Geometry', 'FordFunnel', 'self.meshName = \'Levels/CA_Campgrounds/Props/CA_funnel.plb\'')
		end
		self.funnel:makeVisible()
		AttachEntityToEntityBone(self.funnel, self, 'handJEndLf_1')
		self.funnel:setOrientation(0, 0, 0)
		self.funnel:setPosition(0, 0, 0)
	end
	
	function Ob:detachFunnel()
		if (self.funnel) then
			DetachEntityFromParent(self.funnel)
			self.funnel:makeInvisible()
		end
	end
	
	function Ob:stateOnButton()
		Global.cutsceneScript:runCutscene('Ford234NinjaButton', 1)
		
		self:setState('TalkCAJA')
	end

--*************************************************************************************************
-- Message Handlers
--*************************************************************************************************
    function Ob:onItem(data, from)
		if self.bPlayingTutorial ~= 1 then
			self:shutUp()
			if (data == 'CrowFeather') then
				if (self:distance(Global.player) < 250) then
					self:sayLine("/GLGO024FO/", 0, 0, nil, 1, nil, 1)  --DIALOG=<<Ooh, ha ha ha!>>
					return
				end
			elseif (data == 'Button') then
				if (self.meshName == self.janitorMeshName) then
					Global.cutsceneScript:runCutscene('Ford234JanitorButton')
					self:setState(nil)
				elseif (self.meshName == self.skipperMeshName) then
					Global.cutsceneScript:runCutscene('Ford234AdmiralButton')
					self:setState(nil)
				elseif (self.meshName == self.scoutMeshName) then
					Global.cutsceneScript:runCutscene('Ford234RangerButton')
					self:setState(nil)
				elseif (self.meshName == self.ninjaMeshName) then
					self:setState('OnButton')
				end                            					
				return
			elseif (data == 'PokeyProp') then
				self.pokeyHandler:chatterStart(1)
				return
			else
				%Ob.Parent.onItem(self,data,from)
			end
		end
		
		self.caLevelState = Global:load('CALevelState')
		if (not self.caLevelState) then
			self.caLevelState = 1
		end
        
		if self.levelName == 'CABH' then
			self:setState('TalkCABH')
		elseif self.levelName == 'CAGP' then
            self:setState('TalkCAGP')
		elseif self.levelName == 'CAJA' then
			if self.bPlayingTutorial ~= 1 then
				self.bActivated = 1
				self:setState('TalkCAJA')
			end
		else
			self:setState('Activated')
		end
		
	end
		
--*************************************************************************************************

	function Ob:onBasicBraining(data, from)
		%Ob.Parent.onBasicBraining(self,data,from)
		self:sayLine("/CAJA000FO/", 0, 0, nil, 1, nil, 1)  --DIALOG=<<Git that thing away from me!>>
	end
	
--*************************************************************************************************

	function Ob:onTimer(id)
		if (id == self.TIMER_INVISCENSOR) then
			self:killTimer(id)			
			if self.censor.bIsDead ~= 1 or self.wokeUpCensor == 1 then
				self.wokeUpCensor = 1
				self:setState('InvisibilityTutorial')
			else
				self:setState('PostInvisibilityTutorial')
			end
		elseif (id == self.TIMER_CHECKRAZVISIBILITY) then
			self:killTimer(id)			
			if (GetDartInvisibility() == 1 ) then
				if self.bRazInvisible ~= 1 then
					self.bRazInvisible = 1	
					if self.bPlayingTutorial ~= 1 then
						self:sayLine("/CAKJ004FO/", 0, 0, nil, 1, nil, 1)				--DIALOG=<<Hey, not bad! If you didn\'t eat so much garlic I wouldn\'t even know you were here!>>
					else
						self:preReactionInDialogStop()
						self:sayLine("/CAKW004FO/", 0, 0, nil, 1, nil, 1)				--DIALOG=<<Ford Hey, where'd he go?>>
						self:onPostReactionInDialogStart()
					end					 
				end
			else				
				if self.bRazInvisible and self.bRazInvisible == 1 then
					self.bRazInvisible = 0
				end
			end
			self:createTimer(1000, self.TIMER_CHECKRAZVISIBILITY)			
		else
			%Ob.Parent.onTimer(self, id)
		end
	end
	
--*************************************************************************************************
        
	function Ob:onEnteredTriggerVolume(data, from)
		if (from ~= Global.player) then return end
	
		if (data == self.hState7ProxCutsceneVol and Global:load('bFord7JanitorProxPlayed') ~= 1) then
			Global.cutsceneScript:runCutscene('Ford7JanitorProx')
		elseif (data == 'tv_FordIntro' and Global:load('FordIntroSeen') ~= 1) then
			Global.cutsceneScript:runCutscene('FordIntro')
			self:setState(nil)
		elseif data == 'tv_FordBlock' then
			--GamePrint('error: ford block!')
			Global.cutsceneScript:runCutscene('Ford1JanitorProx')
		end
	end
	
--*************************************************************************************************
	
	function Ob:onDone()
	-- don't need to do anything
	end

--*************************************************************************************************

	function Ob:getState()
		if self.overrideState then
			return self.overrideState
		end
		local state = Global:load('CALevelState')
		if (not state) then
			state = 1
		end
		return state
	end

--*************************************************************************************************
	function Ob:stateRedeemBrains()
        if not Global.player.stats.brains then return end
		
		local brains = Global.player.stats.brains
		local brainID = ''
		local status = ''
		local kid = nil
		local name = nil
		local bPlayed = 0
		for k,v in brains do
			brainID = k
			status = v
			if status == 'held' then	-- true if we have found a brain that has been collected but not redeemed yet
                Global.cutsceneScript:fadeToBlack(0)
				-- since we store Brain ID's as all lower case, afnd file name is mixed, we need to account for that
				if brainID == 'jt' then
					name = 'JT'
				else
					name = strupper(strsub(brainID, 1,1)) .. strsub(brainID, 2)	-- need to cap first initial and cat with rest of name
				end
				if not Global.cutsceneScript.kid then
					GamePrint(name)
					Global.cutsceneScript.kid = FindScriptObject(name) or SpawnScript('CA.Characters.' .. name, name,'', 1)
				end

				-- Intro CS before a sequence of brainings.
				if (bPlayed ~= 1) then
					if (Global:load('bRebrainKid1stTimePlayed') ~= 1) then
						Global.cutsceneScript:runCutscene('RebrainKid1stTime', 1)	-- we want it to block us until its done
					elseif RandInt(1, 2) == 1 then
						Global.cutsceneScript:runCutscene('RebrainKid2ndTime', 1)	-- we want it to block us until its done	
					else
						Global.cutsceneScript:runCutscene('RebrainKid3rdTime', 1)	-- we want it to block us until its done	
					end
					bPlayed = 1
				end
				
				-- now run the rebrained cutscene on the kid
                self:makeInvisible()
                local kid = FindScriptObject('Fake'..name)
				kid:killSelf()
				Global.cutsceneScript.kid:show()
				Global.cutsceneScript.kid:runRebrainCutscene()
				self:sendMessage(Global.player, 'BrainRedeemed', Global.cutsceneScript.kid.Name, 1)
        		Global:save('b'..Global.cutsceneScript.kid.Name..'Rebrained', 1)
				Global.cutsceneScript.kid:killSelf()
				Global.cutsceneScript.kid = nil
                -- cutscene sends kid rebrained message otherwise the timming doesnt work right and kid deletes itself at wrong time
				self:makeVisible()
			end
		end
		Global.player:dontRunPlayerControls(1) -- This gets cleared out inside the state
		self:setState('CAJA')
	end
--*************************************************************************************************

	function Ob:stopDialog()
		self.bActivated = 0
	end

	function Ob:returnPlayerToPrevLevel()
		if (Global:loadGlobal('InstaFordLevelToReturn')) then
			-- clear out the level stuff
			local level = Global:loadGlobal('InstaFordLevelToReturn')
			if (level == 'CU') then
				--If the player was last in the CU, then put them back there when they return
				Global:save('teleport', 'PlayerCULocator', 'levelLoad')
				level = 'CASA'
			end
			Global:saveGlobal('InstaFordLevelToReturn', nil)
			Global:saveGlobal('LastBrainingLevel', Global:loadGlobal('InstaFordLastBrainingLevel'))
			Global:saveGlobal('InstaFordLastBrainingLevel', nil)
			EnableRumble(1)
			SetCameraShakeEnable(1)
			HideHUD(0)
			local prefix = strsub(level, 1, 2)
			if prefix == 'CA' then
				if level and Global:load('CALevelState', 'CA') >= 7 and level ~= 'CASA' and level ~= 'CAJA' then
					level = level .. '_NIGHT'
				end
			end
			Global.levelScript:loadNewLevel(level,0,1)
		end
	end

--*************************************************************************************************

	--Flags a dialog node as cleared, so it will not be shown again
	function Ob:clearDialogNode(nodeName)
		Global:save('Dialog'..nodeName..'Cleared', 1)
	end

	--Checks to see if a dialog node should be used
	function Ob:useDialogNode(nodeName)
		return Global:load('Dialog'..nodeName..'Cleared') ~= 1
	end

	--Builds ford's dialog tree for CAJA
	function Ob:getCAJADialogTable()
		--If it's already been built, then return it
		if (self.cajaDialogTreeTable) then
                        return self.cajaDialogTreeTable
                end
	
		local dialog = {}

		if (Global:loadGlobal('InstaFordLevelToReturn')) then
			tinsert( dialog, {
				Name = 'node1_05',
				line = "/GLZA040TO/",--DIALOG=<<I\'m ready to go back into the field.>>
				voice = "/CAKE000RA/",--DIALOG=<<I\'m ready to go back into the field.>>
				animToPlay = 'Anims/DartNew/Talk_1.jan',
				bRemoveSelf = 0,
			} )
		end

		--Create this node to reference is node1_10
		local node1_20 = {
			Name = 'node1_20',
			line = "/GLZA041TO/",--DIALOG=<<What\'s Psitanium?>>
			voice = "/CAKE007RA/",--DIALOG=<<What\'s Psitanium?>>
			animToPlay = 'Anims/DartNew/Talk_2.jan',
			bRemoveSelf = 1,
		}		

		--If node1_10 hasn't played yet, then insert it pointing to node1_20
		if self:useDialogNode('node1_10') then
			tinsert( dialog, {
				Name = 'node1_10',
				line = "/GLZA042TO/",--DIALOG=<<What are you doing here at Whispering Rock?>>
				voice = "/CAKE003RA/",--DIALOG=<<What are you doing here at Whispering Rock?>>
				animToPlay = 'Anims/DartNew/Talk_1.jan',
				rTargetNode = node1_20,
			} )
		elseif self:useDialogNode('node1_20') then
			--If node1_10 already played, then insert node1_20 if it hasn't played yet
			tinsert( dialog, node1_20 )
		end

		--This only plays in CA state 3
		if (Global:load('CALevelState') == 3) and self:useDialogNode('node1_30') then
			tinsert( dialog, {
				Name = 'node1_30',
				line = "/GLZA043TO/",--DIALOG=<<Sasha says I need to learn how to fight better.>>
				voice = "/CAKE012RA/",--DIALOG=<<Sasha says I need to learn how to fight better.>>
				animToPlay = 'Anims/DartNew/Talk_1.jan',
				bRemoveSelf = 1,
			} )
		end

		if self:useDialogNode('node1_40') then
			tinsert( dialog, {
				Name = 'node1_40',
				line = "/GLZA044TO/",--DIALOG=<<I saw you raking leaves. Was that a disguise?>>
				voice = "/CAKE025RA/",--DIALOG=<<I saw you raking leaves. Was that a disguise?>>
				animToPlay = 'Anims/DartNew/Talk_2.jan',
				bRemoveSelf = 1,
			} )
		end

		if self:useDialogNode('node1_50') then
			tinsert( dialog, {
				Name = 'node1_50',
				line = "/GLZA045TO/",--DIALOG=<<So what mission are you on down here?>>
				voice = "/CAKE032RA/",--DIALOG=<<So what mission are you on down here?>>
				animToPlay = 'Anims/DartNew/Talk_3.jan',
				bRemoveSelf = 1,
			} )
		end

		tinsert( dialog, {
			Name = 'node1_60',
			line = "/GLZA046TO/",--DIALOG=<<What does all this equipment do?>>
			voice = "/CAKE036RA/",--DIALOG=<<What does all this equipment do?>>
			animToPlay = 'Anims/DartNew/Talk_2.jan',
			bRemoveSelf = 0,
		} )

		--This is the exit node		
		tinsert( dialog, {
			Name = 'node1_99',
			line = "/GLZA047TO/",--DIALOG=<<I\'d better go. Lots of work to do.>>
			voice = "/CAKE042RA/",--DIALOG=<<I\'d better go. Lots of work to do.>>
			animToPlay = 'Anims/DartNew/Talk_1.jan',
			bRemoveSelf = 0,
			bExitNode = 1,
		} )
		
		--Put post callbacks in that flag the dialog lines as cleared that dissapear
		for name, node in dialog do
			GamePrint(type(node))
			if (type(node) == 'table') and ((node.bRemoveSelf == 1) or (node.rTargetNode) and (not node.postCallback)) then
				local callback = self.getCAJADialogTable
				node.postCallback = self.clearDialogNode
				node.postCallbackArg = node.Name
			end
		end
		
		--Build responses
		local responses = {}

		if (Global:loadGlobal('InstaFordLevelToReturn')) then
		
--  *********** FOR NOW: always return the player to the last position from which you used the bacon
-- 				   TODO: possibly add an option to the bacon to do the same thing 
--
--			if Global:loadGlobal('LastLevel') ~= Global:loadGlobal('InstaFordLevelToReturn') then
--				Global:saveGlobal('InstaFordLevelToReturn', nil)
--				responses.node1_05 = {
--					{ 
--						voice = "/CAKE001FO/", --DIALOG=<<Hey, you wandered off, so I lost the coordinates. What do you think? I got a photographic memory?>>
--						line = "Hey, you wandered off, so I lost the coordinates. What do you think? I got a photographic memory?",
--					},
--				}
--			else
				responses.node1_05 = {
					{ 
						voice = "/CAKE002FO/", --DIALOG=<<Okay, let's see if I remember exactly where you were...>>
						line = "/CAZA010TO/",--DIALOG=<<Okay, let\'s see if I remember exactly where you were...>>
						postCallback = self.returnPlayerToPrevLevel,
					},
				}
--			end
		end

		responses.node1_10 = {
			{ 
				line = 'This training facility is built right smack on top of the largest Psitanium deposit known to man.',
				voice = "/CAKE004FO/", --DIALOG=<<This training facility is built right smack on top of the largest Psitanium deposit known to man.>>
				animToPlay = 'dreamTalk1'
			},
			{
                                line = 'It runs under this whole valley and makes this a very critical area for the Psychonauts, so I\'m here to look after it.',
				voice = "/CAKE005FO/", --DIALOG=<<It runs under this whole valley and makes this a very critical area for the Psychonauts, so I'm here to look after it.>>
				animToPlay = 'dreamIdle'
			},
			{
				line = 'And to make sure you little spoonbenders don\'t kill each other.',
				voice = "/CAKE006FO/", --DIALOG=<<And to make sure you little spoonbenders don't kill each other.>>
				animToPlay = 'Talk2'
			},
		}

		responses.node1_20 = {
			{
				voice = "/CAKE008FO/", --DIALOG=<<Psitanium is very rare, psychoreactive mineral that crashed here on a meteorite hundreds of years ago.>>
				line = 'Psitanium is very rare, psychoreactive mineral that crashed here on a meteorite hundreds of years ago.',
				animToPlay = 'dreamTalk1'
			},
			{
				voice = "/CAKE009FO/", --DIALOG=<<It responds to psychic waves. Focus them, amplifies them. >>
				line = 'It responds to psychic waves. Focus them, amplifies them.',
				animToPlay = 'dreamIdle'
			},
			{
				voice = "/CAKE010FO/", --DIALOG=<<It can make psychics more psychic, but it can also make unstable people more unstable. Not every one can handle that much activity in that part of their brain. It can drive them completely out of their gourd.>>
				line = "It can make psychics more psychic, but it can also make unstable people more unstable. Not every one can handle that much activity in that part of their brain. It can drive them completely out of their gourd.",
				animToPlay = 'talk2'
			},
			{
				voice = "/CAKE011FO/", --DIALOG=<<Gives this valley an interesting history.>>
				line = "Gives this valley an interesting history.",
				animToPlay = 'talk1'
			},
		}

		responses.node1_30 = {
			{
				sCamString = 'Global.cutsceneScript:cutTo(1062,1341,-1689, 10,115,0,65.37)',
				voice = "/CAKE013FO/", --DIALOG=<<He wants to teach you advanced combat? On your first day?>>
				line = "He wants to teach you advanced combat? On your first day?",
				animToPlay = 'Talk1'
			},
			{
				voice = "/CAKE014RA/", --DIALOG=<<Yeah. I had a vision with a huge monster with yellow eyes and a big mouth full of gnashing teeth...>>
				line = "Yeah. I had a vision with a huge monster with yellow eyes and a big mouth full of gnashing teeth...",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/Talk_2.jan',
			},
			{
				sCamString = 'Global.cutsceneScript:cutTo(1062,1341,-1689, 10,115,0,65.37)',  --closeuup
				voice = "/CAKE015FO/", --DIALOG=<<Did it happen to... spit anything at you?>>
				line = "Did it happen to... spit anything at you?",
				animToPlay = 'talk1'
			},
			{
				voice = "/CAKE016RA/", --DIALOG=<<Yeah. I think it was like an old diving helmet or something.>>
				line = "Yeah. I think it was like an old diving helmet or something.",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/Talk_1.jan',
			},
			{
				voice = "/CAKE017FO/", --DIALOG=<<I see. Hmm. Yes, we'd better get you armed.>>
				line = "I see. Hmm. Yes, we\'d better get you armed.",
				animToPlay = 'talk2'
			},
			{
				voice = "/CAKE018RA/", --DIALOG=<<Why? What's happening.>>
				line = "Why? What\'s happening.",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/gesture04.jan',
			},
			{
				voice = "/CAKE019FO/", --DIALOG=<<Nothing. 'Prepare Your Mind,' that's the motto of the Psychonauts.  Here.>>
				line = "Nothing. \'Prepare Your Mind,\' that\'s the motto of the Psychonauts.  Here.",
				animToPlay = 'talk1',
			},
			{
				sCamString = 'Global.cutsceneScript:cutTo(1275,1329,-1532, -3,65,0,104)', --Side Shot
				voice = "/CAKE020FO/", --DIALOG=<<This is a Marksmanship Lerners permit. It will only work when you're in Sasha's mind. >>
				line = "This is a Marksmanship Lerners permit. It will only work when you\'re in Sasha\'s mind.",
				preCallback = self.givePermitAnim,
				postCallback = self.permitFloat,
			},
			{
                                sCamString = 'Global.cutsceneScript:cutTo(1174,1281,-1789, 13,120,0,65.37)', --Ford OTS
				voice = "/CAKE021FO/", --DIALOG=<<Once you complete his shooting range, you'll get the real merit badge and you can PSI Blast anywhere you want.>>
				line = "Once you complete his shooting range, you\'ll get the real merit badge and you can PSI Blast anywhere you want.",
				animToPlay = 'dreamTalk1',
				postCallback = self.giveLearnersPermit,
			},
			{
				voice = "/CAKE022RA/", --DIALOG=<<Thanks. PSI Blast?>>
				line = "Thanks. PSI Blast?",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/talk_2.jan',
			},
			{
				voice = "/CAKE023FO/", --DIALOG=<<You'll find out. Now get going. We can't have the camp overrun with big-eyed, garbage-spitting monsters can we?>>
				line = "You\'ll find out. Now get going. We can\'t have the camp overrun with big-eyed, garbage-spitting monsters can we?",
				animToPlay = 'talk1'
			},
			{
				voice = "/CAKE024RA/", --DIALOG=<<No sir!>>
				line = "No sir!",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/talk_2.jan',
			},
		}

		--This one is a bit of a special case, put the end dialog in first
		responses.node1_40 = {
			{
				voice = "/CAKE029FO/", --DIALOG=<<Er, yes. I have many disguises. It helps me keep an eye on you kids wherever you go.>>
				line = "Er, yes. I have many disguises. It helps me keep an eye on you kids wherever you go.",
				animToPlay = 'Talk2'
			},
			{
				voice = "/CAKE030FO/", --DIALOG=<<When I'm in disguise, I may pretend not to recognize you. Don't blow my cover, okay?>>
				line = "When I\'m in disguise, I may pretend not to recognize you. Don\'t blow my cover, okay?",
				animToPlay = 'dreamTalk1'
			},
			{
				voice = "/CAKE031RA/", --DIALOG=<<Say no more. Your secret identity is safe with me.>>
				line = "Say no more. Your secret identity is safe with me.",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/Talk_3.jan',
			},
		}
		
		--And then insert at the beginning any other of Ford's disguises the player has seen
--TODO: Need to set these flags somewhere
		if (Global:load('bSeenFordPolishCanoe') == 1) then
			local canoe = {
				voice = "/CAKE027RA/", --DIALOG=<<...and polishing a canoe...>>
				line = "...and polishing a canoe...",
				rOwnerOverride = Global.player,			
			}
			tinsert(responses.node1_40, 1, canoe)
		end
		if (Global:load('bSeenFordSweepPorch') == 1) then
			local porch = {
				voice = "/CAKE028RA/", --DIALOG=<<...and sweeping a porch...>>
				line = "...and sweeping a porch...",
				rOwnerOverride = Global.player,			
			},
			tinsert(responses.node1_40, 1, porch)
		end
		if (Global:load('bSeenFordFlipBurgers') == 1) then
			local burgers = {
				voice = "/CAKE026RA/", --DIALOG=<<...and flipping burgers...>>
				line = "...and flipping burgers...",
				rOwnerOverride = Global.player,			
			}
			tinsert(responses.node1_40, 1, burgers)
		end

		responses.node1_50 = {
			{
				voice = "/CAKE033FO/", --DIALOG=<<Well, from here I can monitor world events, look for signs of psychic terrorism, ripples in the astral plane...>>
				line = "Well, from here I can monitor world events, look for signs of psychic terrorism, ripples in the astral plane...",
				animToPlay = 'dreamTalk1',
			},
			{
				voice = "/CAKE034RA/", --DIALOG=<<And then fly out and save the day, right? You've got a jet hidden here somewhere, I'll bet.>>
                                line = "And then fly out and save the day, right? You\'ve got a jet hidden here somewhere, I\'ll bet.",
				rOwnerOverride = Global.player,			
				animToPlay = 'Anims/DartNew/Talk_3.jan',
			},
			{
				voice = "/CAKE035FO/", --DIALOG=<<Well these days I'm really just more of a dispatcher. I spot the trouble and send out a... younger agent. Like Milla or Sasha... or maybe you some day.>>
				line = "Well these days I\'m really just more of a dispatcher. I spot the trouble and send out a... younger agent. Like Milla or Sasha... or maybe you some day.",
				animToPlay = 'talk1',
			},
		}

--TODO: Need to make this pan around all crazy.  Should be a cutscene run in postCallback maybe?  <shrug>
		responses.node1_60 = {
			{
				sCamString = 'Global.cutsceneScript:cutTo(1843,1913,-1808, -38,90,0,119)',
				voice = "/CAKE037FO/", --DIALOG=<<Well, up here it's all intel.>>
				line = "Well, up here it\'s all intel.",
				animToPlay = 'talk2',
			},
			{
				--campath for hallway and inside shot
				sCamString = 'Global.cutsceneScript:camPath( {{xpos = 1660, ypos = 1322, zpos = -2210, xang = 4, yang = 104, zang = 0, field_of_view = 120},{xpos = 797, ypos = 1434, zpos = -2281, xang = 5, yang = 94, zang = 0, field_of_view = 84}},5, 1, 2, 0)',
				voice = "/CAKE038FO/", --DIALOG=<<Down that hallway is the observation room. No tests going on in there right now. Maybe later.>>
				line = "Down that hallway is the observation room. No tests going on in there right now. Maybe later.",
				animToPlay = 'talk1'
			},
			{
                                --campath to machines below
				sCamString = 'Global.cutsceneScript:camPath( {{xpos = 2005, ypos = 1502, zpos = -2543, xang = -13, yang = 121, zang = 0, field_of_view = 114},{xpos = 2171, ypos = 554, zpos = -2543, xang = -16, yang = 115, zang = 0, field_of_view = 115}}, 5, 1, 2, 0)',
				voice = "/CAKE039FO/", --DIALOG=<<And beneath us I have special machines for rebuilding PSI Challenge Markers and detangling Mental Cobwebs.>>
				line = "And beneath us I have special machines for rebuilding PSI Challenge Markers and detangling Mental Cobwebs.",
				animToPlay = 'talk2'
			},
			--[[ 
				Potential alternate in case we add that machine
				{
					voice = "/CAKE040FO/", --DIALOG=<<And beneath us I have special machines for rebuilding PSI Challenge Markers, detangling Mental Cobwebs, and crystallizing Psitanium.>>
					line = "And beneath us I have special machines for rebuilding PSI Challenge Markers, detangling Mental Cobwebs, and crystallizing Psitanium.",
				},
			]]--
			{
				voice = "/CAKE041FO/", --DIALOG=<<You should go familiarize yourself with those. They'll come in pretty handy for you.>>
				line = "You should go familiarize yourself with those. They\'ll come in pretty handy for you.",
			},
		}

		responses.node1_99 = {
			{
				voice = "/CAKE043FO/", --DIALOG=<<Good luck, Razputin!>>
				line = "Good luck, Razputin!",
			}
		}

		--The first time Raz has come here via bacon, give him a hint about returning
		if (Global:loadGlobal('InstaFordLevelToReturn') ~= nil) and (Global:load('bGotFordReturnHint') ~= 1) then
			local line1 = {
				voice = "/GLAE003FO/", --DIALOG=<<Talk to me when you want me to put you back where you were.>>
				line = "Talk to me when you want me to put you back where you were.",
			}
			tinsert(responses.node1_99, 1, line1)
			Global:save('bGotFordReturnHint', 1)
		end


		self.cajaDialogTreeTable = {
		  tInitialTree = dialog,
		  tResponse = responses,
		  sCamString = 'Global.cutsceneScript:cutTo(1265,1317,-1607, 17,76,0,119)',
		  tPlayerPos = {xpos = 992.79, ypos = 1193.5, zpos = -1740.69, yaw = -30},
--		  tPos = { xpos = -624, ypos = -111, zpos = 563, yaw = 26 },
		  defaultAnimToPlay = self.animsTable.dreamIdle
		}

		--Special player and camera position for when Ford is back in the observation room
		if (Global:load('CALevelState') == 7) and (Global:load('bLiliKidnapped') == 1) then
			self.cajaDialogTreeTable.tPlayerPos = {xpos = -3941.185, ypos = 1529.114, zpos = -5192.048, yaw = 90}
			self.cajaDialogTreeTable.sCamString = 'Global.cutsceneScript:cutTo(-3845.3,1657.8,-4908.7, 17.1,4.5,-0.0,132.0)'
			self.cajaDialogTreeTable.tPos = {xpos = -3807.71, ypos = 1529.15, zpos = -5198.31, yaw = -90}

			-- random cam angles
			self.cajaDialogTreeTable.tCamAngles = {
				Dart = {
					--raz over shoulder (of ford):
					'Global.cutsceneScript:cutTo(-3712.3,1697.7,-5040.2, -14.4,47.6,-0.0,82.2)',
					
					--Raz closeup:
					'Global.cutsceneScript:cutTo(-3814.0,1676.1,-5135.7, -13.9,60.0,0.0,82.0)',
				},
				Ford = {
					-- ford closeup:
					'Global.cutsceneScript:cutTo(-3943.8,1675.0,-5127.1, 9.8,-55.1,-0.0,82.0)',
					
					-- ford over shoulder (of raz):
					'Global.cutsceneScript:cutTo(-4022.4,1678.9,-5049.3, -0.4,-48.1,0.0,100.0)',
					
					--Side shot of both:
					'Global.cutsceneScript:cutTo(-3869.4,1879.0,-4857.3, -25.4,1.4,-0.0,131.8)',
				},
			}
		elseif (Global:load('CALevelState') == 7) and (Global:load('bLiliKidnapped') ~= 1) then
			self.cajaDialogTreeTable.tPlayerPos = { xpos = -545, ypos = 1412, zpos = -2175, yaw = -109}
			self.cajaDialogTreeTable.sCamString = 'Global.cutsceneScript:cutTo(-431.4,1545.2,-1702.8, 14.7,20.2,-0.0,132.0)'
			self.cajaDialogTreeTable.tPos = { xpos = -780.46, ypos = 1411.73, zpos = -2201.66, yaw = 89.59 }

			-- random cam angles
			self.cajaDialogTreeTable.tCamAngles = {
				Dart = {
					--raz over shoulder (of ford):
					'Global.cutsceneScript:cutTo(-359.6,1512.3,-1992.4, 16.8,53.4,-0.0,132.0)',
					
					--Raz closeup:
					'Global.cutsceneScript:cutTo(-694.1,1533.6,-2172.4, 10.6,-87.7,-0.0,132.0)',
				},
				Ford = {
					-- ford closeup:
					'Global.cutsceneScript:cutTo(-617.2,1560.3,-2167.5, 20.9,68.0,-0.0,132.0)',
					
					-- ford over shoulder (of raz):
					'Global.cutsceneScript:cutTo(-861.2,1621.4,-2105.4, -2.8,-78.3,-0.0,132.0)',
					
					--Side shot of both:
					'Global.cutsceneScript:cutTo(-431.4,1545.2,-1702.8, 14.7,20.2,-0.0,132.0)',
				},
			}
		else
			-- random cam angles
			self.cajaDialogTreeTable.tCamAngles = {
				Dart = {
					-- ford over shoulder (of raz):
					'Global.cutsceneScript:cutTo(1010,1406,-1480, -20,12,0,75.42)',
					
					--Raz closeup:
					'Global.cutsceneScript:cutTo(976,1341,-1643, -16,-6,0,102.21)',
				},
				Ford = {
					-- ford closeup:
					'Global.cutsceneScript:cutTo(1062,1341,-1689, 10,115,0,65.37)',
					
					--raz over shoulder (of ford):
					'Global.cutsceneScript:cutTo(1174,1281,-1789, 13,120,0,65.37)',
					
					--Side shot of both:
					'Global.cutsceneScript:cutTo(1275,1329,-1532, -3,65,0,104)',
					
					--up high
					'Global.cutsceneScript:cutTo(1843,1913,-1808, -38,90,0,119)',
				},
			}
		end


		return self.cajaDialogTreeTable
	end


--*************************************************************************************************
-- Ford power tutorial functions and states
--*************************************************************************************************
	
-- GENERIC STUFF	
	function Ob:statePowerTutorials()		
		Yield() -- comes in here from another cutscene which is still cleaning up
		if (self.powerName == 'Telekinesis') then
			self:playVideo('cutscenes/prerendered/TelekinesisMeritBadge.xmv')
			MapPowerToButton(kPOWER_TELEKINESIS,kQUICKPICK_BLACK)
			RemoveRankupCheer()
			Global.cutsceneScript:runCutscene('CAJATelekinesisTutorialIntro',1,0,1)
			self:setState('TelekinesisTutorial')
		elseif (self.powerName == 'Invisibility') then
			self:playVideo('cutscenes/prerendered/InvisibilityMeritBadge.xmv')
			MapPowerToButton(kPOWER_INVISIBILITY,kQUICKPICK_BLACK)
			RemoveRankupCheer()
			Global.cutsceneScript:runCutscene('CAJAInvisTutorialIntro',1,0,1)
			self:setState('InvisibilityTutorial')
		elseif (self.powerName == 'Firestarting') then
			self:playVideo('cutscenes/prerendered/FirestartingMeritBadge.xmv')
			MapPowerToButton(kPOWER_FIRESTARTING,kQUICKPICK_BLACK)
			RemoveRankupCheer()
			if self.fireProp1 == nil then
				self:spawnBurnableStuffForTutorial()	
			end
			Global.cutsceneScript:runCutscene('CAJAFirestartingTutorialIntro',1,0,1)
			self:setState('FirestartingTutorial')
		else
			self:setState(nil)
		end
--		self:setState(nil)
	end                    
	
	function Ob:resetAfterTutorialForCE()
		self:setState('NewResetAfterTutorial')
	end
	
	function Ob:stateNewResetAfterTutorial()
		self:setFordPosition(self.lastFordPosition)
		self:setRazPosition(self.lastFordPosition.Name)		
		Global.player.rankPowerManager:powerTaught(self.newPower)
		self.bPlayingTutorial = 0
		Yield()
		Yield()
		local newPower, powerName = Global.player.rankPowerManager:getPowerToBeTaught()
		if newPower == nil then			
			if self.bDontFadeInAfterTutorial == 1 then
				self.bDontFadeInAfterTutorial = nil
			else
				Global.cutsceneScript:fadeIn(1)
			end
			self:setState(nil)
		else
			while (Global.cutsceneScript.cutscenePlaying == 1) do Yield() end
			self.bActivated = 1
			self:setState('CAJA')
		end
			
	end
	
	function Ob:onTutorialComplete()
		if (self.powerName == 'Telekinesis') then
			
			if (self.TKTutorialStage ~= nil) then
--				GamePrint('TK Tutorial Stage: ' .. self.TKTutorialStage)
			end
			if self.TKTutorialStage == self.TKTUTORIAL_FAIL then -- return to beginning, failed 2, or 3
				self:setState('Fail')
			elseif self.TKTutorialStage == self.TKTUTORIAL_WAIT_FOR_PICKUP then
				self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_AIM
				self.bPassedCurrentStage = 0
				if (self.tutorial ~= nil) then
					self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesis2
					self.tutorial:setState('StartTutorial')		
				end
			elseif self.TKTutorialStage == self.TKTUTORIAL_WAIT_FOR_AIM then
				self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_THROW
				self.bPassedCurrentStage = 0
				if (self.tutorial ~= nil) then
					if (self.hoopMode ~= nil) then
						self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisHoop
					else
						self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesis3
					end
					self.tutorial:setState('StartTutorial')		
				end
			elseif self.TKTutorialStage == self.TKTUTORIAL_WAIT_FOR_THROW then
				if (self.censorMode == 3) then
					self:setState('PostTelekinesisTutorial')
				else
					self:setState('Complete')
				end
			end
		elseif (self.powerName == 'Invisibility') then
			self:createTimer(700, self.TIMER_INVISCENSOR)			
		elseif (self.powerName == 'Firestarting') then
			if (self.startedPart2 == 1) then
				self:setState('PostFirestartingTutorial')		
			else
				self:setState('FirestartingTutorialPart2')		
			end
		end					
	end
	
-- TK STUFF
	-- this state is triggered at the beginning of the TK tutorial
	-- it's only run once
	-- it sets up the first tutorial - to pick up the can and throw it
	function Ob:stateTelekinesisTutorial()
		Global.cutsceneScript:fadeIn(0)
		self.hoopMode = nil
		self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_PICKUP
		self:resetTKCanForTutorial()
		self.bPassedCurrentStage = 0
		if (self.tutorial ~= nil) then
			self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesis1
			self.tutorial:setState('StartTutorial')		
		end
        self:setState(nil)							  
	end
	
	function Ob:stateTelekinesisPartTwo()
		self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_PICKUP
		self.bPassedCurrentStage = 0
		self.hoopMode = 1
		self:resetTKCanForTutorial()
		Global.cutsceneScript:runCutscene('CAJATelekinesisTutorialHoopIntro',1,0,1)
		if (self.tutorial ~= nil) then
			self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesis1
			self.tutorial:setState('StartTutorial')		
		end
		self:setState(nil)		
	end

	function Ob:stateComplete()
		if (self.censorMode ~= nil) then
			if (self.censorMode == 2) then
				--if (self.censorSpotted ~= 1) then
				--	GamePrint('censormode2')
				--	Global.player:setPosition(34496.75, -16.44122, -1300.597)
				--	Global.player:setOrientation(0, 84.28131, 0)
				--	Global.player:dontRunPlayerControls(1)
				--	Global.player:setNewAction('Stand')
				--	SetCamera(kCAMERA_SCRIPT)
				--	Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
				--	self:sayLine("/CAKU006FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Yes, see. No time to aim, you mind just reacts! It\'s a combat reflex that could save your life.>>
				--	self:spawnTKCensorForTutorial()					
				--	self.censor:setOrientation(0,-70,0)
				--	self:sayLine("/CAKU007FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Oh, no. Another one of my censors. >>
				--	self:sayLine("/CAKU008FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Now, how\'d that get in here?>>
				--	self:sayLine("/CAKU009FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Looks like we\'re in luck. He doesn\'t see you yet.>>
				--	self:sayLine("/CAKU010FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Why don\'t you smash him on the head with that handy trash can?>>
				--	self:resetTKCanForTutorial()				
				--	self:sayLine("/CAKU011FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<come on!>>
				--	self:sayLine("/CAKU012FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Use telekinesis to pick up the trash can, and throw it at that censor!>>
				--	SetCamera(kCAMERA_CHASE)
				--	Global.player:dontRunPlayerControls(0)
				--	SetEntityInterestLevel(self.censor,0)
				--else
					Global.player:setPosition(34496.75, -16.44122, -1300.597)
					Global.player:setOrientation(0, 84.28131, 0)
					Global.player:dontRunPlayerControls(1)
					Global.player:setNewAction('Stand')
					SetCamera(kCAMERA_SCRIPT)
					self:sleep(.2)
					Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
					self:resetTKCensorForTutorial()										
					self:resetTKCanForTutorial()				
					SetCamera(kCAMERA_CHASE)
					self.TKTutorialStage = TKTUTORIAL_WAIT_FOR_PICKUP
					Global.player:dontRunPlayerControls(0)
				--end
				self.bPassedCurrentStage = 0
				if (self.tutorial ~= nil) then				
					self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisCensor2
					self.tutorial:setState('StartTutorial')		
				end
			else
				self:sleep(.5)
				self:resetTKCanForTutorial()				
				--if (self.censorSpotted == 1) then
				--	Global.player:setPosition(34496.75, -16.44122, -1300.597)
				--	Global.player:setOrientation(0, 84.28131, 0)
				--	Global.player:dontRunPlayerControls(1)
				--	Global.player:setNewAction('Stand')
				--	SetCamera(kCAMERA_SCRIPT)
				--	Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
				--	self:resetTKCanForTutorial()				
				--	SetCamera(kCAMERA_CHASE)
				--	self.censorSpotted = 0
				--	self:resetTKCensorForTutorial()					
				--	self:sayLine("/CAKU005FO/", 1, 0, nil, 1, nil, 1)--DIALOG=<<Okay, let\'s try that again.>>
				--	Global.player:dontRunPlayerControls(0)					
				--else			
					self.censorMode = 2
					Global.cutsceneScript:runCutscene('CAJATelekinesisTutorialCensorIntro',1,0,1)				
				--end
				self.bPassedCurrentStage = 0
				if (self.tutorial ~= nil) then
					--SetEntityInterestLevel(self.censor,0)
					self:resetTKCanForTutorial()
					self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisCensor2
					self.tutorial:setState('StartTutorial')		
				end
			end
			self:setState(nil)			
		elseif (self.hoopMode ~= nil) then
			if self.hoopMode == 3 then
				self.hoopMode = nil
				self.caravanMode = 1
				self.bPassedCurrentStage = 0
				self:resetTKHoopForTutorial()	   
				Global.cutsceneScript:runCutscene('CAJATelekinesisTutorialCaravanIntro',1,0,1)
				self:resetTKCanForTutorial()
				if (self.tutorial ~= nil) then
					self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisCaravan
					self.tutorial:setState('StartTutorial')		
				end
			else
				self.hoopMode = self.hoopMode + 1
				if self.hoopMode == 2 then
					self:sayLine("/CAKT000FO/",0, 1, nil, 1, nil, 1)--DIALOG=<<Great shot. Lets see you do that again!>>
				else
					self:sayLine("/CAKT001FO/",0, 1, nil, 1, nil, 1)--DIALOG=<<Bingo. Okay, last one!>>
				end
				self:resetTKHoopForTutorial()	   
				self:resetTKCanForTutorial()
				self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_THROW
				self.bPassedCurrentStage = 0
				if (self.tutorial ~= nil) then
					self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisHoop
					self.tutorial:setState('StartTutorial')		
				end
			end					
			self:setState(nil)
		elseif (self.caravanMode ~= nil) then
			-- this is a caravan failure case
			-- in order to succeed, we must set censor mode to 1 - this happens inside of TutorialTKProp
			self.bPassedCurrentStage = 0
			self:resetTKCanForTutorial()
			self:sayLine("/CAKS007FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Ooh, be careful now. >>
			if (self.tutorial ~= nil) then
				self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisCaravan
				self.tutorial:setState('StartTutorial')		
			end
			self:setState(nil)
		else
			self:setState('TelekinesisPartTwo')
		end
	end
	
	function Ob:stateFail()
		Global.player:setPosition(34496.75, -16.44122, -1300.597)
		Global.player:setOrientation(0, 84.28131, 0)
		Global.player:dontRunPlayerControls(1)
		Global.player:setNewAction('Stand')
		SetCamera(kCAMERA_SCRIPT)
		Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
		if (self.hoopMode ~= nil) or (self.caravanMode ~= nil) or (self.censorMode ~= nil) then
			self:sayLine("/CAKS007FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<Ooh, be careful now. >>
		else
			self:sayLine("/CAKQ005FO/",1, 0, nil, 1, nil, 1) --DIALOG=<<No, now who said to let that go? Not me!>>
		end
		Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
		SetCamera(kCAMERA_CHASE)
		Global.player:dontRunPlayerControls(0)

		if self.TKCan ~= nil then
			while (self.TKCan.Telekinesis ~= 1) do Yield() end
		end
		self:resetTKCanForTutorial()
		self:resetTKCensorForTutorial()
		self.TKTutorialStage = self.TKTUTORIAL_WAIT_FOR_PICKUP
		self.bPassedCurrentStage = 0
		if (self.tutorial ~= nil) then
			if (self.censorMode == 2) then
				self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesisCensor2
			else
				self.tutorial.curTutorial = self.tutorial.tTutorials.telekinesis1
			end
			self.tutorial:setState('StartTutorial')
		end			
		self:setState(nil)
	end

	function Ob:statePostTelekinesisTutorial()
		self:sleep(1)
		SetEntityVisible(self.TKCan,0)
		Global.goalManager:deactivate('NewPsiPower')
		Global.cutsceneScript:runCutscene('CAJATelekinesisTutorialOuttro',1,0,1)
        self:setState(nil)				
	end

	function Ob:spawnTKCanForTutorial()
 		self.TKCan = SpawnScript('CA.Props.TutorialTKProp','TKProp1', 'self.meshName = \'Levels/MC_MeatCircus/GIOs/ClownCan.plb\'')
		SetEntityVisible(self.TKCan,0)
	end

	function Ob:spawnTKHoopsForTutorial()
		self.TKHoop1 = SpawnScript('CA.Props.TutorialTKHoop','TKHoop1', 'self.meshName = \'Levels/CA_Campgrounds/Props/Hoop.plb\'')
		self.TKHoop2 = SpawnScript('CA.Props.TutorialTKHoop','TKHoop2', 'self.meshName = \'Levels/CA_Campgrounds/Props/Hoop.plb\'')
		self.TKHoop3 = SpawnScript('CA.Props.TutorialTKHoop','TKHoop3', 'self.meshName = \'Levels/CA_Campgrounds/Props/Hoop.plb\'')
	end

	function Ob:resetTKHoopForTutorial()	   
		if self.caravanMode == 1 then
			self.TKHoop3:hideHoop()
		elseif self.hoopMode == 1 then
			self.TKHoop1:setPosition(36217, 10, -1366)
			self.TKHoop1:setOrientation(0,47.5,0)
			self.TKHoop1:showHoop()
		elseif self.hoopMode == 2 then
--			self.TKHoop2:setPosition(36915, 10, -597)			
			self.TKHoop2:setPosition(36900,10,-750)
			self.TKHoop2:setOrientation(0,45,0)
			self.TKHoop2:showHoop()
			self.TKHoop1:hideHoop()
		elseif self.hoopMode == 3 then
			self.TKHoop3:setPosition(36500,10,-900)
			self.TKHoop3:setOrientation(0,58,0)
			self.TKHoop3:showHoop()
			self.TKHoop2:hideHoop()
		end
	end	

	function Ob:resetTKCanForTutorial()
		if self.needNewCan == 1 then
			self.needNewCan = 0
			self:spawnTKCanForTutorial()
		end
		-- we may be holding the can right now... interrupt the powers so that we drop it
		Global.player:interruptPowers()
		if self.TKCan ~= nil then
			local x,y,z = self.TKCan:getPosition()
			GamePrint('resetTKCan current pos X: ' .. x .. ' Y: ' .. y .. ' Z: ' .. z)
			StackTrace()
		end
		if (self.censorMode == 2) then
			-- HACK
			self.TKCan:setPosition(36363.8, 100, -988.933)
			--self.TKCan:setPosition(35738, 100, -1761)
		elseif (self.caravanMode == 1) then
    		self.TKCan:setPosition(35306, 100, -1089)  	
 		elseif (self.hoopMode ~= nil) then
			if self.hoopMode == 1 then
				self.TKCan:setPosition(35738, 100, -1761)
			elseif self.hoopMode == 2 then
				self.TKCan:setPosition(36460, 100, -1165.59)
			elseif self.hoopMode == 3 then
				self.TKCan:setPosition(37132.1, 100, -530.787)
			end
		else 
			self.TKCan:setPosition(35738, 100, -1761)
		end
		SetPhysicsState(self.TKCan, PHYSICSSTATE_ONGROUND, 0)
		SnapEntityToGround(self.TKCan, 1000)
		if (self.censorMode == 1) then
			SetEntityVisible(self.TKCan,0)
		else
			SetEntityVisible(self.TKCan,1)			
		end
	end
	
	function Ob:spawnTKCensorForTutorial()
		self.censor = FindScriptObject('TutorialCensor',1)
		if self.censor == nil then
			self.censor = SpawnScript('CA.Characters.TutorialCensor','TutorialCensor')
		end
        self:resetTKCensorForTutorial()			
	end

	function Ob:resetTKCensorForTutorial()
		self.censor = FindScriptObject('TutorialCensor')
		if (self.censor == nil) then
			self:spawnTKCensorForTutorial()
		end
				
		if self.censor ~= nil then
			if (self.censorMode ~= nil) then
				--SetEntityVisible(self.censor,1)
				self.censor:show()
				SetEntityInterestLevel(self.censor,kENEMY_INTEREST)
				self.censor:setPosition(36426,-17,-1821)
				self.censor:setHomePos(self.censor:getPosition())
				self.censor:setOrientation(0,33,0)
--				self.censor:setOrientation(0,-70,0)
				self.censor:setState('Idle')
				self.censor:setAnim(self.censor.animsTable.Idle)
			else
				--SetEntityVisible(self.censor,0)
				self.censor:hide()
			end
		end
	end

	--function Ob:wakeUpTKCensorForTutorial()
	--	self.censorSpotted = 0
	--	self.censor = FindScriptObject('TutorialCensor')
	--	if self.censor ~= nil then
	--		self.censor.sightRange = 2500 
	--		self.censor.wakeupRadius = 2400 
	--		self.censor.chaseRadius = 2300 
	--		self.censor.forgetRadius = 2400         
	--	end
	--end

-- INVISIBILITY STUFF
	function Ob:stateInvisibilityTutorial()
		Global.cutsceneScript:fadeIn(0)
		if self.wokeUpCensor == 1 then
			if (self.tutorial ~= nil) then
				self.tutorial.curTutorial = self.tutorial.tTutorials.invisibility2
			end
			-- this means raz failed and was seen. reset and do part of the intro scene again
			self.wokeUpCensor = 0
			Global.player:setPosition(34496.75, -16.44122, -1300.597)
			Global.player:setOrientation(0, 84.28131, 0)
			Global.player:dontRunPlayerControls(1)
			Global.player:setNewAction('Stand')
			SetCamera(kCAMERA_SCRIPT)
			Global.cutsceneScript:defaultShot(self)
			self:sayLine("/CAKX000FO/", 1, 0, nil, 1, nil, 1) --DIALOG=<<Okay, let me repeat myself...>>
			if (self.censor.bIsDead ~= 1) then
				self:resetCensorForTutorial()
			else
				self:spawnCensorForTutorial()
			end
			Global.cutsceneScript:cutTo(34261,200,-1124, -16,-73,0)
			self:sayLine("/CAKV006FO/", 1, 0, nil, 1, nil, 1) --DIALOG=<<Here are the rules: take this guy out, but if he sees you at all, you lose.>>
			self:sayLine("/CAKV007FO/", 1, 0, nil, 1, nil, 1) --DIALOG=<<Go get him!>>
			SetCamera(kCAMERA_CHASE)
			Global.player:dontRunPlayerControls(0)
		else
			if (self.tutorial ~= nil) then
				self.tutorial.curTutorial = self.tutorial.tTutorials.invisibility
			end
		end		
		if (self.tutorial ~= nil) then
			self.tutorial:setState('StartTutorial')		
		end
		self:setState(nil)				
	end
	
	function Ob:statePostInvisibilityTutorial()
		self:sleep(1)
		self:restoreAmmoForTutorial()
		Global.goalManager:deactivate('NewPsiPower')
		Global.cutsceneScript:runCutscene('CAJAInvisTutorialOuttro',1,0,1)
        self:setState(nil)				
	end
	
	function Ob:spawnCensorForTutorial()
		self.censor = FindScriptObject('TutorialCensor',1) or SpawnScript('CA.Characters.TutorialCensor','TutorialCensor')
		if self.censor == nil then
			self.censor = SpawnScript('CA.Characters.TutorialCensor','TutorialCensor')
		end
		self.censor.hp = .30
		SetEntityVisible(self.censor,1)
		self.censor.sightRange = 1300 
		self.censor.wakeupRadius = 1100 
		self.censor.chaseRadius = 1100 
		self.censor.forgetRadius = 1200         
		self.censor.bUseSelfDestructTimer = 0        			
		self.censor.wanders = 0
		self:resetCensorForTutorial()
	end

	function Ob:resetCensorForTutorial()
		self.censor = FindScriptObject('TutorialCensor')
		if self.censor ~= nil then
			self.censor:setPosition(36010,-17,-1861)
			self.censor:setOrientation(0,113,0)
			self.censor:setState('Idle')
			self.censor:show()
		end
	end
	
	function Ob:takeAwayAmmoForTutorial()
		if self.savedAmmo == nil then
			self.savedAmmo = Global.player.stats['psiBlastAmmo']
			SetPsiBlastAmmo(0)	
			Global.levelScript:disableGoodie(kGOODIE_PSIBLAST)
		end
	end
	
	function Ob:restoreAmmoForTutorial()
		if (self.savedAmmo ~= nil) then
			Global.player.stats['psiBlastAmmo'] = self.savedAmmo
			SetPsiBlastAmmo(Global.player.stats['psiBlastAmmo'])	
			self.savedAmmo = nil
		end
	end

-- FIRESTARTING STUFF
	function Ob:stateFirestartingTutorial()
		Global.cutsceneScript:fadeIn(0)
		self.startedPart2 = 0
		if (self.tutorial ~= nil) then
			self.tutorial.curTutorial = self.tutorial.tTutorials.firestarting
			self.tutorial:setState('StartTutorial')		
		end
		self:setState(nil)
	end
	
	function Ob:stateFirestartingTutorialPart2()
		self:sleep(2)
		self.startedPart2 = 1
        Global.cutsceneScript:fadeToBlack(.5,1)
		Global.player:setPosition(34496.75, -16.44122, -1300.597)
		Global.player:setOrientation(0, 84.28131, 0)
		Global.player:dontRunPlayerControls(1)
		Global.player:setNewAction('Stand')
		SetCamera(kCAMERA_SCRIPT)
        Global.cutsceneScript:cutTo(34138, 130, -1028, 0, -74, 0, 104)
		Global.cutsceneScript:fadeIn(.1)
		self:sayLine("/CAKN013FO/", 1, 0, nil, 1, nil, 1) --DIALOG=<<Razputin, lock your mental focus on this last one, and hold it while you use your Pyrokinesis power!>>
		SetCamera(kCAMERA_CHASE)
		Global.player:dontRunPlayerControls(0)
		
		self:resetMovingBurnableThing()
		if (self.tutorial ~= nil) then
			self.tutorial.curTutorial = self.tutorial.tTutorials.firestarting2
			self.tutorial:setState('StartTutorial')		
		end
		self:setState(nil)
	end

	function Ob:statePostFirestartingTutorial()
		self:sleep(1)
		Global.goalManager:deactivate('NewPsiPower')
		Global.cutsceneScript:runCutscene('CAJAPKTutorialOuttro',1,0,1)
        self:setState(nil)
	end
	
	
	function Ob:spawnBurnableStuffForTutorial()
 		self.fireProp1 = SpawnScript('CA.Props.TutorialFireProp','FireProp1', 'self.meshName = \'Levels/CA_Campgrounds/Props/Tent.plb\'')
		SetEntityVisible(self.fireProp1,0)
		SetEntityAlpha(self.fireProp1,0,0)
		
		self.fireProp2 = SpawnScript('CA.Props.TutorialFireProp','FireProp2', 'self.meshName = \'Levels/CA_Campgrounds/Props/Tent.plb\'')
		SetEntityVisible(self.fireProp2,0)
		SetEntityAlpha(self.fireProp2,0,0)
		
		self.fireProp3 = SpawnScript('CA.Props.TutorialFireProp','FireProp3', 'self.meshName = \'Levels/CA_Campgrounds/Props/Tent.plb\'')
		SetEntityVisible(self.fireProp3,0)
		SetEntityAlpha(self.fireProp3,0,0)
		
		self.fireProp4 = SpawnScript('CA.Props.TutorialFirePropCar','FireProp4', 'self.meshName = \'Levels/CA_Campgrounds/Props/LionToy.plb\'')
		SetEntityVisible(self.fireProp4,0)
		SetEntityAlpha(self.fireProp4,0,0)
	end
	
	function Ob:dropBurnableStuffForCutscene()
		self.numFireProps = 3
		self.fireProp1:setPosition(35738, -17, -1761)
		self.fireProp1:setOrientation(0,160,0)
		self.fireProp1:setScale(0.7,0.7,0.7)
		SetEntityVisible(self.fireProp1,1)
		SetEntityAlpha(self.fireProp1,1,3)
		self.fireProp2:setPosition(36056, -17, -1421)
		self.fireProp2:setOrientation(0,0,0)
		SetEntityVisible(self.fireProp2,1)
		SetEntityAlpha(self.fireProp2,1,1.5)
		self.fireProp3:setPosition(36275, -17, -1038)
		self.fireProp3:setOrientation(0,-90,0)
		self.fireProp3:setScale(0.85,0.85,0.85)
		SetEntityVisible(self.fireProp3,1)
		SetEntityAlpha(self.fireProp3,1,4.5)
	end

	function Ob:resetBurnableStuffForCutscene()
		self.numFireProps = 3
		self.fireProp1:setPosition(35738, -17, -1761)
		self.fireProp1:setOrientation(0,160,0)
		self.fireProp1:setScale(0.7,0.7,0.7)
		SetEntityVisible(self.fireProp1,1)
		SetEntityAlpha(self.fireProp1,1,0)
		self.fireProp2:setPosition(36056, -17, -1421)
		self.fireProp2:setOrientation(0,0,0)
		SetEntityVisible(self.fireProp2,1)
		SetEntityAlpha(self.fireProp2,1,0)
		self.fireProp3:setPosition(36275, -17, -1038)				   
		self.fireProp3:setOrientation(0,-90,0)
		self.fireProp3:setScale(0.85,0.85,0.85)
		SetEntityVisible(self.fireProp3,1)
		SetEntityAlpha(self.fireProp3,1,0)
	end
	
	function Ob:resetMovingBurnableThing()
		self.numFireProps = 1
		self.fireProp4:setPosition(35738, -17, -1761)
		SetEntityVisible(self.fireProp4,1)
		SetEntityAlpha(self.fireProp4,1,.5)
		self.fireProp4:startMoving()
	end

	function Ob:onFirePropDestroyed(from)	
		if from then
			if from == 'FireProp1' then
				if self.fireProp1 ~= nil then
					self.fireProp1 = nil
					self.numFireProps = self.numFireProps - 1
				end
			elseif from == 'FireProp2' then
				if self.fireProp2 ~= nil then
					self.fireProp2 = nil
					self.numFireProps = self.numFireProps - 1
				end
			elseif from == 'FireProp3' then
				if self.fireProp3 ~= nil then
					self.fireProp3 = nil
					self.numFireProps = self.numFireProps - 1
				end
			elseif from == 'FireProp4' then
				if self.fireProp4 ~= nil then
					self.fireProp4 = nil
					self.numFireProps = self.numFireProps - 1
				end
			end				
		end
		if from ~= 'FireProp4' then
			if self.numFireProps == 2 then
				self:sayLine("/CAKN007FO/", 0, 1, nil, 1, nil, 1) --DIALOG=<<Great! Now burn the rest!>>
			elseif self.numFireProps == 1 then
				self:sayLine("/CAKN008FO/", 0, 1, nil, 1, nil, 1) --DIALOG=<<You\'re getting warmer! Keep going!>>
			else
				if (self.startedPart2 ~= 1) then
					self:sayLine("/CAKN009FO/", 0, 1, nil, 1, nil, 1) --DIALOG=<<Wooo! It\'s getting hot in here!>>
				end
			end		
		end
	end

	function Ob:onDestroyed()
		if (self.rake) then self.rake:killSelf() end
	end
	
	function Ob:numObjectsLeft()
		return self.numFireProps
	end

	function Ob:onDialogTreeStopped()
		self:setAnim(self.animsTable.ninjaIdle)
	end

	-- turn tutorial 'inDialog' on or off if tutorial is running
	function Ob:preReactionInDialogStop()
		if (self.bPlayingTutorial == 1) then
			if (self.tutorial ~= nil) then
				self.tutorial:onInDialogOff()
			end
		end
	end

	-- this one is a message because its called at the end of the dialog line
	function Ob:onPostReactionInDialogStart() 
		if (self.bPlayingTutorial == 1) then
			if (self.tutorial ~= nil) then
				self.tutorial:onInDialogOn()
			end
		end
	end
	
	return Ob
end


