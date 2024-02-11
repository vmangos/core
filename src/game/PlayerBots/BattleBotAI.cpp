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

#include "BattleBotAI.h"
#include "BattleBotWaypoints.h"
#include "BattleGround.h"
#include "Player.h"
#include "Group.h"
#include "CreatureAI.h"
#include "Log.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "World.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Chat.h"
#include "TargetedMovementGenerator.h"

enum BattleBotSpells
{
    BB_SPELL_FOOD = 29073,
    BB_SPELL_DRINK = 22734,
    BB_SPELL_AUTO_SHOT = 75,
    BB_SPELL_SHOOT_WAND = 5019,

    BB_SPELL_MOUNT_40_HUMAN = 470,
    BB_SPELL_MOUNT_40_NELF = 10787,
    BB_SPELL_MOUNT_40_DWARF = 6896,
    BB_SPELL_MOUNT_40_GNOME = 17456,
    BB_SPELL_MOUNT_40_TROLL = 10795,
    BB_SPELL_MOUNT_40_ORC = 581,
    BB_SPELL_MOUNT_40_TAUREN = 18363,
    BB_SPELL_MOUNT_40_UNDEAD = 8980,

    BB_SPELL_MOUNT_60_HUMAN = 22717,
    BB_SPELL_MOUNT_60_NELF = 22723,
    BB_SPELL_MOUNT_60_DWARF = 22720,
    BB_SPELL_MOUNT_60_GNOME = 22719,
    BB_SPELL_MOUNT_60_TROLL = 22721,
    BB_SPELL_MOUNT_60_ORC = 22724,
    BB_SPELL_MOUNT_60_TAUREN = 22718,
    BB_SPELL_MOUNT_60_UNDEAD = 22722,

    BB_SPELL_MOUNT_40_PALADIN = 13819,
    BB_SPELL_MOUNT_60_PALADIN = 23214,

    BB_SPELL_MOUNT_40_WARLOCK = 5784,
    BB_SPELL_MOUNT_60_WARLOCK = 23161,

    BB_ITEM_ARROW  = 2512,
    BB_ITEM_BULLET = 2516,
};

#define BB_UPDATE_INTERVAL 1000
#define BB_NEW_TARGET_INTERVAL 5000
#define BB_MAX_MELEE_CHASE_RANGE 20.0f
#define BB_MAX_HEALER_CHASE_RANGE 36.0f
#define BB_MAX_CHASE_RANGE 41.0f
#define BB_NS_DRUID 17116
#define BB_NS_SHAMAN 16188
#define BB_FEIGN_DEATH_AURA 5384
#define BB_DETERRENCE 19263
#define BB_NIGHTFALL_PROC 17941
#define BB_SOUL_LINK 25228

#define GO_WSG_DROPPED_SILVERWING_FLAG 179785
#define GO_WSG_DROPPED_WARSONG_FLAG 179786
#define GO_WSG_SILVERWING_FLAG 179830
#define GO_WSG_WARSONG_FLAG 179831

#define SPELL_CAPTURE_BANNER 21651

uint32 BattleBotAI::GetMountSpellId() const
{
    if (me->GetLevel() >= 60)
    {
        if (me->GetClass() == CLASS_PALADIN)
            return BB_SPELL_MOUNT_60_PALADIN;
        if (me->GetClass() == CLASS_WARLOCK)
            return BB_SPELL_MOUNT_60_WARLOCK;

        switch (me->GetRace())
        {
            case RACE_HUMAN:
                return BB_SPELL_MOUNT_60_HUMAN;
            case RACE_NIGHTELF:
                return BB_SPELL_MOUNT_60_NELF;
            case RACE_DWARF:
                return BB_SPELL_MOUNT_60_DWARF;
            case RACE_GNOME:
                return BB_SPELL_MOUNT_60_GNOME;
            case RACE_TROLL:
                return BB_SPELL_MOUNT_60_TROLL;
            case RACE_ORC:
                return BB_SPELL_MOUNT_60_ORC;
            case RACE_TAUREN:
                return BB_SPELL_MOUNT_60_TAUREN;
            case RACE_UNDEAD:
                return BB_SPELL_MOUNT_60_UNDEAD;
        }
    }
    else if (me->GetLevel() >= 40)
    {
        if (me->GetClass() == CLASS_PALADIN)
            return BB_SPELL_MOUNT_40_PALADIN;
        if (me->GetClass() == CLASS_WARLOCK)
            return BB_SPELL_MOUNT_40_WARLOCK;

        switch (me->GetRace())
        {
            case RACE_HUMAN:
                return BB_SPELL_MOUNT_40_HUMAN;
            case RACE_NIGHTELF:
                return BB_SPELL_MOUNT_40_NELF;
            case RACE_DWARF:
                return BB_SPELL_MOUNT_40_DWARF;
            case RACE_GNOME:
                return BB_SPELL_MOUNT_40_GNOME;
            case RACE_TROLL:
                return BB_SPELL_MOUNT_40_TROLL;
            case RACE_ORC:
                return BB_SPELL_MOUNT_40_ORC;
            case RACE_TAUREN:
                return BB_SPELL_MOUNT_40_TAUREN;
            case RACE_UNDEAD:
                return BB_SPELL_MOUNT_40_UNDEAD;
        }
    }

    return 0;
}

bool BattleBotAI::UseMount()
{
    if (me->IsMounted())
        return false;

    if (me->IsMoving())
        return false;

    if (me->GetDisplayId() != me->GetNativeDisplayId())
        return false;

    if (BattleGround* bg = me->GetBattleGround())
        if (bg->GetStatus() == STATUS_WAIT_JOIN)
            return false;

    if (me->HasAura(AURA_WARSONG_FLAG) ||
        me->HasAura(AURA_SILVERWING_FLAG))
        return false;

    if (me->HasAura(SPELL_AURA_MOD_STEALTH))
        return false;

    uint32 spellId = GetMountSpellId();
    if (!spellId)
        return false;

    if (me->CastSpell(me, spellId, false) == SPELL_CAST_OK)
        return true;

    return false;
}

bool BattleBotAI::DrinkAndEat()
{
    if (m_isBuffing)
        return false;

    if (me->IsMounted())
        return false;

    if (me->GetVictim())
        return false;

    BattleGround* bg;
    bool const needToEat = me->GetHealthPercent() < 70.0f && !((bg = me->GetBattleGround()) && bg->GetStatus() == STATUS_WAIT_JOIN);
    bool const needToDrink = (me->GetPowerType() == POWER_MANA) && (me->GetPowerPercent(POWER_MANA) < 70.0f);

    if (!needToEat && !needToDrink)
        return false;

    // Do not stop while carrying flag.
    if (me->HasAura(AURA_WARSONG_FLAG) ||
        me->HasAura(AURA_SILVERWING_FLAG))
        return false;

    bool const isEating = me->HasAura(BB_SPELL_FOOD);
    bool const isDrinking = me->HasAura(BB_SPELL_DRINK);

    if (!isEating && needToEat)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            ClearPath();
            StopMoving();
        }
        if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(BB_SPELL_FOOD))
        {
            me->CastSpell(me, pSpellEntry, true);
            me->RemoveSpellCooldown(*pSpellEntry);
        }
        return true;
    }

    if (!isDrinking && needToDrink)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            ClearPath();
            StopMoving();
        }
        if (SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(BB_SPELL_DRINK))
        {
            me->CastSpell(me, pSpellEntry, true);
            me->RemoveSpellCooldown(*pSpellEntry);
        }
        return true;
    }

    return needToEat || needToDrink;
}

float BattleBotAI::GetMaxAggroDistanceForMap() const
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg || bg->GetTypeID() != BATTLEGROUND_AV)
        return 50.0f;
    
    return 30.0f;
}

bool BattleBotAI::AttackStart(Unit* pVictim)
{
    m_isBuffing = false;

    if (me->IsMounted() && me->GetCombatDistance(pVictim) <= 40.0f)
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    if (me->Attack(pVictim, true))
    {
        ClearPath();

        if ((m_role == ROLE_RANGE_DPS || m_role == ROLE_HEALER) &&
            IsRangedDamageClass(me->GetClass()) &&
            me->GetPowerPercent(POWER_MANA) > 10.0f &&
            me->GetCombatDistance(pVictim) > 8.0f)
            me->SetCasterChaseDistance(25.0f);
        else if (me->HasDistanceCasterMovement())
            me->SetCasterChaseDistance(0.0f);

        me->GetMotionMaster()->MoveChase(pVictim, 1.0f, m_role == ROLE_MELEE_DPS ? 3.0f : 0.0f);
        return true;
    }

    return false;
}

bool BattleBotAI::ShouldIgnoreCombat() const
{
    if (m_battlegroundId == BATTLEGROUND_QUEUE_WS && !me->IsRooted() &&
       (me->HasAura(AURA_SILVERWING_FLAG) || me->HasAura(AURA_WARSONG_FLAG)))
        return true;

    auto spell = me->GetCurrentSpell(CURRENT_GENERIC_SPELL);
    if (spell && (spell->m_spellInfo->Id == SPELL_CAPTURE_BANNER))
        return true;


    return false;
}

Unit* BattleBotAI::SelectAttackTarget(Unit* pExcept) const
{
    // Ignore attackers while carrying flag, just keep running.
    if (ShouldIgnoreCombat())
        return nullptr;

    // 1. Check units we are currently in combat with.

    std::list<Unit*> targets;
    HostileReference* pReference = me->GetHostileRefManager().getFirst();

    while (pReference)
    {
        if (Unit* pTarget = pReference->getSourceUnit())
        {
            if (pTarget != pExcept &&
                IsValidHostileTarget(pTarget) &&
                me->IsWithinDist(pTarget, GetMaxAggroDistanceForMap()))
            {
                if (me->GetTeam() == HORDE)
                {
                    if (pTarget->HasAura(AURA_WARSONG_FLAG))
                        return pTarget;
                }
                else
                {
                    if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                        return pTarget;
                }

                // Aggro people on the flag in AB / AV
                auto spell = pTarget->GetCurrentSpell(CURRENT_GENERIC_SPELL);
                if (spell && (spell->m_spellInfo->Id == SPELL_CAPTURE_BANNER))
                    return pTarget;

                // Aggro healers
                if ((IsHealerClass(pTarget->GetClass())) &&
                    pTarget->GetShapeshiftForm() == FORM_NONE)
                    return pTarget;

                // Aggro casters / Hunters
                if (IsRangedDamageClass(pTarget->GetClass()))
                    return pTarget;

                targets.push_back(pTarget);
            }
        }
        pReference = pReference->next();
    }

    if (!targets.empty())
    {
        targets.sort([this](Unit* pUnit1, const Unit* pUnit2)
        {
            return me->GetDistance(pUnit1) < me->GetDistance(pUnit2);
        });

        return *targets.begin();
    }

    // 2. Find enemy player in range.

    std::list<Player*> players;
    float const maxAggroDistance = GetMaxAggroDistanceForMap();
    me->GetAlivePlayerListInRange(me, players, maxAggroDistance);

    for (const auto& pTarget : players)
    {
        if (pTarget == pExcept)
            continue;

        if (!IsValidHostileTarget(pTarget))
            continue;

        if (me->GetTeam() == HORDE)
        {
            if (pTarget->HasAura(AURA_WARSONG_FLAG))
                return pTarget;
        }
        else
        {
            if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                return pTarget;
        }

        // Aggro people on the flag in AB / AV
        auto spell = pTarget->GetCurrentSpell(CURRENT_GENERIC_SPELL);
        if (spell && (spell->m_spellInfo->Id == SPELL_CAPTURE_BANNER))
            return pTarget;

        // Aggro healers
        if ((IsHealerClass(pTarget->GetClass())) &&
            pTarget->GetShapeshiftForm() == FORM_NONE)
            return pTarget;

        // Aggro casters / Hunters
        if (IsRangedDamageClass(pTarget->GetClass()))
            return pTarget;

        // Aggro weak enemies from further away.
        uint32 const aggroDistance = me->GetHealth() > pTarget->GetHealth() ? maxAggroDistance : 20.0f;
        if (!me->IsWithinDist(pTarget, aggroDistance))
            continue;

        if (me->GetDistanceZ(pTarget) > 10.0f)
            continue;

        if (me->IsWithinLOSInMap(pTarget))
            return pTarget;
    }

    // 3. Check party attackers.

    if (Group* pGroup = me->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Unit* pMember = itr->getSource())
            {
                if (pMember == me)
                    continue;

                if (me->GetDistance(pMember) > 30.0f)
                    continue;

                if (Unit* pAttacker = pMember->GetAttackerForHelper())
                {
                    if (pAttacker != pExcept &&
                        IsValidHostileTarget(pAttacker) &&
                        me->IsWithinDist(pAttacker, maxAggroDistance * 2.0f) &&
                        me->GetDistanceZ(pAttacker) < 10.0f &&
                        me->IsWithinLOSInMap(pAttacker))
                        return pAttacker;
                }
            }
        }
    }

    return nullptr;
}

Unit* BattleBotAI::SelectFollowTarget() const
{
    if (me->HasAura(AURA_WARSONG_FLAG) ||
        me->HasAura(AURA_SILVERWING_FLAG))
        return nullptr;

    std::list<Player*> players;
    me->GetAlivePlayerListInRange(me, players, GetMaxAggroDistanceForMap());
    Player* pHealerFollowTarget = nullptr;

    for (const auto& pTarget : players)
    {
        if (pTarget == me)
            continue;

        if (me->GetTeam() != pTarget->GetTeam())
            continue;

        if (pTarget->IsGameMaster())
            continue;

        if (me->GetTeam() == ALLIANCE)
        {
            if (pTarget->HasAura(AURA_WARSONG_FLAG))
                return pTarget;
        }
        else
        {
            if (pTarget->HasAura(AURA_SILVERWING_FLAG))
                return pTarget;
        }

        if (m_role == ROLE_HEALER &&
           !IsHealerClass(pTarget->GetClass()) &&
           !IsStealthClass(pTarget->GetClass()) &&
           (pTarget->IsMounted() == me->IsMounted()) &&
           (me->GetDistance2d(pTarget) <= 20.0f) &&
           (me->GetDistanceZ(pTarget) <= 3.0f))
            pHealerFollowTarget = pTarget;
    }

    return pHealerFollowTarget;
}

void BattleBotAI::DoGraveyardJump()
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg || bg->GetTypeID() != BATTLEGROUND_WS)
        return;

    m_doingGraveyardJump = true;
    uint32 timeOffset = 0;
    std::vector<RecordedMovementPacket>* pPath = me->GetTeam() == HORDE ? &vHordeGraveyardJumpPath : &vAllianceGraveyardJumpPath;
    for (uint32 i = 0; i < (*pPath).size(); i++)
    {
        RecordedMovementPacket* point = &((*pPath)[i]);
        Player* pBot = me;
        BattleBotAI* pAI = this;
        bool isLast = i == (*pPath).size() - 1;
        timeOffset += point->timeDiff;
        me->m_Events.AddLambdaEventAtOffset([pBot, pAI, point, isLast]
        {
            if (!pBot->HasUnitState(UNIT_STAT_NO_FREE_MOVE))
            {
                pBot->SetUnitMovementFlags(point->moveFlags);
                pBot->Relocate(point->position.x, point->position.y, point->position.z, point->position.o);
                pBot->SendMovementPacket(point->opcode, false);
            }

            if (isLast)
                pAI->m_doingGraveyardJump = false;
        }, timeOffset);
    }
}

void BattleBotAI::StopMoving()
{
    me->StopMoving();
    me->GetMotionMaster()->Clear();
    me->GetMotionMaster()->MoveIdle();
}

void BattleBotAI::OnPacketReceived(WorldPacket const* packet)
{
    //printf("Bot received %s\n", LookupOpcodeName(packet->GetOpcode()));
    switch (packet->GetOpcode())
    {
        case MSG_PVP_LOG_DATA:
        {
            if (!me)
                return;

            uint8 ended = *((uint8*)(*packet).contents());
            if (ended)
            {
                // Temporary battlebots are removed after bg ends.
                if (m_temporary)
                    botEntry->requestRemoval = true;
                else
                {
                    std::unique_ptr<WorldPacket> data = std::make_unique<WorldPacket>(CMSG_LEAVE_BATTLEFIELD);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                    *data << uint32(me->GetMapId());
#endif
                    me->GetSession()->QueuePacket(std::move(data));
                }
            }
            return;
        }
    }

    CombatBotBaseAI::OnPacketReceived(packet);
}

void BattleBotAI::OnPlayerLogin()
{
    if (!m_initialized)
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
}

void BattleBotAI::UpdateWaypointMovement()
{
    // We already have a path.
    if (m_currentPath)
        return;

    if (me->IsMoving())
        return;

    if (!me->IsStopped())
        return;

    if (me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE))
        return;

    switch (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
    {
        case IDLE_MOTION_TYPE:
        case CHASE_MOTION_TYPE:
        case POINT_MOTION_TYPE:
            break;
        default:
            return;
    }

    if (BattleGround* bg = me->GetBattleGround())
        if (bg->GetStatus() == STATUS_WAIT_JOIN)
            return;

    if (StartNewPathToObjective())
        return; 

    if (StartNewPathFromBeginning())
        return;

    StartNewPathFromAnywhere();
}

void BattleBotAI::OnJustDied()
{
    ClearPath();
    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        StopMoving();
}

void BattleBotAI::OnJustRevived()
{
    SummonPetIfNeeded();
    if (!me->SelectRandomUnfriendlyTarget(nullptr, 30.0f))
        DoGraveyardJump();
}

void BattleBotAI::OnEnterBattleGround()
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg)
        return;

    if (bg->GetStatus() != STATUS_WAIT_JOIN)
        return;

    SummonPetIfNeeded();

    if (bg->GetTypeID() == BATTLEGROUND_WS)
    {
        m_waitingSpot = urand(BB_WSG_WAIT_SPOT_SPAWN, BB_WSG_WAIT_SPOT_RIGHT);
        if (m_waitingSpot == BB_WSG_WAIT_SPOT_RIGHT)
        {
            if (me->GetTeam() == HORDE)
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_HORDE_1.x, WS_WAITING_POS_HORDE_1.y, WS_WAITING_POS_HORDE_1.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_HORDE_1.o);
            else
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_ALLIANCE_1.x, WS_WAITING_POS_ALLIANCE_1.y, WS_WAITING_POS_ALLIANCE_1.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_ALLIANCE_1.o);
        }
        else if (m_waitingSpot == BB_WSG_WAIT_SPOT_LEFT)
        {
            if (me->GetTeam() == HORDE)
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_HORDE_2.x, WS_WAITING_POS_HORDE_2.y, WS_WAITING_POS_HORDE_2.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_HORDE_2.o);
            else
                me->GetMotionMaster()->MovePoint(0, WS_WAITING_POS_ALLIANCE_2.x, WS_WAITING_POS_ALLIANCE_2.y, WS_WAITING_POS_ALLIANCE_2.z, MOVE_PATHFINDING, 0, WS_WAITING_POS_ALLIANCE_2.o);
        }
    }
    else if (bg->GetTypeID() == BATTLEGROUND_AB)
    {
        if (me->GetTeam() == HORDE)
            me->GetMotionMaster()->MovePoint(0, AB_WAITING_POS_HORDE.x + frand(-2.0f, 2.0f), AB_WAITING_POS_HORDE.y + frand(-2.0f, 2.0f), AB_WAITING_POS_HORDE.z, MOVE_PATHFINDING, 0, AB_WAITING_POS_HORDE.o);
        else
            me->GetMotionMaster()->MovePoint(0, AB_WAITING_POS_ALLIANCE.x + frand(-2.0f, 2.0f), AB_WAITING_POS_ALLIANCE.y + frand(-2.0f, 2.0f), AB_WAITING_POS_ALLIANCE.z, MOVE_PATHFINDING, 0, AB_WAITING_POS_ALLIANCE.o);
    }
    else if (bg->GetTypeID() == BATTLEGROUND_AV)
    {
        if (me->GetTeam() == HORDE)
            me->GetMotionMaster()->MovePoint(0, AV_WAITING_POS_HORDE.x + frand(-2.0f, 2.0f), AV_WAITING_POS_HORDE.y + frand(-2.0f, 2.0f), AV_WAITING_POS_HORDE.z, MOVE_PATHFINDING, 0, AV_WAITING_POS_HORDE.o);
        else
            me->GetMotionMaster()->MovePoint(0, AV_WAITING_POS_ALLIANCE.x + frand(-2.0f, 2.0f), AV_WAITING_POS_ALLIANCE.y + frand(-2.0f, 2.0f), AV_WAITING_POS_ALLIANCE.z, MOVE_PATHFINDING, 0, AV_WAITING_POS_ALLIANCE.o);
    }
}

void BattleBotAI::OnLeaveBattleGround()
{
    ClearPath();
    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        StopMoving();

    // Temporary battlebots are removed after bg ends.
    if (m_temporary)
        botEntry->requestRemoval = true;
}

bool BattleBotAI::CheckForUnreachableTarget()
{
    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE &&
       !me->GetMotionMaster()->GetCurrent()->IsReachable())
    {
        if (Unit* pTarget = static_cast<ChaseMovementGenerator<Player> const*>(me->GetMotionMaster()->GetCurrent())->GetTarget())
        {
            if (!me->CanReachWithMeleeAutoAttack(pTarget))
            {
                if (!me->IsWithinDist(pTarget, VISIBILITY_DISTANCE_NORMAL))
                {
                    me->AttackStop(false);
                    StopMoving();
                    return true;
                }

                if (pTarget->IsCreature() && !me->IsMoving())
                {
                    // Cheating to prevent getting stuck because of bad mmaps.
                    me->NearTeleportTo(pTarget->GetPosition());
                    return true;
                }

                if (me->GetDistanceZ(pTarget) > 10.0f)
                {
                    me->AttackStop(false);
                    StopMoving();
                    return true;
                }
            }
        }
    }

    return false;
}

void BattleBotAI::UpdateAI(uint32 const diff)
{
    m_updateTimer.Update(diff);
    if (m_updateTimer.Passed())
        m_updateTimer.Reset(BB_UPDATE_INTERVAL);
    else
        return;

    if (!me->IsInWorld() || me->IsBeingTeleported() || m_doingGraveyardJump)
        return;

    if (!m_initialized)
    {
        if (m_level && m_level != me->GetLevel())
        {
            me->GiveLevel(m_level);
            me->InitTalentForLevel();
            me->SetUInt32Value(PLAYER_XP, 0);
        }

        LearnPremadeSpecForClass();

        if (m_role == ROLE_INVALID)
            AutoAssignRole();

        AutoEquipGear(sWorld.getConfig(CONFIG_UINT32_BATTLE_BOT_AUTO_EQUIP));
        ResetSpellData();
        PopulateSpellData();
        AddAllSpellReagents();
        me->UpdateSkillsToMaxSkillsForLevel();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
        SummonPetIfNeeded();
        me->SetHealthPercent(100.0f);
        me->SetPowerPercent(me->GetPowerType(), 100.0f);

        if (urand(0, 1))
        {
            me->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM);
            me->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_CLOAK);
        }

        uint32 newzone, newarea;
        me->GetZoneAndAreaId(newzone, newarea);
        me->UpdateZone(newzone, newarea);

        m_initialized = true;
        return;
    }

    if (!me->InBattleGround())
    {
        if (m_wasInBG)
        {
            m_wasInBG = false;
            OnLeaveBattleGround();
            return;
        }

        if (m_receivedBgInvite)
        {
            SendBattlefieldPortPacket();
            m_receivedBgInvite = false;
            return;
        }

        if (!me->InBattleGroundQueue())
        {
            bool canQueue;
            char args[] = "";
            switch (m_battlegroundId)
            {
                case BATTLEGROUND_QUEUE_AV:
                    canQueue = ChatHandler(me).HandleGoAlteracCommand(args);
                    break;
                case BATTLEGROUND_QUEUE_WS:
                    canQueue = ChatHandler(me).HandleGoWarsongCommand(args);
                    break;
                case BATTLEGROUND_QUEUE_AB:
                    canQueue = ChatHandler(me).HandleGoArathiCommand(args);
                    break;
                default:
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleBot: Invalid BG queue type!");
                    botEntry->requestRemoval = true;
                    return;
            }

            if (!canQueue)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "BattleBot: Attempt to queue for BG failed! Bot is too low level or BG is not available in this patch.");
                botEntry->requestRemoval = true;
                return;
            }

            SendBattlemasterJoinPacket(m_battlegroundId);
            return;
        }

        // Remain idle until we can join battleground.
        return;
    }
    else
    {
        if (!m_wasInBG)
        {
            m_wasInBG = true;
            OnEnterBattleGround();
            return;
        }
        else if (m_temporary)
        {
            // Remove temporary battlebots if no real players in map.
            if (BattleGround* bg = me->GetBattleGround())
            {
                if (bg->GetStatus() == STATUS_IN_PROGRESS)
                {
                    if (!me->GetMap()->HaveRealPlayers())
                    {
                        botEntry->requestRemoval = true;
                        return;
                    }
                }
            }
        }
    }
    
    // Remove Feign death if > 25% HP
    if ((me->GetClass() == CLASS_HUNTER) &&
        (me->HasAura(BB_FEIGN_DEATH_AURA) &&
            me->GetHealthPercent() > 25.0f))
        me->RemoveAurasDueToSpell(BB_FEIGN_DEATH_AURA);

    if (me->IsDead())
    {
        if (!m_wasDead)
        {
            m_wasDead = true;
            OnJustDied();
            return;
        }
        
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
            if (me->GetDeathState() == DEAD)
            {
                me->ResurrectPlayer(0.5f);
                me->SpawnCorpseBones();
                //me->SendCreateUpdateToPlayer(pLeader);
            }
        }
        
        return;
    }
    else
    {
        if (m_wasDead)
        {
            m_wasDead = false;
            OnJustRevived();
            return;
        }
    }

    if (me->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
        return;

    if (me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        // Stop auto shot if no target.
        if (!me->GetVictim())
            me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL, true);
        else if (me->GetClass() == CLASS_HUNTER)
        {
            if (me->GetCombatDistance(me->GetVictim()) < 8.0f)
                me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL, true);
            else
                UpdateInCombatAI_Hunter();
        }

        return;
    }

    if (me->IsNonMeleeSpellCasted(false, false, true))
        return;

    if (me->GetTargetGuid() == me->GetObjectGuid())
        me->ClearTarget();

    Unit* pVictim = me->GetVictim();

    // Stop chasing targets if they are very far away
    if (pVictim)
    {
        if (IsMeleeDamageClass(me->GetClass()))
        {
            if (me->GetDistance(pVictim) > BB_MAX_MELEE_CHASE_RANGE)
            {
                if (Pet* pPet = me->GetPet())
                {
                    if (pPet->IsAlive())
                        pPet->AttackStop();
                }
                me->AttackStop();
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                {
                    ClearPath();
                    StartNewPathFromBeginning();
                }
                return;
            }

        }
        else if (m_role == ROLE_HEALER)
        {
            if (me->GetDistance(pVictim) > BB_MAX_HEALER_CHASE_RANGE)
            {
                me->AttackStop();
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                {
                    ClearPath();
                    StartNewPathFromBeginning();
                }
                return;
            }
        }
        else
        {
            if (me->GetDistance(pVictim) > BB_MAX_CHASE_RANGE)
            {
                if (Pet* pPet = me->GetPet())
                {
                    if (pPet->IsAlive())
                        pPet->AttackStop();
                }
                me->AttackStop();
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                {
                    ClearPath();
                    StartNewPathFromBeginning();
                }
                return;
            }
        }
    }

    // Hit people capping AB / AV flags
    if (Unit* pCapper = GetFlagCapper())
    {
        if (pCapper != me->GetVictim())
        {
            me->AttackStop();
            AttackStart(pCapper);
            return;
        }
    }

    if (!me->IsInCombat() && me->GetEnemyCountInRadiusAround(me, VISIBILITY_DISTANCE_SMALL) == 0)
    {
        if (DrinkAndEat())
            return;
    }

    if (me->GetStandState() != UNIT_STAND_STATE_STAND)
        me->SetStandState(UNIT_STAND_STATE_STAND);

    UpdateBattleGroundAI();

    if (!me->IsInCombat())
    {
        if (CheckForUnreachableTarget())
            return;

        UpdateOutOfCombatAI();

        if (m_isBuffing)
            return;

        // Can enter combat from UpdateOutOfCombatAI().
        if (me->IsInCombat())
            return;

        if (me->IsNonMeleeSpellCasted())
            return;

        if (!pVictim || !IsValidHostileTarget(pVictim))
        {
            if (pVictim = SelectAttackTarget(pVictim))
            {
                AttackStart(pVictim);
                return;
            }

            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
            {
                if (Unit* pFollowTarget = SelectFollowTarget())
                {
                    ClearPath();
                    me->GetMotionMaster()->MoveFollow(pFollowTarget, frand(3.0f, 5.0f), frand(0.0f, 3.0f));
                    return;
                }
            }
            else if (FollowMovementGenerator<Player> const* pMoveGen = dynamic_cast<FollowMovementGenerator<Player> const*>(me->GetMotionMaster()->GetCurrent()))
            {
                Unit* pTarget = pMoveGen->GetTarget();
                if (!pTarget || !pTarget->IsAlive() || !pTarget->IsWithinDist(me, GetMaxAggroDistanceForMap()))
                {
                    StopMoving();
                    return;
                }
            }

            if (UseMount())
                return;
            
            UpdateWaypointMovement();
        }
        return;
    }

    if (ShouldIgnoreCombat())
    {
        UpdateFlagCarrierAI();
        UpdateWaypointMovement();
        return;
    }

    if (pVictim)
    {
        // Run away if oom
        if (me->GetPowerPercent(POWER_MANA) < 10.0f &&
            (m_role != ROLE_MELEE_DPS) &&
            (!me->HasUnitState(UNIT_STAT_ROOT)) &&
            (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            if (me->GetMotionMaster()->MoveDistance(pVictim, 70.0f))
                return;
        }

        // Healers and ranged DPS should away if more than 1 enemy is near
        if (m_role == ROLE_HEALER || m_role == ROLE_RANGE_DPS)
        {
            if (me->GetEnemyCountInRadiusAround(me, 10.0f) > 1 &&
                !me->HasUnitState(UNIT_STAT_ROOT) &&
                !me->HasAura(BB_NS_DRUID) &&
                !me->HasAura(BB_NS_SHAMAN) &&
                (pVictim->GetHealthPercent() > 50.0f) &&
                (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
            {
                if (!me->IsStopped())
                    me->StopMoving();
                me->GetMotionMaster()->Clear();
                if (me->GetMotionMaster()->MoveDistance(pVictim, 30.0f))
                    return;
            }
        }
    }

    // Select a new target if ther is a better target to select
    m_targetSelectTimer.Update(diff);
    if (m_targetSelectTimer.Passed())
    {
        m_targetSelectTimer.Reset(BB_NEW_TARGET_INTERVAL);
        if (pVictim &&
            me->IsInCombat() &&
            me->GetEnemyCountInRadiusAround(me, 10.0f) > 1 &&
            !me->IsMounted() &&
            m_role != ROLE_HEALER)
        {
            Unit* newVictim = SelectAttackTarget(pVictim);

            if (newVictim && (newVictim != pVictim))
            {
                if (pVictim)
                    me->AttackStop();
                else
                    AttackStart(newVictim);

                return;
            }
        }
    }

    if (!pVictim || !IsValidHostileTarget(pVictim) || 
        !pVictim->IsWithinDist(me, GetMaxAggroDistanceForMap()))
    {
        if (Unit* pNewVictim = SelectAttackTarget(pVictim))
        {
            if (pVictim != pNewVictim)
            {
                AttackStart(pNewVictim);
                return;
            }
        }

        if (me->GetVictim() &&
           (me != me->GetVictim()->GetVictim()))
        {
            me->AttackStop(false);
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
                StopMoving();
            return;
        }
    }
    else
    {
        if (!me->HasInArc(pVictim, 2 * M_PI_F / 3) && !me->IsMoving())
        {
            me->SetInFront(pVictim);
            me->SendMovementPacket(MSG_MOVE_SET_FACING, false);
        }

        if (!me->HasUnitState(UNIT_STAT_MELEE_ATTACKING) &&
           (m_role != ROLE_HEALER) &&
            IsValidHostileTarget(pVictim) &&
            AttackStart(pVictim))
            return;
    }

    if (me->IsInCombat())
        UpdateInCombatAI();
}

void BattleBotAI::UpdateBattleGroundAI()
{
    BattleGround* bg = me->GetBattleGround();
    if (!bg)
        return;

    switch (bg->GetTypeID())
    {
        case BATTLEGROUND_WS:
        {
            // Pick up dropped flags.
            if (GameObject* pGo = me->FindNearestGameObject(GO_WSG_DROPPED_SILVERWING_FLAG, INTERACTION_DISTANCE))
                pGo->Use(me);
            if (GameObject* pGo = me->FindNearestGameObject(GO_WSG_DROPPED_WARSONG_FLAG, INTERACTION_DISTANCE))
                pGo->Use(me);

            // Pick up stationary flags from bases.
            if (me->GetTeam() == HORDE)
            {
                if (GameObject* pGo = me->FindNearestGameObject(GO_WSG_SILVERWING_FLAG, INTERACTION_DISTANCE))
                    pGo->Use(me);
            }
            else
            {
                if (GameObject* pGo = me->FindNearestGameObject(GO_WSG_WARSONG_FLAG, INTERACTION_DISTANCE))
                    pGo->Use(me);
            }
            break;
        }
    }
}

void BattleBotAI::UpdateFlagCarrierAI()
{
    // First those that can be cast both in and out of combat.
    switch (me->GetClass())
    {
        case CLASS_PALADIN:
        {
            if (m_spells.paladin.pHolyShock && me->GetHealthPercent() < 90.0f &&
                CanTryToCastSpell(me, m_spells.paladin.pHolyShock))
            {
                me->CastSpell(me, m_spells.paladin.pHolyShock, false);
                return;
            }
            if (me->GetHealthPercent() < 60.0f)
            {
                if (FindAndHealInjuredAlly(60.0f, 60.0f))
                    return;
            }
            break;
        }
        case CLASS_SHAMAN:
        {
            // Swap out into caster form at low HP then heal up
            if (me->GetHealthPercent() < 60.0f)
            {
                if (m_spells.shaman.pGhostWolf &&
                    me->GetShapeshiftForm() == FORM_GHOSTWOLF)
                    me->RemoveAurasDueToSpellByCancel(m_spells.shaman.pGhostWolf->Id);
                return;

                if (me->GetShapeshiftForm() == FORM_NONE)
                {
                    if (FindAndHealInjuredAlly(60.0f, 60.0f))
                        return;
                }
            }

            if (m_spells.shaman.pGhostWolf && !me->IsMoving() &&
                CanTryToCastSpell(me, m_spells.shaman.pGhostWolf))
            {
                me->CastSpell(me, m_spells.shaman.pGhostWolf, false);
                return;
            }
            break;
        }
        case CLASS_MAGE:
        {
            if (m_spells.mage.pIceBarrier &&
                CanTryToCastSpell(me, m_spells.mage.pIceBarrier))
            {
                me->CastSpell(me, m_spells.mage.pIceBarrier, false);
                return;
            }
            if (m_spells.mage.pManaShield &&
                CanTryToCastSpell(me, m_spells.mage.pManaShield))
            {
                me->CastSpell(me, m_spells.mage.pManaShield, false);
                return;
            }
            if (m_spells.mage.pFireWard &&
                CanTryToCastSpell(me, m_spells.mage.pFireWard))
            {
                if (DoCastSpell(me, m_spells.mage.pFireWard) == SPELL_CAST_OK)
                    return;
            }
            break;
        }
        case CLASS_PRIEST:
        {
            if (m_spells.priest.pPowerWordShield &&
                CanTryToCastSpell(me, m_spells.priest.pPowerWordShield))
            {
                me->CastSpell(me, m_spells.priest.pPowerWordShield, false);
                return;
            }
            // Heal Self
            if (me->GetHealthPercent() < 60.0f)
            {
                if (m_spells.priest.pShadowform && me->GetShapeshiftForm() == FORM_SHADOW)
                    me->RemoveAurasDueToSpellByCancel(m_spells.priest.pShadowform->Id);

                if (me->GetShapeshiftForm() == FORM_NONE && FindAndHealInjuredAlly(60.0f, 60.0f))
                    return;
            }
            if (m_spells.priest.pHolyNova && me->GetHealthPercent() < 90.0f &&
                CanTryToCastSpell(me, m_spells.priest.pHolyNova))
            {
                me->CastSpell(me, m_spells.priest.pHolyNova, false);
                return;
            }
            if (Unit* HealTarget = SelectPeriodicHealTarget(80.0f, 90.0f))
                if (HealInjuredTargetPeriodic(HealTarget))
                    return;
            break;
        }
        case CLASS_WARRIOR:
        {
            if (m_spells.warrior.pDefensiveStance &&
                CanTryToCastSpell(me, m_spells.warrior.pDefensiveStance))
            {
                me->CastSpell(me, m_spells.warrior.pDefensiveStance, false);
                return;
            }
            break;
        }
        case CLASS_ROGUE:
        {
            if (m_spells.rogue.pSprint &&
                CanTryToCastSpell(me, m_spells.rogue.pSprint))
            {
                me->CastSpell(me, m_spells.rogue.pSprint, false);
                return;
            }
            break;
        }
        case CLASS_DRUID:
        {
            // Swap out into caster form at low HP then heal up
            if (me->GetHealthPercent() < 60.0f)
            {
                if (m_spells.druid.pTravelForm && me->GetShapeshiftForm() == FORM_TRAVEL)
                    me->RemoveAurasDueToSpellByCancel(m_spells.druid.pTravelForm->Id);

                if (me->GetShapeshiftForm() == FORM_NONE)
                {
                    if (FindAndHealInjuredAlly(60.0f, 60.0f))
                        return;
                }
            }
            if (me->GetShapeshiftForm() == FORM_NONE)
            {
                if (m_spells.druid.pTravelForm &&
                    CanTryToCastSpell(me, m_spells.druid.pTravelForm))
                {
                    me->CastSpell(me, m_spells.druid.pTravelForm, false);
                    return;
                }
            }
            else if (me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED) && me->GetPowerPercent(POWER_MANA) > 20.0f)
            {
                me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
            }
            break;
        }
    }

    Unit* pAttacker = me->GetAttackerForHelper();
    if (pAttacker)
    {
        switch (me->GetClass())
        {
            case CLASS_PALADIN:
            {
                if (m_spells.paladin.pHammerOfJustice &&
                    CanTryToCastSpell(pAttacker, m_spells.paladin.pHammerOfJustice))
                {
                    me->CastSpell(pAttacker, m_spells.paladin.pHammerOfJustice, false);
                    return;
                }
                if (me->GetHealthPercent() < 60.0f)
                {
                    if (FindAndHealInjuredAlly(60.0f, 60.0f))
                        return;
                }
                if (m_spells.paladin.pBlessingOfFreedom &&
                    me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED) &&
                    CanTryToCastSpell(me, m_spells.paladin.pBlessingOfFreedom))
                {
                    if (DoCastSpell(me, m_spells.paladin.pBlessingOfFreedom) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.paladin.pHolyShock &&
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
                break;
            }
            case CLASS_SHAMAN:
            {
                // Swap out into caster form at low HP then heal up
                if (me->GetHealthPercent() < 60.0f)
                {
                    if (m_spells.shaman.pGhostWolf &&
                        me->GetShapeshiftForm() == FORM_GHOSTWOLF)
                        me->RemoveAurasDueToSpellByCancel(m_spells.shaman.pGhostWolf->Id);
                    return;

                    if (me->GetShapeshiftForm() == FORM_NONE)
                    {
                        if (FindAndHealInjuredAlly(60.0f, 60.0f))
                            return;
                    }
                }
                if (m_spells.shaman.pFrostShock &&
                    CanTryToCastSpell(pAttacker, m_spells.shaman.pFrostShock))
                {
                    me->CastSpell(pAttacker, m_spells.shaman.pFrostShock, false);
                    return;
                }
                if (SummonShamanTotems())
                    return;
                break;
            }
            case CLASS_HUNTER:
            {
                if (m_spells.hunter.pAspectOfTheHawk && 
                    CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
                {
                    if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.hunter.pConcussiveShot &&
                    CanTryToCastSpell(pAttacker, m_spells.hunter.pConcussiveShot))
                {
                    if (DoCastSpell(pAttacker, m_spells.hunter.pConcussiveShot) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.hunter.pScatterShot &&
                    CanTryToCastSpell(pAttacker, m_spells.hunter.pScatterShot))
                {
                    me->SetInFront(pAttacker);
                    DoCastSpell(pAttacker, m_spells.hunter.pScatterShot);
                }
                break;
            }
            case CLASS_MAGE:
            {
                if (m_spells.mage.pBlink &&
                    (me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE)) &&
                    CanTryToCastSpell(me, m_spells.mage.pBlink))
                {
                    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                        me->GetMotionMaster()->MoveIdle();

                    if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.mage.pCounterspell &&
                    pAttacker->IsNonMeleeSpellCasted(false, false, true) &&
                    (pAttacker->GetClass() != CLASS_WARRIOR) &&
                    (pAttacker->GetClass() != CLASS_ROGUE) &&
                    (pAttacker->GetClass() != CLASS_HUNTER) &&
                    CanTryToCastSpell(pAttacker, m_spells.mage.pCounterspell))
                {
                    if (DoCastSpell(pAttacker, m_spells.mage.pCounterspell) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.mage.pFrostNova &&
                    CanTryToCastSpell(me, m_spells.mage.pFrostNova) &&
                    m_spells.mage.pFrostNova->IsTargetInRange(me, pAttacker))
                {
                    me->CastSpell(me, m_spells.mage.pFrostNova, false);
                    return;
                }
                if (m_spells.mage.pIceBarrier &&
                    CanTryToCastSpell(me, m_spells.mage.pIceBarrier))
                {
                    me->CastSpell(me, m_spells.mage.pIceBarrier, false);
                    return;
                }
                if (m_spells.mage.pManaShield &&
                    (me->GetPowerPercent(POWER_HEALTH) < 30.0f) &&
                    (me->GetPowerPercent(POWER_MANA) > 20.0f) &&
                    CanTryToCastSpell(me, m_spells.mage.pManaShield))
                {
                    me->CastSpell(me, m_spells.mage.pManaShield, false);
                    return;
                }
                if (m_spells.mage.pPolymorph &&
                    (pAttacker->GetDiminishing(DIMINISHING_POLYMORPH) != DIMINISHING_LEVEL_IMMUNE) &&
                    CanTryToCastSpell(pAttacker, m_spells.mage.pPolymorph))
                {
                    if (DoCastSpell(pAttacker, m_spells.mage.pPolymorph) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.mage.pFireWard &&
                    CanTryToCastSpell(me, m_spells.mage.pFireWard))
                {
                    if (DoCastSpell(me, m_spells.mage.pFireWard) == SPELL_CAST_OK)
                        return;
                }
                break;
            }
            case CLASS_PRIEST:
            {
                if (m_spells.priest.pDesperatePrayer &&
                    (me->GetRace() == RACE_HUMAN || me->GetRace() == RACE_DWARF) &&
                    (me->GetHealthPercent() < 25.0f) &&
                    CanTryToCastSpell(me, m_spells.priest.pDesperatePrayer))
                {
                    if (DoCastSpell(me, m_spells.priest.pDesperatePrayer) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.priest.pPowerWordShield &&
                    CanTryToCastSpell(me, m_spells.priest.pPowerWordShield))
                {
                    if (DoCastSpell(me, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.priest.pPsychicScream &&
                    CanTryToCastSpell(me, m_spells.priest.pPsychicScream) &&
                    m_spells.priest.pPsychicScream->IsTargetInRange(me, pAttacker))
                {
                    me->CastSpell(me, m_spells.priest.pPsychicScream, false);
                    return;
                }
                // Heal Self
                if (me->GetHealthPercent() < 60.0f)
                {
                    if (m_spells.priest.pShadowform &&
                        me->GetShapeshiftForm() == FORM_SHADOW)

                        me->RemoveAurasDueToSpellByCancel(m_spells.priest.pShadowform->Id);
                    if (me->GetShapeshiftForm() == FORM_NONE &&
                        FindAndHealInjuredAlly(60.0f, 60.0f))
                        return;
                }
                if (Unit* HealTarget = SelectPeriodicHealTarget(80.0f, 90.0f))
                    if (HealInjuredTargetPeriodic(HealTarget))
                        return;

                if (m_spells.priest.pSilence &&
                    pAttacker->IsNonMeleeSpellCasted(false, false, true) &&
                    (pAttacker->GetClass() != CLASS_WARRIOR) &&
                    (pAttacker->GetClass() != CLASS_ROGUE) &&
                    (pAttacker->GetClass() != CLASS_HUNTER) &&
                    CanTryToCastSpell(pAttacker, m_spells.priest.pSilence))
                {
                    if (DoCastSpell(pAttacker, m_spells.priest.pSilence) == SPELL_CAST_OK)
                        return;
                }
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
                if (m_spells.priest.pAbolishDisease)
                {
                    if (Unit* pFriend = SelectDispelTarget(m_spells.priest.pAbolishDisease))
                    {
                        if (CanTryToCastSpell(pFriend, m_spells.priest.pAbolishDisease))
                        {
                            if (DoCastSpell(pFriend, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                                return;
                        }
                    }
                }
                if (m_spells.priest.pShadowform &&
                    (me->GetPowerPercent(POWER_MANA) > 25.0f) &&
                    CanTryToCastSpell(me, m_spells.priest.pShadowform))
                {
                    if (DoCastSpell(me, m_spells.priest.pShadowform) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.priest.pInnerFire &&
                    (me->GetPowerPercent(POWER_MANA) > 25.0f) &&
                    CanTryToCastSpell(me, m_spells.priest.pInnerFire))
                {
                    if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
                    {
                        return;
                    }
                }
                break;
            }
            case CLASS_WARLOCK:
            {
                if (m_spells.warlock.pDeathCoil &&
                    CanTryToCastSpell(pAttacker, m_spells.warlock.pDeathCoil))
                {
                    me->SetInFront(pAttacker); //Turn around in the direction of the target.
                    me->CastSpell(pAttacker, m_spells.warlock.pDeathCoil, false);
                    return;
                }
                if (m_spells.warlock.pAmplifyCurse &&
                    CanTryToCastSpell(me, m_spells.warlock.pAmplifyCurse))
                {
                    if (DoCastSpell(me, m_spells.warlock.pAmplifyCurse) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.warlock.pCurseofExhaustion &&
                    CanTryToCastSpell(pAttacker, m_spells.warlock.pCurseofExhaustion))
                {
                    if (DoCastSpell(pAttacker, m_spells.warlock.pCurseofExhaustion) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.warlock.pCorruption &&
                    CanTryToCastSpell(pAttacker, m_spells.warlock.pCorruption))
                {
                    if (DoCastSpell(pAttacker, m_spells.warlock.pCorruption) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.warlock.pSiphonLife &&
                    CanTryToCastSpell(pAttacker, m_spells.warlock.pSiphonLife))
                {
                    if (DoCastSpell(pAttacker, m_spells.warlock.pSiphonLife) == SPELL_CAST_OK)
                        return;
                }
                break;
            }
            case CLASS_WARRIOR:
            {
                if (m_spells.warrior.pShieldWall && me->GetHealthPercent() < 50.0f &&
                    CanTryToCastSpell(me, m_spells.warrior.pShieldWall))
                {
                    me->CastSpell(me, m_spells.warrior.pShieldWall, false);
                    return;
                }
                if (m_spells.warrior.pLastStand &&
                    me->GetHealthPercent() < 30.0f &&
                    CanTryToCastSpell(me, m_spells.warrior.pLastStand))
                {
                    if (DoCastSpell(me, m_spells.warrior.pLastStand) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.warrior.pConcussionBlow &&
                    CanTryToCastSpell(pAttacker, m_spells.warrior.pConcussionBlow))
                {
                    if (DoCastSpell(pAttacker, m_spells.warrior.pConcussionBlow) == SPELL_CAST_OK)
                        return;
                }
                if (m_spells.warrior.pPiercingHowl &&
                    CanTryToCastSpell(pAttacker, m_spells.warrior.pPiercingHowl))
                {
                    if (DoCastSpell(pAttacker, m_spells.warrior.pPiercingHowl) == SPELL_CAST_OK)
                        return;
                }
                break;
            }
            case CLASS_ROGUE:
            {
                if (m_spells.rogue.pEvasion && me->GetHealthPercent() < 50.0f &&
                    CanTryToCastSpell(me, m_spells.rogue.pEvasion))
                {
                    me->CastSpell(me, m_spells.rogue.pEvasion, false);
                    return;
                }
                if (m_spells.rogue.pBlind)
                {
                    if (m_spells.rogue.pPreparation &&
                        !me->IsSpellReady(m_spells.rogue.pBlind->Id) &&
                        CanTryToCastSpell(me, m_spells.rogue.pPreparation))
                    {
                        if (DoCastSpell(me, m_spells.rogue.pPreparation) == SPELL_CAST_OK)
                            return;
                    }

                    if (CanTryToCastSpell(pAttacker, m_spells.rogue.pBlind))
                    {
                        if (DoCastSpell(pAttacker, m_spells.rogue.pBlind) == SPELL_CAST_OK)
                        {
                            return;
                        }
                    }
                }
                break;
            }
            case CLASS_DRUID:
            {
                if (m_spells.druid.pBarkskin && me->GetHealthPercent() < 50.0f &&
                    CanTryToCastSpell(me, m_spells.druid.pBarkskin))
                {
                    me->CastSpell(me, m_spells.druid.pBarkskin, false);
                    return;
                }
                // Swap out into caster form at low HP then heal up
                if (me->GetHealthPercent() < 60.0f)
                {
                    if (m_spells.druid.pTravelForm &&
                        me->GetShapeshiftForm() == FORM_TRAVEL)
                        me->RemoveAurasDueToSpellByCancel(m_spells.druid.pTravelForm->Id);

                    if (me->GetShapeshiftForm() == FORM_NONE)
                    {
                        if (m_spells.druid.pNaturesSwiftness &&
                            CanTryToCastSpell(me, m_spells.druid.pNaturesSwiftness))
                        {
                            if (DoCastSpell(me, m_spells.druid.pNaturesSwiftness) == SPELL_CAST_OK)
                                if (FindAndHealInjuredAlly(60.0f, 60.0f))
                                    return;
                        }
                    }
                }
                if (me->GetShapeshiftForm() == FORM_NONE)
                {
                    if (m_spells.druid.pTravelForm &&
                        CanTryToCastSpell(me, m_spells.druid.pTravelForm))
                    {
                        me->CastSpell(me, m_spells.druid.pTravelForm, false);
                        return;
                    }
                }
                else if (me->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED))
                {
                    me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
                }
                break;
            }
        }
    }
    else // no attackers
    {
        switch (me->GetClass())
        {
            case CLASS_HUNTER:
            {
                if (m_spells.hunter.pAspectOfTheCheetah &&
                    CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheCheetah))
                {
                    me->CastSpell(me, m_spells.hunter.pAspectOfTheCheetah, false);
                    return;
                }
                break;
            }
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI()
{
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
}

Unit* BattleBotAI::GetFlagCapper()
{
    // Check current victim first.. if they are capping flag no need to look at anything else
    Unit* pVictim = me->GetVictim();
    if (pVictim)
    {
        auto spell = pVictim->GetCurrentSpell(CURRENT_GENERIC_SPELL);
        if (spell && (spell->m_spellInfo->Id == SPELL_CAPTURE_BANNER))
            return pVictim;
    }

    // Check other players next..
    std::list<Player*> players;
    me->GetAlivePlayerListInRange(me, players, GetMaxAggroDistanceForMap());
    for (const auto& pTarget : players)
    {
        auto spell = pTarget->GetCurrentSpell(CURRENT_GENERIC_SPELL);
        if (spell && (spell->m_spellInfo->Id == SPELL_CAPTURE_BANNER) &&
            IsValidHostileTarget(pTarget))
            return pTarget;
    }

    return nullptr;
}

void BattleBotAI::UpdateInCombatAI()
{
    Unit* pVictim = me->GetVictim();
    // Taunt target if its attacking someone else.
    if (pVictim && pVictim->GetVictim() != me &&
        (me->GetHealthPercent() > 25.0f) &&
        pVictim->IsCreature())
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

void BattleBotAI::UpdateOutOfCombatAI_Paladin()
{
    if (m_spells.paladin.pAura &&
        CanTryToCastSpell(me, m_spells.paladin.pAura))
    {
        if (DoCastSpell(me, m_spells.paladin.pAura) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.paladin.pBlessingBuff)
    {
        if (Player* pTarget = SelectBuffTarget(m_spells.paladin.pBlessingBuff))
        {
            if (CanTryToCastSpell(pTarget, m_spells.paladin.pBlessingBuff))
            {
                if (DoCastSpell(pTarget, m_spells.paladin.pBlessingBuff) == SPELL_CAST_OK)
                {
                    m_isBuffing = true;
                    return;
                }
            }  
        }
    }

    if (m_isBuffing &&
       (!m_spells.paladin.pBlessingBuff ||
        !me->HasGCD(m_spells.paladin.pBlessingBuff)))
    {
        m_isBuffing = false;
    }

    if (FindAndHealInjuredAlly(60.0f, 60.0f));
        return;
}

void BattleBotAI::UpdateInCombatAI_Paladin()
{
    if (m_spells.paladin.pDivineShield &&
       (me->GetHealthPercent() < 20.0f) &&
       (me->GetPowerPercent(POWER_MANA) > 40.0f) &&
       !me->HasAura(AURA_WARSONG_FLAG) &&
        CanTryToCastSpell(me, m_spells.paladin.pDivineShield))
    {
        if (DoCastSpell(me, m_spells.paladin.pDivineShield) == SPELL_CAST_OK)
            return;
    }

    // Running away logic
    if (m_role == ROLE_HEALER)
    {
        if (Unit* pVictim = me->GetVictim())
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
            {
                // BOP self at low HP, otherwise freedom self to run away
                if (me->GetHealthPercent() < 20.0f &&
                    m_spells.paladin.pBlessingOfProtection &&
                    pVictim->CanReachWithMeleeAutoAttack(me) &&
                    IsMeleeDamageClass(pVictim->GetClass()) &&
                    !me->HasAura(AURA_WARSONG_FLAG) &&
                    CanTryToCastSpell(me, m_spells.paladin.pBlessingOfProtection))
                {
                    if (DoCastSpell(me, m_spells.paladin.pBlessingOfProtection) == SPELL_CAST_OK)
                        return;
                }
                else
                {
                    if (m_spells.paladin.pBlessingOfFreedom &&
                        CanTryToCastSpell(me, m_spells.paladin.pBlessingOfFreedom))
                    {
                        if (DoCastSpell(me, m_spells.paladin.pBlessingOfFreedom) == SPELL_CAST_OK)
                            return;
                    }
                }

                if (m_spells.paladin.pHammerOfJustice &&
                    CanTryToCastSpell(pVictim, m_spells.paladin.pHammerOfJustice))
                {
                    if (DoCastSpell(pVictim, m_spells.paladin.pHammerOfJustice) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.paladin.pHolyShock &&
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
            }
        }
    }

    if (m_role == ROLE_HEALER)
    {
        if (FindAndHealInjuredAlly(80.0f, 80.0f))
            return;
    }
    else
    {
        if (FindAndHealInjuredAlly(me->IsTotalImmune() ? 80.0f : 40.0f, 50.0f))
            return;
    }

    bool const hasSeal = m_spells.paladin.pSeal && me->HasAura(m_spells.paladin.pSeal->Id);

    if (!hasSeal &&
        m_spells.paladin.pSeal &&
        CanTryToCastSpell(me, m_spells.paladin.pSeal))
    {
        me->CastSpell(me, m_spells.paladin.pSeal, false);
    }
    
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.paladin.pRepentance &&
            (!me->CanReachWithMeleeAutoAttack(pVictim) || pVictim->IsNonMeleeSpellCasted()) &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pRepentance))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pRepentance) == SPELL_CAST_OK)
                return;
        }
        if (hasSeal && m_spells.paladin.pJudgement &&
            CanTryToCastSpell(pVictim, m_spells.paladin.pJudgement))
        {
            if (DoCastSpell(pVictim, m_spells.paladin.pJudgement) == SPELL_CAST_OK)
                return;
        }
        if (m_spells.paladin.pHammerOfJustice &&
            pVictim->IsNonMeleeSpellCasted() &&
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
        if (m_spells.paladin.pHolyShield &&
            CanTryToCastSpell(me, m_spells.paladin.pHolyShield) &&
           (IsMeleeDamageClass(pVictim->GetClass()) || (GetAttackersInRangeCount(8.0f) > 1)))
        {
            if (DoCastSpell(me, m_spells.paladin.pHolyShield) == SPELL_CAST_OK)
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
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE &&
           !me->CanReachWithMeleeAutoAttack(pVictim))
        {
            me->GetMotionMaster()->MoveChase(pVictim);
        }
    }

    if (Unit* pFriend = me->FindLowestHpFriendlyUnit(30.0f, 70, true, me))
    {
        if (Unit* pVictim = pFriend->GetVictim())
        {
            if (m_spells.paladin.pBlessingOfProtection &&
                !IsPhysicalDamageClass(pFriend->GetClass()) &&
                pVictim->CanReachWithMeleeAutoAttack(pFriend) &&
                !pFriend->HasAura(AURA_WARSONG_FLAG) &&
                CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfProtection) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.paladin.pBlessingOfSacrifice &&
                pFriend->HasAura(AURA_WARSONG_FLAG) &&
                CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfSacrifice) == SPELL_CAST_OK)
                    return;
            }
        }
        
        if (m_spells.paladin.pLayOnHands &&
           (pFriend->GetHealthPercent() < 15.0f) &&
            CanTryToCastSpell(pFriend, m_spells.paladin.pLayOnHands))
        {
            if (DoCastSpell(pFriend, m_spells.paladin.pLayOnHands) == SPELL_CAST_OK)
                return;
        }
    }

    if (Unit* pFriend = me->FindLowestHpFriendlyUnit(30.0f, 100, true, me))
    {
        if (m_role == ROLE_HEALER)
        {
            if (m_spells.paladin.pBlessingOfFreedom &&
                (pFriend->HasUnitState(UNIT_STAT_ROOT) || pFriend->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED)) &&
                CanTryToCastSpell(pFriend, m_spells.paladin.pBlessingOfFreedom))
            {
                if (DoCastSpell(pFriend, m_spells.paladin.pBlessingOfFreedom) == SPELL_CAST_OK)
                    return;
            }
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

    FindAndHealInjuredAlly(me->IsTotalImmune() ? 80.0f : 40.0f, 50.0f);
}

void BattleBotAI::UpdateOutOfCombatAI_Shaman()
{
    // Swap out into caster form at low HP then heal up if carrying the WSG flag
    if (me->GetHealthPercent() < 60.0f)
    {
        if (m_spells.shaman.pGhostWolf &&
            me->GetShapeshiftForm() == FORM_GHOSTWOLF)
            me->RemoveAurasDueToSpellByCancel(m_spells.shaman.pGhostWolf->Id);
        return;

        if (me->GetShapeshiftForm() == FORM_NONE)
        {
            if (!me->IsMounted() &&
                (!GetMountSpellId() || me->HasAura(AURA_WARSONG_FLAG) || me->HasAura(AURA_SILVERWING_FLAG)))
            {
                if (FindAndHealInjuredAlly(60.0f, 60.0f))
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

    if (me->GetVictim())
    {
        if (SummonShamanTotems())
            return;

        UpdateInCombatAI_Shaman();
    }
    else
    {
        if (m_spells.shaman.pGhostWolf &&
           !me->IsMoving() && !me->IsMounted() &&
           (!GetMountSpellId() || me->HasAura(AURA_WARSONG_FLAG) || me->HasAura(AURA_SILVERWING_FLAG)) &&
            CanTryToCastSpell(me, m_spells.shaman.pGhostWolf))
        {
            if (DoCastSpell(me, m_spells.shaman.pGhostWolf) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateInCombatAI_Shaman()
{
    if (m_spells.shaman.pGhostWolf &&
        me->GetShapeshiftForm() == FORM_GHOSTWOLF)
        me->RemoveAurasDueToSpellByCancel(m_spells.shaman.pGhostWolf->Id);

    if (m_spells.shaman.pNaturesSwiftness &&
        (me->GetHealthPercent() <= 40.0f) &&
        (me->GetPowerPercent(POWER_MANA) > 20.0f) &&
        CanTryToCastSpell(me, m_spells.shaman.pNaturesSwiftness))
    {
        if (DoCastSpell(me, m_spells.shaman.pNaturesSwiftness) == SPELL_CAST_OK)
            return;
    }

    if (m_role == ROLE_HEALER)
    {
        if (FindAndHealInjuredAlly(80.0f, 80.0f))
            return;
    }
    else
    {
        if (FindAndHealInjuredAlly(40.0f, 40.0f))
            return;
    }

    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.shaman.pManaTideTotem &&
           (me->GetPowerPercent(POWER_MANA) < 50.0f) &&
            CanTryToCastSpell(me, m_spells.shaman.pManaTideTotem))
        {
            if (DoCastSpell(me, m_spells.shaman.pManaTideTotem) == SPELL_CAST_OK)
                return;
        }

        // Running away logic
        if (m_role == ROLE_HEALER || m_role == ROLE_RANGE_DPS)
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
            {
                if (SummonShamanTotems())
                    return;
            }
        }

        if (m_spells.shaman.pElementalMastery &&
            me->GetAttackers().empty() &&
            CanTryToCastSpell(me, m_spells.shaman.pElementalMastery))
        {
            if (DoCastSpell(me, m_spells.shaman.pElementalMastery) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.shaman.pEarthShock &&
            pVictim->IsNonMeleeSpellCasted(false, false, true) &&
            pVictim->GetClass() != CLASS_WARRIOR &&
            pVictim->GetClass() != CLASS_ROGUE &&
            pVictim->GetClass() != CLASS_HUNTER &&
            CanTryToCastSpell(pVictim, m_spells.shaman.pEarthShock))
        {
            if (DoCastSpell(pVictim, m_spells.shaman.pEarthShock) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.shaman.pFrostShock &&
            pVictim->IsMoving() ||
            pVictim->IsMounted() || 
            pVictim->HasAura(AURA_SILVERWING_FLAG) || 
            pVictim->HasAura(AURA_WARSONG_FLAG)
            && CanTryToCastSpell(pVictim, m_spells.shaman.pFrostShock))
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

        if (m_role != ROLE_MELEE_DPS)
        {
            if (m_spells.shaman.pChainLightning &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pChainLightning))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pChainLightning) == SPELL_CAST_OK)
                    return;
            }
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
        
        if (m_role != ROLE_MELEE_DPS)
        {
            if (m_spells.shaman.pLightningBolt &&
                !me->CanReachWithMeleeAutoAttack(pVictim) &&
                CanTryToCastSpell(pVictim, m_spells.shaman.pLightningBolt))
            {
                if (DoCastSpell(pVictim, m_spells.shaman.pLightningBolt) == SPELL_CAST_OK)
                    return;
            }
        }        
    }

    if (SummonShamanTotems())
        return;

    if (m_spells.shaman.pLightningShield &&
        CanTryToCastSpell(me, m_spells.shaman.pLightningShield))
    {
        if (DoCastSpell(me, m_spells.shaman.pLightningShield) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.shaman.pCureDisease &&
        CanTryToCastSpell(me, m_spells.shaman.pCureDisease) &&
        IsValidDispelTarget(me, m_spells.shaman.pCureDisease))
    {
        if (DoCastSpell(me, m_spells.shaman.pCureDisease) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.shaman.pCurePoison &&
        CanTryToCastSpell(me, m_spells.shaman.pCurePoison) &&
        IsValidDispelTarget(me, m_spells.shaman.pCurePoison))
    {
        if (DoCastSpell(me, m_spells.shaman.pCurePoison) == SPELL_CAST_OK)
            return;
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Hunter()
{
    if (m_spells.hunter.pFreezingTrap &&
        !me->IsMounted() &&
        CanTryToCastSpell(me, m_spells.hunter.pFreezingTrap))
    {
        if (DoCastSpell(me, m_spells.hunter.pFreezingTrap) == SPELL_CAST_OK)
            return;
    }

    // Remove Feign death if > 25% HP
    if (me->HasAura(BB_FEIGN_DEATH_AURA) &&
        me->GetHealthPercent() > 25.0f)
        me->RemoveAurasDueToSpell(BB_FEIGN_DEATH_AURA);

    if (m_spells.hunter.pAspectOfTheHawk &&
        CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
    {
        if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
            return;
    }

    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.hunter.pHuntersMark &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pHuntersMark))
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
            }
        }

        UpdateInCombatAI_Hunter();
    }
}

void BattleBotAI::UpdateInCombatAI_Hunter()
{
    if (me->HasAura(BB_FEIGN_DEATH_AURA) &&
        me->GetHealthPercent() > 25.0f)
        me->RemoveAurasDueToSpell(BB_FEIGN_DEATH_AURA);

    if (Unit* pVictim = me->GetVictim())
    {
        // Feign death spells being cast on me
        if (m_spells.hunter.pFeignDeath &&
            pVictim->IsNonMeleeSpellCasted(false, false, true) &&
            (pVictim->GetClass() != CLASS_WARRIOR) &&
            (pVictim->GetClass() != CLASS_ROGUE) &&
            (pVictim->GetClass() != CLASS_HUNTER) &&
            !me->HasAura(AURA_WARSONG_FLAG) &&
            !me->HasAura(AURA_SILVERWING_FLAG) &&
            CanTryToCastSpell(me, m_spells.hunter.pFeignDeath))
        {
            if (DoCastSpell(me, m_spells.hunter.pFeignDeath) == SPELL_CAST_OK)
                return;
        }

        // Remove Feign death at < 25% HP
        if (me->GetHealthPercent() < (rand_chance() / 5.0f))
        {
            if (m_spells.hunter.pFeignDeath &&
                !me->HasAura(AURA_WARSONG_FLAG) &&
                !me->HasAura(AURA_SILVERWING_FLAG) &&
                CanTryToCastSpell(me, m_spells.hunter.pFeignDeath))
            {
                if (DoCastSpell(me, m_spells.hunter.pFeignDeath) == SPELL_CAST_OK)
                    return;
            }
        }

        if (Pet* pPet = me->GetPet())
        {
            if (pPet->IsAlive())
            {
                if (m_spells.hunter.pBestialWrath &&
                    CanTryToCastSpell(pPet, m_spells.hunter.pBestialWrath))
                {
                    if (DoCastSpell(pPet, m_spells.hunter.pBestialWrath) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.hunter.pGrowl &&
                    pVictim->IsCreature() &&
                    CanTryToCastPetSpell(pVictim, m_spells.hunter.pGrowl))
                {
                    if (DoCastPetSpell(pVictim, m_spells.hunter.pGrowl) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.hunter.pBite &&
                    CanTryToCastPetSpell(pVictim, m_spells.hunter.pBite))
                {
                    if (DoCastPetSpell(pVictim, m_spells.hunter.pBite) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.hunter.pClaw &&
                    CanTryToCastPetSpell(pVictim, m_spells.hunter.pClaw))
                {
                    if (DoCastPetSpell(pVictim, m_spells.hunter.pClaw) == SPELL_CAST_OK)
                        return;
                }

                if (pPet->GetDistance(pVictim) > 20.0f)
                {
                    if (m_spells.hunter.pDash &&
                        CanTryToCastPetSpell(pPet, m_spells.hunter.pDash))
                    {
                        if (DoCastPetSpell(pPet, m_spells.hunter.pDash) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.hunter.pDive &&
                        CanTryToCastPetSpell(pPet, m_spells.hunter.pDive))
                    {
                        if (DoCastPetSpell(pPet, m_spells.hunter.pDive) == SPELL_CAST_OK)
                            return;
                    }
                }

                if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_GORILLA)
                {
                    if (m_spells.hunter.pThunderstomp &&
                        CanTryToCastPetSpell(pVictim, m_spells.hunter.pThunderstomp))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.hunter.pThunderstomp) == SPELL_CAST_OK)
                            return;
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_SPIDER)
                {
                    if (m_spells.hunter.pScorpidPoison &&
                        CanTryToCastPetSpell(pVictim, m_spells.hunter.pScorpidPoison))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.hunter.pScorpidPoison) == SPELL_CAST_OK)
                            return;
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_WIND_SERPENT)
                {
                    if (m_spells.hunter.pLightningBreath &&
                        CanTryToCastPetSpell(pVictim, m_spells.hunter.pLightningBreath))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.hunter.pLightningBreath) == SPELL_CAST_OK)
                            return;
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_BOAR)
                {
                    if (m_spells.hunter.pCharge &&
                        CanTryToCastPetSpell(pVictim, m_spells.hunter.pCharge))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.hunter.pCharge) == SPELL_CAST_OK)
                            return;
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_WOLF)
                {
                    if (m_spells.hunter.pFuriousHowl &&
                        CanTryToCastPetSpell(pPet, m_spells.hunter.pFuriousHowl))
                    {
                        if (DoCastPetSpell(pPet, m_spells.hunter.pFuriousHowl) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            me->GetMotionMaster()->MoveChase(pVictim, 25.0f);
        }

        if (me->HasSpell(BB_SPELL_AUTO_SHOT) &&
            !me->IsMoving() &&
            (me->GetCombatDistance(pVictim) > 8.0f) &&
            !me->IsNonMeleeSpellCasted())
        {
            switch (me->CastSpell(pVictim, BB_SPELL_AUTO_SHOT, false))
            {
                case SPELL_FAILED_NEED_AMMO:
                case SPELL_FAILED_NO_AMMO:
                {
                    AddHunterAmmo();
                    break;
                }
            }
        }

        // Running away logic
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
        {
            if (m_spells.hunter.pScatterShot &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pScatterShot))
            {
                me->SetInFront(pVictim);
                DoCastSpell(pVictim, m_spells.hunter.pScatterShot);
            }
        }

        if (m_spells.hunter.pAimedShot &&
            !pVictim->IsMoving() &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pAimedShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pAimedShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pConcussiveShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pConcussiveShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pConcussiveShot) == SPELL_CAST_OK)
                return;
        }  

        if (pVictim->IsCaster())
        {
            if (m_spells.hunter.pViperSting &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pViperSting))
            {
                if (DoCastSpell(pVictim, m_spells.hunter.pViperSting) == SPELL_CAST_OK)
                    return;
            }
        }
        else
        {
            if (m_spells.hunter.pScorpidSting &&
                CanTryToCastSpell(pVictim, m_spells.hunter.pScorpidSting))
            {
                if (DoCastSpell(pVictim, m_spells.hunter.pScorpidSting) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.hunter.pSerpentSting &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pSerpentSting))
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

        if (m_spells.hunter.pArcaneShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pArcaneShot))
        {
            if (DoCastSpell(pVictim, m_spells.hunter.pArcaneShot) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.hunter.pScatterShot &&
            CanTryToCastSpell(pVictim, m_spells.hunter.pScatterShot))
        {
            DoCastSpell(pVictim, m_spells.hunter.pScatterShot);
        }

        if (m_spells.hunter.pAspectOfTheHawk &&
            CanTryToCastSpell(me, m_spells.hunter.pAspectOfTheHawk))
        {
            if (DoCastSpell(me, m_spells.hunter.pAspectOfTheHawk) == SPELL_CAST_OK)
                return;
        }

        if (pVictim->CanReachWithMeleeAutoAttack(me))
        {
            if (m_spells.hunter.pDeterrence &&
                (me->GetHealthPercent() < 50.0f) &&
                CanTryToCastSpell(me, m_spells.hunter.pDeterrence))
            {
                if (DoCastSpell(me, m_spells.hunter.pDeterrence) == SPELL_CAST_OK)
                    return;
            }

            if (me->HasUnitState(UNIT_STAT_ROOT))
            {
                if (m_spells.hunter.pMongooseBite &&
                    CanTryToCastSpell(pVictim, m_spells.hunter.pMongooseBite))
                {
                    if (DoCastSpell(pVictim, m_spells.hunter.pMongooseBite) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.hunter.pRaptorStrike &&
                    CanTryToCastSpell(pVictim, m_spells.hunter.pRaptorStrike))
                {
                    if (DoCastSpell(pVictim, m_spells.hunter.pRaptorStrike) == SPELL_CAST_OK)
                        return;
                }
            }
            else
            {
                if (m_spells.hunter.pWingClip &&
                    CanTryToCastSpell(pVictim, m_spells.hunter.pWingClip))
                {
                    DoCastSpell(pVictim, m_spells.hunter.pWingClip);
                }
                if (m_spells.hunter.pCounterattack &&
                    CanTryToCastSpell(pVictim, m_spells.hunter.pCounterattack))
                {
                    DoCastSpell(pVictim, m_spells.hunter.pCounterattack);
                }
            }
        }

        if (!me->HasUnitState(UNIT_STAT_ROOT) &&
            (me->GetCombatDistance(pVictim) < 8.0f) &&
            !me->HasAura(BB_DETERRENCE) &&
             me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE)
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            if (me->GetMotionMaster()->MoveDistance(pVictim, 25.0f))
                return;
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Mage()
{
    BattleGround* bg = me->GetBattleGround();

    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.mage.pArcaneBrilliance)
        {
            if (CanTryToCastSpell(me, m_spells.mage.pArcaneBrilliance))
            {
                if (DoCastSpell(me, m_spells.mage.pArcaneBrilliance) == SPELL_CAST_OK)
                    return;
            }
        }
        else if (m_spells.mage.pArcaneIntellect)
        {
            if (CanTryToCastSpell(me, m_spells.mage.pArcaneIntellect))
            {
                if (DoCastSpell(me, m_spells.mage.pArcaneIntellect) == SPELL_CAST_OK)
                    return;
            }
        }
    }

    if (m_spells.mage.pIceArmor &&
        CanTryToCastSpell(me, m_spells.mage.pIceArmor))
    {
        if (DoCastSpell(me, m_spells.mage.pIceArmor) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.mage.pDampenMagic &&
        CanTryToCastSpell(me, m_spells.mage.pDampenMagic))
    {
        if (DoCastSpell(me, m_spells.mage.pDampenMagic) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.mage.pIceBarrier &&
        CanTryToCastSpell(me, m_spells.mage.pIceBarrier))
    {
        if (DoCastSpell(me, m_spells.mage.pIceBarrier) == SPELL_CAST_OK)
            return;
    }

    if (me->GetVictim())
        UpdateInCombatAI_Mage();
}

void BattleBotAI::UpdateInCombatAI_Mage()
{
    if (Unit* pVictim = me->GetVictim())
    {

        if (m_spells.mage.pBlink &&
            (me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE)) &&
            CanTryToCastSpell(me, m_spells.mage.pBlink))
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                me->GetMotionMaster()->MoveIdle();

            if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pIceBlock &&
            (me->GetHealthPercent() < 20.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pIceBlock))
        {
            if (DoCastSpell(me, m_spells.mage.pIceBlock) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pManaShield &&
            IsPhysicalDamageClass(pVictim->GetClass()) &&
            (me->GetPowerPercent(POWER_HEALTH) < 30.0f) &&
            (me->GetPowerPercent(POWER_MANA) > 20.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pManaShield))
        {
            if (DoCastSpell(me, m_spells.mage.pManaShield) == SPELL_CAST_OK)
                return;
        }

        if (!me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE) &&
            (me->GetPowerPercent(POWER_HEALTH) < 20.0f))
        {
            if (m_spells.mage.pFrostNova &&
                !pVictim->HasUnitState(UNIT_STAT_ROOT) &&
                !pVictim->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                CanTryToCastSpell(me, m_spells.mage.pFrostNova))
            {
                DoCastSpell(me, m_spells.mage.pFrostNova);
            }

            if (me->GetMotionMaster()->MoveDistance(pVictim, 50.0f))
                return;
        }

        auto spell = pVictim->GetCurrentSpell(CURRENT_GENERIC_SPELL);
        if (m_spells.mage.pCounterspell &&
            pVictim->IsNonMeleeSpellCasted(false, false, true) &&
            (pVictim->GetClass() != CLASS_WARRIOR) &&
            (pVictim->GetClass() != CLASS_ROGUE) &&
            (pVictim->GetClass() != CLASS_HUNTER) &&
            (spell && (spell->m_spellInfo->Id != SPELL_CAPTURE_BANNER)) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pCounterspell))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pCounterspell) == SPELL_CAST_OK)
                return;
        }

        // Running away logic
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
        {

            if (m_spells.mage.pBlink &&
                (me->GetEnemyCountInRadiusAround(me, 10.0f) == 0) &&
                CanTryToCastSpell(me, m_spells.mage.pBlink))
            {
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                    me->GetMotionMaster()->MoveIdle();

                if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.mage.pFrostNova &&
                !pVictim->HasUnitState(UNIT_STAT_ROOT) &&
                !pVictim->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                CanTryToCastSpell(me, m_spells.mage.pFrostNova))
            {
                DoCastSpell(me, m_spells.mage.pFrostNova);
            }

            if (m_spells.mage.pConeofCold &&
                (me->GetEnemyCountInRadiusAround(me, 8.0f) > 0) &&
                CanTryToCastSpell(me, m_spells.mage.pConeofCold))
            {
                me->SetInFront(pVictim);
                if (DoCastSpell(pVictim, m_spells.mage.pConeofCold) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.mage.pFireWard &&
                (pVictim->GetClass() == CLASS_MAGE || pVictim->GetClass() == CLASS_WARLOCK) &&
                CanTryToCastSpell(me, m_spells.mage.pFireWard))
            {
                if (DoCastSpell(me, m_spells.mage.pFireWard) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.mage.pRemoveLesserCurse &&
                CanTryToCastSpell(me, m_spells.mage.pRemoveLesserCurse) &&
                IsValidDispelTarget(me, m_spells.mage.pRemoveLesserCurse))
            {
                if (DoCastSpell(me, m_spells.mage.pRemoveLesserCurse) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.mage.pConeofCold &&
            pVictim->HasAura(m_spells.mage.pFrostNova->Id) &&
            (me->GetCombatDistance(pVictim) <= 10.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pConeofCold))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pConeofCold) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPolymorph &&
            pVictim->IsMounted() &&
            (pVictim->GetDiminishing(DIMINISHING_POLYMORPH) != DIMINISHING_LEVEL_IMMUNE) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pPolymorph))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pPolymorph) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFireWard &&
            (pVictim->GetClass() == CLASS_MAGE || pVictim->GetClass() == CLASS_WARLOCK) &&
            CanTryToCastSpell(me, m_spells.mage.pFireWard))
        {
            if (DoCastSpell(me, m_spells.mage.pFireWard) == SPELL_CAST_OK)
                return;
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            me->GetMotionMaster()->MoveChase(pVictim, 25.0f);
        }
        else if (pVictim->CanReachWithMeleeAutoAttack(me) &&
            (pVictim->GetVictim() == me) &&
            (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
        {
            if (m_spells.mage.pBlink &&
                (me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE)) &&
                CanTryToCastSpell(me, m_spells.mage.pBlink))
            {
                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                    me->GetMotionMaster()->MoveIdle();

                if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                    return;
            }

            if (!me->HasUnitState(UNIT_STAT_CAN_NOT_MOVE))
            {
                if (m_spells.mage.pFrostNova &&
                    !pVictim->HasUnitState(UNIT_STAT_ROOT) &&
                    !pVictim->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                    CanTryToCastSpell(me, m_spells.mage.pFrostNova))
                {
                    DoCastSpell(me, m_spells.mage.pFrostNova);
                }

                if (me->GetMotionMaster()->MoveDistance(pVictim, 25.0f))
                    return;
            }

            if (m_spells.mage.pConeofCold &&
                CanTryToCastSpell(me, m_spells.mage.pConeofCold))
            {
                if (DoCastSpell(pVictim, m_spells.mage.pConeofCold) == SPELL_CAST_OK)
                    return;
            }
        }

        if (me->GetEnemyCountInRadiusAround(me, 10.0f) > 3)
        {
            if (m_spells.mage.pArcaneExplosion &&
                CanTryToCastSpell(me, m_spells.mage.pArcaneExplosion))
            {
                if (DoCastSpell(me, m_spells.mage.pArcaneExplosion) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.mage.pRemoveLesserCurse &&
            (me->GetAttackers().size() < 3) &&
            CanTryToCastSpell(me, m_spells.mage.pRemoveLesserCurse) &&
            IsValidDispelTarget(me, m_spells.mage.pRemoveLesserCurse))
        {
            if (DoCastSpell(me, m_spells.mage.pRemoveLesserCurse) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPolymorph)
        {
            if (Unit* pTarget = SelectAttackerDifferentFrom(pVictim))
            {
                if (CanTryToCastSpell(pVictim, m_spells.mage.pPolymorph) &&
                    (pVictim->GetHealthPercent() > 80.0f) &&
                    (pVictim->GetDiminishing(DIMINISHING_POLYMORPH) != DIMINISHING_LEVEL_IMMUNE))
                {
                    if (DoCastSpell(pVictim, m_spells.mage.pPolymorph) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.mage.pCombustion &&
            CanTryToCastSpell(me, m_spells.mage.pCombustion))
        {
            if (DoCastSpell(me, m_spells.mage.pCombustion) == SPELL_CAST_OK)
                return;
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

        // Blink after targets out of range offensively if it's safe to do so
        if (m_spells.mage.pBlink &&
            (me->GetEnemyCountInRadiusAround(me, 10.0f) == 0) &&
            (me->GetDistance(pVictim) >= 30.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pBlink))
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
                me->GetMotionMaster()->MoveIdle();

            if (DoCastSpell(me, m_spells.mage.pBlink) == SPELL_CAST_OK)
                return;
        }


        if (m_spells.mage.pFireBlast &&
            (me->GetDistance(pVictim) <= 20.0f) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireBlast))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pBlastWave &&
            me->GetEnemyCountInRadiusAround(me, 8.0f) &&
            CanTryToCastSpell(me, m_spells.mage.pBlastWave))
        {
            if (DoCastSpell(me, m_spells.mage.pBlastWave) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPyroblast &&
            m_spells.mage.pPresenceOfMind &&
            me->HasAura(m_spells.mage.pPresenceOfMind->Id) &&
            CanTryToCastSpell(pVictim, m_spells.mage.pPyroblast))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pPyroblast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pFrostbolt &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFrostbolt))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFrostbolt) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pPyroblast &&
            m_spells.mage.pFireball &&
            CanTryToCastSpell(pVictim, m_spells.mage.pFireball))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pFireball) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pScorch &&
            CanTryToCastSpell(pVictim, m_spells.mage.pScorch))
        {
            if (DoCastSpell(pVictim, m_spells.mage.pScorch) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.mage.pEvocation &&
            (me->GetPowerPercent(POWER_MANA) < 20.0f) &&
            (me->GetEnemyCountInRadiusAround(me, 10.0f) == 0) &&
            CanTryToCastSpell(me, m_spells.mage.pEvocation))
        {
            if (DoCastSpell(me, m_spells.mage.pEvocation) == SPELL_CAST_OK)
                return;
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
            return;
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Priest()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.priest.pPrayerofFortitude)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofFortitude))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofFortitude))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pPrayerofFortitude) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }

        if (m_spells.priest.pPrayerofSpirit)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pPrayerofSpirit))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pPrayerofSpirit))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pPrayerofSpirit) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }

        if (m_spells.priest.pShadowProtection)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.priest.pShadowProtection))
            {
                if (CanTryToCastSpell(pTarget, m_spells.priest.pShadowProtection))
                {
                    if (DoCastSpell(pTarget, m_spells.priest.pShadowProtection) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }
    else if (bg && bg->GetStatus() == STATUS_IN_PROGRESS)
    {
        // Heal
        if (me->GetShapeshiftForm() == FORM_NONE &&
            FindAndHealInjuredAlly(60.0f, 60.0f))
            return;

        if (m_spells.priest.pPowerWordFortitude &&
            IsValidBuffTarget(me, m_spells.priest.pPowerWordFortitude) &&
            CanTryToCastSpell(me, m_spells.priest.pPowerWordFortitude))
        {
            if (DoCastSpell(me, m_spells.priest.pPowerWordFortitude) == SPELL_CAST_OK)
            {
                m_isBuffing = true;
                return;
            }
        }
    }

    if (m_spells.priest.pFearWard &&
        (me->GetRace() == RACE_DWARF) &&
        CanTryToCastSpell(me, m_spells.priest.pFearWard))
    {
        if (DoCastSpell(me, m_spells.priest.pFearWard) == SPELL_CAST_OK)
        {
            m_isBuffing = true;
            return;
        }
    }

    if (m_spells.priest.pInnerFire &&
        CanTryToCastSpell(me, m_spells.priest.pInnerFire))
    {
        if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
        {
            m_isBuffing = true;
            return;
        }
    }

    if (m_spells.priest.pTouchofWeakness &&
        (me->GetRace() == RACE_UNDEAD) &&
        CanTryToCastSpell(me, m_spells.priest.pTouchofWeakness))
    {
        if (DoCastSpell(me, m_spells.priest.pTouchofWeakness) == SPELL_CAST_OK)
        {
            m_isBuffing = true;
            return;
        }
    }

    if (m_spells.priest.pShadowform &&
        CanTryToCastSpell(me, m_spells.priest.pShadowform))
    {
        if (DoCastSpell(me, m_spells.priest.pShadowform) == SPELL_CAST_OK)
            return;
    }

    if (m_isBuffing &&
        (!m_spells.priest.pPowerWordFortitude ||
            !me->HasGCD(m_spells.priest.pPowerWordFortitude)))
    {
        m_isBuffing = false;
    }

    if (me->GetVictim())
        UpdateInCombatAI_Priest();
}

void BattleBotAI::UpdateInCombatAI_Priest()
{
    if (m_spells.priest.pDesperatePrayer &&
        (me->GetRace() == RACE_HUMAN || me->GetRace() == RACE_DWARF) &&
        (me->GetHealthPercent() < 25.0f) &&
        CanTryToCastSpell(me, m_spells.priest.pDesperatePrayer))
    {
        if (DoCastSpell(me, m_spells.priest.pDesperatePrayer) == SPELL_CAST_OK)
            return;
    }

    if (m_spells.priest.pPowerWordShield &&
        CanTryToCastSpell(me, m_spells.priest.pPowerWordShield))
    {
        if (DoCastSpell(me, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
            return;
    }

    // Shield allies being attacked.
    if (m_spells.priest.pPowerWordShield)
    {
        Group* pGroup = me->GetGroup();

        for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
        {
            if (Player* pMember = itr->getSource())
            {
                // We already checked self.
                if (pMember == me)
                    continue;

                if ((pMember->GetHealthPercent() < 90.0f) &&
                    !pMember->GetAttackers().empty() &&
                    !pMember->IsImmuneToMechanic(MECHANIC_SHIELD))
                {
                    if (CanTryToCastSpell(pMember, m_spells.priest.pPowerWordShield))
                    {
                        if (DoCastSpell(pMember, m_spells.priest.pPowerWordShield) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }
    }

    // Running away logic
    if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE)
    {
        if (m_spells.priest.pPsychicScream &&
            me->GetEnemyCountInRadiusAround(me, 8.0f) &&
            CanTryToCastSpell(me, m_spells.priest.pPsychicScream))
        {
            if (DoCastSpell(me, m_spells.priest.pPsychicScream) == SPELL_CAST_OK)
                return;
        }

        if (Unit* pTarget = SelectPeriodicHealTarget(80.0f, 90.0f))
            if (HealInjuredTargetPeriodic(pTarget))
                return;

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

        if (m_spells.priest.pAbolishDisease)
        {
            if (Unit* pFriend = SelectDispelTarget(m_spells.priest.pAbolishDisease))
            {
                if (CanTryToCastSpell(pFriend, m_spells.priest.pAbolishDisease))
                {
                    if (DoCastSpell(pFriend, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.priest.pInnerFire &&
            (me->GetPowerPercent(POWER_MANA) > 25.0f) &&
            CanTryToCastSpell(me, m_spells.priest.pInnerFire))
        {
            if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
            {
                return;
            }
        }
    }

    // Heal
    if (me->GetShapeshiftForm() == FORM_NONE &&
        FindAndHealInjuredAlly(80.0f, 80.0f))
        return;

    // Heal Self
    if (me->GetHealthPercent() < 40.0f)
    {
        if (m_spells.priest.pShadowform &&
            me->GetShapeshiftForm() == FORM_SHADOW)

            me->RemoveAurasDueToSpellByCancel(m_spells.priest.pShadowform->Id);
        if (me->GetShapeshiftForm() == FORM_NONE &&
            FindAndHealInjuredAlly(40.0f, 40.0f))
            return;
    }

    if (m_spells.priest.pShadowform &&
        CanTryToCastSpell(me, m_spells.priest.pShadowform))
    {
        if (DoCastSpell(me, m_spells.priest.pShadowform) == SPELL_CAST_OK)
            return;
    }

    // Dispels
    if (m_spells.priest.pDispelMagic)
    {
        if (m_role == ROLE_HEALER)
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
    }
    if (m_spells.priest.pAbolishDisease)
    {
        if (m_role == ROLE_HEALER)
        {
            if (Unit* pFriend = SelectDispelTarget(m_spells.priest.pAbolishDisease))
            {
                if (CanTryToCastSpell(pFriend, m_spells.priest.pAbolishDisease))
                {
                    if (DoCastSpell(pFriend, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                        return;
                }
            }
        }
        else if (IsValidDispelTarget(me, m_spells.priest.pAbolishDisease) &&
            CanTryToCastSpell(me, m_spells.priest.pAbolishDisease))
        {
            if (DoCastSpell(me, m_spells.priest.pAbolishDisease) == SPELL_CAST_OK)
                return;
        }
    }

    // Rebuff important spells in combat
    if (m_spells.priest.pFearWard &&
        (me->GetRace() == RACE_HUMAN || me->GetRace() == RACE_NIGHTELF || me->GetRace() == RACE_DWARF) &&
        CanTryToCastSpell(me, m_spells.priest.pFearWard))
    {
        if (DoCastSpell(me, m_spells.priest.pFearWard) == SPELL_CAST_OK)
        {
            return;
        }
    }

    if (m_spells.priest.pInnerFire &&
        (me->GetPowerPercent(POWER_MANA) > 25.0f) &&
        CanTryToCastSpell(me, m_spells.priest.pInnerFire))
    {
        if (DoCastSpell(me, m_spells.priest.pInnerFire) == SPELL_CAST_OK)
        {
            return;
        }
    }

    // Attack
    if (Unit* pVictim = me->GetVictim())
    {
        if (m_spells.priest.pSilence &&
            pVictim->IsNonMeleeSpellCasted(false, false, true) &&
            (pVictim->GetClass() != CLASS_WARRIOR) &&
            (pVictim->GetClass() != CLASS_ROGUE) &&
            (pVictim->GetClass() != CLASS_HUNTER) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pSilence))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pSilence) == SPELL_CAST_OK)
                return;
        }


        if (m_spells.priest.pPsychicScream &&
            me->GetEnemyCountInRadiusAround(me, 8.0f) &&
            CanTryToCastSpell(me, m_spells.priest.pPsychicScream))
        {
            if (DoCastSpell(me, m_spells.priest.pPsychicScream) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pShadowWordPain &&
            CanTryToCastSpell(pVictim, m_spells.priest.pShadowWordPain))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pShadowWordPain) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pInnerFocus &&
            CanTryToCastSpell(me, m_spells.priest.pInnerFocus))
        {
            DoCastSpell(me, m_spells.priest.pInnerFocus);
        }

        if (m_spells.priest.pDevouringPlague &&
            (me->GetRace() == RACE_UNDEAD) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pDevouringPlague))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pDevouringPlague) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pVampiricEmbrace &&
            CanTryToCastSpell(pVictim, m_spells.priest.pVampiricEmbrace))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pVampiricEmbrace) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pManaBurn &&
            (pVictim->GetClass() == CLASS_PRIEST || pVictim->GetClass() == CLASS_PALADIN) &&
            (pVictim->GetPowerType() == POWER_MANA) &&
            (pVictim->GetPowerPercent(POWER_MANA) > 5.0f) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pManaBurn))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pManaBurn) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pMindBlast &&
            CanTryToCastSpell(pVictim, m_spells.priest.pMindBlast))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pMindBlast) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pMindFlay &&
            CanTryToCastSpell(pVictim, m_spells.priest.pMindFlay))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pMindFlay) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pDispelMagic &&
            IsValidDispelTarget(pVictim, m_spells.priest.pDispelMagic) &&
            CanTryToCastSpell(pVictim, m_spells.priest.pDispelMagic))
        {
            if (DoCastSpell(pVictim, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.priest.pDispelMagic)
        {
            if (m_role != ROLE_HEALER)
            {
                if (IsValidDispelTarget(me, m_spells.priest.pDispelMagic) &&
                    CanTryToCastSpell(me, m_spells.priest.pDispelMagic))
                {
                    if (DoCastSpell(me, m_spells.priest.pDispelMagic) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (me->GetShapeshiftForm() == FORM_NONE)
        {
            if (m_spells.priest.pSmite &&
                CanTryToCastSpell(pVictim, m_spells.priest.pSmite))
            {
                if (DoCastSpell(pVictim, m_spells.priest.pSmite) == SPELL_CAST_OK)
                    return;
            }
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            me->GetMotionMaster()->MoveChase(pVictim, 25.0f);
        }

    }
}

void BattleBotAI::UpdateOutOfCombatAI_Warlock()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.warlock.pDetectInvisibility)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.warlock.pDetectInvisibility))
            {
                if (CanTryToCastSpell(pTarget, m_spells.warlock.pDetectInvisibility))
                {
                    if (DoCastSpell(pTarget, m_spells.warlock.pDetectInvisibility) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }

    if (m_spells.warlock.pDemonArmor &&
        CanTryToCastSpell(me, m_spells.warlock.pDemonArmor))
    {
        if (DoCastSpell(me, m_spells.warlock.pDemonArmor) == SPELL_CAST_OK)
        {
            m_isBuffing = true;
            return;
        }
    }

    if (m_isBuffing &&
        (!m_spells.warlock.pDetectInvisibility ||
            !me->HasGCD(m_spells.warlock.pDetectInvisibility)))
    {
        m_isBuffing = false;
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

void BattleBotAI::UpdateInCombatAI_Warlock()
{
    if (Unit* pVictim = me->GetVictim())
    {
        // Running away logic
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == DISTANCING_MOTION_TYPE &&
            m_spells.warlock.pSeduction &&
            !pVictim->HasAura(m_spells.warlock.pSeduction->Id))
        {

            if (m_spells.warlock.pLifeTap &&
                (me->GetPowerPercent(POWER_MANA) < 30.0f) &&
                (me->GetHealthPercent() > 70.0f) &&
                CanTryToCastSpell(me, m_spells.warlock.pLifeTap))
            {
                if (DoCastSpell(me, m_spells.warlock.pLifeTap) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pDeathCoil &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pDeathCoil))
            {
                me->SetInFront(pVictim);
                if (DoCastSpell(pVictim, m_spells.warlock.pDeathCoil) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pAmplifyCurse &&
                m_spells.warlock.pCurseofExhaustion &&
                CanTryToCastSpell(me, m_spells.warlock.pAmplifyCurse))
            {
                if (DoCastSpell(me, m_spells.warlock.pAmplifyCurse) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pCurseofExhaustion &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pCorruption &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCorruption))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCorruption) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pSiphonLife &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pSiphonLife))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pSiphonLife) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pShadowburn &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pShadowburn))
            {
                me->SetInFront(pVictim);
                if (DoCastSpell(pVictim, m_spells.warlock.pShadowburn) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pShadowWard &&
                (pVictim->GetClass() == CLASS_WARLOCK) &&
                CanTryToCastSpell(me, m_spells.warlock.pShadowWard))
            {
                if (DoCastSpell(me, m_spells.warlock.pShadowWard) == SPELL_CAST_OK)
                    return;
            }
        }

        if (Pet* pPet = me->GetPet())
        {
            if (pPet->IsAlive())
            {
                if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_FELHUNTER)
                {
                    if (m_spells.warlock.pSpellLock &&
                        pVictim->IsNonMeleeSpellCasted(false, false, true) &&
                        (pVictim->GetClass() != CLASS_WARRIOR) &&
                        (pVictim->GetClass() != CLASS_ROGUE) &&
                        (pVictim->GetClass() != CLASS_HUNTER) &&
                        CanTryToCastPetSpell(pVictim, m_spells.warlock.pSpellLock))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.warlock.pSpellLock) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.warlock.pDevourMagic &&
                        IsValidDispelTarget(pVictim, m_spells.warlock.pDevourMagic) &&
                        CanTryToCastPetSpell(pVictim, m_spells.warlock.pDevourMagic))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.warlock.pDevourMagic) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.warlock.pParanoia &&
                        CanTryToCastPetSpell(pPet, m_spells.warlock.pParanoia))
                    {
                        if (DoCastPetSpell(pPet, m_spells.warlock.pParanoia) == SPELL_CAST_OK)
                            return;
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_SUCCUBUS)
                {
                    if (m_spells.warlock.pSeduction)
                    {
                        if (pVictim->GetDiminishing(DIMINISHING_CHARM) != DIMINISHING_LEVEL_IMMUNE)
                        {
                            if (CanTryToCastPetSpell(pVictim, m_spells.warlock.pSeduction) &&
                                (pVictim->GetDiminishing(DIMINISHING_CHARM) != DIMINISHING_LEVEL_IMMUNE))
                            {
                                if (DoCastPetSpell(pVictim, m_spells.warlock.pSeduction) == SPELL_CAST_OK)
                                    return;
                            }
                        }
                        else
                        {
                            if (Unit* pTarget = SelectAttackerDifferentFrom(pVictim))
                            {
                                if (CanTryToCastPetSpell(pTarget, m_spells.warlock.pSeduction) &&
                                    (pVictim->GetDiminishing(DIMINISHING_CHARM) != DIMINISHING_LEVEL_IMMUNE))
                                {
                                    if (DoCastPetSpell(pTarget, m_spells.warlock.pSeduction) == SPELL_CAST_OK)
                                        return;
                                }
                            }
                        }
                    }

                    if (m_spells.warlock.pLashofPain &&
                        CanTryToCastPetSpell(pVictim, m_spells.warlock.pLashofPain))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.warlock.pLashofPain) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.warlock.pLesserInvisibility &&
                        !pPet->IsInCombat() &&
                        CanTryToCastPetSpell(pPet, m_spells.warlock.pLesserInvisibility))
                    {
                        if (DoCastPetSpell(pPet, m_spells.warlock.pLesserInvisibility) == SPELL_CAST_OK)
                        {
                            return;
                        }
                    }
                }
                else if (pPet->GetCreatureInfo()->pet_family == CREATURE_FAMILY_VOIDWALKER)
                {
                    if (m_spells.warlock.pTorment &&
                        pVictim->IsCreature() &&
                        CanTryToCastPetSpell(pVictim, m_spells.warlock.pTorment))
                    {
                        if (DoCastPetSpell(pVictim, m_spells.warlock.pTorment) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.warlock.pSacrifice &&
                        (me->GetHealthPercent() < 50.0f) &&
                        CanTryToCastPetSpell(pPet, m_spells.warlock.pSacrifice))
                    {
                        if (DoCastPetSpell(pPet, m_spells.warlock.pSacrifice) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }

        if (m_spells.warlock.pLifeTap &&
            (me->GetPowerPercent(POWER_MANA) < 30.0f) &&
            (me->GetHealthPercent() > 70.0f) &&
            CanTryToCastSpell(me, m_spells.warlock.pLifeTap))
        {
            if (DoCastSpell(me, m_spells.warlock.pLifeTap) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pDeathCoil &&
            (pVictim->CanReachWithMeleeAutoAttack(me) || pVictim->IsNonMeleeSpellCasted()) &&
            (m_spells.warlock.pSeduction &&
                (!pVictim->HasAura(m_spells.warlock.pSeduction->Id))) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pDeathCoil))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pDeathCoil) == SPELL_CAST_OK)
                return;
        }

        // Fear death coiled targets
        if (m_spells.warlock.pFear &&
            m_spells.warlock.pDeathCoil &&
            (pVictim->GetDiminishing(DIMINISHING_FEAR) != DIMINISHING_LEVEL_IMMUNE) &&
            (pVictim->HasAura(m_spells.warlock.pDeathCoil->Id)) &&
            (m_spells.warlock.pSeduction &&
                (!pVictim->HasAura(m_spells.warlock.pSeduction->Id))) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pFear))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pFear) == SPELL_CAST_OK)
                return;
        }

        // Always use up NF procs
        if (m_spells.warlock.pShadowBolt &&
            (me->HasAura(BB_NIGHTFALL_PROC)) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pShadowBolt))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pShadowBolt) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pSeduction &&
            (!pVictim->HasAura(m_spells.warlock.pSeduction->Id)))
        {
            if (m_spells.warlock.pShadowburn &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pShadowburn))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pShadowburn) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pSearingPain &&
                (pVictim->GetHealthPercent() < 20.0f) &&
                !pVictim->IsMoving() &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pSearingPain))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pSearingPain) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warlock.pShadowWard &&
            (pVictim->GetClass() == CLASS_WARLOCK || pVictim->GetClass() == CLASS_PRIEST) &&
            CanTryToCastSpell(me, m_spells.warlock.pShadowWard))
        {
            if (DoCastSpell(me, m_spells.warlock.pShadowWard) == SPELL_CAST_OK)
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

        if (m_spells.warlock.pSoulLink &&
            !me->HasAura(BB_SOUL_LINK))
        {
            if (Pet* pPet = me->GetPet())
            {
                if (pPet->IsAlive() &&
                    CanTryToCastSpell(pPet, m_spells.warlock.pSoulLink))
                {
                    if (DoCastSpell(pPet, m_spells.warlock.pSoulLink) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        if (m_spells.warlock.pSeduction &&
            (!pVictim->HasAura(m_spells.warlock.pSeduction->Id)))
        {
            if (m_spells.warlock.pCorruption &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCorruption))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCorruption) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pSiphonLife &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pSiphonLife))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pSiphonLife) == SPELL_CAST_OK)
                    return;
            }
        }

        // CoEX flag carriers or mounted players, otherwise CoT casters or CoA non-casters
        if (pVictim->IsMounted() || 
            pVictim->HasAura(AURA_SILVERWING_FLAG) || 
            pVictim->HasAura(AURA_WARSONG_FLAG))
        {
            if (m_spells.warlock.pAmplifyCurse &&
                m_spells.warlock.pCurseofExhaustion &&
                CanTryToCastSpell(me, m_spells.warlock.pAmplifyCurse))
            {
                if (DoCastSpell(me, m_spells.warlock.pAmplifyCurse) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pCurseofExhaustion &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pCurseofExhaustion) == SPELL_CAST_OK)
                    return;
            }
        }
        else
        {
            if (pVictim->IsCaster() &&
                (pVictim->GetClass() != CLASS_HUNTER))
            {
                if (m_spells.warlock.pCurseofTongues &&
                    CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofTongues))
                {
                    if (DoCastSpell(pVictim, m_spells.warlock.pCurseofTongues) == SPELL_CAST_OK)
                        return;
                }
            }
            else
            {
                // If conflag spec, use CoE, otherwise use CoA
                if (m_spells.warlock.pConflagrate)
                {
                    if (m_spells.warlock.pCurseoftheElements &&
                        CanTryToCastSpell(pVictim, m_spells.warlock.pCurseoftheElements))
                    {
                        if (DoCastSpell(pVictim, m_spells.warlock.pCurseoftheElements) == SPELL_CAST_OK)
                            return;
                    }
                }
                else
                {
                    if (m_spells.warlock.pAmplifyCurse &&
                        CanTryToCastSpell(me, m_spells.warlock.pAmplifyCurse))
                    {
                        if (DoCastSpell(me, m_spells.warlock.pAmplifyCurse) == SPELL_CAST_OK)
                            return;
                    }

                    if (m_spells.warlock.pCurseofAgony &&
                        (m_spells.warlock.pSeduction &&
                            (!pVictim->HasAura(m_spells.warlock.pSeduction->Id))) &&
                        CanTryToCastSpell(pVictim, m_spells.warlock.pCurseofAgony))
                    {
                        if (DoCastSpell(pVictim, m_spells.warlock.pCurseofAgony) == SPELL_CAST_OK)
                            return;
                    }
                }
            }
        }

        if (m_spells.warlock.pFear &&
            m_spells.warlock.pSeduction &&
            (!pVictim->HasAura(m_spells.warlock.pSeduction->Id)) &&
            (pVictim->GetDiminishing(DIMINISHING_FEAR) != DIMINISHING_LEVEL_IMMUNE) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pFear))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pFear) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pDrainLife &&
            !m_spells.warlock.pConflagrate &&
            (m_spells.warlock.pSeduction &&
                (!pVictim->HasAura(m_spells.warlock.pSeduction->Id))) &&
            (me->GetHealthPercent() < 30.0f) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pDrainLife))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pDrainLife) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pInferno &&
            m_spells.warlock.pConflagrate &&
            (pVictim->GetHealthPercent() > 50.0f) &&
            (!pVictim->IsMoving()) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pInferno))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pInferno) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pSeduction &&
            (!pVictim->HasAura(m_spells.warlock.pSeduction->Id)))
        {
            if (m_spells.warlock.pImmolate &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pImmolate))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pImmolate) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.warlock.pConflagrate &&
                CanTryToCastSpell(pVictim, m_spells.warlock.pConflagrate))
            {
                if (DoCastSpell(pVictim, m_spells.warlock.pConflagrate) == SPELL_CAST_OK)
                    return;
            }
        }

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && me->GetDistance(pVictim) > 30.0f)
        {
            me->GetMotionMaster()->MoveChase(pVictim, 25.0f);
        }

        if (m_spells.warlock.pSearingPain &&
            (m_spells.warlock.pSeduction &&
                (!pVictim->HasAura(m_spells.warlock.pSeduction->Id))) &&
            pVictim->CanReachWithMeleeAutoAttack(me) &&
            (pVictim->GetVictim() == me) &&
            IsMeleeDamageClass(pVictim->GetClass()) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pSearingPain))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pSearingPain) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pSoulfire &&
            m_spells.warlock.pConflagrate &&
            (pVictim->GetHealthPercent() > 50.0f) &&
            (!pVictim->IsMoving()) &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pSoulfire))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pSoulfire) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warlock.pShadowBolt &&
            CanTryToCastSpell(pVictim, m_spells.warlock.pShadowBolt))
        {
            if (DoCastSpell(pVictim, m_spells.warlock.pShadowBolt) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Warrior()
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

void BattleBotAI::UpdateInCombatAI_Warrior()
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
            if (!me->GetAttackers().empty() &&
                IsPhysicalDamageClass(pVictim->GetClass()))
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
                CanTryToCastSpell(me, m_spells.warrior.pShieldSlam))
            {
                if (DoCastSpell(me, m_spells.warrior.pShieldSlam) == SPELL_CAST_OK)
                    return;
            }
        }

        if (pVictim->IsMoving() &&
           !pVictim->HasUnitState(UNIT_STAT_ROOT) &&
           !pVictim->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED))
        {
            if (m_spells.warrior.pHamstring &&
                CanTryToCastSpell(pVictim, m_spells.warrior.pHamstring))
            {
                if (DoCastSpell(pVictim, m_spells.warrior.pHamstring) == SPELL_CAST_OK)
                    return;
            }
            if (m_spells.warrior.pPiercingHowl &&
               (me->GetCombatDistance(pVictim) <= 10.0f) &&
                CanTryToCastSpell(pVictim, m_spells.warrior.pPiercingHowl))
            {
                if (DoCastSpell(pVictim, m_spells.warrior.pPiercingHowl) == SPELL_CAST_OK)
                    return;
            }
        }

        if (m_spells.warrior.pRend &&
           (pVictim->GetClass() == CLASS_ROGUE) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pRend))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pRend) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pIntimidatingShout &&
           (me->GetHealthPercent() < 50.0f) &&
           (GetAttackersInRangeCount(10.0f) > 2) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pIntimidatingShout))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pIntimidatingShout) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.warrior.pRetaliation &&
            IsMeleeDamageClass(pVictim->GetClass()) &&
           (me->GetHealthPercent() > 70.0f) &&
           ((GetAttackersInRangeCount(10.0f) > 1) || (pVictim->GetClass() == CLASS_ROGUE)) &&
            CanTryToCastSpell(me, m_spells.warrior.pRetaliation))
        {
            if (DoCastSpell(me, m_spells.warrior.pRetaliation) == SPELL_CAST_OK)
                return;
        }

        if ((me->GetHealthPercent() > 60.0f) && (pVictim->GetHealthPercent() > 40.0f) &&
            (pVictim->GetClass() == CLASS_WARLOCK || pVictim->GetClass() == CLASS_PRIEST) &&
            !me->HasUnitState(UNIT_STAT_ROOT) &&
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

            if (m_spells.warrior.pBerserkerRage &&
                CanTryToCastSpell(me, m_spells.warrior.pBerserkerRage))
            {
                if (DoCastSpell(me, m_spells.warrior.pBerserkerRage) == SPELL_CAST_OK)
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

        if (me->GetHealthPercent() < 20.0f)
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
               (pVictim->GetClass() != CLASS_ROGUE) &&
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

        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
            && !me->CanReachWithMeleeAutoAttack(pVictim))
        {
            me->GetMotionMaster()->MoveChase(pVictim);
        }

        if (m_spells.warrior.pHeroicStrike &&
           (me->GetPower(POWER_RAGE) > 30) &&
            CanTryToCastSpell(pVictim, m_spells.warrior.pHeroicStrike))
        {
            if (DoCastSpell(pVictim, m_spells.warrior.pHeroicStrike) == SPELL_CAST_OK)
                return;
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

void BattleBotAI::UpdateOutOfCombatAI_Rogue()
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

    if (m_spells.rogue.pStealth &&
        CanTryToCastSpell(me, m_spells.rogue.pStealth) &&
       !me->HasAura(AURA_WARSONG_FLAG) &&
       !me->HasAura(AURA_SILVERWING_FLAG))
    {
        if (DoCastSpell(me, m_spells.rogue.pStealth) == SPELL_CAST_OK)
            return;
    }

    if (me->GetVictim())
        UpdateInCombatAI_Rogue();
}

void BattleBotAI::UpdateInCombatAI_Rogue()
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
                        if (me->GetMotionMaster()->MoveDistance(pVictim, 40.0f))
                            return;
                    }
                }
            }
        }

        if (me->GetComboPoints() > 4)
        {
            std::vector<SpellEntry const*> vSpells;
            if (m_spells.rogue.pSliceAndDice)
                vSpells.push_back(m_spells.rogue.pSliceAndDice);
            if (m_spells.rogue.pEviscerate)
                vSpells.push_back(m_spells.rogue.pEviscerate);
            if (m_spells.rogue.pKidneyShot)
                vSpells.push_back(m_spells.rogue.pKidneyShot);
            if (m_spells.rogue.pExposeArmor)
                vSpells.push_back(m_spells.rogue.pExposeArmor);
            if (m_spells.rogue.pRupture)
                vSpells.push_back(m_spells.rogue.pRupture);
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
                if (CanTryToCastSpell(pTarget, m_spells.rogue.pBlind))
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

        if (m_spells.rogue.pAdrenalineRush &&
           !me->GetPower(POWER_ENERGY) &&
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

        if (m_spells.rogue.pSprint &&
           !me->HasUnitState(UNIT_STAT_ROOT) &&
           !me->CanReachWithMeleeAutoAttack(pVictim) &&
            CanTryToCastSpell(me, m_spells.rogue.pSprint))
        {
            if (DoCastSpell(me, m_spells.rogue.pSprint) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateOutOfCombatAI_Druid()
{
    BattleGround* bg = me->GetBattleGround();
    if (bg && bg->GetStatus() == STATUS_WAIT_JOIN)
    {
        if (m_spells.druid.pGiftoftheWild)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.druid.pGiftoftheWild))
            {
                if (CanTryToCastSpell(pTarget, m_spells.druid.pGiftoftheWild))
                {
                    if (DoCastSpell(pTarget, m_spells.druid.pGiftoftheWild) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }

        if (m_spells.druid.pThorns)
        {
            if (Player* pTarget = SelectBuffTarget(m_spells.druid.pThorns))
            {
                if (CanTryToCastSpell(pTarget, m_spells.druid.pThorns))
                {
                    if (DoCastSpell(pTarget, m_spells.druid.pThorns) == SPELL_CAST_OK)
                    {
                        m_isBuffing = true;
                        return;
                    }
                }
            }
        }
    }
    else
    {
        if (m_spells.druid.pMarkoftheWild && CanTryToCastSpell(me, m_spells.druid.pMarkoftheWild))
        {
            if (DoCastSpell(me, m_spells.druid.pMarkoftheWild) == SPELL_CAST_OK)
            {
                m_isBuffing = true;
                return;
            }
        }

        if (m_spells.druid.pThorns && CanTryToCastSpell(me, m_spells.druid.pThorns))
        {
            if (DoCastSpell(me, m_spells.druid.pThorns) == SPELL_CAST_OK)
            {
                m_isBuffing = true;
                return;
            }
        }
    }

    if (m_spells.druid.pNaturesGrasp &&
        CanTryToCastSpell(me, m_spells.druid.pNaturesGrasp))
    {
        if (DoCastSpell(me, m_spells.druid.pNaturesGrasp) == SPELL_CAST_OK)
            return;
    }

    if (m_isBuffing &&
       (!m_spells.druid.pMarkoftheWild ||
        !me->HasGCD(m_spells.druid.pMarkoftheWild)))
    {
        m_isBuffing = false;
    }

    if (me->GetShapeshiftForm() == FORM_NONE)
    {
        if (m_role == ROLE_MELEE_DPS || m_role == ROLE_TANK)
        {
            if (m_spells.druid.pCatForm &&
                CanTryToCastSpell(me, m_spells.druid.pCatForm))
            {
                if (DoCastSpell(me, m_spells.druid.pCatForm) == SPELL_CAST_OK)
                    return;
            }

            if (m_spells.druid.pBearForm &&
                CanTryToCastSpell(me, m_spells.druid.pBearForm))
            {
                if (DoCastSpell(me, m_spells.druid.pBearForm) == SPELL_CAST_OK)
                    return;
            }
        }
        else
        {
            if ((me->GetPowerPercent(POWER_MANA) >  80.0f) &&
                FindAndHealInjuredAlly(80.0f))
                return;
        }
    }
    else if (me->GetShapeshiftForm() == FORM_CAT)
    {
        if (m_spells.druid.pProwl &&
            CanTryToCastSpell(me, m_spells.druid.pProwl) &&
            !me->HasAura(AURA_WARSONG_FLAG) &&
            !me->HasAura(AURA_SILVERWING_FLAG))
        {
            if (DoCastSpell(me, m_spells.druid.pProwl) == SPELL_CAST_OK)
                return;
        }
    }

    if (me->GetVictim())
    {
        if (m_spells.druid.pMoonkinForm &&
            CanTryToCastSpell(me, m_spells.druid.pMoonkinForm))
        {
            if (DoCastSpell(me, m_spells.druid.pMoonkinForm) == SPELL_CAST_OK)
                return;
        }

        UpdateInCombatAI_Druid();
    }
    else
    {
        if (m_spells.druid.pMoonkinForm &&
            me->GetShapeshiftForm() == FORM_MOONKIN)
            me->RemoveAurasDueToSpellByCancel(m_spells.druid.pMoonkinForm->Id);

        if (m_spells.druid.pTravelForm &&
           !me->IsMounted() &&
           (!GetMountSpellId() || me->HasAura(AURA_WARSONG_FLAG) || me->HasAura(AURA_SILVERWING_FLAG)) &&
            CanTryToCastSpell(me, m_spells.druid.pTravelForm))
        {
            if (DoCastSpell(me, m_spells.druid.pTravelForm) == SPELL_CAST_OK)
                return;
        }
    }
}

void BattleBotAI::UpdateInCombatAI_Druid()
{
    if (m_spells.druid.pTravelForm &&
        me->GetShapeshiftForm() == FORM_TRAVEL)
        me->RemoveAurasDueToSpellByCancel(m_spells.druid.pTravelForm->Id);

    if (me->GetShapeshiftForm() == FORM_NONE)
    {
        if (m_spells.druid.pHibernate &&
            !me->GetAttackers().empty())
        {
            Unit* pAttacker = *me->GetAttackers().begin();
            if (CanTryToCastSpell(pAttacker, m_spells.druid.pHibernate))
            {
                if (DoCastSpell(pAttacker, m_spells.druid.pHibernate) == SPELL_CAST_OK)
                    return;
            }
        }

        // Heal
        if (FindAndHealInjuredAlly(80.0f))
            return;

        // Dispels
       SpellEntry const* pDispelSpell = m_spells.druid.pAbolishPoison ?
                                         m_spells.druid.pAbolishPoison :
                                         m_spells.druid.pCurePoison;
       if (pDispelSpell)
       {
           if (m_role == ROLE_HEALER)
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
           else if (IsValidDispelTarget(me, pDispelSpell) &&
                    CanTryToCastSpell(me, pDispelSpell))
           {
               if (DoCastSpell(me, pDispelSpell) == SPELL_CAST_OK)
                   return;
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
            me->GetVictim() &&
           (me->GetHealthPercent() > 40.0f) &&
           (me->GetPowerPercent(POWER_MANA) < 10.0f) &&
            CanTryToCastSpell(me, m_spells.druid.pInnervate))
        {
            if (DoCastSpell(me, m_spells.druid.pInnervate) == SPELL_CAST_OK)
                return;
        }

        if (m_spells.druid.pMoonkinForm &&
            CanTryToCastSpell(me, m_spells.druid.pMoonkinForm))
        {
            if (DoCastSpell(me, m_spells.druid.pMoonkinForm) == SPELL_CAST_OK)
                return;
        }

        if (m_role == ROLE_MELEE_DPS || m_role == ROLE_TANK)
        {
            if (Unit* pVictim = me->GetVictim())
            {
                if (m_spells.druid.pBearForm &&
                    pVictim->CanReachWithMeleeAutoAttack(me) &&
                    IsPhysicalDamageClass(pVictim->GetClass()) &&
                    CanTryToCastSpell(me, m_spells.druid.pBearForm))
                {
                    if (DoCastSpell(me, m_spells.druid.pBearForm) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pCatForm &&
                    CanTryToCastSpell(me, m_spells.druid.pCatForm))
                {
                    if (DoCastSpell(me, m_spells.druid.pCatForm) == SPELL_CAST_OK)
                        return;
                }
            }
        }
    }
    else
    {
        if (me->HasUnitState(UNIT_STAT_ROOT) &&
            me->HasAuraType(SPELL_AURA_MOD_SHAPESHIFT))
            me->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
    }
    
    if (Unit* pVictim = me->GetVictim())
    {
        ShapeshiftForm const form = me->GetShapeshiftForm();
        if (m_spells.druid.pBarkskin &&
           (form == FORM_NONE || form == FORM_MOONKIN) &&
           (me->GetHealthPercent() < 50.0f) &&
            CanTryToCastSpell(me, m_spells.druid.pBarkskin))
        {
            if (DoCastSpell(me, m_spells.druid.pBarkskin) == SPELL_CAST_OK)
                return;
        }

        switch (form)
        {
            case FORM_CAT:
            {
                if (me->HasDistanceCasterMovement())
                    me->SetCasterChaseDistance(0.0f);

                if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE
                    && !me->CanReachWithMeleeAutoAttack(pVictim))
                {
                    me->GetMotionMaster()->MoveChase(pVictim);
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

                if (m_spells.druid.pRake &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pRake))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pRake) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pClaw &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pClaw))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pClaw) == SPELL_CAST_OK)
                        return;
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
                    me->GetMotionMaster()->MoveChase(pVictim);
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

                if (m_spells.druid.pDemoralizingRoar &&
                    IsMeleeDamageClass(pVictim->GetClass()) &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pDemoralizingRoar))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pDemoralizingRoar) == SPELL_CAST_OK)
                        return;
                }

                if (m_spells.druid.pSwipe &&
                   ((me->GetPower(POWER_RAGE) > 50) || (GetAttackersInRangeCount(10.0f) > 1)) &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pSwipe))
                {
                    if (DoCastSpell(pVictim, m_spells.druid.pSwipe) == SPELL_CAST_OK)
                        return;
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
                    me->GetMotionMaster()->MoveChase(pVictim, 25.0f);
                }
                else if (pVictim->CanReachWithMeleeAutoAttack(me) &&
                        (pVictim->GetVictim() == me) &&
                        !me->HasUnitState(UNIT_STAT_ROOT) &&
                        (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != DISTANCING_MOTION_TYPE))
                {
                    if (m_spells.druid.pEntanglingRoots &&
                        CanTryToCastSpell(pVictim, m_spells.druid.pEntanglingRoots))
                    {
                        if (DoCastSpell(pVictim, m_spells.druid.pEntanglingRoots) == SPELL_CAST_OK)
                            return;
                    }
                    me->SetCasterChaseDistance(25.0f);
                    if (me->GetMotionMaster()->MoveDistance(pVictim, 25.0f))
                        return;
                }

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

                if (m_spells.druid.pMoonfire &&
                    CanTryToCastSpell(pVictim, m_spells.druid.pMoonfire))
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
}
