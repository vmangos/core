/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
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

/* ScriptData
SDName: instance_sunken_temple
SD%Complete: 90
SDComment: Hakkar Summon Event needs more sources to improve
SDCategory: Sunken Temple
EndScriptData */

#include "scriptPCH.h"
#include "sunken_temple.h"

// This is also the needed order for activation: S, N, SW, SE, NW, NE
//static uint32 const m_aAtalaiStatueEvents[MAX_STATUES] = {EVENT_ID_STATUE_1, EVENT_ID_STATUE_2, EVENT_ID_STATUE_3, EVENT_ID_STATUE_4, EVENT_ID_STATUE_5, EVENT_ID_STATUE_6};
static uint64 const m_aAtalaiStatueEvents[6] = {GO_ATALAI_STATUE_1, GO_ATALAI_STATUE_2, GO_ATALAI_STATUE_3, GO_ATALAI_STATUE_4, GO_ATALAI_STATUE_5, GO_ATALAI_STATUE_6};

struct SummonLocations
{
    float m_fX, m_fY, m_fZ, m_fO;
};

struct instance_sunken_temple : public ScriptedInstance
{
    instance_sunken_temple(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    uint32 m_auiEncounter[SUNKENTEMPLE_MAX_ENCOUNTER];
    std::string strInstData;

    uint64 m_luiProtectorGUIDs[6];                      // Jammalan door handling
    uint8 m_uiStatueCounter;                            // Atalarion Statue Event
    uint8 m_uiCurrentStatueVar;
    uint8 m_uiFlameCounter;                             // Avatar of Hakkar Event
    uint32 m_uiAltarTimer;
    bool m_bIsFirstHakkarWave;
    bool m_bCanSummonBloodkeeper;
    uint64 m_uiShadeHakkarGUID;
    uint64 m_uiAtalarionGUID;
    uint64 m_uiJammalanBarrierGUID;
    uint64 m_uiIdolHakkarGUID;
    uint64 m_uiShadeEranikusGUID;
    uint64 m_uiJammalanGUID;
    uint64 m_uiDreamscythGUID;
    uint64 m_uiWeaverGUID;
    uint64 m_uiAvatarHakkarGUID;
    uint64 m_uiAtalaiStatueGUID;

    uint32 RemoveTimer;

    uint64 m_luiAtalaiStatueGUIDs[6];
    uint64 m_luiBigLightGUIDs[6];

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        memset(&m_luiProtectorGUIDs, 0, sizeof(m_luiProtectorGUIDs));
        memset(&m_luiAtalaiStatueGUIDs, 0, sizeof(m_luiAtalaiStatueGUIDs));
        memset(&m_luiBigLightGUIDs, 0, sizeof(m_luiBigLightGUIDs));

        m_uiStatueCounter = 0;
        m_uiCurrentStatueVar = 0;
        m_uiAltarTimer = 0;
        m_uiFlameCounter = 0;
        m_bCanSummonBloodkeeper = false;
        m_bIsFirstHakkarWave = false;
        m_uiShadeHakkarGUID = 0;
        m_uiAtalarionGUID = 0;
        m_uiJammalanBarrierGUID = 0;
        m_uiIdolHakkarGUID = 0;
        m_uiShadeEranikusGUID = 0;
        m_uiJammalanGUID = 0;
        m_uiDreamscythGUID = 0;
        m_uiWeaverGUID = 0;
        m_uiAvatarHakkarGUID = 0;
        m_uiAtalaiStatueGUID = 0;

        RemoveTimer = 5000;
    }

    void DoSpawnAtalarionIfCan()
    {
        // Return if already summoned
        Creature* pAtalarion = instance->GetCreature(GetData64(NPC_ATALARION));
        if (!pAtalarion)
            return;

        //Player* pPlayer = GetPlayerInMap();
        //if (!pPlayer)
        //return;
        /*Map::PlayerList const& players = instance->GetPlayers();
        if (players.isEmpty())
            return;*/

        DoScriptText(SAY_ATALALARION_SPAWN, pAtalarion);
        pAtalarion->SetVisibility(VISIBILITY_ON);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);

        // Spawn the idol of Hakkar
        DoRespawnGameObject(m_uiIdolHakkarGUID, HOUR * IN_MILLISECONDS);

        // Spawn the big green lights
        //for (GUIDList::const_iterator itr = m_luiBigLightGUIDs.begin(); itr != m_luiBigLightGUIDs.end(); ++itr)
        //DoRespawnGameObject(*itr, 30*MINUTE);
        for (uint64 guid : m_luiBigLightGUIDs)
            DoRespawnGameObject(guid, HOUR * IN_MILLISECONDS);
    }

    bool ProcessStatueEvent(uint32 uiStatueEntry)
    {
        if (!uiStatueEntry)
            return false;

        bool bEventStatus = false;

        // Check if the statues are activated correctly
        // Increase the counter when the correct statue is activated
        for (uint8 i = 0; i < 6; ++i)
        {
            if (uiStatueEntry == m_aAtalaiStatueEvents[i] && m_uiStatueCounter == i)
            {
                // Right Statue activated
                ++m_uiStatueCounter;
                bEventStatus = true;
                break;
            }
        }

        if (!bEventStatus)
            return false;

        // Check if all statues are active
        if (m_uiStatueCounter == 6)
            SetData(TYPE_ATALARION, DONE);

        return true;
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        int countLight = 0;
        switch (pGo->GetEntry())
        {
            case GO_JAMMALAN_BARRIER:
                m_uiJammalanBarrierGUID = pGo->GetGUID();
                if (m_auiEncounter[1] == DONE)
                    pGo->SetGoState(GO_STATE_ACTIVE);
                break;
            case GO_IDOL_OF_HAKKAR:
                m_uiIdolHakkarGUID = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_1:
                m_luiAtalaiStatueGUIDs[0] = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_2:
                m_luiAtalaiStatueGUIDs[1] = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_3:
                m_luiAtalaiStatueGUIDs[2] = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_4:
                m_luiAtalaiStatueGUIDs[3] = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_5:
                m_luiAtalaiStatueGUIDs[4] = pGo->GetGUID();
                break;
            case GO_ATALAI_STATUE_6:
                m_luiAtalaiStatueGUIDs[5] = pGo->GetGUID();
                break;
            case GO_ATALAI_LIGHT_BIG:
                for (uint64 guid : m_luiBigLightGUIDs)
                {
                    if (guid != 0 && guid != pGo->GetGUID())
                        ++countLight;
                }
                m_luiBigLightGUIDs[countLight] = pGo->GetGUID();
                break;
            default:
                break;
        }
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_ZOLO:
                m_luiProtectorGUIDs[0] = pCreature->GetGUID();
                break;
            case NPC_GASHER:
                m_luiProtectorGUIDs[1] = pCreature->GetGUID();
                break;
            case NPC_LORO:
                m_luiProtectorGUIDs[2] = pCreature->GetGUID();
                break;
            case NPC_HUKKU:
                m_luiProtectorGUIDs[3] = pCreature->GetGUID();
                break;
            case NPC_ZULLOR:
                m_luiProtectorGUIDs[4] = pCreature->GetGUID();
                break;
            case NPC_MIJAN:
                m_luiProtectorGUIDs[5] = pCreature->GetGUID();
                break;
            case NPC_JAMMALAN:
                m_uiJammalanGUID = pCreature->GetGUID();
                break;
            case NPC_ATALARION:
                m_uiAtalarionGUID = pCreature->GetGUID();
                if (m_auiEncounter[0] != SPECIAL)
                {
                    pCreature->SetVisibility(VISIBILITY_OFF);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                }
                break;
            case NPC_SHADE_OF_ERANIKUS:
                m_uiShadeEranikusGUID = pCreature->GetGUID();
                if (m_auiEncounter[2] != DONE)      // TYPE_JAMMALAN
                {
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    pCreature->SetStandState(UNIT_STAND_STATE_SLEEP);
                }
                break;
            case NPC_DREAMSCYTH:
                m_uiDreamscythGUID = pCreature->GetGUID();
                if (m_auiEncounter[2] != DONE)      // TYPE_JAMMALAN
                {
                    pCreature->SetVisibility(VISIBILITY_OFF);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    pCreature->GetMotionMaster()->MoveIdle();
                }
                break;
            case NPC_WEAVER:
                m_uiWeaverGUID = pCreature->GetGUID();
                if (m_auiEncounter[2] != DONE)      // TYPE_JAMMALAN
                {
                    pCreature->SetVisibility(VISIBILITY_OFF);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    pCreature->GetMotionMaster()->MoveIdle();
                }
                break;
        }
    }

    void OnCreatureEnterCombat(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_DREAMSCYTH:
                DoScriptText(SAY_DREAMSCYTHE_AGGRO, pCreature);
                break;
            case NPC_ATALARION:
                if (pCreature->GetVisibility() == VISIBILITY_ON)
                    DoScriptText(SAY_ATALALARION_AGGRO, pCreature);
                else
                {
                    pCreature->AI()->EnterEvadeMode();
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                }
                break;
            case NPC_SHADE_OF_ERANIKUS:
                pCreature->SetStandState(UNIT_STAND_STATE_STAND);
                break;
        }
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        switch (uiType)
        {
            case TYPE_ATALARION:
                if (uiData == DONE)
                {
                    DoSpawnAtalarionIfCan();
                    for (uint64 guid : m_luiAtalaiStatueGUIDs)
                    {
                        if (GameObject* pGob = instance->GetGameObject(guid))
                            pGob->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                    }
                }
                else if (uiData == IN_PROGRESS)
                {
                    GameObject* pStatue = instance->GetGameObject(m_uiAtalaiStatueGUID);
                    if (!pStatue)
                        break;
                    Creature* pAtalarion = instance->GetCreature(GetData64(NPC_ATALARION));
                    if (!pAtalarion)
                        break;

                    // Send the GO entry to process
                    if (ProcessStatueEvent(pStatue->GetEntry()))
                    {
                        pStatue->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                        // Activate the green light if the correct statue is activated
                        if (GameObject* pLight = GetClosestGameObjectWithEntry(pStatue, GO_ATALAI_LIGHT, INTERACTION_DISTANCE))
                            DoRespawnGameObject(pLight->GetGUID(), HOUR * IN_MILLISECONDS);
                    }
                    else
                    {
                        Creature* pAtalarion = instance->GetCreature(GetData64(NPC_ATALARION));
                        if (!pAtalarion)
                            break;

                        // If the wrong statue was activated, then trigger trap
                        // We don't know actually which trap goes to which statue so we need to search for each
                        switch (urand(0, 2))
                        {
                            case 0:
                                if (GameObject* pTrap = GetClosestGameObjectWithEntry(pStatue, GO_ATALAI_TRAP_1, INTERACTION_DISTANCE))
                                    pTrap->Use(pAtalarion);
                                break;
                            case 1:
                                if (GameObject* pTrap = GetClosestGameObjectWithEntry(pStatue, GO_ATALAI_TRAP_2, INTERACTION_DISTANCE))
                                    pTrap->Use(pAtalarion);
                                break;
                            case 2:
                                if (GameObject* pTrap = GetClosestGameObjectWithEntry(pStatue, GO_ATALAI_TRAP_3, INTERACTION_DISTANCE))
                                    pTrap->Use(pAtalarion);
                                break;
                        }
                    }
                }
                m_auiEncounter[0] = uiData;
                break;
            case TYPE_PROTECTORS:
                m_auiEncounter[1] = uiData;
                if (uiData == DONE)
                {
                    bool bAllDead = true;
                    for (uint64 guid : m_luiProtectorGUIDs)
                    {
                        if (Creature* pProt = instance->GetCreature(guid))
                        {
                            if (pProt->IsAlive())
                            {
                                bAllDead = false;
                                break;
                            }
                        }
                    }

                    if (bAllDead)
                    {
                        if (GameObject* pGob = instance->GetGameObject(m_uiJammalanBarrierGUID))
                            if (pGob->GetGoState() != GO_STATE_ACTIVE) // Fermée
                                DoUseDoorOrButton(m_uiJammalanBarrierGUID);

                        // Intro yell
                        if (Creature* pJam = instance->GetCreature(m_uiJammalanGUID))
                            DoScriptText(SAY_JAMMALAN_INTRO, pJam);
                    }
                }
                break;
            case TYPE_JAMMALAN:
                m_auiEncounter[2] = uiData;
                if (uiData == DONE)
                {
                    if (Creature* pEranikus = instance->GetCreature(m_uiShadeEranikusGUID))
                    {
                        pEranikus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        pEranikus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                        pEranikus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    }
                    if (Creature* pDream = instance->GetCreature(m_uiDreamscythGUID))
                    {
                        pDream->SetVisibility(VISIBILITY_ON);
                        pDream->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        pDream->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                        pDream->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                        pDream->GetMotionMaster()->MoveWaypoint();
                        DoScriptText(SAY_DREAMSCYTHE_INTRO, pDream);
                    }
                    if (Creature* pWeav = instance->GetCreature(m_uiWeaverGUID))
                    {
                        pWeav->SetVisibility(VISIBILITY_ON);
                        pWeav->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                        pWeav->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                        pWeav->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                        pWeav->GetMotionMaster()->MoveWaypoint();
                    }
                }
                else if (uiData == IN_PROGRESS)
                {
                    Creature* pJam = instance->GetCreature(m_uiJammalanGUID);
                    if (!pJam)
                        break;

                    std::vector<uint32> mobsEntries;
                    std::vector<uint32>::iterator entriesIt;
                    mobsEntries.push_back(5263);    // Mummified Atal'ai
                    mobsEntries.push_back(5271);    // Atal'ai Deathwalker
                    mobsEntries.push_back(5273);    // Atal'ai High Priest

                    for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
                    {
                        std::list<Creature*> tmpMobsList;
                        GetCreatureListWithEntryInGrid(tmpMobsList, pJam, (*entriesIt), 150.0f);
                        while (!tmpMobsList.empty())
                        {
                            Creature* curr = tmpMobsList.front();
                            tmpMobsList.pop_front();
                            // Creature invoquee
                            if (!curr->GetDBTableGUIDLow())
                                continue;

                            if (curr->IsAlive())
                                curr->SetInCombatWithZone();
                        }
                    }
                    mobsEntries.clear();
                }
                break;
            case TYPE_MALFURION:
                m_auiEncounter[3] = uiData;
                break;
            case TYPE_AVATAR:
                m_auiEncounter[4] = uiData;
                break;
            case TYPE_ERANIKUS:
                m_auiEncounter[5] = uiData;
                if (uiData == IN_PROGRESS)
                {
                    Creature* pEranikus = instance->GetCreature(m_uiShadeEranikusGUID);
                    if (!pEranikus)
                        break;

                    std::vector<uint32> mobsEntries;
                    std::vector<uint32>::iterator entriesIt;
                    mobsEntries.push_back(5277);    // Nightmare Scalebane
                    mobsEntries.push_back(5280);    // Nightmare Wyrmkin
                    mobsEntries.push_back(8319);    // Nightmare Whelp
                    mobsEntries.push_back(5283);    // Nightmare Wanderer

                    for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
                    {
                        std::list<Creature*> tmpMobsList;
                        GetCreatureListWithEntryInGrid(tmpMobsList, pEranikus, (*entriesIt), 300.0f);
                        while (!tmpMobsList.empty())
                        {
                            Creature* curr = tmpMobsList.front();
                            tmpMobsList.pop_front();
                            // Creature invoquee
                            if (!curr->GetDBTableGUIDLow())
                                continue;

                            if (curr->IsAlive())
                                curr->SetInCombatWithZone();
                        }
                    }
                    mobsEntries.clear();
                }
                break;
            case TYPE_ETERNAL_FLAME:
                m_uiFlameCounter = uiData;
                break;
        }

        if (uiData == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " "
                       << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " << m_auiEncounter[5];

            strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    void SetData64(uint32 uiType, uint64 uiData) override
    {
        switch (uiType)
        {
            case NPC_SHADE_OF_HAKKAR:
                m_uiShadeHakkarGUID = uiData;
                break;
            case NPC_ATALARION:
                m_uiAtalarionGUID = uiData;
                break;
            case NPC_AVATAR_OF_HAKKAR:
                m_uiAvatarHakkarGUID = uiData;
                break;
            case GO_ATALAI_STATUE_1:
                m_uiAtalaiStatueGUID = uiData;
                break;
            case GO_ATALAI_STATUE_2:
                m_uiAtalaiStatueGUID = uiData;
                break;
            case GO_ATALAI_STATUE_3:
                m_uiAtalaiStatueGUID = uiData;
                break;
            case GO_ATALAI_STATUE_4:
                m_uiAtalaiStatueGUID = uiData;
                break;
            case GO_ATALAI_STATUE_5:
                m_uiAtalaiStatueGUID = uiData;
                break;
            case GO_ATALAI_STATUE_6:
                m_uiAtalaiStatueGUID = uiData;
                break;
        }
    }

    char const* Save() override
    {
        return strInstData.c_str();
    }

    uint32 GetData(uint32 uiType) override
    {
        switch (uiType)
        {
            case TYPE_ATALARION:
                return m_auiEncounter[0];
            case TYPE_PROTECTORS:
                return m_auiEncounter[1];
            case TYPE_JAMMALAN:
                return m_auiEncounter[2];
            case TYPE_MALFURION:
                return m_auiEncounter[3];
            case TYPE_AVATAR:
                return m_auiEncounter[4];
            case TYPE_ERANIKUS:
                return m_auiEncounter[5];
            case TYPE_ETERNAL_FLAME:
                return m_uiFlameCounter;
            default:
                return 0;
        }
    }

    uint64 GetData64(uint32 uiType) override
    {
        switch (uiType)
        {
            case NPC_SHADE_OF_HAKKAR:
                return m_uiShadeHakkarGUID;
            case NPC_ATALARION:
                return m_uiAtalarionGUID;
            case NPC_AVATAR_OF_HAKKAR:
                return m_uiAvatarHakkarGUID;
        }
        return 0;
    }

    void Update(uint32 uiDiff) override
    {
        if (RemoveTimer < uiDiff)
        {
            instance->RemoveAllObjectsInRemoveList();
            RemoveTimer = 5000;
        }
        else
            RemoveTimer -= uiDiff;
    }

    void Load(char const* chrIn) override
    {
        if (!chrIn)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(chrIn);

        std::istringstream loadStream(chrIn);
        loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3] >> m_auiEncounter[4] >> m_auiEncounter[5];

        for (uint32 & i : m_auiEncounter)
        {
            if (i == IN_PROGRESS)
                i = NOT_STARTED;
            // Here a bit custom, to have proper mechanics for the statue events
            /*if (m_auiEncounter[i] != DONE)
                m_auiEncounter[i] = NOT_STARTED;*/
        }

        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

InstanceData* GetInstance_instance_sunken_temple(Map* pMap)
{
    return new instance_sunken_temple(pMap);
}

void AddSC_instance_sunken_temple()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "instance_sunken_temple";
    pNewScript->GetInstanceData = &GetInstance_instance_sunken_temple;
    pNewScript->RegisterSelf();
}
