function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-66370525605349028724-P1'
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
           Ob.brainsrequired = 15

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
    
    
    19, 140, 75, 317, 318, 150, 319, 69, 320, 160,
219, 321, 322, 323, 120, 324, 325, 326, 100, 327,
220, 221, 200, 310, 222, 170, 79, 55, 303, 223,
224, 101, 328, 51, 171, 329, 330, 225, 9, 180,
331, 226, 227, 332, 228, 229, 121, 333, 95, 230,
334, 172, 161, 278, 102, 231, 335, 181, 182, 183,
279, 336, 10, 103, 24, 97, 91, 201, 151, 337,
141, 104, 232, 338, 280, 339, 340, 341, 342, 281,
99, 343, 314, 130, 344, 345, 52, 346, 39, 347,
131, 83, 348, 94, 110, 162, 349, 282, 350, 72,
351, 184, 132, 190, 283, 142, 56, 352, 353, 354,
173, 233, 234, 355, 356, 20, 143, 235, 89, 357,
236, 237, 238, 239, 358, 191, 152, 359, 360, 163,
185, 361, 70, 240, 45, 46, 362, 363, 40, 133,
122, 241, 81, 88, 111, 105, 192, 364, 365, 242,
144, 366, 186, 123, 112, 29, 174, 367, 106, 26,
145, 193, 164, 194, 368, 308, 47, 369, 243, 78,
370, 371, 195, 196, 244, 372, 373, 76, 374, 153,
375, 197, 245, 376, 284, 377, 246, 285, 378, 379,
380, 16, 381, 165, 154, 22, 382, 383, 65, 306,
202, 41, 175, 384, 176, 385, 57, 80, 247, 203,
386, 387, 113, 177, 313, 388, 204, 74, 73, 114,
389, 248, 124, 390, 198, 391, 249, 392, 250, 77,
251, 393, 166, 252, 253, 309, 187, 58, 394, 205,
395, 115, 396, 92, 33, 125, 206, 67, 188, 254,
397, 398, 399, 59, 400, 401, 402, 21, 146, 167,
255, 307, 403, 286, 13, 256, 199, 257, 207, 189,
5, 287, 404, 288, 405, 93, 289, 406, 407, 8,
290, 408, 409, 410, 35, 168, 291, 411, 412, 258,
413, 414, 116, 259, 60, 147, 38, 34, 27, 155,
260, 117, 261, 107, 1, 134, 415, 135, 262, 416,
417, 418, 42, 419, 87, 420, 84, 208, 156, 4,
157, 292, 126, 108, 421, 209, 422, 423, 96, 178,
169, 66, 293, 424, 61, 304, 25, 127, 17, 316,
136, 425, 31, 426, 137, 263, 427, 148, 428, 429,
264, 430, 179, 210, 431, 48, 53, 30, 158, 432,
294, 433, 265, 159, 266,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    