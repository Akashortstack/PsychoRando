
function Rose(Ob)
	if not Ob then 
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'Levels/BV_BlackVelvetopia/Props/BV_Rose.plb'
		--edit NEEDS LOCALIZATION
		Ob.displayName = "Rose"--DIALOG=<<Rose>>
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan'
		Ob.HeldPosX = 2.2   
		Ob.HeldPosY = 3.3    
		Ob.HeldPosZ = -2.7    
		Ob.HeldRotX = -13
		Ob.HeldRotY = 36.167
		Ob.HeldRotZ = 10.629
		Ob.pickupSpriteName = 'Rose'
		--edit from 3
		Ob.invSortKey = 9
		Ob.iActivateFailCounter = 0
	end
	
	function Ob:onActivateFail(data, from)
		-- only say something if Raz is not looking at anyone
		local targ = GetLookTarget(Global.player)
		if (not targ) then
			self.iActivateFailCounter = self.iActivateFailCounter + 1
			local line
			--edit to not work outside BV until subtitles can be fixed
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

    	return Ob
end
