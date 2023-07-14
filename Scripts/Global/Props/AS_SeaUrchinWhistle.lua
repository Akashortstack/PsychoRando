--
--  AS_SeaUrchinWhistle.lua
--
--	Raz uses the Sea Urchin Whistle to call the Lungfish
--	when he needs a ride between the Asylum and the Campgrounds.                
--
--  
--  from  P S Y C H O N A U T S
--
--  (c) 2003 Double Fine Productions, Inc.  
--  All Rights Reserved.
--  Proprietary and Confidential
--

function AS_SeaUrchinWhistle(Ob)
	if (Ob == nil) then
		Ob = CreateObject('Global.Props.HeldObject')
    
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/FishWhistle.plb'
  
		--  User Interface variables 
		Ob.heldscale = 1
		Ob.needstarget = FALSE
		Ob.usedFromInterface = 1
		
		--  functionality variables
		Ob.loadLevel = 'CABH_NIGHT'   -- 'ASGR' / 'CABH_NIGHT'
		
		--Ob.HeldPosX = 1.7;
		--Ob.HeldPosY = 21.8;
		--Ob.HeldPosZ = 16.9;
		--Ob.HeldRotX = 41.334;
		--Ob.HeldRotY = 38.729;
		--Ob.HeldRotZ = 31.845;
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/HoldFishWhistle.jan'
		--Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistWidePalmIn_ArmLf.jan'
		Ob.player = nil
		Ob.pickupSpriteName = 'SeaUrchinWhistle'
   		Ob.displayName = "/GLZB040TO/"--DIALOG=<<Sea Urchin Whistle>>

   		Ob.bUseOnly = 1
   		Ob.bGroundUseOnly = 1

		--edit removed, default is 'all'
		--Ob.level = 'real'

		Ob.dependencies = {
			meshes = {
				'GlobalModels/Objects/HeldObjects/FishWhistle.plb',
			},
			textures = {
				'Textures/UI/Sayline Heads/FordNinja_sayline.dds',
			},
		}
	end

	--edit to sendMessage to Dart on pickup
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)	
	end


	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
--		self.toot = LoadSound('Sounds/FX/TEMPSeaUrchinWhistle.wav')
		self:setEntityInterestLevel(2)
		SetMaxViewDistance(self,500)
		SetEntityFlag(self,ENTITY_DRAWSHADOW,1)
		self.whistleSound = LoadSound('LungfishWhistle')
	end  
	
	function Ob:stateCheck()
		if Global.levelScript.WhistleVolume and Trigger_ContainsEntity(Global.levelScript.WhistleVolume, Global.player) == 1 then
			local levelName = Global.levelScript:getLevelName()
			if (levelName == 'ASGR') then
				self.loadLevel = 'CABH_NIGHT'
			elseif (levelName == 'CABH') then
				self.loadLevel = 'ASGR'
			else
				self.loadLevel = ''
				self:fail()
				return
			end
			
			if (Global:loadGlobal('LungfishWhistleUsed') ~= 1) then
				Global:saveGlobal('LungfishWhistleUsed', 1)
				--AddTutorialBox('Hey, if you blow that thing on the beach then our Hulking Lungfish friend is going to come up out of the water and take you to the other side of the lake. You sure you want to do that?', 'Textures/UI/Sayline Heads/FordNinja_sayline.dds', 'Yes', 'No', self)
				AddTutorialBox(	"/GLZA052TO/", --DIALOG=<</FordNinja/ Hey, if you blow that thing on the beach then our Hulking Lungfish friend is going to come up out of the water and take you to the other side of the lake. You sure you want to do that?>>
								'Textures/UI/Sayline Heads/FordNinja_sayline.dds',
								"/GLZD383TO/", --DIALOG=<<Yes.>>
								"/GLZA038TO/", --DIALOG=<<No.>>
								self)
			else
				self:setState('LevelLoad')
			end
		else
			self:fail()
		end
	end	
	
	
	function Ob:onTutorialChoice(szLineCode,from,iRet)
		if( 1 == iRet ) then
			self:setState('LevelLoad')
		else
			self:setState(nil)
		end
	end

	
	function Ob:fail()
		Global.player:dontRunPlayerControls(1)
		-- kill the clutch anim
		UnLoadPriorityAnim(Global.player,1,0.0)
		-- play the whistle anim
		LoadAnim(Global.player, 'Anims/DartNew/FishWhistle.jan', 0.2, 0)
		self:sleep(3)
		Global.player:dontRunPlayerControls(0)
		-- get the clutch anim back
		Global.player:setClutchAnim()
		
		local quentin = FindScriptObject('Quentin',1)
		local phoebe = FindScriptObject('Phoebe',1)
		local jt = FindScriptObject('JT',1)
		local chops = FindScriptObject('Chops',1)
		local loboto = FindScriptObject('Lobato',1)
		local gloria = FindScriptObject('AS_Gloria',1)
		local boyd = FindScriptObject('AS_Boyd',1)
		
		local target = GetLookTarget(Global.player)
		if (quentin and phoebe) then
			if (quentin:distance(Global.player) < phoebe:distance(Global.player)) then
				quentin:sayLine("/GLGO040QU/", 0, 0, nil, 1, nil, 1) --DIALOG=<<Hey, that\'s a pretty sweet sound there homey. Why don\'t you come jam with us some time?>>
			else
				phoebe:sayLine("/GLGO041PH/",0, 0, nil, 1, nil, 1) --DIALOG=<<Wooo! Lake whistle solo!>>
			end
		elseif (quentin and quentin:distance(Global.player) < 600) then
			quentin:sayLine("/GLGO040QU/",0, 0, nil, 1, nil, 1) --DIALOG=<<Hey, that\'s a pretty sweet sound there homey. Why don\'t you come jam with us some time?>>
		elseif (phoebe and phoebe:distance(Global.player) < 600) then
			phoebe:sayLine("/GLGO041PH/",0, 0, nil, 1, nil, 1) --DIALOG=<<Wooo! Lake whistle solo!>>
		elseif (jt and chops) then
			if (jt:distance(Global.player) < chops:distance(Global.player)) then
				jt:sayLine("/GLGO042JT/",0, 0, nil, 1, nil, 1) --DIALOG=<<Now that\'s the darndest harmonica I ever heard. That could be just the sound to take this band in the prog-rock direction I was hoping for.>>
			else
				chops:sayLine("/GLGO043CP/",0, 0, nil, 1, nil, 1) --DIALOG=<<Hmmm. A horn section might be just what we need.>>
			end
		elseif (jt and jt:distance(Global.player) < 600) then
			jt:sayLine("/GLGO042JT/",0, 0, nil, 1, nil, 1) --DIALOG=<<Now that\'s the darndest harmonica I ever heard. That could be just the sound to take this band in the prog-rock direction I was hoping for.>>
		elseif (chops and chops:distance(Global.player) < 600) then
			chops:sayLine("/GLGO043CP/",0, 0, nil, 1, nil, 1) --DIALOG=<<Hmmm. A horn section might be just what we need.>>
		elseif (loboto and loboto:distance(Global.player) < 1300) then
			loboto:sayLine("/GLGO044LO/",0, 0, nil, 1, nil, 1) --DIALOG=<<Sheegor, please! Open a window if you\'re going to do that.>>
		elseif (gloria and gloria:distance(Global.player) < 600) then
			gloria:sayLine("/ASAX006GL/",0, 0, nil, 1, nil, 1) --DIALOG=<<Ooh, sounds like one of the French horns in the orchestra is a little flat.>>
		elseif (boyd and boyd:distance(Global.player) < 600) then
			boyd:setState('WhistleReact')
		elseif( target ) then
			self:sendMessage( target, 'Item', 'SeaUrchinWhistle')
		else
			Global.player:sayLine("/GLGO045RA/", 0, 1, nil, 1, nil, 1) --DIALOG=<<I think I have to be closer to the shore for Linda to hear it. >>
		end
		self:setState(nil)
	end

	function Ob:beginStateLevelLoad()
		Global.cutsceneScript:runCutscene('LungfishWhistleA')
		self:setState(nil)
	end
	
	function Ob:stateLevelLoad()
		self:setState(nil)
	end	

	function Ob:onActivateFromInventory(data, from)
		self:setState('Check')
	end 
				
	return Ob
    
end
