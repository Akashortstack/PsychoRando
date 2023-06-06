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
            110, 61, 9, 2, 294, 180, 293, 160, 3, 221,
            34, 165, 156, 261, 251, 155, 324, 32, 92, 121,
            314, 237, 188, 85, 54, 53, 198, 186, 107, 172,
            142, 113, 56, 132, 57, 16, 309, 59, 175, 300,
            67, 62, 134, 241, 72, 182, 64, 153, 171, 184,
            66, 252, 227, 229, 201, 114, 211, 39, 99, 228,
            125, 41, 96, 254, 315, 71, 12, 214, 265, 256,
            282, 224, 14, 260, 243, 208, 203, 283, 235, 281,
            238, 193, 25, 40, 295, 118, 58, 95, 27, 196,
            327, 287, 159, 38, 15, 299, 223, 26, 205, 169,
            18, 100, 106, 70, 274, 29, 225, 140, 20, 1,
            328, 286, 298, 105, 168, 48, 206, 272, 126, 244,
            11, 269, 316, 306, 255, 164, 148, 195, 49, 273,
            24, 80, 179, 109, 226, 119, 101, 240, 289, 264,
            278, 8, 177, 149, 128, 4, 302, 311, 213, 84,
            231, 218, 151, 37, 199, 42, 94, 135, 194, 245,
            44, 88, 291, 55, 318, 173, 323, 69, 250, 220,
            124, 275, 73, 50, 285, 158, 36, 60, 187, 280,
            35, 78, 247, 81, 279, 90, 98, 5, 257, 162,
            230, 7, 150, 136, 321, 122, 65, 304, 63, 329,
            93, 270, 52, 326, 276, 319, 267, 133, 127, 296,
            68, 138, 131, 215, 200, 112, 271, 91, 161, 176,
            51, 305, 145, 170, 33, 17, 116, 307, 259, 317,
            130, 209, 202, 79, 102, 313, 253, 129, 86, 13,
            262, 236, 103, 217, 284, 166, 297, 115, 43, 189,
            30, 249, 207, 89, 75, 76, 23, 19, 303, 147,
            204, 143, 222, 190, 141, 154, 266, 82, 219, 83,
            152, 144, 104, 47, 97, 288, 248, 325, 117, 242,
            146, 120, 290, 77, 6, 174, 232, 322, 308, 258,
            185, 87, 210, 167, 239, 46, 28, 320, 263, 234,
            233, 31, 216, 212, 22, 123, 137, 292, 21, 268,
            45, 277, 312, 10, 139, 111, 246, 74, 192, 301,
            163, 157, 310, 108, 191, 183, 181, 197, 178
        }
        self.seed = SEED_GOES_HERE
    end

    --[[ function that randomizes all checks in the game, keeping class paired with name
    Ex. item 1 in oldclassTable always pairs with item 1 in oldnameTable
    ]]
    function Ob:randomizeChecks()
        --LIST MUST MATCH oldnameTable ONE FOR ONE, OR ELSE...
        local oldclassTable = {
            --Current Props from AS, 6 total
            'global.props.AS_SeaUrchinWhistle',
            'global.props.AS_hand', 
            'global.props.AS_StraightJacket',
            'global.props.AS_Painting',
            'global.props.Cake',
            'global.props.LilisBracelet', 

            --Current Props from MM, 6 total
            'global.props.PropSign',
            'global.props.PropFlowers',
            'global.props.PropPlunger', 
            'global.props.PropHedgeTrimmers',
            'global.props.PropRollingPin',
            'global.props.PropWaterCan',

            --Current Props from TH, 3 total
            'global.props.Candle',
            'global.props.Candle',
            'global.props.Megaphone',

            --Props from WW, 3 total
            'global.props.Peasant1Item',  --Fred's Note
            'global.props.Peasant2Item',  --Priceless Coin
            'global.props.Peasant3Item',  --Rifle

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

            --76 Psicards, filler item, increase if adding more positions
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


        }

        --LIST MUST MATCH oldclassTable ONE FOR ONE, OR ELSE...
        local oldnameTable = {

            --Current Props from AS, 6 total
            'SeaUrchinWhistle', 'LobatoHand', 'StraightJacket', 'LobatoPainting', 'Cake', 'LiliBracelet', 

            --Current Props from MM, 6 total
            'PropSign', 'PropFlowers', 'PropPlunger', 'PropHedgeTrimmers', 'PropRollingPin', 'PropWaterCan',

            --Current Props from TH, 3 total
            'Candle1', 'Candle2', 'Megaphone',

            --Props from WW, 3 total
            'Peasant1Item', --Fred's Note
            'Peasant2Item', --Priceless Coin
            'Peasant3Item', --Rifle

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
            'Suitcase1', 'Suitcase2', 'Suitcase3', 'Suitcase4', 'Suitcase5', 'Suitcase6', 'Suitcase7', 'Suitcase8', 'Suitcase9', 'Suitcase10',

            'Purse1', 'Purse2', 'Purse3', 'Purse4', 'Purse5', 'Purse6', 'Purse7', 'Purse8', 'Purse9', 'Purse10',

            'Hatbox1', 'Hatbox2', 'Hatbox3', 'Hatbox4', 'Hatbox5', 'Hatbox6', 'Hatbox7', 'Hatbox8','Hatbox9','Hatbox10',

            'Steam1', 'Steam2', 'Steam3', 'Steam4', 'Steam5', 'Steam6', 'Steam7', 'Steam8', 'Steam9', 'Steam10',

            'Duffle1', 'Duffle2', 'Duffle3', 'Duffle4', 'Duffle5', 'Duffle6', 'Duffle7', 'Duffle8', 'Duffle9', 'Duffle10',

            --19 Vaults
            'Vault1', 'Vault2', 'Vault3', 'Vault4', 'Vault5', 'Vault6', 'Vault7', 'Vault8', 'Vault9', 'Vault10',
            'Vault11', 'Vault12', 'Vault13', 'Vault14', 'Vault15', 'Vault16', 'Vault17','Vault18', 'Vault19',

            --30 Rando Arrowhead Bundles Small
            'AHSmall1', 'AHSmall2', 'AHSmall3', 'AHSmall4', 'AHSmall5', 'AHSmall6', 'AHSmall7', 'AHSmall8', 'AHSmall9', 'AHSmall10',
            'AHSmall11', 'AHSmall12', 'AHSmall13', 'AHSmall14', 'AHSmall15', 'AHSmall16', 'AHSmall17', 'AHSmall18', 'AHSmall19', 'AHSmall20',
            'AHSmall21', 'AHSmall22', 'AHSmall23', 'AHSmall24', 'AHSmall25', 'AHSmall26', 'AHSmall27', 'AHSmall28', 'AHSmall29', 'AHSmall30', 

            --10 Rando Arrowhead Bundles Medium
            'AHMedium1', 'AHMedium2', 'AHMedium3', 'AHMedium4', 'AHMedium5', 'AHMedium6', 'AHMedium7', 'AHMedium8', 'AHMedium9', 'AHMedium10',

            --76 Psicards, filler item, increase if adding more positions
            'Card1', 'Card2', 'Card3', 'Card4', 'Card5', 'Card6', 'Card7', 'Card8', 'Card9', 'Card10',
            'Card11', 'Card12', 'Card13', 'Card14', 'Card15', 'Card16', 'Card17', 'Card18', 'Card19', 'Card20',
            'Card21', 'Card22', 'Card23', 'Card24', 'Card25', 'Card26', 'Card27', 'Card28', 'Card29', 'Card30', 
            'Card31', 'Card32', 'Card33', 'Card34', 'Card35', 'Card36', 'Card37', 'Card38', 'Card39', 'Card40',
            'Card41', 'Card42', 'Card43', 'Card44', 'Card45', 'Card46', 'Card47', 'Card48', 'Card49', 'Card50',
            'Card51', 'Card52', 'Card53', 'Card54', 'Card55', 'Card56', 'Card57', 'Card58', 'Card59', 'Card60',
            'Card61', 'Card62', 'Card63', 'Card64', 'Card65', 'Card66', 'Card67', 'Card68', 'Card69', 'Card70',
            'Card71', 'Card72', 'Card73', 'Card74', 'Card75', 'Card76', 
        }

        local newclassTable = {}

        local newnameTable = {}

        --get total number of item in oldclassTable
        local n = tableLength(oldnameTable)
        GamePrint('Length = '..n)
        --pairing loop
        local index = 1
        local randolist = self.seed

        for i = 1, n do
            local j = randolist[index]
            newclassTable[i] = oldclassTable[j] 
            newnameTable[i] = oldnameTable[j]
            index = index+1
        end
        --write results to new tables
        self.randoclassList = newclassTable
        self.randonameList = newnameTable
       
    end
        
    return Ob
end