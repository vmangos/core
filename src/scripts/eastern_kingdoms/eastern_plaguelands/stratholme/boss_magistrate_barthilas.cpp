#include "scriptPCH.h"
#include "stratholme.h"

#define SPELL_DRAININGBLOW      16793
#define SPELL_CROWDPUMMEL       10887
#define SPELL_MIGHTYBLOW        14099
#define SPELL_FURIOUS_ANGER     16791

#define MODEL_NORMAL            10433
#define MODEL_HUMAN             3637

struct boss_magistrate_barthilasAI : public ScriptedAI
{
    boss_magistrate_barthilasAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 DrainingBlow_Timer;
    uint32 CrowdPummel_Timer;
    uint32 MightyBlow_Timer;
    uint32 FuriousAnger_Timer;
    uint32 AngerCount;

    void Reset() override
    {
        DrainingBlow_Timer = 16000;
        CrowdPummel_Timer = 12000;
        MightyBlow_Timer = 8000;
        FuriousAnger_Timer = 5000;
        AngerCount = 0;

        if (m_creature->IsAlive())
            m_creature->SetDisplayId(MODEL_NORMAL);
        else
            m_creature->SetDisplayId(MODEL_HUMAN);
    }

    void MoveInLineOfSight(Unit *who) override
    {
        if (who->GetTypeId() == TYPEID_PLAYER && m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING) && m_creature->IsWithinDistInMap(who, 10.0f))
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
        }
        ScriptedAI::MoveInLineOfSight(who);
    }

    void JustDied(Unit* Killer) override
    {
        m_creature->SetDisplayId(MODEL_HUMAN);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (FuriousAnger_Timer < diff)
        {
            FuriousAnger_Timer = 4000;
            if (AngerCount > 25)
                return;

            ++AngerCount;
            m_creature->CastSpell(m_creature, SPELL_FURIOUS_ANGER, false);
        }
        else FuriousAnger_Timer -= diff;

        //DrainingBlow
        if (DrainingBlow_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DRAININGBLOW);
            DrainingBlow_Timer = 15000;
        }
        else DrainingBlow_Timer -= diff;

        //CrowdPummel
        if (CrowdPummel_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CROWDPUMMEL);
            CrowdPummel_Timer = 15000;
        }
        else CrowdPummel_Timer -= diff;

        //MightyBlow
        if (MightyBlow_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MIGHTYBLOW);
            MightyBlow_Timer = 20000;
        }
        else MightyBlow_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_magistrate_barthilas(Creature* pCreature)
{
    return new boss_magistrate_barthilasAI(pCreature);
}

void AddSC_boss_magistrate_barthilas()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_magistrate_barthilas";
    newscript->GetAI = &GetAI_boss_magistrate_barthilas;
    newscript->RegisterSelf();
}
