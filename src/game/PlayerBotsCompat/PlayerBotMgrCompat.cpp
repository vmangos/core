#include "PlayerBotMgrCompat.h"

#include "ModPlayerBots/Bot/RandomPlayerbotMgr.h"

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
    sRandomPlayerbotMgr.UpdateAIInternal(diff, false);
}
