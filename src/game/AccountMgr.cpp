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
#include "ObjectAccessor.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "Policies/SingletonImp.h"
#include "Util.h"
#include "Auth/Sha1.h"
#include "World.h"
#include "Chat.h"
#include "WorldSession.h"
#include "Chat.h"
#include "MasterPlayer.h"
#include "Anticheat.h"

extern DatabaseType LoginDatabase;

INSTANTIATE_SINGLETON_1(AccountMgr);

AccountMgr::AccountMgr() : _banlistUpdateTimer(0)
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

    if (!LoginDatabase.PExecute("INSERT INTO account(username,sha_pass_hash,joindate) VALUES('%s','%s',NOW())", username.c_str(), CalculateShaPassHash(username, password).c_str()))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error
    LoginDatabase.Execute("INSERT INTO realmcharacters (realmid, acctid, numchars) SELECT realmlist.id, account.id, 0 FROM realmlist,account LEFT JOIN realmcharacters ON acctid=account.id WHERE acctid IS NULL");

    return AOR_OK;                                          // everything's fine
}

AccountOpResult AccountMgr::DeleteAccount(uint32 accid)
{
    QueryResult *result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist
    delete result;

    // existing characters list
    result = CharacterDatabase.PQuery("SELECT guid FROM characters WHERE account='%u'", accid);
    if (result)
    {
        do
        {
            Field *fields = result->Fetch();
            uint32 guidlo = fields[0].GetUInt32();
            ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidlo);

            // kick if player currently
            ObjectAccessor::KickPlayer(guid);
            Player::DeleteFromDB(guid, accid, false);       // no need to update realm characters
        }
        while (result->NextRow());

        delete result;
    }

    // table realm specific but common for all characters of account for realm
    CharacterDatabase.PExecute("DELETE FROM character_tutorial WHERE account = '%u'", accid);

    LoginDatabase.BeginTransaction();

    bool res =
        LoginDatabase.PExecute("DELETE FROM account WHERE id='%u'", accid) &&
        LoginDatabase.PExecute("DELETE FROM realmcharacters WHERE acctid='%u'", accid);

    LoginDatabase.CommitTransaction();

    if (!res)
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error;

    return AOR_OK;
}

//#DEPRECATED: Not used anywhere, should we delete?
AccountOpResult AccountMgr::ChangeUsername(uint32 accid, std::string new_uname, std::string new_passwd)
{
    QueryResult *result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u'", accid);
    if (!result)
        return AOR_NAME_NOT_EXIST;                          // account doesn't exist
    delete result;

    if (utf8length(new_uname) > MAX_ACCOUNT_STR)
        return AOR_NAME_TOO_LONG;

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_uname);
    normalizeString(new_passwd);

    std::string safe_new_uname = new_uname;
    LoginDatabase.escape_string(safe_new_uname);

    if (!LoginDatabase.PExecute("UPDATE account SET v='0',s='0',username='%s',sha_pass_hash='%s' WHERE id='%u'", safe_new_uname.c_str(),
                                CalculateShaPassHash(new_uname, new_passwd).c_str(), accid))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    return AOR_OK;
}

AccountOpResult AccountMgr::ChangePassword(uint32 accid, std::string new_passwd, std::string username)
{
    if (username == "")
    {
        if (!GetName(accid, username))
            return AOR_NAME_NOT_EXIST;
    }
    else
        normalizeString(username);                       // account doesn't exist

    if (utf8length(new_passwd) > MAX_ACCOUNT_STR)
        return AOR_PASS_TOO_LONG;

    normalizeString(new_passwd);

    // also reset s and v to force update at next realmd login
    if (!LoginDatabase.PExecute("UPDATE account SET v='0', s='0', sha_pass_hash='%s' WHERE id='%u'",
                                CalculateShaPassHash(username, new_passwd).c_str(), accid))
        return AOR_DB_INTERNAL_ERROR;                       // unexpected error

    return AOR_OK;
}

uint32 AccountMgr::GetId(std::string username)
{
    LoginDatabase.escape_string(username);
    QueryResult *result = LoginDatabase.PQuery("SELECT id FROM account WHERE username = '%s'", username.c_str());
    if (!result)
        return 0;
    else
    {
        uint32 id = (*result)[0].GetUInt32();
        delete result;
        return id;
    }
}

void AccountMgr::Load()
{
    _accountSecurity.clear();
    QueryResult *result = LoginDatabase.PQuery("SELECT id, gmlevel FROM account_access WHERE (RealmID = '%u' OR RealmID='-1')", realmID);
    if (result)
    {
        Field *fields = NULL;
        do
        {
            fields = result->Fetch();
            uint32 accountId = fields[0].GetUInt32();
            AccountTypes secu = AccountTypes(fields[1].GetUInt32());
            switch (secu)
            {
                case SEC_PLAYER:
                    break;
                case SEC_MODERATOR:
                case SEC_MODERATOR_CONF:
                case SEC_GAMEMASTER:
                case SEC_BASIC_ADMIN:
                case SEC_DEVELOPPER:
                case SEC_ADMINISTRATOR:
                    // Peut etre deja dans la liste ? On prend le plus haut gmlevel.
                    if (_accountSecurity.find(accountId) == _accountSecurity.end() ||
                            _accountSecurity[accountId] < secu)
                        _accountSecurity[accountId] = secu;
                    break;
            }
        }
        while (result->NextRow());
        delete result;
    }
    sLog.outString(">> %u GM ranks loaded for realm %u", _accountSecurity.size(), realmID);
    LoadAccountBanList();
    LoadIPBanList();
}

AccountTypes AccountMgr::GetSecurity(uint32 acc_id)
{
    std::map<uint32, AccountTypes>::const_iterator it = _accountSecurity.find(acc_id);
    if (it == _accountSecurity.end())
        return SEC_PLAYER;
    return it->second;
}

void AccountMgr::SetSecurity(uint32 accId, AccountTypes sec)
{
    _accountSecurity[accId] = sec;
    LoginDatabase.PExecute("DELETE FROM account_access WHERE RealmID=%u AND id=%u", realmID, accId);
    LoginDatabase.PExecute("INSERT INTO account_access SET RealmID=%u, id=%u, gmlevel=%u", realmID, accId, sec);
}

bool AccountMgr::GetName(uint32 acc_id, std::string &name)
{
    QueryResult *result = LoginDatabase.PQuery("SELECT username FROM account WHERE id = '%u'", acc_id);
    if (result)
    {
        name = (*result)[0].GetCppString();
        delete result;
        if (normalizeString(name))
            return true;
    }

    return false;
}

uint32 AccountMgr::GetCharactersCount(uint32 acc_id)
{
    // check character count
    QueryResult *result = CharacterDatabase.PQuery("SELECT COUNT(guid) FROM characters WHERE account = '%u'", acc_id);
    if (result)
    {
        Field *fields = result->Fetch();
        uint32 charcount = fields[0].GetUInt32();
        delete result;
        return charcount;
    }
    else
        return 0;
}

bool AccountMgr::CheckPassword(uint32 accid, std::string passwd, std::string username)
{
    if (username == "")
    {
        if (!GetName(accid, username))
            return false;
    }
    else
        normalizeString(username);

    normalizeString(passwd);

    QueryResult *result = LoginDatabase.PQuery("SELECT 1 FROM account WHERE id='%u' AND sha_pass_hash='%s'", accid, CalculateShaPassHash(username, passwd).c_str());
    if (result)
    {
        delete result;
        return true;
    }

    return false;
}

bool AccountMgr::normalizeString(std::string& utf8str)
{
    wchar_t wstr_buf[MAX_ACCOUNT_STR + 1];

    size_t wstr_len = MAX_ACCOUNT_STR;
    if (!Utf8toWStr(utf8str, wstr_buf, wstr_len))
        return false;

    std::transform(&wstr_buf[0], wstr_buf + wstr_len, &wstr_buf[0], wcharToUpperOnlyLatin);

    return WStrToUtf8(wstr_buf, wstr_len, utf8str);
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
    if (_banlistUpdateTimer < diff)
    {
        _banlistUpdateTimer = sWorld.getConfig(CONFIG_BANLIST_RELOAD_TIMER) * 1000;
        LoadIPBanList(true);
        //LoadAccountBanList(true);
    }
    else
        _banlistUpdateTimer -= diff;
}

void AccountMgr::LoadIPBanList(bool silent)
{
    if (!silent)
        sLog.outString("Loading ip_banned ...");
    QueryResult *banresult = LoginDatabase.PQuery("SELECT ip, unbandate, bandate FROM ip_banned WHERE (unbandate > UNIX_TIMESTAMP() OR bandate = unbandate)");
    if (banresult)
    {
        _ipBanned.clear();
        Field *fields = NULL;
        do
        {
            Field *fields = banresult->Fetch();
            uint32 unbandate = fields[1].GetUInt32();
            uint32 bandate = fields[2].GetUInt32();
            if (unbandate == bandate)
                unbandate = 0xFFFFFFFF;
            _ipBanned[fields[0].GetString()] = unbandate;
        }
        while (banresult->NextRow());
        delete banresult;
        if (!silent)
            sLog.outString(">> Loaded %u account ban", _ipBanned.size());
    }
}

void AccountMgr::LoadAccountBanList(bool silent)
{
    if (!silent)
        sLog.outString("Loading account_banned ...");
    QueryResult *banresult = LoginDatabase.PQuery("SELECT id, unbandate, bandate FROM account_banned WHERE active = 1 AND (unbandate > UNIX_TIMESTAMP() OR bandate = unbandate)");
    if (banresult)
    {
        _accountBanned.clear();
        Field *fields = NULL;
        do
        {
            Field *fields = banresult->Fetch();
            uint32 unbandate = fields[1].GetUInt32();
            uint32 bandate = fields[2].GetUInt32();
            if (unbandate == bandate)
                unbandate = 0xFFFFFFFF;
            _accountBanned[fields[0].GetUInt32()] = unbandate;
        }
        while (banresult->NextRow());
        delete banresult;
        if (!silent)
            sLog.outString(">> Loaded %u account ban", _accountBanned.size());
    }
}

bool AccountMgr::IsIPBanned(std::string const& ip) const
{
    std::map<std::string, uint32>::const_iterator it = _ipBanned.find(ip);
    if (it == _ipBanned.end() || it->second < time(NULL))
        return false;
    return true;
}

bool AccountMgr::IsAccountBanned(uint32 acc) const
{
    std::map<uint32, uint32>::const_iterator it = _accountBanned.find(acc);
    if (it == _accountBanned.end() || it->second < time(NULL))
        return false;
    return true;
}

bool AccountMgr::CheckInstanceCount(uint32 accountId, uint32 instanceId, uint32 maxCount)
{
    AccountInstanceEnterTimesMap::iterator it = _instanceEnterTimes.find(accountId);
    if (it == _instanceEnterTimes.end())
        return true;
    InstanceEnterTimesMap& enterTimes = it->second;
    InstanceEnterTimesMap::iterator it2 = enterTimes.find(instanceId);
    if (it2 != enterTimes.end())
        return true;
    if (enterTimes.size() < maxCount)
        return true;
    time_t now = time(NULL);
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
    AccountInstanceEnterTimesMap::iterator it = _instanceEnterTimes.find(accountId);
    if (it == _instanceEnterTimes.end())
    {
        InstanceEnterTimesMap resetTimes;
        resetTimes[instanceId] = enterTime;
        _instanceEnterTimes[accountId] = resetTimes;
        return;
    }
    it->second[instanceId] = enterTime;
}

// Anticheat
void AccountPersistentData::WhisperedBy(MasterPlayer* whisperer)
{
    WhispersMap::iterator it = _whisperTargets.find(whisperer->GetGUIDLow());
    if (it != _whisperTargets.end())
        it->second.score = 0;
}

uint32 AccountPersistentData::CountWhispersTo(MasterPlayer* from, MasterPlayer* player)
{
    sAccountMgr.GetAccountPersistentData(player->GetSession()->GetAccountId()).WhisperedBy(from);
    WhisperData& data = _whisperTargets[player->GetGUIDLow()];
    ++data.whispers_count;
    if (data.whispers_count == 1)
        data.score = GetWhisperScore(from, player);
    return data.whispers_count-1;
}

bool AccountPersistentData::CanWhisper(MasterPlayer* player) const
{
    return sAnticheatLib->CanWhisper(*this, player);
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
    _mailsSent[toAccount] = time(NULL);
}

bool AccountPersistentData::CanMail(uint32 targetAccount)
{
    // Already sent a mail to this guy => OK
    if (_mailsSent.find(targetAccount) != _mailsSent.end())
        return true;

    uint32 totalScore = 0;
    time_t lastNonExpired = time(NULL) - sWorld.getConfig(CONFIG_UINT32_MAILSPAM_EXPIRE_SECS);
    for (auto it = _mailsSent.begin(); it != _mailsSent.end(); ++it)
        if (it->second >= lastNonExpired)
            totalScore++;
    uint32 allowedScore = sWorld.getConfig(CONFIG_UINT32_MAILSPAM_MAX_MAILS);
    return totalScore < allowedScore;
}
