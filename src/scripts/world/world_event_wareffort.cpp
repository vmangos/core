/*
* Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
* Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
* Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
* Copyright (C) 2017- Light's Hope Project <https://github.com/LightsHope>
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

#include "scriptPCH.h"
#include "CreatureEventAI.h"
#include "world_event_wareffort.h"
#include <array>

uint32 BuildWarEffortWorldStates(WorldPacket &data)
{
    uint32 count = 0;
    for (int i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
    {
        uint32 amount = sObjectMgr.GetSavedVariable(AllianceObjectives[i].currentVar, 0);

        WriteInitialWorldStatePair(data, AllianceObjectives[i].wsCurrent, amount);
        WriteInitialWorldStatePair(data, AllianceObjectives[i].wsRequired, AllianceObjectives[i].required);

        amount = sObjectMgr.GetSavedVariable(HordeObjectives[i].currentVar, 0);
        WriteInitialWorldStatePair(data, HordeObjectives[i].wsCurrent, amount);
        WriteInitialWorldStatePair(data, HordeObjectives[i].wsRequired, HordeObjectives[i].required);

        count += 4;
    }

    for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
    {
        uint32 allianceContrib = GetTeamStock(SharedObjectives[i].itemId, TEAM_ALLIANCE);
        uint32 hordeContrib = GetTeamStock(SharedObjectives[i].itemId, TEAM_HORDE);

        WriteInitialWorldStatePair(data, SharedObjectives[i].wsAllianceCurrent, allianceContrib);
        WriteInitialWorldStatePair(data, SharedObjectives[i].wsHordeCurrent, hordeContrib);
        WriteInitialWorldStatePair(data, SharedObjectives[i].wsRequired, SharedObjectives[i].required);

        count += 3;
    }
    WarEffortGameEvents activeEvent;
    if ((activeEvent = GetActiveTransportEvent()) != EVENT_WAR_EFFORT_TERMINATOR)
    {
        uint32 daysRemaining = 5;
        switch (activeEvent)
        {
            case EVENT_WAR_EFFORT_TRANSITION_DAY1:
                daysRemaining = 5;
                break;
            case EVENT_WAR_EFFORT_TRANSITION_DAY2:
                daysRemaining = 4;
                break;
            case EVENT_WAR_EFFORT_TRANSITION_DAY3:
                daysRemaining = 3;
                break;
            case EVENT_WAR_EFFORT_TRANSITION_DAY4:
                daysRemaining = 2;
                break;
            case EVENT_WAR_EFFORT_TRANSITION_DAY5:
                daysRemaining = 1;
        }

        WriteInitialWorldStatePair(data, WS_WE_TRANSITION_DAYS_REMAINING, daysRemaining);
        ++count;
    }

    return count;
}

// Will automatically add resources to all pools at a rate of 10% per call,
// which can be adjusted by a multiplier in the world config
void AutoCompleteWarEffortProgress()
{
    float rate = sWorld.getConfig(CONFIG_FLOAT_RATE_WAR_EFFORT_RESOURCE);

    if (!rate)
        return;

    sLog.Out(LOG_SCRIPTS, LOG_LVL_MINIMAL, "[WarEffortEvent] Auto-completing war effort progress. Rate: %0.2f", rate);

    for (int i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
    {
        AutoCompleteWarEffortResource(AllianceObjectives[i].itemId, AllianceObjectives[i].required,
            AllianceObjectives[i].currentVar, rate, TEAM_ALLIANCE);

        AutoCompleteWarEffortResource(HordeObjectives[i].itemId, HordeObjectives[i].required,
            HordeObjectives[i].currentVar, rate, TEAM_HORDE);
    }

    for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
    {
        uint32 allianceVar = GetSharedSavedVar(SharedObjectives[i].itemId, TEAM_ALLIANCE);
        uint32 hordeVar = GetSharedSavedVar(SharedObjectives[i].itemId, TEAM_HORDE);

        AutoCompleteWarEffortResource(SharedObjectives[i].itemId, SharedObjectives[i].required, allianceVar, rate, TEAM_ALLIANCE);
        AutoCompleteWarEffortResource(SharedObjectives[i].itemId, SharedObjectives[i].required, hordeVar, rate, TEAM_HORDE);
    }

    sLog.Out(LOG_SCRIPTS, LOG_LVL_MINIMAL, "[WarEffortEvent] Auto-complete done");
}

void AutoCompleteWarEffortResource(uint32 resourceId, uint32 required, uint32 savedVar, float rate, TeamId team)
{
    std::string teamStr;
    switch (team)
    {
        case TEAM_HORDE:
            teamStr = "Horde";
            break;
        case TEAM_ALLIANCE:
            teamStr = "Alliance";
            break;
    }

    uint32 amount = sObjectMgr.GetSavedVariable(savedVar, 0);
    if (amount >= required)
        return;

    uint32 increase = (uint32)(required * rate);
    if (amount + increase > required)
        increase = required - amount;

    amount += increase;

    sObjectMgr.SetSavedVariable(savedVar, amount, true);
    sLog.Out(LOG_SCRIPTS, LOG_LVL_MINIMAL, "[WarEffortEvent] %s resource %u (saved var: %u) incremented by %u to %u (goal: %u)",
        teamStr.c_str(), resourceId, savedVar, increase, amount, required);
}

uint32 GetSharedSavedVar(uint32 item, TeamId team)
{
    uint32 var = 0;
    if (team > 1)
    {
        sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Invalid team specified for shared War Effort stock, %u", team);
        return 0;
    }

    switch (team)
    {
        case TEAM_ALLIANCE:
        {
            switch (item)
            {
            case 2840:
                var = VAR_WE_ALLIANCE_COPPER;
                break;
            case 8831:
                var = VAR_WE_ALLIANCE_PURPLELOTUS;
                break;
            case 4304:
                var = VAR_WE_ALLIANCE_THICKLEATHER;
                break;
            case 6887:
                var = VAR_WE_ALLIANCE_SPOTYELLOW;
                break;
            case 14529:
                var = VAR_WE_ALLIANCE_RUNEBANDAGE;
                break;
            default:
                sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Invalid item %u for shared War Effort stock", item);
                break;
            }
            break;
        }
        case TEAM_HORDE:
        {
            switch (item)
            {
            case 2840:
                var = VAR_WE_HORDE_COPPER;
                break;
            case 8831:
                var = VAR_WE_HORDE_PURPLELOTUS;
                break;
            case 4304:
                var = VAR_WE_HORDE_THICKLEATHER;
                break;
            case 6887:
                var = VAR_WE_HORDE_SPOTYELLOW;
                break;
            case 14529:
                var = VAR_WE_HORDE_RUNEBANDAGE;
                break;
            default:
                sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Invalid item %u for shared War Effort stock", item);
                break;
            }
            break;
        }
        default:
            break;
    }

    return var;
}

uint32 GetTeamStock(uint32 item, TeamId team)
{
    return sObjectMgr.GetSavedVariable(GetSharedSavedVar(item, team), 0);
}

uint32 GetWarEffortGossipTextId(uint32 item, TeamId team, bool objectiveReached)
{
    WarEffortGossip gossip = GetWarEffortGossip(item);

    uint32 gossipTextId = 0;
    switch (team)
    {
        case TEAM_ALLIANCE:
        {
            if (objectiveReached)
                gossipTextId = gossip.completeTextAlliance;
            else
                gossipTextId = gossip.progressTextAlliance;
            break;
        }
        case TEAM_HORDE:
        {
            if (objectiveReached)
                gossipTextId = gossip.completeTextHorde;
            else
                gossipTextId = gossip.progressTextHorde;
            break;
        }
        default:
            break;
    }

    // Gossip def is missing (0)
    if (!gossipTextId)
        gossipTextId = 2;

    return gossipTextId;
}

const WarEffortGossip& GetWarEffortGossip(uint32 item)
{
    for (const auto& i : WarEffortGossipText)
    {
        if (item == i.itemId)
            return i;
    }

    sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Cannot find war effort gossip text for the given item %u", item);

    return WarEffortGossipText[0];
}

WarEffortGameEvents GetActiveTransportEvent()
{
    static WarEffortGameEvents transportEvents[5] = {
        EVENT_WAR_EFFORT_TRANSITION_DAY1,
        EVENT_WAR_EFFORT_TRANSITION_DAY2,
        EVENT_WAR_EFFORT_TRANSITION_DAY3,
        EVENT_WAR_EFFORT_TRANSITION_DAY4,
        EVENT_WAR_EFFORT_TRANSITION_DAY5
    };

    // Return highest most active event
    for (int i = 4; i >= 0; --i)
    {
        if (sGameEventMgr.IsActiveEvent(transportEvents[i]))
            return transportEvents[i];
    }

    return EVENT_WAR_EFFORT_TERMINATOR;
}

/*###
## npc_AQwar_collector
###*/

// UPDATE `creature_template` SET `script_name` = 'npc_AQwar_collector' WHERE `subname` like '%collector%' and subname not like '%ancestry%';

struct npc_AQwar_collectorAI : CreatureAI
{
    uint32 resourceItemId;
    WarEffortItemType resourceType;
    TeamId team;
    uint32 m_updateTimer;

    npc_AQwar_collectorAI(Creature *creature) : CreatureAI(creature)
    {
        resourceType = WAREFFORT_BAR;

        switch (creature->GetFactionTemplateId())
        {
            case 12:
            case 55:
            case 80:
            case 875:
                team = TEAM_ALLIANCE;
                break;
            default:
                team = TEAM_HORDE;
                break;
        }

        // Initializes resource ID/type too, must have team set first
        if (ObjectiveReached())
            RemoveQuestGiverFlag();

        m_updateTimer = 0; // every minute update this npc's resource, do first update instantly though
    }

    void UpdateAI(uint32 const diff) override
    {
        // Update the war effort stock gobjects
        if (m_updateTimer <= diff)
            m_updateTimer = 0;
        else
            m_updateTimer -= diff;

        if (m_updateTimer)
            return;

        switch (resourceType)
        {
            case WAREFFORT_BAR:
                HandleWarEffortGameObject(GOBars, WAREFFORT_BAR);
                break;
            case WAREFFORT_HERBS:
                HandleWarEffortGameObject(GOHerbs, WAREFFORT_HERBS);
                break;
            case WAREFFORT_SKINS:
                HandleWarEffortGameObject(GOSkins, WAREFFORT_SKINS);
                break;
            case WAREFFORT_COOKING:
                HandleWarEffortGameObject(GOCooking, WAREFFORT_COOKING);
                break;
            case WAREFFORT_BANDAGES:
                HandleWarEffortGameObject(GOBandages, WAREFFORT_BANDAGES);
                break;
        }

        if (ObjectiveReached())
            RemoveQuestGiverFlag();

        m_updateTimer = 60000;
    }

    void HandleWarEffortGameObject(GOWarEffort const* gameobjects, WarEffortItemType type)
    {
        uint32 objective = 0;
        uint32 current = 0;
        // Showing gameobjects. If we're gathering, we're showing the highest tier.
        // If the effort is complete, and we're moving, slowly decrease the tier
        // shown
        if (GatheringSupplies())
        {
            // Counting
            for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
            {
                if (SharedObjectives[i].type == type)
                {
                    objective += SharedObjectives[i].required;
                    current += GetTeamStock(SharedObjectives[i].itemId, team);
                }
            }

            for (int i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
            {
                if (team == TEAM_HORDE && HordeObjectives[i].type == type)
                {
                    objective += HordeObjectives[i].required;
                    current += sObjectMgr.GetSavedVariable(HordeObjectives[i].currentVar, 0);
                }
                else if (team == TEAM_ALLIANCE && AllianceObjectives[i].type == type)
                {
                    objective += AllianceObjectives[i].required;
                    current += sObjectMgr.GetSavedVariable(AllianceObjectives[i].currentVar, 0);
                }
            }

            uint32 tempCount = objective;
            for (int j = 9; j >= 0; j--)
            {
                if (gameobjects[j].faction != team)
                    continue;

                HandleSupplyObjectSpawn(gameobjects[j].GOEntry, current >= tempCount);

                tempCount -= objective / 5;
            }
        }
        else
        {
            int tier = 5;
            switch (GetActiveTransportEvent())
            {
                // no break, they can all be active at once but we want
                // the most recent to take precedence
                case EVENT_WAR_EFFORT_TRANSITION_DAY1:
                    tier = 5;
                    break;
                case EVENT_WAR_EFFORT_TRANSITION_DAY2:
                    tier = 4;
                    break;
                case EVENT_WAR_EFFORT_TRANSITION_DAY3:
                    tier = 3;
                    break;
                case EVENT_WAR_EFFORT_TRANSITION_DAY4:
                    tier = 2;
                    break;
                case EVENT_WAR_EFFORT_TRANSITION_DAY5:
                default:
                    tier = 1;
                    break;
            }

            for (int j = 9; j >= 0; j--)
            {
                if (gameobjects[j].faction != team)
                    continue;

                // Spawn <= tier, despawn > tier
                bool spawn = tier >= gameobjects[j].tier;

                HandleSupplyObjectSpawn(gameobjects[j].GOEntry, spawn);
            }
        }
    }

    void HandleSupplyObjectSpawn(uint32 entry, bool spawn)
    {
        if (GameObject* go = m_creature->FindNearestGameObject(entry, 50.0f))
        {
            if (spawn && !go->isSpawned())
            {
                go->SetRespawnTime(1209600); // 14 days
                go->SaveToDB();
            }
            else if (!spawn && go->isSpawned())
            {
                go->Despawn();
                go->SaveToDB();
            }
        }
    }

    bool ObjectiveReached(Quest const *pQuest)
    {
        bool found = false;
        resourceItemId = pQuest->ReqItemId[0];

        bool objectiveReached = false;

        for (uint8 i = 0; i < NUM_SHARED_OBJECTIVES && !objectiveReached; ++i)
        {
            if (resourceItemId == SharedObjectives[i].itemId)
            {
                found = true;
                uint32 stock = GetTeamStock(resourceItemId, team);
                uint32 objective = SharedObjectives[i].required;
                resourceType = SharedObjectives[i].type;

                if (stock >= objective)
                    objectiveReached = true;

                break;
            }
        }

        for (uint8 i = 0; i < NUM_FACTION_OBJECTIVES && !objectiveReached; ++i)
        {
            if (resourceItemId == AllianceObjectives[i].itemId)
            {
                found = true;
                uint32 stock = sObjectMgr.GetSavedVariable(AllianceObjectives[i].currentVar, 0);
                uint32 objective = AllianceObjectives[i].required;
                resourceType = AllianceObjectives[i].type;

                if (stock >= objective)
                    objectiveReached = true;

                break;
            }
            else if (resourceItemId == HordeObjectives[i].itemId)
            {
                found = true;
                uint32 stock = sObjectMgr.GetSavedVariable(HordeObjectives[i].currentVar, 0);
                uint32 objective = HordeObjectives[i].required;
                resourceType = HordeObjectives[i].type;

                if (stock >= objective)
                    objectiveReached = true;

                break;
            }
        }

        if (!found)
            sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "npc_AQwar_collectorAI: Unit %s has collector AI but no defined resource", m_creature->GetGuidStr().c_str());

        return objectiveReached;
    }


    bool ObjectiveReached()
    {
        QuestRelationsMapBounds bounds = sObjectMgr.GetCreatureQuestRelationsMapBounds(m_creature->GetEntry());
        for (QuestRelationsMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            uint32 quest_id = itr->second;
            if (!quest_id)
                continue;
            Quest const *pQuest = sObjectMgr.GetQuestTemplate(quest_id);
            if (!pQuest)
                continue;

            if (ObjectiveReached(pQuest))
                return true;
        }

        return false;
    }

    void RemoveQuestGiverFlag()
    {
        if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    bool GatheringSupplies()
    {
        return GetActiveTransportEvent() == EVENT_WAR_EFFORT_TERMINATOR;
    }

    void SendWorldStateUpdateToPlayer(Player* pPlayer)
    {
        for (uint8 i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
        {
            if (resourceItemId == SharedObjectives[i].itemId)
            {
                uint32 stock = GetTeamStock(resourceItemId, team);
                pPlayer->SendUpdateWorldState(team == TEAM_ALLIANCE ? SharedObjectives[i].wsAllianceCurrent : SharedObjectives[i].wsHordeCurrent, stock);
                break;
            }
        }

        for (uint8 i = 0; i < NUM_FACTION_OBJECTIVES; ++i)
        {
            if (resourceItemId == AllianceObjectives[i].itemId)
            {
                uint32 stock = sObjectMgr.GetSavedVariable(AllianceObjectives[i].currentVar, 0);
                pPlayer->SendUpdateWorldState(AllianceObjectives[i].wsCurrent, stock);
                break;
            }
            else if (resourceItemId == HordeObjectives[i].itemId)
            {
                uint32 stock = sObjectMgr.GetSavedVariable(HordeObjectives[i].currentVar, 0);
                pPlayer->SendUpdateWorldState(HordeObjectives[i].wsCurrent, stock);
                break;
            }
        }
    }
};

bool GossipHello_npc_AQwar_collector(Player* pPlayer, Creature* pCreature)
{
    bool objectiveReached = false;
    uint32 questItemId = 0;

    if (npc_AQwar_collectorAI* collectorAI = dynamic_cast<npc_AQwar_collectorAI*>(pCreature->AI()))
    {
        objectiveReached = collectorAI->ObjectiveReached();
        if (objectiveReached)
            collectorAI->RemoveQuestGiverFlag();
        else
            collectorAI->SendWorldStateUpdateToPlayer(pPlayer);

        questItemId = collectorAI->resourceItemId;
    }

    uint32 gossipTextId = GetWarEffortGossipTextId(questItemId, pPlayer->GetTeamId(), objectiveReached);

    if (objectiveReached)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        pPlayer->SEND_GOSSIP_MENU(gossipTextId, pCreature->GetObjectGuid());

        pCreature->HandleEmote(EMOTE_ONESHOT_BOW);
    }
    else if (pCreature->IsQuestGiver())
    {
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
        pPlayer->SEND_GOSSIP_MENU(gossipTextId, pCreature->GetObjectGuid());
    }
    return true;
}

bool QuestComplete_npc_AQwar_collector(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (!pQuest->ReqItemId[0] || !pQuest->ReqItemCount[0])
        return false;

    uint32 reqItemId = pQuest->ReqItemId[0];
    uint32 savedVar = reqItemId;

    bool objectiveReached = false;
    bool shared = false;

    for (int i = 0; i < NUM_SHARED_OBJECTIVES; ++i)
    {
        if (reqItemId == SharedObjectives[i].itemId)
        {
            savedVar = GetSharedSavedVar(reqItemId, pPlayer->GetTeamId());
            shared = true;
            break;
        }
    }

    uint32 stock = sObjectMgr.GetSavedVariable(savedVar, 0);
    stock += pQuest->ReqItemCount[0];
    sObjectMgr.SetSavedVariable(savedVar, stock, true);

    if (npc_AQwar_collectorAI* collectorAI = dynamic_cast<npc_AQwar_collectorAI*>(pQuestGiver->AI()))
    {
        objectiveReached = collectorAI->ObjectiveReached(pQuest);
        if (objectiveReached)
            collectorAI->RemoveQuestGiverFlag();
    }

    if (objectiveReached)
    {
        pQuestGiver->HandleEmote(EMOTE_ONESHOT_CHEER);
    }
    return true;
}

bool GetWarEffortStockInfo(uint32 resourceId, WarEffortStockInfo &info, TeamId team)
{
    bool found = false;
    for (int i = 0; i < NUM_SHARED_OBJECTIVES && !found; ++i)
    {
        if (SharedObjectives[i].itemId == resourceId)
        {
            found = true;
            info.count = GetTeamStock(resourceId, team);
            info.required = SharedObjectives[i].required;
            info.proto = sObjectMgr.GetItemPrototype(resourceId);
            info.currentVar = GetSharedSavedVar(resourceId, team);
        }
    }

    for (int i = 0; i < NUM_FACTION_OBJECTIVES && !found; ++i)
    {
        if (AllianceObjectives[i].itemId == resourceId)
        {
            found = true;
            info.count = sObjectMgr.GetSavedVariable(AllianceObjectives[i].currentVar, 0);
            info.required = AllianceObjectives[i].required;
            info.proto = sObjectMgr.GetItemPrototype(resourceId);
            info.currentVar = resourceId;
        }
        else if (HordeObjectives[i].itemId == resourceId)
        {
            found = true;
            info.count = sObjectMgr.GetSavedVariable(HordeObjectives[i].currentVar, 0);
            info.required = HordeObjectives[i].required;
            info.proto = sObjectMgr.GetItemPrototype(resourceId);
            info.currentVar = resourceId;
        }
    }

    return found;
}

CreatureAI *GetAI_npc_AQwar_collector(Creature *pCreature)
{
    return new npc_AQwar_collectorAI(pCreature);
}

/*#####
## npc_resonating_Crystal
######*/

// UPDATE `creature_template` SET `script_name` = 'npc_resonating_Crystal' WHERE `entry` = 15769;

enum
{
    GO_RESONATING_CRYSTAL_FORMATION = 180810,

    MAX_SIGHT_DISTANCE = 55,

    // C'Thun's Mind Control has varying strengths based on location
    WHISPERINGS_OF_CTHUN_0 = 26259, // (10-21) Barrens
    WHISPERINGS_OF_CTHUN_1 = 26258, // (21-41) 1K Needles
    WHISPERINGS_OF_CTHUN_2 = 26195, // (30-41) Desolace?
    WHISPERINGS_OF_CTHUN_3 = 26197, // (41-51) Feralas/Tanaris/Un'Goro
    WHISPERINGS_OF_CTHUN_4 = 26198, // (51-71) Silithus

    ZONE_BARRENS = 17,
    ZONE_THOUSAND_NEEDLES = 400,
    ZONE_DESOLACE = 405,
    ZONE_FERALAS = 357,
    ZONE_TANARIS = 440,
    ZONE_UN_GORO = 490,
    ZONE_SILITHUS = 1377,
};

struct npc_resonating_CrystalAI : public ScriptedAI
{
    npc_resonating_CrystalAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        SPELL_WHISPERINGS = GetMCSpellForZone();
    }

    bool playerDetected;
    uint32 m_uiCheckTimer;
    uint32 m_uiWisperingsTimer;
    uint32 SPELL_WHISPERINGS;

    void Reset() override
    {
        SetCombatMovement(false);
        playerDetected = false;
        m_uiCheckTimer = 2000;
        m_uiWisperingsTimer = 1000;
    }

    uint32 GetMCSpellForZone()
    {
        switch (m_creature->GetZoneId())
        {
        case ZONE_BARRENS:
            return WHISPERINGS_OF_CTHUN_0;

        case ZONE_THOUSAND_NEEDLES:
            return WHISPERINGS_OF_CTHUN_1;

        case ZONE_DESOLACE:
            return WHISPERINGS_OF_CTHUN_2;

        case ZONE_FERALAS:
        case ZONE_TANARIS:
        case ZONE_UN_GORO:
            return WHISPERINGS_OF_CTHUN_3;

        default:
            // ZONE_SILITHUS
            return WHISPERINGS_OF_CTHUN_4;
        }
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->GetTypeId() != TYPEID_PLAYER || who->ToPlayer()->IsGameMaster())
            return;

        if (!who->IsAlive())
            return;

        playerDetected = m_creature->IsWithinDistInMap(who, MAX_SIGHT_DISTANCE);
    }

    bool MoreThanOnePlayerNear()
    {
        Map::PlayerList const& players = m_creature->GetMap()->GetPlayers();
        int var = 0;
        for (const auto& itr : players)
        {
            Player* pPlayer = itr.getSource();
            if (pPlayer && pPlayer->IsAlive() && m_creature->IsWithinDistInMap(pPlayer, MAX_SIGHT_DISTANCE) && !pPlayer->IsGameMaster())
                ++var;

            if (var > 1)
                return true;
        }
        return false;
    }

    void AggroAllPlayerNear()
    {
        Map::PlayerList const& players = m_creature->GetMap()->GetPlayers();
        for (const auto& itr : players)
        {
            Player* pPlayer = itr.getSource();
            if (pPlayer && pPlayer->IsAlive() && m_creature->IsWithinDistInMap(pPlayer, MAX_SIGHT_DISTANCE) && !pPlayer->IsGameMaster())
            {
                m_creature->AddThreat(pPlayer);
                m_creature->SetInCombatWith(pPlayer);
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (playerDetected)
        {
            if (m_uiCheckTimer < uiDiff)
            {
                if (MoreThanOnePlayerNear())
                    AggroAllPlayerNear();
                else
                    EnterEvadeMode();
                m_uiCheckTimer = 2000;
            }
            else
                m_uiCheckTimer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        // Whisperings of C'Thun (MC)
        if (MoreThanOnePlayerNear())
        {
            if (m_uiWisperingsTimer < uiDiff || (m_creature->GetCharm() && m_creature->GetCharm()->IsPolymorphed()))
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    if (DoCastSpellIfCan(pTarget, SPELL_WHISPERINGS, CF_AURA_NOT_PRESENT) == CAST_OK)
                        m_uiWisperingsTimer = 20000;
            }
            else
                m_uiWisperingsTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_resonating_Crystal(Creature* pCreature)
{
    return new npc_resonating_CrystalAI(pCreature);
}

const static G3D::Vector3 ironforgeInfantryOrigin = { -6969.21f, 962.33f, 11.88f };
//const static G3D::Vector3 orgrimmarInfantryOrigin = { -6978.96f, 940.72f, 12.65f }; // Units kinda mashed together. Looks cool, but a bit messy
const static G3D::Vector3 orgrimmarInfantryOrigin = { -6975.30f, 940.14f, 13.14f };
const static G3D::Vector3 saurfangWaveIncomingPosition = { -6985.67f, 956.06f, 10.21f };

enum
{
    NPC_SAURFANG = 14720
};

struct npc_infantrymanAI : ScriptedAI
{
    bool m_movedIntoPosition;
    bool m_clockwiseRotation;
    G3D::Vector3 m_origin;
    uint32 m_ReadyEmoteState;

    float m_saurfangFollowDist;
    float m_saurfangFollowAngle;
    bool m_followingSaurfang;
    ObjectGuid saurfangGuid;


    npc_infantrymanAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_movedIntoPosition = false;
        m_clockwiseRotation = true;
        m_ReadyEmoteState = 0;
        m_followingSaurfang = false;

        m_saurfangFollowAngle = 0.0f;
        m_saurfangFollowDist = 0.0f;
    }

    void MoveInLineOfSight(Unit *pWho) override
    {
        if (m_creature->CanInitiateAttack() && pWho->IsTargetableBy(m_creature) && m_creature->IsHostileTo(pWho))
        {
            if (pWho->IsInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            {
                if (!m_creature->GetVictim())
                    AttackStart(pWho);
            }
        }
    }

    void Reset() override
    {

    }

    void JustDied(Unit *pKiller) override
    {
        if (m_followingSaurfang)
        {
            SetRespawnNearSaurfang();
        }

        ScriptedAI::JustDied(pKiller);
    }

    // Override to prevent move targeted home call
    void EnterEvadeMode() override
    {
        m_creature->RemoveAurasAtReset();
        m_creature->DeleteThreatList();
        m_creature->CombatStop(true);
        m_creature->LoadCreatureAddon(true);

        if (m_creature->IsAlive())
        {
            if (m_followingSaurfang)
                FollowSaurfang();
            else
                m_creature->GetMotionMaster()->MoveTargetedHome();
        }

        m_creature->SetLootRecipient(nullptr);

        Reset();
    }

    void UpdateAI(uint32 const diff) override
    {
        // Once the event is activated, we want to set the home position of the unit
        // and make them move there.
        if (!m_movedIntoPosition && sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT_CH_ATTACK))
        {
            MoveToWaveBattlePosition();
            m_movedIntoPosition = true;
        }

        if (!m_followingSaurfang && sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT_FINALBATTLE))
        {
            // Sets the home position that we use to calculate for the follow pos
            // Just in case we restart and are in this state
            if (!m_movedIntoPosition)
            {
                MoveToWaveBattlePosition();
                m_movedIntoPosition = true;
            }

            FollowSaurfang();
            m_followingSaurfang = true;
        }

        ScriptedAI::UpdateAI(diff);
    }

    void CalculateRotatedPositionAboutLeader(G3D::Vector3 &vec, bool clockwise = true)
    {
        Vector3 currPos;
        float orientation = 0;
        m_creature->GetHomePosition(currPos.x, currPos.y, currPos.z, orientation);

        G3D::Vector3 relative;
        relative = currPos - m_origin;

        G3D::Vector3 rotated;

        rotated.x = clockwise ? relative.y : -relative.y;
        rotated.y = clockwise ? -relative.x : relative.x;
        rotated.z = rotated.z;

        vec = m_origin + rotated;
    }

    virtual void MoveToWaveBattlePosition()
    {
        // Position determined by a simple rotation matrix, rotating based on spawn
        // position
        G3D::Vector3 newPos;
        CalculateRotatedPositionAboutLeader(newPos, m_clockwiseRotation);

        // Get the real Z at the position
        float height = m_creature->GetMap()->GetHeight(newPos.x, newPos.y, newPos.z);
        newPos.z = height;

        // New rotation is curr rotation - 90 deg
        double orientation = m_creature->GetHomePositionO() + (m_clockwiseRotation ? -1 : 1) * M_PI / 2;

        m_creature->SetHomePosition(newPos.x, newPos.y, newPos.z, orientation);
        if (m_creature->IsAlive())
            m_creature->GetMotionMaster()->MoveTargetedHome();
    }

    virtual void FollowSaurfang()
    {
        Creature *saurfang = nullptr;
        if (saurfangGuid)
            saurfang = m_creature->GetMap()->GetCreature(saurfangGuid);
        else
            saurfang = GetClosestCreatureWithEntry(m_creature, NPC_SAURFANG, 400.0f);

        if (saurfang)
        {
            saurfangGuid = saurfang->GetObjectGuid();

            // Calculate the distance & angle to follow at. Based on the home pos of each unit
            if (!m_saurfangFollowAngle || !m_saurfangFollowDist)
            {
                G3D::Vector3 thisHome;
                G3D::Vector3 saurfangHome = saurfangWaveIncomingPosition;
                float homeOrientation;

                m_creature->GetHomePosition(thisHome.x, thisHome.y, thisHome.z, homeOrientation);

                G3D::Vector3 diff = thisHome - saurfangHome;
                G3D::Vector2 diffXY{ diff.x, diff.y };
                float dist = diffXY.length();
                float angle = asin(diffXY.x / dist) + M_PI_F; // Add PI because we want to be behind Saurfang

                m_saurfangFollowDist = dist;
                m_saurfangFollowAngle = angle;
            }
            m_creature->GetMotionMaster()->MoveFollow(saurfang, m_saurfangFollowDist, m_saurfangFollowAngle);
        }
    }

    virtual void SetRespawnNearSaurfang()
    {
        Creature *saurfang = nullptr;
        if (saurfangGuid)
            saurfang = m_creature->GetMap()->GetCreature(saurfangGuid);
        else
            saurfang = GetClosestCreatureWithEntry(m_creature, NPC_SAURFANG, 400.0f);

        if (saurfang)
        {
            saurfangGuid = saurfang->GetObjectGuid();

            // Calculate the position to home at
            G3D::Vector3 thisHome;
            G3D::Vector3 saurfangHome;
            float saurfangO = 0.0f;
            saurfang->GetHomePosition(saurfangHome.x, saurfangHome.y, saurfangHome.z, saurfangO);

            // Calculate home pos based on pre-calculated angle and dist (from following)
            if (m_saurfangFollowAngle && m_saurfangFollowDist)
            {
                thisHome.x = m_saurfangFollowDist * sin(m_saurfangFollowAngle);
                thisHome.y = m_saurfangFollowDist * cos(m_saurfangFollowAngle);
            }
            else
            {
                // Pick a random point near Saurfang
                saurfang->GetNearPoint2D(thisHome.x, thisHome.y, 30, 2*M_PI_F);
            }

            thisHome.z = m_creature->GetMap()->GetHeight(thisHome.x, thisHome.y, saurfangHome.z);

            m_creature->SetHomePosition(thisHome.x, thisHome.y, thisHome.z, saurfangO);
        }
    }

    void JustReachedHome() override
    {
        m_creature->HandleEmoteState(m_ReadyEmoteState); // play anim, ready for that wave!

        ScriptedAI::JustReachedHome();
    }

    void JustRespawned() override
    {
        m_followingSaurfang = false; // reset follow state
    }

};


struct npc_ironforge_infantryAI : npc_infantrymanAI
{
    npc_ironforge_infantryAI(Creature *pCreature) : npc_infantrymanAI(pCreature)
    {
        m_origin = ironforgeInfantryOrigin;
        m_ReadyEmoteState = EMOTE_STATE_READY1H;
    }
};

CreatureAI *GetAI_npc_ironforge_infantry(Creature *pCreature)
{
    return new npc_ironforge_infantryAI(pCreature);
}

struct npc_orgrimmar_infantryAI : npc_infantrymanAI
{
    npc_orgrimmar_infantryAI(Creature *pCreature) : npc_infantrymanAI(pCreature)
    {
        m_origin = orgrimmarInfantryOrigin;
        m_clockwiseRotation = false;
        m_ReadyEmoteState = EMOTE_STATE_READY2H;
    }
};

CreatureAI *GetAI_npc_orgrimmar_infantry(Creature *pCreature)
{
    return new npc_orgrimmar_infantryAI(pCreature);
}

struct npc_orgrimmar_riflemanAI : npc_orgrimmar_infantryAI
{
    npc_orgrimmar_riflemanAI(Creature *pCreature) : npc_orgrimmar_infantryAI(pCreature)
    {
        m_origin = orgrimmarInfantryOrigin;
        m_clockwiseRotation = false;
        m_ReadyEmoteState = EMOTE_STATE_READYRIFLE;
    }
};

CreatureAI *GetAI_npc_orgrimmar_rifleman(Creature *pCreature)
{
    return new npc_orgrimmar_riflemanAI(pCreature);
}

const static G3D::Vector3 priestessOrigin = { -6952.21f, 955.01f, 15.83f };
const static G3D::Vector3 priestessEnd = { -6968.14f, 926.90f, 11.83f };

// Nasty way to increment the index for each successive priestess spawn
static uint8 priestessIndex = 0;

struct npc_priestessAI : npc_infantrymanAI
{
    bool m_movedIntoPosition;
    G3D::Vector3 alignVector;
    uint8 index;
    npc_priestessAI(Creature *pCreature) : npc_infantrymanAI(pCreature)
    {
        alignVector = priestessEnd - priestessOrigin;
        index = ++priestessIndex;
        m_ReadyEmoteState = EMOTE_STATE_AT_EASE;

        // Mount aura 16056, model 9953
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->Unmount();
        npc_infantrymanAI::Aggro(pWho);
    }

    void Reset() override
    {
        if (m_followingSaurfang)
            m_creature->Mount(9695);

        npc_infantrymanAI::Reset();
    }

    void MoveToWaveBattlePosition() override
    {
        // 10 priestess, spread over 10 different positions
        //uint32 index = m_creature->GetGUIDLow() % 10;

        G3D::Vector3 position = priestessOrigin + alignVector / 10 * index;

        float height = m_creature->GetMap()->GetHeight(position.x, position.y, position.z);
        position.z = height;

        m_creature->SetHomePosition(position.x, position.y, position.z, 2.62f);
        if (m_creature->IsAlive())
            m_creature->GetMotionMaster()->MoveTargetedHome();
    }

    void FollowSaurfang() override
    {
        m_creature->Mount(9695);
        npc_infantrymanAI::FollowSaurfang();
    }

};

CreatureAI *GetAI_npc_priestess(Creature *pCreature)
{
    return new npc_priestessAI(pCreature);
}

enum {
    NPC_COLOSSAL_ANUBISATH = 15743,
    NPC_QIRAJI_DESTROYER = 15744
};

struct npc_aqwar_cenarionhold_attackAI : ScriptedAI
{
    uint32 m_timeUntilWave;
    uint32 m_waveCount;
    uint32 m_maxWaveCount;
    G3D::Vector3 targetPos = { -6959.35f, 940.41f, 14.55f };
    npc_aqwar_cenarionhold_attackAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_timeUntilWave = 60000;

        // Note that this is totally made-up. I cannot find any evidence
        // regarding the number of waves, other than a video stating 'wave
        // after wave attacked...' and an account of the event
        // http://www.lurkerlounge.com/forums/printthread.php?tid=4804
        // https://www.youtube.com/watch?v=E0kDqUlgM5c
        m_maxWaveCount = 12; // Waves for 3h, 1h break before final battle
        m_waveCount = 1;
    }

    void Reset() override
    {

    }

    void UpdateAI(uint32 const diff) override
    {
        if (m_waveCount == m_maxWaveCount)
            return;

        if (m_timeUntilWave <= diff)
        {
            // Many mobs per wave. 80% chance to be a Colossal Anubisath, 20% chance to be a Qiraji Destroyer
            // https://www.youtube.com/watch?v=F-FeUv7HSzI @ 7:11
            for (int i = 0; i < 8; ++i)
            {
                uint32 entry = urand(0, 5) ? NPC_COLOSSAL_ANUBISATH : NPC_QIRAJI_DESTROYER;

                G3D::Vector3 summPos;
                m_creature->GetPosition(summPos.x, summPos.y, summPos.z);

                summPos.x += irand(-15, 15);
                summPos.y += irand(-15, 15);
                summPos.z = m_creature->GetMap()->GetHeight(summPos.x, summPos.y, summPos.z);

                if (Creature *summon = m_creature->SummonCreature(entry, summPos.x, summPos.y, summPos.z, 6, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 4 * MINUTE * IN_MILLISECONDS, 1))
                {
                    summon->SetHomePosition(targetPos.x, targetPos.y, targetPos.z, 3.0f);
                    summon->GetMotionMaster()->MovePoint(1, targetPos.x, targetPos.y, targetPos.z);
                }
            }

            m_timeUntilWave = 15 * MINUTE * IN_MILLISECONDS;
            ++m_waveCount;
        }
        else
            m_timeUntilWave -= diff;
    }
};

CreatureAI* GetAI_npc_aqwar_cenarionhold_attack(Creature *pCreature)
{
    return new npc_aqwar_cenarionhold_attackAI(pCreature);
}

enum
{
    SCRIPT_SAURFANG_CH_ATTACK_WARN  = -1780300,
    SCRIPT_SAURFANG_SPEECH1         = -1780301,
    SCRIPT_SAURFANG_SPEECH2         = -1780302,
    SCRIPT_SAURFANG_SPEECH3         = -1780303,
    SCRIPT_SAURFANG_SPEECH4         = -1780304,
    SCRIPT_SAURFANG_SPEECH5         = -1780305,
    SCRIPT_SAURFANG_SPEECH6         = -1780306,
    SCRIPT_SAURFANG_SPEECH7         = -1780307,
    SCRIPT_SAURFANG_SPEECH8         = -1780308,
    SCRIPT_SAURFANG_SPEECH9         = -1780309,
    SCRIPT_SAURFANG_SPEECH10        = -1780310,
    SCRIPT_SAURFANG_FINAL_BATTLE    = -1780311,

    WORLD_TEXT_FINAL_BATTLE         = -1780311,     // The final battle for Kalimdor is upon us...

    // Taken from Orgrimmar script
    SPELL_SF_EXECUTE                = 7160,  //OK
    SPELL_SF_CLEAVE                 = 15284, //OK
    SPELL_SF_CHARGE                 = 22886, //OK
    SPELL_SF_THUNDERCLAP            = 23931, //?
    SPELL_SF_MORTALSTRIKE           = 12294, //?
    SPELL_SF_SAURFANGRAGE           = 26339,
    SPELL_SF_BATTLESHOUT            = 26043, // shout to put him in combat with other units so he doesn't run off

    FACTION_MIGHT_OF_KALIMDOR       = 777,
};

struct MovementPath {
    float x;
    float y;
    float z;
    float o;
};

std::array<MovementPath, 12> const saurfangGatePath {{
    { -7002.48f, 967.38f, 6.70f, 3.15f },
    { -7205.49f, 967.08f, 0.95f, 2.9f },
    { -7265.48f, 995.34f, 2.55f, 3.16f },
    { -7418.73f, 1000.99f, 0.91f, 2.91f },
    { -7661.01f, 1052.23f, 4.82f, 2.32f },
    { -7759.05f, 1164.64f, 0.02f, 2.22f },
    { -7810.24f, 1275.49f, -11.08f, 2.72f },
    { -7909.35f, 1319.05f, -7.79f, 2.32f },
    { -7952.77f, 1377.95f, 2.94f, 1.38f },
    { -7933.09f, 1490.65f, -6.62f, 2.68f },
    { -8014.01f, 1532.97f, 2.81f, 3.10f },
    { -8079.99f, 1523.19f, 2.61f, 3.15f }
}};

struct npc_aqwar_saurfangAI : ScriptedAI
{
    bool m_CenarionHoldAttackWarn;
    bool m_finalBattle;
    uint32 m_speechDelay;
    uint32 m_speechStep;
    bool m_inSpeech;
    bool m_movingToGate;
    uint32 m_movePoint;
    bool m_movePointReached;
    bool m_movementPaused;

    uint32 m_uiExecute_Timer;
    uint32 m_uiMortalStrike_Timer;
    uint32 m_uiThunderClap_Timer;
    uint32 m_uiCharge_Timer;
    uint32 m_uiCleave_Timer;
    uint32 m_uiSaurfangRage_Timer;
    uint32 m_uiBattleShout_Timer;

    npc_aqwar_saurfangAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_CenarionHoldAttackWarn = false;
        m_finalBattle = false;
        m_speechDelay = 120000; // 2 minutes on the first delay to give people time to reach CH
        m_speechStep = 0;
        m_inSpeech = false;

        m_movePoint = 0;
        m_movePointReached = true;
        m_movementPaused = false;

        m_creature->SetFactionTemplateId(FACTION_MIGHT_OF_KALIMDOR);
        Reset();
    }

    void Reset() override
    {
        if (m_movingToGate)
            m_creature->Mount(10278);

        m_uiExecute_Timer = 2000;
        m_uiMortalStrike_Timer = 13000;
        m_uiCharge_Timer = 8000;
        m_uiCleave_Timer = 9000;
        m_uiThunderClap_Timer = 9000;
        m_uiSaurfangRage_Timer = 8000;
        m_uiBattleShout_Timer = 30000;
    }


    void Aggro(Unit* pWho) override
    {
        m_creature->Unmount();
        ScriptedAI::Aggro(pWho);
        m_movementPaused = true;
    }

    void MoveInLineOfSight(Unit *pWho) override
    {
        if (m_creature->CanInitiateAttack() && pWho->IsTargetableBy(m_creature) && m_creature->IsHostileTo(pWho))
        {
            if (pWho->IsInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            {
                if (!m_creature->GetVictim())
                    AttackStart(pWho);
            }
        }
    }

    void MovementInform(uint32 uiType, uint32 uiPoint) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        if (m_movingToGate)
        {
            m_creature->SetFacingTo(saurfangGatePath[uiPoint].o);
            m_movePointReached = true;
        }

        if (m_movePoint == saurfangGatePath.size())
        {
            m_movingToGate = false;
            m_creature->Unmount();
            m_creature->SetHomePosition(saurfangGatePath[m_movePoint-1].x, saurfangGatePath[m_movePoint-1].y, saurfangGatePath[m_movePoint-1].z, 2.6f);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->IsAlive())
            return;

        if (!m_CenarionHoldAttackWarn && sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT_CH_ATTACK))
        {
            DoScriptText(SCRIPT_SAURFANG_CH_ATTACK_WARN, m_creature);

            MoveToWaveBattlePosition();
            m_CenarionHoldAttackWarn = true;

            return;
        }

        if (!m_finalBattle && sGameEventMgr.IsActiveEvent(EVENT_WAR_EFFORT_FINALBATTLE))
        {
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_NPC);
            m_inSpeech = true;
            m_finalBattle = true;
            m_creature->Mount(10278);

            // Recover from crash/restart
            if (!m_CenarionHoldAttackWarn)
            {
                MoveToWaveBattlePosition();
                m_CenarionHoldAttackWarn = true;
            }
        }

        if (m_finalBattle)
        {
            if (m_inSpeech)
            {
                if (m_speechDelay <= diff)
                {
                    DoScriptText(SCRIPT_SAURFANG_SPEECH1 - m_speechStep, m_creature);
                    ++m_speechStep;
                    m_speechDelay = 10000;
                }
                else
                    m_speechDelay -= diff;

                if (m_speechStep == 10)
                {
                    sWorld.SendWorldText(WORLD_TEXT_FINAL_BATTLE);
                    m_inSpeech = false;
                    m_movingToGate = true;
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_IMMUNE_TO_NPC);
                    m_creature->SetWalk(false);
                }
            }
            else if (m_movingToGate && m_movePointReached && !m_movementPaused)
            {
                m_creature->GetMotionMaster()->MovePoint(m_movePoint, saurfangGatePath[m_movePoint].x, saurfangGatePath[m_movePoint].y, saurfangGatePath[m_movePoint].z, MOVE_RUN_MODE);
                m_creature->SetHomePosition(saurfangGatePath[m_movePoint].x, saurfangGatePath[m_movePoint].y, saurfangGatePath[m_movePoint].z, saurfangGatePath[m_movePoint].o);
                ++m_movePoint;

                m_movePointReached = false;
            }
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetVictim()->GetHealth() <= m_creature->GetVictim()->GetMaxHealth() * 0.2f)
        {
            if (m_uiExecute_Timer < diff)
            {
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_EXECUTE);
                m_uiExecute_Timer = 2000;
            }
            else
                m_uiExecute_Timer -= diff;
        }

        if (m_uiMortalStrike_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_MORTALSTRIKE);
            m_uiMortalStrike_Timer = 13000;
        }
        else
            m_uiMortalStrike_Timer -= diff;

        if (m_uiCleave_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_CLEAVE);
            m_uiCleave_Timer = 7000;
        }
        else
            m_uiCleave_Timer -= diff;

        if (m_uiCharge_Timer < diff && m_creature->GetDistance(m_creature->GetVictim()->GetPositionX(),
            m_creature->GetVictim()->GetPositionY(),
            m_creature->GetVictim()->GetPositionZ()) >= 8.0f)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_CHARGE);
            m_uiCharge_Timer = 9000;
        }
        else
            m_uiCharge_Timer -= diff;

        if (m_uiThunderClap_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_THUNDERCLAP);
            m_uiThunderClap_Timer = 9000;
        }
        else
            m_uiThunderClap_Timer -= diff;

        if (m_uiSaurfangRage_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SF_SAURFANGRAGE);
            m_uiSaurfangRage_Timer = 8000;
        }
        else
            m_uiSaurfangRage_Timer -= diff;

        if (m_uiBattleShout_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_SF_BATTLESHOUT);
            m_uiBattleShout_Timer = 30000;
        }
        else
            m_uiBattleShout_Timer -= diff;

        DoMeleeAttackIfReady();
    }

    void JustRespawned() override
    {
        // Respawned back at CH. Keep running to the gate
        if (m_movingToGate)
        {
            m_movePoint = 0;
            m_movePointReached = true;
            m_movementPaused = false;
        }

        ScriptedAI::JustRespawned();
    }

    void MoveToWaveBattlePosition()
    {
        m_creature->SetHomePosition(saurfangWaveIncomingPosition.x, saurfangWaveIncomingPosition.y, saurfangWaveIncomingPosition.z, 2.6f);

        m_creature->GetMotionMaster()->MoveTargetedHome();
    }

    void JustReachedHome() override
    {
        m_movementPaused = false;
    }
};

CreatureAI* GetAI_npc_aqwar_saurfang(Creature *pCreature)
{
    if (pCreature->GetZoneId() == 1377)
        return new npc_aqwar_saurfangAI(pCreature);

    return new CreatureEventAI(pCreature);
}

void AddSC_war_effort()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_AQwar_collector";
    pNewScript->pGossipHello = &GossipHello_npc_AQwar_collector;
    pNewScript->pQuestRewardedNPC = &QuestComplete_npc_AQwar_collector;
    pNewScript->GetAI = &GetAI_npc_AQwar_collector;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_resonating_Crystal";
    pNewScript->GetAI = &GetAI_npc_resonating_Crystal;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_ironforge_infantry";
    pNewScript->GetAI = &GetAI_npc_ironforge_infantry;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_orgrimmar_infantry";
    pNewScript->GetAI = &GetAI_npc_orgrimmar_infantry;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_orgrimmar_rifleman";
    pNewScript->GetAI = &GetAI_npc_orgrimmar_rifleman;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_priestess";
    pNewScript->GetAI = &GetAI_npc_priestess;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_aqwar_ch_attack";
    pNewScript->GetAI = &GetAI_npc_aqwar_cenarionhold_attack;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_aqwar_saurfang";
    pNewScript->GetAI = &GetAI_npc_aqwar_saurfang;
    pNewScript->RegisterSelf();
}
