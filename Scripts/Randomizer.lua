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
        local classes = fso('ShuffleItems', 'ShuffleItems')
        local names = fso('ShuffleItems', 'ShuffleItems')
        local randoClass 
        local randoName
        local randoPosition
        --loops through each item in Seed.randoclassList, Seed.randonameList, and Positions.positionsList
        while positions.positionsList['item'..index] ~= nil do
            randoClass = classes.randoclassList[index]      
            randoName = names.randonameList[index]
            randoPosition = positions.positionsList['item'..index]
            --HACK, prints "Spoiler Log"
            --GamePrint("Spoiler Item"..index..", Class "..randoClass..", Name "..randoName)

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
            --Rank5
            if puzzle == 'rank5' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank5 = name
            end
            --Rank10
            if puzzle == 'rank10' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank10 = name
            end
            --Rank15
            if puzzle == 'rank15' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank15 = name
            end
            --Rank20
            if puzzle == 'rank20' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank20 = name
            end
            --Rank25
            if puzzle == 'rank25' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank25 = name
            end
            --Rank30
            if puzzle == 'rank30' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank30 = name
            end
            --Rank35
            if puzzle == 'rank35' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank35 = name
            end
            --Rank40
            if puzzle == 'rank40' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank40 = name
            end
            --Rank45
            if puzzle == 'rank45' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank45 = name
            end
            --Rank50
            if puzzle == 'rank50' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank50 = name
            end
            --Rank55
            if puzzle == 'rank55' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank55 = name
            end
            --Rank60
            if puzzle == 'rank60' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank60 = name
            end
            --Rank65
            if puzzle == 'rank65' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank65 = name
            end
            --Rank70
            if puzzle == 'rank70' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank70 = name
            end
            --Rank75
            if puzzle == 'rank75' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank75 = name
            end
            --Rank80
            if puzzle == 'rank80' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank80 = name
            end
            --Rank85
            if puzzle == 'rank85' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank85 = name
            end
            --Rank90
            if puzzle == 'rank90' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank90 = name
            end
            --Rank95
            if puzzle == 'rank95' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank95 = name
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


            --[[Sasha's Shooting Gallery]]

            --Cube Face One
            if puzzle == 'face1item1' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item1 = name
            end

            if puzzle == 'face1item2' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item2 = name
            end

            if puzzle == 'face1item3' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item3 = name
            end

            if puzzle == 'face1item4' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item4 = name
            end

            if puzzle == 'face1item5' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item5 = name
            end

            if puzzle == 'face1item6' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face1item6 = name
            end

            --Cube Face Two
            if puzzle == 'face2item1' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face2item1 = name
            end

            if puzzle == 'face2item2' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face2item2 = name
            end

            if puzzle == 'face2item3' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face2item3 = name
            end

            --Cube Face Three

            if puzzle == 'face3item1' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face3item1 = name
            end

            if puzzle == 'face3item2' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face3item2 = name
            end

            if puzzle == 'face3item3' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face3item3 = name
            end

            if puzzle == 'face3item4' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face3item4 = name
            end

            --Cube Face Four

            if puzzle == 'face4item1' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face4item1 = name
            end

            if puzzle == 'face4item2' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face4item2 = name
            end

            if puzzle == 'face4item3' then
                local ref = FindScriptObject('SAItemPlacer')
                ref.face4item3 = name
            end

            --if more items need conditional changes, add code here

    
        end
    end
   

    return Ob
end