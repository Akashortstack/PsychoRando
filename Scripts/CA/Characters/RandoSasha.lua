--[[
NPC of Sasha used to block off access to the Main Campgrounds until
Sasha's Button is collected.
]]

function RandoSasha(Ob)
	if not Ob then
		Ob = CreateObject('Global.Characters.ActionActor')
		Ob.meshName = 'Characters/Sasha.plb'
		Ob.animsDir = 'Sasha'
		Ob.height = 420
		Ob.disguise = 'Textures/Sprites/Clairvoyance Handlers/Raz_Sasha.tga'
		Ob.charName = 'Sasha_sayline'
		Ob.TK_YOffset = 175

		--Basic braining variables		
		Ob.brainLevel = 'SACU'
		Ob.brainingMovie = 'sais.xmv'
		Ob.iMaxChatter = 2000
	end
	
	function Ob:onPreBeginLevel()		
		%Ob.Parent.onPreBeginLevel(self) 
		-- set the homeposition
		self.homex, self.homey, self.homez = self:getPosition()
		self.homerx, self.homery, self.homerz = self:getOrientation()
		self.animsTable = {
			idle = {fileName = 'SashaPoseA', loop = 1},
			talk = {fileName = 'sasha_talk', preload = 1, loop = 0, next = 'idle'},
			gesture2 = {fileName = 'sashagesture2', preload = 1, loop = 0, next = 'talk'},
			hairFlip = {fileName = 'sashapose1', preload = 1, loop = 0},
			flinch = {fileName = 'Psi_Reaction', preload = 1, loop = 0, blendTime = 0},
			jumpOn = {fileName = 'JumpOn_Reaction', preload = 1, loop = 0, blendTime = 0},
			TKed = {fileName = 'SashaTK', preload = 1, loop = 1, blendTime = 0},
			giveObject = {fileName = 'GiveObject', preload = 1, loop = 0, blendTime = .15, next = 'talk'},
			controlPanelIdle1 = {fileName = 'sasha_control_panel_idle', preload = 1, loop = 1},
			controlPanelIdle2 = {fileName = 'sasha_control_panel_idle2', preload = 1, loop = 1},
			controlPanelIdle3 = {fileName = 'sasha_control_panel_idle3', preload = 1, loop = 1},
		}
		self.tPsiReactTable = {
			FireStart = {
				lineCode = "/CAGB020SA/"--DIALOG=<<I\'m sure you could find a more productive use for that skill, Razputin.>>
			},
			Confusion = {
				lineCode = "/CAGD020SA/"--DIALOG=<<I am not so easily confused, Razputin.>>
			},						
			NewMoveMelee = {
				animToPlay = 'flinch', lineCode = "/CAQZ036SA/",
			},
			PsiBlast = {
				animToPlay = 'flinch', lineCode = "/CAQZ036SA/",
			},
			Squash = {
				animToPlay = 'jumpOn', preCallback = self.bounce, lineCode = "/CAQZ036SA/",
			},
			TKPickup = {
				animToPlay = 'TKed', preCallback = self.bounce, lineCode = "/CAGC020SA/", loop = 1--DIALOG=<<Impressive. Now release.>>
			},
			TKRelease = {
				reset = 1
			},
		}

		self.tDialogue = { { line = "/CAGG000SA/", group='a', maxPlays = 1, filterCode='HighJunk' }, --DIALOG=<<Is that the cleaning lady? >>
								{ line = "/CAGG001SA/", group='a', maxPlays = 1, filterCode='HighJunk' }, --DIALOG=<<I\'ll get those files out of your way, just as soon as I\'m done with these... tests...>>
								{ line = "/CAGG002SA/", group='a', maxPlays = 1, filterCode='LowJunk' }, } --DIALOG=<<Ah, yes. Thank you Razputin, for helping me clean up.>>

		self.responseHandler=SpawnScript('Global.Util.CharResponseHandler','','',0)
		self.responseHandler.owner=self
		self.responseHandler.bLinePriority = 1
		self.responseHandler:addDialog(self.tDialogue)											
		
		--list of potential Raz voicelines when speaking to Sasha, one picked at random
		self.stateActivateResponses = {
			"/CAGH000RA/",--DIALOG=<<Is this going to hurt?>>
			"/CAGH001RA/",--DIALOG=<<Have you tested this thing out on humans yet?>>
			"/CAFW004RA/",--DIALOG=<<Won\'t you help?>>
			"/CAGH002RA/",--DIALOG=<<Will I get in trouble with Milla? She told me not to take any paranormal training while I'm here.>>
			"/CAGH003RA/",--DIALOG=<<Could you try it first?>>
		}

        --self:setState(nil)
		
	end
	
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetEntityCollideCylinder(self, 60, 240)
		self:setAnim(self.animsTable.idle)		
		SetEntityFlag(self, ENTITY_DRAWSHADOW, 1)
		
		SetEntityLookOffsetPos(self, 0, 200, 0)
			
		self:setRandomIdles(self.tRandomIdles, 1)		
	end

	function Ob:onItem(data, from)				   
		self:shutUp()
		if (data == 'CrowFeather') then
			if (self:distance(Global.player) < 250) then
				self:sayLine("/GLGO020SA/",0, 0, nil, 1, nil, 1)  --DIALOG=<<Razputin, please. Germs. >>
			end
		else
			self:setState('ActivateResponseState')
		end
	end

	function Ob:stateActivateResponseState()
		--picks a random voiceline from table for Raz
		local responseCode = self.stateActivateResponses[RandInt(1, 5)]
		Global.player:sayLine(responseCode, 1, 1, nil, 1, nil, 1)
		--same response from Sasha every time
		self:sayLine("/SLAM002SA/", 1, 0, nil, 1, nil, 1) --DIALOG=<<Step up to the brain tumbler when you\'re ready.>>
		self:setState(nil)
	end

	return Ob
end
