function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}
      Ob.startcobweb = FALSE
Ob.startlevitation = TRUE
Ob.startbutton = FALSE
Ob.randomizecobwebduster = TRUE
Ob.beatoleander = TRUE
Ob.everylocationpossible = TRUE
Ob.rank101 = FALSE
Ob.brainhunt = FALSE
Ob.scavengerhunt = FALSE
Ob.fasterLO = TRUE
Ob.createhints = TRUE
Ob.majorhints = 3
Ob.powerhints = 3
Ob.minorhints = 4
Ob.spoilerlog = TRUE
end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    86, 187, 3, 120, 244, 301, 291, 269, 77, 23,
16, 210, 310, 322, 46, 230, 100, 189, 108, 74,
81, 192, 260, 148, 12, 72, 345, 243, 279, 235,
292, 280, 33, 265, 75, 284, 137, 70, 4, 97,
160, 56, 117, 2, 308, 22, 136, 214, 132, 362,
236, 71, 32, 198, 307, 105, 245, 59, 172, 115,
1, 21, 316, 50, 311, 295, 228, 267, 118, 278,
242, 129, 68, 357, 150, 208, 300, 179, 156, 122,
17, 186, 112, 324, 255, 54, 88, 213, 65, 5,
29, 283, 330, 224, 304, 113, 154, 211, 237, 319,
57, 253, 162, 109, 290, 264, 226, 130, 225, 194,
110, 313, 20, 39, 42, 317, 193, 164, 36, 188,
169, 232, 258, 209, 356, 37, 363, 144, 347, 241,
99, 367, 146, 328, 171, 342, 67, 89, 268, 259,
294, 60, 312, 116, 335, 145, 272, 181, 234, 275,
98, 138, 121, 93, 216, 302, 221, 205, 318, 346,
281, 30, 287, 161, 163, 296, 9, 80, 28, 202,
340, 298, 215, 102, 323, 92, 24, 35, 199, 167,
142, 351, 266, 27, 365, 329, 355, 190, 8, 103,
52, 106, 64, 149, 238, 15, 6, 195, 206, 182,
200, 263, 343, 276, 305, 217, 303, 47, 306, 358,
333, 250, 45, 184, 91, 240, 51, 332, 219, 43,
131, 201, 196, 123, 101, 158, 262, 38, 157, 168,
309, 337, 239, 125, 212, 40, 134, 197, 360, 13,
114, 246, 350, 128, 285, 152, 147, 133, 331, 11,
135, 143, 326, 247, 229, 124, 83, 270, 107, 53,
354, 139, 153, 176, 257, 220, 325, 173, 66, 223,
349, 49, 127, 185, 78, 18, 41, 321, 61, 73,
353, 90, 293, 336, 175, 85, 25, 14, 256, 191,
10, 34, 327, 344, 104, 334, 141, 299, 174, 341,
352, 274, 320, 289, 314, 19, 126, 62, 44, 183,
159, 271, 166, 254, 251, 48, 96, 227, 218, 222,
286, 180, 7, 119, 177, 339, 282, 178, 170, 297,
165, 84, 155, 31, 233, 273, 58, 207, 140, 277,
55, 203, 366, 82, 76, 348, 95, 364, 315, 249,
69, 288, 204, 87, 248, 231, 252, 338, 63, 79,
94, 261, 111, 151, 359, 26, 361,  }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end

