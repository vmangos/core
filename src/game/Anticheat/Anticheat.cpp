#include "Anticheat.h"

#ifndef USE_ANTICHEAT

AnticheatLibInterface* GetAnticheatLib()
{
    static AnticheatLibInterface l;
    return &l;
}

#else

#include "World.h"
#include "WorldSession.h"

#include "MovementAnticheat/MovementAnticheat.h"
#include "WardenAnticheat/Warden.h"
#include "WardenAnticheat/WardenWin.h"
#include "WardenAnticheat/WardenMac.h"

void MangosAnticheatLib::LoadAnticheatData()
{
    sLog.outString();
    sLog.outString("Loading warden checks...");
    sWardenMgr->LoadWardenChecks();
    
    sLog.outString();
    sLog.outString("Loading warden modules...");
    sWardenMgr->LoadWardenModules();
}

MovementAnticheatInterface* MangosAnticheatLib::CreateAnticheatFor(Player* player)
{
    MovementCheatData* cd = new MovementCheatData(player);
    cd->Init();
    cd->InitSpeeds(player);
    return cd;
}

WardenInterface* MangosAnticheatLib::CreateWardenFor(WorldSession* client, BigNumber* K)
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

MangosAnticheatLib* MangosAnticheatLib::instance()
{
    static MangosAnticheatLib i;
    return &i;
}

AnticheatLibInterface* GetAnticheatLib()
{
    return MangosAnticheatLib::instance();
}

#endif