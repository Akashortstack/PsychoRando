add_hook('startup', 'RandoSetup')
function RandoSetup()
	--set CA Level State to 7
	if (not Global:load('CALevelState', 'CA')) or Global:load('CALevelState', 'CA') ~= 7 then
		Global:save('CALevelState', 7, 'CA')
	end
	--Makes Brains always visible in menu
	if Global:loadGlobal('bSeenASIN') ~= 1 then
		Global:saveGlobal('bSeenASIN', 1)
	end

	--Start with Mental Magnet
	if Global:loadGlobal('bHasMentalMagnet') ~= 1 then
		Global:saveGlobal('bHasMentalMagnet', 1) 
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

	--Use these for spawning specific items for debug
	--rando:placeRandoObject(class, name, x, y, z, ox, oy, oz)
	--EX: rando:placeRandoObject('Global.Characters.Vault', 'Vault1', -5629, 4510, -13242, 0, 0, 0)

	--Find Tutorial Manager and kill it to prevent all tutorial popups
	--local tutorialkill = fso('global.otherentities.TutorialManager')
	--tutorialkill:killSelf()

end

