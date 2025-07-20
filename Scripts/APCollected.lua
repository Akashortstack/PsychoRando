
function APCollected(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        
    end

    function Ob:getFilePath()
        local seedsettings = fso('RandoSeed', 'Randoseed')
        --find the matching seed folder in ModData
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/ItemsCollected.txt"
        return filePath
    end

    function Ob:writeCollectedLocation(location_id)
        local h = fopen(self:getFilePath(), "a")
        -- Check if the file was opened successfully
        if h then
            -- Write to the file
            fwrite(h, (location_id.."\n"))
            -- Close the file
            fclose(h)
        else
            -- Handle the case where the file couldn't be opened
            GamePrint("Failed to open file for writing.")
        end
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
                self:writeCollectedLocation(k)
                return
            end
        end
    end

    return Ob
end