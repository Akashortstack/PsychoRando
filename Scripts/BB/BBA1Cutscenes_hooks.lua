function BBA1Cutscenes_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --Remove this function completely, no more EmoBaggage cutscene
    function Ob:stateCleanupCSEmoBagCollection()
        return
    end
end