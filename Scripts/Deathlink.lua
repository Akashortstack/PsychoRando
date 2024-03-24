
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
        --TODO make WaterCurse trigger Deathlink
            --WaterCurse has multiple scripts
        --self.waterCurse = FindScriptObject('WaterCurse')
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

        --read from DeathlinkIn.txt for deathlinks sent by client
        local h = fopen("DeathlinkIn.txt", "r")

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
        local h = fopen("DeathlinkIn.txt", "w")
        fwrite(h, (""))
        fclose(h)
        self:setState('SendDeaths')
    end

    function Ob:stateSendDeaths()
        while self.deathCount >= 1 do
            GamePrint('Deathlink Incoming! Make Raz Die!')
            Global.player:setState('DartDie')
            --wait for another death
            self:sleep(4.8)
            self.deathCount = self.deathCount - 1
        end
        self:setState('CheckforDeath')
    end


    function Ob:listenerDartDie()
        --write to text file for storage
        local h = fopen("DeathlinkOut.txt", "w")
        if self.deathCount == 0 then
            fwrite(h, ("Raz Died! Send Deathlink!\n"))
            GamePrint("Raz Died! Send Deathlink!")
        end
        fclose(h)
    end

    function Ob:triggerDeathlink()
        --write to text file for storage
        local h = fopen("DeathlinkOut.txt", "w")
        if self.deathCount == 0 then
            fwrite(h, ("Raz Died! Send Deathlink!\n"))
            GamePrint("Raz Died! Send Deathlink!")
        end
        fclose(h)
    end

    return Ob
end