#ifndef _PLAYERBOT_MGR_COMPAT_H
#define _PLAYERBOT_MGR_COMPAT_H

#include "Common.h"

class RandomPlayerbotMgr;
class Player;
class WorldSession;

// Compatibility wrapper to bridge old PlayerBotMgr interface to new ModPlayerBots
class PlayerBotMgr
{
public:
    static PlayerBotMgr& instance();

    void LoadConfig();
    void Load();
    void DeleteAll();
    void Update(uint32 diff);

    bool IsSavingAllowed() { return true; }
    void OnPlayerInWorld(Player* player) {}
    bool ForceAccountConnection(WorldSession* sess) { return false; }
    bool IsChatBot(uint32 playerGuid) { return false; }

private:
    PlayerBotMgr() = default;
    ~PlayerBotMgr() = default;
    PlayerBotMgr(const PlayerBotMgr&) = delete;
    PlayerBotMgr& operator=(const PlayerBotMgr&) = delete;
};

#define sPlayerBotMgr PlayerBotMgr::instance()

#endif // _PLAYERBOT_MGR_COMPAT_H
