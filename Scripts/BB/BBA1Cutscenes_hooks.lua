function BBA1Cutscenes_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --[[In vanilla, this function is a modified version of the Parent function that will teleport Raz
    to specific spot after the SteamerTrunk cutscene plays. To avoid this, call the parent function directly and never teleport Raz.
    ]]
    function Ob:stateCleanupCSEmoBagCollection()
		%Ob.Parent.stateCleanupCSEmoBagCollection(self)
    end
end