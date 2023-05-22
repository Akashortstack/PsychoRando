add_hook('beginlevel', 'RandoPlacer')
function RandoPlacer()
	local rando = SpawnScript('Randomizer', 'Randomizer');
	local seed = SpawnScript('Seed', 'Seed');
    rando:removeCollectibles();
	seed:placeObjectsCAKC();
	--rando:addCollectibles();	
end

