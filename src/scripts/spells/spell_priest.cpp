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
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
                    return false;
            }
            spell->m_caster->CastSpell(spell->GetUnitTarget(), spellId, true, nullptr);
        }
        return true;
    }
};

SpellScript* GetScript_PriestTouchOfWeakness(SpellEntry const*)
{
    return new PriestTouchOfWeaknessScript();
}

// 17, 592, 600, 3747, 6065, 6066, 10898, 10899, 10900, 10901, 27607 - Power Word: Shield
struct PriestPowerWordShieldScript : SpellScript
{
    enum
    {
        SPELL_WEAKENED_SOUL = 6788,
    };

    void OnHit(Spell* spell, SpellMissInfo missInfo) const final
    {
        if (missInfo == SPELL_MISS_NONE && spell->GetUnitTarget())
        {
            spell->m_caster->CastSpell(spell->GetUnitTarget(), SPELL_WEAKENED_SOUL, true);
        }
    }
};

SpellScript* GetScript_PriestPowerWordShield(SpellEntry const*)
{
    return new PriestPowerWordShieldScript();
}

// 15237, 15430, 15431, 27799, 27800, 27801 - Holy Nova
struct PriestHolyNovaScript : public SpellScript
{
    void OnSuccessfulFinish(Spell* spell) const final
    {
        if (!spell->m_casterUnit)
            return;

        uint32 spellId;
        switch (spell->m_spellInfo->Id)
        {
            case 15237:
                spellId = 23455;
                break;// Holy Nova, rank 1
            case 15430:
                spellId = 23458;
                break;// Holy Nova, rank 2
            case 15431:
                spellId = 23459;
                break;// Holy Nova, rank 3
            case 27799:
                spellId = 27803;
                break;// Holy Nova, rank 4
            case 27800:
                spellId = 27804;
                break;// Holy Nova, rank 5
            case 27801:
                spellId = 27805;
                break;// Holy Nova, rank 6
            default:
                sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Holy Nova spell script assigned to unhandled spell id %u.", spell->m_spellInfo->Id);
                return;
        }

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
        if (!spellInfo)
            return;

        Spell* newSpell = new Spell(spell->m_casterUnit, spellInfo, true, spell->GetOriginalCasterGuid());
        newSpell->prepare(spell->m_targets); // use original spell targets
    }
};

SpellScript* GetScript_PriestHolyNova(SpellEntry const*)
{
    return new PriestHolyNovaScript();
}

void AddSC_priest_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_priest_touch_of_weakness";
    newscript->GetSpellScript = &GetScript_PriestTouchOfWeakness;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_priest_power_word_shield";
    newscript->GetSpellScript = &GetScript_PriestPowerWordShield;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_priest_holy_nova";
    newscript->GetSpellScript = &GetScript_PriestHolyNova;
    newscript->RegisterSelf();
}
