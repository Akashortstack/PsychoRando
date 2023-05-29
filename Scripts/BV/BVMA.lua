--  BVMA.lua
--
--  for   P S Y C H O N A U T S
--  (c) Double Fine Productions
--  Proprietary and Confidential

function BVMA(Ob)
	-- Constructor
	if (Ob == nil) then									   
		Ob = CreateObject('LevelScript')
       	Ob.dependencies = {
       		textures = {
       			'Textures/UI/Sayline Heads/BVraz.dds'
       		},
			animations = { 
				'Anims/Bull/Toss_Lf.jan',
				'Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan',
				'Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan',
				'Anims/DartNew/ConfusionBomb.jan',
				'Anims/DartNew/KnockDownBack_start.jan',
				'Anims/DartNew/KnockDownFront_start.jan',
				'Anims/DartNew/KnockDown_end.jan',
				'Anims/DartNew/KnockDown_loop.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/MeleeArms/TK/Drop.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Spear_Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Spear_Lift.jan',
				'Anims/DartNew/MeleeArms/TK/Spear_Throw.jan',
				'Anims/DartNew/MeleeArms/TK/Throw.jan',
				'Anims/DartNew/SmellSalts_end.jan',
				'Anims/DartNew/SmellSalts_loop.jan',
				'Anims/DartNew/SmellSalts_start.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Matador/Props/Cape_PullSpearOut.jan',
				'Anims/Matador/Props/Cape_SpearedAsBull.jan',
				'Anims/Objects/SmellingSalts/SmellSaltsProp.jan',
				'Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'Anims/Thought_Bubble/BubbleIdle.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/OpenThoughtBalloon.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/Dartnew/tk_turn.jan',
				'anims/objects/duster/Duster_spinner_Shoot.jan',
				'anims/objects/duster/Duster_spinner_SpinCycle.jan',
				'anims/objects/duster/dustershoot.jan',
			},
		}	
		
		Ob.levelType = 'mental'
		
		Ob.roseDropMinTime = 2000
		Ob.roseDropMaxTime = 5000
		Ob.TIMER_ROSE_DROP = '7000'
		Ob.theme = 'BlackVelvetAction'
		Ob.bMatadorConfusedOnce = 0
		Ob.bBossBattle = 1
	end

--**************************************************************************************************
	
	function Ob:onBeginLevel()
		--Player must have completed at least up to MM
		--Global:setLevelToCompleted('MM')

		--Player must have gotten confusion from playing BVRB
		Global:saveGlobal('bGotConfusion', 1)
		
		%Ob.Parent.onBeginLevel(self)
		
		self.origTKMax = Global.player.TK_Max_Distance
		--Global.player.TK_Max_Distance = 2500
		Global.player:addSpamListener('RazRespawn', self)
		self.bull = FindScriptObject('Bull')
		self.matador = FindScriptObject('Matador')
		PlayerSetLookTargetSearchDist(Global.player, 5000)
		SetTKClawSnapType('TKClaw','TKClaw')
		Global.camControl:setSecondaryTarget(self.bull, kSECONDARYFLAG_AUTO_ROTATE, 0)
		SetChaseCameraAutoRotateRange(20, 15)
		
		SetEntityCollideIgnoreEntity(FindScriptObject('Balcony'), self.bull, -1)
		
		Global.camControl:pushAndSetChase(self, 1000, 20, 300)
		Global.cutsceneScript:runCutscene('BVMAIntro')
		
		self.rosePool = self:getPool('BV.Props.BVMARose')
		self.rosePool:setLowerLimit(10)
		
		--SetCollideLayer(Global.player, LAYER_BVMA_INAIR, 1)
		Global.levelScript:disableGoodie(kGOODIE_PSIBLAST)
		
		self:createTimer(RandInt(self.roseDropMinTime,self.roseDropMaxTime), self.TIMER_ROSE_DROP)
		Global.player.charName = 'BVraz'
				-- We have to remember to reload the correct mesh when we exit the level
		LoadNewPlayerMesh('characters/bv_raz.plb')
		SetShadowColor(0, 0, 0, 0.5)
		SetEntityFlag(Global.player, ENTITY_DRAWSHADOW, 1)
		SetEntityFlag(Global.player, ENTITY_LIT_SHADOW, 1)
		SetEntityFlag(FindScriptObject('Balcony'), ENTITY_DETAIL_CULLING, 0)
		
	end
	
--**************************************************************************************************
	
	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)
		Global.player.TK_Max_Distance = self.origTKMax
		SetCollideLayer(Global.player, LAYER_BVMA_INAIR, 0)
		Global.player.charName = 'Raz'
		LoadNewPlayerMesh('characters/dartnew.plb', 1)
		Global.levelScript:enableGoodie(kGOODIE_PSIBLAST)
	end
	
--**************************************************************************************************
	
	function Ob:listenerRazRespawn()
		if (self.bull.modeCharge.bCharging == 1) then
			--GamePrint('Bull skidding to stop cuz raz died')
			self.bull:setAnim(self.bull.animsTable.SkidStop)
		end
		self.bull:endAllModes()
		self.matador:endAllModes()
		if (self.bull.phase == 1) then
			Global.cutsceneScript.respawnYaw = 'Bull'			
		else
			Global.cutsceneScript.respawnYaw = 'Matador'			
		end
		self:setState('Respawn')
	end


--**************************************************************************************************
	
	function Ob:stateRespawn()
		while (Global.player.respawnMilestone < Global.player.RESPAWN_FADEDTOBLACK) do Yield() end
	
		--reset the bull and matador
		self.bull:resetPhase()
		self.matador:resetPhase()
		
		--kill all rose bundles
		for i,v in self.rosePool.notpooled do
			if (type(v) == 'table') then	-- because n is in notpooled too
				self.rosePool:pool(v)
			end
		end
		
		--if (self.bull.phase == 2) then
			while (Global.player.respawnMilestone < Global.player.RESPAWN_PLAYERPOSITIONED) do Yield() end
		--end
		
		self.bull.razControl.bRazInvis = 0
		self.bull.razControl:setState('PollForInvisibility')
		self.bull:decide()
		self.matador:decide()
		self:setState(nil)
	end
    
--**************************************************************************************************

	function Ob:onTimer(data,from)
		--drop rose gio
		if (data == self.TIMER_ROSE_DROP) then
			if (self.rosePool.notpooled.n < 6) then
				--random vector
				local nx,ny,nz = NormalizeVector(RandInt(-100,100)/100, 0, RandInt(-100,100)/100)
				local dist = 2800
				local nx,ny,nz = nx*dist, 1400, nz*dist
				local rose = self.rosePool:get()
				rose:setPosition(nx,ny,nz)
				
				local tx,ty,tz = NormalizeVector(RandInt(-100,100)/100, 0, RandInt(-100,100)/100)
				local tDist = RandInt(0, 2500)
				tx,ty,tz = tx*tDist, 0, tz*tDist
				local time = GetDistance(tx,ty,tz, nx,ny,nz) / 3000
				rose:readyForThrow()
				ShootEntityAtTarget(rose, nx,ny,nz, tx,ty,tz, time)
				
				self:killTimer(data)
				self:createTimer(RandInt(self.roseDropMinTime,self.roseDropMaxTime), self.TIMER_ROSE_DROP)
			end
		else
			%Ob.Parent.onTimer(self,data,from)
		end
	end
	
--**************************************************************************************************
	
	function Ob:getHintResponse()			
		if (self.bull.phase == 1) then
			return {
				{
					voice = "/GLAR005FO/"--DIALOG=<<You can TK those spears into that bull, well, see if that slows him down.>>
				},
			}
		elseif (self.bull.phase == 2) then
			if (self.bMatadorConfusedOnce ~= 1) then
				return {
					{
						voice = "/GLAR006FO/"--DIALOG=<<Man, get those spears out of Edgar\'s back! What kind of friend are you?>>
					},
					{
						voice = "/GLAR007FO/"--DIALOG=<<And see if you can confuse that matador.>>
					},				
				}
			else
				return {
					{
						voice = "/GLAR008FO/"--DIALOG=<<While that matador thinks he\'s a bull, he\'s probably vulnerable like a bull. >>
					},
					{
						voice = "/GLAR009FO/"--DIALOG=<<Try sticking him with those barbed poles.>>
					},	
					{
						voice = "/GLAR010MA/"--DIALOG=<<Banderillas! Use the word!>>
					},				
				}
			end
		end
	end

--**************************************************************************************************

	return Ob
end
