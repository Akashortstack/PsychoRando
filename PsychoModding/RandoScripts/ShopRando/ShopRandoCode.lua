
--Function sends list of items to FordShopController (currently vanilla script) then resets items in the shop.
--Need to adjust current code to put items in shop based on randomization method. 


function RandoShop()
    local set = fso('FordShopController')
    set.tItems[1] = FindScriptObject('CobwebDuster')
    set.tItems[2] = FindScriptObject('PSIBallColor')
    set.tItems[3] = FindScriptObject('Peasant1Item')
    set.tItems[4] = FindScriptObject('DreamFluff')
    set.tItems[5] = FindScriptObject('PSIChallengeCore')
    set.tItems[6] = FindScriptObject('DowsingRod')
    set:RandoShopSetup()
end

RandoShop()