add_hook('beginlevel', 'RandoPlacer')
function RandoPlacer()
	local rando = SpawnScript('Randomizer', 'Randomizer');
	local seed = SpawnScript('Seed', 'Seed');
    rando:removeCollectibles();
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)
	seed:randomizeChecks();
	seed:placeCollectibles();
end

