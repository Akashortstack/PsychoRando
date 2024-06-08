-- This file replaces the vanilla MegaArrowhead.lua with a custom version with shorter respawn time and optional
-- Archipelago location check.

deepArrowheadRespawnTimeSeconds = 1800 -- 30 minutes. This is the vanilla respawn time.

function MegaArrowhead(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')

        Ob.value = 50
        Ob.meshName = 'GlobalModels/CO_Collectibles/co_arrowheadnew.plb'
        Ob.dependencies = {
            scripts = {
                -- Effects played during collection
                'Global.Effects.MegaAHCollectionFX',
                'Global.Effects.AHCollectionFX',
            }
        }
    end

    function Ob:getSaveName()
        return self.Name .. Global.levelScript:getLevelName()
    end

    function Ob:getRespawnTime()
        -- Will be `nil` when this deep arrowhead has never been collected.
        return Global:load(self:getSaveName())
    end

    function Ob:setRespawnTime(seconds)
        if seconds == nil then
            seconds = deepArrowheadRespawnTimeSeconds
        end
        Global:save(self:getSaveName(), seconds + GetGameTimeSecs())
    end

    function Ob:onBeginLevel()
        local respawnTime = self:getRespawnTime()
        -- If a respawn time has been set and the deep arrowhead is not ready to respawn, delete it.
        if respawnTime and GetGameTimeSecs() < respawnTime then
            self:killSelf()
            return
        end

        -- Call super method
        %Ob.Parent.onBeginLevel(self)

        -- Deep arrowheads are hidden underground so should have no interest level
        self:setEntityInterestLevel(0)

        self:loadMesh(self.meshName)

        SetPhysicsFlag(self, PHYSICS_APPLYGRAVITY, 0)
        SetPhysicsFlag(self, PHYSICS_COLLIDEE, 0)
        SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
        SetPhysicsFlag(self, PHYSICS_NOPHYSICS, 0)
        -- So SnapEntityToGround can be used on collection
        SetEntityCollideSphere(self, 5)
        SetEntityAlpha(self, 0, 0)
        self:setState(nil)
    end

    function Ob:pickUp()
        self:setState('Collection')
    end

    function Ob:stateCollection()
        SetEntityAlpha(self, 1, 0)
        self:setPosition(self:getPosInFrontOf(0, 600))
        SnapEntityToGround(self)
        Global.levelScript:getPool('Global.Effects.MegaAHCollectionFX'):get():runThenPool(self)
        Global.levelScript:getPool('Global.Effects.AHCollectionFX'):get():runThenPool(self)

        -- Check if Deep Arrowhead Shuffle is enabled.
        local settings = FindScriptObject('RandoSeed')
        if settings.deepArrowheadShuffle == TRUE and not self:getRespawnTime() then
            GamePrint("Collected deep arrowhead for the first time, sending location check instead of arrowheads")
            -- Reduce respawn time to 10 minutes when collected for the first time and shuffle is enabled.
            self:setRespawnTime(600)
            -- This is our first time collecting this deep arrowhead, so send a location check to Archipelago
            -- instead of giving arrowheads to the player
            local deepArrowheadShuffle = fso('APDeepArrowheadShuffle', 'APDeepArrowheadShuffle')
            deepArrowheadShuffle:collectedDeepArrowhead(self:getSaveName())
        else
            -- Send the player arrowheads.
            UI_AdjustCollectible('arrowhead', self.value, self)
            SendMessage(self, Global.player, 'Arrowhead', self.value)

            if settings.deepArrowheadShuffle == TRUE then
                GamePrint("Deep arrowhead has been collected again after respawning. Sending arrowheads like normal")
            else
                GamePrint("Deep arrowhead shuffle is not enabled. Sending arrowheads like normal")
            end
            -- Save when the deep arrowhead can respawn.
            self:setRespawnTime()
        end

        self:killSelf()
    end

    return Ob
end