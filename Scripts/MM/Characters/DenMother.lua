--
--		"DenMother"
--
--		(c) 2003 Double Fine Productions, Inc.
--		All Rights Reserved.
--		Proprietary and Confidential and Toaster
--		

function DenMother(Ob)
	function construct()
		local Ob = CreateObject('Global.Enemies.BossMain')
		Ob.hp = 12
		Ob.maxHP = 12
		Ob.bLightsAreOff = 0
		Ob.loadedBullets = {}
		Ob.charName = 'DenMother'

		-- Telekinesis
		Ob.Telekinesis			= kTKBEHAVIOR_PICKUP_ONLY_NO_LIFT
		Ob.TK_YOffset			= 370
		Ob.TK_ZOffset			= -10
		Ob.bIsHeavyTK			= 1		-- shake out of TK after a while
				
		Ob.eyeVelocityStraight = 6000

		Ob.eyeVelocityHoming = 1500
		Ob.eyeRotationSpeedHoming = 3000
		
		Ob.TIMER_JUMP_FAILURE = '5001'
		Ob.jumpSpeed = 2500
		Ob.jumpRotateSpeed = 1000

		-- let her clair always track Raz
		Ob.clairBoundingDist = 10000
		Ob.clairBoundingYaw = 10000

		Ob.ATTACK_NORMAL = 1
		Ob.ATTACK_MEGA = 2
		
		Ob.currentJumpPoint = 3		-- the current platform that the den mom is on
		
		-- cookie box pool
		Ob.cookieBoxPool = nil
		Ob.cookieBoxThrowTime = 1.25
		Ob.cookieBoxRotateRate = 400
		
		Ob.standardDomain = 'mmd1DOMAIN'
		Ob.nightVisionDomain = 'mmnvDOMAIN'
		
		--screen coordinates of bar
		Ob.healthBarX = 305
		Ob.healthBarBorderX = 150
		Ob.healthBorderTexture = 'Textures/LevelTextures/MM_MilkmanConspiracy/MM_Healthbar_DenMom.tga'

	
	--***************************FILL IN THESE VARIABLES************************************
		Ob.meshName = 'Characters/DenMother.plb'
	
		--fill in the directory where boss's animations are
		Ob.animsDir = 'DenMother'				
	
		--fill in the table of his animations, for ActionActor functionality
		Ob.animsTable = {
				Damage = { fileName='DM_damage', preload = 1, blendTime = 0.1, loop = 0 },
				LeftFlipStart = { fileName='FlipLf_start', preload = 1, blendTime = 0.1, loop = 0, next='LeftFlipMiddle' },
				LeftFlipMiddle = { fileName='FlipLf_middle', preload = 1, blendTime = 0.1, loop = 1 },
				LeftFlipEnd = { fileName='FlipLf_end', preload = 1, blendTime = 0.1, loop = 0 },
				RightFlipStart = { fileName='FlipRt_start', preload = 1, blendTime = 0.1, loop = 0, next='RightFlipMiddle' },
				RightFlipMiddle = { fileName='FlipRt_middle', preload = 1, blendTime = 0.1, loop = 1 },
				RightFlipEnd = { fileName='FlipRt_end', preload = 1, blendTime = 0.1, loop = 0 },
				Idle = { fileName='DM_CombatIdle', preload = 1, blendTime = 0.1, loop = 1 },
				Throw = { fileName='DM_throwGodseye', preload = 1, blendTime = 0.05, loop = 0 },
				ThrowTwo = { fileName='DM_HandAttack_recover', preload = 1, blendTime = 0.1, loop = 0 },
				ThrowBox = { fileName='ThrowCookieBox', preload = 1, blendTime = 0.1, loop = 0 },
				ThrowAlt = { fileName='DM_throwGodseye2', preload = 1, blendTime = 0.1, loop = 0 },
				Defend = { fileName='DM_defenseBlock', preload = 1, blendTime = 0.05, loop = 0, next='Idle' },
				JumpStart = { fileName='Jump_Start', preload = 1, blendTime = 0.1, loop = 0, next = 'JumpLoop' },
				JumpLoop = { fileName='Jump_Loop', preload = 1, blendTime = 0.05, loop = 1 },
				JumpEnd = { fileName='Jump_End', preload = 1, blendTime = 0.05, loop = 0 },
				TK = { fileName = 'TKShakeOff', preload = 1, blendTime = 0.05, loop = 1, speed = 1.5 },
			}

		Ob.initialState = 'Decide'
	
	--******************************INTERNAL VARIABLES, LEAVE ALONE**************************************
	
		--the current mode the boss is in, set to the table value of the mode (ie self.modes.MODECHASE)
		Ob.currentMode = nil -- nil means no mode set yet, or in the decision state.

		Ob.height = 500
		Ob.bClairvoyancePlayerControl = 1
		Ob.clairFollows = 1
		
		Ob.bSpeakingLine = 0
		
		Ob.tDefaultResponse = {
	
			Activate = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP029RA/", ownerOverride = Global.player} , --DIALOG=<<Hey, how about your Milkman friend just opens the gates to the asylum for me, then he could crawl right back in the fridge afterwards!>>
									{ line = "/MMAP030DM/" }, },},},--DIALOG=<<When he wakes there will be no afterwards!>>
			Flowers = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP034RA/", ownerOverride = Global.player} , --DIALOG=<<I bought you these as a peace offering!>>
									{ line = "/MMAP035DM/" }, },},},--DIALOG=<<All who disturb the Milkman must die!!!>>
			Phone = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP036RA/", ownerOverride = Global.player} , --DIALOG=<<Hey, it\'s the little girls on the phone. They need you upstairs right now!>>
									{ line = "/MMAP037DM/" }, },},},--DIALOG=<<They can handle themselves. So can I.>>
            Plunger = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP038RA/", ownerOverride = Global.player} , --DIALOG=<<Don\'t make me use this!>>
									{ line = "/MMAP039DM/" }, },},},--DIALOG=<<Enough distractions. Time to die!>>
			Sign = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP040RA/", ownerOverride = Global.player} , --DIALOG=<<Stop! Stop jumping around and throwing things!>>
									{ line = "/MMAP041DM/" }, },},},--DIALOG=<<I will if you will. And then you will die!>>
			RollingPin = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP042RA/", ownerOverride = Global.player} , --DIALOG=<<I\'m going to flatten you with this thing.>>
									{ line = "/MMAP043DM/" }, },},},--DIALOG=<<I\'d like to see you try!>>
			Rifle = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP044RA/", ownerOverride = Global.player} , --DIALOG=<<Freeze!>>
									{ line = "/MMAP045DM/" }, },},},--DIALOG=<<Ha! That is the fakest-looking gun I\'ve ever seen!>>
			HedgeTrimmers = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP046RA/", ownerOverride = Global.player} , --DIALOG=<<That hair is coming off lady!>>
									{ line = "/MMAP047DM/" }, },},},--DIALOG=<<Try it and die! Die quicker, I mean!>>
			WaterCan = {			
			   tQuickActivateLines = {
					            { 	{ line = "/MMAP048RA/", ownerOverride = Global.player} , --DIALOG=<<I hope you have a towel, cuz my can is full of water.>>
									{ line = "/MMAP049DM/" }, },},},--DIALOG=<<Your can is going to be full of yarn in a second!>>
			}	
		
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'MM.Props.GodsEye',
			},
			textures = {
				'textures/ui/healthbar.dds',
				'textures/leveltextures/mm_milkmanconspiracy/mm_healthbar_denmom.dds',
				'textures/fxtextures/trail_yarn.dds',
			},
		}	
		return Ob
	end
	if not Ob then
		Ob = construct()
	end
	construct = nil
	
	function Ob:onSpawn()	
		--fill in the enumeration of all modes this boss can be in, add your own.  
		--name is the name of the mode, it is also used to reference the mode, ie (self['mode' .. self.modes[MODECHASE][name]])
		--scriptName is the fully qualified name of the script, used by SpawnScript
		--order is the order in which the modes' decision function will be called, when determining what to do next.  lower numbers 
		--mean that mode's decision function will be called first.
		self.modes = { 
			MODEJUMP = { name = 'Jump', scriptName = 'MM.Characters.DenMotherModeJump', order = 1},
			MODESHOOT = { name = 'Shoot', scriptName = 'MM.Characters.DenMotherModeShoot', order = 2},
		}
		%Ob.Parent.onSpawn(self)
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)

		self.hClairMask = LoadTexture('Textures/LevelTextures/MM_MilkmanConspiracy/DenMom_ClairvoyView.tga')
		SetClairvoyanceMask(self.hClairMask)
		
		-- removed this as it was warning about not finding a light,
		-- also, self.light doesn't seem to be used anywhere.
		--self.light = FindLight(nil, 'Light1')
		
		DomainSleep(self.standardDomain, 0)
		DomainSleep(self.nightVisionDomain, 1)

		SetEntityCollideSphere(self, 150, 0,150,0, 0)
		SetEntityCollideSphere(self, 150, 0,450,0, 1)

		SetMeshIsBackwards(self, 1)
 		SetMaxViewDistance(self, 2000)

		-- scale the DM up
		self:setScale(2.0)
		
		local editvars = constructEditvarString('sParentName', self.Name, 'meshName', 'Characters/CharacterProps/MMDM_GodseyeLf.plb', 'bLoadMeshLockTextures', 1, 'side', 'left')
		self.leftEyePool = Global.levelScript:getPool('MM.Props.DMGodsEye', editvars)
		self.leftEyePool:setLowerLimit(1)
		local editvars = constructEditvarString('sParentName', self.Name, 'meshName', 'Characters/CharacterProps/MMDM_GodseyeLf.plb', 'bLoadMeshLockTextures', 1, 'side', 'left')
		self.rightEyePool = Global.levelScript:getPool('MM.Props.DMGodsEye', editvars)
		self.rightEyePool:setLowerLimit(1)
		
		self.cookieBoxPool = Global.levelScript:getPool('MM.Props.DMCookieBox')
		self.cookieBoxPool:setLowerLimit(1)
		
		self:setAnim(self.animsTable.Idle)
		
		local startPoint = FindScriptObject('DenMotherJump3')
		self:setPosition(startPoint:getPosition())
		self:setOrientation(startPoint:getOrientation())

		-- this was totally botched... i don't think that she's set up to look at stuff
--		SetEntityFlag(self,ENTITY_LOOKATINTERESTINGTHINGS, 1)
--		LookAtEntity(self, Global.player)
--		SetHeadJoint(self, 'headJA_1')

		SetEntityLookOffsetPos(self, 0,250,0)

		Global.player:addSpamListener('Invisibility', self)
		Global.player:addSpamListener('DartDie', self)
		Global.player:addSpamListener('DamageDart', self)
		Global.player:addSpamListener('RazRespawn', self)
		
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		
		self.chatterTable = {
			--{line = "/MMDS001DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<Hiya!>>
			--{line = "/MMDS003DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<Grunt>>
			--{line = "/MMDS004DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<Ha!>>
			--{line = "/MMDS005DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<Eyah!>>
			--{line = "/MMDS006DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<Rainbow Squirts do not negotiate!>>
			--{line = "/MMDS007DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<It's on!>>
			--{line = "/MMDS008DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To promote niceness!>>
			--{line = "/MMDS009DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To make the world prettier!>>
			--{line = "/MMDS010DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To share candy with everyone!>>
			--{line = "/MMDS011DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To obfuscate the true nature of the milkman!>>
			--{line = "/MMDS012DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To protect the milkman at all costs!>>
			--{line = "/MMDS013DM/" ,maxPlays = -1, fullVol = 1, callback = 'LineDone'}, --DIALOG=<<To destroy all who would harm the milkman or threaten to reveal his secret objective!>>
			{line = "/MMAP000DM/", maxPlays = -1, fullVol = 1, filterCode = 'jumping', callback = 'LineDone'}, --DIALOG=<<Hiyah!>> (jumping)
			{line = "/MMAP002DM/", maxPlays = -1, fullVol = 1, filterCode = 'jumping', callback = 'LineDone'}, --DIALOG=<<Hiyup!>> (jumping)
			{line = "/MMAP003DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<God's Eye!>>
			{line = "/MMAP009DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<Ha!>>
			{line = "/MMAP010DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<No milk for you!>>
			{line = "/MMAP011DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<Die!>>
			--TOO LONG! {line = "/MMAP004DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<I made this myself!>>
			--TOO LONG! {line = "/MMAP005DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwEye', callback = 'LineDone'}, --DIALOG=<<Deadly Rainbow Crafts!>>
			{line = "/MMAP006DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<Have some cookies!>>
			{line = "/MMAP007DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<Treats for you!>>
			{line = "/MMAP008DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<This box is free!>>
			{line = "/MMAP009DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<Ha!>>
			{line = "/MMAP010DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<No milk for you!>>
			{line = "/MMAP011DM/", maxPlays = -1, fullVol = 1, filterCode = 'throwCookies', callback = 'LineDone'}, --DIALOG=<<Die!>>
			{line = "/MMAP012DM/", maxPlays = -1, fullVol = 1, filterCode = 'damageRaz', callback = 'LineDone'}, --DIALOG=<<Evil laughter>>
			{line = "/MMAP013DM/", maxPlays = -1, fullVol = 1, filterCode = 'damageRaz', callback = 'LineDone'}, --DIALOG=<<Evil laughter>>
			{line = "/MMAP014DM/", maxPlays = -1, fullVol = 1, filterCode = 'damageRaz', callback = 'LineDone'}, --DIALOG=<<Evil laughter>>
			{line = "/MMAP020DM/", maxPlays = -1, fullVol = 1, filterCode = 'darkTaunt', callback = 'LineDone'}, --DIALOG=<<Over here!>>
			{line = "/MMAP021DM/", maxPlays = -1, fullVol = 1, filterCode = 'darkTaunt', callback = 'LineDone'}, --DIALOG=<<I can see you!>>
			{line = "/MMAP022DM/", maxPlays = -1, fullVol = 1, filterCode = 'damaged', callback = 'LineDone'}, --DIALOG=<<Agh!>>
			{line = "/MMAP023DM/", maxPlays = -1, fullVol = 1, filterCode = 'damaged', callback = 'LineDone'}, --DIALOG=<<Ough-huh!>>
			{line = "/MMAP024DM/", maxPlays = -1, fullVol = 1, filterCode = 'damaged', callback = 'LineDone'}, --DIALOG=<<Gah!>>
			{line = "/MMAP025DM/", maxPlays = -1, fullVol = 1, filterCode = 'damagedClairvoy', callback = 'LineDone'}, --DIALOG=<<Lucky shot!>>
			{line = "/MMAP026DM/", maxPlays = -1, fullVol = 1, filterCode = 'damagedClairvoy', callback = 'LineDone'}, --DIALOG=<<How did you know where I was?>>
			{line = "/MMAP027DM/", maxPlays = -1, fullVol = 1, filterCode = 'damagedClairvoy', callback = 'LineDone'}, --DIALOG=<<Must have heard me breathing...>>
			{line = "/MMAP028DM/", maxPlays = -1, fullVol = 1, filterCode = 'damagedClairvoy', callback = 'LineDone'}, --DIALOG=<<How can he see in the dark?>>
			{line = "/MMAP031DM/", maxPlays = -1, fullVol = 1, filterCode = 'confusion', callback = 'LineDone'}, --DIALOG=<<Ohhhh... oh...>>
			{line = "/MMAP032DM/", maxPlays = -1, fullVol = 1, filterCode = 'invisibility', callback = 'LineDone'}, --DIALOG=<<I know you're in here somewhere>>
			{line = "/MMAP033DM/", maxPlays = -1, fullVol = 1, filterCode = 'firestarting', callback = 'LineDone'}, --DIALOG=<<Ha ha ha ha, nice try!>>
			{line = "/MMAP050DM/", maxPlays = -1, fullVol = 1, filterCode = 'taunt', callback = 'LineDone'}, --DIALOG=<<No time for laughter!  Prepare to die!>>
			{line = "/MMAP001DM/", maxPlays = -1, fullVol = 1, filterCode = 'tk', callback = 'LineDone'}, --DIALOG=<<Geyah!>> (tk)
		}
		
		self.soundCookieBoxThrow = self:loadSound('DenMotherBoxThrow')
		self.soundGodsEyeThrow = self:loadSound('DenMotherGodseyeThrow')
		
		self.chatterHandler = SpawnScript('Global.Util.CharResponseHandler','','',0)
		self.chatterHandler.owner = self
		self.chatterHandler:addDialog(self.chatterTable)
		self.chatterHandler.type = self.chatterHandler.ALWAYS_RANDOM
		
		self:removeGodsEye()
		
		self:setState('Begin')
	end
	
	function Ob:stateBegin()
		--self:sayLine("[You will not get to the milkman!]", 1)		
		self:setHealthBar(1)
		--Global.camControl:setSecondaryTarget(self, kSECONDARYFLAG_DISTANCE_ADJUST, 1)
		
		self:decide()
	end
	
	
	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		self:removeGodsEye()
	end

	
	function Ob:removeGodsEye()
		-- make sure that the player does NOT have the gods eye when the level ends
		local godsEye = FindScriptObject('ClairGodsEye')
		if (godsEye) then
			Global.player:removeFromInventory(godsEye)
			godsEye:killSelf()
		end
	end


	function Ob:onPsiBlast()
		self:takeDamage('psiblast')
	end
	
	function Ob:onNewMoveMelee(data,from)
		self:takeDamage('melee')
  	end
  	
  	function Ob:onCookieBoxExplosion()
  		self:takeDamage('cookiebox')
  	end
  	
  	function Ob:takeDamage(type)
 		if self.bInvulnerable ~= 1 then
		 	if (self.bDead ~= 1 and self.bPaused ~= 1) then
				self.lastDamageType = type
				self:setState('TakeDamage')
			end
		end
  	end
  	
	function Ob:beginStateTakeDamage()
		if Global.player.lastClairTarget == self then
			self.bReenableClairvoyance = 1
		else
			self.bReenableClairvoyance = 0
		end
		
		self:endAllModesSafe()
		Global.player:cancelClairvoyance()
		self.bInvulnerable = 1
		self.modeJump.bNeedJump = 1
		if self.cookieBox then
			self.cookieBox.bDamageDenMother = 0
			self.cookieBox:setState('Explode')
			self.cookieBox = nil
		end
	end
	
	function Ob:stateTakeDamage()
		self:cleanUpProjectiles()
		self.cachedHP = self.hp
		if (self.lastDamageType == 'cookiebox') then
			self.hp = self.hp - 3
		elseif (self.lastDamageType == 'melee') then
			self.hp = self.hp - 2			
		else
			self.hp = self.hp - 1
		end
		self:setHealthBar(max(self.hp,0)/self.maxHP)
		
		local bPlayCutscene = 0
		if (self.hp <= (self.maxHP*0.5) and self.cachedHP > (self.maxHP*0.5)) then
			bPlayCutscene = 1
		end
		
		if (bPlayCutscene ~= 1) and (self.hp > 0) then
			-- play the proper damaged sound
			-- we don't want to play this if we're dead or at half health
			local filter
			if (self.bReenableClairvoyance == 1) and (self.bLightsAreOff == 1) then
				filter = 'damagedClairvoy'
			else
				filter = 'damaged'
			end
			self:sayChatterLine(filter, 1)
		end     
		
		self:playAnimBlocking(self.animsTable.Damage)
		if (bPlayCutscene == 1) then
			Global.cutsceneScript:runCutscene('DenmomLightsOff', 1)
		elseif (self.hp <= 0) then
			self:endAllModes()
			self:setState('Die')
		else
			self:setState(nil)
			self:decide()
		end
	end

	function Ob:lights(bOn)
		if bOn == 1 then
			SetStaticLightIntensity(1)
			SetDynamicLightIntensity(1)
			SetLightRigIntensity(1.0)
			SetLightRigBoost(0.0, 0.0, 0.0)
		else
			SetStaticLightIntensity(0)
			SetDynamicLightIntensity(0)
			SetLightRigIntensity(0.5)			-- reduce the intensity of the rig so the boost looks cool
			SetLightRigBoost(1.0, 0.1, 0.1)		-- red tint for raz
		end
	end
	
	function Ob:postLightsOutSetup()
		DomainSleep(self.standardDomain, 1)
		DomainSleep(self.nightVisionDomain, 0)
		self.bLightsAreOff = 1
		
		-- kill the boss cam
		Global.camControl:setSecondaryTarget(nil)

		-- remove the targeting aura
		SetEntityFlag(self, ENTITY_NO_TARGET_AURA, 1)
		
		if (Global.player.Inventory.ClairGodsEye) then
			HardBreak('Player should not have Gods Eye when the lights turn out!')
		end
		
		-- ok... so that was not what Tim wanted... now we're just spawning the god's eye on the ground
		local godsEye = SpawnScript('MM.Props.GodsEye', 'ClairGodsEye', 'self.ownerName = \''..self.Name..'\'')
		--godsEye:setPosition(21.89999961853027, 120.89999961853027, 973.4000244140625)
		godsEye:setPosition(19.5, 54.3, 689.9)
		godsEye:setOrientation(0, 90, 0)

		-- make sure the player is in the middle of the arena, facing the god's eye
		Global.player:setPosition(0.0, 51.1, 0.0)
		Global.player:setOrientation(0, 0, 0)

		self:decide()
	end
	
	function Ob:postDeathCutscene()
		Global.levelScript:stopLevelTheme()
		self:playVideo('cutscenes/prerendered/mmdd.xmv')
		Global:setLevelToCompleted('MM')
		self:killSelf()
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('ASGR')
	end

	function Ob:stateDie()
        Global.cutsceneScript:runCutscene('DenmomDies', 1)
		
		self:setState(nil)
	end

	function Ob:onDestroyed(bBecause)
		self:lights(1)
		SetEntityAura(Global.player, 0, 0, 0, 0, .1)
		%Ob.Parent.onDestroyed(self, bBecause)
	end

	-- Kills projectiles we readied but didn't throw.
	function Ob:cleanUpProjectiles()
		for i = 1, getn(self.loadedBullets) do
			local bullet = tremove(self.loadedBullets)
			bullet:finished()
		end
	end

	function Ob:onClairvoyance()
		-- don't call the parent... sometimes we want this to be uninterruptable
		--%Ob.Parent.onClairvoyance(self)
		local bUninterruptable = 0
		if (self.bLightsAreOff == 1) then
			bUninterruptable = 1
		end
		
		self:makeInvisible(1)
		Global.player:setClairvoyanceTarget(self, self.clairFollows, bUninterruptable)
		self:dontRunPlayerControls(0)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
				
		SetEntityCollideSphere(self, 250, 0,450,0, 1)
		
		self:lights(1)
		
		SetEntityAura(Global.player, 255,255,32,255, 0.5, 25, 0.5)--, minAlpha[, maxAlpha]]]])
		
		-- we no longer tint the screen red here... it was colliding with the fade inside of the palmBomb code
		--Global.cutsceneScript:fadeToColor(255,0,0,64, 0)
	end
	
	function Ob:onCancelClairvoyance()
		%Ob.Parent.onCancelClairvoyance(self) 
		SetEntityCollideSphere(self, 150, 0,450,0, 1)
		if (self.bLightsAreOff == 1) then
		--if (self.hp <= (self.maxHP*0.5)) and (self.hp > 0) then
			self:lights(0)
		end
		SetEntityAura(Global.player, 0, 0, 0, 0, .1)
		Global.cutsceneScript:fadeToColor(255,0,0,0, 0)
	end

	function Ob:throwBlocking()
		local px, py, pz = Global.player:getPosition()
		RotateTowards2D(self, px, py, pz, 30000)
		if GetPlayerInvisibility() == 1 then return end
		
        self:sayChatterLine('throwEye')
		
		self:playAnimBlocking(self.animsTable.ThrowAlt)
		--self:reload()
		self:setAnim(self.animsTable.Idle)
	end

	function Ob:refreshHeadPosition()
		%Ob.Parent.refreshHeadPosition(self)
		self.headYOff = self.headYOff+60
		self.headZOff = self.headZOff+30
	end

	function Ob:throwHeldBullets()
		self:setState(nil)
		if getn(self.loadedBullets) > 1 then
			self:throwBigBlocking()
		elseif getn(self.loadedBullets) == 1 then
			self:throwBlocking()
		else
			GamePrint('ERROR: DM tried to throw with no ammo.')
			StackTrace()
		end
	end

	
	function Ob:throwBigBlocking()
		local px, py, pz = Global.player:getPosition()
		RotateTowards2D(self, px, py, pz, 30000)
		for i = 1, 5 do
			px, py, pz = Global.player:getPosition()
			self:setAnim(self.animsTable.ThrowAlt)
			self.bThrew = 0
			self:sleep(.2)
			if self.bThrew ~= 1 then
				self:onThrowOne()
				self.bThrew = 2
			end
		end
		self.bThrew = 3
	end

	-- Called from DM_throwGodseye.eve
	function Ob:onThrowOne()
		if self.bPrepping == 1 then
			self.bPrepping = 0
			return
		end
		if self.bThrew == 2 then
			GamePrint('WARNING: doubling up')
			return
		end
		if self.bThrew == 3 then 
			self.bThrew = 0
			return
		end
		self.bThrew = 1
		self:throw('right')
		self.rightEye = nil
	end
	
	function Ob:throw()
		local x, y, z = Global.player:getPosition()
		local eye = tremove(self.loadedBullets)
		
		if not eye then
			GamePrint('WARNING: out of ammo')
			return
		end
		if eye.bAttached == 1 then
			DetachEntityFromParent(eye)
			eye.bAttached = 0
		end
		eye.bIsHoming = 0
		eye.velocity = self.eyeVelocityStraight
		
		self:playSound(self.soundGodsEyeThrow)
		
		if GetPlayerInvisibility() == 1 then 
			eye:launchWithOrientation(self:getOrientation())
		else
			eye:launchAt(Global.player)--, nil, nil, 1)
		end
	end
	
	-- Blocking function, reloads appropriate number of godseyes.
	-- Takes into account whether or not you're in clairview.
	function Ob:prepForAttack(whichAttack)
		self.nextAttack = whichAttack
		for i = 1, getn(self.loadedBullets) do
			tremove(self.loadedBullets):killSelf()
		end
		if whichAttack == self.ATTACK_MEGA then
			-- play an anim to pull out the eyes
			self:setAnim(self.animsTable.Throw)
			self.bPrepping = 1
			self:sleep(.2)
			for i = 1, 5 do
				self:sleep(.05)
				local jx, jy, jz = GetJointWorldPos(self, 'handJEndRt_1')
				local eye = self.leftEyePool:get()
				eye.xOffClair = -35+5*i
				eye.yOffClair = -20-5*i
				eye.zOffClair = -70+3*i
				--eye.xOff = 25*i
				--eye.yOff = -20*i
				--eye.zOff = 5*i-40
				local x, y, z = self:getPosition()
				local pi, ya, ro = InvertOrientation(self:getOrientation())
				eye.xOff, eye.yOff, eye.zOff = RotateVector(pi, ya, ro, jx-x, jy-y, jz-z)
			    eye:setState('Appear')
				tinsert(self.loadedBullets, eye)
				self:stateWaitingToAttack()
			end
		else
			local eye = self.leftEyePool:get()
			eye.xOffClair = -30
			eye.yOffClair = -20
			eye.zOffClair = -70
			eye.xOff = 0
			eye.yOff = 0
			eye.zOff = 0
		    eye:setState('Appear')
			tinsert(self.loadedBullets, eye)
		end
		self:setState('WaitingToAttack')
	end

	function Ob:stateWaitingToAttack()
		if (GetPlayerInvisibility() ~= 1) then
			local x,y,z = Global.player:getPosition()
			RotateTowards2D(self, x,y,z, 400)
		end		
		
		if Global.player.lastClairTarget == self then
			local cx, cy, cz = GetCameraPosition()
			local cpi, cya, cro = GetCameraOrientation()
			for k, v in self.loadedBullets do
				if k ~= 'n' then
					if v.bAttached == 1 then
						DetachEntityFromParent(v)
						v.bAttached = 0
					end
					local x, y, z = RotateVector(cpi, cya, cro, v.xOffClair, v.yOffClair, v.zOffClair)
					v:setPosition(x+cx, y+cy, z+cz)
					v:setOrientation(cpi, cya, cro)
				end
			end
		else
			local x, y, z = self:getPosition()
			local pi, ya, ro = self:getOrientation()
			for k, v in self.loadedBullets do
				if k ~= 'n' then
					if self.nextAttack == self.ATTACK_MEGA then
						local adjustedX, adjustedY, adjustedZ = RotateVector(pi, ya, ro, v.xOff, v.yOff, v.zOff)
						v:setPosition(x+adjustedX, y+adjustedY, z+adjustedZ)
					else
						if v.bAttached ~= 1 then
							AttachEntityToEntityBone(v, self, 'handJEndRt_1')
							--v:setOrientation(0, 70, 0)
							v:setPosition(v.xOff, v.yOff, v.zOff)
							v.bAttached = 1
						end
					end
				end
			end
		end
	end


	-- both of these events are fired by the cookie box throw anim
	function Ob:onCreateCookieBox()
        -- if the Den Mom gets hit in the same frame that this message gets sent, she will be in the TakeDamage state
		-- this produces a cookie box that kind of gets lost in the shuffle and is perpetually in her hand
		-- we have to be in the nil state when we get this message
		if (self.state_name ~= nil) then
			return
		end
		
        self:sayChatterLine('throwCookies')
		
		self.cookieBox = self.cookieBoxPool:get()
		self.cookieBox.xOffClair = 0
		self.cookieBox.yOffClair = -20
		self.cookieBox.zOffClair = 30
		self.cookieBox:setState('Appear')
		AttachEntityToEntityBone(self.cookieBox, self, 'handJEndRt_1')
	end

	function Ob:onThrowCookieBox()
		if not self.cookieBox then return end

        local sx, sy, sz = self.cookieBox:getPosition()
		local dx, dy, dz = self.cookieBoxDest:getPosition()
		
		DetachEntityFromParent(self.cookieBox)
		self.cookieBox:registerLandingSpot(self.cookieBoxDest)
	
		--DrawSphere(sx, sy, sz, 100, 255, 255, 0, 255)
		--DrawSphere(dx, dy, dz, 100, 255, 255, 0, 255)
		
        local fx, fy, fz = GetEntityForwardVector(self)
		local ux, uy, uz = GetEntityUp(self)
		local p, y, r = VectorToEuler(-fx,-fy,-fz, ux,uy,uz)
		
		self.cookieBox:setOrientation(p, y, r)
		
		self.cookieBox:setAnim(self.cookieBox.animsTable.Tumble)
		
		self:playSound(self.soundCookieBoxThrow)
        
		ShootEntityAtTarget(self.cookieBox, sx,sy,sz, dx,dy,dz, self.cookieBoxThrowTime)
		self.cookieBox:setState('Flying')
		self.cookieBox = nil
	end
	

	-- cookie box throw
	function Ob:throwCookieBoxBlocking(dest)
		-- we don't want to throw a cookie box if Raz is really close by... it will look dumb
		if (GetPlayerDist(self) <= 1000.0) then
			return
		end
		
		self.cookieBoxDest = dest
		local dx, dy, dz = self.cookieBoxDest:getPosition()

		RotateTowards2D(self, dx, dy, dz, self.cookieBoxRotateRate, 1)

		self.cookieBox = nil
		self:setAnim(self.animsTable.ThrowBox)
		while (GetAnimCompletion(self) < 1) do
			if (self.cookieBox) then
				if Global.player.lastClairTarget == self then
					local cx, cy, cz = GetCameraPosition()
					local cpi, cya, cro = GetCameraOrientation()
					
					DetachEntityFromParent(self.cookieBox)
					local x, y, z = RotateVector(cpi, cya, cro, self.cookieBox.xOffClair, self.cookieBox.yOffClair, self.cookieBox.zOffClair)
					self.cookieBox:setPosition(x+cx, y+cy, z+cz)
					self.cookieBox:setOrientation(cpi, cya, cro)
				else
					AttachEntityToEntityBone(self.cookieBox, self, 'handJEndRt_1')
					self.cookieBox:setPosition(0,0,0)
				end
			end
			Yield()
		end

		self:setAnim(self.animsTable.Idle)
		
		local px, py, pz = Global.player:getPosition()
		RotateTowards2D(self, px, py, pz, self.cookieBoxRotateRate, 1)
	end



	-- jumping
	function Ob:jumpToBlocking(dest)
		self.bInvulnerable = 1
		local oldTKBehavior = self.Telekinesis
		self.Telekinesis = kTKBEHAVIOR_NONE
		
		-- kill all of the cookie boxes when we jump
		foreach_entity_oftype('MM.Props.DMCookieBox', function(ent) ent:explodeOnDelay() end)
		
		if self.bReenableClairvoyance == 1 then
			self.bReenableClairvoyance = 0
			self:onClairvoyance()
		end
		self.destx, self.desty, self.destz = dest:getPosition()
		
		self:setAnim(self.animsTable.JumpStart)
		
		self.bLanded = 0
		while (self.bLanded == 0) do
			local px, py, pz = Global.player:getPosition()
			RotateTowards2D(self, px, py, pz, self.jumpRotateSpeed)
			Yield()
		end
		
		self:playAnimBlocking(self.animsTable.JumpEnd)
		self:setAnim(self.animsTable.Idle)
 
		self.Telekinesis = oldTKBehavior
		self.bInvulnerable = 0
	end
	
	
	function Ob:onJumpUp()
		local sx, sy, sz = self:getPosition()
		local ux, uy, uz = GetEntityUp(self)
		self.jumpTime = (self:distance(self.destx, self.desty, self.destz) / self.jumpSpeed)
		
		self.jumpSpline = CreateGravitySpline( 16, sx, sy, sz, self.destx, self.desty, self.destz, self.jumpTime, ux, uy, uz)
		UsePath(self.jumpSpline, self, self.jumpTime, kSPLINEPATH_ONCE )
		SplineOrientationFlag(self,0)
		self.lastSplinePoint = tostring(3)
		self.nextToLastSplinePoint = tostring(2)
		self:createTimer((self.jumpTime * 1000) + 1000, self.TIMER_JUMP_FAILURE)
		
        self:sayChatterLine('jumping')
	end

	function Ob:onSplinePointArrive(data,from)
		if data == self.nextToLastSplinePoint then
		elseif ( data == self.lastSplinePoint ) then
			self:killTimer(self.TIMER_JUMP_FAILURE)
			self:setVelocity(0, 0, 0)
			DetachFromSpline(self)
			DestroyPath(self.jumpSpline)
			
			self:setPosition(self.destx, self.desty, self.destz)
			self:setAnim(self.animsTable.JumpEnd)
			self.bLanded = 1
		end
	end
	
	function Ob:onTimer(id)
		if (id == self.TIMER_JUMP_FAILURE) then
			self:killTimer(id)
			GamePrint('Failed to reach end of spline, faking arrival')
			self:onSplinePointArrive(self.nextToLastSplinePoint)
			self:onSplinePointArrive(self.lastSplinePoint)
		else
			%Ob.Parent.onTimer(self, id)
		end
	end

--****************************************************************************************************

	--called when raz goes or ungoes invis
	function Ob:listenerInvisibility(bRazInvis)
		if (bRazInvis == 1) then
			--self:sayLine("/MMAP032DM/",0,1,nil,1)--DIALOG=<<I know you\'re in here somewhere!>>
            self:sayChatterLine('invisibility')
		end
	end

--****************************************************************************************************

	function Ob:listenerRazRespawn()
		GamePrint("DART RESPAWN!")
		
		if (self.state_name ~= 'WaitForDeath') then
			self:endAllModes()
			self:setState('WaitForRespawn')
		end
	end
	
	function Ob:stateWaitForRespawn()
		while (Global.player.respawnMilestone ~= Global.player.RESPAWN_FADEDTOBLACK) do
			Yield()
		end
		
		-- faded to black
		-- select the god's eye from raz's inventory if he has it
		local godsEye = FindScriptObject('ClairGodsEye')
		if (godsEye) then
			if (Global.player:isInInventory('ClairGodsEye') == 1) then
				local bForce = 1
				local bHurry = 1
				Global.player:replaceSelectedItemInPsack(bForce, bHurry)
				Global.player:setSelectedItem('ClairGodsEye', bHurry)				
			end
		end
		
		while (Global.player.respawnMilestone ~= Global.player.RESPAWN_DEATHSEQUENCEDONE) do
			Yield()
		end
		
		self:decide()
	end
	


	function Ob:listenerDartDie()
		GamePrint("DART DEATH!")
		
		self:endAllModes()
		
		self:setState('WaitForDeath')
	end
	

	function Ob:stateWaitForDeath()
		self.bInvulnerable = 1
		self:setAnim(self.animsTable.Idle)
		while (Global.player.respawnMilestone < Global.player.RESPAWN_FADEDTOBLACK) do
			Yield()
		end
		
		-- faded to black, reset position
		self:resetBattle()
		while (Global.player.respawnMilestone < Global.player.RESPAWN_DEATHSEQUENCEDONE) do
			Yield()
		end
		-- all done start attacking again
		self:decide()
	end
	
	function Ob:resetBattle()
		self.hp = self.maxHP
		self:setHealthBar(self.hp/self.maxHP)
		self.bLightsAreOff = 0
		
		self.bInvulnerable = 0

		local startPoint = FindScriptObject('DenMotherJump3')
		self:setPosition(startPoint:getPosition())
		self:setOrientation(startPoint:getOrientation())
		self.currentJumpPoint = 3
		
		-- turn the lights on
		self:lights(1)
		
		-- remove the gods eye from the level
		self:removeGodsEye()
		
		-- set domains correctly		
		DomainSleep(self.standardDomain, 0)
		DomainSleep(self.nightVisionDomain, 1)
		
		-- replace the boss cam
		Global.camControl:setSecondaryTarget(nil)
		Global.camControl:pushAndSetChase(Global.levelScript, 500, 10, 200, 150)
		Global.camControl:setSecondaryTarget(self, nil, 0)
		SetChaseCameraAutoRotateRange(1, 90)		
		
		-- make sure the aura is back
		SetEntityFlag(self, ENTITY_NO_TARGET_AURA, 0)
		
		-- kill all of the existing cookie boxes
		foreach_entity_oftype('MM.Props.DMCookieBox', function(ent) ent:cleanUp() end)
	end

--****************************************************************************************************

	function Ob:listenerDamageDart()
        self:sayChatterLine('damageRaz')
	end

--****************************************************************************************************

	function Ob:onFireAbort()
		%Ob.Parent.onFireAbort(self)
		
        self:sayChatterLine('firestarting')
	end

--****************************************************************************************************

    function Ob:sayChatterLine(filter, priority)
		-- sending in a priority=1 will override the current line
		if (self.bSpeakingLine == 1 and priority ~= 1) then
			return
		end
		
		self.bSpeakingLine = 1
		if (filter) then 
			self.chatterHandler:setFilter(filter)
		else
			GamePrint('WARN: did you mean to pass in a filter?')
		end
		self.chatterHandler:sayNextLine()
	end
	
	function Ob:onLineDone()
		self.bSpeakingLine = 0
	end
	
--****************************************************************************************************	
	
	function Ob:onTKPickup()
		%Ob.Parent.onTKPickup(self)
		
        self:sayChatterLine('tk')
        
		if self.cookieBox then
			self.cookieBox.bDamageDenMother = 0
		end
		
		self:endAllModes()
		self:setAnim(self.animsTable.TK)
	end
	
--****************************************************************************************************	
	
	function Ob:onTKRelease()
		%Ob.Parent.onTKRelease(self)
		
		self:setAnim(self.animsTable.Idle)
		self:decide()
	end

	return Ob
end

