/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_RANDOMPLAYERBOTMGR_H
#define _PLAYERBOT_RANDOMPLAYERBOTMGR_H

#include "Ai/World/Rpg/NewRpgInfo.h"
#include "ObjectGuid.h"
#include "PlayerbotMgr.h"
#include "GameTime.h"
#include "PlayerbotCommandServer.h"
#include "SharedDefines.h"
#include <map>
#include <unordered_map>
#include <unordered_set>
#include <vector>

struct BattlegroundInfo
{
    std::vector<uint32> bgInstances;
    std::vector<uint32> ratedArenaInstances;
    std::vector<uint32> skirmishArenaInstances;
    uint32 bgInstanceCount = 0;
    uint32 ratedArenaInstanceCount = 0;
    uint32 skirmishArenaInstanceCount = 0;
    uint32 minLevel = 0;
    uint32 maxLevel = 0;
    uint32 activeRatedArenaQueue = 0;     // 0 = Inactive, 1 = Active
    uint32 activeSkirmishArenaQueue = 0;  // 0 = Inactive, 1 = Active
    uint32 activeBgQueue = 0;             // 0 = Inactive, 1 = Active

    // Bots (Arena)
    uint32 ratedArenaBotCount = 0;
    uint32 skirmishArenaBotCount = 0;

    // Bots (Battleground)
    uint32 bgHordeBotCount = 0;
    uint32 bgAllianceBotCount = 0;

    // Players (Arena)
    uint32 ratedArenaPlayerCount = 0;
    uint32 skirmishArenaPlayerCount = 0;

    // Players (Battleground)
    uint32 bgHordePlayerCount = 0;
    uint32 bgAlliancePlayerCount = 0;
};

class ChatHandler;
class PerfMonitorOperation;

struct CachedEvent
{
    uint32 value = 0;
    uint32 lastChangeTime = 0;
    uint32 validIn = 0;
    std::string data;

    bool IsEmpty() const { return !lastChangeTime; }
};

struct BotEventCache
{
    bool loaded = false;
    std::unordered_map<std::string, CachedEvent> events;
};

// https://gist.github.com/bradley219/5373998

class botPIDImpl;
class botPID
{
public:
    // Kp -  proportional gain
    // Ki -  Integral gain
    // Kd -  derivative gain
    // dt -  loop interval time
    // max - maximum value of manipulated variable
    // min - minimum value of manipulated variable
    botPID(double dt, double max, double min, double Kp, double Ki, double Kd);
    void adjust(double Kp, double Ki, double Kd);
    void reset();

    double calculate(double setpoint, double pv);
    ~botPID();

private:
    botPIDImpl* pimpl;
};

class RandomPlayerbotMgr : public PlayerbotHolder
{
public:
    struct LevelBracket
    {
        uint32 low;
        uint32 high;
        bool InsideBracket(uint32 val) { return val >= low && val <= high; }
    };

    enum class BotPopulationRole : uint8
    {
        reserve_city = 1,
        reserve_starter = 2,
        shadow = 3,
        halo = 4,
        roam = 5
    };

    struct PopulationBucket
    {
        uint32 zoneId = 0;
        uint32 mapId = 0;
        LevelBracket bracket{1, 1};
        WorldLocation centroid;
        std::vector<WorldLocation> points;
        uint32 pointCount = 0;
        uint32 currentBotCount = 0;
        uint32 misplacedBotCount = 0;
        uint32 reserveFloor = 0;
        uint32 desiredReserve = 0;
        uint32 desiredDynamic = 0;
        uint32 desiredTotal = 0;
        uint32 capacity = 0;
        float playerHeat = 0.0f;
        float levelMatch = 0.0f;
        float recentPresence = 0.0f;
        float diversity = 0.0f;
        float saturationPenalty = 0.0f;
        float score = 0.0f;
        float weight = 0.0f;
        bool hasPlayerHeat = false;
        bool haloCandidate = false;
        BotPopulationRole reserveRole = BotPopulationRole::reserve_city;
        BotPopulationRole dynamicRole = BotPopulationRole::roam;
    };

    struct PopulationSnapshot
    {
        time_t timestamp = 0;
        uint32 targetOnlineBots = 0;
        uint32 reserveTarget = 0;
        uint32 dynamicTarget = 0;
        uint32 currentOnlineBots = 0;
        uint32 movesThisTick = 0;
        uint32 loginsThisTick = 0;
        uint32 logoutsThisTick = 0;
        std::vector<PopulationBucket> buckets;
    };

    struct OfflineBotCandidate
    {
        uint32 guid = 0;
        uint32 level = 1;
    };

    enum class TeleportCityId : uint8
    {
        STORMWIND,
        IRONFORGE,
        DARNASSUS,
        EXODAR,
        ORGRIMMAR,
        UNDERCITY,
        THUNDER_BLUFF,
        SILVERMOON_CITY,
        SHATTRATH_CITY,
        DALARAN
    };

    enum class TeleportCityFaction : uint8
    {
        ALLIANCE,
        HORDE,
        NEUTRAL
    };

    static RandomPlayerbotMgr& instance()
    {
        static RandomPlayerbotMgr instance;

        return instance;
    }

    void LogPlayerLocation();
    void UpdateAIInternal(uint32 elapsed, bool minimal = false) override;

    uint32 activeBots = 0;
    static bool HandlePlayerbotConsoleCommand(ChatHandler* handler, char const* args);
    bool IsRandomBot(Player* bot);
    bool IsRandomBot(LowType bot);
    bool IsAddclassBot(Player* bot);
    bool IsAddclassBot(LowType bot);
    void Randomize(Player* bot);
    void Clear(Player* bot);
    void RandomizeFirst(Player* bot);
    void RandomizeMin(Player* bot);
    void IncreaseLevel(Player* bot);
    void ScheduleTeleport(uint32 bot, uint32 time = 0);
    void ScheduleChangeStrategy(uint32 bot, uint32 time = 0);
    void HandleCommand(uint32 type, std::string const text, Player* fromPlayer, std::string channelName = "");
    std::string const HandleRemoteCommand(std::string const request);
    void OnPlayerLogout(Player* player);
    void OnPlayerLogin(Player* player);
    void OnPlayerLoginError(uint32 bot);
    Player* GetRandomPlayer();
    std::vector<Player*> GetPlayers() { return players; };
    PlayerBotMap GetAllBots() { return playerBots; };
    void PrintStats();
    double GetBuyMultiplier(Player* bot);
    double GetSellMultiplier(Player* bot);
    void AddTradeDiscount(Player* bot, Player* master, int32 value);
    void SetTradeDiscount(Player* bot, Player* master, uint32 value);
    uint32 GetTradeDiscount(Player* bot, Player* master);
    void Refresh(Player* bot);
    void RandomTeleportForLevel(Player* bot);
    void RandomTeleportGrindForLevel(Player* bot);
    void RandomTeleportForRpg(Player* bot);
    uint32 GetMaxAllowedBotCount();
    bool ProcessBot(Player* player);
    void Revive(Player* player);
    void ChangeStrategy(Player* player);
    void ChangeStrategyOnce(Player* player);
    uint32 GetValue(Player* bot, std::string const& type);
    uint32 GetValue(uint32 bot, std::string const& type);
    std::string GetData(uint32 bot, std::string const& type);
    void SetValue(uint32 bot, std::string const& type, uint32 value, std::string const& data = "");
    void SetValue(Player* bot, std::string const& type, uint32 value, std::string const& data = "");
    void Remove(Player* bot);
    ObjectGuid GetBattleMasterGUID(Player* bot, BattlegroundTypeId bgTypeId);
    CreatureData const* GetCreatureDataByEntry(uint32 entry);
    void LoadBattleMastersCache();
    std::map<uint32, std::map<uint32, BattlegroundInfo>> BattlegroundData;
    std::map<uint32, std::map<uint32, std::map<TeamId, uint32>>> VisualBots;
    std::map<uint32, std::map<uint32, std::map<uint32, uint32>>> Supporters;
    std::map<TeamId, std::vector<uint32>> LfgDungeons;
    void CheckBgQueue();
    void CheckLfgQueue();
    void CheckPlayers();
    void FinishCheckPlayers();
    void LogBattlegroundInfo();

    std::map<TeamId, std::map<BattlegroundTypeId, std::vector<uint32>>> getBattleMastersCache()
    {
        return BattleMastersCache;
    }

    float getActivityMod() { return activityMod; }
    float getActivityPercentage() { return activityMod * 100.0f; }
    void setActivityPercentage(float percentage) { activityMod = percentage / 100.0f; }
    static uint8 GetTeamClassIdx(bool isAlliance, uint8 claz) { return isAlliance * 20 + claz; }

    void PrepareAddclassCache();
    void PrepareZone2LevelBracket();
    void PrepareTeleportCache();
    bool EnsureTravelCachesReady();
    void Init();
    std::map<uint8, std::unordered_set<ObjectGuid>> addclassCache;
    std::map<uint8, std::vector<WorldLocation>> locsPerLevelCache;
    std::map<uint8, std::vector<WorldLocation>> allianceStarterPerLevelCache;
    std::map<uint8, std::vector<WorldLocation>> hordeStarterPerLevelCache;

    std::map<uint32, LevelBracket> zone2LevelBracket;
    struct BankerLocation {
        WorldLocation loc;
        uint32 entry;
    };
    std::map<uint8, std::vector<BankerLocation>> bankerLocsPerLevelCache;
    std::map<TeleportCityId, std::vector<BankerLocation>> bankerLocsPerCityCache;
    std::map<TeleportCityId, std::vector<uint32>> cityBankerEntries;
    std::map<uint32, std::pair<TeleportCityId, TeleportCityFaction>> bankerEntryToCity;
    std::map<uint32, WorldLocation> bankerEntryToLocation;

    // Account type management
    void AssignAccountTypes();
    bool IsAccountType(uint32 accountId, uint8 accountType);
    bool IsAddclassAccount(uint32 accountId);
    PopulationSnapshot const& GetPopulationSnapshot() const { return populationSnapshot; }
    static char const* GetPopulationRoleName(BotPopulationRole role);
    bool IsLocationInPopulationPlan(Player* bot, WorldLocation const& loc) const;
    bool IsTravelDestinationInPopulationPlan(Player* bot, TravelDestination const* destination) const;
    bool IsQuestInPopulationPlan(Player* bot, Quest const* quest) const;

protected:
    void OnBotLoginInternal(Player* const bot) override;

private:
    struct AutonomousInitState
    {
        bool missingRandomized = false;
        bool missingStrategyEvent = false;
        bool missingTeleportEvent = false;
        bool missingStrategyMode = false;
        bool baselineLevel = false;
        bool assignedLevelBandMismatch = false;
        bool missingTalents = false;
        bool missingGear = false;

        bool NeedsFullRandomize() const
        {
            return missingRandomized || baselineLevel || assignedLevelBandMismatch ||
                ((missingStrategyEvent || missingTeleportEvent) && missingStrategyMode);
        }

        bool NeedsTargetedRepair() const { return missingTalents || missingGear; }

        bool NeedsRepair() const { return NeedsFullRandomize() || NeedsTargetedRepair(); }
    };

    RandomPlayerbotMgr() : PlayerbotHolder(), processTicks(0)
    {
        this->playersLevel = sPlayerbotAIConfig.randombotStartingLevel;

        if (sPlayerbotAIConfig.enabled || sPlayerbotAIConfig.randomBotAutologin)
        {
            PlayerbotCommandServer::instance().Start();
        }

        BattlegroundData.clear();  // Clear here and here only.

        // Cleanup on server start: orphaned pet data that's often left behind by bot pets that no longer exist in the DB
        CharacterDatabase.Execute("DELETE FROM pet_aura WHERE guid NOT IN (SELECT id FROM character_pet)");
        CharacterDatabase.Execute("DELETE FROM pet_spell WHERE guid NOT IN (SELECT id FROM character_pet)");
        CharacterDatabase.Execute("DELETE FROM pet_spell_cooldown WHERE guid NOT IN (SELECT id FROM character_pet)");

        for (int bracket = BG_BRACKET_ID_FIRST; bracket < MAX_BATTLEGROUND_BRACKETS; ++bracket)
        {
            for (int queueType = BATTLEGROUND_QUEUE_AV; queueType < MAX_BATTLEGROUND_QUEUE_TYPES; ++queueType)
            {
                this->BattlegroundData[queueType][bracket] = BattlegroundInfo();
            }
        }

        this->BgCheckTimer = 0;
        this->LfgCheckTimer = 0;
        this->PlayersCheckTimer = 0;
    }

    ~RandomPlayerbotMgr() = default;

    RandomPlayerbotMgr(const RandomPlayerbotMgr&) = delete;
    RandomPlayerbotMgr& operator=(const RandomPlayerbotMgr&) = delete;

    RandomPlayerbotMgr(RandomPlayerbotMgr&&) = delete;
    RandomPlayerbotMgr& operator=(RandomPlayerbotMgr&&) = delete;

    // pid values are set in constructor
    botPID pid = botPID(1, 50, -50, 0, 0, 0);
    float activityMod = 0.25;
    bool _isBotInitializing = true;
    bool _isBotLogging = true;
    NewRpgStatistic rpgStasticTotal;
    CachedEvent* FindEvent(uint32 bot, std::string const& event);
    void LoadEventCache(uint32 bot);
    void CleanupExpiredEvents(bool forceDbCleanup = false);
    uint32 GetEventValue(uint32 bot, std::string const& event);
    std::string GetEventData(uint32 bot, std::string const& event);
    uint32 SetEventValue(uint32 bot, std::string const& event, uint32 value, uint32 validIn,
                         std::string const& data = "");
    void GetBots();
    std::vector<uint32> GetBgBots(uint32 bracket);
    time_t BgCheckTimer;
    time_t LfgCheckTimer;
    time_t PlayersCheckTimer;
    time_t RealPlayerLastTimeSeen = 0;
    time_t DelayLoginBotsTimer;
    time_t printStatsTimer;
    uint32 AddRandomBots();
    bool ProcessBot(uint32 bot);
    void ScheduleRandomize(uint32 bot, uint32 time);
    void ScheduleLogout(uint32 bot, uint32 time = 0);
    AutonomousInitState GetAutonomousInitState(Player* bot);
    bool EnsureAutonomousInit(Player* bot, char const* context);
    void FinalizeAutonomousInit(Player* bot, char const* context);
    void BackfillAutonomousEvents(uint32 bot, char const* context = nullptr);
    void ScheduleAutonomousEvents(uint32 bot, char const* context = nullptr);
    bool RepairRandomBotRuntimeState(Player* bot, char const* context);
    void RepairBrokenRandomBotState();
    void PruneOrphanRandomBotState();
    bool HasCharacterRow(uint32 bot) const;
    void ClearMissingBotEventState(uint32 bot, char const* context);
    uint32 GetRandomBotCountTarget();
    std::vector<OfflineBotCandidate> GetOfflineRandomBotCandidates(uint32 limit = 0);
    std::vector<uint32> GetOfflineRandomBots(uint32 limit, LevelBracket const* preferredBracket = nullptr);
    bool IsEventDue(uint32 bot, std::string const& event);
    uint32 GetTotalReserveTarget() const;
    LevelBracket NormalizeReserveLevelBracket(uint32 zoneId, LevelBracket bracket) const;
    void MaintainCapitalCityPopulation();
    void QueueReservePopulationWithoutDirector();
    void UpdatePopulationDirector(bool force = false);
    void RandomTeleport(Player* bot);
    void RandomTeleport(Player* bot, std::vector<WorldLocation>& locs, bool hearth = false);
    bool RandomTeleportToBucket(Player* bot, PopulationBucket const& bucket, bool hearth = false);
    bool BuildPopulationBucketForZone(uint32 zoneId, PopulationBucket& bucket) const;
    bool GetTeleportCityByZone(uint32 zoneId, TeleportCityId& city) const;
    void RelocateBotToAssignedReserveZone(Player* bot);
    uint32 GetZoneLevel(uint16 mapId, float teleX, float teleY, float teleZ);
    bool GetCapitalAnchorCity(Player* bot, TeleportCityId& city);
    bool GetRandomCityTeleportTarget(Player* bot, TeleportCityId city, WorldLocation& loc);
    bool GetRandomCityTeleportTarget(Player* bot, WorldLocation& loc);
    bool TeleportBotToCapitalAnchor(Player* bot, TeleportCityId city, bool resetAnchorTimers);
    bool ShouldProtectCapitalBotFromLogout(Player* bot);
    uint32 GetCapitalCityBotCount(uint32 zoneId);
    bool IsTeleportTargetVisibleToPlayers(WorldLocation const& loc, float range);
    bool IsBotNearRealPlayer(Player* bot, float range = 100.0f) const;
    bool IsProtectedByPopulationDirector(Player* bot);
    bool CanPopulationRelocateBot(Player* bot, bool requireUnseen) const;
    bool SelectBestPopulationBucketForLevel(uint32 level, PopulationBucket& bucket, uint32 preferredZone = 0);
    bool RehomeBotToPopulationPlan(Player* bot, char const* context, bool requireRelocate);
    void SetPopulationAssignment(uint32 bot, BotPopulationRole role, uint32 zoneId, LevelBracket const& bracket,
        uint32 dwellUntil, uint32 moveTime);
    BotPopulationRole GetPopulationRole(uint32 bot) const;
    uint32 GetPopulationZone(uint32 bot) const;
    bool GetPopulationLevelBand(uint32 bot, LevelBracket& bracket) const;
    uint32 GetPopulationDwellUntil(uint32 bot) const;
    uint32 SampleLevelForBucket(PopulationBucket const& bucket) const;
    char const* GetCityName(TeleportCityId city);
    uint32 GetCityZoneId(TeleportCityId city);
    uint32 GetCityWeight(TeleportCityId city);
    bool IsCityAvailableForBot(Player* bot, TeleportCityId city);
    float GetBankerTeleportChance(Player* bot) const;
    typedef void (RandomPlayerbotMgr::*ConsoleCommandHandler)(Player*);
    std::vector<Player*> players;
    uint32 processTicks;

    // std::map<uint32, std::vector<WorldLocation>> rpgLocsCache;
    std::map<uint32, std::map<uint32, std::vector<WorldLocation>>> rpgLocsCacheLevel;
    std::map<TeamId, std::map<BattlegroundTypeId, std::vector<uint32>>> BattleMastersCache;
    std::unordered_map<uint32, BotEventCache> eventCache;
    std::list<uint32> currentBots;
    uint32 bgBotsCount;
    uint32 playersLevel;
    uint32 processIndex = 0;
    uint32 lastPopulationLogCount = 0;
    time_t lastEventCleanupTime = 0;
    time_t lastPopulationLogTime = 0;
    time_t populationDirectorNextUpdate = 0;
    std::unordered_map<uint32, float> populationRecentPresenceByZone;
    PopulationSnapshot populationSnapshot;
    std::vector<uint32> populationLoginQueue;

    // Account lists
    std::vector<uint32> rndBotTypeAccounts;             // Accounts marked as RNDbot (type 1)
    std::vector<uint32> addClassTypeAccounts;           // Accounts marked as AddClass (type 2)

    //void ScaleBotActivity();      // Deprecated function
    static inline uint32 NowSeconds() { return PB_GetGameTimeSeconds(); }
};

#define sRandomPlayerbotMgr RandomPlayerbotMgr::instance()

#endif
