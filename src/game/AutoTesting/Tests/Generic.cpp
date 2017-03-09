/*
 * Generic.cpp
 */

#include "TestPCH.h"
#include "PathFinder.h"

enum
{
    SPELL_DUEL              = 7266,
    SPELL_SUMMON_SUCCUBUS   = 712,
    ITEM_SOUL_SHARD         = 6265,
};

class generic_duel_pets : public SingleTest
{
public:
    generic_duel_pets() : SingleTest("generic_duel_pets")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME, 1);
                SpawnPlayer(1, CLASS_WARLOCK, RACE_GNOME, -1);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* player1 = GetTestPlayer(0, TESTPLAYER_MAXLEVEL | TESTPLAYER_PVP_ON);
                Player* player2 = GetTestPlayer(1, TESTPLAYER_MAXLEVEL | TESTPLAYER_PVP_ON);
                player1->CastSpell(player2, SPELL_DUEL, false);
                Wait(2000);
                break;
            }
            case 2:
            {
                Player* player1 = GetTestPlayer(0);
                Player* player2 = GetTestPlayer(1);
                player1->EnableOption(PLAYER_CHEAT_NO_CAST_TIME);
                player2->EnableOption(PLAYER_CHEAT_NO_CAST_TIME);
                player1->AddItem(ITEM_SOUL_SHARD, 1);
                player2->AddItem(ITEM_SOUL_SHARD, 1);
                player1->CastSpell(player1, SPELL_SUMMON_SUCCUBUS, false);
                player2->CastSpell(player2, SPELL_SUMMON_SUCCUBUS, false);
                WorldPacket data(CMSG_DUEL_ACCEPTED, 8);
                data << ObjectGuid();
                player2->GetSession()->HandleDuelAcceptedOpcode(data);
                Wait(4000); // Wait for duel begin
                break;
            }
            case 3:
            {
                Player* player1 = GetTestPlayer(0);
                Player* player2 = GetTestPlayer(1);
                TEST_ASSERT(player1->duel);
                TEST_ASSERT(player2->duel);
                TEST_ASSERT(player1->GetPet());
                TEST_ASSERT(player2->GetPet());
                player1->GetPet()->AI()->AttackStart(player2->GetPet());
                player2->GetPet()->AI()->AttackStart(player1->GetPet());
                Wait(2000);
                break;
            }
            case 4:
            {
                Player* player1 = GetTestPlayer(0);
                Player* player2 = GetTestPlayer(1);
                WorldPacket data(CMSG_DUEL_CANCELLED);
                data << ObjectGuid();
                player1->GetSession()->HandleDuelCancelledOpcode(data);
                Wait(2000);
                break;
            }
            case 5:
            {
                Player* player1 = GetTestPlayer(0);
                Player* player2 = GetTestPlayer(1);
                TEST_ASSERT(!player1->duel);
                TEST_ASSERT(!player2->duel);
                TEST_ASSERT(player1->GetPet());
                TEST_ASSERT(player2->GetPet());
                TEST_ASSERT(!player1->GetPet()->isInCombat());
                TEST_ASSERT(!player2->GetPet()->isInCombat());
                Finish();
                break;
            }
        }
        NextStep();
    }
};

class map_tester : public SingleTest
{
public:
    map_tester(const char* name) : SingleTest(name)
    {
    }
    void LoadMap(uint32 map, float x, float y, float z)
    {
        int gx = (int)(32 - x / SIZE_OF_GRIDS);
        int gy = (int)(32 - y / SIZE_OF_GRIDS);
        VMAP::VMapFactory::createOrGetVMapManager()->loadMap((sWorld.GetDataPath() + "vmaps").c_str(), map, gx, gy);
        MMAP::MMapFactory::createOrGetMMapManager()->loadMap(map, gx, gy);
    }
    float ComputeVmapHeight(uint32 map, float x, float y, float z)
    {
        LoadMap(map, x, y, z);
        VMAP::IVMapManager* vmgr = VMAP::VMapFactory::createOrGetVMapManager();
        return vmgr->getHeight(map, x, y, z, DEFAULT_HEIGHT_SEARCH);
    }
    bool ComputeLoS(uint32 map, float x1, float y1, float z1, float x2, float y2, float z2)
    {
        LoadMap(map, x1, y1, z1);
        LoadMap(map, x2, y2, z2);
        VMAP::IVMapManager* vmgr = VMAP::VMapFactory::createOrGetVMapManager();
        return vmgr->isInLineOfSight(map, x1, y1, z1, x2, y2, z2);
    }
    float GetWalkPolyZ(uint32 map, float x, float y, float z)
    {
        LoadMap(map, x, y, z);
        float points[3] = {y, z, x};
        float closestPoint[3] = {0};
        dtQueryFilter filter;
        filter.setIncludeFlags(0xF);
        filter.setExcludeFlags(NAV_STEEP_SLOPES);
        MMAP::MMapManager* mmap = MMAP::MMapFactory::createOrGetMMapManager();
        const dtNavMeshQuery* navMeshQuery = mmap->GetNavMeshQuery(map);
        TEST_ASSERT(navMeshQuery);
        if (!PathInfo::FindWalkPoly(navMeshQuery, points, filter, closestPoint))
            Fail("Unable to find walk poly [%.2f %.2f %.2f map:%u]", x, y, z, map);
        return closestPoint[1];
    }
};

class map_skull_rock : public map_tester
{
public:
    map_skull_rock() : map_tester("map_skull_rock")
    {
    }

    void Test() override
    {
        // Skull Rock
        float h = ComputeVmapHeight(1, 1457, -4780, 12);
        TEST_ASSERT(h < 12 && h > 8);
        TEST_ASSERT(!ComputeLoS(1, 1457, -4780, 12, 1479, -4800, 12));
        Finish();
    }
};

class pathfinding_arathi_basin: public map_tester
{
public:
    pathfinding_arathi_basin(): map_tester("pathfinding_arathi_basin"), _total(0), _passed(0)
    {
    }
    uint32 _passed;
    uint32 _total;
    void WalkUnderMe(uint32 mapId, float x, float y, float z)
    {
        ++_total;
        float polyZ = GetWalkPolyZ(mapId, x, y, z);
        if (polyZ < z + 1.4f)
            ++_passed;
        else
            sLog.outError("Failed at [%.2f %.2f %.2f map:%u]. Walk found = %f", x, y, z, mapId, polyZ);
    }
    void Test() override
    {
        _passed = _total = 0;
        WalkUnderMe(529, 1313.90f, 1310.74f, -9.01f);
        WalkUnderMe(529, 1291.76f, 1286.97f, -14.03f);
        WalkUnderMe(529, 1273.88f, 1268.05f, -21.35f);
        WalkUnderMe(529, 1206.48f, 1197.23f, -52.56f);
        WalkUnderMe(529, 1200.75f, 1192.13f, -56.56f);
        WalkUnderMe(529, 1196.32f, 1189.14f, -55.91f);
        WalkUnderMe(529, 1195.17f, 1189.56f, -56.34f);
        WalkUnderMe(529, 1194.45f, 1190.38f, -55.13f);
        WalkUnderMe(529, 1193.28f, 1189.17f, -55.23f);
        WalkUnderMe(529, 1193.67f, 1188.84f, -55.23f);
        WalkUnderMe(529, 1196.53f, 1187.70f, -54.18f);
        WalkUnderMe(529, 1197.44f, 1187.89f, -54.18f);
        WalkUnderMe(529, 1197.61f, 1186.46f, -56.50f);
        WalkUnderMe(529, 1197.65f, 1185.03f, -55.92f);
        WalkUnderMe(529, 1196.42f, 1183.81f, -56.42f);
        WalkUnderMe(529, 1190.84f, 1180.24f, -55.23f);
        WalkUnderMe(529, 1183.63f, 1170.61f, -55.58f);
        WalkUnderMe(529, 1181.84f, 1170.69f, -55.73f);
        WalkUnderMe(529, 1180.26f, 1171.19f, -56.37f);
        WalkUnderMe(529, 1180.10f, 1179.88f, -56.36f);
        WalkUnderMe(529, 1183.98f, 1182.91f, -56.36f);
        WalkUnderMe(529, 1190.08f, 1181.83f, -56.36f);
        WalkUnderMe(529, 1188.51f, 1190.07f, -56.36f);
        WalkUnderMe(529, 1187.26f, 1190.87f, -56.36f);
        WalkUnderMe(529, 1176.79f, 1196.81f, -56.35f);
        WalkUnderMe(529, 1165.17f, 1205.78f, -56.39f);
        WalkUnderMe(529, 1157.52f, 1212.57f, -55.22f);
        WalkUnderMe(529, 1143.67f, 1219.93f, -54.22f);
        WalkUnderMe(529, 1086.08f, 1217.52f, -53.14f);
        WalkUnderMe(529, 1063.62f, 1220.21f, -52.41f);
        WalkUnderMe(529, 1052.84f, 1220.42f, -50.53f);
        WalkUnderMe(529, 1033.77f, 1220.52f, -46.78f);
        WalkUnderMe(529, 1010.70f, 1221.07f, -44.48f);
        WalkUnderMe(529, 980.15f, 1222.59f, -41.79f);
        WalkUnderMe(529, 969.06f, 1222.99f, -39.60f);
        WalkUnderMe(529, 958.73f, 1223.78f, -35.09f);
        WalkUnderMe(529, 945.21f, 1223.36f, -26.85f);
        WalkUnderMe(529, 930.86f, 1219.91f, -18.65f);
        WalkUnderMe(529, 918.65f, 1214.04f, -12.49f);
        WalkUnderMe(529, 906.85f, 1208.35f, -6.88f);
        WalkUnderMe(529, 894.86f, 1203.08f, -0.40f);
        WalkUnderMe(529, 888.25f, 1200.77f, 2.89f);
        WalkUnderMe(529, 882.05f, 1198.65f, 6.19f);
        WalkUnderMe(529, 862.41f, 1190.93f, 9.72f);
        WalkUnderMe(529, 837.94f, 1184.11f, 11.78f);
        WalkUnderMe(529, 817.45f, 1186.33f, 12.47f);
        WalkUnderMe(529, 797.74f, 1186.65f, 13.48f);
        WalkUnderMe(529, 785.78f, 1181.42f, 12.28f);
        WalkUnderMe(529, 783.85f, 1169.51f, 12.85f);
        WalkUnderMe(529, 797.13f, 1163.34f, 11.81f);
        WalkUnderMe(529, 809.30f, 1157.68f, 11.53f);
        WalkUnderMe(529, 821.15f, 1159.75f, 11.53f);
        WalkUnderMe(529, 833.14f, 1150.84f, 11.02f);
        WalkUnderMe(529, 841.73f, 1164.51f, 11.06f);
        WalkUnderMe(529, 834.41f, 1167.08f, 12.71f);
        WalkUnderMe(529, 820.98f, 1172.63f, 13.35f);
        WalkUnderMe(529, 819.49f, 1166.97f, 13.36f);
        WalkUnderMe(529, 817.75f, 1164.12f, 11.53f);
        WalkUnderMe(529, 914.83f, 1071.94f, -66.77f);
        WalkUnderMe(529, 871.92f, 1049.54f, -58.79f);
        WalkUnderMe(529, 867.50f, 1039.42f, -58.51f);
        WalkUnderMe(529, 904.21f, 997.47f, -62.22f);
        WalkUnderMe(529, 906.26f, 998.21f, -61.21f);
        WalkUnderMe(529, 920.69f, 1006.26f, -55.53f);
        WalkUnderMe(529, 936.10f, 1020.36f, -49.51f);
        WalkUnderMe(529, 958.09f, 1025.28f, -45.74f);
        WalkUnderMe(529, 980.99f, 1018.19f, -43.54f);
        WalkUnderMe(529, 1006.68f, 998.87f, -44.40f);
        WalkUnderMe(529, 1005.15f, 984.02f, -43.25f);
        WalkUnderMe(529, 1003.70f, 981.47f, -43.22f);
        WalkUnderMe(529, 998.19f, 978.25f, -42.43f);
        WalkUnderMe(529, 990.35f, 977.11f, -44.03f);
        WalkUnderMe(529, 987.98f, 972.59f, -44.34f);
        WalkUnderMe(529, 981.88f, 970.35f, -44.55f);
        WalkUnderMe(529, 979.02f, 974.34f, -44.08f);
        WalkUnderMe(529, 979.09f, 974.38f, -44.08f);
        WalkUnderMe(529, 979.94f, 974.23f, -44.08f);
        WalkUnderMe(529, 979.56f, 974.63f, -43.59f);
        WalkUnderMe(529, 979.50f, 974.55f, -44.00f);
        WalkUnderMe(529, 973.46f, 979.31f, -43.91f);
        WalkUnderMe(529, 972.11f, 986.35f, -43.92f);
        WalkUnderMe(529, 970.70f, 993.45f, -44.11f);
        WalkUnderMe(529, 977.52f, 993.65f, -44.13f);
        WalkUnderMe(529, 979.00f, 996.73f, -44.09f);
        WalkUnderMe(529, 980.24f, 1000.51f, -42.84f);
        WalkUnderMe(529, 980.09f, 1003.31f, -42.64f);
        WalkUnderMe(529, 976.67f, 1008.48f, -43.16f);
        WalkUnderMe(529, 976.30f, 1008.84f, -43.23f);
        WalkUnderMe(529, 975.41f, 1009.47f, -43.71f);
        WalkUnderMe(529, 974.76f, 1010.71f, -43.06f);
        WalkUnderMe(529, 974.84f, 1010.21f, -44.43f);
        WalkUnderMe(529, 967.03f, 1015.90f, -45.64f);
        WalkUnderMe(529, 964.58f, 1022.69f, -45.11f);
        WalkUnderMe(529, 957.49f, 1019.45f, -45.76f);
        WalkUnderMe(529, 889.47f, 989.52f, -62.46f);
        WalkUnderMe(529, 859.18f, 979.98f, -61.86f);
        WalkUnderMe(529, 847.24f, 960.08f, -60.79f);
        WalkUnderMe(529, 834.96f, 939.00f, -59.70f);
        WalkUnderMe(529, 828.08f, 910.76f, -60.37f);
        WalkUnderMe(529, 821.15f, 887.86f, -59.38f);
        WalkUnderMe(529, 811.82f, 860.85f, -57.80f);
        WalkUnderMe(529, 801.99f, 834.46f, -57.35f);
        WalkUnderMe(529, 810.27f, 834.65f, -57.05f);
        WalkUnderMe(529, 815.38f, 836.12f, -57.19f);
        WalkUnderMe(529, 816.96f, 836.21f, -57.20f);
        WalkUnderMe(529, 825.07f, 836.66f, -57.30f);
        WalkUnderMe(529, 832.84f, 837.42f, -58.21f);
        WalkUnderMe(529, 838.74f, 838.24f, -58.07f);
        WalkUnderMe(529, 829.04f, 843.02f, -57.98f);
        WalkUnderMe(529, 824.92f, 848.76f, -57.70f);
        WalkUnderMe(529, 821.02f, 853.98f, -57.87f);
        WalkUnderMe(529, 815.49f, 851.08f, -57.26f);
        WalkUnderMe(529, 808.32f, 849.91f, -57.35f);
        WalkUnderMe(529, 806.71f, 843.03f, -57.32f);
        WalkUnderMe(529, 813.23f, 844.20f, -56.54f);
        WalkUnderMe(529, 818.95f, 841.77f, -56.54f);
        WalkUnderMe(529, 812.48f, 843.28f, -56.54f);
        WalkUnderMe(529, 808.70f, 837.80f, -56.45f);
        WalkUnderMe(529, 810.91f, 829.62f, -57.39f);
        WalkUnderMe(529, 818.91f, 827.73f, -57.46f);
        WalkUnderMe(529, 824.88f, 830.92f, -57.33f);
        WalkUnderMe(529, 831.69f, 834.55f, -58.00f);
        WalkUnderMe(529, 829.69f, 844.89f, -58.21f);
        if (_passed != _total)
            Fail("Passed %u/%u", _passed, _total);
        Finish();
    }
};

enum
{
    SPELL_IMMOLATE     = 11668,
};

class generic_debuff_limit : public SingleTest
{
public:
    generic_debuff_limit() : SingleTest("generic_debuff_limit", MAP_SPECIAL_GURUBASHI)
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARRIOR, RACE_ORC);
                for (int i = 0; i < 40; ++i)
                    SpawnPlayer(i + 1, CLASS_WARLOCK, RACE_HUMAN, 10.0f * cos(2 * i * M_PI / 40), 10.0f * sin(2 * i * M_PI / 40));
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warrior = GetTestPlayer(0, TESTPLAYER_PVP_ON | TESTPLAYER_MAXLEVEL);
                for (int i = 0; i < 40; ++i)
                {
                    Player* warlock = GetTestPlayer(i + 1, TESTPLAYER_PVP_ON | TESTPLAYER_MAXLEVEL);
                    warlock->SetFacingToObject(warrior);
                }
                break;
            }
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            {
                Player* warrior = GetTestPlayer(0);
                Player* warlock = GetTestPlayer(GetTestStep() - 1);
                warlock->CastSpell(warrior, SPELL_IMMOLATE, false);
                warlock = GetTestPlayer(GetTestStep() - 1 + 20);
                warlock->CastSpell(warrior, SPELL_IMMOLATE, false);
                Wait(50);
                break;
            }
            case 22:
            {
                Wait(3000); // Cast time
                break;
            }
            case 23:
            {
                // Count immolation auras
                Player* warrior = GetTestPlayer(0);
                uint32 count = 0;
                for (Unit::SpellAuraHolderMap::const_iterator it = warrior->GetSpellAuraHolderMap().begin(); it != warrior->GetSpellAuraHolderMap().end(); ++it)
                    if (it->second->GetId() == SPELL_IMMOLATE)
                        ++count;
                TEST_ASSERT(count <= sWorld.getConfig(CONFIG_UINT32_DEBUFF_LIMIT));
                Finish();
                break;
            }
        }
        NextStep();
    }
};

class generic_auras_stack : public map_tester
{
public:
    generic_auras_stack() : map_tester("generic_auras_stack")
    {
    }

    void Test() override
    {
        TEST_ASSERT(!sSpellMgr.IsNoStackSpellDueToSpell(16237, 22817) && "Ancestral Fortitude Buff / Fengus Ferocity");
        TEST_ASSERT(!sSpellMgr.IsNoStackSpellDueToSpell(17836, 23047) && "Improved Immolate / Immolate Cast Time Reduction");
        // AV buffs (source: https://www.youtube.com/watch?v=mHCWs1AP5Bo)
        TEST_ASSERT(!sSpellMgr.IsNoStackSpellDueToSpell(28418, 22751) && "AV: General's Warcry / Fury of the Frostwolf");
        TEST_ASSERT(!sSpellMgr.IsNoStackSpellDueToSpell(28419, 23693) && "AV: General's Warcry / Stormpike's Salvation");
        TEST_ASSERT(sSpellMgr.IsNoStackSpellDueToSpell(28418, 28419) && "AV: General's Warcry / General's Warcry");
        Finish();
    }
};

void AddTest_generic()
{
    sAutoTestingMgr->AddTest(new generic_duel_pets);
    sAutoTestingMgr->AddTest(new generic_debuff_limit);
    sAutoTestingMgr->AddTest(new map_skull_rock);
    sAutoTestingMgr->AddTest(new pathfinding_arathi_basin);
    sAutoTestingMgr->AddTest(new generic_auras_stack);
}
