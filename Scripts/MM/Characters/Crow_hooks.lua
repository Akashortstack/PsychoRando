function Crow_hooks(Ob)
    --FULL FUNCTION OVERRIDE
    --triggered when Crow is punched, normally drops a feather, removed because feather is an item
    function Ob:statePunched()
		self:chooseSpline()
		self:setState('Fly')
	end
end