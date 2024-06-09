function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-19189783734879691146-P1'
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
    
    
    219, 318, 220, 319, 55, 24, 110, 9, 39, 320,
321, 322, 180, 221, 323, 10, 83, 181, 170, 324,
222, 99, 223, 200, 325, 326, 224, 278, 33, 100,
327, 150, 120, 328, 225, 329, 171, 111, 330, 160,
226, 121, 95, 331, 332, 333, 201, 8, 334, 45,
279, 335, 35, 182, 161, 336, 172, 4, 337, 338,
130, 131, 173, 339, 340, 341, 227, 342, 96, 202,
190, 101, 151, 343, 344, 112, 228, 26, 345, 346,
1, 347, 229, 280, 19, 81, 281, 102, 348, 349,
203, 350, 351, 282, 352, 353, 354, 56, 355, 230,
231, 232, 356, 140, 315, 66, 357, 358, 92, 2,
141, 233, 174, 11, 16, 359, 113, 93, 360, 36,
361, 234, 3, 132, 362, 363, 175, 235, 204, 29,
364, 94, 236, 191, 365, 366, 237, 17, 367, 368,
369, 238, 40, 205, 152, 283, 370, 371, 372, 373,
122, 374, 239, 176, 27, 57, 183, 375, 240, 18,
51, 376, 241, 153, 377, 314, 65, 46, 378, 31,
242, 192, 123, 379, 380, 114, 381, 41, 243, 154,
193, 382, 383, 6, 194, 244, 304, 142, 58, 162,
206, 103, 245, 74, 184, 246, 247, 317, 163, 248,
143, 155, 30, 384, 47, 385, 306, 386, 249, 195,
28, 156, 52, 284, 387, 388, 389, 157, 390, 133,
164, 391, 285, 392, 75, 393, 250, 394, 395, 59,
308, 42, 251, 396, 397, 37, 398, 185, 104, 207,
399, 144, 400, 13, 401, 309, 402, 20, 208, 403,
145, 252, 404, 76, 405, 406, 134, 313, 253, 177,
254, 186, 255, 256, 89, 86, 286, 165, 407, 408,
409, 410, 135, 105, 209, 411, 146, 158, 147, 412,
413, 257, 414, 77, 287, 48, 258, 124, 288, 187,
289, 106, 166, 53, 415, 259, 416, 167, 188, 417,
210, 97, 418, 115, 69, 70, 419, 43, 168, 420,
260, 22, 196, 44, 421, 80, 422, 423, 424, 49,
71, 197, 425, 198, 125, 199, 290, 291, 426, 427,
261, 428, 148, 87, 262, 429, 263, 7, 82, 14,
178, 430, 292, 310, 431, 23, 432, 126, 179, 21,
159, 433, 264, 116, 434, 435, 107, 265, 436, 169,
189, 15, 266, 437, 438,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    