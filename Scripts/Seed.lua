function Seed(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        Ob.checks_list = { 
            item1 = {
                class = 'global.props.AS_Painting', 
                name = 'LobatoPainting',
                levelName = 'CAKC',
                x = -5629, 
                y = 4510, 
                z = -13242,
                ox = 0,
                oy = 0,
                oz = 0,
            },
            item2 = {
                class = 'global.collectibles.RandoSuitcase',
                name = 'Suitcase3',
                levelName = 'CAKC',
                x = -6000, 
                y = 4510, 
                z = -13242,
                ox = 0,
                oy = 0,
                oz = 0,
            },
        }
        Ob.position_list = { }
       

    end


    --function that places
    function Ob:placeCollectibles()
        local level = (Global.levelScript:getLevelName())
        local rando = fso('Randomizer')
        local index = 1 
        local check 
        while self.checks_list['item'..index] ~= nil do        
            check = self.checks_list['item'..index]
            if check.levelName ~= level then 
                return
            else
                
                rando:placeRandoObject(check.class, check.name, check.x, check.y, check.z, check.ox, check.oy, check.oz)
            end
            index = index+1
        end
    end

    --[[function Ob:placeRandoObject(class, name, x, y, z, ox, oy, oz)
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