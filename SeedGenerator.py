import random

items = list(range(1, 356))

random.shuffle(items)

def check_logic(lst):
    index = 0
    length = len(lst)
    goal = True

    while index < length:
        j = lst[index]

        # Checks if Lungfish Call is in AS
        if j == 1:
            if 169 <= index <= 221:
                goal = False
                break

        # Checks if Gloria's Trophy, Straight Jacket, and Lobato Painting are in Upper Floors of AS
        if j == 2 or j == 3 or j == 4:
            if 188 <= index <= 221:
                goal = False
                break
        
        index += 1

    if not goal:
        print("Seed not beatable, Re-rolling!")
        # Reshuffle Items for new result
        random.shuffle(lst)
        # Rerun the function
        check_logic(lst)

check_logic(items)

# Create and open the output file in write mode
with open("RandoSeed.lua", "w") as file:
    # First part of coding structure
    text1 = '''function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}

  end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    '''

    file.write(text1)
  
# Write the values with formatting
    for i, value in enumerate(items, start=1):
        file.write(str(value))
        if i % 10 == 0:
            file.write(",\n")
        else:
            file.write(", ")

    text2 = ''' }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end

'''

    file.write(text2)