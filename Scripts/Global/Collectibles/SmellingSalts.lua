function SmellingSalts(Ob)

	if (not Ob) then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/SmellingSalts.plb'	-- Editable
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan'
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 1.77 -- Editable
		Ob.HeldRotY = .67 -- Editable
		Ob.HeldRotZ = -87.944 -- Editable
		Ob.level = 'all'

		Ob.idleAnim = 'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan'
		Ob.smellSalts = 'Anims/Objects/SmellingSalts/SmellSalts.jan'
		Ob.smellSaltsProp = 'Anims/Objects/SmellingSalts/SmellSaltsProp.jan'

		Ob.displayName = "/GLZB012TO/"--DIALOG=<<Smelling Salts>>
		Ob.pickupSpriteName = 'SmellingSalts'

		Ob.bSmelling = 0

		Ob.bUseOnly = 1

		Ob.dependencies = {
			meshes =
			{
				Ob.meshName,
				'GlobalModels/FX_Models/smellingSaltsVapor.plb',
			},
			scripts =
			{
				'Locator',
			}
		}
	end

-- **************************************************************************************************

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetMeshIsBackwards(self, 1)
        self.dialogTable = { -- modified on the fly, so can't be shared.
					"/GLZA004TO/",--DIALOG=<<Yes, I want to go back to the real world that badly.>>
					"/GLZA048TO/",--DIALOG=<<No, I think I\'ll stay in this mind for a while longer.>>
		}

		self.saltFX = SpawnScript('Global.Props.Geometry', 'SaltFX', 'self.meshName=\'GlobalModels/FX_Models/smellingSaltsVapor.plb\'')
		self.saltFX:hide()
		SetEntityFlag(self.saltFX, ENTITY_NOSIMULATE, 0)
    end

--*************************************************************************************************

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		self.bSmelling = 0
	end

--*************************************************************************************************
-- S T A T E S ************************************************************************************
--*************************************************************************************************

	function Ob:disableLooking()
		if (not self.disableLookingThread) then
			self.disableLookingThread = SpawnScript('dummy', 'DisableLookingThread')
			self.disableLookingThread.stateDisable = function(self)
				EnableLooking(Global.player, 0)
			end
		end
		self.disableLookingThread:setState('Disable')
	end

--*************************************************************************************************

	function Ob:enableLooking()
		self.disableLookingThread:setState(nil)
		EnableLooking(Global.player, 1)
	end

--*************************************************************************************************


	function Ob:stateUseSalts()
		SoundMuteCategory(kSOUNDCAT_FX)
		local cuTrigger = TriggerOBB_Lookup(nil, 'tv_CUAmb')
		local bFade = 1
		if Global.levelScript:getLevelName() == 'CAJA' and FindScriptObject('Ford') and FindScriptObject('Ford').bPlayingTutorial == 1 then
			-- special case for salts during power tutorial.
			Global.player:sayLine("/GLAA002RA/", 0, 1, nil, 1, nil, 1) --DIALOG=<<No, I think I\'ll stay in this mind for a while longer.>>
			self.bSmelling = 0
			bFade = 0
		--edit removing to make smelling salts work everywhere?
        --[[
			elseif Global.levelScript.levelType == 'real' and not (cuTrigger and Trigger_ContainsEntity(cuTrigger, Global.player) == 1) then
			-- insert some kind of dialog stating smelling salts have no effect in real world
			Global.player:sayLine("/GLAA003RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<I don\'t want to crack open these smelling salts unless I\'m in a mental world, and I REALLY want to get out. They smell pretty bad.>>
			self.bSmelling = 0
			bFade = 0
			]]
		else

			Global.player:doNothing()
			Global.player:interruptPowers(1)
			Yield()

			--blurred fade to black
			SetMotionBlurState(kMOTIONBLURSTATE_FADE_TO_BLACK, 0.5)
			SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 1)
			SetEntityFlag(self.saltFX, ENTITY_POST_EFFECTS, 1)
			SetEntityFlag(self, ENTITY_POST_EFFECTS, 1)
			SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 1)
			self:sleep(0.5)
			EnableLooking(Global.player, 0)

			Global.camControl:pushAndSetScript(self)
			self:dontRunPlayerControls(1)
			Yield() -- this is so that the full sim speed flag is set

			--Snap Raz to ground before we fade back in
			SnapEntityToGround(Global.player)
			
			--one shot of raz for smelling salt scene
			Global.cutsceneScript:oneShot(Global.player, 200, 130, 130, 10, 2, 0)
			self:loadAnim('Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',0,1)

			UnLoadPriorityAnim(Global.player, 1, 0)
			HideHUD(1)
			Global.player:loadAnim('Anims/DartNew/SmellSalts_start.jan',0.2,0)
			Global.cutsceneScript:fadeIn(0.5,1)
			Global.player:loadAnim('Anims/DartNew/SmellSalts_loop.jan',0.2,1)
			self:sleep(0.5)

			Global.player:sayLine("/GLAA000RA/", 1, 1, nil, 0, nil, 1) --DIALOG=<<Man, these things smell terrible. Am I sure I want to do this?>>

			self.dialogTable[1] = (Global:loadGlobal('bMCEntered') == 1 and "/GLZA055TO/") or "/GLZA004TO/"
			local chosen = DialogChoiceBubble(self.dialogTable, 1, 1)
			GamePrint(chosen)

			if (chosen == 1) then

				local line = (Global:loadGlobal('bMCEntered') == 1 and "/GLAA004RA/") or "/GLAA001RA/"
				Global.player:sayLine(line, 1, 1, nil, 0, nil, 1)
				self:loadAnim('Anims/Objects/SmellingSalts/SmellSaltsProp.jan',0.2,0)
				self:sleep(1)
				Global.player:loadAnim('Anims/DartNew/SmellSalts_end.jan',0.2,0)
				self:sleep(0.5)
				local a,b,c = Global.player:getPosInFrontOf(40, 90)
				self.saltFX:setPosition(a,b,c)
				self.saltFX:show()
				self.saltFX:setScale(0.5)
				self.saltFX:setAlpha(0, 0)

				self.saltFX:scaleLSO(1, 2, 0, 1) -- Scale the LSO using the real time clock, since the game is otherwise paused.
				self.saltFX:setAlpha(1, 1)
				self:sleep(1)
				self.saltFX:setAlpha(0, 1)
				self:sleep(1)
				Global.cutsceneScript:fadeToBlack(0.3,1)
				Global:saveGlobal('bKickedOut', 1)
				Global:saveGlobal('bUsedSalts', 1)
				self:loadAnim('Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan')

				-- Clear motion blur effect
				SetMotionBlurState(kMOTIONBLURSTATE_STANDARD, 0)
				SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 0)
				SetEntityFlag(self.saltFX, ENTITY_POST_EFFECTS, 0)
				SetEntityFlag(self, ENTITY_POST_EFFECTS, 0)
				SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 0)


				--edit to place player into CU regardless of salt use location
				Global.levelScript:returnToCU()
				--[[

				if (Global:loadGlobal('bMCEntered') == 1) then
					if (Global.levelScript:getLevelName() == 'CASA') then
						--Go back to MC
						Global.levelScript:loadNewLevel('MCTC')
					else
						Global.levelScript:returnToCU()
					end
				else
					--If the player entered the mental realm by braining a characer, then we should put him back near
					--that character for the sake of clarity.  If not, he is sent back to CASA.
					local lastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
					if (lastBrainingLevel) then
						--LastBrainingLevel will get cleared out in startPlayer of the next level, because
						--it needs it to know where to place the player.
						Global.levelScript:loadNewLevel(Global:getPhysicalLevel(lastBrainingLevel))
					else
						--Otherwise, the player must have entered from the CU, so send him to CASA.
						Global.levelScript:loadNewLevel('CASA')
					end
				end
				]]
			else
				Global.player:loadAnim('Anims/DartNew/SmellSalts_cancel.jan',0.2,0)
				Global.player:sayLine("/GLAA002RA/", 1, 1, nil, 0, nil, 1) --DIALOG=<<No, I think I\'ll stay in this mind for a while longer.>>
			end
		end
		self:xCleanUp(bFade)
		--Has to be the last thing to happen, because it puts us in the Inventory domain, which means NOSIMULATE
		Global.player:replaceSelectedItemInPsack(1, 1)
		self:enableLooking()
		SoundUnmuteCategory(kSOUNDCAT_FX)
		Global.player.block = 0
		DebugSetGameSpeed(1)
		-- to resume paused sound
		SoundResumeAll()
		self:setState(nil)
	end

	function Ob:xCleanUp(bFade)
		bFade = bFade or 1
		if bFade == 1 then
			Global.cutsceneScript:fadeToBlack(0.5,1)
		end
		SetMotionBlurState(kMOTIONBLURSTATE_STANDARD, 0)
		SetEntityFlag(Global.player, ENTITY_POST_EFFECTS, 0)
		SetEntityFlag(self, ENTITY_POST_EFFECTS, 0)
		SetEntityFlag(Global.levelScript.rInstaHintFord, ENTITY_POST_EFFECTS, 0)

		Global.camControl:removeCam(self)
		SetPhysicsFlag(Global.player, PHYSICS_NOPHYSICS, 0)
		SetEntityFlag(Global.player, ENTITY_FULL_SIM_SPEED, 0)
		SetEntityFlag(self.disableLookingThread, ENTITY_FULL_SIM_SPEED, 0)
		SetEntityFlag(Global.cutsceneScript, ENTITY_FULL_SIM_SPEED, 0)
		DebugSetGameSpeed(1)
		-- to resume paused sound
		SoundResumeAll()
		if bFade == 1 then
			Global.cutsceneScript:fadeIn(0.5, 1)
		end
		self:dontRunPlayerControls(0)
		self.bSmelling = 0
		Global.player.block = 0
		
		HideHUD(0)
	end

--*************************************************************************************************
-- M E S S A G E  H A N D L E R S *****************************************************************
--*************************************************************************************************

	function Ob:onActivateFromInventory(data, from)
		if self.bSmelling ~= 1 then
			Global.player.block = 1
			self.bSmelling = 1
			SetControlHandler(kCONTROL_PLAYER)
			self:disableLooking()
			
			-- pause everything
			DebugSetGameSpeed(0)
			-- to stop CRH handler from running
			SoundPauseAll()
			SetEntityFlag(self, ENTITY_FULL_SIM_SPEED, 1)
			SetEntityFlag(Global.player, ENTITY_FULL_SIM_SPEED, 1)
			SetPhysicsFlag(Global.player, PHYSICS_NOPHYSICS, 1)
			SetEntityFlag(Global.cutsceneScript, ENTITY_FULL_SIM_SPEED, 1)
			SetEntityFlag(self.saltFX, ENTITY_FULL_SIM_SPEED, 1)
			SetEntityFlag(self.disableLookingThread, ENTITY_FULL_SIM_SPEED, 1)
			
			self:setState('UseSalts')
		end
	end

	function Ob:onDestroyed(bBecause)
		%Ob.Parent.onDestroyed(self, bBecause)
		-- Fixes problem of exiting to demo menu while salted.
		SetEntityFlag(FindScriptObject('Dart'), ENTITY_POST_EFFECTS, 0)
	end

	function Ob:onSelected()
		if (%Ob.Parent.onSelected) then
			%Ob.Parent.onSelected(self)
		end
		self:onActivateFromInventory()
	end

--*************************************************************************************************
-- F U N C T I O N S ******************************************************************************
--*************************************************************************************************


--*************************************************************************************************

  return Ob

end
