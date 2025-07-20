function Randomizer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')

    end

    function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
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
        while positions.positionsList['position'..index] ~= nil do
            randoClass = classes.randoclassList[index]      
            randoName = names.randonameList[index]
            randoPosition = positions.positionsList['position'..index]

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
        end
            --code for IceBlock puzzle in CAKC
            if puzzle == 'ice' then
                local ref = FindScriptObject('ScavIceBlock')
                ref.itemEncased = name
            end
            --code for Squirrel Acorn puzzle in CAGP
            if puzzle == 'squirrel' then
                local ref = FindScriptObject('ScavengerSquirrel')
                ref.acorn = name
            end
            --code for Two Geysers Skull puzzle in CAGP
            if puzzle == 'geyser' then
                local ref = FindScriptObject('geyser1')
                ref.itemPlugging = name
            end
            --code for Hornet Nest Fertility Idol puzzle in CARE
            if puzzle == 'hive' then
                local ref = FindScriptObject('ScavHornetNest')
                ref.huntItem = name
            end

            --code for Crow Bucket puzzle in ASCO
            if puzzle == 'bucket' then
                local ref = FindScriptObject('AS_Bucket')
                ref.randoitem = name
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
            --Rank101
            if puzzle == 'rank101' then
                local ref = FindScriptObject('RankUpPlacer')
                ref.randoRank101 = name
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

            --[[Black Velvetopia]]

            --BV After Wrestler Checks
            
            if puzzle == 'tiger' then
                local ref = FindScriptObject('BVItemPlacer')
                ref.tigerBeat = name
            end

            if puzzle == 'dragon' then
                local ref = FindScriptObject('BVItemPlacer')
                ref.dragonBeat = name
            end
            
            if puzzle == 'eagle' then
                local ref = FindScriptObject('BVItemPlacer')
                ref.eagleBeat = name
            end
            
            if puzzle == 'cobra' then
                local ref = FindScriptObject('BVItemPlacer')
                ref.cobraBeat = name
            end

            --[[CASA Level Done Checks]]
            if puzzle == 'bbDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.bbDone = name
            end
            if puzzle == 'saDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.saDone = name
            end
            if puzzle == 'miDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.miDone = name
            end
            if puzzle == 'niDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.niDone = name
            end
            if puzzle == 'loDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.loDone = name
            end
            if puzzle == 'mmDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.mmDone = name
            end
            if puzzle == 'thDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.thDone = name
            end
            if puzzle == 'wwDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.wwDone = name
            end
            if puzzle == 'bvDone' then
                local ref = FindScriptObject('LevelDonePlacer')
                ref.bvDone = name
            end
            if puzzle == 'llDone' then
                local ref = FindScriptObject('LLDoneItemPlacer')
                ref.llDone = name
            end

            --if more items need conditional changes, add code here

    
        
    end
   

    return Ob
end