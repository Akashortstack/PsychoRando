if not kfRAZ_HEIGHT then
	kfRAZ_HEIGHT = 150
	kfRAZ_HEAD_RADIUS = 40
end
  
g_CommonAnims = [[
Anims/DartNew/actionfall.jan
Anims/DartNew/climbledge.jan
Anims/DartNew/etherdance.jan
Anims/DartNew/landsoft.jan
anims/confusionballs/idle_air.jan
anims/confusionballs/idle_ground_loop1.jan
anims/confusionballs/idle_ground_loop2.jan
anims/confusionballs/idle_ground_start.jan
anims/confusionballs/run.jan
anims/confusionballs/squash.jan
anims/confusionbomb/airidle.jan
anims/confusionbomb/bounce.jan
anims/confusionbomb/static.jan
anims/confusionbomb/throw.jan
anims/DartNew/180.jan
anims/dartnew/1mautomount.jan
anims/dartnew/actionfall.jan
anims/dartnew/balloonbuttbouncea.jan
anims/dartnew/balloonbuttbouncea4m.jan
anims/dartnew/balloonbuttbounceb.jan
anims/dartnew/balloondoublejumpa.jan
anims/dartnew/balloonidlefb.jan
anims/dartnew/balloonmount.jan
Anims/DartNew/balloonrun.jan
anims/dartnew/balloonspeedmount.jan
Anims/DartNew/balloonwalk.jan
Anims/DartNew/balloonwalkslow.jan
Anims/DartNew/BodyParts/DusterRetractIdle_ShoulderJALf_1.jan
Anims/DartNew/BodyParts/DusterRetract_ShoulderJALf_1.jan
Anims/DartNew/BodyParts/DusterShoot_ShoulderJALf_1.jan
Anims/DartNew/BodyParts/DusterSpin_ShoulderJALf_1.jan
Anims/DartNew/BodyParts/HoldDowsingRod_SpineJA.jan
Anims/DartNew/BodyParts/HoldFishWhistle.jan
Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan
Anims/DartNew/BodyParts/Hold_Candle_spineJA_1.jan
Anims/DartNew/BodyParts/Hold_FistLoosePalmDn_ArmLf.jan
Anims/DartNew/BodyParts/Hold_FistLoosePalmIn_ArmLf.jan
Anims/DartNew/BodyParts/Hold_FistLoosePalmUp_ArmLf.jan
Anims/DartNew/BodyParts/Hold_FistWidePalmUp_ArmLf.jan
Anims/DartNew/BodyParts/Hold_PinchPalmDn_ArmLf.jan
Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan
Anims/DartNew/BodyParts/Hold_SmellingSalts_ArmLf.jan
Anims/DartNew/BodyParts/Listen_FordHints_priority.jan
Anims/DartNew/BodyParts/LookDown.jan
Anims/DartNew/BodyParts/LookUp_headJA_1.jan
Anims/DartNew/BodyParts/PopperEmptyHold_ArmLf.jan
anims/dartnew/bubblejump.jan
anims/dartnew/canoeidle.jan
anims/dartnew/canoeride.jan
Anims/DartNew/CantBkwdPoses.jan
Anims/DartNew/Cantbreathe.jan
anims/dartnew/cantdismountbkwd.jan
anims/dartnew/cantdismountfwd.jan
Anims/DartNew/CantFwdPoses.jan
anims/dartnew/canthandstandturn.jan
Anims/DartNew/CantileverToTightrope.jan
anims/dartnew/cantmntshldr.jan
Anims/DartNew/CantShimmyLeft.jan
Anims/DartNew/CantShimmyRight.jan
anims/DartNew/CartwheelLeft.jan
anims/DartNew/CartwheelRight.jan
anims/dartnew/climbledge.jan
Anims/DartNew/ConfusionBomb.jan
anims/dartnew/cower.jan
anims/DartNew/creep.jan
anims/dartnew/creepmove.jan
Anims/DartNew/DamageBack_low.jan
Anims/DartNew/DamageBack_medium.jan
Anims/DartNew/DamageFront_low.jan
Anims/DartNew/DamageFront_medium.jan
Anims/DartNew/DamageLf.jan
Anims/DartNew/DamageRt.jan
anims/dartnew/dance01.jan
anims/dartnew/dance02.jan
anims/dartnew/dance03.jan
anims/dartnew/dance05.jan
anims/dartnew/danceloop_01.jan
anims/dartnew/danceloop_02.jan
anims/dartnew/danceloop_03.jan
Anims/DartNew/DartFrontalKnockback.jan
Anims/DartNew/DartIdle01.jan
Anims/DartNew/DartIdle02.jan
anims/dartnew/dartidle03.jan
anims/dartnew/dartidle04.jan
Anims/DartNew/DartIdleEye01.jan
anims/dartnew/dartidleeye02.jan
anims/dartnew/dartidleshrug.jan
Anims/DartNew/DartTeeter_cycle.jan
anims/dartnew/dart_death.jan
Anims/DartNew/Death.jan
anims/dartnew/default_pose_lf.jan
anims/dartnew/default_pose_rt.jan
Anims/DartNew/DemonDitch_GrabReaction.jan
Anims/DartNew/Dizzy.jan
anims/dartnew/doublejump.jan
Anims/DartNew/DragonRoarReaction.jan
Anims/DartNew/EagleAttack.jan
Anims/Dartnew/FeatherTickle.jan
anims/dartnew/firestart_end.jan
anims/dartnew/firestart_loop.jan
Anims/DartNew/FishWhistle.jan
Anims/DartNew/Flattened.jan
Anims/DartNew/Flattened_wiggle.jan
Anims/DartNew/FordHint.jan
Anims/DartNew/gesture01.jan
Anims/DartNew/gesture02.jan
Anims/DartNew/gesture03.jan
Anims/DartNew/Gesture04.jan
anims/dartnew/givecard_idle.jan
Anims/DartNew/Grabbed.jan
Anims/DartNew/GrabbedByDemon.jan
Anims/DartNew/Grapple1.jan
Anims/DartNew/Grapple2.jan
anims/dartnew/handcartoperate.jan
anims/dartnew/helmet/darthelmetdefpose.jan
anims/dartnew/helmet/darthelmetdn.jan
anims/dartnew/helmet/darthelmetup.jan
anims/dartnew/hithead.jan
Anims/DartNew/HolyShiteFall.jan
anims/dartnew/hop.jan
anims/dartnew/hop_recovery.jan
Anims/DartNew/Hop_water.jan
Anims/DartNew/Idle_BowAndWave.jan
anims/dartnew/intomind_idle.jan
anims/dartnew/invisibility.jan
Anims/DartNew/Jump_In_End.jan
Anims/DartNew/KissBrain.jan
Anims/DartNew/KissBrain_Idle.jan
anims/dartnew/knockbackfrontal.jan
Anims/DartNew/KnockDownBack_start.jan
Anims/DartNew/KnockDownFront_start.jan
Anims/DartNew/KnockDown_end.jan
Anims/DartNew/KnockDown_loop.jan
Anims/DartNew/Knockforward.jan
anims/dartnew/ladderdismount.jan
anims/dartnew/ladderdn_cycle.jan
anims/dartnew/laddermnttop.jan
anims/dartnew/ladderstop.jan
anims/dartnew/ladderup.jan
anims/dartnew/ladder_pose.jan
Anims/DartNew/LandAfterBBLI.jan
anims/dartnew/landhard.jan
anims/dartnew/landsoft.jan
anims/dartnew/ledgedrop.jan
anims/dartnew/ledgehangpose.jan
anims/dartnew/ledgejangle.jan
anims/dartnew/ledgeshimmyjangle.jan
anims/dartnew/ledgeshimmyleft.jan
anims/dartnew/ledgeshimmyright.jan
anims/dartnew/ledge_drop_to_hang.jan
anims/dartnew/ledge_hang_to_pose.jan
Anims/DartNew/Listen.jan
anims/DartNew/LO/run.jan
anims/DartNew/LO/TightropeRun.jan
anims/DartNew/LO/TightropeWalk.jan
anims/DartNew/LO/walk.jan
anims/dartnew/loadingflail.jan
anims/dartnew/longjump.jan
anims/DartNew/LongJump_OnFire.jan
anims/dartnew/melee/bubblebomb_end.jan
anims/dartnew/melee/bubblebomb_loop.jan
anims/dartnew/melee/bubblebomb_start.jan
Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_end.jan
Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_loop.jan
Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan
Anims/DartNew/Melee/Chop1.jan
Anims/DartNew/Melee/Chop2.jan
Anims/DartNew/Melee/Crane.jan
Anims/DartNew/Melee/Jab1.jan
Anims/DartNew/Melee/Jab2.jan
anims/dartnew/melee/level1/meleejump1_end.jan
Anims/DartNew/Melee/lo/Chop1.jan
Anims/DartNew/Melee/lo/Chop2.jan
Anims/DartNew/Melee/lo/Crane.jan
anims/dartnew/melee/palmbomb_end.jan
anims/dartnew/melee/palmbomb_loop.jan
anims/dartnew/melee/palmbomb_start.jan
Anims/DartNew/Melee/Uppercut.jan
anims/dartnew/meleearms/arm_chop1.jan
anims/dartnew/meleearms/arm_chop2.jan
anims/dartnew/meleearms/arm_crane.jan
anims/dartnew/meleearms/arm_palmbomb_end.jan
anims/dartnew/meleearms/arm_palmbomb_loop.jan
anims/dartnew/meleearms/arm_palmbomb_start.jan
Anims/DartNew/MeleeArms/TK/Drop.jan
Anims/DartNew/MeleeArms/TK/Grab.jan
Anims/DartNew/MeleeArms/TK/Lift.jan
Anims/DartNew/MeleeArms/TK/Spear_Grab.jan
Anims/DartNew/MeleeArms/TK/Spear_Lift.jan
Anims/DartNew/MeleeArms/TK/Spear_Throw.jan
Anims/DartNew/MeleeArms/TK/Throw.jan
anims/dartnew/midairballmount.jan
anims/dartnew/netDn.jan
anims/dartnew/netDnLf.jan
anims/dartnew/netDnRt.jan
anims/dartnew/netjangle.jan
anims/dartnew/netLf.jan
anims/dartnew/netpose.jan
anims/dartnew/netRt.jan
anims/dartnew/netUp.jan
anims/dartnew/netUpLf.jan
anims/dartnew/netUpRt.jan
Anims/DartNew/Ninja_slapped.jan
Anims/DartNew/No.jan
Anims/DartNew/OpenDreamFluff.jan
anims/dartnew/pack/packbounce_lf_rt.jan
anims/dartnew/pack/packbounce_up_dn.jan
Anims/DartNew/Pack/pack_closing.jan
Anims/DartNew/Pack/pack_opening.jan
anims/dartnew/poleclimb.jan
anims/dartnew/poledmnt.jan
anims/dartnew/polehang.jan
anims/dartnew/polejangle.jan
anims/dartnew/poleslide.jan
anims/dartnew/psiblastrecoil.jan
anims/dartnew/psiblast_headbutt.jan
anims/dartnew/psifloata.jan
anims/dartnew/psifloatb.jan
Anims/DartNew/PsiGrab_armJALf_1.jan
Anims/DartNew/PsiGrab_armJARt_1.jan
Anims/DartNew/Psi_Inventory_armJALf_1.jan
Anims/DartNew/RailObstacleCrash.jan
Anims/DartNew/RailSlide45angle.jan
anims/DartNew/RailSlideFlat.jan
Anims/DartNew/RailSlideUphill.jan
Anims/DartNew/Rail_taunt_spineJA_1.jan
anims/dartnew/raz_intomindspiral.jan
anims/dartnew/raz_intomindspiral_goggles.jan
Anims/DartNew/Raz_RideBull.jan
Anims/DartNew/ReactionToWrestler1.jan
Anims/DartNew/ReactionToWrestler2.jan
Anims/DartNew/ReactionToWrestler3.jan
Anims/DartNew/Respawn.jan
anims/DartNew/run.jan
anims/dartnew/runmove.jan
anims/DartNew/Run_OnFire.jan
Anims/DartNew/SACD001RA.jan
Anims/DartNew/Scared_LookUp.jan
Anims/DartNew/Shield_Loop.jan
anims/dartnew/shield_start.jan
Anims/DartNew/Shocked.jan
Anims/DartNew/SmellSalts_cancel.jan
Anims/DartNew/SmellSalts_end.jan
Anims/DartNew/SmellSalts_loop.jan
Anims/DartNew/SmellSalts_start.jan
Anims/DartNew/Somersault.jan
Anims/DartNew/SpitOut.jan
Anims/DartNew/Squint.jan
anims/dartnew/standready.jan
Anims/DartNew/standstill.jan
anims/DartNew/StrafeBack.jan
anims/DartNew/StrafeLeft.jan
anims/DartNew/StrafeRight.jan
Anims/DartNew/SuckerFished_Struggle.jan
Anims/DartNew/Talk_1.jan
Anims/DartNew/Talk_2.jan
Anims/DartNew/Talk_3.jan
Anims/DartNew/Talk_4.jan
Anims/DartNew/TeleportBreathe_Idle.jan
Anims/DartNew/TeleportChairBounce_Idle.jan
Anims/DartNew/TeleportLookAround_Idle.jan
Anims/DartNew/Teleport_DriveAway.jan
Anims/DartNew/Teleport_FallIntoCave.jan
Anims/DartNew/Throw.jan
anims/dartnew/tightropefallleft.jan
anims/dartnew/tightropeidle.jan
anims/dartnew/tightropeland.jan
anims/DartNew/TightropeRun.jan
anims/dartnew/tightropetocantilever.jan
anims/DartNew/TightropeWalk.jan
anims/dartnew/tk.jan
anims/Dartnew/tk_turn.jan 
anims/dartnew/tkcycle.jan
Anims/DartNew/TKed_Flinch.jan
Anims/DartNew/TKed_Struggle_Hard.jan
Anims/DartNew/TKed_Struggle_Light.jan
anims/dartnew/trampoline_loop.jan
anims/dartnew/trampoline_squash.jan
anims/dartnew/trapezedismountfwd.jan
anims/dartnew/trapeze_bkwdposes.jan
anims/dartnew/trapeze_fwdposes.jan
anims/DartNew/TrnLfCycle.jan
anims/DartNew/TrnRtCycle.jan
anims/dartnew/tumble.jan
anims/DartNew/TumbleBackward.jan
anims/DartNew/TumbleForward.jan
Anims/DartNew/TurnStartled.jan
Anims/DartNew/UseBacon.jan
Anims/DartNew/UseClippers_end.jan
Anims/DartNew/UseClippers_loop.jan
Anims/DartNew/UseClippers_start.jan
Anims/DartNew/UseLillies.jan
Anims/DartNew/UsePhone.jan
Anims/DartNew/UsePlunger_loop.jan
Anims/DartNew/UseRifle.jan
Anims/DartNew/UseSign_loop.jan
Anims/DartNew/UseSign_start.jan
Anims/DartNew/UseWateringCan.jan
Anims/DartNew/Victory.jan
Anims/DartNew/VictoryDance.jan
anims/DartNew/walk.jan
Anims/DartNew/walkmove.jan
anims/dartnew/wince.jan
anims/hateballs/idle1.jan
anims/hateballs/idle2.jan
anims/hateballs/idle_air.jan
anims/hateballs/idle_start.jan
anims/hateballs/run.jan
anims/hateballs/squash.jan
anims/healthballs/idle1.jan
anims/healthballs/idle2.jan
anims/healthballs/idle_air.jan
anims/healthballs/idle_start.jan
anims/healthballs/run.jan
anims/healthballs/squash.jan
anims/janitor/hint_end.jan
anims/janitor/hint_lookatraz_loop.jan
anims/janitor/hint_loop.jan
anims/janitor/hint_start.jan
anims/mentalarrowhead/idle_air.jan
anims/mentalarrowhead/run.jan
anims/objects/tk_arrow_idle.jan
Anims/PsiChallenge/Collect.jan
anims/thought_bubble/ballmount.jan
anims/thought_bubble/ballpop.jan
anims/thought_bubble/ballstatic.jan
anims/thought_bubble/bubbledoublejump.jan
anims/thought_bubble/bubbleidle.jan
anims/thought_bubble/closethoughtbubble.jan
Anims/Thought_Bubble/Melee/Bubble_BubbleBomb_start.jan
anims/thought_bubble/openthoughtballoon.jan
anims/thought_bubble/psifloatbubbleidle.jan
anims/thought_bubble/psifloatbubbleopen.jan
anims/thought_bubble/psifloatbubblepop.jan
anims/thought_bubble/shieldloop.jan
anims/thought_bubble/shieldopen.jan
Anims/DartNew/1mAutoMount.jan
Anims/DartNew/actionfall.jan
Anims/DartNew/balloonidlefb.jan
Anims/DartNew/BalloonMount.jan
Anims/DartNew/BalloonSpeedMount.jan
Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan
Anims/DartNew/BodyParts/hold_jar_spineja.jan
Anims/DartNew/BodyParts/Hold_Picture_SpineJA.jan
Anims/DartNew/BodyParts/Hold_Pokeylope_ShoulderJALf_1.jan
Anims/DartNew/BubbleJump.jan
Anims/DartNew/cantdismountfwd.jan
Anims/DartNew/CantHandStandTurn.jan
Anims/DartNew/ChalkPositionUpper.jan
Anims/DartNew/ChalkThinkingUpper.jan
Anims/DartNew/ChalkWriting2Upper.jan
Anims/DartNew/ChalkWritingUpper.jan
Anims/DartNew/ClimbLedge.jan
Anims/DartNew/DamageFront_medium.jan
Anims/DartNew/DoubleJump.jan
Anims/DartNew/Firestart_end.jan
Anims/DartNew/Firestart_loop.jan
Anims/DartNew/hop.jan
Anims/DartNew/hop_recovery.jan
Anims/DartNew/LadderDismount.jan
Anims/DartNew/ladderDn_cycle.jan
Anims/DartNew/ladderMntTop.jan
Anims/DartNew/ladderStop.jan
Anims/DartNew/ladderUp.jan
Anims/DartNew/ladder_Pose.jan
Anims/DartNew/landsoft.jan
Anims/DartNew/LedgeJangle.jan
Anims/DartNew/LedgeShimmyJangle.jan
Anims/DartNew/LedgeShimmyLeft.jan
Anims/DartNew/LedgeShimmyRight.jan
Anims/DartNew/ledge_drop_to_hang.jan
Anims/DartNew/lo/DoubleJump.jan
Anims/DartNew/lo/hop.jan
Anims/DartNew/lo/hop_recovery.jan
Anims/DartNew/lo/landsoft.jan
Anims/DartNew/lo/longjump.jan
Anims/DartNew/lo/PsiBlast_HeadButt.jan
Anims/DartNew/lo/Shield_start.jan
Anims/DartNew/lo/standstill.jan
Anims/DartNew/longjump.jan
Anims/DartNew/MidAirBallMount.jan
Anims/DartNew/netJangle.jan
Anims/DartNew/PoleClimb.jan
Anims/DartNew/PoleHang.jan
Anims/DartNew/PoleJangle.jan
Anims/DartNew/PoleSlide.jan
Anims/DartNew/PsiBlast_HeadButt.jan
Anims/DartNew/psifloata.jan
Anims/DartNew/psifloatb.jan
Anims/DartNew/runmove.jan
Anims/DartNew/Shield_start.jan
Anims/DartNew/standready.jan
Anims/DartNew/standstill.jan
Anims/DartNew/tightropeidle.jan
Anims/DartNew/tk.jan
Anims/DartNew/Trampoline_squash.jan
Anims/DartNew/TrapezeDismountFwd.jan
Anims/DartNew/walkmove.jan
Anims/Thought_Bubble/MidAirMountBubble.jan
Anims/CO_RankUP/Spin.jan
Anims/Objects/SmellingSalts/SmellingSalts_Idle.jan
Anims/Objects/SmellingSalts/SmellSaltsProp.jan
Anims/Objects/BrainJar/Idle.jan
Anims/Objects/BrainJar/Shake.jan
Anims/Objects/DowsingRod/DRod_Idle.jan
Anims/Objects/DowsingRod/DRod_Twitch.jan
Anims/Objects/Duster/DusterRetract.jan
Anims/Objects/Duster/DusterRetract_Idle.jan
Anims/Objects/Duster/DusterShoot.jan
Anims/Objects/Duster/DusterSpinCycle.jan
Anims/Objects/Duster/Duster_spinner_Retract.jan
Anims/Objects/Duster/Duster_spinner_Shoot.jan
Anims/Objects/Duster/Duster_spinner_SpinCycle.jan
Anims/Objects/Float.jan
Anims/Objects/FruitCartToss.jan
Anims/Objects/InventoryToss.jan
Anims/Objects/InventoryToss_largeobjects.jan
Anims/Objects/TK_Arrow_Idle.jan
Anims/Objects/TK_Claw_Closed.jan
Anims/Objects/TK_Claw_Open.jan
Anims/Vaults/CloseMouth.jan
Anims/Vaults/Confused.jan
Anims/Vaults/Hop.jan
Anims/Vaults/Idle.jan
Anims/Vaults/OpenMouth.jan
Anims/Vaults/OpenMouthPose.jan
Anims/Vaults/Recover.jan
Anims/Vaults/Run.jan
Anims/Vaults/TK.jan
Anims/Vaults/TakeDamage.jan
Anims/Vaults/Turn_180.jan
Anims/Vaults/Walk.jan
Anims/TK_Mover/Explode.jan
Anims/TK_Mover/Wobble.jan
Anims/TK_Mover/Land.jan
Anims/TK_Mover/Tumble.jan
]]

-- Darts script
function Dart(Ob)
	if not Ob then
		Ob = CreateObject('Actor')
		Ob.dependencies = {
			scripts = {
				'Global.OtherEntities.UIElement',
				'Global.Util.CharResponseHandler',
				'Global.Props.Geometry',
				'Gen_CollideBall',
				'Global.Effects.FireStartSuperFX',

				--Global Inventory items go here
				--Inventory items that are specific to mental or real worlds go in LevelScript:onPreLoad()
				'Global.Collectibles.CobwebDuster',	
				'Global.Collectibles.DreamFluff',
				'Global.Collectibles.MentalMagnet',
			},
			textures = {
				'textures/fxtextures/palmbombupgradehand_icon.dds',
				'Textures/HUD/Brain_4.dds',
				'textures/hud/quick_psiblasttrainerbig.dds',
				'textures/hud/quick_levitationtrainerbig.dds',
				'Textures/icons/InventoryItems/PsiChallengeMarker.tga',
				'Textures/icons/InventoryItems/CobwebDuster.tga',
				'Textures/icons/InventoryItems/DowsingRod.tga',
				'Textures/icons/InventoryItems/Magnet_Patch_alpha.tga',
				'Textures/icons/InventoryItems/Bacon.tga',
				'Textures/icons/InventoryItems/FigmentIcon.tga',
				'Textures/icons/InventoryItems/MaxAmmoUp.dds',			
				'Textures/icons/InventoryItems/MaxConfusionUp.dds',			
				'Textures/icons/InventoryItems/MaxLivesUp.dds',
				'Textures/icons/InventoryItems/OneUp.dds',			
				'Textures/icons/InventoryItems/PsiBallArrowhead.dds',
				'Textures/icons/InventoryItems/PsiBallHealth.dds',
				'Textures/icons/InventoryItems/PsiBallConfusion.dds',			
				'Textures/icons/InventoryItems/FordCore.tga',
				'Textures/icons/InventoryItems/PsiChallengeCard.tga',
				'Textures/icons/InventoryItems/FordCore.tga',
				'Textures/icons/InventoryItems/PsiChallengeCard.tga',
				'Textures/icons/UI_Icons/UI_Arrowhead.dds',
				'Textures/UI/Sayline Heads/Coach.tga',
				'Textures/UI/Sayline Heads/FordNinja_sayline.tga',
				'textures/ui/sayline heads/raz.dds',
			},
		}
		Ob.height = 125
		Ob.FS_DETONATE_RANGE = 600

		-- Thought Bubble Constants
		Ob.ITMDistance = 250
		Ob.ITMHeight = 167

		-- Timers
		Ob.TIMER_INV_POPUP = '1002'
		Ob.PLATFORMINGCAMREVERTTIMER = '1003'
		Ob.TIMER_PSI_COOL_DOWN = '1004'
		Ob.TIMER_STUN = '1005'
		Ob.TIMER_DAMAGE_FLICKER = '1006'
		Ob.TIMER_SHIELD_COOLDOWN = '1010'
		Ob.TIMER_DETONATE_ENTITIES_ACROSS_FRAMES = '1011'
		Ob.TIMER_HEALTH_REGENERATION = '1012'

		--edit New Timer for Vault Text
		Ob.TIMER_VAULT_REWARD = '1013'

		-- PSI POWER RANKING VARIABLES
		-- Many of these are only read by the engine; don't delete them just because you don't see scripts that refer to them.
		Ob.PsiBlastRange = 2000         -- starting range    
		Ob.PsiBlastRate = 1.75          -- starting fire rate (per second)

		-- Invisibility constants
		Ob.InvisibilityDuration = 5 
		Ob.InvisibilityCoolDown = 3

		-- Firestarting constants
		Ob.FirestartingCoolDown = 1

		-- Confusion constants
		Ob.ConfusionCoolDown = 1

		-- Psi Shield constants
		Ob.PsiShieldDuration = 2
		Ob.PsiShieldCoolDown = 2
		Ob.PsiShieldHeight = 95

		-- Firestarting Resistance - for enemies that use firestarting against Raz
		Ob.firestartResistance = 2
		Ob.TIME_ON_FIRE = 1000
		Ob.fireDamageIterationsMax = 3	-- fire will last 3 seconds on Raz and hit him 3 times
		Ob.fireDamage = 2
		
		-- COLLECTIBLES HACK
		Ob.STARTING_MENTAL_LIVES = 5
		-- END COLLECTIBLES HACK
	
		-- Maximum amount of health raz can get in a game
		Ob.MAX_HEALTH = 72
	
		-- *************************************************************************
		-- GamePlay control Vars
		Ob.block = 0
		Ob.invisible = 0
		Ob.bDartIsDying = 0
		Ob.bWrestlerClairOn = 0
		Ob.bIsStunned = 0
	
		-- Use this to force Raz to put an item away regardless of his current action state
		Ob.forceItemPutaway = 0

		-- Used for claw in LO
		Ob.meleeType = 1
		
		Ob.fx = 0
		Ob.fy = 0
		Ob.fz = 0
	
		-- for autobabble
		Ob.animsDir = 'DartNew'
	
		Ob.charName = 'Raz' -- Editable

		-- For general surface tagging
		Ob.currTriggerSurfaceIDNum = nil
		Ob.prevTriggerSurfaceIDNum = nil
	
		-- set this to pass the LaunchedPsiBlast message onto another class
		Ob.psiBlastListener = nil

		--constants for 'milestones' for raz's respawn state, so other respawn listeners can synchronize with raz
		Ob.RESPAWN_START = 0
		Ob.RESPAWN_DEATHSEQUENCESTART = 10
		Ob.RESPAWN_AFTERCAMERACHANGE = 20
		Ob.RESPAWN_FADEDTOBLACK = 30
		Ob.RESPAWN_DEATHSEQUENCEDONE = 40
		Ob.RESPAWN_PLAYERPOSITIONED = 50
		Ob.RESPAWN_FADEDTOCOLOR = 60
		Ob.RESPAWN_DONE = 70
		
		Ob.respawnSoundDelay = .1
		
		Ob.groundMaterialSpecialDirt = 12	-- passes through to level script for special dirt effect
		Ob.Confusion = 0
		Ob.lastConfusionActivation = 0
		Ob.lastInvisibilityActivation = 0
						
		Ob.bBrainMode = 0  -- variable for script based powers to check if this is on, do the 'brain raz' version
		
		Ob.bTKMonsterActive = 0

		-- this flag is set by onLoading, so that you can tell if this was the first level loaded since loading a savegame
		Ob.bLoadedFromSavedGame = 0

		Ob.tRankAchievementName = {
			{ rank = 20, achID = 'ACH_RANK_20' },
			{ rank = 40, achID = 'ACH_RANK_40' },
			{ rank = 60, achID = 'ACH_RANK_60' },
			{ rank = 80, achID = 'ACH_RANK_80' },
			{ rank = 101, achID = 'ACH_RANK_101' },
		}
		Ob.nNumClairTargetForAch = 15

	end -- if (Ob == nil)
  
-- ****************************************************************************
	function Ob:onSpawn()
		gsub(g_CommonAnims, '(%S+)', function(match) PreloadAnim(nil, match, 0, 1) end)

		SetSimulationCullDistance(self, -1)		-- simulate even when PlayerOnly
		SetPhysicsFlag(self, PHYSICS_CHECKTRIGGERS, 0)
		self.stats = {}
	
		--Create RankPowerManager to keep track of rank power strengths.
		self.rankPowerManager = SpawnScript('Global.OtherEntities.RankPowerManager','rankPowerManager',
											nil,0,0)
		
		--RESPAWN POINTS
		self.rpoints = {}
		-- For painty feet
		self.paintLevel = {left=0, right=0}
		self.maxPaintLevel = 1
		-- LEVEL STATS
		self.stats.respawnLSOName = nil

		self.meleeReturnStates = {}
		self.meleeReturnStates[kCONTROL_NONE] = 'Stand'
		self.meleeReturnStates[kCONTROL_PLAYER] = 'Stand'
		self.meleeReturnStates[kCONTROL_BUBBLE] = 'Stand'
		self.meleeReturnStates[kCONTROL_PSACK]= 'PsackOpen'
		self.meleeReturnStates[kCONTROL_BALL] = 'Bubble Idle'
		self.meleeReturnStates[kCONTROL_TRAPEZE] = 'Trapeze Idle'
		self.meleeReturnStates[kCONTROL_CANTILEVER] = 'Cantilever Hang'
		self.meleeReturnStates[kCONTROL_POLE] = 'Pole Still'
		self.meleeReturnStates[kCONTROL_TIGHTROPE2] = 'Tightrope Idle'
		self.meleeReturnStates[kCONTROL_TELEKINESIS] = 'Telekinesis'
		self.meleeReturnStates[kCONTROL_LADDER] = 'Ladder Still'
		self.meleeReturnStates[kCONTROL_RAIL] = 'Slide'
		self.meleeReturnStates[kCONTROL_WALL] = 'Wall Still'
		self.meleeReturnStates[kCONTROL_CANOE] = 'Canoe Idle'
		self.meleeReturnStates[kCONTROL_SCRIPT] = 'Stand'
		self.meleeReturnStates[kCONTROL_SELECTION] = 'Stand'
        
		%Ob.Parent.onSpawn(self)
		self.Inventory = {}
		self:setPhysicsConstants()

		-- Create PsiBoost Table.  It's not used, right?
		self.boost = {}
		self.boost.psiblast = 0
		self.boost.levitate = 0
		self.boost.clairvoyance = 0

		-- initialize hands
		self.lockHub = SpawnScript('TargetLock', self.Name..'LockHub', '', 0, 0)
		--SetEntityDomain(self.lockHub,'MainGame') -- not needed if lockHub has no entity
		
		self.lastShieldActivation = GetGameTimeSecs()

		self.clairBlurTexture = LoadTexture('Textures/FXTextures/rayMask.dds', 1)

		--A table of spam listeners, indexed by message name.
		self.spamListeners = {}
		
	end

	function Ob:onDestroyed(why)
		%Ob.Parent.onDestroyed(self,why)
		if self.invDisplayer then KillScript(self.invDisplayer) end
		KillScript(self.lockHub)
		KillScript(self.rankPowerManager)
	end

	function Ob:onPreLoad()
		%Ob.Parent.onPreLoad(self)
	end

	-- Use overridden type, or level-appropriate type.
	function Ob:getMeleeType()
		return self.meleeType
	end

	function Ob:setMeleeType(meleeType)
		self.meleeType = meleeType
		self.animBasePath = (self:getMeleeType() == 3 and 'Anims/DartNew/Melee/lo/') or 'Anims/DartNew/Melee/'
		if self.leftHand then
			self.leftHand:setMeleeType(meleeType)
			self.rightHand:setMeleeType(meleeType)
		end
	end

	function Ob:setScale(sx, sy, sz)
		%Ob.Parent.setScale(self, sx, sy, sz)
		if self.leftHand then
			self.leftHand:setScale(sx, sy, sz)
			self.rightHand:setScale(sx, sy, sz)
		end
		SetEntityAnimationMovementScale(self, sz or sx)
	end

	-- portion of combo forced to complete before the next fires off
	Ob.MELEE_ACOMPLETION = 1
	Ob.MELEE_BCOMPLETION = 1
	Ob.MELEE_CCOMPLETION = 1
	
	Ob.animBasePath = 'Anims/DartNew/Melee/'
	Ob.animsTable = {melee1a = {fileName = 'Chop1', preload = 1, cacheBias = 20, hand = 'rightHand', level = '1', combo = 'a', completion = Ob.MELEE_CCOMPLETION},
					 melee1b = {fileName = 'Chop2', preload = 1, cacheBias = 20, hand = 'leftHand', level = '1', combo = 'b', completion = Ob.MELEE_ACOMPLETION},
					 melee1c = {fileName = 'Crane', preload = 1, cacheBias = 20, hand = 'rightHand', level = '1', combo = 'c', completion = Ob.MELEE_BCOMPLETION},
					 
					 TKMonsterMeleeA = {fileName = 'Jab1', preload = 1, cacheBias = 20, level = '1', combo = 'a', completion = Ob.MELEE_CCOMPLETION},
					 TKMonsterMeleeB = {fileName = 'Jab2', preload = 1, cacheBias = 20, level = '1', combo = 'b', completion = Ob.MELEE_ACOMPLETION},
					 TKMonsterMeleeC = {fileName = 'Uppercut', preload = 1, cacheBias = 20, level = '1', combo = 'c', completion = Ob.MELEE_BCOMPLETION},}

	function Ob:onPreBeginLevel()
		self.jacketCostumeItem = nil
		self.clawCostumeItem = nil
		self.paintingCostumeItem = nil
		self.invDisplayer = SpawnScript('Global.OtherEntities.InvAdder', 'InvDisplayer', '', 1)
		self.invDisplayer.player = self --invDisplayer needs this.
		SetMeshMaterialProperty(self.invDisplayer, kMATERIALFLAG_INCANDESCENT, 1)
		self.bInLevel = 1
		
		self.dartDeathCam = LoadCameraPath('Anims/DartNew/DART_death.cam')
		self.ITMCam = LoadCameraPath('CameraPaths/IntoTheMind_Rev2.cam')

		Global.figmentGlobals = SpawnScript('Global.Collectibles.FigmentGlobals', 'FigmentGlobals', '', 1)
		MI_DisableFallOffBall(0)
		self:setLookTargetSearchDist(2000)

		self:setMeleeType(((Global.levelScript:getLevelPrefix() == 'LO' and 3) or 1))
		self.MELEE_BCOMBO_TIME = 2000
		self.MELEE_CCOMBO_TIME = 2000

		self.block = 0
		self.invisible = 0
		self.bDartIsDying = 0
		self.bWrestlerClairOn = 0

		self.psiHeat = 0

		%Ob.Parent.onPreBeginLevel(self)
		
		--This needs to happen before loadStats
		self.fsExplode = SpawnScript('Global.Effects.FireStartExplodeFX')

		Global.goalManager:reload()
		
		-- Load our stats for this level
		self:loadStats()
		
		self.rankBling = SpawnScript('Global.OtherEntities.RankBling', 'RankBling')

		self:meleeOn()
		--self.overheatEmitter = SpawnScript('Global.Effects.SteamEmitter', 'RazOverheatEmitter', '', 1)

		self.stepOnTB = LoadSound('tb_footstep')
		self.RazillaWalk = LoadSound('[TEMP]RazillaStep.wav')
		
		-- ladder sounds
		--self.mountLadder = LoadSound('Sounds/FX/Ladder_Mount.wav')
		self.ladderSlide = LoadSound('LadderSlide.wav')
		self.stepLadder = {}
		self.stepLadder[1] = LoadSound('LadderStep1')
		self.stepLadder[2] = LoadSound('LadderStep2')
		self.stepLadder[3] = LoadSound('LadderStep3')
		self.stepLadder[4] = LoadSound('LadderStep4')
		
		-- invisible sounds
		self.invisibleActionSnd = LoadSound('Psi_invisable')
		self.invisibleFlourishSnd = LoadSound('FRED_Invisibility')
		
		-- sounds for firestarting
        self.fireStartJump = LoadSound('jump')
		self.fireStartRev = LoadSound('fireStartRev')
		self.fireStartPull = LoadSound('tb_grabpulldown01')		
		self.fireStartImpact = LoadSound('lungfish_minexplo3')
		self.fireStartPunch = LoadSound('tb_punch')
        self.fireStartPhoenix = LoadSound('phoenix1')
		self.fireStartBlast = LoadSound('FireBlast')

		-- sounds for jumping
		self.rJumpSoundHandle = LoadSound('RazJumpVocals')

		--Dart Damage
		self.kickBackInPainAnim = 'Anims/DartNew/KnockbackFrontal.jan'
		self.damageRecoveryTime = 2000

		-- Sliding
		self.slideGeneric = LoadSound('TubeSlide')
		self.slideCurrent = nil

		--Dart Death
		self.bResetHealthOnRespawn = 1
		self.deathMusic = LoadSound('Sounds/Music/Dart_Death.wav')
		self.dartDeathAnim = 'Anims/DartNew/DART_death.jan'
		self.dartDeathBlend = 'Anims/DartNew/DART_death.pba'
		self.dartDeathCry = LoadSound('Death')
		self.holyShiteFallSound = LoadSound('GLRA080RA')
		self.rRespawnSoundHandle = self:loadSound('Respawn')
            
		SetEntityFlag(self, ENTITY_CANNOTBESTOODON, 1)
		SetEntityFlag(self, ENTITY_LOOKATINTERESTINGTHINGS, 1)
		SetEntityFlag(self, ENTITY_NAVIGATION, 1)
		SetEntityFlag(self, ENTITY_SPARSE_EVENTS, 1)

		-- Do BV-specific stuff
		local levelPrefix = strsub(GetCurrentLevelName(),1,2)
		if ( levelPrefix == 'BV' ) then
			self.usingAltTexture = 1
			local cloud = FindScriptObject('Clairvoyance_Cloud')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline_bv.tga')
			end
			cloud = FindScriptObject('Dialog_Cloud')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline_bv.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_0')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline_bv.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_1')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline_bv.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_2')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline_bv.tga')
			end
		end

		self.rPsiShield = SpawnScript('PsiShield', 'RazPsiShield', 'self.bIsRaz=1', 1)
		-- FX!
		self.ouchies = SpawnScript('Global.Effects.RazDamageFX', 'PlayerInvulIndicator')
		self.deathFX = SpawnScript('Global.Effects.RazPreDeathFX')

		local package = (self.usingAltTexture == 1 and 'Global.Effects.BVRaz.BV') or 'Global.Effects.'

		self.respawnFX 			= SpawnScript(package..'RazRespawnFX')
		self.rInvisibilityFX 	= SpawnScript(package..'InvisoEyeFX'		  , 'Dart_FXa')
		self.rPsiShieldFailedFX = SpawnScript(package..'PsiShieldFailFX'	  , 'Dart_FXb')
		self.rPowerFailedFX 	= SpawnScript(package..'NoAmmoFX'			  , 'Dart_FXe')
		self.rInvisibilityShockwaveFX = SpawnScript('Global.Effects.invisibilityShockwaveFX', 'Dart_FXf')

		Global.levelScript:getPool('Global.Effects.FireStartExplodeSuperFX'):setLowerLimit(1)
		
		
		-- water FX
		self.steamFXPool = Global.levelScript:getPool('Global.Effects.RazSteamRecoverFX')
		self.steamFXPool:setLowerLimit(1)
        
		self.leftHand = SpawnScript('Global.Props.DartMeleeHand', 'RazLH', 'self.hand = \'Lf\'', 1)
		self.rightHand = SpawnScript('Global.Props.DartMeleeHand', 'RazRH', 'self.hand = \'Rt\'', 1)
		SetEntityDomain(self.leftHand, 'Level')
		SetEntityDomain(self.rightHand, 'Level')

		-- Inventory
		local itemsToSpawn = Global:loadInventory()
		for k, v in itemsToSpawn do
			if k ~= 'n' and not self.Inventory[k] then
				local preexistingObj = FindScriptObject(k, 1)
				if preexistingObj then
					preexistingObj:killSelf()
				end
				local item = SpawnScript(v.Type, k, 'self.bReincarnated = 1 '..v.Editables)
				if item then 
					self:addToInventory(item, 0, 1) 
					item.bInInventory = 1
				end
			end
		end
		
		--Clear out total brains, this variable is incremented in BrainJar.lua
		Global.player.stats.totalBrainsInLevel = 0

		SetPushParams(self, 253, 0)

		-- make sure land sounds play
		self.bBlockLandSound = 0

		self:resetPowerActivationTimes()
	end

	function Ob:onBeginLevel()
		-- Must preload these to set their cachebias to 20
		PreloadAnim(self, 'Anims/DartNew/Melee/PalmBomb_end.jan', 20)
		PreloadAnim(self, 'Anims/DartNew/Melee/PalmBomb_loop.jan', 20)
		PreloadAnim(self, 'Anims/DartNew/Melee/PalmBomb_start.jan', 20)

		StopAllBlendAnims(self)
        
		%Ob.Parent.onBeginLevel(self)
		
		self.clairCamUpdater = SpawnScript('Global.OtherEntities.ClairCamUpdater')

		self.confusionGrenadePool = Global.levelScript:getPool('Global.Props.ConfusionGrenade')
		self.confusionGrenadePool:setLowerLimit(1)
		self.confusionGrenadePool:setPoolLimit(1)

		if (Global.player.bClairOn == 1) then
			Global.player:cancelClairvoyance()
		end
		
		-- loading sounds
		self.rClairvoyanceSnd = LoadSound('Clairvoyance')
		self.rBrainerSound = LoadSound('BrainerBounce')
		self.deathWarningSound = LoadSound('Dying')
		self.rSpikeBallCollide = LoadSound('LevetationSpikesStab')

		-- Table to detonate entities across multiple frames, instead of all at once causing a massive hitch
		self.detonatedEntities = {}
	end

	function patchHeldObjectClairvoyance()
		local d = SpawnScript('Global.Props.HeldObject')
		if d ~= nil then
			local tHeldObject = d.Parent
			d:killSelf()
			-- Make HeldObject writable
			-- Install the new handler... We need to check to see if the lookTarget.onClairvoyance value is a function
			tHeldObject.onClairvoyance =
				function (self,data,from)
					local lookTarget = Global.player:getLookTarget()
					if lookTarget ~= self and lookTarget and lookTarget.onClairvoyance and type(lookTarget.onClairvoyance) == "function" then 
						lookTarget:onClairvoyance(data, from)
					elseif self:xCanClairvoyOwner() == 1 then
						FindScriptObject(self.ownerName):onClairvoyance(data, from)
					else
						Global.player:onPowerFailed(kPOWER_CLAIRVOYANCE)
						if IsSaylineDone(Global.player) == 1 then Global.player:sayLine("/GLRA000RA/", 0, 1, nil, 1, nil, 1) end--DIALOG=<<Hm. I\'m not getting anything. I must be out of range or something.>>
						self:dontRunPlayerControls(0)
					end
				end
		end

	end

	function Ob:onPostBeginLevel()
		patchHeldObjectClairvoyance()

		%Ob.Parent.onPostBeginLevel(self)

		if Global.levelScript.ledgeDirtEmitterName and Global.levelScript.ledgeDirtEmitterName ~= '' then
			self.ledgeDirtFX = SpawnScript(Global.levelScript.ledgeDirtEmitterName)
		else
			self.ledgeDirtFX = nil
		end
		SnapEntityToGround(self)
		SetPhysicsFlag(self, PHYSICS_CHECKTRIGGERS, 1)
		-- check to see if it's stmu or cabu
		if GetCurrentLevelName() ~= 'STMU' and GetCurrentLevelName() ~= 'CABU' then
			self:playWarningSound()
		end
	end
	
	function Ob:onEndLevel()
		-- save our stats for this level
		self:saveStats()
		self.bInLevel = 0
		self.leftHand = nil
		self.rightHand = nil
		self.rPowerFailedFX = nil
		self.rInvisibilityShockwaveFX = nil
		
		self.dartDeathCam = nil
		self.ITMCam = nil

		%Ob.Parent.onEndLevel(self)

		self:stopConfusion(1)
		SetPlayerMovementScale(1)

		-- clean out dead references
		self.fsExplode = nil

		if self.HeldItem then 
			local item = FindScriptObject(self.HeldItem)
			if not item or item.NoPackStorage == 1 then
				self:releaseSelectedItem(0)	-- release item if its not something we should take with us to another level
			end
		end
		if ( self.usingAltTexture == 1 ) then
			self.usingAltTexture = 0
			local cloud = FindScriptObject('Clairvoyance_Cloud')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline.tga')
			end
			cloud = FindScriptObject('Dialog_Cloud')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_0')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_1')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline.tga')
			end
			cloud = FindScriptObject('DialogBubble_SubCloud_2')
			if ( cloud ) then
				PESetTexture(cloud, 'Textures/phatline.tga')
			end

		end
		
		-- cleanup
		Global.cutsceneScript:fadeIn(0)
		self:setScale(1)
		self:makeVisible()
		self.lastLine = nil
		self:cancelClairvoyance()
		self:xExitClairCloud() -- why both?  cutscenes can put him in clair view, without putting him in real clair.
		self.firestartingTarget = nil

		SetPhysicsFlag(self, PHYSICS_CHECKTRIGGERS, 0)

		self.rRazillaPullUpSound = nil
		self.rRazillaClimbSound = nil
		
		-- reset the player's look box to the default
		SetPlayerLookBox(250,700,2000)
		
		-- clean up references to dead things
		self.confusionGrenadePool = nil
		self.psiBlastExplosionFXPool = nil
		self.steamFXPool = nil
		self.psiBlastTargetFXPool = nil

		self.clairCamUpdater = nil
		self.deathFX = nil
		self.ledgeDirtFX = nil
		self.ouchies = nil
		self.rInvisibilityFX = nil
		self.rPsiShield = nil
		self.rPsiShieldFailedFX = nil
		self.rankBling = nil
		self.respawnFX = nil
		
		-- kill the spam listener table so we don't get holdovers from level to level
		self.spamListeners = {}

		--Clear out loaded from savegame variable
		self.bLoadedFromSavedGame = 0

		self:setState(nil)
	end

-- ************************** STATS **************************************************

	-- All of Dart's stats to save/load.
	-- First, the sublevel-specific ones, like all cobwebs in BBA2.
	Ob.savedSublevelStatNames = {
			'PSImarkers', 'PSIChallengeCards', 'PSIChallengeCores', 'cobwebs',
			'figmentsFromLevel', 'totalFigments', 'brainsFromLevel', 'vaultsFromLevel', 'vaultCountFromLevel', 'scavItemsFromLevel'}
	-- next, the level-specific ones, like all emotional baggage in BB.
	Ob.savedLevelStatNames = {
			'EmotionalBaggageSolved', 'baggageCollected', 'bagTagsCollected', 'figmentPointsFromEntireLevel', 'vaultsFromEntireLevel', 'cobwebsFromEntireLevel',
	}
	-- Now the global ones.  These don't change on level changes.
	Ob.savedGlobalStatNames = {'scavengerHuntItems', 'numUnredeemedScavengerHuntItems', 
			'numRedeemedScavengerHuntItems', 'rank', 'cardsInInv', 'coresInInv', 'websInInv',
			'figmentPoints', 'brains', 'totalBrainsHeld', 'totalBrainsRedeemed', 'maxHealth', 'psiHealth', 'maxLives', 'dartLives', 'arrowheads', 'numUnredeemedPsitanium',
			'psiBlastMaxAmmo', 'psiBlastAmmo', 'totalVaults', 
			'confusionMaxAmmo', 'confusionAmmo',
			'cardsRedeemed','cobwebsRedeemed', 'bSaveGame', 'baggageMatched',
		    -- achievement stats
		    'shownpokey', 'clairvoyanced',
			--edit Custom StatNames
			'CollectedSuitcaseTag', 'CollectedPurseTag', 'CollectedHatboxTag', 'CollectedSteamertrunkTag', 'CollectedDufflebagTag',
			'RandoHatbox', 'RandoSuitcase', 'RandoPurse', 'RandoSteamertrunk', 'RandoDufflebag',
			'RandoHatboxTag', 'RandoSuitcaseTag', 'RandoPurseTag', 'RandoSteamertrunkTag', 'RandoDufflebagTag',
			'RandoLevitation', 'RandoClairvoyance', 'RandoConfusion', 'RandoFirestarting', 'RandoInvisibility', 'RandoMarksmanship', 'RandoShield', 'RandoTelekinesis',
			'ArrowheadBundleSmall', 'ArrowheadBundleMedium',
			'CollectedVault', 'RandoPsiCard', 'RandoPsiMarker', 'RandoLivesUp', 'RandoAmmoUp', 'RandoProp', 'BrainJar',
			--edit AP StatName
			'APItem', 'APPlaceholder',
			}

	--Called whenever the player saves their game
	function Ob:onSaving()
		self:saveStats()
		self:callSpamListeners('Saving')
	end

	--Called whenever the player loads a savegame
	function Ob:onLoading()
		self.bLoadedFromSavedGame = 1
		self:callSpamListeners('Loading')
	end

	function Ob:saveStats()
		self.stats.bSaveGame = 1
		if self.bInLevel == 1 then
			local level = GetCurrentLevelName()
			for i = 1, getn(self.savedSublevelStatNames) do
				Global:save(self.savedSublevelStatNames[i], self.stats[self.savedSublevelStatNames[i]], level)
			end
			local levelPrefix = strsub(level, 1, 2)
			for i = 1, getn(self.savedLevelStatNames) do
				Global:save(self.savedLevelStatNames[i], self.stats[self.savedLevelStatNames[i]], levelPrefix)
			end
		end

		for i = 1, getn(self.savedGlobalStatNames) do
			Global:saveGlobal(self.savedGlobalStatNames[i], self.stats[self.savedGlobalStatNames[i]])
		end
	end

	function Ob:loadStats()
		local level = GetCurrentLevelName()
		for i = 1, getn(self.savedSublevelStatNames) do
			self:loadStat(self.savedSublevelStatNames[i], level)
		end
		local levelPrefix = strsub(level, 1, 2)
		for i = 1, getn(self.savedLevelStatNames) do
			self:loadStat(self.savedLevelStatNames[i], levelPrefix)
		end
		for i = 1, getn(self.savedGlobalStatNames) do
			self:loadStat(self.savedGlobalStatNames[i])
		end
		self.rankPowerManager:reset()
		self:setRank(self.stats.rank or 1) -- set up various benefits of rank
		-- Do other things we need to based on loaded stats.
		SetPsiBlastAmmo(self.stats.psiBlastAmmo)
		--edit to make PsiCores always equal 100
		self.stats.PSIChallengeCores = 100
		self.stats.coresInInv = 100
	end

	function Ob:loadStat(name, levelSpecificTo)
		local temp = Global:load(name, levelSpecificTo or 'Global')
		if temp then
			self.stats[name] = temp
		else
			self:resetStat(name)
		end
	end

	-- Some stats don't reset to 0; this handles that logic..
	function Ob:resetStat(statID)
		if statID == 'baggageCollected' or statID == 'bagTagsCollected' then
			-- baggage stats
			self.stats[statID] = {}   
			self.stats[statID].hatbox = 0
			self.stats[statID].suitcase = 0
			self.stats[statID].steamertrunk = 0
			self.stats[statID].purse = 0
			self.stats[statID].dufflebag = 0
		elseif statID == 'scavengerHuntItems' or statID == 'brains' or statID == 'vaultsFromLevel' or statID == 'shownpokey' or statID == 'clairvoyanced' then
			-- stats that reset to an empty table
			self.stats[statID] = {}
		elseif statID == 'rank' then
			-- stats that reset to 1
			self.stats[statID] = 1
		elseif statID == 'maxLives' then
			self.stats[statID] = 5
		elseif statID == 'dartLives' then
			self.stats[statID] = self.stats.maxLives or 5
		elseif statID == 'maxHealth' or statID == 'psiHealth' then
			self.stats[statID] = 12
		elseif statID == 'psiBlastMaxAmmo' then
			self.stats[statID] = 30
		elseif statID == 'psiBlastAmmo' then
			self.stats[statID] = self.stats.psiBlastMaxAmmo or 30
		elseif statID == 'confusionMaxAmmo' then
			self.stats[statID] = 5
		elseif statID == 'confusionAmmo' then
			self.stats[statID] = self.stats.confusionMaxAmmo or 5
		--edit adding all Rando Baggage as Tables
		elseif statID == 'RandoHatbox' or statID == 'RandoSuitcase' or statID == 'RandoPurse' or statID == 'RandoSteamertrunk' or statID == 'RandoDufflebag' then
			self.stats[statID] = {}
		--edit adding all Rando Baggage Tags as Tables
		elseif statID == 'RandoHatboxTag' or statID == 'RandoSuitcaseTag' or statID == 'RandoPurseTag' or statID == 'RandoSteamertrunkTag' or statID == 'RandoDufflebagTag' then
			self.stats[statID] = {}
		--edit adding Vaults, PsiCards, PsiMarkers, and ArrowheadBundles as Tables
		elseif statID == 'CollectedVault' or statID == 'RandoPsiCard' or statID == 'RandoPsiMarker' or statID == 'ArrowheadBundleSmall' or statID == 'ArrowheadBundleMedium' then
			self.stats[statID] = {}
		--edit adding all PsiPowers with Progressive powers as Tables
		elseif statID == 'RandoClairvoyance' or statID == 'RandoConfusion' or statID == 'RandoFirestarting' or statID == 'RandoInvisibility' or statID == 'RandoLevitation' or statID == 'RandoMarksmanship' or statID == 'RandoShield' or statID == 'RandoTelekinesis' then
			self.stats[statID] = {}
		--edit adding RandoLivesUp and RandoAmmoUp as Tables
		elseif statID == 'RandoLivesUp' or statID == 'RandoAmmoUp' then
			self.stats[statID] = {}
		--edit adding all RandoProp Items as Table
		elseif statID == 'RandoProp' then
			self.stats[statID] = {}
		--edit adding BrainJar Items as Table
		elseif statID == 'BrainJar' then
			self.stats[statID] = {}	
		--edit adding all APItem Items as Table
		elseif statID == 'APItem' then
			self.stats[statID] = {}
		--edit adding all APPlaceholder Items as Table
		elseif statID == 'APPlaceholder' then
			self.stats[statID] = {}								
		else
			self.stats[statID] = 0
		end
	end

	--Sets the maximum amount of confusion ammo raz can carry.
	function Ob:setConfusionMaxAmmo(newConfusionMaxAmmo)
		-- no need for an increase if we're at infinite ammo
		if (self.rankPowerManager.bInfiniteAmmo == 1) then
			return
		end
		self.stats.confusionMaxAmmo = newConfusionMaxAmmo
		self.stats.confusionAmmo = newConfusionMaxAmmo
	end
	
	
	-- adjust the amount of psi blast ammo, but respect the infinite ammo
	function Ob:adjustPsiBlastAmmo(amount)
		if (self.rankPowerManager.bInfiniteAmmo == 1) then
			return
		end
		AdjustPsiBlastAmmo(amount)
	end
	
--- ****************************************************************************
-- Health Stats Adjustment
--
-- WARNING: Do not call this function directly. Send dart a damage message instead!
--
--          Also, this function is called from a message handler, so it must
--          execute in one frame! No sleeping or yielding.
--
--	Returns 1 if he doesn't die.
-- ****************************************************************************
	function Ob:adjustHealth(value,bDontPlaySound)
		if not value then
			GamePrint('ERROR: tried called dart.adjustHealth(nil)!')
			return nil
		end

		--edit Adjust value with damage multiplier, unless Instant Death
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if value < 0 and seedsettings.instantdeath == FALSE then
			value = (value*seedsettings.enemydamagemultiplier)
		end

		value = tonumber(value)
		
		--this will unset the paused chase cam, anytime raz is damaged (and possibly moved, or respawn)
		SetChaseCameraPaused(0)
		if ( self.bDartIsDying ~= 1) then
			self.stats.psiHealth = self.stats.psiHealth + value
			-- to keep Dart's health below maxHealth
			if (self.stats.psiHealth > self.stats.maxHealth) then
				self.stats.psiHealth = self.stats.maxHealth
			end
			if (self.stats.psiHealth < 0) then 
				self.stats.psiHealth = 0 
			end
			self:playWarningSound()
			AdjustPlayerMood(value)
		end
		
		--edit to introduce 1 Hit KO Setting
		if seedsettings.instantdeath == TRUE then
			if (self.stats.psiHealth < self.stats.maxHealth) then
				self.stats.psiHealth = 0 
			end
		end

		if self.stats.psiHealth < 1 then
			GameLog('die1', self, value)
		end

		-- drop out if death routines , else continue with damage voice lines
		local fluffs = Global:loadGlobal('DreamFluffsInInv') or 0 
		if self.stats.psiHealth < 1 and fluffs > 0 then
			-- Find a dream fluff
			local fluff
			for k, v in Global.saved.Inventory['all'] do
				if v.Type == 'global.collectibles.DreamFluff' then
					fluff = FindScriptObject(k)
				end
			end
			if not fluff then
				GamePrint('ERROR: DreamFluffsInInv is greater than 0, but Raz has no fluffs!')
			else
				fluff:setState('UsePolitely')
			end
		elseif self.stats.psiHealth < 1 then
			--dart is dead and has no lives left
			--if dart has run out of health, but a cutscene just started playing, lets cheat and let the
			--cutscene play and not let raz die, and add 1 unit of health back to raz
			if (Global.cutsceneScript.cutscenePlaying == 1 or Global.levelScript.cutscenePlaying == 1) then
				self.stats.psiHealth = self.stats.psiHealth + 1
			else
				self:setState('DartDie')
			end
			return
		end
		
		if (value <= 0 and bDontPlaySound ~= 1) then
			self:sayRandomOuchLines()
		end
		
		return 1
	end

	function Ob:playWarningSound()
		-- play the dying sound if it's less than a certain value
		if self.stats.psiHealth <= 4 then
			-- play the warning sound if it's not playing
			if IsSoundPlaying(self.deathWarningSound) ~= 1 then
				self:playSound(self.deathWarningSound, 0, 0, 1)
			end
		else
			-- health is restored, stop warning sound
			if IsSoundPlaying(self.deathWarningSound) == 1 then
				self:stopSound(self.deathWarningSound)
			end				
		end		
	end

	function Ob:stopWarningSound()
		if IsSoundPlaying(self.deathWarningSound) == 1 then
			self:stopSound(self.deathWarningSound)
		end				
	end

	function Ob:sayRandomOuchLines()
		-- still saying a line
		if self.lastLine and IsSoundPlaying(self.lastLine) == 1 then
			-- don't play the sound
			return
		end
		-- this line is now a randomized cue of all the ouch lines
  		local line = random (1,6)
  		if (line == 1) then
  			self:sayLine("/GLRA041RA/",0,0, nil, 1)  --'Ow!'
  		elseif (line == 2) then
  			self:sayLine("/GLRA042RA/",0,0, nil, 1)  --'Hey!'
  		elseif (line == 3) then
  			self:sayLine("/GLRA043RA/",0,0, nil, 1)  --'Watch it!'
  		elseif (line == 4) then
  			self:sayLine("/GLRA044RA/",0,0, nil, 1)  --'Ug!'
  		elseif (line == 5) then
  			self:sayLine("/GLRA045RA/",0,0, nil, 1)  --'Ahhh!'
  		else
  			self:sayLine("/GLRA046RA/",0,0, nil, 1)  --'Man!'
  		end		
	end

-- ****************************************************************************

	-- used by DialogTreeManager
	function Ob:onDialogBubbleChosen(choice)
		self.dialogChoice = tonumber(choice)+1
	end

-- ****************************************************************************


	function Ob:onDamageDart(value, from, damageMods)
		if (Global.cutsceneScript.cutscenePlaying == 1 or Global.levelScript.cutscenePlaying == 1 or self.block == 1) then
			return nil
		end
		if not from then
			GamePrint('ERROR: DamageDart requires a from.  Dart will not be damaged.')
			StackTrace()
			return
		end
		damageMods = damageMods or 0

		self:callSpamListeners('DamageDart', value)			

		-- Added a new damage type, Sneeze, which makes Raz sneeze out his brain.
		if from and from.damageType and from.damageType == 'Sneeze' then
			if DebugHookVars(0,'invulnerable') == 0 and self.bDartIsDying == 0 and self.inNoDamageScene == FALSE then -- dart is invul for 2 seconds upon taking damage
				if not FindScriptObject('BrainDart') then
					SetNewAction(self, 'Sneeze Brain')
					SpawnScript('MC_BrainDart', 'BrainDart', '', 1)
					local sx, sy, sz = self:getPosition()
					local ox, oy, oz = GetEntityForwardVector(self)
					local yaw = AlignY(0, 0, ox, oz)
					LaunchEntity(FindScriptObject('BrainDart'), sx, sy+125, sz, 50, yaw, 0, 500)
					self:setNewAction('Idle1')
				end
			end
		elseif self.rPsiShield.bActive == 1 then
			self.rPsiShield:Flash()
		elseif value then
			value = tonumber(value)
			if ((not self.timersInUse or self.timersInUse['1'] ~= 1) and (DebugHookVars(0,'invulnerable') == 0) and (self.bDartIsDying == 0) and (self.inNoDamageScene == FALSE)) then	-- dart is invul for 2 seconds upon taking damage
				---------HACK HACK HACK to make sure that raz exits shop when hit--------
				if (self.rCurrShopController) then
					self:sendMessage(self.rCurrShopController, 'RazHurt', '', 0)
				end
				if (self.rCurrDialogTreeController) then
					self:sendMessage(self.rCurrDialogTreeController, 'RazHurt', '', 0)
				end
				---------END HACK---------------------
				
				-- Interrupt all powers, except clairvoyance if it's in raz-tracking mode.
				if (BitAnd(damageMods, kDART_DAMAGE_MOD_NO_POWER_INTERRUPT) == 0) then
					self:interruptPowers(nil, (self.clairCamUpdater.lookAtWho == Global.player and 'Clairvoyance'))
				end

				--self.block = 1
				if self:adjustHealth(-value) then
					if BitAnd(damageMods, kDART_DAMAGE_MOD_FLAMING) == kDART_DAMAGE_MOD_FLAMING then
						self.heat = self.firestartResistance
						self.bTrueFirestartingTarget = 1
						self:onFireEnd()
                    elseif (BitAnd(damageMods, kDART_DAMAGE_MOD_MEGA_KNOCK_BACK) == kDART_DAMAGE_MOD_MEGA_KNOCK_BACK) then
						SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageFront_medium.jan')
						local pi, ya = self:getKnockBackTrajectory(from)
						self:knockBack(nil, from, pi, ya, nil, 3000)
					elseif (BitAnd(damageMods, kDART_DAMAGE_MOD_CUSTOM) == kDART_DAMAGE_MOD_CUSTOM) then
						-- do nothing, let the custom code play anims on raz
					elseif (BitAnd(damageMods, kDART_DAMAGE_MOD_NO_KNOCK_BACK) == 0) then
						local angle = self:angleBetween(from)
						if not angle then
							SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageFront_medium.jan')
						elseif (angle < -45 and angle >= -135) then		-- left
							SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageLf.jan')
						elseif (angle > 45 and angle <= 135) then	-- right
							SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageRt.jan')
						elseif (angle > 135 or angle <= -135) then  	-- back
							SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageBack_medium.jan')
						else											-- forward
							SetNewAction(self, 'Knock Back', 'Anims/DartNew/DamageFront_medium.jan')
						end
					end					
					
					if (BitAnd(damageMods, kDART_DAMAGE_MOD_NO_INVULNERABILITY) == 0) and BitAnd(damageMods, kDART_DAMAGE_MOD_FLAMING) ~= kDART_DAMAGE_MOD_FLAMING then
						LoadBlendAnim(self,'Anims/DartNew/GeneralFacial/angry_.pba', 0 )
						self:createTimer(self.damageRecoveryTime,'1')
						self.ouchies:run(self)
						self:createTimer(20, self.TIMER_DAMAGE_FLICKER)
						self:damageFlicker(1, 0)
					end
				end
			end
		else
			GamePrint('ERROR-- called DamageDart with nil!')
		end
	end

	function Ob:damageFlicker(bDamagey, time)
		if bDamagey == 1 then
			SetEntityGlow(Global.player, 2, 0)
		else
			SetEntityGlow(Global.player, 0, 0)
		end
	end

	-- stuns the player for a given amount of time
	function Ob:onStunPlayer(time, from)
		if ((self.bIsStunned == 0 ) and (DebugHookVars(0,"invulnerable") == 0) and (self.bDartIsDying == 0) and (self.inNoDamageScene == FALSE)) then
			self:doNothing()
			time = time or 1000
			self.bIsStunned = 1
			self:createTimer(time,self.TIMER_STUN)
		end
	end
	
	-- light the player on fire for a set amount of time
	function Ob:onFirestartPlayer(data, from)
		-- fix
		if (self.bOnFire ~= 1) and (self.bDartIsDying == 0) and (DebugHookVars(0,"invulnerable") == 0) and (self.block ~= 1) then
			self:playSound('FirestartingMED')
			self:interruptPowers(1)
            self:ignite()
		end
    end

	-- put out the player if he's on fire
	function Ob:extinguish()
		if self.bOnFire == 1 then
			if (self.steamFXPool) then
				local steamFX = self.steamFXPool:get()
				steamFX:attach(self)
				steamFX:runThenPool()
			end
			
			self.heat = 0
			self:fireDissipate()
		end
	end
	
	-- special damage function for when the player is on fire
	function Ob:takeFireDamage(amount)
		local damageMods = BitOr(kDART_DAMAGE_MOD_NO_INVULNERABILITY, kDART_DAMAGE_MOD_NO_KNOCK_BACK)
		self:sendMessageEx(Global.player, 'DamageDart', '', 'fi', tostring(self.fireDamage), damageMods)
	end
	
	
	-- called when the timer is up for the fire to stop
	function Ob:fireDissipate()
		self:killTimer(self.TIMER_ON_FIRE)
		
		-- we're no longer on fire
		self.bOnFire = 0
		
		self:goToDefaultState()
		
		-- WE DON'T WANT TO DO THIS		
--		-- detach the explosion fx
--		Global.player.fsExplode:detach()
		
		-- remove fire fx
		-- Checking for IsDead, since Raz may need to do this on level unload.
		if self.fire and IsDead(self.fire ~= 1) then
			self.fire:detach()
			self.fire:stop(0, 0, 1)
			self.fire = nil
		end
		
		-- stop the fire sound
		if (self.rFireBurnSndHandle) then
			self:stopSound(self.rFireBurnSndHandle)
		end
	end


	-- Set player to Do Nothing state, so you can do whatever you want with him.  Cutscenes and things.
	function Ob:doNothing()
		self:cancelClairvoyance()
		self:stopMelee()
		self:setNewAction('Do Nothing')
		self.invDisplayer:invItemAdded(nil)
		--if raz is blinking from damage, stop
		self:killTimer(self.TIMER_DAMAGE_FLICKER)
		self.flickerCount = nil
		self:damageFlicker(0, 0)
		if (self.ouchies) then
			self.ouchies:stop(1)
		end
	end

-- ****************************************************************************
	-- Just calls onDamageDart with the appropriate number of damage points.
	function Ob:onPsiBlast(data, from)
		local value = GetPsiBlastCharge(from)
		if from.enemyDamageOverride then
			value = from.enemyDamageOverride
			from.enemyDamageOverride = nil
		elseif value <= 0.33 then
			value = 1
		elseif value <= 0.66 then
			value = 2
		else
			value = 3
		end
	       	self:onDamageDart(value, from)
	end

	-- alwaysLookAt: default nil.  If 1, always looks at Raz.  If a table or string, always looks at that entity,
	-- if the entity is within 2000 (for now; logic could change).
	function Ob:setClairvoyanceTarget(target, alwaysLookAt, bUninterruptible)
		self:callSpamListeners('Clairvoyance', 1)			

		if ( self.zLock ) then
			self.lockHub:Deactivate()	
		end
		if self.bClairOn == 1 then
			self:cancelClairvoyance()
		end
		self.bClairOn = 1
		self.bUninterruptible = bUninterruptible
		self.lastClairTarget = target
		self.bPlayerControlledClairvoyance = ((target and target.bClairvoyancePlayerControl == 1) and 1) or 0

		if (target and target.Name ~= 'Wrestler' and target.bClairvoyancePlayerControl ~= 1) then
			self:interruptPowers(nil, 'Clairvoyance') -- cancel the bubble and such
			SetNewAction( self,'Clairvoyance' )
			--SetEntityVisible(self.lastClairTarget, 0)
		end
		self:xEnterClairCloud()
		self:cancelInvisibility()
		-- play sound for clairvoyance
		if (self.rClairvoyanceSnd) then
			PlaySound(nil, self.rClairvoyanceSnd)
		end
		if ( target ) then
			self.clairCamHandle = Global.levelScript.camControl:pushAndSetClairvoyance(self)
			if (target and (target.clairOffX ~= nil or target.clairOffY ~= nil or target.clairOffZ ~= nil)) then
				AttachCameraToEntity(target, target.clairOffX or 0, target.clairOffY or 0, target.clairOffZ or 0, target.clairRotX or 0, (target.clairRotY or (GetMeshIsBackwards(target) == 1 and 180)) or 0, target.clairRotZ or 0)
			else	
				AttachCameraToEntity(target, 0, (target.getHeight and target:getHeight()) or 0, 0, target.clairRotX or 0, (target.clairRotY or (GetMeshIsBackwards(target) == 1 and 180)) or 0, target.clairRotZ or 0)
			end
			SetClairvoyanceTarget(target, 0, 0) -- just set the pointer so we can poll for deletion
			
			if( nil == self.bInvisOn ) then
				self:setClairDisguise( target, FindScriptObject(self.HeldItem) )
			else
				self:setClairDisguise( nil, nil )
			end
			
			if alwaysLookAt then
				if type(alwaysLookAt) == 'number' then
					if alwaysLookAt == 1 then
						self.clairCamUpdater:run(Global.player)
					end
				elseif type(alwaysLookAt) == 'string' then
					self.clairCamUpdater:run(FindScriptObject(alwaysLookAt, 1))
				elseif type(alwaysLookAt) == 'table' then
					self.clairCamUpdater:run(alwaysLookAt)
				end
			end
			if ( target.clairFOV ) then
				self.clairRestoreFOV = GetCameraFieldOfView();
				SetCameraFieldOfView(target.clairFOV);
			else
				self.clairRestoreFOV = nil
			end
		else
			HardBreak('NO CLAIRVOYANCE TARGET')
		end
		
   		if self.bPlayerControlledClairvoyance == 1 then
			self:interruptPowers(nil, 'Clairvoyance') -- cancel the bubble and such
   			self.bWrestlerClairOn = 1
   		else
   			SetScriptControlHandler(self)		
   		end
		if self.bUninterruptible ~= 1 then
			local xpos = 455
 			local ypos = 300
 			if(GetLanguage() == 2) then
 				xpos = 460  -- french
 			elseif(GetLanguage() == 3) then
 				xpos = 450  -- german
                        end
			self.rHelpTextHandle = DisplayText("/GLZG041TO/", xpos, ypos) 
  
		end
											    
		--In case the prox hint 
		self:refreshProximityHint()
	end								 

	function Ob:switchTargetWhileClairOn(target)
		self.clairCamUpdater:setNewTarget(target)
	end

	-- Enables a disguise for Raz if the object he's holding merits one, and he's in clair view.
	function Ob:setClairDisguise(target,item)
		if self.disguise then self.disguise:turnOff() end
		self.disguise = nil

		if target then
			self.disguise = target.getRazClairDisguise and target:getRazClairDisguise( item )
			if self.disguise then self.disguise:turnOn() end
		end
	end
	
	-- Decomp function to enable clairvoyance cloud; in most cases, you want setClairvoyanceTarget, not this.
	function Ob:xEnterClairCloud()
		--self.lastClairCam = Global.camControl:pushAndSetChase(nil, nil, nil, nil, 200)
		EnterClairvoyanceCloud()
		
		-- Begin motion blur
		SetMotionBlurState(kMOTIONBLURSTATE_NONE)
		SetMotionBlurEnable(1)
		SetMotionBlurScale(1.03)
		SetMotionBlurMaskTexture(self.clairBlurTexture)
		SetMotionBlurInput(.2, .35)
		SetMotionBlurOutput(1)
	end

	function Ob:xExitClairCloud()
		-- End motion blur
		SetMotionBlurState(kMOTIONBLURSTATE_NONE)
		
		--Global.camControl:removeCam(self.lastClairCam)
		ExitClairvoyanceCloud()
	end

	function Ob:cancelClairvoyance(bDontSetHandler)		
		if (self.bClairOn == 1) then

			self:callSpamListeners('Clairvoyance', 0)			

			self.bClairOn = 0
			if (self.clairCamUpdater) then
				self.clairCamUpdater:stop()
			end
			AttachCameraToEntity(nil)
			Global.levelScript.camControl:removeCam(self.clairCamHandle)
			MoveCameraToIdeal()
			-- play sound for clairvoyance
			if (self.rClairvoyanceSnd) then
				StopSound(self.rClairvoyanceSnd)
			end
			if ( self.clairRestoreFOV ) then
				SetCameraFieldOfView(self.clairRestoreFOV)
			end
			if ( self.lastClairTarget and IsDead(self.lastClairTarget) == 0 )  then -- check it in case target was killed
				self:sendMessage(self.lastClairTarget, 'CancelClairvoyance', '')
			end
			SetClairvoyanceTarget(nil,0,0)
			SetClairvoyanceNightvision(0)
			SetCameraIR(0)
			if (self.bWrestlerClairOn == 1) then
				self.bWrestlerClairOn = 0
			elseif ( bDontSetHandler ~= 1 ) then
				SetControlHandler(kCONTROL_PLAYER)
			end
			local lookTarget = GetLookTarget(self)
			if ( self.zLock == TRUE and lookTarget ) then
				self.lockHub:Activate(lookTarget)
			end
			self:setClairDisguise( nil, nil )
			self:xExitClairCloud()

			local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
			if (item) then
				item:show()
			end
		end
		
		
		if (self.rHelpTextHandle) then
			RemoveText(self.rHelpTextHandle)
		end
		self.lastClairTarget = nil
	end
   
	function Ob:handleScriptControls(iControl)
		if ( iControl == nil ) then
			iControl = ControlTable -- default to global value to make invocation from engine easier
		end
		if(iControl.button_pressed.JOY_B == 1) and self.bUninterruptible ~= 1 then
			self:cancelClairvoyance()
		end
	end

	-- This is always sent when B is pressed
	-- Return true if the button press was handled; otherwise it will be sent on to the control handler
	function Ob:onButtonCancel()
		if ((self.bWrestlerClairOn == 1) and
			self.bUninterruptible ~= 1) then
			
			self:cancelClairvoyance()
			return 1
		end
		return nil
	end

-- ****************************************************************************

	--Sent whenever the control handler is changed.  type specifies the type (eg kCONTROL_BALL)
	function Ob:onControlHandlerChanged(type)
		self:callSpamListeners('ControlHandlerChanged', type)
	end


-- ****************************************************************************

	function Ob:mapPowerToButton(power, button)
		-- is this power already mapped to the button?
		local currentPower = GetMappedPower(button)
		if (currentPower == power) then
			return
		end
		
		-- see if the power is mapped to other buttons
		local rtrigPower = GetMappedPower(kQUICKPICK_TRIGR)
		local blackPower = GetMappedPower(kQUICKPICK_BLACK)
		local whitePower = GetMappedPower(kQUICKPICK_WHITE)
		
		MapPowerToButton(power, button)		
		
		if (button ~= kQUICKPICK_TRIGR) and (power == rtrigPower) then
			MapPowerToButton(currentPower, kQUICKPICK_TRIGR)
		end
		if (button ~= kQUICKPICK_BLACK) and (power == blackPower) then
			MapPowerToButton(currentPower, kQUICKPICK_BLACK)
		end
		if (button ~= kQUICKPICK_WHITE) and (power == whitePower) then
			MapPowerToButton(currentPower, kQUICKPICK_WHITE)
		end
	end

-- ****************************************************************************
   
	function Ob:interruptPowers(bForce, except)
		if except ~= 'Clairvoyance' then self:cancelClairvoyance() end
        
		-- if we've got a firestartingTarget, then we need to stop the smoke fx on it
		if (self.firestartingTarget and self.firestartingTarget.bTrueFirestartingTarget == 1) then
			if IsDead(self.firestartingTarget) == 1 then
				GamePrint('ERROR: calling fire abort on dead entity.  Name: '..(self.firestartingTarget.Name or 'nil'))
			else
				self.firestartingTarget:onFireAbort()
			end
		end

		-- Interrupt engine controlled stuff
		InterruptPowers(bForce)
		
		-- Interrupt script controlled stuff
		local curInvis = GetPlayerInvisibility()
		-- This should match the conditional in InterruptPowers()
		if ( curInvis > 0 and (curInvis < 1 or bForce == 1) ) then
			self.rInvisibilityFX:stop(1)
		end
		if (except ~= 'Confusion' and self.state_name == 'ThrowConfusionGrenade') then 
			if (self.confusionGrenade) then self.confusionGrenade:interrupt() end
			self:setState(nil)
		end
	end

	function Ob:cancelInvisibility(bForce)
		if ( GetPlayerInvisibility() > 0.0 ) then
			local duration = GetGameTimeSecs() - self.lastInvisibilityActivation
			if ( duration < self.InvisibilityDuration ) then
				--self.lastInvisibilityActivation = GetGameTimeSecs() - ((1.0 - duration / self.InvisibilityDuration) * self.InvisibilityDuration)
				self.lastInvisibilityActivation = GetGameTimeSecs() - (self.InvisibilityDuration-duration)
			else
				self.lastInvisibilityActivation = GetGameTimeSecs() + self.InvisibilityCoolDown
			end
			self:sendMessage(self, 'InvisibilityEnded')
		end
		self.rInvisibilityFX:stop(1)
		SetPlayerInvisibility(0.0, 0)
		if self.lastInvisedItem and IsDead(self.lastInvisedItem) ~= 1 then
			self.lastInvisedItem:setInvisibility(0)
			self.lastInvisedItem = nil
		end
	end
-- ** D R O W N I N G  C O D E  **************************************************************************
	
	function Ob:onDrownPlayer()
		self:interruptPowers(1)
		self:loadAnim('Anims/DartNew/Raz_Drown.jan', 0.1 , 0)
	end
    
-- ****************************************************************************	

	function Ob:onWaterRespawn()
		self:loadAnim('Anims/DartNew/CrawlOutofWater.jan', 0.1 , 0)
		self:resetPowerActivationTimes()
	end   

-- ****************************************************************************
	
	function Ob:leaveBody()
		GamePrint('ERROR - dont play old ITM stuff!')
		return
	end

-- ****************************************************************************
	
	function Ob:endBraining()
		FadeToColor(0, 0, 0, 0, 0, 0 , 0, 0, 255, 0, 2)
		local bFadeDone = 0
		while ( bFadeDone == 0 ) do
			local r,g,b,a = FadeGetCurrentState()
			if ( a >= 255 ) then
				bFadeDone = 1
			else
				Yield()
			end
		end
		
		-- TMP
		-- FadeToColor(0 , 0, 0, 255, 0, 0, 0, 0, 0, 0, 2)
		
		local bubble = FindScriptObject('ThoughtBubble')
		bubble:setNewAction('Close')
		bubble:setOrientation(0,0,0)
		bubble:setScale(1,1,1)
		LookAtEntity(self,nil)
		UnLoadPriorityAnim(self, 1, 0.1)
		self:loadAnim('Anims/DartNew/Helmet/DartHelmetUp.jan',0.1)
		PausePlayerControls(0)
		--SetIntoTheMindParticipation(self,0)
		--SetIntoTheMindParticipation(bubble,0)
		--SetIntoTheMindParticipation(bubble.rollEmitter,0)
		--SetIntoTheMindParticipation(bubble.spiroEmitter,0)
		--SetIntoTheMindParticipation(bubble.subEmitter0,1)
		--SetIntoTheMindParticipation(bubble.subEmitter1,1)
		--SetIntoTheMindParticipation(bubble.subEmitter2,1)
		SetEntityVisible(bubble,0)
		SetEntityAlpha(bubble,1,0)
		--EndIntoTheMind()
		SetCamera(kCAMERA_CHASE)
		if ( self.brainingCalledFrom ) then
			--SetIntoTheMindParticipation(self.brainingCalledFrom,0)

			-- tmp so the shortcuts leave the world in a good state
			self.brainingCalledFrom:setPosition(self.bbx, self.bby, self.bbz)
			self.brainingCalledFrom:setOrientation(self.bbax, self.bbay, self.bbaz)
			SetPhysicsFlag(self.brainingCalledFrom, PHYSICS_APPLYGRAVITY, 1)
			SetPhysicsFlag(self.brainingCalledFrom, PHYSICS_COLLIDER, 1)
			SetPhysicsFlag(self.brainingCalledFrom, PHYSICS_COLLIDEE, 1)
			--
			
			self:sendMessage(self.brainingCalledFrom, 'BrainingDone', '')
		end
		KillScript(self.ITMSwirl)
		KillScript(self.ITMSwirl2)
		KillScript(self.ITMSwirl3)
		KillScript(self.ITMRadial)
		if ( self.ITMPixieDust ) then
			KillScript(self.ITMPixieDust)
		end
		EnableLooking(self,1)
        SetNewAction(self,'Stand')
		self:setState(nil)
	end

-- ****************************************************************************
	
	function Ob:onStopITMDust(data,from)
		if ( self.ITMPixieDust ) then
		end
	end

-- ****************************************************************************
	
	function Ob:onFailBraining(data,from)
		GamePrint('ERROR: Failed braining!')
		local bubble = FindScriptObject('ThoughtBubble')
		SetNewAction(bubble,'Closing')
	end

-- ****************************************************************************

	function Ob:beginStateDartDie()
		self.bDartIsDying = 1
		self.bUninterruptibleState = 1
	end

	function Ob:stateDartDie()
		self.bUninterruptibleState = 0	-- this state doesn't yield at all, so we can just unset this immediately
		
		self:stopSound(self.deathWarningSound)
		
		self:fireDissipate()

		self:callSpamListeners('DartDie')	--Call any dart death listeners

		self:killTimer( self.TIMER_CONFUSED )

		if (Global.levelScript:isTrainingLevel() ~= 1) then
		--if Global.levelScript.demoLevel ~= 1 then
			--hack to disallow kicking raz out of LO->LL
			-- removed that hack, you can go back to LL once again - Andrew
--			if (strsub(Global.levelScript.Type, 1,5) ~= 'lo.LO') then  
				self.stats.dartLives = max(0,self.stats.dartLives - 1)
--			end
		end
		
		if (Global.levelScript.demoLevel == 1) then
			GamePrint('Dart has died, but this is a demo level.  Respawning.')
			self:setState('Respawn')

		--edit return to CU when running out of lives, NO MATTER WHAT
		elseif self.stats.dartLives <= 0 then
			GamePrint('Dart has died and is out of lives.  Returning to real world.')

			self:deathSequence(1)
			
			Global:saveGlobal('bKickedOut', 1)
			Global.levelScript:returnToCU()

		--[[elseif self.stats.dartLives <= 0 and Global.levelScript.levelType == 'mental' then
			GamePrint('Dart has died and is out of lives.  Returning to real world.')

			self:deathSequence(1)
			
			Global:saveGlobal('bKickedOut', 1)

			if (Global:loadGlobal('bMCEntered') == 1) then
				Global.levelScript:returnToCU()
			else
				--If the player entered the mental realm by braining a characer, then we should put him back near
				--that character for the sake of clarity.  If not, he is sent back to CASA.
				local lastBrainingLevel = Global:loadGlobal('LastBrainingLevel')
				if (lastBrainingLevel) then
					--LastBrainingLevel will get cleared out in startPlayer of the next level, because
					--it needs it to know where to place the player.
					Global.levelScript:loadNewLevel(Global:getPhysicalLevel(lastBrainingLevel))
				else
					--Otherwise, the player must have entered from the CU, so send him to CASA.
					Global.levelScript:loadNewLevel('CASA')
				end
			end
		elseif self.stats.dartLives <= 0 and Global.levelScript.Type == 'as.ASRU' then
			self.stats.dartLives = 1
			self:setState('Respawn')
		elseif self.stats.dartLives <= 0 then
			GamePrint('Dart has died and is out of lives.  Returning to cabin.')
			self:deathSequence(1)
			self:setState(nil)
			Global:saveGlobal('bCabinned', 1)
			if Global.levelScript:getLevelName() == 'LLLL' then
				Global.levelScript:loadNewLevel('LLLL')
			elseif Global.levelScript:getLevelPrefix() == 'AS' then
				Global.levelScript:loadNewLevel('ASGR')
			else
				if (Global:load('CALevelState', 'CA') == 7) then
					Global.levelScript:loadNewLevel('CAKC_NIGHT')
				else
					Global.levelScript:loadNewLevel('CAKC')
				end
			end]]
		else
			GamePrint('Dart has died, but is not in a mental world, or is not out of lives.  Respawning.')
			self:setState('Respawn')
		end
	end

-- ****************************************************************************
    
	-- Blocking function.  When this returns, raz's controls are turned off
	-- and his state is 'Do Nothing'
	function Ob:deathSequence(bKickedOut)
		--GamePrint("DEATH SEQUENCE")
		
		self.respawnMilestone = self.RESPAWN_DEATHSEQUENCESTART
		--GamePrint('Dart dies.  Kicked out? '..(kickedOut or 'nil'))
		self.deathFX:detach()
		self.deathFX:attach(self, 'spineJA_1')
		self.deathFX:run()
		-- find death cam position
		self.respawnMilestone = self.RESPAWN_AFTERCAMERACHANGE
		--load his death anims and music
		self:setNewAction('Do Nothing')
		LoadAnim(self, 'Anims/DartNew/Death.jan', 0.1, 0)		
		PlaySound(nil,self.dartDeathCry, 0, 0 )
		-- stop the level music
		Global.levelScript:stopLevelTheme()
		PlaySound(nil,self.deathMusic, 0, 0 )
		
		self:sleep(.5)

		--respawn Dart to first good respawn point
		Global.cutsceneScript:fadeToBlack(0.5, 1)
		self.respawnMilestone = self.RESPAWN_FADEDTOBLACK
		self.deathFX:detach()
		self:sleep(1)
		--GamePrint("END DEATH SEQUENCE")
		
	end

-- ****************************************************************************

	function Ob:setPosition(x,y,z)
	 	if (GetPhysicsState(self, PHYSICSSTATE_RIDINGBALL) == 1) then
			local gx,gy,gz = GetEntityGravityDir(self)
			x,y,z = x+(gx*100), y+(gy*100), z+(gz*100)
		end
		FreezeManager_SetInstaThaw()
		%Ob.Parent.setPosition(self, x,y,z)
	end

-- ****************************************************************************

	-- Not as simple as you'd expect: fudges stuff if Raz is on the ball, and actually
	-- returns the position of the base of the ball.  Pass in a 1 to always get the position
	-- of his feet, regardless of control handler.
	function Ob:getPosition(bFeet)
		if bFeet ~= 1 and GetPhysicsState(self, PHYSICSSTATE_RIDINGBALL) == 1 then
			-- ripped from ScriptBase's getPosInFrontOf, to avoid stack overflow
			local height = -100
			local ux, uy, uz = GetEntityUp(self)
			local x, y, z = GetPosition(self)
			return x+ux*height, y+uy*height, z+uz*height
		else
	 		return %Ob.Parent.getPosition(self)
		end
	end

-- ****************************************************************************

	function Ob:beginStateRespawn()
		self.respawnMilestone = self.RESPAWN_START
   		-- dart is dying so don't allow anything through
   		self.bDartIsDying = 1
		InterruptPowers()
		self:stopConfusion(1)
		
		self:fireDissipate()
		self.heat = 0.0
		
		--self:dontRunPlayerControls(1)
		if (Global.levelScript.waterFXManager ~= nil) then
			Global.levelScript.waterFXManager:FXoff()
		end
	end
	

	--added 'milestones', so other respawn states can sinchronize with this state
	function Ob:stateRespawn()
		-- send message out to listeners
		self:callSpamListeners('RazRespawn')			

		self:resetPowerActivationTimes()
		
		SetControlHandler(kCONTROL_PLAYER)	-- just in case the player is climbing a ladder or something.
		self:replaceSelectedItemInPsack(1,1)
		Global.cutsceneScript:runCutscene('RespawnScene', 1, 0, 0, 0)
		self:callSpamListeners('RazRespawnDone')
		self:stopConfusion(1)		
		if (Global.levelScript.levelType == 'mental')  then
			if (Global.levelScript:isTrainingLevel() ~= 1) then	-- don't play this if dart dies in a training level
				if (Global:loadGlobal('SeenMentalLivePopup') ~= 1) then
					Global:saveGlobal('SeenMentalLivePopup', 1)
					--edit Removing Tutorial Popup
					--Global.levelScript:addTutorialBox("/GLZE014TO/")
					--Global.levelScript:addTutorialBox("/GLZE013TO/",'Textures/HUD/Brain_4.dds') 
				end
			end
		end
		
		-- fill up ammo if appropriate
		-- if we respawned from this death and did not actually die, then we shouldn't fill it up
		if (Global.player.bRespawnFromDeathFall ~= 1) then
			-- HACK HACK - make sure that we're not in the ultra coach battle!!!
			-- this battle is 
			local bRefillAmmo = 1
			local levelName = GetCurrentLevelName()
			if (levelName == 'LOCB') then
				local coach = FindScriptObject('UltraCoach')
				if (coach.Phase >= 2) then
					bRefillAmmo = 0
				end
			end
			
			if (bRefillAmmo == 1) then				
				Global.player.stats.psiBlastAmmo = Global.player.stats.psiBlastMaxAmmo
				SetPsiBlastAmmo(Global.player.stats.psiBlastAmmo)
				Global.player.stats.confusionAmmo = Global.player.stats.confusionMaxAmmo
			end
		end
		
		Global.player.bRespawnFromDeathFall = nil
		
		self:setState(nil)
   	end

	-- ***************************************************************************
	-- Score and Rank
	-- ****************************************************************************
	-- value is optional and defaults to 1
	function Ob:incrementRank(value, bRunEffect)
		self:setRank(self.stats.rank + (value or 1), bRunEffect or 1)
	end

	function Ob:setRank(num, bRunEffect)
		local level = GetCurrentLevelName()
		if (bRunEffect == 1) and level and level ~= '' then
			self.rankBling:go()
			--Update the RankPowerManager accordingly
			self.rankPowerManager:setRank(num)
		else
			--Update the RankPowerManager accordingly
			self.rankPowerManager:setRank(num, 1)
		end

		-- achievements
		if self.tRankAchievementName then
			for k, achInfo in self.tRankAchievementName do
				if achInfo.rank <= num then
					UnlockAchievement(achInfo.achID)
				end
			end
		end
		self.stats.rank = num
	end
	
	function Ob:getRank()
		if (1) then
			return self.stats.rank
		end
	end

-- ****************************************************************************

	function Ob:stateDartStatDump()
		--game screen dump for all of Dart's Stats
		self:printTable(self.stats)
		self:setState(nil)
	end

-- ****************************************************************************
	--NOTE: this list is cleared on every level load!!!!
	Ob.spamListeners = {}

	function Ob:addCollideeListener(l)
		self.collideeListeners[l.Name] = l
	end

	function Ob:removeCollideeListener(l)
		if (self.collideeListeners) then
			self.collideeListeners[l.Name] = nil
		end
	end
	
	function Ob:addSpamListener(message, listener)
		if (not self.spamListeners[message]) then 
			self.spamListeners[message] = {} 
		end

		if (not listener) then
			GamePrint('WARN: Passed null listener argument to addSpamListener')
		elseif (not listener['listener'..message]) then
			GamePrint('WARN: Tried to add a spam listener for message type '..message..' without proper listener function')
		end
		
		self.spamListeners[message][listener.Name] = listener
	end
	
	function Ob:removeSpamListener(message, listener)
		if (self.spamListeners[message] and self.spamListeners[message][listener.Name]) then
			self.spamListeners[message][listener.Name] = nil 
		end
	end
	
	--Sends a message to all spam listeners listening for a certain message:
	--	message: the message that should be sent
	--	arg1: (Optional)first optional argument
	--	arg2: (Optional)first optional argument
	--	arg3: (Optional)first optional argument
	--	arg4: (Optional)first optional argument
	function Ob:callSpamListeners(message, arg1, arg2, arg3, arg4)
		-- send message out to listeners
		if (self.spamListeners[message]) then
			for i, listener in self.spamListeners[message] do
				local listenerFunction = listener['listener'..message]
				if (listenerFunction) then
					listenerFunction(listener, arg1, arg2, arg3, arg4)
				end
			end
   		end
	end
	
	function Ob:onGroundChange(old, _, new)
		if old == nil and new ~= nil then
			local type = GetEntityCollideType(new)
			-- the "global" entity has collision type CPT_None :-P
			if type == CPT_Triangles or type == CPT_None then
				if (self.bBlockLandSound ~= 1) then
					if GetControlHandler() == kCONTROL_BALL then
						-- No sound currently for landing while on ball.
					else
						Global.levelScript:playLandSound(GetGroundMaterial(self))
					end
				end
			end
		elseif new ~= nil then
			--GamePrint(GetEntityCollideType (new))
		end
	end

	function Ob:onCollide(nx, from, ny,nz)
		self:callSpamListeners('Collide', nx, from)
		self:xCheckForFireSpread(from)
	end
	
	-- function to check to see if you should spread fire to this other dude.  Checks to see if you're on fire, if they are,
	-- if they can handle it, and so on and so forth.  Then, sets the bastard on fire if appropriate.
	-- NOTE: this function was ported over from Censor.lua so that raz could light enemies on fire as well
	function Ob:xCheckForFireSpread(toWhom)
		if (toWhom and
			self.bOnFire == 1 and
			toWhom.firestartResistance and
			toWhom.firestartResistance > 0 and
			toWhom.bOnFire ~= 1) then
			
			-- we just hit something that was not on fire already, so light it up
			toWhom.heat = toWhom.firestartResistance
			toWhom.bTrueFirestartingTarget = 1
			toWhom:onFireEnd()
			return 1
		end
	end

	function Ob:onNewMoveCollide(value, from)
		if from and from ~= Global and self.bSpikyBall == 1 then
			if not strfind(GetActionState(Global.player), 'Bubble') then
				self.bSpikyBall = 0
			else
				if from.onNewMoveMelee then
					self:playSound(self.rSpikeBallCollide, 0, 0, 1)
					SendMessageEx(Global.player, from, 'NewMoveMelee', 1, 'sf', 'melee1a', 1)
				end
			end
		end
		self:callSpamListeners('NewMoveCollide', value, from)			
	end

	function Ob:onNewGroundCollide(value, from)
		if from and from.Name == 'AS_WaterPlane' then
			from:onCollide(value, self)
		end
		self:callSpamListeners('NewGroundCollide', value, from)			
	end
	
	function Ob:onSplinePointArrive(value)
		self:callSpamListeners('SplinePointArrive', value)			
	end

-- ****************************************************************************

	function Ob:onPSIChallengeMarker(value, from)
		if (Global:loadGlobal('SeenMarkerTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenMarkerTutorialPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG001TO/", 'Textures/icons/InventoryItems/PsiChallengeMarker.tga')--DIALOG=<<You just found a PSI Challenge Marker! Everytime you find one of these, your Psychadet Rank goes up! Rank up enough and you\'ll get new PSI Powers!>>
		end
		
		value = (value and tonumber(value)) or 1
		if Global.levelScript:getLevelName() ~= 'CAJA' then
			-- Spawned markers from the redemption machine don't count.
			self.stats.PSImarkers = self.stats.PSImarkers + value
		end
		if( 0 < value ) then
			self:incrementRank(value)
		end
	end
	
-- ****************************************************************************


	-- TEMP: putting these functions in here now to test em - the linecodes for these are not yet final. 
	-- these are lines that are currently being split up, so replace with linecodes once they are there.
	function Ob:collectDusterText()
		if (Global:loadGlobal('SeenDusterTutorial') ~= 1) then
			Global:saveGlobal('SeenDusterTutorial', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/CAZF008TO/", 'Textures/UI/Sayline Heads/FordNinja_sayline.tga')
			--Global.levelScript:addTutorialBox("/CAZF005TO/", 'Textures/icons/InventoryItems/CobwebDuster.tga')
		end
	end	

	function Ob:collectDowsingRodText()
		if (Global:loadGlobal('SeenDowsingRodTutorial') ~= 1) then
			Global:saveGlobal('SeenDowsingRodTutorial', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/CAZF009TO/",'Textures/icons/UI_Icons/UI_arrowhead.tga')
			--Global.levelScript:addTutorialBox("/CAZF006TO/", 'Textures/icons/InventoryItems/DowsingRod.tga')
		end
	end	
	
	function Ob:collectMentalMagnetText()
		if (Global:loadGlobal('SeenMentalMagnetTutorial') ~= 1) then
			Global:saveGlobal('SeenMentalMagnetTutorial', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZF029TO/", 'Textures/icons/InventoryItems/Magnet_Patch_alpha.tga')
		end
	end	
	
	function Ob:collectColorizerText()
		if (Global:loadGlobal('SeenColorizerTutorial') ~= 1) then
			Global:saveGlobal('SeenColorizerTutorial', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZF030TO/", 'Textures/icons/InventoryItems/Bacon.tga')
		end
	end	
	--
	
	function Ob:onFigment(value, from)
		if (Global:loadGlobal('SeenFigmentTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenFigmentTutorialPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG030TO/")
			--Global.levelScript:addTutorialBox("/GLZG016TO/", 'Textures/icons/InventoryItems/FigmentIcon.tga')
			--Global.levelScript:addTutorialBox("/GLZG028TO/ /GLTO000TO/ /GLZG029TO/", 'Textures/icons/InventoryItems/FigmentIcon.tga')
		end
		
		value = ((value and tonumber(value)) or 1)
		self.stats.figmentPoints = self.stats.figmentPoints + value
		self.stats.figmentsFromLevel = self.stats.figmentsFromLevel + value
		self.stats.figmentPointsFromEntireLevel = self.stats.figmentPointsFromEntireLevel + value

		if self.stats.figmentPointsFromEntireLevel == Global.figmentPointsPerLevel[Global.levelScript:getLevelPrefix()] then
			Global:save('bFigmentsComplete', 1)
			self:collectibleBling("/GLZD439TO/", from.textureName)
		end

		if Global.bFigmentSpam == 1 then -- for erik
			GamePrint('Figment points are now '..self.stats.figmentPoints)
		end
		if (self.stats.figmentPoints >= 100) then
			if Global.bFigmentSpam == 1 then -- for erik
				GamePrint('Figment points exceeded 100, decrementing by 100 to increment rank.')
			end
			self.stats.figmentPoints = self.stats.figmentPoints - 100
			Global:saveGlobal('NeedRankIncrement', 1 )
			--Global.player:incrementRank()	-- increment the players rank since they got enough figments
		end
	end

-- ****************************************************************************

	function Ob:onMaxAmmoUp(data, from)
		-- don't allow maxups if we're at the max
		if (self.stats.psiBlastMaxAmmo ~= -1) then
			self.stats.psiBlastMaxAmmo = self.stats.psiBlastMaxAmmo + kGOODIE_AMOUNT_PSIBLAST_MAX_UP
			self.stats.psiBlastAmmo = self.stats.psiBlastMaxAmmo
			SetPsiBlastAmmo(self.stats.psiBlastMaxAmmo)
			if (Global:loadGlobal('SeenMaxAmmoUpPopup') ~= 1) then
				Global:saveGlobal('SeenMaxAmmoUpPopup', 1)
				--edit Removing Tutorial Popup
				--Global.levelScript:addTutorialBox("/GLZE009TO/", 'Textures/icons/InventoryItems/MaxAmmoUp.dds')			
			end
		end
	end
	
-- ****************************************************************************

	function Ob:onMaxConfusionUp(data, from)
		if (self.stats.confusionMaxAmmo ~= -1) then
			self:setConfusionMaxAmmo(self.stats.confusionMaxAmmo + kGOODIE_AMOUNT_CONFUSION_MAX_UP)
			if (Global:loadGlobal('SeenMaxConfusionUpPopup') ~= 1) then
				Global:saveGlobal('SeenMaxConfusionUpPopup', 1)
				--edit Removing Tutorial Popup
				--Global.levelScript:addTutorialBox("/GLZE010TO/", 'Textures/icons/InventoryItems/MaxConfusionUp.dds')			
			end
		end
	end

-- ****************************************************************************	

	function Ob:onMaxLivesUp(data, from)
		if (Global:loadGlobal('SeenMaxLivesUpPopup') ~= 1) then
			Global:saveGlobal('SeenMaxLivesUpPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZB065TO/", 'Textures/icons/InventoryItems/MaxLivesUp.dds')
		end
		self.stats.maxLives = self.stats.maxLives + 1
		if self.stats.maxLives == 11 then
			UnlockAchievement('ACH_COLL_ALLHELMETS')
		end
		self.stats.dartLives = self.stats.dartLives + 1
	end

-- ****************************************************************************

	function Ob:onOneUp(data, from)
		if (Global:loadGlobal('SeenOneUpPopup') ~= 1) then
			Global:saveGlobal('SeenOneUpPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZE012TO/", 'Textures/icons/InventoryItems/OneUp.dds')			
		end
		if (self.stats.dartLives ~= self.stats.maxLives) then
			self.stats.dartLives = self.stats.dartLives + 1
		end
	end

-- ****************************************************************************

	function Ob:onBrain(brainID,from)

		brainID = strlower(brainID)	-- make sure brainID is all lowercase because that's how we store them to be safe
		if not brainID then
			GamePrint('ERROR: Brain '..from.Name..' had nil ID.')
			return
		end
		if self.stats.brains[brainID] then
			GamePrint('ERROR: Attempt to pick up duplicate brain ID '..brainID..', from name '..((from and from.Name) or 'nil'))
			return
		end
		self.stats.totalBrainsHeld = self.stats.totalBrainsHeld + 1
		self.stats.brainsFromLevel = self.stats.brainsFromLevel + 1
		self.stats.brains[brainID] = 'held'	

	end

-- ****************************************************************************

	function Ob:onBrainRedeemed(brainID, from)
		brainID = strlower(brainID)	-- make sure brainID is all lowercase because that's how we store them to be safe
		if (self.bDontCheckForRedeemingErrors ~= 1) then     --for use from the debug menu
			if not self.stats.brains[brainID] then
				GamePrint('ERROR: Attempt to redeem a brain Raz doesn\'t have.  ID '..brainID..', from '..from.Name)
				return
			end
			if self.stats.brains[brainID] == 'redeemed' then
				GamePrint('ERROR: Attempt to redeem already-redeemed brain.  ID '..brainID..', from '..from.Name)
				return
			end
		end
		self.stats.totalBrainsHeld = self.stats.totalBrainsHeld - 1
		self.stats.totalBrainsRedeemed = self.stats.totalBrainsRedeemed + 1		
		self.stats.brains[brainID] = 'redeemed'
		self:incrementMaxHealth(1)

		-- edit check for Victory Condition
		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.brainhunt == TRUE and seedsettings.requireMC == FALSE then
			if seedsettings.beatoleander == FALSE or Global:loadGlobal('bOleanderDefeated') == 1 then
				if self.stats.totalBrainsRedeemed >= seedsettings.brainsrequired then
					--write to text file for client to read
					local h = fopen("victory.txt", "w")
					fwrite(h, "victory\n")
					fclose(h)
				end
			end
		end

		if self.stats.totalBrainsRedeemed == 19 then
			UnlockAchievement('ACH_RET_ALLBRAINS')
		end
	end

-- ****************************************************************************

	function Ob:onShowPokeyToCampkid(kidID)
		kidID = strlower(kidID)	-- make sure brainID is all lowercase because that's how we store them to be safe
		self.stats.shownpokey[kidID] = 1
		local nNumKids = 0
		for k, v in self.stats.shownpokey do
			nNumKids = nNumKids + 1
		end
		if nNumKids == 15 then
			UnlockAchievement('ACH_POKEY_SHOWN_ALLKIDS')
		end
	end

-- ****************************************************************************

	function Ob:registerClairForAchievement(charName)
		if charName and charName ~= '' then
			-- don't add more if we don't need it
			if self:countClairvoyanceStats() < self.nNumClairTargetForAch then
				charName = strlower(charName)	-- make sure brainID is all lowercase because that's how we store them to be safe			
				self.stats.clairvoyanced[charName] = 1
				if self:countClairvoyanceStats() >= self.nNumClairTargetForAch then
					UnlockAchievement('ACH_CLAIRVOYED_CHARS')
				end
			end
		end
	end

	function Ob:countClairvoyanceStats()
		local nNumChars = 0
		for k, v in self.stats.clairvoyanced do
			nNumChars = nNumChars + 1
		end		
		return nNumChars
	end

-- ****************************************************************************
	function Ob:incrementMaxHealth(value)
		if (not self.stats.maxHealth) then
			self:resetStat('maxHealth')
		end
		if ((self.stats.maxHealth + value) > self.MAX_HEALTH) then
			GamePrint('WARN: Attempting to give Raz more health than he should get.')
			value = self.MAX_HEALTH - self.stats.maxHealth
		end
		self.stats.maxHealth = self.stats.maxHealth + value
		self.stats.psiHealth = self.stats.maxHealth
	end

-- ****************************************************************************
	-- this function is used to determin the status of camp kids brains
	-- brainID is the name of the camp kid you want to know the status of
	-- this function returns 1 of 3 possible values. They are:
	-- 'redeemed' : kid has already had their brain restored
	-- 'held'	  : kid has had their brain jar collected by the player but it has not yet been restored to them.
	--  nil		  : kid's brain jar has not yet been collected and thus their brain has not yet been restored. 
	
	function Ob:getBrainStatus(brainID)
		brainID = strlower(brainID)	-- make sure brainID is all lowercase because that's how we store them to be safe
		return self.stats.brains[brainID]
	end
-- ****************************************************************************

	function Ob:onArrowhead(value,from)
		value = tonumber(value)
		if (not value) then
			GamePrint('Invalid value passed to onArrowHead: '..tostring(value))
			return
		end
	
		if (value > 0) and (Global:loadGlobal('SeenArrowheadTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenArrowheadTutorialPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG031TO/", 'Textures/icons/UI_Icons/UI_Arrowhead.dds')
		end
        self.stats.arrowheads = self.stats.arrowheads + ((value and tonumber(value)) or 1)

		self:checkDowsingRod()
	end

	function Ob:onMentalArrowhead(value,from)
		if (Global:loadGlobal('SeenMentalArrowheadTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenMentalArrowheadTutorialPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG034TO/", 'Textures/icons/InventoryItems/PsiBallArrowhead.dds')
			
		end
		-- In the future (the year 2000), the arrowhead line will be commented out, and you will have to
		-- redeem your mental psitanium before it can be spent as arrowheads.
		
		-- the UI call has to be first, because it uses the stats value
        self.stats.arrowheads = self.stats.arrowheads + ((value and tonumber(value)) or 1)
		self.stats.numUnredeemedPsitanium = self.stats.numUnredeemedPsitanium+1
		
		self:checkDowsingRod()
	end

	function Ob:checkDowsingRod()
		if (Global.goalManager:isActive('UseDowsingRod') == 1) and (self.stats.arrowheads > 800) then
			Global.goalManager:deactivate('UseDowsingRod')
		end
	end

-- ****************************************************************************

	function Ob:onHealthAmmo(value,from)
		if (Global:loadGlobal('SeenHealthAmmoPopup') ~= 1) then
			Global:saveGlobal('SeenHealthAmmoPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG037TO/", 'Textures/icons/InventoryItems/PsiBallHealth.dds')--DIALOG=<<You\'ve just absorbed positive MENTAL HEALTH! Maintaining your mental health is important, because if you run out you will not be able to maintain your astral projection in this mind, and you\'ll be kicked back into the REAL WORLD.\">>
		end
		self:adjustHealth((value and tonumber(value)) or 1)
	end

-- ****************************************************************************
    
	function Ob:onPSIAmmo(value,from)
		if (self.rankPowerManager.bInfiniteAmmo == 1) then
			return	-- don't mess with our ammo if we've got infinite sauce
		end
		local amount = (value and tonumber(value)) or 1
		self.stats.psiBlastAmmo = min(self.stats.psiBlastAmmo + amount, self.stats.psiBlastMaxAmmo)
		self:adjustPsiBlastAmmo(amount)
	end
	
-- ****************************************************************************

	function Ob:onConfusionAmmo(value,from)
		if (self.rankPowerManager.bInfiniteAmmo == 1) then
			return	-- don't mess with our ammo if we've got infinite sauce
		end
		if (Global:loadGlobal('SeenConfusionAmmoPopup') ~= 1) then
			Global:saveGlobal('SeenConfusionAmmoPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZF006TO/", 'Textures/icons/InventoryItems/PsiBallConfusion.dds')			
		end
		value = value or 1
		self.stats.confusionAmmo = min(self.stats.confusionAmmo + value, self.stats.confusionMaxAmmo)
	end
	
-- ****************************************************************************

	function Ob:onArrowheadAmmo(value,from)
		value = value or 1
		UI_AdjustCollectible('arrowhead', value, self)
		SendMessage(self, self, 'MentalArrowhead', value)
	end

-- ****************************************************************************
	Ob.CONFUSEDTIME = 5
	Ob.TIMER_CONFUSED = '2000'
	
	function Ob:onConfusion(value,from)
		if (self.bConfused ~= 1) then
			self.confusionCRH = SpawnScript('Global.Util.CharResponseHandler')
			self.confusionCRH.owner = self
			self.confusionCRH.bLinePriority = 1
			if Global:loadGlobal('bRazHasBeenConfusedAtSomePoint') ~= 1 then
				self.confusionCRH.type = self.CRH_ALWAYS_SEQUENTIAL
				if Global.levelScript:getLevelName() == 'NIBA' then
					self.confusionChatterTable = {
						{line = "/GLAY004RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<<Ahh! Confusion... grenade...>>
						{line = "/GLAY005RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<< so... dizzy... who... am I?>>
					}
				else
					self.confusionChatterTable = {
						{line = "/GLAY005RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<< so... dizzy... who... am I?>>
					}
				end
				Global:saveGlobal('bRazHasBeenConfusedAtSomePoint', 1)
			else
				self.confusionCRH.type = self.CRH_ALWAYS_RANDOM
				self.confusionChatterTable = {
					{line = "/GLAB000RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<<Ohhh-oooh...>>
					{line = "/GLAB000RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<<Ohhh-oooh...>>
					{line = "/GLAB000RA/", maxPlays = -1, minPause=.8, maxPause=2},--DIALOG=<<Ohhh-oooh...>>
				}
			end
			self.confusionCRH:addDialog(self.confusionChatterTable)
			self.confusionCRH:chatterStart()

		
			GamePrint('Raz onConfusion - setting bConfused and flashing to green')	
			self.bConfused = 1
			Global.cutsceneScript:fadeToColor(0,255,0,150, 0)
			
			GamePrint('Raz onConfusion - set mirror scene')	
			SetMirrorScene(1)
			SetPlayerConfused(1)
			
			GamePrint('Raz onConfusion - begin motion blur')	
			-- Begin motion blur
			SetMotionBlurState(kMOTIONBLURSTATE_NONE)
			SetMotionBlurEnable(1,0)
			SetMotionBlurScale(1.1)
			SetMotionBlurOutput(0.75)
			SetMotionBlurInput(0.3, 0.0)
			
			GamePrint('Raz onConfusion - fade away green and set timer')	
			Global.cutsceneScript:fadeToColor(0,255,0,25, 2)
			self:createTimerSecs(self.CONFUSEDTIME, self.TIMER_CONFUSED)
			GamePrint('Raz onConfusion - end')	
		else
			GamePrint('Raz onConfusion - was already confused, doing nothing')	
		end
	end

-- ****************************************************************************

	function Ob:stopConfusion(silent)
		GamePrint('Stop Confusion')
		if (self.bConfused == 1) then
			if (self.confusionCRH) then
				self.confusionCRH:chatterStop()
				self.confusionCRH:killSelf()
				self.confusionCRH = nil
			end
			
			self.bConfused = 0
			GamePrint('Stop Confusion - end mirrorScene')
			SetMirrorScene(0)
			SetPlayerConfused(0)
			SetMotionBlurState(kMOTIONBLURSTATE_NONE, 1)

			if( nil == silent ) then
				GamePrint('Stop Confusion - end motion blur')
				GamePrint('Stop Confusion - flash green')
				Global.cutsceneScript:fadeToColor(0,255,0,150, 0)
				GamePrint('Stop Confusion - fade back in')
				Global.cutsceneScript:fadeToColor(0,255,0,0, 0.5)
				GamePrint('Stop Confusion - end')
			end
		else
			GamePrint('Stop Confusion - was not confused, doing nothing')
		end
	end
	
-- ****************************************************************************
	
	function Ob:onTouchedCobweb(value,from)
		self:adjustHealth(0 - tonumber(value))
	end

-- ****************************************************************************

	function Ob:onCollectedCobweb(value,from)
		value = (value and tonumber(value)) or 1
		self.stats.cobwebs = self.stats.cobwebs + value
		self.stats.websInInv = self.stats.websInInv + value
		self.stats.cobwebsFromEntireLevel = self.stats.cobwebsFromEntireLevel + value

		if self.stats.cobwebsFromEntireLevel == Global.cobwebsPerLevel[Global.levelScript:getLevelPrefix()] then
			Global:save('bCobwebsComplete', 1)
			self:collectibleBling("/GLZD437TO/", 'Textures/icons/InventoryItems/Journal_Cobweb.dds')
 			GamePrint('All cobwebs in level collected!!!')
		end
	end		
	
-- ****************************************************************************

	function Ob:onCollectedPSIChallengeCard(value,from)
		value = tonumber(value)
		
		if (Global:loadGlobal('SeenCardTutorialPopup') ~= 1) then
			Global:saveGlobal('SeenCardTutorialPopup', 1)
			--edit Removing Tutorial Popup
			--Global.levelScript:addTutorialBox("/GLZG012TO/", 'Textures/icons/InventoryItems/FordCore.tga')--DIALOG=<<But you\'ll need to get a PSI Core from the Camp Store, and a little help from Ford Cruller. /FordNinja/>>
			--Global.levelScript:addTutorialBox("/GLZG013TO/", 'Textures/icons/InventoryItems/PsiChallengeCard.tga')--DIALOG=<<Congratulations! You found a loose PSI Card!  Collect nine of these and you can build a PSI Challenge Marker /Marker/ out of them.>>
		else			
			-- checking to see if raz can get one more marker after this value in cards is added to his total
			-- if so, and they have Not yet redeemed one core+cards, then play the blocking hint, if they have then play the non-blocking hint
			local oldCardValue = self.stats.cardsInInv
			if (mod(oldCardValue, 9) > mod(oldCardValue + value,9)) or (value >= 9) then
				if (Global:loadGlobal('HasRedeemedForMarker') ~= 1) then					
					-- extra dialog if 9 cards are picked up before you beat basic braining
					local bBBComplete = Global:loadGlobal('bBBCompleted')
					if bBBComplete ~= 1 then
						--edit Removing Tutorial Popup
						--Global.levelScript:addTutorialBox("/GLZG033TO/", 'Textures/UI/Sayline Heads/Coach.tga')--DIALOG=<<... after class, of course.>>
					end
					--edit Removing Tutorial Popup
					--Global.levelScript:addTutorialBox("/GLZG015TO/", 'Textures/icons/InventoryItems/FordCore.tga')--DIALOG=<<Just buy a PSI Core at the Camp Store and bring it to Ford Cruller  /FordNinja/   so he can make you one!>>
					--Global.levelScript:addTutorialBox("/GLZG014TO/", 'Textures/icons/InventoryItems/PsiChallengeCard.tga')--DIALOG=<<Good news! You have enough PSI Cards to build a new PSI Challenge Marker! /Marker/>>
				else
					-- non-blocking version:
					--edit Removing Tutorial Popup
					--PrintMessage("/GLZE007TO/",0,400)--DIALOG=<<You just collected enough PSI Cards to make another PSI Challenge Marker!>>
				end
			end
		end
		if from and from.bDynamicallyCreated ~= 1 then -- Spawned ones don't go into area stats.
			self.stats.PSIChallengeCards = self.stats.PSIChallengeCards + value
		end
		self.stats.cardsInInv = self.stats.cardsInInv + value
		-- HACK: there's a little bug with UI_AdjustCollectible and negative numbers; rather than fix that (we're past engine code lockdown), we can
		-- avoid it this way.
		if value > 0 then
			UI_AdjustCollectible('PSICards', value, from or Global.player)
		end
	end	

-- ****************************************************************************

	function Ob:onCollectedPSICore(value,from)
		value = tonumber(value)
		self.stats.PSIChallengeCores = self.stats.PSIChallengeCores + value
		self.stats.coresInInv = self.stats.coresInInv + value
	end

-- ****************************************************************************

------CUSTOM BAGGAGE TAG HANDLER------
--Stores Collected BaggageTag, Global Key
	function Ob:onCollectedSuitcaseTag(name,from)
		self.stats.RandoSuitcaseTag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedSuitcaseTag = self.stats.CollectedSuitcaseTag + value
	end

	function Ob:onCollectedPurseTag(name,from)
		self.stats.RandoPurseTag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedPurseTag = self.stats.CollectedPurseTag + value
	end

	function Ob:onCollectedHatboxTag(name,from)
		self.stats.RandoHatboxTag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedHatboxTag = self.stats.CollectedHatboxTag + value
	end

	function Ob:onCollectedSteamertrunkTag(name,from)
		self.stats.RandoSteamertrunkTag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedSteamertrunkTag = self.stats.CollectedSteamertrunkTag + value
	end

	function Ob:onCollectedDufflebagTag(name,from)
		self.stats.RandoDufflebagTag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedDufflebagTag = self.stats.CollectedDufflebagTag + value
	end

-- ****************************************************************************

------CUSTOM BAGGAGE HANDLER------
--Removes Baggage Tag from inventory, stores Collected Baggage, Increases Rank, Global Lock
	function Ob:onCollectedSuitcase(name,from)
		self.stats.RandoSuitcase[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedSuitcaseTag = self.stats.CollectedSuitcaseTag - value
		self:incrementRank()
	end

	function Ob:onCollectedPurse(name,from)
		self.stats.RandoPurse[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedPurseTag = self.stats.CollectedPurseTag - value
		self:incrementRank()
	end

	function Ob:onCollectedHatbox(name,from)
		self.stats.RandoHatbox[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedHatboxTag = self.stats.CollectedHatboxTag - value
		self:incrementRank()
	end

	function Ob:onCollectedSteamertrunk(name,from)
		self.stats.RandoSteamertrunk[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedSteamertrunkTag = self.stats.CollectedSteamertrunkTag - value
		self:incrementRank()
	end

	function Ob:onCollectedDufflebag(name,from)
		self.stats.RandoDufflebag[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
		local value = 1
		self.stats.CollectedDufflebagTag = self.stats.CollectedDufflebagTag - value
		self:incrementRank()
	end

-- ****************************************************************************

	------CUSTOM RANDOPSIPOWERS HANDLERS------
	--Stores Collected RandoPsiPowers and Progressive Powerups
	function Ob:onRandoClairvoyance(name,from)
		self.stats.RandoClairvoyance[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoConfusion(name,from)
		self.stats.RandoConfusion[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoFirestarting(name,from)
		self.stats.RandoFirestarting[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoInvisibility(name,from)
		self.stats.RandoInvisibility[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoLevitation(name,from)
		self.stats.RandoLevitation[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoMarksmanship(name,from)
		self.stats.RandoMarksmanship[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoShield(name,from)
		self.stats.RandoShield[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoTelekinesis(name,from)
		self.stats.RandoTelekinesis[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM RANDOPSICARD HANDLER------
	--Stores Collected RandoPsiCard
	function Ob:onRandoPsiCard(name,from)
		self.stats.RandoPsiCard[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM RANDOPSIMARKER HANDLER------
	--Stores Collected RandoPsiMarker
	function Ob:onRandoPsiMarker(name,from)
		self.stats.RandoPsiMarker[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM RANDOPROP HANDLER------
	--Stores Collected Prop
	function Ob:onRandoProp(name,from)
		--check to make sure it's not being reincarnated in inventory
		if self.stats.RandoProp[name] ~= 'collected' then
			self.stats.RandoProp[name] = 'collected'
			self.stats.APItem[name] = 'collected'
			local apcollect = fso('APCollected', 'APCollected')
			apcollect:writeCollectedItem(name)
			GamePrint('Stored '..name)
		end
	end

-- ****************************************************************************
	------CUSTOM VAULT HANDLER------
	--Stores CollectedVault, Increases Rank when you open a vault
	function Ob:onCollectedVault(name,from)
		self.stats.CollectedVault[name] = 'collected'
		self.stats.APItem[name] = 'collected' 
		self.stats.totalVaults = self.stats.totalVaults+1
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)

		local seedsettings = fso('RandoSeed', 'Randoseed')
		if seedsettings.lootboxvaults == TRUE then
			--Random Rewards! Loot Box!
			--Random value of arrowheads to receive
			self.randArrows = random (10, 100)
			--Roll some RNG for Jackpots/Ranks to recieve
			self.jackpotArrows = random (1, 50)
			self.jackpotRanks = random (1, 50)
		else
			--Make Result Static, One Rank and 50 Arrowheads
			self.randArrows = 25
			self.jackpotArrows = 1
			self.JackpotRanks = 26
		end
		
		--2% chance for 500 arrowheads instead
		if self.jackpotArrows == 50 then
			UI_AdjustCollectible('arrowhead', 500, self)
			SendMessage(self, self, 'Arrowhead', 500)
			self.arrowsMessage = "500!!"
		--8% chance for 250 arrowheads instead
		elseif self.jackpotArrows >= 46 then
			UI_AdjustCollectible('arrowhead', 250, self)
			SendMessage(self, self, 'Arrowhead', 250)
			self.arrowsMessage = "250!!"
		else
			UI_AdjustCollectible('arrowhead', self.randArrows, self)
			SendMessage(self, self, 'Arrowhead', self.randArrows)
			self.arrowsMessage = self.randArrows
		end

		--2% chance for 5 Ranks
		if self.jackpotRanks == 50 then
			self:incrementRank(5)
			self.rankMessage = "Five Ranks!!!"
		--8% chance for Two Ranks
		elseif self.jackpotRanks >= 46 then
			self:incrementRank(2)
			self.rankMessage = "Two Ranks!"
		--50% chance for One Rank
		elseif self.jackpotRanks >= 26 then
			self:incrementRank()
			self.rankMessage = "One Rank!"
		else
			self.rankMessage = "None..."
		end
		GamePrint('Stored '..name)
		
	end

-- ****************************************************************************

	------CUSTOM MAXLIVES AND MAXAMMO HANDLER------
	--Stores RandoLivesUp and RandoAmmoUp
	function Ob:onRandoLivesUp(name,from)
		self.stats.RandoLivesUp[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onRandoAmmoUp(name,from)
		self.stats.RandoAmmoUp[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM ARROWHEADBUNDLE HANDLERS------
	--Stores collected ArrowheadBundles
	function Ob:onArrowheadBundleSmall(name,from)
		self.stats.ArrowheadBundleSmall[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

	function Ob:onArrowheadBundleMedium(name,from)
		self.stats.ArrowheadBundleMedium[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM BRAINJAR HANDLERS------
	--Stores collected BrainJars
	function Ob:onBrainJar(name,from)
		self.stats.BrainJar[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	------CUSTOM APPLACEHOLDER HANDLERS------
	--Stores collected APPlaceholders
	function Ob:onAPPlaceholder(name,from)
		self.stats.APPlaceholder[name] = 'collected'
		self.stats.APItem[name] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(name)
		GamePrint('Stored '..name)
	end

-- ****************************************************************************

	function Ob:onScavengerHuntItem(ItemID,from)
		self.stats.scavengerHuntItems[ItemID] = 'unredeemed'
		self.stats.numUnredeemedScavengerHuntItems = self.stats.numUnredeemedScavengerHuntItems + 1
		self.stats.scavItemsFromLevel = self.stats.scavItemsFromLevel + 1
		self.stats.APItem[ItemID] = 'collected'
		local apcollect = fso('APCollected', 'APCollected')
		apcollect:writeCollectedItem(ItemID)

	end

-- ****************************************************************************

	function Ob:onVault(reelName, from)
		self.stats.vaultsFromLevel[reelName] = 'recovered'
		self.stats.totalVaults = self.stats.totalVaults+1
		self.stats.vaultsFromEntireLevel = self.stats.vaultsFromEntireLevel+1
		self.stats.vaultCountFromLevel = self.stats.vaultCountFromLevel+1
		if self.stats.vaultsFromEntireLevel == 2 or (self.stats.vaultsFromEntireLevel == 1 and Global.levelScript:getLevelPrefix() == 'MC') then
			Global:save('bVaultsComplete', 1)
		end
		
		self:callSpamListeners('Vault', reelName)
	end
	
-- ****************************************************************************

	function Ob:redeemHuntItems()
		local lastNum = self.stats.numRedeemedScavengerHuntItems
		for k, v in self.stats.scavengerHuntItems do
			if self.stats.scavengerHuntItems[k] == 'unredeemed' then
				self.stats.scavengerHuntItems[k] = 'redeemed'
				self.stats.numRedeemedScavengerHuntItems = self.stats.numRedeemedScavengerHuntItems + 1
				self.stats.numUnredeemedScavengerHuntItems = self.stats.numUnredeemedScavengerHuntItems - 1
			end
		end
		local rankInc = 0
		if lastNum < 8 and self.stats.numRedeemedScavengerHuntItems >= 8 then
			rankInc = rankInc + 5
		end
		if self.stats.numRedeemedScavengerHuntItems == 16 then
			rankInc = rankInc + 5
			UnlockAchievement('ACH_SCAVENGER_COMPL')
		end
		if rankInc > 0 then
			self:incrementRank(rankInc)
		end
	end
					       
-- ****************************************************************************

	function Ob:onEmotionalBaggage(sBaggageType,from)
		--edit adjusteed to ignore dupluicate baggage in a level
		--if self.stats.baggageCollected[sBaggageType] == 1 then
		--	GamePrint('ERROR! Some how Raz picked up '.. sBaggageType .. 'twice in this level')
		--else
			self.stats.baggageCollected[sBaggageType] = 1
			self.stats.EmotionalBaggageSolved = self.stats.EmotionalBaggageSolved + 1
			self.stats.baggageMatched = self.stats.baggageMatched + 1
			--edit removing
			--[[if self.stats.EmotionalBaggageSolved == 5 then 
				self:incrementRank()
				local levelPrefix = Global.levelScript:getLevelPrefix()
				JournalAddEmoBagItem( levelPrefix.. 'Emo','/GLZD506TO/',levelPrefix) -- add the concept art to the journal
				Global:save('bEmoBagsComplete', 1)
				self:collectibleBling("/GLZD438TO/\n/GLZD440TO/", 'Textures/Objects/vault_reel_front_2.dds')
			end]]
		--end
	end

	--Shows collectible bling after rankup cheer is done
	function Ob:collectibleBling(text, texture)
		-- we want to wait until that rank up cheer is over before we bring up this message
		local emoBagCollectionThread = SpawnScript('Locator', 'emoBagCollectionThread')
		emoBagCollectionThread.stateWaitForRankupCheer =
			function(obj)
				while (IsRankupCheerDone() ~= 1) do
					Yield()
				end
				%self:showCollectibleBling(%text, %texture)
				obj:killSelf()
			end
		emoBagCollectionThread:setState('WaitForRankupCheer')
	end

	--This actually shows the collectible bling on the screen	
	function Ob:showCollectibleBling(text, texture)
		self:playSound('YouWin', 0, 0, 1)
		
		self.collBlingText = SpawnScript('Global.OtherEntities.UIElement', 'collBlingText')
		self.collBlingText:createText(text, 210, 130,.8,.8, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1,300)
		self.collBlingText:textFadeOnHUD(bFadeOnHUD or 1)
		self.collBlingText:autoRemove(4000)

		if (texture) then
			self.artIcon = SpawnScript('Global.OtherEntities.UIElement', 'collBlingSprite')
			self.artIcon:createSprite(texture, 70, 90, nil, .8, .8)
			self.artIcon:spriteFadeOnHUD(0)									  
			self.artIcon:autoRemove(4000)				 
		end						  
	end
	
-- ****************************************************************************

	function Ob:onEmitter(data)
		if data == '1' and self.ledgeDirtFX and GetCollisionMaterialNumber(self) ~= 1 
				and GetCurrentLevelName() ~= 'SACU' then
			self.ledgeDirtFX:run(self)
		end
        if ( self.Razilla == 1) then
			if not self.rRazillaPullUpSound then
				self.rRazillaPullUpSound = LoadSound('BuildingPullUp')
			end	
			self:playSound(self.rRazillaPullUpSound, 0, 0, 1)
        end		
	end
	
-- ****************************************************************************
	function Ob:onEmotionalBagTag(sTagType,from)
	
		if self.stats.bagTagsCollected[sTagType] == 1 then
			GamePrint('ERROR! Some how Raz picked up '.. sTagType .. 'twice in this level')
		else
			self.stats.bagTagsCollected[sTagType] = 1
		end
	end

-- ****************************************************************************
-- Inventory
-- ****************************************************************************
	--Checks to see if Raz has an item in his current (level specific) inventory.  To check global inventory, use
	--Global:isInInvetory()
	function Ob:isInInventory(Name)
		-- Check to see if Item is already in the inventory
		return (self.Inventory[Name] and 1) or 0;
	end
	
-- ****************************************************************************

	function Ob:addToInventory(item, bHoldImmediately, bSilent)
		if (is_subclass_of(item, 'global.props.HeldObject') == 1) then
			item:beNotPickupable()		
		end
		if item.NoPackStorage == 1 then bHoldImmediately = 1 end
		-- Store the name of the item (so the items can get killed and we aren't
		-- left with a bad reference 
		-- Make sure that we don't already have this in our inventory
		if(self.Inventory[item.Name] == nil) then
			self.Inventory[item.Name] = item.Type
			Global:saveInventory(item)
			-- Send message saying you are now in the inventory
			self:sendMessage(item, 'AddedToInventory', 'noData', 1)
			if self.bUninterruptible ~= 1 then self:cancelClairvoyance() end

			item:setVelocity(0, 0, 0)
			UnLoadPriorityAnim(item, 0, 0.2)
			item:setOrientation(0, 0, 0)

			if bHoldImmediately and bHoldImmediately == 1 then bSilent = 1 end
			self.invDisplayer:invItemAdded(item, 0, bSilent)
			if bHoldImmediately == 1 then self:setSelectedItem(item.Name) end

			-- Undo gravity and remember if we need to restore it
			if ( QueryPhysicsFlag(item, PHYSICS_APPLYGRAVITY) == 1 ) then
				item.bRestoreInventoryGravity = 1
				SetPhysicsFlag(item, PHYSICS_APPLYGRAVITY, 0)
			end
		else
			GamePrint('ERROR: Adding '..item.Name..' to inv, but we already have it.')
			StackTrace()
		end
	end

-- ****************************************************************************

	-- bDueToLevelLoad also means it's going away, kaput, being destroyed.
	-- So don't do anything with the item in that case.
	function Ob:removeFromInventory(item, bDueToLevelLoad)
		if not item then return end
		if item.Name == self.HeldItem then
			self.HeldItem = nil
			self:refreshProximityHint()
			self:setClutchAnim()
		end
		if self.Inventory[item.Name] then
			self.Inventory[item.Name] = nil
			if bDueToLevelLoad == 1 then 
			else
				-- Send message saying you are now removed the inventory; message is kind of useless if level is ending or item is dead.
				if IsDead(item) ~= 1 then
					self:sendMessage(item, 'RemovedFromInventory','') 
					SetEntityDomain(item, 'Level')
				end
				-- Don't remove the item from Raz's inv permanently if it's just dying because the level is exiting;
				-- only remove it permanently if it got killed (or otherwise removed) through gameplay.
				Global:clearInventory(item)
			end
			NotifyItemRemovedFromInventory(item.Name)
			self:callSpamListeners('ItemSelected', item, 0)			
		end
	end

-- ****************************************************************************

	--[[
		Hacky, special-case, non-decomped function for AS items.
	]]--
	function Ob:replaceItemInPsack(Item, bNotify)
		local curActState = GetActionState(self)
		
		-- only want to be able to put away an item when we are in one of these 3 states            
		if(curActState == 'Idle General' or curActState == 'Stand' or curActState == 'Bubble Idle FB' or
			self.forceItemPutaway == 1) then
			self.forceItemPutaway = 0
			-- make sure we have something selected
			if(Item) then
				DetachEntityFromParent(Item, self)
				if ( Item.NoPackStorage == 1 ) then
					SendMessage(self,Item,'Dropped','',0)
					SetEntityCollideIgnoreEntity(Item,self,3)
					-- we should also impart some velocity to the object
					-- but collision is flaky right now so we'll just set
					-- down in front of the player
					local dx,dy,dz = GetEntityForwardVector(self)
					--ApplyVelocity(self,dx,dy+300,dz)
					local x,y,z = self:getPosition()
					SetPosition(Item,x+dx*50,y+dy*50,z+dy*50)
					-- Item should handle its own flags and collision settings
					-- in Item:onDropped(), but let's be safe for now
					SetPhysicsFlag(Item,PHYSICS_APPLYGRAVITY,0)
				else
					Item:setOrientation(0,0,0)
					self.invDisplayer:invItemAdded(Item, 1)
					UnLoadPriorityAnim(Item,0)
					if (bNotify) then
						self:sendMessage(Item, 'Replaced', '',1) -- notify item that it is being put back into sack
					end                    

				end
				SetVelocity(Item,0,0,0)
			else
				GamePrint('No item passed to replaceItemInPsack!')
			end
		end
	end

-- ****************************************************************************

	function Ob:replaceSelectedItemInPsack(bForce, bHurryUp)
		if (bForce~=TRUE) and (self.HeldItem == 'StraightJacket') then
			-- Putting away straightjacket causes mesh change, and changing player
			-- mesh is currently not robust (mesh loses all its anims).  So disallow
			-- unless player is standing
			local action = GetActionState(self)
			if not ((action=='Stand') or (action=='Idle General')) then
				return
			end
		end

		self.forceItemPutaway = 0
		-- make sure we have something selected
		local item = FindScriptObject(self.HeldItem)
		if (item and (item.bDontPack ~= 1)) then
			if ( item.NoPackStorage == 1 ) then
				-- releaseSelectedItem takes care of detaching entity from dart and setting velocity to 0,0,0
				self:releaseSelectedItem()	
				-- onReleased gets sent by releaseSelectedItem instead
				SetEntityCollideIgnoreEntity(item,self,3)
				-- we should also impart some velocity to the object
				-- but collision is flaky right now so we'll just set
				-- down in front of the player
				local dx,dy,dz = GetEntityForwardVector(self)
				local x,y,z = self:getPosition()
				SetPosition(item,x+dx*50,y+dy*50,z+dy*50)
				if ( item.bRestoreInventoryGravity == 1 ) then
					item.bRestoreInventoryGravity = 0
					SetPhysicsFlag(item, PHYSICS_APPLYGRAVITY, 1)
				end
			else
				--DetachEntityFromParent(item, self)
				item:setVelocity(0, 0, 0)
				self.invDisplayer:invItemAdded(item, 1, bHurryUp)
				UnLoadPriorityAnim(item,0)
				self:sendMessage(item, 'Replaced', '',1) -- notify item that it is being put back into sack
			end
			
			self:callSpamListeners('ItemSelected', item, 0)			
			
			self.HeldItem = nil
			self:refreshProximityHint()
			self:setClutchAnim()
		end
	end
	
-- ****************************************************************************
	-- called from the engine... this is for when we need to magically "pop" the item out of existence
	-- and then called again when we want to pop the item back in
	function Ob:onControlsNeedBothHands(bNeedBoth, bOnlyReallyNeedOneHand)
		if bOnlyReallyNeedOneHand == 1 then
			local item = self.HeldItem and FindScriptObject(self.HeldItem)
			if item and item.bPutAwayOnMelee == 1 then
				if bNeedBoth == 1 then
					self:popHeldItem()
				else
					self:unpopHeldItem()
				end
			end
		elseif (bNeedBoth == 1) then
			self:popHeldItem()
		else
            self:unpopHeldItem()
		end
	end

-- ****************************************************************************
	-- pop the held item out of existence
	-- NOTE: THE HeldItem VAR IS NOT CLEARED - Raz will behave as if he is still holding that item
	function Ob:popHeldItem()
		if (self.HeldItem) then
			local Item = FindScriptObject(self.HeldItem)
			if (Item) then
				GamePrint('POP!')
				Item:hide()
				self:sendMessage(Item, 'HidItem')
				UnLoadPriorityAnim(self,1,0.0)
			end
		end
	end
	
-- ****************************************************************************
	-- pop the held item back into Raz's hand
	function Ob:unpopHeldItem()
		if (self.HeldItem) then
			local Item = FindScriptObject(self.HeldItem)
			if (Item) then
				if Item.bSBHidden == 1 then
					GamePrint('UNPOP!')
					Item:show()
					self:setClutchAnim(0.0)
				end
			end
		end
	end

-- ****************************************************************************

	function Ob:setClutchAnim(blendTime)
		if ( self.HeldItem ) then
			local Item = FindScriptObject(self.HeldItem)
			if ( Item ) then
				local scale = Item.heldscale or 1
				Item:setScale(scale, scale, scale)
				if ( Item.overrideClutchAnim ~= 1 ) then
					if self.state_name == 'PsiActivate' then
						self:setState(nil)
					end
					if ( Item.clutchAnim ) then
						if (Item.clutchAnim ~= 'NO_CLUTCH') then
							LoadPriorityAnim(self, Item.clutchAnim, 1, (blendTime or 0.2), 1)
						end
					else
						LoadPriorityAnim(self,'Anims/DartNew/BodyParts/PopperEmptyHold_ArmLf.jan',1,0.2,1)
					end
				end
			else
				UnLoadPriorityAnim(self,1,0.5)
			end
		else
			UnLoadPriorityAnim(self,1,0.5)
		end
	end

-- ***************************************************************************    
    
	function Ob:setSelectedItem(ItemName, bHurry)
		-- make sure we have something selected
		if (ItemName == nil) then
			GamePrint('No item name passed to setSelectedItem')
			return nil
		end
		
		local Item = FindScriptObject(ItemName)
		if self.HeldItem then
			local HeldItem = FindScriptObject(self.HeldItem)
			if ( HeldItem and (HeldItem ~= Item) ) then
				--Don't get out new item, because current item cannot be packed
				if (HeldItem.bDontPack == 1) then
					return nil
				end
			
				if(HeldItem.NoPackStorage == 1) then
					self:releaseSelectedItem(1)
				else
					if HeldItem.bIsCostumeItem ~= 1 or Item.bIsCostumeItem ~= 1 or HeldItem.bIsWornByPlayer ~= 1 then -- dont want to put away last item if it was a costume item
						self:replaceSelectedItemInPsack(1, (Item and 1) or bHurry)
						UnLoadPriorityAnim(self, 1, 0.5)
					end
				end    
			end
		end

		-- Clear any running InvAdder effects and processes
		self.invDisplayer:invItemAdded(nil)
		
		if(Item) then

			if (Item.overrideClutchAnim ~= 1) then
				if Item.overrideJoint and Item.overrideJoint ~= '' then
					AttachInventoryEntityToPlayer(Item, Item.overrideJoint)
				else
					AttachInventoryEntityToPlayer(Item)
				end
			end
			SetEntityDomain(Item,'Level')
			SetEntityVisible(Item,1)
			if(Item.heldscale) then
				Item:setScale(Item.heldscale,Item.heldscale,Item.heldscale)
			else
				Item:setScale(1,1,1)
			end
			self.HeldItem = ItemName
			self:refreshProximityHint()
			self:killHint()
			self:sendMessage(Item, 'Selected', '') -- notify item that it has been selected
			if (Item.overrideClutchAnim ~= 1) then
				self:setClutchAnim((bHurry == 1 and 0))
			end
			--notify those who want to know 
			self:callSpamListeners('ItemSelected', Item, 1)			
		end
	end

-- ****************************************************************************

	-- data is 0 for "soft push", 1 for "hard push"
	-- If the item is used on something, calls onItem on the something.
	-- If the item used on nothing, calls onActivateFromInventory on the item.
	function Ob:useSelectedItem(data)
		local heldItem = self.HeldItem and FindScriptObject(self.HeldItem)
		if ( (heldItem) and (heldItem.bGroundUseOnly == 1) and (GetPhysicsState(self, PHYSICSSTATE_ONGROUND) ~= 1) ) then
			return
		end
		
		local lookTarget = self:getLookTarget()
		
		if lookTarget then
			self:cancelInvisibility()
			if ( heldItem and (heldItem.bIsBasicBraining == 1) and lookTarget.onBasicBraining ) then
				-- Mirroring stuff from BubbleControlHandler
				self:sendMessage(lookTarget, 'BasicBraining', (heldItem and heldItem.Name) or '')
				SetEntityFlag(self, ENTITY_PERSISTENTLOOKTARGET, 1)
				SetEntityFlag(self, ENTITY_LOOKATINTERESTINGTHINGS, 1)
			elseif( (not heldItem) or (heldItem.bUseOnly ~= 1)) then
				self:sendMessage(lookTarget, 'Item', (heldItem and heldItem.Name) or '')
			end
		end
		if (heldItem) then
			self:sendMessage(heldItem, 'ActivateFromInventory', data)
			self:setClairDisguise( self.lastClairTarget, heldItem )
		end
		
		--notify those who want to know 
		self:callSpamListeners('ItemUsed', heldItem, 1)		
	end

-- ****************************************************************************
	-- Assumes the object is just dropped.  Returns it so you can do something
	-- with it.
	function Ob:releaseSelectedItem(noautoclutch)
		local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		if item then
			self:sendMessage(self.HeldItem, 'Released', '')
			DetachEntityFromParent(item, self)
			SetVelocity(item, 0, 0, 0)
			self:removeFromInventory(item)
			item:setScale(1, 1, 1)
			if ( item.bRestoreInventoryGravity == 1 ) then
				item.bRestoreInventoryGravity = 0
				SetPhysicsFlag(item, PHYSICS_APPLYGRAVITY, 1)
			end
		end
		self.HeldItem = nil
		self:setClairDisguise( self.lastClairTarget, nil )
		self:refreshProximityHint()
		if noautoclutch ~= 1 then
			self:setClutchAnim()
		end
		return item
	end
    
-- ****************************************************************************

	function Ob:printInventory()
		GamePrint('Outputing inventory')
		local index,value
		index = next(self.Inventory,nil)
		while(index ~= nil) do
			GamePrint("I have ".. index .. " in my Psack");
			index = next(self.Inventory,index);
		end
	end	

-- ****************************************************************************
   	
	function Ob:makeVisible()
		%Ob.Parent.makeVisible(self)
		local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		
		if self.lastHiddenItem and IsDead(self.lastHiddenItem) ~= 1 then
			self.lastHiddenItem:makeVisible()
			self.lastHiddenItem = nil
		end
   	end

   	function Ob:makeInvisible(alpha)
		%Ob.Parent.makeInvisible(self, alpha)
		local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		if (item) then
			if self.lastHiddenItem and IsDead(self.lastHiddenItem) ~= 1 then
				self.lastHiddenItem:makeInvisible()
			end
			self.lastHiddenItem = item
			item:makeInvisible()
		end
   	end

	function Ob:show()
        self:makeVisible()
		if self.lastHiddenItem and IsDead(self.lastHiddenItem) ~= 1 then
			self.lastHiddenItem:makeVisible()
			self.lastHiddenItem = nil
		end
	end		

	function Ob:hide()
		self:makeInvisible()
        local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		if (item) then
			if self.lastHiddenItem and IsDead(self.lastHiddenItem) ~= 1 then
				self.lastHiddenItem:makeInvisible()
			end
			self.lastHiddenItem = item
			item:makeInvisible()
		end
	end		

-- ****************************************************************************
	
	function Ob:passInventoryToPsack()
		local index,value
		local Item
		if ( self.HeldItem ) then
			Item = FindScriptObject(self.HeldItem)
		end
		index = next(self.Inventory,nil)
		while(index ~= nil) do
			local indexedItem = FindScriptObject(index)
			if ( (Item == nil or
				 Item.Name ~= index) and
				 (indexedItem ~= nil) and
				 (indexedItem.bIsWornByPlayer ~= 1) ) then
				 SetEntityVisible(indexedItem,0)
				PassItemToPsack(index, indexedItem.bInventoryStack or 0);
			end
			index = next(self.Inventory,index);
		end
		if ( Item ) then
			PassItemToPsack(Item.Name, Item.bInventoryStack or 0)
		end
		if self.paintingCostumeItem and self.paintingCostumeItem ~= Item then
			PassItemToPsack(self.paintingCostumeItem.Name, 0)
		end
		if self.clawCostumeItem and self.clawCostumeItem ~= Item then
			PassItemToPsack(self.clawCostumeItem.Name, 0)
		end
		if self.jacketCostumeItem and self.jacketCostumeItem ~= Item then
			PassItemToPsack(self.jacketCostumeItem.Name, 0)
		end
	end

-- ****************************************************************************

	function Ob:fillPsiJar(powerName)
		if ( self.HeldItem ) then
			local Item = FindScriptObject(self.HeldItem)
			if ( powerName == nil ) then
				GamePrint('fillPsiJar got a nil powerName')
			end
			if ( Item.loadedPower == '' ) then 
				GamePrint('Filling PsiJar ('..Item.Name..') with power '..powerName)
				Item:fill(powerName)
			else
				GamePrint('Trying to fill psi jar that already has ' .. Item.loadedPower)
			end
		end
	end

-- interrupted work on throw anim
--	function Ob:throw()
--		Global.player:setNewAction('Do Nothing')
--		LoadAnim(Global.player, 'Anims/DartNew/Throw.jan', 0.1, 0)
--	end

-- Health and Damage
-- ****************************************************************************

    -- send this message to Raz if you want him to not take damage because he's in a cutscene
    function Ob:onStartNoDamageScene()
        self.inNoDamageScene = TRUE
    end

-- ****************************************************************************

    -- send this message to Raz if you're done with the above scene
    function Ob:onEndNoDamageScene()
        self.inNoDamageScene = FALSE
    end

-- ****************************************************************************

    function Ob:addHealth(amount)

        AdjustPlayerMood(amount)

    end

-- ****************************************************************************

    function Ob:subtractHealth(amount)

        AdjustPlayerMood(0-(amount))
        self:setState('checkStats')

    end

-- ****************************************************************************
-- Physics
-- ****************************************************************************

	-- Pass <= 0 to revert to default
	function Ob:setHeight(h)
		-- adjust height by lowering head.
		-- head isn't allowed to go below the floor, so raz's minimum height
		-- is defined by his body sphere
		if h <= 0 then
			-- default
			h = kfRAZ_HEIGHT
		end
		local head_y = max(kfRAZ_HEAD_RADIUS, h - kfRAZ_HEAD_RADIUS)
		SetEntityCollideSphere(self, kfRAZ_HEAD_RADIUS, 0,head_y,0, 1)
	end

	-- Semi-automatically generated by PLD
	function Ob:setPhysicsConstants()
		local spc = function(a,b) SetPhysicsConstant(nil,a,b) end
		spc(PHYSICS_RailGravity,     -2000 )
		spc(PHYSICS_GRAVITY,         -2700 )
		spc(PHYSICS_BUBBLEGRAVITY,	 -2900 )
		spc(PHYSICS_TRAPEZEGRAVITY,  -2000 )

		spc(PHYSICS_RailAccel,         600 )

		spc(PHYSICS_LoseBallSpeed,     750 )
		spc(PHYSICS_BubbleMaxUserSpeed, 1000 )
		spc(PHYSICS_BubbleTerminalSpeed, 6000 )
		spc(PHYSICS_BubbleTerminalDecel, 3000 )
		spc(PHYSICS_BubbleAccel, 	  3300 )
		spc(PHYSICS_BubbleBrake, 	   800 )
		spc(PHYSICS_BubbleBrakePoint,  800 )
		spc(PHYSICS_BubbleTurnSpeed,   200 )

		-- these are turning rates, in degrees/sec
		spc(PHYSICS_SteerSpeed,       1000 )
		spc(PHYSICS_AirSteerSpeed,     800 )

		spc(PHYSICS_GroundSlideAccel,  100 )
		spc(PHYSICS_GroundWalkAccel,  6000 )
		spc(PHYSICS_GroundBrakeAccel, 6000 )

		spc(PHYSICS_FRICTION,		 10000 )
		spc(PHYSICS_AIRENGLISH,	      2000 )
		spc(PHYSICS_MAXENGLISHSPEED,   550 )
		spc(PHYSICS_HARDLANDVEL,		1800)
		spc(PHYSICS_TUMBLELANDVEL,		500)
		spc(PHYSICS_RUNJUMPUPVEL,		0)
		spc(PHYSICS_RUNJUMPFWDVEL,		500)
		spc(PHYSICS_WALKABLESLOPE,		0.7)
		spc(PHYSICS_AIRDRAG,			500)

		spc(PHYSICS_JUMPLOCKTIME,       0.3)
		spc(PHYSICS_HANGLOCKTIME,       0.5)
		spc(PHYSICS_FALLJUMPTIME,	    0.1 )
		spc(PHYSICS_FALLHANGTIME,       0.15)

		-- sliding down slippery surfaces
		spc(PHYSICS_SlideSteerFriction, 2.5)
		spc(PHYSICS_SlideSteerSpeed,    300)
		spc(PHYSICS_SlideAutoTurn,      6.0)
		spc(PHYSICS_SlideTerminalVelocity, 1500)

		spc(PHYSICS_BUBBLEFRICTION,		500)
		spc(PHYSICS_BUBBLEAIRENGLISH,	2000)
		spc(PHYSICS_BUBBLEAIRDRAG_V,	2.0)
		spc(PHYSICS_BUBBLEAIRDRAG_H,	1.5)
		spc(PHYSICS_BUBBLEDESIREDSPEED_V,-400)
		spc(PHYSICS_BUBBLEJUMPVEL,		600)
		spc(PHYSICS_TRAPEZEGRAVITY,		-2900)
		spc(PHYSICS_TRAPEZEFRICTION,	0.1)
		spc(PHYSICS_TRAPEZEKICK,		10.0)
		spc(PHYSICS_PSIBLASTKICK,		500)
		spc(PHYSICS_PSIBLASTSPEED,		4000)
		spc(PHYSICS_PSIBLASTDELTAY,		100)
		spc(PHYSICS_PSIBLASTMAXY,		50)
		spc(PHYSICS_XBOX_CREEP,		    0.01) -- do NOT set this to 0
		spc(PHYSICS_XBOX_WALK,			0.45)
		spc(PHYSICS_XBOX_RUN,			0.86)
		spc(PHYSICS_TIGHTROPEINITTIME,	5000)
		spc(PHYSICS_TIGHTROPEFALLOFFTIME,	1000)
		spc(PHYSICS_TIGHTROPEGUSTINTERVAL,	5000)
		spc(PHYSICS_TIGHTROPEGUSTSTRENGTH,	0.3)
		spc(PHYSICS_TIGHTROPEBALANCECONST,	0.1)
		spc(PHYSICS_TIGHTROPEINSTABILITYCONST,	0.01)
		spc(PHYSICS_WATERTURNSPEED,	3.0)
		spc(PHYSICS_WATERTURNDECAY,	0.4)
		spc(PHYSICS_WATERTHRUST,	1000)
		spc(PHYSICS_WATERDENSITY,	1000)
		spc(PHYSICS_RAIL_ACCEL,		1500)
		spc(PHYSICS_RAIL_MAXSPEED,	2000)
		spc(PHYSICS_RailTransferSpeed, 500.0)

		-- testing
		spc(PHYSICS_WATERDRAG,		1.0)
		spc(PHYSICS_WATERMAXSPEED,	1000)

		spc(PHYSICS_WATERDRAG,		0.1)
		spc(PHYSICS_WATERMAXSPEED,	10000)

		-- tuning
		spc(PHYSICS_RailGravity,     -2000 )
	end

-- ****************************************************************************

-- ****************************************************************************
-- Other functions
-- ****************************************************************************
	function Ob:IsStanding()
		local action = GetActionState(self)
		if (action == 'Stand' or action == 'Idle General') then
			return 1
		else
			return 0
		end
	end

	function Ob:SetLookThing(target)
		local x,y,z = self:getPosition()
		local dx,dy,dz = target:getPosition()
		local rx,ry,rz = self:getOrientation()
		ry = AlignY(x,z,dx,dz) + 180
		self:setOrientation(rx,ry,rz)
	end

	function Ob:beginStatePsiActivate()
		if self.HeldItem then
			self:setState(nil)
		end
	end

	function Ob:statePsiActivate()
		LoadPriorityAnim(self,'Anims/DartNew/PsiGrab_armJARt_1.jan',2,0.3,1)
		-- this bool is kept around to see if we actually need to unload the pri anims.
		-- if we never get into this state-- like if beginState aborts the transition, or if
		-- something else prevents this, don't need to unload in endState.
		self.bLoadedPsiActivatePriAnims = 1
		self:sleep(.2)
		LoadPriorityAnim(self,'Anims/DartNew/PsiGrab_armJALf_1.jan',1,0.3,1)
		self:sleep(.3)
		UnLoadPriorityAnim(self,1,0.3)
		self:sleep(.2)
		UnLoadPriorityAnim(self,2,0.3)
		self:setState(nil)
	end

	function Ob:endStatePsiActivate()
		if self.bLoadedPsiActivatePriAnims == 1 then
			self.bLoadedPsiActivatePriAnims = 0
			UnLoadPriorityAnim(self,1,0.3)
			UnLoadPriorityAnim(self,2,0.3)
		end
	end

-- ****************************************************************************
	
	function Ob:onActivateConfusion(data,target)
		--check state, AMMO
		if (self.bBrainMode == 1) then
			return
		end
		
		if (not self.state_name and self.stats.confusionAmmo ~= 0) then
			self.lastConfusionActivation = GetGameTimeSecs()
			if (self.rankPowerManager.bInfiniteAmmo ~= 1) then
				self.stats.confusionAmmo = self.stats.confusionAmmo - 1
			end
			PausePlayerControls(1)
			SetVelocity(self, 0,0,0)
			self:doNothing()
			self:setState('ThrowConfusionGrenade')
		end
	end

	function Ob:stateThrowConfusionGrenade()
		self.confusionGrenade = self.confusionGrenadePool:get()
		self.confusionGrenade:ready()
		self:loadAnim('Anims/DartNew/ConfusionBomb.jan', 0.1, 0)
		
		local completion = self:getAnimCompletion('ConfusionBomb.jan', 0)
		while (completion and completion < 0.15) do 
            Yield() 
			completion = self:getAnimCompletion('ConfusionBomb.jan', 0)
		end
        self.confusionGrenade:startFuse()
		
		--launch bomb
		while (completion and completion < 0.514) do 
            Yield() 
			completion = self:getAnimCompletion('ConfusionBomb.jan', 0)
		end
		local lookTarg, bisZLocked = GetLookTarget(self)
		self.confusionGrenade:throw(lookTarg)
		self.confusionGrenade = nil
				
		while (completion and completion < 0.773) do 
            Yield() 
			completion = self:getAnimCompletion('ConfusionBomb.jan', 0)
		end
		self:setState(nil)
	end
	
	function Ob:endStateThrowConfusionGrenade()
		PausePlayerControls(0)
		self:goToDefaultState()
		self.confusionGrenade = nil
	end

-- ****************************************************************************

	function Ob:throw(item)		
		if self.bDartIsDying == 1 then 
			if (self.rItemToThrow) then			
				self:sendMessage(self.rItemToThrow, 'Thrown', '')
				self.bItemToThrownSentMessage = 0
			end
			return 
		end
		PausePlayerControls(1)
		SetVelocity(self, 0,0,0)
		self:doNothing()
		self.rItemToThrow = item
		self:setState('Throw')
	end

	function Ob:stateThrow()
		UnLoadPriorityAnim(self, 1, 0.2)
		LoadAnim(Global.player, 'Anims/DartNew/Throw.jan', .1, 0)
		local completion = self:getAnimCompletion('Throw.jan', 0)
		while (completion and completion < 0.24) do 
            Yield() 
			completion = self:getAnimCompletion('Throw.jan', 0)
		end
		-- send the thrown message
		if (self.rItemToThrow) then
			self:sendMessage(self.rItemToThrow, 'Thrown', '')
			self.bItemToThrownSentMessage = 1
		end
		
		completion = self:getAnimCompletion('Throw.jan', 0)
		while (completion and completion < 1) do 
            Yield() 
			completion = self:getAnimCompletion('Throw.jan', 0)
		end
		self:setState(nil)
	end

	function Ob:endStateThrow()
		PausePlayerControls(0)
		self:goToDefaultState()
		if (self.bItemToThrownSentMessage ~= 1) then
			if (self.rItemToThrow) then			
				self:sendMessage(self.rItemToThrow, 'Thrown', '')
				self.bItemToThrownSentMessage = 0
			end
		end
		self.bItemToThrownSentMessage = 0
		self.rItemToThrow = nil
	end

-- ***************************************************************************

	function Ob:facePlant()
		PausePlayerControls(1)
		SetVelocity(self, 0,0,0)
		self:doNothing()
		self:setState('FacePlant')
	end

	function Ob:stateFacePlant()
		LoadAnim(Global.player, 'Anims/DartNew/FacePlant.jan', .1, 0)
		
		local completion = self:getAnimCompletion('FacePlant.jan', 0)
		while (completion and completion < 1) do 
            Yield() 
			completion = self:getAnimCompletion('FacePlant.jan', 0)
		end
		self:setState(nil)
	end

	function Ob:endStateFacePlant()
		PausePlayerControls(0)
		self:goToDefaultState()
	end

-- ***************************************************************************
	function Ob:runKickedOutOfMindScene(target)
		local targetLSO = FindScriptObject(target)
--		if (targetLSO ~= nil) then
		if (1) then
			Global.levelScript.cutsceneScript.exitTheMindTarget = nil
--			Global.levelScript.cutsceneScript.exitTheMindTarget = targetLSO
			self:setState('KickedOutOfMind')
		end
	end

	function Ob:stateKickedOutOfMind()
		Global.levelScript.cutsceneScript:runCutscene('KickedOutOfMind', 1)
		self:setState(nil)
	end

-- ***************************************************************************

	function Ob:knockPlayerOffRail(direction)
		if self.bDartIsDying == 1 then return end

		-- direction: -1 is right, 1 is left
		self.iKnockOffRailDir = direction
		self:interruptPowers(1)
		--PausePlayerControls(1)
		self:dontRunPlayerControls(1)
		SetVelocity(self, 0, 0, 0)
		self:doNothing()
		self:setState('Stand')
		self:sayRandomOuchLines()		
		self:setState('KnockedOffRail')
	end

	function Ob:stateKnockedOffRail()
		
		local dir
		if (self.iKnockOffRailDir == 1 or self.iKnockOffRailDir == -1) then
			dir = self.iKnockOffRailDir
		else
			dir = RandInt(1, 0)
			if (dir == 0) then dir = -1 end
		end
		local ux, uy, uz = GetEntityOrientationVector(self, dir,0,0)
		local x, y, z = self:getPosition()
		local pitch, yaw, roll = VectorToEuler(ux, uy, uz)
		LaunchEntity(self,x,y,z,pitch,yaw,roll,1000)

		LoadAnim(Global.player, 'Anims/DartNew/RailObstacleCrash.jan', .1, 0)
		local completion = self:getAnimCompletion('RailObstacleCrash.jan', 0)
		while (completion and completion < 1) do 
            Yield() 
			completion = self:getAnimCompletion('RailObstacleCrash.jan', 0)
		end
		self:setState(nil)
	end

	function Ob:endStateKnockedOffRail()
		self:dontRunPlayerControls(0)
		self:goToDefaultState()
	end	

-- ****************************************************************************

	function Ob:tkPickupItem(item, bInterpToHand)
		if (Global.cutsceneScript.cutscenePlaying ~= 1) then
			PausePlayerControls(1)
			self:interruptPowers(1)	
		end
		
		SetVelocity(self, 0,0,0)
		self:doNothing()
		LoadAnim(self, 'Anims/DartNew/standstill.jan', .1, 0)
		if (item and item.TK_INTERP_TO_PLAYER_TIME) then
			self.tkPickupItemWaitTime = item.TK_INTERP_TO_PLAYER_TIME
		else
			-- default, just in case
			self.tkPickupItemWaitTime = 0.5
		end
		self.tkPickupItem = item
		self:sendMessage(item, 'TKPickupStart')
		if bInterpToHand == 1 then
			MovementUtils:interpolateToEnt(item, self, 'handJALf_2', self.tkPickupItemWaitTime*2/3, 0, 1, 1, nil)
		end
		self:setState('WaitForTKItem')

	end

	function Ob:stateWaitForTKItem()
		LoadAnim(self, 'Anims/DartNew/psigrab_armjalf_1.jan', .1, 1)
		self:sleep(self.tkPickupItemWaitTime)
		self:setState(nil)
	end

	function Ob:endStateWaitForTKItem()
		self:sendMessage(self.tkPickupItem, 'TKPickupEnd')
		self.tkPickupItem = nil

		if (Global.cutsceneScript.cutscenePlaying ~= 1) then
			PausePlayerControls(0)
			self:goToDefaultState()
		end
	end

-- ****************************************************************************

	function Ob:playLoopingAnimOnPlayer(anim, duration, dirOverride)
		PausePlayerControls(1)
		self:interruptPowers(1)	
		SetVelocity(self, 0,0,0)
		self:doNothing()
		self.loopingAnim = anim
		self.loopingAnimDuration = duration
		self.loopingAnimDirOverride = dirOverride
		self:setState('PlayLoopingAnim')
	end

	Ob.TIMER_LOOPING_ANIM = '1007'

	function Ob:statePlayLoopingAnim()
		self.bLoopingAnimDone = 0
		if (self.loopingAnim and self.loopingAnimDuration) then
			local dir = self.loopingAnimDirOverride or 'Anims/DartNew'
			LoadAnim(self, dir..'/'..self.loopingAnim, 0.2, 1)
			self:createTimer(self.loopingAnimDuration * 1000, self.TIMER_LOOPING_ANIM)
			local animName = strlower(self.loopingAnim)
			-- to take care of the blend time
			self:sleep(0.2)
			while (1) do				
				if (self.bLoopingAnimDone == 1) then
					break
				end
				Yield()
				if (GetCurrentAnimName(Global.player) ~= animName) then
					break
				end
			end
		end
		self:setState(nil)		
	end

	function Ob:endStatePlayLoopingAnim()
		PausePlayerControls(0)
		self:goToDefaultState()
		self.loopingAnim = nil
		self.loopingAnimDuration = nil
		self.loopingAnimDirOverride = nil
	end	

-- ****************************************************************************

	function Ob:playAnimOnPlayer(anim, dirOverride)
		PausePlayerControls(1)
		SetVelocity(self, 0,0,0)
		self:doNothing()
		self.playAnimDirOverride = dirOverride
		self.animToPlay = anim
		self:setState('PlayAnim')
	end

	function Ob:statePlayAnim()
		if (self.animToPlay) then
			local dir = self.playAnimDirOverride or 'Anims/DartNew'
			LoadAnim(Global.player, dir..'/'..self.animToPlay, .2, 0)
			local completion = self:getAnimCompletion(self.animToPlay, 0)
			while (completion and completion < 1) do 
                Yield() 
				completion = self:getAnimCompletion(self.animToPlay, 0)
			end
		end
		self:setState(nil)
	end

	function Ob:endStatePlayAnim()
		PausePlayerControls(0)
		self:goToDefaultState()
		self.animToPlay = nil
		self.playAnimDirOverride = nil
	end
	

-- ****************************************************************************
-- SOUND EVENT HANDLERS
-- ****************************************************************************

	-- musicstate is 0,1,2
	function Ob:onSetMusicState(musicstate)
		if (Global.levelScript and Global.levelScript.bPlayerMovementMusicMood == 1) then
			Global.levelScript:setMusicMood(musicstate)
		end
	end

	function Ob:TMP_onFootFallBubble()
		PlaySound(nil,self.stepOnTB,0,0)
		if ( self.Razilla == 1) then
			CameraStartShakePeriodic(0.25, 0, 0, 0, 1, 0, 60)
		end
	end

	-- event is 'left' or 'right'
	function Ob:onFootFallBallCreep(event)
		self:TMP_onFootFallBubble()
	end
	function Ob:onFootFallBallWalk(event)
		self:TMP_onFootFallBubble()
	end
	function Ob:onFootFallBallRun(event)
		self:TMP_onFootFallBubble()
	end

	-- BASIC MOVES
	function Ob:onFootFallCreep(event)
		if self.bBrainMode == 1 then
			return
		end
		if Global.levelScript.leftFootPaintTexture then
			self:processPaint(event, 'Creep')
		elseif Global.levelScript.bProcessFootfalls == 1 and Global.levelScript:footfall(event, 'Creep') == 1 then
			-- do nothing here; all done in footfall
		end
        	Global.levelScript:playFootSound(GetGroundMaterial(self))
	end

-- ***************************************************************************
	
	function Ob:onFootFallWalk(event)
		if self.bBrainMode == 1 then
			return
		end
		if Global.levelScript.leftFootPaintTexture then
			self:processPaint(event, 'Walk')
		elseif Global.levelScript.bProcessFootfalls == 1 and Global.levelScript:footfall(event, 'Walk') == 1 then
			-- do nothing here; all done in footfall
		end
		Global.levelScript:playFootSound(GetGroundMaterial(self))
	end

-- ***************************************************************************
	
	function Ob:onFootFallRun(event)
		if self.bBrainMode == 1 then
			return
		end
		if Global.levelScript.leftFootPaintTexture then
			self:processPaint(event, 'Run')
		elseif Global.levelScript.bProcessFootfalls == 1 and Global.levelScript:footfall(event, 'Run') == 1 then
			-- do nothing here; all done in footfall
		end
		local i = random(1,4)
		Global.levelScript:playFootSound(GetGroundMaterial(self))
	end

	function Ob:onLandSoft()
		if Global.levelScript.landSoft then
			Global.levelScript:landSoft()
		end
	end

	function Ob:onJumpSound()
		-- still saying a line
		if self.lastLine and IsSoundPlaying(self.lastLine) == 1 then
			-- don't play the sound
			return
		end
		if self.rJumpSoundHandle then
			self:playSound(self.rJumpSoundHandle, 0, 0, 1)
		end
	end

-- ***************************************************************************    

	function Ob:processPaint(foot, speed)
		if self.currTriggerSurfaceIDNum == 1 then
			--Actually, accuracy didn't look good here.  It feels like both his feet should get wet.
			--self.paintLevel[foot] = self.paintLevel[foot] + .7
			--if self.paintLevel[foot] > self.maxPaintLevel then self.paintLevel[foot] = self.maxPaintLevel end
			self.paintLevel['left'] = self.paintLevel['left'] + .7
			if self.paintLevel['left'] > self.maxPaintLevel then self.paintLevel['left'] = self.maxPaintLevel end
			self.paintLevel['right'] = self.paintLevel['right'] + .7
			if self.paintLevel['right'] > self.maxPaintLevel then self.paintLevel['right'] = self.maxPaintLevel end
		elseif self.prevTriggerSurfaceIDNum == 1 then
			self:leavePaint(foot, speed)
		end
	end
	
	function Ob:leavePaint(foot, speed)
		self.paintLevel[foot] = self.paintLevel[foot] - 0.1
		if self.paintLevel[foot] <= 0 then 
			self.paintLevel[foot] = 0 
			return
		end
		local x, y, z = self:getPosition()
		local fx, fy, fz = GetEntityForwardVector(self)
		local rx, ry, rz = CrossProduct(fx, fy, fz, 0, 1, 0, 1)
		if foot == 'left' then 
			rx = -rx ry = -ry rz = -rz 
			if speed == 'Creep' then
				-- left foot is crooked during creep.
				fx, fy, fz = RotateVector(0, 25, 0, fx, fy, fz)
			end
		end
		local x, y, z, fx, fy, fz = self:getFootPos(((foot == 'left') and 1) or 0, speed)
		local ux, uy, uz = GetEntityUp(self)
		AttachDecal((foot == 'left' and Global.levelScript.leftFootPaintTexture) or Global.levelScript.rightFootPaintTexture, 10, x+100*ux, y+100*uy, z+100*uz, 0, -1, 0, 32, 32, 
			fx, fy, fz, self.paintLevel[foot], 1, 1, 1, 0, 1)
	end

	
       --[[@ getFootPos(bLeftFoot)
	 	Get the position and orientation of the specified foot, for leaving footprints.
	Args
		bLeftFoot: 1 if you want left foot position
	Returns
		x, y, z, pitch, yaw, roll
	]]--
	function Ob:getFootPos(bLeftFoot, speed)
   		local x, y, z = self:getPosition()
   		local fx, fy, fz = GetEntityForwardVector(self)
   		local rx, ry, rz = CrossProduct(fx, fy, fz, 0, 1, 0, 1)
		if bLeftFoot == 1 then
   			rx = -rx ry = -ry rz = -rz 
   			if speed == 'Creep' then
   				-- left foot is crooked during creep.
   				fx, fy, fz = RotateVector(0, 25, 0, fx, fy, fz)
   			end
   		end
   		x = x+rx*10
   		z = z+rz*10
   		x = x+fx*10
   		z = z+fz*10
		return x, y, z, -fx, -fy, -fz
   	end
      
-- ***************************************************************************    
    
	-- **********************************************************************
	-- Action and animation Callbacks
	-- **********************************************************************
	
	-- LADDER

	-- Action table callback
	-- Called on entry/exit from state "Ladder Down"
	function Ob:onLadderDown(bStart)
		local ladder,fTopDist,fBottomDist = PlayerGetLadderLSO(self)
		if ladder and ladder.onLadderDown then
			ladder:onLadderDown(bStart)
		else
			-- default
			if bStart==1 then
				PlaySound(nil,self.ladderSlide,0,0)
			else
				StopSound(self.ladderSlide)
			end
		end
	end

	-- Action table callback
	-- Called on entry/exit from state "Ladder Up"
	function Ob:onLadderUp(bStart)
		local ladder,fTopDist,fBottomDist = PlayerGetLadderLSO(self)
		if ladder and ladder.onLadderUp then
			ladder:onLadderUp(bStart)
		end
	end

	-- Animation callback
	-- Called every time his right foot steps on ladder
	function Ob:onLadderStep(event)
		local ladder,fTopDist,fBottomDist = PlayerGetLadderLSO(self)
		if ladder and ladder.onLadderStep then
			ladder:onLadderStep(event)
		else
			local i = random(1,4)
			PlaySound(nil,self.stepLadder[i],0,0)
		end
	end

	function Ob:onTightropeStep(evt)
		if TightropeAddVel then
			local vy = -200
			local vx = -70
			if evt == 'R' then vx = -vx end
			TightropeAddVel(vx, vy)
		end
		self:onAnimSound('TightropeFS')
	end
	function Ob:onTightropeLand(evt)
		TightropeAddVel(0, -300)
		self:onAnimSound('TightropeFS')
	end

	--Dismounts Raz off a ladder.  Raz should be positioned almost as high up on the ladder as possible
	--bBlock (default 0) will decide if this call blocks.  if not, it will change Raz's state
	function Ob:fakeLadderDismount(bBlock)
		--If we shouldn't block then call this with a state
		if (not bBlock) or (bBlock == 0) then
			self:callWithState(self.fakeLadderDismount, self, 1)
			return
		end
	
		--Play dismount and wait for detach from ladder
		LoadAnim(self, 'Anims/DartNew/LadderDismount.jan', 0.0, 0)
		while (GetControlHandler() == kCONTROL_LADDER) do
			Yield()
		end

		--Wait for raz to get up to the top
		for i = 1, 4, 1 do
			Yield()
		end

		--Apply a little forward and up velocity
		local vx, vy, vz = GetEntityForwardVector(self)
		vx, vy, vz = vx * 500, 0, vz * 500
		ApplyVelocity(self, vx, vy, vz)
	end
-- ***************************************************************************
	
	-- Animation callback
	-- This is a generic callback.  The sound to play is specified by the event.
	function Ob:onAnimSound(cue_name)
		local var = format("hSound%s", cue_name)
		if not self[var] then
			self[var] = LoadSound(cue_name)
			if self[var]==0 then
				GamePrint(TT_Warning, "Failed to load animation sound " .. cue_name)
			end
		end
		PlaySound(nil, self[var], 0,0)
	end
	
-- ***************************************************************************
	
--[[	function Ob:onActivateConfusion(data, target)
		self:triggerConfusionFX(target, 1)
	end
	function Ob:onNotConfused(data, target)
		self:triggerConfusionFX(target, 0)
	end

	function Ob:triggerConfusionFX(target, bOn)
		if (bOn == 1) then
			if target then
				if self.rConfusionFX then
					self.rConfusionFX:shootAt(target)
				end
			end
		else
			if self.rConfusionFX then
				self.rConfusionFX:stop()
			end			
		end
	end
]]--

	function Ob:resetPowerActivationTimes()
		self.lastInvisibilityActivation = -200
		self.lastShieldActivation = -200
		self.lastFirestartingActivation = -200
		self.lastConfusionActivation = -200
	end
		
-- ***************************************************************************	
	
	-- TELEKINESIS
	function Ob:onTelekinesisPunchBalloon(event)
		--GamePrint('Handling event onTelekinesisPunchBalloon ' .. event)
		TelekinesisPunchBalloon()
	end

-- ***************************************************************************	
	function Ob:onTelekinesisOpenClaw(event)
		--GamePrint('Handling event onTelekinesisPunchBalloon ' .. event)
		TelekinesisOpenClaw()
	end
	
-- ***************************************************************************	
	function Ob:onTelekinesisHideBubble(event)
		--GamePrint('Handling event onTelekinesisPunchBalloon ' .. event)
		TelekinesisHideBubble()
	end
	
-- ***************************************************************************	
	
	-- INVISIBILITY
	function Ob:onInvisibilityHopThroughLasso(event)
		self.bInvisOn = 1
		if (GetDartInvisibility() == 0) then
			PlaySound(nil,self.invisibleFlourishSnd,0,0)
		end
		PlaySound(nil,self.invisibleActionSnd,0,0)
		self.rInvisibilityFX:stop(1)
		self.rInvisibilityFX:attachEmitters()
		self.rInvisibilityFX:run()
		
		self.rInvisibilityShockwaveFX:attach(self, 'rootJ_1', 1)
		
		InvisibilityHopThroughLasso()
		self:callSpamListeners('Invisibility', 1)
		local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		if( 1 == self.bClairOn ) then
			self:setClairDisguise( nil, nil )
		end
		if (item) then
			if self.lastInvisedItem and IsDead(self.lastInvisedItem) ~= 1 then
				self.lastInvisedItem:setInvisibility(0)
			end
			item:setInvisibility(1)
			self.lastInvisedItem = item
		end
	end

	function Ob:onInvisibilityActivation(data,from)
		self.rInvisibilityFX:attachEmitters()
		self.rInvisibilityFX:run()
		SetPlayerInvisibility(1.0)

	end

	function Ob:onInvisibilityEnded(data,from)
		self.bInvisOn = nil
		self:callSpamListeners('Invisibility', 0)
		self.rInvisibilityFX:stop(1,0,0,34.75/35.0)
		
		local item = self.HeldItem and FindScriptObject(self.HeldItem, 1)
		if( 1 == self.bClairOn ) then
			self:setClairDisguise( self.lastClairTarget, FindScriptObject(self.HeldItem) )
		elseif self.lastInvisedItem and IsDead(self.lastInvisedItem) ~= 1 then
			self.lastInvisedItem:setInvisibility(0)
			self.lastInvisedItem = nil
		end
	end

-- ***************************************************************************	
	
	-- SHIELD
	function Ob:onShieldActivate(data,from)
		if ( self.rPsiShield and self.rPsiShield.Activate ) then
			local activateTarget = GetLookTarget(self)
			if ( activateTarget and self.bBrainMode == 1) then
				self.rPsiShield:Activate(activateTarget)
			else
				self.rPsiShield:Activate(self)
			end

			-- This is the activate-then-wait version
			--self.lastShieldActivation = GetGameTimeSecs()

			-- This is the activate-whenever-energy-is-nonzero version
			local duration = GetGameTimeSecs() - self.lastShieldActivation
			if ( duration < self.PsiShieldDuration ) then
				self.lastShieldActivation = GetGameTimeSecs() - ((1.0 - duration / self.PsiShieldDuration) * self.PsiShieldDuration)
			else
				self.lastShieldActivation = GetGameTimeSecs()
			end
			self:setHeight(self.PsiShieldHeight)
		end
	end

	function Ob:onShieldDeactivate(data)
		if ( self.rPsiShield and self.rPsiShield.Deactivate ) then
			self.rPsiShield:Deactivate(self)
			local duration = GetGameTimeSecs() - self.lastShieldActivation
			if ( duration < self.PsiShieldDuration ) then
				self.lastShieldActivation = GetGameTimeSecs() - ((1.0 - duration / self.PsiShieldDuration) * self.PsiShieldDuration)
			else
				self.lastShieldActivation = GetGameTimeSecs() + self.PsiShieldCoolDown
				self:sendMessage(self, 'PowerFailed', kPOWER_SHIELD)
			end
			-- start the timer to say that the shield is ready again
			self:createTimer(duration * 1000, self.TIMER_SHIELD_COOLDOWN)
			self:setHeight(0)
		end
	end

	function Ob:onShieldReady()
		if not self.rShieldReadySoundHandle then
			self.rShieldReadySoundHandle = LoadSound('ShieldReady')
		end
		self:playSound(self.rShieldReadySoundHandle, 0, 0, 1)
	end

	function Ob:onShieldActivateFailed()
		local x, y, z = self:getPosition()
		self.rPsiShieldFailedFX:setPosition(x, y+70, z)
		self.rPsiShieldFailedFX:run()
	end
	
-- ***************************************************************************	
	
	-- FIRESTARTING
	function Ob:onFirestartingTargetReady(data, from)
		if self:getActionState() == 'Firestarting' then --or data == 'detonate' then
			self.firestartingTarget = self:getLookTarget()
			if not self.firestartingTarget then
				-- Something else has killed it!
				InterruptPowers()
			else
				self.firestartingTarget.heat = self.firestartingTarget.firestartResistance
				--self.bDetonateNextFS = ((data == 'detonate') and 1) or 0
				self:setNewAction('Firestarting End')
				--if self.bDetonateNextFS == 1 then
				if self:canDetonate() == 1 then
					local detonateProjectile = Global.levelScript:getPool('Global.Effects.FireStartSuperFX'):get()
					detonateProjectile:runThenPool(self)
					MovementUtils:interpolateToEnt(detonateProjectile, self.firestartingTarget, nil, .35)
					FirestartingDetonated()
				end
			end
		end
	end
	
	function Ob:onFireSlam(data)  
		if self.firestartingTarget then
			self.firestartingTarget.heat = self.firestartingTarget.firestartResistance
			--self:reminder('PKDetonate')
			self:sendMessage(self.firestartingTarget, 'FireEnd')
			self.lastFirestartingActivation = GetGameTimeSecs()
			if (self:canDetonate() == 1) and (self.firestartingTarget.bDisallowDetonation ~= 1) then
				local x, y, z = self.firestartingTarget:getPosition()
				Global.levelScript:getPool('Global.Effects.FireStartExplodeSuperFX'):get():runThenPool(self.firestartingTarget)
				ForEachEntityInRadius(x, y, z, self.FS_DETONATE_RANGE, self.detonationCallback)
				if (type(self.firestartingTarget.takeFireDamage) == 'function') then
					self.firestartingTarget:takeFireDamage(1)
				end
			else
				FirestartingIgnited() -- detonate calls FirestartingDetonated earlier
			end
			self.firestartingTarget = nil
			self:playSound('FirestartingMED')
		end
	end

	-- Should not be Ob:detonationCallback.  We don't want the first arg to be Raz/self, we want the first arg to be the entity.
	-- Only for use with ForEachEntityInRadius (see above).
	function Ob.detonationCallback(ent)
		if ent ~= Global.player.firestartingTarget then
			tinsert(Global.player.detonatedEntities, ent)
		end
		if Global.player:isTimerInUse(Global.player.TIMER_DETONATE_ENTITIES_ACROSS_FRAMES) ~= 1 then
			Global.player:createTimer(40, Global.player.TIMER_DETONATE_ENTITIES_ACROSS_FRAMES)
		end
	end

	function Ob:detonateEntity(ent)
		if ent ~= Global.player and ent.firestartResistance > 0 then
			if not ent.heat then ent.heat = 0 end
			ent.heat = ent.heat + 1.2
			ent.bTrueFirestartingTarget = 1
			Global.player:sendMessage(ent, 'FireEnd', 'detonate')
		end
	end

	-- For enhanced firestarting.
	-- This used to track whether or not you could hit melee to turn PK into detonate.
	-- Now, it just says if Raz has detonation, because it always activates instead of PK.
	function Ob:canDetonate()
		return self.rankPowerManager.bPKDetonate
	--[[
		if self.rankPowerManager.bPKDetonate ~= 1 then
			if bDebug == 1 then GamePrint('detonation rejected because of no power') end
			return
		end
		local controlHandler = GetControlHandler()
		if controlHandler ~= kCONTROL_BUBBLE and controlHandler ~= kCONTROL_PLAYER then
			if bDebug == 1 then GamePrint('detonation rejected because of control handler '..controlHandler) end
			return
		end
		if target and target.firestartResistance and target.firestartResistance > 0 and (target.heat > target.firestartResistance*.66) and target.bOnFire ~= 1 then
			if bDebug == 1 then GamePrint('Detonate accepted!') end
			return 1
		end
		if target and target.firestartResistance and target.firestartResistance > 0 and bDebug == 1 then
			GamePrint('detonation rejected because of heat: '..target.heat..' and on fire '..(target.bOnFire or 'nil'))
		elseif bDebug == 1 then
			GamePrint('detonation rejected because of no FSable target.')
		end
		]]--
	end

	-- For enhanced firestarting.
	-- No longer necessary, with our new 'always detonate' solution.
	--[[
	function Ob:detonate(target)
		self:onFirestartingTargetReady('detonate')
	end
	]]--

	function Ob:setRailFXEnabled(bEnable)
		--GamePrint('railfxenable '..(bEnable or 'nil'))
		if bEnable == 1 then
			-- Begin excessive error checking.
			-- Exceptions would be useful here, as much as I hated them when I was using Java.
			local rail = GetPlayerActionItem()
			if not rail then
				GamePrint('ERROR: can\'t start rail FX without a rail.')
				return
			end
			if not rail.effects then
				DebugPrint('ERROR: rail has no effects.', rail)
				return
			end
			if self.railFX then
				-- Whoops, this is apparently a totally normal case.  It sends enable a bunch.
				-- So, just return unless the effect has changed.
				if strlower(self.railFX.Type) == strlower(rail.effects) then
					return
				else
					self.railFX:stop(1, nil, 1)
				end
				--GamePrint('WARNING: enabling rail FX, but some were already playing.  Stopping them.')
				--self.railFX:stop(1, nil, 1)
				return
			end
			self.railFX = Global.levelScript:getPool(rail.effects):get()
			if not self.railFX then
				DebugPrint('ERROR: rail is set to have effects that don\'t exist.', rail, rail.effects)
				return
			end
			-- End excessive error checking.
			self.railFX:attach(Global.player, nil, 1)
		else
			if self.railFX then
				self.railFX:stop(nil, nil, 1)
				self.railFX = nil
			else
				-- This is apparently a totally normal case, if Raz is jumping on the rail.
				--GamePrint('WARNING: attempting to stop rail FX, but no rail FX were playing.')
			end
		end
	end
	
	function Ob:killAllRazFX()
		self.rPsiShieldFailedFX:stop(1,0)
		self.lockHub:Deactivate()
	end

-- ***************************************************************************
-- *****  B A S I C  B R A I N I N G *****************************************	
-- ***************************************************************************

	-- onBasicBrainFail message is sent by Global.Characters.ActionActor when the 
	-- player tries to use basic braining on a character who cannot be basic brained 
	function Ob:onBasicBrainFail(data,from)
		if from then
			if not self.brainer then self.brainer = FindScriptObject('Brainer') end
			if self.brainer.bThrown ~= 1 then
				self.brainer.target = from
                self:setState('BrainFail')
			end
		end
	end
	
	function Ob:stateBrainFail()
		self.bUninterruptibleState = 1
		PausePlayerControls(1)
		self.brainer.bThrown = 1
        SetEntityCollideSphere(self.brainer, self.brainer.collSphereRadius, 0,self.brainer.collSphereRadius/2)
		DetachEntityFromParent(self.brainer)
		SetPhysicsFlag(self.brainer, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self.brainer, PHYSICS_COLLIDER, 1)
		SetPhysicsFlag(self.brainer, PHYSICS_APPLYGRAVITY, 1)
		local sx, sy, sz = GetJointWorldPos(self,'handJALf_2')
		local x,y,z = self.brainer.target:getHead(-30)
		local ux,uy,uz = GetEntityUp(self)
		local pitch, yaw = FindTrajectory(sx, sy, sz, x, y, z, 2000, 1, ux, uy, uz)
		SetEntityCollideIgnoreEntity(self.brainer, self, 1)
		UnLoadPriorityAnim(self,1,0.2)
		LoadAnim(Global.player, 'Anims/DartNew/Throw.jan', .1, 0)
		LaunchEntity(self.brainer, sx, sy, sz, pitch, yaw, 0, 2000, 1)
		local completion = self:getAnimCompletion('Anims/DartNew/Throw.jan', 0)
        while (completion and completion < 1) do 
			Yield() 
			completion = self:getAnimCompletion('Anims/DartNew/Throw.jan', 0)
		end
        LoadAnim(Global.player, 'Anims/DartNew/standstill.jan', .1, 0)
		PausePlayerControls(0)
		self.bUninterruptibleState = 0
		-- play the sound					
		self:playSound(self.rBrainerSound)
		if self.bBrainDoorDoneWaiting == 1 then
			self:setState('BrainDoorDone')
		else
			self:setState(nil)
		end
	end
	function Ob:endStateBrainFail()
		self.bBrainDoorDoneWaiting = 0
	end
	
	function Ob:onBrainDoorDone()
		if not self.brainer then self.brainer = FindScriptObject('Brainer') end
		SetPhysicsFlag(self.brainer, PHYSICS_COLLIDEE, 0)
		SetPhysicsFlag(self.brainer, PHYSICS_COLLIDER, 0)
		self.bBrainDoorDoneWaiting = 1	-- need this in case for some unknown reason onBrainDoorDone gets called before
										-- state "BrainFail" is finished.  Otherwise we will have problems.
		self:setState('BrainDoorDone')
	end
	
	function Ob:stateBrainDoorDone()
		self.bUninterruptibleState = 1
		LoadPriorityAnim(self,'Anims/DartNew/psigrab_armjalf_1.jan',1,0.2,1)
		local brainer = self.brainer
        local brainCallback = function(brainer)
				SetPhysicsFlag(brainer, PHYSICS_APPLYGRAVITY, 0)
				brainer.target = nil
				brainer.bThrown = 0
			end
			
        MovementUtils:interpolateToEnt(self.brainer, self, 'handJALf_2', 1, 0, 1, 0, brainCallback)
		while self.brainer.bThrown == 1 do
			Yield()
		end
		UnLoadPriorityAnim(self,1,0.5)
		LoadPriorityAnim(self,self.brainer.clutchAnim,1,0.2,1)
		LoadAnim(Global.player, 'Anims/DartNew/standstill.jan', .1, 0)
		AttachInventoryEntityToPlayer(brainer)
		
		self.bUninterruptibleState = 0
		self:setState(nil)
	end
	
	function Ob:endStateBrainDoorDone()
		self.bBrainDoorDoneWaiting = 0
	end
	
-- ***************************************************************************


	function Ob:onLookTargetChanged(new, from, old)
		self:killHint()
		if old then
			if type(old) == 'string' then
				if old == '' then			
					old = nil
				else
					-- if it's string find the object
					old = FindScriptObject(old, 1)
				end
			elseif type(old) == 'table' and isEntityAlive(old) ~= 1 then
				-- if it's a reference, if it's dead, set to nil
				old = nil
			end
		end
		if new then
			if type(new) == 'string' then
				if new == '' then			
					new = nil
				else
					-- if it's string find the object
					new = FindScriptObject(new)
				end
			end
			if type(new) == 'table' and IsDead(new) == 1 then
				-- if it's a reference, if it's dead, set to nil
				new = nil
			end
			if new then					
				local line = new:getProximityHint()
				if line then
					self:hint(line)
				end
				
				-- Add tracers
				if ( self.zLock == TRUE and self.bClairOn ~= 1 ) then
					self.lockHub:Activate(new)
				end
			else
				self.lockHub:Deactivate()
			end
		else
			self.lockHub:Deactivate()
		end
		-- go through all the proxhint stuff first
		-- send a message, calling directly to avoid one frame delay
		if (new and new.onLookTargetChanged) then
			new:onLookTargetChanged(new, from, old, 1)
		end
		-- send a message, calling directly to avoid one frame delay
		if (old and old.onLookTargetChanged) then
			old:onLookTargetChanged(new, from, old, 0)
		end		
	end

	function Ob:refreshProximityHint()
        self:onLookTargetChanged(self:getLookTarget())
	end

	function Ob:hint(hint)
		SetProximityHint(hint)
	end
	
	function Ob:killHint()
		SetProximityHint()
	end

	function Ob:myProximityHintChanged(from)
		if self:getLookTarget() == from then
			self:refreshProximityHint()
		end
	end

	function Ob:setZLock(bSet)
		self:callSpamListeners('setZLock', bSet)
		
		if ( bSet == TRUE and (self.zLock == nil or self.zLock == FALSE)) then
			local lookTarget = GetLookTarget(self)
			if ( lookTarget and self.bClairOn ~= 1 ) then
				self.lockHub:Activate(lookTarget)
			end
		elseif ( (bSet == FALSE or bSet == 0) and (self.zLock == TRUE) ) then
			self.lockHub:Deactivate()
		end
		if ( bSet == TRUE ) then -- The engine sends 0 as a false value, not nil
			self.zLock = TRUE
		else
			self.zLock = FALSE
		end
	end
	
-- ***************************************************************************
-- R A Z I L L A  H A N D L E R S

	function Ob:RazillaCrunch(jointName)		
            CameraStartShakePeriodic(0.25, 0, 0, 0, 2, 0, 60)
            -- play crunch sound
			if not self.rRazillaClimbSound then
				self.rRazillaClimbSound = LoadSound('ClimbBuilding')
			end
			self:playSound(self.rRazillaClimbSound)
            local sx , sy , sz = self:getBoneWorldPosition(jointName)
            local dx , dy , dz = GetEntityForwardVector(self)
            --AttachDecal('Textures/LevelTextures/LO_Lungfishopolis/LO_smash.tga', 10, sx, sy, sz, dx, dy, dz, 32 , 32 )
			local bHit, cx,cy,cz, nx,ny,nz, hitEntity = CheckForCollision(sx, sy, sz, sx+100*dx,sy+100*dy,sz+100*dz, 0,0,self)
			if ( bHit and hitEntity and hitEntity.DamageBuilding ) then
				hitEntity:DamageBuilding(cx, cy, cz, dx, dy, dz)
			end				
	end
	
-- ***************************************************************************
 
    function Ob:onRightHandUDRLClimb(event)
        if ( self.Razilla == 1) then
			self:RazillaCrunch('handJEndRt_2')
        else
			Global.levelScript:playUDRLClimbSound(GetWallMaterial())
		end
    end

-- ***************************************************************************
 
    function Ob:onLeftHandUDRLClimb(event)
        if ( self.Razilla == 1) then
			self:RazillaCrunch('handJEndLf_2')
        else
			Global.levelScript:playUDRLClimbSound(GetWallMaterial())
        end
    end
 
-- *************************************************************************** 
 
    function Ob:onRightFootUDRLClimb(event)
        if ( self.Razilla == 1) then
			self:RazillaCrunch('FootJEndRt_1')
        else
			Global.levelScript:playUDRLClimbSound(GetWallMaterial())
        end
    end
 
-- *************************************************************************** 
 
    function Ob:onLeftFootUDRLClimb(event)
        if ( self.Razilla == 1) then
			self:RazillaCrunch('FootJEndLf_1')
        else
			Global.levelScript:playUDRLClimbSound(GetWallMaterial())
        end
    end

-- ****************************************************************************

	function Ob:initializeHealthRegeneration()
		self:createTimer(5000, self.TIMER_HEALTH_REGENERATION)
	end
	
	function Ob:stopHealthRegeneration()
		self:killTimer(self.TIMER_HEALTH_REGENERATION)
	end
	
-- ****************************************************************************

	function Ob:onTimer(id)
		if (id == '1') then
			self:killTimer(id)
			-- clean up the damage flicker
			self:killTimer(self.TIMER_DAMAGE_FLICKER)
			self.flickerCount = nil
			self:damageFlicker(0, 0.2)
		elseif (id == '2') then
			self.saved.feltInvisible = 1
			self:sayLine("/GLRA078RA/",0,1)  --'Check it out! I'm invisible!'
			self:killTimer(id)
		elseif ( id == '90' ) then
			self.boost.psiblast = 0
			self:killTimer(90)
			GamePrint('Psi Blast boost terminated')
			-- Dave insert psiblast return to normal code here
		elseif ( id == '91' ) then
			self.boost.levitate = 0
			self:killTimer(91)
			GamePrint('Psi Blast boost terminated')
			-- Dave insert psiblast return to normal code here
		elseif ( id == '92' ) then
			self.boost.clairvoyance = 0
			self:killTimer(92)
			GamePrint('Psi Blast boost terminated')
			-- Dave insert psiblast return to normal code here
		elseif id == self.TIMER_DAMAGE_FLICKER then
			if not self.flickerCount then
				self.flickerCount = 1
				self.totalFlickerTime = 20
			end
			if self.totalFlickerTime > self.damageRecoveryTime then
				self:killTimer(id)
				self.flickerCount = nil
				self:damageFlicker(0, .2)
				return
			end
			self.flickerCount = self.flickerCount+1
			--local time = min(20+self.flickerCount*self.flickerCount/3, 300)
			local time = 30
			if self.totalFlickerTime > 1600 then
				time = 60
			elseif self.totalFlickerTime > 1100 then
				time = 50
			elseif self.totalFlickerTime > 700 then
				time = 40
			end
			self.totalFlickerTime = self.totalFlickerTime+time
			self:createTimer(time, id)
			time = time - 2
			if mod(self.flickerCount, 2) == 1 then
				self:damageFlicker(1, time)
			else
				self:damageFlicker(0, time)
			end
		elseif id == self.MELEE_BCOMBO_TIMER then
			self.bCanComboB = 0
			self.rCurAttack = self:getMeleeAnim('A')
			self:killTimer(self.MELEE_BCOMBO_TIMER)
		elseif id == self.MELEE_CCOMBO_TIMER then
			self.bCanComboC = 0
			self.rCurAttack = self:getMeleeAnim('A')
			self:killTimer(self.MELEE_CCOMBO_TIMER)
		elseif id == self.MELEE_WAIT_TIMER then
			local lastAttack
			if self.rCurAttack == self:getMeleeAnim('A') then
				lastAttack = self:getMeleeAnim('C') or self:getMeleeAnim('A')
			elseif self.rCurAttack == self:getMeleeAnim('B') then
				lastAttack = self:getMeleeAnim('A')
			else
				lastAttack = self:getMeleeAnim('B')
			end
			if (self.bCanComboB == 0 and self.bCanComboC == 0) then
				self:killTimer(self.MELEE_WAIT_TIMER)
			elseif not GetAnimCompletion(self, -1, lastAttack.fileName..'.jan') or GetAnimCompletion(self, -1, lastAttack.fileName..'.jan') >= self.rCurAttack.completion then
				self:killTimer(self.MELEE_WAIT_TIMER)
				if (self.bCanComboB == 1 or self.bCanComboC == 1) then
					self.bCanComboC = 0
					self.bCanComboB = 0
					local bTrack = ((GetControlHandler() == kCONTROL_BALL) and 1) or 0
					if self.rCurAttack.hand then self[self.rCurAttack.hand]:go('melee'..self.rCurAttack.level..self.rCurAttack.combo, self.iCurID, self:getLookTarget(), bTrack) end
					self:incrementMeleeID()
					--self:setState('Combo')
                    self:setState('Melee')
				end
			end
		elseif (id == self.PLATFORMINGCAMREVERTTIMER and QueryPlayerPhysicsState(PHYSICSSTATE_PSIFLOAT) ~= 1) then
			self:killTimer(self.PLATFORMINGCAMREVERTTIMER)
			Global.levelScript.camControl:removeCam(self)
		elseif id == self.TIMER_STUN then
			self.bIsStunned = 0
			self:goToDefaultState()
			self:killTimer(self.TIMER_STUN)
		elseif (id == self.TIMER_CONFUSED) then
			self:killTimer(id)
			self:stopConfusion()
		elseif (id == self.TIMER_LOOPING_ANIM) then
			self.bLoopingAnimDone = 1
			self:killTimer(self.TIMER_LOOPING_ANIM)
		elseif (id == self.TIMER_SHIELD_COOLDOWN) then
			self:onShieldReady()
			self:killTimer(self.TIMER_SHIELD_COOLDOWN)
		elseif (id == self.TIMER_DETONATE_ENTITIES_ACROSS_FRAMES) then
			local nextEnt = tremove(self.detonatedEntities)
			if IsDead(nextEnt) ~= 1 and nextEnt.bPooled ~= 1 then
				self:detonateEntity(nextEnt)
				if getn(self.detonatedEntities) == 0 then
					self:killTimer(id)
				end
			end
		elseif (id == self.TIMER_HEALTH_REGENERATION) then
			self:adjustHealth(1)
		else
			%Ob.Parent.onTimer(self, id)
		end
    end

-- ***************************************************************************

	function Ob:onInventoryFocus(data,from)
		--if ( data ) then
		--	GamePrint('Inventory focus on '.. data)
		--else
		--	GamePrint('Got focus message, but no inventory item')
		--end
	end

-- ***************************************************************************

	function Ob:onTriggerSurface(new,from,old)
		--GamePrint(' tsm: on trig '..(new or 'nil')..' old '..(old or 'nil'))
		self.currTriggerSurfaceIDNum = new
		self.prevTriggerSurfaceIDNum = old
		
		self.bOnGravSurf = nil
		-- the "new == 8" is just for temporary backwards compatibility with MM
		if new == kTRIGGERSURFACE_RELGRAV or new == 8 then
			self.bOnGravSurf = 1
		elseif new == kTRIGGERSURFACE_PLATFORMINGCAMERA then
			self:killTimer(self.PLATFORMINGCAMREVERTTIMER, 1)
			Global.levelScript.camControl:removeCam(self)
			--look up levelscript's platforming camera settings, else use default
			local platformingRadius = Global.levelScript.platformingRadius or 900
			local platformingAltitude = Global.levelScript.platformingAltitude or 25
			local platformingTargetHeight = Global.levelScript.platformingTargetHeight or 100
			local fov = GetCameraFieldOfView()
			Global.levelScript.camControl:pushAndSetChase(self, platformingRadius, platformingAltitude, platformingTargetHeight, fov)			
		end
		
		if (old == kTRIGGERSURFACE_PLATFORMINGCAMERA) then
			--delay 1 second before reverting back
			self:createTimerSecs(1, self.PLATFORMINGCAMREVERTTIMER)
		end
		
		self:sendMessage(Global.levelScript.forwardTriggerSurfaceMessages, 'TriggerSurface', new, 0)
		
		self:callSpamListeners('TriggerSurface', new, from, old)			
		
	end
	
-- [ M E L E E ]**************************************************************
    
	-- timers
	Ob.MELEE_BCOMBO_TIMER = '10001'
	Ob.MELEE_CCOMBO_TIMER = '10002'
	Ob.MELEE_WAIT_TIMER = '10003'
	
	Ob.rCurAttack = Ob.animsTable.melee1a
	Ob.iCurID = 1

	function Ob:onLaunchedPsiBlast()
		if (self.psiBlastListener ~= nil) then
			self:sendMessage(self.psiBlastListener, 'LaunchedPsiBlast', '', '')			
		end
	end

	-- Reminds Raz about some of the lesser-used abilities, if he hasn't done one yet.
	function Ob:reminder(ability)
		if Global:loadGlobal('bRazDid'..ability) == 1 then return end
		if self.rankPowerManager['b'..ability] ~= 1 then return end

		local index = 'non'..ability..'Count'
		if not self[index] then self[index] = 1
		else self[index] = self[index]+1 end

		-- Is it time to remind the player?  If so, remind him, then set up to remind him again in a while if
		-- he still doesn't do it.
		local remindAt = Global:loadGlobal('remind'..ability..'At') or 10

		if self[index] == remindAt then
			local lineCode
			--if ability == 'ChainBlast' then
				--lineCode = "/GLZF034TO/"
			if ability == 'AirMeleeCharge' then
				lineCode = "/GLZF035TO/"
			else
				GamePrint('ERROR: unknown ability passed to reminder: '..(ability or 'nil'))
			--elseif ability == 'PKDetonate' then
				--lineCode = "/GLZF036TO/"
			end
			Global.levelScript:addTutorialBox(lineCode)
			Global:saveGlobal('remind'..ability..'At', ((remindAt >= 40) and remindAt) or remindAt*2)
			self[index] = 0
		end
	end
	
-- **************************************************************
	function Ob:onPsiBlastAnimQueue()
		FirePsiBlast()
		--self:reminder('ChainBlast')
	end
-- **************************************************************	
	
	-- called when the player is out of ammo
	Ob.psiPowerFailedFXOffsetX = 0
	Ob.psiPowerFailedFXOffsetY = 10
	Ob.psiPowerFailedFXOffsetZ = 10

	function Ob:onPowerFailed(power)
		self.rPowerFailedFX:attach(self, 'HeadJA_1')
		self.rPowerFailedFX:setPosition(self.psiPowerFailedFXOffsetX, self.psiPowerFailedFXOffsetY, self.psiPowerFailedFXOffsetZ)
		self.rPowerFailedFX:run()
		
		if (not self.rPsiPowerFailedSoundHandle) then
			self.rPsiPowerFailedSoundHandle = LoadSound('Negative')
		end
		if self.rPsiPowerFailedSoundHandle then
			self:playSound(self.rPsiPowerFailedSoundHandle, 0, 0, 1)
		end

		--Power specific code
		if (power == kPOWER_PSIBLAST) then
			if (Global.levelScript.Type == 'sa.SACU' and Global:load('bSAFB3Played', 'SA') ~= 1) then
				Global.cutsceneScript:runCutscene('SashaGivesAmmo')
			end
		end
	end

	function Ob:onStartPsiBlastCharge(data,from)
	--[[
		
		AttachEntityToEntityBone(self.rPsiBlastChargeFX.AttachParent, self, 'HeadJA_1')
		self.rPsiBlastChargeFX:run()

		-- Send message to look target
		local target = GetLookTarget(self)
		if ( target ) then
			self:sendMessage(target, 'StartPsiBlastChrge')
			-- add effects to the target
			self.psiBlastTargetedFX = self.psiBlastTargetFXPool:get()
			if (target.psiBlastTargetJoint) then
	            self.psiBlastTargetedFX:attach(target, target.psiBlastTargetJoint)
			else
				self.psiBlastTargetedFX:attach(target)
			end
			self.psiBlastTargetedFX:run()
		end
	]]--
	end
	
	function Ob:onMaxPsiBlastCharge(data,from)
	--[[
		local target = GetLookTarget(self)
		if ( target ) then
			self:sendMessage(target, 'MaxPsiBlastCharge')
		end
	]]--
	end

	function Ob:onEndPsiBlastCharge(data,from)
	--[[
		-- kill the target effects
		if (self.psiBlastTargetedFX) then
			self.psiBlastTargetedFX:stop(0, 0, 1)
		end

		local target = GetLookTarget(self)
		if ( target ) then
			if ( data == '1' ) then
				-- create the explosion on the target
				self.psiBlastExplosionFXPool:get():runThenPool(target)
				
				-- Send message to look target
				-- self:sendMessage(target, 'EndPsiBlastCharge')
				-- BRAD - changed the message sent that actually does the damage
				--			this is wicked backward compatible with the old stuff - good for mocking it up!
				self:sendMessage(target, 'PsiBlast')
			else
				self:sendMessage(target, 'AbortPsiBlastCharge')
			end
		end
		--DetachEntityFromParent(self.rPsiBlastChargeFX.AttachParent)
		self.rPsiBlastChargeFX:stop()
	]]--
	end
	
	function Ob:onJumpAttackImpact()
		self.leftHand:palmBombImpact()
	end
	
	function Ob:onMeleePress()
		if (self.bBrainMode == 1) then
			return
		end
		
		--if self.bDartIsDying == 1 or (self.state_name and self.state_name ~= 'Melee' and self.state_name ~= 'Combo') then
		if (self.bDartIsDying == 1) or (self.state_name and self.state_name ~= 'Melee') then
			return
		end
		
		local lookTarget = self:getLookTarget() 

		-- FS Mega detonation
		-- Removed: now detonate ALWAYS occurs.
		--[[
		if self:canDetonate(lookTarget, 1) == 1 then
			Global:saveGlobal('bRazDidPKDetonate')
			self:detonate(lookTarget)
			return
		end
		]]--

		-- reject button presses when we have a non-standard control handler
		local controlHandler = GetControlHandler()
		if (controlHandler ~= kCONTROL_BALL) and (controlHandler ~= kCONTROL_PLAYER) and (controlHandler ~= kCONTROL_RAIL) then
			return
		end
		
		if self.bMeleeOff == 1 then
			self:sayLine(self.meleeOffDialog, 0, 1)
			return
		end
		
		self:cancelInvisibility()

		local bPlayingAttackAnim = ((IsPlayingAnim(Global.player, "BubbleBomb_end.jan") == 1 and GetAnimCompletion(Global.player) < .6) and 1) or ((IsPlayingAnim(Global.player, 'palmbomb_end.jan') == 1 and GetAnimCompletion(Global.player) < .6) and 1)
		local attacking = bPlayingAttackAnim == 1 or self.rightHand:getAttacking() == 1 or self.leftHand:getAttacking() == 1 or (IsPlayingAnim(Global.player, 'BubbleBomb_end.jan') == 1 and GetAnimCompletion(Global.player) < .6)
		-- the TK Monster doesn't use the hands, so we'll have to check the anims instead to determine if we're attacking
		if (self.bTKMonsterActive == 1) then
			attacking = (IsPlayingAnim(Global.player, self:getMeleeAnim('A').fileName .. '.jan') == 1 and GetAnimCompletion(Global.player) < .8) or
						(IsPlayingAnim(Global.player, self:getMeleeAnim('B').fileName .. '.jan') == 1 and GetAnimCompletion(Global.player) < .8) or
						(IsPlayingAnim(Global.player, self:getMeleeAnim('C').fileName .. '.jan') == 1 and GetAnimCompletion(Global.player) < 1.0)
		end

		local actionState = self:getActionState()

		local bTrack = ((GetControlHandler() == kCONTROL_BALL) and 1) or 0
		
		if (actionState == 'Air Melee' or actionState =='Bubble Air Melee') then
			if not attacking then -- jump melee, just play the arms
				SetVelocity(self, 0, 0, 0)
				self:killTimer(self.MELEE_WAIT_TIMER)
				self.bCanComboB = 0
				self.bCanComboC = 0
	
				self:reminder('AirMeleeCharge')
				self.leftHand:go('jump', self.iCurID)
				self:sendWorldMessage('MeleeWindUp', 1000, 'melee'..self.rCurAttack.level..self.rCurAttack.combo)
			elseif self.rankPowerManager.bAirMeleeCharge == 1 then
				Global:saveGlobal('bRazDidAirMeleeCharge', 1)
				self.leftHand:chargeAirMelee()
			end
		elseif (strfind(actionState, 'Jump') or strfind(actionState, 'Fall')) and not strfind(actionState, 'Bubble') then
			-- nothing
		elseif actionState ~= 'Melee' and not attacking then
			self.rCurAttack = self:getMeleeAnim('A')
			self:setState('Melee')
		elseif (self.bCanComboB == 1) or (self.bCanComboC == 1) then
			-- need to make sure attack 2 finishes before starting the third one
			if (attacking == 1) then
				self:killTimer(self.MELEE_WAIT_TIMER)
				self:createTimer(10, self.MELEE_WAIT_TIMER)
			else
				-- for those that anticipate the attack
				if (self.bCanComboB == 1) then
					self.bCanComboB = 0
				end
				if (self.bCanComboC == 1) then
					self.bCanComboC = 0
				end
				if self.rCurAttack.hand then 
					self[self.rCurAttack.hand]:go('melee'..self.rCurAttack.level..self.rCurAttack.combo, self.iCurID, lookTarget, bTrack) 
				end
				self:incrementMeleeID()
				--self:setState('Combo')
				self:setState('Melee')
			end
		end
	end
	
-- ***************************************************************************
			  
	function Ob:onMeleeRelease()
		if (self.charged == 1) then self:setState('ChargedBlast') end
	end
	
-- ***************************************************************************
    
	function Ob:onChargedAttack()
		self:setState('Charge')
	end
	
-- ***************************************************************************
	
	function Ob:onMeleeInterrupt(data, from)
		self.bMeleeInterrupted = 1
	end
	
-- ***************************************************************************

	function Ob:getMeleeAnim(attack)
		if (self.bTKMonsterActive ~= 1) then
			-- standard attacking
			if (attack == 'A') or (attack == 'a') then
				return self.animsTable.melee1a
			elseif (attack == 'B') or (attack == 'b') then
				return self.animsTable.melee1b
			elseif (attack == 'C') or (attack == 'c') then
				return self.animsTable.melee1c
			end
		else
			-- TK Monster attacking
			if (attack == 'A') or (attack == 'a') then
				return self.animsTable.TKMonsterMeleeA
			elseif (attack == 'B') or (attack == 'b') then
				return self.animsTable.TKMonsterMeleeB
			elseif (attack == 'C') or (attack == 'c') then
				return self.animsTable.TKMonsterMeleeC
			end
		end
	end

	function Ob:stateMelee()
		if (not self.rCurAttack) then
			self.rCurAttack = self:getMeleeAnim('A')
		end
		
		self:setNewAction('Melee')
		-- attack [combo A, basic melee]
		local bTrack = ((GetControlHandler() == kCONTROL_BALL) and 1) or 0

		if self.rCurAttack.hand then self[self.rCurAttack.hand]:go('melee'..self.rCurAttack.level..self.rCurAttack.combo, self.iCurID, self:getLookTarget(), bTrack) end
		self:incrementMeleeID()
		local curanim = self.rCurAttack.fileName..'.jan'
		self:loadAnim(self.animBasePath..curanim, .01, 0)
		
		if (self.rCurAttack.combo == 'a') then
			self.bMeleeInterrupted = 0
			self.rCurAttack = self:getMeleeAnim('B')
			self.bCanComboB = 1
			self.bCanComboC = 0
			self:killTimer(self.MELEE_BCOMBO_TIMER)
			self:createTimer(self.MELEE_BCOMBO_TIME, self.MELEE_BCOMBO_TIMER)
		elseif (self.rCurAttack.combo == 'b') then
			self.bMeleeInterrupted = 0
			self.rCurAttack = self:getMeleeAnim('C')
			self.bCanComboB = 0
			self.bCanComboC = 1
			self:killTimer(self.MELEE_CCOMBO_TIMER)
			self:createTimer(self.MELEE_CCOMBO_TIME, self.MELEE_CCOMBO_TIMER)
		else
			self.rCurAttack = self:getMeleeAnim('A')
		end
		
		local animCompletion
		repeat
			Yield()
			animCompletion = GetAnimCompletion(self,-1,curanim)
		until (animCompletion==nil or animCompletion >= 1 or (self.bMeleeInterrupted == 1 and animCompletion > 0.6))

		-- set back to proper action
		self:goToDefaultState()
		self:setState(nil)
	end

	
	function Ob:goToDefaultState()
		self:setNewAction(self.meleeReturnStates[GetControlHandler()])
	end


	function Ob:autoOrientToMeleeTarget()
		if (IsRazZLocked() == 1) then
			return	-- no orienting while zlocked
		end
		if GetControlHandler() == kCONTROL_BALL then
			return
		end

		local sx, sy, sz = GetPlayerControlCameraRelativeVector()
		local nx, ny, nz, length = NormalizeVector(sx, sy, sz)
		
		local px, py, pz = Global.player:getPosition()

		-- facing vector used in the dot product check
		if (length > 0.0) then
			-- use the direction that the player is pushing on the stick
			--Global.player:setOrientation(px, py, pz) -- HACK
			self.fx = nx
			self.fy = ny
			self.fz = nz
		else
			-- use raz's facing
			self.fx, self.fy, self.fz = GetEntityForwardVector(Global.player)
		end
		
		self.bestEnt = nil
		self.bestDot = 0.0	-- dot must be better than this to match

		local me = self		

		local findBestTarget = function(ent)
			if 	( (ent) and ( ((ent.bIsCensor) and (ent.bIsDead ~= 1)) or (ent.bMeleeOrient) ) ) then
				local ex, ey, ez = ent:getPosition()
				local px, py, pz = Global.player:getPosition()
				local playerToEntX, playerToEntY, playerToEntZ
				
				playerToEntX = ex - px
				playerToEntY = ey - py
				playerToEntZ = ez - pz
				local dot = DotProduct(%me.fx, %me.fy, %me.fz, playerToEntX, playerToEntY, playerToEntZ, 1)
				if (dot > %me.bestDot) then
					%me.bestEnt = ent
					%me.bestDot = dot
				end
			end
		end

		ForEachEntityInRadius(px, py, pz, 500.0, findBestTarget)
		
		local dx, dy, dz
		if (self.bestEnt) then
			dx, dy, dz = self.bestEnt:getPosition()
		else
			dx = px + (self.fx * 100)
			dy = py + (self.fy * 100)
			dz = pz + (self.fz * 100)
		end
		RotateTowards2D(self, dx,dy,dz, 50000)
	end
	
	function Ob:beginStateMelee()
		self:autoOrientToMeleeTarget()
		if self.rCurAttack then -- for those that anticipate the attack
			self:sendWorldMessage('MeleeWindUp', 600, 'melee'..self.rCurAttack.level..self.rCurAttack.combo) 
		end
	end

	function Ob:endStateMelee()
		self:killTimer(self.MELEE_BCOMBO_TIMER)
		self:killTimer(self.MELEE_CCOMBO_TIMER)
		self:goToDefaultState()
	end

-- *************************************************************************** 

	function Ob:stateCharge()
		self.charged = 1
	end
	
-- ***************************************************************************

	function Ob:stateChargedBlast()
	end

-- ***************************************************************************

	function Ob:stopMelee()
		self:goToDefaultState()
		self:killTimer(self.MELEE_BCOMBO_TIMER)
		self:killTimer(self.MELEE_CCOMBO_TIMER)
		self:killTimer(self.MELEE_WAIT_TIMER)

		if self.leftHand then
			self.leftHand:cleanUpMelee()
		end
		if self.rightHand then
			self.rightHand:cleanUpMelee()
		end

		-- clear out our state ONLY if we're in the melee state
		-- this will fix the problems with respawning
		if (self.state_name == 'Melee') then
			self:setState(nil)
		end
	end

-- ***************************************************************************
								  
	function Ob:meleeStateChange(newState, oldState)
		self.leftHand:change(newState, oldState)
--		self.rightHand:change(newState, oldState)
	end
	
	function Ob:incrementMeleeID()
		self.iCurID = self.iCurID + 1
		if (self.iCurID == 1337) then
			self.iCurID = 1
		end
	end
	
-- ***************************************************************************
	
	function Ob:meleeOff(dialog)
		self.bMeleeOff = 1
		if (dialog) then
			self.meleeOffDialog = dialog
		else
			self.meleeOffDialog = "I shouldn't punch here"
		end
	end
	
-- ***************************************************************************
	
	function Ob:brainModeOn()
		self.bBrainMode = 1
	end

	
	function Ob:brainModeOff()
		self.bBrainMode = 0
	end
	
-- ***************************************************************************
	
	function Ob:meleeOn()
		self.bMeleeOff = 0
	end


-- ***************************************************************************
	----------- HACK HACK HACK for BVRB shops-------------
	function Ob:isInShop(controller)
		self.rCurrShopController = controller
	end
	
-- ***************************************************************************

	function Ob:isInDialogTree(controller)
		self.rCurrDialogTreeController = controller
		if controller then
			self:killHint()
		elseif self:getLookTarget() then
			self:onLookTargetChanged(self:getLookTarget().Name, self, nil)
		end
	end

-- ***************************************************************************
	    
	function Ob:onExitCanoeControlHandler(from,data)
		-- XXX: what if there's more than one?
		local canoe=to_ent('ca.props.Canoe')
		if not canoe then return end
		canoe:exitCanoe(1)
	end

	function Ob:raiseGoggles(bBlocking)
		LoadAnim(Global.player, 'Anims/DartNew/BodyParts/GogglesUp_SpineJA.jan', .1, 0)
		LoadAnim(Global.player, 'Anims/DartNew/Helmet/GogglesUp_SpineJA.jan', .1, 0)
		if bBlocking then
			while IsPlayingAnim(self, 'GogglesUp_SpineJA.jan') do Yield() end
		end
	end
	
	function Ob:lowerGoggles(bBlocking)
		LoadAnim(Global.player, 'Anims/DartNew/BodyParts/GogglesDwn_SpineJA.jan', .1, 0)
		LoadAnim(Global.player, 'Anims/DartNew/Helmet/GogglesDwn_SpineJA.jan', .1, 0)
		if bBlocking then
			while IsPlayingAnim(self, 'GogglesDwn_SpineJA.jan') do Yield() end
		end
	end
	
	-- Enables or disables a potentially level-specific dirt material.
	-- You only get an enable or disable message, never the dirt type, so you have to check Raz's current ground material.
	-- So, if bEnable is false, disable all dirt.  If it's true, disable all dirt except the current ground material.
	-- There are two kinds of dirt: the generic stuff, and level-specific stuff.  The generic stuff is a pair of PEs
	-- created by the engine, and the level-specific is a TE held in the level script.
	function Ob:onEnableDust(bEnable)
		local groundMaterial = GetGroundMaterial(self)

		-- Special hack for CA, where they're having trouble getting blind data under control.
		-- If the surface is tagged but not slippery, pretend it's not tagged.
		if Global.levelScript:getLevelPrefix() == 'CA' then
			if IsSurfaceFlagSet(Global.player, kSurfaceSlippery) ~= 1 then
				groundMaterial = 0
			end
		end
	
		
		if groundMaterial == self.groundMaterialSpecialDirt then
			-- Disable all, or enable only special dirt
			PESetActive(self.dust, 0)
			PESetActive(self.dirt, 0)
			if Global.levelScript.specialDirt then -- the surface can be tagged even if the levelscript defines no special dirt
				if bEnable == 1 then
					Global.levelScript.specialDirt:attach(self, nil, 1)
				else
					Global.levelScript.specialDirt:detach()
					Global.levelScript.specialDirt:stop()
				end
			end
		else
			-- Disable all, or enable only generic dirt
			PESetActive(self.dust, bEnable)
			PESetActive(self.dirt, bEnable)
			if Global.levelScript.specialDirt and Global.levelScript.specialDirt.attachedEnt then
				Global.levelScript.specialDirt:detach()
				Global.levelScript.specialDirt:stop()
			end
		end
	end
	
    function Ob:onEnableSlideSound(bEnable)
		local groundMaterial = GetGroundMaterial(self) 		
		local sound = Global.levelScript:getSlideSound(groundMaterial)		

		if not sound then
			sound = self.slideGeneric
		end

		if bEnable==1 then
			if self.slideCurrent then
				StopSound(self.slideCurrent)
			end
			PlaySound(nil, sound)
			self.slideCurrent = sound
		else
			if self.slideCurrent then
				StopSound(self.slideCurrent)
			end
			self.slideCurrent = nil
		end
	end

	-- Called by engine.  passed:
	--  dir		-1 (down), 0 (still), +1 (up)
	--  pole	LSO of the pole object
	--
	function Ob:onEnablePoleFX(dir, pole)
		if self.poleCurrent then
			StopSound(self.poleCurrent)
		end

		local newSound = nil
		self.bClimbingUp = 0 -- for use with onPoleClimb event, below.  Pending BASD revision.
		if dir > 0 then
			self.bClimbingUp = 1
			-- Remove lines starting here once onPoleClimb (below) is put back in.
			newSound = (pole and pole.climbSound and LoadSound(pole.climbSound)) or LoadSound('PoleClimb')
			if newSound then
				PlaySound(nil, newSound, 0)
			end
			self.poleCurrent = newSound
			-- end remove lines
		elseif dir < 0 then
			newSound = (pole and pole.slideSound and LoadSound(pole.slideSound)) or LoadSound('LadderSlide')
			if newSound then
				PlaySound(nil, newSound, 1)
			end
			self.poleCurrent = newSound
		end
	end

	--[[
	-- Commented out pending BASD revision.
	-- This code entered on: Jan 27, 2005.
	function Ob:onPoleClimb()
		if self.bClimbingUp == 1 then
			local newSound = (pole and pole.climbSound and LoadSound(pole.climbSound)) or LoadSound('PoleClimb')
			if newSound then
				PlaySound(nil, newSound, 0)
			end
		end
	end
	]]--

	-- Called by engine.  passed:
	--  bEnable - 1 = engaged, 0 = disengaged
	--
	function Ob:onFirstPersonCamera(bEnable, from)
		self:callSpamListeners('FirstPersonCamera', bEnable)
		if ( bEnable == 1 ) then
			GamePrint('Turning off invis fx')
			self.rInvisibilityFX:hide()
			self.bFirstPersonMode = 1
		else
			GamePrint('Turning on invis fx')
			self.rInvisibilityFX:show()
			self.bFirstPersonMode = 0
		end
	end

	-- Called by the engine
	function Ob:createEmitters()
		self.dirt = CreateParticleEmitter('RazDirtPE',50)
		self.dust = CreateParticleEmitter('RazDustPE',100)
        
		return self.dirt, self.dust
	end
	
-- ****************************************************************************

	function Ob:onAnimCompleted(data)
		self:callSpamListeners('AnimCompleted', data)
	end

-- ****************************************************************************

	--Save Raz's current power mappings
	function Ob:savePowerMappings()
		if (not self.mappedButton) then
			self.mappedButton = {}
		end
		self.mappedButton[kQUICKPICK_BLACK] = GetMappedPower(kQUICKPICK_BLACK)
		self.mappedButton[kQUICKPICK_WHITE] = GetMappedPower(kQUICKPICK_WHITE)
		self.mappedButton[kQUICKPICK_TRIGR] = GetMappedPower(kQUICKPICK_TRIGR)
	end

	--Restore the saved power mappings to their old state
	--  bForce: Restore power mappings even if another power is already mapped to that button
	function Ob:restorePowerMappings(bForce)
		if (self.mappedButton) then
			if (self.mappedButton[kQUICKPICK_BLACK]) and (GetMappedPower(kQUICKPICK_BLACK) == kPOWER_NONE) then
				MapPowerToButton(self.mappedButton[kQUICKPICK_BLACK], kQUICKPICK_BLACK) 
			end
			if (self.mappedButton[kQUICKPICK_WHITE]) and (GetMappedPower(kQUICKPICK_WHITE) == kPOWER_NONE) then
				MapPowerToButton(self.mappedButton[kQUICKPICK_WHITE], kQUICKPICK_WHITE) 
			end
			if (self.mappedButton[kQUICKPICK_TRIGR]) and (GetMappedPower(kQUICKPICK_TRIGR) == kPOWER_NONE) then
				MapPowerToButton(self.mappedButton[kQUICKPICK_TRIGR], kQUICKPICK_TRIGR) 
			end
			self.mappedButton[kQUICKPICK_BLACK] = nil
			self.mappedButton[kQUICKPICK_WHITE] = nil
			self.mappedButton[kQUICKPICK_TRIGR] = nil
		end
	end

	function Ob:TKMonster(bEnable, iScale)
		self:interruptPowers(1)
		iScale = iScale or 3.5
		if ( bEnable == 1 ) then
			if ( self.psiSkeleton == nil ) then
				self.psiSkeleton = SpawnScript('Global.Effects.PsiSkeleton', self.Name..'PsiSkeleton')
			end
			if ( self.psiSkeleton.bActive ~= 1 ) then
				self.psiSkeleton:Activate(iScale)
			end
			
			self:setScale(iScale, iScale, iScale)
			SetPlayerMovementScale(iScale)
			SetEntityAnimationMovementScale(self, 1)
			self:savePowerMappings()
			DisablePower(kPOWER_PSIBLAST)
			DisablePower(kPOWER_FIRESTARTING)
			DisablePower(kPOWER_LEVITATION)
			DisablePower(kPOWER_TELEKINESIS)
			DisablePower(kPOWER_CONFUSION)
			DisablePower(kPOWER_INVISIBILITY)
			DisablePower(kPOWER_CLAIRVOYANCE)
			DisablePower(kPOWER_SHIELD)

			-- set collidesphere
			SetEntityCollideSphere(Global.player, 400, 0,400,0, 0)
			SetEntityCollideSphere(Global.player, 400, 0,900,0, 1)

			self.bTKMonsterActive = 1
			-- make sure raz can't be hurt
			self.block = 1
			
			-- make the collision spheres for the melee attacks
			self:createTKMonsterMeleeSpheres()

			-- turn slow raz on
			Global.levelScript:startSlowLORaz()
			Global.camControl:pushAndSetChase(self, 2500, 0, 900, 90)
			
			-- we want the TK Raz to be a little bit sluggish
			SetPhysicsConstant(nil, PHYSICS_SteerSpeed, 300)
			SetPhysicsConstant(nil, PHYSICS_180SteerSpeed, 400)
			
			-- set up the look box to the appropriate size
			SetPlayerLookBox(250*iScale, 700*iScale, 2000*iScale)
			
			-- no jumping as Monster Raz!
			EnablePlayerJumping(0)
			
			-- ignore the juggler clubs
			IgnoreCollideLayer(self, LAYER_MC_JUGGLER_CLUBS, 1)
			
			self:spawnTKMonsterFXScripts()
		else
			if ( self.psiSkeleton and self.psiSkeleton.bActive == 1) then
				self.psiSkeleton:Deactivate(1) -- shrink and kill self
				self:setScale(1)
				self.psiSkeleton = nil
			end
			SetPlayerMovementScale(1)
			SetEntityAnimationMovementScale(self, 1)
			Global.levelScript:enableAppropriatePowers()
			-- restore collidesphere
			SetEntityCollideSphere(Global.player, 42, 0,42,0, 0)
			SetEntityCollideSphere(Global.player, 40, 0,110,0, 1)
			self.bTKMonsterActive = 0
			self.block = 0
			
			-- create the melee collide balls
			self:destroyTKMonsterMeleeSpheres()
            
			Global.levelScript:endSlowLORaz()
			Global.camControl:removeCam(self)
			
			-- reset the slowness of Raz
			self:setPhysicsConstants()
			
			-- reset the look box back to normal
			SetPlayerLookBox(250, 700, 2000)
			
			-- re enable the jumping
			EnablePlayerJumping(1)
			
			-- collide with the juggler clubs again
			IgnoreCollideLayer(self, LAYER_MC_JUGGLER_CLUBS, 0)
		end
	end
	
-- ****************************************************************************
	
	function Ob:spawnTKMonsterFXScripts()
		-- create FX if they don't exist
		if (self.TKMeleeSwishFX == nil) then
			self.TKMeleeSwishFX = {}
			
			self.TKMeleeSwishFX[1] = SpawnScript('Global.Props.Geometry', self.Name .. '_TKSwishFX1', 'self.meshName = \'Characters/CharacterProps/TK_Monster_jabLftSwoosh.plb\'')
			SetEntityAlpha(self.TKMeleeSwishFX[1], 0.0, 0.0)
			SetPhysicsFlag(self.TKMeleeSwishFX[1], PHYSICS_COLLIDER, 0)
			SetPhysicsFlag(self.TKMeleeSwishFX[1], PHYSICS_COLLIDEE, 0)

			self.TKMeleeSwishFX[2] = SpawnScript('Global.Props.Geometry', self.Name .. '_TKSwishFX2', 'self.meshName = \'Characters/CharacterProps/TK_Monster_jabRtSwoosh.plb\'')
			SetEntityAlpha(self.TKMeleeSwishFX[2], 0.0, 0.0)
			SetPhysicsFlag(self.TKMeleeSwishFX[2], PHYSICS_COLLIDER, 0)
			SetPhysicsFlag(self.TKMeleeSwishFX[2], PHYSICS_COLLIDEE, 0)

			self.TKMeleeSwishFX[3] = SpawnScript('Global.Props.Geometry', self.Name .. '_TKSwishFX3', 'self.meshName = \'Characters/CharacterProps/TK_Monster_uppercutSwoosh.plb\'')
			SetEntityAlpha(self.TKMeleeSwishFX[3], 0.0, 0.0)
			SetPhysicsFlag(self.TKMeleeSwishFX[3], PHYSICS_COLLIDER, 0)
			SetPhysicsFlag(self.TKMeleeSwishFX[3], PHYSICS_COLLIDEE, 0)
		end
		
		if (self.TKMeleeImpactFXPool == nil) then
			self.TKMeleeImpactFXPool = Global.levelScript:getPool('MC.Effects.TKmonsterImpactFX')
			self.TKMeleeImpactFXPool:setLowerLimit(1)
		end
	end

-- ****************************************************************************
	
	function Ob:createTKMonsterMeleeSpheres()
        self.TKMonsterMeleeSphereR = SpawnScript('Gen_CollideBall', self.Name .. '_TKMonsterBallR')
		SetEntityDomain(self.TKMonsterMeleeSphereR, GetEntityDomain(self))
		if self.TKMonsterMeleeSphereR then
			SetEntityFlag(self.TKMonsterMeleeSphereR, ENTITY_CANNOTBESTOODON, 1)
			self.TKMonsterMeleeSphereR:initialize(self, "handJARt_2", 300, 0, 0, 0)
			self.TKMonsterMeleeSphereR:setActive(0)	-- turn off collide ball when not attacking
        end

		self.TKMonsterMeleeSphereL = SpawnScript('Gen_CollideBall', self.Name .. '_TKMonsterBallL')
		SetEntityDomain(self.TKMonsterMeleeSphereL, GetEntityDomain(self))
		if self.TKMonsterMeleeSphereL then
			SetEntityFlag(self.TKMonsterMeleeSphereL, ENTITY_CANNOTBESTOODON, 1)
			self.TKMonsterMeleeSphereL:initialize(self, "handJALf_2", 300, 0, 0, 0)
			self.TKMonsterMeleeSphereL:setActive(0)	-- turn off collide ball when not attacking
        end

		-- load the melee sounds
		self.rTKMonsterMeleeSwipeSoundHandle = LoadSound('PowerMeleeSwipe')
	end
	
-- ****************************************************************************
	
	function Ob:destroyTKMonsterMeleeSpheres()
		if (self.TKMonsterMeleeSphereR) then
			self.TKMonsterMeleeSphereR:killSelf()
			self.TKMonsterMeleeSphereR = nil
		end
		if (self.TKMonsterMeleeSphereL) then
			self.TKMonsterMeleeSphereL:killSelf()
			self.TKMonsterMeleeSphereL = nil
		end
	end
	
-- ****************************************************************************

	function Ob:onCollideBallNMCollide(ball, from, nx, ny, nz)
		if (self.bTKMonsterActive ~= 1) then
			return
		end
		
   		if (from == self) then
			return
		end
        
        local bx,by,bz = ball:getPosition()
        local impactFX = self.TKMeleeImpactFXPool:get()
        impactFX:runThenPool(bx,by,bz)
		
		if (from == Global) then
			return
		end
				
		if (from.onNewMoveMelee) then
            SendMessage(Global.player, from, 'NewMoveMelee', 'melee'..self.rCurAttack.level..self.rCurAttack.combo)
		end
	end

-- ****************************************************************************	
	
	-- turn on the right TK Melee sphere through event files
	function Ob:onTKRightMeleeSphere(active)
		if (self.TKMonsterMeleeSphereR) then
			self.TKMonsterMeleeSphereR:setActive(tonumber(active))
			-- play the swipe sound
			self:playSound(self.rTKMonsterMeleeSwipeSoundHandle, 0, 0, 1)
		end
	end

-- ****************************************************************************		
	-- turn on the left TK Melee sphere through event files
	function Ob:onTKLeftMeleeSphere(active)
		if (self.TKMonsterMeleeSphereL) then
			self.TKMonsterMeleeSphereL:setActive(tonumber(active))
			-- play the swipe sound
			self:playSound(self.rTKMonsterMeleeSwipeSoundHandle, 0, 0, 1)
		end
	end
	
-- ****************************************************************************	

	function Ob:alignTKMeleeSwishFX(attackFileName)
		local swishFX = nil
		if (attackFileName == 'Jab1') then
			swishFX = self.TKMeleeSwishFX[2]
		elseif (attackFileName == 'Jab2') then
			swishFX = self.TKMeleeSwishFX[1]
		else
			swishFX = self.TKMeleeSwishFX[3]
		end
		
		local px, py, pz = Global.player:getPosition()
		local ox, oy, oz = Global.player:getOrientation()
		swishFX:setPosition(px, py, pz)
		swishFX:setOrientation(ox, oy, oz)
	end
	
-- ****************************************************************************		

	function Ob:onTKMeleeSwishFX(FXNumString)
		local swishFX = nil
		local FXNum = tonumber(FXNumString)
		if (not FXNum) or (FXNum < 1) or (FXNum > 3) then
			GamePrint('ERROR: FX Index Out of Range!')
			FXNum = 1
		end
		
		if (FXNum == 1) then
			FXNum = 2
		elseif (FXNum == 2) then
			FXNum = 1
		end
		
		swishFX = self.TKMeleeSwishFX[FXNum]

		local scale = self:getScale(self)
		swishFX:setScale(scale)
		
		AttachEntityToEntity(swishFX, self)
		swishFX:setPosition(0,0,0)
		swishFX:setOrientation(0,0,0)
		
		SetEntityAlpha(swishFX, 1.0, 0.0)
		SetEntityAlpha(swishFX, 0.0, 0.25)
	end

-- ****************************************************************************
	
	function Ob:setEverything(ent,bDontSetGravityDir)
		self:setPosition(ent:getPosition())
		local ox, oy, oz = ent:getOrientation()
		self:setOrientation(ox, oy, oz)
		local levelName = GetCurrentLevelName()
		--dont set raz's up vector same as locator's unless one of these levels
		if ((levelName == 'BBA2' or levelName == 'SACU' or levelName == 'MMI1' or levelName == 'MMI2')
				  and bDontSetGravityDir ~= 1) then
			local cook = StartMath()
			local quat = Quat(ox, oy, oz) * Vector(0,1,0)
			local upX,upY,upZ = quat:AsComponents()
			SetEntityGravityDir(self, upX,upY,upZ)
			EndMath(cook)
		end
	end

-- ****************************************************************************

	function Ob:setAlpha(destAlpha, dur)
		%Ob.Parent.setAlpha(self, destAlpha, dur)
		local item = Global.player.HeldItem and FindScriptObject(Global.player.HeldItem)
		if item then
			item:setAlpha(destAlpha, dur)
		end
	end

-- ****************************************************************************
	-- Called by the engine
	function Ob:initEmitters(dirt, dust)
		-- Dion, this is called whenever raz is reset, which includes
		-- dropping him from the debug menu.  So if you want to check
		-- stuff out interactively, you can reload('Dart') to reload
		-- dart.lua, then drop raz, and the changes should take effect.

		-- Also, you will need to pass 1 to the "bLock" parameter in PESetTexture

        -------------------------------------------------
        PESetTexture(dirt,'textures/alphadot.tga',1)
        PESetParticleBlendMode(dirt,kBLENDMODE_ALPHA_BLEND)
        PESetParticleForce(dirt,0.000000,100.000000,0.000000)
        PESetPointSprite(dirt, 1)
        PESetNoSpread(dirt,1)
        PESetConeAngle(dirt, 80,90)
        PESetParticleSpeed(dirt,250.000000,400.000000)
        PESetParticleStartEndSize(dirt,20.000000,10.000000)
        PESetParticleRotation(dirt,0.000,0.000)
        PESetParticleLifetime(dirt,0.200000,0.500000)
        PESetParticlesPerSec(dirt,50.000000,50.000000)
        PESetStartColor(dirt,40,20,5,254)
        PESetEndColor(dirt,16,16,16,254)
        PESetActive(dirt,1)
        -------------------------------------------------
        PESetDistribution(dust,kPD_BOX,kPDV_DEFAULT,-10.000000,0.000000,-10.000000,10.000000,10.000000,10.000000)
        PESetTexture(dust,'textures/fxtextures/billowingsmoke2.tga',1)
        PESetTexAnimInfo(dust,16,-1,0,4.000)
        PESetParticleBlendMode(dust,kBLENDMODE_ALPHA_BLEND)
        PESetParticleForce(dust,0.000000,300.000000,0.000000)
        PESetNoSpread(dust,1)
        PESetParticleSpeed(dust,0.000000,0.000000)
        PESetParticleStartEndSize(dust,77.000000,180.000000)
        
		PESetParticleRotation(dust,-90.000,90.000)
        PESetParticleLifetime(dust,0.500000,0.500000)
        PESetParticlesPerSec(dust,100.000000,100.000000)
        PESetNumStages(dust,4)
        PESetActiveStage(dust,0)
        PESetStartColor(dust,255,255,255,0)
        PESetParticleStageSize(dust,100)
        PESetActiveStage(dust,1)
        PESetStageDuration(dust,0.33)
        PESetStartColor(dust,255,255,255,50)
        PESetParticleStageSize(dust,110)
        PESetActiveStage(dust,2)
        PESetStageDuration(dust,0.33)
        PESetStartColor(dust,190,170,130,20)
        PESetParticleStageSize(dust,120)
        PESetActiveStage(dust,3)
        PESetStageDuration(dust,0.34)
        PESetEndColor(dust,190,170,130,0)
        PESetParticleStageSize(dust,200)
        PESetActive(dust,1)
	end

	-- DEBUG: inserted Saturday, Jan 22, 2005, for temp testing.  
	-- If you see this more than one week from this date, feel free to delete.
	function Ob:piles(num)
		Debug_SetProductionLoading(0)
		Global.player:setRank(100)
		for i = 1, (num or 10) do
			local g = SpawnScript('Global.Props.GIO')
			local x, y, z = Global.player:getPosInFrontOf(400, 100)
			g:setPosition(x+RandInt(-300, 300), y, z+RandInt(-300, 300))
			g:onThaw()
			g.Confusion = 1

			SetPhysicsFlag(g, PHYSICS_CHECKTRIGGERS, 1)
			g.onConfusionDone = function(self)
				self.confusionFX:stop()
				local pool = Global.levelScript:getPool('Global.Effects.ConfusionEmitterObject')
				pool:pool(self.confusionFX)
				self.confusionFX = nil
			end
			g.onConfusion = function(self)
				GamePrint('confused')
				local pool = Global.levelScript:getPool('Global.Effects.ConfusionEmitterObject')
				self.confusionFX = pool:get()
				self.confusionFX:attach(self, self.confusionJoint,self.confusionX,self.confusionY,self.confusionZ)
				SetVelocity(self.confusionFX, 0,0,0)
				self:callFunctionAfter(self.onConfusionDone, 3000)
			end
		end
		return
	end

	-- ***************************************************************************
	-- Native methods
	-- ***************************************************************************

	Ob.setLookTargetSearchDist = PlayerSetLookTargetSearchDist

	return Ob
end

