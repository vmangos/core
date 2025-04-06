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

// 24239, 24274, 24275 - Hammer of Wrath
struct PaladinHammerOfWrathScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            spell->m_attackType = BASE_ATTACK;    // Set as base attack to benefit from melee crit
            spell->damage = spell->m_caster->SpellDamageBonusDone(spell->GetUnitTarget(), spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
            spell->damage = spell->GetUnitTarget()->SpellDamageBonusTaken(spell->m_caster, spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
        }
    }
};

SpellScript* GetScript_PaladinHammerOfWrath(SpellEntry const*)
{
    return new PaladinHammerOfWrathScript();
}

// 20467, 20963, 20964, 20965, 20966 - Judgement of Command
struct PaladinJudgementOfCommandDamageScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // base damage halved if target not stunned.
            if (!spell->GetUnitTarget()->HasUnitState(UNIT_STATE_STUNNED | UNIT_STATE_PENDING_STUNNED))
                spell->damage = spell->damage * 0.5f;

            spell->damage = spell->m_caster->SpellDamageBonusDone(spell->GetUnitTarget(), spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
            spell->damage = spell->GetUnitTarget()->SpellDamageBonusTaken(spell->m_caster, spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
        }
    }
};

SpellScript* GetScript_PaladinJudgementOfCommandDamage(SpellEntry const*)
{
    return new PaladinJudgementOfCommandDamageScript();
}

// 20425, 20961, 20962, 20967, 20968 - Judgement of Command
struct PaladinJudgementOfCommandDummyScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            uint32 spellId = spell->m_currentBasePoints[effIdx];
            SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spellId);
            if (!pSpellEntry)
                return;

            spell->m_caster->CastSpell(spell->GetUnitTarget(), pSpellEntry, true, nullptr);
        }
    }
};

SpellScript* GetScript_PaladinJudgementOfCommandDummy(SpellEntry const*)
{
    return new PaladinJudgementOfCommandDummyScript();
}

// 20473, 20929, 20930 - Holy Shock
struct PaladinHolyShockScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            int hurt;
            int heal;

            switch (spell->m_spellInfo->Id)
            {
                case 20473:
                    hurt = 25912;
                    heal = 25914;
                    break;
                case 20929:
                    hurt = 25911;
                    heal = 25913;
                    break;
                case 20930:
                    hurt = 25902;
                    heal = 25903;
                    break;
                default:
                    sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Spell::EffectDummy: Spell %u not handled in HS", spell->m_spellInfo->Id);
                    return;
            }

            if (spell->m_caster->IsFriendlyTo(spell->GetUnitTarget()))
                spell->m_caster->CastSpell(spell->GetUnitTarget(), heal, true);
            else
                spell->m_caster->CastSpell(spell->GetUnitTarget(), hurt, true);
        }
    }
};

SpellScript* GetScript_PaladinHolyShock(SpellEntry const*)
{
    return new PaladinHolyShockScript();
}

void AddSC_paladin_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_paladin_hammer_of_wrath";
    newscript->GetSpellScript = &GetScript_PaladinHammerOfWrath;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_judgement_of_command_damage";
    newscript->GetSpellScript = &GetScript_PaladinJudgementOfCommandDamage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_judgement_of_command_dummy";
    newscript->GetSpellScript = &GetScript_PaladinJudgementOfCommandDummy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_holy_shock";
    newscript->GetSpellScript = &GetScript_PaladinHolyShock;
    newscript->RegisterSelf();
}
