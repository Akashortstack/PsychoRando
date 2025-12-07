function MagicPainting_hooks(Ob)

    --[[HACK!!! Prevent's Gloria's Theater Crashing, BUT also prevents Paintings from being randomized.
    Until crash cause is found, this will have to do... 

    Makes paintings only appear in inventory and usable inside of Black Velvetopia
    ]]
    Ob.level = 'prefixBased'


    --[[Until fix for Gloria's Theater Crashing is found, this is unnecessary

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)

        --Changes all display names to appear properly outside of BV

		if self.sPaintingType == 'Ladder' then
            --edit name, NEEDS LOCALIZATION
			self.displayName = "Guitar Painting"--DIALOG=<<Guitar Painting>>
		elseif self.sPaintingType == 'Window' then
            --edit name, NEEDS LOCALIZATION
			self.displayName = "Window Painting"--DIALOG=<<Window Painting>>
        elseif self.sPaintingType == 'Rose' then
            --edit name, NEEDS LOCALIZATION
			self.displayName = "Rose Painting"--DIALOG=<<Rose Painting>>
		elseif self.sPaintingType == 'Vine' then
            --edit name, NEEDS LOCALIZATION
			self.displayName = "Vine Painting"--DIALOG=<<Vine Painting>>
		elseif self.sPaintingType == 'Archway' then
            --edit name, NEEDS LOCALIZATION
			self.displayName = "Archway Painting"--DIALOG=<<Archway Painting>>
        end

    end

    --FULL FUNCTION OVERRIDE
    function Ob:onActivateFail(data, from)
		--Only play the sound if inside BV, random text otherwise
		if strfind(FindScriptObject('LevelScript').Type, 'bv.BVRB') or strfind(FindScriptObject('LevelScript').Type, 'bv.BVES') then
			Global.player:sayLine("/BVRO005RA/", 0, 1, nil, 1, nil, 1)	--DIALOG=<<I should find a proper hook for this painting, so it will come to life like that dog said.>>
		end
	end
    ]]
end