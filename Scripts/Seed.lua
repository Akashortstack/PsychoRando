function Seed(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        Ob.checks_list = { 
            item1 = {
                class = 'global.collectibles.RandoPsiCard', 
                name = 'Card1',
                levelName = 'CAKC',
                x = -6797,   
                y = 3365, 
                z = -16380,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item2 = {
                class = 'global.collectibles.RandoPsiCard',
                name = 'Card2',
                levelName = 'CAKC',
                x = -6662,   
                y = 4834, 
                z = -16859,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item3 = {
                class = 'Global.Collectibles.RandoLivesUp',
                name = 'LifeUp1',
                levelName = 'CAKC',
                x = -8613,   
                y = 3409, 
                z = -15159,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item4 = {
                class = 'global.collectibles.BrainJar',
                name = 'BrainJarElton',
                levelName = 'CAKC',
                x = -8245,   
                y = 5489, 
                z = -16566,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item5 = {
                class = 'Global.Collectibles.ScavEgg',
                name = 'ScavEgg',
                levelName = 'CAKC',
                x = -5629,   
                y = 4510, 
                z = -13242,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item6 = {
                class = 'global.collectibles.Firestarting',
                name = 'Firestarting1',
                levelName = 'CAKC',
                x = -8250,   
                y = 4672, 
                z = -17194,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item7 = {
                class = 'global.collectibles.Levitation',
                name = 'Levitation1',
                levelName = 'CAKC',
                x = -5826,   
                y = 5921, 
                z = -17086,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item8 = {
                class = 'global.collectibles.RandoSuitcaseTag',
                name = 'SuitcaseTag1',
                levelName = 'CAKC',
                x = -4437,   
                y = 5240, 
                z = -15717,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item9 = {
                class = 'global.collectibles.RandoSuitcase',
                name = 'Suitcase3',
                levelName = 'CAKC',
                x = -8241, 
                y = 6295, 
                z = -18064,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item10 = {
                class = 'Global.Characters.Vault',
                name = 'Vault1',
                levelName = 'CAKC',
                x = -3861, 
                y = 5656, 
                z = -12938,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item11 = {
                class = 'global.props.PropRollingPin',
                name = 'PropRollingPin',
                levelName = 'CAKC',
                x = -3621, 
                y = 5509, 
                z = -11089,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item12 = {
                class = 'global.props.Peasant2Item',
                name = 'Peasant2Item',
                levelName = 'CAKC',
                x = -9914, 
                y = 8434, 
                z = -18209,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item13 = {
                class = 'global.props.AS_Painting',
                name = 'LobatoPainting',
                levelName = 'CAKC',
                x = -5282, 
                y = 7580, 
                z = -17131,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item14 = {
                class = 'global.collectibles.RandoPsiChallengeMarker',
                name = 'Marker1',
                levelName = 'CAKC',
                x = -4885, 
                y = 4255, 
                z = -19145,
                ox = 0,
                oy = 0,
                oz = 0,
            },




        }
       

    end


    --function that reads each item(x) in Ob.checks_list for level and position
    function Ob:placeCollectibles()
        --check current level name
        local level = (Global.levelScript:getLevelName())
        local rando = fso('Randomizer')
        local index = 1 
        local check 
        --loops through each item in Ob.checks_list
        while self.checks_list['item'..index] ~= nil do        
            check = self.checks_list['item'..index]
            --compare item's level type to current level
            if check.levelName == level then   
                rando:placeRandoObject(check.class, check.name, check.x, check.y, check.z, check.ox, check.oy, check.oz)
            end
            index = index+1
        end
    end

    --[[ Moved to Randomizer.lua

    function Ob:placeRandoObject(class, name, x, y, z, ox, oy, oz)
        --checks if Global.player.stats.RandoProp exists if item is RandoProp, if item has been collected don't spawn 
        if Global.player.stats.RandoProp[name] == 'collected' then
            return nil
        else
            --Spawn item, set position, set orientation
            local place = SpawnScript(class, name)
            place:setPosition(x, y, z)
            place:setOrientation(ox, oy, oz)
             --code for fixing Baggage Collect Radius
            if class == 'global.collectibles.RandoSuitcase' or class == 'global.collectibles.RandoPurse' or class == 'global.collectibles.RandoHatbox' or class == 'global.collectibles.RandoSteamertrunk' or class == 'global.collectibles.RandoDufflebag' then
                place:SetCollectRadius()
            end
            --Moves PsiChallenge Marker Up by 100, can apply to more items if needed
            if class == 'global.collectibles.RandoPsiChallengeMarker' then
                place:setPosition(place:getPosInFrontOf(0, 100))
            end
            --if more items need conditional changes, add code below
    
        end
    end]]
        
    return Ob
end