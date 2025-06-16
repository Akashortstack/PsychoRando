function MIMM_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --[[Vanilla code gives player Levitation learner's permit and activates Levitation
    Remove all of that, effectively do nothing here]]
    function Ob:onPreBeginLevel()
        %Ob.Parent.onPreBeginLevel(self)
    end

    local onPostBeginLevel_original = Ob.onPostBeginLevel

    function Ob:onPostBeginLevel()
        %onPostBeginLevel_original(self)
		--hide Bobby and his levitation ball if QOL True
		local settings = FindScriptObject('RandoSeed')
		if settings.easymillarace == TRUE then
			self.bobby:hide()
			self.bobby.ball:hide()
		end
    end


end