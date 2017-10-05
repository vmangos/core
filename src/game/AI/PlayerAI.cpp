/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2010 MaNGOSZero <http://github.com/mangoszero/mangoszero/>
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

#include "PlayerAI.h"
#include "Player.h"
#include "DBCStores.h"
#include "Log.h"
#include "SpellMgr.h"
#include "MotionMaster.h"
#include "MoveSpline.h"
#include "Spell.h"

// Misc spells we dont want players to cast
static std::vector<uint32> priestSkipSpells =
{
    453,8123,8192,8193,10953,10954,  // mind soothe
    1150,2096,2097,10909,10910,      // mind vision
    1265,9580,9581,9593,10943,10944, // fade
};
static std::vector<uint32> hunterSkipSpells =
{
    75, // auto shot
};

void PlayerAI::Remove()
{
    me->setAI(NULL);
    delete this;
}

PlayerAI::~PlayerAI()
{
}

CanCastResult PlayerAI::CanCastSpell(Unit* pTarget, const SpellEntry *pSpell, bool isTriggered, bool checkControlled)
{
    if (!pTarget)
        return CAST_FAIL_OTHER;
    // If not triggered, we check
    if (!isTriggered)
    {
        // State does not allow
        if (me->hasUnitState(checkControlled ? UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL : UNIT_STAT_CAN_NOT_REACT))
            return CAST_FAIL_STATE;

        if (pSpell->PreventionType == SPELL_PREVENTION_TYPE_SILENCE && me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED))
            return CAST_FAIL_STATE;

        if (pSpell->PreventionType == SPELL_PREVENTION_TYPE_PACIFY && me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
            return CAST_FAIL_STATE;

        // Check for power (also done by Spell::CheckCast())
        if (me->GetPower((Powers)pSpell->powerType) < pSpell->manaCost)
            return CAST_FAIL_POWER;
    }

    if (const SpellRangeEntry *pSpellRange = sSpellRangeStore.LookupEntry(pSpell->rangeIndex))
    {
        if (pTarget != me)
        {
            // pTarget is out of range of this spell (also done by Spell::CheckCast())
            float fDistance = me->GetCombatDistance(pTarget);

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

void PlayerAI::UpdateAI(const uint32 /*diff*/)
{
}

PlayerControlledAI::PlayerControlledAI(Player* pPlayer, Unit* caster) : uiGlobalCD(0), PlayerAI(pPlayer), controllerGuid(caster ? caster->GetObjectGuid() : ObjectGuid())
{
    ASSERT(pPlayer);
    switch (pPlayer->getClass())
    {
        case CLASS_WARRIOR:
        case CLASS_ROGUE:
            bIsMelee = true;
            isHealer = false;
            break;
        case CLASS_PALADIN:
        case CLASS_DRUID:
            bIsMelee = true;
            isHealer = true;
            break;
        case CLASS_PRIEST:
        case CLASS_SHAMAN:
            isHealer = true;
            bIsMelee = false;
            break;
        case CLASS_MAGE:
        case CLASS_WARLOCK:
        case CLASS_HUNTER:
            isHealer = false;
            bIsMelee = false;
            break;
    }
    PlayerSpellMap spells = me->GetSpellMap();
    usableSpells.clear();
    for (PlayerSpellMap::iterator itr = spells.begin(); itr != spells.end(); ++itr)
    {
        if (itr->second.state == PLAYERSPELL_REMOVED || itr->second.disabled)
            continue;
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);
        if (spellInfo->SpellFamilyName == SPELLFAMILY_GENERIC)
            continue;
        if (spellInfo->Attributes & (SPELL_ATTR_PASSIVE | 0x80))
            continue;
        if (spellInfo->AuraInterruptFlags & AURA_INTERRUPT_FLAG_DAMAGE)
            continue;
        if (IsPositiveSpell(itr->first) && !enablePositiveSpells)
            continue;
        switch (pPlayer->getClass())
        {
        case CLASS_WARRIOR:
        case CLASS_ROGUE:
        case CLASS_PALADIN:
        case CLASS_DRUID:
        case CLASS_SHAMAN:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            break;
        case CLASS_HUNTER:
            if (std::find(hunterSkipSpells.begin(), hunterSkipSpells.end(), itr->first) != hunterSkipSpells.end())
                continue;
            break;
        case CLASS_PRIEST:
            if (std::find(priestSkipSpells.begin(), priestSkipSpells.end(), itr->first) != priestSkipSpells.end())
                continue;
            break;
        }
        usableSpells.push_back(itr->first);
    }
    // Suppression des sorts dont on a deja des rangs superieurs
    for (std::vector<uint32>::iterator it = usableSpells.begin(); it != usableSpells.end();)
    {
        bool foundSupRank = false;
        SpellEntry const *pCurrSpell_1 = sSpellMgr.GetSpellEntry(*(it));
        for (std::vector<uint32>::iterator it2 = usableSpells.begin(); it2 != usableSpells.end(); ++it2)
        {
            SpellEntry const *pCurrSpell_2 = sSpellMgr.GetSpellEntry(*(it2));
            if (pCurrSpell_2->SpellFamilyName == pCurrSpell_1->SpellFamilyName && pCurrSpell_2->SpellIconID == pCurrSpell_1->SpellIconID && pCurrSpell_2->SpellVisual == pCurrSpell_1->SpellVisual) // Meme sort, rangs differents
            {
                if (CompareAuraRanks(pCurrSpell_1->Id, pCurrSpell_2->Id) < 0) // pCurrSpell_1 < pCurrSpell_2
                {
                    // Donc on supprime pCurrSpell_1
                    foundSupRank = true;
                    break;
                }
            }
        }
        if (foundSupRank)
        {
            usableSpells.erase(it);
            it = usableSpells.begin();
        }
        else
            ++it;
    }
    
    me->GetMotionMaster()->Clear();
    
    if (caster && caster->ToCreature())
        if (Unit* victim = caster->ToCreature()->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            UpdateTarget(victim);

}

Unit* PlayerControlledAI::FindController()
{
    return me->GetMap()->GetUnit(controllerGuid);
}

void PlayerControlledAI::UpdateTarget(Unit* victim)
{
    if ((victim->isCharmed() && victim->GetCharmerGuid() == me->GetCharmerGuid()) || me->isFeared() || me->IsPolymorphed())
    {
        me->AttackStop();
        me->CastStop();
        return;
    }

    Unit* controller = FindController();

    bool isNewVictim = me->getVictim() != victim;

    if (isNewVictim)
        me->Attack(victim, true);

    // Mode combat
    if (controller && controller->GetTypeId() == TYPEID_PLAYER)
    {
        me->SetInCombatWith(victim);
        controller->SetInCombatWith(victim);

        if (!me->GetMotionMaster()->empty() && me->GetMotionMaster()->GetCurrentMovementGeneratorType() != IDLE_MOTION_TYPE)
            return;
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MoveChase(victim);
    }
    else
    {
        me->SetInCombatWith(victim);
        victim->SetInCombatWith(me);
        if (controller)
        {
            controller->SetInCombatWith(victim);
            victim->SetInCombatWith(controller);
        }

        if (!bIsMelee)
            me->SetCasterChaseDistance(25.0f);

        if (isNewVictim)
        {
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MoveChase(victim);
            return;
        }
        else
        {
            bool inMeleeRange = me->IsWithinMeleeRange(victim);
            if ( (bIsMelee && inMeleeRange) || (!bIsMelee && !me->IsMoving() && me->IsWithinDist(victim, 30.0f)))
            {
                me->GetMotionMaster()->Clear();
                if (bIsMelee && !me->HasInArc(0.2f, victim))
                {
                    me->SetFacingToObject(victim);
                }
                else if (!me->HasInArc(0.5f, victim))
                {
                    me->SetFacingToObject(victim);
                }
            }
            else
            {
                // melee not in melee range or nonmoving caster not in caster range
                if (!me->isInRoots() && !me->IsMoving())
                {
                    me->GetMotionMaster()->Clear();
                    me->GetMotionMaster()->MoveChase(victim);
                }
            }
        }
    }
}

PlayerControlledAI::~PlayerControlledAI()
{
}

void PlayerControlledAI::UpdateAI(const uint32 uiDiff)
{
    if (me->IsDeleted() || !me->IsInWorld() || !me->isAlive())
    {
        me->RemoveAI();
        return;
    }

    Unit* victim = NULL;
    CharmInfo* charmInfo = me->GetCharmInfo();
    Unit* controller = FindController();

    // If controller is a player
    if (controller && controller->GetTypeId() == TYPEID_PLAYER)
    {
        Player* Pcontroller = ((Player*)controller);

        if (!Pcontroller->isAlive())
        {
            me->RemoveCharmAuras();
            // Note that we CANNOT continue after this point since this object has been deleted
            // Pcontroller is a local var on the stack, not a member object, so it is safe to use
            Pcontroller->RemoveCharmAuras();
            return;
        }

        if (charmInfo)
        {
            if (charmInfo->HasReactState(REACT_PASSIVE))
                victim = me->getVictim();
            else if (charmInfo->HasReactState(REACT_DEFENSIVE) || charmInfo->HasReactState(REACT_AGGRESSIVE))
            {
                victim = me->getVictim();
                if (!victim || (victim == Pcontroller))
                    victim = Pcontroller->getVictim();
            }
        }
        else
        {
            victim = me->getVictim();
            if (!victim || (victim == Pcontroller))
                victim = Pcontroller->getVictim();
        }

        if (!victim || (victim == me))
            return;

        UpdateTarget(victim);
    }
    else // If controller is a creature
    {
        Creature* Ccontroller = controller ? controller->ToCreature() : nullptr;

        // Unit * victim = controller-> getVictim ();
        // Ivina <Nostalrius>: chooses the target randomly and not always the target of the controller.
        victim = Ccontroller ? Ccontroller->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0) : me->SelectNearestTarget(50.0f);
        if (Unit* v2 = me->getVictim())
            if (me->canAttack(v2, false))
                victim = v2;

        if (Ccontroller && (!Ccontroller->isAlive() || !Ccontroller->isInCombat()))
        {
            me->RemoveCharmAuras();
            // Note that we CANNOT continue after this point since this object has been deleted
            // Ccontroller is a local var on the stack, not a member object, so it is safe to use
            Ccontroller->RemoveCharmAuras();
            return;
        }

        if (!victim || (victim == me)) // Ivina <Nostalrius>: avoid being targeted
            return;

        // Need a valid target
        if (!me->IsHostileTo(victim))
            return;

        UpdateTarget(victim);


        if (uiGlobalCD < uiDiff)
        {
            if (me->getClass() == CLASS_HUNTER)
            {
                float dist = me->GetDistance(victim);
                if (dist > 10.0f)
                {
                    if (Spell* pSpell = me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
                    {
                        if (pSpell->m_spellInfo && pSpell->m_spellInfo->Id != 75) // auto shoot
                            me->CastSpell(victim, 75, true);
                    }
                }
            }

            if (me->IsNonMeleeSpellCasted(true))
                uiGlobalCD = 200;
            else
            {
                // Since we are going to do something usableSpells [0, urand (0, usableSpells.size () - 1)], we must have at least one element.
                if (usableSpells.empty())
                    return;

                uint32 spellId = usableSpells[urand(0, usableSpells.size() - 1)];
                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
                
                // If its a positive spell we prioritize controller, if he's out of range,
                // ourself, otherwise it will probably not be cast.
                Unit* spellTarget = victim;
                if (controller && IsPositiveSpell(spellInfo, me, controller))
                    spellTarget = controller;
                else if (IsPositiveSpell(spellInfo, me, me))
                    spellTarget = me;

                if (spellInfo)
                {
                    if (CanCastSpell(spellTarget, spellInfo, false, false) == CAST_OK)
                    {
                        me->CastSpell(spellTarget, spellId, false);
                        uiGlobalCD = 1500;
                        if(!bIsMelee)
                            me->SetCasterChaseDistance(25.0f);
                    }
                    else
                    {
                        if (!bIsMelee)
                            me->SetCasterChaseDistance(0.0f);
                    }
                }
            }
        }
        else
            uiGlobalCD -= uiDiff;
    }
}
