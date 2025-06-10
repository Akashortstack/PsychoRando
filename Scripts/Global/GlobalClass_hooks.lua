function GlobalClass_hooks(Ob)
    local setLevelToCompleted_original = Ob.setLevelToCompleted

    function Ob:setLevelToCompleted(levelPrefix)
        --edit Force Levels to not be marked completed unless in that level.
        GamePrint(Global.levelScript:getLevelPrefix())
        if levelPrefix ~= Global.levelScript:getLevelPrefix() then
            GamePrint("STOPPED LEVEL COMPLETION FOR "..levelPrefix)
            return
        else
            %setLevelToCompleted_original(self)
        end
    end
end