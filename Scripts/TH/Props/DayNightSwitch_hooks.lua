function DayNightSwitch_hooks(Ob)
    local onItem_original = Ob.onItem
    function Ob:onItem(data,from)
        --need to check for Randomizer Candles as well under global.props.candle
        if (data and data ~= '') then
			local ob = FindScriptObject(data)
            --checks for Global Prop instead of level specific
			if (ob.Type == 'global.props.Candle' and not self.candle ) then
				Global.player:releaseSelectedItem()
				self:attachCandle(ob)
				self:playSound(self.rCandlePlacedSoundHandle, 0, 0, 1)
                return
			end
		else
            --call original function
            %onItem_original(self,data,from)
        end
    end

    --function called when Candle is lit with Pyro
    local onFireEnd_original = Ob.onFireEnd
    function Ob:onFireEnd()
        %onFireEnd_original(self)
        --open backstage door to prevent softlock
		local door = FindScriptObject('StorageRoomDoor', 1)
		if (door) then
			door:open()
		end
		SetSwitchableCollisionEnable(1,0)
		Global:save('StorageRoomDoorOpened', 1)
    end

end