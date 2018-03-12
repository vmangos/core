/*
 *
 */

#include "scriptPCH.h"
#include "MoveMapSharedDefines.h"

enum
{
    NPC_INVADER_FIRE    = 14460,
    NPC_BOSS_FIRE       = 14461,

    NPC_INVADER_WATER   = 14458,
    NPC_BOSS_WATER      = 14457,

    NPC_INVADER_EARTH   = 14462,
    NPC_BOSS_EARTH      = 14464,

    NPC_INVADER_AIR     = 14455,
    NPC_BOSS_AIR        = 14454,
};

struct InvasionDataStruct
{
    uint32 event;
    uint32 boss;
    uint32 invader;
    uint32 zone;
    uint32 varDeadInvaders;
    uint32 varStage;
};

const static InvasionDataStruct InvasionData[] =
{
    { 68,   NPC_BOSS_FIRE,    NPC_INVADER_FIRE,    490,     VAR_FIRE_KILLS,     VAR_FIRE  },
    { 69,   NPC_BOSS_AIR,     NPC_INVADER_AIR,     1377,    VAR_AIR_KILLS,      VAR_AIR   },
    { 70,   NPC_BOSS_EARTH,   NPC_INVADER_EARTH,   16,      VAR_EARTH_KILLS,    VAR_EARTH },
    { 71,   NPC_BOSS_WATER,   NPC_INVADER_WATER,   618,     VAR_WATER_KILLS,    VAR_WATER }
};

const static uint32 MIN_RIFT_SPAWN = 3;     // initial spawned invaders per rift
const static uint32 MAX_RIFT_SPAWN = 6;     // maximum spawned invaders per rift
const static uint8 DEAD_INVADERS = 50;      // override spawn level immediately if X invaders killed

class elemental_invasion_riftAI: public GameObjectAI
{
public:
    elemental_invasion_riftAI(GameObject* gobj, uint32 eventIndex) : GameObjectAI(gobj), m_uiEventIndex(eventIndex)
    {
        m_uiTimer = 500;
        m_uiIncreaseTimer = HOUR * IN_MILLISECONDS;
    }

    uint8 m_uiEventIndex;
    uint32 m_uiTimer;
    uint32 m_uiIncreaseTimer;
    ObjectGuid m_uiInvadersGuid[MAX_RIFT_SPAWN];

    bool DoSpawn(uint8 index)
    {
        float x, y, z;
        me->GetPosition(x, y, z);
        auto invader = me->SummonCreature(InvasionData[m_uiEventIndex].invader, x, y, z, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);

        if (!invader) return false;

        for (uint8 i = 0; i < 20; ++i)
        {
            me->GetMap()->GetWalkRandomPosition(nullptr, x, y, z, 65.0f, NAV_GROUND | NAV_STEEP_SLOPES | NAV_WATER);
            if (me->GetDistance2d(x, y) > 15.0f)
                break;
        }

        invader->SetHomePosition(x, y, z, frand(0, 2 * M_PI_F));
        invader->SetRespawnRadius(20.0f);
        invader->GetMotionMaster()->MoveTargetedHome();

        m_uiInvadersGuid[index] = invader->GetObjectGuid();
        return true;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiIncreaseTimer > uiDiff)
            m_uiIncreaseTimer -= uiDiff;

        if (m_uiTimer < uiDiff)
        {
            // long update interval goes
            m_uiTimer = 70 * IN_MILLISECONDS;

            // do nothing if event is not started
            if (!sGameEventMgr.IsActiveEvent(InvasionData[m_uiEventIndex].event)) return;

            // do nothing if spawned in another zone
            if (me->GetZoneId() != InvasionData[m_uiEventIndex].zone) return;

            auto deadInvaders = sObjectMgr.GetSavedVariable(InvasionData[m_uiEventIndex].varDeadInvaders, 0);
            auto spawnStage = sObjectMgr.GetSavedVariable(InvasionData[m_uiEventIndex].varStage, 1);

            // increase spawn stage if killed invaders threshold reached
            if (spawnStage < STAGE_BOSS && (deadInvaders >= DEAD_INVADERS || m_uiIncreaseTimer < uiDiff))
            {
                ++spawnStage;
                sObjectMgr.SetSavedVariable(InvasionData[m_uiEventIndex].varDeadInvaders, 0, true);
                sObjectMgr.SetSavedVariable(InvasionData[m_uiEventIndex].varStage, spawnStage, true);
                m_uiIncreaseTimer = HOUR * IN_MILLISECONDS;
            }

            auto spawnCount = MIN_RIFT_SPAWN + spawnStage - 1;
            spawnCount = spawnCount > MAX_RIFT_SPAWN ? MAX_RIFT_SPAWN : spawnCount;

            for (uint8 i = 0; i < spawnCount; ++i)
            {
                if (!me->GetMap()->GetCreature(m_uiInvadersGuid[i]))
                    DoSpawn(i);
            }
        }
        else
            m_uiTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_go_elemental_invasion_rift_fire(GameObject* gobj)
{
    return new elemental_invasion_riftAI(gobj, EVENT_IND_FIRE);
}

GameObjectAI* GetAI_go_elemental_invasion_rift_water(GameObject* gobj)
{
    return new elemental_invasion_riftAI(gobj, EVENT_IND_WATER);
}

GameObjectAI* GetAI_go_elemental_invasion_rift_earth(GameObject* gobj)
{
    return new elemental_invasion_riftAI(gobj, EVENT_IND_EARTH);
}

GameObjectAI* GetAI_go_elemental_invasion_rift_air(GameObject* gobj)
{
    return new elemental_invasion_riftAI(gobj, EVENT_IND_AIR);
}

/*
 * Invaders script
 */

enum
{
    // Watery Invader
    SPELL_CHILLED       = 20005,
    SPELL_FROST_SHOCK   = 19133,

    // Thundering Invader
    SPELL_KNOCKDOWN     = 11428,
    SPELL_EARTH_SHOCK   = 23114,

    // Whirling Invader
    SPELL_WHIRLWIND     = 17207,
    SPELL_LIGHTN_SHIELD = 12550,

    // Blazing Invader
    SPELL_BLAST_WAVE    = 23113,
    SPELL_FIRE_SHIELD   = 11968,
};

struct npc_invaderAI : ScriptedAI
{
    explicit npc_invaderAI(Creature* pCreature, uint32 eventIndex) : ScriptedAI(pCreature), m_uiEventIndex(eventIndex)
    {
        npc_invaderAI::Reset();
    }

    uint32 m_uiEventIndex;
    uint32 m_uiChilledTimer;
    uint32 m_uiShockTimer;
    uint32 m_uiKnockdownTimer;
    uint32 m_uiWhirlwindTimer;
    uint32 m_uiBlastWaveTimer;
    uint32 m_uiShieldTimer;

    void Reset() override
    {
        m_uiChilledTimer = urand(2000, 5000);
        m_uiShockTimer = urand(3000, 5000);
        m_uiKnockdownTimer = urand(100, 500);
        m_uiWhirlwindTimer = urand(100, 500);
        m_uiBlastWaveTimer = urand(1000, 5000);
        m_uiShieldTimer = urand(100, 200);
    }

    void JustReachedHome() override
    {
        m_creature->GetMotionMaster()->Clear();
        m_creature->SetDefaultMovementType(RANDOM_MOTION_TYPE);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (!sGameEventMgr.IsActiveEvent(InvasionData[m_uiEventIndex].event)) return;

        auto deadInvaders = sObjectMgr.GetSavedVariable(InvasionData[m_uiEventIndex].varDeadInvaders, 0);
        ++deadInvaders;
        sObjectMgr.SetSavedVariable(InvasionData[m_uiEventIndex].varDeadInvaders, deadInvaders, true);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        switch (m_uiEventIndex)
        {
        case EVENT_IND_FIRE:
            if (m_uiShieldTimer < uiDiff)
            {
                DoCastSpellIfCan(m_creature, SPELL_FIRE_SHIELD, CF_AURA_NOT_PRESENT);
                m_uiShieldTimer = urand(6000, 8000);
            }
            else
                m_uiShieldTimer -= uiDiff;

            if (m_uiBlastWaveTimer < uiDiff)
            {
                auto pVictim = m_creature->getVictim();

                if (pVictim && m_creature->IsInRange(pVictim, 0.0f, 10.0f))
                    if (DoCastSpellIfCan(m_creature, SPELL_BLAST_WAVE) == CAST_OK)
                        m_uiBlastWaveTimer = urand(13000, 18000);
            }
            else
                m_uiBlastWaveTimer -= uiDiff;

            break;
        case EVENT_IND_AIR:
            if (m_uiShieldTimer < uiDiff)
            {
                DoCastSpellIfCan(m_creature, SPELL_LIGHTN_SHIELD, CF_AURA_NOT_PRESENT);
                m_uiShieldTimer = urand(10000, 12000);
            }
            else
                m_uiShieldTimer -= uiDiff;

            if (m_uiWhirlwindTimer < uiDiff)
            {
                auto pVictim = m_creature->getVictim();

                if (pVictim && m_creature->IsInRange(pVictim, 0.0f, 8.0f))
                    if (DoCastSpellIfCan(m_creature, SPELL_WHIRLWIND) == CAST_OK)
                        m_uiWhirlwindTimer = urand(9000, 12000);
            }
            else
                m_uiWhirlwindTimer -= uiDiff;

            break;
        case EVENT_IND_EARTH:
            if (m_uiKnockdownTimer < uiDiff)
            {
                auto pVictim = m_creature->getVictim();

                if (pVictim && m_creature->IsInRange(pVictim, 0.0f, 5.0f))
                    if (DoCastSpellIfCan(pVictim, SPELL_KNOCKDOWN) == CAST_OK)
                        m_uiKnockdownTimer = urand(11000, 15000);
            }
            else
                m_uiKnockdownTimer -= uiDiff;

            if (m_uiShockTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_EARTH_SHOCK) == CAST_OK)
                    m_uiShockTimer = urand(9000, 13000);
            }
            else
                m_uiShockTimer -= uiDiff;

            break;
        case EVENT_IND_WATER:
            if (m_uiChilledTimer < uiDiff)
            {
                auto pVictim = m_creature->getVictim();

                if (pVictim && m_creature->IsInRange(pVictim, 0.0f, 5.0f))
                    if (DoCastSpellIfCan(pVictim, SPELL_CHILLED) == CAST_OK)
                        m_uiChilledTimer = urand(5000, 8000);
            }
            else
                m_uiChilledTimer -= uiDiff;

            if (m_uiShockTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_SHOCK) == CAST_OK)
                    m_uiShockTimer = urand(8000, 15000);
            }
            else
                m_uiShockTimer -= uiDiff;

            break;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_watery_invader(Creature* pCreature)
{
    return new npc_invaderAI(pCreature, EVENT_IND_WATER);
}

CreatureAI* GetAI_npc_whirling_invader(Creature* pCreature)
{
    return new npc_invaderAI(pCreature, EVENT_IND_AIR);
}

CreatureAI* GetAI_npc_blazing_invader(Creature* pCreature)
{
    return new npc_invaderAI(pCreature, EVENT_IND_FIRE);
}

CreatureAI* GetAI_npc_thundering_invader(Creature* pCreature)
{
    return new npc_invaderAI(pCreature, EVENT_IND_EARTH);
}

void AddSC_elemental_invasions()
{
    Script* newscript;
    
    newscript = new Script;
    newscript->Name = "go_elemental_invasion_rift_fire";
    newscript->GOGetAI = &GetAI_go_elemental_invasion_rift_fire;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_elemental_invasion_rift_water";
    newscript->GOGetAI = &GetAI_go_elemental_invasion_rift_water;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_elemental_invasion_rift_earth";
    newscript->GOGetAI = &GetAI_go_elemental_invasion_rift_earth;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_elemental_invasion_rift_air";
    newscript->GOGetAI = &GetAI_go_elemental_invasion_rift_air;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_watery_invader";
    newscript->GetAI = &GetAI_npc_watery_invader;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_whirling_invader";
    newscript->GetAI = &GetAI_npc_whirling_invader;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_blazing_invader";
    newscript->GetAI = &GetAI_npc_blazing_invader;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thundering_invader";
    newscript->GetAI = &GetAI_npc_thundering_invader;
    newscript->RegisterSelf();
}
