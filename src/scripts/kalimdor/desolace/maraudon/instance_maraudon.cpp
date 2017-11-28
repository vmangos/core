/*
  ROCKETTE FOR NOSTALRIUS
 */

#include "scriptPCH.h"
#include "maraudon.h"

struct instance_maraudon : public ScriptedInstance
{
    instance_maraudon(Map *pMap) : ScriptedInstance(pMap)
    {
        cGuid = 0;
    }

    uint32 m_auiEncounter[MARAUDON_MAX_ENCOUNTER];
    std::string strInstData;

    uint64 cGuid;

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        cGuid = 0;
    }

    void OnCreatureCreate(Creature *pCreature)
    {
        if (pCreature->GetEntry() == NPC_CELEBRAS_REDEEMED)
        {
            cGuid = pCreature->GetObjectGuid();

            if (m_auiEncounter[0] != DONE)
                pCreature->SetVisibility(VISIBILITY_OFF);
        }
    }

    const char* Save()
    {
        return strInstData.c_str();
    }

    void Load(const char* chrIn)
    {
        if (!chrIn)
            return;
        std::istringstream loadStream(chrIn);
        for (uint8 i = 0; i < MARAUDON_MAX_ENCOUNTER; ++i)
        {
            loadStream >> m_auiEncounter[i];
            if (m_auiEncounter[i] == IN_PROGRESS)
                m_auiEncounter[i] = NOT_STARTED;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        if (uiType == TYPE_CELEBRAS)
            return m_auiEncounter[0];
        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        if (uiType == TYPE_CELEBRAS)
        {
            if (uiData == DONE)
            {
                if (Creature* pCreature = instance->GetCreature(GetData64(NPC_CELEBRAS_REDEEMED)))
                {
                    pCreature->SetVisibility(VISIBILITY_ON);
                }
            }

            m_auiEncounter[0] = uiData;
        }

        if (uiData == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            for (int i = 0; i < MARAUDON_MAX_ENCOUNTER; ++i)
                saveStream << m_auiEncounter[i] << " ";

            strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    uint64 GetData64(uint32 uiData)
    {
        switch (uiData)
        {
            case NPC_CELEBRAS_REDEEMED:
                return cGuid;
        }

        return 0;
    }
};

InstanceData* GetInstanceData_instance_maraudon(Map* pMap)
{
    return new instance_maraudon(pMap);
}

void AddSC_instance_maraudon()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "instance_maraudon";
    pNewScript->GetInstanceData = &GetInstanceData_instance_maraudon;
    pNewScript->RegisterSelf();
}
