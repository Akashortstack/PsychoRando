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
            78, 131, 162, 6, 222, 242, 3, 240, 250, 257,
            103, 287, 228, 98, 303, 101, 69, 4, 283, 104,
            215, 29, 168, 199, 16, 164, 237, 17, 238, 110,
            223, 265, 133, 2, 236, 79, 175, 53, 59, 109,
            182, 119, 267, 159, 106, 220, 232, 92, 243, 40,
            268, 261, 214, 165, 256, 212, 33, 36, 145, 231,
            84, 198, 246, 183, 52, 302, 48, 226, 87, 124,
            75, 93, 25, 74, 209, 50, 176, 144, 180, 258,
            70, 274, 82, 169, 147, 221, 166, 1, 149, 102,
            249, 67, 202, 137, 289, 41, 178, 197, 100, 179,
            155, 201, 111, 83, 5, 27, 88, 134, 57, 91,
            225, 247, 234, 123, 150, 293, 171, 146, 65, 260,
            195, 264, 108, 286, 8, 35, 63, 170, 125, 304,
            96, 298, 206, 271, 99, 10, 7, 217, 280, 158,
            278, 270, 118, 273, 213, 205, 252, 301, 152, 22,
            300, 128, 140, 248, 282, 219, 126, 120, 139, 46,
            157, 191, 121, 77, 297, 269, 34, 172, 151, 60,
            141, 38, 299, 66, 68, 208, 233, 253, 143, 44,
            80, 259, 55, 181, 276, 211, 291, 148, 161, 138,
            76, 32, 239, 305, 117, 288, 81, 189, 54, 210,
            24, 107, 154, 218, 203, 21, 272, 207, 187, 43,
            185, 224, 49, 113, 294, 193, 244, 23, 263, 200,
            95, 227, 255, 306, 47, 295, 72, 136, 245, 127,
            194, 130, 14, 160, 192, 45, 42, 90, 167, 97,
            112, 61, 266, 64, 284, 13, 39, 241, 129, 277,
            296, 11, 281, 28, 31, 85, 71, 9, 94, 142,
            292, 177, 86, 279, 290, 56, 105, 73, 62, 251,
            196, 174, 20, 51, 37, 135, 18, 262, 114, 122,
            184, 204, 229, 163, 188, 15, 19, 58, 153, 115,
            275, 216, 173, 132, 30, 230, 156, 235, 285, 89,
            190, 116, 26, 12, 254, 186
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

            --9 Challenge Markers
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

            --Current Props from MM, 7 total
            'global.props.PropFlowers',
            'global.props.PropHedgeTrimmers',
            'global.props.PropHelmet',
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

            --15 Rando Arrowhead Bundles Small
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

            --9 Rando Arrowhead Bundles Medium
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',

            --69 Psicards, filler item, increase if adding more positions
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

            --9 Challenge Markers
            'Marker1',
            'Marker2',
            'Marker3',
            'Marker4',
            'Marker5',
            'Marker6',
            'Marker7',
            'Marker8',
            'Marker9',
           
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

            --Current Props from MM, 7 total
            'PropFlowers', 'PropHedgeTrimmers', 'PropHelmet', 'PropPlunger', 'PropRollingPin', 'PropSign', 'PropWaterCan',

            --Current Props from TH, 3 total
            'Candle1', 'Candle2', 'Megaphone',

            --Props from WW, 3 total
            'Peasant1Item', --Fred's Note
            'Peasant2Item', --Priceless Coin
            'Peasant3Item', --Rifle

            --Current Props from AS, 6 total
            'Cake', 'LiliBracelet', 'LobatoHand', 'StraightJacket', 'LobatoPainting',  'SeaUrchinWhistle',

            --15 Rando Arrowhead Bundles Small
            'ArrowheadBundleSmall1', 'ArrowheadBundleSmall2', 'ArrowheadBundleSmall3', 'ArrowheadBundleSmall4', 'ArrowheadBundleSmall5', 'ArrowheadBundleSmall6', 'ArrowheadBundleSmall7', 'ArrowheadBundleSmall8', 'ArrowheadBundleSmall9', 'ArrowheadBundleSmall10',
            'ArrowheadBundleSmall11', 'ArrowheadBundleSmall12', 'ArrowheadBundleSmall13', 'ArrowheadBundleSmall14', 'ArrowheadBundleSmall15',

            --9 Rando Arrowhead Bundles Medium
            'ArrowheadBundleMedium1', 'ArrowheadBundleMedium2', 'ArrowheadBundleMedium3', 'ArrowheadBundleMedium4', 'ArrowheadBundleMedium5', 'ArrowheadBundleMedium6', 'ArrowheadBundleMedium7', 'ArrowheadBundleMedium8', 'ArrowheadBundleMedium9',

            --69 Psicards, filler item, increase if adding more positions
            'Card1', 'Card2', 'Card3', 'Card4', 'Card5', 'Card6', 'Card7', 'Card8', 'Card9', 'Card10',
            'Card11', 'Card12', 'Card13', 'Card14', 'Card15', 'Card16', 'Card17', 'Card18', 'Card19', 'Card20',
            'Card21', 'Card22', 'Card23', 'Card24', 'Card25', 'Card26', 'Card27', 'Card28', 'Card29', 'Card30', 
            'Card31', 'Card32', 'Card33', 'Card34', 'Card35', 'Card36', 'Card37', 'Card38', 'Card39', 'Card40',
            'Card41', 'Card42', 'Card43', 'Card44', 'Card45', 'Card46', 'Card47', 'Card48', 'Card49', 'Card50',
            'Card51', 'Card52', 'Card53', 'Card54', 'Card55', 'Card56', 'Card57', 'Card58', 'Card59', 'Card60',
            'Card61', 'Card62', 'Card63', 'Card64', 'Card65', 'Card66', 'Card67', 'Card68', 'Card69',
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