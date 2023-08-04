
--[[Script that handles placing special, condition based items in WWMA]]


function WWPuzzlePlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for WW Puzzle Items
		Ob.p1Helped = nil
		Ob.p2Helped = nil
		Ob.p3Helped = nil
		Ob.carpenterHelped = nil
		Ob.knightHelped = nil
		Ob.p3Puzzle = nil
    end

	-- Turning in Fred's Note, moves appropriate rando items if item still exists
	function Ob:peasant1Help()
		local YouWin = FindScriptObject(self.p1Helped)
        if YouWin ~= nil then
			
		    YouWin:setPosition(19379, -19757, 9354)
        else
            GamePrint('p1Helped Already Collected')
		end
	end

	-- Turning in Priceless Coin, moves appropriate rando items if item still exists
	function Ob:peasant2Help()
		local YouWin = FindScriptObject(self.p2Helped)
        if YouWin ~= nil then
			
		    YouWin:setPosition(10685, -19674, 14478)
        else
            GamePrint('p2Helped Already Collected')
		end
	end
	-- Turning in Musket, moves appropriate rando items if item still exists
	function Ob:peasant3Help()
		local YouWin = FindScriptObject(self.p3Helped)
        if YouWin ~= nil then
			
		    YouWin:setPosition(23080, -19303, 13613)
        else
            GamePrint('p3Helped Already Collected')
		end
	end
	-- Helping Carpenter, moves appropriate rando items if item still exists
	function Ob:carpenterHelp()
		local YouWin = FindScriptObject(self.carpenterHelped)
        if YouWin ~= nil then
			
		    YouWin:setPosition(12661, -19744, 1516)
        else
            GamePrint('carpenterHelped Already Collected')
		end
	end
	-- Helping Knight, moves appropriate rando items if item still exists
	function Ob:knightHelp()
		local YouWin = FindScriptObject(self.knightHelped)
        if YouWin ~= nil then
			
		    YouWin:setPosition(27713, -19675, 6912)
        else
            GamePrint('knightHelped Already Collected')
		end
	end
	-- Helping Knight, moves appropriate rando items if item still exists
	function Ob:HaybalePuzzle()
		local YouWin = FindScriptObject(self.p3Puzzle)
        if YouWin ~= nil then
			
		    YouWin:setPosition(23210, -19151, 18198)
        else
            GamePrint('HaybalePuzzle Already Collected')
		end
	end

    return Ob
end