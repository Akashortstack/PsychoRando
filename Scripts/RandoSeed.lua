function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-16444427103755081185-P1'
       Ob.seedname = 'AP-P1-PsyStack'
           Ob.startlevitation = FALSE
           Ob.mentalmagnet = TRUE
           Ob.lootboxvaults = TRUE
           Ob.enemydamagemultiplier = 2
           Ob.instantdeath = FALSE
           Ob.easymillarace = TRUE
           Ob.easyflight = TRUE
           Ob.requireMC = FALSE
           Ob.deepArrowheadShuffle = FALSE
           Ob.randomizeDowsingRod = FALSE
           Ob.cobwebShuffle = TRUE
           Ob.beatoleander = FALSE
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
    
    
    318, 482, 9, 483, 484, 319, 150, 320, 321, 322,
151, 200, 485, 201, 180, 39, 323, 486, 45, 15,
67, 110, 22, 324, 316, 170, 171, 325, 100, 172,
487, 181, 488, 489, 182, 326, 490, 183, 140, 327,
202, 328, 491, 492, 98, 152, 120, 493, 494, 329,
495, 496, 330, 219, 331, 220, 83, 203, 303, 8,
497, 498, 82, 332, 221, 499, 500, 333, 501, 334,
335, 336, 337, 338, 339, 51, 502, 101, 160, 19,
503, 10, 204, 504, 340, 505, 341, 130, 309, 184,
18, 342, 40, 1, 343, 344, 506, 222, 507, 161,
345, 508, 509, 510, 511, 512, 346, 513, 347, 223,
224, 514, 173, 348, 185, 349, 350, 153, 351, 515,
352, 516, 52, 353, 354, 517, 111, 355, 80, 518,
519, 520, 521, 356, 41, 205, 112, 357, 358, 73,
96, 190, 522, 523, 524, 225, 525, 526, 527, 278,
528, 359, 66, 226, 17, 310, 95, 55, 529, 191,
530, 531, 65, 162, 163, 102, 532, 533, 360, 186,
361, 154, 534, 70, 113, 362, 363, 364, 365, 366,
367, 535, 46, 2, 536, 368, 7, 537, 174, 227,
164, 369, 538, 539, 228, 540, 29, 541, 542, 3,
187, 543, 229, 370, 544, 545, 546, 547, 548, 549,
371, 165, 166, 114, 155, 92, 550, 35, 24, 551,
552, 188, 372, 553, 554, 56, 555, 373, 556, 31,
90, 103, 115, 557, 558, 559, 560, 374, 375, 376,
230, 97, 141, 377, 104, 378, 379, 231, 561, 175,
206, 105, 562, 563, 81, 380, 167, 176, 33, 381,
382, 121, 383, 384, 156, 564, 565, 566, 567, 568,
569, 192, 177, 385, 207, 386, 387, 74, 168, 388,
193, 389, 194, 195, 390, 570, 196, 391, 57, 53,
178, 571, 208, 89, 157, 312, 392, 304, 142, 572,
393, 394, 573, 197, 395, 42, 396, 232, 397, 574,
575, 398, 576, 399, 577, 578, 579, 158, 400, 401,
402, 580, 581, 159, 582, 403, 189, 233, 404, 405,
406, 234, 235, 407, 583, 584, 408, 585, 409, 410,
586, 411, 587, 412, 588, 589, 26, 198, 590, 413,
169, 209, 591, 210, 211, 414, 592, 593, 415, 212,
199, 213, 179, 416, 417,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    