/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
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

#ifndef _ACCMGR_H
#define _ACCMGR_H

#include "Common.h"
#include "Policies/Singleton.h"
#include <string>
#include <shared_mutex>

enum AccountOpResult
{
    AOR_OK,
    AOR_NAME_TOO_LONG,
    AOR_PASS_TOO_LONG,
    AOR_NAME_ALREDY_EXIST,
    AOR_NAME_NOT_EXIST,
    AOR_DB_INTERNAL_ERROR
};

class WorldSession;
class ChatHandler;
class MasterPlayer;
class QueryResult;

#define MAX_ACCOUNT_STR 16

#define LOAD_IP_BANS_QUERY "SELECT `ip`, `unbandate`, `bandate` FROM `ip_banned` WHERE (`unbandate` > UNIX_TIMESTAMP() OR `bandate` = `unbandate`)"

class AccountPersistentData
{
// WHISP FLOOD
public:
    struct WhisperData
    {
        WhisperData() : first_whisp(time(nullptr)), score(0), whispers_count(0) {}
        time_t first_whisp;
        uint32 score;
        uint32 whispers_count;
    };
    void WhisperedBy(MasterPlayer* whisperer);
    uint32 CountWhispersTo(MasterPlayer* from, MasterPlayer* player);
    bool CanWhisper(MasterPlayer* player) const;
    uint32 GetWhisperScore(MasterPlayer* from, MasterPlayer* player) const;
    uint32 CountDifferentWhispTargets() const { return m_whisperTargets.size(); }

    typedef std::map<uint32 /*lowguid*/, WhisperData> WhispersMap;
    WhispersMap m_whisperTargets;

// MAIL FLOOD
public:
    void JustMailed(uint32 toAccount);
    bool CanMail(uint32 targetAccount);
protected:
    typedef std::map<uint32, time_t> MailsSentMap;
    MailsSentMap m_mailsSent;
};

class AccountMgr
{
    public:
        AccountMgr();
        ~AccountMgr();

        AccountOpResult CreateAccount(std::string username, std::string password);
        AccountOpResult DeleteAccount(uint32 accid);
        AccountOpResult ChangeUsername(uint32 accid, std::string new_uname, std::string new_passwd);
        AccountOpResult ChangePassword(uint32 accid, std::string new_passwd, std::string username="");
        bool CheckPassword(uint32 accid, std::string passwd, std::string username="");

        uint32 GetId(std::string username);

        void Load();
        AccountTypes GetSecurity(uint32 acc_id);
        void SetSecurity(uint32 accId, AccountTypes sec);

        bool GetName(uint32 acc_id, std::string &name);
        uint32 GetCharactersCount(uint32 acc_id);
        std::string CalculateShaPassHash(std::string& name, std::string& password);

        static bool normalizeString(std::string& utf8str);
        // Nostalrius
        void Update(uint32 diff);
        void LoadIPBanList(std::unique_ptr<QueryResult> result, bool silent=false);
        void LoadAccountBanList(bool silent=false);
        void BanIP(std::string const& ip, uint32 unbandate) { m_ipBanned[ip] = unbandate; }
        void UnbanIP(std::string const& ip) { m_ipBanned.erase(ip); }
        void BanAccount(uint32 account, uint32 unbandate) { m_accountBanned[account] = unbandate; }
        void UnbanAccount(uint32 acc) { m_accountBanned.erase(acc); }
        bool IsIPBanned(std::string const& ip) const;
        bool IsAccountBanned(uint32 acc) const;

        void LoadAccountWarnings();
        void WarnAccount(uint32 acc, std::string reason) { m_accountWarnings[acc] = reason; }
        char const* GetWarningText(uint32 acc) const
        {
            auto itr = m_accountWarnings.find(acc);
            if (itr != m_accountWarnings.end())
                return itr->second.c_str();
            return nullptr;
        }

        // Max instance reset per account per hour
        bool CheckInstanceCount(uint32 accountId, uint32 instanceId, uint32 maxCount);
        void AddInstanceEnterTime(uint32 accountId, uint32 instanceId, time_t enterTime);

        AccountPersistentData& GetAccountPersistentData(uint32 accountId) { return m_accountPersistentData[accountId]; }
    protected:
        std::map<uint32, std::string> m_accountWarnings;
        std::map<uint32, AccountTypes> m_accountSecurity;
        uint32 m_banlistUpdateTimer;
        std::map<std::string, uint32> m_ipBanned;
        mutable std::shared_timed_mutex m_ipBannedMutex;
        std::map<uint32, uint32> m_accountBanned;
        typedef std::map<uint32 /* instanceId */, time_t /* enter time */> InstanceEnterTimesMap;
        typedef std::map<uint32 /* accountId */, InstanceEnterTimesMap> AccountInstanceEnterTimesMap;
        AccountInstanceEnterTimesMap m_instanceEnterTimes;
        std::map<uint32, AccountPersistentData> m_accountPersistentData;
};

#define sAccountMgr MaNGOS::Singleton<AccountMgr>::Instance()
#endif
