function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-88073023299098964611-P1'
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
    
    
    170, 219, 318, 73, 319, 220, 87, 320, 321, 322,
110, 221, 222, 78, 278, 160, 150, 323, 324, 325,
326, 79, 91, 45, 190, 327, 120, 223, 224, 328,
329, 55, 330, 56, 331, 279, 22, 75, 225, 332,
226, 307, 280, 180, 161, 281, 181, 191, 333, 35,
334, 140, 335, 227, 336, 308, 33, 228, 68, 100,
89, 171, 337, 162, 151, 172, 282, 338, 303, 339,
283, 192, 72, 163, 340, 341, 182, 76, 111, 342,
343, 344, 345, 229, 230, 346, 19, 347, 200, 36,
71, 57, 231, 348, 130, 58, 69, 349, 350, 351,
112, 352, 353, 152, 354, 8, 284, 131, 26, 355,
59, 113, 70, 356, 357, 232, 358, 359, 46, 183,
360, 201, 38, 141, 361, 80, 121, 362, 37, 164,
363, 165, 285, 51, 364, 365, 142, 366, 29, 193,
202, 194, 367, 30, 17, 368, 233, 234, 27, 166,
235, 369, 236, 203, 370, 60, 5, 204, 371, 205,
173, 372, 61, 167, 237, 62, 238, 13, 132, 133,
239, 373, 240, 241, 93, 374, 39, 375, 153, 24,
242, 376, 377, 243, 101, 195, 47, 286, 378, 40,
102, 379, 380, 103, 381, 48, 382, 206, 31, 244,
196, 90, 245, 104, 287, 246, 383, 14, 184, 10,
384, 385, 386, 15, 387, 154, 388, 247, 88, 197,
389, 248, 249, 74, 250, 105, 390, 63, 306, 391,
143, 94, 174, 122, 392, 251, 49, 393, 52, 66,
394, 311, 123, 252, 288, 175, 41, 176, 253, 185,
395, 106, 396, 20, 254, 255, 134, 86, 397, 256,
398, 399, 400, 257, 258, 259, 81, 289, 401, 402,
107, 177, 198, 403, 404, 405, 114, 290, 53, 291,
155, 292, 406, 11, 207, 407, 408, 409, 410, 411,
95, 156, 309, 178, 25, 412, 293, 413, 304, 1,
54, 414, 208, 42, 415, 209, 416, 417, 21, 418,
67, 135, 419, 420, 210, 294, 421, 168, 211, 422,
23, 423, 313, 424, 260, 425, 186, 144, 261, 295,
426, 427, 157, 34, 136, 212, 179, 187, 108, 428,
158, 429, 430, 43, 431, 4, 432, 137, 433, 434,
435, 44, 436, 115, 437, 262, 16, 438, 159, 199,
169, 188, 439, 189, 263,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    