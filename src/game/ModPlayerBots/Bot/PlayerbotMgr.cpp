/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PlayerbotMgr.h"

#include <cstdio>
#include <cstring>
#include <istream>
#include <string>
#include <unordered_set>
#include <openssl/sha.h>
#include <iomanip>
#include <algorithm>

#include "ChannelMgr.h"
#include "CharacterCache.h"
#include "AccountMgr.h"
#include "CharacterPackets.h"
#include "Common.h"
#include "Define.h"
#include "Group.h"
#include "GroupMgr.h"
#include "GuildMgr.h"
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "ObjectMgr.h"
#include "PlayerbotAIConfig.h"
#include "PlayerbotAI.h"
#include "PlayerbotRepository.h"
#include "PlayerbotFactory.h"
#include "ModPlayerBots/Script/WorldThr/PlayerbotOperation.h"
#include "PlayerbotSecurity.h"
#include "PlayerbotWorldThreadProcessor.h"
#include "Playerbots.h"
#include "PlayerbotGuildMgr.h"
#include "RandomPlayerbotMgr.h"
#include "../Ai/Base/Actions/UseMeetingStoneAction.h"
#include "SharedDefines.h"
#include "WorldSession.h"
#include "BroadcastHelper.h"
#include "WorldSessionMgr.h"
#include "DatabaseEnv.h"
#include "PlayerBotsCompat/PlayerBotsStubs.h"

class BotInitGuard
{
public:
    BotInitGuard(ObjectGuid guid) : guid(guid), active(false)
    {
        if (!botsBeingInitialized.contains(guid))
        {
            botsBeingInitialized.insert(guid);
            active = true;
        }
    }

    ~BotInitGuard()
    {
        if (active)
            botsBeingInitialized.erase(guid);
    }

    bool IsLocked() const { return !active; }

private:
    ObjectGuid guid;
    bool active;
    static std::unordered_set<ObjectGuid> botsBeingInitialized;
};

std::unordered_set<ObjectGuid> BotInitGuard::botsBeingInitialized;
std::unordered_set<ObjectGuid> PlayerbotHolder::botLoading;
std::unordered_map<ObjectGuid, uint32> PlayerbotHolder::pendingBotOwners;
std::unordered_map<ObjectGuid, PlayerbotHolder::PendingBotInitRequest> PlayerbotHolder::pendingBotInitRequests;
std::unordered_map<ObjectGuid, WorldSession*> PlayerbotHolder::pendingBotSessions;

PlayerbotHolder::PlayerbotHolder() : PlayerbotAIBase(false) {}

namespace
{
struct RoleSpecCandidate
{
    uint8 classId;
    int specNo;
};

char const* const kAddRoleUsage = "usage: addrole ROLE [male|female|0|1]";
char const* const kAddRoleList = "tank/healer/dps/ranged_dps";

uint32 GetOnlineAccountBotCount()
{
    uint32 accountBotCount = 0;
    World::SessionMap const sessions = sWorld.GetAllSessions();

    for (auto const& [accountId, session] : sessions)
    {
        (void)accountId;

        if (!session)
            continue;

        Player* player = session->GetPlayer();
        if (!player || player->IsBot())
            continue;

        if (PlayerbotMgr* mgr = GET_PLAYERBOT_MGR(player))
            accountBotCount += mgr->GetPlayerbotsCount();
    }

    return accountBotCount;
}

uint32 GetPersistedGroupId(ObjectGuid guid)
{
    std::unique_ptr<QueryResult> result(CharacterDatabase.PQuery(
        "SELECT `group_id` FROM `group_member` WHERE `member_guid` = '%u'", guid.GetCounter()));
    return result ? (*result)[0].GetUInt32() : 0;
}

void CleanupOfflineBotGroupState(ObjectGuid botGuid, Player* master)
{
    uint32 groupId = GetPersistedGroupId(botGuid);
    if (!groupId)
        return;

    Group* masterGroup = master ? master->GetGroup() : nullptr;
    if (masterGroup && masterGroup->GetId() == groupId)
        return;

    LOG_INFO("playerbots",
        "Cleaning persisted group state for bot guid=%u group_id=%u master_guid=%u",
        botGuid.GetCounter(), groupId, master ? master->GetGUIDLow() : 0);

    if (Group* staleGroup = sObjectMgr.GetGroupById(groupId))
    {
        staleGroup->RemoveMember(botGuid, GROUP_LEAVE);
        return;
    }

    CharacterDatabase.PExecute("DELETE FROM `group_member` WHERE `member_guid` = '%u'", botGuid.GetCounter());

    std::unique_ptr<QueryResult> countResult(CharacterDatabase.PQuery(
        "SELECT COUNT(*) FROM `group_member` WHERE `group_id` = '%u'", groupId));
    if (!countResult || !(*countResult)[0].GetUInt32())
        CharacterDatabase.PExecute("DELETE FROM `groups` WHERE `group_id` = '%u'", groupId);
}

bool IsPlayerbotLookupSafe(Player* player)
{
    if (!player)
        return false;

    // Avoid dereferencing WorldSession here. During logout/removal races the
    // raw session pointer can already be stale, and these lookups only need a
    // conservative player-lifetime gate before touching the manager maps.
    return player->GetSession() && !player->IsDuringRemoveFromWorld() &&
        (player->IsInWorld() || player->IsBeingTeleported());
}

bool EnsureLiveBotGroupBinding(Player* master, Player* bot)
{
    if (!master || !bot)
        return false;

    Group* group = master->GetGroup();
    if (!group || !group->IsMember(bot->GetGUID()))
        return false;

    if (bot->GetGroup() == group)
        return true;

    uint8 subgroup = group->GetMemberGroup(bot->GetGUID());
    if (subgroup > MAX_RAID_SUBGROUPS)
        return false;

    LOG_WARN("playerbots",
        "Repairing live group bind for bot=%s(%u) master=%s(%u) groupId=%u subgroup=%u oldGroupPtr=%p",
        bot->GetName(), bot->GetGUIDLow(),
        master->GetName(), master->GetGUIDLow(),
        group->GetId(), subgroup,
        static_cast<void const*>(bot->GetGroup()));

    bot->SetGroup(group, subgroup);
    bot->SetGroupUpdateFlag(GROUP_UPDATE_FULL);
    bot->SetAuraUpdateMask(bot->GetAuraApplicationMask());
    if (Pet* pet = bot->GetPet())
        pet->SetAuraUpdateMask(pet->GetAuraApplicationMask());

    group->SendUpdate();
    return bot->GetGroup() == group;
}

bool TryParseGender(char const* genderArg, int8& gender, std::string& error)
{
    gender = -1;
    if (!genderArg)
        return true;

    std::string g = genderArg;
    std::transform(g.begin(), g.end(), g.begin(), ::tolower);

    if (g == "male" || g == "0")
        gender = GENDER_MALE;
    else if (g == "female" || g == "1")
        gender = GENDER_FEMALE;
    else
    {
        error = "Unknown gender : " + g + " (male/female/0/1)";
        return false;
    }

    return true;
}

bool TryParseClassName(char const* className, uint8& claz)
{
    if (!className)
        return false;

    if (!strcmp(className, "warrior"))
        claz = CLASS_WARRIOR;
    else if (!strcmp(className, "paladin"))
        claz = CLASS_PALADIN;
    else if (!strcmp(className, "hunter"))
        claz = CLASS_HUNTER;
    else if (!strcmp(className, "rogue"))
        claz = CLASS_ROGUE;
    else if (!strcmp(className, "priest"))
        claz = CLASS_PRIEST;
    else if (!strcmp(className, "shaman"))
        claz = CLASS_SHAMAN;
    else if (!strcmp(className, "mage"))
        claz = CLASS_MAGE;
    else if (!strcmp(className, "warlock"))
        claz = CLASS_WARLOCK;
    else if (!strcmp(className, "druid"))
        claz = CLASS_DRUID;
    else if (!strcmp(className, "dk"))
        claz = CLASS_DEATH_KNIGHT;
    else
        return false;

    return true;
}

char const* GetClassName(uint8 classId)
{
    switch (classId)
    {
        case CLASS_WARRIOR:
            return "warrior";
        case CLASS_PALADIN:
            return "paladin";
        case CLASS_HUNTER:
            return "hunter";
        case CLASS_ROGUE:
            return "rogue";
        case CLASS_PRIEST:
            return "priest";
        case CLASS_SHAMAN:
            return "shaman";
        case CLASS_MAGE:
            return "mage";
        case CLASS_WARLOCK:
            return "warlock";
        case CLASS_DRUID:
            return "druid";
        case CLASS_DEATH_KNIGHT:
            return "dk";
        default:
            return "unknown";
    }
}

std::string GetSpecName(uint8 classId, int specNo)
{
    if (classId >= MAX_CLASSES || specNo < 0 || specNo >= MAX_SPECNO)
        return "unknown";

    std::string const& specName = sPlayerbotAIConfig.premadeSpecName[classId][specNo];
    return specName.empty() ? "unknown" : specName;
}

std::string FormatClassSpec(uint8 classId, int specNo)
{
    return GetSpecName(classId, specNo) + " " + GetClassName(classId);
}

std::vector<RoleSpecCandidate> GetRoleCandidates(std::string const& role)
{
    if (role == "tank")
    {
        return {
            {CLASS_WARRIOR, 2},
            {CLASS_PALADIN, 1},
            {CLASS_DRUID, 1},
        };
    }

    if (role == "healer")
    {
        return {
            {CLASS_PALADIN, 0},
            {CLASS_PRIEST, 0},
            {CLASS_PRIEST, 1},
            {CLASS_SHAMAN, 2},
            {CLASS_DRUID, 2},
        };
    }

    if (role == "dps")
    {
        return {
            {CLASS_WARRIOR, 0},
            {CLASS_WARRIOR, 1},
            {CLASS_PALADIN, 2},
            {CLASS_ROGUE, 0},
            {CLASS_ROGUE, 1},
            {CLASS_ROGUE, 2},
            {CLASS_SHAMAN, 1},
            {CLASS_DRUID, 3},
        };
    }

    if (role == "ranged_dps")
    {
        return {
            {CLASS_HUNTER, 0},
            {CLASS_HUNTER, 1},
            {CLASS_HUNTER, 2},
            {CLASS_PRIEST, 2},
            {CLASS_SHAMAN, 0},
            {CLASS_MAGE, 0},
            {CLASS_MAGE, 1},
            {CLASS_MAGE, 2},
            {CLASS_WARLOCK, 0},
            {CLASS_WARLOCK, 1},
            {CLASS_WARLOCK, 2},
            {CLASS_DRUID, 0},
        };
    }

    return {};
}

class PlayerbotSessionPacketBridge : public PlayerBotAI
{
public:
    explicit PlayerbotSessionPacketBridge(ObjectGuid botGuid) : botGuid(botGuid) {}

    void OnPacketReceived(WorldPacket const* packet) override
    {
        if (!packet)
            return;

        Player* bot = ObjectAccessor::FindPlayer(botGuid);
        if (!bot)
            return;

        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI)
            botAI->HandleBotOutgoingPacket(*packet);
    }

private:
    ObjectGuid botGuid;
};

}  // namespace

// Simple holder for bot login data (vMaNGOS doesn't have LoginQueryHolder base class available)
struct PlayerbotLoginQueryHolder
{
    uint32 masterAccountId;
    uint32 accountId;
    ObjectGuid guid;

    PlayerbotLoginQueryHolder(uint32 masterAccount, uint32 acctId, ObjectGuid playerGuid)
        : masterAccountId(masterAccount), accountId(acctId), guid(playerGuid) {}

    uint32 GetMasterAccountId() const { return masterAccountId; }
    uint32 GetAccountId() const { return accountId; }
    ObjectGuid GetGuid() const { return guid; }
};

// Custom callback handler for bot login
class BotCharacterHandler
{
public:
    void HandlePlayerLoginCallback(std::unique_ptr<QueryResult> /*dummy*/, SqlQueryHolder* holder)
    {
        if (holder)
            delete holder;
    }
};
static BotCharacterHandler botChrHandler;

std::string PlayerbotHolder::AddPlayerBot(ObjectGuid playerGuid, uint32 masterAccountId, bool admin)
{
    if (botLoading.find(playerGuid) != botLoading.end())
        return "login already in progress";

    // has bot already been added?
    Player* bot = ObjectAccessor::FindPlayer(playerGuid);
    if (bot && bot->IsInWorld())
        return "player already logged in";

    uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(playerGuid);
    if (!accountId)
    {
        std::string botName;
        bool hasName = sCharacterCache->GetCharacterNameByGuid(playerGuid, botName);
        LOG_WARN("playerbots",
            "Skipping bot login for guid %u: character cache lookup failed after reload (account=%u, name=%s)",
            playerGuid.GetCounter(), accountId, hasName ? botName.c_str() : "<missing>");
        return "character account lookup failed";
    }

    WorldSession* masterSession = masterAccountId ? sWorldSessionMgr->FindSession(masterAccountId) : nullptr;
    Player* masterPlayer = masterSession ? masterSession->GetPlayer() : nullptr;

    if (masterPlayer)
        CleanupOfflineBotGroupState(playerGuid, masterPlayer);

    bool isRndbot = !masterAccountId;
    bool sameAccount = sPlayerbotAIConfig.allowAccountBots && accountId == masterAccountId;
    Guild* guild = masterPlayer ? sGuildMgr.GetGuildById(masterPlayer->GetGuildId()) : nullptr;
    bool sameGuild = sPlayerbotAIConfig.allowGuildBots && guild && guild->GetMember(playerGuid);
    bool addClassBot = sRandomPlayerbotMgr.IsAddclassBot(playerGuid.GetCounter());
    bool linkedAccount = sPlayerbotAIConfig.allowTrustedAccountBots && IsAccountLinked(accountId, masterAccountId);

    bool allowed = true;
    std::ostringstream out;
    std::string botName;
    sCharacterCache->GetCharacterNameByGuid(playerGuid, botName);
    if (!admin && !isRndbot && !sameAccount && !sameGuild && !addClassBot && !linkedAccount)
    {
        allowed = false;
        out << "Failure: You are not allowed to control bot " << botName;
    }
    if (masterAccountId && masterPlayer)
    {
        PlayerbotMgr* mgr = GET_PLAYERBOT_MGR(masterPlayer);
        if (!mgr)
        {
            LOG_DEBUG("playerbots", "PlayerbotMgr not found for master player with GUID: %llu",
                      static_cast<unsigned long long>(masterPlayer->GetGUID()));
            return "master playerbot manager not found";
        }
        uint32 count = mgr->GetPlayerbotsCount() + botLoading.size();
        if (count >= sPlayerbotAIConfig.maxAddedBots)
        {
            allowed = false;
            out << "Failure: You have added too many bots (more than " << sPlayerbotAIConfig.maxAddedBots << ")";
        }
    }
    if (!allowed)
    {
        if (masterSession)
        {
            ChatHandler ch(masterSession);
            ch.SendSysMessage(out.str().c_str());
        }
        return out.str();
    }

    SetBotLoading(playerGuid, true);
    SetPendingBotOwner(playerGuid, masterAccountId);

    // Synchronous login for vMaNGOS (simpler than Trinity async pattern)
    PlayerbotLoginQueryHolder holder(masterAccountId, accountId, playerGuid);
    HandlePlayerBotLoginCallback(holder);
    return "";
}

bool PlayerbotHolder::IsAccountLinked(uint32 accountId, uint32 linkedAccountId)
{
    auto result = PB_QueryFormat(PlayerbotsDatabase,
        "SELECT 1 FROM playerbots_account_links WHERE account_id = {} AND linked_account_id = {}", accountId, linkedAccountId);
    return result != nullptr;
}

void PlayerbotHolder::SetBotLoading(ObjectGuid guid, bool loading)
{
    if (loading)
        botLoading.insert(guid);
    else
        botLoading.erase(guid);
}

bool PlayerbotHolder::IsBotLoadingGuid(ObjectGuid guid)
{
    return botLoading.find(guid) != botLoading.end();
}

bool PlayerbotHolder::TryGetPendingBotOwner(ObjectGuid guid, uint32& masterAccountId)
{
    auto const itr = pendingBotOwners.find(guid);
    if (itr == pendingBotOwners.end())
        return false;

    masterAccountId = itr->second;
    return true;
}

void PlayerbotHolder::SetPendingBotOwner(ObjectGuid guid, uint32 masterAccountId)
{
    pendingBotOwners[guid] = masterAccountId;
}

void PlayerbotHolder::ClearPendingBotOwner(ObjectGuid guid)
{
    pendingBotOwners.erase(guid);
    ClearPendingBotInitRequest(guid);
}

bool PlayerbotHolder::TryGetPendingBotInitRequest(ObjectGuid guid, PendingBotInitRequest& request)
{
    auto const itr = pendingBotInitRequests.find(guid);
    if (itr == pendingBotInitRequests.end())
        return false;

    request = itr->second;
    return true;
}

void PlayerbotHolder::SetPendingBotInitRequest(ObjectGuid guid, PendingBotInitRequest const& request)
{
    pendingBotInitRequests[guid] = request;
}

void PlayerbotHolder::ClearPendingBotInitRequest(ObjectGuid guid)
{
    pendingBotInitRequests.erase(guid);
}

void PlayerbotHolder::RegisterPendingBotSession(ObjectGuid guid, WorldSession* session)
{
    pendingBotSessions[guid] = session;
}

WorldSession* PlayerbotHolder::FindPendingBotSession(ObjectGuid guid)
{
    auto const itr = pendingBotSessions.find(guid);
    return itr == pendingBotSessions.end() ? nullptr : itr->second;
}

void PlayerbotHolder::UnregisterPendingBotSession(ObjectGuid guid)
{
    pendingBotSessions.erase(guid);
}

void PlayerbotHolder::HandlePlayerBotLoginCallback(PlayerbotLoginQueryHolder const& holder)
{
    uint32 botAccountId = holder.GetAccountId();

    // Create world session for bot
    // vMaNGOS WorldSession constructor: WorldSession(uint32 id, std::shared_ptr<WorldSocket> sock, AccountTypes sec, time_t mute_time, LocaleConstant locale)
    // For bots, we create with nullptr socket
    WorldSession* botSession = new WorldSession(botAccountId, nullptr, SEC_PLAYER, 0, LOCALE_enUS);
    auto botEntry = std::make_shared<PlayerBotEntry>(holder.guid.GetRawValue(), botAccountId, 100);
    botEntry->state = PB_STATE_LOADING;
    botEntry->ai = std::make_unique<PlayerbotSessionPacketBridge>(holder.guid);
    botSession->SetBot(botEntry);

    // Keep bot login sessions outside the world's account-indexed session map.
    // Vanilla only supports one WorldSession per account there, which breaks multi-bot accounts.
    RegisterPendingBotSession(holder.guid, botSession);
    botSession->LoginPlayer(holder.guid);
}

void PlayerbotHolder::UpdateSessions()
{
    for (PlayerBotMap::const_iterator itr = GetPlayerBotsBegin(); itr != GetPlayerBotsEnd(); ++itr)
    {
        Player* const bot = itr->second;
        if (bot->IsBeingTeleported())
        {
            PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
            LOG_INFO("playerbots",
                "UpdateSessions: teleporting bot=%s(%u) far=%u near=%u inWorld=%u mapId=%u instId=%u mapPtr=%p groupPtr=%p worldMask=%u botAI=%p",
                bot->GetName(), bot->GetGUIDLow(),
                bot->IsBeingTeleportedFar(), bot->IsBeingTeleportedNear(), bot->IsInWorld(),
                bot->GetMapId(), bot->GetInstanceId(),
                static_cast<void const*>(bot->FindMap()),
                static_cast<void const*>(bot->GetGroup()),
                bot->GetWorldMask(),
                static_cast<void const*>(botAI));
            if (botAI)
            {
                botAI->HandleTeleportAck();
            }
            else if (bot->IsBeingTeleportedFar() && bot->GetSession())
            {
                // Fallback: PlayerbotAI not found but bot is stuck in far teleport.
                // Directly dispatch the worldport ack to avoid leaving the bot in limbo.
                LOG_WARN("playerbots",
                    "UpdateSessions: fallback worldport ack for bot=%s(%u) — botAI was null",
                    bot->GetName(), bot->GetGUIDLow());
                bot->GetSession()->HandleMoveWorldportAckOpcode();
            }
        }
        else if (bot->IsInWorld())
        {
            HandleBotPackets(bot->GetSession());
        }
    }
}

void PlayerbotHolder::HandleBotPackets(WorldSession* session)
{
    // Vanilla bot sessions receive server packets through the WorldSession::SendPacket bridge
    // attached to PlayerBotEntry::ai. There is no separate packet queue to drain here.
    (void)session;
}

void PlayerbotHolder::LogoutAllBots()
{
    /*
    while (true)
    {
        PlayerBotMap::const_iterator itr = GetPlayerBotsBegin();
        if (itr == GetPlayerBotsEnd())
            break;

        Player* bot= itr->second;
        if (!GET_PLAYERBOT_AI(bot)->IsRealPlayer())
            LogoutPlayerBot(bot->GetGUID());
    }
    */

    PlayerBotMap bots = playerBots;
    for (auto& itr : bots)
    {
        Player* bot = itr.second;
        if (!bot)
            continue;

        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI || botAI->IsRealPlayer())
            continue;

        LogoutPlayerBot(bot->GetGUID());
    }
}

void PlayerbotMgr::CancelLogout()
{
    Player* master = GetMaster();
    if (!master)
        return;

    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI || botAI->IsRealPlayer())
            continue;

        if (bot->GetSession()->isLogingOut())
        {
            WorldPacket data(CMSG_LOGOUT_CANCEL);
            bot->GetSession()->HandleLogoutCancelOpcode(data);
            botAI->TellMaster("Logout cancelled!");
        }
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin();
         it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI || botAI->IsRealPlayer())
            continue;

        if (botAI->GetMaster() != master)
            continue;

        if (bot->GetSession()->isLogingOut())
        {
            WorldPacket data(CMSG_LOGOUT_CANCEL);
            bot->GetSession()->HandleLogoutCancelOpcode(data);
        }
    }
}

void PlayerbotHolder::LogoutPlayerBot(ObjectGuid guid)
{
    if (Player* bot = GetPlayerBot(guid))
    {
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI)
            return;

        // Queue group cleanup operation for world thread
        // auto cleanupOp = std::make_unique<BotLogoutGroupCleanupOperation>(guid);
        // PlayerbotWorldThreadProcessor::instance().QueueOperation(std::move(cleanupOp));

        LOG_DEBUG("playerbots", "Bot %s logging out", bot->GetName());
        bot->SaveToDB(false, false);

        WorldSession* botWorldSessionPtr = bot->GetSession();
        WorldSession* masterWorldSessionPtr = nullptr;

        if (botWorldSessionPtr->isLogingOut())
            return;

        Player* master = botAI->GetMaster();
        if (master)
            masterWorldSessionPtr = master->GetSession();

        // check for instant logout
        bool logout = botWorldSessionPtr->ShouldLogOut(time(nullptr));

        if (masterWorldSessionPtr && masterWorldSessionPtr->ShouldLogOut(time(nullptr)))
            logout = true;

        if (masterWorldSessionPtr && !masterWorldSessionPtr->GetPlayer())
            logout = true;

        if (bot->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) || bot->HasUnitState(UNIT_STATE_IN_FLIGHT) ||
            botWorldSessionPtr->GetSecurity() >= (AccountTypes)sWorld.getIntConfig(CONFIG_INSTANT_LOGOUT))
        {
            logout = true;
        }

        if (master &&
            (master->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_RESTING) || master->HasUnitState(UNIT_STATE_IN_FLIGHT) ||
             (masterWorldSessionPtr &&
              masterWorldSessionPtr->GetSecurity() >= (AccountTypes)sWorld.getIntConfig(CONFIG_INSTANT_LOGOUT))))
        {
            logout = true;
        }

        TravelTarget* target = nullptr;
        if (botAI->GetAiObjectContext())  // Maybe some day re-write to delate all pointer values.
        {
            target = botAI->GetAiObjectContext()->GetValue<TravelTarget*>("travel target")->Get();
        }

        // Peiru: Allow bots to always instant logout to see if this resolves logout crashes
        logout = true;

        // if no instant logout, request normal logout
        if (!logout)
        {
            if (bot->GetSession()->isLogingOut())
                return;
            else if (bot)
            {
                botAI->TellMaster("I'm logging out!");
                WorldPacket data(CMSG_LOGOUT_REQUEST);
                botWorldSessionPtr->HandleLogoutRequestOpcode(data);
                if (!bot)
                {
                    RemoveFromPlayerbotsMap(guid);
                    delete botWorldSessionPtr;
                    if (target)
                        delete target;
                }
                return;
            }
            else
            {
                RemoveFromPlayerbotsMap(guid);     // deletes bot player ptr inside this WorldSession PlayerBotMap
                delete botWorldSessionPtr;  // finally delete the bot's WorldSession
                if (target)
                    delete target;
            }
            return;
        }  // if instant logout possible, do it
        else if (bot && (logout || !botWorldSessionPtr->isLogingOut()))
        {
            botAI->TellMaster("Goodbye!");
            RemoveFromPlayerbotsMap(guid);                  // deletes bot player ptr inside this WorldSession PlayerBotMap
            botWorldSessionPtr->LogoutPlayer(true);  // this will delete the bot Player object and PlayerbotAI object
            delete botWorldSessionPtr;               // finally delete the bot's WorldSession
        }
    }
}

void PlayerbotHolder::DisablePlayerBot(ObjectGuid guid)
{
    if (Player* bot = GetPlayerBot(guid))
    {
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (!botAI)
        {
            return;
        }
        botAI->TellMaster("Goodbye!");
        bot->StopMoving();
        bot->GetMotionMaster()->Clear();

        Group* group = bot->GetGroup();
        if (group && !bot->InBattleground() && !bot->InBattlegroundQueue() && botAI->HasActivePlayerMaster())
        {
            PlayerbotRepository::instance().Save(botAI);
        }

        LOG_DEBUG("playerbots", "Bot %s logged out", bot->GetName());

        bot->SaveToDB(false, false);

        if (botAI->GetAiObjectContext())  // Maybe some day re-write to delate all pointer values.
        {
            TravelTarget* target = botAI->GetAiObjectContext()->GetValue<TravelTarget*>("travel target")->Get();
            if (target)
                delete target;
        }

        RemoveFromPlayerbotsMap(guid);  // deletes bot player ptr inside this WorldSession PlayerBotMap

        delete botAI;
    }
}

void PlayerbotHolder::RemoveFromPlayerbotsMap(ObjectGuid guid)
{
    playerBots.erase(guid);
}

Player* PlayerbotHolder::GetPlayerBot(ObjectGuid playerGuid) const
{
    PlayerBotMap::const_iterator it = playerBots.find(playerGuid);
    return (it == playerBots.end()) ? 0 : it->second;
}

Player* PlayerbotHolder::GetPlayerBot(uint32 lowGuid) const
{
    ObjectGuid playerGuid(HIGHGUID_PLAYER, lowGuid);
    PlayerBotMap::const_iterator it = playerBots.find(playerGuid);
    return (it == playerBots.end()) ? nullptr : it->second;
}

void PlayerbotHolder::OnBotLogin(Player* const bot)
{
    uint32 pendingMasterAccountId = 0;
    bool expectPlayerMaster = TryGetPendingBotOwner(bot->GetGUID(), pendingMasterAccountId) && pendingMasterAccountId;
    PendingBotInitRequest pendingInitRequest;
    bool hasPendingInitRequest = TryGetPendingBotInitRequest(bot->GetGUID(), pendingInitRequest);

    SetBotLoading(bot->GetGUID(), false);
    ClearPendingBotOwner(bot->GetGUID());
    UnregisterPendingBotSession(bot->GetGUID());

    // Prevent duplicate login
    if (playerBots.find(bot->GetGUID()) != playerBots.end())
    {
        return;
    }

    PlayerbotsMgr::instance().AddPlayerbotData(bot, true);
    playerBots[bot->GetGUID()] = bot;

    if (WorldSession* session = bot->GetSession())
        if (PlayerBotEntry* botEntry = session->GetBot())
            botEntry->state = PB_STATE_ONLINE;

    OnBotLoginInternal(bot);

    // Bots skip normal weapon skill progression, so max all weapon/defense
    // proficiencies to match the bot's current level.
    bot->UpdateSkillsToMaxSkillsForLevel();

    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (!botAI)
    {
        // Log a warning here to indicate that the botAI is null
        LOG_DEBUG("mod-playerbots", "PlayerbotAI is null for bot with GUID: %llu",
                  static_cast<unsigned long long>(bot->GetGUID()));
        return;
    }

    Player* master = GetHolderMaster();
    if (master && botAI->GetMaster() != master)
        botAI->SetMaster(master);
    else if (!master && expectPlayerMaster)
    {
        WorldSession* masterSession = sWorldSessionMgr->FindSession(pendingMasterAccountId);
        Player* pendingMaster = masterSession ? masterSession->GetPlayer() : nullptr;
        if (pendingMaster)
        {
            master = pendingMaster;
            if (botAI->GetMaster() != master)
                botAI->SetMaster(master);
        }
    }
    else if (!master)
        master = botAI->GetMaster();

    Group* group = bot->GetGroup();
    Group* groupInvite = bot->GetGroupInvite();
    ObjectGuid masterGuid;
    if (master)
        masterGuid = master->GetGUID();

    LOG_DEBUG("playerbots",
        "OnBotLogin state: bot=%s guid=%u group_id=%u invite_group_id=%u resolved_master_guid=%u",
        bot->GetName(), bot->GetGUIDLow(), group ? group->GetId() : 0, groupInvite ? groupInvite->GetId() : 0,
        masterGuid ? masterGuid.GetCounter() : 0);

    if (master || expectPlayerMaster)
    {
        if (group && (!master || !group->IsMember(masterGuid)))
        {
            LOG_DEBUG("playerbots",
                "Clearing stale bot group on login: bot=%s guid=%u group_id=%u group_leader_guid=%u resolved_master_guid=%u",
                bot->GetName(), bot->GetGUIDLow(), group->GetId(), group->GetLeaderGuid().GetCounter(),
                masterGuid.GetCounter());
            Player::RemoveFromGroup(group, bot->GetObjectGuid());
            if (bot->GetOriginalGroup() == group)
                bot->SetOriginalGroup(nullptr);
            group = bot->GetGroup();
        }

        groupInvite = bot->GetGroupInvite();
        if (groupInvite && (!master || (!groupInvite->IsMember(masterGuid) && groupInvite->GetLeaderGuid() != masterGuid)))
        {
            LOG_DEBUG("playerbots",
                "Clearing stale bot group invite on login: bot=%s guid=%u invite_group_id=%u invite_leader_guid=%u resolved_master_guid=%u",
                bot->GetName(), bot->GetGUIDLow(), groupInvite->GetId(),
                groupInvite->GetLeaderGuid().GetCounter(), masterGuid.GetCounter());
            bot->UninviteFromGroup();
        }
    }

    if (master && group)
    {
        if (group->IsMember(masterGuid) && !group->IsLeader(masterGuid))
            group->ChangeLeader(masterGuid);
    }

    if (group)
    {
        bool groupValid = false;
        Group::MemberSlotList const& slots = group->GetMemberSlots();
        for (Group::MemberSlotList::const_iterator i = slots.begin(); i != slots.end(); ++i)
        {
            ObjectGuid member = i->guid;
            if (master)
            {
                if (master->GetGUID() == member)
                {
                    groupValid = true;
                    break;
                }

                continue;
            }

            // Don't disband alt groups when master goes away
            // Controlled by config
            if (sPlayerbotAIConfig.KeepAltsInGroup())
            {
                uint32 account = sCharacterCache->GetCharacterAccountIdByGuid(member);
                if (!sPlayerbotAIConfig.IsInRandomAccountList(account))
                {
                    groupValid = true;
                    break;
                }
            }
        }

        if (!groupValid)
        {
            botAI->LeaveOrDisbandGroup();
        }
    }

    group = bot->GetGroup();
    if (group)
    {
        botAI->ResetStrategies();
    }
    else
    {
        botAI->ResetStrategies(!sRandomPlayerbotMgr.IsRandomBot(bot));
    }
    PlayerbotRepository::instance().Load(botAI);

    if (master && !master->HasUnitState(UNIT_STATE_IN_FLIGHT))
    {
        bot->GetMotionMaster()->MovementExpired();
    }

    if (master && master->GetGroup() && !group)
    {
        Group* mgroup = master->GetGroup();
        if (mgroup->GetMembersCount() >= 5)
        {
            if (!mgroup->isRaidGroup() && !mgroup->isBGGroup())
                mgroup->ConvertToRaid();

            if (mgroup->isRaidGroup())
            {
                bool added = mgroup->AddMember(bot->GetGUID(), bot->GetName());
                LOG_INFO("playerbots",
                    "OnBotLogin add to existing raid group: bot=%s(%u) master=%s(%u) groupId=%u added=%u members=%u botGroupPtr=%p",
                    bot->GetName(), bot->GetGUIDLow(), master->GetName(), master->GetGUIDLow(),
                    mgroup->GetId(), added, mgroup->GetMembersCount(), static_cast<void const*>(bot->GetGroup()));
            }
        }
        else
        {
            bool added = mgroup->AddMember(bot->GetGUID(), bot->GetName());
            LOG_INFO("playerbots",
                "OnBotLogin add to existing group: bot=%s(%u) master=%s(%u) groupId=%u added=%u members=%u botGroupPtr=%p",
                bot->GetName(), bot->GetGUIDLow(), master->GetName(), master->GetGUIDLow(),
                mgroup->GetId(), added, mgroup->GetMembersCount(), static_cast<void const*>(bot->GetGroup()));
        }
    }
    else if (master && !group)
    {
        if (!master->GetGroup())
        {
            Group* newGroup = new Group;
            if (newGroup->Create(master->GetGUID(), master->GetName()))
            {
                sObjectMgr.AddGroup(newGroup);
                // Create() already added master as a member in vanilla vMaNGOS,
                // so only add the bot here.
                if (!newGroup->AddMember(bot->GetGUID(), bot->GetName()))
                {
                    // Bot add failed - disband and clean up
                    newGroup->RemoveMember(master->GetGUID(), GROUP_LEAVE);
                    sObjectMgr.RemoveGroup(newGroup);
                    delete newGroup;
                }
                else
                {
                    LOG_INFO("playerbots",
                        "OnBotLogin created new group: bot=%s(%u) master=%s(%u) groupId=%u members=%u botGroupPtr=%p",
                        bot->GetName(), bot->GetGUIDLow(), master->GetName(), master->GetGUIDLow(),
                        newGroup->GetId(), newGroup->GetMembersCount(), static_cast<void const*>(bot->GetGroup()));
                }
            }
            else
            {
                delete newGroup;
            }
        }
        else
        {
            Group* masterGroup = master->GetGroup();
            bool added = masterGroup->AddMember(bot->GetGUID(), bot->GetName());
            LOG_INFO("playerbots",
                "OnBotLogin add to master group: bot=%s(%u) master=%s(%u) groupId=%u added=%u members=%u botGroupPtr=%p",
                bot->GetName(), bot->GetGUIDLow(), master->GetName(), master->GetGUIDLow(),
                masterGroup->GetId(), added, masterGroup->GetMembersCount(), static_cast<void const*>(bot->GetGroup()));
        }
    }

    if (master && master->GetGroup())
    {
        bool liveBound = EnsureLiveBotGroupBinding(master, bot);
        LOG_INFO("playerbots",
            "OnBotLogin post-group state: bot=%s(%u) master=%s(%u) masterGroupId=%u liveBound=%u botGroupPtr=%p groupInvitePtr=%p",
            bot->GetName(), bot->GetGUIDLow(), master->GetName(), master->GetGUIDLow(),
            master->GetGroup()->GetId(), liveBound,
            static_cast<void const*>(bot->GetGroup()),
            static_cast<void const*>(bot->GetGroupInvite()));
    }

    // check activity
    botAI->AllowActivity(ALL_ACTIVITY, true);

    // set delay on login
    botAI->SetNextCheckDelay(urand(2000, 4000));

    botAI->TellMaster("Hello!", PLAYERBOT_SECURITY_TALK);

    if (master && botAI)
    {
        bool needsSummon = (bot->GetMapId() != master->GetMapId()) ||
                           (bot->GetWorldMask() != master->GetWorldMask()) ||
                           (bot->GetDistance(master) > sPlayerbotAIConfig.sightDistance);
        if (needsSummon)
        {
            SummonAction summonAction(botAI, "group summon");
            summonAction.Teleport(master, bot, true, master, "group join");
        }
    }
    // if (master)
    // {
    //     // bot->TeleportTo(master);
    // }
    uint32 accountId = bot->GetSession()->GetAccountId();
    bool isRandomAccount = sPlayerbotAIConfig.IsInRandomAccountList(accountId);

    if (isRandomAccount && sPlayerbotAIConfig.randomBotFixedLevel)
    {
        bot->SetPlayerFlag(PLAYER_FLAGS_NO_XP_GAIN);
    }
    else if (isRandomAccount && !sPlayerbotAIConfig.randomBotFixedLevel)
    {
        bot->RemovePlayerFlag(PLAYER_FLAGS_NO_XP_GAIN);
    }

    bot->SaveToDB(false, false);
    bool addClassBot = sRandomPlayerbotMgr.IsAddclassAccount(accountId);
    bool forceFactoryRandomize =
        hasPendingInitRequest && pendingInitRequest.forceFactoryRandomize && pendingInitRequest.forcedSpecNo >= 0;
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "DIAG OnBotLogin: bot=%s accountId=%u addClassBot=%u master=%p isRandomAccount=%u",
        bot->GetName(), accountId, addClassBot, static_cast<void const*>(master), isRandomAccount);
    if (addClassBot && master)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "DIAG OnBotLogin: bot=%s masterLevel=%u botLevel=%u levelDiff=%d",
            bot->GetName(), master->GetLevel(), bot->GetLevel(), abs((int)master->GetLevel() - (int)bot->GetLevel()));
    }
    if (addClassBot && master && abs((int)master->GetLevel() - (int)bot->GetLevel()) > 3)
    {
        // PlayerbotFactory factory(bot, master->GetLevel());
        // factory.Randomize(false);
        uint32 mixedGearScore =
            PlayerbotAI::GetMixedGearScore(master, true, false, 12) * sPlayerbotAIConfig.autoInitEquipLevelLimitRatio;
        // work around: distinguish from 0 if no gear
        if (mixedGearScore == 0)
            mixedGearScore = 1;
        PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_LEGENDARY, mixedGearScore);
        factory.Randomize(false, forceFactoryRandomize ? pendingInitRequest.forcedSpecNo : -1);
    }
    else if (addClassBot && master)
    {
        PlayerbotFactory factory(bot, bot->GetLevel());
        if (forceFactoryRandomize)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL,
                "DIAG PlayerbotMgr: close-level addrole bot=%s level=%u masterLevel=%u, forcing full Randomize spec=%d",
                bot->GetName(), bot->GetLevel(), master->GetLevel(), pendingInitRequest.forcedSpecNo);
            factory.Randomize(false, pendingInitRequest.forcedSpecNo);
        }
        else
        {
            // Bot is close in level — skip full Randomize but fix spells and ammo
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL,
                "DIAG PlayerbotMgr: close-level addclass bot=%s level=%u masterLevel=%u, calling InitSpells+InitAmmo",
                bot->GetName(), bot->GetLevel(), master->GetLevel());
            factory.InitSkills();
            factory.InitClassSpells();
            factory.InitAvailableSpells();
            factory.InitAmmo();
        }
    }

    // bots join World chat if not solo oriented
    if (bot->GetLevel() >= 10 && sRandomPlayerbotMgr.IsRandomBot(bot) && GET_PLAYERBOT_AI(bot) &&
        GET_PLAYERBOT_AI(bot)->GetGrouperType() != GrouperType::SOLO)
    {
        // TODO make action/config
        // Make the bot join the world channel for chat
        WorldPacket pkt(CMSG_JOIN_CHANNEL);
        pkt << uint32(0) << uint8(0) << uint8(0);
        pkt << std::string("World");
        pkt << "";  // Pass
        bot->GetSession()->HandleJoinChannel(pkt);
    }

    // join standard channels - vMaNGOS channel API is different from Trinity
    // Stubbing for now as this requires significant API adaptation
    /*
    uint8 locale = BroadcastHelper::GetLocale();
    AreaTableEntry const* current_zone = GET_PLAYERBOT_AI(bot)->GetCurrentZone();
    ChannelMgr* cMgr = ChannelMgr::forTeam(bot->GetTeamId());
    ... (original code requires Trinity-specific APIs)
    */
}

std::string const PlayerbotHolder::ProcessBotCommand(std::string const cmd, ObjectGuid guid, ObjectGuid masterguid,
                                                     bool admin, uint32 masterAccountId, uint32 masterGuildId)
{
    if (!sPlayerbotAIConfig.enabled || guid.IsEmpty())
        return "bot system is disabled";

    uint32 botAccount = sCharacterCache->GetCharacterAccountIdByGuid(guid);
    //bool isRandomBot = sRandomPlayerbotMgr.IsRandomBot(guid.GetCounter()); //not used, line marked for removal.
    //bool isRandomAccount = sPlayerbotAIConfig.IsInRandomAccountList(botAccount); //not used, shadowed, line marked for removal.
    //bool isMasterAccount = (masterAccountId == botAccount); //not used, line marked for removal.

    if (cmd == "add" || cmd == "addaccount" || cmd == "login")
    {
        if (ObjectAccessor::FindPlayer(guid))
            return "player already logged in";

        // For addaccount command, verify it's an account name
        if (cmd == "addaccount")
        {
            uint32 accountId = sCharacterCache->GetCharacterAccountIdByGuid(guid);
            if (!accountId)
                return "character not found";

                if (!sPlayerbotAIConfig.allowAccountBots && accountId != masterAccountId &&
                    !(sPlayerbotAIConfig.allowTrustedAccountBots && IsAccountLinked(accountId, masterAccountId)))
                {
                    return "you can only add bots from your own account or linked accounts";
                }
        }

        std::string result = AddPlayerBot(guid, masterAccountId, admin);
        return result.empty() ? "ok" : result;
    }
    else if (cmd == "remove" || cmd == "logout" || cmd == "rm")
    {
        if (!ObjectAccessor::FindPlayer(guid))
            return "player is offline";

        if (!GetPlayerBot(guid))
            return "not your bot";

        LogoutPlayerBot(guid);
        return "ok";
    }

    // if (admin)
    // {
    Player* bot = GetPlayerBot(guid);
    if (!bot)
        bot = sRandomPlayerbotMgr.GetPlayerBot(guid);

    if (!bot)
        return "bot not found";

    bool addClassBot = sRandomPlayerbotMgr.IsAddclassBot(guid.GetCounter());

    if (!addClassBot)
        return "ERROR: You can not use this command on non-addclass bot.";

    if (!admin)
    {
        Player* master = ObjectAccessor::FindConnectedPlayer(masterguid);
        if (master && (master->IsInCombat() || bot->IsInCombat()))
        {
            return "ERROR: You can not use this command during combat.";
        }
    }

    if (GET_PLAYERBOT_AI(bot))
    {
        if (Player* master = GET_PLAYERBOT_AI(bot)->GetMaster())
        {
            if (master->GetSession()->GetSecurity() <= SEC_PLAYER && sPlayerbotAIConfig.autoInitOnly &&
                cmd != "init=auto")
            {
                return "The command is not allowed, use init=auto instead.";
            }

            //  Use boot guard
            BotInitGuard guard(bot->GetGUID());
            if (guard.IsLocked())
            {
                return "Initialization already in progress, please wait.";
            }

            int gs;
            if (cmd == "init=white" || cmd == "init=common")
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_NORMAL);
                factory.Randomize(false);
                return "ok";
            }
            else if (cmd == "init=green" || cmd == "init=uncommon")
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_UNCOMMON);
                factory.Randomize(false);
                return "ok";
            }
            else if (cmd == "init=blue" || cmd == "init=rare")
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_RARE);
                factory.Randomize(false);
                return "ok";
            }
            else if (cmd == "init=epic" || cmd == "init=purple")
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_EPIC);
                factory.Randomize(false);
                return "ok";
            }
            else if (cmd == "init=legendary" || cmd == "init=yellow")
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_LEGENDARY);
                factory.Randomize(false);
                return "ok";
            }
            else if (cmd == "init=auto")
            {
                uint32 mixedGearScore = PlayerbotAI::GetMixedGearScore(master, true, false, 12) *
                                        sPlayerbotAIConfig.autoInitEquipLevelLimitRatio;
                // work around: distinguish from 0 if no gear
                if (mixedGearScore == 0)
                    mixedGearScore = 1;
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_LEGENDARY, mixedGearScore);
                factory.Randomize(false);
                return "ok, gear score limit: " + std::to_string(mixedGearScore / PlayerbotAI::GetItemScoreMultiplier(ItemQualities(ITEM_QUALITY_EPIC))) +
                       "(for epic)";
            }
            else if (cmd.starts_with("init=") && sscanf(cmd.c_str(), "init=%d", &gs) != -1)
            {
                PlayerbotFactory factory(bot, master->GetLevel(), ITEM_QUALITY_LEGENDARY, gs);
                factory.Randomize(false);
                return "ok, gear score limit: " + std::to_string(gs / PlayerbotAI::GetItemScoreMultiplier(ItemQualities(ITEM_QUALITY_EPIC))) + "(for epic)";
            }
        }

        if (cmd == "refresh=raid")
        {  // TODO: This function is not perfect yet. If you are already in a raid,
            // after the command is executed, the AI ​​needs to go back online or exit the raid and re-enter.
            PlayerbotFactory factory(bot, bot->GetLevel());
            factory.UnbindInstance();
            return "ok";
        }
    }

    if (cmd == "levelup" || cmd == "level")
    {
        PlayerbotFactory factory(bot, bot->GetLevel());
        factory.Randomize(true);
        return "ok";
    }
    else if (cmd == "refresh")
    {
        PlayerbotFactory factory(bot, bot->GetLevel());
        factory.Refresh();
        return "ok";
    }
    else if (cmd == "random")
    {
        sRandomPlayerbotMgr.Randomize(bot);
        return "ok";
    }
    else if (cmd == "quests")
    {
        PlayerbotFactory factory(bot, bot->GetLevel());
        factory.InitInstanceQuests();
        return "Initialization quests";
    }
    // }

    return "unknown command";
}

// Added for gender choice : Returns the gender of an offline character: 0 = male, 1 = female.
static uint8 GetOfflinePlayerGender(ObjectGuid guid)
{
    auto result = PB_QueryFormat(CharacterDatabase,
        "SELECT gender FROM characters WHERE guid = {}", guid.GetCounter());

    if (result)
        return (*result)[0].GetUInt8();       // 0 = male, 1 = female

    return GENDER_MALE;                         // fallback value
}

bool PlayerbotMgr::HandlePlayerbotMgrCommand(ChatHandler* handler, char const* args)
{
    if (!sPlayerbotAIConfig.enabled)
    {
        handler->PSendSysMessage("|cffff0000Playerbot system is currently disabled!");
        return false;
    }

    WorldSession* m_session = handler->GetSession();
    if (!m_session)
    {
        handler->PSendSysMessage("You may only add bots from an active session");
        return false;
    }

    Player* player = m_session->GetPlayer();
    PlayerbotMgr* mgr = GET_PLAYERBOT_MGR(player);
    if (!mgr)
    {
        handler->PSendSysMessage("You cannot control bots yet");
        return false;
    }

    std::vector<std::string> messages = mgr->HandlePlayerbotCommand(args, player);
    if (messages.empty())
        return true;

    for (std::vector<std::string>::iterator i = messages.begin(); i != messages.end(); ++i)
    {
        handler->PSendSysMessage("%s", i->c_str());
    }

    return true;
}

std::vector<std::string> PlayerbotHolder::HandlePlayerbotCommand(char const* args, Player* master)
{
    std::vector<std::string> messages;

    auto const collectAvailableAddclassGuids = [&](uint8 claz, int8 gender) -> std::vector<ObjectGuid>
    {
        std::vector<ObjectGuid> availableGuids;
        uint8 teamId = master->GetTeamId();
        auto const& guidCache =
            sRandomPlayerbotMgr.addclassCache[RandomPlayerbotMgr::GetTeamClassIdx(teamId == TEAM_ALLIANCE, claz)];

        for (ObjectGuid const& guid : guidCache)
        {
            if (gender != -1 && GetOfflinePlayerGender(guid) != gender)
                continue;
            if (IsBotLoadingGuid(guid))
                continue;
            if (ObjectAccessor::FindConnectedPlayer(guid))
                continue;

            uint32 guildId = sCharacterCache->GetCharacterGuildIdByGuid(guid);
            if (guildId && PlayerbotGuildMgr::instance().IsRealGuild(guildId))
                continue;

            availableGuids.push_back(guid);
        }

        return availableGuids;
    };

    if (!*args)
    {
        messages.push_back("usage: list/reload/tweak/self or add/addaccount/init/remove PLAYERNAME\n");
        messages.push_back("usage: addclass CLASSNAME [male|female|0|1]");
        messages.push_back(kAddRoleUsage);
        return messages;
    }

    char* cmd = strtok((char*)args, " ");
    char* charname = strtok(nullptr, " ");
    char* genderArg = strtok(nullptr, " ");    // Added for gender choice [male|female|0|1] optionnel

    if (!cmd)
    {
        messages.push_back(
            "usage: list/reload/tweak/self or add/init/remove PLAYERNAME or addclass CLASSNAME [male|female] or addrole ROLE [male|female]");
        return messages;
    }

    if (!strcmp(cmd, "initself"))
    {
        if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
        {
            // OnBotLogin(master);
            PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_EPIC);
            factory.Randomize(false);
            messages.push_back("initself ok");
            return messages;
        }
        else
        {
            messages.push_back("ERROR: Only GM can use this command.");
            return messages;
        }
    }

    if (!strncmp(cmd, "initself=", 9))
    {
        if (!strcmp(cmd, "initself=uncommon"))
        {
            if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
            {
                // OnBotLogin(master);
                PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_UNCOMMON);
                factory.Randomize(false);
                messages.push_back("initself ok");
                return messages;
            }
            else
            {
                messages.push_back("ERROR: Only GM can use this command.");
                return messages;
            }
        }
        if (!strcmp(cmd, "initself=rare"))
        {
            if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
            {
                // OnBotLogin(master);
                PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_RARE);
                factory.Randomize(false);
                messages.push_back("initself ok");
                return messages;
            }
            else
            {
                messages.push_back("ERROR: Only GM can use this command.");
                return messages;
            }
        }
        if (!strcmp(cmd, "initself=epic"))
        {
            if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
            {
                // OnBotLogin(master);
                PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_EPIC);
                factory.Randomize(false);
                messages.push_back("initself ok");
                return messages;
            }
            else
            {
                messages.push_back("ERROR: Only GM can use this command.");
                return messages;
            }
        }
        if (!strcmp(cmd, "initself=legendary"))
        {
            if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
            {
                // OnBotLogin(master);
                PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_LEGENDARY);
                factory.Randomize(false);
                messages.push_back("initself ok");
                return messages;
            }
            else
            {
                messages.push_back("ERROR: Only GM can use this command.");
                return messages;
            }
        }
        int32 gs;
        if (sscanf(cmd, "initself=%d", &gs) != -1)
        {
            if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
            {
                // OnBotLogin(master);
                PlayerbotFactory factory(master, master->GetLevel(), ITEM_QUALITY_LEGENDARY, gs);
                factory.Randomize(false);
                messages.push_back("initself ok, gs = " + std::to_string(gs));
                return messages;
            }
            else
            {
                messages.push_back("ERROR: Only GM can use this command.");
                return messages;
            }
        }
    }

    if (!strcmp(cmd, "list"))
    {
        messages.push_back(ListBots(master));
        return messages;
    }

    if (!strcmp(cmd, "reload"))
    {
        if (master->GetSession()->GetSecurity() >= SEC_GAMEMASTER)
        {
            sPlayerbotAIConfig.Initialize();
            messages.push_back("Config reloaded.");
            return messages;
        }
        else
        {
            messages.push_back("ERROR: Only GM can use this command.");
            return messages;
        }
    }

    if (!strcmp(cmd, "tweak"))
    {
        sPlayerbotAIConfig.tweakValue = sPlayerbotAIConfig.tweakValue++;
        if (sPlayerbotAIConfig.tweakValue > 2)
            sPlayerbotAIConfig.tweakValue = 0;

        messages.push_back("Set tweakvalue to " + std::to_string(sPlayerbotAIConfig.tweakValue));
        return messages;
    }

    if (!strcmp(cmd, "self"))
    {
        if (GET_PLAYERBOT_AI(master))
        {
            messages.push_back("Disable player botAI");
            delete GET_PLAYERBOT_AI(master);
        }
        else if (sPlayerbotAIConfig.selfBotLevel == 0)
            messages.push_back("Self-bot is disabled");
        else if (sPlayerbotAIConfig.selfBotLevel == 1 && master->GetSession()->GetSecurity() < SEC_GAMEMASTER)
            messages.push_back("You do not have permission to enable player botAI");
        else
        {
            messages.push_back("Enable player botAI");
            PlayerbotsMgr::instance().AddPlayerbotData(master, true);
            GET_PLAYERBOT_AI(master)->SetMaster(master);
        }

        return messages;
    }

    if (!strcmp(cmd, "lookup"))
    {
        messages.push_back(LookupBots(master));
        return messages;
    }

    if (!strcmp(cmd, "online"))
    {
        uint32 const accountBotCount = GetOnlineAccountBotCount();
        uint32 const randomBotCount = sRandomPlayerbotMgr.GetPlayerbotsCount();
        uint32 const totalBotCount = accountBotCount + randomBotCount;

        std::ostringstream out;
        out << "Online bots: " << totalBotCount
            << " (account: " << accountBotCount
            << ", random: " << randomBotCount << ")";

        messages.push_back(out.str());
        return messages;
    }

    if (!strcmp(cmd, "addclass"))
    {
        if (sPlayerbotAIConfig.addClassCommand == 0 && master->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        {
            messages.push_back("You do not have permission to create bot by addclass command");
            return messages;
        }
        if (!charname)
        {
            messages.push_back(
                "addclass: invalid CLASSNAME(warrior/paladin/hunter/rogue/priest/shaman/mage/warlock/druid/dk)");
            return messages;
        }
        uint8 claz = 0;
        if (!TryParseClassName(charname, claz))
        {
            messages.push_back("Error: Invalid Class. Try again.");
            return messages;
        }
        int8 gender = -1;
        std::string genderError;
        if (!TryParseGender(genderArg, gender, genderError))
        {
            messages.push_back(genderError);
            return messages;
        }

        if (claz == 6 && master->GetLevel() < sWorld.getIntConfig(CONFIG_START_HEROIC_PLAYER_LEVEL))
        {
            messages.push_back("Your level is too low to summon Deathknight");
            return messages;
        }
        for (ObjectGuid const& guid : collectAvailableAddclassGuids(claz, gender))
        {
            AddPlayerBot(guid, master->GetSession()->GetAccountId());
            messages.push_back("Add class " + std::string(charname));
            return messages;
        }
        messages.push_back("Add class failed, no available characters!");
        return messages;
    }

    if (!strcmp(cmd, "addrole"))
    {
        if (sPlayerbotAIConfig.addClassCommand == 0 && master->GetSession()->GetSecurity() < SEC_GAMEMASTER)
        {
            messages.push_back("You do not have permission to create bot by addrole command");
            return messages;
        }
        if (!charname)
        {
            messages.push_back("addrole: invalid ROLE (" + std::string(kAddRoleList) + ")");
            messages.push_back(kAddRoleUsage);
            return messages;
        }

        std::string role = charname;
        std::transform(role.begin(), role.end(), role.begin(), ::tolower);

        std::vector<RoleSpecCandidate> roleCandidates = GetRoleCandidates(role);
        if (roleCandidates.empty())
        {
            messages.push_back("addrole: invalid ROLE (" + std::string(kAddRoleList) + ")");
            messages.push_back(kAddRoleUsage);
            return messages;
        }

        int8 gender = -1;
        std::string genderError;
        if (!TryParseGender(genderArg, gender, genderError))
        {
            messages.push_back(genderError);
            return messages;
        }

        struct AvailableRoleCandidate
        {
            RoleSpecCandidate candidate;
            std::vector<ObjectGuid> guids;
        };

        std::unordered_map<uint8, std::vector<ObjectGuid>> classAvailability;
        std::vector<AvailableRoleCandidate> availableCandidates;
        for (RoleSpecCandidate const& candidate : roleCandidates)
        {
            auto itr = classAvailability.find(candidate.classId);
            if (itr == classAvailability.end())
            {
                itr = classAvailability.emplace(candidate.classId, collectAvailableAddclassGuids(candidate.classId, gender)).first;
            }

            if (itr->second.empty())
                continue;

            availableCandidates.push_back({candidate, itr->second});
        }

        if (availableCandidates.empty())
        {
            messages.push_back("Add role failed, no available characters!");
            return messages;
        }

        AvailableRoleCandidate const& chosenCandidate = availableCandidates[urand(0, availableCandidates.size() - 1)];
        ObjectGuid chosenGuid = chosenCandidate.guids[urand(0, chosenCandidate.guids.size() - 1)];

        PendingBotInitRequest request;
        request.forceFactoryRandomize = true;
        request.forcedSpecNo = chosenCandidate.candidate.specNo;
        SetPendingBotInitRequest(chosenGuid, request);

        std::string addResult = AddPlayerBot(chosenGuid, master->GetSession()->GetAccountId());
        if (!addResult.empty())
        {
            ClearPendingBotInitRequest(chosenGuid);
            messages.push_back("Add role failed: " + addResult);
            return messages;
        }

        messages.push_back("Add role " + role + ": " +
            FormatClassSpec(chosenCandidate.candidate.classId, chosenCandidate.candidate.specNo));
        return messages;
    }

    std::string charnameStr;

    if (!charname)
    {
        std::string name;
        bool isPlayer = sCharacterCache->GetCharacterNameByGuid(master->GetTarget(), name);
        // Player* tPlayer = ObjectAccessor::FindConnectedPlayer(master->GetTarget());
        if (isPlayer)
        {
            charnameStr = name;
        }
        else
        {
            messages.push_back("usage: list/reload/tweak/self or add/init/remove PLAYERNAME");
            return messages;
        }
    }
    else
    {
        charnameStr = charname;
    }

    std::string const cmdStr = cmd;

    std::unordered_set<std::string> bots;
    if (charnameStr == "*" && master)
    {
        Group* group = master->GetGroup();
        if (!group)
        {
            messages.push_back("you must be in group");
            return messages;
        }

        Group::MemberSlotList slots = group->GetMemberSlots();
        for (Group::member_citerator i = slots.begin(); i != slots.end(); i++)
        {
            ObjectGuid member = i->guid;

            if (member == ObjectGuid(master->GetGUID()))
                continue;

            std::string bot;
            if (sCharacterCache->GetCharacterNameByGuid(member, bot))
                bots.insert(bot);
        }
    }

    if (charnameStr == "!" && master && master->GetSession()->GetSecurity() > SEC_GAMEMASTER)
    {
        for (PlayerBotMap::const_iterator i = GetPlayerBotsBegin(); i != GetPlayerBotsEnd(); ++i)
        {
            if (Player* bot = i->second)
                if (bot->IsInWorld())
                    bots.insert(bot->GetName());
        }
    }

    std::vector<std::string> chars = split(charnameStr, ',');
    for (std::vector<std::string>::iterator i = chars.begin(); i != chars.end(); i++)
    {
        std::string const s = *i;

        if (!strcmp(cmd, "addaccount"))
        {
            // When using addaccount, first try to get account ID directly
            uint32 accountId = GetAccountId(s);
            if (!accountId)
            {
                // If not found, try to get account ID from character name
                ObjectGuid charGuid = sCharacterCache->GetCharacterGuidByName(s);
                if (!charGuid)
                {
                    messages.push_back("Neither account nor character '" + s + "' found");
                    continue;
                }
                accountId = sCharacterCache->GetCharacterAccountIdByGuid(charGuid);
                if (!accountId)
                {
                    messages.push_back("Could not find account for character '" + s + "'");
                    continue;
                }
            }

            auto results = PB_QueryFormat(CharacterDatabase, "SELECT name FROM characters WHERE account = {}", accountId);
            if (results)
            {
                do
                {
                    Field* fields = results->Fetch();
                    std::string const charName = fields[0].GetCppString();
                    bots.insert(charName);
                } while (results->NextRow());
            }
        }
        else
        {
            // For regular add command, only add the specific character
            ObjectGuid charGuid = sCharacterCache->GetCharacterGuidByName(s);
            if (!charGuid)
            {
                messages.push_back("Character '" + s + "' not found");
                continue;
            }
            bots.insert(s);
        }
    }

    for (auto i = bots.begin(); i != bots.end(); ++i)
    {
        std::string const bot = *i;

        std::ostringstream out;
        out << cmdStr << ": " << bot << " - ";

        ObjectGuid member = sCharacterCache->GetCharacterGuidByName(bot);
        if (!member)
        {
            out << "character not found";
        }
        else if (master && member != ObjectGuid(master->GetGUID()))
        {
            out << ProcessBotCommand(cmdStr, member, master->GetGUID(),
                                     master->GetSession()->GetSecurity() >= SEC_GAMEMASTER,
                                     master->GetSession()->GetAccountId(), master->GetGuildId());
        }
        else if (!master)
        {
            out << ProcessBotCommand(cmdStr, member, ObjectGuid::Empty, true, -1, -1);
        }

        messages.push_back(out.str());
    }

    return messages;
}

uint32 PlayerbotHolder::GetAccountId(std::string const name) { return sAccountMgr.GetId(name); }

uint32 PlayerbotHolder::GetAccountId(ObjectGuid guid)
{
    if (!guid.IsPlayer())
        return 0;

    // prevent DB access for online player
    if (Player* player = ObjectAccessor::FindConnectedPlayer(guid))
        return player->GetSession()->GetAccountId();

    uint32 lowguid = guid.GetCounter();

    auto result = PB_QueryFormat(CharacterDatabase, "SELECT account FROM characters WHERE guid = {}", lowguid);
    if (result)
    {
        uint32 acc = (*result)[0].GetUInt32();
        return acc;
    }

    return 0;
}

std::string const PlayerbotHolder::ListBots(Player* master)
{
    std::set<std::string> bots;
    std::map<uint8, std::string> classNames;

    classNames[CLASS_DEATH_KNIGHT] = "Death Knight";
    classNames[CLASS_DRUID] = "Druid";
    classNames[CLASS_HUNTER] = "Hunter";
    classNames[CLASS_MAGE] = "Mage";
    classNames[CLASS_PALADIN] = "Paladin";
    classNames[CLASS_PRIEST] = "Priest";
    classNames[CLASS_ROGUE] = "Rogue";
    classNames[CLASS_SHAMAN] = "Shaman";
    classNames[CLASS_WARLOCK] = "Warlock";
    classNames[CLASS_WARRIOR] = "Warrior";
    classNames[CLASS_DEATH_KNIGHT] = "DeathKnight";

    std::map<std::string, std::string> online;
    std::vector<std::string> names;
    std::map<std::string, std::string> classes;

    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        std::string const name = bot->GetName();
        bots.insert(name);

        names.push_back(name);
        online[name] = "+";
        classes[name] = classNames[bot->getClass()];
    }

    if (master)
    {
        auto results = PB_QueryFormat(CharacterDatabase, "SELECT class, name FROM characters WHERE account = {}",
                                                       master->GetSession()->GetAccountId());
        if (results)
        {
            do
            {
                Field* fields = results->Fetch();
                uint8 cls = fields[0].GetUInt8();
                std::string const name = fields[1].GetCppString();
                if (bots.find(name) == bots.end() && name != master->GetSession()->GetPlayerName())
                {
                    names.push_back(name);
                    online[name] = "-";
                    classes[name] = classNames[cls];
                }
            } while (results->NextRow());
        }
    }

    std::sort(names.begin(), names.end());

    if (Group* group = master->GetGroup())
    {
        Group::MemberSlotList const& groupSlot = group->GetMemberSlots();
        for (Group::member_citerator itr = groupSlot.begin(); itr != groupSlot.end(); itr++)
        {
            Player* member = ObjectAccessor::FindPlayer(itr->guid);
            if (member && sRandomPlayerbotMgr.IsRandomBot(member))
            {
                std::string const name = member->GetName();

                names.push_back(name);
                online[name] = "+";
                classes[name] = classNames[member->getClass()];
            }
        }
    }

    std::ostringstream out;
    bool first = true;
    out << "Bot roster: ";
    for (std::vector<std::string>::iterator i = names.begin(); i != names.end(); ++i)
    {
        if (first)
            first = false;
        else
            out << ", ";

        std::string const name = *i;
        out << online[name] << name << " " << classes[name];
    }

    return out.str();
}

std::string const PlayerbotHolder::LookupBots(Player* master)
{
    std::list<std::string> messages;
    messages.push_back("Classes Available:");
    messages.push_back("|TInterface\\icons\\INV_Sword_27.png:25:25:0:-1|t Warrior");
    messages.push_back("|TInterface\\icons\\INV_Hammer_01.png:25:25:0:-1|t Paladin");
    messages.push_back("|TInterface\\icons\\INV_Weapon_Bow_07.png:25:25:0:-1|t Hunter");
    messages.push_back("|TInterface\\icons\\INV_ThrowingKnife_04.png:25:25:0:-1|t Rogue");
    messages.push_back("|TInterface\\icons\\INV_Staff_30.png:25:25:0:-1|t Priest");
    messages.push_back("|TInterface\\icons\\inv_jewelry_talisman_04.png:25:25:0:-1|t Shaman");
    messages.push_back("|TInterface\\icons\\INV_staff_30.png:25:25:0:-1|t Mage");
    messages.push_back("|TInterface\\icons\\INV_staff_30.png:25:25:0:-1|t Warlock");
    messages.push_back("|TInterface\\icons\\Ability_Druid_Maul.png:25:25:0:-1|t Druid");
    messages.push_back("DK");
    messages.push_back("(Usage: .bot lookup CLASS)");
    std::string ret_msg;
    for (std::string msg : messages)
    {
        ret_msg += msg + "\n";
    }
    return ret_msg;
}

uint32 PlayerbotHolder::GetPlayerbotsCountByClass(uint32 cls)
{
    uint32 count = 0;
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (bot && bot->IsInWorld() && bot->getClass() == cls)
        {
            count++;
        }
    }
    return count;
}

PlayerbotMgr::PlayerbotMgr(Player* const master) : PlayerbotHolder(), master(master), lastErrorTell(0) {}

PlayerbotMgr::~PlayerbotMgr()
{
    if (master)
        PlayerbotsMgr::instance().RemovePlayerBotData(master->GetGUID(), false);
}

void PlayerbotMgr::UpdateAIInternal(uint32 elapsed, bool /*minimal*/)
{
    SetNextCheckDelay(sPlayerbotAIConfig.reactDelay);
    CheckTellErrors(elapsed);
}

void PlayerbotMgr::HandleCommand(uint32 type, std::string const text)
{
    Player* master = GetMaster();
    if (!master)
        return;

    if (text.find(sPlayerbotAIConfig.commandSeparator) != std::string::npos)
    {
        std::vector<std::string> commands;
        split(commands, text, sPlayerbotAIConfig.commandSeparator.c_str());
        for (std::vector<std::string>::iterator i = commands.begin(); i != commands.end(); ++i)
        {
            HandleCommand(type, *i);
        }

        return;
    }

    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI)
            botAI->HandleCommand(type, text, master);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin();
         it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI && botAI->GetMaster() == master)
            botAI->HandleCommand(type, text, master);
    }
}

void PlayerbotMgr::HandleMasterIncomingPacket(WorldPacket const& packet)
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (!bot)
            continue;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI)
            botAI->HandleMasterIncomingPacket(packet);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin();
         it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI && botAI->GetMaster() == GetMaster())
            botAI->HandleMasterIncomingPacket(packet);
    }

    switch (packet.GetOpcode())
    {
        // if master is logging out, log out all bots
        case CMSG_LOGOUT_REQUEST:
        {
            LogoutAllBots();
            break;
        }
        // if master cancelled logout, cancel too
        case CMSG_LOGOUT_CANCEL:
        {
            CancelLogout();
            break;
        }
    }
}

void PlayerbotMgr::HandleMasterOutgoingPacket(WorldPacket const& packet)
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI)
            botAI->HandleMasterOutgoingPacket(packet);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin();
         it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
        if (botAI && botAI->GetMaster() == GetMaster())
            botAI->HandleMasterOutgoingPacket(packet);
    }
}

void PlayerbotMgr::SaveToDB()
{
    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        bot->SaveToDB(false, false);
    }

    for (PlayerBotMap::const_iterator it = sRandomPlayerbotMgr.GetPlayerBotsBegin();
         it != sRandomPlayerbotMgr.GetPlayerBotsEnd(); ++it)
    {
        Player* const bot = it->second;
        if (GET_PLAYERBOT_AI(bot) && GET_PLAYERBOT_AI(bot)->GetMaster() == GetMaster())
            bot->SaveToDB(false, false);
    }
}

void PlayerbotMgr::OnBotLoginInternal(Player* const bot)
{
    PlayerbotAI* botAI = GET_PLAYERBOT_AI(bot);
    if (!botAI)
    {
        return;
    }
    botAI->SetMaster(master);
    botAI->ResetStrategies();

    LOG_INFO("playerbots", "Bot %s logged in", bot->GetName());
}

Player* PlayerbotMgr::GetHolderMaster() const
{
    return master;
}

void PlayerbotMgr::OnPlayerLogin(Player* player)
{
    if (!player)
        return;

    WorldSession* session = player->GetSession();
    if (!session)
    {
        LOG_WARN("playerbots", "Unable to register locale priority for player %s because the session is missing",
                 player->GetName());
        return;
    }

    int dbLocaleIdx = session->GetSessionDbLocaleIndex();
    LocaleConstant usedLocale = dbLocaleIdx < 0 ? LOCALE_enUS : sObjectMgr.GetLocaleForIndex(dbLocaleIdx);
    if (usedLocale >= MAX_LOCALES)
        usedLocale = LOCALE_enUS;

    // set locale priority for bot texts
    PlayerbotTextMgr::instance().AddLocalePriority(usedLocale);

    if (sPlayerbotAIConfig.selfBotLevel > 2)
        HandlePlayerbotCommand("self", player);

    if (!sPlayerbotAIConfig.botAutologin)
        return;

    uint32 accountId = session->GetAccountId();
    std::unique_ptr<QueryResult> results = CharacterDatabase.PQuery("SELECT name FROM characters WHERE account = %u", accountId);
    if (results)
    {
        std::ostringstream out;
        out << "add ";
        bool first = true;
        do
        {
            Field* fields = results->Fetch();

            if (first)
                first = false;
            else
                out << ",";

            out << fields[0].GetCppString();
        } while (results->NextRow());

        HandlePlayerbotCommand(out.str().c_str(), player);
    }
}

void PlayerbotMgr::TellError(std::string const botName, std::string const text)
{
    std::set<std::string> names = errors[text];
    if (names.find(botName) == names.end())
    {
        names.insert(botName);
    }

    errors[text] = names;
}

void PlayerbotMgr::CheckTellErrors(uint32 elapsed)
{
    time_t now = time(nullptr);
    if ((now - lastErrorTell) < sPlayerbotAIConfig.errorDelay / 1000)
        return;

    lastErrorTell = now;

    for (PlayerBotErrorMap::iterator i = errors.begin(); i != errors.end(); ++i)
    {
        std::string const text = i->first;
        std::set<std::string> names = i->second;

        std::ostringstream out;
        bool first = true;
        for (std::set<std::string>::iterator j = names.begin(); j != names.end(); ++j)
        {
            if (!first)
                out << ", ";
            else
                first = false;

            out << *j;
        }

        out << "|cfff00000: " << text;

        ChatHandler(master->GetSession()).PSendSysMessage(out.str().c_str());
    }

    errors.clear();
}

void PlayerbotsMgr::AddPlayerbotData(Player* player, bool isBotAI)
{
    if (!player)
    {
        return;
    }
    // If the guid already exists in the map, remove it

    if (!isBotAI)
    {
        std::unordered_map<ObjectGuid, PlayerbotAIBase*>::iterator itr = _playerbotsMgrMap.find(player->GetGUID());
        if (itr != _playerbotsMgrMap.end())
        {
            if (!itr->second->IsBotAI())
            {
                PlayerbotMgr* playerbotMgr = reinterpret_cast<PlayerbotMgr*>(itr->second);
                playerbotMgr->SetMaster(player);
                playerbotMgr->OnPlayerLogin(player);
                return;
            }

            _playerbotsMgrMap.erase(itr);
        }
        PlayerbotMgr* playerbotMgr = new PlayerbotMgr(player);
        ASSERT(_playerbotsMgrMap.emplace(player->GetGUID(), playerbotMgr).second);

        playerbotMgr->OnPlayerLogin(player);
    }
    else
    {
        std::unordered_map<ObjectGuid, PlayerbotAIBase*>::iterator itr = _playerbotsAIMap.find(player->GetGUID());
        if (itr != _playerbotsAIMap.end())
        {
            _playerbotsAIMap.erase(itr);
        }
        PlayerbotAI* botAI = new PlayerbotAI(player);
        ASSERT(_playerbotsAIMap.emplace(player->GetGUID(), botAI).second);
    }
}

void PlayerbotsMgr::RemovePlayerBotData(ObjectGuid const& guid, bool is_AI)
{
    if (is_AI)
    {
        std::unordered_map<ObjectGuid, PlayerbotAIBase*>::iterator itr = _playerbotsAIMap.find(guid);
        if (itr != _playerbotsAIMap.end())
        {
            _playerbotsAIMap.erase(itr);
        }
    }
    else
    {
        std::unordered_map<ObjectGuid, PlayerbotAIBase*>::iterator itr = _playerbotsMgrMap.find(guid);
        if (itr != _playerbotsMgrMap.end())
        {
            _playerbotsMgrMap.erase(itr);
        }
    }
}

PlayerbotAI* PlayerbotsMgr::GetPlayerbotAI(Player* player)
{
    if (!sPlayerbotAIConfig.enabled || !IsPlayerbotLookupSafe(player))
    {
        return nullptr;
    }

    auto itr = _playerbotsAIMap.find(player->GetGUID());
    if (itr != _playerbotsAIMap.end())
    {
        if (itr->second->IsBotAI())
            return reinterpret_cast<PlayerbotAI*>(itr->second);
    }

    return nullptr;
}

PlayerbotMgr* PlayerbotsMgr::GetPlayerbotMgr(Player* player)
{
    if (!sPlayerbotAIConfig.enabled || !IsPlayerbotLookupSafe(player))
    {
        return nullptr;
    }

    auto itr = _playerbotsMgrMap.find(player->GetGUID());
    if (itr != _playerbotsMgrMap.end())
    {
        if (!itr->second->IsBotAI())
            return reinterpret_cast<PlayerbotMgr*>(itr->second);
    }

    return nullptr;
}

void PlayerbotMgr::HandleSetSecurityKeyCommand(Player* player, const std::string& key)
{
    uint32 accountId = player->GetSession()->GetAccountId();

    // Hash the security key using SHA-256
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)key.c_str(), key.size(), hash);

    // Convert the hash to a hexadecimal string
    std::ostringstream hashedKey;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; ++i)
        hashedKey << std::hex << std::setw(2) << std::setfill('0') << (int)hash[i];

    // Store the hashed key in the database
    PlayerbotsDatabase.PExecute(
        "REPLACE INTO playerbots_account_keys (account_id, security_key) VALUES (%u, '%s')",
        accountId, hashedKey.str().c_str());

    ChatHandler(player->GetSession()).PSendSysMessage("Security key set successfully.");
}

void PlayerbotMgr::HandleLinkAccountCommand(Player* player, const std::string& accountName, const std::string& key)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", accountName.c_str());
    if (!result)
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Account not found.");
        return;
    }

    Field* fields = result->Fetch();
    uint32 linkedAccountId = fields[0].GetUInt32();

    result = PB_QueryFormat(CharacterDatabase,
        "SELECT security_key FROM playerbots_account_keys WHERE account_id = %u", linkedAccountId);
    if (!result)
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Invalid security key.");
        return;
    }

    // Hash the provided key
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)key.c_str(), key.size(), hash);

    // Convert the hash to a hexadecimal string
    std::ostringstream hashedKey;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; ++i)
        hashedKey << std::hex << std::setw(2) << std::setfill('0') << (int)hash[i];

    // Compare the hashed key with the stored hashed key
    std::string storedKey = result->Fetch()[0].GetCppString();
    if (hashedKey.str() != storedKey)
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Invalid security key.");
        return;
    }

    uint32 accountId = player->GetSession()->GetAccountId();
    PlayerbotsDatabase.PExecute(
        "INSERT IGNORE INTO playerbots_account_links (account_id, linked_account_id) VALUES (%u, %u)",
        accountId, linkedAccountId);
    PlayerbotsDatabase.PExecute(
        "INSERT IGNORE INTO playerbots_account_links (account_id, linked_account_id) VALUES (%u, %u)",
        linkedAccountId, accountId);

    ChatHandler(player->GetSession()).PSendSysMessage("Account linked successfully.");
}

void PlayerbotMgr::HandleViewLinkedAccountsCommand(Player* player)
{
    uint32 accountId = player->GetSession()->GetAccountId();
    std::unique_ptr<QueryResult> result = PB_QueryFormat(CharacterDatabase,
        "SELECT linked_account_id FROM playerbots_account_links WHERE account_id = %u", accountId);

    if (!result)
    {
        ChatHandler(player->GetSession()).PSendSysMessage("No linked accounts.");
        return;
    }

    ChatHandler(player->GetSession()).PSendSysMessage("Linked accounts:");
    do
    {
        Field* fields = result->Fetch();
        uint32 linkedAccountId = fields[0].GetUInt32();

        std::unique_ptr<QueryResult> accountResult = PB_QueryFormat(LoginDatabase,
            "SELECT username FROM account WHERE id = %u", linkedAccountId);
        if (accountResult)
        {
            Field* accountFields = accountResult->Fetch();
            std::string username = accountFields[0].GetCppString();
            ChatHandler(player->GetSession()).PSendSysMessage("- %s", username.c_str());
        }
        else
        {
            ChatHandler(player->GetSession()).PSendSysMessage("- Unknown account");
        }
    } while (result->NextRow());
}

void PlayerbotMgr::HandleUnlinkAccountCommand(Player* player, const std::string& accountName)
{
    std::unique_ptr<QueryResult> result = PB_QueryFormat(LoginDatabase,
        "SELECT id FROM account WHERE username = '%s'", accountName.c_str());
    if (!result)
    {
        ChatHandler(player->GetSession()).PSendSysMessage("Account not found.");
        return;
    }

    Field* fields = result->Fetch();
    uint32 linkedAccountId = fields[0].GetUInt32();
    uint32 accountId = player->GetSession()->GetAccountId();

    PlayerbotsDatabase.PExecute("DELETE FROM playerbots_account_links WHERE (account_id = %u AND linked_account_id = %u) OR (account_id = %u AND linked_account_id = %u)",
                                accountId, linkedAccountId, linkedAccountId, accountId);

    ChatHandler(player->GetSession()).PSendSysMessage("Account unlinked successfully.");
}
