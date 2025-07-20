function CABH_NIGHT_hooks(Ob)

    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --spawn LLDoneItemPlacer, controls reward from defeating Lungfish Boss
		self.itemPlacer = SpawnScript('CA.LLDoneItemPlacer', 'LLDoneItemPlacer')
    end

    --FULL FUNCTION OVERRIDE
    --[[several changes to player spawn points, removing cutscenes, and controlling when the Bathosphere removes itself]]
    function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)		

        --remove the invisible wall blocking access to the Bathosphere
		SetPhysicsFlag(FindScriptObject('BobbyblocksCollideGEO'), PHYSICS_COLLIDEE, 0)

        --make sure these goals get activated (normally trigerred in statePlayCALK(), but skipping that state)
        Global:save('bLiliKidnapped', 1)
		Global.goalManager:activate('RescueLili')
		Global.goalManager:activate('DefeatLungfish')
		
		--place player next to old bathosphere location after completing LLLL
		local lastPrefix = Global:loadGlobal('LastLevel')
		if lastPrefix == "LLLL" then
			Global.player:setPosition(13997, 506, 15987)
			Global.player:setOrientation(0, 165, 0)
			MoveCameraToIdeal()
		end

		--show the item if LLLL is completed
		self.itemPlacer:checkItem()
		
		--bathosphere now disappears after finishing LL instead of LO
		if (Global:loadGlobal('bLLCompleted') == 1) then
			local bathosphere = FindScriptObject('bathosphere')
			if bathosphere then
				bathosphere:killSelf()
			end
			local bathosdoor = FindScriptObject('BathosphereDoor')
			if bathosdoor then
				bathosdoor:killSelf()
			end
		else
			RegisterTriggerVolume(self, 'tv_Bathosphere')
			FindScriptObject('Sealnet'):killSelf()
		end

		--This deep arrowhead (worth 130 arrowheads) spawns out of bounds behind the cliff side.
		--      Move it to the top of the big rock by the bathysphere instead
		local deepArrowHead3 = FindScriptObject('MegaArrowhead3')
		if deepArrowHead3 then
		    deepArrowHead3:setPosition(14403, 995, 12852)
		end

	end
end