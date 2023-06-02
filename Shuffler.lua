-- Run code in Lua, outputs Seed
-- Function to shuffle the list using Fisher-Yates algorithm
local function shuffleList(list)
  math.randomseed(1234)
  local random = math.random
  local length = #list
  for i = length, 2, -1 do
    local j = random(i)
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

-- Create and open the output file in write mode
local file = io.open("Seed.txt", "w")

-- Print the shuffled list with comma and line formatting to the file
for i = 1, 329 do
  file:write(list[i])
  if i % 10 == 0 then
    file:write(",\n")
  elseif i ~= 329 then
    file:write(", ")
  end
end

-- Close the file
file:close()