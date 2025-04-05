/*
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

#include "scriptPCH.h"

// 28598 - Touch of Weakness
struct PriestTouchOfWeaknessScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget() && spell->m_triggeredByAuraSpell)
        {
            uint32 spellId;
            switch (spell->m_triggeredByAuraSpell->Id)
            {
                case 2652:
                    spellId = 2943;
                    break; // Rank 1
                case 19261:
                    spellId = 19249;
                    break; // Rank 2
                case 19262:
                    spellId = 19251;
                    break; // Rank 3
                case 19264:
                    spellId = 19252;
                    break; // Rank 4
                case 19265:
                    spellId = 19253;
                    break; // Rank 5
                case 19266:
                    spellId = 19254;
                    break; // Rank 6
                default:
                    sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Spell::EffectDummy: Spell 28598 triggered by unhandeled spell %u", spell->m_triggeredByAuraSpell->Id);
                    return;
            }
            spell->m_caster->CastSpell(spell->GetUnitTarget(), spellId, true, nullptr);
        }
    }
};

SpellScript* GetScript_PriestTouchOfWeakness(SpellEntry const*)
{
    return new PriestTouchOfWeaknessScript();
}

void AddSC_priest_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_priest_touch_of_weakness";
    newscript->GetSpellScript = &GetScript_PriestTouchOfWeakness;
    newscript->RegisterSelf();
}
