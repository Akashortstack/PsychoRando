import random

items = list(range(1, 361))

def check_logic(lst):
    random.shuffle(lst)

    # Checks if Lungfish Call is in AS
    # Checks if Gloria's Trophy, Straight Jacket, and Lobato Painting are in Upper Floors of AS
    if 169 <= lst.index(1) <= 221 or 188 <= lst.index(2) <= 221 or 188 <= lst.index(3) <= 221 or 188 <= lst.index(4) <= 221:
        print("Seed not beatable, Re-rolling! ")
        check_logic(lst)
    # Checks if Clairvoyance is unobtainable.
    # Avoiding Clairvoyance being locked in MM and ASUP with one disguise/lungfishcall item also being in those locations
    if ((222 <= lst.index(33) <= 245 and 222 <= lst.index(34) <= 245 
    or (222 <= lst.index(33) <= 245 and 188 <= lst.index(34) <= 221 or 222 <= lst.index(34) <= 245 and 188 <= lst.index(33) <= 221)) 
    and (222 <= lst.index(1) <= 245 or 222 <= lst.index(2) <= 245 or 222 <= lst.index(3) <= 245 or 222 <= lst.index(4) <= 245)):
        print("Clairvoyances were in MM/ASUP with a disguise in those levels too or both were in MM with a disguise item also in MM ")
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