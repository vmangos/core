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
#include "Auth/BigNumber.h"
#include "Auth/Sha1.h"
#include "World.h"
#include "Database/DatabaseEnv.h"

#include <openssl/md5.h>

#include <memory>
#include <vector>
#include <string>
#include <sstream>

void WardenMac::LoadScriptedScans()
{
    sWardenScanMgr.AddMacScan(std::make_shared<MacScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const macWarden = reinterpret_cast<WardenMac const*>(warden);

        MANGOS_ASSERT(macWarden->m_hashString.size() <= 0xFF);

        scan << static_cast<uint8>(macWarden->m_hashString.size());

        // skip null terminator this way
        scan.append(macWarden->m_hashString.c_str(), macWarden->m_hashString.size());
    },
    // checker
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const macWarden = reinterpret_cast<WardenMac const*>(warden);

        uint8 sha[SHA_DIGEST_LENGTH];
        uint8 md5[MD5_DIGEST_LENGTH];

        buff.read(sha, sizeof(sha));
        buff.read(md5, sizeof(md5));

        return !!memcmp(sha, macWarden->m_hashSHA, sizeof(sha)) || !!memcmp(md5, macWarden->m_hashMD5, sizeof(md5));
    }, 128, sizeof(uint8) + SHA_DIGEST_LENGTH + MD5_DIGEST_LENGTH, "Mac string hash check", ScanFlags::Mac, 0, UINT16_MAX));
}

WardenMac::WardenMac(WorldSession* session, BigNumber const& K)
    : m_fingerprintSaved(false), Warden(session, session->GetPlatform() == CLIENT_PLATFORM_X86 ? sWardenModuleMgr.GetMacModule() : nullptr, K)
{
    std::stringstream hash;

    // the only known capability of the Mac Warden module is hashing a string and sending back the hashed value
    // so at least we can make the string that we ask it to hash change by account, I guess...
    hash << "namreeb was here.  please be good.  your username is " << m_accountName;

    m_hashString = hash.str();

    static constexpr uint32 magic = 0xFEEDFACE;

    Sha1Hash sha1;
    sha1.UpdateData(m_hashString);
    if (m_module) // this constant is only used if there is a module
        sha1.UpdateData(reinterpret_cast<uint8 const*>(&magic), sizeof(magic));
    sha1.Finalize();

    memcpy(m_hashSHA, sha1.GetDigest(), sizeof(m_hashSHA));

    MD5_CTX md5;
    MD5_Init(&md5);
    MD5_Update(&md5, m_hashString.c_str(), m_hashString.size());
    MD5_Final(m_hashMD5, &md5);    
}

void WardenMac::Update()
{
    Warden::Update();

    if (!m_initialized)
    {
        // PPC no module, begin string hashing requests directly
        if (!m_module)
        {
            InitializeClient();

            // send any initial hack scans that the scan manager may have for us
            RequestScans(SelectScans(ScanFlags::InitialLogin));

            // begin the scan clock (note that even if the clock expires before any initial scans are answered, no new
            // checks will be requested until the reply is received).
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
    return ScanFlags::Mac;
}

void WardenMac::InitializeClient()
{
    m_initialized = true;
}
