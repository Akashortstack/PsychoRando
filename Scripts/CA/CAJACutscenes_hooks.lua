function CAJACutscenes_hooks(Ob)
    -- Used in CAJA after redeeming PsiCards for PsiChallengeMarkers
    local stateCleanupCSPsiMarkerConstruction_original = Ob.stateCleanupCSPsiMarkerConstruction
    function Ob:stateCleanupCSPsiMarkerConstruction()
        --Overwrite this to prevent tutorial popups
        Global:saveGlobal('HasRedeemedForMarker',0)
        GamePrint('HasReedemedForMarker Disabled') 
        %stateCleanupCSPsiMarkerConstruction_original(self)
    end
end