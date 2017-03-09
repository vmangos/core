#include "scriptPCH.h"

// #######################
// # npc_gobj_spawner    #
// #######################
// Spawn toutes les 1 a 3 min un Gobj avec l'entry du KillCredit0 de la creature.

struct npc_gobj_spawnerAI : public ScriptedAI
{
    npc_gobj_spawnerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        uiCD        = urand(5, 10) * 1000;
        uiGobjEntry = pCreature->GetCreatureInfo()->KillCredit[0];
        Reset();
    }

    uint32 uiCD;
    uint32 uiGobjEntry;

    void Reset()
    {
    }
    void DoSummonGobj()
    {
        GameObject* gobj = m_creature->SummonGameObject(
                               uiGobjEntry,
                               m_creature->GetPositionX(),
                               m_creature->GetPositionY(),
                               m_creature->GetPositionZ(),
                               m_creature->GetOrientation(),
                               0.0f, 0.0f, 0.0f, 0.0f, 25
                           );
        if (!gobj)
            sLog.outError("Impossible de spawner le gobj [Entry:%u]", uiGobjEntry);
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if (!uiGobjEntry)
            return;

        if (uiCD < uiDiff)
        {
            DoSummonGobj();
            uiCD = urand(60, 180) * 1000;
        }
        else
            uiCD -= uiDiff;
    }
};

CreatureAI* GetAI_npc_gobj_spawner(Creature* pCreature)
{
    return new npc_gobj_spawnerAI(pCreature);
}

void AddSC_event_nostalrius()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "npc_gobj_spawner";
    pNewScript->GetAI = &GetAI_npc_gobj_spawner;
    pNewScript->RegisterSelf();
}
