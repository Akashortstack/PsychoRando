-- There are currently 49 total. Only 48 are accessible in vanilla; MegaArrowhead3CABH is out-of-bounds.
local mega_arrowhead_names = {
    "MegaArrowhead1CAMA", -- Cabins side of lodge by trash can
    "MegaArrowhead2CAMA", -- Outside front lodge by turn of walkway
    "MegaArrowhead3CAMA", -- Under start of walkway to Lake
    "MegaArrowhead4CAMA", -- East of Main Lodge Stump
    "MegaArrowhead5CAMA", -- On the path to the GPC, before the cougar
    "MegaArrowhead6CAMA", -- Near Reception entrance
    "MegaArrowhead7CAMA", -- Far south corner of Parking Lot
    "MegaArrowhead8CAMA", -- Under Lodge (under the item placed there)
    "MegaArrowhead9CAMA", -- On rock wall before trapeze
    "MegaArrowhead1CAGP", -- In river just before grate
    "MegaArrowhead2CAGP", -- Back left inside GPC fence
    "MegaArrowhead3CAGP", -- Near stump, below big rock near Ford
    "MegaArrowhead4CAGP", -- Tree near Golden Acorn Squirrel
    "MegaArrowhead5CAGP", -- In river near ruined cabin
    "MegaArrowhead6CAGP", -- Front right inside GPC fence
    "MegaArrowhead7CAGP", -- Top of large boulder near lake entrance
    "MegaArrowhead8CAGP", -- Tree near geyser
    "MegaArrowhead9CAGP", -- Near bear, outside GPC fence
    "MegaArrowhead10CAGP", -- Top of big rock near Ford
    "MegaArrowhead11CAGP", -- Opposite river from Stump
    "MegaArrowhead12CAGP", -- On grass just before Main Campsite entrance
    "MegaArrowhead13CAGP", -- On path just before Lake Entrance
    "MegaArrowhead14CAGP", -- Top of smaller boulder near lake entrance
    "MegaArrowhead15CAGP", -- Right side inside GPC fence
    "MegaArrowhead1CARE", -- Inside bear cave
    "MegaArrowhead2CARE", -- In shallow water east
    "MegaArrowhead3CARE", -- In shallow water west
    "MegaArrowhead4CARE", -- Collapsed cave entrance (under the item placed ther)
    "MegaArrowhead5CARE", -- In front of giant tree (AKA fireplace tree)
    "MegaArrowhead6CARE", -- South of Ford's camper
    "MegaArrowhead7CARE", -- East of Ford's camper
    "MegaArrowhead8CARE", -- By tree at graveyard
    "MegaArrowhead9CARE", -- In front of the graveyard
    "MegaArrowhead10CARE", -- Furthest corner of graveyard
    "MegaArrowhead11CARE", -- West of campfire
    "MegaArrowhead12CARE", -- North east of campfire
    "MegaArrowhead13CARE", -- Bear cave lower entrance
    "MegaArrowhead14CARE", -- By stump
    "MegaArrowhead15CARE", -- Below waterfall at river split
    "MegaArrowhead16CARE", -- Big rock lower
    "MegaArrowhead17CARE", -- Top of big rock
    "MegaArrowhead18CARE", -- Below tightrope platform
    "MegaArrowhead1CABH", -- By stump
    "MegaArrowhead2CABH", -- Behind big rock, close to lake shore
    "MegaArrowhead3CABH", -- On rock by bathysphere dock -- This has been move from its original out-of-bounds placement
    "MegaArrowhead4CABH", -- By GPC tunnel entrance
    "MegaArrowhead5CABH", -- End of cliff above GPC tunnel entrance
    "MegaArrowhead6CABH", -- By boathouse
    "MegaArrowhead7CABH", -- South of main campsite entrance
}

local start_id = 503
mega_arrowhead_name_to_id = {}
for i = 1, getn(mega_arrowhead_names) do
    local name = mega_arrowhead_names[i]
    mega_arrowhead_name_to_id[name] = start_id + i - 1
end


function APDeepArrowheadShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:collectedDeepArrowhead(name)
        location_id = mega_arrowhead_name_to_id[name]
        if location_id then
            apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
        else
            GamePrint(name .. " is not a valid deep arrowhead name")
        end
    end

    return Ob
end