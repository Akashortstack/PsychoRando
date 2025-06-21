function THFBCutscenes_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    function Ob:stateCleanupCSJasperDeath()
		JournalAddMovie('cutscenes/prerendered/thbf.bik')
		self:fadeToBlack(0)
		self:endCutscene(1)	
		Global.goalManager:deactivate('Gloria')
		Global:setLevelToCompleted('TH')
		Global.player:makeVisible()
		--return to CU instead
		Global.levelScript:returnToCU()
	end

end