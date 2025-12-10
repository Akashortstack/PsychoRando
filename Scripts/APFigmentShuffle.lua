
-- there are 50 different figment locations , one for every 20% of figments found,
-- ten different levels with figments
-- names are concatenated with the percentage and the level name
local figment_percent_names = {
    "Figment20BB",
    "Figment40BB",
    "Figment60BB",
    "Figment80BB",
    "Figment100BB",
    "Figment20SA",
    "Figment40SA",
    "Figment60SA",
    "Figment80SA",
    "Figment100SA",
    "Figment20MI",
    "Figment40MI",
    "Figment60MI",
    "Figment80MI",
    "Figment100MI",
    "Figment20NI",
    "Figment40NI",
    "Figment60NI",
    "Figment80NI",
    "Figment100NI",
    "Figment20LO",
    "Figment40LO",
    "Figment60LO",
    "Figment80LO",
    "Figment100LO",
    "Figment20MM",
    "Figment40MM",
    "Figment60MM",
    "Figment80MM",
    "Figment100MM",
    "Figment20TH",
    "Figment40TH",
    "Figment60TH",
    "Figment80TH",
    "Figment100TH",
    "Figment20WW",
    "Figment40WW",
    "Figment60WW",
    "Figment80WW",
    "Figment100WW",
    "Figment20BV",
    "Figment40BV",
    "Figment60BV",
    "Figment80BV",
    "Figment100BV",
    "Figment20MC",
    "Figment40MC",
    "Figment60MC",
    "Figment80MC",
    "Figment100MC",
}

local start_id = 706 
figment_percent_name_to_id = {}
for i = 1, getn(figment_percent_names) do
    local name = figment_percent_names[i]
    figment_percent_name_to_id[name] = start_id + i - 1
end

function APFigmentShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
        SpawnScript('RandoFigmentHandler', 'RandoFigmentHandler')
    end

    function Ob:collectedFigmentLocation(percent, levelPrefix)
        local name = ("Figment"..percent..levelPrefix)
        location_id = figment_percent_name_to_id[name]
        if location_id then
            apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
        else
            GamePrint(name .. " is not a valid figment percent name")
        end
    end


    return Ob
end