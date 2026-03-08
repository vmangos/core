#ifndef _PLAYERBOT_RAIDAQ40TRIGGERCONTEXT_H
#define _PLAYERBOT_RAIDAQ40TRIGGERCONTEXT_H

#include "AiObjectContext.h"
#include "BossAuraTriggers.h"
#include "NamedObjectContext.h"
#include "RaidAq40Triggers.h"

class RaidAq40TriggerContext : public NamedObjectContext<Trigger>
{
public:
    RaidAq40TriggerContext()
    {
        creators["aq40 skeram mind control"] = &RaidAq40TriggerContext::skeram_mind_control;
        creators["aq40 skeram blink"] = &RaidAq40TriggerContext::skeram_blink;
        creators["aq40 skeram split"] = &RaidAq40TriggerContext::skeram_split;
        creators["aq40 skeram arcane explosion"] = &RaidAq40TriggerContext::skeram_arcane_explosion;
        creators["aq40 skeram too many melee"] = &RaidAq40TriggerContext::skeram_too_many_melee;
        creators["aq40 bug trio kill order"] = &RaidAq40TriggerContext::bug_trio_kill_order;
        creators["aq40 bug trio yauj heal"] = &RaidAq40TriggerContext::bug_trio_yauj_heal;
        creators["aq40 bug trio yauj fear"] = &RaidAq40TriggerContext::bug_trio_yauj_fear;
        creators["aq40 bug trio kri cloud"] = &RaidAq40TriggerContext::bug_trio_kri_cloud;
        creators["aq40 bug trio yauj spawn bugs"] = &RaidAq40TriggerContext::bug_trio_yauj_spawn_bugs;
        creators["aq40 sartura whirlwind"] = &RaidAq40TriggerContext::sartura_whirlwind;
        creators["aq40 sartura being chased"] = &RaidAq40TriggerContext::sartura_being_chased;
        creators["aq40 sartura guard alive"] = &RaidAq40TriggerContext::sartura_guard_alive;
        creators["aq40 sartura near tunnel"] = &RaidAq40TriggerContext::sartura_near_tunnel;
        creators["aq40 fankriss worm spawn"] = &RaidAq40TriggerContext::fankriss_worm_spawn;
        creators["aq40 fankriss hatchling overload"] = &RaidAq40TriggerContext::fankriss_hatchling_overload;
        creators["aq40 fankriss mortal wound swap"] = &RaidAq40TriggerContext::fankriss_mortal_wound_swap;
        creators["aq40 fankriss teleported player"] = &RaidAq40TriggerContext::fankriss_teleported_player;
        creators["aq40 viscidus poison volley"] = &RaidAq40TriggerContext::viscidus_poison_volley;
        creators["aq40 viscidus toxin cloud"] = &RaidAq40TriggerContext::viscidus_toxin_cloud;
        creators["aq40 viscidus freeze phase"] = &RaidAq40TriggerContext::viscidus_freeze_phase;
        creators["aq40 viscidus shatter phase"] = &RaidAq40TriggerContext::viscidus_shatter_phase;
        creators["aq40 viscidus glob phase"] = &RaidAq40TriggerContext::viscidus_glob_phase;
        creators["aq40 huhuran frenzy"] = &RaidAq40TriggerContext::huhuran_frenzy;
        creators["aq40 huhuran berserk soon"] = &RaidAq40TriggerContext::huhuran_berserk_soon;
        creators["aq40 huhuran berserk"] = &RaidAq40TriggerContext::huhuran_berserk;
        creators["aq40 huhuran wyvern sting on tank"] = &RaidAq40TriggerContext::huhuran_wyvern_sting_on_tank;
        creators["aq40 huhuran inner ring missing"] = &RaidAq40TriggerContext::huhuran_inner_ring_missing;
        creators["aq40 twins veklor melee danger"] = &RaidAq40TriggerContext::twins_veklor_melee_danger;
        creators["aq40 twins teleport"] = &RaidAq40TriggerContext::twins_teleport;
        creators["aq40 twins bug mutate"] = &RaidAq40TriggerContext::twins_bug_mutate;
        creators["aq40 twins bug explode"] = &RaidAq40TriggerContext::twins_bug_explode;
        creators["aq40 twins wrong emperor target"] = &RaidAq40TriggerContext::twins_wrong_emperor_target;
        creators["aq40 ouro frontal danger"] = &RaidAq40TriggerContext::ouro_frontal_danger;
        creators["aq40 ouro submerge"] = &RaidAq40TriggerContext::ouro_submerge;
        creators["aq40 ouro resurfacing"] = &RaidAq40TriggerContext::ouro_resurfacing;
        creators["aq40 ouro scarab spawn"] = &RaidAq40TriggerContext::ouro_scarab_spawn;
        creators["aq40 ouro enrage"] = &RaidAq40TriggerContext::ouro_enrage;
        creators["aq40 cthun eye beam danger"] = &RaidAq40TriggerContext::cthun_eye_beam_danger;
        creators["aq40 cthun dark glare"] = &RaidAq40TriggerContext::cthun_dark_glare;
        creators["aq40 cthun eye tentacle"] = &RaidAq40TriggerContext::cthun_eye_tentacle;
        creators["aq40 cthun claw tentacle"] = &RaidAq40TriggerContext::cthun_claw_tentacle;
        creators["aq40 cthun giant eye tentacle"] = &RaidAq40TriggerContext::cthun_giant_eye_tentacle;
        creators["aq40 cthun giant claw tentacle"] = &RaidAq40TriggerContext::cthun_giant_claw_tentacle;
        creators["aq40 cthun swallowed"] = &RaidAq40TriggerContext::cthun_swallowed;
        creators["aq40 cthun flesh tentacle"] = &RaidAq40TriggerContext::cthun_flesh_tentacle;
        creators["aq40 cthun vulnerability"] = &RaidAq40TriggerContext::cthun_vulnerability;
        creators["aq40 trash sentinel pack"] = &RaidAq40TriggerContext::trash_sentinel_pack;
        creators["aq40 trash nullify danger"] = &RaidAq40TriggerContext::trash_nullify_danger;
        creators["aq40 trash fire nova danger"] = &RaidAq40TriggerContext::trash_fire_nova_danger;
        creators["aq40 trash mindslayer mind control"] = &RaidAq40TriggerContext::trash_mindslayer_mind_control;
        creators["aq40 trash slayer whirlwind"] = &RaidAq40TriggerContext::trash_slayer_whirlwind;
        creators["aq40 trash plague"] = &RaidAq40TriggerContext::trash_plague;
        creators["viscidus frost resistance trigger"] = &RaidAq40TriggerContext::viscidus_frost_resistance_trigger;
        creators["princess huhuran nature resistance trigger"] = &RaidAq40TriggerContext::huhuran_nature_resistance_trigger;
    }

private:
    static Trigger* skeram_mind_control(PlayerbotAI* ai) { return new Aq40SkeramMindControlTrigger(ai); }
    static Trigger* skeram_blink(PlayerbotAI* ai) { return new Aq40SkeramBlinkTrigger(ai); }
    static Trigger* skeram_split(PlayerbotAI* ai) { return new Aq40SkeramSplitTrigger(ai); }
    static Trigger* skeram_arcane_explosion(PlayerbotAI* ai) { return new Aq40SkeramArcaneExplosionTrigger(ai); }
    static Trigger* skeram_too_many_melee(PlayerbotAI* ai) { return new Aq40SkeramTooManyMeleeTrigger(ai); }
    static Trigger* bug_trio_kill_order(PlayerbotAI* ai) { return new Aq40BugTrioKillOrderTrigger(ai); }
    static Trigger* bug_trio_yauj_heal(PlayerbotAI* ai) { return new Aq40BugTrioYaujHealTrigger(ai); }
    static Trigger* bug_trio_yauj_fear(PlayerbotAI* ai) { return new Aq40BugTrioYaujFearTrigger(ai); }
    static Trigger* bug_trio_kri_cloud(PlayerbotAI* ai) { return new Aq40BugTrioKriCloudTrigger(ai); }
    static Trigger* bug_trio_yauj_spawn_bugs(PlayerbotAI* ai) { return new Aq40BugTrioYaujSpawnBugsTrigger(ai); }
    static Trigger* sartura_whirlwind(PlayerbotAI* ai) { return new Aq40SarturaWhirlwindTrigger(ai); }
    static Trigger* sartura_being_chased(PlayerbotAI* ai) { return new Aq40SarturaBeingChasedTrigger(ai); }
    static Trigger* sartura_guard_alive(PlayerbotAI* ai) { return new Aq40SarturaGuardAliveTrigger(ai); }
    static Trigger* sartura_near_tunnel(PlayerbotAI* ai) { return new Aq40SarturaNearTunnelTrigger(ai); }
    static Trigger* fankriss_worm_spawn(PlayerbotAI* ai) { return new Aq40FankrissWormSpawnTrigger(ai); }
    static Trigger* fankriss_hatchling_overload(PlayerbotAI* ai) { return new Aq40FankrissHatchlingOverloadTrigger(ai); }
    static Trigger* fankriss_mortal_wound_swap(PlayerbotAI* ai) { return new Aq40FankrissMortalWoundSwapTrigger(ai); }
    static Trigger* fankriss_teleported_player(PlayerbotAI* ai) { return new Aq40FankrissTeleportedPlayerTrigger(ai); }
    static Trigger* viscidus_poison_volley(PlayerbotAI* ai) { return new Aq40ViscidusPoisonVolleyTrigger(ai); }
    static Trigger* viscidus_toxin_cloud(PlayerbotAI* ai) { return new Aq40ViscidusToxinCloudTrigger(ai); }
    static Trigger* viscidus_freeze_phase(PlayerbotAI* ai) { return new Aq40ViscidusFreezePhaseTrigger(ai); }
    static Trigger* viscidus_shatter_phase(PlayerbotAI* ai) { return new Aq40ViscidusShatterPhaseTrigger(ai); }
    static Trigger* viscidus_glob_phase(PlayerbotAI* ai) { return new Aq40ViscidusGlobPhaseTrigger(ai); }
    static Trigger* huhuran_frenzy(PlayerbotAI* ai) { return new Aq40HuhuranFrenzyTrigger(ai); }
    static Trigger* huhuran_berserk_soon(PlayerbotAI* ai) { return new Aq40HuhuranBerserkSoonTrigger(ai); }
    static Trigger* huhuran_berserk(PlayerbotAI* ai) { return new Aq40HuhuranBerserkTrigger(ai); }
    static Trigger* huhuran_wyvern_sting_on_tank(PlayerbotAI* ai) { return new Aq40HuhuranWyvernStingOnTankTrigger(ai); }
    static Trigger* huhuran_inner_ring_missing(PlayerbotAI* ai) { return new Aq40HuhuranInnerRingMissingTrigger(ai); }
    static Trigger* twins_veklor_melee_danger(PlayerbotAI* ai) { return new Aq40TwinsVeklorMeleeDangerTrigger(ai); }
    static Trigger* twins_teleport(PlayerbotAI* ai) { return new Aq40TwinsTeleportTrigger(ai); }
    static Trigger* twins_bug_mutate(PlayerbotAI* ai) { return new Aq40TwinsBugMutateTrigger(ai); }
    static Trigger* twins_bug_explode(PlayerbotAI* ai) { return new Aq40TwinsBugExplodeTrigger(ai); }
    static Trigger* twins_wrong_emperor_target(PlayerbotAI* ai) { return new Aq40TwinsWrongEmperorTargetTrigger(ai); }
    static Trigger* ouro_frontal_danger(PlayerbotAI* ai) { return new Aq40OuroFrontalDangerTrigger(ai); }
    static Trigger* ouro_submerge(PlayerbotAI* ai) { return new Aq40OuroSubmergeTrigger(ai); }
    static Trigger* ouro_resurfacing(PlayerbotAI* ai) { return new Aq40OuroResurfacingTrigger(ai); }
    static Trigger* ouro_scarab_spawn(PlayerbotAI* ai) { return new Aq40OuroScarabSpawnTrigger(ai); }
    static Trigger* ouro_enrage(PlayerbotAI* ai) { return new Aq40OuroEnrageTrigger(ai); }
    static Trigger* cthun_eye_beam_danger(PlayerbotAI* ai) { return new Aq40CthunEyeBeamDangerTrigger(ai); }
    static Trigger* cthun_dark_glare(PlayerbotAI* ai) { return new Aq40CthunDarkGlareTrigger(ai); }
    static Trigger* cthun_eye_tentacle(PlayerbotAI* ai) { return new Aq40CthunEyeTentacleTrigger(ai); }
    static Trigger* cthun_claw_tentacle(PlayerbotAI* ai) { return new Aq40CthunClawTentacleTrigger(ai); }
    static Trigger* cthun_giant_eye_tentacle(PlayerbotAI* ai) { return new Aq40CthunGiantEyeTentacleTrigger(ai); }
    static Trigger* cthun_giant_claw_tentacle(PlayerbotAI* ai) { return new Aq40CthunGiantClawTentacleTrigger(ai); }
    static Trigger* cthun_swallowed(PlayerbotAI* ai) { return new Aq40CthunSwallowedTrigger(ai); }
    static Trigger* cthun_flesh_tentacle(PlayerbotAI* ai) { return new Aq40CthunFleshTentacleTrigger(ai); }
    static Trigger* cthun_vulnerability(PlayerbotAI* ai) { return new Aq40CthunVulnerabilityTrigger(ai); }
    static Trigger* trash_sentinel_pack(PlayerbotAI* ai) { return new Aq40TrashSentinelPackTrigger(ai); }
    static Trigger* trash_nullify_danger(PlayerbotAI* ai) { return new Aq40TrashNullifyDangerTrigger(ai); }
    static Trigger* trash_fire_nova_danger(PlayerbotAI* ai) { return new Aq40TrashFireNovaDangerTrigger(ai); }
    static Trigger* trash_mindslayer_mind_control(PlayerbotAI* ai) { return new Aq40TrashMindslayerMindControlTrigger(ai); }
    static Trigger* trash_slayer_whirlwind(PlayerbotAI* ai) { return new Aq40TrashSlayerWhirlwindTrigger(ai); }
    static Trigger* trash_plague(PlayerbotAI* ai) { return new Aq40TrashPlagueTrigger(ai); }
    static Trigger* viscidus_frost_resistance_trigger(PlayerbotAI* ai) { return new BossFrostResistanceTrigger(ai, "viscidus"); }
    static Trigger* huhuran_nature_resistance_trigger(PlayerbotAI* ai) { return new BossNatureResistanceTrigger(ai, "princess huhuran"); }
};

#endif
