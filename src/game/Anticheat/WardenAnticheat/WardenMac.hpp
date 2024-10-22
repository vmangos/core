/*
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

 /*
  *
  * This code was written by namreeb (legal@namreeb.org) and is released with
  * permission as part of vmangos (https://github.com/vmangos/core)
  *
  */

#ifndef __WARDENMAC_HPP_
#define __WARDENMAC_HPP_

#include "Warden.hpp"
#include "WardenScan.hpp"
#include "WorldPacket.h"

#include <string>

class WorldSession;
class BigNumber;

class WardenMac final : public Warden
{
    private:
        bool m_fingerprintSaved;

        WorldPacket m_charEnum;

        virtual ScanFlags GetScanFlags() const;

        virtual void InitializeClient();

    public:
        static void LoadScriptedScans();

        WardenMac(WorldSession* session, BigNumber const& K);

        void Update();

        // set pending character enum packet (to be sent once we are satisfied that Warden is loaded)
        virtual void SetCharEnumPacket(WorldPacket&& packet);

        virtual void GetPlayerInfo(std::string& clock, std::string& fingerprint, std::string& hypervisors,
            std::string& endscene, std::string& proxifier) const {}
};

#endif /*!__WARDENMAC_HPP_*/