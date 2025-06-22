function RankPowerManager_hooks(Ob)

    --[[This table normally enables specific abilities and Power Upgrades based on Raz's rank.
    We want these to be tied to Progressive Powers instead, so most have been removed
    Also adjusted the Text that shows on screen
    ]]
    Ob.rankPowerTables = {
        --First rank has powers that are Nil just to use as a guide.
        [1] = { 
            -- Any nil power modifiers have been changed to their lowest level powers for debug
            -- purposes (when rank isn't high enough but the power is attempted anyway.
            ConfusionRadius = 2,
            ConfusionDuration = 4,
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
            Encouragement = "Next Item at Rank 5",

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
        --[[remove powers and upgrades from rank up,
        Custom Encouragements, NEED LOCALIZATION
        ]]
        [5] = {
            Encouragement = "Next Item at Rank 10", 
        },
        [10] = {
            --PsiPower = kPOWER_FIRESTARTING,
            Encouragement = "Next Item at Rank 15", 
        },
        [15] = {
            Encouragement = "Next Item at Rank 20", 
        },
        [20] = { 
            --PsiPower = kPOWER_TELEKINESIS,
            Encouragement = "Next Item at Rank 25",
        },
        [25] = {
            Encouragement = "Next Item at Rank 30", 
        },
        [30] = { 
            --PsiPower = kPOWER_INVISIBILITY,
            Encouragement = "Next Item at Rank 35",
        },
        [35] = {
            Encouragement = "Next Item at Rank 40", 
        },
        [40] = { 
            --bChainBlast = 1,
            Encouragement = "Next Item at Rank 45",
        },
        [45] = {
            Encouragement = "Next Item at Rank 50", 
        },
        [50] = {
            --bSpikeBall = 1,
            Encouragement = "Next Item at Rank 55",
        },
        [55] = {
            Encouragement = "Next Item at Rank 60", 
        },
        [60] = { 
            --InvisDuration = 20,
            Encouragement = "Next Item at Rank 65",
        },
        [65] = {
            Encouragement = "Next Item at Rank 70", 
        },
        [70] = { 
            --bSuperChainBlast = 1,
            Encouragement = "Next Item at Rank 75",
        },
        [75] = {
            Encouragement = "Next Item at Rank 80", 
        },
        [80] = { 
            --bDamageShield = 1,
            Encouragement = "Next Item at Rank 85",
        },
        [85] = {
            Encouragement = "Next Item at Rank 90", 
        },
        [90] = { 
            --bHealthRegeneration = 1,
            Encouragement = "Next Item at Rank 95",
        },
        [95] = {
            Encouragement = "Next Item at Rank 101", 
        },
        [101] = { 
            bInfiniteAmmo = 1,
            bMaxPsycadetRank = 1,
            Encouragement = '',
        },
	}

    --[[Enable Progressive Powerups]]
    local setRank_original = Ob.setRank
    function Ob:setRank(newRank, bSilent)
        %setRank_original(self, newRank, bSilent)

		--PsiBlast Upgrades
		if (Global:loadGlobal('bChainBlast') == 1) then
			self:setbChainBlast(1, 1)
		end
		if (Global:loadGlobal('bSuperChainBlast') == 1) then
			self:setbSuperChainBlast(1, 1)
		end

		--Levitation Upgrades
		if (Global:loadGlobal('bSpikeBall') == 1) then
			self:setbSpikeBall(1, 1)
		end
		if (Global:loadGlobal('bSuperSpikeBall') == 1) then
			self:setbSuperSpikeBall(1, 1)
		end

		--Shield Upgrades
		if (Global:loadGlobal('bSuperShield') == 1) then
			self:setSuperShield(1, 1)
		end
		if (Global:loadGlobal('bDamageShield') == 1) then
			self:setbDamageShield(1, 1)
		end

		--Pyrokinesis/Firestarting Upgrade
		if (Global:loadGlobal('bPKDetonate') == 1) then
			self:setbPKDetonate(1, 1)
		end

		--Telekinesis Upgrade
		if (Global:loadGlobal('bTelekinesisUp') == 1) then
			self:setTKRange(6, 1)
			self:setTKDamage(2, 1)
		end

		--Confusion Upgrade
		if (Global:loadGlobal('bConfusionUp') == 1) then
			self:setConfusionDuration(8, 1)
		end

		--Invisibility Upgrade
		if (Global:loadGlobal('bInvisUp') == 1) then
			self:setInvisDuration(20, 1)
		end

		--Clairvoyance Upgrade, Health Regen
		if (Global:loadGlobal('bClairUp') == 1) then
			self:setbHealthRegeneration(1, 1)
		end

		--Palm Bomb Upgrade, Super Slam
		if (Global:loadGlobal('bAirMeleeCharge') == 1) then
			self:setbAirMeleeCharge(1, 1)
		end
    end

    --FULL FUNCTION OVERRIDE
    --[[This function normally activates goals related to acquiring the Cobweb Duster once you reach Rank 20
    Removing this entirely]]
    function Ob:onRank(rank, bSilent)
	    --do nothing
	end


end