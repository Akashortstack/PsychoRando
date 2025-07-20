function MIFL_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --[[Vanilla code gives player Levitation learner's permit and activates Levitation
    Remove all of that, effectively do nothing here]]
    function Ob:onPreBeginLevel()
        %Ob.Parent.onPreBeginLevel(self)
    end
end