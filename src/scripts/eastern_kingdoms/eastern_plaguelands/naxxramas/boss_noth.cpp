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

/* ScriptData
SDName: Boss_Noth
SD%Complete: 60
SDComment: Summons need tuning, timers need tuning, need to add berserk "phase" after last skeleton phase
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    SAY_AGGRO1                          = -1533075,
    SAY_AGGRO2                          = -1533076,
    SAY_AGGRO3                          = -1533077,
    SAY_SUMMON                          = -1533078,

    SAY_SLAY1                           = -1533079,
    SAY_SLAY2                           = -1533080,
    SAY_DEATH                           = -1533081,

    EMOTE_WARRIOR                       = -1533130,
    EMOTE_SKELETON                      = -1533131,
    EMOTE_TELEPORT                      = -1533132,
    EMOTE_TELEPORT_RETURN               = -1533133,

    

    SPELL_BLINK_1                       = 29208,
    SPELL_BLINK_2                       = 29209,
    SPELL_BLINK_3                       = 29210,
    SPELL_BLINK_4                       = 29211,

    

    // these also need target coords
    SPELL_SUMMON_WARRIOR_1              = 29247,
    SPELL_SUMMON_WARRIOR_2              = 29248,
    SPELL_SUMMON_WARRIOR_3              = 29249,

    SPELL_SUMMON_WARRIOR_THREE          = 29237,

    // todo: these need target coordinates
    // they all need to be hostile
    SPELL_SUMMON_CHAMP01                = 29217,
    SPELL_SUMMON_CHAMP02                = 29224,
    SPELL_SUMMON_CHAMP03                = 29225,
    SPELL_SUMMON_CHAMP04                = 29227,

    SPELL_SUMMON_CHAMP05                = 29238,
    SPELL_SUMMON_CHAMP06                = 29255,
    SPELL_SUMMON_CHAMP07                = 29257,
    SPELL_SUMMON_CHAMP08                = 29258,
    SPELL_SUMMON_CHAMP09                = 29262,
    SPELL_SUMMON_CHAMP10                = 29267,

    SPELL_SUMMON_GUARD01                = 29226,
    SPELL_SUMMON_GUARD02                = 29239,
    SPELL_SUMMON_GUARD03                = 29256,
    SPELL_SUMMON_GUARD04                = 29268,

    PHASE_GROUND                        = 0,
    PHASE_BALCONY                       = 1,

    PHASE_SKELETON_1                    = 1,
    PHASE_SKELETON_2                    = 2,
    PHASE_SKELETON_3                    = 3,

    NPC_GUARDIAN  = 16981,
    NPC_CONSTRUCT = 16982, // not used afaik
    NPC_CHAMPION  = 16983,
    NPC_WARRIOR   = 16984,
};

static constexpr uint32 WarriorSpells[] = {29247, 29248, 29249};
static constexpr uint32 GuardianSpells[] = { 29226, 29239, 29256, 29268 };

enum Spells
{
    SPELL_CRIPPLE               = 29212, // used on players where noth blinked FROM 
    SPELL_CURSE_PLAGUEBRINGER   = 29213,

    SPELL_TELEPORT              = 29216,
    SPELL_TELEPORT_RETURN       = 29231,
};

enum Phases
{
    PHASE_NONE,
    PHASE_GROUND,
    PHASE_BALCONY
};

enum Events 
{
    EVENT_CURSE = 1,            // curse of the plaguebringer
    EVENT_BLINK,                // blink 
    EVENT_WARRIOR,              // summon warriors during ground phase
    EVENT_BALCONY,              // become untargetable and begin balcony phase
    EVENT_BALCONY_TELEPORT,     // actually teleport to balcony, this is slightly delayed
    EVENT_WAVE,                 // spawn wave during balcony phase
    EVENT_GROUND,               // end balcony phase and teleport to ground
    EVENT_GROUND_ATTACKABLE     // become attackable and aggressive again at start of ground phase, once again slightly delayed to prevent motionmaster weirdness
};

static const uint32 SUMMON_CD() { return 30000; }
static const uint32 BLINK_CD() { return urand(25000, 30000); }
static const uint32 CURSE_CD(bool initial) { return initial ? 4000 : 28000; }
static const uint32 WRATH_CD() { return 123; } // todo: missing completely

/*
Teleport/Champions - 90 sec after initial aggro Noth teleports to a balcony making him unreachable for DPS while on the ground two waves of Plagues Champions spawn. 
Once these waves are beaten or 70 seconds have passed, he teleports back down.

Teleport/Champions+Guardians - 110 sec after the 1st Teleport Noth teleports again to a balcony making him unreachable for DPS while on the ground two waves of 
Plagues Champions + Plagued Guardians spawn. Once these waves are beaten or 90 seconds have passed, he teleports back down. Plagued Guardians are immune to shackle.

Teleport/Guardians - 180 sec after the 2nd Teleport Noth teleports to a balcony making him unreachable for DPS while on the ground two waves of Plagues Guardians spawn.
Once these waves are beaten or ?? seconds have passed, he teleports back down. Plagued Guardians are immune to shackle.
*/
static const uint32 TELEPORT_CD() { return 90000; } // todo: supposedly longer cd after each blink?

/*
00:10 first of 3 waves of warriors
01:30 teleport to balcony, 2 waves of champions
02:40 teleport back into room
02:50 first of 5 waves of warriors
04:30 teleport to balcony, 2 mixed champion/guardian waves
06:00 teleport back into room
06:10 first of (7)? waves of warriors
09:00 tp to balcony (flame, death, destruction?)
*/
struct boss_nothAI : public ScriptedAI
{
    boss_nothAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint8 m_uiPhase;
    uint8 m_uiPhaseSub;
    uint32 m_uiPhaseTimer;

    uint32 m_uiBlinkTimer;
    uint32 m_uiCurseTimer;
    uint32 m_uiSummonTimer;

    uint32 balcPhaseCount;

    EventMap m_events;

    void Reset()
    {
        balcPhaseCount = 0;

        //m_uiPhase = PHASE_GROUND;
        //m_uiPhaseSub = PHASE_GROUND;
        //m_uiPhaseTimer = 110000;
        //m_uiBlinkTimer = 25000;
        //m_uiCurseTimer = 4000;
        //m_uiSummonTimer = 30000;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();

        m_events.ScheduleEvent(EVENT_SUMMON, SUMMON_CD());

        DoScriptText(urand(SAY_AGGRO3, SAY_AGGRO1), m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_NOTH, IN_PROGRESS);
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

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pCaster == m_creature && pSpell->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_LEAP)
            DoCastSpellIfCan(m_creature, SPELL_CRIPPLE);
    }

    void EnterPhaseGround()
    {
        m_events.SetPhase(PHASE_GROUND);

        DoZoneInCombat();

        if (me->getThreatManager().isThreatListEmpty())
            Reset();
        else
        {
            uint8 timeGround;
            switch (balconyCount)
            {
            case 0:
                timeGround = 90;
                break;
            case 1:
                timeGround = 110;
                break;
            case 2:
            default:
                timeGround = 180;
            }
            events.ScheduleEvent(EVENT_GROUND_ATTACKABLE, Seconds(2), 0, PHASE_GROUND);
            events.ScheduleEvent(EVENT_BALCONY, Seconds(timeGround), 0, PHASE_GROUND);
            events.ScheduleEvent(EVENT_CURSE, randtime(Seconds(10), Seconds(25)), 0, PHASE_GROUND);
            events.ScheduleEvent(EVENT_WARRIOR, randtime(Seconds(20), Seconds(30)), 0, PHASE_GROUND);
            if (GetDifficulty() == DIFFICULTY_25_N)
                events.ScheduleEvent(EVENT_BLINK, randtime(Seconds(20), Seconds(30)), 0, PHASE_GROUND);
        }
    }

    void SummonWave()
    {

    }

    void Blink()
    {

    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        
        m_events.Update(uiDiff);
        while (auto l_EventId = m_events.ExecuteEvent())
        {
            switch (l_EventId)
            {

            }
        }

        if (m_uiPhase == PHASE_GROUND)
        {
            if (m_uiPhaseTimer < uiDiff)
            {
                // TODO: avoid teleport when skeleton phases is ended

                if (DoCastSpellIfCan(m_creature, SPELL_TELEPORT) == CAST_OK)
                {
                    DoScriptText(EMOTE_TELEPORT, m_creature);
                    m_creature->GetMotionMaster()->MoveIdle();
                    m_uiPhaseTimer = 70000;
                    m_uiPhase = PHASE_BALCONY;
                    ++m_uiPhaseSub;
                    return;
                }
            }
            else
                m_uiPhaseTimer -= uiDiff;

            if (m_uiBlinkTimer < uiDiff)
            {
                static uint32 const auiSpellBlink[4] =
                {
                    SPELL_BLINK_1, SPELL_BLINK_2, SPELL_BLINK_3, SPELL_BLINK_4
                };

                if (DoCastSpellIfCan(m_creature, auiSpellBlink[urand(0, 3)]) == CAST_OK)
                {
                    DoResetThreat();
                    m_uiBlinkTimer = 25000;
                }
            }
            else
                m_uiBlinkTimer -= uiDiff;

            if (m_uiCurseTimer < uiDiff)
            {
                DoCastSpellIfCan(m_creature, SPELL_CURSE_PLAGUEBRINGER);
                m_uiCurseTimer = 28000;
            }
            else
                m_uiCurseTimer -= uiDiff;

            if (m_uiSummonTimer < uiDiff)
            {
                DoScriptText(SAY_SUMMON, m_creature);
                DoScriptText(EMOTE_WARRIOR, m_creature);

                static uint32 const auiSpellSummonPlaguedWarrior[3] =
                {
                    SPELL_SUMMON_WARRIOR_1, SPELL_SUMMON_WARRIOR_2, SPELL_SUMMON_WARRIOR_3
                };

                for (uint8 i = 0; i < 2; ++i)
                    DoCastSpellIfCan(m_creature, auiSpellSummonPlaguedWarrior[urand(0, 2)], CAST_TRIGGERED);

                m_uiSummonTimer = 30000;
            }
            else
                m_uiSummonTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
        else
        {
            if (m_uiPhaseTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_TELEPORT_RETURN) == CAST_OK)
                {
                    DoScriptText(EMOTE_TELEPORT_RETURN, m_creature);
                    m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                    m_uiPhaseTimer = 90000;
                    m_uiPhase = PHASE_GROUND;
                    return;
                }
            }
            else
                m_uiPhaseTimer -= uiDiff;

            if (m_uiSummonTimer < uiDiff)
            {
                DoScriptText(EMOTE_SKELETON, m_creature);

                static uint32 const auiSpellSummonPlaguedChampion[10] =
                {
                    SPELL_SUMMON_CHAMP01, SPELL_SUMMON_CHAMP02, SPELL_SUMMON_CHAMP03, SPELL_SUMMON_CHAMP04, SPELL_SUMMON_CHAMP05, SPELL_SUMMON_CHAMP06, SPELL_SUMMON_CHAMP07, SPELL_SUMMON_CHAMP08, SPELL_SUMMON_CHAMP09, SPELL_SUMMON_CHAMP10
                };

                static uint32 const auiSpellSummonPlaguedGuardian[4] =
                {
                    SPELL_SUMMON_GUARD01, SPELL_SUMMON_GUARD02, SPELL_SUMMON_GUARD03, SPELL_SUMMON_GUARD04
                };

                // A bit unclear how many in each sub phase, and if there are any clear difference in 25man
                switch (m_uiPhaseSub)
                {
                    case PHASE_SKELETON_1:
                    {
                        for (uint8 i = 0; i < 2; ++i)
                            DoCastSpellIfCan(m_creature, auiSpellSummonPlaguedChampion[urand(0, 9)], CAST_TRIGGERED);

                        break;
                    }
                    case PHASE_SKELETON_2:
                    {
                        DoCastSpellIfCan(m_creature, auiSpellSummonPlaguedChampion[urand(0, 9)], CAST_TRIGGERED);
                        DoCastSpellIfCan(m_creature, auiSpellSummonPlaguedGuardian[urand(0, 9)], CAST_TRIGGERED);
                        break;
                    }
                    case PHASE_SKELETON_3:
                    {
                        for (uint8 i = 0; i < 2; ++i)
                            DoCastSpellIfCan(m_creature, auiSpellSummonPlaguedGuardian[urand(0, 3)], CAST_TRIGGERED);

                        break;
                    }
                }

                m_uiSummonTimer = 30000;
            }
            else
                m_uiSummonTimer -= uiDiff;
        }
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
