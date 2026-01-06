function Dart_hooks(Ob)

    --add New Timer for Vault Text
	Ob.TIMER_VAULT_REWARD = '1013'

    --add some custom stat names to track at the end of the list
    Ob.savedGlobalStatNames = {'scavengerHuntItems', 'numUnredeemedScavengerHuntItems', 
			'numRedeemedScavengerHuntItems', 'rank', 'cardsInInv', 'coresInInv', 'websInInv',
			'figmentPoints', 'brains', 'totalBrainsHeld', 'totalBrainsRedeemed', 'maxHealth', 'psiHealth', 'maxLives', 'dartLives', 'arrowheads', 'numUnredeemedPsitanium',
			'psiBlastMaxAmmo', 'psiBlastAmmo', 'totalVaults', 
			'confusionMaxAmmo', 'confusionAmmo',
			'cardsRedeemed','cobwebsRedeemed', 'bSaveGame', 'baggageMatched',
		    --achievement stats
		    'shownpokey', 'clairvoyanced',
			--Custom StatNames
			'CurrentSuitcaseTags', 'CurrentPurseTags', 'CurrentHatboxTags', 'CurrentSteamertrunkTags', 'CurrentDufflebagTags',
			'TotalSuitcase', 'TotalPurse', 'TotalHatbox', 'TotalSteamertrunk', 'TotalDufflebag',
			'RandoHatbox', 'RandoSuitcase', 'RandoPurse', 'RandoSteamertrunk', 'RandoDufflebag',
			'RandoHatboxTag', 'RandoSuitcaseTag', 'RandoPurseTag', 'RandoSteamertrunkTag', 'RandoDufflebagTag',
			'RandoLevitation', 'RandoClairvoyance', 'RandoConfusion', 'RandoFirestarting', 'RandoInvisibility', 'RandoMarksmanship', 'RandoShield', 'RandoTelekinesis',
			'ArrowheadBundleSmall', 'ArrowheadBundleMedium',
			'CollectedVault', 'RandoPsiCard', 'RandoPsiMarker', 'RandoLivesUp', 'RandoAmmoUp', 'RandoProp', 'BrainJar',
			--AP StatNames
			'APItem', 'APPlaceholder', 'APLastIndex',
			}

    
    --loads player stats at start of level
    local loadStats_original = Ob.loadStats
    function Ob:loadStats()
        %loadStats_original(self)
		--make PsiCores in inventory always equal 100
		self.stats.PSIChallengeCores = 100
		self.stats.coresInInv = 100
    end

    --FULL FUNCTION OVERRIDE
    --Some stats don't reset to 0; this handles that logic.
    --adding a long list of tables for randomizer item names to be stored
	function Ob:resetStat(statID)
		if statID == 'baggageCollected' or statID == 'bagTagsCollected' then
			-- baggage stats
			self.stats[statID] = {}   
			self.stats[statID].hatbox = 0
			self.stats[statID].suitcase = 0
			self.stats[statID].steamertrunk = 0
			self.stats[statID].purse = 0
			self.stats[statID].dufflebag = 0
		elseif statID == 'scavengerHuntItems' or statID == 'brains' or statID == 'vaultsFromLevel' or statID == 'shownpokey' or statID == 'clairvoyanced' then
			-- stats that reset to an empty table
			self.stats[statID] = {}
		elseif statID == 'rank' then
			-- stats that reset to 1
			self.stats[statID] = 1
		elseif statID == 'maxLives' then
			self.stats[statID] = 5
		elseif statID == 'dartLives' then
			self.stats[statID] = self.stats.maxLives or 5
		elseif statID == 'maxHealth' or statID == 'psiHealth' then
			self.stats[statID] = 12
		elseif statID == 'psiBlastMaxAmmo' then
			self.stats[statID] = 30
		elseif statID == 'psiBlastAmmo' then
			self.stats[statID] = self.stats.psiBlastMaxAmmo or 30
		elseif statID == 'confusionMaxAmmo' then
			self.stats[statID] = 5
		elseif statID == 'confusionAmmo' then
			self.stats[statID] = self.stats.confusionMaxAmmo or 5
		--adding all Rando Baggage as Tables
		elseif statID == 'RandoHatbox' or statID == 'RandoSuitcase' or statID == 'RandoPurse' or statID == 'RandoSteamertrunk' or statID == 'RandoDufflebag' then
			self.stats[statID] = {}
		--adding all Rando Baggage Tags as Tables
		elseif statID == 'RandoHatboxTag' or statID == 'RandoSuitcaseTag' or statID == 'RandoPurseTag' or statID == 'RandoSteamertrunkTag' or statID == 'RandoDufflebagTag' then
			self.stats[statID] = {}
		--adding Vaults, PsiCards, PsiMarkers, and ArrowheadBundles as Tables
		elseif statID == 'CollectedVault' or statID == 'RandoPsiCard' or statID == 'RandoPsiMarker' or statID == 'ArrowheadBundleSmall' or statID == 'ArrowheadBundleMedium' then
			self.stats[statID] = {}
		--adding all PsiPowers with Progressive powers as Tables
		elseif statID == 'RandoClairvoyance' or statID == 'RandoConfusion' or statID == 'RandoFirestarting' or statID == 'RandoInvisibility' or statID == 'RandoLevitation' or statID == 'RandoMarksmanship' or statID == 'RandoShield' or statID == 'RandoTelekinesis' then
			self.stats[statID] = {}
		--adding RandoLivesUp and RandoAmmoUp as Tables
		elseif statID == 'RandoLivesUp' or statID == 'RandoAmmoUp' then
			self.stats[statID] = {}
		--adding all RandoProp Items as Table
		elseif statID == 'RandoProp' then
			self.stats[statID] = {}
		--adding BrainJar Items as Table
		elseif statID == 'BrainJar' then
			self.stats[statID] = {}	
		--adding all APItem Items as Table
		elseif statID == 'APItem' then
			self.stats[statID] = {}
		--adding all APPlaceholder Items as Table
		elseif statID == 'APPlaceholder' then
			self.stats[statID] = {}
		--adding last item index from Archipelago
		elseif statID == 'APLastIndex' then
			self.stats[statID] = -1
		else
			self.stats[statID] = 0
		end
	end

    --FULL FUNCTION OVERRIDE
    --[[when Raz takes damage, this gets called after. 
    includes changes for Damage Multiplier and Instant Death
    ]]
    function Ob:adjustHealth(value,bDontPlaySound)
		if not value then
			GamePrint('ERROR: tried called dart.adjustHealth(nil)!')
			return nil
		end

		--Adjust value with damage multiplier, unless Instant Death
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if value < 0 and seedsettings.instantdeath == FALSE then
			value = (value*seedsettings.enemydamagemultiplier)
		end

		value = tonumber(value)
		
		--this will unset the paused chase cam, anytime raz is damaged (and possibly moved, or respawn)
		SetChaseCameraPaused(0)
		if ( self.bDartIsDying ~= 1) then
			self.stats.psiHealth = self.stats.psiHealth + value
			-- to keep Dart's health below maxHealth
			if (self.stats.psiHealth > self.stats.maxHealth) then
				self.stats.psiHealth = self.stats.maxHealth
			end
			if (self.stats.psiHealth < 0) then 
				self.stats.psiHealth = 0 
			end
			self:playWarningSound()
			AdjustPlayerMood(value)
		end
		
		--check for 1 Hit KO Setting, set health to 0 if true
		if seedsettings.instantdeath == TRUE then
			if (self.stats.psiHealth < self.stats.maxHealth) then
				self.stats.psiHealth = 0 
			end
		end

		if self.stats.psiHealth < 1 then
			GameLog('die1', self, value)
		end

		-- drop out if death routines , else continue with damage voice lines
		local fluffs = Global:loadGlobal('DreamFluffsInInv') or 0 
		if self.stats.psiHealth < 1 and fluffs > 0 then
			-- Find a dream fluff
			local fluff
			for k, v in Global.saved.Inventory['all'] do
				if v.Type == 'global.collectibles.DreamFluff' then
					fluff = FindScriptObject(k)
				end
			end
			if not fluff then
				GamePrint('ERROR: DreamFluffsInInv is greater than 0, but Raz has no fluffs!')
			else
				fluff:setState('UsePolitely')
			end
		elseif self.stats.psiHealth < 1 then
			--dart is dead and has no lives left
			--if dart has run out of health, but a cutscene just started playing, lets cheat and let the
			--cutscene play and not let raz die, and add 1 unit of health back to raz
			if (Global.cutsceneScript.cutscenePlaying == 1 or Global.levelScript.cutscenePlaying == 1) then
				self.stats.psiHealth = self.stats.psiHealth + 1
			else
				self:setState('DartDie')
			end
			return
		end
		
		if (value <= 0 and bDontPlaySound ~= 1) then
			self:sayRandomOuchLines()
		end
		
		return 1
	end


    --FULL FUNCTION OVERRIDE
    --Major change that will always return Raz to the CU when he dies. 
    --Vanilla can cause returns to the Kid's Cabins inside the real world, 
    --or next to the character's mind you're inside currently
    function Ob:stateDartDie()
		self.bUninterruptibleState = 0	
		
		self:stopSound(self.deathWarningSound)
		
		self:fireDissipate()

		self:callSpamListeners('DartDie')	

		self:killTimer( self.TIMER_CONFUSED )

		if (Global.levelScript:isTrainingLevel() ~= 1) then
			self.stats.dartLives = max(0,self.stats.dartLives - 1)
		end

		--return to CU when running out of lives, NO MATTER WHAT
		if self.stats.dartLives <= 0 then
			GamePrint('Dart has died and is out of lives. Returning to the CU.')

			self:deathSequence(1)
			
			Global:saveGlobal('bKickedOut', 1)
			Global.levelScript:returnToCU()
		else
			self:setState('Respawn')
		end
	end


    --when redeeming brains at ford's sanctuary, Checks victory condition to trigger victory
    --if brainhunt is a goal, meat circus not required, and beatoleander is either false or has been done already
    local onBrainRedeemed_original = Ob.onBrainRedeemed
    function Ob:onBrainRedeemed(brainID, from)
        %onBrainRedeemed_original(self, brainID, from)
		--load the settings
		local seedsettings = fso('RandoSeed', 'Randoseed')
		--find the matching seed folder in ModData
        local folderName = seedsettings.APfoldername
        local filePath = folderName.."/victory.txt"
        --check if enough brains have been redeeemed for victory
		if self.stats.totalBrainsRedeemed >= seedsettings.brainsrequired then
            --make sure brainhunt is our goal, and Meat Circus isn't required
		    if seedsettings.brainhunt == TRUE and seedsettings.requireMC == FALSE then
                --check if beatoleander is NOT our goal, OR Oleander already defeated
			    if seedsettings.beatoleander == FALSE or Global:loadGlobal('bOleanderDefeated') == 1 then
					--write victory to text file for client to read, Victory!
					local h = fopen(filePath, "w")
					fwrite(h, "victory\n")
					fclose(h)
				end
			end
		end
    end

-- ****************************************************************************
--AP Collection Helper. Returns whether to write to item specific save data.
	function Ob:genericAPCollect(name)
		-- '_' prefix specifies that the item is a non-local copy received from the AP multiworld.
		if strsub(name, 1, 1) == '_' then
			GamePrint('Collected non-local copy ' .. name)
			-- There should be no item that spawns in a level whose name matches this item.
			return FALSE
		else
			self.stats.APItem[name] = 'collected'
			-- Tell AP that the locally placed item has been collected from its location, sending an item out into the
			-- multiworld if the item was an AP placeholder.
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Collected and stored local ' .. name)
			-- Item specific save data should be written to. This prevents the item from spawning again when loading the
			-- level again.
			return TRUE
		end
	end

-- ****************************************************************************

	------CUSTOM BAGGAGE TAG HANDLER------
--Stores Collected BaggageTag, Global Key
	function Ob:onCurrentSuitcaseTags(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoSuitcaseTag[name] = 'collected'
		end
		local value = 1
		self.stats.CurrentSuitcaseTags = self.stats.CurrentSuitcaseTags + value
	end

	function Ob:onCurrentPurseTags(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoPurseTag[name] = 'collected'
		end
		local value = 1
		self.stats.CurrentPurseTags = self.stats.CurrentPurseTags + value
	end

	function Ob:onCurrentHatboxTags(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoHatboxTag[name] = 'collected'
		end
		local value = 1
		self.stats.CurrentHatboxTags = self.stats.CurrentHatboxTags + value
	end

	function Ob:onCurrentSteamertrunkTags(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoSteamertrunkTag[name] = 'collected'
		end
		local value = 1
		self.stats.CurrentSteamertrunkTags = self.stats.CurrentSteamertrunkTags + value
	end

	function Ob:onCurrentDufflebagTags(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoDufflebagTag[name] = 'collected'
		end
		local value = 1
		self.stats.CurrentDufflebagTags = self.stats.CurrentDufflebagTags + value
	end

-- ****************************************************************************

------CUSTOM BAGGAGE HANDLER------
	function Ob:onCollectedSuitcase(name,from)
		-- If Baggage is named NonLocal, SKIP
		if name ~= 'NonLocalSuitcase' then
			-- Removes Baggage Tag from inventory, stores Collected Baggage, Global Lock
			self.stats.RandoSuitcase[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
			self.stats.CurrentSuitcaseTags = self.stats.CurrentSuitcaseTags - 1
		end
		--Always increment total Suitcase count
		self.stats.TotalSuitcase = self.stats.TotalSuitcase + 1

		--send progressive baggage check
		local settings = FindScriptObject('RandoSeed')
		local suitcaseCount = self.stats.TotalSuitcase
		if (settings.progressiveBaggage == TRUE) and (settings.progressiveBaggageMax >= suitcaseCount) then
			-- Send an AP location check 
			local baggageShuffle = fso('APProgBaggageShuffle', 'APProgBaggageShuffle')
			baggageShuffle:collectedProgBaggageLocation("Suitcase"..suitcaseCount)
		else
			-- Rank Up Reward instead
			self:incrementRank()
		end
	end

	function Ob:onCollectedPurse(name,from)
		-- Removes Baggage Tag from inventory, stores Collected Baggage, Global Lock
		-- If Baggage is named NonLocal, SKIP
		if name ~= 'NonLocalPurse' then
			self.stats.RandoPurse[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
			self.stats.CurrentPurseTags = self.stats.CurrentPurseTags - 1
		end

		--Always increment total Purse count
		self.stats.TotalPurse = self.stats.TotalPurse + 1

		--send progressive baggage check
		local settings = FindScriptObject('RandoSeed')
		local purseCount = self.stats.TotalPurse
		if (settings.progressiveBaggage == TRUE) and (settings.progressiveBaggageMax >= purseCount) then
			-- Send an AP location check 
			local baggageShuffle = fso('APProgBaggageShuffle', 'APProgBaggageShuffle')
			baggageShuffle:collectedProgBaggageLocation("Purse"..purseCount)
		else
			-- Rank Up Reward instead
			self:incrementRank()
		end
	end

	function Ob:onCollectedHatbox(name,from)
		-- Removes Baggage Tag from inventory, stores Collected Baggage, Global Lock
		-- If Baggage is named NonLocal, SKIP
		if name ~= 'NonLocalHatbox' then
			self.stats.RandoHatbox[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
			self.stats.CurrentHatboxTags = self.stats.CurrentHatboxTags - 1
		end
		--Always increment total Hatbox count
		self.stats.TotalHatbox = self.stats.TotalHatbox + 1

		--send progressive baggage check
		local settings = FindScriptObject('RandoSeed')
		local hatboxCount = self.stats.TotalHatbox
		if (settings.progressiveBaggage == TRUE) and (settings.progressiveBaggageMax >= hatboxCount) then
			-- Send an AP location check 
			local baggageShuffle = fso('APProgBaggageShuffle', 'APProgBaggageShuffle')
			baggageShuffle:collectedProgBaggageLocation("Hatbox"..hatboxCount)
		else
			-- Rank Up Reward instead
			self:incrementRank()
		end
	end

	function Ob:onCollectedSteamertrunk(name,from)
		-- Removes Baggage Tag from inventory, stores Collected Baggage, Global Lock
		-- If Baggage is named NonLocal, SKIP
		if name ~= 'NonLocalSteamertrunk' then
			self.stats.RandoSteamertrunk[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
			self.stats.CurrentSteamertrunkTags = self.stats.CurrentSteamertrunkTags - 1
		end
		--Always increment total Steamertrunk count
		self.stats.TotalSteamertrunk = self.stats.TotalSteamertrunk + 1

		--send progressive baggage check
		local settings = FindScriptObject('RandoSeed')
		local steamertrunkCount = self.stats.TotalSteamertrunk
		if (settings.progressiveBaggage == TRUE) and (settings.progressiveBaggageMax >= steamertrunkCount) then
			-- Send an AP location check 
			local baggageShuffle = fso('APProgBaggageShuffle', 'APProgBaggageShuffle')
			baggageShuffle:collectedProgBaggageLocation("Steamertrunk"..steamertrunkCount)
		else
			-- Rank Up Reward instead
			self:incrementRank()
		end
	end

	function Ob:onCollectedDufflebag(name,from)
		-- Removes Baggage Tag from inventory, stores Collected Baggage, Global Lock
		-- If Baggage is named NonLocal, SKIP
		if name ~= 'NonLocalDufflebag' then
			self.stats.RandoDufflebag[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
			self.stats.CurrentDufflebagTags = self.stats.CurrentDufflebagTags - 1
		end
		--Always increment total Dufflebag count
		self.stats.TotalDufflebag = self.stats.TotalDufflebag + 1

		--send progressive baggage check
		local settings = FindScriptObject('RandoSeed')
		local dufflebagCount = self.stats.TotalDufflebag
		if (settings.progressiveBaggage == TRUE) and (settings.progressiveBaggageMax >= dufflebagCount) then
			-- Send an AP location check 
			local baggageShuffle = fso('APProgBaggageShuffle', 'APProgBaggageShuffle')
			baggageShuffle:collectedProgBaggageLocation("Dufflebag"..dufflebagCount)
		else
			-- Rank Up Reward instead
			self:incrementRank()
		end
	end

-- ****************************************************************************

	------CUSTOM RANDOPSIPOWERS HANDLERS------
	--Stores Collected RandoPsiPowers and Progressive Powerups
	function Ob:onRandoClairvoyance(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoClairvoyance[name] = 'collected'
		end
	end

	function Ob:onRandoConfusion(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoConfusion[name] = 'collected'
		end
	end

	function Ob:onRandoFirestarting(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoFirestarting[name] = 'collected'
		end
	end

	function Ob:onRandoInvisibility(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoInvisibility[name] = 'collected'
		end
	end

	function Ob:onRandoLevitation(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoLevitation[name] = 'collected'
		end
	end

	function Ob:onRandoMarksmanship(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoMarksmanship[name] = 'collected'
		end
	end

	function Ob:onRandoShield(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoShield[name] = 'collected'
		end
	end

	function Ob:onRandoTelekinesis(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoTelekinesis[name] = 'collected'
		end
	end

-- ****************************************************************************

	------CUSTOM RANDOPSICARD HANDLER------
	--Stores Collected RandoPsiCard
	function Ob:onRandoPsiCard(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoPsiCard[name] = 'collected'
		end
	end

-- ****************************************************************************

	------CUSTOM RANDOPSIMARKER HANDLER------
	--Stores Collected RandoPsiMarker
	function Ob:onRandoPsiMarker(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoPsiMarker[name] = 'collected'
		end
	end

-- ****************************************************************************

	------CUSTOM RANDOPROP HANDLER------
	--Stores Collected Prop
	function Ob:onRandoProp(name,from)
		--check to make sure it's not being reincarnated in inventory
		if self.stats.RandoProp[name] ~= 'collected' then
			self.stats.RandoProp[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
		end
	end

-- ****************************************************************************
	------CUSTOM VAULT HANDLER------
	--Stores CollectedVault, Increases Rank when you open a vault
	function Ob:onCollectedVault(name,from)
		if self:genericAPCollect(name) then
			self.stats.CollectedVault[name] = 'collected'
		end
		self.stats.totalVaults = self.stats.totalVaults+1

		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.vaultHints == TRUE then
			local vault_hints = fso('APVaultHints', 'APVaultHints')
			vault_hints:writeVaultHint('Hint!')
		end
		-- get a random amount of arrowheads between 25-75
		local arrowhead_value = RandInt(25, 75)
		UI_AdjustCollectible('arrowhead', arrowhead_value, self)
		SendMessage(self, self, 'Arrowhead', arrowhead_value)
		
	end

-- ****************************************************************************

	------CUSTOM MAXLIVES AND MAXAMMO HANDLER------
	--Stores RandoLivesUp and RandoAmmoUp
	function Ob:onRandoLivesUp(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoLivesUp[name] = 'collected'
		end
	end

	function Ob:onRandoAmmoUp(name,from)
		if self:genericAPCollect(name) then
			self.stats.RandoAmmoUp[name] = 'collected'
		end
	end

-- ****************************************************************************

	------CUSTOM ARROWHEADBUNDLE HANDLERS------
	--Stores collected ArrowheadBundles
	function Ob:onArrowheadBundleSmall(name,from)
		if self:genericAPCollect(name) then
			self.stats.ArrowheadBundleSmall[name] = 'collected'
		end
	end

	function Ob:onArrowheadBundleMedium(name,from)
		if self:genericAPCollect(name) then
			self.stats.ArrowheadBundleMedium[name] = 'collected'
		end
	end

-- ****************************************************************************

	------CUSTOM BRAINJAR HANDLERS------
	--Stores collected BrainJars
	function Ob:onBrainJar(name,from)
		self.stats.BrainJar[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM APPLACEHOLDER HANDLERS------
	--Stores collected APPlaceholders
	function Ob:onAPPlaceholder(name,from)
		self.stats.APPlaceholder[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

--[Orignal Collectible Functions Overrides]

	local onScavengerHuntItem_original = Ob.onScavengerHuntItem
	function Ob:onScavengerHuntItem(ItemID,from)
		%onScavengerHuntItem_original(self,ItemID,from)
		self.stats.APItem[ItemID] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(ItemID)
	end

	--FULL FUNCTION OVERRIDE
	--adjusted to ignore duplicate baggage in a level, multiples are fine!
	function Ob:onEmotionalBaggage(sBaggageType,from)
		self.stats.baggageCollected[sBaggageType] = 1
		self.stats.EmotionalBaggageSolved = self.stats.EmotionalBaggageSolved + 1
		self.stats.baggageMatched = self.stats.baggageMatched + 1
	end

	--FULL FUNCTION OVERRIDE
	function Ob:onCollectedCobweb(value,from)
		value = (value and tonumber(value)) or 1
		self.stats.cobwebs = self.stats.cobwebs + value
		-- Check if Cobweb Shuffle is enabled.
		local settings = FindScriptObject('RandoSeed')
		if settings.cobwebShuffle == TRUE then
			-- Send an AP location check instead of adding a cobweb to the player's inventory.
			local cobwebShuffle = fso('APCobwebShuffle', 'APCobwebShuffle')
			cobwebShuffle:collectedCobweb(from.Name)
		else
			self.stats.websInInv = self.stats.websInInv + value
		end
		self.stats.cobwebsFromEntireLevel = self.stats.cobwebsFromEntireLevel + value

		if self.stats.cobwebsFromEntireLevel == Global.cobwebsPerLevel[Global.levelScript:getLevelPrefix()] then
			Global:save('bCobwebsComplete', 1)
			self:collectibleBling("/GLZD437TO/", 'Textures/icons/InventoryItems/Journal_Cobweb.dds')
 			GamePrint('All cobwebs in level collected!!!')
		end
	end	

	--called whenever rank changes (increase)
	local setRank_original = Ob.setRank
	function Ob:setRank(num, bRunEffect)
		%setRank_original(self,num,bRunEffect)
		if not Global:loadGlobal("APRankMax") then
			Global:saveGlobal("APRankMax", 1)
		end
		-- Send an AP location when increasing rank
		local rankShuffle = fso('APRankShuffle', 'APRankShuffle')
		if rankShuffle then
			rankShuffle:collectedRank(num)
		end
	end

	--called whenever a figment is collected
	local onFigment_original = Ob.onFigment
	function Ob:onFigment(value, from)
		%onFigment_original(self,value,from)
		--call the figment handler
		local figmentHandler = fso('RandoFigmentHandler', 'RandoFigmentHandler')			
		figmentHandler:collectedFigment()
	end


	


end