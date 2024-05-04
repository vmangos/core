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
SDName: Eastern_Plaguelands
SD%Complete: 100
SDComment: Quest support: 5211, 5742.
SDCategory: Eastern Plaguelands
EndScriptData */

/* ContentData
mobs_ghoul_flayer
EndContentData */

#include "scriptPCH.h"
#include "CreatureGroups.h"

// Eris Havenfire event

enum ErisHavenfireData
{
    NPC_PEASANT_0           = 14484,        // Injured
    NPC_PEASANT_1           = 14485,        // Plagued
    NPC_WARRIOR             = 14486,
    NPC_ARCHER              = 14489,
    NPC_CLEANER             = 14503,

    GO_LIGHT                = 179693,
    GO_DEATH_POST           = 179694,
    GO_SLAIN_PEASANT1       = 179695,
    GO_SLAIN_PEASANT2       = 179696,
    GO_SLAIN_PEASANT3       = 179698,
    GO_SLAIN_PEASANT4       = 179699,

    DEATH_POST_SPAWNS_COUNT = 14,

    SPELL_SEETHING_PLAGUE        = 23072,
    SPELL_SHOOT                  = 23073,
    SPELL_ENTER_THE_LIGHT        = 23107,
    SPELL_BLESSING_OF_NORDRASSIL = 23108,
    SPELL_CONJURE_PEASANT        = 23119,
    SPELL_DEATHS_DOOR            = 23127,

    SAY_PEASANT_RANDOM_3    = 9683,
    SAY_PEASANT_RANDOM_2    = 9680,
    SAY_PEASANT_RANDOM_1    = 9682,
    SAY_PEASANT_END_4       = 9653,
    SAY_PEASANT_END_3       = 9650,
    SAY_PEASANT_END_2       = 9652,
    SAY_PEASANT_END_1       = 9654,
    SAY_ERIS_FAIL_1         = 9648,
    SAY_ERIS_FAIL_2         = 9649,
    SAY_PEASANT_SPAWN_1     = 9712,
    SAY_PEASANT_SPAWN_2     = 9713,
    SAY_PEASANT_SPAWN_3     = 9714,
    SAY_PEASANT_SPAWN_4     = 9715,
    SAY_ERIS_END            = 9728,
    SAY_ERIS_HEAL           = 9655,

    QUEST_BALANCE_OF_LIGHT  = 7622,

    POINT_START_COMBAT      = 0,
    POINT_END_EVENT         = 1,

    POS_PEASANT_SPAWN       = 0,
    POS_PEASANT_DEST        = 1,
    POS_WARRIOR_SPAWN0      = 2,
    POS_WARRIOR_SPAWN1      = 3,
    POS_WARRIOR_SPAWN2      = 4,
    POS_ARCHER_SPAWN0       = 5,
    POS_ARCHER_SPAWN1       = POS_ARCHER_SPAWN0 + 1,
    POS_ARCHER_SPAWN2       = POS_ARCHER_SPAWN1 + 1,
    POS_ARCHER_SPAWN3       = POS_ARCHER_SPAWN2 + 1,
    POS_ARCHER_SPAWN4       = POS_ARCHER_SPAWN3 + 1,
    POS_ARCHER_SPAWN5       = POS_ARCHER_SPAWN4 + 1,
    POS_ARCHER_SPAWN6       = POS_ARCHER_SPAWN5 + 1,
    POS_ARCHER_SPAWN7       = POS_ARCHER_SPAWN6 + 1,
    POS_END                 = POS_ARCHER_SPAWN7 + 1
};

static Position ErisHavenfireEvent[] =
{
    {3358.1096f, -3049.8063f, 166.226f, 1.87f},  // Depart
    {3327.0f, -2970.0f, 161.0f, 0.0f},           // Arrive
    {3366.0f, -3045.0f, 166.0f, 3.3f},           // Warrior 0
    {3345.0f, -3054.0f, 167.0f, 0.4f},           // Warrior 1
    {3364.0f, -3057.0f, 166.0f, 2.0f},           // Warrior 2
    {3327.076f, -3017.9831f, 171.5497f, 5.777f}, // Archer 0
    {3313.686f, -3038.0459f, 168.5863f, 0.072f}, // Archer 1
    {3333.0f, -3052.0f, 175.0f, 0.61f},          // Archer 2
    {3380.0f, -3040.0f, 174.0f, 3.3885f},        // Archer 3
    {3381.0f, -3060.0f, 184.0f, 2.5991f},        // Archer 4
    {3371.4809f, -3070.0302f, 175.166f, 1.952f}, // Archer 5
    {3347.1079f, -3071.3110f, 177.910f, 1.356f}, // Archer 6
    {3358.7299f, -3075.9846f, 174.794f, 1.575f}  // Archer 7
};

struct DeathPostSpawn
{
    DeathPostSpawn(uint32 entry_, float x_, float y_, float z_, float o_, float rot0_, float rot1_, float rot2_, float rot3_) :
        entry(entry_), x(x_), y(y_), z(z_), o(o_), rot0(rot0_), rot1(rot1_), rot2(rot2_), rot3(rot3_) {}
    uint32 entry;
    float x;
    float y;
    float z;
    float o;
    float rot0;
    float rot1;
    float rot2;
    float rot3;
};

static DeathPostSpawn deathPostSpawnPositions[DEATH_POST_SPAWNS_COUNT] =
{
    { GO_DEATH_POST,     3355.48f, -3010.68f, 175.212f, 5.06146f, 0.0f, 0.0f, -0.573576f, 0.819152f },
    { GO_SLAIN_PEASANT3, 3352.82f, -3007.79f, 177.409f, 2.53072f, 0.0f, 0.0f, 0.953716f, 0.300708f },
    { GO_SLAIN_PEASANT1, 3353.07f, -3009.16f, 176.615f, 3.01941f, 0.0f, 0.0f, 0.998135f, 0.0610518f },
    { GO_SLAIN_PEASANT4, 3354.08f, -3010.35f, 172.769f, 2.46091f, 0.0f, 0.0f, 0.942641f, 0.333808f },
    { GO_SLAIN_PEASANT2, 3353.87f, -3007.88f, 171.79f, 5.18363f, 0.0f, 0.0f, -0.522498f, 0.852641f },
    { GO_SLAIN_PEASANT2, 3353.28f, -3013.75f, 173.584f, 1.20428f, 0.0f, 0.0f, 0.566406f, 0.824126f },
    { GO_SLAIN_PEASANT2, 3353.34f, -3009.84f, 173.532f, 1.98967f, 0.0f, 0.0f, 0.83867f, 0.54464f },
    { GO_SLAIN_PEASANT3, 3353.8f, -3009.6f, 175.499f, 0.802851f, 0.0f, 0.0f, 0.390731f, 0.920505f },
    { GO_SLAIN_PEASANT4, 3355.88f, -3014.61f, 173.609f, 5.58505f, 0.0f, 0.0f, -0.34202f, 0.939693f },
    { GO_SLAIN_PEASANT4, 3354.33f, -3012.57f, 173.045f, 5.06146f, 0.0f, 0.0f, -0.573576f, 0.819152f },
    { GO_SLAIN_PEASANT2, 3354.29f, -3011.48f, 171.916f, 2.80997f, 0.0f, 0.0f, 0.986285f, 0.16505f },
    { GO_SLAIN_PEASANT1, 3354.74f, -3013.16f, 176.816f, 2.61799f, 0.0f, 0.0f, 0.965925f, 0.258821f },
    { GO_SLAIN_PEASANT3, 3355.1f, -3013.5f, 176.482f, 0.139625f, 0.0f, 0.0f, 0.0697555f, 0.997564f },
    { GO_SLAIN_PEASANT4, 3351.66f, -3007.61f, 175.0f, 4.53786f, 0.0f, 0.0f, -0.766044f, 0.642789f },
};

struct npc_eris_havenfireAI : public ScriptedAI
{
    explicit npc_eris_havenfireAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_creature->SetCreatureSummonLimit(200);
    }

    uint32 m_wave;
    uint32 m_waveTimer[2];
    uint32 m_buffTimer;
    uint32 m_archerTimer[8];
    uint32 m_villagerDiedCount;
    uint32 m_villagerSurvivedCount;
    uint64 m_playerGUID;
    uint64 m_archerGUIDs[8];
    uint64 m_villagerGUIDs[50];
    uint64 m_deathPostGUIDs[DEATH_POST_SPAWNS_COUNT];

    bool m_questStarted;
    bool m_cleanerSpawn;

    Player* GetPlayer()
    {
        return me->GetMap()->GetPlayer(m_playerGUID);
    }

    void Reset() override
    {
        m_wave = 0;
        m_villagerDiedCount = 0;
        m_villagerSurvivedCount = 0;
        m_questStarted = false;
        m_cleanerSpawn = false;

        m_waveTimer[0] = 10000;
        m_waveTimer[1] = 110000;
        m_buffTimer = 100000;
        for (int i = 0; i < 8; i++)
        {
            m_archerTimer[i] = 5000;
            m_archerGUIDs[i] = 0;
        }
        for (uint64 & guid : m_villagerGUIDs)
            guid = 0;
        for (uint64 & guid : m_deathPostGUIDs)
            guid = 0;

        m_creature->EnableMoveInLosEvent();
    }

    void AttackedBy(Unit* /*Attacker*/) override { }

    void MoveInLineOfSight(Unit* who) override
    {
        if ((who->GetTypeId() == TYPEID_PLAYER || who->IsPet()) && !m_cleanerSpawn && m_questStarted)
        {
            if (who->GetGUID() != m_playerGUID || who->IsPet())
            {   
                if (Creature* pCleaner = m_creature->SummonCreature(NPC_CLEANER, 3358.1096f, -3049.8063f, 166.226f, 1.87f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
                {
                    pCleaner->SetInCombatWith(who);
                    pCleaner->GetMotionMaster()->MoveChase(who);
                    m_questStarted = false;
                    m_cleanerSpawn = true;
                    FailEvent(GetPlayer(), false);
                }
            }
        }
    }

    void SetAttackOnPeasantOrPlayer(Creature* summoned)
    {
        if (!summoned)
            return;

        std::vector<uint32> mobsEntries;
        std::vector<uint32>::iterator entriesIt;
        mobsEntries.push_back(NPC_PEASANT_0);
        mobsEntries.push_back(NPC_PEASANT_1);

        for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
        {
            std::list<Creature*> tmpMobsList;
            GetCreatureListWithEntryInGrid(tmpMobsList, m_creature, (*entriesIt), 100.0f);
            while (!tmpMobsList.empty())
            {
                Creature* curr = tmpMobsList.front();
                tmpMobsList.pop_front();

                if (curr->IsAlive())
                    summoned->AddThreat(curr, float(urand(100, 200)));
            }
        }

        if (Player* player = GetPlayer())
        {
            if (player->IsAlive())
            {
                summoned->AddThreat(player, 50.0f);
                if ((rand() % 4) > 0)
                {
                    if (Unit* victim = summoned->GetVictim())
                        summoned->SendMeleeAttackStop(victim);
                    summoned->AddThreat(player, 200.0f);
                    summoned->GetMotionMaster()->Clear(false);
                    summoned->GetMotionMaster()->MoveChase(player);
                    if (Unit* victim = summoned->GetVictim())
                        summoned->SendMeleeAttackStart(victim);
                }
            }
        }
        mobsEntries.clear();
    }

    void DespawnAll()
    {
        std::vector<uint32> mobsEntries;
        std::vector<uint32>::iterator entriesIt;
        mobsEntries.push_back(NPC_PEASANT_0);
        mobsEntries.push_back(NPC_PEASANT_1);
        mobsEntries.push_back(NPC_WARRIOR);
        mobsEntries.push_back(NPC_ARCHER);

        for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
        {
            std::list<Creature*> tmpMobsList;
            GetCreatureListWithEntryInGrid(tmpMobsList, m_creature, (*entriesIt), 150.0f);
            while (!tmpMobsList.empty())
            {
                Creature* curr = tmpMobsList.front();
                tmpMobsList.pop_front();

                if (curr->IsAlive())
                    curr->ForcedDespawn();
            }
        }
        mobsEntries.clear();

        for (auto& guid : m_deathPostGUIDs)
        {
            if (GameObject* pGo = me->GetMap()->GetGameObject(guid))
                pGo->Delete();
            guid = 0;
        }
    }

    void JustSummoned(Creature* summoned) override
    {
        int j = 0;

        switch (summoned->GetEntry())
        {
            case NPC_ARCHER:
                summoned->SetSheath(SHEATH_STATE_RANGED);
                while (m_archerGUIDs[j] && j < 7)
                    ++j;

                m_archerGUIDs[j] = summoned->GetGUID();
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                summoned->AddUnitState(UNIT_STAT_ROOT);
                break;
            case NPC_WARRIOR:
                SetAttackOnPeasantOrPlayer(summoned);
                break;
            case NPC_PEASANT_1:
                summoned->CastSpell(summoned, SPELL_SEETHING_PLAGUE, true);
            // no break
            case NPC_PEASANT_0:
                while (m_villagerGUIDs[j] && j < 49)
                    ++j;

                if (j < 50)
                    m_villagerGUIDs[j] = summoned->GetGUID();

                if (Player* player = GetPlayer())
                    summoned->SetFactionTemplateId(player->GetFactionTemplateId());
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
                break;
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiMotionType, uint32 uiPointId) override
    {
        if (uiMotionType != POINT_MOTION_TYPE || !pSummoned)
            return;

        if ((pSummoned->GetEntry() == NPC_PEASANT_0 || pSummoned->GetEntry() == NPC_PEASANT_1) && uiPointId == POINT_END_EVENT)
        {
            ++m_villagerSurvivedCount;
            switch (rand() % 15)
            {
                case 0:
                    DoScriptText(SAY_PEASANT_END_1, pSummoned);
                    break;
                case 1:
                    DoScriptText(SAY_PEASANT_END_2, pSummoned);
                    break;
                case 2:
                    DoScriptText(SAY_PEASANT_END_3, pSummoned);
                    break;
                case 3:
                    DoScriptText(SAY_PEASANT_END_4, pSummoned);
                    break;
            }

            int j = 0;
            while (m_villagerGUIDs[j] != pSummoned->GetGUID() && j < 49)
                ++j;

            if (j < 50)
                m_villagerGUIDs[j] = 0;

            pSummoned->ForcedDespawn();

            if (m_villagerSurvivedCount >= 50)
                if (Player* player = GetPlayer())
                    CompleteEvent(player);
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (!pSummoned)
            return;

        if (pSummoned->GetEntry() == NPC_PEASANT_0 || pSummoned->GetEntry() == NPC_PEASANT_1)
        {
            if (m_villagerDiedCount < DEATH_POST_SPAWNS_COUNT)
            {
                const auto& spawn = deathPostSpawnPositions[m_villagerDiedCount];
                if (GameObject* pGo = m_creature->SummonGameObject(spawn.entry, spawn.x, spawn.y, spawn.z, spawn.o, spawn.rot0, spawn.rot1, spawn.rot2, spawn.rot3, 1200000, false))
                    m_deathPostGUIDs[m_villagerDiedCount] = pGo->GetGUID();
            }
            ++m_villagerDiedCount;
        }

        if (m_villagerDiedCount >= 15)
            FailEvent(GetPlayer(), true);

        int j = 0;
        while (m_villagerGUIDs[j] != pSummoned->GetGUID() && j < 49)
            ++j;

        if (j < 50)
            m_villagerGUIDs[j] = 0;
    }

    void FailEvent(Player* pPlayer, bool npcDespawn)
    {
        if (pPlayer && pPlayer->GetQuestStatus(QUEST_BALANCE_OF_LIGHT) == QUEST_STATUS_INCOMPLETE)
            pPlayer->FailQuest(QUEST_BALANCE_OF_LIGHT);

        if (rand() % 2)
            DoScriptText(SAY_ERIS_FAIL_1, m_creature);
        else
            DoScriptText(SAY_ERIS_FAIL_2, m_creature);

        if (GameObject* pLight = m_creature->FindNearestGameObject(GO_LIGHT, 100.0f))
            pLight->AddObjectToRemoveList();

        m_creature->CombatStop();

        DespawnAll();

        if (npcDespawn)
            m_creature->DisappearAndDie();
        else
            Reset();
    }

    void BeginEvent(Player* pPlayer)
    {
        if (!pPlayer)
            return;

        m_wave = 0;
        m_villagerDiedCount = 0;
        m_villagerSurvivedCount = 0;
        m_cleanerSpawn = false;
        m_questStarted = true;
        m_playerGUID = pPlayer->GetGUID();

        m_waveTimer[0] = 10000;
        m_waveTimer[1] = 100000;
        m_buffTimer = 95000;
        for (int i = 0; i < 8; i++)
        {
            m_archerTimer[i] = 5000;
            m_archerGUIDs[i] = 0;
        }
        for (uint64 & guid : m_villagerGUIDs)
            guid = 0;

        for (int i = POS_ARCHER_SPAWN0; i < POS_END; i++)
            m_creature->SummonCreature(NPC_ARCHER, ErisHavenfireEvent[i].x, ErisHavenfireEvent[i].y, ErisHavenfireEvent[i].z, ErisHavenfireEvent[i].o, TEMPSUMMON_DEAD_DESPAWN, 0);

        if (!m_creature->FindNearestGameObject(GO_LIGHT, 100.0f))
            m_creature->SummonGameObject(GO_LIGHT, 3327.0f, -2970.0f, 160.034f, 5.2135f, 0, 0, 0, 0, 0);
    }

    void NewWave(bool peasants)
    {
        int entry = NPC_WARRIOR;
        int count = GenerateWaveNumber(peasants);
        int rnd = urand(1, 4);
        bool yell = false;

        for (int i = 0; i < count; i++)
        {
            float X = 0.0f;
            float Y = 0.0f;
            float Z = 0.0f;
            if (peasants)
            {
                entry = i >= rnd ? NPC_PEASANT_0 : NPC_PEASANT_1;
                m_creature->GetRandomPoint(ErisHavenfireEvent[POS_PEASANT_SPAWN].x, ErisHavenfireEvent[POS_PEASANT_SPAWN].y, ErisHavenfireEvent[POS_PEASANT_SPAWN].z, 6.0f, X, Y, Z);
                if (Creature* pPeasant = m_creature->SummonCreature(entry, X, Y, Z, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    if (!yell)
                    {
                        ++m_wave;
                        yell = true;
                        switch (urand(0,3))
                        {
                            case 0:
                                DoScriptText(SAY_PEASANT_SPAWN_1, pPeasant);
                                break;
                            case 1:
                                DoScriptText(SAY_PEASANT_SPAWN_2, pPeasant);
                                break;
                            case 2:
                                DoScriptText(SAY_PEASANT_SPAWN_3, pPeasant);
                                break;
                            case 3:
                                DoScriptText(SAY_PEASANT_SPAWN_4, pPeasant);
                                break;
                        }
                    }
                }
            }
            else
            {
                int warriorPos = urand(2, 4);
                m_creature->GetRandomPoint(ErisHavenfireEvent[warriorPos].x, ErisHavenfireEvent[warriorPos].y, ErisHavenfireEvent[warriorPos].z, 5.0f, X, Y, Z);
                m_creature->SummonCreature(NPC_WARRIOR, X, Y, Z, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0);
            }
        }
    }

    int GenerateWaveNumber(bool peasants)
    {
        if (m_wave > 4 && peasants)
            return 0;

        int count = 0;
        if (peasants)
        {
            count = 12;
            if (m_wave == 3)
                count = 13;
            else if (m_wave == 4)
                count = 16;
        }
        else
            count = urand(2, 6);

        return count;
    }

    void CompleteEvent(Player* pPlayer)
    {
        if (!pPlayer)
            return;

        if (pPlayer->GetQuestStatus(QUEST_BALANCE_OF_LIGHT) == QUEST_STATUS_INCOMPLETE)
            pPlayer->AreaExploredOrEventHappens(QUEST_BALANCE_OF_LIGHT);

        DoScriptText(SAY_ERIS_END, m_creature);

        if (GameObject* pLight = m_creature->FindNearestGameObject(GO_LIGHT, 30.0f))
            pLight->AddObjectToRemoveList();

        m_creature->CombatStop();

        DespawnAll();

        Reset();
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_questStarted || m_cleanerSpawn)
            return;

        // Always keep player in combat
        if (Player* playerForQuest = GetPlayer())
            playerForQuest->SetCombatTimer(1500);

        for (int i = 0; i < 2; i++)
        {
            if (m_waveTimer[i] < uiDiff)
            {
                if (i == 0)
                {
                    NewWave(true);
                    m_waveTimer[i] = 80000;
                }
                else
                {
                    m_waveTimer[i] = urand(10000, 14000);
                    if ((rand() % 7) > 0) // 85% chance
                        NewWave(false);

                }
            }
            else
                m_waveTimer[i] -= uiDiff;
        }

        if (m_buffTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BLESSING_OF_NORDRASSIL) == CAST_OK)
            {
                if (Player* player = GetPlayer())
                    DoScriptText(SAY_ERIS_HEAL, m_creature, player);
                m_buffTimer = urand(75000, 90000);
            }
        }
        else
            m_buffTimer -= uiDiff;

        for (int i = 0; i < 8; i++)
        {
            if (m_archerTimer[i] < uiDiff)
            {
                if (m_archerGUIDs[i])
                {
                    if (Creature* pArcher = m_creature->GetMap()->GetCreature(m_archerGUIDs[i]))
                    {
                        int j = 0;
                        int count = 0;
                        uint64 GUIDs[50];

                        for (uint64 & guid : GUIDs)
                            guid = 0;

                        while (j < 50)
                        {
                            if (m_villagerGUIDs[j])
                            {
                                Unit* pVillager = m_creature->GetMap()->GetCreature(m_villagerGUIDs[j]);
                                if (pVillager && pVillager->IsAlive())
                                {
                                    GUIDs[count] = m_villagerGUIDs[j];
                                    ++count;
                                }
                            }
                            ++j;
                        }

                        if (count < 1)
                            continue;

                        if (Unit* pTarget = m_creature->GetMap()->GetCreature(GUIDs[urand(0, count - 1)]))
                            pArcher->CastSpell(pTarget, SPELL_SHOOT, true);

                        m_archerTimer[i] = urand(3000, 4400);
                    }
                }
            }
            else
                m_archerTimer[i] -= uiDiff;
        }
    }
};

bool QuestAccept_npc_eris_havenfire(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (!pPlayer || !pCreature || !pQuest)
        return true;

    if (pQuest->GetQuestId() == QUEST_BALANCE_OF_LIGHT)
        if (npc_eris_havenfireAI* pErisEventAI = dynamic_cast<npc_eris_havenfireAI*>(pCreature->AI()))
            pErisEventAI->BeginEvent(pPlayer);

    return true;
}

CreatureAI* GetAI_npc_eris_havenfire(Creature* pCreature)
{
    return new npc_eris_havenfireAI(pCreature);
}

struct npc_eris_havenfire_peasantAI : public ScriptedAI
{
    explicit npc_eris_havenfire_peasantAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    float X;
    float Y;
    float Z;
    float cX;
    float cY;
    float cZ;
    bool m_needToMove;

    uint32 m_uiSayPeasantTimer;

    void Reset() override
    {
        if (X == 0.0f && Y == 0.0f && Z == 0.0f)
            m_creature->GetRandomPoint(ErisHavenfireEvent[POS_PEASANT_DEST].x, ErisHavenfireEvent[POS_PEASANT_DEST].y, ErisHavenfireEvent[POS_PEASANT_DEST].z, 5.0f, X, Y, Z);
        cX = 3347.801025f + float(urand(0, 12));
        cY = -3048.161865f + float(urand(0, 12));
        cZ = 163.679321f;
        X = 3324.0f + float(urand(0, 6));
        Y = -2973.0f + float(urand(0, 6));
        Z = 161.0f;
        m_needToMove = true;
        SetCombatMovement(false);

        m_uiSayPeasantTimer = urand(10000, 30000);
    }

    void KilledUnit(Unit* victim) override { }

    void DamageTaken(Unit *done_by, uint32 &damage) override
    {
        if (done_by->GetEntry() == NPC_ARCHER)
            damage = urand(80, 105);
    }

    void SpellHit(SpellCaster* pCaster, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_SHOOT)
        {
            if (!urand(0, 10))
                m_creature->CastSpell(m_creature, SPELL_DEATHS_DOOR, true);
        }
        else if (pCaster && pCaster->IsPlayer())
        {
            Player* pCasterPlayer = static_cast<Player*>(pCaster);
            Creature* eris = m_creature->FindNearestCreature(14494, 100.0f, true);
            if (!eris)
                return;

            if (npc_eris_havenfireAI* pErisEventAI = dynamic_cast<npc_eris_havenfireAI*>(eris->AI()))
            {
                if (pCasterPlayer->GetGUID() != pErisEventAI->m_playerGUID && pErisEventAI->m_questStarted && !pErisEventAI->m_cleanerSpawn)
                {
                    if (Creature* Crea = m_creature->SummonCreature(NPC_CLEANER, 3358.1096f, -3049.8063f, 166.226f, 1.87f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
                    {
                        Crea->AI()->AttackStart(pCasterPlayer);
                        pErisEventAI->m_questStarted = false;
                        pErisEventAI->m_cleanerSpawn = true;
                        pErisEventAI->FailEvent(pErisEventAI->GetPlayer(), false);
                    }
                }
            }
        }
    }

    void MoveInLineOfSight(Unit* who) override { }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        if (uiPointId == POINT_START_COMBAT)
        {
            float Vitesse = m_creature->GetEntry() == NPC_PEASANT_0 ? 1.0f : 1.7f;
            m_creature->SetWalk(true);
            m_creature->GetMotionMaster()->MovePoint(POINT_END_EVENT, X, Y, Z, MOVE_PATHFINDING, Vitesse);
            cX = 0.0f;
            cY = 0.0f;
            cZ = 0.0f;
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_needToMove)
        {
            float Vitesse = m_creature->GetEntry() == NPC_PEASANT_0 ? 1.0f : 1.7f;
            m_creature->SetWalk(true);
            m_creature->GetMotionMaster()->MovePoint(POINT_START_COMBAT, cX, cY, cZ, MOVE_PATHFINDING, Vitesse);
            m_needToMove = false;
        }

        if (!m_creature->IsWalking())
            m_creature->SetWalk(true);

        if (m_uiSayPeasantTimer < uiDiff)
        {
            switch (rand() % 30)
            {
                case 0:
                    DoScriptText(SAY_PEASANT_RANDOM_1, m_creature);
                    break;
                case 1:
                    DoScriptText(SAY_PEASANT_RANDOM_2, m_creature);
                    break;
                case 2:
                    DoScriptText(SAY_PEASANT_RANDOM_3, m_creature);
                    break;
            }
            m_uiSayPeasantTimer = urand(20000, 50000);
        }
        else
            m_uiSayPeasantTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_eris_havenfire_peasant(Creature* pCreature)
{
    return new npc_eris_havenfire_peasantAI(pCreature);
}

enum DemetriaData
{
    NPC_SCARLET_TROOPER                 = 12352,
    SPELL_MIND_BLAST                    = 17194,
    SPELL_DOMINATE_MIND                 = 14515,
    SPELL_SHADOW_WORD_PAIN              = 17146,
    SPELL_MIND_FLAY                     = 17165,
    SPELL_DISPELL_MAGIC_FRIENDLY        = 17201,
    SPELL_DISPELL_MAGIC2                = 19476,
    SPELL_PSYCHIC_SCREAM2               = 13704,
    SPELL_SHADOWFORM                    = 16592
};

struct npc_demetriaAI : public ScriptedAI
{
    npc_demetriaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 guidScarletTrooper[9];

    void MovementInform(uint32 movementType, uint32 moveId) override
    {
        if (movementType != WAYPOINT_MOTION_TYPE)
            return;

        if (moveId == 0)
        {
            if (m_creature->FindNearestCreature(NPC_SCARLET_TROOPER, 60.0f, true)) //if another demetria is around, despawn.
                m_creature->ForcedDespawn();
            else
            {
                m_creature->JoinCreatureGroup(m_creature, 0, 0, (OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER));
                for (int i = 1; i <= 9; i++)
                {
                    float angle = i * 2 * M_PI / 9;
                    float x, y, z;
                    m_creature->GetPosition(x, y, z);
                    x += 3.0f * cos(angle);
                    y += 3.0f * sin(angle);
                    if (Creature* c = m_creature->SummonCreature(NPC_SCARLET_TROOPER, x, y, z, m_creature->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        c->JoinCreatureGroup(m_creature, 3.0f, angle - m_creature->GetOrientation(), (OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER));
                        guidScarletTrooper[i - 1] = c->GetGUID();
                    }
                }
            }
        }

        if (moveId == 99)
        {
            DespawnTroopers();
            m_creature->ForcedDespawn();
        }
    }

    void JustDied(Unit* Killer) override
    {
        DespawnTroopers();
    }

    void DespawnTroopers()
    {
        for (uint64 guid : guidScarletTrooper)
        {
            if (Creature* pTrooper = m_creature->GetMap()->GetCreature(guid))
                pTrooper->AddObjectToRemoveList();
        }
    }

    uint32 MindBlast_Timer;
    uint32 DominateMind_Timer;
    uint32 ShadowWordPain_Timer;
    uint32 MindFlay_Timer;
    uint32 DispelMagic_Timer;
    uint32 Resurrect_Timer;
    uint8  PsychicScream_HealthCheck;

    void UpdateAI(uint32 const diff) override
    {
        if (Resurrect_Timer < diff)
        {
            if (Creature* deadTrooper = m_creature->FindNearestCreature(NPC_SCARLET_TROOPER, 40.0f, false))
            {
                DoRessurectUnit(deadTrooper, m_creature->GetVictim());
                Resurrect_Timer = 10000;
            }
        }
        else
            Resurrect_Timer -= diff;

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!(m_creature->GetSpellAuraHolder(SPELL_SHADOWFORM)))
            DoCastSpellIfCan(m_creature, SPELL_SHADOWFORM);
        if (MindBlast_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MIND_BLAST) == CAST_OK)
                MindBlast_Timer = urand(4000, 5000);
        }
        else
            MindBlast_Timer -= diff;

        if (ShadowWordPain_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                ShadowWordPain_Timer = urand(18000, 24000);
        }
        else
            ShadowWordPain_Timer -= diff;

        if (MindFlay_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_MIND_FLAY) == CAST_OK)
                MindFlay_Timer = urand(15000, 18000);
        }
        else
            MindFlay_Timer -= diff;

        if (DominateMind_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1), SPELL_DOMINATE_MIND) == CAST_OK)
                DominateMind_Timer = urand(20000, 25000);
        }
        else
            DominateMind_Timer -= diff;

        if (DispelMagic_Timer < diff)
        {
            std::list<Creature*> pList;
            MaNGOS::FriendlyCCedInRangeCheck u_check(m_creature, 15);
            MaNGOS::CreatureListSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(pList, u_check);
            Cell::VisitGridObjects(m_creature, searcher, 15);
            if (!pList.empty())
            {
                if (DoCastSpellIfCan(*(pList.begin()), SPELL_DISPELL_MAGIC_FRIENDLY) == CAST_OK)
                    DispelMagic_Timer = 6000;
            }
            else
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_DISPELL_MAGIC2) == CAST_OK)
                    DispelMagic_Timer = 6000;
            }
        }
        else
            DispelMagic_Timer -= diff;

        if (m_creature->GetHealthPercent() < PsychicScream_HealthCheck)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_PSYCHIC_SCREAM2) == CAST_OK)
                PsychicScream_HealthCheck = 0;
        }
        DoMeleeAttackIfReady();
    }

    void Reset() override
    {
        MindBlast_Timer = 3000;
        ShadowWordPain_Timer = 9000;
        MindFlay_Timer = 15000;
        DominateMind_Timer = 6000;
        PsychicScream_HealthCheck = 30;
        DispelMagic_Timer = 0;
        Resurrect_Timer = 10000;
        m_creature->AddAura(SPELL_SHADOWFORM);
    }

    void DoRessurectUnit(Creature* creature, Unit* victim)//from Thekal's script.
    {
        float x, y, z, o;
        creature->GetPosition(x, y, z);
        o = creature->GetOrientation();

        creature->SetStandState(UNIT_STAND_STATE_STAND);
        creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        creature->SetHealth(creature->GetMaxHealth());

        creature->Respawn();
        creature->NearTeleportTo(x, y, z, o);
        creature->Update(0, 0);
        creature->SendSpellGo(creature, 20770);
        if (victim)
            creature->AI()->AttackStart(victim);
    }
};

CreatureAI* GetAI_npc_demetria(Creature* pCreature)
{
    return new npc_demetriaAI(pCreature);
}

/******************************
*** go_darrowshire_trigger ***
*** Battle of Darrowshire   ***
*******************************/

struct DarrowshireMove
{
    float X;
    float Y;
    float Z;
    float O;
};

static DarrowshireMove DarrowshireEvent[] =
{
    {1500.04f, -3662.67f, 82.832f, 3.70805f},       // Attacker spawn 1
    {1506.17f, -3686.72f, 82.8769f, 5.75945f},      // Attacker spawn 2
    {1512.81f, -3724.64f, 87.12099f, 1.64164f},     // Attacker spawn 3
    {1537.6f, -3677.1f, 88.7f, 3.14884f},           // Attacker spawn Bloodletter

    {1484.68f, -3668.74f, 80.6953f, 0.236567f},     // Defender spawn 1
    {1493.53f, -3695.01f, 80.1347f, 0.264055f},     // Defender spawn 2
    {1505.28f, -3718.83f, 83.343f, 1.36911f},       // Defender spawn 3
    {1446.8f, -3694.27f, 76.5966f, 0.401503f}       // Defender spawn Davil Lightfire / Captain Redpath / Joseph Redpath
};

enum DarrowshireTriggerData
{
    // Attacker
    NPC_MARAUDING_CORPSE        = 10951,
    NPC_MARAUDING_SKELETON      = 10952,
    NPC_SERVANT_OF_HORGUS       = 10953,
    NPC_BLOODLETTER             = 10954,
    NPC_HORGUS_THE_RAVAGER      = 10946,
    NPC_MARDUK_THE_BLACK        = 10939,
    NPC_REDPATH_THE_CORRUPTED   = 10938,
    NPC_DARROWSHIRE_BETRAYER    = 10947,

    // Defender
    NPC_DARROWSHIRE_DEFENDER    = 10948,
    NPC_SILVERHAND_DISCIPLE     = 10949,
    NPC_REDPATH_MILITIA         = 10950,
    NPC_DAVIL_LIGHTFIRE         = 10944,
    NPC_CAPTAIN_REDPATH         = 10937,
    NPC_JOSEPH_REDPATH          = 10936,
    NPC_DAVIL_CROKFORD          = 10945,

    GO_DARROWSHIRE_TRIGGER      = 177526, // Spawned by spell 18987

    SPELL_SUMMON_MARDUK_THE_BLACK = 18650,

    SAY_HORGUS_DIED             = 7368,
    SAY_LIGHTFIRE_DIED          = 7366,
    SAY_REDPATH_DIED            = 7369,
    SAY_SCOURGE_DEFEATED        = 7407,
    SAY_MILITIA_RANDOM_1        = 7347,
    SAY_MILITIA_RANDOM_2        = 7348,
    SAY_MILITIA_RANDOM_3        = 7349,
    SAY_MILITIA_RANDOM_4        = 7350,
    SAY_MILITIA_RANDOM_5        = 7351,
    SAY_MILITIA_RANDOM_6        = 7352,
    SAY_MILITIA_RANDOM_7        = 7353,
    SAY_MILITIA_RANDOM_8        = 7354,
    SAY_DEFENDER_YELL           = 7358,
    SAY_LIGHTFIRE_YELL          = 7343,
    SAY_DAVIL_YELL              = 7346,
    SAY_HORGUS_YELL             = 7344,
    SAY_DAVIL_DESPAWN           = 7227,
    SAY_REDPATH_YELL            = 7355,
    SAY_REDPATH_CORRUPTED       = 7357,
    SAY_MARDUK_YELL             = 7471,

    QUEST_BATTLE_DARROWSHIRE    = 5721
};

struct go_darrowshire_triggerAI : public GameObjectAI
{
    explicit go_darrowshire_triggerAI(GameObject* pGo) : GameObjectAI(pGo), m_cleanupDone(false), m_initialized(false)
    {
        m_defenderFaction = 113;  // Escort Faction: possible to heal but ... does not attack on sight despite the correct flags :/
        Reset();
        me->SetCreatureSummonLimit(200);
        me->SetRespawnTime(15 * MINUTE);
    }

    bool m_cleanupDone;
    bool m_initialized;

    uint32 m_phaseStep;
    uint32 m_phaseTimer;
    uint32 m_mobTimer[7];
    uint32 m_defenderFaction;
    std::list<ObjectGuid> m_summonedMobsList;

    ObjectGuid m_mardukGuid;
    ObjectGuid m_redpathGuid;
    ObjectGuid m_redpathCorruptedGuid;
    ObjectGuid m_davilGuid;
    ObjectGuid m_horgusGuid;

    void Reset()
    {
        // Faction change needed to allow aggro on sight 
        m_defenderFaction = 0;
        Map::PlayerList const &pl = me->GetMap()->GetPlayers();
        uint32 myArea = me->GetAreaId();
        if (!pl.isEmpty() && myArea)
        {
            for (const auto& it : pl)
            {
                Player* pPlayer =  it.getSource();
                if (pPlayer && pPlayer->IsAlive() && !pPlayer->IsGameMaster() && me->IsWithinDist(pPlayer, 20.0f, false))
                {
                    if (pPlayer->GetQuestStatus(QUEST_BATTLE_DARROWSHIRE) == QUEST_STATUS_INCOMPLETE)
                    {
                        if (pPlayer->GetTeam() == HORDE)
                            m_defenderFaction = 85; // Orgrimmar
                        else
                            m_defenderFaction = 57; // Ironforge
                        break;
                    }
                }
            }
        }

        m_phaseStep = 0;
        m_phaseTimer = 6000;

        m_mobTimer[0] = 15000;
        m_mobTimer[1] = 17000;
        m_mobTimer[2] = m_mobTimer[3] = m_mobTimer[4] = m_mobTimer[5] = m_mobTimer[6] = 0;
        m_summonedMobsList.clear();
    }

    void OnRemoveFromWorld() override
    {
        if (m_cleanupDone || !m_initialized)
            return;
        DespawnAll();
    }

    void DespawnGuid(ObjectGuid& g)
    {
        if (Creature* c = me->GetMap()->GetCreature(g))
            c->ForcedDespawn();
        g.Clear();
    }

    void DespawnAll()
    {
        m_cleanupDone = true;
        for (uint32 & i : m_mobTimer)
            i = 0;
        m_phaseTimer = 0;

        for (const auto& guid : m_summonedMobsList)
            if (Creature* creature = me->GetMap()->GetCreature(guid))
                if (creature->IsAlive() && creature->GetEntry() != NPC_JOSEPH_REDPATH && creature->GetEntry() != NPC_DAVIL_CROKFORD)
                    creature->ForcedDespawn(5000);

        m_summonedMobsList.clear();
        DespawnGuid(m_mardukGuid);
        DespawnGuid(m_redpathGuid);
        DespawnGuid(m_redpathCorruptedGuid);
        DespawnGuid(m_davilGuid);
        DespawnGuid(m_horgusGuid);
        me->DespawnNearCreaturesByEntry(NPC_DARROWSHIRE_BETRAYER, 150.0f);
        me->DeleteLater();
    }

    void JustSummoned(Creature* summoned) override
    {
        if (!summoned)
            return;

        m_summonedMobsList.push_back(summoned->GetGUID());

        switch (summoned->GetEntry())
        {
            case NPC_DARROWSHIRE_DEFENDER:
            case NPC_SILVERHAND_DISCIPLE:
            case NPC_REDPATH_MILITIA:
                summoned->SetFactionTemplateId(m_defenderFaction);
            // no break
            case NPC_MARAUDING_CORPSE:
            case NPC_MARAUDING_SKELETON:
            case NPC_SERVANT_OF_HORGUS:
                summoned->GetMotionMaster()->MoveRandom();
                break;
            case NPC_BLOODLETTER:
                summoned->SetWalk(true);
                summoned->SetHomePosition(DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, DarrowshireEvent[5].O);
                summoned->GetMotionMaster()->MovePoint(0, DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, MOVE_PATHFINDING, 5.0f);
                break;
            case NPC_DAVIL_LIGHTFIRE:
            case NPC_CAPTAIN_REDPATH:
                summoned->SetFactionTemplateId(m_defenderFaction);
                summoned->SetWalk(false);
                summoned->SetHomePosition(DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, DarrowshireEvent[4].O);
                summoned->GetMotionMaster()->MovePoint(2, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 5.0f);
                break;
            case NPC_MARDUK_THE_BLACK:
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_SPAWNING);
                summoned->ForcedDespawn(12000);
                break;
            default:
                break;
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiMotionType, uint32 uiPointId) override
    {
        if (uiMotionType != POINT_MOTION_TYPE || !pSummoned)
            return;

        switch (pSummoned->GetEntry())
        {
            case NPC_DARROWSHIRE_DEFENDER:
            {
                if (uiPointId == 0)
                    pSummoned->GetMotionMaster()->MoveRandom();
                break;
            }
            case NPC_DAVIL_LIGHTFIRE:
            case NPC_CAPTAIN_REDPATH:
            case NPC_BLOODLETTER:
            {
                switch (uiPointId)
                {
                    case 0:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(1, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 1:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(2, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 2:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(3, DarrowshireEvent[6].X, DarrowshireEvent[6].Y, DarrowshireEvent[6].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 3:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(0, DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (!pSummoned)
            return;

        switch (pSummoned->GetEntry())
        {
            case NPC_HORGUS_THE_RAVAGER:
            {
                if (Creature* Crea = me->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                    DoScriptText(SAY_HORGUS_DIED, Crea);
                m_phaseStep = 3;
                m_phaseTimer = 8000;
                break;
            }
            case NPC_DAVIL_LIGHTFIRE:
            {
                if (m_phaseStep < 3)
                {
                    // fail quest
                    if (Creature* Crea = me->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                        DoScriptText(SAY_LIGHTFIRE_DIED, Crea);
                    DespawnAll();
                }
                break;
            }
            case NPC_CAPTAIN_REDPATH:
            {
                if (m_phaseStep < 5)
                {
                    // fail quest
                    if (Creature* Crea = me->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                        DoScriptText(SAY_REDPATH_DIED, Crea);
                    DespawnAll();
                }
                break;
            }
            case NPC_REDPATH_THE_CORRUPTED:
            {
                if (Creature* Crea = me->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                    DoScriptText(SAY_SCOURGE_DEFEATED, Crea);
                me->SummonCreature(NPC_JOSEPH_REDPATH, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                me->SummonCreature(NPC_DAVIL_CROKFORD, 1465.43f, -3678.48f, 78.0816f, 0.0402176f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                DespawnAll();
                break;
            }
            default:
                break;
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_initialized)
        {
            // Already summoned ? Do not launch the event twice.
            std::list<GameObject*> otherTriggers;
            me->GetGameObjectListWithEntryInGrid(otherTriggers, GO_DARROWSHIRE_TRIGGER, 100.0f);
            if (otherTriggers.size() > 1)
            {
                me->AddObjectToRemoveList();
                return;
            }
            m_initialized = true;
        }

        for (int i = 0; i < 7; i++)
        {
            if (m_mobTimer[i] && m_mobTimer[i] <= uiDiff)
            {
                switch (i)
                {
                    case 0: // NPC_MARAUDING_CORPSE / NPC_MARAUDING_SKELETON
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            int amount = urand(1, 2);
                            for (int k = 0; k < amount; k++)
                            {
                                float X, Y, Z;
                                uint32 entry = urand(0, 1) ? NPC_MARAUDING_CORPSE : NPC_MARAUDING_SKELETON;
                                me->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                                me->SummonCreature(entry, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                            }
                        }
                        m_mobTimer[i] = 25000;
                        break;
                    }
                    case 1: // NPC_DARROWSHIRE_DEFENDER
                    {
                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            me->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                            me->SummonCreature(NPC_DARROWSHIRE_DEFENDER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        m_mobTimer[i] = 45000;
                        break;
                    }
                    case 2: // NPC_SERVANT_OF_HORGUS
                    {
                        if (m_phaseStep != 2)
                        {
                            m_mobTimer[i] = 0;
                            break;
                        }

                        float X, Y, Z;
                        for (int j = 0; j < 3; j++)
                        {
                            int amount = 0;
                            amount = urand(1, 2);
                            for (int k = 0; k < amount; k++)
                            {
                                me->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                                me->SummonCreature(NPC_SERVANT_OF_HORGUS, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                            }
                        }
                        m_mobTimer[i] = 35000;
                        break;
                    }
                    case 3: // NPC_SILVERHAND_DISCIPLE
                    {
                        if (m_phaseStep <= 2)
                        {
                            m_mobTimer[i] = 0;
                            break;
                        }

                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            me->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                            me->SummonCreature(NPC_SILVERHAND_DISCIPLE, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        m_mobTimer[i] = 45000;
                        break;
                    }
                    case 4: // NPC_BLOODLETTER
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            float X, Y, Z;
                            me->GetRandomPoint(DarrowshireEvent[3].X, DarrowshireEvent[3].Y, DarrowshireEvent[3].Z, 5.0f, X, Y, Z);
                            me->SummonCreature(NPC_BLOODLETTER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        m_mobTimer[i] = 35000;
                        break;
                    }
                    case 5: // NPC_REDPATH_MILITIA
                    {
                        if (m_phaseStep <= 4)
                        {
                            m_mobTimer[i] = 0;
                            break;
                        }

                        bool yelled = false;
                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            me->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 6.0f, X, Y, Z);
                            if (Creature* Militia = me->SummonCreature(NPC_REDPATH_MILITIA, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                            {
                                if (!yelled)
                                {
                                    switch (urand(1,8))
                                    {
                                        case 1:
                                            DoScriptText(SAY_MILITIA_RANDOM_1, Militia);
                                            break;
                                        case 2:
                                            DoScriptText(SAY_MILITIA_RANDOM_2, Militia);
                                            break;
                                        case 3:
                                            DoScriptText(SAY_MILITIA_RANDOM_3, Militia);
                                            break;
                                        case 4:
                                            DoScriptText(SAY_MILITIA_RANDOM_4, Militia);
                                            break;
                                        case 5:
                                            DoScriptText(SAY_MILITIA_RANDOM_5, Militia);
                                            break;
                                        case 6:
                                            DoScriptText(SAY_MILITIA_RANDOM_6, Militia);
                                            break;
                                        case 7:
                                            DoScriptText(SAY_MILITIA_RANDOM_7, Militia);
                                            break;
                                        case 8:
                                            DoScriptText(SAY_MILITIA_RANDOM_8, Militia);
                                            break;
                                    }
                                    yelled = true;
                                }
                            }
                        }
                        m_mobTimer[i] = 45000;
                        break;
                    }
                    case 6: // patrol management NPC_DAVIL_LIGHTFIRE NPC_BLOODLETTER NPC_CAPTAIN_REDPATH
                    {
                        for (const auto& guid : m_summonedMobsList)
                        {
                            if (Creature* Crea = me->GetMap()->GetCreature(guid))
                            {
                                if (Crea->GetEntry() != NPC_BLOODLETTER && Crea->GetEntry() != NPC_DAVIL_LIGHTFIRE && Crea->GetEntry() != NPC_CAPTAIN_REDPATH)
                                    continue;

                                if (Crea->IsAlive() && !Crea->IsInCombat() && Crea->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE)
                                {
                                    int point = 0;
                                    int rnd = 0;
                                    point = urand(0, 3);
                                    switch (point)
                                    {
                                        case 0:
                                            rnd = 5;
                                            break;
                                        case 1:
                                            rnd = 7;
                                            break;
                                        case 2:
                                            rnd = 4;
                                            break;
                                        case 3:
                                            rnd = 6;
                                            break;
                                    }
                                    Crea->GetMotionMaster()->MovePoint(point, DarrowshireEvent[rnd].X, DarrowshireEvent[rnd].Y, DarrowshireEvent[rnd].Z, MOVE_PATHFINDING, 5.0f);
                                }
                            }
                        }
                        m_mobTimer[i] = 5000;
                        break;
                    }
                    default:
                        break;
                }
            }
            else if (m_mobTimer[i])
                m_mobTimer[i] -= uiDiff;
        }

        if (m_phaseTimer && m_phaseTimer <= uiDiff)
        {
            switch (m_phaseStep)
            {
                case 0: // spawn first defenders
                {
                    if (Creature* pDefender = me->SummonCreature(NPC_DARROWSHIRE_DEFENDER, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_DEFENDER_YELL, pDefender);
                        pDefender->SetWalk(false);
                        pDefender->SetHomePosition(DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, DarrowshireEvent[4].O);
                        pDefender->GetMotionMaster()->MovePoint(0, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 3.0f);
                        m_phaseTimer = urand(120000, 180000);
                        m_phaseStep = 1;
                    }
                    break;
                }
                case 1: // 2:30 - 3 min after player puts down the bag
                {
                    if (Creature* davilLightfire = me->SummonCreature(NPC_DAVIL_LIGHTFIRE, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_LIGHTFIRE_YELL, davilLightfire);
                        m_davilGuid = davilLightfire->GetObjectGuid();
                        m_phaseTimer = 60000;
                        m_mobTimer[2] = 4000;
                        m_mobTimer[3] = 6000;
                        m_mobTimer[6] = 10000;
                        m_phaseStep = 2;
                    }
                    break;
                }
                case 2: // Horgus is spawned
                {
                    Creature* davil = me->GetMap()->GetCreature(m_davilGuid);
                    if (!davil)
                        break;

                    if (Creature* horgus = me->GetMap()->GetCreature(m_horgusGuid))
                    {
                        DoScriptText(SAY_DAVIL_YELL, davil);
                        m_phaseTimer = 0;
                        break;
                    }

                    float X, Y, Z;
                    me->GetRandomPoint(davil->GetPositionX(), davil->GetPositionY(), davil->GetPositionZ(), 6.0f, X, Y, Z);
                    if (Creature* horgus = me->SummonCreature(NPC_HORGUS_THE_RAVAGER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        horgus->AI()->AttackStart(davil);
                        m_horgusGuid = horgus->GetObjectGuid();
                        DoScriptText(SAY_HORGUS_YELL, horgus);
                        m_phaseTimer = 3000;
                    }
                    break;
                }
                case 3: // Horgus the Ravager is slain, Davil despawns, and Redpath spawns 
                {
                    if (Creature* davil = me->GetMap()->GetCreature(m_davilGuid))
                    {
                        davil->ForcedDespawn(2000);
                        DoScriptText(SAY_DAVIL_DESPAWN, davil);
                        m_phaseTimer = 10000;
                        break;
                    }

                    if (Creature* redpath = me->SummonCreature(NPC_CAPTAIN_REDPATH, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_REDPATH_YELL, redpath);
                        m_redpathGuid = redpath->GetObjectGuid();
                        m_phaseTimer = urand(300000, 350000);
                        m_phaseStep = 4;
                        m_mobTimer[4] = 4000;
                        m_mobTimer[5] = 6000;
                    }
                    break;
                }
                case 4: // Marduk spawns, normal Redpath is killed and corrupted Redpath spawns 
                {
                    Creature* marduk = me->GetMap()->GetCreature(m_mardukGuid);
                    if (marduk)
                    {
                        if (Creature* redpath = me->GetMap()->GetCreature(m_redpathGuid))
                        {
                            m_phaseStep = 5;
                            m_phaseTimer = 0;
                            marduk->DealDamage(redpath, redpath->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
                            if (Creature* redpathCorrupted = me->SummonCreature(NPC_REDPATH_THE_CORRUPTED, redpath->GetPositionX(), redpath->GetPositionY(), redpath->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                            {
                                DoScriptText(SAY_REDPATH_CORRUPTED, redpathCorrupted);
                                m_redpathCorruptedGuid = redpathCorrupted->GetObjectGuid();
                            }
                        }
                        break;
                    }

                    if (Creature* redpath = me->GetMap()->GetCreature(m_redpathGuid))
                    {
                        float X, Y, Z;
                        me->GetRandomPoint(redpath->GetPositionX(), redpath->GetPositionY(), redpath->GetPositionZ(), 10.0f, X, Y, Z);
                        if (Creature* marduk = me->SummonCreature(NPC_MARDUK_THE_BLACK, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                        {
                            DoScriptText(SAY_MARDUK_YELL, marduk);
                            m_mardukGuid = marduk->GetObjectGuid();
                            m_phaseTimer = 5000;
                        }
                    }
                    break;
                }
                default:
                    break;
            }
        }
        else if (m_phaseTimer)
            m_phaseTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_go_darrowshire_trigger(GameObject* pGo)
{
    return new go_darrowshire_triggerAI(pGo);
}

/*************************
*** npc_joseph_redpath ***
*************************/

enum JosephRedpathData
{
    SAY_JOSEPH_1            = 7397,
    SAY_PAMELA_1            = 7399,
    SAY_PAMELA_2            = 7400,
    SAY_PAMELA_3            = 7401,
    SAY_JOSEPH_2            = 7398,
    SAY_PAMELA_4            = 7402,
    SAY_JOSEPH_3            = 7403,

    NPC_PAMELA_REDPATH      = 10926
};

struct npc_joseph_redpathAI : public ScriptedAI
{
    explicit npc_joseph_redpathAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        EventStarted = false;
        EventTimer = 0;
        Reset();
    }

    bool EventStarted;
    uint32 EventStep;
    uint32 EventTimer;

    void Reset() override { }

    void BeginEvent()
    {
        if (!EventStarted)
        {
            EventTimer = 30000;
            EventStep = 0;
            EventStarted = true;
        }
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;
        
        switch(uiPointId)
        {
            case 0:
            {
                m_creature->GetMotionMaster()->MovePoint(1, 1434.22f, -3668.756f, 76.671f, MOVE_PATHFINDING, 1.5f);
                break;
            }
            case 1:
            {
                m_creature->GetMotionMaster()->MovePoint(2, 1438.526f, -3632.733f, 78.268f, MOVE_PATHFINDING, 1.2f);
                DoScriptText(SAY_JOSEPH_1, m_creature);
                EventTimer = 3000;
                break;
            }
            case 2:
            {
                if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                {
                    DoScriptText(SAY_PAMELA_2, pamela);
                    m_creature->SetWalk(false);
                    float x, y, z = 0;
                    pamela->GetContactPoint(m_creature, x, y, z, 1.0f);
                    m_creature->GetMotionMaster()->MovePoint(3, x, y, z, MOVE_PATHFINDING, 4.0f);
                    EventTimer = 0;
                }
                else
                    EventTimer = 1;
                break;
            }
            case 3:
            {
                if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 20.0f, true))
                {
                    m_creature->SetFacingToObject(pamela);
                    pamela->SetFacingToObject(m_creature);
                }
                EventTimer = 2000;
                break;
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (EventTimer && EventTimer <= uiDiff)
        {
            switch (EventStep)
            {
                case 0:
                {
                    m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    
                    m_creature->GetMotionMaster()->MovePoint(0, 1431.501f, -3684.229f, 75.726f, MOVE_PATHFINDING, 1.5f);
                    ++EventStep;
                    EventTimer = 0;
                    break;
                }
                case 1:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    { 
                        DoScriptText(SAY_PAMELA_1, pamela);
                        pamela->GetMotionMaster()->MovePoint(0, 1450.733f, -3599.974f, 85.621f, MOVE_PATHFINDING, 4.0f);
                    }
                    ++EventStep;
                    EventTimer = 0;
                    break;
                }
                case 2:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    {
                        DoScriptText(SAY_PAMELA_3, pamela);
                    }
                    ++EventStep;
                    EventTimer = 5000;
                    break;
                }
                case 3:
                {
                    DoScriptText(SAY_JOSEPH_2, m_creature);
                    ++EventStep;
                    EventTimer = 3000;
                    break;
                }
                case 4:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    {
                        DoScriptText(SAY_PAMELA_4, pamela);
                    }
                    ++EventStep;
                    EventTimer = 4000;
                    break;
                }
                case 5:
                {
                    DoScriptText(SAY_JOSEPH_3, m_creature);
                    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    m_creature->ForcedDespawn(6000);
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                        pamela->ForcedDespawn(4000);
                    EventTimer = 0;
                    break;
                }
                default:
                    break;
            }
        }
        else if (EventTimer)
            EventTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_joseph_redpath(Creature* pCreature)
{
    return new npc_joseph_redpathAI(pCreature);
}

bool GossipHello_npc_joseph_redpath(Player* pPlayer, Creature* pCreature)
{
    pPlayer->SEND_GOSSIP_MENU(10935, pCreature->GetGUID());
    if (pPlayer->GetQuestStatus(QUEST_BATTLE_DARROWSHIRE) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->KilledMonsterCredit(NPC_JOSEPH_REDPATH, pCreature->GetObjectGuid());
        pCreature->HandleEmote(EMOTE_ONESHOT_BEG);
        if (npc_joseph_redpathAI* pJosephAI = dynamic_cast<npc_joseph_redpathAI*>(pCreature->AI()))
            pJosephAI->BeginEvent();
    }
    return true;
}

enum MarkOfDetonationData
{
    QUEST_WHEN_SMOKEY_SINGS__I_GET_VIOLENT  = 6041,
    SPELL_PLACING_SMOKEY_S_EXPLOSIVES       = 19250,
    TRIGGER_SCOURGE_STRUCTURE = 12247
};

bool EffectDummyGameObj_go_mark_of_detonation(WorldObject* pCaster, uint32 uiSpellId, SpellEffectIndex effIndex, GameObject* pGameObjectTarget)
{
    //always check spellid and effectindex
    if (uiSpellId == SPELL_PLACING_SMOKEY_S_EXPLOSIVES && effIndex == EFFECT_INDEX_0)
    {
        if (Player* pPlayer = pCaster->ToPlayer())
        {
            if (Creature* pCreature = pGameObjectTarget->FindNearestCreature(TRIGGER_SCOURGE_STRUCTURE, 8.000000, true))
            {
                pPlayer->KilledMonsterCredit(pCreature->GetEntry(), pCreature->GetObjectGuid());
                pCreature->DealDamage(pCreature, pCreature->GetHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
            }
            //always return true when we are handling this spell and effect
            pGameObjectTarget->Despawn();
            return true;
        }
    }
    return false;
}

/*************************
*** npc_guard_didier ***
*************************/

enum GuardDidierData
{
    SAY_MULE_DIED = 12118,
    SPELL_MARK_OF_DIDIER = 28114,
    GOSSIP_NOT_STARTED = 7165,
    GOSSIP_MULE_DIED = 7168,
};

struct npc_guard_didierAI : public ScriptedAI
{
    explicit npc_guard_didierAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_muleDied = false;
        Reset();
    }

    bool m_muleDied;

    void Reset() override { }

    void JustRespawned() override
    {
        m_muleDied = false;
        m_creature->SetReactState(REACT_PASSIVE);
        m_creature->SetDefaultGossipMenuId(GOSSIP_NOT_STARTED);
    }

    void JustDied(Unit* killer) override
    {
        m_muleDied = false;

        if (CreatureGroup* pGroup = m_creature->GetCreatureGroup())
            pGroup->DoForAllMembers(m_creature->GetMap(), [](Creature* pMember) { if (pMember->IsAlive()) pMember->DespawnOrUnsummon(1); });
    }

    void JustReachedHome() override
    {
        if (m_muleDied)
        {
            m_muleDied = false;
            m_creature->GetMotionMaster()->Clear(false, true);
            m_creature->GetMotionMaster()->MoveIdle();
            m_creature->MonsterSay(SAY_MULE_DIED);
            m_creature->HandleEmote(EMOTE_ONESHOT_CRY);
            m_creature->SetDefaultGossipMenuId(GOSSIP_MULE_DIED);
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

            if (CreatureGroup* pGroup = m_creature->GetCreatureGroup())
                pGroup->DoForAllMembers(m_creature->GetMap(), [](Creature* pMember)
                {
                    if (pMember->IsAlive())
                    {
                        if (pMember->HasAura(SPELL_MARK_OF_DIDIER))
                            pMember->RemoveAurasDueToSpell(SPELL_MARK_OF_DIDIER);

                        pMember->DespawnOrUnsummon(90 * IN_MILLISECONDS);
                    }
                });
            m_creature->DespawnOrUnsummon(90 * IN_MILLISECONDS);

            if (m_creature->HasAura(SPELL_MARK_OF_DIDIER))
                m_creature->RemoveAurasDueToSpell(SPELL_MARK_OF_DIDIER);
        }
        else
        {
            m_creature->SetReactState(REACT_PASSIVE);
        }
    }

    void GroupMemberJustDied(Creature* unit, bool isLeader) override
    {
        m_muleDied = true;
    }

    void EnableCombat(Unit* pAttacker)
    {
        m_creature->SetReactState(REACT_AGGRESSIVE);

        if (CreatureGroup* pGroup = m_creature->GetCreatureGroup())
            pGroup->DoForAllMembers(m_creature->GetMap(), [pAttacker](Creature* pMember)
            {
                if (!pMember->HasReactState(REACT_AGGRESSIVE) && pMember->IsAlive())
                {
                    pMember->SetReactState(REACT_AGGRESSIVE);
                    pMember->AI()->AttackStart(pAttacker);
                }
            });
    }

    void DamageTaken(Unit* pAttacker, uint32& /*damage*/) override
    {
        if (!m_creature->HasReactState(REACT_AGGRESSIVE))
        {
            EnableCombat(pAttacker);
            AttackStart(pAttacker);
        }
    }

    void AttackStart(Unit* pVictim)
    {
        if (m_creature->HasReactState(REACT_PASSIVE))
        {
            if (m_creature->IsWithinDistInMap(pVictim, m_creature->GetAttackDistance(pVictim)))
                EnableCombat(pVictim);
            else
            {
                // always add threat even if passive to avoid constantly evading
                m_creature->AddThreat(pVictim);
                return;
            }
        }
        
        ScriptedAI::AttackStart(pVictim);
    }
};

CreatureAI* GetAI_npc_guard_didier(Creature* pCreature)
{
    return new npc_guard_didierAI(pCreature);
}

/*************************
*** npc_caravan_mule ***
*************************/

struct npc_caravan_muleAI : public ScriptedAI
{
    explicit npc_caravan_muleAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_creature->SetReactState(REACT_PASSIVE);
    }

    void Reset() override
    { 
        m_creature->SetReactState(REACT_PASSIVE);
    }

    void EnableCombat(Unit* pAttacker)
    {
        m_creature->SetReactState(REACT_AGGRESSIVE);

        if (CreatureGroup* pGroup = m_creature->GetCreatureGroup())
            pGroup->DoForAllMembers(m_creature->GetMap(), [pAttacker](Creature* pMember)
        {
            if (!pMember->HasReactState(REACT_AGGRESSIVE) && pMember->IsAlive())
            {
                pMember->SetReactState(REACT_AGGRESSIVE);
                pMember->AI()->AttackStart(pAttacker);
            }
        });
    }

    void DamageTaken(Unit* pAttacker, uint32& /*damage*/) override
    {
        if (!m_creature->HasReactState(REACT_AGGRESSIVE))
        {
            EnableCombat(pAttacker);
            AttackStart(pAttacker);
        }
    }

    void AttackStart(Unit* pVictim)
    {
        if (m_creature->HasReactState(REACT_PASSIVE))
        {
            if (m_creature->IsWithinDistInMap(pVictim, m_creature->GetAttackDistance(pVictim)))
                EnableCombat(pVictim);
            else
            {
                // always add threat even if passive to avoid constantly evading
                m_creature->AddThreat(pVictim);
                return;
            }
        }

        ScriptedAI::AttackStart(pVictim);
    }
};

CreatureAI* GetAI_npc_caravan_mule(Creature* pCreature)
{
    return new npc_caravan_muleAI(pCreature);
}

void AddSC_eastern_plaguelands()
{
    Script* newscript;

    // Nostalrius -- Rockette

    newscript = new Script;
    newscript->Name = "npc_eris_havenfire";
    newscript->GetAI = &GetAI_npc_eris_havenfire;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_eris_havenfire;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_eris_havenfire_peasant";
    newscript->GetAI = &GetAI_npc_eris_havenfire_peasant;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_darrowshire_trigger";
    newscript->GOGetAI = &GetAI_go_darrowshire_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_joseph_redpath";
    newscript->GetAI = &GetAI_npc_joseph_redpath;
    newscript->pGossipHello = &GossipHello_npc_joseph_redpath;
    newscript->RegisterSelf();

    //Alita
    newscript = new Script;
    newscript->Name = "npc_demetria";
    newscript->GetAI = &GetAI_npc_demetria;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_mark_of_detonation";
    newscript->pEffectDummyGameObj = &EffectDummyGameObj_go_mark_of_detonation;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_guard_didier";
    newscript->GetAI = &GetAI_npc_guard_didier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_caravan_mule";
    newscript->GetAI = &GetAI_npc_caravan_mule;
    newscript->RegisterSelf();
}
