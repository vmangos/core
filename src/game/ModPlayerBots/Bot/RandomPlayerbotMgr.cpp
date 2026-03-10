#include "RandomPlayerbotMgr.h"

#include <algorithm>
#include <cctype>
#include <cmath>
#include <limits>
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

    return std::max(configuredMin, std::min(configuredMax, target));
}

void RandomPlayerbotMgr::LogPlayerLocation()
{
    LOG_INFO("playerbots", "Random bot manager: players=%zu random_bots=%zu active_bots=%u target=%u activity=%.1f%%",
        players.size(), currentBots.size(), activeBots, GetMaxAllowedBotCount(), getActivityPercentage());
}

void RandomPlayerbotMgr::UpdateAIInternal(uint32 elapsed, bool)
{
    processTicks += elapsed;
    CheckPlayers();

    if (!sPlayerbotAIConfig.randomBotAutologin)
        return;

    const time_t now = NowSeconds();

    if (!DelayLoginBotsTimer)
        DelayLoginBotsTimer = now;

    if (now < DelayLoginBotsTimer)
        return;

    DelayLoginBotsTimer = now + std::max<uint32>(1, sPlayerbotAIConfig.randomBotUpdateInterval);

    CleanupExpiredEvents();
    GetBots();
    CheckBgQueue();
    CheckLfgQueue();

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
                LOG_INFO("playerbots", "Random bot logout: %s (%u)", bot->GetName(), botGuid);
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
        LOG_INFO("playerbots", "Random bot population: online=%zu target=%u players=%zu loading=%zu",
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
    if (command.empty() || command == "help" || command == "status")
    {
        handler->PSendSysMessage("Random bot status: online=%zu target=%u players=%zu loading=%zu",
            sRandomPlayerbotMgr.currentBots.size(), target, sRandomPlayerbotMgr.players.size(),
            PlayerbotHolder::botLoading.size());
        handler->PSendSysMessage("Usage: .playerbots rndbot help");
        handler->PSendSysMessage("Usage: .playerbots rndbot status");
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

    if (!sPlayerbotAIConfig.randomBotFixedLevel)
    {
        float roll = frand(0.0f, 1.0f);
        if (roll <= sPlayerbotAIConfig.randomBotMinLevelChance)
            level = minLevel;
        else if (roll >= 1.0f - sPlayerbotAIConfig.randomBotMaxLevelChance)
            level = maxLevel;
        else if (!sPlayerbotAIConfig.disableRandomLevels)
            level = urand(minLevel, maxLevel);
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
    if (bot->GetLevel() >= maxLevel)
        return;

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
        return;

    currentBots.remove(player->GetGUIDLow());
    RemoveFromPlayerbotsMap(player->GetGUID());
}

void RandomPlayerbotMgr::OnPlayerLogin(Player* player)
{
    if (!player)
        return;

    if (IsRandomBot(player) || sPlayerbotAIConfig.IsInRandomAccountList(player->GetSession()->GetAccountId()))
    {
        SetEventValue(player->GetGUIDLow(), "add", 1, 0);
        OnBotLogin(player);
        return;
    }

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

    std::vector<WorldLocation>& locs = locsPerLevelCache[ClampToLevelBracket(bot->GetLevel())];
    if (locs.empty())
    {
        std::vector<WorldLocation>& starters = IsAlliance(bot->GetRace())
            ? allianceStarterPerLevelCache[ClampToLevelBracket(bot->GetLevel())]
            : hordeStarterPerLevelCache[ClampToLevelBracket(bot->GetLevel())];
        RandomTeleport(bot, starters);
        return;
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
        RandomTeleport(player);
        return true;
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
            RandomTeleportForLevel(player);
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
    LOG_INFO("playerbots", "Random bot strategy mode: %s (%u) -> %s",
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

    LOG_INFO("playerbots", "Random battlemaster cache: AV=%zu AB=%zu WS=%zu",
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

    GetBots();

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

    LOG_INFO("playerbots",
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

        std::vector<WorldPosition*> points = destination->getPoints(true);
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
            WorldLocation loc(*point);
            for (uint32 level = low; level <= high; ++level)
                locsPerLevelCache[level].push_back(loc);
        }
    }

    for (RpgTravelDestination* destination : TravelMgr::instance().rpgNpcs)
    {
        if (!destination)
            continue;

        std::vector<WorldPosition*> points = destination->getPoints(true);
        if (points.empty())
            continue;

        for (WorldPosition* point : points)
        {
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
            if (!info)
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
            }

            return false;
        }
    } worker{this};

    sObjectMgr.DoCreatureData(worker);
}

void RandomPlayerbotMgr::Init()
{
    AssignAccountTypes();
    PrepareAddclassCache();
    PrepareZone2LevelBracket();
    PrepareTeleportCache();
    LoadBattleMastersCache();
    CleanupExpiredEvents(true);
    RepairBrokenRandomBotState();

    if (!GetEventValue(MANAGER_BOT, "bot_count"))
        SetEventValue(MANAGER_BOT, "bot_count", std::max<uint32>(sPlayerbotAIConfig.minRandomBots, 1), 0);

    if (!GetEventValue(MANAGER_BOT, "bot_count_refresh"))
        SetEventValue(MANAGER_BOT, "bot_count_refresh", 1,
            urand(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                std::max(sPlayerbotAIConfig.randomBotCountChangeMinInterval,
                    sPlayerbotAIConfig.randomBotCountChangeMaxInterval)));

    LOG_INFO("playerbots", "RandomPlayerbotMgr initialized: autologin=%s random_accounts=%zu addclass_accounts=%zu level_cache=%zu rpg_cache=%zu",
        sPlayerbotAIConfig.randomBotAutologin ? "true" : "false",
        rndBotTypeAccounts.size(),
        addClassTypeAccounts.size(),
        locsPerLevelCache.size(),
        rpgLocsCacheLevel.size());
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

void RandomPlayerbotMgr::OnBotLoginInternal(Player* const bot)
{
    if (!bot)
        return;

    currentBots.remove(bot->GetGUIDLow());
    currentBots.push_back(bot->GetGUIDLow());
    SetEventValue(bot->GetGUIDLow(), "add", 1, 0);

    if (!EnsureAutonomousInit(bot, "login"))
        ScheduleAutonomousEvents(bot->GetGUIDLow(), "login");
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

    LOG_INFO("playerbots", "Random bot runtime state repaired: %s (%u) level=%u context=%s",
        bot->GetName(), bot->GetGUIDLow(), bot->GetLevel(), context ? context : "unknown");
    return true;
}

bool RandomPlayerbotMgr::EnsureAutonomousInit(Player* bot, char const* context)
{
    if (!bot || !IsRandomBot(bot))
        return false;

    AutonomousInitState state = GetAutonomousInitState(bot);
    bool hasAutonomyGap = state.missingRandomized || state.missingStrategyEvent || state.missingTeleportEvent ||
        state.missingStrategyMode || state.baselineLevel || state.missingTalents || state.missingGear;
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
    if (state.missingTalents)
        reasons.push_back("missing talents");
    if (state.missingGear)
        reasons.push_back("missing gear");

    LOG_INFO("playerbots", "Random bot uninitialized: %s (%u) [%s] context=%s",
        bot->GetName(), bot->GetGUIDLow(), JoinReasons(reasons).c_str(), context ? context : "unknown");

    if (state.NeedsFullRandomize())
    {
        RandomizeFirst(bot);

        LOG_INFO("playerbots", "Random bot repaired: %s (%u) level=%u context=%s",
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
        LOG_INFO("playerbots", "Random bot scheduled with missing events: %u [%s] context=%s",
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
        LOG_INFO("playerbots", "Random bot autonomy repair: no add-only bots required backfill");
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
        LOG_INFO("playerbots", "Random bot autonomy repair: no add-only bots required backfill");
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

    LOG_INFO("playerbots", "Random bot autonomy repair backfill prepared %zu add-only bots for reinitialization",
        brokenBots.size());
    SetEventValue(MANAGER_BOT, "autonomy_repair_v1", 1, 0);
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

    std::vector<uint32> offlineBots = GetOfflineRandomBots(
        std::min<uint32>(desiredCount - currentCount, std::max<uint32>(1, sPlayerbotAIConfig.randomBotsPerInterval)));
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
    return target;
}

std::vector<uint32> RandomPlayerbotMgr::GetOfflineRandomBots(uint32 limit)
{
    std::vector<uint32> result;
    if (!limit || rndBotTypeAccounts.empty())
        return result;

    std::ostringstream accounts;
    for (size_t i = 0; i < rndBotTypeAccounts.size(); ++i)
    {
        if (i)
            accounts << ',';
        accounts << rndBotTypeAccounts[i];
    }

    auto query = CharacterDatabase.PQuery(
        "SELECT guid FROM characters WHERE account IN (%s) ORDER BY rand()",
        accounts.str().c_str());

    if (!query)
        return result;

    std::unordered_set<uint32> online(currentBots.begin(), currentBots.end());
    do
    {
        uint32 guidLow = query->Fetch()[0].GetUInt32();
        ObjectGuid guid(HIGHGUID_PLAYER, guidLow);

        if (online.contains(guidLow) || IsBotLoading(guid) || ObjectAccessor::FindPlayer(guid) || GetPlayerBot(guid))
            continue;

        if (GetEventValue(guidLow, "login_cooldown"))
            continue;

        result.push_back(guidLow);
        if (result.size() >= limit)
            break;
    } while (query->NextRow());

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

void RandomPlayerbotMgr::RandomTeleport(Player* bot, std::vector<WorldLocation>& locs, bool)
{
    if (!bot || locs.empty() || bot->IsBeingTeleported())
        return;

    WorldLocation const& loc = PickRandom(locs);
    if (!MapManager::IsValidMapCoord(loc))
        return;

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (botAI)
    {
        botAI->Reset();
        bot->CombatStop(true);
    }

    bot->TeleportTo(loc.mapId, loc.x, loc.y, loc.z, loc.o);
    ScheduleTeleport(bot->GetGUIDLow(), 0);
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
