-- Now takes a texture name as an editvar -- this is the polaroid sprite that will be shown
-- when the brainjar is taken.
-- Ex. self.photo = 'Textures/Collectibles/CO_brainPolaroidMilka.tga'
--************************************************************************************************* 

function Brain(Ob)

	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.dependencies = {
			scripts = {	'Global.Effects.CollectFX', },
--			meshes = {  },
			textures = { 'Textures/icons/InventoryItems/BrainJar.dds' },	
		}
		
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/brainPup.plb'
		Ob.bPersistentMesh = 0 -- Don't hold on to mesh when level changes.
		
		--	make brain telekinetic-able
		Ob.Telekinesis = 1
		Ob.TK_XOffset = 0
		Ob.TK_YOffset = 55
		Ob.TK_ZOffset = 0
		Ob.TK_CloseFactor = 0.8	
		
		Ob.TK_INTERP_TO_PLAYER_TIME = 1
    
		Ob.collSphereRadius = 100
	
		Ob.level = 'all'
		
		Ob.displayNames = {
			--edits to make names appear in all levels. *STILL NEEDS LOCALIZATION*
			Bobby = "Bobby's Brain", --DIALOG=<<Bobby\'s Brain>>
			--Bobby = "/ASZB007TO/", --DIALOG=<<Bobby\'s Brain>>
			Dogen = "Dogen's Brain", --DIALOG=<<Dogen\'s Brain>>
			--Dogen = "/ASZB008TO/", --DIALOG=<<Dogen\'s Brain>>
			Benny = "Benny's Brain", --DIALOG=<<Benny\'s Brain>>
			--Benny = "/ASZB009TO/", --DIALOG=<<Benny\'s Brain>>
			Elka = "Elka's Brain", --DIALOG=<<Elka\'s Brain>>
			--Elka = "/ASZB010TO/", --DIALOG=<<Elka\'s Brain>>
			Kitty = "Kitty's Brain", --DIALOG=<<Kitty\'s Brain>>
			--Kitty = "/ASZB011TO/", --DIALOG=<<Kitty\'s Brain>>
			Chloe = "Chloe's Brain", --DIALOG=<<Chloe\'s Brain>>
			--Chloe = "/ASZB012TO/", --DIALOG=<<Chloe\'s Brain>>
			Franke = "Franke's Brain", --DIALOG=<<Franke\'s Brain>>
			--Franke = "/ASZB013TO/", --DIALOG=<<Franke\'s Brain>>
			JT = "J.T.'s Brain", --DIALOG=<<J.T.\'s Brain>>
			--JT = "/ASZB014TO/", --DIALOG=<<J.T.\'s Brain>>
			Quentin = "Quentin's Brain", --DIALOG=<<Quentin\'s Brain>>
			--Quentin = "/ASZB015TO/", --DIALOG=<<Quentin\'s Brain>>
			Vernon = "Vernon's Brain", --DIALOG=<<Vernon\'s Brain>>
			--Vernon = "/ASZB016TO/", --DIALOG=<<Vernon\'s Brain>>
			Milka = "Milka's Brain", --DIALOG=<<Milka\'s Brain>>
			--Milka = "/ASZB017TO/", --DIALOG=<<Milka\'s Brain>>
			Crystal = "Crystal's Brain", --DIALOG=<<Crystal\'s Brain>>
			--Crystal = "/ASZB018TO/", --DIALOG=<<Crystal\'s Brain>>
			Clem = "Clem's Brain", --DIALOG=<<Clem\'s Brain>>
			--Clem = "/ASZB019TO/", --DIALOG=<<Clem\'s Brain>>
			Nils = "Nils' Brain", --DIALOG=<<Nils\' Brain>>
			--Nils = "/ASZB020TO/", --DIALOG=<<Nils\' Brain>>
			Maloof = "Maloof's Brain", --DIALOG=<<Maloof\'s Brain>>
			--Maloof = "/ASZB021TO/", --DIALOG=<<Maloof\'s Brain>>
			Mikhail = "Mikhail's Brain", --DIALOG=<<Mikhail\'s Brain>>
			--Mikhail = "/ASZB022TO/", --DIALOG=<<Mikhail\'s Brain>>
			Phoebe = "Phoebe's Brain", --DIALOG=<<Phoebe\'s Brain>>
			--Phoebe = "/ASZB023TO/", --DIALOG=<<Phoebe\'s Brain>>
			Elton = "Elton's Brain", --DIALOG=<<Elton\'s Brain>>
			--Elton = "/ASZB024TO/", --DIALOG=<<Elton\'s Brain>>
			Chops = "Chops' Brain", --DIALOG=<<Chops\' Brain>>
			--Chops = "/ASZB025TO/", --DIALOG=<<Chops\' Brain>>
		}
		
		Ob.razQuips = {
			Bobby = "/ASBD003RA/", --DIALOG=<<Bobby Ziltch? I didn\'t know you had a brain Heh. Man, I wish you were here for that joke, Bobby.>>
			Dogen = "/ASBD004RA/", --DIALOG=<<Dogen Boole! I told you I\'d get your brain back!>>
			Benny = "/ASBD005RA/", --DIALOG=<<Benny. Huh. I thought it would be smaller.>>
			Elka = "/ASBD006RA/", --DIALOG=<<Elka Doom. Maybe I should let J.T. have some time alone before I return this brain.>>
			Kitty = "/ASBD007RA/", --DIALOG=<<Kitty\'s brain. You know, I hate to say it, but it IS better groomed than the rest of the brains. >>
			Chloe = "/ASBD008RA/", --DIALOG=<<How Chloe sneezed this one through that helmet we\'ll never know.>>
			Franke = "/ASBD009RA/", --DIALOG=<<Don\'t worry Franke. I\'ll put this one right next to Kitty\'s.>>
			JT = "/ASBD010RA/", --DIALOG=<<J.T.\'s brain? How\'d this little dogie get out of the pen?>>
			Quentin = "/ASBD011RA/", --DIALOG=<<Yo, Quentin. Good to see your brain again.>>
			Vernon = "/ASBD012RA/", --DIALOG=<<How can something as small as Vernon\'s brain hold so many boring stories?>>
			Milka = "/ASBD013RA/", --DIALOG=<<I\'m surprised Milka\'s brain doesn\'t go invisible when I get close to it.>>
			Crystal = "/ASBD014RA/", --DIALOG=<<Yay! Woo! Crystal\'s brain! Let\'s hear it for thinking!>>
			Clem = "/ASBD015RA/", --DIALOG=<<Clem\'s brain! Three cheers for brains! >>
			Nils = "/ASBD016RA/", --DIALOG=<<To think that every cell in Nils\' brain is dedicated to the ladies . . .>>
			Maloof = "/ASBD017RA/", --DIALOG=<<Better give Maloof\'s brain to Mikhail ASAP so he can protect it.>>
			Mikhail = "/ASBD018RA/", --DIALOG=<<Welcome back to the thinking world, Mikhail.>>
			Phoebe = "/ASBD019RA/", --DIALOG=<<Huh. Phoebe\'s brain is warmer than the others\'.>>
			Elton = "/ASBD020RA/", --DIALOG=<<Elton, what can I tell you--you were right. The old legends were true.>>
			Chops = "/ASBD021RA/", --DIALOG=<<Chops. What is up, eh?>>
		}
	end
	
--************************************************************************************************* 

	function Ob:onBeginLevel()	  
		-- for legacy brains
		if( not self.who ) then
			local prefixLoc = strfind(self.Name, 'Brain')
			if( prefixLoc ~= 1 ) then
				GamePrint('Couldn\'t get brain name from '..self.Name)
				killSelf()
				return
			end
			self.who = strsub(self.Name, 6)
		end

		self.pickupSpriteName = 'CO_brainPolaroid'..self.who
		self.displayName = self.displayNames[ self.who ]
		%Ob.Parent.onBeginLevel(self)

		self.pickUpSound = LoadSound('Sounds/FX/COsounds/powerUpCreate.wav')
		self.powerupSound = LoadSound('Sounds/FX/COsounds/poweruprecieved.wav')
		
		self:setEntityInterestLevel(kBRAIN_INTEREST)
		self.rCollectedSoundHandle = LoadSound('KidsBrain')
		SetEntityVisible(self,1)
		SetEntityAlpha(self,1,0)
		self:setState(nil)
	end                                               
	

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel( self )
		--This has to be in onPostBeginLevel because raz gets brains in Dart:onBeginLevel (in preparePlayer())
		if (Global.player.stats.brains[strlower(self.who)] ~= nil) then
			self:killSelf()			
		end
	end

	function Ob:addToInventory()
		--Set brain as no longer pickupable
		self.beNotPickupable(self)
		
		--Send message to player object that brain was received
		self:sendMessage(Global.player, 'Brain', strlower(self.who), 1)

		--Enter a state for the sequence kissing it and putting it away.		
		Global.cutsceneScript.currentBrain = self

		--TODO here: find out what in cutscene blocks the word display, and Stop it for this scene
		local bFreezeCam = (Global:load('bASBQRebrainingHintPlayed') ~= 1) --Freeze cam if running hint CS
		--edit remove
		--Global.cutsceneScript:runCutscene('KissBrain', 0, bFreezeCam, 1, 0)
		self:setState('KissBrain')
	end

	function Ob:onItem(itemName, from)
		if itemName == '' then
			local emitter = Global.levelScript:getPool('Global.Effects.CollectFX'):get()
			emitter:attach(Global.player)
			emitter:runThenPool()
			self:addToInventory()
		end
	end
	
	
	--Play kissing animation
	function Ob:stateKissBrain()		   
		-- Motion-blurred fade to black, showing only raz and brain
		--edit remove effects
		--[[
		SetMotionBlurState(kMOTIONBLURSTATE_FADE_TO_BLACK, 1.5)
		SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 1)
		SetEntityFlag(self, ENTITY_POST_EFFECTS, 1)
		SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 1)
		]]
		--self:sleep(0.5)
		--edit removing TK to keep player control when getting brain
		--Global.player:tkPickupItem(self, 1)
		--self:sleep(1)

		--Wait for held item to be put away.
		Global.player:replaceSelectedItemInPsack(1, 1)
		while( Global.player.HeldItem ) do Yield() end
  		
		--Attach brain to player's hand
  		AttachInventoryEntityToPlayer(self)
  		self:setPosition(-28, 12, 10)
  		self:setOrientation(90, -60, -60)
		EnableLooking(Global.player,0)
		
		Global.player.invDisplayer:invItemAdded(self, 0, 1, 1, 1, 1)
		--edit give it time to show inventory item added
		self:sleep(2)
		--edit removing animations to keep player control when getting brain
		--[[
		--play look at brain anim
		--Global.player:loadAnim('Anims/DartNew/KissBrain_Idle.jan',.2,1)

		--edit Removing Quips because they don't play in all levels, only AS
		--Needs Fixed in Future
		--Global.player:sayLine( self.razQuips[ self.who ], 1, 1, nil, nil, nil, 1)
		
		--Start kissing anim
		--LoadAnim(Global.player,'Anims/DartNew/KissBrain.jan',.1,0)

		--Wait for kissing to finish
		--while (GetAnimCompletion(Global.player) < 1) do Yield() end
		]]
		self:setState(nil)
	end
	
	function Ob:endStateKissBrain()
		-- make double sure this gets turned back on
		Global.player:loadAnim('anims/DartNew/StandStill.jan', .2,0)
		UnLoadPriorityAnim(Global.player,1)
		EnableLooking(Global.player,1)
		Global.player.invDisplayer:invItemAdded(self, 1, 0)

		local bFreezeCam = (Global:load('bASBQRebrainingHintPlayed') ~= 1) --Freeze cam if running hint CS
        if bFreezeCam ~= 1 then
			SetMotionBlurState(kMOTIONBLURSTATE_NONE, 0.5)
		end
		self:setState('CheckTutorial')
	end
	
	function Ob:stateCheckTutorial()
		--Wait for kissBrain cutscene to finish
		Global.cutsceneScript:waitForEnd()
		--SetMotionBlurState(kMOTIONBLURSTATE_FADE_TO_BLACK, 0)
		
		--Show tutorial box
		--edit Removing tutorial box
		--[[
		if (Global:loadGlobal('bSeenBrainTutorialBox') ~= 1) then
			Global.levelScript:addTutorialBox("/ASZG000TO/", 'Textures/icons/InventoryItems/BrainJar.dds', 1)--DIALOG=<<Excellent find! A fellow cadet\'s brain! If you take it back to Ford Cruller for recranialization, your total mental health potential will be increased!>>
			Global:saveGlobal('bSeenBrainTutorialBox', 1)
		end
		]]

		--Show ford hint cutscene if this is the first one
		--edit Removing tutorial
		--[[
		if (Global:load('bASBQRebrainingHintPlayed') ~= 1) then
			Global.cutsceneScript:oneShot(Global.player, 170, 70, Global.player.height - 10, -10, 10, 0)
			Global.cutsceneScript:runCutscene('ASBQRebrainingHint')
			Yield()
			--SetMotionBlurState(kMOTIONBLURSTATE_FADE_TO_BLACK, 0)
			Global.cutsceneScript:waitForEnd()
			SetMotionBlurState(kMOTIONBLURSTATE_NONE, 0.5)	
		end
		]]

  		-- Motion-blurred fade to black, showing only raz and brain
  		SetMotionBlurState(kMOTIONBLURSTATE_STANDARD, 0.5)
  		self:sleep(0.5)
  		SetMotionBlurState(kMOTIONBLURSTATE_STANDARD, 0)
  		SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 0)
  		SetEntityFlag(self, ENTITY_POST_EFFECTS, 0)
  		SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 0)  		
		
		-- Sleeping another second or so to let us finish being added to the psack.
		self:sleep(2)

		self:setState(nil)
	end

	function Ob:bePickupable()
		%Ob.Parent.bePickupable(self)
		self.interestFX:attach(self)
	end

	-- HACK: Need to finish executing our state, before we destroy ourselves.  Better way would be to have a collectibles class
	-- for things like this that kill themselves instead of going into the inv; those would never get moved to InvItems.
	function Ob:onDomainChange(old, new)
		%Ob.Parent.onDomainChange(self, old, new)
		if new == 'InvItems' then
			SetEntityDomain(self, 'Level')
			self:makeInvisible(1)
		end
	end

	return Ob
end
