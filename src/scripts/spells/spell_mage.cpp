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


// 12472 - Cold Snap
struct MageColdSnapScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (spell->m_caster->GetTypeId() != TYPEID_PLAYER)
                return;

            // immediately finishes the cooldown on Frost spells
            auto cdCheck = [](SpellEntry const & spellEntry) -> bool
            {
                if (spellEntry.SpellFamilyName != SPELLFAMILY_MAGE)
                    return false;
                if ((spellEntry.GetSpellSchoolMask() & SPELL_SCHOOL_MASK_FROST) && spellEntry.GetRecoveryTime() > 0)
                    return true;
                return false;
            };
            static_cast<Player*>(spell->m_caster)->RemoveSomeCooldown(cdCheck);
        }
    }
};

SpellScript* GetScript_MageColdSnap(SpellEntry const*)
{
    return new MageColdSnapScript();
}

void AddSC_mage_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_mage_cold_snap";
    newscript->GetSpellScript = &GetScript_MageColdSnap;
    newscript->RegisterSelf();
}
