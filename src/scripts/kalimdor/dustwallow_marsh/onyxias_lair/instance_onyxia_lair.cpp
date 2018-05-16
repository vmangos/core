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

    void Initialize() { }

    bool IsEncounterInProgress() const override
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

    void SetData(uint32 uiType, uint32 uiData) override
    {
        switch (uiType)
        {
            case DATA_ONYXIA_EVENT:
                m_auiEncounter[0] = uiData;
                break;
        }
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
