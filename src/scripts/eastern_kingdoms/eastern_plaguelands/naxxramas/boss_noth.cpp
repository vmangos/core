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

// Rewritten completely by Gemt

#include "scriptPCH.h"
#include "naxxramas.h"
#include "Duration.h"

#include <algorithm>

// https://pastebin.com/AXPeUXub
// pastbin link above has various noted timers and sources. Not much useful, but it's some of my notes
// from when researching the encounter.

// Regarding summoning add spells, there are a few spells which summon both two types of mobs, 
// or multiple of the same mob in different locations with the same spell. However
// our core does not support multiple spell target coordinates due to limitations with the DB, so 
// we have to use the spells which summon a single creature.
enum eSpell
{
    SPELL_TP_CENTER           = 29231,
    SPELL_TP_BALC             = 29216,
    SPELL_CRIPPLE             = 29212, // used on players where noth blinked FROM 
    SPELL_CURSE_PLAGUEBRINGER = 29213,
    SPELL_IMMUNE_ALL          = 29230, // used on TP to balc

    SPELL_BLINK_1 = 29208,
    SPELL_BLINK_2 = 29209,
    SPELL_BLINK_3 = 29210,
    SPELL_BLINK_4 = 29211,

    SPELL_SUM_WARR_SW = 29247,
    SPELL_SUM_WARR_NW = 29248,
    SPELL_SUM_WARR_NE = 29249,

    SPELL_SUM_CHAMP_SW1 = 29217,
    SPELL_SUM_CHAMP_SW2 = 29224,
    SPELL_SUM_CHAMP_SW3 = 29225,
    SPELL_SUM_CHAMP_SW4 = 29227,
    
    SPELL_SUM_CHAMP_W   = 29238,
    
    SPELL_SUM_CHAMP_NW1 = 29255,
    SPELL_SUM_CHAMP_NW2 = 29267,
    SPELL_SUM_CHAMP_NW3 = 29257,
    
    SPELL_SUM_CHAMP_NE1 = 29258,
    SPELL_SUM_CHAMP_NE2 = 29262,
    
    SPELL_SUM_GUARD_NE = 29226,
    SPELL_SUM_GUARD_NW = 29239,
    SPELL_SUM_GUARD_SW1 = 29256,
    SPELL_SUM_GUARD_SW2 = 29268,
};

static const uint32 ChampionSpells[10] =
{
    //g1
    SPELL_SUM_CHAMP_SW1,
    SPELL_SUM_CHAMP_SW2,
    SPELL_SUM_CHAMP_SW3,
    SPELL_SUM_CHAMP_SW4,
    //g2
    SPELL_SUM_CHAMP_W,
    SPELL_SUM_CHAMP_NW1,
    SPELL_SUM_CHAMP_NW2,
    SPELL_SUM_CHAMP_NW3,
    //g3
    SPELL_SUM_CHAMP_NE1,
    SPELL_SUM_CHAMP_NE2,
};

static const uint8 g1_start = 0, g1_size = 4;
static const uint8 g2_start = 4, g2_size = 4;
static const uint8 g3_start = 8, g3_size = 2;

static const uint32 GuardianSpells[4] =
{
    SPELL_SUM_GUARD_NE,
    SPELL_SUM_GUARD_NW,
    SPELL_SUM_GUARD_SW1,
    SPELL_SUM_GUARD_SW2,
};

enum eScriptText
{
    SAY_AGGRO1                          = -1533075,
    SAY_AGGRO2                          = -1533076,
    SAY_AGGRO3                          = -1533077,
    SAY_SUMMON                          = -1533078,

    SAY_SLAY1                           = -1533079,
    SAY_SLAY2                           = -1533080,
    SAY_DEATH                           = -1533081,

    // Emotes probably only wotlk
    //EMOTE_WARRIOR                       = -1533130,
    //EMOTE_SKELETON                      = -1533131,
    //EMOTE_TELEPORT                      = -1533132,
    //EMOTE_TELEPORT_RETURN               = -1533133,
};

enum eNPCs
{
    NPC_PLAGUED_GUARDIAN  = 16981,
    NPC_PLAGUED_CONSTRUCT = 16982, // unknown if this was ever used
    NPC_PLAGUED_CHAMPION  = 16983,
    NPC_PLAGUED_WARRIOR   = 16984,
};

enum eEvents
{
    EVENT_BLINK = 1,
    EVENT_CURSE,
    EVENT_TP_BALC,
    EVENT_TP_GROUND,
    EVENT_RMV_INVULN,
    EVENT_BALC_ADDS,
    EVENT_WARRIORS
};

struct boss_nothAI : public ScriptedAI
{
    boss_nothAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;
    uint8 phaseCounter;

    EventMap m_events;

    void Reset()
    {
        phaseCounter = 0;
        m_events.Reset();
    }
    
    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_NOTH, FAIL);

        std::list<Creature*> clist;
        GetCreatureListWithEntryInGrid(clist, m_creature, { NPC_PLAGUED_GUARDIAN, NPC_PLAGUED_CONSTRUCT, NPC_PLAGUED_CHAMPION, NPC_PLAGUED_WARRIOR }, 150.0f);
        for (Creature* pC : clist)
        {
            pC->DeleteLater();
        }
    }

    void Aggro(Unit* pWho)
    {
        sLog.outBasic("aggro");
        m_creature->SetInCombatWithZone();

        m_events.ScheduleEvent(EVENT_CURSE,    Seconds(urand(8,12)));
        m_events.ScheduleEvent(EVENT_BLINK,    Seconds(urand(30,40)));
        m_events.ScheduleEvent(EVENT_WARRIORS, Seconds(10));
        m_events.ScheduleEvent(EVENT_TP_BALC,  Seconds(90));

        DoScriptText(urand(SAY_AGGRO3, SAY_AGGRO1), m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_NOTH, IN_PROGRESS);
    }

    void SpawnWarriorsAndRepeatEvent()
    {
        DoScriptText(SAY_SUMMON, m_creature);

        DoCastSpellIfCan(m_creature, SPELL_SUM_WARR_SW, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, SPELL_SUM_WARR_NW, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, SPELL_SUM_WARR_NE, CAST_TRIGGERED);

        m_events.Repeat(Seconds(30));
    }

    void BlinkAndRepeatEvent()
    {
        static uint32 const auiSpellBlink[4] =
        {
            SPELL_BLINK_1, SPELL_BLINK_2, SPELL_BLINK_3, SPELL_BLINK_4
        };

        DoCastSpellIfCan(m_creature, SPELL_CRIPPLE, CAST_TRIGGERED | CAST_FORCE_CAST);
        DoCastSpellIfCan(m_creature, auiSpellBlink[urand(0, 3)], CAST_TRIGGERED|CAST_FORCE_CAST);
        m_events.Repeat(Seconds(urand(30, 40)));
        DoResetThreat();
        if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            AttackStart(target);
    }

    void CurseAndRepeatEvent()
    {
        // From what I can understand, the plague should always target the current target,
        // and will then also target the next 19 closest players to the current target
        if (Unit* pTarget = m_creature->getVictim())
        {
            DoCastSpellIfCan(pTarget, SPELL_CURSE_PLAGUEBRINGER);
            m_events.Repeat(Seconds(urand(50,60))); //It's somewhere around 50seconds+

        }
        else {
            m_events.Repeat(100);
        }
    }

    void TeleportToBalc()
    {
        if (DoCastSpellIfCan(m_creature, SPELL_TP_BALC, CAST_TRIGGERED|CAST_FORCE_CAST) != CAST_OK)
        {
            m_events.Repeat(100); // try again
            return;
        }

        m_events.Reset();

        // 70, 95 and 120 seconds for 1st, 2nd and 3rd balc phase respectively.
        m_events.ScheduleEvent(EVENT_TP_GROUND, Seconds(70 + 25 * phaseCounter));

        auto first_spawn = Seconds(urand(5, 7));
        m_events.ScheduleEvent(EVENT_BALC_ADDS, first_spawn);
        m_events.ScheduleEvent(EVENT_BALC_ADDS, first_spawn + Seconds(25+urand(0,5)));

        m_creature->CastSpell(m_creature, SPELL_IMMUNE_ALL, true);

        m_creature->GetMotionMaster()->MoveIdle();
        DoStopAttack();
    }

    void TeleportFromBalc()
    {
        if (DoCastSpellIfCan(m_creature, SPELL_TP_CENTER, CAST_TRIGGERED) != CAST_OK)
        {
            m_events.Repeat(100); // try again
            return;
        }

        m_events.Reset();
        m_events.ScheduleEvent(EVENT_RMV_INVULN, Seconds(2));
    }

    void Summon4Champions()
    {
        // We need to spawn 4 champions. We have 10 different possible locations,
        // and the adds need to be somewhat evenly spread out, yet somewhat randomized.

        std::vector<uint32> champs(ChampionSpells, ChampionSpells + sizeof(ChampionSpells)/sizeof(uint32));
        
        // First selecting one random champ from each of the 3 main groups
        uint32 champ1 = champs[urand(g1_start, g1_start+g1_size-1)];
        uint32 champ2 = champs[urand(g2_start, g2_start+g2_size-1)];
        uint32 champ3 = champs[urand(g3_start, g3_start+g3_size-1)];
        
        // Moving the selected champions to the end of the vector
        std::remove(champs.begin(), champs.end(), champ1);
        std::remove(champs.begin(), champs.end(), champ2);
        std::remove(champs.begin(), champs.end(), champ3);

        // Summoning the selected 3 guardians
        DoCastSpellIfCan(m_creature, champ1, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, champ2, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, champ3, CAST_TRIGGERED);
        
        // Choosing the final champion at random between the remaining 7 locations
        uint32 champ4 = champs[urand(0, 6)];
        DoCastSpellIfCan(m_creature, champ4, CAST_TRIGGERED);
    }

    void Summon2Guardians()
    {
        // Choose one of two locations south-west, and either the north-east or north-west location
        DoCastSpellIfCan(m_creature, urand(0, 1) ? SPELL_SUM_GUARD_SW1 : SPELL_SUM_GUARD_SW1, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, urand(0, 1) ? SPELL_SUM_GUARD_NE : SPELL_SUM_GUARD_NW, CAST_TRIGGERED);
    }

    void SpawnBalcAdds()
    {
        DoScriptText(SAY_SUMMON, m_creature);
        switch (phaseCounter)
        {
        case 0:
            Summon4Champions();
            break;
        case 1:
            Summon4Champions();
            Summon2Guardians();
            break;
        default:
            // Sources for what happens in a third+ balcony phase is missing. In wotlk he would enrage, but 
            // in vanilla all we know is "you get overrun". 
            // Presumption then is there should be no surviving this wave, so a suggestion is to just use every
            // single summon spell
            for(int i = 0; i < 10; i++)
                DoCastSpellIfCan(m_creature, ChampionSpells[i], CAST_TRIGGERED);
            for (int i = 0; i < 4; i++)
                DoCastSpellIfCan(m_creature, GuardianSpells[i], CAST_TRIGGERED);
            break;
        }
    }

    void OnRemoveVulnerability()
    {
        m_events.Reset();

        m_events.ScheduleEvent(EVENT_BLINK,    Seconds(urand(2, 10)));
        m_events.ScheduleEvent(EVENT_CURSE,    Seconds(urand(2, 10)));
        m_events.ScheduleEvent(EVENT_WARRIORS, Seconds(urand(2,10)));
        m_creature->RemoveAurasDueToSpell(SPELL_IMMUNE_ALL);

        DoResetThreat();
        if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            AttackStart(target);

        // note that we increment phaseCounter here
        switch (++phaseCounter) 
        {
        // case 0: won't happen, its initialized from Aggro()
        case 1:
            m_events.ScheduleEvent(EVENT_TP_BALC, Seconds(110));
            break;
        case 2:
            m_events.ScheduleEvent(EVENT_TP_BALC, Seconds(180));
            break;
        default:
            // No good sources on duration of 4th ground phase, all guides explain it as a wipe
            // if you don't kill him during the 3rd ground phase. We'll just repeat previous phase logic
            // after this. It's highly unlikely that any guild get to this stage without killing him or wiping.
            m_events.ScheduleEvent(EVENT_TP_BALC, Seconds(180));
            //sLog.outError("boss_nothAI::OnRemoveVulnerability() called with phaseCounter: %d", phaseCounter);
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->SetInCombatWithZone();
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(urand(0, 1) ? SAY_SLAY1 : SAY_SLAY2, m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_NOTH, DONE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        bool isOnBalc = m_creature->HasAura(SPELL_IMMUNE_ALL);
        if (!isOnBalc)
        {
            if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
                return;
            if (!m_pInstance->HandleEvadeOutOfHome(m_creature))
                return;
        }
        else
        {
            // Will make him TP down rather thank walk through the air on a reset/wipe
            if (m_creature->getThreatManager().isThreatListEmpty())
            {
                if (m_events.GetTimeUntilEvent(EVENT_RMV_INVULN) > 2000)
                {
                    TeleportFromBalc();
                }
            }
        }
        

        m_events.Update(uiDiff);
        while (auto l_EventId = m_events.ExecuteEvent())
        {
            switch (l_EventId)
            {
            case EVENT_BLINK:
                BlinkAndRepeatEvent();
                break;
            case EVENT_CURSE:
                CurseAndRepeatEvent();
                break;
            case EVENT_TP_BALC:
                TeleportToBalc();
                break;
            case EVENT_TP_GROUND:
                TeleportFromBalc();
                break;
            case EVENT_RMV_INVULN:
                OnRemoveVulnerability();
                break;
            case EVENT_BALC_ADDS:
                SpawnBalcAdds();
                break;
            case EVENT_WARRIORS:
                SpawnWarriorsAndRepeatEvent();
                break;
            }
        }
        if (!isOnBalc)
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_noth(Creature* pCreature)
{
    return new boss_nothAI(pCreature);
}

void AddSC_boss_noth()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_noth";
    NewScript->GetAI = &GetAI_boss_noth;
    NewScript->RegisterSelf();
}
