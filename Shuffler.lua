--Put code into Lua Compiler, outputs Seed
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

-- Create the list of numbers from 1 to 308
local list = {}
for i = 1, 308 do
  list[i] = i
end

-- Shuffle the list
shuffleList(list)

-- Print the shuffled list with comma and line formatting
for i = 1, 308 do
  io.write(list[i])
  if i % 10 == 0 then
    io.write(",\n")
  elseif i ~= 308 then
    io.write(", ")
  end
end


--[[Example Seed
    274, 208, 146, 152, 101, 118, 83, 244, 73, 92,
    131, 158, 174, 25, 17, 190, 70, 219, 177, 11,
    292, 225, 228, 103, 1, 77, 122, 207, 173, 235,
    234, 243, 217, 164, 71, 9, 50, 149, 86, 206,
    104, 2, 91, 215, 188, 141, 148, 105, 153, 47,
    186, 123, 230, 306, 209, 205, 281, 287, 41, 55,
    193, 289, 283, 296, 238, 285, 143, 246, 56, 109,
    97, 241, 115, 248, 20, 288, 187, 211, 78, 133,
    21, 52, 19, 61, 42, 60, 151, 231, 22, 26,
    121, 107, 232, 257, 276, 268, 44, 263, 178, 160,
    224, 204, 14, 29, 39, 181, 236, 272, 15, 301,
    262, 85, 198, 240, 166, 176, 102, 89, 54, 7,
    31, 125, 168, 171, 75, 145, 290, 65, 165, 114,
    57, 167, 303, 194, 201, 259, 112, 24, 95, 136,
    108, 264, 295, 183, 157, 179, 5, 254, 162, 36,
    53, 222, 126, 156, 293, 113, 37, 116, 138, 38,
    280, 189, 72, 93, 256, 265, 33, 277, 79, 16,
    150, 45, 68, 172, 214, 66, 237, 210, 267, 245,
    251, 12, 247, 200, 278, 154, 28, 124, 81, 74,
    239, 218, 117, 249, 227, 110, 196, 273, 269, 30,
    308, 300, 139, 59, 128, 84, 302, 266, 82, 203,
    163, 261, 282, 132, 135, 27, 98, 147, 94, 279,
    99, 304, 180, 255, 233, 4, 67, 299, 169, 23,
    284, 3, 170, 161, 226, 140, 58, 270, 134, 119,
    202, 175, 144, 213, 159, 223, 88, 294, 252, 80,
    48, 155, 130, 197, 182, 142, 199, 192, 275, 69,
    6, 40, 137, 111, 242, 271, 18, 120, 51, 96,
    35, 127, 195, 220, 46, 34, 305, 8, 43, 64,
    191, 129, 106, 32, 62, 49, 298, 216, 307, 258,
    250, 63, 13, 260, 10, 297, 87, 100, 90, 212,
    229, 291, 221, 76, 185, 184, 286, 253
    ]]