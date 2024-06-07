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
#include "Auth/Sha1.h"
#include "World.h"
#include "WorldSession.h"
#include "MasterPlayer.h"
#include "Anticheat.h"
#include "SRP6/SRP6.h"

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
    const char* s_hex = srp.GetSalt().AsHexStr();
    const char* v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "INSERT INTO account(`username`, `v`, `s`, `joindate`) VALUES('%s','%s','%s',NOW())",
        username.c_str(), v_hex, s_hex);

    OPENSSL_free((void*)s_hex);
    OPENSSL_free((void*)v_hex);

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

    const char* s_hex = srp.GetSalt().AsHexStr();
    const char* v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "UPDATE `account` SET `v`='%s', `s`='%s', `username`='%s' WHERE `id`='%u'",
        v_hex, s_hex, safe_new_uname.c_str(), accid);

    OPENSSL_free((void*)s_hex);
    OPENSSL_free((void*)v_hex);

    if (!update_sv)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

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

    const char* s_hex = srp.GetSalt().AsHexStr();
    const char* v_hex = srp.GetVerifier().AsHexStr();

    bool update_sv = LoginDatabase.PExecute(
        "UPDATE `account` SET `v`='%s', `s`='%s' WHERE `id`='%u'",
        v_hex, s_hex, accid);

    OPENSSL_free((void*)s_hex);
    OPENSSL_free((void*)v_hex);

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
    m_accountSecurity.clear();

    std::unique_ptr<QueryResult> result(LoginDatabase.PQuery("SELECT `id`, `gmlevel` FROM `account_access` WHERE (`RealmID` = '%u' OR `RealmID`='-1')", realmID));

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 GM ranks");
        return;
    }

    Field* fields = nullptr;
    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        fields = result->Fetch();
        uint32 accountId = fields[0].GetUInt32();
        AccountTypes secu = AccountTypes(fields[1].GetUInt32());
        switch (secu)
        {
        case SEC_PLAYER:
            break;
        case SEC_MODERATOR:
        case SEC_TICKETMASTER:
        case SEC_GAMEMASTER:
        case SEC_BASIC_ADMIN:
        case SEC_DEVELOPER:
        case SEC_ADMINISTRATOR:
            // Peut etre deja dans la liste ? On prend le plus haut gmlevel.
            if (m_accountSecurity.find(accountId) == m_accountSecurity.end() ||
                m_accountSecurity[accountId] < secu)
                m_accountSecurity[accountId] = secu;
            break;
        }
    } while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> %u GM ranks loaded for realm %u", m_accountSecurity.size(), realmID);
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    LoadAccountBanList();
    LoadIPBanList(std::move(LoginDatabase.Query(LOAD_IP_BANS_QUERY)));
    LoadAccountWarnings();
}

AccountTypes AccountMgr::GetSecurity(uint32 acc_id)
{
    std::map<uint32, AccountTypes>::const_iterator it = m_accountSecurity.find(acc_id);
    if (it == m_accountSecurity.end())
        return SEC_PLAYER;
    return it->second;
}

void AccountMgr::SetSecurity(uint32 accId, AccountTypes sec)
{
    m_accountSecurity[accId] = sec;
    LoginDatabase.PExecute("DELETE FROM `account_access` WHERE `RealmID`=%u AND `id`=%u", realmID, accId);
    LoginDatabase.PExecute("INSERT INTO `account_access` SET `RealmID`=%u, `id`=%u, `gmlevel`=%u", realmID, accId, sec);
}

bool AccountMgr::GetName(uint32 acc_id, std::string &name)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `username` FROM `account` WHERE `id` = '%u'", acc_id);
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
    Sha1Hash sha;
    sha.Initialize();
    sha.UpdateData(name);
    sha.UpdateData(":");
    sha.UpdateData(password);
    sha.Finalize();

    std::string encoded;
    hexEncodeByteArray(sha.GetDigest(), sha.GetLength(), encoded);

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
