/*
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

#include "PartyBotAI.h"
#include "Player.h"
#include "CreatureAI.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "Opcodes.h"
#include "World.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Chat.h"
#include "Totem.h"
#include <random>

enum PartyBotSpells
{
    PB_SPELL_FOOD = 1131,
    PB_SPELL_DRINK = 1137,
    PB_SPELL_AUTO_SHOT = 75,
    PB_SPELL_SHOOT_WAND = 5019,
    PB_SPELL_HONORLESS_TARGET = 2479,
};

#define PB_UPDATE_INTERVAL 1000
#define PB_BUFFING_INTERVAL 2000
#define PB_MIN_FOLLOW_DIST 3.0f
#define PB_MAX_FOLLOW_DIST 6.0f
#define PB_MIN_FOLLOW_ANGLE 0.0f
#define PB_MAX_FOLLOW_ANGLE 6.0f

bool PartyBotAI::OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess)
{
    if (!m_race && !m_class)
    {
        sess->LoginPlayer(entry->playerGUID);
        return true;
    }

    return SpawnNewPlayer(sess, m_class, m_race, m_mapId, m_instanceId, m_x, m_y, m_z, m_o, sObjectAccessor.FindPlayer(m_cloneGuid));
}

void PartyBotAI::CloneFromPlayer(Player const* pPlayer)
{
    if (!pPlayer)
        return;

    if (pPlayer->GetLevel() != me->GetLevel())
    {
        me->GiveLevel(pPlayer->GetLevel());
        me->InitTalentForLevel();
        me->SetUInt32Value(PLAYER_XP, 0);
    }

    // Learn all of the target's spells.
    for (const auto& spell : pPlayer->GetSpellMap())
    {
        if (spell.second.disabled)
            continue;

        if (spell.second.state == PLAYERSPELL_REMOVED)
            continue;

        SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spell.first);
        if (!pSpellEntry)
            continue;

        uint32 const firstRankId = sSpellMgr.GetFirstSpellInChain(spell.first);
        if (!me->HasSpell(spell.first))
            me->LearnSpell(spell.first, false, (firstRankId == spell.first && GetTalentSpellPos(firstRankId)));
    }

    me->GetHonorMgr().SetHighestRank(pPlayer->GetHonorMgr().GetHighestRank());
    me->GetHonorMgr().SetRank(pPlayer->GetHonorMgr().GetRank());

    // Unequip current gear
    for (int i = EQUIPMENT_SLOT_START; i < EQUIPMENT_SLOT_END; ++i)
        me->AutoUnequipItemFromSlot(i);

    // Copy gear from target.
    for (int i = EQUIPMENT_SLOT_START; i < EQUIPMENT_SLOT_END; ++i)
    {
        if (Item* pItem = pPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
        {
            me->SatisfyItemRequirements(pItem->GetProto());
            me->StoreNewItemInBestSlots(pItem->GetEntry(), 1, pItem->GetEnchantmentId(EnchantmentSlot(0)));
        }   
    }
}

Player* PartyBotAI::GetPartyLeader() const
{
    if (m_leaderGuid == me->GetObjectGuid())
        return me;

    Group* pGroup = me->GetGroup();
    if (!pGroup)
        return nullptr;

    if (Player* originalLeader = ObjectAccessor::FindPlayerNotInWorld(m_leaderGuid))
    {
        if (me->InBattleGround() == originalLeader->InBattleGround())
        {
            // In case the original spawner is not in the same group as the bots anymore.
            if (pGroup != originalLeader->GetGroup())
                return nullptr;

            // In case the current leader is the bot itself and it's not inside a Battleground.
            ObjectGuid currentLeaderGuid = pGroup->GetLeaderGuid();
            if (currentLeaderGuid == me->GetObjectGuid() && !me->InBattleGround())
                return nullptr;
        }

        return originalLeader;
    }

    return nullptr;
}

bool PartyBotAI::IsValidDistancingTarget(Unit* pTarget, Unit* pEnemy)
{
    if (pTarget->IsInWorld() && pTarget->IsAlive() &&
        pTarget->GetMap() == me->GetMap())
    {
        float const distance = me->GetDistance(pTarget);
        if (distance >= 15.0f && distance <= 30.0f &&
            pTarget->GetDistance(pEnemy) >= 15.0f)
            return true;
    }
     
    return false;
}

Unit* PartyBotAI::GetDistancingTarget(Unit* pEnemy)
{
    if (Player* pLeader = GetPartyLeader())
        if (IsValidDistancingTarget(pLeader, pEnemy))
            return pLeader;

    Unit* pNonTank = nullptr;
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == me)
                continue;

            if (IsValidDistancingTarget(pMember, pEnemy))
            {
                if (IsTankingForm(pMember->GetShapeshiftForm()) || IsWearingShield(pMember))
                    return pMember;
                else
                    pNonTank = pMember;
            }
        }
    }

    return pNonTank;
}

bool PartyBotAI::RunAwayFromTarget(Unit* pEnemy, float distance)
{
    if (DoNotMove())
        return false;

    float ox, oy, oz;
    pEnemy->GetLosCheckPosition(ox, oy, oz);
    float x, y, z;
    if (SafeSpotsFind(pEnemy, distance, x, y, z))
    {
        if (me->IsWithinLOSAtPosition(x, y, z, ox, oy, oz, true, 0.0f)) // me->GetCollisionHeight()))
        {
            MovePointNear(x, y, z, pEnemy);
            return true;
        }
    }

    if (Unit* pTarget = GetDistancingTarget(pEnemy))
    {
        me->MonsterMove(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ());
        return true;
    }

    return me->GetMotionMaster()->MoveDistance(pEnemy, distance);
}

bool PartyBotAI::RunAwayFromTarget(Unit* pEnemy)
{
    return RunAwayFromTarget(pEnemy, 15.0f);
}

bool PartyBotAI::DoNotMove()
{
    return m_stay || !m_clientMovementTimer.Passed() || me->HasUnitState(UNIT_STATE_CAN_NOT_MOVE);
}

void PartyBotAI::MoveChase(Unit* target, float dist, float angle)
{
    if (!DoNotMove())
        me->GetMotionMaster()->MoveChase(target, dist, angle);
}

void PartyBotAI::MoveFollow(Unit* pLeader)
{
    if (!DoNotMove())
        me->GetMotionMaster()->MoveFollow(pLeader, urand(PB_MIN_FOLLOW_DIST, PB_MAX_FOLLOW_DIST), frand(PB_MIN_FOLLOW_ANGLE, PB_MAX_FOLLOW_ANGLE));
}

void PartyBotAI::MovePoint(float x, float y, float z, Unit* pVictim)
{
    if (DoNotMove())
        return;

    float finalOrientation = -10;
    if (pVictim)
        finalOrientation = fmodf(M_PI_F + pVictim->GetAngle(x, y), 2 * M_PI_F);
    //me->UpdateAllowedPositionZ(x, y, z);
    me->GetMotionMaster()->MovePoint(me->GetGUIDLow(), x, y, z, MOVE_PATHFINDING, me->GetSpeed(MOVE_RUN), finalOrientation);
}

void PartyBotAI::MovePointNear(float x, float y, float z, Unit* pVictim)
{
    me->GetMap()->GetWalkHitPosition(nullptr, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), x, y, z);
    MovePoint(x, y, z, pVictim);
}

bool PartyBotAI::StayBehind(Unit* pVictim)
{
    if (DoNotMove())
        return false;

    if (!me->IsMoving() && me->CanReachWithMeleeAutoAttack(pVictim) && pVictim->HasInArc(me) && !me->HasUnitState(UNIT_STATE_NO_FREE_MOVE))
    {
        float x, y, z;
        pVictim->GetRelativePositions(-1.0f, 0.0f, 0.0f, x, y, z);
        MovePointNear(x, y, z, pVictim);
        return true;
    }
    return false;
}

Aura* PartyBotAI::GetAura(AuraType type, int32 maxDuration)
{
    auto const& auras = me->GetAurasByType(type);
    for (const auto& i : auras)
        if (i->GetAuraMaxDuration() == maxDuration)
            return i;

    return nullptr;
}

bool PartyBotAI::DrinkAndEat()
{
    if (me->GetVictim())
        return false;

    bool const needToEat = me->GetHealthPercent() < 100.0f;
    bool const needToDrink = (me->GetPowerType() == POWER_MANA) && (me->GetPowerPercent(POWER_MANA) < 100.0f);

    if (!needToEat && !needToDrink)
        return false;

    bool const isEating = GetAura(SPELL_AURA_MOD_REGEN, 30000) != nullptr;
    bool const isDrinking = GetAura(SPELL_AURA_MOD_POWER_REGEN, 30000) != nullptr;

    if (!isEating && needToEat && !m_noGenerateItems)
    {
        if (m_isBuffing || GetPartyLeader()->IsMoving())
            return false;

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            me->StopMoving();
            me->GetMotionMaster()->Clear(false, true);
            me->GetMotionMaster()->MoveIdle();
        }
        if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(PB_SPELL_FOOD))
        {
            me->CastSpell(me, pSpellEntry, true);
            me->RemoveSpellCooldown(*pSpellEntry);
        }
        return true;
    }

    if (!isDrinking && needToDrink && !m_noGenerateItems)
    {
        if (m_isBuffing || GetPartyLeader()->IsMoving())
            return false;

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            me->StopMoving();
            me->GetMotionMaster()->Clear(false, true);
            me->GetMotionMaster()->MoveIdle();
        }
        if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(PB_SPELL_DRINK))
        {
            me->CastSpell(me, pSpellEntry, true);
            me->RemoveSpellCooldown(*pSpellEntry);
        }
        return true;
    }

    if (!m_noGenerateItems)
        return needToEat || needToDrink;
    else
        return isEating || isDrinking;
}

bool PartyBotAI::ShouldAutoRevive() const
{
    if (!m_noClient)
        return false;

    if (me->GetDeathState() == DEAD)
        return true;

    bool alivePlayerNearby = false;
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == me)
                continue;

            if (pMember->IsInCombat())
                return false;

            if (pMember->IsAlive())
            {
                if (IsHealerClass(pMember->GetClass()))
                    return false;

                if (me->IsWithinDistInMap(pMember, 15.0f))
                    alivePlayerNearby = true;
            }
        }
    }

    return alivePlayerNearby;
}

bool PartyBotAI::IsTargetDeathWithinSeconds(Unit* pTarget, float seconds) const
{
    // 30 ~ Lvl * 0.7 * 1.6
    uint32 memberCount = pTarget->GetAttackers().size();
    float effectiveMemberCount = memberCount * 0.7f;  // 5 members ~ 3 full dps, 1 half dps, 1 no dps = 3.5/5.0 = 0.7
    float memberDps = me->GetLevel() * 1.6f;
    float groupDps = memberDps * effectiveMemberCount;
    uint32 totalDamage = static_cast<uint32>(groupDps * seconds);
    uint32 targetHealth = pTarget->GetHealth();

    return targetHealth < totalDamage;
}

template <typename Func>
void PartyBotAI::ForEachPlayerInGroup(bool mustBeAlive, Func&& func) const
{
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (mustBeAlive && !pMember->IsAlive())
                continue;

            if (func(pMember))
                return;
        }
    }
}

template <typename Func>
Player* PartyBotAI::FindFirstPlayerInGroupByCondition(bool mustBeAlive, Func&& func) const
{
    Player* found = nullptr;
    ForEachPlayerInGroup(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            if (func(pMember))
            {
                found = pMember;
                return true; // stop iteration
            }
            return false; // continue
        });
    return found;
}

template <typename Func>
std::set<Player*> PartyBotAI::FindAllPlayersInGroupByCondition(bool mustBeAlive, Func&& func) const
{
    std::set<Player*> result;
    ForEachPlayerInGroup(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            if (func(pMember))
                result.insert(pMember);
            return false; // never early-exit
        });
    return result;
}

std::set<Player*> PartyBotAI::FindAllPlayersInGroup(bool mustBeAlive) const
{
    return FindAllPlayersInGroupByCondition(mustBeAlive, [&](Player* pMember) -> bool { return true; });
}

std::set<Player*> PartyBotAI::FindAllPlayersInGroupByRole(CombatBotRoles role, bool mustBeAlive) const
{
    return FindAllPlayersInGroupByCondition(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            return GetRoleByMember(pMember) == role;
        });
}

std::set<Player*> PartyBotAI::FindAllPlayersInGroupByClass(Classes unitClass, bool mustBeAlive) const
{
    return FindAllPlayersInGroupByCondition(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            return pMember->GetClass() == unitClass;
        });
}

Player* PartyBotAI::FindFirstPlayerInGroupByRole(CombatBotRoles role, bool mustBeAlive) const
{
    return FindFirstPlayerInGroupByCondition(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            return GetRoleByMember(pMember) == role;
        });
}

Player* PartyBotAI::FindFirstPlayerInGroupByClass(Classes unitClass, bool mustBeAlive) const
{
    return FindFirstPlayerInGroupByCondition(mustBeAlive,
        [&](Player* pMember) -> bool
        {
            return pMember->GetClass() == unitClass;
        });
}

bool PartyBotAI::ExistsAsPlayerInGroupByRole(CombatBotRoles role, bool mustBeAlive) const
{
    return FindFirstPlayerInGroupByRole(role, mustBeAlive) != nullptr;
}

bool PartyBotAI::ExistsAsTankInGroupForThreatCheck() const
{
    return FindFirstPlayerInGroupByCondition(true,
        [&](Player* pMember) -> bool
        {
            return GetRoleByMember(pMember) == ROLE_TANK;   // TBC: Include pets
        });
}

bool PartyBotAI::ExistsAsHealerInGroupForOffHealCheck() const
{
    return FindFirstPlayerInGroupByCondition(true,
        [&](Player* pMember) -> bool
        {
            return GetRoleByMember(pMember) == ROLE_HEALER && pMember->GetPowerPercent(POWER_MANA) > 15.0f;
        });
}

CombatBotRoles PartyBotAI::FindMajorityRoleForClass(Classes unitClass) const
{
    std::map<CombatBotRoles, uint32> roleCount;
    auto players = FindAllPlayersInGroupByClass(unitClass, false);

    for (Player* pPlayer : players)
    {
        CombatBotRoles role = GetRoleByMember(pPlayer);
        ++roleCount[role];
    }

    CombatBotRoles majorityRole = CombatBotRoles::ROLE_INVALID;
    uint32 maxCount = 0;

    for (const auto& pair : roleCount)
    {
        if (pair.second > maxCount)
        {
            maxCount = pair.second;
            majorityRole = pair.first;
        }
    }

    return majorityRole;
}

bool static CheckThreatForMember(Unit* pMember, Unit const* pTarget)
{
    bool m_checkThreat = pMember->GetMap()->GetId() > 1;
    if (m_checkThreat)
    {
        auto pEnemy = pMember->GetMap()->GetUnit(pTarget->GetObjectGuid());
        if (!pEnemy)
            return true;

        float myThreat = pEnemy->GetThreatManager().getThreat(pMember);
        Unit* pTargetVictim = pTarget->GetVictim();
        if (HostileReference* currentVictim = pEnemy->GetThreatManager().getCurrentVictim())
            pTargetVictim = currentVictim->getTarget();
        if (pTargetVictim)
        {
            if (pTargetVictim == pMember)
                return false;

            float const targetVictimThreat = pEnemy->GetThreatManager().getThreat(pTargetVictim);
            myThreat += pMember->GetLevel() * 4.0f;
            return myThreat < targetVictimThreat * 90.0f / 100.0f;
        }
        return myThreat > 0;
    }

    return true;
}

bool PartyBotAI::CheckThreatOK(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    if (GetRole() == ROLE_TANK || GetRole() == ROLE_HEALER)
        return true;

    if (pTarget == me || pTarget->IsPlayer() || IsInDuel() || !pTarget->CanHaveThreatList() || pTarget->IsFriendlyTo(me))
        return true;

    if (pTarget->GetHealth() < me->GetMaxHealth() / 2)
        return true;
    if (pSpellEntry)
    {
        if (pSpellEntry->IsPositiveSpell() || pSpellEntry->IsCCSpell() || pSpellEntry->IsAreaOfEffectSpell())
            return true;

        for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Spells::IsThreatEffect(pSpellEntry->Effect[i]) && pSpellEntry->EffectBasePoints[i] < 0)
                return true;
        }
    }
    else
    {
        if (me->GetClass() == CLASS_ROGUE && m_spells.rogue.pFeint)
            return true;

        if (me->GetClass() == CLASS_DRUID && GetRole() == ROLE_MELEE_DPS && m_spells.druid.pCower)
            return true;
    }

    if (!ExistsAsTankInGroupForThreatCheck())
        return true;

    return CheckThreatForMember(me, pTarget);
}

bool PartyBotAI::CanTryToCastSpell(Unit const* pTarget, SpellEntry const* pSpellEntry, bool ignoreAppliesAuraCheck, bool checkAuraCaster, bool ignoreStacks) const
{
    if (!CheckThreatOK(pTarget, pSpellEntry))
        return false;

    if (pSpellEntry->IsChanneledSpell() && me->IsMoving() && me->IsMovedByPlayer())
        return false;

    if (!CombatBotBaseAI::CanTryToCastSpell(pTarget, pSpellEntry, ignoreAppliesAuraCheck, checkAuraCaster, ignoreStacks))
        return false;

    if (pTarget->GetMap()->IsBattleGround() || IsInDuel() || pTarget->IsPlayer())
        return true;

    if (pSpellEntry->IsAreaOfEffectSpell() && !pSpellEntry->IsPositiveSpell())
    {
        bool doesDamage = false;
        for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Spells::IsDirectDamageEffect(pSpellEntry->Effect[i]) || pSpellEntry->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_DAMAGE)
            {
                doesDamage = true;
                break;
            }
        }

        if (doesDamage && CrowdControledMarkedTargetsExistNear(pTarget))
            return false;

        // do not cast aoe if it will pull aggro
        if (m_role != ROLE_TANK && doesDamage && ExistsAsTankInGroupForThreatCheck())
        {
            float radius;
            if (pSpellEntry->EffectRadiusIndex[0])
                radius = Spells::GetSpellRadius(sSpellRadiusStore.LookupEntry(pSpellEntry->EffectRadiusIndex[0]));
            else if (pSpellEntry->EffectRadiusIndex[1])
                radius = Spells::GetSpellRadius(sSpellRadiusStore.LookupEntry(pSpellEntry->EffectRadiusIndex[1]));
            else if (pSpellEntry->EffectRadiusIndex[2])
                radius = Spells::GetSpellRadius(sSpellRadiusStore.LookupEntry(pSpellEntry->EffectRadiusIndex[2]));
            else
                radius = 10.0f;
            if (radius > 10.0f)
                radius = 10.0f;

            std::list<Unit*> targets;
            me->GetEnemyListInRadiusAround(pTarget, radius, targets);

            for (auto const& pEnemy : targets)
            {
                if ((pEnemy->GetLevel() + 5) <= me->GetLevel() || !pEnemy->IsValidAttackTarget(me) || !pEnemy->CanHaveThreatList())
                    continue;

                if (pEnemy->GetThreatManager().getThreatList().empty())
                    return false;

                float const myThreat = pEnemy->GetThreatManager().getThreat(me);
                float const victimThreat = pEnemy->GetThreatManager().getThreat(pEnemy->GetVictim());
                if (victimThreat < (myThreat + me->GetLevel() * 5.0f))
                    return false;
            }
        }
    }

    return true;
}

bool PartyBotAI::CanUseCrowdControl(SpellEntry const* pSpellEntry, Unit* pTarget) const
{
    if (IsInDuel())
        return true;

    if (pSpellEntry->HasAuraInterruptFlag(AURA_INTERRUPT_DAMAGE_CANCELS) &&
        AreOthersOnSameTarget(pTarget->GetObjectGuid()))
        return false;

    if (pSpellEntry->HasSingleTargetAura())
    {
        auto const& singleAuras = me->GetSingleCastSpellTargets();
        if (singleAuras.find(pSpellEntry) != singleAuras.end())
            return false;
    }

    return true;
}

bool PartyBotAI::CrowdControledMarkedTargetsExistNear(Unit const* pEnemy, float radius) const
{
    for (auto mark : m_marksToCC)
    {
        if (Unit* pMarkedTarget = GetMarkedTarget(mark))
        {
            if (pMarkedTarget->IsDead())
            {
                continue;
            }
            if (pMarkedTarget->GetDistance(pEnemy) < radius)
            {
                return true;
            }
        }
    }
    return false;
}

bool PartyBotAI::AttackStart(Unit* pVictim)
{
    m_isBuffing = false;

    if (me->IsMounted())
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    if (me->Attack(pVictim, true))
    {
        if ((GetRole() == ROLE_RANGE_DPS || GetRole() == ROLE_HEALER)) // && me->GetPowerPercent(POWER_MANA) > 10.0f && me->GetCombatDistance(pVictim) > 8.0f)
            me->SetCasterChaseDistance(25.0f);
        else if (me->HasDistanceCasterMovement())
            me->SetCasterChaseDistance(0.0f);

        MoveChase(pVictim, 1.0f, GetRole() == ROLE_MELEE_DPS ? 3.0f : 0.0f);
        return true;
    }

    return false;
}

Unit* PartyBotAI::GetMarkedTarget(RaidTargetIcon mark) const
{
    ObjectGuid targetGuid = me->GetGroup()->GetTargetWithIcon(mark);
    if (targetGuid.IsUnit())
        return me->GetMap()->GetUnit(targetGuid);

    return nullptr;
}

Unit* PartyBotAI::SelectAttackTarget(Player* pLeader) const
{
    if (IsInDuel())
    {
        if (me->m_duel->opponent && IsValidHostileTarget(me->m_duel->opponent))
            return me->m_duel->opponent;

        // Who is attacking me.
        for (const auto pAttacker : me->GetAttackers())
        {
            if (IsValidHostileTarget(pAttacker) && CheckThreatOK(pAttacker))
                return pAttacker;
        }
    }
    else
    {
        // Totems
        if (GetRole() != ROLE_HEALER)
        {
            Group* pGroup = me->GetGroup();
            for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                if (Player* pMember = itr->getSource())
                {
                    auto tryFindTotem = [&](Unit* source) -> Totem*
                    {
                        for (Unit* pAttacker : source->GetAttackers())
                        {
                            for (int i = 0; i < MAX_TOTEM_SLOT; ++i)
                            {
                                if (Totem* pTotem = pAttacker->GetTotem(static_cast<TotemSlot>(i)))
                                {
                                    if (pTotem->GetAttackers().empty() || me->GetVictim() == pTotem)
                                        return pTotem;
                                }
                            }
                        }
                        return nullptr;
                    };

                    if (Totem* totem = tryFindTotem(pMember))
                        return totem;

                    if (Pet* pPet = pMember->GetPet())
                    {
                        if (Totem* totem = tryFindTotem(pPet))
                            return totem;
                    }
                }
            }
        }

        // Stick to marked target in combat.
        if (me->IsInCombat() || pLeader->GetVictim())
        {
            for (auto markId : m_marksToFocus)
            {
                ObjectGuid targetGuid = me->GetGroup()->GetTargetWithIcon(markId);
                if (targetGuid.IsUnit())
                    if (Unit* pVictim = me->GetMap()->GetUnit(targetGuid))
                        if (IsValidHostileTarget(pVictim) && me->GetDistance2d(pVictim) < 50.0f && CheckThreatOK(pVictim))
                            return pVictim;
            }
        }

        // Who is the leader attacking.
        if (pLeader != me)
        {
            if (Unit* pVictim = pLeader->GetVictim())
            {
                if (IsValidHostileTarget(pVictim) && CheckThreatOK(pVictim))
                    return pVictim;
            }
        }

        // Who am I attacking.
        if (Unit* pVictim = me->GetVictim())
        {
            if (IsValidHostileTarget(pVictim) && CheckThreatOK(pVictim))
                return pVictim;
        }

        // Check if other group members are under attack.
        if (Unit* pPartyAttacker = SelectPartyAttackTarget())
            return pPartyAttacker;
    }

    // Assist pet if its in combat.
    if (Pet* pPet = me->GetPet())
    {
        if (Unit* pPetAttacker = pPet->GetAttackerForHelper())
            if (IsValidHostileTarget(pPetAttacker) && CheckThreatOK(pPetAttacker))
                return pPetAttacker;
    }

    return nullptr;
}

Unit* PartyBotAI::SelectPartyAttackTarget() const
{
    Unit* pPartyAttacker = nullptr;

    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            for (const auto pAttacker : pMember->GetAttackers())
            {
                if (pPartyAttacker && pPartyAttacker->GetHealth() <= pAttacker->GetHealth())
                    continue;

                if (IsValidHostileTarget(pAttacker) && CheckThreatOK(pAttacker))
                    pPartyAttacker = pAttacker;
            }

            if (Pet* pPet = pMember->GetPet())
            {
                for (const auto pAttacker : pPet->GetAttackers())
                {
                    if (pPartyAttacker && pPartyAttacker->GetHealth() <= pAttacker->GetHealth())
                        continue;

                    if (IsValidHostileTarget(pAttacker) && CheckThreatOK(pAttacker))
                        pPartyAttacker = pAttacker;
                }
            }
        }
    }

    return pPartyAttacker;
}

Unit* PartyBotAI::SelectDispelAttackerTarget(SpellEntry const* pSpellEntry) const
{
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            for (const auto pAttacker : pMember->GetAttackers())
            {
                if (IsValidDispelTarget(pAttacker, pSpellEntry) && CheckThreatOK(pAttacker))
                    return pAttacker;
            }
        }
    }

    return nullptr;
}

Unit* PartyBotAI::SelectPartyDefendTarget(Unit* pSelectingFor) const
{
    Group* pGroup = me->GetGroup();
    std::set<Unit*> otherTankVictims;
    // TODO: Replace sets with priority list
    std::set<Unit*> attackingHealer;
    std::set<Unit*> attackingNonTank;
    std::set<Unit*> attackingOtherTank;
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember == pSelectingFor)
                continue;

            CombatBotRoles role = GetRoleByMember(pMember);
            bool isTank = role == ROLE_TANK;
            bool isHealer = role == ROLE_HEALER;
            if (isTank)
            {
                if (Unit* pTankVictim = pMember->GetVictim())
                    otherTankVictims.insert(pTankVictim);
            }

            for (const auto pAttacker : pMember->GetAttackers())
            {
                if (isTank)
                    attackingOtherTank.insert(pAttacker);
                else if (isHealer)
                    attackingHealer.insert(pAttacker);
                else
                    attackingNonTank.insert(pAttacker);
            }

            if (Pet* pPet = pMember->GetPet())
            {
                if (pPet == pSelectingFor)
                    continue;

                bool petIsTank = GetRoleByPet(pMember, pPet) == ROLE_TANK;
                if (petIsTank)
                {
                    if (Unit* pTankVictim = pPet->GetVictim())
                        otherTankVictims.insert(pTankVictim);
                }

                for (const auto pAttacker : pPet->GetAttackers())
                {
                    if (petIsTank)
                        attackingOtherTank.insert(pAttacker);
                    else
                        attackingNonTank.insert(pAttacker);
                }
            }
        }
    }

    // Attackers attacking members that are healers, and aren't the victim of another tank
    for (Unit* pAttacker : attackingHealer)
    {
        if (otherTankVictims.count(pAttacker) == 0 && IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Attackers attacking members that aren't tanks/healers, and aren't the victim of another tank
    for (Unit* pAttacker : attackingNonTank)
    {
        if (otherTankVictims.count(pAttacker) == 0 && IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Attackers attacking members that are other tanks, and aren't the victim of another tank - with load balancing
    uint32 attackingMe = static_cast<uint32>(me->GetAttackers().size());
    Unit* bestCandidate = nullptr; // The one that helps balance the most
    uint32 bestDelta = 1; // how many more mobs the other tank has
    for (Unit* pAttacker : attackingOtherTank)
    {
        if (otherTankVictims.count(pAttacker) > 0)
            continue;

        Unit* victimTank = pAttacker->GetVictim();
        uint32 attackingTank = static_cast<uint32>(victimTank->GetAttackers().size());

        // Look for the attacker that closes the biggest attacker difference
        if ((attackingTank > bestDelta + attackingMe) && IsValidHostileTarget(pAttacker))
        {
            bestDelta = attackingTank - attackingMe;
            bestCandidate = pAttacker;
        }
    }
    if (bestCandidate)
        return bestCandidate;

    // Attackers attacking pSelectingFor, and aren't the victim of another tank
    Unit* pFound = nullptr;
    uint32 lowThreatDiff = 0.0f;
    for (Unit* pAttacker : pSelectingFor->GetAttackers())
    {
        if (otherTankVictims.count(pAttacker) > 0)
            continue;

        float myThreat = pAttacker->GetThreatManager().getThreat(pSelectingFor);
        float otherThreat = 0.0f;
        ThreatList const& threatlist = pAttacker->GetThreatManager().getThreatList();
        if (!threatlist.empty())
        {
            for (HostileReference* pHostile : threatlist)
            {
                if (pHostile->getTarget() == pSelectingFor)
                    continue;
                else
                {
                    otherThreat = pHostile->getThreat();
                    break;
                }
            }
        }
        float threatDiff = myThreat - otherThreat;
        if (!pFound || threatDiff < lowThreatDiff)
        {
            if (IsValidHostileTarget(pAttacker))
            {
                pFound = pAttacker;
                lowThreatDiff = threatDiff;
            }
        }
    }
    return pFound;
}

Player* PartyBotAI::SelectResurrectionTarget() const
{
    if (IsInDuel())
        return nullptr;

    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // Can't resurrect self.
            if (pMember == me)
                continue;

            if (pMember->GetDeathState() != CORPSE)
                continue;

            if (!me->IsWithinLOSInMap(pMember))
                continue;

            if (m_resurrectionSpell->IsTargetInRange(me, pMember))
                return pMember;
        }
    }

    return nullptr;
}

Player* PartyBotAI::SelectShieldTarget() const
{
    if (IsInDuel())
        return nullptr;

    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // We already checked self.
            if (pMember == me)
                continue;

            if ((pMember->GetHealthPercent() < 40.0f) &&
                !pMember->GetAttackers().empty() &&
                !pMember->IsImmuneToMechanic(MECHANIC_SHIELD))
                return pMember;
        }
    }

    return nullptr;
}

Unit* PartyBotAI::SelectBuffTargetByRole(SpellEntry const* pSpellEntry, CombatBotRoles role) const
{
    for (Player* pMember : FindAllPlayersInGroupByRole(role, true))
    {
        if (me->IsValidHelpfulTarget(pMember) &&
            !pMember->IsGameMaster() &&
            IsValidBuffTarget(pMember, pSpellEntry) &&
            me->IsWithinLOSInMap(pMember) &&
            me->IsWithinDist(pMember, 30.0f, true, SizeFactor::CombatReach))
            return pMember;
    }

    return nullptr;
}

void PartyBotAI::EvaluateRebuffTarget(SpellEntry const* pSpellEntry, RebuffCandidate& bestCandidate, bool asCaster, Unit* pTarget)
{
    if (me->GetPowerPercent(POWER_MANA) == 100.0f)
    {
        if (!pTarget)
            pTarget = SelectRebuffTarget(pSpellEntry);

        if (pTarget)
        {
            SpellAuraHolder* auraHolder;
            if (asCaster)
                auraHolder = pTarget->GetSpellAuraHolder(pSpellEntry->Id, me->GetObjectGuid());
            else
                auraHolder = pTarget->GetSpellAuraHolder(pSpellEntry->Id);

            if (auraHolder && auraHolder->GetAuraDuration() < auraHolder->GetAuraMaxDuration() / 2)
            {
                int32 duration = auraHolder->GetAuraDuration();
                if (bestCandidate.target == nullptr || duration < bestCandidate.auraDuration)
                    bestCandidate = {pTarget, pSpellEntry, duration};
            }
        }
    }
}

void PartyBotAI::EvaluateRebuffTargetForAuraHolder(SpellEntry const* pSpellEntry, RebuffCandidate& bestCandidate, SpellAuraHolder* auraHolder)
{
    if (me->GetPowerPercent(POWER_MANA) == 100.0f && auraHolder->GetAuraDuration() < auraHolder->GetAuraMaxDuration() / 2)
    {
        Unit* pTarget = auraHolder->GetTarget();
        int32 duration = auraHolder->GetAuraDuration();
        if (bestCandidate.target == nullptr || duration < bestCandidate.auraDuration)
            bestCandidate = {pTarget, pSpellEntry, duration};
    }
}

bool PartyBotAI::CrowdControlMarkedTargets()
{
    SpellEntry const* pSpellEntry = GetCrowdControlSpell();
    if (!pSpellEntry)
        return false;

    for (auto mark : m_marksToCC)
    {
        if (Unit* pTarget = GetMarkedTarget(mark))
        {
            if (!pTarget->HasUnitState(UNIT_STATE_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                IsValidHostileTarget(pTarget) && !AreOthersOnSameTarget(pTarget->GetObjectGuid()))
            {
                if (CanTryToCastSpell(pTarget, pSpellEntry))
                {
                    if (DoCastSpell(pTarget, pSpellEntry) == SPELL_CAST_OK)
                    {
                        me->ClearUnitState(UNIT_STATE_MELEE_ATTACKING);
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

void PartyBotAI::AddToPlayerGroup()
{
    Player* pPlayer = ObjectAccessor::FindPlayer(m_leaderGuid);
    if (!pPlayer || pPlayer == me)
        return;

    Group* group = pPlayer->GetGroup();
    if (!group)
    {
        group = new Group;
        // new group: if can't add then delete
        if (!group->Create(pPlayer->GetObjectGuid(), pPlayer->GetName()))
        {
            delete group;
            return;
        }
        sObjectMgr.AddGroup(group);
    }

    if (me->GetGroup() != group)
    {
        if (me->GetGroup())
            me->RemoveFromGroup();

        group->AddMember(me->GetObjectGuid(), me->GetName());
    } 
}

void PartyBotAI::OnPacketReceived(WorldPacket const* packet)
{
    //printf("Bot received %s\n", LookupOpcodeName(packet->GetOpcode()));
    switch (packet->GetOpcode())
    {
        case SMSG_LEARNED_SPELL:
        case SMSG_SUPERCEDED_SPELL:
        case SMSG_REMOVED_SPELL:
        {
            if (m_initialized)
                m_resetSpellData = true;
            return;
        }
        case SMSG_DUEL_REQUESTED:
        {
            std::unique_ptr<WorldPacket> data = std::make_unique<WorldPacket>(CMSG_DUEL_ACCEPTED, 8);
            *data << me->GetObjectGuid();
            me->GetSession()->QueuePacket(std::move(data));
            return;
        }
    }

    CombatBotBaseAI::OnPacketReceived(packet);
}

void PartyBotAI::OnPlayerLogin()
{
    if (!m_initialized)
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
}

void PartyBotAI::UpdateAI(uint32 const diff)
{
    RecentSpellsUpdate(diff);
    m_buffTimer.Update(diff);
    if (m_buffTimer.Passed())
        m_buffTimer.Reset(0);
    m_clientMovementTimer.Update(diff);
    if (m_clientMovementTimer.Passed())
        m_clientMovementTimer.Reset(0);

    m_updateTimer.Update(diff);
    if (m_updateTimer.Passed())
        m_updateTimer.Reset(PB_UPDATE_INTERVAL);
    else
        return;

    if (!me->IsInWorld() || me->IsBeingTeleported())
        return;

    if (!m_initialized)
    {
        AddToPlayerGroup();
        Player* pLeader = GetPartyLeader();

        if (m_race && m_class) // temporary character
        {
            if (m_level && m_level != me->GetLevel())
            {
                me->GiveLevel(m_level);
                me->InitTalentForLevel();
                me->SetUInt32Value(PLAYER_XP, 0);
            }

            if (!m_cloneGuid.IsEmpty())
            {
                CloneFromPlayer(sObjectAccessor.FindPlayer(m_cloneGuid));
                AutoAssignRole();
            }
            else
            {
                LearnPremadeSpecForClass();

                if (m_role == ROLE_INVALID)
                    AutoAssignRole();

                AutoEquipGear(sWorld.getConfig(CONFIG_UINT32_PARTY_BOT_AUTO_EQUIP));

                // fix client bug causing some item slots to not be visible
                if (Player* pLeader = GetPartyLeader())
                {
                    me->SetVisibility(VISIBILITY_OFF);
                    pLeader->UpdateVisibilityOf(pLeader, me);
                    me->SetVisibility(VISIBILITY_ON);
                }
            }
            me->UpdateSkillsToMaxSkillsForLevel();
        }
        else if (me == pLeader)
        {
            if (m_role == ROLE_INVALID)
                AutoAssignRole();
            m_noClient = false;
            m_noTeleport = true;
            m_noGenerateItems = true;
            pLeader->m_stackTrackers = true;
        }
        else // loaded from db
        {
            if (m_role == ROLE_INVALID)
                AutoAssignRole();

            if (me->IsGameMaster())
                me->SetGameMaster(false);

            me->TeleportTo(m_mapId, m_x, m_y, m_z, m_o);
        }

        ResetSpellData();
        PopulateSpellData();
        AddAllSpellReagents();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
        SummonPetIfNeeded();
        me->SetHealthPercent(100.0f);
        me->SetPowerPercent(me->GetPowerType(), 100.0f);

        uint32 newzone, newarea;
        me->GetZoneAndAreaId(newzone, newarea);
        me->UpdateZone(newzone, newarea);

        me->PMonsterSay("I'm a %s", BotRoleToString(this->GetRole()));

        m_initialized = true;
        return;
    }

    if (m_resetSpellData)
    {
        me->MonsterSay("I'm learning");
        ResetSpellData();
        PopulateSpellData();
        m_resetSpellData = false;
    }

    Player* pLeader = GetPartyLeader();
    if (!pLeader)
    {
        botEntry->requestRemoval = true;
        return;
    }

    if (!me->GetGroup())
    {
        return;
    }
    m_groupData = GetGroupData(me);

    if (!pLeader->IsInWorld())
        return;

    if (pLeader->InBattleGround() &&
        !me->InBattleGround())
    {
        if (m_receivedBgInvite)
        {
            SendBattlefieldPortPacket();
            m_receivedBgInvite = false;
            return;
        }
        
        // Remain idle until we can join battleground.
        return;
    }

    if (me->IsTaxiFlying())
        return;
    else if (pLeader->IsTaxiFlying())
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            me->GetMotionMaster()->Clear(false, true);
            me->GetMotionMaster()->MoveIdle();
        }
        return;
    }

    if (me->HasUnitState(UNIT_STATE_FEIGN_DEATH) && me->HasAuraType(SPELL_AURA_FEIGN_DEATH) &&
       !me->IsInCombat() && (!me->GetPet() || !me->GetPet()->IsInCombat()) &&
       !me->SelectRandomUnfriendlyTarget(nullptr, 20.0f, false, true))
        me->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    if (me->HasUnitState(UNIT_STATE_CAN_NOT_REACT_OR_LOST_CONTROL))
        return;

    if (me->IsDead())
    {
        if (me->InBattleGround())
        {
            if (me->GetDeathState() == CORPSE)
            {
                me->BuildPlayerRepop();
                me->RepopAtGraveyard();
            }
        }
        else
        {
            if (ShouldAutoRevive())
            {
                me->ResurrectPlayer(0.5f);
                me->SpawnCorpseBones();
                me->CastSpell(me, PB_SPELL_HONORLESS_TARGET, true);
            }
        }
        
        return;
    }

    // Greater blessing of salvation
    if (GetRole() == ROLE_TANK && me->HasAura(25895))
        me->RemoveAurasDueToSpellByCancel(25895);

    if (me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        // Stop auto shot if no target, too close, or too much threat
        if (!me->GetVictim() || (me->GetClass() == CLASS_HUNTER && me->GetCombatDistance(me->GetVictim()) < 8.0f) || !CheckThreatOK(me->GetVictim()))
        {
            me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL, true);
        }
    }

    if (Spell* pCurrentSpell = me->GetCurrentSpell(CURRENT_GENERIC_SPELL))
    {
        // Interrupt pre casted heals if target is not injured.
        if (pCurrentSpell->getState() == SPELL_STATE_PREPARING &&
            pCurrentSpell->m_spellInfo->IsHealSpell())
        {
            if (Unit* pTarget = pCurrentSpell->m_targets.getUnitTarget())
            {
                float basePoints = CalculateHealValue(me, pTarget, pCurrentSpell->m_spellInfo);
                if (pTarget->GetHealth() >= pTarget->GetMaxHealth() * 0.9f || (pTarget->GetHealth() + basePoints) >= (pTarget->GetMaxHealth() * 1.2f))
                {
                    me->InterruptSpell(CURRENT_GENERIC_SPELL, true);
                }
            }
        }
    }

    if (me->IsNonMeleeSpellCasted(false, false, true))
        return;

    if (me->GetTargetGuid() == me->GetObjectGuid())
        me->ClearTarget();

    if (!me->IsInCombat())
    {
        if (DrinkAndEat())
        {
            if (!me->IsWithinDistInMap(pLeader, 100.0f))
            {
                me->SetHealth(me->GetMaxHealth());
                if (me->GetPowerType() == POWER_MANA)
                    me->SetPower(POWER_MANA, me->GetMaxPower(POWER_MANA));
            }
            else if (me->IsMounted())
                me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
            return;
        }

        // Teleport to leader if too far away.
        if (!m_noTeleport && !DoNotMove() && !me->IsWithinDistInMap(pLeader, 100.0f) && !IsInDuel())
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear(false, true);
            me->GetMotionMaster()->MoveIdle();
            char name[128] = {};
            strcpy(name, pLeader->GetName());
            ChatHandler(me).HandleGonameCommand(name);
            return;
        }
    }

    if (me->GetStandState() != UNIT_STAND_STATE_STAND && !me->IsAFK())
        me->SetStandState(UNIT_STAND_STATE_STAND);

    if (!me->IsInCombat() && !me->IsMounted())
    {
        UpdateOutOfCombatAI();

        if (m_isBuffing)
            return;

        if (me->IsNonMeleeSpellCasted())
            return;
    }

    bool moveToLos = false;
    if (!m_groupData->losPosition.IsEmpty() && !me->HasUnitState(UNIT_STATE_CAN_NOT_MOVE) && me->GetDistance2d(m_groupData->losPosition) < 60.0f)
    {
        for (auto const& pAttacker : me->GetAttackers())
        {
            if (!pAttacker->IsWithinLOS(m_groupData->losPosition.x, m_groupData->losPosition.y, m_groupData->losPosition.z))
            {
                moveToLos = true;
                break;
            }
        }
        if (!moveToLos)
        {
            if (Pet* pPet = me->GetPet())
            {
                for (auto const& pAttacker : pPet->GetAttackers())
                {
                    if (!pAttacker->IsWithinLOS(m_groupData->losPosition.x, m_groupData->losPosition.y, m_groupData->losPosition.z))
                    {
                        moveToLos = true;
                        pPet->GetCharmInfo()->SetReactState(REACT_PASSIVE);
                        pPet->HandlePetCommand(COMMAND_FOLLOW, nullptr);
                        break;
                    }
                }
            }
        }
    }
    if (moveToLos)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "UpdateAI - %s moveToLos", me->GetName());
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != IDLE_MOTION_TYPE)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "UpdateAI - %s moveToLos set", me->GetName());
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
        }
        MovePoint(m_groupData->losPosition.x, m_groupData->losPosition.y, m_groupData->losPosition.z);
        return;
    }

    Unit* pVictim = me->GetVictim();
    if (pVictim)
    {
        if (GetRole() != ROLE_TANK)
        {
            if (Unit* pTarget = SelectAttackTarget(pLeader))
            {
                if (pVictim != pTarget)
                {
                    me->AttackStop();
                    AttackStart(pTarget);
                    return;
                }
            }
        }
    }
    else
    {
        if (Unit* pTarget = SelectAttackTarget(pLeader))
        {
            AttackStart(pTarget);
            return;
        }
    }

    if (!me->IsInCombat())
    {
        // Mount if leader is mounted and we don't have a target.
        if (pLeader->IsMounted() && !me->GetVictim())
        {
            if (!me->IsMounted())
            {
                // Leave shapeshift before mounting.
                if (me->IsInDisallowedMountForm() &&
                    me->GetDisplayId() != me->GetNativeDisplayId() &&
                    me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
                    me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);

                auto auraList = pLeader->GetAurasByType(SPELL_AURA_MOUNTED);
                if (!auraList.empty())
                {
                    bool oldStateCastTime = me->HasCheatOption(PLAYER_CHEAT_NO_CAST_TIME);
                    bool oldStatePower = me->HasCheatOption(PLAYER_CHEAT_NO_POWER);
                    me->SetCheatOption(PLAYER_CHEAT_NO_CAST_TIME, true);
                    me->SetCheatOption(PLAYER_CHEAT_NO_POWER, true);
                    me->CastSpell(me, (*auraList.begin())->GetId(), true);
                    me->SetCheatOption(PLAYER_CHEAT_NO_CAST_TIME, oldStateCastTime);
                    me->SetCheatOption(PLAYER_CHEAT_NO_POWER, oldStatePower);
                } 
            }
        }
        else if (me->IsMounted())
            me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
    }

    if (!me->IsMoving() || me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE)
    {
        if (!pVictim)
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE && me != pLeader)
                MoveFollow(pLeader);
        }
        else
        {
            if (!me->HasUnitState(UNIT_STATE_MELEE_ATTACKING) &&
               (GetRole() == ROLE_MELEE_DPS || m_role == ROLE_TANK) &&
                !me->HasAuraType(SPELL_AURA_MOD_STEALTH) &&
                IsValidHostileTarget(pVictim) &&
                AttackStart(pVictim))
                return;

            switch (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
            {
                case IDLE_MOTION_TYPE:
                case FOLLOW_MOTION_TYPE:
                    {
                        bool chase = GetRole() == ROLE_MELEE_DPS || GetRole() == ROLE_TANK || me->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE || !me->IsWithinLOSInMap(pVictim);
                        if ((GetRole() == ROLE_MELEE_DPS || GetRole() == ROLE_TANK) && me->CanReachWithMeleeAutoAttack(pVictim))
                            chase = false;
                        if (chase)
                        {
                            MoveChase(pVictim, 1.0f, GetRole() == ROLE_MELEE_DPS ? 3.0f : 0.0f);
                        }
                    }
                    break;
                default:
                    if (!me->IsWithinLOSInMap(pVictim))
                    {
                        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
                            me->SetCasterChaseDistance(3.0f * me->GetDistance2d(pVictim) / 4.0f);
                        else
                            MoveChase(pVictim);
                    }
                    break;
            }

            if ((GetRole() == ROLE_MELEE_DPS || m_role == ROLE_TANK) && pVictim->GetVictim() != me)
                StayBehind(pVictim);
        }
    }

    if (Pet* pPet = me->GetPet())
    {
        if (me->IsInCombat() || pPet->IsInCombat())
            UpdateInCombatPetAI();
    }

    if (me->IsInCombat())
        UpdateInCombatAI();
}


void PartyBotAI::UpdateOutOfCombatAI()
{
    SafeSpotsUpdate();

    if (!IsInDuel())
    {
        if (m_resurrectionSpell)
            if (Player* pTarget = SelectResurrectionTarget())
                if (CanTryToCastSpell(pTarget, m_resurrectionSpell))
                    if (DoCastSpell(pTarget, m_resurrectionSpell) == SPELL_CAST_OK)
                        return;

        if (m_role != ROLE_TANK && me->GetVictim() && CrowdControlMarkedTargets())
            return;
    }

    switch (me->GetClass())
    {
        case CLASS_PALADIN:
            UpdateOutOfCombatAI_Paladin();
            break;
        case CLASS_SHAMAN:
            UpdateOutOfCombatAI_Shaman();
            break;
        case CLASS_HUNTER:
            UpdateOutOfCombatAI_Hunter();
            break;
        case CLASS_MAGE:
            UpdateOutOfCombatAI_Mage();
            break;
        case CLASS_PRIEST:
            UpdateOutOfCombatAI_Priest();
            break;
        case CLASS_WARLOCK:
            UpdateOutOfCombatAI_Warlock();
            break;
        case CLASS_WARRIOR:
            UpdateOutOfCombatAI_Warrior();
            break;
        case CLASS_ROGUE:
            UpdateOutOfCombatAI_Rogue();
            break;
        case CLASS_DRUID:
            UpdateOutOfCombatAI_Druid();
            break;
    }

    m_isBuffing = !m_buffTimer.Passed();
}

void PartyBotAI::UpdateInCombatAI()
{
    if (!IsInDuel())
    {
        if (m_role == ROLE_TANK)
        {
            Unit* pVictim = me->GetVictim();

            // Defend party members.
            if (Unit* pTarget = SelectPartyDefendTarget(me))
            {
                me->AttackStop(true);
                AttackStart(pTarget);
                pVictim = pTarget;
            }

            // Taunt target if its attacking someone else.
            if (pVictim && pVictim->GetVictim() != me)
            {
                for (const auto& pSpellEntry : m_spellListTaunt)
                {
                    if (CanTryToCastSpell(pVictim, pSpellEntry))
                    {
                        if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }
        else if (CrowdControlMarkedTargets())
            return;
    }

    switch (me->GetClass())
    {
        case CLASS_PALADIN:
            UpdateInCombatAI_Paladin();
            break;
        case CLASS_SHAMAN:
            UpdateInCombatAI_Shaman();
            break;
        case CLASS_HUNTER:
            UpdateInCombatAI_Hunter();
            break;
        case CLASS_MAGE:
            UpdateInCombatAI_Mage();
            break;
        case CLASS_PRIEST:
            UpdateInCombatAI_Priest();
            break;
        case CLASS_WARLOCK:
            UpdateInCombatAI_Warlock();
            break;
        case CLASS_WARRIOR:
            UpdateInCombatAI_Warrior();
            break;
        case CLASS_ROGUE:
            UpdateInCombatAI_Rogue();
            break;
        case CLASS_DRUID:
            UpdateInCombatAI_Druid();
            break;
    }

    if (me->GetVictim())
        UseTrinketEffects();
}

void PartyBotAI::UpdateOutOfCombatAI_Paladin()
{
    RebuffCandidate bestCandidate;

    if (m_spells.paladin.pCleanse)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.paladin.pCleanse))
        {
            if (CanTryToCastSpell(pFriend, m_spells.paladin.pCleanse))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pCleanse) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }
    else if (m_spells.paladin.pPurify)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.paladin.pPurify))
        {
            if (CanTryToCastSpell(pFriend, m_spells.paladin.pPurify))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pPurify) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }

    std::vector<SpellEntry const*> auras = {m_spells.paladin.pAura, m_spells.paladin.pDevotionAura, m_spells.paladin.pRetributionAura, m_spells.paladin.pSanctityAura, m_spells.paladin.pConcentrationAura};
    for (SpellEntry const* spell : auras)
    {
        if (!spell)
            continue;

        if (me->GetSpellAuraHolder(spell->Id, me->GetGUIDLow()))
            break; // I'm already providing an aura

        if (me->GetSpellAuraHolder(spell->Id))
            continue;

        if (CanTryToCastSpell(me, spell) && DoCastSpell(me, spell) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
    }

    if (m_role == ROLE_TANK &&
        m_spells.paladin.pRighteousFury &&
        CanTryToCastSpell(me, m_spells.paladin.pRighteousFury))
    {
        if (DoCastSpell(me, m_spells.paladin.pRighteousFury) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
    }

    // TODO: Cache lists
    std::vector<SpellEntry const*> blessingsTank = {
        m_spells.paladin.pGreaterBlessingOfKings, m_spells.paladin.pBlessingOfKings,
        m_spells.paladin.pGreaterBlessingOfMight, m_spells.paladin.pBlessingOfMight,
        m_spells.paladin.pGreaterBlessingOfSanctuary, m_spells.paladin.pBlessingOfSanctuary,
        m_spells.paladin.pGreaterBlessingOfLight, m_spells.paladin.pBlessingOfLight,
        m_spells.paladin.pGreaterBlessingOfWisdom, m_spells.paladin.pBlessingOfWisdom};
    std::vector<SpellEntry const*> blessingsMeleeDps = {
        m_spells.paladin.pGreaterBlessingOfSalvation, m_spells.paladin.pBlessingOfSalvation,
        m_spells.paladin.pGreaterBlessingOfMight, m_spells.paladin.pBlessingOfMight,
        m_spells.paladin.pGreaterBlessingOfKings, m_spells.paladin.pBlessingOfKings,
        m_spells.paladin.pGreaterBlessingOfLight, m_spells.paladin.pBlessingOfLight,
        m_spells.paladin.pGreaterBlessingOfWisdom, m_spells.paladin.pBlessingOfWisdom};
    std::vector<SpellEntry const*> blessingsRangedDps = {
        m_spells.paladin.pGreaterBlessingOfSalvation, m_spells.paladin.pBlessingOfSalvation,
        m_spells.paladin.pGreaterBlessingOfKings, m_spells.paladin.pBlessingOfKings,
        m_spells.paladin.pGreaterBlessingOfWisdom, m_spells.paladin.pBlessingOfWisdom,
        m_spells.paladin.pGreaterBlessingOfLight, m_spells.paladin.pBlessingOfLight,
        m_spells.paladin.pGreaterBlessingOfMight, m_spells.paladin.pBlessingOfMight};
    std::vector<SpellEntry const*> blessingsHealer = {
        m_spells.paladin.pGreaterBlessingOfWisdom, m_spells.paladin.pBlessingOfWisdom,
        m_spells.paladin.pGreaterBlessingOfSalvation, m_spells.paladin.pBlessingOfSalvation,
        m_spells.paladin.pGreaterBlessingOfKings, m_spells.paladin.pBlessingOfKings,
        m_spells.paladin.pGreaterBlessingOfLight, m_spells.paladin.pBlessingOfLight,
        m_spells.paladin.pGreaterBlessingOfMight, m_spells.paladin.pBlessingOfMight};
    for (Player* pMember : FindAllPlayersInGroup(true))
    {
        CombatBotRoles role = GetRoleByMember(pMember);

        std::vector<SpellEntry const*> const& blessings =
            (role == ROLE_TANK         ? blessingsTank :
             role == ROLE_MELEE_DPS    ? blessingsMeleeDps :
             role == ROLE_RANGE_DPS    ? blessingsRangedDps :
                                         blessingsHealer);
        for (SpellEntry const* spell : blessings)
        {
            if (!spell)
                continue;

            CombatBotRoles majorityRoleForClass = FindMajorityRoleForClass(static_cast<Classes>(pMember->GetClass()));
            if (role != majorityRoleForClass && spell->GetMaxDuration() > 300000)
                continue;

            if (SpellAuraHolder * auraHolder = pMember->GetSpellAuraHolder(spell->Id, me->GetGUIDLow()))
            {
                EvaluateRebuffTargetForAuraHolder(spell, bestCandidate, auraHolder);
                break; // already blessed by me
            }

            if (IsValidSelectBuffTarget(pMember, spell) && CanTryToCastSpell(pMember, spell))
            {
                SpellCastResult result = DoCastSpell(pMember, spell);
                if (result == SPELL_CAST_OK || (result == SPELL_FAILED_ITEM_NOT_READY && spell->Reagent[0] && !m_noGenerateItems))
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }

        if (Pet* pPet = pMember->GetPet())
        {
            CombatBotRoles petRole = GetRoleByPet(pMember, pPet);
            std::vector<SpellEntry const*> const& petBlessings =
                (petRole == ROLE_TANK      ? blessingsTank :
                 petRole == ROLE_MELEE_DPS ? blessingsMeleeDps :
                 petRole == ROLE_RANGE_DPS ? blessingsRangedDps :
                                             blessingsHealer);
            for (SpellEntry const* spell : petBlessings)
            {
                if (!spell)
                    continue;

                if (SpellAuraHolder* auraHolder = pPet->GetSpellAuraHolder(spell->Id, me->GetGUIDLow()))
                {
                    EvaluateRebuffTargetForAuraHolder(spell, bestCandidate, auraHolder);
                    break; // already blessed by me
                }

                if (IsValidSelectBuffTarget(pPet, spell) && CanTryToCastSpell(pPet, spell))
                {
                    SpellCastResult result = DoCastSpell(pPet, spell);
                    if (result == SPELL_CAST_OK || (result == SPELL_FAILED_ITEM_NOT_READY && spell->Reagent[0] && !m_noGenerateItems))
                    {
                        m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                        me->ClearTarget();
                        return;
                    }
                }
            }  
        }
    }

    if (bestCandidate.target && bestCandidate.spell)
    {
        if (DoCastSpell(bestCandidate.target, bestCandidate.spell) == SPELL_CAST_OK)
        {
            me->ClearTarget();
            return;
        }
    }

    if (m_role == ROLE_HEALER && !me->IsMoving())
    {
        if (FindAndHealInjuredAlly())
            return;
    }
}

void PartyBotAI::UpdateInCombatAI_Paladin()
{
    if (m_spells.paladin.pDivineShield &&
       (me->GetHealthPercent() < 20.0f) &&
       (m_role != ROLE_TANK) &&
        CanTryToCastSpell(me, m_spells.paladin.pDivineShield))
    {
        if (DoCastSpell(me, m_spells.paladin.pDivineShield) == SPELL_CAST_OK)
            return;
    }

    if (Unit* pFriend = me->FindLowestHpFriendlyUnit(30.0f, 70, true, me))
    {
        if (m_spells.paladin.pBlessingOfProtection &&
           !IsPhysicalDamageClass(pFriend->GetClass()) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pBlessingOfSacrifice &&
           (me->GetHealthPercent() > 80.0f) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pLayOnHands &&
           (pFriend->GetHealthPercent() < 15.0f) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pLayOnHands))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pLayOnHands) == SPELL_CAST_OK)
                return;
        }
    }

    if (m_spells.paladin.pCleanse)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.paladin.pCleanse))
        {
            if (CanTryToCastSpell(pFriend, m_spells.paladin.pCleanse))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pCleanse) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    else if (m_spells.paladin.pPurify)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.paladin.pPurify))
        {
            if (CanTryToCastSpell(pFriend, m_spells.paladin.pPurify))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pPurify) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (!me->GetAttackers().empty())
    {
        if (m_spells.paladin.pHolyShield &&
            CanTryToCastSpell(me, m_spells.paladin.pHolyShield))
        {
            if (DoCastSpell(me, m_spells.paladin.pHolyShield) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.paladin.pTurnEvil &&
            m_role != ROLE_TANK)
        {
            Unit* pAttacker = SelectAttackerDifferentFrom(me->GetVictim());
            if (pAttacker && pAttacker->GetCreatureType() == CREATURE_TYPE_UNDEAD &&
                CanTryToCastSpell(pAttacker, m_spells.paladin.pTurnEvil))
            {
                if (DoCastSpell(pAttacker, m_spells.paladin.pTurnEvil) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (GetRole() == ROLE_HEALER)
    {
        if (m_spells.paladin.pHolyShock &&
            me->GetHealthPercent() < 50.0f &&
            CanTryToCastSpell(me, m_spells.paladin.pHolyShock))
        {
            if (m_spells.paladin.pDivineFavor &&
                CanTryToCastSpell(me, m_spells.paladin.pDivineFavor))
            {
                DoCastSpell(me, m_spells.paladin.pDivineFavor);
            }

            if (DoCastSpell(me, m_spells.paladin.pHolyShock) == SPELL_CAST_OK)
                return;
        }

        if (FindAndHealInjuredAlly(80.0f, 90.0f))
            return;

        if (FindAndPreHealTarget())
            return;
    }
    else
    {
        if (m_spells.paladin.pLayOnHands &&
           (me->GetHealthPercent() < 15.0f) &&
            CanTryToCastSpell(me, m_spells.paladin.pLayOnHands))
        {
            if (DoCastSpell(me, m_spells.paladin.pLayOnHands) == SPELL_CAST_OK)
                return;
        }

        float healAt = 25.0;
        if (!ExistsAsHealerInGroupForOffHealCheck())
            healAt += 20.0;
        if (!me->GetAttackers().empty())
            healAt -= 20.0;
        if (FindAndHealInjuredAlly(healAt, healAt))
            return;

        bool const hasSeal = m_spells.paladin.pSeal && me->HasAura(m_spells.paladin.pSeal->Id);

        if (!hasSeal &&
            m_spells.paladin.pSeal &&
            CanTryToCastSpell(me, m_spells.paladin.pSeal))
        {
            me->CastSpell(me, m_spells.paladin.pSeal, false);
        }

        if (Unit* pVictim = me->GetVictim())
        {
            if (hasSeal && m_spells.paladin.pJudgement &&
               (me->GetPowerPercent(POWER_MANA) > 30.0f) &&
                CanTryToCastSpell(pVictim, m_spells.paladin.pJudgement))
            {
                if (DoCastSpell(pVictim, m_spells.paladin.pJudgement) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pHammerOfJustice &&
               (pVictim->IsNonMeleeSpellCasted() ||
               (me->GetHealthPercent() < 20.0f && !me->GetAttackers().empty())) &&
                CanTryToCastSpell(pVictim, m_spells.paladin.pHammerOfJustice))
            {
                if (DoCastSpell(pVictim, m_spells.paladin.pHammerOfJustice) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pHammerOfWrath &&
                pVictim->GetHealthPercent() < 20.0f &&
                CanTryToCastSpell(pVictim, m_spells.paladin.pHammerOfWrath))
            {
                if (DoCastSpell(pVictim, m_spells.paladin.pHammerOfWrath) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pConsecration &&
               (GetAttackersInRangeCount(10.0f) > 2) &&
                CanTryToCastSpell(me, m_spells.paladin.pConsecration))
            {
                if (DoCastSpell(me, m_spells.paladin.pConsecration) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pHolyShock &&
                CanTryToCastSpell(pVictim, m_spells.paladin.pHolyShock))
            {
                if (m_spells.paladin.pDivineFavor &&
                    CanTryToCastSpell(me, m_spells.paladin.pDivineFavor))
                {
                    DoCastSpell(me, m_spells.paladin.pDivineFavor);
                }

                if (DoCastSpell(pVictim, m_spells.paladin.pHolyShock) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pExorcism &&
                pVictim->IsCreature() &&
                (pVictim->GetCreatureType() == CREATURE_TYPE_UNDEAD) &&
                CanTryToCastSpell(pVictim, m_spells.paladin.pExorcism))
            {
                if (DoCastSpell(pVictim, m_spells.paladin.pExorcism) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pHolyWrath &&
                pVictim->IsCreature() &&
               (pVictim->GetCreatureType() == CREATURE_TYPE_UNDEAD ||
                pVictim->GetCreatureType() == CREATURE_TYPE_DEMON) &&
               (me->GetAttackers().size() < 3) && // too much pushback
                CanTryToCastSpell(pVictim, m_spells.paladin.pHolyWrath))
            {
                if (DoCastSpell(pVictim, m_spells.paladin.pHolyWrath) == SPELL_CAST_OK)
                    return;
            }
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
                && !me->CanReachWithMeleeAutoAttack(pVictim))
            {
                MoveChase(pVictim);
            }
        }
    }

    if (m_spells.paladin.pBlessingOfFreedom &&
       (me->HasUnitState(UNIT_STATE_ROOT) || me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED)) &&
        CanTryToCastSpell(me, m_spells.paladin.pBlessingOfFreedom))
    {
        if (DoCastSpell(me, m_spells.paladin.pBlessingOfFreedom) == SPELL_CAST_OK)
            return;
    }
    
    if (GetRole() != ROLE_HEALER &&
        me->GetHealthPercent() < 30.0f)
        HealInjuredTarget(me);
}

void PartyBotAI::UpdateOutOfCombatAI_Shaman()
{
    if (m_spells.shaman.pCureDisease)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.shaman.pCureDisease))
        {
            if (CanTryToCastSpell(pFriend, m_spells.shaman.pCureDisease))
            {
                if (DoCastSpell(pFriend, m_spells.shaman.pCureDisease) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.shaman.pCurePoison)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.shaman.pCurePoison))
        {
            if (CanTryToCastSpell(pFriend, m_spells.shaman.pCurePoison))
            {
                if (DoCastSpell(pFriend, m_spells.shaman.pCurePoison) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.shaman.pWeaponBuff &&
        CanTryToCastSpell(me, m_spells.shaman.pWeaponBuff))
    {
        if (CastWeaponBuff(m_spells.shaman.pWeaponBuff, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.shaman.pLightningShield &&
        CanTryToCastSpell(me, m_spells.shaman.pLightningShield))
    {
        if (DoCastSpell(me, m_spells.shaman.pLightningShield) == SPELL_CAST_OK)
            return;
    }

    if (m_role == ROLE_HEALER &&
        FindAndHealInjuredAlly())
        return;

    if (me->GetVictim())
    {
        if (SummonShamanTotems())
            return;

        UpdateInCombatAI_Shaman();
    }
}

void PartyBotAI::UpdateInCombatAI_Shaman()
{
    if (m_spells.shaman.pManaTideTotem &&
       (me->GetPowerPercent(POWER_MANA) < 50.0f) &&
        CanTryToCastSpell(me, m_spells.shaman.pManaTideTotem))
    {
        if (DoCastSpell(me, m_spells.shaman.pManaTideTotem) == SPELL_CAST_OK)
            return;
    }

    if (GetRole() != ROLE_HEALER)
    {
        if (Unit* pVictim = me->GetVictim())
        {
            if (m_spells.shaman.pElementalMastery &&
                me->GetAttackers().empty() &&
                CanTryToCastSpell(me, m_spells.shaman.pElementalMastery))
            {
                if (DoCastSpell(me, m_spells.shaman.pElementalMastery) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pEarthShock &&
                pVictim->IsNonMeleeSpellCasted(false, false, true) &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pEarthShock))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pEarthShock) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pFrostShock &&
                pVictim->IsMoving() &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pFrostShock))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pFrostShock) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pStormstrike &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pStormstrike))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pStormstrike) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pChainLightning &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pChainLightning))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pChainLightning) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pPurge &&
                IsValidDispelTarget(pVictim, m_spells.shaman.pPurge) &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pPurge))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pPurge) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pFlameShock &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pFlameShock))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pFlameShock) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.shaman.pLightningBolt &&
               (GetRole() == ROLE_RANGE_DPS || !me->CanReachWithMeleeAutoAttack(pVictim)) &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pLightningBolt))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pLightningBolt) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (SummonShamanTotems())
        return;

    if (m_spells.shaman.pCureDisease)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.shaman.pCureDisease))
        {
            if (CanTryToCastSpell(pFriend, m_spells.shaman.pCureDisease))
            {
                if (DoCastSpell(pFriend, m_spells.shaman.pCureDisease) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.shaman.pCurePoison)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.shaman.pCurePoison))
        {
            if (CanTryToCastSpell(pFriend, m_spells.shaman.pCurePoison))
            {
                if (DoCastSpell(pFriend, m_spells.shaman.pCurePoison) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (GetRole() == ROLE_HEALER)
    {
        if (FindAndHealInjuredAlly(50.0f, 90.0f))
            return;

        if (FindAndPreHealTarget())
            return;
    }
    else if (me->GetHealthPercent() < 20.0f)
        HealInjuredTarget(me);
}

void PartyBotAI::UpdateOutOfCombatAI_Hunter()
{
    if (m_spells.hunter.pAspectOfTheHawk &&
        CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
    {
        if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
            return;
    }

    //if (m_spells.hunter.pTrueshotAura && CanTryToCastSpell(me, m_spells.hunter.pTrueshotAura))
    //{
    //    if (DoCastSpell(me, m_spells.hunter.pTrueshotAura) == SPELL_CAST_OK)
    //        return;
    //}

    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.hunter.pHuntersMark && !IsTargetDeathWithinSeconds(pVictim, 10.0f) && CanTryToCastSpell(pVictim, m_spells.hunter.pHuntersMark))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pHuntersMark) == SPELL_CAST_OK)
                return;
        }

        if (Pet* pPet = me->GetPet())
        {
            if (!pPet->GetVictim())
            {
                pPet->GetCharmInfo()->SetIsCommandAttack(true);
                pPet->AI()->AttackStart(pVictim);
                if (!m_noClient && pPet->GetHappinessState() != HappinessState::HAPPY)
                    me->MonsterSay("Pet is not happy");
            }
        }

        UpdateInCombatAI_Hunter();
    }
    else
        SummonPetIfNeeded();
}

void PartyBotAI::UpdateInCombatPetAI()
{
    if (Pet* pPet = me->GetPet())
    {
        if (!pPet->IsDead())
        {
            Unit* pNewPetVictim = nullptr;
            if (GetRoleByPet(me, pPet) == ROLE_TANK)
                pNewPetVictim = SelectPartyDefendTarget(pPet);
            if (!pNewPetVictim)
                pNewPetVictim = SelectAttackTarget(me);

            if (pNewPetVictim && pNewPetVictim != pPet->GetVictim())
            {
                if (pPet->GetVictim())
                    pPet->AttackStop();
                pPet->GetCharmInfo()->SetReactState(REACT_DEFENSIVE);
                pPet->GetCharmInfo()->SetIsCommandAttack(true);
                pPet->AI()->AttackStart(pNewPetVictim);
            }
        }
    }
}

void PartyBotAI::UpdateInCombatAI_Hunter()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            MoveChase(pVictim, 25.0f);
        }

        if (m_spells.hunter.pHuntersMark && !IsTargetDeathWithinSeconds(pVictim, 10.0f) && CanTryToCastSpell(pVictim, m_spells.hunter.pHuntersMark))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pHuntersMark) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pVolley &&
           (me->GetEnemyCountInRadiusAround(pVictim, 10.0f) > 2) &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pVolley))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pVolley) == SPELL_CAST_OK)
                return;
        }

        if (me->HasSpell(PB_SPELL_AUTO_SHOT) &&
            !me->IsMoving() &&
            (me->GetCombatDistance(pVictim) > 8.0f) &&
            !me->IsNonMeleeSpellCasted())
        {
            if (FaceObject(pVictim))
                return;

            switch (me->CastSpell(pVictim, PB_SPELL_AUTO_SHOT, false))
            {
                case SPELL_FAILED_NEED_AMMO:
                case SPELL_FAILED_NO_AMMO:
                {
                    AddHunterAmmo();
                    break;
                }
            }
        }

        if (m_spells.hunter.pConcussiveShot &&
            pVictim->IsMoving() && (pVictim->GetVictim() == me) &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pConcussiveShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pConcussiveShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pAimedShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pAimedShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pAimedShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pArcaneShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pArcaneShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pArcaneShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pSerpentSting && !IsTargetDeathWithinSeconds(pVictim, 10.0f) && CanTryToCastSpell(pVictim, m_spells.hunter.pSerpentSting, false, true))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pSerpentSting) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pMultiShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pMultiShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pMultiShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pRapidFire && CheckThreatOK(pVictim) && CanTryToCastSpell(me, m_spells.hunter.pRapidFire))
        {
            DoCastSpell(me, m_spells.hunter.pRapidFire);
        }

        if (GetAttackersInRangeCount(8.0f))
        {
            Unit* pAttacker = *me->GetAttackers().begin();

            if (m_spells.hunter.pScareBeast &&
                CanTryToCastSpell(pAttacker, m_spells.hunter.pScareBeast))
            {
                if (DoCastSpell(pAttacker, m_spells.hunter.pScareBeast) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.hunter.pDisengage &&
                CanTryToCastSpell(pAttacker, m_spells.hunter.pDisengage))
            {
                if (DoCastSpell(pAttacker, m_spells.hunter.pDisengage) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.hunter.pAspectOfTheMonkey &&
                CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheMonkey))
            {
                if (DoCastSpell(me, m_spells.hunter.pAspectOfTheMonkey) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.hunter.pFeignDeath &&
               (me->GetHealthPercent() < 20.0f) &&
                CanTryToCastSpell(me, m_spells.hunter.pFeignDeath))
            {
                if (DoCastSpell(me, m_spells.hunter.pFeignDeath) == SPELL_CAST_OK)
                    return;
            }
        }

        if (pVictim->CanReachWithMeleeAutoAttack(me))
        {
            if (m_spells.hunter.pWingClip &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pWingClip))
            {
                DoCastSpell(pVictim, m_spells.hunter.pWingClip);
            }

            if (m_spells.hunter.pMongooseBite &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pMongooseBite))
            {
                DoCastSpell(pVictim, m_spells.hunter.pMongooseBite);
            }

            if (m_spells.hunter.pRaptorStrike &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pRaptorStrike))
            {
                DoCastSpell(pVictim, m_spells.hunter.pRaptorStrike);
            }
        }
        else
        {
            if (m_spells.hunter.pAspectOfTheHawk &&
                CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
            {
                if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
                    return;
            }
        }

        // Don't both getting distance if they're about to die, unless there's more of em
        if (GetRole() != ROLE_MELEE_DPS && me->CanReachWithMeleeAutoAttack(pVictim) && IsTargetDeathWithinSeconds(pVictim, 3.0f) && me->GetEnemyCountInRadiusAround(me, 8.0f) < 2)
            return;

        if (!me->HasUnitState(UNIT_STATE_ROOT) &&
            (me->GetCombatDistance(pVictim) < 8.0f) &&
            (GetRole() != ROLE_MELEE_DPS) &&
             me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE)
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            if (RunAwayFromTarget(pVictim, 9.0f + me->GetSizeFactorForDistance(pVictim, SizeFactor::CombatReach)))
                return;
        }
    }
}

void PartyBotAI::UpdateOutOfCombatAI_Mage()
{
    RebuffCandidate bestCandidate;

    if (m_spells.mage.pRemoveLesserCurse)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.mage.pRemoveLesserCurse))
        {
            if (CanTryToCastSpell(pFriend, m_spells.mage.pRemoveLesserCurse))
            {
                if (DoCastSpell(pFriend, m_spells.mage.pRemoveLesserCurse) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }

    if (m_spells.mage.pArcaneBrilliance)
    {
        if (CanTryToCastSpell(me, m_spells.mage.pArcaneBrilliance))
        {
            if (DoCastSpell(me, m_spells.mage.pArcaneBrilliance) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        //EvaluateRebuffTarget(m_spells.mage.pArcaneBrilliance, bestCandidate);
    }
    else if (m_spells.mage.pArcaneIntellect)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.mage.pArcaneIntellect))
        {
            if (CanTryToCastSpell(pTarget, m_spells.mage.pArcaneIntellect))
            {
                if (DoCastSpell(pTarget, m_spells.mage.pArcaneIntellect) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.mage.pArcaneIntellect, bestCandidate);
    }

    if (m_spells.mage.pMageArmor)
    {
        if (CanTryToCastSpell(me, m_spells.mage.pMageArmor))
        {
            if (DoCastSpell(me, m_spells.mage.pMageArmor) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        EvaluateRebuffTarget(m_spells.mage.pMageArmor, bestCandidate, false, me);
    }
    else if (m_spells.mage.pIceArmor && (!m_spells.mage.pMageArmor || !me->HasAura(m_spells.mage.pMageArmor->Id)))
    {
        if (CanTryToCastSpell(me, m_spells.mage.pIceArmor))
        {
            if (DoCastSpell(me, m_spells.mage.pIceArmor) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        EvaluateRebuffTarget(m_spells.mage.pIceArmor, bestCandidate, false, me);
    }

    if (m_spells.mage.pIceBarrier &&
        CanTryToCastSpell(me, m_spells.mage.pIceBarrier))
    {
        if (DoCastSpell(me, m_spells.mage.pIceBarrier) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
    }

    if (!me->IsMoving() && me->GetPowerPercent(POWER_MANA) == 100.0f)
    {
        if (m_noGenerateItems && m_spells.mage.pConjureWater && CanTryToCastSpell(me, m_spells.mage.pConjureWater) && CountInventoryItem(m_spells.mage.pConjureWater) < 40)
        {
            if (DoCastSpell(me, m_spells.mage.pConjureWater) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }

        if (m_spells.mage.pConjureManaRuby && CanTryToCastSpell(me, m_spells.mage.pConjureManaRuby) && !GetInventoryItem(m_spells.mage.pConjureManaRuby))
        {
            if (DoCastSpell(me, m_spells.mage.pConjureManaRuby) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        if (m_spells.mage.pConjureManaCitrine && CanTryToCastSpell(me, m_spells.mage.pConjureManaCitrine) && !GetInventoryItem(m_spells.mage.pConjureManaCitrine))
        {
            if (DoCastSpell(me, m_spells.mage.pConjureManaCitrine) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        if (m_spells.mage.pConjureManaJade && CanTryToCastSpell(me, m_spells.mage.pConjureManaJade) && !GetInventoryItem(m_spells.mage.pConjureManaJade))
        {
            if (DoCastSpell(me, m_spells.mage.pConjureManaJade) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        if (m_spells.mage.pConjureManaAgate && CanTryToCastSpell(me, m_spells.mage.pConjureManaAgate) && !GetInventoryItem(m_spells.mage.pConjureManaAgate))
        {
            if (DoCastSpell(me, m_spells.mage.pConjureManaAgate) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
    }

    if (bestCandidate.target && bestCandidate.spell)
    {
        if (DoCastSpell(bestCandidate.target, bestCandidate.spell) == SPELL_CAST_OK)
        {
            me->ClearTarget();
            return;
        }
    }

    if (me->GetVictim())
        UpdateInCombatAI_Mage();
}

void PartyBotAI::UpdateInCombatAI_Mage()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.mage.pCombustion &&
            CanTryToCastSpell(me, m_spells.mage.pCombustion))
        {
            if (DoCastSpell(me, m_spells.mage.pCombustion) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPyroblast &&
           ((m_spells.mage.pPresenceOfMind && me->HasAura(m_spells.mage.pPresenceOfMind->Id)) ||
            (!pVictim->IsInCombat() && (pVictim->GetMaxHealth() > me->GetMaxHealth()) && (me->GetDistance(pVictim) > 30.0f))) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pPyroblast))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pPyroblast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pIceBlock &&
           (me->GetHealthPercent() < 10.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pIceBlock))
        {
            if (DoCastSpell(me, m_spells.mage.pIceBlock) == SPELL_CAST_OK)
                return;
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            MoveChase(pVictim, 25.0f);
        }
        else if (GetAttackersInRangeCount(10.0f))
        {
            if (m_spells.mage.pManaShield &&
               (me->GetPowerPercent(POWER_MANA) > 20.0f) &&
                CanTryToCastSpell(me, m_spells.mage.pManaShield))
            {
                if (DoCastSpell(me, m_spells.mage.pManaShield) == SPELL_CAST_OK)
                    return;
            }

            if ((GetRole() != ROLE_MELEE_DPS) &&
                (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
            {
                if (m_spells.mage.pBlink &&
                    (me->HasUnitState(UNIT_STATE_CAN_NOT_MOVE) ||
                        me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED)) &&
                    CanTryToCastSpell(me, m_spells.mage.pBlink))
                {
                    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                        me->GetMotionMaster()->Clear();

                    if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                        return;
                }

                if (!me->HasUnitState(UNIT_STATE_CAN_NOT_MOVE))
                {
                    if (m_spells.mage.pFrostNova &&
                       !pVictim->HasUnitState(UNIT_STATE_ROOT) &&
                       !pVictim->HasUnitState(UNIT_STATE_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                        CanTryToCastSpell(me, m_spells.mage.pFrostNova))
                    {
                        DoCastSpell(me, m_spells.mage.pFrostNova);
                    }

                    if (RunAwayFromTarget(pVictim))
                    {
                        me->SetCasterChaseDistance(25.0f);
                        return;
                    }
                }
            }
        }

        uint8 enemyCountAroundMe = me->GetEnemyCountInRadiusAround(me, 10.0f);
        uint8 enemyCountAroundVictim = me->GetEnemyCountInRadiusAround(pVictim, 10.0f);
        if (enemyCountAroundMe > 2 && enemyCountAroundMe > enemyCountAroundVictim)
        {
            if (m_spells.mage.pConeofCold && !me->IsMoving() &&
                CanTryToCastSpell(me, m_spells.mage.pConeofCold))
            {
                if (DoCastSpell(pVictim, m_spells.mage.pConeofCold) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.mage.pBlastWave &&
                CanTryToCastSpell(me, m_spells.mage.pBlastWave))
            {
                if (DoCastSpell(me, m_spells.mage.pBlastWave) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.mage.pArcaneExplosion &&
                CanTryToCastSpell(me, m_spells.mage.pArcaneExplosion))
            {
                if (DoCastSpell(me, m_spells.mage.pArcaneExplosion) == SPELL_CAST_OK)
                    return;
            }
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
            return;

        if (m_spells.mage.pCounterspell &&
            pVictim->IsNonMeleeSpellCasted(false, false, true) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pCounterspell))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pCounterspell) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pRemoveLesserCurse)
        {
            if (Unit* pFriend = SelectDispelTarget(m_spells.mage.pRemoveLesserCurse))
            {
                if (CanTryToCastSpell(pFriend, m_spells.mage.pRemoveLesserCurse))
                {
                    if (DoCastSpell(pFriend, m_spells.mage.pRemoveLesserCurse) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.mage.pBlizzard && (enemyCountAroundVictim > 2) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pBlizzard, true))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pBlizzard) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPolymorph)
        {
            if (Unit* pTarget = SelectAttackerDifferentFrom(pVictim))
            {
                if (pTarget->GetHealthPercent() > 20.0f &&
                    CanTryToCastSpell(pTarget, m_spells.mage.pPolymorph) &&
                    CanUseCrowdControl(m_spells.mage.pPolymorph, pTarget))
                {
                    if (DoCastSpell(pTarget, m_spells.mage.pPolymorph) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (me->GetPowerPercent(POWER_MANA) < 60.0f)
        {
            if (m_spells.mage.pConjureManaRuby)
            {
                if (Item* pItem = GetInventoryItem(m_spells.mage.pConjureManaRuby->EffectItemType[0]))
                {
                    if (CanTryToCastItemUseSpell(pItem))
                    {
                        UseConsumable(pItem, me);
                    }
                }
            }
            if (m_spells.mage.pConjureManaCitrine)
            {
                if (Item* pItem = GetInventoryItem(m_spells.mage.pConjureManaCitrine->EffectItemType[0]))
                {
                    if (CanTryToCastItemUseSpell(pItem))
                    {
                        UseConsumable(pItem, me);
                    }
                }
            }
            if (m_spells.mage.pConjureManaJade)
            {
                if (Item* pItem = GetInventoryItem(m_spells.mage.pConjureManaJade->EffectItemType[0]))
                {
                    if (CanTryToCastItemUseSpell(pItem))
                    {
                        UseConsumable(pItem, me);
                    }
                }
            }
            if (m_spells.mage.pConjureManaAgate)
            {
                if (Item* pItem = GetInventoryItem(m_spells.mage.pConjureManaAgate->EffectItemType[0]))
                {
                    if (CanTryToCastItemUseSpell(pItem))
                    {
                        UseConsumable(pItem, me);
                    }
                }
            }
        }

        if (m_spells.mage.pArcanePower &&
            (me->GetPowerPercent(POWER_MANA) > 50.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pArcanePower))
        {
            if (DoCastSpell(me, m_spells.mage.pArcanePower) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPresenceOfMind &&
           (me->GetPowerPercent(POWER_MANA) > 50.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pPresenceOfMind))
        {
            if (DoCastSpell(me, m_spells.mage.pPresenceOfMind) == SPELL_CAST_OK)
                return;
        } 

        if (m_spells.mage.pScorch &&
           (pVictim->GetHealth() < me->GetHealth() / 5) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pScorch))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pScorch) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFrostbolt &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFrostbolt, true))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFrostbolt) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFireBlast &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireBlast, true))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFireball &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireball, true))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireball) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pEvocation &&
           (me->GetPowerPercent(POWER_MANA) < 30.0f) &&
           (GetAttackersInRangeCount(10.0f) == 0) &&
            CanTryToCastSpell(me, m_spells.mage.pEvocation))
        {
            if (DoCastSpell(me, m_spells.mage.pEvocation) == SPELL_CAST_OK)
                return;
        }

        if (me->HasSpell(PB_SPELL_SHOOT_WAND) &&
           !me->IsMoving() &&
           //(me->GetPowerPercent(POWER_MANA) < 5.0f) &&
           !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL) &&
            CheckThreatOK(pVictim))
        {
            if (FaceObject(pVictim))
                return;
            me->CastSpell(pVictim, PB_SPELL_SHOOT_WAND, false);
        }
    }
}

void PartyBotAI::UpdateOutOfCombatAI_Priest()
{
    RebuffCandidate bestCandidate;

    if (m_spells.priest.pDispelMagic)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.priest.pDispelMagic))
        {
            if (CanTryToCastSpell(pFriend, m_spells.priest.pDispelMagic))
            {
                if (DoCastSpell(pFriend, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }
    if (true)
    {
        SpellEntry const* cureDisease = m_spells.priest.pAbolishDisease ? m_spells.priest.pAbolishDisease : m_spells.priest.pCureDisease;
        if (cureDisease)
        {
            if (Unit* pFriend = SelectDispelTarget(cureDisease))
            {
                if (CanTryToCastSpell(pFriend, cureDisease))
                {
                    if (DoCastSpell(pFriend, cureDisease) == SPELL_CAST_OK)
                    {
                        m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                        me->ClearTarget();
                        return;
                    }
                }
            }
        }
    }

    if (m_spells.priest.pPrayerofFortitude)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofFortitude))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofFortitude))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pPrayerofFortitude) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        //EvaluateRebuffTarget(m_spells.priest.pPrayerofFortitude, bestCandidate);
    }
    else if (m_spells.priest.pPowerWordFortitude)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pPowerWordFortitude))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pPowerWordFortitude))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pPowerWordFortitude) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pPowerWordFortitude, bestCandidate);
    }

    if (m_spells.priest.pPrayerofSpirit)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofSpirit))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofSpirit))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pPrayerofSpirit) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pPrayerofSpirit, bestCandidate);
    }
    else if (m_spells.priest.pDivineSpirit)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pDivineSpirit))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pDivineSpirit))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pDivineSpirit) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pDivineSpirit, bestCandidate);
    }

    if (m_spells.priest.pPrayerofShadowProtection)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofShadowProtection))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofShadowProtection))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pPrayerofShadowProtection) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pPrayerofShadowProtection, bestCandidate);
    }
    else if (m_spells.priest.pShadowProtection)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pShadowProtection))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pShadowProtection))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pShadowProtection) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pShadowProtection, bestCandidate);
    }

    if (m_spells.priest.pFearWard)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pFearWard))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pFearWard))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pFearWard) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pFearWard, bestCandidate);
    }

    if (m_spells.priest.pInnerFire)
    {
        if (CanTryToCastSpell(me, m_spells.priest.pInnerFire))
        {
            if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
        EvaluateRebuffTarget(m_spells.priest.pInnerFire, bestCandidate, false, me);
    }

    if (bestCandidate.target && bestCandidate.spell)
    {
        if (DoCastSpell(bestCandidate.target, bestCandidate.spell) == SPELL_CAST_OK)
        {
            me->ClearTarget();
            return;
        }
    }

    if (m_role == ROLE_HEALER && !me->IsMoving())
    {
        if (FindAndHealInjuredAlly())
            return;
    }

    if (me->GetVictim())
        UpdateInCombatAI_Priest();
}

void PartyBotAI::UpdateInCombatAI_Priest()
{
    if (m_spells.priest.pFearWard)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.priest.pFearWard))
        {
            if (CanTryToCastSpell(pTarget, m_spells.priest.pFearWard))
            {
                if (DoCastSpell(pTarget, m_spells.priest.pFearWard) == SPELL_CAST_OK)
                {
                    return;
                }
            }
        }
    }

    if (!me->GetAttackers().empty() &&
        m_role != ROLE_TANK)
    {
        if (m_spells.priest.pFade &&
            CanTryToCastSpell(me, m_spells.priest.pFade))
        {
            if (DoCastSpell(me, m_spells.priest.pFade) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pPowerWordShield &&
            CanTryToCastSpell(me, m_spells.priest.pPowerWordShield))
        {
            if (DoCastSpell(me, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pShackleUndead)
        {
            Unit* pAttacker = *me->GetAttackers().begin();
            if ((pAttacker->GetHealth() > me->GetHealth()) &&
                CanTryToCastSpell(pAttacker, m_spells.priest.pShackleUndead) &&
                CanUseCrowdControl(m_spells.priest.pShackleUndead, pAttacker))
            {
                if (DoCastSpell(pAttacker, m_spells.priest.pShackleUndead) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.priest.pInnerFocus &&
       (me->GetPowerPercent(POWER_MANA) < 50.0f) &&
        CanTryToCastSpell(me, m_spells.priest.pInnerFocus))
    {
        DoCastSpell(me, m_spells.priest.pInnerFocus);
    }

    if (GetRole() == ROLE_HEALER || (!me->GetVictim() && me->GetShapeshiftForm() == FORM_NONE))
    {
        // Shield allies being attacked.
        if (m_spells.priest.pPowerWordShield)
        {
            if (Player* pTarget = SelectShieldTarget())
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pPowerWordShield))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        // Direct heal more seriously injured.
        if (Unit* pTarget = SelectHealTarget(30.0f, 40.0f))
            if (HealInjuredTargetDirectFast(pTarget))
                return;
        if (Unit* pTarget = SelectHealTarget(60.0f, 70.0f))
            if (HealInjuredTargetDirectSlow(pTarget))
                return;

        // Dispel attackers
        if (m_spells.priest.pDispelMagic)
        {
            if (Unit* pTarget = SelectDispelAttackerTarget(m_spells.priest.pDispelMagic))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pDispelMagic))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        // Apply HoT aura for small injuries.
        if (me->GetLevel() > 50 || me->GetPowerPercent(POWER_MANA) > 90.0f)
        {
            if (Unit* pTarget = SelectPeriodicHealTarget(80.0f, 90.0f))
                if (HealInjuredTargetPeriodic(pTarget))
                    return;
        }

        // Dispels
        if (m_spells.priest.pDispelMagic)
        {
            if (Unit* pFriend = SelectDispelTarget(m_spells.priest.pDispelMagic))
            {
                if (CanTryToCastSpell(pFriend, m_spells.priest.pDispelMagic))
                {
                    if (DoCastSpell(pFriend, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                        return;
                }
            }
        }
        SpellEntry const* cureDisease = m_spells.priest.pAbolishDisease ? m_spells.priest.pAbolishDisease : m_spells.priest.pCureDisease;
        if (cureDisease)
        {
            if (Unit* pFriend = SelectDispelTarget(cureDisease))
            {
                if (CanTryToCastSpell(pFriend, cureDisease))
                {
                    if (DoCastSpell(pFriend, cureDisease) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (GetRole() == ROLE_HEALER && FindAndPreHealTarget())
            return;
    }
    else if (Unit* pVictim = me->GetVictim())
    {
        float healAt = 25.0;
        if (me->GetShapeshiftForm() == FORM_NONE)
            healAt += 20.0;
        if (!ExistsAsHealerInGroupForOffHealCheck())
            healAt += 20.0;
        if (!me->GetAttackers().empty())
            healAt -= 20.0;
        if (Unit* pTarget = SelectHealTarget(healAt, healAt))
            if (HealInjuredTargetDirect(pTarget))
                return;

        if (m_spells.priest.pShadowform &&
            CanTryToCastSpell(me, m_spells.priest.pShadowform))
        {
            if (DoCastSpell(me, m_spells.priest.pShadowform) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pSilence &&
            pVictim->IsNonMeleeSpellCasted() &&
            CanTryToCastSpell(pVictim, m_spells.priest.pSilence))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pSilence) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pVampiricEmbrace && !IsTargetDeathWithinSeconds(pVictim, 10.0f) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pVampiricEmbrace))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pVampiricEmbrace) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pMindBlast &&
            CanTryToCastSpell(pVictim, m_spells.priest.pMindBlast))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pMindBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pShadowWordPain && !IsTargetDeathWithinSeconds(pVictim, 7.0f) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pShadowWordPain))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pShadowWordPain) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pDevouringPlague &&
            CanTryToCastSpell(pVictim, m_spells.priest.pDevouringPlague))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pDevouringPlague) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pPsychicScream &&
            GetAttackersInRangeCount(10.0f) &&
            CanTryToCastSpell(me, m_spells.priest.pPsychicScream))
        {
            if (DoCastSpell(me, m_spells.priest.pPsychicScream) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pManaBurn &&
           (pVictim->GetPowerType() == POWER_MANA) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pManaBurn))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pManaBurn) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pMindFlay && (!GetAttackersInRangeCount(10.0f) || me->HasAuraType(SPELL_AURA_SCHOOL_ABSORB)) && CanTryToCastSpell(pVictim, m_spells.priest.pMindFlay))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pMindFlay) == SPELL_CAST_OK)
                return;
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            MoveChase(pVictim, 25.0f);
        }

        if (me->GetShapeshiftForm() == FORM_NONE)
        {
            if (m_spells.priest.pHolyNova &&
                GetAttackersInRangeCount(10.0f) > 2 &&
                CanTryToCastSpell(me, m_spells.priest.pHolyNova))
            {
                if (DoCastSpell(me, m_spells.priest.pHolyNova) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.priest.pSmite &&
                CanTryToCastSpell(pVictim, m_spells.priest.pSmite))
            {
                if (DoCastSpell(pVictim, m_spells.priest.pSmite) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    if (Unit* pVictim = me->GetVictim())
    {
        if (me->HasSpell(PB_SPELL_SHOOT_WAND) &&
           !me->IsMoving() &&
           //(me->GetPowerPercent(POWER_MANA) < 10.0f) &&
           !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL) &&
            CheckThreatOK(pVictim))
        {
            if (FaceObject(pVictim))
                return;
            me->CastSpell(pVictim, PB_SPELL_SHOOT_WAND, false);
        }
    }
}

void PartyBotAI::UpdateOutOfCombatAI_Warlock()
{
    RebuffCandidate bestCandidate;

    if (m_spells.warlock.pDetectInvisibility)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.warlock.pDetectInvisibility))
        {
            if (CanTryToCastSpell(pTarget, m_spells.warlock.pDetectInvisibility))
            {
                if (DoCastSpell(pTarget, m_spells.warlock.pDetectInvisibility) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.warlock.pDetectInvisibility, bestCandidate);
    }
    else if (m_spells.warlock.pDetectLesserInvisibility)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.warlock.pDetectLesserInvisibility))
        {
            if (CanTryToCastSpell(pTarget, m_spells.warlock.pDetectLesserInvisibility))
            {
                if (DoCastSpell(pTarget, m_spells.warlock.pDetectLesserInvisibility) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.warlock.pDetectLesserInvisibility, bestCandidate);
    }

    if (m_spells.warlock.pUnendingBreath)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.warlock.pUnendingBreath))
        {
            if (CanTryToCastSpell(pTarget, m_spells.warlock.pUnendingBreath))
            {
                if (DoCastSpell(pTarget, m_spells.warlock.pUnendingBreath) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.warlock.pUnendingBreath, bestCandidate);
    }

    if (m_spells.warlock.pDemonArmor)
    {
        if (CanTryToCastSpell(me, m_spells.warlock.pDemonArmor) && DoCastSpell(me, m_spells.warlock.pDemonArmor) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
        EvaluateRebuffTarget(m_spells.warlock.pDemonArmor, bestCandidate, false, me);
    }
    else if (m_spells.warlock.pDemonSkin)
    {
        if (CanTryToCastSpell(me, m_spells.warlock.pDemonSkin) && DoCastSpell(me, m_spells.warlock.pDemonSkin) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
        EvaluateRebuffTarget(m_spells.warlock.pDemonArmor, bestCandidate, false, me);
    }

    if (m_spells.warlock.pLifeTap &&
        (me->GetPowerPercent(POWER_MANA) < 90.0f) &&
        (me->GetHealthPercent() > 90.0f) &&
        me->HasAuraType(SPELL_AURA_PERIODIC_HEAL) &&
        CanTryToCastSpell(me, m_spells.warlock.pLifeTap))
    {
        if (DoCastSpell(me, m_spells.warlock.pLifeTap) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
    }

    if (!me->IsMoving())
    {
        if (m_spells.warlock.pCreateSoulstone)
        {
            if (CanTryToCastSpell(me, m_spells.warlock.pCreateSoulstone) && !GetInventoryItem(m_spells.warlock.pCreateSoulstone))
            {
                if (DoCastSpell(me, m_spells.warlock.pCreateSoulstone) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }

            if (Item* pItem = GetInventoryItem(m_spells.warlock.pCreateSoulstone))
            {
                if (CanTryToCastItemUseSpell(pItem))
                {
                    // TODO: Check if already stoned
                    Player* pTarget = FindFirstPlayerInGroupByClass(CLASS_PRIEST, true);
                    if (!pTarget)
                        pTarget = FindFirstPlayerInGroupByClass(CLASS_PALADIN, true);
                    if (!pTarget)
                        pTarget = FindFirstPlayerInGroupByClass(CLASS_SHAMAN, true);
                    if (!pTarget)
                        pTarget = FindFirstPlayerInGroupByClass(CLASS_DRUID, true);
                    if (pTarget && CanTryToCastItemUseSpell(pItem, pTarget))
                    {
                        UseConsumable(pItem, pTarget);  // TODO: Fails?
                        m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                        me->ClearTarget();
                        return;
                    }
                }
            }
        }

        if (m_spells.warlock.pCreateHealthstone && CanTryToCastSpell(me, m_spells.warlock.pCreateHealthstone) && !GetHealthStone())
        {
            if (DoCastSpell(me, m_spells.warlock.pCreateHealthstone) == SPELL_CAST_OK)
            {
                m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                me->ClearTarget();
                return;
            }
        }
    }

    if (bestCandidate.target && bestCandidate.spell)
    {
        // sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "UpdateOutOfCombatAI_Warlock - %s found %s for %s duration %d", me->GetName(), bestCandidate.target->GetName(), bestCandidate.spell->SpellName[0].c_str(), bestCandidate.auraDuration / 60000);
        if (DoCastSpell(bestCandidate.target, bestCandidate.spell) == SPELL_CAST_OK)
        {
            me->ClearTarget();
            return;
        }
    }

    if (Unit* pVictim = me->GetVictim())
    {
        if (Pet* pPet = me->GetPet())
        {
            if (!pPet->GetVictim())
            {
                pPet->GetCharmInfo()->SetIsCommandAttack(true);
                pPet->AI()->AttackStart(pVictim);
            }
        }

        UpdateInCombatAI_Warlock();
    }
    else
        SummonPetIfNeeded();
}

void PartyBotAI::UpdateInCombatAI_Warlock()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (me->GetHealthPercent() < 50.0f)
        {
            if (m_spells.warlock.pCreateHealthstone)
            {
                if (Item* pItem = GetHealthStone())
                {
                    if (CanTryToCastItemUseSpell(pItem))
                    {
                        UseConsumable(pItem, me);
                    }
                }
            }
        }

        if (m_spells.warlock.pDeathCoil &&
           (pVictim->CanReachWithMeleeAutoAttack(me) || pVictim->IsNonMeleeSpellCasted()) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pDeathCoil))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pDeathCoil) == SPELL_CAST_OK)
                return;
        }

        if (IsTargetDeathWithinSeconds(pVictim, 3.0f))
        {
            uint32 soulShads = CountInventoryItem(6265);
            if (m_spells.warlock.pShadowburn && soulShads >= 4 && CanTryToCastSpell(pVictim, m_spells.warlock.pShadowburn))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pShadowburn) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pDrainSoul && soulShads < 4 && CanTryToCastSpell(pVictim, m_spells.warlock.pDrainSoul))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pDrainSoul) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warlock.pSearingPain &&
           (pVictim->GetHealthPercent() < 20.0f) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pSearingPain))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pSearingPain) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pBanish &&
            me->GetAttackers().size() > 1)
        {
            Unit* pAttacker = *me->GetAttackers().begin();
            if ((pAttacker->GetHealth() > me->GetHealth()) &&
                CanTryToCastSpell(pAttacker, m_spells.warlock.pBanish))
            {
                if (DoCastSpell(pAttacker, m_spells.warlock.pBanish) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warlock.pRainOfFire &&
           (me->GetEnemyCountInRadiusAround(pVictim, 10.0f) > 2) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pRainOfFire))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pRainOfFire) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pDemonicSacrifice)
        {
            if (Pet* pPet = me->GetPet())
            {
                if (pPet->IsAlive() &&
                    CanTryToCastSpell(pPet, m_spells.warlock.pDemonicSacrifice))
                {
                    if (DoCastSpell(pPet, m_spells.warlock.pDemonicSacrifice) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (!IsTargetDeathWithinSeconds(pVictim, 15.0f))
        {
            if (m_spells.warlock.pImmolate &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pImmolate, false, true))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pImmolate) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pCorruption &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCorruption, false, true))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCorruption) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warlock.pConflagrate && m_spells.warlock.pImmolate)
        {
            // TODO: Early vs late vs finnisher
            if (SpellAuraHolder* pAuraHolder = pVictim->GetSpellAuraHolder(m_spells.warlock.pImmolate->Id, me->GetObjectGuid()))
            {
                if (pAuraHolder->GetAuraDuration() < 5000)
                {
                    if (CanTryToCastSpell(pVictim, m_spells.warlock.pConflagrate) && DoCastSpell(pVictim, m_spells.warlock.pConflagrate) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.warlock.pSiphonLife &&
           (me->GetHealthPercent() < 80.0f) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pSiphonLife))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pSiphonLife) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pDrainLife &&
           (me->GetHealthPercent() < 30.0f) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pDrainLife, true))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pDrainLife) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pFear &&
            pVictim->GetVictim() == me &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pFear))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pFear) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pLifeTap &&
           (me->GetPowerPercent(POWER_MANA) < 90.0f) &&
           (me->GetHealthPercent() > 90.0f) &&
            CanTryToCastSpell(me, m_spells.warlock.pLifeTap))
        {
            if (DoCastSpell(me, m_spells.warlock.pLifeTap) == SPELL_CAST_OK)
                return;
        }

        // TODO: Prioritise given group composition
        if (!IsTargetDeathWithinSeconds(pVictim, 15.0f))
        {
            bool hasMyCurse = false;
            if (m_spells.warlock.pCurseoftheElements && pVictim->GetLevel() >= me->GetLevel())
            {
                if (pVictim->GetSpellAuraHolder(m_spells.warlock.pCurseoftheElements->Id, me->GetGUIDLow()))
                    hasMyCurse = true;
                else if (CanTryToCastSpell(pVictim, m_spells.warlock.pCurseoftheElements))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseoftheElements) == SPELL_CAST_OK)
                    {
                        hasMyCurse = true;
                        return;
                    }
                }
            }

            if (!hasMyCurse && m_spells.warlock.pCurseofShadow && pVictim->GetLevel() >= me->GetLevel())
            {
                if (pVictim->GetSpellAuraHolder(m_spells.warlock.pCurseofShadow->Id, me->GetGUIDLow()))
                    hasMyCurse = true;
                else if (CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofShadow))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseofShadow) == SPELL_CAST_OK)
                    {
                        hasMyCurse = true;
                        return;
                    }
                }
            }

            if (!hasMyCurse && m_spells.warlock.pCurseofTongues && pVictim->GetLevel() >= me->GetLevel() && pVictim->GetPowerType() == POWER_MANA)
            {
                if (pVictim->GetSpellAuraHolder(m_spells.warlock.pCurseofTongues->Id, me->GetGUIDLow()))
                    hasMyCurse = true;
                else if (CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofTongues))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseofTongues) == SPELL_CAST_OK)
                    {
                        hasMyCurse = true;
                        return;
                    }
                }
            }

            if (!hasMyCurse && m_spells.warlock.pCurseofAgony && pVictim->GetLevel() >= me->GetLevel())
            {
                if (pVictim->GetSpellAuraHolder(m_spells.warlock.pCurseofAgony->Id, me->GetGUIDLow()))
                    hasMyCurse = true;
                else if (CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofAgony))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseofAgony) == SPELL_CAST_OK)
                    {
                        hasMyCurse = true;
                        return;
                    }
                }
            }

            if (!hasMyCurse && m_spells.warlock.pCurseofWeakness && pVictim->GetLevel() >= me->GetLevel())
            {
                if (pVictim->GetSpellAuraHolder(m_spells.warlock.pCurseofWeakness->Id, me->GetGUIDLow()))
                    hasMyCurse = true;
                else if (CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofWeakness))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseofWeakness) == SPELL_CAST_OK)
                    {
                        hasMyCurse = true;
                        return;
                    }
                }
            }
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            MoveChase(pVictim, 25.0f);
        }

        if (m_spells.warlock.pHowlofTerror &&
            GetAttackersInRangeCount(10.0f) > 1 &&
            CanTryToCastSpell(me, m_spells.warlock.pHowlofTerror))
        {
            if (DoCastSpell(me, m_spells.warlock.pHowlofTerror) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pShadowBolt &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pShadowBolt))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pShadowBolt) == SPELL_CAST_OK)
                return;
        }

        if (me->HasSpell(PB_SPELL_SHOOT_WAND) &&
           !me->IsMoving() &&
           //(me->GetPowerPercent(POWER_MANA) < 5.0f) &&
           !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL) &&
            CheckThreatOK(pVictim))
        {
            if (FaceObject(pVictim))
                return;
            me->CastSpell(pVictim, PB_SPELL_SHOOT_WAND, false);
        }
    }
}

void PartyBotAI::UpdateOutOfCombatAI_Warrior()
{
    if (m_spells.warrior.pBattleStance &&
        CanTryToCastSpell(me, m_spells.warrior.pBattleStance))
    {
        if (DoCastSpell(me, m_spells.warrior.pBattleStance) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.warrior.pBattleShout &&
       !me->HasAura(m_spells.warrior.pBattleShout->Id))
    {
        if (CanTryToCastSpell(me, m_spells.warrior.pBattleShout))
            DoCastSpell(me, m_spells.warrior.pBattleShout);
        else if (m_spells.warrior.pBloodrage &&
            (me->GetPower(POWER_RAGE) < 10) &&
            CanTryToCastSpell(me, m_spells.warrior.pBloodrage))
        {
            DoCastSpell(me, m_spells.warrior.pBloodrage);
        }
    }

    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.warrior.pCharge &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pCharge))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pCharge) == SPELL_CAST_OK)
                return;
        }
    }
}

void PartyBotAI::UpdateInCombatAI_Warrior()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (pVictim->IsNonMeleeSpellCasted(false, false, true))
        {
            if (m_spells.warrior.pPummel &&
                CanTryToCastSpell(pVictim, m_spells.warrior.pPummel))
            {
                if (DoCastSpell(pVictim, m_spells.warrior.pPummel) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warrior.pShieldBash &&
                IsWearingShield(me) &&
                CanTryToCastSpell(pVictim, m_spells.warrior.pShieldBash))
            {
                if (DoCastSpell(pVictim, m_spells.warrior.pShieldBash) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warrior.pExecute &&
           (pVictim->GetHealthPercent() < 20.0f) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pExecute))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pExecute) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pOverpower &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pOverpower))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pOverpower) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pLastStand &&
            me->GetHealthPercent() < 20.0f &&
            CanTryToCastSpell(me, m_spells.warrior.pLastStand))
        {
            if (DoCastSpell(me, m_spells.warrior.pLastStand) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pConcussionBlow &&
           (pVictim->IsNonMeleeSpellCasted() || pVictim->IsMoving() || (me->GetHealthPercent() < 50.0f)) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pConcussionBlow))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pConcussionBlow) == SPELL_CAST_OK)
                return;
        }

        if (me->GetShapeshiftForm() == FORM_DEFENSIVESTANCE &&
            IsWearingShield(me))
        {
            if (!me->GetAttackers().empty())
            {
                if (m_spells.warrior.pShieldBlock &&
                    CanTryToCastSpell(me, m_spells.warrior.pShieldBlock))
                {
                    if (DoCastSpell(me, m_spells.warrior.pShieldBlock) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.warrior.pShieldWall &&
                   (me->GetHealthPercent() < 40.0f) &&
                    CanTryToCastSpell(me, m_spells.warrior.pShieldWall))
                {
                    if (DoCastSpell(me, m_spells.warrior.pShieldWall) == SPELL_CAST_OK)
                        return;
                }
            }

            if (m_spells.warrior.pShieldSlam &&
                CanTryToCastSpell(pVictim, m_spells.warrior.pShieldSlam))
            {
                if (DoCastSpell(pVictim, m_spells.warrior.pShieldSlam) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warrior.pRevenge && CanTryToCastSpell(pVictim, m_spells.warrior.pRevenge))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pRevenge) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pThunderClap &&
            m_role == ROLE_TANK &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pThunderClap))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pThunderClap) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pSunderArmor &&
            m_role == ROLE_TANK &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pSunderArmor, false, false, true))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pSunderArmor) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pHamstring &&
            pVictim->IsMoving() &&
           !pVictim->HasUnitState(UNIT_STATE_ROOT) &&
           !pVictim->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pHamstring))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pHamstring) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pRend &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pRend, false, true))    // TODO: Double check
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pRend) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pIntimidatingShout &&
           (me->GetHealthPercent() < 30.0f) &&
           (GetAttackersInRangeCount(10.0f) > 2) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pIntimidatingShout))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pIntimidatingShout) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pRetaliation &&
           (GetAttackersInRangeCount(10.0f) > 2) &&
            CanTryToCastSpell(me, m_spells.warrior.pRetaliation))
        {
            if (DoCastSpell(me, m_spells.warrior.pRetaliation) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pSweepingStrikes &&
            CanTryToCastSpell(me, m_spells.warrior.pSweepingStrikes) &&
           (me->GetEnemyCountInRadiusAround(pVictim, 10.0f) > 1))
        {
            if (DoCastSpell(me, m_spells.warrior.pSweepingStrikes) == SPELL_CAST_OK)
                return;
        }

        if (m_role != ROLE_TANK &&
           (me->GetHealthPercent() > 60.0f) && (pVictim->GetHealthPercent() > 40.0f) &&
           !me->HasUnitState(UNIT_STATE_ROOT) &&
           !me->IsImmuneToMechanic(MECHANIC_FEAR))
        {
            if (m_spells.warrior.pRecklessness &&
                CanTryToCastSpell(me, m_spells.warrior.pRecklessness))
            {
                if (DoCastSpell(me, m_spells.warrior.pRecklessness) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warrior.pDeathWish &&
                CanTryToCastSpell(me, m_spells.warrior.pDeathWish))
            {
                if (DoCastSpell(me, m_spells.warrior.pDeathWish) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warrior.pMortalStrike &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pMortalStrike))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pMortalStrike) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pBloodthirst &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pBloodthirst))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pBloodthirst) == SPELL_CAST_OK)
                return;
        }

        if ((me->GetHealthPercent() < 20.0f) ||
            (m_role == ROLE_TANK && (pVictim->GetLevel() >= me->GetLevel() || IsWearingShield(me))))
        {
            if (m_spells.warrior.pDefensiveStance &&
                CanTryToCastSpell(me, m_spells.warrior.pDefensiveStance))
            {
                DoCastSpell(me, m_spells.warrior.pDefensiveStance);
            }
        }
        else
        {
            if (m_spells.warrior.pBerserkerStance &&
                CanTryToCastSpell(me, m_spells.warrior.pBerserkerStance))
            {
                DoCastSpell(me, m_spells.warrior.pBerserkerStance);
            }
        }

        if (m_spells.warrior.pIntercept &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pIntercept))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pIntercept) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pWhirlwind &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pWhirlwind))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pWhirlwind) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pDisarm &&
            IsMeleeWeaponClass(pVictim->GetClass()) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pDisarm))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pDisarm) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pDemoralizingShout &&
            m_role == ROLE_TANK &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pDemoralizingShout))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pDemoralizingShout) == SPELL_CAST_OK)
                return;
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && !me->CanReachWithMeleeAutoAttack(pVictim))
        {
            MoveChase(pVictim);
        }

        if (me->GetPower(POWER_RAGE) > 30)
        {
            if (m_spells.warrior.pCleave && me->GetEnemyCountInRadiusAround(pVictim, 8.0f) > 1)
            {
                if (CanTryToCastSpell(pVictim, m_spells.warrior.pCleave))
                {
                    if (DoCastSpell(pVictim, m_spells.warrior.pCleave) == SPELL_CAST_OK)
                        return;
                }
            }
            else
            {
                if (m_spells.warrior.pHeroicStrike &&
                    CanTryToCastSpell(pVictim, m_spells.warrior.pHeroicStrike))
                {
                    if (DoCastSpell(pVictim, m_spells.warrior.pHeroicStrike) == SPELL_CAST_OK)
                        return;
                }
            }
        }
    }
    else // no victim
    {
        if (m_spells.warrior.pBattleShout &&
            CanTryToCastSpell(me, m_spells.warrior.pBattleShout))
        {
            if (DoCastSpell(me, m_spells.warrior.pBattleShout) == SPELL_CAST_OK)
                return;
        }
    }
}

bool PartyBotAI::ShouldEnterStealth() const
{
    if (me->IsMounted())
        return false;

    if (me->GetVictim() || me->InBattleGround() || me->IsFFAPvP())
        return true;

    if (me->GetHealthPercent() < 10.0f)
        return true;

    if (Player* pLeader = GetPartyLeader())
    {
        if (pLeader->IsDead() || pLeader->IsFeigningDeathSuccessfully() ||
            pLeader->HasAuraType(SPELL_AURA_MOD_STEALTH) ||
            pLeader->HasAuraType(SPELL_AURA_MOD_INVISIBILITY))
            return true;
    }

    return false;
}

bool PartyBotAI::EnterStealthIfNeeded(SpellEntry const* pStealthSpell)
{
    if (pStealthSpell)
    {
        bool const shouldStealth = ShouldEnterStealth();

        if (me->HasAura(pStealthSpell->Id))
        {
            if (!shouldStealth)
                me->RemoveAurasDueToSpellByCancel(pStealthSpell->Id);
        }
        else
        {
            if (shouldStealth &&
                CanTryToCastSpell(me, pStealthSpell) &&
                DoCastSpell(me, pStealthSpell) == SPELL_CAST_OK)
                return true;
        }
    }

    return false;
}

void PartyBotAI::UpdateOutOfCombatAI_Rogue()
{
    if (m_spells.rogue.pMainHandPoison &&
        CanTryToCastSpell(me, m_spells.rogue.pMainHandPoison))
    {
        if (CastWeaponBuff(m_spells.rogue.pMainHandPoison, EQUIPMENT_SLOT_MAINHAND) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.rogue.pOffHandPoison &&
        CanTryToCastSpell(me, m_spells.rogue.pOffHandPoison))
    {
        if (CastWeaponBuff(m_spells.rogue.pOffHandPoison, EQUIPMENT_SLOT_OFFHAND) == SPELL_CAST_OK)
            return;
    }

    if (EnterStealthIfNeeded(m_spells.rogue.pStealth))
        return;

    if (me->GetVictim())
        UpdateInCombatAI_Rogue();
}

void PartyBotAI::UpdateInCombatAI_Rogue()
{
    if (Unit* pVictim = me->GetVictim())
    {
        if (me->HasAuraType(SPELL_AURA_MOD_STEALTH))
        {
            if (m_spells.rogue.pPremeditation &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pPremeditation))
            {
                DoCastSpell(pVictim, m_spells.rogue.pPremeditation);
            }

            if (pVictim->IsCaster())
            {
                if (m_spells.rogue.pGarrote &&
                    CanTryToCastSpell(pVictim, m_spells.rogue.pGarrote))
                {
                    if (DoCastSpell(pVictim, m_spells.rogue.pGarrote) == SPELL_CAST_OK)
                        return;
                }
            }
            else
            {
                if (m_spells.rogue.pAmbush &&
                    CanTryToCastSpell(pVictim, m_spells.rogue.pAmbush))
                {
                    if (DoCastSpell(pVictim, m_spells.rogue.pAmbush) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.rogue.pCheapShot &&
                    CanTryToCastSpell(pVictim, m_spells.rogue.pCheapShot))
                {
                    if (DoCastSpell(pVictim, m_spells.rogue.pCheapShot) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.rogue.pBackstab &&
                    CanTryToCastSpell(pVictim, m_spells.rogue.pBackstab))
                {
                    if (DoCastSpell(pVictim, m_spells.rogue.pBackstab) == SPELL_CAST_OK)
                        return;
                }
            }

            if (me->IsMoving() && (m_spells.rogue.pGarrote || m_spells.rogue.pAmbush || m_spells.rogue.pBackstab))
            {
                return;
            }
        }
        else
        {
            if (m_spells.rogue.pVanish &&
                (me->GetHealthPercent() < 10.0f))
            {
                if (m_spells.rogue.pPreparation &&
                    !me->IsSpellReady(m_spells.rogue.pVanish->Id) &&
                    CanTryToCastSpell(me, m_spells.rogue.pPreparation))
                {
                    if (DoCastSpell(me, m_spells.rogue.pPreparation) == SPELL_CAST_OK)
                        return;
                }

                if (CanTryToCastSpell(me, m_spells.rogue.pVanish))
                {
                    if (DoCastSpell(me, m_spells.rogue.pVanish) == SPELL_CAST_OK)
                    {
                        if (RunAwayFromTarget(pVictim))
                            return;
                    }
                }
            }
        }

        if (m_spells.rogue.pFeint && me->GetPower(POWER_ENERGY) >= 80 && !CheckThreatOK(pVictim))
        {
            float const myThreat = pVictim->GetThreatManager().getThreat(me);
            if (myThreat > me->GetLevel() * 2.0f && CanTryToCastSpell(pVictim, m_spells.rogue.pFeint))
            {
                SpellCastResult result = DoCastSpell(pVictim, m_spells.rogue.pFeint);
                if (result == SPELL_CAST_OK)
                    return;
            }
        }

        if (me->GetComboPoints() > 4)
        {
            std::vector<SpellEntry const*> vSpells;

            // Give priority to Slice and Dice over other finishing moves.
            if (m_spells.rogue.pSliceAndDice &&
               !me->HasAura(m_spells.rogue.pSliceAndDice->Id) &&
                pVictim->GetHealthPercent() > 10.0f)
                vSpells.push_back(m_spells.rogue.pSliceAndDice);
            else
            {
                if (m_spells.rogue.pEviscerate)
                    vSpells.push_back(m_spells.rogue.pEviscerate);
                if (m_spells.rogue.pKidneyShot && !pVictim->IsImmuneToMechanic(MECHANIC_STUN))
                    vSpells.push_back(m_spells.rogue.pKidneyShot);
                if (m_spells.rogue.pExposeArmor)
                    vSpells.push_back(m_spells.rogue.pExposeArmor);
                if (m_spells.rogue.pRupture)
                    vSpells.push_back(m_spells.rogue.pRupture);
            }
            
            if (!vSpells.empty())
            {
                SpellEntry const* pComboSpell = SelectRandomContainerElement(vSpells);
                if (CanTryToCastSpell(pVictim, pComboSpell))
                {
                    if (DoCastSpell(pVictim, pComboSpell) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.rogue.pBlind)
        {
            if (Unit* pTarget = SelectAttackerDifferentFrom(pVictim))
            {
                if (CanTryToCastSpell(pTarget, m_spells.rogue.pBlind) &&
                    CanUseCrowdControl(m_spells.rogue.pBlind, pTarget))
                {
                    if (DoCastSpell(pTarget, m_spells.rogue.pBlind) == SPELL_CAST_OK)
                    {
                        me->AttackStop();
                        AttackStart(pVictim);
                        return;
                    }
                }
            }
        }

        if (m_spells.rogue.pAdrenalineRush && me->GetPower(POWER_ENERGY) < 20 && pVictim->GetHealthPercent() > 40.0f &&
            CanTryToCastSpell(me, m_spells.rogue.pAdrenalineRush))
        {
            if (DoCastSpell(me, m_spells.rogue.pAdrenalineRush) == SPELL_CAST_OK)
                return;
        }

        if (pVictim->IsNonMeleeSpellCasted())
        {
            if (m_spells.rogue.pGouge &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pGouge))
            {
                if (DoCastSpell(pVictim, m_spells.rogue.pGouge) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.rogue.pKick &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pKick))
            {
                if (DoCastSpell(pVictim, m_spells.rogue.pKick) == SPELL_CAST_OK)
                    return;
            }
        }

        if (!me->HasAuraType(SPELL_AURA_MOD_STEALTH))
        {
            if (m_spells.rogue.pEvasion &&
               (me->GetHealthPercent() < 80.0f) &&
               ((GetAttackersInRangeCount(10.0f) > 2) || !IsRangedDamageClass(pVictim->GetClass())) &&
                CanTryToCastSpell(me, m_spells.rogue.pEvasion))
            {
                if (DoCastSpell(me, m_spells.rogue.pEvasion) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.rogue.pColdBlood &&
                CanTryToCastSpell(me, m_spells.rogue.pColdBlood))
            {
                DoCastSpell(me, m_spells.rogue.pColdBlood);
            }

            if (m_spells.rogue.pBladeFlurry &&
                CanTryToCastSpell(me, m_spells.rogue.pBladeFlurry))
            {
                if (DoCastSpell(me, m_spells.rogue.pBladeFlurry) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.rogue.pBackstab &&
            CanTryToCastSpell(pVictim, m_spells.rogue.pBackstab))
        {
            if (DoCastSpell(pVictim, m_spells.rogue.pBackstab) == SPELL_CAST_OK)
                return;
        }

        bool didNotBackstab = me->GetPower(POWER_ENERGY) > 60; // We have energy for backstab but didn't.
        if (didNotBackstab)
        {
            if (m_spells.rogue.pGhostlyStrike &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pGhostlyStrike))
            {
                if (DoCastSpell(pVictim, m_spells.rogue.pGhostlyStrike) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.rogue.pHemorrhage &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pHemorrhage))
            {
                if (DoCastSpell(pVictim, m_spells.rogue.pHemorrhage) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.rogue.pSinisterStrike &&
                CanTryToCastSpell(pVictim, m_spells.rogue.pSinisterStrike))
            {
                if (DoCastSpell(pVictim, m_spells.rogue.pSinisterStrike) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.rogue.pSprint &&
           !me->HasUnitState(UNIT_STATE_ROOT) &&
           !me->CanReachWithMeleeAutoAttack(pVictim) &&
            CanTryToCastSpell(me, m_spells.rogue.pSprint))
        {
            if (DoCastSpell(me, m_spells.rogue.pSprint) == SPELL_CAST_OK)
                return;
        }
    }
}

bool PartyBotAI::EnterCombatDruidForm()
{
    if (m_spells.druid.pCatForm &&
        GetRole() == ROLE_MELEE_DPS &&
        CanTryToCastSpell(me, m_spells.druid.pCatForm))
    {
        if (DoCastSpell(me, m_spells.druid.pCatForm) == SPELL_CAST_OK)
            return true;
    }

    if (m_spells.druid.pBearForm &&
       (m_role == ROLE_TANK || GetRole() == ROLE_MELEE_DPS) &&
        CanTryToCastSpell(me, m_spells.druid.pBearForm))
    {
        if (DoCastSpell(me, m_spells.druid.pBearForm) == SPELL_CAST_OK)
            return true;
    }

    if (m_spells.druid.pMoonkinForm &&
        GetRole() == ROLE_RANGE_DPS &&
        CanTryToCastSpell(me, m_spells.druid.pMoonkinForm))
    {
        if (DoCastSpell(me, m_spells.druid.pMoonkinForm) == SPELL_CAST_OK)
            return true;
    }

    return false;
}

void PartyBotAI::UpdateOutOfCombatAI_Druid()
{
    RebuffCandidate bestCandidate;

    // Make sure bot leaves combat form if his role is changed to healer.
    if ((GetRole() == ROLE_HEALER || (GetRole() == ROLE_TANK && me->GetPowerPercent(POWER_RAGE) == 0) && !me->GetVictim()) &&
        me->GetShapeshiftForm() != FORM_NONE &&
        me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
    {
        me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
        return;
    }

    bool foundBuffTarget = false;
    SpellEntry const* pDispelSpell = m_spells.druid.pAbolishPoison ? m_spells.druid.pAbolishPoison : m_spells.druid.pCurePoison;
    if (pDispelSpell)
    {
        if (Unit* pFriend = SelectDispelTarget(pDispelSpell))
        {
            foundBuffTarget = true;
            if (CanTryToCastSpell(pFriend, pDispelSpell))
            {
                if (DoCastSpell(pFriend, pDispelSpell) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }

    if (m_spells.druid.pRemoveCurse)
    {
        if (Unit* pFriend = SelectDispelTarget(m_spells.druid.pRemoveCurse))
        {
            foundBuffTarget = true;
            if (CanTryToCastSpell(pFriend, m_spells.druid.pRemoveCurse))
            {
                if (DoCastSpell(pFriend, m_spells.druid.pRemoveCurse) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
    }

    if (m_spells.druid.pGiftoftheWild)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.druid.pGiftoftheWild))
        {
            foundBuffTarget = true;
            if (CanTryToCastSpell(pTarget, m_spells.druid.pGiftoftheWild))
            {
                if (DoCastSpell(pTarget, m_spells.druid.pGiftoftheWild) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        //EvaluateRebuffTarget(m_spells.druid.pGiftoftheWild, bestCandidate);
    }
    else if (m_spells.druid.pMarkoftheWild)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.druid.pMarkoftheWild))
        {
            foundBuffTarget = true;
            if (CanTryToCastSpell(pTarget, m_spells.druid.pMarkoftheWild))
            {
                if (DoCastSpell(pTarget, m_spells.druid.pMarkoftheWild) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.druid.pMarkoftheWild, bestCandidate);
    }

    if (m_spells.druid.pThorns)
    {
        if (Unit* pTarget = SelectBuffTarget(m_spells.druid.pThorns))
        {
            foundBuffTarget = true;
            if (CanTryToCastSpell(pTarget, m_spells.druid.pThorns))
            {
                if (DoCastSpell(pTarget, m_spells.druid.pThorns) == SPELL_CAST_OK)
                {
                    m_buffTimer.Reset(PB_BUFFING_INTERVAL);
                    me->ClearTarget();
                    return;
                }
            }
        }
        EvaluateRebuffTarget(m_spells.druid.pThorns, bestCandidate);
    }

    if (m_spells.druid.pNaturesGrasp &&
        CanTryToCastSpell(me, m_spells.druid.pNaturesGrasp))
    {
        if (DoCastSpell(me, m_spells.druid.pNaturesGrasp) == SPELL_CAST_OK)
        {
            m_buffTimer.Reset(PB_BUFFING_INTERVAL);
            me->ClearTarget();
            return;
        }
    }

    if (bestCandidate.target && bestCandidate.spell)
    {
        if (DoCastSpell(bestCandidate.target, bestCandidate.spell) == SPELL_CAST_OK)
        {
            me->ClearTarget();
            return;
        }
    }

    if (foundBuffTarget && me->GetShapeshiftForm() != FORM_NONE && me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
    {
        me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
        return;
    }

    if (me->GetShapeshiftForm() == FORM_NONE)
    {
        if (me->GetVictim() && EnterCombatDruidForm())  // If we don't need to talk to NPCs then shift in to an appropriate form
            return;

        if ((GetRole() == ROLE_HEALER || me->GetPowerPercent(POWER_MANA) > 80.0f) && !me->IsMoving())
        {
            if (FindAndHealInjuredAlly())
                return;
        }
    }
    else if (me->GetShapeshiftForm() == FORM_CAT)
    {
        if (EnterStealthIfNeeded(m_spells.druid.pProwl))
            return;
    }

    if (me->GetVictim())
        UpdateInCombatAI_Druid();
}

void PartyBotAI::UpdateInCombatAI_Druid()
{
    ShapeshiftForm const form = me->GetShapeshiftForm();
    bool inDesiredForm = true;
    switch (GetRole())
    {
        case ROLE_TANK:
        {
            inDesiredForm = form == FORM_BEAR || form == FORM_DIREBEAR;
            break;
        }
        case ROLE_MELEE_DPS:
        {
            inDesiredForm = form == FORM_CAT;
            break;
        }
        case ROLE_RANGE_DPS:
        {
            inDesiredForm = m_spells.druid.pMoonkinForm ? form == FORM_MOONKIN : form == FORM_NONE;
            break;
        }
        case ROLE_HEALER:
        {
            inDesiredForm = form == FORM_NONE;
            break;
        }
    }

    if (m_spells.druid.pBarkskin &&
        (form == FORM_NONE || form == FORM_MOONKIN) &&
        (me->GetHealthPercent() < 50.0f) &&
        CanTryToCastSpell(me, m_spells.druid.pBarkskin))
    {
        if (DoCastSpell(me, m_spells.druid.pBarkskin) == SPELL_CAST_OK)
            return;
    }

    if (GetRole() != ROLE_HEALER && me->GetPowerPercent(POWER_MANA) > 35.0f)
    {
        float healAt = 25.0;
        if (me->GetShapeshiftForm() == FORM_NONE)
            healAt += 20.0;
        if (!ExistsAsHealerInGroupForOffHealCheck())
            healAt += 20.0;
        if (!me->GetAttackers().empty())
            healAt -= 20.0;
        if (Unit* pTarget = SelectHealTarget(healAt, healAt))
        {
            if (me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
            {
                me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
                return;
            }
            if (HealInjuredTargetDirect(pTarget))
                return;
        }
    }

    // Make sure bot leaves combat form if its role is changed to healer.
    if (!inDesiredForm && me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
    {
        me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
        return;
    }

    if (form == FORM_NONE && (GetRole() == ROLE_HEALER || me->GetPowerPercent(POWER_MANA) > 50.0f))
    {
        if (m_spells.druid.pHibernate &&
            m_role != ROLE_TANK &&
            !me->GetAttackers().empty())
        {
            Unit* pAttacker = *me->GetAttackers().begin();
            if (CanTryToCastSpell(pAttacker, m_spells.druid.pHibernate) &&
                CanUseCrowdControl(m_spells.druid.pHibernate, pAttacker))
            {
                if (DoCastSpell(pAttacker, m_spells.druid.pHibernate) == SPELL_CAST_OK)
                    return;
            }
        }

        // Prioritize applying HoTs.
        if (me->GetLevel() > 50 || me->GetPowerPercent(POWER_MANA) > 90.0f)
        {
            if (Unit* pTarget = SelectPeriodicHealTarget(80.0f, 90.0f))
                if (HealInjuredTargetPeriodic(pTarget))
                    return;
        }

        // Direct heal.
        if (Unit* pTarget = SelectHealTarget(30.0f, 40.0f))
            if (HealInjuredTargetDirectFast(pTarget))
                return;
        if (Unit* pTarget = SelectHealTarget(60.0f, 70.0f))
            if (HealInjuredTargetDirectSlow(pTarget))
                return;

        // Dispels
        SpellEntry const* pDispelSpell = m_spells.druid.pAbolishPoison ?
                                         m_spells.druid.pAbolishPoison :
                                         m_spells.druid.pCurePoison;
        if (pDispelSpell)
        {
            if (Unit* pFriend = SelectDispelTarget(pDispelSpell))
            {
                if (CanTryToCastSpell(pFriend, pDispelSpell))
                {
                    if (DoCastSpell(pFriend, pDispelSpell) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.druid.pRemoveCurse)
        {
            if (Unit* pFriend = SelectDispelTarget(m_spells.druid.pRemoveCurse))
            {
                if (CanTryToCastSpell(pFriend, m_spells.druid.pRemoveCurse))
                {
                    if (DoCastSpell(pFriend, m_spells.druid.pRemoveCurse) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.druid.pInnervate &&
           (me->GetHealthPercent() > 40.0f) &&
           (me->GetPowerPercent(POWER_MANA) < 10.0f) &&
            CanTryToCastSpell(me, m_spells.druid.pInnervate))
        {
            if (DoCastSpell(me, m_spells.druid.pInnervate) == SPELL_CAST_OK)
                return;
        }

        if (GetRole() == ROLE_HEALER && FindAndPreHealTarget())
            return;

        if (me->GetVictim() && EnterCombatDruidForm())
            return;
    }

    Unit* pVictim = me->GetVictim();
    if (!pVictim)
        return;
    
    if (form != FORM_NONE &&
        me->HasUnitState(UNIT_STATE_ROOT) &&
        me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT) &&
        (m_role != ROLE_TANK || !me->CanReachWithMeleeAutoAttack(pVictim)))
        me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);

    if (GetRole() == ROLE_HEALER)
        return;
    
    switch (form)
    {
        case FORM_CAT:
        {
            if (me->HasDistanceCasterMovement())
                me->SetCasterChaseDistance(0.0f);

            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
                && !me->CanReachWithMeleeAutoAttack(pVictim))
            {
                MoveChase(pVictim);
            }

            if (me->HasAuraType(SPELL_AURA_MOD_STEALTH))
            {
                if (m_spells.druid.pPounce &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pPounce))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pPounce) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.druid.pRavage &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pRavage))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pRavage) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.druid.pTigersFury &&
                    CanTryToCastSpell(me, m_spells.druid.pTigersFury))
                {
                    if (DoCastSpell(me, m_spells.druid.pTigersFury) == SPELL_CAST_OK)
                        return;
                }
                return;
            }

            if (m_spells.druid.pCower && me->GetPower(POWER_ENERGY) >= 80 && !CheckThreatOK(pVictim))
            {
                float const myThreat = pVictim->GetThreatManager().getThreat(me);
                if (myThreat > me->GetLevel() * 2.0f && CanTryToCastSpell(pVictim, m_spells.druid.pCower))
                {
                    SpellCastResult result = DoCastSpell(pVictim, m_spells.druid.pCower);
                    if (result == SPELL_CAST_OK)
                        return;
                }
            }

            if (me->GetComboPoints() > 4)
            {
                if (m_spells.druid.pFerociousBite &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pFerociousBite))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pFerociousBite) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pRip &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pRip))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pRip) == SPELL_CAST_OK)
                        return;
                }
            }

            if (!me->CanReachWithMeleeAutoAttack(pVictim))
            {
                if (m_spells.druid.pFaerieFireFeral &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pFaerieFireFeral))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pFaerieFireFeral) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pDash &&
                    pVictim->IsMoving() &&
                    CanTryToCastSpell(me, m_spells.druid.pDash))
                {
                    if (DoCastSpell(me, m_spells.druid.pDash) == SPELL_CAST_OK)
                        return;
                }
            }
            if (m_spells.druid.pShred &&
                CanTryToCastSpell(pVictim, m_spells.druid.pShred))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pShred) == SPELL_CAST_OK)
                    return;
            }

            bool didNotShred = me->GetPower(POWER_ENERGY) > 60; // We have energy for shred but didn't.
            if (didNotShred)
            {
                if (m_spells.druid.pRake && CanTryToCastSpell(pVictim, m_spells.druid.pRake, false, true))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pRake) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pClaw && CanTryToCastSpell(pVictim, m_spells.druid.pClaw))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pClaw) == SPELL_CAST_OK)
                        return;
                }
            }
                
            break;
        }
        case FORM_BEAR:
        case FORM_DIREBEAR:
        {
            if (me->HasDistanceCasterMovement())
                me->SetCasterChaseDistance(0.0f);

            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
                && !me->CanReachWithMeleeAutoAttack(pVictim))
            {
                MoveChase(pVictim);
            }

            if (m_spells.druid.pFeralCharge &&
                CanTryToCastSpell(pVictim, m_spells.druid.pFeralCharge))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pFeralCharge) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pBash &&
                CanTryToCastSpell(pVictim, m_spells.druid.pBash))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pBash) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pFrenziedRegeneration &&
                (me->GetHealthPercent() < 30.0f) &&
                CanTryToCastSpell(me, m_spells.druid.pFrenziedRegeneration))
            {
                if (DoCastSpell(me, m_spells.druid.pFrenziedRegeneration) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pFaerieFireFeral &&
                CanTryToCastSpell(pVictim, m_spells.druid.pFaerieFireFeral))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pFaerieFireFeral) == SPELL_CAST_OK)
                    return;
            }

            if ((me->GetPower(POWER_RAGE) > 80) ||
                (GetAttackersInRangeCount(10.0f) > 1))
            {
                if (m_spells.druid.pDemoralizingRoar &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pDemoralizingRoar))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pDemoralizingRoar) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pSwipe &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pSwipe))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pSwipe) == SPELL_CAST_OK)
                        return;
                }
            }

            if (m_spells.druid.pMaul &&
                CanTryToCastSpell(pVictim, m_spells.druid.pMaul))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pMaul) == SPELL_CAST_OK)
                    return;
            }
            break;
        }
        case FORM_NONE:
        case FORM_MOONKIN:
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE &&
                me->GetDistance(pVictim) > 30.0f)
            {
                MoveChase(pVictim, 25.0f);
            }
            else if (pVictim->CanReachWithMeleeAutoAttack(me) &&
                    (pVictim->GetVictim() == me) &&
                    !me->HasUnitState(UNIT_STATE_ROOT) &&
                    (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
            {
                if (m_spells.druid.pEntanglingRoots &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pEntanglingRoots))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pEntanglingRoots) == SPELL_CAST_OK)
                        return;
                }
                me->SetCasterChaseDistance(25.0f);
                if (RunAwayFromTarget(pVictim))
                    return;
            }

            // We're in the wrong form, conserve mana so we can shift
            if (!inDesiredForm && me->GetPowerPercent(POWER_MANA) < 50.0f)
                return;

            if (m_spells.druid.pFaerieFire &&
               (pVictim->GetClass() == CLASS_ROGUE) &&
                CanTryToCastSpell(pVictim, m_spells.druid.pFaerieFire))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pFaerieFire) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pInsectSwarm &&
                CanTryToCastSpell(pVictim, m_spells.druid.pInsectSwarm))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pInsectSwarm) == SPELL_CAST_OK)
                    return;
            }

            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
                return;

            if (m_spells.druid.pHurricane &&
               (me->GetEnemyCountInRadiusAround(pVictim, 10.0f) > 2) &&
                CanTryToCastSpell(pVictim, m_spells.druid.pHurricane))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pHurricane) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pMoonfire &&
                CanTryToCastSpell(pVictim, m_spells.druid.pMoonfire, false, true))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pMoonfire) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pStarfire &&
               (pVictim->GetHealthPercent() > 50.0f) &&
                CanTryToCastSpell(pVictim, m_spells.druid.pStarfire))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pStarfire) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pWrath &&
                CanTryToCastSpell(pVictim, m_spells.druid.pWrath))
            {
                if (DoCastSpell(pVictim, m_spells.druid.pWrath) == SPELL_CAST_OK)
                    return;
            }

            break;
        }
    }
}
