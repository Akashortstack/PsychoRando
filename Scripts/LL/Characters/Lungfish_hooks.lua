function Lungfish_hooks(Ob)

    local stateDazed_original = Ob.stateDazed
    --state after defeating the Lungfish Boss
    function Ob:stateDazed()
        --make sure this gets saved now, skipped later on
		Global:saveGlobal('bLLCompleted', 1)
        %stateDazed_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --normally sets up a cutscene with Ford, instead we return to CABH after the boss
    function Ob:endStateDazed()
		Global.goalManager:deactivate('DefeatLungfish')
		Global.goalManager:activate('RescueLili',1)
		--load CABH so Raz isn't trapped underwater with the Lungfish
		Global.levelScript:loadNewLevel('CABH_NIGHT',0,0)
	end	


end