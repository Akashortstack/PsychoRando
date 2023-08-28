function CollectibleRemover(Ob)
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

        
        elseif strfind(FindScriptObject('LevelScript').Type, 'as.ASGR') then
                foreach_entity_oftype('as.props.AS_hand', function(ent) ent:killSelf() end)
                foreach_entity_oftype('as.props.LilisBracelet', function(ent) ent:killSelf() end)
        elseif strfind(FindScriptObject('LevelScript').Type, 'as.ASCO') then
                foreach_entity_oftype('as.props.AS_StraightJacket', function(ent) ent:killSelf() end)
                foreach_entity_oftype('as.props.AS_Painting', function(ent) ent:killSelf() end)
        elseif strfind(FindScriptObject('LevelScript').Type, 'as.ASLB') then
                foreach_entity_oftype('as.props.Cake', function(ent) ent:killSelf() end)
                --foreach_entity_oftype('as.props.PokeyProp', function(ent) ent:killSelf() end)
        
        else
            GamePrint("WARNING, LEVEL NAME NOT LISTED")
        end
    end
    
    return Ob
end