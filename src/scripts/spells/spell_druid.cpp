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
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            Player* pPlayer = spell->m_caster->ToPlayer();
            if (!pPlayer)
                return;

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
                    return;
            }

            int32 dmg = pPlayer->GetPower(POWER_ENERGY) * spell->m_spellInfo->DmgMultiplier[effIdx];
            pPlayer->CastCustomSpell(spell->GetUnitTarget(), damageSpellId, dmg, {}, {}, true);
#endif
            pPlayer->SetPower(POWER_ENERGY, 0);
        }
    }
};

SpellScript* GetScript_DruidFerociousBite(SpellEntry const*)
{
    return new DruidFerociousBiteScript();
}

// 5229 - Enrage
struct DruidEnrageScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
        if (effIdx == EFFECT_INDEX_1 && spell->GetUnitTarget())
        {
            // Reduce base armor by 27% in Bear Form and 16% in Dire Bear Form
            int32 reductionMod = spell->GetUnitTarget()->HasAura(9634) ? -16 : -27;
            spell->GetUnitTarget()->CastCustomSpell(spell->GetUnitTarget(), 25503, reductionMod, {}, {}, true);
        }
#endif
    }
};

SpellScript* GetScript_DruidEnrage(SpellEntry const*)
{
    return new DruidEnrageScript();
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
}
