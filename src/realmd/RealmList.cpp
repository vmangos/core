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

/** \file
    \ingroup realmd
*/

#include "Common.h"
#include "RealmList.h"
#include "AuthCodes.h"
#include "Util.h"                                           // for Tokens typedef
#include "Policies/SingletonImp.h"
#include "Database/DatabaseEnv.h"

INSTANTIATE_SINGLETON_1( RealmList );

// list sorted from high to low build and first build used as low bound for accepted by default range (any > it will accepted by realmd at least)
static RealmBuildInfo ExpectedRealmdClientBuilds[] = {
    {13930, 3, 3, 5,  'a', {{}}, {{}}},                                  // 3.3.5a China Mainland build
    {12340, 3, 3, 5,  'a',
    { { 0xCD, 0xCB, 0xBD, 0x51, 0x88, 0x31, 0x5E, 0x6B, 0x4D, 0x19, 0x44, 0x9D, 0x49, 0x2D, 0xBC, 0xFA, 0xF1, 0x56, 0xA3, 0x47 } },
    { { 0xB7, 0x06, 0xD1, 0x3F, 0xF2, 0xF4, 0x01, 0x88, 0x39, 0x72, 0x94, 0x61, 0xE3, 0xF8, 0xA0, 0xE2, 0xB5, 0xFD, 0xC0, 0x34 } },
    },
    {11723, 3, 3, 3,  'a', {{}}, {{}}},
    {11403, 3, 3, 2,  ' ', {{}}, {{}}},
    {11159, 3, 3, 0,  'a', {{}}, {{}}},
    {10505, 3, 2, 2,  'a', {{}}, {{}}},
    {8606,  2, 4, 3,  ' ',
    { { 0x31, 0x9A, 0xFA, 0xA3, 0xF2, 0x55, 0x96, 0x82, 0xF9, 0xFF, 0x65, 0x8B, 0xE0, 0x14, 0x56, 0x25, 0x5F, 0x45, 0x6F, 0xB1 } },
    { { 0xD8, 0xB0, 0xEC, 0xFE, 0x53, 0x4B, 0xC1, 0x13, 0x1E, 0x19, 0xBA, 0xD1, 0xD4, 0xC0, 0xE8, 0x13, 0xEE, 0xE4, 0x99, 0x4F } },
    },
    {6141,  1, 12, 3, ' ',
    { { 0x2E, 0x52, 0x36, 0xE5, 0x66, 0xAE, 0xA9, 0xBF, 0xFA, 0x0C, 0xC0, 0x41, 0x67, 0x9C, 0x2D, 0xB5, 0x2E, 0x21, 0xC9, 0xDC } },
    {{}}},
    {6005,  1, 12, 2, ' ',
    { { 0x06, 0x97, 0x32, 0x38, 0x76, 0x56, 0x96, 0x41, 0x48, 0x79, 0x28, 0xFD, 0xC7, 0xC9, 0xE3, 0x3B, 0x44, 0x70, 0xC8, 0x80 } },
    {{}}},
    {5875,  1, 12, 1, ' ',
    { { 0x95, 0xED, 0xB2, 0x7C, 0x78, 0x23, 0xB3, 0x63, 0xCB, 0xDD, 0xAB, 0x56, 0xA3, 0x92, 0xE7, 0xCB, 0x73, 0xFC, 0xCA, 0x20 } },
    { { 0x8D, 0x17, 0x3C, 0xC3, 0x81, 0x96, 0x1E, 0xEB, 0xAB, 0xF3, 0x36, 0xF5, 0xE6, 0x67, 0x5B, 0x10, 0x1B, 0xB5, 0x13, 0xE5 } },
    },
    {5464,  1, 11, 2, ' ',
    {{ 0x4D, 0xF8, 0xA5, 0x05, 0xE4, 0xFE, 0x8D, 0x83, 0x33, 0x50, 0x8C, 0x0E, 0x85, 0x84, 0x65, 0xE3, 0x57, 0x17, 0x86, 0x83 }},
    {{}}},
    {5302,  1, 10, 2, ' ',
    { { 0x70, 0xDD, 0x18, 0x3C, 0xE6, 0x71, 0xE7, 0x99, 0x09, 0xE0, 0x25, 0x54, 0xE9, 0x4C, 0xBE, 0x3F, 0x2C, 0x33, 0x8C, 0x55 } },
    {{}}},
    {5086,  1, 9, 4,  ' ',
    { { 0xC5, 0x61, 0xB5, 0x2B, 0x3B, 0xDD, 0xDD, 0x17, 0x6A, 0x46, 0x43, 0x3C, 0x6D, 0x06, 0x7B, 0xA7, 0x45, 0xE6, 0xB0, 0x00 } },
    {{}}},
    {4878,  1, 8, 4,  ' ',
    { { 0x03, 0xDF, 0xB3, 0xC3, 0xF7, 0x24, 0x79, 0xF9, 0xBC, 0xC5, 0xED, 0xD8, 0xDC, 0xA1, 0x02, 0x5E, 0x8D, 0x11, 0xAF, 0x0F } },
    {{}}},
    {4695,  1, 7, 1,  ' ',
    { { 0x37, 0xC0, 0x12, 0x91, 0x27, 0x1C, 0xBB, 0x89, 0x1D, 0x8F, 0xEE, 0xC1, 0x5B, 0x2F, 0x14, 0x7A, 0xA3, 0xE4, 0x0C, 0x80 } },
    {{}}},
    {4620,  1, 6, 3,  ' ',
    { { 0x3C, 0x77, 0xED, 0x95, 0xD6, 0x00, 0xF9, 0xD4, 0x27, 0x0D, 0xA1, 0xA2, 0x91, 0xC7, 0xF6, 0x45, 0xCA, 0x4F, 0x2A, 0xAC } },
    {{}}},
    {4565,  1, 6, 2,  ' ',
    { { 0x1A, 0xC0, 0x2C, 0xE9, 0x3E, 0x7B, 0x82, 0xD1, 0x7E, 0x87, 0x18, 0x75, 0x8D, 0x67, 0xF5, 0x9F, 0xB0, 0xCA, 0x4B, 0x5D } },
    {{}}},
    {4544,  1, 6, 1,  ' ',
    { { 0xD7, 0xAC, 0x29, 0x0C, 0xC2, 0xE4, 0x2F, 0x9C, 0xC8, 0x3A, 0x90, 0x23, 0x80, 0x3A, 0x43, 0x24, 0x43, 0x59, 0xF0, 0x30 } },
    {{}}},
    {0,     0, 0, 0,  ' ', {{}}, {{}}}                                   // terminator
};

RealmBuildInfo const* FindBuildInfo(uint16 _build)
{
    // first build is low bound of always accepted range
    if (_build >= ExpectedRealmdClientBuilds[0].build)
        return &ExpectedRealmdClientBuilds[0];

    // continue from 1 with explicit equal check
    for(int i = 1; ExpectedRealmdClientBuilds[i].build; ++i)
        if(_build == ExpectedRealmdClientBuilds[i].build)
            return &ExpectedRealmdClientBuilds[i];

    // none appropriate build
    return nullptr;
}

RealmList::RealmList( ) : m_UpdateInterval(0), m_NextUpdateTime(time(nullptr))
{
}

RealmList& sRealmList
{
    static RealmList realmlist;
    return realmlist;
}

/// Load the realm list from the database
void RealmList::Initialize(uint32 updateInterval)
{
    m_UpdateInterval = updateInterval;

    ///- Get the content of the realmlist table in the database
    UpdateRealms(true);
}

void RealmList::UpdateRealm( uint32 ID, const std::string& name, const std::string& address, uint32 port, uint8 icon, RealmFlags realmflags, uint8 timezone, AccountTypes allowedSecurityLevel, float popu, const std::string& builds)
{
    ///- Create new if not exist or update existed
    Realm& realm = m_realms[name];

    realm.m_ID       = ID;
    realm.icon       = icon;
    realm.realmflags = realmflags;
    realm.timezone   = timezone;
    realm.allowedSecurityLevel = allowedSecurityLevel;
    realm.populationLevel      = popu;

    Tokens tokens = StrSplit(builds, " ");
    Tokens::iterator iter;

    for (iter = tokens.begin(); iter != tokens.end(); ++iter)
    {
        uint32 build = atol((*iter).c_str());
        realm.realmbuilds.insert(build);
    }

    uint16 first_build = !realm.realmbuilds.empty() ? *realm.realmbuilds.begin() : 0;

    realm.realmBuildInfo.build = first_build;
    realm.realmBuildInfo.major_version = 0;
    realm.realmBuildInfo.minor_version = 0;
    realm.realmBuildInfo.bugfix_version = 0;
    realm.realmBuildInfo.hotfix_version = ' ';

    if (first_build)
        if (RealmBuildInfo const* bInfo = FindBuildInfo(first_build))
            if (bInfo->build == first_build)
                realm.realmBuildInfo = *bInfo;

    ///- Append port to IP address.
    std::ostringstream ss;
    ss << address << ":" << port;
    realm.address   = ss.str();
}

void RealmList::UpdateIfNeed()
{
    // maybe disabled or updated recently
    if(!m_UpdateInterval || m_NextUpdateTime > time(nullptr))
        return;

    m_NextUpdateTime = time(nullptr) + m_UpdateInterval;

    // Clears Realm list
    m_realms.clear();

    // Get the content of the realmlist table in the database
    UpdateRealms(false);
}

void RealmList::UpdateRealms(bool init)
{
    DETAIL_LOG("Updating Realm List...");

    QueryResult *result = LoginDatabase.Query(
        //       0     1       2          3       4       5             6
        "SELECT `id`, `name`, `address`, `port`, `icon`, `realmflags`, `timezone`, "
        // 7                      8             9
        "`allowedSecurityLevel`, `population`, `realmbuilds` FROM `realmlist` "
        "WHERE (`realmflags` & 1) = 0 ORDER BY `name`");

    ///- Circle through results and add them to the realm map
    if(result)
    {
        do
        {
            Field *fields = result->Fetch();

            uint8 allowedSecurityLevel = fields[7].GetUInt8();

            uint8 realmflags = fields[5].GetUInt8();

            if (realmflags & ~(REALM_FLAG_OFFLINE|REALM_FLAG_NEW_PLAYERS|REALM_FLAG_RECOMMENDED|REALM_FLAG_SPECIFYBUILD))
            {
                sLog.outError("Realm allowed have only OFFLINE Mask 0x2), or NEWPLAYERS (mask 0x20), or RECOMENDED (mask 0x40), or SPECIFICBUILD (mask 0x04) flags in DB");
                realmflags &= (REALM_FLAG_OFFLINE|REALM_FLAG_NEW_PLAYERS|REALM_FLAG_RECOMMENDED|REALM_FLAG_SPECIFYBUILD);
            }

            UpdateRealm(
                fields[0].GetUInt32(), fields[1].GetCppString(),fields[2].GetCppString(),fields[3].GetUInt32(),
                fields[4].GetUInt8(), RealmFlags(realmflags), fields[6].GetUInt8(),
                (allowedSecurityLevel <= SEC_ADMINISTRATOR ? AccountTypes(allowedSecurityLevel) : SEC_ADMINISTRATOR),
                fields[8].GetFloat(), fields[9].GetCppString());

            if(init)
                sLog.outString("Added realm \"%s\"", fields[1].GetString());
        } while( result->NextRow() );
        delete result;
    }
}
