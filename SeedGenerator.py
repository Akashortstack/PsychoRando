import random

items = list(range(1, 356))

random.shuffle(items)

def check_logic(lst):
    index = 0
    length = len(lst)
    goal = True
    lungfishcall = 0
    firstClairo = 0
    trophy = 0
    jacket = 0
    painting = 0

    while index < length:
        j = lst[index]

        # Checks if Lungfish Call is in AS
        if j == 1:
            lungfishcall = index
            if 169 <= index <= 221:
                goal = False
                break

        # Checks if Gloria's Trophy, Straight Jacket, and Lobato Painting are in Upper Floors of AS
        if j == 2 or j == 3 or j == 4:
            if j == 2: trophy = index
            if j == 3: jacket = index
            if j == 4: painting = index
            if 188 <= index <= 221:
                goal = False
                break

        if j == 33: firstClairo = index
        if j == 34:
            # Checks if Clairvoyance is unobtainable.
            # Avoiding Clairvoyance being locked in MM and ASUP with one disguise/lungfishcall item also being in those locations
            if ((222 <= firstClairo <= 245 and 222 <= index <= 245 
            or (222 <= firstClairo <= 245 and 188 <= index <= 221 or 222 <= index <= 245 and 188 <= firstClairo <= 221)) 
            and (222 <= trophy <= 245 or 222 <= jacket <= 245 or 222 <= painting <= 245 or 222 <= lungfishcall <= 245)):
                print("Clairvoyances were in MM/ASUP with a disguise in those levels too or both were in MM with a disguise item also in MM")
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