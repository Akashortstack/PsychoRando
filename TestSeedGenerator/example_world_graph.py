import networkx as nx
import random

game_graph = nx.Graph()

# Add nodes (locations) to the graph
game_graph.add_node("Start", items  = [])
game_graph.add_node("Castle", items = [])
game_graph.add_node("Forest", items = [])
game_graph.add_node("Cave", items = [])
game_graph.add_node("Victory", items = ["Goal",])

#If player has all these, WIN
victory_condition = ["Goal"]

#Add edges to the graph
game_graph.add_edge("Start", "Cave", requirements = ["Levitation", "Pyro",])
game_graph.add_edge("Start", "Castle")
game_graph.add_edge("Start", "Forest", requirements = ["Chungus",])
game_graph.add_edge("Start", "Victory", requirements = ["Levitation", "Pyro", "Telekinesis", "Chungus",])

# Sample list of items
vanilla_list = ["apple", "banana", "cherry", "Levitation", "date", "elderberry", "orange", "Chungus", "Pyro", "Telekinesis",]

shuffled_list = []

#Empty Inventory Table
player_inventory = []

# Function to check indexes in list and add to location
def fill_locations(graph, item_list):
    for index, item in enumerate(item_list):
        if 0<=index<=2:
            # Access the "items" attribute of the Start node and append the item to it
            graph.nodes["Start"]["items"].append(item)
        elif 3<=index<=5:
            # Access the "items" attribute of the Castle node and append the item to it
            graph.nodes["Castle"]["items"].append(item)
        elif 6<=index<=8:
            # Access the "items" attribute of the Castle node and append the item to it
            graph.nodes["Forest"]["items"].append(item)
        else:
            # Access the "items" attribute of the Castle node and append the item to it
            graph.nodes["Cave"]["items"].append(item)

# Function to collect items in a node
def get_items_in_node(node_name):
    if game_graph.has_node(node_name):
        node_data = game_graph.nodes[node_name]
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
                print("Requirements Met!")
                get_items_in_node(target_node)  # Collect all items in location!
                return True
        else:  # No specific requirements
            get_items_in_node(target_node)
            return True  
    else:  # Edge doesn't exist
        print("Edge does not exist")
        return False  

def check_game():
    get_items_in_node("Start")  #Start at Start!
    print(f"Player Inventory: {player_inventory}\n")
    count = 0
    while "Goal" not in player_inventory and count <= 5: 
        for source, target in game_graph.edges: # Loop through each edge
            if not traverse_edge(game_graph, source, target, player_inventory):  #If requirements not in inventory
                print(f"You cannot traverse from {source} to {target}.")
            print(f"Player Inventory: {player_inventory}\n")

        count = count+1
        print(f"Current Count", count)
    if "Goal" in player_inventory:
        print("Your Winner!")
    else:
        print("Seed Impossible. Try Again.")

# Shuffle original item list
shuffled_list = vanilla_list
random.shuffle(shuffled_list)

# Put shuffled items in locations
fill_locations(game_graph, shuffled_list)

# Check if Seed is Beatable
check_game()


