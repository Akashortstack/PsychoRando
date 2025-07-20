function CAJA_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        --spawn handler for placing appropriate rando items
		self.ranks = FindScriptObject('RankUpPlacer')
		if not self.ranks then
			self.ranks = SpawnScript('CA.RankUpPlacer', 'RankUpPlacer')
		end

        %onBeginLevel_original(self)
    end

    --FULL FUNCTION OVERRIDE
    --[[removing lots of conditional cutscene code based on Camp state]]
    function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)
        --place rando items in the circle
		self.ranks:randoRanks()

        --Always call this Intro, no other intros should ever be needed
        self:setState('ObservationIntro')

    end

end