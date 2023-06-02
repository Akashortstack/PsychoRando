-- gets length of a table, used in Ob:randomizeChecks
function tableLength(tbl)
    local count = 0
    local i = 1
    while tbl[i] ~= nil do
        count = count + 1
        i = i + 1
    end
    return count
end

function Seed(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        Ob.seed = {}
        Ob.randoclassList = {}
        Ob.randonameList = {}

    end

    function Ob:fillTable()
        --PASTE SEED STRING HERE
        local SEED_GOES_HERE = {
            141, 75, 238, 1, 54, 248, 271, 56, 232, 259,
            57, 138, 32, 245, 2, 93, 187, 186, 59, 140,
            287, 108, 252, 211, 48, 302, 169, 269, 113, 243,
            274, 173, 23, 55, 52, 162, 18, 283, 15, 33,
            14, 215, 5, 171, 325, 110, 145, 253, 216, 3,
            99, 10, 289, 43, 230, 240, 235, 16, 304, 101,
            257, 184, 147, 123, 159, 9, 218, 249, 278, 26,
            265, 22, 64, 143, 279, 315, 30, 79, 170, 313,
            192, 251, 83, 13, 150, 194, 85, 292, 258, 206,
            98, 328, 130, 179, 228, 236, 95, 100, 73, 6,
            293, 62, 151, 295, 96, 91, 281, 154, 322, 166,
            229, 97, 102, 231, 188, 288, 149, 189, 157, 273,
            87, 106, 41, 128, 104, 120, 299, 323, 197, 37,
            20, 181, 133, 71, 167, 34, 66, 39, 227, 70,
            158, 307, 298, 222, 225, 60, 199, 301, 185, 134,
            223, 50, 193, 117, 142, 201, 118, 129, 256, 217,
            320, 200, 4, 180, 300, 305, 28, 213, 53, 255,
            35, 267, 68, 318, 61, 209, 86, 112, 114, 275,
            175, 67, 8, 38, 163, 160, 285, 195, 148, 11,
            131, 89, 204, 24, 310, 237, 196, 121, 172, 19,
            119, 25, 212, 165, 153, 312, 168, 46, 191, 250,
            219, 233, 69, 266, 125, 29, 31, 226, 220, 51,
            321, 42, 7, 182, 326, 286, 105, 268, 177, 291,
            146, 161, 82, 284, 88, 72, 314, 207, 202, 239,
            221, 277, 311, 234, 63, 65, 316, 246, 308, 290,
            208, 139, 276, 45, 183, 241, 262, 317, 176, 27,
            324, 205, 247, 84, 144, 94, 21, 78, 210, 152,
            40, 329, 272, 36, 137, 214, 244, 280, 81, 74,
            327, 80, 107, 224, 103, 296, 47, 58, 136, 242,
            270, 319, 49, 90, 282, 263, 198, 77, 155, 306,
            260, 178, 122, 116, 254, 115, 44, 135, 92, 127,
            303, 309, 203, 76, 294, 111, 132, 17, 164, 190,
            174, 261, 297, 12, 156, 124, 126, 264, 109
        }
        self.seed = SEED_GOES_HERE
    end

    --[[ function that randomizes all checks in the game, keeping class paired with name
    Ex. item 1 in classTable always pairs with item 1 in nameTable
    ]]
    function Ob:randomizeChecks()
        --TEST LIST, NEEDS UPDATED TO FULL LIST
        local classTable = {
            --6 Max Ammo Up
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoAmmoUp',

            --6 Max Lives Up
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoLivesUp',

            --10 Challenge Markers
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoPsiChallengeMarker',

            --19 Brain Jars
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',
            'global.collectibles.BrainJar',

            --16 Scavenger Hunt Items, Unique Class
            'Global.Collectibles.scavDoubloon', 
            'Global.Collectibles.scavEagleClaw', 
            'Global.Collectibles.ScavDiversHelmet', 
            'Global.Collectibles.ScavComic', 
            'Global.Collectibles.ScavHuntPipe', 
            'Global.Collectibles.ScavSandwich', 
            'Global.Collectibles.scavVoodooDollie', 
            'Global.Collectibles.ScavSkull', 
            'Global.Collectibles.ScavPirateScope', 
            'Global.Collectibles.ScavGoldenAcorn', 
            'Global.Collectibles.ScavEye', 
            'Global.Collectibles.ScavEgg', 
            'Global.Collectibles.ScavIdol', 
            'Global.Collectibles.ScavBone', 
            'Global.Collectibles.scavFossil', 
            'Global.Collectibles.ScavHuntGoldWatch', 

            --19 Psi Powers, Some Different Classes
            'global.collectibles.Marksmanship', 
            'global.collectibles.Marksmanship', 
            'global.collectibles.Marksmanship', 
            'global.collectibles.Firestarting', 
            'global.collectibles.Firestarting', 
            'global.collectibles.Confusion', 
            'global.collectibles.Confusion', 
            'global.collectibles.Levitation', 
            'global.collectibles.Levitation', 
            'global.collectibles.Levitation', 
            'global.collectibles.Telekinesis', 
            'global.collectibles.Telekinesis', 
            'global.collectibles.Invisibility', 
            'global.collectibles.Invisibility', 
            'global.collectibles.Clairvoyance', 
            'global.collectibles.Clairvoyance', 
            'global.collectibles.Shield', 
            'global.collectibles.Shield', 
            'global.collectibles.Shield', 

            --50 Emotional Baggage Tags, 10 of each Type
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
            'global.collectibles.RandoSuitcaseTag', 
        
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
            'global.collectibles.RandoPurseTag', 
        
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
            'global.collectibles.RandoHatboxTag', 
        
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
            'global.collectibles.RandoSteamertrunkTag', 
        
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 
            'global.collectibles.RandoDufflebagTag', 

            --50 Emotional Baggage, 10 of each Type
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
            'global.collectibles.RandoSuitcase', 
        
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 
            'global.collectibles.RandoPurse', 

            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
            'global.collectibles.RandoHatbox', 
        
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk',
            'global.collectibles.RandoSteamertrunk', 
            'global.collectibles.RandoSteamertrunk', 
        
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
            'global.collectibles.RandoDufflebag', 
        
            --19 Vaults
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',
            'Global.Characters.Vault',

            --Current Props from MM, 6 total
            'global.props.PropFlowers',
            'global.props.PropHedgeTrimmers',
            'global.props.PropPlunger', 
            'global.props.PropRollingPin',
            'global.props.PropSign',
            'global.props.PropWaterCan',

            --Current Props from TH, 3 total
            'global.props.Candle',
            'global.props.Candle',
            'global.props.Megaphone',

            --Props from WW, 3 total
            'global.props.Peasant1Item',  --Fred's Note
            'global.props.Peasant2Item',  --Priceless Coin
            'global.props.Peasant3Item',  --Rifle

            --Current Props from AS, 6 total
            'global.props.Cake', 
            'global.props.LilisBracelet', 
            'global.props.AS_hand', 
            'global.props.AS_StraightJacket',
            'global.props.AS_Painting',
            'global.props.AS_SeaUrchinWhistle',

            --30 Rando Arrowhead Bundles Small
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleSmall',

            --10 Rando Arrowhead Bundles Medium
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',

            --77 Psicards, filler item, increase if adding more positions
            --Increase name too!
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',
            'global.collectibles.RandoPsiCard',


        }

        --TEST LIST, NEEDS UPDATED TO FULL LIST
        local nameTable = {

            --6 Max Ammo Up
            'AmmoUp1',
            'AmmoUp2',
            'AmmoUp3',
            'AmmoUp4',
            'AmmoUp5',
            'AmmoUp6',

            --6 Max Lives Up
            'LivesUp1',
            'LivesUp2',
            'LivesUp3',
            'LivesUp4',
            'LivesUp5',
            'LivesUp6',

            --10 Challenge Markers
            'Marker1',
            'Marker2',
            'Marker3',
            'Marker4',
            'Marker5',
            'Marker6',
            'Marker7',
            'Marker8',
            'Marker9',
            'Marker10',
           
            --19 Brain Jars, Unique Names
            'BrainJarElton',
            'BrainJarBobby',
            'BrainJarDogen',
            'BrainJarBenny',
            'BrainJarElka',
            'BrainJarKitty',
            'BrainJarChloe',
            'BrainJarFranke',
            'BrainJarJT',
            'BrainJarQuentin',
            'BrainJarVernon',
            'BrainJarMilka',
            'BrainJarCrystal',
            'BrainJarClem',
            'BrainJarNils',
            'BrainJarMaloof',
            'BrainJarMikhail',
            'BrainJarPhoebe',
            'BrainJarChops',

            --16 Scavenger Hunt Items, Unique Names, in Order
            'scavDoubloon',
            'scavEagleClaw',
            'ScavDiversHelmet',
            'ScavComic',
            'ScavHuntPipe',
            'ScavSandwich',
            'scavVoodooDollie',
            'ScavSkull',
            'ScavPirateScope',
            'ScavGoldenAcorn',
            'ScavEye',
            'ScavEgg',
            'ScavIdol',
            'ScavBone',
            'scavFossil',
            'ScavHuntGoldWatch',

            --19 Psi Powers, Some Different Names to match Class
            'Marksmanship1',
            'Marksmanship2',
            'Marksmanship3',
            'Firestarting1',
            'Firestarting2',
            'Confusion1',
            'Confusion2',
            'Levitation1',
            'Levitation2',
            'Levitation3',
            'Telekinesis1',
            'Telekinesis2',
            'Invisibility1',
            'Invisibility2',
            'Clairvoyance1',
            'Clairvoyance2',
            'Shield1',
            'Shield2',
            'Shield3',

            --50 Emotional Baggage Tags, 10 of each Type
            'SuitcaseTag1',
            'SuitcaseTag2',
            'SuitcaseTag3',
            'SuitcaseTag4',
            'SuitcaseTag5',
            'SuitcaseTag6',
            'SuitcaseTag7',
            'SuitcaseTag8',
            'SuitcaseTag9',
            'SuitcaseTag10',

            'PurseTag1',
            'PurseTag2',
            'PurseTag3',
            'PurseTag4',
            'PurseTag5',
            'PurseTag6',
            'PurseTag7',
            'PurseTag8',
            'PurseTag9',
            'PurseTag10',

            'HatboxTag1',
            'HatboxTag2',
            'HatboxTag3',
            'HatboxTag4',
            'HatboxTag5',
            'HatboxTag6',
            'HatboxTag7',
            'HatboxTag8',
            'HatboxTag9',
            'HatboxTag10',

            'SteamT1',
            'SteamT2',
            'SteamT3',
            'SteamT4',
            'SteamT5',
            'SteamT6',
            'SteamT7',
            'SteamT8',
            'SteamT9',
            'SteamT10',

            'DuffleT1',
            'DuffleT2',
            'DuffleT3',
            'DuffleT4',
            'DuffleT5',
            'DuffleT6',
            'DuffleT7',
            'DuffleT8',
            'DuffleT9',
            'DuffleT10',

            --50 Emotional Baggage, 10 of each Type
            'Suitcase1',
            'Suitcase2',
            'Suitcase3',
            'Suitcase4',
            'Suitcase5',
            'Suitcase6',
            'Suitcase7',
            'Suitcase8',
            'Suitcase9',
            'Suitcase10',

            'Purse1', 'Purse2', 'Purse3', 'Purse4', 'Purse5', 'Purse6', 'Purse7', 'Purse8', 'Purse9', 'Purse10',

            'Hatbox1', 'Hatbox2', 'Hatbox3', 'Hatbox4', 'Hatbox5', 'Hatbox6', 'Hatbox7', 'Hatbox8','Hatbox9','Hatbox10',

            'Steam1', 'Steam2', 'Steam3', 'Steam4', 'Steam5', 'Steam6', 'Steam7', 'Steam8', 'Steam9', 'Steam10',

            'Duffle1', 'Duffle2', 'Duffle3', 'Duffle4', 'Duffle5', 'Duffle6', 'Duffle7', 'Duffle8', 'Duffle9', 'Duffle10',

            --19 Vaults
            'Vault1', 'Vault2', 'Vault3', 'Vault4', 'Vault5', 'Vault6', 'Vault7', 'Vault8', 'Vault9', 'Vault10',
            'Vault11', 'Vault12', 'Vault13', 'Vault14', 'Vault15', 'Vault16', 'Vault17','Vault18', 'Vault19',

            --Current Props from MM, 6 total
            'PropFlowers', 'PropHedgeTrimmers', 'PropPlunger', 'PropRollingPin', 'PropSign', 'PropWaterCan',

            --Current Props from TH, 3 total
            'Candle1', 'Candle2', 'Megaphone',

            --Props from WW, 3 total
            'Peasant1Item', --Fred's Note
            'Peasant2Item', --Priceless Coin
            'Peasant3Item', --Rifle

            --Current Props from AS, 6 total
            'Cake', 'LiliBracelet', 'LobatoHand', 'StraightJacket', 'LobatoPainting',  'SeaUrchinWhistle',

            --30 Rando Arrowhead Bundles Small
            'AHSmall1', 'AHSmall2', 'AHSmall3', 'AHSmall4', 'AHSmall5', 'AHSmall6', 'AHSmall7', 'AHSmall8', 'AHSmall9', 'AHSmall10',
            'AHSmall11', 'AHSmall12', 'AHSmall13', 'AHSmall14', 'AHSmall15', 'AHSmall16', 'AHSmall17', 'AHSmall18', 'AHSmall19', 'AHSmall20',
            'AHSmall21', 'AHSmall22', 'AHSmall23', 'AHSmall24', 'AHSmall25', 'AHSmall26', 'AHSmall27', 'AHSmall28', 'AHSmall29', 'AHSmall30', 

            --10 Rando Arrowhead Bundles Medium
            'AHMedium1', 'AHMedium2', 'AHMedium3', 'AHMedium4', 'AHMedium5', 'AHMedium6', 'AHMedium7', 'AHMedium8', 'AHMedium9', 'AHMedium10',

            --77 Psicards, filler item, increase if adding more positions
            'Card1', 'Card2', 'Card3', 'Card4', 'Card5', 'Card6', 'Card7', 'Card8', 'Card9', 'Card10',
            'Card11', 'Card12', 'Card13', 'Card14', 'Card15', 'Card16', 'Card17', 'Card18', 'Card19', 'Card20',
            'Card21', 'Card22', 'Card23', 'Card24', 'Card25', 'Card26', 'Card27', 'Card28', 'Card29', 'Card30', 
            'Card31', 'Card32', 'Card33', 'Card34', 'Card35', 'Card36', 'Card37', 'Card38', 'Card39', 'Card40',
            'Card41', 'Card42', 'Card43', 'Card44', 'Card45', 'Card46', 'Card47', 'Card48', 'Card49', 'Card50',
            'Card51', 'Card52', 'Card53', 'Card54', 'Card55', 'Card56', 'Card57', 'Card58', 'Card59', 'Card60',
            'Card61', 'Card62', 'Card63', 'Card64', 'Card65', 'Card66', 'Card67', 'Card68', 'Card69', 'Card70',
            'Card71', 'Card72', 'Card73', 'Card74', 'Card75', 'Card76', 'Card77', 
        }
        --get total number of item in classTable
        local n = tableLength(classTable)
        --shuffle loop
        local index = 1
        local randolist = self.seed

        for i = n, 2, -1 do
            local j = randolist[index]
            classTable[i], classTable[j] = classTable[j], classTable[i]
            nameTable[i], nameTable[j] = nameTable[j], nameTable[i]
            index = index+1
        end
        --write results to new tables
        self.randoclassList = classTable
        self.randonameList = nameTable
       
    end
        
    return Ob
end