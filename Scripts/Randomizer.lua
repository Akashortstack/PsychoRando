function Randomizer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')

    end

    function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
    end

    function Ob:stateRun()

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
            --foreach_entity_oftype('global.collectibles.OneUp', function(ent) ent:killSelf() end)
        else
            GamePrint("ERROR, FAILED TO FIND LEVEL TYPE")
        end

        if strfind(FindScriptObject('LevelScript').levelType, 'mental') then
            if strfind(FindScriptObject('LevelScript').Type, 'mm.MMI1') then
                foreach_entity_oftype('global.collectibles.PsiPower', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropSign', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropRollingPin', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropPlunger', function(ent) ent:killSelf() end)
                foreach_entity_oftype('mm.props.PropRifle', function(ent) ent:killSelf() end)
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


    --edit NEEDS WORK
    function Ob:addCollectibles()
        --gets current level name
        local level = (Global.levelScript:getLevelName())

        --[[ --edit need to iterate through every level name in the game, add elseif statements.

        --need to replace below
        with function that calls SpawnScript('Seed'), list of placeRandoObject for each item location in the level
        Ex. if level == 'CAKC' then
            local items = SpawnScript('Seed')
            items:placeObjectsCAKC
            
        ]]
        if level == 'CAKC' then
            placeRandoObject('global.props.PropSign', 'PropSign', -5629, 4510, -13242)
            GamePrint("Created PropSign")
        else
            GamePrint("Level not randomized, Nothing spawned")
        end
    end

    function placeRandoObject(class, name, x, y, z, ox, oy, oz)
        --check if item is RandoProp, if item has been collected don't spawn 
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
        
    end

    --[[edit Needs code to read Randomized TXT file, line by line
    repeat for each line, line1->lineX
    output class1, name1 ; class2, name2 etc.    

    ]]



    function Ob:placeListCAKC()
        placeRandoObject(class1, name1, -6797, 3365, -16380)
        placeRandoObject(class1, name1, -6662, 4834, -16859)
        placeRandoObject(class1, name1, -8613, 3409, -15159)
        placeRandoObject(class1, name1, -8245, 5489, -16566)
        placeRandoObject(class1, name1, -5629, 4510, -13242)
        placeRandoObject(class1, name1, -8250, 4672, -17194)
        placeRandoObject(class1, name1, -5826, 5921, -17086)
        placeRandoObject(class1, name1, -4437, 5240, -15717)
        placeRandoObject(class1, name1, -8241, 6295, -18064)
        placeRandoObject(class1, name1, -3861, 5656, -12938)
        placeRandoObject(class1, name1, -3621, 5509, -11089)
        placeRandoObject(class1, name1, -9914, 8434, -18209)
        placeRandoObject(class1, name1, -5282, 7580, -17131)
        placeRandoObject(class1, name1, -4885, 4255, -19145)


    end
   

    return Ob
end