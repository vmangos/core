#include "Anticheat.h"

AnticheatManager* AnticheatManager::instance()
{
    static AnticheatManager i;
    return &i;
}

AnticheatManager* GetAnticheatLib()
{
    return AnticheatManager::instance();
}

#ifdef USE_ANTICHEAT

#include "World.h"
#include "WorldSession.h"

#include "MovementAnticheat/MovementAnticheat.h"
#include "WardenAnticheat/Warden.h"
#include "WardenAnticheat/WardenWin.h"
#include "WardenAnticheat/WardenMac.h"

void AnticheatManager::LoadAnticheatData()
{
    sLog.outString();
    sLog.outString("Loading warden checks...");
    sWardenMgr->LoadWardenChecks();
    
    sLog.outString();
    sLog.outString("Loading warden modules...");
    sWardenMgr->LoadWardenModules();
}

MovementAnticheat* AnticheatManager::CreateAnticheatFor(Player* player)
{
    MovementAnticheat* cd = new MovementAnticheat(player);
    cd->Init();
    cd->InitSpeeds(player);
    return cd;
}

Warden* AnticheatManager::CreateWardenFor(WorldSession* client, BigNumber* K)
{
    if ((client->GetSecurity() != SEC_PLAYER) &&
        sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_PLAYERS_ONLY))
        return nullptr;

    Warden* warden;
    ClientOSType os = client->GetOS();

    if (os == CLIENT_OS_MAC && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_OSX_ENABLED))
        warden = new WardenMac();
    else if (os == CLIENT_OS_WIN && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_WIN_ENABLED))
        warden = new WardenWin();
    else
        return nullptr;

    warden->Init(client, K);

    return warden;
}

#endif