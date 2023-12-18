
For PsychoRando v0.9.0-BETA

Generating a Seed:
	Change settings in config.ini to 'True' or 'False' as wanted, then run SeedGenerator.exe
	Place RandoSeed.lua into the PsychoRando Scripts folder, overwrite old file.

List of Settings:
	- _startcobwebduster_: If 'True', Adds the Cobweb Duster to your inventory at the start of the game,
	opening access to more locations from the beginning. Has priority over 'randomizecobwebduster'

	-_startlevitation_: If 'True', Adds one Levitation to starting inventory. Location in seed is replaced with
	a Psicard.

	-_startbutton_: If 'True', Adds Sasha's Button to starting inventory, unlocking Campgrounds. Location in seed is replaced with
	a Psicard.

	-_randomizecobwebduster_: If 'True', Removes Cobweb Duster from the shop and adds it to the item pool,
	replacing a Psicard. Overridden by 'startcobwebduster'.

	- _everylocationpossible_: Want to guarantee every location can be reached for a 100% completion run? 
	Turn this on to make sure the generator knows no location can be left behind! Does not change player requirements for completing the game.

	- _beatoleander_: The original win condition, if 'True' this requires getting to the top of the Asylum
 	and fighting the Coach Oleander Brain Tank before finishing the game.

	- _rank101_: Race to max rank! If 'True', reaching Rank101 is mandatory to complete the game. Time to crack some vaults and sort some baggage.

	- _brainhunt_: Save the children! If 'True', player must find and break all 19 Brain Jars and 
	return them all to Ford's Sanctuary for re-braining to beat the game. No child left behind.

	- _scavengerhunt_: Ford DEMANDS you finish his Scavenger Hunt before you save the world. If 'True', 
	all 16 scavenger hunt items must be gathered and redeemed with Ford in the GPC before finishing the game.

	- _fasterLO_: Feeling sluggish in Lungfishopolis? If 'True', all of Raz's animations in Lungfishopolis are faster than normal, 
	AND you can use Levitation to ride the levitation ball around! No floating or flying though.

	- _spoilerlog_: This setting is recommended to be left as 'True', controls whether SpoilerLog.txt, 
	with a list of all items and locations, is generated with the seed. Only turn this off to guarantee no cheating to find missing items.