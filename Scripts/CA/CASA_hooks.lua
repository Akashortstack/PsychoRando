function CASA_hooks(Ob)
    local onBeginLevel_original = Ob.onBeginLevel
    function Ob:onBeginLevel()
        %onBeginLevel_original(self)
        --Spawn LevelDonePlacer.lua places items after completing a mind
		self.finished = SpawnScript('CA.LevelDonePlacer', 'LevelDonePlacer')
    end

    --FULL FUNCTION OVERRIDE
    --[[In vanilla, this controls story flags for NI and SA, cutscenes, and removing the Brain Tumbler Exit after entering MC
    We overwrite all of that, and instead use this for setting up Raz's inventory for the Randomizer
    Also save several randomizer flags for later]]
    function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)

        --One time setup when starting the randomizer, on entering Sasha's Lab for the first time
        if ( Global:load('bSeenCASA') ~= 1 ) then
            Global:save('bSeenCASA', 1)
            Global:save('BeenInSashasLab',1)
            
            --Set player rank to 1
            Global.player:setRank(1)

            --Add Bacon and Smelling Salts to inventory
            if (Global.player:isInInventory('Bacon') ~= 1) then
                local bacon = SpawnScript('Global.Props.InstaHintFordItem', 'Bacon')
                Global.player:addToInventory(bacon,0,1)
            end
            if (Global.player:isInInventory('SmellingSalts') ~= 1) then
                local salts = SpawnScript('Global.Collectibles.SmellingSalts', 'SmellingSalts')
                Global.player:addToInventory(salts,0,1)
            end

			--Load Seed related settings
			local settings = FindScriptObject('RandoSeed')

			--Setting to start with Levitation in inventory
			if settings.startlevitation == TRUE then
				Global:saveGlobal('bGotRandoLevitation', 1)
				EnablePower(kPOWER_LEVITATION)				
			end

			--Setting to start with Cobweb Duster, or Save that Cobweb Duster is Randomized
			if settings.startcobweb == TRUE then
				local duster = SpawnScript('Global.Collectibles.CobwebDuster', 'CobwebDuster')
                Global.player:addToInventory(duster,0,1)
			elseif settings.randomizecobwebduster == TRUE then
				Global:saveGlobal('bCobwebRandomized', 1)
			end

			--Setting to save that Dowsing Rod is Randomized
			if settings.randomizeDowsingRod == TRUE then
				Global:saveGlobal('bDowsingRodRandomized', 1)
			end

			--Setting to Start with Mental Magnet
			if settings.mentalmagnet == TRUE then
				Global:saveGlobal('bHasMentalMagnet', 1) 
			end

			--Setting to Remove all tutorials
			if settings.removetutorials == TRUE then
				Global:saveGlobal('bDisableTutorialBoxes', 1) 
			end

            --Setting for Faster LO movement
            if settings.fasterLO == TRUE then
				Global:saveGlobal('bFasterLO', 1) 
			end
			
        end

		--Remove level load from CASA to CAGP if Button not in inventory
		if Global:loadGlobal('bButtonCollected') ~= 1 or Global:loadGlobal('bButtonCollected') == nil then
			local removeload = fso('CASAtoCAGP1')
			removeload:hide()
			local removeladder = fso('ladder10m')
			removeladder:hide()
			local sashablock = SpawnScript('ca.characters.RandoSasha', 'NO_ENTRY')
			sashablock:setPosition(18, 1681, 78)
			sashablock:setOrientation(0, 0, 0)
		end

		--when entering BV, load BVRB on first entry instead of BVES 
		if Global:loadGlobal('bBVFirstEntry') ~= 1 or Global:loadGlobal('bBVFirstEntry') == nil then
			local teleport = fso('CU_BVteleporter')
    		teleport.destLevel = 'BVRB'
		end

		--Spawn LevelDonePlacer Items
		self.finished:levelsDone()

		--deactivate Edgar Goal after completing BV, normally deactivated in AS
		if Global:loadGlobal('bBVCompleted') == 1 then
			Global.goalManager:deactivate('LiberateEdgar')
		end

		--Make Scavenger Hunt List viewable from beginning
		if Global:load('bFord2ScavengerProxPlayed') ~= 1 then
			Global:save('bFord2ScavengerProxPlayed', 1)
		end

		--Makes Brains always visible in menu
		if Global:loadGlobal('bSeenASIN') ~= 1 then
			Global:saveGlobal('bSeenASIN', 1)
		end

		--make Ford's Sanctuary open with fast travel
		Global:save('cajaStump', 1, 'CA')

	end

end