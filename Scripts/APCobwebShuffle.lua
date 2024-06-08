-- There are currently 54 total.
-- The names are created by concatenating the cobweb name with the level name
local cobweb_names = {
"Cobweb1BBA2", -- (BB Area 2 Cobweb) Trapeze Cobweb
"Cobweb2BBA2", -- (BB Area 2 Cobweb) Tightrope Tutorial
"Cobweb3BBA2", -- (BB Area 2 Cobweb) Grindrail Wall
"Cobweb3BBLT", -- (BB Finale Cobweb) Bunny Room Door
"Cobweb4BBLT", -- (BB Finale Cobweb) Tunnel of Logs End
"Cobweb1SACU", -- (SA Main Cobweb) Arch Block Left
"Cobweb2SACU", -- (SA Main Cobweb) Arch Block Right
"Cobweb3SACU", -- (SA Main Cobweb) Back of Shoebox Tower
"Cobweb4SACU", -- (SA Main Cobweb) Shoebox Tower
"Cobweb5SACU", -- (SA Main Cobweb) Flame Tower Arch
"Cobweb1MIFL", -- (MI Area 1 Cobweb) Intro Statue Corner
"Cobweb2MIFL", -- (MI Area 1 Cobweb) Behind Pinball Ladder
"Cobweb3MIFL", -- (MI Area 1 Cobweb) Grindrail Rings
"Cobweb1MILL", -- (MI Finale Cobweb) Fan Room Entrance
"Cobweb2MILL", -- (MI Finale Cobweb) Party Room Floor
"Cobweb1NIMP", -- (BT Main Cobweb) Bathtub
"Cobweb2NIMP", -- (BT Main Cobweb) Forest Path Thorns
"Cobweb3NIMP", -- (BT Main Cobweb) Forest High Platform
"Cobweb4NIMP", -- (BT Main Cobweb) Shadow Monster Meat
"Cobweb5NIMP", -- (BT Main Cobweb) Thorn Tower Right
"Cobweb1LOMA", -- (LO Main Cobweb) Skyscraper Before Dam
"Cobweb2LOMA", -- (LO Main Cobweb) Skyscrapers Before Tunnel
"Cobweb3LOMA", -- (LO Main Cobweb) Behind Lasers
"Cobweb4LOMA", -- (LO Main Cobweb) End of Dam
"Cobweb5LOMA", -- (LO Main Cobweb) Ground after Bridge
"Cobweb2MMI1", -- (MM Neighborhood Cobweb) Third House
"Cobweb3MMI1", -- (MM Neighborhood Cobweb) Post Office Lobby
"Cobweb4MMI1", -- (MM Neighborhood Cobweb) Right House before Post Office
"webbieMMI1", -- (MM Neighborhood Cobweb) Webbed Garage
"Cobweb1MMI2", -- (MM Depository Cobweb) Book Depository
"Cobweb1THMS", -- (TH Stage Cobweb) Backstage Corridor
"Cobweb2THMS", -- (TH Stage Cobweb) Below Teleporter
"Cobweb3THMS", -- (TH Stage Cobweb) Storage Room Left
"Cobweb4THMS", -- (TH Stage Cobweb) In the Audience
"Cobweb5THMS", -- (TH Stage Cobweb) Below the Critic
"Cobweb6THMS", -- (TH Stage Cobweb) Behind Stage
"Cobweb7THMS", -- (TH Stage Cobweb) Storage Room Right
"Cobweb1WWMA", -- (WW Main Cobweb) Beneath Small Arch
"Cobweb3WWMA", -- (WW Main Cobweb) Blacksmith's Right Building Window
"Cobweb4WWMA", -- (WW Main Cobweb) Blacksmith's Left Building
"Cobweb5WWMA", -- (WW Main Cobweb) Blacksmith's Right Building Roof
"Cobweb6WWMA", -- (WW Main Cobweb) Carpenter's House
"Cobweb7WWMA", -- (WW Main Cobweb) Fred's House Basement
"Cobweb8WWMA", -- (WW Main Cobweb) Under the Guillotine
"Cobweb1BVRB", -- (BV Streets Cobweb) Diego's House Grindrail
"Cobweb2BVRB", -- (BV Streets Cobweb) Diego's House
"Cobweb3BVRB", -- (BV Streets Cobweb) Sewer Shower Tunnel
"Cobweb4BVRB", -- (BV Streets Cobweb) Above Queen of Hearts
"Cobweb5BVRB", -- (BV Streets Cobweb) Sewer Before Gate
"Cobweb6BVRB", -- (BV Streets Cobweb) Diego's House Fireplace
"Cobweb7BVRB", -- (BV Streets Cobweb) Near Diego's House
"Cobweb1MCTC", -- (MC Main Cobweb) Tunnel of Love Ollie Escort Exit
"Cobweb2MCTC", -- (MC Main Cobweb) Entrance Hall 1
"Cobweb3MCTC", -- (MC Main Cobweb) Entrance Hall 2
}

local start_id = 552
cobweb_name_to_id = {}
for i = 1, getn(cobweb_names) do
    local name = cobweb_names[i]
    cobweb_name_to_id[name] = start_id + i - 1
end

function APCobwebShuffle(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    function Ob:collectedCobweb(name)
        local fullName = name .. Global.levelScript:getLevelName()
        location_id = cobweb_name_to_id[fullName]
        if location_id then
            apcollected = fso('APCollected', 'APCollected')
            apcollected:writeCollectedLocation(location_id)
        else
            GamePrint(fullName .. " is not a valid mental cobweb name")
        end
    end

    return Ob
end