/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
#include "naxxramas.h"

enum
{
    // No emotes in vanilla afaik
    //EMOTE_AURA_BLOCKING = -1533143,
    //EMOTE_AURA_FADING   = -1533145,
    //EMOTE_AURA_WANE     = -1533144,

    SPELL_CORRUPTED_MIND  = 29201, // this triggers the following spells on targets (based on class): 29185, 29194, 29196, 29198
    SPELL_POISON_AURA     = 29865,
    SPELL_INEVITABLE_DOOM = 29204,
    SPELL_REMOVE_CURSE    = 30281, // He periodically removes all curses on himself

    NPC_SPORE             = 16286,
};

enum Events
{
    EVENT_SUMMON_SPORE = 1,
    EVENT_CORRUPTED_MIND,
    EVENT_POISON_AURA,
    EVENT_INEVITABLE_DOOM,
    EVENT_REMOVE_CURSE
};

// Can't really see much of a system in where the spores spawn.
// In guides it say "oposite side of where the majority of the raid stands".
// Unless this is a snapshot check by the boss on pull, which it dosent seem to be based on videos,
// it simply seems like one of 2 (potentially 4) location is chosed at random on pull, after that it's
// constantly spawning there throughout the fight.
// Presumably spell 29234 was used, it has a radius of 70yd. Can't figure out exactly how it would have been used though.
static constexpr float SporeLocs[2][3] = 
{
    {2951.0f, -4016.0f, 274.0f},
    {2870.0f, -3978.0f, 274.0f}
};

struct boss_loathebAI : public ScriptedAI
{
    boss_loathebAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        int randLoc = urand(0, 1);
        for (int i = 0; i < 3; i++)
            SporeLoc[i] = SporeLocs[randLoc][i];

        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint32 m_uiSummonTimer;

    EventMap events;
    uint32 numDooms;
    float SporeLoc[3];

    void Reset()
    {
        events.Reset();
        numDooms = 0;
    }

    void Aggro(Unit* pWho)
    {
        numDooms = 0;
        events.ScheduleEvent(EVENT_SUMMON_SPORE,    Seconds(13));
        events.ScheduleEvent(EVENT_CORRUPTED_MIND,  Seconds(5));
        events.ScheduleEvent(EVENT_POISON_AURA,     Seconds(5));
        events.ScheduleEvent(EVENT_INEVITABLE_DOOM, Minutes(2));
        events.ScheduleEvent(EVENT_REMOVE_CURSE,    Seconds(2));
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LOATHEB, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LOATHEB, DONE);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LOATHEB, FAIL);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        
        if (!m_pInstance->HandleEvadeOutOfHome(m_creature))
            return;

        events.Update(uiDiff);
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_SUMMON_SPORE:
                if (Creature* pSpore = m_creature->SummonCreature(NPC_SPORE, SporeLoc[0], SporeLoc[1], SporeLoc[2], 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000))
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                        pSpore->AddThreat(pTarget);
                }
                events.Repeat(Seconds(13));
                break;
            case EVENT_CORRUPTED_MIND:
                // https://www.youtube.com/watch?v=a0z9qjLxD98&list=PLYsWP02PY54A3RkEJv_VaT-0ZhfMs5zxN&index=4
                // shows it refreshing every ~10 sec
                DoCastAOE(SPELL_CORRUPTED_MIND, false);
                events.Repeat(Seconds(10));
                break;
            case EVENT_POISON_AURA:
                DoCastAOE(SPELL_POISON_AURA, false);
                events.Repeat(Seconds(12));
                break;
            case EVENT_INEVITABLE_DOOM:
                DoCastAOE(SPELL_INEVITABLE_DOOM);
                ++numDooms;
                // 2, 2:30, 3, 3:30, 4, 4:30, 5
                // after 7 dooms, or 5 minutes into the fight,
                // the doom timer becomes 15 instead of 30 seconds.
                if(numDooms > 6)
                    events.Repeat(Seconds(15));
                else
                    events.Repeat(Seconds(30));
                break;
            case EVENT_REMOVE_CURSE:
                // The remove curse part was added to prevent the boss from being super easy by stacking spriests.
                // I have not seen any videos where curse of elements etc is dispelled. Its unknown if he should cast
                // decurse regardless of vamperic embrace or not, but my assumption is he only does it if he has 
                // vamperic embrace on, so curse of elements etc an still be up.
                if (m_creature->HasAura(15286)) // vamperic embrace
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_REMOVE_CURSE) == CAST_OK)
                        events.Repeat(Seconds(1));
                    else
                        events.Repeat(100);
                }
                break;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_loatheb(Creature* pCreature)
{
    return new boss_loathebAI(pCreature);
}

void AddSC_boss_loatheb()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_loatheb";
    NewScript->GetAI = &GetAI_boss_loatheb;
    NewScript->RegisterSelf();
}
