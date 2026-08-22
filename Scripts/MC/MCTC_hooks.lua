function MCTC_hooks(Ob)

	local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --This flag prevents Raz from using Bacon to return to Ford's Sanctuary
        --Setting the value back to 0 makes the Bacon usable again
        Global:saveGlobal('bFordReturnToCAJADisabled', 0)
    end

    local onPostBeginLevel_original = Ob.onPostBeginLevel
    function Ob:onPostBeginLevel()
		--call original function
        %onPostBeginLevel_original(self)
		
        --[[Prevent entering Final Boss unless player has completed goals, check for any settings requirements,
		spawn DoorFatLady.lua prop to block the door if uncompleted goals still
		]]
		local seedsettings = fso('RandoSeed', 'RandoSeed')
		local oleanderDefeated = TRUE
		local rank101Met = TRUE
		local brainsMet = TRUE
		local scavhuntMet = TRUE
		local alllevelsmet = TRUE

		--check if Coach Oleander defeated
		if seedsettings.beatoleander == TRUE then
			if (Global:loadGlobal('bOleanderDefeated') == 1) then
				GamePrint('Oleander Defeated!')
			else
				oleanderDefeated = FALSE
			end
		end

		if seedsettings.rank101 == TRUE then
			if (Global:loadGlobal('rank') >= 101) then
				GamePrint('Rank 101 Achieved!')
			else
				rank101Met = FALSE
			end
		end

		if seedsettings.brainhunt == TRUE then
			--check if required number of brains have been redeemed
			if (Global:loadGlobal('totalBrainsRedeemed') >= seedsettings.brainsrequired) then
				GamePrint('Required Brains Redeemed!') 
			else 
				brainsMet = FALSE
			end
		end

		if seedsettings.scavengerhunt == TRUE then
			--check if all 16 scav items have been redeemed
			if (Global:loadGlobal('bRedeemed16ScavengerItems') == 1) then
				GamePrint('All ScavHunt Redeemed!')
			else 
				scavhuntMet = FALSE
			end
		end

		if seedsettings.beatalllevels == TRUE then
			--check if all levels completed
			if (Global:loadGlobal('bBBCompleted') == 1) and (Global:loadGlobal('bSACompleted') == 1) and (Global:loadGlobal('bMICompleted') == 1) and (Global:loadGlobal('bNICompleted') == 1) and (Global:loadGlobal('bLOCompleted') == 1) and (Global:loadGlobal('bMMCompleted') == 1) and (Global:loadGlobal('bTHCompleted') == 1) and (Global:loadGlobal('bWWCompleted') == 1) and (Global:loadGlobal('bBVCompleted') == 1) then
				GamePrint('All Levels Completed!')
			else 
				alllevelsmet = FALSE
			end
		end
		--check to remove the trigger volume, or remove fat lady
		if oleanderDefeated == FALSE or brainsMet == FALSE or scavhuntMet == FALSE or rank101Met == FALSE or alllevelsmet == FALSE then
			GamePrint('Missing a Win Condition, Spawn Fat Lady')
			remove = fso('MCTCtoMCBB')
			remove:killSelf()

			--spawn DoorFatLady
			local door = SpawnScript('global.props.DoorFatLady', 'NO_ENTRY')
			door:setPosition(-1615, -1597, 16200)
			door:setOrientation(0, -178, 0)
		else
			Global:save('bFatLadyGone', 1)
			GamePrint('Fat Lady Removed')
		end
    end

	local onEnteredTriggerVolume_original = Ob.onEnteredTriggerVolume
    function Ob:onEnteredTriggerVolume(data, from)
		--check if the trigger volume is the load zone
		if (data == 'tv_MCTCtoMCBB' and from == Global.player) then
			--if fat lady is gone, load the zone
			if (Global:load('bFatLadyGone') == 1) then
				-- this is the extra brain of health for beating MC
				if (Global:load('bMCTCCompleted') ~= 1) then
					Global:save('bMCTCCompleted', 1)
					Global.player:incrementMaxHealth(4)
				end
				self:loadNewLevel('MCBB')
				return
			else 
				--fat lady present, don't load the level
				return
			end			
		end
		--check original trigger volumes
        %onEnteredTriggerVolume_original(self,data,from)
    end
end