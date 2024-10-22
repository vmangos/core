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

#include "WardenMac.hpp"
#include "WardenModuleMgr.hpp"
#include "WardenScanMgr.hpp"
#include "WorldSession.h"
#include "World.h"
#include "Database/DatabaseEnv.h"

#include <memory>
#include <vector>
#include <string>

void WardenMac::LoadScriptedScans()
{
    sWardenScanMgr.AddMacScan(std::make_shared<MacStringHashScan>(true));
    sWardenScanMgr.AddMacScan(std::make_shared<MacStringHashScan>(false));
}

WardenMac::WardenMac(WorldSession* session, BigNumber const& K)
    : m_fingerprintSaved(false), Warden(session, session->GetPlatform() == CLIENT_PLATFORM_X86 ? sWardenModuleMgr.GetMacModule() : nullptr, K)
{
  
}

void WardenMac::Update()
{
    Warden::Update();

    if (!m_initialized)
    {
        if (m_maiev && !TimeoutClockStarted())
        {
            RequestScans(SelectScans(ScanFlags::Maiev));

            if (!m_module)
                BeginScanClock();
        }
        return;
    }

    if (!m_fingerprintSaved)
    {
        LogsDatabase.BeginTransaction();

        static SqlStatementID fingerprintUpdate;

        auto stmt = LogsDatabase.CreateStatement(fingerprintUpdate,
            "INSERT INTO system_fingerprint_usage (fingerprint, account, ip, realm) VALUES(?, ?, ?, ?)");

        stmt.addUInt32(0); // fingerprint not implemented
        stmt.addUInt32(m_accountId);
        stmt.addString(m_sessionIP);
        stmt.addUInt32(realmID);
        stmt.Execute();

        LogsDatabase.CommitTransaction();

        m_fingerprintSaved = true;

        // at this point if we have the character enum packet, it is okay to send
        if (!m_charEnum.empty())
        {
            sWorld.GetMessager().AddMessage([pkt = std::move(m_charEnum), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
            {
                if (WorldSession* session = world->FindSession(accountId))
                {
                    if (session->GetGUID() == sessionGuid)
                        session->SendPacket(&pkt);
                }
            });
            m_charEnum.clear();
        }
    }
}

void WardenMac::SetCharEnumPacket(WorldPacket&& packet)
{
    // if we have already recorded system information, send the packet immediately.  otherwise delay
    if (m_initialized)
    {
        sWorld.GetMessager().AddMessage([pkt = std::move(packet), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
        {
            if (WorldSession* session = world->FindSession(accountId))
            {
                if (session->GetGUID() == sessionGuid)
                    session->SendPacket(&pkt);
            }
        });
    }
    else
        m_charEnum = std::move(packet);
}

ScanFlags WardenMac::GetScanFlags() const
{
    ScanFlags scanFlags = ScanFlags::Mac;

    if (m_maiev)
        scanFlags = scanFlags | ScanFlags::Maiev;

    return scanFlags;
}

void WardenMac::InitializeClient()
{
    m_initialized = true;
}
