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

#include "Player.h"
#include "BattleGround.h"
#include "BattleGroundAV.h"
#include "BattleGroundMgr.h"
#include "Creature.h"
#include "GameObject.h"
#include "Language.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "Chat.h"


BattleGroundAV::BattleGroundAV()
{
    m_StartMessageIds[BG_STARTING_EVENT_FIRST]  = 0;
    m_StartMessageIds[BG_STARTING_EVENT_SECOND] = LANG_BG_AV_START_ONE_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_THIRD]  = LANG_BG_AV_START_HALF_MINUTE;
    m_StartMessageIds[BG_STARTING_EVENT_FOURTH] = LANG_BG_AV_HAS_BEGUN;
}

BattleGroundAV::~BattleGroundAV()
{
}

void BattleGroundAV::HandleKillPlayer(Player *player, Player *killer)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;

    BattleGround::HandleKillPlayer(player, killer);
    if (!player->HasAura(27827)) // Esprit de redemption
        UpdateScore(GetTeamIndexByTeamId(player->GetTeam()), -1);
}

/*********/
uint32 BattleGroundAV::getReinforcementLevelGroundUnit(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    return m_reinforcementLevel[faction_id];
}

void BattleGroundAV::setReinforcementLevelGroundUnit(uint32 faction_id, uint32 ressources)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    if (ressources < 500)
        m_reinforcementLevel[faction_id] = AV_NPC_BASIC;
    else if (ressources < 1000)
        m_reinforcementLevel[faction_id] = AV_NPC_SEASONED;
    else if (ressources < 1500)
        m_reinforcementLevel[faction_id] = AV_NPC_VETERAN;
    else
        m_reinforcementLevel[faction_id] = AV_NPC_CHAMPION;
}

uint32 BattleGroundAV::getChallengeInvocationCounter(uint32 faction_id, uint32 challenge_type)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    ASSERT(challenge_type < BG_AV_NB_CHALLENGES);
    return m_challengeStatus[faction_id][challenge_type];
}

void BattleGroundAV::setChallengeInvocationCounter(uint32 faction_id, uint32 challenge_type, uint32 effort_done)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    ASSERT(challenge_type < BG_AV_NB_CHALLENGES);
    m_challengeStatus[faction_id][challenge_type] += effort_done;
}

uint32 BattleGroundAV::getChallengeInvocationGoals(uint32 faction_id, uint32 challenge_type)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    ASSERT(challenge_type < BG_AV_NB_CHALLENGES);
    return m_challengeGoals[faction_id][challenge_type];
}

void BattleGroundAV::initializeChallengeInvocationGoals(void)
{
    isSnivvle = false;
    m_ui_Snivvle = 0;
    m_ui_buff_a = 120000 + urand(0,4)* 60000;
    m_ui_buff_h = 120000 + urand(0,4)* 60000;

    for (int i = 0; i < BG_TEAMS_COUNT; i++)
        for (int j = 0; j < BG_AV_NB_CHALLENGES; j++)
            m_challengeStatus[i][j] = 0;

    /** Reinforcement level for Troops invocation */
    m_reinforcementLevel[BG_TEAM_ALLIANCE] = AV_NPC_BASIC;
    m_reinforcementLevel[BG_TEAM_HORDE]    = AV_NPC_BASIC;

    /** Minimum resources are necessary for challenges */
    for (int i = 0; i < BG_TEAMS_COUNT; ++i)
    {
        m_challengeGoals[i][BG_AV_SOLDIER_AIR_ASSAULT]                     = 90; /** Real value 90  */
        m_challengeGoals[i][BG_AV_LIEUTENANT_AIR_ASSAULT]                  = 60; /** Real value 60  */
        m_challengeGoals[i][BG_AV_COMMANDER_AIR_ASSAULT]                   = 30; /** Real value 30  */
        m_challengeGoals[i][BG_AV_HIDE_CAVALRY_ASSAULT]                    = 25; /** Real value 25  */
        m_challengeGoals[i][BG_AV_TAMED_CAVALRY_ASSAULT]                   = 25; /** Real value 25  */
        m_challengeGoals[BG_TEAM_ALLIANCE][BG_AV_IRONDEEP_GROUND_ASSAULT]  = 280; /** Real value 280 */
        m_challengeGoals[BG_TEAM_ALLIANCE][BG_AV_COLDTOOTH_GROUND_ASSAULT] = 70; /** Real value 70  */
        m_challengeGoals[BG_TEAM_HORDE][BG_AV_IRONDEEP_GROUND_ASSAULT]     = 70; /** Real value 70 */
        m_challengeGoals[BG_TEAM_HORDE][BG_AV_COLDTOOTH_GROUND_ASSAULT]    = 280; /** Real value 280  */
        m_challengeGoals[i][BG_AV_BLOOD_WORLDBOSS_ASSAULT]                 = 200; /** Real value 200 */
    }

    /** Minimum reputation are required for challenges */
    for (int i = 0; i < BG_AV_NB_ASSAULTS; ++i)
        m_challengeMinReputationNeeded[i]   = REP_NEUTRAL; /** Real value REP_REVERED */

    m_challengeMinReputationNeeded[BG_AV_WORLDBOSS_ASSAULT]             = REP_NEUTRAL;
    m_challengeMinReputationNeeded[BG_AV_CAVALRY_ASSAULT]               = REP_HONORED;
    m_challengeMinReputationNeeded[BG_AV_AIR_ASSAULT_BEACON_SOLDIER]    = REP_REVERED;
    m_challengeMinReputationNeeded[BG_AV_AIR_ASSAULT_BEACON_LIEUTENANT] = REP_REVERED;
    m_challengeMinReputationNeeded[BG_AV_AIR_ASSAULT_BEACON_COMMANDER]  = REP_REVERED;
    m_challengeMinReputationNeeded[BG_AV_GROUND_ASSAULT]                = REP_HONORED;

    /** Some challenge can be repeated, timers handling this functionality */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_BEACON_SOLDIER]   =   1800000; /** Real value 1800000 */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_BEACON_LIEUTENANT]=   1800000; /** Real value 1800000 */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_BEACON_COMMANDER] =   1800000; /** Real value 1800000 */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_GLOBAL_SOLDIER]   = 172800000; /** Real value N/A */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_GLOBAL_LIEUTENANT]= 172800000; /** Real value N/A */
    m_challengeTimerStart[BG_AV_AIR_ASSAULT_GLOBAL_COMMANDER] = 172800000; /** Real value N/A */
    m_challengeTimerStart[BG_AV_GROUND_ASSAULT]               =   1800000; /** Real value 1800000 */
    m_challengeTimerStart[BG_AV_CAVALRY_ASSAULT]              =   1800000; /** Real value 1800000 */
    m_challengeTimerStart[BG_AV_WORLDBOSS_ASSAULT]            = 172800000; /** Real value N/A */

    /** Go status sent by players */
    for (int i = 0; i < BG_TEAMS_COUNT; ++i)
        for (int j = 0; j < BG_AV_NB_ASSAULTS; ++j)
            m_challengePlayerGoStatus[i][j] = false;
}

uint32 BattleGroundAV::getMinReputationNeeded(uint32 assault)
{
    ASSERT(assault < BG_AV_NB_ASSAULTS);
    return m_challengeMinReputationNeeded[assault];
}

void BattleGroundAV::setPlayerGoStatus(uint32 faction_id, uint32 challenge_type, bool av_value)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    ASSERT(challenge_type < BG_AV_NB_ASSAULTS);
    m_challengePlayerGoStatus[faction_id][challenge_type] = av_value;
}

uint32 BattleGroundAV::getPlayerGoStatus(uint32 faction_id, uint32 challenge_type)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    ASSERT(challenge_type < BG_AV_NB_ASSAULTS);
    return m_challengePlayerGoStatus[faction_id][challenge_type];
}

uint32 BattleGroundAV::getTimerNeeded(uint32 challenge_type)
{
    ASSERT(challenge_type < BG_AV_NB_ASSAULTS);
    return m_challengeTimerStart[challenge_type];
}

/** Global aerial cannot be done once again */
void BattleGroundAV::resetAerialChallengeInvocation(uint32 faction_id, uint32 aerial_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_SOLDIER)
        m_challengeStatus[faction_id][BG_AV_SOLDIER_AIR_ASSAULT] = 0;
    else if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_LIEUTENANT)
        m_challengeStatus[faction_id][BG_AV_LIEUTENANT_AIR_ASSAULT] = 0;
    if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_COMMANDER)
        m_challengeStatus[faction_id][BG_AV_COMMANDER_AIR_ASSAULT] = 0;
}

void BattleGroundAV::resetGroundChallengeInvocation(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    m_challengeStatus[faction_id][BG_AV_IRONDEEP_GROUND_ASSAULT] = 0;
    m_challengeStatus[faction_id][BG_AV_COLDTOOTH_GROUND_ASSAULT] = 0;
}

void BattleGroundAV::resetCavalryChallengeInvocation(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    m_challengeStatus[faction_id][BG_AV_HIDE_CAVALRY_ASSAULT] = 0;
    m_challengeStatus[faction_id][BG_AV_TAMED_CAVALRY_ASSAULT] = 0;

    SpawnEvent(AV_05_TAMED+faction_id, 2, true, true);
    SpawnEvent(AV_10_TAMED+faction_id, 2, true, true);
    SpawnEvent(AV_15_TAMED+faction_id, 2, true, true);
    SpawnEvent(AV_20_TAMED+faction_id, 2, true, true);
}

void BattleGroundAV::resetWorldBossChallengeInvocation(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    m_challengeStatus[faction_id][BG_AV_BLOOD_WORLDBOSS_ASSAULT] = 0;
}

/** Check if Aerial challenge is ready for a given faction */
bool BattleGroundAV::isAerialChallengeInvocationReady(uint32 faction_id, uint32 aerial_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_SOLDIER ||
            aerial_id == BG_AV_AIR_ASSAULT_GLOBAL_SOLDIER)
    {
        return (m_challengeStatus[faction_id][BG_AV_SOLDIER_AIR_ASSAULT] >=
                m_challengeGoals[faction_id][BG_AV_SOLDIER_AIR_ASSAULT]);
    }
    else if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_LIEUTENANT ||
             aerial_id == BG_AV_AIR_ASSAULT_GLOBAL_LIEUTENANT)
    {
        return (m_challengeStatus[faction_id][BG_AV_LIEUTENANT_AIR_ASSAULT] >=
                m_challengeGoals[faction_id][BG_AV_LIEUTENANT_AIR_ASSAULT]);
    }
    else if (aerial_id == BG_AV_AIR_ASSAULT_BEACON_COMMANDER ||
             aerial_id == BG_AV_AIR_ASSAULT_GLOBAL_COMMANDER)
    {
        return (m_challengeStatus[faction_id][BG_AV_COMMANDER_AIR_ASSAULT] >=
                m_challengeGoals[faction_id][BG_AV_COMMANDER_AIR_ASSAULT]);
    }

    return false;
}

/** Check if a Cavalry challenge is ready for a given faction */
bool BattleGroundAV::isCavalryChallengeInvocationReady(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    return ((m_challengeStatus[faction_id][BG_AV_HIDE_CAVALRY_ASSAULT] >=
             m_challengeGoals[faction_id][BG_AV_HIDE_CAVALRY_ASSAULT]) &&
            (m_challengeStatus[faction_id][BG_AV_TAMED_CAVALRY_ASSAULT] >=
             m_challengeGoals[faction_id][BG_AV_TAMED_CAVALRY_ASSAULT]));
}

/** Check if a Ground challenge is ready for a given faction */
bool BattleGroundAV::isGroundChallengeInvocationReady(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    return ((m_challengeStatus[faction_id][BG_AV_IRONDEEP_GROUND_ASSAULT] >=
             m_challengeGoals[faction_id][BG_AV_IRONDEEP_GROUND_ASSAULT]) ||
            (m_challengeStatus[faction_id][BG_AV_COLDTOOTH_GROUND_ASSAULT] >=
             m_challengeGoals[faction_id][BG_AV_COLDTOOTH_GROUND_ASSAULT]));
}

/** Check if a World Boss challenge is ready for a given faction */
bool BattleGroundAV::isWorldBossChallengeInvocationReady(uint32 faction_id)
{
    ASSERT(faction_id < BG_TEAMS_COUNT);
    return m_challengeStatus[faction_id][BG_AV_BLOOD_WORLDBOSS_ASSAULT] >=
           m_challengeGoals[faction_id][BG_AV_BLOOD_WORLDBOSS_ASSAULT];
}
/*********/

void BattleGroundAV::HandleKillUnit(Creature *creature, Player *killer)
{
    DEBUG_LOG("BattleGroundAV: HandleKillUnit %i", creature->GetEntry());
   if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    switch (creature->GetEntry())
    {
        case NPC_LANDMINES_LAYER_A2:
        case NPC_LANDMINES_LAYER_H2:
        {
            // Stop landmines respawn
            uint8 eventIdx = creature->GetEntry() == NPC_LANDMINES_LAYER_A2 ? BG_AV_LANDMINES_ALLIANCE : BG_AV_LANDMINES_HORDE;
            m_ActiveEvents[eventIdx] = 1; // Cf ScriptName "go_av_landmineAI"
            return;
        }
        case NPC_LANDMINES_EXPERT_A2:
        case NPC_LANDMINES_EXPERT_H2:
        {
            // Despawn all landmines
            uint8 eventIdx = creature->GetEntry() == NPC_LANDMINES_EXPERT_A2 ? BG_AV_LANDMINES_ALLIANCE : BG_AV_LANDMINES_HORDE;
            Map* map = GetBgMap();
            BGObjects::const_iterator itr = m_EventObjects[MAKE_PAIR32(eventIdx, 0)].gameobjects.begin();
            for (; itr != m_EventObjects[MAKE_PAIR32(eventIdx, 0)].gameobjects.end(); ++itr)
                if (GameObject* gobj = map->GetGameObject(*itr))
                    gobj->AddObjectToRemoveList();
            return;
        }
    }
    uint8 event1 = (sBattleGroundMgr.GetCreatureEventIndex(creature->GetGUIDLow())).event1;

    if (event1 == BG_EVENT_NONE || !killer)
        return;

    switch (event1)
    {
        case BG_AV_BOSS_A:
            CastSpellOnTeam(BG_AV_BOSS_KILL_QUEST_SPELL, HORDE);   // this is a spell which finishes a quest where a player has to kill the boss
            RewardReputationToTeam(BG_AV_FACTION_H, m_RepBoss, HORDE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_BOSS), HORDE);
            SendYellToAll(LANG_BG_AV_A_GENERAL_DEAD, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0));
            EndBattleGround(HORDE);
            break;
        case BG_AV_BOSS_H:
            CastSpellOnTeam(BG_AV_BOSS_KILL_QUEST_SPELL, ALLIANCE); // this is a spell which finishes a quest where a player has to kill the boss
            RewardReputationToTeam(BG_AV_FACTION_A, m_RepBoss, ALLIANCE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_BOSS), ALLIANCE);
            SendYellToAll(LANG_BG_AV_H_GENERAL_DEAD, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0));
            EndBattleGround(ALLIANCE);
            break;
        case BG_AV_CAPTAIN_A:
            if (IsActiveEvent(BG_AV_NodeEventCaptainDead_A, 0))
                return;
            RewardReputationToTeam(BG_AV_FACTION_H, m_RepCaptain, HORDE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_CAPTAIN), HORDE);
            UpdateScore(BG_TEAM_ALLIANCE, (-1) * BG_AV_RES_CAPTAIN);
            // spawn destroyed aura
            SpawnEvent(BG_AV_NodeEventCaptainDead_A, 0, true, true);
            break;
        case BG_AV_CAPTAIN_H:
            if (IsActiveEvent(BG_AV_NodeEventCaptainDead_H, 0))
                return;
            RewardReputationToTeam(BG_AV_FACTION_A, m_RepCaptain, ALLIANCE);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_CAPTAIN), ALLIANCE);
            UpdateScore(BG_TEAM_HORDE, (-1) * BG_AV_RES_CAPTAIN);
            // spawn destroyed aura
            SpawnEvent(BG_AV_NodeEventCaptainDead_H, 0, true, true);
            break;
        case BG_AV_COMMANDER_A_MORTIMER:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_A_MORTIMER, 0, RESPAWN_STOP);
            break;
        case BG_AV_COMMANDER_A_DUFFY:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_A_DUFFY, 0, RESPAWN_STOP); // despawn mobs
            break;
        case BG_AV_COMMANDER_A_KARLPHILIPS:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_A_KARLPHILIPS, 0, RESPAWN_STOP);
            CompleteQuestForAll(7281);
            break;
        case BG_AV_COMMANDER_A_RANDOLPH:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_A_RANDOLPH, 0, RESPAWN_STOP);
            break;
        case BG_AV_COMMANDER_H_DARDOSH:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_H_DARDOSH, 0, RESPAWN_STOP);
            break;
        case BG_AV_COMMANDER_H_LOUISPHILIPS:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_H_LOUISPHILIPS, 0, RESPAWN_STOP);
            CompleteQuestForAll(7282);
            break;
        case BG_AV_COMMANDER_H_MULFORT:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_H_MULFORT, 0, RESPAWN_STOP);
            break;
        case BG_AV_COMMANDER_H_MALGOR:
            //RewardReputationToTeam(BG_AV_FACTION_A, m_RepCommander, ALLIANCE);
            //RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_COMMANDER), ALLIANCE);
            SetSpawnEventMode(BG_AV_COMMANDER_H_MALGOR, 0, RESPAWN_STOP); // despawn mobs
            break;
        case BG_AV_MINE_BOSSES_NORTH:
            if (killer->GetTeam() == ALLIANCE)
            {
                ChangeMineOwner(BG_AV_NORTH_MINE, GetAVTeamIndexByTeamId(killer->GetTeam()));
                CompleteQuestForAll(7122);
            }
            else if (killer->GetTeam() == HORDE)
            {
                ChangeMineOwner(BG_AV_NORTH_MINE, GetAVTeamIndexByTeamId(killer->GetTeam()));
                CompleteQuestForAll(7124);
            }
            else // Never happens, this function HandleKillUnit is only called if a player kill a unit
                ChangeMineOwner(BG_AV_NORTH_MINE, BG_AV_TEAM_NEUTRAL);
            break;
        case BG_AV_MINE_BOSSES_SOUTH:
            if (killer->GetTeam() == ALLIANCE)
            {
                ChangeMineOwner(BG_AV_SOUTH_MINE, GetAVTeamIndexByTeamId(killer->GetTeam()));
                CompleteQuestForAll(7122);
            }   
            else if (killer->GetTeam() == HORDE)
            {
                ChangeMineOwner(BG_AV_SOUTH_MINE, GetAVTeamIndexByTeamId(killer->GetTeam()));
                CompleteQuestForAll(7124);
            }   
            else // Never happens, this function HandleKillUnit is only called if a player kill a unit
                ChangeMineOwner(BG_AV_SOUTH_MINE, BG_AV_TEAM_NEUTRAL);
            break;
        case BG_AV_EXPLOSIVES_EXPERT_A:
            CompleteQuestForAll(7367);
            SetSpawnEventMode(BG_AV_EXPLOSIVES_EXPERT_A, 0, RESPAWN_STOP);
            break;
        case BG_AV_EXPLOSIVES_EXPERT_H:
            CompleteQuestForAll(7368);
            SetSpawnEventMode(BG_AV_EXPLOSIVES_EXPERT_H, 0, RESPAWN_STOP);
            break;
    }
}

uint32 BattleGroundAV::GetActualArmorRessources(uint32 teamIdx)
{
    ASSERT(teamIdx < BG_TEAMS_COUNT);
    return m_Team_QuestStatus[teamIdx][0];
}

void BattleGroundAV::UpgradeArmor(Object* questGiver, Player *player)
{
    BattleGroundAVTeamIndex teamIdx = GetAVTeamIndexByTeamId(player->GetTeam());
    uint32 m_faction_id           = (player->GetTeam() == ALLIANCE) ? BG_TEAM_ALLIANCE : BG_TEAM_HORDE;
    char sMessageRemaining[200]        = "";
    uint32 ressources = 0;

    if (m_Team_QuestStatus[teamIdx][0] >= 500 && getReinforcementLevelGroundUnit(m_faction_id) == AV_NPC_BASIC)
        ressources = 500;
    else if (m_Team_QuestStatus[teamIdx][0] >= 1000 && getReinforcementLevelGroundUnit(m_faction_id) == AV_NPC_SEASONED)
        ressources = 1000;
    else if (m_Team_QuestStatus[teamIdx][0] >= 1500 && getReinforcementLevelGroundUnit(m_faction_id) == AV_NPC_VETERAN)
        ressources = 1500;

    setReinforcementLevelGroundUnit(teamIdx, ressources);

    if(ressources%500 == 0 && m_Team_QuestStatus[teamIdx][0] != 0 && questGiver->GetTypeId() == TYPEID_UNIT)
    {
        sprintf(sMessageRemaining,"Thanks for the supplies, %s",player->GetName());
        ((Creature*)questGiver)->MonsterSay(sMessageRemaining, 0, 0);

        if(ressources == 500)
        {
            if (teamIdx == 0)
                CastSpellOnTeam(28418, ALLIANCE);
            else
                CastSpellOnTeam(28418, HORDE);

            sprintf(sMessageRemaining,"Seasoned units are entering the battle!");
            ((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
        }
        else if(ressources == 1000)
        {
            if (teamIdx == 0)
                CastSpellOnTeam(28419, ALLIANCE);
            else
                CastSpellOnTeam(28419, HORDE);

            sprintf(sMessageRemaining,"Veteran units are entering the battle!");
            ((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
        }
        else if(ressources == 1500)
        {
            if (teamIdx == 0)
                CastSpellOnTeam(28420, ALLIANCE);
            else
                CastSpellOnTeam(28420, HORDE);

            sprintf(sMessageRemaining,"Champion units are entering the battle!");
            ((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
        }
    }

    if (m_Team_QuestStatus[teamIdx][0] == 500 || m_Team_QuestStatus[teamIdx][0] == 1000 || m_Team_QuestStatus[teamIdx][0] == 1500)  //25,50,75 turn ins
    {
        for (BG_AV_Nodes i = BG_AV_NODES_FIRSTAID_STATION; i <= BG_AV_NODES_FROSTWOLF_HUT; ++i)
            if (m_Nodes[i].Owner == teamIdx && m_Nodes[i].State == POINT_CONTROLLED)
                PopulateNode(i);
    }
}


void BattleGroundAV::HandleQuestComplete(Unit* questGiver, uint32 questid, Player *player)
{
    char sMessageRemaining[200]        = "";
    uint32 faction_spell = 0;

    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    BattleGroundAVTeamIndex teamIdx = GetAVTeamIndexByTeamId(player->GetTeam());
    ASSERT(teamIdx < BG_TEAMS_COUNT);

    uint32 reputation = 0;                                  // reputation for the whole team (other reputation must be done in db)
    // TODO add events (including quest not available anymore, next quest availabe, go/npc de/spawning)
    switch (questid)
    {
        case BG_AV_QUEST_A_SCRAPS1:
        case BG_AV_QUEST_A_SCRAPS2:
        case BG_AV_QUEST_H_SCRAPS1:
        case BG_AV_QUEST_H_SCRAPS2:
            m_Team_QuestStatus[teamIdx][0] += 20;

            /** Update reinforcement infos */
//            setReinforcementLevelGroundUnit(teamIdx, m_Team_QuestStatus[teamIdx][0]);

            if((m_Team_QuestStatus[teamIdx][0]%100) == 0 && (m_Team_QuestStatus[teamIdx][0]%500) != 0&& questGiver->GetTypeId() == TYPEID_UNIT)
            	((Creature*)questGiver)->MonsterSay("Great! Let's keep those supplies coming, people!", 0, 0);

/*            if(m_Team_QuestStatus[teamIdx][0]%500 == 0 && m_Team_QuestStatus[teamIdx][0] != 0 && questGiver->GetTypeId() == TYPEID_UNIT)
            {
            	sprintf(sMessageRemaining,"Thanks for the supplies, %s",player->GetName());
            	((Creature*)questGiver)->MonsterSay(sMessageRemaining, 0, 0);

            	if(m_Team_QuestStatus[teamIdx][0] == 500)            		
            	{
                    if (teamIdx == 0)
                        CastSpellOnTeam(28418, ALLIANCE);
                    else
                        CastSpellOnTeam(28418, HORDE);

                   sprintf(sMessageRemaining,"Seasoned units are entering the battle!");
                   ((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
            	}
            	else if(m_Team_QuestStatus[teamIdx][0] == 1000)            		
            	{
                    if (teamIdx == 0)
                        CastSpellOnTeam(28419, ALLIANCE);
                    else
                        CastSpellOnTeam(28419, HORDE);

            		sprintf(sMessageRemaining,"Veteran units are entering the battle!");
            		((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
            	}
            	else if(m_Team_QuestStatus[teamIdx][0] == 1500)            		
            	{
                    if (teamIdx == 0)
                        CastSpellOnTeam(28420, ALLIANCE);
                    else
                        CastSpellOnTeam(28420, HORDE);

            		sprintf(sMessageRemaining,"Champion units are entering the battle!");
            		((Creature*)questGiver)->MonsterYell(sMessageRemaining, 0, 0);
            	}

            }
*/
            /** Adding visual crates each time 100 ressources are added */
            if((m_Team_QuestStatus[teamIdx][0]%500) == 100)
            {
                SpawnEvent(AV_100_SUPPLIES+teamIdx, 0, true, false);
            }
            else if((m_Team_QuestStatus[teamIdx][0]%500) == 200)
            {
                SpawnEvent(AV_200_SUPPLIES+teamIdx, 0, true, false);
            }
            else if((m_Team_QuestStatus[teamIdx][0]%500) == 300)
            {
                SpawnEvent(AV_300_SUPPLIES+teamIdx, 0, true, true);
            }
            else if((m_Team_QuestStatus[teamIdx][0]%500) == 400)
            {
                SpawnEvent(AV_400_SUPPLIES+teamIdx, 0, true, true);
            }
            else if((m_Team_QuestStatus[teamIdx][0]%500) == 0 && m_Team_QuestStatus[teamIdx][0] !=0 )
            {
                SpawnEvent(AV_100_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_200_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_300_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_400_SUPPLIES+teamIdx, 2, true, false);
            }
            else if (m_Team_QuestStatus[teamIdx][0] ==20)
            {
                SpawnEvent(AV_100_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_200_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_300_SUPPLIES+teamIdx, 2, true, false);
                SpawnEvent(AV_400_SUPPLIES+teamIdx, 2, true, false);
            }

            reputation = 1;
/*           if (m_Team_QuestStatus[teamIdx][0] == 500 || m_Team_QuestStatus[teamIdx][0] == 1000 || m_Team_QuestStatus[teamIdx][0] == 1500)  //25,50,75 turn ins
            {
                DEBUG_LOG("BattleGroundAV: Quest %i completed starting with unit upgrading..", questid);
                for (BG_AV_Nodes i = BG_AV_NODES_FIRSTAID_STATION; i <= BG_AV_NODES_FROSTWOLF_HUT; ++i)
                    if (m_Nodes[i].Owner == teamIdx && m_Nodes[i].State == POINT_CONTROLLED)
                        PopulateNode(i);
            }
*/ 
           break;
        case BG_AV_QUEST_A_COMMANDER1:
        case BG_AV_QUEST_H_COMMANDER1:
            m_Team_QuestStatus[teamIdx][1]++;
            reputation = 1;
            if (m_Team_QuestStatus[teamIdx][1] == 90)
            {
                if (teamIdx == 0)
                    sprintf(sMessageRemaining,"Soldiers of Stormpike, come to my aid! The beacon must be planted.");
                else
                    sprintf(sMessageRemaining,"Soldiers of the Horde, come to my aid! The beacon must be planted.");

                questGiver->MonsterYell(sMessageRemaining, 0, 0);
            }
            break;
        case BG_AV_QUEST_A_COMMANDER2:
        case BG_AV_QUEST_H_COMMANDER2:
            m_Team_QuestStatus[teamIdx][2]++;
            reputation = 2;
            if (m_Team_QuestStatus[teamIdx][2] == 60)
            {
                if (teamIdx == 0)
                    sprintf(sMessageRemaining,"Soldiers of Stormpike, come to my aid! The beacon must be planted.");
                else
                    sprintf(sMessageRemaining,"Soldiers of the Horde, come to my aid! The beacon must be planted.");

                questGiver->MonsterYell(sMessageRemaining, 0, 0);
            }
            break;
        case BG_AV_QUEST_A_COMMANDER3:
        case BG_AV_QUEST_H_COMMANDER3:
            m_Team_QuestStatus[teamIdx][3]++;
            reputation = 5;
            if (m_Team_QuestStatus[teamIdx][3] == 30)
            {
                if (teamIdx == 0)
                    sprintf(sMessageRemaining,"Soldiers of Stormpike, come to my aid! The beacon must be planted.");
                else
                    sprintf(sMessageRemaining,"Soldiers of the Horde, come to my aid! The beacon must be planted.");

                questGiver->MonsterYell(sMessageRemaining, 0, 0);
            }
            break;
        case BG_AV_QUEST_A_BOSS1:
        case BG_AV_QUEST_H_BOSS1:
            m_Team_QuestStatus[teamIdx][4] += 4;               // there are 2 quests where you can turn in 5 or 1 item.. ( + 4 cause +1 will be done some lines below)
            reputation = 4;
        // no break
        case BG_AV_QUEST_A_BOSS2:
        case BG_AV_QUEST_H_BOSS2:
            m_Team_QuestStatus[teamIdx][4]++;
            reputation += 1;
            if (m_Team_QuestStatus[teamIdx][4] == 200)
            {
                if (teamIdx == 0)
                    sprintf(sMessageRemaining,"Soldiers of Stormpike, aid and protect us! The Forest Lord has granted us his protection. The portal must now be opened!");
                else
                    sprintf(sMessageRemaining,"Soldiers of Frostwolf, come to my aid! The Ice Lord has granted us his protection. He's accepted the offering! The time has come to unleash him upon the Stormpike Army!");

                questGiver->MonsterYell(sMessageRemaining, 0, 0);
            }
            break;
        case BG_AV_QUEST_A_NEAR_MINE:
        case BG_AV_QUEST_H_NEAR_MINE:
            m_Team_QuestStatus[teamIdx][5]++;
            reputation = 2;
            if (m_Team_QuestStatus[teamIdx][5] == 28)
            {
                DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here", questid);
                if (m_Team_QuestStatus[teamIdx][6] == 7)
                    DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here - ground assault ready", questid);
            }
            break;
        case BG_AV_QUEST_A_OTHER_MINE:
        case BG_AV_QUEST_H_OTHER_MINE:
            m_Team_QuestStatus[teamIdx][6]++;
            reputation = 3;
            if (m_Team_QuestStatus[teamIdx][6] == 7)
            {
                DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here", questid);
                if (m_Team_QuestStatus[teamIdx][5] == 20)
                    DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here - ground assault ready", questid);
            }
            break;
        case BG_AV_QUEST_A_RIDER_HIDE:
        case BG_AV_QUEST_H_RIDER_HIDE:
            m_Team_QuestStatus[teamIdx][7]++;
            reputation = 1;

            if (m_Team_QuestStatus[teamIdx][7] == 25)
            {
                DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here", questid);
                if (m_Team_QuestStatus[teamIdx][8] == 25)
                    DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here - rider assault ready", questid);
            }
            break;
        case BG_AV_QUEST_A_RIDER_TAME:
        case BG_AV_QUEST_H_RIDER_TAME:
            m_Team_QuestStatus[teamIdx][8]++;
            reputation = 1;

            if (m_Team_QuestStatus[teamIdx][8]%25 == 0 && m_Team_QuestStatus[teamIdx][8] !=0 )
                questGiver->MonsterYell("The stables are filled up!", 0, 0);
            if ((m_Team_QuestStatus[teamIdx][8]%5) == 0)
                questGiver->PMonsterSay("Thanks for the supplies, %s",player->GetName());


            /** Adding visual mount each time 5 ressources are added */
            if((m_Team_QuestStatus[teamIdx][8]%25) == 5)
            {
                SpawnEvent(AV_05_TAMED+teamIdx, 0, true, false);
            }
            else if((m_Team_QuestStatus[teamIdx][8]%25) == 10)
            {
                SpawnEvent(AV_10_TAMED+teamIdx, 0, true, false);
            }
            else if((m_Team_QuestStatus[teamIdx][8]%25) == 15)
            {
                SpawnEvent(AV_15_TAMED+teamIdx, 0, true, true);
            }
            else if((m_Team_QuestStatus[teamIdx][8]%25) == 20)
            {
                SpawnEvent(AV_20_TAMED+teamIdx, 0, true, true);
            }
            else if (m_Team_QuestStatus[teamIdx][8] ==1)
            {
                SpawnEvent(AV_05_TAMED+teamIdx, 2, true, false);
                SpawnEvent(AV_10_TAMED+teamIdx, 2, true, false);
                SpawnEvent(AV_15_TAMED+teamIdx, 2, true, false);
                SpawnEvent(AV_20_TAMED+teamIdx, 2, true, false);
            }


            if (m_Team_QuestStatus[teamIdx][8] == 25)
            {
                DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here", questid);
                if (m_Team_QuestStatus[teamIdx][8] == 25)
                    DEBUG_LOG("BattleGroundAV: Quest %i completed (need to implement some events here - rider assault ready", questid);
            }
            break;
        case 7402:
        case 7428:
        case 7364:
        case 7424:
        case 7365:
        case 7425:
        case 7426:
        case 7366:
        case 7367:
        case 7368:
        case 7401:
        case 7427:
        case 7361:
        case 7421:
        case 7422:
        case 7362:
        case 7423:
        case 7363:
            reputation = 1;
            break;

        default:
            DEBUG_LOG("BattleGroundAV: Quest %i completed but is not interesting for us", questid);
            return;
    }
    if (reputation)
        RewardReputationToTeam((player->GetTeam() == ALLIANCE) ? BG_AV_FACTION_A : BG_AV_FACTION_H, reputation, player->GetTeam());
}

void BattleGroundAV::UpdateScore(BattleGroundTeamIndex teamIdx, int32 points)
{
    // note: to remove reinforcements points must be negative, for adding reinforcements points must be positive
    MANGOS_ASSERT(teamIdx < BG_TEAMS_COUNT);
    m_TeamScores[teamIdx] += points;                      // m_TeamScores is int32 - so no problems here

    if (points < 0)
    {
        // Ivina < Nostalrius > : removed message and winning condition.
        if (m_TeamScores[teamIdx] < 1)
        {
            m_TeamScores[teamIdx] = 0;
            // other team will win:
            // EndBattleGround((teamIdx == BG_TEAM_ALLIANCE)? HORDE : ALLIANCE);
        }
        else if (!m_IsInformedNearLose[teamIdx] && m_TeamScores[teamIdx] < BG_AV_SCORE_NEAR_LOSE)
        {
            // SendMessageToAll((teamIdx == BG_TEAM_HORDE) ? LANG_BG_AV_H_NEAR_LOSE : LANG_BG_AV_A_NEAR_LOSE, CHAT_MSG_BG_SYSTEM_NEUTRAL);
            // PlaySoundToAll(BG_AV_SOUND_NEAR_LOSE);
            m_IsInformedNearLose[teamIdx] = true;
        }
    }
    // must be called here, else it could display a negative value
    UpdateWorldState(((teamIdx == BG_TEAM_HORDE) ? BG_AV_Horde_Score : BG_AV_Alliance_Score), m_TeamScores[teamIdx]);
}


void BattleGroundAV::ResetTamedEvent(uint32 teamIdx)
{
DEBUG_LOG("BattleGroundAV: TeamIdx %i ", teamIdx);
    SpawnEvent(AV_05_TAMED+teamIdx, 2, true, false);
    SpawnEvent(AV_10_TAMED+teamIdx, 2, true, false);
    SpawnEvent(AV_15_TAMED+teamIdx, 2, true, false);
    SpawnEvent(AV_20_TAMED+teamIdx, 2, true, false);
}

void BattleGroundAV::Update(uint32 diff)
{
    m_ui_Snivvle += diff;
    if (m_ui_Snivvle >= 70000 && !isSnivvle)
    {
        SendYellToAll(791, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_SNIVVLE, 0));
        isSnivvle = true;
    }


    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        /** Horde Captain buff during battle */
        if (m_ui_buff_h < diff)
        {
            if (!IsActiveEvent(BG_AV_NodeEventCaptainDead_H, 0))
            {
                CastSpellOnTeam(22751, HORDE);
                SendYellToAll(792, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_CAPTAIN_H, 0));
            }
            m_ui_buff_h = 120000 + urand(0,4)* 60000;
        }
        else
            m_ui_buff_h -= diff;

        /** Alliance Captain buff during battle */
        if (m_ui_buff_a < diff)
        {
            if (!IsActiveEvent(BG_AV_NodeEventCaptainDead_A, 0))
            {
                CastSpellOnTeam(23693, ALLIANCE);
                SendYellToAll(793, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_CAPTAIN_A, 0));
            }
            m_ui_buff_a = 120000 + urand(0,4)* 60000;
        }
        else
            m_ui_buff_a -= diff;


        if (GetStartDelayTime() <= m_StartDelayTimes[BG_STARTING_EVENT_THIRD] && !(m_Events & BG_STARTING_EVENT_3))
        {
            SpawnEvent(AV_100_SUPPLIES, 2, true, false);
            SpawnEvent(AV_200_SUPPLIES, 2, true, false);
            SpawnEvent(AV_300_SUPPLIES, 2, true, false);
            SpawnEvent(AV_400_SUPPLIES, 2, true, false);
            SpawnEvent(AV_100_SUPPLIES+1, 2, true, false);
            SpawnEvent(AV_200_SUPPLIES+1, 2, true, false);
            SpawnEvent(AV_300_SUPPLIES+1, 2, true, false);
            SpawnEvent(AV_400_SUPPLIES+1, 2, true, false);
            SpawnEvent(AV_05_TAMED, 2, true, false);
            SpawnEvent(AV_10_TAMED, 2, true, false);
            SpawnEvent(AV_15_TAMED, 2, true, false);
            SpawnEvent(AV_20_TAMED, 2, true, false);
            SpawnEvent(AV_05_TAMED+1, 2, true, false);
            SpawnEvent(AV_10_TAMED+1, 2, true, false);
            SpawnEvent(AV_15_TAMED+1, 2, true, false);
            SpawnEvent(AV_20_TAMED+1, 2, true, false);

            //Despawn upgraded alliance tower guard
            SpawnEvent(15,0,false,true);

            //Despawn upgraded horde tower guard
            SpawnEvent(28,0,false,true);
        }

        // add points from mine owning, and look if the neutral team can reclaim the mine
        for (uint8 mine = 0; mine < BG_AV_MAX_MINES; mine++)
        {
            if (m_Mine_Owner[mine] != BG_AV_TEAM_NEUTRAL)
            {
                m_Mine_Timer[mine] -= diff;
                if (m_Mine_Timer[mine] <= 0)
                {
                    UpdateScore(BattleGroundTeamIndex(m_Mine_Owner[mine]), 1);
                    m_Mine_Timer[mine] = BG_AV_MINE_TICK_TIMER;
                }

                if (m_Mine_Reclaim_Timer[mine] > diff)
                    m_Mine_Reclaim_Timer[mine] -= diff;
                else
                    ChangeMineOwner(mine, BG_AV_TEAM_NEUTRAL);
            }
        }

        // looks for all timers of the nodes and destroy the building (for graveyards the building wont get destroyed, it goes just to the other team
        for (BG_AV_Nodes i = BG_AV_NODES_FIRSTAID_STATION; i < BG_AV_NODES_MAX; ++i)
        {
            if (m_Nodes[i].State == POINT_ASSAULTED)
            {
                if (m_Nodes[i].Timer > diff)
                    m_Nodes[i].Timer -= diff;
                else
                {
                    if (i == BG_AV_NODES_STONEHEART_BUNKER)
                        SpawnEvent(25, 1, true, true);
                    EventPlayerDestroyedPoint(i);
                }
            }
        }
    }
    // Execute this at the end, since it can delete the BattleGround object!
    BattleGround::Update(diff);
}

void BattleGroundAV::StartingEventCloseDoors()
{
    DEBUG_LOG("BattleGroundAV: entering state STATUS_WAIT_JOIN ...");
}

void BattleGroundAV::StartingEventOpenDoors()
{
    OpenDoorEvent(BG_EVENT_DOOR);
}

void BattleGroundAV::AddPlayer(Player *plr)
{
    BattleGround::AddPlayer(plr);
    // create score and add it to map, default values are set in constructor
    BattleGroundAVScore* sc = new BattleGroundAVScore;
    m_PlayerScores[plr->GetObjectGuid()] = sc;
}

void BattleGroundAV::EndBattleGround(Team winner)
{
    // calculate bonuskills for both teams:
    uint32 tower_survived[BG_TEAMS_COUNT]  = {0, 0};
    uint32 graves_owned[BG_TEAMS_COUNT]    = {0, 0};
    uint32 mines_owned[BG_TEAMS_COUNT]     = {0, 0};
    // towers all not destroyed:
    for (BG_AV_Nodes i = BG_AV_NODES_DUNBALDAR_SOUTH; i <= BG_AV_NODES_STONEHEART_BUNKER; ++i)
        if (m_Nodes[i].State == POINT_CONTROLLED)
            if (m_Nodes[i].TotalOwner == BG_AV_TEAM_ALLIANCE)
                ++tower_survived[BG_TEAM_ALLIANCE];
    for (BG_AV_Nodes i = BG_AV_NODES_ICEBLOOD_TOWER; i <= BG_AV_NODES_FROSTWOLF_WTOWER; ++i)
        if (m_Nodes[i].State == POINT_CONTROLLED)
            if (m_Nodes[i].TotalOwner == BG_AV_TEAM_HORDE)
                ++tower_survived[BG_TEAM_HORDE];

    // graves all controlled
    for (BG_AV_Nodes i = BG_AV_NODES_FIRSTAID_STATION; i < BG_AV_NODES_MAX; ++i)
        if (m_Nodes[i].State == POINT_CONTROLLED && m_Nodes[i].Owner != BG_AV_TEAM_NEUTRAL)
            ++graves_owned[m_Nodes[i].Owner];

    for (uint32 i = 0; i < BG_AV_MAX_MINES; ++i)
        if (m_Mine_Owner[i] != BG_AV_TEAM_NEUTRAL)
            ++mines_owned[m_Mine_Owner[i]];

    // now we have the values give the honor/reputation to the teams:
    Team team[BG_TEAMS_COUNT]      = { ALLIANCE, HORDE };
    uint32 faction[BG_TEAMS_COUNT]   = { BG_AV_FACTION_A, BG_AV_FACTION_H };
    for (uint32 i = 0; i < BG_TEAMS_COUNT; i++)
    {
        if (tower_survived[i])
        {
            RewardReputationToTeam(faction[i], tower_survived[i] * m_RepSurviveTower, team[i]);
            RewardHonorToTeam(GetBonusHonorFromKill(tower_survived[i] * BG_AV_KILL_SURVIVING_TOWER), team[i]);
        }
        DEBUG_LOG("BattleGroundAV: EndbattleGround: bgteam: %u towers:%u honor:%u rep:%u", i, tower_survived[i], GetBonusHonorFromKill(tower_survived[i] * BG_AV_KILL_SURVIVING_TOWER), tower_survived[i] * BG_AV_REP_SURVIVING_TOWER);
        if (graves_owned[i])
            RewardReputationToTeam(faction[i], graves_owned[i] * m_RepOwnedGrave, team[i]);
        if (mines_owned[i])
            RewardReputationToTeam(faction[i], mines_owned[i] * m_RepOwnedMine, team[i]);
        // captain survived?:
        if (!IsActiveEvent(BG_AV_NodeEventCaptainDead_A + GetTeamIndexByTeamId(team[i]), 0))
        {
            RewardReputationToTeam(faction[i], m_RepSurviveCaptain, team[i]);
            RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_SURVIVING_CAPTAIN), team[i]);
        }
    }
    bool isBGWeekend = BattleGroundMgr::IsBGWeekend(GetTypeID());
    if (isBGWeekend)
    {
        RewardHonorToTeam(1584, ALLIANCE);
        RewardHonorToTeam(1584, HORDE);
        if (winner == HORDE)
            RewardHonorToTeam(396, HORDE);
        if (winner == ALLIANCE)
            RewardHonorToTeam(396, ALLIANCE);
    }

    // both teams:
    if (m_HonorMapComplete)
    {
        RewardHonorToTeam(m_HonorMapComplete, ALLIANCE);
        RewardHonorToTeam(m_HonorMapComplete, HORDE);
    }
    BattleGround::EndBattleGround(winner);
}

void BattleGroundAV::RemovePlayer(Player* /*plr*/, ObjectGuid /*guid*/)
{
}

void BattleGroundAV::HandleAreaTrigger(Player *Source, uint32 Trigger)
{
    // this is wrong way to implement these things. On official it done by gameobject spell cast.
    switch (Trigger)
    {
        case 95:
        case 2608:
            if (Source->GetTeam() != ALLIANCE)
                Source->GetSession()->SendNotification(LANG_BATTLEGROUND_ONLY_ALLIANCE_USE);
            else
                Source->LeaveBattleground();
            break;
        case 2606:
            if (Source->GetTeam() != HORDE)
                Source->GetSession()->SendNotification(LANG_BATTLEGROUND_ONLY_HORDE_USE);
            else
                Source->LeaveBattleground();
            break;
        case 3326:
        case 3327:
        case 3328:
        case 3329:
        case 3330:
        case 3331:
            //Source->Unmount();
            break;
        default:
            DEBUG_LOG("BattleGroundAV: WARNING: Unhandled AreaTrigger in Battleground: %u", Trigger);
//            Source->GetSession()->SendAreaTriggerMessage("Warning: Unhandled AreaTrigger in Battleground: %u", Trigger);
            break;
    }
}

void BattleGroundAV::UpdatePlayerScore(Player* Source, uint32 type, uint32 value)
{
    BattleGroundScoreMap::iterator itr = m_PlayerScores.find(Source->GetObjectGuid());
    if (itr == m_PlayerScores.end())                        // player not found...
        return;

    switch (type)
    {
        case SCORE_GRAVEYARDS_ASSAULTED:
            ((BattleGroundAVScore*)itr->second)->GraveyardsAssaulted += value;
            break;
        case SCORE_GRAVEYARDS_DEFENDED:
            ((BattleGroundAVScore*)itr->second)->GraveyardsDefended += value;
            break;
        case SCORE_TOWERS_ASSAULTED:
            ((BattleGroundAVScore*)itr->second)->TowersAssaulted += value;
            break;
        case SCORE_TOWERS_DEFENDED:
            ((BattleGroundAVScore*)itr->second)->TowersDefended += value;
            break;
        case SCORE_SECONDARY_OBJECTIVES:
            ((BattleGroundAVScore*)itr->second)->SecondaryObjectives += value;
            break;
        default:
            BattleGround::UpdatePlayerScore(Source, type, value);
            break;
    }
}

void BattleGroundAV::EventPlayerDestroyedPoint(BG_AV_Nodes node)
{
    DEBUG_LOG("BattleGroundAV: player destroyed point node %i", node);

    MANGOS_ASSERT(m_Nodes[node].Owner != BG_AV_TEAM_NEUTRAL)
    BattleGroundTeamIndex ownerTeamIdx = BattleGroundTeamIndex(m_Nodes[node].Owner);
    Team ownerTeam = ownerTeamIdx == BG_TEAM_ALLIANCE ? ALLIANCE : HORDE;

    // despawn banner
    DestroyNode(node);
    PopulateNode(node);
    UpdateNodeWorldState(node);

    if (IsTower(node))
    {
        UpdateScore(GetOtherTeamIndex(ownerTeamIdx), (-1) * BG_AV_RES_TOWER);
        RewardReputationToTeam((ownerTeam == ALLIANCE) ? BG_AV_FACTION_A : BG_AV_FACTION_H, m_RepTowerDestruction, ownerTeam);
        RewardHonorToTeam(GetBonusHonorFromKill(BG_AV_KILL_TOWER), ownerTeam);
        SendYell2ToAll(LANG_BG_AV_TOWER_TAKEN, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0), GetNodeName(node), (ownerTeam == ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);
    }
    else
        SendYell2ToAll(LANG_BG_AV_GRAVE_TAKEN, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0), GetNodeName(node), (ownerTeam == ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);

    if (IsTower(node))
    {
        if (ownerTeam == ALLIANCE)
            CompleteQuestForAll(7102);
        if (ownerTeam == HORDE)
            CompleteQuestForAll(7101);
    }

    if (IsGrave(node))
    {
        if (ownerTeam == ALLIANCE)
            CompleteQuestForAll(7081);
        if (ownerTeam == HORDE)
            CompleteQuestForAll(7082);
    }
}

void BattleGroundAV::ChangeMineOwner(uint8 mine, BattleGroundAVTeamIndex teamIdx)
{
    ASSERT(mine < BG_AV_MAX_MINES);
    m_Mine_Timer[mine] = BG_AV_MINE_TICK_TIMER;
    // TODO implement quest 7122
    // mine=0 northmine, mine=1 southmine
    // TODO changing the owner should result in setting respawntime to infinite for current creatures (they should fight the new ones), spawning new mine owners creatures and changing the chest - objects so that the current owning team can use them
    if (m_Mine_Owner[mine] == teamIdx)
        return;

    m_Mine_PrevOwner[mine] = m_Mine_Owner[mine];
    m_Mine_Owner[mine] = teamIdx;

    SendMineWorldStates(mine);

    SpawnEvent(BG_AV_MINE_EVENT + mine, teamIdx, true, false);
    SpawnEvent(BG_AV_MINE_BOSSES + mine, teamIdx, true, false);

    if (teamIdx != BG_AV_TEAM_NEUTRAL)
    {
        PlaySoundToAll((teamIdx == BG_AV_TEAM_ALLIANCE) ? BG_AV_SOUND_ALLIANCE_GOOD : BG_AV_SOUND_HORDE_GOOD);
        m_Mine_Reclaim_Timer[mine] = BG_AV_MINE_RECLAIM_TIMER;
        SendYell2ToAll(LANG_BG_AV_MINE_TAKEN , LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0),
                       (teamIdx == BG_AV_TEAM_ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE,
                       (mine == BG_AV_NORTH_MINE) ? LANG_BG_AV_MINE_NORTH : LANG_BG_AV_MINE_SOUTH);
    }

    if (teamIdx == BG_TEAM_ALLIANCE)
        CompleteQuestForAll(7122);
    else if (teamIdx == BG_TEAM_HORDE)
        CompleteQuestForAll(7124);
}

bool BattleGroundAV::PlayerCanDoMineQuest(int32 GOId, Team team)
{
    if (GOId == BG_AV_OBJECTID_MINE_N)
        return (m_Mine_Owner[BG_AV_NORTH_MINE] == GetAVTeamIndexByTeamId(team));
    if (GOId == BG_AV_OBJECTID_MINE_S)
        return (m_Mine_Owner[BG_AV_SOUTH_MINE] == GetAVTeamIndexByTeamId(team));
    return true;                                            // cause it's no mine'object it is ok if this is true
}

void BattleGroundAV::PopulateMineNode(uint8 mine, BattleGroundAVTeamIndex teamIdx, uint32 oldUpgradeAdvance)
{
    BattleGroundAVTeamIndex ActualFactionUpgrade = teamIdx;
    BattleGroundAVTeamIndex ActualMineOwner      = m_Mine_Owner[mine];
    ASSERT(ActualMineOwner < BG_TEAMS_COUNT);

    uint32 mineDefender    = 0;
    uint32 oldMineDefender = 0;

    /** Check new unit upgrade */
    if (m_Team_QuestStatus[ActualMineOwner][0] < 500)
        mineDefender = 0;
    else if (m_Team_QuestStatus[ActualMineOwner][0] < 1000)
        mineDefender = 1;
    else if (m_Team_QuestStatus[ActualMineOwner][0] < 1500)
        mineDefender = 2;
    else
        mineDefender = 3;

    /** Check old unit upgrade */
    if (oldUpgradeAdvance < 500)
        oldMineDefender = 0;
    else if (oldUpgradeAdvance < 1000)
        oldMineDefender = 1;
    else if (oldUpgradeAdvance < 1500)
        oldMineDefender = 2;
    else
        oldMineDefender = 3;

    if (ActualFactionUpgrade == ActualMineOwner)
    {
        // En cas de defense : l event est déjà spawn -> juste set le mode.
        SetSpawnEventMode(BG_AV_MINE_EVENT + mine, ActualMineOwner + mineDefender * 3, RESPAWN_FORCED);
        // En cas de prise du flag (destroy node)
        SpawnEvent(BG_AV_MINE_EVENT + mine, ActualMineOwner + mineDefender * 3, true, true);
    }
    else
    {
        // En cas de capture du flag (assault node) -> on ne despawn pas l event -> juste stop le repop
        SetSpawnEventMode(BG_AV_NODES_MAX + mine, ActualMineOwner + oldMineDefender * 3, RESPAWN_STOP);
    }
}

/// will spawn and despawn creatures around a node
/// more a wrapper around spawnevent cause graveyards are special
void BattleGroundAV::PopulateNode(BG_AV_Nodes node)
{
    ASSERT(node < BG_AV_NODES_MAX);
    BattleGroundAVTeamIndex NewteamIdx = m_Nodes[node].Owner;
    BattleGroundAVTeamIndex OldteamIdx = m_Nodes[node].PrevOtherOwner;

    uint32 delay = 0;
    if (IsGrave(node))
    {
        uint32 graveDefenderTypeNew;
        uint32 graveDefenderTypeOld;

        if (NewteamIdx == BG_AV_TEAM_NEUTRAL)
            graveDefenderTypeNew = 0;
        else if (m_Team_QuestStatus[NewteamIdx][0] < 500)
            graveDefenderTypeNew = 0;
        else if (m_Team_QuestStatus[NewteamIdx][0] < 1000)
            graveDefenderTypeNew = 1;
        else if (m_Team_QuestStatus[NewteamIdx][0] < 1500)
            graveDefenderTypeNew = 2;
        else
            graveDefenderTypeNew = 3;

        if (OldteamIdx == BG_AV_TEAM_NEUTRAL)
            graveDefenderTypeOld = 0;
        else if (m_Team_QuestStatus[OldteamIdx][0] < 500)
            graveDefenderTypeOld = 0;
        else if (m_Team_QuestStatus[OldteamIdx][0] < 1000)
            graveDefenderTypeOld = 1;
        else if (m_Team_QuestStatus[OldteamIdx][0] < 1500)
            graveDefenderTypeOld = 2;
        else
            graveDefenderTypeOld = 3;

        if (m_Nodes[node].State == POINT_CONTROLLED)
        {
            // En cas de defense : l event est déjà spawn -> juste set le mode.
            SetSpawnEventMode(BG_AV_NODES_MAX + node, NewteamIdx * BG_AV_MAX_GRAVETYPES + graveDefenderTypeNew, RESPAWN_FORCED);
            // En cas de prise du flag (destroy node)
            SpawnEvent(BG_AV_NODES_MAX + node, NewteamIdx * BG_AV_MAX_GRAVETYPES + graveDefenderTypeNew, true, true);
            delay = 5;
        }
        else
        {
            // En cas de capture du flag (assault node) -> on ne despawn pas l event -> juste stop le repop
            SetSpawnEventMode(BG_AV_NODES_MAX + node, OldteamIdx * BG_AV_MAX_GRAVETYPES + graveDefenderTypeOld, RESPAWN_STOP);
            delay = 1;
        }
    }
    if (IsTower(node) && NewteamIdx != BG_AV_TEAM_NEUTRAL)
    {
        if (m_Nodes[node].State == POINT_CONTROLLED) // we can spawn the current owner event
        {
            SetSpawnEventMode(BG_AV_NODES_MAX + node, (NewteamIdx * BG_AV_MAX_STATES) + 1, RESPAWN_FORCED);
            SpawnEvent(BG_AV_NODES_MAX + node, (NewteamIdx * BG_AV_MAX_STATES) + 1, true, true);
            delay = 5;
        }
        else // we despawn the event from the prevowner
        {
            SetSpawnEventMode(BG_AV_NODES_MAX + node, (OldteamIdx * BG_AV_MAX_STATES) + 1, RESPAWN_STOP);
            delay = 1;
        }
    }
    SpawnEvent(node, (NewteamIdx * BG_AV_MAX_STATES) + m_Nodes[node].State, true, true, delay);
}


/// called when using a banner
void BattleGroundAV::EventPlayerClickedOnFlag(Player *source, GameObject* target_obj)
{
    if (GetStatus() != STATUS_IN_PROGRESS)
        return;
    DEBUG_LOG("BattleGroundAV: using gameobject %i", target_obj->GetEntry());
    uint8 event = (sBattleGroundMgr.GetGameObjectEventIndex(target_obj->GetGUIDLow())).event1;
    if (event >= BG_AV_NODES_MAX)                           // not a node
        return;

    BG_AV_Nodes node = BG_AV_Nodes(event);
    switch ((sBattleGroundMgr.GetGameObjectEventIndex(target_obj->GetGUIDLow())).event2 % BG_AV_MAX_STATES)
    {
        case POINT_CONTROLLED:
            EventPlayerAssaultsPoint(source, node);
            break;
        case POINT_ASSAULTED:
            EventPlayerDefendsPoint(source, node);
            break;
        default:
            break;
    }
}

void BattleGroundAV::EventPlayerDefendsPoint(Player* player, BG_AV_Nodes node)
{
    MANGOS_ASSERT(GetStatus() == STATUS_IN_PROGRESS);
    ASSERT(node < BG_AV_NODES_MAX);

    BattleGroundTeamIndex teamIdx = GetTeamIndexByTeamId(player->GetTeam());

    if (m_Nodes[node].Owner == BattleGroundAVTeamIndex(teamIdx) || m_Nodes[node].State != POINT_ASSAULTED)
        return;
    if (m_Nodes[node].TotalOwner == BG_AV_TEAM_NEUTRAL)     // initial snowfall capture
    {
        // until snowfall doesn't belong to anyone it is better handled in assault - code (best would be to have a special function
        // for neutral nodes.. but doing this just for snowfall will be a bit to much i think
        MANGOS_ASSERT(node == BG_AV_NODES_SNOWFALL_GRAVE);  // currently the only neutral grave
        EventPlayerAssaultsPoint(player, node);
        return;
    }

    DEBUG_LOG("BattleGroundAV: player defends node: %i", node);
    if (m_Nodes[node].PrevOwner != BattleGroundAVTeamIndex(teamIdx))
    {
        sLog.outError("BattleGroundAV: player defends point which doesn't belong to his team %i", node);
        return;
    }

    DefendNode(node, teamIdx);                              // set the right variables for nodeinfo
    PopulateNode(node);                                     // spawn node-creatures (defender for example)
    UpdateNodeWorldState(node);                             // send new mapicon to the player

    if (IsTower(node))
    {
        SendYell2ToAll(LANG_BG_AV_TOWER_DEFENDED, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0),
                       GetNodeName(node),
                       (teamIdx == BG_TEAM_ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);
        UpdatePlayerScore(player, SCORE_TOWERS_DEFENDED, 1);
        PlaySoundToAll(BG_AV_SOUND_BOTH_TOWER_DEFEND);
    }
    else
    {
        SendYell2ToAll(LANG_BG_AV_GRAVE_DEFENDED, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0),
                       GetNodeName(node),
                       (teamIdx == BG_TEAM_ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);
        UpdatePlayerScore(player, SCORE_GRAVEYARDS_DEFENDED, 1);
        // update the statistic for the defending player
        PlaySoundToAll((teamIdx == BG_TEAM_ALLIANCE) ? BG_AV_SOUND_ALLIANCE_GOOD : BG_AV_SOUND_HORDE_GOOD);
    }
}

void BattleGroundAV::EventPlayerAssaultsPoint(Player* player, BG_AV_Nodes node)
{
    // TODO implement quest 7101, 7081
    BattleGroundTeamIndex teamIdx  = GetTeamIndexByTeamId(player->GetTeam());
    DEBUG_LOG("BattleGroundAV: player assaults node %i", node);
    if (m_Nodes[node].Owner == BattleGroundAVTeamIndex(teamIdx) || BattleGroundAVTeamIndex(teamIdx) == m_Nodes[node].TotalOwner)
        return;
    AssaultNode(node, teamIdx);                                // update nodeinfo variables
    UpdateNodeWorldState(node);                             // send mapicon
    PopulateNode(node);

    if (IsTower(node))
    {
        SendYell2ToAll(LANG_BG_AV_TOWER_ASSAULTED, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0),
                       GetNodeName(node),
                       (teamIdx == BG_TEAM_ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);
        UpdatePlayerScore(player, SCORE_TOWERS_ASSAULTED, 1);
    }
    else
    {
        SendYell2ToAll(LANG_BG_AV_GRAVE_ASSAULTED, LANG_UNIVERSAL, GetSingleCreatureGuid(BG_AV_HERALD, 0),
                       GetNodeName(node),
                       (teamIdx == BG_TEAM_ALLIANCE) ? LANG_BG_ALLY : LANG_BG_HORDE);
        // update the statistic for the assaulting player
        UpdatePlayerScore(player, SCORE_GRAVEYARDS_ASSAULTED, 1);
    }
    PlaySoundToAll((teamIdx == BG_TEAM_ALLIANCE) ? BG_AV_SOUND_ALLIANCE_ASSAULTS : BG_AV_SOUND_HORDE_ASSAULTS);
}

void BattleGroundAV::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    bool stateok;
    for (uint32 i = BG_AV_NODES_FIRSTAID_STATION; i < BG_AV_NODES_MAX; ++i)
    {
        for (uint8 j = 0; j < BG_AV_MAX_STATES; j++)
        {
            stateok = (m_Nodes[i].State == j);
            FillInitialWorldState(data, count, BG_AV_NodeWorldStates[i][GetWorldStateType(j, BG_AV_TEAM_ALLIANCE)],
                                  m_Nodes[i].Owner == BG_AV_TEAM_ALLIANCE && stateok);
            FillInitialWorldState(data, count, BG_AV_NodeWorldStates[i][GetWorldStateType(j, BG_AV_TEAM_HORDE)],
                                  m_Nodes[i].Owner == BG_AV_TEAM_HORDE && stateok);
        }
    }

    if (m_Nodes[BG_AV_NODES_SNOWFALL_GRAVE].Owner == BG_AV_TEAM_NEUTRAL)    // cause neutral teams aren't handled generic
        FillInitialWorldState(data, count, AV_SNOWFALL_N, 1);

    FillInitialWorldState(data, count, BG_AV_Alliance_Score, m_TeamScores[BG_TEAM_ALLIANCE]);
    FillInitialWorldState(data, count, BG_AV_Horde_Score,    m_TeamScores[BG_TEAM_HORDE]);
    if (GetStatus() == STATUS_IN_PROGRESS)                  // only if game is running the teamscores are displayed
    {
        FillInitialWorldState(data, count, BG_AV_SHOW_A_SCORE, 1);
        FillInitialWorldState(data, count, BG_AV_SHOW_H_SCORE, 1);
    }
    else
    {
        FillInitialWorldState(data, count, BG_AV_SHOW_A_SCORE, 0);
        FillInitialWorldState(data, count, BG_AV_SHOW_H_SCORE, 0);
    }

    FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_NORTH_MINE][m_Mine_Owner[BG_AV_NORTH_MINE]], 1);
    if (m_Mine_Owner[BG_AV_NORTH_MINE] != m_Mine_PrevOwner[BG_AV_NORTH_MINE])
        FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_NORTH_MINE][m_Mine_PrevOwner[BG_AV_NORTH_MINE]], 0);

    FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_SOUTH_MINE][m_Mine_Owner[BG_AV_SOUTH_MINE]], 1);
    if (m_Mine_Owner[BG_AV_SOUTH_MINE] != m_Mine_PrevOwner[BG_AV_SOUTH_MINE])
        FillInitialWorldState(data, count, BG_AV_MineWorldStates[BG_AV_SOUTH_MINE][m_Mine_PrevOwner[BG_AV_SOUTH_MINE]], 0);
}

void BattleGroundAV::UpdateNodeWorldState(BG_AV_Nodes node)
{
    UpdateWorldState(BG_AV_NodeWorldStates[node][GetWorldStateType(m_Nodes[node].State, m_Nodes[node].Owner)], 1);
    if (m_Nodes[node].PrevOwner == BG_AV_TEAM_NEUTRAL)      // currently only snowfall is supported as neutral node
        UpdateWorldState(AV_SNOWFALL_N, 0);
    else
        UpdateWorldState(BG_AV_NodeWorldStates[node][GetWorldStateType(m_Nodes[node].PrevState, m_Nodes[node].PrevOwner)], 0);
}

void BattleGroundAV::SendMineWorldStates(uint32 mine)
{
    MANGOS_ASSERT(mine == BG_AV_NORTH_MINE || mine == BG_AV_SOUTH_MINE);
    ASSERT(m_Mine_Owner[mine] < BG_AV_TEAMS_COUNT);
    ASSERT(m_Mine_PrevOwner[mine] < BG_AV_TEAMS_COUNT);

    UpdateWorldState(BG_AV_MineWorldStates[mine][m_Mine_Owner[mine]], 1);
    if (m_Mine_Owner[mine] != m_Mine_PrevOwner[mine])
        UpdateWorldState(BG_AV_MineWorldStates[mine][m_Mine_PrevOwner[mine]], 0);
}

WorldSafeLocsEntry const* BattleGroundAV::GetClosestGraveYard(Player *plr)
{
    // repop players at the entrance GY if BG is not started yet
    if (GetStatus() != STATUS_IN_PROGRESS && !plr->isGameMaster())
    {
        if (WorldSafeLocsEntry const* gEntry = sWorldSafeLocsStore.LookupEntry(plr->GetTeam() == ALLIANCE ? 611 : 610))
            return gEntry;
    }

    float x = plr->GetPositionX();
    float y = plr->GetPositionY();
    float mindist = 9999999.0f;

    BattleGroundAVTeamIndex teamIdx = GetAVTeamIndexByTeamId(plr->GetTeam());
    // Defaut graveyard is ghost in the starting-cave
    WorldSafeLocsEntry const* good_entry = sWorldSafeLocsStore.LookupEntry(BG_AV_GraveyardIds[teamIdx + 7]);
    if (good_entry)
        mindist = (good_entry->x - x) * (good_entry->x - x) + (good_entry->y - y) * (good_entry->y - y);

    if (GetStatus() == STATUS_IN_PROGRESS)
    {
        // Is there any occupied node for this team?

        for (uint8 i = BG_AV_NODES_FIRSTAID_STATION; i <= BG_AV_NODES_FROSTWOLF_HUT; ++i)
        {
            if (m_Nodes[i].Owner != teamIdx || m_Nodes[i].State != POINT_CONTROLLED)
                continue;
            WorldSafeLocsEntry const * entry = sWorldSafeLocsStore.LookupEntry(BG_AV_GraveyardIds[i]);
            if (!entry)
                continue;
            float dist = (entry->x - x) * (entry->x - x) + (entry->y - y) * (entry->y - y);
            if (mindist > dist)
            {
                mindist = dist;
                good_entry = entry;
            }
        }
    }

    return good_entry;
}

uint32 BattleGroundAV::GetNodeName(BG_AV_Nodes node)
{
    switch (node)
    {
        case BG_AV_NODES_FIRSTAID_STATION:
            return LANG_BG_AV_NODE_GRAVE_STORM_AID;
        case BG_AV_NODES_DUNBALDAR_SOUTH:
            return LANG_BG_AV_NODE_TOWER_DUN_S;
        case BG_AV_NODES_DUNBALDAR_NORTH:
            return LANG_BG_AV_NODE_TOWER_DUN_N;
        case BG_AV_NODES_STORMPIKE_GRAVE:
            return LANG_BG_AV_NODE_GRAVE_STORMPIKE;
        case BG_AV_NODES_ICEWING_BUNKER:
            return LANG_BG_AV_NODE_TOWER_ICEWING;
        case BG_AV_NODES_STONEHEART_GRAVE:
            return LANG_BG_AV_NODE_GRAVE_STONE;
        case BG_AV_NODES_STONEHEART_BUNKER:
            return LANG_BG_AV_NODE_TOWER_STONE;
        case BG_AV_NODES_SNOWFALL_GRAVE:
            return LANG_BG_AV_NODE_GRAVE_SNOW;
        case BG_AV_NODES_ICEBLOOD_TOWER:
            return LANG_BG_AV_NODE_TOWER_ICE;
        case BG_AV_NODES_ICEBLOOD_GRAVE:
            return LANG_BG_AV_NODE_GRAVE_ICE;
        case BG_AV_NODES_TOWER_POINT:
            return LANG_BG_AV_NODE_TOWER_POINT;
        case BG_AV_NODES_FROSTWOLF_GRAVE:
            return LANG_BG_AV_NODE_GRAVE_FROST;
        case BG_AV_NODES_FROSTWOLF_ETOWER:
            return LANG_BG_AV_NODE_TOWER_FROST_E;
        case BG_AV_NODES_FROSTWOLF_WTOWER:
            return LANG_BG_AV_NODE_TOWER_FROST_W;
        case BG_AV_NODES_FROSTWOLF_HUT:
            return LANG_BG_AV_NODE_GRAVE_FROST_HUT;
        default:
            return 0;
            break;
    }
}

void BattleGroundAV::AssaultNode(BG_AV_Nodes node, BattleGroundTeamIndex teamIdx)
{
    ASSERT(node < BG_AV_NODES_MAX);
    MANGOS_ASSERT(m_Nodes[node].TotalOwner != BattleGroundAVTeamIndex(teamIdx));
    MANGOS_ASSERT(m_Nodes[node].Owner != BattleGroundAVTeamIndex(teamIdx));
    // only assault an assaulted node if no totalowner exists:
    MANGOS_ASSERT(m_Nodes[node].State != POINT_ASSAULTED || m_Nodes[node].TotalOwner == BG_AV_TEAM_NEUTRAL);
    // the timer gets another time, if the previous owner was 0 == Neutral
    m_Nodes[node].Timer      = (m_Nodes[node].PrevOwner != BG_AV_TEAM_NEUTRAL) ? BG_AV_CAPTIME : BG_AV_SNOWFALL_FIRSTCAP;
    m_Nodes[node].PrevOwner  = m_Nodes[node].Owner;
    m_Nodes[node].PrevOtherOwner = m_Nodes[node].Owner;
    m_Nodes[node].Owner      = BattleGroundAVTeamIndex(teamIdx);
    m_Nodes[node].PrevState  = m_Nodes[node].State;
    m_Nodes[node].State      = POINT_ASSAULTED;
}

void BattleGroundAV::DestroyNode(BG_AV_Nodes node)
{
    ASSERT(node < BG_AV_NODES_MAX);
    MANGOS_ASSERT(m_Nodes[node].State == POINT_ASSAULTED);

    m_Nodes[node].TotalOwner = m_Nodes[node].Owner;
    m_Nodes[node].PrevOwner  = m_Nodes[node].Owner;
    m_Nodes[node].PrevState  = m_Nodes[node].State;
    m_Nodes[node].State      = POINT_CONTROLLED;
    m_Nodes[node].Timer      = 0;
}

void BattleGroundAV::InitNode(BG_AV_Nodes node, BattleGroundAVTeamIndex teamIdx, bool tower)
{
    ASSERT(node < BG_AV_NODES_MAX);
    m_Nodes[node].TotalOwner = teamIdx;
    m_Nodes[node].Owner      = teamIdx;
    m_Nodes[node].PrevOwner  = teamIdx;
    m_Nodes[node].PrevOtherOwner = teamIdx;
    m_Nodes[node].State      = POINT_CONTROLLED;
    m_Nodes[node].PrevState  = m_Nodes[node].State;
    m_Nodes[node].State      = POINT_CONTROLLED;
    m_Nodes[node].Timer      = 0;
    m_Nodes[node].Tower      = tower;
    m_ActiveEvents[node] = teamIdx * BG_AV_MAX_STATES + m_Nodes[node].State;
    if (IsGrave(node))                                      // grave-creatures are special cause of a quest
        m_ActiveEvents[node + BG_AV_NODES_MAX]  = teamIdx * BG_AV_MAX_GRAVETYPES;
    if (IsTower(node))                                      // tower-creatures are special cause of a quest
        m_ActiveEvents[node + BG_AV_NODES_MAX]  = teamIdx * 2 + 1;
}

void BattleGroundAV::DefendNode(BG_AV_Nodes node, BattleGroundTeamIndex teamIdx)
{
    ASSERT(node < BG_AV_NODES_MAX);
    MANGOS_ASSERT(m_Nodes[node].TotalOwner == BattleGroundAVTeamIndex(teamIdx));
    MANGOS_ASSERT(m_Nodes[node].Owner != BattleGroundAVTeamIndex(teamIdx));
    MANGOS_ASSERT(m_Nodes[node].State != POINT_CONTROLLED);
    m_Nodes[node].PrevOwner  = m_Nodes[node].Owner;
    m_Nodes[node].PrevOtherOwner = m_Nodes[node].Owner;
    m_Nodes[node].Owner      = BattleGroundAVTeamIndex(teamIdx);
    m_Nodes[node].PrevState  = m_Nodes[node].State;
    m_Nodes[node].State      = POINT_CONTROLLED;
    m_Nodes[node].Timer      = 0;
}

void BattleGroundAV::Reset()
{
    BattleGround::Reset();
    // set the reputation and honor variables:
    bool isBGWeekend = BattleGroundMgr::IsBGWeekend(GetTypeID());

    m_HonorMapComplete    = (isBGWeekend) ? BG_AV_KILL_MAP_COMPLETE_HOLIDAY : BG_AV_KILL_MAP_COMPLETE;
    m_RepTowerDestruction = (isBGWeekend) ? BG_AV_REP_TOWER_HOLIDAY         : BG_AV_REP_TOWER;
    m_RepCaptain          = (isBGWeekend) ? BG_AV_REP_CAPTAIN_HOLIDAY       : BG_AV_REP_CAPTAIN;
    m_RepBoss             = (isBGWeekend) ? BG_AV_REP_BOSS_HOLIDAY          : BG_AV_REP_BOSS;
    m_RepOwnedGrave       = (isBGWeekend) ? BG_AV_REP_OWNED_GRAVE_HOLIDAY   : BG_AV_REP_OWNED_GRAVE;
    m_RepSurviveCaptain   = (isBGWeekend) ? BG_AV_REP_SURVIVING_CAPTAIN_HOLIDAY : BG_AV_REP_SURVIVING_CAPTAIN;
    m_RepSurviveTower     = (isBGWeekend) ? BG_AV_REP_SURVIVING_TOWER_HOLIDAY : BG_AV_REP_SURVIVING_TOWER;
    m_RepOwnedMine        = (isBGWeekend) ? BG_AV_REP_OWNED_MINE_HOLIDAY    : BG_AV_REP_OWNED_MINE;

    for (uint8 i = 0; i < BG_TEAMS_COUNT; i++)
    {
        for (uint8 j = 0; j < 9; j++)                       // 9 quests getting tracked
            m_Team_QuestStatus[i][j] = 0;
        m_TeamScores[i]         = BG_AV_SCORE_INITIAL_POINTS;
        m_IsInformedNearLose[i] = false;
        m_ActiveEvents[BG_AV_NodeEventCaptainDead_A + i] = BG_EVENT_NONE;
    }

    for (uint8 i = 0; i < BG_AV_MAX_MINES; i++)
    {
        m_Mine_Owner[i] = BG_AV_TEAM_NEUTRAL;
        m_Mine_PrevOwner[i] = m_Mine_Owner[i];
        m_ActiveEvents[BG_AV_MINE_BOSSES + i] = BG_AV_TEAM_NEUTRAL;
        m_ActiveEvents[BG_AV_MINE_EVENT + i] = BG_AV_TEAM_NEUTRAL;
        m_Mine_Timer[i] = BG_AV_MINE_TICK_TIMER;
    }

    m_ActiveEvents[BG_AV_CAPTAIN_A]         = 0;
    m_ActiveEvents[BG_AV_CAPTAIN_H]         = 0;
    m_ActiveEvents[BG_AV_HERALD]            = 0;
    m_ActiveEvents[BG_AV_SNIVVLE]           = 0;
    m_ActiveEvents[BG_AV_BOSS_A]            = 0;
    m_ActiveEvents[BG_AV_BOSS_H]            = 0;
    m_ActiveEvents[BG_AV_LANDMINES_ALLIANCE]= 0;
    m_ActiveEvents[BG_AV_LANDMINES_HORDE]   = 0;

    for (BG_AV_Nodes i = BG_AV_NODES_DUNBALDAR_SOUTH; i <= BG_AV_NODES_FROSTWOLF_WTOWER; ++i)  // towers
        m_ActiveEvents[BG_AV_COMMANDER_A_MORTIMER + i - BG_AV_NODES_DUNBALDAR_SOUTH] = 0; // Commanders are alive

    for (BG_AV_Nodes i = BG_AV_NODES_FIRSTAID_STATION; i <= BG_AV_NODES_STONEHEART_GRAVE; ++i)  // alliance graves
        InitNode(i, BG_AV_TEAM_ALLIANCE, false);
    for (BG_AV_Nodes i = BG_AV_NODES_DUNBALDAR_SOUTH; i <= BG_AV_NODES_STONEHEART_BUNKER; ++i)  // alliance towers
        InitNode(i, BG_AV_TEAM_ALLIANCE, true);

    for (BG_AV_Nodes i = BG_AV_NODES_ICEBLOOD_GRAVE; i <= BG_AV_NODES_FROSTWOLF_HUT; ++i)       // horde graves
        InitNode(i, BG_AV_TEAM_HORDE, false);
    for (BG_AV_Nodes i = BG_AV_NODES_ICEBLOOD_TOWER; i <= BG_AV_NODES_FROSTWOLF_WTOWER; ++i)    // horde towers
        InitNode(i, BG_AV_TEAM_HORDE, true);

    InitNode(BG_AV_NODES_SNOWFALL_GRAVE, BG_AV_TEAM_NEUTRAL, false);                            // give snowfall neutral owner

    /** Initialize challenge objectives */
    initializeChallengeInvocationGoals();

}


/* Reap <Nostalrius> */
/*
Valide une quête de type alterac:
SetQuestSlotCounter-> Visuel "Complete Quest" dans le journal de quête. (Deco reco disparais il faut donc modifier la fonction pour que sa le modifie dans `character_queststatus`)
SetQuestStatus-> Validation dans la bdd.
SendQuestCompleteEvent -> Affiche au joueur que une quête est validée.
*/
void BattleGroundAV::CompleteQuestForAll(uint32 questId)
{
    Map::PlayerList const &PlayerList = GetBgMap()->GetPlayers();
    for (Map::PlayerList::const_iterator it = PlayerList.begin(); it != PlayerList.end(); ++it)
        if (Player* player = it->getSource())
            if (player->GetQuestStatus(questId) == QUEST_STATUS_INCOMPLETE)
                player->FullQuestComplete(questId);
}


void BattleGroundAV::HandleCommand(Player* player, ChatHandler* handler, char* args)
{
    std::stringstream in(args);
    std::string commandType;
    in >> commandType;
    if (commandType == "reinforcement")
    {
        int factionId;
        int value;
        in >> commandType;
        in >> value;
        if (commandType == "a")
            factionId = BG_TEAM_ALLIANCE;
        else
            factionId = BG_TEAM_HORDE;

        setReinforcementLevelGroundUnit(factionId, value);
        handler->PSendSysMessage("Reinforcement %s: added %i. Value now %u", factionId == BG_TEAM_ALLIANCE ? "Alliance" : "Horde", value, getReinforcementLevelGroundUnit(factionId));
    }
    else if (commandType == "quest")
    {
        int questId;
        in >> questId;
        if (Creature* target = player->getSelectedCreature())
        {
            HandleQuestComplete(target, questId, player);
            handler->PSendSysMessage("Quest #%u completed on target %s", questId, target->GetName());
        }
        else
            handler->SendSysMessage(LANG_SELECT_CHAR_OR_CREATURE);
    }
    else if (commandType == "completequest")
    {
        int questId;
        in >> questId;
        CompleteQuestForAll(questId);
        handler->PSendSysMessage("Called BattleGroundAV::CompleteQuestForAll(%u)", questId);
    }
    else
        BattleGround::HandleCommand(player, handler, args);
}

SpellCastResult BattleGroundAV::CheckSpellCast(Player* caster, SpellEntry const* spell)
{
    switch (spell->Id)
    {
        case SPELL_SUMMON_SHREDDER_A2:
        case SPELL_SUMMON_SHREDDER_H2:
        {
            BattleGroundTeamIndex teamId = (spell->Id == SPELL_SUMMON_SHREDDER_A2) ? BG_TEAM_ALLIANCE : BG_TEAM_HORDE;
            ObjectGuid& shredderOwnerGuid = m_shredderOwners[teamId];
            if (Player* shredderOwner = caster->GetMap()->GetPlayer(shredderOwnerGuid))
                if (Unit* charm = shredderOwner->GetCharm())
                    switch (charm->GetEntry())
                    {
                        case NPC_SHREDDER_H2:
                        case NPC_SHREDDER_A2:
                            return SPELL_FAILED_SPELL_UNAVAILABLE;
                    }
            shredderOwnerGuid = caster->GetObjectGuid();
            break;
        }
    }
    return BattleGround::CheckSpellCast(caster, spell);
}
