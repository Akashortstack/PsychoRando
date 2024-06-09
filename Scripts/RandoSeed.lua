function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-87414924517826279004-P1'
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
           Ob.cobwebShuffle = TRUE
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
    
    
    219, 318, 220, 319, 320, 170, 200, 93, 120, 201,
22, 221, 45, 77, 171, 140, 70, 321, 130, 150,
322, 323, 121, 96, 151, 46, 316, 222, 55, 324,
223, 325, 71, 224, 80, 326, 202, 47, 56, 122,
100, 314, 327, 278, 9, 141, 203, 57, 328, 38,
329, 330, 225, 142, 331, 332, 333, 334, 226, 335,
152, 336, 97, 153, 279, 110, 180, 190, 4, 337,
227, 228, 338, 229, 339, 340, 99, 341, 58, 230,
131, 342, 19, 51, 172, 343, 191, 173, 344, 345,
204, 346, 123, 347, 348, 231, 349, 350, 280, 124,
232, 351, 192, 352, 181, 101, 281, 353, 154, 354,
182, 160, 355, 356, 233, 357, 358, 359, 31, 360,
361, 74, 132, 161, 234, 26, 362, 282, 48, 235,
174, 363, 317, 125, 78, 364, 49, 365, 283, 13,
3, 366, 367, 284, 368, 236, 8, 369, 133, 370,
10, 126, 371, 5, 372, 134, 102, 373, 237, 183,
374, 162, 375, 155, 376, 238, 39, 285, 156, 239,
163, 240, 377, 111, 18, 378, 379, 380, 184, 308,
286, 287, 381, 382, 24, 73, 241, 242, 243, 244,
245, 383, 143, 384, 288, 289, 175, 246, 112, 247,
81, 385, 386, 248, 387, 52, 388, 16, 185, 164,
249, 389, 390, 250, 391, 205, 135, 392, 69, 393,
394, 395, 396, 397, 398, 399, 40, 193, 20, 400,
186, 401, 176, 251, 402, 29, 206, 403, 252, 404,
113, 405, 114, 406, 407, 194, 68, 408, 409, 410,
411, 290, 177, 253, 103, 309, 207, 144, 412, 195,
208, 413, 104, 145, 115, 11, 254, 165, 414, 255,
6, 415, 416, 291, 127, 417, 196, 209, 256, 418,
50, 419, 420, 421, 257, 146, 157, 258, 32, 166,
422, 158, 116, 117, 259, 197, 89, 90, 307, 23,
159, 423, 424, 53, 292, 311, 136, 312, 425, 426,
59, 260, 41, 167, 198, 178, 293, 42, 427, 261,
428, 429, 21, 98, 262, 294, 263, 84, 264, 430,
137, 105, 431, 88, 265, 306, 43, 432, 33, 168,
199, 60, 433, 434, 435, 14, 266, 187, 210, 83,
436, 106, 179, 437, 438, 188, 439, 267, 211, 66,
212, 169, 17, 189, 30,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    