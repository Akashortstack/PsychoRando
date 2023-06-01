
--[[Script that handles placing randomized RankUp items in CAJA]]


function RankUpPlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for Randomized RankUp Items
		Ob.randoRank10 = nil
		Ob.randoRank20 = nil
		Ob.randoRank30 = nil
		Ob.randoRank40 = nil
		Ob.randoRank50 = nil
		Ob.randoRank60 = nil
		Ob.randoRank70 = nil
		Ob.randoRank80 = nil
		Ob.randoRank90 = nil
		Ob.randoRank100 = nil
    end

	-- checks player rank, moves appropriate rando items to platform if item still exists
	function Ob:randoRanks()
		local rank = Global.player.stats.rank
		if rank >= 10 and self.randoRank10 ~= nil then
			local YouWin = FindScriptObject(self.randoRank10)
            if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2010)
            else
                GamePrint('Rank10 Already Collected')
            end
		else
			GamePrint('Not Rank 10 Yet')
		end

        if rank >= 20 and self.randoRank20 ~= nil then
			local YouWin = FindScriptObject(self.randoRank20)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2110)
            else
                GamePrint('Rank20 Already Collected')
            end
		else
			GamePrint('Not Rank 20 Yet')
		end

        if rank >= 30 and self.randoRank30 ~= nil then
			local YouWin  = FindScriptObject(self.randoRank30)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2210)
            else
                GamePrint('Rank30 Already Collected')
            end
		else
			GamePrint('Not Rank 30 Yet')
		end

        if rank >= 40 and self.randoRank40 ~= nil then
			local YouWin  = FindScriptObject(self.randoRank40)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2310)
            else
                GamePrint('Rank40 Already Collected')
            end
		else
			GamePrint('Not Rank 40 Yet')
		end

        if rank >= 50 and self.randoRank50 ~= nil then
			local YouWin  = FindScriptObject(self.randoRank50)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2410)
            else
                GamePrint('Rank50 Already Collected')
            end
		else
			GamePrint('Not Rank 50 Yet')
		end

        if rank >= 60 and self.randoRank60 ~= nil then
			local YouWin = FindScriptObject(self.randoRank60)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -2510)
            else
                GamePrint('Rank60 Already Collected')
            end
		else
			GamePrint('Not Rank 60 Yet')
		end

        if rank >= 70 and self.randoRank70 ~= nil then
			local YouWin = FindScriptObject(self.randoRank70)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -1910)
            else
                GamePrint('Rank70 Already Collected')
            end
		else
			GamePrint('Not Rank 70 Yet')
		end

        if rank >= 80 and self.randoRank80 ~= nil then
			local YouWin = FindScriptObject(self.randoRank80)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -1810)
            else
                GamePrint('Rank80 Already Collected')
            end
		else
			GamePrint('Not Rank 80 Yet')
		end

        if rank >= 90 and self.randoRank90 ~= nil then
			local YouWin = FindScriptObject(self.randoRank90)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -1710)
            else
                GamePrint('Rank90 Already Collected')
            end
		else
			GamePrint('Not Rank 90 Yet')
		end

        if rank >= 100 and self.randoRank100 ~= nil then
			local YouWin = FindScriptObject(self.randoRank100)
			if YouWin ~= nil then
			    YouWin:setPosition(1129, 1193, -1610)
            else
                GamePrint('Rank100 Already Collected')
            end
		else
			GamePrint('Not Rank 100 Yet')
		end

	end
    return Ob
end