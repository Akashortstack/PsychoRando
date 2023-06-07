--*
--*              'RankPowerManager.lua'
--*					
--*
--*       from  P S Y C H O N A U T S
--*
--*  (c) 2003 Double Fine Productions, Inc.
--*            All Rights Reserved.
--*        Proprietary and Confidential...
--*


function RankPowerManager(Ob)
	if not Ob then
		Ob = CreateObject('ScriptBase')
		
		Ob.confusionDurationUpgradeValue = 8
		Ob.TKRangeUpgradeValue = 6		

		Ob.rankPowerTables = {
			--First rank has powers that are Nil just to use as a guide.
			[1] = { 
				-- Any nil power modifiers have been changed to their lowest level powers for debug
				-- purposes (when rank isn't high enough but the power is attempted anyway.
				ConfusionRadius = 2,
				ConfusionDuration = 4,
				-- trying this out at zero for now
				PKCooldown = 0,
				PKHeatRate = 1.3,
				InvisCooldown = 10,
				InvisDuration = 10,
				PsiBlastDamage = 2,
				PsiPunchDamage = 1,
				ShieldCooldown = 2,
				ShieldDuration = 4,
				TKRange = 4,
				TKDamage = 1,
				--edit Custom Encouragement, NEED LOCALIZATION
				Encouragement = "Next Item at Rank: 10",

				bAirMeleeCharge = 0,
				bPKDetonate = 0,
				SuperShield = 0,
				bSpikeBall = 0,
				bChainBlast = 0,
				bSuperChainBlast = 0,
				bSuperSpikeBall = 0,
				bDamageShield = 0,
				bHealthRegeneration = 0,
				bInfiniteAmmo = 0,
				bMaxPsycadetRank = 0,
			},
			--[[ --edit to remove powers and upgrades from rank up,
			Custom Encouragements, NEED LOCALIZATION
			]]
			[10] = {
				--PsiPower = kPOWER_FIRESTARTING,
				Encouragement = "Next Item at Rank: 20", 
			},
			[20] = { 
				--PsiPower = kPOWER_TELEKINESIS,
				Encouragement = "Next Item at Rank: 30",
			},
			[30] = { 
				--PsiPower = kPOWER_INVISIBILITY,
				Encouragement = "Next Item at Rank: 40",
			},
			[40] = { 
				--bChainBlast = 1,
				Encouragement = "Next Item at Rank: 50",
			},
			[50] = {
				--bSpikeBall = 1,
				Encouragement = "Next Item at Rank: 60",
			},
			[60] = { 
				--InvisDuration = 20,
				Encouragement = "Next Item at Rank: 70",
			},
			[70] = { 
				--bSuperChainBlast = 1,
				Encouragement = "Next Item at Rank: 80",
			},
			[80] = { 
				--bDamageShield = 1,
				Encouragement = "Next Item at Rank: 90",
			},
			[90] = { 
				--bHealthRegeneration = 1,
				Encouragement = "Next Item at Rank: 100",
			},
			[100] = { 
				bInfiniteAmmo = 1,
				bMaxPsycadetRank = 1,
				Encouragement = '',
			},
		}

		--Set up power names		
		Ob.powerNames = {}
		Ob.powerNames[kPOWER_FIRESTARTING] = 'Firestarting'
		Ob.powerNames[kPOWER_TELEKINESIS] = 'Telekinesis'
		Ob.powerNames[kPOWER_INVISIBILITY] = 'Invisibility'

		Ob.dependencies = {
			textures = {
				'Textures/UI/Sayline Heads/Ford_BadgeHintIcon.tga',
				'Textures/FXTextures/PalmBombUpgradeHand_icon.tga',
				'Textures/icons/PsiPowers/marksmanship.tga',
				'Textures/icons/PsiPowers/Levitation.tga',
				'Textures/icons/PsiPowers/Firestarting.tga',
				'Textures/icons/PsiPowers/Shield.tga',
				'Textures/icons/PsiPowers/Invisibility.tga',
				'Textures/HUD/Brain_UPGRADE.tga',
			},
		}
	end

	--Sets Raz's rank to 1 by default.
	function Ob:onSpawn()
		%Ob.Parent.onSpawn(self)
		self:reset()
	end

	--Resets rank back to 1st level
	function Ob:reset()
		if (self.bInfiniteAmmo == 1) then
			-- kind of a hack... this is so that we can go backwards in rank for testing purposes
			Global.player.stats.psiBlastAmmo = 30
			Global.player.stats.psiBlastMaxAmmo = 30
			SetPsiBlastAmmo(30)	-- don't cal the Global.player version here - we want to make sure it gets to the engine
			Global.player.stats.confusionAmmo = 5
			Global.player.stats.confusionMaxAmmo = 5
		end
		self.ConfusionRadius = nil
		self.ConfusionDuration = nil
		self.PKCooldown = nil
		self.PKHeatRate = nil
		self.InvisCooldown = nil
		self.InvisDuration = nil
		self.PsiBlastDamage = nil
		self.PsiPunchDamage = nil
		self.ShieldCooldown = nil
		self.ShieldDuration = nil
		self.TKRange = nil
		self.TKDamage = nil
		self.bAirMeleeCharge = 0
		self.bPKDetonate = 0
		self.SuperShield = nil
		self.bSuperChainBlast = nil
		self.bSuperSpikeBall = nil
		self.bDamageShield = nil
		self.bHealthRegeneration = nil
		self.bInfiniteAmmo = nil
		
		self.bMaxPsycadetRank = nil
		
		self.bGotPower = 0
		
		self.currentRank = 0
	end
		
	--Sets Raz's current rank, which will in turn change the strength of his powers.	
	--	newRank:  The new rank value to set him at.
	--	bSilent:  If true (1), then the change will happen without notifying the player at all.
	function Ob:setRank(newRank, bSilent)
		
		--If set to a lower rank, then reset rank first
		if(newRank < self.currentRank) then self:reset() end

		--Start from the current rank, and go through all ranks up to the new rank.
		local powerTable = nil
		self.bGotPower = 0
		for index = self.currentRank + 1, newRank, 1 do
			--If there is a rank table for this rank, then process it.
			if(self.rankPowerTables[index]) then
				--Loop through all power modifiers in this rank table, and set them accordingly.
				for key, value in self.rankPowerTables[index] do
					--This will set the appropriate power modifier, and call the setXXX method, where 
					--XXX is the name of the power modified.
					--GamePrint( 'Setting '..key..' to '..value )
					self[key] = value
					self['set'..key](self, value, bSilent)
				end
			end

			--Keep all rank specific functionality in a separate function
			self:onRank(index, bSilent)
		end
		
		if (bSilent ~= 1) then
			local rankupSound
			if (self.bGotPower ~= 1) then
				local encouragementString = Global:loadGlobal('NextEncouragement')
				if( nil ~= encouragementString ) then
					RankupCheerNoPower(100,80, encouragementString)
				end
				rankupSound = LoadSound('RankUp')
			else
				rankupSound = LoadSound('RankUpPsi')
			end
			if (rankupSound) then
				if IsSoundPlaying(rankupSound) ~= 1 then
					PlaySound(nil, rankupSound, 0)
				end
			else
				GamePrint('Couldn\'t find rankup sound!!!')
			end
		end
		
		self.currentRank = newRank

		--EDIT checks player for Progressive Powerups

		--PsiBlast Upgrades
		if (Global:loadGlobal('bChainBlast') == 1) then
			self:setbChainBlast(1, 1)
			GamePrint('ChainBlast Enabled!')
		end
		if (Global:loadGlobal('bSuperChainBlast') == 1) then
			self:setbSuperChainBlast(1, 1)
			GamePrint('SuperChainBlast Enabled!')
		end

		--Levitation Upgrades
		if (Global:loadGlobal('bSpikeBall') == 1) then
			self:setbSpikeBall(1, 1)
			GamePrint('SpikeBall Enabled!')
		end
		if (Global:loadGlobal('bSuperSpikeBall') == 1) then
			self:setbSuperSpikeBall(1, 1)
			GamePrint('SuperSpikeBall Enabled!')
		end

		--Shield Upgrades
		if (Global:loadGlobal('bSuperShield') == 1) then
			self:setSuperShield(1, 1)
			GamePrint('SuperShield Enabled!')
		end
		if (Global:loadGlobal('bDamageShield') == 1) then
			self:setbDamageShield(1, 1)
			GamePrint('DamageShield Enabled!')
		end

		--Pyrokinesis/Firestarting Upgrade
		if (Global:loadGlobal('bPKDetonate') == 1) then
			self:setbPKDetonate(1, 1)
			GamePrint('bPKDetonate Enabled!')
		end

		--Telekinesis Upgrade
		if (Global:loadGlobal('bTelekinesisUp') == 1) then
			self:setTKRange(6, 1)
			self:setTKDamage(2, 1)
			GamePrint('TelekinesisUp Enabled!')
		end

		--Confusion Upgrade
		if (Global:loadGlobal('bConfusionUp') == 1) then
			self:setConfusionDuration(8, 1)
			GamePrint('ConfusionUp Enabled!')
		end

		--Invisibility Upgrade
		if (Global:loadGlobal('bInvisUp') == 1) then
			self:setInvisDuration(20, 1)
			GamePrint('InvisUp Enabled!')
		end

		--Clairvoyance Upgrade, Health Regen
		if (Global:loadGlobal('bClairUp') == 1) then
			self:setbHealthRegeneration(1, 1)
			GamePrint('ClairUp Enabled!')
		end
	end
	
	--Put any special code you need for a certain rank inside of this function
	function Ob:onRank(rank, bSilent)
		--edit increased rank to 30
		if (rank == 30) and (Global:isInInventory('CobwebDuster') ~= 1) then
			Global.goalManager:activate('CobwebDuster', bSilent)
			if (Global:isInInventory('DowsingRod') ~= 1) then
				Global.goalManager:activate('GetDowsingRod', bSilent)
			elseif (Global.player.stats.arrowheads < 800) then
				Global.goalManager:activate('UseDowsingRod', bSilent)
			end
		end
	end
	
	function Ob:setConfusionRadius(value)
		--Used in ConfusionGrenade.lua
		--Multiply by 100 to make radius actually viable.
		self.ConfusionRadius = self.ConfusionRadius * 100
	end

	function Ob:setbAirMeleeCharge(value, bSilent)
		self.bAirMeleeCharge = value
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF020TO/", 'Textures/FXTextures/PalmBombUpgradeHand_icon.tga', 0, 'YouWin') --DIALOG=<<PALM BOMB POWERUP!  After you start a PALM BOMB, hit /MeleeButton/ as quickly as possible for bonus damage!>>
		end
	end

	function Ob:setbSpikeBall(value, bSilent)
		self.bSpikeBall = value
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF021TO/", 'Textures/icons/PsiPowers/Levitation.tga', 0, 'YouWin') --DIALOG=<<LEVITATION POWERUP!  At full speed, your thought bubble is now a deadly weapon>>
		end
	end

	function Ob:setbChainBlast(value, bSilent)
		self.bChainBlast = value
		Global.player.bChainBlast = value
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF022TO/", 'Textures/icons/PsiPowers/marksmanship.tga', 0, 'YouWin') --DIALOG=<<PSI BLAST POWERUP!  If you hold /XButton/ while psi blasting, you can hit multiple enemies.>>
		end
	end

	function Ob:setConfusionDuration(value, bSilent)
		--Used in ConfusionGrenade.lua
		if (bSilent ~= 1) and (value == self.confusionDurationUpgradeValue) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF042TO/", 'Textures/icons/PsiPowers/Confusion.tga', 0, 'YouWin') --DIALOG=<<SENSORY SCRAMBLE! You further cloud your enemies' minds, and Confusion lasts twice as long.>>
		end
	end
	
	function Ob:setbSuperChainBlast(value, bSilent)
		self.bSuperChainBlast = value
		if (bSilent ~= 1) and (value == 1) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF047TO/", 'Textures/icons/PsiPowers/marksmanship.tga', 0, 'YouWin') --DIALOG=<<SUPER CHAIN BLAST! Your Chain Blast can now hit up to 6 enemies in a row!>>
		end
	end
	
	function Ob:setbSuperSpikeBall(value, bSilent)
		self.bSuperSpikeBall = value
		if (bSilent ~= 1) and (value == 1) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF040TO/", 'Textures/icons/PsiPowers/Levitation.tga', 0, 'YouWin') --DIALOG=<<ROLLING HAVOC! Wrecking Ball activates as soon as you start rolling on the Psi-Ball.>>
		end
	end
	
	function Ob:setbDamageShield(value, bSilent)
		self.bDamageShield = value
		if (bSilent ~= 1) and (value == 1) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF041TO/", 'Textures/icons/PsiPowers/Shield.tga', 0, 'YouWin') --DIALOG=<<FEROCIOUS AURA! Enemies who attack you at melee range while you're shielded now take 2x damage.>>
		end
	end
	
	
	function Ob:setbHealthRegeneration(value, bSilent)
		self.bHealthRegeneration = value
		if (bSilent ~= 1) and (value == 1) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF043TO/", 'Textures/HUD/Brain_UPGRADE.tga', 0, 'YouWin') --DIALOG=<<PSYCHIC REGENERATION! Your friends at camp are focusing their energy directly into you, and you'll now regenerate a quarter-brain of health every 15 seconds!>>
		end
		if (value == 1) then
			Global.player:initializeHealthRegeneration()
		else
			Global.player:stopHealthRegeneration()
		end
	end
	
	
	function Ob:setbInfiniteAmmo(value, bSilent)		
		self.bInfiniteAmmo = value
		if (self.bInfiniteAmmo == 1) then
			Global.player.stats.psiBlastAmmo = -1
			Global.player.stats.psiBlastMaxAmmo = -1
			SetPsiBlastAmmo(-1)	-- don't cal the Global.player version here - we want to make sure it gets to the engine
			Global.player.stats.confusionAmmo = -1
			Global.player.stats.confusionMaxAmmo = -1
		end
		
		if (bSilent ~= 1) and (value == 1) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF044TO/", 'Textures/icons/PsiPowers/marksmanship.tga', 0, 'YouWin') --DIALOG=<<INFINITE AMMO! By tapping into the raw power of the nearby Psitanium deposit, you've obtained infinite psychic ammo for Psi-Blast and Confusion.>>
		end
	end

	function Ob:setPKCooldown(value)
		Global.player.FirestartingCoolDown = value
	end

	function Ob:setbPKDetonate(value, bSilent)
		self.bPKDetonate = value
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF023TO/", 'Textures/icons/PsiPowers/Firestarting.tga', 0, 'YouWin') --DIALOG=<<PYROKINESIS POWERUP!  Press /MeleeButton/ after the heat gauge turns red for a massive explosion.>>
		end
	end

	function Ob:setPKHeatRate(value)
		--Used in ScriptBase:onFireBurn()
	end

	function Ob:setInvisCooldown(value)
		Global.player.InvisibilityCoolDown = value
	end

	function Ob:setInvisDuration(value, bSilent)
		Global.player.InvisibilityDuration = value
		if bSilent ~= 1 and value == 20 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF024TO/", 'Textures/icons/PsiPowers/Invisibility.tga', 0, 'YouWin') --DIALOG=<<INVISIBILITY POWERUP!  Invisibility will now last twice as long!>>
		end
	end

	function Ob:setPsiBlastDamage(value)
		--Changed in Censor:onPsiBlast().  More changes are necessary:

		--LungFish:onPsiBlast looks like it needs a change.
		--Harpie:onPsiBlast needs something too probably.
		--UltraCoach:psiBlasty
		--MegaCensor:onPsiBlast
		--MegaCensorBoil:onPsiBlast
		--BrainTank:onPsiBlast
		--AttackTendon:onPsiBlast
	end

	function Ob:setPsiPunchDamage(value)
		--Changed in Censor:onNewMoveMelee().  
		--More changes definitely necessary, likely in the same places as psi blast.
	end

	function Ob:setShieldCooldown(value)
		Global.player.PsiShieldCoolDown = value
	end

	function Ob:setShieldDuration(value)
		Global.player.PsiShieldDuration = value
	end

	function Ob:setTKRange(value, bSilent)
		--Multiply by a hundred to make units make sense.
		Global.player.TK_Max_Distance = value * 300

		if (bSilent ~= 1) and (value == self.TKRangeUpgradeValue) then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF038TO/", 'Textures/icons/PsiPowers/Telekinesis.tga', 0, 'YouWin') --DIALOG=<<TK EXTENSION! Your TELEKINESIS range has been extended!>>
		end
	end

	function Ob:setTKDamage(value)
		--Used in Censor:onTKRelease()
	end

	function Ob:setPsiPower(value, bSilent)
		--Dont do rank cheer if silent
		if( 1 ~= bSilent ) then		
			local winsound = LoadSound('YouWin')
			if IsSoundPlaying(winsound) ~= 1 then
				PlaySound(nil, LoadSound('YouWin'))
			end
			RankupCheerNewPower(100,80,'Ford','Textures/UI/Sayline Heads/Ford_BadgeHintIcon.tga')
			self.bGotPower = 1 --So that the other cheer doesn't play
			Global.goalManager:activate('NewPsiPower', bSilent)
		end
			
		--Find out if player has already aquired this power by talking to Ford
		local powerVariable = 'b'..self.powerNames[value]..'Available' -- eg: bFirestartingAvailable
		if (Global:loadGlobal(powerVariable) == 2) then
			EnablePower(value)
		else
			Global:saveGlobal(powerVariable, 1)
		end
	end
	
	function Ob:setSuperShield(value, bSilent)
		--Will modify the shield if necessary
		if (Global.player.rPsiShield) then
			Global.player.rPsiShield:setSuper(value)
		end
		
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF048TO/\n/GLZF025TO/", 'Textures/icons/PsiPowers/Shield.tga', 0, 'YouWin') --DIALOG=<<SHIELD POWERUP!  Your shield will now knock back any enemies who strike at you.>>
		end
	end
	
	function Ob:setbMaxPsycadetRank(value, bSilent)
		if bSilent ~= 1 and value == 1 then
			Global.levelScript:addTutorialBox("/GLZF016TO/", nil, 0, 'YouWin')--DIALOG=<<CONGRATULATIONS! You have achieved the HIGHEST POSSIBLE PSYCHADET RANK!!! Wooo!>>
			JournalAddMovie('cutscenes/prerendered/asah')
		end
	end
	
	-- returns the next power to be taught. returns nil if none have are ready to be learned
	function Ob:getPowerToBeTaught()
		if (Global:loadGlobal('bFirestartingAvailable') == 1) then
			return kPOWER_FIRESTARTING, self.powerNames[kPOWER_FIRESTARTING]
		elseif (Global:loadGlobal('bTelekinesisAvailable') == 1) then
			return kPOWER_TELEKINESIS, self.powerNames[kPOWER_TELEKINESIS]
		elseif (Global:loadGlobal('bInvisibilityAvailable') == 1) then
			return kPOWER_INVISIBILITY, self.powerNames[kPOWER_INVISIBILITY]
		else
			return nil		
		end
		--Found nothing, return nil
		return nil
	end
	
	-- saves a rank based power as aquired
	function Ob:powerTaught(power)
		local powerVariable = 'b'..self.powerNames[power]..'Available' -- eg: bFirestartingAvailable
		Global:saveGlobal(powerVariable, 2)
	end

	function Ob:setEncouragement(value)
		Global:saveGlobal('NextEncouragement', value)
	end

	return Ob
end
