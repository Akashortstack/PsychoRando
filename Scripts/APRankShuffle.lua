
-- there are 100 different "rank up" locations since you start at 1, go to 101 (max in vanilla), one 
-- one reward every rank for RankSanity, every five ranks normally
local rank_names = {
    "Rank2",
    "Rank3",
    "Rank4",
    "Rank5",
    "Rank6",
    "Rank7",
    "Rank8",
    "Rank9",
    "Rank10",
    "Rank11",
    "Rank12",
    "Rank13",
    "Rank14",
    "Rank15",
    "Rank16",
    "Rank17",
    "Rank18",
    "Rank19",
    "Rank20",
    "Rank21",
    "Rank22",
    "Rank23",
    "Rank24",
    "Rank25",
    "Rank26",
    "Rank27",
    "Rank28",
    "Rank29",
    "Rank30",
    "Rank31",
    "Rank32",
    "Rank33",
    "Rank34",
    "Rank35",
    "Rank36",
    "Rank37",
    "Rank38",
    "Rank39",
    "Rank40",
    "Rank41",
    "Rank42",
    "Rank43",
    "Rank44",
    "Rank45",
    "Rank46",
    "Rank47",
    "Rank48",
    "Rank49",
    "Rank50",
    "Rank51",
    "Rank52",
    "Rank53",
    "Rank54",
    "Rank55",
    "Rank56",
    "Rank57",
    "Rank58",
    "Rank59",
    "Rank60",
    "Rank61",
    "Rank62",
    "Rank63",
    "Rank64",
    "Rank65",
    "Rank66",
    "Rank67",
    "Rank68",
    "Rank69",
    "Rank70",
    "Rank71",
    "Rank72",
    "Rank73",
    "Rank74",
    "Rank75",
    "Rank76",
    "Rank77",
    "Rank78",
    "Rank79",
    "Rank80",
    "Rank81",
    "Rank82",
    "Rank83",
    "Rank84",
    "Rank85",
    "Rank86",
    "Rank87",
    "Rank88",
    "Rank89",
    "Rank90",
    "Rank91",
    "Rank92",
    "Rank93",
    "Rank94",
    "Rank95",
    "Rank96",
    "Rank97",
    "Rank98",
    "Rank99",
    "Rank100",
    "Rank101",
}

local start_id = 606 
rank_name_to_id = {}
for i = 1, getn(rank_names) do
    local name = rank_names[i]
    rank_name_to_id[name] = start_id + i - 1
end

function APRankShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:collectedRank(num)
    local current_checked_rank = Global:loadGlobal("APRankMax") or 0

    for rank = current_checked_rank + 1, num do
        local name = "Rank" .. rank  -- concatenate to get proper rank name
        local location_id = rank_name_to_id[name]
        
        if location_id then
            local apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
            Global:saveGlobal("APRankMax", rank)  -- update max rank collected
        else
            GamePrint(name .. " is not a valid rank name")
        end
    end
end


    return Ob
end