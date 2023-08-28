
--[[Script that handles placing special, condition based items in BV]]


function BVItemPlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for BV after wrestler checks
		Ob.tigerBeat = nil
		Ob.eagleBeat = nil
		Ob.dragonBeat = nil
		Ob.cobraBeat = nil
    end

	-- Checks all wrestler beaten, hides appropriate rando items if item still exists
	function Ob:wrestlerChecks()
        local tiger = FindScriptObject(self.tigerBeat)
        local eagle = FindScriptObject(self.eagleBeat)
        local dragon = FindScriptObject(self.dragonBeat)
        local cobra = FindScriptObject(self.cobraBeat)

        --hide them all first
        if tiger ~= nil then
            tiger:hide()
        end
        if eagle ~= nil then
            eagle:hide()
        end
        if dragon ~= nil then
            dragon:hide()
            GamePrint("Dragon Hidden")
        end
        if cobra ~= nil then
            cobra:hide()
        end

        if (Global:load('tigerDefeated') == 1) and tiger ~= nil then
            tiger:show()
        end
        if (Global:load('eagleDefeated') == 1) and eagle ~= nil then
            eagle:show()
        end
        if (Global:load('dragonDefeated') == 1) and dragon ~= nil then
            dragon:show()
            GamePrint("Dragon Show")
        end
        if (Global:load('cobraDefeated') == 1) and cobra ~= nil then
            cobra:show()
        end
	end

    return Ob
end