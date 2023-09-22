function WWMACutscenes(Ob)
	function construct()
		local Ob = CreateObject('Global.Camera.CutsceneScript')
		-- position data for the scale...same thing as locators....err..yeah
		Ob.tScaleCPosData = {
			CarpenterShop = {
				startpos = { initX = 12678, initY = -19834, initZ = 5454, initYaw = 156 },
				tCamPath1 = { 
					{xpos = 11551, ypos = -18112, zpos = 6578, xang = -10, yang = -29, zang = 0, field_of_view = 104},
					{xpos = 12462, ypos = -18443, zpos = 4935, xang = -10, yang = -29, zang = 0, field_of_view = 104},
					{xpos = 12677, ypos = -19115, zpos = 4547, xang = -46, yang = -16, zang = 0, field_of_view = 104}
				},
				tCamPath2 = { 
					{xpos = 12677, ypos = -19115, zpos = 4547, xang = -46, yang = -16, zang = 0, field_of_view = 104},
					{xpos = 12979, ypos = -19580, zpos = 3127, xang = -8, yang = -8, zang = 0, field_of_view = 104}					
				},
				endpos = {initX = 13100, initY = -19745, initZ = 2746, initYaw = 169}
			},
			Restaurant = {
				startpos = {initX = 25979, initY = -19633, initZ = 8909, initYaw = 112 },
				tCamPath1 = { 
					{xpos = 24896, ypos = -17819, zpos = 8823, xang = -22, yang = -67, zang = 0, field_of_view = 104},
					{xpos = 26169, ypos = -18387, zpos = 8295, xang = -37, yang = -70, zang = 0, field_of_view = 104},
					{xpos = 26642, ypos = -19364, zpos = 7954, xang = -18, yang = -66, zang = 0, field_of_view = 104}
				},
				tCamPath2 = { 
					{xpos = 26642, ypos = -19364, zpos = 7954, xang = -18, yang = -66, zang = 0, field_of_view = 104},
					{xpos = 26835, ypos = -19366, zpos = 8276, xang = 5, yang = -52, zang = 0, field_of_view = 104}
				},
				endpos = {initX = 27761, initY = -19595, initZ = 7409, initYaw = 122}
			},
			Peasant1House = {
				startpos = {initX = 18746, initY = -19880, initZ = 7470, initYaw = -12},
				tCamPath1 = { 
					{xpos = 19427, ypos = -18485, zpos = 6654, xang = -21, yang = 169, zang = 0, field_of_view = 104},
					{xpos = 19226, ypos = -18881, zpos = 7679, xang = -21, yang = 173, zang = 0, field_of_view = 104},
					{xpos = 19175, ypos = -19362, zpos = 8144, xang = -46, yang = 169, zang = 0, field_of_view = 104},										
				},
				tCamPath2 = { 
					{xpos = 19175, ypos = -19362, zpos = 8144, xang = -46, yang = 169, zang = 0, field_of_view = 104},					
					{xpos = 19189, ypos = -19520, zpos = 8452, xang = 6, yang = -176, zang = 0, field_of_view = 104}
				},
				endpos = {initX = 19241, initY = -19754, initZ = 9250, initYaw = -4}
			},
			Peasant2House = {
				startpos = {initX = 11968, initY = -19759, initZ = 13357, initYaw = -47},
				tCamPath1 = { 
					{xpos = 12942, ypos = -18210, zpos = 13166, xang = -16, yang = 129, zang = 0, field_of_view = 104},
					{xpos = 12342, ypos = -18438, zpos = 13795, xang = -26, yang = 135, zang = 0, field_of_view = 104},
					{xpos = 11993, ypos = -19108, zpos = 14149, xang = -49, yang = 131, zang = 0, field_of_view = 104}
				},
				tCamPath2 = { 
					{xpos = 11993, ypos = -19108, zpos = 14149, xang = -49, yang = 131, zang = 0, field_of_view = 104},
					{xpos = 11808, ypos = -19427, zpos = 14331, xang = 13, yang = 127, zang = 0, field_of_view = 104}
				},
				endpos = {initX = 10943, initY = -19662, initZ = 14590, initYaw = -40},
			},
			Peasant3House = {
				startpos = {initX = 21690, initY = -19402, initZ = 13886, initYaw = 128},
				tCamPath1 = { 
					{xpos = 20779, ypos = -17922, zpos = 13440, xang = -19, yang = -82, zang = 0, field_of_view = 104},
					{xpos = 21552, ypos = -18364, zpos = 13335, xang = -29, yang = -82, zang = 0, field_of_view = 104},
					{xpos = 21835, ypos = -18762, zpos = 13296, xang = -50, yang = -82, zang = 0, field_of_view = 104},			
				},
				tCamPath2 = { 
					{xpos = 21835, ypos = -18762, zpos = 13296, xang = -50, yang = -82, zang = 0, field_of_view = 104},
					{xpos = 22086, ypos = -19113, zpos = 13293, xang = 15, yang = -80, zang = 0, field_of_view = 104}
					
				},
				endpos = {initX = 22963, initY = -19306, initZ = 13344, initYaw = 110},
			},
			Orchard = {
				startpos = {initX = 12301, initY = -19755, initZ = 19121, initYaw = -22},
				tCamPath1 = { 
					{xpos = 11969, ypos = -18351, zpos = 18223, xang = -12, yang = 169, zang = 0, field_of_view = 104},
					{xpos = 11706, ypos = -18448, zpos = 18715, xang = -31, yang = 169, zang = 0, field_of_view = 104},
					{xpos = 11613, ypos = -18824, zpos = 19192, xang = -35, yang = 169, zang = 0, field_of_view = 104},
				},
				tCamPath2 = { 
					{xpos = 11613, ypos = -18824, zpos = 19192, xang = -35, yang = 169, zang = 0, field_of_view = 104},
					{xpos = 11368, ypos = -19033, zpos = 19770, xang = 9, yang = 179, zang = 0, field_of_view = 104},
				},
				endpos = {initX = 11345, initY = -19266, initZ = 21140, initYaw = -27}
			},
			StrongHold = {
				startpos = {initX = 28083, initY = -19227, initZ = 19792, initYaw = -52},
				tCamPath1 = { 
					{xpos = 28979, ypos = -17783, zpos = 19720, xang = -31, yang = 129, zang = 0, field_of_view = 104},
					{xpos = 27603, ypos = -18013, zpos = 19363, xang = -31, yang = 154, zang = 0, field_of_view = 104},
					{xpos = 27488, ypos = -18304, zpos = 19603, xang = -49, yang = 154, zang = 0, field_of_view = 104},
				},
				tCamPath2 = { 
					{xpos = 27488, ypos = -18304, zpos = 19603, xang = -49, yang = 154, zang = 0, field_of_view = 104},
					{xpos = 27317, ypos = -19066, zpos = 19957, xang = 4, yang = 179, zang = 0, field_of_view = 104},
				},
				endpos = {initX = 27811, initY = -19268, initZ = 21131, initYaw = -52}
			},
		}
	
		--Dependencies to pre-load
		Ob.dependencies = {
			scripts = {
				'WW.Effects.BrawlMilitaryLoopingFX',
                                'WW.Props.Note',
			},
		}        
		return Ob
	end
	if not Ob then
		Ob = construct()
	end
	construct = nil

	function Ob:onBeginLevel()	
		%Ob.Parent.onBeginLevel(self)
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		self.bigDummyRaz = SpawnScript('Global.Props.Geometry', 'BigDummyRaz', 'self.meshName=\'Characters/DartNew.plb\'')
		SetEntityFlag(self.bigDummyRaz, ENTITY_NOSIMULATE, 0)		
		self.bigDummyRaz:loadAnim('Anims/DartNew/standstill.jan', 0,1)
		AttachKnapsackToPlayer(self.bigDummyRaz)
		self.bigDummyRaz:setScale(10)
		self.bigDummyRaz:makeInvisible()
	end

-- S C A L E  S W I T C H  ************************************************************************			

	function Ob:stateScaleToB()
		Global.player:doNothing()
		Global.player:loadAnim('Anims/DartNew/WWladderAtoB.jan', 0, 0)
		-- cam path to really quick
		local fov = GetCameraFieldOfView()
		self:camPathTo(-44188,9034,5802, 2,-92,0, fov, 0.25, 0, 0, 1)
		
		--self:camPathTo(-43915,8950,5811, 20,-90,0, fov, 0.25, 0, 0, 1)
		while (Global.player:getAnimCompletion('WWladderAtoB.jan') <= 0.85) do
			Yield()
		end
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 0)
		Global.levelScript:scaleTo('B', -30094, 1819, 5851)
		Global.player:setOrientation(0, -91, 0)
		-- camcut
		self:cutTo(-29292,1596,5860, 2,88,0)
		--self:cutTo(-29819,1296,5862, 9,89,-26)
		-- load the slide anim
		Global.player:loadAnim('Anims/DartNew/ladderdn_cycle.jan', 0, 1)
		self:sleep(0.5)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)		
		self:setState('CleanupCSScaleToB')
	end

	function Ob:stateCleanupCSScaleToB()
        self:endCutscene()		
		SetScriptControlHandler(self)
		-- set the cam
--		Global.levelScript.scaleBLadder.railCamB:turnOn()
		SetControlHandler(kCONTROL_LADDER, Global.levelScript.scaleBLadder)
	end
	
--**************************************************************************************************			

	function Ob:stateScaleToBJump()
		Global.player:doNothing()
		self:cutTo(-28849,106,5201, 59,-24,0)
		Global.levelScript:scaleTo('B', -28651, 1800, 4932)
		Global.player:setOrientation(0, -15, 0)			
		Global.player:loadAnim('Anims/DartNew/actionfall.jan', 0, 1)
		self:sleep(0.25)
		self:camPathTo(-28849,106,5201, 4,-23,0, 104, 1, 0.75, 0.1, 0)		
		self:sleep(0.75)
		Global.player:loadAnim('Anims/DartNew/landsoft.jan', 0.1, 0)
		self:sleep(0.25)
		self:setState('CleanupCSScaleToBJump')
	end

	function Ob:stateCleanupCSScaleToBJump()
		Global.player:setNewAction('Stand')
		if (Global:load('Soldier1IntroductionSeen') ~= 1) then
        	self:endCutscene(1)
			self:runCutscene('ScaleBIntroShot')
		else
        	self:endCutscene()
		end
	end	

	function Ob:stateCleanupCSScaleBIntroShot()
		self:fadeToBlack(.5, 1)
		self:endCutscene(1)
		self:runCutscene('Soldier1Introduction')
	end	

--**************************************************************************************************			

	function Ob:stateScaleToA()
		Global.levelScript:disableLedgeFX()
		Global.levelScript.scaleBLadder.railCamB:removeCam()
		Global.player:doNothing()
		--self:camPathTo(-29989,1867,5854, 5,88,0, 104, 0.5, 0.1, 0.1, 1)
		Global.player:loadAnim('Anims/DartNew/WWladderAtoB.jan', 0, 0)
		while (Global.player:getAnimCompletion('WWladderAtoB.jan') < 0.25) do
			Yield()
		end
		-- cut to 
		Global.player:loadAnim('Anims/DartNew/climbledge.jan', 0, 0)
		Yield()
		SetEntityGravityDir(Global.player, 0,1,0)
		self:cutTo(-44188,9034,5802, 2,-92,0)
		Global.levelScript:scaleTo('A', -43688, 9014, 5816)
		Global.player:setOrientation(0, -92, 0)	
		while (Global.player:getAnimCompletion('climbledge.jan') ~= 1) do
			Yield()
		end		
		self:sleep(0.25)
		self:setState('CleanupCSScaleToA')
	end

	function Ob:stateCleanupCSScaleToA()
		Global.levelScript:reEnableLedgeFX()
		Global.player:setNewAction('Stand')
        self:endCutscene()			
	end

--**************************************************************************************************

	function Ob:stateScaleToC()
		-- get the table value, if none just do straight scaling
		if (self.rCurrHouse and self.tScaleCPosData[self.rCurrHouse.Name]) then
			-- since i'm setting up the table manually in script, i will assume all fields are there
			local postable = self.tScaleCPosData[self.rCurrHouse.Name]

			-- set the initial position
			Global.levelScript:scaleTo('C', postable.endpos.initX, postable.endpos.initY, postable.endpos.initZ, postable.endpos.initYaw)	

			self.bigDummyRaz:makeVisible()
			SetEntityAlpha(Global.player, 0,0)
			self:placeChar(self.bigDummyRaz, postable.startpos.initX, postable.startpos.initY, postable.startpos.initZ, 0,postable.startpos.initYaw,0)	

			self:cutTo(postable.tCamPath1[1].xpos, postable.tCamPath1[1].ypos, postable.tCamPath1[1].zpos, postable.tCamPath1[1].xang, postable.tCamPath1[1].yang, postable.tCamPath1[1].zang)
			-- scale raz
			
			-- put him in the right position
--			Global.player:setPosition(postable.endpos.initX, postable.endpos.initY, postable.endpos.initZ)
--			Global.player:setOrientation(0, postable.startpos.initYaw, 0)
			
--			Yield()
			
			-- start the initial campath
			--self:camPath(postable.tCamPath1, 3,0.5,0.5,1)

--			Yield()

			self:sleep(0.5)
			-- finish the campath
			--self:camPath(postable.tCamPath2, 1,0.5,0.5,1)	
			SetEntityAlpha(Global.player, 1,2)
			
			local x, y, z, pitch, yaw, roll = self:getChaseIdeal()
			self:camPathTo(x, y, z, pitch, yaw, roll, nil, 3, 1, 1, 1)
			self:setState('CleanupCSScaleToC')
		else
			Global.levelScript:scaleTo('C')			
			self:endCutscene()
		end
	end

	function Ob:stateCleanupCSScaleToC()
		self.bigDummyRaz:makeInvisible()
        self:endCutscene()		
--		Global.player:goToDefaultState()
	end


--  N A P O L E O N  A N D  F R E D  **************************************************************

	function Ob:stateActivateNapoleonOrFred()
		Global.bInhibitFigments = 1
        self:fadeToBlack(0)
        
		-- establish references
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		self.fred:stopRandomIdles()
		self.napoleon:stopRandomIdles()
		
		-- hide hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:hide() end
		
		-- set player position
		Global.player:setPosition(-43793.1, 8826.2, 6491.9)
		Global.player:setOrientation(0, 166.3, 0)
        
		-- fade in and zoom to player
        self:cutTo(-43492,9282,5380, -36,163,0)
		self:camPathTo(-43544,9200,5566, -24,173,0, nil, 10, 2, 2)
		self:fadeIn(1)
		-- player walks up
		Global.player:setNewAction('Walk')
		self:sleep(1.5)
		Global.player:setNewAction('Stand')
		Global.player:sayLine("/WWAB006RA/", 0, 1) --DIALOG=<<Who\'s winning?>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .2, 1)
		
		-- reposition the player
		Global.player:setPosition(-43756.7, 8826.2, 5937.4)
		Global.player:setOrientation(0, 113.7, 0)
		
		-- cut to napoleon from raz's shoulder
        self:cutTo(-43914,8956,5987, 8,-86,0)
        LookAtEntity(Global.player, self.napoleon)
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_start)
		self.napoleon:setAnim(self.napoleon.animsTable.talk2_loop)
		self.napoleon:sayLine("/WWAB007NP/", 1, 1) --DIALOG=<<Nobody\'s winning! Want to know who\'s losing? The Bonaparte family name!>>
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- to fred
        self:camPathTo(-43863,8961,6043, 5,-37,0, nil, .5, .1, .1)
		LookAtEntity(Global.player, self.fred)
		self.fred:playAnimBlocking(self.fred.animsTable.talk_start)
		self.fred:setAnim(self.fred.animsTable.talk2_loop)
		self.fred:sayLine("/WWAB008FR/", 1, 1) --DIALOG=<<Look, I forfeit, okay? You win! Napoleon Bonaparte wins again!>>
		self.fred:setAnim(self.fred.animsTable.idle)
		
        -- cut to raz
        --Global.player:setPosition(-43682.1, 8827.2, 6166.9)
		Global.player:setPosition(-43711.8, 8826.2, 6261.6)
		Global.player:setOrientation(0, 166.3, 0)
		self:cutTo(-43463,9214,5582, -25,169,0)
		self:camPathTo(-43482,9138,5728, -26,171,0, nil, 8, 1, 3)
		Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
        Global.player:sayLine("/WWAB009RA/", 1, 1) --DIALOG=<<Is that the real Napoleon Bonaparte? I mean the imaginary real Napoleon Bonaparte?>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		LookAtEntity(Global.player, self.napoleon)
		self:sleep(1)
		LookAtEntity(Global.player, self.fred)
		
		-- reposition the player again
		Global.player:setPosition(-43756.7, 8826.2, 5937.4)
		Global.player:setOrientation(0, 113.7, 0)
		
		-- cut to fred
		self:cutTo(-43863,8961,6043, 5,-37,0)
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talkdown_loop)
		self.fred:sayLine("/WWAB010FR/", 1, 1) --DIALOG=<<Yeah, I\'m actually related to him, can you believe it? >>
		self.fred:setAnim(self.fred.animsTable.idle)
		
		-- cut to napoleon closeup
        self:camPathTo(-43914,8956,5987, 8,-86,0, nil, .5, .1, .1)
		LookAtEntity(Global.player, self.napoleon)
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_start)
		self.napoleon:setAnim(self.napoleon.animsTable.talk3_loop)
		self.napoleon:sayLine("/WWAB011NP/", 1, 1) --DIALOG=<<Shut up! Stop telling people that shameful fact!>>
		self:camPathTo(-43722,9013,5990, 7,-95,0, nil, 8, 1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk2_loop)
		self.napoleon:sayLine("/WWAB012NP/", 1, 1) --DIALOG=<<I don\'t even want to be here, but when this sad excuse for a Bonaparte lost a simple game of war to a feeble minded invalid, I just could not take it anymore!>>
        
		-- cut to napoleon on his own
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43542,9041,5978, 14,-119,0, nil, 8, 1, 1)
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_start)
		self.napoleon:setAnim(self.napoleon.animsTable.talk1_loop)
		self.napoleon:sayLine("/WWAB013NP/", 1, 1) --DIALOG=<<I was forced to take control, and I will stay in control until I beat the love of victory into this degenerate swine who dares to call himself a Bonaparte!>>
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- cut to fred
		self:cutTo(-43624,9125,5901, -7,4,0)
		self:camPathTo(-43638,9111,5789, -4,3,0, nil, 8, 1, 1)
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talk_loop)
		self.fred:sayLine("/WWAB014FR/", 1, 1) --DIALOG=<<No, really, great great great grandpa Napoleon. I do love victory, like...>>
		self.fred:setAnim(self.fred.animsTable.talk2_loop)
		self.fred:sayLine("/WWAB015FR/", 1, 1) --DIALOG=<<...a ton. I love it so much. You can go now I swear.>>
		self.fred:setAnim(self.fred.animsTable.idle)
		
		-- cut to napoleon on his own
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43542,9041,5978, 14,-119,0, nil, 2, .1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk1_loop)
		self.napoleon:sayLine("/WWAB016NP/", 1, 1) --DIALOG=<<Your move!  >>
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_end)
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		self:sleep(1)
		
		self:setState('CleanupCSActivateNapoleonOrFred')
	end
	
	function Ob:stateCleanupCSActivateNapoleonOrFred()
		Global.bInhibitFigments = 0
		-- show hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:show() end
	
		-- position raz
		Global.player:setPosition(-43682.1, 8827.2, 6166.9)
		Global.player:setOrientation(0, 166.3, 0)
		
		-- now fred and napoleon can go about their business
		self.fred:startRandomIdles()
		self.napoleon:startRandomIdles()
		
		-- save that this transpired
		Global:save('bActivationCutsceneFredOrNapoleonPlayed', 1)
		
		self:endCutscene()
	end
								  
--**************************************************************************************************

	function Ob:stateFredSaysCoinMelted()
		Global.bInhibitFigments = 1
		-- fade out
		self:fadeToBlack(0)
        
		-- establish references
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		
	    -- turn off idles
		self.fred:stopRandomIdles()
		self.napoleon:stopRandomIdles()
		
		-- hide hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:hide() end
		
		-- set player's init position
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)	
		
		self:fadeIn(.25)
        -- cut to closeup on raz
		self:cutTo(-43698,8990,5556, -24,144,0)
		self:camPathTo(-43714,8977,5580, -24,144,0, nil, 6, 1, 1)
		LookAtEntity(Global.player, self.fred)
		Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
		Global.player:sayLine("/WWAE000RA/", 1, 1) --DIALOG=<<So it\'s time to recruit some more troops.>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		
		-- cut to fred, over raz's shoulder
		self:cutTo(-43835,8940,5905, 14,-23,0)
		self:camPathTo(-43826,8948,5875, 16,-23,0, nil, 8, 1, 1)
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talkdown_loop)
		self.fred:sayLine("/WWAE001FR/", 1, 1) --DIALOG=<<Hey, no prob. I\'ll just write up some more \'I care\' notes.>>
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_end)
		self.fred:setAnim(self.fred.animsTable.idle)
        
		-- cut to raz closeup
		self:cutTo(-43673,9003,5526, -20,153,0)
		self:camPathTo(-43724,8979,5575, -20,153,0, nil, 11, 1, 1)
		Global.player:loadAnim('Anims/DartNew/Talk_2.jan', .1, 1)
		Global.player:sayLine("/WWAE002RA/", 1, 1) --DIALOG=<<How about writing a check, actually? Building an army is going to cost us a little.>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .1, 1)
		
		-- cut to fred, over shoulder shot
		self:cutTo(-43537,9226,5443, -37,144,0)
		self:camPathTo(-43568,9193,5475, -37,144,0, nil, 10, 1, 1)
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		self.fred:sayLine("/WWAE003FR/", 1, 1) --DIALOG=<<I don\'t really have any money. Well I did have this really valuable collector\'s coin...>>
		
		-- cut to napoleon on his own
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43614,9062,5921, -6,-118,0, nil, 8, 1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk1_loop)
        self.napoleon:sayLine("/WWAE004NP/", 1, 1) --DIALOG=<<Passed down through generations from my father\'s father!>>
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- cut to fred
		self:cutTo(-43624,9125,5901, -7,4,0)
		self.fred:setAnim(self.fred.animsTable.talk_loop)
		self.fred:sayLine("/WWAE005FR/", 1, 1) --DIALOG=<<Whatever.>>
		
		-- cut to fred, over shoulder shot
		self:cutTo(-43537,9226,5443, -37,144,0)
		self:camPathTo(-43568,9193,5475, -37,144,0, nil, 10, 1, 1)
		self.fred:sayLine("/WWAE006FR/", 1, 1) --DIALOG=<<I haven\'t really seen it since I tried to melt it down...>>
		
		-- cut to raz shocked
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)
		self:cutTo(-43714,8977,5580, -24,144,0)
        self:sleep(.5)
		LoadBlendAnim(Global.player, 'anims/dartnew/generalfacial/scared_.pba', 0, 0, 0.3) -- blend in over 0.3 seconds
		self:sleep(1)
		
		-- cut to napoleon
		StopAllBlendAnims(Global.player, -1.0) -- blend the scared pba out over its default time of 0.3 (note that this is the default value for the optional argument)
        self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43542,9041,5978, 14,-119,0, nil, 2, .1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk1_loop)
		self.napoleon:sayLine("/WWAE007NP/", 1, 1) --DIALOG=<<You WHAT!?!>>
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_end)
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- cut to fred
		self:cutTo(-43624,9125,5901, -7,4,0)
		self:camPathTo(-43638,9111,5789, -4,3,0, nil, 10, 1, 1)
		self.fred:playAnimBlocking(self.fred.animsTable.talk_start)
		self.fred:setAnim(self.fred.animsTable.talk_loop)
		self.fred:sayLine("/WWAE008FR/", 1, 1) --DIALOG=<<I needed more weight in my pinewood derby racer. Not that it would have helped, the way I lost.>>
		self.fred:playAnimBlocking(self.fred.animsTable.talk_end)
		self.fred:setAnim(self.fred.animsTable.idle)
		
		-- back to napoleon
		self:cutTo(-43646,9066,5904, -6,-118,0)
        self.napoleon:setAnim(self.napoleon.animsTable.talk3_loop)
		self.napoleon:sayLine("/WWAE009NP/", 1, 1) --DIALOG=<<Big surprise there.>>
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_end)
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
        self:setState('CleanupCSFredSaysCoinMelted')
	end
	
	function Ob:stateCleanupCSFredSaysCoinMelted()
		Global.bInhibitFigments = 0
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		
		-- turn on idles
		self.fred:startRandomIdles()
		self.napoleon:startRandomIdles()
		
		-- show hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:show() end
		
		Global:save('bFredSaysCoinMeltedPlayed', 1)
		
		self:endCutscene()
	end
								  
--**************************************************************************************************

	function Ob:stateFredSaysCoinMeltedInfo()
		Global.bInhibitFigments = 1
		-- fade out
		self:fadeToBlack(0)
        
		-- establish references
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		
		-- turn off idles
		self.fred:stopRandomIdles()
		self.napoleon:stopRandomIdles()
		
		-- hide hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:hide() end
		
		-- set player's init position
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)	
		
		self:fadeIn(.25)
        -- cut to closeup on raz
		self:cutTo(-43698,8990,5556, -24,144,0)
		self:camPathTo(-43714,8977,5580, -24,144,0, nil, 6, 1, 1)
		LookAtEntity(Global.player, self.fred)
		Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
		Global.player:sayLine("/WWAE010RA/", 1, 1) --DIALOG=<<So, where do you think that rare coin is?>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		
		-- cut to fred, over shoulder shot
		self:cutTo(-43537,9226,5443, -37,144,0)
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		self:camPathTo(-43568,9193,5475, -37,144,0, nil, 10, 1, 1)
        self.fred:sayLine("/WWAE011FR/", 1, 1) --DIALOG=<<I don\'t know. I remember trying to melt it down, and burning my hands, and then running to the kitchen for some ice, and then fainting.>>
		
		-- cut to napoleon on his own
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43614,9062,5921, -6,-118,0, nil, 8, 1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk2_loop)
        self.napoleon:sayLine("/WWAE012NP/", 1, 1) --DIALOG=<<Generations of royal inbreeding down the drain!>>
		self.napoleon:playAnimBlocking(self.napoleon.animsTable.talk_end)
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
        self:setState('CleanupCSFredSaysCoinMeltedInfo')
	end
	
	function Ob:stateCleanupCSFredSaysCoinMeltedInfo()
		Global.bInhibitFigments = 0
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		
		-- turn on idles
		self.fred:startRandomIdles()
		self.napoleon:startRandomIdles()
		
		-- show hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:show() end
		
		Global:save('bFredSaysCoinMeltedInfoPlayed', 1)
		
        self:endCutscene()
	end
	
--**************************************************************************************************

	function Ob:stateRazFindsCoin()
		Global.bInhibitFigments = 1
		-- fade out
		self:fadeToBlack(0)
        
		-- establish references
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		
		-- turn off idles
		self.fred:stopRandomIdles()
		self.napoleon:stopRandomIdles()
		
		-- hide hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:hide() end
		
		-- make the player hold the coin
		Global.player:setSelectedItem('Peasant2Item')
		
		-- set player's init position
		Global.player:setPosition(-44174.9, 8818, 5612.6)
		Global.player:setOrientation(0, 70.8, 0)	
		
		self:fadeIn(.25)
		Global.player:setNewAction('Walk')
		LookAtEntity(Global.player, self.fred)
        -- cut to raz, fred, fireplace
		self:cutTo(-43273,9236,5756, -23,85,0)
		self:camPathTo(-43340,9206,5716, -24,87,0, nil, 6, 1, 1)
		self:sleep(1.5)
		Global.player:setNewAction('Stand')
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talkdown_loop)
		self.fred:sayLine("/WWAE013FR/", 1, 1) --DIALOG=<<Hey, you found my super valuable, rare coin!>>
		self.fred:setAnim(self.fred.animsTable.idle)
		
		-- cut to raz closeup
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)
		self:cutTo(-43698,8990,5556, -24,144,0)
		self:camPathTo(-43714,8977,5580, -24,144,0, nil, 6, 1, 1)
        Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
		Global.player:sayLine("/WWAE014RA/", 1, 1) --DIALOG=<<Yeah. Can I have it?>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		
		-- cut to fred, over shoulder shot
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		self:cutTo(-43537,9226,5443, -37,144,0)
		self:camPathTo(-43568,9193,5475, -37,144,0, nil, 10, 1, 1)
        self.fred:sayLine("/WWAE015FR/", 1, 1) --DIALOG=<<Knock yourself out. I\'ve got enough memories of my dumb ancestors hanging around!>>
		
		-- cut to napoleon, mad
        self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43542,9041,5978, 14,-119,0, nil, 2, .1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		self.napoleon:sayLine("/WWAE016NP/", 1, 1) --DIALOG=<<Grr!>>
		
		self:sleep(.5)
		
		self:setState('CleanupCSRazFindsCoin')
	end
	
	function Ob:stateCleanupCSRazFindsCoin()
		Global.bInhibitFigments = 0
		
		-- turn off idles
		self.fred:startRandomIdles()
		self.napoleon:startRandomIdles()
		
		-- show hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:show() end
		
		Global:save('bRazFindsCoinPlayed', 1)
		
        self:endCutscene()
		
		-- to get rid of one frame flash
 		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
 		Global.player:setOrientation(0, 137.2, 0)
		MoveCameraToIdeal()
	end

--**************************************************************************************************

	function Ob:stateFredSignsCaringForm()
		Global.bInhibitFigments = 1
		-- fade out
		self:fadeToBlack(0)
        
		-- establish references
		self.fred = FindScriptObject('Fred')
		self.napoleon = FindScriptObject('Napoleon')
		
		-- turn off idles
		self.fred:stopRandomIdles()
		self.napoleon:stopRandomIdles()
        
		-- hide hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:hide() end
		
		-- set player's init position
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)	
		
		self:fadeIn(.25)
        -- cut to closeup on raz
		self:cutTo(-43698,8990,5556, -24,144,0)
		self:camPathTo(-43714,8977,5580, -24,144,0, nil, 6, 1, 1)
		LookAtEntity(Global.player, self.fred)
		Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
		Global.player:sayLine("/WWAD000RA/", 1, 1) --DIALOG=<<Hey, Fred. The problem is people think you don\'t care.>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		
		-- cut to fred, over shoulder shot
		self:cutTo(-43568,9193,5475, -37,144,0)
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		self.fred:sayLine("/WWAD001FR/", 1, 1) --DIALOG=<<What? I care!>>
		
		-- cut to napoleon
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self:camPathTo(-43614,9062,5921, -6,-118,0, nil, 8, 1, 1)
		self.napoleon:setAnim(self.napoleon.animsTable.talk3_loop)
		self.napoleon:sayLine("/WWAD002NP/", 1, 1) --DIALOG=<<Then lead them into victory, milky toast!>>
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- cut to fred
		self:cutTo(-43624,9125,5901, -7,4,0)
		self.fred:setAnim(self.fred.animsTable.talk2_loop)
		self.fred:sayLine("/WWAD003FR/", 1, 1) --DIALOG=<<Shut up!>>
		self.fred:setAnim(self.fred.animsTable.idle)
        
        -- cut to raz closeup
		Global.player:setPosition(-43803.6, 8826.2, 5695.8)
		Global.player:setOrientation(0, 157.9, 0)
		--self:cutTo(-43673,9003,5526, -20,153,0)
		--self:camPathTo(-43724,8979,5575, -20,153,0, nil, 11, 1, 1)
		self:cutTo(-43724,8979,5575, -20,153,0)
		Global.player:loadAnim('Anims/DartNew/Talk_2.jan', .1, 1)
		Global.player:sayLine("/WWAD004RA/", 1, 1) --DIALOG=<<They think you don\'t care if they live or die.>>
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .1, 1)
		
		-- raz looking at fred, over shoulder
		self:cutTo(-43783,9011,5788, 20,-26,0)
		self:camPathTo(-43835,8940,5905, 14,-23,0, nil, 6, 1, 1)
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talkdown_loop)
		self.fred:sayLine("/WWAD005FR/", 1, 1) --DIALOG=<<What do they want from me? A notice on my official stationary that says I\'d be sad if they died?>>
        self.fred:setAnim(self.fred.animsTable.idle)
		self:sleep(1)
		Global.player:loadAnim('Anims/DartNew/Talk_3.jan', .1, 1)
		Global.player:sayLine("/WWAD006RA/", 1, 1) --DIALOG=<<Yep.>>
        Global.player:loadAnim('Anims/DartNew/Listen.jan', .3, 1)
		self:sleep(1)
		self.fred:sayLine("/WWAD007FR/", 1, 1) --DIALOG=<<Huh.>>
		
		-- fade out
		self:fadeToBlack(1, 1)
        
		-- letter appears
		--edit to prevent letter from appearing
		--self.rLetter = SpawnScript('WW.Props.Note', 'Peasant1Item')
		--self.rLetter:setPosition(Global.player:getPosition())

		-- fade back up
		self:fadeIn(1)
		
		-- raz should be looking at the letter
		--self:cutTo(-43923,8933,5884, 9,-38,0)
        LookAtEntity(Global.player, self.rLetter)
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_start)
		self.fred:setAnim(self.fred.animsTable.talkdown_loop)
		self.fred:sayLine("/WWAD008FR/", 1, 1) --DIALOG=<<Well, if that doesn\'t work...>>
		self.fred:playAnimBlocking(self.fred.animsTable.talkdown_end)
		self.fred:setAnim(self.fred.animsTable.idle)
		
		-- cut to raz, closeup
		self:cutTo(-43724,8979,5575, -20,146,0)
		LookAtEntity(Global.player, self.fred)
		Global.player:sayLine("/WWAD009RA/", 1, 1) --DIALOG=<<Let me guess: you give up?>>
		self:sleep(.5)
		
		-- cut to raz, looking now at fred (over shoulder fred)
		Global.player:setPosition(-43872.6, 8826.2, 5947.1)
		Global.player:setOrientation(0, 137.2, 0)
		self:cutTo(-43584,9194,5478, -28,154,0)
        self.fred:sayLine("/WWAD010FR/", 1, 1) --DIALOG=<<Bingo!>>
		
		-- cut to napoleon
		self:cutTo(-43646,9066,5904, -6,-118,0)
		self.napoleon:setAnim(self.napoleon.animsTable.talk2_loop)
		self.napoleon:sayLine("/WWAD011NP/", 1, 1) --DIALOG=<<Ha! Another game at which I would surely defeat you!>>
		self.napoleon:setAnim(self.napoleon.animsTable.sit_gameidle)
		
		-- cut to fred
		self:cutTo(-43624,9125,5901, -7,4,0)
		self.fred:setAnim(self.fred.animsTable.talk2_loop)
		self.fred:sayLine("/WWAD012FR/", 1, 1) --DIALOG=<<Hey, you take that little victory if you need it, tiny man. >>
		self.fred:playAnimBlocking(self.fred.animsTable.talk_end)
		
		self:setState('CleanupCSFredSignsCaringForm')
	end
	
	function Ob:stateCleanupCSFredSignsCaringForm()
		Global.bInhibitFigments = 0
		
		-- turn off idles
		self.fred:startRandomIdles()
		self.napoleon:startRandomIdles()
		
		-- show hatbox tag
		local tag = FindScriptObject('EmoTagHatbox')
		if (tag) then tag:show() end
		
		if (not self.rLetter) then
			-- letter appears
			--edit remove letter from appearing
			--self.rLetter = SpawnScript('WW.Props.Note', 'Peasant1Item')
			--self.rLetter:setPosition(Global.player:getPosition())		
		end
		
		Global:save('bFredSignsCaringFormPlayed', 1)
	
		self:endCutscene()
	end

--**************************************************************************************************
--CLEANUP CODE FOR EZCUTSCENES--
	
	function Ob:stateCleanupCSHouseCarpenter1stTime()
		Global.player:setPosition(12849.7, -19634.8, 975.2)
		Global.player:setOrientation(0, -102.4, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSHouseCarpenter2ndTime()
		Global.player:setPosition(12849.7, -19634.8, 975.2)
		Global.player:setOrientation(0, -102.4, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSHouseKnight1stTime()
		Global.player:setPosition(27950.8, -19598.2, 7378.8)
		Global.player:setOrientation(0, 104.5, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSHouseKnight2ndTime()
		Global.player:setPosition(27950.8, -19598.2, 7378.8)
		Global.player:setOrientation(0, 104.5, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantOne1stTime()
		Global.player:setPosition(18961.6, -19707, 9526.7)
		Global.player:setOrientation(0, -34.3, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantOne2ndTime()
		Global.player:setPosition(18961.6, -19707, 9526.7)
		Global.player:setOrientation(0, -34.3, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantOne1stTime()
		Global.player:setPosition(18961.6, -19707, 9526.7)
		Global.player:setOrientation(0, -34.3, 0)
		self:cleanupLoopingAnims()
        	self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantTwo1stTime()
		Global.player:setPosition(10865.1, -19570.4, 14754.3)
		Global.player:setOrientation(0, -42.3, 0)        
		self:cleanupLoopingAnims()
		self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantTwoSoldierGone()
		Global.player:setPosition(10865.1, -19570.4, 14754.3)
		Global.player:setOrientation(0, -42.3, 0)        
		self:cleanupLoopingAnims()
		self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantThree1stTime()
		Global.player:setPosition(23298.8, -19267.5, 13245.6)
		Global.player:setOrientation(0, 118.5, 0)
		self:cleanupLoopingAnims()
		self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantThreeSoldierGone()
		Global.player:setPosition(23298.8, -19267.5, 13245.6)
		Global.player:setOrientation(0, 118.5, 0)
		self:cleanupLoopingAnims()
		self:endCutscene()
	end

	function Ob:stateCleanupCSCarpenterBecomesPiece()
		Global.player:setPosition(12849.7, -19634.8, 975.2)
		Global.player:setOrientation(0, -102.4, 0)
		self:cleanupLoopingAnims()
		self:gamePieceAppearCleanup()
		Global.goalManager:deactivate('Carpenter')
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:carpenterHelp()

		self:endCutscene()
	end

	function Ob:stateCleanupCSKnightBecomesPiece()
		Global.player:setPosition(27950.8, -19598.2, 7378.8)
		Global.player:setOrientation(0, 104.5, 0)
		self:cleanupLoopingAnims()
		self:gamePieceAppearCleanup()
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:knightHelp()

		self:endCutscene()
		local restaurant = FindScriptObject('Restaurant')
		restaurant:changeState(1)
	end

	function Ob:stateCleanupCSPeasantOneBecomesSoldier()
		--Get rid of the letter
		local letter = FindScriptObject('Peasant1Item')
		if (Global.player.HeldItem == letter) then
			Global.player:releaseSelectedItem()
		end
		if (letter) then
			letter:killSelf()
		end
	
		Global.player:setPosition(18961.6, -19707, 9526.7)
		Global.player:setOrientation(0, -34.3, 0)
		self:cleanupLoopingAnims()
		self:gamePieceAppearCleanup()
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant1Help()

		self:endCutscene()
	end

	function Ob:stateCleanupCSPeasantThreeBecomesSoldier()
		Global.player:setPosition(23298.8, -19267.5, 13245.6)
		Global.player:setOrientation(0, 118.5, 0)
		self:cleanupLoopingAnims()
		self:gamePieceAppearCleanup()
		local gun = FindScriptObject('Peasant3Item')
		if (gun) then
			gun:killSelf()
		end
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant3Help()

		self:endCutscene()
	end

	function Ob:stateCleanupCSPeasantTwoBecomesSoldier()
		Global.player:setPosition(10865.1, -19570.4, 14754.3)
		Global.player:setOrientation(0, -42.3, 0)
		self:gamePieceAppearCleanup()
		self:cleanupLoopingAnims()
		local coin = FindScriptObject('Peasant2Item')
		if (coin) then
			coin:killSelf()
		end
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant2Help()

		self:endCutscene()
	end
	
	function Ob:stateCleanupCSPeasantTwoBecomesSoldierQuick()
		Global.player:setPosition(10865.1, -19570.4, 14754.3)
		Global.player:setOrientation(0, -42.3, 0)
		self:gamePieceAppearCleanup()
		self:cleanupLoopingAnims()
		local coin = FindScriptObject('Peasant2Item')
		if (coin) then
			coin:killSelf()
		end
		--edit Spawn Rando Reward!
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant2Help()

		self:endCutscene()
	end

	function Ob:cleanupLoopingAnims()
		for i = 1, 5 do
			local door = FindScriptObject('talkingDoor'..((i == 1 and '') or i))
			door:setAnim('Anims/WW_TalkingDoor/ClosedPose', 0, 0)
		end
	end

	function Ob:gamePieceAppearCleanup()
		local person = Global.levelScript.rCurrPersonForCS
		if (person) then
			if (person.Name == 'Knight') then
				local snailPiece = FindScriptObject('GamePieceSnail')
				if (snailPiece) then
					snailPiece:makeInvisible()
					snailPiece:die()
				end
				-- move pieces if they're in the way
				if (self.bSetAtSafeSpot ~= 1) then
					self:movePiecesToSafeSpot('KnightAltPos', person.rPiece)
					self.bSetAtSafeSpot = 1			
				end	
				self.bSetAtSafeSpot = 0			
--				DomainSleep('ScaleCDOMAIN',1)
--				DomainSleep('LSOScaleCDOMAIN',1)
			end
			-- for cleanup make it appear
			person:turnIntoPiece()
		end
	end

	function Ob:stateCleanupCSWWNS()
		Global.goalManager:deactivate('HelpFred')
		Global:setLevelToCompleted('WW')
		--edit return to CU instead
		Global.levelScript:returnToCU()
		--Global.levelScript:loadNewLevel('ASCO', 1, 1)		
		self:endCutscene()
	end

--**************************************************************************************************

	function Ob:stateCollectedAllSnails()
		PrintNote('The snails turn into the Snail Game Piece')
		local rSnailPiece = FindScriptObject('GamePieceSnail')
		local rPeachTree = FindScriptObject('PeachTreeScaleC')
		local rBirdTree = FindScriptObject('BirdTreeScaleC')
		local piece = FindScriptObject('GamePieceSnailScaleCPiece')
		self:movePiecesToSafeSpot('SnailAltPos', rSnailPiece)
		self.bSetAtSafeSpot = 1
		x, y, z = Global.levelScript:getTargPosition('C', rSnailPiece, nil, nil, 1)
		piece:makeVisible()
		piece:setPosition(x, y + 2000, z)

		if (rPeachTree and rBirdTree) then
			rPeachTree:show()
			rBirdTree:show()
		end
		-- set up the initial shot
		self:cutTo(11342,-18613,19114, -4,159,0)
		-- cam path out
--		self:camPathTo(12762,-19236,16872, 2,159,0, nil, 5,1,1, 1)
		self:camPathTo(10834,-19298,16471, 3,178,0, 104, 5,1,1, 1)
		self:moveToPos(piece, x, y, z, 3)
		if (rSnailPiece) then
			rSnailPiece:appearOnBoard()
		end
		self:sleep(1)
		self:setState('CleanupCSCollectedAllSnails')
	end

	function Ob:stateCleanupCSCollectedAllSnails()
		Global:save('AllSnailsCollected', 1)
		local rSnailPiece = FindScriptObject('GamePieceSnail')
		if (self.bSetAtSafeSpot ~= 1) then
			self:movePiecesToSafeSpot('SnailAltPos', rSnailPiece)			
		end
		self.bSetAtSafeSpot = 0
		if (rSnailPiece) then
			rSnailPiece:appearOnBoard()
		end
		local rPeachTree = FindScriptObject('PeachTreeScaleC')
		local rBirdTree = FindScriptObject('BirdTreeScaleC')
		if (rPeachTree and rBirdTree) then
			rPeachTree:show()
			rBirdTree:show()
		end
        self:endCutscene()		
	end	

	function Ob:stateCleanupCSSnailsBecomePiece()
		self:endCutscene()
		local orchard = FindScriptObject('Orchard')
		orchard:changeState(1)
	end

--**************************************************************************************************

	function Ob:stateSnailsTurnIntoDinner()
		PrintNote('The snails are served to the knight')
		local rSnailPiece = FindScriptObject('GamePieceSnail')
		-- set up the initial shot
		self:cutTo(-27910,133,5187, 0,-97,0)
		self:sleep(1)
		self:setState('CleanupCSSnailsTurnIntoDinner')
	end

	function Ob:stateCleanupCSSnailsTurnIntoDinner()
		Global:save('HeartyKnightFed', 1)
		local rSnailPiece = FindScriptObject('GamePieceSnail')
		if (rSnailPiece) then
			rSnailPiece:die()
		end
        self:endCutscene()		
	end	

--**************************************************************************************************

	function Ob:stateGamePieceActivation()
		self.piece = Global.levelScript.rCurrActivatedPiece
		self.defaultActor = self.piece.rAnimator
		
		-- turn the actors towards one another
		self:faceToFace(Global.player, self.piece, 500)
		
        local actor, sceneActor
        -- iterate through dialog table and play the cutscene dynamically :O
		for i, v in self.piece.tCutsceneActivationDialog[self.piece.rCurFilter] do
			actor = v.actor or self.defaultActor
			sceneActor = v.actor or self.piece
			-- setScene will cut to the right shot
			if (v.useShot) then
				sceneActor:setScene(sceneActor, v.useShot)
			else
				self.piece:setScene(sceneActor)
			end
            actor:sayLine(v.line, 1, 1) -- see table in the gamepiece for the lines
		end
		
		self:setState('CleanupCSGamePieceActivation') 
	end
	
	function Ob:stateCleanupCSGamePieceActivation()
		self.piece = Global.levelScript.rCurrActivatedPiece
		self.piece.bDoneAnimating = 1
		
		Global.player:loadAnim('Anims/DartNew/Listen.jan', .1, 1)
--		self.piece:playAnim('idle', .1, 1)
		
		-- make sure the cutscene doesn't play again
		Global:save('bActivationCutscene'..self.piece.Type..self.piece.rCurFilter..'Played', 1)
	
		self:endCutscene()
	end
	
--**************************************************************************************************

	function Ob:stateGamePieceInteraction()
		local soldier = Global.levelScript.rCurrSoldierPiece
		local piece = Global.levelScript.rCurrPieceForCS
		Global.player:makeInvisible()
		if (soldier and piece) then
			if (soldier.Name == 'GamePieceSoldier1') then
				self:cutTo(-28199,779,5294, -30,130,0, 104)
			elseif (soldier.Name == 'GamePieceSoldier2') then
				self:cutTo(-28869,792,5882, -25,-98,0, 104)
			else
				self:cutTo(-27092,915,5307, -27,155,0, 104)
			end
			self:faceToFace(piece, soldier, 2000, 0, 1)
			if not self.brawlFX then
				self.brawlFX = SpawnScript('WW.Effects.BrawlMilitaryLoopingFX', 'BrawlLoopingFX')
			end
			if not self.brawlFX2 then
				self.brawlFX2 = SpawnScript('WW.Effects.BrawlMilitaryLoopingFX', 'BrawlLoopingFX2')
			end			
			local x, y, z = piece:getPosition()
			self.brawlFX:setPosition(x, y, z)
			self.brawlFX:run()

			x, y, z = soldier:getPosition()
			self.brawlFX2:setPosition(x, y, z)
			self.brawlFX2:run()

			piece:setAnim('fight_REAL_loop')
			soldier:setAnim('fight_REAL_loop')
--			while (GetAnimCompletion(soldier) ~= 1) do
--				Yield()
			--			end
			-- militia piece says something
			local line
			if (piece.Name == 'GamePieceMilitia1') then
				line = "/WWBV000P1/" --DIALOG=<<Ha! Ah!>>
			elseif (piece.Name == 'GamePieceMilitia2') then
				line = "/WWBV001P2/" --DIALOG=<<Pow! Gah! Oof!>>
			else
				line = "/WWBV002P3/" --<<Cool musket, eh? Oh, wait. Have to reload here...>>
			end
			
			piece:sayLine(line, 1, 1)
			-- soldier says something
			soldier:sayLine("/WWBV003SD/", 1, 1) --DIALOG=<<Die! Arr! I kill you!>>

			if (piece.Type == 'ww.props.GamePieceMilitia') then
				self.bSoldierDying = 1
				soldier:die()
				piece:die()
			else
				piece:die(1)
			end
			self.brawlFX:stop()
			self.brawlFX2:stop()
			self:sleep(1)
		end
		self:setState('CleanupCSGamePieceInteraction')
	end

	function Ob:stateCleanupCSGamePieceInteraction()
		local soldier = Global.levelScript.rCurrSoldierPiece
		
		if self.brawlFX then
			self.brawlFX:stop()
		end
		if self.brawlFX2 then
			self.brawlFX2:stop()
		end

		self:endCutscene()		
		if (soldier and self.bSoldierDying == 1) then
			local cutsceneName = nil
			if (soldier.Name == 'GamePieceSoldier1') then
				cutsceneName = 'Soldier2Introduction'
			elseif (soldier.Name == 'GamePieceSoldier2') then
				cutsceneName = 'Soldier3Introduction'
			else
				cutsceneName = 'DrawbridgeClose'
			end
			self.bSoldierDying = 0
			self:runCutscene(cutsceneName, 0, 0, 1)
		end
		Global.levelScript.rCurrSoldierPiece = nil
		Global.levelScript.rCurrPieceForCS = nil
	end	
	
--  C H A N G E S  O N  T H E  B O A R D  **********************************************************			

	function Ob:stateDrawbridgeOpen()
		local bridge = FindScriptObject('DrawBridgeScaleC')
		if (bridge) then
			self:cutTo(25906,-19029,19526, 10,118,0)
			bridge:openGate()
		end
		self:sleep(3)
		self:setState('CleanupCSDrawbridgeOpen')
	end

	function Ob:stateCleanupCSDrawbridgeOpen()		
		Global:save('DrawBridgeDown', 1)
        self:endCutscene()	
		local bridge = FindScriptObject('DrawBridgeScaleC')
		bridge:openGate(1)	
	end

--**************************************************************************************************

	function Ob:stateSoldier2IntroductionOld()
		local napoleon = FindScriptObject('NapoleonScaleB')
		local fred = FindScriptObject('Fred')
		local soldier = FindScriptObject('GamePieceSoldier2')
		local position = FindScriptObject('Soldier2Position')
		local position2 = FindScriptObject('Soldier2Position2')
		local bridge = FindScriptObject('Bridge2')
		
		soldier:setPosition(-27527.6,61.289,6363.39)
		napoleon:resetForCutscene()
		-- show napoleon giving orders
		Global.levelScript.cutsceneScript:oneShot(napoleon, 300, 300, 500)
		napoleon:sayLine("/WWBA000NP/", 1, 1)--DIALOG=<<Sacre bleu! I cannot believe it, Fred! You have accidentally done something right!>>
		

		fred:sayLine("/WWBA001FR/", 1,1)--DIALOG=<<I have?>>
		
		napoleon:sayLine("/WWBA002NP/", 1, 1)--DIALOG=<<Yes! But I\'m afraid it\'s still not enough. More manpower!>>
		
		soldier:makeVisible()
		-- make the soldier come out of the stronghold
		self:cutTo(-27644,113,6421,3,121,0)
		self:camPathTo(-27332,83,6235, 3,121,0, 104, 3, 1, 1, 1)

		soldier:setPosition(-28175, 171, 6741)
		soldier:setOrientation(0, 120, 0)	
		soldier:jumpToLoc('WW_Hex146LSOLocator')		

		self:camPathTo(-27236,305,6212, -9,117,0, 104, 2,1,1, 1)
		soldier:sayLine("/WWBA003SD/", 1,1)--DIALOG=<<Ah, mon dieu. I hate bridges!>>

		-- make the soldier jump to the hex
--		local tx, ty, tz = position:getPosition()
--		local sx, sy, sz = soldier:getPosition()
--		local rx, ry, rz = position:getOrientation()
		soldier:jumpToLoc('WW_Hex114LSOLocator')

		self:cutTo(-28270,416,5271, -15,-156,0)
		soldier:setOrientation(0, 300, 0)	
		soldier:sayLine("/WWBA004SD/", 1,1)--DIALOG=<<Ahhhhhh!>>

		soldier:fight(1)
		while (GetAnimCompletion(soldier) ~= 1) do
            GamePrint("YIELD WHILE ANIMATING")
			Yield()
		end	
		-- destroy the bridge
		bridge:destroy(1)	
		-- move back
		
		soldier:jumpToLoc('WW_Hex130LSOLocator')

		soldier:sayLine("/WWBA005SD/", 1,1)--DIALOG=<<That is for killing my father, bridge!>>
		
		fred:sayLine("/WWBA006FR/",1,1)--DIALOG=<<Hey, stop killing my bridges. You\'re making me mad!>>

		self:setState('CleanupCSSoldier2Introduction')
	end

	function Ob:stateCleanupCSSoldier2Introduction()
        self:endCutscene()		
		local soldier = FindScriptObject('GamePieceSoldier2')
		local position = FindScriptObject('Soldier2Position2')
		local bridge = FindScriptObject('Bridge2')
		local napoleon = FindScriptObject('NapoleonScaleB')
		napoleon:restoreAfterCutscene()
		-- set the piece at the right position()
		local tx, ty, tz = position:getPosition()		
		local rx, ry, rz = position:getOrientation()		
		soldier:setPosition(tx, ty, tz)
		soldier:setOrientation(rx, ry, rz)
  		soldier:jumpToLocCleanup()
		soldier:appearOnBoard()
		bridge:destroy()
		Global:save('Soldier2IntroductionSeen', 1)
		local p2house = FindScriptObject('Peasant2House')
		-- make the houses activateable
		p2house:changeState(1)
	end

--**************************************************************************************************

	function Ob:stateSoldier3IntroductionOld()
		local napoleon = FindScriptObject('NapoleonScaleB')
		local fred = FindScriptObject('Fred')
		local soldier = FindScriptObject('GamePieceSoldier3')
		local position = FindScriptObject('Soldier3Position')

		soldier:setPosition(-27527.6,61.289,6363.39)
		napoleon:resetForCutscene()
		-- show napoleon giving orders
		Global.levelScript.cutsceneScript:oneShot(napoleon, 300, 300, 500)
		napoleon:sayLine("/WWBS000NP/", 1, 1) --DIALOG=<<Ha ha. Not bad, Fred!>>
		fred:sayLine("/WWBS001FR/", 1, 1) --DIALOG=<<What? Whad I do?>>
		napoleon:sayLine("/WWBS002NP/", 1, 1) --DIALOG=<<You\'re doing better than usual, and I hate to end the fun...>>
		napoleon:sayLine("/WWBS003NP/", 1, 1) --DIALOG=<<But I guess it\'s time to put an end to this, as usual.>>
		
		soldier:makeVisible()
		soldier:setPosition(-28175, 171, 6741)
		soldier:setOrientation(0, 120, 0)
		soldier:jumpToLoc('WW_Hex146LSOLocator')
		-- make the soldier come out of the stronghold
		self:cutTo(-27644,113,6421,3,121,0)
		self:camPathTo(-27332,83,6235, 3,121,0, 104, 3, 1, 1, 1)
		-- show napoleon giving order
		Global.levelScript.cutsceneScript:oneShot(napoleon, 300, 300, 500)
		napoleon:sayLine("/WWBS004NP/", 1, 1) --DIALOG=<<Guard the bridge to the stronghold, with your LIFE.>>

		local rx, ry, rz = position:getOrientation()
		soldier:setOrientation(rx, ry, rz)		
		self:cutTo(-27105,490,5729, -26,139,0)			
		soldier:jumpToLoc('WW_Hex147LSOLocator')		

		soldier:sayLine("/WWBS005SD/", 1, 1) --DIALOG=<<None shall pass!>>
		self:setState('CleanupCSSoldier3Introduction')
	end

	function Ob:stateCleanupCSSoldier3Introduction()
        self:endCutscene()		
		local soldier = FindScriptObject('GamePieceSoldier3')
		local position = FindScriptObject('Soldier3Position')
		local napoleon = FindScriptObject('NapoleonScaleB')
		napoleon:restoreAfterCutscene()
		-- set the piece at the right position()
		local tx, ty, tz = position:getPosition()		
		local rx, ry, rz = position:getOrientation()		
		soldier:setPosition(tx, ty, tz)
		soldier:setOrientation(rx, ry, rz)
  		soldier:jumpToLocCleanup()
		soldier:appearOnBoard()
		if (self.jumpSpline) then
			DestroyPath(self.jumpSpline)
		end
		Global:save('Soldier3IntroductionSeen', 1)
		local p3house = FindScriptObject('Peasant3House')
		local stronghold = FindScriptObject('StrongHold')
		-- make the houses activateable
		p3house:changeState(1)
		stronghold:changeState(1)
	end

--**************************************************************************************************

	function Ob:stateDrawbridgeCloseOld()
		DomainSleep('LSOScaleADOMAIN',0)
		DomainSleep('ScaleCDOMAIN',0)
		DomainSleep('LSOScaleCDOMAIN',0)
		local napoleon = FindScriptObject('NapoleonScaleB')
		local fred = FindScriptObject('Fred')
		local bridge = FindScriptObject('DrawBridgeScaleC')
		napoleon:resetForCutscene()
		-- show napoleon giving orders
		Global.levelScript.cutsceneScript:oneShot(napoleon, 300, 300, 500)
		napoleon:sayLine("/WWBT000NP/", 1, 1) --DIALOG=<<But... I... how...>>
		self:sleep(0.5)
		napoleon:sayLine("/WWBT001NP/", 1, 1) --DIALOG=<<RETREAT!>>
		napoleon:sayLine("/WWBT002NP/", 1, 1) --DIALOG=<<Everyone into the stronghold!>>

		-- show the drawbridge going up
		self:cutTo(25906,-19029,19526, 10,118,0)
		napoleon:sayLine("/WWBT003NP/", 1, 1) --DIALOG=<<Raise the drawbridge immediatement!>>
		bridge:closeGate()
		self:sleep(1.5)

		-- show the pin
		napoleon:sayLine("/WWBT004NP/", 1, 1) --DIALOG=<<Jam the mechanism with something! Anything!>>
		bridge.rDrawBridgePin:closeGate()
		self:cutTo(22389.33, -17811.08, 22504.08, -11.12, 122.64,0)
		Global.player:sayLine("/WWBT005RA/", 1, 1) --DIALOG=<<Hey, you can\'t jam the gears! That\'s cheating!>>

		Global.levelScript.cutsceneScript:oneShot(napoleon, 300, 300, 500)
		napoleon:sayLine("/WWBT006NP/", 1, 1) --DIALOG=<<All is fair in love and war! You have fought well, but that\'s as far as you shall go my friend!>>
		fred:sayLine("/WWBT007FR/", 1, 1) --DIALOG=<<Ha! We\'ll see about that!>>
		Global.player:sayLine("/WWBT008RA/", 1, 1) --DIALOG=<<Fred? Was that you?>>

		self:cutTo(29099,-14858,16917, -16,125,0, 104)
		fred:sayLine("/WWBT009FR/", 1, 1) --DIALOG=<<Yeah! Come on! We\'re winning! >>
		fred:sayLine("/WWBT010FR/", 1, 1) --DIALOG=<<All we have to do is un-jam those gears.>>
		Global.player:sayLine("/WWBT011RA/", 1, 1) --DIALOG=<<I\'m on it, General.>>

		self:setState('CleanupCSDrawbridgeClose')
	end

	function Ob:stateCleanupCSDrawbridgeClose()
		Global:save('DrawBridgeDown', 0)
		local bridge = FindScriptObject('DrawBridgeScaleC')
		local napoleon = FindScriptObject('NapoleonScaleB')
		bridge:stopSound(bridge.rCloseSoundHandle)
		DomainSleep('LSOScaleADOMAIN',1)
		DomainSleep('ScaleCDOMAIN',1)
		DomainSleep('LSOScaleCDOMAIN',1)
        self:endCutscene()	
		napoleon:restoreAfterCutscene()
		bridge:closeGate(1)
		bridge.rDrawBridgePin:closeGate()
		Global:save('DrawbridgeCloseSeen', 1)		
		local orchard = FindScriptObject('Orchard')
		local restaurant = FindScriptObject('Restaurant')
		-- make the houses activateable
		orchard:changeState(1)
		restaurant:changeState(1)
		
		--Activate goal to open the drawbridge.
		Global.goalManager:activate('Drawbridge')
	end
	
	
--  O T H E R  F U N C T I O N S  ******************************************************************			

    function Ob:moveToPos(ent, dx, dy, dz, time )		
		local totTime = time
		while time > 0 do
			local sx, sy, sz = ent:getPosition() 
			local vx,vy,vz	
			local rate
			time = max(0, time - GetFrameSecs())
			rate = (totTime - time) / totTime
			vx = (dx - sx) * rate
			vy = (dy - sy) * rate
			vz = (dz - sz) * rate
            ent:setPosition(sx + vx,sy + vy,sz + vz)
			Yield()
		end
	end
	
--	F O R  T O O L  C U T S C E N E S  ************************************************************			
	
	function Ob:preparePieceForCutscene(piece)
	-- this sets up your piece for placement in the ____ becomes piece cutscenes
		if (self.Name == 'Knight') then
			-- move pieces if they're in the way
			if (self.bSetAtSafeSpot ~= 1) then
				self:movePiecesToSafeSpot('KnightAltPos', piece)
				self.bSetAtSafeSpot = 1			
			end		
			DomainSleep('ScaleCDOMAIN',0)
			DomainSleep('LSOScaleCDOMAIN',0)				
		end
	end
	
--**************************************************************************************************			
	
	function Ob:movePiecesToSafeSpot(baseName, piece)
		-- go through all the alt places
		local hexcontroller = FindScriptObject('HexController')
		if (hexcontroller) then
			local x, y, z = piece:getPosition()
			local hex = hexcontroller:getHexFromPosition(x, y, z)
			local altloc, i
			if (hex and hex.rOwner and hex.rOwner ~= piece) then
				-- the owner needs to move
				for i = 1, 4 do
					altloc = FindScriptObject(baseName..i)					
					if (altloc and not hexcontroller:getHexFromPosition(altloc:getPosition()).rOwner) then
						-- empty space						
						hex.rOwner:setPosition(altloc:getPosition())
						hex.rOwner:setHexUnderMeOwner(1)
						break
					end
					-- otherwise keep checking, if it fails, to be safe we just don't move the piece
				end
			end
		end
	end

--**************************************************************************************************

	function Ob:spinSign(signName, time)
		PlaySound(nil, LoadSound('YouWin'))
		local sign = FindScriptObject(signName)
		local time = time or .2
		sign:applyOrientation(0, 180, 0, .2)
	end
	
--**************************************************************************************************

	
	function Ob:stateNapoleonHint()
        self:fadeToBlack(0)
        local napoleon = FindScriptObject('NapoleonScaleB')
		napoleon:resetForCutscene()
		self:placeChar(napoleon, -27056.88, 190, 6121, 0, -116, 0)
		self:placeChar(Global.player, -27350, 113, 5990, 0, 72, 0)
		self:fadeIn(.5)

                self:cutTo(-27232,634, 5938, 17, -136, 0)
		Global.player:sayLine("/WWBU018RA/", 1, 1)--DIALOG=<<Hey, can you give me a little hint here?>>

                self:cutTo(-27232,634, 5938, 17, -136, 0)
		napoleon:sayLine("/WWBU019NP/", 1, 1)--DIALOG=<<(sigh)>>


		local line

		if Global:load('Bridge1Fixed') ~= 1 then
			if Global:load('GamePieceCarpenterActive') ~= 1 then
				line = "/WWBU020NP/"--DIALOG=<<Well, you need to enlist a carpenter so you can fix that bridge I broke, stupid.>>
 				Global.cutsceneScript:cutTo(-28752,379,4392, -16,-174,0)
			else
				line = "/WWBU021NP/"--DIALOG=<<Move the carpenter over to the bridge so he can fix it!>>
				Global.cutsceneScript:cutTo(-29202,206,5526, -21,-98,0)
			end
		elseif Global:load('GamePieceSoldier1Killed') ~= 1 then
			if Global:load('GamePieceMilitia1Active') ~= 1 then
				line = "/WWBU022NP/"--DIALOG=<<You need to talk one of these peasants into forming a militia for you!>>
				Global.cutsceneScript:cutTo(-28487,275,5687, -17,-46,0)
			else
				line = "/WWBU023NP/"--DIALOG=<<Move that militiaman next to my soldier! Do I have to tell you everything?>>
				Global.cutsceneScript:cutTo(-29039,295,5913, -13,-146,0)
			end
		elseif Global:load('WineGlassMoved') ~= 1 then
			line = "/WWBU025NP/"--DIALOG=<<There is a huge salt shaker blocking the game board. Get rid of it!>>
			Global.cutsceneScript:cutTo(-28284,771,6554, -47,42,0)
		elseif Global:load('Bridge2Fixed') ~= 1 then
			if Global:load('GamePieceCarpenterActive') ~= 1 then
				line = "/WWBU020NP/"--DIALOG=<<Well, you need to enlist a carpenter so you can fix that bridge I broke, stupid.>>
 				Global.cutsceneScript:cutTo(-28752,379,4392, -16,-174,0)
			else
				line = "/WWBU026NP/"--DIALOG=<<You\'ve got another broken bridge. Get your carpenter!>>
				Global.cutsceneScript:cutTo(-28188,472,6264, -52,4,0)
			end
		elseif Global:load('GamePieceSoldier2Killed') ~= 1 then
			if Global:load('GamePieceMilitia2Active') ~= 1 then
				line = "/WWBU024NP/"--DIALOG=<<You\'ll need to recruit another peasant if you want to keep fighting.>>
				Global.cutsceneScript:cutTo(-29020,687,5544, -53,177,0)
			else
				line = "/WWBU027NP/"--DIALOG=<<Get that militia man over to where the action is so he can fight!>>
				Global.cutsceneScript:cutTo(-27819,555,6241, -47,-18,0)
			end
		elseif Global:load('GamePieceSoldier3Killed') ~= 1 then
			if Global:load('GamePieceMilitia3Active') ~= 1 then
				line = "/WWBU028NP/"--DIALOG=<<You\'re going to need one last brave soldier.>>
				Global.cutsceneScript:cutTo(-27691,97,5491, 15,169,0)
			else
				line = "/WWBU023NP/"--DIALOG=<<Move that militiaman next to my soldier! Do I have to tell you everything?>>
				Global.cutsceneScript:cutTo(-27708,525,6302, -36,-77,0)
			end
		elseif Global:load('GamePieceKnightActive') ~= 1 then
			line = "/WWBU029NP/"--DIALOG=<<You\'ll need to get your heartiest knight out here onto the game board if you want to storm my stronghold.>>
			Global.cutsceneScript:cutTo(-27328,574,5549, -47,-7,0)
		elseif Global:load('bDrawBridgeDownPlayed') ~= 1 then
			line = "/WWBU030NP/"--DIALOG=<<Ha! No help from me! You have fought well, but you\'ll never get that draw bridge down, so you\'re knight will never be able to storm my stronghold!>>
			Global.cutsceneScript:cutTo(-27300,256,6206, -11,122,0)
		else
			line = "/WWBU031NP/"--DIALOG=<<Oh, what are you waiting for? Why don\'t you move your knight into the stronghold and get it over with?>>
			Global.cutsceneScript:cutTo(-28055,927,6687, -79,114,0)
		end

		napoleon:sayLine(line, 1, 1)

		self:setState('CleanupCSNapoleonHint')
	end

	function Ob:stateCleanupCSNapoleonHint()
		FindScriptObject('NapoleonScaleB'):restoreAfterCutscene()
        	self:endCutscene()
	end

--**************************************************************************************************

	function Ob:cleanupCSCarpenterBecomesPiece()
		Global.goalManager:deactivate('Carpenter')
		self:endCutscene()
	end

	function Ob:stateBridgeOneFix()
		local carpenter = FindScriptObject('GamePieceCarpenter')
		local bridge = FindScriptObject('Bridge1')
		local x, y, z = bridge:getPosition()
		RotateTowards2D(carpenter, x,y,z, 20000)
		Global.player:makeInvisible()
		Global.cutsceneScript:cutTo(-28482,197,5872, -10,45,0)
		-- say the lines
		carpenter:sayLine("/WWAX000CN/", 1, 1, nil)--DIALOG=<<Aw now who went and broke my beautiful bridge?>>
		carpenter:sayLine("/WWAX001CN/", 1, 1, nil)			--DIALOG=<<Don\'t worry darling. We\'ll get you fixed up good as new in no time!>>
		carpenter:fight(0, 190)	
		self:sleep(3)
		bridge:fix(1)		
 		carpenter:setAnim(carpenter.animsTable.idle)
		carpenter:sayLine("/WWAX002CN/", 1, 1, nil)			--DIALOG=<<Man, I am GOOD. Mmm!>>
		Global.levelScript.bBridgeFixed = 1
		
		--Deactivate bridge goal, time to recruit peasants
		Global.goalManager:activate('RecruitPeasants')
		self:setState('CleanupCSBridgeOneFix')
	end

	function Ob:stateCleanupCSBridgeOneFix()		
		Global.player:setPosition(-28650, 23, 5223)
		Global.player:setOrientation(0, -22, 0)
		Global.player:makeVisible()
      	self:endCutscene()		
	end

--**************************************************************************************************

	function Ob:stateBridgeTwoFix()
		local carpenter = FindScriptObject('GamePieceCarpenter')
		local bridge = FindScriptObject('Bridge2')
		local x, y, z = bridge:getPosition()
		RotateTowards2D(carpenter, x,y,z, 20000)
		Global.player:makeInvisible()
		Global.cutsceneScript:cutTo(-27797.9,187.8,5996.7, -7.8,84.0,0)
		-- say the lines
		carpenter:sayLine("/WWAX000CN/", 1, 1, nil)--DIALOG=<<Aw now who went and broke my beautiful bridge?>>
		carpenter:sayLine("/WWAX001CN/", 1, 1, nil)			--DIALOG=<<Don\'t worry darling. We\'ll get you fixed up good as new in no time!>>
		carpenter:fight(0, 190)	
		self:sleep(3)
		bridge:fix(1)		
		carpenter:setAnim(carpenter.animsTable.idle)
		carpenter:sayLine("/WWAX002CN/", 1, 1, nil)			--DIALOG=<<Man, I am GOOD. Mmm!>>
		Global.levelScript.bBridgeFixed = 1
		
		self:setState('CleanupCSBridgeTwoFix')
	end

	function Ob:stateCleanupCSBridgeTwoFix()
		Global.player:setPosition(-28656, 65, 5950)
		Global.player:setOrientation(0, 83, 0)
		Global.player:makeVisible()
      	self:endCutscene()		
	end


--**************************************************************************************************

  	function Ob:stateCleanupCSSoldier1Introduction()
		self:endCutscene()		
  		local soldier = FindScriptObject('GamePieceSoldier1')
  		local position = FindScriptObject('Soldier1Position')
  		local position2 = FindScriptObject('Soldier1Position2')
  		local bridge = FindScriptObject('Bridge1')
  		local napoleon = FindScriptObject('NapoleonScaleB')
  		napoleon:restoreAfterCutscene()
  		-- set the piece at the right position()
  		local tx, ty, tz = position2:getPosition()		
  		local rx, ry, rz = position2:getOrientation()		
  		soldier:setPosition(tx, ty, tz)
  		soldier:setOrientation(rx, ry, rz)
  		soldier:appearOnBoard()
  		soldier:jumpToLocCleanup()
  		bridge:destroy()
  		if (self.jumpSpline) then
  			DestroyPath(self.jumpSpline)
  		end
  		Global:save('Soldier1IntroductionSeen', 1)
  		local carphouse = FindScriptObject('CarpenterShop')
  		local p1house = FindScriptObject('Peasant1House')
  		-- make the houses activateable
  		carphouse:changeState(1)
  		p1house:changeState(1)
  	end

--**************************************************************************************************

	return Ob
end

