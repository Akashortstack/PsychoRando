--[[Level for choosing save file and starting new game]]

function CABU_hooks(Ob)

    local stateRazSleep_original = Ob.stateRazSleep
    function Ob:stateRazSleep()
        --speed up raz falling asleep
		DebugSetGameSpeed(1.7)
        %stateRazSleep_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --[[Skip everything from the Coach cutscene, send us straight into the CU]]
    function Ob:stateCoachCutscene()
        self:loadNewLevel('CASA')
    end

end