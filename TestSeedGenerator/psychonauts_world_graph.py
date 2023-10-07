import networkx as nx

game_graph = nx.Graph()

# Add nodes (locations) to the graph

# WHISPERING ROCK SUMMER CAMP
game_graph.add_node("Start", items = [])  # Sasha's Underground Lab (CASA)
game_graph.add_node("GPC and Wilderness (CAGP)", items = [])
game_graph.add_node("GPC Squirrel (CAGP)", items = [])  # Need Invisibility
game_graph.add_node("GPC Geyser (CAGP)", items = [])  # Need Shield

game_graph.add_node("Main Campgrounds (CAMA)", items = [])
game_graph.add_node("Main Campgrounds: Levitation (CAMA)", items = []) # Need Levitation

game_graph.add_node("Kids' Cabins (CAKC)", items = [])
game_graph.add_node("Kids' Cabins: Levitation (CAKC)", items = [])  # Need Levitation
game_graph.add_node("Kids' Cabins: Pyrokinesis (CAKC)", items = [])  # Need Pyrokinesis

game_graph.add_node("Reception Area (CARE)", items = [])
game_graph.add_node("Reception Area: Levitation (CARE)", items = [])  # Need Levitation
game_graph.add_node("Reception Area: Marksmanship (CARE)", items = [])  # Need Marksmanship

game_graph.add_node("Lake and Boathouse (CABH)", items = [])
game_graph.add_node("Lake and Boathouse: Levitation (CABH)", items = [])  # Need Levitation

game_graph.add_node("Main Lodge (CALI)", items = [])

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
game_graph.add_node("Obstacle Course 1 + Finale (BBA1)", items = [])
game_graph.add_node("Obstacle Course 2: Cobweb (BBA2)", items = [])  # Need Cobweb Duster

# SASHA'S SHOOTING GALLERY
game_graph.add_node("SASHA'S SHOOTING GALLERY (SA)", items = [])
game_graph.add_node("Cube Face 2: Levitation (SACU)", items = [])  # Need Levitation

# MILLA'S DANCE PARTY
game_graph.add_node("MILLA'S DANCE PARTY (MI)", items = [])

# BRAIN TUMBLER EXPERIMENT
game_graph.add_node("The Nightmare Woods (NIMP)", items = [])
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

game_graph.add_node("The Neighborhood 2 (MMI2)", items = [])  # Need Plunger, Flowers, Pyrokinesis
game_graph.add_node("The Neighborhood 2: Cobweb (MMI2)", items = [])  # Need Cobweb
game_graph.add_node("The Den Mother (MMDM)", items = [])  # Need Invisibility

# GLORIA'S THEATER
game_graph.add_node("The Stage (THMS)", items = [])
game_graph.add_node("The Stage: Levitation (THMS)", items = [])  # Need Levitation
game_graph.add_node("The Stage: Cobwebs (THMS)", items = [])  # Need Cobweb Duster
game_graph.add_node("The Stage: Storage Room (THMS)", items = [])  # Need Invisibility

game_graph.add_node("The Catwalks (THCW)", items = [])  # Need Pyrokinesis, Candle, Megaphone
game_graph.add_node("The Phantom Boss (THFB)", items = [])  # Need Candle x2, Levitation

# WATERLOO WORLD 
game_graph.add_node("Game Board (WWMA)", items = [])
game_graph.add_node("Game Board: Levitation (WWMA)", items = [])  # Need Levitation
game_graph.add_node("Game Board: Carpenter Roof (WWMA)", items = [])  # Need Levitation, Invis
game_graph.add_node("Game Board: Cobweb (WWMA)", items = [])  # Need Cobweb Duster
game_graph.add_node("Game Board: Cobweb+Levitation (WWMA)", items = [])  # Need Cobweb Duster, Levitation
game_graph.add_node("Game Board: Cobweb+Levitation+Pyrokinesis (WWMA)", items = [])  # Need Cobweb Duster, Levitation, Pyrokinesis

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
game_graph.add_edge("Start", "GPC and Wilderness (CAGP)")
game_graph.add_edge("Start", "GPC Squirrel (CAGP)", requirements = ["Invisibility",])  # Need Invisibility
game_graph.add_edge("Start", "GPC Geyser (CAGP)", requirements = ["Shield",])  # Need Shield

game_graph.add_edge("Start", "Main Campgrounds (CAMA)")
game_graph.add_edge("Start", "Main Campgrounds: Levitation (CAMA)", requirements = ["Levitation",]) # Need Levitation

game_graph.add_edge("Start", "Kids' Cabins (CAKC)")
game_graph.add_edge("Start", "Kids' Cabins: Levitation (CAKC)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Kids' Cabins: Pyrokinesis (CAKC)", requirements = ["Pyrokinesis",])  # Need Pyrokinesis

game_graph.add_edge("Start", "Reception Area (CARE)")
game_graph.add_edge("Start", "Reception Area: Levitation (CARE)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Reception Area: Marksmanship (CARE)", requirements = ["Marksmanship",])  # Need Marksmanship

game_graph.add_edge("Start", "Lake and Boathouse (CABH)")
game_graph.add_edge("Start", "Lake and Boathouse: Levitation (CABH)", requirements = ["Levitation",])  # Need Levitation

game_graph.add_edge("Start", "Main Lodge (CALI)")

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
game_graph.add_edge("Start", "Obstacle Course 1 + Finale (BBA1)")
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
game_graph.add_edge("Start", "The Neighborhood 1: Hedgetrimmers (MMI1)", requirements = ["Clairvoyance", "Prop Sign", "Need Hedgetrimmers",])  # Need Hedgetrimmers
game_graph.add_edge("Start", "The Neighborhood 1: Rolling Pin (MMI1)", requirements = ["Clairvoyance", "Prop Sign", "Need Hedgetrimmers", "Rolling Pin",])  # Need Rolling Pin
game_graph.add_edge("Start", "The Neighborhood 1: Powerlines (MMI1)", requirements = ["Cobweb Duster", "Clairvoyance", "Pyrokinesis", "Prop Sign", "Plunger", "Flowers",])  # Need Phone (Plunger, Flowers, Pyrokinesis, Cobweb Duster)
game_graph.add_edge("Start", "The Neighborhood 1: Cobweb (MMI1)", requirements = ["Cobweb Duster", "Clairvoyance", "Prop Sign",])  # Need Cobweb Duster

game_graph.add_edge("Start", "The Neighborhood 2 (MMI2)", requirements = ["Clairvoyance", "Pyrokinesis", "Prop Sign", "Plunger", "Flowers",])  # Need Plunger, Flowers, Pyrokinesis
game_graph.add_edge("Start", "The Neighborhood 2: Cobweb (MMI2)", requirements = ["Cobweb Duster", "Clairvoyance", "Pyrokinesis", "Prop Sign", "Plunger", "Flowers",])  # Need Cobweb Duster
game_graph.add_edge("Start", "The Den Mother (MMDM)", requirements = ["Cobweb Duster", "Clairvoyance", "Invisibility", "Pyrokinesis", "Prop Sign", "Plunger", "Flowers",])  # Need Invisibility

# GLORIA'S THEATER
game_graph.add_edge("Start", "The Stage (THMS)")
game_graph.add_edge("Start", "The Stage: Levitation (THMS)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "The Stage: Cobwebs (THMS)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "The Stage: Storage Room (THMS)", requirements = ["Cobweb Duster", "Invisibility",])  # Need Invisibility

game_graph.add_edge("Start", "The Catwalks (THCW)", requirements = ["Cobweb Duster", "Invisibility", "Pyrokinesis", "Megaphone", "Candle1",])  # Need Pyrokinesis, Megaphone, Candle1 
game_graph.add_edge("Start", "The Phantom Boss (THFB)", requirements = ["Cobweb Duster", "Invisibility", "Pyrokinesis", "Megaphone", "Candle1", "Candle2", "Levitation",])  # Need Candle2, Levitation

# WATERLOO WORLD 
game_graph.add_edge("Start", "Game Board (WWMA)")
game_graph.add_edge("Start", "Game Board: Levitation (WWMA)", requirements = ["Levitation",])  # Need Levitation
game_graph.add_edge("Start", "Game Board: Carpenter Roof (WWMA)", requirements = ["Levitation", "Invisibility",])  # Need Levitation, Invisibility
game_graph.add_edge("Start", "Game Board: Cobweb (WWMA)", requirements = ["Cobweb Duster",])  # Need Cobweb Duster
game_graph.add_edge("Start", "Game Board: Cobweb+Levitation (WWMA)", requirements = ["Cobweb Duster", "Levitation",])  # Need Cobweb Duster, Levitation
game_graph.add_edge("Start", "Game Board: Cobweb+Levitation+Pyrokinesis (WWMA)", requirements = ["Cobweb Duster", "Levitation", "Pyrokinesis",])  # Need Cobweb Duster, Levitation, Pyrokinesis

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

#If player has all these, WIN
victory_condition = ["Goal"]
