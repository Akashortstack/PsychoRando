function SACUCutscenes_hooks(Ob)

    --Cutscene after turning the censor machine ALL the way up
    local stateCleanupCSNowRazHasDoneIt_original = Ob.stateCleanupCSNowRazHasDoneIt
    function Ob:stateCleanupCSNowRazHasDoneIt()

        --spawn randomizer items for Face 1
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(1)

		--re-enable Mental Magnet if disabled during tutorial to prevent bug
		local checkmagnet = FindScriptObject('LevelScript')
		if checkmagnet.mentalMagnetOff == 1 then
			Global:saveGlobal('bHasMentalMagnet', 1)
			checkmagnet.mentalMagnetOff = 0
		end

        %stateCleanupCSNowRazHasDoneIt_original(self)
        
    end

    --Cutscene after finishing Cube Face 1
    local stateCleanupCSShutdown1_original = Ob.stateCleanupCSShutdown1
    function Ob:stateCleanupCSShutdown1()

        --spawn randomizer items for Face 2
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(2)

        %stateCleanupCSShutdown1_original(self)
        
    end

    --Cutscene after finishing Cube Face 2
    local stateCleanupCSShutdown2_original = Ob.stateCleanupCSShutdown2
    function Ob:stateCleanupCSShutdown2()

        --spawn randomizer items for Face 3
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(3)

        %stateCleanupCSShutdown2_original(self)
        
    end

    --Cutscene after finishing Cube Face 3
    local stateCleanupCSShutdown3_original = Ob.stateCleanupCSShutdown3
    function Ob:stateCleanupCSShutdown3()

        --spawn randomizer items for Face 4
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(4)

        %stateCleanupCSShutdown3_original(self)
        
    end

    --Cutscene after finishing Cube Face 4
    local stateCleanupCSShutdown6_original = Ob.stateCleanupCSShutdown6
    function Ob:stateCleanupCSShutdown6()

        --remove all randomizer items during Boss
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(0)

        %stateCleanupCSShutdown6_original(self)
        
    end

    --FULL FUNCTION OVERRIDE
    --end of level after all the cutscenes
    function Ob:stateCleanupCSMarksmanshipBadge()
		self:fadeToBlack(0)
		Global.goalManager:deactivate('LearnPsiBlast')
		Global.goalManager:activate('BrainTumbler1')

		Global:setLevelToCompleted('SA')
		Global.player.block = 0
		--return to CU instead
		Global.levelScript:returnToCU()
		self:endCutscene()
	end

    --FULL FUNCTION OVERRIDE
    --triggers every time we re-enter a cube face?

    function Ob:stateReentryCloseFace()
		self:fadeToBlack(0)
		local face = Global:load('currentFace')
		if (face) then
			local rFace = self:getFace(face)
			rFace:setState('Close')
			Global:save('currentFace', nil)
			if (face == 1) then
				self:playVideo('cutScenes/prerendered/SACU_Face1_implosion.bik', 0, 0, 0)
				Global.player:setPosition(30.3, -4.5, -189.3)
				Global.player:setOrientation(0, -35.6, 0)

				--edit remove all collectible spawns
				local puzzle = fso('SAItemPlacer')
				puzzle:revealPuzzleItems(0)
				
			elseif (face == 2) then
				self:playVideo('cutScenes/prerendered/SACU_Face2_implosion.bik', 0, 0, 0)
				Global.player:setPosition(1827.2, -1515.9, -190.7)
				Global.player:setOrientation(0.1, 33.5, -90)

				--edit remove all collectible spawns
				local puzzle = fso('SAItemPlacer')
				puzzle:revealPuzzleItems(0)

			elseif (face == 3) then
				self:playVideo('cutScenes/prerendered/SACU_Face3_implosion.bik', 0, 0, 0)
				Global.player:setPosition(-285.9, -1863.3, -1827.1)
				Global.player:setOrientation(-90, 0, -18)

				--edit remove all collectible spawns
				local puzzle = fso('SAItemPlacer')
				puzzle:revealPuzzleItems(0)

			elseif (face == 6) then
				self:playVideo('cutScenes/prerendered/SACU_Face6_implosion.bik', 0, 0, 0)
				Global.player:setPosition(-155.4, -3658.6, -370.8)
				Global.player:setOrientation(180, -140.5, 0)
				
				--edit remove all collectible spawns
				local puzzle = fso('SAItemPlacer')
				puzzle:revealPuzzleItems(0)

			end
			Global.player:snapToGround(100)
			self:sleep(1)
		end
		self:endCutscene()	

   		Global.levelScript.razOnExtrudedFace = 0
		Global:setPlayerRespawnPointName(nil)

		self:fadeIn(1)	
	end



end