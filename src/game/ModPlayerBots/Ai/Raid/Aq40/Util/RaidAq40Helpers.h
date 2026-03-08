#ifndef _PLAYERBOT_RAIDAQ40HELPERS_H
#define _PLAYERBOT_RAIDAQ40HELPERS_H

#include <initializer_list>
#include <string>

#include "Player.h"
#include "PlayerbotAI.h"
#include "Unit.h"

namespace Aq40Helpers
{
enum Aq40NpcIds
{
    NPC_THE_PROPHET_SKERAM = 15263,
    NPC_VEKNILASH = 15275,
    NPC_VEKLOR = 15276,
    NPC_FANKRISS_THE_UNYIELDING = 15510,
    NPC_LORD_KRI = 15511,
    NPC_PRINCESS_HUHURAN = 15509,
    NPC_BATTLEGUARD_SARTURA = 15516,
    NPC_OURO = 15517,
    NPC_VISCIDUS = 15299,
    NPC_QIRAJI_SCARAB = 15316,
    NPC_QIRAJI_SCORPION = 15317,
    NPC_GIANT_EYE_TENTACLE = 15334,
    NPC_GLOB_OF_VISCIDUS = 15667,
    NPC_SARTURAS_ROYAL_GUARD = 15984,
    NPC_PRINCESS_YAUJ = 15543,
    NPC_VEM = 15544,
    NPC_EYE_OF_CTHUN = 15589,
    NPC_YAUJ_BROOD = 15621,
    NPC_CLAW_TENTACLE = 15725,
    NPC_EYE_TENTACLE = 15726,
    NPC_CTHUN = 15727,
    NPC_GIANT_CLAW_TENTACLE = 15728,
    NPC_SPAWN_OF_FANKRISS = 15630,
    NPC_FLESH_TENTACLE = 15802,
    NPC_CTHUN_PORTAL = 15896,
    NPC_OURO_TRIGGER = 15717,
    NPC_OURO_SCARAB = 15718,
    NPC_QIRAJI_MINDSLAYER = 15246,
    NPC_QIRAJI_SLAYER = 15250,
    NPC_QIRAJI_CHAMPION = 15252,
    NPC_ANUBISATH_SENTINEL = 15264,
    NPC_ANUBISATH_WARDER = 15311,
    NPC_OBSIDIAN_NULLIFIER = 15312,
};

enum Aq40SpellIds
{
    SPELL_SKERAM_ARCANE_EXPLOSION = 26192,
    SPELL_SKERAM_TRUE_FULFILLMENT = 785,
    SPELL_PRINCESS_YAUJ_HEAL = 25807,
    SPELL_PRINCESS_YAUJ_FEAR = 26580,
    SPELL_SARTURA_WHIRLWIND = 26083,
    SPELL_SARTURA_WHIRLWIND_2 = 26084,
    SPELL_VISCIDUS_POISON_SHOCK = 25993,
    SPELL_VISCIDUS_POISONBOLT_VOLLEY = 25991,
    SPELL_VISCIDUS_SLOWED = 26034,
    SPELL_VISCIDUS_SLOWED_MORE = 26036,
    SPELL_VISCIDUS_FREEZE = 25937,
    SPELL_HUHURAN_FRENZY = 26051,
    SPELL_HUHURAN_BERSERK = 26068,
    SPELL_HUHURAN_WYVERN_STING = 26180,
    SPELL_TWINS_TELEPORT = 800,
    SPELL_TWINS_MUTATE_BUG = 802,
    SPELL_TWINS_ARCANE_BURST = 568,
    SPELL_TWINS_EXPLODE_BUG = 804,
    SPELL_OURO_SANDBLAST = 26102,
    SPELL_OURO_SWEEP = 26103,
    SPELL_OURO_SUBMERGE_VISUAL = 26063,
    SPELL_OURO_BERSERK = 26615,
    SPELL_CTHUN_GREEN_EYE_BEAM = 26134,
    SPELL_CTHUN_ROTATE_TRIGGER = 26137,
    SPELL_CTHUN_ROTATE_NEGATIVE_360 = 26136,
    SPELL_CTHUN_ROTATE_POSITIVE_360 = 26009,
    SPELL_CTHUN_FREEZE_ANIMATION = 16245,
    SPELL_CTHUN_CARAPACE = 26156,
    SPELL_CTHUN_VULNERABLE = 26235,
    SPELL_CTHUN_MOUTH_TENTACLE = 26332,
    SPELL_QIRAJI_MIND_FLAY = 26044,
    SPELL_QIRAJI_MIND_BLAST = 26048,
    SPELL_QIRAJI_MANA_BURN = 26049,
    SPELL_QIRAJI_INSANITY = 26079,
    SPELL_NULLIFIER_DRAIN_MANA = 26559,
    SPELL_ERADICATOR_DRAIN_MANA = 26457,
    SPELL_SENTINEL_STORM = 26546,
};

static constexpr uint32 MAP_AQ40 = 531;
static constexpr float SKERAM_ARCANE_EXPLOSION_DISTANCE = 26.0f;
static constexpr float SKERAM_MELEE_STACK_RADIUS = 8.0f;
static constexpr float BUG_TRIO_BROOD_RADIUS = 60.0f;
static constexpr float SARTURA_WHIRLWIND_DISTANCE = 14.0f;
static constexpr float SARTURA_TUNNEL_DISTANCE = 32.0f;
static constexpr float FANKRISS_TELEPORT_DISTANCE = 45.0f;
static constexpr float TWINS_VEKLOR_MELEE_DISTANCE = 10.0f;
static constexpr float TWINS_ASSIGNED_REPOSITION_DISTANCE = 30.0f;
static constexpr float OURO_FRONTAL_DANGER_DISTANCE = 18.0f;
static constexpr float OURO_RESURFACE_SPREAD_DISTANCE = 14.0f;
static constexpr float CTHUN_SPREAD_DISTANCE = 12.0f;
static constexpr float CTHUN_DARK_GLARE_DISTANCE = 20.0f;
static constexpr float CTHUN_STOMACH_Z_THRESHOLD = -30.0f;
}

bool IsInAq40(PlayerbotAI* botAI);
Unit* GetFirstAliveByEntry(PlayerbotAI* botAI, uint32 entry, bool requireInCombat = false);
Unit* GetNearestUnitByEntry(PlayerbotAI* botAI, uint32 entry);
Unit* GetNearestAliveByEntry(PlayerbotAI* botAI, uint32 entry);
Unit* GetNearestAliveByEntries(PlayerbotAI* botAI, std::initializer_list<uint32> entries);
Unit* GetAq40Boss(PlayerbotAI* botAI, std::string const& bossName, std::initializer_list<uint32> entries);
Unit* GetSkeram(PlayerbotAI* botAI);
Unit* GetSartura(PlayerbotAI* botAI);
Unit* GetFankriss(PlayerbotAI* botAI);
Unit* GetViscidus(PlayerbotAI* botAI);
Unit* GetHuhuran(PlayerbotAI* botAI);
Unit* GetVeknilash(PlayerbotAI* botAI);
Unit* GetVeklor(PlayerbotAI* botAI);
Unit* GetAssignedTwinEmperor(PlayerbotAI* botAI, Player* player);
Unit* GetOuro(PlayerbotAI* botAI);
Unit* GetOuroTrigger(PlayerbotAI* botAI);
Unit* GetEyeOfCthun(PlayerbotAI* botAI);
Unit* GetCthunBody(PlayerbotAI* botAI);
Unit* GetPrincessYauj(PlayerbotAI* botAI);
Unit* GetLordKri(PlayerbotAI* botAI);
Unit* GetVem(PlayerbotAI* botAI);
Unit* GetNearestSarturaRoyalGuard(PlayerbotAI* botAI);
Unit* GetNearestSpawnOfFankriss(PlayerbotAI* botAI);
Unit* GetNearestViscidusGlob(PlayerbotAI* botAI);
Unit* GetNearestTwinBug(PlayerbotAI* botAI);
Unit* GetNearestMutatedTwinBug(PlayerbotAI* botAI);
Unit* GetNearestExplodingTwinBug(PlayerbotAI* botAI);
Unit* GetNearestOuroScarab(PlayerbotAI* botAI);
Unit* GetNearestEyeTentacle(PlayerbotAI* botAI);
Unit* GetNearestClawTentacle(PlayerbotAI* botAI);
Unit* GetNearestGiantEyeTentacle(PlayerbotAI* botAI);
Unit* GetNearestGiantClawTentacle(PlayerbotAI* botAI);
Unit* GetNearestFleshTentacle(PlayerbotAI* botAI);
Unit* GetNearestCthunSurfaceTentacle(PlayerbotAI* botAI);
Unit* GetNearestCthunTrashPriorityTarget(PlayerbotAI* botAI);
Unit* GetPriorityBugTrioTarget(PlayerbotAI* botAI);
Unit* GetNearestYaujBrood(PlayerbotAI* botAI);
Player* GetNearestCharmedRaidPlayer(PlayerbotAI* botAI);
Player* GetNearestRaidMemberFarFromBoss(PlayerbotAI* botAI, Unit* boss, float minDistance);
bool IsSkeramCastingArcaneExplosion(PlayerbotAI* botAI);
bool IsSarturaWhirlwinding(PlayerbotAI* botAI);
bool IsViscidusCastingPoisonVolley(PlayerbotAI* botAI);
bool IsViscidusFrozenPhase(PlayerbotAI* botAI);
bool IsViscidusShatterPhase(PlayerbotAI* botAI);
bool IsHuhuranFrenzied(PlayerbotAI* botAI);
bool IsHuhuranBerserk(PlayerbotAI* botAI);
bool IsTwinEmpsLeftSide(PlayerbotAI* botAI, Player* player);
bool IsTwinEmpsRightSide(PlayerbotAI* botAI, Player* player);
bool IsTwinBugMutated(Unit* unit);
bool IsTwinBugExploding(Unit* unit);
bool IsOuroSubmerged(PlayerbotAI* botAI);
bool IsOuroEnraged(PlayerbotAI* botAI);
bool IsCthunDarkGlareActive(PlayerbotAI* botAI);
bool IsCthunVulnerable(PlayerbotAI* botAI);
bool IsPlayerInCthunStomach(Player* player);
bool IsAssignedStomachTeam(PlayerbotAI* botAI, Player* player);
bool IsPrincessYaujCastingHeal(PlayerbotAI* botAI);
bool IsPrincessYaujCastingFear(PlayerbotAI* botAI);
uint32 CountNearbyRaidMembers(PlayerbotAI* botAI, Unit* center, float radius, Player* exclude = nullptr);
bool IsPrimaryTank(PlayerbotAI* botAI, Player* player);
bool IsAssignedSoaker(PlayerbotAI* botAI, Player* player);

#endif
