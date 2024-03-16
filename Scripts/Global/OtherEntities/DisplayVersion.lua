function DisplayVersion(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    Ob.modName = "PsychoRando"
    Ob.version = "v1.3.0-AP-Test-Build"

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

    end

    return Ob
end