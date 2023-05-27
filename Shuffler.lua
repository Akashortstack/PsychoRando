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

-- Create the list of numbers from 1 to 306
local list = {}
for i = 1, 306 do
  list[i] = i
end

-- Shuffle the list
shuffleList(list)

-- Print the shuffled list with comma and line formatting
for i = 1, 306 do
  io.write(list[i])
  if i % 10 == 0 then
    io.write(",\n")
  elseif i ~= 306 then
    io.write(", ")
  end
end