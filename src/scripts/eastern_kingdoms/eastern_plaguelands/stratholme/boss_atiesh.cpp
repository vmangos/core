/* Copyright (C) 2017 Light's Hope <https://github.com/lightshope/>
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


enum eSpells
{
    SPELL_THRASH = 12787, // 35% chance on attack. 8876 for 15%, 3417 for 10%
    SPELL_SHADOW_BOLT = 19729,
    SPELL_UNHOLY_AURA = 28340,
    //SPELL_BREATH_OF_SARGERAS		= 28342, // Used by SPELL_BREATH_OF_SARGERAS_SCRIPT script-effect
    SPELL_BREATH_OF_SARGERAS_SCRIPT = 28352,
    SPELL_REAPER_OF_SOULS_DND = 28355, // summon the sword gobj
    //SPELL_ANTIMAGIC_PULSE			= 29463, // Can't seem to see this being used in any videos
};

enum eEvents
{
    EVENT_UNHOLY_AURA = 1,
    EVENT_BREATH_OF_SARGERAS,
    EVENT_ANTIMAGIC_PULSE,
    EVENT_SHADOW_BOLT,
};

struct boss_atiesh : public ScriptedAI
{
    EventMap events;
    bool hasBeenDisarmed;
    bool hasDoneSpawnCast;
    
    boss_atiesh(Creature* pCreature) : ScriptedAI(pCreature)
    {
        hasDoneSpawnCast = false;
        Reset();
    }

    void Reset() override
    {
        events.Reset();
        hasBeenDisarmed = false;
        m_creature->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 22738);
    }

    void Aggro(Unit* pWho) override
    {
        events.ScheduleEvent(EVENT_BREATH_OF_SARGERAS, Seconds(15));
        events.ScheduleEvent(EVENT_SHADOW_BOLT, Seconds(1));
    }

    void SpellHit(Unit*, const SpellEntry* spell) override
    {
        // look for disarm, drop a weapon
        if (!hasBeenDisarmed && spell->IsAuraAddedBySpell(SPELL_AURA_MOD_DISARM))
        {
            hasBeenDisarmed = true;
            // Summon the gobj with the sword
            m_creature->CastSpell(m_creature, SPELL_REAPER_OF_SOULS_DND, true);
            m_creature->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 0);
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!hasDoneSpawnCast)
        {
            m_creature->CastSpell(m_creature, 24240, true);
            hasDoneSpawnCast = true;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_creature->HasAura(SPELL_UNHOLY_AURA))
            DoCastSpellIfCan(m_creature, SPELL_UNHOLY_AURA);
        if (!m_creature->HasAura(SPELL_THRASH))
            DoCastSpellIfCan(m_creature, SPELL_THRASH);

        events.Update(diff);
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_UNHOLY_AURA:
                break;
            case EVENT_BREATH_OF_SARGERAS:
                if (DoCastSpellIfCan(m_creature, SPELL_BREATH_OF_SARGERAS_SCRIPT) == CAST_OK)
                    events.Repeat(Seconds(urand(15, 25)));
                else
                    events.Repeat(100);
                break;
            case EVENT_SHADOW_BOLT:
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_SHADOW_BOLT))
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_SHADOW_BOLT) == CAST_OK)
                    {
                        events.Repeat(Seconds(urand(13, 18)));
                        break;
                    }
                }
                events.Repeat(100);
                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_atiesh(Creature* pCreature)
{
    return new boss_atiesh(pCreature);
}

void AddSC_boss_atiesh()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_atiesh";
    newscript->GetAI = &GetAI_boss_atiesh;
    newscript->RegisterSelf();
}
