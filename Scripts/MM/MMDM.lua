function MMDM(Ob)
	if not Ob then
		Ob = CreateObject('LevelScript')
		Ob.dependencies = {
			scripts = {
				--Make sure all props are preloaded, because they can be brought back and forth between levels
				'MM.Props.PropHelmet',
				'MM.Props.PropPhone',
				'MM.Props.PropFlowers',
				'MM.Props.PropHedgeTrimmers',
				'MM.Props.PropPlunger',
				'MM.Props.PropRifle',
				'MM.Props.PropRollingPin',
				'MM.Props.PropSign',
				'MM.Props.PropWaterCan',
                'MM.Props.Feather',
			},
			animations = {
				'Anims/DartNew/BodyParts/Hold_MM_Flowers.jan',
				'Anims/DartNew/BodyParts/Hold_MM_GodsEye.jan',
				'Anims/DartNew/BodyParts/Hold_MM_HedgeTrimmers.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Phone.jan',
				'Anims/DartNew/BodyParts/Hold_MM_PilotHelmet.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Plunger.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Rifle.jan',
				'Anims/DartNew/BodyParts/Hold_MM_RollingPin.jan',
				'Anims/DartNew/BodyParts/Hold_MM_Sign.jan',
				'Anims/DartNew/BodyParts/Hold_MM_WaterCan.jan',
				'Anims/DartNew/BodyParts/PopperEmptyHold_ArmLf.jan',
				'Anims/DartNew/DamageBack_medium.jan',
				'Anims/DartNew/DamageLf.jan',
				'Anims/DartNew/DamageRt.jan',
				'Anims/DartNew/Death.jan',
				'Anims/DartNew/Melee/Chop1.jan',
				'Anims/DartNew/Melee/Chop2.jan',
				'Anims/DartNew/Melee/Crane.jan',
				'Anims/DartNew/OpenDreamFluff.jan',
				'Anims/DartNew/balloonrun.jan',
				'Anims/DartNew/balloonwalk.jan',
				'Anims/DartNew/balloonwalkslow.jan',
				'Anims/DenMother/DM_GodseyeLfIdle.jan',
				'Anims/DenMother/DM_GodseyeLfRotate.jan',
				'Anims/Dreamfluff/closed.jan',
				'Anims/Dreamfluff/open.jan',
				'Anims/Thought_Bubble/BallPop.jan',
				'Anims/Thought_Bubble/BubbleDoubleJump.jan',
				'Anims/Thought_Bubble/CloseThoughtBubble.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan',
				'Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan',
				'Anims/Thought_Bubble/MidAirMountBubble.jan',
				'Anims/Thought_Bubble/PsiFloatBubbleIdle.jan',
				'anims/DartNew/Respawn.jan',
				'anims/DartNew/TumbleForward.jan',
				'anims/objects/duster/Duster_spinner_Retract.jan',
			}
		}
	
		Ob.currespawnpoint = 1
		Ob.realworldpoint = 1
		Ob.curlevelstate = 1
		Ob.theme = 'MMDenMother'
		Ob.defaultAmbientSoundName = 'MMDMAmb'
		Ob.bBossBattle = 1
	end

-- ****************************************************************************

	function Ob:onBeginLevel()
		--Player must have gotten at least this far
		Global:setLevelToCompleted('LO')
		Global:saveGlobal('bGotClairvoyance', 1)
        
		%Ob.Parent.onBeginLevel(self)

		self.denMother = SpawnScript('MM.Characters.DenMother', 'DenMother')
		
		self:setState('Intro')
	end
	
	function Ob:stateIntro()
		Global.cutsceneScript:fadeToBlack(0)
		if (Global:load('MMDMIntroSeen') ~= 1) then
            self:playVideo('cutscenes/prerendered/MMDF.xmv')
			Global:save('MMDMIntroSeen', 1)
		end
		Global.cutsceneScript:fadeIn(.1)
		
		Global.camControl:pushAndSetChase(self, 500, 10, 200, 150)
		Global.camControl:setSecondaryTarget(self.denMother, nil, 0)
		SetChaseCameraAutoRotateRange(1, 90)

		Global.goalManager:activate('DenMother')
		
		self:setState(nil)
	end


	function Ob:getHintResponse()
		if (Global:load('bDenmomLightsOffPlayed') ~= 1) then
			self.showedLightsOnHints = 1
			return {
				{
					voice = "/GLAO026FO/",--DIALOG=<<Shoot those exploding cookie boxes.>>
				},
				{
					voice = "/GLAO027FO/",--DIALOG=<<And turn on your shield when you see her throwing stuff at you!>>
				}
			}
		else
			if (self.showedLightsOnHints == 1) then
				return {
					{voice = "/GLAO024FO/",},--DIALOG=<<You can\'t see in the dark but she can!>>
					{voice = "/GLAO025FO/",}--DIALOG=<<Clairvoyance will let you see what she sees!>>
				}
			else
				return {
					{voice = "/GLAO024FO/",},--DIALOG=<<You can\'t see in the dark but she can!>>
					{voice = "/GLAO025FO/",},--DIALOG=<<Clairvoyance will let you see what she sees!>>
					{voice = "/GLAO026FO/",},--DIALOG=<<Shoot those exploding cookie boxes.>>
					{voice = "/GLAO027FO/",}--DIALOG=<<And turn on your shield when you see her throwing stuff at you!>>
				}
			end			
		end
	end

	return Ob
end


