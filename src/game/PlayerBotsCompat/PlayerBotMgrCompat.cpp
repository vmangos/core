#include "PlayerBotMgrCompat.h"

#include "ModPlayerBots/Bot/PlayerbotAI.h"
#include "ModPlayerBots/Bot/PlayerbotMgr.h"
#include "ModPlayerBots/Bot/RandomPlayerbotMgr.h"
#include "World.h"
#include "WorldSession.h"

PlayerBotMgr& PlayerBotMgr::instance()
{
    static PlayerBotMgr instance;
    return instance;
}

void PlayerBotMgr::LoadConfig()
{
}

void PlayerBotMgr::Load()
{
    sRandomPlayerbotMgr.Init();
}

void PlayerBotMgr::DeleteAll()
{
    sRandomPlayerbotMgr.LogoutAllBots();
}

void PlayerBotMgr::Update(uint32 diff)
{
    sRandomPlayerbotMgr.UpdateAI(diff);
    sRandomPlayerbotMgr.UpdateSessions();

    World::SessionMap sessions = sWorld.GetAllSessions();
    for (auto const& itr : sessions)
    {
        WorldSession* session = itr.second;
        if (!session)
            continue;

        Player* player = session->GetPlayer();
        if (!player)
            continue;

        if (PlayerbotAI* botAI = sPlayerbotsMgr.GetPlayerbotAI(player))
            botAI->UpdateAI(diff);

        if (PlayerbotMgr* playerbotMgr = sPlayerbotsMgr.GetPlayerbotMgr(player))
        {
            playerbotMgr->UpdateAI(diff);
            playerbotMgr->UpdateSessions();
        }
    }
}

void PlayerBotMgr::OnPlayerInWorld(Player* player)
{
    if (!player || player->IsBot())
        return;

    if (!sPlayerbotsMgr.GetPlayerbotMgr(player))
        sPlayerbotsMgr.AddPlayerbotData(player, false);

    sRandomPlayerbotMgr.OnPlayerLogin(player);
}
