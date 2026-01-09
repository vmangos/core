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
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            spell->m_attackType = BASE_ATTACK;    // Set as base attack to benefit from melee crit
            spell->damage = spell->m_caster->SpellDamageBonusDone(spell->GetUnitTarget(), spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
            spell->damage = spell->GetUnitTarget()->SpellDamageBonusTaken(spell->m_caster, spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
        }
        return true;
    }
};

SpellScript* GetScript_PaladinHammerOfWrath(SpellEntry const*)
{
    return new PaladinHammerOfWrathScript();
}

// 20467, 20963, 20964, 20965, 20966 - Judgement of Command
struct PaladinJudgementOfCommandDamageScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // base damage halved if target not stunned.
            if (!spell->GetUnitTarget()->HasUnitState(UNIT_STATE_STUNNED | UNIT_STATE_PENDING_STUNNED))
                spell->damage = spell->damage * 0.5f;

            spell->damage = spell->m_caster->SpellDamageBonusDone(spell->GetUnitTarget(), spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
            spell->damage = spell->GetUnitTarget()->SpellDamageBonusTaken(spell->m_caster, spell->m_spellInfo, effIdx, spell->damage, SPELL_DIRECT_DAMAGE);
        }
        return true;
    }
};

SpellScript* GetScript_PaladinJudgementOfCommandDamage(SpellEntry const*)
{
    return new PaladinJudgementOfCommandDamageScript();
}

// 20425, 20961, 20962, 20967, 20968 - Judgement of Command
struct PaladinJudgementOfCommandDummyScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            uint32 spellId = spell->m_currentBasePoints[effIdx];
            SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spellId);
            if (!pSpellEntry)
                return false;

            spell->m_caster->CastSpell(spell->GetUnitTarget(), pSpellEntry, true, nullptr);
        }
        return true;
    }
};

SpellScript* GetScript_PaladinJudgementOfCommandDummy(SpellEntry const*)
{
    return new PaladinJudgementOfCommandDummyScript();
}

// 20473, 20929, 20930 - Holy Shock
struct PaladinHolyShockScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        if (spell->m_targets.getUnitTarget() &&
            !spell->m_caster->IsFriendlyTo(spell->m_targets.getUnitTarget()) &&
            !spell->m_caster->IsFacingTarget(spell->m_targets.getUnitTarget()))
            return SPELL_FAILED_UNIT_NOT_INFRONT;

        return SPELL_CAST_OK;
    }

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
                    return false;
            }

            if (spell->m_caster->IsFriendlyTo(spell->GetUnitTarget()))
                spell->m_caster->CastSpell(spell->GetUnitTarget(), heal, true);
            else
                spell->m_caster->CastSpell(spell->GetUnitTarget(), hurt, true);
        }
        return true;
    }
};

SpellScript* GetScript_PaladinHolyShock(SpellEntry const*)
{
    return new PaladinHolyShockScript();
}

// 20185, 20344, 20345, 20346, 25751 - Judgement of Light
struct PaladinJudgementOfLightProcAuraScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit)
        {
            // Paladin T3 JoL
            if (spell->m_casterUnit->HasAura(28775))
                spell->m_currentBasePoints[effIdx] = 20;
        }
        return true;
    }
};

SpellScript* GetScript_PaladinJudgementOfLightProcAura(SpellEntry const*)
{
    return new PaladinJudgementOfLightProcAuraScript();
}

// 20267, 20341, 20342, 20343 - Judgement of Light
struct PaladinJudgementOfLightHealScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            // Extra heal stored in m_triggeredByAuraBasePoints
            if (spell->m_triggeredByAuraBasePoints > 0)
                spell->damage += spell->m_triggeredByAuraBasePoints;
        }
        return true;
    }
};

SpellScript* GetScript_PaladinJudgementOfLightHeal(SpellEntry const*)
{
    return new PaladinJudgementOfLightHealScript();
}

// 20178 - Reckoning
struct PaladinReckoningScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // World of Warcraft Client Patch 1.3.0 (2005-03-22)
            // - Fixed a bug where abilities that give extra attacks, like the paladin
            //   Reckoning talent, could cause the following swing to take longer than
            //   it should.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_2_4
            spell->GetUnitTarget()->ResetAttackTimer();
#endif

            // It was possible to stack infinite extra attacks in early vanilla.
            // https://www.youtube.com/watch?v=TqPQ4SNmx2c
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
            if (spell->GetUnitTarget()->GetExtraAttacks() < 4)
#endif
                spell->GetUnitTarget()->AddExtraAttack();

            return false;
        }
        return true;
    }
};

SpellScript* GetScript_PaladinReckoning(SpellEntry const*)
{
    return new PaladinReckoningScript();
}

enum
{
    SPELL_FORBEARANCE = 25771,
};

// 642, 1020 - Divine Shield
// 498, 5573 - Divine Protection
// 1022, 5599, 10278 - Blessing of Protection
struct PaladinBubbleScript : public SpellScript
{
    void OnAfterHit(Spell* spell) const final
    {
        if (spell->GetUnitTarget())
            spell->m_caster->CastSpell(spell->GetUnitTarget(), SPELL_FORBEARANCE, true);
    }
};

SpellScript* GetScript_PaladinBubble(SpellEntry const*)
{
    return new PaladinBubbleScript();
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

    newscript = new Script;
    newscript->Name = "spell_paladin_judgement_of_light_proc_aura";
    newscript->GetSpellScript = &GetScript_PaladinJudgementOfLightProcAura;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_judgement_of_light_heal";
    newscript->GetSpellScript = &GetScript_PaladinJudgementOfLightHeal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_reckoning";
    newscript->GetSpellScript = &GetScript_PaladinReckoning;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_paladin_bubble";
    newscript->GetSpellScript = &GetScript_PaladinBubble;
    newscript->RegisterSelf();
}
