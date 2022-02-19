/*
*/

#include "scriptPCH.h"

#define SPELL_BUFF_GLEBE 8178
#define SPELL_BUFF_GLEBE_PASSIVE 8179

struct TotemGlebeAI : public TotemAI
{
    TotemGlebeAI(Creature* pCreature) : TotemAI(pCreature) {}

    void SpellHit(SpellCaster* /*u*/, SpellEntry const* pSpell) override
    {
        if (pSpell->Id != SPELL_BUFF_GLEBE_PASSIVE && pSpell->Id != SPELL_BUFF_GLEBE)
        {
            m_creature->RemoveAurasDueToSpell(pSpell->Id);
            m_creature->RemoveAurasDueToSpell(SPELL_BUFF_GLEBE);
        }
    }
};

CreatureAI* GetAI_TotemGlebe(Creature* pCreature)
{
    return new TotemGlebeAI(pCreature);
}

void AddSC_Totems()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "TotemGlebe";
    newscript->GetAI = &GetAI_TotemGlebe;
    newscript->RegisterSelf();
}
