/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

/* ScriptData
SDName: FollowerAI
SD%Complete: 60
SDComment: This AI is under development
SDCategory: Npc
EndScriptData */

#include "ScriptedFollowerAI.h"
#include "Chat.h"

const float MAX_PLAYER_DISTANCE = 100.0f;

enum
{
    POINT_COMBAT_START  = 0xFFFFFF
};

FollowerAI::FollowerAI(Creature* pCreature) : ScriptedAI(pCreature),
    m_uiLeaderGUID(0),
    m_pQuestForFollow(nullptr),
    m_uiUpdateFollowTimer(2500),
    m_uiFollowState(STATE_FOLLOW_NONE),
    m_uiFollowDistance(0.0f)
{}

void FollowerAI::AttackStart(Unit* pWho)
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
}

//This part provides assistance to a player that are attacked by pWho, even if out of normal aggro range
//It will cause m_creature to attack pWho that are attacking _any_ player (which has been confirmed may happen also on offi)
//The flag (type_flag) is unconfirmed, but used here for further research and is a good candidate.
bool FollowerAI::AssistPlayerInCombat(Unit* pWho)
{
    if (!pWho->getVictim())
        return false;

    //experimental (unknown) flag not present
    if (!(m_creature->GetCreatureInfo()->type_flags & CREATURE_TYPEFLAGS_CAN_ASSIST))
        return false;

    if (m_creature->hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_DIED))
        return false;

    //not a player
    if (!pWho->getVictim()->GetCharmerOrOwnerPlayerOrPlayerItself())
        return false;

    //never attack friendly
    if (m_creature->IsFriendlyTo(pWho))
        return false;

    //too far away and no free sight?
    if (m_creature->IsWithinDistInMap(pWho, MAX_PLAYER_DISTANCE) && m_creature->IsWithinLOSInMap(pWho))
    {
        //already fighting someone?
        if (!m_creature->getVictim())
        {
            AttackStart(pWho);
            return true;
        }
        else
        {
            pWho->SetInCombatWith(m_creature);
            m_creature->AddThreat(pWho);
            return true;
        }
    }

    return false;
}

void FollowerAI::MoveInLineOfSight(Unit* pWho)
{
    if (pWho->isTargetableForAttack() && pWho->isInAccessablePlaceFor(m_creature))
    {
        // AssistPlayerInCombat can start, so return if true
        if (HasFollowState(STATE_FOLLOW_INPROGRESS) && AssistPlayerInCombat(pWho))
            return;

        if (!m_creature->CanInitiateAttack())
            return;

       // if (!m_creature->canFly() && m_creature->GetDistanceZ(pWho) > CREATURE_Z_ATTACK_RANGE)
         //   return;

        if (m_creature->IsHostileTo(pWho))
        {
            float fAttackRadius = m_creature->GetAttackDistance(pWho);
            if (m_creature->IsWithinDistInMap(pWho, fAttackRadius) && m_creature->IsWithinLOSInMap(pWho))
            {
                if (!m_creature->getVictim())
                {
                    pWho->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
                    AttackStart(pWho);
                }
                else if (m_creature->GetMap()->IsDungeon())
                {
                    pWho->SetInCombatWith(m_creature);
                    m_creature->AddThreat(pWho);
                }
            }
        }
    }
}

void FollowerAI::JustDied(Unit* /*pKiller*/)
{
    if (!HasFollowState(STATE_FOLLOW_INPROGRESS) || !m_uiLeaderGUID || !m_pQuestForFollow)
        return;

    //TODO: need a better check for quests with time limit.
    if (Player* pPlayer = GetLeaderForFollower())
    {
        if (Group* pGroup = pPlayer->GetGroup())
        {
            for(GroupReference* pRef = pGroup->GetFirstMember(); pRef != nullptr; pRef = pRef->next())
            {
                if (Player* pMember = pRef->getSource())
                {
                    if (pMember->GetQuestStatus(m_pQuestForFollow->GetQuestId()) == QUEST_STATUS_INCOMPLETE)
                        pMember->FailQuest(m_pQuestForFollow->GetQuestId());
                }
            }
        }
        else
        {
            if (pPlayer->GetQuestStatus(m_pQuestForFollow->GetQuestId()) == QUEST_STATUS_INCOMPLETE)
                pPlayer->FailQuest(m_pQuestForFollow->GetQuestId());
        }
    }
}

void FollowerAI::JustRespawned()
{
    m_uiFollowState = STATE_FOLLOW_NONE;

    if (!IsCombatMovement())
        SetCombatMovement(true);

    if (m_creature->getFaction() != m_creature->GetCreatureInfo()->faction_A)
        m_creature->setFaction(m_creature->GetCreatureInfo()->faction_A);

    Reset();
}

void FollowerAI::EnterEvadeMode()
{
    m_creature->RemoveAurasAtReset();
    m_creature->DeleteThreatList();
    m_creature->CombatStop(true);
    m_creature->SetLootRecipient(nullptr);

    if (HasFollowState(STATE_FOLLOW_INPROGRESS))
    {
        // it looks like FollowerAI does not need returning to combatStart position
        // instead lets make it return to the leader
        if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
        {
            if (!HasFollowState(STATE_FOLLOW_PAUSED))
                AddFollowState(STATE_FOLLOW_RETURNING);
        }
    }
    else
    {
        if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
            m_creature->GetMotionMaster()->MoveTargetedHome();
    }

    // Reset back to default spells template. This also resets timers.
    SetSpellsTemplate(m_creature->GetCreatureInfo()->spells_template);

    Reset();
}

void FollowerAI::UpdateAI(const uint32 uiDiff)
{
    if (HasFollowState(STATE_FOLLOW_INPROGRESS) && !m_creature->getVictim())
    {
        if (m_uiUpdateFollowTimer < uiDiff)
        {
            if (HasFollowState(STATE_FOLLOW_COMPLETE) && !HasFollowState(STATE_FOLLOW_POSTEVENT))
            {
                sLog.outDebug("FollowerAI is set completed, despawns.");
                m_creature->DisappearAndDie();
                return;
            }

            bool bIsMaxRangeExceeded = true;

            if (Player* pPlayer = GetLeaderForFollower())
            {
                if (HasFollowState(STATE_FOLLOW_RETURNING))
                {
                    sLog.outDebug("FollowerAI is returning to leader.");

                    RemoveFollowState(STATE_FOLLOW_RETURNING);
                    m_creature->GetMotionMaster()->MoveFollow(pPlayer, m_uiFollowDistance, PET_FOLLOW_ANGLE);
                    return;
                }

                if (Group* pGroup = pPlayer->GetGroup())
                {
                    for(GroupReference* pRef = pGroup->GetFirstMember(); pRef != nullptr; pRef = pRef->next())
                    {
                        Player* pMember = pRef->getSource();

                        if (pMember && m_creature->IsWithinDistInMap(pMember, MAX_PLAYER_DISTANCE))
                        {
                            bIsMaxRangeExceeded = false;
                            break;
                        }
                    }
                }
                else
                {
                    if (m_creature->IsWithinDistInMap(pPlayer, MAX_PLAYER_DISTANCE))
                        bIsMaxRangeExceeded = false;
                }

                // allow postEvent to happen even if quest credit is already handled
                /*if (HasFollowState(STATE_FOLLOW_COMPLETE | STATE_FOLLOW_POSTEVENT))
                    bIsMaxRangeExceeded = false;*/
            }

            if (bIsMaxRangeExceeded)
            {
                sLog.outDebug("FollowerAI failed because player/group was to far away or not found");
                SetFollowPaused(false);
                m_creature->DisappearAndDie();
                return;
            }

            m_uiUpdateFollowTimer = 300;
        }
        else
            m_uiUpdateFollowTimer -= uiDiff;
    }

    UpdateFollowerAI(uiDiff);
}

void FollowerAI::UpdateFollowerAI(const uint32 uiDiff)
{
    if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
        return;

    if (!m_CreatureSpells.empty())
        DoSpellTemplateCasts(uiDiff);

    DoMeleeAttackIfReady();
}

void FollowerAI::MovementInform(uint32 uiMotionType, uint32 uiPointId)
{
    if (uiMotionType != POINT_MOTION_TYPE || !HasFollowState(STATE_FOLLOW_INPROGRESS))
        return;

    if (uiPointId == POINT_COMBAT_START)
    {
        if (GetLeaderForFollower())
        {
            if (!HasFollowState(STATE_FOLLOW_PAUSED))
                AddFollowState(STATE_FOLLOW_RETURNING);
        }
        else
        {
            // Ustaag <Nostalrius> : vilain fix des mobs qui voulaient pas respawn à leur point de spawn
            SetFollowPaused(false);
            float x = 0.0f;
            float y = 0.0f;
            float z = 0.0f;
            float o = 0.0f;
            m_creature->GetHomePosition(x, y, z, o);
            m_creature->DealDamage(m_creature, m_creature->GetMaxHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
            m_creature->NearTeleportTo(x, y, z, o);
            m_creature->ForcedDespawn();
        }
    }
}

void FollowerAI::StartFollow(Player* pLeader, uint32 uiFactionForFollower, const Quest* pQuest, float followDist)
{
    if (m_creature->getVictim())
    {
        sLog.outDebug("FollowerAI attempt to StartFollow while in combat.");
        return;
    }

    if (HasFollowState(STATE_FOLLOW_INPROGRESS))
    {
        sLog.outError("FollowerAI attempt to StartFollow while already following.");
        return;
    }

    //set variables
    m_uiLeaderGUID = pLeader->GetGUID();
    m_uiFollowDistance = followDist;

    if (uiFactionForFollower)
        m_creature->setFaction(uiFactionForFollower);

    m_pQuestForFollow = pQuest;

    if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == WAYPOINT_MOTION_TYPE)
    {
        m_creature->GetMotionMaster()->Clear();
        m_creature->GetMotionMaster()->MoveIdle();
        sLog.outDebug("FollowerAI start with WAYPOINT_MOTION_TYPE, set to MoveIdle.");
    }

    m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);

    AddFollowState(STATE_FOLLOW_INPROGRESS);

    m_creature->GetMotionMaster()->MoveFollow(pLeader, followDist, PET_FOLLOW_ANGLE);

    sLog.outDebug("FollowerAI start follow %s (GUID %u)", pLeader->GetName(), m_uiLeaderGUID);
}

Player* FollowerAI::GetLeaderForFollower()
{
    if (Player* pLeader = m_creature->GetMap()->GetPlayer(m_uiLeaderGUID))
    {
        if (pLeader->isAlive())
            return pLeader;

        if (Group* pGroup = pLeader->GetGroup())
        {
            for(GroupReference* pRef = pGroup->GetFirstMember(); pRef != nullptr; pRef = pRef->next())
            {
                Player* pMember = pRef->getSource();

                if (pMember && pMember->isAlive() && m_creature->IsWithinDistInMap(pMember, MAX_PLAYER_DISTANCE))
                {
                    sLog.outDebug("FollowerAI GetLeader changed and returned new leader.");
                    m_uiLeaderGUID = pMember->GetGUID();
                    return pMember;
                }
            }
        }
    }

    sLog.outDebug("FollowerAI GetLeader can not find suitable leader.");
    return nullptr;
}

void FollowerAI::SetFollowComplete(bool bWithEndEvent)
{
    if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
    {
        m_creature->StopMoving();
        m_creature->GetMotionMaster()->Clear();
        m_creature->GetMotionMaster()->MoveIdle();
    }

    if (bWithEndEvent)
        AddFollowState(STATE_FOLLOW_POSTEVENT);
    else
    {
        if (HasFollowState(STATE_FOLLOW_POSTEVENT))
            RemoveFollowState(STATE_FOLLOW_POSTEVENT);
    }

    AddFollowState(STATE_FOLLOW_COMPLETE);
}

void FollowerAI::SetFollowPaused(bool bPaused)
{
    if (!HasFollowState(STATE_FOLLOW_INPROGRESS) || HasFollowState(STATE_FOLLOW_COMPLETE))
        return;

    if (bPaused)
    {
        AddFollowState(STATE_FOLLOW_PAUSED);

        if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
        {
            m_creature->StopMoving();
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MoveIdle();
        }
    }
    else
    {
        RemoveFollowState(STATE_FOLLOW_PAUSED);

        if (Player* pLeader = GetLeaderForFollower())
            m_creature->GetMotionMaster()->MoveFollow(pLeader, m_uiFollowDistance, PET_FOLLOW_ANGLE);
    }
}

void FollowerAI::GetAIInformation(ChatHandler& reader)
{
    reader.PSendSysMessage("FollowerAI. Player %u [followDistance=%f]. State=0x%x", m_uiLeaderGUID, m_uiFollowDistance, m_uiFollowState);
    ScriptedAI::GetAIInformation(reader);
}
