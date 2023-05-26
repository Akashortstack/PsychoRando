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
        --[[list of all check positions in the game,
        special case items should go at end of list]]
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

        Ob.randoclassList = {}
        Ob.randonameList = {}

    end


    --function that reads each item(x) in Ob.checksList for level and position
    function Ob:placeCollectibles()
        --check current level name
        local level = (Global.levelScript:getLevelName())
        local rando = fso('Randomizer')
        local index = 1 
        local randoClass 
        local randoName
        local set
        --loops through each item in Ob.randoclassList, Ob.randonameList, and Ob.positionsList
        while self.positionsList['item'..index] ~= nil do
            randoClass = self.randoclassList[index]      
            randoName = self.randonameList[index]
            set = self.positionsList['item'..index]

            --compare item's level type to current level, spawns if true
            if set.levelName == level then   
                rando:placeRandoObject(randoClass, randoName, set.x, set.y, set.z, set.ox, set.oy, set.oz)
            end
            index = index+1
        end
    end

    --[[ function that randomizes all checks in the game, keeping class paired with name
    Ex. item 1 in classTable always pairs with item 1 in nameTable
    ]]
    function Ob:randomizeChecks()
        --TEST LIST, NEEDS UPDATED TO FULL LIST
        local classTable = {
            'global.collectibles.RandoPsiCard', 
            'global.collectibles.RandoPsiCard',
            'Global.Collectibles.RandoLivesUp',
            'global.collectibles.BrainJar',
            'Global.Collectibles.ScavEgg',
            'global.collectibles.Firestarting',
            'global.collectibles.Levitation',
            'global.collectibles.RandoSuitcaseTag',
            'global.collectibles.RandoSuitcase',
            'Global.Characters.Vault',
            'global.props.PropRollingPin',
            'global.props.Peasant2Item',
            'global.props.AS_Painting',
        }

        --TEST LIST, NEEDS UPDATED TO FULL LIST
        local nameTable = {
            'Card1',
            'Card2',
            'LifeUp1',
            'BrainJarElton',
            'ScavEgg',
            'Firestarting1',
            'Levitation1',
            'SuitcaseTag1',
            'Suitcase3',
            'Vault1',
            'PropRollingPin',
            'Peasant2Item',
            'LobatoPainting',
        }
        --get total number of item in classTable
        local n = tableLength(classTable)
        --shuffle loop
        for i = n, 2, -1 do
            local j = random(i)
            classTable[i], classTable[j] = classTable[j], classTable[i]
            nameTable[i], nameTable[j] = nameTable[j], nameTable[i]
        end

        --write results to new, permanent tables
        self.randoclassList = classTable
        self.randonameList = nameTable
       
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