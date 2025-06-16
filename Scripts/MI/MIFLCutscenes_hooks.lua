function MIFLCutscenes_hooks(Ob)

    function Ob:stateIntro()
		Global.player:loadAnim('anims/dartnew/default_pose_lf.jan',0,0)

		self.milla:sayLine("/MITU001MI/", 1, 1) -- DIALOG=<<Look who made the scene!>>
		Global.player:sayLine("/MITU301RA/", 1, 1) -- DIALOG=<<Agent Vodello? Where are you?>>
		
		self:cutTo(-18690,6678,38619,8,44,0)	-- cut to milla on TV
		self.milla:sayLine("/MITU003MI/", 1, 1) -- DIALOG=<<On TV of course!  Where I was always meant to be!>>
		self.milla:sayLine("/MITU004MI/", 1, 1) -- DIALOG=<<I mean look at my hair darling.  How can hair this fabulous not be on TV?>>
		self.milla:sayLine("/MITU200MI/", 1, 1) -- DIALOG=<<Now darling, the best way to learn Levitation is to just try it!>>
		self.milla:sayLine("/MITU201MI/", 1, 1) -- DIALOG=<<I'm going to give you a Levitation Learner's Permit.  It will only work while you're in my mind.>>
		
		--[[Vanilla game tries to teach Raz levitation here, remove it
		
        local powerAdderFaker = SpawnScript('ScriptBase','PowerAdderFaker')		
		powerAdderFaker.pickupSpriteName = 'LearnersPermit_Levitation.tga'
		powerAdderFaker.displayName = "/MIZB000TO/"--DIALOG=<<Levitation Learner\'s Permit>>
		Global.player.invDisplayer:invItemAdded(powerAdderFaker,0,0,1,1,1)
		
		EnablePower(kPOWER_LEVITATION, 1)
		MapPowerToButton(kPOWER_LEVITATION,kQUICKPICK_WHITE)
		]]
		self.milla:sayLine("/MITU202MI/", 1, 1) -- DIALOG=<<After you finish my course, I'll give you the real thing, baby.>>
		self.milla:sayLine("/MITU203MI/", 1, 1) -- DIALOG=<<First you gotta show me that you know how to use it!>>

		--Show quentin making the jump
		self:sleep(0.5)
		self:cutTo(-18575.19, 6803.75, 38414.1, -7.88, -8.4, 0)
		self.quentin:firstJump()
		self:sleep(2.5)
		self:camPathTo(-19276.9, 7519.33, 37041.46, -23.21, -23.97, 0, nil, 4, 0.25, 0.5, 1)
		self:sleep(1.0)

		Global.levelScript.bIntroCSPlayed = 1
		self:setState('CleanupCSIntro')
	end
end