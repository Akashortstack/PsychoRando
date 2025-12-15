
-- there are 50 different figment locations , one for every 20% of figments found,
-- ten different levels with figments
-- names are concatenated with the percentage and the level name
local figment_percent_names = {
    "Figment20BB",
    "Figment20SA",
    "Figment20MI",
    "Figment20NI",
    "Figment20LO",
    "Figment20MM",
    "Figment20TH",
    "Figment20WW",
    "Figment20BV",
    "Figment20MC",
    "Figment40BB",
    "Figment40SA",
    "Figment40MI",
    "Figment40NI",
    "Figment40LO",
    "Figment40MM",
    "Figment40TH",
    "Figment40WW",
    "Figment40BV",
    "Figment40MC",
    "Figment60BB",
    "Figment60SA",
    "Figment60MI",
    "Figment60NI",
    "Figment60LO",
    "Figment60MM",
    "Figment60TH",
    "Figment60WW",
    "Figment60BV",
    "Figment60MC",
    "Figment80BB",
    "Figment80SA",
    "Figment80MI",
    "Figment80NI",
    "Figment80LO",
    "Figment80MM",
    "Figment80TH",
    "Figment80WW",
    "Figment80BV",
    "Figment80MC",
    "Figment100BB",
    "Figment100SA",
    "Figment100MI",
    "Figment100NI",
    "Figment100LO",
    "Figment100MM",
    "Figment100TH",
    "Figment100WW",
    "Figment100BV",
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