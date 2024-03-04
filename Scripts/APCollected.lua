
function APCollected(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        
    end

    --Prints item collected in RandoSeed.lua table formatting
    function Ob:writeCollectedItem(name)
        --get shuffled item table
        local referencelist = fso('ShuffleItems', 'ShuffleItems')
        local shufflednameslist = referencelist.randonameList
        --check the table for matching name, write its index
        for k, v in shufflednameslist do
            if name == v then
                --write to text file for storage
                local h = fopen("ItemsCollected.txt", "a")
                fwrite(h, (k.."\n"))
                fclose(h)
                return
            end
        end
    end

    return Ob
end