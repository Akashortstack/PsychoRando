function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-57804410417386798936-P9'
       Ob.seedname = 'AP-P9-PsyStack'
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
    
    
    170, 482, 483, 484, 485, 486, 487, 200, 488, 489,
490, 318, 491, 492, 493, 180, 494, 495, 496, 278,
497, 498, 319, 499, 171, 500, 501, 502, 503, 504,
505, 160, 506, 507, 508, 509, 510, 161, 511, 512,
513, 514, 72, 515, 516, 517, 172, 518, 519, 520,
521, 173, 162, 522, 190, 523, 174, 320, 524, 525,
526, 181, 527, 528, 529, 530, 531, 532, 219, 533,
534, 535, 536, 537, 538, 539, 540, 321, 541, 542,
543, 544, 545, 546, 547, 548, 549, 550, 551, 150,
163, 552, 553, 554, 555, 556, 557, 558, 559, 151,
560, 191, 561, 562, 279, 563, 564, 565, 566, 152,
567, 568, 569, 192, 570, 571, 572, 573, 574, 575,
175, 576, 577, 578, 579, 580, 581, 582, 583, 584,
585, 164, 586, 587, 588, 589, 322, 590, 591, 592,
593, 165, 594, 595, 596, 597, 598, 599, 600, 601,
602, 603, 604, 605, 606, 607, 166, 608, 609, 610,
611, 612, 613, 614, 615, 616, 617, 618, 619, 620,
621, 622, 623, 193, 624, 625, 167, 626, 627, 628,
629, 630, 153, 631, 632, 633, 634, 635, 636, 637,
638, 182, 639, 640, 641, 642, 643, 24, 183, 644,
645, 646, 647, 648, 649, 650, 651, 652, 220, 653,
184, 654, 655, 656, 657, 658, 659, 660, 661, 662,
154, 663, 664, 665, 666, 667, 668, 669, 670, 671,
672, 673, 674, 675, 676, 677, 678, 679, 185, 323,
680, 681, 682, 683, 684, 685, 324, 325, 686, 687,
688, 689, 690, 26, 691, 692, 186, 693, 694, 695,
696, 697, 698, 699, 700, 701, 702, 703, 704, 705,
155, 706, 176, 187, 707, 194, 708, 709, 710, 711,
712, 713, 714, 715, 716, 717, 168, 718, 719, 720,
721, 722, 723, 326, 724, 725, 726, 727, 728, 729,
730, 731, 732, 733, 734, 735, 736, 737, 738, 739,
156, 740, 741, 742, 743, 744, 745, 746, 747, 157,
6, 748, 749, 750, 751, 752, 753, 754, 177, 755,
158, 756, 757, 758, 195, 759, 159, 196, 760, 327,
761, 197, 762, 763, 764, 765, 766, 767, 768, 198,
769, 199, 178, 169, 770, 179, 771, 772, 188, 773,
774, 775, 328, 189, 776,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    