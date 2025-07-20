function ShuffleItems(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        Ob.randoclassList = {}
        Ob.randonameList = {}

    end

    --[[ function that randomizes all checks in the game, keeping class paired with name
    Ex. item 1 in oldclassTable always pairs with item 1 in oldnameTable
    ]]
    function Ob:randomizeChecks(itemTables)
        local oldclassTable = itemTables.classTable
        local oldnameTable = itemTables.nameTable

        local newclassTable = {}

        local newnameTable = {}

        --get RandoSeed numbers table
        local CurrentSeed = fso('RandoSeed', 'RandoSeed')
        local randolist = CurrentSeed.seed

        --get total number of items in randolist
        local n = getn(randolist)
        GamePrint('Length of Seed Table = '..n)

        --pairing loop, uses value from RandoSeed to find index in oldclassTable and arrange items in order
        --sent to Randomizer.lua to pair with the positions list
        for i = 1, n do
            local j = randolist[i]
            newclassTable[i] = oldclassTable[j]
            newnameTable[i] = oldnameTable[j]
        end
        --write results to new tables
        self.randoclassList = newclassTable
        self.randonameList = newnameTable
       
    end
        
    return Ob
end