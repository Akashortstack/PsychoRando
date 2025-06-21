function WWMA_hooks(Ob)
    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --handles placing different randomized items when conditions in level are met
        self.puzzles = SpawnScript('WW.WWPuzzlePlacer', 'WWPuzzlePlacer')
    end

    local onPostBeginLevel_original = Ob.onPostBeginLevel
    function Ob:onPostBeginLevel()
        --Spawn Rando Rewards if already done, but not picked up.
		if Global:load('bCarpenterBecomesPiecePlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:carpenterHelp()
		end

		if Global:load('bPeasantOneBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant1Help()
		end

		if Global:load('bPeasantTwoBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant2Help()
		end

		if Global:load('bPeasantThreeBecomesSoldierPlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:peasant3Help()
		end

		if Global:load('bKnightBecomesPiecePlayed') == 1 then
			local helped = fso('WWPuzzlePlacer')	
			helped:knightHelp()
		end
        %onPostBeginLevel_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --This handles spawning the Musket after burning the Haybale
    --Replaced entirely to be handled by the WWPuzzlePlacer.lua
    function Ob:onGPGFireDissipate( data, from )
		local burned = fso('WWPuzzlePlacer')	
		burned:HaybalePuzzle()
	end

    --FULL FUNCTION OVERRIDE
    function Ob:hidePeasant3Item()
		--removed, done by WWPuzzlePlacer.lua instead
	end

	--FULL FUNCTION OVERRIDE
	function Ob:showPeasant3Item()
	    --removed, done by WWPuzzlePlacer.lua instead
	end




end