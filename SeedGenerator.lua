-- Run code in Lua, outputs Seed
-- Function to shuffle the list using Fisher-Yates algorithm
local function shuffleList(list)
  --edit to set the seed
  math.randomseed(os.time())
  local length = #list
  for i = length, 2, -1 do
    local j = math.random(i)
    list[i], list[j] = list[j], list[i]
  end
end

-- Create the list of numbers from 1 to 329
local list = {}
for i = 1, 329 do
  list[i] = i
end

-- Shuffle the list
shuffleList(list)

--function to make sure that a seed is still beatable.
local function checkLogic(list)
  local index = 1
  local length = #list
  --as long as goal = true, the seed is beatable
  local goal = true
  --go through all values in list table
  for i = 1, length do
    local j = list[index]
    --checks Lungfish Call
    if j == 1 then
      --checks all positions in AS, reroll if here
      if index >= 169 and index <= 221 then
        goal = false
        break
      --[[elseif index >= 

      ]]
      end
    end
    --checks Gloria's Trophy, StraightJacket, and Lobato Painting
    if j == 2 or j == 3 or j == 4 then
      --checks positions in ASUP and ASLB, reroll if here
      if index >= 188 and index <= 221 then
        goal = false
        break
      --[[elseif index >= 

      ]]
      end
    end
    index = index+1

  end

  
  if goal == false then
    print("Seed not beatable, Re-rolling!")
    --reshuffle
    shuffleList(list)
    --rerun function
    checkLogic(list)
  end

end

checkLogic(list)

-- Create and open the output file in write mode
local file = io.open("RandoSeed.lua", "w")

--first part of coding structure
local text1 = [[function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}

  end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  ]]

  file:write(text1)
  
  -- Print the shuffled list with comma and line formatting to the file
  for i = 1, 329 do
      file:write(list[i])
      if i % 10 == 0 then
      file:write(",\n")
      elseif i ~= 329 then
      file:write(", ")
      end
  end

  local text2 = [[ }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end]]

  file:write(text2)

  -- Close the file
  file:close()
