--[[Functions for Spawning various items
--IF the item is Global.Props, requires following code before SpawnScript

if Global.player.stats.RandoProp['name'] == 'collected' then
    return nil
else

]]


function RandoBrainJarElton()
    local place = SpawnScript('global.collectibles.BrainJar', 'BrainJarElton');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end
RandoBrainJarElton()

function RandoPropWaterCan()
    if Global.player.stats.RandoProp['PropWaterCan'] == 'collected' then
        return nil
    else
    local place = SpawnScript('global.props.PropWaterCan', 'PropWaterCan');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    end
end
RandoPropWaterCan()


function RandoMarker()
    local place = SpawnScript('global.collectibles.RandoPsiChallengeMarker', 'Marker12');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    place:setPosition(place:getPosInFrontOf(0, 100))
end

RandoMarker()

function RandoVault()
    local place = SpawnScript('Global.Characters.Vault', 'Vault3');
    place:setPosition(-7873, 7000, -16267);
    place:setOrientation(0, 0, 0);
end

RandoVault()

function RandoMaxAmmoUp()
    local place = SpawnScript('global.collectibles.RandoAmmoUp', 'Ammo1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end

RandoMaxAmmoUp()

function MediumArrowheadBundle()
    local place = SpawnScript('global.collectibles.MediumArrowheadBundle');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    GamePrint('Created MediumArrowheadBundle!')
end

MediumArrowheadBundle()

function RandoMarksmanship()
    local place = SpawnScript('global.collectibles.Marksmanship');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
    GamePrint('Created Marksmanship!')
end

RandoMarksmanship()


function RandoCard()
    local place = SpawnScript('global.collectibles.RandoPsiCard', 'Card2');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end

RandoCard()

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
SpawnRandoSteamertrunkTag()
SpawnRandoSteamertrunk()

function SpawnRandoScavBone()
    local place = SpawnScript('global.collectibles.ScavBone', 'ScavBone');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end
SpawnRandoScavBone()

function SpawnRandoTelekinesis()
    local place = SpawnScript('global.collectibles.Telekinesis', 'Telekinesis1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end

SpawnRandoTelekinesis()

function SpawnArrowheadBundleMedium()
    local place = SpawnScript('global.collectibles.ArrowheadBundleMedium', 'Medium1');
    place:setPosition(-5629, 4510, -13242);
    place:setOrientation(0, 0, 0);
end

SpawnArrowheadBundleMedium()