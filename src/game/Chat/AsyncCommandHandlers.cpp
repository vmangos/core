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

#include "Database/DatabaseEnv.h"
#include "Database/Database.h"
#include "Database/DatabaseImpl.h"
#include "Database/SqlOperations.h"
#include "Language.h"
#include "Chat.h"
#include "AccountMgr.h"
#include "DBCStores.h"
#include "Util.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "ObjectGuid.h"
#include "AsyncCommandHandlers.h"
#include "Anticheat.h"

void PInfoHandler::HandlePInfoCommand(WorldSession* session, Player* target, ObjectGuid& target_guid, std::string& name)
{
    PInfoData* data = new PInfoData;
    data->m_ownAccountId = session->GetAccountId();
    data->m_targetName = name;

    if (target)
    {
        data->m_targetGuid = target->GetObjectGuid();
        data->m_race = target->GetRace();
        data->m_class = target->GetClass();
        data->m_level = target->GetLevel();
        data->m_money = target->GetMoney();
        data->m_totalPlayedTime = target->GetTotalPlayedTime();
        data->m_accountId = target->GetSession()->GetAccountId();
        data->m_latency = target->GetSession()->GetLatency();
        data->m_locale = target->GetSession()->GetSessionDbcLocale();
        data->m_online = true;

        if (auto const warden = target->GetSession()->GetWarden())
        {
            warden->GetPlayerInfo(data->m_wardenClock, data->m_wardenFingerprint, data->m_wardenHypervisors,
                data->m_wardenEndscene, data->m_wardenProxifier);
            data->m_hasUsedClickToMove = warden->HasUsedClickToMove();
        }

        HandleDataAfterPlayerLookup(data);
    }
    else
    {
        data->m_targetGuid = target_guid;
        CharacterDatabase.AsyncPQuery(&PInfoHandler::HandlePlayerLookupResult, data,
            //       0                    1        2        3          4       5
            "SELECT `played_time_total`, `level`, `money`, `account`, `race`, `class` FROM `characters` WHERE `guid` = '%u'",
            target_guid.GetCounter());
    }
}

void PInfoHandler::HandlePlayerLookupResult(std::unique_ptr<QueryResult> result, PInfoData *data)
{
    if (!result)
    {
        delete data;
        return;
    }

    Field* fields = result->Fetch();
    data->m_totalPlayedTime = fields[0].GetUInt32();
    data->m_level = fields[1].GetUInt32();
    data->m_money = fields[2].GetUInt32();
    data->m_accountId = fields[3].GetUInt32();
    data->m_race = fields[4].GetUInt8();
    data->m_class = fields[5].GetUInt8();

    HandleDataAfterPlayerLookup(data);
}

void PInfoHandler::HandleDataAfterPlayerLookup(PInfoData* data)
{
    SqlQueryHolder* charHolder = new SqlQueryHolder;
    charHolder->SetSize(2);
    charHolder->SetPQuery(PINFO_QUERY_GOLD_SENT, "SELECT SUM(`money`) FROM `mail` WHERE `sender_guid` = %u", data->m_targetGuid.GetCounter());
    charHolder->SetPQuery(PINFO_QUERY_GOLD_RECEIVED, "SELECT SUM(`money`) FROM `mail` WHERE `receiver_guid` = %u", data->m_targetGuid.GetCounter());

    CharacterDatabase.DelayQueryHolder(&PInfoHandler::HandleDelayedMoneyQuery, charHolder, data);
}

void PInfoHandler::HandleDelayedMoneyQuery(std::unique_ptr<QueryResult>, SqlQueryHolder* holder, PInfoData* data)
{
    if (holder)
    {
        std::unique_ptr<QueryResult> result = holder->TakeResult(PINFO_QUERY_GOLD_SENT);
        if (result)
            data->m_mailGoldOutbox = result->Fetch()[0].GetUInt32();

        result = holder->TakeResult(PINFO_QUERY_GOLD_RECEIVED);
        if (result)
            data->m_mailGoldInbox = result->Fetch()[0].GetUInt32();

        // Delete all results now
        holder->DeleteAllResults();
        delete holder;
    }

    // Handle the callback in a thread-safe environment (the world
    // thread) since we are ready to access the caller's session
    // and print the result once it completes. We also read guild info
    // so this cannot be done in an async task
    LoginDatabase.AsyncPQueryUnsafe(&PInfoHandler::HandleAccountInfoResult, data,
        "SELECT `username`, `last_ip`, `last_login`, `locale`, `locked` FROM `account` WHERE `id` = '%u'",
        data->m_accountId);
}

// Not threadsafe, executed in unsafe callback
void PInfoHandler::HandleAccountInfoResult(std::unique_ptr<QueryResult> result, PInfoData* data)
{
    WorldSession* session = sWorld.FindSession(data->m_ownAccountId);
    // Caller re-logged mid query. ChatHandler requires a player in the session
    if (!session || !session->GetPlayer())
    {
        delete data;
        return;
    }

    if (result)
    {
        Field* fields = result->Fetch();
        data->m_username = fields[0].GetCppString();
        data->m_security = sAccountMgr.GetSecurity(data->m_accountId);
        data->m_locale = LocaleConstant(fields[3].GetUInt8());
        data->m_securityFlag = fields[4].GetUInt8();

        bool showIp = true;
        if (session->GetSecurity() < data->m_security)
            showIp = false;
        else if (session->GetSecurity() < SEC_ADMINISTRATOR && data->m_security > SEC_PLAYER) // Only admins can see GM IPs
            showIp = false;
        if (showIp)
        {
            data->m_lastIp = fields[1].GetCppString();
            data->m_lastLogin = fields[2].GetCppString();
        }
        else
        {
            data->m_lastIp = "-";
            data->m_lastLogin = "-";
        }

        data->m_hasAccount = true;
    }

    HandleResponse(session, data);
}

// Not threadsafe, executed in thread unsafe callback
void PInfoHandler::HandleResponse(WorldSession* session, PInfoData* data)
{
    char const* raceName = GetUnitRaceName(data->m_race, session->GetSessionDbcLocale());
    char const* className = GetUnitClassName(data->m_class, session->GetSessionDbcLocale());
    if (!raceName)
        raceName = "";
    if (!className)
        className = "";

    if (data->m_locale > LOCALE_esMX)
        data->m_locale = LOCALE_enUS;
    ChatHandler cHandler(session);

    std::string twoFactorEnabled = data->m_securityFlag & 4 ? "Enabled" : "Disabled";
    if (!data->m_hasAccount)
    {
        data->m_username = cHandler.GetMangosString(LANG_ERROR);
        data->m_lastIp = cHandler.GetMangosString(LANG_ERROR);
        data->m_security = SEC_PLAYER;
    }

    std::string nameLink = cHandler.playerLink(data->m_targetName);

    cHandler.PSendSysMessage(LANG_PINFO_ACCOUNT, raceName, className,
        (data->m_online ? "" : cHandler.GetMangosString(LANG_OFFLINE)),
        nameLink.c_str(), data->m_targetGuid.GetCounter(), cHandler.playerLink(data->m_username).c_str(),
        data->m_accountId, sAccountMgr.IsAccountBanned(data->m_accountId) ? ", banned" : "",
        data->m_security, cHandler.playerLink(data->m_lastIp).c_str(),
        sAccountMgr.IsIPBanned(data->m_lastIp) ? " [BANIP]" : "", data->m_lastLogin.c_str(),
        data->m_latency, localeNames[data->m_locale], twoFactorEnabled.c_str());

    std::string timeStr = secsToTimeString(data->m_totalPlayedTime, true, true);
    uint32 money = data->m_money;
    uint32 mail_gold_inbox = data->m_mailGoldInbox;
    uint32 mail_gold_outbox = data->m_mailGoldOutbox;

    uint32 gold = money / GOLD;
    uint32 silv = (money % GOLD) / SILVER;
    uint32 copp = (money % GOLD) % SILVER;
    uint32 gold_in = mail_gold_inbox / GOLD;
    uint32 silv_in = (mail_gold_inbox % GOLD) / SILVER;
    uint32 copp_in = (mail_gold_inbox % GOLD) % SILVER;
    uint32 gold_out = mail_gold_outbox / GOLD;
    uint32 silv_out = (mail_gold_outbox % GOLD) / SILVER;
    uint32 copp_out = (mail_gold_outbox % GOLD) % SILVER;
    cHandler.PSendSysMessage(LANG_PINFO_LEVEL, timeStr.c_str(), data->m_level, gold, silv, copp, gold_in, silv_in, copp_in, gold_out, silv_out, copp_out);
    if (Guild* guild = sGuildMgr.GetPlayerGuild(data->m_targetGuid))
        cHandler.PSendSysMessage("Guild: %s", cHandler.playerLink(guild->GetName()).c_str());

    if (!data->m_wardenClock.empty())
        cHandler.SendSysMessage(data->m_wardenClock.c_str());
    if (!data->m_wardenFingerprint.empty())
        cHandler.SendSysMessage(data->m_wardenFingerprint.c_str());
    if (!data->m_wardenHypervisors.empty())
        cHandler.SendSysMessage(data->m_wardenHypervisors.c_str());
    if (!data->m_wardenEndscene.empty())
        cHandler.SendSysMessage(data->m_wardenEndscene.c_str());
    if (!data->m_wardenProxifier.empty())
        cHandler.SendSysMessage(data->m_wardenProxifier.c_str());
    if (data->m_hasUsedClickToMove)
        cHandler.SendSysMessage("Using Click to Move!");

    delete data;
}

// Handles the query result and offloads display to an async task in
// the world update
void PlayerSearchHandler::HandlePlayerAccountSearchResult(std::unique_ptr<QueryResult>, SqlQueryHolder* queryHolder, int)
{
    sWorld.AddAsyncTask(PlayerAccountSearchDisplayTask((PlayerSearchQueryHolder*)queryHolder));
}

void PlayerAccountSearchDisplayTask::operator ()()
{
    // NOTE: Do not currently support console access for these commands
    WorldSession* session = sWorld.FindSession(holder->GetAccountId());
    if (!session)
    {
        if (holder)
        {
            holder->DeleteAllResults();
            delete holder;
        }
        return;
    }

    ChatHandler cHandler(session);

    if (!holder)
    {
        cHandler.PSendSysMessage(LANG_NO_PLAYERS_FOUND);
        return;
    }

    uint32 count = 0;
    AccountTypes sessionAccess = session->GetSecurity();
    for (uint32 i = 0; i < holder->GetSize(); ++i)
    {
        std::unique_ptr<QueryResult> query = holder->TakeResult(i);
        if (!query)
            continue;

        std::pair<uint32, std::string> accountInfo;
        if (holder->GetAccountInfo(i, accountInfo))
        {
            uint32& acc_id = accountInfo.first;
            std::string &acc_name = accountInfo.second;

            AccountTypes security = sAccountMgr.GetSecurity(acc_id);

            // Cannot lookup accounts above the caller's security, nor can GMs below
            // administrator lookup other non-player accounts
            if (sessionAccess < security || (sessionAccess < SEC_ADMINISTRATOR && security > SEC_PLAYER))
                continue;

            bool banned = sAccountMgr.IsAccountBanned(acc_id);
            if (banned)
                acc_name = acc_name + " [BANNED]";

            cHandler.PSendSysMessage(LANG_LOOKUP_PLAYER_ACCOUNT, acc_name.c_str(), acc_id);

            PlayerSearchHandler::ShowPlayerListHelper(std::move(query), cHandler, count, holder->GetLimit(), true);
        }

        // Don't show any further accounts now that we're at the limit
        if (count == holder->GetLimit())
            break;
    }

    if (count == 0)
    {
        cHandler.PSendSysMessage(LANG_NO_PLAYERS_FOUND);
    }

    holder->DeleteAllResults();
    delete holder;
}

void PlayerCharacterLookupDisplayTask::operator()()
{
    std::unique_ptr<QueryResult> result;
    result.swap(*unsafeResult); // we are now the owner of this result. The unsafeResult is nullptr.

    WorldSession* session = sWorld.FindSession(accountId);
    if (!session)
    {
        return;
    }

    ChatHandler cHandler(session);
    if (!result)
    {
        cHandler.PSendSysMessage(LANG_NO_PLAYERS_FOUND);
        return;
    }

    uint32 count = 0;
    PlayerSearchHandler::ShowPlayerListHelper(std::move(result), cHandler, count, limit, true);
}

// Handle the result and create a display task to run in the world update
void PlayerSearchHandler::HandlePlayerCharacterLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit)
{
    sWorld.AddAsyncTask(std::move(PlayerCharacterLookupDisplayTask(std::move(result), accountId, limit)));
}

void PlayerSearchHandler::ShowPlayerListHelper(std::unique_ptr<QueryResult> result, ChatHandler& chatHandler, uint32& count, uint32 limit, bool title)
{
    if (!chatHandler.GetSession() && title)
    {
        chatHandler.SendSysMessage(LANG_CHARACTERS_LIST_BAR);
        chatHandler.SendSysMessage(LANG_CHARACTERS_LIST_HEADER);
        chatHandler.SendSysMessage(LANG_CHARACTERS_LIST_BAR);
    }

    if (result)
    {
        LocaleConstant locale = chatHandler.GetSession() ? chatHandler.GetSession()->GetSessionDbcLocale() : LOCALE_enUS;
        // Circle through them. Display username and GM level
        do
        {
            // check limit
            if (count == limit)
                break;

            Field* fields = result->Fetch();
            uint32 guid = fields[0].GetUInt32();
            std::string name = fields[1].GetCppString();
            uint8 race = fields[2].GetUInt8();
            uint8 class_ = fields[3].GetUInt8();
            uint32 level = fields[4].GetUInt32();

            ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(race);
            ChrClassesEntry const* classEntry = sChrClassesStore.LookupEntry(class_);

            char const* race_name = raceEntry ? raceEntry->name[locale] : "<?>";
            char const* class_name = classEntry ? classEntry->name[locale] : "<?>";

            if (!chatHandler.GetSession())
            {
                if (sObjectAccessor.FindPlayerNotInWorld(ObjectGuid(HIGHGUID_PLAYER, guid)))
                    name = "*" + name;
                chatHandler.PSendSysMessage(LANG_CHARACTERS_LIST_LINE_CONSOLE, guid, name.c_str(), race_name, class_name, level);
            }
            else if (sObjectAccessor.FindPlayerNotInWorld(ObjectGuid(HIGHGUID_PLAYER, guid)))
                chatHandler.PSendSysMessage(LANG_CHARACTERS_LIST_LINE_CHAT_ONLINE, guid, name.c_str(), name.c_str(), race_name, class_name, level);
            else
                chatHandler.PSendSysMessage(LANG_CHARACTERS_LIST_LINE_CHAT, guid, name.c_str(), name.c_str(), race_name, class_name, level);

            ++count;
        } while (result->NextRow());
    }

    if (!chatHandler.GetSession())
        chatHandler.SendSysMessage(LANG_CHARACTERS_LIST_BAR);
}

void PlayerSearchQueryHolder::AddAccountInfo(uint32 queryIndex, uint32& accId, std::string& accName)
{
    m_accounts[queryIndex] = std::pair<uint32, std::string>(accId, accName);
}

bool PlayerSearchQueryHolder::GetAccountInfo(uint32 queryIndex, std::pair<uint32, std::string>& pair)
{
    PlayerSearchAccountMap::const_iterator iter = m_accounts.find(queryIndex);
    if (iter == m_accounts.cend())
        return false;
    
    pair.first = (*iter).second.first;
    pair.second = (*iter).second.second;

    return true;
}

void AccountSearchDisplayTask::operator ()()
{
    std::unique_ptr<QueryResult> result;
    result.swap(*unsafeResult); // we are now the owner of this result. The unsafeResult is nullptr.

    WorldSession* session = sWorld.FindSession(accountId);
    if (!session)
    {
        return;
    }

    ChatHandler cHandler(session);

    if (!result)
    {
        cHandler.SendSysMessage(LANG_ACCOUNT_LIST_EMPTY);
        return;
    }

    uint32 count = 0;
    AccountSearchHandler::ShowAccountListHelper(std::move(result), cHandler, count, limit, true);
}

void AccountSearchHandler::HandleAccountLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 limit)
{
    sWorld.AddAsyncTask(std::move(AccountSearchDisplayTask(std::move(result), accountId, limit)));
}

void AccountSearchHandler::ShowAccountListHelper(std::unique_ptr<QueryResult> result, ChatHandler& chatHandler, uint32& count, uint32 limit, bool title)
{
    // Display the list of account/characters online
    if (!chatHandler.GetSession() && title)                                // not output header for online case
    {
        chatHandler.SendSysMessage(LANG_ACCOUNT_LIST_BAR);
        chatHandler.SendSysMessage(LANG_ACCOUNT_LIST_HEADER);
        chatHandler.SendSysMessage(LANG_ACCOUNT_LIST_BAR);
    }

    // Circle through accounts
    AccountTypes sessionAccess = chatHandler.GetSession() ? chatHandler.GetSession()->GetSecurity() : SEC_CONSOLE;
    do
    {
        // check limit
        if (count == limit)
            break;

        Field* fields = result->Fetch();
        uint32 account = fields[0].GetUInt32();

        WorldSession* session = sWorld.FindSession(account);
        Player* player = session ? session->GetPlayer() : nullptr;
        char const* char_name = player ? player->GetName() : " - ";

        std::string lastIp = chatHandler.GetMangosString(LANG_ERROR);
        bool showIp = true;

        AccountTypes security = sAccountMgr.GetSecurity(account);
        if (sessionAccess < security)
            showIp = false;
        else if (sessionAccess < SEC_ADMINISTRATOR && security > SEC_PLAYER) // Only admins can see GM IPs
            showIp = false;

        if (showIp)
        {
            lastIp = fields[2].GetCppString();
        }
        else
        {
            lastIp = "-";
        }

        std::string acc_name = fields[1].GetCppString();
        if (sAccountMgr.IsAccountBanned(account))
            acc_name = acc_name + " [BANNED]";

        if (chatHandler.GetSession())
            chatHandler.PSendSysMessage(LANG_ACCOUNT_LIST_LINE_CHAT,
                account, acc_name.c_str(), char_name,
                chatHandler.playerLink(lastIp).c_str(),
                security, fields[4].GetUInt32());
        else
            chatHandler.PSendSysMessage(LANG_ACCOUNT_LIST_LINE_CONSOLE,
                account, acc_name.c_str(), char_name,
                chatHandler.playerLink(lastIp).c_str(),
                security, fields[4].GetUInt32());

        ++count;
    } while (result->NextRow());

    if (!chatHandler.GetSession())                                         // not output header for online case
        chatHandler.SendSysMessage(LANG_ACCOUNT_LIST_BAR);
}

// Not thread-safe. Executed inside thread-unsafe callback
void PlayerGoldRemovalHandler::HandleGoldLookupResult(std::unique_ptr<QueryResult> result, uint32 accountId, uint32 removeAmount)
{
    WorldSession* session = sWorld.FindSession(accountId);
    if (!session)
    {
        return;
    }

    ChatHandler chatHandler(session);
    if (!result)
    {
        chatHandler.PSendSysMessage(LANG_PLAYER_NOT_FOUND);
        return;
    }

    uint32 prevMoney = 0;
    uint32 newMoney = 0;
    uint32 guidLow = 0;
    Field* fields = result->Fetch();
    prevMoney = fields[0].GetUInt32();
    guidLow = fields[1].GetUInt32();
    std::string name(fields[2].GetString());

    if (removeAmount > prevMoney)
        newMoney = 0;
    else
        newMoney = prevMoney - removeAmount;
    // Wrap inside user serial or they might login while the query is in progress and all the gold is back
    CharacterDatabase.BeginTransaction(guidLow);
    auto res = CharacterDatabase.PExecute("UPDATE characters SET money = %u WHERE guid = '%u'", newMoney, guidLow);
    CharacterDatabase.CommitTransaction();

    if (!res)
    {
        chatHandler.PSendSysMessage("Encountered a database error during gold removal - see log for details");
        return;
    }

    chatHandler.PSendSysMessage("Removed %ug %us %uc from %s", removeAmount / GOLD, (removeAmount % GOLD) / SILVER, (removeAmount % GOLD) % SILVER, name.c_str());
    chatHandler.PSendSysMessage("%s previously had %ug %us %uc", name.c_str(), prevMoney / GOLD, (prevMoney % GOLD) / SILVER, (prevMoney % GOLD) % SILVER);
    chatHandler.PSendSysMessage("%s now has %ug %us %uc", name.c_str(), newMoney / GOLD, (newMoney % GOLD) / SILVER, (newMoney % GOLD) % SILVER);
}
