function THMS_hooks(Ob)

    local onPostBeginLevel_original = Ob.onPostBeginLevel

    function Ob:onPostBeginLevel()
        --[[need to spawn a candle if TH completed
        'DaySwitch' looks for the candle and attaches it to the lamp
        Randomizer already removes the vanilla candle before this, so we need a new one]]
        if (Global:loadGlobal('bTHCompleted') == 1) then
            local candle = SpawnScript('TH.Props.Candle', 'Candle')
        end
        %onPostBeginLevel_original(self)
    end
end