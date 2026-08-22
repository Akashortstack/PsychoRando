function DisplayVersion(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    Ob.modName = "PsychoRando"
    Ob.version = "v2.1.0"
    --*******************************************************************
    --IMPORTANT!!! MUST MATCH APWORLD VERSION PASSED IN RANDOSEED.LUA!!!
    --DON'T FORGET TO UPDATE!!!
    Ob.apworldExpectedVersion = "1.0.0"
    --*******************************************************************

    Ob.modNameHandle = nil
    Ob.modVersionHandle = nil
    Ob.modSeedHandle = nil

    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        self.modNameHandle = DisplayText(self.modName, 10, 30)
        self.modVersionHandle = DisplayText(self.version, 10, 60)
        --find seed name info
        local seedsettings = fso('RandoSeed', 'Randoseed')
        self.modSeedHandle = DisplayText(seedsettings.seedname, 10, 470)

        -- compare the apworld version in seed versus expected version
        if seedsettings.apworldVersion ~= self.apworldExpectedVersion then
            DisplayText("RandoSeed version and Mod version not compatible!!!", 10, 100, 1.6, 1.6, 4, 0, 0, 255, 0, 0)
            DisplayText("Please Update!!!", 10, 390, 1.6, 1.6, 4, 0, 0, 255, 0, 0)
        end

    end

    return Ob
end