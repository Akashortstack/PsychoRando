function MatadorBoss_hooks(Ob)

    --FULL FUNCTION OVERRIDE
    --Defeating the Matador Boss
    function Ob:stateDying()
		self:sayLine("/BVAG013MA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<Ow! >>
		self:sayLine("/BVAG017MA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<El Odio... Is.... DYING.>>
		self:playVideo('cutscenes/prerendered/bvvi.bik',1)
		Global.cutsceneScript:fadeToBlack(0)
		Global:setLevelToCompleted('BV')
		--return to CU instead of Asylum
		Global.levelScript:returnToCU()
        self:setState(nil)
    end
end
