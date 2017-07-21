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
    SPELL_CHAINS_OF_KELTHUZAD_SCALE     = 28409,
    SPELL_CHAINS_OF_KELTHUZAD_EFFECTS   = 28410,

    SPELL_MANA_DETONATION               = 27819,
    SPELL_SHADOW_FISSURE                = 27810,
    SPELL_VOID_BLAST                    = 27812,
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
    EVENT_PHASE_TWO_INTRO,
    EVENT_PHASE_TWO_START,
    EVENT_DESPAWN_PORTAL,
    EVENT_PUT_IN_COMBAT,

    // phase two
    EVENT_FROSTBOLT_VOLLEY,
    EVENT_FROST_BLAST,
    EVENT_FROSTBOLT,
    EVENT_SHADOW_FISSURE,
    EVENT_DETONATE_MANA,
    EVENT_CHAINS,

    // phase three
    EVENT_REQUEST_REPLY,
    EVENT_SUMMON_GUARDIAN
};

// the shiny thing in center that despawns after pull
static constexpr float pullPortal[3] = { 3716.379883f, -5106.779785f, 132.9f };

// Center position of each alcove
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

// z-coordinate in the alcoves
static constexpr float alcoveZ = 143.5f; 

// number of soulweavers total, one in each alcove
static constexpr uint32 NUM_SOULWEAVER = 7;
// each soulweaver position
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
// number of abominations, 3 in each alcove
static constexpr uint32 NUM_ABOM = 21;
// each abomination position
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

// total number of soulweaver and abomination waves 
static constexpr uint32 NUM_UNDEAD_SPAWNS = 14;

// milliseconds since pull for each abomination spawn
static constexpr uint32 abominationSpawnMs[NUM_UNDEAD_SPAWNS] =
{
    44000,
    72000,
    100000,
    130000,
    153000,
    176000,
    193000,
    212000,
    232000,
    252000,
    268000,
    285000,
    300000,
    318000,
};

// milliseconds since pull for each soulweaver spawn
static constexpr uint32 soulweaverSpawnMs[NUM_UNDEAD_SPAWNS] =
{
    44000,
    68000,
    97000,
    130000,
    155000,
    170000,
    190000,
    213000,
    235000,
    256000,
    271000,
    285000,
    294000,
    300000,
};

static constexpr uint32 NUM_WINDOW_PORTALS = 4;
static constexpr float windowPortals[NUM_WINDOW_PORTALS][2] =
{
    {3760.57f, -5173.93f},
    {3700.14f, -5185.68f},
    {3732.62f, -5027.67f},
    {3783.36f, -5062.35f}
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
        if (m_creature->IsHostileTo(pWho) && m_creature->GetDistance2d(pWho) < 25.0f) //todo: no idea what the pull range should be
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
        Reset();
    }

    instance_naxxramas* m_pInstance;

    std::vector<std::pair<ObjectGuid,int>> guardians;
    std::vector<ObjectGuid> p1_adds;
    
    int p1Timer;
    bool p3Started;
    EventMap events;
    ObjectGuid pullPortalGuid;
    uint32 numSummonedGuardians;
    uint32 nextBanshee, nextAbom;
    uint32 numSkeletons, numAboms, numBanshees;
    
    void Reset()
    {
        events.Reset();

        numSkeletons = 0;
        numAboms = 0;
        numBanshees = 0;
        nextBanshee = 30000;
        nextAbom = 30000;
        p3Started = false;
        numSummonedGuardians = 0;
        m_pInstance->ToggleKelThuzadWindows(false);
        m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_CHANNEL);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);

        EvadeAllGuardians();

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
        
        EvadeAllGuardians();
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
        EvadeAllGuardians();
    }

    void EvadeAllGuardians()
    {
        for (auto it = guardians.begin(); it != guardians.end(); it++)
        {
            if (Creature* pCreature = m_pInstance->GetCreature(it->first))
            {
                pCreature->AI()->EnterEvadeMode();
            }
        }
    }

    void DespawnAllIntroCreatures()
    {
        for (auto it = p1_adds.begin(); it != p1_adds.end(); it++)
        {
            if (Creature* pSoldier = m_pInstance->instance->GetCreature(*it))
                ((TemporarySummon*)pSoldier)->UnSummon();
        }
        p1_adds.clear();
    }
  
    void StartEncounter()
    {
        // on pull there are in each alcove:
        // 3 aboms
        // 1 banshee
        // around 10 skeletons?

        // during p1, 14 aboms, 14 banshees and 120 skeletons should attack, gradually faster
        m_pInstance->SetData(TYPE_KELTHUZAD, IN_PROGRESS);
        DoScriptText(SAY_SUMMON_MINIONS, m_creature);
        DoCastAOE(SPELL_VISUAL_CHANNEL);


        events.ScheduleEvent(EVENT_DESPAWN_PORTAL,  Seconds(7));
        events.ScheduleEvent(EVENT_PUT_IN_COMBAT,   Seconds(20));
        events.ScheduleEvent(EVENT_PHASE_TWO_INTRO, Minutes(5) + Seconds(20));

        p1Timer = 320000;
        events.ScheduleEvent(EVENT_SKELETON, Seconds(20));
        //events.ScheduleEvent(EVENT_SOUL_WEAVER, Seconds(35));
        //events.ScheduleEvent(EVENT_ABOMINATION, Seconds(43));
        for (uint32 i = 0; i < NUM_UNDEAD_SPAWNS; i++)
            events.ScheduleEvent(EVENT_ABOMINATION, abominationSpawnMs[i]);
        for (uint32 i = 0; i < NUM_UNDEAD_SPAWNS; i++)
            events.ScheduleEvent(EVENT_SOUL_WEAVER, soulweaverSpawnMs[i]);

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
        
        p1Timer -= diff;

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
                if (numSkeletons < 120)
                {

                    float t = 3.0f / 150.0f * (p1Timer / 1000.0f - 150.0f);
                    uint32 repeat_next = std::max(uint32(t * 1000 + 2000), uint32(2000));
                    if (SpawnAndSendP1Creature(NPC_SOLDIER_FROZEN))
                    {
                        uint32 repeat_next = std::max(uint32(3750 - 25 * numSkeletons), uint32(2000));
                        events.Repeat(repeat_next);
                        ++numSkeletons;
                        sLog.outBasic("[%d] Spawn SKEL #%d, next in %dms", p1Timer, numSkeletons, repeat_next);
                    }
                    else
                        events.Repeat(100);
                }
                break;
            }
            case EVENT_ABOMINATION:
            {
                SpawnAndSendP1Creature(NPC_UNSTOPPABLE_ABOM);
                ++numAboms;
                sLog.outBasic("[%d] Spawn ABOM #%d", p1Timer, numAboms);
                break;
            }
            case EVENT_SOUL_WEAVER:
            {
                SpawnAndSendP1Creature(NPC_SOUL_WEAVER);
                ++numBanshees;
                sLog.outBasic("[%d] Spawn SOUL #%d", p1Timer, numBanshees);
                break;
            }
            case EVENT_PHASE_TWO_INTRO:
            {
                // ToDo: slightly hard to figure the exact delay between this event (the yell and despawn of adds)
                // until he engages. Most vanilla timers say 20 seconds, but he always engages earlier than that.
                // Seen it at around 10 seconds in a german video (https://www.youtube.com/watch?v=QafmVXupeHc),
                // and as late as ~17-18 sec in another one (https://www.youtube.com/watch?v=6RpqjIFbQYw https://www.youtube.com/watch?v=wSQtlvVebm0)
                events.Reset();
                events.ScheduleEvent(EVENT_PHASE_TWO_START, Seconds(15));
                if (numBanshees < 14)
                {
                    SpawnAndSendP1Creature(NPC_SOUL_WEAVER);
                    sLog.outBasic("(post)[%d] Spawn bansh #%d, next in %dms", p1Timer, ++numBanshees, nextBanshee);
                }
                if (numAboms < 14)
                {
                    SpawnAndSendP1Creature(NPC_UNSTOPPABLE_ABOM);
                    sLog.outBasic("(post)[%d] Spawn abom #%d, next in %dms", p1Timer, ++numAboms, nextBanshee);
                }
                if (numSkeletons < 120)
                {
                    SpawnAndSendP1Creature(NPC_SOLDIER_FROZEN);
                    sLog.outBasic("(post)[%d] Spawn skele #%d, next in %dms", p1Timer, ++numSkeletons, nextBanshee);
                }

                DoScriptText(irand(SAY_AGGRO3, SAY_AGGRO1), m_creature);
                m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_CHANNEL);
                DespawnAllIntroCreatures();
                break;
            }
            case EVENT_PHASE_TWO_START:
                // engage!
                events.Reset();
                events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, Seconds(30));
                events.ScheduleEvent(EVENT_SHADOW_FISSURE,   Seconds(10));
                events.ScheduleEvent(EVENT_DETONATE_MANA,    Seconds(20));
                events.ScheduleEvent(EVENT_FROSTBOLT,        Seconds(10));
                events.ScheduleEvent(EVENT_CHAINS,           Seconds(60));
                m_creature->RemoveAurasDueToSpell(SPELL_VISUAL_CHANNEL);
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                //m_creature->CastStop();
                m_creature->InterruptNonMeleeSpells(true);
                
                DoResetThreat();
                if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_NEAREST, 0))
                    AttackStart(pUnit);

                break;
            }
        }
    }

    void DoChains()
    {
        if (m_creature->IsNonMeleeSpellCasted())
        {
            events.Repeat(Seconds(4));
            return;
        }
        m_creature->CastSpell(m_creature, SPELL_CHAINS_OF_KELTHUZAD, false);
        DoScriptText(urand(0, 1) ? SAY_CHAIN1 : SAY_CHAIN2, m_creature);
        events.Repeat(Seconds(urand(60, 90)));
    }

    void UpdateP2P3(uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->GetHealthPercent() < 40.0f && !p3Started)
        {
            DoScriptText(SAY_REQUEST_AID, m_creature);
            events.ScheduleEvent(EVENT_REQUEST_REPLY, Seconds(3));
            m_pInstance->ToggleKelThuzadWindows(true);
            events.ScheduleEvent(EVENT_SUMMON_GUARDIAN, Seconds(5));
            p3Started = true;
        }

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_REQUEST_REPLY:
                m_pInstance->DoOrSimulateScriptTextForThisInstance(SAY_ANSWER_REQUEST, NPC_LICH_KING);
                break;
            case EVENT_SUMMON_GUARDIAN:
            {
                // Can be seen in videos they spawn with some delay between eachother.
                // Not found a clear pattern, but a good guess is one spawn every 5 sec until all 5 has spawned.
                if (numSummonedGuardians < 5)
                {
                    // we can re-use the soulweave positions for where to spawn the guardians
                    // todo: is it completely random, or do we avoid re-using the same alcove twize?
                    int portalIndex = urand(0, NUM_WINDOW_PORTALS - 1);
                    const float* pos = windowPortals[portalIndex];

                    if (Creature* pCreature = m_creature->SummonCreature(NPC_GUARDIAN, pos[0], pos[1], alcoveZ, 0.0f, TEMPSUMMON_MANUAL_DESPAWN))
                    {
                        guardians.push_back(std::make_pair(pCreature->GetObjectGuid(), portalIndex));
                        ++numSummonedGuardians;
                        events.Repeat(Seconds(5));
                        pCreature->SetInCombatWithZone();
                        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                        {
                            pCreature->AI()->AttackStart(pTarget);
                        }
                    }
                    else
                        events.Repeat(100);
                }
                break;
            }
            case EVENT_FROSTBOLT_VOLLEY:
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BOLT_NOVA);
                events.Repeat(Seconds(urand(15, 30)));
                break;
            case EVENT_FROST_BLAST:
                if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1)) // todo: can it hit maintank?
                {
                    if (DoCastSpellIfCan(pUnit, SPELL_FROST_BLAST) == CAST_OK)
                    {
                        if (urand(0, 1))
                            DoScriptText(SAY_FROST_BLAST, m_creature);
                        events.Repeat(Seconds(urand(55, 65)));
                        break;
                    }
                }
                events.Repeat(Seconds(1));
                break;
            case EVENT_FROSTBOLT:
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BOLT);
                events.Repeat(Seconds(urand(5, 7))); // todo: this is guesswork
                break;
            case EVENT_SHADOW_FISSURE:
                events.Repeat(Seconds(urand(10, 20)));
                if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1))
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_FISSURE) == CAST_OK)
                    {
                        if (urand(0, 1))
                            DoScriptText(SAY_SPECIAL3_MANA_DET, m_creature);
                        break;
                    }
                }
                events.Repeat(Seconds(1));
                break;
            case EVENT_DETONATE_MANA:
                if(Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_MANA_DETONATION, SELECT_FLAG_POWER_MANA|SELECT_FLAG_PLAYER))
                {
                    if (DoCastSpellIfCan(pUnit, SPELL_MANA_DETONATION) == CAST_OK)
                    {
                        if (urand(0, 1))
                            DoScriptText(SAY_SPECIAL1_MANA_DET, m_creature);
                        events.Repeat(Seconds(urand(20,25))); // todo: not verified
                        break;
                    }
                }
                else
                    events.Repeat(Seconds(1));
                break;
            case EVENT_CHAINS:
                DoChains();
                break;
            }
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
        Reset();
    }
    uint32 bloodTapTimer;
    void Reset() override
    {
        bloodTapTimer = 5000;
    }
    void JustReachedHome() override
    {
        m_creature->ForcedDespawn(1);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (bloodTapTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_BLOOD_TAP) == CAST_OK)
                bloodTapTimer = 5000;
        }
        else
            bloodTapTimer -= diff;


        DoMeleeAttackIfReady();
    }
};

struct mob_shadow_fissureAI : public ScriptedAI
{
    mob_shadow_fissureAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint32 timer;
    bool haveCasted;
    void Reset() override
    {
        timer = 4000;
        haveCasted = false;
    }

    void Aggro(Unit*) override
    {
    }
    void AttackStart(Unit*) override
    {
    }
    void MoveInLineOfSight(Unit* pWho) override
    {
    }

    void UpdateAI(const uint32 diff) override
    {
        if (haveCasted)
            return;
        if (timer < diff)
        {
            m_creature->CastSpell(m_creature, SPELL_VOID_BLAST, true);
            haveCasted = true;
            m_creature->ForcedDespawn(1250);
        }
        else
            timer -= diff;
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

CreatureAI* GetAI_mob_shadow_fissure(Creature* pCreature)
{
    return new mob_shadow_fissureAI(pCreature);
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

    NewScript = new Script;
    NewScript->Name = "mob_shadow_fissure";
    NewScript->GetAI = &GetAI_mob_shadow_fissure;
    NewScript->RegisterSelf();
}
