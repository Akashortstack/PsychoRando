
--Script that handles placing item in CABH after LLLL is complete

function LLDoneItemPlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for BV after wrestler checks
		Ob.llDone = nil
    end

	-- Checks if level beaten, hides appropriate rando item if item still exists
	function Ob:checkItem()
        local reward = FindScriptObject(self.llDone)

        --hide first
        if reward ~= nil then
            reward:hide()
        end

        --reveal if level defeated
        if (Global:loadGlobal('bLLCompleted') == 1) and reward ~= nil then
            reward:show()
        end
	end

    return Ob
end