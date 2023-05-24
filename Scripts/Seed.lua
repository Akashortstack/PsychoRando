

-- gets length of a table
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
        Ob.checksList = { 
            {
                class = 'global.collectibles.RandoPsiCard', 
                name = 'Card1',
            },
            {
                class = 'global.collectibles.RandoPsiCard',
                name = 'Card2',
            },
            {
                class = 'Global.Collectibles.RandoLivesUp',
                name = 'LifeUp1',
            },
            {
                class = 'global.collectibles.BrainJar',
                name = 'BrainJarElton',
            },
            {
                class = 'Global.Collectibles.ScavEgg',
                name = 'ScavEgg',
            },
            {
                class = 'global.collectibles.Firestarting',
                name = 'Firestarting1',
            },
            {
                class = 'global.collectibles.Levitation',
                name = 'Levitation1',
            },
            {
                class = 'global.collectibles.RandoSuitcaseTag',
                name = 'SuitcaseTag1',
            },
            {
                class = 'global.collectibles.RandoSuitcase',
                name = 'Suitcase3',
            },
            {
                class = 'Global.Characters.Vault',
                name = 'Vault1',
            },
            {
                class = 'global.props.PropRollingPin',
                name = 'PropRollingPin',
            },
            {
                class = 'global.props.Peasant2Item',
                name = 'Peasant2Item',
            },
            {
                class = 'global.props.AS_Painting',
                name = 'LobatoPainting',
            },


        }

        Ob.positionsList = {
            item1 = {
                levelName = 'CAKC',
                x = -6797,   
                y = 3365, 
                z = -16380,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item2 = {
                levelName = 'CAKC',
                x = -6662,   
                y = 4834, 
                z = -16859,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item3 = {
                levelName = 'CAKC',
                x = -8613,   
                y = 3409, 
                z = -15159,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item4 = {
                levelName = 'CAKC',
                x = -8245,   
                y = 5489, 
                z = -16566,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item5 = {
                levelName = 'CAKC',
                x = -5629,   
                y = 4510, 
                z = -13242,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item6 = {
                levelName = 'CAKC',
                x = -8250,   
                y = 4672, 
                z = -17194,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item7 = {
                levelName = 'CAKC',
                x = -5826,   
                y = 5921, 
                z = -17086,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item8 = {
                levelName = 'CAKC',
                x = -4437,   
                y = 5240, 
                z = -15717,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item9 = {
                levelName = 'CAKC',
                x = -8241, 
                y = 6295, 
                z = -18064,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item10 = {
                levelName = 'CAKC',
                x = -3861, 
                y = 5656, 
                z = -12938,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item11 = {
                levelName = 'CAKC',
                x = -3621, 
                y = 5509, 
                z = -11089,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item12 = {
                levelName = 'CAKC',
                x = -9914, 
                y = 8434, 
                z = -18209,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item13 = {
                levelName = 'CAKC',
                x = -5282, 
                y = 7580, 
                z = -17131,
                ox = 0,
                oy = 0,
                oz = 0,
            },
        }

        Ob.randoList = {}

    end


    --function that reads each item(x) in Ob.checksList for level and position
    function Ob:placeCollectibles()
        --check current level name
        local level = (Global.levelScript:getLevelName())
        local rando = fso('Randomizer')
        local index = 1 
        local check 
        local set
        --loops through each item in Ob.checksList and Ob.positionsList
        while self.positionsList['item'..index] ~= nil do
            check = self.checksList[index]        
            set = self.positionsList['item'..index]

            --compare item's level type to current level
            if set.levelName == level then   
                rando:placeRandoObject(check.class, check.name, set.x, set.y, set.z, set.ox, set.oy, set.oz)
            end
            index = index+1
        end
    end

    function Ob:randomizeChecks()
        --[[self.randoList = self.checksList
        local shuffled_list = shuffle(self.randoList)
        GamePrint("Test "..shuffled_list[1].class)
        ]]
        local n = tableLength(self.checksList)
        for i = n, 2, -1 do
            local j = random(i)
            self.checksList[i], self.checksList[j] = self.checksList[j], self.checksList[i]
        end
        GamePrint("Test "..self.checksList[1].class)
    end
        -- shuffles a list
    function Ob:shuffle(list)
        local n = tableLength(list)
        for i = n, 2, -1 do
            local j = random(i)
            list[i], list[j] = list[j], list[i]
        end
        return list
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