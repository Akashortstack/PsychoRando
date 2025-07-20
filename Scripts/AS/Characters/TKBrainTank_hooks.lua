function TKBrainTank_hooks(Ob)
    --FULL FUNCTION OVERRIDE

    --defeating the Coach Oleander Boss
    function Ob:stateWin()
		self.brainRaz:releaseRaz()		 
		AttachEntityToEntityBone(self.brainPropForCutscene, self, 'extraBrainJ_1',0)
		--write Victory if settings require it
		Global:saveGlobal('bOleanderDefeated', 1)
		local seedsettings = fso('RandoSeed', 'Randoseed')
		--find the matching seed folder in ModData
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/victory.txt"
		if seedsettings.beatoleander == TRUE and seedsettings.requireMC == FALSE then
			if seedsettings.brainhunt == FALSE or (Global:loadGlobal('totalBrainsRedeemed') >= seedsettings.brainsrequired) then
				--write to text file for client to read
				local h = fopen(filePath, "w")
				fwrite(h, "victory\n")
				fclose(h)
			end
		end
		SetScale(self.brainPropForCutscene,2.5,2.5,2.5)
		Global.cutsceneScript:runCutscene('ASRUBothBrainsInTank',1,0,0)
		Global:saveGlobal('RazIsABrainNow', 0)
		UnlockAchievement('ACH_COMP_AS')
		--send back to the CU, to avoid logic breaks
		Global.levelScript:returnToCU()
		self:setState(nil)
	end	
end