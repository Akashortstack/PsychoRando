function Ford_hooks(Ob)


    local collectScavItems_original = Ob.collectScavItems

	--Called when redeeming scavenger hunt items with Ranger Ford
    function Ob:collectScavItems()
        %collectScavItems_original(self)
        --save variable used in MCTC to check if full scavenger hunt list is completed, useful for future Scav Hunt settings?
        if (Global:loadGlobal('bCollected16ScavengerItems') == 1 and Global:load('bRedeemed16ScavengerItems') ~= 1) then
			Global:saveGlobal('bRedeemed16ScavengerItems', 1)
        end

    end

    --FULL FUNCTION OVERRIDE
    --[[Changes added to adjust which cutscenes get played when talking to Ford for the first time in Ford's Sanctuary
    prevents game from breaking]]

    function Ob:stateSlapRaz()
		Global.player:dontRunPlayerControls(1)
		Global.player:setNewAction('Stand')
		SetCamera(kCAMERA_SCRIPT)

        --  if this line was heard in the cutscene that leads up to this then dont play it again
		if Global:load('bHeardAreYouReadyLine') ~= 1 then
            self:sayLine("/CAKC018FO/", 1, 0, nil, 1, nil, 1)--DIALOG=<<Are you ready?>>
		end

		Global.cutsceneScript:cutTo(-3845.4,1617.4,-4686.4, 17.9,5.9,-0.0,134.1)       	
		
		--Get dialog selection		
		local slapDialog = {
			"/GLZA036TO/",--DIALOG=<<Yes!>>
			"/GLZA039TO/",--DIALOG=<<No. Not yet.>>
		}
		
		--Keep asking until he says yes
		local choice = 0
		while (choice ~= 1) do
			choice = DialogChoiceBubble(slapDialog, 1)
			--Play appropriate line
			if (choice == 2) then
				Global.player:sayLine("/CAKC020RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<No. Not yet.>>
				--Play slapping animation
				Global.cutsceneScript:cutTo(-3712.3,1669.3,-4985.7, -4.4,37.0,0.0,93.8)
				LoadAnim(Global.player, 'Anims/DartNew/Ninja_slapped.jan', 0.3, 0)
				
				self:setAnim(self.animsTable.ninjaSlap)
				self:sleep(0.3)				
				self:playSound(self.rSlapSoundHandle, 0, 0, 1)
				self:sleep(0.4)
				
				--And back to idle
				LoadAnim(Global.player, 'Anims/DartNew/standstill.jan', 0.3, 1)
				self:setAnim(self.animsTable.ninjaIdle)
				
				self:sayLine("/CAKC021FO/", 1, 0, nil, 1, nil, 1)--DIALOG=<<How about now?>>
				Global.cutsceneScript:cutTo(-3845.4,1617.4,-4686.4, 17.9,5.9,-0.0,134.1)       	
			end
		end

		Global.player:sayLine("/CAKC019RA/", 1, 1, nil, 1, nil, 1)--DIALOG=<<Yes!>>
		
		--removing this cutscene since it leads into further story flag issues and breaks dialogue
		--Global.cutsceneScript:runCutscene('CAJAFindMonster', 1)

		SetCamera(kCAMERA_CHASE)
		Global.player:dontRunPlayerControls(0)

		--activate Ford and turn in brains
		self.bActivated = 1
		self:setState('TalkCAJA')
		
		--self:setState(nil)
        
	end
end