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


// 12472 - Cold Snap
struct MageColdSnapScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (spell->m_caster->GetTypeId() != TYPEID_PLAYER)
                return false;

            // immediately finishes the cooldown on Frost spells
            auto cdCheck = [](SpellEntry const & spellEntry) -> bool
            {
                if (spellEntry.SpellFamilyName != SPELLFAMILY_MAGE)
                    return false;
                if ((spellEntry.GetSpellSchoolMask() & SPELL_SCHOOL_MASK_FROST) && spellEntry.GetRecoveryTime() > 0)
                    return true;
                return false;
            };
            static_cast<Player*>(spell->m_caster)->RemoveSomeCooldown(cdCheck);
        }
        return true;
    }
};

SpellScript* GetScript_MageColdSnap(SpellEntry const*)
{
    return new MageColdSnapScript();
}

// 11119, 11120, 12846, 12847, 12848 - Ignite
struct MageIgniteScript : public AuraScript
{
    enum
    {
        SPELL_DOT           = 12654,
        SPELL_TALENT_RANK_1 = 11119,
        SPELL_TALENT_RANK_2 = 11120,
        SPELL_TALENT_RANK_3 = 12846,
        SPELL_TALENT_RANK_4 = 12847, 
        SPELL_TALENT_RANK_5 = 12848,
    };

    optional<SpellAuraProcResult> OnProc(Unit* pOwner, Unit* pVictim, uint32 /*amount*/, int32 originalAmount, Aura* triggeredByAura, SpellEntry const* /*procSpell*/, uint32 /*procFlag*/, uint32 /*procEx*/, uint32 cooldown) final
    {
        uint32 totalDamage = originalAmount;
        int32 basePoints[MAX_SPELL_EFFECTS] = {};

        switch (triggeredByAura->GetSpellProto()->Id)
        {
            case SPELL_TALENT_RANK_1:
                basePoints[0] = int32(0.04f * totalDamage);
                break;
            case SPELL_TALENT_RANK_2:
                basePoints[0] = int32(0.08f * totalDamage);
                break;
            case SPELL_TALENT_RANK_3:
                basePoints[0] = int32(0.12f * totalDamage);
                break;
            case SPELL_TALENT_RANK_4:
                basePoints[0] = int32(0.16f * totalDamage);
                break;
            case SPELL_TALENT_RANK_5:
                basePoints[0] = int32(0.20f * totalDamage);
                break;
            default:
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MageIgniteScript: non handled spell id: %u", triggeredByAura->GetId());
                return SPELL_AURA_PROC_FAILED;
        }

        // Get current Ignite Aura if exist
        Aura* igniteAura = pVictim->GetAura(SPELL_DOT, EFFECT_INDEX_0);

        if (igniteAura)
        {
            Modifier *igniteModifier = igniteAura->GetModifier();
            SpellAuraHolder* igniteHolder = igniteAura->GetHolder();

            int32 tickDamage = igniteModifier->m_amount;
            bool notAtMaxStack = igniteAura->GetStackAmount() < 5;
            bool reapplyIgnite = igniteAura->GetAuraTicks() >= igniteAura->GetAuraMaxTicks();

            if (!reapplyIgnite)
            {
                if (notAtMaxStack)
                {
                    tickDamage += basePoints[0];
                    igniteHolder->ModStackAmount(1);

                    // Update DOT damage
                    igniteModifier->m_amount = tickDamage;
                    igniteAura->ApplyModifier(true, true, false);
                }
                else
                    igniteHolder->SetStackAmount(5);

                // Refresh Ignite Stack
                igniteHolder->Refresh(igniteAura->GetCaster(), pVictim, igniteHolder);

                return SPELL_AURA_PROC_OK;
            }

            // All damage done, remove and continue to reapply
            pVictim->RemoveAurasDueToSpell(SPELL_DOT);
        }

        // No Ignite found, apply Ignite Aura
        return pOwner->TriggerProccedSpell(pVictim, basePoints, SPELL_DOT, nullptr, triggeredByAura, cooldown);
    }
};

AuraScript* GetScript_MageIgnite(SpellEntry const*)
{
    return new MageIgniteScript();
}

void AddSC_mage_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_mage_cold_snap";
    newscript->GetSpellScript = &GetScript_MageColdSnap;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_mage_ignite";
    newscript->GetAuraScript = &GetScript_MageIgnite;
    newscript->RegisterSelf();
}
