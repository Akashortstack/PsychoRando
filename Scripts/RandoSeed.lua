function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}
      Ob.seedname = 'im3CGkDPmH6Fp59Q'
Ob.startcobweb = TRUE
Ob.startlevitation = TRUE
Ob.startbutton = TRUE
Ob.randomizecobwebduster = TRUE
Ob.everylocationpossible = TRUE
Ob.instantdeath = FALSE
Ob.harderbutton = TRUE
Ob.beatoleander = TRUE
Ob.beatalllevels = FALSE
Ob.rank101 = FALSE
Ob.brainhunt = FALSE
Ob.scavengerhunt = FALSE
Ob.fasterLO = TRUE
Ob.easymillarace = FALSE
Ob.earlyelevator = FALSE
Ob.mentalmagnet = TRUE
Ob.removetutorials = TRUE
Ob.easyflight = FALSE
Ob.createhints = TRUE
Ob.spoilerlog = TRUE
end

  function Ob:fillTable()
      local SEED_GOES_HERE = {
      
  
    291, 214, 221, 81, 170, 121, 116, 290, 134, 255,
199, 64, 174, 346, 56, 222, 259, 129, 311, 110,
310, 308, 209, 78, 355, 68, 158, 67, 17, 324,
223, 61, 179, 130, 140, 293, 12, 198, 332, 127,
338, 215, 362, 74, 139, 261, 301, 313, 135, 138,
164, 354, 120, 103, 11, 24, 235, 250, 6, 187,
185, 145, 183, 358, 328, 280, 60, 96, 276, 66,
63, 48, 238, 189, 233, 169, 106, 305, 249, 216,
20, 288, 151, 242, 71, 336, 240, 38, 326, 19,
115, 207, 163, 241, 167, 15, 279, 111, 273, 330,
266, 122, 282, 47, 213, 70, 234, 265, 182, 331,
105, 13, 329, 147, 246, 180, 142, 350, 304, 284,
126, 84, 46, 33, 245, 217, 278, 107, 37, 349,
178, 112, 264, 229, 224, 62, 128, 162, 166, 298,
193, 132, 55, 79, 306, 303, 45, 54, 345, 321,
87, 114, 161, 76, 237, 239, 294, 258, 77, 334,
154, 335, 31, 204, 16, 309, 364, 196, 190, 73,
206, 253, 300, 285, 92, 211, 314, 286, 186, 322,
88, 94, 93, 347, 42, 312, 302, 208, 315, 325,
1, 99, 136, 327, 225, 175, 80, 181, 172, 150,
270, 101, 9, 244, 287, 289, 159, 91, 4, 268,
144, 148, 160, 353, 171, 262, 281, 113, 28, 104,
351, 227, 283, 299, 295, 366, 124, 356, 232, 360,
152, 18, 318, 155, 137, 25, 342, 23, 343, 236,
316, 97, 173, 5, 39, 344, 210, 89, 352, 307,
317, 32, 274, 157, 188, 65, 296, 90, 202, 257,
191, 363, 192, 184, 100, 194, 146, 8, 365, 203,
231, 361, 44, 323, 251, 49, 348, 58, 220, 21,
230, 339, 109, 34, 367, 30, 119, 267, 35, 272,
195, 2, 50, 82, 86, 51, 118, 212, 22, 95,
85, 131, 197, 341, 3, 143, 218, 177, 7, 252,
269, 36, 117, 340, 153, 243, 201, 102, 40, 200,
52, 14, 69, 165, 271, 72, 29, 247, 320, 337,
292, 357, 98, 141, 108, 205, 149, 41, 27, 319,
168, 359, 226, 275, 10, 43, 59, 263, 125, 277,
297, 260, 176, 83, 57, 53, 228, 248, 219, 75,
156, 133, 333, 123, 256, 26, 254,  }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end

