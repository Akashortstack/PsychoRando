function WWMACutscenes_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --[[This cutscene only happens after talking to Villager 1, and they request Fred's Letter
    Normally, Fred gives the letter to Raz here
    Removing the whole cutscene because his letter has been moved to the item pool]]
	function Ob:stateFredSignsCaringForm()
		self:endCutscene()
	end

    local stateCleanupCSCarpenterBecomesPiece_original = Ob.stateCleanupCSCarpenterBecomesPiece
    function Ob:stateCleanupCSCarpenterBecomesPiece()
        --Spawn Rando Reward for helping the carpenter
		local helped = fso('WWPuzzlePlacer')	
		helped:carpenterHelp()
        %stateCleanupCSCarpenterBecomesPiece_original(self)
    end

    local stateCleanupCSKnightBecomesPiece_original = Ob.stateCleanupCSKnightBecomesPiece
    function Ob:stateCleanupCSKnightBecomesPiece()
        --Spawn Rando Reward for helping the knight
		local helped = fso('WWPuzzlePlacer')	
		helped:knightHelp()
        %stateCleanupCSKnightBecomesPiece_original(self)
    end
    
    local stateCleanupCSPeasantOneBecomesSoldier_original = Ob.stateCleanupCSPeasantOneBecomesSoldier
    function Ob:stateCleanupCSPeasantOneBecomesSoldier()
        --Spawn Rando Reward for helping peasant 1 (Fred's letter)
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant1Help()
        %stateCleanupCSPeasantOneBecomesSoldier_original(self)
    end

    local stateCleanupCSPeasantThreeBecomesSoldier_original = Ob.stateCleanupCSPeasantThreeBecomesSoldier
    function Ob:stateCleanupCSPeasantThreeBecomesSoldier()
        --Spawn Rando Reward for helping peasant 3 (Musket)
		local helped = fso('WWPuzzlePlacer')	
		helped:peasant3Help()
        %stateCleanupCSPeasantThreeBecomesSoldier_original(self)
    end

    local stateCleanupCSPeasantTwoBecomesSoldier_original = Ob.stateCleanupCSPeasantTwoBecomesSoldier
    function Ob:stateCleanupCSPeasantTwoBecomesSoldier()
        --Spawn Rando Reward for helping peasant 2 (Priceless Coin)
        GamePrint('Helping Soldier 2')
		local helped = fso('WWPuzzlePlacer')
        GamePrint('WWPuzzleplacer found')	
		helped:peasant2Help()
        GamePrint('peasant2Help done')	
        %stateCleanupCSPeasantTwoBecomesSoldier_original(self)
    end

    --need this as well, in case player already has the coin before talking to the villager 1st time
    local stateCleanupCSPeasantTwoBecomesSoldierQuick_original = Ob.stateCleanupCSPeasantTwoBecomesSoldierQuick
    function Ob:stateCleanupCSPeasantTwoBecomesSoldierQuick()
        --Spawn Rando Reward for helping peasant 2 (Priceless Coin)
        GamePrint('Helping Soldier 2 quick')
		local helped = fso('WWPuzzlePlacer')
        GamePrint('WWPuzzleplacer found')	
		helped:peasant2Help()
        GamePrint('peasant2Help done')	
        %stateCleanupCSPeasantTwoBecomesSoldierQuick_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --end of level
    function Ob:stateCleanupCSWWNS()
		Global.goalManager:deactivate('HelpFred')
		Global:setLevelToCompleted('WW')
		--return to CU instead
		Global.levelScript:returnToCU()
		self:endCutscene()
	end
    


end