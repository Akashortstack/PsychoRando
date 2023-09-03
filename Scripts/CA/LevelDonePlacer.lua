function LevelDonePlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for Finishing Levels
		Ob.bbDone = nil
		Ob.saDone = nil
		Ob.miDone = nil
        Ob.niDone = nil
		Ob.loDone = nil
		Ob.mmDone = nil
		Ob.thDone = nil
		Ob.wwDone = nil
		Ob.bvDone = nil
		
        function Ob:levelsDone()
            local BB = FindScriptObject(self.bbDone)
            local SA = FindScriptObject(self.saDone)
            local MI = FindScriptObject(self.miDone)
            local NI = FindScriptObject(self.niDone)
            local LO = FindScriptObject(self.loDone)
            local MM = FindScriptObject(self.mmDone)
            local TH = FindScriptObject(self.thDone)
            local WW = FindScriptObject(self.wwDone)
            local BV = FindScriptObject(self.bvDone)

            --hide them all first
            if BB ~= nil then
                BB:hide()
            end
            if SA ~= nil then
                SA:hide()
            end
            if MI ~= nil then
                MI:hide()
            end
            if NI ~= nil then
                NI:hide()
            end
            if LO ~= nil then
                LO:hide()
            end
            if MM ~= nil then
                MM:hide()
            end
            if TH ~= nil then
                TH:hide()
            end
            if WW ~= nil then
                WW:hide()
            end
            if BV ~= nil then
                BV:hide()
            end
    
            --reveal if level completed
            if (Global:loadGlobal('bBBCompleted') == 1) and BB ~= nil then
                BB:show()
            end
            if (Global:loadGlobal('bSACompleted') == 1) and SA ~= nil then
                SA:show()
            end
            if (Global:loadGlobal('bMICompleted') == 1) and MI ~= nil then
                MI:show()
            end
            if (Global:loadGlobal('bNICompleted') == 1) and NI ~= nil then
                NI:show()
            end
            if (Global:loadGlobal('bLOCompleted') == 1) and LO ~= nil then
                LO:show()
            end
            if (Global:loadGlobal('bMMCompleted') == 1) and MM ~= nil then
                MM:show()
            end
            if (Global:loadGlobal('bTHCompleted') == 1) and TH ~= nil then
                TH:show()
            end
            if (Global:loadGlobal('bWWCompleted') == 1) and WW ~= nil then
                WW:show()
            end
            if (Global:loadGlobal('bBVCompleted') == 1) and BV ~= nil then
                BV:show()
            end
        end
        return Ob
    end
end