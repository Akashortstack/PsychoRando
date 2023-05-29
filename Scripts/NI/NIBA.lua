--		NIBA.lua
--
--      
--
--
--      for   P S Y C H O N A U T S
--      (c) Double Fine Productions
--      Proprietary and Confidential
--
--      Amy Unger
---------------------------------------------------------------------------------

function NIBA(Ob)
	
	-- Constructor
	if (Ob == nil) then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			meshes = {
				'Characters/Fishbowl_Braintank.plb',
			},
			animations = {
				'Anims/BreakawayBraintank/ConfusionGrenade.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims\Thought_Bubble\MidAirMountBubble.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/StrafeBack.jan',
				'anims/DartNew/StrafeLeft.jan',
				'anims/DartNew/StrafeRight.jan',
				'anims/DartNew/TumbleForward.jan',
			}
		}
		Ob.theme = 'BrainTank'
		Ob.bBossBattle = 1
	end
	
	function Ob:onBeginLevel()
		--Global:setLevelToCompleted('MI')
		--Global:saveGlobal('NIPhase', 4)

		%Ob.Parent.onBeginLevel(self)
		
		SetSkyBox('Levels/SkyBox/NI_Battlefield_Skybox.plb')
		
		Global.player:addSpamListener('RazRespawn', self)

		Global.goalManager:activate('DefeatBrainTank1')
		
		
		self.arrows = FindScriptObject('arrows')
		--SetCollideLayer(self.arrows, LAYER_NIBA_ARROWS, 1)
		SetPhysicsFlag(self.arrows, PHYSICS_COLLIDEE, 0)
		SetEntityAlpha(self.arrows, 0.75, 0)
		
		Global.camControl:pushAndSetChase(self, nil, 8)
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		self.brainTank = FindScriptObject('BrainTank')
		Global.levelScript.cutsceneScript:faceToFace(Global.player, self.brainTank, 20000, 1, 0)
		
		Global.camControl:setSecondaryTarget(self.brainTank, kSECONDARYFLAG_AUTO_ROTATE, 1)

		MoveCameraToIdeal()
		if Global:load('introNIBACSPlayed') == 1 then
			self:setState(nil)
		else
			self:setState('Intro')
		end

	end

-- ***********************************************************************************************

	function Ob:stateIntro()
		self:setLevelTheme(self.theme)
		Global.levelScript.cutsceneScript:fadeToBlack(0)
		self:playVideo('cutScenes/prerendered/nibl.xmv', nil, 43333)
		Global.levelScript.cutsceneScript:fadeIn(1)
		Global:save('introNIBACSPlayed', 1)
		MoveCameraToIdeal()
		self:setState(nil)
	end

-- ***********************************************************************************************
	function Ob:stateLevelDone()
		-- stop all sounds
		StopAllSounds()
		self:playVideo('cutScenes/prerendered/nien.xmv')
		--Killed brain tank, which means done with Sasha's advanced training!  Yes!!!
		Global.goalManager:activate('MeetLili')
		Global:setLevelToCompleted('NI')
		self:loadNewLevel('CASA',0,1)
		self:setState(nil)
	end

-- ***********************************************************************************************

	function Ob:finishedBattle()
		self:setState('LevelDone')
	end
-- ***********************************************************************************************	

	function Ob:listenerRazRespawn()
--		if Global.player.stats.dartLives > 0 then
--			-- reset battle
--			FindScriptObject('BrainTank'):resetBattle()
--		end

		self:setState('RespawnRaz')
	end
	
-- ***********************************************************************************************	
	
	function Ob:stateRespawnRaz()
 		while (Global.player.respawnMilestone < Global.player.RESPAWN_FADEDTOBLACK) do Yield() end
		
		self.brainTank.hp = self.brainTank.maxHP
		self.brainTank:setHealthBar(1)
		self:setState(nil)
	end

-- ***********************************************************************************************	

	function Ob:getHintResponse()		
		if (self.brainTank and self.brainTank.bBlossom == 1) then 
			-- death blossom mode
			return {
				{
					voice = "/GLAM009FO/"--DIALOG=<<Get as high as you can, and float in shooting!>>
				},
			}
		else
			-- regular fight
			return {
				{
					voice = "/GLAM006FO/"--DIALOG=<<You can hide behind those pillars to break his target-locking on you.>>
				},
				{
					voice = "/GLAM007FO/"--DIALOG=<<Wait until he rears up to charge, and then blast him in his soft pink underbelly!>>
				},
				{
					voice = "/GLAM008FO/"--DIALOG=<<And then when he\'s upside down, get him!>>
				},
			}				
		end
	end	

-- ***********************************************************************************************	

	return Ob
end

