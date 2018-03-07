/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 *
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

#include "Unit.h"
#include "Log.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "SpellMgr.h"
#include "QuestDef.h"
#include "Player.h"
#include "Creature.h"
#include "Spell.h"
#include "Group.h"
#include "SpellAuras.h"
#include "MapManager.h"
#include "ObjectAccessor.h"
#include "CreatureAI.h"
#include "TemporarySummon.h"
#include "Formulas.h"
#include "Pet.h"
#include "Util.h"
#include "Totem.h"
#include "BattleGround.h"
#include "InstanceData.h"
#include "MapPersistentStateMgr.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "DBCStores.h"
#include "VMapFactory.h"
#include "MovementGenerator.h"
#include "Transport.h"

#include "ZoneScript.h"
#include "Nostalrius.h"
#include "InstanceData.h"

#include "PathFinder.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "packet_builder.h"
#include "Chat.h"
#include "Anticheat.h"
#include "CreatureLinkingMgr.h"
#include "InstanceStatistics.h"

#include <math.h>
#include <stdarg.h>

//#define DEBUG_DEBUFF_LIMIT

float baseMoveSpeed[MAX_MOVE_TYPE] =
{
    2.5f,                                                   // MOVE_WALK
    7.0f,                                                   // MOVE_RUN
    4.5f,                                                   // MOVE_RUN_BACK
    4.722222f,                                              // MOVE_SWIM
    2.5f,                                                   // MOVE_SWIM_BACK
    3.141594f,                                              // MOVE_TURN_RATE
};


////////////////////////////////////////////////////////////
// Methods of class GlobalCooldownMgr

bool GlobalCooldownMgr::HasGlobalCooldown(SpellEntry const* spellInfo) const
{
    GlobalCooldownList::const_iterator itr = m_GlobalCooldowns.find(spellInfo->StartRecoveryCategory);
    return itr != m_GlobalCooldowns.end() && itr->second.duration && WorldTimer::getMSTimeDiff(itr->second.cast_time, WorldTimer::getMSTime()) < itr->second.duration;
}

void GlobalCooldownMgr::AddGlobalCooldown(SpellEntry const* spellInfo, uint32 gcd)
{
    m_GlobalCooldowns[spellInfo->StartRecoveryCategory] = GlobalCooldown(gcd, WorldTimer::getMSTime());
}

void GlobalCooldownMgr::CancelGlobalCooldown(SpellEntry const* spellInfo)
{
    m_GlobalCooldowns[spellInfo->StartRecoveryCategory].duration = 0;
}

////////////////////////////////////////////////////////////
// Methods of class Unit

Unit::Unit()
    : WorldObject(), i_motionMaster(this), m_ThreatManager(this), m_HostileRefManager(this),
      movespline(new Movement::MoveSpline()), _debugFlags(0), m_needUpdateVisibility(false),
      m_AutoRepeatFirstCast(true), m_castingSpell(0), m_regenTimer(0), _lastDamageTaken(0),
      m_meleeZLimit(MELEE_Z_LIMIT), m_meleeZReach(MELEE_Z_LIMIT), m_lastSanctuaryTime(0)
{
    m_objectType |= TYPEMASK_UNIT;
    m_objectTypeId = TYPEID_UNIT;
    m_updateFlag = (UPDATEFLAG_ALL | UPDATEFLAG_LIVING | UPDATEFLAG_HAS_POSITION);

    m_attackTimer[BASE_ATTACK]   = 0;
    m_attackTimer[OFF_ATTACK]    = 0;
    m_attackTimer[RANGED_ATTACK] = 0;
    m_modAttackSpeedPct[BASE_ATTACK] = 1.0f;
    m_modAttackSpeedPct[OFF_ATTACK] = 1.0f;
    m_modAttackSpeedPct[RANGED_ATTACK] = 1.0f;

    m_modRecalcDamagePct[BASE_ATTACK] = 1.0f;
    m_modRecalcDamagePct[OFF_ATTACK] = 1.0f;
    m_modRecalcDamagePct[RANGED_ATTACK] = 1.0f;

    m_extraAttacks = 0;
    m_extraMute = false;

    m_state = 0;
    m_deathState = ALIVE;

    for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
        m_currentSpells[i] = nullptr;

    m_castCounter = 0;

    //m_Aura = NULL;
    //m_AurasCheck = 2000;
    //m_removeAuraTimer = 4;
    m_spellAuraHoldersUpdateIterator = m_spellAuraHolders.end();
    m_AuraFlags = 0;

    m_Visibility = VISIBILITY_ON;
    m_AINotifyScheduled = false;

    m_detectInvisibilityMask = 0;
    m_invisibilityMask = 0;
    m_transform = 0;
    m_canModifyStats = false;

    for (int i = 0; i < MAX_SPELL_IMMUNITY; ++i)
        m_spellImmune[i].clear();
    for (int i = 0; i < UNIT_MOD_END; ++i)
    {
        m_auraModifiersGroup[i][BASE_VALUE] = 0.0f;
        m_auraModifiersGroup[i][BASE_PCT] = 1.0f;
        m_auraModifiersGroup[i][TOTAL_VALUE] = 0.0f;
        m_auraModifiersGroup[i][TOTAL_PCT] = 1.0f;
    }
    // implement 50% base damage from offhand
    m_auraModifiersGroup[UNIT_MOD_DAMAGE_OFFHAND][TOTAL_PCT] = 0.5f;

    for (uint8 i = 0; i < MAX_ATTACK; ++i)
    {
        for (uint8 j = 0; j < MAX_ITEM_PROTO_DAMAGES; j++)
        {
            m_weaponDamage[i][j].damage[MINDAMAGE] = (j == 0) ? BASE_MINDAMAGE : 0;
            m_weaponDamage[i][j].damage[MAXDAMAGE] = (j == 0) ? BASE_MAXDAMAGE : 0;
            m_weaponDamage[i][j].school = SPELL_SCHOOL_NORMAL;
        }

        m_weaponDamageCount[i] = 1;
    }

    for (int i = 0; i < MAX_STATS; ++i)
        m_createStats[i] = 0.0f;

    m_attacking = nullptr;
    m_modMeleeHitChance = 0.0f;
    m_modRangedHitChance = 0.0f;
    m_modSpellHitChance = 0.0f;
    m_baseSpellCritChance = 5;

    m_CombatTimer = 0;
    m_lastManaUseTimer = 0;

    //m_victimThreat = 0.0f;
    for (int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        m_threatModifier[i] = 1.0f;
    m_isSorted = true;
    for (int i = 0; i < MAX_MOVE_TYPE; ++i)
        m_speed_rate[i] = 1.0f;

    m_charmInfo = nullptr;

    // remove aurastates allowing special moves
    for (int i = 0; i < MAX_REACTIVE; ++i)
    {
        m_reactiveTimer[i] = 0;
        m_reactiveTarget[i].Clear();
    }
    // Phasing
    worldMask = WORLD_DEFAULT_UNIT;

    // Nostalrius : Ivina
    m_lastCastedSpellID = 0;
    m_lastAttackType = MAX_ATTACK;
    _casterChaseDistance = 0.0f;

    m_doExtraAttacks = false;

    m_spellUpdateTimeBuffer = 0;

    m_isCreatureLinkingTrigger = false;
    m_isSpawningLinked = false;
}

Unit::~Unit()
{
    // set current spells as deletable
    for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
    {
        if (m_currentSpells[i])
        {
            m_currentSpells[i]->SetReferencedFromCurrent(false);
            m_currentSpells[i] = nullptr;
        }
    }

    delete m_charmInfo;
    delete movespline;

    // those should be already removed at "RemoveFromWorld()" call
    MANGOS_ASSERT(m_gameObj.size() == 0);
    MANGOS_ASSERT(m_dynObjGUIDs.size() == 0);
    MANGOS_ASSERT(m_deletedAuras.size() == 0);
    MANGOS_ASSERT(m_deletedHolders.size() == 0);
    MANGOS_ASSERT(!m_needUpdateVisibility);
}

void Unit::Update(uint32 update_diff, uint32 p_time)
{
    if (!IsInWorld())
        return;

    // Nostalrius : systeme de contresort des mobs.
    // Boucle 1 pour regler les timers
    for (ProhibitSpellList::iterator it = m_prohibitSpell.begin(); it != m_prohibitSpell.end(); ++it)
    {
        if (it->RestingMsTime < update_diff)
            it->RestingMsTime = 0;
        else
            it->RestingMsTime -= update_diff;
    }
    // Boucle 2 : supprimer les sorts avec Timer=0
    for (ProhibitSpellList::iterator it = m_prohibitSpell.begin(); it != m_prohibitSpell.end();)
    {
        if (it->RestingMsTime == 0)
        {
            m_prohibitSpell.erase(it);
            it = m_prohibitSpell.begin();
            continue;
        }
        ++it;
    }

    // Buffer spell system update time to save on performance when players are updated twice per
    // world update. We do not need to update spells when the interval is only a few ms (~10ms)
    m_spellUpdateTimeBuffer += update_diff;
    if (m_spellUpdateTimeBuffer >= UNIT_SPELL_UPDATE_TIME_BUFFER)
    {
        // WARNING! Order of execution here is important, do not change.
        // Spells must be processed with event system BEFORE they go to _UpdateSpells.
        // Or else we may have some SPELL_STATE_FINISHED spells stalled in pointers, that is bad.
        m_Events.Update(m_spellUpdateTimeBuffer);
        _UpdateSpells(m_spellUpdateTimeBuffer);

        CleanupDeletedAuras();

        // update abilities available only for fraction of time
        UpdateReactives(m_spellUpdateTimeBuffer);

        m_spellUpdateTimeBuffer = 0;
    }

    if (m_lastManaUseTimer)
    {
        if (update_diff >= m_lastManaUseTimer)
            m_lastManaUseTimer = 0;
        else
            m_lastManaUseTimer -= update_diff;
    }

    // update combat timer only for players and pets
    if (isInCombat() && (GetTypeId() == TYPEID_PLAYER || ((Creature*)this)->IsPet() || ((Creature*)this)->isCharmed()))
    {
        // Check UNIT_STAT_MELEE_ATTACKING or UNIT_STAT_CHASE (without UNIT_STAT_FOLLOW in this case) so pets can reach far away
        // targets without stopping half way there and running off.
        // These flags are reset after target dies or another command is given.
        if (GetCharmerGuid().IsPlayer() || GetOwnerGuid().IsPlayer() || GetTypeId() == TYPEID_PLAYER)
        {
            // Pet in combat ?
            Pet* myPet = GetPet();
            if (!myPet || myPet->getHostileRefManager().isEmpty())
            {
                if (m_HostileRefManager.isEmpty())
                {
                    // m_CombatTimer set at aura start and it will be freeze until aura removing
                    if (m_CombatTimer <= update_diff)
                    {
                        // Rage berzerker laisse en combat.
                        if (!HasAuraType(SPELL_AURA_INTERRUPT_REGEN))
                            ClearInCombat();
                    }
                    else
                        m_CombatTimer -= update_diff;
                }
            }
        }
    }

    // extra attack
    Unit* victim = getVictim();
    if (isInCombat() && m_doExtraAttacks && GetExtraAttacks() && victim && CanReachWithMeleeAttack(victim))
    {
        m_doExtraAttacks = false;

        ExtraAttacksLocked(true);

        while (m_extraAttacks)
        {
            AttackerStateUpdate(victim, BASE_ATTACK, true);
            if (m_extraAttacks > 0)
                --m_extraAttacks;
        }
        resetAttackTimer(BASE_ATTACK);

        ExtraAttacksLocked(false);
    }

    if (uint32 base_att = getAttackTimer(BASE_ATTACK))
        setAttackTimer(BASE_ATTACK, (update_diff >= base_att ? 0 : base_att - update_diff));

    if (uint32 base_att = getAttackTimer(OFF_ATTACK))
        setAttackTimer(OFF_ATTACK, (update_diff >= base_att ? 0 : base_att - update_diff));

    if (uint32 ranged_att = getAttackTimer(RANGED_ATTACK))
        setAttackTimer(RANGED_ATTACK, (update_diff >= ranged_att ? 0 : ranged_att - update_diff));

    if (isAlive())
        ModifyAuraState(AURA_STATE_HEALTHLESS_20_PERCENT, GetHealth() < GetMaxHealth() * 0.20f);

    UpdateSplineMovement(p_time);
    GetMotionMaster()->UpdateMotion(p_time);
    if (GetMotionMaster()->NeedsAsyncUpdate() && IsInWorld())
    {
        if (sWorld.getConfig(CONFIG_UINT32_CONTINENTS_MOTIONUPDATE_THREADS) && GetMap()->IsContinent())
            GetMap()->AddUnitToMovementUpdate(this);
        else
            GetMotionMaster()->UpdateMotionAsync(p_time);
    }
    WorldObject::Update(update_diff, p_time);
    if (_delayedActions & OBJECT_DELAYED_ADD_TO_RELOCATED_LIST)
    {
        if (IsInWorld() && !m_needUpdateVisibility)
        {
            m_needUpdateVisibility = true;
            GetMap()->AddRelocatedUnit(this);
        }
        _delayedActions &= ~OBJECT_DELAYED_ADD_TO_RELOCATED_LIST;
    }

    _lastDamageTaken += p_time;
    if (_lastDamageTaken > 60000)
        _damageTakenHistory.clear();
}

bool Unit::UpdateMeleeAttackingState()
{
    Unit* victim = getVictim();
    if (!victim || IsNonMeleeSpellCasted(false))
        return false;

    if (!isAttackReady(BASE_ATTACK) && !(isAttackReady(OFF_ATTACK) && haveOffhandWeapon()))
        return false;

    uint8 swingError = 0;
    if (!CanReachWithMeleeAttack(victim))
    {
        if (isAttackReady(BASE_ATTACK))
            setAttackTimer(BASE_ATTACK, 100);
        if (haveOffhandWeapon() && isAttackReady(OFF_ATTACK))
            setAttackTimer(OFF_ATTACK, 100);
        swingError = 1;
    }
    // 120 degrees of radiant range
    else if (!HasInArc(2 * M_PI_F / 3, victim))
    {
        if (isAttackReady(BASE_ATTACK))
            setAttackTimer(BASE_ATTACK, 100);
        if (haveOffhandWeapon() && isAttackReady(OFF_ATTACK))
            setAttackTimer(OFF_ATTACK, 100);
        swingError = 2;
    }
    else
    {
        if (isAttackReady(BASE_ATTACK))
        {
            // prevent base and off attack in same time, delay attack at 0.2 sec
            if (haveOffhandWeapon())
            {
                if (getAttackTimer(OFF_ATTACK) < ATTACK_DISPLAY_DELAY)
                    setAttackTimer(OFF_ATTACK, ATTACK_DISPLAY_DELAY);
            }
            AttackerStateUpdate(victim, BASE_ATTACK);
            resetAttackTimer(BASE_ATTACK);
        }
        if (haveOffhandWeapon() && isAttackReady(OFF_ATTACK))
        {
            // prevent base and off attack in same time, delay attack at 0.2 sec
            uint32 base_att = getAttackTimer(BASE_ATTACK);
            if (base_att < ATTACK_DISPLAY_DELAY)
                setAttackTimer(BASE_ATTACK, ATTACK_DISPLAY_DELAY);
            // do attack
            AttackerStateUpdate(victim, OFF_ATTACK);
            resetAttackTimer(OFF_ATTACK);
        }
    }

    Player* player = (GetTypeId() == TYPEID_PLAYER ? (Player*)this : NULL);
    if (player && swingError != player->LastSwingErrorMsg())
    {
        if (swingError == 1)
            player->SendAttackSwingNotInRange();
        else if (swingError == 2)
            player->SendAttackSwingBadFacingAttack();
        player->SwingErrorMsg(swingError);
    }

    return swingError == 0;
}

bool Unit::haveOffhandWeapon() const
{
    if (!CanUseEquippedWeapon(OFF_ATTACK))
        return false;

    if (GetTypeId() == TYPEID_PLAYER)
        return ((Player*)this)->GetWeaponForAttack(OFF_ATTACK, true, true);
    else
    {
        uint8 itemClass = GetByteValue(UNIT_VIRTUAL_ITEM_INFO + (1 * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_CLASS);
        if (itemClass == ITEM_CLASS_WEAPON)
            return true;

        return false;
    }
}

void Unit::SendHeartBeat(bool includingSelf)
{
    //m_movementInfo.ChangePosition(GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation());
    m_movementInfo.UpdateTime(WorldTimer::getMSTime());
    WorldPacket data(MSG_MOVE_HEARTBEAT, 31);
    data << GetPackGUID();
    data << m_movementInfo;
    SendMovementMessageToSet(std::move(data), includingSelf);
}

void Unit::resetAttackTimer(WeaponAttackType type)
{
    m_attackTimer[type] = uint32(GetAttackTime(type) * m_modAttackSpeedPct[type]);
}

void Unit::RemoveSpellsCausingAura(AuraType auraType)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        RemoveAurasDueToSpell((*iter)->GetId());
        iter = m_modAuras[auraType].begin();
    }
}

bool Unit::HasAuraTypeByCaster(AuraType auraType, ObjectGuid casterGuid) const
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end(); ++iter)
        if ((*iter)->GetCasterGuid() == casterGuid)
            return true;
    return false;
}

uint64 Unit::GetAuraApplicationMask() const
{
    if (!IsInWorld())
        return 0;

    uint64 mask = 0x0;
    for (uint64 i = MAX_POSITIVE_AURAS; i < MAX_AURAS; ++i)
        if (GetUInt32Value(UNIT_FIELD_AURA + i))
            mask |= uint64(1) << i;
    return mask;
}

uint32 Unit::GetFirstAuraBySpellIconAndVisual(uint32 spellIconId, uint32 spellVisual) const
{
    for (SpellAuraHolderMap::const_iterator i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
    {
        if ((*i).second->GetSpellProto()->SpellIconID == spellIconId && (*i).second->GetSpellProto()->SpellVisual == spellVisual)
            return (*i).second->GetId();
    }
    return 0;
}

void Unit::RemoveSpellsCausingAura(AuraType auraType, SpellAuraHolder* except)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        // skip `except` aura
        if ((*iter)->GetHolder() == except)
        {
            ++iter;
            continue;
        }

        RemoveAurasDueToSpell((*iter)->GetId(), except);
        iter = m_modAuras[auraType].begin();
    }
}

/* Called by DealDamage for auras that have a chance to be dispelled on damage taken. */
void Unit::RemoveSpellbyDamageTaken(AuraType auraType, uint32 damage)
{
    if (!HasAuraType(auraType))
        return;
    if (IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE))
        return;

    // The chance to dispel an aura depends on the damage taken with respect to the casters level.
    uint32 max_dmg = getLevel() > 8 ? 25 * getLevel() - 150 : 50;
    float chance = float(damage) / max_dmg * 100.0f;
    if (roll_chance_f(chance))
    {
        for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
        {
            if ((*iter)->GetSpellProto()->procFlags)
            {
                RemoveAurasDueToSpell((*iter)->GetId());
                iter = m_modAuras[auraType].begin();
            }
            else
                ++iter;
        }
    }
}

// Nostalrius
void Unit::RemoveFearEffectsByDamageTaken(uint32 damage, uint32 exceptSpellId, DamageEffectType damagetype)
{
    if (!HasAuraType(SPELL_AURA_MOD_FEAR))
        return;
    if (IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE))
        return;

    // Formula derived from Youfie's post here:
    // https://forum.nostalrius.org/viewtopic.php?f=5&t=17424#p119432

    // The chance to dispel an aura depends on the damage taken with respect to the caster's level.
    uint32 max_dmg = getLevel() > 8 ? 25 * getLevel() - 150 : 50;

    // Players are 3x more likely to break fears
    if (GetTypeId() == TYPEID_PLAYER)
        max_dmg *= 0.333f;
    // DOT spells are 3x less likely to break fears
    if (damagetype == DOT)
        max_dmg *= 3;

    // for players, this means max_dmg = 450 at level 60, or 1350 if the damage source is a dot
    // for mobs, this means max_dmg = 1350 at level 60, or 4050 if the damage source is a dot

    float chance = float(damage) / float(max_dmg) * 100.0f;

    if (!roll_chance_f(chance))
        return;

    for (AuraList::const_iterator iter = m_modAuras[SPELL_AURA_MOD_FEAR].begin(); iter != m_modAuras[SPELL_AURA_MOD_FEAR].end();)
    {
        // skip `except` aura
        if ((*iter)->GetId() == exceptSpellId)
        {
            ++iter;
            continue;
        }
        bool canRemoveAura = false;
        switch ((*iter)->GetSpellProto()->Mechanic)
        {
            case MECHANIC_FEAR:
            case MECHANIC_TURN: // [Turn Undead] #2878
                canRemoveAura = true;
                break;
        }
        if (!canRemoveAura)
        {
            ++iter;
            continue;
        }
        RemoveAurasDueToSpell((*iter)->GetId());
        iter = m_modAuras[SPELL_AURA_MOD_FEAR].begin();
    }
}

void Unit::DoKillUnit(Unit* victim)
{
    if (!victim)
        victim = this;
    if (!victim->isAlive())
        return;
    DealDamage(victim, victim->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
}

void Unit::DealDamageMods(Unit *victim, uint32 &damage, uint32* absorb)
{
    // [Nostalrius] Pas de degats sous esprit de redemption
    if (!victim->isAlive() || victim->IsTaxiFlying() || (victim->GetTypeId() == TYPEID_UNIT && ((Creature*)victim)->IsInEvadeMode()) ||
            (getClass() == CLASS_PRIEST && HasAura(27827)))
    {
        if (absorb)
            *absorb += damage;
        damage = 0;
        return;
    }

    uint32 originalDamage = damage;

    //Script Event damage Deal
    if (GetTypeId() == TYPEID_UNIT && ((Creature *)this)->AI())
        ((Creature *)this)->AI()->DamageDeal(victim, damage);
    //Script Event damage taken
    if (victim->GetTypeId() == TYPEID_UNIT && ((Creature *)victim)->AI())
        ((Creature *)victim)->AI()->DamageTaken(this, damage);

    if (absorb && originalDamage > damage)
        *absorb += (originalDamage - damage);
}

uint32 Unit::DealDamage(Unit *pVictim, uint32 damage, CleanDamage const* cleanDamage, DamageEffectType damagetype, SpellSchoolMask damageSchoolMask, SpellEntry const *spellProto, bool durabilityLoss, Spell* spell)
{
    // remove affects from victim (including from 0 damage and DoTs)
    if (pVictim != this)
        pVictim->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);

    // remove affects from attacker at any non-DoT damage (including 0 damage)
    if (damagetype != DOT)
    {
        RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
        RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

        if (pVictim != this)
            RemoveSpellsCausingAura(SPELL_AURA_MOD_INVISIBILITY);

        if (pVictim->GetTypeId() == TYPEID_PLAYER && !pVictim->IsMounted() && !pVictim->IsStandState())
            pVictim->SetStandState(UNIT_STAND_STATE_STAND);
    }

    if (!damage)
    {
        if (cleanDamage)
        {
            //sLog.outString("[ABSORB] Deal Damage sur %s (Dam%u|Absorb%u|Resist%u)", pVictim->GetName(), cleanDamage->damage, cleanDamage->absorb, cleanDamage->resist);

            // Rage on outgoing parry/dodge
            if (cleanDamage->hitOutCome == MELEE_HIT_PARRY || cleanDamage->hitOutCome == MELEE_HIT_DODGE)
            {
                if (cleanDamage->damage && damagetype == DIRECT_DAMAGE && this != pVictim && GetTypeId() == TYPEID_PLAYER && (getPowerType() == POWER_RAGE))
                    ((Player*)this)->RewardRage(cleanDamage->damage*0.75, true);
            }

            // Degats recus sous bouclier par exemple.
            if (cleanDamage->absorb)
            {
                if (!spellProto || !spellProto->IsAuraAddedBySpell(SPELL_AURA_MOD_FEAR))
                {
                    if (!(GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsWorldBoss()))
                        pVictim->RemoveFearEffectsByDamageTaken(cleanDamage->absorb, spellProto ? spellProto->Id : 0, damagetype);
                }

                if (!spellProto || !(spellProto->Mechanic == MECHANIC_ROOT || spellProto->IsAuraAddedBySpell(SPELL_AURA_MOD_ROOT)))
                    pVictim->RemoveSpellbyDamageTaken(SPELL_AURA_MOD_ROOT, cleanDamage->absorb);

                pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_DAMAGE, spellProto ? spellProto->Id : 0);

                // interrupt spells like trying to mount even through absorb shields
                if (pVictim->GetTypeId() == TYPEID_PLAYER && damagetype != DOT)
                    pVictim->InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_ABORT_ON_DMG, spellProto ? spellProto->Id : 0);
            }
            if (damagetype != DOT)
            {
                SetInCombatWith(pVictim);
                pVictim->SetInCombatWith(this);
            }

            //PMonsterSay("-> Absorb %5u | Resist %5u. AttackType %u", cleanDamage->absorb, cleanDamage->resist, cleanDamage->hitOutCome);
            SetContestedPvP(pVictim);
        }
        return 0;
    }
    //else if (cleanDamage)
    //    sLog.outString("[NORMAL] Deal Damage sur %s (Dam%u|Absorb%u|Resist%u)", pVictim->GetName(), cleanDamage->damage, cleanDamage->absorb, cleanDamage->resist);

    if (!spellProto || !spellProto->IsAuraAddedBySpell(SPELL_AURA_MOD_FEAR))
    {
        if (!(GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsWorldBoss()))
            pVictim->RemoveFearEffectsByDamageTaken(damage, spellProto ? spellProto->Id : 0, damagetype);
    }

    // root type spells do not dispel the root effect
    if (!spellProto || !(spellProto->Mechanic == MECHANIC_ROOT || spellProto->IsAuraAddedBySpell(SPELL_AURA_MOD_ROOT)))
        pVictim->RemoveSpellbyDamageTaken(SPELL_AURA_MOD_ROOT, damage);

    // no xp,health if type 8 /critters/
    uint32 victimEntry = pVictim->GetEntry();
    if (pVictim->GetTypeId() == TYPEID_UNIT && pVictim->GetCreatureType() == CREATURE_TYPE_CRITTER && victimEntry != 10441 && victimEntry != 10461 && victimEntry != 10536)
    {
        // TODO: fix this part
        // Critter may not die of damage taken, instead expect it to run away (no fighting back)
        // If (this) is TYPEID_PLAYER, (this) will enter combat w/victim, but after some time, automatically leave combat.
        // It is unclear how it should work for other cases.

        Creature* creature = pVictim->ToCreature();
        creature->SetLootRecipient(this);

        pVictim->SetDeathState(JUST_DIED);
        pVictim->SetHealth(0);

        if (!creature->IsPet())
        {
            creature->DeleteThreatList();
            if (CreatureInfo const *cinfo = creature->GetCreatureInfo())
                if (cinfo->lootid || cinfo->maxgold > 0)
                    creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
        }
        // some critters required for quests
        if (GetTypeId() == TYPEID_PLAYER)
            if (CreatureInfo const* normalInfo = ObjectMgr::GetCreatureTemplate(pVictim->GetEntry()))
                ((Player*)this)->KilledMonster(normalInfo, pVictim->GetObjectGuid());
        // Nostalrius : ajout de 'JustDied' pour les CRITTER.
        if (CreatureAI* pAi = pVictim->AI())
            pAi->JustDied(this);

        if (InstanceData* mapInstance = pVictim->GetInstanceData())
            mapInstance->OnCreatureDeath(((Creature*)pVictim));

        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamage critter, critter dies");

        // Rage from Damage made vs critters (only from direct weapon damage)
        if (damage && damagetype == DIRECT_DAMAGE && this != pVictim && GetTypeId() == TYPEID_PLAYER && (getPowerType() == POWER_RAGE))
            ((Player*)this)->RewardRage(damage, true);

        return damage;
    }

    uint32 health = pVictim->GetHealth();
    // duel ends when player has 1 or less hp
    bool duel_hasEnded = false;
    if (pVictim->GetTypeId() == TYPEID_PLAYER && ((Player*)pVictim)->duel && damage >= (health - 1))
    {
        // prevent kill only if killed in duel and killed by opponent or opponent controlled creature
        if (((Player*)pVictim)->duel->opponent == this || ((Player*)pVictim)->duel->opponent->GetObjectGuid() == GetOwnerGuid())
            damage = health - 1;

        duel_hasEnded = true;
    }
    //Get in CombatState
    if ((pVictim != this) && (damagetype != DOT) &&
            (!spellProto || !spellProto->IsAuraAddedBySpell(SPELL_AURA_DAMAGE_SHIELD)))
    {
        SetInCombatWith(pVictim);
        pVictim->SetInCombatWith(this);
        if (GetTypeId() == TYPEID_PLAYER && pVictim->GetTypeId() == TYPEID_UNIT)
            pVictim->ToCreature()->ResetLastDamageTakenTime();

        SetContestedPvP(pVictim);
    }
    if (pVictim->GetTypeId() == TYPEID_UNIT)
        pVictim->ToCreature()->CountDamageTaken(damage, GetCharmerOrOwnerOrOwnGuid().IsPlayer() || pVictim == this);
    else if (pVictim != this)
    {
        if (Player* attackerPlayer = GetAffectingPlayer())
            pVictim->UnitDamaged(attackerPlayer->GetObjectGuid(), damage);
        else
            pVictim->UnitDamaged(ObjectGuid(), damage);
    }

    // Rage from Damage made (only from direct weapon damage)
    if (damage && damagetype == DIRECT_DAMAGE && this != pVictim && GetTypeId() == TYPEID_PLAYER && (getPowerType() == POWER_RAGE))
        ((Player*)this)->RewardRage(damage, true);

    if (Creature* creaVictim = pVictim->ToCreature())
        if (!creaVictim->IsPet() && !creaVictim->HasLootRecipient())
            creaVictim->SetLootRecipient(this);
    if (health <= damage)
    {
        // Can't kill gods
        if (Player* pPlayer = pVictim->ToPlayer())
            if (pPlayer->IsGod())
                return 0;

        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamage: victim just died");
        Kill(pVictim, spellProto, durabilityLoss); // Function too long, we cut
        // last damage from non duel opponent or opponent controlled creature
        if (duel_hasEnded)
        {
            MANGOS_ASSERT(pVictim->GetTypeId() == TYPEID_PLAYER);
            Player *he = (Player*)pVictim;

            MANGOS_ASSERT(he->duel);

            he->duel->opponent->CombatStopWithPets(true);
            he->CombatStopWithPets(true);

            he->DuelComplete(DUEL_INTERUPTED);
        }
    }
    else                                                    // if (health <= damage)
    {
        pVictim->ModifyHealth(- (int32)damage);

        if (damagetype != DOT)
        {
            if (!getVictim())
            {
                // if not have main target then attack state with target (including AI call)
                //start melee attacks only after melee hit
                Attack(pVictim, (damagetype == DIRECT_DAMAGE));
            }

            // if damage pVictim call AI reaction
            if (!spell) // AttackedBy already handled at spell cast
                pVictim->AttackedBy(this);
        }

        // polymorphed, hex and other negative transformed cases
        uint32 morphSpell = pVictim->getTransForm();
        if (morphSpell && !IsPositiveSpell(morphSpell))
        {
            if (SpellEntry const* morphEntry = sSpellMgr.GetSpellEntry(morphSpell))
            {
                if (IsSpellHaveAura(morphEntry, SPELL_AURA_MOD_CONFUSE))
                    pVictim->RemoveAurasDueToSpell(morphSpell);
                else if (IsSpellHaveAura(morphEntry, SPELL_AURA_MOD_PACIFY_SILENCE))
                    pVictim->RemoveSpellbyDamageTaken(SPELL_AURA_MOD_PACIFY_SILENCE, damage);
            }
        }

        if (damagetype == DIRECT_DAMAGE || damagetype == SPELL_DIRECT_DAMAGE)
        {
            if (!spellProto || !(spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_DIRECT_DAMAGE))
                pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_DIRECT_DAMAGE);
        }
        if (pVictim->GetTypeId() != TYPEID_PLAYER)
        {
            float threat = damage * sSpellMgr.GetSpellThreatMultiplier(spellProto);
            pVictim->AddThreat(this, threat, (cleanDamage && cleanDamage->hitOutCome == MELEE_HIT_CRIT), damageSchoolMask, spellProto);
        }
        else                                                // victim is a player
        {
            // Rage from damage received
            if (this != pVictim && pVictim->getPowerType() == POWER_RAGE)
            {
                ((Player*)pVictim)->RewardRage(damage, false);
            }

            // random durability for items (HIT TAKEN)
            if (roll_chance_f(sWorld.getConfig(CONFIG_FLOAT_RATE_DURABILITY_LOSS_DAMAGE)))
            {
                EquipmentSlots slot = EquipmentSlots(urand(0, EQUIPMENT_SLOT_END - 1));
                ((Player*)pVictim)->DurabilityPointLossForEquipSlot(slot);
            }
        }

        if (GetTypeId() == TYPEID_PLAYER)
        {
            // random durability for items (HIT DONE)
            if (roll_chance_f(sWorld.getConfig(CONFIG_FLOAT_RATE_DURABILITY_LOSS_DAMAGE)))
            {
                EquipmentSlots slot = EquipmentSlots(urand(0, EQUIPMENT_SLOT_END - 1));
                ((Player*)this)->DurabilityPointLossForEquipSlot(slot);
            }
        }

        // Prevent item procs from breaking the CC that caused them
        bool isProcSpell = false;
        if (spell && spell->m_triggeredBySpellInfo && spell->m_triggeredByParentSpellInfo)
            isProcSpell = HasAuraWithSpellTriggerEffect(spell->m_triggeredBySpellInfo);

        if (isProcSpell)
            pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_DAMAGE, spell->m_triggeredByParentSpellInfo->Id);
        else
            pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_DAMAGE, spellProto ? spellProto->Id : 0);

        if (damagetype != NODAMAGE && damage && pVictim->GetTypeId() == TYPEID_PLAYER)
        {
            if (damagetype != DOT)
            {
                for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
                {
                    // skip channeled spell (processed differently below)
                    if (i == CURRENT_CHANNELED_SPELL)
                        continue;

                    if (Spell* spell = pVictim->GetCurrentSpell(CurrentSpellTypes(i)))
                    {
                        if (spell->getState() == SPELL_STATE_PREPARING)
                        {
                            if (spell->m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_ABORT_ON_DMG)
                                pVictim->InterruptSpell(CurrentSpellTypes(i));
                            else
                                spell->Delayed();
                        }
                    }
                }

                if (Spell* spell = pVictim->m_currentSpells[CURRENT_CHANNELED_SPELL])
                {
                    if (spell->getState() == SPELL_STATE_CASTING)
                    {
                        uint32 channelInterruptFlags = spell->m_spellInfo->ChannelInterruptFlags;
                        if (channelInterruptFlags & CHANNEL_FLAG_DELAY)
                        {
                            if (pVictim != this)                //don't shorten the duration of channeling if you damage yourself
                                spell->DelayedChannel();
                        }
                        else if ((channelInterruptFlags & (CHANNEL_FLAG_DAMAGE | CHANNEL_FLAG_DAMAGE2)))
                        {
                            DETAIL_LOG("Spell %u canceled at damage!", spell->m_spellInfo->Id);
                            pVictim->InterruptSpell(CURRENT_CHANNELED_SPELL);
                        }
                    }
                    else if (spell->getState() == SPELL_STATE_DELAYED)
                        // break channeled spell in delayed state on damage
                    {
                        DETAIL_LOG("Spell %u canceled at damage!", spell->m_spellInfo->Id);
                        pVictim->InterruptSpell(CURRENT_CHANNELED_SPELL);
                    }
                }
            }
        }

        // last damage from duel opponent
        if (duel_hasEnded)
        {
            MANGOS_ASSERT(pVictim->GetTypeId() == TYPEID_PLAYER);
            Player *he = (Player*)pVictim;

            MANGOS_ASSERT(he->duel);

            he->SetHealth(1);

            he->duel->opponent->CombatStopWithPets(true);
            he->CombatStopWithPets(true);

            he->CastSpell(he, 7267, true);                  // beg
            he->DuelComplete(DUEL_WON);
        }
    }

    return damage;
}

void Unit::Kill(Unit* pVictim, SpellEntry const *spellProto, bool durabilityLoss)
{
    // find player: owner of controlled `this` or `this` itself maybe
    // for loot will be sued only if group_tap==NULL
    Player *player_tap = GetCharmerOrOwnerPlayerOrPlayerItself();
    Creature* creature = pVictim->ToCreature();
    Group *group_tap = nullptr;

    // find owner of pVictim, used for creature cases, AI calls
    Unit* pOwner = pVictim->GetCharmerOrOwner();

    // in creature kill case group/player tap stored for creature
    if (creature)
    {
        if (creature->IsLootAllowedDueToDamageOrigin())
        {
            group_tap = creature->GetGroupLootRecipient();

            if (Player* recipient = creature->GetOriginalLootRecipient())
                player_tap = recipient;
            // Set correct group_tap if player entered a group
            if (player_tap && !group_tap)
                group_tap = player_tap->GetGroup();
        }
        else if (creature->lootForCreator && creature->GetCreatorGuid())
        {
            Unit* creator = GetUnit(*this, creature->GetCreatorGuid());
            if (creator->IsPlayer())
                player_tap = (Player*)creator;
        }
        else
            creature->SetLootRecipient(nullptr);
    }
    // in player kill case group tap selected by player_tap (killer-player itself, or charmer, or owner, etc)
    else
    {
        if (player_tap)
            group_tap = player_tap->GetGroup();
    }

    // Nostalrius: Loots desactives / map (retire ici l'XP et les reputs)
    bool allowLoot = !sObjectMgr.IsMapLootDisabled(GetMapId());
    // call kill spell proc event (before real die and combat stop to triggering auras removed at death/combat stop)
    if (allowLoot && player_tap && player_tap != pVictim)
    {
        WorldPacket data(SMSG_PARTYKILLLOG, (8 + 8));   //send event PARTY_KILL
        data << player_tap->GetObjectGuid();            //player with killing blow
        data << pVictim->GetObjectGuid();              //victim

        Player* looter = player_tap;
        if (group_tap)
        {
            group_tap->BroadcastPacket(&data, false, group_tap->GetMemberGroup(player_tap->GetObjectGuid()), player_tap->GetObjectGuid());

            if (creature)
            {
                group_tap->UpdateLooterGuid(creature, true);
                if (group_tap->GetLooterGuid())
                {
                    looter = ObjectAccessor::FindPlayer(group_tap->GetLooterGuid());

                    // Master looter offline or on loading screen
                    if (!looter && group_tap->GetLootMethod() == MASTER_LOOT)
                    {
                        // give master looter to the leader / assistants if possible, otherwise switch to group loot
                        for (Group::member_citerator itr = group_tap->GetMemberSlots().begin(); itr != group_tap->GetMemberSlots().end(); ++itr)
                        {
                            if (itr->guid != group_tap->GetLooterGuid() && (itr->guid == group_tap->GetLeaderGuid() || itr->assistant))
                                if (looter = ObjectAccessor::FindPlayer(itr->guid))
                                    break;
                        }

                        if (!looter)
                        {
                            group_tap->SetLootMethod(GROUP_LOOT);
                            group_tap->SetLootThreshold(ITEM_QUALITY_UNCOMMON);
                            group_tap->UpdateLooterGuid(creature);
                            looter = ObjectAccessor::FindPlayer(group_tap->GetLooterGuid());
                        }
                        else
                        {
                            group_tap->SetLooterGuid(looter->GetGUID());
                            group_tap->SendUpdate();
                        }
                    }
                    
                    if (looter)
                    {
                        creature->SetLootRecipient(looter);   // update creature loot recipient to the allowed looter.
                        group_tap->SendLooter(creature, looter);
                    }
                    else
                        group_tap->SendLooter(creature, nullptr);
                }
                else
                    group_tap->SendLooter(creature, nullptr);

                group_tap->UpdateLooterGuid(creature);
            }
        }

        player_tap->SendDirectMessage(&data);

        if (creature)
        {
            Loot* loot = &creature->loot;
            if (creature->lootForPickPocketed)
                creature->lootForPickPocketed = false;

            loot->clear();
            if (!(creature->AI() && creature->AI()->FillLoot(loot, looter)))
            {
                if (uint32 lootid = creature->GetCreatureInfo()->lootid)
                {
                    loot->SetTeam(group_tap ? group_tap->GetTeam() : looter->GetTeam());
                    loot->FillLoot(lootid, LootTemplates_Creature, looter, false, false, creature);
                }
            }

            loot->generateMoneyLoot(creature->GetCreatureInfo()->mingold, creature->GetCreatureInfo()->maxgold);
        }

        if (group_tap)
            group_tap->RewardGroupAtKill(pVictim, player_tap);
        else if (player_tap)
            player_tap->RewardSinglePlayerAtKill(pVictim);
    }
    if (Player* playerVictim = pVictim->ToPlayer())
        playerVictim->RewardHonorOnDeath();

    // To be replaced if possible using ProcDamageAndSpell
    if (pVictim != this) // The one who has the fatal blow
        ProcDamageAndSpell(pVictim, PROC_FLAG_KILL, PROC_FLAG_KILLED, PROC_EX_NONE, 0);

    DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageAttackStop");

    // before the stop of combat, the auras of type CM are withdrawn. We must be able to redirect the mobs to the caster.
    // You should specify 'AURA_REMOVE_BY_DEATH', but this is not useful for these auras.
    pVictim->RemoveCharmAuras();
    // stop combat
    pVictim->CombatStop();
    pVictim->getHostileRefManager().deleteReferences();

    bool damageFromSpiritOfRedemtionTalent = (spellProto && spellProto->Id == 27795);

    // if talent known but not triggered (check priest class for speedup check)
    bool spiritOfRedemtionTalentImmune = false;
    if (pVictim->GetTypeId() == TYPEID_PLAYER && pVictim->getClass() == CLASS_PRIEST)
    {
        if (!damageFromSpiritOfRedemtionTalent &&           // not called from SPELL_AURA_SPIRIT_OF_REDEMPTION
                pVictim->GetTypeId() == TYPEID_PLAYER && pVictim->getClass() == CLASS_PRIEST)
        {
            AuraList const& vDummyAuras = pVictim->GetAurasByType(SPELL_AURA_DUMMY);
            for (AuraList::const_iterator itr = vDummyAuras.begin(); itr != vDummyAuras.end(); ++itr)
            {
                if ((*itr)->GetSpellProto()->SpellIconID == 1654)
                {
                    spiritOfRedemtionTalentImmune = true;
                    break;
                }
            }
        }

        // Already applied spirit of redemption. Fix stuck in ANGEL form.
        if (!spiritOfRedemtionTalentImmune && HasAura(27827))
            return;
    }

    if (!spiritOfRedemtionTalentImmune)
    {
        pVictim->SetHealth(0);
        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "SET JUST_DIED");
        pVictim->SetDeathState(JUST_DIED);
        // Nostalrius: Instantly send values update for health
        if (pVictim->ToPlayer() && pVictim->GetUInt32Value(PLAYER_SELF_RES_SPELL))
            pVictim->DirectSendPublicValueUpdate(PLAYER_SELF_RES_SPELL);
        pVictim->DirectSendPublicValueUpdate(UNIT_FIELD_HEALTH);
    }

    // outdoor pvp things, do these after setting the death state, else the player activity notify won't work... doh...
    // handle player kill only if not suicide (spirit of redemption for example)
    if (GetTypeId() == TYPEID_PLAYER && this != pVictim)
        if (ZoneScript * pZoneScript = ((Player*)this)->GetZoneScript())
            pZoneScript->HandleKill((Player*)this, pVictim);

    DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageHealth1");

    if (spiritOfRedemtionTalentImmune)
    {
        // save value before aura remove
        uint32 ressSpellId = pVictim->GetUInt32Value(PLAYER_SELF_RES_SPELL);
        if (!ressSpellId)
            ressSpellId = ((Player*)pVictim)->GetResurrectionSpellId();

        //Remove all expected to remove at death auras (most important negative case like DoT or periodic triggers)
        pVictim->RemoveAllAurasOnDeath();

        // restore for use at real death
        pVictim->SetUInt32Value(PLAYER_SELF_RES_SPELL, ressSpellId);

        // FORM_SPIRITOFREDEMPTION and related auras
        pVictim->AddAura(27827, ADD_AURA_NO_OPTION, pVictim);
        pVictim->InterruptNonMeleeSpells(false);
    }
    else
        pVictim->SetHealth(0);

    // remember victim PvP death for corpse type and corpse reclaim delay
    // at original death (not at SpiritOfRedemtionTalent timeout)
    if (pVictim->GetTypeId() == TYPEID_PLAYER && !damageFromSpiritOfRedemtionTalent)
        ((Player*)pVictim)->SetPvPDeath(player_tap != nullptr);

    // Call KilledUnit for creatures
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->AI())
        ((Creature*)this)->AI()->KilledUnit(pVictim);

    // Call AI OwnerKilledUnit (for any current summoned minipet/guardian/protector)
    PetOwnerKilledUnit(pVictim);

    // 10% durability loss on death
    // clean InHateListOf
    if (pVictim->GetTypeId() == TYPEID_PLAYER)
    {
        // only if not player and not controlled by player pet. And not at BG
        if (durabilityLoss && !player_tap && !((Player*)pVictim)->InBattleGround())
        {
            DEBUG_LOG("We are dead, loosing 10 percents durability");
            ((Player*)pVictim)->DurabilityLossAll(0.10f, false);
            // durability lost message
            WorldPacket data(SMSG_DURABILITY_DAMAGE_DEATH, 0);
            ((Player*)pVictim)->GetSession()->SendPacket(&data);
        }
    }
    else                                                // creature died
    {
        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageNotPlayer");

        if (!creature->IsPet())
        {
            creature->LogDeath(this);
            creature->UpdateCombatState(false);
            creature->UpdateCombatWithZoneState(false);

            creature->DeleteThreatList();
            if (CreatureInfo const *cinfo = creature->GetCreatureInfo())
                if (cinfo->lootid || cinfo->maxgold > 0)
                    creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
        }

        // Call creature just died function
        if (creature->AI())
            creature->AI()->JustDied(this);

        if (creature->IsTemporarySummon())
        {
            TemporarySummon* pSummon = (TemporarySummon*)creature;
            if (pSummon->GetSummonerGuid().IsCreature())
                if (Creature* pSummoner = creature->GetMap()->GetCreature(pSummon->GetSummonerGuid()))
                    if (pSummoner->AI())
                        pSummoner->AI()->SummonedCreatureJustDied(creature);
        }
        else if (pOwner && pOwner->GetTypeId() == TYPEID_UNIT)
        {
            if (((Creature*)pOwner)->AI())
                ((Creature*)pOwner)->AI()->SummonedCreatureJustDied(creature);
        }

        if (ZoneScript* pScript = creature->GetZoneScript())
            pScript->OnCreatureDeath(creature);

        // Dungeon specific stuff, only applies to players killing creatures
        if (creature->GetInstanceId() && creature->GetMapId() > 1)
        {
            Player* playerKiller = GetCharmerOrOwnerPlayerOrPlayerItself();

            if (!playerKiller && this == creature && player_tap)
                playerKiller = player_tap;

            if (playerKiller)
                creature->GetMap()->BindToInstanceOrRaid(playerKiller, creature->GetRespawnTimeEx(), creature->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_INSTANCE_BIND);
        }
    }

    // If we're in a dungeon, the killer is a creature and the victim is a player
    if (GetInstanceId() && GetMapId() > 1 && this->IsCreature() && pVictim && pVictim->IsPlayer())
    {
        sInstanceStatistics.IncrementKillCounter(this->ToCreature(), pVictim->ToPlayer(), spellProto);
    }

    // battleground things (do this at the end, so the death state flag will be properly set to handle in the bg->handlekill)
    if (pVictim->GetTypeId() == TYPEID_PLAYER && ((Player*)pVictim)->InBattleGround())
    {
        Player *killed = ((Player*)pVictim);
        if (BattleGround *bg = killed->GetBattleGround())
            bg->HandleKillPlayer(killed, player_tap);
    }
    else if (pVictim->GetTypeId() == TYPEID_UNIT)
    {
        if (player_tap)
            if (BattleGround *bg = player_tap->GetBattleGround())
                bg->HandleKillUnit((Creature*)pVictim, player_tap);
    }
    // Nostalrius: interrupt non melee spell casted
    pVictim->InterruptSpellsCastedOnMe(false, true);
    if (player_tap)
        ALL_SESSION_SCRIPTS(player_tap->GetSession(), OnUnitKilled(pVictim->GetObjectGuid()));
}

struct PetOwnerKilledUnitHelper
{
    explicit PetOwnerKilledUnitHelper(Unit* pVictim) : m_victim(pVictim) {}
    void operator()(Unit* pTarget) const
    {
        if (pTarget->GetTypeId() == TYPEID_UNIT)
        {
            if (((Creature*)pTarget)->AI())
                ((Creature*)pTarget)->AI()->OwnerKilledUnit(m_victim);
        }
    }

    Unit* m_victim;
};

void Unit::PetOwnerKilledUnit(Unit* pVictim)
{
    // for minipet and guardians (including protector)
    CallForAllControlledUnits(PetOwnerKilledUnitHelper(pVictim), CONTROLLED_MINIPET | CONTROLLED_GUARDIANS);
}

void Unit::CastStop(uint32 except_spellid)
{
    for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
        if (Spell* spell = GetCurrentSpell(CurrentSpellTypes(i)))
            if (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime())
                InterruptSpell(CurrentSpellTypes(i), false);
}

void Unit::CastSpell(Unit* Victim, uint32 spellId, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return;
    }

    CastSpell(Victim, spellInfo, triggered, castItem, triggeredByAura, originalCaster, triggeredBy, triggeredByParent);
}

void Unit::CastSpell(Unit* Victim, SpellEntry const *spellInfo, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy, SpellEntry const* triggeredByParent)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell: unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell: unknown spell by caster: %s", GetGuidStr().c_str());
        return;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell *spell = new Spell(this, spellInfo, triggered, originalCaster, triggeredBy, NULL, triggeredByParent);

    SpellCastTargets targets;

    // Don't set unit target on destination target based spells, otherwise the spell will cancel
    // as soon as the target dies or leaves the area of the effect
    if (spellInfo->Targets & TARGET_FLAG_DEST_LOCATION)
        targets.setDestination(Victim->GetPositionX(), Victim->GetPositionY(), Victim->GetPositionZ());
    else
        targets.setUnitTarget(Victim);

    if (spellInfo->Targets & TARGET_FLAG_SOURCE_LOCATION)
        if (WorldObject* caster = spell->GetCastingObject())
            targets.setSource(caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());

    spell->SetCastItem(castItem);
    spell->prepare(std::move(targets), triggeredByAura);
}

void Unit::CastCustomSpell(Unit* Victim, uint32 spellId, int32 const* bp0, int32 const* bp1, int32 const* bp2, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastCustomSpell: unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastCustomSpell: unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return;
    }

    CastCustomSpell(Victim, spellInfo, bp0, bp1, bp2, triggered, castItem, triggeredByAura, originalCaster, triggeredBy);
}

void Unit::CastCustomSpell(Unit* Victim, SpellEntry const *spellInfo, int32 const* bp0, int32 const* bp1, int32 const* bp2, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastCustomSpell: unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastCustomSpell: unknown spell by caster: %s", GetGuidStr().c_str());
        return;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell *spell = new Spell(this, spellInfo, triggered, originalCaster, triggeredBy);

    if (bp0)
        spell->m_currentBasePoints[EFFECT_INDEX_0] = *bp0;

    if (bp1)
        spell->m_currentBasePoints[EFFECT_INDEX_1] = *bp1;

    if (bp2)
        spell->m_currentBasePoints[EFFECT_INDEX_2] = *bp2;

    SpellCastTargets targets;
    targets.setUnitTarget(Victim);
    spell->SetCastItem(castItem);
    spell->prepare(std::move(targets), triggeredByAura);
}

// used for scripting
void Unit::CastSpell(float x, float y, float z, uint32 spellId, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);

    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell(x,y,z): unknown spell id %i by caster: %s triggered by aura %u (eff %u)", spellId, GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell(x,y,z): unknown spell id %i by caster: %s", spellId, GetGuidStr().c_str());
        return;
    }

    CastSpell(x, y, z, spellInfo, triggered, castItem, triggeredByAura, originalCaster, triggeredBy);
}

// used for scripting
void Unit::CastSpell(float x, float y, float z, SpellEntry const *spellInfo, bool triggered, Item *castItem, Aura* triggeredByAura, ObjectGuid originalCaster, SpellEntry const* triggeredBy)
{
    if (!spellInfo)
    {
        if (triggeredByAura)
            sLog.outError("CastSpell(x,y,z): unknown spell by caster: %s triggered by aura %u (eff %u)", GetGuidStr().c_str(), triggeredByAura->GetId(), triggeredByAura->GetEffIndex());
        else
            sLog.outError("CastSpell(x,y,z): unknown spell by caster: %s", GetGuidStr().c_str());
        return;
    }

    if (castItem)
        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "WORLD: cast Item spellId - %i", spellInfo->Id);

    if (triggeredByAura)
    {
        if (!originalCaster)
            originalCaster = triggeredByAura->GetCasterGuid();

        triggeredBy = triggeredByAura->GetSpellProto();
    }

    Spell *spell = new Spell(this, spellInfo, triggered, originalCaster, triggeredBy);

    SpellCastTargets targets;
    targets.setDestination(x, y, z);
    spell->SetCastItem(castItem);
    spell->prepare(std::move(targets), triggeredByAura);
}

// Obsolete func need remove, here only for comotability vs another patches
uint32 Unit::SpellNonMeleeDamageLog(Unit *pVictim, uint32 spellID, uint32 damage)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellID);
    SpellNonMeleeDamage damageInfo(this, pVictim, spellInfo->Id, SpellSchools(spellInfo->School));
    CalculateSpellDamage(&damageInfo, damage, spellInfo);
    damageInfo.target->CalculateAbsorbResistBlock(this, &damageInfo, spellInfo);
    DealDamageMods(damageInfo.target, damageInfo.damage, &damageInfo.absorb);
    SendSpellNonMeleeDamageLog(&damageInfo);
    DealSpellDamage(&damageInfo, true);
    return damageInfo.damage;
}

void Unit::CalculateSpellDamage(SpellNonMeleeDamage *damageInfo, int32 damage, SpellEntry const *spellInfo, WeaponAttackType attackType, Spell* spell)
{
    SpellSchoolMask damageSchoolMask = GetSchoolMask(damageInfo->school);
    Unit *pVictim = damageInfo->target;
    if (!pVictim)
        return;

    if (damage < 0)
        return;

    if (!pVictim->isAlive())
        return;

    // Check spell crit chance
    bool crit = IsSpellCrit(pVictim, spellInfo, damageSchoolMask, attackType, spell);

    // damage bonus (per damage class)
    switch (spellInfo->DmgClass)
    {
        // Melee and Ranged Spells
    case SPELL_DAMAGE_CLASS_RANGED:
    case SPELL_DAMAGE_CLASS_MELEE:
    {
        //Calculate damage bonus
        damage = MeleeDamageBonusDone(pVictim, damage, attackType, spellInfo, SPELL_DIRECT_DAMAGE, 1, spell);
        damage = pVictim->MeleeDamageBonusTaken(this, damage, attackType, spellInfo, SPELL_DIRECT_DAMAGE, 1, spell);

        // if crit add critical bonus
        if (crit)
        {
            damageInfo->HitInfo |= SPELL_HIT_TYPE_CRIT;
            damage = SpellCriticalDamageBonus(spellInfo, damage, pVictim, spell);
        }
    }
    break;
    // Magical Attacks
    case SPELL_DAMAGE_CLASS_NONE:
    case SPELL_DAMAGE_CLASS_MAGIC:
    {
        // Calculate damage bonus
        damage = SpellDamageBonusDone(pVictim, spellInfo, damage, SPELL_DIRECT_DAMAGE, 1, spell);
        damage = pVictim->SpellDamageBonusTaken(this, spellInfo, damage, SPELL_DIRECT_DAMAGE, 1, spell);

        // If crit add critical bonus
        if (crit)
        {
            damageInfo->HitInfo |= SPELL_HIT_TYPE_CRIT;
            damage = SpellCriticalDamageBonus(spellInfo, damage, pVictim, spell);
        }
    }
    break;
    }

    // damage mitigation
    if (damage > 0)
    {
        // physical damage => armor
        if (damageSchoolMask & SPELL_SCHOOL_MASK_NORMAL && !(spellInfo->Custom & SPELL_CUSTOM_IGNORE_ARMOR))
            damage = CalcArmorReducedDamage(pVictim, damage);
    }
    else
        damage = 0;
    damageInfo->damage = damage;
}

void Unit::DealSpellDamage(SpellNonMeleeDamage *damageInfo, bool durabilityLoss)
{
    if (!damageInfo)
        return;

    Unit *pVictim = damageInfo->target;

    if (!pVictim)
        return;

    if (!pVictim->isAlive() || pVictim->IsTaxiFlying() || (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode()))
        return;

    SpellEntry const *spellProto = sSpellMgr.GetSpellEntry(damageInfo->SpellID);
    if (spellProto == nullptr)
    {
        sLog.outError("Unit::DealSpellDamage have wrong damageInfo->SpellID: %u", damageInfo->SpellID);
        return;
    }

    // Call default DealDamage (send critical in hit info for threat calculation)
    CleanDamage cleanDamage(0, BASE_ATTACK, damageInfo->HitInfo & SPELL_HIT_TYPE_CRIT ? MELEE_HIT_CRIT : MELEE_HIT_NORMAL, damageInfo->absorb, damageInfo->resist);
    DealDamage(pVictim, damageInfo->damage, &cleanDamage, SPELL_DIRECT_DAMAGE, GetSchoolMask(damageInfo->school), spellProto, durabilityLoss, damageInfo->spell);
}

//TODO for melee need create structure as in
void Unit::CalculateMeleeDamage(Unit *pVictim, uint32 damage, CalcDamageInfo *damageInfo, WeaponAttackType attackType)
{
    if (!pVictim)
        return;
    if (!isAlive() || !pVictim->isAlive())
        return;

    damageInfo->attacker         = this;
    damageInfo->target           = pVictim;
    damageInfo->attackType       = attackType;
    damageInfo->totalDamage      = 0;
    damageInfo->cleanDamage      = 0;
    damageInfo->totalAbsorb      = 0;
    damageInfo->totalResist      = 0;
    damageInfo->blocked_amount   = 0;

    damageInfo->TargetState      = VICTIMSTATE_UNAFFECTED;
    damageInfo->HitInfo          = HITINFO_NORMALSWING;
    damageInfo->procAttacker     = PROC_FLAG_NONE;
    damageInfo->procVictim       = PROC_FLAG_NONE;
    damageInfo->procEx           = PROC_EX_NONE;
    damageInfo->hitOutCome       = MELEE_HIT_EVADE;

    // Select HitInfo/procAttacker/procVictim flag based on attack type
    switch (attackType)
    {
        case BASE_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_SUCCESSFUL_MELEE_HIT;
            damageInfo->procVictim   = PROC_FLAG_TAKEN_MELEE_HIT;
            damageInfo->HitInfo      = HITINFO_NORMALSWING2;
            SetLastAttackType(0); // Nostalrius : Ivina (lastAttackType)
            break;
        case OFF_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_SUCCESSFUL_MELEE_HIT | PROC_FLAG_SUCCESSFUL_OFFHAND_HIT;
            damageInfo->procVictim   = PROC_FLAG_TAKEN_MELEE_HIT;//|PROC_FLAG_TAKEN_OFFHAND_HIT // not used
            damageInfo->HitInfo = HITINFO_LEFTSWING;
            SetLastAttackType(1);
            break;
        case RANGED_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_SUCCESSFUL_RANGED_HIT;
            damageInfo->procVictim   = PROC_FLAG_TAKEN_RANGED_HIT;
            damageInfo->HitInfo = HITINFO_UNK3;             // test (dev note: test what? HitInfo flag possibly not confirmed.)
            SetLastAttackType(2);
            break;
        default:
            break;
    }

    bool immune = true;
    bool feral = IsInFeralForm();

    // Only get one damage type for feral druids so they don't receive incorrect benefits
    // from weapons with multiple types of damage
    uint8 actualDamageCount = feral ? 1 : m_weaponDamageCount[damageInfo->attackType];
    for (uint8 i = 0; i < actualDamageCount; i++)
    {
        SubDamageInfo *subDamage = &damageInfo->subDamage[i];

        // feral only allowed melee school
        subDamage->damageSchoolMask = GetTypeId() == TYPEID_PLAYER && !feral
            ? GetSchoolMask(GetWeaponDamageSchool(damageInfo->attackType, i))
            : GetMeleeDamageSchoolMask();

        if (damageInfo->target->IsImmuneToDamage(subDamage->damageSchoolMask))
        {
            subDamage->damage = 0;
            continue;
        }
        else
            immune = false;

        subDamage->damage = CalculateDamage(damageInfo->attackType, false, i);
        // Add melee damage bonus
        subDamage->damage = MeleeDamageBonusDone(damageInfo->target, subDamage->damage, damageInfo->attackType, nullptr, DIRECT_DAMAGE, 1, nullptr, i == 0);
        subDamage->damage = damageInfo->target->MeleeDamageBonusTaken(this, subDamage->damage, damageInfo->attackType, nullptr, DIRECT_DAMAGE, 1, nullptr, i == 0);

        // Calculate armor reduction
        if(subDamage->damageSchoolMask == SPELL_SCHOOL_MASK_NORMAL)
        {
            damageInfo->cleanDamage += subDamage->damage;
            subDamage->damage = CalcArmorReducedDamage(damageInfo->target, subDamage->damage);
            damageInfo->cleanDamage -= subDamage->damage;
        }

        damageInfo->totalDamage += subDamage->damage;
    }

    // Physical Immune check
    if (immune)
    {
        damageInfo->HitInfo |= HITINFO_NORMALSWING;
        damageInfo->TargetState = VICTIMSTATE_IS_IMMUNE;

        damageInfo->procEx |= PROC_EX_IMMUNE;
        damageInfo->totalDamage = 0;
        damageInfo->cleanDamage = 0;
        return;
    }

    damageInfo->hitOutCome = RollMeleeOutcomeAgainst(damageInfo->target, damageInfo->attackType);

    // Disable parry or dodge for ranged attack
    if (damageInfo->attackType == RANGED_ATTACK)
    {
        if (damageInfo->hitOutCome == MELEE_HIT_PARRY) damageInfo->hitOutCome = MELEE_HIT_NORMAL;
        if (damageInfo->hitOutCome == MELEE_HIT_DODGE) damageInfo->hitOutCome = MELEE_HIT_MISS;
    }

    switch (damageInfo->hitOutCome)
    {
        case MELEE_HIT_EVADE:
        {
            damageInfo->HitInfo |= HITINFO_MISS | HITINFO_SWINGNOHITSOUND;
            damageInfo->TargetState = VICTIMSTATE_EVADES;

            damageInfo->procEx |= PROC_EX_EVADE;
            damageInfo->totalDamage = 0;
            damageInfo->cleanDamage = 0;

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = 0;

            return;
        }
        case MELEE_HIT_MISS:
        {
            damageInfo->HitInfo |= HITINFO_MISS;
            damageInfo->TargetState = VICTIMSTATE_UNAFFECTED;

            damageInfo->procEx |= PROC_EX_MISS;
            damageInfo->totalDamage = 0;
            damageInfo->cleanDamage = 0;

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = 0;

            break;
        }
        case MELEE_HIT_NORMAL:
        {
            damageInfo->TargetState = VICTIMSTATE_NORMAL;
            damageInfo->procEx |= PROC_EX_NORMAL_HIT;
            break;
        }
        case MELEE_HIT_CRIT:
        {
            damageInfo->HitInfo |= HITINFO_CRITICALHIT;
            damageInfo->TargetState = VICTIMSTATE_NORMAL;

            damageInfo->procEx |= PROC_EX_CRITICAL_HIT;

            uint32 creatureTypeMask = damageInfo->target->GetCreatureTypeMask();

            int32 mod = GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_CRIT_PERCENT_VERSUS, creatureTypeMask);

            damageInfo->totalDamage = uint32((damageInfo->totalDamage) * float((200.0f + mod) / 100.0f));

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = uint32((damageInfo->subDamage[i].damage) * float((200.0f + mod) / 100.0f));

            break;
        }
        case MELEE_HIT_PARRY:
        {
            damageInfo->TargetState = VICTIMSTATE_PARRY;
            damageInfo->procEx |= PROC_EX_PARRY;
            damageInfo->cleanDamage += damageInfo->totalDamage;
            damageInfo->totalDamage = 0;

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = 0;

            break;
        }
        case MELEE_HIT_DODGE:
        {
            damageInfo->TargetState = VICTIMSTATE_DODGE;
            damageInfo->procEx |= PROC_EX_DODGE;
            damageInfo->cleanDamage += damageInfo->totalDamage;
            damageInfo->totalDamage = 0;

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = 0;

            break;
        }
        case MELEE_HIT_BLOCK:
        {
            damageInfo->TargetState = VICTIMSTATE_NORMAL;
            damageInfo->procEx |= PROC_EX_BLOCK;
            damageInfo->blocked_amount = damageInfo->target->GetShieldBlockValue();
            if (damageInfo->blocked_amount >= damageInfo->subDamage[0].damage)
            {
                damageInfo->TargetState = VICTIMSTATE_BLOCKS;
                damageInfo->blocked_amount = damageInfo->subDamage[0].damage;
            }
            else
                damageInfo->procEx |= PROC_EX_NORMAL_HIT;   // Partial blocks can still cause attacker procs

            damageInfo->totalDamage -= damageInfo->blocked_amount;
            damageInfo->subDamage[0].damage -= damageInfo->blocked_amount;
            damageInfo->cleanDamage += damageInfo->blocked_amount;
            break;
        }
        case MELEE_HIT_GLANCING:
        {
            damageInfo->HitInfo     |= HITINFO_GLANCING;
            damageInfo->TargetState  = VICTIMSTATE_NORMAL;
            damageInfo->procEx |= PROC_EX_NORMAL_HIT;
            // int32 attackerWeaponSkill = GetWeaponSkillValue(damageInfo->attackType,pVictim);
            // int32 victimDefenseSkill = pVictim->GetDefenseSkillValue(this);
            int SkillDiff = 0;
            SkillDiff = pVictim->GetDefenseSkillValue(this) - GetWeaponSkillValue(damageInfo->attackType, pVictim);
            float reducePercent = 1.0f;
            // (Youfie) Formule de calcul de la réduction de dégâts des érafles, influencée en pré-BC par le +skill au delà de [niveau du joueur * 5]
            // Formule d'Athan retenue et supposée comme Blizz-like au regard des multiples sources et tests concordants
            // float reducePercent = 1 - (5*(pow(2,(victimDefenseSkill/5) - (attackerWeaponSkill/5) - 1))/100);
            // Après tentative d'implémentation "propre" de la formule et de nombreux échecs, mise en place de celle-ci après calcul manuel des différentes valeurs
            // cf. http://nostalrius.org/forum/viewtopic.php?p=43964#p43964 pour infos et sources
            if (SkillDiff >= 15)
                reducePercent = 0.6500f;
            if (SkillDiff <= 0)
                reducePercent = 1;
            switch (SkillDiff)
            {
                case 14 :
                    reducePercent = 0.7018f;
                    break;
                case 13 :
                    reducePercent = 0.7469f;
                    break;
                case 12 :
                    reducePercent = 0.7860f;
                    break;
                case 11 :
                    reducePercent = 0.8203f;
                    break;
                case 10 :
                    reducePercent = 0.8500f;
                    break;
                case 9 :
                    reducePercent = 0.8759f;
                    break;
                case 8 :
                    reducePercent = 0.8984f;
                    break;
                case 7 :
                    reducePercent = 0.9180f;
                    break;
                case 6 :
                    reducePercent = 0.9351f;
                    break;
                case 5 :
                    reducePercent = 0.9500f;
                    break;
                case 4 :
                    reducePercent = 0.9629f;
                    break;
                case 3 :
                    reducePercent = 0.9742f;
                    break;
                case 2 :
                    reducePercent = 0.9840f;
                    break;
                case 1 :
                    reducePercent = 0.9926f;
                    break;
            }

            // sLog.outString("SkillDiff = %i, reducePercent = %f", SkillDiff, reducePercent); // Pour tests & débug via la console

            damageInfo->cleanDamage += uint32((1.0f - reducePercent) * damageInfo->totalDamage);
            damageInfo->totalDamage = uint32(reducePercent * damageInfo->totalDamage);

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage = uint32(reducePercent * damageInfo->subDamage[i].damage);

            break;
        }
        case MELEE_HIT_CRUSHING:
        {
            damageInfo->HitInfo |= HITINFO_CRUSHING;
            damageInfo->TargetState = VICTIMSTATE_NORMAL;
            damageInfo->procEx |= PROC_EX_NORMAL_HIT;

            // 150% of normal damage
            damageInfo->totalDamage += damageInfo->totalDamage / 2;

            for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
                damageInfo->subDamage[i].damage += damageInfo->subDamage[i].damage / 2;

            break;
        }
        default:
            break;
    }

    // Calculate absorb resist
    if (int32(damageInfo->totalDamage) > 0)
    {
        damageInfo->procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;

        // Calculate absorb & resists
        for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
        {
            SubDamageInfo *subDamage = &damageInfo->subDamage[i];

            damageInfo->target->CalculateDamageAbsorbAndResist(this, subDamage->damageSchoolMask, DIRECT_DAMAGE, subDamage->damage, &subDamage->absorb, &subDamage->resist, nullptr);
            damageInfo->totalDamage -= subDamage->absorb + subDamage->resist;
            subDamage->damage -= subDamage->absorb + subDamage->resist;

            damageInfo->totalAbsorb += subDamage->absorb;
            damageInfo->totalResist += subDamage->resist;

            if (subDamage->absorb)
            {
                damageInfo->HitInfo |= HITINFO_ABSORB;
                damageInfo->procEx |= PROC_EX_ABSORB;
            }

            if (subDamage->resist)
                damageInfo->HitInfo |= HITINFO_RESIST;
        }
    }
    else
        damageInfo->totalDamage = 0;
}

void Unit::DealMeleeDamage(CalcDamageInfo *damageInfo, bool durabilityLoss)
{
    if (damageInfo == nullptr) return;
    Unit *pVictim = damageInfo->target;

    if (!pVictim)
        return;

    if (!pVictim->isAlive() || pVictim->IsTaxiFlying() || (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode()))
        return;

    // Hmmmm dont like this emotes client must by self do all animations
    if (damageInfo->HitInfo & HITINFO_CRITICALHIT)
        pVictim->HandleEmoteCommand(EMOTE_ONESHOT_WOUNDCRITICAL);
    if (damageInfo->blocked_amount && damageInfo->TargetState != VICTIMSTATE_BLOCKS)
        pVictim->HandleEmoteCommand(EMOTE_ONESHOT_PARRYSHIELD);

    if (damageInfo->TargetState == VICTIMSTATE_PARRY)
    {
        // Get attack timers
        float offtime  = float(pVictim->getAttackTimer(OFF_ATTACK));
        float basetime = float(pVictim->getAttackTimer(BASE_ATTACK));
        // Reduce attack time
        if (pVictim->haveOffhandWeapon() && offtime < basetime)
        {
            float percent20 = pVictim->GetAttackTime(OFF_ATTACK) * 0.20f;
            float percent60 = 3.0f * percent20;
            if (offtime > percent20 && offtime <= percent60)
                pVictim->setAttackTimer(OFF_ATTACK, uint32(percent20));
            else if (offtime > percent60)
            {
                offtime -= 2.0f * percent20;
                pVictim->setAttackTimer(OFF_ATTACK, uint32(offtime));
            }
        }
        else
        {
            float percent20 = pVictim->GetAttackTime(BASE_ATTACK) * 0.20f;
            float percent60 = 3.0f * percent20;
            if (basetime > percent20 && basetime <= percent60)
                pVictim->setAttackTimer(BASE_ATTACK, uint32(percent20));
            else if (basetime > percent60)
            {
                basetime -= 2.0f * percent20;
                pVictim->setAttackTimer(BASE_ATTACK, uint32(basetime));
            }
        }
    }

    // Call default DealDamage
    CleanDamage cleanDamage(damageInfo->cleanDamage, damageInfo->attackType, damageInfo->hitOutCome, damageInfo->totalAbsorb, damageInfo->totalResist);
    DealDamage(pVictim, damageInfo->totalDamage, &cleanDamage, DIRECT_DAMAGE, SpellSchoolMask(damageInfo->subDamage[0].damageSchoolMask), nullptr, durabilityLoss);

    // If this is a creature and it attacks from behind it has a probability to daze it's victim
    if (damageInfo->totalDamage && GetTypeId() != TYPEID_PLAYER && !((Creature*)this)->GetCharmerOrOwnerGuid() && !pVictim->HasInArc(M_PI_F, this))
    {
        // -probability is between 0% and 40%
        // 20% base chance
        uint32 VictimDefense = pVictim->GetDefenseSkillValue();
        uint32 AttackerMeleeSkill = GetUnitMeleeSkill();

        float Probability = 0.0f;

        //there is a newbie protection, at level 10 just 7% base chance; assuming linear function
        if (pVictim->getLevel() < 30)
            Probability = 0.65f * pVictim->getLevel() + 0.5f + ((float)AttackerMeleeSkill - (float)VictimDefense) * 0.2f;
        else
            Probability = 20.0f + ((float)AttackerMeleeSkill - (float)VictimDefense) * 0.2f;

        if (Probability > 40.0f)
            Probability = 40.0f;

        if (Player* pPlayer = pVictim->ToPlayer())
            if (pPlayer->IsGod())
                Probability = 0.0f;

        if (roll_chance_f(Probability))
            CastSpell(pVictim, 1604, true);
    }

    // update at damage Judgement aura duration that applied by attacker at victim
    if (damageInfo->totalDamage)
    {
        SpellAuraHolderMap const& vAuras = pVictim->GetSpellAuraHolderMap();
        for (SpellAuraHolderMap::const_iterator itr = vAuras.begin(); itr != vAuras.end(); ++itr)
        {
            SpellEntry const *spellInfo = (*itr).second->GetSpellProto();
            if (spellInfo->AttributesEx3 & 0x40000 && spellInfo->SpellFamilyName == SPELLFAMILY_PALADIN && ((*itr).second->GetCasterGuid() == GetObjectGuid()))
                (*itr).second->RefreshHolder();
        }
    }

    // If not miss
    if (!(damageInfo->HitInfo & HITINFO_MISS) && damageInfo->TargetState != VICTIMSTATE_PARRY &&  damageInfo->TargetState != VICTIMSTATE_DODGE)
    {
        // on weapon hit casts
        if (GetTypeId() == TYPEID_PLAYER && pVictim->isAlive())
            ((Player*)this)->CastItemCombatSpell(pVictim, damageInfo->attackType);

        // victim's damage shield
        std::set<Aura*> alreadyDone;
        AuraList const& vDamageShields = pVictim->GetAurasByType(SPELL_AURA_DAMAGE_SHIELD);
        for (AuraList::const_iterator i = vDamageShields.begin(); i != vDamageShields.end();)
        {
            if (alreadyDone.find(*i) == alreadyDone.end())
            {
                alreadyDone.insert(*i);
                uint32 damage = (*i)->GetModifier()->m_amount;
                SpellEntry const *i_spellProto = (*i)->GetSpellProto();

                // Apply damage percentage modifiers (#1601)
                float DoneTotalMod = 1.0f;
                AuraList const& mModDamagePercentDone = pVictim->GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
                for (AuraList::const_iterator i = mModDamagePercentDone.begin(); i != mModDamagePercentDone.end(); ++i)
                {
                    if (((*i)->GetModifier()->m_miscvalue & GetSpellSchoolMask(i_spellProto)) &&
                        (*i)->GetSpellProto()->EquippedItemClass == -1 &&
                        (*i)->GetSpellProto()->EquippedItemInventoryTypeMask == 0)
                    {
                        DoneTotalMod *= ((*i)->GetModifier()->m_amount + 100.0f) / 100.0f;
                    }
                }
                damage *= DoneTotalMod;

                // apply SpellBaseDamageBonusTaken for mobs only
                // for example, Death Talon Seethers with Aura of Flames reflect 1200 damage to tanks with Mark of Flame
                if (pVictim->GetTypeId() == TYPEID_UNIT)
                {
                    int32 spellDmgTakenBonus = this->SpellBaseDamageBonusTaken(GetSpellSchoolMask(i_spellProto));
                    // don't allow damage shields to be reduced by Blessing of Sanctuary, etc.
                    if (spellDmgTakenBonus > 0) damage += spellDmgTakenBonus;
                }

                //Calculate absorb resist ??? no data in opcode for this possibly unable to absorb or resist?
                //uint32 absorb;
                //uint32 resist;
                //CalcAbsorbResist(pVictim, SpellSchools(spellProto->School), SPELL_DIRECT_DAMAGE, damage, &absorb, &resist);
                //damage-=absorb + resist;

                pVictim->DealDamageMods(this, damage, nullptr);

                WorldPacket data(SMSG_SPELLDAMAGESHIELD, (8 + 8 + 4 + 4));
                data << pVictim->GetObjectGuid();
                data << GetObjectGuid();
                data << uint32(damage);
                data << uint32(i_spellProto->School);
                pVictim->SendObjectMessageToSet(&data, true);

                pVictim->DealDamage(this, damage, nullptr, SPELL_DIRECT_DAMAGE, GetSpellSchoolMask(i_spellProto), i_spellProto, true);

                i = vDamageShields.begin();
            }
            else
                ++i;
        }
    }
}

void Unit::HandleEmoteCommand(uint32 emote_id)
{
    WorldPacket data(SMSG_EMOTE, 4 + 8);
    data << uint32(emote_id);
    data << GetObjectGuid();
    SendObjectMessageToSet(&data, true);
}

void Unit::HandleEmoteState(uint32 emote_id)
{
    SetUInt32Value(UNIT_NPC_EMOTESTATE, emote_id);
}

void Unit::HandleEmote(uint32 emote_id)
{
    if (!emote_id)
        HandleEmoteState(0);
    else if (EmotesEntry const* emoteEntry = sEmotesStore.LookupEntry(emote_id))
    {
        if (emoteEntry->EmoteType)                          // 1,2 states, 0 command
            HandleEmoteState(emote_id);
        else
            HandleEmoteCommand(emote_id);
    }
}

uint32 Unit::CalcArmorReducedDamage(Unit* pVictim, const uint32 damage)
{
    uint32 newdamage = 0;
    float armor = (float)pVictim->GetArmor();

    // Ignore enemy armor by SPELL_AURA_MOD_TARGET_RESISTANCE aura
    armor += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_TARGET_RESISTANCE, SPELL_SCHOOL_MASK_NORMAL);

    if (armor < 0.0f)
        armor = 0.0f;

    float tmpvalue = 0.1f * armor / (8.5f * (float)getLevel() + 40);
    tmpvalue = tmpvalue / (1.0f + tmpvalue);

    if (tmpvalue < 0.0f)
        tmpvalue = 0.0f;
    if (tmpvalue > 0.75f)
        tmpvalue = 0.75f;

    newdamage = uint32(damage - (damage * tmpvalue));

    return (newdamage > 1) ? newdamage : 1;
}

// NOSTALRIUS: Provient d'un tableau du forum (http://www.hostingpics.net/viewer.php?id=995056Resistances.jpg)
struct ResistanceValues
{
    int32 resist100;
    int32 resist75;
    int32 resist50;
    int32 resist25;
    int32 resist0;
    uint32 chanceResist;
};

static ResistanceValues resistValues[] =
{
    {0, 0, 0, 0, 100, 0}, // 0
    {0, 0, 2, 6, 92, 3}, // 10
    {0, 1, 4, 12, 84, 5}, // 20
    {0, 1, 5, 18, 76, 8}, // 30
    {0, 1, 7, 23, 69, 10}, // 40
    {0, 2, 9, 28, 61, 13}, // 50
    {0, 2, 11, 33, 54, 15}, // 60
    {0, 2, 13, 37, 37, 18}, // 70
    {0, 3, 15, 41, 41, 20}, // 80
    {1, 3, 17, 46, 36, 23}, // 90
    {1, 4, 19, 47, 29, 25}, // 100
    {1, 5, 21, 48, 24, 28}, // 110
    {1, 6, 24, 49, 20, 30}, // 120
    {1, 8, 28, 47, 17, 33}, // 130
    {1, 9, 33, 43, 14, 35}, // 140
    {1, 11, 37, 39, 12, 38}, // 150
    {1, 13, 41, 35, 10, 40}, // 160
    {1, 16, 45, 30, 8, 43}, // 170
    {1, 18, 48, 26, 7, 45}, // 180
    {2, 20, 48, 24, 6, 48}, // 190
    {4, 23, 48, 21, 4, 50}, // 200
    {5, 25, 47, 19, 3, 53}, // 210
    {7, 28, 45, 17, 2, 55}, // 220
    {9, 31, 43, 16, 2, 58}, // 230
    {11, 34, 40, 14, 1, 60}, // 240
    {13, 37, 37, 12, 1, 62}, // 250
    {15, 41, 33, 10, 1, 65}, // 260
    {18, 44, 29, 8, 1, 68}, // 270
    {20, 48, 25, 7, 1, 70}, // 280
    {23, 51, 20, 5, 1, 73}, // 290
    {25, 55, 16, 3, 1, 75} // 300
};

void Unit::CalculateDamageAbsorbAndResist(Unit *pCaster, SpellSchoolMask schoolMask, DamageEffectType damagetype, const uint32 damage, uint32 *absorb, uint32 *resist, SpellEntry const* spellProto, Spell* spell)
{
    if (!pCaster || !isAlive() || !damage)
        return;

    if (spell)
        schoolMask = spell->m_spellSchoolMask;

    // Nostalrius : immune ?
    if (IsImmuneToSchoolMask(schoolMask) && !(spellProto && (spellProto->Attributes & SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)))
    {
        (*absorb) = damage;
        return;
    }
    /*
    if ((IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)) ||
        (pCaster->IsPlayer() && pCaster->ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)))
        return;
    */

    // Magic damage, check for resists
    bool canResist = (schoolMask & SPELL_SCHOOL_MASK_NORMAL) == 0;

    // NOSTALRIUS: Sorts binaires ne sont pas résistés.
    if (canResist && spellProto && spellProto->IsBinary())
        canResist = false;
    else if (spellProto && spellProto->AttributesEx4 & SPELL_ATTR_EX4_IGNORE_RESISTANCES)
        canResist = false;

    DEBUG_UNIT_IF(spellProto, this, DEBUG_SPELL_COMPUTE_RESISTS, "%s : Binary [%s]. Partial resists %s", spellProto->SpellName[2], spellProto->IsBinary() ? "YES" : "NO", canResist ? "possible" : "impossible");

    if (canResist)
    {
        float resistanceChance = pCaster->GetSpellResistChance(this, schoolMask, true);
        resistanceChance *= 100.0f;

        // DoTs
        // The mechanic for this is strange in classic - most dots can be seen exhibiting partial resists in videos, but only very rarely,
        // and almost never more than 25% resists. How this should work exactly is somewhat a guess.
        // Kalgan post-2.0 dot nerf: "Previously, dots in general were 1/10th as likely to be resisted as normal spells."
        // http://web.archive.org/web/20080601184008/http://forums.worldofwarcraft.com/thread.html?topicId=65457765&pageNo=18&sid=1#348
        if (damagetype == DOT && spellProto)
        {
            switch (spellProto->Id)
            {
                // NOSTALRIUS: Some DoTs follow normal resist rules. Need to find which ones, why and how.
                // We have a video proof for the following ones.
                case 23461:     // Vaelastrasz's Flame Breath
                case 24818:     // Nightmare Dragon's Noxious Breath
                case 25812:     // Lord Kri's Toxic Volley
                case 28531:     // Sapphiron's Frost Aura
                    break;
                default:
                    resistanceChance *= 0.1f;
            }
        }

        ResistanceValues* prev = nullptr;
        ResistanceValues* next = nullptr;
        for (int i = 1; i < 31; ++i)
        {
            // On depasse la valeur cherchee.
            if (resistValues[i].chanceResist >= resistanceChance)
            {
                prev = &resistValues[i - 1];
                next = &resistValues[i];
                break;
            }
        }
        ASSERT(next && prev);
        float coeff = float(resistanceChance - prev->chanceResist) / float(next->chanceResist - prev->chanceResist);
        float resist0 = prev->resist0 + (next->resist0 - prev->resist0) * coeff;
        float resist25 = prev->resist25 + (next->resist25 - prev->resist25) * coeff;
        float resist50 = prev->resist50 + (next->resist50 - prev->resist50) * coeff;
        float resist75 = prev->resist75 + (next->resist75 - prev->resist75) * coeff;
        float resist100 = prev->resist100 + (next->resist100 - prev->resist100) * coeff;
        uint32 ran = urand(0, 99);
        float resistCnt = 0.0f;
        // Players CANNOT resist 100% of damage, it is always rounded down to 75%, despite what Blizzard's table sugests.
        // The true magic damage resist cap is therefore actually ~68-70% because of this mechanic.
        // http://web.archive.org/web/20110808083353/http://elitistjerks.com/f15/t10712-resisting_magical_damage_its_relation_resistance_levels/p4/
        if (ran < resist100 + resist75)
            resistCnt = 0.75f;
        else if (ran < resist100 + resist75 + resist50)
            resistCnt = 0.5f;
        else if (ran < resist100 + resist75 + resist50 + resist25)
            resistCnt = 0.25f;

        DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "Partial resist : chances %.2f:%.2f:%.2f:%.2f:%.2f. Hit resist chance %f",
              resist0, resist25, resist50, resist75, resist100, resistanceChance);
        *resist += uint32(damage * resistCnt);
        if (*resist > damage)
            *resist = damage;
    }
    else
        *resist = 0;

    int32 RemainingDamage = damage - *resist;

    // Need remove expired auras after
    bool existExpired = false;

    // absorb without mana cost
    AuraList const& vSchoolAbsorb = GetAurasByType(SPELL_AURA_SCHOOL_ABSORB);
    for (AuraList::const_iterator i = vSchoolAbsorb.begin(); i != vSchoolAbsorb.end() && RemainingDamage > 0; ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (!(mod->m_miscvalue & schoolMask))
            continue;

        // Max Amount can be absorbed by this aura
        int32  currentAbsorb = mod->m_amount;

        // Found empty aura (impossible but..)
        if (currentAbsorb <= 0)
        {
            existExpired = true;
            continue;
        }

        // currentAbsorb - damage can be absorbed by shield
        // If need absorb less damage
        if (RemainingDamage < currentAbsorb)
            currentAbsorb = RemainingDamage;

        RemainingDamage -= currentAbsorb;

        // Reduce shield amount
        mod->m_amount -= currentAbsorb;
        if ((*i)->GetHolder()->DropAuraCharge())
            mod->m_amount = 0;
        // Need remove it later
        if (mod->m_amount <= 0)
            existExpired = true;
    }

    // Remove all expired absorb auras
    if (existExpired)
    {
        for (AuraList::const_iterator i = vSchoolAbsorb.begin(); i != vSchoolAbsorb.end();)
        {
            if ((*i)->GetModifier()->m_amount <= 0)
            {
                RemoveAurasDueToSpell((*i)->GetId(), nullptr, AURA_REMOVE_BY_SHIELD_BREAK);
                i = vSchoolAbsorb.begin();
            }
            else
                ++i;
        }
    }

    // absorb by mana cost
    AuraList const& vManaShield = GetAurasByType(SPELL_AURA_MANA_SHIELD);
    for (AuraList::const_iterator i = vManaShield.begin(), next; i != vManaShield.end() && RemainingDamage > 0; i = next)
    {
        next = i;
        ++next;

        // check damage school mask
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
            continue;

        int32 currentAbsorb;
        if (RemainingDamage >= (*i)->GetModifier()->m_amount)
            currentAbsorb = (*i)->GetModifier()->m_amount;
        else
            currentAbsorb = RemainingDamage;

        if (float manaMultiplier = (*i)->GetSpellProto()->EffectMultipleValue[(*i)->GetEffIndex()])
        {
            if (Player *modOwner = GetSpellModOwner())
                modOwner->ApplySpellMod((*i)->GetId(), SPELLMOD_MULTIPLE_VALUE, manaMultiplier, spell);

            int32 maxAbsorb = int32(GetPower(POWER_MANA) / manaMultiplier);
            if (currentAbsorb > maxAbsorb)
                currentAbsorb = maxAbsorb;

            int32 manaReduction = int32(currentAbsorb * manaMultiplier);
            ApplyPowerMod(POWER_MANA, manaReduction, false);
        }

        (*i)->GetModifier()->m_amount -= currentAbsorb;
        if ((*i)->GetModifier()->m_amount <= 0)
        {
            RemoveAurasDueToSpell((*i)->GetId());
            next = vManaShield.begin();
        }

        RemainingDamage -= currentAbsorb;
    }
    
    AuraList const& vSplitDamageFlat = GetAurasByType(SPELL_AURA_SPLIT_DAMAGE_FLAT);
    for (AuraList::const_iterator i = vSplitDamageFlat.begin(), next; i != vSplitDamageFlat.end() && RemainingDamage >= 0; i = next)
    {
        next = i;
        ++next;
        
        // check damage school mask
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
            continue;
        
        // Damage can be splitted only if aura has an alive caster
        Unit* reflectTo = (*i)->GetCaster();
        if (!reflectTo || reflectTo == this || !reflectTo->IsInWorld() || !reflectTo->isAlive())
            continue;
        
        int32 currentAbsorb;
        if (RemainingDamage >= (*i)->GetModifier()->m_amount)
            currentAbsorb = (*i)->GetModifier()->m_amount;
        else
            currentAbsorb = RemainingDamage;
        
        RemainingDamage -= currentAbsorb;
        
        uint32 splitted = currentAbsorb;
        uint32 splitted_absorb = 0;
        // Nostalrius : la reflection (bene de sacrifice par exemple) ne fait pas forcement des degats (si pala sous bouclier divin)
        uint32 reflectAbsorb = 0, reflectResist = 0;
        // On evite une boucle infinie
        if (!reflectTo->HasAuraType(SPELL_AURA_SPLIT_DAMAGE_FLAT))
            reflectTo->CalculateDamageAbsorbAndResist(pCaster, schoolMask, DOT, splitted, &reflectAbsorb, &reflectResist, spellProto);
        splitted -= (reflectAbsorb + reflectResist);
        pCaster->DealDamageMods(reflectTo, splitted, &splitted_absorb);
        pCaster->SendSpellNonMeleeDamageLog(reflectTo, (*i)->GetSpellProto()->Id, splitted, schoolMask, splitted_absorb, 0, false, 0, false);
        CleanDamage cleanDamage = CleanDamage(splitted, BASE_ATTACK, MELEE_HIT_NORMAL, reflectAbsorb, reflectResist);
        pCaster->DealDamage(reflectTo, splitted, &cleanDamage, DOT, schoolMask, (*i)->GetSpellProto(), false);
    }
    
    AuraList const& vSplitDamagePct = GetAurasByType(SPELL_AURA_SPLIT_DAMAGE_PCT);
    for (AuraList::const_iterator i = vSplitDamagePct.begin(), next; i != vSplitDamagePct.end() && RemainingDamage >= 0; i = next)
    {
        next = i;
        ++next;
        
        // check damage school mask
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
            continue;
        
        // Damage can be splitted only if aura has an alive caster
        Unit *caster = (*i)->GetCaster();
        if (!caster || caster == this || !caster->IsInWorld() || !caster->isAlive())
            continue;
        
        uint32 splitted = uint32(RemainingDamage * (*i)->GetModifier()->m_amount / 100.0f);
        
        RemainingDamage -=  int32(splitted);
        
        uint32 split_absorb = 0;
        pCaster->DealDamageMods(caster, splitted, &split_absorb);

        pCaster->SendSpellNonMeleeDamageLog(caster, (*i)->GetSpellProto()->Id, splitted, schoolMask, split_absorb, 0, false, 0, false);

        CleanDamage cleanDamage = CleanDamage(splitted, BASE_ATTACK, MELEE_HIT_NORMAL, 0, 0);
        pCaster->DealDamage(caster, splitted, &cleanDamage, DOT, schoolMask, (*i)->GetSpellProto(), false);
    }

    *absorb = damage - RemainingDamage - *resist;
}

void Unit::CalculateAbsorbResistBlock(Unit *pCaster, SpellNonMeleeDamage *damageInfo, SpellEntry const* spellProto, WeaponAttackType attType, Spell* spell)
{
    bool blocked = false;
    // Get blocked status
    switch (spellProto->DmgClass)
    {
        // Melee and Ranged Spells
        case SPELL_DAMAGE_CLASS_RANGED:
        case SPELL_DAMAGE_CLASS_MELEE:
            blocked = IsSpellBlocked(pCaster, spellProto, attType);
            break;
        default:
            break;
    }

    if (blocked)
    {
        damageInfo->blocked = GetShieldBlockValue();
        if (damageInfo->damage < damageInfo->blocked)
            damageInfo->blocked = damageInfo->damage;
        damageInfo->damage -= damageInfo->blocked;
    }

    CalculateDamageAbsorbAndResist(pCaster, GetSpellSchoolMask(spellProto), SPELL_DIRECT_DAMAGE, damageInfo->damage, &damageInfo->absorb, &damageInfo->resist, spellProto, spell);
    damageInfo->damage -= damageInfo->absorb + damageInfo->resist;
}

void Unit::AttackerStateUpdate(Unit *pVictim, WeaponAttackType attType, bool extra)
{
    if (hasUnitState(UNIT_STAT_CAN_NOT_REACT) || HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
        return;

    if (!pVictim->isAlive() || !isAlive())
        return;

    if (!extra && IsNonMeleeSpellCasted(false))
        return;

    uint32 hitInfo;
    if (attType == BASE_ATTACK)
        hitInfo = HITINFO_NORMALSWING2;
    else if (attType == OFF_ATTACK)
        hitInfo = HITINFO_LEFTSWING;
    else
        return;                                             // ignore ranged case

    // Nostalrius: check ligne de vision
    if (!hasUnitState(UNIT_STAT_ALLOW_LOS_ATTACK) && !IsWithinLOSInMap(pVictim))
        return;

    if (GetExtraAttacks() && !extra)
        AddExtraAttackOnUpdate();

    // melee attack spell casted at main hand attack only
    if (attType == BASE_ATTACK && m_currentSpells[CURRENT_MELEE_SPELL] && !extra)
    {
        m_currentSpells[CURRENT_MELEE_SPELL]->cast();
        Spell* spell = m_currentSpells[CURRENT_MELEE_SPELL];
        if (!spell || !spell->IsNextMeleeSwingSpell() || spell->isSuccessCast())
            return;
    }

    CalcDamageInfo damageInfo;
    CalculateMeleeDamage(pVictim, 0, &damageInfo, attType);
    // Send log damage message to client
    for (uint8 i = 0; i < m_weaponDamageCount[attType]; i++)
    {
        damageInfo.totalDamage -= damageInfo.subDamage[i].damage;
        DealDamageMods(pVictim, damageInfo.subDamage[i].damage, &damageInfo.subDamage[i].absorb);
        damageInfo.totalDamage += damageInfo.subDamage[i].damage;
    }

    SendAttackStateUpdate(&damageInfo);
    ProcDamageAndSpell(damageInfo.target, damageInfo.procAttacker, damageInfo.procVictim, damageInfo.procEx, damageInfo.totalDamage, damageInfo.attackType);

    DealMeleeDamage(&damageInfo, true);

    if (GetTypeId() == TYPEID_PLAYER)
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "AttackerStateUpdate: (Player) %u attacked %u (TypeId: %u) for %u dmg, absorbed %u, blocked %u, resisted %u.",
                         GetGUIDLow(), pVictim->GetGUIDLow(), pVictim->GetTypeId(), damageInfo.totalDamage, damageInfo.totalAbsorb, damageInfo.blocked_amount, damageInfo.totalResist);
    else
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "AttackerStateUpdate: (NPC)    %u attacked %u (TypeId: %u) for %u dmg, absorbed %u, blocked %u, resisted %u.",
                         GetGUIDLow(), pVictim->GetGUIDLow(), pVictim->GetTypeId(), damageInfo.totalDamage, damageInfo.totalAbsorb, damageInfo.blocked_amount, damageInfo.totalResist);

    // if damage pVictim call AI reaction
    pVictim->AttackedBy(this);
    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_MELEE_ATTACK);
}

MeleeHitOutcome Unit::RollMeleeOutcomeAgainst(const Unit *pVictim, WeaponAttackType attType) const
{
    // This is only wrapper

    // Miss chance based on melee
    float miss_chance = MeleeMissChanceCalc(pVictim, attType);

    // Critical hit chance
    float crit_chance = GetUnitCriticalChance(attType, pVictim);

    // stunned target cannot dodge and this is check in GetUnitDodgeChance() (returned 0 in this case)
    float dodge_chance = pVictim->GetUnitDodgeChance();
    float block_chance = pVictim->GetUnitBlockChance();
    float parry_chance = pVictim->GetUnitParryChance();

    // Useful if want to specify crit & miss chances for melee, else it could be removed
    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "MELEE OUTCOME: miss %f crit %f dodge %f parry %f block %f", miss_chance, crit_chance, dodge_chance, parry_chance, block_chance);

    return RollMeleeOutcomeAgainst(pVictim, attType, int32(crit_chance * 100), int32(miss_chance * 100), int32(dodge_chance * 100), int32(parry_chance * 100), int32(block_chance * 100), false);
}

MeleeHitOutcome Unit::RollMeleeOutcomeAgainst(const Unit *pVictim, WeaponAttackType attType, int32 crit_chance, int32 miss_chance, int32 dodge_chance, int32 parry_chance, int32 block_chance, bool SpellCasted) const
{
    // Nostalrius : cheat.
    if (IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_ALWAYS_CRIT))
        return MELEE_HIT_CRIT;

    if (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode())
        return MELEE_HIT_EVADE;

    int32 attackerMaxSkillValueForLevel = GetMaxSkillValueForLevel(pVictim);
    int32 victimMaxSkillValueForLevel = pVictim->GetMaxSkillValueForLevel(this);

    int32 attackerWeaponSkill = GetWeaponSkillValue(attType, pVictim);
    int32 victimDefenseSkill = pVictim->GetDefenseSkillValue(this);

    // bonus from skills is 0.04%
    int32    skillBonus  = 4 * (attackerWeaponSkill - victimMaxSkillValueForLevel);
    int32    sum = 0, tmp = 0;
    int32    roll = urand(0, 10000);

    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: skill bonus of %d for attacker", skillBonus);
    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: rolled %d, miss %d, dodge %d, parry %d, block %d, crit %d", roll, miss_chance, dodge_chance, parry_chance, block_chance, crit_chance);

    tmp = miss_chance;

    if (tmp > 0 && roll < (sum += tmp))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: MISS");
        return MELEE_HIT_MISS;
    }

    // always crit against a sitting target (except 0 crit chance)
    if (pVictim->GetTypeId() == TYPEID_PLAYER && crit_chance > 0 && !pVictim->IsStandState())
    {
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: CRIT (sitting victim)");
        return MELEE_HIT_CRIT;
    }

    bool from_behind = !pVictim->HasInArc(M_PI_F, this);

    if (from_behind)
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: attack came from behind.");

    // Dodge chance

    // only players can't dodge if attacker is behind
    if (pVictim->GetTypeId() != TYPEID_PLAYER || !from_behind)
    {
        tmp = dodge_chance;
        if ((tmp > 0)                                           // check if unit _can_ dodge
                && ((tmp -= skillBonus) > 0)
                && roll < (sum += tmp))
        {
            DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: DODGE <%d, %d)", sum - tmp, sum);
            return MELEE_HIT_DODGE;
        }
    }

    // parry chances
    // check if attack comes from behind, nobody can parry or block if attacker is behind
    if (!from_behind)
    {
        if (parry_chance > 0 && (pVictim->GetTypeId() == TYPEID_PLAYER || !(((Creature*)pVictim)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_PARRY)))
        {
            parry_chance -= skillBonus;

            if (parry_chance > 0 &&                         // check if unit _can_ parry
                    (roll < (sum += parry_chance)))
            {
                DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: PARRY <%d, %d)", sum - parry_chance, sum);
                return MELEE_HIT_PARRY;
            }
        }
    }

    // Max 40% chance to score a glancing blow against mobs that are higher level (can do only players and pets and not with ranged weapon)
    if (attType != RANGED_ATTACK && !SpellCasted &&
            (GetTypeId() == TYPEID_PLAYER || ((Creature*)this)->IsPet()) &&
            pVictim->GetTypeId() != TYPEID_PLAYER && !((Creature*)pVictim)->IsPet() && !((Creature*)pVictim)->IsTotem())
    {
        // cap possible value (with bonuses > max skill)
        int32 skill = attackerWeaponSkill;
        int32 maxskill = attackerMaxSkillValueForLevel;
        skill = (skill > maxskill) ? maxskill : skill;

        // (Youfie) Le +skill avant BC ne permet pas de réduire la fréquence des glancing blows une fois qu'il est égal au niveau du joueur*5
        if (attackerWeaponSkill > maxskill)
            attackerWeaponSkill = maxskill;

        // (Youfie) Chance de glance en Vanilla (inchangée par le +skill au delà de maxskill, cf. au dessus) :
        tmp = (10 + ((victimDefenseSkill - attackerWeaponSkill) * 2)) * 100;
        tmp = tmp > 4000 ? 4000 : tmp;
        if (tmp < 0)
            tmp = 0;
        // sLog.outString("tmp = %i, Skill = %i, Max Skill = %i", tmp, attackerWeaponSkill, attackerMaxSkillValueForLevel); //Pour tests & débug via la console

        if (roll < (sum += tmp))
        {
            DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: GLANCING <%d, %d)", sum - 4000, sum);
            return MELEE_HIT_GLANCING;
        }
    }

    // block chances
    // check if attack comes from behind, nobody can parry or block if attacker is behind
    if (!from_behind)
    {
        if ((pVictim->GetTypeId() == TYPEID_PLAYER || !(((Creature*)pVictim)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_BLOCK))
          && !(GetTypeId() == TYPEID_UNIT && GetMeleeDamageSchoolMask() != SPELL_SCHOOL_MASK_NORMAL))  // can't block elemental melee attacks from mobs
        {
            tmp = block_chance;
            if ((tmp > 0)                                       // check if unit _can_ block
                    && ((tmp -= skillBonus) > 0)
                    && (roll < (sum += tmp)))
            {
                // Critical chance
                tmp = crit_chance;
                if (GetTypeId() == TYPEID_PLAYER && SpellCasted && tmp > 0)
                {
                    if ((IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)) ||
                        (pVictim->IsPlayer() && pVictim->ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)))
                        tmp = 0;
                    if (roll_chance_i(tmp / 100))
                    {
                        DEBUG_LOG("RollMeleeOutcomeAgainst: BLOCKED CRIT");
                        return MELEE_HIT_BLOCK_CRIT;
                    }
                }
                DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: BLOCK <%d, %d)", sum - tmp, sum);
                return MELEE_HIT_BLOCK;
            }
        }
    }

    // Critical chance
    tmp = crit_chance;

    if (tmp > 0 && roll < (sum += tmp))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: CRIT <%d, %d)", sum - tmp, sum);
        return MELEE_HIT_CRIT;
    }

    if ((GetTypeId() != TYPEID_PLAYER && !((Creature*)this)->IsPet()) &&
        !(((Creature*)this)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_CRUSH) &&
        !SpellCasted /*Only autoattack can be crashing blow*/)
    {
        if ( ((Creature*)this)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_ALWAYS_CRUSH )
        {
            return MELEE_HIT_CRUSHING;
        }
        else
        {
            // mobs can score crushing blows if they're 3 or more levels above victim
            // or when their weapon skill is 15 or more above victim's defense skill
            tmp = victimDefenseSkill;
            int32 tmpmax = victimMaxSkillValueForLevel;
            // having defense above your maximum (from items, talents etc.) has no effect
            tmp = tmp > tmpmax ? tmpmax : tmp;
            // tmp = mob's level * 5 - player's current defense skill
            tmp = attackerMaxSkillValueForLevel - tmp;
            if (tmp >= 15)
            {
                // add 2% chance per lacking skill point, min. is 15%
                tmp = tmp * 200 - 1500;
                if (roll < (sum += tmp))
                {
                    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: CRUSHING <%d, %d)", sum - tmp, sum);
                    return MELEE_HIT_CRUSHING;
                }
            }
        }

    }

    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: NORMAL");
    return MELEE_HIT_NORMAL;
}

uint32 Unit::CalculateDamage(WeaponAttackType attType, bool normalized, uint8 index)
{
    float min_damage, max_damage;

    if (GetTypeId() != TYPEID_PLAYER && index != 0)
        return 0;

    if ((normalized || index != 0) && GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->CalculateMinMaxDamage(attType, normalized, min_damage, max_damage, index);
    else
    {
        switch (attType)
        {
            case RANGED_ATTACK:
                min_damage = GetFloatValue(UNIT_FIELD_MINRANGEDDAMAGE);
                max_damage = GetFloatValue(UNIT_FIELD_MAXRANGEDDAMAGE);
                break;
            case BASE_ATTACK:
                min_damage = GetFloatValue(UNIT_FIELD_MINDAMAGE);
                max_damage = GetFloatValue(UNIT_FIELD_MAXDAMAGE);
                break;
            case OFF_ATTACK:
                min_damage = GetFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE);
                max_damage = GetFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE);
                break;
            // Just for good manner
            default:
                min_damage = 0.0f;
                max_damage = 0.0f;
                break;
        }
    }

    if (min_damage > max_damage)
        std::swap(min_damage, max_damage);

    if (max_damage == 0.0f)
        max_damage = 5.0f;

    return urand((uint32)min_damage, (uint32)max_damage);
}

float Unit::CalculateLevelPenalty(SpellEntry const* spellProto) const
{
    // Fix Nostalrius. La formule de MaNGOSZero est BC.
    uint32 spellLevel = spellProto->spellLevel;
    if (spellLevel <= 0 || spellLevel > 20)
        return 1.0f;
    return 1 - ((20.0f - spellLevel) * 0.0375f);

    /*
        float LvlPenalty = 0.0f;

        if(spellLevel < 20)
            LvlPenalty = 20.0f - spellLevel * 3.75f;
        float LvlFactor = (float(spellLevel) + 6.0f) / float(getLevel());
        if(LvlFactor > 1.0f)
            LvlFactor = 1.0f;

        return (100.0f - LvlPenalty) * LvlFactor / 100.0f;
    */
}

void Unit::SendMeleeAttackStart(Unit* pVictim)
{
    WorldPacket data(SMSG_ATTACKSTART, 8 + 8);
    data << GetObjectGuid();
    data << pVictim->GetObjectGuid();

    SendObjectMessageToSet(&data, true);
    DEBUG_LOG("WORLD: Sent SMSG_ATTACKSTART");
}

void Unit::SendMeleeAttackStop(Unit* victim)
{
    if (!victim)
        return;

    WorldPacket data(SMSG_ATTACKSTOP, (8 + 8 + 4));         // guess size, max is 9+9+4
    data << GetPackGUID();
    data << victim->GetPackGUID();                          // can be 0x00...
    data << uint32(0);                                      // can be 0x1
    SendObjectMessageToSet(&data, true);
    DETAIL_FILTER_LOG(LOG_FILTER_COMBAT, "%s %u stopped attacking %s %u", (GetTypeId() == TYPEID_PLAYER ? "player" : "creature"), GetGUIDLow(), (victim->GetTypeId() == TYPEID_PLAYER ? "player" : "creature"), victim->GetGUIDLow());

    /*if(victim->GetTypeId() == TYPEID_UNIT)
    ((Creature*)victim)->AI().EnterEvadeMode(this);*/
}

bool Unit::IsSpellBlocked(Unit *pCaster, SpellEntry const *spellEntry, WeaponAttackType attackType)
{
    if (!HasInArc(M_PI_F, pCaster))
        return false;

    if (spellEntry)
    {
        // Some spells cannot be blocked
        if (spellEntry->Attributes & SPELL_ATTR_IMPOSSIBLE_DODGE_PARRY_BLOCK)
            return false;
    }

    // Check creatures flags_extra for disable block
    if (GetTypeId() == TYPEID_UNIT)
    {
        if (((Creature*)this)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_BLOCK)
            return false;
    }

    float blockChance = GetUnitBlockChance();
    blockChance += (int32(pCaster->GetWeaponSkillValue(attackType)) - int32(GetMaxSkillValueForLevel())) * 0.04f;

    if ((IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)) ||
        (pCaster->IsPlayer() && pCaster->ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)))
        blockChance = 0;
    return roll_chance_f(blockChance);
}

// Melee based spells can be miss, parry or dodge on this step
// Crit or block - determined on damage calculation phase! (and can be both in some time)
float Unit::MeleeSpellMissChance(Unit *pVictim, WeaponAttackType attType, int32 skillDiff, SpellEntry const *spell, Spell* spellPtr)
{
    if (!pVictim || !pVictim->IsStandState())
        return 0.0f;

    // Calculate hit chance (more correct for chance mod)
    float hitChance = 0.0f;

    // PvP - PvE melee chances
    if (GetTypeId() == TYPEID_PLAYER && pVictim->GetTypeId() == TYPEID_PLAYER)
        hitChance = 95.0f + skillDiff * 0.04f;  // PvP misschance base is 5.00%
    else if (pVictim->GetTypeId() == TYPEID_PLAYER)
        hitChance = 94.4f + skillDiff * 0.04f;
    else if (skillDiff < -10)
        hitChance = 93.4f + (skillDiff + 10) * 0.4f;        // 7% ~ 6.60% base chance to miss for big skill diff
    else
        hitChance = 94.4f + skillDiff * 0.1f;

    // Hit chance depends from victim auras
    if (attType == RANGED_ATTACK)
        hitChance += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE);
    else
        hitChance += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE);

    // Spellmod from SPELLMOD_RESIST_MISS_CHANCE
    if (Player *modOwner = GetSpellModOwner())
        modOwner->ApplySpellMod(spell->Id, SPELLMOD_RESIST_MISS_CHANCE, hitChance, spellPtr);

    // Miss = 100 - hit
    float missChance = 100.0f - hitChance;

    // Bonuses from attacker aura and ratings
    if (attType == RANGED_ATTACK)
        missChance -= m_modRangedHitChance;
    else
        missChance -= m_modMeleeHitChance;

    // Limit miss chance from 0 to 60%
    if (missChance < 0.0f)
        return 0.0f;
    if (missChance > 60.0f)
        return 60.0f;
    return missChance;
}

// Melee based spells hit result calculations
SpellMissInfo Unit::MeleeSpellHitResult(Unit *pVictim, SpellEntry const *spell, Spell* spellPtr)
{
    WeaponAttackType attType = BASE_ATTACK;

    if (spell->DmgClass == SPELL_DAMAGE_CLASS_RANGED)
        attType = RANGED_ATTACK;

    // Warrior spell Execute (5308) should never dodge, miss, resist ... Only the trigger can (20647)
    if (spell->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_EXECUTE>() && spell->Id != 20647)
        return SPELL_MISS_NONE;

    // bonus from skills is 0.04% per skill Diff
    int32 attackerWeaponSkill = (spell->EquippedItemClass == ITEM_CLASS_WEAPON) ? int32(GetWeaponSkillValue(attType, pVictim)) : GetMaxSkillValueForLevel();
    int32 skillDiff = attackerWeaponSkill - int32(pVictim->GetMaxSkillValueForLevel(this));
    int32 fullSkillDiff = attackerWeaponSkill - int32(pVictim->GetDefenseSkillValue(this));

    uint32 roll = urand(0, 10000);

    uint32 missChance = uint32(MeleeSpellMissChance(pVictim, attType, fullSkillDiff, spell, spellPtr) * 100.0f);
    // Roll miss
    uint32 tmp = spell->AttributesEx3 & SPELL_ATTR_EX3_CANT_MISS ? 0 : missChance;
    if (roll < tmp)
        return SPELL_MISS_MISS;

    // Chance resist mechanic for spell (effect resistance handled later)
    int32 resist_mech = 0;
    if (spell->Mechanic)
        resist_mech = pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, spell->Mechanic) * 100;
    // Roll chance
    tmp += resist_mech;
    if (roll < tmp)
        return SPELL_MISS_RESIST;

    bool canDodge = true;
    bool canParry = true;

    // Same spells cannot be parry/dodge
    if (spell->Attributes & SPELL_ATTR_IMPOSSIBLE_DODGE_PARRY_BLOCK)
        return SPELL_MISS_NONE;

    // Ranged attack cannot be parry/dodge
    if (attType == RANGED_ATTACK)
        return SPELL_MISS_NONE;

    bool from_behind = !pVictim->HasInArc(M_PI_F, this);

    // Check for attack from behind
    if (from_behind)
    {
        // Can`t dodge from behind in PvP (but its possible in PvE)
        if (GetTypeId() == TYPEID_PLAYER && pVictim->GetTypeId() == TYPEID_PLAYER)
            canDodge = false;
        // Can`t parry
        canParry = false;
    }
    // Check creatures flags_extra for disable parry
    if (pVictim->GetTypeId() == TYPEID_UNIT)
    {
        uint32 flagEx = ((Creature*)pVictim)->GetCreatureInfo()->flags_extra;
        if (flagEx & CREATURE_FLAG_EXTRA_NO_PARRY)
            canParry = false;
    }

    // Check if the player can parry
    if (pVictim->GetTypeId() == TYPEID_PLAYER)
    {
        if (!((Player*)pVictim)->CanParry())
            canParry = false;
    }

    if (canDodge)
    {
        // Roll dodge
        int32 dodgeChance = int32(pVictim->GetUnitDodgeChance() * 100.0f) - skillDiff * 4;

        if (dodgeChance < 0)
            dodgeChance = 0;


        tmp += dodgeChance;
        if (roll < tmp)
            return SPELL_MISS_DODGE;
    }

    if (canParry)
    {
        // Roll parry
        int32 parryChance = int32(pVictim->GetUnitParryChance() * 100.0f)  - skillDiff * 4;
        // Can`t parry from behind
        if (parryChance < 0)
            parryChance = 0;

        tmp += parryChance;
        if (roll < tmp)
            return SPELL_MISS_PARRY;
    }

    return SPELL_MISS_NONE;
}

SpellMissInfo Unit::MagicSpellHitResult(Unit *pVictim, SpellEntry const *spell, Spell* spellPtr)
{
    // Can`t miss on dead target (on skinning for example)
    if (!pVictim->isAlive())
        return SPELL_MISS_NONE;

    // Spell cannot be resisted (not exist on dbc, custom flag)
    if (spell->AttributesEx4 & SPELL_ATTR_EX4_IGNORE_RESISTANCES)
        return SPELL_MISS_NONE;

    int32 hitChance = MagicSpellHitChance(pVictim, spell, spellPtr);
    int32 missChance = 10000 - hitChance;
    int32 rand = irand(0, 10000);

    if ((IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)) ||
        (pVictim->IsPlayer() && pVictim->ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)))
        missChance = 0;

    if (rand < missChance)
        return SPELL_MISS_RESIST;

    return SPELL_MISS_NONE;
}

float Unit::GetSpellResistChance(Unit* victim, uint32 schoolMask, bool innateResists) const
{
    // Get base victim resistance for school
    float resistModHitChance = victim->GetResistance(GetFirstSchoolInMask(SpellSchoolMask(schoolMask)));
    // Ignore resistance by self SPELL_AURA_MOD_TARGET_RESISTANCE aura
    resistModHitChance += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_TARGET_RESISTANCE, schoolMask);
    // No "negative" resist chance. Applied before innate resists.
    if (resistModHitChance < 0)
        resistModHitChance = 0.0f;

    // Computing innate resists, resistance bonus when attacking a creature higher level. Not affected by modifiers.
    if (innateResists && victim->GetTypeId() == TYPEID_UNIT)
    {
        int32 leveldiff = int32(victim->GetLevelForTarget(this)) - int32(GetLevelForTarget(victim));
        resistModHitChance += int32((8.0f * leveldiff) * getLevel() / 63.0f);
    }
    resistModHitChance *= (float)(0.15f / getLevel());

    if (resistModHitChance < 0.0f)
        resistModHitChance = 0.0f;
    if (resistModHitChance > 0.75f)
        resistModHitChance = 0.75f;

    return resistModHitChance;
}

int32 Unit::MagicSpellHitChance(Unit *pVictim, SpellEntry const *spell, Spell* spellPtr)
{
    if (spell->AttributesEx3 & SPELL_ATTR_EX3_CANT_MISS)
        return 10000;

    SpellSchoolMask schoolMask = GetSpellSchoolMask(spell);
    // PvP - PvE spell misschances per leveldif > 2
    int32 lchance = pVictim->GetTypeId() == TYPEID_PLAYER ? 7 : 11;
    int32 leveldif = int32(pVictim->GetLevelForTarget(this)) - int32(GetLevelForTarget(pVictim));

    // Base hit chance from attacker and victim levels
    float modHitChance;
    if (leveldif < 3)
        modHitChance = 96 - leveldif;
    else
        modHitChance = 94 - (leveldif - 2) * lchance;

    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "%s [%u] : Binary [%s]. Base hit chance %f, level diff: %d", spell->SpellName[2], spell->Id, spell->IsBinary() ? "YES" : "NO", modHitChance, leveldif);

    // Spellmod from SPELLMOD_RESIST_MISS_CHANCE
    if (Player *modOwner = GetSpellModOwner())
    {
        modOwner->ApplySpellMod(spell->Id, SPELLMOD_RESIST_MISS_CHANCE, modHitChance, spellPtr);
        DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELLMOD_RESIST_MISS_CHANCE : %f", modHitChance);
    }
    // Chance hit from victim SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE auras
    modHitChance += pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE, schoolMask);
    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE (+ %i) : %f", pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE, schoolMask), modHitChance);

    // Reduce spell hit chance for Area of effect spells from victim SPELL_AURA_MOD_AOE_AVOIDANCE aura
    if (IsAreaOfEffectSpell(spell))
    {
        modHitChance -= pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_AOE_AVOIDANCE);
        DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_AOE_AVOIDANCE (- %i) : %f", pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_AOE_AVOIDANCE), modHitChance);
    }

    // Chance resist mechanic for spell (effect resistance handled later)
    int32 resist_mech = 0;
    if (spell->Mechanic)
        resist_mech = pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, spell->Mechanic);
    // Apply mod
    modHitChance -= resist_mech;
    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_MECHANIC_RESISTANCE (- %i) : %f", resist_mech, modHitChance);

    // Chance resist debuff
    modHitChance -= pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_DEBUFF_RESISTANCE, int32(spell->Dispel));
    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_DEBUFF_RESISTANCE (- %i) : %f", pVictim->GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_DEBUFF_RESISTANCE, int32(spell->Dispel)), modHitChance);

    // Increase hit chance from attacker SPELL_AURA_MOD_SPELL_HIT_CHANCE and attacker ratings
    modHitChance += int32(m_modSpellHitChance);
    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "SPELL_AURA_MOD_SPELL_HIT_CHANCE (+ %i) : %f", int32(m_modSpellHitChance), modHitChance);

    // Nostalrius: sorts binaires.
    if (spell->IsBinary())
    {
        // Get base victim resistance for school
        float resistModHitChance = GetSpellResistChance(pVictim, schoolMask, false);
        modHitChance *= (1 - resistModHitChance);
        DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "x %f : HitChance = %f", (1 - resistModHitChance), modHitChance);
    }

    int32 HitChance = modHitChance * 100;
    if (HitChance <  100) HitChance =  100;
    if (HitChance > 9900) HitChance = 9900;
    return HitChance;
}
// Calculate spell hit result can be:
// Every spell can: Evade/Immune/Reflect/Sucesful hit
// For melee based spells:
//   Miss
//   Dodge
//   Parry
// For spells
//   Resist
SpellMissInfo Unit::SpellHitResult(Unit *pVictim, SpellEntry const *spell, SpellEffectIndex effIndex, bool CanReflect, Spell* spellPtr)
{
    // Return evade for units in evade mode
    if (pVictim->GetTypeId() == TYPEID_UNIT && ((Creature*)pVictim)->IsInEvadeMode())
        return SPELL_MISS_EVADE;

    // Check for immune (use charges)
    if (pVictim != this && pVictim->IsImmuneToSpell(spell, pVictim == this))
        return SPELL_MISS_IMMUNE;

    // All positive spells can`t miss
    // TODO: client not show miss log for this spells - so need find info for this in dbc and use it!
    if (IsPositiveSpell(spell->Id, this, pVictim) || IsPositiveEffect(spell, effIndex, this, pVictim))
        return SPELL_MISS_NONE;

    // Check for immune (use charges)
    SpellSchoolMask schoolMask;
    if (spellPtr)
        schoolMask = spellPtr->m_spellSchoolMask;
    else
        schoolMask = GetSpellSchoolMask(spell);

    if (pVictim != this && pVictim->IsImmuneToDamage(schoolMask, spell))
        return SPELL_MISS_IMMUNE;

    // Try victim reflect spell
    if (CanReflect)
    {
        int32 reflectchance = pVictim->GetTotalAuraModifier(SPELL_AURA_REFLECT_SPELLS);
        Unit::AuraList const& mReflectSpellsSchool = pVictim->GetAurasByType(SPELL_AURA_REFLECT_SPELLS_SCHOOL);
        for (Unit::AuraList::const_iterator i = mReflectSpellsSchool.begin(); i != mReflectSpellsSchool.end(); ++i)
            if ((*i)->GetModifier()->m_miscvalue & GetSpellSchoolMask(spell))
                reflectchance += (*i)->GetModifier()->m_amount;
        if (reflectchance > 0 && roll_chance_i(reflectchance))
        {
            // Start triggers for remove charges if need (trigger only for victim, and mark as active spell)
            ProcDamageAndSpell(pVictim, PROC_FLAG_NONE, PROC_FLAG_TAKEN_NEGATIVE_SPELL_HIT, PROC_EX_REFLECT, 1, BASE_ATTACK, spell);
            return SPELL_MISS_REFLECT;
        }
    }

    switch (spell->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_NONE:
            return SPELL_MISS_NONE;
        case SPELL_DAMAGE_CLASS_MAGIC:
            return MagicSpellHitResult(pVictim, spell, spellPtr);
        case SPELL_DAMAGE_CLASS_MELEE:
        case SPELL_DAMAGE_CLASS_RANGED:
            return MeleeSpellHitResult(pVictim, spell, spellPtr);
    }
    return SPELL_MISS_NONE;
}

bool Unit::IsEffectResist(SpellEntry const* spell, int eff)
{
    // Chance resist mechanic
    int32 effect_mech = spell->EffectMechanic[eff];
    if (effect_mech && effect_mech != spell->Mechanic)
    {
        int32 rand = urand(0, 99);
        int32 resist_mech = GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, effect_mech);
        DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "Spell %u Eff %u: MechanicResistChance %i", spell->Id, eff, resist_mech);
        return (rand < resist_mech);
    }
    return false;
}

float Unit::MeleeMissChanceCalc(const Unit *pVictim, WeaponAttackType attType) const
{
    if (!pVictim || !pVictim->IsStandState())
        return 0.0f;

    float missChance = 5.60f; // The base chance to miss is 5.60%

    // The base chance to miss in PvP is 5%
    if (GetTypeId() == TYPEID_PLAYER && pVictim->GetTypeId() == TYPEID_PLAYER)
    {
        missChance = 5.00f;
    }

    // DualWield - white damage has an additional 19% miss penalty
    if (haveOffhandWeapon() && attType != RANGED_ATTACK)
    {
        bool isNormal = false;
        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
        {
            if (m_currentSpells[i] && (GetSpellSchoolMask(m_currentSpells[i]->m_spellInfo) & SPELL_SCHOOL_MASK_NORMAL))
            {
                isNormal = true;
                break;
            }
        }
        if (!isNormal && !m_currentSpells[CURRENT_MELEE_SPELL])
            missChance += 19.0f;
    }

    int32 skillDiff = int32(GetWeaponSkillValue(attType, pVictim)) - int32(pVictim->GetDefenseSkillValue(this));

    // PvP - PvE melee chances
    if (pVictim->GetTypeId() == TYPEID_PLAYER)
        missChance -= skillDiff * 0.04f;
    else if (skillDiff < -10)
        missChance -= (skillDiff + 10) * 0.4f - 1.0f;       // 7% ~ 6.60% base chance to miss for big skill diff
    else
        missChance -=  skillDiff * 0.1f;

    // Hit chance bonus from attacker based on ratings and auras
    if (attType == RANGED_ATTACK)
        missChance -= m_modRangedHitChance;
    else
        missChance -= m_modMeleeHitChance;

    // Modify miss chance by victim auras
    if (attType == RANGED_ATTACK)
        missChance -= pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE);
    else
        missChance -= pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE);

    // Limit miss chance from 0 to 60%
    if (missChance < 0.0f)
        return 0.0f;
    if (missChance > 60.0f)
        return 60.0f;

    return missChance;
}

uint32 Unit::GetDefenseSkillValue(Unit const* target) const
{
    if (GetTypeId() == TYPEID_PLAYER)
    {
        // in PvP use full skill instead current skill value
        uint32 value = (target && target->GetTypeId() == TYPEID_PLAYER)
                       ? ((Player*)this)->GetMaxSkillValue(SKILL_DEFENSE)
                       : ((Player*)this)->GetSkillValue(SKILL_DEFENSE);
        return value;
    }
    else
        return GetUnitMeleeSkill(target);
}

float Unit::GetUnitDodgeChance() const
{
    if (IsNonMeleeSpellCasted(false) || hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;
    if (GetTypeId() == TYPEID_PLAYER)
        return GetFloatValue(PLAYER_DODGE_PERCENTAGE);
    else
    {
        if (((Creature const*)this)->IsTotem())
            return 0.0f;
        else
        {
            float dodge = 5.0f;
            dodge += GetTotalAuraModifier(SPELL_AURA_MOD_DODGE_PERCENT);
            return dodge > 0.0f ? dodge : 0.0f;
        }
    }
}

float Unit::GetUnitParryChance() const
{
    if (IsNonMeleeSpellCasted(false) || hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;

    float chance = 0.0f;

    if (GetTypeId() == TYPEID_PLAYER)
    {
        Player const* player = (Player const*)this;
        if (player->CanParry())
        {
            Item *tmpitem = player->GetWeaponForAttack(BASE_ATTACK, true, true);
            if (!tmpitem)
                tmpitem = player->GetWeaponForAttack(OFF_ATTACK, true, true);

            if (tmpitem)
                chance = GetFloatValue(PLAYER_PARRY_PERCENTAGE);
        }
    }
    else if (GetTypeId() == TYPEID_UNIT)
    {
        // Can't really know for sure, but Totems probably shouldn't parry.
        // They are inanimate objects, have no arms nor weapons, and cannot move.
        if (GetCreatureType() != CREATURE_TYPE_TOTEM)
        {
            chance = 5.0f;
            chance += GetTotalAuraModifier(SPELL_AURA_MOD_PARRY_PERCENT);
        }
    }

    return chance > 0.0f ? chance : 0.0f;
}

float Unit::GetUnitBlockChance() const
{
    if (IsNonMeleeSpellCasted(false) || hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;

    if (GetTypeId() == TYPEID_PLAYER)
    {
        Player const* player = (Player const*)this;
        if (player->CanBlock() && player->CanUseEquippedWeapon(OFF_ATTACK))
        {
            Item *tmpitem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
            if (tmpitem && !tmpitem->IsBroken() && tmpitem->GetProto()->Block)
                return GetFloatValue(PLAYER_BLOCK_PERCENTAGE);
        }
        // is player but has no block ability or no not broken shield equipped
        return 0.0f;
    }
    else
    {
        if (((Creature const*)this)->IsTotem())
            return 0.0f;
        else
        {
            float block = 5.0f;
            block += GetTotalAuraModifier(SPELL_AURA_MOD_BLOCK_PERCENT);
            return block > 0.0f ? block : 0.0f;
        }
    }
}

float Unit::GetUnitCriticalChance(WeaponAttackType attackType, const Unit *pVictim) const
{
    float crit;

    if (GetTypeId() == TYPEID_PLAYER)
    {
        switch (attackType)
        {
            case OFF_ATTACK:
            case BASE_ATTACK:
                crit = GetFloatValue(PLAYER_CRIT_PERCENTAGE);
                break;
            case RANGED_ATTACK:
                crit = GetFloatValue(PLAYER_RANGED_CRIT_PERCENTAGE);
                break;
            // Just for good manner
            default:
                crit = 0.0f;
                break;
        }
    }
    else
    {
        crit = 5.0f;
        crit += GetTotalAuraModifier(SPELL_AURA_MOD_CRIT_PERCENT);
    }

    // flat aura mods
    if (attackType == RANGED_ATTACK)
        crit += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_RANGED_CRIT_CHANCE);
    else
        crit += pVictim->GetTotalAuraModifier(SPELL_AURA_MOD_ATTACKER_MELEE_CRIT_CHANCE);

    // Apply crit chance from defence skill
    crit += (int32(GetMaxSkillValueForLevel(pVictim)) - int32(pVictim->GetDefenseSkillValue(this))) * 0.04f;

    if (crit < 0.0f)
        crit = 0.0f;
    return crit;
}

uint32 Unit::GetWeaponSkillValue(WeaponAttackType attType, Unit const* target) const
{
    uint32 value = 0;
    if (GetTypeId() == TYPEID_PLAYER)
    {
        Item* item = ((Player*)this)->GetWeaponForAttack(attType, true, true);

        // feral or unarmed skill only for base attack
        if (attType != BASE_ATTACK && !item)
            return 0;

        if (IsInFeralForm())
            return GetMaxSkillValueForLevel();              // always maximized SKILL_FERAL_COMBAT in fact

        // weapon skill or (unarmed for base attack)
        uint32  skill = item ? item->GetSkill() : SKILL_UNARMED;

// Daemon: pas en preBC !
//        // in PvP use full skill instead current skill value
//        value = (target && target->GetTypeId() == TYPEID_PLAYER)
//            ? ((Player*)this)->GetMaxSkillValue(skill)
//            : ((Player*)this)->GetSkillValue(skill);
        value = ToPlayer()->GetSkillValue(skill);
    }
    else
        value = GetUnitMeleeSkill(target);
    return value;
}

void Unit::_UpdateSpells(uint32 time)
{
    if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL])
        _UpdateAutoRepeatSpell();

    // remove finished spells from current pointers
    for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
    {
        if (m_currentSpells[i] && m_currentSpells[i]->getState() == SPELL_STATE_FINISHED)
        {
            m_currentSpells[i]->SetReferencedFromCurrent(false);
            m_currentSpells[i] = nullptr;                      // remove pointer
        }
    }

    // update auras
    // m_AurasUpdateIterator can be updated in inderect called code at aura remove to skip next planned to update but removed auras
    for (m_spellAuraHoldersUpdateIterator = m_spellAuraHolders.begin(); m_spellAuraHoldersUpdateIterator != m_spellAuraHolders.end();)
    {
        SpellAuraHolder* i_holder = m_spellAuraHoldersUpdateIterator->second;
        ++m_spellAuraHoldersUpdateIterator;                            // need shift to next for allow update if need into aura update

        // If channeled spell, do not update. The spell caster will update the holder on spell
        // update to prevent loss of periodic ticks due to out of sync updates
        if (i_holder->IsChanneled())
            continue;

        i_holder->UpdateHolder(time);
    }

    // remove expired auras
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        SpellAuraHolder *holder = iter->second;

        if (!(holder->IsPermanent() || holder->IsPassive()) && holder->GetAuraDuration() == 0)
        {
            RemoveSpellAuraHolder(holder, AURA_REMOVE_BY_EXPIRE);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }

    if (!m_gameObj.empty())
    {
        GameObjectList::iterator ite1, dnext1;
        for (ite1 = m_gameObj.begin(); ite1 != m_gameObj.end(); ite1 = dnext1)
        {
            dnext1 = ite1;
            //(*i)->Update( difftime );
            if (!(*ite1)->isSpawned())
            {
                (*ite1)->SetOwnerGuid(ObjectGuid());
                (*ite1)->SetRespawnTime(0);
                (*ite1)->Delete();
                dnext1 = m_gameObj.erase(ite1);
            }
            else
                ++dnext1;
        }
    }
}

void Unit::_UpdateAutoRepeatSpell()
{
    //check "realtime" interrupts
    if ((GetTypeId() == TYPEID_PLAYER && ((Player*)this)->IsMoving()) || IsNonMeleeSpellCasted(false, false, true))
    {
        // cancel wand shoot
        if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
            InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
        m_AutoRepeatFirstCast = true;
        return;
    }

    //apply delay
    if (m_AutoRepeatFirstCast && getAttackTimer(RANGED_ATTACK) < 500)
        setAttackTimer(RANGED_ATTACK, 500);
    m_AutoRepeatFirstCast = false;

    //castroutine
    if (isAttackReady(RANGED_ATTACK))
    {
        // Check if able to cast
        // We need to update pointers before calling CheckCast !
        m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->UpdatePointers();
        SpellCastResult result = m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->CheckCast(true);
        if (result == SPELL_FAILED_MOVING) // Just delay it if moving
            return;

        if (result != SPELL_CAST_OK)
        {
            InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
            return;
        }

        // we want to shoot
        Spell* spell = new Spell(this, m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo, true);
        spell->prepare(m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_targets);

        // all went good, reset attack
        resetAttackTimer(RANGED_ATTACK);
        SetStandState(UNIT_STAND_STATE_STAND);
    }
}

void Unit::SetCurrentCastedSpell(Spell * pSpell)
{
    MANGOS_ASSERT(pSpell);                                  // NULL may be never passed here, use InterruptSpell or InterruptNonMeleeSpells

    CurrentSpellTypes CSpellType = pSpell->GetCurrentContainer();

    if (pSpell == m_currentSpells[CSpellType]) return;      // avoid breaking self
    // break same type spell if it is not delayed
    InterruptSpell(CSpellType, false);

    // special breakage effects:
    switch (CSpellType)
    {
        case CURRENT_GENERIC_SPELL:
        {
            // generic spells always break channeled not delayed spells
            InterruptSpell(CURRENT_CHANNELED_SPELL, false);

            // autorepeat breaking
            if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL])
            {
                // break autorepeat if not Auto Shot
                if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
                    InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
                m_AutoRepeatFirstCast = true;
            }
        }
        break;

        case CURRENT_CHANNELED_SPELL:
        {
            // channel spells always break generic non-delayed and any channeled spells
            InterruptSpell(CURRENT_GENERIC_SPELL, false);
            InterruptSpell(CURRENT_CHANNELED_SPELL);

            // it also does break autorepeat if not Auto Shot
            if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL] &&
                    m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
                InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
        }
        break;

        case CURRENT_AUTOREPEAT_SPELL:
        {
            // only Auto Shoot does not break anything
            if (pSpell->m_spellInfo->Category == 351)
            {
                // generic autorepeats break generic non-delayed and channeled non-delayed spells
                InterruptSpell(CURRENT_GENERIC_SPELL, false);
                InterruptSpell(CURRENT_CHANNELED_SPELL, false);
            }
            // special action: set first cast flag
            m_AutoRepeatFirstCast = true;
        }
        break;

        default:
        {
            // other spell types don't break anything now
        } break;
    }

    // current spell (if it is still here) may be safely deleted now
    if (m_currentSpells[CSpellType])
        m_currentSpells[CSpellType]->SetReferencedFromCurrent(false);

    // set new current spell
    m_currentSpells[CSpellType] = pSpell;
    pSpell->SetReferencedFromCurrent(true);

    pSpell->m_selfContainer = &(m_currentSpells[pSpell->GetCurrentContainer()]);
}

void Unit::InterruptSpell(CurrentSpellTypes spellType, bool withDelayed)
{
    MANGOS_ASSERT(spellType < CURRENT_MAX_SPELL);

    if (m_currentSpells[spellType] && (withDelayed || m_currentSpells[spellType]->getState() != SPELL_STATE_DELAYED))
    {
        // send autorepeat cancel message for autorepeat spells
        if (spellType == CURRENT_AUTOREPEAT_SPELL)
        {
            if (GetTypeId() == TYPEID_PLAYER)
                ((Player*)this)->SendAutoRepeatCancel();
        }

        if (m_currentSpells[spellType]->getState() != SPELL_STATE_FINISHED)
            m_currentSpells[spellType]->cancel();

        // cancel can interrupt spell already (caster cancel ->target aura remove -> caster iterrupt)
        if (m_currentSpells[spellType])
        {
            m_currentSpells[spellType]->SetReferencedFromCurrent(false);
            m_currentSpells[spellType] = nullptr;
        }
    }
}

void Unit::FinishSpell(CurrentSpellTypes spellType, bool ok /*= true*/)
{
    Spell* spell = m_currentSpells[spellType];
    if (!spell)
        return;

    if (spellType == CURRENT_CHANNELED_SPELL)
        spell->SendChannelUpdate(0);

    spell->finish(ok);
}


bool Unit::IsNonMeleeSpellCasted(bool withDelayed, bool skipChanneled, bool skipAutorepeat) const
{
    // We don't do loop here to explicitly show that melee spell is excluded.
    // Maybe later some special spells will be excluded too.

    // generic spells are casted when they are not finished and not delayed
    if (m_currentSpells[CURRENT_GENERIC_SPELL] &&
            (m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_FINISHED) &&
            (withDelayed || m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_DELAYED))
        return (true);

    // channeled spells may be delayed, but they are still considered casted
    else if (!skipChanneled && m_currentSpells[CURRENT_CHANNELED_SPELL] &&
             (m_currentSpells[CURRENT_CHANNELED_SPELL]->getState() != SPELL_STATE_FINISHED))
        return (true);

    // autorepeat spells may be finished or delayed, but they are still considered casted
    else if (!skipAutorepeat && m_currentSpells[CURRENT_AUTOREPEAT_SPELL])
        return (true);

    return (false);
}

bool Unit::IsNextSwingSpellCasted() const
{
    if (m_currentSpells[CURRENT_MELEE_SPELL] && m_currentSpells[CURRENT_MELEE_SPELL]->IsNextMeleeSwingSpell())
        return (true);

    return (false);
}

bool Unit::IsNoMovementSpellCasted() const
{
    if (m_currentSpells[CURRENT_GENERIC_SPELL] &&
            (m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_FINISHED) &&
             m_currentSpells[CURRENT_GENERIC_SPELL]->getState() != SPELL_STATE_DELAYED &&
             m_currentSpells[CURRENT_GENERIC_SPELL]->m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT)
        return (true);
    else if (m_currentSpells[CURRENT_CHANNELED_SPELL] &&
             m_currentSpells[CURRENT_CHANNELED_SPELL]->getState() != SPELL_STATE_FINISHED &&
             m_currentSpells[CURRENT_CHANNELED_SPELL]->m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT)
        return (true);
    // don't need to check for AUTOREPEAT_SPELL

    return (false);
}

void Unit::InterruptSpellsWithInterruptFlags(uint32 flags, uint32 except)
{
    for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
        if (Spell* spell = GetCurrentSpell(CurrentSpellTypes(i)))
            if (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime())
                if (!spell->IsNextMeleeSwingSpell() && !spell->IsAutoRepeat() && !spell->IsTriggered() && (spell->m_spellInfo->InterruptFlags & flags) && spell->m_spellInfo->Id != except)
                    InterruptSpell(CurrentSpellTypes(i));
}


void Unit::InterruptNonMeleeSpells(bool withDelayed, uint32 spell_id)
{
    // generic spells are interrupted if they are not finished or delayed
    if (m_currentSpells[CURRENT_GENERIC_SPELL] && (!spell_id || m_currentSpells[CURRENT_GENERIC_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_GENERIC_SPELL, withDelayed);

    // autorepeat spells are interrupted if they are not finished or delayed
    if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL] && (!spell_id || m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_AUTOREPEAT_SPELL, withDelayed);

    // channeled spells are interrupted if they are not finished, even if they are delayed
    if (m_currentSpells[CURRENT_CHANNELED_SPELL] && (!spell_id || m_currentSpells[CURRENT_CHANNELED_SPELL]->m_spellInfo->Id == spell_id))
        InterruptSpell(CURRENT_CHANNELED_SPELL, true);
}


Spell* Unit::FindCurrentSpellBySpellId(uint32 spell_id) const
{
    for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
        if (m_currentSpells[i] && m_currentSpells[i]->m_spellInfo->Id == spell_id)
            return m_currentSpells[i];
    return nullptr;
}

void Unit::SetInFront(Unit const* target)
{
    if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_ROTATE))
        SetOrientation(GetAngle(target));
}

void Unit::SetFacingTo(float ori)
{
    m_movementInfo.ChangeOrientation(ori);

    Movement::MoveSplineInit init(*this, "SetFacingTo");
    init.SetFacing(ori);
    init.Launch();
}

void Unit::SetFacingToObject(WorldObject* pObject)
{
    // never face when already moving
    if (!IsStopped())
        return;

    // TODO: figure out under what conditions creature will move towards object instead of facing it where it currently is.
    SetFacingTo(GetAngle(pObject));
}

bool Unit::isInAccessablePlaceFor(Creature const* c) const
{
    if (IsInWater())
        return c->CanSwim();
    else
        return c->CanWalk() || c->CanFly();
}

bool Unit::IsInWater() const
{
    return GetTerrain()->IsInWater(GetPositionX(), GetPositionY(), GetPositionZ());
}

bool Unit::IsUnderWater() const
{
    return GetTerrain()->IsUnderWater(GetPositionX(), GetPositionY(), GetPositionZ());
}

void Unit::DeMorph()
{
    SetDisplayId(GetNativeDisplayId());
}

int32 Unit::GetTotalAuraModifier(AuraType auratype) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        // Exception for stealth detection, remove hidden trap detection (id:2836) from stealth modifier (should not be taken into account)
        // If it was the cast, rogue will see others rogue at 40 meters
        if ((*i)->GetId() != 2836)
            modifier += (*i)->GetModifier()->m_amount;
    }


    return modifier;
}

float Unit::GetTotalAuraMultiplier(AuraType auratype) const
{
    float multiplier = 1.0f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
        multiplier *= (100.0f + (*i)->GetModifier()->m_amount) / 100.0f;

    return multiplier;
}

int32 Unit::GetMaxPositiveAuraModifier(AuraType auratype) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
        if ((*i)->GetModifier()->m_amount > modifier)
            modifier = (*i)->GetModifier()->m_amount;

    return modifier;
}

int32 Unit::GetMaxNegativeAuraModifier(AuraType auratype) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
        if ((*i)->GetModifier()->m_amount < modifier)
            modifier = (*i)->GetModifier()->m_amount;

    return modifier;
}

int32 Unit::GetTotalAuraModifierByMiscMask(AuraType auratype, uint32 misc_mask) const
{
    if (!misc_mask)
        return 0;

    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue & misc_mask)
            modifier += mod->m_amount;
    }
    return modifier;
}

float Unit::GetTotalAuraMultiplierByMiscMask(AuraType auratype, uint32 misc_mask) const
{
    if (!misc_mask)
        return 1.0f;

    float multiplier = 1.0f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue & misc_mask)
            multiplier *= (100.0f + mod->m_amount) / 100.0f;
    }
    return multiplier;
}

int32 Unit::GetMaxPositiveAuraModifierByMiscMask(AuraType auratype, uint32 misc_mask) const
{
    if (!misc_mask)
        return 0;

    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue & misc_mask && mod->m_amount > modifier)
            modifier = mod->m_amount;
    }

    return modifier;
}

int32 Unit::GetMaxNegativeAuraModifierByMiscMask(AuraType auratype, uint32 misc_mask) const
{
    if (!misc_mask)
        return 0;

    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue & misc_mask && mod->m_amount < modifier)
            modifier = mod->m_amount;
    }

    return modifier;
}

int32 Unit::GetTotalAuraModifierByMiscValue(AuraType auratype, int32 misc_value) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue == misc_value)
            modifier += mod->m_amount;
    }
    return modifier;
}

float Unit::GetTotalAuraMultiplierByMiscValue(AuraType auratype, int32 misc_value) const
{
    float multiplier = 1.0f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue == misc_value)
            multiplier *= (100.0f + mod->m_amount) / 100.0f;
    }
    return multiplier;
}

int32 Unit::GetMaxPositiveAuraModifierByMiscValue(AuraType auratype, int32 misc_value) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue == misc_value && mod->m_amount > modifier)
            modifier = mod->m_amount;
    }

    return modifier;
}

int32 Unit::GetMaxNegativeAuraModifierByMiscValue(AuraType auratype, int32 misc_value) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (AuraList::const_iterator i = mTotalAuraList.begin(); i != mTotalAuraList.end(); ++i)
    {
        Modifier* mod = (*i)->GetModifier();
        if (mod->m_miscvalue == misc_value && mod->m_amount < modifier)
            modifier = mod->m_amount;
    }

    return modifier;
}

bool Unit::AddSpellAuraHolder(SpellAuraHolder *holder)
{
    SpellEntry const* aurSpellInfo = holder->GetSpellProto();

    // ghost spell check, allow apply any auras at player loading in ghost mode (will be cleanup after load)
    if (!isAlive() && !IsDeathPersistentSpell(aurSpellInfo) &&
            !IsDeathOnlySpell(aurSpellInfo) &&
            (GetTypeId() != TYPEID_PLAYER || !((Player*)this)->GetSession()->PlayerLoading()))
    {
        delete holder;
        return false;
    }

    if (holder->GetTarget() != this)
    {
        sLog.outError("Holder (spell %u) add to spell aura holder list of %s (lowguid: %u) but spell aura holder target is %s (lowguid: %u)",
                      holder->GetId(), (GetTypeId() == TYPEID_PLAYER ? "player" : "creature"), GetGUIDLow(),
                      (holder->GetTarget()->GetTypeId() == TYPEID_PLAYER ? "player" : "creature"), holder->GetTarget()->GetGUIDLow());
        delete holder;
        return false;
    }

    // passive and persistent auras can stack with themselves any number of times
    if ((!holder->IsPassive() && !holder->IsPersistent()) || holder->IsAreaAura())
    {
        SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(aurSpellInfo->Id);

        // take out same spell
        for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second; ++iter)
        {
            SpellAuraHolder *foundHolder = iter->second;
            if ((foundHolder->GetCasterGuid() == holder->GetCasterGuid() && foundHolder->GetCastItemGuid() == holder->GetCastItemGuid())
                    || aurSpellInfo->Custom & SPELL_CUSTOM_ALLOW_STACK_BETWEEN_CASTER)
            {
                if (foundHolder->CanBeRefreshedBy(holder))
                {
                    Unit* pAuraCaster = foundHolder->GetCaster();
                    if (pAuraCaster)
                    {
                        foundHolder->Refresh(pAuraCaster, this, holder);
                        delete holder;
                        return false;
                    }
                }

                // Aura can stack on self -> Stack it;
                if (aurSpellInfo->StackAmount)
                {
                    // can be created with >1 stack by some spell mods
                    foundHolder->ModStackAmount(holder->GetStackAmount());
                    delete holder;
                    return false;
                }

                // Check for coexisting Weapon-proced Auras
                if (holder->IsWeaponBuffCoexistableWith(foundHolder))
                    continue;

                // can be only single
                RemoveSpellAuraHolder(foundHolder, AURA_REMOVE_BY_STACK);
                break;
            }

            // Skip channeled spells (Arcane missile, ...) so two casters can channel at the same time
            if (IsChanneledSpell(aurSpellInfo))
                continue;
            bool stop = false;

            for (int32 i = 0; i < MAX_EFFECT_INDEX && !stop; ++i)
            {
                // no need to check non stacking auras that weren't/won't be applied on this target
                if (!foundHolder->m_auras[i] || !holder->m_auras[i])
                    continue;

                // Croise
                if (aurSpellInfo->Id == 20007)
                    break;

                // m_auraname can be modified to SPELL_AURA_NONE for area auras, use original
                AuraType aurNameReal = AuraType(aurSpellInfo->EffectApplyAuraName[i]);

                switch (aurNameReal)
                {
                    // DoT/HoT/etc
                    case SPELL_AURA_DUMMY:                  // allow stack (HoTs checked later)
                    case SPELL_AURA_PERIODIC_DAMAGE:
                    case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                    case SPELL_AURA_PERIODIC_LEECH:
                    case SPELL_AURA_PERIODIC_HEAL:
                    case SPELL_AURA_OBS_MOD_HEALTH:
                    case SPELL_AURA_PERIODIC_MANA_LEECH:
                    case SPELL_AURA_OBS_MOD_MANA:
                    case SPELL_AURA_POWER_BURN_MANA:
                    case SPELL_AURA_CHANNEL_DEATH_ITEM:
                        break;
                    case SPELL_AURA_PERIODIC_ENERGIZE:      // all or self or clear non-stackable
                    default:                                // not allow
                        // can be only single (this check done at _each_ aura add
                        stop = true;
                        break;
                }
            }

            if (stop)
            {
                RemoveSpellAuraHolder(foundHolder, AURA_REMOVE_BY_STACK);
                break;
            }
        }
    }

    // passive auras not stackable with other ranks
    if (!IsPassiveSpellStackableWithRanks(aurSpellInfo) && !holder->IsPersistent())
    {
        if (!RemoveNoStackAurasDueToAuraHolder(holder))
        {
            DETAIL_LOG("[STACK] Annulation de l'aura en cours : %u.", holder->GetId());
            delete holder;
            return false;                                   // couldn't remove conflicting aura with higher rank
        }
    }

    // update single target auras list (before aura add to aura list, to prevent unexpected remove recently added aura)
    if (holder->IsSingleTarget())
    {
        if (Unit* caster = holder->GetCaster())             // caster not in world
        {
            SingleCastSpellTargetMap& scTargets = caster->GetSingleCastSpellTargets();
            for (SingleCastSpellTargetMap::iterator itr = scTargets.begin(); itr != scTargets.end();)
            {
                SpellEntry const* itr_spellEntry = itr->first;
                ObjectGuid itr_targetGuid = itr->second;

                if (itr_targetGuid != GetObjectGuid() &&
                        IsSingleTargetSpells(itr_spellEntry, aurSpellInfo))
                {
                    scTargets.erase(itr);                   // remove for caster in any case

                    // remove from target if target found
                    if (Unit* itr_target = GetMap()->GetUnit(itr_targetGuid))
                        itr_target->RemoveAurasDueToSpell(itr_spellEntry->Id);

                    itr = scTargets.begin();                // list can be chnaged at remove aura
                    continue;
                }

                ++itr;
            }

            // register spell holder single target
            scTargets[aurSpellInfo] = GetObjectGuid();
        }
    }

    if (holder->IsDeleted())
    {
        sLog.outInfo("[Crash/Auras] Adding aura %u on player %s, but aura marked as deleted !", holder->GetId(), GetName());
        return false;
    }
    // add aura, register in lists and arrays
    m_spellAuraHolders.insert(SpellAuraHolderMap::value_type(holder->GetId(), holder));

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aur = holder->GetAuraByEffectIndex(SpellEffectIndex(i)))
            AddAuraToModList(aur);

    holder->ApplyAuraModifiers(true, true);
    DEBUG_LOG("Holder of spell %u now is in use", holder->GetId());

    // if aura deleted before boosts apply ignore
    // this can be possible it it removed indirectly by triggered spell effect at ApplyModifier
    if (holder->IsDeleted())
    {
        DETAIL_LOG(">> Aura %u is deleted", holder->GetId());
        return false;
    }
    holder->HandleSpellSpecificBoosts(true);

    // Check debuff limit
    //DEBUG_LOG("AddSpellAuraHolder: Adding spell %d, debuff limit affected: %d", holder->GetId(), holder->IsAffectedByDebuffLimit());
    if (holder->IsAffectedByDebuffLimit())
    {
        uint32 negativeAuras = GetNegativeAurasCount();
        if (negativeAuras > sWorld.getConfig(CONFIG_UINT32_DEBUFF_LIMIT))
        {
            // We may have removed the aura we just applied ...
            if (RemoveAuraDueToDebuffLimit(holder))
                return false; // The holder has been deleted with 'RemoveSpellAuraHolder'
        }
    }
    // When we call _AddSpellAuraHolder, we must have a free aura slot
    holder->_AddSpellAuraHolder();
    return true;
}

// Debuff limit
uint32 Unit::GetNegativeAurasCount()
{
    uint32 count = 0;
    for (SpellAuraHolderMap::const_iterator i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
    {
        if (!i->second || !i->second->IsAffectedByDebuffLimit())
            continue;

        ++count;
    }
    return count;
}

bool Unit::RemoveAuraDueToDebuffLimit(SpellAuraHolder* currentAura)
{
    SpellAuraHolderMap::const_iterator i, uselessDebuff;
    uselessDebuff = m_spellAuraHolders.end();
    for (i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
    {
        if (!i->second || !i->second->IsAffectedByDebuffLimit() || i->second->IsInUse())
            continue;

        if (uselessDebuff == m_spellAuraHolders.end() || uselessDebuff->second->IsMoreImportantDebuffThan(i->second))
            uselessDebuff = i;
    }

    SpellAuraHolder* removeAuraHolder = currentAura;
    if (uselessDebuff != m_spellAuraHolders.end())
        removeAuraHolder = uselessDebuff->second;
    RemoveSpellAuraHolder(removeAuraHolder);
    return currentAura == removeAuraHolder;
}

void Unit::AddAuraToModList(Aura *aura)
{
    if (aura->GetModifier()->m_auraname < TOTAL_AURAS)
        m_modAuras[aura->GetModifier()->m_auraname].push_back(aura);
}

void Unit::RemoveRankAurasDueToSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return;
    SpellAuraHolderMap::const_iterator i, next;
    for (i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); i = next)
    {
        next = i;
        ++next;
        uint32 i_spellId = (*i).second->GetId();
        if ((*i).second && i_spellId && i_spellId != spellId)
        {
            if (sSpellMgr.IsRankSpellDueToSpell(spellInfo, i_spellId))
            {
                RemoveAurasDueToSpell(i_spellId);

                if (m_spellAuraHolders.empty())
                    break;
                else
                    next =  m_spellAuraHolders.begin();
            }
        }
    }
}

bool Unit::RemoveNoStackAurasDueToAuraHolder(SpellAuraHolder *holder)
{
    if (!holder)
        return false;

    SpellEntry const* spellProto = holder->GetSpellProto();
    if (!spellProto)
        return false;

    uint32 spellId = holder->GetId();

    // passive spell special case (only non stackable with ranks)
    if (spellProto->Attributes & (SPELL_ATTR_PASSIVE | 0x80))
    {
        if (IsPassiveSpellStackableWithRanks(spellProto))
            return true;
    }

    uint32 firstInChain = 0;
    bool dmgPeriodic = false;
    for (int eff = 0; eff < MAX_EFFECT_INDEX; ++eff)
    {
        if (Aura* aura = holder->GetAuraByEffectIndex(SpellEffectIndex(eff)))
        {
            switch (aura->GetModifier()->m_auraname)
            {
                case SPELL_AURA_PERIODIC_HEAL:
                case SPELL_AURA_OBS_MOD_HEALTH:
                {
                    firstInChain = sSpellMgr.GetFirstSpellInChain(holder->GetId());
                    break;
                }
                case SPELL_AURA_PERIODIC_DAMAGE:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                case SPELL_AURA_PERIODIC_LEECH:
                {
                    dmgPeriodic = true;
                    break;
                }
                default:
                    break;
            }
        }

        if (firstInChain)
            break;
    }

    SpellSpecific spellId_spec = GetSpellSpecific(spellId);

    bool isAreaAura = IsSpellHaveEffect(spellProto, SPELL_EFFECT_APPLY_AREA_AURA_PARTY);
    SpellAuraHolderMap::iterator i, next;
    for (i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); i = next)
    {
        next = i;
        ++next;
        if (!(*i).second) continue;

        SpellEntry const* i_spellProto = (*i).second->GetSpellProto();

        if (!i_spellProto)
            continue;

        uint32 i_spellId = i_spellProto->Id;

        // early checks that spellId is passive non stackable spell
        if (i_spellProto->Attributes & (SPELL_ATTR_PASSIVE | 0x80))
        {
            // passive non-stackable spells not stackable only for same caster
            // -> Sauf si 2 AreaAuras
            if (holder->GetCasterGuid() != i->second->GetCasterGuid() && !isAreaAura && !IsSpellHaveEffect(i_spellProto, SPELL_EFFECT_APPLY_AREA_AURA_PARTY))
                continue;

            // passive non-stackable spells not stackable only with another rank of same spell
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
            {
                if (CompareAuraRanks(spellId, i_spellId) < 0) // Le sort actuel est plus puissant.
                {
                    DETAIL_LOG("[STACK] [%u/%u] Le sort actuel est plus puissant.", spellId, i_spellId);
                    // On empeche la pose de l'aura.
                    return false;
                }
            }
            else
                continue;
        }

        if (i_spellId == spellId)
        {
            // Nostalrius - fix stack same HoT rank / diff caster
            if (firstInChain)
                RemoveAurasDueToSpell(i_spellId);
            else switch (spellId)
            {
            // Blessing of Light does not stack between casters.
            case 19977:
            case 19978:
            case 19979:
            case 25890:
                RemoveAurasDueToSpell(spellId);
                break;
            }
            continue;
        }

        SpellGroup spellGroup;
        SpellGroupStackRule rule = sSpellMgr.CheckSpellGroupStackRules(i_spellId, spellId, spellGroup);
        if (rule != SPELL_GROUP_STACK_RULE_DEFAULT)
        {
            // Attempt to add apply less powerfull spell
            if (rule == SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN && sSpellMgr.IsMorePowerfullSpell(i_spellId, spellId, spellGroup))
            {
                DETAIL_LOG("[STACK][DB] Powerfull chain %u > %u (group %u). Aura %u will not be applied.", i_spellId, spellId, spellGroup, spellId);
                return false;
            }
            DETAIL_LOG("[STACK][DB] Unable to stack %u and %u. %u will be removed.", spellId, i_spellId, i_spellId);
            RemoveAurasDueToSpell(i_spellId);
            continue;
        }

        bool is_triggered_by_spell = false;
        // prevent triggering aura of removing aura that triggered it
        for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
            if (i_spellProto->EffectTriggerSpell[j] == spellId)
                is_triggered_by_spell = true;

        // prevent triggered aura of removing aura that triggering it (triggered effect early some aura of parent spell
        for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
            if (spellProto->EffectTriggerSpell[j] == i_spellId)
                is_triggered_by_spell = true;

        if (is_triggered_by_spell)
            continue;

        if (IsSpellHaveAura(i_spellProto, SPELL_AURA_CHANNEL_DEATH_ITEM)) // Plusieurs demo par exemple peuvent mettre un siphon d'ame.
            continue;

        SpellSpecific i_spellId_spec = GetSpellSpecific(i_spellId);

        // single allowed spell specific from same caster or from any caster at target
        bool is_spellSpecPerTargetPerCaster = IsSingleFromSpellSpecificPerTargetPerCaster(spellId_spec, i_spellId_spec);

        bool is_spellSpecPerTarget = IsSingleFromSpellSpecificPerTarget(spellId_spec, i_spellId_spec);

        // HoTs in 1.x must be per target also
        if (!is_spellSpecPerTarget && firstInChain && firstInChain == sSpellMgr.GetFirstSpellInChain(i_spellId))
            is_spellSpecPerTarget = true;

        if (is_spellSpecPerTarget || (is_spellSpecPerTargetPerCaster && holder->GetCasterGuid() == (*i).second->GetCasterGuid()))
        {
            // cannot remove higher rank
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
                if (CompareAuraRanks(spellId, i_spellId) < 0)
                    return false;

            // Its a parent aura (create this aura in ApplyModifier)
            if ((*i).second->IsInUse())
            {
                sLog.outError("SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i->second->GetId(), holder->GetId());
                continue;
            }
            DETAIL_LOG("[STACK][%u/%u] SpellSpecPerTarget ou SpellSpecPerCaster", spellId, i_spellId);
            RemoveAurasDueToSpell(i_spellId);

            if (m_spellAuraHolders.empty())
                break;
            else
                next =  m_spellAuraHolders.begin();

            continue;
        }

        // spell with spell specific that allow single ranks for spell from diff caster
        // same caster case processed or early or later
        bool is_spellPerTarget = IsSingleFromSpellSpecificSpellRanksPerTarget(spellId_spec, i_spellId_spec);
        if (is_spellPerTarget && holder->GetCasterGuid() != (*i).second->GetCasterGuid() && sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
        {
            // cannot remove higher rank
            if (CompareAuraRanks(spellId, i_spellId) < 0)
            {
                DETAIL_LOG("[STACK] [%u/%u] Rang plus haut.", spellId, i_spellId);
                return false;
            }

            // Its a parent aura (create this aura in ApplyModifier)
            if ((*i).second->IsInUse())
            {
                sLog.outError("SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i->second->GetId(), holder->GetId());
                continue;
            }
            DETAIL_LOG("[STACK][%u/%u] SpellPerTarget", spellId, i_spellId);
            RemoveAurasDueToSpell(i_spellId);

            if (m_spellAuraHolders.empty())
                break;
            else
                next =  m_spellAuraHolders.begin();

            continue;
        }

        // Periodic damage: allow different ranks from different casters for the same spell chain
        if (dmgPeriodic && holder->GetCasterGuid() != (*i).second->GetCasterGuid() && sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
        {
            continue;
        }

        // non single (per caster) per target spell specific (possible single spell per target at caster)
        if (!is_spellSpecPerTargetPerCaster && !is_spellSpecPerTarget && sSpellMgr.IsNoStackSpellDueToSpell(spellId, i_spellId))
        {
            // Prevent replacing higher ranks with lesser ranks
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId) && CompareAuraRanks(spellId, i_spellId) < 0)
            {
                return false;
            }

            // Its a parent aura (create this aura in ApplyModifier)
            if ((*i).second->IsInUse())
            {
                sLog.outError("SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i->second->GetId(), holder->GetId());
                continue;
            }
            DETAIL_LOG("[STACK][%u/%u] NoStackSpellDueToSpell", spellId, i_spellId);
            RemoveAurasByCasterSpell(i_spellId, (*i).second->GetCasterGuid());

            if (m_spellAuraHolders.empty())
                break;
            else
                next =  m_spellAuraHolders.begin();

            continue;
        }
    }
    // Sorts moins puissants :
    std::list<uint32> lessPowerfullSpells;
    if (sSpellMgr.ListLessPowerfullSpells(spellId, lessPowerfullSpells))
        for (std::list<uint32>::const_iterator it = lessPowerfullSpells.begin(); it != lessPowerfullSpells.end(); ++it)
            RemoveAurasDueToSpell(*it);
    return true;
}

void Unit::RemoveAura(uint32 spellId, SpellEffectIndex effindex, Aura* except)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second;)
    {
        Aura *aur = iter->second->m_auras[effindex];
        if (aur && aur != except)
        {
            RemoveSingleAuraFromSpellAuraHolder(iter->second, effindex);
            // may remove holder
            spair = GetSpellAuraHolderBounds(spellId);
            iter = spair.first;
        }
        else
            ++iter;
    }
}
void Unit::RemoveAurasByCasterSpell(uint32 spellId, ObjectGuid casterGuid, AuraRemoveMode mode)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second;)
    {
        if (iter->second->GetCasterGuid() == casterGuid)
        {
            RemoveSpellAuraHolder(iter->second, mode);
            spair = GetSpellAuraHolderBounds(spellId);
            iter = spair.first;
        }
        else
            ++iter;
    }
}

void Unit::RemoveSingleAuraFromSpellAuraHolder(uint32 spellId, SpellEffectIndex effindex, ObjectGuid casterGuid, AuraRemoveMode mode)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second;)
    {
        Aura *aur = iter->second->m_auras[effindex];
        if (aur && aur->GetCasterGuid() == casterGuid)
        {
            RemoveSingleAuraFromSpellAuraHolder(iter->second, effindex, mode);
            spair = GetSpellAuraHolderBounds(spellId);
            iter = spair.first;
        }
        else
            ++iter;
    }
}

void Unit::RemoveAuraHolderDueToSpellByDispel(uint32 spellId, uint32 stackAmount, ObjectGuid casterGuid, Unit *dispeller)
{
    RemoveAuraHolderFromStack(spellId, stackAmount, casterGuid, AURA_REMOVE_BY_DISPEL);
}

void Unit::RemoveAurasDueToSpellBySteal(uint32 spellId, ObjectGuid casterGuid, Unit *stealer)
{
    SpellAuraHolder *holder = GetSpellAuraHolder(spellId, casterGuid);
    SpellEntry const* spellProto = sSpellMgr.GetSpellEntry(spellId);
    SpellAuraHolder *new_holder = CreateSpellAuraHolder(spellProto, stealer, this);

    // set its duration and maximum duration
    // max duration 2 minutes (in msecs)
    int32 dur = holder->GetAuraDuration();
    int32 max_dur = 2 * MINUTE * IN_MILLISECONDS;
    int32 new_max_dur = max_dur > dur ? dur : max_dur;
    new_holder->SetAuraMaxDuration(new_max_dur);
    new_holder->SetAuraDuration(new_max_dur);

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        Aura *aur = holder->GetAuraByEffectIndex(SpellEffectIndex(i));

        if (!aur)
            continue;

        int32 basePoints = aur->GetBasePoints();
        // construct the new aura for the attacker - will never return NULL, it's just a wrapper for
        // some different constructors
        Aura * new_aur = CreateAura(aur->GetSpellProto(), aur->GetEffIndex(), &basePoints, new_holder, stealer, this);

        // set periodic to do at least one tick (for case when original aura has been at last tick preparing)
        int32 periodic = aur->GetModifier()->periodictime;
        new_aur->GetModifier()->periodictime = periodic < new_max_dur ? periodic : new_max_dur;

        // add the new aura to stealer
        new_holder->AddAura(new_aur, new_aur->GetEffIndex());
    }

    if (holder->ModStackAmount(-1))
        // Remove aura as dispel
        RemoveSpellAuraHolder(holder, AURA_REMOVE_BY_DISPEL);

    // strange but intended behaviour: Stolen single target auras won't be treated as single targeted
    new_holder->SetIsSingleTarget(false);

    if (!stealer->AddSpellAuraHolder(new_holder))
        new_holder = nullptr;
}

void Unit::RemoveAurasDueToSpellByCancel(uint32 spellId)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second;)
    {
        RemoveSpellAuraHolder(iter->second, AURA_REMOVE_BY_CANCEL);
        spair = GetSpellAuraHolderBounds(spellId);
        iter = spair.first;
    }
}

void Unit::RemoveAurasWithDispelType(DispelType type, ObjectGuid casterGuid)
{
    // Create dispel mask by dispel type
    uint32 dispelMask = GetDispellMask(type);
    // Dispel all existing auras vs current dispel type
    SpellAuraHolderMap& auras = GetSpellAuraHolderMap();
    for (SpellAuraHolderMap::iterator itr = auras.begin(); itr != auras.end();)
    {
        SpellEntry const* spell = itr->second->GetSpellProto();
        if (((1 << spell->Dispel) & dispelMask) && (!casterGuid || casterGuid == itr->second->GetCasterGuid()))
        {
            // Dispel aura
            RemoveAurasDueToSpell(spell->Id);
            itr = auras.begin();
        }
        else
            ++itr;
    }
}

void Unit::RemoveAuraHolderFromStack(uint32 spellId, uint32 stackAmount, ObjectGuid casterGuid, AuraRemoveMode mode)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second; ++iter)
    {
        if (!casterGuid || iter->second->GetCasterGuid() == casterGuid)
        {
            if (iter->second->ModStackAmount(-int32(stackAmount)))
            {
                RemoveSpellAuraHolder(iter->second, mode);
                break;
            }
        }
    }
}

void Unit::RemoveSingleAuraDueToItemSet(uint32 spellId, AuraRemoveMode mode)
{
    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = bounds.first; iter != bounds.second;)
    {
        if (!iter->second->GetCastItemGuid())
        {
            RemoveSpellAuraHolder(iter->second, mode);
            return;
        }
        else
            ++iter;
    }
}

void Unit::RemoveAurasDueToSpell(uint32 spellId, SpellAuraHolder* except, AuraRemoveMode mode)
{
    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = bounds.first; iter != bounds.second;)
    {
        if (iter->second != except)
        {
            RemoveSpellAuraHolder(iter->second, mode);
            bounds = GetSpellAuraHolderBounds(spellId);
            iter = bounds.first;
        }
        else
            ++iter;
    }
}

void Unit::RemoveAurasDueToItemSpell(Item* castItem, uint32 spellId)
{
    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = bounds.first; iter != bounds.second;)
    {
        if (iter->second->GetCastItemGuid() == castItem->GetObjectGuid())
        {
            RemoveSpellAuraHolder(iter->second);
            bounds = GetSpellAuraHolderBounds(spellId);
            iter = bounds.first;
        }
        else
            ++iter;
    }
}

void Unit::RemoveAurasWithInterruptFlags(uint32 flags, uint32 except)
{
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if (iter->second->GetSpellProto()->AuraInterruptFlags & flags && iter->second->GetSpellProto()->Id != except)
        {
            RemoveSpellAuraHolder(iter->second);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }
}

void Unit::RemoveAurasWithAttribute(uint32 flags)
{
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if (iter->second->GetSpellProto()->Attributes & flags)
        {
            RemoveSpellAuraHolder(iter->second);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }
}

void Unit::RemoveNotOwnSingleTargetAuras()
{
    // single target auras from other casters
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if (iter->second->GetCasterGuid() != GetObjectGuid() && iter->second->IsSingleTarget())
        {
            RemoveSpellAuraHolder(iter->second);
            iter = m_spellAuraHolders.begin();
            continue;
        }

        ++iter;
    }

    // single target auras at other targets
    SingleCastSpellTargetMap& scTargets = GetSingleCastSpellTargets();
    for (SingleCastSpellTargetMap::iterator itr = scTargets.begin(); itr != scTargets.end();)
    {
        SpellEntry const* itr_spellEntry = itr->first;
        ObjectGuid itr_targetGuid = itr->second;

        if (itr_targetGuid != GetObjectGuid())
        {
            scTargets.erase(itr);                           // remove for caster in any case

            // remove from target if target found
            if (Unit* itr_target = GetMap()->GetUnit(itr_targetGuid))
                itr_target->RemoveAurasByCasterSpell(itr_spellEntry->Id, GetObjectGuid());

            itr = scTargets.begin();                        // list can be changed at remove aura
            continue;
        }

        ++itr;
    }

}

void Unit::RemoveSpellAuraHolder(SpellAuraHolder *holder, AuraRemoveMode mode)
{
    // Statue unsummoned at holder remove
    SpellEntry const* AurSpellInfo = holder->GetSpellProto();
    Totem* statue = nullptr;
    Unit* caster = holder->GetCaster();
    bool isChanneled = holder->IsChanneled(); // cache for after the holder is deleted
    if (isChanneled && caster)
        if (caster->GetTypeId() == TYPEID_UNIT && ((Creature*)caster)->IsTotem() && ((Totem*)caster)->GetTotemType() == TOTEM_STATUE)
            statue = ((Totem*)caster);

    if (m_spellAuraHoldersUpdateIterator != m_spellAuraHolders.end() && m_spellAuraHoldersUpdateIterator->second == holder)
        ++m_spellAuraHoldersUpdateIterator;

    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(holder->GetId());
    bool foundInMap = false;
    for (SpellAuraHolderMap::iterator itr = bounds.first; itr != bounds.second; ++itr)
    {
        if (itr->second == holder)
        {
            m_spellAuraHolders.erase(itr);
            foundInMap = true;
            break;
        }
    }
    if (!foundInMap)
        sLog.outInfo("[Crash/Auras] Removing aura holder *not* in holders map ! Aura %u on %s", holder->GetId(), GetName());
    holder->SetRemoveMode(mode);
    holder->UnregisterSingleCastHolder();
    holder->HandleCastOnAuraRemoval();

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (Aura *aura = holder->m_auras[i])
            RemoveAura(aura, mode);
    }

    holder->_RemoveSpellAuraHolder();

    if (mode != AURA_REMOVE_BY_DELETE)
        holder->HandleSpellSpecificBoosts(false);

    if (statue)
        statue->UnSummon();

    uint32 auraSpellId = holder->GetId();

    // If holder in use (removed from code that plan access to it data after return)
    // store it in holder list with delayed deletion
    if (holder->IsInUse())
    {
        holder->SetDeleted();
        m_deletedHolders.push_back(holder);
    }
    else
        delete holder;

    if (isChanneled && caster)
    {
        Spell *channeled = caster->GetCurrentSpell(CURRENT_CHANNELED_SPELL);
        if (channeled && channeled->m_spellInfo->Id == auraSpellId)
        {
            // If single target, interrupt cast. If not, notify the spell caster so we
            // can stop processing this holder
            if (!IsAreaOfEffectSpell(channeled->m_spellInfo) && mode != AURA_REMOVE_BY_CHANNEL && (mode != AURA_REMOVE_BY_EXPIRE || caster->IsControlledByPlayer()))
                caster->InterruptSpell(CURRENT_CHANNELED_SPELL);
            else
                channeled->RemoveChanneledAuraHolder(holder, mode);
        }
    }
}

void Unit::RemoveSingleAuraFromSpellAuraHolder(SpellAuraHolder *holder, SpellEffectIndex index, AuraRemoveMode mode)
{
    Aura *aura = holder->GetAuraByEffectIndex(index);
    if (!aura)
        return;

    if (aura->IsLastAuraOnHolder())
        RemoveSpellAuraHolder(holder, mode);
    else
        RemoveAura(aura, mode);
}

void Unit::RemoveAura(Aura *Aur, AuraRemoveMode mode)
{
    // remove from list before mods removing (prevent cyclic calls, mods added before including to aura list - use reverse order)
    if (Aur->GetModifier()->m_auraname < TOTAL_AURAS)
        m_modAuras[Aur->GetModifier()->m_auraname].remove(Aur);

    // Set remove mode
    Aur->SetRemoveMode(mode);

    // some ShapeshiftBoosts at remove trigger removing other auras including parent Shapeshift aura
    // remove aura from list before to prevent deleting it before
    ///m_Auras.erase(i);

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Aura %u [spell%u] now is remove mode %d. Caster %s", Aur->GetModifier()->m_auraname, Aur->GetSpellProto()->Id, mode, GetName());

    // aura _MUST_ be remove from holder before unapply.
    // un-apply code expected that aura not find by diff searches
    // in another case it can be double removed for example, if target die/etc in un-apply process.
    Aur->GetHolder()->RemoveAura(Aur->GetEffIndex());

    // some auras also need to apply modifier (on caster) on remove
    if (mode == AURA_REMOVE_BY_DELETE)
    {
        switch (Aur->GetModifier()->m_auraname)
        {
            // need properly undo any auras with player-caster mover set (or will crash at next caster move packet)
            case SPELL_AURA_MOD_POSSESS:
            case SPELL_AURA_MOD_POSSESS_PET:
                Aur->ApplyModifier(false, true);
                break;
            default:
                break;
        }
    }
    else
        Aur->ApplyModifier(false, true);

    // If aura in use (removed from code that plan access to it data after return)
    // store it in aura list with delayed deletion
    if (Aur->IsInUse())
        m_deletedAuras.push_back(Aur);
    else
        delete Aur;
}

void Unit::RemoveAllAuras(AuraRemoveMode mode /*= AURA_REMOVE_BY_DEFAULT*/)
{
    while (!m_spellAuraHolders.empty())
    {
        SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin();
        RemoveSpellAuraHolder(iter->second, mode);
    }
}

void Unit::RemoveAllNegativeAuras(AuraRemoveMode mode /*= AURA_REMOVE_BY_DEFAULT*/)
{
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if (!iter->second->IsPositive())
        {
            RemoveSpellAuraHolder(iter->second, mode);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }
}

void Unit::RemoveAurasAtReset(AuraRemoveMode mode /*= AURA_REMOVE_BY_DEFAULT*/)
{
    // @TODO: Some buffs should maybe not get removed ? Self casted buffs ? ...
    if (Creature* c = ToCreature())
        if (CreatureInfo const* info = c->GetCreatureInfo())
            if (info->flags_extra & CREATURE_FLAG_EXTRA_KEEP_POSITIVE_AURAS_ON_EVADE)
            {
                RemoveAllNegativeAuras(mode);
                return;
            }
    RemoveAllAuras(mode);
}

void Unit::RemoveAuraTypeOnDeath(AuraType auraType)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        if (!(*iter)->GetHolder()->IsPassive() && !(*iter)->GetHolder()->IsDeathPersistent())
        {
            RemoveSpellAuraHolder((*iter)->GetHolder(), AURA_REMOVE_BY_DEATH);
            iter = m_modAuras[auraType].begin();
        }
        else
            ++iter;
    }
}

void Unit::RemoveAllAurasOnDeath()
{
    // used just after dieing to remove all visible auras
    // and disable the mods for the passive ones
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if (!iter->second->IsPassive() && !iter->second->IsDeathPersistent())
        {
            RemoveSpellAuraHolder(iter->second, AURA_REMOVE_BY_DEATH);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }
}

void Unit::DelaySpellAuraHolder(uint32 spellId, int32 delaytime, ObjectGuid casterGuid)
{
    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = bounds.first; iter != bounds.second; ++iter)
    {
        SpellAuraHolder* holder = iter->second;

        if (casterGuid != holder->GetCasterGuid())
            continue;

        if (holder->GetAuraDuration() < delaytime)
            holder->SetAuraDuration(0);
        else
            holder->SetAuraDuration(holder->GetAuraDuration() - delaytime);

        // push down the tick timer with the delay, otherwise we can still get max ticks even with pushback
        holder->RefreshAuraPeriodicTimers();
        holder->UpdateAuraDuration();

        DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Spell %u partially interrupted on %s, new duration: %u ms", spellId, GetObjectGuid().GetString().c_str(), holder->GetAuraDuration());
    }
}

void Unit::_RemoveAllAuraMods()
{
    for (SpellAuraHolderMap::const_iterator i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
        (*i).second->ApplyAuraModifiers(false);
}

void Unit::_ApplyAllAuraMods()
{
    for (SpellAuraHolderMap::const_iterator i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
        (*i).second->ApplyAuraModifiers(true);
}

bool Unit::HasAuraType(AuraType auraType) const
{
    return !GetAurasByType(auraType).empty();
}

bool Unit::HasAffectedAura(AuraType auraType, SpellEntry const* spellProto) const
{
    Unit::AuraList const& auras = GetAurasByType(auraType);

    for (Unit::AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
    {
        if ((*itr)->isAffectedOnSpell(spellProto))
            return true;
    }

    return false;
}

Aura* Unit::GetAura(uint32 spellId, SpellEffectIndex effindex)
{
    SpellAuraHolderBounds bounds = GetSpellAuraHolderBounds(spellId);
    if (bounds.first != bounds.second)
        return bounds.first->second->GetAuraByEffectIndex(effindex);
    return nullptr;
}

Aura* Unit::GetAura(AuraType type, SpellFamily family, uint64 familyFlag, ObjectGuid casterGuid)
{
    AuraList const& auras = GetAurasByType(type);
    for (AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
        if ((*i)->GetSpellProto()->IsFitToFamily(family, familyFlag) &&
                (!casterGuid || (*i)->GetCasterGuid() == casterGuid))
            return *i;

    return nullptr;
}

bool Unit::HasAura(uint32 spellId, SpellEffectIndex effIndex) const
{
    SpellAuraHolderConstBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::const_iterator i_holder = spair.first; i_holder != spair.second; ++i_holder)
        if (i_holder->second->GetAuraByEffectIndex(effIndex))
            return true;

    return false;
}

void Unit::AddDynObject(DynamicObject* dynObj)
{
    m_dynObjGUIDs.push_back(dynObj->GetObjectGuid());
    dynObj->SetWorldMask(GetWorldMask()); // Nostalrius : phasing
}

void Unit::RemoveDynObject(uint32 spellid)
{
    if (m_dynObjGUIDs.empty())
        return;
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
            i = m_dynObjGUIDs.erase(i);
        else if (spellid == 0 || dynObj->GetSpellId() == spellid)
        {
            dynObj->Delete();
            i = m_dynObjGUIDs.erase(i);
        }
        else
            ++i;
    }
}

void Unit::RemoveAllDynObjects()
{
    while (!m_dynObjGUIDs.empty())
    {
        if (DynamicObject* dynObj = GetMap()->GetDynamicObject(*m_dynObjGUIDs.begin()))
            dynObj->Delete();
        m_dynObjGUIDs.erase(m_dynObjGUIDs.begin());
    }
}

void Unit::GetDynObjects(uint32 spellId, SpellEffectIndex effectIndex, std::vector<DynamicObject*>& dynObjsOut)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId && dynObj->GetEffIndex() == effectIndex)
            dynObjsOut.push_back(dynObj);
        ++i;
    }
}

DynamicObject * Unit::GetDynObject(uint32 spellId, SpellEffectIndex effIndex)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId && dynObj->GetEffIndex() == effIndex)
            return dynObj;
        ++i;
    }
    return nullptr;
}

DynamicObject * Unit::GetDynObject(uint32 spellId)
{
    for (DynObjectGUIDs::iterator i = m_dynObjGUIDs.begin(); i != m_dynObjGUIDs.end();)
    {
        DynamicObject* dynObj = GetMap()->GetDynamicObject(*i);
        if (!dynObj)
        {
            i = m_dynObjGUIDs.erase(i);
            continue;
        }

        if (dynObj->GetSpellId() == spellId)
            return dynObj;
        ++i;
    }
    return nullptr;
}

GameObject* Unit::GetGameObject(uint32 spellId) const
{
    for (GameObjectList::const_iterator i = m_gameObj.begin(); i != m_gameObj.end(); ++i)
        if ((*i)->GetSpellId() == spellId)
            return *i;

    return nullptr;
}

void Unit::AddGameObject(GameObject* gameObj)
{
    MANGOS_ASSERT(gameObj && !gameObj->GetOwnerGuid());
    m_gameObj.push_back(gameObj);
    gameObj->SetOwnerGuid(GetObjectGuid());
    gameObj->SetWorldMask(GetWorldMask());

    if (GetTypeId() == TYPEID_PLAYER && gameObj->GetSpellId())
    {
        SpellEntry const* createBySpell = sSpellMgr.GetSpellEntry(gameObj->GetSpellId());
        // Need disable spell use for owner
        if (createBySpell && createBySpell->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
            // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
            ((Player*)this)->AddSpellAndCategoryCooldowns(createBySpell, 0, nullptr, true);
    }
}

void Unit::RemoveGameObject(GameObject* gameObj, bool del)
{
    MANGOS_ASSERT(gameObj && gameObj->GetOwnerGuid() == GetObjectGuid());

    gameObj->SetOwnerGuid(ObjectGuid());

    // GO created by some spell
    if (uint32 spellid = gameObj->GetSpellId())
    {
        RemoveAurasDueToSpell(spellid);

        SpellEntry const* createBySpell = sSpellMgr.GetSpellEntry(spellid);
        // Need activate spell use for owner, for summoning rituals it happens at ritual success
        if (createBySpell && createBySpell->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE &&
            gameObj->GetGoType() != GAMEOBJECT_TYPE_SUMMONING_RITUAL)
            // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
            CooldownEvent(createBySpell);
    }

    m_gameObj.remove(gameObj);

    if (del)
    {
        gameObj->SetRespawnTime(0);
        gameObj->Delete();
    }
}

void Unit::RemoveGameObject(uint32 spellid, bool del)
{
    if (m_gameObj.empty())
        return;
    GameObjectList::iterator i, next;
    for (i = m_gameObj.begin(); i != m_gameObj.end(); i = next)
    {
        next = i;
        if (spellid == 0 || (*i)->GetSpellId() == spellid)
        {
            (*i)->SetOwnerGuid(ObjectGuid());
            if (del)
            {
                (*i)->SetRespawnTime(0);
                (*i)->Delete();
            }

            next = m_gameObj.erase(i);
        }
        else
            ++next;
    }
}

void Unit::RemoveAllGameObjects()
{
    // remove references to unit
    for (GameObjectList::iterator i = m_gameObj.begin(); i != m_gameObj.end();)
    {
        (*i)->SetOwnerGuid(ObjectGuid());
        (*i)->SetRespawnTime(0);
        (*i)->Delete();
        i = m_gameObj.erase(i);
    }
}

void Unit::SendSpellNonMeleeDamageLog(SpellNonMeleeDamage *log)
{
    WorldPacket data(SMSG_SPELLNONMELEEDAMAGELOG, (16 + 4 + 4 + 1 + 4 + 4 + 1 + 1 + 4 + 4 + 1)); // we guess size
    data << log->target->GetPackGUID();
    data << log->attacker->GetPackGUID();
    data << uint32(log->SpellID);
    data << uint32(log->damage);                            // damage amount
    data << uint8(log->school);                              // damage school
    data << uint32(log->absorb);                            // AbsorbedDamage
    data << uint32(log->resist);                            // resist
    data << uint8(log->physicalLog);                        // if 1, then client show spell name (example: %s's ranged shot hit %s for %u school or %s suffers %u school damage from %s's spell_name
    data << uint8(log->unused);                             // unused
    data << uint32(log->blocked);                           // blocked
    data << uint32(log->HitInfo);
    data << uint8(0);                                       // flag to use extend data
    SendMessageToSet(&data, true);
}

void Unit::SendSpellNonMeleeDamageLog(Unit *target, uint32 SpellID, uint32 Damage, SpellSchoolMask damageSchoolMask, uint32 AbsorbedDamage, uint32 Resist, bool PhysicalDamage, uint32 Blocked, bool CriticalHit)
{
    SpellNonMeleeDamage log(this, target, SpellID, GetFirstSchoolInMask(damageSchoolMask));
    log.damage = Damage - AbsorbedDamage - Resist - Blocked;
    log.absorb = AbsorbedDamage;
    log.resist = Resist;
    log.physicalLog = PhysicalDamage;
    log.blocked = Blocked;
    log.HitInfo = SPELL_HIT_TYPE_UNK1 | SPELL_HIT_TYPE_UNK3 | SPELL_HIT_TYPE_UNK6;
    if (CriticalHit)
        log.HitInfo |= SPELL_HIT_TYPE_CRIT;
    SendSpellNonMeleeDamageLog(&log);
}

void Unit::SendPeriodicAuraLog(SpellPeriodicAuraLogInfo *pInfo, AuraType auraTypeOverride)
{
    Aura *aura = pInfo->aura;
    Modifier *mod = aura->GetModifier();
    AuraType auraType = auraTypeOverride ? auraTypeOverride : mod->m_auraname;

    WorldPacket data(SMSG_PERIODICAURALOG, 30);
    data << aura->GetTarget()->GetPackGUID();
    data << aura->GetCasterGuid().WriteAsPacked();
    data << uint32(aura->GetId());                          // spellId
    data << uint32(1);                                      // count
    data << uint32(auraType);                               // auraId
    switch (auraType)
    {
        case SPELL_AURA_PERIODIC_DAMAGE:
        case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
            data << uint32(pInfo->damage);                  // damage
            data << uint32(aura->GetSpellProto()->School);
            data << uint32(pInfo->absorb);                  // absorb
            data << uint32(pInfo->resist);                  // resist
            break;
        case SPELL_AURA_PERIODIC_HEAL:
        case SPELL_AURA_OBS_MOD_HEALTH:
            data << uint32(pInfo->damage);                  // damage
            break;
        case SPELL_AURA_OBS_MOD_MANA:
        case SPELL_AURA_PERIODIC_ENERGIZE:
            data << uint32(mod->m_miscvalue);               // power type
            data << uint32(pInfo->damage);                  // damage
            break;
        case SPELL_AURA_PERIODIC_MANA_LEECH:
            data << uint32(mod->m_miscvalue);               // power type
            data << uint32(pInfo->damage);                  // amount
            data << float(pInfo->multiplier);               // gain multiplier
            break;
        default:
            sLog.outError("Unit::SendPeriodicAuraLog: unknown aura %u", uint32(auraType));
            return;
    }

    aura->GetTarget()->SendObjectMessageToSet(&data, true);
}

class RemovedSpellData
{
public:
    RemovedSpellData(uint32 spell, Unit* target) : spellId(spell), unit(target)
    {
    }
    bool operator <(const RemovedSpellData& b) const
    {
        return spellId < b.spellId;
    }
    bool operator==(const RemovedSpellData& b) const
    {
        return spellId == b.spellId && unit == b.unit;
    }
    uint32 spellId;
    Unit*  unit;
};

typedef std::list<RemovedSpellData> RemoveSpellList;

void Unit::ProcDamageAndSpell(Unit *pVictim, uint32 procAttacker, uint32 procVictim, uint32 procExtra, uint32 amount, WeaponAttackType attType, SpellEntry const *procSpell, Spell* spell)
{
    if (!IsInWorld())
        return;

    ProcTriggeredList procTriggered;

    // Not much to do if no flags are set.
    if (procAttacker)
        ProcDamageAndSpellFor(false, pVictim, procAttacker, procExtra, attType, procSpell, amount, procTriggered, spell);

    // Now go on with a victim's events'n'auras
    // Not much to do if no flags are set or there is no victim
    if (pVictim && pVictim->isAlive() && procVictim)
        pVictim->ProcDamageAndSpellFor(true, this, procVictim, procExtra, attType, procSpell, amount, procTriggered, spell);

    HandleTriggers(pVictim, procExtra, amount, procSpell, procTriggered);
}

void Unit::HandleTriggers(Unit *pVictim, uint32 procExtra, uint32 amount, SpellEntry const *procSpell, ProcTriggeredList const& procTriggered)
{
    RemoveSpellList removedSpells;
    // Nothing found
    if (procTriggered.empty())
        return;

    // Handle effects proceed this time
    for (ProcTriggeredList::const_iterator itr = procTriggered.begin(); itr != procTriggered.end(); ++itr)
    {
        // Some auras can be deleted in function called in this loop (except first, ofc)
        SpellAuraHolder *triggeredByHolder = itr->triggeredByHolder;
        if (triggeredByHolder->IsDeleted())
        {
            triggeredByHolder->SetInUse(false);
            continue;
        }

        SpellProcEventEntry const *spellProcEvent = itr->spellProcEvent;
        bool useCharges = triggeredByHolder->GetAuraCharges() > 0;
        bool procSuccess = true;
        bool anyAuraProc = false;
        Unit* caster = itr->target == this ? pVictim : this;

        if (!caster || !caster->IsInWorld())
        {
            triggeredByHolder->SetInUse(false);
            continue;
        }

        // For players set spell cooldown if need
        uint32 cooldown = 0;
        if (triggeredByHolder->GetTarget()->GetTypeId() == TYPEID_PLAYER && spellProcEvent && spellProcEvent->cooldown)
            cooldown = spellProcEvent->cooldown;

        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            Aura *triggeredByAura = triggeredByHolder->GetAuraByEffectIndex(SpellEffectIndex(i));
            if (!triggeredByAura)
                continue;

            Modifier *auraModifier = triggeredByAura->GetModifier();

            if (procSpell)
            {
                if (spellProcEvent)
                {
                    if (spellProcEvent->spellFamilyMask[i])
                    {
                        if (!procSpell->IsFitToFamilyMask(spellProcEvent->spellFamilyMask[i]))
                            continue;
                    }
                    // don't check dbc FamilyFlags if schoolMask exists
                    else if (!triggeredByAura->CanProcFrom(procSpell, spellProcEvent->procEx, procExtra, amount != 0, !spellProcEvent->schoolMask))
                        continue;
                }
                else if (!triggeredByAura->CanProcFrom(procSpell, PROC_EX_NONE, procExtra, amount != 0, true))
                    continue;
            }

            SpellAuraProcResult procResult = (*caster.*AuraProcHandler[auraModifier->m_auraname])(itr->target, amount, triggeredByAura, procSpell, itr->procFlag, procExtra, cooldown);
            switch (procResult)
            {
                case SPELL_AURA_PROC_CANT_TRIGGER:
                    continue;
                case SPELL_AURA_PROC_FAILED:
                    procSuccess = false;
                    break;
                case SPELL_AURA_PROC_OK:
                    break;
            }

            anyAuraProc = true;
        }
        // Remove charge (aura can be removed by triggers)
        if (useCharges && procSuccess && anyAuraProc && !triggeredByHolder->IsDeleted())
        {
            // If last charge dropped add spell to remove list
            if (triggeredByHolder->DropAuraCharge())
                removedSpells.push_back(RemovedSpellData(triggeredByHolder->GetId(), caster));
        }

        triggeredByHolder->SetInUse(false);
    }

    if (!removedSpells.empty())
    {
        // Sort spells and remove duplicates
        removedSpells.sort();
        removedSpells.unique();
        // Remove auras from removedAuras
        for (RemoveSpellList::iterator i = removedSpells.begin(); i != removedSpells.end(); ++i)
            i->unit->RemoveAurasDueToSpell(i->spellId);
    }
}

void Unit::SendSpellMiss(Unit *target, uint32 spellID, SpellMissInfo missInfo)
{
    WorldPacket data(SMSG_SPELLLOGMISS, (4 + 8 + 1 + 4 + 8 + 1));
    data << uint32(spellID);
    data << GetObjectGuid();
    data << uint8(0);                                       // unk8
    data << uint32(1);                                      // target count
    // for(i = 0; i < target count; ++i)
    data << target->GetObjectGuid();                        // target GUID
    data << uint8(missInfo);
    // Nostalrius: + 2 * float if unk8=1
    // end loop
    SendObjectMessageToSet(&data, true);
}

void Unit::SendAttackStateUpdate(CalcDamageInfo *damageInfo)
{
    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "WORLD: Sending SMSG_ATTACKERSTATEUPDATE");

    WorldPacket data(SMSG_ATTACKERSTATEUPDATE, (16 + 45));  // we guess size

    data << uint32(damageInfo->HitInfo);
    data << GetPackGUID();
    data << damageInfo->target->GetPackGUID();
    data << uint32(damageInfo->totalDamage);    // Total damage

    data << uint8(m_weaponDamageCount[damageInfo->attackType]);         // Sub damage count

    // Sub damage description
    for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
    {
        SubDamageInfo *subDamage = &damageInfo->subDamage[i];

        data << uint32(GetFirstSchoolInMask(subDamage->damageSchoolMask));
        data << float(subDamage->damage)/ float(damageInfo->totalDamage);        // Float coefficient of sub damage
        data << uint32(subDamage->damage);
        data << uint32(subDamage->absorb);
        data << uint32(subDamage->resist);
    }
    data << uint32(damageInfo->TargetState);
    data << uint32(0);
    data << uint32(0);                                      // spell id, seen with heroic strike and disarm as examples.
    // HITINFO_NOACTION normally set if spell
    data << uint32(damageInfo->blocked_amount);

    SendMessageToSet(&data, true);
}

void Unit::SendAttackStateUpdate(uint32 HitInfo, Unit *target, uint8 /*SwingType*/, SpellSchoolMask damageSchoolMask, uint32 Damage, uint32 AbsorbDamage, uint32 Resist, VictimState TargetState, uint32 BlockedAmount)
{
    CalcDamageInfo dmgInfo;
    dmgInfo.HitInfo = HitInfo;
    dmgInfo.attacker = this;
    dmgInfo.target = target;
    dmgInfo.attackType = BASE_ATTACK;
    dmgInfo.totalDamage = Damage - AbsorbDamage - Resist - BlockedAmount;
    dmgInfo.totalAbsorb = AbsorbDamage;
    dmgInfo.totalResist = Resist;
    dmgInfo.subDamage[0].damage = dmgInfo.totalDamage;
    dmgInfo.subDamage[0].damageSchoolMask = damageSchoolMask;
    dmgInfo.subDamage[0].absorb = AbsorbDamage;
    dmgInfo.subDamage[0].resist = Resist;
    dmgInfo.TargetState = TargetState;
    dmgInfo.blocked_amount = BlockedAmount;
    SendAttackStateUpdate(&dmgInfo);
}

void Unit::SetInitCreaturePowerType()
{
    if (GetTypeId() == TYPEID_PLAYER)
        return;

    auto pCreature = static_cast<Creature*>(this);
    auto pPet = pCreature->ToPet();

    if (pPet && pPet->getPetType() == HUNTER_PET)
        return;

    // a bit wrong, but have to follow the dirty database values
    if (pCreature->GetCreatureInfo()->minmana > 0)
        SetByteValue(UNIT_FIELD_BYTES_0, 3, POWER_MANA);
    else
    {
        switch (getClass())
        {
        case CLASS_ROGUE:
            SetByteValue(UNIT_FIELD_BYTES_0, 3, POWER_ENERGY);
            SetMaxPower(POWER_ENERGY, GetCreatePowers(POWER_ENERGY));
            SetPower(POWER_ENERGY, 0);
            break;
        default:
            SetByteValue(UNIT_FIELD_BYTES_0, 3, POWER_RAGE);
            SetMaxPower(POWER_RAGE, GetCreatePowers(POWER_RAGE));
            SetPower(POWER_RAGE, 0);
            break;
        }
    }
}

void Unit::setPowerType(Powers new_powertype)
{
    SetByteValue(UNIT_FIELD_BYTES_0, 3, new_powertype);

    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_POWER_TYPE);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_POWER_TYPE);
        }
    }

    switch (new_powertype)
    {
        default:
        case POWER_MANA:
            break;
        case POWER_RAGE:
            SetMaxPower(POWER_RAGE, GetCreatePowers(POWER_RAGE));
            SetPower(POWER_RAGE, 0);
            break;
        case POWER_FOCUS:
            SetMaxPower(POWER_FOCUS, GetCreatePowers(POWER_FOCUS));
            SetPower(POWER_FOCUS, GetCreatePowers(POWER_FOCUS));
            break;
        case POWER_ENERGY:
            SetMaxPower(POWER_ENERGY, GetCreatePowers(POWER_ENERGY));
            SetPower(POWER_ENERGY, 0);
            break;
        case POWER_HAPPINESS:
            SetMaxPower(POWER_HAPPINESS, GetCreatePowers(POWER_HAPPINESS));
            SetPower(POWER_HAPPINESS, GetCreatePowers(POWER_HAPPINESS));
            break;
    }
}

FactionTemplateEntry const* Unit::getFactionTemplateEntry() const
{
    FactionTemplateEntry const* entry = sObjectMgr.GetFactionTemplateEntry(getFaction());
    if (!entry)
    {
        static ObjectGuid guid;                             // prevent repeating spam same faction problem

        if (GetObjectGuid() != guid)
        {
            sLog.outError("%s have invalid faction (faction template id) #%u", GetGuidStr().c_str(), getFaction());
            guid = GetObjectGuid();
        }
    }
    return entry;
}

// function based on function Unit::UnitReaction from 13850 client
ReputationRank Unit::GetReactionTo(Unit const* target) const
{
    // always friendly to self
    if (this == target)
        return REP_FRIENDLY;

    // always friendly to charmer or owner
    if (GetCharmerOrOwnerOrSelf() == target->GetCharmerOrOwnerOrSelf())
        return REP_FRIENDLY;

    Player const* selfPlayerOwner = GetAffectingPlayer();
    Player const* targetPlayerOwner = target->GetAffectingPlayer();

    // check forced reputation to support SPELL_AURA_FORCE_REACTION
    if (selfPlayerOwner)
    {
        if (selfPlayerOwner->isGameMaster())
            return REP_NEUTRAL;
        if (FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry())
            if (ReputationRank const* repRank = selfPlayerOwner->GetReputationMgr().GetForcedRankIfAny(targetFactionTemplateEntry))
                return *repRank;
    }
    else if (targetPlayerOwner)
    {
        if (targetPlayerOwner->isGameMaster())
            return REP_NEUTRAL;
        if (FactionTemplateEntry const* selfFactionTemplateEntry = getFactionTemplateEntry())
            if (ReputationRank const* repRank = targetPlayerOwner->GetReputationMgr().GetForcedRankIfAny(selfFactionTemplateEntry))
                return *repRank;
    }

    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE))
    {
        if (target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE))
        {
            if (selfPlayerOwner && targetPlayerOwner)
            {
                // always friendly to other unit controlled by player, or to the player himself
                if (selfPlayerOwner == targetPlayerOwner)
                    return REP_FRIENDLY;

                // duel - always hostile to opponent
                if (selfPlayerOwner->duel && selfPlayerOwner->duel->opponent == targetPlayerOwner && selfPlayerOwner->duel->startTime != 0 && !selfPlayerOwner->duel->finished)
                    return REP_HOSTILE;

                // same group - checks dependant only on our faction - skip FFA_PVP for example
                if (selfPlayerOwner->IsInRaidWith(targetPlayerOwner))
                    return REP_FRIENDLY; // return true to allow config option AllowTwoSide.Interaction.Group to work
                // however client seems to allow mixed group parties, because in 13850 client it works like:
                // return GetFactionReactionTo(getFactionTemplateEntry(), target);

                // Sanctuary
                if (selfPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_SANCTUARY) && targetPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_SANCTUARY))
                    return REP_FRIENDLY;

                // Nostalrius: Hackfix because UNIT_BYTE2_FLAG_FFA_PVP is not implemented yet.
                if (selfPlayerOwner->IsFFAPvP() && targetPlayerOwner->IsFFAPvP())
                    return REP_HOSTILE;
            }

            // check FFA_PVP - not implemented that way on MaNGOS :/
            /*
            if (GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_FFA_PVP
                && target->GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_FFA_PVP)
                return REP_HOSTILE;
            */
        }
        if (selfPlayerOwner)
        {
            if (FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry())
            {
                if (ReputationRank const* repRank = selfPlayerOwner->GetReputationMgr().GetForcedRankIfAny(targetFactionTemplateEntry))
                    return *repRank;
                if (FactionEntry const* targetFactionEntry = sObjectMgr.GetFactionEntry(targetFactionTemplateEntry->faction))
                {
                    if (targetFactionEntry->CanHaveReputation())
                    {
                        // check contested flags
                        if (targetFactionTemplateEntry->factionFlags & FACTION_TEMPLATE_FLAG_CONTESTED_GUARD
                            && selfPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
                            return REP_HOSTILE;

                        // if faction has reputation, hostile state depends only from AtWar state
                        if (FactionState const* factionState = selfPlayerOwner->GetReputationMgr().GetState(targetFactionEntry))
                            if (factionState->Flags & FACTION_FLAG_AT_WAR)
                                return REP_HOSTILE;
                        return REP_FRIENDLY;
                    }
                }
            }
        }
    }
    // do checks dependant only on our faction
    return GetFactionReactionTo(getFactionTemplateEntry(), target);
}

ReputationRank Unit::GetFactionReactionTo(FactionTemplateEntry const* factionTemplateEntry, Unit const* target)
{
    // always neutral when no template entry found
    if (!factionTemplateEntry)
        return REP_NEUTRAL;

    FactionTemplateEntry const* targetFactionTemplateEntry = target->getFactionTemplateEntry();
    if (!targetFactionTemplateEntry)
        return REP_NEUTRAL;

    if (Player const* targetPlayerOwner = target->GetAffectingPlayer())
    {
        // check contested flags
        if (factionTemplateEntry->IsContestedGuardFaction()
                && targetPlayerOwner->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP))
            return REP_HOSTILE;
        if (ReputationRank const* repRank = targetPlayerOwner->GetReputationMgr().GetForcedRankIfAny(factionTemplateEntry))
            return *repRank;
        if (FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(factionTemplateEntry->faction))
        {
            if (factionEntry->CanHaveReputation())
            {
                // CvP case - check reputation, don't allow state higher than neutral when at war
                ReputationRank repRank = targetPlayerOwner->GetReputationMgr().GetRank(factionEntry);
                if (FactionState const* factionState = targetPlayerOwner->GetReputationMgr().GetState(factionEntry))
                    if (factionState->Flags & FACTION_FLAG_AT_WAR)
                        repRank = std::min(REP_NEUTRAL, repRank);
                return repRank;
            }
        }
    }

    // common faction based check
    if (factionTemplateEntry->IsHostileTo(*targetFactionTemplateEntry))
        return REP_HOSTILE;
    if (factionTemplateEntry->IsFriendlyTo(*targetFactionTemplateEntry))
        return REP_FRIENDLY;
    if (targetFactionTemplateEntry->IsFriendlyTo(*factionTemplateEntry))
        return REP_FRIENDLY;
    if (factionTemplateEntry->factionFlags & FACTION_TEMPLATE_HOSTILE_BY_DEFAULT)
        return REP_HOSTILE;
    // neutral by default
    return REP_NEUTRAL;
}

bool Unit::IsHostileTo(Unit const* unit) const
{
    return GetReactionTo(unit) <= REP_HOSTILE;
}

bool Unit::IsFriendlyTo(Unit const* unit) const
{
    return GetReactionTo(unit) >= REP_FRIENDLY;
}

bool Unit::IsHostileToPlayers() const
{
    FactionTemplateEntry const* my_faction = getFactionTemplateEntry();
    if (!my_faction || !my_faction->faction)
        return false;

    FactionEntry const* raw_faction = sObjectMgr.GetFactionEntry(my_faction->faction);
    if (raw_faction && raw_faction->reputationListID >= 0)
        return false;

    return my_faction->IsHostileToPlayers();
}

bool Unit::IsNeutralToAll() const
{
    FactionTemplateEntry const* my_faction = getFactionTemplateEntry();
    if (!my_faction || !my_faction->faction)
        return true;

    FactionEntry const* raw_faction = sObjectMgr.GetFactionEntry(my_faction->faction);
    if (raw_faction && raw_faction->reputationListID >= 0)
        return false;

    return my_faction->IsNeutralToAll();
}

bool Unit::Attack(Unit *victim, bool meleeAttack)
{
    if (!victim || victim == this)
        return false;

    // Nostalrius : verifications de bon sens
    if (victim->IsDeleted() || IsDeleted())
        return false;

    // dead units can neither attack nor be attacked
    if (!isAlive() || !victim->IsInWorld() || !victim->isAlive())
        return false;

    // player cannot attack in mount state
    if (GetTypeId() == TYPEID_PLAYER && IsMounted())
        return false;

    // nobody can attack GM in GM-mode
    if (victim->GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)victim)->isGameMaster())
            return false;
    }
    else
    {
        if (((Creature*)victim)->IsInEvadeMode())
            return false;
    }

    // remove SPELL_AURA_MOD_UNATTACKABLE at attack (in case non-interruptible spells stun aura applied also that not let attack)
    if (HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
        RemoveSpellsCausingAura(SPELL_AURA_MOD_UNATTACKABLE);

    // in fighting already
    if (m_attacking)
    {
        if (m_attacking == victim)
        {
            // switch to melee attack from ranged/magic
            if (meleeAttack && !hasUnitState(UNIT_STAT_MELEE_ATTACKING))
            {
                addUnitState(UNIT_STAT_MELEE_ATTACKING);
                SendMeleeAttackStart(victim);
                return true;
            }
            return false;
        }

        // remove old target data
        AttackStop(true);
    }

    // Set our target
    SetTargetGuid(victim->GetObjectGuid());

    if (meleeAttack)
        addUnitState(UNIT_STAT_MELEE_ATTACKING);

    m_attacking = victim;
    m_attacking->_addAttacker(this);

    if (GetTypeId() == TYPEID_UNIT) // && !((Creature*)this)->GetLinkGroup())
    {
        ((Creature*)this)->SendAIReaction(AI_REACTION_HOSTILE);
        ((Creature*)this)->CallAssistance();

        if (Pet* pet = GetPet())
            if (pet->isAlive())
                pet->AI()->OwnerAttacked(victim);
    }

    // delay offhand weapon attack to next attack time
    if (haveOffhandWeapon())
        resetAttackTimer(OFF_ATTACK);

    if (meleeAttack)
        SendMeleeAttackStart(victim);

    return true;
}

void Unit::AttackedBy(Unit* attacker)
{
    if (Pet* pet = GetPet())
        if (pet->isAlive())
            pet->AI()->OwnerAttackedBy(attacker);

    if (!IsCreature())
        return;

    // trigger AI reaction
    if (((Creature*)this)->AI())
        ((Creature*)this)->AI()->AttackedBy(attacker);

    // trigger owner AI reaction
    if(Unit* owner = GetCharmerOrOwner())
        if (owner->IsCreature() && ((Creature*)owner)->AI()){
            ((Creature*)owner)->AI()->AttackedBy(attacker);
    }
}

bool Unit::AttackStop(bool targetSwitch /*=false*/)
{
    if (!m_attacking)
        return false;

    Unit* victim = m_attacking;

    m_attacking->_removeAttacker(this);
    m_attacking = nullptr;

    // Clear our target
    SetTargetGuid(ObjectGuid());

    clearUnitState(UNIT_STAT_MELEE_ATTACKING);

    InterruptSpell(CURRENT_MELEE_SPELL);

    // reset only at real combat stop
    if (!targetSwitch)
        if (Creature* me = ToCreature())
        {
            me->ResetDamageTakenOrigin();
            me->SetNoCallAssistance(false);

            if (me->HasSearchedAssistance())
            {
                me->SetNoSearchAssistance(false);
                UpdateSpeed(MOVE_RUN, false);
            }
        }

    SendMeleeAttackStop(victim);

    return true;
}

void Unit::CombatStop(bool includingCast)
{
    if (includingCast && IsNonMeleeSpellCasted(false))
        InterruptNonMeleeSpells(false);

    AttackStop();
    RemoveAllAttackers();

    if (GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->SendAttackSwingCancelAttack();     // melee and ranged forced attack cancel
    else if (GetTypeId() == TYPEID_UNIT)
    {
        ((Creature*)this)->UpdateCombatState(false);
        ((Creature*)this)->UpdateCombatWithZoneState(false);
        ((Creature*)this)->m_TargetNotReachableTimer = 0;
        if (((Creature*)this)->GetTemporaryFactionFlags() & TEMPFACTION_RESTORE_COMBAT_STOP)
            ((Creature*)this)->ClearTemporaryFaction();
    }

    ClearInCombat();
}

struct CombatStopWithPetsHelper
{
    explicit CombatStopWithPetsHelper(bool _includingCast) : includingCast(_includingCast) {}
    void operator()(Unit* unit) const
    {
        unit->CombatStop(includingCast);
    }
    bool includingCast;
};

void Unit::CombatStopWithPets(bool includingCast)
{
    CombatStop(includingCast);
    CallForAllControlledUnits(CombatStopWithPetsHelper(includingCast), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

struct IsAttackingPlayerHelper
{
    explicit IsAttackingPlayerHelper() {}
    bool operator()(Unit const* unit) const
    {
        return unit->isAttackingPlayer();
    }
};

bool Unit::isAttackingPlayer() const
{
    if (hasUnitState(UNIT_STAT_ATTACK_PLAYER))
        return true;

    return CheckAllControlledUnits(IsAttackingPlayerHelper(), CONTROLLED_PET | CONTROLLED_TOTEMS | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

void Unit::RemoveAllAttackers()
{
    while (!m_attackers.empty())
    {
        AttackerSet::iterator iter = m_attackers.begin();
        if (!(*iter)->AttackStop())
        {
            sLog.outError("WORLD: Unit has an attacker that isn't attacking it!");
            m_attackers.erase(iter);
        }
    }
}

void Unit::ModifyAuraState(AuraState flag, bool apply)
{
    if (apply)
    {
        if (!HasFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1)))
        {
            SetFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1));
            if (GetTypeId() == TYPEID_PLAYER)
            {
                const PlayerSpellMap& sp_list = ((Player*)this)->GetSpellMap();
                for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
                {
                    if (itr->second.state == PLAYERSPELL_REMOVED) continue;
                    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(itr->first);
                    if (!spellInfo || !IsPassiveSpell(spellInfo)) continue;
                    if (AuraState(spellInfo->CasterAuraState) == flag)
                        CastSpell(this, itr->first, true, nullptr);
                }
            }
        }
    }
    else
    {
        if (HasFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1)))
        {
            RemoveFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1));

            Unit::SpellAuraHolderMap& tAuras = GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::iterator itr = tAuras.begin(); itr != tAuras.end();)
            {
                SpellEntry const* spellProto = (*itr).second->GetSpellProto();
                if (spellProto->CasterAuraState == flag)
                {
                    RemoveSpellAuraHolder(itr->second);
                    itr = tAuras.begin();
                }
                else
                    ++itr;
            }
        }
    }
}

Unit *Unit::GetOwner() const
{
    if (ObjectGuid ownerid = GetOwnerGuid())
        return ObjectAccessor::GetUnit(*this, ownerid);
    return nullptr;
}

Unit *Unit::GetCharmer() const
{
    if (ObjectGuid charmerid = GetCharmerGuid())
        return ObjectAccessor::GetUnit(*this, charmerid);
    return nullptr;
}

bool Unit::IsCharmerOrOwnerPlayerOrPlayerItself() const
{
    if (GetTypeId() == TYPEID_PLAYER)
        return true;

    return GetCharmerOrOwnerGuid().IsPlayer();
}

Player* Unit::GetCharmerOrOwnerPlayerOrPlayerItself() const
{
    ObjectGuid guid = GetCharmerOrOwnerGuid();
    if (guid.IsPlayer())
        return ObjectAccessor::FindPlayer(guid);

    return GetTypeId() == TYPEID_PLAYER ? (Player*)this : NULL;
}

Player* Unit::GetAffectingPlayer() const
{
    if (!GetCharmerOrOwnerGuid())
        return const_cast<Unit*>(this)->ToPlayer();

    if (Unit* owner = GetCharmerOrOwner())
        return owner->GetCharmerOrOwnerPlayerOrPlayerItself();

    return nullptr;
}

Pet* Unit::GetPet() const
{
    if (ObjectGuid pet_guid = GetPetGuid())
    {
        if (Pet* pet = GetMap()->GetPet(pet_guid))
            return pet;

        sLog.outError("Unit::GetPet: %s not exist.", pet_guid.GetString().c_str());
        const_cast<Unit*>(this)->SetPet(nullptr);
    }

    return nullptr;
}

Pet* Unit::_GetPet(ObjectGuid guid) const
{
    return GetMap()->GetPet(guid);
}

Unit* Unit::GetCharm() const
{
    if (ObjectGuid charm_guid = GetCharmGuid())
    {
        if (Unit* pet = ObjectAccessor::GetUnit(*this, charm_guid))
            return pet;

        sLog.outError("Unit::GetCharm: Charmed %s not exist.", charm_guid.GetString().c_str());
        const_cast<Unit*>(this)->SetCharm(nullptr);
    }

    return nullptr;
}

void Unit::Uncharm()
{
    if (Unit* charm = GetCharm())
    {
        charm->RemoveCharmAuras();
        // Pet posses is not a typical charm
        charm->RemoveSpellsCausingAura(SPELL_AURA_MOD_POSSESS_PET);
    }
}

void Unit::RemoveCharmAuras()
{
    RemoveSpellsCausingAura(SPELL_AURA_MOD_POSSESS);
    RemoveSpellsCausingAura(SPELL_AURA_MOD_CHARM);
    RemoveSpellsCausingAura(SPELL_AURA_AOE_CHARM);
}

float Unit::GetCombatDistance(const Unit* target) const
{
    float radius = target->GetFloatValue(UNIT_FIELD_COMBATREACH) + GetFloatValue(UNIT_FIELD_COMBATREACH);
    float dx = GetPositionX() - target->GetPositionX();
    float dy = GetPositionY() - target->GetPositionY();
    float dz = GetPositionZ() - target->GetPositionZ();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz)) - radius;
    return (dist > 0 ? dist : 0);
}

float Unit::GetDistanceToCenter(const Unit* target) const
{
    float dx = GetPositionX() - target->GetPositionX();
    float dy = GetPositionY() - target->GetPositionY();
    float dz = GetPositionZ() - target->GetPositionZ();
    float dist = sqrt((dx * dx) + (dy * dy) + (dz * dz));
    return (dist > 0 ? dist : 0);
}

void Unit::SetPet(Pet* pet)
{
    SetPetGuid(pet ? pet->GetObjectGuid() : ObjectGuid());
    if (pet)
        pet->SetWorldMask(GetWorldMask());
}

void Unit::SetCharm(Unit* pet)
{
    SetCharmGuid(pet ? pet->GetObjectGuid() : ObjectGuid());
}


void Unit::RestoreFaction()
{
    if (GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->setFactionForRace(getRace());
    else
    {
        if (CreatureInfo const *cinfo = ((Creature*)this)->GetCreatureInfo())  // normal creature
        {
            FactionTemplateEntry const *faction = getFactionTemplateEntry();
            setFaction((faction && faction->friendlyMask & 0x004) ? cinfo->faction_H : cinfo->faction_A);
        }
    }
}

bool Unit::canAttack(Unit const* target, bool force) const
{
    ASSERT(target);

    if (force)
    {
        if (IsFriendlyTo(target))
            return false;

        if (GetTypeId() != TYPEID_PLAYER)
        {
            if (((Creature*)this)->IsPet())
            {
                if (Unit *owner = GetOwner())
                    if (!(owner->canAttack(target)))
                        return false;
            }
            else if (!IsHostileTo(target))
                return false;
        }
    }
    else if (!IsHostileTo(target))
        return false;

    if (!target->isAttackableByAOE() || target->hasUnitState(UNIT_STAT_DIED))
        return false;

    // shaman totem quests: spell 8898, shaman can detect elementals but elementals cannot see shaman
    if (m_invisibilityMask || target->m_invisibilityMask)
        if (!canDetectInvisibilityOf(target) && !target->canDetectInvisibilityOf(this))
            return false;

    return true;
}

void Unit::AddGuardian(Pet* pet)
{
    m_guardianPets.insert(pet->GetObjectGuid());
    pet->SetWorldMask(GetWorldMask()); // Nostalrius : phasing
}

void Unit::RemoveGuardian(Pet* pet)
{
    m_guardianPets.erase(pet->GetObjectGuid());
}

void Unit::RemoveGuardians()
{
    while (!m_guardianPets.empty())
    {
        ObjectGuid guid = *m_guardianPets.begin();

        if (Pet* pet = GetMap()->GetPet(guid))
            pet->Unsummon(PET_SAVE_AS_DELETED, this); // can remove pet guid from m_guardianPets

        m_guardianPets.erase(guid);
    }
}

Pet* Unit::FindGuardianWithEntry(uint32 entry)
{
    for (GuardianPetList::const_iterator itr = m_guardianPets.begin(); itr != m_guardianPets.end(); ++itr)
        if (Pet* pet = GetMap()->GetPet(*itr))
            if (pet->GetEntry() == entry)
                return pet;

    return nullptr;
}

uint32 Unit::GetGuardianCountWithEntry(uint32 entry)
{
    uint32 result = 0;
    for (GuardianPetList::const_iterator itr = m_guardianPets.begin(); itr != m_guardianPets.end(); ++itr)
        if (Pet* pet = GetMap()->GetPet(*itr))
            if (pet->GetEntry() == entry && pet->isAlive())
                result++;

    return result;
}

Unit* Unit::_GetTotem(TotemSlot slot) const
{
    return GetTotem(slot);
}

Totem* Unit::GetTotem(TotemSlot slot) const
{
    if (slot >= MAX_TOTEM_SLOT || !IsInWorld() || !m_TotemSlot[slot])
        return nullptr;

    Creature *totem = GetMap()->GetCreature(m_TotemSlot[slot]);
    return totem && totem->IsTotem() ? (Totem*)totem : NULL;
}

bool Unit::IsAllTotemSlotsUsed() const
{
    for (int i = 0; i < MAX_TOTEM_SLOT; ++i)
        if (!m_TotemSlot[i])
            return false;
    return true;
}

void Unit::_AddTotem(TotemSlot slot, Totem* totem)
{
    m_TotemSlot[slot] = totem->GetObjectGuid();
    totem->SetWorldMask(GetWorldMask());
}

void Unit::_RemoveTotem(Totem* totem)
{
    for (int i = 0; i < MAX_TOTEM_SLOT; ++i)
    {
        if (m_TotemSlot[i] == totem->GetObjectGuid())
        {
            m_TotemSlot[i].Clear();
            break;
        }
    }
}

void Unit::UnsummonAllTotems()
{
    for (int i = 0; i < MAX_TOTEM_SLOT; ++i)
        if (Totem* totem = GetTotem(TotemSlot(i)))
            totem->UnSummon();
}

int32 Unit::DealHeal(Unit *pVictim, uint32 addhealth, SpellEntry const *spellProto, bool critical)
{
    // Script Event HealedBy
    if (pVictim->AI())
        pVictim->AI()->HealedBy(this, addhealth);

    int32 gain = pVictim->ModifyHealth(int32(addhealth));

    Unit* unit = this;

    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
        unit = GetOwner();

    if (!unit)
        return 0;

    if (unit->GetTypeId() == TYPEID_PLAYER || pVictim->GetTypeId() == TYPEID_PLAYER)
        unit->SendHealSpellLog(pVictim, spellProto->Id, addhealth, critical);

    return gain;
}

Unit* Unit::SelectMagnetTarget(Unit *victim, Spell* spell, SpellEffectIndex eff)
{
    if (!victim)
        return nullptr;

    SpellEntry const* pProto = spell->m_spellInfo;
    if (!pProto) return nullptr;
    // Example spell: Cause Insanity (Hakkar)
    if (pProto->AttributesEx & SPELL_ATTR_EX_CANT_BE_REDIRECTED)
        return victim;
    // Magic case

    if (pProto->AttributesEx3 & SPELL_ATTR_EX3_NO_INITIAL_AGGRO)
        return victim;

    if ((pProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC || pProto->SpellVisual == 7250) && pProto->Dispel != DISPEL_POISON && !(pProto->Attributes & 0x10))
    {
        Unit::AuraList const& magnetAuras = victim->GetAurasByType(SPELL_AURA_SPELL_MAGNET);
        for (Unit::AuraList::const_iterator itr = magnetAuras.begin(); itr != magnetAuras.end(); ++itr)
        {
            if (Unit* magnet = (*itr)->GetCaster())
            {
                if (magnet->isAlive() && magnet->IsWithinLOSInMap(this) && spell->CheckTarget(magnet, eff))
                {
                    if (SpellAuraHolder *holder = (*itr)->GetHolder())
                        if (holder->DropAuraCharge())
                        {
                            magnet->RemoveAurasDueToSpell(holder->GetId()); // Remove from grounding totem also
                            victim->RemoveSpellAuraHolder(holder);
                        }
                    return magnet;
                }
            }
        }
    }

    return victim;
}

void Unit::SendHealSpellLog(Unit *pVictim, uint32 SpellID, uint32 Damage, bool critical)
{
    // we guess size
    WorldPacket data(SMSG_SPELLHEALLOG, (8 + 8 + 4 + 4 + 1));
    data << pVictim->GetPackGUID();
    data << GetPackGUID();
    data << uint32(SpellID);
    data << uint32(Damage);
    data << uint8(critical ? 1 : 0);
    // data << uint8(0);                                       // [-ZERO]
    SendMessageToSet(&data, true);
}

void Unit::SendEnergizeSpellLog(Unit *pVictim, uint32 SpellID, uint32 Damage, Powers powertype)
{
    WorldPacket data(SMSG_SPELLENERGIZELOG, (8 + 8 + 4 + 4 + 4 + 1));
    data << pVictim->GetPackGUID();
    data << GetPackGUID();
    data << uint32(SpellID);
    data << uint32(powertype);
    data << uint32(Damage);
    SendMessageToSet(&data, true);
}

void Unit::EnergizeBySpell(Unit *pVictim, uint32 SpellID, uint32 Damage, Powers powertype)
{
    SendEnergizeSpellLog(pVictim, SpellID, Damage, powertype);
    // needs to be called after sending spell log
    pVictim->ModifyPower(powertype, Damage);
}

int32 Unit::SpellBonusWithCoeffs(SpellEntry const *spellProto, int32 total, int32 benefit, int32 ap_benefit,  DamageEffectType damagetype, bool donePart, Unit *pCaster, Spell* spell)
{
    // Distribute Damage over multiple effects, reduce by AoE
    float coeff = 0.0f;

    // Not apply this to creature casted spells
    // Daemon: n'importe quoi. Et apres on se demande pourquoi les degats du sceau du croise sont abuses ...
    //if (GetTypeId()==TYPEID_UNIT && !((Creature*)this)->IsPet())
    //    coeff = 1.0f;
    // Check for table values
    if (SpellBonusEntry const* bonus = sSpellMgr.GetSpellBonusData(spellProto->Id))
    {
        coeff = damagetype == DOT ? bonus->dot_damage : bonus->direct_damage;

        // apply ap bonus at done part calculation only (it flat total mod so common with taken)
        if (donePart && (bonus->ap_bonus || bonus->ap_dot_bonus))
        {
            float ap_bonus = damagetype == DOT ? bonus->ap_dot_bonus : bonus->ap_bonus;

            total += int32(ap_bonus * (GetTotalAttackPowerValue(IsSpellRequiresRangedAP(spellProto) ? RANGED_ATTACK : BASE_ATTACK) + ap_benefit));
        }
    }
    // Calculate default coefficient
    else if (benefit)
        coeff = CalculateDefaultCoefficient(spellProto, damagetype);

    if (benefit)
    {
        // Calculate level penalty
        float LvlPenalty = CalculateLevelPenalty(spellProto);

        // Calculate custom coefficient
        coeff = CalculateCustomCoefficient(spellProto, pCaster, damagetype, coeff, spell, donePart);

        // Spellmod SpellDamage
        if (Player* modOwner = GetSpellModOwner())
        {
            coeff *= 100.0f;
            modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_SPELL_BONUS_DAMAGE, coeff, spell);
            coeff /= 100.0f;
        }
        // Nostalrius.
        bool bUsePenalty = true;
        // Flash of Light
        if (spellProto->Id == 19993)
        {
            bUsePenalty = false;
            if (HasAura(28853)) total += 53.0f;  // Libram of Divinity
            if (HasAura(28851)) total += 83.0f;  // Libram of Light
        }

        // Dragonbreath Chili
        if (spellProto->Id == 15851)
            bUsePenalty = false;

        if (bUsePenalty)
            total += int32(benefit * coeff * LvlPenalty);
        else
            total += int32(benefit * coeff);

    }

    return total;
};

/**
 * Calculates caster part of spell damage bonuses,
 * also includes different bonuses dependent from target auras
 */
uint32 Unit::SpellDamageBonusDone(Unit *pVictim, SpellEntry const *spellProto, uint32 pdamage, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    if (!spellProto || !pVictim || damagetype == DIRECT_DAMAGE)
        return pdamage;

    // Ignite damage already includes modifiers
    if (spellProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_IGNITE>())
        return pdamage;

    // For totems get damage bonus from owner (statue isn't totem in fact)
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
    {
        if (Unit* owner = GetOwner())
            return owner->SpellDamageBonusDone(pVictim, spellProto, pdamage, damagetype, stack, spell);
    }

    float DoneTotalMod = 1.0f;
    int32 DoneTotal = 0;
    Item*  pWeapon = GetTypeId() == TYPEID_PLAYER ? ((Player*)this)->GetWeaponForAttack(BASE_ATTACK, true, false) : NULL;

    // Creature damage
    if (GetTypeId() == TYPEID_UNIT && !((Creature*)this)->IsPet())
        DoneTotalMod *= ((Creature*)this)->GetSpellDamageMod(((Creature*)this)->GetCreatureInfo()->rank);

    AuraList const& mModDamagePercentDone = GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
    for (AuraList::const_iterator i = mModDamagePercentDone.begin(); i != mModDamagePercentDone.end(); ++i)
    {
        if (((*i)->GetModifier()->m_miscvalue & GetSpellSchoolMask(spellProto)) &&
            (*i)->GetSpellProto()->EquippedItemClass == -1 &&
            spellProto->EquippedItemClass == -1 && 
            // -1 == any item class (not wand then)
            (*i)->GetSpellProto()->EquippedItemInventoryTypeMask == 0)
            // 0 == any inventory type (not wand then)
        {
            DoneTotalMod *= ((*i)->GetModifier()->m_amount + 100.0f) / 100.0f;
        }
        // Paladin seals benefit from weapon modifiers
        else if ((*i)->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() &&
            spellProto->SpellFamilyName == SPELLFAMILY_PALADIN && spellProto->IsFitToFamilyMask<CF_PALADIN_SEALS>() &&
            (((*i)->GetSpellProto()->EquippedItemClass == -1) ||
            (pWeapon && pWeapon->IsFitToSpellRequirements((*i)->GetSpellProto()))))
        {
            DoneTotalMod *= ((*i)->GetModifier()->m_amount + 100.0f) / 100.0f;
        }
    }

    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();

    // Add pct bonus from spell damage versus
    DoneTotalMod *= GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_VERSUS, creatureTypeMask);

    // Add flat bonus from spell damage creature
    DoneTotal += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_CREATURE, creatureTypeMask);

    // done scripted mod (take it from owner)
    Unit *owner = GetOwner();
    if (!owner) owner = this;
    AuraList const& mOverrideClassScript = owner->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
    for (AuraList::const_iterator i = mOverrideClassScript.begin(); i != mOverrideClassScript.end(); ++i)
    {
        if (!(*i)->isAffectedOnSpell(spellProto))
            continue;
        switch ((*i)->GetModifier()->m_miscvalue)
        {
            case 4418: // Increased Shock Damage
            case 4554: // Increased Lightning Damage
            case 4555: // Improved Moonfire
            {
                DoneTotal += (*i)->GetModifier()->m_amount;
                break;
            }
        }
    }

    // Pet happiness increases damage of Hunter pet spells (e.g. Lightning Breath)
    if (IsPet() && ((Pet*)this)->getPetType() == HUNTER_PET)
    {
        if (Pet* pet = ((Pet*)this))
        {
            switch (pet->GetHappinessState())
            {
                case HAPPY:     DoneTotalMod *= 1.25; break;
                case CONTENT:   break;
                case UNHAPPY:   DoneTotalMod *= 0.75; break;
            }
        }
    }

    // Done fixed damage bonus auras
    int32 DoneAdvertisedBenefit = SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto));

    // Add flat bonus from spell damage versus
    DoneAdvertisedBenefit += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_FLAT_SPELL_DAMAGE_VERSUS, creatureTypeMask);

    // Pets just add their bonus damage to their spell damage
    // note that their spell damage is just gain of their own auras
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
        DoneAdvertisedBenefit += ((Pet*)this)->GetBonusDamage();

    // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
    DoneTotal = SpellBonusWithCoeffs(spellProto, DoneTotal, DoneAdvertisedBenefit, 0, damagetype, true, this, spell);

    float tmpDamage = (int32(pdamage) + DoneTotal * int32(stack)) * DoneTotalMod;
    // apply spellmod to Done damage (flat and pct)
    if (Player* modOwner = GetSpellModOwner())
        modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, tmpDamage, spell);

    DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellDmgBonus[spell=%u]: (base=%u + %i) * %f. SP=%i", spellProto->Id, pdamage, DoneTotal, DoneTotalMod, DoneAdvertisedBenefit);
    return tmpDamage > 0 ? uint32(tmpDamage) : 0;
}

/**
 * Calculates target part of spell damage bonuses,
 * will be called on each tick for periodic damage over time auras
 */
uint32 Unit::SpellDamageBonusTaken(Unit *pCaster, SpellEntry const *spellProto, uint32 pdamage, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    if (!spellProto || !pCaster || damagetype == DIRECT_DAMAGE)
        return pdamage;

    uint32 schoolMask = spell ? spell->m_spellSchoolMask : GetSpellSchoolMask(spellProto);

    // Taken total percent damage auras
    float TakenTotalMod = 1.0f;
    int32 TakenTotal = 0;

    // ..taken
    TakenTotalMod *= GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, schoolMask);

    // Taken fixed damage bonus auras
    int32 TakenAdvertisedBenefit = SpellBaseDamageBonusTaken(GetSpellSchoolMask(spellProto));

    // apply benefit affected by spell power implicit coeffs and spell level penalties
    TakenTotal = SpellBonusWithCoeffs(spellProto, TakenTotal, TakenAdvertisedBenefit, 0, damagetype, false, pCaster, spell);

    float tmpDamage = (int32(pdamage) + TakenTotal * int32(stack)) * TakenTotalMod;

    return tmpDamage > 0 ? uint32(tmpDamage) : 0;
}

int32 Unit::SpellBaseDamageBonusDone(SpellSchoolMask schoolMask)
{
    int32 DoneAdvertisedBenefit = 0;

    // ..done
    AuraList const& mDamageDone = GetAurasByType(SPELL_AURA_MOD_DAMAGE_DONE);
    for (AuraList::const_iterator i = mDamageDone.begin(); i != mDamageDone.end(); ++i)
    {
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) != 0 &&
                (*i)->GetSpellProto()->EquippedItemClass == -1 &&                   // -1 == any item class (not wand then)
                (*i)->GetSpellProto()->EquippedItemInventoryTypeMask == 0)          //  0 == any inventory type (not wand then)
            DoneAdvertisedBenefit += (*i)->GetModifier()->m_amount;
    }

    if (GetTypeId() == TYPEID_PLAYER)
    {
        // Damage bonus from stats
        AuraList const& mDamageDoneOfStatPercent = GetAurasByType(SPELL_AURA_MOD_SPELL_DAMAGE_OF_STAT_PERCENT);
        for (AuraList::const_iterator i = mDamageDoneOfStatPercent.begin(); i != mDamageDoneOfStatPercent.end(); ++i)
        {
            if ((*i)->GetModifier()->m_miscvalue & schoolMask)
            {
                // stat used stored in miscValueB for this aura
                Stats usedStat = STAT_SPIRIT;
                DoneAdvertisedBenefit += int32(GetStat(usedStat) * (*i)->GetModifier()->m_amount / 100.0f);
            }
        }
    }
    return DoneAdvertisedBenefit;
}

int32 Unit::SpellBaseDamageBonusTaken(SpellSchoolMask schoolMask)
{
    int32 TakenAdvertisedBenefit = 0;

    // ..taken
    AuraList const& mDamageTaken = GetAurasByType(SPELL_AURA_MOD_DAMAGE_TAKEN);
    for (AuraList::const_iterator i = mDamageTaken.begin(); i != mDamageTaken.end(); ++i)
    {
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) != 0)
            TakenAdvertisedBenefit += (*i)->GetModifier()->m_amount;
    }

    return TakenAdvertisedBenefit;
}

bool Unit::IsSpellCrit(Unit *pVictim, SpellEntry const *spellProto, SpellSchoolMask schoolMask, WeaponAttackType attackType, Spell* spell)
{
    ASSERT(pVictim);
    // Les mobs ne peuvent pas critiquer avec les sorts. Mais totems et pets peuvent.
    if (GetTypeId() == TYPEID_UNIT && !GetOwnerGuid().IsPlayer())
        return false;

    if (IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_ALWAYS_CRIT))
        return true;

    // not critting spell
    if ((spellProto->AttributesEx2 & SPELL_ATTR_EX2_CANT_CRIT))
        return false;

    float crit_chance = 0.0f;
    // Les potions/pierres de soin peuvent critiquer avec un pourcentage de chance constant
    if (spellProto->SpellFamilyName == SPELLFAMILY_POTION ||
            (spellProto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_HEALTHSTONE>()))
        crit_chance = 10.0f;
    else
    {
        switch (spellProto->DmgClass)
        {
            case SPELL_DAMAGE_CLASS_NONE:
                return false;
            case SPELL_DAMAGE_CLASS_MAGIC:
            {
                if (schoolMask & SPELL_SCHOOL_MASK_NORMAL)
                    crit_chance = 0.0f;
                // For other schools
                else if (GetTypeId() == TYPEID_PLAYER)
                    crit_chance = ((Player*)this)->m_SpellCritPercentage[GetFirstSchoolInMask(schoolMask)];
                else
                {
                    crit_chance = float(m_baseSpellCritChance);
                    crit_chance += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL, schoolMask);
                }
                // taken
                if (!IsPositiveSpell(spellProto->Id))
                {
                     // Modify critical chance by victim SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE
                    crit_chance += pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE, schoolMask);
                }

                // scripted (increase crit chance ... against ... target by x%
                AuraList const& mOverrideClassScript = GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
                for (AuraList::const_iterator i = mOverrideClassScript.begin(); i != mOverrideClassScript.end(); ++i)
                {
                    if (!((*i)->GetSpellProto()->SpellFamilyName == spellProto->SpellFamilyName))
                        continue;
                    switch ((*i)->GetModifier()->m_miscvalue)
                    {
                        // Shatter
                        case 849:
                            if (pVictim->isFrozen()) crit_chance += 10.0f;
                            break;
                        case 910:
                            if (pVictim->isFrozen()) crit_chance += 20.0f;
                            break;
                        case 911:
                            if (pVictim->isFrozen()) crit_chance += 30.0f;
                            break;
                        case 912:
                            if (pVictim->isFrozen()) crit_chance += 40.0f;
                            break;
                        case 913:
                            if (pVictim->isFrozen()) crit_chance += 50.0f;
                            break;
                        default:
                            break;
                    }
                }
                break;
            }
            case SPELL_DAMAGE_CLASS_MELEE:
            case SPELL_DAMAGE_CLASS_RANGED:
            {
                // Joueurs assis = critique obligatoire.
                if (pVictim->GetTypeId() == TYPEID_PLAYER && pVictim->IsSitState())
                    return true;
                crit_chance = GetUnitCriticalChance(attackType, pVictim);
                crit_chance += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL, schoolMask);
                break;
            }
            default:
                return false;
        }
    }
    // percent done
    // only players use intelligence for critical chance computations
    if (Player* modOwner = GetSpellModOwner())
        modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_CRITICAL_CHANCE, crit_chance, spell);

    crit_chance = crit_chance > 0.0f ? crit_chance : 0.0f;

    DEBUG_UNIT(this, DEBUG_SPELL_COMPUTE_RESISTS, "%s [ID:%u] Crit chance %f.", spellProto->SpellName[2], spellProto->Id, crit_chance);

    if ((IsPlayer() && ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)) ||
        (pVictim->IsPlayer() && pVictim->ToPlayer()->HasOption(PLAYER_CHEAT_UNRANDOMIZE)))
        crit_chance = 0;
    if (roll_chance_f(crit_chance))
        return true;
    return false;
}

uint32 Unit::SpellCriticalDamageBonus(SpellEntry const *spellProto, uint32 damage, Unit *pVictim, Spell* spell)
{
    // Calculate critical bonus
    int32 crit_bonus;
    switch (spellProto->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:                      // for melee based spells is 100%
        case SPELL_DAMAGE_CLASS_RANGED:
            crit_bonus = damage;
            break;
        default:
            crit_bonus = damage / 2;                        // for spells is 50%
            break;
    }

    // adds additional damage to crit_bonus (from talents)
    if (Player* modOwner = GetSpellModOwner())
        modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_CRIT_DAMAGE_BONUS, crit_bonus, spell);

    if (!pVictim)
        return damage += crit_bonus;

    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();

    float critPctDamageMod = GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_CRIT_PERCENT_VERSUS, creatureTypeMask);

    damage = (damage + crit_bonus) * critPctDamageMod;

    return damage;
}

uint32 Unit::SpellCriticalHealingBonus(SpellEntry const *spellProto, uint32 damage, Unit *pVictim)
{
    // Calculate critical bonus
    int32 crit_bonus;
    switch (spellProto->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:                      // for melee based spells is 100%
        case SPELL_DAMAGE_CLASS_RANGED:
            // TODO: write here full calculation for melee/ranged spells
            crit_bonus = damage;
            break;
        default:
            crit_bonus = damage / 2;                        // for spells is 50%
            break;
    }

    if (pVictim)
    {
        uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();
        crit_bonus = int32(crit_bonus * GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_CRIT_PERCENT_VERSUS, creatureTypeMask));
    }

    if (crit_bonus > 0)
        damage += crit_bonus;

    return damage;
}

/**
 * Calculates caster part of healing spell bonuses,
 * also includes different bonuses dependent from target auras
 */
uint32 Unit::SpellHealingBonusDone(Unit *pVictim, SpellEntry const *spellProto, int32 healamount, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    // For totems get healing bonus from owner (statue isn't totem in fact)
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem() && ((Totem*)this)->GetTotemType() != TOTEM_STATUE)
        if (Unit* owner = GetOwner())
            return owner->SpellHealingBonusDone(pVictim, spellProto, healamount, damagetype, stack, spell);

    // No heal amount for this class spells
    if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE || spellProto->Custom & SPELL_CUSTOM_FIXED_DAMAGE)
    {
        DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellHealingBonusDone[spell=%u]: has fixed damage (SPELL_DAMAGE_CLASS_NONE)", spellProto->Id);
        return healamount < 0 ? 0 : healamount;
    }
    // Healing Done
    // Done total percent damage auras
    float  DoneTotalMod = 1.0f;
    int32  DoneTotal = 0;

    // Healing done percent
    AuraList const& mHealingDonePct = GetAurasByType(SPELL_AURA_MOD_HEALING_DONE_PERCENT);
    for (AuraList::const_iterator i = mHealingDonePct.begin(); i != mHealingDonePct.end(); ++i)
        DoneTotalMod *= (100.0f + (*i)->GetModifier()->m_amount) / 100.0f;

    // done scripted mod (take it from owner)
    Unit *owner = GetOwner();
    if (!owner)
        owner = this;
    AuraList const& mOverrideClassScript = owner->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
    for (AuraList::const_iterator i = mOverrideClassScript.begin(); i != mOverrideClassScript.end(); ++i)
    {
        if (!(*i)->isAffectedOnSpell(spellProto))
            continue;
        switch ((*i)->GetModifier()->m_miscvalue)
        {
            case 4415: // Increased Rejuvenation Healing
                DoneTotal += (*i)->GetModifier()->m_amount / 4; // 4 ticks
                break;
            case 3736: // Hateful Totem of the Third Wind / Increased Lesser Healing Wave / Savage Totem of the Third Wind
                DoneTotal += (*i)->GetModifier()->m_amount;
                break;
            default:
                break;
        }
    }

    // Done fixed damage bonus auras
    int32 DoneAdvertisedBenefit  = SpellBaseHealingBonusDone(GetSpellSchoolMask(spellProto));

    // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
    DoneTotal = SpellBonusWithCoeffs(spellProto, DoneTotal, DoneAdvertisedBenefit, 0, damagetype, true, this, spell);

    // use float as more appropriate for negative values and percent applying
    float heal = (healamount + DoneTotal * int32(stack)) * DoneTotalMod;
    // apply spellmod to Done amount
    if (Player* modOwner = GetSpellModOwner())
        modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, heal, spell);

    DEBUG_UNIT(this, DEBUG_SPELLS_DAMAGE, "SpellHealingBonusDone[spell=%u]: (base=%u + %i) * %f. HealingPwr=%i", spellProto->Id, healamount, DoneTotal, DoneTotalMod, DoneAdvertisedBenefit);
    return heal < 0 ? 0 : uint32(heal);
}

/**
 * Calculates target part of healing spell bonuses,
 * will be called on each tick for periodic damage over time auras
 */
uint32 Unit::SpellHealingBonusTaken(Unit *pCaster, SpellEntry const *spellProto, int32 healamount, DamageEffectType damagetype, uint32 stack, Spell* spell)
{
    float  TakenTotalMod = 1.0f;

    // Healing taken percent
    float minval = float(GetMaxNegativeAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (minval)
        TakenTotalMod *= (100.0f + minval) / 100.0f;

    float maxval = float(GetMaxPositiveAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (maxval)
        TakenTotalMod *= (100.0f + maxval) / 100.0f;

    // No heal amount for this class spells
    if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE)
    {
        healamount = int32(healamount * TakenTotalMod);
        return healamount < 0 ? 0 : healamount;
    }

    // Healing Done
    // Done total percent damage auras
    int32  TakenTotal = 0;

    // Taken fixed damage bonus auras
    int32 TakenAdvertisedBenefit = SpellBaseHealingBonusTaken(GetSpellSchoolMask(spellProto));

    // Blessing of Light dummy effects healing taken from Holy Light and Flash of Light
    if (spellProto->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_FLASH_OF_LIGHT1, CF_PALADIN_HOLY_LIGHT2>())
    {
        AuraList const& mDummyAuras = GetAurasByType(SPELL_AURA_DUMMY);
        for (AuraList::const_iterator i = mDummyAuras.begin(); i != mDummyAuras.end(); ++i)
        {
            if ((*i)->GetSpellProto()->IsFitToFamilyMask<CF_PALADIN_BLESSINGS>() && (*i)->GetSpellProto()->SpellVisual == 300)
            {
                // Holy Light
                if (spellProto->IsFitToFamilyMask<CF_PALADIN_HOLY_LIGHT2>() && (*i)->GetEffIndex() == EFFECT_INDEX_0)
                    TakenTotal += (*i)->GetModifier()->m_amount;
                // Flash of Light
                else if (spellProto->IsFitToFamilyMask<CF_PALADIN_FLASH_OF_LIGHT1>() && (*i)->GetEffIndex() == EFFECT_INDEX_1)
                    TakenTotal += (*i)->GetModifier()->m_amount;
            }
        }
    }
    // apply benefit affected by spell power implicit coeffs and spell level penalties
    TakenTotal = SpellBonusWithCoeffs(spellProto, TakenTotal, TakenAdvertisedBenefit, 0, damagetype, false, pCaster, spell);

    // Taken mods
    // Healing Wave cast
    if (spellProto->IsFitToFamily<SPELLFAMILY_SHAMAN, CF_SHAMAN_HEALING_WAVE>())
    {
        // Search for Healing Way on Victim
        Unit::AuraList const& auraDummy = GetAurasByType(SPELL_AURA_DUMMY);
        for (Unit::AuraList::const_iterator itr = auraDummy.begin(); itr != auraDummy.end(); ++itr)
            if ((*itr)->GetId() == 29203)
                TakenTotalMod *= ((*itr)->GetModifier()->m_amount + 100.0f) / 100.0f;
    }


    // use float as more appropriate for negative values and percent applying
    float heal = (healamount + TakenTotal * int32(stack)) * TakenTotalMod;

    return heal < 0 ? 0 : uint32(heal);
}

int32 Unit::SpellBaseHealingBonusDone(SpellSchoolMask schoolMask)
{
    int32 AdvertisedBenefit = 0;

    AuraList const& mHealingDone = GetAurasByType(SPELL_AURA_MOD_HEALING_DONE);
    for (AuraList::const_iterator i = mHealingDone.begin(); i != mHealingDone.end(); ++i)
        if (((*i)->GetModifier()->m_miscvalue & schoolMask) != 0)
            AdvertisedBenefit += (*i)->GetModifier()->m_amount;

    // Healing bonus of spirit, intellect and strength
    if (GetTypeId() == TYPEID_PLAYER)
    {
        // Healing bonus from stats
        AuraList const& mHealingDoneOfStatPercent = GetAurasByType(SPELL_AURA_MOD_SPELL_HEALING_OF_STAT_PERCENT);
        for (AuraList::const_iterator i = mHealingDoneOfStatPercent.begin(); i != mHealingDoneOfStatPercent.end(); ++i)
        {
            // 1.12.* have only 1 stat type support
            Stats usedStat = STAT_SPIRIT;
            AdvertisedBenefit += int32(GetStat(usedStat) * (*i)->GetModifier()->m_amount / 100.0f);
        }
    }
    return AdvertisedBenefit;
}

int32 Unit::SpellBaseHealingBonusTaken(SpellSchoolMask schoolMask)
{
    int32 AdvertisedBenefit = 0;
    AuraList const& mDamageTaken = GetAurasByType(SPELL_AURA_MOD_HEALING);
    for (AuraList::const_iterator i = mDamageTaken.begin(); i != mDamageTaken.end(); ++i)
        if ((*i)->GetModifier()->m_miscvalue & schoolMask)
            AdvertisedBenefit += (*i)->GetModifier()->m_amount;

    return AdvertisedBenefit;
}

bool Unit::IsImmuneToDamage(SpellSchoolMask shoolMask, SpellEntry const* spellInfo)
{
    if (spellInfo && spellInfo->Attributes & SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)
        return false;

    // If m_immuneToDamage type contain magic, IMMUNE damage.
    SpellImmuneList const& damageList = m_spellImmune[IMMUNITY_DAMAGE];
    for (SpellImmuneList::const_iterator itr = damageList.begin(); itr != damageList.end(); ++itr)
        if (itr->type & shoolMask)
            return true;

    if (spellInfo && spellInfo->Attributes & SPELL_ATTR_EX_UNAFFECTED_BY_SCHOOL_IMMUNE)
        return false;

    // If m_immuneToSchool type contain this school type, IMMUNE damage.
    SpellImmuneList const& schoolList = m_spellImmune[IMMUNITY_SCHOOL];
    for (SpellImmuneList::const_iterator itr = schoolList.begin(); itr != schoolList.end(); ++itr)
        if (itr->type & shoolMask)
            return true;

    return false;
}

bool Unit::IsImmuneToSpell(SpellEntry const *spellInfo, bool /*castOnSelf*/)
{
    if (!spellInfo)
        return false;

    //TODO add spellEffect immunity checks!, player with flag in bg is immune to immunity buffs from other friendly players!
    //SpellImmuneList const& dispelList = m_spellImmune[IMMUNITY_EFFECT];

    SpellImmuneList const& dispelList = m_spellImmune[IMMUNITY_DISPEL];
    for (SpellImmuneList::const_iterator itr = dispelList.begin(); itr != dispelList.end(); ++itr)
        if (itr->type == spellInfo->Dispel)
            return true;

    if ( !(spellInfo->Attributes & SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)            // ignore invulnerability
      && !(spellInfo->AttributesEx & SPELL_ATTR_EX_UNAFFECTED_BY_SCHOOL_IMMUNE)         // unaffected by school immunity
      && !(spellInfo->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY))           // can remove immune (by dispell or immune it)
    {
        SpellImmuneList const& schoolList = m_spellImmune[IMMUNITY_SCHOOL];
        for (SpellImmuneList::const_iterator itr = schoolList.begin(); itr != schoolList.end(); ++itr)
            if (!(IsPositiveSpell(itr->spellId) && IsPositiveSpell(spellInfo->Id)) &&
                    (itr->type & GetSpellSchoolMask(spellInfo)))
                return true;
    }

    if (uint32 mechanic = spellInfo->Mechanic)
    {
        SpellImmuneList const& mechanicList = m_spellImmune[IMMUNITY_MECHANIC];
        for (SpellImmuneList::const_iterator itr = mechanicList.begin(); itr != mechanicList.end(); ++itr)
        {
            if (itr->type == mechanic)
            {
                // always remove Fear Ward on fear immunity event, even if the unit has another fear immunity aura like Berserker Rage
                if (mechanic == MECHANIC_FEAR)
                    RemoveAurasDueToSpell(6346);
                return true;
            }
        }

        AuraList const& immuneAuraApply = GetAurasByType(SPELL_AURA_MECHANIC_IMMUNITY_MASK);
        for (AuraList::const_iterator iter = immuneAuraApply.begin(); iter != immuneAuraApply.end(); ++iter)
            if ((*iter)->GetModifier()->m_miscvalue & (1 << (mechanic - 1)))
                return true;
    }

    return false;
}

bool Unit::IsImmuneToSpellEffect(SpellEntry const* spellInfo, SpellEffectIndex index, bool /*castOnSelf*/) const
{
    //If m_immuneToEffect type contain this effect type, IMMUNE effect.
    uint32 effect = spellInfo->Effect[index];
    SpellImmuneList const& effectList = m_spellImmune[IMMUNITY_EFFECT];
    for (SpellImmuneList::const_iterator itr = effectList.begin(); itr != effectList.end(); ++itr)
        if (itr->type == effect)
            return true;

    if (uint32 mechanic = spellInfo->EffectMechanic[index])
    {
        SpellImmuneList const& mechanicList = m_spellImmune[IMMUNITY_MECHANIC];
        for (SpellImmuneList::const_iterator itr = mechanicList.begin(); itr != mechanicList.end(); ++itr)
            if (itr->type == spellInfo->EffectMechanic[index])
                return true;

        AuraList const& immuneAuraApply = GetAurasByType(SPELL_AURA_MECHANIC_IMMUNITY_MASK);
        for (AuraList::const_iterator iter = immuneAuraApply.begin(); iter != immuneAuraApply.end(); ++iter)
            if ((*iter)->GetModifier()->m_miscvalue & (1 << (mechanic - 1)))
                return true;
    }

    uint32 aura = spellInfo->EffectApplyAuraName[index];
    if (aura)
    {
        SpellImmuneList const& list = m_spellImmune[IMMUNITY_STATE];
        for (SpellImmuneList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
            if (itr->type == aura)
                return true;
    }
    return false;
}

/**
 * Calculates caster part of melee damage bonuses,
 * also includes different bonuses dependent from target auras
 */
uint32 Unit::MeleeDamageBonusDone(Unit* pVictim, uint32 pdamage, WeaponAttackType attType, SpellEntry const* spellProto, DamageEffectType damagetype, uint32 stack, Spell* spell, bool flat)
{
    if (!pVictim)
        return pdamage;

    if (pdamage == 0)
        return pdamage;

    // differentiate for weapon damage based spells
    bool isWeaponDamageBasedSpell = !(spellProto && (damagetype == DOT || IsSpellHaveEffect(spellProto, SPELL_EFFECT_SCHOOL_DAMAGE)));
    Item*  pWeapon          = GetTypeId() == TYPEID_PLAYER ? ((Player*)this)->GetWeaponForAttack(attType, true, false) : NULL;
    uint32 creatureTypeMask = pVictim->GetCreatureTypeMask();
    uint32 schoolMask       = spellProto ? GetSpellSchoolMask(spellProto) : GetMeleeDamageSchoolMask();

    // FLAT damage bonus auras
    // =======================
    int32 DoneFlat  = 0;
    int32 APbonus   = 0;

    // ..done flat, already included in weapon damage based spells
    if (!isWeaponDamageBasedSpell)
    {
        AuraList const& mModDamageDone = GetAurasByType(SPELL_AURA_MOD_DAMAGE_DONE);
        for (AuraList::const_iterator i = mModDamageDone.begin(); i != mModDamageDone.end(); ++i)
        {
            if ((*i)->GetModifier()->m_miscvalue & schoolMask &&                         // schoolmask has to fit with the intrinsic spell school
                    ((*i)->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() ||    // AND schoolmask has to fit with weapon damage school (essential for non-physical spells)
                     spellProto->DmgClass == SPELL_DAMAGE_CLASS_RANGED) &&               // Some ranged physical attacks use magic damage, ex. Arcane Shot
                    (((*i)->GetSpellProto()->EquippedItemClass == -1) ||                     // general, weapon independent
                     (pWeapon && pWeapon->IsFitToSpellRequirements((*i)->GetSpellProto()))))  // OR used weapon fits aura requirements
                DoneFlat += (*i)->GetModifier()->m_amount;
        }

        // Pets just add their bonus damage to their melee damage
        if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
            DoneFlat += ((Pet*)this)->GetBonusDamage();
    }

    // ..done flat (by creature type mask)
    DoneFlat += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_CREATURE, creatureTypeMask);

    // ..done flat (base at attack power for marked target and base at attack power for creature type)
    if (attType == RANGED_ATTACK)
    {
        APbonus += pVictim->GetTotalAuraModifier(SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS);
        APbonus += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_RANGED_ATTACK_POWER_VERSUS, creatureTypeMask);
    }
    else
    {
        APbonus += pVictim->GetTotalAuraModifier(SPELL_AURA_MELEE_ATTACK_POWER_ATTACKER_BONUS);
        APbonus += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_MELEE_ATTACK_POWER_VERSUS, creatureTypeMask);
    }

    // PERCENT damage auras
    // ====================
    float DonePercent   = 1.0f;

    // ..done pct, already included in weapon damage based spells
    if (!isWeaponDamageBasedSpell)
    {
        AuraList const& mModDamagePercentDone = GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
        for (AuraList::const_iterator i = mModDamagePercentDone.begin(); i != mModDamagePercentDone.end(); ++i)
        {
            if ((*i)->GetModifier()->m_miscvalue & schoolMask &&                         // schoolmask has to fit with the intrinsic spell school
                    (*i)->GetModifier()->m_miscvalue & GetMeleeDamageSchoolMask() &&         // AND schoolmask has to fit with weapon damage school (essential for non-physical spells)
                    (((*i)->GetSpellProto()->EquippedItemClass == -1) ||                     // general, weapon independent
                     (pWeapon && pWeapon->IsFitToSpellRequirements((*i)->GetSpellProto()))))  // OR used weapon fits aura requirements
                DonePercent *= ((*i)->GetModifier()->m_amount + 100.0f) / 100.0f;
        }

        if (attType == OFF_ATTACK)
            DonePercent *= GetModifierValue(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT);                    // no school check required
    }

    // Pet happiness increases damage of Hunter pet melee spells
    if (IsPet() && ((Pet*)this)->getPetType() == HUNTER_PET)
    {
        if (Pet* pet = ((Pet*)this))
        {
            switch (pet->GetHappinessState())
            {
                case HAPPY:     DonePercent *= 1.25; break;
                case CONTENT:   break;
                case UNHAPPY:   DonePercent *= 0.75; break;
            }
        }
    }

    // ..done pct (by creature type mask)
    DonePercent *= GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_DONE_VERSUS, creatureTypeMask);

    // special dummys/class scripts and other effects
    // =============================================
    Unit *owner = GetOwner();
    if (!owner)
        owner = this;

    // final calculation
    // =================

    float DoneTotal = 0.0f;

    // scaling of non weapon based spells
    if (!isWeaponDamageBasedSpell)
    {
        // apply ap bonus and benefit affected by spell power implicit coeffs and spell level penalties
        DoneTotal = SpellBonusWithCoeffs(spellProto, DoneTotal, DoneFlat, APbonus, damagetype, true, this, spell);
    }
    // weapon damage based spells
    else if (APbonus || DoneFlat)
    {
        bool normalized = spellProto ? IsSpellHaveEffect(spellProto, SPELL_EFFECT_NORMALIZED_WEAPON_DMG) : false;
        DoneTotal += int32(APbonus / 14.0f * GetAPMultiplier(attType, normalized));

        // for weapon damage based spells we still have to apply damage done percent mods
        // (that are already included into pdamage) to not-yet included DoneFlat
        // e.g. from doneVersusCreature, apBonusVs...
        UnitMods unitMod;
        switch (attType)
        {
            default:
            case BASE_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_MAINHAND;
                break;
            case OFF_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_OFFHAND;
                break;
            case RANGED_ATTACK:
                unitMod = UNIT_MOD_DAMAGE_RANGED;
                break;
        }

        DoneTotal += DoneFlat;

        DoneTotal *= GetModifierValue(unitMod, TOTAL_PCT);
    }

    if (!flat)
        DoneTotal = 0.0f;

    float tmpDamage = float(int32(pdamage) + DoneTotal * int32(stack)) * DonePercent;

    // apply spellmod to Done damage
    if (spellProto)
    {
        if (Player* modOwner = GetSpellModOwner())
            modOwner->ApplySpellMod(spellProto->Id, damagetype == DOT ? SPELLMOD_DOT : SPELLMOD_DAMAGE, tmpDamage, spell);
    }

    // bonus result can be negative
    return tmpDamage > 0 ? uint32(tmpDamage) : 0;
}

/**
 * Calculates target part of melee damage bonuses,
 * will be called on each tick for periodic damage over time auras
 */
uint32 Unit::MeleeDamageBonusTaken(Unit* pCaster, uint32 pdamage, WeaponAttackType attType, SpellEntry const* spellProto, DamageEffectType damagetype, uint32 stack, Spell* spell, bool flat)
{
    if (!pCaster)
        return pdamage;

    if (pdamage == 0)
        return pdamage;

    // Exception for Seal of Command and Seal of Righteousness
    // already with coeff!
    if (spellProto && (spellProto->Id == 20424 ||
        (spellProto->SpellFamilyName == SPELLFAMILY_PALADIN && spellProto->DmgClass == SPELL_DAMAGE_CLASS_MELEE))) // SoR is the only pala spell with melee dmg class
        return pdamage;

    // differentiate for weapon damage based spells
    bool isWeaponDamageBasedSpell = !(spellProto && (damagetype == DOT || IsSpellHaveEffect(spellProto, SPELL_EFFECT_SCHOOL_DAMAGE)));
    uint32 schoolMask       = spellProto ? GetSpellSchoolMask(spellProto) : uint32(pCaster->GetMeleeDamageSchoolMask());

    // FLAT damage bonus auras
    // =======================
    int32 TakenFlat = 0;

    // ..taken flat (base at attack power for marked target and base at attack power for creature type)
    if (attType == RANGED_ATTACK)
        TakenFlat += GetTotalAuraModifier(SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN);
    else
        TakenFlat += GetTotalAuraModifier(SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN);

    // ..taken flat (by school mask)
    TakenFlat += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_TAKEN, schoolMask);

    // PERCENT damage auras
    // ====================
    float TakenPercent  = 1.0f;

    // ..taken pct (by school mask)
    TakenPercent *= GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, schoolMask);

    // ..taken pct (melee/ranged)
    if (attType == RANGED_ATTACK)
        TakenPercent *= GetTotalAuraMultiplier(SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN_PCT);
    else
        TakenPercent *= GetTotalAuraMultiplier(SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN_PCT);

    // final calculation
    // =================

    // scaling of non weapon based spells
    if (!isWeaponDamageBasedSpell)
    {
        // apply benefit affected by spell power implicit coeffs and spell level penalties
        TakenFlat = SpellBonusWithCoeffs(spellProto, 0, TakenFlat, 0, damagetype, false, pCaster, spell);
    }

    if (!flat)
        TakenFlat = 0.0f;

    float tmpDamage = float(int32(pdamage) + TakenFlat * int32(stack)) * TakenPercent;

    // bonus result can be negative
    return tmpDamage > 0 ? uint32(tmpDamage) : 0;
}

void Unit::ApplySpellImmune(uint32 spellId, uint32 op, uint32 type, bool apply)
{
    if (apply)
    {
        for (SpellImmuneList::iterator itr = m_spellImmune[op].begin(), next; itr != m_spellImmune[op].end(); itr = next)
        {
            next = itr;
            ++next;
            if (itr->type == type)
            {
                m_spellImmune[op].erase(itr);
                next = m_spellImmune[op].begin();
            }
        }
        SpellImmune Immune;
        Immune.spellId = spellId;
        Immune.type = type;
        m_spellImmune[op].push_back(Immune);
    }
    else
    {
        for (SpellImmuneList::iterator itr = m_spellImmune[op].begin(); itr != m_spellImmune[op].end(); ++itr)
        {
            if (itr->spellId == spellId)
            {
                m_spellImmune[op].erase(itr);
                break;
            }
        }
    }
}

void Unit::ApplySpellDispelImmunity(const SpellEntry * spellProto, DispelType type, bool apply)
{
    ApplySpellImmune(spellProto->Id, IMMUNITY_DISPEL, type, apply);

    if (apply && spellProto->AttributesEx & SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY)
        RemoveAurasWithDispelType(type);
}

float Unit::GetPPMProcChance(uint32 WeaponSpeed, float PPM) const
{
    // proc per minute chance calculation
    if (PPM <= 0.0f)
        return 0.0f;
    return WeaponSpeed * PPM / 600.0f;                      // result is chance in percents (probability = Speed_in_sec * (PPM / 60))
}

void Unit::Mount(uint32 mount, uint32 spellId)
{
    if (!mount)
        return;

    if (SpellAuraHolder *holder = GetSpellAuraHolder(29519))
    {
        if (((Player*)this)->GetZoneId() == 1377)
        {
            // OutdoorPVP Silithus : Perte du buff silithyste
            if (ZoneScript* pScript = ((Player*)this)->GetZoneScript())
                pScript->HandleDropFlag(((Player*)this), 29519);
        }
    }

    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_MOUNTING);
    SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, mount);
}

void Unit::Unmount(bool from_aura)
{
    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_NOT_MOUNTED);

    SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 0);
}

bool Unit::IsInDisallowedMountForm() const
{
    ShapeshiftForm form = GetShapeshiftForm();
    if (form != FORM_NONE && form != FORM_BATTLESTANCE && form != FORM_BERSERKERSTANCE && form != FORM_DEFENSIVESTANCE && form != FORM_SHADOW && form != FORM_STEALTH)
        return true;

    if (GetDisplayId() == GetNativeDisplayId())
        return false;

    CreatureDisplayInfoEntry const* display = sCreatureDisplayInfoStore.LookupEntry(GetDisplayId());
    if (!display)
        return true;

    CreatureDisplayInfoExtraEntry const* displayExtra = sCreatureDisplayInfoExtraStore.LookupEntry(display->ExtendedDisplayInfoID);
    if (!displayExtra)
        return true;

    CreatureModelDataEntry const* model = sCreatureModelDataStore.LookupEntry(display->ModelId);
    ChrRacesEntry const* race = sChrRacesStore.LookupEntry(displayExtra->Race);

    if (model && !(model->flags & 0x80))
        if (race && !(race->Flags & 0x4))
            return true;

    return false;
}

void Unit::SetInCombatWith(Unit* enemy)
{
    ASSERT(enemy);
    Unit* eOwner = enemy->GetCharmerOrOwnerOrSelf();
    ASSERT(eOwner);
    if (eOwner->IsPvP())
    {
        SetInCombatState(true, enemy);
        return;
    }

    //check for duel
    if (eOwner->GetTypeId() == TYPEID_PLAYER && ((Player*)eOwner)->duel)
    {
        if (Player const* myOwner = GetCharmerOrOwnerPlayerOrPlayerItself())
        {
            if (myOwner->IsInDuelWith((Player const*)eOwner))
            {
                SetInCombatState(true, enemy);
                return;
            }
        }
    }

    SetInCombatState(false, enemy);
}

void Unit::SetInCombatState(bool PvP, Unit* enemy)
{
    // only alive units can be in combat
    if (!isAlive())
        return;

    if (PvP)
        m_CombatTimer = 5500;

    bool wasInCombat = isInCombat();
    bool creatureNotInCombat = GetTypeId() == TYPEID_UNIT && !wasInCombat;

    SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

    if (isCharmed() || (GetTypeId() != TYPEID_PLAYER && ((Creature*)this)->IsPet()))
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);
    // set pet in combat
    if (Pet* pet = GetPet())
        if (!pet->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT))
        {
            pet->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);

            if (IsPlayer() && pet->isAlive() && enemy)
                pet->AI()->OwnerAttacked(enemy);
        }

    // interrupt all delayed non-combat casts
    if (!wasInCombat)
        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
            if (Spell* spell = GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime())
                    if (IsNonCombatSpell(spell->m_spellInfo))
                        InterruptSpell(CurrentSpellTypes(i), false);

    if (creatureNotInCombat)
    {
        auto pCreature = ToCreature();

        pCreature->SetCombatStartPosition(GetPositionX(), GetPositionY(), GetPositionZ());
        // should probably be removed for the attacked (+ it's party/group) only, not global
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);

        OnEnterCombat(enemy, true);

        // Some bosses are set into combat with zone
        if (GetMap()->IsDungeon() && (pCreature->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_AGGRO_ZONE) && enemy && enemy->IsControlledByPlayer())
            pCreature->SetInCombatWithZone();
        if (Spell* spell = m_currentSpells[CURRENT_CHANNELED_SPELL])
            if (spell->getState() == SPELL_STATE_CASTING)
                if (spell->m_spellInfo->ChannelInterruptFlags & CHANNEL_FLAG_ENTER_COMBAT)
                    InterruptSpell(CURRENT_CHANNELED_SPELL);

        if (m_isCreatureLinkingTrigger)
            GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_AGGRO, pCreature, enemy);
    }
}

void Unit::ClearInCombat()
{
    m_CombatTimer = 0;
    RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

    // Player's state will be cleared in Player::UpdateContestedPvP
    if (GetTypeId() != TYPEID_PLAYER)
    {
        if (((Creature*)this)->GetCreatureInfo()->unit_flags & UNIT_FLAG_OOC_NOT_ATTACKABLE)
            SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);

        clearUnitState(UNIT_STAT_ATTACK_PLAYER);
    }

    RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);
}

bool Unit::isTargetableForAttack(bool inverseAlive /*=false*/) const
{
    if (!CanBeDetected())
        return false;

    if (GetTypeId() == TYPEID_PLAYER && (((Player *)this)->isGameMaster() || ((Player*)this)->watching_cinematic_entry != 0))
        return false;

    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE))
        return false;

    // to be removed if unit by any reason enter combat
    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE))
        return false;

    // inversealive is needed for some spells which need to be casted at dead targets (aoe)
    if (isAlive() == inverseAlive)
        return false;

    return IsInWorld() && !hasUnitState(UNIT_STAT_DIED) && !IsTaxiFlying();
}

bool Unit::IsValidAttackTarget(Unit const* target) const
{
    return _IsValidAttackTarget(target, nullptr);
}

// function based on function Unit::CanAttack from 13850 client
bool Unit::_IsValidAttackTarget(Unit const* target, SpellEntry const* bySpell, WorldObject const* obj) const
{
    ASSERT(target);
    // can't attack self
    if (this == target)
        return false;

    if (FindMap() != target->FindMap())
        return false;

    // can't attack unattackable units or GMs
    if (target->GetTypeId() == TYPEID_PLAYER && target->ToPlayer()->isGameMaster())
        return false;

    // check flags
    if (target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_TAXI_FLIGHT | UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_UNK_16))
        return false;

    // CvC case - can attack each other only when one of them is hostile
    if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE) && !target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE))
        return GetReactionTo(target) <= REP_HOSTILE || target->GetReactionTo(this) <= REP_HOSTILE;

    // PvP, PvC, CvP case
    // can't attack friendly targets
    if (GetReactionTo(target) > REP_NEUTRAL
            || target->GetReactionTo(this) > REP_NEUTRAL)
        return false;

    Player const* playerAffectingAttacker = HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE) ? GetAffectingPlayer() : NULL;
    Player const* playerAffectingTarget = target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE) ? target->GetAffectingPlayer() : NULL;

    // Not all neutral creatures can be attacked
    if (GetReactionTo(target) == REP_NEUTRAL &&
            target->GetReactionTo(this) == REP_NEUTRAL)
    {
        if (!(playerAffectingTarget && playerAffectingAttacker) &&
                !(!playerAffectingTarget && !playerAffectingAttacker))
        {
            Player const* player = playerAffectingTarget ? playerAffectingTarget : playerAffectingAttacker;
            Unit const* creature = playerAffectingTarget ? this : target;

            if (FactionTemplateEntry const* factionTemplate = creature->getFactionTemplateEntry())
            {
                if (!(player->GetReputationMgr().GetForcedRankIfAny(factionTemplate)))
                    if (FactionEntry const* factionEntry = sObjectMgr.GetFactionEntry(factionTemplate->faction))
                        if (FactionState const* repState = player->GetReputationMgr().GetState(factionEntry))
                            if (!(repState->Flags & FACTION_FLAG_AT_WAR))
                                return false;

            }
        }
    }

    // PvP checks
    if (playerAffectingAttacker && playerAffectingTarget)
    {
        if (playerAffectingAttacker->duel && playerAffectingAttacker->duel->opponent == playerAffectingTarget && playerAffectingAttacker->duel->startTime != 0)
            return true;

        if (playerAffectingTarget->IsPvP())
            return true;

        if (playerAffectingAttacker->GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_FFA_PVP
                && playerAffectingTarget->GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_FFA_PVP)
            return true;

        return (playerAffectingAttacker->GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_UNK1)
               || (playerAffectingTarget->GetByteValue(UNIT_FIELD_BYTES_2, 1) & UNIT_BYTE2_FLAG_UNK1);
    }
    return true;
}

int32 Unit::ModifyHealth(int32 dVal)
{
    int32 gain = 0;

    if (dVal == 0)
        return 0;

    int32 curHealth = (int32)GetHealth();

    int32 val = dVal + curHealth;
    if (val <= 0)
    {
        SetHealth(0);
        return -curHealth;
    }

    int32 maxHealth = (int32)GetMaxHealth();

    if (val < maxHealth)
    {
        SetHealth(val);
        gain = val - curHealth;
    }
    else if (curHealth != maxHealth)
    {
        SetHealth(maxHealth);
        gain = maxHealth - curHealth;
    }

    return gain;
}

int32 Unit::ModifyPower(Powers power, int32 dVal)
{
    int32 gain = 0;

    if (dVal == 0)
        return 0;

    int32 curPower = (int32)GetPower(power);

    int32 val = dVal + curPower;
    if (val <= 0)
    {
        SetPower(power, 0);
        return -curPower;
    }

    int32 maxPower = (int32)GetMaxPower(power);

    if (val < maxPower)
    {
        SetPower(power, val);
        gain = val - curPower;
    }
    else if (curPower != maxPower)
    {
        SetPower(power, maxPower);
        gain = maxPower - curPower;
    }

    return gain;
}

bool Unit::isVisibleForOrDetect(Unit const* u, WorldObject const* viewPoint, bool detect, bool /*inVisibleList*/, bool* alert) const
{
    if (!u || !IsInMap(u))
        return false;

    // Always can see self
    if (u == this)
        return true;

    bool at_same_transport = GetTransport() && GetTransport() == u->GetTransport();

    // not in world
    if (!at_same_transport && (!IsInWorld() || !u->IsInWorld()))
        return false;

    // forbidden to seen (at GM respawn command)
    if (m_Visibility == VISIBILITY_RESPAWN)
        return false;

    Map& _map = *u->GetMap();
    bool isTargetPlayer = u->GetTypeId() == TYPEID_PLAYER;
    auto pPlayerTarget = isTargetPlayer ? (Player*)u : nullptr;

    // Grid dead/alive checks
    if (isTargetPlayer)
    {
        // non visible at grid for any stealth state
        if (!IsVisibleInGridForPlayer(pPlayerTarget))
            return false;

        // if player is dead then he can't detect anyone in any cases
        if (!u->isAlive())
            detect = false;
    }
    else
    {
        // all dead creatures/players not visible for any creatures
        if (!u->isAlive() || !isAlive())
            return false;
    }

    // always seen by owner
    if (GetCharmerOrOwnerGuid() == u->GetObjectGuid())
        return true;

    // isInvisibleForAlive() those units can only be seen by dead or if other
    // unit is also invisible for alive.. if an isinvisibleforalive unit dies we
    // should be able to see it too
    if (u->isAlive() && isAlive() && isInvisibleForAlive() != u->isInvisibleForAlive())
        if (!isTargetPlayer || !pPlayerTarget->isGameMaster())
            return false;

    // redundant phasing
    //if (!u->CanSeeInWorld(this))
    //    return false;

    if (Creature* pCreature = (Creature*)ToCreature())
    {
        bool bVisible = false;
        if (pCreature->AI() && pCreature->AI()->IsVisibleFor(u, bVisible))
            return bVisible;
    }

    // Visible units are always visible for all units
    if (m_Visibility == VISIBILITY_ON)
        return true;

    // GMs see any players, not higher GMs and all units
    if (isTargetPlayer && pPlayerTarget->isGameMaster())
    {
        if (GetTypeId() == TYPEID_PLAYER)
            return ToPlayer()->GetGMInvisibilityLevel() <= uint8(pPlayerTarget->GetSession()->GetSecurity());
        return true;
    }

    // non faction visibility non-breakable for non-GMs
    if (m_Visibility == VISIBILITY_OFF)
        return false;

    // raw invisibility
    bool invisible = m_invisibilityMask != 0;

    // Detectable invisibility case
    if (invisible && (
            // Invisible units are always visible for units under same
            // invisibility type
            (m_invisibilityMask & u->m_invisibilityMask) ||
            // Invisible units are always visible for units that can detect the
            // appropriate invisibility level
            u->canDetectInvisibilityOf(this)))
        invisible = false;

    // special cases for always overwrite invisibility/stealth
    if (invisible || m_Visibility == VISIBILITY_GROUP_STEALTH)
    {
        // non-hostile case
        if (!u->IsHostileTo(this))
        {
            // player see other player with stealth/invisibility only if he in same group or raid or same team (raid/team case dependent from conf setting)
            if (GetTypeId() == TYPEID_PLAYER && isTargetPlayer)
            {
                if (((Player*)this)->IsGroupVisibleFor(pPlayerTarget))
                    return true;

                // else apply same rules as for hostile case (detecting check for stealth)
            }
        }

        // none other cases for detect invisibility, so invisible
        if (invisible)
            return false;

        // else apply stealth detecting check
    }

    // unit got in stealth in this moment and must ignore old detected state
    if (m_Visibility == VISIBILITY_GROUP_NO_DETECT)
        return false;

    // GM invisibility checks early, invisibility if any detectable, so if not stealth then visible
    if (m_Visibility != VISIBILITY_GROUP_STEALTH)
        return true;

    // NOW ONLY STEALTH CASE
    //if in non-detect mode then invisible for unit
    //mobs always detect players (detect == true)... return 'false' for those mobs which have (detect == false)
    //players detect players only in Player::HandleStealthedUnitsDetection()
    // Units detect Units only in Units::HandleStealthedUnitsDetection()
    if (!detect)
        return isTargetPlayer ? pPlayerTarget->IsInVisibleList(this) : false;

    // Special cases
    if (!u->canDetectStealthOf(this, GetDistance(viewPoint), alert))
         return false;

    // Now check if target is visible with LoS
    float ox, oy, oz;
    viewPoint->GetPosition(ox, oy, oz);
    return IsWithinLOS(ox, oy, oz);
}

void Unit::UpdateVisibilityAndView()
{

    static const AuraType auratypes[] = {SPELL_AURA_BIND_SIGHT, SPELL_AURA_FAR_SIGHT, SPELL_AURA_NONE};
    for (AuraType const* type = &auratypes[0]; *type != SPELL_AURA_NONE; ++type)
    {
        AuraList& alist = m_modAuras[*type];
        if (alist.empty())
            continue;

        for (AuraList::iterator it = alist.begin(); it != alist.end();)
        {
            Aura* aura = (*it);
            Unit* owner = aura->GetCaster();

            if (!owner || !isVisibleForOrDetect(owner, this, false))
            {
                alist.erase(it);
                RemoveAura(aura);
                it = alist.begin();
            }
            else
                ++it;
        }
    }

    GetViewPoint().Call_UpdateVisibilityForOwner();
    UpdateObjectVisibility();
    ScheduleAINotify(0);
    GetViewPoint().Event_ViewPointVisibilityChanged();
}

void Unit::SetVisibility(UnitVisibility x)
{
    m_Visibility = x;

    if (IsInWorld())
        UpdateVisibilityAndView();
}

bool Unit::canDetectInvisibilityOf(Unit const* u) const
{
    if (const Creature* worldBoss = ToCreature())
        if (worldBoss->IsWorldBoss())
            return true;

    if (uint32 mask = (m_detectInvisibilityMask & u->m_invisibilityMask))
    {
        for (int32 i = 0; i < 32; ++i)
        {
            if (((1 << i) & mask) == 0)
                continue;

            // find invisibility level
            int32 invLevel = 0;
            Unit::AuraList const& iAuras = u->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY);
            for (Unit::AuraList::const_iterator itr = iAuras.begin(); itr != iAuras.end(); ++itr)
                if ((*itr)->GetModifier()->m_miscvalue == i && invLevel < (*itr)->GetModifier()->m_amount)
                    invLevel = (*itr)->GetModifier()->m_amount;

            // find invisibility detect level
            int32 detectLevel = 0;
            Unit::AuraList const& dAuras = GetAurasByType(SPELL_AURA_MOD_INVISIBILITY_DETECTION);
            for (Unit::AuraList::const_iterator itr = dAuras.begin(); itr != dAuras.end(); ++itr)
                if ((*itr)->GetModifier()->m_miscvalue == i && detectLevel < (*itr)->GetModifier()->m_amount)
                    detectLevel = (*itr)->GetModifier()->m_amount;

            if (i == 6 && GetTypeId() == TYPEID_PLAYER)     // special drunk detection case
                detectLevel = ((Player*)this)->GetDrunkValue();

            if (invLevel <= detectLevel)
                return true;
        }
    }

    return false;
}

bool Unit::canDetectStealthOf(Unit const* target, float distance, bool *alert) const
{
    if (hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return false;
    if (distance < 0.388f) //collision
        return true;

    // Hunter mark functionality
    AuraList const& auras = target->GetAurasByType(SPELL_AURA_MOD_STALKED);
    for (AuraList::const_iterator iter = auras.begin(); iter != auras.end(); ++iter)
        if ((*iter)->GetCasterGuid() == GetObjectGuid())
            return true;

    // set max distance
    float MaxStealthDetectRange = sWorld.getConfig(CONFIG_FLOAT_MAX_PLAYERS_STEALTH_DETECT_RANGE);
    float visibleDistance = IsPlayer() ? MaxStealthDetectRange : ((Creature*)this)->GetAttackDistance(target);

    //Always invisible from back (when stealth detection is on), also filter max distance cases
    bool isInFront = distance < visibleDistance && HasInArc(M_PI_F, target);
    if (!isInFront)
        return false;

    visibleDistance = 10.5f - target->GetTotalAuraModifier(SPELL_AURA_MOD_STEALTH) / 100.0f;

    //Visible distance is modified by
    //-Level Diff (every level diff = 1.0f in visible distance)
    int32 level_diff = int32(GetLevelForTarget(target)) - int32(target->GetLevelForTarget(this));
    if (abs(level_diff) > 3)
        visibleDistance += level_diff;
    else
        visibleDistance += 0.5f * level_diff;

    //This allows to check talent tree and will add addition stealth dependent on used points)
    int32 stealthMod = target->GetTotalAuraModifier(SPELL_AURA_MOD_STEALTH_LEVEL);
    if (stealthMod < 0)
        stealthMod = 0;

    //-Stealth Mod(positive like Master of Deception) and Stealth Detection(negative like paranoia)
    //based on wowwiki every 5 mod we have 1 more level diff in calculation
    visibleDistance += (int32(GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_STEALTH_DETECT, 0)) - stealthMod) / 5.0f;
    visibleDistance = visibleDistance > MaxStealthDetectRange ? MaxStealthDetectRange : visibleDistance;

    // recheck new distance
    if (visibleDistance <= 0 || distance > visibleDistance)
    {
        if (alert && distance < 15.0f /*TODO: add MAX ALERT DISTANCE config*/)
        {
            visibleDistance = visibleDistance * 1.08f + 1.5f;
            *alert = distance < visibleDistance;
        }
        return false;
    }

    return true;
}

void Unit::UpdateSpeed(UnitMoveType mtype, bool forced, float ratio)
{
    // not in combat pet have same speed as owner
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet() && hasUnitState(UNIT_STAT_FOLLOW) && !isInCombat())
    {
        if (Unit* owner = GetOwner())
        {
            switch(mtype)
            {
                case MOVE_RUN:
                case MOVE_WALK:
                case MOVE_SWIM:
                    SetSpeedRate(mtype, owner->GetSpeedRate(mtype), forced);
                    return;
                default:
                    break;
            }
        }
    }

    int32 main_speed_mod  = 0;
    float stack_bonus     = 1.0f;
    float non_stack_bonus = 1.0f;

    switch (mtype)
    {
        case MOVE_WALK:
            break;
        case MOVE_RUN:
        {
            if (IsMounted()) // Use on mount auras
            {
                main_speed_mod  = GetMaxPositiveAuraModifier(SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED);
                stack_bonus     = GetTotalAuraMultiplier(SPELL_AURA_MOD_MOUNTED_SPEED_ALWAYS);
                non_stack_bonus = (100.0f + GetMaxPositiveAuraModifier(SPELL_AURA_MOD_MOUNTED_SPEED_NOT_STACK)) / 100.0f;
            }
            else
            {
                main_speed_mod  = GetMaxPositiveAuraModifier(SPELL_AURA_MOD_INCREASE_SPEED);
                stack_bonus     = GetTotalAuraMultiplier(SPELL_AURA_MOD_SPEED_ALWAYS);
                non_stack_bonus = (100.0f + GetMaxPositiveAuraModifier(SPELL_AURA_MOD_SPEED_NOT_STACK)) / 100.0f;
            }
            break;
        }
        case MOVE_RUN_BACK:
            return;
        case MOVE_SWIM:
        {
            main_speed_mod  = GetMaxPositiveAuraModifier(SPELL_AURA_MOD_INCREASE_SWIM_SPEED);
            break;
        }
        case MOVE_SWIM_BACK:
            return;
        default:
            sLog.outError("Unit::UpdateSpeed: Unsupported move type (%d)", mtype);
            return;
    }

    float bonus = non_stack_bonus > stack_bonus ? non_stack_bonus : stack_bonus;
    // now we ready for speed calculation
    float speed  = main_speed_mod ? bonus * (100.0f + main_speed_mod) / 100.0f : bonus;

    switch (mtype)
    {
        case MOVE_RUN:
        case MOVE_SWIM:
        {
            // Normalize speed by 191 aura SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED if need
            // TODO: possible affect only on MOVE_RUN
            if (int32 normalization = GetMaxPositiveAuraModifier(SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED))
            {
                // Use speed from aura
                float max_speed = normalization / baseMoveSpeed[mtype];
                if (speed > max_speed)
                    speed = max_speed;
            }
            break;
        }
        default:
            break;
    }

    // for creature case, we check explicit if mob searched for assistance
    if (GetTypeId() == TYPEID_UNIT)
    {
        if (((Creature*)this)->HasSearchedAssistance())
            speed *= 0.66f;                                 // best guessed value, so this will be 33% reduction. Based off initial speed, mob can then "run", "walk fast" or "walk".
    }
    // for player case, we look for some custom rates
    else
    {
        if (getDeathState() == CORPSE)
            speed *= sWorld.getConfig(((Player*)this)->InBattleGround() ? CONFIG_FLOAT_GHOST_RUN_SPEED_BG : CONFIG_FLOAT_GHOST_RUN_SPEED_WORLD);
    }

    // Apply strongest slow aura mod to speed
    int32 slow = GetMaxNegativeAuraModifier(SPELL_AURA_MOD_DECREASE_SPEED);
    if (slow)
        speed *= (100.0f + slow) / 100.0f;

    if (GetTypeId() == TYPEID_UNIT)
    {
        // Before patch 1.9 pets should retain their wild speed, after that they are normalised
        Creature* pCreature = (Creature*)this;
        if (!(pCreature->IsPet() && pCreature->GetOwnerGuid().IsPlayer()) || (sWorld.GetWowPatch() < WOW_PATCH_109))
        {
            switch (mtype)
            {
                case MOVE_RUN:
                    speed *= ((Creature*)this)->GetCreatureInfo()->speed_run;
                    break;
                case MOVE_WALK:
                    speed *= ((Creature*)this)->GetCreatureInfo()->speed_walk;
                    break;
                default:
                    break;
            }
        }
        else
            speed *= 1.14286f;  // normalized player pet runspeed
    }

    SetSpeedRate(mtype, speed * ratio, forced);
}

float Unit::GetSpeed(UnitMoveType mtype) const
{
    return m_speed_rate[mtype] * baseMoveSpeed[mtype];
}

float Unit::GetXZFlagBasedSpeed(const Unit *unit) const
{
    if (!unit->HasUnitMovementFlag(MOVEFLAG_MASK_XZ))
        return 0.0f;

    if (unit->IsSwimming())
    {
        if (unit->HasUnitMovementFlag(MOVEFLAG_BACKWARD))
            return unit->GetSpeed(MOVE_SWIM_BACK);

        return unit->GetSpeed(MOVE_SWIM);
    }

    if (unit->IsWalking())
    {
        // Seems to always be same speed forward and backward when walking
        return unit->GetSpeed(MOVE_WALK);
    }

    // Presumably only running left when IsMoving is true
    if (unit->HasUnitMovementFlag(MOVEFLAG_BACKWARD))
        return unit->GetSpeed(MOVE_RUN_BACK);

    return unit->GetSpeed(MOVE_RUN);
}

struct SetSpeedRateHelper
{
    explicit SetSpeedRateHelper(UnitMoveType _mtype, bool _forced) : mtype(_mtype), forced(_forced) {}
    void operator()(Unit* unit) const
    {
        unit->UpdateSpeed(mtype, forced);
    }
    UnitMoveType mtype;
    bool forced;
};

void Unit::SetSpeedRate(UnitMoveType mtype, float rate, bool forced)
{
    if (rate <= 0)
        rate = 1.0f;

    // Update speed only on change
    if (m_speed_rate[mtype] != rate)
    {
        m_speed_rate[mtype] = rate;

        const uint16 SetSpeed2Opc_table[MAX_MOVE_TYPE][2] =
        {
            {MSG_MOVE_SET_WALK_SPEED,       SMSG_FORCE_WALK_SPEED_CHANGE},
            {MSG_MOVE_SET_RUN_SPEED,        SMSG_FORCE_RUN_SPEED_CHANGE},
            {MSG_MOVE_SET_RUN_BACK_SPEED,   SMSG_FORCE_RUN_BACK_SPEED_CHANGE},
            {MSG_MOVE_SET_SWIM_SPEED,       SMSG_FORCE_SWIM_SPEED_CHANGE},
            {MSG_MOVE_SET_SWIM_BACK_SPEED,  SMSG_FORCE_SWIM_BACK_SPEED_CHANGE},
            {MSG_MOVE_SET_TURN_RATE,        SMSG_FORCE_TURN_RATE_CHANGE},
        };

        if (forced)
        {
            if (Player* me = GetAffectingPlayer())
            {
                WorldPacket dataForMe(SetSpeed2Opc_table[mtype][1], 18);
                dataForMe << GetPackGUID();
                dataForMe << uint32(0);
                dataForMe << float(GetSpeed(mtype));
                me->GetSession()->SendPacket(&dataForMe);
                me->GetCheatData()->OrderSent(&dataForMe);
                //if (this == me)
                    //if (WardenInterface* warden = me->GetSession()->GetWarden())
                        //warden->SendSpeedChange(mtype, GetSpeed(mtype));
            }
        }


        // TODO: Actually such opcodes should (always?) be packed with SMSG_COMPRESSED_MOVES
        // Nostalrius: (google translated)
        // Unable to send here the package 'MSG_MOVE_SET _ * _ SPEED', because we do not know the flags of movements, and the position dimension client
        // (update every 0.5 sec). If one sends a packet, one leads to a desynchro (in the absence of interpolation of the position)
        // This package will be sent after receiving a packet type 'CMSG_FORCE _ * _ SPEED_CHANGE_ACK' (MovementHandler.cpp)
        //m_updateFlag |= UPDATEFLAG_LIVING; // Mise a jour des mouvements en cours, spline, vitesses, etc ... Inutile ?

        propagateSpeedChange();
    }

    CallForAllControlledUnits(SetSpeedRateHelper(mtype, forced), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM | CONTROLLED_MINIPET);
}

void Unit::SetHover(bool on)
{
    if (on)
        CastSpell(this, 11010, true);
    else
        RemoveAurasDueToSpell(11010);
}

void Unit::SetDeathState(DeathState s)
{
    if (s != ALIVE && s != JUST_ALIVED)
    {
        CombatStop();
        DeleteThreatList();
        ClearComboPointHolders();                           // any combo points pointed to unit lost at it death

        if (IsNonMeleeSpellCasted(false))
            InterruptNonMeleeSpells(false);
    }

    m_deathState = s;
    if (s == JUST_DIED)
    {
        RemoveAllAurasOnDeath();
        UnsummonAllTotems();

        i_motionMaster.Clear(false, true);
        i_motionMaster.MoveIdle();
        StopMoving(true);

        ModifyAuraState(AURA_STATE_HEALTHLESS_20_PERCENT, false);
        // remove aurastates allowing special moves
        ClearAllReactives();
        ClearDiminishings();
    }
    else if (s == JUST_ALIVED || s == ALIVE)
    {
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);  // clear skinnable for creature and player (at battleground)
    }

    if (m_deathState != ALIVE && s == ALIVE)
    {
        //_ApplyAllAuraMods();
    }
}

/*########################################
########                          ########
########       AGGRO SYSTEM       ########
########                          ########
########################################*/

bool Unit::CanHaveThreatList() const
{
    // only creatures can have threat list
    if (GetTypeId() != TYPEID_UNIT)
        return false;

    // only alive units can have threat list
    if (!isAlive())
        return false;

    Creature const* creature = ((Creature const*)this);

    // totems can not have threat list
    if (creature->IsTotem())
        return false;

    // pets can not have a threat list, unless they are controlled by a creature
    if (creature->IsPet() && creature->GetOwnerGuid().IsPlayer())
        return false;

    // charmed units can not have a threat list if charmed by player
    if (creature->GetCharmerGuid().IsPlayer())
        return false;

    if (creature->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_NO_THREAT_LIST)
        return false;

    return true;
}

//======================================================================

float Unit::ApplyTotalThreatModifier(float threat, SpellSchoolMask schoolMask)
{
    if (!HasAuraType(SPELL_AURA_MOD_THREAT))
        return threat;

    if (schoolMask == SPELL_SCHOOL_MASK_NONE)
        return threat;

    SpellSchools school = GetFirstSchoolInMask(schoolMask);

    return threat * m_threatModifier[school];
}

//======================================================================

void Unit::AddThreat(Unit* pVictim, float threat /*= 0.0f*/, bool crit /*= false*/, SpellSchoolMask schoolMask /*= SPELL_SCHOOL_MASK_NONE*/, SpellEntry const *threatSpell /*= NULL*/)
{
    // Only mobs can manage threat lists
    if (CanHaveThreatList())
        m_ThreatManager.addThreat(pVictim, threat, crit, schoolMask, threatSpell, false);
}

//======================================================================

void Unit::DeleteThreatList()
{
    m_ThreatManager.clearReferences();
}

//======================================================================

void Unit::TauntApply(Unit* taunter)
{
    MANGOS_ASSERT(GetTypeId() == TYPEID_UNIT);

    if (!taunter || (taunter->GetTypeId() == TYPEID_PLAYER && ((Player*)taunter)->isGameMaster()))
        return;

    if (!CanHaveThreatList())
        return;

    Unit *target = getVictim();

    if (target && target == taunter)
        return;
    // Nostalrius : Correction bug sheep/fear
    if (!HasAuraType(SPELL_AURA_MOD_FEAR) && !HasAuraType(SPELL_AURA_MOD_CONFUSE))
    {
        SetInFront(taunter);
        OnEnterCombat(taunter, !isInCombat());

        if (((Creature*)this)->AI())
            ((Creature*)this)->AI()->AttackStart(taunter);
    }

    m_ThreatManager.tauntApply(taunter);
}

//======================================================================

void Unit::TauntFadeOut(Unit *taunter)
{
    MANGOS_ASSERT(GetTypeId() == TYPEID_UNIT);

    if (!taunter || (taunter->GetTypeId() == TYPEID_PLAYER && ((Player*)taunter)->isGameMaster()))
        return;

    if (!CanHaveThreatList())
        return;

    Unit *target = getVictim();

    if (!target || target != taunter)
        return;

    if (m_ThreatManager.isThreatListEmpty())
    {
        // Nostalrius - pas d'evade quand on charm quelque chose.
        if (!GetCharmGuid())
            OnLeaveCombat();

        if (m_isCreatureLinkingTrigger)
            GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_EVADE, (Creature*)this);

        return;
    }

    m_ThreatManager.tauntFadeOut(taunter);
    target = m_ThreatManager.getHostileTarget();

    // Nostalrius : Correction bug sheep/fear
    if (target && target != taunter && !HasAuraType(SPELL_AURA_MOD_FEAR) && !HasAuraType(SPELL_AURA_MOD_CONFUSE))
    {
        SetInFront(target);
        OnEnterCombat(target, false);
    }
}

//======================================================================

bool Unit::SelectHostileTarget()
{
    //function provides main threat functionality
    //next-victim-selection algorithm and evade mode are called
    //threat list sorting etc.

    MANGOS_ASSERT(GetTypeId() == TYPEID_UNIT);

    if (!this->isAlive())
        return false;

    //This function only useful once AI has been initialized
    if (!((Creature*)this)->AI())
        return false;

    // Nostalrius: delai de 5 sec avant attaque apres spawn.
    if (ToCreature()->IsTempPacified())
        return false;

    Unit* target = nullptr;

    // First checking if we have some taunt on us
    const AuraList& tauntAuras = GetAurasByType(SPELL_AURA_MOD_TAUNT);
    if (!tauntAuras.empty())
    {
        Unit* caster;

        // The last taunt aura caster is alive an we are happy to attack him
        if ((caster = tauntAuras.back()->GetCaster()) && caster->isAlive() && IsValidAttackTarget(caster))
            return true;
        else if (tauntAuras.size() > 1)
        {
            // We do not have last taunt aura caster but we have more taunt auras,
            // so find first available target

            // Auras are pushed_back, last caster will be on the end
            AuraList::const_iterator aura = --tauntAuras.end();
            do
            {
                --aura;
                if ((caster = (*aura)->GetCaster()) && caster->IsInMap(this) && caster->isTargetableForAttack())
                {
                    target = caster;
                    break;
                }
            }
            while (aura != tauntAuras.begin());
        }
    }

    // No taunt aura or taunt aura caster is dead, standard target selection
    if (!target && !m_ThreatManager.isThreatListEmpty())
        target = m_ThreatManager.getHostileTarget();

    if (target)
    {
        // Nostalrius : Correction bug sheep/fear
        if (!hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED | UNIT_STAT_DIED | UNIT_STAT_CONFUSED | UNIT_STAT_FLEEING) && (!HasAuraType(SPELL_AURA_MOD_FEAR) || HasAuraType(SPELL_AURA_PREVENTS_FLEEING)) && !HasAuraType(SPELL_AURA_MOD_CONFUSE))
        {
            SetInFront(target);
            ((Creature*)this)->AI()->AttackStart(target);
        }
        return true;
    }

    // no target but something prevent go to evade mode // Nostalrius - fix evade quand CM.
    if (!isInCombat() || HasAuraType(SPELL_AURA_MOD_TAUNT) || GetCharmerGuid())
        return false;

    // last case when creature don't must go to evade mode:
    // it in combat but attacker not make any damage and not enter to aggro radius to have record in threat list
    // for example at owner command to pet attack some far away creature
    // Note: creature not have targeted movement generator but have attacker in this case
    if (GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
    {
        for (AttackerSet::const_iterator itr = m_attackers.begin(); itr != m_attackers.end(); ++itr)
        {
            if ((*itr)->IsInMap(this) && (*itr)->isTargetableForAttack())
                return false;
        }
    }

    // enter in evade mode in other case
    OnLeaveCombat();
    
    if (m_isCreatureLinkingTrigger)
        GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_EVADE, (Creature*)this);

    return false;
}

//======================================================================
//======================================================================
//======================================================================

int32 Unit::CalculateSpellDamage(Unit const* target, SpellEntry const* spellProto, SpellEffectIndex effect_index, int32 const* effBasePoints, Spell* spell)
{
    Player* unitPlayer = (GetTypeId() == TYPEID_PLAYER) ? (Player*)this : NULL;

    uint8 comboPoints = unitPlayer ? unitPlayer->GetComboPoints() : 0;

    int32 level = int32(getLevel());
    if (level > (int32)spellProto->maxLevel && spellProto->maxLevel > 0)
        level = (int32)spellProto->maxLevel;
    else if (level < (int32)spellProto->baseLevel)
        level = (int32)spellProto->baseLevel;
    level -= (int32)spellProto->spellLevel;

    int32 baseDice = int32(spellProto->EffectBaseDice[effect_index]);
    float basePointsPerLevel = spellProto->EffectRealPointsPerLevel[effect_index];
    float randomPointsPerLevel = spellProto->EffectDicePerLevel[effect_index];
    int32 basePoints = effBasePoints
                       ? *effBasePoints - baseDice
                       : spellProto->EffectBasePoints[effect_index];

    basePoints += int32(level * basePointsPerLevel);
    int32 randomPoints = int32(spellProto->EffectDieSides[effect_index] + level * randomPointsPerLevel);
    float comboDamage = spellProto->EffectPointsPerComboPoint[effect_index];

    switch (randomPoints)
    {
        case 0:
        case 1:
            basePoints += baseDice;
            break;              // range 1..1
        default:
        {
            // range can have positive (1..rand) and negative (rand..1) values, so order its for irand
            int32 randvalue = baseDice >= randomPoints
                              ? irand(randomPoints, baseDice)
                              : irand(baseDice, randomPoints);

            basePoints += randvalue;
            break;
        }
    }

    int32 value = basePoints;

    // random damage
    if (comboDamage != 0 && unitPlayer && target && (target->GetObjectGuid() == unitPlayer->GetComboTargetGuid()))
        value += (int32)(comboDamage * comboPoints);

    if (Player* modOwner = GetSpellModOwner())
    {
        modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_ALL_EFFECTS, value, spell);

        switch (effect_index)
        {
            case EFFECT_INDEX_0:
                modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_EFFECT1, value, spell);
                break;
            case EFFECT_INDEX_1:
                modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_EFFECT2, value, spell);
                break;
            case EFFECT_INDEX_2:
                modOwner->ApplySpellMod(spellProto->Id, SPELLMOD_EFFECT3, value, spell);
                break;
        }
    }

    if (spellProto->Attributes & SPELL_ATTR_LEVEL_DAMAGE_CALCULATION && spellProto->spellLevel &&
            spellProto->Effect[effect_index] != SPELL_EFFECT_WEAPON_PERCENT_DAMAGE &&
            spellProto->Effect[effect_index] != SPELL_EFFECT_KNOCK_BACK &&
            (spellProto->Effect[effect_index] != SPELL_EFFECT_APPLY_AURA || spellProto->EffectApplyAuraName[effect_index] != SPELL_AURA_MOD_DECREASE_SPEED))
        value = int32(value * 0.25f * exp(getLevel() * (70 - spellProto->spellLevel) / 1000.0f));

    return value;
}

DiminishingLevels Unit::GetDiminishing(DiminishingGroup group)
{
    for (Diminishing::iterator i = m_Diminishing.begin(); i != m_Diminishing.end(); ++i)
    {
        if (i->DRGroup != group)
            continue;

        if (!i->hitCount)
            return DIMINISHING_LEVEL_1;

        if (!i->hitTime)
            return DIMINISHING_LEVEL_1;

        // If last spell was casted more than 15 seconds ago - reset the count.
        if (i->stack == 0 && WorldTimer::getMSTimeDiff(i->hitTime, WorldTimer::getMSTime()) > 15 * IN_MILLISECONDS)
        {
            i->hitCount = DIMINISHING_LEVEL_1;
            return DIMINISHING_LEVEL_1;
        }
        // or else increase the count.
        else
            return DiminishingLevels(i->hitCount);
    }
    return DIMINISHING_LEVEL_1;
}

void Unit::IncrDiminishing(DiminishingGroup group)
{
    // Checking for existing in the table
    for (Diminishing::iterator i = m_Diminishing.begin(); i != m_Diminishing.end(); ++i)
    {
        if (i->DRGroup != group)
            continue;
        if (i->hitCount < DIMINISHING_LEVEL_IMMUNE)
            i->hitCount += 1;
        return;
    }
    m_Diminishing.push_back(DiminishingReturn(group, WorldTimer::getMSTime(), DIMINISHING_LEVEL_2));
}

bool Unit::IsLikePlayer() const
{
    if (IsPlayer())
        return true;
    if (!IsPet())
        return false;
    // Pet creature. Reste a savoir si ce machin appartient a un joueur.
    Pet* pet = ((Pet*)this);
    if (!pet->isControlled())
        return false;
    return pet->GetOwnerGuid().IsPlayer();
}

void Unit::ApplyDiminishingToDuration(DiminishingGroup group, int32 &duration, Unit* caster, DiminishingLevels Level, bool isReflected)
{
    if (duration == -1 || group == DIMINISHING_NONE || (!isReflected && caster->IsFriendlyTo(this)))
        return;

    float mod = 1.0f;

    // Some diminishings applies to mobs too (for example, Stun)
    // Nostalrius: fix DR sur les pets.
    bool pvp = (IsLikePlayer() && caster->IsLikePlayer());
    if ((GetDiminishingReturnsGroupType(group) == DRTYPE_PLAYER && pvp) || GetDiminishingReturnsGroupType(group) == DRTYPE_ALL)
    {
        mod = GetDiminishingRate(Level);
    }

    duration = int32(duration * mod);
}

void Unit::ApplyDiminishingAura(DiminishingGroup group, bool apply)
{
    // Checking for existing in the table
    for (Diminishing::iterator i = m_Diminishing.begin(); i != m_Diminishing.end(); ++i)
    {
        if (i->DRGroup != group)
            continue;

        if (apply)
            i->stack += 1;
        else if (i->stack)
        {
            i->stack -= 1;
            // Remember time after last aura from group removed
            if (i->stack == 0)
                i->hitTime = WorldTimer::getMSTime();
        }
        break;
    }
}

bool Unit::isVisibleForInState(Player const* u, WorldObject const* viewPoint, bool inVisibleList) const
{
    return isVisibleForOrDetect(u, viewPoint, false, inVisibleList);
}

/// returns true if creature can't be seen by alive units
bool Unit::isInvisibleForAlive() const
{
    if (m_AuraFlags & UNIT_AURAFLAG_ALIVE_INVISIBLE)
        return true;
    // TODO: maybe spiritservices also have just an aura
    return isSpiritService();
}

/// returns true if creature can be seen by dead units
bool Unit::isVisibleForDead() const
{
    if (GetTypeId() == TYPEID_UNIT && ToCreature()->GetCreatureInfo()->type_flags & CREATURE_TYPEFLAGS_GHOST_VISIBLE)
        return true;
    return isSpiritService();
}

uint32 Unit::GetCreatureType() const
{
    if (GetTypeId() == TYPEID_PLAYER)
    {
        SpellShapeshiftFormEntry const* ssEntry = sSpellShapeshiftFormStore.LookupEntry(GetShapeshiftForm());
        if (ssEntry && ssEntry->creatureType > 0)
            return ssEntry->creatureType;
        else
            return CREATURE_TYPE_HUMANOID;
    }
    else
        return ((Creature*)this)->GetCreatureInfo()->type;
}

/*#######################################
########                         ########
########       STAT SYSTEM       ########
########                         ########
#######################################*/

bool Unit::HandleStatModifier(UnitMods unitMod, UnitModifierType modifierType, float amount, bool apply)
{
    if (unitMod >= UNIT_MOD_END || modifierType >= MODIFIER_TYPE_END)
    {
        sLog.outError("ERROR in HandleStatModifier(): nonexistent UnitMods or wrong UnitModifierType!");
        return false;
    }

    float val = 1.0f;

    switch (modifierType)
    {
        case BASE_VALUE:
        case TOTAL_VALUE:
            m_auraModifiersGroup[unitMod][modifierType] += apply ? amount : -amount;
            break;
        case BASE_PCT:
        case TOTAL_PCT:
            if (amount <= -100.0f)                          //small hack-fix for -100% modifiers
                amount = -200.0f;

            val = (100.0f + amount) / 100.0f;
            m_auraModifiersGroup[unitMod][modifierType] *= apply ? val : (1.0f / val);
            break;

        default:
            break;
    }

    if (!CanModifyStats())
        return false;

    switch (unitMod)
    {
        case UNIT_MOD_STAT_STRENGTH:
        case UNIT_MOD_STAT_AGILITY:
        case UNIT_MOD_STAT_STAMINA:
        case UNIT_MOD_STAT_INTELLECT:
        case UNIT_MOD_STAT_SPIRIT:
            UpdateStats(GetStatByAuraGroup(unitMod));
            break;

        case UNIT_MOD_ARMOR:
            UpdateArmor();
            break;
        case UNIT_MOD_HEALTH:
            UpdateMaxHealth();
            break;

        case UNIT_MOD_MANA:
        case UNIT_MOD_RAGE:
        case UNIT_MOD_FOCUS:
        case UNIT_MOD_ENERGY:
        case UNIT_MOD_HAPPINESS:
            UpdateMaxPower(GetPowerTypeByAuraGroup(unitMod));
            break;

        case UNIT_MOD_RESISTANCE_HOLY:
        case UNIT_MOD_RESISTANCE_FIRE:
        case UNIT_MOD_RESISTANCE_NATURE:
        case UNIT_MOD_RESISTANCE_FROST:
        case UNIT_MOD_RESISTANCE_SHADOW:
        case UNIT_MOD_RESISTANCE_ARCANE:
            UpdateResistances(GetSpellSchoolByAuraGroup(unitMod));
            break;

        case UNIT_MOD_ATTACK_POWER:
            UpdateAttackPowerAndDamage();
            break;
        case UNIT_MOD_ATTACK_POWER_RANGED:
            UpdateAttackPowerAndDamage(true);
            break;

        case UNIT_MOD_DAMAGE_MAINHAND:
            UpdateDamagePhysical(BASE_ATTACK);
            break;
        case UNIT_MOD_DAMAGE_OFFHAND:
            UpdateDamagePhysical(OFF_ATTACK);
            break;
        case UNIT_MOD_DAMAGE_RANGED:
            UpdateDamagePhysical(RANGED_ATTACK);
            break;
        case UNIT_MOD_DAMAGE_PHYSICAL:
            UpdateDamagePhysical(BASE_ATTACK);
            UpdateDamagePhysical(OFF_ATTACK);
            UpdateDamagePhysical(RANGED_ATTACK);
            break;

        default:
            break;
    }

    return true;
}

float Unit::GetModifierValue(UnitMods unitMod, UnitModifierType modifierType) const
{
    if (unitMod >= UNIT_MOD_END || modifierType >= MODIFIER_TYPE_END)
    {
        sLog.outError("attempt to access nonexistent modifier value from UnitMods!");
        return 0.0f;
    }

    if (modifierType == TOTAL_PCT && m_auraModifiersGroup[unitMod][modifierType] <= 0.0f)
        return 0.0f;

    return m_auraModifiersGroup[unitMod][modifierType];
}

float Unit::GetTotalStatValue(Stats stat) const
{
    UnitMods unitMod = UnitMods(UNIT_MOD_STAT_START + stat);

    if (m_auraModifiersGroup[unitMod][TOTAL_PCT] <= 0.0f)
        return 0.0f;

    // value = ((base_value * base_pct) + total_value) * total_pct
    float value  = m_auraModifiersGroup[unitMod][BASE_VALUE] + GetCreateStat(stat);
    value *= m_auraModifiersGroup[unitMod][BASE_PCT];
    value += m_auraModifiersGroup[unitMod][TOTAL_VALUE];
    value *= m_auraModifiersGroup[unitMod][TOTAL_PCT];

    return value;
}

float Unit::GetTotalAuraModValue(UnitMods unitMod) const
{
    if (unitMod >= UNIT_MOD_END)
    {
        sLog.outError("attempt to access nonexistent UnitMods in GetTotalAuraModValue()!");
        return 0.0f;
    }

    if (m_auraModifiersGroup[unitMod][TOTAL_PCT] <= 0.0f)
        return 0.0f;

    float value  = m_auraModifiersGroup[unitMod][BASE_VALUE];
    value *= m_auraModifiersGroup[unitMod][BASE_PCT];
    value += m_auraModifiersGroup[unitMod][TOTAL_VALUE];
    value *= m_auraModifiersGroup[unitMod][TOTAL_PCT];

    return value;
}

SpellSchools Unit::GetSpellSchoolByAuraGroup(UnitMods unitMod) const
{
    SpellSchools school = SPELL_SCHOOL_NORMAL;

    switch (unitMod)
    {
        case UNIT_MOD_RESISTANCE_HOLY:
            school = SPELL_SCHOOL_HOLY;
            break;
        case UNIT_MOD_RESISTANCE_FIRE:
            school = SPELL_SCHOOL_FIRE;
            break;
        case UNIT_MOD_RESISTANCE_NATURE:
            school = SPELL_SCHOOL_NATURE;
            break;
        case UNIT_MOD_RESISTANCE_FROST:
            school = SPELL_SCHOOL_FROST;
            break;
        case UNIT_MOD_RESISTANCE_SHADOW:
            school = SPELL_SCHOOL_SHADOW;
            break;
        case UNIT_MOD_RESISTANCE_ARCANE:
            school = SPELL_SCHOOL_ARCANE;
            break;

        default:
            break;
    }

    return school;
}

Stats Unit::GetStatByAuraGroup(UnitMods unitMod) const
{
    Stats stat = STAT_STRENGTH;

    switch (unitMod)
    {
        case UNIT_MOD_STAT_STRENGTH:
            stat = STAT_STRENGTH;
            break;
        case UNIT_MOD_STAT_AGILITY:
            stat = STAT_AGILITY;
            break;
        case UNIT_MOD_STAT_STAMINA:
            stat = STAT_STAMINA;
            break;
        case UNIT_MOD_STAT_INTELLECT:
            stat = STAT_INTELLECT;
            break;
        case UNIT_MOD_STAT_SPIRIT:
            stat = STAT_SPIRIT;
            break;

        default:
            break;
    }

    return stat;
}

Powers Unit::GetPowerTypeByAuraGroup(UnitMods unitMod) const
{
    switch (unitMod)
    {
        case UNIT_MOD_MANA:
            return POWER_MANA;
        case UNIT_MOD_RAGE:
            return POWER_RAGE;
        case UNIT_MOD_FOCUS:
            return POWER_FOCUS;
        case UNIT_MOD_ENERGY:
            return POWER_ENERGY;
        case UNIT_MOD_HAPPINESS:
            return POWER_HAPPINESS;
        default:
            return POWER_MANA;
    }

    return POWER_MANA;
}

float Unit::GetTotalAttackPowerValue(WeaponAttackType attType) const
{
    if (attType == RANGED_ATTACK)
    {
        int32 ap = GetInt32Value(UNIT_FIELD_RANGED_ATTACK_POWER) + GetInt32Value(UNIT_FIELD_RANGED_ATTACK_POWER_MODS);
        if (ap < 0)
            return 0.0f;
        return ap * (1.0f + GetFloatValue(UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER));
    }
    else
    {
        int32 ap = GetInt32Value(UNIT_FIELD_ATTACK_POWER) + GetInt32Value(UNIT_FIELD_ATTACK_POWER_MODS);
        if (ap < 0)
            return 0.0f;
        return ap * (1.0f + GetFloatValue(UNIT_FIELD_ATTACK_POWER_MULTIPLIER));
    }
}

float Unit::GetWeaponDamageRange(WeaponAttackType attType, WeaponDamageRange damageRange, uint8 index) const
{
    if (attType == OFF_ATTACK && !haveOffhandWeapon())
        return 0.0f;

    return m_weaponDamage[attType][index].damage[damageRange];
}

void Unit::SetLevel(uint32 lvl)
{
    SetUInt32Value(UNIT_FIELD_LEVEL, lvl);

    // group update
    if ((GetTypeId() == TYPEID_PLAYER) && ((Player*)this)->GetGroup())
        ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_LEVEL);
}

void Unit::SetHealth(uint32 val)
{
    uint32 maxHealth = GetMaxHealth();
    if (maxHealth < val)
        val = maxHealth;

    SetUInt32Value(UNIT_FIELD_HEALTH, val);
    ForceValuesUpdateAtIndex(UNIT_FIELD_MAXHEALTH); // Necessaire pour script qui cache PV aux joueurs.

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_HP);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_HP);
        }
    }
}

void Unit::SetMaxHealth(uint32 val)
{
    uint32 health = GetHealth();
    SetUInt32Value(UNIT_FIELD_MAXHEALTH, val);
    ForceValuesUpdateAtIndex(UNIT_FIELD_HEALTH); // Cf plus haut.

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_HP);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_HP);
        }
    }

    if (val < health)
        SetHealth(val);
}

void Unit::SetHealthPercent(float percent)
{
    uint32 newHealth = GetMaxHealth() * percent / 100.0f;
    SetHealth(newHealth);
}

void Unit::SetPower(Powers power, uint32 val)
{
    if (GetPower(power) == val)
        return;

    uint32 maxPower = GetMaxPower(power);
    if (maxPower < val)
        val = maxPower;

    SetStatInt32Value(UNIT_FIELD_POWER1 + power, val);

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_POWER);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_POWER);
        }

        // Update the pet's character sheet with happiness damage bonus
        if (pet->getPetType() == HUNTER_PET && power == POWER_HAPPINESS)
            pet->UpdateDamagePhysical(BASE_ATTACK);
    }
}

void Unit::SetMaxPower(Powers power, uint32 val)
{
    uint32 cur_power = GetPower(power);
    SetStatInt32Value(UNIT_FIELD_MAXPOWER1 + power, val);

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_POWER);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_POWER);
        }
    }

    if (val < cur_power)
        SetPower(power, val);
}

void Unit::ApplyPowerMod(Powers power, uint32 val, bool apply)
{
    ApplyModUInt32Value(UNIT_FIELD_POWER1 + power, val, apply);

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_POWER);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_POWER);
        }
    }
}

void Unit::ApplyMaxPowerMod(Powers power, uint32 val, bool apply)
{
    ApplyModUInt32Value(UNIT_FIELD_MAXPOWER1 + power, val, apply);

    // group update
    if (GetTypeId() == TYPEID_PLAYER)
    {
        if (((Player*)this)->GetGroup())
            ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_POWER);
    }
    else if (((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
                ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_POWER);
        }
    }
}

void Unit::ApplyAuraProcTriggerDamage(Aura* aura, bool apply)
{
    AuraList& tAuraProcTriggerDamage = m_modAuras[SPELL_AURA_PROC_TRIGGER_DAMAGE];
    if (apply)
        tAuraProcTriggerDamage.push_back(aura);
    else
        tAuraProcTriggerDamage.remove(aura);
}

uint32 Unit::GetCreatePowers(Powers power) const
{
    switch (power)
    {
        case POWER_HEALTH:
            return 0;                   // is it really should be here?
        case POWER_MANA:
            return GetCreateMana();
        case POWER_RAGE:
            return 1000;
        case POWER_FOCUS:
            return (GetTypeId() == TYPEID_PLAYER || !((Creature const*)this)->IsPet() || ((Pet const*)this)->getPetType() != HUNTER_PET ? 0 : 100);
        case POWER_ENERGY:
            return 100;
        case POWER_HAPPINESS:
            return (GetTypeId() == TYPEID_PLAYER || !((Creature const*)this)->IsPet() || ((Pet const*)this)->getPetType() != HUNTER_PET ? 0 : 1050000);
    }

    return 0;
}

void Unit::AddToWorld()
{
    Object::AddToWorld();
    ScheduleAINotify(0);
}

void Unit::RemoveFromWorld()
{
    // cleanup
    if (IsInWorld())
    {
        Uncharm();
        RemoveNotOwnSingleTargetAuras();
        RemoveGuardians();
        RemoveAllGameObjects();
        RemoveAllDynObjects();
        CleanupDeletedAuras();
        GetViewPoint().Event_RemovedFromWorld();
    }
    if (m_needUpdateVisibility && FindMap())
    {
        FindMap()->RemoveRelocatedUnit(this);
        m_needUpdateVisibility = false;
    }
    Object::RemoveFromWorld();
}

void Unit::CleanupsBeforeDelete()
{
    if (m_uint32Values)                                     // only for fully created object
    {
        InterruptNonMeleeSpells(true);
        m_Events.KillAllEvents(false);                      // non-delatable (currently casted spells) will not deleted now but it will deleted at call in Map::RemoveAllObjectsInRemoveList
        CombatStop();
        ClearComboPointHolders();
        DeleteThreatList();
        if (getHostileRefManager().getOwner() == this)
        {
            if (GetTypeId() == TYPEID_PLAYER)
                getHostileRefManager().setOnlineOfflineState(false);
            else
                getHostileRefManager().deleteReferences();
        }
        RemoveAllAuras(AURA_REMOVE_BY_DELETE);
        CleanupDeletedAuras(); // any long range channeled spells need to be cleaned up after aura deletion
    }
    WorldObject::CleanupsBeforeDelete();
}

CharmInfo* Unit::InitCharmInfo(Unit *charm)
{
    if (!m_charmInfo)
        m_charmInfo = new CharmInfo(charm);
    return m_charmInfo;
}

CharmInfo::CharmInfo(Unit* unit)
    : m_unit(unit), m_CommandState(COMMAND_FOLLOW), m_reactState(REACT_PASSIVE), m_petnumber(0),
      _isCommandAttack(false), _isAtStay(false), _isFollowing(false), _isReturning(false),
      _stayX(0.0f), _stayY(0.0f), _stayZ(0.0f), _isCommandFollow(false), m_originalFactionTemplate(nullptr)
{
    for (int i = 0; i < CREATURE_MAX_SPELLS; ++i)
        m_charmspells[i].SetActionAndType(0, ACT_DISABLED);
}

void CharmInfo::InitPetActionBar()
{
    // the first 3 SpellOrActions are attack, follow and stay
    for (uint32 i = 0; i < ACTION_BAR_INDEX_PET_SPELL_START - ACTION_BAR_INDEX_START; ++i)
        SetActionBar(ACTION_BAR_INDEX_START + i, COMMAND_ATTACK - i, ACT_COMMAND);

    // middle 4 SpellOrActions are spells/special attacks/abilities
    for (uint32 i = 0; i < ACTION_BAR_INDEX_PET_SPELL_END - ACTION_BAR_INDEX_PET_SPELL_START; ++i)
        SetActionBar(ACTION_BAR_INDEX_PET_SPELL_START + i, 0, ACT_DISABLED);

    // last 3 SpellOrActions are reactions
    for (uint32 i = 0; i < ACTION_BAR_INDEX_END - ACTION_BAR_INDEX_PET_SPELL_END; ++i)
        SetActionBar(ACTION_BAR_INDEX_PET_SPELL_END + i, COMMAND_ATTACK - i, ACT_REACTION);
}

void CharmInfo::InitEmptyActionBar()
{
    SetActionBar(ACTION_BAR_INDEX_START, COMMAND_ATTACK, ACT_COMMAND);
    for (uint32 x = ACTION_BAR_INDEX_START + 1; x < ACTION_BAR_INDEX_END; ++x)
        SetActionBar(x, 0, ACT_PASSIVE);
}

void CharmInfo::InitPossessCreateSpells()
{
    InitEmptyActionBar();                                   //charm action bar

    if (m_unit->GetTypeId() == TYPEID_PLAYER)               //possessed players don't have spells, keep the action bar empty
        return;

    for (uint32 x = 0; x < CREATURE_MAX_SPELLS; ++x)
    {
        if (IsPassiveSpell(((Creature*)m_unit)->m_spells[x]))
            m_unit->CastSpell(m_unit, ((Creature*)m_unit)->m_spells[x], true);
        else
            AddSpellToActionBar(((Creature*)m_unit)->m_spells[x], ACT_PASSIVE);
    }
}

void CharmInfo::InitCharmCreateSpells()
{
    if (m_unit->GetTypeId() == TYPEID_PLAYER)               //charmed players don't have spells
    {
        //InitEmptyActionBar();
        InitPetActionBar();
        return;
    }

    InitPetActionBar();

    for (uint32 x = 0; x < CREATURE_MAX_SPELLS; ++x)
    {
        uint32 spellId = ((Creature*)m_unit)->m_spells[x];

        if (!spellId)
        {
            m_charmspells[x].SetActionAndType(spellId, ACT_DISABLED);
            continue;
        }

        if (IsPassiveSpell(spellId))
        {
            m_unit->CastSpell(m_unit, spellId, true);
            m_charmspells[x].SetActionAndType(spellId, ACT_PASSIVE);
        }
        else
        {
            m_charmspells[x].SetActionAndType(spellId, ACT_DISABLED);

            ActiveStates newstate;
            bool onlyselfcast = true;
            SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);

            if (!spellInfo) onlyselfcast = false;
            for (uint32 i = 0; i < 3 && onlyselfcast; ++i)  //nonexistent spell will not make any problems as onlyselfcast would be false -> break right away
            {
                if (spellInfo->EffectImplicitTargetA[i] != TARGET_SELF && spellInfo->EffectImplicitTargetA[i] != 0)
                    onlyselfcast = false;
            }

            if (onlyselfcast || !IsPositiveSpell(spellId))  // only self cast and spells versus enemies are autocastable
                newstate = ACT_DISABLED;
            else
                newstate = ACT_PASSIVE;

            AddSpellToActionBar(spellId, newstate);
        }
    }
}

bool CharmInfo::AddSpellToActionBar(uint32 spell_id, ActiveStates newstate)
{
    uint32 first_id = sSpellMgr.GetFirstSpellInChain(spell_id);

    // new spell rank can be already listed
    for (uint8 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (uint32 action = PetActionBar[i].GetAction())
        {
            if (PetActionBar[i].IsActionBarForSpell() && sSpellMgr.GetFirstSpellInChain(action) == first_id)
            {
                PetActionBar[i].SetAction(spell_id);
                return true;
            }
        }
    }

    // or use empty slot in other case
    for (uint8 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (!PetActionBar[i].GetAction() && PetActionBar[i].IsActionBarForSpell())
        {
            SetActionBar(i, spell_id, newstate == ACT_DECIDE ? ACT_DISABLED : newstate);
            return true;
        }
    }
    return false;
}

bool CharmInfo::RemoveSpellFromActionBar(uint32 spell_id)
{
    uint32 first_id = sSpellMgr.GetFirstSpellInChain(spell_id);

    for (uint8 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (uint32 action = PetActionBar[i].GetAction())
        {
            if (PetActionBar[i].IsActionBarForSpell() && sSpellMgr.GetFirstSpellInChain(action) == first_id)
            {
                SetActionBar(i, 0, ACT_DISABLED);
                return true;
            }
        }
    }

    return false;
}

void CharmInfo::ToggleCreatureAutocast(uint32 spellid, bool apply)
{
    if (IsPassiveSpell(spellid))
        return;

    for (uint32 x = 0; x < CREATURE_MAX_SPELLS; ++x)
        if (spellid == m_charmspells[x].GetAction())
            m_charmspells[x].SetType(apply ? ACT_ENABLED : ACT_DISABLED);
}

void CharmInfo::SetPetNumber(uint32 petnumber, bool statwindow)
{
    m_petnumber = petnumber;
    if (statwindow)
        m_unit->SetUInt32Value(UNIT_FIELD_PETNUMBER, m_petnumber);
    else
        m_unit->SetUInt32Value(UNIT_FIELD_PETNUMBER, 0);
}

void CharmInfo::LoadPetActionBar(const std::string& data)
{
    InitPetActionBar();

    Tokens tokens = StrSplit(data, " ");

    if (tokens.size() != (ACTION_BAR_INDEX_END - ACTION_BAR_INDEX_START) * 2)
        return;                                             // non critical, will reset to default

    int index;
    Tokens::iterator iter;
    for (iter = tokens.begin(), index = ACTION_BAR_INDEX_START; index < ACTION_BAR_INDEX_END; ++iter, ++index)
    {
        // use unsigned cast to avoid sign negative format use at long-> ActiveStates (int) conversion
        uint8 type  = (uint8)atol((*iter).c_str());
        ++iter;
        uint32 action = atol((*iter).c_str());

        PetActionBar[index].SetActionAndType(action, ActiveStates(type));

        // check correctness
        if (PetActionBar[index].IsActionBarForSpell() && !sSpellMgr.GetSpellEntry(PetActionBar[index].GetAction()))
            SetActionBar(index, 0, ACT_DISABLED);
    }
}

void CharmInfo::BuildActionBar(WorldPacket* data)
{
    for (uint32 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
        *data << uint32(PetActionBar[i].packedData);
}

void CharmInfo::SetSpellAutocast(uint32 spell_id, bool state)
{
    for (int i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (spell_id == PetActionBar[i].GetAction() && PetActionBar[i].IsActionBarForSpell())
        {
            PetActionBar[i].SetType(state ? ACT_ENABLED : ACT_DISABLED);
            break;
        }
    }
}

void CharmInfo::SetIsCommandAttack(bool val)
{
    _isCommandAttack = val;
}

bool CharmInfo::IsCommandAttack()
{
    return _isCommandAttack;
}

void CharmInfo::SetIsCommandFollow(bool val)
{
    _isCommandFollow = val;
}

bool CharmInfo::IsCommandFollow()
{
    return _isCommandFollow;
}

void CharmInfo::SaveStayPosition()
{
    // No Unit::StopMoving while possessed
    if (m_unit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED))
        m_unit->GetPosition(_stayX, _stayY, _stayZ);
    else //! At this point a new spline destination is enabled because of Unit::StopMoving()
    {
        G3D::Vector3 stayPos = m_unit->movespline->FinalDestination();
        _stayX = stayPos.x;
        _stayY = stayPos.y;
        _stayZ = stayPos.z;
    }
}

void CharmInfo::GetStayPosition(float &x, float &y, float &z)
{
    x = _stayX;
    y = _stayY;
    z = _stayZ;
}

void CharmInfo::SetIsAtStay(bool val)
{
    _isAtStay = val;
}

bool CharmInfo::IsAtStay()
{
    return _isAtStay;
}

void CharmInfo::SetIsFollowing(bool val)
{
    _isFollowing = val;
}

bool CharmInfo::IsFollowing()
{
    return _isFollowing;
}

void CharmInfo::SetIsReturning(bool val)
{
    _isReturning = val;
}

bool CharmInfo::IsReturning()
{
    return _isReturning;
}


bool Unit::isFrozen() const
{
    return HasAuraState(AURA_STATE_FROZEN);
}

uint32 createProcExtendMask(SpellNonMeleeDamage *damageInfo, SpellMissInfo missCondition)
{
    uint32 procEx = PROC_EX_NONE;
    switch (missCondition)
    {
        case SPELL_MISS_MISS:
            procEx |= PROC_EX_MISS;
            break;
        case SPELL_MISS_RESIST:
            procEx |= PROC_EX_RESIST;
            break;
        case SPELL_MISS_DODGE:
            procEx |= PROC_EX_DODGE;
            break;
        case SPELL_MISS_PARRY:
            procEx |= PROC_EX_PARRY;
            break;
        case SPELL_MISS_BLOCK:
            procEx |= PROC_EX_BLOCK;
            break;
        case SPELL_MISS_EVADE:
            procEx |= PROC_EX_EVADE;
            break;
        case SPELL_MISS_IMMUNE:
            procEx |= PROC_EX_IMMUNE;
            break;
        case SPELL_MISS_IMMUNE2:
            procEx |= PROC_EX_IMMUNE;
            break;
        case SPELL_MISS_DEFLECT:
            procEx |= PROC_EX_DEFLECT;
            break;
        case SPELL_MISS_ABSORB:
            procEx |= PROC_EX_ABSORB;
            break;
        case SPELL_MISS_REFLECT:
            procEx |= PROC_EX_REFLECT;
        // no break
        case SPELL_MISS_NONE:
            // On block
            if (damageInfo->blocked)
                procEx |= PROC_EX_BLOCK;
            // On absorb
            if (damageInfo->absorb)
                procEx |= PROC_EX_ABSORB;
            // On crit
            if (damageInfo->HitInfo & SPELL_HIT_TYPE_CRIT)
                procEx |= PROC_EX_CRITICAL_HIT;
            else
                procEx |= PROC_EX_NORMAL_HIT;
            break;
    }
    return procEx;
}

void Unit::ProcDamageAndSpellFor(bool isVictim, Unit* pTarget, uint32 procFlag, uint32 procExtra, WeaponAttackType attType, SpellEntry const* procSpell, uint32 damage, ProcTriggeredList& triggeredList, Spell* spell)
{
    // For melee/ranged based attack need update skills and set some Aura states
    if (procFlag & MELEE_BASED_TRIGGER_MASK && pTarget)
    {
        // Update skills here for players
        if (GetTypeId() == TYPEID_PLAYER)
        {
            // On melee based hit/miss/resist need update skill (for victim and attacker)
            if (procExtra & (PROC_EX_NORMAL_HIT | PROC_EX_MISS | PROC_EX_RESIST))
            {
                if (pTarget->GetTypeId() != TYPEID_PLAYER && pTarget->GetCreatureType() != CREATURE_TYPE_CRITTER)
                    ((Player*)this)->UpdateCombatSkills(pTarget, attType, isVictim);
            }
            // Update defence if player is victim and parry/dodge/block
            if (isVictim && procExtra & (PROC_EX_DODGE | PROC_EX_PARRY | PROC_EX_BLOCK))
                ((Player*)this)->UpdateDefense();
        }
        // If exist crit/parry/dodge/block need update aura state (for victim and attacker)
        if (procExtra & (PROC_EX_CRITICAL_HIT | PROC_EX_PARRY | PROC_EX_DODGE | PROC_EX_BLOCK))
        {
            // for victim
            if (isVictim)
            {
                // if victim and dodge attack
                if (procExtra & PROC_EX_DODGE)
                {
                    //Update AURA_STATE on dodge
                    if (getClass() != CLASS_ROGUE) // skip Rogue Riposte
                    {
                        ModifyAuraState(AURA_STATE_DEFENSE, true);
                        StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                    }
                }
                // if victim and parry attack
                if (procExtra & PROC_EX_PARRY)
                {
                    // For Hunters only Counterattack (skip Mongoose bite)
                    if (getClass() == CLASS_HUNTER)
                    {
                        ModifyAuraState(AURA_STATE_HUNTER_PARRY, true);
                        StartReactiveTimer(REACTIVE_HUNTER_PARRY, pTarget->GetObjectGuid());
                        ((Player*)this)->AddComboPoints(pTarget, 1);
                    }
                    else
                    {
                        ModifyAuraState(AURA_STATE_DEFENSE, true);
                        StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                    }
                }
                // if and victim block attack
                if (procExtra & PROC_EX_BLOCK)
                {
                    ModifyAuraState(AURA_STATE_DEFENSE, true);
                    StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                }
            }
            else //For attacker
            {
                // Overpower on victim dodge
                if (procExtra & PROC_EX_DODGE && GetTypeId() == TYPEID_PLAYER && getClass() == CLASS_WARRIOR)
                {
                    ((Player*)this)->AddComboPoints(pTarget, 1);
                    StartReactiveTimer(REACTIVE_OVERPOWER, pTarget->GetObjectGuid());
                }
            }
        }
    }
    DEBUG_UNIT(this, DEBUG_PROCS, "PROC: Flags 0x%.5x Ex 0x%.3x Spell %5u %s", procFlag, procExtra, procSpell ? procSpell->Id : 0, isVictim ? "[victim]" : "");

    // Fill triggeredList list
    for (SpellAuraHolderMap::const_iterator itr = GetSpellAuraHolderMap().begin(); itr != GetSpellAuraHolderMap().end(); ++itr)
    {
        // Can not proc on self.
        if (procSpell && procSpell->Id == itr->first)
            continue;

        // skip deleted auras (possible at recursive triggered call
        if (itr->second->IsDeleted())
            continue;

        // Aura that applies a modifier with charges. Gere? otherwise.
        bool hasmodifier = false;
        for (int i = 0; i < 3; ++i)
            if (itr->second->GetAuraByEffectIndex(SpellEffectIndex(i)))
                if (SpellModifier* auraMod = itr->second->GetAuraByEffectIndex(SpellEffectIndex(i))->GetSpellModifier())
                    if (auraMod->charges > 0 || (spell && spell->HasModifierApplied(auraMod)))
                    {
                        hasmodifier = true;
                        break;
                    }
        if (hasmodifier)
            continue;

        SpellProcEventEntry const* spellProcEvent = nullptr;
        if (!IsTriggeredAtSpellProcEvent(pTarget, itr->second, procSpell, procFlag, procExtra, attType, isVictim, spellProcEvent))
            continue;

        itr->second->SetInUse(true);                        // prevent holder deletion
        triggeredList.push_back(ProcTriggeredData(spellProcEvent, itr->second, pTarget, procFlag));
    }
}

SpellSchoolMask Unit::GetMeleeDamageSchoolMask() const
{
    return SPELL_SCHOOL_MASK_NORMAL;
}

Player* Unit::GetSpellModOwner() const
{
    if (GetTypeId() == TYPEID_PLAYER)
        return (Player*)this;
    if (((Creature*)this)->IsPet() || ((Creature*)this)->IsTotem())
    {
        Unit* owner = GetOwner();
        if (owner && owner->GetTypeId() == TYPEID_PLAYER)
            return (Player*)owner;
    }
    return nullptr;
}

///----------Pet responses methods-----------------
void Unit::SendPetCastFail(uint32 spellid, SpellCastResult msg)
{
    if (msg == SPELL_CAST_OK)
        return;

    Unit *owner = GetCharmerOrOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data(SMSG_PET_CAST_FAILED, 4 + 1 + 1);
    data << uint32(spellid);
    data << uint8(2); // 1.12: comme SMSG_CAST_RESULT je suppose. 2 = echec, 0 = reussi.
    data << uint8(msg);
    ((Player*)owner)->GetSession()->SendPacket(&data);
}

void Unit::SendPetActionFeedback(uint8 msg)
{
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data(SMSG_PET_ACTION_FEEDBACK, 1);
    data << uint8(msg);
    ((Player*)owner)->GetSession()->SendPacket(&data);
}

void Unit::SendPetTalk(uint32 pettalk)
{
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data(SMSG_PET_ACTION_SOUND, 8 + 4);
    data << GetObjectGuid();
    data << uint32(pettalk);
    ((Player*)owner)->GetSession()->SendPacket(&data);
}

void Unit::SendPetAIReaction()
{
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data(SMSG_AI_REACTION, 8 + 4);
    data << GetObjectGuid();
    data << uint32(AI_REACTION_HOSTILE);
    ((Player*)owner)->GetSession()->SendPacket(&data);
}

///----------End of Pet responses methods----------

void Unit::StopMoving(bool force)
{
    clearUnitState(UNIT_STAT_MOVING);
    RemoveUnitMovementFlag(MOVEFLAG_MASK_MOVING);
    // not need send any packets if not in world
    if (!IsInWorld())
        return;

    Movement::MoveSplineInit init(*this, "StopMoving");
    if (Transport* t = GetTransport()) {
        init.SetTransport(t->GetGUIDLow());
    }

    if (!movespline->Finalized() || force) {
        init.SetStop(); // Will trigger CMSG_MOVE_SPLINE_DONE from client.
        init.Launch();
    }
    else if (GetTypeId() != TYPEID_PLAYER) {
        init.SetFacing(GetOrientation());
        init.Launch();
    }

    DisableSpline();
}

void Unit::SetFleeing(bool apply, ObjectGuid casterGuid, uint32 spellID, uint32 time)
{
    if (apply && HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    ModConfuseSpell(apply, casterGuid, spellID, MOV_MOD_FLEE_FOR_ASSISTANCE, time);
}

void Unit::SetFeared(bool apply, ObjectGuid casterGuid, uint32 spellID, uint32 time)
{
    if (apply && HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    ModConfuseSpell(apply, casterGuid, spellID, MOV_MOD_FLEE_IN_FEAR, time);
}

void Unit::SetConfused(bool apply, ObjectGuid casterGuid, uint32 spellID)
{
    ModConfuseSpell(apply, casterGuid, spellID, MOV_MOD_CONFUSED, 0);
}

void Unit::ModConfuseSpell(bool apply, ObjectGuid casterGuid, uint32 spellID, MovementModType modType, uint32 time)
{
    if (GetTypeId() == TYPEID_UNIT)
        if (ToCreature()->IsTotem())
            return;

    bool controlFinished = true;

    if (HasAuraType(SPELL_AURA_MOD_CONFUSE))
    {
        controlFinished = false;
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED);
    }
    else
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED);

    if (HasAuraType(SPELL_AURA_MOD_FEAR) && !HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
    {
        controlFinished = false;
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);
    }
    else
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING);

    m_movementInfo.moveFlags &= ~MOVEFLAG_MASK_MOVING_OR_TURN;

    if (apply)
    {
        CastStop(GetObjectGuid() == casterGuid ? spellID : 0);

        switch (modType)
        {
        case MOV_MOD_FLEE_FOR_ASSISTANCE:
        {
            Unit* caster = IsInWorld() ? GetMap()->GetUnit(casterGuid) : nullptr;
            GetMotionMaster()->MoveFleeing(caster, time);
            break;
        }
        case MOV_MOD_FLEE_IN_FEAR:
        {
            Unit* caster = IsInWorld() ? GetMap()->GetUnit(casterGuid) : nullptr;
            GetMotionMaster()->MoveFeared(caster, time);
            break;
        }
        case MOV_MOD_CONFUSED:
            GetMotionMaster()->MoveConfused();
            break;
        }

        if (casterGuid != GetObjectGuid())
            InterruptNonMeleeSpells(false);

        if (GetTypeId() == TYPEID_UNIT)
            SetTargetGuid(ObjectGuid());
    }
    else
    {
        switch (modType)
        {
        case MOV_MOD_FLEE_FOR_ASSISTANCE:
        case MOV_MOD_FLEE_IN_FEAR:
        {
            if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_FLEEING))
                GetMotionMaster()->ClearType(FLEEING_MOTION_TYPE);
            break;
        }
        case MOV_MOD_CONFUSED:
            if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED))
                GetMotionMaster()->ClearType(CONFUSED_MOTION_TYPE);
            break;
        }

        // Si spellID=0, c'est pour interrompre (par exemple male de temerite - 704)
        // Donc on retire les effets meme si on a encore un aura de fear.
        if (!controlFinished && spellID)
            return;

        if (GetTypeId() != TYPEID_PLAYER && isAlive())
        {
            Unit* caster = IsInWorld() ? GetMap()->GetUnit(casterGuid) : nullptr;
            if (caster)
                AttackedBy(caster);

            // restore appropriate movement generator
            if (!SelectHostileTarget())
                return;

            if (getVictim())
                SetTargetGuid(getVictim()->GetObjectGuid());

            RestoreMovement();
        }
    }
}

void Unit::SetFeignDeath(bool apply, ObjectGuid casterGuid, uint32 /*spellID*/)
{
    // [TODO] SMSG_FEIGN_DEATH_RESISTED sert a quoi ? - il affiche 'Resiste' en notify.
    if (apply)
    {
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_MASK_MOVING_OR_TURN);
        if (GetTypeId() != TYPEID_PLAYER)
            StopMoving();


        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
        SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

        addUnitState(UNIT_STAT_DIED);
        CombatStop();
        RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

        // prevent interrupt message
        if (casterGuid == GetObjectGuid())
            FinishSpell(CURRENT_GENERIC_SPELL, false);
        InterruptNonMeleeSpells(true);
        getHostileRefManager().deleteReferences();
    }
    else
    {
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
        // blizz like 2.0.x
        //SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH); [-ZERO] remove/replace ?

        RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

        clearUnitState(UNIT_STAT_DIED);

        RestoreMovement();
    }
}

bool Unit::IsSitState() const
{
    uint8 s = getStandState();
    return
        s == UNIT_STAND_STATE_SIT_CHAIR        || s == UNIT_STAND_STATE_SIT_LOW_CHAIR  ||
        s == UNIT_STAND_STATE_SIT_MEDIUM_CHAIR || s == UNIT_STAND_STATE_SIT_HIGH_CHAIR ||
        s == UNIT_STAND_STATE_SIT;
}

bool Unit::IsStandState() const
{
    uint8 s = getStandState();
    return !IsSitState() && s != UNIT_STAND_STATE_SLEEP && s != UNIT_STAND_STATE_KNEEL;
}

void Unit::SetStandState(uint8 state)
{
    if (GetByteValue(UNIT_FIELD_BYTES_1, 0) == state)
        return;

    SetByteValue(UNIT_FIELD_BYTES_1, 0, state);

    if (IsStandState())
        RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_NOT_SEATED);

    if (GetTypeId() == TYPEID_PLAYER)
    {
        WorldPacket data(SMSG_STANDSTATE_UPDATE, 1);
        data << (uint8)state;
        ((Player*)this)->GetSession()->SendPacket(&data);
    }
}

bool Unit::IsPolymorphed() const
{
    return GetSpellSpecific(getTransForm()) == SPELL_MAGE_POLYMORPH;
}

bool Unit::isAttackReady(WeaponAttackType type) const
{
    return m_attackTimer[type] == 0;
}
void Unit::SetDisplayId(uint32 modelId)
{
    SetUInt32Value(UNIT_FIELD_DISPLAYID, modelId);

    UpdateModelData();

    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (!pet->isControlled())
            return;
        Unit *owner = GetOwner();
        if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
            ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MODEL_ID);
    }
}

void Unit::UpdateModelData()
{
    CreatureDisplayInfoEntry const* displayEntry = sCreatureDisplayInfoStore.LookupEntry(GetDisplayId());
    CreatureModelInfo const* modelInfo = sObjectMgr.GetCreatureModelInfo(GetDisplayId());
    if (modelInfo && displayEntry && modelInfo->bounding_radius && modelInfo->combat_reach && displayEntry->scale)
    {
        // we expect values in database to be relative to scale = 1.0
        SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, (GetObjectScale() / displayEntry->scale) * modelInfo->bounding_radius);

        // never actually update combat_reach for player, it's always the same. Below player case is for initialization
        if (GetTypeId() == TYPEID_PLAYER)
            SetFloatValue(UNIT_FIELD_COMBATREACH, 1.5f);
        else
            SetFloatValue(UNIT_FIELD_COMBATREACH, (GetObjectScale() / displayEntry->scale) * modelInfo->combat_reach);
    }
    else
    {
        sLog.outError("UpdateModelData : pas / mauvaises infos pour le displayid %u de '%s'", GetDisplayId(), GetGuidStr().c_str());
        SetFloatValue(UNIT_FIELD_COMBATREACH, 1.5f);
        SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 1.5f);
    }
}

void Unit::ClearComboPointHolders()
{
    while (!m_ComboPointHolders.empty())
    {
        uint32 lowguid = *m_ComboPointHolders.begin();

        Player* plr = sObjectMgr.GetPlayer(ObjectGuid(HIGHGUID_PLAYER, lowguid));
        if (plr && plr->GetComboTargetGuid() == GetObjectGuid())// recheck for safe
            plr->ClearComboPoints();                        // remove also guid from m_ComboPointHolders;
        else
            m_ComboPointHolders.erase(lowguid);             // or remove manually
    }
}

void Unit::ClearAllReactives()
{
    for (int i = 0; i < MAX_REACTIVE; ++i)
    {
        m_reactiveTimer[i] = 0;
        m_reactiveTarget[i].Clear();
    }

    if (HasAuraState(AURA_STATE_DEFENSE))
        ModifyAuraState(AURA_STATE_DEFENSE, false);
    if (getClass() == CLASS_HUNTER && HasAuraState(AURA_STATE_HUNTER_PARRY))
        ModifyAuraState(AURA_STATE_HUNTER_PARRY, false);

    if (getClass() == CLASS_WARRIOR && GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->ClearComboPoints();
}

void Unit::UpdateReactives(uint32 p_time)
{
    for (int i = 0; i < MAX_REACTIVE; ++i)
    {
        ReactiveType reactive = ReactiveType(i);

        if (!m_reactiveTimer[reactive])
            continue;

        if (m_reactiveTimer[reactive] <= p_time)
        {
            m_reactiveTimer[reactive] = 0;
            m_reactiveTarget[reactive].Clear();

            switch (reactive)
            {
                case REACTIVE_DEFENSE:
                    if (HasAuraState(AURA_STATE_DEFENSE))
                        ModifyAuraState(AURA_STATE_DEFENSE, false);
                    break;
                case REACTIVE_HUNTER_PARRY:
                    if (getClass() == CLASS_HUNTER && HasAuraState(AURA_STATE_HUNTER_PARRY))
                        ModifyAuraState(AURA_STATE_HUNTER_PARRY, false);
                    break;
                case REACTIVE_OVERPOWER:
                    if (getClass() == CLASS_WARRIOR && GetTypeId() == TYPEID_PLAYER)
                        ((Player*)this)->ClearComboPoints();
                    break;
                default:
                    break;
            }
        }
        else
            m_reactiveTimer[reactive] -= p_time;
    }
}

Unit* Unit::SelectRandomUnfriendlyTarget(Unit* except /*= NULL*/, float radius /*= ATTACK_DISTANCE*/, bool inFront /*= false*/, bool isValidAttackTarget /*= false*/) const
{
    std::list<Unit *> targets;

    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, radius);

    // remove current target
    if (except)
        targets.remove(except);

    // remove not LoS targets
    for (std::list<Unit *>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if ((!IsWithinLOSInMap(*tIter)) || (inFront && !this->HasInArc(M_PI_F / 2, *tIter)) || (isValidAttackTarget && !IsValidAttackTarget(*tIter)))
        {
            std::list<Unit *>::iterator tIter2 = tIter;
            ++tIter;
            targets.erase(tIter2);
        }
        else
            ++tIter;
    }

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    // select random
    uint32 rIdx = urand(0, targets.size() - 1);
    std::list<Unit *>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

Unit* Unit::SelectRandomFriendlyTarget(Unit* except /*= NULL*/, float radius /*= ATTACK_DISTANCE*/) const
{
    std::list<Unit *> targets;

    MaNGOS::AnyFriendlyUnitInObjectRangeCheck u_check(this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck> searcher(targets, u_check);

    Cell::VisitAllObjects(this, searcher, radius);

    // remove current target
    if (except)
        targets.remove(except);

    // remove self
    targets.remove((Unit *) this);

    // remove not LoS targets
    for (std::list<Unit *>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if (!IsWithinLOSInMap(*tIter))
        {
            std::list<Unit *>::iterator tIter2 = tIter;
            ++tIter;
            targets.erase(tIter2);
        }
        else
            ++tIter;
    }

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    // select random
    uint32 rIdx = urand(0, targets.size() - 1);
    std::list<Unit *>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

bool Unit::IsSecondaryThreatTarget()
{
    // Targets with Fear / Confuse / breakable CC
    for (SpellAuraHolderMap::const_iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end(); ++iter)
    {
        if (iter->second->IsTargetSecondaryThreatFocus())
            return true;
    }
    // Totems have secondary threat priority
    if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsTotem())
    {
        if (Totem* totem = ((Totem*)this))
        {
            SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(totem->GetSpell());
            if (!spellInfo)
                return true;

            switch (spellInfo->SpellIconID)
            {
                // Fire Nova Totem / Magma Totem / Searing Totem / Stoneclaw Totem do have threat
                case 33:
                case 37:
                case 680:
                case 689:
                    break;
                default:
                    return true;
            }
        }
    }
    return false;
}

bool Unit::hasNegativeAuraWithInterruptFlag(uint32 flag)
{
    for (SpellAuraHolderMap::const_iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end(); ++iter)
    {
        if (!iter->second->IsPositive() && iter->second->GetSpellProto()->AuraInterruptFlags & flag)
            return true;
    }
    return false;
}

void Unit::ApplyAttackTimePercentMod(WeaponAttackType att, float val, bool apply, bool recalcDamage /*= false*/)
{
    if (val > 0)
    {
        ApplyPercentModFloatVar(m_modAttackSpeedPct[att], val, !apply);
        ApplyPercentModFloatValue(UNIT_FIELD_BASEATTACKTIME + att, val, !apply);

        if (recalcDamage)
            ApplyPercentModFloatVar(m_modRecalcDamagePct[att], val, !apply);
    }
    else
    {
        ApplyPercentModFloatVar(m_modAttackSpeedPct[att], -val, apply);
        ApplyPercentModFloatValue(UNIT_FIELD_BASEATTACKTIME + att, -val, apply);

        if (recalcDamage)
            ApplyPercentModFloatVar(m_modRecalcDamagePct[att], val, apply);
    }
}

void Unit::ApplyCastTimePercentMod(float val, bool apply)
{
    ApplyPercentModFloatValue(UNIT_MOD_CAST_SPEED, -val, apply);
}

void Unit::UpdateAuraForGroup(uint8 slot)
{
    if (GetTypeId() == TYPEID_PLAYER)
    {
        Player* player = (Player*)this;
        if (player->GetGroup())
        {
            player->SetGroupUpdateFlag(slot < MAX_POSITIVE_AURAS ? GROUP_UPDATE_FLAG_AURAS : GROUP_UPDATE_FLAG_AURAS_NEGATIVE);
            player->SetAuraUpdateSlot(slot);
        }
    }
    else if (GetTypeId() == TYPEID_UNIT && ((Creature*)this)->IsPet())
    {
        Pet *pet = ((Pet*)this);
        if (pet->isControlled())
        {
            Unit *owner = GetOwner();
            if (owner && (owner->GetTypeId() == TYPEID_PLAYER) && ((Player*)owner)->GetGroup())
            {
                ((Player*)owner)->SetGroupUpdateFlag(slot < MAX_POSITIVE_AURAS ? GROUP_UPDATE_FLAG_PET_AURAS : GROUP_UPDATE_FLAG_PET_AURAS_NEGATIVE);
                pet->SetAuraUpdateSlot(slot);
            }
        }
    }
}

float Unit::GetAPMultiplier(WeaponAttackType attType, bool normalized)
{
    if (!normalized || GetTypeId() != TYPEID_PLAYER)
        return float(GetAttackTime(attType)) / 1000.0f;

    Item *Weapon = ((Player*)this)->GetWeaponForAttack(attType, true, false);
    if (!Weapon)
        return 2.4f;                                         // fist attack

    switch (Weapon->GetProto()->InventoryType)
    {
        case INVTYPE_2HWEAPON:
            return 3.3f;
        case INVTYPE_RANGED:
        case INVTYPE_RANGEDRIGHT:
        case INVTYPE_THROWN:
            return 2.8f;
        case INVTYPE_WEAPON:
        case INVTYPE_WEAPONMAINHAND:
        case INVTYPE_WEAPONOFFHAND:
        default:
            return Weapon->GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ? 1.7f : 2.4f;
    }
}

Aura* Unit::GetDummyAura(uint32 spell_id) const
{
    Unit::AuraList const& mDummy = GetAurasByType(SPELL_AURA_DUMMY);
    for (Unit::AuraList::const_iterator itr = mDummy.begin(); itr != mDummy.end(); ++itr)
        if ((*itr)->GetId() == spell_id)
            return *itr;

    return nullptr;
}

void Unit::SetContestedPvP(Unit *attackedUnit)
{
    Player* player = GetCharmerOrOwnerPlayerOrPlayerItself();

    if (!player || (attackedUnit && attackedUnit->IsPlayer() && (attackedUnit == player || player->IsInDuelWith(attackedUnit->ToPlayer()))))
        return;

    if (attackedUnit && attackedUnit->GetTypeId() == TYPEID_UNIT && !attackedUnit->IsPvP())
        return;

    player->SetContestedPvPTimer(30000);

    if (!player->hasUnitState(UNIT_STAT_ATTACK_PLAYER))
    {
        player->addUnitState(UNIT_STAT_ATTACK_PLAYER);
        player->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP);
        // call MoveInLineOfSight for nearby contested guards
        UpdateVisibilityAndView();
    }

    if (!hasUnitState(UNIT_STAT_ATTACK_PLAYER))
    {
        addUnitState(UNIT_STAT_ATTACK_PLAYER);
        // call MoveInLineOfSight for nearby contested guards
        UpdateVisibilityAndView();
    }
}

void Unit::AddPetAura(PetAura const* petSpell)
{
    m_petAuras.insert(petSpell);
    if (Pet* pet = GetPet())
        pet->CastPetAura(petSpell);
}

void Unit::RemovePetAura(PetAura const* petSpell)
{
    m_petAuras.erase(petSpell);
    if (Pet* pet = GetPet())
        pet->RemoveAurasDueToSpell(petSpell->GetAura(pet->GetEntry()));
}

void Unit::RemoveAurasAtMechanicImmunity(uint32 mechMask, uint32 exceptSpellId, bool non_positive /*= false*/)
{
    Unit::SpellAuraHolderMap& auras = GetSpellAuraHolderMap();
    for (Unit::SpellAuraHolderMap::iterator iter = auras.begin(); iter != auras.end();)
    {
        SpellEntry const *spell = iter->second->GetSpellProto();
        if (spell->Id == exceptSpellId)
            ++iter;
        else if (non_positive && iter->second->IsPositive())
            ++iter;
        else if (spell->Attributes & SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)
            ++iter;
        else if (iter->second->HasMechanicMask(mechMask))
        {
            RemoveAurasDueToSpell(spell->Id);

            if (auras.empty())
                break;
            else
                iter = auras.begin();
        }
        else
            ++iter;
    }
}

void Unit::NearTeleportTo(float x, float y, float z, float orientation, uint32 teleportOptions)
{
    DisableSpline();

    if (GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->TeleportTo(GetMapId(), x, y, z, orientation, teleportOptions);
    else
    {
        Creature* c = (Creature*)this;
        // Creature relocation acts like instant movement generator, so current generator expects interrupt/reset calls to react properly
        if (!c->GetMotionMaster()->empty())
            if (MovementGenerator *movgen = c->GetMotionMaster()->top())
                movgen->Interrupt(*c);

        GetMap()->CreatureRelocation((Creature*)this, x, y, z, orientation);
        SendHeartBeat();

        // finished relocation, movegen can different from top before creature relocation,
        // but apply Reset expected to be safe in any case
        if (!c->GetMotionMaster()->empty())
            if (MovementGenerator *movgen = c->GetMotionMaster()->top())
                movgen->Reset(*c);
    }
}

void Unit::NearLandTo(float x, float y, float z, float orientation)
{
    m_movementInfo.RemoveMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR);
    m_movementInfo.ChangePosition(x, y, z, orientation);
    m_movementInfo.UpdateTime(WorldTimer::getMSTime());
    m_movementInfo.ctime = 0; // Not a client packet. Pauses interpolation.

    WorldPacket data(MSG_MOVE_FALL_LAND, 41);
    data << GetPackGUID();
    data << m_movementInfo;
    SendMovementMessageToSet(std::move(data), true);
    TeleportPositionRelocation(x, y, z, orientation);
    DisableSpline();
}

void Unit::TeleportPositionRelocation(float x, float y, float z, float orientation)
{
    Player* player = ToPlayer();
    Creature* crea = ToCreature();
    uint32 old_zone = 0;
    if (player)
    {
        player->SetPosition(x, y, z, orientation, true);
        player->m_movementInfo.ChangePosition(x, y, z, orientation);
        player->m_movementInfo.UpdateTime(WorldTimer::getMSTime());
    }
    else if (crea)
    {
        if (!crea->GetMotionMaster()->empty())
            if (MovementGenerator *movgen = crea->GetMotionMaster()->top())
                movgen->Interrupt(*crea);
        GetMap()->CreatureRelocation(crea, x, y, z, orientation);
    }

    // new zone
    if (player)
    {
        uint32 newzone, newarea;
        GetZoneAndAreaId(newzone, newarea);
        if (old_zone != newzone)
            player->UpdateZone(newzone, newarea);
        // honorless target
        if (!player->pvpInfo.inHostileArea)
            player->RemoveDelayedOperation(DELAYED_CAST_HONORLESS_TARGET);
    }
    else if (crea)
    {
        if (!crea->GetMotionMaster()->empty())
            if (MovementGenerator *movgen = crea->GetMotionMaster()->top())
                movgen->Reset(*crea);
    }
}

void Unit::MonsterMoveWithSpeed(float x, float y, float z, float o, float speed, uint32 options)
{
    Movement::MoveSplineInit init(*this, "MonsterMoveWithSpeed");
    init.MoveTo(x, y, z, options);
    if (speed > 0.0f)
        init.SetVelocity(speed);
    if (o > -7.0f)
        init.SetFacing(o);
    init.Launch();
}

struct SetPvPHelper
{
    explicit SetPvPHelper(bool _state) : state(_state) {}
    void operator()(Unit* unit) const
    {
        unit->SetPvP(state);
    }
    bool state;
};

void Unit::SetPvP(bool state)
{
    if (state)
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
    else
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);

    if (GetTypeId() == TYPEID_PLAYER && ((Player*)this)->GetGroup())
        ((Player*)this)->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_STATUS);

    CallForAllControlledUnits(SetPvPHelper(state), CONTROLLED_PET | CONTROLLED_TOTEMS | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

void Unit::KnockBackFrom(WorldObject* target, float horizontalSpeed, float verticalSpeed)
{
    float angle = this == target ? GetOrientation() + M_PI_F : target->GetAngle(this);

    // set immune anticheat and calculate speed
    if (Player* plr = ToPlayer())
    {
        plr->SetLaunched(true);
        plr->SetXYSpeed(horizontalSpeed);
    }

    KnockBack(angle, horizontalSpeed, verticalSpeed);
}

void Unit::KnockBack(float angle, float horizontalSpeed, float verticalSpeed)
{
    InterruptNonMeleeSpells(false);

    // Effect properly implemented only for players
    if (GetTypeId() == TYPEID_PLAYER)
    {
        float vsin = sin(angle);
        float vcos = cos(angle);
        WorldPacket data(SMSG_MOVE_KNOCK_BACK, 8 + 4 + 4 + 4 + 4 + 4);
        data << GetPackGUID();
        data << uint32(0);                                  // Sequence
        data << float(vcos);                                // x direction
        data << float(vsin);                                // y direction
        data << float(horizontalSpeed);                     // Horizontal speed
        data << float(-verticalSpeed);                      // Z Movement speed (vertical)
        SendMovementMessageToSet(std::move(data), true);

        ToPlayer()->GetCheatData()->KnockBack(horizontalSpeed, verticalSpeed, vcos, vsin);
    }
}

struct StopAttackFactionHelper
{
    explicit StopAttackFactionHelper(uint32 _faction_id) : faction_id(_faction_id) {}
    void operator()(Unit* unit) const
    {
        unit->StopAttackFaction(faction_id);
    }
    uint32 faction_id;
};

void Unit::StopAttackFaction(uint32 faction_id)
{
    if (Unit* victim = getVictim())
    {
        if (victim->getFactionTemplateEntry()->faction == faction_id)
        {
            AttackStop();
            if (IsNonMeleeSpellCasted(false))
                InterruptNonMeleeSpells(false);

            // melee and ranged forced attack cancel
            if (GetTypeId() == TYPEID_PLAYER)
                ((Player*)this)->SendAttackSwingCancelAttack();
        }
    }

    AttackerSet const& attackers = getAttackers();
    for (AttackerSet::const_iterator itr = attackers.begin(); itr != attackers.end();)
    {
        if ((*itr)->getFactionTemplateEntry()->faction == faction_id)
        {
            (*itr)->AttackStop();
            itr = attackers.begin();
        }
        else
            ++itr;
    }

    getHostileRefManager().deleteReferencesForFaction(faction_id);

    CallForAllControlledUnits(StopAttackFactionHelper(faction_id), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

void Unit::CleanupDeletedAuras()
{
    for (SpellAuraHolderList::const_iterator iter = m_deletedHolders.begin(); iter != m_deletedHolders.end(); ++iter)
    {
        if ((*iter)->IsInUse())
        {
            // Use case:
            // - Spell damage
            // - Player::SetDeathState
            // - Pet::AddObjectToRemoveList
            // Seen happening with spells like [Health Funnel], [Tainted Blood]
            ACE_Stack_Trace st;
            sLog.outInfo("[Crash/Auras] Deleting aura holder %u in use (%s)", (*iter)->GetId(), GetObjectGuid().GetString().c_str());
            sLog.outInfo("%s", st.c_str());
        }
        else
            delete *iter;
    }
    m_deletedHolders.clear();

    // really delete auras "deleted" while processing its ApplyModify code
    for (AuraList::const_iterator iter = m_deletedAuras.begin(); iter != m_deletedAuras.end(); ++iter)
    {
        if ((*iter)->IsInUse())
        {
            ACE_Stack_Trace st;
            sLog.outInfo("[Crash/Auras] Deleting aura %u in use (%s)", (*iter)->GetId(), GetObjectGuid().GetString().c_str());
            sLog.outInfo("%s", st.c_str());
        }
        else
            delete *iter;
    }
    m_deletedAuras.clear();
}

bool Unit::CheckAndIncreaseCastCounter()
{
    uint32 maxCasts = sWorld.getConfig(CONFIG_UINT32_MAX_SPELL_CASTS_IN_CHAIN);

    if (maxCasts && m_castCounter >= maxCasts)
        return false;

    ++m_castCounter;
    return true;
}

SpellAuraHolder* Unit::GetSpellAuraHolder(uint32 spellid) const
{
    SpellAuraHolderMap::const_iterator itr = m_spellAuraHolders.find(spellid);
    return itr != m_spellAuraHolders.end() ? itr->second : NULL;
}

SpellAuraHolder* Unit::GetSpellAuraHolder(uint32 spellid, ObjectGuid casterGuid) const
{
    SpellAuraHolderConstBounds bounds = GetSpellAuraHolderBounds(spellid);
    for (SpellAuraHolderMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
        if (iter->second->GetCasterGuid() == casterGuid)
            return iter->second;

    return nullptr;
}


class RelocationNotifyEvent : public BasicEvent
{
public:
    RelocationNotifyEvent(Unit& owner) : BasicEvent(), m_owner(owner)
    {
        m_owner._SetAINotifyScheduled(true);
    }

    bool Execute(uint64 /*e_time*/, uint32 /*p_time*/)
    {
        float radius = sWorld.getConfig(CONFIG_FLOAT_MAX_CREATURE_ATTACK_RADIUS) * sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
        if (m_owner.GetTypeId() == TYPEID_PLAYER)
        {
            MaNGOS::PlayerRelocationNotifier notify((Player&)m_owner);
            Cell::VisitAllObjects(&m_owner, notify, radius);
        }
        else //if(m_owner.GetTypeId() == TYPEID_UNIT)
        {
            MaNGOS::CreatureRelocationNotifier notify((Creature&)m_owner);
            Cell::VisitAllObjects(&m_owner, notify, radius);
        }
        m_owner._SetAINotifyScheduled(false);
        return true;
    }

    void Abort(uint64)
    {
        m_owner._SetAINotifyScheduled(false);
    }

private:
    Unit& m_owner;
};

void Unit::ScheduleAINotify(uint32 delay)
{
    if (!delay)
    {
        // Instant
        RelocationNotifyEvent event(*this);
        event.Execute(0, 0);
        return;
    }
    if (!IsAINotifyScheduled())
        m_Events.AddEvent(new RelocationNotifyEvent(*this), m_Events.CalculateTime(delay));
}

void Unit::OnRelocated()
{
    // switch to use G3D::Vector3 is good idea, maybe
    float dx = m_last_notified_position.x - GetPositionX();
    float dy = m_last_notified_position.y - GetPositionY();
    float dz = m_last_notified_position.z - GetPositionZ();
    float distsq = dx * dx + dy * dy + dz * dz;
    if (distsq > World::GetRelocationLowerLimitSq())
    {
        m_last_notified_position.x = GetPositionX();
        m_last_notified_position.y = GetPositionY();
        m_last_notified_position.z = GetPositionZ();

        if (IsInWorld() && !m_needUpdateVisibility)
            AddDelayedAction(OBJECT_DELAYED_ADD_TO_RELOCATED_LIST);
    }
    ScheduleAINotify(World::GetRelocationAINotifyDelay());
}

void Unit::ProcessRelocationVisibilityUpdates()
{
    m_needUpdateVisibility = false;
    if (!IsInWorld())
        return;

    GetViewPoint().Call_UpdateVisibilityForOwner(); // HEAVY LOAD
    UpdateObjectVisibility();
}

// BEGIN Nostalrius specific functions
void Unit::InterruptSpellsCastedOnMe(bool killDelayed, bool interruptPositiveSpells)
{
    std::list<Unit*> targets;
    // Maximum spell range=100m ?
    MaNGOS::AnyUnitInObjectRangeCheck u_check(this, 100.0f);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    // Don't need to use visibility modifier, units won't be able to cast outside of draw distance
    Cell::VisitAllObjects(this, searcher, GetMap()->GetVisibilityDistance());
    for (std::list<Unit*>::iterator iter = targets.begin(); iter != targets.end(); ++iter)
    {
        if (!interruptPositiveSpells && IsFriendlyTo(*iter))
            continue;
        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; i++)
            if (Spell *spell = (*iter)->GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->m_targets.getUnitTargetGuid() == GetObjectGuid())
                    if (killDelayed || (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime()) || i == CURRENT_CHANNELED_SPELL)
                        (*iter)->InterruptSpell(CurrentSpellTypes(i), true);
        if (!killDelayed)
            continue;
        // 2/ Interruption des sorts qui ne sont plus reference, mais dont il reste un event (ceux en parcours par exemple)
        auto i_Events = (*iter)->m_Events.GetEvents().begin();
        for (; i_Events != (*iter)->m_Events.GetEvents().end(); ++i_Events)
            if (SpellEvent* event = dynamic_cast<SpellEvent*>(i_Events->second))
                if (event && event->GetSpell()->m_targets.getUnitTargetGuid() == GetObjectGuid())
                    if (event->GetSpell()->getState() != SPELL_STATE_FINISHED)
                        event->GetSpell()->cancel();
    }
}

void Unit::InterruptAttacksOnMe(float dist)
{
    if (dist == 0.0f)
        dist = GetMap()->GetVisibilityDistance();

    // Must use modifier, otherwise long range auto attacks will not toggle
    dist += GetVisibilityModifier();

    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, dist);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, dist);
    for (std::list<Unit*>::iterator iter = targets.begin(); iter != targets.end(); ++iter)
    {
        if ((*iter)->getVictim() != this)
            continue;
        (*iter)->AttackStop();
        if (Player* pAttacker = (*iter)->ToPlayer())
            pAttacker->SendAttackSwingCancelAttack();
    }
}

void Unit::CombatStopInRange(float dist)
{
    if (dist == 0.0f)
        dist = GetMap()->GetVisibilityDistance();

    // must check with modifier, otherwise we could combat bug
    dist += GetVisibilityModifier();

    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, dist);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, dist);
    for (std::list<Unit*>::iterator iter = targets.begin(); iter != targets.end(); ++iter)
        (*iter)->CombatStopWithPets(true);
}

uint32 Unit::DespawnNearCreaturesByEntry(uint32 entry, float range)
{
    std::list<Creature*> creatures;
    GetCreatureListWithEntryInGrid(creatures, entry, range);
    uint32 count = 0;
    for (std::list<Creature*>::iterator it = creatures.begin(); it != creatures.end(); ++it)
    {
        if ((*it)->IsInWorld())
        {
            ++count;
            (*it)->DisappearAndDie();
        }
    }
    return count;
}

uint32 Unit::RespawnNearCreaturesByEntry(uint32 entry, float range)
{
    if (range == 0.0f)
        range = GetMap()->GetVisibilityDistance();
    uint32 count = 0;
    std::list<Creature*> lList;
    GetCreatureListWithEntryInGrid(lList, entry, range);
    for (std::list<Creature*>::iterator it = lList.begin(); it != lList.end(); ++it)
    {
        if (!(*it)->isAlive())
        {
            (*it)->Respawn();
            ++count;
        }
    }
    return count;
}


uint32 Unit::DespawnHostileCreaturesInRange(float range)
{
    if (range == 0.0f)
        range = GetMap()->GetVisibilityDistance();
    uint32 count = 0;
    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, range);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, range);
    for (std::list<Unit*>::iterator iter = targets.begin(); iter != targets.end(); ++iter)
    {
        if ((*iter)->GetTypeId() == TYPEID_UNIT)
        {
            ++count;
            (*iter)->AddObjectToRemoveList();
        }
    }
    return count;
}

bool Unit::IsWithinMeleeRange(const Unit *obj, float dist) const
{
    if (!obj || !IsInMap(obj))
        return false;

    float dx = GetPositionX() - obj->GetPositionX();
    float dy = GetPositionY() - obj->GetPositionY();
    float dz = GetPositionZ() - obj->GetPositionZ();
    float distsq = dx * dx + dy * dy + dz * dz;

    float maxdist = dist + BASE_MELEERANGE_OFFSET + GetMeleeReach() + obj->GetObjectBoundingRadius();

    if (maxdist < ATTACK_DISTANCE)
        maxdist = ATTACK_DISTANCE;

    return distsq < maxdist * maxdist;
}

// TriniyCore
void Unit::GetRandomAttackPoint(const Unit* attacker, float &x, float &y, float &z) const
{
    // Compute random angle
    float angle = GetAngle(attacker);
    float sizeFactor = GetObjectBoundingRadius() + attacker->GetObjectBoundingRadius();
    if (sizeFactor < 0.1f)
        sizeFactor = DEFAULT_COMBAT_REACH;

    uint32 attacker_number = getAttackers().size();
    if (attacker_number > 0)
        --attacker_number;
    // Don't compute a random position for a moving player
    if (GetTypeId() == TYPEID_PLAYER && IsMoving())
        attacker_number = 0;
    angle += (attacker_number ? ((float(M_PI / 2) - float(M_PI) * rand_norm_f()) * attacker_number / sizeFactor) * 0.3f : 0);

    float dist = attacker->GetObjectBoundingRadius() + GetObjectBoundingRadius() + rand_norm_f() * (attacker->GetMeleeReach() - attacker->GetObjectBoundingRadius());
    float initialPosX, initialPosY, initialPosZ, o;
    GetPosition(initialPosX, initialPosY, initialPosZ);

    // Moving player: try to interpolate movement a bit
    if (GetTypeId() == TYPEID_PLAYER && IsMoving())
        if (!ToPlayer()->GetCheatData()->InterpolateMovement(m_movementInfo, 200, initialPosX, initialPosY, initialPosZ, o))
            GetPosition(initialPosX, initialPosY, initialPosZ);

    float attackerTargetDistance = sqrt(pow(initialPosX - attacker->GetPositionX(), 2) +
                                        pow(initialPosY - attacker->GetPositionY(), 2) +
                                        pow(initialPosZ - attacker->GetPositionZ(), 2));
    if (dist > attackerTargetDistance)
    {
        // On ne bouge pas, on est deja a portee.
        attacker->GetPosition(x, y, z);
        return;
    }
    float normalizedVectZ = (attacker->GetPositionZ() - initialPosZ) / attackerTargetDistance;
    float normalizedVectXY = sqrt(1 - normalizedVectZ * normalizedVectZ);
    x = initialPosX + dist * cos(angle) * normalizedVectXY;
    y = initialPosY + dist * sin(angle) * normalizedVectXY;
    z = initialPosZ + dist * normalizedVectZ;

    if ((attacker->CanFly() || (attacker->CanSwim() && IsInWater())))
    {
        GetMap()->GetLosHitPosition(initialPosX, initialPosY, initialPosZ, x, y, z, -0.2f);
        if (attacker->CanFly())
            return;
        float ground = 0.0f;
        float waterSurface = GetTerrain()->GetWaterLevel(x, y, z, &ground);
        if (waterSurface == VMAP_INVALID_HEIGHT_VALUE)
            waterSurface = GetPositionZ();
        if (z > waterSurface)
            z = waterSurface;
        if (z < ground)
            z = ground;
    }
    else
    {
        uint32 nav = NAV_GROUND | NAV_WATER;
        if (attacker->GetTypeId() != TYPEID_PLAYER)
            nav |= NAV_MAGMA | NAV_SLIME;
        // Try mmaps. On fail, use target position (but should not fail)
        if (!GetMap()->GetWalkHitPosition(GetTransport(), initialPosX, initialPosY, initialPosZ, x, y, z, nav))
            GetPosition(x, y, z);
    }
}

float Unit::GetMeleeReach() const
{
	return GetCombatReach(true);
}

float Unit::GetCombatReach(bool forMeleeRange /*=true*/) const
{
	float reach = GetFloatValue(UNIT_FIELD_COMBATREACH);
	return (forMeleeRange && reach < 1.5f) ? 1.5f : reach;
}

float Unit::GetCombatReach(Unit const* pVictim, bool forMeleeRange /*=true*/, float flat_mod /*=0.0f*/) const
{
    float victimReach = (pVictim && pVictim->IsInWorld())
        ? pVictim->GetCombatReach(forMeleeRange)
        : 0.0f;

    float reach = GetCombatReach(forMeleeRange) + victimReach + flat_mod;

    if (forMeleeRange)
    {
        reach += BASE_MELEERANGE_OFFSET;
        if (reach < ATTACK_DISTANCE)
            reach = ATTACK_DISTANCE;
    }

    // Melee leeway mechanic.
    // When both player and target has > 70% of normal runspeed, and are moving,
    // the player gains an additional 2.5yd of melee range.
    if (IsPlayer())
    {
        static const float leewayMinSpeed = 4.97f;
        if (GetXZFlagBasedSpeed(this) > leewayMinSpeed && GetXZFlagBasedSpeed(pVictim) > leewayMinSpeed)
            reach += 2.5f;
    }

    return reach;
}

bool Unit::CanReachWithMeleeAttack(Unit const* pVictim, float flat_mod /*= 0.0f*/) const
{
    float x = GetPositionX(), y = GetPositionY(), z = GetPositionZ();

    return CanReachWithMeleeAttackAtPosition(pVictim, x, y, z, flat_mod);
}

bool Unit::CanReachWithMeleeAttackAtPosition(Unit const* pVictim, float x, float y, float z, float flat_mod /*= 0.0f*/) const
{
    if (!pVictim || !pVictim->IsInWorld())
        return false;

    float reach = GetCombatReach(pVictim, true, flat_mod);

    float dx = x - pVictim->GetPositionX();
    float dy = y - pVictim->GetPositionY();
    float dz = z - pVictim->GetPositionZ();

    // Some units have long Z reach (tall), use whichever is highest of the victim Z limit or
    // the unit's Z reach
    float victimZLimit = pVictim->GetMeleeZLimit();
    float zReach = m_meleeZReach > victimZLimit ? m_meleeZReach : victimZLimit;
    return (dx * dx + dy * dy < reach * reach) && ((dz * dz) < zReach);
}

bool Unit::CanReachWithMeleeSpellAttack(Unit const* pVictim, float flat_mod /*= 0.0f*/) const
{
    if (!pVictim || !pVictim->IsInWorld())
        return false;

    float reach = GetCombatReach(pVictim, true, flat_mod);

    // This check is not related to bounding radius
    float dx = GetPositionX() - pVictim->GetPositionX();
    float dy = GetPositionY() - pVictim->GetPositionY();

    // melee spells ignore Z-axis checks
    return dx * dx + dy * dy < reach * reach;
}

Unit* Unit::GetUnit(WorldObject &obj, uint64 const &Guid)
{
    if (obj.IsInWorld())
        return obj.GetMap()->GetUnit(ObjectGuid(Guid));
    return nullptr;
}

Unit* Unit::SummonCreatureAndAttack(uint32 creatureEntry, Unit* pVictim)
{
    float summonX, summonY, summonZ, summonAng;
    summonX = GetPositionX();
    summonY = GetPositionY();
    summonZ = GetPositionZ();
    summonAng = GetOrientation();

    if (!pVictim)
        if (!(pVictim = getVictim()))
            return nullptr;

    if (Creature *pCreature = SummonCreature(creatureEntry, summonX, summonY, summonZ, summonAng, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000))
    {
        if (pCreature->AI())
            pCreature->AI()->AttackStart(pVictim);
        return pCreature;
    }
    return nullptr;
}

bool Unit::IsCaster()
{
    // Cast en cours : on est casteur.
    if (IsNonMeleeSpellCasted(true, false, true))
        return true;

    switch (getClass())
    {
        case CLASS_WARRIOR:
        case CLASS_ROGUE:
            return false;
        case CLASS_MAGE:
        case CLASS_PRIEST:
        case CLASS_SHAMAN:
        case CLASS_HUNTER:
        case CLASS_WARLOCK:
            return true;
        // Pala heal si faveur divine. Sinon CaC.
        case CLASS_PALADIN:
            return HasSpell(20216);
        // Druide caster ?
        case CLASS_DRUID:
            if (HasAura(14858)) // Forme de Selenien
                return true;
            if (HasAuraType(SPELL_AURA_MOD_SHAPESHIFT)) // Dans une forme (donc CaC, ou voyage ou aquatique)
                return false;
            return true; // Pas en changeforme, on suppose qu'il est casteur.
        default:
            return false;
    }
}

void Unit::EnterVanish()
{
    SetVisibility(VISIBILITY_OFF);
    SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
    InterruptSpellsCastedOnMe(true);
    InterruptAttacksOnMe();
    AttackStop();
    InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
    // DoResetThreat :
    if (Creature* pCrea = ToCreature())
    {
        if (!pCrea->CanHaveThreatList() || pCrea->getThreatManager().isThreatListEmpty())
            return;

        ThreatList const& tList = pCrea->getThreatManager().getThreatList();
        for (ThreatList::const_iterator itr = tList.begin(); itr != tList.end(); ++itr)
        {
            Unit* pUnit = pCrea->GetMap()->GetUnit((*itr)->getUnitGuid());

            if (pUnit && pCrea->getThreatManager().getThreat(pUnit))
                pCrea->getThreatManager().modifyThreatPercent(pUnit, -100);
        }
    }
}

void Unit::LeaveVanish()
{
    SetVisibility(VISIBILITY_ON);
    RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FIELD_FLAGS);
}

void Unit::Ambush(Unit* pNewVictim, uint32 embushSpellId)
{
    if (!pNewVictim)
        return;
    if (Creature* pCrea = ToCreature())
    {
        // Se position derriere
        float x, y, z;
        pNewVictim->GetRelativePositions(-4.0f, 0.0f, 0.0f, x, y, z);
        pCrea->NearTeleportTo(x, y, z, 0.0f);
        pCrea->SetFacingToObject(pNewVictim);
        // Embush
        if (embushSpellId)
            pCrea->CastSpell(pNewVictim, embushSpellId, true);
        if (pCrea->AI())
            pCrea->AI()->AttackStart(pNewVictim);
    }
}

bool Unit::isAttackableByAOE(bool requireDeadTarget) const
{
    if (isAlive() == requireDeadTarget)
        return false;

    if (HasFlag(UNIT_FIELD_FLAGS,
                UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE))
        return false;

    if (GetTypeId() == TYPEID_PLAYER && ToPlayer()->isGameMaster())
        return false;

    return true;
}

bool Unit::IsImmuneToSchoolMask(uint32 schoolMask) const
{
    AuraList const& immune = GetAurasByType(SPELL_AURA_SCHOOL_IMMUNITY);

    uint32 immuneMask = 0;
    for (AuraList::const_iterator itr = immune.begin(); itr != immune.end(); ++itr)
    {
        immuneMask |= (*itr)->GetModifier()->m_miscvalue;
        if (immuneMask & schoolMask)             // Immunise
            return true;
    }
    return false;
}

void Unit::ProhibitSpellSchool(SpellSchoolMask idSchoolMask, uint32 unTimeMs)
{
    // Still needed ... ?
    ProhibitSpellInfo inf;
    inf.SchoolMask = idSchoolMask;
    inf.RestingMsTime = unTimeMs;
    m_prohibitSpell.push_back(inf);
}

bool Unit::IsSpellProhibited(SpellEntry const* pSpell)
{
    uint32 spellSchoolMask = GetSpellSchoolMask(pSpell);
    for (ProhibitSpellList::const_iterator it = m_prohibitSpell.begin(); it != m_prohibitSpell.end(); ++it)
    {
        if (it->SchoolMask & spellSchoolMask)
            return true;
    }
    return false;
}

bool Unit::HasProhibitedSpell()
{
    return (m_prohibitSpell.size() > 0);
}

CreatureAI* Unit::AI() const
{
    return GetTypeId() == TYPEID_UNIT ? ((Creature*)this)->AI() : NULL;
}

SpellAuraHolder* Unit::AddAura(uint32 spellId, uint32 addAuraFlags, Unit* pCaster)
{
    if (IsDeleted() || (pCaster && pCaster->IsDeleted()))
        return nullptr;

    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return nullptr;

    if (!IsSpellAppliesAura(spellInfo, (1 << EFFECT_INDEX_0) | (1 << EFFECT_INDEX_1) | (1 << EFFECT_INDEX_2)) &&
            !IsSpellHaveEffect(spellInfo, SPELL_EFFECT_PERSISTENT_AREA_AURA))
    {
        sLog.outError("Impossible d'appliquer le sort %u : il n'a pas d'aura !", spellInfo->Id);
        return nullptr;
    }

    if (!pCaster)
        pCaster = this;

    SpellAuraHolder *holder = CreateSpellAuraHolder(spellInfo, this, pCaster);
    if (!holder)
        return nullptr;

    if (addAuraFlags & ADD_AURA_PASSIVE)
        holder->SetPassive(true);
    if (addAuraFlags & ADD_AURA_PERMANENT)
        holder->SetPermanent(true);

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        uint8 eff = spellInfo->Effect[i];
        if (eff >= TOTAL_SPELL_EFFECTS)
            continue;

        if (IsAreaAuraEffect(eff)           ||
                eff == SPELL_EFFECT_APPLY_AURA  ||
                eff == SPELL_EFFECT_PERSISTENT_AREA_AURA)
        {
            Aura *aur = CreateAura(spellInfo, SpellEffectIndex(i), nullptr, holder, this, pCaster);
            if (addAuraFlags & ADD_AURA_POSITIVE)
                aur->SetPositive(true);
            else if (addAuraFlags & ADD_AURA_NEGATIVE)
                aur->SetPositive(true);

            holder->AddAura(aur, SpellEffectIndex(i));
        }
    }
    if (!AddSpellAuraHolder(holder))
        holder = nullptr;
    return holder;
}

SpellAuraHolder* Unit::RefreshAura(uint32 spellId, int32 duration)
{
    if (SpellAuraHolder *holder = GetSpellAuraHolder(spellId))
    {
        holder->SetAuraDuration(duration);
        holder->UpdateAuraDuration();
        return holder;
    }
    return nullptr;
}

bool Unit::HasMorePowerfullSpellActive(SpellEntry const* spell)
{
    std::list<uint32> morePowerfullSpells;
    if (!sSpellMgr.ListMorePowerfullSpells(spell->Id, morePowerfullSpells))
        return false;
    for (SpellAuraHolderMap::const_iterator i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
        for (std::list<uint32>::const_iterator it = morePowerfullSpells.begin(); it != morePowerfullSpells.end(); ++it)
            if ((*it) == i->first)
                return true;
    return false;
}

Aura* Unit::GetMostImportantAuraAfter(Aura const* like, Aura const* except)
{
    ASSERT(like);
    AuraType auraName = like->GetModifier()->m_auraname;

    // Certains area aura (Cf AreaAura::AreaAura), exemple 8836, 10626
    if (auraName == SPELL_AURA_NONE)
        return nullptr;

    if (auraName >= TOTAL_AURAS)
    {
        sLog.outInfo("[AURASTACK][%u] auraName %u invalide.", like->GetId(), auraName);
        return nullptr;
    }

    Aura* currMostImportant = nullptr;
    for (AuraList::iterator iter = m_modAuras[auraName].begin(); iter != m_modAuras[auraName].end(); ++iter)
    {
        if (!(*iter)->IsExclusive() || (*iter) == except)
            continue;
        if (!currMostImportant)
        {
            int checkResult = (*iter)->CheckExclusiveWith(like);
            // On veut un aura de meme type que 'like'. Osef qu'il soit mieux ou moins bien ici.
            if (checkResult > 0)
                currMostImportant = (*iter);
        }
        else
        {
            int checkResult = (*iter)->CheckExclusiveWith(currMostImportant);
            // '*iter' doit etre mieux que 'currMostImportant'
            if (checkResult == 1)
                currMostImportant = (*iter);
        }
    }
    if (currMostImportant)
    {
        // A-t-on trouve ce qu'il faut ?
        // Different de 'except'
        ASSERT(currMostImportant != except);
        // Et de meme type que 'like'.
        ASSERT(currMostImportant->CheckExclusiveWith(like) > 0);
    }
    return currMostImportant;
}

// Nostalrius : Ivina
void Unit::SetLastCastedSpell(uint32 spell_id, bool byclient)
{
    if (spell_id != 23303 && spell_id != 836)
        m_lastCastedSpellID = spell_id;
}

uint32 Unit::GetLastCastedSpell(bool byclientonly)
{
    if (byclientonly)
        return 0;
    else
        return m_lastCastedSpellID;
}

uint32 Unit::GetLastAttackType()
{
    return m_lastAttackType;
}

void Unit::SetLastAttackType(uint32 attackType)
{
    m_lastAttackType = attackType;
}

void Unit::UpdateSplineMovement(uint32 t_diff)
{
    if (movespline->Finalized())
        return;

    movespline->updateState(t_diff);
    bool arrived = movespline->Finalized();

    if (arrived)
        DisableSpline();
    else if (!movespline->isCyclic() && movespline->getLastPointSent() >= 0 && movespline->getLastPointSent() < (movespline->currentPathIdx() + 3))
    {
        WorldPacket data(SMSG_MONSTER_MOVE, 64);
        data << GetPackGUID();
        movespline->setLastPointSent(Movement::PacketBuilder::WriteMonsterMove(*movespline, data, movespline->getLastPointSent() + 1));
        SendMovementMessageToSet(std::move(data), true);
    }

    Movement::Location loc = movespline->ComputePosition();
    if (Transport* t = GetTransport())
    {
        m_movementInfo.GetTransportPos()->x = loc.x;
        m_movementInfo.GetTransportPos()->y = loc.y;
        m_movementInfo.GetTransportPos()->z = loc.z;
        m_movementInfo.GetTransportPos()->o = loc.orientation;
        t->CalculatePassengerPosition(loc.x, loc.y, loc.z, &loc.orientation);
    }
    if (!MaNGOS::IsValidMapCoord(loc.x, loc.y, loc.z))
        return;

    if (GetTypeId() == TYPEID_PLAYER)
        ((Player*)this)->SetPosition(loc.x, loc.y, loc.z, loc.orientation);
    else
        GetMap()->CreatureRelocation((Creature*)this, loc.x, loc.y, loc.z, loc.orientation);
}

void Unit::MonsterMove(float x, float y, float z)
{
    MonsterMoveWithSpeed(x, y, z, -10.0f, GetSpeed(MOVE_RUN), 0u);
}


void Unit::SetWalk(bool enable, bool asDefault)
{
    if (asDefault)
    {
        if (enable)
            clearUnitState(UNIT_STAT_RUNNING);
        else
            addUnitState(UNIT_STAT_RUNNING);
    }

    if (enable == m_movementInfo.HasMovementFlag(MOVEFLAG_WALK_MODE))
        return;

    if (enable)
        m_movementInfo.AddMovementFlag(MOVEFLAG_WALK_MODE);
    else
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_WALK_MODE);

    WorldPacket data(enable ? SMSG_SPLINE_MOVE_SET_WALK_MODE : SMSG_SPLINE_MOVE_SET_RUN_MODE, 9);
    data << GetPackGUID();
    if (Player* me = ToPlayer())
        me->GetSession()->SendPacket(&data);
    else
        SendObjectMessageToSet(&data, false);
}

void Unit::SetLevitate(bool enable)
{
    if (enable)
        m_movementInfo.AddMovementFlag(MOVEFLAG_LEVITATING);
    else
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_LEVITATING);
}

void Unit::SetFly(bool enable)
{
    if (enable)
        m_movementInfo.AddMovementFlag(MOVEFLAG_FLYING | MOVEFLAG_CAN_FLY);
    else
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_FLYING | MOVEFLAG_CAN_FLY);
}

void Unit::DisableSpline()
{
    if (Player* me = ToPlayer())
        me->SetFallInformation(0, me->GetPositionZ());
    m_movementInfo.RemoveMovementFlag(MovementFlags(MOVEFLAG_SPLINE_ENABLED | MOVEFLAG_FORWARD));
    movespline->_Interrupt();
}


void Unit::SendSpellGo(Unit* target, uint32 spellId)
{
    SpellCastTargets targets;
    targets.setUnitTarget(target);

    WorldPacket data(SMSG_SPELL_GO, 53);
    data << GetPackGUID();

    data << GetPackGUID();
    data << uint32(spellId);
    data << uint16(CAST_FLAG_UNKNOWN9);

    //WriteSpellGoTargets(&data);
    data << uint8(1);
    data << target->GetObjectGuid();
    data << uint8(0);

    data << targets;
    SendMessageToSet(&data, true);
}

#define PRELOAD if (this == unit) return true; \
const Unit* u1 = GetCharmerOrOwnerOrSelf(); \
const Unit* u2 = unit->GetCharmerOrOwnerOrSelf(); \
if (u1 == u2) return true;


bool Unit::IsInPartyWith(Unit const* unit) const
{
    PRELOAD
    if (u1->IsPlayer() && u2->IsPlayer())
        return u1->ToPlayer()->IsInSameGroupWith(u2->ToPlayer());
    return false;
}

bool Unit::IsInRaidWith(Unit const* unit) const
{
    PRELOAD
    if (u1->IsPlayer() && u2->IsPlayer())
        return u1->ToPlayer()->IsInSameRaidWith(u2->ToPlayer());
    return false;
}

void Unit::Debug(uint32 flags, const char* format, ...) const
{
    if (!format)
        return;
    if (!(flags & _debugFlags))
        return;
    if (_debuggerGuid.IsEmpty())
        return;
    if (!IsInWorld() || !FindMap())
        return;
    Player* player = FindMap()->GetPlayer(_debuggerGuid);
    if (!player)
    {
        Unit* me = (Unit*)this;
        me->_debuggerGuid.Clear();
        me->_debugFlags = 0;
        return;
    }
    va_list ap;
    va_start(ap, format);
    char str[2048];
    vsnprintf(str, 2048, format, ap);
    va_end(ap);
    ChatHandler(player).SendSysMessage(str);
}

class ThreatTransferDo
{
public:
    ThreatTransferDo(Unit* from, Unit* to) : _from(from), _to(to) {}
    void operator()(Unit* unit)
    {
        if (unit == _from || unit == _to)
            return;
        if (!unit->IsValidAttackTarget(_to))
            return;

        if (unit->getThreatManager().getThreat(_from) > 0.1f)
            unit->AddThreat(_to, unit->getThreatManager().getThreat(_from));
        else if (unit->getVictim() == _from && unit->AI()) // Si on aggro sans faire de degat
            unit->AI()->AttackStart(_to);
        else
            return;
        unit->getThreatManager().modifyThreatPercent(_from, -100);
    }
protected:
    Unit* _from;
    Unit* _to;
};

void Unit::TransferAttackersThreatTo(Unit* unit)
{
    ThreatTransferDo u_do(this, unit);
    MaNGOS::CreatureWorker<ThreatTransferDo> worker(this, u_do);
    Cell::VisitGridObjects(this, worker, 50.0f);
}

void Unit::SetMovement(UnitMovementType pType)
{
    switch (pType)
    {
        case MOVE_ROOT:
            m_movementInfo.ChangePosition(GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation());
            m_movementInfo.UpdateTime(WorldTimer::getMSTime());
            m_movementInfo.moveFlags = MOVEFLAG_ROOT | (m_movementInfo.moveFlags & ~MOVEFLAG_MASK_MOVING_OR_TURN);
            break;
        case MOVE_UNROOT:
            m_movementInfo.ChangePosition(GetPositionX(), GetPositionY(), GetPositionZ(), GetOrientation());
            m_movementInfo.UpdateTime(WorldTimer::getMSTime());
            m_movementInfo.moveFlags = (m_movementInfo.moveFlags & ~(MOVEFLAG_MASK_MOVING_OR_TURN | MOVEFLAG_ROOT));
            break;
    }
    WorldPacket data;
    if (!movespline->Finalized())
    {
        // Spline roots are sent here.
        MovementData mvtData(this);
        switch (pType)
        {
            case MOVE_ROOT:
                mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_ROOT, GetObjectGuid());
                return;
            case MOVE_UNROOT:
                mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_UNROOT, GetObjectGuid());
                break;
            case MOVE_WATER_WALK:
                mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_WATER_WALK, GetObjectGuid());
                break;
            case MOVE_LAND_WALK:
                mvtData.SetSplineOpcode(SMSG_SPLINE_MOVE_LAND_WALK, GetObjectGuid());
                break;
        }
        return;
    }
    // Inform controller
    Player* mePlayer = ToPlayer();
    Player* controller = nullptr;
    if (Unit* charmer = GetCharmer())
        if (Player* charmerPlayer = charmer->ToPlayer())
            if (charmerPlayer->GetCharmGuid() == GetObjectGuid())
                controller = charmerPlayer;
    if (!mePlayer && !controller)
        return;

    switch (pType)
    {
        case MOVE_ROOT:
            data.Initialize(SMSG_FORCE_MOVE_ROOT,   GetPackGUID().size() + 4);
            break;
        case MOVE_UNROOT:
            data.Initialize(SMSG_FORCE_MOVE_UNROOT, GetPackGUID().size() + 4);
            break;
        case MOVE_WATER_WALK:
            data.Initialize(SMSG_MOVE_WATER_WALK,   GetPackGUID().size() + 4);
            break;
        case MOVE_LAND_WALK:
            data.Initialize(SMSG_MOVE_LAND_WALK,    GetPackGUID().size() + 4);
            break;
        default:
            sLog.outError("Player::SetMovement: Unsupported move type (%d), data not sent to client.", pType);
            return;
    }
    data << GetPackGUID();
    data << uint32(WorldTimer::getMSTime()); // Peut etre msTime : WorldTimer::getMSTime() ?
    if (mePlayer)
    {
        mePlayer->GetCheatData()->OrderSent(&data);
        mePlayer->GetSession()->SendPacket(&data);

        // We can't send movement info here because it is out-of-date with the client
        // and causes issues with unit speed updates on death/res
        /*if (pType == MOVE_ROOT || pType == MOVE_UNROOT) {
            WorldPacket rootData(pType == MOVE_ROOT ? MSG_MOVE_ROOT : MSG_MOVE_UNROOT, 31);
            rootData << GetPackGUID();
            rootData << m_movementInfo;

            mePlayer->SendMovementMessageToSet(std::move(rootData), false);
        }*/
    }
    if (controller)
        controller->GetSession()->SendPacket(&data);
}

bool Unit::HasBreakableByDamageAuraType(AuraType type, uint32 excludeAura) const
{
    AuraList const& auras = GetAurasByType(type);
    for (AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
        if ((!excludeAura || excludeAura != (*itr)->GetSpellProto()->Id) && //Avoid self interrupt of channeled Crowd Control spells like Seduction
                ((*itr)->GetSpellProto()->AuraInterruptFlags & AURA_INTERRUPT_FLAG_DAMAGE))
            return true;
    return false;
}

bool Unit::HasBreakableByDamageCrowdControlAura(Unit* excludeCasterChannel) const
{
    uint32 excludeAura = 0;
    if (Spell* currentChanneledSpell = excludeCasterChannel ? excludeCasterChannel->GetCurrentSpell(CURRENT_CHANNELED_SPELL) : NULL)
        excludeAura = currentChanneledSpell->m_spellInfo->Id; //Avoid self interrupt of channeled Crowd Control spells like Seduction

    return (HasBreakableByDamageAuraType(SPELL_AURA_MOD_CONFUSE, excludeAura)
            //|| HasBreakableByDamageAuraType(SPELL_AURA_MOD_FEAR, excludeAura)    // no breakable fears in vanilla
            || HasBreakableByDamageAuraType(SPELL_AURA_MOD_STUN, excludeAura)
            //|| HasBreakableByDamageAuraType(SPELL_AURA_MOD_ROOT, excludeAura)    // no breakable roots in vanilla
            || HasBreakableByDamageAuraType(SPELL_AURA_TRANSFORM, excludeAura));
}

void Unit::UpdateControl()
{
    Player* mePlayer = ToPlayer();

    // Inform controller
    if (Unit* charmer = GetCharmer())
        if (Player* charmerPlayer = charmer->ToPlayer())
            if (charmerPlayer->GetCharmGuid() == GetObjectGuid())
                charmerPlayer->SetClientControl(this, !hasUnitState(UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED));
    // Inform myself
    if (mePlayer)
    {
        // Possessing someone ?
        if (Unit* possessed = GetCharm())
            if (possessed->GetCharmerGuid() == GetObjectGuid())
            {
                mePlayer->SetClientControl(possessed, !possessed->hasUnitState(UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED));
                return;
            }
        mePlayer->SetClientControl(mePlayer, !hasUnitState(UNIT_STAT_CONTROLLED | UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED) && !GetCharmerGuid());
    }
}

// select nearest hostile unit within the given distance (regardless of threat list).
Unit* Unit::SelectNearestTarget(float dist) const
{
    CellPair p(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(p);
    cell.SetNoCreate();

    Unit *target = nullptr;

    if (dist == 0.0f || dist > MAX_VISIBILITY_DISTANCE)
        dist = MAX_VISIBILITY_DISTANCE;

    MaNGOS::NearestHostileUnitCheck u_check(this, dist);
    MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitCheck> searcher(target, u_check);

    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
    TypeContainerVisitor<MaNGOS::UnitLastSearcher<MaNGOS::NearestHostileUnitCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

    cell.Visit(p, world_unit_searcher, *GetMap(), *this, dist);
    cell.Visit(p, grid_unit_searcher, *GetMap(), *this, dist);

    return target;
}

float Unit::GetMinChaseDistance(Unit* victim) const
{
    if (_casterChaseDistance > 1.0f)
        return _casterChaseDistance;
    return GetObjectBoundingRadius();
}

float Unit::GetMaxChaseDistance(Unit* victim) const
{
    if (_casterChaseDistance > 1.0f)
        return _casterChaseDistance + GetObjectBoundingRadius() + victim->GetObjectBoundingRadius();
    return GetMeleeReach() + BASE_MELEERANGE_OFFSET;
}

void Unit::RestoreMovement()
{
    if (GetTypeId() != TYPEID_UNIT)
        return;
    // Need restore previous movement since we have no proper states system
    if (isAlive() && !hasUnitState(UNIT_STAT_CONFUSED | UNIT_STAT_FLEEING))
    {
        if (Unit * victim = getVictim())
            GetMotionMaster()->MoveChase(victim);
        else
            GetMotionMaster()->Initialize();
    }
}

/** Spell cooldown management system. Shared by Players, Creatures, Pets, ... */
void Unit::RemoveSpellCooldown(uint32 spell_id, bool update /* = false */)
{
    m_spellCooldowns.erase(spell_id);

    if (update)
        if (Player* player = GetAffectingPlayer())
            player->SendClearCooldown(spell_id, this);
}

bool Unit::HasSpellCategoryCooldown(uint32 cat) const
{
    if (!cat)
        return false;
    for (SpellCooldowns::const_iterator it = m_spellCooldowns.begin(); it != m_spellCooldowns.end(); ++it)
        if (it->second.cat == cat && it->second.categoryEnd > time(nullptr))
            return true;
    return false;
}

void Unit::RemoveSpellCategoryCooldown(uint32 cat, bool update /* = false */)
{
    SpellCategoryStore::const_iterator ct = sSpellCategoryStore.find(cat);
    if (ct == sSpellCategoryStore.end())
        return;

    const SpellCategorySet& ct_set = ct->second;
    for (SpellCooldowns::const_iterator i = m_spellCooldowns.begin(); i != m_spellCooldowns.end();)
    {
        if (ct_set.find(i->first) != ct_set.end())
            RemoveSpellCooldown((i++)->first, update);
        else
            ++i;
    }
}

void Unit::RemoveAllSpellCooldown()
{
    if (!m_spellCooldowns.empty())
    {
        if (Player* player = GetAffectingPlayer())
            for (SpellCooldowns::const_iterator itr = m_spellCooldowns.begin(); itr != m_spellCooldowns.end(); ++itr)
                player->SendClearCooldown(itr->first, this);

        m_spellCooldowns.clear();
    }
}

void Unit::setTransformScale(float scale)
{
    if (!scale)
    {
        sLog.outError("Attempt to set transform scale to 0!");
        return;
    }
    ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X,(scale/m_nativeScaleOverride -1)*100,true);
    m_nativeScaleOverride = scale;
}

void Unit::resetTransformScale()
{
    setTransformScale(getNativeScale());
}

float Unit::getNativeScale() const
{
    return m_nativeScale;
}

void Unit::setNativeScale(float scale)
{
    setTransformScale(scale);
    m_nativeScale = scale;
}

void Unit::CooldownEvent(SpellEntry const *spellInfo, uint32 itemId, Spell* spell)
{
    // start cooldowns at server side, if any
    AddSpellAndCategoryCooldowns(spellInfo, itemId, spell);

    // Send activate cooldown timer (possible 0) at client side
    if (Player* player = GetAffectingPlayer())
    {
        WorldPacket data(SMSG_COOLDOWN_EVENT, (4 + 8));
        data << uint32(spellInfo->Id);
        data << GetObjectGuid();
        player->SendDirectMessage(&data);
    }
}

void Unit::AddSpellAndCategoryCooldowns(SpellEntry const* spellInfo, uint32 itemId, Spell* spell, bool infinityCooldown)
{
    // init cooldown values
    uint32 cat   = 0;
    int32 rec    = -1;
    int32 catrec = -1;

    // some special item spells without correct cooldown in SpellInfo
    // cooldown information stored in item prototype
    // This used in same way in WorldSession::HandleItemQuerySingleOpcode data sending to client.

    if (itemId)
    {
        if (ItemPrototype const* proto = ObjectMgr::GetItemPrototype(itemId))
        {
            for (int idx = 0; idx < MAX_ITEM_PROTO_SPELLS; ++idx)
            {
                if (proto->Spells[idx].SpellId == spellInfo->Id)
                {
                    cat    = proto->Spells[idx].SpellCategory;
                    rec    = proto->Spells[idx].SpellCooldown;
                    catrec = proto->Spells[idx].SpellCategoryCooldown;
                    break;
                }
            }
        }
    }

    // if no cooldown found above then base at DBC data
    if (rec < 0 && catrec < 0)
    {
        cat = spellInfo->Category;
        rec = spellInfo->RecoveryTime;
        catrec = spellInfo->CategoryRecoveryTime;
    }

    time_t curTime = time(nullptr);

    time_t catrecTime;
    time_t recTime;

    // overwrite time for selected category
    if (infinityCooldown)
    {
        // use +MONTH as infinity mark for spell cooldown (will checked as MONTH/2 at save ans skipped)
        // but not allow ignore until reset or re-login
        catrecTime = catrec > 0 ? curTime + infinityCooldownDelay : 0;
        recTime    = rec    > 0 ? curTime + infinityCooldownDelay : catrecTime;
    }
    else
    {
        // shoot spells used equipped item cooldown values already assigned in GetAttackTime(RANGED_ATTACK)
        // prevent 0 cooldowns set by another way
        if (rec <= 0 && catrec <= 0 && (cat == 76 || cat == 351))
            rec = GetAttackTime(RANGED_ATTACK);

        if (rec > 0 || catrec > 0)
        {
            if (Player* modOwner = GetSpellModOwner())
            {
                // Now we have cooldown data (if found any), time to apply mods
                if (rec > 0)
                    modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_COOLDOWN, rec, spell);

                if (catrec > 0)
                    modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_COOLDOWN, catrec, spell);
            }
            if (Player* player = GetAffectingPlayer())
                if (player != this)
                    player->SendSpellCooldown(spellInfo->Id, rec > catrec ? rec : catrec, GetObjectGuid());
        }

        // replace negative cooldowns by 0
        if (rec < 0) rec = 0;
        if (catrec < 0) catrec = 0;

        // Hackfix: minimum cooldown for controlled creatures
        if (!rec && !catrec && GetTypeId() == TYPEID_UNIT && GetCharmerGuid().IsPlayer())
            rec = 1500; // Global cooldown

        // no cooldown after applying spell mods
        if (rec == 0 && catrec == 0)
            return;

        catrecTime = catrec ? curTime + catrec / IN_MILLISECONDS : 0;
        recTime    = rec ? curTime + rec / IN_MILLISECONDS : catrecTime;
    }

    // self spell cooldown
    if (recTime > 0)
        AddSpellCooldown(spellInfo->Id, itemId, recTime, catrecTime, cat);
}

void Unit::AddSpellCooldown(uint32 spellid, uint32 itemid, time_t endTime, time_t categoryEndTime, uint32 cat)
{
    // Do not replace longer cooldown
    SpellCooldowns::iterator it = m_spellCooldowns.find(spellid);
    if (it != m_spellCooldowns.end())
    {
        it->second.end = endTime;
        it->second.categoryEnd = categoryEndTime;
        return;
    }
    SpellCooldown sc;
    sc.end = endTime;
    sc.categoryEnd = categoryEndTime;
    sc.itemid = itemid;
    sc.cat = cat;
    m_spellCooldowns[spellid] = sc;
}


void Unit::WritePetSpellsCooldown(WorldPacket& data)
{
    uint8 cooldownsCount = GetSpellCooldownMap().size();
    data << uint8(cooldownsCount);

    time_t curTime = time(nullptr);

    for (SpellCooldowns::const_iterator itr = GetSpellCooldownMap().begin(); itr != GetSpellCooldownMap().end(); ++itr)
    {
        //time_t cooldown = (itr->second > curTime) ? (itr->second - curTime) * IN_MILLISECONDS : 0;

        data << uint16(itr->first);                                                             // spellid
        data << uint16(0);                                                                      // spell category?
        data << uint32(IN_MILLISECONDS * (itr->second.end - curTime));                          // cooldown
        data << uint32(0);                  // category cooldown
    }
}


void Unit::InitPlayerDisplayIds()
{
    PlayerInfo const *info = sObjectMgr.GetPlayerInfo(getRace(), getClass());
    if (!info)
        return;

    uint8 gender = getGender();

    SetObjectScale(DEFAULT_OBJECT_SCALE);
    switch (gender)
    {
        case GENDER_FEMALE:
            SetDisplayId(info->displayId_f);
            SetNativeDisplayId(info->displayId_f);
            if (getRace() == RACE_TAUREN)
                setNativeScale(DEFAULT_TAUREN_FEMALE_SCALE);
            break;
        case GENDER_MALE:
            SetDisplayId(info->displayId_m);
            SetNativeDisplayId(info->displayId_m);
            if (getRace() == RACE_TAUREN)
                setNativeScale(DEFAULT_TAUREN_MALE_SCALE);
            break;
        default:
            return;
    }

}
