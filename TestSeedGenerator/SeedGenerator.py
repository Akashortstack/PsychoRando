import random
#import seed_settings
from location_names import location_table
from item_names import item_pool
import world_graph

def check_logic():
    #set up empty tables
    shuffled_items = []
    fake_inventory = []
    victory_condition = ["Telekinesis", "Levitation", "Pyro"]
    #set goal to False until Win Condition Met
    goal = False
    #set loop to True
    loop = True

    #Shuffle the list
    random.shuffle(item_pool)
    shuffled_items = item_pool

    #for world_graph:
        

        

    #check if Goal = True, reroll if False
    if not goal:
        print("Seed not beatable, Re-rolling!")
        return check_logic()
    else:
        print("WINNER!")
        return shuffled_items

logicresults = check_logic()
for results in logicresults:
    print(results)




