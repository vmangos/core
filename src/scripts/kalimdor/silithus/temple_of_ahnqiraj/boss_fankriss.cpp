/* 
AQ40 - Fankriss the Unyielding
Reference: http://forum.nostalrius.org/viewtopic.php?f=51&t=35154#p246406

Stryg comments:

*/

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

#include <algorithm>
#include <utility>

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
};

struct SpawnLocation
{
    float m_fX, m_fY, m_fZ;
};

static constexpr SpawnLocation aSummonWormLocs[3] =
{
    { -8076.53f, 1120.37f, -88.50f },
    { -8150.18f, 1146.97f, -87.45f },
    { -8023.31f, 1242.42f, -83.47f },
};
static constexpr SpawnLocation hatchlingLocations[3] = 
{
    {-8043.01f, 1254.20f, -84.19f},
    {-8003.00f, 1222.90f, -82.10f},
    {-8022.68f, 1150.08f, -89.33f}
};
static constexpr SpawnLocation pullCenter       = {-8074.88f, 1193.64f, -92.11f};
static constexpr uint32 aIndex[3]               = { 0, 1, 2 };
static constexpr uint32 aEntangleSpells[3]      = { SPELL_ENTANGLE_1, SPELL_ENTANGLE_2, SPELL_ENTANGLE_3 };
static constexpr size_t MAX_HATCHLINGS          = 20;   // Max hatchlings alive at any one time
static constexpr size_t MAX_HATCHLINGS_PER_WEB  = 4;    // Max amount of hatchlings that can spawn at the same time, on one web. Its at least 4, might be 5.
static constexpr uint32 HATCHLINGS_ATTACK_DELAY = 2500; // ~2.5sec in curse killvideo.

// if defined, 2-MAX_HATCHLINGS_PER_WEB hatchlings are spawned in all 3 locations each time a player is ported,
// otherwise 2-MAX_HATCHLINGS_PER_WEB hatchlings will only spawn on the single location the player was ported to.
#define ALWAYS_HATCHLINGS_IN_3_LOCATIONS

/*

ALWAYS_HATCHLINGS_IN_3_LOCATIONS  when defined will spawn 2-MAX_HATCHLINGS_PER_WEB hatchlings in all 3 locations whenever one player is teleported. 
                                  If its not defined 2-MAX_HATCHLINGS_PER_WEB  hatchlings only spawn in the location of the teleported player. 
                                  In curse video it clearly looks like hatchlings spawn in all 3 locations, while in later videos they only spawn 
                                  in the location of a teleported player.
                                  
MAX_HATCHLINGS                    defines how many hatchlings can be alive at the same time. I'm sure it was capped on retail, but not on the amount.

MAX_HATCHLINGS_PER_WEB            defines how many hatchlings can spawn spawn in one web location. Currently 4, possible it should be 5, but I have not seen it.

HATCHLINGS_ATTACK_DELAY           defines how long after hatchlings spawn until they go in combat with zone and attack the closest target. 
                                  If the hatchling is already in combat when HATCHLINGS_ATTACK_DELAY runs out, they will not force themself on the closest target.

    If we want to force players periodically aoe down hatchlings instead of just offtanking them we can set this MAX_HATCHLINGS  
    to a high value so it's not tankable. This will however require us to adjust down the frequency of players being teleported, 
    OR not define ALWAYS_HATCHLINGS_IN_3_LOCATIONS. If we increase MAX_HATCHLINGS  to an amount that is not offtankable, 
    the current configuration will most likely overrun the raid.
*/
std::vector<uint32> vIndex(aIndex, aIndex + 3);

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

    uint32 m_uiEvadeCheckTimer;

    struct HatchlingBatch
    {
        HatchlingBatch(GuidList& list) :
            attackTimer(HATCHLINGS_ATTACK_DELAY),
            hasAttacked(false),
            hatchlings(std::move(list))
        {}
        uint32 attackTimer;
        bool hasAttacked;
        GuidList hatchlings;
    };
    std::vector<HatchlingBatch> hatchlingVec;
    uint32 aliveHatchlings;
    std::vector < std::pair<uint32, SpawnLocation>> entangleSpells =
    {
        std::make_pair(SPELL_ENTANGLE_1, hatchlingLocations[0]),
        std::make_pair(SPELL_ENTANGLE_2, hatchlingLocations[1]),
        std::make_pair(SPELL_ENTANGLE_3, hatchlingLocations[2]),
    };
    
    std::pair<uint32,bool> entangleTimers[3]; // timer and bool==true meaning the timer is ready for re-initialization

    void Reset() override
    {
        m_uiMortalWoundTimer    = urand(4000, 8000);
        m_uiSummonWorm1Timer    = urand(22500, 30000);
        m_uiSummonWorm2Timer    = 0;
        m_uiSummonWorm3Timer    = 0;

        m_uiEvadeCheckTimer     = 2500;
        
        // Delaying first webs by 8 seconds, such that they cannot happen
        // until, at the earliest, 10 seconds after the pull.
        ReinitializeWebTimers(8000);
        aliveHatchlings = 0;
        hatchlingVec.clear();
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
            ++aliveHatchlings;
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
        {
            for (auto it = hatchlingVec.begin(); it != hatchlingVec.end(); it++)
            {
                it->hatchlings.remove(pSummoned->GetObjectGuid());
            }
            --aliveHatchlings;
        }
    }

    void ReinitializeWebTimers(uint32 add = 0)
    {
        std::random_shuffle(entangleSpells.begin(), entangleSpells.end());
        // it's possible the longest cooldown should be able to reach more than the 
        // 40 seconds max that it is here. Old nost code was 45sec. Cmangos use 75sec.
        // Should it also be possible that two players are webbed at the same time?
        // If not, we need shorter rand intervals and no overlap between the 3 webs.
        entangleTimers[0] = std::make_pair(urand(2000  + add, 20000 + add), false);
        entangleTimers[1] = std::make_pair(urand(12000 + add, 32000 + add), false);
        entangleTimers[2] = std::make_pair(urand(22000 + add, 42000 + add), false);
    }

    size_t GetHatchlingSpawnAmount()
    {
        size_t spawnAmount = std::min(MAX_HATCHLINGS_PER_WEB, MAX_HATCHLINGS - aliveHatchlings);
        if (spawnAmount > 2)
            spawnAmount = (size_t)urand((uint32)2, (uint32)spawnAmount);
        return spawnAmount;
    }

    void SummonHatchling(GuidList& batch, SpawnLocation loc)
    {
        if (Creature* hatchling = m_creature->SummonCreature(NPC_VEKNISS_HATCHLING, loc.m_fX, loc.m_fY, loc.m_fZ, 0.0f,
            TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 65000))
        {
            batch.push_back(hatchling->GetObjectGuid());
        }
    }

    void HandleHatchlings(const uint32 uiDiff)
    {
        bool reInitWebTimers = true;
        for (size_t i = 0; i < 3; i++)
        {
            bool& webCast = entangleTimers[i].second;
            if (webCast) continue;

            uint32& t = entangleTimers[i].first;
            if (t < uiDiff) {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
                {
                    if (DoCastSpellIfCan(pTarget, entangleSpells[i].first) == CAST_OK)
                    {
                        webCast = true;
                    }
                }
            }
            else {
                t -= uiDiff;
            }

            if (webCast)
            {
                GuidList batch;
#ifdef ALWAYS_HATCHLINGS_IN_3_LOCATIONS
                for (size_t x = 0; x < 3; x++)
                {
                    const SpawnLocation& sLoc = entangleSpells[x].second;
                    size_t spawnAmount = GetHatchlingSpawnAmount();
                    for (size_t s = 0; s < spawnAmount; s++)
                    {
                        SummonHatchling(batch, sLoc);
                    }
                }
#else
                const SpawnLocation& sLoc = entangleSpells[i].second;
                size_t spawnAmount = GetHatchlingSpawnAmount();
                for (size_t s = 0; s < spawnAmount; s++)
                {
                    SummonHatchling(batch, sLoc);
                }
#endif
                hatchlingVec.push_back(HatchlingBatch(batch));
            }
            else {
                reInitWebTimers = false;
            }
        }

        if (reInitWebTimers)
        {
            ReinitializeWebTimers();
        }
        
        for (auto it = hatchlingVec.begin(); it != hatchlingVec.end(); it++)
        {
            if (!it->hasAttacked)
            {
                if (it->attackTimer < uiDiff)
                {
                    for (auto hGuid = it->hatchlings.cbegin(); hGuid != it->hatchlings.cend(); hGuid++)
                    {
                        if (Creature* pHatchling = m_creature->GetMap()->GetCreature(*hGuid))
                        {
                            // If the hatchling is already in combat it means someone has already 
                            // manually picked it up, and we should not force it on any target.
                            if (!pHatchling->isInCombat())
                            {
                                if (Unit* pTarget = pHatchling->SelectAttackingTarget(AttackingTarget::ATTACKING_TARGET_NEAREST, 0))
                                {
                                    pHatchling->AI()->AttackStart(pTarget);
                                }
                            }
                            pHatchling->SetInCombatWithZone();

                        }
                    }
                    it->hasAttacked = true;
                }
                else {
                    it->attackTimer -= uiDiff;
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->isInCombat()) {
            Map::PlayerList const &PlayerList = m_creature->GetMap()->GetPlayers();
            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
            {
                Player* pPlayer = itr->getSource();
                if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster())
                {
                    // cheap way of quickly disgarding the check most of the time. No point 
                    // where he can be pulled should be higher than this point (he is at roughly -100)
                    if (pPlayer->GetPositionZ() > -70.0f)
                        continue;

                    float distToPull = pPlayer->GetDistance(pullCenter.m_fX, pullCenter.m_fY, pullCenter.m_fZ);
                    if (distToPull < 85.0f && pPlayer->IsWithinLOSInMap(m_creature))
                    {
                        AttackStart(pPlayer);
                    }
                }
            }
        }
        
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) {
            return;
        }

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
        
        HandleHatchlings(uiDiff);

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
