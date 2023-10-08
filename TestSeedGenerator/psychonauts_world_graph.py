import networkx as nx
import random
import copy
from collectible_names import collectiblenames

game_graph = nx.Graph()


#Empty Inventory Table
player_inventory = ["Cobweb Duster",]

vanilla_list = [
#Current Props from AS, 6 total
'Lungfish Call', "Gloria's Trophy", 'Straight Jacket', 'Lobato Painting', 'Cake', 'Lilis Bracelet',

#Current Props from MM, 6 total
'Prop Sign', 'Prop Flowers', 'Prop Plunger', 'Prop HedgeTrimmers', 'Prop Rolling Pin', 'Prop WaterCan',

#Current Props from TH, 3 total
'Candle1', 'Candle2', 'Megaphone',

#Props from WW, 3 total
"Fred's Letter", #Fred's Letter
'Priceless Coin', #Priceless Coin
'Musket', #Musket

#19 Psi Powers, Some Different Names to match Class
'Marksmanship',
'Marksmanship',
'Marksmanship',
'Pyrokinesis',
'Pyrokinesis',
'Confusion',
'Confusion',
'Levitation',
'Levitation',
'Levitation',
'Telekinesis',
'Telekinesis',
'Invisibility',
'Invisibility',
'Clairvoyance',
'Clairvoyance',
'Shield',
'Shield',
'Shield',

#6 Max Ammo Up
'AmmoUp1',
'AmmoUp2',
'AmmoUp3',
'AmmoUp4',
'AmmoUp5',
'AmmoUp6',

#6 Max Lives Up
'MaxLivesUp1',
'MaxLivesUp2',
'MaxLivesUp3',
'MaxLivesUp4',
'MaxLivesUp5',
'MaxLivesUp6',

#10 Challenge ChallengeMarkers
'ChallengeMarker1',
'ChallengeMarker2',
'ChallengeMarker3',
'ChallengeMarker4',
'ChallengeMarker5',
'ChallengeMarker6',
'ChallengeMarker7',
'ChallengeMarker8',
'ChallengeMarker9',
'ChallengeMarker10',
           
#19 Brain Jars, Unique Names
'BrainJarElton',
'BrainJarBobby',
'BrainJarDogen',
'BrainJarBenny',
'BrainJarElka',
'BrainJarKitty',
'BrainJarChloe',
'BrainJarFranke',
'BrainJarJT',
'BrainJarQuentin',
'BrainJarVernon',
'BrainJarMilka',
'BrainJarCrystal',
'BrainJarClem',
'BrainJarNils',
'BrainJarMaloof',
'BrainJarMikhail',
'BrainJarPhoebe',
'BrainJarChops',

#16 Scavenger Hunt Items, Unique Names, in Order
'Gold Doubloon',
'Eagle Claw',
'Divers Helmet',
'Psy Comic',
'Wood Pipe',
'Turkey Sandwich',
'Voodoo Doll',
'Miner Skull',
'Pirate Scope',
'Golden Acorn',
'Glass Eye',
'Egg',
'Fertility Idol',
'Dinosaur Bone',
'Fossil',
'Gold Watch',

#50 Emotional Baggage Tags, 10 of each Type
'SuitcaseTag1',
'SuitcaseTag2',
'SuitcaseTag3',
'SuitcaseTag4',
'SuitcaseTag5',
'SuitcaseTag6',
'SuitcaseTag7',
'SuitcaseTag8',
'SuitcaseTag9',
'SuitcaseTag10',

'PurseTag1',
'PurseTag2',
'PurseTag3',
'PurseTag4',
'PurseTag5',
'PurseTag6',
'PurseTag7',
'PurseTag8',
'PurseTag9',
'PurseTag10',

'HatboxTag1',
'HatboxTag2',
'HatboxTag3',
'HatboxTag4',
'HatboxTag5',
'HatboxTag6',
'HatboxTag7',
'HatboxTag8',
'HatboxTag9',
'HatboxTag10',

'SteamerTag1',
'SteamerTag2',
'SteamerTag3',
'SteamerTag4',
'SteamerTag5',
'SteamerTag6',
'SteamerTag7',
'SteamerTag8',
'SteamerTag9',
'SteamerTag10',

'DuffleTag1',
'DuffleTag2',
'DuffleTag3',
'DuffleTag4',
'DuffleTag5',
'DuffleTag6',
'DuffleTag7',
'DuffleTag8',
'DuffleTag9',
'DuffleTag10',

#50 Emotional Baggage, 10 of each Type
'Suitcase1', 'Suitcase2', 'Suitcase3', 'Suitcase4', 'Suitcase5', 'Suitcase6', 'Suitcase7', 'Suitcase8', 'Suitcase9', 'Suitcase10',

'Purse1', 'Purse2', 'Purse3', 'Purse4', 'Purse5', 'Purse6', 'Purse7', 'Purse8', 'Purse9', 'Purse10',

'Hatbox1', 'Hatbox2', 'Hatbox3', 'Hatbox4', 'Hatbox5', 'Hatbox6', 'Hatbox7', 'Hatbox8','Hatbox9','Hatbox10',

'Steamertrunk1', 'Steamertrunk2', 'Steamertrunk3', 'Steamertrunk4', 'Steamertrunk5', 'Steamertrunk6', 'Steamertrunk7', 'Steamertrunk8', 'Steamertrunk9', 'Steamertrunk10',

'Dufflebag1', 'Dufflebag2', 'Dufflebag3', 'Dufflebag4', 'Dufflebag5', 'Dufflebag6', 'Dufflebag7', 'Dufflebag8', 'Dufflebag9', 'Dufflebag10',

#19 Vaults
'Vault1', 'Vault2', 'Vault3', 'Vault4', 'Vault5', 'Vault6', 'Vault7', 'Vault8', 'Vault9', 'Vault10',
'Vault11', 'Vault12', 'Vault13', 'Vault14', 'Vault15', 'Vault16', 'Vault17','Vault18', 'Vault19',

#35 Rando Arrowhead Bundles Small
'AHSmall1', 'AHSmall2', 'AHSmall3', 'AHSmall4', 'AHSmall5', 'AHSmall6', 'AHSmall7', 'AHSmall8', 'AHSmall9', 'AHSmall10',
'AHSmall11', 'AHSmall12', 'AHSmall13', 'AHSmall14', 'AHSmall15', 'AHSmall16', 'AHSmall17', 'AHSmall18', 'AHSmall19', 'AHSmall20',
'AHSmall21', 'AHSmall22', 'AHSmall23', 'AHSmall24', 'AHSmall25', 'AHSmall26', 'AHSmall27', 'AHSmall28', 'AHSmall29', 'AHSmall30', 
'AHSmall31', 'AHSmall32', 'AHSmall33', 'AHSmall34', 'AHSmall35',

#7 Rando Arrowhead Bundles Large
'AHLarge1', 'AHLarge2', 'AHLarge3', 'AHLarge4', 'AHLarge5', 'AHLarge6', 'AHLarge7',

#104 Psicards, filler item, increase if adding more positions
'Card1', 'Card2', 'Card3', 'Card4', 'Card5', 'Card6', 'Card7', 'Card8', 'Card9', 'Card10',
'Card11', 'Card12', 'Card13', 'Card14', 'Card15', 'Card16', 'Card17', 'Card18', 'Card19', 'Card20',
'Card21', 'Card22', 'Card23', 'Card24', 'Card25', 'Card26', 'Card27', 'Card28', 'Card29', 'Card30', 
'Card31', 'Card32', 'Card33', 'Card34', 'Card35', 'Card36', 'Card37', 'Card38', 'Card39', 'Card40',
'Card41', 'Card42', 'Card43', 'Card44', 'Card45', 'Card46', 'Card47', 'Card48', 'Card49', 'Card50',
'Card51', 'Card52', 'Card53', 'Card54', 'Card55', 'Card56', 'Card57', 'Card58', 'Card59', 'Card60',
'Card61', 'Card62', 'Card63', 'Card64', 'Card65', 'Card66', 'Card67', 'Card68', 'Card69', 'Card70',
'Card71', 'Card72', 'Card73', 'Card74', 'Card75', 'Card76', 'Card77', 'Card78', 'Card79', 'Card80', 
'Card81', 'Card82', 'Card83', 'Card84', 'Card85', 'Card86', 'Card87', 'Card88', 'Card89', 'Card90', 
'Card91', 'Card92', 'Card93', 'Card94', 'Card95', 'Card96', 'Card97', 'Card98', 'Card99', 'Card100',
'Card101', 'Card102', 'Card103', 'Card104', 

#Oarsman's Badge
'Oarsmans Badge',

#Sasha's Button
'Button',

#Crow Feather
'Feather',
]

# Add nodes (locations) to the graph

# WHISPERING ROCK SUMMER CAMP
game_graph.add_node("Start", items = [])  # Sasha's Underground Lab (CASA)

# GPC and Wilderness (CAGP)
game_graph.add_node("GPC and Wilderness (CAGP)", items = [])
game_graph.add_node("GPC Squirrel (CAGP)", items = [])  # Need Invisibility
game_graph.add_node("GPC Geyser (CAGP)", items = [])  # Need Shield

# Main Campgrounds (CAMA)
game_graph.add_node("Main Campgrounds (CAMA)", items = [])
game_graph.add_node("Main Campgrounds: Levitation (CAMA)", items = []) # Need Levitation

# Kids' Cabins (CAKC)
game_graph.add_node("Kids' Cabins (CAKC)", items = [])
game_graph.add_node("Kids' Cabins: Levitation (CAKC)", items = [])  # Need Levitation
game_graph.add_node("Kids' Cabins: Pyrokinesis (CAKC)", items = [])  # Need Pyrokinesis

# Reception Area (CARE)
game_graph.add_node("Reception Area (CARE)", items = [])
game_graph.add_node("Reception Area: Levitation (CARE)", items = [])  # Need Levitation
game_graph.add_node("Reception Area: Marksmanship (CARE)", items = [])  # Need Marksmanship

# Lake and Boathouse (CABH)
game_graph.add_node("Lake and Boathouse (CABH)", items = [])
game_graph.add_node("Lake and Boathouse: Levitation (CABH)", items = [])  # Need Levitation

# Main Lodge (CALI)
game_graph.add_node("Main Lodge (CALI)", items = [])

# Ford's Sanctuary (CAJA)
game_graph.add_node("Ford's Sanctuary (CAJA)", items = [])
game_graph.add_node("Rando Only Rank Checks", items = [])

# THORNEY TOWERS
game_graph.add_node("Asylum Grounds (ASGR)", items = [])  # Need Lungfish Call
game_graph.add_node("Asylum Grounds: Levitation (ASGR)", items = []) # Need Levitation

game_graph.add_node("Asylum Lower Level (ASCO)", items = [])
game_graph.add_node("Asylum Lower Level: Levitation (ASCO)", items = []) # Need Levitation

game_graph.add_node("Asylum Upper Level (ASUP)", items = [])  # Need Gloria's Trophy, Straight Jacket, Lobato Painting
game_graph.add_node("Asylum Upper Level: Telekinesis (ASUP)", items = [])  # Need Telekinesis

game_graph.add_node("Dr. Loboto's Laboratory (ASLB)", items = [])

# BASIC BRAINING
game_graph.add_node("Obstacle Course (BBA1)", items = [])
game_graph.add_node("Obstacle Course 2: Cobweb (BBA2)", items = [])  # Need Cobweb Duster

# SASHA'S SHOOTING GALLERY
game_graph.add_node("SASHA'S SHOOTING GALLERY (SA)", items = [])
game_graph.add_node("Cube Face 2: Levitation (SACU)", items = [])  # Need Levitation

# MILLA'S DANCE PARTY
game_graph.add_node("MILLA'S DANCE PARTY (MI)", items = [])

# BRAIN TUMBLER EXPERIMENT
game_graph.add_node("The Nightmare Woods (NIMP)", items = [])
game_graph.add_node("The Nightmare Woods: Marksmanship (NIMP)", items = [])
game_graph.add_node("The Brain Tank (NIBA)", items = [])

# LUNGFISHOPOLIS
game_graph.add_node("LUNGFISHOPOLIS (LO)", items = [])
game_graph.add_node("LUNGFISHOPOLIS: Shield (LO)", items = [])  # Need Shield

# THE MILKMAN CONSPIRACY
game_graph.add_node("The Neighborhood 1: Fridge (MMI1)", items = [])  # No Requirements
game_graph.add_node("The Neighborhood 1: Before Sign (MMI1)", items = [])  # Need Clairvoyance
game_graph.add_node("The Neighborhood 1: After Sign (MMI1)", items = [])  # Need Prop Sign
game_graph.add_node("The Neighborhood 1: Hedgetrimmers (MMI1)", items = [])  # Need Hedgetrimmers
game_graph.add_node("The Neighborhood 1: Rolling Pin (MMI1)", items = [])  # Need Rolling Pin
game_graph.add_node("The Neighborhood 1: Powerlines (MMI1)", items = [])  # Need Phone (Plunger, Flowers, Pyrokinesis, Cobweb Duster)
game_graph.add_node("The Neighborhood 1: Cobweb (MMI1)", items = [])  # Need Cobweb Duster

# The Neighborhood 2 (MMI2)
game_graph.add_node("The Neighborhood 2 (MMI2)", items = [])  # Need Plunger, Flowers, Pyrokinesis
game_graph.add_node("The Den Mother (MMDM)", items = [])  # Need Invisibility

# GLORIA'S THEATER
game_graph.add_node("The Stage (THMS)", items = [])
game_graph.add_node("The Stage: Levitation (THMS)", items = [])  # Need Levitation
game_graph.add_node("The Stage: Cobwebs (THMS)", items = [])  # Need Cobweb Duster
game_graph.add_node("The Stage: Storage Room (THMS)", items = [])  # Need Invisibility

# The Catwalks (THCW)
game_graph.add_node("The Catwalks (THCW)", items = [])  # Need Pyrokinesis, Candle, Megaphone
game_graph.add_node("The Phantom Boss (THFB)", items = [])  # Need Candle x2, Levitation

# WATERLOO WORLD 
game_graph.add_node("Game Board (WWMA)", items = [])
game_graph.add_node("Game Board: Levitation (WWMA)", items = [])  # Need Levitation
game_graph.add_node("Game Board: Carpenter Roof (WWMA)", items = [])  # Need Levitation, Invis
game_graph.add_node("Game Board: Cobweb (WWMA)", items = [])  # Need Cobweb Duster
game_graph.add_node("Game Board: Cobweb+Levitation (WWMA)", items = [])  # Need Cobweb Duster, Levitation
game_graph.add_node("Game Board: Cobweb+Levitation+Pyrokinesis (WWMA)", items = [])  # Need Cobweb Duster, Levitation, Pyrokinesis

# WATERLOO VILLAGER ITEMS
game_graph.add_node("Game Board: Villager 1 (WWMA)", items = [])  # Need Fred's Letter
game_graph.add_node("Game Board: Knight (WWMA)", items = [])  # Need Fred's Letter, Telekinesis
game_graph.add_node("Game Board: Villager 2 (WWMA)", items = [])  # Need Priceless Coin
game_graph.add_node("Game Board: Villager 3 (WWMA)", items = [])  # Need Musket

# BLACK VELVETOPIA
game_graph.add_node("Running Against the Bull (BVRB)", items = [])
game_graph.add_node("Running Against the Bull: Levitation (BVRB)", items = [])  # Need Levitation
game_graph.add_node("Running Against the Bull: Telekinesis (BVRB)", items = [])  # Need Telekinesis
game_graph.add_node("Running Against the Bull: Cobweb (BVRB)", items = [])  # Need Cobweb Duster
game_graph.add_node("Running Against the Bull: Garden (BVRB)", items = [])  # Need Cobweb Duster, Telekinesis
game_graph.add_node("Running Against the Bull: Burn Logs (BVRB)", items = [])  # Need Cobweb Duster, Telekinesis, Pyrokinesis

# Edgar's Sanctuary (BVES)
game_graph.add_node("Edgar's Sanctuary (BVES)", items = [])
game_graph.add_node("Edgar's Sanctuary: Levitation (BVES)", items = [])  # Need Levitation
game_graph.add_node("Edgar's Sanctuary: Eagle Wrestler (BVES)", items = [])  # Need Cobweb Duster
game_graph.add_node("Edgar's Sanctuary: Cobra (BVES)", items = [])  # Need Cobweb Duster, Confusion
game_graph.add_node("Edgar's Sanctuary: Boss (BVES)", items = [])  # Need Cobweb Duster, Confusion, Telekinesis

# MEAT CIRCUS
game_graph.add_node("Meat Circus Main (MCTC)", items = [])  # Need Cobweb Duster
game_graph.add_node("Meat Circus Main: Oly Escort (MCTC)", items = [])  # Need Cobweb Duster, Telekinesis, Levitation?

# Collected if all requirements are met
game_graph.add_node("Victory", items = ["Goal",])

#*****************************************************************************************************************

#Add edges to the graph

# WHISPERING ROCK SUMMER CAMP
# GPC and Wilderness (CAGP)
game_graph.add_edge("Start", "GPC and Wilderness (CAGP)")
game_graph.add_edge("Start", "GPC Squirrel (CAGP)", requirements = ["Invisibility",])  # Need Invisibility
game_graph.add_edge("Start", "GPC Geyser (CAGP)", requirements = ["Shield",])  # Need Shield

# Main Campgrounds (CAMA)
game_graph.add_edge("Start", "Main Campgrounds (CAMA)")
game_graph.add_edge("Start", "Main Campgrounds: Levitation (CAMA)", requirements = ["Levitation",]) # Need Levitation

# Kids' Cabins (CAKC)
game_graph.add_edge("Start", "Kids' Cabins (CAKC)")
game_graph.add_edge("Start", "Kids' Cabins: Levitation (CAKC)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Kids' Cabins: Pyrokinesis (CAKC)", requirements = ["Pyrokinesis",])  # Need Pyrokinesis

# Reception Area (CARE)
game_graph.add_edge("Start", "Reception Area (CARE)")
game_graph.add_edge("Start", "Reception Area: Levitation (CARE)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Reception Area: Marksmanship (CARE)", requirements = ["Marksmanship",])  # Need Marksmanship

# Lake and Boathouse (CABH)
game_graph.add_edge("Start", "Lake and Boathouse (CABH)")
game_graph.add_edge("Start", "Lake and Boathouse: Levitation (CABH)", requirements = ["Levitation",])  # Need Levitation

# Main Lodge (CALI)
game_graph.add_edge("Start", "Main Lodge (CALI)")

# Ford's Sanctuary (CAJA)
game_graph.add_edge("Start", "Ford's Sanctuary (CAJA)")
game_graph.add_edge("Start", "Rando Only Rank Checks")

# THORNEY TOWERS
game_graph.add_edge("Start", "Asylum Grounds (ASGR)", requirements = ["Lungfish Call",])  # Need Lungfish Call
game_graph.add_edge("Start", "Asylum Grounds: Levitation (ASGR)", requirements = ["Levitation", "Lungfish Call",]) # Need Levitation

game_graph.add_edge("Start", "Asylum Lower Level (ASCO)", requirements = ["Lungfish Call",])
game_graph.add_edge("Start", "Asylum Lower Level: Levitation (ASCO)", requirements = ["Levitation", "Lungfish Call",]) # Need Levitation

game_graph.add_edge("Start", "Asylum Upper Level (ASUP)", requirements = ["Lungfish Call", "Gloria's Trophy", "Straight Jacket", "Lobato Painting",])  # Need Gloria's Trophy, Straight Jacket, Lobato Painting
game_graph.add_edge("Start", "Asylum Upper Level: Telekinesis (ASUP)", requirements = ["Lungfish Call", "Gloria's Trophy", "Straight Jacket", "Lobato Painting", "Telekinesis",])  # Need Telekinesis

game_graph.add_edge("Start", "Dr. Loboto's Laboratory (ASLB)", requirements = ["Lungfish Call", "Gloria's Trophy", "Straight Jacket", "Lobato Painting", "Telekinesis",])

# BASIC BRAINING
game_graph.add_edge("Start", "Obstacle Course (BBA1)")
game_graph.add_edge("Start", "Obstacle Course 2: Cobweb (BBA2)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster

# SASHA'S SHOOTING GALLERY
game_graph.add_edge("Start", "SASHA'S SHOOTING GALLERY (SA)", requirements = ["Marksmanship",])  # Need Marksmanship
game_graph.add_edge("Start", "Cube Face 2: Levitation (SACU)", requirements = ["Marksmanship", "Levitation",])  # Need Levitation

# MILLA'S DANCE PARTY
game_graph.add_edge("Start", "MILLA'S DANCE PARTY (MI)", requirements = ["Levitation",])  # Need Levitation

# BRAIN TUMBLER EXPERIMENT
game_graph.add_edge("Start", "The Nightmare Woods (NIMP)")
game_graph.add_edge("Start", "The Nightmare Woods: Marksmanship (NIMP)", requirements = ["Marksmanship",])  # Need Marksmanship
game_graph.add_edge("Start", "The Brain Tank (NIBA)", requirements = ["Marksmanship", "Levitation",])  # Need Levitation

# LUNGFISHOPOLIS
game_graph.add_edge("Start", "LUNGFISHOPOLIS (LO)")
game_graph.add_edge("Start", "LUNGFISHOPOLIS: Shield (LO)", requirements = ["Shield",])  # Need Shield

# THE MILKMAN CONSPIRACY
game_graph.add_edge("Start", "The Neighborhood 1: Fridge (MMI1)")  # No Requirements
game_graph.add_edge("Start", "The Neighborhood 1: Before Sign (MMI1)", requirements = ["Clairvoyance",])  # Need Clairvoyance
game_graph.add_edge("Start", "The Neighborhood 1: After Sign (MMI1)", requirements = ["Clairvoyance", "Prop Sign",])  # Need Prop Sign
game_graph.add_edge("Start", "The Neighborhood 1: Hedgetrimmers (MMI1)", requirements = ["Clairvoyance", "Prop Sign", "Prop HedgeTrimmers",])  # Need Hedgetrimmers
game_graph.add_edge("Start", "The Neighborhood 1: Rolling Pin (MMI1)", requirements = ["Clairvoyance", "Prop Sign", "Prop HedgeTrimmers", "Prop Rolling Pin",])  # Need Rolling Pin
game_graph.add_edge("Start", "The Neighborhood 1: Powerlines (MMI1)", requirements = ["Cobweb Duster", "Clairvoyance", "Pyrokinesis", "Prop Sign", "Prop Plunger", "Prop Flowers",])  # Need Phone (Plunger, Flowers, Pyrokinesis, Cobweb Duster)
game_graph.add_edge("Start", "The Neighborhood 1: Cobweb (MMI1)", requirements = ["Cobweb Duster", "Clairvoyance", "Prop Sign",])  # Need Cobweb Duster

# The Neighborhood 2 (MMI2)
game_graph.add_edge("Start", "The Neighborhood 2 (MMI2)", requirements = ["Clairvoyance", "Pyrokinesis", "Prop Sign", "Prop Plunger", "Prop Flowers",])  # Need Plunger, Flowers, Pyrokinesis
game_graph.add_edge("Start", "The Den Mother (MMDM)", requirements = ["Cobweb Duster", "Clairvoyance", "Invisibility", "Pyrokinesis", "Prop Sign", "Prop Plunger", "Prop Flowers",])  # Need Invisibility

# GLORIA'S THEATER
game_graph.add_edge("Start", "The Stage (THMS)")
game_graph.add_edge("Start", "The Stage: Levitation (THMS)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "The Stage: Cobwebs (THMS)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "The Stage: Storage Room (THMS)", requirements = ["Cobweb Duster", "Invisibility",])  # Need Invisibility

#The Catwalks (THCW)
game_graph.add_edge("Start", "The Catwalks (THCW)", requirements = ["Cobweb Duster", "Invisibility", "Pyrokinesis", "Megaphone", "Candle1",])  # Need Pyrokinesis, Megaphone, Candle1 
game_graph.add_edge("Start", "The Phantom Boss (THFB)", requirements = ["Cobweb Duster", "Invisibility", "Pyrokinesis", "Megaphone", "Candle1", "Candle2", "Levitation",])  # Need Candle2, Levitation

# WATERLOO WORLD 
game_graph.add_edge("Start", "Game Board (WWMA)")
game_graph.add_edge("Start", "Game Board: Levitation (WWMA)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Game Board: Carpenter Roof (WWMA)", requirements = ["Levitation", "Invisibility",])  # Need Levitation, Invisibility
game_graph.add_edge("Start", "Game Board: Cobweb (WWMA)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "Game Board: Cobweb+Levitation (WWMA)", requirements = ["Cobweb Duster", "Levitation",])  # Need Cobweb Duster, Levitation
game_graph.add_edge("Start", "Game Board: Cobweb+Levitation+Pyrokinesis (WWMA)", requirements = ["Cobweb Duster", "Levitation", "Pyrokinesis",])  # Need Cobweb Duster, Levitation, Pyrokinesis

# WATERLOO VILLAGER ITEMS
game_graph.add_edge("Start", "Game Board: Villager 1 (WWMA)", requirements = ["Fred's Letter",])  # Need Fred's Letter
game_graph.add_edge("Start", "Game Board: Knight (WWMA)", requirements = ["Fred's Letter", "Telekinesis",])  # Need Fred's Letter, Telekinesis
game_graph.add_edge("Start", "Game Board: Villager 2 (WWMA)", requirements = ["Fred's Letter", "Telekinesis", "Priceless Coin",])  # Need Priceless Coin
game_graph.add_edge("Start", "Game Board: Villager 3 (WWMA)", requirements = ["Fred's Letter", "Telekinesis", "Priceless Coin", "Musket",])  # Need Musket

# BLACK VELVETOPIA
game_graph.add_edge("Start", "Running Against the Bull (BVRB)")
game_graph.add_edge("Start", "Running Against the Bull: Levitation (BVRB)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Running Against the Bull: Telekinesis (BVRB)", requirements = ["Telekinesis",])  # Need Telekinesis
game_graph.add_edge("Start", "Running Against the Bull: Cobweb (BVRB)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "Running Against the Bull: Garden (BVRB)", requirements = ["Cobweb Duster", "Telekinesis",])  # Need Cobweb Duster, Telekinesis
game_graph.add_edge("Start", "Running Against the Bull: Burn Logs (BVRB)", requirements = ["Cobweb Duster", "Telekinesis", "Pyrokinesis",])  # Need Cobweb Duster, Telekinesis, Pyrokinesis

# Edgar's Sanctuary (BVES)
game_graph.add_edge("Start", "Edgar's Sanctuary (BVES)")
game_graph.add_edge("Start", "Edgar's Sanctuary: Levitation (BVES)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Edgar's Sanctuary: Eagle Wrestler (BVES)", requirements = ["Cobweb Duster", ])  # Need Cobweb Duster
game_graph.add_edge("Start", "Edgar's Sanctuary: Cobra (BVES)", requirements = ["Cobweb Duster", "Confusion",])  # Need Cobweb Duster, Confusion
game_graph.add_edge("Start", "Edgar's Sanctuary: Boss (BVES)", requirements = ["Cobweb Duster", "Confusion", "Telekinesis",])  # Need Cobweb Duster, Confusion, Telekinesis

# MEAT CIRCUS
game_graph.add_edge("Start", "Meat Circus Main (MCTC)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "Meat Circus Main: Oly Escort (MCTC)", requirements = ["Cobweb Duster", "Telekinesis", "Levitation",])  # Need Cobweb Duster, Telekinesis, Levitation?

# Collected if all requirements are met
game_graph.add_edge("Start", "Victory", requirements = ["Cobweb Duster", "Levitation", "Pyrokinesis", "Telekinesis", "Lungfish Call", "Lobato Painting", "Gloria's Trophy", "Straight Jacket", "Cake", ])

def fill_locations(graph, item_list):
    for index, item in enumerate(item_list):
        if 0<=index<=2:
            # Access the "items" attribute of the Start node and append the item to it
            graph.nodes["Start"]["items"].append(item)
        if 3<=index<=24:
            graph.nodes["GPC and Wilderness (CAGP)"]["items"].append(item)
        if index==25:
            graph.nodes["GPC Squirrel (CAGP)"]["items"].append(item)
        if index==26:
            graph.nodes["GPC Geyser (CAGP)"]["items"].append(item)
        if 27<=index<=44 or 46<=index<=47:
            graph.nodes["Main Campgrounds (CAMA)"]["items"].append(item)
        if index==45:
            graph.nodes["Main Campgrounds: Levitation (CAMA)"]["items"].append(item)
        if 48<=index<=59:
            graph.nodes["Kids' Cabins (CAKC)"]["items"].append(item)
        if index==60:
            graph.nodes["Kids' Cabins: Levitation (CAKC)"]["items"].append(item)
        if index==61:
            graph.nodes["Kids' Cabins: Pyrokinesis (CAKC)"]["items"].append(item)
        if 62<=index<=69 or 71<=index<=83 or index==85:
            graph.nodes["Reception Area (CARE)"]["items"].append(item)
        if index==70 or index==84 or index==86:
            graph.nodes["Reception Area: Levitation (CARE)"]["items"].append(item)
        if index==87:
            graph.nodes["Reception Area: Marksmanship (CARE)"]["items"].append(item)
        if 88<=index<=104 or index==106:
            graph.nodes["Lake and Boathouse (CABH)"]["items"].append(item)
        if index==105:
            graph.nodes["Lake and Boathouse: Levitation (CABH)"]["items"].append(item)
        if index==107:
            graph.nodes["Main Lodge (CALI)"]["items"].append(item)
        if 108<=index<=109:
            graph.nodes["Ford's Sanctuary (CAJA)"]["items"].append(item)
        if 110<=index<=129:
            graph.nodes["Rando Only Rank Checks"]["items"].append(item)
        if 130<=index<=132 or 134<=index<=139:
            graph.nodes["Asylum Grounds (ASGR)"]["items"].append(item)
        if index==133:
            graph.nodes["Asylum Grounds: Levitation (ASGR)"]["items"].append(item)
        if 140<=index<=147:
            graph.nodes["Asylum Lower Level (ASCO)"]["items"].append(item)
        if index==148:
            graph.nodes["Asylum Lower Level: Levitation (ASCO)"]["items"].append(item)
        if 149<=index<=171:
            graph.nodes["Asylum Upper Level (ASUP)"]["items"].append(item)
        if 172<=index<=174:
            graph.nodes["Asylum Upper Level: Telekinesis (ASUP)"]["items"].append(item)
        if 175<=index<=182:
            graph.nodes["Dr. Loboto's Laboratory (ASLB)"]["items"].append(item)
        if 183<=index<=191 or 193<=index<=197:
            graph.nodes["Obstacle Course (BBA1)"]["items"].append(item)
        if index==192:
            graph.nodes["Obstacle Course 2: Cobweb (BBA2)"]["items"].append(item)
        if 198<=index<=205 or 207<=index<=214:
            graph.nodes["SASHA'S SHOOTING GALLERY (SA)"]["items"].append(item)
        if index==206:
            graph.nodes["Cube Face 2: Levitation (SACU)"]["items"].append(item)
        if 215<=index<=229:
            graph.nodes["MILLA'S DANCE PARTY (MI)"]["items"].append(item)
        if 230<=index<=182:
            graph.nodes["The Nightmare Woods (NIMP)"]["items"].append(item)
        if 233<=index<=242:
            graph.nodes["The Nightmare Woods: Marksmanship (NIMP)"]["items"].append(item)
        if index==243:
            graph.nodes["The Brain Tank (NIBA)"]["items"].append(item)
        if 244<=index<=246:
            graph.nodes["LUNGFISHOPOLIS (LO)"]["items"].append(item)
        if 247<=index<=263:
            graph.nodes["LUNGFISHOPOLIS: Shield (LO)"]["items"].append(item)
        if index==264:
            graph.nodes["The Neighborhood 1: Fridge (MMI1)"]["items"].append(item)
        if 265<=index<=267:
            graph.nodes["The Neighborhood 1: Before Sign (MMI1)"]["items"].append(item)
        if 268<=index<=270 or 272<=index<=278:
            graph.nodes["The Neighborhood 1: After Sign (MMI1)"]["items"].append(item)
        if index==271 or index==279:
            graph.nodes["The Neighborhood 1: Cobweb (MMI1)"]["items"].append(item)
        if 280<=index<=281:
            graph.nodes["The Neighborhood 1: Hedgetrimmers (MMI1)"]["items"].append(item)
        if index==282:
            graph.nodes["The Neighborhood 1: Rolling Pin (MMI1)"]["items"].append(item)
        if 283<=index<=285:
            graph.nodes["The Neighborhood 1: Powerlines (MMI1)"]["items"].append(item)
        if index==286:
            graph.nodes["The Neighborhood 2 (MMI2)"]["items"].append(item)
        if index==287:
            graph.nodes["The Den Mother (MMDM)"]["items"].append(item)
        if index==288 or 290<=index<=291:
            graph.nodes["The Stage (THMS)"]["items"].append(item)
        if index==289:
            graph.nodes["The Stage: Levitation (THMS)"]["items"].append(item)
        if index==292:
            graph.nodes["The Stage: Cobwebs (THMS)"]["items"].append(item)
        if 293<=index<=297:
            graph.nodes["The Stage: Storage Room (THMS)"]["items"].append(item)
        if 298<=index<=306:
            graph.nodes["The Catwalks (THCW)"]["items"].append(item)
        if index==307:
            graph.nodes["The Phantom Boss (THFB)"]["items"].append(item)
        if 308<=index<=310 or 313<=index<=316 or 318<=index<=320 or index==326:
            graph.nodes["Game Board (WWMA)"]["items"].append(item)
        if 311<=index<=312:
            graph.nodes["Game Board: Carpenter Roof (WWMA)"]["items"].append(item)
        if index==317:
            graph.nodes["Game Board: Levitation (WWMA)"]["items"].append(item)
        if 321<=index<=323:
            graph.nodes["Game Board: Cobweb (WWMA)"]["items"].append(item)
        if index==324:
            graph.nodes["Game Board: Cobweb+Levitation (WWMA)"]["items"].append(item)
        if index==325:
            graph.nodes["Game Board: Cobweb+Levitation+Pyrokinesis (WWMA)"]["items"].append(item)
        if index==327:
            graph.nodes["Game Board: Villager 1 (WWMA)"]["items"].append(item)
        if index==328:
            graph.nodes["Game Board: Knight (WWMA)"]["items"].append(item)
        if index==329:
            graph.nodes["Game Board: Villager 2 (WWMA)"]["items"].append(item)
        if 330<=index<=331:
            graph.nodes["Game Board: Villager 3 (WWMA)"]["items"].append(item)
        if index==332:
            graph.nodes["Running Against the Bull (BVRB)"]["items"].append(item)
        if 333<=index<=334:
            graph.nodes["Running Against the Bull: Levitation (BVRB)"]["items"].append(item)
        if 335<=index<=336 or 340<=index<=343:
            graph.nodes["Running Against the Bull: Cobweb (BVRB)"]["items"].append(item)
        if index==337:
            graph.nodes["Running Against the Bull: Telekinesis (BVRB)"]["items"].append(item)
        if index==338:
            graph.nodes["Running Against the Bull: Burn Logs (BVRB)"]["items"].append(item)
        if index==339:
            graph.nodes["Running Against the Bull: Garden (BVRB)"]["items"].append(item)
        if index==344:
            graph.nodes["Edgar's Sanctuary: Levitation (BVES)"]["items"].append(item)
        if 345<=index<=347:
            graph.nodes["Edgar's Sanctuary (BVES)"]["items"].append(item)
        if index==348:
            graph.nodes["Edgar's Sanctuary: Eagle Wrestler (BVES)"]["items"].append(item)
        if index==349:
            graph.nodes["Edgar's Sanctuary: Cobra (BVES)"]["items"].append(item)
        if index==350:
            graph.nodes["Edgar's Sanctuary: Boss (BVES)"]["items"].append(item)
        if 351<=index<=353:
            graph.nodes["Meat Circus Main (MCTC)"]["items"].append(item)
        if 354<=index<=361:
            graph.nodes["Meat Circus Main: Oly Escort (MCTC)"]["items"].append(item)

# Function to collect items in a node
def get_items_in_node(graph, node_name):
    if graph.has_node(node_name):
        node_data = graph.nodes[node_name]
        #Checks if location has items
        if "items" in node_data and node_data["items"]:
            print(f"Items from {node_name} collected.")
            # Create a copy of the items list
            items_to_collect = list(node_data["items"])
            # Add each item to player_inventory
            for item in items_to_collect:                
                player_inventory.append(item)
                node_data["items"].remove(item)
                #print(item)
    return None  # Node not found or no items in the node

# Function to check if the player meets the requirements to traverse an edge
def traverse_edge(graph, source_node, target_node, player_inventory):
    if graph.has_edge(source_node, target_node):
        edge_data = graph[source_node][target_node]
        if "requirements" in edge_data:  # Check if edge has requirements
            missing_items = []  # Tracks any missing items to print

            for required_item in edge_data["requirements"]:  #Compares inventory to requirements
                if required_item not in player_inventory:
                    missing_items.append(required_item)  # Add to missing items table

            if missing_items:
                print("Player is missing the following items:")
                for missing_item in missing_items:
                    print(f"- {missing_item}")
                return False  # Requirements not met

            else:  # missing_items is empty
                #print("Requirements Met!")
                get_items_in_node(graph, target_node)  # Collect all items in location!
                return True
        else:  # No specific requirements
            get_items_in_node(graph, target_node)
            return True  
    else:  # Edge doesn't exist
        print("Edge does not exist")
        return False 

def check_impossible(graph):
    if ("Lungfish Call" in graph.nodes["Asylum Grounds (ASGR)"]["items"] or
        "Lungfish Call" in graph.nodes["Asylum Grounds: Levitation (ASGR)"]["items"] or  
        "Lungfish Call" in graph.nodes["Asylum Lower Level (ASCO)"]["items"] or   
        "Lungfish Call" in graph.nodes["Asylum Lower Level: Levitation (ASCO)"]["items"] or
        "Lungfish Call" in graph.nodes["Asylum Upper Level (ASUP)"]["items"] or
        "Lungfish Call" in graph.nodes["Asylum Upper Level: Telekinesis (ASUP)"]["items"] or
        "Lungfish Call" in graph.nodes["Dr. Loboto's Laboratory (ASLB)"]["items"]):  
        # Lungfish Call behind itself
        print("Failed, Lungfish Call Impossible")
        return False
    if ("Gloria's Trophy" in graph.nodes["Asylum Upper Level (ASUP)"]["items"] or
        "Gloria's Trophy" in graph.nodes["Asylum Upper Level: Telekinesis (ASUP)"]["items"] or
        "Gloria's Trophy" in graph.nodes["Dr. Loboto's Laboratory (ASLB)"]["items"]):  
        # Gloria's Trophy behind itself
        print("Failed, Gloria's Trophy Impossible")
        return False
    if ("Straight Jacket" in graph.nodes["Asylum Upper Level (ASUP)"]["items"] or
        "Straight Jacket" in graph.nodes["Asylum Upper Level: Telekinesis (ASUP)"]["items"] or
        "Straight Jacket" in graph.nodes["Dr. Loboto's Laboratory (ASLB)"]["items"]):  
        # Straight Jacket behind itself
        print("Failed, Straight Jacket Impossible")
        return False
    if ("Lobato Painting" in graph.nodes["Asylum Upper Level (ASUP)"]["items"] or
        "Lobato Painting" in graph.nodes["Asylum Upper Level: Telekinesis (ASUP)"]["items"] or
        "Lobato Painting" in graph.nodes["Dr. Loboto's Laboratory (ASLB)"]["items"]):  
        # Lobato Painting behind itself
        print("Failed, Lobato Painting Impossible")
        return False


def create_seed():
    beatable = False
    # THIS NEEDS FIXED, LOCATIONS ARE NOT BEING CLEARED EACH LOOP
    count = 0
    while not beatable and count < 100:
        copy_list = []
        copy_list = vanilla_list
        # Shuffle item list with numbers 1 to 363 and collectible names
        item_values = list(range(1, 363))
        combined_items = list(zip(copy_list, item_values, collectiblenames))
        random.shuffle(combined_items)
        #Unzip
        shuffled_list, shuffled_values, shuffled_names = zip(*combined_items)

        # Create copy of graph for adding items and checking
        world_copy = copy.deepcopy(game_graph)

        # Put shuffled items in locations
        fill_locations(world_copy, shuffled_list)

        # Check if Seed is Beatable
        base_check = True
        base_check = check_impossible(world_copy)  #Make sure no common illegal placements
        if base_check == False:
            print("Base Check Failed.")
        else:        
            get_items_in_node(world_copy, "Start")  #Start at Start!
            print(f"Player Inventory: {player_inventory}\n")
            world_count = 0
            while "Goal" not in player_inventory and world_count < 6: 
                for source, target in world_copy.edges: # Loop through each edge
                    if not traverse_edge(world_copy, source, target, player_inventory):  #If requirements not in inventory
                        print(f"You cannot traverse from {source} to {target}.")
                        print(f"")
                print(f"Player Inventory: {player_inventory}\n")
                world_count = world_count+1
                print(f"Current World_Count", world_count)
        if "Goal" in player_inventory:
            print("Your Winner!")
            beatable = True
        else:
            print("Seed Impossible. Rerolling.")
        count = count+1
    if beatable:
        return shuffled_values, shuffled_names 
    else:
        print("Too many attempts!")
        return None

#seed, spoiler_names = create_seed()

#print(seed)
#print(spoiler_names)

