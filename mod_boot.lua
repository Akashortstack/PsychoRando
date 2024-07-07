add_hook('startup', 'RandoSetup')
function RandoSetup()
	--set CA Level State to 7
	if (not Global:load('CALevelState', 'CA')) or Global:load('CALevelState', 'CA') ~= 7 then
		Global:save('CALevelState', 7, 'CA')
	end

end

add_hook('beginlevel', 'RandoPlacer')
function RandoPlacer()
	local rando = SpawnScript('Randomizer', 'Randomizer')
	local remover = SpawnScript('CollectibleRemover', 'CollectibleRemover')
	local pos = SpawnScript('Positions', 'Positions')
	local itemTables = SpawnScript('RandoItemTables', 'RandoItemTables') -- Used by ShuffleItems and APReceiver
	local seed = SpawnScript('RandoSeed', 'RandoSeed')
	-- Initialize the tables based on the RandoSeed settings.
	itemTables:initTables(seed)
	local shuffle = SpawnScript('ShuffleItems', 'ShuffleItems')
	SpawnScript('RandoTeleportManager', 'RandoTeleportManager')

	--fillTable used to avoid Lua max variable limitations
	pos:fillTable()
	seed:fillTable()

	--shuffles item Class and Name tables for Randomizer.lua to use
	shuffle:randomizeChecks(itemTables)
	--removes vanilla items from current level
    remover:removeCollectibles()
	--adds randomized items to current level
	rando:placeCollectibles()

	--Spawn prop for easyflight QOL setting
	SpawnScript('global.otherentities.FlightQOL', 'FlightQOL')

	--Use these for spawning specific items for debug
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--EX: rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)

	--check ModData for seed specific folder
	local folderName = seed.APfoldername	
	if direxists(folderName) then
		--do nothing, Seed Folder exists already 
	else
		--create a new seed folder
		GamePrint("Seed Folder not found, creating new folder.")
		mkdirs(folderName)
		--creates required files inside new folder
		local a = fopen(folderName.."/ItemsCollected.txt", "w")
		fwrite(a, "")
		fclose(a)

		local b = fopen(folderName.."/ItemsReceived.txt", "w")
		fwrite(b, "")
		fclose(b)

		local c = fopen(folderName.."/DeathlinkIn.txt", "w")
		fwrite(c, "")
		fclose(c)

		local d = fopen(folderName.."/DeathlinkOut.txt", "w")
		fwrite(d, "")
		fclose(d)
	end

	-- Update the current level
	local mapFile = fopen(folderName.."/CurrentLevel.txt", "w")
	fwrite(mapFile, Global.levelScript:getLevelName())
	fclose(mapFile)

	-- spawn AP Related Scripts
	SpawnScript('APReceiver', 'APReceiver')
	SpawnScript('APCollected', 'APCollected')
	SpawnScript('APDeepArrowheadShuffle', 'APDeepArrowheadShuffle')
	SpawnScript('APCobwebShuffle', 'APCobwebShuffle')
	SpawnScript('Deathlink', 'Deathlink')

end

add_hook('postbeginlevel', 'RandoCleanup')
function RandoCleanup()
	--remove psycho portal to prevent logic breaking
	local brainerdoor = fso('Brainer')
	if brainerdoor ~= nil then
		brainerdoor:killSelf()
	end
end

