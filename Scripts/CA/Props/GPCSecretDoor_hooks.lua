--[[Controls the hatch from CAGP into CASA, want this to always be open for re-entry]]

function GPCSecretDoor_hooks(Ob)
    --trying to close the hatch? Just open it again!
    local close_original = Ob.close
    function Ob:close()
        %close_original(self)
        self:open()
    end
end