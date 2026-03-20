#include "RandomPlayerbotMgr.h"

#include <algorithm>
#include <cctype>
#include <cmath>
#include <limits>
#include <random>
#include <sstream>

#include "AccountMgr.h"
#include "Bag.h"
#include "BattleGround.h"
#include "BattleGroundMgr.h"
#include "ChannelMgr.h"
#include "CharacterCache.h"
#include "DBCStores.h"
#include "DatabaseEnv.h"
#include "GridDefines.h"
#include "MapManager.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Chat.h"
#include "PlayerbotAI.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotFactory.h"
#include "Playerbots.h"
#include "SharedDefines.h"
#include "World.h"
#include "WorldSessionMgr.h"
#include "Mgr/Travel/TravelMgr.h"

namespace
{
constexpr uint32 RANDOM_BOT_OWNER = 0;
constexpr uint32 MANAGER_BOT = 0;
constexpr float PLAYER_VISIBILITY_GUARD_RANGE = 100.0f;
using TeleportCityId = RandomPlayerbotMgr::TeleportCityId;
using TeleportCityFaction = RandomPlayerbotMgr::TeleportCityFaction;

struct TeleportCityMeta
{
    TeleportCityFaction faction;
    uint32 zoneId;
    char const* name;
    WorldLocation fallback;
};

static std::map<uint32, std::pair<TeleportCityId, TeleportCityFaction>> const kBankerToCity = {
    {2455, {TeleportCityId::STORMWIND, TeleportCityFaction::ALLIANCE}},
    {2456, {TeleportCityId::STORMWIND, TeleportCityFaction::ALLIANCE}},
    {2457, {TeleportCityId::STORMWIND, TeleportCityFaction::ALLIANCE}},
    {2460, {TeleportCityId::IRONFORGE, TeleportCityFaction::ALLIANCE}},
    {2461, {TeleportCityId::IRONFORGE, TeleportCityFaction::ALLIANCE}},
    {5099, {TeleportCityId::IRONFORGE, TeleportCityFaction::ALLIANCE}},
    {4155, {TeleportCityId::DARNASSUS, TeleportCityFaction::ALLIANCE}},
    {4208, {TeleportCityId::DARNASSUS, TeleportCityFaction::ALLIANCE}},
    {4209, {TeleportCityId::DARNASSUS, TeleportCityFaction::ALLIANCE}},
    {17773, {TeleportCityId::EXODAR, TeleportCityFaction::ALLIANCE}},
    {18350, {TeleportCityId::EXODAR, TeleportCityFaction::ALLIANCE}},
    {16710, {TeleportCityId::EXODAR, TeleportCityFaction::ALLIANCE}},
    {3320, {TeleportCityId::ORGRIMMAR, TeleportCityFaction::HORDE}},
    {3309, {TeleportCityId::ORGRIMMAR, TeleportCityFaction::HORDE}},
    {3318, {TeleportCityId::ORGRIMMAR, TeleportCityFaction::HORDE}},
    {4549, {TeleportCityId::UNDERCITY, TeleportCityFaction::HORDE}},
    {2459, {TeleportCityId::UNDERCITY, TeleportCityFaction::HORDE}},
    {2458, {TeleportCityId::UNDERCITY, TeleportCityFaction::HORDE}},
    {4550, {TeleportCityId::UNDERCITY, TeleportCityFaction::HORDE}},
    {2996, {TeleportCityId::THUNDER_BLUFF, TeleportCityFaction::HORDE}},
    {8356, {TeleportCityId::THUNDER_BLUFF, TeleportCityFaction::HORDE}},
    {8357, {TeleportCityId::THUNDER_BLUFF, TeleportCityFaction::HORDE}},
    {17631, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {17632, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {17633, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {16615, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {16616, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {16617, {TeleportCityId::SILVERMOON_CITY, TeleportCityFaction::HORDE}},
    {19246, {TeleportCityId::SHATTRATH_CITY, TeleportCityFaction::NEUTRAL}},
    {19338, {TeleportCityId::SHATTRATH_CITY, TeleportCityFaction::NEUTRAL}},
    {19034, {TeleportCityId::SHATTRATH_CITY, TeleportCityFaction::NEUTRAL}},
    {19318, {TeleportCityId::SHATTRATH_CITY, TeleportCityFaction::NEUTRAL}},
    {30604, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}},
    {30605, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}},
    {30607, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}},
    {28675, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}},
    {28676, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}},
    {28677, {TeleportCityId::DALARAN, TeleportCityFaction::NEUTRAL}}
};

static std::map<TeleportCityId, TeleportCityMeta> const kTeleportCities = {
    {TeleportCityId::STORMWIND, {TeleportCityFaction::ALLIANCE, 1519, "stormwind", WorldLocation(0, -8867.68f, 673.373f, 97.9034f, 0.0f)}},
    {TeleportCityId::IRONFORGE, {TeleportCityFaction::ALLIANCE, 1537, "ironforge", WorldLocation(0, -4981.25f, -881.542f, 501.66f, 0.0f)}},
    {TeleportCityId::DARNASSUS, {TeleportCityFaction::ALLIANCE, 1657, "darnassus", WorldLocation(1, 9951.52f, 2280.32f, 1341.39f, 0.0f)}},
    {TeleportCityId::EXODAR, {TeleportCityFaction::ALLIANCE, 3557, "exodar", WorldLocation(530, -3987.29f, -11846.6f, -2.01903f, 0.0f)}},
    {TeleportCityId::ORGRIMMAR, {TeleportCityFaction::HORDE, 1637, "orgrimmar", WorldLocation(1, 1633.33f, -4439.11f, 15.7588f, 0.0f)}},
    {TeleportCityId::UNDERCITY, {TeleportCityFaction::HORDE, 1497, "undercity", WorldLocation(0, 1568.5f, 267.95f, -62.16f, 0.0f)}},
    {TeleportCityId::THUNDER_BLUFF, {TeleportCityFaction::HORDE, 1638, "thunderbluff", WorldLocation(1, -1273.17f, 122.56f, 131.29f, 0.0f)}},
    {TeleportCityId::SILVERMOON_CITY, {TeleportCityFaction::HORDE, 3487, "silvermoon", WorldLocation(530, 9499.16f, -7279.2f, 14.29f, 0.0f)}},
    {TeleportCityId::SHATTRATH_CITY, {TeleportCityFaction::NEUTRAL, 3703, "shattrath", WorldLocation(530, -1887.62f, 5359.09f, -12.43f, 0.0f)}},
    {TeleportCityId::DALARAN, {TeleportCityFaction::NEUTRAL, 4395, "dalaran", WorldLocation(571, 5807.75f, 588.347f, 660.94f, 0.0f)}}
};

bool HasAllowedMap(uint32 mapId)
{
    if (sPlayerbotAIConfig.randomBotMaps.empty())
        return true;

    return std::find(sPlayerbotAIConfig.randomBotMaps.begin(), sPlayerbotAIConfig.randomBotMaps.end(), mapId) !=
        sPlayerbotAIConfig.randomBotMaps.end();
}

bool IsUsableTravelPoint(WorldPosition const* point)
{
    return point && MapManager::IsValidMapCoord(
        point->GetMapId(), point->GetPositionX(), point->GetPositionY(), point->GetPositionZ());
}

bool IsSafeTeleportZoneForBot(Player* bot, AreaTableEntry const* zone)
{
    if (!bot || !zone)
        return false;

    if (zone->area_team == 4 && bot->GetTeamId() == TEAM_ALLIANCE)
        return false;

    if (zone->area_team == 2 && bot->GetTeamId() == TEAM_HORDE)
        return false;

    return true;
}

bool IsSupportedRandomBg(BattlegroundTypeId bgTypeId)
{
    return bgTypeId == BATTLEGROUND_AV || bgTypeId == BATTLEGROUND_AB || bgTypeId == BATTLEGROUND_WS;
}

BattlegroundQueueTypeId ToQueueType(BattlegroundTypeId bgTypeId)
{
    return BattleGroundMgr::BgQueueTypeId(bgTypeId);
}

uint32 ClampToLevelBracket(uint32 level)
{
    if (level == 0)
        return 1;

    uint32 maxLevel = sWorld.getIntConfig(CONFIG_MAX_PLAYER_LEVEL);
    if (level > maxLevel)
        return maxLevel;

    return level;
}

RandomPlayerbotMgr::BotPopulationRole ParsePopulationRole(uint32 value, std::string const& data)
{
    using Role = RandomPlayerbotMgr::BotPopulationRole;

    switch (value)
    {
        case uint32(Role::reserve_city):
            return Role::reserve_city;
        case uint32(Role::reserve_starter):
            return Role::reserve_starter;
        case uint32(Role::shadow):
            return Role::shadow;
        case uint32(Role::halo):
            return Role::halo;
        case uint32(Role::roam):
            return Role::roam;
        default:
            break;
    }

    if (data == "reserve_city")
        return Role::reserve_city;
    if (data == "reserve_starter")
        return Role::reserve_starter;
    if (data == "shadow")
        return Role::shadow;
    if (data == "halo")
        return Role::halo;
    return Role::roam;
}

float Normalize01(float value, float minValue, float maxValue)
{
    if (maxValue <= minValue)
        return maxValue > 0.0f ? 1.0f : 0.0f;

    return std::max(0.0f, std::min(1.0f, (value - minValue) / (maxValue - minValue)));
}

float SoftmaxTemperature(float score, float temperature)
{
    temperature = std::max(0.01f, temperature);
    return std::exp(score / temperature);
}

RandomPlayerbotMgr::LevelBracket ParseLevelBand(std::string const& data, RandomPlayerbotMgr::LevelBracket fallback)
{
    size_t dashPos = data.find('-');
    if (dashPos == std::string::npos)
        return fallback;

    uint32 low = static_cast<uint32>(std::strtoul(data.substr(0, dashPos).c_str(), nullptr, 10));
    uint32 high = static_cast<uint32>(std::strtoul(data.substr(dashPos + 1).c_str(), nullptr, 10));
    if (!low || !high)
        return fallback;

    return {low, std::max(low, high)};
}

std::string FormatLevelBand(RandomPlayerbotMgr::LevelBracket const& bracket)
{
    std::ostringstream out;
    out << bracket.low << "-" << bracket.high;
    return out.str();
}

template <class T>
T const& PickRandom(std::vector<T> const& list)
{
    return list[urand(0, list.size() - 1)];
}

std::string EscapeSql(std::string value)
{
    CharacterDatabase.escape_string(value);
    return value;
}

std::string JoinReasons(std::vector<std::string> const& reasons)
{
    std::ostringstream out;
    for (size_t i = 0; i < reasons.size(); ++i)
    {
        if (i)
            out << ", ";
        out << reasons[i];
    }
    return out.str();
}

uint32 NormalizePopulationZoneId(uint32 zoneId)
{
    if (AreaTableEntry const* area = sAreaTableStore.LookupEntry(zoneId))
    {
        if (area->zone)
            return area->zone;
    }

    return zoneId;
}

uint32 GetPopulationZoneForLocation(WorldLocation const& loc)
{
    return NormalizePopulationZoneId(sTerrainMgr.GetZoneId(loc.mapId, loc.x, loc.y, loc.z));
}

bool IsLevelInBracket(uint32 level, RandomPlayerbotMgr::LevelBracket const& bracket)
{
    return level >= bracket.low && level <= bracket.high;
}

RandomPlayerbotMgr::PopulationBucket const* FindPopulationBucketInSnapshot(
    RandomPlayerbotMgr::PopulationSnapshot const& snapshot, uint32 zoneId)
{
    for (RandomPlayerbotMgr::PopulationBucket const& bucket : snapshot.buckets)
    {
        if (bucket.zoneId == zoneId)
            return &bucket;
    }

    return nullptr;
}

uint32 GetQuestPlanLevel(Player* bot, Quest const* quest)
{
    if (!bot || !quest)
        return 1;

    int32 questLevel = quest->GetQuestLevel();
    if (questLevel <= 0)
        questLevel = static_cast<int32>(bot->GetLevel());

    return ClampToLevelBracket(std::max<int32>(1, questLevel));
}

void NormalizePersistedNewItemState(Item* item)
{
    if (!item || item->GetState() != ITEM_NEW)
        return;

    if (CharacterDatabase.PQuery("SELECT 1 FROM `character_inventory` WHERE `item_guid` = '%u' LIMIT 1", item->GetGUIDLow()))
        item->FSetState(ITEM_CHANGED);
}

void NormalizePersistedInventoryState(Player* bot)
{
    if (!bot)
        return;

    for (uint8 slot = EQUIPMENT_SLOT_START; slot < INVENTORY_SLOT_ITEM_END; ++slot)
        NormalizePersistedNewItemState(bot->GetItemByPos(INVENTORY_SLOT_BAG_0, slot));

    for (uint8 bagSlot = INVENTORY_SLOT_BAG_START; bagSlot < INVENTORY_SLOT_BAG_END; ++bagSlot)
    {
        Bag* bag = static_cast<Bag*>(bot->GetItemByPos(INVENTORY_SLOT_BAG_0, bagSlot));
        NormalizePersistedNewItemState(bag);
        if (!bag)
            continue;

        for (uint8 slot = 0; slot < bag->GetBagSize(); ++slot)
            NormalizePersistedNewItemState(bag->GetItemByPos(slot));
    }
}

std::set<uint32> ParseBracketList(std::string const& value)
{
    std::set<uint32> brackets;
    std::stringstream ss(value);
    std::string token;
    while (std::getline(ss, token, ','))
    {
        token.erase(std::remove_if(token.begin(), token.end(), [](unsigned char ch) { return std::isspace(ch) != 0; }),
            token.end());
        if (token.empty())
            continue;

        char* end = nullptr;
        long parsed = std::strtol(token.c_str(), &end, 10);
        if (!end || *end != '\0' || parsed < BG_BRACKET_ID_FIRST || parsed >= MAX_BATTLEGROUND_BRACKETS)
            continue;

        brackets.insert(static_cast<uint32>(parsed));
    }

    return brackets;
}

uint32 GetAutoJoinCount(BattlegroundTypeId bgTypeId)
{
    switch (bgTypeId)
    {
        case BATTLEGROUND_AV:
            return sPlayerbotAIConfig.randomBotAutoJoinBGAVCount;
        case BATTLEGROUND_AB:
            return sPlayerbotAIConfig.randomBotAutoJoinBGABCount;
        case BATTLEGROUND_WS:
            return sPlayerbotAIConfig.randomBotAutoJoinBGWSCount;
        default:
            return 0;
    }
}

std::string const& GetAutoJoinBrackets(BattlegroundTypeId bgTypeId)
{
    switch (bgTypeId)
    {
        case BATTLEGROUND_AV:
            return sPlayerbotAIConfig.randomBotAutoJoinAVBrackets;
        case BATTLEGROUND_AB:
            return sPlayerbotAIConfig.randomBotAutoJoinABBrackets;
        case BATTLEGROUND_WS:
            return sPlayerbotAIConfig.randomBotAutoJoinWSBrackets;
        default:
        {
            static std::string const empty;
            return empty;
        }
    }
}

bool IsAutoJoinBracketEnabled(BattlegroundTypeId bgTypeId, BattlegroundBracketId bracketId)
{
    static std::map<BattlegroundTypeId, std::set<uint32>> bracketCache;
    std::set<uint32>& brackets = bracketCache[bgTypeId];
    if (brackets.empty())
        brackets = ParseBracketList(GetAutoJoinBrackets(bgTypeId));

    return brackets.find(static_cast<uint32>(bracketId)) != brackets.end();
}
}  // namespace

botPID::botPID(double, double, double, double, double, double) : pimpl(nullptr) {}
void botPID::adjust(double, double, double) {}
void botPID::reset() {}
double botPID::calculate(double, double) { return 0.0; }
botPID::~botPID() = default;

uint32 RandomPlayerbotMgr::GetMaxAllowedBotCount()
{
    uint32 configuredMin = sPlayerbotAIConfig.minRandomBots;
    uint32 configuredMax = std::max(configuredMin, sPlayerbotAIConfig.maxRandomBots);
    uint32 target = GetEventValue(MANAGER_BOT, "bot_count");

    if (!target)
        target = configuredMin;

    uint32 dynamicTarget = std::max(configuredMin, std::min(configuredMax, target));

    // Reserve bots (cities, starter zones) do not count against the dynamic random-bot cap.
    return dynamicTarget + GetTotalReserveTarget();
}

uint32 RandomPlayerbotMgr::GetTotalReserveTarget() const
{
    uint32 totalReserve = 0;
    for (auto const& entry : sPlayerbotAIConfig.reserveZones)
        totalReserve += entry.second;

    return totalReserve;
}

RandomPlayerbotMgr::LevelBracket RandomPlayerbotMgr::NormalizeReserveLevelBracket(uint32 zoneId, LevelBracket bracket) const
{
    auto reserveItr = sPlayerbotAIConfig.reserveZones.find(zoneId);
    if (reserveItr == sPlayerbotAIConfig.reserveZones.end() || !reserveItr->second)
        return bracket;

    if (bracket.high <= 12)
        return {1, 10};

    return bracket;
}

void RandomPlayerbotMgr::LogPlayerLocation()
{
    LOG_DEBUG("playerbots", "Random bot manager: players=%zu random_bots=%zu active_bots=%u target=%u activity=%.1f%%",
        players.size(), currentBots.size(), activeBots, GetMaxAllowedBotCount(), getActivityPercentage());
}

void RandomPlayerbotMgr::UpdateAIInternal(uint32 elapsed, bool)
{
    processTicks += elapsed;

    if (!sPlayerbotAIConfig.randomBotAutologin)
        return;

    const time_t now = NowSeconds();

    if (!DelayLoginBotsTimer)
        DelayLoginBotsTimer = now;

    if (now < DelayLoginBotsTimer)
    {
        // Throttle: sleep until next scheduled tick instead of spinning every world frame.
        uint32 remainingMs = static_cast<uint32>(DelayLoginBotsTimer - now) * IN_MILLISECONDS;
        SetNextCheckDelay(std::min(remainingMs, 1000u));
        return;
    }

    uint32 updateInterval = std::max<uint32>(1, sPlayerbotAIConfig.randomBotUpdateInterval);
    DelayLoginBotsTimer = now + updateInterval;

    // Throttle next call to roughly the update interval (converted to ms).
    SetNextCheckDelay(updateInterval * IN_MILLISECONDS);

    CheckPlayers();
    CleanupExpiredEvents();
    GetBots();
    FinishCheckPlayers();
    CheckBgQueue();
    CheckLfgQueue();
    if (sPlayerbotAIConfig.enablePopulationDirector)
        UpdatePopulationDirector(false);
    else
    {
        QueueReservePopulationWithoutDirector();
        MaintainCapitalCityPopulation();
    }

    if (!BgCheckTimer || now >= BgCheckTimer)
    {
        LogBattlegroundInfo();
        BgCheckTimer = now + 300;
    }

    uint32 desiredCount = GetRandomBotCountTarget();
    uint32 currentCount = static_cast<uint32>(currentBots.size());
    uint32 batchLimit = std::max<uint32>(1, sPlayerbotAIConfig.randomBotsPerInterval);

    uint32 actions = 0;
    if (currentCount < desiredCount)
        actions += AddRandomBots();

    if (actions < batchLimit)
    {
        std::vector<uint32> logoutCandidates;
        for (uint32 botGuid : currentBots)
        {
            if (!IsEventDue(botGuid, "logout"))
                continue;

            if (Player* bot = GetPlayerBot(botGuid))
            {
                PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
                if (!botAI || botAI->HasActivePlayerMaster() || bot->IsInCombat() || bot->InBattleground())
                    continue;

                if (ShouldProtectCapitalBotFromLogout(bot))
                    continue;
            }

            logoutCandidates.push_back(botGuid);
        }

        if (currentCount > desiredCount)
        {
            uint32 extra = currentCount - desiredCount;
            for (uint32 botGuid : currentBots)
            {
                if (!extra)
                    break;

                if (std::find(logoutCandidates.begin(), logoutCandidates.end(), botGuid) != logoutCandidates.end())
                    continue;

                if (Player* bot = GetPlayerBot(botGuid))
                {
                    if (ShouldProtectCapitalBotFromLogout(bot))
                        continue;
                }

                logoutCandidates.push_back(botGuid);
                --extra;
            }
        }

        for (uint32 botGuid : logoutCandidates)
        {
            if (actions >= batchLimit)
                break;

            if (Player* bot = GetPlayerBot(botGuid))
            {
                LOG_DEBUG("playerbots", "Random bot logout: %s (%u)", bot->GetName(), botGuid);
                LogoutPlayerBot(bot->GetGUID());
                ++actions;
            }
        }
    }

    if (actions < batchLimit && !currentBots.empty())
    {
        std::vector<uint32> botIds(currentBots.begin(), currentBots.end());
        if (processIndex >= botIds.size())
            processIndex = 0;

        uint32 activeSlice = activeBots >= botIds.size() ? static_cast<uint32>(botIds.size()) : activeBots;
        if (!players.empty() && !activeSlice && !botIds.empty())
            activeSlice = 1;

        uint32 processed = 0;
        while (processed < activeSlice && actions < batchLimit)
        {
            uint32 botGuid = botIds[(processIndex + processed) % botIds.size()];
            if (ProcessBot(botGuid))
                ++actions;
            ++processed;
        }

        if (!botIds.empty())
            processIndex = (processIndex + std::max<uint32>(processed, 1)) % botIds.size();
    }

    if ((now - lastPopulationLogTime) >= std::max<uint32>(60, sPlayerbotAIConfig.randomBotUpdateInterval) ||
        lastPopulationLogCount != currentBots.size())
    {
        lastPopulationLogTime = now;
        lastPopulationLogCount = static_cast<uint32>(currentBots.size());
        LOG_DEBUG("playerbots", "Random bot population: online=%zu target=%u players=%zu loading=%zu",
            currentBots.size(), desiredCount, players.size(), botLoading.size());
    }
}

bool RandomPlayerbotMgr::HandlePlayerbotConsoleCommand(ChatHandler* handler, char const* args)
{
    if (!handler)
        return false;

    std::string command = args ? args : "";
    size_t start = command.find_first_not_of(" \t\r\n");
    if (start == std::string::npos)
        command.clear();
    else
    {
        size_t end = command.find_last_not_of(" \t\r\n");
        command = command.substr(start, end - start + 1);
    }

    uint32 target = sRandomPlayerbotMgr.GetRandomBotCountTarget();
    if (command.empty() || command == "help")
    {
        handler->PSendSysMessage("Random bot status: online=%zu target=%u players=%zu loading=%zu",
            sRandomPlayerbotMgr.currentBots.size(), target, sRandomPlayerbotMgr.players.size(),
            PlayerbotHolder::botLoading.size());
        handler->PSendSysMessage("Usage: .playerbots rndbot help");
        handler->PSendSysMessage("Usage: .playerbots rndbot status");
        handler->PSendSysMessage("Usage: .playerbots rndbot heat");
        handler->PSendSysMessage("Usage: .playerbots rndbot zones");
        handler->PSendSysMessage("Usage: .playerbots rndbot rebalance");
        return true;
    }

    if (command == "status")
    {
        PopulationSnapshot const& snapshot = sRandomPlayerbotMgr.GetPopulationSnapshot();
        handler->PSendSysMessage(
            "Random bot status: online=%zu target=%u players=%zu loading=%zu reserve=%u dynamic=%u churn=%u/%u/%u",
            sRandomPlayerbotMgr.currentBots.size(), target, sRandomPlayerbotMgr.players.size(),
            PlayerbotHolder::botLoading.size(), snapshot.reserveTarget, snapshot.dynamicTarget,
            snapshot.movesThisTick, snapshot.loginsThisTick, snapshot.logoutsThisTick);
        return true;
    }

    if (command == "heat")
    {
        PopulationSnapshot const& snapshot = sRandomPlayerbotMgr.GetPopulationSnapshot();
        if (snapshot.buckets.empty())
        {
            handler->PSendSysMessage("Top population heat zones:");
            handler->PSendSysMessage("No eligible population buckets: travel cache unavailable or no travel destinations were loaded.");
            return true;
        }

        std::vector<PopulationBucket> buckets = snapshot.buckets;
        std::sort(buckets.begin(), buckets.end(), [](PopulationBucket const& lhs, PopulationBucket const& rhs) {
            return lhs.score > rhs.score;
        });

        handler->PSendSysMessage("Top population heat zones:");
        size_t limit = std::min<size_t>(8, buckets.size());
        for (size_t i = 0; i < limit; ++i)
        {
            PopulationBucket const& bucket = buckets[i];
            handler->PSendSysMessage(
                "zone=%u map=%u heat=%.2f match=%.2f recent=%.2f div=%.2f sat=%.2f score=%.2f desired=%u actual=%u role=%s",
                bucket.zoneId, bucket.mapId, bucket.playerHeat, bucket.levelMatch, bucket.recentPresence,
                bucket.diversity, bucket.saturationPenalty, bucket.score, bucket.desiredTotal, bucket.currentBotCount,
                GetPopulationRoleName(bucket.dynamicRole));
        }
        return true;
    }

    if (command == "zones")
    {
        PopulationSnapshot const& snapshot = sRandomPlayerbotMgr.GetPopulationSnapshot();
        if (snapshot.buckets.empty())
        {
            handler->PSendSysMessage("Population zones:");
            handler->PSendSysMessage("No eligible population buckets: travel cache unavailable or no travel destinations were loaded.");
            return true;
        }

        std::vector<PopulationBucket> buckets = snapshot.buckets;
        std::sort(buckets.begin(), buckets.end(), [](PopulationBucket const& lhs, PopulationBucket const& rhs) {
            if (lhs.reserveFloor != rhs.reserveFloor)
                return lhs.reserveFloor > rhs.reserveFloor;
            return lhs.zoneId < rhs.zoneId;
        });

        handler->PSendSysMessage("Population zones:");
        size_t limit = std::min<size_t>(12, buckets.size());
        for (size_t i = 0; i < limit; ++i)
        {
            PopulationBucket const& bucket = buckets[i];
            handler->PSendSysMessage(
                "zone=%u reserve=%u actual=%u desired=%u cap=%u heat=%.2f halo=%u",
                bucket.zoneId, bucket.reserveFloor, bucket.currentBotCount, bucket.desiredTotal, bucket.capacity,
                bucket.playerHeat, bucket.haloCandidate ? 1u : 0u);
        }
        return true;
    }

    if (command == "rebalance")
    {
        sRandomPlayerbotMgr.UpdatePopulationDirector(true);
        handler->PSendSysMessage("Population director rebalance forced.");
        return true;
    }

    return false;
}

bool RandomPlayerbotMgr::IsRandomBot(Player* bot)
{
    if (!bot)
        return false;

    return IsRandomBot(static_cast<LowType>(bot->GetGUIDLow()));
}

bool RandomPlayerbotMgr::IsRandomBot(LowType bot)
{
    if (!bot)
        return false;

    if (currentBots.end() != std::find(currentBots.begin(), currentBots.end(), static_cast<uint32>(bot)))
        return true;

    return GetEventValue(static_cast<uint32>(bot), "add") > 0;
}

bool RandomPlayerbotMgr::IsAddclassBot(Player* bot)
{
    if (!bot)
        return false;

    return IsAddclassBot(static_cast<LowType>(bot->GetGUIDLow()));
}

bool RandomPlayerbotMgr::IsAddclassBot(LowType bot)
{
    for (auto const& cache : addclassCache)
    {
        if (cache.second.find(ObjectGuid(HIGHGUID_PLAYER, static_cast<uint32>(bot))) != cache.second.end())
            return true;
    }

    uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(ObjectGuid(HIGHGUID_PLAYER, static_cast<uint32>(bot)));
    if (accountId && IsAddclassAccount(accountId))
        return true;

    return false;
}

void RandomPlayerbotMgr::Randomize(Player* bot)
{
    if (!bot)
        return;

    uint32 level = ClampToLevelBracket(bot->GetLevel());
    PlayerbotFactory factory(bot, level);
    factory.Randomize(false);

    SetValue(bot, "randomized", level);
    FinalizeAutonomousInit(bot, "randomize");
}

void RandomPlayerbotMgr::Clear(Player* bot)
{
    Remove(bot);
}

void RandomPlayerbotMgr::RandomizeFirst(Player* bot)
{
    if (!bot)
        return;

    uint32 level = ClampToLevelBracket(bot->GetLevel());
    uint32 minLevel = ClampToLevelBracket(std::max<uint32>(1, sPlayerbotAIConfig.randomBotMinLevel));
    uint32 maxLevel = ClampToLevelBracket(std::max(minLevel, sPlayerbotAIConfig.randomBotMaxLevel));

    LevelBracket assignedBracket{minLevel, maxLevel};
    if (sPlayerbotAIConfig.enablePopulationDirector)
        GetPopulationLevelBand(bot->GetGUIDLow(), assignedBracket);

    if (sPlayerbotAIConfig.debugRandomBotPopulation)
        LOG_DEBUG("playerbots", "Random bot initial level band: %s (%u) bracket=[%u,%u] current=%u",
            bot->GetName(), bot->GetGUIDLow(), assignedBracket.low, assignedBracket.high, level);

    minLevel = ClampToLevelBracket(std::max<uint32>(minLevel, assignedBracket.low));
    maxLevel = ClampToLevelBracket(std::min<uint32>(maxLevel, std::max(assignedBracket.low, assignedBracket.high)));
    if (maxLevel < minLevel)
        maxLevel = minLevel;

    if (!sPlayerbotAIConfig.randomBotFixedLevel)
    {
        uint32 sampled = level;
        if (sPlayerbotAIConfig.enablePopulationDirector)
        {
            PopulationBucket bucket;
            bucket.bracket = assignedBracket;
            BotPopulationRole role = GetPopulationRole(bot->GetGUIDLow());
            bucket.reserveRole = role;
            sampled = SampleLevelForBucket(bucket);
        }
        else
        {
            float roll = frand(0.0f, 1.0f);
            if (roll <= sPlayerbotAIConfig.randomBotMinLevelChance)
                sampled = minLevel;
            else if (roll >= 1.0f - sPlayerbotAIConfig.randomBotMaxLevelChance)
                sampled = maxLevel;
            else if (!sPlayerbotAIConfig.disableRandomLevels)
                sampled = urand(minLevel, maxLevel);
        }

        level = std::max(minLevel, std::min(maxLevel, sampled));
    }

    PlayerbotFactory factory(bot, level);
    factory.Randomize(false);

    SetValue(bot, "randomized", level);
    FinalizeAutonomousInit(bot, "randomize_first");
}

void RandomPlayerbotMgr::RandomizeMin(Player* bot)
{
    if (!bot)
        return;

    PlayerbotFactory factory(bot, ClampToLevelBracket(bot->GetLevel()));
    factory.Refresh();
    bot->SaveToDB(false, false);

    ScheduleRandomize(bot->GetGUIDLow(), 0);
}

void RandomPlayerbotMgr::IncreaseLevel(Player* bot)
{
    if (!bot || sPlayerbotAIConfig.randomBotFixedLevel || sPlayerbotAIConfig.disableRandomLevels)
        return;

    uint32 maxLevel = ClampToLevelBracket(std::max<uint32>(1, sPlayerbotAIConfig.randomBotMaxLevel));
    LevelBracket assignedBracket{1, maxLevel};
    if (GetPopulationLevelBand(bot->GetGUIDLow(), assignedBracket))
        maxLevel = ClampToLevelBracket(std::min<uint32>(maxLevel, std::max(assignedBracket.low, assignedBracket.high)));

    if (bot->GetLevel() >= maxLevel)
    {
        if (sPlayerbotAIConfig.debugRandomBotPopulation)
            LOG_DEBUG("playerbots", "Random bot level increase skipped: %s (%u) level=%u cap=%u",
                bot->GetName(), bot->GetGUIDLow(), bot->GetLevel(), maxLevel);
        return;
    }

    uint32 nextLevel = bot->GetLevel() + 1;
    PlayerbotFactory factory(bot, nextLevel);
    factory.Randomize(true);

    SetValue(bot, "randomized", nextLevel);
    FinalizeAutonomousInit(bot, "increase_level");
}

void RandomPlayerbotMgr::ScheduleTeleport(uint32 bot, uint32 time)
{
    uint32 delay = time ? time : urand(sPlayerbotAIConfig.minRandomBotTeleportInterval,
        std::max(sPlayerbotAIConfig.minRandomBotTeleportInterval, sPlayerbotAIConfig.maxRandomBotTeleportInterval));
    SetEventValue(bot, "teleport", 1, delay);
}

void RandomPlayerbotMgr::ScheduleChangeStrategy(uint32 bot, uint32 time)
{
    uint32 delay = time ? time : urand(sPlayerbotAIConfig.minRandomBotChangeStrategyTime,
        std::max(sPlayerbotAIConfig.minRandomBotChangeStrategyTime, sPlayerbotAIConfig.maxRandomBotChangeStrategyTime));
    SetEventValue(bot, "strategy", 1, delay);
}

void RandomPlayerbotMgr::HandleCommand(uint32 type, std::string const text, Player* fromPlayer, std::string)
{
    if (!fromPlayer || text.empty())
        return;

    if (type == CHAT_MSG_ADDON || type == CHAT_MSG_SYSTEM)
        return;

    float nearbyDistance = std::max(sPlayerbotAIConfig.sightDistance, sPlayerbotAIConfig.whisperDistance);
    for (auto const& itr : playerBots)
    {
        Player* bot = itr.second;
        if (!bot || !IsRandomBot(bot))
            continue;

        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI)
            continue;

        bool directMaster = botAI->GetMaster() == fromPlayer;
        bool sameGuild = fromPlayer->GetGuildId() && fromPlayer->GetGuildId() == bot->GetGuildId();
        bool sameGroup = fromPlayer->GetGroup() && fromPlayer->GetGroup() == bot->GetGroup();
        bool nearby = bot->GetMapId() == fromPlayer->GetMapId() && bot->IsWithinDistInMap(fromPlayer, nearbyDistance);

        if (!directMaster)
        {
            if (botAI->HasActivePlayerMaster())
                continue;

            switch (type)
            {
                case CHAT_MSG_GUILD:
                    if (!sameGuild)
                        continue;
                    if (!sPlayerbotAIConfig.randomBotGuildNearby)
                        continue;
                    break;
                case CHAT_MSG_PARTY:
                case CHAT_MSG_RAID:
                case CHAT_MSG_RAID_LEADER:
                case CHAT_MSG_RAID_WARNING:
                    if (!sameGroup)
                        continue;
                    break;
                case CHAT_MSG_WHISPER:
                    // The global chat hook does not expose the whisper recipient, so do not broadcast whispers.
                    continue;
                default:
                    if (!sPlayerbotAIConfig.inviteChat && !sPlayerbotAIConfig.randomBotInvitePlayer)
                        continue;
                    if (!nearby)
                        continue;
                    break;
            }
        }

        botAI->HandleCommand(type, text, fromPlayer);
    }
}
std::string const RandomPlayerbotMgr::HandleRemoteCommand(std::string const) { return ""; }

void RandomPlayerbotMgr::OnPlayerLogout(Player* player)
{
    if (!player)
        return;

    players.erase(std::remove(players.begin(), players.end(), player), players.end());

    if (!IsRandomBot(player))
    {
        // Clear this real player as master from any random bots that are still following them.
        // Without this, bot AI will dereference the freed Player pointer on the next update tick.
        for (auto& [guid, bot] : playerBots)
        {
            if (!bot)
                continue;
            PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
            if (botAI && botAI->GetMaster() == player)
                botAI->SetMaster(nullptr);
        }
        return;
    }

    currentBots.remove(player->GetGUIDLow());
    RemoveFromPlayerbotsMap(player->GetGUID());
}

void RandomPlayerbotMgr::OnPlayerLogin(Player* player)
{
    if (!player)
        return;

    uint32 pendingOwnerAccount = 0;
    bool hasPendingOwner = player->IsBot() && PlayerbotHolder::TryGetPendingBotOwner(player->GetGUID(), pendingOwnerAccount);
    if (hasPendingOwner && pendingOwnerAccount != 0)
        return;

    WorldSession* session = player->GetSession();
    uint32 accountId = session ? session->GetAccountId() : 0;
    bool addclassAccount = IsAddclassAccount(accountId);

    if (IsRandomBot(player) || (sPlayerbotAIConfig.IsInRandomAccountList(accountId) && !addclassAccount))
    {
        SetEventValue(player->GetGUIDLow(), "add", 1, 0);
        OnBotLogin(player);
        if (player->IsBot())
        {
            Player* master = GET_PLAYERBOT_AI(player) ? GET_PLAYERBOT_AI(player)->GetMaster() : nullptr;
            LOG_INFO("playerbots", "[%zu/%u online] Random bot login: %s (%u) account=%u master=%u",
                currentBots.size(), GetMaxAllowedBotCount(), player->GetName(), player->GetGUIDLow(), accountId, master ? master->GetGUIDLow() : 0);
        }
        return;
    }

    if (player->IsBot())
        return;

    if (std::find(players.begin(), players.end(), player) == players.end())
        players.push_back(player);

    RealPlayerLastTimeSeen = NowSeconds();
}

void RandomPlayerbotMgr::OnPlayerLoginError(uint32 bot)
{
    SetBotLoading(ObjectGuid(HIGHGUID_PLAYER, bot), false);
    SetEventValue(bot, "login_cooldown", 1, sPlayerbotAIConfig.randomBotUpdateInterval * 3);
}

Player* RandomPlayerbotMgr::GetRandomPlayer()
{
    std::vector<Player*> eligible;
    eligible.reserve(players.size());
    for (Player* player : players)
    {
        if (!player || !player->IsInWorld() || !player->GetSession() || player->GetSession()->isLogingOut())
            continue;

        if (player->IsBot())
            continue;

        eligible.push_back(player);
    }

    if (eligible.empty())
        return nullptr;

    return eligible[urand(0, eligible.size() - 1)];
}

void RandomPlayerbotMgr::PrintStats()
{
    LogPlayerLocation();
}

double RandomPlayerbotMgr::GetBuyMultiplier(Player* bot)
{
    if (!bot || !sPlayerbotAIConfig.enableRandomBotTrading)
        return 1.0;

    uint32 cached = GetValue(bot, "price_buy");
    if (!cached)
    {
        cached = urand(100, 140);
        SetEventValue(bot->GetGUIDLow(), "price_buy", cached,
            urand(sPlayerbotAIConfig.minRandomBotsPriceChangeInterval,
                std::max(sPlayerbotAIConfig.minRandomBotsPriceChangeInterval,
                    sPlayerbotAIConfig.maxRandomBotsPriceChangeInterval)));
    }

    return static_cast<double>(cached) / 100.0;
}

double RandomPlayerbotMgr::GetSellMultiplier(Player* bot)
{
    if (!bot || !sPlayerbotAIConfig.enableRandomBotTrading)
        return 1.0;

    uint32 cached = GetValue(bot, "price_sell");
    if (!cached)
    {
        cached = urand(70, 100);
        SetEventValue(bot->GetGUIDLow(), "price_sell", cached,
            urand(sPlayerbotAIConfig.minRandomBotsPriceChangeInterval,
                std::max(sPlayerbotAIConfig.minRandomBotsPriceChangeInterval,
                    sPlayerbotAIConfig.maxRandomBotsPriceChangeInterval)));
    }

    return static_cast<double>(cached) / 100.0;
}

void RandomPlayerbotMgr::AddTradeDiscount(Player* bot, Player* master, int32 value)
{
    if (!bot || !master)
        return;

    int32 current = static_cast<int32>(GetTradeDiscount(bot, master));
    current += value;
    if (current < 0)
        current = 0;

    SetTradeDiscount(bot, master, static_cast<uint32>(current));
}

void RandomPlayerbotMgr::SetTradeDiscount(Player* bot, Player* master, uint32 value)
{
    if (!bot || !master)
        return;

    std::ostringstream name;
    name << "trade_discount_" << master->GetGUIDLow();
    SetValue(bot->GetGUIDLow(), name.str(), value);
}

uint32 RandomPlayerbotMgr::GetTradeDiscount(Player* bot, Player* master)
{
    if (!bot || !master)
        return 0;

    std::ostringstream name;
    name << "trade_discount_" << master->GetGUIDLow();
    return GetValue(bot->GetGUIDLow(), name.str());
}

void RandomPlayerbotMgr::Refresh(Player* bot)
{
    if (!bot)
        return;

    PlayerbotFactory factory(bot, ClampToLevelBracket(bot->GetLevel()));
    factory.Refresh();
    bot->SaveToDB(false, false);
}

void RandomPlayerbotMgr::RandomTeleportForLevel(Player* bot)
{
    if (!bot)
        return;

    EnsureTravelCachesReady();

    uint32 level = ClampToLevelBracket(bot->GetLevel());
    std::vector<WorldLocation>& locs = locsPerLevelCache[level];
    if (locs.empty())
    {
        std::vector<WorldLocation>& starters = IsAlliance(bot->GetRace()) ? allianceStarterPerLevelCache[level]
                                                                           : hordeStarterPerLevelCache[level];
        RandomTeleport(bot, starters);
        return;
    }

    if (level >= 10 && urand(0, 100) < uint32(GetBankerTeleportChance(bot) * 100.0f))
    {
        std::vector<BankerLocation> const& bankerLocs = bankerLocsPerLevelCache[level];
        std::vector<WorldLocation> fallbackLocs;
        fallbackLocs.reserve(bankerLocs.size());
        for (BankerLocation const& bankerLoc : bankerLocs)
            fallbackLocs.push_back(bankerLoc.loc);

        if (!fallbackLocs.empty())
        {
            if (!sPlayerbotAIConfig.enableWeightTeleToCityBankers)
            {
                RandomTeleport(bot, fallbackLocs, true);
                return;
            }

            WorldLocation cityLoc;
            if (GetRandomCityTeleportTarget(bot, cityLoc))
            {
                std::vector<WorldLocation> cityTargets(1, cityLoc);
                RandomTeleport(bot, cityTargets, true);
                return;
            }

            RandomTeleport(bot, fallbackLocs, true);
            return;
        }
    }

    RandomTeleport(bot, locs);
}

void RandomPlayerbotMgr::RandomTeleportGrindForLevel(Player* bot)
{
    RandomTeleportForLevel(bot);
}

void RandomPlayerbotMgr::RandomTeleportForRpg(Player* bot)
{
    if (!bot)
        return;

    EnsureTravelCachesReady();

    std::vector<WorldLocation> locs;
    uint32 level = ClampToLevelBracket(bot->GetLevel());
    for (auto const& perZone : rpgLocsCacheLevel[level])
        locs.insert(locs.end(), perZone.second.begin(), perZone.second.end());

    if (locs.empty())
    {
        RandomTeleportForLevel(bot);
        return;
    }

    RandomTeleport(bot, locs);
}

char const* RandomPlayerbotMgr::GetCityName(TeleportCityId city)
{
    auto itr = kTeleportCities.find(city);
    return itr != kTeleportCities.end() ? itr->second.name : "unknown";
}

uint32 RandomPlayerbotMgr::GetCityZoneId(TeleportCityId city)
{
    auto itr = kTeleportCities.find(city);
    return itr != kTeleportCities.end() ? itr->second.zoneId : 0;
}

uint32 RandomPlayerbotMgr::GetCityWeight(TeleportCityId city)
{
    switch (city)
    {
        case TeleportCityId::STORMWIND:
            return std::max(0, sPlayerbotAIConfig.weightTeleToStormwind);
        case TeleportCityId::IRONFORGE:
            return std::max(0, sPlayerbotAIConfig.weightTeleToIronforge);
        case TeleportCityId::DARNASSUS:
            return std::max(0, sPlayerbotAIConfig.weightTeleToDarnassus);
        case TeleportCityId::EXODAR:
            return std::max(0, sPlayerbotAIConfig.weightTeleToExodar);
        case TeleportCityId::ORGRIMMAR:
            return std::max(0, sPlayerbotAIConfig.weightTeleToOrgrimmar);
        case TeleportCityId::UNDERCITY:
            return std::max(0, sPlayerbotAIConfig.weightTeleToUndercity);
        case TeleportCityId::THUNDER_BLUFF:
            return std::max(0, sPlayerbotAIConfig.weightTeleToThunderBluff);
        case TeleportCityId::SILVERMOON_CITY:
            return std::max(0, sPlayerbotAIConfig.weightTeleToSilvermoonCity);
        case TeleportCityId::SHATTRATH_CITY:
            return std::max(0, sPlayerbotAIConfig.weightTeleToShattrathCity);
        case TeleportCityId::DALARAN:
            return std::max(0, sPlayerbotAIConfig.weightTeleToDalaran);
    }

    return 0;
}

bool RandomPlayerbotMgr::IsCityAvailableForBot(Player* bot, TeleportCityId city)
{
    if (!bot)
        return false;

    auto cityItr = kTeleportCities.find(city);
    if (cityItr == kTeleportCities.end())
        return false;

    TeleportCityFaction faction = cityItr->second.faction;
    if (faction == TeleportCityFaction::NEUTRAL)
        return true;

    if (IsAlliance(bot->GetRace()))
        return faction == TeleportCityFaction::ALLIANCE;

    return faction == TeleportCityFaction::HORDE;
}

bool RandomPlayerbotMgr::GetRandomCityTeleportTarget(Player* bot, TeleportCityId city, WorldLocation& loc)
{
    if (!bot || !IsCityAvailableForBot(bot, city))
        return false;

    auto cityLocItr = bankerLocsPerCityCache.find(city);
    if (cityLocItr != bankerLocsPerCityCache.end() && !cityLocItr->second.empty())
    {
        BankerLocation const& bankerLoc = PickRandom(cityLocItr->second);
        loc = bankerLoc.loc;
        return true;
    }

    auto fallbackItr = kTeleportCities.find(city);
    if (fallbackItr == kTeleportCities.end())
        return false;

    loc = fallbackItr->second.fallback;
    return true;
}

bool RandomPlayerbotMgr::GetRandomCityTeleportTarget(Player* bot, WorldLocation& loc)
{
    if (!bot)
        return false;

    std::vector<TeleportCityId> weightedCities;
    for (auto const& cityEntry : bankerLocsPerCityCache)
    {
        if (!IsCityAvailableForBot(bot, cityEntry.first))
            continue;

        uint32 weight = GetCityWeight(cityEntry.first);
        if (!weight)
            continue;

        for (uint32 i = 0; i < weight; ++i)
            weightedCities.push_back(cityEntry.first);
    }

    if (weightedCities.empty())
    {
        for (auto const& cityEntry : kTeleportCities)
        {
            if (!IsCityAvailableForBot(bot, cityEntry.first))
                continue;

            uint32 weight = GetCityWeight(cityEntry.first);
            if (!weight)
                continue;

            for (uint32 i = 0; i < weight; ++i)
                weightedCities.push_back(cityEntry.first);
        }
    }

    if (weightedCities.empty())
        return false;

    return GetRandomCityTeleportTarget(bot, PickRandom(weightedCities), loc);
}

bool RandomPlayerbotMgr::GetCapitalAnchorCity(Player* bot, TeleportCityId& city)
{
    if (!bot)
        return false;

    std::string anchor = GetData(bot->GetGUIDLow(), "city_anchor");
    if (anchor == "stormwind")
    {
        city = TeleportCityId::STORMWIND;
        return true;
    }

    if (anchor == "orgrimmar")
    {
        city = TeleportCityId::ORGRIMMAR;
        return true;
    }

    return false;
}

uint32 RandomPlayerbotMgr::GetCapitalCityBotCount(uint32 zoneId)
{
    uint32 count = 0;
    for (uint32 botGuid : currentBots)
    {
        Player* bot = GetPlayerBot(botGuid);
        if (!bot || !bot->IsInWorld() || bot->InBattleground())
            continue;

        if (sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ()) == zoneId)
            ++count;
    }

    return count;
}

bool RandomPlayerbotMgr::IsTeleportTargetVisibleToPlayers(WorldLocation const& loc, float range)
{
    float const sqRange = range * range;
    for (Player* player : players)
    {
        if (!player || !player->GetSession() || !player->IsInWorld() || player->IsDuringRemoveFromWorld() ||
            player->GetSession()->IsLogingOut())
            continue;

        if (player->GetMapId() != loc.mapId)
            continue;

        float dx = player->GetPositionX() - loc.x;
        float dy = player->GetPositionY() - loc.y;
        float dz = player->GetPositionZ() - loc.z;
        if (dx * dx + dy * dy + dz * dz <= sqRange)
            return true;
    }

    return false;
}

bool RandomPlayerbotMgr::TeleportBotToCapitalAnchor(Player* bot, TeleportCityId city, bool resetAnchorTimers)
{
    if (!bot)
        return false;

    uint32 currentZone = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
    uint32 cityZone = GetCityZoneId(city);

    SetValue(bot, "city_anchor", 1, GetCityName(city));

    if (currentZone != cityZone)
    {
        WorldLocation cityLoc;
        if (!GetRandomCityTeleportTarget(bot, city, cityLoc))
            return false;

        std::vector<WorldLocation> cityTargets(1, cityLoc);
        RandomTeleport(bot, cityTargets, true);
    }

    if (resetAnchorTimers)
    {
        uint32 dwellMin = std::max<uint32>(1, sPlayerbotAIConfig.capitalCityDwellMin);
        uint32 dwellMax = std::max(dwellMin, sPlayerbotAIConfig.capitalCityDwellMax);
        uint32 dwell = urand(dwellMin, dwellMax);
        ScheduleTeleport(bot->GetGUIDLow(), dwell);
        ScheduleLogout(bot->GetGUIDLow(), dwell);
    }

    return true;
}

bool RandomPlayerbotMgr::ShouldProtectCapitalBotFromLogout(Player* bot)
{
    if (IsProtectedByPopulationDirector(bot))
        return true;

    if (!bot || !sPlayerbotAIConfig.enableCapitalCityPopulation || !sPlayerbotAIConfig.capitalCityProtectFromLogout)
        return false;

    TeleportCityId city;
    if (!GetCapitalAnchorCity(bot, city))
        return false;

    uint32 target = city == TeleportCityId::STORMWIND ? sPlayerbotAIConfig.minStormwindBots : sPlayerbotAIConfig.minOrgrimmarBots;
    return target && GetCapitalCityBotCount(GetCityZoneId(city)) < target;
}

void RandomPlayerbotMgr::MaintainCapitalCityPopulation()
{
    if (sPlayerbotAIConfig.enablePopulationDirector)
        return;

    if (!sPlayerbotAIConfig.enableCapitalCityPopulation)
        return;

    if (GetEventValue(MANAGER_BOT, "capital_city_check"))
        return;

    SetEventValue(MANAGER_BOT, "capital_city_check", 1, std::max<uint32>(1, sPlayerbotAIConfig.capitalCityCheckInterval));

    auto maintainCity = [this](TeleportCityId city, uint32 targetCount)
    {
        if (!targetCount)
            return;

        uint32 currentCount = GetCapitalCityBotCount(GetCityZoneId(city));
        if (currentCount >= targetCount)
            return;

        struct Candidate
        {
            Player* bot = nullptr;
            int32 score = 0;
        };

        std::vector<Candidate> candidates;
        for (uint32 botGuid : currentBots)
        {
            Player* bot = GetPlayerBot(botGuid);
            if (!bot || !bot->IsInWorld() || bot->IsBeingTeleported() || bot->isDead() || bot->IsInCombat() ||
                bot->InBattleground() || bot->InBattlegroundQueue() || bot->GetLevel() < sPlayerbotAIConfig.capitalCityMinLevel)
            {
                continue;
            }

            PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
            if (!botAI || botAI->HasActivePlayerMaster())
                continue;

            std::string anchor = GetData(botGuid, "city_anchor");
            if (!anchor.empty() && anchor != GetCityName(city))
                continue;

            uint32 zoneId = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
            int32 score = int32(bot->GetLevel());
            if (!bot->GetGroup())
                score += 1000;
            if (anchor == GetCityName(city))
                score += 10000;
            if (zoneId == GetCityZoneId(city))
                score += 5000;

            candidates.push_back({bot, score});
        }

        std::sort(candidates.begin(), candidates.end(), [](Candidate const& lhs, Candidate const& rhs) {
            return lhs.score > rhs.score;
        });

        uint32 shortage = targetCount - currentCount;
        for (Candidate const& candidate : candidates)
        {
            if (!shortage)
                break;

            if (TeleportBotToCapitalAnchor(candidate.bot, city, true))
            {
                --shortage;
                ++currentCount;
            }
        }
    };

    maintainCity(TeleportCityId::STORMWIND, sPlayerbotAIConfig.minStormwindBots);
    maintainCity(TeleportCityId::ORGRIMMAR, sPlayerbotAIConfig.minOrgrimmarBots);
}

void RandomPlayerbotMgr::QueueReservePopulationWithoutDirector()
{
    if (sPlayerbotAIConfig.enablePopulationDirector || sPlayerbotAIConfig.reserveZones.empty())
        return;

    std::unordered_map<uint32, uint32> countsByZone;
    std::vector<Player*> misplacedBots;
    for (uint32 botGuid : currentBots)
    {
        Player* bot = GetPlayerBot(botGuid);
        if (!bot || !bot->IsInWorld())
            continue;

        uint32 zoneId = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
        auto reserveItr = sPlayerbotAIConfig.reserveZones.find(zoneId);
        if (reserveItr != sPlayerbotAIConfig.reserveZones.end() && reserveItr->second)
            ++countsByZone[zoneId];
    }

    uint32 totalNeeded = 0;
    for (auto const& reserve : sPlayerbotAIConfig.reserveZones)
    {
        uint32 current = countsByZone[reserve.first];
        if (current < reserve.second)
            totalNeeded += reserve.second - current;
    }

    if (!totalNeeded)
        return;

    std::vector<uint32> offlineBots = GetOfflineRandomBots(totalNeeded);
    if (offlineBots.empty())
        return;

    std::unordered_set<uint32> queued(populationLoginQueue.begin(), populationLoginQueue.end());
    size_t nextOffline = 0;
    time_t now = NowSeconds();
    for (auto const& reserve : sPlayerbotAIConfig.reserveZones)
    {
        uint32 zoneId = reserve.first;
        uint32 current = countsByZone[zoneId];
        if (current >= reserve.second)
            continue;

        auto bracketItr = zone2LevelBracket.find(zoneId);
        if (bracketItr == zone2LevelBracket.end())
            continue;

        LevelBracket bracket = NormalizeReserveLevelBracket(zoneId, bracketItr->second);
        BotPopulationRole role = bracket.high <= 12 ? BotPopulationRole::reserve_starter : BotPopulationRole::reserve_city;
        uint32 missing = reserve.second - current;
        while (missing-- && nextOffline < offlineBots.size())
        {
            uint32 botGuid = offlineBots[nextOffline++];
            if (queued.contains(botGuid))
                continue;

            SetPopulationAssignment(botGuid, role, zoneId, bracket, now + 600, now);
            populationLoginQueue.push_back(botGuid);
            queued.insert(botGuid);
        }
    }
}

bool RandomPlayerbotMgr::GetTeleportCityByZone(uint32 zoneId, TeleportCityId& city) const
{
    for (auto const& entry : kTeleportCities)
    {
        if (entry.second.zoneId == zoneId)
        {
            city = entry.first;
            return true;
        }
    }

    return false;
}

bool RandomPlayerbotMgr::BuildPopulationBucketForZone(uint32 zoneId, PopulationBucket& bucket) const
{
    if (!zoneId || !const_cast<RandomPlayerbotMgr*>(this)->EnsureTravelCachesReady())
        return false;

    auto bracketItr = zone2LevelBracket.find(zoneId);
    if (bracketItr == zone2LevelBracket.end())
        return false;

    bucket = PopulationBucket();
    bucket.zoneId = zoneId;
    bucket.bracket = NormalizeReserveLevelBracket(zoneId, bracketItr->second);
    bucket.mapId = 0;

    auto appendPoint = [&bucket](WorldLocation const& loc)
    {
        if (!bucket.mapId)
        {
            bucket.mapId = loc.mapId;
            bucket.centroid = loc;
        }

        bucket.points.push_back(loc);
        bucket.pointCount = static_cast<uint32>(bucket.points.size());
        float count = float(bucket.pointCount);
        bucket.centroid.x = ((bucket.centroid.x * (count - 1.0f)) + loc.x) / count;
        bucket.centroid.y = ((bucket.centroid.y * (count - 1.0f)) + loc.y) / count;
        bucket.centroid.z = ((bucket.centroid.z * (count - 1.0f)) + loc.z) / count;
        bucket.centroid.o = loc.o;
        bucket.centroid.mapId = loc.mapId;
    };

    for (auto const& locPair : TravelMgr::instance().exploreLocs)
    {
        ExploreTravelDestination* destination = locPair.second;
        if (!destination)
            continue;

        uint32 areaId = locPair.first;
        AreaTableEntry const* area = sAreaTableStore.LookupEntry(areaId);
        uint32 pointZoneId = area && area->zone ? area->zone : areaId;
        if (pointZoneId != zoneId)
            continue;

        for (WorldPosition* point : destination->getPointsRef())
            appendPoint(WorldLocation(*point));
    }

    for (RpgTravelDestination* destination : TravelMgr::instance().rpgNpcs)
    {
        if (!destination)
            continue;

        for (WorldPosition* point : destination->getPointsRef())
        {
            if (sTerrainMgr.GetZoneId(point->getMapId(), point->getX(), point->getY(), point->getZ()) == zoneId)
                appendPoint(WorldLocation(*point));
        }
    }

    TeleportCityId city;
    if (GetTeleportCityByZone(zoneId, city))
    {
        for (BankerLocation const& loc : bankerLocsPerCityCache.at(city))
            appendPoint(loc.loc);
    }

    return !bucket.points.empty();
}

void RandomPlayerbotMgr::RelocateBotToAssignedReserveZone(Player* bot)
{
    if (!bot)
        return;

    BotPopulationRole role = GetPopulationRole(bot->GetGUIDLow());
    if (role != BotPopulationRole::reserve_city && role != BotPopulationRole::reserve_starter)
        return;

    uint32 zoneId = GetPopulationZone(bot->GetGUIDLow());
    if (!zoneId)
        return;

    uint32 currentZone = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
    if (currentZone == zoneId)
        return;

    if (sPlayerbotAIConfig.debugRandomBotPopulation)
        LOG_DEBUG("playerbots", "Random bot reserve relocation: %s (%u) role=%s currentZone=%u targetZone=%u",
            bot->GetName(), bot->GetGUIDLow(), GetPopulationRoleName(role), currentZone, zoneId);

    TeleportCityId city;
    if (role == BotPopulationRole::reserve_city && GetTeleportCityByZone(zoneId, city))
    {
        TeleportBotToCapitalAnchor(bot, city, false);
        return;
    }

    PopulationBucket bucket;
    if (BuildPopulationBucketForZone(zoneId, bucket))
        RandomTeleportToBucket(bot, bucket);
}

bool RandomPlayerbotMgr::ProcessBot(Player* player)
{
    if (!player || !player->IsInWorld() || player->IsBeingTeleported())
        return false;

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(player);
    if (!botAI || botAI->HasActivePlayerMaster() || player->GetSession()->isLogingOut())
        return false;

    if (EnsureAutonomousInit(player, "update"))
        return true;

    if (player->isDead())
    {
        if (IsEventDue(player->GetGUIDLow(), "revive"))
        {
            Revive(player);
            return true;
        }

        return false;
    }

    if (player->InBattlegroundQueue())
    {
        if (IsEventDue(player->GetGUIDLow(), "strategy"))
        {
            ChangeStrategy(player);
            return true;
        }

        if (botAI->DoSpecificAction("bg status check", Event(), true))
            return true;

        return false;
    }

    if (player->InBattleground())
    {
        if (IsEventDue(player->GetGUIDLow(), "strategy"))
        {
            ChangeStrategy(player);
            return true;
        }

        return false;
    }

    if ((sPlayerbotAIConfig.randomBotJoinBG || sPlayerbotAIConfig.randomBotAutoJoinBG) &&
        botAI->DoSpecificAction("bg join", Event(), true))
    {
        ScheduleChangeStrategy(player->GetGUIDLow(), 1);
        return true;
    }

    if (IsEventDue(player->GetGUIDLow(), "randomize"))
    {
        if (!GetValue(player, "randomized"))
            RandomizeFirst(player);
        else if (!sPlayerbotAIConfig.randomBotFixedLevel && !sPlayerbotAIConfig.disableRandomLevels &&
                 player->GetLevel() < sPlayerbotAIConfig.randomBotMaxLevel && urand(0, 99) < 25)
            IncreaseLevel(player);
        else
            RandomizeMin(player);

        return true;
    }

    if (IsEventDue(player->GetGUIDLow(), "strategy"))
    {
        ChangeStrategy(player);
        return true;
    }

    if (!player->InBattleground() && !player->InBattlegroundQueue() && !player->IsInCombat() &&
        IsEventDue(player->GetGUIDLow(), "teleport"))
    {
        PlayerbotAI* pBotAI = GET_PLAYERBOT_AI(player);
        if (!pBotAI || !pBotAI->HasPlayerNearby(sPlayerbotAIConfig.grindDistance))
        {
            RandomTeleport(player);
            return true;
        }
    }

    return false;
}

void RandomPlayerbotMgr::Revive(Player* player)
{
    if (!player)
        return;

    if (player->isDead())
    {
        player->ResurrectPlayer(1.0f, false);
        player->SetHealth(player->GetMaxHealth());
        player->SetPower(POWER_MANA, player->GetMaxPower(POWER_MANA));
        if (player->GetCorpse())
            player->SpawnCorpseBones();

        if (!player->InBattleground())
        {
            bool teleported = false;
            if (sPlayerbotAIConfig.enablePopulationDirector)
            {
                uint32 zoneId = GetPopulationZone(player->GetGUIDLow());
                PopulationSnapshot const& snapshot = GetPopulationSnapshot();
                for (PopulationBucket const& bucket : snapshot.buckets)
                {
                    if (bucket.zoneId == zoneId && RandomTeleportToBucket(player, bucket))
                    {
                        teleported = true;
                        break;
                    }
                }
            }

            if (!teleported)
            {
                TeleportCityId city;
                if (GetCapitalAnchorCity(player, city))
                    TeleportBotToCapitalAnchor(player, city, true);
                else
                    RandomTeleportForLevel(player);
            }
        }
    }

    SetEventValue(player->GetGUIDLow(), "revive", 1,
        urand(sPlayerbotAIConfig.minRandomBotReviveTime,
            std::max(sPlayerbotAIConfig.minRandomBotReviveTime, sPlayerbotAIConfig.maxRandomBotReviveTime)));
}

void RandomPlayerbotMgr::ChangeStrategy(Player* player)
{
    if (!player)
        return;

    ChangeStrategyOnce(player);
    ScheduleChangeStrategy(player->GetGUIDLow(), 0);
}

void RandomPlayerbotMgr::ChangeStrategyOnce(Player* player)
{
    if (!player)
        return;

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(player);
    if (!botAI)
        return;

    botAI->ResetStrategies(false);

    if (player->InBattleground() || player->InBattlegroundQueue())
    {
        botAI->ChangeStrategy("+bg", BOT_STATE_NON_COMBAT);
        SetValue(player, "strategy_mode", 1, "bg");
        return;
    }

    bool selectRpgMode = urand(0, 99) < uint32(sPlayerbotAIConfig.randomBotRpgChance * 100.0f);
    std::string mode;
    std::string strategy;

    if (selectRpgMode && sPlayerbotAIConfig.enableNewRpgStrategy)
    {
        strategy = "+new rpg,-rpg,-grind";
        mode = "new rpg";
    }
    else if (selectRpgMode)
    {
        strategy = "+rpg,-grind";
        mode = "rpg";
    }
    else if (sPlayerbotAIConfig.enableNewRpgStrategy)
    {
        strategy = "+grind,-new rpg,-rpg";
        mode = "grind";
    }
    else
    {
        strategy = "+grind,-rpg";
        mode = "grind";
    }

    botAI->ChangeStrategy(strategy, BOT_STATE_NON_COMBAT);
    SetValue(player, "strategy_mode", 1, mode);
    LOG_DEBUG("playerbots", "Random bot strategy mode: %s (%u) -> %s",
        player->GetName(), player->GetGUIDLow(), mode.c_str());
}

uint32 RandomPlayerbotMgr::GetValue(Player* bot, std::string const& type)
{
    if (!bot)
        return 0;

    return GetValue(bot->GetGUIDLow(), type);
}

uint32 RandomPlayerbotMgr::GetValue(uint32 bot, std::string const& type) { return GetEventValue(bot, type); }
std::string RandomPlayerbotMgr::GetData(uint32 bot, std::string const& type) { return GetEventData(bot, type); }

void RandomPlayerbotMgr::SetValue(uint32 bot, std::string const& type, uint32 value, std::string const& data)
{
    SetEventValue(bot, type, value, 0, data);
}

void RandomPlayerbotMgr::SetValue(Player* bot, std::string const& type, uint32 value, std::string const& data)
{
    if (!bot)
        return;

    SetValue(bot->GetGUIDLow(), type, value, data);
}

void RandomPlayerbotMgr::Remove(Player* bot)
{
    if (!bot)
        return;

    currentBots.remove(bot->GetGUIDLow());
    eventCache.erase(bot->GetGUIDLow());
    CharacterDatabase.PExecute("DELETE FROM playerbots_random_bots WHERE owner = %u AND bot = %u",
        RANDOM_BOT_OWNER, bot->GetGUIDLow());
}

ObjectGuid RandomPlayerbotMgr::GetBattleMasterGUID(Player* bot, BattlegroundTypeId bgTypeId)
{
    if (!bot || !IsSupportedRandomBg(bgTypeId))
        return ObjectGuid::Empty;

    std::vector<uint32>& guids = BattleMastersCache[bot->GetTeamId()][bgTypeId];
    if (guids.empty())
        return ObjectGuid::Empty;

    uint32 bestGuid = guids.front();
    float bestDist = std::numeric_limits<float>::max();

    for (uint32 guidLow : guids)
    {
        CreatureData const* data = sObjectMgr.GetCreatureData(guidLow);
        if (!data)
            continue;

        if (data->position.mapId == bot->GetMapId())
        {
            float dx = data->position.x - bot->GetPositionX();
            float dy = data->position.y - bot->GetPositionY();
            float dz = data->position.z - bot->GetPositionZ();
            float dist = std::sqrt(dx * dx + dy * dy + dz * dz);
            if (dist < bestDist)
            {
                bestDist = dist;
                bestGuid = guidLow;
            }
        }
    }

    return ObjectGuid(HIGHGUID_UNIT, 0, bestGuid);
}

CreatureData const* RandomPlayerbotMgr::GetCreatureDataByEntry(uint32 entry)
{
    ObjectGuid guid = sObjectMgr.GetOneCreatureByEntry(entry);
    if (!guid)
        return nullptr;

    return sObjectMgr.GetCreatureData(guid.GetCounter());
}

void RandomPlayerbotMgr::LoadBattleMastersCache()
{
    BattleMastersCache.clear();

    struct Worker
    {
        RandomPlayerbotMgr* mgr;
        bool operator()(CreatureDataPair const& pair) const
        {
            CreatureData const& data = pair.second;
            CreatureInfo const* info = sObjectMgr.GetCreatureTemplate(data.creature_id[0]);
            if (!info || !(info->npcflag & UNIT_NPC_FLAG_BATTLEMASTER))
                return false;

            BattlegroundTypeId bgTypeId = sBattleGroundMgr.GetBattleMasterBG(data.creature_id[0]);
            if (!IsSupportedRandomBg(bgTypeId))
                return false;

            FactionTemplateEntry const* battlemasterFaction = sObjectMgr.GetFactionTemplateEntry(info->faction);
            FactionTemplateEntry const* allianceFaction = sObjectMgr.GetFactionTemplateEntry(1);
            FactionTemplateEntry const* hordeFaction = sObjectMgr.GetFactionTemplateEntry(2);

            bool added = false;
            if (battlemasterFaction && allianceFaction && battlemasterFaction->IsFriendlyTo(*allianceFaction))
            {
                mgr->BattleMastersCache[TEAM_ALLIANCE][bgTypeId].push_back(pair.first);
                added = true;
            }

            if (battlemasterFaction && hordeFaction && battlemasterFaction->IsFriendlyTo(*hordeFaction))
            {
                mgr->BattleMastersCache[TEAM_HORDE][bgTypeId].push_back(pair.first);
                added = true;
            }

            if (!added)
            {
                mgr->BattleMastersCache[TEAM_ALLIANCE][bgTypeId].push_back(pair.first);
                mgr->BattleMastersCache[TEAM_HORDE][bgTypeId].push_back(pair.first);
            }

            return false;
        }
    } worker{this};

    sObjectMgr.DoCreatureData(worker);

    LOG_DEBUG("playerbots", "Random battlemaster cache: AV=%zu AB=%zu WS=%zu",
        BattleMastersCache[TEAM_ALLIANCE][BATTLEGROUND_AV].size() +
            BattleMastersCache[TEAM_HORDE][BATTLEGROUND_AV].size(),
        BattleMastersCache[TEAM_ALLIANCE][BATTLEGROUND_AB].size() +
            BattleMastersCache[TEAM_HORDE][BATTLEGROUND_AB].size(),
        BattleMastersCache[TEAM_ALLIANCE][BATTLEGROUND_WS].size() +
            BattleMastersCache[TEAM_HORDE][BATTLEGROUND_WS].size());
}

void RandomPlayerbotMgr::CheckBgQueue()
{
    if (!sPlayerbotAIConfig.randomBotJoinBG && !sPlayerbotAIConfig.randomBotAutoJoinBG)
        return;

    for (int bracket = BG_BRACKET_ID_FIRST; bracket < MAX_BATTLEGROUND_BRACKETS; ++bracket)
    {
        for (int queueType = BATTLEGROUND_QUEUE_AV; queueType < MAX_BATTLEGROUND_QUEUE_TYPES; ++queueType)
            BattlegroundData[queueType][bracket] = BattlegroundInfo();
    }

    for (BattlegroundTypeId bgTypeId : {BATTLEGROUND_AV, BATTLEGROUND_AB, BATTLEGROUND_WS})
    {
        BattleGroundQueueTypeId queueTypeId = ToQueueType(bgTypeId);
        for (auto itr = sBattleGroundMgr.GetBattleGroundsBegin(bgTypeId); itr != sBattleGroundMgr.GetBattleGroundsEnd(bgTypeId); ++itr)
        {
            BattleGround* bg = itr->second;
            if (!bg)
                continue;

            BattlegroundInfo& info = BattlegroundData[queueTypeId][bg->GetBracketId()];
            info.bgInstances.push_back(bg->GetInstanceID());
            info.bgInstanceCount = static_cast<uint32>(info.bgInstances.size());
            info.minLevel = bg->GetMinLevel();
            info.maxLevel = bg->GetMaxLevel();

            BattleGround::BattleGroundPlayerMap const& bgPlayers = bg->GetPlayers();
            for (auto const& playerInfo : bgPlayers)
            {
                Player* player = ObjectAccessor::FindPlayer(playerInfo.first);
                if (!player)
                    continue;

                bool isRandom = IsRandomBot(player);
                if (player->GetTeam() == ALLIANCE)
                {
                    if (isRandom)
                        ++info.bgAllianceBotCount;
                    else
                        ++info.bgAlliancePlayerCount;
                }
                else
                {
                    if (isRandom)
                        ++info.bgHordeBotCount;
                    else
                        ++info.bgHordePlayerCount;
                }
            }
        }

        BattleGroundQueue& queue = sBattleGroundMgr.m_battleGroundQueues[queueTypeId];
        for (auto const& queued : queue.m_queuedPlayers)
        {
            Player* player = ObjectAccessor::FindPlayer(queued.first);
            if (!player)
                continue;

            BattleGroundBracketId bracketId = player->GetBattleGroundBracketIdFromLevel(bgTypeId);
            BattlegroundInfo& info = BattlegroundData[queueTypeId][bracketId];
            info.activeBgQueue = 1;
            bool isRandom = IsRandomBot(player);

            if (player->GetTeam() == ALLIANCE)
            {
                if (isRandom)
                    ++info.bgAllianceBotCount;
                else
                    ++info.bgAlliancePlayerCount;
            }
            else
            {
                if (isRandom)
                    ++info.bgHordeBotCount;
                else
                    ++info.bgHordePlayerCount;
            }
        }

        if (sPlayerbotAIConfig.randomBotAutoJoinBG)
        {
            uint32 configuredQueues = GetAutoJoinCount(bgTypeId);
            if (configuredQueues)
            {
                for (int bracket = BG_BRACKET_ID_FIRST; bracket < MAX_BATTLEGROUND_BRACKETS; ++bracket)
                {
                    BattlegroundBracketId bracketId = static_cast<BattlegroundBracketId>(bracket);
                    if (!IsAutoJoinBracketEnabled(bgTypeId, bracketId))
                        continue;

                    BattlegroundInfo& info = BattlegroundData[queueTypeId][bracketId];
                    info.activeBgQueue = std::max(info.activeBgQueue, configuredQueues);
                }
            }
        }
    }
}

void RandomPlayerbotMgr::CheckLfgQueue() {}

void RandomPlayerbotMgr::CheckPlayers()
{
    players.clear();

    HashMapHolder<Player>::ReadGuard guard(HashMapHolder<Player>::GetLock());
    HashMapHolder<Player>::MapType const& map = sObjectAccessor.GetPlayers();
    for (auto const& itr : map)
    {
        Player* player = itr.second;
        if (!player || !player->GetSession())
            continue;

        if (player->GetSession()->GetSecurity() > SEC_PLAYER && !player->isGMVisible())
            continue;

        if (player->IsBot())
            continue;

        players.push_back(player);
    }

    if (!players.empty())
        RealPlayerLastTimeSeen = NowSeconds();

    // Note: GetBots() is called by UpdateAIInternal right after CheckPlayers(),
    // so we defer activityMod calculation there as well via FinishCheckPlayers().
}

void RandomPlayerbotMgr::FinishCheckPlayers()
{
    float configured = std::max(0.0f, std::min(100.0f, static_cast<float>(sPlayerbotAIConfig.botActiveAlone)));
    activityMod = configured / 100.0f;
    if (!players.empty())
        activityMod = std::min(1.0f, std::max(activityMod, 0.25f + std::min<float>(0.75f, players.size() / 20.0f)));
    else
        activityMod = std::min(activityMod, 0.25f);

    activeBots = static_cast<uint32>(std::round(currentBots.size() * activityMod));
}

void RandomPlayerbotMgr::LogBattlegroundInfo()
{
    auto summarize = [this](BattlegroundTypeId bgTypeId)
    {
        BattleGroundQueueTypeId queueTypeId = ToQueueType(bgTypeId);
        uint32 activeQueues = 0;
        uint32 activeInstances = 0;
        uint32 allianceBots = 0;
        uint32 hordeBots = 0;
        uint32 alliancePlayers = 0;
        uint32 hordePlayers = 0;

        for (int bracket = BG_BRACKET_ID_FIRST; bracket < MAX_BATTLEGROUND_BRACKETS; ++bracket)
        {
            BattlegroundInfo const& info = BattlegroundData[queueTypeId][bracket];
            activeQueues += info.activeBgQueue;
            activeInstances += info.bgInstanceCount;
            allianceBots += info.bgAllianceBotCount;
            hordeBots += info.bgHordeBotCount;
            alliancePlayers += info.bgAlliancePlayerCount;
            hordePlayers += info.bgHordePlayerCount;
        }

        return std::make_tuple(activeQueues, activeInstances, allianceBots, hordeBots, alliancePlayers, hordePlayers);
    };

    auto [avQueues, avInstances, avAllianceBots, avHordeBots, avAlliancePlayers, avHordePlayers] =
        summarize(BATTLEGROUND_AV);
    auto [abQueues, abInstances, abAllianceBots, abHordeBots, abAlliancePlayers, abHordePlayers] =
        summarize(BATTLEGROUND_AB);
    auto [wsQueues, wsInstances, wsAllianceBots, wsHordeBots, wsAlliancePlayers, wsHordePlayers] =
        summarize(BATTLEGROUND_WS);

    LOG_DEBUG("playerbots",
        "Random BG state: AV q=%u inst=%u a=%u/%u h=%u/%u | AB q=%u inst=%u a=%u/%u h=%u/%u | WS q=%u inst=%u a=%u/%u h=%u/%u",
        avQueues, avInstances, avAllianceBots, avAlliancePlayers, avHordeBots, avHordePlayers,
        abQueues, abInstances, abAllianceBots, abAlliancePlayers, abHordeBots, abHordePlayers,
        wsQueues, wsInstances, wsAllianceBots, wsAlliancePlayers, wsHordeBots, wsHordePlayers);
}

void RandomPlayerbotMgr::PrepareAddclassCache()
{
    addclassCache.clear();

    if (addClassTypeAccounts.empty())
        return;

    std::ostringstream accounts;
    for (size_t i = 0; i < addClassTypeAccounts.size(); ++i)
    {
        if (i)
            accounts << ',';
        accounts << addClassTypeAccounts[i];
    }

    auto result = CharacterDatabase.PQuery(
        "SELECT guid, race, class FROM characters WHERE account IN (%s)",
        accounts.str().c_str());

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();
        uint32 guidLow = fields[0].GetUInt32();
        uint8 race = fields[1].GetUInt8();
        uint8 cls = fields[2].GetUInt8();

        addclassCache[GetTeamClassIdx(IsAlliance(race), cls)].insert(ObjectGuid(HIGHGUID_PLAYER, guidLow));
    } while (result->NextRow());
}

void RandomPlayerbotMgr::PrepareZone2LevelBracket()
{
    zone2LevelBracket.clear();
    for (auto const& bracket : sPlayerbotAIConfig.zoneBrackets)
        zone2LevelBracket[bracket.first] = {bracket.second.first, bracket.second.second};
}

void RandomPlayerbotMgr::PrepareTeleportCache()
{
    locsPerLevelCache.clear();
    allianceStarterPerLevelCache.clear();
    hordeStarterPerLevelCache.clear();
    bankerLocsPerLevelCache.clear();
    bankerLocsPerCityCache.clear();
    cityBankerEntries.clear();
    bankerEntryToCity = kBankerToCity;
    bankerEntryToLocation.clear();
    rpgLocsCacheLevel.clear();

    uint32 maxLevel = sWorld.getIntConfig(CONFIG_MAX_PLAYER_LEVEL);

    for (uint8 race = RACE_HUMAN; race < MAX_RACES; ++race)
    {
        for (uint8 cls = CLASS_WARRIOR; cls < MAX_CLASSES; ++cls)
        {
            PlayerInfo const* info = sObjectMgr.GetPlayerInfo(race, cls);
            if (!info)
                continue;

            WorldLocation loc(info->mapId, info->positionX, info->positionY, info->positionZ, info->orientation);
            for (uint32 level = 1; level <= maxLevel; ++level)
            {
                if (IsAlliance(race))
                    allianceStarterPerLevelCache[level].push_back(loc);
                else
                    hordeStarterPerLevelCache[level].push_back(loc);
            }
        }
    }

    for (auto const& locPair : TravelMgr::instance().exploreLocs)
    {
        ExploreTravelDestination* destination = locPair.second;
        if (!destination)
            continue;

        std::vector<WorldPosition*> const& points = destination->getPointsRef();
        if (points.empty())
            continue;

        uint32 areaId = locPair.first;
        AreaTableEntry const* area = sAreaTableStore.LookupEntry(areaId);
        uint32 zoneId = area && area->zone ? area->zone : areaId;
        auto bracketItr = zone2LevelBracket.find(zoneId);
        if (bracketItr == zone2LevelBracket.end())
            continue;

        uint32 low = ClampToLevelBracket(bracketItr->second.low);
        uint32 high = ClampToLevelBracket(std::max(low, bracketItr->second.high));
        for (WorldPosition* point : points)
        {
            if (!IsUsableTravelPoint(point))
                continue;

            WorldLocation loc(*point);
            for (uint32 level = low; level <= high; ++level)
                locsPerLevelCache[level].push_back(loc);
        }
    }

    for (RpgTravelDestination* destination : TravelMgr::instance().rpgNpcs)
    {
        if (!destination)
            continue;

        std::vector<WorldPosition*> const& points = destination->getPointsRef();
        if (points.empty())
            continue;

        for (WorldPosition* point : points)
        {
            if (!IsUsableTravelPoint(point))
                continue;

            uint32 zoneId = sTerrainMgr.GetZoneId(point->getMapId(), point->getX(), point->getY(), point->getZ());
            auto bracketItr = zone2LevelBracket.find(zoneId);
            if (bracketItr == zone2LevelBracket.end())
                continue;

            uint32 low = ClampToLevelBracket(bracketItr->second.low);
            uint32 high = ClampToLevelBracket(std::max(low, bracketItr->second.high));
            WorldLocation loc(*point);
            for (uint32 level = low; level <= high; ++level)
                rpgLocsCacheLevel[level][zoneId].push_back(loc);
        }
    }

    struct Worker
    {
        RandomPlayerbotMgr* mgr;
        bool operator()(CreatureDataPair const& pair) const
        {
            CreatureData const& data = pair.second;
            CreatureInfo const* info = sObjectMgr.GetCreatureTemplate(data.creature_id[0]);
            if (!info || !MapManager::IsValidMapCoord(data.position.mapId, data.position.x, data.position.y, data.position.z))
                return false;

            WorldLocation loc(data.position);
            uint32 zoneId = sTerrainMgr.GetZoneId(data.position.mapId, data.position.x, data.position.y, data.position.z);
            auto bracketItr = mgr->zone2LevelBracket.find(zoneId);

            if ((info->npcflag & UNIT_NPC_FLAG_BANKER) && bracketItr != mgr->zone2LevelBracket.end())
            {
                uint32 low = ClampToLevelBracket(bracketItr->second.low);
                uint32 high = ClampToLevelBracket(std::max(low, bracketItr->second.high));
                for (uint32 level = low; level <= high; ++level)
                    mgr->bankerLocsPerLevelCache[level].push_back({loc, data.creature_id[0]});

                auto cityItr = mgr->bankerEntryToCity.find(data.creature_id[0]);
                if (cityItr != mgr->bankerEntryToCity.end())
                {
                    mgr->bankerLocsPerCityCache[cityItr->second.first].push_back({loc, data.creature_id[0]});
                    mgr->cityBankerEntries[cityItr->second.first].push_back(data.creature_id[0]);
                    mgr->bankerEntryToLocation.insert(std::make_pair(data.creature_id[0], loc));
                }
            }

            return false;
        }
    } worker{this};

    sObjectMgr.DoCreatureData(worker);
}

bool RandomPlayerbotMgr::EnsureTravelCachesReady()
{
    TravelMgr& travelMgr = TravelMgr::instance();
    if (travelMgr.exploreLocs.empty() && travelMgr.rpgNpcs.empty())
        travelMgr.LoadQuestTravelTable();

    bool const hasTravelData = !travelMgr.exploreLocs.empty() || !travelMgr.rpgNpcs.empty();
    bool const cachesNeedRebuild = zone2LevelBracket.empty() ||
        allianceStarterPerLevelCache.empty() ||
        hordeStarterPerLevelCache.empty() ||
        locsPerLevelCache.empty() ||
        rpgLocsCacheLevel.empty() ||
        bankerLocsPerCityCache.empty() ||
        bankerEntryToLocation.empty();

    if (cachesNeedRebuild)
    {
        PrepareZone2LevelBracket();
        PrepareTeleportCache();
    }

    return hasTravelData && !zone2LevelBracket.empty() &&
        (!locsPerLevelCache.empty() || !rpgLocsCacheLevel.empty() || !bankerLocsPerCityCache.empty());
}

void RandomPlayerbotMgr::Init()
{
    AssignAccountTypes();
    PrepareAddclassCache();
    EnsureTravelCachesReady();
    LoadBattleMastersCache();
    PruneOrphanRandomBotState();
    CleanupExpiredEvents(true);
    RepairBrokenRandomBotState();

    if (!GetEventValue(MANAGER_BOT, "bot_count"))
        SetEventValue(MANAGER_BOT, "bot_count", std::max<uint32>(sPlayerbotAIConfig.minRandomBots, 1), 0);

    if (!GetEventValue(MANAGER_BOT, "bot_count_refresh"))
        SetEventValue(MANAGER_BOT, "bot_count_refresh", 1,
            urand(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                std::max(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                    sPlayerbotAIConfig.randomBotCountChangeMaxInterval)));

    LOG_DEBUG("playerbots", "RandomPlayerbotMgr initialized: autologin=%s random_accounts=%zu addclass_accounts=%zu level_cache=%zu rpg_cache=%zu",
        sPlayerbotAIConfig.randomBotAutologin ? "true" : "false",
        rndBotTypeAccounts.size(),
        addClassTypeAccounts.size(),
        locsPerLevelCache.size(),
        rpgLocsCacheLevel.size());
}

void RandomPlayerbotMgr::PruneOrphanRandomBotState()
{
    uint32 orphanRows = 0;
    uint32 orphanBots = 0;

    if (auto result = CharacterDatabase.PQuery(
        "SELECT COUNT(*), COUNT(DISTINCT bot) "
        "FROM playerbots_random_bots random_bot "
        "LEFT JOIN characters c ON c.guid = random_bot.bot "
        "WHERE random_bot.owner = %u AND random_bot.bot <> 0 AND c.guid IS NULL",
        RANDOM_BOT_OWNER))
    {
        Field* fields = result->Fetch();
        orphanRows = fields[0].GetUInt32();
        orphanBots = fields[1].GetUInt32();
    }

    if (orphanRows)
    {
        CharacterDatabase.PExecute(
            "DELETE random_bot "
            "FROM playerbots_random_bots random_bot "
            "LEFT JOIN characters c ON c.guid = random_bot.bot "
            "WHERE random_bot.owner = %u AND random_bot.bot <> 0 AND c.guid IS NULL",
            RANDOM_BOT_OWNER);
    }

    LOG_DEBUG("playerbots", "Random bot orphan cleanup pruned %u rows across %u bot GUIDs",
        orphanRows, orphanBots);
}

void RandomPlayerbotMgr::AssignAccountTypes()
{
    rndBotTypeAccounts.clear();
    addClassTypeAccounts.clear();

    std::vector<uint32> accounts = sPlayerbotAIConfig.randomBotAccounts;
    if (accounts.empty())
        return;

    uint32 addClassCount = std::min<uint32>(accounts.size(), sPlayerbotAIConfig.addClassAccountPoolSize);
    uint32 randomCount = accounts.size() - addClassCount;

    for (uint32 i = 0; i < randomCount; ++i)
        rndBotTypeAccounts.push_back(accounts[i]);

    for (uint32 i = randomCount; i < accounts.size(); ++i)
        addClassTypeAccounts.push_back(accounts[i]);
}

bool RandomPlayerbotMgr::IsAccountType(uint32 accountId, uint8 accountType)
{
    if (accountType == 1)
        return std::find(rndBotTypeAccounts.begin(), rndBotTypeAccounts.end(), accountId) != rndBotTypeAccounts.end();

    if (accountType == 2)
        return std::find(addClassTypeAccounts.begin(), addClassTypeAccounts.end(), accountId) != addClassTypeAccounts.end();

    return false;
}

bool RandomPlayerbotMgr::IsAddclassAccount(uint32 accountId)
{
    return accountId && IsAccountType(accountId, 2);
}

void RandomPlayerbotMgr::OnBotLoginInternal(Player* const bot)
{
    if (!bot)
        return;

    currentBots.remove(bot->GetGUIDLow());
    currentBots.push_back(bot->GetGUIDLow());
    SetEventValue(bot->GetGUIDLow(), "add", 1, 0);

    if (!EnsureAutonomousInit(bot, "login"))
        ScheduleAutonomousEvents(bot->GetGUIDLow(), "login");

    BotPopulationRole role = GetPopulationRole(bot->GetGUIDLow());
    uint32 assignedZoneId = GetPopulationZone(bot->GetGUIDLow());
    if ((role == BotPopulationRole::reserve_city || role == BotPopulationRole::reserve_starter) && assignedZoneId)
    {
        bool needsDeferredTeleport = false;
        uint32 currentZone = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
        if (currentZone != assignedZoneId)
            needsDeferredTeleport = true;

        if (needsDeferredTeleport)
            ScheduleTeleport(bot->GetGUIDLow(), 1);
    }

    // Restore persisted abandoned quest list so bots don't retry impossible quests.
    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (botAI)
    {
        std::string data = GetData(bot->GetGUIDLow(), "low_priority_quests");
        if (!data.empty())
        {
            std::istringstream stream(data);
            std::string token;
            while (std::getline(stream, token, ','))
            {
                uint32 questId = static_cast<uint32>(std::strtoul(token.c_str(), nullptr, 10));
                if (questId)
                    botAI->lowPriorityQuest.insert(questId);
            }
        }
    }
}

RandomPlayerbotMgr::AutonomousInitState RandomPlayerbotMgr::GetAutonomousInitState(Player* bot)
{
    AutonomousInitState state;
    if (!bot)
        return state;

    uint32 guidLow = bot->GetGUIDLow();
    uint32 level = ClampToLevelBracket(bot->GetLevel());
    uint32 baselineLevel = ClampToLevelBracket(std::max<uint32>(1, sPlayerbotAIConfig.randombotStartingLevel));
    uint32 configuredMinLevel = ClampToLevelBracket(std::max<uint32>(1, sPlayerbotAIConfig.randomBotMinLevel));
    uint32 randomizedLevel = GetValue(guidLow, "randomized");

    state.missingRandomized = randomizedLevel == 0;
    state.missingStrategyEvent = GetEventValue(guidLow, "strategy") == 0;
    state.missingTeleportEvent = GetEventValue(guidLow, "teleport") == 0;
    state.missingStrategyMode = GetEventValue(guidLow, "strategy_mode") == 0;
    state.baselineLevel = level <= baselineLevel && (configuredMinLevel > level || randomizedLevel > level);

    LevelBracket assignedBracket{0, 0};
    if (GetPopulationLevelBand(guidLow, assignedBracket))
    {
        assignedBracket = NormalizeReserveLevelBracket(GetPopulationZone(guidLow), assignedBracket);
        state.assignedLevelBandMismatch = level < assignedBracket.low || level > assignedBracket.high;
    }

    state.missingTalents = bot->GetLevel() >= 10 && bot->GetFreeTalentPoints() > 0;

    Item* mainHand = bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
    bool missingStarterArmor = bot->GetLevel() >= 5 &&
        !bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST) &&
        !bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_LEGS) &&
        !bot->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FEET);
    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    uint32 gearScore = botAI ? botAI->GetEquipGearScore(bot) : 0;
    state.missingGear = !mainHand || gearScore == 0 || missingStarterArmor;

    return state;
}

bool RandomPlayerbotMgr::RepairRandomBotRuntimeState(Player* bot, char const* context)
{
    if (!bot)
        return false;

    PlayerbotFactory factory(bot, ClampToLevelBracket(bot->GetLevel()));
    factory.InitTalentsTree(true, true, true);
    factory.InitEquipment(true);
    factory.InitBags(false);
    factory.InitAmmo();
    factory.InitReagents();
    factory.InitFood();
    factory.InitConsumables();
    factory.InitPotions();
    NormalizePersistedInventoryState(bot);
    bot->SaveToDB(false, false);
    FinalizeAutonomousInit(bot, context);

    LOG_DEBUG("playerbots", "Random bot runtime state repaired: %s (%u) level=%u context=%s",
        bot->GetName(), bot->GetGUIDLow(), bot->GetLevel(), context ? context : "unknown");

    return true;
}

bool RandomPlayerbotMgr::EnsureAutonomousInit(Player* bot, char const* context)
{
    if (!bot || !IsRandomBot(bot))
        return false;

    AutonomousInitState state = GetAutonomousInitState(bot);
    bool hasAutonomyGap = state.missingRandomized || state.missingStrategyEvent || state.missingTeleportEvent ||
        state.missingStrategyMode || state.baselineLevel || state.assignedLevelBandMismatch ||
        state.missingTalents || state.missingGear;
    if (!hasAutonomyGap)
        return false;

    std::vector<std::string> reasons;
    if (state.missingRandomized)
        reasons.push_back("missing randomized");
    if (state.missingStrategyEvent)
        reasons.push_back("missing strategy");
    if (state.missingTeleportEvent)
        reasons.push_back("missing teleport");
    if (state.missingStrategyMode)
        reasons.push_back("missing strategy mode");
    if (state.baselineLevel)
        reasons.push_back("baseline level");
    if (state.assignedLevelBandMismatch)
        reasons.push_back("level band mismatch");
    if (state.missingTalents)
        reasons.push_back("missing talents");
    if (state.missingGear)
        reasons.push_back("missing gear");

    LOG_DEBUG("playerbots", "Random bot uninitialized: %s (%u) [%s] context=%s",
        bot->GetName(), bot->GetGUIDLow(), JoinReasons(reasons).c_str(), context ? context : "unknown");

    if (state.NeedsFullRandomize())
    {
        RandomizeFirst(bot);

        LOG_DEBUG("playerbots", "Random bot repaired: %s (%u) level=%u context=%s",
            bot->GetName(), bot->GetGUIDLow(), bot->GetLevel(), context ? context : "unknown");

        return true;
    }

    bool updated = false;
    if (state.NeedsTargetedRepair())
        updated = RepairRandomBotRuntimeState(bot, context);

    if (state.missingStrategyMode)
    {
        FinalizeAutonomousInit(bot, context);
        updated = true;
    }
    else if (state.missingStrategyEvent || state.missingTeleportEvent)
    {
        BackfillAutonomousEvents(bot->GetGUIDLow(), context);
        updated = true;
    }

    return updated;
}

void RandomPlayerbotMgr::FinalizeAutonomousInit(Player* bot, char const* context)
{
    if (!bot)
        return;

    ChangeStrategyOnce(bot);
    BackfillAutonomousEvents(bot->GetGUIDLow(), context);
}

void RandomPlayerbotMgr::BackfillAutonomousEvents(uint32 bot, char const* context)
{
    std::vector<std::string> missing;
    if (!GetEventValue(bot, "randomize"))
        missing.push_back("randomize");
    if (!GetEventValue(bot, "teleport"))
        missing.push_back("teleport");
    if (!GetEventValue(bot, "strategy"))
        missing.push_back("strategy");
    if (!GetEventValue(bot, "logout"))
        missing.push_back("logout");
    if (!GetEventValue(bot, "revive"))
        missing.push_back("revive");

    if (!missing.empty())
    {
        LOG_DEBUG("playerbots", "Random bot scheduled with missing events: %u [%s] context=%s",
            bot, JoinReasons(missing).c_str(), context ? context : "unknown");
    }

    if (!GetEventValue(bot, "randomize"))
        ScheduleRandomize(bot, 0);
    if (!GetEventValue(bot, "teleport"))
        ScheduleTeleport(bot, 0);
    if (!GetEventValue(bot, "strategy"))
        ScheduleChangeStrategy(bot, 0);
    if (!GetEventValue(bot, "logout"))
        ScheduleLogout(bot, 0);
    if (!GetEventValue(bot, "revive"))
    {
        SetEventValue(bot, "revive", 1,
            urand(sPlayerbotAIConfig.minRandomBotReviveTime,
                std::max(sPlayerbotAIConfig.minRandomBotReviveTime, sPlayerbotAIConfig.maxRandomBotReviveTime)));
    }
}

void RandomPlayerbotMgr::ScheduleAutonomousEvents(uint32 bot, char const* context)
{
    BackfillAutonomousEvents(bot, context);
}

void RandomPlayerbotMgr::RepairBrokenRandomBotState()
{
    if (GetEventValue(MANAGER_BOT, "autonomy_repair_v1"))
        return;
    if (rndBotTypeAccounts.empty())
    {
        SetEventValue(MANAGER_BOT, "autonomy_repair_v1", 1, 0);
        return;
    }

    std::ostringstream accounts;
    for (size_t i = 0; i < rndBotTypeAccounts.size(); ++i)
    {
        if (i)
            accounts << ',';
        accounts << rndBotTypeAccounts[i];
    }

    auto result = CharacterDatabase.PQuery(
        "SELECT DISTINCT add_event.bot "
        "FROM playerbots_random_bots add_event "
        "JOIN characters c ON c.guid = add_event.bot "
        "LEFT JOIN playerbots_random_bots randomized_event "
        "  ON randomized_event.owner = add_event.owner AND randomized_event.bot = add_event.bot "
        "  AND randomized_event.event = 'randomized' "
        "LEFT JOIN playerbots_random_bots strategy_event "
        "  ON strategy_event.owner = add_event.owner AND strategy_event.bot = add_event.bot "
        "  AND strategy_event.event = 'strategy' "
        "LEFT JOIN playerbots_random_bots teleport_event "
        "  ON teleport_event.owner = add_event.owner AND teleport_event.bot = add_event.bot "
        "  AND teleport_event.event = 'teleport' "
        "WHERE add_event.owner = %u AND add_event.event = 'add' AND c.account IN (%s) "
        "  AND randomized_event.bot IS NULL "
        "  AND strategy_event.bot IS NULL "
        "  AND teleport_event.bot IS NULL",
        RANDOM_BOT_OWNER, accounts.str().c_str());

    if (!result)
    {
        SetEventValue(MANAGER_BOT, "autonomy_repair_v1", 1, 0);
        LOG_DEBUG("playerbots", "Random bot autonomy repair: no add-only bots required backfill");
        return;
    }

    std::vector<uint32> brokenBots;
    do
    {
        brokenBots.push_back(result->Fetch()[0].GetUInt32());
    } while (result->NextRow());

    if (brokenBots.empty())
    {
        SetEventValue(MANAGER_BOT, "autonomy_repair_v1", 1, 0);
        LOG_DEBUG("playerbots", "Random bot autonomy repair: no add-only bots required backfill");
        return;
    }

    std::ostringstream bots;
    for (size_t i = 0; i < brokenBots.size(); ++i)
    {
        if (i)
            bots << ',';
        bots << brokenBots[i];
    }

    CharacterDatabase.PExecute(
        "DELETE FROM playerbots_random_bots "
        "WHERE owner = %u AND bot IN (%s) AND event IN "
        "('randomized', 'strategy', 'teleport', 'randomize', 'logout', 'revive', 'strategy_mode')",
        RANDOM_BOT_OWNER, bots.str().c_str());

    for (uint32 botGuid : brokenBots)
    {
        auto cacheItr = eventCache.find(botGuid);
        if (cacheItr != eventCache.end())
        {
            cacheItr->second.events.erase("randomized");
            cacheItr->second.events.erase("strategy");
            cacheItr->second.events.erase("teleport");
            cacheItr->second.events.erase("randomize");
            cacheItr->second.events.erase("logout");
            cacheItr->second.events.erase("revive");
            cacheItr->second.events.erase("strategy_mode");
        }
    }

    LOG_DEBUG("playerbots", "Random bot autonomy repair backfill prepared %zu add-only bots for reinitialization",
        brokenBots.size());
    SetEventValue(MANAGER_BOT, "autonomy_repair_v1", 1, 0);
}

bool RandomPlayerbotMgr::HasCharacterRow(uint32 bot) const
{
    return CharacterDatabase.PQuery("SELECT 1 FROM characters WHERE guid = %u LIMIT 1", bot) != nullptr;
}

void RandomPlayerbotMgr::ClearMissingBotEventState(uint32 bot, char const* context)
{
    CharacterDatabase.PExecute(
        "DELETE FROM playerbots_random_bots WHERE owner = %u AND bot = %u",
        RANDOM_BOT_OWNER, bot);

    BotEventCache& cache = eventCache[bot];
    cache.loaded = true;
    cache.events.clear();

    LOG_DEBUG("playerbots", "Random bot event state removed for missing character guid=%u context=%s",
        bot, context ? context : "unknown");
}

CachedEvent* RandomPlayerbotMgr::FindEvent(uint32 bot, std::string const& event)
{
    LoadEventCache(bot);
    auto& cache = eventCache[bot];
    auto itr = cache.events.find(event);
    if (itr == cache.events.end())
        return nullptr;

    if (itr->second.validIn && itr->second.lastChangeTime + itr->second.validIn <= NowSeconds())
    {
        cache.events.erase(itr);
        CharacterDatabase.PExecute(
            "DELETE FROM playerbots_random_bots WHERE owner = %u AND bot = %u AND event = '%s'",
            RANDOM_BOT_OWNER, bot, EscapeSql(event).c_str());
        return nullptr;
    }

    return &cache.events[event];
}

void RandomPlayerbotMgr::LoadEventCache(uint32 bot)
{
    BotEventCache& cache = eventCache[bot];
    if (cache.loaded)
        return;

    if (bot != 0 && !HasCharacterRow(bot))
    {
        ClearMissingBotEventState(bot, "load_event_cache");
        return;
    }

    cache.loaded = true;
    auto result = CharacterDatabase.PQuery(
        "SELECT event, value, time, IFNULL(validIn, 0), IFNULL(data, '') "
        "FROM playerbots_random_bots WHERE owner = %u AND bot = %u",
        RANDOM_BOT_OWNER, bot);

    if (!result)
        return;

    std::vector<std::string> expired;
    do
    {
        Field* fields = result->Fetch();
        CachedEvent event;
        std::string name = fields[0].GetCppString();
        event.value = fields[1].GetUInt32();
        event.lastChangeTime = fields[2].GetUInt32();
        event.validIn = fields[3].GetUInt32();
        event.data = fields[4].GetCppString();

        if (event.validIn && event.lastChangeTime + event.validIn <= NowSeconds())
            expired.push_back(name);
        else
            cache.events[name] = event;
    } while (result->NextRow());

    for (std::string const& name : expired)
    {
        CharacterDatabase.PExecute(
            "DELETE FROM playerbots_random_bots WHERE owner = %u AND bot = %u AND event = '%s'",
            RANDOM_BOT_OWNER, bot, EscapeSql(name).c_str());
    }
}

void RandomPlayerbotMgr::CleanupExpiredEvents(bool forceDbCleanup)
{
    time_t now = NowSeconds();
    if (!forceDbCleanup && lastEventCleanupTime && now - lastEventCleanupTime < 60)
        return;

    lastEventCleanupTime = now;
    CharacterDatabase.PExecute(
        "DELETE FROM playerbots_random_bots "
        "WHERE owner = %u AND validIn IS NOT NULL AND validIn > 0 AND (`time` + validIn) <= %u",
        RANDOM_BOT_OWNER, uint32(now));

    for (auto& cachePair : eventCache)
    {
        auto& events = cachePair.second.events;
        for (auto itr = events.begin(); itr != events.end();)
        {
            if (itr->second.validIn && itr->second.lastChangeTime + itr->second.validIn <= now)
                itr = events.erase(itr);
            else
                ++itr;
        }
    }
}

uint32 RandomPlayerbotMgr::GetEventValue(uint32 bot, std::string const& event)
{
    if (CachedEvent* e = FindEvent(bot, event))
        return e->value;

    return 0;
}

std::string RandomPlayerbotMgr::GetEventData(uint32 bot, std::string const& event)
{
    if (CachedEvent* e = FindEvent(bot, event))
        return e->data;

    return "";
}

uint32 RandomPlayerbotMgr::SetEventValue(uint32 bot, std::string const& event, uint32 value, uint32 validIn,
    std::string const& data)
{
    LoadEventCache(bot);

    std::string escapedEvent = EscapeSql(event);
    std::string escapedData = EscapeSql(data);

    CharacterDatabase.PExecute(
        "DELETE FROM playerbots_random_bots WHERE owner = %u AND bot = %u AND event = '%s'",
        RANDOM_BOT_OWNER, bot, escapedEvent.c_str());

    if (!value && !validIn && data.empty())
    {
        eventCache[bot].events.erase(event);
        return 0;
    }

    CachedEvent& e = eventCache[bot].events[event];
    e.value = value;
    e.validIn = validIn;
    e.lastChangeTime = NowSeconds();
    e.data = data;

    CharacterDatabase.PExecute(
        "INSERT INTO playerbots_random_bots (`owner`, `bot`, `time`, `validIn`, `event`, `value`, `data`) "
        "VALUES (%u, %u, %u, %u, '%s', %u, '%s')",
        RANDOM_BOT_OWNER, bot, e.lastChangeTime, validIn, escapedEvent.c_str(), value, escapedData.c_str());

    return e.value;
}

void RandomPlayerbotMgr::GetBots()
{
    currentBots.clear();

    for (auto const& itr : playerBots)
    {
        Player* bot = itr.second;
        if (!bot)
            continue;

        if (!IsRandomBot(bot))
            continue;

        currentBots.push_back(bot->GetGUIDLow());
    }
}

std::vector<uint32> RandomPlayerbotMgr::GetBgBots(uint32 bracket)
{
    std::vector<uint32> bots;
    for (uint32 botGuid : currentBots)
    {
        Player* bot = GetPlayerBot(botGuid);
        if (!bot)
            continue;

        if (bot->InBattleground() &&
            bot->GetBattleGroundBracketIdFromLevel(bot->GetBattleground()->GetTypeID()) == bracket)
            bots.push_back(botGuid);
    }

    return bots;
}

uint32 RandomPlayerbotMgr::AddRandomBots()
{
    uint32 desiredCount = GetMaxAllowedBotCount();
    uint32 currentCount = static_cast<uint32>(currentBots.size());
    if (currentCount >= desiredCount)
        return 0;

    uint32 limit = std::min<uint32>(desiredCount - currentCount, std::max<uint32>(1, sPlayerbotAIConfig.randomBotsPerInterval));
    std::vector<uint32> offlineBots;
    offlineBots.reserve(limit);

    while (!populationLoginQueue.empty() && offlineBots.size() < limit)
    {
        uint32 botGuid = populationLoginQueue.back();
        populationLoginQueue.pop_back();
        if (std::find(offlineBots.begin(), offlineBots.end(), botGuid) == offlineBots.end())
            offlineBots.push_back(botGuid);
    }

    if (offlineBots.size() < limit)
    {
        std::vector<uint32> fallbackBots = GetOfflineRandomBots(limit - offlineBots.size());
        offlineBots.insert(offlineBots.end(), fallbackBots.begin(), fallbackBots.end());
    }

    uint32 added = 0;

    for (uint32 botGuid : offlineBots)
    {
        SetEventValue(botGuid, "add", 1, 0);
        AddPlayerBot(ObjectGuid(HIGHGUID_PLAYER, botGuid), 0);
        ++added;
    }

    return added;
}

bool RandomPlayerbotMgr::ProcessBot(uint32 bot)
{
    return ProcessBot(GetPlayerBot(bot));
}

void RandomPlayerbotMgr::ScheduleRandomize(uint32 bot, uint32 time)
{
    uint32 delay = time ? time : urand(sPlayerbotAIConfig.minRandomBotRandomizeTime,
        std::max(sPlayerbotAIConfig.minRandomBotRandomizeTime, sPlayerbotAIConfig.maxRandomBotRandomizeTime));
    SetEventValue(bot, "randomize", 1, delay);
}

void RandomPlayerbotMgr::ScheduleLogout(uint32 bot, uint32 time)
{
    uint32 delay = time ? time : urand(sPlayerbotAIConfig.minRandomBotInWorldTime,
        std::max(sPlayerbotAIConfig.minRandomBotInWorldTime, sPlayerbotAIConfig.maxRandomBotInWorldTime));
    if (urand(0, 99) < 10)
        delay = sPlayerbotAIConfig.permanentlyInWorldTime;

    SetEventValue(bot, "logout", 1, delay);
}

uint32 RandomPlayerbotMgr::GetRandomBotCountTarget()
{
    uint32 minBots = sPlayerbotAIConfig.minRandomBots;
    uint32 maxBots = std::max(minBots, sPlayerbotAIConfig.maxRandomBots);
    time_t now = NowSeconds();

    if (sPlayerbotAIConfig.disabledWithoutRealPlayer && RealPlayerLastTimeSeen &&
        now > RealPlayerLastTimeSeen + sPlayerbotAIConfig.disabledWithoutRealPlayerLogoutDelay)
    {
        SetEventValue(MANAGER_BOT, "bot_count", 0, 0);
        return 0;
    }

    if (!RealPlayerLastTimeSeen && sPlayerbotAIConfig.disabledWithoutRealPlayer)
        return 0;

    uint32 target = GetEventValue(MANAGER_BOT, "bot_count");
    if (!target)
        target = minBots;

    if (sPlayerbotAIConfig.enablePeriodicOnlineOffline && !GetEventValue(MANAGER_BOT, "bot_count_refresh"))
    {
        target = urand(minBots, maxBots);
        SetEventValue(MANAGER_BOT, "bot_count", target, 0);
        SetEventValue(MANAGER_BOT, "bot_count_refresh", 1,
            urand(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                std::max(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                    sPlayerbotAIConfig.randomBotCountChangeMaxInterval)));
    }

    if (target < minBots)
        target = minBots;
    if (target > maxBots)
        target = maxBots;

    SetEventValue(MANAGER_BOT, "bot_count", target, 0);

    return target + GetTotalReserveTarget();
}

std::vector<RandomPlayerbotMgr::OfflineBotCandidate> RandomPlayerbotMgr::GetOfflineRandomBotCandidates(uint32 limit)
{
    std::vector<OfflineBotCandidate> result;
    if (rndBotTypeAccounts.empty())
        return result;

    std::ostringstream accounts;
    for (size_t i = 0; i < rndBotTypeAccounts.size(); ++i)
    {
        if (i)
            accounts << ',';
        accounts << rndBotTypeAccounts[i];
    }

    auto query = CharacterDatabase.PQuery(
        "SELECT guid, level FROM characters WHERE account IN (%s) ORDER BY rand()",
        accounts.str().c_str());

    if (!query)
        return result;

    std::unordered_set<uint32> online(currentBots.begin(), currentBots.end());
    do
    {
        Field* fields = query->Fetch();
        uint32 guidLow = fields[0].GetUInt32();
        uint32 level = ClampToLevelBracket(fields[1].GetUInt32());
        ObjectGuid guid(HIGHGUID_PLAYER, guidLow);

        if (online.contains(guidLow) || IsBotLoading(guid) || ObjectAccessor::FindPlayer(guid) || GetPlayerBot(guid))
            continue;

        if (GetEventValue(guidLow, "login_cooldown"))
            continue;

        result.push_back({guidLow, level});
        if (limit && result.size() >= limit)
            break;
    } while (query->NextRow());

    return result;
}

std::vector<uint32> RandomPlayerbotMgr::GetOfflineRandomBots(uint32 limit, LevelBracket const* preferredBracket)
{
    std::vector<uint32> result;
    if (!limit)
        return result;

    std::vector<uint32> fallback;
    for (OfflineBotCandidate const& candidate : GetOfflineRandomBotCandidates())
    {
        if (preferredBracket && !IsLevelInBracket(candidate.level, *preferredBracket))
        {
            fallback.push_back(candidate.guid);
            continue;
        }

        result.push_back(candidate.guid);
        if (result.size() >= limit)
            break;
    }

    if (result.size() < limit)
    {
        for (uint32 guidLow : fallback)
        {
            result.push_back(guidLow);
            if (result.size() >= limit)
                break;
        }
    }

    if (result.size() > limit)
        result.resize(limit);

    return result;
}

bool RandomPlayerbotMgr::IsEventDue(uint32 bot, std::string const& event)
{
    return GetEventValue(bot, event) == 0;
}

void RandomPlayerbotMgr::RandomTeleport(Player* bot)
{
    if (!bot)
        return;

    BotPopulationRole role = GetPopulationRole(bot->GetGUIDLow());
    uint32 zoneId = GetPopulationZone(bot->GetGUIDLow());
    if (sPlayerbotAIConfig.debugRandomBotPopulation)
        LOG_DEBUG("playerbots", "Random bot teleport routing: %s (%u) role=%s zone=%u strategy=%s level=%u",
            bot->GetName(), bot->GetGUIDLow(), GetPopulationRoleName(role), zoneId,
            GetData(bot->GetGUIDLow(), "strategy_mode").c_str(), bot->GetLevel());

    if ((role == BotPopulationRole::reserve_city || role == BotPopulationRole::reserve_starter) && zoneId)
    {
        if (sPlayerbotAIConfig.enablePopulationDirector)
        {
            PopulationSnapshot const& snapshot = GetPopulationSnapshot();
            for (PopulationBucket const& bucket : snapshot.buckets)
            {
                if (bucket.zoneId == zoneId && RandomTeleportToBucket(bot, bucket))
                    return;
            }
        }
        else
        {
            PopulationBucket bucket;
            if (BuildPopulationBucketForZone(zoneId, bucket) && RandomTeleportToBucket(bot, bucket))
                return;
        }
    }

    if (sPlayerbotAIConfig.enablePopulationDirector)
    {
        PopulationSnapshot const& snapshot = GetPopulationSnapshot();
        for (PopulationBucket const& bucket : snapshot.buckets)
        {
            if (bucket.zoneId == zoneId && RandomTeleportToBucket(bot, bucket))
                return;
        }
    }

    TeleportCityId capitalCity;
    if (GetCapitalAnchorCity(bot, capitalCity) && TeleportBotToCapitalAnchor(bot, capitalCity, true))
        return;

    std::string strategyMode = GetData(bot->GetGUIDLow(), "strategy_mode");
    if (strategyMode == "new rpg" || strategyMode == "rpg")
        RandomTeleportForRpg(bot);
    else if (strategyMode == "grind")
        RandomTeleportForLevel(bot);
    else if (sPlayerbotAIConfig.enableNewRpgStrategy &&
             urand(0, 99) < uint32(sPlayerbotAIConfig.randomBotRpgChance * 100.0f))
        RandomTeleportForRpg(bot);
    else
        RandomTeleportForLevel(bot);
}

void RandomPlayerbotMgr::RandomTeleport(Player* bot, std::vector<WorldLocation>& locs, bool hearth)
{
    if (!bot || locs.empty() || bot->IsBeingTeleported() || !bot->IsInWorld())
    {
        if (bot)
            ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    if (bot->IsRooted() || bot->InBattlegroundQueue() || bot->InBattleground())
    {
        ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    if (bot->GetGroup() && !bot->GetGroup()->IsLeader(bot->GetGUID()))
    {
        ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (!botAI)
    {
        ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    if (bot->HasUnitMovementFlag(MOVEFLAG_ONTRANSPORT) && bot->HasUnitState(UNIT_STATE_IGNORE_PATHFINDING) &&
        botAI->HasPlayerNearby())
    {
        ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    std::vector<WorldLocation> candidates;
    candidates.reserve(locs.size());
    for (WorldLocation const& loc : locs)
    {
        if (HasAllowedMap(loc.mapId))
            candidates.push_back(loc);
    }

    if (candidates.empty())
    {
        ScheduleTeleport(bot->GetGUIDLow(), 60);
        return;
    }

    std::shuffle(candidates.begin(), candidates.end(), std::mt19937(std::random_device{}()));
    for (WorldLocation loc : candidates)
    {
        if (!MapManager::IsValidMapCoord(loc))
            continue;

        Map* map = sMapMgr.FindMap(loc.mapId, 0);
        if (!map)
            continue;

        AreaTableEntry const* zone =
            sAreaTableStore.LookupEntry(sTerrainMgr.GetZoneId(loc.mapId, loc.x, loc.y, loc.z));
        AreaTableEntry const* area =
            sAreaTableStore.LookupEntry(sTerrainMgr.GetAreaId(loc.mapId, loc.x, loc.y, loc.z));
        if (!zone || !area || !IsSafeTeleportZoneForBot(bot, zone))
            continue;

        if (map->IsInWater(PHASEMASK_NORMAL, loc.x, loc.y, loc.z, bot->GetCollisionHeight()))
            continue;

        float ground = map->GetHeight(loc.x, loc.y, loc.z + 0.5f, true, 50.0f);
        if (ground <= INVALID_HEIGHT)
            continue;

        loc.z = ground + 0.05f;

        if (!botAI->CheckLocationDistanceByLevel(bot, loc, true))
            continue;

        if (IsTeleportTargetVisibleToPlayers(loc, PLAYER_VISIBILITY_GUARD_RANGE))
            continue;

        if (hearth)
            bot->SetHomebindToLocation(loc, zone->ID);

        botAI->Reset();
        bot->CombatStop(true);
        bot->GetMotionMaster()->Clear();
        bot->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_TELEPORTED | AURA_INTERRUPT_FLAG_CHANGE_MAP);
        bot->TeleportTo(loc.mapId, loc.x, loc.y, loc.z, loc.o);
        bot->SendMovementPacket(MSG_MOVE_HEARTBEAT, true);

        uint32 nextDelay = 0;
        TeleportCityId city;
        if (GetCapitalAnchorCity(bot, city))
        {
            uint32 dwellMin = std::max<uint32>(1, sPlayerbotAIConfig.capitalCityDwellMin);
            uint32 dwellMax = std::max(dwellMin, sPlayerbotAIConfig.capitalCityDwellMax);
            nextDelay = urand(dwellMin, dwellMax);
        }

        ScheduleTeleport(bot->GetGUIDLow(), nextDelay);
        return;
    }

    ScheduleTeleport(bot->GetGUIDLow(), 60);
}

uint32 RandomPlayerbotMgr::GetZoneLevel(uint16 mapId, float teleX, float teleY, float teleZ)
{
    uint32 zoneId = sTerrainMgr.GetZoneId(mapId, teleX, teleY, teleZ);
    auto itr = zone2LevelBracket.find(zoneId);
    if (itr != zone2LevelBracket.end())
        return (itr->second.low + itr->second.high) / 2;

    if (AreaTableEntry const* area = sAreaTableStore.LookupEntry(zoneId))
    {
        if (area->zone)
        {
            itr = zone2LevelBracket.find(area->zone);
            if (itr != zone2LevelBracket.end())
                return (itr->second.low + itr->second.high) / 2;
        }
    }

    return 0;
}

char const* RandomPlayerbotMgr::GetPopulationRoleName(BotPopulationRole role)
{
    switch (role)
    {
        case BotPopulationRole::reserve_city:
            return "reserve_city";
        case BotPopulationRole::reserve_starter:
            return "reserve_starter";
        case BotPopulationRole::shadow:
            return "shadow";
        case BotPopulationRole::halo:
            return "halo";
        case BotPopulationRole::roam:
        default:
            return "roam";
    }
}

float RandomPlayerbotMgr::GetBankerTeleportChance(Player* bot) const
{
    if (!bot)
        return sPlayerbotAIConfig.probTeleToBankers;

    switch (GetPopulationRole(bot->GetGUIDLow()))
    {
        case BotPopulationRole::reserve_city:
            return sPlayerbotAIConfig.probTeleToBankersCity;
        case BotPopulationRole::reserve_starter:
            return sPlayerbotAIConfig.probTeleToBankersReserveStarter;
        default:
            return sPlayerbotAIConfig.probTeleToBankersWorld;
    }
}

RandomPlayerbotMgr::BotPopulationRole RandomPlayerbotMgr::GetPopulationRole(uint32 bot) const
{
    return ParsePopulationRole(const_cast<RandomPlayerbotMgr*>(this)->GetValue(bot, "population_role"),
        const_cast<RandomPlayerbotMgr*>(this)->GetData(bot, "population_role"));
}

uint32 RandomPlayerbotMgr::GetPopulationZone(uint32 bot) const
{
    return const_cast<RandomPlayerbotMgr*>(this)->GetValue(bot, "population_zone");
}

bool RandomPlayerbotMgr::GetPopulationLevelBand(uint32 bot, LevelBracket& bracket) const
{
    std::string data = const_cast<RandomPlayerbotMgr*>(this)->GetData(bot, "target_level_band");
    LevelBracket parsed = ParseLevelBand(data, bracket);
    if (!parsed.low || !parsed.high)
        return false;

    bracket = parsed;
    return true;
}

uint32 RandomPlayerbotMgr::GetPopulationDwellUntil(uint32 bot) const
{
    return const_cast<RandomPlayerbotMgr*>(this)->GetValue(bot, "dwell_until");
}

bool RandomPlayerbotMgr::IsLocationInPopulationPlan(Player* bot, WorldLocation const& loc) const
{
    if (!bot)
        return false;

    LevelBracket bracket{0, 0};
    bool hasBracket = GetPopulationLevelBand(bot->GetGUIDLow(), bracket);
    uint32 assignedZoneId = GetPopulationZone(bot->GetGUIDLow());
    if (hasBracket)
        bracket = NormalizeReserveLevelBracket(assignedZoneId, bracket);

    if (!assignedZoneId && !hasBracket)
        return true;

    uint32 level = ClampToLevelBracket(bot->GetLevel());
    if (hasBracket && (level < bracket.low || level > bracket.high))
        return false;

    if (!assignedZoneId)
        return true;

    return GetPopulationZoneForLocation(loc) == assignedZoneId;
}

bool RandomPlayerbotMgr::IsTravelDestinationInPopulationPlan(Player* bot, TravelDestination const* destination) const
{
    if (!bot || !destination)
        return false;

    if (Quest const* quest = const_cast<TravelDestination*>(destination)->GetQuestTemplate())
    {
        LevelBracket bracket{0, 0};
        if (GetPopulationLevelBand(bot->GetGUIDLow(), bracket))
        {
            bracket = NormalizeReserveLevelBracket(GetPopulationZone(bot->GetGUIDLow()), bracket);
            uint32 planLevel = GetQuestPlanLevel(bot, quest);
            if (planLevel < bracket.low || planLevel > bracket.high)
                return false;
        }

    }

    std::vector<WorldPosition*> const& points = destination->getPointsRef();
    if (points.empty())
        return true;

    for (WorldPosition const* point : points)
    {
        if (!point)
            continue;

        if (IsLocationInPopulationPlan(bot, WorldLocation(*point)))
            return true;
    }

    return false;
}

bool RandomPlayerbotMgr::IsQuestInPopulationPlan(Player* bot, Quest const* quest) const
{
    if (!bot || !quest)
        return false;

    if (GetPopulationRole(bot->GetGUIDLow()) == BotPopulationRole::reserve_starter)
        return false;

    LevelBracket bracket{0, 0};
    bool hasBracket = GetPopulationLevelBand(bot->GetGUIDLow(), bracket);
    uint32 assignedZoneId = GetPopulationZone(bot->GetGUIDLow());
    if (hasBracket)
    {
        bracket = NormalizeReserveLevelBracket(assignedZoneId, bracket);
        uint32 planLevel = GetQuestPlanLevel(bot, quest);
        if (planLevel < bracket.low || planLevel > bracket.high)
            return false;
    }

    if (!assignedZoneId)
        return true;

    auto questItr = TravelMgr::instance().quests.find(quest->GetQuestId());
    if (questItr != TravelMgr::instance().quests.end() && questItr->second)
    {
        auto matches = [this, bot](std::vector<QuestTravelDestination*> const& destinations)
        {
            for (QuestTravelDestination* destination : destinations)
            {
                if (!destination || !destination->isActive(bot))
                    continue;

                if (IsTravelDestinationInPopulationPlan(bot, destination))
                    return true;
            }

            return false;
        };

        return matches(questItr->second->questGivers) || matches(questItr->second->questTakers) ||
            matches(questItr->second->questObjectives);
    }

    int32 zoneOrSort = quest->GetZoneOrSort();
    return zoneOrSort > 0 && NormalizePopulationZoneId(static_cast<uint32>(zoneOrSort)) == assignedZoneId;
}

void RandomPlayerbotMgr::SetPopulationAssignment(uint32 bot, BotPopulationRole role, uint32 zoneId,
    LevelBracket const& bracket, uint32 dwellUntil, uint32 moveTime)
{
    SetValue(bot, "population_role", uint32(role), GetPopulationRoleName(role));
    SetValue(bot, "population_zone", zoneId, "");
    SetValue(bot, "last_population_move", moveTime, "");
    SetValue(bot, "dwell_until", dwellUntil, "");
    SetValue(bot, "target_level_band", 1, FormatLevelBand(bracket));
}

bool RandomPlayerbotMgr::IsBotNearRealPlayer(Player* bot, float range) const
{
    if (!bot)
        return false;

    for (Player* player : players)
    {
        if (!player || !player->IsInWorld() || player->GetMapId() != bot->GetMapId())
            continue;

        if (bot->IsWithinDistInMap(player, range))
            return true;
    }

    return false;
}

bool RandomPlayerbotMgr::IsProtectedByPopulationDirector(Player* bot)
{
    if (!bot)
        return false;

    uint32 zoneId = sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ());
    auto reserveItr = sPlayerbotAIConfig.reserveZones.find(zoneId);
    if (reserveItr == sPlayerbotAIConfig.reserveZones.end() || !reserveItr->second)
        return false;

    if (GetPopulationRole(bot->GetGUIDLow()) != BotPopulationRole::reserve_city &&
        GetPopulationRole(bot->GetGUIDLow()) != BotPopulationRole::reserve_starter)
    {
        return false;
    }

    uint32 count = 0;
    std::vector<Player*> misplacedBots;
    for (uint32 botGuid : currentBots)
    {
        Player* other = GetPlayerBot(botGuid);
        if (!other || !other->IsInWorld())
            continue;

        uint32 otherZone = sTerrainMgr.GetZoneId(other->GetMapId(), other->GetPositionX(), other->GetPositionY(), other->GetPositionZ());
        if (otherZone != zoneId)
            continue;

        BotPopulationRole role = GetPopulationRole(botGuid);
        if (role == BotPopulationRole::reserve_city || role == BotPopulationRole::reserve_starter)
            ++count;
    }

    return count <= reserveItr->second;
}

bool RandomPlayerbotMgr::CanPopulationRelocateBot(Player* bot, bool requireUnseen) const
{
    if (!bot || !bot->IsInWorld() || bot->IsBeingTeleported() || bot->IsInCombat() || bot->isDead() ||
        bot->InBattleground() || bot->InBattlegroundQueue())
    {
        return false;
    }

    // Addclass bots belong to players and should never be managed by the director.
    if (const_cast<RandomPlayerbotMgr*>(this)->IsAddclassBot(bot))
        return false;

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (!botAI || botAI->HasActivePlayerMaster())
        return false;

    Group* group = bot->GetGroup();
    if (group)
    {
        for (GroupReference* ref = group->GetFirstMember(); ref; ref = ref->next())
        {
            Player* member = ref->getSource();
            if (member && !member->IsBot())
                return false;
        }
    }

    if (requireUnseen && IsBotNearRealPlayer(bot))
        return false;

    return true;
}

bool RandomPlayerbotMgr::SelectBestPopulationBucketForLevel(uint32 level, PopulationBucket& bucket, uint32 preferredZone)
{
    if (!sPlayerbotAIConfig.enablePopulationDirector)
        return false;

    time_t now = NowSeconds();
    if (populationSnapshot.buckets.empty() || !populationSnapshot.timestamp || now > populationSnapshot.timestamp + 300)
        UpdatePopulationDirector(true);

    PopulationBucket const* best = nullptr;
    int32 bestDemand = std::numeric_limits<int32>::min();
    for (PopulationBucket const& candidate : populationSnapshot.buckets)
    {
        if (level < candidate.bracket.low || level > candidate.bracket.high)
            continue;

        int32 demand = static_cast<int32>(candidate.desiredTotal) - static_cast<int32>(candidate.currentBotCount);
        if (!best || demand > bestDemand ||
            (demand == bestDemand && preferredZone && candidate.zoneId == preferredZone && best->zoneId != preferredZone) ||
            (demand == bestDemand && candidate.score > best->score))
        {
            best = &candidate;
            bestDemand = demand;
        }
    }

    if (!best)
        return false;

    bucket = *best;
    return true;
}

bool RandomPlayerbotMgr::RehomeBotToPopulationPlan(Player* bot, char const* context, bool requireRelocate)
{
    if (!bot || !sPlayerbotAIConfig.enablePopulationDirector)
        return false;

    uint32 level = ClampToLevelBracket(bot->GetLevel());
    WorldLocation currentLoc(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ(), bot->GetOrientation());
    uint32 actualZoneId = GetPopulationZoneForLocation(currentLoc);

    PopulationBucket actualBucket;
    bool hasActualBucket = false;
    if (PopulationBucket const* snapshotBucket = FindPopulationBucketInSnapshot(populationSnapshot, actualZoneId))
    {
        actualBucket = *snapshotBucket;
        hasActualBucket = true;
    }
    else
    {
        hasActualBucket = BuildPopulationBucketForZone(actualZoneId, actualBucket);
    }
    bool actualZoneFits = hasActualBucket && level >= actualBucket.bracket.low && level <= actualBucket.bracket.high;

    PopulationBucket targetBucket;
    if (actualZoneFits)
        targetBucket = actualBucket;
    else if (!SelectBestPopulationBucketForLevel(level, targetBucket, GetPopulationZone(bot->GetGUIDLow())))
        return false;

    if (!targetBucket.zoneId)
        return false;

    uint32 guidLow = bot->GetGUIDLow();
    LevelBracket assignedBracket{0, 0};
    bool hasAssignedBracket = GetPopulationLevelBand(guidLow, assignedBracket);
    uint32 assignedZoneId = GetPopulationZone(guidLow);
    if (hasAssignedBracket)
        assignedBracket = NormalizeReserveLevelBracket(assignedZoneId, assignedBracket);

    if (assignedZoneId == targetBucket.zoneId && (!hasAssignedBracket ||
        (assignedBracket.low == targetBucket.bracket.low && assignedBracket.high == targetBucket.bracket.high)))
    {
        SetEventValue(guidLow, "population_gc_v2", 1, 0);
        return false;
    }

    if (requireRelocate && !CanPopulationRelocateBot(bot, true))
        return false;

    BotPopulationRole role = targetBucket.currentBotCount < targetBucket.desiredReserve ?
        targetBucket.reserveRole : targetBucket.dynamicRole;
    time_t now = NowSeconds();
    uint32 dwellUntil = now + urand(sPlayerbotAIConfig.populationDirectorMinDwell,
        std::max(sPlayerbotAIConfig.populationDirectorMinDwell, sPlayerbotAIConfig.populationDirectorMaxDwell));
    SetPopulationAssignment(guidLow, role, targetBucket.zoneId, targetBucket.bracket, dwellUntil, now);
    SetEventValue(guidLow, "population_gc_v2", 1, 0);

    if (requireRelocate)
        RandomTeleportToBucket(bot, targetBucket, true);

    LOG_DEBUG("playerbots", "Random bot population rehome: %s (%u) level=%u zone=%u->%u bracket=[%u,%u] context=%s",
        bot->GetName(), guidLow, level, assignedZoneId, targetBucket.zoneId, targetBucket.bracket.low,
        targetBucket.bracket.high, context ? context : "unknown");
    return true;
}

uint32 RandomPlayerbotMgr::SampleLevelForBucket(PopulationBucket const& bucket) const
{
    uint32 low = ClampToLevelBracket(bucket.bracket.low);
    uint32 high = ClampToLevelBracket(std::max(bucket.bracket.low, bucket.bracket.high));
    if (high < low)
        high = low;

    // City reserve bots should be max level to look like real players in capitals.
    if (bucket.reserveRole == BotPopulationRole::reserve_city)
    {
        // Slight variety: most at max, a few 1-2 levels below.
        if (high > low + 2 && frand(0.0f, 1.0f) <= 0.15f)
            return urand(std::max(low, high - 2), high);
        return high;
    }

    // For world zones, distribute bots across the bracket to simulate players
    // questing through the zone at various stages of progression.
    // Nearby real players shift the center of the distribution slightly.
    float center = (float(low) + float(high)) / 2.0f;
    float totalWeight = 0.0f;
    float weightedLevelSum = 0.0f;

    for (Player* player : players)
    {
        if (!player || !player->IsInWorld() || player->IsBot())
            continue;

        float weight = 1.0f;
        if (sPlayerbotAIConfig.enablePopulationDirector && player->GetMapId() == bucket.centroid.mapId)
        {
            float dx = player->GetPositionX() - bucket.centroid.x;
            float dy = player->GetPositionY() - bucket.centroid.y;
            float dz = player->GetPositionZ() - bucket.centroid.z;
            float sigma = std::max(1.0f, sPlayerbotAIConfig.populationDirectorPlayerHeatSigma);
            weight = std::exp(-(dx * dx + dy * dy + dz * dz) / (2.0f * sigma * sigma));
        }

        if (weight <= 0.001f)
            continue;

        // Clamp player level into the bracket range for influence calculation.
        float clampedLevel = std::clamp(float(player->GetLevel()), float(low), float(high));
        weightedLevelSum += weight * clampedLevel;
        totalWeight += weight;
    }

    // Blend bracket midpoint with player-influenced center (40% player influence).
    if (totalWeight > 0.0f)
    {
        float playerCenter = weightedLevelSum / totalWeight;
        center = center * 0.6f + playerCenter * 0.4f;
    }

    // Sample from a triangular distribution centered on 'center' within [low, high].
    // This creates a natural bell-like spread across the zone's level range.
    float u = frand(0.0f, 1.0f);
    float fLow = float(low);
    float fHigh = float(high);
    float range = fHigh - fLow;
    float sampled;
    if (range < 1.0f)
    {
        sampled = fLow;
    }
    else
    {
        float mode = std::clamp(center, fLow, fHigh);
        float fc = (mode - fLow) / range;
        if (u < fc)
            sampled = fLow + std::sqrt(u * range * (mode - fLow));
        else
            sampled = fHigh - std::sqrt((1.0f - u) * range * (fHigh - mode));
    }

    uint32 result = std::max(low, std::min(high, uint32(std::round(sampled))));

    // syncLevelWithPlayers: only cap if the highest player level falls within or
    // above this bracket. Don't penalise high-level zones when only low-level
    // players are online.
    if (sPlayerbotAIConfig.syncLevelWithPlayers && !players.empty())
    {
        uint32 highestOnline = 1;
        for (Player* player : players)
            highestOnline = std::max<uint32>(highestOnline, player ? player->GetLevel() : 1);

        if (highestOnline >= low)
            result = std::min(result, highestOnline);
    }

    return std::max(low, std::min(high, result));
}

bool RandomPlayerbotMgr::RandomTeleportToBucket(Player* bot, PopulationBucket const& bucket, bool hearth)
{
    if (bucket.points.empty())
        return false;

    std::vector<WorldLocation> points = bucket.points;
    RandomTeleport(bot, points, hearth);
    return true;
}

void RandomPlayerbotMgr::UpdatePopulationDirector(bool force)
{
    if (!sPlayerbotAIConfig.enablePopulationDirector)
        return;

    time_t now = NowSeconds();
    if (!EnsureTravelCachesReady())
    {
        populationSnapshot = PopulationSnapshot();
        populationSnapshot.timestamp = now;
        populationSnapshot.currentOnlineBots = static_cast<uint32>(currentBots.size());
        populationSnapshot.targetOnlineBots = GetRandomBotCountTarget();
        return;
    }

    uint32 interval = std::max<uint32>(1, sPlayerbotAIConfig.populationDirectorUpdateInterval);
    if (!force && populationDirectorNextUpdate && now < populationDirectorNextUpdate)
        return;

    populationDirectorNextUpdate = now + interval;
    populationLoginQueue.clear();
    populationSnapshot = PopulationSnapshot();
    populationSnapshot.timestamp = now;
    populationSnapshot.currentOnlineBots = static_cast<uint32>(currentBots.size());
    populationSnapshot.targetOnlineBots = GetRandomBotCountTarget();

    std::unordered_map<uint32, PopulationBucket> bucketsByZone;
    std::vector<Player*> misplacedBots;
    auto appendPoint = [this, &bucketsByZone](uint32 zoneId, WorldLocation const& loc)
    {
        if (!zoneId || !HasAllowedMap(loc.mapId))
            return;

        auto bracketItr = zone2LevelBracket.find(zoneId);
        if (bracketItr == zone2LevelBracket.end())
            return;

        PopulationBucket& bucket = bucketsByZone[zoneId];
        if (!bucket.zoneId)
        {
            bucket.zoneId = zoneId;
            bucket.mapId = loc.mapId;
            bucket.bracket = bracketItr->second;
            bucket.centroid = loc;
            auto reserveItr = sPlayerbotAIConfig.reserveZones.find(zoneId);
            bucket.reserveFloor = reserveItr != sPlayerbotAIConfig.reserveZones.end() ? reserveItr->second : 0;
            if (bucket.reserveFloor)
                bucket.bracket = NormalizeReserveLevelBracket(zoneId, bucket.bracket);
            bucket.reserveRole = bucket.bracket.high <= 12 ? BotPopulationRole::reserve_starter : BotPopulationRole::reserve_city;
        }

        bucket.points.push_back(loc);
        bucket.pointCount = static_cast<uint32>(bucket.points.size());
        float count = float(bucket.pointCount);
        bucket.centroid.x = ((bucket.centroid.x * (count - 1.0f)) + loc.x) / count;
        bucket.centroid.y = ((bucket.centroid.y * (count - 1.0f)) + loc.y) / count;
        bucket.centroid.z = ((bucket.centroid.z * (count - 1.0f)) + loc.z) / count;
        bucket.centroid.o = loc.o;
        bucket.centroid.mapId = loc.mapId;
    };

    for (auto const& locPair : TravelMgr::instance().exploreLocs)
    {
        ExploreTravelDestination* destination = locPair.second;
        if (!destination)
            continue;

        uint32 areaId = locPair.first;
        AreaTableEntry const* area = sAreaTableStore.LookupEntry(areaId);
        uint32 zoneId = area && area->zone ? area->zone : areaId;
        std::vector<WorldPosition*> const& points = destination->getPointsRef();
        for (WorldPosition* point : points)
            appendPoint(zoneId, WorldLocation(*point));
    }

    for (RpgTravelDestination* destination : TravelMgr::instance().rpgNpcs)
    {
        if (!destination)
            continue;

        std::vector<WorldPosition*> const& points = destination->getPointsRef();
        for (WorldPosition* point : points)
        {
            uint32 zoneId = sTerrainMgr.GetZoneId(point->getMapId(), point->getX(), point->getY(), point->getZ());
            appendPoint(zoneId, WorldLocation(*point));
        }
    }

    for (auto const& cityBucket : bankerLocsPerCityCache)
    {
        uint32 zoneId = GetCityZoneId(cityBucket.first);
        for (BankerLocation const& loc : cityBucket.second)
            appendPoint(zoneId, loc.loc);
    }

    for (auto& bucketEntry : bucketsByZone)
    {
        PopulationBucket& bucket = bucketEntry.second;
        float weightedLevelSum = 0.0f;
        float totalHeat = 0.0f;
        float sigma = std::max(1.0f, sPlayerbotAIConfig.populationDirectorPlayerHeatSigma);
        for (Player* player : players)
        {
            if (!player || !player->IsInWorld() || player->IsBot() || player->GetMapId() != bucket.mapId)
                continue;

            float dx = player->GetPositionX() - bucket.centroid.x;
            float dy = player->GetPositionY() - bucket.centroid.y;
            float dz = player->GetPositionZ() - bucket.centroid.z;
            float heat = std::exp(-(dx * dx + dy * dy + dz * dz) / (2.0f * sigma * sigma));
            if (heat <= 0.0001f)
                continue;

            totalHeat += heat;
            weightedLevelSum += heat * player->GetLevel();
        }

        bucket.playerHeat = totalHeat;
        bucket.hasPlayerHeat = totalHeat > 0.01f;
        uint32 midpoint = (bucket.bracket.low + bucket.bracket.high) / 2;
        float weightedLevel = totalHeat > 0.0f ? (weightedLevelSum / totalHeat) : midpoint;
        float bracketSpan = std::max(1.0f, float(std::max<uint32>(1, bucket.bracket.high - bucket.bracket.low + 1)));
        bucket.levelMatch = std::max(0.0f, 1.0f - std::fabs(weightedLevel - midpoint) / bracketSpan);

        float decay = 0.0f;
        if (sPlayerbotAIConfig.populationDirectorPlayerHeatHalfLife > 0.0f)
        {
            decay = std::exp(-std::log(2.0f) * interval / sPlayerbotAIConfig.populationDirectorPlayerHeatHalfLife);
        }

        float recentPresence = populationRecentPresenceByZone[bucket.zoneId] * decay + bucket.playerHeat;
        populationRecentPresenceByZone[bucket.zoneId] = recentPresence;
        bucket.recentPresence = recentPresence;
    }

    for (uint32 botGuid : currentBots)
    {
        Player* bot = GetPlayerBot(botGuid);
        if (!bot || !bot->IsInWorld())
            continue;

        // Don't count player-mastered or addclass bots against zone budgets —
        // they're managed by players, not the director.
        if (IsAddclassBot(bot))
            continue;

        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI && botAI->HasActivePlayerMaster())
            continue;

        uint32 zoneId = NormalizePopulationZoneId(
            sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ()));
        auto bucketItr = bucketsByZone.find(zoneId);
        if (bucketItr != bucketsByZone.end())
        {
            uint32 level = ClampToLevelBracket(bot->GetLevel());
            if (level >= bucketItr->second.bracket.low && level <= bucketItr->second.bracket.high)
            {
                ++bucketItr->second.currentBotCount;
                if (!GetEventValue(botGuid, "population_gc_v2"))
                    SetEventValue(botGuid, "population_gc_v2", 1, 0);
            }
            else
            {
                ++bucketItr->second.misplacedBotCount;
                misplacedBots.push_back(bot);
            }
        }
    }

    populationSnapshot.buckets.reserve(bucketsByZone.size());
    for (auto const& bucketEntry : bucketsByZone)
        populationSnapshot.buckets.push_back(bucketEntry.second);

    float minHeat = std::numeric_limits<float>::max();
    float maxHeat = 0.0f;
    float minRecent = std::numeric_limits<float>::max();
    float maxRecent = 0.0f;
    float minLevel = std::numeric_limits<float>::max();
    float maxLevel = 0.0f;
    uint32 maxBotsInBucket = 0;

    for (PopulationBucket const& bucket : populationSnapshot.buckets)
    {
        minHeat = std::min(minHeat, bucket.playerHeat);
        maxHeat = std::max(maxHeat, bucket.playerHeat);
        minRecent = std::min(minRecent, bucket.recentPresence);
        maxRecent = std::max(maxRecent, bucket.recentPresence);
        minLevel = std::min(minLevel, bucket.levelMatch);
        maxLevel = std::max(maxLevel, bucket.levelMatch);
        maxBotsInBucket = std::max(maxBotsInBucket, bucket.currentBotCount);
    }

    populationSnapshot.reserveTarget = 0;
    for (PopulationBucket& bucket : populationSnapshot.buckets)
    {
        populationSnapshot.reserveTarget += bucket.reserveFloor;
        uint32 dynamicCap = uint32(std::min<float>(
            4.0f + 2.0f * std::sqrt(float(std::max<uint32>(1, bucket.pointCount))),
            std::max(0.0f, sPlayerbotAIConfig.populationDirectorZoneMaxDynamicPct * populationSnapshot.targetOnlineBots)));
        bucket.capacity = bucket.reserveFloor + dynamicCap;
    }

    populationSnapshot.dynamicTarget =
        populationSnapshot.targetOnlineBots > populationSnapshot.reserveTarget ?
        (populationSnapshot.targetOnlineBots - populationSnapshot.reserveTarget) : 0;

    float meanBucketBots = populationSnapshot.buckets.empty() ? 0.0f :
        float(populationSnapshot.currentOnlineBots) / float(populationSnapshot.buckets.size());

    std::vector<size_t> heatedBuckets;
    std::vector<size_t> haloBuckets;
    for (size_t i = 0; i < populationSnapshot.buckets.size(); ++i)
    {
        PopulationBucket& bucket = populationSnapshot.buckets[i];
        bucket.desiredReserve = bucket.reserveFloor;
        bucket.diversity = 1.0f - Normalize01(float(bucket.currentBotCount), 0.0f, std::max(1.0f, meanBucketBots * 2.0f));
        bucket.saturationPenalty = Normalize01(float(bucket.currentBotCount), 0.0f, std::max(1.0f, float(std::max<uint32>(1, bucket.capacity))));

        float playerHeatNorm = Normalize01(bucket.playerHeat, minHeat == std::numeric_limits<float>::max() ? 0.0f : minHeat, maxHeat);
        float levelMatchNorm = Normalize01(bucket.levelMatch, minLevel == std::numeric_limits<float>::max() ? 0.0f : minLevel, maxLevel);
        float recentNorm = Normalize01(bucket.recentPresence, minRecent == std::numeric_limits<float>::max() ? 0.0f : minRecent, maxRecent);
        float diversityNorm = bucket.diversity;
        float saturationNorm = bucket.saturationPenalty;

        bucket.score = (sPlayerbotAIConfig.populationDirectorWeightPlayerHeat * playerHeatNorm) +
            (sPlayerbotAIConfig.populationDirectorWeightLevelMatch * levelMatchNorm) +
            (sPlayerbotAIConfig.populationDirectorWeightRecentPresence * recentNorm) +
            (sPlayerbotAIConfig.populationDirectorWeightDiversity * diversityNorm) -
            (sPlayerbotAIConfig.populationDirectorWeightSaturationPenalty * saturationNorm);
        bucket.weight = SoftmaxTemperature(bucket.score, 0.8f);
        bucket.dynamicRole = bucket.hasPlayerHeat ? BotPopulationRole::shadow : BotPopulationRole::roam;
        if (bucket.hasPlayerHeat)
            heatedBuckets.push_back(i);
    }

    for (size_t i = 0; i < populationSnapshot.buckets.size(); ++i)
    {
        PopulationBucket& bucket = populationSnapshot.buckets[i];
        if (bucket.hasPlayerHeat)
            continue;

        for (size_t heatedIndex : heatedBuckets)
        {
            PopulationBucket const& heated = populationSnapshot.buckets[heatedIndex];
            if (bucket.mapId != heated.mapId)
                continue;

            float dx = bucket.centroid.x - heated.centroid.x;
            float dy = bucket.centroid.y - heated.centroid.y;
            float dz = bucket.centroid.z - heated.centroid.z;
            float haloRadius = std::max(1.0f, sPlayerbotAIConfig.populationDirectorHaloRadius);
            if ((dx * dx + dy * dy + dz * dz) <= (haloRadius * haloRadius))
            {
                bucket.haloCandidate = true;
                bucket.dynamicRole = BotPopulationRole::halo;
                haloBuckets.push_back(i);
                break;
            }
        }
    }

    auto allocatePool = [this](std::vector<size_t> const& indices, uint32 pool)
    {
        if (!pool || indices.empty())
            return;

        float totalWeight = 0.0f;
        for (size_t index : indices)
            totalWeight += populationSnapshot.buckets[index].weight;

        std::vector<std::pair<float, size_t>> remainders;
        uint32 allocated = 0;
        for (size_t index : indices)
        {
            PopulationBucket& bucket = populationSnapshot.buckets[index];
            float normalized = totalWeight > 0.0f ? (bucket.weight / totalWeight) : (1.0f / indices.size());
            float scaled = normalized * pool;
            uint32 amount = std::min<uint32>(bucket.capacity > bucket.reserveFloor ? bucket.capacity - bucket.reserveFloor : 0,
                uint32(std::floor(scaled)));
            bucket.desiredDynamic += amount;
            allocated += amount;
            remainders.push_back({scaled - amount, index});
        }

        std::sort(remainders.begin(), remainders.end(), [](auto const& lhs, auto const& rhs) {
            return lhs.first > rhs.first;
        });

        for (auto const& remainder : remainders)
        {
            if (allocated >= pool)
                break;

            PopulationBucket& bucket = populationSnapshot.buckets[remainder.second];
            if (bucket.desiredDynamic + bucket.reserveFloor >= bucket.capacity)
                continue;

            ++bucket.desiredDynamic;
            ++allocated;
        }
    };

    uint32 shadowPool = populationSnapshot.dynamicTarget * 70 / 100;
    uint32 haloPool = populationSnapshot.dynamicTarget > shadowPool ? (populationSnapshot.dynamicTarget - shadowPool) : 0;
    if (heatedBuckets.empty())
    {
        haloPool += shadowPool;
        shadowPool = 0;
    }
    if (haloBuckets.empty())
    {
        shadowPool += haloPool;
        haloPool = 0;
    }

    allocatePool(heatedBuckets, shadowPool);
    allocatePool(haloBuckets, haloPool);

    std::vector<size_t> roamBuckets;
    for (size_t i = 0; i < populationSnapshot.buckets.size(); ++i)
    {
        PopulationBucket& bucket = populationSnapshot.buckets[i];
        bucket.desiredTotal = std::min<uint32>(bucket.capacity, bucket.desiredReserve + bucket.desiredDynamic);
        if (bucket.dynamicRole == BotPopulationRole::roam)
            roamBuckets.push_back(i);
    }

    uint32 allocatedDynamic = 0;
    for (PopulationBucket const& bucket : populationSnapshot.buckets)
        allocatedDynamic += bucket.desiredDynamic;
    if (allocatedDynamic < populationSnapshot.dynamicTarget)
        allocatePool(roamBuckets, populationSnapshot.dynamicTarget - allocatedDynamic);

    for (PopulationBucket& bucket : populationSnapshot.buckets)
        bucket.desiredTotal = std::min<uint32>(bucket.capacity, bucket.desiredReserve + bucket.desiredDynamic);

    uint32 movesRemaining = std::max<uint32>(1, sPlayerbotAIConfig.populationDirectorMaxMovesPerTick);
    std::unordered_set<uint32> queuedOfflineBots;
    std::vector<OfflineBotCandidate> offlineCandidates = GetOfflineRandomBotCandidates();
    std::unordered_map<uint32, std::vector<uint32>> offlineCandidatesByLevel;
    std::vector<uint32> offlineFallbackQueue;
    offlineFallbackQueue.reserve(offlineCandidates.size());
    for (OfflineBotCandidate const& candidate : offlineCandidates)
    {
        offlineCandidatesByLevel[candidate.level].push_back(candidate.guid);
        offlineFallbackQueue.push_back(candidate.guid);
    }

    std::vector<PopulationBucket*> shortages;
    std::vector<PopulationBucket*> surpluses;
    for (PopulationBucket& bucket : populationSnapshot.buckets)
    {
        if (bucket.currentBotCount < bucket.desiredTotal)
            shortages.push_back(&bucket);
        else if (bucket.currentBotCount > bucket.desiredTotal)
            surpluses.push_back(&bucket);
    }

    std::sort(shortages.begin(), shortages.end(), [](PopulationBucket const* lhs, PopulationBucket const* rhs) {
        return (lhs->desiredTotal - lhs->currentBotCount) > (rhs->desiredTotal - rhs->currentBotCount);
    });
    std::sort(surpluses.begin(), surpluses.end(), [](PopulationBucket const* lhs, PopulationBucket const* rhs) {
        if (lhs->playerHeat != rhs->playerHeat)
            return lhs->playerHeat < rhs->playerHeat;
        return (lhs->currentBotCount - lhs->desiredTotal) > (rhs->currentBotCount - rhs->desiredTotal);
    });

    auto takeOfflineCandidate = [&queuedOfflineBots, &offlineCandidatesByLevel, &offlineFallbackQueue]
        (LevelBracket const& bracket) -> uint32
    {
        for (uint32 level = bracket.low; level <= bracket.high; ++level)
        {
            auto levelItr = offlineCandidatesByLevel.find(level);
            if (levelItr == offlineCandidatesByLevel.end())
                continue;

            std::vector<uint32>& levelCandidates = levelItr->second;
            while (!levelCandidates.empty())
            {
                uint32 guidLow = levelCandidates.back();
                levelCandidates.pop_back();
                if (!queuedOfflineBots.contains(guidLow))
                    return guidLow;
            }
        }

        while (!offlineFallbackQueue.empty())
        {
            uint32 guidLow = offlineFallbackQueue.back();
            offlineFallbackQueue.pop_back();
            if (!queuedOfflineBots.contains(guidLow))
                return guidLow;
        }

        return 0;
    };

    for (Player* misplacedBot : misplacedBots)
    {
        if (!movesRemaining)
            break;

        if (!misplacedBot || !misplacedBot->IsInWorld())
            continue;

        uint32 oldZoneId = NormalizePopulationZoneId(
            sTerrainMgr.GetZoneId(misplacedBot->GetMapId(), misplacedBot->GetPositionX(), misplacedBot->GetPositionY(), misplacedBot->GetPositionZ()));
        if (!RehomeBotToPopulationPlan(misplacedBot, "director_gc", true))
            continue;

        for (PopulationBucket& bucket : populationSnapshot.buckets)
        {
            if (bucket.zoneId == oldZoneId && bucket.misplacedBotCount)
                --bucket.misplacedBotCount;

            if (bucket.zoneId == GetPopulationZone(misplacedBot->GetGUIDLow()))
                ++bucket.currentBotCount;
        }

        ++populationSnapshot.movesThisTick;
        --movesRemaining;
    }

    for (PopulationBucket* bucket : shortages)
    {
        while (movesRemaining && bucket->currentBotCount < bucket->desiredTotal)
        {
            uint32 botGuid = takeOfflineCandidate(bucket->bracket);
            if (!botGuid)
                break;

            BotPopulationRole role = bucket->currentBotCount < bucket->desiredReserve ? bucket->reserveRole : bucket->dynamicRole;
            uint32 dwellUntil = now + urand(sPlayerbotAIConfig.populationDirectorMinDwell,
                std::max(sPlayerbotAIConfig.populationDirectorMinDwell, sPlayerbotAIConfig.populationDirectorMaxDwell));
            SetPopulationAssignment(botGuid, role, bucket->zoneId, bucket->bracket, dwellUntil, now);
            populationLoginQueue.push_back(botGuid);
            queuedOfflineBots.insert(botGuid);
            ++bucket->currentBotCount;
            ++populationSnapshot.loginsThisTick;
            --movesRemaining;
        }
    }

    // Build a zone-indexed list of relocatable bots once, to avoid O(shortages × surpluses × bots).
    std::unordered_map<uint32, std::vector<Player*>> relocatableBotsByZone;
    for (uint32 botGuid : currentBots)
    {
        Player* bot = GetPlayerBot(botGuid);
        if (!CanPopulationRelocateBot(bot, true) || IsProtectedByPopulationDirector(bot))
            continue;

        if (GetPopulationDwellUntil(botGuid) > now)
            continue;

        LevelBracket assignedBracket{0, 0};
        if (GetPopulationLevelBand(botGuid, assignedBracket))
        {
            assignedBracket = NormalizeReserveLevelBracket(GetPopulationZone(botGuid), assignedBracket);
            uint32 level = ClampToLevelBracket(bot->GetLevel());
            if (level < assignedBracket.low || level > assignedBracket.high)
                continue;
        }

        uint32 zoneId = NormalizePopulationZoneId(
            sTerrainMgr.GetZoneId(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ()));
        relocatableBotsByZone[zoneId].push_back(bot);
    }

    for (PopulationBucket* shortage : shortages)
    {
        while (movesRemaining && shortage->currentBotCount < shortage->desiredTotal)
        {
            Player* selectedBot = nullptr;
            PopulationBucket* sourceBucket = nullptr;
            for (PopulationBucket* surplus : surpluses)
            {
                if (surplus->currentBotCount <= surplus->desiredTotal)
                    continue;

                auto& zoneBots = relocatableBotsByZone[surplus->zoneId];
                while (!zoneBots.empty())
                {
                    Player* candidate = zoneBots.back();
                    zoneBots.pop_back();
                    if (!candidate || !candidate->IsInWorld())
                        continue;

                    // Don't relocate a bot whose level doesn't fit the target zone bracket.
                    uint32 botLevel = candidate->GetLevel();
                    if (botLevel < shortage->bracket.low || botLevel > shortage->bracket.high)
                        continue;

                    selectedBot = candidate;
                    sourceBucket = surplus;
                    break;
                }

                if (selectedBot)
                    break;
            }

            if (!selectedBot || !sourceBucket)
                break;

            BotPopulationRole role = shortage->currentBotCount < shortage->desiredReserve ? shortage->reserveRole : shortage->dynamicRole;
            uint32 dwellUntil = now + urand(sPlayerbotAIConfig.populationDirectorMinDwell,
                std::max(sPlayerbotAIConfig.populationDirectorMinDwell, sPlayerbotAIConfig.populationDirectorMaxDwell));
            SetPopulationAssignment(selectedBot->GetGUIDLow(), role, shortage->zoneId, shortage->bracket, dwellUntil, now);
            RandomTeleportToBucket(selectedBot, *shortage);
            --sourceBucket->currentBotCount;
            ++shortage->currentBotCount;
            ++populationSnapshot.movesThisTick;
            --movesRemaining;
        }
    }

    for (PopulationBucket* surplus : surpluses)
    {
        while (movesRemaining && surplus->currentBotCount > surplus->desiredTotal)
        {
            auto& zoneBots = relocatableBotsByZone[surplus->zoneId];
            Player* selectedBot = nullptr;
            while (!zoneBots.empty())
            {
                Player* candidate = zoneBots.back();
                zoneBots.pop_back();
                if (candidate && candidate->IsInWorld())
                {
                    selectedBot = candidate;
                    break;
                }
            }

            if (!selectedBot)
                break;

            LogoutPlayerBot(selectedBot->GetGUID());
            --surplus->currentBotCount;
            ++populationSnapshot.logoutsThisTick;
            --movesRemaining;
        }
    }
}
