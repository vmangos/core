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

// 2098, 6760, 6761, 6762, 8623, 8624, 11299, 11300, 31016 - Eviscerate
struct RogueEviscerateScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
            // World of Warcraft Client Patch 1.12.0 (2006-08-22)
            // - Eviscerate: Manual of Eviscerate (Rank 9) now drops off Blackhand
            //   Assassins in Black Rock Spire.In addition, Eviscerate now increases
            //   in potency with greater attack power.
            if (spell->m_spellInfo->IsFitToFamilyMask<CF_ROGUE_EVISCERATE>())
            {
                if (Player* pPlayer = spell->m_caster->ToPlayer())
                    if (uint32 combo = pPlayer->GetComboPoints())
                        spell->damage += pPlayer->GetTotalAttackPowerValue(BASE_ATTACK) * combo * 0.03f;
            }
#endif
        }
    }
};

SpellScript* GetScript_RogueEviscerate(SpellEntry const*)
{
    return new RogueEviscerateScript();
}

void AddSC_rogue_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_rogue_eviscerate";
    newscript->GetSpellScript = &GetScript_RogueEviscerate;
    newscript->RegisterSelf();
}
