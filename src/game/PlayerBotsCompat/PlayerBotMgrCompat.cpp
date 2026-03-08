#include "PlayerBotMgrCompat.h"

#include "ModPlayerBots/Bot/PlayerbotAI.h"
#include "ModPlayerBots/PlayerbotAIConfig.h"
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
    sPlayerbotAIConfig.Initialize();
}

void PlayerBotMgr::Load()
{
    sPlayerbotAIConfig.InitializeLate();
}

void PlayerBotMgr::DeleteAll()
{
    sRandomPlayerbotMgr.LogoutAllBots();
}

void PlayerBotMgr::Update(uint32 diff)
{
    sRandomPlayerbotMgr.UpdateAI(diff);
    sRandomPlayerbotMgr.UpdateSessions();

    for (auto itr = sRandomPlayerbotMgr.GetPlayerBotsBegin(); itr != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++itr)
    {
        Player* bot = itr->second;
        if (!bot)
            continue;

        if (PlayerbotAI* botAI = sPlayerbotsMgr.GetPlayerbotAI(bot))
            botAI->UpdateAI(diff);
    }

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
            for (auto botItr = playerbotMgr->GetPlayerBotsBegin(); botItr != playerbotMgr->GetPlayerBotsEnd(); ++botItr)
            {
                Player* bot = botItr->second;
                if (!bot)
                    continue;

                if (PlayerbotAI* botAI = sPlayerbotsMgr.GetPlayerbotAI(bot))
                    botAI->UpdateAI(diff);
            }

            playerbotMgr->UpdateAI(diff);
            playerbotMgr->UpdateSessions();
        }
    }
}

void PlayerBotMgr::OnPlayerInWorld(Player* player)
{
    if (!player)
        return;

    if (player->IsBot())
    {
        uint32 masterAccountId = 0;
        if (PlayerbotHolder::TryGetPendingBotOwner(player->GetGUID(), masterAccountId))
        {
            if (masterAccountId)
            {
                WorldSession* masterSession = sWorld.FindSession(masterAccountId);
                Player* masterPlayer = masterSession ? masterSession->GetPlayer() : nullptr;
                PlayerbotMgr* mgr = masterPlayer ? sPlayerbotsMgr.GetPlayerbotMgr(masterPlayer) : nullptr;
                if (mgr)
                {
                    mgr->OnBotLogin(player);
                    return;
                }

                LOG_WARN("playerbots",
                    "Bot %s (%u) entered world but master account %u has no active playerbot manager; removing bot session",
                    player->GetName(), player->GetGUIDLow(), masterAccountId);
                PlayerbotHolder::ClearPendingBotOwner(player->GetGUID());
                sRandomPlayerbotMgr.SetBotLoading(player->GetGUID(), false);
                WorldSession* botSession = player->GetSession();
                botSession->LogoutPlayer(true);
                delete botSession;
                return;
            }

            sRandomPlayerbotMgr.OnPlayerLogin(player);
            return;
        }

        if (sRandomPlayerbotMgr.IsRandomBot(player) ||
            sPlayerbotAIConfig.IsInRandomAccountList(player->GetSession()->GetAccountId()))
        {
            sRandomPlayerbotMgr.OnPlayerLogin(player);
        }

        return;
    }

    if (!sPlayerbotsMgr.GetPlayerbotMgr(player))
        sPlayerbotsMgr.AddPlayerbotData(player, false);

    sRandomPlayerbotMgr.OnPlayerLogin(player);
}
