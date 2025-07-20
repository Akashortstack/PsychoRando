function Watercurse_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --Re-adjusting Raz's animation speed to match the QOL after a miss
    function Ob:endStateArmMiss()
		self.bPullingDown = 0
		if self.levelName == 'LOMA' or self.levelName == 'LOCB' then
			--check for faster LO QOL, adjust animation speed
			local randosettings = FindScriptObject('RandoSeed')
			if randosettings.fasterLO == TRUE then
				SetAnimSpeedScale(Global.player,.75)
			else
				SetAnimSpeedScale(Global.player,.55)
			end
		end
		Global.player:setPhysicsConstants()
		SetPhysicsFlag(Global.player, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(Global.player, PHYSICS_APPLYGRAVITY, 1)
		Global.player.bWaterCurse = nil
	end

    --Call Deathlink if Raz is pulled under the water
    local stateArmGrab_original = Ob.stateArmGrab
    function Ob:stateArmGrab()
        --call Deathlink
		local deathlink = fso('Deathlink', 'Deathlink')
		deathlink:triggerDeathlink()
        %stateArmGrab_original(self)
    end

    

end