/* 
AQ40 - Fankriss the Unyielding
Reference: http://forum.nostalrius.org/viewtopic.php?f=51&t=35154#p246406

Stryg comments:

*/

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

enum
{
    SPELL_MORTAL_WOUND      = 25646,
    SPELL_ENTANGLE_1        = 720,
    SPELL_ENTANGLE_2        = 731,
    SPELL_ENTANGLE_3        = 1121,
    //SPELL_SUMMON_WORM_1     = 518,
    //SPELL_SUMMON_WORM_2     = 25831,
    //SPELL_SUMMON_WORM_3     = 25832,

    NPC_SPAWN_FANKRISS      = 15630,

    MAX_HATCHLINGS          = 20,
};

struct SpawnLocation
{
    float m_fX, m_fY, m_fZ;
};

static const SpawnLocation aSummonWormLocs[3] =
{
    { -8076.53f, 1120.37f, -88.50f },
    { -8150.18f, 1146.97f, -87.45f },
    { -8023.31f, 1242.42f, -83.47f },
};

static const uint32 aIndex[3] = { 0, 1, 2 };
static const uint32 aEntangleSpells[3] = { SPELL_ENTANGLE_1, SPELL_ENTANGLE_2, SPELL_ENTANGLE_3 };
std::vector<uint32> vIndex(aIndex, aIndex + 3);
std::vector<uint32> vEntangleSpells(aEntangleSpells, aEntangleSpells + 3);

struct boss_fankrissAI : public ScriptedAI
{
    boss_fankrissAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiMortalWoundTimer;
    uint32 m_uiSummonWorm1Timer;
    uint32 m_uiSummonWorm2Timer;
    uint32 m_uiSummonWorm3Timer;
    uint32 m_uiEntangle1Timer;
    uint32 m_uiEntangle2Timer;
    uint32 m_uiEntangle3Timer;
    uint32 m_uiEntangleSummonTimer;
	uint32 m_uiEvadeCheckTimer;
	uint32 m_uiEntangleAttackTimer;

    ObjectGuid m_EntangleTargetGUID;
    GuidList m_lHatchlingsGUIDs;

    void Reset() override
    {
        m_uiMortalWoundTimer    = urand(4000, 8000);
        m_uiSummonWorm1Timer    = urand(22500, 30000);
        m_uiSummonWorm2Timer    = 0;
        m_uiSummonWorm3Timer    = 0;
        m_uiEntangle1Timer      = urand(10000, 15000);
        m_uiEntangle2Timer      = 0;
        m_uiEntangle3Timer      = 0;
        m_uiEntangleSummonTimer = 0;
		m_uiEntangleAttackTimer = 0;
		m_uiEvadeCheckTimer     = 2500;
        m_lHatchlingsGUIDs.clear();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // Fankriss has an extremely large aggro radius
        if (pWho->GetTypeId() == TYPEID_PLAYER && !m_creature->isInCombat() && m_creature->IsWithinDistInMap(pWho, 100.0f) && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH))
        {
            AttackStart(pWho);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void Aggro(Unit* /*pWho*/) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FANKRISS, IN_PROGRESS);
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FANKRISS, FAIL);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_FANKRISS, DONE);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() == NPC_VEKNISS_HATCHLING)
        {
            m_lHatchlingsGUIDs.push_back(pSummoned->GetObjectGuid());
            if (Player* pTarget = m_creature->GetMap()->GetPlayer(m_EntangleTargetGUID))
            {
                pSummoned->AI()->AttackStart(pTarget);
                pSummoned->SetInCombatWithZone();
            }
        }
        else if (pSummoned->GetEntry() == NPC_SPAWN_FANKRISS)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                pSummoned->AI()->AttackStart(pTarget);
            }
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() == NPC_VEKNISS_HATCHLING)
            m_lHatchlingsGUIDs.remove(pSummoned->GetObjectGuid());
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //
        // Mortal Wound
        if (m_uiMortalWoundTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORTAL_WOUND) == CAST_OK)
                m_uiMortalWoundTimer = urand(4000, 8000);
        }
        else
            m_uiMortalWoundTimer -= uiDiff;

        //
        // Summon Worm (1-3)
        if (m_uiSummonWorm1Timer < uiDiff)
        {
            // randomize order of Summon Worm pattern
            std::random_shuffle(vIndex.begin(), vIndex.end());
            m_creature->SummonCreature(NPC_SPAWN_FANKRISS, aSummonWormLocs[vIndex[0]].m_fX, aSummonWormLocs[vIndex[0]].m_fY, aSummonWormLocs[vIndex[0]].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 50000);
            m_uiSummonWorm1Timer = urand(50000, 70000);
            m_uiSummonWorm2Timer = urand(1000, 30000);
            m_uiSummonWorm3Timer = urand(2000, 30000);
        }
        else
            m_uiSummonWorm1Timer -= uiDiff;

        if (m_uiSummonWorm2Timer)
        {
            if (m_uiSummonWorm2Timer <= uiDiff)
            {
                m_creature->SummonCreature(NPC_SPAWN_FANKRISS, aSummonWormLocs[vIndex[1]].m_fX, aSummonWormLocs[vIndex[1]].m_fY, aSummonWormLocs[vIndex[1]].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 50000);
                m_uiSummonWorm2Timer = 0;
            }
            else
                m_uiSummonWorm2Timer -= uiDiff;
        }

        if (m_uiSummonWorm3Timer)
        {
            if (m_uiSummonWorm3Timer <= uiDiff)
            {
                m_creature->SummonCreature(NPC_SPAWN_FANKRISS, aSummonWormLocs[vIndex[2]].m_fX, aSummonWormLocs[vIndex[2]].m_fY, aSummonWormLocs[vIndex[2]].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 50000);
                m_uiSummonWorm3Timer = 0;
            }
            else
                m_uiSummonWorm3Timer -= uiDiff;
        }

        //
        // Entangle (1-3)
        if (m_uiEntangle1Timer < uiDiff)
        {
            // randomize order of Entangle pattern
            std::random_shuffle(vEntangleSpells.begin(), vEntangleSpells.end());
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
            {
                if (DoCastSpellIfCan(pTarget, vEntangleSpells[0]) == CAST_OK)
                {
                    m_uiEntangle1Timer      = urand(35000, 45000);
                    m_uiEntangle2Timer      = urand(2000, 20000);
                    m_uiEntangle3Timer      = urand(2000, 20000);
                    m_EntangleTargetGUID    = pTarget->GetObjectGuid();
                    m_uiEntangleSummonTimer = 1000;
                }
            }
        }
        else
            m_uiEntangle1Timer -= uiDiff;

        if (m_uiEntangle2Timer && !m_uiEntangleSummonTimer)
        {
            if (m_uiEntangle2Timer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
                {
                    if (DoCastSpellIfCan(pTarget, vEntangleSpells[1]) == CAST_OK)
                    {
                        m_uiEntangle2Timer = 0;
                        m_EntangleTargetGUID = pTarget->GetObjectGuid();
                        m_uiEntangleSummonTimer = 1000;
                    }
                }
            }
            else
                m_uiEntangle2Timer -= uiDiff;
        }

        if (m_uiEntangle3Timer && !m_uiEntangleSummonTimer)
        {
            if (m_uiEntangle3Timer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
                {
                    if (DoCastSpellIfCan(pTarget, vEntangleSpells[2]) == CAST_OK)
                    {
                        m_uiEntangle3Timer = 0;
                        m_EntangleTargetGUID = pTarget->GetObjectGuid();
                        m_uiEntangleSummonTimer = 1000;
                    }
                }
            }
            else
                m_uiEntangle3Timer -= uiDiff;
        }

        //
        // Spawn 4 Hatchlings on top of players who have been entangled
        if (m_uiEntangleSummonTimer)
        {
			if (m_uiEntangleSummonTimer < uiDiff)
			{
                if (m_lHatchlingsGUIDs.size() < (MAX_HATCHLINGS + 4))                               // If there are already more than MAX_HATCHLINGS - 4 up, prevent spawn
                {
                    if (Player* pTarget = m_creature->GetMap()->GetPlayer(m_EntangleTargetGUID))
                    {
                        float fX, fY, fZ;
                        for (uint8 i = 0; i < 4; ++i)
                        {
                            m_creature->GetRandomPoint(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 3.0f, fX, fY, fZ);
                            m_creature->SummonCreature(NPC_VEKNISS_HATCHLING, fX, fY, fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 65000);
                        }
                    }
                }
				m_uiEntangleAttackTimer = 1500;
                m_uiEntangleSummonTimer = 0;
            }
            else
                m_uiEntangleSummonTimer -= uiDiff;
        }

		// Summoned Hatchlings should be set in combat with Zone after meleeing the person they've spawned next to once (if not picked up by a tank)
		if (m_uiEntangleAttackTimer)
		{
			if (m_uiEntangleAttackTimer < uiDiff)
			{
				for (GuidList::const_iterator itr = m_lHatchlingsGUIDs.begin(); itr != m_lHatchlingsGUIDs.end(); itr++)
				{
					if (Creature* pSummoned = m_creature->GetMap()->GetCreature(*itr))
						pSummoned->SetInCombatWithZone();
				}
			}
			else
				m_uiEntangleAttackTimer -= uiDiff;
		}

        DoMeleeAttackIfReady();

		// Evade in case Fankriss starts running after someone at zone in
		if (m_uiEvadeCheckTimer < uiDiff)
		{
			m_uiEvadeCheckTimer = 2500;
			if (m_creature->GetPositionY() > 1400)
				EnterEvadeMode();
		}
		else
			m_uiEvadeCheckTimer -= uiDiff;
    }
};

CreatureAI* GetAI_boss_fankriss(Creature* pCreature)
{
    return new boss_fankrissAI(pCreature);
}

void AddSC_boss_fankriss()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_fankriss";
    pNewScript->GetAI = &GetAI_boss_fankriss;
    pNewScript->RegisterSelf();
}
