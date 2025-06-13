function AS_hand_hooks(Ob)

    local setHomePosition_original = Ob.setHomePosition

    function Ob:setHomePosition()
        --Prevents Trophy from moving to Vanilla spot if spawned in ASGR
        --No more setHomePosition
        return
    end
end