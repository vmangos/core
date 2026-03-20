/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "AttackersValue.h"

#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Playerbots.h"
#include "ReputationMgr.h"
#include "ServerFacade.h"

GuidVector AttackersValue::Calculate()
{
    std::unordered_set<Unit*> targets;

    GuidVector result;
    if (!botAI->AllowActivity(ALL_ACTIVITY))
        return result;

    AddAttackersOf(bot, targets);

    if (Group* group = bot->GetGroup())
        AddAttackersOf(group, targets);

    RemoveNonThreating(targets);

    // prioritized target
    GuidVector prioritizedTargets = AI_VALUE(GuidVector, "prioritized targets");
    for (ObjectGuid target : prioritizedTargets)
    {
        Unit* unit = botAI->GetUnit(target);
        if (unit && IsValidTarget(unit, bot))
            targets.insert(unit);
    }
    if (Group* group = bot->GetGroup())
    {
        ObjectGuid skullGuid = group->GetTargetIcon(7);
        Unit* skullTarget = botAI->GetUnit(skullGuid);
        if (skullTarget && IsValidTarget(skullTarget, bot))
            targets.insert(skullTarget);
    }

    for (Unit* unit : targets)
        result.push_back(unit->GetObjectGuid());

    if (bot->m_duel && bot->m_duel->opponent)
        result.push_back(bot->m_duel->opponent->GetObjectGuid());

    // workaround for bots of same faction not fighting in arena
#if PB_HAS_ARENA_TEAMS
    if (bot->InArena())
    {
        GuidVector possibleTargets = AI_VALUE(GuidVector, "possible targets");
        for (ObjectGuid const guid : possibleTargets)
        {
            Unit* unit = botAI->GetUnit(guid);
            if (unit && unit->IsPlayer() && IsValidTarget(unit, bot))
                result.push_back(unit->GetGUID());
        }
    }
#endif

    return result;
}

void AttackersValue::AddAttackersOf(Group* group, std::unordered_set<Unit*>& targets)
{
    size_t const initialTargetCount = targets.size();

    Group::MemberSlotList const& groupSlot = group->GetMemberSlots();
    for (Group::member_citerator itr = groupSlot.begin(); itr != groupSlot.end(); itr++)
    {
        Player* member = ObjectAccessor::FindPlayer(itr->guid);
        if (!member || !member->IsAlive() || member == bot || member->GetMapId() != bot->GetMapId() ||
            ServerFacade::instance().GetDistance2d(bot, member) > sPlayerbotAIConfig.sightDistance)
            continue;

        AddAttackersOf(member, targets);
        AddAssistFallbackTarget(member, member->GetVictim(), "victim", targets);

        ObjectGuid const selectionGuid = member->GetSelectionGuid();
        if (!selectionGuid.IsEmpty())
            AddAssistFallbackTarget(member, botAI->GetUnit(selectionGuid), "selection", targets);

        ObjectGuid const targetGuid = member->GetTargetGuid();
        if (!targetGuid.IsEmpty() && targetGuid != selectionGuid)
            AddAssistFallbackTarget(member, botAI->GetUnit(targetGuid), "target", targets);
    }

    if (targets.size() == initialTargetCount)
    {
        LOG_DEBUG("playerbots", "DIAG AttackersValue::AddAttackersOf(Group): bot=%s no grouped attackers found",
            bot->GetName());
    }
}

struct AddGuardiansHelper
{
    explicit AddGuardiansHelper(std::vector<Unit*>& units) : units(units) {}

    void operator()(Unit* target) const { units.push_back(target); }

    std::vector<Unit*>& units;
};

void AttackersValue::AddAttackersOf(Player* player, std::unordered_set<Unit*>& targets)
{
    if (!player || !player->IsInWorld() || player->IsBeingTeleported())
        return;

    HostileRefManager& refManager = player->GetHostileRefManager();
    HostileReference* ref = refManager.getFirst();
    if (!ref)
        return;

    while (ref)
    {
        ThreatManager* threatMgr = ref->GetSource();
        Unit* attacker = threatMgr ? threatMgr->getOwner() : nullptr;

        if (attacker && player->IsValidAttackTarget(attacker) &&
            player->GetDistance2d(attacker) < sPlayerbotAIConfig.sightDistance)
            targets.insert(attacker);

        ref = ref->next();
    }
}

void AttackersValue::AddAssistFallbackTarget(Player* player, Unit* candidate, char const* source,
    std::unordered_set<Unit*>& targets)
{
    if (!player || !candidate)
        return;

    bool const engaged = player->IsInCombat() || candidate->IsInCombat() || candidate->GetVictim();
    if (!engaged)
    {
        LOG_DEBUG("playerbots", "DIAG AttackersValue::AddAssistFallbackTarget: bot=%s member=%s source=%s target=%s REJECT inactive engage",
            bot->GetName(), player->GetName(), source, candidate->GetName());
        return;
    }

    if (!IsValidTarget(candidate, bot))
    {
        LOG_DEBUG("playerbots", "DIAG AttackersValue::AddAssistFallbackTarget: bot=%s member=%s source=%s target=%s REJECT invalid fallback candidate",
            bot->GetName(), player->GetName(), source, candidate->GetName());
        return;
    }

    targets.insert(candidate);
    LOG_DEBUG("playerbots", "DIAG AttackersValue::AddAssistFallbackTarget: bot=%s member=%s source=%s target=%s ACCEPT",
        bot->GetName(), player->GetName(), source, candidate->GetName());
}

void AttackersValue::RemoveNonThreating(std::unordered_set<Unit*>& targets)
{
    for (std::unordered_set<Unit*>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        Unit* unit = *tIter;
        if (bot->GetMapId() != unit->GetMapId() || !hasRealThreat(unit) || !IsValidTarget(unit, bot))
        {
            std::unordered_set<Unit*>::iterator tIter2 = tIter;
            ++tIter;
            targets.erase(tIter2);
        }
        else
            ++tIter;
    }
}

bool AttackersValue::hasRealThreat(Unit* attacker)
{
    return attacker && attacker->IsInWorld() && attacker->IsAlive() && !attacker->IsPolymorphed() &&
           // !attacker->isInRoots() &&
           !attacker->IsFriendlyTo(bot);
}

bool AttackersValue::IsPossibleTarget(Unit* attacker, Player* bot, float /*range*/)
{
    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (!botAI)
        return false;

    // Basic check
    if (!attacker)
        return false;

    // bool inCannon = botAI->IsInVehicle(false, true);
    // bool enemy = botAI->GetAiObjectContext()->GetValue<Unit*>("enemy player target")->Get();

    // Validity checks
    if (!attacker->IsInWorld() || attacker->GetMapId() != bot->GetMapId())
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL world/map inWorld=%u targetMap=%u botMap=%u",
            bot->GetName(), attacker->GetName(), (uint32)attacker->IsInWorld(), attacker->GetMapId(), bot->GetMapId());
        return false;
    }

    if (attacker->isDead())
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL dead",
            bot->GetName(), attacker->GetName());
        return false;
    }

    // Flag checks
    if (attacker->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE_2))
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL non-attackable-2",
            bot->GetName(), attacker->GetName());
        return false;
    }

    if (attacker->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER) ||
        attacker->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL immune/not-selectable immune=%u notSelectable=%u",
            bot->GetName(), attacker->GetName(),
            (uint32)attacker->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER),
            (uint32)attacker->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE));
        return false;
    }

    // Relationship checks
    if (attacker->IsFriendlyTo(bot))
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL friendly",
            bot->GetName(), attacker->GetName());
        return false;
    }

    // Critter exception
    if (attacker->GetCreatureType() == CREATURE_TYPE_CRITTER && !attacker->IsInCombat())
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL critter not in combat (creatureType=%u)",
            bot->GetName(), attacker->GetName(), (uint32)attacker->GetCreatureType());
        return false;
    }

    // Visibility check
    if (!attacker->IsVisibleForOrDetect(bot, bot, true))
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL not visible",
            bot->GetName(), attacker->GetName());
        return false;
    }

    // PvP prohibition checks (skip for duels)
    if ((attacker->GetObjectGuid().IsPlayer() || attacker->GetObjectGuid().IsPet()) &&
        (!bot->m_duel || bot->m_duel->opponent != attacker) &&
        (sPlayerbotAIConfig.IsPvpProhibited(attacker->GetZoneId(), attacker->GetAreaId()) ||
        sPlayerbotAIConfig.IsPvpProhibited(bot->GetZoneId(), bot->GetAreaId())))
    {
        // This will stop aggresive pets from starting an attack.
        // This will stop currently attacking pets from continuing their attack.
        // This will first require bot to change from a combat strat. It will
        // not be reached if bot only switches targets, including NPC targets.
        bot->CallForAllControlledUnits([attacker](Unit* unit)
        {
            Creature* creature = dynamic_cast<Creature*>(unit);
            if (creature && creature->GetVictim() == attacker)
            {
                creature->AttackStop();
                if (CharmInfo* charmInfo = creature->GetCharmInfo())
                    charmInfo->SetIsCommandAttack(false);
            }
        }, CONTROLLED_GUARDIANS);

        return false;
    }

    // Unflagged player check
    if (attacker->IsPlayer() && !attacker->IsPvP() &&
        (!bot->m_duel || bot->m_duel->opponent != attacker))
    {
        LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL player not PvP flagged",
            bot->GetName(), attacker->GetName());
        return false;
    }

    // Creature-specific checks
    Creature* c = attacker->ToCreature();
    if (c)
    {
        if (c->IsInEvadeMode())
        {
            LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL evade mode",
                bot->GetName(), attacker->GetName());
            return false;
        }

        bool leaderHasThreat = false;
        if (bot->GetGroup() && botAI->GetMaster())
            leaderHasThreat = attacker->GetThreatMgr().getThreat(botAI->GetMaster());

        bool isMemberBotGroup = false;
        if (bot->GetGroup() && botAI->GetMaster())
        {
            PlayerbotAI* masterBotAI = GET_PLAYERBOT_AI(botAI->GetMaster());
            if (masterBotAI && !masterBotAI->IsRealPlayer())
                isMemberBotGroup = true;
        }

        bool canAttack = (!isMemberBotGroup && botAI->HasStrategy("attack tagged", BOT_STATE_NON_COMBAT)) ||
            leaderHasThreat ||
            (!c->HasLootRecipient() &&
                (!c->GetVictim() ||
                    (c->GetVictim() &&
                        ((!c->GetVictim()->IsPlayer() || bot->IsInSameGroupWith(c->GetVictim()->ToPlayer())) ||
                            (botAI->GetMaster() && c->GetVictim() == botAI->GetMaster()))))) ||
            c->IsTappedBy(bot);

        if (!canAttack)
        {
            LOG_DEBUG("playerbots", "DIAG IsPossibleTarget: bot=%s target=%s FAIL canAttack=0 "
                "(isMemberBotGroup=%u hasAttackTagged=%u leaderHasThreat=%u hasLootRecipient=%u victim=%s tappedByBot=%u)",
                bot->GetName(), attacker->GetName(),
                (uint32)isMemberBotGroup, (uint32)(!isMemberBotGroup && botAI->HasStrategy("attack tagged", BOT_STATE_NON_COMBAT)),
                (uint32)leaderHasThreat, (uint32)c->HasLootRecipient(),
                c->GetVictim() ? c->GetVictim()->GetName() : "none",
                (uint32)c->IsTappedBy(bot));
            return false;
        }
    }

    return true;
}

bool AttackersValue::IsValidTarget(Unit* attacker, Player* bot)
{
    bool possible = IsPossibleTarget(attacker, bot);
    bool los = bot->IsWithinLOSInMap(attacker);
    if (!possible || !los)
    {
        LOG_DEBUG("playerbots", "DIAG IsValidTarget: bot=%s target=%s FAIL possible=%u los=%u",
            bot->GetName(), attacker ? attacker->GetName() : "null", (uint32)possible, (uint32)los);
    }
    return possible && los;
    // (attacker->GetThreatMgr().getCurrentVictim() || attacker->GetGuidValue(UNIT_FIELD_TARGET) ||
    // attacker->GetGUID().IsPlayer() || attacker->GetGUID() ==
    // GET_PLAYERBOT_AI(bot)->GetAiObjectContext()->GetValue<ObjectGuid>("pull target")->Get());
}

bool PossibleAddsValue::Calculate()
{
    GuidVector possible = botAI->GetAiObjectContext()->GetValue<GuidVector>("possible targets no los")->Get();
    GuidVector attackers = botAI->GetAiObjectContext()->GetValue<GuidVector>("attackers")->Get();

    for (ObjectGuid const guid : possible)
    {
        if (find(attackers.begin(), attackers.end(), guid) != attackers.end())
            continue;

        if (Unit* add = botAI->GetUnit(guid))
        {
            if (!add->IsInWorld())
                continue;

            if (!add->GetTargetGuid() && !add->GetThreatMgr().getCurrentVictim() && add->IsHostileTo(bot))
            {
                for (ObjectGuid const attackerGUID : attackers)
                {
                    Unit* attacker = botAI->GetUnit(attackerGUID);
                    if (!attacker)
                        continue;

                    float dist = ServerFacade::instance().GetDistance2d(attacker, add);
                    if (ServerFacade::instance().IsDistanceLessOrEqualThan(dist, sPlayerbotAIConfig.aoeRadius * 1.5f))
                        continue;

                    if (ServerFacade::instance().IsDistanceLessOrEqualThan(dist, sPlayerbotAIConfig.aggroDistance))
                        return true;
                }
            }
        }
    }

    return false;
}
