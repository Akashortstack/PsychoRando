
add_hook('beginlevel', 'RandoPlacer')
function RandoPlacer()
	local rando = SpawnScript('Randomizer', 'Randomizer');
	local pos = SpawnScript('Positions', 'Positions')
	local seed = SpawnScript('Seed', 'Seed')
	pos:fillTable()
	seed:fillTable()
	seed:randomizeChecks();
    rando:removeCollectibles();
	rando:placeCollectibles();

	--Use these for spawning specific items for debug
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--EX: rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)

end

