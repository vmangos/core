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

// 22568, 22827, 22828, 22829, 31018 - Ferocious Bite
struct DruidFerociousBiteScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            Player* pPlayer = spell->m_caster->ToPlayer();
            if (!pPlayer)
                return true;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
            // World of Warcraft Client Patch 1.12.0 (2006-08-22)
            // - Ferocious Bite: Book of Ferocious Bite (Rank 5) now drops off The
            //   Beast in Black Rock Spire. In addition, Ferocious Bite now increases
            //   in potency with greater attack power.
            // ( AP * 3% * combo + energy * 2,7 + damage )
            if (uint32 combo = ((Player*)pPlayer)->GetComboPoints())
                spell->damage += pPlayer->GetTotalAttackPowerValue(BASE_ATTACK) * combo * 0.03f;
#endif

            spell->damage += pPlayer->GetPower(POWER_ENERGY) * spell->m_spellInfo->DmgMultiplier[effIdx];

#else

            uint32 damageSpellId;
            switch (spell->m_spellInfo->Id)
            {
                case 22568: // Rank 1
                    damageSpellId = 22851;
                    break;
                case 22827: // Rank 2
                    damageSpellId = 22853;
                    break;
                case 22828: // Rank 3
                    damageSpellId = 22861;
                    break;
                case 22829: // Rank 4
                    damageSpellId = 22862;
                    break;
                default:
                    return true;
            }

            int32 dmg = pPlayer->GetPower(POWER_ENERGY) * spell->m_spellInfo->DmgMultiplier[effIdx];
            pPlayer->CastCustomSpell(spell->GetUnitTarget(), damageSpellId, dmg, {}, {}, true);
#endif
            pPlayer->SetPower(POWER_ENERGY, 0);
        }
        return true;
    }
};

SpellScript* GetScript_DruidFerociousBite(SpellEntry const*)
{
    return new DruidFerociousBiteScript();
}

// 5229 - Enrage
struct DruidEnrageScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        if (effIdx == EFFECT_INDEX_1 && spell->GetUnitTarget())
        {
            // Reduce base armor by 27% in Bear Form and 16% in Dire Bear Form
            int32 reductionMod = spell->GetUnitTarget()->HasAura(9634) ? -16 : -27;
            spell->GetUnitTarget()->CastCustomSpell(spell->GetUnitTarget(), 25503, reductionMod, {}, {}, true);
        }
#endif
        return true;
    }
};

SpellScript* GetScript_DruidEnrage(SpellEntry const*)
{
    return new DruidEnrageScript();
}

// 18562 - Swiftmend
struct DruidSwiftmendScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        if (Unit* target = spell->m_targets.getUnitTarget())
            if (!target->GetAura(SPELL_AURA_PERIODIC_HEAL, SPELLFAMILY_DRUID, uint64(0x50)))
                return SPELL_FAILED_TARGET_AURASTATE;
#endif
        return SPELL_CAST_OK;
    }

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // find shortest duration heal
            Aura* targetAura = nullptr;
            Unit::AuraList const& periodicHeals = spell->GetUnitTarget()->GetAurasByType(SPELL_AURA_PERIODIC_HEAL);
            for (const auto i : periodicHeals)
            {
                // Regrowth or Rejuvenation
                if (i->GetSpellProto()->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REJUVENATION, CF_DRUID_REGROWTH>())
                    if (!targetAura || i->GetAuraDuration() < targetAura->GetAuraDuration())
                        targetAura = i;
            }

            if (!targetAura)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Target (GUID: %u TypeId: %u) has aurastate AURA_STATE_SWIFTMEND but no matching aura.", spell->GetUnitTarget()->GetGUIDLow(), spell->GetUnitTarget()->GetTypeId());
                return false;
            }

            int idx = 0;
            while (idx < 3)
            {
                if (targetAura->GetSpellProto()->EffectApplyAuraName[idx] == SPELL_AURA_PERIODIC_HEAL)
                    break;
                idx++;
            }

            float tickheal = targetAura->GetModifier()->m_amount;
            int32 tickcount = 0;
            // Regrowth : 0x40
            // "18 sec of Regrowth" -> 6 ticks
            if (targetAura->GetSpellProto()->IsFitToFamilyMask<CF_DRUID_REGROWTH>())
                tickcount = 6;
            // Rejuvenation : 0x10
            // "12 sec of Rejuvenation" -> 4 ticks
            if (targetAura->GetSpellProto()->IsFitToFamilyMask<CF_DRUID_REJUVENATION>())
                tickcount = 4;

            // consumes Regrowth or Rejuvenation
            spell->GetUnitTarget()->RemoveAurasDueToSpell(targetAura->GetId());

            spell->damage += tickheal * tickcount;
        }
#endif
        return true;
    }
};

SpellScript* GetScript_DruidSwiftmend(SpellEntry const*)
{
    return new DruidSwiftmendScript();
}

void AddSC_druid_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_druid_ferocious_bite";
    newscript->GetSpellScript = &GetScript_DruidFerociousBite;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_druid_enrage";
    newscript->GetSpellScript = &GetScript_DruidEnrage;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_druid_swiftmend";
    newscript->GetSpellScript = &GetScript_DruidSwiftmend;
    newscript->RegisterSelf();
}
