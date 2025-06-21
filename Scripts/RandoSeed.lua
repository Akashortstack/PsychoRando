function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-42883975147096234543-P1'
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
    
    
    318, 31, 120, 319, 8, 219, 29, 200, 220, 320,
221, 321, 322, 222, 323, 324, 140, 180, 325, 326,
201, 45, 327, 89, 86, 278, 328, 329, 330, 150,
331, 332, 333, 160, 334, 161, 55, 335, 110, 4,
26, 223, 314, 336, 224, 225, 337, 338, 226, 227,
339, 340, 341, 46, 342, 100, 343, 344, 345, 13,
87, 315, 67, 51, 101, 346, 228, 190, 19, 347,
229, 230, 348, 11, 202, 349, 170, 350, 191, 79,
93, 1, 231, 351, 310, 7, 352, 353, 22, 354,
317, 3, 355, 356, 357, 121, 232, 35, 358, 359,
39, 10, 279, 151, 171, 20, 192, 203, 193, 47,
360, 81, 233, 204, 234, 152, 153, 52, 361, 362,
172, 40, 18, 235, 102, 162, 280, 181, 236, 363,
364, 69, 365, 141, 27, 163, 182, 173, 164, 53,
130, 366, 154, 316, 367, 2, 368, 111, 369, 112,
142, 143, 32, 131, 174, 237, 370, 175, 33, 281,
371, 282, 238, 103, 283, 113, 205, 56, 372, 91,
239, 373, 54, 144, 145, 374, 375, 376, 122, 165,
377, 378, 132, 155, 379, 15, 133, 82, 284, 17,
206, 240, 68, 241, 207, 99, 183, 242, 14, 156,
380, 381, 243, 382, 24, 383, 184, 384, 5, 244,
78, 385, 386, 387, 75, 57, 96, 28, 114, 245,
388, 246, 247, 41, 389, 85, 390, 248, 66, 21,
176, 249, 391, 392, 393, 157, 104, 394, 58, 250,
303, 311, 395, 105, 115, 396, 158, 397, 398, 399,
34, 400, 251, 6, 208, 285, 48, 252, 401, 65,
402, 403, 166, 286, 59, 9, 404, 309, 405, 406,
134, 209, 146, 253, 407, 177, 123, 287, 408, 194,
195, 409, 16, 410, 38, 411, 412, 254, 413, 414,
255, 196, 197, 49, 167, 415, 416, 147, 312, 417,
256, 418, 419, 420, 116, 178, 421, 422, 210, 135,
76, 148, 423, 77, 185, 179, 257, 42, 288, 289,
307, 424, 97, 425, 168, 426, 159, 92, 290, 427,
186, 428, 90, 258, 429, 259, 211, 430, 431, 432,
433, 80, 434, 198, 169, 199, 94, 260, 261, 88,
306, 73, 435, 262, 187, 188, 117, 436, 83, 437,
438, 439, 440, 291, 189,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    