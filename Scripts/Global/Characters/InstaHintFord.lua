function InstaHintFord(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.animsDir = 'Janitor'
		Ob.meshName = 'Characters/JanitorHintSystem.plb'
		Ob.initialState = nil
		Ob.clairFollows = Global.player
		Ob.clairBoundingYaw = 45
		Ob.animsTable = {
			hint_start = {fileName = 'Hint_start', preload = 1, blendTime = 0, loop = 0},
			hint_loop = {fileName = 'Hint_loop', preload = 1, loop = 1},
			hint_end = {fileName = 'Hint_end', preload = 1, loop = 0},
			lookAtRaz = {fileName = 'Hint_LookatRaz_loop', preload = 1, loop = 1, blendTime = 0.2},
		}
		Ob.bActive = 0
		Ob.Confusion = 0
		Ob.charName = 'FordNinja_sayline'
		Ob.nBaconHintUsageAchievementCount = 5
		local hr = Global:loadGlobal('InstaHintFord_HostileRecord') or { }
		Global:saveGlobal('InstaHintFord_HostileRecord', hr )
		local ho = Global:loadGlobal('InstaHintFord_HostileOrder') or { }
		Global:saveGlobal('InstaHintFord_HostileOrder', ho )

		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = { 
				'Global.Effects.FordHintRootFX',
				'Global.Effects.baconPoofFX'
			},
		}
	end

	function Ob:onSpawn()
		--[[
		JLV: Removed this because I don't think we're using it!
		
		--Create global message queue if it doesn't exist.
		if( not Global.fordMessageQueue ) then
			local queue = SpawnScript( 'Global.OtherEntities.FordMessageQueue', 'FordMessageQueue' )
			-- SetEntityDomain( queue, 'MainGame' )	--So that queue can stick around between levels.
			Global.fordMessageQueue = queue
		end
		]]--

		self.enemyMap = self:makeEnemyMap()
		
		%Ob.Parent.onSpawn(self)
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
		SetPhysicsFlag(self,PHYSICS_NOPHYSICS,1)
		SetPhysicsFlag(self,PHYSICS_COLLIDEE,0)
		SetPhysicsFlag(self,PHYSICS_COLLIDER,0)
		SetPhysicsFlag(self,PHYSICS_APPLYGRAVITY,0)
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 0)
		
		SetEntityAnimSpeedScale(self, 1000)
		self.bAtLevelLoad = 1
		self:playAnimCallback(self.animsTable.hint_end, self.attachToRaz, 1)

		Global.levelScript:getPool('Global.Effects.baconPoofFX'):setLowerLimit(1)
		
		-- add self as a spam listener
		Global.player:addSpamListener('DamageDart', self)		
		
		self.fordInSound = LoadSound('FordIn')
		self.baconSound = LoadSound('Bacon')
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		self:setAnim(self.animsTable.hint_end)
	end

	function Ob:onEndLevel()
		Global.player.block = 0
		%Ob.Parent.onEndLevel(self)
	end

	function Ob:onFordIn()
		DebugPrint(self.bAtLevelLoad)
		self:stopSound(self.baconSound)
		if (self.bAtLevelLoad ~= 1) then
			if self.fordInSound then
				self:playSound(self.fordInSound, 0, 0, 1)
			end
		end
	end

	function Ob:enemySawPlayer( class )
		class = gsub(strlower( class ), '%.', '')
		if self.enemyMap[class] then
			local hr = Global:loadGlobal('InstaHintFord_HostileRecord')
			local ho = Global:loadGlobal('InstaHintFord_HostileOrder')
			if nil == hr[class] then
				hr[class] = 1
				tinsert( ho, 1, class )
				Global:saveGlobal('InstaHintFord_HostileRecord', hr )
				Global:saveGlobal('InstaHintFord_HostileOrder', ho )
			end	
		end 

	end

	
	--[[
	JLV: Removed because we don't use this anymore.
	--Faithfully relay all messages to Raz
	function Ob:sayMessages()
		local queue = Global.fordMessageQueue
		local nextMessage = queue:remove()
		while nextMessage do
			local line = nextMessage.voice or nextMessage.text
			self:sayLine( line, 1, 1 )
			nextMessage = queue:remove()
		end
	end
	]]--

	--Makes ford appear out of Raz
	--	bInteractive: If 1, then Ford will initiate dialog, otherwise he will just appear(DEFAULT = 1)
	function Ob:appear(bInteractive)
		self:attachToRaz()
		self.bAtLevelLoad = 0
		self.bActive = 1
		self.bInteractive = bInteractive or 1
		self:setState('Activated')
	end

	function Ob:playEmitter(bOff)
		if (bOff ~= 1) then
			if (not self.emitter) then
				self.emitter = SpawnScript('Global.Effects.FordHintRootFX', self.Name..'Emitter')
			end
			self.emitter:attach(Global.player, 'goggleStrapJARt_1', 1)
		else
			if (self.emitter) then
				self.emitter:stop(1)
			end
		end
	end

	function Ob:getIntroLine()
		local introTable = {	"/GLAD000FO/",--DIALOG=<<Mmmmm, bacon!>>
							"/GLAD001FO/",--DIALOG=<<There\'s that smell again.>>
							"/GLAD002FO/",--DIALOG=<<Deeeelicious.>>
							"/GLAD003FO/",--DIALOG=<<Hey, why don\'t you just take a little nibble of that and see if I can taste it too?>>
							"/GLAD004FO/",--DIALOG=<<Okay, what\'s the situation?>>
							"/GLAD005FO/"--DIALOG=<<*ahem*>>
						}
		local count = Global:loadGlobal('InstaHintFord_IntroCount') or 1
		local line = introTable[count]
	
		if count < 6 then count = count + 1 end
		Global:saveGlobal('InstaHintFord_IntroCount', count )
		
		return line
	end

	function Ob:sayDialogIntroLines()
		if self:isFirstCallSinceNewPsiPower() then
			self:sayLine("/GLAG016FO/", 1, 1)--DIALOG=<<Hey, it looks like you\'re ready to take on a new psychic power!>>
			self:sayLine("/GLAG017FO/", 1, 1)--DIALOG=<<Ready to come back and get your new merit badge?>>
		end
	end

	function Ob:loadCaja()
		Global.player.block = 1
		self:setState('LoadCaja')
	end

	function Ob:stateLoadCaja()
		self:stopTree()
		--stopTree resets block to 0. meanie.
		Global.player.block = 1
		self:disappear()
		Global.player:dontRunPlayerControls(1)	
		self:sleep(.5)
		Global.levelScript:getPool('Global.Effects.baconPoofFX'):get():runThenPool(Global.player:getPosInFrontOf(0, 60))
		self:sleep(0.4)
		Global.cutsceneScript:fadeToWhite(1, 1)
		EnableRumble(1)
		SetCameraShakeEnable(1)
		HideHUD(0)

		--Save the return variables (special case for returning to CU)
		local levelName = GetCurrentLevelName()
		if (levelName == 'CASA') and ( 1 == Global.levelScript.bPlayerInCU) then
			levelName = 'CU'
		end
		Global:saveGlobal('InstaFordLevelToReturn', levelName)
		Global:saveGlobal('InstaFordLastBrainingLevel', Global:loadGlobal('LastBrainingLevel'))
		Global:saveGlobal('LastBrainingLevel', nil)
		Global.levelScript:loadNewLevel('CAJA',0,1)
	end
	

	function Ob:stateActivated()
		self:setUp()
		-- play the anim on the player
		UnLoadPriorityAnim(Global.player, 1)

		Yield()

		--Raz uses the bacon
		if (self.bInteractive == 1) then
			--play the bacon sound
			self:playSound(self.baconSound)
			LoadAnim(Global.player, 'Anims/DartNew/UseBacon.jan', 0.0, 0) 
			--Wait for ford to come out
			for i = 1, 40, 1 do
				Yield()
			end
			self:stopSound(self.baconSound)
		else
			LoadAnim(Global.player, 'Anims/DartNew/FordHint.jan', 0.0, 0) 
		end

		--Ford comes out of Raz's head
		self:playAnimBlocking(self.animsTable.hint_start)

		--Put both in looping animations
		--LoadAnim(Global.player, 'Anims/DartNew/Listen.jan', 0.0, 1) 		
		UnLoadPriorityAnim(Global.player, 1)
		LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',1, 0.2, 1) 		
		self:setAnim(self.animsTable.hint_loop)
		self:setAnim(self.animsTable.lookAtRaz)

		if (self.bInteractive == 1) then
			local ford = nearest_entity_oftype('CA.Characters.Ford')
			if (ford and ford:distance(Global.player) < 3000 and Global:loadGlobal('bPlayedCrazyFordIntro') ~= 1) then
				Global:saveGlobal('bPlayedCrazyFordIntro',1)
				Global.player:sayLine("/CAKZ000RA/",1,1) --Hey, how can you be over there and in my ear at the same time?
				
				self:sayLine("/CAKZ001FO/",1,1)  --Shhh! You'll blow my cover!
				self:sayLine("/CAKZ002FO/",1,1) --That part of my mind is running an under cover operation.
				self:sayLine("/CAKZ003FO/",1,1)  --While another part of my mind is projecting itself into your head here.
				Global.player:sayLine("/CAKZ004RA/",1,1)  --Wow. You can do all that stuff at once?
				self:sayLine("/CAKZ005FO/",1,1)  --Well, you could say my brain is... um, multifaceted.
				self:sayLine("/CAKZ006FO/",1,1)  --Now then...
			else			
				-- say Ford intro line
				self:sayLine(self:getIntroLine(), 1, 1)
			end
			-- give raz any messages that are waiting
			--self:sayMessages()
			-- say Dialog intro lines
			self:sayDialogIntroLines()
			-- show the dialog tree
			self:RebuildHostileTable()
			local table = self:makeDialogTreeTable()
			
			self:startTree(table)
			SetEntityFlag(self.rDialogTreeManager, ENTITY_FULL_SIM_SPEED, 1)
			LoadPriorityAnim(Global.player, 'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',1, 0.2, 1) 		
			
			self:clearFirstCallSinceNewPsiPower()
		end
		self:setState(nil)
	end

	function Ob:forceExit()
		self:setState(nil)
		self:stopTree()
		self:disappear()
	end

	--Makes Ford dissapear
	function Ob:disappear()
		if (self.bActive ~= 1) then
			return
		end
		UnLoadPriorityAnim(Global.player, 1)
		
		self.bInteractive = self.bInteractive or 1
		self.bActive = 0		
		if (self.bInteractive == 1) then
			self:cleanUp()	
		end
		Global.player:replaceSelectedItemInPsack()
		self:playAnimCallback(self.animsTable.hint_end, self.attachToRaz, 1)
		if (self.state_name ~= 'LoadCaja') then
			self:setState(nil)
		end
	end

	function Ob:attachToRaz(bDetach)
		if (bDetach ~= 1) then
			AttachEntityToEntityBone(self, Global.player, 'headJA_1', 0)
			self:makeVisible()
			self:setPosition(16.1, 1.7, -34.2)
			self:setOrientation(-6.463, -87.621, -79.055 )
			self:playEmitter()
		else
			self:playEmitter(1)
			self:makeInvisible()
			DetachEntityFromParent(self)
			SetEntityAnimSpeedScale(self, 1)
		end
	end

	function Ob:setUp()
		--Player setup
		Global.player:stopMelee()
		Global.player:interruptPowers(1)
		Global.player:doNothing()
		SetVelocity(Global.player, 0, 0, 0)
		Global.player:killAllRazFX()         --kill any Raz effects that might be running
		Global.player:setNewAction('Stand')

		if (self.bInteractive == 1) then
			Global.player:dontRunPlayerControls(1)	
			-- do cam setup
			Global.levelScript.camControl:pushAndSetScript(self)
			Global.levelScript.cutsceneScript:oneShot(Global.player, 180, 100, 140, 10, 10)		
			EnableRumble(0)
			SetCameraShakeEnable(0)
			HideHUD(1)
		end
		SetEntityFlag(self.emitter, ENTITY_FULL_SIM_SPEED, 1)
		self.emitter:setFullSim()
	end

	function Ob:cleanUp()
		DebugSetGameSpeed(1)
		SetMotionBlurState(kMOTIONBLURSTATE_STANDARD, 0)
		SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 0)
		SetEntityFlag(self, ENTITY_POST_EFFECTS, 0)
		SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 0)
		-- to resume paused sound
		SoundResumeAll()
		SoundUnmuteCategory(kSOUNDCAT_ALL)
		SetPhysicsFlag(Global.player, PHYSICS_NOPHYSICS, 0)
		if (self.bInteractive) then
			Global.levelScript.camControl:removeCam(self, 1)
			Global.player:dontRunPlayerControls(0)
		end
		EnableLooking(Global.player,1)
		-- set the playanim speed scale back
		if self.iOldAnimSpeedScale then
			SetEntityAnimSpeedScale(Global.player, self.iOldAnimSpeedScale)
		end
	end

	function Ob:isActive()
		return self.bActive
	end

	function Ob:isFirstCallSinceNewPsiPower()
		local lastpower = Global:loadGlobal('InstaHintFord_NewPsiPower')
		local thispower = Global.player.rankPowerManager:getPowerToBeTaught()
		local first = nil
		
		if lastpower ~= thispower and thispower ~= nil then
			first = 1
		end
		
		return first
	end

	function Ob:clearFirstCallSinceNewPsiPower()
		local thispower = Global.player.rankPowerManager:getPowerToBeTaught()
		Global:saveGlobal('InstaHintFord_NewPsiPower', thispower)
	end

	function Ob:changePsiBall(color)
		local rPsiBall = FindScriptObject('ThoughtBubble')
		if (rPsiBall) then
			rPsiBall:changeColor(color)
		end
	end
	
	-- Special Hint for fighting the demon in MMI1
	-- If the player fails enough times, we'll just do these sayLines at full volume to clue the player in
	-- BZ#12642
	function Ob:playDemonHint()
		if (not self.tDemonFailHint) then
			self:makeDemonHintTable()
		end
		self:playDialog(self.tDemonFailHint)
	end
	
	function Ob:makeDemonHintTable()
		self.tDemonFailHint = {
			{line = "/GLAF044FO/", group = 'a', maxPlays = -1, fullVol = 1},--DIALOG=<<You gotta feed them some of their own medicine.>>
			{line = "/GLAF045FO/", group = 'a', maxPlays = -1, fullVol = 1},--DIALOG=<<Avoid their grab attacks and try to hurt them to the point that they split open.>>
			{line = "/GLAF046FO/", group = 'a', maxPlays = -1, fullVol = 1},--DIALOG=<<And then grab any chunks of their victims that you can find--use TK to throw them into the gaping hole and that should choke up it's system.>>
		}
	end

	function Ob:listenerDamageDart()
		if (self:isActive() == 1) then
			self:forceExit()
		end
	end

	function Ob:CheckHintAchievement()
		local nNumBaconHintUsage = Global:loadGlobal('BaconHintUsageCount')
		if nNumBaconHintUsage == nil then
			nNumBaconHintUsage = 0
		else
			nNumBaconHintUsage = tonumber(nNumBaconHintUsage)
		end
		nNumBaconHintUsage = nNumBaconHintUsage + 1
		Global:saveGlobal('BaconHintUsageCount', tostring(nNumBaconHintUsage))
		if nNumBaconHintUsage == self.nBaconHintUsageAchievementCount then
			UnlockAchievement('ACH_BACON_HINT_USAGE')
		end		
	end	

	function Ob:makeDialogTreeTable()
		local table = {}
		table.tResponse = {}
		table.tInitialTree = {}
		
		local maintree = table.tInitialTree
		
		self:makeNewPsiPowerTreeTable( table )
		
		local levelhint = self:getLevelHintResponse()
		if( levelhint ~= nil ) then
			local nHintMaxIndex = getn(levelhint)
			if nHintMaxIndex > 0 then
				levelhint[nHintMaxIndex].postCallback = self.CheckHintAchievement
			end
			tinsert(maintree, {
					Name = 'node1_10',
					line = "/GLZA005TO/",--DIALOG=<<Agent Cruller. Do you have any advice on the current situation?>>
					voice = "/GLAE000RA/"--DIALOG=<<Agent Cruller. Do you have any advice on the current situation?>>
				}
			)

			table.tResponse.node1_10 = levelhint
		end

		--edit removing condition for return to HQ, now possible after entering Meat Circus
		--if Global:loadGlobal('bFordReturnToCAJADisabled') ~= 1 then	
		tinsert(maintree, {
				Name = 'node1_20',
				line = "/GLZA016TO/",--DIALOG=<<I need to regroup back at HQ.>>
				voice = "/GLAE001RA/"--DIALOG=<<I need to regroup back at HQ.>>
			}
		)
	
		table.tResponse.node1_20 = {
			{
				voice = "/GLAE002FO/",--DIALOG=<<Affirmative. Prepare for extraction.>>
				postCallback = self.loadCaja
			}
		}
		--end
		
		self:makeHostileTreeTable( table, maintree )
		
		if Global:loadGlobal('bCanChangePSIBallColor') == 1 and Global.levelScript:getLevelPrefix() ~= 'BV' then
			self:makePsiBallTreeTable( table, maintree )
		end
		
		tinsert( maintree, {
				Name = 'node1_3',
				line = "/GLZA021TO/",--DIALOG=<<Nothing more to report at this time.>>
				voice = "/GLAE009RA/",--DIALOG=<<Nothing more to report at this time.>>
				bExitNode = 1		
			}
		)

		table.tResponse.node1_3 = {
			{
				voice = "/GLAE010FO/",--DIALOG=<<Cruller out.>>
				postCallback = self.disappear
			}
		}	
	
		table.sCamString = 'Global.levelScript.cutsceneScript:oneShot(Global.player, 180, 100, 140, 10, 10)'

		return table
	end

	function Ob:getLevelHintResponse()		
		if 1 == Global.levelScript:isLevelCompleted() then
			return {
				{ voice = "/GLAU003FO/"}--DIALOG=<<Not much to do here except clean up all the cobwebs, collect all the figments, and get any vaults that are left.>>
			}
		else
			return Global.levelScript:getHintResponse()
		end
	end
	
	function Ob:makeNewPsiPowerTreeTable( table )
		if self:isFirstCallSinceNewPsiPower() then
			local ppt = {}
			
			tinsert(ppt, {
					Name = 'node_yes',
					line = "/GLAG018RA/",--<<Yes!>>
					voice = "/GLAG018RA/",--<<Yes!>>
					bExitNode = 1
				}
			)
			
			table.tResponse.node_yes = {
				{
					voice = "/GLAG020FO/",--DIALOG=<<Alrighty then.>>
					postCallback = self.loadCaja
				}
			}

			tinsert(ppt, {
					Name = 'node_no',
					line = "/GLAG019RA/", --<<No. Not yet.
					voice = "/GLAG019RA/", --<<No. Not yet.
					rTargetNode = table.tInitialTree
				}
			)

			table.tResponse.node_no = { 
				{
					voice = "/GLAG020FO/"--DIALOG=<<Alrighty then.>>
				}
			}
			
			table.tInitialTree = ppt
		end
	
	end
	
	function Ob:makeHostileTreeTable( table, parent )
		
		local hostiletree = {}
		
		local state = Global:load('CALevelState', 'CA' ) or 0
		if state >= 3 then
			local ho = Global:loadGlobal('InstaHintFord_HostileOrder')
			foreachi( ho, function(index, type) 
								tinsert( %hostiletree, {	Name = %self.enemyMap[type].name,
															line = %self.enemyMap[type].line,
															voice = %self.enemyMap[type].voice }
								)

								%table.tResponse[%self.enemyMap[type].name] = %self.enemyMap[type].response
							end )

			tinsert( hostiletree, { Name = 'node2_5',
									line = "/GLZA037TO/",--DIALOG=<<You\'ve been very helpful. That\'s all I need.>>
									voice = "/GLAF082RA/",			--DIALOG=<<You\'ve been very helpful. That\'s all I need.>>
									bExitNode = 1 }
			)

			table.tResponse.node2_5 = { {	voice = "/GLAF083FO/",--DIALOG=<<Good luck!>>
											postCallback = self.disappear } }

			tinsert(parent, {
					Name = 'node2_24',
					line = "/GLZA019TO/",--DIALOG=<<Need your analysis on a hostile.>>
					voice = "/GLAE005RA/",--DIALOG=<<Need your analysis on a hostile.>>
					rTargetNode = hostiletree
				}
			)

			table.tResponse.node2_24 = {
				{
					voice = "/GLAE006FO/"--DIALOG=<<What kind?>>
				}
			}
		end
	end

	function Ob:makePsiBallTreeTable(table, parent) 
		local rPsiBall = FindScriptObject('ThoughtBubble')
		if (rPsiBall and rPsiBall.tPsiBallColors) then
			local psiballcolortree = {}
			
			for k, v in rPsiBall.tPsiBallColors do

				tinsert( psiballcolortree, {
								Name = k,
								line = v.line,
								voice = "/GLAY006RA/",
								rTargetNode = parent,
								r = v.r,
								g = v.g,
								b = v.b,
							}
					 )

				table.tResponse[k] = {
					{
						voice = "/GLAH000FO/",--DIALOG=<<Hope that makes you feel pretty. >>
						postCallback = self.changePsiBall,
						postCallbackArg = k
					}
				}
			end

			tinsert( psiballcolortree, { 
						Name = 'PsiBallExit',
						line = "/GLZA020TO/",--DIALOG=<<Nevemind>>
						voice = "/GLAF082RA/",			--DIALOG=<<You\'ve been very helpful. That\'s all I need.>>
						rTargetNode = parent 
					}
			)	

			tinsert(parent, {
					Name = 'node1_26',
					line = "/GLZA007TO/",--DIALOG=<<Can I change the color of my levitation ball?>>
					voice = "/GLAE007RA/",--DIALOG=<<Can I change the color of my levitation ball?>>
					rTargetNode = psiballcolortree
				}
			)
			
			table.tResponse.node1_26 = {
				{	
					voice = "/GLAE008FO/" --DIALOG=<<Like, say... to what?>>
				}
			}
			
		end
	end
	
	function Ob:makeEnemyMap()
		local enemyMap = { }

			enemyMap['mccharactersdemonbunny'] = {
				name = 'node2_10',
				line = "/GLZA012TO/",--DIALOG=<<Hellish bunnies spewed forth from meat grinders? Ring a bell?>>
				voice = "/GLAF080RA/",--DIALOG=<<Hellish bunnies spewed forth from meat grinders? Ring a bell?>>
				response = { { voice = "/GLAF081FO/" } } }--DIALOG=<<At this point, I say just beat the heck out of em. Something like that shouldn\'t even exist!>>
			enemyMap['globalenemiesknifethrower'] = {
				name = 'node2_13',
				line = "/GLZA013TO/",--DIALOG=<<How do I kill that armless guy with the swords in his mouth?>>
				voice = "/GLAF076RA/",--DIALOG=<<How do I kill that armless guy with the swords in his mouth?>>
				response = {	{ voice = "/GLAF077FO/" },--DIALOG=<<Ah youth. I remember the first time I asked that very question.>>
								{ voice = "/GLAF078FO/" },--DIALOG=<<You can\'t kill something like that. But you might be able to use his weapons to your own advantage.>>
								{ voice = "/GLAF079FO/" } }	}--DIALOG=<<Once his swords go into the wall, I\'ll bet you could swing on them in that way you do so well.>>
			enemyMap['bvcharacterswrestlercobra'] = {
				name = 'node2_16',
				line = "/GLZA022TO/",--DIALOG=<<That Cobra wrestler resists attacks.>>
				voice = "/GLAF074RA/",--DIALOG=<<That Cobra wrestler resists attacks.>>
				response = { { voice = "/GLAF075FO/" } } }--DIALOG=<<Yeah, that concentration yap he\'s giving don\'t mean a thing if you can hit him with a nice confusion grenade. While he\'s trying to remember his name, he\'s vulnerable.>>
			enemyMap['bvcharacterswrestlereagle'] = {
				name = 'node2_19',
				line = "/GLZA028TO/",--DIALOG=<<Two words: Ca-caw.>>
				voice = "/GLAF065RA/",--DIALOG=<<Two words: Ca-caw.>>
				response = {	{ voice = "/GLAF066FO/"  },--DIALOG=<<Well, I mean. That\'s really one word isn\'t it?>>
								{ voice = "/GLAF067RA/", rOwnerOverride = Global.player },--DIALOG=<<How are you spelling it?>>
								{ voice = "/GLAF068FO/" },--DIALOG=<<C-a-hyphen-c-a-w.>>
								{ voice = "/GLAF069RA/", rOwnerOverride = Global.player },--DIALOG=<<Oh, well if you\'re going to use a hyphen, I mean-->>
								{ voice = "/GLAF070FO/" },--DIALOG=<<It\'s a hyphenated word. One, hyphenated word. Like half-wit.>>
								{ voice = "/GLAF071RA/", rOwnerOverride = Global.player, prePause = 2000 },--DIALOG=<<Look, are you-->>
								{ voice = "/GLAF072FO/", postPause = 2000 },--DIALOG=<<Watch his shadow, and when you see him coming down, turn on your shield for a real back-breaking landing.>>
								{ voice = "/GLAF073RA/", rOwnerOverride = Global.player } } }--DIALOG=<<Back hyphen breaking. Two words.>>
			enemyMap['bvcharacterswrestlerdragon'] = {
				name = 'node2_20',
				line = "/GLZA024TO/",--DIALOG=<<The Dragon wrester has this roar that glues me to the floor.>>
				voice = "/GLAF063RA/",--DIALOG=<<The Dragon wrester has this roar that glues me to the floor.>>
				response = { { voice = "/GLAF064FO/" } } }--DIALOG=<<That\'s the thing. You gotta be off the floor when that happens. As soon as he starts to let out a roar, you jump as high as you can and PSI Float. Then he can\'t get you.>>
			enemyMap['bvcharacterswrestlertiger'] = {
				name = 'node2_23',
				line = "/GLZA023TO/",--DIALOG=<<That Tiger wrestler\'s got a mean pounce.>>
				voice = "/GLAF060RA/",--DIALOG=<<That Tiger wrestler\'s got a mean pounce.>>
				response = {	{ voice = "/GLAF061FO/" },--DIALOG=<<Yeah, but it\'s not so mean if you shield at the right moment.>>
								{ voice = "/GLAF062FO/" } } }--DIALOG=<<And if you\'re invisible then he\'s just out of luck.>>
			enemyMap['globalenemiessnailcannon'] = {
				name = 'node2_26',
				line = "/GLZA015TO/",--DIALOG=<<How would you really kill a big walking snail with a cannon?>>
				voice = "/GLAF054RA/",--DIALOG=<<How would you really kill a big walking snail with a cannon?>>
				response = {	{ voice = "/GLAF055FO/" },--DIALOG=<<Well, remember you can tumble fast when you\'re using your mental focus...>>
								{ voice = "/GLAF056FO/" },--DIALOG=<<That should help you avoid their cannonballs.>>
								{ voice = "/GLAF057FO/" },--DIALOG=<<And when you get up close, punch them, and when they\'re all sealed up like a pill bug...>>
								{ voice = "/GLAF058FO/" },--DIALOG=<<Light the fuse on their head and see what happens when that cannon goes off inside their armor.>>
								{ voice = "/GLAF059FO/" } } }--DIALOG=<<And when you\'re tired of that, pick them up with TK and throw them in the water. Snails can\'t swim!>>
			enemyMap['thcharactersharpie'] = {
				name = 'node2_29',
				line = "/GLZA026TO/",--DIALOG=<<There are these little mean little Harpies in Gloria\'s Mind...>>
				voice = "/GLAF052RA/",--DIALOG=<<There are these little mean little Harpies in Gloria\'s Mind...>>
				response = { { voice = "/GLAF053FO/" } } }--DIALOG=<<Shoot! Shoot em. Blast them in the head. We\'re trying to save the world here, not start an aviary!>>
			enemyMap['thcharactershound'] = {	
				name = 'node2_30',
				line = "/GLZA027TO/",--DIALOG=<<These hell-hounds keep setting me on fire.>>
				voice = "/GLAF050RA/",--DIALOG=<<These hell-hounds keep setting me on fire.>>
				response = { { voice = "/GLAF051FO/" } } }--DIALOG=<<If a dog did that to me, I\'d shoot it. From a distance. With my PSI Blast.>>
			enemyMap['thcharactersthistle'] = {
				name = 'node2_33',
				line = "/GLZA017TO/",--DIALOG=<<I\'ve got these little thistle girls attacking me.>>
				voice = "/GLAF048RA/",--DIALOG=<<I\'ve got these little thistle girls attacking me.>>
				response = { { voice = "/GLAF049FO/" } } }--DIALOG=<<They\'re only invulnerable while they\'re spinning, but if you can\'t wait, try fire.>>
			enemyMap['globalenemiesdemon'] = {
				name = 'node2_36',
				line = "/GLZA033TO/",--DIALOG=<<What about those creepy guys who pull you under ground?>>
				voice = "/GLAF041RA/",--DIALOG=<<What about those creepy guys who pull you under ground?>>
				response = {	{ voice = "/GLAF042FO/" },--DIALOG=<<Oh, be careful with people\'s nightmares, son.>>
								{ voice = "/GLAF043FO/" },--DIALOG=<<They\'ll pull you into their nightmare world and never let go.>>
								{ voice = "/GLAF044FO/" },--DIALOG=<<You gotta feed them some of their own medicine. >>
								{ voice = "/GLAF045FO/" },--DIALOG=<<Avoid their grab attacks and try to hurt them to the point that they split open.>>
								{ voice = "/GLAF046FO/" },--DIALOG=<<And then grab any chunks of their victims that you can find--use TK to throw  them into the gaping hole and that should choke up it\'s system.>>
								{ voice = "/GLAF047FO/" } } }--DIALOG=<<When it turns to glass you can shatter it with one good punch.>>
			enemyMap['globalenemiescougar'] = {
				name = 'node2_38',
				line = "/GLZA034TO/",--DIALOG=<<What do you do when you hear a cougar?>>
				voice = "/GLAF038RA/",--DIALOG=<<What do you do when you hear a cougar?>>
				response = {	{ voice = "/GLAF039FO/" },--DIALOG=<<Go invisible quick. Those mutant PSI cougars can firestart at quite a distance, but they can\'t burn what they can\'t see.>>
								{ voice = "/GLAF040FO/" } } }--DIALOG=<<And also, if you pick them up with TK you can actually distract them for a little bit, and use that to your advantage.>>
			enemyMap['globalenemiesbear'] = {
				name = 'node2_40',
				line = "/GLZA008TO/",--DIALOG=<<Did you know that this camp has a bear problem?>>
				voice = "/GLAF033RA/",--DIALOG=<<Did you know that this camp has a bear problem? >>
				response = {	{ voice = "/GLAF034FO/" },--DIALOG=<<Not just any bears, but bears that have been mutated by PSI Tanium.>>
								{ voice = "/GLAF035FO/" },--DIALOG=<<Now they know telekinesis!>>
								{ voice = "/GLAF036FO/" },--DIALOG=<<When you see that TK claw come out you have to dodge it quick.>>
								{ voice = "/GLAF037FO/" } } }--DIALOG=<<And PSI Blast those bears from a distance, or set their tails on fire.>>
			enemyMap['locharactersmissilesilo'] = {
				name = 'node2_43',
				line = "/GLZA030TO/",--DIALOG=<<What about a really big turret with shots you couldn\'t dodge?>>
				voice = "/GLAF031RA/",--DIALOG=<<What about a really big turret with shots you couldn\'t dodge?>>
				response = { { voice = "/GLAF032FO/" } } }--DIALOG=<<Shield! After your enemy takes a shot, advance. When you see them about to shoot again, shield up! Get real close that way, and you can take any shot you want.>>
			enemyMap['locharacterselectrotruck'] = {
				name = 'node2_46',
				line = "/GLZA029TO/",--DIALOG=<<Were you watching those Electro Trucks?>>
				voice = "/GLAF029RA/",--DIALOG=<<Were you watching those Electro Trucks?>>
				response = { { voice = "/GLAF030FO/" } } }--DIALOG=<<Yeah, RUN AWAY. That\'s my advice there. PSI Blast them from a distance, or run around the side of them and smack them with you monster claw.>>
			enemyMap['locharactersplane'] = {
				name = 'node2_48',
				line = "/GLZA006TO/",--DIALOG=<<Airplanes can be a pain, can\'t they?>>
				voice = "/GLAF027RA/",--DIALOG=<<Airplanes can be a pain, can\'t they?>>
				response = { { voice = "/GLAF028FO/" } } }--DIALOG=<<Well you gotta shield until you see an opening, and then PSI Blast em out of the sky!>>
			enemyMap['locharacterstank'] = {
				name = 'node2_50',
				line = "/GLZA018TO/",--DIALOG=<<In Lungfishopolis, I\'m really big, but there are these tanks...>>
				voice = "/GLAF023RA/",--DIALOG=<<In Lungfishopolis, I\'m really big, but there are these tanks...>>
				response = {	{ voice = "/GLAF024FO/" },--DIALOG=<<Do what any self-respecting monster would do!>>
								{ voice = "/GLAF025FO/" },--DIALOG=<<Pick them up! Throw them at something! Boom!>>
								{ voice = "/GLAF026FO/" } } }--DIALOG=<<But if you\'re surrounded, don\'t forget your shield. And try to time it right.>>
			enemyMap['globalenemiesconfusionrat'] = {
				name = 'node2_53',
				line = "/GLZA009TO/",--DIALOG=<<Have you ever been confused by a rat?>>
				voice = "/GLAF021RA/",--DIALOG=<<Have you ever been confused by a rat?>>
				response = { { voice = "/GLAF022FO/" } } }--DIALOG=<<All the time, until I figured out that if you firestart them, they don\'t set off a cloud of confusion.>>
			enemyMap['llpropscrayfish'] = {
				name = 'node2_56',
				line = "/GLZA025TO/",--DIALOG=<<The crayfish in the lake are bigger than what we got back home.>>
				voice = "/GLAF018RA/",--DIALOG=<<The crayfish in the lake are bigger than what we got back home.>>
				response = {	{ voice = "/GLAF019FO/" },--DIALOG=<<That\'s the PSI Tanium in the water. Makes a lot of the animals around here a little different.>>
								{ voice = "/GLAF020FO/" } } }--DIALOG=<<At least those crayfish are fun to punch!>>
			enemyMap['llpropssuckerfish'] = {
				name = 'node2_58',
				line = "/GLZA010TO/",--DIALOG=<<Have you ever been grabbed by a sucker fish?>>
				voice = "/GLAF016RA/",--DIALOG=<<Have you ever been grabbed by a sucker fish?>>
				response = { { voice = "/GLAF017FO/" } } }--DIALOG=<<oh, they can give you a nasty hickee. But if you jump twice and spin, you might be able to shake them off a little quicker.>>
			enemyMap['sacharactersmegacensorminion'] = {
				name = 'node2_60',
				line = "/GLZA035TO/",--DIALOG=<<What if there\'s, like, a million, tiny censors. All over you.>>
				voice = "/GLAF013RA/",--DIALOG=<<What if there\'s, like, a million, tiny censors. All over you.>>
				response = {	{ voice = "/GLAF014FO/" },--DIALOG=<<Ah, the Palm Bomb! Just jump up in the air and then punch!>>
								{ voice = "/GLAF015FO/" } } }--DIALOG=<<You\'ll come down so hard those little guys just pop like popcorn!>>
			enemyMap['globalenemiescensorburly'] = {
				name = 'node2_63',
				line = "/GLZA031TO/",--DIALOG=<<What about the really big, burly censors?>>
				voice = "/GLAF010RA/",--DIALOG=<<What about the really big, burly censors?>>
				response = {	{ voice = "/GLAF011FO/" },--DIALOG=<<It\'s best if they can\'t see you, so go invisble when they come around.>>
								{ voice = "/GLAF012FO/" } } }--DIALOG=<<Or burn them, or hit them with a confusion grenade if you\'re going for entertainment value.>>
			enemyMap['globalenemiescensorsniper'] = {
				name = 'node2_65',
				line = "/GLZA032TO/",--DIALOG=<<What about those censors that shoot stuff?>>
				voice = "/GLAF008RA/",--DIALOG=<<What about those censors that shoot stuff?>>
				response = { { voice = "/GLAF009FO/" } } }--DIALOG=<<Oh, you gotta grab those guys with your Mental Focus Lock, then you can jump left or right to avoid their shots, while PSI Blasting them from a distance.>>
			enemyMap['globalenemiescensormelee'] = {
				name = 'node2_66',
				line = "/GLZA014TO/",--DIALOG=<<How do you fight censors?>>
				voice = "/GLAF003RA/",--DIALOG=<<How do you fight censors?>>
				response = {	{ voice = "/GLAF004FO/" },--DIALOG=<<Ah, anything works on those guys. You can punch \'em, PSI Blast \'em...>>
								{ voice = "/GLAF005FO/" },--DIALOG=<<It\'s fun to set fire to them or confuse \'em too. >>
								{ voice = "/GLAF006FO/" },--DIALOG=<<Pick \'em up with TK and throw them. Make your self invisible and sneak up on them. >>
								{ voice = "/GLAF007FO/" } } }--DIALOG=<<Lottsa fun, those guys.>>
			enemyMap['nicharactersattacktendon'] = {
				name = 'node2_68',
 				line = "/GLZA011TO/",--DIALOG=<<Have you ever seen a plant with eyes and teeth?>>
 				voice = "/GLAF000RA/",--DIALOG=<<Have you ever seen a plant with eyes and teeth?>>
 				response = { 	{ voice = "/GLAF001FO/" },--DIALOG=<<Oh, yeah. The kind that\'s impervious to attack when it\'s curled up? Hate those.>>
								{ voice = "/GLAF002FO/"} } }--DIALOG=<<You gotta walk up just close enough to wake them up, and then PSI Blast \'em, real quick!>>
				
		return enemyMap
	end
	
	function Ob:RebuildHostileTable()
		local ho = Global:loadGlobal('InstaHintFord_HostileOrder')
		Global:saveGlobal('InstaHintFord_HostileRecord', {} )
		Global:saveGlobal('InstaHintFord_HostileOrder', {} )
	
		if( ho ) then
			local k = getn( ho )
			while k > 0 do
				self:enemySawPlayer( ho[k] )
				k = k-1
			end
		end
	end

	return Ob
													
end
