#ifndef _PLAYERBOT_RAIDAQ40ACTIONCONTEXT_H
#define _PLAYERBOT_RAIDAQ40ACTIONCONTEXT_H

#include "Action.h"
#include "BossAuraActions.h"
#include "NamedObjectContext.h"
#include "RaidAq40Actions.h"

class RaidAq40ActionContext : public NamedObjectContext<Action>
{
public:
    RaidAq40ActionContext()
    {
        creators["aq40 skeram cc mind control"] = &RaidAq40ActionContext::skeram_cc_mind_control;
        creators["aq40 skeram move to assigned platform"] = &RaidAq40ActionContext::skeram_move_to_assigned_platform;
        creators["aq40 skeram interrupt arcane explosion"] = &RaidAq40ActionContext::skeram_interrupt_arcane_explosion;
        creators["aq40 skeram move from arcane explosion"] = &RaidAq40ActionContext::skeram_move_from_arcane_explosion;
        creators["aq40 skeram attack split target"] = &RaidAq40ActionContext::skeram_attack_split_target;
        creators["aq40 skeram move from melee clump"] = &RaidAq40ActionContext::skeram_move_from_melee_clump;
        creators["aq40 bug trio attack kri"] = &RaidAq40ActionContext::bug_trio_attack_kri;
        creators["aq40 bug trio interrupt yauj"] = &RaidAq40ActionContext::bug_trio_interrupt_yauj;
        creators["aq40 bug trio move from kri cloud"] = &RaidAq40ActionContext::bug_trio_move_from_kri_cloud;
        creators["aq40 bug trio aoe spawn bugs"] = &RaidAq40ActionContext::bug_trio_aoe_spawn_bugs;
        creators["aq40 bug trio spread from fear"] = &RaidAq40ActionContext::bug_trio_spread_from_fear;
        creators["aq40 sartura kite to perimeter"] = &RaidAq40ActionContext::sartura_kite_to_perimeter;
        creators["aq40 sartura attack guard"] = &RaidAq40ActionContext::sartura_attack_guard;
        creators["aq40 sartura move from tunnel"] = &RaidAq40ActionContext::sartura_move_from_tunnel;
        creators["aq40 fankriss attack worm"] = &RaidAq40ActionContext::fankriss_attack_worm;
        creators["aq40 fankriss gather hatchlings"] = &RaidAq40ActionContext::fankriss_gather_hatchlings;
        creators["aq40 fankriss help teleported player"] = &RaidAq40ActionContext::fankriss_help_teleported_player;
        creators["aq40 fankriss swap tanks"] = &RaidAq40ActionContext::fankriss_swap_tanks;
        creators["aq40 viscidus cleanse poison"] = &RaidAq40ActionContext::viscidus_cleanse_poison;
        creators["aq40 viscidus use frost attacks"] = &RaidAq40ActionContext::viscidus_use_frost_attacks;
        creators["aq40 viscidus melee shatter"] = &RaidAq40ActionContext::viscidus_melee_shatter;
        creators["aq40 viscidus attack nearest glob"] = &RaidAq40ActionContext::viscidus_attack_nearest_glob;
        creators["aq40 huhuran tranq shot"] = &RaidAq40ActionContext::huhuran_tranq_shot;
        creators["aq40 huhuran move to soaker ring"] = &RaidAq40ActionContext::huhuran_move_to_soaker_ring;
        creators["aq40 huhuran spread outer ring"] = &RaidAq40ActionContext::huhuran_spread_outer_ring;
        creators["aq40 huhuran selective wyvern dispel"] = &RaidAq40ActionContext::huhuran_selective_wyvern_dispel;
        creators["aq40 twins move from veklor melee"] = &RaidAq40ActionContext::twins_move_from_veklor_melee;
        creators["aq40 twins pick up emperor after teleport"] = &RaidAq40ActionContext::twins_pick_up_emperor_after_teleport;
        creators["aq40 twins control mutate bug"] = &RaidAq40ActionContext::twins_control_mutate_bug;
        creators["aq40 twins kill explode bug"] = &RaidAq40ActionContext::twins_kill_explode_bug;
        creators["aq40 twins attack assigned emperor"] = &RaidAq40ActionContext::twins_attack_assigned_emperor;
        creators["aq40 ouro move from frontal"] = &RaidAq40ActionContext::ouro_move_from_frontal;
        creators["aq40 ouro regroup center"] = &RaidAq40ActionContext::ouro_regroup_center;
        creators["aq40 ouro spread for resurfacing"] = &RaidAq40ActionContext::ouro_spread_for_resurfacing;
        creators["aq40 ouro kill scarabs"] = &RaidAq40ActionContext::ouro_kill_scarabs;
        creators["aq40 ouro burn"] = &RaidAq40ActionContext::ouro_burn;
        creators["aq40 cthun spread ring"] = &RaidAq40ActionContext::cthun_spread_ring;
        creators["aq40 cthun rotate dark glare"] = &RaidAq40ActionContext::cthun_rotate_dark_glare;
        creators["aq40 cthun attack eye tentacle"] = &RaidAq40ActionContext::cthun_attack_eye_tentacle;
        creators["aq40 cthun attack giant eye"] = &RaidAq40ActionContext::cthun_attack_giant_eye;
        creators["aq40 cthun attack giant claw"] = &RaidAq40ActionContext::cthun_attack_giant_claw;
        creators["aq40 cthun stomach attack flesh"] = &RaidAq40ActionContext::cthun_stomach_attack_flesh;
        creators["aq40 cthun burn body"] = &RaidAq40ActionContext::cthun_burn_body;
        creators["aq40 trash mark kill order"] = &RaidAq40ActionContext::trash_mark_kill_order;
        creators["aq40 trash backpull"] = &RaidAq40ActionContext::trash_backpull;
        creators["aq40 trash spread"] = &RaidAq40ActionContext::trash_spread;
        creators["aq40 trash stack for meteor"] = &RaidAq40ActionContext::trash_stack_for_meteor;
        creators["aq40 trash focus mindslayer"] = &RaidAq40ActionContext::trash_focus_mindslayer;
        creators["viscidus frost resistance action"] = &RaidAq40ActionContext::viscidus_frost_resistance_action;
        creators["princess huhuran nature resistance action"] = &RaidAq40ActionContext::huhuran_nature_resistance_action;
    }

private:
    static Action* skeram_cc_mind_control(PlayerbotAI* ai) { return new Aq40SkeramCcMindControlAction(ai); }
    static Action* skeram_move_to_assigned_platform(PlayerbotAI* ai) { return new Aq40SkeramMoveToAssignedPlatformAction(ai); }
    static Action* skeram_interrupt_arcane_explosion(PlayerbotAI* ai) { return new Aq40SkeramInterruptArcaneExplosionAction(ai); }
    static Action* skeram_move_from_arcane_explosion(PlayerbotAI* ai) { return new Aq40SkeramMoveFromArcaneExplosionAction(ai); }
    static Action* skeram_attack_split_target(PlayerbotAI* ai) { return new Aq40SkeramAttackSplitTargetAction(ai); }
    static Action* skeram_move_from_melee_clump(PlayerbotAI* ai) { return new Aq40SkeramMoveFromMeleeClumpAction(ai); }
    static Action* bug_trio_attack_kri(PlayerbotAI* ai) { return new Aq40BugTrioAttackKriAction(ai); }
    static Action* bug_trio_interrupt_yauj(PlayerbotAI* ai) { return new Aq40BugTrioInterruptYaujAction(ai); }
    static Action* bug_trio_move_from_kri_cloud(PlayerbotAI* ai) { return new Aq40BugTrioMoveFromKriCloudAction(ai); }
    static Action* bug_trio_aoe_spawn_bugs(PlayerbotAI* ai) { return new Aq40BugTrioAoeSpawnBugsAction(ai); }
    static Action* bug_trio_spread_from_fear(PlayerbotAI* ai) { return new Aq40BugTrioSpreadFromFearAction(ai); }
    static Action* sartura_kite_to_perimeter(PlayerbotAI* ai) { return new Aq40SarturaKiteToPerimeterAction(ai); }
    static Action* sartura_attack_guard(PlayerbotAI* ai) { return new Aq40SarturaAttackGuardAction(ai); }
    static Action* sartura_move_from_tunnel(PlayerbotAI* ai) { return new Aq40SarturaMoveFromTunnelAction(ai); }
    static Action* fankriss_attack_worm(PlayerbotAI* ai) { return new Aq40FankrissAttackWormAction(ai); }
    static Action* fankriss_gather_hatchlings(PlayerbotAI* ai) { return new Aq40FankrissGatherHatchlingsAction(ai); }
    static Action* fankriss_help_teleported_player(PlayerbotAI* ai) { return new Aq40FankrissHelpTeleportedPlayerAction(ai); }
    static Action* fankriss_swap_tanks(PlayerbotAI* ai) { return new Aq40FankrissSwapTanksAction(ai); }
    static Action* viscidus_cleanse_poison(PlayerbotAI* ai) { return new Aq40ViscidusCleansePoisonAction(ai); }
    static Action* viscidus_use_frost_attacks(PlayerbotAI* ai) { return new Aq40ViscidusUseFrostAttacksAction(ai); }
    static Action* viscidus_melee_shatter(PlayerbotAI* ai) { return new Aq40ViscidusMeleeShatterAction(ai); }
    static Action* viscidus_attack_nearest_glob(PlayerbotAI* ai) { return new Aq40ViscidusAttackNearestGlobAction(ai); }
    static Action* huhuran_tranq_shot(PlayerbotAI* ai) { return new Aq40HuhuranTranqShotAction(ai); }
    static Action* huhuran_move_to_soaker_ring(PlayerbotAI* ai) { return new Aq40HuhuranMoveToSoakerRingAction(ai); }
    static Action* huhuran_spread_outer_ring(PlayerbotAI* ai) { return new Aq40HuhuranSpreadOuterRingAction(ai); }
    static Action* huhuran_selective_wyvern_dispel(PlayerbotAI* ai) { return new Aq40HuhuranSelectiveWyvernDispelAction(ai); }
    static Action* twins_move_from_veklor_melee(PlayerbotAI* ai) { return new Aq40TwinsMoveFromVeklorMeleeAction(ai); }
    static Action* twins_pick_up_emperor_after_teleport(PlayerbotAI* ai) { return new Aq40TwinsPickUpEmperorAfterTeleportAction(ai); }
    static Action* twins_control_mutate_bug(PlayerbotAI* ai) { return new Aq40TwinsControlMutateBugAction(ai); }
    static Action* twins_kill_explode_bug(PlayerbotAI* ai) { return new Aq40TwinsKillExplodeBugAction(ai); }
    static Action* twins_attack_assigned_emperor(PlayerbotAI* ai) { return new Aq40TwinsAttackAssignedEmperorAction(ai); }
    static Action* ouro_move_from_frontal(PlayerbotAI* ai) { return new Aq40OuroMoveFromFrontalAction(ai); }
    static Action* ouro_regroup_center(PlayerbotAI* ai) { return new Aq40OuroRegroupCenterAction(ai); }
    static Action* ouro_spread_for_resurfacing(PlayerbotAI* ai) { return new Aq40OuroSpreadForResurfacingAction(ai); }
    static Action* ouro_kill_scarabs(PlayerbotAI* ai) { return new Aq40OuroKillScarabsAction(ai); }
    static Action* ouro_burn(PlayerbotAI* ai) { return new Aq40OuroBurnAction(ai); }
    static Action* cthun_spread_ring(PlayerbotAI* ai) { return new Aq40CthunSpreadRingAction(ai); }
    static Action* cthun_rotate_dark_glare(PlayerbotAI* ai) { return new Aq40CthunRotateDarkGlareAction(ai); }
    static Action* cthun_attack_eye_tentacle(PlayerbotAI* ai) { return new Aq40CthunAttackEyeTentacleAction(ai); }
    static Action* cthun_attack_giant_eye(PlayerbotAI* ai) { return new Aq40CthunAttackGiantEyeAction(ai); }
    static Action* cthun_attack_giant_claw(PlayerbotAI* ai) { return new Aq40CthunAttackGiantClawAction(ai); }
    static Action* cthun_stomach_attack_flesh(PlayerbotAI* ai) { return new Aq40CthunStomachAttackFleshAction(ai); }
    static Action* cthun_burn_body(PlayerbotAI* ai) { return new Aq40CthunBurnBodyAction(ai); }
    static Action* trash_mark_kill_order(PlayerbotAI* ai) { return new Aq40TrashMarkKillOrderAction(ai); }
    static Action* trash_backpull(PlayerbotAI* ai) { return new Aq40TrashBackpullAction(ai); }
    static Action* trash_spread(PlayerbotAI* ai) { return new Aq40TrashSpreadAction(ai); }
    static Action* trash_stack_for_meteor(PlayerbotAI* ai) { return new Aq40TrashStackForMeteorAction(ai); }
    static Action* trash_focus_mindslayer(PlayerbotAI* ai) { return new Aq40TrashFocusMindslayerAction(ai); }
    static Action* viscidus_frost_resistance_action(PlayerbotAI* ai) { return new BossFrostResistanceAction(ai, "viscidus"); }
    static Action* huhuran_nature_resistance_action(PlayerbotAI* ai) { return new BossNatureResistanceAction(ai, "princess huhuran"); }
};

#endif
