add_hook('beginlevel', 'RandoPlacer')
function RandoPlacer()
	local rando = SpawnScript('Randomizer', 'Randomizer');
	local seed = SpawnScript('Seed', 'Seed');
	SpawnScript('Positions', 'Positions')
    rando:removeCollectibles();
	seed:randomizeChecks();
	rando:placeCollectibles();

	--Use these for spawning specific items for debug
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--EX: rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)

end

