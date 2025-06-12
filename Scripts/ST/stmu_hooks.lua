function STMU_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        --display PsychoRando Version on main menu
		self.version = SpawnScript('Global.OtherEntities.DisplayVersion', 'PsychoRando')
        %onBeginLevel_original(self)
    end
end