function NIBA_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --[[Called after defeating the braintank boss]]
    function Ob:stateLevelDone()
		StopAllSounds()
		self:playVideo('cutScenes/prerendered/nien.xmv')
		Global.goalManager:activate('MeetLili')
		Global:setLevelToCompleted('NI')
		--return to CU instead
		Global.levelScript:returnToCU()
		self:setState(nil)
	end
end