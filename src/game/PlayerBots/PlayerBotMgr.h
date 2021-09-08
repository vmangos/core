#ifndef _PLAYERBOTMGR_H
#define _PLAYERBOTMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include "Database/DatabaseEnv.h"

#include <vector>

class PlayerBotAI;
class WorldSession;
class Player;

enum PlayerBotAutoEquip
{
    PLAYER_BOT_AUTO_EQUIP_STARTING_GEAR = 0,
    PLAYER_BOT_AUTO_EQUIP_RANDOM_GEAR = 1,
    PLAYER_BOT_AUTO_EQUIP_PREMADE_GEAR = 2,
};

enum PlayerBotState
{
    PB_STATE_OFFLINE,
    PB_STATE_LOADING,
    PB_STATE_ONLINE
};

struct PlayerBotEntry
{
    uint64 playerGUID;
    std::string name;
    uint32 accountId;

    uint32 chance;
    uint8 state; //Online, in queue or offline
    bool isChatBot; // bot des joueurs en discussion via le site.
    bool customBot; // Enabled even if PlayerBot system disabled (AutoTesting system for example)
    bool requestRemoval;
    std::vector<uint16> m_pendingResponses;
    PlayerBotAI* ai;

    PlayerBotEntry(uint64 guid, uint32 account, uint32 _chance): playerGUID(guid), accountId(account), chance(_chance), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}
    PlayerBotEntry(): playerGUID(0), accountId(0), chance(100.0f), state(PB_STATE_OFFLINE), isChatBot(false), customBot(false), requestRemoval(false), ai(nullptr)
    {}
};

struct PlayerBotStats
{
    /* Stats */
    uint32 onlineCount;
    uint32 loadingCount;
    uint32 totalBots;
    uint32 onlineChat;

    /* Config */
    uint32 confMaxOnline;
    uint32 confMinOnline;
    uint32 confRandomBotsRefresh;
    uint32 confUpdateDiff;

    PlayerBotStats() 
    : onlineCount(0), loadingCount(0), totalBots(0), onlineChat(0),
    confMaxOnline(0), confMinOnline(0), confRandomBotsRefresh(0), confUpdateDiff(0) {}
};


class PlayerBotMgr
{
    public:
        PlayerBotMgr();
        ~PlayerBotMgr();

        void LoadConfig();
        void Load();

        void Update(uint32 diff);
        bool AddOrRemoveBot();

        bool AddBot(PlayerBotAI* ai);
        bool AddBot(uint32 playerGuid, bool chatBot=false);
        bool DeleteBot(std::map<uint32, PlayerBotEntry*>::iterator iter);
        bool DeleteBot(uint32 playerGuid);

        bool AddRandomBot();
        bool DeleteRandomBot();

        void DeleteAll();
        void AddAllBots();

        void OnBotLogout(PlayerBotEntry *e);
        void OnBotLogin(PlayerBotEntry *e);
        void OnPlayerInWorld(Player* pPlayer);
        void AddTempBot(uint32 account, uint32 time);
        void RefreshTempBot(uint32 account);

        bool ForceAccountConnection(WorldSession* sess);
        bool IsPermanentBot(uint32 playerGuid);
        bool IsChatBot(uint32 playerGuid);

        uint32 GenBotAccountId() { return ++m_maxAccountId; }
        PlayerBotStats& GetStats(){ return m_stats; }
        void Start() { m_enableRandomBots = true; }
    protected:
        // How long since last update?
        uint32 m_elapsedTime;
        uint32 m_lastBotsRefresh;
        uint32 m_lastUpdate;
        uint32 m_totalChance;
        uint32 m_maxAccountId;

        std::map<uint32 /*pl guid*/, PlayerBotEntry*> m_bots;
        std::map<uint32 /*account*/, uint32> m_tempBots;
        PlayerBotStats m_stats;

        uint32 m_confMinRandomBots;
        uint32 m_confMaxRandomBots;
        uint32 m_confRandomBotsRefresh;
        uint32 m_confUpdateDiff;
        bool m_confDebug;
        bool m_enableRandomBots;
};

#define sPlayerBotMgr MaNGOS::Singleton<PlayerBotMgr>::Instance()
#endif
