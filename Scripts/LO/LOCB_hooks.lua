function LOCB_hooks(Ob)

    --[[Changes made to allow setting for using Levitation Ball in LO]]
    local listenerControlHandlerChanged_original = Ob.listenerControlHandlerChanged
    function Ob:listenerControlHandlerChanged(type)
        --check if message is from Levitation ball
        if (type == kCONTROL_BALL) then
            --if Faster LO setting is true, do nothing
            if Global:loadGlobal('bFasterLO') == 1 then
                return
            --if false, call original function
            else
                %listenerControlHandlerChanged_original(self, type)
            end
		end

    end

    --FULL FUNCTION OVERRIDE
    --final cutscenes after climbing the antenna
    function Ob:stateEndLevel()
		self:playVideo('cutScenes/prerendered/love.xmv')
		self:playVideo('cutScenes/prerendered/lllv.xmv')
		--refill Marksmanship ammo, since Kochamara steals it all
		Global.player.stats.psiBlastAmmo = Global.player.stats.psiBlastMaxAmmo
		SetPsiBlastAmmo(Global.player.stats.psiBlastAmmo)
		--return to CU instead
		Global.levelScript:returnToCU()
		self:setState(nil)
	end

end