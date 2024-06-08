function CASA(Ob)
	if not Ob then
		Ob = CreateObject('CA.CALevelScript')
		Ob.bUseAmbience = 0
		Ob.sSkyBoxPath = 'Levels/SkyBox/CU_Skybox.plb'
		Ob.sLoopingAmbSoundCueName = ''
		Ob.sOneShotAmbSoundCueName = ''
		Ob.bPlayerInCU = 0
		Ob.dependencies = {
			scripts = {
				'CA.Props.Psychomaster',
			},
			meshes = {
				'characters//characterprops/raz_meleearmrt_2.plb',
				'characters/characterprops/razinventorymover.plb',
				'characters/dartlightrig.plb',
				'characters/dartnew.plb',
				'characters/genericmover.plb',
				'characters/thoughtbubble.plb',
				'globalmodels/fx_models/psiblast/psirail.plb',
				'globalmodels/fx_models/tracer/tracer.plb',
				'globalmodels/go_globalobjects/cone.plb',
				'globalmodels/go_globalobjects/tk_arrow.plb',
				'Levels/CA_Campgrounds/Props/OarsmansBadge.plb',
			},
			textures = {
				pbTrainerBig = 'textures/hud/quick_psiblasttrainerbig.dds',
			},
			animations = {
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan',
				'Anims/DartNew/BodyParts/Listen_FordHints_priority.jan',
				'Anims/DartNew/BrainTumbler_detach.jan',
				'Anims/DartNew/CoolDn_pose.jan',
				'Anims/DartNew/DartIdle02.jan',
				'Anims/DartNew/DartIdleEye01.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/Listen.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/Talk_1.jan',
				'Anims/DartNew/Talk_2.jan',
				'Anims/DartNew/Talk_3.jan',
				'Anims/DartNew/TeleportBreathe_Idle.jan',
				'Anims/DartNew/TeleportChairBounce_Idle.jan',
				'Anims/DartNew/TeleportLookAround_Idle.jan',
				'Anims/DartNew/Teleport_DriveAway.jan',
				'Anims/DartNew/Teleport_FallIntoCave.jan',
				'Anims/DartNew/UseBacon.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/gesture01.jan',
				'Anims/DartNew/gesture02.jan',
				'Anims/DartNew/gesture04.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/Sasha/SashaGesture1.jan',
				'Anims/Sasha/Sasha_Idle1.jan',
				'Anims/Sasha/gesture_concerned.jan',
				'Anims/DartNew/actionfall.jan',
				'Anims/DartNew/longjump.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'anims/DartNew/CartwheelRight.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TrnLfCycle.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/DartNew/creep.jan',
				'anims/globalmodels/fx_models/splash/splash.jan',
			}
		}
		
		Ob.indicators = {
			BB = { tags = { on = 'BB_tag_on', off = 'BB_tag_off' },
				   vaults = { on = 'BB_vault_on', off = 'BB_vault_off' },
				   cobwebs = { on = 'BB_web_on', off = 'BB_web_off' },
				   figments = { on = 'BB_figment_on', off = 'BB_figment_off' },
				 },
			NI = { tags = { on = 'NI_tag_on', off = 'NI_tag_off' },
				   vaults = { on = 'NI_vault_on', off = 'NI_vault_off' },
				   cobwebs = { on = 'NI_web_on', off = 'NI_web_off' },
				   figments = { on = 'NI_figment_on', off = 'NI_figment_off' },
				 },
			SA = { tags = { on = 'SA_tag_on', off = 'SA_tag_off' },
				   vaults = { on = 'SA_vault_on', off = 'SA_vault_off' },
				   cobwebs = { on = 'SA_web_on', off = 'SA_web_off' },
				   figments = { on = 'SA_figment_on', off = 'SA_figment_off' },
				 },
			MI = { tags = { on = 'MI_tag_on', off = 'MI_tag_off' },
				   vaults = { on = 'MI_vault_on', off = 'MI_vault_off' },
				   cobwebs = { on = 'MI_web_on', off = 'MI_web_off' },
				   figments = { on = 'MI_figment_on', off = 'MI_figment_off' },
				 },
			LO = { tags = { on = 'LO_tag_on', off = 'LO_tag_off' },
				   vaults = { on = 'LO_vault_on', off = 'LO_vault_off' },
				   cobwebs = { on = 'LO_web_on', off = 'LO_web_off' },
				   figments = { on = 'LO_figment_on', off = 'LO_figment_off' },
				 },
			MM = { tags = { on = 'MM_tag_on', off = 'MM_tag_off' },
				   vaults = { on = 'MM_vault_on', off = 'MM_vault_off' },
				   cobwebs = { on = 'MM_web_on', off = 'MM_web_off' },
				   figments = { on = 'MM_figment_on', off = 'MM_figment_off' },
				 },
			TH = { tags = { on = 'TH_tag_on', off = 'TH_tag_off' },
				   vaults = { on = 'TH_vault_on', off = 'TH_vault_off' },
				   cobwebs = { on = 'TH_web_on', off = 'TH_web_off' },
				   figments = { on = 'TH_figment_on', off = 'TH_figment_off' },
				 },
			WW = { tags = { on = 'WW_tag_on', off = 'WW_tag_off' },
				   vaults = { on = 'WW_vault_on', off = 'WW_vault_off' },
				   cobwebs = { on = 'WW_web_on', off = 'WW_web_off' },
				   figments = { on = 'WW_figment_on', off = 'WW_figment_off' },
				 },
			BV = { tags = { on = 'BV_tag_on', off = 'BV_tag_off' },
				   vaults = { on = 'BV_vault_on', off = 'BV_vault_off' },
				   cobwebs = { on = 'BV_web_on', off = 'BV_web_off' },
				   figments = { on = 'BV_figment_on', off = 'BV_figment_off' },
				 },
			MC = { tags = { on = 'MC_tag_on', off = 'MC_tag_off' },
				   vaults = { on = 'MC_vault_on', off = 'MC_vault_off' },
				   cobwebs = { on = 'MC_web_on', off = 'MC_web_off' },
				   figments = { on = 'MC_figment_on', off = 'MC_figment_off' },
				 },
		}
		
	end

	function Ob:onPreBeginLevel()
		self.theme = ''
		%Ob.Parent.onPreBeginLevel(self)
		self.tAmbientSoundLoops = {
			tv_treestump_activate = { soundCueName = 'CASAAmb' },
			tv_CUAmb = { soundCueName = 'CollectiveUnconscious' },
		}
	end

	function Ob:onBeginLevel()		
		self.sOneShotAmbSoundCueName = nil

		-- Mark the ground to render before other tranparent objects
		SetMeshProperty(FindScriptObject('CUground'), kMESH_SORT_BEGIN, 1)

		-- this is to make sure that if the player saves and loads the game in the CU, the player is set in the CU
		local startPoint = FindScriptObject('dartstart')
		if startPoint then
			-- check to see if it's from a savegame
			--if Global.player.bLoadedFromSavedGame == 1 then
				-- check to see if the player was in CU
				if Global:load('bSeenCASA') ~= 1 then
					local kickoutLocation = FindScriptObject('PlayerCULocator')
					if kickoutLocation then
						startPoint:setPosition(kickoutLocation:getPosition())
						startPoint:setOrientation(kickoutLocation:getOrientation())
					end
				end
			--end
		end
		-- clearing out the flag
		Global:save('bPlayerLastInCU', 0)

		%Ob.Parent.onBeginLevel(self)
	
		--self:SetRazPerfectedEveryLevel() --DEBUG
		
		for level, indicator in self.indicators do
			self:setCUIndicators( level, indicator )
		end

		--edit Spawn LevelDonePlacer.lua
		self.finished = SpawnScript('CA.LevelDonePlacer', 'LevelDonePlacer')

	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

        if ( Global:load('bSeenCASA') ~= 1 ) then
            Global:save('bSeenCASA', 1)
            Global:save('BeenInSashasLab',1)
            
            local startRank = Global.player.stats.rank or 1
            Global.player:setRank(1)

			--edit don't get the brainer, killSelf from mod_boot to prevent logic breaks
            --[[if (Global.player:isInInventory('Brainer') ~= 1) then
                local brainer = SpawnScript('Global.Props.Brainer', 'Brainer')
                Global.player:addToInventory(brainer,0,1)
            end]]
            if (Global.player:isInInventory('Bacon') ~= 1) then
                local bacon = SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
                Global.player:addToInventory(bacon,0,1)
            end
            if (Global.player:isInInventory('SmellingSalts') ~= 1) then
                local salts = SpawnScript('Global.Collectibles.SmellingSalts', 'SmellingSalts')
                Global.player:addToInventory(salts,0,1)
            end

			--edit Load Seed related settings
			local settings = FindScriptObject('RandoSeed')

			--edit Setting to start with Levitation in inventory
			if settings.startlevitation == TRUE then
				Global:saveGlobal('bGotRandoLevitation', 1)
				EnablePower(kPOWER_LEVITATION)				
			end

			--edit Setting to start with Cobweb Duster, or Save that Cobweb Duster is Randomized
			if settings.startcobweb == TRUE then
				local duster = SpawnScript('Global.Collectibles.CobwebDuster', 'CobwebDuster')
                Global.player:addToInventory(duster,0,1)
			elseif settings.randomizecobwebduster == TRUE then
				Global:saveGlobal('bCobwebRandomized', 1)
			end

			--edit Setting to save that Dowsing Rod is Randomzied
			if settings.randomizeDowsingRod == TRUE then
				Global:saveGlobal('bDowsingRodRandomized', 1)
			end

			--edit Setting to start with Button and enable Campgrounds Access
			if settings.startbutton == TRUE then
				local button = SpawnScript('Global.Props.Button', 'Button')
                Global.player:addToInventory(button,0,1)
			end

			--edit prevent Ford Scav Hunt Cutscene if setting FALSE
			if settings.scavengerhunt == FALSE then
				Global:saveGlobal('bRandoScavHuntCutscene', 1)
			end

			--edit Setting to Start with Mental Magnet
			if settings.mentalmagnet == TRUE then
				Global:saveGlobal('bHasMentalMagnet', 1) 
			end

			--edit Setting to Remove all tutorials
			if settings.removetutorials == TRUE then
				Global:saveGlobal('bDisableTutorialBoxes', 1) 
			end
			
			--SpawnScript('CA.Props.Psychomaster')
        end

		--edit Remove level load from CASA to CAGP if Button not in inventory
		if Global:loadGlobal('bButtonCollected') ~= 1 or Global:loadGlobal('bButtonCollected') == nil then
			local removeload = fso('CASAtoCAGP1')
			removeload:killSelf()
			local removeladder = fso('ladder10m')
			removeladder:killSelf()
			local sashablock = SpawnScript('ca.characters.RandoSasha', 'NO_ENTRY')
			sashablock:setPosition(18, 1681, 78)
			sashablock:setOrientation(0, 0, 0)
		end

		--edit to load BVRB instead of BVES if not entered yet
		if Global:loadGlobal('bBVFirstEntry') ~= 1 or Global:loadGlobal('bBVFirstEntry') == nil then
			local teleport = fso('CU_BVteleporter')
    		teleport.destLevel = 'BVRB'
		end

		--edit Spawn LevelDonePlacer Items
		self.finished:levelsDone()

		--edit to remove Edgar Goal after level complete
		if Global:loadGlobal('bBVCompleted') == 1 then
			Global.goalManager:deactivate('LiberateEdgar')
		end

		--edit Make Scavenger Hunt List viewable from beginning
		if Global:load('bFord2ScavengerProxPlayed') ~= 1 then
			Global:save('bFord2ScavengerProxPlayed', 1)
		end

		--edit Makes Brains always visible in menu
		if Global:loadGlobal('bSeenASIN') ~= 1 then
			Global:saveGlobal('bSeenASIN', 1)
		end

		--edit to make Ford's Sanctuary open with fast travel
		Global:save('cajaStump', 1, 'CA')

        --[[
		if (Global:loadGlobal('bMCEntered') == 1) then
			local CUTumbler = FindScriptObject('CUBrainTumbler')
			CUTumbler:killSelf()
			local CUExit = FindScriptObject('CUExit')
			CUExit:killSelf()
		elseif Global:loadGlobal('bNICompleted') == 1 then
			if Global.player:isInInventory('Brainer') ~= 1 then
				local brainer = SpawnScript('Global.Props.Brainer', 'Brainer')
				Global.player:addToInventory(brainer,0,1)
			end
			if (Global:load('bLiliKidnapped') ~= 1) and (Global:load('bCASA7EarFordPlayed') ~= 1) then
				--Global.cutsceneScript:runCutscene('CASA7EarFord')
				Global.goalManager:activate('MeetLili')
			end
		elseif (Global:loadGlobal('LastLevel') == 'SACU') then
			if (Global:loadGlobal('bSACompleted') == 1 and Global:load('bCASA4AfterMarksmanshipSLAMPlayed') ~= 1) then
				self:playVideo('cutscenes/prerendered/SAES_win.bik')
				Global.cutsceneScript:runCutscene('CASA4AfterMarksmanshipSLAM')
			elseif Global:loadGlobal('bKickedOut') == 1 then
				self:playVideo('cutscenes/prerendered/SAES_lose.xmv')
				if (Global:loadGlobal('bSACompleted') ~= 1) then
					local sasha = FindScriptObject('Sasha')
					if (sasha) then
						sasha:sayLine("/CAGH027SA/", 0, 0, nil, 1, nil, 1)	-- DIALOG=<<Come back when you are ready.>>
					end
				end
			end
		elseif not Global:load('BeenInSashasLab') then
			Global:save('BeenInSashasLab',1)
		end
		Global:save('bSeenCASA', 1)
		RegisterTriggerVolume(self, 'tv_RazChatter')
		Global.player:addSpamListener('Saving', self)
		--Initially hide the CU exit device.  It is only unhidden when the player enters from CASA, this is
		--to prevent the user from exiting the CU to CASA when he entered through a different mind.
		local cuTumbler = FindScriptObject('CUBrainTumbler')
		if (cuTumbler and nil ~= Global:loadGlobal('LastBrainingLevel') ) then
			local cuExit = FindScriptObject('CUExit')
			cuTumbler:hide()
			cuExit:hide()
		end
        ]]--
	end	

	--Special kickout locations for CASA
	function Ob:getKickoutLocation(lastLevelPrefix)
		if (Global:loadGlobal('bMCEntered') == 1) then
			return FindScriptObject('respawnMC')
		else
			if (self.bUsedSalts == 1) then
				return FindScriptObject('destCUExit')
			else
				return FindScriptObject('BrainLocSA')
			end
		end
	end

	function Ob:onEnteredTriggerVolume(data, from)
		if (from == Global.player and data == 'tv_RazChatter' and Global:load('RazChatterSaid') ~= 1 and Global:load('CALevelState', 'CA') == 2) then
			Global:save('RazChatterSaid', 1)
			Global.player:sayLine("/SLIN002RA/", 0, 1, nil, 1, nil, 1) -- DIALOG: So what are we gonna learn?  Bending Spoons?  Burning Stuff?
		elseif (from == Global.player and data == 'tv_CUAmb') then
			self.bPlayerInCU = 1
			self:stopLevelTheme()
		end
		%Ob.Parent.onEnteredTriggerVolume(self, data, from)
	end

	function Ob:onExitedTriggerVolume(data, from)
		if (data == 'tv_CUAmb' and from == Global.player) then
			self.bPlayerInCU = 0
			self:restoreTheme()
		end
		%Ob.Parent.onExitedTriggerVolume(self, data, from)
	end

	--Save this variable
	function Ob:listenerSaving()
		if (self.bPlayerInCU == 1) then
			Global:save('bPlayerLastInCU', 1)
		end
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		-- clear out the respawn points here...
		Global:clearPlayerRespawnPointName('CA')
	end

	function Ob:turnOffIndicator( indicator )
		FindScriptObject(indicator.on):hide()
		FindScriptObject(indicator.off):show()
	end
	
	function Ob:turnOnIndicator( indicator )
		FindScriptObject(indicator.on):show()
		FindScriptObject(indicator.off):hide()
	end
	
	function Ob:setCUIndicators( level, indicators )
		if( nil ~= Global:load( 'bFigmentsComplete', level ) ) then
			self:turnOnIndicator( indicators.figments )
		else
			self:turnOffIndicator( indicators.figments )
		end
		
		if( nil ~= Global:load( 'bEmoBagsComplete', level ) ) then
			self:turnOnIndicator( indicators.tags )
		else
			self:turnOffIndicator( indicators.tags )
		end
		
		if( nil ~= Global:load( 'bVaultsComplete', level ) ) then
			self:turnOnIndicator( indicators.vaults )
		else
			self:turnOffIndicator( indicators.vaults )
		end
		
		if( nil ~= Global:load( 'bCobwebsComplete', level ) ) then
			self:turnOnIndicator( indicators.cobwebs )
		else
			self:turnOffIndicator( indicators.cobwebs )
		end
	end
	
	function Ob:SetRazPerfectedEveryLevel()
		for level, indicator in self.indicators do
			Global:save( 'bFigmentsComplete', 1, level )
			Global:save( 'bEmoBagsComplete', 1, level )
			Global:save( 'bVaultsComplete', 1, level )
			Global:save( 'bCobwebsComplete', 1, level )
		end	
	end
	
	function Ob:RazPerfectedEveryLevel()
		local perfect = 1
		for level, indicator in self.indicators do
			perfect = perfect and Global:load( 'bFigmentsComplete', level )
			perfect = perfect and Global:load( 'bEmoBagsComplete', level )
			perfect = perfect and Global:load( 'bVaultsComplete', level )
			perfect = perfect and Global:load( 'bCobwebsComplete', level )
		end
		
		return perfect
	end
	
	return Ob
end

