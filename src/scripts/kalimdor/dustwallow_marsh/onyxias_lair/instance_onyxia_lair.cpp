#include "scriptPCH.h"
#include "instance_onyxia_lair.h"

#define MAX_ENCOUNTER   1

struct instance_onyxia_lair : public ScriptedInstance
{
    instance_onyxia_lair(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };
    uint32 m_auiEncounter[MAX_ENCOUNTER];

    uint32 m_uiOnyxiaGUID;
    uint32 m_uiOnyxiaDoorGUID;
    uint32 m_uiOnyxiaEncounterDoorGUID;



    void Initialize()
    {
        m_uiOnyxiaGUID = 0;
        m_uiOnyxiaDoorGUID = 0;
        m_uiOnyxiaEncounterDoorGUID = 0;
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS)
                return true;
        return false;
    }

    uint32 GetData(uint32 identifier)
    {
        switch (identifier)
        {
            case DATA_ONYXIA_EVENT:
                return m_auiEncounter[0];
        }
        return 0;
    }

    void SetData(uint32 identifier, uint32 data)
    {
        switch (identifier)
        {
            case DATA_ONYXIA_EVENT:
                if (data == IN_PROGRESS)
                {
                    sLog.outString("Fermeture de l'instance pendant le combat contre Onyxia");
                    if (m_uiOnyxiaDoorGUID)
                        if (GameObject *pGo = instance->GetGameObject(m_uiOnyxiaDoorGUID))
                            pGo->SetGoState(GO_STATE_READY);
                }
                if (data == NOT_STARTED)
                {
                    sLog.outString("Arrets des combats: ouverture de l'instance");
                    if (m_uiOnyxiaDoorGUID)
                        if (GameObject *pGo = instance->GetGameObject(m_uiOnyxiaDoorGUID))
                            pGo->SetGoState(GO_STATE_ACTIVE);
                }
                m_auiEncounter[0] = data;
                break;
        }
    }

    void OnCreatureCreate(Creature* pCreature)
    {
        switch (pCreature->GetEntry())
        {
            case 10184:
                m_uiOnyxiaGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* go)
    {
        switch (go->GetEntry())
        {
            case 177928:
                m_uiOnyxiaDoorGUID = go->GetGUID();
                break;
        }
    }
    uint64 GetData64(uint32 identifier)
    {
        switch (identifier)
        {
            case DATA_ONYXIA:
                return m_uiOnyxiaGUID;
            case DATA_ONYXIA_DOOR:
                return m_uiOnyxiaDoorGUID;
            case DATA_ONYXIA_ENCOUNTER_DOOR:
                return m_uiOnyxiaEncounterDoorGUID;
        }
        return 0;
    }
};

InstanceData* GetInstanceData_instance_onyxia_lair(Map* pMap)
{
    return new instance_onyxia_lair(pMap);
}

void AddSC_instance_onyxia_lair()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "instance_onyxia_lair";
    newscript->GetInstanceData = &GetInstanceData_instance_onyxia_lair;
    newscript->RegisterSelf();
}










