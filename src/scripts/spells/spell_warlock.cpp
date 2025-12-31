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
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
                    return true;
            }

            spell->m_casterUnit->CastSpell(spell->m_casterUnit, spellId, true);
        }
        return true;
    }
};

SpellScript* GetScript_WarlockDemonicSacrifice(SpellEntry const*)
{
    return new WarlockDemonicSacrificeScript();
}

// 17962, 18930, 18931, 18932 - Conflagrate
struct WarlockConflagrateScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        if (!spell->m_targets.getUnitTarget())
            return SPELL_FAILED_BAD_IMPLICIT_TARGETS;

        // for caster applied auras only
        bool found = false;
        Unit::AuraList const& auras = spell->m_targets.getUnitTarget()->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
        for (const auto periodicDamageAura : auras)
        {
            // Immolate
            if (periodicDamageAura->GetSpellProto()->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_IMMOLATE>() &&
                periodicDamageAura->GetCasterGuid() == spell->m_caster->GetObjectGuid())
            {
                found = true;
                break;
            }
        }

        if (!found)
            return SPELL_FAILED_TARGET_AURASTATE;

        return SPELL_CAST_OK;
    }

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            // for caster applied auras only
            Unit::AuraList const& auras = spell->GetUnitTarget()->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
            for (const auto i : auras)
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
        return true;
    }
};

SpellScript* GetScript_WarlockConflagrate(SpellEntry const*)
{
    return new WarlockConflagrateScript();
}

// 1454, 1455, 1456, 11687, 11688, 11689 - Life Tap
struct WarlockLifeTapScript : SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        float cost = spell->m_currentBasePoints[EFFECT_INDEX_0];

        if (Player* modOwner = spell->m_casterUnit->GetSpellModOwner())
            modOwner->ApplySpellMod(spell->m_spellInfo->Id, SPELLMOD_COST, cost, spell);

        float dmg = spell->m_casterUnit->SpellDamageBonusDone(spell->m_casterUnit, spell->m_spellInfo, EFFECT_INDEX_0, uint32(cost > 0 ? cost : 0), SPELL_DIRECT_DAMAGE);
        dmg = spell->m_casterUnit->SpellDamageBonusTaken(spell->m_casterUnit, spell->m_spellInfo, EFFECT_INDEX_0, dmg, SPELL_DIRECT_DAMAGE);

        // use cail as dithering might round up later.
        if (int32(spell->m_casterUnit->GetHealth()) <= std::ceil(dmg))
            return SPELL_FAILED_FIZZLE;

        return SPELL_CAST_OK;
    }

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
        return true;
    }
};

SpellScript* GetScript_WarlockLifeTap(SpellEntry const*)
{
    return new WarlockLifeTapScript();
}

// 18280 - Curse of Agony Dummy
struct WarlockCurseOfAgonyDummyScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
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
        return true;
    }
};

SpellScript* GetScript_WarlockCurseOfAgonyDummy(SpellEntry const*)
{
    return new WarlockCurseOfAgonyDummyScript();
}

// 19505, 19731, 19734, 19736 - Devour Magic
struct WarlockDevourMagicScript : SpellScript
{
    void OnSuccessfulDispel(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->m_casterUnit)
        {
            uint32 healSpell;
            switch (spell->m_spellInfo->Id)
            {
                case 19505:
                    healSpell = 19658;
                    break;
                case 19731:
                    healSpell = 19732;
                    break;
                case 19734:
                    healSpell = 19733;
                    break;
                case 19736:
                    healSpell = 19735;
                    break;
                default:
                    sLog.Out(LOG_SCRIPTS, LOG_LVL_DEBUG, "Spell for Devour Magic %d not handled in Spell::EffectDispel", spell->m_spellInfo->Id);
                    return;
            }
            spell->m_casterUnit->CastSpell(spell->m_casterUnit, healSpell, true);
        }
    }
};

SpellScript* GetScript_WarlockDevourMagic(SpellEntry const*)
{
    return new WarlockDevourMagicScript();
}

// 1122, 24670 - Inferno
struct WarlockInfernoScript : SpellScript
{
    void OnSummon(Spell* spell, Creature* summon) const final
    {
        // Enslave demon effect, without mana cost and cooldown
        spell->m_caster->CastSpell(summon, 20882, true);

        // Short root spell on infernal from sniffs
        summon->CastSpell(summon, 22707, true);

        // Inferno effect
        summon->CastSpell(summon, 22703, true);
    }
};

SpellScript* GetScript_WarlockInferno(SpellEntry const*)
{
    return new WarlockInfernoScript();
}

// 5699 - Create Healthstone
// 6201 - Create Healthstone (Minor)
// 6202 - Create Healthstone (Lesser)
// 11729 - Create Healthstone (Greater)
// 11730 - Create Healthstone (Major)
struct WarlockCreateHealthstoneScript : SpellScript
{
    enum
    {
        SPELL_IMPROVED_HEALTHSTONE_R1 = 18692,
        SPELL_IMPROVED_HEALTHSTONE_R2 = 18693,
    };

    uint32 GetItemId(Unit* pCaster, uint32 spellId) const
    {
        uint32 rank = 0;
        uint32 itemId;
        Unit::AuraList const& mDummyAuras = pCaster->GetAurasByType(SPELL_AURA_DUMMY);
        for (const auto aura : mDummyAuras)
        {
            if (aura->GetId() == SPELL_IMPROVED_HEALTHSTONE_R1)
            {
                rank = 1;
                break;
            }
            else if (aura->GetId() == SPELL_IMPROVED_HEALTHSTONE_R2)
            {
                rank = 2;
                break;
            }
        }

        static uint32 const items[5][3] =
        {
            { 5512, 19004, 19005 },              // Minor Healthstone
            { 5511, 19006, 19007 },              // Lesser Healthstone
            { 5509, 19008, 19009 },              // Healthstone
            { 5510, 19010, 19011 },              // Greater Healthstone
            { 9421, 19012, 19013 },              // Major Healthstone
        };

        switch (spellId)
        {
            case  6201:
                itemId = items[0][rank];
                break; // Minor Healthstone
            case  6202:
                itemId = items[1][rank];
                break; // Lesser Healthstone
            case  5699:
                itemId = items[2][rank];
                break; // Healthstone
            case 11729:
                itemId = items[3][rank];
                break; // Greater Healthstone
            case 11730:
                itemId = items[4][rank];
                break; // Major Healthstone
            default:
                sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Unknown rank of Create Healthstone with spell id %u.", spellId);
                itemId = 0;
                break;
        }

        return itemId;
    }

    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        Player* pCaster = spell->m_caster->ToPlayer();
        if (!pCaster)
            SPELL_CAST_OK;

        uint32 const itemId = GetItemId(pCaster, spell->m_spellInfo->Id);
        if (!itemId)
            return SPELL_CAST_OK;

        ItemPosCountVec dest;
        InventoryResult msg = pCaster->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, itemId, 1);
        if (msg != EQUIP_ERR_OK)
        {
            pCaster->SendEquipError(msg, nullptr, nullptr, itemId);
            return SPELL_FAILED_DONT_REPORT;
        }

        return SPELL_CAST_OK;
    }

    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        if (!spell->GetUnitTarget())
            return true;

        uint32 const itemId = GetItemId(spell->GetUnitTarget(), spell->m_spellInfo->Id);
        if (!itemId)
            return true;
        
        spell->DoCreateItem(effIdx, itemId);
        return true;
    }
};

SpellScript* GetScript_WarlockCreateHealthstone(SpellEntry const*)
{
    return new WarlockCreateHealthstoneScript();
}

// 698 - Ritual of Summoning
struct WarlockRitualOfSummoningScript : public SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool /*strict*/) const final
    {
        Player* caster = spell->m_caster->ToPlayer();
        if (!caster)
            return SPELL_FAILED_BAD_TARGETS;

        if (!caster->GetSelectionGuid())
            return SPELL_FAILED_BAD_TARGETS;

        Player* target = sObjectMgr.GetPlayer(caster->GetSelectionGuid());
        if (!target || caster == target || !target->IsInSameRaidWith(caster))
            return SPELL_FAILED_BAD_TARGETS;

        if (target->IsInCombat())
            return SPELL_FAILED_TARGET_IN_COMBAT;

        // check if our map is dungeon
        MapEntry const* mapEntry = sMapStorage.LookupEntry<MapEntry>(caster->GetMapId());
        if (mapEntry && mapEntry->IsDungeon())
        {
            if (caster->GetMap() != target->GetMap())
                return SPELL_FAILED_TARGET_NOT_IN_INSTANCE;
        }
        else if (caster->InBattleGround())
            return SPELL_FAILED_NOT_HERE;

        return SPELL_CAST_OK;
    }
};

SpellScript* GetScript_WarlockRitualOfSummoning(SpellEntry const*)
{
    return new WarlockRitualOfSummoningScript();
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

    newscript = new Script;
    newscript->Name = "spell_warlock_devour_magic";
    newscript->GetSpellScript = &GetScript_WarlockDevourMagic;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_inferno";
    newscript->GetSpellScript = &GetScript_WarlockInferno;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_create_healthstone";
    newscript->GetSpellScript = &GetScript_WarlockCreateHealthstone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_warlock_ritual_of_summoning";
    newscript->GetSpellScript = &GetScript_WarlockRitualOfSummoning;
    newscript->RegisterSelf();
}
