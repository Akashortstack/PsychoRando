function APVaultHints(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        
    end

    function Ob:getFilePath()
        local seedsettings = fso('RandoSeed', 'Randoseed')
        --find the matching seed folder in ModData
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/VaultHints.txt"
        return filePath
    end

    function Ob:writeVaultHint(text)
        local h = fopen(self:getFilePath(), "a")
        -- Check if the file was opened successfully
        if h then
            -- Write to the file
            fwrite(h, (text.."\n"))
            -- Close the file
            fclose(h)
        else
            -- Handle the case where the file couldn't be opened
            GamePrint("Failed to open file for writing.")
        end
    end

    return Ob
end