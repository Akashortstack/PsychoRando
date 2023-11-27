import networkx as nx
import random
import copy
import configparser
from item_names import item_names_list
from SpoilerLogFiles.item_spoiler import item_spoiler_list
from SpoilerLogFiles.location_spoiler import location_spoiler_list

# Create a configparser object
config = configparser.ConfigParser()

# Read the config.ini file
config.read('config.ini')

# Config.ini SeedSettings 
seed_settings_startcobwebduster = config['SeedSettings']['startcobwebduster']
seed_settings_startlevitation = config['SeedSettings']['startlevitation']
seed_settings_randomizecobwebduster = config['SeedSettings']['randomizecobwebduster']
seed_settings_everylocationpossible = config['SeedSettings']['everylocationpossible']

# Config.ini VictoryConditions
seed_settings_beatoleander = config['VictoryConditions']['beatoleander']
seed_settings_rank101 = config['VictoryConditions']['rank101']
seed_settings_brainhunt = config['VictoryConditions']['brainhunt']
seed_settings_scavengerhunt = config['VictoryConditions']['scavengerhunt']

# Config.ini QualityOfLife 
seed_settings_fasterLO = config['QualityOfLife']['fasterLO']

# Config.ini AdditionalFiles 
seed_settings_spoilerlog = config['AdditionalFiles']['spoilerlog']



# Create Game Graph
game_graph = nx.Graph()

#Empty Inventory Table
empty_inventory = []

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

# DUMMY LOCATION FOR COBWEB DUSTER
game_graph.add_node("DUMMY LOCATION (NOT COLLECTIBLE)", items = []) # Dummy location for handling Cobweb Duster Randomization

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
game_graph.add_edge("Start", "Victory", requirements = [])

# Add Cobweb Duster to logic starting inventory if not randomized
if seed_settings_startlevitation == 'True':
    empty_inventory.append("Levitation")

# Add Levitation to logic starting inventory if starting with it
if seed_settings_randomizecobwebduster == 'False' or seed_settings_startcobwebduster == 'True':
    empty_inventory.append("Cobweb Duster")

if seed_settings_everylocationpossible == 'True':
    game_graph.edges["Start", "Victory"]["requirements"].extend(["Cobweb Duster", "Levitation", "Pyrokinesis", "Telekinesis", "Confusion", "Marksmanship", "Clairvoyance", "Shield", "Invisibility", 
    "Lungfish Call", "Lobato Painting", "Gloria's Trophy", "Straight Jacket", "Cake", "Candle1", "Candle2", "Megaphone", "Prop Sign", "Prop Plunger", "Prop Flowers", "Prop HedgeTrimmers", "Prop Rolling Pin", "Fred's Letter", "Priceless Coin", "Musket",])
elif seed_settings_beatoleander == 'True':
    game_graph.edges["Start", "Victory"]["requirements"].extend(["Cobweb Duster", "Levitation", "Pyrokinesis", "Telekinesis", "Lungfish Call", "Lobato Painting", "Gloria's Trophy", "Straight Jacket", "Cake",])

if seed_settings_brainhunt == 'True':  #Add all brains to victory requirement
    game_graph.edges["Start", "Victory"]["requirements"].extend([
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
    ])

if seed_settings_scavengerhunt == 'True':  #Add all scav hunt items to victory requirement
   game_graph.edges["Start", "Victory"]["requirements"].extend([
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
    ])


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
        if 230<=index<=232:
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
        #Dummy Location for Cobweb Duster Randomization
        if 362<=index:
            graph.nodes["DUMMY LOCATION (NOT COLLECTIBLE)"]["items"].append(item)


# Function to collect items in a node
def get_items_in_node(graph, node_name, inventory):
    if graph.has_node(node_name):
        node_data = graph.nodes[node_name]
        #Checks if location has items
        if "items" in node_data and node_data["items"]:
            print(f"Items from {node_name} collected.")
            # Create a copy of the items list
            items_to_collect = list(node_data["items"])
            # Add each item to player_inventory
            for item in items_to_collect:                
                inventory.append(item)
                node_data["items"].remove(item)
                #print(item)
    return None  # Node not found or no items in the node

# Function to check if the player meets the requirements to traverse an edge
def traverse_edge(graph, source_node, target_node, inventory):
    if graph.has_edge(source_node, target_node):
        edge_data = graph[source_node][target_node]
        if "requirements" in edge_data:  # Check if edge has requirements
            missing_items = []  # Tracks any missing items to print

            for required_item in edge_data["requirements"]:  #Compares inventory to requirements
                if required_item not in inventory:
                    missing_items.append(required_item)  # Add to missing items table

            if missing_items:
                print("Player is missing the following items:")
                for missing_item in missing_items:
                    print(f"- {missing_item}")
                return False  # Requirements not met

            else:  # missing_items is empty
                #print("Requirements Met!")
                get_items_in_node(graph, target_node, inventory)  # Collect all items in location!
                return True
        else:  # No specific requirements
            get_items_in_node(graph, target_node, inventory)
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
    count = 0
    while not beatable and count < 50:
        copy_list = []
        copy_list = item_names_list
        # Shuffle item list with numbers 1 to 364 and item names
        # MUST BE ONE MORE THAN TOTAL ITEMS IN GAME
        item_values = list(range(1, 365))
        combined_items = list(zip(copy_list, item_values, item_spoiler_list))
        random.shuffle(combined_items)
        #Unzip
        shuffled_list, shuffled_values, shuffled_names = zip(*combined_items)

        # Create copy of graph for adding items and checking
        world_copy = copy.deepcopy(game_graph)

        #Create copy of empty inventory
        player_inventory = copy.deepcopy(empty_inventory)

        # Handle Randomize Cobweb Setting
        if seed_settings_randomizecobwebduster == 'False' or seed_settings_startcobwebduster == 'True':
            # Remove Cobweb Duster from list and place at end
            shuffled_list = [item for item in shuffled_list if item != 'Cobweb Duster']
            shuffled_list.append('Cobweb Duster')
            shuffled_values = [item for item in shuffled_values if item != 364]
            shuffled_values.append(364)
        else:
            # Remove Card107 and place at end if randomizecobweduster == True
            shuffled_list = [item for item in shuffled_list if item != 'Card107']
            shuffled_list.append('Card107')
            shuffled_values = [item for item in shuffled_values if item != 359]
            shuffled_values.append(359)

        # Handle Start Levitation Setting
        if seed_settings_startlevitation == 'True':
            # Remove StartLevitation from list and place at end
            shuffled_list = [item for item in shuffled_list if item != 'StartLevitation']
            shuffled_list.append('StartLevitation')
            shuffled_values = [item for item in shuffled_values if item != 26]
            shuffled_values.append(26)
        else:
            # Remove Card108 and place at end if randomizecobweduster == True
            shuffled_list = [item for item in shuffled_list if item != 'Card108']
            shuffled_list.append('Card108')
            shuffled_values = [item for item in shuffled_values if item != 360]
            shuffled_values.append(360)

        # Put shuffled items in locations
        fill_locations(world_copy, shuffled_list)

        # Check if Seed is Beatable
        base_check = True
        base_check = check_impossible(world_copy)  #Make sure no common illegal placements
        if base_check == False:
            print("Base Check Failed.")
        else:        
            get_items_in_node(world_copy, "Start", player_inventory)  #Start at Start!
            print(f"Player Inventory: {player_inventory}\n")
            world_count = 0
            while "Goal" not in player_inventory and world_count < 10: 
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

seed, spoiler_names = create_seed()

# Create and open the output file for RandoSeed
with open("RandoSeed.lua", "w") as file:
    # First part of coding structure
    text1 = '''function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}
      '''
    file.write(text1)
    
    # Section where all settings booleans are written to RandoSeed.lua

    # write startcobwebduster setting, make boolean uppercase for Game
    startcobwebsetting = str(seed_settings_startcobwebduster).upper()
    file.write(f"Ob.startcobweb = {startcobwebsetting}\n")

    # write startcobwebduster setting, make boolean uppercase for Game
    startlevitationsetting = str(seed_settings_startlevitation).upper()
    file.write(f"Ob.startlevitation = {startlevitationsetting}\n")

    # write randomizecobwebduster setting, make boolean uppercase for Game
    randomizecobwebsetting = str(seed_settings_randomizecobwebduster).upper()
    file.write(f"Ob.randomizecobwebduster = {randomizecobwebsetting}\n")

    # write beatoleander setting, make boolean uppercase for Game
    beatoleandersetting = str(seed_settings_beatoleander).upper()
    file.write(f"Ob.beatoleander = {beatoleandersetting}\n")

    # write everylocationpossible setting, make boolean uppercase for Game
    everylocationpossiblesetting = str(seed_settings_everylocationpossible).upper()
    file.write(f"Ob.everylocationpossible = {everylocationpossiblesetting}\n")

    # write rank101 setting, make boolean uppercase for Game
    rank101setting = str(seed_settings_rank101).upper()
    file.write(f"Ob.rank101 = {rank101setting}\n")

    # write brainhunt setting, make boolean uppercase for Game
    brainhuntsetting = str(seed_settings_brainhunt).upper()
    file.write(f"Ob.brainhunt = {brainhuntsetting}\n")

    # write scavengerhunt setting, make boolean uppercase for Game
    scavengerhuntsetting = str(seed_settings_scavengerhunt).upper()
    file.write(f"Ob.scavengerhunt = {scavengerhuntsetting}\n")

    # write fasterLOsetting setting, make boolean uppercase for Game
    fasterLOsetting = str(seed_settings_fasterLO).upper()
    file.write(f"Ob.fasterLO = {fasterLOsetting}\n")


    text2 = '''end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    '''

    file.write(text2)
  
# Write the values with formatting
    for i, value in enumerate(seed, start=1):
        file.write(str(value))
        if i % 10 == 0:
            file.write(",\n")
        else:
            file.write(", ")

    #Second part of coding structure
    text3 = ''' }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end

'''

    file.write(text3)
#Toggles Spoiler Log
if seed_settings_spoilerlog == 'True':
    print ('Spoiler Log True!')
    # Create and open the output file for SpoilerLog.txt
    with open("SpoilerLog.txt", "w") as file:
        count = 1
        if seed_settings_randomizecobwebduster == 'False' or seed_settings_startcobwebduster == 'True':
            # Remove Cobweb Duster from list and place at end
            spoiler_names = [item for item in spoiler_names if item != 'Rando Cobweb Duster']
            spoiler_names.append('Rando Cobweb Duster')
            seed = [item for item in seed if item != 364]
            seed.append('364')
        else:
            # Remove Card107 and place at end if randomizecobweduster == True
            spoiler_names = [item for item in spoiler_names if item != 'Card107']
            spoiler_names.append('Card107')
            seed = [item for item in seed if item != 359]
            seed.append('359')

        # Handle Start Levitation Setting
        if seed_settings_startlevitation == 'True':
            # Remove StartLevitation from list and place at end
            spoiler_names = [item for item in spoiler_names if item != 'Levitation1']
            spoiler_names.append('Levitation1')
            seed = [item for item in seed if item != 26]
            seed.append('26')
        else:
            # Remove Card108 and place at end if randomizecobweduster == True
            spoiler_names = [item for item in spoiler_names if item != 'Card108']
            spoiler_names.append('Card108')
            seed = [item for item in seed if item != 360]
            seed.append('360')

        #Seperate Checks by Location
        for location_spoiler_list, seed, spoiler_names in zip(location_spoiler_list, seed, spoiler_names):
            # Handle Randomize Cobweb Setting
            
            if count == 1:
                file.write(f"Sasha's Underground Lab (CASA)\n")

            if count == 4:
                file.write(f"\nGPC and Wilderness (CAGP)\n")

            if count == 28:
                file.write(f"\nMain Campgrounds (CAMA)\n")

            if count == 49:
                file.write(f"\nKids' Cabins (CAKC)\n")

            if count == 64:
                file.write(f"\nReception Area (CARE)\n")

            if count == 89:
                file.write(f"\nLake and Boathouse (CABH)\n")

            if count == 108:
                file.write(f"\nMain Lodge (CALI)\n")

            if count == 109:
                file.write(f"\nFord's Sanctuary (CAJA)\n")

            if count == 111:
                file.write(f"\nRando Only Rank Checks (CABH)\n")

            if count == 131:
                file.write(f"\nAsylum Grounds (ASGR)\n")

            if count == 150:
                file.write(f"\nAsylum Upper Level (ASUP)\n")

            if count == 176:
                file.write(f"\nDr. Lobato's Laboratory (ASLB)\n")

            if count == 184:
                file.write(f"\nObstacle Course 1 (BBA1)\n")

            if count == 188:
                file.write(f"\nObstacle Course 2 (BBA2)\n")

            if count == 196:
                file.write(f"\nObstacle Course Finale (BBLT)\n")

            if count == 199:
                file.write(f"\nCube Face 1 (SACU)\n")

            if count == 205:
                file.write(f"\nCube Face 2 (SACU)\n")

            if count == 208:
                file.write(f"\nCube Face 3 (SACU)\n")

            if count == 212:
                file.write(f"\nCube Face 4 (SACU)\n")

            if count == 216:
                file.write(f"\nThe Lounge (MIFL)\n")

            if count == 226:
                file.write(f"\nThe Party (MILL)\n")

            if count == 231:
                file.write(f"\nThe Nightmare Woods (NIMP)\n")

            if count == 244:
                file.write(f"\nThe Brain Tank (NIBA)\n")

            if count == 245:
                file.write(f"\nLungfishopolis City (LOMA)\n")

            if count == 262:
                file.write(f"\nKochamara Arena (LOCB)\n")

            if count == 265:
                file.write(f"\nThe Neighborhood 1 (MMI1)\n")

            if count == 287:
                file.write(f"\nThe Neighborhood 2 (MMI2)\n")

            if count == 289:
                file.write(f"\nThe Stage (THMS)\n")

            if count == 299:
                file.write(f"\nThe Catwalks (THCW)\n")

            if count == 309:
                file.write(f"\nWaterloo World (WWMA)\n")

            if count == 333:
                file.write(f"\nRunning Against the Bull (BVRB)\n")

            if count == 345:
                file.write(f"\nEdgar's Sanctuary (BVES)\n")

            if count == 352:
                file.write(f"\nMeat Circus Main (MCTC)\n")
                
            if count == 363:
                file.write(f"\nDUMMY LOCATIONS (NOT COLLECTIBLE)\n")

            #Write each Location with each shuffled Item
            file.write(f"LOCATION {count}: {location_spoiler_list} has ITEM {seed}: {spoiler_names}\n")
            count += 1





