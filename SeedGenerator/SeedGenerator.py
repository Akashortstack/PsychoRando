import random
from seed_settings import spoilerlog, startcobwebduster
from location_names import locationnames
from collectible_names import collectiblenames

items = list(range(1, 363))

combined_items = list(zip(items, collectiblenames))

def check_logic():
    shuffled_items = []
    shuffled_names = []

    #Shuffle the zipped list
    random.shuffle(combined_items)
    #Unzip
    shuffled_items, shuffled_names = zip(*combined_items)

    index = 0
    length = len(shuffled_items)
    goal = True

    #Goes through list, checks for values that need logical placement
    while index < length:
        j = shuffled_items[index]

        # Checks if Lungfish Call is in AS
        if j == 1:
            if 131 <= index <= 183:
                goal = False
                break

        # Checks if Gloria's Trophy, Straight Jacket, and Lobato Painting are in Upper Floors of AS
        if j == 2 or j == 3 or j == 4:
            if 150 <= index <= 183:
                goal = False
                break
        # Checks if Stop Sign is locked behind itself in MM
        if j == 7:
            if 269 <= index <= 288:
                goal = False
                break
        index += 1

    if not goal:
        print("Seed not beatable, Re-rolling!")
        # Rerun the function
        return check_logic()
    else:
        return shuffled_items, shuffled_names

logicresults = check_logic()
shuffled_items, shuffled_names = logicresults

# Create and open the output file for RandoSeed
with open("RandoSeed.lua", "w") as file:
    # First part of coding structure
    text1 = '''function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}
      '''
    file.write(text1)

    #write cobwebduster setting, make boolean uppercase for Game
    cobwebsetting = str(startcobwebduster).upper()
    file.write(f"Ob.startcobweb = {cobwebsetting}\n")

    text2 = '''end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    '''

    file.write(text2)
  
# Write the values with formatting
    for i, value in enumerate(shuffled_items, start=1):
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
#Future Settings Option, Toggles Spoiler Log
if spoilerlog == True:
    # Create and open the output file for SpoilerLog.txt
    with open("SpoilerLog.txt", "w") as file:
        count = 1
        for locationnames, shuffled_items, shuffled_names in zip(locationnames, shuffled_items, shuffled_names):
            #Seperate Checks by Location
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

            #Write each Location with each shuffled Item
            file.write(f"LOCATION {count}: {locationnames} has ITEM {shuffled_items}: {shuffled_names}\n")
            count += 1

