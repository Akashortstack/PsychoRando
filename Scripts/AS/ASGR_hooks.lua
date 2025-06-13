function ASGR_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel

    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
		--edit to make gate always open
		if (self.gate) then
			self:sendMessage(self.gate, 'Open')
		end
    end
end