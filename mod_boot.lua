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
	local seed = SpawnScript('RandoSeed', 'RandoSeed')
	local shuffle = SpawnScript('ShuffleItems', 'ShuffleItems')

	--fillTable used to avoid Lua max variable limitations
	pos:fillTable()
	seed:fillTable()

	--shuffles item Class and Name tables for Randomizer.lua to use
	shuffle:randomizeChecks()
	--removes vanilla items from current level
    remover:removeCollectibles()
	--adds randomized items to current level
	rando:placeCollectibles()

	--Spawn prop for easyflight QOL setting
	SpawnScript('global.otherentities.FlightQOL', 'FlightQOL')

	--Use these for spawning specific items for debug
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--EX: rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)

	--AP Related Stuff
	SpawnScript('APReceiver', 'APReceiver')
	SpawnScript('APCollected', 'APCollected')
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

