
function RandoFigmentHandler(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --[[Each table holds five values, each a 20% increment of figments in the level]]
        Ob.BB = {
            33,
            65,
            98,
            130,
            163,
        }

        Ob.SA = {
            14,
            28,
            41,
            55,
            69,
        }

        Ob.MI = {
            47,
            93,
            140,
            186,
            233,
        }

        Ob.NI = {
            18,
            37,
            55,
            74,
            92,
        }

        Ob.LO = {
            23,
            45,
            68,
            90,
            113,
        }

        Ob.MM = {
            43,
            85,
            128,
            170,
            213,
        }

        Ob.TH = {
            31,
            63,
            94,
            126,
            157,
        }

        Ob.WW = {
            49,
            97,
            146,
            194,
            243,
        }

        Ob.BV = {
            32,
            64,
            96,
            128,
            160,
        }

        Ob.MC = {
            19,
            38,
            56,
            75,
            94,
        }
    end

    function Ob:collectedFigment()
        --get level prefix, increase figment counter
        local levelPrefix = Global.levelScript:getLevelPrefix()
        --increase global figment counter for current level by 1
        local x = Global:loadGlobal('figmentCount'..levelPrefix) or 0
        Global:saveGlobal('figmentCount'..levelPrefix, x+1)

        --pull the current level's Percent Threshold from the table
        local figmentThresholds = self[levelPrefix]
        local totalFigments = Global:loadGlobal('figmentCount'..levelPrefix)
        GamePrint("Total Figments = "..totalFigments)

        for i = 1, getn(figmentThresholds) do
            local value = figmentThresholds[i]
            local percent = i * 20 --multiply by 20 to get the percentage threshold
            local apCollected = Global:loadGlobal('percentFigments'..levelPrefix..percent) or 0
            if totalFigments >= value then
                -- Send an AP location when increasing rank
		        local figmentShuffle = fso('APFigmentShuffle', 'APFigmentShuffle')
		        if figmentShuffle and (apCollected ~= 1) then --only call if not collected yet
                    GamePrint("Collected "..percent.." percent of figments in "..levelPrefix)
                    Global:saveGlobal('percentFigments'..levelPrefix..percent, 1)
			        figmentShuffle:collectedFigmentLocation(percent, levelPrefix)
		        end
            else
                return
            end
        end

    end


    return Ob
end