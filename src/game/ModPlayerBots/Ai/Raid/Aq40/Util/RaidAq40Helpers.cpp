#include "RaidAq40Helpers.h"

#include "Playerbots.h"
#include "../../RaidBossHelpers.h"

#include <limits>
#include <string>
#include <set>

char* strstri(char const* str1, char const* str2);

using namespace Aq40Helpers;

bool IsInAq40(PlayerbotAI* botAI)
{
    Player* bot = botAI ? botAI->GetBot() : nullptr;
    return bot && bot->GetMapId() == MAP_AQ40;
}

Unit* GetFirstAliveByEntry(PlayerbotAI* botAI, uint32 entry, bool requireInCombat)
{
    return ::GetFirstAliveUnitByEntry(botAI, entry, requireInCombat);
}

Unit* GetNearestAliveByEntry(PlayerbotAI* botAI, uint32 entry)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || !unit->IsAlive() || unit->GetEntry() != entry)
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetNearestUnitByEntry(PlayerbotAI* botAI, uint32 entry)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || unit->GetEntry() != entry)
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetNearestAliveByEntries(PlayerbotAI* botAI, std::initializer_list<uint32> entries)
{
    if (!botAI)
        return nullptr;

    std::set<uint32> const allowedEntries(entries.begin(), entries.end());
    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || !unit->IsAlive() || !allowedEntries.count(unit->GetEntry()))
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetAq40Boss(PlayerbotAI* botAI, std::string const& bossName, std::initializer_list<uint32> entries)
{
    if (!botAI || !IsInAq40(botAI))
        return nullptr;

    if (Unit* boss = botAI->GetAiObjectContext()->GetValue<Unit*>("find target", bossName)->Get())
        return boss;

    for (uint32 entry : entries)
    {
        if (Unit* boss = GetFirstAliveByEntry(botAI, entry))
            return boss;
    }

    return nullptr;
}

Unit* GetSkeram(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "the prophet skeram", {NPC_THE_PROPHET_SKERAM});
}

Unit* GetSartura(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "battleguard sartura", {NPC_BATTLEGUARD_SARTURA});
}

Unit* GetFankriss(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "fankriss the unyielding", {NPC_FANKRISS_THE_UNYIELDING});
}

Unit* GetViscidus(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "viscidus", {NPC_VISCIDUS});
}

Unit* GetHuhuran(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "princess huhuran", {NPC_PRINCESS_HUHURAN});
}

Unit* GetVeknilash(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "emperor vek'nilash", {NPC_VEKNILASH});
}

Unit* GetVeklor(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "emperor vek'lor", {NPC_VEKLOR});
}

Unit* GetOuro(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "ouro", {NPC_OURO});
}

Unit* GetOuroTrigger(PlayerbotAI* botAI)
{
    return GetNearestUnitByEntry(botAI, NPC_OURO_TRIGGER);
}

Unit* GetEyeOfCthun(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "eye of c'thun", {NPC_EYE_OF_CTHUN});
}

Unit* GetCthunBody(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "cthun", {NPC_CTHUN});
}

Unit* GetPrincessYauj(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "princess yauj", {NPC_PRINCESS_YAUJ});
}

Unit* GetLordKri(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "lord kri", {NPC_LORD_KRI});
}

Unit* GetVem(PlayerbotAI* botAI)
{
    return GetAq40Boss(botAI, "vem", {NPC_VEM});
}

Unit* GetPriorityBugTrioTarget(PlayerbotAI* botAI)
{
    if (Unit* kri = GetLordKri(botAI))
        return kri;
    if (Unit* yauj = GetPrincessYauj(botAI))
        return yauj;
    return GetVem(botAI);
}

Unit* GetNearestYaujBrood(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_YAUJ_BROOD);
}

Unit* GetNearestSarturaRoyalGuard(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_SARTURAS_ROYAL_GUARD);
}

Unit* GetNearestSpawnOfFankriss(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_SPAWN_OF_FANKRISS);
}

Unit* GetNearestViscidusGlob(PlayerbotAI* botAI)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || !unit->IsAlive() || unit->GetEntry() != NPC_GLOB_OF_VISCIDUS)
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetNearestTwinBug(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntries(botAI, {NPC_QIRAJI_SCARAB, NPC_QIRAJI_SCORPION});
}

Unit* GetNearestMutatedTwinBug(PlayerbotAI* botAI)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || !unit->IsAlive() || !IsTwinBugMutated(unit))
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetNearestExplodingTwinBug(PlayerbotAI* botAI)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Unit* bestUnit = nullptr;
    float bestDistance = std::numeric_limits<float>::max();
    auto const& npcs = botAI->GetAiObjectContext()->GetValue<GuidVector>("nearest npcs")->Get();
    for (ObjectGuid const& npcGuid : npcs)
    {
        Unit* unit = botAI->GetUnit(npcGuid);
        if (!unit || !unit->IsAlive() || !IsTwinBugExploding(unit))
            continue;

        float const distance = bot->GetExactDist2d(unit);
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestUnit = unit;
        }
    }

    return bestUnit;
}

Unit* GetNearestOuroScarab(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_OURO_SCARAB);
}

Unit* GetNearestEyeTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_EYE_TENTACLE);
}

Unit* GetNearestClawTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_CLAW_TENTACLE);
}

Unit* GetNearestGiantEyeTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_GIANT_EYE_TENTACLE);
}

Unit* GetNearestGiantClawTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_GIANT_CLAW_TENTACLE);
}

Unit* GetNearestFleshTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntry(botAI, NPC_FLESH_TENTACLE);
}

Unit* GetNearestCthunSurfaceTentacle(PlayerbotAI* botAI)
{
    return GetNearestAliveByEntries(botAI, {NPC_GIANT_EYE_TENTACLE, NPC_GIANT_CLAW_TENTACLE, NPC_EYE_TENTACLE, NPC_CLAW_TENTACLE});
}

Unit* GetNearestCthunTrashPriorityTarget(PlayerbotAI* botAI)
{
    if (Unit* mindslayer = GetNearestAliveByEntry(botAI, NPC_QIRAJI_MINDSLAYER))
        return mindslayer;
    if (Unit* champion = GetNearestAliveByEntry(botAI, NPC_QIRAJI_CHAMPION))
        return champion;
    if (Unit* slayer = GetNearestAliveByEntry(botAI, NPC_QIRAJI_SLAYER))
        return slayer;
    if (Unit* nullifier = GetNearestAliveByEntry(botAI, NPC_OBSIDIAN_NULLIFIER))
        return nullifier;
    if (Unit* warder = GetNearestAliveByEntry(botAI, NPC_ANUBISATH_WARDER))
        return warder;
    return GetNearestAliveByEntry(botAI, NPC_ANUBISATH_SENTINEL);
}

Unit* GetAssignedTwinEmperor(PlayerbotAI* botAI, Player* player)
{
    if (!botAI || !player)
        return nullptr;

    return IsTwinEmpsLeftSide(botAI, player) ? GetVeknilash(botAI) : GetVeklor(botAI);
}

Player* GetNearestCharmedRaidPlayer(PlayerbotAI* botAI)
{
    if (!botAI)
        return nullptr;

    Player* bot = botAI->GetBot();
    Group* group = bot ? bot->GetGroup() : nullptr;
    if (!group)
        return nullptr;

    Player* nearestCharmed = nullptr;
    float nearestDistance = std::numeric_limits<float>::max();
    for (GroupReference* ref = group->GetFirstMember(); ref; ref = ref->next())
    {
        Player* member = ref->GetSource();
        if (!member || !member->IsAlive() || member == bot || !member->IsCharmed() || member->GetMapId() != bot->GetMapId())
            continue;

        float const distance = bot->GetExactDist2d(member);
        if (distance < nearestDistance)
        {
            nearestDistance = distance;
            nearestCharmed = member;
        }
    }

    return nearestCharmed;
}

Player* GetNearestRaidMemberFarFromBoss(PlayerbotAI* botAI, Unit* boss, float minDistance)
{
    if (!botAI || !boss)
        return nullptr;

    Player* bot = botAI->GetBot();
    Group* group = bot ? bot->GetGroup() : nullptr;
    if (!group)
        return nullptr;

    Player* nearestMember = nullptr;
    float nearestDistance = std::numeric_limits<float>::max();
    for (GroupReference* ref = group->GetFirstMember(); ref; ref = ref->next())
    {
        Player* member = ref->GetSource();
        if (!member || !member->IsAlive() || member == bot || member->GetMapId() != bot->GetMapId())
            continue;

        if (boss->GetExactDist2d(member) < minDistance)
            continue;

        float const botDistance = bot->GetExactDist2d(member);
        if (botDistance < nearestDistance)
        {
            nearestDistance = botDistance;
            nearestMember = member;
        }
    }

    return nearestMember;
}

bool IsSkeramCastingArcaneExplosion(PlayerbotAI* botAI)
{
    Unit* boss = GetSkeram(botAI);
    if (!boss || !boss->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = boss->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo && currentSpell->m_spellInfo->Id == SPELL_SKERAM_ARCANE_EXPLOSION;
}

bool IsSarturaWhirlwinding(PlayerbotAI* botAI)
{
    Unit* sartura = GetSartura(botAI);
    if (!sartura)
        return false;

    if (sartura->HasAura(SPELL_SARTURA_WHIRLWIND) || sartura->HasAura(SPELL_SARTURA_WHIRLWIND_2))
        return true;

    if (!sartura->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = sartura->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo &&
           (currentSpell->m_spellInfo->Id == SPELL_SARTURA_WHIRLWIND || currentSpell->m_spellInfo->Id == SPELL_SARTURA_WHIRLWIND_2);
}

bool IsViscidusCastingPoisonVolley(PlayerbotAI* botAI)
{
    Unit* viscidus = GetViscidus(botAI);
    if (!viscidus || !viscidus->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = viscidus->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo &&
           (currentSpell->m_spellInfo->Id == SPELL_VISCIDUS_POISON_SHOCK ||
            currentSpell->m_spellInfo->Id == SPELL_VISCIDUS_POISONBOLT_VOLLEY);
}

bool IsViscidusFrozenPhase(PlayerbotAI* botAI)
{
    Unit* viscidus = GetViscidus(botAI);
    if (!viscidus)
        return false;

    return viscidus->HasAura(SPELL_VISCIDUS_SLOWED) || viscidus->HasAura(SPELL_VISCIDUS_SLOWED_MORE) ||
           viscidus->HasAura(SPELL_VISCIDUS_FREEZE);
}

bool IsViscidusShatterPhase(PlayerbotAI* botAI)
{
    Unit* viscidus = GetViscidus(botAI);
    if (!viscidus)
        return false;

    return IsViscidusFrozenPhase(botAI) && viscidus->GetHealthPct() <= 10.0f;
}

bool IsHuhuranFrenzied(PlayerbotAI* botAI)
{
    Unit* huhuran = GetHuhuran(botAI);
    return huhuran && (huhuran->HasAura(SPELL_HUHURAN_FRENZY) || huhuran->GetHealthPct() <= 31.0f);
}

bool IsHuhuranBerserk(PlayerbotAI* botAI)
{
    Unit* huhuran = GetHuhuran(botAI);
    return huhuran && (huhuran->HasAura(SPELL_HUHURAN_BERSERK) || huhuran->GetHealthPct() <= 30.0f);
}

bool IsTwinEmpsLeftSide(PlayerbotAI* botAI, Player* player)
{
    if (!botAI || !player)
        return false;

    if (PlayerbotAI::IsTank(player) || PlayerbotAI::IsMelee(player))
        return true;

    if (PlayerbotAI::IsRangedDps(player))
        return false;

    int32 slotIndex = botAI->GetGroupSlotIndex(player);
    return slotIndex < 0 || slotIndex % 2 == 0;
}

bool IsTwinEmpsRightSide(PlayerbotAI* botAI, Player* player)
{
    return botAI && player && !IsTwinEmpsLeftSide(botAI, player);
}

bool IsTwinBugMutated(Unit* unit)
{
    return unit && (unit->GetEntry() == NPC_QIRAJI_SCARAB || unit->GetEntry() == NPC_QIRAJI_SCORPION) &&
           unit->HasAura(SPELL_TWINS_MUTATE_BUG);
}

bool IsTwinBugExploding(Unit* unit)
{
    return unit && (unit->GetEntry() == NPC_QIRAJI_SCARAB || unit->GetEntry() == NPC_QIRAJI_SCORPION) &&
           unit->HasAura(SPELL_TWINS_EXPLODE_BUG);
}

bool IsOuroSubmerged(PlayerbotAI* botAI)
{
    Unit* ouro = GetOuro(botAI);
    return ouro && ouro->HasAura(SPELL_OURO_SUBMERGE_VISUAL);
}

bool IsOuroEnraged(PlayerbotAI* botAI)
{
    Unit* ouro = GetOuro(botAI);
    return ouro && (ouro->HasAura(SPELL_OURO_BERSERK) || ouro->GetHealthPct() < 20.0f);
}

bool IsCthunDarkGlareActive(PlayerbotAI* botAI)
{
    Unit* eye = GetEyeOfCthun(botAI);
    if (!eye)
        return false;

    if (eye->HasAura(SPELL_CTHUN_ROTATE_NEGATIVE_360) || eye->HasAura(SPELL_CTHUN_ROTATE_POSITIVE_360))
        return true;

    if (eye->HasAura(SPELL_CTHUN_FREEZE_ANIMATION))
        return true;

    if (!eye->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = eye->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo && currentSpell->m_spellInfo->Id == SPELL_CTHUN_ROTATE_TRIGGER;
}

bool IsCthunVulnerable(PlayerbotAI* botAI)
{
    Unit* cthun = GetCthunBody(botAI);
    return cthun && (cthun->HasAura(SPELL_CTHUN_VULNERABLE) || !cthun->HasAura(SPELL_CTHUN_CARAPACE));
}

bool IsPlayerInCthunStomach(Player* player)
{
    return player && (player->HasAura(SPELL_CTHUN_MOUTH_TENTACLE) || player->GetPositionZ() < CTHUN_STOMACH_Z_THRESHOLD);
}

bool IsAssignedStomachTeam(PlayerbotAI* botAI, Player* player)
{
    if (!botAI || !player || PlayerbotAI::IsTank(player) || PlayerbotAI::IsHeal(player))
        return false;

    if (!PlayerbotAI::IsRangedDps(player))
        return false;

    int32 slotIndex = botAI->GetGroupSlotIndex(player);
    return slotIndex >= 0 && slotIndex < 6;
}

bool IsPrincessYaujCastingHeal(PlayerbotAI* botAI)
{
    Unit* yauj = GetPrincessYauj(botAI);
    if (!yauj || !yauj->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = yauj->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo && currentSpell->m_spellInfo->Id == SPELL_PRINCESS_YAUJ_HEAL;
}

bool IsPrincessYaujCastingFear(PlayerbotAI* botAI)
{
    Unit* yauj = GetPrincessYauj(botAI);
    if (!yauj || !yauj->HasUnitState(UNIT_STATE_CASTING))
        return false;

    Spell* currentSpell = yauj->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    return currentSpell && currentSpell->m_spellInfo && currentSpell->m_spellInfo->Id == SPELL_PRINCESS_YAUJ_FEAR;
}

uint32 CountNearbyRaidMembers(PlayerbotAI* botAI, Unit* center, float radius, Player* exclude)
{
    if (!botAI || !center)
        return 0;

    Player* bot = botAI->GetBot();
    Group* group = bot ? bot->GetGroup() : nullptr;
    if (!group)
        return 0;

    uint32 count = 0;
    for (GroupReference* ref = group->GetFirstMember(); ref; ref = ref->next())
    {
        Player* member = ref->GetSource();
        if (!member || !member->IsAlive() || member == exclude || member->GetMapId() != center->GetMapId())
            continue;

        if (center->GetExactDist2d(member) <= radius)
            ++count;
    }

    return count;
}

bool IsPrimaryTank(PlayerbotAI* botAI, Player* player)
{
    return botAI && player && PlayerbotAI::IsMainTank(player);
}

bool IsAssignedSoaker(PlayerbotAI* botAI, Player* player)
{
    if (!botAI || !player)
        return false;

    if (PlayerbotAI::IsTank(player))
        return true;

    if (PlayerbotAI::IsMelee(player) && PlayerbotAI::IsDps(player))
        return true;

    return player->getClass() == CLASS_HUNTER;
}
