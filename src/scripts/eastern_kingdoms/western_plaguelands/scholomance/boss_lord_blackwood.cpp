/* ScriptData
SDName: Boss_lordblackwood
SD%Complete: 100
SDComment:
SDCategory: Scholomance
EndScriptData */

#include "scriptPCH.h"

//MOVED TO OTHER FILE : instance_scholomance.cpp
//tir à l'arc 2480
//flèches multiples 14443
//18651
//20735
//coup de bouclier 11972
//summoned->AddUnitState(UNIT_STAT_ROOT);
/*
enum
{
    SPELL_MULTI_SHOT        = 20735,
    SPELL_SHOOT             = 16100,//not used for now
    SPELL_SHIELD_BASH       = 11972
};


struct boss_lordblackwoodAI : public ScriptedAI
{
    boss_lordblackwoodAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 ShieldBash_Timer;
    uint32 MultiShot_Timer;

    void Reset()
    {
        ShieldBash_Timer = 8000;
        MultiShot_Timer = 1000;
    }

    void UpdateAI(uint32 const diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if(!m_creature->CanReachWithMeleeAutoAttack(m_creature->GetVictim()))
        {
            m_creature->MonsterSay("pas au cac!");
            if (MultiShot_Timer < diff)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MULTI_SHOT) == CAST_OK)
                    MultiShot_Timer=2000;
            }
            MultiShot_Timer-=diff;
        }
        if (ShieldBash_Timer < diff)
        {
        m_creature->MonsterSay("yo");
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHIELD_BASH) == CAST_OK)
                ShieldBash_Timer=8000;
        }
        ShieldBash_Timer -=diff;
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_lordblackwood(Creature* pCreature)
{
    return new boss_lordblackwoodAI(pCreature);
}

void AddSC_boss_lordblackwood()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_lord_blackwood";
    newscript->GetAI = &GetAI_boss_lordblackwood;
    newscript->RegisterSelf();
}*/


void AddSC_boss_lordblackwood()
{

}