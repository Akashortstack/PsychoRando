
function Deathlink(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --used to track deaths in and out
        Ob.deathCount = 0
    end

    function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self) 
        --register with Dart to check when Raz dies
        Global.player:addSpamListener('DartDie', self)
    end

    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        local level = (Global.levelScript:getLevelName())
        --check to make sure we're not in the opening menu or creating a new profile
        if level ~= 'CABU' and level ~= 'STMU' then
            --start looping to check for incoming deathlinks
            self:setState('CheckforDeath')
        end
    end

    function Ob:stateCheckforDeath()
        --wait so function isn't called constantly
        self:sleep(1.0)

        --find the matching seed folder in ModData
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local folderName = seedsettings.APfoldername
        self.DeathlinkInfilePath = folderName.."/DeathlinkIn.txt"
        --read from DeathlinkIn.txt for deathlinks sent by client
        local h = fopen(self.DeathlinkInfilePath, "r")

        -- function to check for incoming deaths
        local checkstuff = TRUE
        while checkstuff == TRUE do
            --Read a single line from the file (Lua 4 uses "*l" to read a line)
            local line = fread(h, "*l")
            --stop if line is blank
            if line == nil then
                break
            else
                --add death to count 
                self.deathCount = self.deathCount + 1     
            end
        end
        fclose(h)

        --clear the file 
        local h = fopen(self.DeathlinkInfilePath, "w")
        fwrite(h, (""))
        fclose(h)
        self:setState('SendDeaths')
    end

    function Ob:stateSendDeaths()
        while self.deathCount >= 1 do
            GamePrint('Deathlink Incoming! Make Raz Die!')
            -- If you have a dream fluff, use that instead
            local fluffs = Global:loadGlobal('DreamFluffsInInv') or 0 
            if fluffs > 0 then
                -- Find a dream fluff
                local fluff
                for k, v in Global.saved.Inventory['all'] do
                    if v.Type == 'global.collectibles.DreamFluff' then
                        fluff = FindScriptObject(k)
                    end
                end
                if not fluff then
                    GamePrint('ERROR: DreamFluffsInInv is greater than 0, but Raz has no fluffs!')
                else
                    fluff:setState('UsePolitely')
                end
                self:sleep(3.0)
            else
                Global.player:setState('DartDie')
                --wait for another death
                self:sleep(4.8)
            end
            self.deathCount = self.deathCount - 1
        end
        self:setState('CheckforDeath')
    end


    function Ob:listenerDartDie()
        --find the matching seed folder in ModData
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local folderName = seedsettings.APfoldername
        self.DeathlinkOutfilePath = folderName.."/DeathlinkOut.txt"

        --write to text file for storage
        local h = fopen(self.DeathlinkOutfilePath, "w")
        if self.deathCount == 0 then
            fwrite(h, ("Raz Died! Send Deathlink!\n"))
            GamePrint("Raz Died! Send Deathlink!")
        end
        fclose(h)
    end

    function Ob:triggerDeathlink()
        --find the matching seed folder in ModData
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local folderName = seedsettings.APfoldername
        self.DeathlinkOutfilePath = folderName.."/DeathlinkOut.txt"

        --write to text file for storage
        local h = fopen(self.DeathlinkOutfilePath, "w")
        if self.deathCount == 0 then
            fwrite(h, ("Raz Died! Send Deathlink!\n"))
            GamePrint("Raz Died! Send Deathlink!")
        end
        fclose(h)
    end

    return Ob
end