function ReentrySwitch_hooks(Ob)

    local onPsiBlast_original = Ob.onPsiBlast
    function Ob:onPsiBlast()
        %onPsiBlast_original(self)
        --need to replace self.face since face 4 in randomizer == face 6 in vanilla
        if self.face == 6 then
            self.face = 4
        end

         --spawn randomizer items for matching Face
		local puzzle = fso('SAItemPlacer')
		puzzle:revealPuzzleItems(self.face)
    end

end