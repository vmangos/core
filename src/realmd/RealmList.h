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

// \addtogroup realmd
// @{
// \file

#ifndef _REALMLIST_H
#define _REALMLIST_H

#include "Common.h"
#include "RealmZone.h"
#include <array>

struct RealmBuildInfo
{
    uint8 majorVersion = 0;
    uint8 minorVersion = 0;
    uint8 bugfixVersion = 0;
    char hotfixVersion = 0;
    uint16 build = 0;
    uint32 os = 0;
    uint32 platform = 0;
    std::array<uint8, 20> integrityHash = { };
};

RealmBuildInfo const* FindBuildInfo(uint16 build);
std::vector<RealmBuildInfo const*> FindBuildInfo(uint16 build, uint32 os, uint32 platform);
uint8 GetRealmCategoryIdByBuildAndZone(uint16 build, RealmZone realmZone);
extern std::vector<RealmBuildInfo> ExpectedRealmdClientBuilds;

typedef std::set<uint32> RealmBuilds;

// Storage object for a realm
struct Realm
{
    uint32 id = 0;
    std::string address;
    std::string localAddress;
    uint32 localSubnetMask = 0;
    uint8 icon = 0;
    RealmFlags realmFlags = REALM_FLAG_NONE;
    uint8 timeZone = 0;
    AccountTypes allowedSecurityLevel = SEC_PLAYER;         // required security level to join (shows as locked for other accounts)
    float populationLevel = 0.0f;
    RealmBuilds realmBuilds;                                // list of supported builds (updated in DB by mangosd)
    RealmBuildInfo realmBuildInfo;                          // build info for showing version in list
};

// Storage object for the list of realms on the server
class RealmList
{
    public:
        typedef std::map<std::string, Realm> RealmMap;

        static RealmList& Instance();

        RealmList();
        ~RealmList() {}

        void Initialize(uint32 updateInterval);

        void UpdateIfNeed();

        RealmMap::const_iterator begin() const { return m_realms.begin(); }
        RealmMap::const_iterator end() const { return m_realms.end(); }
        uint32 size() const { return m_realms.size(); }
    private:
        void UpdateRealms(bool init);
        void UpdateRealm(uint32 realmId, std::string const& name, std::string const& address, std::string const& localAddress, std::string const& localSubnetMask, uint32 port, uint8 icon, RealmFlags realmFlags, uint8 timeZone, AccountTypes allowedSecurityLevel, float population, std::string const& builds);
        void LoadAllowedClients();
    private:
        RealmMap m_realms;                                  // Internal map of realms
        uint32   m_UpdateInterval;
        time_t   m_NextUpdateTime;
};

#define sRealmList RealmList::Instance()

#endif
// @}
