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

struct HunterWyvernStingScript : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) final
    {
        if (!apply && aura->GetEffIndex() == EFFECT_INDEX_0)
        {
            Unit* caster = aura->GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            uint32 spellId = 0;

            switch (aura->GetId())
            {
                case 19386:
                    spellId = 24131;
                    break;
                case 24132:
                    spellId = 24134;
                    break;
                case 24133:
                    spellId = 24135;
                    break;
                default:
                    sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Unknown wyvern sting rank with spell id %u!", aura->GetId());
                    return;
            }

            caster->CastSpell(aura->GetTarget(), spellId, true, nullptr, aura);
        }
    }
};

AuraScript* GetScript_HunterWyvernSting(SpellEntry const*)
{
    return new HunterWyvernStingScript();
}

struct HunterReadinessScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
            {
                // immediately finishes the cooldown for hunter abilities
                auto cdCheck = [](SpellEntry const & spellEntry) -> bool { return (spellEntry.SpellFamilyName == SPELLFAMILY_HUNTER && spellEntry.Id != 23989 && spellEntry.GetRecoveryTime() > 0); };
                pPlayer->RemoveSomeCooldown(cdCheck);
            }
        }
    }
};

SpellScript* GetScript_HunterReadiness(SpellEntry const*)
{
    return new HunterReadinessScript();
}

struct HunterRefocusScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->m_caster->ToPlayer())
            {
                // Refocus : "Instantly clears the cooldowns of Aimed Shot, Multishot, Volley, and Arcane Shot."
                uint32 spellid = spell->m_spellInfo->Id;
                auto cdCheck = [spellid](SpellEntry const & spellEntry) -> bool { return (spellEntry.IsFitToFamily<SPELLFAMILY_HUNTER, CF_HUNTER_ARCANE_SHOT, CF_HUNTER_MULTI_SHOT, CF_HUNTER_VOLLEY, CF_HUNTER_AIMED_SHOT>() && spellEntry.Id != spellid && spellEntry.GetRecoveryTime() > 0); };
                pPlayer->RemoveSomeCooldown(cdCheck);
            }
        }
    }
};

SpellScript* GetScript_HunterRefocus(SpellEntry const*)
{
    return new HunterRefocusScript();
}

void AddSC_hunter_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_hunter_wyvern_sting";
    newscript->GetAuraScript = &GetScript_HunterWyvernSting;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_hunter_readiness";
    newscript->GetSpellScript = &GetScript_HunterReadiness;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_hunter_refocus";
    newscript->GetSpellScript = &GetScript_HunterRefocus;
    newscript->RegisterSelf();
}
