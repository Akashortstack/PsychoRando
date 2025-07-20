--[[Controls the Brain Tumbler in CASA]]

function SA_LAB_Braintumbler_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    --skip the cutscene and skips setting flags inside of Brain Tumbler Experiment (NI)
    function Ob:stateEnterTumbler()
        --self:playVideo('cutScenes/prerendered/CANI.xmv')
        --save this now to prevent first time entry cutscene
        Global:save('SawCUIntro', 1)
        --adding a short fade to black, makes transition smoother from lab
        Global.cutsceneScript:fadeToBlack(.2, 1)
		self:goToCU(1)
	end
end