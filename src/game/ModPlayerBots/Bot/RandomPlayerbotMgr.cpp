#include "RandomPlayerbotMgr.h"

#include <algorithm>

#include "ObjectAccessor.h"
#include "Playerbots.h"

botPID::botPID(double, double, double, double, double, double) : pimpl(nullptr) {}
void botPID::adjust(double, double, double) {}
void botPID::reset() {}
double botPID::calculate(double, double) { return 0.0; }
botPID::~botPID() = default;

uint32 RandomPlayerbotMgr::GetMaxAllowedBotCount() { return GetEventValue(0, "bot_count"); }
void RandomPlayerbotMgr::LogPlayerLocation() {}

void RandomPlayerbotMgr::UpdateAIInternal(uint32, bool)
{
    if (!sPlayerbotAIConfig.randomBotAutologin)
        return;

    GetBots();
}

bool RandomPlayerbotMgr::HandlePlayerbotConsoleCommand(ChatHandler*, char const*) { return true; }

bool RandomPlayerbotMgr::IsRandomBot(Player* bot)
{
    if (!bot)
        return false;
    return IsRandomBot(static_cast<LowType>(bot->GetGUIDLow()));
}

bool RandomPlayerbotMgr::IsRandomBot(LowType bot)
{
    return currentBots.end() != std::find(currentBots.begin(), currentBots.end(), static_cast<uint32>(bot));
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

void RandomPlayerbotMgr::Randomize(Player*) {}
void RandomPlayerbotMgr::Clear(Player*) {}
void RandomPlayerbotMgr::RandomizeFirst(Player*) {}
void RandomPlayerbotMgr::RandomizeMin(Player*) {}
void RandomPlayerbotMgr::IncreaseLevel(Player*) {}
void RandomPlayerbotMgr::ScheduleTeleport(uint32, uint32) {}
void RandomPlayerbotMgr::ScheduleChangeStrategy(uint32, uint32) {}
void RandomPlayerbotMgr::HandleCommand(uint32, std::string const, Player*, std::string) {}
std::string const RandomPlayerbotMgr::HandleRemoteCommand(std::string const) { return ""; }
void RandomPlayerbotMgr::OnPlayerLogout(Player*) {}
void RandomPlayerbotMgr::OnPlayerLogin(Player* player)
{
    if (!player)
        return;

    if (IsRandomBot(player))
        OnBotLogin(player);
}
void RandomPlayerbotMgr::OnPlayerLoginError(uint32) {}

Player* RandomPlayerbotMgr::GetRandomPlayer()
{
    if (players.empty())
        return nullptr;
    return players[urand(0, players.size() - 1)];
}

void RandomPlayerbotMgr::PrintStats() {}
double RandomPlayerbotMgr::GetBuyMultiplier(Player*) { return 1.0; }
double RandomPlayerbotMgr::GetSellMultiplier(Player*) { return 1.0; }
void RandomPlayerbotMgr::AddTradeDiscount(Player*, Player*, int32) {}
void RandomPlayerbotMgr::SetTradeDiscount(Player*, Player*, uint32) {}
uint32 RandomPlayerbotMgr::GetTradeDiscount(Player*, Player*) { return 0; }
void RandomPlayerbotMgr::Refresh(Player*) {}
void RandomPlayerbotMgr::RandomTeleportForLevel(Player*) {}
void RandomPlayerbotMgr::RandomTeleportGrindForLevel(Player*) {}
void RandomPlayerbotMgr::RandomTeleportForRpg(Player*) {}
bool RandomPlayerbotMgr::ProcessBot(Player*) { return false; }
void RandomPlayerbotMgr::Revive(Player*) {}
void RandomPlayerbotMgr::ChangeStrategy(Player*) {}
void RandomPlayerbotMgr::ChangeStrategyOnce(Player*) {}

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
}

ObjectGuid RandomPlayerbotMgr::GetBattleMasterGUID(Player*, BattlegroundTypeId) { return ObjectGuid::Empty; }
CreatureData const* RandomPlayerbotMgr::GetCreatureDataByEntry(uint32) { return nullptr; }
void RandomPlayerbotMgr::LoadBattleMastersCache() {}
void RandomPlayerbotMgr::CheckBgQueue() {}
void RandomPlayerbotMgr::CheckLfgQueue() {}
void RandomPlayerbotMgr::CheckPlayers() {}
void RandomPlayerbotMgr::LogBattlegroundInfo() {}
void RandomPlayerbotMgr::PrepareAddclassCache() { addclassCache.clear(); }
void RandomPlayerbotMgr::PrepareZone2LevelBracket() { zone2LevelBracket.clear(); }
void RandomPlayerbotMgr::PrepareTeleportCache() {}

void RandomPlayerbotMgr::Init()
{
    PrepareAddclassCache();
    PrepareZone2LevelBracket();
    PrepareTeleportCache();
}

void RandomPlayerbotMgr::AssignAccountTypes()
{
    rndBotTypeAccounts.clear();
    addClassTypeAccounts.clear();
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

    currentBots.push_back(bot->GetGUIDLow());
}

CachedEvent* RandomPlayerbotMgr::FindEvent(uint32 bot, std::string const& event)
{
    auto& cache = eventCache[bot];
    auto itr = cache.events.find(event);
    if (itr == cache.events.end())
        return nullptr;
    return &itr->second;
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
    CachedEvent& e = eventCache[bot].events[event];
    e.value = value;
    e.validIn = validIn;
    e.lastChangeTime = NowSeconds();
    e.data = data;
    return e.value;
}

void RandomPlayerbotMgr::GetBots()
{
    players.clear();
    currentBots.clear();

    for (auto const& itr : playerBots)
    {
        if (!itr.second)
            continue;

        players.push_back(itr.second);
        currentBots.push_back(itr.second->GetGUIDLow());
    }
}

std::vector<uint32> RandomPlayerbotMgr::GetBgBots(uint32) { return std::vector<uint32>(); }
uint32 RandomPlayerbotMgr::AddRandomBots() { return 0; }
bool RandomPlayerbotMgr::ProcessBot(uint32) { return false; }
void RandomPlayerbotMgr::ScheduleRandomize(uint32, uint32) {}
void RandomPlayerbotMgr::RandomTeleport(Player*) {}
void RandomPlayerbotMgr::RandomTeleport(Player*, std::vector<WorldLocation>&, bool) {}
uint32 RandomPlayerbotMgr::GetZoneLevel(uint16, float, float, float) { return 0; }
