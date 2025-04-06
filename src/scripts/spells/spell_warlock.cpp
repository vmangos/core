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

// 18788 - Demonic Sacrifice
struct WarlockDemonicSacrificeScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit && spell->GetUnitTarget())
        {
            uint32 entry = spell->GetUnitTarget()->GetEntry();
            uint32 spellId;
            switch (entry)
            {
                case   416:
                    spellId = 18789;
                    break;               // imp
                case   417:
                    spellId = 18792;
                    break;               // fellhunter
                case  1860:
                    spellId = 18790;
                    break;               // void
                case  1863:
                    spellId = 18791;
                    break;               // succubus
                default:
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Demonic Sacrifice: Unhandled creature entry (%u) case.", entry);
                    return;
            }

            spell->m_casterUnit->CastSpell(spell->m_casterUnit, spellId, true);
        }
    }
};

SpellScript* GetScript_WarlockDemonicSacrifice(SpellEntry const*)
{
    return new WarlockDemonicSacrificeScript();
}

// 17962, 18930, 18931, 18932 - Conflagrate
struct WarlockConflagrateScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // for caster applied auras only
            Unit::AuraList const& mPeriodic = spell->GetUnitTarget()->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
            for (const auto i : mPeriodic)
            {
                // Immolate
                if (i->GetSpellProto()->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_IMMOLATE>() &&
                    i->GetCasterGuid() == spell->m_caster->GetObjectGuid())
                {
                    spell->GetUnitTarget()->RemoveAurasByCasterSpell(i->GetId(), spell->m_caster->GetObjectGuid());
                    break;
                }
            }
        }
    }
};

SpellScript* GetScript_WarlockConflagrate(SpellEntry const*)
{
    return new WarlockConflagrateScript();
}

// 1454, 1455, 1456, 11687, 11688, 11689 - Life Tap
struct WarlockLifeTapScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit)
        {
            float dmg = spell->m_casterUnit->CalculateSpellEffectValue(spell->m_casterUnit, spell->m_spellInfo, effIdx, &spell->m_currentBasePoints[EFFECT_INDEX_0]);
            if (Player* modOwner = spell->m_casterUnit->GetSpellModOwner())
                modOwner->ApplySpellMod(spell->m_spellInfo->Id, SPELLMOD_COST, dmg, spell);

            dmg = spell->m_casterUnit->SpellDamageBonusDone(spell->m_casterUnit, spell->m_spellInfo, effIdx, dmg > 0 ? dmg : 0, SPELL_DIRECT_DAMAGE);
            dmg = spell->m_casterUnit->SpellDamageBonusTaken(spell->m_casterUnit, spell->m_spellInfo, effIdx, dmg, SPELL_DIRECT_DAMAGE);
            int32 idmg = dither(dmg);

            if (int32(spell->m_casterUnit->GetHealth()) > idmg)
            {
                // Shouldn't Appear in Combat Log
                spell->m_casterUnit->ModifyHealth(-idmg);

                int32 mana = idmg;

                Unit::AuraList const& auraDummy = spell->m_casterUnit->GetAurasByType(SPELL_AURA_DUMMY);
                for (const auto itr : auraDummy)
                {
                    // only Imp. Life Tap have this in combination with dummy aura
                    if (itr->GetSpellProto()->SpellFamilyName == SPELLFAMILY_WARLOCK && itr->GetSpellProto()->SpellIconID == 208)
                        mana = (itr->GetModifier()->m_amount + 100) * mana / 100;
                }

                spell->m_casterUnit->CastCustomSpell(spell->m_casterUnit, 31818, mana, {}, {}, true, nullptr);
            }
            else
                spell->SendCastResult(SPELL_FAILED_FIZZLE);
        }
    }
};

SpellScript* GetScript_WarlockLifeTap(SpellEntry const*)
{
    return new WarlockLifeTapScript();
}

// 18280 - Curse of Agony Dummy
struct WarlockCurseOfAgonyDummyScript : SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_10_2
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            if (SpellEntry const* pSpellEntry = spell->m_triggeredByAuraSpell)
            {
                SpellCaster* pCaster = spell->m_caster;
                if (SpellAuraHolder const* pAuraHolder = spell->GetUnitTarget()->GetSpellAuraHolder(pSpellEntry->Id))
                    if (Unit* pAuraCaster = pAuraHolder->GetCaster())
                        pCaster = pAuraCaster;

                int32 damagePoint = spell->m_triggeredByAuraBasePoints;
                damagePoint = pCaster->SpellDamageBonusDone(spell->GetUnitTarget(), pSpellEntry, EFFECT_INDEX_0, damagePoint, DOT);
                pCaster->CastCustomSpell(spell->GetUnitTarget(), 18277, damagePoint, {}, {}, true);
            }
        }
#endif
    }
};

SpellScript* GetScript_WarlockCurseOfAgonyDummy(SpellEntry const*)
{
    return new WarlockCurseOfAgonyDummyScript();
}

void AddSC_warlock_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_warlock_demonic_sacrifice";
    newscript->GetSpellScript = &GetScript_WarlockDemonicSacrifice;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_conflagrate";
    newscript->GetSpellScript = &GetScript_WarlockConflagrate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_life_tap";
    newscript->GetSpellScript = &GetScript_WarlockLifeTap;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_curse_of_agony_dummy";
    newscript->GetSpellScript = &GetScript_WarlockCurseOfAgonyDummy;
    newscript->RegisterSelf();
}
