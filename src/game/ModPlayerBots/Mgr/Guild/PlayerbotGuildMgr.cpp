#include "PlayerbotGuildMgr.h"

#include <algorithm>

#include "PlayerbotAIConfig.h"

void PlayerbotGuildMgr::Init()
{
    _guildCache.clear();
    _guildNames.clear();
    _shuffled_guild_keys.clear();
}

std::string PlayerbotGuildMgr::AssignToGuild(Player* /*player*/) { return ""; }

void PlayerbotGuildMgr::LoadGuildNames()
{
    _guildNames.clear();
    _shuffled_guild_keys.clear();
}

void PlayerbotGuildMgr::ValidateGuildCache() {}

void PlayerbotGuildMgr::ResetGuildCache() { _guildCache.clear(); }

bool PlayerbotGuildMgr::CreateGuild(Player* /*player*/, std::string /*guildName*/) { return false; }

void PlayerbotGuildMgr::OnGuildUpdate(Guild* guild)
{
    if (!guild)
        return;

    auto itr = _guildCache.find(guild->GetId());
    if (itr == _guildCache.end())
        return;

    GuildCache& cache = itr->second;
    cache.memberCount = 0;
    cache.status = 0;
}

bool PlayerbotGuildMgr::SetGuildEmblem(uint32 /*guildId*/) { return true; }

void PlayerbotGuildMgr::DeleteBotGuilds() {}

bool PlayerbotGuildMgr::IsRealGuild(uint32 guildId)
{
    auto itr = _guildCache.find(guildId);
    return itr != _guildCache.end() && itr->second.hasRealPlayer;
}

bool PlayerbotGuildMgr::IsRealGuild(Player* bot)
{
    if (!bot)
        return false;

    return IsRealGuild(bot->GetGuildId());
}

void PlayerBotsGuildValidationScript() {}
