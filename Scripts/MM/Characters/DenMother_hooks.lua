function DenMother_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --end of cutscene after defeating the Den Mother
    function Ob:postDeathCutscene()
		Global.levelScript:stopLevelTheme()
		self:playVideo('cutscenes/prerendered/mmdd.xmv')
		Global:setLevelToCompleted('MM')
		self:killSelf()
		--return to CU instead
		Global.levelScript:returnToCU()
	end
end