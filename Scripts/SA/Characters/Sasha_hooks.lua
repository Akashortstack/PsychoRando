function Sasha_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --[[Vanilla game checks if CALevelState == 7 and makes Sasha invisible if true
        because CALevelState is ALWAYS 7, make him visible again so he's actually there for tutorial etc.]]
        self:makeVisible()
        --Should we make him invisible if the level is completed? Maybe...
    end

end