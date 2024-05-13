
function APCollected(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        
    end

    --Prints item collected in RandoSeed.lua table formatting
    function Ob:writeCollectedItem(name)
        --get shuffled item table
		local seedsettings = fso('RandoSeed', 'Randoseed')
        local referencelist = fso('ShuffleItems', 'ShuffleItems')
        local shufflednameslist = referencelist.randonameList

        --find the matching seed folder in ModData
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/ItemsCollected.txt"
        --check the table for matching name, write its index
        for k, v in shufflednameslist do
            if name == v then
                --write to text file for storage
                local h = fopen(filePath, "a")
                -- Check if the file was opened successfully
                if h then
                    -- Write to the file
                    fwrite(h, (k.."\n"))
                    -- Close the file
                    fclose(h)
                else
                    -- Handle the case where the file couldn't be opened
                    GamePrint("Failed to open file for writing.")
                end
                return
            end
        end
    end

    return Ob
end