
-- there are 50 different baggage items, 5 types with 10 each
local prog_baggage_names = {
    "Suitcase1",
    "Suitcase2",
    "Suitcase3",
    "Suitcase4",
    "Suitcase5",
    "Suitcase6",
    "Suitcase7",
    "Suitcase8",
    "Suitcase9",
    "Suitcase10",
    "Purse1",
    "Purse2",
    "Purse3",
    "Purse4",
    "Purse5",
    "Purse6",
    "Purse7",
    "Purse8",
    "Purse9",
    "Purse10",
    "Hatbox1",
    "Hatbox2",
    "Hatbox3",
    "Hatbox4",
    "Hatbox5",
    "Hatbox6",
    "Hatbox7",
    "Hatbox8",
    "Hatbox9",
    "Hatbox10",
    "Steamertrunk1",
    "Steamertrunk2",
    "Steamertrunk3",
    "Steamertrunk4",
    "Steamertrunk5",
    "Steamertrunk6",
    "Steamertrunk7",
    "Steamertrunk8",
    "Steamertrunk9",
    "Steamertrunk10",
    "Dufflebag1",
    "Dufflebag2",
    "Dufflebag3",
    "Dufflebag4",
    "Dufflebag5",
    "Dufflebag6",
    "Dufflebag7",
    "Dufflebag8",
    "Dufflebag9",
    "Dufflebag10",
}

local start_id = 756 
prog_baggage_name_to_id = {}
for i = 1, getn(prog_baggage_names) do
    local name = prog_baggage_names[i]
    prog_baggage_name_to_id[name] = start_id + i - 1
end

function APProgBaggageShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:collectedProgBaggageLocation(name)
        location_id = prog_baggage_name_to_id[name]
        if location_id then
            apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
        else
            GamePrint(name .. " is not a valid progressive baggage name")
        end
    end

    return Ob
end