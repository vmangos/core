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

#include "CreatureAI.h"
#include "Creature.h"
#include "DBCStores.h"
#include "Spell.h"
#include "Totem.h"
#include "GridSearchers.h"

CreatureAI::~CreatureAI()
{
}

void CreatureAI::AttackedBy(Unit* attacker)
{
    if (!m_creature->getVictim())
        AttackStart(attacker);
}

CanCastResult CreatureAI::CanCastSpell(Unit* pTarget, const SpellEntry *pSpell, bool isTriggered)
{
    if (!pTarget)
        return CAST_FAIL_OTHER;
    // If not triggered, we check
    if (!isTriggered)
    {
        // State does not allow
        if (m_creature->hasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
            return CAST_FAIL_STATE;

        if (pSpell->PreventionType == SPELL_PREVENTION_TYPE_SILENCE && (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED) || m_creature->IsSpellProhibited(pSpell)))
            return CAST_FAIL_STATE;

        if (pSpell->PreventionType == SPELL_PREVENTION_TYPE_PACIFY && m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
            return CAST_FAIL_STATE;

        // Check for power (also done by Spell::CheckCast())
        if (m_creature->GetPower((Powers)pSpell->powerType) < Spell::CalculatePowerCost(pSpell, m_creature))
            return CAST_FAIL_POWER;
    }

    if (pSpell->Custom & SPELL_CUSTOM_FROM_BEHIND && pTarget->HasInArc(M_PI_F, m_creature))
        return CAST_FAIL_OTHER;

    // If the spell requires the target having a specific power type
    if (!IsAreaOfEffectSpell(pSpell) && !IsTargetPowerTypeValid(pSpell, pTarget->getPowerType()))
        return CAST_FAIL_OTHER;

    // Mind control abilities can't be used with just 1 attacker or mob will reset.
    if ((m_creature->getThreatManager().getThreatList().size() == 1) && IsCharmSpell(pSpell))
        return CAST_FAIL_OTHER;

    // If the unit is disarmed and the skill requires a weapon, it cannot be cast
    if (m_creature->HasWeapon() && !m_creature->CanUseEquippedWeapon(BASE_ATTACK))
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; i++)
        {
            if (pSpell->Effect[i] == SPELL_EFFECT_WEAPON_DAMAGE || pSpell->Effect[i] == SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL)
                return CAST_FAIL_OTHER;
        }
    }

    if (pSpell->rangeIndex == SPELL_RANGE_IDX_SELF_ONLY)
        return CAST_OK;

    if (!(pSpell->AttributesEx2 & SPELL_ATTR_EX2_IGNORE_LOS) && !m_creature->IsWithinLOSInMap(pTarget))
        return CAST_FAIL_NOT_IN_LOS;

    if (const SpellRangeEntry *pSpellRange = sSpellRangeStore.LookupEntry(pSpell->rangeIndex))
    {
        if (pTarget != m_creature)
        {
            // pTarget is out of range of this spell (also done by Spell::CheckCast())
            float fDistance = m_creature->GetCombatDistance(pTarget);

            if (fDistance > pSpellRange->maxRange)
                return CAST_FAIL_TOO_FAR;

            float fMinRange = pSpellRange->minRange;

            if (fMinRange && fDistance < fMinRange)
                return CAST_FAIL_TOO_CLOSE;
        }

        return CAST_OK;
    }
    else
        return CAST_FAIL_OTHER;
}

CanCastResult CreatureAI::DoCastSpellIfCan(Unit* pTarget, uint32 uiSpell, uint32 uiCastFlags, ObjectGuid uiOriginalCasterGUID)
{
    if (!pTarget)
        return CAST_FAIL_OTHER;

    Unit* pCaster = m_creature;

    if (uiCastFlags & CF_TARGET_CASTS_ON_SELF)
        pCaster = pTarget;

    // Allowed to cast only if not casting (unless we interrupt ourself) or if spell is triggered
    if (!pCaster->IsNonMeleeSpellCasted(false) || uiCastFlags & (CF_TRIGGERED | CF_INTERRUPT_PREVIOUS))
    {
        if (const SpellEntry* pSpell = sSpellMgr.GetSpellEntry(uiSpell))
        {
            // If cast flag CF_AURA_NOT_PRESENT is active, check if target already has aura on them
            if (uiCastFlags & CF_AURA_NOT_PRESENT)
            {
                if (pTarget->HasAura(uiSpell))
                    return CAST_FAIL_TARGET_AURA;
            }

            // Check if cannot cast spell
            if (!(uiCastFlags & (CF_TARGET_CASTS_ON_SELF | CF_FORCE_CAST)))
            {
                CanCastResult castResult = CanCastSpell(pTarget, pSpell, uiCastFlags & CF_TRIGGERED);

                if (castResult != CAST_OK)
                    return castResult;
            }

            // Interrupt any previous spell
            if ((uiCastFlags & CF_INTERRUPT_PREVIOUS) && pCaster->IsNonMeleeSpellCasted(false))
                pCaster->InterruptNonMeleeSpells(false);

            if ((uiCastFlags & CF_MAIN_RANGED_SPELL) && pCaster->IsMoving())
                pCaster->StopMoving();

            pCaster->CastSpell(pTarget, pSpell, uiCastFlags & CF_TRIGGERED, nullptr, nullptr, uiOriginalCasterGUID);
            return CAST_OK;
        }

        sLog.outErrorDb("DoCastSpellIfCan by creature entry %u attempt to cast spell %u but spell does not exist.", m_creature->GetEntry(), uiSpell);
        return CAST_FAIL_OTHER;
    }

    return CAST_FAIL_IS_CASTING;
}

void CreatureAI::SetSpellsTemplate(uint32 entry)
{
    if (entry == 0)
        m_CreatureSpells.clear();
    else if (const CreatureSpellsTemplate* pSpellsTemplate = sObjectMgr.GetCreatureSpellsTemplate(entry))
        SetSpellsTemplate(pSpellsTemplate);
    else
        sLog.outError("CreatureAI: Attempt to set spells template of creature %u to non-existent entry %u.", m_creature->GetEntry(), entry);
}

void CreatureAI::SetSpellsTemplate(const CreatureSpellsTemplate *SpellsTemplate)
{
    m_CreatureSpells.clear();
    for (const auto & entry : *SpellsTemplate)
    {
        m_CreatureSpells.push_back(CreatureAISpellsEntry(entry));
    }
    m_CreatureSpells.shrink_to_fit();
}

void CreatureAI::DoSpellTemplateCasts(const uint32 uiDiff)
{
    for (auto & spell : m_CreatureSpells)
    {
        if (spell.cooldown <= uiDiff)
        {
            // we roll to see if we cast this time
            if (spell.probability <= rand() % 100)
            {
                spell.cooldown = urand(spell.delayRepeatMin, spell.delayRepeatMax);
                continue;
            }

            Unit* spellTarget = ToUnit(GetTargetByType(m_creature, m_creature, spell.castTarget, spell.spellId));

            CanCastResult result = DoCastSpellIfCan(spellTarget, spell.spellId, spell.castFlags);
            
            if (result == CAST_OK)
            {
                spell.cooldown = urand(spell.delayRepeatMin, spell.delayRepeatMax);

                if (spell.castFlags & CF_MAIN_RANGED_SPELL)
                {
                    SetCombatMovement(false);
                    SetMeleeAttack(false);
                }

                // If there is a script for this spell, run it.
                if (spell.scriptId)
                    m_creature->GetMap()->ScriptsStart(sCreatureSpellScripts, spell.scriptId, m_creature, spellTarget);
            }
            else if (result != CAST_FAIL_IS_CASTING)
            {
                if (spell.castFlags & CF_MAIN_RANGED_SPELL)
                {
                    SetCombatMovement(true);
                    SetMeleeAttack(true);
                }
            }
        }
        else
            spell.cooldown -= uiDiff;
    }
}

void CreatureAI::ClearTargetIcon()
// Clears any group/raid icons this creature may have
{
    Map::PlayerList const& players = m_creature->GetMap()->GetPlayers();

    if (players.isEmpty())
        return;

    std::set<Group*> instanceGroups;

    // Clear target icon for every unique group in instance
    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
    {
        if (Group* pGroup = itr->getSource()->GetGroup())
        {
            if (instanceGroups.find(pGroup) == instanceGroups.end())
            {
                instanceGroups.insert(pGroup);
                pGroup->ClearTargetIcon(m_creature->GetObjectGuid());
            }
        }
    }
}

void CreatureAI::SetGazeOn(Unit *target)
{
    if (m_creature->canAttack(target))
    {
        AttackStart(target);
        m_creature->SetReactState(REACT_PASSIVE);
    }
}

bool CreatureAI::UpdateVictimWithGaze()
{
    if (!m_creature->isInCombat())
        return false;

    if (m_creature->HasReactState(REACT_PASSIVE))
    {
        if (m_creature->getVictim())
            return true;
        m_creature->SetReactState(REACT_AGGRESSIVE);
    }

    if (m_creature->SelectHostileTarget())
        if (Unit *victim = m_creature->getVictim())
            AttackStart(victim);
    return m_creature->getVictim();
}

bool CreatureAI::UpdateVictim()
{
    if (!m_creature->isInCombat())
        return false;

    if (!m_creature->HasReactState(REACT_PASSIVE))
    {
        if (m_creature->SelectHostileTarget())
            if (Unit *victim = m_creature->getVictim())
                AttackStart(victim);
        return m_creature->getVictim();
    }

    if (m_creature->getThreatManager().isThreatListEmpty())
    {
        EnterEvadeMode();
        return false;
    }

    return true;
}


void CreatureAI::DoCast(Unit* victim, uint32 spellId, bool triggered)
{
    if (!victim || m_creature->IsNonMeleeSpellCasted(false) && !triggered)
        return;

    m_creature->CastSpell(victim, spellId, triggered);
}

void CreatureAI::DoCastVictim(uint32 spellId, bool triggered)
{
    m_creature->CastSpell(m_creature->getVictim(), spellId, triggered);
}

void CreatureAI::DoCastAOE(uint32 spellId, bool triggered)
{
    if (!triggered && m_creature->IsNonMeleeSpellCasted(false))
        return;

    m_creature->CastSpell((Unit*)nullptr, spellId, triggered);
}

bool CreatureAI::DoMeleeAttackIfReady()
{
    return m_MeleeEnabled ? m_creature->UpdateMeleeAttackingState() : false;
}

struct EnterEvadeModeHelper
{
    explicit EnterEvadeModeHelper(Unit* _source) : source(_source) {}
    void operator()(Unit* unit) const
    {
        if (unit->IsCreature() && unit->ToCreature()->IsTotem())
            ((Totem*)unit)->UnSummon();
        else
        {
            unit->GetMotionMaster()->Clear(false);
            // for a controlled unit this will result in a follow move
            unit->GetMotionMaster()->MoveTargetedHome();
            unit->DeleteThreatList();
            unit->CombatStop(true);
        }
    }
    Unit* source;
};

void CreatureAI::SetMeleeAttack(bool enabled)
{
    if (m_MeleeEnabled == enabled)
        return;

    m_MeleeEnabled = enabled;

    if (enabled)
        m_creature->SendMeleeAttackStart(m_creature->getVictim());
    else
        m_creature->SendMeleeAttackStop(m_creature->getVictim());
}

void CreatureAI::SetCombatMovement(bool enabled)
{
    if (m_CombatMovementEnabled == enabled)
        return;

    m_CombatMovementEnabled = enabled;

    if (Unit* pVictim = m_creature->getVictim())
    {
        if (!enabled && (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE))
            m_creature->GetMotionMaster()->MoveIdle();
        else if (enabled && (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE))
            m_creature->GetMotionMaster()->MoveChase(pVictim);
    }
}

void CreatureAI::EnterEvadeMode()
{
    // Reset back to default spells template. This also resets timers.
    SetSpellsTemplate(m_creature->GetCreatureInfo()->spells_template);

    if (!m_creature->isAlive())
    {
        DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "Creature stopped attacking, he is dead [guid=%u]", m_creature->GetGUIDLow());
        m_creature->CombatStop(true);
        m_creature->DeleteThreatList();
        return;
    }

    if (!m_creature->isCharmed())
    {
        m_creature->RemoveAurasAtReset();

        // clear all movement generators except default
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveTargetedHome();
    }

    m_creature->DeleteThreatList();
    m_creature->CombatStop(true);
    m_creature->SetLootRecipient(nullptr);
    m_creature->CallForAllControlledUnits(EnterEvadeModeHelper(m_creature), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM | CONTROLLED_TOTEMS);
}

// Distract creature, if player gets too close while stealthed/prowling
void CreatureAI::TriggerAlert(Unit const* who)
{
    // If there's no target, or target isn't a player do nothing
    if (!who || who->GetTypeId() != TYPEID_PLAYER)
        return;

    // If this unit isn't an NPC, is already distracted, is in combat, is confused, stunned or fleeing, do nothing
    if (m_creature->GetTypeId() != TYPEID_UNIT || m_creature->isInCombat() || m_creature->hasUnitState(UNIT_STAT_NO_FREE_MOVE))
        return;

    // Only alert for hostiles!
    if (m_creature->IsCivilian() || m_creature->HasReactState(REACT_PASSIVE) || !m_creature->IsValidAttackTarget(who))
        return;

    // 10 sec cooldown for stealth warning
    if (WorldTimer::getMSTimeDiffToNow(m_uLastAlertTime) < 10000)
        return;

    // Send alert sound (if any) for this creature
    m_creature->SendAIReaction(AI_REACTION_ALERT);

    // Face the unit (stealthed player) and set distracted state for 5 seconds
    m_creature->StopMoving();
    m_creature->SetFacingTo(m_creature->GetAngle(who->GetPositionX(), who->GetPositionY()));
    m_creature->GetMotionMaster()->MoveDistract(5 * IN_MILLISECONDS);
    m_uLastAlertTime = WorldTimer::getMSTime();
}
