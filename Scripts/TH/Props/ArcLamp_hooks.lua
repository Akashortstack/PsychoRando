function ArcLamp_hooks(Ob)
    local onItem_original = Ob.onItem
    function Ob:onItem(data,from)
        --need to check for Randomizer Candles as well under global.props.candle
        if (data and data ~= '') then
			local ob = FindScriptObject(data)
			if (ob.Type == 'th.props.Candle' or ob.Type == 'global.props.Candle' and not self.candle ) then
				Global.player:releaseSelectedItem()
				self:attachCandle(ob)
				-- play the sound
				self:playSound(self.rCandlePlacedSoundHandle, 0, 0, 1)
                --don't call the original
                return
			end
		else
            --call original function
            %onItem_original(self,data,from)
        end
    end

end