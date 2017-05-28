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
SDName: Boss_Gluth
SD%Complete: 70
SDComment:
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

/*
todo: should there really be 9 summon locations in vanilla?
#define ADD_1X 3269.590f
#define ADD_1Y -3161.287f
#define ADD_1Z 297.423f

#define ADD_2X 3277.797f
#define ADD_2Y -3170.352f
#define ADD_2Z 297.423f

#define ADD_3X 3267.049f
#define ADD_3Y -3172.820f
#define ADD_3Z 297.423f

#define ADD_4X 3252.157f
#define ADD_4Y -3132.135f
#define ADD_4Z 297.423f

#define ADD_5X 3259.990f
#define ADD_5Y -3126.590f
#define ADD_5Z 297.423f

#define ADD_6X 3259.815f
#define ADD_6Y -3137.576f
#define ADD_6Z 297.423f

#define ADD_7X 3308.030f
#define ADD_7Y -3132.135f
#define ADD_7Z 297.423f

#define ADD_8X 3303.046f
#define ADD_8Y -3180.682f
#define ADD_8Z 297.423f

#define ADD_9X 3313.283f
#define ADD_9Y -3180.766f
#define ADD_9Z 297.423f
*/
static const float aZombieSummonLoc[3][3] =
{
    { 3267.9f, -3172.1f, 297.42f },
    { 3253.2f, -3132.3f, 297.42f },
    { 3308.3f, -3185.8f, 297.42f },
};

enum
{
    // Cannot see these emotes being used in vanilla
    // EMOTE_ZOMBIE    = -1533119,
    // EMOTE_DECIMATE  = -1533152,

    SPELL_DOUBLE_ATTACK     = 19818, // Added on reset in cmangos, not sure why

    SPELL_MORTALWOUND       = 25646,
    SPELL_DECIMATE          = 28374,
    SPELL_DECIMATE_OTHER    = 28375,
    SPELL_FRENZY            = 28371,
    SPELL_BERSERK           = 26662,
    SPELL_TERRIFYING_ROAR   = 29685,

    SPELL_ZOMBIE_CHOW_SEARCH = 28235, // triggers 28236 every 3 sec
    SPELL_CALL_ALL_ZOMBIE    = 29681, // triggers 29682 every 3 sec

    NPC_ZOMBIE_CHOW         = 16360
};


enum eGLuthEvents
{
    EVENT_MORTAL_WOUND = 1,
    EVENT_DECIMATE,
    EVENT_FRENZY,
    EVENT_SUMMON,
    EVENT_BERSERK,
    EVENT_TERRIFYING_ROAR,
    EVENT_ZOMBIE_SEARCH,
};

/*
=> cmangos timers
m_uiMortalWoundTimer  = 10000;
m_uiDecimateTimer     = 110000;
m_uiEnrageTimer       = 10000;
m_uiSummonTimer       = 6000;
m_uiRoarTimer         = 20000;
m_uiZombieSearchTimer = 3000;
m_uiBerserkTimer      = MINUTE * 6.5 * IN_MILLISECONDS; // ~15 seconds after the third Decimate
*/
static constexpr uint32 MORTAL_WOUND_CD  = 8000;    // todo: verify
static constexpr uint32 DECIMATE_CD      = 105000;  // todo: verify
static constexpr uint32 FRENZY_CD        = 10000;   // todo: verify
static constexpr uint32 SUMMON_CD        = 6000;    // verified by dbc spell 28216
static constexpr uint32 BERSERK_CD       = 330000;  // todo: verify (15 sec after third decimate)
static constexpr uint32 FEAR_CD          = 20000;   // todo: verify
static constexpr uint32 ZOMBIE_SEARCH_CD = 3000;    // dbc confirms this one

struct boss_gluthAI : public ScriptedAI
{
    boss_gluthAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
        five_percent = uint32(m_creature->GetMaxHealth() * 0.05f);
    }

    instance_naxxramas* m_pInstance;
    EventMap m_events;

    std::vector<ObjectGuid> m_zombies;
    uint32 five_percent;
    void Reset()
    {
        m_events.Reset();
    }

    void JustDied(Unit* pKiller) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GLUTH, DONE);
    }

    void Aggro(Unit* pWho) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GLUTH, IN_PROGRESS);
        
        m_events.ScheduleEvent(EVENT_MORTAL_WOUND,    MORTAL_WOUND_CD);
        m_events.ScheduleEvent(EVENT_DECIMATE,        DECIMATE_CD);
        m_events.ScheduleEvent(EVENT_FRENZY,          FRENZY_CD);
        m_events.ScheduleEvent(EVENT_SUMMON,          SUMMON_CD);
        m_events.ScheduleEvent(EVENT_BERSERK,         BERSERK_CD);
        m_events.ScheduleEvent(EVENT_TERRIFYING_ROAR, FEAR_CD);
        m_events.ScheduleEvent(EVENT_ZOMBIE_SEARCH,   ZOMBIE_SEARCH_CD);
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GLUTH, FAIL);
    }

    void SpellHit(Unit*, const SpellEntry* pSpell) override
    {
        // only want to do these calculations inside naxx
        if (m_pInstance->GetMap()->GetId() != 533)
            return;
        if (pSpell->Id == SPELL_DECIMATE)
        {
            Map::PlayerList const& pList = m_pInstance->GetMap()->GetPlayers();
            for (Map::PlayerList::const_iterator it = pList.begin(); it != pList.end(); ++it)
            {
                Player* pPlayer = (*it).getSource();
                if (!pPlayer) continue;
                if (pPlayer->isDead()) continue;
                DoCastSpellIfCan(pPlayer, SPELL_DECIMATE_OTHER, CAST_TRIGGERED);
            }
            for (auto it = m_zombies.begin(); it != m_zombies.end(); ++it)
            {
                if (Creature* pZombie = m_pInstance->GetCreature(*it))
                {
                    if (pZombie->isDead()) continue;
                    DoCastSpellIfCan(pZombie, SPELL_DECIMATE_OTHER, CAST_TRIGGERED);
                    pZombie->GetMotionMaster()->MoveFollow(m_creature, ATTACK_DISTANCE, 0);
                }
            }
        }
    }

    void SummonedCreatureJustDied(Creature* pUnit) override
    {
        for (auto it = m_zombies.begin(); it != m_zombies.end();++it)
        {
            if ((*it) == pUnit->GetObjectGuid())
            {
                m_zombies.erase(it);
                break; 
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)  override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        m_events.Update(uiDiff);
        while (auto l_EventId = m_events.ExecuteEvent())
        {
            switch (l_EventId)
            {
            case EVENT_MORTAL_WOUND:
            {
                // mortal wound current target every 
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTALWOUND) == CAST_OK)
                    m_events.Repeat(MORTAL_WOUND_CD);
                else
                    m_events.Repeat(100);
                break;
            }
            case EVENT_DECIMATE:
            {
                // decimate every DECIMATE_CD ms
                // all the decimate logic is handled in SpellHit, so we dont put any players on 
                // 5% hp until we know the boss has received his stun etc
                if (DoCastSpellIfCan(m_creature, SPELL_DECIMATE) == CAST_OK)
                    m_events.Repeat(DECIMATE_CD);
                else
                    m_events.Repeat(100);
                break;
            }
            case EVENT_FRENZY:
            {
                // Frenzy every FRENZY_CD ms
                if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
                    m_events.Repeat(FRENZY_CD);
                else
                    m_events.Repeat(100);
                break;
            }
            case EVENT_SUMMON:
                // Summon an add every SUMMON_CD ms
                SummonAdd();
                m_events.Repeat(SUMMON_CD);
                break;
            case EVENT_BERSERK:
            {
                // berserk after BERSERK_CD ms
                if (DoCastSpellIfCan(m_creature, SPELL_BERSERK) == CAST_OK)
                    m_events.Repeat(300000); // duration of berserk 
                else
                    m_events.Repeat(100);
                break;
            }
            case EVENT_TERRIFYING_ROAR:
            {
                // fear every FEAR_CD ms
                if (DoCastSpellIfCan(m_creature, SPELL_TERRIFYING_ROAR) == CAST_OK)
                    m_events.Repeat(FEAR_CD);
                else
                    m_events.Repeat(100);
                break;
            }
            case EVENT_ZOMBIE_SEARCH:
            {
                // every ZOMBIE_SEARCH_CD ms he checks if any zombies are close enough to eat
                DoSearchZombieChow();
                m_events.Repeat(ZOMBIE_SEARCH_CD);
                break;
            }
            }
        }

        DoMeleeAttackIfReady();
    }

    // Spell 28236 could be used instead, but frankly this is more reliable and simple
    // the way the core is
    void DoSearchZombieChow()
    {
        std::vector<Creature*> chowableZombies;
        for (auto it = m_zombies.begin(); it != m_zombies.end(); ++it)
        {
            if (Creature* pZombie = m_creature->GetMap()->GetCreature(*it))
            {
                if (!pZombie->isAlive())
                    continue;

                // Using 2d distance, should do fine
                if (pZombie->GetDistance2d(m_creature) < 15.0f) // distance based on dbc for spellid 289236
                    chowableZombies.push_back(pZombie);
            }
        }
        // Need to chow them in a separate loop because when killed, 
        // SummonedCreatureJustDied removes them from m_zombies
        for (Creature* pZombie : chowableZombies)
        {
            m_creature->SetFacingToObject(pZombie);
            m_creature->DealDamage(pZombie, pZombie->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);

            // heals gluth for 5%. SetHealth truncates to maxhealth internally
            m_creature->SetHealth(m_creature->GetHealth() + five_percent);
        }
    }

    void SummonAdd()
    {
        int idx = urand(0, 2);
        float x = aZombieSummonLoc[idx][0];
        float y = aZombieSummonLoc[idx][1];
        float z = aZombieSummonLoc[idx][2];
        if (Creature* pZombie = m_creature->SummonCreature(NPC_ZOMBIE_CHOW, x, y, z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 80000))
        {
            pZombie->SetInCombatWithZone();
            m_zombies.push_back(pZombie->GetObjectGuid());
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                pZombie->AI()->AttackStart(pTarget);
        }

        // cmangos code, still dont know if 1 or 2 zombies should be summoned
        /*
         uint8 uiPos1 = urand(0, MAX_ZOMBIE_LOCATIONS - 1);
        m_creature->SummonCreature(NPC_ZOMBIE_CHOW, aZombieSummonLoc[uiPos1][0], aZombieSummonLoc[uiPos1][1], aZombieSummonLoc[uiPos1][2], 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0);

        uint8 uiPos2 = (uiPos1 + urand(1, MAX_ZOMBIE_LOCATIONS - 1)) % MAX_ZOMBIE_LOCATIONS;
        m_creature->SummonCreature(NPC_ZOMBIE_CHOW, aZombieSummonLoc[uiPos2][0], aZombieSummonLoc[uiPos2][1], aZombieSummonLoc[uiPos2][2], 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0);
        */
    }
};

CreatureAI* GetAI_boss_gluth(Creature* pCreature)
{
    return new boss_gluthAI(pCreature);
}

void AddSC_boss_gluth()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_gluth";
    NewScript->GetAI = &GetAI_boss_gluth;
    NewScript->RegisterSelf();
}
