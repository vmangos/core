/*
 * Dun Morogh
 */

#include "scriptPCH.h"

/*######
## npc_narm_faulk
######*/

#define SAY_HEAL    -1000187

struct npc_narm_faulkAI : ScriptedAI
{
    uint32 lifeTimer;
    bool spellHit;

    npc_narm_faulkAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_narm_faulkAI::Reset();
    }

    void Reset() override
    {
        lifeTimer = 120000;
        m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
        spellHit = false;
    }

    void MoveInLineOfSight(Unit *who) override { }

    void UpdateAI(uint32 const diff) override
    {
        if (m_creature->IsStandingUp())
        {
            if (lifeTimer < diff)
                m_creature->AI()->EnterEvadeMode();
            else
                lifeTimer -= diff;
        }
    }

    void SpellHit(SpellCaster* Hitter, SpellEntry const* Spellkind) override
    {
        if (Spellkind->Id == 8593 && !spellHit)
        {
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);
            m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, 0);
            //m_creature->RemoveAllAuras();
            DoScriptText(SAY_HEAL, m_creature, Hitter->ToUnit());
            spellHit = true;
        }
    }
};

CreatureAI* GetAI_npc_narm_faulk(Creature* pCreature)
{
    return new npc_narm_faulkAI(pCreature);
}

void AddSC_dun_morogh()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_narm_faulk";
    newscript->GetAI = &GetAI_npc_narm_faulk;
    newscript->RegisterSelf();
}
