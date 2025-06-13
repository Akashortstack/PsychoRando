function ASLB_hooks(Ob)

    local onEnteredTriggerVolume_original = Ob.onEnteredTriggerVolume

    function Ob:onEnteredTriggerVolume(data,from)
        %onEnteredTriggerVolume_original(self,data,from)
		--[[
        Move's Pokeylope's Brain to the pedestal on first Sheegor cutscene if Pokeylope already in inventory 
        (Can't happen in Vanilla because you need the cake from the table first)
        ]]
		if from == Global.player and (data == 'tv_TeaRoomIntro' and Global.player:isInInventory('PokeyProp') == 1 ) then
            GamePrint("Put Pokeylope's Brain on the pedestal!")
			local pokeyBrain = FindScriptObject('PokeyBrain')
			if (pokeyBrain ~= nil) then
				pokeyBrain:moveToPedstalTwo()
			end
        end
    end
end