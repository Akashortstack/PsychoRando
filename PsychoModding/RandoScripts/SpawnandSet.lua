--Functions for creating and placing New Objects in places they don't belong. 
--Ob.level = 'all' change for HeldObject.lua?
    --Allows objects to be used in levels where needed.

function RandoBrainJarElton()
    SpawnScript('global.collectibles.BrainJar', 'BrainJarElton')
    fso('BrainJarElton'):setPosition(16807, 9324, -26821)
    fso('BrainJarElton'):setOrientation(90, 0, 90)
end
RandoBrainJarElton()
--Spawns Elton's Brain Jar in Milkman's Fridge!
    
function RandoSign()
    SpawnScript('mm.props.PropSign', 'Sign', 'self.level = \'all\'')
    fso('Sign'):setPosition(-5629, 4510, -13242)
    fso('Sign'):setOrientation(0, 0, 0)
end
RandoSign()
--Spawns Sign understairs in cabins
    
function RandoCake()
    --'self.level = \'all\'' allows items to spawn in levels they don't belong
    SpawnScript('as.props.Cake', 'Cake', 'self.level = \'all\'')
    fso('Cake'):setPosition(16807, 9324, -26821)
    fso('Cake'):setOrientation(90, 0, 90)
end
RandoCake()
--Spawns Cake as.props.Cake in Milkman's Fridge

function RandoAllMMProps()
    function RandoSign()
        SpawnScript('mm.props.PropSign', 'Sign', 'self.level = \'all\'')
        fso('Sign'):setPosition(-5629, 4510, -13242)
        fso('Sign'):setOrientation(0, 0, 0)
    end
    RandoSign()
    
    function RandoRollingPin()
        SpawnScript('mm.props.PropRollingPin', 'RollingPin', 'self.level = \'all\'')
        fso('RollingPin'):setPosition(-5629, 4510, -13242)
        fso('RollingPin'):setOrientation(0, 0, 0)
    end
    RandoRollingPin()

    function RandoPlunger()
    SpawnScript('mm.props.PropPlunger', 'Plunger', 'self.level = \'all\'')
        fso('Plunger'):setPosition(-5629, 4510, -13242)
        fso('Plunger'):setOrientation(0, 0, 0)
    end
    RandoPlunger()

    function RandoRifle()
        SpawnScript('mm.props.PropRifle', 'Rifle', 'self.level = \'all\'')
        fso('Rifle'):setPosition(-5629, 4510, -13242)
        fso('Rifle'):setOrientation(0, 0, 0)
    end
    RandoRifle()

    function RandoWaterCan()
        SpawnScript('mm.props.PropWaterCan', 'WaterCan', 'self.level = \'all\'')
        fso('WaterCan'):setPosition(-5629, 4510, -13242)
        fso('WaterCan'):setOrientation(0, 0, 0)
    end
    RandoWaterCan()

    function RandoHedgeTrimmers()
        SpawnScript('mm.props.PropHedgeTrimmers', 'HedgeTrimmers', 'self.level = \'all\'')
        fso('HedgeTrimmers'):setPosition(-5629, 4510, -13242)
        fso('HedgeTrimmers'):setOrientation(0, 0, 0)
    end
    RandoHedgeTrimmers()
    
    function RandoFlowers()
        SpawnScript('mm.props.PropFlowers', 'Flowers', 'self.level = \'all\'')
        fso('Flowers'):setPosition(-5629, 4510, -13242)
        fso('Flowers'):setOrientation(0, 0, 0)
    end
    RandoFlowers()
end
RandoAllMMProps()
--Spawns ALL 7 MM Props in location under stairs
    

function RandoSuitcaseTag()
    local tag = SpawnScript('global.collectibles.SuitcaseTagUniversal', 'SuitcaseTagUniversal');
    tag:setPosition(-5629, 4510, -13242);
    tag:setOrientation(0, 0, 0);
    tag:beNotPickupable();
	tag:bePickupable();
    GamePrint('Created Suitcase Tag!')
end

function RandoSuitcase()
    local tag = SpawnScript('global.collectibles.SuitcaseUniversal', 'SuitcaseUniversal');
    tag:setPosition(-5629, 4510, -13242);
    tag:setOrientation(0, 0, 0);
    tag:SetCollectRadius();
    GamePrint('Created Suitcase!')
end

RandoSuitcaseTag()
RandoSuitcase()

--Code for spawning custom suitcase and suitcase tag under stairs in CA