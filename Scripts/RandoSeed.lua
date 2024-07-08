function RandoSeed(Ob)
        if ( not Ob ) then
            Ob = CreateObject('ScriptBase')
            Ob.seed = {}
               Ob.APfoldername = 'AP-76074518482133089472-P3'
       Ob.seedname = 'AP-P39-PsyStack'
           Ob.startlevitation = FALSE
           Ob.mentalmagnet = TRUE
           Ob.lootboxvaults = TRUE
           Ob.enemydamagemultiplier = 3
           Ob.instantdeath = TRUE
           Ob.easymillarace = TRUE
           Ob.easyflight = TRUE
           Ob.requireMC = TRUE
           Ob.deepArrowheadShuffle = TRUE
           Ob.randomizeDowsingRod = TRUE
           Ob.cobwebShuffle = TRUE
           Ob.beatoleander = TRUE
           Ob.brainhunt = TRUE
           Ob.brainsrequired = 19

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
    
    
    482, 483, 484, 485, 486, 487, 488, 489, 490, 491,
492, 493, 494, 495, 496, 497, 498, 499, 150, 500,
501, 502, 503, 504, 505, 506, 507, 508, 509, 510,
511, 512, 513, 514, 515, 180, 516, 517, 518, 519,
520, 521, 522, 160, 523, 524, 525, 526, 527, 528,
529, 151, 530, 531, 532, 533, 190, 534, 535, 536,
537, 538, 539, 540, 541, 181, 152, 542, 543, 544,
545, 546, 547, 548, 549, 550, 551, 552, 553, 554,
555, 556, 153, 161, 557, 191, 558, 559, 560, 561,
562, 192, 563, 154, 564, 565, 566, 567, 568, 569,
570, 571, 572, 573, 574, 575, 576, 219, 577, 578,
579, 580, 182, 581, 193, 194, 582, 583, 155, 584,
585, 586, 183, 587, 184, 588, 589, 590, 591, 592,
593, 594, 185, 595, 596, 597, 598, 599, 600, 601,
170, 602, 171, 195, 603, 162, 604, 172, 605, 606,
306, 607, 608, 609, 610, 611, 163, 612, 613, 614,
307, 615, 616, 617, 618, 619, 620, 621, 622, 623,
624, 625, 164, 626, 627, 156, 628, 629, 630, 631,
632, 633, 634, 635, 186, 173, 636, 637, 638, 639,
640, 641, 642, 643, 644, 645, 165, 646, 647, 648,
166, 649, 650, 651, 652, 653, 167, 654, 655, 196,
656, 174, 657, 658, 659, 660, 661, 662, 663, 664,
665, 168, 666, 667, 668, 669, 670, 671, 672, 673,
674, 675, 318, 676, 100, 677, 678, 679, 680, 681,
682, 683, 684, 685, 686, 687, 688, 689, 169, 690,
691, 692, 693, 694, 695, 696, 697, 698, 699, 700,
701, 702, 703, 704, 705, 187, 197, 706, 707, 708,
709, 710, 711, 712, 713, 714, 715, 716, 717, 188,
718, 719, 720, 175, 176, 721, 177, 722, 723, 724,
725, 198, 726, 727, 157, 728, 178, 729, 730, 731,
732, 733, 734, 735, 736, 737, 738, 739, 740, 741,
742, 189, 743, 744, 745, 746, 747, 748, 749, 750,
751, 752, 753, 754, 755, 756, 757, 758, 759, 760,
761, 762, 763, 764, 765, 766, 767, 768, 769, 770,
771, 158, 179, 772, 773, 774, 775, 776, 777, 778,
779, 780, 781, 782, 783, 199, 784, 159, 785, 786,
787, 788, 789, 790, 791,  }
        self.seed = SEED_GOES_HERE
        end
        return Ob
    end

    