function MILLCutscenes_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    --function called at the end of MILL after talking to Milla
    function Ob:stateCleanupCSYouWin()
		self:fadeToBlack(0)
		self:endCutscene(1)
		EnableLooking(Global.player, 1)

		--Complete levitation merit badge goal
		Global.goalManager:activate('BrainTumbler2')

        --complete the level
		Global:setLevelToCompleted('MI')
        
		--return to CU instead
		Global.levelScript:returnToCU()
	end

end