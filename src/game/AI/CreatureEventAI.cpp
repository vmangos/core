/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "CreatureEventAI.h"
#include "CreatureEventAIMgr.h"
#include "ObjectMgr.h"
#include "Spell.h"
#include "World.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "InstanceData.h"
#include "Chat.h"
#include "Language.h"
#include "ScriptMgr.h"
#include "CreatureAI.h"

bool CreatureEventAIHolder::UpdateRepeatTimer(Creature* creature, uint32 repeatMin, uint32 repeatMax)
{
    if (repeatMin == repeatMax)
        Time = repeatMin;
    else if (repeatMax > repeatMin)
        Time = urand(repeatMin, repeatMax);
    else
    {
        sLog.outErrorDb("CreatureEventAI: Creature %u using Event %u (Type = %u) has RandomMax < RandomMin. Event repeating disabled.", creature->GetEntry(), Event.event_id, Event.event_type);
        Enabled = false;
        return false;
    }

    return true;
}

int CreatureEventAI::Permissible(const Creature *creature)
{
    if (creature->GetAIName() == "EventAI")
        return PERMIT_BASE_SPECIAL;
    return PERMIT_BASE_NO;
}

void CreatureEventAI::GetAIInformation(ChatHandler& reader)
{
    reader.PSendSysMessage(LANG_NPC_EVENTAI_PHASE, (uint32)m_Phase);
    reader.PSendSysMessage(LANG_NPC_EVENTAI_MOVE, reader.GetOnOffStr(m_CombatMovementEnabled));
    reader.PSendSysMessage(LANG_NPC_EVENTAI_COMBAT, reader.GetOnOffStr(m_MeleeEnabled));
}

CreatureEventAI::CreatureEventAI(Creature *c) : CreatureAI(c)
{
    // Need make copy for filter unneeded steps and safe in case table reload
    CreatureEventAI_Event_Map::const_iterator creatureEventsItr = sEventAIMgr.GetCreatureEventAIMap().find(m_creature->GetEntry());
    if (creatureEventsItr != sEventAIMgr.GetCreatureEventAIMap().end())
    {
        uint32 events_count = 0;
        for (CreatureEventAI_Event_Vec::const_iterator i = (*creatureEventsItr).second.begin(); i != (*creatureEventsItr).second.end(); ++i)
        {
            //Debug check
#ifndef _DEBUG
            if ((*i).event_flags & EFLAG_DEBUG_ONLY)
                continue;
#endif

            ++events_count;
        }
        //EventMap had events but they were not added because they must be for instance
        if (events_count == 0)
            sLog.outError("CreatureEventAI: Creature %u has events but no events added to list because of instance flags.", m_creature->GetEntry());
        else
        {
            m_CreatureEventAIList.reserve(events_count);
            for (CreatureEventAI_Event_Vec::const_iterator i = (*creatureEventsItr).second.begin(); i != (*creatureEventsItr).second.end(); ++i)
            {

                //Debug check
#ifndef _DEBUG
                if ((*i).event_flags & EFLAG_DEBUG_ONLY)
                    continue;
#endif
                m_CreatureEventAIList.push_back(CreatureEventAIHolder(*i));
            }
        }
    }
    else
        sLog.outError("CreatureEventAI: EventMap for Creature %u is empty but creature is using CreatureEventAI.", m_creature->GetEntry());

    m_bEmptyList = m_CreatureEventAIList.empty();
    m_Phase = 0;
    m_AttackDistance = 0.0f;
    m_AttackAngle = 0.0f;

    m_InvinceabilityHpLevel = 0;

    //Handle Spawned Events
    if (!m_bEmptyList)
    {
        for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
            if (i->Event.event_type == EVENT_T_SPAWNED)
                ProcessEvent(*i);
    }
    Reset();
}

bool CreatureEventAI::ProcessEvent(CreatureEventAIHolder& pHolder, Unit* pActionInvoker)
{
    if (!pHolder.Enabled || pHolder.Time)
        return false;

    //Check the inverse phase mask (event doesn't trigger if current phase bit is set in mask)
    if (pHolder.Event.event_inverse_phase_mask & (1 << m_Phase))
        return false;

    if (pHolder.Event.condition_id && !sObjectMgr.IsConditionSatisfied(pHolder.Event.condition_id, pActionInvoker, m_creature->GetMap(), m_creature, CONDITION_FROM_EVENTAI))
        return false;

    CreatureEventAI_Event const& event = pHolder.Event;

    //Check event conditions based on the event type, also reset events
    switch (event.event_type)
    {
        case EVENT_T_TIMER:
            if (!m_creature->isInCombat())
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.timer.repeatMin, event.timer.repeatMax);
            break;
        case EVENT_T_TIMER_OOC:
            if (m_creature->isInCombat())
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.timer.repeatMin, event.timer.repeatMax);
            break;
        case EVENT_T_HP:
        {
            if (!m_creature->isInCombat() || !m_creature->GetMaxHealth())
                return false;

            uint32 perc = (m_creature->GetHealth() * 100) / m_creature->GetMaxHealth();

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_MANA:
        {
            if (!m_creature->isInCombat() || !m_creature->GetMaxPower(POWER_MANA))
                return false;

            uint32 perc = (m_creature->GetPower(POWER_MANA) * 100) / m_creature->GetMaxPower(POWER_MANA);

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_AGGRO:
            break;
        case EVENT_T_KILL:
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.kill.repeatMin, event.kill.repeatMax);
            break;
        case EVENT_T_DEATH:
        case EVENT_T_EVADE:
            break;
        case EVENT_T_SPELLHIT:
            //Spell hit is special case, param1 and param2 handled within CreatureEventAI::SpellHit

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.spell_hit.repeatMin, event.spell_hit.repeatMax);
            break;
        case EVENT_T_RANGE:
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.range.repeatMin, event.range.repeatMax);
            break;
        case EVENT_T_OOC_LOS:
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.ooc_los.repeatMin, event.ooc_los.repeatMax);
            break;
        case EVENT_T_SPAWNED:
            break;
        case EVENT_T_TARGET_HP:
        {
            if (!m_creature->isInCombat() || !m_creature->getVictim() || !m_creature->getVictim()->GetMaxHealth())
                return false;

            uint32 perc = (m_creature->getVictim()->GetHealth() * 100) / m_creature->getVictim()->GetMaxHealth();

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_TARGET_CASTING:
            if (!m_creature->isInCombat() || !m_creature->getVictim() || !m_creature->getVictim()->IsNonMeleeSpellCasted(false, false, true))
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.target_casting.repeatMin, event.target_casting.repeatMax);
            break;
        case EVENT_T_FRIENDLY_HP:
        {
            if (!m_creature->isInCombat())
                return false;

            Unit* pUnit = DoSelectLowestHpFriendly((float)event.friendly_hp.radius, event.friendly_hp.hpDeficit);
            if (!pUnit)
                return false;

            pActionInvoker = pUnit;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_hp.repeatMin, event.friendly_hp.repeatMax);
            break;
        }
        case EVENT_T_FRIENDLY_IS_CC:
        {
            if (!m_creature->isInCombat())
                return false;

            std::list<Creature*> pList;
            DoFindFriendlyCC(pList, (float)event.friendly_is_cc.radius);

            //List is empty
            if (pList.empty())
                return false;

            //We don't really care about the whole list, just return first available
            pActionInvoker = *(pList.begin());

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_is_cc.repeatMin, event.friendly_is_cc.repeatMax);
            break;
        }
        case EVENT_T_FRIENDLY_MISSING_BUFF:
        {
            std::list<Creature*> pList;
            DoFindFriendlyMissingBuff(pList, (float)event.friendly_buff.radius, event.friendly_buff.spellId);

            //List is empty
            if (pList.empty())
                return false;

            //We don't really care about the whole list, just return first available
            pActionInvoker = *(pList.begin());

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.friendly_buff.repeatMin, event.friendly_buff.repeatMax);
            break;
        }
        case EVENT_T_SUMMONED_UNIT:
        case EVENT_T_SUMMONED_JUST_DIED:
        case EVENT_T_SUMMONED_JUST_DESPAWN:
        {
            //Prevent event from occuring on no unit or non creatures
            if (!pActionInvoker || pActionInvoker->GetTypeId() != TYPEID_UNIT)
                return false;

            //Creature id doesn't match up
            if (((Creature*)pActionInvoker)->GetEntry() != event.summoned.creatureId)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.summoned.repeatMin, event.summoned.repeatMax);
            break;
        }
        case EVENT_T_TARGET_MANA:
        {
            if (!m_creature->isInCombat() || !m_creature->getVictim() || !m_creature->getVictim()->GetMaxPower(POWER_MANA))
                return false;

            uint32 perc = (m_creature->getVictim()->GetPower(POWER_MANA) * 100) / m_creature->getVictim()->GetMaxPower(POWER_MANA);

            if (perc > event.percent_range.percentMax || perc < event.percent_range.percentMin)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.percent_range.repeatMin, event.percent_range.repeatMax);
            break;
        }
        case EVENT_T_REACHED_HOME:
        case EVENT_T_RECEIVE_EMOTE:
            break;
        case EVENT_T_AURA:
        {
            SpellAuraHolder* holder = m_creature->GetSpellAuraHolder(event.buffed.spellId);
            if (!holder || holder->GetStackAmount() < event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_TARGET_AURA:
        {
            if (!m_creature->isInCombat() || !m_creature->getVictim())
                return false;

            SpellAuraHolder* holder = m_creature->getVictim()->GetSpellAuraHolder(event.buffed.spellId);
            if (!holder || holder->GetStackAmount() < event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_MISSING_AURA:
        {
            SpellAuraHolder* holder = m_creature->GetSpellAuraHolder(event.buffed.spellId);
            if (holder && holder->GetStackAmount() >= event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_TARGET_MISSING_AURA:
        {
            if (!m_creature->isInCombat() || !m_creature->getVictim())
                return false;

            SpellAuraHolder* holder = m_creature->getVictim()->GetSpellAuraHolder(event.buffed.spellId);
            if (holder && holder->GetStackAmount() >= event.buffed.amount)
                return false;

            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.buffed.repeatMin, event.buffed.repeatMax);
            break;
        }
        case EVENT_T_MOVEMENT_INFORM:
        {
            //Repeat Timers
            pHolder.UpdateRepeatTimer(m_creature, event.move_inform.repeatMin, event.move_inform.repeatMax);
            break;
        }
        default:
            sLog.outErrorDb("CreatureEventAI: Creature %u using Event %u has invalid Event Type(%u), missing from ProcessEvent() Switch.", m_creature->GetEntry(), pHolder.Event.event_id, pHolder.Event.event_type);
            break;
    }

    //Disable non-repeatable events
    if (!(pHolder.Event.event_flags & EFLAG_REPEATABLE))
        pHolder.Enabled = false;

    //Store random here so that all random actions match up
    uint32 rnd = rand();

    //Return if chance for event is not met
    if (pHolder.Event.event_chance <= rnd % 100)
        return false;

    //Process actions, normal case
    if (!(pHolder.Event.event_flags & EFLAG_RANDOM_ACTION))
    {
        for (uint32 j = 0; j < MAX_ACTIONS; ++j)
            ProcessAction(pHolder.Event.action[j], pHolder.Event.event_id, pActionInvoker);
    }
    //Process actions, random case
    else
    {
        // amount of real actions
        uint32 count = 0;
        for (uint32 j = 0; j < MAX_ACTIONS; j++)
            if (pHolder.Event.action[j])
                ++count;

        if (count)
        {
            // select action number from found amount
            uint32 idx = urand(0, count - 1);

            // find selected action, skipping not used
            uint32 j = 0;
            for (; ; ++j)
            {
                if (pHolder.Event.action[j])
                {
                    if (!idx)
                        break;
                    --idx;
                }
            }

            ProcessAction(pHolder.Event.action[j], pHolder.Event.event_id, pActionInvoker);
        }
    }
    return true;
}

void CreatureEventAI::ProcessAction(ScriptMap* action, uint32 EventId, Unit* pActionInvoker)
{
    if (!action)
        return;

    WorldObject* target = pActionInvoker ? pActionInvoker : m_creature->getVictim();
    Map* map = m_creature->GetMap();

    for (const auto& x : *action)
    {
        map->ScriptCommandStartDirect(x.second, m_creature, target);
    }
}

void CreatureEventAI::JustRespawned()
{
    Reset();

    if (m_bEmptyList)
        return;

    //Handle Spawned Events
    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
        if (i->Event.event_type == EVENT_T_SPAWNED)
            ProcessEvent(*i);
}

void CreatureEventAI::Reset()
{
    m_EventUpdateTime = EVENT_UPDATE_TIME;
    m_EventDiff = 0;

    if (m_bEmptyList)
        return;

    //Reset all events to enabled
    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        CreatureEventAI_Event const& event = (*i).Event;
        switch (event.event_type)
        {
            //Reset all out of combat timers
            case EVENT_T_TIMER_OOC:
            {
                if ((*i).UpdateRepeatTimer(m_creature, event.timer.initialMin, event.timer.initialMax))
                    (*i).Enabled = true;
                break;
            }
                //default:
                //TODO: enable below code line / verify this is correct to enable events previously disabled (ex. aggro yell), instead of enable this in void Aggro()
                //(*i).Enabled = true;
                //(*i).Time = 0;
                //break;
        }
    }
}

void CreatureEventAI::JustReachedHome()
{
    if (!m_bEmptyList)
    {
        for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
        {
            if ((*i).Event.event_type == EVENT_T_REACHED_HOME)
                ProcessEvent(*i);
        }
    }

    Reset();
}

void CreatureEventAI::EnterEvadeMode()
{
    CreatureAI::EnterEvadeMode();

    if (m_bEmptyList)
        return;

    //Handle Evade events
    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_EVADE)
            ProcessEvent(*i);
    }
}

void CreatureEventAI::JustDied(Unit* killer)
{
    Reset();

    if (m_creature->IsGuard())
    {
        //Send Zone Under Attack message to the LocalDefense and WorldDefense Channels
        if (Player* pKiller = killer->GetCharmerOrOwnerPlayerOrPlayerItself())
            m_creature->SendZoneUnderAttackMessage(pKiller);
    }

    if (m_bEmptyList)
        return;

    //Handle Evade events
    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_DEATH)
            ProcessEvent(*i, killer);
    }

    // reset phase after any death state events
    m_Phase = 0;
}

void CreatureEventAI::KilledUnit(Unit* victim)
{
    if (m_bEmptyList || victim->GetTypeId() != TYPEID_PLAYER)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_KILL)
            ProcessEvent(*i, victim);
    }
}

void CreatureEventAI::JustSummoned(Creature* pUnit)
{
    if (m_bEmptyList || !pUnit)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_SUMMONED_UNIT)
            ProcessEvent(*i, pUnit);
    }
}

void CreatureEventAI::SummonedCreatureJustDied(Creature* pUnit)
{
    if (m_bEmptyList || !pUnit)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_SUMMONED_JUST_DIED)
            ProcessEvent(*i, pUnit);
    }
}

void CreatureEventAI::SummonedCreatureDespawn(Creature* pUnit)
{
    if (m_bEmptyList || !pUnit)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
    {
        if ((*i).Event.event_type == EVENT_T_SUMMONED_JUST_DESPAWN)
            ProcessEvent(*i, pUnit);
    }
}

void CreatureEventAI::EnterCombat(Unit *enemy)
{
    //Check for on combat start events
    if (!m_bEmptyList)
    {
        for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
        {
            CreatureEventAI_Event const& event = (*i).Event;
            switch (event.event_type)
            {
                case EVENT_T_AGGRO:
                    (*i).Enabled = true;
                    ProcessEvent(*i, enemy);
                    break;
                //Reset all in combat timers
                case EVENT_T_TIMER:
                    if ((*i).UpdateRepeatTimer(m_creature, event.timer.initialMin, event.timer.initialMax))
                        (*i).Enabled = true;
                    break;
                //All normal events need to be re-enabled and their time set to 0
                default:
                    (*i).Enabled = true;
                    (*i).Time = 0;
                    break;
            }
        }
    }

    m_EventUpdateTime = EVENT_UPDATE_TIME;
    m_EventDiff = 0;
}

void CreatureEventAI::AttackStart(Unit *who)
{
    if (!who)
        return;

    if (m_creature->Attack(who, m_MeleeEnabled))
    {
        m_creature->AddThreat(who);
        m_creature->SetInCombatWith(who);
        who->SetInCombatWith(m_creature);

        if (!m_CombatMovementEnabled)
            m_creature->SetCasterChaseDistance(25.0f);
        m_creature->GetMotionMaster()->MoveChase(who, m_AttackDistance, m_AttackAngle);
    }
}

void CreatureEventAI::MoveInLineOfSight(Unit *who)
{
    if (!who)
        return;

    //Check for OOC LOS Event
    if (!m_bEmptyList && !m_creature->getVictim())
    {
        for (CreatureEventAIList::iterator itr = m_CreatureEventAIList.begin(); itr != m_CreatureEventAIList.end(); ++itr)
        {
            if ((*itr).Event.event_type == EVENT_T_OOC_LOS)
            {
                //can trigger if closer than fMaxAllowedRange
                float fMaxAllowedRange = (float)(*itr).Event.ooc_los.maxRange;

                //if range is ok and we are actually in LOS
                if (m_creature->IsWithinDistInMap(who, fMaxAllowedRange))
                {
                    //if friendly event&&who is not hostile OR hostile event&&who is hostile
                    if ((*itr).Event.ooc_los.noHostile && !m_creature->IsHostileTo(who) ||
                            !(*itr).Event.ooc_los.noHostile && m_creature->IsHostileTo(who))
                        if (m_creature->IsWithinLOSInMap(who))
                            ProcessEvent(*itr, who);
                }
            }
        }
    }

    if (m_creature->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_AGGRO || m_creature->IsNeutralToAll())
        return;

    // Check this now to prevent calling expensive functions (isInAccessablePlaceFor / IsWithinLOSInMap)
    if (m_creature->getVictim() && !m_creature->GetMap()->IsDungeon())
        return;

    if (!m_creature->CanFly() && m_creature->GetDistanceZ(who) > CREATURE_Z_ATTACK_RANGE)
        return;

    if (m_creature->CanInitiateAttack() && who->isTargetableForAttack())
    {
        float attackRadius = m_creature->GetAttackDistance(who);
        if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->IsHostileTo(who))
        {
            if (!m_creature->getVictim())
            {
                if (m_creature->IsWithinLOSInMap(who) && who->isInAccessablePlaceFor(m_creature))
                    AttackStart(who);
            }
            else if (m_creature->GetMap()->IsDungeon())
            {
                if (m_creature->IsWithinLOSInMap(who) && who->isInAccessablePlaceFor(m_creature))
                {
                    m_creature->AddThreat(who);
                    who->SetInCombatWith(m_creature);
                }
            }
        }
    }
}

void CreatureEventAI::SpellHit(Unit* pUnit, const SpellEntry* pSpell)
{
    if (m_bEmptyList)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
        if ((*i).Event.event_type == EVENT_T_SPELLHIT)
            //If spell id matches (or no spell id) & if spell school matches (or no spell school)
            if (!(*i).Event.spell_hit.spellId || pSpell->Id == (*i).Event.spell_hit.spellId)
                if (GetSchoolMask(pSpell->School) & (*i).Event.spell_hit.schoolMask)
                    ProcessEvent(*i, pUnit);
}

void CreatureEventAI::MovementInform(uint32 type, uint32 id)
{
    if (m_bEmptyList)
        return;

    for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
        if ((*i).Event.event_type == EVENT_T_MOVEMENT_INFORM)
            if ((*i).Event.move_inform.motionType == type && (*i).Event.move_inform.pointId == id)
                ProcessEvent(*i);
}

void CreatureEventAI::UpdateAI(const uint32 diff)
{
    //Check if we are in combat (also updates calls threat update code)
    m_creature->SelectHostileTarget();
    bool Combat =  m_creature->getVictim();

    //Must return if creature isn't alive. Normally select hostil target and get victim prevent this
    if (!m_creature->isAlive())
        return;

    if (!m_bEmptyList)
    {
        //Events are only updated once every EVENT_UPDATE_TIME ms to prevent lag with large amount of events
        if (m_EventUpdateTime < diff)
        {
            m_EventDiff += diff;

            //Check for time based events
            for (CreatureEventAIList::iterator i = m_CreatureEventAIList.begin(); i != m_CreatureEventAIList.end(); ++i)
            {
                //Decrement Timers
                if ((*i).Time)
                {
                    if ((*i).Time > m_EventDiff)
                    {
                        //Do not decrement timers if event cannot trigger in this phase
                        if (!((*i).Event.event_inverse_phase_mask & (1 << m_Phase)))
                            (*i).Time -= m_EventDiff;

                        //Skip processing of events that have time remaining
                        continue;
                    }
                    else (*i).Time = 0;
                }

                //Events that are updated every EVENT_UPDATE_TIME
                switch ((*i).Event.event_type)
                {
                    case EVENT_T_TIMER_OOC:
                        ProcessEvent(*i);
                        break;
                    case EVENT_T_TIMER:
                    case EVENT_T_MANA:
                    case EVENT_T_HP:
                    case EVENT_T_TARGET_HP:
                    case EVENT_T_TARGET_CASTING:
                    case EVENT_T_FRIENDLY_HP:
                    case EVENT_T_AURA:
                    case EVENT_T_TARGET_AURA:
                    case EVENT_T_MISSING_AURA:
                    case EVENT_T_TARGET_MISSING_AURA:
                        if (Combat)
                            ProcessEvent(*i);
                        break;
                    case EVENT_T_RANGE:
                        if (Combat)
                        {
                            if (m_creature->getVictim() && m_creature->IsInMap(m_creature->getVictim()))
                                if (m_creature->IsInRange(m_creature->getVictim(), (float)(*i).Event.range.minDist, (float)(*i).Event.range.maxDist))
                                    ProcessEvent(*i);
                        }
                        break;
                }
            }

            m_EventDiff = 0;
            m_EventUpdateTime = EVENT_UPDATE_TIME;
        }
        else
        {
            m_EventDiff += diff;
            m_EventUpdateTime -= diff;
        }
    }

    if (Combat && !m_CreatureSpells.empty())
        DoSpellTemplateCasts(diff);

    //Melee Auto-Attack
    if (Combat)
        DoMeleeAttackIfReady();
}

inline uint32 CreatureEventAI::GetRandActionParam(uint32 rnd, uint32 param1, uint32 param2, uint32 param3)
{
    switch (rnd % 3)
    {
        case 0:
            return param1;
        case 1:
            return param2;
        case 2:
            return param3;
    }
    return 0;
}

inline int32 CreatureEventAI::GetRandActionParam(uint32 rnd, int32 param1, int32 param2, int32 param3)
{
    switch (rnd % 3)
    {
        case 0:
            return param1;
        case 1:
            return param2;
        case 2:
            return param3;
    }
    return 0;
}

void CreatureEventAI::SetInvincibilityHealthLevel(uint32 hp_level, bool is_percent)
{
    m_InvinceabilityHpLevel = is_percent ? m_creature->GetMaxHealth() * hp_level / 100 : hp_level;
}

Unit* CreatureEventAI::DoSelectLowestHpFriendly(float range, uint32 MinHPDiff)
{
    Unit* pUnit = nullptr;

    MaNGOS::MostHPMissingInRangeCheck u_check(m_creature, range, MinHPDiff);
    MaNGOS::UnitLastSearcher<MaNGOS::MostHPMissingInRangeCheck> searcher(pUnit, u_check);

    /*
    typedef TYPELIST_4(GameObject, Creature*except pets*, DynamicObject, Corpse*Bones*) AllGridObjectTypes;
    This means that if we only search grid then we cannot possibly return pets or players so this is safe
    */
    Cell::VisitGridObjects(m_creature, searcher, range);
    return pUnit;
}

void CreatureEventAI::DoFindFriendlyCC(std::list<Creature*>& _list, float range)
{
    MaNGOS::FriendlyCCedInRangeCheck u_check(m_creature, range);
    MaNGOS::CreatureListSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(_list, u_check);
    Cell::VisitGridObjects(m_creature, searcher, range);
}

void CreatureEventAI::DoFindFriendlyMissingBuff(std::list<Creature*>& _list, float range, uint32 spellid)
{
    MaNGOS::FriendlyMissingBuffInRangeCheck u_check(m_creature, range, spellid);
    MaNGOS::CreatureListSearcher<MaNGOS::FriendlyMissingBuffInRangeCheck> searcher(_list, u_check);
    Cell::VisitGridObjects(m_creature, searcher, range);
}

//*********************************
//*** Functions used globally ***

void CreatureEventAI::ReceiveEmote(Player* pPlayer, uint32 text_emote)
{
    if (m_bEmptyList)
        return;

    for (CreatureEventAIList::iterator itr = m_CreatureEventAIList.begin(); itr != m_CreatureEventAIList.end(); ++itr)
    {
        if ((*itr).Event.event_type == EVENT_T_RECEIVE_EMOTE)
        {
            if ((*itr).Event.receive_emote.emoteId != text_emote)
                continue;

            ProcessEvent(*itr, pPlayer);
        }
    }
}

void CreatureEventAI::DamageTaken(Unit* /*done_by*/, uint32& damage)
{
    if (m_InvinceabilityHpLevel > 0 && m_creature->GetHealth() < m_InvinceabilityHpLevel + damage)
    {
        if (m_creature->GetHealth() <= m_InvinceabilityHpLevel)
            damage = 0;
        else
            damage = m_creature->GetHealth() - m_InvinceabilityHpLevel;
    }
}
