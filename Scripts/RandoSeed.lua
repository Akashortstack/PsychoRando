function RandoSeed(Ob)
  if ( not Ob ) then
      Ob = CreateObject('ScriptBase')
      Ob.seed = {}

  end

  function Ob:fillTable()
      --PASTE SEED STRING HERE
      local SEED_GOES_HERE = {
      
  
    194, 290, 20, 275, 344, 196, 284, 178, 152, 8,
183, 179, 221, 106, 292, 180, 245, 236, 80, 324,
157, 348, 335, 23, 74, 227, 118, 113, 319, 28,
269, 39, 116, 355, 258, 33, 351, 59, 218, 219,
155, 317, 149, 63, 62, 327, 111, 345, 337, 24,
121, 293, 298, 304, 129, 108, 168, 299, 61, 222,
296, 265, 311, 313, 82, 190, 263, 264, 177, 220,
241, 19, 75, 139, 14, 18, 119, 223, 13, 276,
161, 262, 2, 249, 36, 307, 189, 334, 315, 101,
81, 10, 84, 330, 169, 350, 95, 181, 167, 200,
312, 213, 117, 96, 336, 280, 209, 279, 156, 30,
287, 128, 232, 274, 64, 303, 145, 201, 243, 239,
4, 197, 254, 229, 134, 314, 54, 247, 154, 224,
300, 318, 322, 237, 202, 140, 17, 238, 109, 114,
228, 29, 260, 225, 301, 259, 70, 158, 22, 77,
87, 58, 347, 326, 130, 208, 349, 257, 76, 125,
53, 193, 203, 352, 207, 99, 11, 67, 21, 27,
234, 184, 266, 65, 210, 25, 256, 91, 85, 44,
42, 354, 56, 186, 6, 138, 302, 16, 233, 205,
147, 252, 40, 127, 52, 89, 126, 72, 320, 271,
148, 310, 41, 253, 37, 34, 31, 338, 146, 66,
151, 78, 333, 98, 217, 71, 211, 282, 170, 198,
153, 159, 187, 332, 143, 94, 86, 46, 255, 289,
123, 174, 283, 141, 35, 226, 308, 90, 281, 215,
69, 235, 142, 144, 340, 137, 272, 251, 92, 176,
5, 261, 12, 79, 192, 240, 32, 185, 7, 97,
165, 45, 60, 353, 73, 135, 93, 278, 55, 68,
212, 112, 216, 331, 206, 15, 268, 124, 102, 277,
48, 133, 306, 162, 163, 1, 248, 172, 273, 160,
341, 295, 242, 100, 182, 286, 288, 173, 132, 49,
297, 3, 230, 195, 136, 122, 26, 309, 316, 131,
115, 246, 291, 321, 305, 267, 166, 171, 104, 38,
339, 328, 88, 150, 188, 105, 50, 110, 57, 191,
285, 51, 107, 43, 250, 199, 175, 329, 294, 164,
120, 342, 270, 204, 9, 231, 47, 323, 325, 244,
214, 346, 103, 343, 83,  }
  self.seed = SEED_GOES_HERE
  end
  return Ob
  end
