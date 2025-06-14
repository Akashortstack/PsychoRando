function BVRB_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    local stateLevelSetup_original = Ob.stateLevelSetup

    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
		--saves first BV entry, CU checks this variable to make sure the BV teleporter has the correct destination on first visit
		if Global:loadGlobal('bBVFirstEntry') ~= 1 or Global:loadGlobal('bBVFirstEntry') == nil then
			Global:saveGlobal('bBVFirstEntry',1)
		end
        --resetting this value to 0, set by the stateLevelSetup hook below
        self.demoLevel = 0
    end

    function Ob:stateLevelSetup()
        --hacky way of preventing the game from disabling confusion, since bGotConfusion is never enabled the rando
        --game checks if Demo level when disabling
        self.demoLevel = 1
        %stateLevelSetup_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --Removing vanilla confusion from helping the Dog paint the mural
    function Ob:csShowConfusionBadge()
        return
    end
    
    --FULL FUNCTION OVERRIDE
    --Removing vanilla confusion from helping the Dog paint the mural
    function Ob:stateActivateConfusionPower()
        self:setState(nil)
    end

end
