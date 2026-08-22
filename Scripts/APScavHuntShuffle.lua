local scav_hunt_names = {
    "ScavHunt50",
    "ScavHunt100",
}

local start_id = 806 
scav_hunt_name_to_id = {}
for i = 1, getn(scav_hunt_names) do
    local name = scav_hunt_names[i]
    scav_hunt_name_to_id[name] = start_id + i - 1
end

function APScavHuntShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:collectedScavHuntLocation(name)
        location_id = scav_hunt_name_to_id[name]
        if location_id then
            apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
        else
            GamePrint(name .. " is not a valid scavenger hunt location name")
        end
    end


    return Ob
end