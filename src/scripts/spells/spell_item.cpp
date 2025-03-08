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

// 2833 - Heavy Armor Kit
struct HeavyArmorKitScript : public SpellScript
{
    SpellCastResult OnCheckCast(Spell* spell, bool strict) const final
    {
        Item* targetItem = spell->m_targets.getItemTarget();
        if (targetItem->GetProto()->ItemLevel < 15)
            return SPELL_FAILED_LOWLEVEL;
        return SPELL_CAST_OK;
    }
};

SpellScript* GetScript_HeavyArmorKit(SpellEntry const*)
{
    return new HeavyArmorKitScript();
}

// 8063 - Deviate Fish
struct DeviateFishScript : public SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (!spell->GetCaster())
                return;

            Player* pPlayer = spell->GetCaster()->ToPlayer();
            if (!pPlayer)
                return;

            uint32 randomSpellId = PickRandomValue(
                8064u, // Sleepy
                8065u, // Invigorate
                8066u, // Shrink
                8067u, // Party Time!
                8068u, // Healthy Spirit
                8070u  // Rejuvenation
            );

            pPlayer->CastSpell(pPlayer, randomSpellId, true, nullptr);
        }
    }
};

SpellScript* GetScript_DeviateFish(SpellEntry const*)
{
    return new DeviateFishScript();
}

// 8213 - Cooked Deviate Fish
struct CookedDeviateFishScript : public SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (!spell->GetCaster())
                return;

            Player* pPlayer = spell->GetCaster()->ToPlayer();
            if (!pPlayer)
                return;

            uint32 randomSpellId = 0;
            uint32 spells[6] = {
                (pPlayer->GetGender() == GENDER_MALE ? 8219u : 8220u), // Flip Out - ninja
                (pPlayer->GetGender() == GENDER_MALE ? 8221u : 8222u), // Yaaarrrr - pirate
                8223u, // Oops - goo
                8215u, // Rapid Cast
                8224u, // Cowardice
                8226u  // Fake Death
            };

            // Had additional effects before BWL patch.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_5_1
            randomSpellId = spells[urand(0, 5)];
#else
            randomSpellId = spells[urand(0, 1)];
#endif
            pPlayer->CastSpell(pPlayer, randomSpellId, true, nullptr);
        }
    }
};

SpellScript* GetScript_CookedDeviateFish(SpellEntry const*)
{
    return new CookedDeviateFishScript();
}

// 16589 - Noggenfogger Elixir
struct NoggenfoggerElixirScript : public SpellScript
{
    void OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (!spell->GetCaster())
                return;

            Player* pPlayer = spell->GetCaster()->ToPlayer();
            if (!pPlayer)
                return;

            // https://old.reddit.com/r/classicwow/comments/jwycmc/noggenfogger_1000_consumes_593_skellies_210_minis/
            uint32 randomSpellId = 16591; // skeleton (60%)
            switch (urand(1, 10))
            {
                case 1:
                case 2:
                {
                    randomSpellId = 16595; // mini (20%)
                    break;
                }
                case 3:
                case 4:
                {
                    randomSpellId = 16593; // slow fall (20%)
                    break;
                }
            }

            pPlayer->CastSpell(pPlayer, randomSpellId, true, nullptr);
        }
    }
};

SpellScript* GetScript_NoggenfoggerElixir(SpellEntry const*)
{
    return new NoggenfoggerElixirScript();
}

void AddSC_item_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_heavy_armor_kit";
    newscript->GetSpellScript = &GetScript_HeavyArmorKit;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_deviate_fish";
    newscript->GetSpellScript = &GetScript_DeviateFish;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_cooked_deviate_fish";
    newscript->GetSpellScript = &GetScript_CookedDeviateFish;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_noggenfogger_elixir";
    newscript->GetSpellScript = &GetScript_NoggenfoggerElixir;
    newscript->RegisterSelf();
}
