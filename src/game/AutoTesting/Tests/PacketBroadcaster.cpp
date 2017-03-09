/*
* PacketBroadcaster.cpp
*
*/
#include "TestPCH.h"

class packet_broadcaster_locks : public SingleTest
{
public:
    packet_broadcaster_locks(const char* name) : SingleTest(name, MAP_TESTING_ID, false)
    {

    }

    void Test() override
    {
        const int NUM_PLAYERS_PER_TICK = 50;
        const int NUM_SPAWN_TICKS = 20;

        // Spawn players
        if (GetTestStep() < NUM_SPAWN_TICKS)
        {
            for (int i = 0; i < NUM_PLAYERS_PER_TICK; ++i)
                SpawnPlayer(GetTestStep()*NUM_PLAYERS_PER_TICK + i, CLASS_PALADIN, RACE_HUMAN, 0, 0);
        }
        else
        switch (GetTestStep() - NUM_SPAWN_TICKS)
        {
            case 0:
                Wait(5000);
                break;
            case 1:
                for (int i = 0; i < NUM_SPAWN_TICKS*NUM_PLAYERS_PER_TICK; ++i)
                    GetTestPlayer(i, 0)->AddAura(31365); // Self fear
                Wait(5000);
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            {
                WorldPacket data(MSG_MOVE_FALL_LAND, 0);
                for (int i = 0; i < NUM_SPAWN_TICKS*NUM_PLAYERS_PER_TICK; ++i)
                    GetTestPlayer(i, 0)->SendMovementMessageToSet(data, true);
                Wait(100);
                break;
            }
            case 11:
                Finish();
                break;
        }
        NextStep();
    }
};

void AddTest_packet_broadcaster()
{
    sAutoTestingMgr->AddTest(new packet_broadcaster_locks("packet_broadcaster_locks"));
}

