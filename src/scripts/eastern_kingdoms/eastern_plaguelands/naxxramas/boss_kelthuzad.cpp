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
SDName: Boss_KelThuzud
SD%Complete: 75
SDComment: Timers will need adjustments, along with tweaking positions and amounts
SDCategory: Naxxramas
EndScriptData */

// some not answered questions:
// - will intro mobs, not sent to center, despawn when phase 2 start?
// - what happens if raid fail, can they start the event as soon after as they want?

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    SAY_SUMMON_MINIONS                  = -1533105,         //start of phase 1

    EMOTE_PHASE2                        = -1533135,         //start of phase 2
    SAY_AGGRO1                          = -1533094,
    SAY_AGGRO2                          = -1533095,
    SAY_AGGRO3                          = -1533096,

    SAY_SLAY1                           = -1533097,
    SAY_SLAY2                           = -1533098,

    SAY_DEATH                           = -1533099,

    SAY_CHAIN1                          = -1533100,
    SAY_CHAIN2                          = -1533101,
    SAY_FROST_BLAST                     = -1533102,

    SAY_REQUEST_AID                     = -1533103,         //start of phase 3
    SAY_ANSWER_REQUEST                  = -1533104,         //lich king answer

    SAY_SPECIAL1_MANA_DET               = -1533106,
    SAY_SPECIAL3_MANA_DET               = -1533107,
    SAY_SPECIAL2_DISPELL                = -1533108,

    EMOTE_GUARDIAN                      = -1533134,         // at each guardian summon

    SPELL_VISUAL_CHANNEL = 29423,  // channeled throughout phase one

    //spells to be casted
    SPELL_FROST_BOLT          = 28478,
    SPELL_FROST_BOLT_NOVA     = 28479,

    SPELL_CHAINS_OF_KELTHUZAD           = 28408,            // 3.x, heroic only
    SPELL_CHAINS_OF_KELTHUZAD_TARGET    = 28410,

    SPELL_MANA_DETONATION               = 27819,
    SPELL_SHADOW_FISSURE                = 27810,
    SPELL_FROST_BLAST                   = 27808
};

static float M_F_ANGLE = 0.2f;                              // to adjust for map rotation
static float M_F_HEIGHT = 2.0f;                             // adjust for height difference
static float M_F_RANGE = 55.0f;                             // ~ range from center of chamber to center of alcove
static float centerCoord[3] = { 3716.379883f, -5106.779785f, 141.289993f };
enum AddSpells
{
    // guardian of icecrown
    SPELL_BLOOD_TAP = 28470, 

    // Soul Weaver
    SPELL_WAIL_SOULS_AUR = 28460,

    // Warrior
    SPELL_DARK_BLAST_AUR  = 28458,
    SPELL_DARK_BLAST_TRIG = 28457,

    // Abomination
    SPELL_MORTAL_WOUND = 28467,
};

enum Events
{
    // phase one
    EVENT_SKELETON = 1,
    EVENT_SOUL_WEAVER,
    EVENT_ABOMINATION,
    EVENT_DESPAWN_MINIONS,
    EVENT_PHASE_TWO_INTRO,
    EVENT_PHASE_TWO_START,
    EVENT_DESPAWN_PORTAL,
    EVENT_PUT_IN_COMBAT,

    // phase two
    EVENT_FROSTBOLT_VOLLEY,
    EVENT_SHADOW_FISSURE,
    EVENT_DETONATE_MANA,
    EVENT_FROST_BLAST,
    EVENT_CHAINS,

    // phase three transition
    EVENT_TRANSITION_REPLY,
    EVENT_TRANSITION_SUMMON,
};

static constexpr float pullPortal[3] = { 3716.379883f, -5106.779785f, 132.9f };

static constexpr uint32 NUM_ALCOVES = 7;
static constexpr float alcoves[7][2] = 
{
    { 3768.40f, -5072.00f},
    { 3729.30f, -5044.10f},
    { 3683.00f, -5054.05f},
    { 3654.15f, -5093.48f},
    { 3664.55f, -5140.50f},
    { 3704.00f, -5170.00f},
    { 3751.95f, -5158.90f} 
};

static constexpr float alcoveZ = 143.5f;
static constexpr uint32 NUM_SOULWEAVER = 7;
// clockwise from right side of KT when facing him
static constexpr float soulweaverPos[NUM_SOULWEAVER][2] =
{
    {3754.95f, -5164.93f},
    {3701.89f, -5176.95f},
    {3656.83f, -5145.56f},
    {3647.53f, -5093.56f},
    {3678.48f, -5050.46f},
    {3730.87f, -5035.93f},
    {3774.78f, -5067.68f},
};
static constexpr uint32 NUM_ABOM = 21;
// clockwise from right side of KT when facing him
static constexpr float abomPos[NUM_ABOM][2] =
{
    {3740.70f, -5160.89f},
    {3756.42f, -5151.09f},
    {3748.99f, -5155.72f},

    {3694.11f, -5163.96f},
    {3713.90f, -5168.14f},
    {3704.76f, -5166.21f},

    {3661.65f, -5132.06f},
    {3672.37f, -5147.84f},
    {3666.83f, -5139.67f},

    {3658.81f, -5086.46f},
    {3654.80f, -5104.04f},
    {3656.76f, -5095.47f},

    {3691.83f, -5052.45f},
    {3675.15f, -5062.94f},
    {3683.48f, -5057.71f},

    {3738.15f, -5050.12f},
    {3717.76f, -5046.03f},
    {3728.48f, -5047.99f},

    {3772.53f, -5083.21f},
    {3760.03f, -5064.65f},
    {3765.85f, -5073.22f}
};

struct kt_p1AddAI : public ScriptedAI
{
    kt_p1AddAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }
    virtual void Reset() = 0;
    void ActualAttack(Unit* target)
    {
        ScriptedAI::AttackStart(target);
    }
    void Aggro(Unit*) override
    {
        // want to prevent the creature from aggroing unless we explicitly do it through base class
    }
    void AttackStart(Unit*) override
    {
        // want to prevent the creature from aggroing unless we explicitly do it through base class
    }
    void MoveInLineOfSight(Unit* pWho) override
    {
        if (m_creature->IsHostileTo(pWho) && m_creature->GetDistance2d(pWho) < 20.0f) //todo: no idea what the pull range should be
        {
            ScriptedAI::AttackStart(pWho);
        }
    }
    void SpellHit(Unit* unit, const SpellEntry*) override 
    {
        ScriptedAI::AttackStart(unit);
    }
};

struct boss_kelthuzadAI : public ScriptedAI
{
    boss_kelthuzadAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();

        memset(&m_auiGuardiansGUID, 0, sizeof(m_auiGuardiansGUID));
        m_uiGuardiansCount = 0;
        m_uiGuardiansCountMax = 2;
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint64 m_auiGuardiansGUID[5];
    uint32 m_uiGuardiansCount;
    uint32 m_uiGuardiansCountMax;
    uint32 m_uiGuardiansTimer;
    uint32 m_uiFrostBoltTimer;
    uint32 m_uiFrostBoltNovaTimer;
    uint32 m_uiChainsTimer;
    uint32 m_uiManaDetonationTimer;
    uint32 m_uiShadowFissureTimer;
    uint32 m_uiFrostBlastTimer;

    uint32 m_uiPhase1Timer;
    uint32 m_uiSoldierTimer;
    uint32 m_uiUndeadTimer;

    bool m_bIsPhase3;

    std::set<uint64> m_lSoldierSet;                         // keeps explicit guids of intro soldiers
    std::set<uint64> m_lUndeadSet;                          // the rest of the intro mobs
   
    
    std::vector<ObjectGuid> p1_adds;
    EventMap events;
    ObjectGuid pullPortalGuid;
    uint32 p1Timer;
    uint32 numSkeletons, numAboms, numBanshees;
    void Reset()
    {
        numSkeletons = 0;
        numAboms = 0;
        numBanshees = 0;
        m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_CHANNEL);
        events.Reset();
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
        if (!pullPortalGuid)
        {
            if (GameObject* pGO = m_creature->SummonGameObject(GO_HUB_PORTAL, pullPortal[0], pullPortal[1], pullPortal[2], 0))
            {
                pGO->SetObjectScale(2);
                pullPortalGuid = pGO->GetObjectGuid();
                // the add remove seems to be needed to  make the gobj update scale
                if (m_pInstance)
                {
                    m_pInstance->GetMap()->Remove(pGO, false);
                    m_pInstance->GetMap()->Add(pGO);
                }
            }
        }

        /*
        m_uiFrostBoltTimer = urand(1000, 60000);            //It won't be more than a minute without cast it
        m_uiFrostBoltNovaTimer = 15000;                     //Cast every 15 seconds
        m_uiChainsTimer = urand(30000, 60000);              //Cast no sooner than once every 30 seconds
        m_uiManaDetonationTimer = 20000;                    //Seems to cast about every 20 seconds
        m_uiShadowFissureTimer = 25000;                     //25 seconds
        m_uiFrostBlastTimer = urand(30000, 60000);          //Random time between 30-60 seconds
        m_uiGuardiansTimer = 5000;                          //5 seconds for summoning each Guardian of Icecrown in phase 3

        for (int i = 0; i < 5; ++i)
        {
            if (m_auiGuardiansGUID[i])
            {
                //delete creature
                if (Creature* pGuardian = m_creature->GetMap()->GetCreature(m_auiGuardiansGUID[i]))
                {
                    if (pGuardian->isAlive())
                        pGuardian->ForcedDespawn();
                }

                m_auiGuardiansGUID[i] = 0;
            }
        }

        m_uiPhase1Timer = 228000;                           //Phase 1 lasts "3 minutes and 48 seconds"
        m_uiSoldierTimer = 5000;
        m_uiUndeadTimer = 5000;
        m_bSummonedIntro = false;
        m_bIsPhase3 = false;
        */
        // it may be some spell should be used instead, to control the intro phase
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(urand(0, 1) ? SAY_SLAY1 : SAY_SLAY2, m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);
        if (m_pInstance)
            m_pInstance->SetData(TYPE_KELTHUZAD, DONE);

        /*
        for (int i = 0; i < 5; ++i)
        {
            if (m_auiGuardiansGUID[i])
            {
                Creature* pGuardian = m_creature->GetMap()->GetCreature(m_auiGuardiansGUID[i]);

                if (!pGuardian || !pGuardian->isAlive())
                    continue;

                pGuardian->AI()->EnterEvadeMode();
            }
        }
        */

    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        return;
    }

    void AttackStart(Unit* who) override
    {
        if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
            return;
        ScriptedAI::AttackStart(who);
    }

    void Aggro(Unit* pWho) override
    {
        if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
            return;

        m_creature->SetInCombatWithZone();
    }

    void JustReachedHome()
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_KELTHUZAD, NOT_STARTED);
            m_pInstance->ToggleKelThuzadWindows(false);
        }

        DespawnAllIntroCreatures();
    }

    void DespawnAllIntroCreatures()
    {
        for (auto it = p1_adds.begin(); it != p1_adds.end(); it++)
        {
            if (Creature* pSoldier = m_pInstance->instance->GetCreature(*it))
                ((TemporarySummon*)pSoldier)->UnSummon();
        }
        p1_adds.clear();
        /*
        if (!m_lSoldierSet.empty())
        {
            for (std::set<uint64>::iterator itr = m_lSoldierSet.begin(); itr != m_lSoldierSet.end(); ++itr)
            {
                if (Creature* pSoldier = m_pInstance->instance->GetCreature(*itr))
                    pSoldier->ForcedDespawn();
            }
        }

        if (!m_lUndeadSet.empty())
        {
            for (std::set<uint64>::iterator itr = m_lUndeadSet.begin(); itr != m_lUndeadSet.end(); ++itr)
            {
                if (Creature* pSoldier = m_pInstance->instance->GetCreature(*itr))
                    pSoldier->ForcedDespawn();
            }
        }

        m_lSoldierSet.clear();
        m_lUndeadSet.clear();
        */
    }

    float GetLocationAngle(uint32 uiId)
    {
        switch (uiId)
        {
            case 1:
                return M_PI_F - M_F_ANGLE;              // south
            case 2:
                return (M_PI_F / 2) * 3 - M_F_ANGLE;    // east
            case 3:
                return M_PI_F / 2 - M_F_ANGLE;          // west
            case 4:
                return M_PI_F / 4 - M_F_ANGLE;          // north-west
            case 5:
                return (M_PI_F / 4) * 7 - M_F_ANGLE;    // north-east
            case 6:
                return (M_PI_F / 4) * 5 - M_F_ANGLE;    // south-east
            case 7:
                return 3 * M_PI_F / 4 - M_F_ANGLE;      // south-west
        }

        return M_F_ANGLE;
    }

    void SummonIntroStart()
    {
        if (!m_pInstance)
            return;

        
        for (int i = 0; i < 7; ++i)
        {
            float fAngle = GetLocationAngle(i + 1);

            float fx = centerCoord[0];
            float fy = centerCoord[1];
            float fz = centerCoord[2];
            //m_pInstance->GetChamberCenterCoords(fx, fy, fz);

            fx += M_F_RANGE * cos(fAngle);
            fy += M_F_RANGE * sin(fAngle);
            fz += M_F_HEIGHT;

            MaNGOS::NormalizeMapCoord(fx);
            MaNGOS::NormalizeMapCoord(fy);

            for (int i = 0; i < 14; ++i)
            {
                uint32 uiNpcEntry = NPC_SOUL_WEAVER;

                if (i > 0)
                {
                    if (i < 4)
                        uiNpcEntry = NPC_UNSTOPPABLE_ABOM;
                    else
                        uiNpcEntry = NPC_SOLDIER_FROZEN;
                }

                float ffx, ffy, ffz;
                m_creature->GetRandomPoint(fx, fy, fz, 15.0f, ffx, ffy, ffz);

                m_creature->SummonCreature(uiNpcEntry, ffx, ffy, ffz, 0.0f, TEMPSUMMON_CORPSE_DESPAWN, 5000);
            }
        }
    }

    void SummonGuardian()
    {
        if (!m_pInstance)
            return;

        float fAngle = GetLocationAngle(urand(1, 7));

        float fx = centerCoord[0];
        float fy = centerCoord[1];
        float fz = centerCoord[2];
        //m_pInstance->GetChamberCenterCoords(fx, fy, fz);

        fx += M_F_RANGE * cos(fAngle);
        fy += M_F_RANGE * sin(fAngle);
        fz += M_F_HEIGHT;

        MaNGOS::NormalizeMapCoord(fx);
        MaNGOS::NormalizeMapCoord(fy);

        m_creature->SummonCreature(NPC_GUARDIAN, fx, fy, fz, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 25000);
    }

    void JustSummoned(Creature* pSummoned)
    {
        /*
        switch (pSummoned->GetEntry())
        {
            case NPC_GUARDIAN:
            {
                DoScriptText(EMOTE_GUARDIAN, m_creature);

                if (m_pInstance)
                {
                    float fx = centerCoord[0];
                    float fy = centerCoord[1];
                    float fz = centerCoord[2];
                    //m_pInstance->GetChamberCenterCoords(fx, fy, fz);
                    pSummoned->GetMotionMaster()->MovePoint(0, fx, fy, fz);
                }

                //Safe storing of creatures
                m_auiGuardiansGUID[m_uiGuardiansCount] = pSummoned->GetGUID();

                //Update guardian count
                ++m_uiGuardiansCount;
                break;
            }
            case NPC_SOLDIER_FROZEN:
                m_lSoldierSet.insert(pSummoned->GetGUID());
                break;
            case NPC_UNSTOPPABLE_ABOM:
            case NPC_SOUL_WEAVER:
                m_lUndeadSet.insert(pSummoned->GetGUID());
                break;
        }
        */
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        switch (pSummoned->GetEntry())
        {
            case NPC_SOLDIER_FROZEN:
                m_lSoldierSet.erase(pSummoned->GetGUID());
                break;
            case NPC_UNSTOPPABLE_ABOM:
            case NPC_SOUL_WEAVER:
                m_lUndeadSet.erase(pSummoned->GetGUID());
                break;
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiMotionType, uint32 uiPointId)
    {
        if (uiMotionType == POINT_MOTION_TYPE && uiPointId == 0)
            pSummoned->SetInCombatWithZone();
    }

    void MovementInform(uint32 uiMotionType, uint32 uiPointId)
    {
        if (uiMotionType == POINT_MOTION_TYPE && uiPointId == 0)
            m_creature->SetInCombatWithZone();
    }

    bool SendRandomSoldierToCenter()
    {
    if (m_lSoldierSet.empty())
        return false;

    std::set<uint64>::iterator itr = m_lSoldierSet.begin();

    uint32 uiPosition = urand(0, m_lSoldierSet.size() - 1);
    advance(itr, uiPosition);

    if (*itr)
    {
        if (Creature* pSoldier = m_pInstance->instance->GetCreature(*itr))
        {
            pSoldier->SetInCombatWithZone();
            if (Unit* pTarget = pSoldier->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {

                ((kt_p1AddAI*)pSoldier->AI())->ActualAttack(pTarget);
                return true;
            }

            float fx = centerCoord[0];
            float fy = centerCoord[1];
            float fz = centerCoord[2];
            pSoldier->GetMotionMaster()->MovePoint(0, fx, fy, fz);
            return true;
        }
    }

    return false;
    }

    bool SendRandomUndeadToCenter()
    {
        if (m_lUndeadSet.empty())
            return false;

        std::set<uint64>::iterator itr = m_lUndeadSet.begin();

        uint32 uiPosition = urand(0, m_lUndeadSet.size() - 1);

        advance(itr, uiPosition);

        if (*itr)
        {
            if (Creature* pUndead = m_pInstance->instance->GetCreature(*itr))
            {
                if (pUndead->getVictim())
                    return false;

                float fx = centerCoord[0];
                float fy = centerCoord[1];
                float fz = centerCoord[2];
                //m_pInstance->GetChamberCenterCoords(fx, fy, fz);
                pUndead->GetMotionMaster()->MovePoint(0, fx, fy, fz);
                return true;
            }
        }

        return false;
    }

    void StartEncounter()
    {
        // on pull there are in each alcove:
        // 3 aboms
        // 1 banshee
        // around 10 skeletons?

        // during p1, 14 aboms, 14 banshees and 120 skeletons should attack.
        // gradually faster
        m_pInstance->SetData(TYPE_KELTHUZAD, IN_PROGRESS);
        DoScriptText(SAY_SUMMON_MINIONS, m_creature);
        DoCastAOE(SPELL_VISUAL_CHANNEL);


        events.ScheduleEvent(EVENT_DESPAWN_PORTAL, Seconds(7));
        events.ScheduleEvent(EVENT_PUT_IN_COMBAT, Seconds(20));
        events.ScheduleEvent(EVENT_PHASE_TWO_INTRO, Minutes(5) + Seconds(20));
        events.ScheduleEvent(EVENT_DESPAWN_MINIONS, Minutes(5) + Seconds(20));

        p1Timer = 320000;
        events.ScheduleEvent(EVENT_SKELETON, Seconds(20));
        events.ScheduleEvent(EVENT_SOUL_WEAVER, Seconds(35));
        events.ScheduleEvent(EVENT_ABOMINATION, Seconds(45));

        m_pInstance->DoUseDoorOrButton(pullPortalGuid);

        for (int i = 0; i < NUM_ALCOVES; i++)
        {
            for (int j = 0; j < 10; j++)
            {
                double angle = rand_norm() * 2.0 * M_PI;
                double relDistance = rand_norm() + rand_norm();
                if (relDistance > 1)
                    relDistance = 1 - relDistance;
                const float x = alcoves[i][0];
                const float y = alcoves[i][1];
                const float radius = 14.0f;
                float thisX = x + std::sin(angle)*relDistance*radius;
                float thisY = y + std::cos(angle)*relDistance*radius;
                if (Creature* pCreature = m_creature->SummonCreature(NPC_SOLDIER_FROZEN, thisX, thisY, alcoveZ, frand(0, M_PI_F * 2),
                    TEMPSUMMON_MANUAL_DESPAWN))
                {
                    p1_adds.push_back(pCreature->GetObjectGuid());
                    pCreature->SetHomePosition(x, y, alcoveZ, m_creature->GetOrientation());
                    pCreature->SetRespawnRadius(radius);
                }
            }
        }
        for (int i = 0; i < NUM_ABOM; i++)
        {
            if (Creature* pCreature = m_creature->SummonCreature(NPC_UNSTOPPABLE_ABOM, abomPos[i][0], abomPos[i][1], alcoveZ, frand(0, M_PI_F * 2),
                TEMPSUMMON_MANUAL_DESPAWN))
            {
                p1_adds.push_back(pCreature->GetObjectGuid());
                pCreature->SetRespawnRadius(5.0f);
            }

        }
        for (int i = 0; i < NUM_SOULWEAVER; i++)
        {
            if (Creature* pCreature = m_creature->SummonCreature(NPC_SOUL_WEAVER, soulweaverPos[i][0], soulweaverPos[i][1], alcoveZ, frand(0, M_PI_F * 2),
                TEMPSUMMON_MANUAL_DESPAWN))
            {
                p1_adds.push_back(pCreature->GetObjectGuid());
                pCreature->SetRespawnRadius(5.0f);
            }
        }
    }

    bool SpawnAndSendP1Creature(uint32 type)
    {
        const float* spawnLoc = alcoves[urand(0, NUM_ALCOVES - 1)];
        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
        {
            float spawnAng = 3.14f + pTarget->GetAngle(spawnLoc[0], spawnLoc[1]);
            if (Creature* pAdd = m_creature->SummonCreature(type, spawnLoc[0], spawnLoc[1], alcoveZ, spawnAng, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
            {
                pAdd->SetInCombatWithZone();
                ((kt_p1AddAI*)pAdd->AI())->ActualAttack(pTarget);
                return true;
            }
        }
        return false;
    }

    void UpdateP1(uint32 diff)
    {
        if (m_pInstance->GetData(TYPE_KELTHUZAD) != IN_PROGRESS)
            return;
        
        p1Timer -= std::min(p1Timer, diff);

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_DESPAWN_PORTAL:
                if (GameObject* pGO = m_pInstance->GetGameObject(pullPortalGuid))
                {
                    pullPortalGuid = 0;
                    pGO->Delete();
                }
                break;
            case EVENT_PUT_IN_COMBAT:
                m_creature->SetInCombatState(false);
                m_creature->SetInCombatWithZone();
                break;
            case EVENT_SKELETON:
            {
                // linearly increasing spawn frequency, starting at 5sec, going towards 2sec.
                // We will reach 2 sec aprox when p1timer is at 150sec. In other words, 
                // first half of p1 frequency increases. Last half it is constant.
                /*
                float x = (p1Timer - 120000.0f) / 1000.0f;
                float t = (3.0f / 195.0f) * x + 2.0f;
                uint32 ms = t * 1000.0f;
                repeat_next = std::max(uint32(2), ms);
                ///3 / 150 * (X100 - 150)
                */
                if (numSkeletons < 120)
                {
                    float t = 3.0f / 150.0f * (p1Timer / 1000.0f - 150.0f);
                    uint32 repeat_next = t * 1000 + 2000;
                    if (SpawnAndSendP1Creature(NPC_SOLDIER_FROZEN))
                    {
                        events.Repeat(repeat_next);
                        ++numSkeletons;
                    }
                    else
                        events.Repeat(100);
                }
                break;
            }
            case EVENT_ABOMINATION:
            {
                if (numAboms < 14)
                {
                    float d = (p1Timer - 135000.0f) / 1000.0f;
                    float t = 15.0f / 150.0f * d;
                    uint32 repeat_next = t*1000.0f + 15000;
                    
                    if (SpawnAndSendP1Creature(NPC_UNSTOPPABLE_ABOM))
                    {
                        events.Repeat(repeat_next);
                        ++numAboms;
                    }
                    else
                        events.Repeat(100);
                }
                break;
            }
            case EVENT_SOUL_WEAVER:
            {
                if (numBanshees < 14)
                {
                    float d = (p1Timer - 125000.0f) / 1000.0f;
                    float t = 15.0f / 150.0f * d;
                    uint32 repeat_next = t*1000.0f + 15000;
                    if (SpawnAndSendP1Creature(NPC_SOUL_WEAVER))
                    {
                        events.Repeat(repeat_next);
                        ++numBanshees;
                    }
                    else
                        events.Repeat(100);
                }
                break;
            }
            case EVENT_PHASE_TWO_INTRO:
            {
                // ToDo: slightly hard to figure the exact delay between this event (the yell and despawn of adds)
                // until he engages. Most vanilla timers say 20 seconds, but he always engages earlier than that.
                // Seen it at around 10 seconds in a german video (https://www.youtube.com/watch?v=QafmVXupeHc),
                // and as late as ~17-18 sec in another one (https://www.youtube.com/watch?v=6RpqjIFbQYw https://www.youtube.com/watch?v=wSQtlvVebm0)
                events.ScheduleEvent(EVENT_PHASE_TWO_START, Seconds(17));
                DoScriptText(irand(SAY_AGGRO3, SAY_AGGRO1), m_creature);
                m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_CHANNEL);
                DespawnAllIntroCreatures();
                break;
            }
            case EVENT_PHASE_TWO_START:
                // engage!
                break;
            }

        }
        /*
        if (m_uiPhase1Timer < diff)
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

            float fx = centerCoord[0];
            float fy = centerCoord[1];
            float fz = centerCoord[2];
            //m_pInstance->GetChamberCenterCoords(fx, fy, fz);
            m_creature->GetMotionMaster()->MovePoint(0, fx, fy, fz);

            DoScriptText(EMOTE_PHASE2, m_creature);
            return;
        }
        else
        {
            if (m_uiSoldierTimer < diff)
            {
                if (SendRandomSoldierToCenter())
                    m_uiSoldierTimer = 2000;
            }
            else
                m_uiSoldierTimer -= diff;

            if (m_uiUndeadTimer < diff)
            {
                if (SendRandomUndeadToCenter())
                    m_uiUndeadTimer = 10000;
            }
            else
                m_uiUndeadTimer -= diff;

            m_uiPhase1Timer -= diff;
        }
        */
    }

    void UpdateP2P3(uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiFrostBoltTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BOLT);
            m_uiFrostBoltTimer = urand(1000, 60000);
        }
        else
            m_uiFrostBoltTimer -= diff;

        if (m_uiFrostBoltNovaTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BOLT_NOVA);
            m_uiFrostBoltNovaTimer = 15000;
        }
        else
            m_uiFrostBoltNovaTimer -= diff;

        if (m_uiChainsTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_CHAINS_OF_KELTHUZAD);

            DoScriptText(urand(0, 1) ? SAY_CHAIN1 : SAY_CHAIN2, m_creature);

            m_uiChainsTimer = urand(30000, 60000);
        }
        else
            m_uiChainsTimer -= diff;

        if (m_uiManaDetonationTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_MANA_DETONATION);

            if (urand(0, 1))
                DoScriptText(SAY_SPECIAL1_MANA_DET, m_creature);

            m_uiManaDetonationTimer = 20000;
        }
        else
            m_uiManaDetonationTimer -= diff;

        if (m_uiShadowFissureTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_FISSURE);

            if (urand(0, 1))
                DoScriptText(SAY_SPECIAL3_MANA_DET, m_creature);

            m_uiShadowFissureTimer = 25000;
        }
        else
            m_uiShadowFissureTimer -= diff;

        if (m_uiFrostBlastTimer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BLAST);

            if (urand(0, 1))
                DoScriptText(SAY_FROST_BLAST, m_creature);

            m_uiFrostBlastTimer = urand(30000, 60000);
        }
        else
            m_uiFrostBlastTimer -= diff;

        //start phase 3 when we are 40% health
        if (!m_bIsPhase3 && m_creature->GetHealthPercent() < 40.0f)
        {
            m_bIsPhase3 = true;
            DoScriptText(SAY_REQUEST_AID, m_creature);

            m_pInstance->DoOrSimulateScriptTextForThisInstance(SAY_ANSWER_REQUEST, NPC_LICH_KING);

            // "open the blinds", that is, at p3 start, the portals blocking the windows
            // dissapear, and it's possible to see outside.
            if (m_pInstance) {
                m_pInstance->ToggleKelThuzadWindows(true);
            }
        }

        if (m_bIsPhase3 && m_uiGuardiansCount < m_uiGuardiansCountMax)
        {
            if (m_uiGuardiansTimer < diff)
            {
                //Summon a Guardian of Icecrown in a random alcove
                SummonGuardian();

                //5 seconds until summoning next guardian
                m_uiGuardiansTimer = 5000;
            }
            else
                m_uiGuardiansTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetData(TYPE_KELTHUZAD) != IN_PROGRESS)
            return;
        if (m_creature->isInCombat())
        {
            if (!m_creature->SelectHostileTarget())
                return;
            // won't have a victim if we are in p1, even if selectHostileTarget returns true, so check that before return
            else if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE) && !m_creature->getVictim())
                return;
        }
        
        events.Update(diff);

        if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
            UpdateP1(diff);
        else
            UpdateP2P3(diff);
    }

};

struct mob_abomAI : public kt_p1AddAI
{
    mob_abomAI(Creature* pCreature) : kt_p1AddAI(pCreature)
    {
        Reset();
    }
    uint32 mortalWoundTimer;
    void Reset() override
    {
        mortalWoundTimer = 7500;
    }
    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (mortalWoundTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTAL_WOUND) == CAST_OK)
                mortalWoundTimer = 7500;
        }
        else
            mortalWoundTimer -= diff;

        DoMeleeAttackIfReady();
    }
};
struct mob_soldierAI : public kt_p1AddAI
{
    mob_soldierAI(Creature* pCreature) : kt_p1AddAI(pCreature)
    {
        Reset();
    }
    void Reset() override
    {
    }
    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        if (!m_creature->HasAura(SPELL_DARK_BLAST_AUR))
            m_creature->CastSpell(m_creature, SPELL_DARK_BLAST_AUR, true);
        DoMeleeAttackIfReady();
    }
};
struct mob_soulweaverAI : public kt_p1AddAI
{
    mob_soulweaverAI(Creature* pCreature) : kt_p1AddAI(pCreature)
    {
    }
    void Reset() override
    {
    }
    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        if (!m_creature->HasAura(SPELL_WAIL_SOULS_AUR))
            m_creature->CastSpell(m_creature, SPELL_WAIL_SOULS_AUR, true);

        DoMeleeAttackIfReady();
    }
};
struct mob_guardian_icecrownAI : public ScriptedAI
{
    mob_guardian_icecrownAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }
    void Reset() override
    {

    }
    void UpdateAI(const uint32 diff) override
    {

    }
};

CreatureAI* GetAI_boss_kelthuzad(Creature* pCreature)
{
    return new boss_kelthuzadAI(pCreature);
}

CreatureAI* GetAI_mob_abom(Creature* pCreature)
{
    return new mob_abomAI(pCreature);
}

CreatureAI* GetAI_mob_soldier(Creature* pCreature)
{
    return new mob_soldierAI(pCreature);
}

CreatureAI* GetAI_mob_soulweaver(Creature* pCreature)
{
    return new mob_soulweaverAI(pCreature);
}

CreatureAI* GetAI_mob_guardian_icecrown(Creature* pCreature)
{
    return new mob_guardian_icecrownAI(pCreature);
}

void instance_naxxramas::OnKTAreaTrigger(const AreaTriggerEntry* pAT)
{
    if (GetData(TYPE_KELTHUZAD) != NOT_STARTED)
        return;

    if (Creature* pKT = GetSingleCreatureFromStorage(NPC_KELTHUZAD))
    {
        if (boss_kelthuzadAI* ai = (boss_kelthuzadAI*)pKT->AI())
        {
            ai->StartEncounter();
        }
    }
}

void AddSC_boss_kelthuzad()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_kelthuzad";
    NewScript->GetAI = &GetAI_boss_kelthuzad;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "unstoppable_abomination_ai";
    NewScript->GetAI = &GetAI_mob_abom;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "soldier_frozen_wastes_ai";
    NewScript->GetAI = &GetAI_mob_soldier;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "soul_weaver_ai";
    NewScript->GetAI = &GetAI_mob_soulweaver;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_guardian_icecrownAI";
    NewScript->GetAI = &GetAI_mob_guardian_icecrown;
    NewScript->RegisterSelf();
}
