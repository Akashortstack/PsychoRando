--[[Adding Deathlink when the watercurse pulls Raz underneath the water]]

function watercurse_hooks(Ob)
    local stateArmGrab_original = Ob.stateArmGrab
    function Ob:stateArmGrab()
        --call Deathlink
		local deathlink = fso('Deathlink', 'Deathlink')
		deathlink:triggerDeathlink()
        %stateArmGrab_original(self)
    end
end