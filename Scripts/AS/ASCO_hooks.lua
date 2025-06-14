function ASCO_hooks(Ob)

    local onPreBeginLevel_original = Ob.onPreBeginLevel

    function Ob:onPreBeginLevel()
        %onPreBeginLevel_original(self)
        --fix Edgar looking at the wrong place if BV is completed
		if Global:loadGlobal('bBVCompleted') == 1 then
			if (Global:load('bASCOCompletedBVPlayed') ~= 1) then
				Global:save('bASCOCompletedBVPlayed', 1)
			end
		end
    end
end