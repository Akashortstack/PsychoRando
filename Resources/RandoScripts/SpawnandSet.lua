

--testing complete function for spawning any item

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

        GamePrint("Created "..name)

    end
    
end

-- Order for function: (class, name, x, y, z, ox, oy, oz)
placeRandoObject('global.props.PropWaterCan', 'PropWaterCan', -6000, 4510, -13242)
placeRandoObject('global.collectibles.RandoPsiChallengeMarker', 'Marker1', -5629, 4510, -13242)


--*******************************************************--

--Legacy Functions for Spawning various items
function RandoBrainJarElton()
    local place = SpawnScript('global.collectibles.BrainJar', 'BrainJarElton');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end


function RandoPropWaterCan()
    if Global.player.stats.RandoProp['PropWaterCan'] == 'collected' then
        return nil
    else
    local place = SpawnScript('global.props.PropWaterCan', 'PropWaterCan');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    end
end


function RandoMarker()
    local place = SpawnScript('global.collectibles.RandoPsiChallengeMarker', 'Marker12');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    place:setPosition(place:getPosInFrontOf(0, 100))
end


function RandoVault()
    local place = SpawnScript('Global.Characters.Vault', 'Vault3');
    place:setPosition(-7873, 7000, -16267);
    place:setOrientation(0, 0, 0);
end


function RandoMaxAmmoUp()
    local place = SpawnScript('global.collectibles.RandoAmmoUp', 'Ammo1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end


function MediumArrowheadBundle()
    local place = SpawnScript('global.collectibles.MediumArrowheadBundle');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    GamePrint('Created MediumArrowheadBundle!')
end


function RandoMarksmanship()
    local place = SpawnScript('global.collectibles.Marksmanship');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    GamePrint('Created Marksmanship!')
end


function RandoCard()
    local place = SpawnScript('global.collectibles.RandoPsiCard', 'Card2');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end


function SpawnRandoSteamertrunkTag()
    local place = SpawnScript('global.collectibles.RandoSteamertrunkTag', 'Tag1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end

function SpawnRandoSteamertrunk()
    local place = SpawnScript('global.collectibles.RandoSteamertrunk', 'Bag1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    place:SetCollectRadius();  
end


function SpawnRandoScavBone()
    local place = SpawnScript('global.collectibles.ScavBone', 'ScavBone');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end


function SpawnRandoTelekinesis()
    local place = SpawnScript('global.collectibles.Telekinesis', 'Telekinesis1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end


function SpawnArrowheadBundleMedium()
    local place = SpawnScript('global.collectibles.ArrowheadBundleMedium', 'Medium1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end
