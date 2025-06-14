function BVWA_hooks(Ob)

    local subtractHealthLevel_original = Ob.subtractHealthLevel
    
    function Ob:subtractHealthLevel(iHealthBar, iSubtractor)
        --edit lose immediately if instantdeath == True
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.instantdeath == TRUE then
			if iHealthBar==1 then
				iSubtractor=100
			end
		end	
        %subtractHealthLevel_original(self, iHealthBar, iSubtractor)

    end
end