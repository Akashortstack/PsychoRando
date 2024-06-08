function APReceiver(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --used in apTableFill
        Ob.randoclassList = {}
        Ob.randonameList = {}
        Ob.allowDuplicatesClassesSet = {}
        --used in checkReceivedList()
        Ob.numbersTable = {}
    end

    --used to avoid max lua variable limitations
    function Ob:apTableFill()
        local itemTables = fso('RandoItemTables', 'RandoItemTables')
        local classTable = itemTables.classTable
        local nameTable = itemTables.nameTable

        -- Classes where unlimited copies (the integer limits should never be reached) can be received from AP, even if
        -- AP sends more than were placed in the multiworld. In some cases, receiving more than a certain number will
        -- have no effect, but the items will still be received.
        -- When receiving any other class of item via AP server cheat command, if there is a locally placed item with
        -- the same name, that locally placed item should be collected instead. But, if the matching locally placed item
        -- has already been collected, then the received item will be ignored.
        local allowDuplicatesClasses = {
            'global.collectibles.Marksmanship',
            'global.collectibles.Firestarting',
            'global.collectibles.Confusion',
            'global.collectibles.Levitation',
            'global.collectibles.Telekinesis',
            'global.collectibles.Invisibility',
            'global.collectibles.Clairvoyance',
            'global.collectibles.Shield',
            'Global.Collectibles.RandoAmmoUp',
            'Global.Collectibles.RandoLivesUp',
            'Global.Collectibles.RandoConfusionUp',
            'global.collectibles.RandoPsiChallengeMarker',
            'global.collectibles.RandoSuitcaseTag',
            'global.collectibles.RandoPurseTag',
            'global.collectibles.RandoHatboxTag',
            'global.collectibles.RandoSteamertrunkTag',
            'global.collectibles.RandoDufflebagTag',
            'Global.Characters.Vault',
            'global.collectibles.ArrowheadBundleSmall',
            'global.collectibles.ArrowheadBundleMedium',
            'global.collectibles.RandoPsiCard',
        }
        -- Convert the list into a dictionary that will be treated like a set.
        local allowDuplicatesClassesSet = {}
        for k, v in allowDuplicatesClasses do
            allowDuplicatesClassesSet[v] = TRUE
        end

        --write results to new tables
        self.randoclassList = classTable
        self.randonameList = nameTable
        self.allowDuplicatesClassesSet = allowDuplicatesClassesSet

        --[[Print the index and value of each number in the table
        for k, v in self.randoclassList do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end

        --Print the index and value of each number in the table
        for k, v in self.randonameList do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end]]
    end

    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        --fill tables
        self:apTableFill()
        --check to make sure we're not in the opening menu or creating a new profile
        local level = (Global.levelScript:getLevelName())
        if level ~= 'CABU' and level ~= 'STMU' then
            --start looping to check for items from ItemsReceived.txt
            self:setState('CompareAPTable')
        end
    end

    function Ob:stateCompareAPTable()
        --wait so function isn't called constantly
        self:sleep(1.0)
        --update self.numbersTable
        self:checkReceivedList()
        --check if any items need to be given to player
        self:setState('CheckSendToPlayer')
    end

    function Ob:checkReceivedList()
        -- Create an empty table to store numbers
        self.numbersTable = {}

        --find the matching seed folder in ModData
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/ItemsReceived.txt"

        --read from ItemsReceived.txt for items sent by AP Client
        local h = fopen(filePath, "r")

        -- function to fill table with numbers from ItemsReceived.txt
        local checkstuff = TRUE
        while checkstuff == TRUE do
            --Read a single line from the file (Lua 4 uses "*l" to read a line)
            local line = fread(h, "*l")
            --stop if line is blank
            if line == nil then
                break
            else
                --add number to table 
                tinsert(self.numbersTable, line)        
            end
        end

        --Print the index and value of each number in the table
        --[[for k, v in self.numbersTable do
            if k ~= 'n' then
                GamePrint(k..", "..v)
            end
        end
        ]]

        -- Close the file
        fclose(h)
        
    end

    function Ob:stateCheckSendToPlayer()
        -- loops through self.numbersTable to send items to player

        -- Index of the last item that was received from AP.
        local lastApIndex = Global.player.stats.APLastIndex

        -- Special handling for Gloria's Theater candles to ensure that, if multiple non-local candles are received,
        -- they cause both available candles to be received and no more.
        local nonLocalCandlesReceived = 0
        -- If an item in the sequence gets skipped somehow, only print the warning once per iteration of
        -- `self.numbersTable`.
        local printedDesyncWarning = FALSE
        --used for debugging AP issues
        --GamePrint("Current num received items: " .. lastApIndex)
    
        local numbersTable = self.numbersTable
        for i = 1, getn(numbersTable) do
            line = numbersTable[i]
            --split the line "apIndex,index,isNonLocal" into its parts
            local split = {}
            -- Match groups of characters that are not ",". For each matched group, call a function to insert
            -- the matched group into `split`.
            gsub(line, "([^,]+)", function(c) tinsert(%split, c) end)
            --convert the values to numbers
            local apIndex = tonumber(split[1])
            local index = tonumber(split[2])
            -- The item has been received from the multiworld and was not placed locally.
            local isNonLocal = split[3] == "1"

            -- Only receive the item if it's the next one in the sequence.
            if apIndex == (lastApIndex + 1) then
                -- match the value with the index of class and name from rando tables
                local apClass = self.randoclassList[index]
                local apName = self.randonameList[index]

                -- Some items can have multiple copies that never cause locally placed items of the same class to be
                -- collected.
                local isNonLocalCopy = isNonLocal and self.allowDuplicatesClassesSet[apClass]

                -- Gloria's Theater candles are unique in that 2 can be received, but no more, so special handling
                -- is required.
                if isNonLocal and apClass == 'global.props.Candle' then
                    -- Locally placed items with duplicates are placed starting from their first available ID, so
                    -- if only 1 candle is placed locally, it is guaranteed to be 'Candle1'.
                    -- We don't rely on checking only `Global.player.stats.APItem['Candle2'] ~= 'collected'` because
                    -- if two non-local candles are received in quick succession, it's possible that the first
                    -- candle won't have been collected by the time the second candle is received.
                    if nonLocalCandlesReceived == 0 and Global.player.stats.APItem['Candle2'] ~= 'collected' then
                        apName = 'Candle2'
                        nonLocalCandlesReceived = 1
                    else
                        -- 'Candle2' has been received already, so if there is a remaining non-local candle it must
                        -- be 'Candle1'. If extra candles are received, they will do nothing because 'Candle1' will
                        -- already have been collected.
                        apName = 'Candle1'
                        nonLocalCandlesReceived = 2
                    end
                end

                if isNonLocalCopy then
                    -- Prefix name with '_' so that it is easy to tell that the item is a non-local copy and so that
                    -- it is easy to recover the real name if needed.
                    apName = '_' .. apName
                end

                -- Ignore baggage, because those are always collected locally.
                if apClass ~= 'global.collectibles.RandoSuitcase' and apClass ~= 'global.collectibles.RandoPurse' and apClass ~= 'global.collectibles.RandoHatbox' and apClass ~= 'global.collectibles.RandoSteamertrunk' and apClass ~= 'global.collectibles.RandoDufflebag' then
                    -- If the item is not a non-local copy, check player save data and skip if the item has already
                    -- been collected.
                    if isNonLocalCopy or Global.player.stats.APItem[apName] ~= 'collected' then
                        -- send the item to the player
                        self:getRandoItem(apClass, apName, isNonLocalCopy)
                        -- pause so they don't all spawn at once
                        self:sleep(1.2)
                    end
                end

                -- Update the index of the last received item.
                lastApIndex = apIndex
                Global.player.stats.APLastIndex = apIndex

            elseif apIndex > lastApIndex and not printedDesyncWarning then
                -- The client handles resyncing with AP if it receives items out of order.
                -- The lines in ItemsReceived.txt being out of order shouldn't happen, but just in-case they can in
                -- the future, we won't break the loop here and will instead continue looking for the correct next
                -- item.
                GamePrint("Warning: Possible desync. The next AP Index was expected to be " .. (lastApIndex + 1) ..
                          ", but was actually " .. apIndex)
                printedDesyncWarning = TRUE
            end
        end
        self:setState('CompareAPTable')

    end

    --Gives item to player
    function Ob:getRandoItem(class, name, isNonLocalCopy)
        -- check if the item currently exists
        local sentitem = nil
        -- The extra `1` argument seems to tell the game to not print a stacktrace when the object doesn't exist.
        local existing_item = FindScriptObject(name, 1)
        if (not existing_item) then
            -- item doesn't exist, spawn a new one
            sentitem = SpawnScript(class, name)
        elseif isNonLocalCopy then
            -- If multiple non-local items of the same type are spawned in a row, sometimes the previous one won't be
            -- dead before we want to spawn another one, e.g. PSI Challenge Markers, so append a number to the end of
            -- the name to make it unique.
            -- None of the non-local copies of items use their name for anything, other than being marked as a non-local
            -- copy by starting with "_", so modifying the name by appending to it is fine.
            local i = 1
            local orig_name = name
            repeat
                name = orig_name .. "_" .. tostring(i)
                i = i + 1
            until(FindScriptObject(name, 1) == nil)

            sentitem = SpawnScript(class, name)
        else
            -- item exists, move it onto the player    
            sentitem = existing_item
            --make sure item isn't hidden
            sentitem:show()
        end

        --break open brain jars and vaults automatically
        if class == 'global.collectibles.BrainJar' or class == 'Global.Characters.Vault' then
            sentitem:setPosition(0, -100000, 0)
            sentitem:onNewMoveMelee()           
        else
            --set item position on top of player, instantly collected
            local dart = fso('Dart')
            local x, y, z = dart:getPosition()
            sentitem:setPosition(x, y, z)
        end
        
    end

    return Ob
end