function DisplayVersion(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
    end

    Ob.modName = "PsychoRando"
    Ob.version = "v0.7.0-BETA"

    Ob.modNameHandle = nil
    Ob.modVersionHandle = nil

    function Ob:onBeginLevel()
        %Ob.Parent.onBeginLevel(self)
        self.modNameHandle = DisplayText(self.modName, 10, 30)
        self.modVersionHandle = DisplayText(self.version, 10, 60)
    end

    return Ob
end