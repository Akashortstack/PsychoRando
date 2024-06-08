function APReceiver(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --used in apTableFill
        Ob.randoclassList = {}
        Ob.randonameList = {}
        Ob.allowDuplicatesClassesSet = {}
        --used in checkReceivedList()
        Ob.numbersTable = {}
    end

    --used to avoid max lua variable limitations
    function Ob:apTableFill()
        --LIST MUST MATCH nameTable ONE FOR ONE, OR ELSE...
        local classTable = {
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

            --4 Confusion Ammo Up
            'Global.Collectibles.RandoConfusionUp',
            'Global.Collectibles.RandoConfusionUp',
            'Global.Collectibles.RandoConfusionUp',
            'Global.Collectibles.RandoConfusionUp',

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

            --5 Rando Arrowhead Bundles Medium
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.ArrowheadBundleMedium',

            --Oarsman's Badge
            'global.collectibles.RandoOarsmansBadge',

            --Sasha's Button
            'global.props.Button',

            --Crow Feather
            'global.props.AS_CrowFeather',

            --Cobweb Duster
            'global.collectibles.CobwebDuster',

            --Squirrel Dinner
            'global.props.RandoSquirrelDinner',
            
            --9 Mind Unlocks
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',
            'global.collectibles.RandoMindUnlock',

            --110 Psicards, filler item, increase if adding more positions
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

            --APPlaceholder
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',
            'global.collectibles.APPlaceholder',

        }

        --LIST MUST MATCH classTable ONE FOR ONE, OR ELSE...
        local nameTable = {

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

            --4 Confusion Ammo Up
            'ConfusionUp1',
            'ConfusionUp2',
            'ConfusionUp3',
            'ConfusionUp4',

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
  
            --5 Rando Arrowhead Bundles Medium
            'AHMedium1', 'AHMedium2', 'AHMedium3', 'AHMedium4', 'AHMedium5',

            --Oarsman's Badge
            'Oarsmans Badge',

            --Sasha's Button
            'Button',

            --Crow Feather
            'Feather',

            --Cobweb Duster
            'CobwebDuster',
            
            --Squirrel Dinner
            'SquirrelDinner',

            --9 Mind Unlocks
            'CoachMind',
            'SashaMind',
            'MillaMind',
            'LindaMind',
            'BoydMind',
            'GloriaMind',
            'FredMind',
            'EdgarMind',
            'OlyMind',

            --110 Psicards, filler item, increase if adding more positions
            'Card1', 'Card2', 'Card3', 'Card4', 'Card5', 'Card6', 'Card7', 'Card8', 'Card9', 'Card10',
            'Card11', 'Card12', 'Card13', 'Card14', 'Card15', 'Card16', 'Card17', 'Card18', 'Card19', 'Card20',
            'Card21', 'Card22', 'Card23', 'Card24', 'Card25', 'Card26', 'Card27', 'Card28', 'Card29', 'Card30', 
            'Card31', 'Card32', 'Card33', 'Card34', 'Card35', 'Card36', 'Card37', 'Card38', 'Card39', 'Card40',
            'Card41', 'Card42', 'Card43', 'Card44', 'Card45', 'Card46', 'Card47', 'Card48', 'Card49', 'Card50',
            'Card51', 'Card52', 'Card53', 'Card54', 'Card55', 'Card56', 'Card57', 'Card58', 'Card59', 'Card60',
            'Card61', 'Card62', 'Card63', 'Card64', 'Card65', 'Card66', 'Card67', 'Card68', 'Card69', 'Card70',
            'Card71', 'Card72', 'Card73', 'Card74', 'Card75', 'Card76', 'Card77', 'Card78', 'Card79', 'Card80', 
            'Card81', 'Card82', 'Card83', 'Card84', 'Card85', 'Card86', 'Card87', 'Card88', 'Card89', 'Card90', 
            'Card91', 'Card92', 'Card93', 'Card94', 'Card95', 'Card96', 'Card97', 'Card98', 'Card99', 'Card100',
            'Card101', 'Card102', 'Card103', 'Card104', 'Card105', 'Card106', 'Card107', 'Card108', 'Card109', 'Card110', 

            --AP Placeholders, 317 Total
            'AP Item 1',
            'AP Item 2',
            'AP Item 3',
            'AP Item 4',
            'AP Item 5',
            'AP Item 6',
            'AP Item 7',
            'AP Item 8',
            'AP Item 9',
            'AP Item 10',
            'AP Item 11',
            'AP Item 12',
            'AP Item 13',
            'AP Item 14',
            'AP Item 15',
            'AP Item 16',
            'AP Item 17',
            'AP Item 18',
            'AP Item 19',
            'AP Item 20',
            'AP Item 21',
            'AP Item 22',
            'AP Item 23',
            'AP Item 24',
            'AP Item 25',
            'AP Item 26',
            'AP Item 27',
            'AP Item 28',
            'AP Item 29',
            'AP Item 30',
            'AP Item 31',
            'AP Item 32',
            'AP Item 33',
            'AP Item 34',
            'AP Item 35',
            'AP Item 36',
            'AP Item 37',
            'AP Item 38',
            'AP Item 39',
            'AP Item 40',
            'AP Item 41',
            'AP Item 42',
            'AP Item 43',
            'AP Item 44',
            'AP Item 45',
            'AP Item 46',
            'AP Item 47',
            'AP Item 48',
            'AP Item 49',
            'AP Item 50',
            'AP Item 51',
            'AP Item 52',
            'AP Item 53',
            'AP Item 54',
            'AP Item 55',
            'AP Item 56',
            'AP Item 57',
            'AP Item 58',
            'AP Item 59',
            'AP Item 60',
            'AP Item 61',
            'AP Item 62',
            'AP Item 63',
            'AP Item 64',
            'AP Item 65',
            'AP Item 66',
            'AP Item 67',
            'AP Item 68',
            'AP Item 69',
            'AP Item 70',
            'AP Item 71',
            'AP Item 72',
            'AP Item 73',
            'AP Item 74',
            'AP Item 75',
            'AP Item 76',
            'AP Item 77',
            'AP Item 78',
            'AP Item 79',
            'AP Item 80',
            'AP Item 81',
            'AP Item 82',
            'AP Item 83',
            'AP Item 84',
            'AP Item 85',
            'AP Item 86',
            'AP Item 87',
            'AP Item 88',
            'AP Item 89',
            'AP Item 90',
            'AP Item 91',
            'AP Item 92',
            'AP Item 93',
            'AP Item 94',
            'AP Item 95',
            'AP Item 96',
            'AP Item 97',
            'AP Item 98',
            'AP Item 99',
            'AP Item 100',
            'AP Item 101',
            'AP Item 102',
            'AP Item 103',
            'AP Item 104',
            'AP Item 105',
            'AP Item 106',
            'AP Item 107',
            'AP Item 108',
            'AP Item 109',
            'AP Item 110',
            'AP Item 111',
            'AP Item 112',
            'AP Item 113',
            'AP Item 114',
            'AP Item 115',
            'AP Item 116',
            'AP Item 117',
            'AP Item 118',
            'AP Item 119',
            'AP Item 120',
            'AP Item 121',
            'AP Item 122',
            'AP Item 123',
            'AP Item 124',
            'AP Item 125',
            'AP Item 126',
            'AP Item 127',
            'AP Item 128',
            'AP Item 129',
            'AP Item 130',
            'AP Item 131',
            'AP Item 132',
            'AP Item 133',
            'AP Item 134',
            'AP Item 135',
            'AP Item 136',
            'AP Item 137',
            'AP Item 138',
            'AP Item 139',
            'AP Item 140',
            'AP Item 141',
            'AP Item 142',
            'AP Item 143',
            'AP Item 144',
            'AP Item 145',
            'AP Item 146',
            'AP Item 147',
            'AP Item 148',
            'AP Item 149',
            'AP Item 150',
            'AP Item 151',
            'AP Item 152',
            'AP Item 153',
            'AP Item 154',
            'AP Item 155',
            'AP Item 156',
            'AP Item 157',
            'AP Item 158',
            'AP Item 159',
            'AP Item 160',
            'AP Item 161',
            'AP Item 162',
            'AP Item 163',
            'AP Item 164',
            'AP Item 165',
            'AP Item 166',
            'AP Item 167',
            'AP Item 168',
            'AP Item 169',
            'AP Item 170',
            'AP Item 171',
            'AP Item 172',
            'AP Item 173',
            'AP Item 174',
            'AP Item 175',
            'AP Item 176',
            'AP Item 177',
            'AP Item 178',
            'AP Item 179',
            'AP Item 180',
            'AP Item 181',
            'AP Item 182',
            'AP Item 183',
            'AP Item 184',
            'AP Item 185',
            'AP Item 186',
            'AP Item 187',
            'AP Item 188',
            'AP Item 189',
            'AP Item 190',
            'AP Item 191',
            'AP Item 192',
            'AP Item 193',
            'AP Item 194',
            'AP Item 195',
            'AP Item 196',
            'AP Item 197',
            'AP Item 198',
            'AP Item 199',
            'AP Item 200',
            'AP Item 201',
            'AP Item 202',
            'AP Item 203',
            'AP Item 204',
            'AP Item 205',
            'AP Item 206',
            'AP Item 207',
            'AP Item 208',
            'AP Item 209',
            'AP Item 210',
            'AP Item 211',
            'AP Item 212',
            'AP Item 213',
            'AP Item 214',
            'AP Item 215',
            'AP Item 216',
            'AP Item 217',
            'AP Item 218',
            'AP Item 219',
            'AP Item 220',
            'AP Item 221',
            'AP Item 222',
            'AP Item 223',
            'AP Item 224',
            'AP Item 225',
            'AP Item 226',
            'AP Item 227',
            'AP Item 228',
            'AP Item 229',
            'AP Item 230',
            'AP Item 231',
            'AP Item 232',
            'AP Item 233',
            'AP Item 234',
            'AP Item 235',
            'AP Item 236',
            'AP Item 237',
            'AP Item 238',
            'AP Item 239',
            'AP Item 240',
            'AP Item 241',
            'AP Item 242',
            'AP Item 243',
            'AP Item 244',
            'AP Item 245',
            'AP Item 246',
            'AP Item 247',
            'AP Item 248',
            'AP Item 249',
            'AP Item 250',
            'AP Item 251',
            'AP Item 252',
            'AP Item 253',
            'AP Item 254',
            'AP Item 255',
            'AP Item 256',
            'AP Item 257',
            'AP Item 258',
            'AP Item 259',
            'AP Item 260',
            'AP Item 261',
            'AP Item 262',
            'AP Item 263',
            'AP Item 264',
            'AP Item 265',
            'AP Item 266',
            'AP Item 267',
            'AP Item 268',
            'AP Item 269',
            'AP Item 270',
            'AP Item 271',
            'AP Item 272',
            'AP Item 273',
            'AP Item 274',
            'AP Item 275',
            'AP Item 276',
            'AP Item 277',
            'AP Item 278',
            'AP Item 279',
            'AP Item 280',
            'AP Item 281',
            'AP Item 282',
            'AP Item 283',
            'AP Item 284',
            'AP Item 285',
            'AP Item 286',
            'AP Item 287',
            'AP Item 288',
            'AP Item 289',
            'AP Item 290',
            'AP Item 291',
            'AP Item 292',
            'AP Item 293',
            'AP Item 294',
            'AP Item 295',
            'AP Item 296',
            'AP Item 297',
            'AP Item 298',
            'AP Item 299',
            'AP Item 300',
            'AP Item 301',
            'AP Item 302',
            'AP Item 303',
            'AP Item 304',
            'AP Item 305',
            'AP Item 306',
            'AP Item 307',
            'AP Item 308',
            'AP Item 309',
            'AP Item 310',
            'AP Item 311',
            'AP Item 312',
            'AP Item 313',
            'AP Item 314',
            'AP Item 315',
            'AP Item 316',
            'AP Item 317',
            
        }

        -- Classes where unlimited copies (the integer limits should never be reached) can be received from AP, even if
        -- AP sends more than were placed in the multiworld. In some cases, receiving more than a certain number will
        -- have no effect, but the items will still be received.
        -- When receiving any other class of item via AP server cheat command, if there is a locally placed item with
        -- the same name, that locally placed item should be collected instead. But, if the matching locally placed item
        -- has already been collected, then the received item will be ignored.
        local allowDuplicatesClasses = {
            'global.collectibles.Marksmanship',
            'global.collectibles.Firestarting',
            'global.collectibles.Confusion',
            'global.collectibles.Levitation',
            'global.collectibles.Telekinesis',
            'global.collectibles.Invisibility',
            'global.collectibles.Clairvoyance',
            'global.collectibles.Shield',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoConfusionUp',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoSuitcaseTag',
            'global.collectibles.RandoPurseTag',
            'global.collectibles.RandoHatboxTag',
            'global.collectibles.RandoSteamertrunkTag',
            'global.collectibles.RandoDufflebagTag',
            'Global.Characters.Vault',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.RandoPsiCard',
        }
        -- Convert the list into a dictionary that will be treated like a set.
        local allowDuplicatesClassesSet = {}
        for k, v in allowDuplicatesClasses do
            allowDuplicatesClassesSet[v] = TRUE
        end

        --write results to new tables
        self.randoclassList = classTable
        self.randonameList = nameTable
        self.allowDuplicatesClassesSet = allowDuplicatesClassesSet

        --[[Print the index and value of each number in the table
        for k, v in self.randoclassList do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end

        --Print the index and value of each number in the table
        for k, v in self.randonameList do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end]]
    end

    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        --fill tables
        self:apTableFill()
        --check to make sure we're not in the opening menu or creating a new profile
        local level = (Global.levelScript:getLevelName())
        if level ~= 'CABU' and level ~= 'STMU' then
            --start looping to check for items from ItemsReceived.txt
            self:setState('CompareAPTable')
        end
    end

    function Ob:stateCompareAPTable()
        --wait so function isn't called constantly
        self:sleep(1.0)
        --update self.numbersTable
        self:checkReceivedList()
        --check if any items need to be given to player
        self:setState('CheckSendToPlayer')
    end

    function Ob:checkReceivedList()
        -- Create an empty table to store numbers
        self.numbersTable = {}

        --find the matching seed folder in ModData
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/ItemsReceived.txt"

        --read from ItemsReceived.txt for items sent by AP Client
        local h = fopen(filePath, "r")

        -- function to fill table with numbers from ItemsReceived.txt
        local checkstuff = TRUE
        while checkstuff == TRUE do
            --Read a single line from the file (Lua 4 uses "*l" to read a line)
            local line = fread(h, "*l")
            --stop if line is blank
            if line == nil then
                break
            else
                --add number to table 
                tinsert(self.numbersTable, line)        
            end
        end

        --Print the index and value of each number in the table
        --[[for k, v in self.numbersTable do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end
        ]]

        -- Close the file
        fclose(h)
        
    end

    function Ob:stateCheckSendToPlayer()
        -- loops through self.numbersTable to send items to player

        -- Index of the last item that was received from AP.
        local lastApIndex = Global.player.stats.APLastIndex

        -- Special handling for Gloria's Theater candles to ensure that, if multiple non-local candles are received,
        -- they cause both available candles to be received and no more.
        local nonLocalCandlesReceived = 0
        -- If an item in the sequence gets skipped somehow, only print the warning once per iteration of
        -- `self.numbersTable`.
        local printedDesyncWarning = FALSE
        --used for debugging AP issues
        --GamePrint("Current num received items: " .. lastApIndex)
        for k, v in self.numbersTable do
            if k ~= 'n' then
                --make sure a cutscene isn't playing when we receive our items
                while Global.cutsceneScript.cutscenePlaying == 1 do
                    self:sleep(1.0)
                end

                --split the line "apIndex,index,isNonLocal" into its parts
                local split = {}
                -- Match groups of characters that are not ",". For each matched group, call a function to insert
                -- the matched group into `split`.
                gsub(v, "([^,]+)", function(c) tinsert(%split, c) end)
                --convert the values to numbers
                local apIndex = tonumber(split[1])
                local index = tonumber(split[2])
                -- The item has been received from the multiworld and was not placed locally.
                local isNonLocal = split[3] == "1"

                -- Only receive the item if it's the next one in the sequence.
                if apIndex == (lastApIndex + 1) then
                    -- match the value with the index of class and name from rando tables
                    local apClass = self.randoclassList[index]
                    local apName = self.randonameList[index]

                    -- Some items can have multiple copies that never cause locally placed items of the same class to be
                    -- collected.
                    local isNonLocalCopy = isNonLocal and self.allowDuplicatesClassesSet[apClass]

                    -- Gloria's Theater candles are unique in that 2 can be received, but no more, so special handling
                    -- is required.
                    if isNonLocal and apClass == 'global.props.Candle' then
                        -- Locally placed items with duplicates are placed starting from their first available ID, so
                        -- if only 1 candle is placed locally, it is guaranteed to be 'Candle1'.
                        -- We don't rely on checking only `Global.player.stats.APItem['Candle2'] ~= 'collected'` because
                        -- if two non-local candles are received in quick succession, it's possible that the first
                        -- candle won't have been collected by the time the second candle is received.
                        if nonLocalCandlesReceived == 0 and Global.player.stats.APItem['Candle2'] ~= 'collected' then
                            apName = 'Candle2'
                            nonLocalCandlesReceived = 1
                        else
                            -- 'Candle2' has been received already, so if there is a remaining non-local candle it must
                            -- be 'Candle1'. If extra candles are received, they will do nothing because 'Candle1' will
                            -- already have been collected.
                            apName = 'Candle1'
                            nonLocalCandlesReceived = 2
                        end
                    end

                    if isNonLocalCopy then
                        -- Prefix name with '_' so that it is easy to tell that the item is a non-local copy and so that
                        -- it is easy to recover the real name if needed.
                        apName = '_' .. apName
                    end

                    -- Ignore baggage, because those are always collected locally.
                    if apClass ~= 'global.collectibles.RandoSuitcase' and apClass ~= 'global.collectibles.RandoPurse' and apClass ~= 'global.collectibles.RandoHatbox' and apClass ~= 'global.collectibles.RandoSteamertrunk' and apClass ~= 'global.collectibles.RandoDufflebag' then
                        -- If the item is not a non-local copy, check player save data and skip if the item has already
                        -- been collected.
                        if isNonLocalCopy or Global.player.stats.APItem[apName] ~= 'collected' then
                            -- send the item to the player
                            self:getRandoItem(apClass, apName, isNonLocalCopy)
                            -- pause so they don't all spawn at once
                            self:sleep(1.2)
                        end
                    end

                    -- Update the index of the last received item.
                    lastApIndex = apIndex
                    Global.player.stats.APLastIndex = apIndex

                elseif apIndex > lastApIndex and not printedDesyncWarning then
                    -- The client handles resyncing with AP if it receives items out of order, but even when the client
                    -- writes all the lines into ItemsReceived.txt in the correct order, sometimes the iteration here
                    -- skips a line for some reason.
                    -- The lines in ItemsReceived.txt being out of order shouldn't happen, but just in-case they can in
                    -- the future, we won't break the loop here and will instead continue looking for the correct next
                    -- item.
                    GamePrint("Warning: Possible desync. The next AP Index was expected to be " .. (lastApIndex + 1) ..
                              ", but was actually " .. apIndex)
                    printedDesyncWarning = TRUE
                end
            end
        end
        self:setState('CompareAPTable')

    end

    --Gives item to player
    function Ob:getRandoItem(class, name, isNonLocalCopy)
        -- check if the item currently exists
        local sentitem = nil
        -- The extra `1` argument seems to tell the game to not print a stacktrace when the object doesn't exist.
        local existing_item = FindScriptObject(name, 1)
        if (not existing_item) then
            -- item doesn't exist, spawn a new one
            sentitem = SpawnScript(class, name)
        elseif isNonLocalCopy then
            -- If multiple non-local items of the same type are spawned in a row, sometimes the previous one won't be
            -- dead before we want to spawn another one, e.g. PSI Challenge Markers, so append a number to the end of
            -- the name to make it unique.
            -- None of the non-local copies of items use their name for anything, other than being marked as a non-local
            -- copy by starting with "_", so modifying the name by appending to it is fine.
            local i = 1
            local orig_name = name
            repeat
                name = orig_name .. "_" .. tostring(i)
                i = i + 1
            until(FindScriptObject(name, 1) == nil)

            sentitem = SpawnScript(class, name)
        else
            -- item exists, move it onto the player    
            sentitem = existing_item
            --make sure item isn't hidden
            sentitem:show()
        end

        --break open brain jars and vaults automatically
        if class == 'global.collectibles.BrainJar' or class == 'Global.Characters.Vault' then
            sentitem:setPosition(0, -100000, 0)
            sentitem:onNewMoveMelee()           
        else
            --set item position on top of player, instantly collected
            local dart = fso('Dart')
            local x, y, z = dart:getPosition()
            sentitem:setPosition(x, y, z)
        end
        
    end

    return Ob
end