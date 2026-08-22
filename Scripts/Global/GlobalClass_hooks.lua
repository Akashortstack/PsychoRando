function GlobalClass_hooks(Ob)
    local setLevelToCompleted_original = Ob.setLevelToCompleted

    function Ob:setLevelToCompleted(levelPrefix)
        --Forces Levels to not be flagged as completed unless currently in that level.
        --Vanilla game tries to retroactively complete every level before the current one
        GamePrint(Global.levelScript:getLevelPrefix())
        if levelPrefix ~= Global.levelScript:getLevelPrefix() then
            GamePrint("STOPPED LEVEL COMPLETION FOR "..levelPrefix)
            return
        else
            %setLevelToCompleted_original(self)
        end
    end

    --[[FULL FUNCTION OVERRIDE]]
    --prevents collection achievements from ever being checked.
    --prevents a bug when getting 100% figments in a level and ranking up at the same time
    function Ob:CheckCollectionAchievement(key)

    end

end