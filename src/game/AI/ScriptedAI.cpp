/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#include "Item.h"
#include "SpellMgr.h"
#include "Spell.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "ScriptedAI.h"
#include "GridSearchers.h"

ScriptedAI::ScriptedAI(Creature* pCreature) : CreatureAI(pCreature),
    me(pCreature),
    m_bCombatMovement(true),
    m_uiEvadeCheckCooldown(2500),
    m_uiHomeArea(m_creature->GetAreaId())
{
    m_bEvadeOutOfHomeArea = false;

    if (auto cData = m_creature->GetCreatureData())
    {
        if (cData->spawnFlags & SPAWN_FLAG_EVADE_OUT_HOME_AREA)
            m_bEvadeOutOfHomeArea = true;
    }
}

void ScriptedAI::MoveInLineOfSight(Unit* pWho)
{
    if (!m_creature->IsWithinDistInMap(pWho, m_creature->GetAttackDistance(pWho)))
        return;

    if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() && m_creature->IsHostileTo(pWho))
    {
        if (pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
        {
            if (!m_creature->getVictim())
                AttackStart(pWho);
            else if (m_creature->GetMap()->IsDungeon())
            {
                pWho->SetInCombatWith(m_creature);
                m_creature->AddThreat(pWho);
            }
        }
    }
}

void ScriptedAI::AttackStart(Unit* pWho)
{
    if (!pWho)
        return;

    if (m_creature->Attack(pWho, true))
    {
        m_creature->AddThreat(pWho);
        m_creature->SetInCombatWith(pWho);
        pWho->SetInCombatWith(m_creature);

        if (IsCombatMovement())
            m_creature->GetMotionMaster()->MoveChase(pWho);
    }
    else
        DEBUG_UNIT(m_creature, DEBUG_AI, "AttackStart %s impossible.", pWho->GetName());
}

void ScriptedAI::EnterCombat(Unit* pEnemy)
{
    if (!pEnemy)
        return;

    Aggro(pEnemy);
}

void ScriptedAI::Aggro(Unit* pEnemy)
{
}

void ScriptedAI::UpdateAI(const uint32 uiDiff)
{
    //Check if we have a current target
    m_creature->SelectHostileTarget();

    if (!m_CreatureSpells.empty() && m_creature->isInCombat())
        DoSpellTemplateCasts(uiDiff);

    DoMeleeAttackIfReady();
}

void ScriptedAI::EnterEvadeMode()
{
    m_creature->RemoveAurasAtReset();
    m_creature->DeleteThreatList();
    m_creature->CombatStop(true);
    m_creature->LoadCreatureAddon();

    if (m_creature->isAlive())
        m_creature->GetMotionMaster()->MoveTargetedHome();

    m_creature->SetLootRecipient(nullptr);

    // Reset back to default spells template. This also resets timers.
    SetSpellsTemplate(m_creature->GetCreatureInfo()->spells_template);

    Reset();
}

void ScriptedAI::JustRespawned()
{
    Reset();
    ResetCreature();
}

void ScriptedAI::DoStartMovement(Unit* pVictim, float fDistance, float fAngle)
{
    if (pVictim)
        m_creature->GetMotionMaster()->MoveChase(pVictim, fDistance, fAngle);
}

void ScriptedAI::DoStartNoMovement(Unit* pVictim)
{
    if (!pVictim)
        return;

    m_creature->GetMotionMaster()->MoveIdle();
    m_creature->StopMoving();
}

void ScriptedAI::DoStopAttack()
{
    if (m_creature->getVictim())
        m_creature->AttackStop();
}

void ScriptedAI::DoCastSpell(Unit* pTarget, SpellEntry const* pSpellInfo, bool bTriggered)
{
    if (m_creature->IsNonMeleeSpellCasted(false) && !bTriggered)
        return;

    m_creature->CastSpell(pTarget, pSpellInfo, bTriggered);
}

void ScriptedAI::DoPlaySoundToSet(WorldObject* pSource, uint32 uiSoundId)
{
    if (!pSource)
        return;

    if (!sObjectMgr.GetSoundEntry(uiSoundId))
    {
        sLog.outError("Invalid soundId %u used in DoPlaySoundToSet (Source: TypeId %u, GUID %u)", uiSoundId, pSource->GetTypeId(), pSource->GetGUIDLow());
        return;
    }

    pSource->PlayDirectSound(uiSoundId);
}

Creature* ScriptedAI::DoSpawnCreature(uint32 uiId, float fX, float fY, float fZ, float fAngle, uint32 uiType, uint32 uiDespawntime)
{
    return m_creature->SummonCreature(uiId,m_creature->GetPositionX()+fX, m_creature->GetPositionY()+fY, m_creature->GetPositionZ()+fZ, fAngle, (TempSummonType)uiType, uiDespawntime);
}

Creature* ScriptedAI::DoSpawnCreature(uint32 id, float dist, uint32 type, uint32 despawntime)
{
    float x, y, z;
    m_creature->GetPosition(x, y, z);
    m_creature->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, dist);
    return m_creature->SummonCreature(id, x, y, z, m_creature->GetAngle(x, y) + M_PI, (TempSummonType)type, despawntime);
}

SpellEntry const* ScriptedAI::SelectSpell(Unit* pTarget, int32 uiSchool, int32 uiMechanic, SelectTarget selectTargets, uint32 uiPowerCostMin, uint32 uiPowerCostMax, float fRangeMin, float fRangeMax, SelectEffect selectEffects)
{
    //No target so we can't cast
    if (!pTarget)
        return nullptr;

    //Silenced so we can't cast
    if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED))
        return nullptr;

    //Using the extended script system we first create a list of viable spells
    SpellEntry const* apSpell[4];
    memset(apSpell, 0, sizeof(SpellEntry*)*4);

    uint32 uiSpellCount = 0;

    SpellEntry const* pTempSpell;
    SpellRangeEntry const* pTempRange;

    TSpellSummary* spellSummary = sScriptMgr.GetSpellSummary();

    //Check if each spell is viable(set it to null if not)
    for (uint32 i = 0; i < 4; ++i)
    {
        pTempSpell = sSpellMgr.GetSpellEntry(m_creature->m_spells[i]);

        //This spell doesn't exist
        if (!pTempSpell)
            continue;

        // Targets and Effects checked first as most used restrictions
        //Check the spell targets if specified
        if (selectTargets && !(spellSummary[m_creature->m_spells[i]].Targets & (1 << (selectTargets-1))))
            continue;

        //Check the type of spell if we are looking for a specific spell type
        if (selectEffects && !(spellSummary[m_creature->m_spells[i]].Effects & (1 << (selectEffects-1))))
            continue;

        //Check for school if specified
//        if (uiSchool >= 0 && pTempSpell->SchoolMask & uiSchool)
//            continue;

        //Check for spell mechanic if specified
        if (uiMechanic >= 0 && pTempSpell->Mechanic != uiMechanic)
            continue;

        //Make sure that the spell uses the requested amount of power
        if (uiPowerCostMin &&  pTempSpell->manaCost < uiPowerCostMin)
            continue;

        if (uiPowerCostMax && pTempSpell->manaCost > uiPowerCostMax)
            continue;

        //Continue if we don't have the mana to actually cast this spell
        if (pTempSpell->manaCost > m_creature->GetPower((Powers)pTempSpell->powerType))
            continue;

        //Get the Range
        pTempRange = GetSpellRangeStore()->LookupEntry(pTempSpell->rangeIndex);

        //Spell has invalid range store so we can't use it
        if (!pTempRange)
            continue;

        //Check if the spell meets our range requirements
        if (fRangeMin && pTempRange->maxRange < fRangeMin)
            continue;

        if (fRangeMax && pTempRange->maxRange > fRangeMax)
            continue;

        //Check if our target is in range
        if (m_creature->IsWithinDistInMap(pTarget, pTempRange->minRange) || !m_creature->IsWithinDistInMap(pTarget, pTempRange->maxRange))
            continue;

        //All good so lets add it to the spell list
        apSpell[uiSpellCount] = pTempSpell;
        ++uiSpellCount;
    }

    //We got our usable spells so now lets randomly pick one
    if (!uiSpellCount)
        return nullptr;

    return apSpell[rand()%uiSpellCount];
}

void ScriptedAI::DoResetThreat()
{
    if (!m_creature->CanHaveThreatList() || m_creature->getThreatManager().isThreatListEmpty())
    {
        sLog.outError("DoResetThreat called for creature that either cannot have threat list or has empty threat list (m_creature entry = %d)", m_creature->GetEntry());
        return;
    }

    ThreatList const& tList = m_creature->getThreatManager().getThreatList();
    for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
    {
        Unit* pUnit = m_creature->GetMap()->GetUnit( (*itr)->getUnitGuid());

        if (pUnit && m_creature->getThreatManager().getThreat(pUnit))
            m_creature->getThreatManager().modifyThreatPercent(pUnit, -100);
    }
}

void ScriptedAI::DoTeleportPlayer(Unit* pUnit, float fX, float fY, float fZ, float fO)
{
    if (!pUnit || pUnit->GetTypeId() != TYPEID_PLAYER)
    {
        if (pUnit)
            sLog.outError("Creature %u (Entry: %u) Tried to teleport non-player unit (Type: %u GUID: %u) to x: %f y:%f z: %f o: %f. Aborted.", m_creature->GetGUID(), m_creature->GetEntry(), pUnit->GetTypeId(), pUnit->GetGUID(), fX, fY, fZ, fO);

        return;
    }

    ((Player*)pUnit)->TeleportTo(pUnit->GetMapId(), fX, fY, fZ, fO, TELE_TO_NOT_LEAVE_COMBAT);
}

std::list<Creature*> ScriptedAI::DoFindFriendlyCC(float fRange)
{
    std::list<Creature*> pList;

    MaNGOS::FriendlyCCedInRangeCheck u_check(m_creature, fRange);
    MaNGOS::CreatureListSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(pList, u_check);

    Cell::VisitGridObjects(m_creature, searcher, fRange);

    return pList;
}

std::list<Creature*> ScriptedAI::DoFindFriendlyMissingBuff(float fRange, uint32 uiSpellId)
{
    std::list<Creature*> pList;

    MaNGOS::FriendlyMissingBuffInRangeCheck u_check(m_creature, fRange, uiSpellId);
    MaNGOS::CreatureListSearcher<MaNGOS::FriendlyMissingBuffInRangeCheck> searcher(pList, u_check);

    Cell::VisitGridObjects(m_creature, searcher, fRange);

    return pList;
}

Player* ScriptedAI::GetPlayerAtMinimumRange(float fMinimumRange)
{
    Player* pPlayer = nullptr;

    MaNGOS::PlayerAtMinimumRangeAway check(m_creature, fMinimumRange);
    MaNGOS::PlayerSearcher<MaNGOS::PlayerAtMinimumRangeAway> searcher(pPlayer, check);

    Cell::VisitWorldObjects(m_creature, searcher, fMinimumRange);

    return pPlayer;
}

void ScriptedAI::GetPlayersWithinRange(std::list<Player*>& players, float range)
{
    MaNGOS::AnyPlayerInObjectRangeCheck check(m_creature, range);
    MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

    Cell::VisitWorldObjects(m_creature, searcher, range);
}

Player* ScriptedAI::GetNearestPlayer(float range)
{
    Player* target = nullptr;
    MaNGOS::NearestHostileUnitCheck check(m_creature, range);
    MaNGOS::PlayerSearcher<MaNGOS::NearestHostileUnitCheck> searcher(target, check);
    Cell::VisitWorldObjects(m_creature, searcher, range);

    return target;
}

void ScriptedAI::SetEquipmentSlots(bool bLoadDefault, int32 uiMainHand, int32 uiOffHand, int32 uiRanged)
{
    if (bLoadDefault)
    {
        m_creature->LoadEquipment(m_creature->GetCreatureInfo()->equipmentId,true);
        return;
    }

    if (uiMainHand >= 0)
        m_creature->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + 0, uint32(uiMainHand));

    if (uiOffHand >= 0)
        m_creature->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + 1, uint32(uiOffHand));

    if (uiRanged >= 0)
        m_creature->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_DISPLAY + 2, uint32(uiRanged));
}

void ScriptedAI::SetCombatMovement(bool bCombatMove)
{
    m_bCombatMovement = bCombatMove;
}

// Hacklike storage used for misc creatures that are expected to evade of outside of a certain area.
// It is assumed the information is found elswehere and can be handled by mangos. So far no luck finding such information/way to extract it.
enum
{
    NPC_BROODLORD   = 12017,
    NPC_VISCIDUS    = 15299,
    NPC_SYLVANAS    = 10181,
    NPC_VARIMATHRAS = 2425
};

bool ScriptedAI::EnterEvadeIfOutOfCombatArea(const uint32 uiDiff)
{
    if (m_uiEvadeCheckCooldown < uiDiff)
        m_uiEvadeCheckCooldown = 2500;
    else
    {
        m_uiEvadeCheckCooldown -= uiDiff;
        return false;
    }

    if (m_creature->IsInEvadeMode() || !m_creature->getVictim())
        return false;

    float fX = m_creature->GetPositionX();
    float fY = m_creature->GetPositionY();
    float fZ = m_creature->GetPositionZ();

    switch(m_creature->GetEntry())
    {
        case NPC_BROODLORD:                                 // broodlord (not move down stairs)
            if (fZ > 448.60f)
                return false;
            break;
        case NPC_VISCIDUS:
            if (fZ < -30.0f)
                return false;
            break;
        case NPC_SYLVANAS:
        case NPC_VARIMATHRAS:
            if (m_creature->GetDistance(fX, fY, fZ) < 120.0f)
                return false;
            break;
        default:
            sLog.outError("EnterEvadeIfOutOfCombatArea used for creature entry %u, but does not have any definition.", m_creature->GetEntry());
            return false;
    }

    EnterEvadeMode();
    return true;
}

void ScriptedAI::EnterEvadeIfOutOfHomeArea()
{
    if (!m_bEvadeOutOfHomeArea)
        return;

    if (m_creature->GetAreaId() != m_uiHomeArea)
    {
        std::ostringstream log;
        log << "Home area left, evading.";
        m_creature->LogScriptInfo(log);

        EnterEvadeMode();
    }
}

void Scripted_NoMovementAI::AttackStart(Unit* pWho)
{
    if (!pWho)
        return;

    if (m_creature->Attack(pWho, true))
    {
        m_creature->AddThreat(pWho);
        m_creature->SetInCombatWith(pWho);
        pWho->SetInCombatWith(m_creature);

        DoStartNoMovement(pWho);
    }
}

void ScriptedAI::DoGoHome()
{
    if (!m_creature->getVictim() && m_creature->isAlive())
        m_creature->GetMotionMaster()->MoveTargetedHome();
}


// TrinityCore
float ScriptedAI::DoGetThreat(Unit* pUnit)
{
    if (!pUnit) return 0.0f;
    return me->getThreatManager().getThreat(pUnit);
}

void ScriptedAI::DoModifyThreatPercent(Unit* pUnit, int32 pct)
{
    if (!pUnit) return;
    me->getThreatManager().modifyThreatPercent(pUnit, pct);
}

void ScriptedAI::DoTeleportTo(float fX, float fY, float fZ)
{
    me->NearTeleportTo(fX, fY, fZ, me->GetOrientation());
}

void ScriptedAI::DoTeleportTo(const float fPos[4])
{
    me->NearTeleportTo(fPos[0], fPos[1], fPos[2], fPos[3]);
}

void ScriptedAI::DoTeleportAll(float fX, float fY, float fZ, float fO)
{
    Map *map = me->GetMap();
    if (!map->IsDungeon())
        return;

    Map::PlayerList const &PlayerList = map->GetPlayers();
    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
        if (Player* i_pl = i->getSource())
            if (i_pl->isAlive())
                i_pl->TeleportTo(me->GetMapId(), fX, fY, fZ, fO, TELE_TO_NOT_LEAVE_COMBAT);
}
