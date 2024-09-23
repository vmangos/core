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
#include "Creature.h"
#include "Pet.h"
#include "Totem.h"
#include "Player.h"
#include "Log.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "SpellMgr.h"
#include "Spell.h"
#include "Group.h"
#include "SpellAuras.h"
#include "ObjectAccessor.h"
#include "CreatureAI.h"
#include "GameObjectAI.h"
#include "TemporarySummon.h"
#include "Formulas.h"
#include "Util.h"
#include "BattleGround.h"
#include "GridNotifiersImpl.h"
#include "CellImpl.h"
#include "DBCStores.h"
#include "VMapFactory.h"
#include "MovementGenerator.h"
#include "Transport.h"
#include "CreatureGroups.h"
#include "ZoneScript.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "packet_builder.h"
#include "Chat.h"
#include "Anticheat.h"
#include "InstanceStatistics.h"
#include "MovementPacketSender.h"

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
// Methods of class Unit

Unit::Unit()
    : SpellCaster(), i_motionMaster(this), m_ThreatManager(this), m_HostileRefManager(this),
      movespline(new Movement::MoveSpline()), m_needUpdateVisibility(false),
      m_AutoRepeatFirstCast(true), m_regenTimer(0), m_lastDamageTaken(0),
      m_meleeZLimit(UNIT_DEFAULT_MELEE_Z_LIMIT), m_meleeZReach(UNIT_DEFAULT_MELEE_Z_LIMIT), m_lastSanctuaryTime(0)
{
    m_objectType |= TYPEMASK_UNIT;
    m_objectTypeId = TYPEID_UNIT;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    m_updateFlag = (UPDATEFLAG_ALL | UPDATEFLAG_LIVING | UPDATEFLAG_HAS_POSITION);
#endif
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

    m_stateFlags = 0;
    m_deathState = ALIVE;
    m_invincibilityHpThreshold = 0;

    //m_Aura = nullptr;
    //m_AurasCheck = 2000;
    //m_removeAuraTimer = 4;
    m_spellAuraHoldersUpdateIterator = m_spellAuraHolders.end();

    m_Visibility = VISIBILITY_ON;
    m_AINotifyScheduled = false;

    m_detectInvisibilityMask = 0;
    m_invisibilityMask = 0;
    m_transform = 0;
    m_canModifyStats = false;
    m_modelCollisionHeight = 2.f;

    for (auto& modifier : m_auraModifiersGroup)
    {
        modifier[BASE_VALUE] = 0.0f;
        modifier[BASE_PCT] = 1.0f;
        modifier[TOTAL_VALUE] = 0.0f;
        modifier[TOTAL_PCT] = 1.0f;
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

    for (float & stat : m_createStats)
        stat = 0.0f;

    for (auto& m_createResistance : m_createResistances)
        m_createResistance = 0;

    m_attacking = nullptr;
    m_modSpellHitChance = 0.0f;
    m_baseSpellCritChance = 5;

    m_combatTimer = 0;
    m_lastManaUseTimer = 0;
    m_lastManaUseSpellId = 0;

    //m_victimThreat = 0.0f;
    for (float & threatMod : m_threatModifier)
        threatMod = 1.0f;

    for (float & speed : m_speed_rate)
        speed = 1.0f;

    m_charmInfo = nullptr;

    // remove aurastates allowing special moves
    for (int i = 0; i < MAX_REACTIVE; ++i)
    {
        m_reactiveTimer[i] = 0;
        m_reactiveTarget[i].Clear();
    }
    // Phasing
    worldMask = WORLD_DEFAULT_UNIT;

    m_casterChaseDistance = 0.0f;

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
    MANGOS_ASSERT(m_spellGameObjects.empty());
    MANGOS_ASSERT(m_spellDynObjects.empty());
    MANGOS_ASSERT(m_deletedAuras.empty());
    MANGOS_ASSERT(m_deletedHolders.empty());
    MANGOS_ASSERT(!m_needUpdateVisibility);
}

void Unit::Update(uint32 update_diff, uint32 p_time)
{
    if (!IsInWorld())
        return;

    // Buffer spell system update time to save on performance when players are updated twice per
    // world update. We do not need to update spells when the interval is only a few ms (~10ms)
    UpdateCooldowns(GetMap()->GetCurrentClockTime());
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

    UpdatePendingProcs(update_diff);

    if (m_lastManaUseTimer)
    {
        if (update_diff >= m_lastManaUseTimer)
        {
            // Do not regen mana if still channeling last spell that took mana.

            // World of Warcraft Client Patch 1.7.0 (2005-09-13)
            // - Fixed a bug where mana was being regenerated while channelling spells
            //   that use mana.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            if (!m_currentSpells[CURRENT_CHANNELED_SPELL] || (m_currentSpells[CURRENT_CHANNELED_SPELL]->m_spellInfo->Id != m_lastManaUseSpellId))
#endif
            {
                m_lastManaUseTimer = 0;
                m_lastManaUseSpellId = 0;
            }
        }
        else
            m_lastManaUseTimer -= update_diff;
    }

    if (m_combatTimer <= update_diff)
    {
        m_combatTimerTarget.Clear();
        m_combatTimer = UNIT_COMBAT_CHECK_TIMER_MAX - std::min(update_diff - m_combatTimer, UNIT_COMBAT_CHECK_TIMER_MAX);

        // update combat timer only for players and pets
        if (IsInCombat() && UsesPvPCombatTimer() && !HasAuraType(SPELL_AURA_INTERRUPT_REGEN))
        {
            // Pet in combat ?
            Pet* myPet = GetPet();
            if (HasUnitState(UNIT_STAT_FEIGN_DEATH) || !myPet || myPet->GetHostileRefManager().isEmpty())
            {
                if (m_HostileRefManager.isEmpty())
                {
                    if (!IsCharmerOrOwnerPlayerOrPlayerItself() && static_cast<Creature const*>(this)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_THREAT_LIST))
                        OnLeaveCombat();
                    else
                    {
                        // World of Warcraft Client Patch 1.6.1 (2005-08-02)
                        // - Spell casting is no longer interrupted when leaving combat. 
#if SUPPORTED_CLIENT_BUILD < CLIENT_BUILD_1_6_1
                        if (IsNonMeleeSpellCasted(false))
                            InterruptNonMeleeSpells(false);
#endif

                        ClearInCombat();
                    }
                }
            }
        }
    }
    else
        m_combatTimer -= update_diff;

    // extra attack
    Unit* victim = GetVictim();
    if (IsInCombat() && m_doExtraAttacks && GetExtraAttacks() && victim && (CanAutoAttackTarget(victim) == ATTACK_RESULT_OK))
    {
        m_doExtraAttacks = false;

        ExtraAttacksLocked(true);

        while (m_extraAttacks)
        {
            AttackerStateUpdate(victim, BASE_ATTACK, true);
            if (m_extraAttacks > 0)
                --m_extraAttacks;
        }
        ResetAttackTimer(BASE_ATTACK);

        ExtraAttacksLocked(false);
    }

    if (uint32 base_att = GetAttackTimer(BASE_ATTACK))
        SetAttackTimer(BASE_ATTACK, (update_diff >= base_att ? 0 : base_att - update_diff));

    if (uint32 base_att = GetAttackTimer(OFF_ATTACK))
        SetAttackTimer(OFF_ATTACK, (update_diff >= base_att ? 0 : base_att - update_diff));

    if (uint32 ranged_att = GetAttackTimer(RANGED_ATTACK))
        SetAttackTimer(RANGED_ATTACK, (update_diff >= ranged_att ? 0 : ranged_att - update_diff));

    if (IsAlive())
        ModifyAuraState(AURA_STATE_HEALTHLESS_20_PERCENT, GetHealth() < GetMaxHealth() * 0.20f);

    CheckPendingMovementChanges();
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

    m_lastDamageTaken += p_time;
    if (m_lastDamageTaken > 60000)
        m_damageTakenHistory.clear();
}

bool Unit::UsesPvPCombatTimer() const
{
    if (IsPlayer())
        return true;

    if (IsPet() && GetOwnerGuid().IsPlayer())
        return true;

    if (GetCharmerGuid().IsPlayer())
        return true;

    if (static_cast<Creature const*>(this)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_THREAT_LIST))
        return true;

    return false;
}

AutoAttackCheckResult Unit::CanAutoAttackTarget(Unit const* pVictim) const
{
    if (HasUnitState(UNIT_STAT_CAN_NOT_REACT) || HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED))
        return ATTACK_RESULT_CANT_ATTACK;

    if (!pVictim->IsAlive() || !IsAlive())
        return ATTACK_RESULT_DEAD;

    if (!CanReachWithMeleeAutoAttack(pVictim))
        return ATTACK_RESULT_NOT_IN_RANGE;

    if (GetDistance2dToCenter(pVictim) > NO_FACING_CHECKS_DISTANCE)
    {
        if (!HasInArc(pVictim, 2 * M_PI_F / 3))
            return ATTACK_RESULT_BAD_FACING;
    }

    return ATTACK_RESULT_OK;
}

void Unit::DelayAutoAttacks()
{
    if (IsAttackReady(BASE_ATTACK))
        SetAttackTimer(BASE_ATTACK, 100);
    if (HaveOffhandWeapon() && IsAttackReady(OFF_ATTACK))
        SetAttackTimer(OFF_ATTACK, 100);
}

bool Unit::UpdateMeleeAttackingState()
{
    Unit* pVictim = GetVictim();

    if (!pVictim || IsNonMeleeSpellCasted(false))
        return false;

    if (!IsAttackReady(BASE_ATTACK) && !(IsAttackReady(OFF_ATTACK) && HaveOffhandWeapon()))
        return false;

    AutoAttackCheckResult swingError = CanAutoAttackTarget(pVictim);

    Player* pPlayer = ToPlayer();
    switch (swingError)
    {
        case ATTACK_RESULT_OK:
        {
            if (IsPlayer())
                TogglePlayerPvPFlagOnAttackVictim(pVictim);

            if (IsAttackReady(BASE_ATTACK))
            {
                // prevent base and off attack in same time, delay attack at 0.2 sec
                if (HaveOffhandWeapon())
                {
                    if (GetAttackTimer(OFF_ATTACK) < ATTACK_DISPLAY_DELAY)
                        SetAttackTimer(OFF_ATTACK, ATTACK_DISPLAY_DELAY);
                }
                AttackerStateUpdate(pVictim, BASE_ATTACK);
                ResetAttackTimer(BASE_ATTACK);
            }
            if (HaveOffhandWeapon() && IsAttackReady(OFF_ATTACK))
            {
                // prevent base and off attack in same time, delay attack at 0.2 sec
                uint32 base_att = GetAttackTimer(BASE_ATTACK);
                if (base_att < ATTACK_DISPLAY_DELAY)
                    SetAttackTimer(BASE_ATTACK, ATTACK_DISPLAY_DELAY);
                // do attack
                AttackerStateUpdate(pVictim, OFF_ATTACK);
                ResetAttackTimer(OFF_ATTACK);
            }
            break;
        }
        case ATTACK_RESULT_NOT_IN_RANGE:
        {
            DelayAutoAttacks();
            if (pPlayer && pPlayer->GetLastSwingErrorMsg() != ATTACK_RESULT_NOT_IN_RANGE)
                pPlayer->SendAttackSwingNotInRange();
            break;
        }
        case ATTACK_RESULT_BAD_FACING:
        {
            DelayAutoAttacks();
            if (pPlayer && pPlayer->GetLastSwingErrorMsg() != ATTACK_RESULT_BAD_FACING)
                pPlayer->SendAttackSwingBadFacingAttack();
            break;
        }
        case ATTACK_RESULT_CANT_ATTACK:
        {
            DelayAutoAttacks();
            break;
        }
        case ATTACK_RESULT_DEAD:
        {
            AttackStop(true);
            if (pPlayer && pPlayer->GetLastSwingErrorMsg() != ATTACK_RESULT_DEAD)
                pPlayer->SendAttackSwingDeadTarget();
            break;
        }
        case ATTACK_RESULT_FRIENDLY_TARGET:
        {
            AttackStop(true);
            if (pPlayer && pPlayer->GetLastSwingErrorMsg() != ATTACK_RESULT_FRIENDLY_TARGET)
                pPlayer->SendAttackSwingCantAttack();
            break;
        }
    }

    if (pPlayer)
        pPlayer->SetSwingErrorMsg(swingError);

    return swingError == ATTACK_RESULT_OK;
}

bool Unit::HaveOffhandWeapon() const
{
    if (!CanUseEquippedWeapon(OFF_ATTACK))
        return false;

    if (IsPlayer())
        return ((Player*)this)->GetWeaponForAttack(OFF_ATTACK, true, true);
    else
    {
        uint8 itemClass = GetByteValue(UNIT_VIRTUAL_ITEM_INFO + (1 * 2) + 0, VIRTUAL_ITEM_INFO_0_OFFSET_CLASS);
        return itemClass == ITEM_CLASS_WEAPON;
    }
}

void Unit::SendHeartBeat(bool includingSelf)
{
    SendMovementPacket(MSG_MOVE_HEARTBEAT, includingSelf);
}

void Unit::SendMovementPacket(uint16 opcode, bool includingSelf)
{
    m_movementInfo.SetAsServerSide();
    WorldPacket data(opcode);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GetPackGUID();
#else
    data << GetGUID();
#endif
    data << m_movementInfo;
    SendMovementMessageToSet(std::move(data), includingSelf);
}

void Unit::ResetAttackTimer(WeaponAttackType type)
{
    m_attackTimer[type] = uint32(GetAttackTime(type) * m_modAttackSpeedPct[type]);
}

void Unit::RemoveSpellsCausingAura(AuraType auraType, AuraRemoveMode mode)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        RemoveAurasDueToSpell((*iter)->GetId(), nullptr, mode);
        iter = m_modAuras[auraType].begin();
    }
}

void Unit::RemoveSpellsCausingAuraWithMechanic(AuraType auraType)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        if ((*iter)->GetSpellProto()->GetAllSpellMechanicMask() == 0)
        {
            ++iter;
            continue;
        }

        RemoveAurasDueToSpell((*iter)->GetId());
        iter = m_modAuras[auraType].begin();
    }
}

void Unit::RemoveNonPassiveSpellsCausingAura(AuraType auraType)
{
    for (AuraList::const_iterator iter = m_modAuras[auraType].begin(); iter != m_modAuras[auraType].end();)
    {
        if (!((*iter)->GetSpellProto()->Attributes & SPELL_ATTR_PASSIVE))
        {
            RemoveAurasDueToSpell((*iter)->GetId());
            iter = m_modAuras[auraType].begin();
        }
        else
            iter++;
    }
}

bool Unit::HasAuraTypeByCaster(AuraType auraType, ObjectGuid casterGuid) const
{
    for (const auto& iter : m_modAuras[auraType])
        if (iter->GetCasterGuid() == casterGuid)
            return true;
    return false;
}

uint64 Unit::GetAuraApplicationMask() const
{
    if (!IsInWorld())
        return 0;

    uint64 mask = 0x0;
    for (uint64 i = 0; i < MAX_AURAS; ++i)
        if (GetUInt32Value(UNIT_FIELD_AURA + i))
            mask |= uint64(1) << i;
    return mask;
}

uint64 Unit::GetNegativeAuraApplicationMask() const
{
    if (!IsInWorld())
        return 0;

    uint64 mask = 0x0;
    for (uint64 i = MAX_POSITIVE_AURAS; i < MAX_AURAS; ++i)
        if (GetUInt32Value(UNIT_FIELD_AURA + i))
            mask |= uint64(1) << i;
    return mask;
}

void Unit::RemoveSpellsCausingAura(AuraType auraType, SpellAuraHolder const* except)
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

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
void Unit::RemoveAurasByDamageTaken(uint32 damage, uint32 exceptSpellId)
{
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        if (iter->second->GetSpellProto()->HasAttribute(SPELL_ATTR_HEARTBEAT_RESIST) &&
            iter->second->GetSpellProto()->procChance < 101)
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
        if (iter->second->GetSpellProto()->HasAttribute(SPELL_ATTR_HEARTBEAT_RESIST))
#else
        if (iter->second->GetSpellProto()->HasAttribute(SPELL_ATTR_CAN_BREAK_ON_DAMAGE))
#endif
        {
            if (iter->first != exceptSpellId)
            {
                uint32 max_dmg = GetLevel() > 8 ? 25 * GetLevel() - 150 : 50;
                float chance = float(damage) / max_dmg * 100.0f;
                if (roll_chance_f(chance))
                {
                    RemoveSpellAuraHolder(iter->second);
                    iter = m_spellAuraHolders.begin();
                    continue;
                }
            }
        }

        ++iter;
    }
}
#endif

void Unit::DoKillUnit(Unit* pVictim)
{
    if (!pVictim)
        pVictim = this;
    if (!pVictim->IsAlive())
        return;
    DealDamage(pVictim, pVictim->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
}

uint32 Unit::DealDamage(Unit* pVictim, uint32 damage, CleanDamage const* cleanDamage, DamageEffectType damagetype, SpellSchoolMask damageSchoolMask, SpellEntry const* spellProto, bool durabilityLoss, Spell* spell, bool reflected)
{
    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
    // - Fixed bug where self-inflicted damage, like Poisonous Blood, wouldn't
    //   break stealth.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
#define SKIP_STEALTH false
#else
#define SKIP_STEALTH (pVictim == this)
#endif

    // remove affects from attacker at any non-DoT damage (including 0 damage)
    if (damagetype != DOT)
    {
        RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
        RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

        if (pVictim->IsPlayer() && !pVictim->IsMounted() && !pVictim->IsStandingUp())
            static_cast<Player*>(pVictim)->ScheduleStandUp();
    }

    auto ShouldEnterCombat = [&]()
    {
        if (pVictim == this)
            return false;

        if (spell && spell->IsTriggeredByProc())
            return false;

        if (spellProto && spellProto->HasAura(SPELL_AURA_DAMAGE_SHIELD))
            return false;

        if (damagetype == DOT)
        {
            // We need to check channeled dot here, because spells like Blizzard and Starshards have No Initial Threat attribute.
            if (spellProto && spellProto->IsChanneledSpell())
                return true;

            return false;
        }

        return true;
    };

    if (!damage)
    {
        if (cleanDamage)
        {
            //sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[ABSORB] Deal Damage sur %s (Dam%u|Absorb%u|Resist%u)", pVictim->GetName(), cleanDamage->damage, cleanDamage->absorb, cleanDamage->resist);

            // Rage on outgoing parry/dodge
            if (cleanDamage->hitOutCome == MELEE_HIT_PARRY || cleanDamage->hitOutCome == MELEE_HIT_DODGE)
            {
                if (cleanDamage->damage && damagetype == DIRECT_DAMAGE && this != pVictim && IsPlayer() && (GetPowerType() == POWER_RAGE))
                    ((Player*)this)->RewardRage(cleanDamage->damage*0.75, true);
            }

            // Damage received under shield for example.
            if (cleanDamage->absorb)
            {
                // In patch 1.10 proc flags were added to CC auras to make them break on damage.
                // Before that chance to break on damage was handled by attributes.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
                pVictim->RemoveAurasByDamageTaken(cleanDamage->absorb, spellProto ? spellProto->Id : 0);
#endif

                pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_DAMAGE_CANCELS, spellProto ? spellProto->Id : 0, true, SKIP_STEALTH);

                // interrupt spells like trying to mount even through absorb shields
                if (pVictim->IsPlayer() && damagetype != DOT)
                    pVictim->InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_DAMAGE_CANCELS, spellProto ? spellProto->Id : 0);
            }
            if (ShouldEnterCombat())
            {
                pVictim->SetInCombatWithAggressor(this);
                SetInCombatWithVictim(pVictim);
            }
        }
        return 0;
    }

    // In patch 1.10 proc flags were added to CC auras to make them break on damage.
    // Before that chance to break on damage was handled by attributes.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
    pVictim->RemoveAurasByDamageTaken(damage, spellProto ? spellProto->Id : 0);
#endif

    uint32 health = pVictim->GetHealth();
    // duel ends when player has 1 or less hp
    bool duel_hasEnded = false;
    if (pVictim->IsPlayer() && ((Player*)pVictim)->duel && damage >= (health - 1))
    {
        // prevent kill only if killed in duel and killed by opponent or opponent controlled creature
        if (((Player*)pVictim)->duel->opponent == this ||
            ((Player*)pVictim)->duel->opponent->GetObjectGuid() == GetOwnerGuid()
            // World of Warcraft Client Patch 1.7.0 (2005-09-13)
            // - Fixed bug where you could kill someone in a duel with spell reflection.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            || pVictim == this && reflected
#endif
            )
            damage = health - 1;

        duel_hasEnded = true;
    }

    // Enter combat or extend leash timer.
    if (ShouldEnterCombat())
    {
        pVictim->SetInCombatWithAggressor(this);
        SetInCombatWithVictim(pVictim);
    }

    if (pVictim->IsCreature())
        pVictim->ToCreature()->CountDamageTaken(damage, GetCharmerOrOwnerOrOwnGuid().IsPlayer() || pVictim == this);
    else if (pVictim != this)
    {
        if (Player* attackerPlayer = GetAffectingPlayer())
            pVictim->UnitDamaged(attackerPlayer->GetObjectGuid(), damage);
        else
            pVictim->UnitDamaged(ObjectGuid(), damage);
    }

    // Rage from Damage made (only from direct weapon damage)
    if (damage && damagetype == DIRECT_DAMAGE && this != pVictim && IsPlayer() && (GetPowerType() == POWER_RAGE))
        ((Player*)this)->RewardRage(damage, true);

    if (Creature* creaVictim = pVictim->ToCreature())
    {
        if (!creaVictim->IsPet())
        {
            if (!creaVictim->HasLootRecipient())
                creaVictim->SetLootRecipient(this);
            else if (ObjectGuid recipient = creaVictim->GetLootRecipientGuid())
            {
                // Replace loot recipient if current recipient is pet and attacker is owner or grouped with owner
                if (recipient.IsPet() && IsPlayer())
                {
                    if (GetPetGuid() == recipient)
                        creaVictim->SetLootRecipient(this);
                    else if (Group* group = creaVictim->GetGroupLootRecipient())
                    {
                        if (group == ToPlayer()->GetGroup())
                            creaVictim->SetLootRecipient(this);
                    }
                }
            }
        }
    }

    if (health <= damage && pVictim->GetInvincibilityHpThreshold() == 0)
    {
        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamage: victim just died");
        Kill(pVictim, spellProto, durabilityLoss);

        // last damage from non duel opponent or opponent controlled creature
        if (duel_hasEnded)
        {
            MANGOS_ASSERT(pVictim->IsPlayer());
            Player* he = (Player*)pVictim;

            MANGOS_ASSERT(he->duel);

            he->duel->opponent->CombatStopWithPets(true);
            he->CombatStopWithPets(true);

            he->DuelComplete(DUEL_INTERRUPTED);
        }
    }
    else                                                    // if (health <= damage)
    {
        if (health > pVictim->GetInvincibilityHpThreshold())
        {
            uint32 dmg = std::min<uint32>(health - pVictim->GetInvincibilityHpThreshold(), damage);
            pVictim->ModifyHealth(-(int32)dmg);
        }

        if (damagetype != DOT)
        {
            if (!GetVictim() && IsPlayer())
            {
                // if not have main target then attack state with target (including AI call)
                //start melee attacks only after melee hit
                Attack(pVictim, (damagetype == DIRECT_DAMAGE));
            }

            // if damage pVictim call AI reaction
            if (!spell) // AttackedBy already handled at spell cast
                pVictim->AttackedBy(this);
        }

        if (!pVictim->IsPlayer())
        {
            float threat = damage * sSpellMgr.GetSpellThreatMultiplier(spellProto);
            pVictim->AddThreat(this, threat, (cleanDamage && cleanDamage->hitOutCome == MELEE_HIT_CRIT), damageSchoolMask, spellProto);
        }
        else                                                // victim is a player
        {
            // Rage from damage received
            if (this != pVictim && pVictim->GetPowerType() == POWER_RAGE)
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

        if (IsPlayer())
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
            isProcSpell = spell->m_triggeredBySpellInfo->HasAuraWithSpellTriggerEffect();

        if (isProcSpell)
            pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_DAMAGE_CANCELS, spell->m_triggeredByParentSpellInfo->Id, true, SKIP_STEALTH);
        else
            pVictim->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_DAMAGE_CANCELS, spellProto ? spellProto->Id : 0, true, SKIP_STEALTH);

        if (damagetype != NODAMAGE && damage && pVictim->IsPlayer())
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
                            if (spell->m_spellInfo->HasSpellInterruptFlag(SPELL_INTERRUPT_FLAG_DAMAGE_CANCELS))
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
                        if (spell->m_spellInfo->HasChannelInterruptFlag(AURA_INTERRUPT_DAMAGE_CHANNEL_DURATION))
                        {
                            if (pVictim != this)                //don't shorten the duration of channeling if you damage yourself
                                spell->DelayedChannel();
                        }
                        else if (spell->m_spellInfo->HasChannelInterruptFlag(AURA_INTERRUPT_DAMAGE_CANCELS))
                        {
                            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Spell %u canceled at damage!", spell->m_spellInfo->Id);
                            pVictim->InterruptSpell(CURRENT_CHANNELED_SPELL);
                        }
                    }
                    else if (spell->getState() == SPELL_STATE_DELAYED)
                        // break channeled spell in delayed state on damage
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Spell %u canceled at damage!", spell->m_spellInfo->Id);
                        pVictim->InterruptSpell(CURRENT_CHANNELED_SPELL);
                    }
                }
            }
        }

        // last damage from duel opponent
        if (duel_hasEnded)
        {
            MANGOS_ASSERT(pVictim->IsPlayer());
            Player* he = (Player*)pVictim;

            MANGOS_ASSERT(he->duel);

            he->SetHealth(1);

            he->duel->opponent->CombatStopWithPets(true);
            he->CombatStopWithPets(true);

            he->CastSpell(he, 7267, true);                  // beg
            he->DuelComplete(DUEL_WON);
        }
    }

    return damage;

#undef SKIP_STEALTH
}

void Unit::Kill(Unit* pVictim, SpellEntry const* spellProto, bool durabilityLoss)
{
    // find player: owner of controlled `this` or `this` itself maybe
    // for loot will be sued only if pGroupTap == nullptr
    Player* pPlayerTap = GetCharmerOrOwnerPlayerOrPlayerItself();
    Creature* pCreatureVictim = pVictim->ToCreature();
    Player* pPlayerVictim = pVictim->ToPlayer();
    Group* pGroupTap = nullptr;

    // in creature kill case group/player tap stored for pCreatureVictim
    if (pCreatureVictim)
    {
        if (pCreatureVictim->IsLootAllowedDueToDamageOrigin())
        {
            pGroupTap = pCreatureVictim->GetGroupLootRecipient();

            if (Player* recipient = pCreatureVictim->GetOriginalLootRecipient())
                pPlayerTap = recipient;
            else if (ObjectGuid recipient = pCreatureVictim->GetLootRecipientGuid())
                if (recipient.IsPet())
                    pPlayerTap = nullptr;
            // Set correct pGroupTap if player entered a group
            if (pPlayerTap && !pGroupTap)
                pGroupTap = pPlayerTap->GetGroup();
        }
        else if (pCreatureVictim->lootForCreator && pCreatureVictim->GetCreatorGuid())
        {
            if (Player* pCreator = ::ToPlayer(GetUnit(*this, pCreatureVictim->GetCreatorGuid())))
                pPlayerTap = pCreator;
        }
        else
            pCreatureVictim->SetLootRecipient(nullptr);
    }
    // in player kill case group tap selected by pPlayerTap (killer-player itself, or charmer, or owner, etc)
    else
    {
        if (pPlayerTap)
            pGroupTap = pPlayerTap->GetGroup();
    }

    // Nostalrius: Loots desactives / map (retire ici l'XP et les reputs)
    bool allowLoot = !sObjectMgr.IsMapLootDisabled(GetMapId());
    // call kill spell proc event (before real die and combat stop to triggering auras removed at death/combat stop)
    if (allowLoot && pPlayerTap && pPlayerTap != pVictim)
    {
        WorldPacket data(SMSG_PARTYKILLLOG, (8 + 8));   //send event PARTY_KILL
        data << pPlayerTap->GetObjectGuid();            //player with killing blow
        data << pVictim->GetObjectGuid();              //victim

        Player* looter = pPlayerTap;
        if (pGroupTap)
        {
            pGroupTap->BroadcastPacket(&data, false, pGroupTap->GetMemberGroup(pPlayerTap->GetObjectGuid()), pPlayerTap->GetObjectGuid());

            if (pCreatureVictim)
            {
                pGroupTap->UpdateLooterGuid(pCreatureVictim, true);
                if (pGroupTap->GetLooterGuid())
                {
                    looter = ObjectAccessor::FindPlayer(pGroupTap->GetLooterGuid());

                    // Master looter offline or on loading screen
                    if (!looter && pGroupTap->GetLootMethod() == MASTER_LOOT)
                    {
                        // give master looter to the leader / assistants if possible, otherwise switch to group loot
                        for (Group::member_citerator itr = pGroupTap->GetMemberSlots().begin(); itr != pGroupTap->GetMemberSlots().end(); ++itr)
                        {
                            if (itr->guid != pGroupTap->GetLooterGuid() && (itr->guid == pGroupTap->GetLeaderGuid() || itr->assistant))
                                if (looter = ObjectAccessor::FindPlayer(itr->guid))
                                    break;
                        }

                        if (!looter)
                        {
                            pGroupTap->SetLootMethod(GROUP_LOOT);
                            pGroupTap->SetLootThreshold(ITEM_QUALITY_UNCOMMON);
                            pGroupTap->UpdateLooterGuid(pCreatureVictim);
                            looter = ObjectAccessor::FindPlayer(pGroupTap->GetLooterGuid());
                        }
                        else
                        {
                            pGroupTap->SetLooterGuid(looter->GetGUID());
                            pGroupTap->SendUpdate();
                        }
                    }

                    if (looter)
                    {
                        pCreatureVictim->SetLootRecipient(looter);   // update pCreatureVictim loot recipient to the allowed looter.
                        pGroupTap->SendLooter(pCreatureVictim, looter);
                    }
                    else
                        pGroupTap->SendLooter(pCreatureVictim, nullptr);
                }
                else
                    pGroupTap->SendLooter(pCreatureVictim, nullptr);

                pGroupTap->UpdateLooterGuid(pCreatureVictim);
            }
        }

        pPlayerTap->SendDirectMessage(&data);

        if (pCreatureVictim)
        {
            // in this case loot is generated on spawn, when there is no player, so we need to fill in remaining conditional loot
            if (pCreatureVictim->HasStaticFlag(CREATURE_STATIC_FLAG_CAN_WIELD_LOOT) && !pCreatureVictim->loot.empty() &&
                !pCreatureVictim->lootForPickPocketed && !pCreatureVictim->lootForBody && !pCreatureVictim->lootForSkin)
                pCreatureVictim->GeneratePlayerDependentLoot(looter, pGroupTap);
            else
                pCreatureVictim->GenerateLootForBody(looter, pGroupTap);
        }

        if (pGroupTap)
            pGroupTap->RewardGroupAtKill(pVictim, pPlayerTap);
        else if (pPlayerTap)
            pPlayerTap->RewardSinglePlayerAtKill(pVictim);
    }
    if (pPlayerVictim)
        pPlayerVictim->RewardHonorOnDeath();

    // To be replaced if possible using ProcDamageAndSpell
    if (pVictim != this) // The one who has the fatal blow
        ProcDamageAndSpell(ProcSystemArguments(pVictim, PROC_FLAG_KILL, PROC_FLAG_HEARTBEAT, PROC_EX_NONE, 0, 0));

    DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageAttackStop");

    bool const damageFromSpiritOfRedemptionTalent = (spellProto && spellProto->Id == 27965);
    bool const spiritOfRedemptionTalentImmune = pVictim->GetClass() == CLASS_PRIEST && !damageFromSpiritOfRedemptionTalent && pVictim->HasAura(20711);

    // handle spirit of redemption talent
    if (spiritOfRedemptionTalentImmune)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    {
        pVictim->InterruptNonMeleeSpells(false);

        // save value before aura remove
        uint32 ressSpellId = 0;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        ressSpellId = pVictim->GetUInt32Value(PLAYER_SELF_RES_SPELL);
        if (!ressSpellId)
            ressSpellId = ((Player*)pVictim)->SelectResurrectionSpellId();
#else
        if (HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CAN_SELF_RESURRECT))
            ressSpellId = ((Player*)pVictim)->GetResurrectionSpellId();
#endif

        pVictim->RemoveAllAurasOnDeath();

        // restore for use at real death
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        pVictim->SetUInt32Value(PLAYER_SELF_RES_SPELL, ressSpellId);
#else
        pPlayerVictim->SetResurrectionSpellId(ressSpellId);
        if (ressSpellId)
            SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_CAN_SELF_RESURRECT);
#endif

        pVictim->CastCustomSpell(pVictim, 27827, pVictim->GetMaxHealth(), {}, {}, true);
    }
    else
#else
    {
        pVictim->CastSpell(pVictim->GetPositionX(), pVictim->GetPositionY(), pVictim->GetPositionZ(), 20713, true);
    }
    // no else
#endif
    {
        pVictim->SetHealth(0);
        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "SET JUST_DIED");
        pVictim->SetDeathState(JUST_DIED);

        // World of Warcraft Client Patch 1.6.0 (2005-07-12)
        // - Self-resurrection spells show their name on the button in the release spirit dialog.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
        if (pPlayerVictim && pVictim->GetUInt32Value(PLAYER_SELF_RES_SPELL))
            pVictim->DirectSendPublicValueUpdate(PLAYER_SELF_RES_SPELL);
#else
        if (pPlayerVictim && pVictim->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CAN_SELF_RESURRECT))
            pVictim->DirectSendPublicValueUpdate(PLAYER_FLAGS);
#endif
        // Nostalrius: Instantly send values update for health
        pVictim->DirectSendPublicValueUpdate(UNIT_FIELD_HEALTH);
    }

    pVictim->GetHostileRefManager().deleteReferences();

    // outdoor pvp things, do these after setting the death state, else the player activity notify won't work... doh...
    // handle player kill only if not suicide (spirit of redemption for example)
    if (this != pVictim)
        if (Player* pPlayer = ToPlayer())
            if (ZoneScript* pZoneScript = pPlayer->GetZoneScript())
                pZoneScript->HandleKill(pPlayer, pVictim);

    DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageHealth1");

    // remember victim PvP death for corpse type and corpse reclaim delay
    // at original death (not at SpiritOfRedemptionTalent timeout)
    if (pPlayerVictim && !damageFromSpiritOfRedemptionTalent)
        pPlayerVictim->SetPvPDeath(pPlayerTap != nullptr);

    // Call KilledUnit for creatures
    if (Creature* pThisCreature = ToCreature())
        if (pThisCreature->AI())
            pThisCreature->AI()->KilledUnit(pVictim);

    // Call AI OwnerKilledUnit (for any current summoned minipet/guardian/protector)
    PetOwnerKilledUnit(pVictim);

    // 10% durability loss on death
    // clean InHateListOf
    if (pPlayerVictim)
    {
        // only if not player and not controlled by player pet. And not at BG
        if (durabilityLoss && !pPlayerTap && !pPlayerVictim->InBattleGround() &&
           (!spellProto || !spellProto->HasAttribute(SPELL_ATTR_EX3_NO_DURABILITY_LOSS)))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "We are dead, loosing 10 percents durability");
            pPlayerVictim->DurabilityLossAll(0.10f, false);
            // durability lost message
            WorldPacket data(SMSG_DURABILITY_DAMAGE_DEATH, 0);
            pPlayerVictim->GetSession()->SendPacket(&data);
        }
    }
    else                                                // creature died
    {
        DEBUG_FILTER_LOG(LOG_FILTER_DAMAGE, "DealDamageNotPlayer");

        if (!pCreatureVictim->IsPet())
        {
            pCreatureVictim->LogDeath(this);
            pCreatureVictim->UpdateCombatState(false);
            pCreatureVictim->UpdateCombatWithZoneState(false);

            pCreatureVictim->DeleteThreatList();
            if (CreatureInfo const* cinfo = pCreatureVictim->GetCreatureInfo())
                if (cinfo->loot_id || cinfo->gold_max > 0)
                    pCreatureVictim->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);

            if (pPlayerTap && (pCreatureVictim->IsGuard() || pCreatureVictim->HasStaticFlag(CREATURE_STATIC_FLAG_PVP_ENABLING)))
                pCreatureVictim->SendZoneUnderAttackMessage(pPlayerTap);
        }

        if (pCreatureVictim->AI())
            pCreatureVictim->AI()->JustDied(this);

        if (CreatureGroup* group = pCreatureVictim->GetCreatureGroup())
            group->OnMemberDied(pCreatureVictim);

        if (TemporarySummon* pSummon = pCreatureVictim->IsTemporarySummon() ? static_cast<TemporarySummon*>(pCreatureVictim) : nullptr)
        {
            if (pSummon->GetSummonerGuid().IsCreature())
            {
                if (Creature* pSummoner = pCreatureVictim->GetMap()->GetCreature(pSummon->GetSummonerGuid()))
                    if (pSummoner->AI())
                        pSummoner->AI()->SummonedCreatureJustDied(pCreatureVictim);
            }
            else if (pSummon->GetSummonerGuid().IsGameObject())
            {
                if (GameObject* pSummoner = pCreatureVictim->GetMap()->GetGameObject(pSummon->GetSummonerGuid()))
                    if (pSummoner->AI())
                        pSummoner->AI()->SummonedCreatureJustDied(pCreatureVictim);
            }
        }
        else if (Creature* pOwnerCreature = ::ToCreature(pVictim->GetCharmerOrOwner()))
        {
            if (pOwnerCreature->AI())
                pOwnerCreature->AI()->SummonedCreatureJustDied(pCreatureVictim);
        }

        if (ZoneScript* pScript = pCreatureVictim->GetZoneScript())
            pScript->OnCreatureDeath(pCreatureVictim);

        // Dungeon specific stuff, only applies to players killing creatures
        if (pCreatureVictim->GetInstanceId() && pCreatureVictim->GetMapId() > 1)
        {
            Player* playerKiller = GetCharmerOrOwnerPlayerOrPlayerItself();

            if (!playerKiller && this == pCreatureVictim && pPlayerTap)
                playerKiller = pPlayerTap;

            if (playerKiller)
                pCreatureVictim->GetMap()->BindToInstanceOrRaid(playerKiller, pCreatureVictim->GetRespawnTimeEx(), pCreatureVictim->HasStaticFlag(CREATURE_STATIC_FLAG_2_LOCK_TAPPERS_TO_RAID_ON_DEATH));
        }
    }

    // If we're in a dungeon, the killer is a pCreatureVictim and the victim is a player
    if (GetInstanceId() && GetMapId() > 1 && this->IsCreature() && pPlayerVictim)
    {
        sInstanceStatistics.IncrementKillCounter(this->ToCreature(), pPlayerVictim, spellProto);
    }

    // battleground things (do this at the end, so the death state flag will be properly set to handle in the bg->handlekill)
    if (pPlayerVictim && pPlayerVictim->InBattleGround())
    {
        if (BattleGround* bg = pPlayerVictim->GetBattleGround())
            bg->HandleKillPlayer(pPlayerVictim, pPlayerTap);
    }
    else if (pCreatureVictim)
    {
        if (pPlayerTap)
            if (BattleGround* bg = pPlayerTap->GetBattleGround())
                bg->HandleKillUnit(pCreatureVictim, pPlayerTap);
    }

    pVictim->InterruptSpellsCastedOnMe(false, true);
}

struct PetOwnerKilledUnitHelper
{
    explicit PetOwnerKilledUnitHelper(Unit* pVictim) : m_victim(pVictim) {}
    void operator()(Unit* pTarget) const
    {
        if (pTarget->IsCreature())
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

void Unit::CalculateMeleeDamage(Unit* pVictim, uint32 damage, CalcDamageInfo* damageInfo, WeaponAttackType attackType)
{
    damageInfo->attacker = this;
    damageInfo->target = pVictim;
    damageInfo->attackType = attackType;

    if (!pVictim)
        return;
    if (!IsAlive() || !pVictim->IsAlive())
        return;

    // Select HitInfo/procAttacker/procVictim flag based on attack type
    switch (attackType)
    {
        case BASE_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_DEAL_MELEE_SWING | PROC_FLAG_MAIN_HAND_WEAPON_SWING;
            damageInfo->procVictim   = PROC_FLAG_TAKE_MELEE_SWING;
            damageInfo->HitInfo      = HITINFO_NORMALSWING + HITINFO_AFFECTS_VICTIM;
            break;
        case OFF_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_DEAL_MELEE_SWING | PROC_FLAG_OFF_HAND_WEAPON_SWING;
            damageInfo->procVictim   = PROC_FLAG_TAKE_MELEE_SWING;
            damageInfo->HitInfo      = HITINFO_LEFTSWING + HITINFO_AFFECTS_VICTIM;
            break;
        case RANGED_ATTACK:
            damageInfo->procAttacker = PROC_FLAG_DEAL_RANGED_ATTACK;
            damageInfo->procVictim   = PROC_FLAG_TAKE_RANGED_ATTACK;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
            damageInfo->HitInfo      = HITINFO_UNK3;             // test (dev note: test what? HitInfo flag possibly not confirmed.)
#endif
            break;
        default:
            break;
    }

    bool immune = true;
    bool feral = IsNoWeaponShapeShift();

    // Only get one damage type for feral druids so they don't receive incorrect benefits
    // from weapons with multiple types of damage
    uint8 actualDamageCount = feral ? 1 : m_weaponDamageCount[damageInfo->attackType];
    for (uint8 i = 0; i < actualDamageCount; i++)
    {
        SubDamageInfo* subDamage = &damageInfo->subDamage[i];

        // feral only allowed melee school
        subDamage->damageSchoolMask = IsPlayer() && !feral
            ? GetSchoolMask(GetWeaponDamageSchool(damageInfo->attackType, i))
            : GetMeleeDamageSchoolMask();

        if (damageInfo->target->IsImmuneToDamage(subDamage->damageSchoolMask))
        {
            subDamage->damage = 0;
            continue;
        }
        else
            immune = false;

        float fdamage = CalculateDamage(damageInfo->attackType, false, i);
        // Add melee damage bonus
        fdamage = MeleeDamageBonusDone(damageInfo->target, fdamage, damageInfo->attackType, nullptr, EFFECT_INDEX_0, DIRECT_DAMAGE, 1, nullptr, i == 0);
        subDamage->damage = dither(damageInfo->target->MeleeDamageBonusTaken(this, dither(fdamage), damageInfo->attackType, nullptr, EFFECT_INDEX_0, DIRECT_DAMAGE, 1, nullptr, i == 0));

        // Calculate armor reduction
        if (subDamage->damageSchoolMask == SPELL_SCHOOL_MASK_NORMAL)
        {
            damageInfo->cleanDamage += subDamage->damage;
            subDamage->damage = ditheru(CalcArmorReducedDamage(damageInfo->target, subDamage->damage));
            damageInfo->cleanDamage -= subDamage->damage;
        }

        damageInfo->totalDamage += subDamage->damage;
    }

    // Physical Immune check
    if (immune)
    {
        damageInfo->HitInfo &= ~HITINFO_AFFECTS_VICTIM;
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

            // Baeza formula: https://wowwiki.fandom.com/wiki/Weapon_skill?diff=349241&oldid=347613
            // Low end : 1.3 - 0.05*(defense - skill) min of 0.01 and max of 0.91
            // If the attacker is a caster then this is reduced by 0.7 and max of 0.6
            // High end : 1.2 - 0.03*(defense - skill) min of 0.2 and max of 0.99
            // If the attacker is a caster then this is reduced by 0.3

            int32 skillDiff = pVictim->GetDefenseSkillValue(this) - GetWeaponSkillValue(damageInfo->attackType, pVictim);
            float low = 1.3f - 0.05f * skillDiff;
            float high = 1.2f - 0.03f * skillDiff;
            float lowCap = 0.91f;
            float highCap = 0.99f;

            if ((GetClassMask() & CLASSMASK_WAND_USERS) != 0) {
                low -= 0.7f;
                high -= 0.3f;
                lowCap = 0.6f;
            }

            if (low < 0.01f) low = 0.01f;
            if (high < 0.2f) high = 0.2f;

            if (low > lowCap) low = lowCap;
            if (high > highCap) high = highCap;

            float reducePercent = frand(low,high);

            // sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "SkillDiff = %i, reducePercent = %f", SkillDiff, reducePercent); // Pour tests & débug via la console

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
            SubDamageInfo* subDamage = &damageInfo->subDamage[i];

            damageInfo->target->CalculateDamageAbsorbAndResist(this, subDamage->damageSchoolMask, DIRECT_DAMAGE, subDamage->damage, &subDamage->absorb, &subDamage->resist, nullptr);

            uint32 const bonus = (subDamage->resist < 0 ? uint32(std::abs(subDamage->resist)) : 0);
            subDamage->damage += bonus;
            damageInfo->totalDamage += bonus;

            uint32 const malus = (subDamage->resist > 0 ? (subDamage->absorb + uint32(subDamage->resist)) : subDamage->absorb);

            if (subDamage->damage <= malus)
            {
                damageInfo->totalDamage -= subDamage->damage;
                subDamage->damage = 0;
            }
            else
            {
                damageInfo->totalDamage -= malus;
                subDamage->damage -= malus;
            }

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

    // No animation on victim in this case.
    if (!damageInfo->totalDamage && (damageInfo->HitInfo & (HITINFO_MISS | HITINFO_ABSORB)))
        damageInfo->HitInfo &= ~HITINFO_AFFECTS_VICTIM;
}

void Unit::DealMeleeDamage(CalcDamageInfo const* damageInfo, bool durabilityLoss)
{
    if (damageInfo == nullptr) return;
    Unit* pVictim = damageInfo->target;

    if (!pVictim)
        return;

    if (!pVictim->IsAlive() || pVictim->IsTaxiFlying() || (pVictim->IsCreature() && ((Creature*)pVictim)->IsInEvadeMode()))
        return;

    // Hmmmm dont like this emotes client must by self do all animations
    if (damageInfo->totalDamage && (damageInfo->HitInfo & HITINFO_CRITICALHIT))
    {
        if (!(pVictim->IsCreature() && static_cast<Creature*>(pVictim)->HasStaticFlag(CREATURE_STATIC_FLAG_DO_NOT_PLAY_WOUND_ANIM)))
            pVictim->HandleEmoteCommand(EMOTE_ONESHOT_WOUNDCRITICAL);
    }

    if (damageInfo->TargetState == VICTIMSTATE_PARRY)
    {
        // Get attack timers
        float offtime  = float(pVictim->GetAttackTimer(OFF_ATTACK));
        float basetime = float(pVictim->GetAttackTimer(BASE_ATTACK));
        // Reduce attack time
        if (pVictim->HaveOffhandWeapon() && offtime < basetime)
        {
            float percent20 = pVictim->GetAttackTime(OFF_ATTACK) * 0.20f;
            float percent60 = 3.0f * percent20;
            if (offtime > percent20 && offtime <= percent60)
                pVictim->SetAttackTimer(OFF_ATTACK, uint32(percent20));
            else if (offtime > percent60)
            {
                offtime -= 2.0f * percent20;
                pVictim->SetAttackTimer(OFF_ATTACK, uint32(offtime));
            }
        }
        else
        {
            float percent20 = pVictim->GetAttackTime(BASE_ATTACK) * 0.20f;
            float percent60 = 3.0f * percent20;
            if (basetime > percent20 && basetime <= percent60)
                pVictim->SetAttackTimer(BASE_ATTACK, uint32(percent20));
            else if (basetime > percent60)
            {
                basetime -= 2.0f * percent20;
                pVictim->SetAttackTimer(BASE_ATTACK, uint32(basetime));
            }
        }
    }

    // Call default DealDamage
    CleanDamage cleanDamage(damageInfo->cleanDamage, damageInfo->attackType, damageInfo->hitOutCome, damageInfo->totalAbsorb, damageInfo->totalResist);
    DealDamage(pVictim, damageInfo->totalDamage, &cleanDamage, DIRECT_DAMAGE, SpellSchoolMask(damageInfo->subDamage[0].damageSchoolMask), nullptr, durabilityLoss);

    // If this is a creature and it attacks from behind it has a probability to daze it's victim
    if (damageInfo->totalDamage && !IsPlayer() &&
        !((Creature*)this)->GetCharmerOrOwnerGuid() && !pVictim->HasInArc(this) &&
        !(pVictim->IsPlayer() && pVictim->GetInvincibilityHpThreshold())) // dont daze player in god mode
    {
        // -probability is between 0% and 40%
        // 20% base chance
        uint32 victimDefense = pVictim->GetDefenseSkillValue();
        uint32 attackerMeleeSkill = GetUnitMeleeSkill();

        float probability = 0.0f;

        // there is a newbie protection, at level 10 just 7% base chance; assuming linear function
        if (pVictim->GetLevel() < 30)
            probability = 0.65f * pVictim->GetLevel() + 0.5f + ((float)attackerMeleeSkill - (float)victimDefense) * 0.2f;
        else
            probability = 20.0f + ((float)attackerMeleeSkill - (float)victimDefense) * 0.2f;

        if (probability > 40.0f)
            probability = 40.0f;

        if (roll_chance_f(probability))
        {
            uint32 spellId = SPELL_ID_DAZE;

            if (pVictim->IsPlayer())
                if (ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(pVictim->GetRace()))
                    spellId = raceEntry->dazeSpellId;

            CastSpell(pVictim, spellId, true);
        }
    }

    // update at damage Judgement aura duration that applied by attacker at victim
    if (damageInfo->totalDamage)
    {
        SpellAuraHolderMap const& vAuras = pVictim->GetSpellAuraHolderMap();
        for (const auto& itr : vAuras)
        {
            SpellEntry const* spellInfo = itr.second->GetSpellProto();
            if (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_ALWAYS_HIT && spellInfo->SpellFamilyName == SPELLFAMILY_PALADIN && (itr.second->GetCasterGuid() == GetObjectGuid()))
                itr.second->RefreshHolder();
        }
    }

    // Confirmed on classic that Thorns does not trigger on Immune, Absorb and Dodge.
    if ((damageInfo->HitInfo & HITINFO_AFFECTS_VICTIM) && damageInfo->TargetState != VICTIMSTATE_PARRY &&  damageInfo->TargetState != VICTIMSTATE_DODGE)
    {
        // on weapon hit casts
        if (IsPlayer() && pVictim->IsAlive())
            ((Player*)this)->CastItemCombatSpell(pVictim, damageInfo->attackType);

        // victim's damage shield
        TriggerDamageShields(pVictim);
    }
}

void Unit::TriggerDamageShields(Unit* pVictim)
{
    std::set<Aura*> alreadyDone;
    AuraList const& vDamageShields = pVictim->GetAurasByType(SPELL_AURA_DAMAGE_SHIELD);
    for (AuraList::const_iterator i = vDamageShields.begin(); i != vDamageShields.end();)
    {
        if (alreadyDone.find(*i) == alreadyDone.end())
        {
            alreadyDone.insert(*i);
            SpellEntry const* pSpellProto = (*i)->GetSpellProto();

            // Damage shield can be resisted...
            if (SpellMissInfo missInfo = pVictim->SpellHitResult(this, pSpellProto, (*i)->GetEffIndex()))
            {
                pVictim->SendSpellMiss(this, pSpellProto->Id, missInfo);
                continue;
            }

            // ...or immuned
            if (IsImmuneToDamage(pSpellProto->GetSpellSchoolMask()))
            {
                pVictim->SendSpellOrDamageImmune(this, pSpellProto->Id);
                continue;
            }

            float fdamage = (*i)->GetModifier()->m_amount;

            // Damage shield effects do benefit from damage done bonuses, including spell power if bonus coefficient is set.
            // For example Flame Wrath has a coefficient of 1, making it scale with 100% of spell power.
            fdamage = pVictim->SpellDamageBonusDone(this, pSpellProto, (*i)->GetEffIndex(), fdamage, SPELL_DIRECT_DAMAGE, (*i)->GetStackAmount());

            // apply SpellBaseDamageBonusTaken for mobs only
            // for example, Death Talon Seethers with Aura of Flames reflect 1200 damage to tanks with Mark of Flame
            if (pVictim->IsCreature())
            {
                int32 spellDmgTakenBonus = this->SpellBaseDamageBonusTaken(pSpellProto->GetSpellSchoolMask());
                // don't allow damage shields to be reduced by Blessing of Sanctuary, etc.
                if (spellDmgTakenBonus > 0) fdamage += spellDmgTakenBonus;
            }

            //Calculate absorb resist ??? no data in opcode for this possibly unable to absorb or resist?
            //uint32 absorb;
            //uint32 resist;
            //CalcAbsorbResist(pVictim, SpellSchools(spellProto->School), SPELL_DIRECT_DAMAGE, damage, &absorb, &resist);
            //damage-=absorb + resist;

            uint32 damage = ditheru(fdamage);
            pVictim->DealDamageMods(this, damage, nullptr);

            WorldPacket data(SMSG_SPELLDAMAGESHIELD, (8 + 8 + 4 + 4));
            data << pVictim->GetObjectGuid();
            data << GetObjectGuid();
            data << uint32(damage);
            data << uint32(pSpellProto->School);
            pVictim->SendObjectMessageToSet(&data, true);

            pVictim->DealDamage(this, damage, nullptr, SPELL_DIRECT_DAMAGE, pSpellProto->GetSpellSchoolMask(), pSpellProto, true);

            i = vDamageShields.begin();
        }
        else
            ++i;
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

void Unit::CalculateDamageAbsorbAndResist(SpellCaster* pCaster, SpellSchoolMask schoolMask, DamageEffectType damagetype, uint32 const damage, uint32* absorb, int32* resist, SpellEntry const* spellProto, Spell* spell)
{
    if (!pCaster || !IsAlive() || !damage)
        return;

    if (spell)
        schoolMask = spell->m_spellSchoolMask;

    // Nostalrius : immune ?
    if (IsImmuneToSchoolMask(schoolMask) && !(spellProto && (spellProto->Attributes & SPELL_ATTR_NO_IMMUNITIES)))
    {
        (*absorb) = damage;
        return;
    }

    int32 remainingDamage = int32(damage);

    // Magic damage, check for resists
    bool canResist = (schoolMask & SPELL_SCHOOL_MASK_NORMAL) == 0;

    // NOSTALRIUS: Sorts binaires ne sont pas résistés.
    if (canResist && spellProto && spellProto->IsBinary())
        canResist = false;
    else if (spellProto && spellProto->AttributesEx4 & SPELL_ATTR_EX4_IGNORE_RESISTANCES)
        canResist = false;

    float const resistanceChance = pCaster->GetSpellResistChance(this, schoolMask, true);

    if (canResist || (resistanceChance < 0))
    {
        float const multiplier = RollMagicResistanceMultiplierOutcomeAgainst(resistanceChance, schoolMask, damagetype, spellProto);
        *resist = dither(int64(damage) * multiplier);
        remainingDamage -= *resist;
    }
    else
        *resist = 0;

    auto HandleSchoolAbsorb = [&]()
    {
        // Need remove expired auras after
        bool existExpired = false;

        // absorb without mana cost
        AuraList const& vSchoolAbsorb = GetAurasByType(SPELL_AURA_SCHOOL_ABSORB);
        for (AuraList::const_iterator i = vSchoolAbsorb.begin(); i != vSchoolAbsorb.end() && remainingDamage > 0; ++i)
        {
            Modifier* mod = (*i)->GetModifier();
            if (!(mod->m_miscvalue & schoolMask))
                continue;

            MANGOS_DEBUG_ASSERT((mod->m_amount - floor(mod->m_amount)) == 0.f);

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
            if (remainingDamage < currentAbsorb)
                currentAbsorb = remainingDamage;

            remainingDamage -= currentAbsorb;

            // Reduce shield amount
            mod->m_amount -= currentAbsorb;
            if ((*i)->GetHolder()->DropAuraCharge())
                mod->m_amount = 0;
            // Need remove it later
            if (mod->m_amount <= 0)
                existExpired = true;

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_10_2
            // Patch 1.11.0 changed Mage talent Improved Frost Ward to Frost Warding.
            // Improved Frost Ward - 50% of the damage absorbed by your Frost Ward is added to your mana.
            SpellEntry const* absorbProto = (*i)->GetSpellProto();
            if (absorbProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_FROST_WARD>() && HasAura(11189))
                CastCustomSpell(this, 27679, currentAbsorb / 2, {}, {}, true);
            else if (absorbProto->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_FIRE_WARD>())
            {
                Unit::AuraList const& mOverrideClassScript = GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
                for (const auto i : mOverrideClassScript)
                    // Patch 1.11.0 changed Mage talent Improved Fire Ward.
                    // Old effect - Causes your Fire Ward to reflect 20%/35% of the Fire damage absorbed back to the caster.
                    // The % values don't show up anywhere in dbcs other than the tooltip
                    if (i->GetModifier()->m_miscvalue == 948)
                        if (i->GetId() == 11094) // Improved Fire Ward 1
                            CastCustomSpell(pCaster->ToUnit(), 12559, 0.2f * currentAbsorb, {}, {}, true);
                        else if (i->GetId() == 13043) // Improved Fire Ward 2
                            CastCustomSpell(pCaster->ToUnit(), 12559, 0.35f * currentAbsorb, {}, {}, true);
            }
#endif
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
    };

    auto HandleManaShield = [&]()
    {
        // absorb by mana cost
        AuraList const& vManaShield = GetAurasByType(SPELL_AURA_MANA_SHIELD);
        for (AuraList::const_iterator i = vManaShield.begin(), next; i != vManaShield.end() && remainingDamage > 0; i = next)
        {
            next = i;
            ++next;

            // check damage school mask
            if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
                continue;

            int32 currentAbsorb;
            if (remainingDamage >= (*i)->GetModifier()->m_amount)
                currentAbsorb = (*i)->GetModifier()->m_amount;
            else
                currentAbsorb = remainingDamage;

            if (float manaMultiplier = (*i)->GetSpellProto()->EffectMultipleValue[(*i)->GetEffIndex()])
            {
                if (Player* modOwner = GetSpellModOwner())
                    modOwner->ApplySpellMod((*i)->GetId(), SPELLMOD_MULTIPLE_VALUE, manaMultiplier, spell);

                int32 maxAbsorb = dither(GetPower(POWER_MANA) / manaMultiplier);
                if (currentAbsorb > maxAbsorb)
                    currentAbsorb = maxAbsorb;

                int32 manaReduction = dither(currentAbsorb * manaMultiplier);
                ApplyPowerMod(POWER_MANA, manaReduction, false);
            }

            (*i)->GetModifier()->m_amount -= currentAbsorb;
            if ((*i)->GetModifier()->m_amount <= 0)
            {
                RemoveAurasDueToSpell((*i)->GetId());
                next = vManaShield.begin();
            }

            remainingDamage -= currentAbsorb;
        }
    };

    auto HandleSplitDamage = [&]()
    {
        AuraList const& vSplitDamageFlat = GetAurasByType(SPELL_AURA_SPLIT_DAMAGE_FLAT);
        for (AuraList::const_iterator i = vSplitDamageFlat.begin(), next; i != vSplitDamageFlat.end() && remainingDamage >= 0; i = next)
        {
            next = i;
            ++next;

            // check damage school mask
            if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
                continue;

            // Damage can be splitted only if aura has an alive caster
            Unit* reflectTo = (*i)->GetCaster();
            if (!reflectTo || reflectTo == this || !reflectTo->IsInWorld())
                continue;

            // World of Warcraft Client Patch 1.7.0 (2005-09-13)
            // - Blessing of Sacrifice no longer shares damage with dead Paladins
            //  (You can no longer kill Paladin Ghosts).
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
            if (!reflectTo->IsAlive())
                continue;
#else
            if (reflectTo->GetDeathState() == DEAD && reflectTo->IsPlayer())
            {
                // revive the paladin with 1 hp so we can kill him again
                static_cast<Player*>(reflectTo)->ResurrectPlayer(0);
                static_cast<Player*>(reflectTo)->SpawnCorpseBones();
            }
            else if (reflectTo->GetDeathState() != ALIVE)
                continue;
#endif

            int32 currentAbsorb;
            if (remainingDamage >= (*i)->GetModifier()->m_amount)
                currentAbsorb = (*i)->GetModifier()->m_amount;
            else
                currentAbsorb = remainingDamage;

            remainingDamage -= currentAbsorb;

            uint32 splitted = currentAbsorb;
            uint32 splitted_absorb = 0;
            // Nostalrius : la reflection (bene de sacrifice par exemple) ne fait pas forcement des degats (si pala sous bouclier divin)
            uint32 reflectAbsorb = 0;
            int32 reflectResist = 0;
            // We avoid an infinite loop
            if (!reflectTo->HasAuraType(SPELL_AURA_SPLIT_DAMAGE_FLAT))
                reflectTo->CalculateDamageAbsorbAndResist(pCaster, schoolMask, DOT, splitted, &reflectAbsorb, &reflectResist, spellProto);
            splitted -= (reflectAbsorb + reflectResist);
            pCaster->DealDamageMods(reflectTo, splitted, &splitted_absorb);
            pCaster->SendSpellNonMeleeDamageLog(reflectTo, (*i)->GetSpellProto()->Id, splitted, schoolMask, splitted_absorb, 0, (damagetype == DOT), 0, false, true);
            CleanDamage cleanDamage = CleanDamage(splitted, BASE_ATTACK, MELEE_HIT_NORMAL, reflectAbsorb, reflectResist);
            pCaster->DealDamage(reflectTo, splitted, &cleanDamage, DOT, schoolMask, (*i)->GetSpellProto(), false);
        }

        AuraList const& vSplitDamagePct = GetAurasByType(SPELL_AURA_SPLIT_DAMAGE_PCT);
        for (AuraList::const_iterator i = vSplitDamagePct.begin(), next; i != vSplitDamagePct.end() && remainingDamage >= 0; i = next)
        {
            next = i;
            ++next;

            // check damage school mask
            if (((*i)->GetModifier()->m_miscvalue & schoolMask) == 0)
                continue;

            // Damage can be splitted only if aura has an alive caster
            Unit* caster = (*i)->GetCaster();
            if (!caster || caster == this || !caster->IsInWorld() || !caster->IsAlive())
                continue;

            uint32 splitted = uint32(remainingDamage * (*i)->GetModifier()->m_amount / 100.0f);

            remainingDamage -=  int32(splitted);

            uint32 split_absorb = 0;
            pCaster->DealDamageMods(caster, splitted, &split_absorb);

            // World of Warcraft Client Patch 1.7.0 (2005-09-13)
            // - Fixed a bug where Soul Link and Power Word: Sheild, when used together,
            //   would heal the Warlock instead of splitting or absorbing damage.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
            if (HasAuraType(SPELL_AURA_SCHOOL_ABSORB))
            {
                ModifyHealth(splitted);
                continue;
            }
#endif

            pCaster->SendSpellNonMeleeDamageLog(caster, (*i)->GetSpellProto()->Id, splitted, schoolMask, split_absorb, 0, (damagetype == DOT), 0, false, true);

            CleanDamage cleanDamage = CleanDamage(splitted, BASE_ATTACK, MELEE_HIT_NORMAL, 0, 0);
            pCaster->DealDamage(caster, splitted, &cleanDamage, DOT, schoolMask, (*i)->GetSpellProto(), false);
        }
    };

    // World of Warcraft Client Patch 1.11.0 (2006-06-20)
    // - Mana Shield - Damage taken will now be absorbed by other absorb spells
    //   (e.g. Ice Barrier, Power Word: Shield) before being absorbed by Mana Shield.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    HandleSchoolAbsorb();
    HandleManaShield();
    HandleSplitDamage();
    // World of Warcraft Client Patch 1.7.0 (2005 - 09 - 13)
    // - Damage absorption is now applied before damage splitting effects.
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    HandleManaShield();
    HandleSchoolAbsorb();
    HandleSplitDamage();
#else
    HandleSplitDamage();
    HandleManaShield();
    HandleSchoolAbsorb();
#endif

    *absorb = damage - remainingDamage - *resist;
}

void Unit::CalculateAbsorbResistBlock(SpellCaster* pCaster, SpellNonMeleeDamage* damageInfo, SpellEntry const* spellProto, WeaponAttackType attType, Spell* spell)
{
    bool blocked = false;
    // Get blocked status
    switch (spellProto->DmgClass)
    {
        // Melee and Ranged Spells
        case SPELL_DAMAGE_CLASS_RANGED:
        case SPELL_DAMAGE_CLASS_MELEE:
            blocked = IsSpellPartiallyBlocked(pCaster, spellProto, attType);
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

    CalculateDamageAbsorbAndResist(pCaster, spellProto->GetSpellSchoolMask(), SPELL_DIRECT_DAMAGE, damageInfo->damage, &damageInfo->absorb, &damageInfo->resist, spellProto, spell);
    uint32 const bonus = (damageInfo->resist < 0 ? uint32(std::abs(damageInfo->resist)) : 0);
    damageInfo->damage += bonus;
    uint32 const malus = (damageInfo->resist > 0 ? (damageInfo->absorb + uint32(damageInfo->resist)) : damageInfo->absorb);
    damageInfo->damage = (damageInfo->damage <= malus ? 0 : (damageInfo->damage - malus));
}

void Unit::AttackerStateUpdate(Unit* pVictim, WeaponAttackType attType, bool extra)
{
    if (!pVictim->IsAlive())
        return;

    if (!extra && IsNonMeleeSpellCasted(false))
        return;

    uint32 hitInfo;
    if (attType == BASE_ATTACK)
        hitInfo = HITINFO_NORMALSWING + HITINFO_AFFECTS_VICTIM;
    else if (attType == OFF_ATTACK)
        hitInfo = HITINFO_LEFTSWING + HITINFO_AFFECTS_VICTIM;
    else
        return;                                             // ignore ranged case

    if (GetExtraAttacks() && !extra)
        AddExtraAttackOnUpdate();

    // melee attack spell casted at main hand attack only
    if (attType == BASE_ATTACK && m_currentSpells[CURRENT_MELEE_SPELL] && !extra)
    {
        m_currentSpells[CURRENT_MELEE_SPELL]->cast();
        Spell* spell = m_currentSpells[CURRENT_MELEE_SPELL];
        if (!spell || !spell->m_spellInfo->IsNextMeleeSwingSpell() || spell->isSuccessCast())
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
    
    ProcDamageAndSpell(ProcSystemArguments(damageInfo.target, damageInfo.procAttacker, damageInfo.procVictim, damageInfo.procEx, damageInfo.totalDamage, damageInfo.totalDamage + damageInfo.totalAbsorb + damageInfo.totalResist, damageInfo.attackType));

    // Damage is done after procs so it can trigger auras on the victim that affect the caster in case of killing blow.
    DealMeleeDamage(&damageInfo, true);

    // In sniffs SMSG_ATTACKERSTATEUPDATE is sent after chance on hit spell casts from CastItemCombatSpell. This fixes animation for Frostbrand Attack.
    SendAttackStateUpdate(&damageInfo);

    if (IsPlayer())
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "AttackerStateUpdate: (Player) %u attacked %u (TypeId: %u) for %u dmg, absorbed %u, blocked %u, resisted %u.",
                         GetGUIDLow(), pVictim->GetGUIDLow(), pVictim->GetTypeId(), damageInfo.totalDamage, damageInfo.totalAbsorb, damageInfo.blocked_amount, damageInfo.totalResist);
    else
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "AttackerStateUpdate: (NPC)    %u attacked %u (TypeId: %u) for %u dmg, absorbed %u, blocked %u, resisted %u.",
                         GetGUIDLow(), pVictim->GetGUIDLow(), pVictim->GetTypeId(), damageInfo.totalDamage, damageInfo.totalAbsorb, damageInfo.blocked_amount, damageInfo.totalResist);

    // if damage pVictim call AI reaction
    pVictim->AttackedBy(this);
    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_ATTACKING_CANCELS);
}

MeleeHitOutcome Unit::RollMeleeOutcomeAgainst(Unit const* pVictim, WeaponAttackType attType) const
{
    // This is only wrapper

    // Miss chance based on melee
    float const miss_chance = MeleeMissChanceCalc(pVictim, attType);

    // Critical hit chance
    float const crit_chance = GetUnitCriticalChance(attType, pVictim);

    // stunned target cannot dodge and this is check in GetUnitDodgeChance() (returned 0 in this case)
    float const dodge_chance = pVictim->GetUnitDodgeChance();
    float const block_chance = pVictim->GetUnitBlockChance();
    float const parry_chance = pVictim->GetUnitParryChance();

    // Useful if want to specify crit & miss chances for melee, else it could be removed
    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "MELEE OUTCOME: miss %f crit %f dodge %f parry %f block %f", miss_chance, crit_chance, dodge_chance, parry_chance, block_chance);

    return RollMeleeOutcomeAgainst(pVictim, attType, int32(crit_chance * 100), int32(miss_chance * 100), int32(dodge_chance * 100), int32(parry_chance * 100), int32(block_chance * 100), false);
}

MeleeHitOutcome Unit::RollMeleeOutcomeAgainst(Unit const* pVictim, WeaponAttackType attType, int32 crit_chance, int32 miss_chance, int32 dodge_chance, int32 parry_chance, int32 block_chance, bool SpellCasted) const
{
    if (IsPlayer() && ToPlayer()->HasCheatOption(PLAYER_CHEAT_ALWAYS_CRIT))
        return MELEE_HIT_CRIT;

    if (pVictim->IsCreature() && ((Creature*)pVictim)->IsInEvadeMode())
        return MELEE_HIT_EVADE;

    int32 attackerMaxSkillValueForLevel = GetSkillMaxForLevel(pVictim);
    int32 victimMaxSkillValueForLevel = pVictim->GetSkillMaxForLevel(this);

    int32 attackerWeaponSkill = GetWeaponSkillValue(attType, pVictim);
    int32 victimDefenseSkill = pVictim->GetDefenseSkillValue(this);

    // bonus from skills is 0.04%
    int32    skillDiff = attackerWeaponSkill - victimMaxSkillValueForLevel;
    int32    cappedSkillDiff = std::min(attackerMaxSkillValueForLevel, attackerWeaponSkill) - victimMaxSkillValueForLevel;
    int32    blockSkillBonus = pVictim->IsPlayer() ? 4 * skillDiff : 10 * skillDiff;
    int32    dodgeSkillBonus = pVictim->IsPlayer() ? 4 * skillDiff : 10 * skillDiff;
    int32    parrySkillBonus = pVictim->IsPlayer() ? 4 * skillDiff : cappedSkillDiff < -10 ? 60 * cappedSkillDiff : 20 * cappedSkillDiff;
    int32    sum = 0, tmp = 0;
    int32    roll = urand(0, 9999);

    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: skill bonus of %d for attacker", skillBonus);
    //DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: rolled %d, miss %d, dodge %d, parry %d, block %d, crit %d", roll, miss_chance, dodge_chance, parry_chance, block_chance, crit_chance);

    tmp = miss_chance;

    if (tmp > 0 && roll < (sum += tmp))
    {
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: MISS");
        return MELEE_HIT_MISS;
    }

    // always crit against a sitting target (except 0 crit chance)
    if (pVictim->IsPlayer() && (crit_chance > 0 || IsCreature()) && !pVictim->IsStandingUp())
    {
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: CRIT (sitting victim)");
        return MELEE_HIT_CRIT;
    }

    bool from_behind = !pVictim->HasInArc(this);

    if (from_behind)
        DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: attack came from behind.");

    // Dodge chance

    // only players can't dodge if attacker is behind
    if (!pVictim->IsPlayer() || !from_behind)
    {
        dodge_chance -= dodgeSkillBonus;

        // Low level reduction
        if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
            dodge_chance *= pVictim->GetLevel() / 10.0f;

        if (dodge_chance > 0 &&                         // check if unit _can_ dodge
            (roll < (sum += dodge_chance)))
        {
            DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: DODGE <%d, %d)", sum - tmp, sum);
            return MELEE_HIT_DODGE;
        }
    }

    // parry chances
    // check if attack comes from behind, nobody can parry or block if attacker is behind
    if (!from_behind && (parry_chance > 0))
    {
        if (pVictim->IsPlayer() || !((Creature*)pVictim)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_PARRY))
        {
            parry_chance -= parrySkillBonus;

            // Low level reduction
            if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
                parry_chance *= pVictim->GetLevel() / 10.0f;

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
            (IsPlayer() || ((Creature*)this)->IsPet()) &&
            !pVictim->IsPlayer() && !((Creature*)pVictim)->IsPet() && !((Creature*)pVictim)->IsTotem())
    {
        // cap possible value (with bonuses > max skill)
        int32 skill = attackerWeaponSkill;
        int32 maxskill = attackerMaxSkillValueForLevel;
        skill = (skill > maxskill) ? maxskill : skill;

        // (Youfie) The +skill before BC does not reduce the frequency of glancing blows once it is equal to the player's level*5
        if (attackerWeaponSkill > maxskill)
            attackerWeaponSkill = maxskill;

        // (Youfie) Chance of glance in Vanilla (unchanged by +skill beyond maxskill, see above):
        tmp = (10 + ((victimDefenseSkill - attackerWeaponSkill) * 2)) * 100;
        tmp = tmp > 4000 ? 4000 : tmp;
        if (tmp < 0)
            tmp = 0;
        // sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "tmp = %i, Skill = %i, Max Skill = %i", tmp, attackerWeaponSkill, attackerMaxSkillValueForLevel); //For testing & debugging via the console

        if (roll < (sum += tmp))
        {
            DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "RollMeleeOutcomeAgainst: GLANCING <%d, %d)", sum - 4000, sum);
            return MELEE_HIT_GLANCING;
        }
    }

    // block chances
    // check if attack comes from behind, nobody can parry or block if attacker is behind
    if (!from_behind && (block_chance > 0))
    {
        if ((pVictim->IsPlayer() || !((Creature*)pVictim)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_BLOCK))
          && !(IsCreature() && GetMeleeDamageSchoolMask() != SPELL_SCHOOL_MASK_NORMAL))  // can't block elemental melee attacks from mobs
        {
            block_chance -= blockSkillBonus;

            // mobs cannot block more than 5% of attacks regardless of rating difference
            if (!pVictim->IsPlayer() && (block_chance > 500))
                block_chance = 500;

            // Low level reduction
            if (!pVictim->IsPlayer() && pVictim->GetLevel() < 10)
                block_chance *= pVictim->GetLevel() / 10.0f;

            if (block_chance > 0 &&                         // check if unit _can_ block
                (roll < (sum += block_chance)))
            {
                // Critical chance
                tmp = crit_chance;
                if (IsPlayer() && SpellCasted && tmp > 0)
                {
                    if (roll_chance_i(tmp / 100))
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "RollMeleeOutcomeAgainst: BLOCKED CRIT");
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

    if ((!IsPlayer() && !IsPet()) &&
        !((Creature*)this)->HasStaticFlag(CREATURE_STATIC_FLAG_2_NO_CRUSHING_BLOWS) &&
        !SpellCasted /*Only autoattack can be crashing blow*/)
    {
        if (((Creature*)this)->HasExtraFlag(CREATURE_FLAG_EXTRA_ALWAYS_CRUSH))
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

float Unit::CalculateDamage(WeaponAttackType attType, bool normalized, uint8 index) const
{
    float min_damage, max_damage;

    if (!IsPlayer() && index != 0)
        return 0;

    if ((normalized || index != 0) && IsPlayer())
        static_cast<Player const*>(this)->CalculateMinMaxDamage(attType, normalized, min_damage, max_damage, index);
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

    if (min_damage < 0) min_damage = 0.0f;
    if (max_damage < 0) max_damage = 0.0f;

    if (min_damage > max_damage)
        std::swap(min_damage, max_damage);

    if (max_damage == 0.0f)
        max_damage = 5.0f;

    return frand(min_damage, max_damage);
}

void Unit::SendMeleeAttackStart(Unit const* pVictim) const
{
    WorldPacket data(SMSG_ATTACKSTART, 8 + 8);
    data << GetObjectGuid();
    data << pVictim->GetObjectGuid();

    SendObjectMessageToSet(&data, true);
}

void Unit::SendMeleeAttackStop(Unit const* pVictim) const
{
    if (!pVictim)
        return;

    WorldPacket data(SMSG_ATTACKSTOP, (8 + 8 + 4));         // guess size, max is 9+9+4
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GetPackGUID();
    data << pVictim->GetPackGUID();                          // can be 0x00...
#else
    data << GetGUID();
    data << pVictim->GetGUID();                          // can be 0x00...
#endif
    data << uint32(0);                                      // can be 0x1
    SendObjectMessageToSet(&data, true);
    DETAIL_FILTER_LOG(LOG_FILTER_COMBAT, "%s %u stopped attacking %s %u", (IsPlayer() ? "player" : "creature"), GetGUIDLow(), (pVictim->IsPlayer() ? "player" : "creature"), pVictim->GetGUIDLow());
}

bool Unit::IsSpellPartiallyBlocked(SpellCaster const* pCaster, SpellEntry const* spellEntry, WeaponAttackType attackType) const
{
    if (!HasInArc(pCaster))
        return false;

    if (spellEntry)
    {
        // Some spells cannot be blocked
        if (spellEntry->HasAttribute(SPELL_ATTR_NO_ACTIVE_DEFENSE))
            return false;
        // Full block checked in MeleeSpellHitResult (prevents all effects)
        if (spellEntry->HasAttribute(SPELL_ATTR_EX3_COMPLETELY_BLOCKED))
            return false;
    }

    // Check creatures flags_extra for disable block
    if (Creature const* pCreature = ToCreature())
    {
        if (pCreature->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_BLOCK))
            return false;
    }

    return RollSpellBlockChanceOutcome(pCaster, attackType);
}

bool Unit::RollSpellBlockChanceOutcome(SpellCaster const* pCaster, WeaponAttackType attackType) const
{
    float blockChance = GetUnitBlockChance();

    int32 skillDiff = int32(pCaster->GetWeaponSkillValue(attackType)) - int32(GetSkillMaxForLevel());
    blockChance -= IsPlayer() ? skillDiff * 0.04f : skillDiff * 0.1f;

    // mobs cannot block more than 5% of attacks regardless of rating difference
    if (!IsPlayer() && (blockChance > 5))
        blockChance = 5.0f;

    // Low level reduction
    if (!IsPlayer() && GetLevel() < 10)
        blockChance *= GetLevel() / 10.0f;

    if (blockChance < 0)
        blockChance = 0;

    return roll_chance_f(blockChance);
}

float Unit::RollMagicResistanceMultiplierOutcomeAgainst(float resistanceChance, SpellSchoolMask schoolMask, DamageEffectType damagetype, SpellEntry const* spellProto) const
{
    // Magic vulnerability instead of magic resistance:
    bool negative;
    if (negative = (resistanceChance < 0.0f))
        resistanceChance = -resistanceChance;

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

    return (negative ? -resistCnt : resistCnt);
}

bool Unit::IsEffectResist(SpellEntry const* spell, int eff) const
{
    // Chance resist mechanic
    int32 effect_mech = spell->EffectMechanic[eff];
    if (effect_mech && effect_mech != spell->Mechanic)
    {
        int32 rand = urand(0, 99);
        int32 resist_mech = GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_MECHANIC_RESISTANCE, effect_mech);
        return (rand < resist_mech);
    }
    return false;
}

float Unit::MeleeMissChanceCalc(Unit const* pVictim, WeaponAttackType attType) const
{
    if (!pVictim || !pVictim->IsStandingUp())
        return 0.0f;

    // Base misschance 5%
    float missChance = 5.0f;

    // DualWield - white damage has an additional 19% miss penalty
    if (HaveOffhandWeapon() && attType != RANGED_ATTACK)
    {
        bool isNormal = false;
        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
        {
            if (m_currentSpells[i] && (m_currentSpells[i]->m_spellInfo->GetSpellSchoolMask() & SPELL_SCHOOL_MASK_NORMAL))
            {
                isNormal = true;
                break;
            }
        }
        if (!isNormal && !m_currentSpells[CURRENT_MELEE_SPELL])
            missChance += 19.0f;
    }

    int32 skillDiff = int32(GetWeaponSkillValue(attType, pVictim)) - int32(pVictim->GetDefenseSkillValue(this));
    float skillDiffBonus = 0.0f;
    // PvP - PvE melee chances
    if (pVictim->IsPlayer())
        skillDiffBonus = skillDiff * 0.04f;
    else if (skillDiff < -10)
        skillDiffBonus = skillDiff * 0.2f;
    else
        skillDiffBonus = skillDiff * 0.1f;
    missChance -= skillDiffBonus;

    // Low level reduction
    float const levelDiffMultiplier = !pVictim->IsPlayer() && pVictim->GetLevel() < 10 ? pVictim->GetLevel() / 10.0f : 1.0f;
    missChance *= levelDiffMultiplier;

    // Hit chance bonus from attacker based on ratings and auras
    float hitChance = GetWeaponBasedAuraModifier(attType, SPELL_AURA_MOD_HIT_CHANCE);

    // There is some code in 1.12 that explicitly adds a modifier that causes the first 1% of +hit gained from
    // talents or gear to be ignored against monsters with more than 10 Defense Skill above the attacking player’s Weapon Skill.
    // https://us.forums.blizzard.com/en/wow/t/bug-hit-tables/185675/33
    if (skillDiff < -10 && hitChance > 0.0f)
        hitChance -= 1.0f;

    // World of Warcraft Client Patch 1.8.0 (2005-10-11)
    // - Items which provide +hit chance will now be allowed to counteract the
    //   increased miss chance penalty of dual - wielding.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1
    float const missChanceWithoutDualWieldPenalty = (5.0f - skillDiffBonus) * levelDiffMultiplier;
    float const adjustedDualWieldPenalty = missChance - std::max(0.0f, missChanceWithoutDualWieldPenalty);
#endif

    missChance -= hitChance;

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1
    if ((hitChance > 0.0f) && (adjustedDualWieldPenalty > 0.0f) && IsPlayer())
        missChance = std::max(missChance, adjustedDualWieldPenalty);
#endif

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

float Unit::GetUnitDodgeChance() const
{
    if (IsNonMeleeSpellCasted(false) || HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;
    if (IsPlayer())
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
    if (IsNonMeleeSpellCasted(false) || HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;

    float chance = 0.0f;

    if (Player const* pPlayer = ToPlayer())
    {
        if (pPlayer->CanParry() && pPlayer->GetWeaponForParry())
            chance = GetFloatValue(PLAYER_PARRY_PERCENTAGE);
    }
    else
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
    if (IsNonMeleeSpellCasted(false) || HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return 0.0f;

    if (Player const* pPlayer = ToPlayer())
    {
        // Test results from classic:
        // Sheath State Unarmed - Can't Block
        // Sheath State Melee - Can Block
        // Sheath State Ranged - Can Block
        // Parry and Dodge don't have any sheath state restrictions.
        // https://warcraft.wiki.gg/wiki/Patch_2.1.0_(undocumented_changes)
        // "You can now block attacks while your shield is in the sheathed position."
        // "Previously, Warriors, Shamans and Paladins were vulnerable while using"
        // "instant-cast abilities that caused their shield to momentarily appear on their back."
        if (pPlayer->GetSheath() == SHEATH_STATE_UNARMED)
            return 0.0f;

        if (pPlayer->CanBlock() && pPlayer->CanUseEquippedWeapon(OFF_ATTACK))
        {
            Item* tmpitem = pPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
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

float Unit::GetUnitCriticalChance(WeaponAttackType attackType, Unit const* pVictim) const
{
    float crit;

    if (IsPlayer())
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
    int32 skillDiff = int32(GetWeaponSkillValue(attackType, pVictim)) - int32(pVictim->GetDefenseSkillValue(this));
    int32 minSkillValue = GetSkillMaxForLevel(pVictim) < GetWeaponSkillValue(attackType, pVictim) ? GetSkillMaxForLevel(pVictim) : GetWeaponSkillValue(attackType, pVictim);
    int32 cappedSkillDiff = minSkillValue - pVictim->GetDefenseSkillValue(this);

    crit += (pVictim->IsPlayer() || skillDiff > 0) ? skillDiff * 0.04f : cappedSkillDiff * 0.2f;

    if (crit < 0.0f)
        crit = 0.0f;
    return crit;
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
        SpellAuraHolder* holder = iter->second;

        if (!holder->IsPermanent() && holder->GetAuraDuration() == 0)
        {
            RemoveSpellAuraHolder(holder, AURA_REMOVE_BY_EXPIRE);
            iter = m_spellAuraHolders.begin();
        }
        else
            ++iter;
    }

    if (!m_spellGameObjects.empty())
    {
        for (auto i = m_spellGameObjects.begin(); i != m_spellGameObjects.end();)
        {
            //(*i)->Update(difftime);
            if (!(*i)->isSpawned())
            {
                (*i)->SetOwnerGuid(ObjectGuid());
                (*i)->SetRespawnTime(0);
                (*i)->Delete();
                i = m_spellGameObjects.erase(i);
            }
            else
                ++i;
        }
    }
}

void Unit::_UpdateAutoRepeatSpell()
{
    // check "realtime" interrupts
    if ((IsPlayer() && IsMoving()) || IsNonMeleeSpellCasted(false, false, true))
    {
        // cancel wand shoot
        if (m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->m_spellInfo->Category == 351)
            InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
        // set 0.5 second wind-up time.
        m_AutoRepeatFirstCast = true;
        return;
    }

    // apply delay
    if (m_AutoRepeatFirstCast && GetAttackTimer(RANGED_ATTACK) < 500)
        SetAttackTimer(RANGED_ATTACK, 500);
    m_AutoRepeatFirstCast = false;

    // castroutine
    if (IsAttackReady(RANGED_ATTACK))
    {
        // Check if able to cast
        // We need to update pointers before calling CheckCast !
        m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->UpdatePointers();
        SpellCastResult result = m_currentSpells[CURRENT_AUTOREPEAT_SPELL]->CheckCast(true);

        // Just delay it if moving
        if (result == SPELL_FAILED_MOVING ||
            result == SPELL_FAILED_NOT_READY)
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
        ResetAttackTimer(RANGED_ATTACK);
        SetStandState(UNIT_STAND_STATE_STAND);
    }
}

void Unit::SetInFront(Unit const* pTarget)
{
    SetOrientation(GetAngle(pTarget));
}

void Unit::SetFacingTo(float ori)
{
    m_movementInfo.ChangeOrientation(ori);

    Movement::MoveSplineInit init(*this, "SetFacingTo");
    if (GenericTransport* t = GetTransport())
        init.SetTransport(t->GetGUIDLow());
    init.SetFacing(ori);
    init.Launch();
}

void Unit::SetFacingToObject(WorldObject const* pObject)
{
    // never face when already moving
    if (!IsStopped())
        return;

    // TODO: figure out under what conditions creature will move towards object instead of facing it where it currently is.
    SetFacingTo(GetAngle(pObject));
}

bool Unit::IsBehindTarget(Unit const* pTarget, bool strict) const
{
    if (strict)
    {
        if (Creature const* pCreature = pTarget->ToCreature())
        {
            // Mobs always face their currect victim, unless incapacitated.
            if (!pCreature->m_castingTargetGuid && (pCreature->GetVictim() == this) &&
                !pTarget->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_CONFUSED | UNIT_FLAG_FLEEING | UNIT_FLAG_POSSESSED) &&
                !pTarget->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
                return false;
        }
    }

    return !pTarget->HasInArc(this);
}

bool Unit::CantPathToVictim() const
{
    if (!GetVictim())
        return false;

    if (GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
        return false;

    return !GetMotionMaster()->GetCurrent()->IsReachable();
}

bool Unit::IsInAccessablePlaceFor(Creature const* c) const
{
    if (IsInWater())
        return c->CanSwim();
    else
        return c->CanWalk() || c->CanFly();
}

bool Unit::CanSwimAtPosition(float x, float y, float z) const
{
    return GetTerrain()->IsSwimmable(x, y, z, GetMinSwimDepth());
}

bool Unit::IsInWater() const
{
    return GetTerrain()->IsInWater(GetPositionX(), GetPositionY(), GetPositionZ());
}

bool Unit::IsUnderwater() const
{
    return GetTerrain()->IsUnderWater(GetPositionX(), GetPositionY(), GetPositionZ());
}

float Unit::GetSpeedForMovementInfo(MovementInfo const& movementInfo) const
{
    float speed = 0.0f;
    if (movementInfo.HasMovementFlag(MOVEFLAG_SWIMMING))
        speed = GetSpeed(movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) ? MOVE_SWIM_BACK : MOVE_SWIM);
    else if (movementInfo.HasMovementFlag(MOVEFLAG_WALK_MODE))
        speed = GetSpeed(MOVE_WALK);
    else if (movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING))
        speed = GetSpeed(movementInfo.HasMovementFlag(MOVEFLAG_BACKWARD) ? MOVE_RUN_BACK : MOVE_RUN);

    return speed;
}

namespace Movement
{
    extern float computeFallElevation(float time, bool safeFall, float initialSpeed);
}

bool Unit::ExtrapolateMovement(MovementInfo const& mi, uint32 diffMs, float &x, float &y, float &z, float &outOrientation) const
{
    // Not currently handled cases.
    if ((mi.moveFlags & (MOVEFLAG_PITCH_UP | MOVEFLAG_PITCH_DOWN | MOVEFLAG_FALLINGFAR | MOVEFLAG_ONTRANSPORT)) ||
        !movespline->Finalized() || (mi.ctime == 0) || !IsMovedByPlayer())
        return false;

    x = mi.pos.x;
    y = mi.pos.y;
    z = mi.pos.z;
    outOrientation = mi.pos.o;
    float o = outOrientation;

    if (mi.moveFlags & MOVEFLAG_ROOT)
        return true;

    float speed = GetSpeedForMovementInfo(mi);

    if (mi.moveFlags & MOVEFLAG_BACKWARD)
        o += M_PI_F;
    else if (mi.moveFlags & MOVEFLAG_STRAFE_LEFT)
    {
        if (mi.moveFlags & MOVEFLAG_FORWARD)
            o += M_PI_F / 4;
        else
            o += M_PI_F / 2;
    }
    else if (mi.moveFlags & MOVEFLAG_STRAFE_RIGHT)
    {
        if (mi.moveFlags & MOVEFLAG_FORWARD)
            o -= M_PI_F / 4;
        else
            o -= M_PI_F / 2;
    }
    if (mi.moveFlags & MOVEFLAG_JUMPING)
    {
        float diffT = WorldTimer::getMSTimeDiff(mi.jump.startClientTime, diffMs + mi.ctime) / 1000.0f;
        x = mi.jump.start.x;
        y = mi.jump.start.y;
        z = mi.jump.start.z;
        // Fatal error. Avoid crashing here ...
        if (!x || !y || !z || diffT > 10000.0f)
            return false;
        x += mi.jump.cosAngle * mi.jump.xyspeed * diffT;
        y += mi.jump.sinAngle * mi.jump.xyspeed * diffT;
        z -= Movement::computeFallElevation(diffT, mi.moveFlags & MOVEFLAG_SAFE_FALL, -m_jumpInitialSpeed);
    }
    else if (mi.moveFlags & (MOVEFLAG_TURN_LEFT | MOVEFLAG_TURN_RIGHT))
    {
        if (mi.moveFlags & MOVEFLAG_MASK_MOVING)
        {
            // Every 2 sec
            float T = 0.75f * (GetSpeed(MOVE_TURN_RATE)) * (diffMs / 1000.0f);
            float R = 1.295f * speed / M_PI * cos(mi.s_pitch);
            z += diffMs * speed / 1000.0f * sin(mi.s_pitch);
            // Find the center of the circle we are moving on
            if (mi.moveFlags & MOVEFLAG_TURN_LEFT)
            {
                x += R * cos(o + M_PI / 2);
                y += R * sin(o + M_PI / 2);
                outOrientation += T;
                T = T - M_PI / 2.0f;
            }
            else
            {
                x += R * cos(o - M_PI / 2);
                y += R * sin(o - M_PI / 2);
                outOrientation -= T;
                T = -T + M_PI / 2.0f;
            }
            x += R * cos(o + T);
            y += R * sin(o + T);
        }
        else
        {
            float diffO = GetSpeed(MOVE_TURN_RATE) * diffMs / 1000.0f;
            if (mi.moveFlags & MOVEFLAG_TURN_LEFT)
                outOrientation += diffO;
            else
                outOrientation -= diffO;
            return true;
        }
    }
    else if (mi.moveFlags & MOVEFLAG_MASK_MOVING)
    {
        float dist = speed * diffMs / 1000.0f;
        x += dist * cos(o) * cos(mi.s_pitch);
        y += dist * sin(o) * cos(mi.s_pitch);
        z += dist * sin(mi.s_pitch);
    }
    else // If we reach here, we did not move
        return true;

    if (!MaNGOS::IsValidMapCoord(x, y, z, o))
        return false;

    if (!(mi.moveFlags & (MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR | MOVEFLAG_SWIMMING)))
        z = GetMap()->GetHeight(x, y, z);

    return GetMap()->isInLineOfSight(mi.pos.x, mi.pos.y, mi.pos.z + 0.5f, x, y, z + 0.5f);
}

void Unit::DeMorph()
{
    SetDisplayId(GetNativeDisplayId());
}

float Unit::GetTotalAuraModifier(AuraType auratype) const
{
    float modifier = 0.f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
    {
        // Exception for stealth detection, remove hidden trap detection (id:2836) from stealth modifier (should not be taken into account)
        // If it was the cast, rogue will see others rogue at 40 meters
        if (i->GetId() != 2836)
        {
            if (auratype == SPELL_AURA_MOD_STEALTH)
                modifier = std::max (modifier, i->GetModifier()->m_amount);
            else
                modifier += i->GetModifier()->m_amount;
        }
    }


    return modifier;
}

float Unit::GetTotalAuraMultiplier(AuraType auratype) const
{
    float multiplier = 1.0f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
        multiplier *= (100.0f + i->GetModifier()->m_amount) / 100.0f;

    return multiplier;
}

int32 Unit::GetMaxPositiveAuraModifier(AuraType auratype) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
        if (i->GetModifier()->m_amount > modifier)
            modifier = i->GetModifier()->m_amount;

    return modifier;
}

int32 Unit::GetMaxNegativeAuraModifier(AuraType auratype) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
        if (i->GetModifier()->m_amount < modifier)
            modifier = i->GetModifier()->m_amount;

    return modifier;
}

int32 Unit::GetTotalAuraModifierByMiscMask(AuraType auratype, uint32 misc_mask) const
{
    if (!misc_mask)
        return 0;

    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
    {
        Modifier* mod = i->GetModifier();
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
    for (const auto& i : mTotalAuraList)
    {
        Modifier* mod = i->GetModifier();
        if (mod->m_miscvalue & misc_mask)
            multiplier *= (100.0f + mod->m_amount) / 100.0f;
    }
    return multiplier;
}

int32 Unit::GetTotalAuraModifierByMiscValue(AuraType auratype, int32 misc_value) const
{
    int32 modifier = 0;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
    {
        Modifier* mod = i->GetModifier();
        if (mod->m_miscvalue == misc_value)
            modifier += mod->m_amount;
    }
    return modifier;
}

float Unit::GetTotalAuraMultiplierByMiscValue(AuraType auratype, int32 misc_value) const
{
    float multiplier = 1.0f;

    AuraList const& mTotalAuraList = GetAurasByType(auratype);
    for (const auto& i : mTotalAuraList)
    {
        Modifier* mod = i->GetModifier();
        if (mod->m_miscvalue == misc_value)
            multiplier *= (100.0f + mod->m_amount) / 100.0f;
    }
    return multiplier;
}

bool Unit::AddSpellAuraHolder(SpellAuraHolder* holder)
{
    SpellEntry const* aurSpellInfo = holder->GetSpellProto();

    // ghost spell check, allow apply any auras at player loading in ghost mode (will be cleanup after load)
    if (!IsAlive() && !aurSpellInfo->IsDeathPersistentSpell() && !aurSpellInfo->CanTargetDeadTarget() &&
            (!IsPlayer() || !((Player*)this)->GetSession()->PlayerLoading()))
    {
        delete holder;
        return false;
    }

    if (holder->GetTarget() != this)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Holder (spell %u) add to spell aura holder list of %s (lowguid: %u) but spell aura holder target is %s (lowguid: %u)",
                      holder->GetId(), (IsPlayer() ? "player" : "creature"), GetGUIDLow(),
                      (holder->GetTarget()->IsPlayer() ? "player" : "creature"), holder->GetTarget()->GetGUIDLow());
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
            SpellAuraHolder* foundHolder = iter->second;
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
            if (aurSpellInfo->IsChanneledSpell())
                continue;

            if (aurSpellInfo->Custom & SPELL_CUSTOM_SEPARATE_AURA_PER_CASTER)
                continue;

            bool stop = false;

            for (int32 i = 0; i < MAX_EFFECT_INDEX && !stop; ++i)
            {
                // no need to check non stacking auras that weren't/won't be applied on this target
                if (!foundHolder->m_auras[i] || !holder->m_auras[i])
                    continue;

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
                        stop = !aurSpellInfo->HasAttribute(SPELL_ATTR_EX3_DOT_STACKING_RULE);
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
    if (!aurSpellInfo->IsPassiveSpellStackableWithRanks() && !holder->IsPersistent())
    {
        if (!RemoveNoStackAurasDueToAuraHolder(holder))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK] Annulation de l'aura en cours : %u.", holder->GetId());
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
                        Spells::IsSingleTargetSpells(itr_spellEntry, aurSpellInfo))
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
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[Crash/Auras] Adding aura %u on player %s, but aura marked as deleted !", holder->GetId(), GetName());
        return false;
    }
    // add aura, register in lists and arrays
    m_spellAuraHolders.insert(SpellAuraHolderMap::value_type(holder->GetId(), holder));

    for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura* aur = holder->GetAuraByEffectIndex(SpellEffectIndex(i)))
            AddAuraToModList(aur);

    holder->ApplyAuraModifiers(true, true);
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Holder of spell %u now is in use", holder->GetId());

    // if aura deleted before boosts apply ignore
    // this can be possible it it removed indirectly by triggered spell effect at ApplyModifier
    if (holder->IsDeleted())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, ">> Aura %u is deleted", holder->GetId());
        return false;
    }
    holder->HandleSpellSpecificBoosts(true);

    // Check debuff limit
    //sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "AddSpellAuraHolder: Adding spell %d, debuff limit affected: %d", holder->GetId(), holder->IsAffectedByVisibleSlotLimit());
    if (holder->IsAffectedByVisibleSlotLimit())
    {
        if (holder->IsPositive())
        {
            uint32 positveAuras = GetVisibleAurasCount(true);
            if (positveAuras > MAX_POSITIVE_AURAS)
            {
                // We may have removed the aura we just applied ...
                if (RemoveAuraDueToVisibleSlotLimit(holder))
                    return false; // The holder has been deleted with 'RemoveSpellAuraHolder'
            }
        }
        else
        {
            uint32 negativeAuras = GetVisibleAurasCount(false);
            if (negativeAuras > sWorld.getConfig(CONFIG_UINT32_DEBUFF_LIMIT))
            {
                // We may have removed the aura we just applied ...
                if (RemoveAuraDueToVisibleSlotLimit(holder))
                    return false; // The holder has been deleted with 'RemoveSpellAuraHolder'
            }
        }
    }
    // When we call _AddSpellAuraHolder, we must have a free aura slot
    holder->_AddSpellAuraHolder();
    return true;
}

// Debuff limit
uint32 Unit::GetVisibleAurasCount(bool positive)
{
    uint32 count = 0;
    for (const auto& i : m_spellAuraHolders)
    {
        if (!i.second || !i.second->IsAffectedByVisibleSlotLimit() || positive != i.second->IsPositive())
            continue;

        ++count;
    }
    return count;
}

bool Unit::RemoveAuraDueToVisibleSlotLimit(SpellAuraHolder* currentAura)
{
    SpellAuraHolderMap::const_iterator i, uselessAura;
    uselessAura = m_spellAuraHolders.end();
    for (i = m_spellAuraHolders.begin(); i != m_spellAuraHolders.end(); ++i)
    {
        if (!i->second || !i->second->IsAffectedByVisibleSlotLimit() || i->second->IsInUse())
            continue;

        if (i->second->IsPositive() != currentAura->IsPositive())
            continue;

        if (uselessAura == m_spellAuraHolders.end() || uselessAura->second->IsMoreImportantVisualAuraThan(i->second))
            uselessAura = i;
    }

    SpellAuraHolder* removeAuraHolder = currentAura;
    if (uselessAura != m_spellAuraHolders.end())
        removeAuraHolder = uselessAura->second;
    RemoveSpellAuraHolder(removeAuraHolder);
    return currentAura == removeAuraHolder;
}

void Unit::AddAuraToModList(Aura* aura)
{
    if (aura->GetModifier()->m_auraname < TOTAL_AURAS)
        m_modAuras[aura->GetModifier()->m_auraname].push_back(aura);
}

bool Unit::RemoveNoStackAurasDueToAuraHolder(SpellAuraHolder* holder)
{
    if (!holder)
        return false;

    SpellEntry const* spellProto = holder->GetSpellProto();
    if (!spellProto)
        return false;

    uint32 spellId = holder->GetId();

    // passive spell special case (only non stackable with ranks)
    if (spellProto->Attributes & (SPELL_ATTR_PASSIVE | SPELL_ATTR_DO_NOT_DISPLAY))
    {
        if (spellProto->IsPassiveSpellStackableWithRanks())
            return true;
    }

    uint32 firstInChain = 0;
    bool dmgPeriodic = false;
    for (uint8 eff = 0; eff < MAX_EFFECT_INDEX; ++eff)
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

    SpellSpecific spellId_spec = Spells::GetSpellSpecific(spellId);

    bool const isAreaAura = spellProto->HasEffect(SPELL_EFFECT_APPLY_AREA_AURA_PARTY);
    std::vector<std::pair<uint32, ObjectGuid>> aurasToRemove;
    for (auto const& i : m_spellAuraHolders)
    {
        if (!i.second)
            continue;

        SpellEntry const* i_spellProto = i.second->GetSpellProto();

        if (!i_spellProto)
            continue;

        uint32 i_spellId = i_spellProto->Id;

        bool is_triggered_by_spell = false;
        // prevent triggering aura of removing aura that triggered it
        for (uint32 j : i_spellProto->EffectTriggerSpell)
            if (j == spellId)
                is_triggered_by_spell = true;

        // prevent triggered aura of removing aura that triggering it (triggered effect early some aura of parent spell
        for (uint32 j : spellProto->EffectTriggerSpell)
            if (j == i_spellId)
                is_triggered_by_spell = true;

        if (is_triggered_by_spell)
            continue;

        // early checks that spellId is passive non stackable spell
        if (i_spellProto->Attributes & (SPELL_ATTR_PASSIVE | SPELL_ATTR_DO_NOT_DISPLAY))
        {
            // passive non-stackable spells not stackable only for same caster
            // -> Sauf si 2 AreaAuras
            if (holder->GetCasterGuid() != i.second->GetCasterGuid() && !isAreaAura && !i_spellProto->HasEffect(SPELL_EFFECT_APPLY_AREA_AURA_PARTY))
                continue;

            // passive non-stackable spells not stackable only with another rank of same spell
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
            {
                if (Spells::CompareAuraRanks(spellId, i_spellId) < 0) // The current spell is more powerful.
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK] [%u/%u] The current spell is more powerful.", spellId, i_spellId);
                    // Prevent aura application.
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
                aurasToRemove.push_back({ spellId, i.second->GetCasterGuid() });
            else switch (spellId)
            {
            // Blessing of Light does not stack between casters.
                case 19977:
                case 19978:
                case 19979:
                case 25890:
                    aurasToRemove.push_back({ spellId, i.second->GetCasterGuid() });
                    break;
            }
            continue;
        }

        SpellGroup spellGroup;
        SpellGroupStackRule rule = sSpellMgr.CheckSpellGroupStackRules(i_spellId, spellId, spellGroup);
        if (rule != SPELL_GROUP_STACK_RULE_DEFAULT)
        {
            // Attempt to add apply less powerfull spell
            if (rule == SPELL_GROUP_STACK_RULE_POWERFULL_CHAIN && sSpellMgr.IsMorePowerfulSpell(i_spellId, spellId, spellGroup))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK][DB] Powerful chain %u > %u (group %u). Aura %u will not be applied.", i_spellId, spellId, spellGroup, spellId);
                return false;
            }
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK][DB] Unable to stack %u and %u. %u will be removed.", spellId, i_spellId, i_spellId);
            aurasToRemove.push_back({ i_spellId, i.second->GetCasterGuid() });
            continue;
        }

        if (i_spellProto->HasAura(SPELL_AURA_CHANNEL_DEATH_ITEM)) // Plusieurs demo par exemple peuvent mettre un siphon d'ame.
            continue;

        SpellSpecific i_spellId_spec = Spells::GetSpellSpecific(i_spellId);

        // single allowed spell specific from same caster or from any caster at target
        bool is_spellSpecPerTargetPerCaster = Spells::IsSingleFromSpellSpecificPerTargetPerCaster(spellId_spec, i_spellId_spec);

        bool is_spellSpecPerTarget = Spells::IsSingleFromSpellSpecificPerTarget(spellId_spec, i_spellId_spec);

        // HoTs in 1.x must be per target also
        if (!is_spellSpecPerTarget && firstInChain && firstInChain == sSpellMgr.GetFirstSpellInChain(i_spellId))
            is_spellSpecPerTarget = true;

        if (is_spellSpecPerTarget || (is_spellSpecPerTargetPerCaster && holder->GetCasterGuid() == i.second->GetCasterGuid()))
        {
            // cannot remove stronger snare / haste debuff
            if (spellId_spec == SPELL_SNARE || spellId_spec == SPELL_NEGATIVE_HASTE)
                if (!Spells::CompareSpellSpecificAuras(spellProto, i_spellProto))
                    return false;

            // cannot remove higher rank
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
                if (Spells::CompareAuraRanks(spellId, i_spellId) < 0)
                    return false;

            // Its a parent aura (create this aura in ApplyModifier)
            if (i.second->IsInUse())
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i.second->GetId(), holder->GetId());
                continue;
            }
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK][%u/%u] SpellSpecPerTarget ou SpellSpecPerCaster", spellId, i_spellId);
            aurasToRemove.push_back({ i_spellId, i.second->GetCasterGuid() });
            continue;
        }

        // spell with spell specific that allow single ranks for spell from diff caster
        // same caster case processed or early or later
        bool is_spellPerTarget = Spells::IsSingleFromSpellSpecificSpellRanksPerTarget(spellId_spec, i_spellId_spec);
        if (is_spellPerTarget && holder->GetCasterGuid() != i.second->GetCasterGuid() && sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
        {
            // cannot remove higher rank
            if (Spells::CompareAuraRanks(spellId, i_spellId) < 0)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK] [%u/%u] Rang plus haut.", spellId, i_spellId);
                return false;
            }

            // Its a parent aura (create this aura in ApplyModifier)
            if (i.second->IsInUse())
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i.second->GetId(), holder->GetId());
                continue;
            }
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK][%u/%u] SpellPerTarget", spellId, i_spellId);
            aurasToRemove.push_back({ i_spellId, i.second->GetCasterGuid() });
            continue;
        }

        // Periodic damage: allow different ranks from different casters for the same spell chain
        if (dmgPeriodic && holder->GetCasterGuid() != i.second->GetCasterGuid() && sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId))
        {
            continue;
        }

        // non single (per caster) per target spell specific (possible single spell per target at caster)
        if (!is_spellSpecPerTargetPerCaster && !is_spellSpecPerTarget && sSpellMgr.IsNoStackSpellDueToSpell(spellId, i_spellId))
        {
            // Prevent replacing higher ranks with lesser ranks
            if (sSpellMgr.IsRankSpellDueToSpell(spellProto, i_spellId) && Spells::CompareAuraRanks(spellId, i_spellId) < 0)
            {
                return false;
            }

            // Its a parent aura (create this aura in ApplyModifier)
            if (i.second->IsInUse())
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SpellAuraHolder (Spell %u) is in process but attempt removed at SpellAuraHolder (Spell %u) adding, need add stack rule for Unit::RemoveNoStackAurasDueToAuraHolder", i.second->GetId(), holder->GetId());
                continue;
            }
            sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[STACK][%u/%u] NoStackSpellDueToSpell", spellId, i_spellId);
            aurasToRemove.push_back({ i_spellId, i.second->GetCasterGuid() });
            continue;
        }
    }

    for (auto const& itr : aurasToRemove)
        RemoveAurasByCasterSpell(itr.first, itr.second);

    std::vector<uint32> lessPowerfulSpells;
    if (sSpellMgr.ListLessPowerfulSpells(spellId, lessPowerfulSpells))
        for (const auto& it : lessPowerfulSpells)
            RemoveAurasDueToSpell(it, holder);

    return true;
}

void Unit::RemoveAura(uint32 spellId, SpellEffectIndex effindex, Aura* except)
{
    SpellAuraHolderBounds spair = GetSpellAuraHolderBounds(spellId);
    for (SpellAuraHolderMap::iterator iter = spair.first; iter != spair.second;)
    {
        Aura* aur = iter->second->m_auras[effindex];
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
        Aura* aur = iter->second->m_auras[effindex];
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

void Unit::RemoveAuraHolderDueToSpellByDispel(uint32 spellId, uint32 stackAmount, ObjectGuid casterGuid)
{
    RemoveAuraHolderFromStack(spellId, stackAmount, casterGuid, AURA_REMOVE_BY_DISPEL);
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
    uint32 dispelMask = Spells::GetDispellMask(type);
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

void Unit::RemoveAurasDueToSpell(uint32 spellId, SpellAuraHolder const* except, AuraRemoveMode mode)
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

void Unit::RemoveAurasDueToItemSpell(Item const* castItem, uint32 spellId)
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

void Unit::RemoveAurasWithInterruptFlags(uint32 flags, uint32 except, bool checkProcFlags, bool skipStealth, bool skipInvisibility)
{
    for (SpellAuraHolderMap::iterator iter = m_spellAuraHolders.begin(); iter != m_spellAuraHolders.end();)
    {
        if ((!checkProcFlags || !iter->second->GetSpellProto()->procFlags) &&
            (!skipStealth || iter->second->GetSpellProto()->Dispel != DISPEL_STEALTH) &&
            (!skipInvisibility || iter->second->GetSpellProto()->Dispel != DISPEL_INVISIBILITY) &&
            (iter->second->GetSpellProto()->AuraInterruptFlags & flags) &&
            (iter->second->GetSpellProto()->Id != except))
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

void Unit::DeleteAuraHolder(SpellAuraHolder* holder)
{
    if (holder->IsInUse())
    {
        holder->SetDeleted();
        m_deletedHolders.push_back(holder);
    }
    else
        delete holder;
}

void Unit::RemoveSpellAuraHolder(SpellAuraHolder* holder, AuraRemoveMode mode)
{
    SpellCaster* caster = holder->GetRealCaster();
    bool isChanneled = holder->IsChanneled(); // cache for after the holder is deleted

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
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[Crash/Auras] Removing aura holder *not* in holders map ! Aura %u on %s", holder->GetId(), GetName());
    
    holder->SetRemoveMode(mode);
    holder->UnregisterSingleCastHolder();
    holder->HandleCastOnAuraRemoval();

    for (const auto aura : holder->m_auras)
    {
        if (aura)
            RemoveAura(aura, mode);
    }

    holder->_RemoveSpellAuraHolder();

    if (mode != AURA_REMOVE_BY_DELETE)
        holder->HandleSpellSpecificBoosts(false);

    uint32 auraSpellId = holder->GetId();

    // If holder in use (removed from code that plan access to it data after return)
    // store it in holder list with delayed deletion
    DeleteAuraHolder(holder);

    if (isChanneled && caster)
    {
        Spell* channeled = caster->GetCurrentSpell(CURRENT_CHANNELED_SPELL);
        if (channeled && channeled->m_spellInfo->Id == auraSpellId)
        {
            // If single target, interrupt cast. If not, notify the spell caster so we
            // can stop processing this holder
            if (!channeled->m_spellInfo->IsAreaOfEffectSpell() && mode != AURA_REMOVE_BY_CHANNEL && (mode != AURA_REMOVE_BY_EXPIRE || caster->IsControlledByPlayer()))
                caster->InterruptSpell(CURRENT_CHANNELED_SPELL);
            else
                channeled->RemoveChanneledAuraHolder(holder, mode);
        }
    }
}

void Unit::RemoveSingleAuraFromSpellAuraHolder(SpellAuraHolder* holder, SpellEffectIndex index, AuraRemoveMode mode)
{
    Aura* aura = holder->GetAuraByEffectIndex(index);
    if (!aura)
        return;

    if (aura->IsLastAuraOnHolder())
        RemoveSpellAuraHolder(holder, mode);
    else
        RemoveAura(aura, mode);
}

void Unit::RemoveAura(Aura* Aur, AuraRemoveMode mode)
{
    // remove from list before mods removing (prevent cyclic calls, mods added before including to aura list - use reverse order)
    if (Aur->GetModifier()->m_auraname < TOTAL_AURAS)
        m_modAuras[Aur->GetModifier()->m_auraname].remove(Aur);

    // Set remove mode
    Aur->SetRemoveMode(mode);

    // some ShapeshiftBoosts at remove trigger removing other auras including parent Shapeshift aura
    // remove aura from list before to prevent deleting it before
    // m_Auras.erase(i);

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
    for (const auto& i : m_spellAuraHolders)
        i.second->ApplyAuraModifiers(false);
}

void Unit::_ApplyAllAuraMods()
{
    for (const auto& i : m_spellAuraHolders)
        i.second->ApplyAuraModifiers(true);
}

bool Unit::HasAuraType(AuraType auraType) const
{
    return !GetAurasByType(auraType).empty();
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
    for (const auto& i : auras)
        if (i->GetSpellProto()->IsFitToFamily(family, familyFlag) &&
                (!casterGuid || i->GetCasterGuid() == casterGuid))
            return i;

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

GameObject* Unit::GetGameObject(uint32 spellId) const
{
    for (const auto& i : m_spellGameObjects)
        if (i->GetSpellId() == spellId)
            return i;

    return nullptr;
}

void Unit::AddGameObject(GameObject* pGo)
{
    MANGOS_ASSERT(pGo && !pGo->GetOwnerGuid());
    m_spellGameObjects.push_back(pGo);
    pGo->SetOwnerGuid(GetObjectGuid());
    pGo->SetWorldMask(GetWorldMask());

    if (pGo->GetSpellId())
    {
        if (SpellEntry const* pCreateBySpell = sSpellMgr.GetSpellEntry(pGo->GetSpellId()))
        {
            // Need disable spell use for owner
            if (pCreateBySpell->HasAttribute(SPELL_ATTR_COOLDOWN_ON_EVENT))
                // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
                AddCooldown(*pCreateBySpell);
        }
    }
}

void Unit::RemoveGameObject(GameObject* pGo, bool del)
{
    MANGOS_ASSERT(pGo && pGo->GetOwnerGuid() == GetObjectGuid());

    pGo->SetOwnerGuid(ObjectGuid());

    // GO created by some spell
    if (uint32 spellid = pGo->GetSpellId())
    {
        RemoveAurasDueToSpell(spellid);

        if (SpellEntry const* pCreateBySpell = sSpellMgr.GetSpellEntry(spellid))
        {
            // Need activate spell use for owner, for summoning rituals it happens at ritual success
            if (pCreateBySpell->HasAttribute(SPELL_ATTR_COOLDOWN_ON_EVENT) &&
                pGo->GetGoType() != GAMEOBJECT_TYPE_SUMMONING_RITUAL)
                // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
                AddCooldown(*pCreateBySpell);
        }

    }

    for (auto itr = m_spellGameObjects.begin(); itr != m_spellGameObjects.end();)
    {
        if ((*itr) == pGo)
            itr = m_spellGameObjects.erase(itr);
        else
            ++itr;
    }

    if (del)
    {
        pGo->SetRespawnTime(0);
        pGo->Delete();
    }
}

void Unit::RemoveGameObject(uint32 spellid, bool del)
{
    if (m_spellGameObjects.empty())
        return;

    for (auto i = m_spellGameObjects.begin(); i != m_spellGameObjects.end();)
    {
        if (spellid == 0 || (*i)->GetSpellId() == spellid)
        {
            (*i)->SetOwnerGuid(ObjectGuid());
            if (del)
            {
                (*i)->SetRespawnTime(0);
                (*i)->Delete();
            }

            i = m_spellGameObjects.erase(i);
        }
        else
            ++i;
    }
}

void Unit::RemoveAllGameObjects()
{
    // remove references to unit
    for (auto const& pGo : m_spellGameObjects)
    {
        pGo->SetOwnerGuid(ObjectGuid());
        pGo->SetRespawnTime(0);
        pGo->Delete();
    }
    m_spellGameObjects.clear();
}

void Unit::SendPeriodicAuraLog(SpellPeriodicAuraLogInfo const* pInfo, AuraType auraTypeOverride) const
{
    Aura* aura = pInfo->aura;
    Modifier* mod = aura->GetModifier();
    AuraType auraType = auraTypeOverride ? auraTypeOverride : mod->m_auraname;

    WorldPacket data(SMSG_PERIODICAURALOG, 30);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << aura->GetTarget()->GetPackGUID();
    data << aura->GetRealCasterGuid().WriteAsPacked();
#else
    data << aura->GetTarget()->GetGUID();
    data << aura->GetCasterGuid().GetRawValue();
#endif
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
            data << int32(pInfo->resist);                   // resist
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
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::SendPeriodicAuraLog: unknown aura %u", uint32(auraType));
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
    bool operator <(RemovedSpellData const& b) const
    {
        return spellId < b.spellId;
    }
    bool operator==(RemovedSpellData const& b) const
    {
        return spellId == b.spellId && unit == b.unit;
    }
    uint32 spellId;
    Unit* unit;
};

typedef std::list<RemovedSpellData> RemoveSpellList;

void Unit::HandleTriggers(Unit* pVictim, uint32 procExtra, uint32 amount, uint32 originalAmount, SpellEntry const* procSpell, ProcTriggeredList const& procTriggered)
{
    RemoveSpellList removedSpells;
    // Nothing found
    if (procTriggered.empty())
        return;

    // Handle effects proceed this time
    for (const auto& itr : procTriggered)
    {
        // Some auras can be deleted in function called in this loop (except first, ofc)
        SpellAuraHolder* triggeredByHolder = itr.triggeredByHolder;
        if (triggeredByHolder->IsDeleted())
        {
            triggeredByHolder->SetInUse(false);
            continue;
        }

        SpellProcEventEntry const* spellProcEvent = itr.spellProcEvent;
        bool useCharges = triggeredByHolder->GetAuraCharges() > 0;
        bool anyAuraProc = false;
        Unit* caster = itr.target == this ? pVictim : this;

        if (!caster || !caster->IsInWorld())
        {
            triggeredByHolder->SetInUse(false);
            continue;
        }

        uint32 cooldown = 0;
        if (spellProcEvent && spellProcEvent->cooldown)
            cooldown = spellProcEvent->cooldown;

        for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            Aura* triggeredByAura = triggeredByHolder->GetAuraByEffectIndex(SpellEffectIndex(i));
            if (!triggeredByAura)
                continue;

            Modifier* auraModifier = triggeredByAura->GetModifier();

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

            // Spells that require target to be below 20%, like Deadly Swiftness (31255).
            if ((triggeredByAura->GetSpellProto()->TargetAuraState == AURA_STATE_HEALTHLESS_20_PERCENT) && (!itr.target || !itr.target->HasAuraState(AURA_STATE_HEALTHLESS_20_PERCENT)))
                continue;

            SpellAuraProcResult procResult = (*caster.*AuraProcHandler[auraModifier->m_auraname])(itr.target, amount, originalAmount, triggeredByAura, procSpell, itr.procFlag, procExtra, cooldown);
            switch (procResult)
            {
                case SPELL_AURA_PROC_CANT_TRIGGER:
                    continue;
                case SPELL_AURA_PROC_FAILED:
                    if (useCharges)
                        useCharges = triggeredByHolder->GetSpellProto()->HasAttribute(SPELL_ATTR_PROC_FAILURE_BURNS_CHARGE);
                    break;
                case SPELL_AURA_PROC_OK:
                    if (useCharges)
                        useCharges = !triggeredByHolder->GetSpellProto()->HasAttribute(SPELL_ATTR_PROC_FAILURE_BURNS_CHARGE);
                    break;
            }

            anyAuraProc = true;
        }
        // Remove charge (aura can be removed by triggers)
        if (useCharges && anyAuraProc && !triggeredByHolder->IsDeleted())
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
        for (const auto& i : removedSpells)
            i.unit->RemoveAurasDueToSpell(i.spellId);
    }
}

void Unit::SendAttackStateUpdate(CalcDamageInfo const* damageInfo) const
{
    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "WORLD: Sending SMSG_ATTACKERSTATEUPDATE");

    WorldPacket data(SMSG_ATTACKERSTATEUPDATE, (16 + 45));  // we guess size

    data << uint32(damageInfo->HitInfo);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GetPackGUID();
    data << damageInfo->target->GetPackGUID();
#else
    data << GetGUID();
    data << damageInfo->target->GetGUID();
#endif
    data << uint32(damageInfo->totalDamage);    // Total damage

    data << uint8(m_weaponDamageCount[damageInfo->attackType]);         // Sub damage count

    // Sub damage description
    for (uint8 i = 0; i < m_weaponDamageCount[damageInfo->attackType]; i++)
    {
        SubDamageInfo const* subDamage = &damageInfo->subDamage[i];

        data << uint32(GetFirstSchoolInMask(subDamage->damageSchoolMask));
        data << float(subDamage->damage);
        data << uint32(subDamage->damage);
        data << uint32(subDamage->absorb);
        data << int32(subDamage->resist);
    }
    data << uint32(damageInfo->TargetState);
    data << uint32(0);
    data << uint32(0);                                      // spell id, seen with heroic strike and disarm as examples.
    // HITINFO_NOACTION normally set if spell
    data << uint32(damageInfo->blocked_amount);

    SendMessageToSet(&data, true);
}

void Unit::SendAttackStateUpdate(uint32 HitInfo, Unit const* target, SpellSchoolMask damageSchoolMask, uint32 Damage, uint32 AbsorbDamage, int32 Resist, VictimState TargetState, uint32 BlockedAmount) const
{
    CalcDamageInfo dmgInfo;
    dmgInfo.HitInfo = HitInfo;
    dmgInfo.attacker = const_cast<Unit*>(this);
    dmgInfo.target = const_cast<Unit*>(target);
    dmgInfo.attackType = BASE_ATTACK;
    dmgInfo.totalDamage = Damage;
    dmgInfo.totalDamage += (Resist < 0 ? uint32(std::abs(Resist)) : 0);
    dmgInfo.totalDamage -= (AbsorbDamage + (Resist > 0 ? uint32(Resist) : 0) + BlockedAmount);
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

void Unit::SetPowerType(Powers new_powertype)
{
    SetByteValue(UNIT_FIELD_BYTES_0, UNIT_BYTES_0_OFFSET_POWER_TYPE, new_powertype);

    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_POWER_TYPE);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_POWER_TYPE);
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

bool Unit::IsHostileTo(WorldObject const* target) const
{
    return GetReactionTo(target) <= REP_HOSTILE;
}

bool Unit::IsFriendlyTo(WorldObject const* target) const
{
    return GetReactionTo(target) >= REP_FRIENDLY;
}

bool Unit::IsHostileToPlayers() const
{
    FactionTemplateEntry const* my_faction = GetFactionTemplateEntry();
    if (!my_faction || !my_faction->faction)
        return false;

    FactionEntry const* raw_faction = sObjectMgr.GetFactionEntry(my_faction->faction);
    if (raw_faction && raw_faction->reputationListID >= 0)
        return false;

    return my_faction->IsHostileToPlayers();
}

bool Unit::IsNeutralToAll() const
{
    FactionTemplateEntry const* my_faction = GetFactionTemplateEntry();
    if (!my_faction || !my_faction->faction)
        return true;

    FactionEntry const* raw_faction = sObjectMgr.GetFactionEntry(my_faction->faction);
    if (raw_faction && raw_faction->reputationListID >= 0)
        return false;

    return my_faction->IsNeutralToAll();
}

bool Unit::IsContestedGuard() const
{
    if (FactionTemplateEntry const* entry = GetFactionTemplateEntry())
        return entry->IsContestedGuardFaction();

    return false;
}

bool Unit::Attack(Unit* victim, bool meleeAttack)
{
    if (!victim || victim == this)
        return false;

    // Nostalrius : verifications de bon sens
    if (victim->IsDeleted() || IsDeleted())
        return false;

    // dead units can neither attack nor be attacked
    if (!IsAlive() || !victim->IsInWorld() || !victim->IsAlive())
        return false;

    // player cannot attack in mount state
    if (IsPlayer() && IsMounted())
        return false;

    // nobody can attack GM in GM-mode
    if (victim->IsPlayer())
    {
        if (((Player*)victim)->IsGameMaster())
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
            if (meleeAttack && !HasUnitState(UNIT_STAT_MELEE_ATTACKING))
            {
                AddUnitState(UNIT_STAT_MELEE_ATTACKING);
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
        AddUnitState(UNIT_STAT_MELEE_ATTACKING);

    m_attacking = victim;
    m_attacking->_addAttacker(this);

    if (Creature* pCreature = ToCreature()) // && !((Creature*)this)->GetLinkGroup())
    {
        pCreature->SendAIReaction(AI_REACTION_HOSTILE);
        pCreature->CallAssistance();

        if (Pet* pet = GetPet())
            if (pet->IsAlive())
                pet->AI()->OwnerAttacked(victim);

        for (auto const& guid : m_guardianPets)
            if (Pet* pGuardian = GetMap()->GetPet(guid))
                if (pGuardian->IsAlive())
                    pGuardian->AI()->OwnerAttacked(victim);
    }

    // delay offhand weapon attack to next attack time
    if (HaveOffhandWeapon())
        ResetAttackTimer(OFF_ATTACK);

    if (meleeAttack)
        SendMeleeAttackStart(victim);

    return true;
}

void Unit::AttackedBy(Unit* attacker)
{
    if (Pet* pet = GetPet())
        if (pet->IsAlive())
            pet->AI()->OwnerAttackedBy(attacker);

    for (auto const& guid : m_guardianPets)
        if (Creature* pGuardian = GetMap()->GetPet(guid))
            if (pGuardian->IsAlive())
                pGuardian->AI()->OwnerAttackedBy(attacker);

    if (Creature* pCreature = ToCreature())
    {
        // trigger AI reaction
        if (pCreature->AI())
            pCreature->AI()->AttackedBy(attacker);

        // trigger owner AI reaction
        // must check that attacker is targetable by owner,
        // because there are cases with unattackable creatures spawning pets
        // example: Scarshield Portal (9707) spawns guardian pet Burning Imp (9708) with spell 15126
        if (!pCreature->HasStaticFlag(CREATURE_STATIC_FLAG_2_NO_OWNER_THREAT))
        {
            if (Creature* pOwner = ::ToCreature(GetCharmerOrOwner()))
                if (pOwner->AI() && pOwner->IsAlive() && attacker->IsTargetableBy(pOwner))
                    pOwner->AI()->AttackedBy(attacker);
        }
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

    ClearUnitState(UNIT_STAT_MELEE_ATTACKING);

    InterruptSpell(CURRENT_MELEE_SPELL);

    // reset only at real combat stop
    if (!targetSwitch)
    {
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

    if (AI() && IsInCombat())
        AI()->OnCombatStop();

    if (Player* pPlayer = ToPlayer())
        pPlayer->SendAttackSwingCancelAttack();     // melee and ranged forced attack cancel
    else if (Creature* pCreature = ToCreature())
    {
        pCreature->UpdateCombatState(false);
        pCreature->UpdateCombatWithZoneState(false);
        pCreature->ClearLastLeashExtensionTimePtr();
        pCreature->m_TargetNotReachableTimer = 0;
        if (pCreature->GetTemporaryFactionFlags() & TEMPFACTION_RESTORE_COMBAT_STOP)
            pCreature->ClearTemporaryFaction();
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

void Unit::RemoveAllAttackers()
{
    while (!m_attackers.empty())
    {
        AttackerSet::iterator iter = m_attackers.begin();
        if (!(*iter)->AttackStop())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WORLD: Unit has an attacker that isn't attacking it!");
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
            if (IsPlayer())
            {
                PlayerSpellMap const& sp_list = ((Player*)this)->GetSpellMap();
                for (const auto& itr : sp_list)
                {
                    if (itr.second.state == PLAYERSPELL_REMOVED) continue;
                    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(itr.first);
                    if (!spellInfo || !spellInfo->IsPassiveSpell()) continue;
                    if (AuraState(spellInfo->CasterAuraState) == flag)
                        CastSpell(this, itr.first, true, nullptr);
                }
            }
            else
            {
                switch (flag)
                {
                    case AURA_STATE_HEALTHLESS_15_PERCENT:
                    case AURA_STATE_HEALTHLESS_10_PERCENT:
                    case AURA_STATE_HEALTHLESS_5_PERCENT:
                        UpdateSpeed(MOVE_RUN, false);
                        break;
                }
            }
        }
    }
    else
    {
        if (HasFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1)))
        {
            RemoveFlag(UNIT_FIELD_AURASTATE, 1 << (flag - 1));

            if (flag != AURA_STATE_BERSERKING)
            {
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

            if (IsCreature())
            {
                switch (flag)
                {
                    case AURA_STATE_HEALTHLESS_15_PERCENT:
                    case AURA_STATE_HEALTHLESS_10_PERCENT:
                    case AURA_STATE_HEALTHLESS_5_PERCENT:
                        UpdateSpeed(MOVE_RUN, false);
                        break;
                }
            }
        }
    }
}

Unit* Unit::GetOwner() const
{
    if (ObjectGuid ownerid = GetOwnerGuid())
        return ObjectAccessor::GetUnit(*this, ownerid);
    return nullptr;
}

// Optimized version when we only want creature owner.
// Check guid type before doing lookup for unit.
Creature* Unit::GetOwnerCreature() const
{
    if (!IsInWorld())
        return nullptr;

    if (ObjectGuid ownerid = GetOwnerGuid())
        if (ownerid.IsCreature())
            return GetMap()->GetCreature(ownerid);

    return nullptr;
}

Player* Unit::GetOwnerPlayer() const
{
    if (!IsInWorld())
        return nullptr;

    if (ObjectGuid ownerid = GetOwnerGuid())
        if (ownerid.IsPlayer())
            return GetMap()->GetPlayer(ownerid);

    return nullptr;
}

Unit* Unit::GetCharmer() const
{
    if (ObjectGuid charmerid = GetCharmerGuid())
        return ObjectAccessor::GetUnit(*this, charmerid);
    return nullptr;
}

Player* Unit::GetPossessor() const
{
    if (ObjectGuid possessor = GetPossessorGuid())
        if (possessor.IsPlayer())
            return ObjectAccessor::FindPlayer(possessor);

    return nullptr;
}

Player* Unit::GetOwnerPlayerOrPlayerItself() const
{
    ObjectGuid guid = GetOwnerGuid();
    if (guid.IsPlayer())
        return ObjectAccessor::FindPlayer(guid);

    return IsPlayer() ? (Player*)this : nullptr;
}

Player* Unit::GetCharmerOrOwnerPlayerOrPlayerItself() const
{
    ObjectGuid guid = GetCharmerOrOwnerGuid();
    if (guid.IsPlayer())
        return ObjectAccessor::FindPlayer(guid);

    return IsPlayer() ? (Player*)this : nullptr;
}

Player* Unit::GetCharmerOrOwnerPlayer() const
{
    ObjectGuid guid = GetCharmerOrOwnerGuid();
    if (guid.IsPlayer())
        return ObjectAccessor::FindPlayer(guid);

    return nullptr;
}

Player* Unit::GetAffectingPlayer() const
{
    if (!GetCharmerOrOwnerGuid())
        return const_cast<Unit*>(this)->ToPlayer();

    if (Unit* owner = GetCharmerOrOwner())
        return owner->GetOwnerPlayerOrPlayerItself(); // no charmer, pet of charmed creature should still be attackable by player

    return nullptr;
}

Pet* Unit::GetPet() const
{
    if (ObjectGuid pet_guid = GetPetGuid())
    {
        if (Pet* pet = GetMap()->GetPet(pet_guid))
            return pet;

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::GetPet: %s not exist.", pet_guid.GetString().c_str());
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

        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::GetCharm: Charmed %s not exist.", charm_guid.GetString().c_str());
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

void Unit::RemoveCharmAuras(AuraRemoveMode mode)
{
    RemoveSpellsCausingAura(SPELL_AURA_MOD_POSSESS, mode);
    RemoveSpellsCausingAura(SPELL_AURA_MOD_CHARM, mode);
    RemoveSpellsCausingAura(SPELL_AURA_AOE_CHARM, mode);
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

void Unit::SetFactionTemplateId(uint32 faction)
{
    SetUInt32Value(UNIT_FIELD_FACTIONTEMPLATE, faction);

    if (!HasUnitState(UNIT_STAT_AI_USES_MOVE_IN_LOS))
    {
        if (FactionTemplateEntry const* pFaction = sObjectMgr.GetFactionTemplateEntry(faction))
        {
            if (pFaction->hostileMask || pFaction->isEnemyOfAnother ||
                pFaction->HasFactionFlag(FACTION_TEMPLATE_BROADCAST_TO_ENEMIES_LOW_PRIO |
                                         FACTION_TEMPLATE_BROADCAST_TO_ENEMIES_MED_PRIO |
                                         FACTION_TEMPLATE_BROADCAST_TO_ENEMIES_HIG_PRIO))
                ClearUnitState(UNIT_STAT_NO_BROADCAST_TO_OTHERS);
            else
                AddUnitState(UNIT_STAT_NO_BROADCAST_TO_OTHERS);

            if (pFaction->hostileMask ||
                pFaction->HasFactionFlag(FACTION_TEMPLATE_SEARCH_FOR_ENEMIES_LOW_PRIO |
                                         FACTION_TEMPLATE_SEARCH_FOR_ENEMIES_MED_PRIO |
                                         FACTION_TEMPLATE_SEARCH_FOR_ENEMIES_HIG_PRIO |
                                         FACTION_TEMPLATE_SEARCH_FOR_FRIENDS_LOW_PRIO |
                                         FACTION_TEMPLATE_SEARCH_FOR_FRIENDS_MED_PRIO |
                                         FACTION_TEMPLATE_SEARCH_FOR_FRIENDS_HIG_PRIO))
                ClearUnitState(UNIT_STAT_NO_SEARCH_FOR_OTHERS);
            else
                AddUnitState(UNIT_STAT_NO_SEARCH_FOR_OTHERS);
        }
    }
}

void Unit::RestoreFaction()
{
    if (Player* pPlayer = ToPlayer())
        pPlayer->SetFactionForRace(GetRace());
    else
    {
        if (CreatureInfo const* cinfo = ((Creature*)this)->GetCreatureInfo())  // normal creature
            SetFactionTemplateId(cinfo->faction);
    }
}

Team Unit::GetTeam() const
{
    if (FactionEntry const* pFaction = GetFactionEntry())
    {
        switch (pFaction->team)
        {
            case HORDE:
                return HORDE;
            case ALLIANCE:
                return ALLIANCE;
        }
    }
    
    return TEAM_NONE;
}

bool Unit::CanAttack(Unit const* target, bool force) const
{
    ASSERT(target);

    if (force)
    {
        if (IsFriendlyTo(target))
            return false;

        if (IsCreature())
        {
            if (IsPet())
            {
                if (Unit* pOwner = GetOwner())
                    if (!(pOwner->CanAttack(target)))
                        return false;
            }
            else if (!IsHostileTo(target))
                return false;
        }
    }
    else if (!IsHostileTo(target))
        return false;

    if (!target->IsTargetableBy(this))
        return false;

    // shaman totem quests: spell 8898, shaman can detect elementals but elementals cannot see shaman
    if (m_invisibilityMask || target->m_invisibilityMask)
        if (!CanDetectInvisibilityOf(target) && !target->CanDetectInvisibilityOf(this))
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

void Unit::RemoveGuardiansWithEntry(uint32 entry)
{
    while (Pet* pGuardian = FindGuardianWithEntry(entry))
    {
        pGuardian->Unsummon(PET_SAVE_AS_DELETED, this);
    }
}

Pet* Unit::FindGuardianWithEntry(uint32 entry)
{
    for (const auto& itr : m_guardianPets)
        if (Pet* pet = GetMap()->GetPet(itr))
            if (pet->GetEntry() == entry)
                return pet;

    return nullptr;
}

uint32 Unit::GetGuardianCountWithEntry(uint32 entry)
{
    uint32 result = 0;
    for (const auto& itr : m_guardianPets)
        if (Pet* pet = GetMap()->GetPet(itr))
            if (pet->GetEntry() == entry && pet->IsAlive())
                result++;

    return result;
}

uint32 Unit::GetGuardiansCount() const
{
    return uint32(m_guardianPets.size());
}

Unit* Unit::_GetTotem(TotemSlot slot) const
{
    return GetTotem(slot);
}

Totem* Unit::GetTotem(TotemSlot slot) const
{
    if (slot >= MAX_TOTEM_SLOT || !IsInWorld() || !m_TotemSlot[slot])
        return nullptr;

    Creature* totem = GetMap()->GetCreature(m_TotemSlot[slot]);
    return totem && totem->IsTotem() ? (Totem*)totem : nullptr;
}

bool Unit::IsAllTotemSlotsUsed() const
{
    for (const auto& guid : m_TotemSlot)
        if (!guid)
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
    for (auto& guid : m_TotemSlot)
    {
        if (guid == totem->GetObjectGuid())
        {
            guid.Clear();
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

bool Unit::UnsummonOldPetBeforeNewSummon(uint32 newPetEntry, bool canUnsummon)
{
    Pet* OldSummon = GetPet();

    // if pet requested type already exist
    if (OldSummon)
    {
        if (!canUnsummon)
            return false;

        if (OldSummon->IsDead() && (newPetEntry == 0 || OldSummon->GetEntry() == newPetEntry))
        {
            if (newPetEntry) // warlock pet
                OldSummon->Unsummon(PET_SAVE_NOT_IN_SLOT);
            else
                return false; // pet in corpse state can't be unsummoned
        }
        else if (IsPlayer())
        {
            if (newPetEntry)
                OldSummon->Unsummon(OldSummon->getPetType() == HUNTER_PET ? PET_SAVE_AS_DELETED : PET_SAVE_NOT_IN_SLOT, this);
            else
                return false;
        }
        else
            return false;
    }

    return true;
}

void Unit::SendEnvironmentalDamageLog(uint8 type, uint32 damage, uint32 absorb, int32 resist) const
{
    WorldPacket data(SMSG_ENVIRONMENTALDAMAGELOG, (8 + 1 + 4 + 4 + 4));
    data << GetObjectGuid();
    data << uint8(type != DAMAGE_FALL_TO_VOID ? type : DAMAGE_FALL);
    data << uint32(damage);
    
    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
    // - Absorbed and resisted environmental damage is now shown in the combat log.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    data << uint32(absorb);
    data << int32(resist);
#endif

    SendMessageToSet(&data, true);
}

uint32 Unit::GetSpellRank(SpellEntry const* spellInfo) const
{
    uint32 spellRank = GetLevel();
    if (spellInfo->maxLevel > 0 && spellRank >= spellInfo->maxLevel * 5)
        spellRank = spellInfo->maxLevel * 5;
    return spellRank;
}

/**
 * Calculates target part of spell damage bonuses,
 * will be called on each tick for periodic damage over time auras
 */
float Unit::SpellDamageBonusTaken(SpellCaster const* pCaster, SpellEntry const* spellProto, SpellEffectIndex effectIndex, float pdamage, DamageEffectType damagetype, uint32 stack, Spell* spell) const
{
    if (!spellProto || !pCaster || damagetype == DIRECT_DAMAGE || spellProto->HasAttribute(SPELL_ATTR_EX4_IGNORE_DAMAGE_TAKEN_MODIFIERS))
        return pdamage;

    uint32 schoolMask = spell ? spell->m_spellSchoolMask : spellProto->GetSpellSchoolMask();

    // Taken total percent damage auras
    float takenTotalMod = 1.0f;
    takenTotalMod *= GetTotalAuraMultiplierByMiscMask(SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, schoolMask);

    // Taken fixed damage bonus auras
    float takenFlatMod = SpellBaseDamageBonusTaken(spellProto->GetSpellSchoolMask());

    // apply benefit affected by spell power implicit coeffs and spell level penalties
    takenFlatMod = SpellBonusWithCoeffs(spellProto, effectIndex, 0, takenFlatMod, 0, damagetype, false, pCaster, spell) * int32(stack);

    if ((takenFlatMod < 0) && (-takenFlatMod > (pdamage / 2)))
        takenFlatMod = -(pdamage / 2);

    // use float as more appropriate for negative values and percent applying
    float tmpDamage = (pdamage + takenFlatMod) * takenTotalMod;
    return tmpDamage > 0 ? tmpDamage : 0;
}

int32 Unit::SpellBaseDamageBonusTaken(SpellSchoolMask schoolMask) const
{
    int32 advertisedBenefit = 0;

    AuraList const& damageTakenAuras = GetAurasByType(SPELL_AURA_MOD_DAMAGE_TAKEN);
    for (const auto& i : damageTakenAuras)
        if (i->GetModifier()->m_miscvalue & schoolMask)
            advertisedBenefit += i->GetModifier()->m_amount;

    return advertisedBenefit;
}

bool Unit::IsSpellCrit(Unit const* pVictim, SpellEntry const* spellProto, SpellSchoolMask schoolMask, WeaponAttackType attackType, Spell* spell) const
{
    ASSERT(pVictim);
    // Les mobs ne peuvent pas critiquer avec les sorts. Mais totems et pets peuvent.
    if (IsCreature() && !GetOwnerGuid().IsPlayer())
        return false;

    if (IsPlayer() && ToPlayer()->HasCheatOption(PLAYER_CHEAT_ALWAYS_CRIT))
        return true;

    // not critting spell
    if ((spellProto->AttributesEx2 & SPELL_ATTR_EX2_CANT_CRIT))
        return false;

    float crit_chance = 0.0f;
    // Potions/healthstones can crit with a constant percentage chance
    if (spellProto->SpellFamilyName == SPELLFAMILY_POTION ||
            (spellProto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_HEALTHSTONE>()))
        crit_chance = 10.0f;
    else
    {
        // Wand shoot forced to use ranged crit
        uint32 const dmgClass = attackType == RANGED_ATTACK && spellProto->HasAttribute(SPELL_ATTR_EX3_NORMAL_RANGED_ATTACK) ?
            SPELL_DAMAGE_CLASS_RANGED
            :
            spellProto->DmgClass;

        switch (dmgClass)
        {
            case SPELL_DAMAGE_CLASS_NONE:
                return false;
            case SPELL_DAMAGE_CLASS_MAGIC:
            {
                if (schoolMask & SPELL_SCHOOL_MASK_NORMAL)
                    crit_chance = 0.0f;
                // For other schools
                else if (IsPlayer())
                    crit_chance = ((Player*)this)->GetSpellCritPercent(GetFirstSchoolInMask(schoolMask));
                else
                {
                    crit_chance = float(m_baseSpellCritChance);
                    crit_chance += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL, schoolMask);
                }
                // taken
                if (!spellProto->IsPositiveSpell())
                {
                     // Modify critical chance by victim SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE
                    crit_chance += pVictim->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE, schoolMask);
                }

                // scripted (increase crit chance ... against ... target by x%
                AuraList const& mOverrideClassScript = GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
                for (const auto& i : mOverrideClassScript)
                {
                    if (!(i->GetSpellProto()->SpellFamilyName == spellProto->SpellFamilyName))
                        continue;
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_10_2
                    // 1.11.0 - Mage talent Shatter was changed to affect all spells, previously limited to Frost spells.
                    SpellEntry const* modSpellProto = i->GetSpellProto();
                    if (modSpellProto->EffectItemType[0] && !spellProto->IsFitToFamily(SpellFamily(modSpellProto->SpellFamilyName), modSpellProto->EffectItemType[0]))
                        continue;
#endif
                    switch (i->GetModifier()->m_miscvalue)
                    {
                        // Shatter
                        case 849:
                            if (pVictim->IsFrozen()) crit_chance += 10.0f;
                            break;
                        case 910:
                            if (pVictim->IsFrozen()) crit_chance += 20.0f;
                            break;
                        case 911:
                            if (pVictim->IsFrozen()) crit_chance += 30.0f;
                            break;
                        case 912:
                            if (pVictim->IsFrozen()) crit_chance += 40.0f;
                            break;
                        case 913:
                            if (pVictim->IsFrozen()) crit_chance += 50.0f;
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
                if (pVictim->IsPlayer() && !pVictim->IsStandingUp())
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

    return roll_chance_f(crit_chance);
}

/**
 * Calculates target part of healing spell bonuses,
 * will be called on each tick for periodic damage over time auras
 */
float Unit::SpellHealingBonusTaken(SpellCaster const* pCaster, SpellEntry const* spellProto, SpellEffectIndex effectIndex, float healamount, DamageEffectType damagetype, uint32 stack, Spell* spell) const
{
    float takenTotalMod = 1.0f;

    // Healing taken percent
    float minval = float(GetMaxNegativeAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (minval)
        takenTotalMod *= (100.0f + minval) / 100.0f;

    float maxval = float(GetMaxPositiveAuraModifier(SPELL_AURA_MOD_HEALING_PCT));
    if (maxval)
        takenTotalMod *= (100.0f + maxval) / 100.0f;

    // No heal amount for this class spells
    if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE)
    {
        healamount = healamount * takenTotalMod;
        return healamount < 0 ? 0 : healamount;
    }

    // Taken mods
    // Healing Wave cast
    if (spellProto->IsFitToFamily<SPELLFAMILY_SHAMAN, CF_SHAMAN_HEALING_WAVE>())
    {
        // Search for Healing Way on Victim
        Unit::AuraList const& auraDummy = GetAurasByType(SPELL_AURA_DUMMY);
        for (const auto& itr : auraDummy)
            if (itr->GetId() == 29203)
                takenTotalMod *= (itr->GetModifier()->m_amount + 100.0f) / 100.0f;
    }

    // Healing Done
    // Done total percent damage auras
    float takenFlatMod = SpellBaseHealingBonusTaken(spellProto->GetSpellSchoolMask());

    // Blessing of Light dummy effects healing taken from Holy Light and Flash of Light
    if (spellProto->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_FLASH_OF_LIGHT1, CF_PALADIN_HOLY_LIGHT2>())
    {
        AuraList const& mDummyAuras = GetAurasByType(SPELL_AURA_DUMMY);
        for (const auto& i : mDummyAuras)
        {
            if (i->GetSpellProto()->IsFitToFamilyMask<CF_PALADIN_BLESSINGS>() && i->GetSpellProto()->SpellVisual == 300)
            {
                // Holy Light
                if (spellProto->IsFitToFamilyMask<CF_PALADIN_HOLY_LIGHT2>() && i->GetEffIndex() == EFFECT_INDEX_0)
                    takenFlatMod += i->GetModifier()->m_amount;
                // Flash of Light
                else if (spellProto->IsFitToFamilyMask<CF_PALADIN_FLASH_OF_LIGHT1>() && i->GetEffIndex() == EFFECT_INDEX_1)
                    takenFlatMod += i->GetModifier()->m_amount;
            }
        }
    }

    // apply benefit affected by spell power implicit coeffs and spell level penalties
    takenFlatMod = SpellBonusWithCoeffs(spellProto, effectIndex, 0, takenFlatMod, 0, damagetype, false, pCaster, spell) * int32(stack);

    if ((takenFlatMod < 0) && (-takenFlatMod > (healamount / 2)))
        takenFlatMod = -(healamount / 2);

    // use float as more appropriate for negative values and percent applying
    float heal = (healamount + takenFlatMod) * takenTotalMod;
    return heal < 0 ? 0 : heal;
}

int32 Unit::SpellBaseHealingBonusTaken(SpellSchoolMask schoolMask) const
{
    int32 advertisedBenefit = 0;

    AuraList const& healingTakenAuras = GetAurasByType(SPELL_AURA_MOD_HEALING);
    for (const auto& i : healingTakenAuras)
        if (i->GetModifier()->m_miscvalue & schoolMask)
            advertisedBenefit += i->GetModifier()->m_amount;

    return advertisedBenefit;
}

bool Unit::IsImmuneToDamage(SpellSchoolMask shoolMask, SpellEntry const* spellInfo) const
{
    if (spellInfo && (spellInfo->HasAttribute(SPELL_ATTR_NO_IMMUNITIES) || spellInfo->IsIgnoringCasterAndTargetRestrictions()))
        return false;

    // If m_immuneToDamage type contain magic, IMMUNE damage.
    SpellImmuneList const& damageList = m_spellImmune[IMMUNITY_DAMAGE];
    for (const auto& itr : damageList)
    {
        if (itr.type & shoolMask)
            return true;
    }

    if (!spellInfo || !spellInfo->HasAttribute(SPELL_ATTR_EX2_NO_SCHOOL_IMMUNITIES))
    {
        // If m_immuneToSchool type contain this school type, IMMUNE damage.
        SpellImmuneList const& schoolList = m_spellImmune[IMMUNITY_SCHOOL];
        for (const auto& itr : schoolList)
        {
            if (itr.type & shoolMask)
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != (spellInfo && spellInfo->IsPositiveSpell()))
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    return false;
}

bool Unit::IsImmuneToSpell(SpellEntry const* spellInfo, bool /*castOnSelf*/) const
{
    if (!spellInfo || spellInfo->IsIgnoringCasterAndTargetRestrictions())
        return false;

    // Venomhide Ravasaur (6508) is immune to being poisoned by others, but has passive poison aura 14108.
    // Should either check self cast or passive spell here, not sure which is better.
    if (!spellInfo->HasAttribute(SPELL_ATTR_PASSIVE))
    {
        SpellImmuneList const& dispelList = m_spellImmune[IMMUNITY_DISPEL];
        for (const auto& itr : dispelList)
        {
            if (itr.type == spellInfo->Dispel)
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveSpell())
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    if (!spellInfo->HasAttribute(SPELL_ATTR_NO_IMMUNITIES)             // ignore invulnerability
     && !spellInfo->HasAttribute(SPELL_ATTR_EX_IMMUNITY_PURGES_EFFECT) // can remove immune (by dispell or immune it)
     && !spellInfo->HasAttribute(SPELL_ATTR_EX2_NO_SCHOOL_IMMUNITIES))
    {
        SpellImmuneList const& schoolList = m_spellImmune[IMMUNITY_SCHOOL];
        for (const auto& itr : schoolList)
        {
            if (itr.type & spellInfo->GetSpellSchoolMask())
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveSpell())
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    if (uint32 mechanic = spellInfo->Mechanic)
    {
        SpellImmuneList const& mechanicList = m_spellImmune[IMMUNITY_MECHANIC];
        for (const auto& itr : mechanicList)
        {
            if (itr.type == mechanic)
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveSpell())
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }

        uint32 mask = 1 << (mechanic - 1);
        AuraList const& immuneAuraApply = GetAurasByType(SPELL_AURA_MECHANIC_IMMUNITY_MASK);
        for (const auto& iter : immuneAuraApply)
        {
            if (iter->GetModifier()->m_miscvalue & mask)
            {
                SpellEntry const* pImmunitySpell = iter->GetSpellProto();

                if ((pImmunitySpell && pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveSpell())
                    return true;

                if (pImmunitySpell && pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    // You should not be able to cast Blessing of Protection or Divine Intervention on WSG flag carrier.
    if (Spells::IsExplicitPositiveTarget(spellInfo->EffectImplicitTargetA[0]) &&
        spellInfo->HasAuraOrTriggersAnotherSpellWithAura(SPELL_AURA_SCHOOL_IMMUNITY))
    {
        for (auto const& itr : m_spellAuraHolders)
        {
            SpellEntry const* pAuraSpell = itr.second->GetSpellProto();
            if (pAuraSpell->HasAuraInterruptFlag(AURA_INTERRUPT_INVULNERABILITY_BUFF_CANCELS))
                return true;
        }
    }

    return false;
}

bool Unit::IsImmuneToSpellEffect(SpellEntry const* spellInfo, SpellEffectIndex index, bool /*castOnSelf*/) const
{
    if (spellInfo->IsIgnoringCasterAndTargetRestrictions())
        return false;

    //If m_immuneToEffect type contain this effect type, IMMUNE effect.
    uint32 effect = spellInfo->Effect[index];
    SpellImmuneList const& effectList = m_spellImmune[IMMUNITY_EFFECT];
    for (const auto& itr : effectList)
    {
        if (itr.type == effect)
        {
            SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
            if (!pImmunitySpell)
                return true;

            if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveEffect(index))
                return true;
            
            if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                return true;
        }
    }

    if (uint32 mechanic = spellInfo->EffectMechanic[index])
    {
        SpellImmuneList const& mechanicList = m_spellImmune[IMMUNITY_MECHANIC];
        for (const auto& itr : mechanicList)
        {
            if (itr.type == spellInfo->EffectMechanic[index])
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveEffect(index))
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }

        AuraList const& immuneAuraApply = GetAurasByType(SPELL_AURA_MECHANIC_IMMUNITY_MASK);
        for (const auto& iter : immuneAuraApply)
        {
            if (iter->GetModifier()->m_miscvalue & (1 << (mechanic - 1)))
            {
                SpellEntry const* pImmunitySpell = iter->GetSpellProto();

                if ((pImmunitySpell && pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveEffect(index))
                    return true;

                if (pImmunitySpell && pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    uint32 aura = spellInfo->EffectApplyAuraName[index];
    if (aura)
    {
        SpellImmuneList const& list = m_spellImmune[IMMUNITY_STATE];
        for (const auto& itr : list)
        {
            if (itr.type == aura)
            {
                SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveEffect(index))
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    return false;
}

bool Unit::IsImmuneToSchool(SpellEntry const* spellInfo, uint8 effectMask) const
{
    if (!spellInfo->HasAttribute(SPELL_ATTR_EX_IMMUNITY_PURGES_EFFECT)            // can remove immune (by dispell or immune it)
     && !spellInfo->HasAttribute(SPELL_ATTR_EX2_NO_SCHOOL_IMMUNITIES)
     && !spellInfo->IsIgnoringCasterAndTargetRestrictions())
    {
        SpellImmuneList const& schoolList = m_spellImmune[IMMUNITY_SCHOOL];
        for (auto itr : schoolList)
        {
            SpellEntry const* pImmunitySpell = sSpellMgr.GetSpellEntry(itr.spellId);
            if (pImmunitySpell && pImmunitySpell == spellInfo) // do not let itself immune out - fixes 39872 - Tidal Shield
                continue;

            if (itr.type & spellInfo->GetSpellSchoolMask())
            {
                if (!pImmunitySpell)
                    return true;

                if ((pImmunitySpell->IsPositiveSpell()) != spellInfo->IsPositiveEffectMask(effectMask))
                    return true;

                if (pImmunitySpell->HasAttribute(SPELL_ATTR_EX_IMMUNITY_TO_HOSTILE_AND_FRIENDLY_EFFECTS))
                    return true;
            }
        }
    }

    return false;
}

bool Unit::IsTotalImmune() const
{
    AuraList const& immune = GetAurasByType(SPELL_AURA_SCHOOL_IMMUNITY);

    uint32 immuneMask = 0;
    for (const auto itr : immune)
    {
        immuneMask |= itr->GetModifier()->m_miscvalue;
    }

    return (immuneMask == SPELL_SCHOOL_MASK_ALL);
}

/**
 * Calculates target part of melee damage bonuses,
 * will be called on each tick for periodic damage over time auras
 */
float Unit::MeleeDamageBonusTaken(SpellCaster const* pCaster, float pdamage, WeaponAttackType attType, SpellEntry const* spellProto, SpellEffectIndex effectIndex, DamageEffectType damagetype, uint32 stack, Spell* spell, bool flat)
{
    if (!pCaster)
        return pdamage;

    if (pdamage == 0)
        return pdamage;

    if (spellProto && spellProto->HasAttribute(SPELL_ATTR_EX4_IGNORE_DAMAGE_TAKEN_MODIFIERS))
        return pdamage;

    // Exception for Seal of Command and Seal of Righteousness
    // already with coeff!
    if (spellProto && (spellProto->Id == 20424 ||
        (spellProto->SpellFamilyName == SPELLFAMILY_PALADIN && spellProto->DmgClass == SPELL_DAMAGE_CLASS_MELEE))) // SoR is the only pala spell with melee dmg class
        return pdamage;

    // differentiate for weapon damage based spells
    bool isWeaponDamageBasedSpell = !(spellProto && (damagetype == DOT || spellProto->HasEffect(SPELL_EFFECT_SCHOOL_DAMAGE)));
    uint32 schoolMask       = spellProto ? spellProto->GetSpellSchoolMask() : uint32(pCaster->GetMeleeDamageSchoolMask());

    // FLAT damage bonus auras
    // =======================
    float TakenFlat = 0;

    // ..taken flat (base at attack power for marked target and base at attack power for creature type)
    if (attType == RANGED_ATTACK)
        TakenFlat += GetTotalAuraModifier(SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN);
    else
        TakenFlat += GetTotalAuraModifier(SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN);

    // ..taken flat (by school mask)
    if (spellProto || (schoolMask & SPELL_SCHOOL_MASK_NORMAL))
        TakenFlat += GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_TAKEN, schoolMask);
    else
    {
        // dampen magic does not reduce magic melee damage below half
        int32 takenMod = GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_DAMAGE_TAKEN, schoolMask);
        if ((takenMod < 0) && (-takenMod > (pdamage / 2)))
            takenMod = -(pdamage / 2);
        TakenFlat += takenMod;
    }

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
        TakenFlat = SpellBonusWithCoeffs(spellProto, effectIndex, 0, TakenFlat, 0, damagetype, false, pCaster, spell);
    }

    if (!flat)
        TakenFlat = 0.0f;

    float tmpDamage = (pdamage + TakenFlat * int32(stack)) * TakenPercent;

    // bonus result can be negative
    return tmpDamage > 0 ? tmpDamage : 0;
}

void Unit::ApplySpellImmune(uint32 spellId, uint32 op, uint32 type, bool apply)
{
    if (apply)
    {
        // Don't add same permanent immunity to list twice.
        if (!spellId)
        {
            for (auto const& itr : m_spellImmune[op])
                if (itr.spellId == spellId && itr.type == type)
                    return;
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
            if (itr->spellId == spellId && itr->type == type)
            {
                m_spellImmune[op].erase(itr);
                break;
            }
        }
    }
}

void Unit::ApplySpellDispelImmunity(SpellEntry const* spellProto, DispelType type, bool apply)
{
    ApplySpellImmune(spellProto->Id, IMMUNITY_DISPEL, type, apply);

    if (apply && spellProto->HasAttribute(SPELL_ATTR_EX_IMMUNITY_PURGES_EFFECT))
        RemoveAurasWithDispelType(type);
}

float Unit::GetPPMProcChance(uint32 WeaponSpeed, float PPM) const
{
    // proc per minute chance calculation
    if (PPM <= 0.0f)
        return 0.0f;
    return WeaponSpeed * PPM / 600.0f;                      // result is chance in percents (probability = Speed_in_sec * (PPM / 60))
}

UnitMountResult Unit::Mount(uint32 mount, uint32 spellId)
{
    if (!mount || !sCreatureDisplayInfoStore.LookupEntry(mount))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt by %s to mount invalid display id %u.", this->GetName(), mount);
        return MOUNTRESULT_NOTMOUNTABLE;
    }

    if (IsPlayer() && HasAura(29519))
    {
        if (GetZoneId() == 1377)
        {
            // OutdoorPVP Silithus : Loss of silithyst buff
            if (ZoneScript* pScript = ((Player*)this)->GetZoneScript())
                pScript->HandleDropFlag(((Player*)this), 29519);
        }
    }

    InterruptSpellsWithChannelFlags(AURA_INTERRUPT_MOUNT_CANCELS);
    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_MOUNT_CANCELS);
    SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, mount);

    if (IsCreature())
    {
        UpdateSpeed(MOVE_WALK, false);
        UpdateSpeed(MOVE_RUN, false);
    }

    return MOUNTRESULT_OK;
}

UnitDismountResult Unit::Unmount(bool from_aura)
{
    if (!IsMounted())
        return DISMOUNTRESULT_NOTMOUNTED;

    InterruptSpellsWithChannelFlags(AURA_INTERRUPT_DISMOUNT_CANCELS);
    RemoveAurasWithInterruptFlags(AURA_INTERRUPT_DISMOUNT_CANCELS);
    SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, 0);

    if (IsCreature())
    {
        UpdateSpeed(MOVE_WALK, false);
        UpdateSpeed(MOVE_RUN, false);
    }

    return DISMOUNTRESULT_OK;
}

bool Unit::IsShapeShifted() const
{
    // Mirroring clientside gameplay logic
    if (ShapeshiftForm form = GetShapeshiftForm())
    {
        if (SpellShapeshiftFormEntry const* ssEntry = sSpellShapeshiftFormStore.LookupEntry(form))
            return !(ssEntry->flags1 & SHAPESHIFT_FLAG_STANCE);
    }
    return false;
}

bool Unit::IsNoWeaponShapeShift() const
{

    // Mirroring clientside gameplay logic
    if (ShapeshiftForm form = GetShapeshiftForm())
        if (SpellShapeshiftFormEntry const* entry = sSpellShapeshiftFormStore.LookupEntry(form))
            return entry->flags1 & SHAPESHIFT_FLAG_DONT_USE_WEAPON;

    return false;
}

bool Unit::IsAttackSpeedOverridenShapeShift() const
{
    return IsAttackSpeedOverridenForm(GetShapeshiftForm());
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

    if (model && !model->HasFlag(CREATURE_MODEL_DATA_FLAGS_CAN_MOUNT))
        if (race && !race->HasFlag(CHRRACES_FLAGS_CAN_MOUNT))
            return true;

    return false;
}

void Unit::SetInCombatWith(Unit* pEnemy)
{
    ASSERT(pEnemy);

    SetInCombatState(pEnemy->UsesPvPCombatTimer() ? UNIT_PVP_COMBAT_TIMER : 0, pEnemy);
}

void Unit::SetInCombatState(uint32 combatTimer, Unit* pEnemy)
{
    // only alive units can be in combat
    if (!IsAlive())
        return;

    if (combatTimer)
    {
        if (m_combatTimer < combatTimer)
        {
            m_combatTimer += BatchifyTimer(combatTimer - m_combatTimer, UNIT_COMBAT_CHECK_TIMER_MAX);
            m_combatTimerTarget = pEnemy ? pEnemy->GetObjectGuid() : ObjectGuid();
        }
    }
    // combat timer is interrupted early on actually entering combat with victim
    // example: charge mob and kill it in 1 hit, you leave combat quicker than 5 seconds
    else if (m_combatTimer > UNIT_COMBAT_CHECK_TIMER_MAX && pEnemy && pEnemy->GetObjectGuid() == m_combatTimerTarget)
    {
        m_combatTimer = UNIT_COMBAT_CHECK_TIMER_MAX - (WorldTimer::getMSTime() % UNIT_COMBAT_CHECK_TIMER_MAX);
        m_combatTimerTarget.Clear();
    }

    bool wasInCombat = IsInCombat();
    bool creatureNotInCombat = IsCreature() && !wasInCombat;

    SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);

    if (IsCharmed() || (IsCreature() && ((Creature*)this)->IsPet()))
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);

    // interrupt all delayed non-combat casts
    if (!wasInCombat)
        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
            if (Spell* spell = GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime())
                    if (spell->m_spellInfo->IsNonCombatSpell())
                        InterruptSpell(CurrentSpellTypes(i), false);

    if (creatureNotInCombat)
    {
        auto pCreature = ToCreature();
        pCreature->SetCombatStartPosition(GetPositionX(), GetPositionY(), GetPositionZ());
        OnEnterCombat(pEnemy, true);

        // Some bosses are set into combat with zone
        if (GetMap()->IsDungeon() && pCreature->HasStaticFlag(CREATURE_STATIC_FLAG_2_FORCE_RAID_COMBAT) && pEnemy && pEnemy->IsControlledByPlayer())
            pCreature->SetInCombatWithZone();

        InterruptSpellsWithChannelFlags(AURA_INTERRUPT_HOSTILE_ACTION_RECEIVED_CANCELS);

        if (m_isCreatureLinkingTrigger)
            GetMap()->GetCreatureLinkingHolder()->DoCreatureLinkingEvent(LINKING_EVENT_AGGRO, pCreature, pEnemy);
    }
}

void Unit::SetInCombatWithAggressor(Unit* pAggressor, bool touchOnly/* = false*/)
{
    // This is a wrapper for SetInCombatWith initially created to improve PvP timers responsiveness. Can be extended in the future for broader use.

    if (!pAggressor)
        return;

    // PvP combat participation pulse: refresh pvp timers on pvp combat (we are the victim)
    if (pAggressor->IsPvP())
    {
        if (Player* pThisPlayer = GetAffectingPlayer())
        {
            if (Player const* pAggressorPlayer = pAggressor->GetAffectingPlayer())
            {
                if (pThisPlayer != pAggressorPlayer && !pThisPlayer->IsInDuelWith(pAggressorPlayer) && !(pThisPlayer->IsFFAPvP() && pAggressorPlayer->IsFFAPvP()))
                {
                    pThisPlayer->pvpInfo.inPvPCombat = (pThisPlayer->pvpInfo.inPvPCombat || !touchOnly);
                    pThisPlayer->UpdatePvP(true);
                }
            }
        }
    }

    if (!touchOnly)
    {
        SetInCombatWith(pAggressor);
        if (Creature* pCreature = ToCreature())
            pCreature->UpdateLeashExtensionTime();

        if (!IsCreature() || !static_cast<Creature*>(this)->HasStaticFlag(CREATURE_STATIC_FLAG_2_NO_OWNER_THREAT))
        {
            if (Player* pOwner = ::ToPlayer(GetCharmerOrOwner()))
            {
                if (pOwner->IsTargetableBy(pAggressor) && !pOwner->IsFeigningDeathSuccessfully())
                    pOwner->SetInCombatWithAggressor(pAggressor, false);
            }
        }
    }
}

void Unit::SetInCombatWithAssisted(Unit* pAssisted)
{
    // This is a wrapper for SetInCombatWith initially created to improve PvP timers responsiveness. Can be extended in the future for broader use.

    if (!pAssisted)
        return;

    // PvP combat participation pulse: refresh pvp timers on pvp combat (we are the assister)
    if (pAssisted->IsPvP())
    {
        if (Player* pThisPlayer = GetCharmerOrOwnerPlayerOrPlayerItself())
        {
            if (Player const* pAssistedPlayer = pAssisted->GetCharmerOrOwnerPlayerOrPlayerItself())
            {
                if (pThisPlayer != pAssistedPlayer)
                {
                    if (pAssistedPlayer->pvpInfo.inPvPCombat)
                        pThisPlayer->pvpInfo.inPvPCombat = true;

                    pThisPlayer->UpdatePvP(true);

                    if (pAssistedPlayer->IsPvPContested())
                        pThisPlayer->UpdatePvPContested(true);
                }
                // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                // - Casting spells on your pets and summons will no longer cause guards
                //   in neutral towns to attack you.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
                else if (pAssisted->IsCreature() && pAssisted->IsPvP())
                    pThisPlayer->UpdatePvPContested(true);
#endif
            }
        }
    }

    SetInCombatState((pAssisted->GetCombatTimer() > 0 || pAssisted->HasAuraType(SPELL_AURA_INTERRUPT_REGEN)) ? UNIT_PVP_COMBAT_TIMER : 0);
}

void Unit::TogglePlayerPvPFlagOnAttackVictim(Unit const* pVictim, bool touchOnly/* = false*/)
{
    // PvP combat participation pulse: refresh pvp timers on pvp combat (we are the aggressor)
    if (pVictim->IsPvP())
    {
        if (Player* pThisPlayer = GetAffectingPlayer())
        {
            Player const* pVictimPlayer = pVictim->GetAffectingPlayer();

            if (!pVictimPlayer || ((pThisPlayer != pVictimPlayer) && !pThisPlayer->IsInDuelWith(pVictimPlayer) && !(pThisPlayer->IsFFAPvP() && pVictimPlayer->IsFFAPvP())))
            {
                pThisPlayer->pvpInfo.inPvPCombat = (pThisPlayer->pvpInfo.inPvPCombat || !touchOnly);
                pThisPlayer->UpdatePvP(true);

                if (pVictimPlayer)
                    pThisPlayer->UpdatePvPContested(true);
            }
        }
    }
}

void Unit::SetInCombatWithVictim(Unit* pVictim, bool touchOnly/* = false*/, uint32 combatTimer/* = 0*/, bool direct/* = true*/)
{
    // This is a wrapper for SetInCombatWith initially created to improve PvP timers responsiveness. Can be extended in the future for broader use.

    if (!pVictim)
        return;

    TogglePlayerPvPFlagOnAttackVictim(pVictim, touchOnly);

    if (!touchOnly)
    {
        SetInCombatState(pVictim->UsesPvPCombatTimer() && (combatTimer < UNIT_PVP_COMBAT_TIMER) ? UNIT_PVP_COMBAT_TIMER : combatTimer, pVictim);

        // pet owner should not enter combat on spell missile launching
        if (!combatTimer)
        {
            // let pet AI know owner is attacking
            if (direct && IsPlayer())
            {
                if (Pet* pet = GetPet())
                    if (!pet->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT) && pet->IsAlive())
                        pet->AI()->OwnerAttacked(pVictim);

                for (auto const& guid : m_guardianPets)
                    if (Pet* pGuardian = GetMap()->GetPet(guid))
                        if (pGuardian->IsAlive())
                            pGuardian->AI()->OwnerAttacked(pVictim);
            }

            if (!IsCreature() || !static_cast<Creature*>(this)->HasStaticFlag(CREATURE_STATIC_FLAG_2_NO_OWNER_THREAT))
            {
                if (Player* pOwner = ::ToPlayer(GetCharmerOrOwner()))
                {
                    if (pOwner->IsTargetableBy(pVictim) && !pOwner->IsFeigningDeathSuccessfully())
                        pVictim->AddThreat(pOwner);

                    pOwner->SetInCombatWithVictim(pVictim, false, combatTimer >= UNIT_PVP_COMBAT_TIMER ? combatTimer : UNIT_PVP_COMBAT_TIMER, false);
                }
            }
        }
    }
}

void Unit::ClearInCombat()
{
    m_combatTimer = 0;
    RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
    RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_IN_COMBAT);

    if (IsPlayer())
    {
        static_cast<Player*>(this)->pvpInfo.inPvPCombat = false;
        static_cast<Player*>(this)->ClearTemporaryWarWithFactions();
    }
}

bool Unit::IsTargetableBy(WorldObject const* pCaster, bool forAoE, bool checkAlive, bool helpful) const
{
    // applies to both harmful and helpful
    if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE_2))
        return false;

    if (checkAlive && !IsAlive())
        return false;

    if (!helpful)
    {
        if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING | UNIT_FLAG_TAXI_FLIGHT | UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NOT_SELECTABLE))
            return false;

        if (Player const* pPlayer = ToPlayer())
        {
            if (pPlayer->IsGameMaster())
                return false;

            if (pPlayer->GetCurrentCinematicEntry() != 0)
                return false;

            if (IsTaxiFlying())
                return false;
        }

        if (!forAoE && !CanBeDetected())
            return false;
    }

    if (pCaster)
    {
        if (pCaster->IsCharmerOrOwnerPlayerOrPlayerItself())
        {
            // applies to both harmful and helpful
            if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER))
                return false;
        }
        else if (!helpful) // non player attacker
        {
            if (HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC))
                return false;

            if (!forAoE && HasUnitState(UNIT_STAT_FEIGN_DEATH))
                return false;
        }

        // attacker flags prevent attacking victim too
        if (!helpful && pCaster->IsUnit())
        {
            if (IsCharmerOrOwnerPlayerOrPlayerItself())
            {
                if (pCaster->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PLAYER))
                    return false;
            }
            else // non player victim
            {
                if (pCaster->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC))
                    return false;
            }
        }
    }

    return IsInWorld();
}

int32 Unit::ModifyHealth(int32 dVal)
{
    if (dVal == 0)
        return 0;

    int32 gain = 0;
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
    if (dVal == 0)
        return 0;

    int32 gain = 0;
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

float Unit::GetRegenHPPerSpirit() const
{
    float regen = 0.0f;

    float Spirit = GetStat(STAT_SPIRIT);
    uint8 Class = GetClass();

    switch (Class)
    {
        case CLASS_DRUID:
            regen = (Spirit * 0.11 + 1);
            break;
        case CLASS_HUNTER:
            regen = (Spirit * 0.43 - 5.5);
            break;
        case CLASS_MAGE:
            regen = (Spirit * 0.11 + 1);
            break;
        case CLASS_PALADIN:
            regen = (Spirit * 0.25);
            break;
        case CLASS_PRIEST:
            regen = (Spirit * 0.15 + 1.4);
            break;
        case CLASS_ROGUE:
            regen = (Spirit * 0.84 - 13);
            break;
        case CLASS_SHAMAN:
            regen = (Spirit * 0.28 - 3.6);
            break;
        case CLASS_WARLOCK:
            regen = (Spirit * 0.12 + 1.5);
            break;
        case CLASS_WARRIOR:
            regen = (Spirit * 1.26 - 22.6);
            break;
    }

    return std::max(0.0f, regen);
}

float Unit::GetRegenMPPerSpirit() const
{
    float addvalue = 0.0;

    float Spirit = GetStat(STAT_SPIRIT);
    uint8 Class = GetClass();

    switch (Class)
    {
        case CLASS_DRUID:
            addvalue = (Spirit / 5 + 15);
            break;
        case CLASS_HUNTER:
            addvalue = (Spirit / 5 + 15);
            break;
        case CLASS_MAGE:
            addvalue = (Spirit / 4 + 12.5);
            break;
        case CLASS_PALADIN:
            addvalue = (Spirit / 5 + 15);
            break;
        case CLASS_PRIEST:
            addvalue = (Spirit / 4 + 12.5);
            break;
        case CLASS_SHAMAN:
            addvalue = (Spirit / 5 + 17);
            break;
        case CLASS_WARLOCK:
            addvalue = (Spirit / 5 + 15);
            break;
    }

    addvalue /= 2.0f;   // the above addvalue are given per tick which occurs every 2 seconds, hence this divide by 2

    return addvalue;
}

bool Unit::IsVisibleForOrDetect(WorldObject const* pDetector, WorldObject const* viewPoint, bool detect, bool /*inVisibleList*/, bool* alert) const
{
    if (!pDetector || !IsInMap(pDetector))
        return false;

    // Always can see self
    if (pDetector == this)
        return true;

    bool at_same_transport = GetTransport() && GetTransport() == pDetector->GetTransport();

    // not in world
    if (!at_same_transport && (!IsInWorld() || !pDetector->IsInWorld()))
        return false;

    // forbidden to seen (at GM respawn command)
    if (m_Visibility == VISIBILITY_RESPAWN)
        return false;

    Unit const* pDetectorUnit = pDetector->ToUnit();
    Player const* pDetectorPlayer = pDetector->ToPlayer();

    // Grid dead/alive checks
    if (pDetectorPlayer)
    {
        // non visible at grid for any stealth state
        if (!IsVisibleInGridForPlayer(pDetectorPlayer))
            return false;

        // if player is dead then he can't detect anyone in any cases
        if (!pDetectorPlayer->IsAlive())
            detect = false;
    }
    else
    {
        // all dead creatures/players not visible for any creatures
        if ((pDetectorUnit && !pDetectorUnit->IsAlive()) || !IsAlive())
            return false;
    }

    // always seen by owner
    if (GetCharmerOrOwnerGuid() == pDetector->GetObjectGuid())
        return true;

    // IsInvisibleForAlive() those units can only be seen by dead or if other
    // unit is also invisible for alive.. if an isinvisibleforalive unit dies we
    // should be able to see it too
    if (pDetectorUnit && pDetectorUnit->IsAlive() && IsAlive() && IsInvisibleForAlive() != pDetectorUnit->IsInvisibleForAlive())
        if (!pDetectorPlayer || !pDetectorPlayer->IsGameMaster())
            return false;

    // redundant phasing
    //if (!pDetector->CanSeeInWorld(this))
    //    return false;

    if (Creature const* pCreature = ToCreature())
    {
        if (pCreature->HasExtraFlag(CREATURE_FLAG_EXTRA_ONLY_VISIBLE_TO_FRIENDLY) &&
            !pCreature->IsFriendlyTo(pDetector))
            return false;
    }

    // Visible units are always visible for all units
    if (m_Visibility == VISIBILITY_ON)
        return true;

    // GMs see any players, not higher GMs and all units
    if (pDetectorPlayer && pDetectorPlayer->IsGameMaster())
    {
        if (IsPlayer())
            return ToPlayer()->GetGMInvisibilityLevel() <= uint8(pDetectorPlayer->GetSession()->GetSecurity());
        return true;
    }

    // non faction visibility non-breakable for non-GMs
    if (m_Visibility == VISIBILITY_OFF)
        return false;

    // Hunter's Mark makes target always visible to caster.
    if (HasAuraTypeByCaster(SPELL_AURA_MOD_STALKED, pDetector->GetObjectGuid()))
        return true;

    // raw invisibility
    bool invisible = m_invisibilityMask != 0;

    // Detectable invisibility case
    if (invisible && pDetectorUnit && (
            // Invisible units are always visible for units under same
            // invisibility type
            (m_invisibilityMask & pDetectorUnit->m_invisibilityMask) ||
            // Invisible units are always visible for units that can detect the
            // appropriate invisibility level
        pDetectorUnit->CanDetectInvisibilityOf(this)))
        invisible = false;

    // special cases for always overwrite invisibility/stealth
    if (invisible || m_Visibility == VISIBILITY_GROUP_STEALTH)
    {
        // non-hostile case
        if (!pDetector->IsHostileTo(this))
        {
            // player see other player with stealth/invisibility only if he in same group or raid or same team (raid/team case dependent from conf setting)
            if (IsPlayer() && pDetectorPlayer)
            {
                if (((Player*)this)->IsGroupVisibleFor(pDetectorPlayer))
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
        return pDetectorPlayer ? pDetectorPlayer->IsInVisibleList(this) : false;

    // Special cases
    if (pDetectorUnit && !pDetectorUnit->CanDetectStealthOf(this, GetDistance3dToCenter(viewPoint), alert))
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

            if (!owner || !IsVisibleForOrDetect(owner, this, false))
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

bool Unit::CanDetectInvisibilityOf(Unit const* u) const
{
    if (Creature const* worldBoss = ToCreature())
        if (worldBoss->IsWorldBoss())
            return true;

    if (uint32 mask = u->m_invisibilityMask)
    {
        for (int32 i = 0; i < 32; ++i)
        {
            if (((1 << i) & mask) == 0)
                continue;

            // find invisibility level
            int32 invLevel = 0;
            Unit::AuraList const& iAuras = u->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY);
            for (const auto& itr : iAuras)
                if (itr->GetModifier()->m_miscvalue == i && invLevel < itr->GetModifier()->m_amount)
                    invLevel = itr->GetModifier()->m_amount;

            // find invisibility detect level
            int32 detectLevel = 0;
            if (((1 << i) & m_detectInvisibilityMask) != 0)
            {
                Unit::AuraList const& dAuras = GetAurasByType(SPELL_AURA_MOD_INVISIBILITY_DETECTION);
                for (const auto& itr : dAuras)
                    if (itr->GetModifier()->m_miscvalue == i && detectLevel < itr->GetModifier()->m_amount)
                        detectLevel = itr->GetModifier()->m_amount;
            }

            if (i == 6 && IsPlayer())     // special drunk detection case
                detectLevel = ((Player*)this)->GetDrunkValue();

            if (invLevel <= detectLevel)
                return true;
        }
    }

    return false;
}

bool Unit::CanDetectStealthOf(Unit const* target, float distance, bool* alert) const
{
    /*

    TEST RESULTS FROM CLASSIC WITH SNIFFED EXACT POSITIONS TO MEASURE DISTANCES

    Level 1 Rogue vs Level 1 Rogue from behind - detected at 1.49299 yards
    Level 2 Tauren vs Level 3 Rogue from behind - detected at 1.46318 yards
    Level 4 Creature vs Level 4 Rogue - aggro at 1.48306 yards
    Conclusion: target is always detectable below 1.5 yards, combat reach or bounding radius do not matter

    Level 4 Creature vs Level 1 Rogue - aggro at 3.23737 yards
    Level 4 Creature vs Level 2 Rogue - aggro at 2.38938 yards
    Level 4 Creature vs Level 3 Rogue - aggro at 1.58823 yards
    Conclusion: aggro distance increases by 5/6 yards per level for creature detector

    Level 4 Creature vs Level 1 Rogue - alerted at 8.23134 yards
    Level 4 Creature vs Level 2 Rogue - alerted at 7.37808 yards
    Level 4 Creature vs Level 3 Rogue - alerted at 6.64495 yards
    Conclusion: alert distance is 5 yards longer than aggro distance

    Level 1 Rogue vs Level 1 Rogue - detected at 8.97499 yards (approaching 9)
    Level 1 Rogue with Perception vs Level 1 Rogue - detected at 23.973 yards (approaching 24)
    Level 1 Rogue vs Level 2 Rogue - detected at 7.48335 yards (approaching 7.5)
    Level 1 Rogue with Perception vs Level 2 Rogue - detected at 22.382 yards (approaching 22.5)
    Level 1 Rogue vs Level 3 Rogue - detected at 5.96001 yards (approaching 6)
    Level 1 Rogue with Perception vs Level 3 Rogue - detected at 20.8784 yards (approaching 21)
    Conclusion: detection distance increases by 1.5 per level for player detector

    Level 32 Hunter vs Level 1 Rogue - detected at 29.9698 yards (approaching 30)
    Conclusion: max detection distance cap due to level difference is 30

    Level 32 Hunter vs Level 1 Rogue from behind - detected at 20.9902 yards (approaching 21)
    Conclusion: distance is reduced by 9 yards if target is behind you, applied after the cap

    Level 32 Hunter with Hunter's Mark vs Level 1 Rogue - detected at 99.682 yards (approaching 100)
    Conclusion: target is detectable all the way to max visibility distance

    */

    if (HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED))
        return false;

    if (distance < 1.5f) // collision
        return true;

    if (distance > sWorld.getConfig(IsPlayer() ? CONFIG_FLOAT_MAX_PLAYERS_STEALTH_DETECT_RANGE : CONFIG_FLOAT_MAX_CREATURES_STEALTH_DETECT_RANGE))
        return false;

    float visibleDistance = IsPlayer() ? ((target->IsPlayer()) ? 9.0f : 21.f) : (5.0f / 6.0f);
    float yardsPerLevel = IsPlayer() ? 1.5f : 5.0f / 6.0f;
    int32 stealthSkill = target->IsPlayer() ? target->GetTotalAuraModifier(SPELL_AURA_MOD_STEALTH) : target->GetLevelForTarget(this) * 5;
    stealthSkill += target->GetTotalAuraModifier(SPELL_AURA_MOD_STEALTH_LEVEL);
    int32 detectSkill = GetLevelForTarget(target) * 5 + int32(GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_STEALTH_DETECT, 0));
    int32 const levelDiff = int32(GetLevelForTarget(target)) - int32(target->GetLevelForTarget(this));
    if (levelDiff > 3)
        yardsPerLevel *= 2;

    visibleDistance += (detectSkill - stealthSkill) * yardsPerLevel / 5.0f;

    if (visibleDistance > 30.0f)
        visibleDistance = 30.0f;
    else if (visibleDistance < 0.0f)
        visibleDistance = 0.0f;

    if (!HasInArc(target))
        visibleDistance -= 9.0f;

    float alertRange = visibleDistance + 5.0f;

    // recheck new distance
    if (alert)
        *alert = distance <= alertRange && distance > visibleDistance;

    return distance <= visibleDistance;
}

void Unit::CheckPendingMovementChanges()
{
    if (!HasPendingMovementChange())
        return;

    Player* pPlayer = ToPlayer();
    if (pPlayer && pPlayer->IsBeingTeleportedFar())
        return;

    Player* pController = GetPlayerMovingMe();
    if (!pController || !pController->IsInWorld() || !pController->GetSession()->IsConnected())
    {
        ResolvePendingMovementChanges(true, pPlayer != nullptr);
        return;
    }

    PlayerMovementPendingChange& oldestChange = m_pendingMovementChanges.front();
    uint32 waitTimeMultiplier = (pPlayer && pPlayer->IsBeingTeleported()) || pController->IsBeingTeleported() ? 5 : 1;
    if (WorldTimer::getMSTime() > oldestChange.time + sWorld.getConfig(CONFIG_UINT32_MOVEMENT_CHANGE_ACK_TIME) * waitTimeMultiplier)
    {
        // This shouldn't really happen but handle it anyway.
        if (oldestChange.movementChangeType == INVALID)
        {
            PopPendingMovementChange();
            return;
        }

        // There is a new change for the same thing, don't resend old state.
        if ((oldestChange.movementCounter < GetLastCounterForMovementChangeType(oldestChange.movementChangeType)))
        {
            PopPendingMovementChange();
            return;
        }

        // Previous controller didn't ack a movement change. Not our fault.
        if (oldestChange.controller != pController->GetObjectGuid())
        {
            ResolvePendingMovementChange(oldestChange, true);
            PopPendingMovementChange();
            return;
        }

        // Always resolve teleport, but don't apply penalty.
        if (oldestChange.movementChangeType == TELEPORT)
        {
            ResolvePendingMovementChange(oldestChange, true);
            PopPendingMovementChange();
            return;
        }

        // Not resendable change.
        if (oldestChange.movementChangeType == KNOCK_BACK)
        {
            pController->GetCheatData()->OnFailedToAckChange();
            PopPendingMovementChange();
            return;
        }

        // Enforce the change.
        pController->GetCheatData()->OnFailedToAckChange();
        ResolvePendingMovementChange(oldestChange, true);
        PopPendingMovementChange();
    }
}

PlayerMovementPendingChange Unit::PopPendingMovementChange()
{
    PlayerMovementPendingChange result = m_pendingMovementChanges.front();
    m_pendingMovementChanges.pop_front();
    return result;
}

void Unit::PushPendingMovementChange(PlayerMovementPendingChange newChange)
{
    m_lastMovementChangeCounterPerType[newChange.movementChangeType] = newChange.movementCounter;
    m_pendingMovementChanges.emplace_back(std::move(newChange));
}

bool Unit::HasPendingMovementChange(MovementChangeType changeType) const
{
    return std::find_if(m_pendingMovementChanges.begin(), m_pendingMovementChanges.end(),
        [changeType](PlayerMovementPendingChange const& pendingChange)
    {
        return pendingChange.movementChangeType == changeType;
    }) != m_pendingMovementChanges.end();
}

void Unit::ResolvePendingMovementChanges(bool sendToClient, bool includingTeleport)
{
    while (!m_pendingMovementChanges.empty())
    {
        auto change = m_pendingMovementChanges.begin();
        if ((change->movementChangeType != TELEPORT || includingTeleport) &&
            change->movementCounter == GetLastCounterForMovementChangeType(change->movementChangeType))
            ResolvePendingMovementChange(*change, sendToClient);
        m_pendingMovementChanges.erase(change);
    }
}

void Unit::ResolvePendingMovementChange(PlayerMovementPendingChange& change, bool sendToClient)
{
    // returns true if heartbeat required
    switch (change.movementChangeType)
    {
        case ROOT:
            if (change.apply)
                RemoveUnitMovementFlag(MOVEFLAG_MASK_MOVING);
            SetRootedReal(change.apply);
            if (sendToClient)
                MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_ROOT, change.apply);
            break;
        case WATER_WALK:
            SetWaterWalkingReal(change.apply);
            if (sendToClient)
                MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_WATERWALKING, change.apply);
            break;
        case SET_HOVER:
            SetHoverReal(change.apply);
            if (sendToClient)
                MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_HOVER, change.apply);
            break;
        case FEATHER_FALL:
            SetFeatherFallReal(change.apply);
            if (sendToClient)
                MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_SAFE_FALL, change.apply);
            break;
        case SPEED_CHANGE_WALK:
            SetSpeedRateReal(MOVE_WALK, change.newValue / baseMoveSpeed[MOVE_WALK]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_WALK, change.newValue / baseMoveSpeed[MOVE_WALK]);
            break;
        case SPEED_CHANGE_RUN:
            SetSpeedRateReal(MOVE_RUN, change.newValue / baseMoveSpeed[MOVE_RUN]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_RUN, change.newValue / baseMoveSpeed[MOVE_RUN]);
            break;
        case SPEED_CHANGE_RUN_BACK:
            SetSpeedRateReal(MOVE_RUN_BACK, change.newValue / baseMoveSpeed[MOVE_RUN_BACK]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_RUN_BACK, change.newValue / baseMoveSpeed[MOVE_RUN_BACK]);
            break;
        case SPEED_CHANGE_SWIM:
            SetSpeedRateReal(MOVE_SWIM, change.newValue / baseMoveSpeed[MOVE_SWIM]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_SWIM, change.newValue / baseMoveSpeed[MOVE_SWIM]);
            break;
        case SPEED_CHANGE_SWIM_BACK:
            SetSpeedRateReal(MOVE_SWIM_BACK, change.newValue / baseMoveSpeed[MOVE_SWIM_BACK]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_SWIM_BACK, change.newValue / baseMoveSpeed[MOVE_SWIM_BACK]);
            break;
        case RATE_CHANGE_TURN:
            SetSpeedRateReal(MOVE_TURN_RATE, change.newValue / baseMoveSpeed[MOVE_TURN_RATE]);
            if (sendToClient)
                MovementPacketSender::SendSpeedChangeToAll(this, MOVE_TURN_RATE, change.newValue / baseMoveSpeed[MOVE_TURN_RATE]);
            break;
        case TELEPORT:
            if (Player* pPlayer = ToPlayer())
            {
                if (pPlayer->IsBeingTeleportedNear())
                {
                    pPlayer->ExecuteTeleportNear();
                    SendHeartBeat(sendToClient);
                }
            }
            break;
    }
}

bool Unit::FindPendingMovementFlagChange(uint32 movementCounter, bool applyReceived, MovementChangeType changeTypeReceived)
{
    for (auto pendingChange = m_pendingMovementChanges.begin(); pendingChange != m_pendingMovementChanges.end(); pendingChange++)
    {

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        movementCounter = pendingChange->movementCounter;
#endif

        if (pendingChange->movementCounter != movementCounter || pendingChange->apply != applyReceived || pendingChange->movementChangeType != changeTypeReceived)
            continue;

        m_pendingMovementChanges.erase(pendingChange);
        return true;
    }

    return false;
}

bool Unit::FindPendingMovementRootChange(uint32 movementCounter, bool applyReceived)
{
    for (auto pendingChange = m_pendingMovementChanges.begin(); pendingChange != m_pendingMovementChanges.end(); pendingChange++)
    {

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        movementCounter = pendingChange->movementCounter;
#endif

        if (pendingChange->movementCounter != movementCounter || pendingChange->apply != applyReceived || pendingChange->movementChangeType != ROOT)
            continue;

        m_pendingMovementChanges.erase(pendingChange);
        return true;
    }

    return false;
}

bool Unit::FindPendingMovementTeleportChange(uint32 movementCounter)
{
    for (auto pendingChange = m_pendingMovementChanges.begin(); pendingChange != m_pendingMovementChanges.end(); pendingChange++)
    {

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        movementCounter = pendingChange->movementCounter;
#endif

        if (pendingChange->movementCounter != movementCounter || pendingChange->movementChangeType != TELEPORT)
            continue;

        m_pendingMovementChanges.erase(pendingChange);
        return true;
    }

    return false;
}

bool Unit::FindPendingMovementKnockbackChange(MovementInfo& movementInfo, uint32 movementCounter)
{
    for (auto pendingChange = m_pendingMovementChanges.begin(); pendingChange != m_pendingMovementChanges.end(); pendingChange++)
    {

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        movementCounter = pendingChange->movementCounter;
#endif

        if (pendingChange->movementCounter != movementCounter || pendingChange->movementChangeType != KNOCK_BACK
            || std::fabs(pendingChange->knockbackInfo.speedXY - movementInfo.jump.xyspeed) > 0.01f
            || std::fabs(pendingChange->knockbackInfo.speedZ - movementInfo.jump.zspeed) > 0.01f
            || std::fabs(pendingChange->knockbackInfo.vcos - movementInfo.jump.cosAngle) > 0.01f
            || std::fabs(pendingChange->knockbackInfo.vsin - movementInfo.jump.sinAngle) > 0.01f)
            continue;

        m_pendingMovementChanges.erase(pendingChange);
        return true;
    }

    return false;
}

bool Unit::FindPendingMovementSpeedChange(float speedReceived, uint32 movementCounter, UnitMoveType moveType)
{
    for (auto pendingChange = m_pendingMovementChanges.begin(); pendingChange != m_pendingMovementChanges.end(); pendingChange++)
    {
        float speedSent = pendingChange->newValue;
        UnitMoveType moveTypeSent;
        switch (pendingChange->movementChangeType)
        {
            case SPEED_CHANGE_WALK:                 moveTypeSent = MOVE_WALK; break;
            case SPEED_CHANGE_RUN:                  moveTypeSent = MOVE_RUN; break;
            case SPEED_CHANGE_RUN_BACK:             moveTypeSent = MOVE_RUN_BACK; break;
            case SPEED_CHANGE_SWIM:                 moveTypeSent = MOVE_SWIM; break;
            case SPEED_CHANGE_SWIM_BACK:            moveTypeSent = MOVE_SWIM_BACK; break;
            case RATE_CHANGE_TURN:                  moveTypeSent = MOVE_TURN_RATE; break;
            default:
                continue;
        }

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_9_4
        movementCounter = pendingChange->movementCounter;
#endif

        if (pendingChange->movementCounter != movementCounter || std::fabs(speedSent - speedReceived) > 0.01f || moveTypeSent != moveType)
            continue;

        m_pendingMovementChanges.erase(pendingChange);
        return true;
    }

    return false;
}

Player* Unit::GetPlayerMovingMe()
{
    if (Player* pPossessor = GetPossessor())
        if (pPossessor->GetCharmGuid() == GetObjectGuid())
            return pPossessor;

    return ToPlayer();
}

bool Unit::IsMovedByPlayer() const
{
    if (!movespline->Finalized())
        return false;

    if (Player* pPossessor = GetPossessor())
        if (pPossessor->GetCharmGuid() == GetObjectGuid())
            return true;

    return IsPlayer() &&
           static_cast<Player const*>(this)->IsControlledByOwnClient() &&
           !static_cast<Player const*>(this)->IsBot();
}

PlayerMovementPendingChange::PlayerMovementPendingChange()
{
    time = WorldTimer::getMSTime();
}

void Unit::UpdateSpeed(UnitMoveType mtype, bool forced, float ratio)
{
    // not in combat pet have same speed as owner
    if (IsCreature() && ((Creature*)this)->IsPet() && HasUnitState(UNIT_STAT_FOLLOW) && !IsInCombat())
    {
        if (Unit* owner = GetOwner())
        {
            switch(mtype)
            {
                case MOVE_RUN:
                case MOVE_WALK:
                case MOVE_SWIM:
                    SetSpeedRate(mtype, owner->GetSpeedRate(mtype));
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
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::UpdateSpeed: Unsupported move type (%d)", mtype);
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

    // for player case, we look for some custom rates
    if (IsPlayer())
    {
        if (GetDeathState() == CORPSE)
            speed *= sWorld.getConfig(((Player*)this)->InBattleGround() ? CONFIG_FLOAT_GHOST_RUN_SPEED_BG : CONFIG_FLOAT_GHOST_RUN_SPEED_WORLD);
    }

    // Apply strongest slow aura mod to speed
    int32 slow = GetMaxNegativeAuraModifier(SPELL_AURA_MOD_DECREASE_SPEED);
    if (slow)
        speed *= (100.0f + slow) / 100.0f;

    if (IsCreature())
    {
        // Before patch 1.9 pets should retain their wild speed, after that they are normalised
        Creature* pCreature = (Creature*)this;
        if (!(pCreature->IsPet() && pCreature->GetOwnerGuid().IsPlayer()) ||
            (sWorld.GetWowPatch() < WOW_PATCH_109 && sWorld.getConfig(CONFIG_BOOL_ACCURATE_PETS)))
        {
            switch (mtype)
            {
                case MOVE_RUN:
                    speed *= ((Creature*)this)->GetBaseRunSpeedRate();
                    break;
                case MOVE_WALK:
                    speed *= ((Creature*)this)->GetBaseWalkSpeedRate();
                    break;
                default:
                    break;
            }
        }
        else
            speed *= DEFAULT_NPC_RUN_SPEED_RATE;  // normalized player pet runspeed

        // Speed reduction at low health percentages
        if (!pCreature->IsPet() && !pCreature->IsWorldBoss() && !pCreature->HasStaticFlag(CREATURE_STATIC_FLAG_2_NO_WOUNDED_SLOWDOWN))
        {
            if (HasAuraState(AURA_STATE_HEALTHLESS_5_PERCENT))
                speed *= SPEED_REDUCTION_HP_5;
            else if (HasAuraState(AURA_STATE_HEALTHLESS_10_PERCENT))
                speed *= SPEED_REDUCTION_HP_10;
            else if (HasAuraState(AURA_STATE_HEALTHLESS_15_PERCENT))
                speed *= SPEED_REDUCTION_HP_15;
        }
    }

    if (forced)
        SetSpeedRateReal(mtype, speed * ratio);
    else
        SetSpeedRate(mtype, speed * ratio);
}

float Unit::GetSpeed(UnitMoveType mtype) const
{
    return m_speed_rate[mtype] * baseMoveSpeed[mtype];
}

float Unit::GetXZFlagBasedSpeed() const
{
    return GetXZFlagBasedSpeed(m_movementInfo.moveFlags);
}

float Unit::GetXZFlagBasedSpeed(uint32 moveFlags) const
{
    // not moving laterally? zero!
    if (!(moveFlags & MOVEFLAG_MASK_XZ))
        return 0.f;

    // swimming?
    if (!!(moveFlags & MOVEFLAG_SWIMMING))
    {
        if (!!(moveFlags & MOVEFLAG_BACKWARD))
            return GetSpeed(MOVE_SWIM_BACK);

        return GetSpeed(MOVE_SWIM);
    }

    // walking?
    if (!!(moveFlags & MOVEFLAG_WALK_MODE))
    {
        // Seems to always be same speed forward and backward when walking
        return GetSpeed(MOVE_WALK);
    }

    // Presumably only running left when IsMoving is true
    if (!!(moveFlags & MOVEFLAG_BACKWARD))
        return GetSpeed(MOVE_RUN_BACK);

    return GetSpeed(MOVE_RUN);
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

void Unit::SetSpeedRate(UnitMoveType mtype, float rate)
{
    if (rate < 0)
        rate = 0.0f;

    // Update speed only on change
    MovementChangeType changeType = MovementPacketSender::GetChangeTypeByMoveType(mtype);
    if (m_speed_rate[mtype] == rate && !HasPendingMovementChange(changeType))
        return;

    if (IsMovedByPlayer() && IsInWorld())
        MovementPacketSender::AddSpeedChangeToController(this, mtype, rate);
    else if (IsMovedByPlayer() && !IsInWorld()) // (1)
        SetSpeedRateReal(mtype, rate);
    else // <=> if (!IsMovedByPlayer())
    {
        SetSpeedRateReal(mtype, rate);
        MovementPacketSender::SendSpeedChangeToAll(this, mtype, rate);
    }

    // explaination of (1):
    // If the player is not in the world yet, it won't reply to the packets requiring an ack. And once the player is in the world, next time a movement
    // packet which requires an ack is sent to the client (change of speed for example), the client is kicked from the
    // server on the ground that it should have replied to the first packet first. That line is a hacky fix
    // in the sense that it doesn't work like that in retail since buffs are applied only after the player has been
    // initialized in the world. cf description of PR #18771
}

void Unit::SetSpeedRateReal(UnitMoveType mtype, float rate)
{
    m_speed_rate[mtype] = rate;
    PropagateSpeedChange();
    CallForAllControlledUnits(SetSpeedRateHelper(mtype, true), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM | CONTROLLED_MINIPET);
}

void Unit::SetRooted(bool apply)
{
    // do nothing if the unit is already in the required state
    if (apply == (HasUnitMovementFlag(MOVEFLAG_ROOT) || HasUnitState(UNIT_STAT_ROOT_ON_LANDING)) &&
        !HasPendingMovementChange(ROOT))
        return;

    if (apply)
        StopMoving(); // @todo: this method needs a rework to work well with players.

    if (IsMovedByPlayer() && IsInWorld())
        MovementPacketSender::AddMovementFlagChangeToController(this, MOVEFLAG_ROOT, apply);
    else if (IsMovedByPlayer() && !IsInWorld())
        SetRootedReal(apply);
    else
    {
        SetRootedReal(apply);
        MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_ROOT, apply);
    }
}

void Unit::SetRootedReal(bool apply)
{
    if (apply)
        AddUnitMovementFlag(MOVEFLAG_ROOT);
    else
        RemoveUnitMovementFlag(MOVEFLAG_ROOT);
}

void Unit::SetWaterWalking(bool apply)
{
    if (apply == HasUnitMovementFlag(MOVEFLAG_WATERWALKING) && !HasPendingMovementChange(WATER_WALK))
        return;

    if (IsMovedByPlayer() && IsInWorld())
        MovementPacketSender::AddMovementFlagChangeToController(this, MOVEFLAG_WATERWALKING, apply);
    else if (IsMovedByPlayer() && !IsInWorld())
        SetWaterWalkingReal(apply);
    else
    {
        SetWaterWalkingReal(apply);
        MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_WATERWALKING, apply);
    }
}

void Unit::SetWaterWalkingReal(bool apply)
{
    if (apply)
        AddUnitMovementFlag(MOVEFLAG_WATERWALKING);
    else
        RemoveUnitMovementFlag(MOVEFLAG_WATERWALKING);
}

void Unit::SetFeatherFall(bool apply)
{
    if (apply == HasUnitMovementFlag(MOVEFLAG_SAFE_FALL) && !HasPendingMovementChange(FEATHER_FALL))
        return;

    if (IsMovedByPlayer() && IsInWorld())
        MovementPacketSender::AddMovementFlagChangeToController(this, MOVEFLAG_SAFE_FALL, apply);
    else if (IsMovedByPlayer() && !IsInWorld())
        SetFeatherFallReal(apply);
    else
    {
        SetFeatherFallReal(apply);
        MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_SAFE_FALL, apply);
    }
}

void Unit::SetFeatherFallReal(bool apply)
{
    if (apply)
        AddUnitMovementFlag(MOVEFLAG_SAFE_FALL);
    else
        RemoveUnitMovementFlag(MOVEFLAG_SAFE_FALL);
}

void Unit::SetHover(bool apply)
{
    if (apply == HasUnitMovementFlag(MOVEFLAG_HOVER) && !HasPendingMovementChange(SET_HOVER))
        return;

    if (IsMovedByPlayer() && IsInWorld())
        MovementPacketSender::AddMovementFlagChangeToController(this, MOVEFLAG_HOVER, apply);
    else if (IsMovedByPlayer() && !IsInWorld())
        SetHoverReal(apply);
    else
    {
        SetHoverReal(apply);
        MovementPacketSender::SendMovementFlagChangeToAll(this, MOVEFLAG_HOVER, apply);
    }
}

void Unit::SetHoverReal(bool apply)
{
    if (apply)
        AddUnitMovementFlag(MOVEFLAG_HOVER);
    else
        RemoveUnitMovementFlag(MOVEFLAG_HOVER);
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
        m_movementInfo.AddMovementFlag(MOVEFLAG_FLYING | MOVEFLAG_MOVED);
    else
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_FLYING | MOVEFLAG_MOVED);
}

void Unit::SetDeathState(DeathState s)
{
    if (s != ALIVE && s != JUST_ALIVED)
    {
        // should be before combat stop so threat is transferred in case of MC
        if (s == JUST_DIED)
            RemoveCharmAuras(AURA_REMOVE_BY_DEATH);

        CombatStop();
        DeleteThreatList();

        if (IsNonMeleeSpellCasted(false))
            InterruptNonMeleeSpells(false);
    }

    m_deathState = s;

    if (s == JUST_DIED)
    {
        if (!m_ComboPointHolders.empty())
        {
            // Delay clearing combo points until next update.
            // This fixes Relentless Strikes not triggering when the finishing move kills the target.
            m_Events.AddLambdaEventAtOffset([this]
            {
                ClearComboPointHolders();
            }, 1);
        }

        RemoveAllAurasOnDeath();
        UnsummonAllTotems();

        i_motionMaster.Clear(false, true);
        i_motionMaster.MoveIdle();

        if (IsPlayer())
            SetRooted(true);
        else
            StopMoving(IsMoving());

        // Powers are cleared on death.
        SetPower(GetPowerType(), 0);

        ModifyAuraState(AURA_STATE_HEALTHLESS_20_PERCENT, false);
        ModifyAuraState(AURA_STATE_HEALTHLESS_15_PERCENT, false);
        ModifyAuraState(AURA_STATE_HEALTHLESS_10_PERCENT, false);
        ModifyAuraState(AURA_STATE_HEALTHLESS_5_PERCENT, false);
        // remove aurastates allowing special moves
        ClearAllReactives();
        ClearDiminishings();
    }
    else if (s == JUST_ALIVED || s == ALIVE)
    {
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);  // clear skinnable for creature and player (at battleground)
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
    if (!IsCreature())
        return false;

    // only alive units can have threat list
    if (!IsAlive())
        return false;

    Creature const* pCreature = static_cast<Creature const*>(this);

    // totems can not have threat list
    if (pCreature->IsTotem())
        return false;

    // pets can not have a threat list, unless they are controlled by a creature
    if (pCreature->IsPet() && pCreature->GetOwnerGuid().IsPlayer())
        return false;

    // charmed units can not have a threat list if charmed by player
    if (pCreature->GetCharmerGuid().IsPlayer())
        return false;

    if (pCreature->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_THREAT_LIST))
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

void Unit::AddThreat(Unit* pVictim, float threat /*= 0.0f*/, bool crit /*= false*/, SpellSchoolMask schoolMask /*= SPELL_SCHOOL_MASK_NONE*/, SpellEntry const* threatSpell /*= nullptr*/)
{
    if (threatSpell && threatSpell->HasAttribute(SPELL_ATTR_EX4_NO_HARMFUL_THREAT))
        return;

    // Only mobs can manage threat lists
    if (CanHaveThreatList() && IsInMap(pVictim))
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
    MANGOS_ASSERT(IsCreature());

    if (!taunter || (taunter->IsPlayer() && ((Player*)taunter)->IsGameMaster()))
        return;

    if (!CanHaveThreatList())
        return;

    Unit* target = GetVictim();

    if (target && target == taunter)
        return;

    // Nostalrius : Correction bug sheep/fear
    if (!HasAuraType(SPELL_AURA_MOD_FEAR) && !HasAuraType(SPELL_AURA_MOD_CONFUSE))
    {
        SetInFront(taunter);
        OnEnterCombat(taunter, !IsInCombat());

        if (((Creature*)this)->AI())
            ((Creature*)this)->AI()->AttackStart(taunter);
    }

    m_ThreatManager.tauntApply(taunter);
}

//======================================================================

void Unit::TauntFadeOut(Unit* taunter)
{
    MANGOS_ASSERT(IsCreature());

    if (!taunter || (taunter->IsPlayer() && ((Player*)taunter)->IsGameMaster()))
        return;

    if (!CanHaveThreatList())
        return;

    Unit* target = GetVictim();

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

void Unit::RemoveTauntCaster(ObjectGuid guid)
{
    // remove only 1 occurance, starting from the front
    // since guids are pushed back on taunt aura apply
    for (auto itr = m_tauntGuids.begin(); itr != m_tauntGuids.end(); ++itr)
    {
        if ((*itr) == guid)
        {
            m_tauntGuids.erase(itr);
            return;
        }
    }
}

//======================================================================

Unit* Unit::GetTauntTarget() const
{
    // taunters are pushed back, last caster will be at the end
    for (auto itr = m_tauntGuids.rbegin(); itr != m_tauntGuids.rend(); ++itr)
    {
        if (Unit* pTaunter = GetMap()->GetUnit(*itr))
        {
            if (IsValidAttackTarget(pTaunter))
                return pTaunter;
        }
    }

    return nullptr;
}

bool Unit::SelectHostileTarget()
{
    // function provides main threat functionality
    // next-victim-selection algorithm and evade mode are called
    // threat list sorting etc.

    MANGOS_ASSERT(IsCreature());

    if (!IsAlive())
        return false;

    // This function is only useful once AI has been initialized
    if (!((Creature*)this)->AI())
        return false;

    // Nostalrius: 5 sec delay before attack after spawn.
    if (((Creature*)this)->IsTempPacified())
        return false;

    Unit* target = GetTauntTarget();

    // No taunt aura or taunt aura caster is dead, standard target selection
    if (!target && !m_ThreatManager.isThreatListEmpty())
        target = m_ThreatManager.getHostileTarget();

    // stick to current target if no threat list
    if (!target && ((Creature*)this)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_THREAT_LIST))
        target = GetVictim();

    if (target)
    {
        // Nostalrius : Correction bug sheep/fear
        if (!HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_PENDING_STUNNED | UNIT_STAT_FEIGN_DEATH | UNIT_STAT_CONFUSED | UNIT_STAT_FLEEING) && (!HasAuraType(SPELL_AURA_MOD_FEAR) || HasAuraType(SPELL_AURA_PREVENTS_FLEEING)) && !HasAuraType(SPELL_AURA_MOD_CONFUSE))
        {
            SetInFront(target);
            ((Creature*)this)->AI()->AttackStart(target);
        }
        return true;
    }

    // mobs that dont have threat list use 5 second combat timer like players
    if (((Creature*)this)->HasExtraFlag(CREATURE_FLAG_EXTRA_NO_THREAT_LIST))
        return false;

    // no target but something prevent go to evade mode // Nostalrius - fix evade quand CM.
    if (!IsInCombat() || HasAuraType(SPELL_AURA_MOD_TAUNT) || GetCharmerGuid())
        return false;

    // last case when creature don't must go to evade mode:
    // it in combat but attacker not make any damage and not enter to aggro radius to have record in threat list
    // for example at owner command to pet attack some far away creature
    // Note: creature not have targeted movement generator but have attacker in this case
    if (GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
    {
        for (const auto& itr : m_attackers)
        {
            if (itr->IsInMap(this) && itr->IsTargetableBy(this))
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

DiminishingLevels Unit::GetDiminishing(DiminishingGroup group)
{
    for (auto& i : m_Diminishing)
    {
        if (i.DRGroup != group)
            continue;

        if (!i.hitCount)
            return DIMINISHING_LEVEL_1;

        if (!i.hitTime)
            return DIMINISHING_LEVEL_1;

        // If last spell was casted more than 15 seconds ago - reset the count.
        if (i.stack == 0 && WorldTimer::getMSTimeDiff(i.hitTime, WorldTimer::getMSTime()) > 15 * IN_MILLISECONDS)
        {
            i.hitCount = DIMINISHING_LEVEL_1;
            return DIMINISHING_LEVEL_1;
        }
        // or else increase the count.
        else
            return DiminishingLevels(i.hitCount);
    }
    return DIMINISHING_LEVEL_1;
}

void Unit::IncrDiminishing(DiminishingGroup group)
{
    // Checking for existing in the table
    for (auto& i : m_Diminishing)
    {
        if (i.DRGroup != group)
            continue;
        if (i.hitCount < DIMINISHING_LEVEL_IMMUNE)
            i.hitCount += 1;
        return;
    }
    m_Diminishing.push_back(DiminishingReturn(group, WorldTimer::getMSTime(), DIMINISHING_LEVEL_2));
}

void Unit::ApplyDiminishingToDuration(DiminishingGroup group, int32& duration, WorldObject const* caster, DiminishingLevels Level, bool isReflected)
{
    if (duration == -1 || group == DIMINISHING_NONE || (!isReflected && caster->IsFriendlyTo(this)))
        return;

    float mod = 1.0f;

    // Some diminishings applies to mobs too (for example, Stun)
    // Nostalrius: fix DR sur les pets.
    bool pvp = (IsLikePlayer() && caster->IsLikePlayer());
    if ((Spells::GetDiminishingReturnsGroupType(group) == DRTYPE_PLAYER && pvp) || Spells::GetDiminishingReturnsGroupType(group) == DRTYPE_ALL)
    {
        mod = Spells::GetDiminishingRate(Level);
    }

    duration = int32(duration * mod);
}

void Unit::ApplyDiminishingAura(DiminishingGroup group, bool apply)
{
    // Checking for existing in the table
    for (auto& i : m_Diminishing)
    {
        if (i.DRGroup != group)
            continue;

        if (apply)
            i.stack += 1;
        else if (i.stack)
        {
            i.stack -= 1;
            // Remember time after last aura from group removed
            if (i.stack == 0)
                i.hitTime = WorldTimer::getMSTime();
        }
        break;
    }
}

bool Unit::IsVisibleForInState(WorldObject const* pDetector, WorldObject const* viewPoint, bool inVisibleList) const
{
    return IsVisibleForOrDetect(pDetector, viewPoint, false, inVisibleList);
}

// returns true if creature can't be seen by alive units
bool Unit::IsInvisibleForAlive() const
{
    // Ghost
    if (HasAura(9036))
        return true;

    // TODO: maybe spiritservices also have just an aura
    return IsSpiritService();
}

// returns true if creature can be seen by dead units
bool Unit::IsVisibleForDead() const
{
    if (IsCreature() && static_cast<Creature const*>(this)->HasStaticFlag(CREATURE_STATIC_FLAG_VISIBLE_TO_GHOSTS))
        return true;

    return IsSpiritService();
}

uint32 Unit::GetCreatureType() const
{
    if (IsPlayer())
    {
        SpellShapeshiftFormEntry const* ssEntry = sSpellShapeshiftFormStore.LookupEntry(GetShapeshiftForm());
        if (ssEntry && ssEntry->creatureType > 0)
            return ssEntry->creatureType;
        else if (ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(GetRace()))
            return raceEntry->creatureType;
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

// attack power needs special handling because positive and negative mods are set in separate update fields
bool Unit::HandleAttackPowerModifier(AttackPowerModIndex index, AttackPowerModType modifierType, float amount, bool apply)
{
    if (index >= AP_MODS_COUNT || modifierType >= AP_MOD_TYPE_COUNT)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ERROR in HandleAttackPowerModifier(): nonexistent index %u or type %u!", index, modifierType);
        return false;
    }

    switch (modifierType)
    {
        case AP_MOD_POSITIVE_FLAT:
            m_attackPowerMods[index].positiveMods += apply ? amount : -amount;
            break;
        case AP_MOD_NEGATIVE_FLAT:
            m_attackPowerMods[index].negativeMods += apply ? amount : -amount;
            break;
        case AP_MOD_PCT:
            ApplyPercentModFloatVar(m_attackPowerMods[index].multiplier, amount, apply);
            break;
    }

    if (!CanModifyStats())
        return false;

    UpdateAttackPowerAndDamage(index == RANGED_AP_MODS);
    return true;
}

float Unit::GetAttackPowerModifierValue(AttackPowerModIndex index, AttackPowerModType modifierType) const
{
    if (index >= AP_MODS_COUNT || modifierType >= AP_MOD_TYPE_COUNT)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt to access nonexistent modifier value from m_attackPowerMods!");
        return 0.0f;
    }

    switch (modifierType)
    {
        case AP_MOD_POSITIVE_FLAT:
            return m_attackPowerMods[index].positiveMods;
        case AP_MOD_NEGATIVE_FLAT:
            return m_attackPowerMods[index].negativeMods;
        case AP_MOD_PCT:
            return std::max(0.0f, m_attackPowerMods[index].multiplier);
    }

    return 0;
}

bool Unit::HandleStatModifier(UnitMods unitMod, UnitModifierType modifierType, float amount, bool apply)
{
    if (unitMod >= UNIT_MOD_END || modifierType >= MODIFIER_TYPE_END)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "ERROR in HandleStatModifier(): nonexistent UnitMods or wrong UnitModifierType!");
        return false;
    }

    switch (modifierType)
    {
        case BASE_VALUE:
        case TOTAL_VALUE:
            m_auraModifiersGroup[unitMod][modifierType] += apply ? amount : -amount;
            break;
        case BASE_PCT:
        case TOTAL_PCT:
            ApplyPercentModFloatVar(m_auraModifiersGroup[unitMod][modifierType], amount, apply);
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
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "attempt to access nonexistent modifier value from UnitMods!");
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

float Unit::GetTotalResistanceValue(SpellSchools school) const
{
    UnitMods unitMod = UnitMods(UNIT_MOD_RESISTANCE_START + school);

    if (m_auraModifiersGroup[unitMod][TOTAL_PCT] <= 0.0f)
        return 0.0f;

    // value = ((base_value * base_pct) + total_value) * total_pct
    float value = GetCreateResistance(school);

    bool const vulnerability = (value < 0);

    value += m_auraModifiersGroup[unitMod][BASE_VALUE];
    value *= m_auraModifiersGroup[unitMod][BASE_PCT];
    value += m_auraModifiersGroup[unitMod][TOTAL_VALUE];
    value *= m_auraModifiersGroup[unitMod][TOTAL_PCT];

    // World of Warcraft Client Patch 1.9.0 (2006-01-03)
    // - Curse of Shadow and Curse of the Elements - These curses can no
    //   longer cause resistance to become negative.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    // Auras can't cause resistances to dip below 0 since early vanilla
    // PS: Actually, they can, but only visually advertised in the fields, calculations ignore it, we limit both
    if (value < 0 && !vulnerability)
        value = 0;
#endif

    return value;
}

float Unit::GetTotalAuraModValue(UnitMods unitMod) const
{
    if (unitMod >= UNIT_MOD_END)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "attempt to access nonexistent UnitMods in GetTotalAuraModValue()!");
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
        int32 ap = GetInt32Value(UNIT_FIELD_RANGED_ATTACK_POWER) + GetInt16Value(UNIT_FIELD_RANGED_ATTACK_POWER_MODS, 0) + GetInt16Value(UNIT_FIELD_RANGED_ATTACK_POWER_MODS, 1);
        if (ap < 0)
            return 0.0f;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        return ap * (1.0f + GetFloatValue(UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER));
#else
        return ap;
#endif
    }
    else
    {
        int32 ap = GetInt32Value(UNIT_FIELD_ATTACK_POWER) + GetInt16Value(UNIT_FIELD_ATTACK_POWER_MODS, 0) + GetInt16Value(UNIT_FIELD_ATTACK_POWER_MODS, 1);
        if (ap < 0)
            return 0.0f;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        return ap * (1.0f + GetFloatValue(UNIT_FIELD_ATTACK_POWER_MULTIPLIER));
#else
        return ap;
#endif
    }
}

float Unit::GetWeaponDamageRange(WeaponAttackType attType, WeaponDamageRange damageRange, uint8 index) const
{
    if (attType == OFF_ATTACK && !HaveOffhandWeapon())
        return 0.0f;

    return m_weaponDamage[attType][index].damage[damageRange];
}

void Unit::SetLevel(uint32 lvl)
{
    SetUInt32Value(UNIT_FIELD_LEVEL, lvl);

    // group update
    if ((IsPlayer()) && ((Player*)this)->GetGroup())
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
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_HP);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_HP);
        }
    }
}

void Unit::SetMaxHealth(uint32 val)
{
    uint32 health = GetHealth();
    SetUInt32Value(UNIT_FIELD_MAXHEALTH, val);
    ForceValuesUpdateAtIndex(UNIT_FIELD_HEALTH); // Cf plus haut.

    // group update
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_HP);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_HP);
        }
    }

    if (val < health)
        SetHealth(val);
}

void Unit::SetHealthPercent(float percent)
{
    uint32 newHealth = GetMaxHealth() * percent / 100.0f;
    if (percent > 0 && newHealth == 0)
        newHealth = 1;
    SetHealth(newHealth);
}

void Unit::SetPowerPercent(Powers power, float percent)
{
    uint32 newMana = GetMaxPower(power) * percent / 100.0f;
    SetPower(power, newMana);
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
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_POWER);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_POWER);
        }

        // Update the pet's character sheet with happiness damage bonus
        if (pPet->getPetType() == HUNTER_PET && power == POWER_HAPPINESS)
            pPet->UpdateDamagePhysical(BASE_ATTACK);
    }
}

void Unit::SetMaxPower(Powers power, uint32 val)
{
    uint32 cur_power = GetPower(power);
    SetStatInt32Value(UNIT_FIELD_MAXPOWER1 + power, val);

    // group update
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_POWER);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_POWER);
        }
    }

    if (val < cur_power)
        SetPower(power, val);
}

void Unit::ApplyPowerMod(Powers power, uint32 val, bool apply)
{
    ApplyModUInt32Value(UNIT_FIELD_POWER1 + power, val, apply);

    // group update
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_CUR_POWER);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_CUR_POWER);
        }
    }
}

void Unit::ApplyMaxPowerMod(Powers power, uint32 val, bool apply)
{
    ApplyModUInt32Value(UNIT_FIELD_MAXPOWER1 + power, val, apply);

    // group update
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_MAX_POWER);
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            Player* pOwner = ::ToPlayer(GetOwner());
            if (pOwner && pOwner->GetGroup())
                pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MAX_POWER);
        }
    }
}

uint32 Unit::GetCreatePowers(Powers power) const
{
    switch (power)
    {
        case POWER_HEALTH:
            return 0;
        case POWER_MANA:
            return GetCreateMana();
        case POWER_RAGE:
            return 1000;
        case POWER_FOCUS:
            return (IsPlayer() || !IsPet() || ((Pet const*)this)->getPetType() != HUNTER_PET ? 0 : 100);
        case POWER_ENERGY:
            return 100;
        case POWER_HAPPINESS:
            return (IsPlayer() || !IsPet() || ((Pet const*)this)->getPetType() != HUNTER_PET ? 0 : 1050000);
    }

    return 0;
}

void Unit::AddToWorld()
{
    Object::AddToWorld();
    ScheduleAINotify(0);

    if (sWorld.getConfig(CONFIG_UINT32_SPELL_PROC_DELAY))
        m_procsUpdateTimer = sWorld.getConfig(CONFIG_UINT32_SPELL_PROC_DELAY) - (WorldTimer::getMSTime() % sWorld.getConfig(CONFIG_UINT32_SPELL_PROC_DELAY));
    m_combatTimer = UNIT_COMBAT_CHECK_TIMER_MAX - (WorldTimer::getMSTime() % UNIT_COMBAT_CHECK_TIMER_MAX);
}

void Unit::RemoveFromWorld()
{
    // cleanup
    if (IsInWorld())
    {
        Uncharm();
        RemoveNotOwnSingleTargetAuras();
        RemoveGuardians();
        // Remove non-guardian pet
        if (Pet* pet = GetPet())
            pet->Unsummon(PET_SAVE_AS_DELETED, this);
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
        if (GetHostileRefManager().getOwner() == this)
        {
            if (IsPlayer())
                GetHostileRefManager().setOnlineOfflineState(false);
            else
                GetHostileRefManager().deleteReferences();
        }
        RemoveAllAuras(AURA_REMOVE_BY_DELETE);
        CleanupDeletedAuras(); // any long range channeled spells need to be cleaned up after aura deletion
    }
    WorldObject::CleanupsBeforeDelete();
}

CharmInfo* Unit::InitCharmInfo(Unit* charm)
{
    if (!m_charmInfo)
        m_charmInfo = new CharmInfo(charm);
    return m_charmInfo;
}

void Unit::ClearCharmInfo()
{
    if (CharmInfo* pInfo = m_charmInfo)
    {
        m_charmInfo = nullptr;
        delete pInfo;
    }
}

CharmInfo::CharmInfo(Unit* unit)
    : m_unit(unit), m_originalFactionTemplate(nullptr), m_commandState(COMMAND_FOLLOW), m_reactState(REACT_PASSIVE), m_petNumber(0),
      m_isCommandAttack(false), m_isCommandFollow(false), m_isAtStay(false), m_isFollowing(false), m_isReturning(false),
      m_stayX(0.0f), m_stayY(0.0f), m_stayZ(0.0f)
{
    for (auto& itr : m_charmSpells)
        itr.SetActionAndType(0, ACT_DISABLED);
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
    InitEmptyActionBar();

    // possessed players don't have spells, keep the action bar empty
    Creature* pCreature = m_unit->ToCreature();
    if (!pCreature)
        return;

    for (uint32 spell : pCreature->m_spells)
    {
        if (Spells::IsPassiveSpell(spell))
            m_unit->CastSpell(m_unit, spell, true);
        else if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spell))

            // World of Warcraft Client Patch 1.10.0 (2006-03-28)
            // - Charm spells on charmed creatures are no longer available to the
            //   players that charm them.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
            if (!pSpellEntry->IsCharmSpell())
#endif

                AddSpellToActionBar(spell, ACT_PASSIVE);
    }
}

void CharmInfo::InitCharmCreateSpells()
{
    if (m_unit->IsPlayer())               //charmed players don't have spells
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
            m_charmSpells[x].SetActionAndType(spellId, ACT_DISABLED);
            continue;
        }

        if (Spells::IsPassiveSpell(spellId))
        {
            m_unit->CastSpell(m_unit, spellId, true);
            m_charmSpells[x].SetActionAndType(spellId, ACT_PASSIVE);
        }
        else
        {
            m_charmSpells[x].SetActionAndType(spellId, ACT_DISABLED);

            ActiveStates newstate;
            bool onlyselfcast = true;
            SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spellId);

            if (!pSpellEntry)
                onlyselfcast = false;

            // World of Warcraft Client Patch 1.10.0 (2006-03-28)
            // - Charm spells on charmed creatures are no longer available to the
            //   players that charm them.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
            else if (pSpellEntry->IsCharmSpell())
                continue;
#endif

            for (uint32 i = 0; i < 3 && onlyselfcast; ++i)  //nonexistent spell will not make any problems as onlyselfcast would be false -> break right away
            {
                if (pSpellEntry->EffectImplicitTargetA[i] != TARGET_UNIT_CASTER && pSpellEntry->EffectImplicitTargetA[i] != 0)
                    onlyselfcast = false;
            }

            if (onlyselfcast || !Spells::IsPositiveSpell(spellId))  // only self cast and spells versus enemies are autocastable
                newstate = ACT_DISABLED;
            else
                newstate = ACT_PASSIVE;

            AddSpellToActionBar(spellId, newstate);
        }
    }
}

bool CharmInfo::AddSpellToActionBar(uint32 spellId, ActiveStates newstate)
{
    uint32 first_id = sSpellMgr.GetFirstSpellInChain(spellId);

    // new spell rank can be already listed
    for (auto& i : m_petActionBar)
    {
        if (uint32 action = i.GetAction())
        {
            if (i.IsActionBarForSpell() && sSpellMgr.GetFirstSpellInChain(action) == first_id)
            {
                i.SetAction(spellId);
                return true;
            }
        }
    }

    // or use empty slot in other case
    for (uint8 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (!m_petActionBar[i].GetAction() && m_petActionBar[i].IsActionBarForSpell())
        {
            SetActionBar(i, spellId, newstate == ACT_DECIDE ? ACT_DISABLED : newstate);
            return true;
        }
    }
    return false;
}

bool CharmInfo::RemoveSpellFromActionBar(uint32 spellId)
{
    uint32 first_id = sSpellMgr.GetFirstSpellInChain(spellId);

    for (uint8 i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
    {
        if (uint32 action = m_petActionBar[i].GetAction())
        {
            if (m_petActionBar[i].IsActionBarForSpell() && sSpellMgr.GetFirstSpellInChain(action) == first_id)
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
    if (Spells::IsPassiveSpell(spellid))
        return;

    for (auto& itr : m_charmSpells)
        if (spellid == itr.GetAction())
            itr.SetType(apply ? ACT_ENABLED : ACT_DISABLED);
}

void CharmInfo::SetPetNumber(uint32 petNumber, bool statWindow)
{
    m_petNumber = petNumber;
    if (statWindow)
        m_unit->SetUInt32Value(UNIT_FIELD_PETNUMBER, m_petNumber);
    else
        m_unit->SetUInt32Value(UNIT_FIELD_PETNUMBER, 0);
}

void CharmInfo::LoadPetActionBar(std::string const& data)
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

        m_petActionBar[index].SetActionAndType(action, ActiveStates(type));

        // check correctness
        if (m_petActionBar[index].IsActionBarForSpell() && !sSpellMgr.GetSpellEntry(m_petActionBar[index].GetAction()))
            SetActionBar(index, 0, ACT_DISABLED);
    }
}

void CharmInfo::BuildActionBar(WorldPacket* data)
{
    for (const auto& i : m_petActionBar)
        *data << uint32(i.packedData);
}

void CharmInfo::SetSpellAutocast(uint32 spellId, bool state)
{
    for (auto& i : m_petActionBar)
    {
        if (spellId == i.GetAction() && i.IsActionBarForSpell())
        {
            i.SetType(state ? ACT_ENABLED : ACT_DISABLED);
            break;
        }
    }
}

void CharmInfo::SetIsCommandAttack(bool val)
{
    m_isCommandAttack = val;
}

bool CharmInfo::IsCommandAttack()
{
    return m_isCommandAttack;
}

void CharmInfo::SetIsCommandFollow(bool val)
{
    m_isCommandFollow = val;
}

bool CharmInfo::IsCommandFollow()
{
    return m_isCommandFollow;
}

void CharmInfo::SaveStayPosition()
{
    // No Unit::StopMoving while possessed
    if (m_unit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED))
        m_unit->GetPosition(m_stayX, m_stayY, m_stayZ);
    else //! At this point a new spline destination is enabled because of Unit::StopMoving()
    {
        G3D::Vector3 stayPos = m_unit->movespline->FinalDestination();
        m_stayX = stayPos.x;
        m_stayY = stayPos.y;
        m_stayZ = stayPos.z;
    }
}

void CharmInfo::GetStayPosition(float &x, float &y, float &z)
{
    x = m_stayX;
    y = m_stayY;
    z = m_stayZ;
}

void CharmInfo::SetIsAtStay(bool val)
{
    m_isAtStay = val;
}

bool CharmInfo::IsAtStay()
{
    return m_isAtStay;
}

void CharmInfo::SetIsFollowing(bool val)
{
    m_isFollowing = val;
}

bool CharmInfo::IsFollowing()
{
    return m_isFollowing;
}

void CharmInfo::SetIsReturning(bool val)
{
    m_isReturning = val;
}

bool CharmInfo::IsReturning()
{
    return m_isReturning;
}

void Unit::HandlePetCommand(CommandStates command, Unit* pTarget)
{
    Creature* pCharmedCreature = ToCreature();

    CharmInfo* charmInfo = GetCharmInfo();
    if (!charmInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandlePetCommand - %s doesn't have a charminfo!", GetGuidStr().c_str());
        return;
    }

    Unit* pCharmer = GetCharmerOrOwner();
    if (!pCharmer)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandlePetCommand - %s doesn't have a charmer or owner!", GetGuidStr().c_str());
        return;
    }

    switch (command)
    {
        case COMMAND_STAY:
            if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED))
            {
                StopMoving();
                GetMotionMaster()->Clear(false);
                GetMotionMaster()->MoveIdle();
                charmInfo->SetIsAtStay(true);
            }
            charmInfo->SetCommandState(COMMAND_STAY);

            charmInfo->SetIsCommandAttack(false);
            charmInfo->SetIsCommandFollow(false);
            charmInfo->SetIsFollowing(false);
            charmInfo->SetIsReturning(false);
            charmInfo->SaveStayPosition();
            break;
        case COMMAND_FOLLOW:
            if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED))
            {
                AttackStop();
                InterruptNonMeleeSpells(false);
                GetMotionMaster()->MoveFollow(pCharmer, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
            }
            charmInfo->SetCommandState(COMMAND_FOLLOW);

            charmInfo->SetIsCommandAttack(false);
            charmInfo->SetIsAtStay(false);
            charmInfo->SetIsReturning(true);
            charmInfo->SetIsCommandFollow(true);
            charmInfo->SetIsFollowing(false);
            break;
        case COMMAND_ATTACK:
        {
            if (!pTarget)
            {
                SendPetActionFeedback(FEEDBACK_NOTHING_TO_ATT);
                return;
            }

            if (!pCharmer->IsValidAttackTarget(pTarget) || pCharmer->HasAuraType(SPELL_AURA_MOD_PACIFY))
            {
                SendPetActionFeedback(FEEDBACK_CANT_ATT_TARGET);
                return;
            }

            if (GetTransport() != pTarget->GetTransport())
            {
                SendPetActionFeedback(FEEDBACK_NO_PATH_TO);
                return;
            }

            ClearUnitState(UNIT_STAT_FOLLOW);
            // This is true if pet has no target or has target but targets differs.
            if (GetVictim() != pTarget || (GetVictim() == pTarget && !GetCharmInfo()->IsCommandAttack()) || HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_POSSESSED))
            {
                if (GetVictim())
                    AttackStop();

                if (pCharmedCreature)
                {
                    charmInfo->SetIsCommandAttack(true);
                    charmInfo->SetIsAtStay(false);
                    charmInfo->SetIsFollowing(false);
                    charmInfo->SetIsCommandFollow(false);
                    charmInfo->SetIsReturning(false);

                    pCharmedCreature->AI()->AttackStart(pTarget);

                    //10% chance to play special pet attack talk, else growl
                    if (pCharmedCreature->IsPet() && ((Pet*)this)->getPetType() == SUMMON_PET && this != pTarget && urand(0, 100) < 10)
                        SendPetTalk((uint32)PET_TALK_ATTACK);
                    else
                    {
                        // 90% chance for pet and 100% chance for charmed creature
                        SendPetAIReaction();
                    }
                }
                else                                // charmed player
                {
                    if (GetVictim() && GetVictim() != pTarget)
                        AttackStop();

                    charmInfo->SetIsCommandAttack(true);
                    charmInfo->SetIsAtStay(false);
                    charmInfo->SetIsFollowing(false);
                    charmInfo->SetIsCommandFollow(false);
                    charmInfo->SetIsReturning(false);

                    Attack(pTarget, true);
                    SendPetAIReaction();
                    GetMotionMaster()->MoveChase(pTarget);
                }
            }
            break;
        }
        case COMMAND_DISMISS:                       // pet dismiss (summoned pet)
        {
            if (Pet* pPet = ToPet())
            {
                // Hunter pets are dismissed with a spell with a cast time
                if (pPet->getPetType() != HUNTER_PET)
                    // dismissing a summoned pet is like killing them (this prevents returning a soulshard...)
                    pPet->Unsummon(PET_SAVE_NOT_IN_SLOT);
            }
            else                                    // charmed
                pCharmer->Uncharm();
            break;
        }  
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::HandlePetCommand - Unknown command state %u.", uint32(command));
    }
}

uint32 CreateProcExtendMask(SpellNonMeleeDamage* damageInfo, SpellMissInfo missCondition)
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
            if (damageInfo)
            {
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
            }
            break;
    }
    return procEx;
}

void Unit::ProcSkillsAndReactives(bool isVictim, Unit* pTarget, uint32 procFlag, uint32 procExtra, WeaponAttackType attType, SpellEntry const* procSpell)
{
    // For melee/ranged based attack need update skills and set some Aura states
    if (procFlag & MELEE_BASED_TRIGGER_MASK && pTarget)
    {
        // Update skills here for players
        // Bloodthirst and Hammer of Wrath do not increase weapon skills
        if (IsPlayer() && (!procSpell || procSpell->EquippedItemClass == ITEM_CLASS_WEAPON))
        {
            // On melee based hit/miss/resist/parry/dodge/block need update skill
            if (procExtra & (PROC_EX_NORMAL_HIT | PROC_EX_CRITICAL_HIT | PROC_EX_MISS | PROC_EX_DODGE | PROC_EX_PARRY | PROC_EX_BLOCK | PROC_EX_RESIST))
                ((Player*)this)->UpdateCombatSkills(pTarget, attType, isVictim); // (isVictim -> defence, !isVictim -> weapon)
        }
        // If exist crit/parry/dodge/block need update aura state (for victim and attacker)
        if (procExtra & (PROC_EX_CRITICAL_HIT | PROC_EX_PARRY | PROC_EX_DODGE | PROC_EX_BLOCK))
        {
            // for victim
            if (isVictim)
            {
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
                // if victim and got critted
                if (procExtra & PROC_EX_CRITICAL_HIT)
                {
                    ModifyAuraState(AURA_STATE_BERSERKING, true);
                    StartReactiveTimer(REACTIVE_CRIT, GetObjectGuid());
                }
#endif
                // if victim and dodged attack
                if (procExtra & PROC_EX_DODGE)
                {
                    //Update AURA_STATE on dodge
                    if (GetClass() != CLASS_ROGUE) // skip Rogue Riposte
                    {
                        ModifyAuraState(AURA_STATE_DEFENSE, true);
                        StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                    }
                }
                // if victim and parried attack
                if (procExtra & PROC_EX_PARRY)
                {
                    // For Hunters only Counterattack (skip Mongoose bite)
                    if (GetClass() == CLASS_HUNTER)
                    {
                        ModifyAuraState(AURA_STATE_HUNTER_PARRY, true);
                        StartReactiveTimer(REACTIVE_HUNTER_PARRY, pTarget->GetObjectGuid());

                        if (Player* me = ToPlayer())
                            me->AddComboPoints(pTarget, 1);
                    }

                    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
                    // - Riposte - Fixed a bug where the ability was not usable when a special
                    //   attack(e.g.Gouge) is parried.
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
                    else
#else
                    else if (!(GetClass() == CLASS_ROGUE && procSpell))
#endif
                    {
                        ModifyAuraState(AURA_STATE_DEFENSE, true);
                        StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                    }
                }
                // if victim and blocked attack
                if (procExtra & PROC_EX_BLOCK)
                {
                    ModifyAuraState(AURA_STATE_DEFENSE, true);
                    StartReactiveTimer(REACTIVE_DEFENSE, pTarget->GetObjectGuid());
                }
            }
            else //For attacker
            {
                // Overpower on victim dodge
                if (procExtra & PROC_EX_DODGE && IsPlayer() && GetClass() == CLASS_WARRIOR)
                {
                    static_cast<Player*>(this)->AddComboPoints(pTarget, 1);
                    StartReactiveTimer(REACTIVE_OVERPOWER, pTarget->GetObjectGuid());
                }
            }
        }
    }
}

void Unit::ProcDamageAndSpellFor(bool isVictim, Unit* pTarget, ProcSystemArguments const& data, ProcTriggeredList& triggeredList, ProcessProcsAuraType processAurasType)
{
    // Fill triggeredList list
    for (const auto& itr : GetSpellAuraHolderMap())
    {
        // Can not proc on self.
        if (data.procSpell && data.procSpell->Id == itr.first)
            continue;

        // skip deleted auras (possible at recursive triggered call
        if (itr.second->IsDeleted())
            continue;

        // These spell auras should proc instantly (not delayed by batching).
        // We have to call ProcDamageAndSpellFor twice because of them.
        if (!isVictim)
        {
            switch (processAurasType)
            {
                case PROC_PROCESS_INSTANT:
                {
                    if (!itr.second->GetSpellProto()->HasAttribute(SPELL_ATTR_EX3_INSTANT_TARGET_PROCS))
                        continue;
                    break;
                }
                case PROC_PROCESS_DELAYED:
                {
                    if (itr.second->GetSpellProto()->HasAttribute(SPELL_ATTR_EX3_INSTANT_TARGET_PROCS))
                        continue;
                    break;
                }
            }
        }

        // don't reroll chance for each target in this case
        if (itr.second->GetSpellProto()->HasAttribute(SPELL_ATTR_EX2_PROC_COOLDOWN_ON_FAILURE) &&
           !IsSpellReady(itr.second->GetId()))
            continue;

        // prevent delayed procs from removing auras applied after the proc happened
        // fixes Frostbite being removed by the Frostbolt that applied it
        if (isVictim && itr.second->GetAuraApplyTime() >= data.procTime && pTarget->GetObjectGuid() == itr.second->GetCasterGuid())
            continue;

        // Aura that applies a modifier with charges. Gere? otherwise.
        bool hasmodifier = false;
        for (int i = 0; i < 3; ++i)
        {
            if (itr.second->GetAuraByEffectIndex(SpellEffectIndex(i)))
            {
                if (SpellModifier* auraMod = itr.second->GetAuraByEffectIndex(SpellEffectIndex(i))->GetSpellModifier())
                {
                    if (auraMod->charges > 0 || (std::find(data.appliedSpellModifiers.begin(), data.appliedSpellModifiers.end(), auraMod) != data.appliedSpellModifiers.end()))
                    {
                        hasmodifier = true;
                        break;
                    }
                }
            }
        }
        if (hasmodifier)
            continue;

        uint32 procFlag = isVictim ? data.procFlagsVictim : data.procFlagsAttacker;

        SpellProcEventEntry const* spellProcEvent = nullptr;
        // http://blue.cardplace.com/cache/wow-paladin/1069149.htm
        // "Charges will not generate off auto attacks or npc attacks by trying"
        // "to sit down and force a crit. However, ability crits from physical"
        // "abilities such as Sinister Strike, Hamstring, Auto-shot, Aimed shot,"
        // "etc will generate a charge if you're sitting."
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
        auto result = IsTriggeredAtSpellProcEvent(pTarget, itr.second, data.procSpell, procFlag, isVictim && !data.procSpell && !data.pVictim->IsStandingUp() ? data.procExtra & ~PROC_EX_CRITICAL_HIT : data.procExtra, data.attType, isVictim, spellProcEvent, data.isSpellTriggeredByAuraOrItem);
#else
        auto result = IsTriggeredAtSpellProcEvent(pTarget, itr.second, data.procSpell, procFlag, data.procExtra, data.attType, isVictim, spellProcEvent, data.isSpellTriggeredByAuraOrItem);
#endif
        if (result != SPELL_PROC_TRIGGER_OK)
        {
            if (result == SPELL_PROC_TRIGGER_ROLL_FAILED &&
                itr.second->GetSpellProto()->HasAttribute(SPELL_ATTR_EX2_PROC_COOLDOWN_ON_FAILURE) &&
                spellProcEvent && spellProcEvent->cooldown)
                AddCooldown(*itr.second->GetSpellProto(), nullptr, false, spellProcEvent->cooldown);

            continue;
        }

        itr.second->SetInUse(true);                        // prevent holder deletion
        triggeredList.push_back(ProcTriggeredData(spellProcEvent, itr.second, pTarget, procFlag));
    }
}

Player* Unit::GetSpellModOwner() const
{
    if (Player const* pPlayer = ToPlayer())
        return const_cast<Player*>(pPlayer);

    if (Creature const* pCreature = ToCreature())
    {
        if (pCreature->IsPet() || pCreature->IsTotem())
        {
            if (Player* pOwner = ::ToPlayer(GetOwner()))
                return pOwner;
        }
    }

    return nullptr;
}

// ----------Pet responses methods-----------------
void Unit::SendPetCastFail(uint32 spellid, SpellCastResult msg)
{
    if (msg == SPELL_CAST_OK)
        return;

    if (Player* pOwner = ::ToPlayer(GetCharmerOrOwner()))
    {
        WorldPacket data(SMSG_PET_CAST_FAILED, 4 + 1 + 1);
        data << uint32(spellid);
        data << uint8(2); // 1.12: for SMSG_CAST_RESULT probably 2 = failure, 0 = success.
        data << uint8(msg);
        pOwner->GetSession()->SendPacket(&data);
    }
}

void Unit::SendPetActionFeedback(uint8 msg)
{
    if (Player* pOwner = ::ToPlayer(GetOwner()))
    {
        WorldPacket data(SMSG_PET_ACTION_FEEDBACK, 1);
        data << uint8(msg);
        pOwner->GetSession()->SendPacket(&data);
    }
}

void Unit::SendPetTalk(uint32 pettalk)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    if (Player* pOwner = ::ToPlayer(GetOwner()))
    {
        WorldPacket data(SMSG_PET_ACTION_SOUND, 8 + 4);
        data << GetObjectGuid();
        data << uint32(pettalk);
        pOwner->GetSession()->SendPacket(&data);
    }
#endif
}

void Unit::SendPetAIReaction()
{
    if (Player* pOwner = ::ToPlayer(GetOwner()))
    {
        WorldPacket data(SMSG_AI_REACTION, 8 + 4);
        data << GetObjectGuid();
        data << uint32(AI_REACTION_HOSTILE);
        pOwner->GetSession()->SendPacket(&data);
    }
}

// ----------End of Pet responses methods----------

void Unit::StopMoving(bool force)
{
    if (!force && movespline->IsUninterruptible())
        return;

    if (!IsMovedByPlayer() || !IsInWorld() || force)
    {
        ClearUnitState(UNIT_STAT_MOVING);
        RemoveUnitMovementFlag(MOVEFLAG_MASK_MOVING);
    }

    // not need send any packets if not in world
    if (!IsInWorld())
        return;

    if (!movespline->Finalized() || force)
    {
        Movement::MoveSplineInit init(*this, "StopMoving");
        if (GenericTransport* t = GetTransport())
            init.SetTransport(t->GetGUIDLow());
        init.SetStop(); // Will trigger CMSG_MOVE_SPLINE_DONE from client.
        init.Launch();

        DisableSpline();
    }
}

void Unit::SetFleeing(bool apply, ObjectGuid casterGuid, uint32 spellId, uint32 time)
{
    if (apply && HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    ModConfuseSpell(apply, casterGuid, spellId, MOV_MOD_FLEE_FOR_ASSISTANCE, time);
}

void Unit::SetFeared(bool apply, ObjectGuid casterGuid, uint32 spellId, uint32 time)
{
    if (apply && HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
        return;

    ModConfuseSpell(apply, casterGuid, spellId, MOV_MOD_FLEE_IN_FEAR, time);
}

void Unit::SetConfused(bool apply, ObjectGuid casterGuid, uint32 spellId)
{
    ModConfuseSpell(apply, casterGuid, spellId, MOV_MOD_CONFUSED, 0);
}

void Unit::ModConfuseSpell(bool apply, ObjectGuid casterGuid, uint32 spellId, MovementModType modType, uint32 time)
{
    if (Creature* pCreature = ToCreature())
        if (pCreature->IsTotem())
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

    m_movementInfo.ctime = 0;
    m_movementInfo.RemoveMovementFlag(MOVEFLAG_MASK_MOVING_OR_TURN);

    if (apply)
    {
        if (casterGuid != GetObjectGuid())
            InterruptNonMeleeSpells(false);

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

        if (IsCreature())
            SetTargetGuid(ObjectGuid());
        else if (ObjectGuid lootGuid = static_cast<Player*>(this)->GetLootGuid())
            static_cast<Player*>(this)->GetSession()->DoLootRelease(lootGuid);
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
            {
                if (!HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED))
                    GetMotionMaster()->ClearType(CONFUSED_MOTION_TYPE);
                break;
            }
        }

        // If spellId = 0, it is to interrupt (eg Curse of Recklessness - 704)
        // So we remove the effects even if we still have an aura of fear.
        if (!controlFinished && spellId)
            return;

        if (!IsPlayer() && IsAlive())
        {
            Unit* caster = IsInWorld() ? GetMap()->GetUnit(casterGuid) : nullptr;
            if (caster)
                AttackedBy(caster);

            // restore appropriate movement generator
            if (IsPet() && GetOwnerGuid().IsPlayer())
            {
                AttackStop();
                return;
            }
            else if (!SelectHostileTarget())
                return;

            if (GetVictim())
                SetTargetGuid(GetVictim()->GetObjectGuid());

            RestoreMovement();
        }
    }
}

void Unit::SetFeignDeath(bool apply, ObjectGuid casterGuid, bool success)
{
    if (apply)
    {
        m_movementInfo.ctime = 0;
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_MASK_MOVING_OR_TURN);
        if (!IsPlayer())
            StopMoving();

        if (!success)
        {
            if (Player* plr = ToPlayer())
            {
                plr->SendFeignDeathResisted();
                plr->SendAttackSwingCancelAttack();
            }
        }
        else
        {
            InterruptSpellsCastedOnMe();

            AddUnitState(UNIT_STAT_FEIGN_DEATH);
            CombatStop();
            RemoveAurasWithInterruptFlags(AURA_INTERRUPT_STEALTH_INVIS_CANCELS);

            GetHostileRefManager().deleteReferences();

            // you should remain in combat with pet's victim
            if (Pet* pPet = GetPet())
            { 
                if (pPet->IsInCombat() && pPet->GetVictim())
                    SetInCombatWithVictim(pPet->GetVictim(), false, 6000);
            }
        }

        SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

        // prevent interrupt message
        if (casterGuid == GetObjectGuid())
            FinishSpell(CURRENT_GENERIC_SPELL, false);
        InterruptNonMeleeSpells(true);
    }
    else
    {
        RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

        ClearUnitState(UNIT_STAT_FEIGN_DEATH);

        RestoreMovement();
    }
}

bool Unit::IsSittingDown() const
{
    switch (GetStandState())
    {
        case UNIT_STAND_STATE_SIT:
        case UNIT_STAND_STATE_SIT_CHAIR:
        case UNIT_STAND_STATE_SIT_LOW_CHAIR:
        case UNIT_STAND_STATE_SIT_MEDIUM_CHAIR:
        case UNIT_STAND_STATE_SIT_HIGH_CHAIR:
            return true;
    }

    return false;
}

bool Unit::IsStandingUp() const
{
    uint8 s = GetStandState();
    return (s == UNIT_STAND_STATE_STAND) || (s == UNIT_STAND_STATE_DEAD);
}

void Unit::SetStandState(uint8 state)
{
    if (GetByteValue(UNIT_FIELD_BYTES_1, UNIT_BYTES_1_OFFSET_STAND_STATE) == state)
        return;

    SetByteValue(UNIT_FIELD_BYTES_1, UNIT_BYTES_1_OFFSET_STAND_STATE, state);

    if (IsStandingUp())
        RemoveAurasWithInterruptFlags(AURA_INTERRUPT_STANDING_CANCELS);

    if (IsPlayer())
    {
        WorldPacket data(SMSG_STANDSTATE_UPDATE, 1);
        data << (uint8)state;
        ((Player*)this)->GetSession()->SendPacket(&data);
        ((Player*)this)->ClearScheduledStandUp();
    }
}

bool Unit::IsPolymorphed() const
{
    return Spells::GetSpellSpecific(GetTransForm()) == SPELL_MAGE_POLYMORPH;
}

bool Unit::IsAttackReady(WeaponAttackType type) const
{
    return m_attackTimer[type] == 0;
}

void Unit::SetDisplayId(uint32 displayId)
{
    SetUInt32Value(UNIT_FIELD_DISPLAYID, displayId);

    UpdateModelData();

    if (Pet* pPet = ToPet())
        if (pPet->isControlled())
            if (Player* pOwner = ::ToPlayer(GetOwner()))
                if (pOwner->GetGroup())
                    pOwner->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_MODEL_ID);
}

inline float CheckValidScale(float scale)
{
    if (scale <= 0.0f)
        return DEFAULT_OBJECT_SCALE;

    return scale;
}

float Unit::GetScaleForDisplayId(uint32 displayId)
{
    if (CreatureDisplayInfoEntry const* displayEntry = sCreatureDisplayInfoStore.LookupEntry(displayId))
    {
        if (CreatureModelDataEntry const* modelEntry = sCreatureModelDataStore.LookupEntry(displayEntry->ModelId))
            return CheckValidScale(modelEntry->modelScale * displayEntry->scale);

        return CheckValidScale(displayEntry->scale);
    }

    return DEFAULT_OBJECT_SCALE;
}

void Unit::UpdateModelData()
{
    CreatureDisplayInfoEntry const* displayEntry = sCreatureDisplayInfoStore.LookupEntry(GetDisplayId());
    CreatureDisplayInfoAddon const* displayAddon = sObjectMgr.GetCreatureDisplayInfoAddon(GetDisplayId());
    if (displayAddon && displayEntry && displayAddon->bounding_radius)
    {
        CreatureModelDataEntry const* modelEntry = sCreatureModelDataStore.LookupEntry(displayEntry->ModelId);

        // Tauren and gnome players have scale != 1.0
        float const nativeScale = CheckValidScale(modelEntry ? (modelEntry->modelScale * displayEntry->scale) : displayEntry->scale);

        // we expect values in database to be relative to scale = 1.0
        SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, (GetObjectScale() / nativeScale) * displayAddon->bounding_radius);
        SetFloatValue(UNIT_FIELD_COMBATREACH, (GetObjectScale() / nativeScale) * displayAddon->combat_reach);

        if (modelEntry)
        {
            if (modelEntry->collisionHeight > 0.f && modelEntry->modelScale > 0.f)
                m_modelCollisionHeight = modelEntry->collisionHeight / modelEntry->modelScale;
            else
                m_modelCollisionHeight = 2.f;

            m_modelCollisionHeight *= (GetObjectScale() / nativeScale);
        }
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unit::UpdateModelData - %s has missing or bad info for display id %u", GetGuidStr().c_str(), GetDisplayId());
        SetFloatValue(UNIT_FIELD_COMBATREACH, 1.5f);
        SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 1.5f);
    }
}

void Unit::InitPlayerDisplayIds()
{
    PlayerInfo const* info = sObjectMgr.GetPlayerInfo(GetRace(), GetClass());
    if (!info)
        return;

    uint32 const displayId = GetGender() == GENDER_FEMALE ? info->displayId_f : info->displayId_m;

    SetObjectScale(GetScaleForDisplayId(displayId));
    SetNativeDisplayId(displayId);
    SetDisplayId(displayId);
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

#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
    if (HasAuraState(AURA_STATE_BERSERKING))
        ModifyAuraState(AURA_STATE_BERSERKING, false);
#endif

    if (HasAuraState(AURA_STATE_DEFENSE))
        ModifyAuraState(AURA_STATE_DEFENSE, false);
    if (GetClass() == CLASS_HUNTER && HasAuraState(AURA_STATE_HUNTER_PARRY))
        ModifyAuraState(AURA_STATE_HUNTER_PARRY, false);

    if (GetClass() == CLASS_WARRIOR && IsPlayer())
        static_cast<Player*>(this)->ClearComboPoints();
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
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_8_4
                case REACTIVE_CRIT:
                    if (HasAuraState(AURA_STATE_BERSERKING))
                        ModifyAuraState(AURA_STATE_BERSERKING, false);
                    break;
#endif
                case REACTIVE_DEFENSE:
                    if (HasAuraState(AURA_STATE_DEFENSE))
                        ModifyAuraState(AURA_STATE_DEFENSE, false);
                    break;
                case REACTIVE_HUNTER_PARRY:
                    if (GetClass() == CLASS_HUNTER && HasAuraState(AURA_STATE_HUNTER_PARRY))
                        ModifyAuraState(AURA_STATE_HUNTER_PARRY, false);
                    break;
                case REACTIVE_OVERPOWER:
                    if (GetClass() == CLASS_WARRIOR && IsPlayer())
                        static_cast<Player*>(this)->ClearComboPoints();
                    break;
                default:
                    break;
            }
        }
        else
            m_reactiveTimer[reactive] -= p_time;
    }
}

uint8 Unit::GetEnemyCountInRadiusAround(Unit const* pTarget, float radius) const
{
    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(pTarget, this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(pTarget, searcher, radius);
    return targets.size();
}

void Unit::GetEnemyListInRadiusAround(Unit const* pTarget, float radius, std::list<Unit*>& targets) const
{
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(pTarget, this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(pTarget, searcher, radius);
}

Unit* Unit::SelectRandomUnfriendlyTarget(Unit const* except /*= nullptr*/, float radius /*= ATTACK_DISTANCE*/, bool inFront /*= false*/, bool isValidAttackTarget /*= false*/, bool notPvpEnabling /*= false*/) const
{
    std::list<Unit*> targets;

    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, radius);

    // remove current target
    if (except)
        targets.remove(const_cast<Unit*>(except));

    // remove not LoS targets
    for (std::list<Unit*>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if ((!IsWithinLOSInMap(*tIter)) ||
           (inFront && !this->HasInArc(*tIter, M_PI_F / 2)) ||
           (isValidAttackTarget && !IsValidAttackTarget(*tIter)) ||
           (notPvpEnabling && !CanAttackWithoutEnablingPvP(*tIter)))
        {
            std::list<Unit*>::iterator tIter2 = tIter;
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
    std::list<Unit*>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

Unit* Unit::SelectRandomFriendlyTarget(Unit const* except /*= nullptr*/, float radius /*= ATTACK_DISTANCE*/, bool inCombat) const
{
    std::list<Unit*> targets;

    MaNGOS::AnyFriendlyUnitInObjectRangeCheck u_check(this, radius);
    MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck> searcher(targets, u_check);

    Cell::VisitAllObjects(this, searcher, radius);

    // remove current target
    if (except)
        targets.remove(const_cast<Unit*>(except));

    // remove not LoS targets
    for (std::list<Unit*>::iterator tIter = targets.begin(); tIter != targets.end();)
    {
        if (!IsWithinLOSInMap(*tIter) || (inCombat && !(*tIter)->IsInCombat()) || (*tIter)->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
        {
            std::list<Unit*>::iterator tIter2 = tIter;
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
    std::list<Unit*>::const_iterator tcIter = targets.begin();
    for (uint32 i = 0; i < rIdx; ++i)
        ++tcIter;

    return *tcIter;
}

// Returns friendly unit with the most amount of hp missing from max hp
Unit* Unit::FindLowestHpFriendlyUnit(float fRange, uint32 uiMinHPDiff, bool bPercent, Unit* except) const
{
    std::list<Unit*> targets;

    if (Unit* pVictim = GetVictim())
    {
        HostileReference* pReference = pVictim->GetHostileRefManager().getFirst();

        while (pReference)
        {
            if (Unit* pTarget = pReference->getSourceUnit())
            {
                if (pTarget->IsAlive() && IsFriendlyTo(pTarget) && IsWithinDistInMap(pTarget, fRange) && !pTarget->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE) &&
                    ((bPercent && (100 - pTarget->GetHealthPercent() > uiMinHPDiff)) || (!bPercent && (pTarget->GetMaxHealth() - pTarget->GetHealth() > uiMinHPDiff))))
                {
                    targets.push_back(pTarget);
                }
            }
            pReference = pReference->next();
        }
    }
    else
    {
        MaNGOS::MostHPMissingInRangeCheck u_check(this, fRange, uiMinHPDiff, bPercent);
        MaNGOS::UnitListSearcher<MaNGOS::MostHPMissingInRangeCheck> searcher(targets, u_check);

        Cell::VisitAllObjects(this, searcher, fRange);
    }

    // remove current target
    if (except)
        targets.remove(except);

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    return *targets.begin();
}

// Returns friendly unit that does not have an aura from the provided spellid
Unit* Unit::FindFriendlyUnitMissingBuff(float range, uint32 spellid, Unit const* except) const
{
    std::list<Unit*> targets;

    MaNGOS::FriendlyMissingBuffInRangeCheck u_check(this, range, spellid);
    MaNGOS::UnitListSearcher<MaNGOS::FriendlyMissingBuffInRangeCheck> searcher(targets, u_check);

    Cell::VisitGridObjects(this, searcher, range);

    // remove current target
    if (except)
        targets.remove(const_cast<Unit*>(except));

    // no appropriate targets
    if (targets.empty())
        return nullptr;

    return *targets.begin();
}

// Returns friendly unit that is under a crowd control effect
Unit* Unit::FindFriendlyUnitCC(float range) const
{
    Unit* pUnit = nullptr;

    MaNGOS::FriendlyCCedInRangeCheck u_check(this, range);
    MaNGOS::UnitSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(pUnit, u_check);

    Cell::VisitGridObjects(this, searcher, range);

    return pUnit;
}

bool Unit::IsSecondaryThreatTarget() const
{
    // Targets with Fear / Confuse / breakable CC
    for (const auto& iter : m_spellAuraHolders)
    {
        if (iter.second->IsTargetSecondaryThreatFocus())
            return true;
    }

    // Totems have secondary threat priority
    if (Creature const* pCreature = ToCreature())
    {
        if (Totem const* pTotem = pCreature->ToTotem())
        {
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(pTotem->GetSpell());
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
#if SUPPORTED_CLIENT_BUILD < CLIENT_BUILD_1_12_1
        val = -val;
        apply = !apply;
#endif
        ApplyPercentModFloatVar(m_modAttackSpeedPct[att], -val, apply);
        ApplyPercentModFloatValue(UNIT_FIELD_BASEATTACKTIME + att, -val, apply);

        if (recalcDamage)
            ApplyPercentModFloatVar(m_modRecalcDamagePct[att], val, apply);
    }
}

void Unit::ApplyCastTimePercentMod(float val, bool apply)
{
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    if (val > 0)
        SetFloatValue(UNIT_MOD_CAST_SPEED, GetFloatValue(UNIT_MOD_CAST_SPEED) * (apply ? 100.0f / (100.0f + val) : (100.0f + val) / 100.0f));
    else
        SetFloatValue(UNIT_MOD_CAST_SPEED, GetFloatValue(UNIT_MOD_CAST_SPEED) * (apply ? (100.0f - val) / 100.0f : 100.0f / (100.0f - val)));
#else
    int32 intval = round(val);
    SetInt32Value(UNIT_MOD_CAST_SPEED, (GetInt32Value(UNIT_MOD_CAST_SPEED) + (apply ? -intval : intval)));
#endif
}

void Unit::UpdateAuraForGroup(uint8 slot)
{
    if (Player* pPlayer = ToPlayer())
    {
        if (pPlayer->GetGroup())
        {
            pPlayer->SetGroupUpdateFlag(slot < MAX_POSITIVE_AURAS ? GROUP_UPDATE_FLAG_AURAS : GROUP_UPDATE_FLAG_AURAS_NEGATIVE);
            pPlayer->SetAuraUpdateSlot(slot);
        }
    }
    else if (Pet* pPet = ToPet())
    {
        if (pPet->isControlled())
        {
            if (Player* pOwner = ::ToPlayer(GetOwner()))
            {
                if (pOwner->GetGroup())
                {
                    pOwner->SetGroupUpdateFlag(slot < MAX_POSITIVE_AURAS ? GROUP_UPDATE_FLAG_PET_AURAS : GROUP_UPDATE_FLAG_PET_AURAS_NEGATIVE);
                    pPet->SetAuraUpdateSlot(slot);
                }
            }
        }
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
        SpellEntry const* spell = iter->second->GetSpellProto();
        if (spell->Id == exceptSpellId)
            ++iter;
        else if (non_positive && iter->second->IsPositive())
            ++iter;
        else if (spell->Attributes & SPELL_ATTR_NO_IMMUNITIES)
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

bool Unit::NearTeleportTo(float x, float y, float z, float orientation, uint32 teleportOptions)
{
    DisableSpline();

    if (IsPlayer())
        return ((Player*)this)->TeleportTo(GetMapId(), x, y, z, orientation, teleportOptions);

    Creature* c = (Creature*)this;
    // Creature relocation acts like instant movement generator, so current generator expects interrupt/reset calls to react properly
    if (!c->GetMotionMaster()->empty())
        if (MovementGenerator* movgen = c->GetMotionMaster()->top())
            movgen->Interrupt(*c);

    MovementPacketSender::SendTeleportToObservers(this, x, y, z, orientation);
    GetMap()->CreatureRelocation((Creature*)this, x, y, z, orientation);
    MovementPacketSender::SendTeleportToObservers(this, x, y, z, orientation);

    // finished relocation, movegen can different from top before creature relocation,
    // but apply Reset expected to be safe in any case
    if (!c->GetMotionMaster()->empty())
        if (MovementGenerator* movgen = c->GetMotionMaster()->top())
            movgen->Reset(*c);

    return true;
}

void Unit::NearLandTo(float x, float y, float z, float orientation)
{
    m_movementInfo.RemoveMovementFlag(MOVEFLAG_JUMPING | MOVEFLAG_FALLINGFAR);
    m_movementInfo.ChangePosition(x, y, z, orientation);
    m_movementInfo.SetAsServerSide();

    WorldPacket data(MSG_MOVE_FALL_LAND, 41);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GetPackGUID();
#else
    data << GetGUID();
#endif
    data << m_movementInfo;
    SendMovementMessageToSet(std::move(data), true);
    TeleportPositionRelocation(x, y, z, orientation);
    DisableSpline();
}

void Unit::TeleportPositionRelocation(float x, float y, float z, float orientation)
{
    Player* player = ToPlayer();
    Creature* crea = ToCreature();
    uint32 oldZone = 0;
    uint32 oldArea = 0;
    if (player)
    {
        oldZone = player->GetCachedZoneId();
        oldArea = player->GetCachedAreaId();
        player->SetPosition(x, y, z, orientation, true);
        player->m_movementInfo.ChangePosition(x, y, z, orientation);
    }
    else if (crea)
    {
        if (!crea->GetMotionMaster()->empty())
            if (MovementGenerator* movgen = crea->GetMotionMaster()->top())
                movgen->Interrupt(*crea);
        GetMap()->CreatureRelocation(crea, x, y, z, orientation);
    }

    // new zone
    if (player)
    {
        uint32 newZone, newArea;
        GetZoneAndAreaId(newZone, newArea);
        if (oldZone != newZone)
            player->UpdateZone(newZone, newArea);
        else if (oldArea != newArea)
            player->UpdateArea(newArea);
        // honorless target
        if (!player->pvpInfo.inPvPEnforcedArea)
            player->RemoveDelayedOperation(DELAYED_CAST_HONORLESS_TARGET);
    }
    else if (crea)
    {
        if (!crea->GetMotionMaster()->empty())
            if (MovementGenerator* movgen = crea->GetMotionMaster()->top())
                movgen->Reset(*crea);
    }
}

void Unit::MonsterMoveWithSpeed(float x, float y, float z, float o, float speed, uint32 options)
{
    Movement::MoveSplineInit init(*this, "MonsterMoveWithSpeed");
    init.MoveTo(x, y, z, options);
    if (options & MOVE_WALK_MODE)
        init.SetWalk(true);
    if (options & MOVE_RUN_MODE)
        init.SetWalk(false);
    if (options & MOVE_FLY_MODE)
        init.SetFly();
    if (options & MOVE_FALLING)
        init.SetFall();
    if (options & MOVE_CYCLIC)
        init.SetCyclic();
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

    if (Player* pPlayer = ToPlayer())
        if (pPlayer->GetGroup())
            pPlayer->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_STATUS);

    CallForAllControlledUnits(SetPvPHelper(state), CONTROLLED_PET | CONTROLLED_TOTEMS | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

void Unit::KnockBackFrom(WorldObject const* target, float horizontalSpeed, float verticalSpeed)
{
    if (HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT))
        return;

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
    if (HasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_ROOT) || !movespline->Finalized())
        return;

    InterruptNonMeleeSpells(false);

    // Effect properly implemented only for players
    if (IsMovedByPlayer() && IsInWorld())
    {
        float vsin = sin(angle);
        float vcos = cos(angle);
        MovementPacketSender::SendKnockBackToController(this, vcos, vsin, horizontalSpeed, -verticalSpeed); // !! notice the - sign in front of speedZ !!

        SetJumpInitialSpeed(verticalSpeed);

        if (Player* pPlayer = ToPlayer())
            GetPlayerMovingMe()->GetCheatData()->OnKnockBack(pPlayer, horizontalSpeed, verticalSpeed, vcos, vsin);
    }
}

bool Unit::IsPvPContested() const
{
    if (Player const* thisPlayer = GetCharmerOrOwnerPlayerOrPlayerItself())
        return thisPlayer->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP);
    return false;
}

void Unit::SetPvPContested(bool state)
{
    if (IsPlayer())
    {
        if (state)
            SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP);
        else
            RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_CONTESTED_PVP);
    }
}

bool Unit::CanAttackWithoutEnablingPvP(Unit const* pTarget) const
{
    if (Player* attackedPlayer = pTarget->GetCharmerOrOwnerPlayerOrPlayerItself())
        if (Player* casterPlayer = GetCharmerOrOwnerPlayerOrPlayerItself())
            if (!casterPlayer->IsPvP() && !(casterPlayer->IsFFAPvP() && attackedPlayer->IsFFAPvP()) && !casterPlayer->IsInDuelWith(attackedPlayer))
                return false;

    return true;
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
    if (Unit* pVictim = GetVictim())
    {
        if (pVictim->GetFactionId() == faction_id)
        {
            AttackStop();
            if (IsNonMeleeSpellCasted(false))
                InterruptNonMeleeSpells(false);

            // melee and ranged forced attack cancel
            if (Player* pPlayer = ToPlayer())
                pPlayer->SendAttackSwingCancelAttack();
        }
    }

    AttackerSet const& attackers = GetAttackers();
    for (AttackerSet::const_iterator itr = attackers.begin(); itr != attackers.end();)
    {
        if ((*itr)->GetFactionId() == faction_id)
        {
            (*itr)->AttackStop();
            itr = attackers.begin();
        }
        else
            ++itr;
    }

    GetHostileRefManager().deleteReferencesForFaction(faction_id);

    CallForAllControlledUnits(StopAttackFactionHelper(faction_id), CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
}

void Unit::CleanupDeletedAuras()
{
    for (auto& iter : m_deletedHolders)
    {
        if (iter->IsInUse())
        {
            // Use case:
            // - Spell damage
            // - Player::SetDeathState
            // - Pet::AddObjectToRemoveList
            // Seen happening with spells like [Health Funnel], [Tainted Blood]
            ACE_Stack_Trace st;
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[Crash/Auras] Deleting aura holder %u in use (%s)", iter->GetId(), GetObjectGuid().GetString().c_str());
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s", st.c_str());
        }
        else
            delete iter;
    }
    m_deletedHolders.clear();

    // really delete auras "deleted" while processing its ApplyModify code
    for (auto& iter : m_deletedAuras)
    {
        if (iter->IsInUse())
        {
            ACE_Stack_Trace st;
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[Crash/Auras] Deleting aura %u in use (%s)", iter->GetId(), GetObjectGuid().GetString().c_str());
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s", st.c_str());
        }
        else
            delete iter;
    }
    m_deletedAuras.clear();
}

SpellAuraHolder* Unit::GetSpellAuraHolder(uint32 spellid) const
{
    SpellAuraHolderMap::const_iterator itr = m_spellAuraHolders.find(spellid);
    return itr != m_spellAuraHolders.end() ? itr->second : nullptr;
}

SpellAuraHolder* Unit::GetSpellAuraHolder(uint32 spellid, ObjectGuid casterGuid) const
{
    SpellAuraHolderConstBounds bounds = GetSpellAuraHolderBounds(spellid);
    for (SpellAuraHolderMap::const_iterator iter = bounds.first; iter != bounds.second; ++iter)
        if (iter->second->GetRealCasterGuid() == casterGuid)
            return iter->second;

    return nullptr;
}


class RelocationNotifyEvent : public BasicEvent
{
public:
    RelocationNotifyEvent(Unit& owner) : BasicEvent(), m_owner(owner)
    {
        m_owner.SetAINotifyScheduled(true);
    }

    bool Execute(uint64 /*e_time*/, uint32 /*p_time*/)
    {
        float radius = sWorld.getConfig(CONFIG_FLOAT_MAX_CREATURE_ATTACK_RADIUS) * sWorld.getConfig(CONFIG_FLOAT_RATE_CREATURE_AGGRO);
        if (m_owner.IsPlayer())
        {
            MaNGOS::PlayerRelocationNotifier notify((Player&)m_owner);
            Cell::VisitAllObjects(&m_owner, notify, radius);
        }
        else //if (m_owner.IsCreature())
        {
            MaNGOS::CreatureRelocationNotifier notify((Creature&)m_owner);
            Cell::VisitAllObjects(&m_owner, notify, radius);
        }
        m_owner.SetAINotifyScheduled(false);
        return true;
    }

    void Abort(uint64)
    {
        m_owner.SetAINotifyScheduled(false);
    }

private:
    Unit& m_owner;
};

void Unit::ScheduleAINotify(uint32 delay)
{
    if (HasUnitState(UNIT_STAT_NO_BROADCAST_TO_OTHERS))
        return;

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

void Unit::HandleInterruptsOnMovement(bool positionChanged)
{
    if (positionChanged)
    {
        // Interrupt spell cast at move
        InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
        InterruptSpellsWithChannelFlags(AURA_INTERRUPT_MOVING_CANCELS);
        RemoveAurasWithInterruptFlags(AURA_INTERRUPT_MOVING_CANCELS | AURA_INTERRUPT_TURNING_CANCELS);
        
        HandleEmoteState(0);
    }
    else
        RemoveAurasWithInterruptFlags(AURA_INTERRUPT_TURNING_CANCELS);

    // Fix bug after 1.11 where client doesn't send stand state update while casting.
    // Test case: Begin eating or drinking, then start casting Hearthstone and run.
    if (m_movementInfo.HasMovementFlag(MOVEFLAG_MASK_MOVING_OR_TURN)) // sitting on chair teleports you, so we need to check flags
        SetStandState(UNIT_STAND_STATE_STAND);
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
void Unit::InterruptSpellsCastedOnMe(bool killDelayed, bool interruptPositiveSpells, bool onlyIfNotStalked)
{
    std::list<Unit*> targets;
    // Maximum spell range=100m ?
    MaNGOS::AnyUnitInObjectRangeCheck u_check(this, 100.0f);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    // Don't need to use visibility modifier, units won't be able to cast outside of draw distance
    Cell::VisitAllObjects(this, searcher, GetMap()->GetVisibilityDistance());

    for (const auto& iter : targets)
    {
        if (!interruptPositiveSpells && IsFriendlyTo(iter))
            continue;

        if (onlyIfNotStalked && HasAuraTypeByCaster(SPELL_AURA_MOD_STALKED, iter->GetObjectGuid()))
            continue;

        for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; i++)
            if (Spell* spell = iter->GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->m_targets.getUnitTargetGuid() == GetObjectGuid())
                    if (killDelayed || (spell->getState() == SPELL_STATE_PREPARING && spell->GetCastedTime()) || i == CURRENT_CHANNELED_SPELL)
                        iter->InterruptSpell(CurrentSpellTypes(i), true);

        if (!killDelayed)
            continue;

        // Interruption of spells which are no longer referenced, but for which there is still an event (not yet hit the target for example) 
        auto i_Events = iter->m_Events.GetEvents().begin();
        for (; i_Events != iter->m_Events.GetEvents().end(); ++i_Events)
            if (SpellEvent* event = dynamic_cast<SpellEvent*>(i_Events->second))
                if (event && event->GetSpell()->m_targets.getUnitTargetGuid() == GetObjectGuid())
                    if (event->GetSpell()->getState() != SPELL_STATE_FINISHED)
                        event->GetSpell()->cancel();
    }
}

void Unit::InterruptAttacksOnMe(float dist, bool guard_check)
{
    if (dist == 0.0f)
        dist = GetMap()->GetVisibilityDistance();

    // Must use modifier, otherwise long range auto attacks will not toggle
    dist = std::max(dist, GetVisibilityModifier());

    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, dist);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, dist);
    for (const auto& iter : targets)
    {
        if (iter->GetVictim() != this)
            continue;
        if (guard_check && iter->IsContestedGuard())
            continue;
        iter->AttackStop();
        if (Player* pAttacker = iter->ToPlayer())
            pAttacker->SendAttackSwingCancelAttack();
    }
}

void Unit::CombatStopInRange(float dist)
{
    if (dist == 0.0f)
        dist = GetMap()->GetVisibilityDistance();

    // must check with modifier, otherwise we could combat bug
    dist = std::max(dist, GetVisibilityModifier());

    std::list<Unit*> targets;
    MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(this, this, dist);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitAllObjects(this, searcher, dist);
    for (const auto& iter : targets)
        iter->CombatStopWithPets(true);
}

// TriniyCore
bool Unit::GetRandomAttackPoint(Unit const* attacker, float &x, float &y, float &z) const
{
    // Compute random angle
    float angle = GetAngle(attacker);
    float sizeFactor = GetObjectBoundingRadius() + attacker->GetObjectBoundingRadius();
    if (sizeFactor < 0.1f)
        sizeFactor = DEFAULT_WORLD_OBJECT_SIZE;

    bool const canOnlySwim = attacker->CanSwim() && !attacker->CanWalk() && !attacker->CanFly();
    bool const reachableBySwiming = attacker->CanSwimAtPosition(GetPosition());

    uint32 attacker_number = GetAttackers().size();
    if (attacker_number > 0)
        --attacker_number;

    // Don't compute a random position for a moving player or when swimming to player near shore
    if ((IsPlayer() && IsMoving()) || (canOnlySwim && !reachableBySwiming))
        attacker_number = 0;

    angle += (attacker_number ? ((float(M_PI / 2) - float(M_PI) * rand_norm_f()) * attacker_number / sizeFactor) * 0.3f : 0);

    float dist = GetCombatReachToTarget(attacker, false, 0.0f, true) - 0.5f;
    float initialPosX, initialPosY, initialPosZ, o;
    GetPosition(initialPosX, initialPosY, initialPosZ);

    // Moving player: try to extrapolate movement a bit
    if (IsPlayer() && IsMoving())
        if (!ExtrapolateMovement(m_movementInfo, 200, initialPosX, initialPosY, initialPosZ, o))
            GetPosition(initialPosX, initialPosY, initialPosZ);

    float attackerTargetDistance = sqrt(pow(initialPosX - attacker->GetPositionX(), 2) +
        pow(initialPosY - attacker->GetPositionY(), 2) +
        pow(initialPosZ - attacker->GetPositionZ(), 2));
    if (dist > attackerTargetDistance)
    {
        // We're not moving, we're already within range. 
        attacker->GetPosition(x, y, z);
        return true;
    }

    float normalizedVectZ = (attacker->GetPositionZ() - initialPosZ) / attackerTargetDistance;
    float normalizedVectXY = sqrt(1 - normalizedVectZ * normalizedVectZ);
    x = initialPosX + dist * cos(angle) * normalizedVectXY;
    y = initialPosY + dist * sin(angle) * normalizedVectXY;
    z = initialPosZ + dist * normalizedVectZ;

    if (attacker->CanFly() || (attacker->CanSwim() && reachableBySwiming) || !HasMMapsForCurrentMap())
    {
        GetMap()->GetLosHitPosition(initialPosX, initialPosY, initialPosZ, x, y, z, -0.2f);
        if (attacker->CanSwim() && reachableBySwiming)
        {
            float ground = 0.0f;
            float waterSurface = GetTerrain()->GetWaterLevel(x, y, z, &ground);
            if (waterSurface == VMAP_INVALID_HEIGHT_VALUE)
                waterSurface = GetPositionZ();
            if (z > waterSurface)
                z = waterSurface;
            if (z < ground)
                z = ground;
        }
        return true;
    }
    else if (canOnlySwim && !reachableBySwiming)
    {
        z = GetTerrain()->GetWaterLevel(attacker->GetPositionX(), attacker->GetPositionY(), attacker->GetPositionZ());
        if (z != VMAP_INVALID_HEIGHT_VALUE)
        {
            dist = std::max(GetCombatReach(true) + attacker->GetCombatReach(true), ATTACK_DISTANCE) - GetObjectBoundingRadius() - std::fabs(z - GetPositionZ());
            for (int i = 0; i < 12; i++)
            {
                GetNearPoint2DAroundPosition(GetPositionX(), GetPositionY(), x, y, dist, angle + (M_PI_F / 6.0f) * float(i));

                float ground = 0.0f;
                z = GetTerrain()->GetWaterLevel(x, y, z, &ground) - attacker->GetMinSwimDepth();
                if (ground < z &&
                    attacker->CanReachWithMeleeAutoAttackAtPosition(this, x, y, z) &&
                    IsWithinLOS(x, y, z, false))
                    return true;
            }
        }
    }
    else
    {
        uint32 nav = 0;
        if (attacker->CanWalk())
            nav |= NAV_GROUND;
        if (attacker->CanSwim())
            nav |= NAV_WATER;
        if (!attacker->IsPlayer())
            nav |= NAV_MAGMA | NAV_SLIME;

        // Try mmaps. On fail, use target position (but should not fail)
        if (GetMap()->GetWalkHitPosition(GetTransport(), initialPosX, initialPosY, initialPosZ, x, y, z, nav))
            return true;
    }

    GetPosition(x, y, z);
    return false;
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

float Unit::GetCombatReachToTarget(Unit const* pVictim, bool ability, float flat_mod, bool ignoreLeeway /*= false*/) const
{
    float victimReach = (pVictim && pVictim->IsInWorld())
        ? pVictim->GetCombatReach(true)
        : 0.0f;

    float reach = GetCombatReach(true) + victimReach + flat_mod;

    reach += BASE_MELEERANGE_OFFSET;
    if (reach < ATTACK_DISTANCE)
        reach = ATTACK_DISTANCE;

    if (ignoreLeeway)
        return reach;

    // Melee leeway mechanic.
    // When both player and target has > 70% of normal runspeed, and are moving,
    // the player gains an additional 2.66yd of melee range.
    reach += GetLeewayBonusRange(pVictim, ability);

    return reach;
}

bool Unit::CanReachWithMeleeAutoAttack(Unit const* pVictim, float flat_mod /*= 0.0f*/) const
{
    float x = GetPositionX(), y = GetPositionY(), z = GetPositionZ();

    return CanReachWithMeleeAutoAttackAtPosition(pVictim, x, y, z, flat_mod);
}

bool Unit::CanReachWithMeleeAutoAttackAtPosition(Unit const* pVictim, float x, float y, float z, float flat_mod /*= 0.0f*/) const
{
    if (!pVictim || !pVictim->IsInWorld())
        return false;

    float reach = GetCombatReachToTarget(pVictim, false, flat_mod);

    float dx = x - pVictim->GetPositionX();
    float dy = y - pVictim->GetPositionY();
    float dz = z - pVictim->GetPositionZ();

    // Some units have long Z reach (tall), use whichever is highest of the victim Z limit or
    // the unit's Z reach
    float victimZLimit = pVictim->GetMeleeZLimit();
    float zReach = m_meleeZReach > victimZLimit ? m_meleeZReach : victimZLimit;
    return (dx * dx + dy * dy < reach * reach) && ((dz * dz) < zReach);
}

Unit* Unit::GetUnit(WorldObject &obj, uint64 const& Guid)
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
        if (!(pVictim = GetVictim()))
            return nullptr;

    if (Creature* pCreature = SummonCreature(creatureEntry, summonX, summonY, summonZ, summonAng, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 25000))
    {
        if (pCreature->AI())
            pCreature->AI()->AttackStart(pVictim);
        return pCreature;
    }
    return nullptr;
}

bool Unit::IsCaster() const
{
    // Cast en cours : on est casteur.
    if (IsNonMeleeSpellCasted(true, false, true))
        return true;

    switch (GetClass())
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

bool Unit::IsImmuneToSchoolMask(uint32 schoolMask) const
{
    AuraList const& immune = GetAurasByType(SPELL_AURA_SCHOOL_IMMUNITY);

    uint32 immuneMask = 0;
    for (const auto& itr : immune)
    {
        immuneMask |= itr->GetModifier()->m_miscvalue;
        if (immuneMask & schoolMask)             // Immunise
            return true;
    }
    return false;
}

bool Unit::IsImmuneToMechanic(Mechanics mechanic) const
{
    SpellImmuneList const& mechanicList = m_spellImmune[IMMUNITY_MECHANIC];
    for (const auto& itr : mechanicList)
        if (itr.type == mechanic)
            return true;

    return false;
}

CreatureAI* Unit::AI() const
{
    return IsCreature() ? ((Creature*)this)->AI() : nullptr;
}

SpellAuraHolder* Unit::AddAura(uint32 spellId, uint32 addAuraFlags, Unit* pCaster)
{
    if (IsDeleted() || (pCaster && pCaster->IsDeleted()))
        return nullptr;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return nullptr;

    if (!spellInfo->IsSpellAppliesAura((1 << EFFECT_INDEX_0) | (1 << EFFECT_INDEX_1) | (1 << EFFECT_INDEX_2)) &&
            !spellInfo->HasEffect(SPELL_EFFECT_PERSISTENT_AREA_AURA))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Cannot apply aura with Id %u : spell does not have auras!", spellInfo->Id);
        return nullptr;
    }

    if (!pCaster)
        pCaster = this;

    SpellAuraHolder* holder = CreateSpellAuraHolder(spellInfo, this, pCaster, pCaster);
    if (!holder)
        return nullptr;

    if (addAuraFlags & ADD_AURA_PASSIVE)
        holder->SetPassive(true);
    if (addAuraFlags & ADD_AURA_PERMANENT)
        holder->SetPermanent(true);

    for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        uint8 eff = spellInfo->Effect[i];
        if (eff >= TOTAL_SPELL_EFFECTS)
            continue;

        if (Spells::IsAreaAuraEffect(eff)           ||
                eff == SPELL_EFFECT_APPLY_AURA  ||
                eff == SPELL_EFFECT_PERSISTENT_AREA_AURA)
        {
            Aura* aur = CreateAura(spellInfo, SpellEffectIndex(i), nullptr, holder, this, pCaster);
            if (addAuraFlags & ADD_AURA_POSITIVE)
                aur->SetPositive(true);
            else if (addAuraFlags & ADD_AURA_NEGATIVE)
                aur->SetPositive(false);

            holder->AddAura(aur, SpellEffectIndex(i));
        }
    }
    if (!AddSpellAuraHolder(holder))
        holder = nullptr;
    return holder;
}

SpellAuraHolder* Unit::RefreshAura(uint32 spellId, int32 duration)
{
    if (SpellAuraHolder* holder = GetSpellAuraHolder(spellId))
    {
        holder->SetAuraDuration(duration);
        holder->UpdateAuraDuration();
        return holder;
    }
    return nullptr;
}

bool Unit::HasMorePowerfulSpellActive(SpellEntry const* spell) const
{
    std::vector<uint32> morePowerfulSpells;
    if (!sSpellMgr.ListMorePowerfulSpells(spell->Id, morePowerfulSpells))
        return false;
    for (const auto& i : m_spellAuraHolders)
        for (const auto& it : morePowerfulSpells)
            if (it == i.first)
                return true;
    return false;
}

Aura* Unit::GetMostImportantAuraAfter(Aura const* like, Aura const* except) const
{
    ASSERT(like);
    AuraType auraName = like->GetModifier()->m_auraname;

    // Certains area aura (Cf AreaAura::AreaAura), exemple 8836, 10626
    if (auraName == SPELL_AURA_NONE)
        return nullptr;

    if (auraName >= TOTAL_AURAS)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[AURASTACK][%u] auraName %u invalide.", like->GetId(), auraName);
        return nullptr;
    }

    Aura* currMostImportant = nullptr;
    for (const auto& iter : m_modAuras[auraName])
    {
        if (!iter->IsExclusive() || iter == except)
            continue;
        if (!currMostImportant)
        {
            int checkResult = iter->CheckExclusiveWith(like);
            // We want an aura of the same type as 'like'.
            if (checkResult > 0)
                currMostImportant = iter;
        }
        else
        {
            int checkResult = iter->CheckExclusiveWith(currMostImportant);
            // 'iter' should be better than 'currMostImportant'
            if (checkResult == 1)
                currMostImportant = iter;
        }
    }
    if (currMostImportant)
    {
        // Have we found what we need ?
        // Different from 'except'
        ASSERT(currMostImportant != except);
        // And of the same type as 'like'.
        ASSERT(currMostImportant->CheckExclusiveWith(like) > 0);
    }
    return currMostImportant;
}

void Unit::UpdateSplineMovement(uint32 t_diff)
{
    if (movespline->Finalized())
        return;

    movespline->updateState(t_diff);
    bool arrived = movespline->Finalized();

    if (arrived)
    {
        DisableSpline();

        if (HasPendingSplineDone() && !IsPlayer() && !GetPossessorGuid().IsPlayer())
            SetSplineDonePending(false);
    }
    else if (!movespline->isCyclic() && movespline->getLastPointSent() >= 0 && movespline->getLastPointSent() < (movespline->currentPathIdx() + 3))
    {
        WorldPacket data(SMSG_MONSTER_MOVE, 64);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        data << GetPackGUID();
#else
        data << GetGUID();
#endif
        movespline->setLastPointSent(Movement::PacketBuilder::WriteMonsterMove(*movespline, data, movespline->getLastPointSent() + 1));
        SendMovementMessageToSet(std::move(data), true);
    }

    Movement::Location loc = movespline->ComputePosition();
    if (GenericTransport* t = GetTransport())
    {
        m_movementInfo.GetTransportPos().x = loc.x;
        m_movementInfo.GetTransportPos().y = loc.y;
        m_movementInfo.GetTransportPos().z = loc.z;
        m_movementInfo.GetTransportPos().o = loc.orientation;
        t->CalculatePassengerPosition(loc.x, loc.y, loc.z, &loc.orientation);
    }
    if (!MaNGOS::IsValidMapCoord(loc.x, loc.y, loc.z))
        return;

    if (IsPlayer())
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
            ClearUnitState(UNIT_STAT_RUNNING);
        else
            AddUnitState(UNIT_STAT_RUNNING);
    }

    if (enable == m_movementInfo.HasMovementFlag(MOVEFLAG_WALK_MODE))
        return;

    if (enable)
        m_movementInfo.AddMovementFlag(MOVEFLAG_WALK_MODE);
    else
        m_movementInfo.RemoveMovementFlag(MOVEFLAG_WALK_MODE);

    MovementPacketSender::SendToggleRunWalkToAll(this, !enable);
}

void Unit::DisableSpline()
{
    if (Player* me = ToPlayer())
        me->SetFallInformation(0);
    m_movementInfo.RemoveMovementFlag(MOVEFLAG_SPLINE_ENABLED | MOVEFLAG_FORWARD);
    m_movementInfo.ctime = 0;
    movespline->_Interrupt();
}


void Unit::SendSpellGo(Unit* target, uint32 spellId) const
{
    SpellCastTargets targets;
    targets.setUnitTarget(target);

    WorldPacket data(SMSG_SPELL_GO, 53);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    data << GetPackGUID();
    data << GetPackGUID();
#else
    data << GetGUID();
    data << GetGUID();
#endif
    data << uint32(spellId);
    data << uint16(CAST_FLAG_UNKNOWN9);

    //WriteSpellGoTargets(&data);
    data << uint8(1);
    data << target->GetObjectGuid();
    data << uint8(0);

    data << targets;
    SendMessageToSet(&data, true);
}

void Unit::SendPlaySpellVisual(uint32 id) const
{
    WorldPacket data(SMSG_PLAY_SPELL_VISUAL, 8 + 4);
    data << uint64(GetGUID());
    data << uint32(id); // SpellVisualKit.dbc index
    SendMessageToSet(&data, true);
}

void Unit::CancelSpellChannelingAnimationInstantly()
{
    if (Player* pPlayer = ToPlayer())
        pPlayer->SendChannelUpdate(0);

    SetChannelObjectGuid(ObjectGuid());
    SetUInt32Value(UNIT_CHANNEL_SPELL, 0);
    DirectSendPublicValueUpdate({ UNIT_FIELD_CHANNEL_OBJECT , UNIT_FIELD_CHANNEL_OBJECT + 1 , UNIT_CHANNEL_SPELL });
}

#define PRELOAD if (this == unit) return true; \
Unit const* u1 = GetCharmerOrOwnerOrSelf(); \
Unit const* u2 = unit->GetCharmerOrOwnerOrSelf(); \
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

        if (unit->GetThreatManager().getThreat(_from) > 0.1f)
            unit->AddThreat(_to, unit->GetThreatManager().getThreat(_from));
        else if (unit->GetVictim() == _from && unit->AI()) // Si on aggro sans faire de degat
            unit->AI()->AttackStart(_to);
        else
            return;
        unit->GetThreatManager().modifyThreatPercent(_from, -100);
    }
protected:
    Unit* _from;
    Unit* _to;
};

void Unit::RemoveAttackersThreat(Unit* owner)
{
    for (const auto& itr : m_attackers)
    {
        itr->GetThreatManager().modifyThreatPercent(this, -100);
        if (owner)
            itr->AddThreat(owner, 1.0f);
    }
}

void Unit::DoResetThreat()
{
    if (!CanHaveThreatList() || GetThreatManager().isThreatListEmpty())
    {
        if (IsCreature())
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "DoResetThreat called for creature that either cannot have threat list or has empty threat list (entry = %d)", GetEntry());
        return;
    }

    ThreatList const& tList = GetThreatManager().getThreatList();
    for (const auto itr : tList)
    {
        Unit* pUnit = GetMap()->GetUnit(itr->getUnitGuid());

        if (pUnit && GetThreatManager().getThreat(pUnit))
            GetThreatManager().modifyThreatPercent(pUnit, -100);
    }
}

bool Unit::HasAuraPetShouldAvoidBreaking(Unit* excludeCasterChannel) const
{
    // World of Warcraft Client Patch 1.8.0 (2005-10-11)
    // - Pets no longer break off attacks when their target is affected by Warlock Fear.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_7_1
    if (HasAuraType(SPELL_AURA_MOD_FEAR))
        return true;
#endif

    return HasBreakableByDamageCrowdControlAura(excludeCasterChannel);
}

bool Unit::HasBreakableByDamageAuraType(AuraType type, uint32 excludeAura) const
{
    AuraList const& auras = GetAurasByType(type);
    for (const auto& itr : auras)
        if ((!excludeAura || excludeAura != itr->GetSpellProto()->Id) && // Avoid self interrupt of channeled Crowd Control spells like Seduction
             itr->GetSpellProto()->HasAuraInterruptFlag(AURA_INTERRUPT_DAMAGE_CANCELS))
            return true;
    return false;
}

bool Unit::HasBreakableByDamageCrowdControlAura(Unit* excludeCasterChannel) const
{
    uint32 excludeAura = 0;
    if (Spell* currentChanneledSpell = excludeCasterChannel ? excludeCasterChannel->GetCurrentSpell(CURRENT_CHANNELED_SPELL) : nullptr)
        excludeAura = currentChanneledSpell->m_spellInfo->Id; //Avoid self interrupt of channeled Crowd Control spells like Seduction

    return (HasBreakableByDamageAuraType(SPELL_AURA_MOD_CONFUSE, excludeAura)
            //|| HasBreakableByDamageAuraType(SPELL_AURA_MOD_FEAR, excludeAura)    // no breakable fears in vanilla
            || HasBreakableByDamageAuraType(SPELL_AURA_MOD_STUN, excludeAura)
            //|| HasBreakableByDamageAuraType(SPELL_AURA_MOD_ROOT, excludeAura)    // no breakable roots in vanilla
            || HasBreakableByDamageAuraType(SPELL_AURA_TRANSFORM, excludeAura));
}

void Unit::SetReactState(ReactStates state)
{
    if (CharmInfo* pCharmInfo = GetCharmInfo())
        pCharmInfo->SetReactState(state);
    else if (Creature* pCreature = ToCreature())
        pCreature->SetCreatureReactState(state);
    else
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SetReactState called for non-charmed player!");
}

ReactStates Unit::GetReactState() const
{
    if (CharmInfo* pCharmInfo = GetCharmInfo())
        return pCharmInfo->GetReactState();

    if (Creature const* pCreature = ToCreature())
        return pCreature->GetCreatureReactState();

    return REACT_DEFENSIVE;
}

bool Unit::HasReactState(ReactStates state) const
{
    if (CharmInfo* pCharmInfo = GetCharmInfo())
        return pCharmInfo->HasReactState(state);

    if (Creature const* pCreature = ToCreature())
        return pCreature->HasCreatureReactState(state);

    return state == REACT_DEFENSIVE;
}

void Unit::UpdateControl()
{
    Player* mePlayer = ToPlayer();

    // Inform controller
    if (Unit* charmer = GetCharmer())
        if (Player* charmerPlayer = charmer->ToPlayer())
            if (charmerPlayer->GetCharmGuid() == GetObjectGuid())
                charmerPlayer->SetClientControl(this, !HasUnitState(UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED));
    // Inform myself
    if (mePlayer)
    {
        // Possessing someone ?
        if (Unit* possessed = GetCharm())
            if (possessed->GetCharmerGuid() == GetObjectGuid())
            {
                mePlayer->SetClientControl(possessed, !possessed->HasUnitState(UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED));
                return;
            }
        mePlayer->SetClientControl(mePlayer, !HasUnitState(UNIT_STAT_POSSESSED | UNIT_STAT_FLEEING | UNIT_STAT_CONFUSED) && !GetCharmerGuid());
    }
}

// select nearest hostile unit within the given distance (regardless of threat list).
Unit* Unit::SelectNearestTarget(float dist) const
{
    CellPair p(MaNGOS::ComputeCellPair(GetPositionX(), GetPositionY()));
    Cell cell(p);
    cell.SetNoCreate();

    Unit* target = nullptr;

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

float Unit::GetMinChaseDistance(Unit const* victim) const
{
    if (m_casterChaseDistance > 1.0f)
        return m_casterChaseDistance;
    return GetObjectBoundingRadius();
}

float Unit::GetMaxChaseDistance(Unit const* victim) const
{
    if (m_casterChaseDistance > 1.0f)
        return m_casterChaseDistance + GetCombatReach() + victim->GetCombatReach();
    return GetCombatReachToTarget(victim, false, 0.0f, true);
}

void Unit::RestoreMovement()
{
    if (!IsCreature())
        return;
    // Need restore previous movement since we have no proper states system
    if (IsAlive() && !HasUnitState(UNIT_STAT_CONFUSED | UNIT_STAT_FLEEING))
    {
        Unit* victim = GetCharmInfo() && GetCharmInfo()->IsAtStay() ? nullptr : GetVictim();
        if (victim)
            GetMotionMaster()->MoveChase(victim);
        else if (GetMotionMaster()->GetCurrentMovementGeneratorType() != static_cast<Creature*>(this)->GetDefaultMovementType())
            GetMotionMaster()->Initialize();
    }
}

void Unit::SetTransformScale(float scale)
{
    if (!scale)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempt to set transform scale to 0!");
        return;
    }
    ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X,(scale/m_nativeScaleOverride -1)*100,true);
    m_nativeScaleOverride = scale;
}

void Unit::ResetTransformScale()
{
    SetTransformScale(GetNativeScale());
}

float Unit::GetNativeScale() const
{
    return m_nativeScale;
}

void Unit::SetNativeScale(float scale)
{
    SetTransformScale(scale);
    m_nativeScale = scale;
}

void Unit::WritePetSpellsCooldown(WorldPacket& data) const
{
    // write cooldown data
    uint32 cdCount = 0;
    const size_t cdCountPos = data.wpos();
    data << uint16(0);
    auto currTime = sWorld.GetCurrentClockTime();

    for (auto& cdItr : m_cooldownMap)
    {
        auto& cdData = cdItr.second;
        TimePoint spellRecTime = currTime;
        TimePoint catRecTime = currTime;
        cdData->GetSpellCDExpireTime(spellRecTime);
        cdData->GetCatCDExpireTime(catRecTime);
        uint32 spellCDDuration = 0;
        uint32 catCDDuration = 0;
        if (spellRecTime > currTime)
            spellCDDuration = std::chrono::duration_cast<std::chrono::milliseconds>(spellRecTime - currTime).count();
        if (catRecTime > currTime)
            catCDDuration = std::chrono::duration_cast<std::chrono::milliseconds>(catRecTime - currTime).count();

        if (!spellCDDuration && !catCDDuration && !cdData->IsPermanent())
            continue;

        if (cdData->IsPermanent())
            catCDDuration |= 0x8000000;

        data << uint32(cdData->GetSpellId());
        data << uint16(cdData->GetCategory());              // spell category
        data << uint32(spellCDDuration);                    // cooldown
        data << uint32(catCDDuration);                      // category cooldown
        ++cdCount;
    }
    data.put<uint16>(cdCountPos, cdCount);
}
