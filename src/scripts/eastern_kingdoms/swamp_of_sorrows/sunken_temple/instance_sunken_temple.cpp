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

// This is also the needed order for activation
static uint32 const m_atalaiStatueEntries[MAX_STATUES] =
{
    GO_ATALAI_STATUE_1, // S
    GO_ATALAI_STATUE_2, // N
    GO_ATALAI_STATUE_3, // SW
    GO_ATALAI_STATUE_4, // SE
    GO_ATALAI_STATUE_5, // NW
    GO_ATALAI_STATUE_6  // NE
};

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

    uint64 m_luiProtectorGUIDs[6];  // Jammalan door handling
    uint8 m_uiStatueCounter;        // Atalarion Statue Event
    uint64 m_uiShadeHakkarGUID;
    uint64 m_uiAtalarionGUID;
    uint64 m_uiJammalanBarrierGUID;
    uint64 m_uiIdolHakkarGUID;
    uint64 m_uiShadeEranikusGUID;
    uint64 m_uiJammalanGUID;
    uint64 m_uiDreamscythGUID;
    uint64 m_uiWeaverGUID;
    uint64 m_uiAvatarHakkarGUID;

    uint32 RemoveTimer;

    uint64 m_luiAtalaiStatueGUIDs[6];
    uint64 m_luiBigLightGUIDs[6];

    bool m_restoreCircleState;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        memset(&m_luiProtectorGUIDs, 0, sizeof(m_luiProtectorGUIDs));
        memset(&m_luiAtalaiStatueGUIDs, 0, sizeof(m_luiAtalaiStatueGUIDs));
        memset(&m_luiBigLightGUIDs, 0, sizeof(m_luiBigLightGUIDs));

        m_uiStatueCounter = 0;
        m_uiShadeHakkarGUID = 0;
        m_uiAtalarionGUID = 0;
        m_uiJammalanBarrierGUID = 0;
        m_uiIdolHakkarGUID = 0;
        m_uiShadeEranikusGUID = 0;
        m_uiJammalanGUID = 0;
        m_uiDreamscythGUID = 0;
        m_uiWeaverGUID = 0;
        m_uiAvatarHakkarGUID = 0;

        RemoveTimer = 5000;
        m_restoreCircleState = true;
    }

    void DoSpawnAtalarionIfCan()
    {
        // Return if already summoned
        Creature* pAtalarion = instance->GetCreature(GetData64(NPC_ATALARION));
        if (!pAtalarion)
            return;

        DoScriptText(SAY_ATALALARION_SPAWN, pAtalarion);
        pAtalarion->SetVisibility(VISIBILITY_ON);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
        pAtalarion->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
    }

    void HandleStatueEventDone()
    {
        // Spawn the idol of Hakkar
        DoRespawnGameObject(m_uiIdolHakkarGUID, HOUR * IN_MILLISECONDS);

        // Disable interacting with circle stones
        for (uint64 guid : m_luiAtalaiStatueGUIDs)
        {
            if (GameObject* pGob = instance->GetGameObject(guid))
                pGob->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
        }

        // Spawn the big green lights
        for (uint64 guid : m_luiBigLightGUIDs)
            DoRespawnGameObject(guid, HOUR * IN_MILLISECONDS);
    }

    void ProcessStatueUsed(uint32 statueEntry)
    {
        if (GetData(TYPE_SECRET_CIRCLE) == DONE)
            return;

        if (GetData(TYPE_SECRET_CIRCLE) != IN_PROGRESS)
            SetData(TYPE_SECRET_CIRCLE, IN_PROGRESS);

        uint64 statueGuid = 0;
        switch (statueEntry) {
            case GO_ATALAI_STATUE_1:
                statueGuid = m_luiAtalaiStatueGUIDs[0];
                break;
            case GO_ATALAI_STATUE_2:
                statueGuid = m_luiAtalaiStatueGUIDs[1];
                break;
            case GO_ATALAI_STATUE_3:
                statueGuid = m_luiAtalaiStatueGUIDs[2];
                break;
            case GO_ATALAI_STATUE_4:
                statueGuid = m_luiAtalaiStatueGUIDs[3];
                break;
            case GO_ATALAI_STATUE_5:
                statueGuid = m_luiAtalaiStatueGUIDs[4];
                break;
            case GO_ATALAI_STATUE_6:
                statueGuid = m_luiAtalaiStatueGUIDs[5];
                break;
        }

        if (!statueGuid)
            return;

        GameObject* pStatue = instance->GetGameObject(statueGuid);
        if (!pStatue)
            return;

        bool activationSuccess = false;

        // Check if the statues are activated correctly
        // Increase the counter when the correct statue is activated
        for (uint8 i = 0; i < MAX_STATUES; ++i)
        {
            if (statueEntry == m_atalaiStatueEntries[i] && m_uiStatueCounter == i)
            {
                // Correct statue activated
                ++m_uiStatueCounter;
                activationSuccess = true;
                pStatue->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                // Show green light
                if (GameObject* pLight = GetClosestGameObjectWithEntry(pStatue, GO_ATALAI_LIGHT, INTERACTION_DISTANCE))
                    DoRespawnGameObject(pLight->GetGUID(), HOUR * IN_MILLISECONDS);
                break;
            }
        }

        // Check if all statues are activated
        if (m_uiStatueCounter == MAX_STATUES)
        {
            SetData(TYPE_SECRET_CIRCLE, DONE);
            return;
        }

        if (activationSuccess)
            return;

        // If the wrong statue was activated, then trigger trap
        // We don't know actually which trap goes to which statue so we need to search for each
        Creature* pAtalarion = instance->GetCreature(GetData64(NPC_ATALARION));
        if (!pAtalarion)
            return;

        if (GameObject* pTrap = GetClosestGameObjectWithEntry(pStatue, PickRandomValue(GO_ATALAI_TRAP_1, GO_ATALAI_TRAP_2, GO_ATALAI_TRAP_3), INTERACTION_DISTANCE))
            pTrap->Use(pAtalarion);
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        int countLight = 0;
        switch (pGo->GetEntry())
        {
            case GO_JAMMALAN_BARRIER:
                m_uiJammalanBarrierGUID = pGo->GetGUID();
                if (GetData(TYPE_PROTECTORS) == DONE)
                    pGo->SetGoState(GO_STATE_ACTIVE);
                break;
            case GO_IDOL_OF_HAKKAR:
                m_uiIdolHakkarGUID = pGo->GetGUID();
                pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
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
                if (GetData(TYPE_SECRET_CIRCLE) != SPECIAL && GetData(TYPE_SECRET_CIRCLE) != DONE)
                {
                    pCreature->SetVisibility(VISIBILITY_OFF);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                }
                break;
            case NPC_SHADE_OF_ERANIKUS:
                m_uiShadeEranikusGUID = pCreature->GetGUID();
                if (GetData(TYPE_JAMMALAN) != DONE)
                {
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
                    pCreature->SetStandState(UNIT_STAND_STATE_SLEEP);
                }
                break;
            case NPC_DREAMSCYTH:
                m_uiDreamscythGUID = pCreature->GetGUID();
                if (GetData(TYPE_JAMMALAN) != DONE)
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
                if (GetData(TYPE_JAMMALAN) != DONE)
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

    void OnCreatureDeath(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_ATALARION:
                if (GameObject* pIdol = instance->GetGameObject(m_uiIdolHakkarGUID))
                {
                    pIdol->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                }
                break;
        }
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        switch (uiType)
        {
            case TYPE_SECRET_CIRCLE:
                m_auiEncounter[0] = uiData;
                if (uiData == DONE)
                {
                    HandleStatueEventDone();
                    DoSpawnAtalarionIfCan();
                }
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
            case GO_ATALAI_STATUE_2:
            case GO_ATALAI_STATUE_3:
            case GO_ATALAI_STATUE_4:
            case GO_ATALAI_STATUE_5:
            case GO_ATALAI_STATUE_6:
                ProcessStatueUsed(uiType);
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
            case TYPE_SECRET_CIRCLE:
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

        // Check if need to restore state after server crash
        if (m_restoreCircleState)
        {
            m_restoreCircleState = false;
            if (GetData(TYPE_SECRET_CIRCLE) == DONE)
            {
                HandleStatueEventDone();
                if (Creature* pAtalarion = instance->GetCreature(m_uiAtalarionGUID))
                {
                    // Idol of Hakkar should be interactable when Atal'alarion was killed
                    if (!pAtalarion->IsAlive())
                    {
                        if (GameObject* pIdol = instance->GetGameObject(m_uiIdolHakkarGUID))
                        {
                            pIdol->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                        }
                    }
                }
            }
        }
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
