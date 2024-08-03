/*
* Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
* Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
* Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
* Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
* Copyright (C) 2017 Light's Hope <https://github.com/LightsHope>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#ifndef _ASYNC_COMMAND_INCLUDED
#define _ASYNC_COMMAND_INCLUDED

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "Database/DatabaseEnv.h"
#include "Database/Database.h"
#include "Database/SqlOperations.h"

enum
{
    PINFO_QUERY_GOLD_SENT = 0,
    PINFO_QUERY_GOLD_RECEIVED,
    PINFO_QUERY_ACCOUNT_INFO,
};

struct PInfoData
{
    // GM who used the command
    // needed for callback since command is async
    uint32 m_ownAccountId = 0;

    // Character data
    ObjectGuid m_targetGuid;
    std::string m_targetName;
    uint8 m_race = 0;
    uint8 m_class = 0;
    uint32 m_level = 0;
    uint32 m_money = 0;
    uint32 m_mailGoldInbox = 0;
    uint32 m_mailGoldOutbox = 0;
    uint32 m_totalPlayedTime = 0;
    uint32 m_latency = 0;
    bool m_online = false;

    // Account data
    uint32 m_accountId = 0;
    std::string m_username;
    LocaleConstant m_locale = LOCALE_enUS;
    AccountTypes m_security = SEC_PLAYER;
    uint32 m_securityFlag = 0;
    std::string m_lastIp;
    std::string m_lastLogin;
    bool m_hasAccount = false;

    // Warden data
    std::string m_wardenClock;
    std::string m_wardenFingerprint;
    std::string m_wardenHypervisors;
    std::string m_wardenEndscene;
    std::string m_wardenProxifier;
    bool m_hasUsedClickToMove = false;
};

class WorldSession;

/**
Chain query handling for PInfo. It uses a long blocking query (select from characters)
so doing it in the main thread is bad. Therefore, we just handle all the queries via
chain callbacks until we have the right result
*/
class PInfoHandler
{
public:
    static void HandlePInfoCommand(WorldSession* session, Player* target, ObjectGuid& target_guid, std::string& name);
    static void HandlePlayerLookupResult(std::unique_ptr<QueryResult> result, PInfoData* data);
    static void HandleDataAfterPlayerLookup(PInfoData *data);
    static void HandleDelayedMoneyQuery(std::unique_ptr<QueryResult>, SqlQueryHolder* holder, PInfoData* data);
    // Not thread safe. Must be handled in unsafe callback
    static void HandleAccountInfoResult(std::unique_ptr<QueryResult> result, PInfoData* data);
    static void HandleResponse(WorldSession* session, PInfoData *data);
};

class PlayerSearchHandler
{
public:
    static void HandlePlayerAccountSearchResult(std::unique_ptr<QueryResult>, SqlQueryHolder *holder, int);
    static void HandlePlayerCharacterLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit);
    static void ShowPlayerListHelper(std::unique_ptr<QueryResult> result, ChatHandler& chatHandler, uint32& count, uint32 limit, bool title);
};

class AccountSearchHandler
{
public:
    static void HandleAccountLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit);
    static void ShowAccountListHelper(std::unique_ptr<QueryResult> result, ChatHandler& chatHandler, uint32& count, uint32 limit, bool title);
};

class PlayerGoldRemovalHandler
{
public:
    // Handle the initial gold lookup for offline player, and perform the removal
    // @not thread safe, must be called from an async unsafe DB callback
    static void HandleGoldLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 removeAmount);
};

typedef std::map<uint32, std::pair<uint32, std::string>> PlayerSearchAccountMap;
class PlayerSearchQueryHolder : public SqlQueryHolder
{
public:
    PlayerSearchQueryHolder(uint32 accountId, uint32 limit)
        : SqlQueryHolder(), m_accountId(accountId), m_limit(limit) {}

    uint32 GetLimit() const { return m_limit; }
    uint32 GetAccountId() const { return m_accountId; }
    void AddAccountInfo(uint32 queryIndex, uint32& accId, std::string& accName);
    bool GetAccountInfo(uint32 queryIndex, std::pair<uint32, std::string>& pair);

private:
    uint32 m_accountId;
    uint32 m_limit;
    PlayerSearchAccountMap m_accounts;
};

/* Run the display in an async task inside the main update, safe for session consistency */
class PlayerAccountSearchDisplayTask
{
public:

    PlayerAccountSearchDisplayTask(PlayerSearchQueryHolder* queryHolder)
        : holder(queryHolder) {}

    void operator()();

private:
    PlayerSearchQueryHolder* holder;
};

/* Run the display in an async task inside the main update, safe for session consistency */
class PlayerCharacterLookupDisplayTask
{
public:
    PlayerCharacterLookupDisplayTask(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit)
        : unsafeResult(std::make_shared<std::unique_ptr<QueryResult>>(std::move(result))), accountId(accountId), limit(limit) {}

    void operator ()();

private:
    // Somehow this class is not moveable when cased to a std::function<void()> (See usage of this function)
    // so we wrap the result into a shared_ptr to still ensure memory "safety"
    std::shared_ptr<std::unique_ptr<QueryResult>> unsafeResult; // will be deleted and set to nullptr when operator()
    uint32 accountId;
    uint32 limit;
};

class AccountSearchDisplayTask
{
public:
    AccountSearchDisplayTask(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit)
        : unsafeResult(std::make_shared<std::unique_ptr<QueryResult>>(std::move(result))), accountId(accountId), limit(limit) {}

    void operator ()();

private:
    // Somehow this class is not moveable when cased to a std::function<void()> (See usage of this function)
    // so we wrap the result into a shared_ptr to still ensure memory "safety"
    std::shared_ptr<std::unique_ptr<QueryResult>> unsafeResult; // will be deleted and set to nullptr when operator()
    uint32 accountId;
    uint32 limit;
};

#endif
