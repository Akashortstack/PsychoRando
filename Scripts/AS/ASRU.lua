function ASRU(Ob)
	if not Ob then
		Ob = CreateObject('AS.ASLevelScript')
		Ob.dependencies = {
			animations = {
				'Anims/DartNew/DragonRoarReaction.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Knockforward.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/MeleeArms/TK/Grab.jan',
				'Anims/DartNew/MeleeArms/TK/Lift.jan',
				'Anims/DartNew/Raz_menaceLobotoArm.jan',
				'Anims/TK_Mover/Land.jan',
				'Anims/TK_Mover/Tumble.jan',
				'Anims/TK_Mover/Wobble.jan',
				'anims/Dartnew/tk_turn.jan',		
			}
		}
		
		Ob.Dart = nil
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.drumSnd = 0
		Ob.ended = nil
		Ob.theme = 'MCTankBoss'
		
		Ob.tvname1 = 'tv_domain1'	--	Beach and Cliff
		Ob.tvname2 = 'tv_domain2'	--	Boyd and Main Gate
		Ob.tvname3 = 'tv_domain3'	--	Fountain Courtyard
		Ob.tvname4 = 'tv_domain4'	--	Arena
    
		Ob.domain1 = 'CliffDOMAIN'
		Ob.domain2 = 'BoydGateDOMAIN'
		Ob.domain3 = 'CourtyardDOMAIN'
		Ob.domain4 = 'AsylumBaseDOMAIN'
		Ob.domain5 = 'ArenaDOMAIN'
		Ob.levelType = 'real'
		Ob.bBossBattle = 1
	end
		

-- ****************************************************************************

	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		--Global:setLevelToCompleted('TH')
		--Global:setLevelToCompleted('WW')
		--Global:setLevelToCompleted('BV')

		-- once you see the brain tank, no more going back to CAJA
		Global:saveGlobal('bFordReturnToCAJADisabled',1)
		
		%Ob.Parent.onBeginLevel(self)
		
		self.oldTK_Max_Distance = Global.player.TK_Max_Distance
		Global.player.TK_Max_Distance = 1200
		
--		self.slime = SpawnScript('AS.Props.Slime', 'Slime')
		self.tank = SpawnScript('AS.Characters.TKBrainTank', 'TKBrainTank')
		SetSkyBox('Levels/AS_Asylum/ASGR_Skybox.plb')		
   	
		RegisterTriggerVolume( self, self.tvname1 )
    	RegisterTriggerVolume( self, self.tvname2 )
    	RegisterTriggerVolume( self, self.tvname3 )
    	RegisterTriggerVolume( self, self.tvname4 )
		
		self.water = FindScriptObject('AS_WaterPlane')
		if (self.water ~= nil) then
			SetEntityDomain(self.water,self.domain1)		
		end
																	    	   
		self.battleBegun = 0		
		self.tankSphere = TriggerSphere_New(0,0,0, 2000)
		Trigger_RegisterListener(self.tankSphere, self)				

        if( not self.ToxicFX ) then
			self.ToxicFX = SpawnScript('AS.Effects.ASUP_ToxicFX','ToxicFX','',1)
		end
		self.ToxicFX:run()

		Global.goalManager:activate('DefeatBrainTank2')
	end
	
	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)	
		TriggerSphere_SetPosition(self.tankSphere, self.tank.centerX, self.tank.centerY, self.tank.centerZ)		
		if (Global:loadGlobal('RazIsABrainNow') == 1) then
			self.tank:setState('RazIsABrainNowStuff')
		elseif (Global:loadGlobal('RazIsAlmostABrainNow') == 1) then
			self.tank:setState('RazKilledTankButIsNotYetABrainStuff')
		else
			self:setState('IntroScenes')
		end		
	end
	
	function Ob:stateIntroScenes()
		if (Global:loadGlobal('bSavedLili') ~= 1) then
			--Give Raz lili's brain
			Global.player:incrementMaxHealth(1)
			Global:saveGlobal('bSavedLili', 1)
		end
		self:playVideo('cutscenes/prerendered/asca.xmv')		
		self.tank:hideHealthBar()
		Global.cutsceneScript:runCutscene('ASRUIntro',0,0,0)
		self.battleBegun = 1
		self:setState(nil)
	end

	function Ob:onEndLevel()
		%Ob.Parent.onEndLevel(self)	
		Global.player.TK_Max_Distance = self.oldTK_Max_Distance
	end

-- ************************************************************************************************

	function Ob:onEnteredTriggerVolume(data,from)
		if (data == self.tvname1 and from == Global.player) then            
            DomainSleep( self.domain1, 0 )
            DomainSleep( self.domain2, 0 )
            DomainSleep( self.domain3, 0 )
            DomainSleep( self.domain4, 1 )
            DomainSleep( self.domain5, 1 )
        elseif (data == self.tvname2 and from == Global.player) then
            DomainSleep( self.domain1, 0 )
            DomainSleep( self.domain2, 0 )
            DomainSleep( self.domain3, 0 )
            DomainSleep( self.domain4, 0 )
            DomainSleep( self.domain5, 1 )
        elseif (data == self.tvname3 and from == Global.player) then
            DomainSleep( self.domain1, 1 )
            DomainSleep( self.domain2, 0 )
            DomainSleep( self.domain3, 0 )
            DomainSleep( self.domain4, 0 )
            DomainSleep( self.domain5, 0 )
        elseif (data == self.tvname4 and from == Global.player) then
            DomainSleep( self.domain1, 1 )
            DomainSleep( self.domain2, 1 )
            DomainSleep( self.domain3, 1 )
            DomainSleep( self.domain4, 0 )
            DomainSleep( self.domain5, 0 )
		elseif (data == self.tankSphere and from == Global.player and self.battleBegun ~= 1) then
			--self.battleBegun = 1
			--self.tank:startBattle()
        end
		
	end
	
-- **********************************************************************************************************

	function Ob:getHintResponse()
		return {
			{
				voice = "/GLAS000FO/",--DIALOG=<<You have to TK rubble against rubble!>>
			},
			{
				voice = "/GLAS001FO/",--DIALOG=<<Break a hole big enough in the first ring so you can get in and set fire to the inner ring.>>
				},
			{
				voice = "/GLAS002FO/",--DIALOG=<<Then TK a hunk of masonry right on that idiot\'s brain!>>
			},
		}
	end    
	return Ob
   
end

