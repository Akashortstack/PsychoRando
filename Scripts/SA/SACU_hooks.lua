function SACU_hooks(Ob)

    --used to control disabling mental magnet, to prevent a bug during tutorial
    Ob.mentalMagnetOff = 0

    local onPreLoad_original = Ob.onPreLoad
    function Ob:onPreLoad()
        %onPreLoad_original(self)
        --spawn SAItemPlacer, Cube phases require special handling
		self.ItemPlacer = SpawnScript('SA.SAItemPlacer', 'SAItemPlacer')
    end

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --disable Mental Magnet if tutorial isn't completed.
		if (Global:loadGlobal('bTutorialFinished') ~= 1) then
			if (Global:loadGlobal('bHasMentalMagnet') == 1) then
				Global:saveGlobal('bHasMentalMagnet', 0)
                --store that we disbled it
				self.mentalMagnetOff = 1
			end
		end
    end

    local onPostBeginLevel_original = Ob.onPostBeginLevel
    function Ob:onPostBeginLevel()
        %onPostBeginLevel_original(self)
        --get the current Cube Face
        self.face = Global:load('currentFace')
        if self.face ~= nil then
            GamePrint("Current Cube Face is "..self.face)
            --need to replace self.face since face 4 in randomizer == face 6 in vanilla
            if self.face == 6 then
                self.face = 4
            end
            --spawn randomizer items for matching Face
            if (self.face >= 1 ) and (self.face <= 4) then
                local puzzle = fso('SAItemPlacer')
                puzzle:revealPuzzleItems(self.face)
            end
        else --self.face is nil
            --remove all randomizer items
            GamePrint("Current Cube Face is nil")
            local puzzle = fso('SAItemPlacer')
            puzzle:revealPuzzleItems(0)
        end

    end

    local onEndLevel_original = Ob.onEndLevel
    function Ob:onEndLevel()
        %onEndLevel_original(self)
        --re-enable Mental Magnet if disabled
		if self.mentalMagnetOff == 1 then
			Global:saveGlobal('bHasMentalMagnet', 1)
			self.mentalMagnetOff = 0
		end
    end

end