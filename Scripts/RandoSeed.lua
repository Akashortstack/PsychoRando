function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}
      Ob.startcobweb = FALSE
Ob.startlevitation = TRUE
Ob.startbutton = TRUE
Ob.randomizecobwebduster = TRUE
Ob.beatoleander = TRUE
Ob.everylocationpossible = TRUE
Ob.rank101 = TRUE
Ob.brainhunt = TRUE
Ob.scavengerhunt = FALSE
Ob.fasterLO = TRUE
Ob.createhints = TRUE
Ob.majorhints = 3
Ob.powerhints = 3
Ob.minorhints = 4
Ob.spoilerlog = TRUE
Ob.beatalllevels = TRUE
end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    232, 310, 275, 364, 87, 16, 80, 219, 217, 197,
300, 13, 279, 82, 353, 108, 127, 111, 210, 97,
137, 194, 41, 222, 78, 296, 17, 145, 183, 269,
336, 289, 317, 93, 285, 342, 112, 25, 198, 94,
255, 64, 262, 243, 245, 184, 74, 239, 43, 139,
58, 182, 196, 273, 247, 77, 42, 290, 155, 67,
27, 263, 161, 367, 354, 259, 8, 95, 291, 304,
331, 46, 109, 45, 36, 30, 323, 306, 278, 286,
52, 132, 66, 113, 22, 327, 125, 335, 83, 21,
1, 351, 96, 271, 270, 321, 152, 356, 330, 98,
28, 192, 9, 329, 362, 133, 227, 325, 267, 168,
114, 260, 63, 249, 61, 203, 328, 253, 62, 47,
258, 51, 174, 164, 268, 251, 274, 148, 237, 84,
186, 341, 195, 340, 57, 225, 358, 205, 334, 220,
305, 337, 284, 189, 295, 345, 135, 153, 282, 19,
117, 59, 142, 5, 357, 338, 294, 360, 246, 318,
70, 221, 69, 29, 102, 277, 355, 150, 7, 316,
165, 147, 90, 103, 48, 162, 131, 37, 81, 213,
160, 68, 309, 324, 231, 2, 223, 106, 50, 252,
143, 11, 319, 6, 320, 208, 85, 24, 287, 236,
315, 349, 216, 248, 49, 75, 89, 138, 297, 265,
178, 199, 201, 363, 250, 54, 224, 229, 365, 167,
200, 56, 175, 60, 266, 126, 181, 215, 312, 332,
179, 172, 35, 188, 307, 128, 343, 339, 120, 101,
154, 121, 257, 193, 71, 33, 264, 39, 352, 157,
170, 23, 283, 347, 110, 344, 38, 119, 4, 302,
166, 204, 272, 146, 44, 79, 104, 18, 99, 171,
115, 140, 12, 73, 241, 158, 242, 190, 123, 134,
141, 314, 55, 333, 209, 156, 163, 20, 187, 86,
350, 240, 218, 159, 346, 322, 212, 72, 234, 280,
130, 124, 299, 288, 235, 293, 149, 301, 254, 105,
122, 326, 34, 100, 313, 311, 303, 15, 202, 185,
91, 169, 31, 276, 107, 76, 129, 207, 176, 238,
191, 228, 32, 92, 348, 136, 298, 177, 308, 233,
292, 88, 211, 65, 226, 244, 206, 14, 118, 144,
214, 281, 40, 10, 173, 261, 53, 180, 256, 230,
366, 3, 116, 151, 359, 26, 361,  }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end

