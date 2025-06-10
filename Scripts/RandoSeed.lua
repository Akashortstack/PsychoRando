function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-91819501072736178486-P1'
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
    
    
    120, 318, 319, 320, 150, 55, 180, 321, 322, 219,
323, 324, 140, 325, 170, 220, 110, 326, 181, 327,
328, 329, 221, 330, 222, 160, 278, 200, 39, 161,
331, 56, 111, 332, 35, 333, 334, 335, 223, 279,
4, 224, 13, 171, 336, 98, 19, 57, 162, 280,
225, 51, 73, 337, 201, 77, 338, 141, 151, 45,
33, 11, 100, 339, 130, 172, 340, 112, 121, 142,
9, 8, 341, 342, 343, 93, 173, 26, 344, 226,
227, 86, 345, 202, 346, 58, 101, 347, 348, 31,
74, 203, 204, 349, 163, 164, 350, 351, 352, 228,
353, 87, 229, 190, 354, 131, 355, 143, 152, 356,
191, 165, 357, 358, 359, 153, 102, 360, 59, 144,
361, 362, 230, 363, 364, 182, 166, 365, 366, 60,
69, 367, 231, 281, 368, 369, 370, 192, 67, 154,
145, 22, 371, 146, 113, 372, 282, 283, 155, 174,
373, 27, 193, 374, 375, 232, 61, 307, 376, 377,
36, 378, 379, 380, 114, 18, 40, 122, 233, 381,
71, 382, 234, 235, 132, 236, 383, 46, 76, 237,
238, 384, 175, 17, 37, 284, 239, 385, 115, 386,
240, 312, 52, 387, 241, 156, 388, 389, 315, 205,
68, 390, 391, 47, 314, 167, 392, 242, 393, 285,
394, 243, 395, 244, 70, 133, 286, 396, 287, 397,
245, 398, 246, 399, 247, 400, 401, 66, 248, 206,
134, 24, 402, 194, 90, 1, 95, 195, 403, 176,
62, 72, 168, 404, 249, 250, 251, 405, 252, 253,
183, 157, 406, 288, 177, 407, 135, 63, 408, 254,
178, 169, 255, 409, 158, 184, 207, 410, 311, 196,
48, 411, 412, 413, 414, 41, 208, 23, 289, 209,
256, 290, 257, 415, 185, 20, 79, 416, 258, 103,
197, 417, 136, 49, 21, 418, 419, 420, 2, 3,
291, 29, 421, 34, 422, 210, 259, 423, 104, 424,
179, 211, 82, 105, 25, 28, 306, 425, 5, 260,
292, 212, 426, 30, 261, 198, 80, 147, 106, 262,
123, 293, 263, 137, 138, 88, 294, 427, 42, 428,
429, 264, 186, 124, 94, 430, 125, 431, 199, 213,
432, 187, 188, 433, 434, 265, 159, 435, 189, 436,
437, 266, 53, 438, 16,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    