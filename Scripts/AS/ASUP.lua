function ASUP(Ob)
	if not Ob then
		Ob = CreateObject('AS.ASLevelScript')
		Ob.dependencies = {
			animations = {
				
				'Anims/CO_CollectibleMover/CollectibleMover.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/FordHint.jan',
				'Anims/DartNew/KissBrain.jan',
				'Anims/DartNew/KissBrain_Idle.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/Psi_Inventory_armJALf_1.jan',
				'Anims/DartNew/RailSlideUphill.jan',
				'Anims/DartNew/Raz_menaceLobotoArm.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/balloonwalk.jan',
				'Anims/DartNew/balloonwalkslow.jan',
				'Anims/Objects/InventoryToss.jan',
				'Anims/PsiChallenge/Collect.jan',
				'Anims/AS_Rat/FlamingRun.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/TightropeRun.jan',
				'anims/DartNew/TightropeWalk.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/dartnew/netDn.jan',
				'anims/dartnew/netDnLf.jan',
				'anims/dartnew/netDnRt.jan',
				'anims/dartnew/netLf.jan',
				'anims/dartnew/netRt.jan',
				'anims/dartnew/netUpLf.jan',
				'anims/dartnew/netUpRt.jan',
			}
		}
		
		Ob.Dart = nil
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.drumSnd = 0
		Ob.ended = nil
		Ob.theme = 'Asylum'
		Ob.levelType = 'real'
	end

-- ****************************************************************************

	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('MI')

		%Ob.Parent.onBeginLevel(self)

		self.Dart = FindScriptObject('Dart')
		
	
		SetSkyBox('Levels/AS_Asylum/ASLB_Skybox.plb')
		SetupWaterTextures('Textures/FXTextures/Water/Bumps/LO_waterNoise2.tga')

		-- water drips FX
        if( not self.dripFX ) then
			self.dripFX = SpawnScript('AS.Effects.WaterDripFX','asWaterDrip','',1)
		end
		self.dripFX:run()
		-- debris FX
        if( not self.debrisFX ) then
			self.debrisFX = SpawnScript('AS.Effects.DebrisFX','asDebris','',1)
		end
		self.debrisFX:run()
	
        if( not self.ToxicFX ) then
			self.ToxicFX = SpawnScript('AS.Effects.ASUP_ToxicFX','ToxicFX','',1)
		end
		self.ToxicFX:run()
		RegisterTriggerVolume(self,'tv_SheegorWarning')
	end

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.rAmbientSound = LoadSound('ASUP_Amb')
		PlaySound(nil, self.rAmbientSound, 1, 0)
		if Global:load('bElevatorArrivePlayed') ~= 1 then
			Global.cutsceneScript:runCutscene('ElevatorArrive', nil, 1)
		end
	end

-- ****************************************************************************

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		self.dripFX:stop()
	end

-- ****************************************************************************

	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self.censorPoolTable = {	Rat = {num = 3, censorCode = 'Rat', scriptName = nil}	}
	end
	
-- ****************************************************************************
	
	function Ob:onEnteredTriggerVolume(data,from)
		if from == Global.player then
			if (data == 'tv_SheegorWarning') then
				if (Global:loadGlobal('SeenSheegorWarning') ~= 1) then
					Global.cutsceneScript:runCutscene('SheegorWarningASUPLightning',0,1,0)
--					Global.cutsceneScript:runCutscene('SheegorWarningASUP',0,1,0)
					Global:saveGlobal('SeenSheegorWarning', 1)
				end
			end
		end
	end

	function Ob:getHintResponse()
		--Default to this
		return {
			{
				voice = "/GLAJ015FO/",--DIALOG=<<Try to shoot those rats before they get too close!>>
			},
			{
				voice = "/GLAJ016FO/",--DIALOG=<<Keep moving up! We gotta get to the top!>>
			}
		}
	end
    
	return Ob
   
end

