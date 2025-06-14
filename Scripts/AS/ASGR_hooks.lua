function ASGR_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel

    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
		--make asylum gate always open, don't have to complete MM first
		if (self.gate) then
			self:sendMessage(self.gate, 'Open')
		end
    end
end