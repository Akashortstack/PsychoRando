function ASRU_hooks(Ob)
    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --This flag prevents Raz from using Bacon to return to Ford's Sanctuary
        --Setting the value back to 0 makes the Bacon usable again
        Global:saveGlobal('bFordReturnToCAJADisabled', 0)
    end

end