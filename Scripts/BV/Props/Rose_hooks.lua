function Rose_hooks(Ob)
    --edit name to appear properly, NEEDS LOCALIZATION
	Ob.displayName = "Rose"--DIALOG=<<Rose>>
    --changing from 3 to appear later in inventory pages
	Ob.invSortKey = 9

    --FULL FUNCTION OVERRIDE
    function Ob:onActivateFail(data, from)
		--only say something if Raz is not looking at anyone
		local targ = GetLookTarget(Global.player)
		if (not targ) then
			self.iActivateFailCounter = self.iActivateFailCounter + 1
			local line
		    --Only play the sound if inside BV, random text otherwise
			if strfind(FindScriptObject('LevelScript').Type, 'bv.BVRB') or strfind(FindScriptObject('LevelScript').Type, 'bv.BVES') then
				if (self.iActivateFailCounter < 3) then
					line = "/BVRO000RA/"	-- 'I should give this rose to someone who\'d appreciate it.'
				elseif (self.iActivateFailCounter < 10) then
					line = "/BVRO001RA/"	-- 'I'll bet there is a lonely lady out there somewhere who could use a little cheering up.'
				else
					line = "/BVRO002RA/"	-- 'Maybe one of those ladies hiding behind the shutters.'
				end
				Global.player:sayLine(line, 0, 1, nil, 1, nil, 1)
			end
		end
	end

end
