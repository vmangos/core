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

// 19386, 24132, 24133 - Wyvern Sting
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

// 23989 - Readiness
struct HunterReadinessScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
        return true;
    }
};

SpellScript* GetScript_HunterReadiness(SpellEntry const*)
{
    return new HunterReadinessScript();
}

// 24531 - Refocus
struct HunterRefocusScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
        return true;
    }
};

SpellScript* GetScript_HunterRefocus(SpellEntry const*)
{
    return new HunterRefocusScript();
}

// 1495, 14269, 14270, 14271 - Mongoose Bite
struct HunterMongooseBiteScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        if (spell->m_casterUnit && spell->m_targets.getUnitTargetGuid() != spell->m_casterUnit->GetReactiveTarget(REACTIVE_DEFENSE))
            return SPELL_FAILED_BAD_TARGETS;
        return SPELL_CAST_OK;
    }
};

SpellScript* GetScript_HunterMongooseBite(SpellEntry const*)
{
    return new HunterMongooseBiteScript();
}

// 19306, 20909, 20910 - Counterattack
struct HunterCounterAttackScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        if (spell->m_casterUnit && spell->m_targets.getUnitTargetGuid() != spell->m_casterUnit->GetReactiveTarget(REACTIVE_HUNTER_PARRY))
            return SPELL_FAILED_BAD_TARGETS;
        return SPELL_CAST_OK;
    }
};

SpellScript* GetScript_HunterCounterAttack(SpellEntry const*)
{
    return new HunterCounterAttackScript();
}

// 13810 - Frost Trap Aura
struct HunterFrostTrapAuraScript : public AuraScript
{
    void OnPeriodicTrigger(Aura* aura, Unit* /*caster*/, Unit* target, WorldObject* /*targetObject*/, SpellEntry const*& /*spellInfo*/) final
    {
        Unit* caster = aura->GetCaster();
        if (!caster)
            return;

        // Talent 'Entrapment' for example (chance to root)
        caster->ProcDamageAndSpell(ProcSystemArguments(target, PROC_FLAG_ON_TRAP_ACTIVATION, PROC_FLAG_NONE, PROC_EX_NORMAL_HIT, 1, 1, BASE_ATTACK, aura->GetSpellProto()));
    }
};

AuraScript* GetScript_HunterFrostTrapAura(SpellEntry const*)
{
    return new HunterFrostTrapAuraScript();
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

    newscript = new Script;
    newscript->Name = "spell_hunter_mongoose_bite";
    newscript->GetSpellScript = &GetScript_HunterMongooseBite;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_hunter_counterattack";
    newscript->GetSpellScript = &GetScript_HunterCounterAttack;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_hunter_frost_trap_aura";
    newscript->GetAuraScript = &GetScript_HunterFrostTrapAura;
    newscript->RegisterSelf();
}
