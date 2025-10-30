/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include "scriptPCH.h"
#include "Pet.h"

// Test for Insta-Kill on own pet
struct InstaKillPetTest : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const final
    {
        if (effIdx == EFFECT_INDEX_0)
        {
            if (Player* pPlayer = spell->GetCaster()->ToPlayer())
            {
                Pet* pPet = pPlayer->GetPet();
                if (pPet && spell->GetUnitTarget() == pPet)
                {
                    // If the spell is correctly handled, it should finish without crashing.
                    // We can verify this by checking if the pet is still alive.
                    if (pPet->IsAlive())
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Insta-kill pet test passed.");
                    }
                    else
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Insta-kill pet test failed.");
                    }
                }
            }
        }
        return true;
    }
};

SpellScript* GetScript_InstaKillPetTest(SpellEntry const*)
{
    return new InstaKillPetTest();
}

void AddSC_test_spell_scripts()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "spell_insta_kill_pet_test";
    newscript->GetSpellScript = &GetScript_InstaKillPetTest;
    newscript->RegisterSelf();
}
