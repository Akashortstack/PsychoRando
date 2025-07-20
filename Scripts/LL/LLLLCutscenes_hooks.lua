function LLLLCutscenes_hooks(Ob)

    local stateCleanupCSGoToPhase2_original = Ob.stateCleanupCSGoToPhase2
    function Ob:stateCleanupCSGoToPhase2()
        %stateCleanupCSGoToPhase2_original(self)
        --need to match the QOL speed increase, original ( self.lungfish.bubble, 1)
		SplineSpeedRel(self.lungfish.bubble, self.lungfish.bubble.splineSpeed)
    end

end