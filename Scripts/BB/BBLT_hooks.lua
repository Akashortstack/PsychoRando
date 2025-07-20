function BBLT_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --return to the CU on level completion instead of the Kid's Cabins
    function Ob:stateEndLevel()
		self:stopLevelTheme()
		self.cutsceneScript:fadeToBlack(.25)
		self:sleep(.25)
		if Global:loadGlobal('bBBCompleted') ~= 1 then
			self:playVideo('cutScenes/prerendered/cabv.xmv')
			Global:setLevelToCompleted('BB')
		end
		Global:save('ReturnFromBBTemp', 1,'BB')
		--return to CU instead
		Global.levelScript:returnToCU()
		self:setState(nil)
	end
end