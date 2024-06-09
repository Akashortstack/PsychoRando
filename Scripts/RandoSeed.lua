function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-70706364687625879175-P1'
       Ob.seedname = 'AP-P1-PsyStack'
           Ob.startlevitation = FALSE
           Ob.mentalmagnet = TRUE
           Ob.lootboxvaults = TRUE
           Ob.enemydamagemultiplier = 2
           Ob.instantdeath = FALSE
           Ob.easymillarace = TRUE
           Ob.easyflight = TRUE
           Ob.requireMC = FALSE
           Ob.deepArrowheadShuffle = TRUE
           Ob.randomizeDowsingRod = TRUE
           Ob.beatoleander = TRUE
           Ob.brainhunt = TRUE
           Ob.brainsrequired = 13

        Ob.isAP = TRUE
        Ob.startcobweb = FALSE
        Ob.startbutton = FALSE
        Ob.randomizecobwebduster = TRUE
        Ob.everylocationpossible = FALSE
        Ob.harderbutton = FALSE
        Ob.beatalllevels = FALSE
        Ob.rank101 = FALSE
        Ob.scavengerhunt = FALSE
        Ob.fasterLO = TRUE
        Ob.earlyelevator = FALSE
        Ob.removetutorials = TRUE
        Ob.createhints = FALSE
        Ob.spoilerlog = FALSE
    
    end
    
    function Ob:fillTable()
    local SEED_GOES_HERE = {
    
    
    219, 220, 200, 31, 221, 190, 170, 39, 40, 278,
222, 140, 318, 141, 201, 191, 41, 319, 73, 192,
223, 279, 202, 150, 320, 66, 224, 225, 193, 11,
321, 100, 110, 322, 323, 280, 171, 324, 19, 281,
310, 226, 13, 151, 282, 325, 95, 326, 327, 227,
82, 328, 228, 329, 55, 330, 9, 194, 111, 331,
307, 26, 120, 283, 229, 332, 203, 88, 101, 86,
333, 160, 22, 102, 334, 335, 38, 230, 231, 35,
45, 317, 309, 232, 336, 337, 161, 338, 306, 152,
56, 204, 172, 339, 340, 341, 342, 162, 90, 313,
343, 163, 344, 284, 91, 233, 285, 180, 112, 345,
173, 234, 286, 130, 18, 235, 142, 103, 346, 51,
205, 174, 72, 164, 24, 236, 131, 206, 207, 165,
166, 347, 87, 46, 237, 143, 348, 208, 349, 104,
238, 239, 57, 79, 113, 7, 350, 351, 352, 353,
240, 33, 354, 355, 181, 287, 76, 356, 357, 153,
358, 359, 360, 182, 288, 361, 5, 362, 241, 47,
78, 16, 144, 154, 155, 58, 242, 175, 83, 363,
93, 243, 209, 364, 365, 121, 42, 195, 315, 366,
156, 244, 367, 196, 132, 368, 176, 369, 245, 370,
371, 36, 177, 246, 247, 29, 372, 316, 52, 133,
373, 157, 105, 4, 248, 134, 114, 249, 374, 289,
375, 303, 210, 75, 115, 178, 183, 376, 250, 251,
377, 184, 252, 197, 53, 116, 378, 27, 253, 145,
290, 254, 23, 85, 379, 291, 122, 255, 380, 256,
292, 123, 381, 257, 14, 8, 34, 258, 198, 259,
43, 167, 382, 44, 59, 211, 135, 383, 384, 385,
60, 260, 185, 212, 311, 106, 293, 261, 186, 136,
158, 262, 32, 199, 294, 386, 68, 387, 388, 389,
263, 37, 124, 264, 168, 1, 390, 20, 213, 159,
295, 117, 265, 97, 146, 214, 98, 61, 169, 391,
137, 125, 392, 296, 92, 266, 297, 15, 267, 179,
70, 10, 147, 48, 96, 6, 107, 138, 393, 187,
298, 49, 126, 394, 395, 268, 269, 396, 127, 188,
128, 80, 189, 89, 270, 397, 304, 398, 399, 400,
271, 139, 118, 401, 402, 81, 403, 404, 21, 272,
25, 2, 299, 405, 406,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    