function BVES_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    local onPostBeginLevel_original = Ob.onPostBeginLevel

    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
		--spawn BVItemPlacer, for spawning items after defeating the each Wrestler
		self.itemPlacer = SpawnScript('BV.BVItemPlacer', 'BVItemPlacer')
    end
    
    function Ob:onPostBeginLevel()
        %onPostBeginLevel_original(self)
		--Place each Wrestler item if completed
		self.itemPlacer:wrestlerChecks()
    end
end