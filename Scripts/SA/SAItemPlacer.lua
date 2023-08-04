
--[[Script that handles placing special, condition based items in WWMA]]


function SAItemPlacer(Ob)
    if ( not Ob ) then
        Ob = CreateObject('ScriptBase')
        --list of referenced items for SA Cubeface Items
		Ob.face1item1 = nil
        --global.collectibles.EmotionalBaggageTag EmoTag1 Position X,Y,Z -262 564 -378 Orientation OX,OY,OZ 0 54 0

		Ob.face1item2 = nil
        --global.collectibles.EmotionalBaggageTag EmoTag2 Position X,Y,Z -1371 751 513 Orientation OX,OY,OZ -33 103 -32

		Ob.face1item3 = nil
        --sa.characters.Vault Vault1 Position X,Y,Z -7 487 -28 Orientation OX,OY,OZ 0 -42 0

		Ob.face1item4 = nil
        --global.collectibles.EmotionalBaggage EmoBag1 Position X,Y,Z -1455 5 491 Orientation OX,OY,OZ 0 -37 0

		Ob.face1item5 = nil
        --global.collectibles.OneUp OneUp1 Position X,Y,Z 1832 799 -1348 Orientation OX,OY,OZ 0 0 0

		Ob.face1item6 = nil
        --global.collectibles.EmotionalBaggage EmoBag2 Position X,Y,Z -274 1748 -1546 Orientation OX,OY,OZ 1 -121 1


		Ob.face2item1 = nil
        --global.collectibles.EmotionalBaggageTag EmoTag3 Position X,Y,Z 2021 -1558 753 Orientation OX,OY,OZ 0 18 -90

        Ob.face2item2 = nil
        --global.collectibles.EmotionalBaggage EmoBag3 Position X,Y,Z 3822 -842 2596 Orientation OX,OY,OZ 0 76 -90

		Ob.face2item3 = nil
        --global.collectibles.OneUp OneUp2 Position X,Y,Z 4187 -1867 -1747 Orientation OX,OY,OZ 0 0 -90


        Ob.face3item1 = nil
        --global.collectibles.EmotionalBaggageTag EmoTag4 Position X,Y,Z 19 -2128 -1848 Orientation OX,OY,OZ 90 179 61

        Ob.face3item2 = nil
        --global.collectibles.EmotionalBaggage EmoBag4 Position X,Y,Z -291 -538 -2863 Orientation OX,OY,OZ 87 180 3

		Ob.face3item3 = nil
        --global.collectibles.OneUp OneUp3 Position X,Y,Z 1853 -2948 -4743 Orientation OX,OY,OZ -90 0 0

        Ob.face3item4 = nil
        --sa.characters.Vault Vault2 Position X,Y,Z -1984 -1913 0 Orientation OX,OY,OZ 178 0 -90


		Ob.face4item1 = nil
        --global.collectibles.EmotionalBaggageTag EmoTag5 Position X,Y,Z 398 -3956 -843 Orientation OX,OY,OZ 180 0 0

        Ob.face4item2 = nil
        --global.collectibles.EmotionalBaggage EmoBag5 Position X,Y,Z 379 -4862 422 Orientation OX,OY,OZ 174 131 -8

		Ob.face4item3 = nil
        --global.collectibles.OneUp OneUp4 Position X,Y,Z 273 -4924 -148 Orientation OX,OY,OZ 180 0 0


    end

    	--edit Functions for handling hiding/showing rando collectibles
	function Ob:revealPuzzleItems(face)

        --face one
        local F1I1 = FindScriptObject(self.face1item1)
        local F1I2 = FindScriptObject(self.face1item2)
        local F1I3 = FindScriptObject(self.face1item3)
        local F1I4 = FindScriptObject(self.face1item4)
        local F1I5 = FindScriptObject(self.face1item5)
        local F1I6 = FindScriptObject(self.face1item6)

        --face two
        local F2I1 = FindScriptObject(self.face2item1)
        local F2I2 = FindScriptObject(self.face2item2)
        local F2I3 = FindScriptObject(self.face2item3)

        --face three
        local F3I1 = FindScriptObject(self.face3item1)
        local F3I2 = FindScriptObject(self.face3item2)
        local F3I3 = FindScriptObject(self.face3item3)
        local F3I4 = FindScriptObject(self.face3item4)

        --face four
        local F4I1 = FindScriptObject(self.face4item1)
        local F4I2 = FindScriptObject(self.face4item2)
        local F4I3 = FindScriptObject(self.face4item3)


        --hide ALL items first, only reveal based on face
        if F1I1 ~= nil then
            F1I1:hide()
        end

        if F1I2 ~= nil then
            F1I2:hide()
        end

        if F1I3 ~= nil then
            F1I3:hide()
        end

        if F1I4 ~= nil then
            F1I4:hide()
        end

        if F1I5 ~= nil then
            F1I5:hide()
        end

        if F1I6 ~= nil then
            F1I6:hide()
        end


        if F2I1 ~= nil then
            F2I1:hide()
        end

        if F2I2 ~= nil then
            F2I2:hide()
        end

        if F2I3 ~= nil then
            F2I3:hide()
        end


        if F3I1 ~= nil then
            F3I1:hide()
        end

        if F3I2 ~= nil then
            F3I2:hide()
        end

        if F3I3 ~= nil then
            F3I3:hide()
        end

        if F3I4 ~= nil then
            F3I4:hide()
        end

        
        if F4I1 ~= nil then
            F4I1:hide()
        end

        if F4I2 ~= nil then
            F4I2:hide()
        end

        if F4I3 ~= nil then
            F4I3:hide()
        end

        --Zero when no collectibles revealed
		if face == 0 then
	
		end

        --face one
		if face == 1 then

            if F1I1 ~= nil then
                F1I1:show()
            end
            if F1I2 ~= nil then
                F1I2:show()
            end
            if F1I3 ~= nil then
                F1I3:show()
            end
            if F1I4 ~= nil then
                F1I4:show()
            end
            if F1I5 ~= nil then
                F1I5:show()
            end
            if F1I6 ~= nil then
                F1I6:show()
            end
		end

        --face two
		if face == 2 then
            if F2I1 ~= nil then
                F2I1:show()
            end
            if F2I2 ~= nil then
                F2I2:show()
            end
            if F2I3 ~= nil then
                F2I3:show()
            end

		end

        --face three
        if face == 3 then
            if F3I1 ~= nil then
                F3I1:show()
            end
            if F3I2 ~= nil then
                F3I2:show()
            end
            if F3I3 ~= nil then
                F3I3:show()
            end
            if F3I4 ~= nil then
                F3I4:show()
            end

        end

        --face four
        if face == 4 then
            if F4I1 ~= nil then
                F4I1:show()
            end
            if F4I2 ~= nil then
                F4I2:show()
            end
            if F4I3 ~= nil then
                F4I3:show()
            end

        end
	end

    return Ob
end