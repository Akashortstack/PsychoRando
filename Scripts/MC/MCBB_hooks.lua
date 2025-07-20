function MCBB_hooks(Ob)
    local statePhaseTransition_original = Ob.statePhaseTransition
    function Ob:statePhaseTransition()
        if (self.nextPhase == 5) then
			local seedsettings = fso('RandoSeed', 'Randoseed')
			--find the matching seed folder in ModData
			local folderName = seedsettings.APfoldername
			local filePath = folderName.."/victory.txt"
			--write to text file for client to read
			local h = fopen(filePath, "w")
			fwrite(h, "victory\n")
			fclose(h)
        end
        %statePhaseTransition_original(self)

    end

end



