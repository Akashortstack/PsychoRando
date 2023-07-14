
--[[Script that handles placing randomized RankUp items in CAJA]]


function RankUpPlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for Randomized RankUp Items
		Ob.randoRank5 = nil
		Ob.randoRank10 = nil
		Ob.randoRank15 = nil
		Ob.randoRank20 = nil
		Ob.randoRank25 = nil
		Ob.randoRank30 = nil
		Ob.randoRank35 = nil
		Ob.randoRank40 = nil
		Ob.randoRank45 = nil
		Ob.randoRank50 = nil
		Ob.randoRank55 = nil
		Ob.randoRank60 = nil
		Ob.randoRank65 = nil
		Ob.randoRank70 = nil
		Ob.randoRank75 = nil
		Ob.randoRank80 = nil
		Ob.randoRank85 = nil
		Ob.randoRank90 = nil
		Ob.randoRank95 = nil
		Ob.randoRank100 = nil
    end

	-- checks player rank, moves appropriate rando items to platform if item still exists
	function Ob:randoRanks()
		local rank = Global.player.stats.rank
		if rank >= 5 and self.randoRank5 ~= nil then
			local YouWin = FindScriptObject(self.randoRank5)
            if YouWin ~= nil then
			    YouWin:setPosition(1560, 1206, -2178)
            else
                GamePrint('Rank5 Already Collected')
            end
		else
			GamePrint('Not Rank 5 Yet')
		end

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

		local rank = Global.player.stats.rank
		if rank >= 15 and self.randoRank15 ~= nil then
			local YouWin = FindScriptObject(self.randoRank15)
            if YouWin ~= nil then
			    YouWin:setPosition(1521, 1192, -1899)
            else
                GamePrint('Rank15 Already Collected')
            end
		else
			GamePrint('Not Rank 15 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 25 and self.randoRank25 ~= nil then
			local YouWin = FindScriptObject(self.randoRank25)
            if YouWin ~= nil then
			    YouWin:setPosition(1442, 1211, -1637)
            else
                GamePrint('Rank25 Already Collected')
            end
		else
			GamePrint('Not Rank 25 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 35 and self.randoRank35 ~= nil then
			local YouWin = FindScriptObject(self.randoRank35)
            if YouWin ~= nil then
			    YouWin:setPosition(1074, 1207, -1561)
            else
                GamePrint('Rank35 Already Collected')
            end
		else
			GamePrint('Not Rank 35 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 45 and self.randoRank45 ~= nil then
			local YouWin = FindScriptObject(self.randoRank45)
            if YouWin ~= nil then
			    YouWin:setPosition(683, 1180, -2377)
            else
                GamePrint('Rank45 Already Collected')
            end
		else
			GamePrint('Not Rank 45 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 55 and self.randoRank55 ~= nil then
			local YouWin = FindScriptObject(self.randoRank55)
            if YouWin ~= nil then
			    YouWin:setPosition(582, 1180, -2193)
            else
                GamePrint('Rank55 Already Collected')
            end
		else
			GamePrint('Not Rank 55 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 65 and self.randoRank65 ~= nil then
			local YouWin = FindScriptObject(self.randoRank65)
            if YouWin ~= nil then
			    YouWin:setPosition(690, 1211, -1767)
            else
                GamePrint('Rank65 Already Collected')
            end
		else
			GamePrint('Not Rank 65 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 75 and self.randoRank75 ~= nil then
			local YouWin = FindScriptObject(self.randoRank75)
            if YouWin ~= nil then
			    YouWin:setPosition(971, 1200, -1493)
            else
                GamePrint('Rank75 Already Collected')
            end
		else
			GamePrint('Not Rank 75 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 85 and self.randoRank85 ~= nil then
			local YouWin = FindScriptObject(self.randoRank85)
            if YouWin ~= nil then
			    YouWin:setPosition(1217, 1180, -2662)
            else
                GamePrint('Rank85 Already Collected')
            end
		else
			GamePrint('Not Rank 85 Yet')
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

		local rank = Global.player.stats.rank
		if rank >= 95 and self.randoRank95 ~= nil then
			local YouWin = FindScriptObject(self.randoRank95)
            if YouWin ~= nil then
			    YouWin:setPosition(757, 1192, -2192)
            else
                GamePrint('Rank95 Already Collected')
            end
		else
			GamePrint('Not Rank 95 Yet')
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