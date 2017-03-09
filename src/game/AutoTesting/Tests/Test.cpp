/*
 * Test.cpp
 *
 *  Created on: 22 janv. 2015
 *      Author: Daemon
 */

#include "TestPCH.h"

class testsystem_sample : public SingleTest
{
public:
    testsystem_sample() : SingleTest("testsystem_sample")
    {
    }

    void Test() override
    {
        if (!GetMap())
            Finish(false);
        switch (GetTestStep())
        {
            case 0:
                Wait(100);
                break;
            case 1:
                Finish(true);
                break;
        }
        NextStep();
    }
};

class testsystem_spawncreature : public SingleTest
{
public:
    testsystem_spawncreature() : SingleTest("testsystem_spawncreature")
    {
    }

    void Test() override
    {
        Creature* c = SpawnCreature(0, 1);
        if (c)
            Finish();
        else
            Fail("Unable to spawn creature 1");
    }
};

class testsystem_spawnplayer : public SingleTest
{
public:
    testsystem_spawnplayer() : SingleTest("testsystem_spawnplayer")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                NextStep();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0);
                if (!p)
                    Fail("Unable to summon a player");
                else if (p->getClass() != CLASS_WARLOCK && p->getRace() != RACE_GNOME)
                    Fail("Bad class or race");
                else if (p->FindMap() != GetMap())
                    Fail("Bad map");
                else
                    Finish();
                return;
            }
        }
    }
};

enum
{
    NPC_MAGMADAR        = 11982,
    MAP_MOLTEN_CORE     = 409,
};

// Try to spawn a creature / a player inside an instanced map
class testsystem_instanced_magmadar : public SingleTest
{
public:
    testsystem_instanced_magmadar() : SingleTest("testsystem_instanced_magmadar", MAP_MOLTEN_CORE, true)
    {
        SetCenterPosition(1136, -1028, -185.5);
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
            {
                Creature* c = SpawnCreature(1, 1);
                if (!c)
                    Fail("Failed to summon a creature");
                else if (c->GetMap() != GetMap())
                    Fail("Creature summoned on the wrong map");
                else if (!c->FindNearestCreature(NPC_MAGMADAR, 50.0f))
                    Fail("Unit magmadar not found near creature");
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                Wait(500);
                NextStep();
                break;
            }
            case 1:
            {
                Player* p = GetTestPlayer(0);
                if (!p)
                    Fail("Unable to summon a player");
                else if (p->getClass() != CLASS_WARLOCK && p->getRace() != RACE_GNOME)
                    Fail("Bad player class or race");
                else if (p->FindMap() != GetMap())
                    Fail("Bad player map");
                else if (p->GetInstanceId() != GetMap()->GetInstanceId())
                    Fail("Diff instance id (player vs map)");
                else if (!p->FindNearestCreature(NPC_MAGMADAR, 50.0f))
                    Fail("Unit magmadar not found near player");
                else
                    Finish();
                return;
            }
        }
    }
};

void AddTest_testsystem()
{
    sAutoTestingMgr->AddTest(new testsystem_sample);
    sAutoTestingMgr->AddTest(new testsystem_spawncreature);
    sAutoTestingMgr->AddTest(new testsystem_spawnplayer);
    sAutoTestingMgr->AddTest(new testsystem_instanced_magmadar);
}
