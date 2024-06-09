function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-83506009546779567359-P1'
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
    
    
    75, 310, 318, 190, 100, 101, 319, 130, 3, 26,
320, 80, 45, 321, 322, 170, 150, 278, 323, 324,
219, 220, 221, 222, 223, 325, 326, 224, 327, 311,
38, 191, 328, 171, 91, 329, 330, 312, 151, 331,
332, 333, 334, 335, 82, 225, 279, 18, 24, 55,
226, 336, 280, 31, 227, 5, 228, 281, 200, 152,
337, 192, 46, 282, 338, 74, 102, 339, 120, 88,
340, 22, 283, 121, 229, 103, 140, 341, 104, 98,
172, 342, 343, 344, 47, 230, 153, 16, 345, 110,
346, 173, 347, 348, 349, 154, 56, 201, 350, 351,
352, 174, 313, 131, 353, 354, 111, 231, 355, 84,
356, 357, 358, 17, 284, 29, 359, 360, 361, 362,
232, 233, 122, 160, 8, 193, 234, 105, 93, 363,
364, 365, 180, 123, 366, 161, 181, 51, 235, 285,
39, 236, 367, 368, 369, 370, 237, 371, 94, 372,
141, 373, 238, 374, 239, 162, 57, 375, 155, 182,
376, 142, 286, 377, 378, 163, 156, 13, 164, 379,
143, 194, 380, 202, 240, 19, 195, 144, 183, 381,
287, 40, 196, 241, 175, 9, 382, 383, 384, 20,
132, 385, 157, 176, 112, 386, 387, 317, 388, 389,
390, 391, 392, 58, 242, 27, 11, 203, 308, 393,
165, 145, 394, 146, 395, 67, 7, 166, 288, 396,
397, 113, 309, 289, 158, 71, 184, 243, 197, 114,
124, 41, 398, 99, 30, 52, 244, 245, 42, 115,
399, 89, 400, 401, 246, 79, 402, 106, 247, 177,
403, 404, 21, 133, 405, 406, 407, 408, 35, 409,
43, 44, 410, 411, 248, 412, 76, 204, 413, 59,
249, 85, 290, 414, 33, 415, 291, 250, 167, 251,
306, 185, 416, 292, 417, 69, 418, 419, 420, 252,
293, 421, 186, 422, 73, 253, 254, 159, 255, 198,
423, 199, 256, 36, 178, 257, 294, 205, 424, 258,
179, 425, 72, 307, 426, 65, 168, 427, 95, 37,
53, 295, 23, 169, 428, 429, 107, 430, 431, 187,
108, 206, 125, 126, 34, 432, 116, 433, 434, 435,
259, 207, 208, 436, 260, 188, 437, 304, 83, 60,
438, 54, 189, 439, 261, 440, 441, 262, 209, 210,
442, 443, 147, 32, 263,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    