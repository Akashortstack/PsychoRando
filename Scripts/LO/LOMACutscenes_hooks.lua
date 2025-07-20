function LOMACutscenes_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    function Ob:stateCleanupCSZealotJailBreakout()
		JournalAddMovie('cutscenes/prerendered/loz2.bik')
		Global.goalManager:activate('GiantCannon')

		--Removed to prevent getting Shield from Cutscene
		--EnablePower(kPOWER_SHIELD)
		--if GetMappedPower(kQUICKPICK_BLACK) == kPOWER_NONE then MapPowerToButton(kPOWER_SHIELD,kQUICKPICK_BLACK) end
		
		Global:saveGlobal('bGotShield', 1)
		self:fadeToBlack(0)
		self:fadeIn(0.25)
		self:endCutscene()
	end

end