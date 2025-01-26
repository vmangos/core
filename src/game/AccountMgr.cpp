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

#include "AccountMgr.h"
#include "Database/DatabaseEnv.h"
#include "Database/DatabaseImpl.h"
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "Policies/SingletonImp.h"
#include "Util.h"
#include "World.h"
#include "WorldSession.h"
#include "MasterPlayer.h"
#include "Anticheat.h"
#include "Crypto/Authentication/SRP6.h"
#include "Crypto/Hash/SHA1.h"

INSTANTIATE_SINGLETON_1(AccountMgr);

AccountMgr::AccountMgr() : m_banlistUpdateTimer(0)
{}

AccountMgr::~AccountMgr()
{}

AccountOpResult AccountMgr::CreateAccount(std::string username, std::string password)
{
    if (utf8length(username) > MAX_ACCOUNT_STR)
        return AOR_NAME_TOO_LONG;                           // username's too long

    normalizeString(username);
    normalizeString(password);

    if (GetId(username))
    {
        return AOR_NAME_ALREDY_EXIST;                       // username does already exist
    }

    SRP6 srp;
    srp.CalculateVerifier(CalculateShaPassHash(username, password));
    std::string s_hex = srp.GetSalt().AsHexStr();
    std::string v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "INSERT INTO account(`username`, `v`, `s`, `joindate`) VALUES('%s','%s','%s',NOW())",
        username.c_str(), v_hex.c_str(), s_hex.c_str());

    if (!update_sv)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    LoginDatabase.Execute("REPLACE INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) SELECT `realmlist`.`id`, `account`.`id`, 0 FROM `realmlist`,`account` LEFT JOIN `realmcharacters` ON `acctid`=`account`.`id` WHERE `acctid` IS NULL");

    return AOR_OK;                                          // everything's fine
}

AccountOpResult AccountMgr::DeleteAccount(uint32 accid)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT 1 FROM `account` WHERE `id`='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist

    // existing characters list
    result = CharacterDatabase.PQuery("SELECT `guid` FROM `characters` WHERE `account`='%u'", accid);
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            uint32 guidlo = fields[0].GetUInt32();
            ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidlo);

            // kick if player currently
            ObjectAccessor::KickPlayer(guid);
            Player::DeleteFromDB(guid, accid, false);       // no need to update realm characters
        }
        while (result->NextRow());
    }

    // table realm specific but common for all characters of account for realm
    CharacterDatabase.PExecute("DELETE FROM `character_tutorial` WHERE `account` = '%u'", accid);

    LoginDatabase.BeginTransaction();

    bool res =
        LoginDatabase.PExecute("DELETE FROM `account` WHERE `id`='%u'", accid) &&
        LoginDatabase.PExecute("DELETE FROM `realmcharacters` WHERE `acctid`='%u'", accid);

    LoginDatabase.CommitTransaction();

    if (!res)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error;

    return AOR_OK;
}

//#DEPRECATED: Not used anywhere, should we delete?
AccountOpResult AccountMgr::ChangeUsername(uint32 accid, std::string new_uname, std::string new_passwd)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT 1 FROM `account` WHERE `id`='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist

    if (utf8length(new_uname) > MAX_ACCOUNT_STR)
        return AOR_NAME_TOO_LONG;

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_uname);
    normalizeString(new_passwd);

    SRP6 srp;

    srp.CalculateVerifier(CalculateShaPassHash(new_uname, new_passwd));

    std::string safe_new_uname = new_uname;
    LoginDatabase.escape_string(safe_new_uname);

    std::string s_hex = srp.GetSalt().AsHexStr();
    std::string v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "UPDATE `account` SET `v`='%s', `s`='%s', `username`='%s' WHERE `id`='%u'",
        v_hex.c_str(), s_hex.c_str(), safe_new_uname.c_str(), accid);

    if (!update_sv)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    GetAccountPersistentData(accid).m_username = new_uname;

    return AOR_OK;
}

AccountOpResult AccountMgr::ChangePassword(uint32 accid, std::string new_passwd, std::string username)
{
    if (username.empty())
    {
        if (!GetName(accid, username))
            return AOR_NAME_NOT_EXIST;
    }
    else
        normalizeString(username);                       // account doesn't exist

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_passwd);

    SRP6 srp;

    srp.CalculateVerifier(CalculateShaPassHash(username, new_passwd));

    std::string s_hex = srp.GetSalt().AsHexStr();
    std::string v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "UPDATE `account` SET `v`='%s', `s`='%s' WHERE `id`='%u'",
        v_hex.c_str(), s_hex.c_str(), accid);

    // also reset s and v to force update at next realmd login
    if (!update_sv)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    return AOR_OK;
}

uint32 AccountMgr::GetId(std::string username)
{
    LoginDatabase.escape_string(username);
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `id` FROM `account` WHERE `username` = '%s'", username.c_str());
    if (!result)
        return 0;
    else
    {
        uint32 id = (*result)[0].GetUInt32();
        return id;
    }
}

void AccountMgr::Load()
{
    LoadAccountData();
    LoadAccountBanList();
    LoadIPBanList(std::move(LoginDatabase.Query(LOAD_IP_BANS_QUERY)));
    LoadAccountWarnings();
}

AccountTypes AccountMgr::GetSecurity(uint32 accountId)
{
    return GetAccountPersistentData(accountId).m_security;
}

void AccountMgr::SetSecurity(uint32 accountId, AccountTypes security)
{
    GetAccountPersistentData(accountId).m_security = security;
    LoginDatabase.PExecute("REPLACE INTO `account_access` (`id`, `gmlevel`, `RealmID`) VALUES (%u, %u, %u)", accountId, security, realmID);
}

bool AccountMgr::HasTrialRestrictions(uint32 accountId)
{
    if (sWorld.getConfig(CONFIG_BOOL_RESTRICT_UNVERIFIED_ACCOUNTS))
    {
        AccountPersistentData const& data = GetAccountPersistentData(accountId);
        return !data.m_verifiedEmail && data.m_security <= SEC_PLAYER;
    }

    return false;
}

bool AccountMgr::GetName(uint32 accountId, std::string &name)
{
    {
        std::shared_lock<std::shared_timed_mutex> guard(m_accountPersistentDataMutex);
        auto itr = m_accountPersistentData.find(accountId);
        if (itr != m_accountPersistentData.end() && !itr->second.m_email.empty())
        {
            name = itr->second.m_email;
            return true;
        }
    }

    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `username` FROM `account` WHERE `id` = '%u'", accountId);
    if (result)
    {
        name = (*result)[0].GetCppString();
        if (normalizeString(name))
            return true;
    }

    return false;
}

uint32 AccountMgr::GetCharactersCount(uint32 acc_id)
{
    // check character count
    std::unique_ptr<QueryResult> result = CharacterDatabase.PQuery("SELECT COUNT(`guid`) FROM `characters` WHERE `account` = '%u'", acc_id);
    if (result)
    {
        Field* fields = result->Fetch();
        uint32 charcount = fields[0].GetUInt32();
        return charcount;
    }
    else
        return 0;
}

bool AccountMgr::CheckPassword(uint32 accid, std::string passwd, std::string username)
{
    if (username.empty())
    {
        if (!GetName(accid, username))
            return false;
    }
    else
        normalizeString(username);

    normalizeString(passwd);

    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `s`, `v` FROM `account` WHERE `id`='%u'", accid);
    if (result)
    {
        Field* fields = result->Fetch();
        SRP6 srp;

        bool calcv = srp.CalculateVerifier(CalculateShaPassHash(username, passwd), fields[0].GetCppString().c_str());

        if (calcv && srp.ProofVerifier(fields[1].GetCppString()))
        {
            return true;
        }
    }

    return false;
}

bool AccountMgr::normalizeString(std::string& utf8str)
{
    std::wstring wstr_buf;
    if (!Utf8toWStr(utf8str, wstr_buf))
        return false;

    if (wstr_buf.size() > MAX_ACCOUNT_STR)
        return false;

    std::transform(wstr_buf.begin(), wstr_buf.end(), wstr_buf.begin(), wcharToUpperOnlyLatin);

    return WStrToUtf8(wstr_buf, utf8str);
}

std::string AccountMgr::CalculateShaPassHash(std::string& name, std::string& password)
{
    auto pwHash = Crypto::Hash::SHA1::ComputeFrom(name + ":" + password);

    std::string encoded;
    hexEncodeByteArray(pwHash.data(), pwHash.size(), encoded);

    return encoded;
}

void AccountMgr::Update(uint32 diff)
{
    if (m_banlistUpdateTimer < diff)
    {
        m_banlistUpdateTimer = sWorld.getConfig(CONFIG_UINT32_BANLIST_RELOAD_TIMER) * 1000;
        LoginDatabase.AsyncQuery(this, &AccountMgr::LoadIPBanList, true, LOAD_IP_BANS_QUERY);
        //LoadAccountBanList(true);
    }
    else
        m_banlistUpdateTimer -= diff;
}

void AccountMgr::LoadIPBanList(std::unique_ptr<QueryResult> result, bool silent)
{
    if (!silent)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading ip_banned ...");

    if (!result)
    {
        if (!silent)
        {
            BarGoLink bar(1);
            bar.step();

            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 ip bans");
        }
        return;
    }

    std::map<std::string, uint32> ipBanned;
    std::unique_ptr<BarGoLink> bar = silent ? nullptr : std::make_unique<BarGoLink>(result->GetRowCount());
    do
    {
        if (bar)
            bar->step();
        Field* fields = result->Fetch();
        uint32 unbandate = fields[1].GetUInt32();
        uint32 bandate = fields[2].GetUInt32();
        if (unbandate == bandate)
            unbandate = 0xFFFFFFFF;
        ipBanned.emplace(std::make_pair(fields[0].GetString(), unbandate));
    } while (result->NextRow());

    std::lock_guard<std::shared_timed_mutex> lock(m_ipBannedMutex);
    std::swap(ipBanned, m_ipBanned);

    if (!silent)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u ip bans", m_ipBanned.size());
    }
}

void AccountMgr::LoadAccountBanList(bool silent)
{
    if (!silent)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "Loading account_banned ...");

    std::unique_ptr<QueryResult> banresult(LoginDatabase.PQuery("SELECT `id`, `unbandate`, `bandate` FROM `account_banned` WHERE `active` = 1 AND (`unbandate` > UNIX_TIMESTAMP() OR `bandate` = `unbandate`)"));
    
    if (!banresult)
    {
        if (!silent)
        {
            BarGoLink bar(1);
            bar.step();

            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 account bans");
        }
        return;
    }

    m_accountBanned.clear();
    std::unique_ptr<BarGoLink> bar = silent ? nullptr : std::make_unique<BarGoLink>(banresult->GetRowCount());
    do
    {
        if (bar)
            bar->step();
        Field* fields = banresult->Fetch();
        uint32 unbandate = fields[1].GetUInt32();
        uint32 bandate = fields[2].GetUInt32();
        if (unbandate == bandate)
            unbandate = 0xFFFFFFFF;
        m_accountBanned[fields[0].GetUInt32()] = unbandate;
    } while (banresult->NextRow());

    if (!silent)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u account bans", m_accountBanned.size());
    }
}

bool AccountMgr::IsIPBanned(std::string const& ip) const
{
    std::shared_lock<std::shared_timed_mutex> lock(m_ipBannedMutex);
    std::map<std::string, uint32>::const_iterator it = m_ipBanned.find(ip);
    return !(it == m_ipBanned.end() || it->second < time(nullptr));
}

bool AccountMgr::IsAccountBanned(uint32 acc) const
{
    std::map<uint32, uint32>::const_iterator it = m_accountBanned.find(acc);
    return !(it == m_accountBanned.end() || it->second < time(nullptr));
}

void AccountMgr::LoadAccountWarnings()
{
    std::unique_ptr<QueryResult> result(LoginDatabase.Query("SELECT `id`, `banreason` FROM `account_banned` WHERE `active` = 0 && (`banreason` LIKE \"WARN:%\") ORDER BY `bandate`"));

    if (!result)
        return;

    m_accountWarnings.clear();
    do
    {
        Field* fields = result->Fetch();
        std::string warning = fields[1].GetCppString();
        m_accountWarnings[fields[0].GetUInt32()] = warning.substr(5, warning.size() - 5);
    } while (result->NextRow());
}

bool AccountMgr::CheckInstanceCount(uint32 accountId, uint32 instanceId, uint32 maxCount)
{
    AccountInstanceEnterTimesMap::iterator it = m_instanceEnterTimes.find(accountId);
    if (it == m_instanceEnterTimes.end())
        return true;
    InstanceEnterTimesMap& enterTimes = it->second;
    InstanceEnterTimesMap::iterator it2 = enterTimes.find(instanceId);
    if (it2 != enterTimes.end())
        return true;
    if (enterTimes.size() < maxCount)
        return true;
    time_t now = time(nullptr);
    for (it2 = enterTimes.begin(); it2 != enterTimes.end(); ++it2)
        if (it2->second + 3600 < now)
        {
            enterTimes.erase(it2);
            return true;
        }
    return false;
}

void AccountMgr::AddInstanceEnterTime(uint32 accountId, uint32 instanceId, time_t enterTime)
{
    AccountInstanceEnterTimesMap::iterator it = m_instanceEnterTimes.find(accountId);
    if (it == m_instanceEnterTimes.end())
    {
        InstanceEnterTimesMap resetTimes;
        resetTimes[instanceId] = enterTime;
        m_instanceEnterTimes[accountId] = resetTimes;
        return;
    }
    it->second[instanceId] = enterTime;
}

// Anticheat
void AccountPersistentData::WhisperedBy(MasterPlayer* whisperer)
{
    WhispersMap::iterator it = m_whisperTargets.find(whisperer->GetGUIDLow());
    if (it != m_whisperTargets.end())
        it->second.score = 0;
}

uint32 AccountPersistentData::CountWhispersTo(MasterPlayer* from, MasterPlayer* player)
{
    sAccountMgr.GetAccountPersistentData(player->GetSession()->GetAccountId()).WhisperedBy(from);
    WhisperData& data = m_whisperTargets[player->GetGUIDLow()];
    ++data.whispers_count;
    if (data.whispers_count == 1)
        data.score = GetWhisperScore(from, player);
    return data.whispers_count-1;
}

bool AccountPersistentData::CanWhisper(MasterPlayer* player) const
{
    return sAnticheatMgr->CanWhisper(*this, player);
}

uint32 AccountPersistentData::GetWhisperScore(MasterPlayer* from, MasterPlayer* target) const
{
    uint32 score = 3;
    Player* playerFrom = from->GetSession()->GetPlayer();
    Player* playerTo = target->GetSession()->GetPlayer();
    if (playerFrom->GetGuildId() && playerFrom->GetGuildId() == playerTo->GetGuildId())
        score = 1;
    if (from->GetAreaId() == target->GetAreaId())
        score = 1;
    if (playerTo->GetGroup() && playerTo->GetGroup() == playerFrom->GetGroup())
        score = 1;
    return score;
}

void AccountPersistentData::JustMailed(uint32 toAccount)
{
    m_mailsSent[toAccount] = time(nullptr);
}

bool AccountPersistentData::CanMail(uint32 targetAccount)
{
    // Already sent a mail to this guy => OK
    if (m_mailsSent.find(targetAccount) != m_mailsSent.end())
        return true;

    uint32 totalScore = 0;
    time_t lastNonExpired = time(nullptr) - sWorld.getConfig(CONFIG_UINT32_MAILSPAM_EXPIRE_SECS);
    for (const auto& it : m_mailsSent)
        if (it.second >= lastNonExpired)
            totalScore++;
    uint32 allowedScore = sWorld.getConfig(CONFIG_UINT32_MAILSPAM_MAX_MAILS);
    return totalScore < allowedScore;
}

AccountPersistentData& AccountMgr::GetAccountPersistentData(uint32 accountId)
{
    {
        std::shared_lock<std::shared_timed_mutex> guard(m_accountPersistentDataMutex);
        auto itr = m_accountPersistentData.find(accountId);
        if (itr != m_accountPersistentData.end())
            return itr->second;
    }
    
    {
        std::lock_guard<std::shared_timed_mutex> guard(m_accountPersistentDataMutex);
        return m_accountPersistentData[accountId];
    }
}

void AccountMgr::LoadAccountData()
{
    std::unique_ptr<QueryResult> result(LoginDatabase.PQuery("SELECT a.`id`, a.`username`, a.`email`, a.`email_verif`, aa.`gmlevel` FROM `account` a LEFT JOIN `account_access` aa ON a.`id` = aa.`id` AND aa.`RealmID` IN (-1, %u)", realmID));

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();
        uint32 id = fields[0].GetUInt32();
        AccountPersistentData& data = m_accountPersistentData[id];
        data.m_username = fields[1].GetCppString();
        data.m_email = fields[2].GetCppString();
        data.m_verifiedEmail = fields[3].GetBool() || data.m_email.empty(); // treat no email as verified (created from console)

        // gmlevel can be null
        if (fields[4].GetString())
        {
            AccountTypes security = AccountTypes(fields[4].GetUInt32());
            if (data.m_security < security)
                data.m_security = security;
        }

    } while (result->NextRow());
}

void AccountMgr::UpdateAccountData(uint32 accountId, std::string const& username, std::string const& email, bool verifiedEmail, AccountTypes security)
{
    AccountPersistentData& data = m_accountPersistentData[accountId];
    data.m_username = username;
    data.m_email = email;
    data.m_verifiedEmail = verifiedEmail;
    data.m_security = security;
}
