function Randomizer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')

    end

    function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
    end

    function Ob:removeCollectibles()
        if strfind(FindScriptObject('LevelScript').levelType, 'real') then
            foreach_entity_oftype('global.collectibles.PSIChallengeCard', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.PsiChallengeMarker', function(ent) ent:killSelf() end)
            foreach_entity_oftype('ca.props.ScavengerHuntItem', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.BrainJar', function(ent) ent:killSelf() end)

        elseif strfind(FindScriptObject('LevelScript').levelType, 'mental') then
            foreach_entity_oftype('global.collectibles.EmotionalBaggage', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.EmotionalBaggageTag', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.MaxLivesUp', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.MaxAmmoUp', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.characters.Vault', function(ent) ent:killSelf() end)
            foreach_entity_oftype('global.collectibles.OneUp', function(ent) ent:killSelf() end)
        else
            GamePrint("ERROR, FAILED TO FIND LEVEL TYPE")
        end

        if strfind(FindScriptObject('LevelScript').levelType, 'mental') then
            if strfind(FindScriptObject('LevelScript').Type, 'mm.MMI1') then
                foreach_entity_oftype('global.collectibles.PsiPower', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropSign', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropRollingPin', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropPlunger', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropWaterCan', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropHedgeTrimmers', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropFlowers', function(ent) ent:killSelf() end)

            elseif strfind(FindScriptObject('LevelScript').Type, 'th.THMS') then
                foreach_entity_oftype('th.props.Candle', function(ent) ent:killSelf() end)

            elseif strfind(FindScriptObject('LevelScript').Type, 'th.THCW') then
                foreach_entity_oftype('th.props.Candle', function(ent) ent:killSelf() end)

            elseif strfind(FindScriptObject('LevelScript').Type, 'ww.WWMA') then
                foreach_entity_oftype('ww.props.PricelessCoin', function(ent) ent:killSelf() end)
                foreach_entity_oftype('ww.props.Rifle', function(ent) ent:killSelf() end)

            elseif strfind(FindScriptObject('LevelScript').Type, 'bv.BVRB') then
                foreach_entity_oftype('global.collectibles.MaxConfusionUp', function(ent) ent:killSelf() end)  

            end
        elseif strfind(FindScriptObject('LevelScript').levelType, 'real') then
            if strfind(FindScriptObject('LevelScript').Type, 'as.ASGR') then
                foreach_entity_oftype('as.props.AS_hand', function(ent) ent:killSelf() end)
                foreach_entity_oftype('as.props.LilisBracelet', function(ent) ent:killSelf() end)
            elseif strfind(FindScriptObject('LevelScript').Type, 'as.ASCO') then
                foreach_entity_oftype('as.props.AS_StraightJacket', function(ent) ent:killSelf() end)
                foreach_entity_oftype('as.props.AS_Painting', function(ent) ent:killSelf() end)
            elseif strfind(FindScriptObject('LevelScript').Type, 'as.ASLB') then
                foreach_entity_oftype('as.props.Cake', function(ent) ent:killSelf() end)
                --foreach_entity_oftype('as.props.PokeyProp', function(ent) ent:killSelf() end)
            end

        else
            GamePrint("WARNING, LEVEL NAME NOT LISTED")
        end
    end

    --function that reads each item(index) in Seed.lua and Positions.lua
    function Ob:placeCollectibles()
        --check current level name
        local level = (Global.levelScript:getLevelName())
        local index = 1
        local positions = fso('Positions', 'Positions')
        local classes = fso('Seed', 'Seed')
        local names = fso('Seed', 'Seed')
        local randoClass 
        local randoName
        local randoPosition
        --loops through each item in Seed.randoclassList, Seed.randonameList, and Positions.positionsList
        while positions.positionsList['item'..index] ~= nil do
            randoClass = classes.randoclassList[index]      
            randoName = names.randonameList[index]
            randoPosition = positions.positionsList['item'..index]

            --compare item's level type to current level, sends to spawn if true
            if randoPosition.levelName == level then   
                self:placeRandoObject(randoClass, randoName, randoPosition.x, randoPosition.y, randoPosition.z, randoPosition.ox, randoPosition.oy, randoPosition.oz, randoPosition.puzzle)
            end
            index = index+1
        end
    end

    --Handles placing Objects
    function Ob:placeRandoObject(class, name, x, y, z, ox, oy, oz, puzzle)
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
            --code for IceBlock puzzle in CAKC
            if puzzle == 'ice' then
                local block = FindScriptObject('ScavIceBlock')
                block.itemEncased = name
            end
            --code for Squirrel Acorn puzzle in CAGP
            if puzzle == 'squirrel' then
                local squirrel = FindScriptObject('ScavengerSquirrel')
                squirrel.acorn = name
            end
            --code for Two Geysers Skull puzzle in CAGP
            if puzzle == 'geyser' then
                local geyser = FindScriptObject('geyser1')
                geyser.itemPlugging = name
            end
            --code for Hornet Nest Fertility Idol puzzle in CARE
            if puzzle == 'hive' then
                local hive = FindScriptObject('ScavHornetNest')
                hive.huntItem = name
            end

            --[[code for RankUp checks, each level is separate
            Handled by RankUpPlacer, spawned in CAJA levelscript]]
            --Rank10
            if puzzle == 'rank10' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank10 = name
            end
            --Rank20
            if puzzle == 'rank20' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank20 = name
            end
            --Rank30
            if puzzle == 'rank30' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank30 = name
            end
            --Rank40
            if puzzle == 'rank40' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank40 = name
            end
            --Rank50
            if puzzle == 'rank50' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank50 = name
            end
            --Rank60
            if puzzle == 'rank60' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank60 = name
            end
            --Rank70
            if puzzle == 'rank70' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank70 = name
            end
            --Rank80
            if puzzle == 'rank80' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank80 = name
            end
            --Rank90
            if puzzle == 'rank90' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank90 = name
            end
            --Rank100
            if puzzle == 'rank100' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank100 = name
            end
            --[[Locations in WW spawned by cutscenes]]
            --Helping Peasant 1 with Fred's Note
            if puzzle == 'p1Help' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.p1Helped = name
            end
            --Helping Peasant 2 with Priceless Coin
            if puzzle == 'p2Help' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.p2Helped = name
            end
            --Helping Peasant 3 with Musket
            if puzzle == 'p3Help' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.p3Helped = name
            end
            --Helping Carpenter
            if puzzle == 'CarpHelp' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.carpenterHelped = name
            end
            --Helping Knight
            if puzzle == 'KnightHelp' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.knightHelped = name
            end
            --Burning Haybale location
            if puzzle == 'haybale' then
                local ref = FindScriptObject('WWPuzzlePlacer')
                ref.p3Puzzle = name
            end
            
            
            

            --if more items need conditional changes, add code below
    
        end
    end
   

    return Ob
end