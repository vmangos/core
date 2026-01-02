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

// 8026, 8028, 8029, 8248, 8253, 10445, 10523, 16343, 16344, 16389 - Flametongue Weapon/Totem Proc
struct ShamanFlametongueProcDummyScript : SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0 && spell->GetUnitTarget())
        {
            if (!spell->m_CastItem)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Spell::EffectDummy: spell %i requires cast Item", spell->m_spellInfo->Id);
                return false;
            }

            // found spelldamage coefficients of 0.381% per 0.1 speed and 15.244 per 4.0 speed
            // but own calculation say 0.385 gives at most one point difference to published values
            float spellDamage = spell->m_caster->SpellBaseDamageBonusDone(spell->m_spellInfo->GetSpellSchoolMask());
            float weaponSpeed = (1.0f / float(IN_MILLISECONDS)) * spell->m_CastItem->GetProto()->Delay;
            float totalDamage = (spell->damage + 3.85f * spellDamage) * 0.01f * weaponSpeed;

            spell->m_caster->CastCustomSpell(spell->GetUnitTarget(), 10444, dither(totalDamage), {}, {}, true, spell->m_CastItem);
        }
        return true;
    }
};

SpellScript* GetScript_ShamanFlametongueProcDummy(SpellEntry const*)
{
    return new ShamanFlametongueProcDummyScript();
}

// 16191 - Mana Tide
struct ShamanManaTideAuraScript : public AuraScript
{
    void OnPeriodicTrigger(Aura* aura, Unit* /*caster*/, Unit* target, WorldObject* /*targetObject*/, SpellEntry const*& spellInfo) final
    {
        // Cast custom spell with dithered amount instead of default trigger
        uint32 triggerSpellId = aura->GetSpellProto()->EffectTriggerSpell[aura->GetEffIndex()];
        if (triggerSpellId)
        {
            int32 ditheredAmount = dither(aura->GetModifier()->m_amount);
            target->CastCustomSpell(target, triggerSpellId, ditheredAmount, {}, {}, true, nullptr, aura);
            // Prevent default cast
            spellInfo = nullptr;
        }
    }
};

AuraScript* GetScript_ShamanManaTide(SpellEntry const*)
{
    return new ShamanManaTideAuraScript();
}

void AddSC_shaman_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_shaman_flametongue_proc_dummy";
    newscript->GetSpellScript = &GetScript_ShamanFlametongueProcDummy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_shaman_mana_tide";
    newscript->GetAuraScript = &GetScript_ShamanManaTide;
    newscript->RegisterSelf();
}
