-- The order and item counts must match the standalone seed generator's item_names.py.
-- The order must match the Archipelago World's PsychoRandoItems.py. The item counts will be adjusted using a separate
-- table when Archipelago is used.
MAIN_ITEM_DATA_TABLE = {
    -- Class | Base Name | Count (defaults to 1. when more than 1, the items are suffixed with a number)
    --Current Props from AS, 6 total
    {'global.props.AS_SeaUrchinWhistle', 'SeaUrchinWhistle'},
    {'global.props.AS_hand', 'LobatoHand'},
    {'global.props.AS_StraightJacket', 'StraightJacket'},
    {'global.props.AS_Painting', 'LobatoPainting'},
    {'global.props.Cake', 'Cake'},
    {'global.props.LilisBracelet', 'LiliBracelet'},

    --Current Props from MM, 6 total
    {'global.props.PropSign', 'PropSign'},
    {'global.props.PropFlowers', 'PropFlowers'},
    {'global.props.PropPlunger', 'PropPlunger'},
    {'global.props.PropHedgeTrimmers', 'PropHedgeTrimmers'},
    {'global.props.PropRollingPin', 'PropRollingPin'},
    {'global.props.PropWaterCan', 'PropWaterCan'},

    --Current Props from TH, 3 total
    {'global.props.Candle', 'Candle', 2},
    {'global.props.Megaphone', 'Megaphone'},

    --Props from WW, 3 total
    {'global.props.Peasant1Item', 'Peasant1Item'},  --Fred's Note
    {'global.props.Peasant2Item', 'Peasant2Item'},  --Priceless Coin
    {'global.props.Peasant3Item', 'Peasant3Item'},  --Rifle

    --19 Psi Powers, Some Different Classes
    {'global.collectibles.Marksmanship', 'Marksmanship', 3},
    {'global.collectibles.Firestarting', 'Firestarting', 2},
    {'global.collectibles.Confusion', 'Confusion', 2},
    {'global.collectibles.Levitation', 'Levitation', 3},
    {'global.collectibles.Telekinesis', 'Telekinesis', 2},
    {'global.collectibles.Invisibility', 'Invisibility', 2},
    {'global.collectibles.Clairvoyance', 'Clairvoyance', 2},
    {'global.collectibles.Shield', 'Shield', 3},

    --Super Palm Bomb
    {'global.collectibles.SuperPalmBomb', 'SuperPalmBomb'},

    --6 Max Ammo Up
    {'Global.Collectibles.RandoAmmoUp', 'AmmoUp', 6},

    --6 Max Lives Up
    {'Global.Collectibles.RandoLivesUp', 'LivesUp', 6},

    --4 Confusion Ammo Up
    {'Global.Collectibles.RandoConfusionUp', 'ConfusionUp', 4},

    --10 Challenge Markers
    {'global.collectibles.RandoPsiChallengeMarker', 'Marker', 10},

    -- 19 Brain Jars
    {'global.collectibles.BrainJar', 'BrainJarElton'},
    {'global.collectibles.BrainJar', 'BrainJarBobby'},
    {'global.collectibles.BrainJar', 'BrainJarDogen'},
    {'global.collectibles.BrainJar', 'BrainJarBenny'},
    {'global.collectibles.BrainJar', 'BrainJarElka'},
    {'global.collectibles.BrainJar', 'BrainJarKitty'},
    {'global.collectibles.BrainJar', 'BrainJarChloe'},
    {'global.collectibles.BrainJar', 'BrainJarFranke'},
    {'global.collectibles.BrainJar', 'BrainJarJT'},
    {'global.collectibles.BrainJar', 'BrainJarQuentin'},
    {'global.collectibles.BrainJar', 'BrainJarVernon'},
    {'global.collectibles.BrainJar', 'BrainJarMilka'},
    {'global.collectibles.BrainJar', 'BrainJarCrystal'},
    {'global.collectibles.BrainJar', 'BrainJarClem'},
    {'global.collectibles.BrainJar', 'BrainJarNils'},
    {'global.collectibles.BrainJar', 'BrainJarMaloof'},
    {'global.collectibles.BrainJar', 'BrainJarMikhail'},
    {'global.collectibles.BrainJar', 'BrainJarPhoebe'},
    {'global.collectibles.BrainJar', 'BrainJarChops'},

    --16 Scavenger Hunt Items, Unique Class
    {'Global.Collectibles.scavDoubloon', 'scavDoubloon'},
    {'Global.Collectibles.scavEagleClaw', 'scavEagleClaw'},
    {'Global.Collectibles.ScavDiversHelmet', 'ScavDiversHelmet'},
    {'Global.Collectibles.ScavComic', 'ScavComic'},
    {'Global.Collectibles.ScavHuntPipe', 'ScavHuntPipe'},
    {'Global.Collectibles.ScavSandwich', 'ScavSandwich'},
    {'Global.Collectibles.scavVoodooDollie', 'scavVoodooDollie'},
    {'Global.Collectibles.ScavSkull', 'ScavSkull'},
    {'Global.Collectibles.ScavPirateScope', 'ScavPirateScope'},
    {'Global.Collectibles.ScavGoldenAcorn', 'ScavGoldenAcorn'},
    {'Global.Collectibles.ScavEye', 'ScavEye'},
    {'Global.Collectibles.ScavEgg', 'ScavEgg'},
    {'Global.Collectibles.ScavIdol', 'ScavIdol'},
    {'Global.Collectibles.ScavBone', 'ScavBone'},
    {'Global.Collectibles.scavFossil', 'scavFossil'},
    {'Global.Collectibles.ScavHuntGoldWatch', 'ScavHuntGoldWatch'},

    --50 Emotional Baggage Tags, 10 of each Type
    {'global.collectibles.RandoSuitcaseTag', 'SuitcaseTag', 10},
    {'global.collectibles.RandoPurseTag', 'PurseTag', 10},
    {'global.collectibles.RandoHatboxTag', 'HatboxTag', 10},
    {'global.collectibles.RandoSteamertrunkTag', 'SteamT', 10},
    {'global.collectibles.RandoDufflebagTag', 'DuffleT', 10},

    --50 Emotional Baggage, 10 of each Type
    {'global.collectibles.RandoSuitcase', 'Suitcase', 10},
    {'global.collectibles.RandoPurse', 'Purse', 10},
    {'global.collectibles.RandoHatbox', 'Hatbox', 10},
    {'global.collectibles.RandoSteamertrunk', 'Steam', 10},
    {'global.collectibles.RandoDufflebag', 'Duffle', 10},

    --19 Vaults
    {'Global.Characters.Vault', 'Vault', 19},

    --30 Rando Arrowhead Bundles Small
    {'global.collectibles.ArrowheadBundleSmall', 'AHSmall', 30},

    --5 Rando Arrowhead Bundles Medium
    {'global.collectibles.ArrowheadBundleMedium', 'AHMedium', 5},

    --Oarsman's Badge
    {'global.collectibles.RandoOarsmansBadge', 'Oarsmans Badge'},

    --Sasha's Button
    {'global.props.Button', 'Button'},

    --Crow Feather
    {'global.props.AS_CrowFeather', 'Feather'},

    --Cobweb Duster
    {'global.collectibles.CobwebDuster', 'CobwebDuster'},

    --Squirrel Dinner, currently AP only
    {'global.props.RandoSquirrelDinner', 'SquirrelDinner', 0},

    --9 Mind Unlocks, currently AP only
    {'global.collectibles.RandoMindUnlock', 'CoachMind', 0},
    {'global.collectibles.RandoMindUnlock', 'SashaMind', 0},
    {'global.collectibles.RandoMindUnlock', 'MillaMind', 0},
    {'global.collectibles.RandoMindUnlock', 'LindaMind', 0},
    {'global.collectibles.RandoMindUnlock', 'BoydMind', 0},
    {'global.collectibles.RandoMindUnlock', 'GloriaMind', 0},
    {'global.collectibles.RandoMindUnlock', 'FredMind', 0},
    {'global.collectibles.RandoMindUnlock', 'EdgarMind', 0},
    {'global.collectibles.RandoMindUnlock', 'OlyMind', 0},

    --Dowsing Rod - AP Only
    {'global.collectibles.DowsingRod', 'DowsingRod', 0},

    --111 Psicards, filler item, increase if adding more positions
    {'global.collectibles.RandoPsiCard', 'Card', 111},

    --AP Placeholders, 318 Total
    {'global.collectibles.APPlaceholder', 'AP Item ', 0},
}

-- Differing item counts for AP.
AP_ITEM_COUNTS = {
    --Required to access the Reception Area in AP
    ['SquirrelDinner'] = 1,

    --Mind unlocks
    ['CoachMind'] = 1,
    ['SashaMind'] = 1,
    ['MillaMind'] = 1,
    ['LindaMind'] = 1,
    ['BoydMind'] = 1,
    ['GloriaMind'] = 1,
    ['FredMind'] = 1,
    ['EdgarMind'] = 1,
    ['OlyMind'] = 1,

    --AP has 1 less PSI Card by default since it has the Squirrel Roast Dinner taking up a location
    ['Card'] = 110,
    --AP Placeholders, one for each location that can place an item into the game world
    ['AP Item '] = 318,
    --Added for the Deep Arrowhead Shuffle option
    ['DowsingRod'] = 1,
    --29 are added for the Deep Arrowhead Shuffle option
    ['AHSmall'] = 59,
    --20 are added for the Deep Arrowhead Shuffle option
    ['AHMedium'] = 25,
}

function RandoItemTables(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        Ob.classTable = {}
        Ob.nameTable = {}
    end

    function Ob:initTables(randoSeed)
        local adjustedItemCounts = {}
        -- Make a table of the default item counts.
        for _, itemData in MAIN_ITEM_DATA_TABLE do
            local name = itemData[2]
            local defaultCount = itemData[3] or 1
            adjustedItemCounts[name] = defaultCount
        end

        -- Adjust the item counts for Archipelago usage.
        if randoSeed.isAP then
            for name, adjustedCount in AP_ITEM_COUNTS do
                adjustedItemCounts[name] = adjustedCount
            end
        end

        local classTable = {}
        local nameTable = {}
        
        for i = 1, getn(MAIN_ITEM_DATA_TABLE) do
            local itemData = MAIN_ITEM_DATA_TABLE[i]
            local itemClass = itemData[1]
            local itemName = itemData[2]
            local itemCount = adjustedItemCounts[itemName]

            if itemCount == 1 then
                -- Add the item without a number suffix
                tinsert(classTable, itemClass)
                tinsert(nameTable, itemName)
            elseif itemCount > 1 then
                --Add each item with a number suffix
                for i = 1, itemCount do
                    tinsert(classTable, itemClass)
                    tinsert(nameTable, itemName .. i)
                end
            end
        end

        self.classTable = classTable
        self.nameTable = nameTable
    end

    return Ob
end