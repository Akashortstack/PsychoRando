function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-80330789412795360717-P1'
       Ob.seedname = 'AP-P1-Epsi'
           Ob.startlevitation = FALSE
           Ob.mentalmagnet = TRUE
           Ob.lootboxvaults = TRUE
           Ob.enemydamagemultiplier = 1
           Ob.instantdeath = FALSE
           Ob.easymillarace = FALSE
           Ob.easyflight = FALSE
           Ob.requireMC = TRUE
           Ob.deepArrowheadShuffle = FALSE
           Ob.randomizeDowsingRod = FALSE
           Ob.cobwebShuffle = FALSE
           Ob.beatoleander = TRUE
           Ob.brainhunt = FALSE
           Ob.brainsrequired = 10

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
    
    
    98, 95, 318, 79, 319, 320, 150, 321, 200, 201,
100, 151, 84, 322, 180, 323, 219, 324, 101, 220,
325, 326, 190, 68, 10, 202, 303, 110, 327, 328,
329, 203, 330, 51, 35, 221, 120, 306, 181, 278,
331, 93, 279, 19, 170, 140, 222, 102, 77, 160,
191, 332, 333, 69, 182, 308, 204, 223, 315, 81,
334, 335, 103, 336, 141, 337, 171, 205, 192, 193,
52, 338, 339, 88, 224, 206, 39, 340, 183, 161,
280, 225, 152, 111, 207, 112, 53, 341, 342, 40,
343, 121, 344, 113, 142, 172, 8, 55, 56, 226,
345, 114, 57, 346, 347, 104, 162, 348, 73, 349,
58, 78, 153, 350, 194, 20, 351, 227, 352, 228,
130, 173, 353, 13, 354, 229, 230, 355, 356, 357,
358, 143, 184, 359, 208, 92, 360, 361, 362, 89,
115, 11, 363, 26, 74, 364, 33, 195, 314, 365,
366, 27, 116, 71, 307, 281, 367, 368, 369, 24,
370, 131, 209, 154, 371, 372, 45, 373, 36, 96,
374, 132, 375, 231, 144, 46, 232, 37, 75, 233,
16, 376, 377, 378, 145, 379, 380, 133, 38, 99,
234, 311, 146, 155, 90, 163, 235, 65, 381, 382,
383, 105, 210, 384, 236, 185, 385, 59, 25, 386,
91, 211, 196, 60, 41, 186, 70, 387, 388, 122,
106, 174, 237, 117, 389, 156, 175, 14, 61, 238,
28, 107, 176, 390, 18, 177, 54, 47, 123, 134,
86, 282, 31, 42, 239, 212, 157, 240, 135, 21,
124, 85, 391, 197, 187, 48, 80, 392, 147, 7,
393, 164, 198, 394, 241, 67, 395, 213, 82, 165,
43, 166, 108, 396, 397, 76, 83, 148, 398, 118,
29, 44, 399, 149, 125, 72, 32, 66, 304, 49,
400, 167, 6, 401, 109, 62, 402, 242, 2, 178,
50, 188, 403, 179, 63, 30, 309, 5, 404, 405,
406, 407, 9, 408, 15, 409, 243, 3, 410, 411,
126, 412, 4, 413, 22, 414, 244, 64, 23, 127,
136, 415, 245, 246, 214, 168, 416, 247, 137, 94,
215, 119, 312, 1, 216, 158, 417, 87, 34, 418,
217, 419, 159, 169, 248, 97, 189, 218, 420, 138,
199, 17, 139, 128, 129,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    