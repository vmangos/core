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
    [](const Warden *warden, std::vector<std::string> &, ByteBuffer &scan)
    {
        auto const macWarden = reinterpret_cast<const WardenMac *>(warden);

        MANGOS_ASSERT(macWarden->_hashString.size() <= 0xFF);

        scan << static_cast<uint8>(macWarden->_hashString.size());

        // skip null terminator this way
        scan.append(macWarden->_hashString.c_str(), macWarden->_hashString.size());
    },
    // checker
    [](const Warden *warden, ByteBuffer &buff)
    {
        auto const macWarden = reinterpret_cast<const WardenMac *>(warden);

        uint8 sha[SHA_DIGEST_LENGTH];
        uint8 md5[MD5_DIGEST_LENGTH];

        buff.read(sha, sizeof(sha));
        buff.read(md5, sizeof(md5));

        return !!memcmp(sha, macWarden->_hashSHA, sizeof(sha)) || !!memcmp(md5, macWarden->_hashMD5, sizeof(md5));
    }, 128, sizeof(uint8) + SHA_DIGEST_LENGTH + MD5_DIGEST_LENGTH, "Mac string hash check"));
}

WardenMac::WardenMac(WorldSession *session, const BigNumber &K)
    : _fingerprintSaved(false), Warden(session, session->GetPlatform() == CLIENT_PLATFORM_X86 ? sWardenModuleMgr.GetMacModule() : nullptr, K)
{
    std::stringstream hash;

    // the only known capability of the Mac Warden module is hashing a string and sending back the hashed value
    // so at least we can make the string that we ask it to hash change by account, I guess...
    hash << "namreeb was here.  please be good.  your username is " << m_accountName;

    _hashString = hash.str();

    static constexpr uint32 magic = 0xFEEDFACE;

    Sha1Hash sha1;
    sha1.UpdateData(_hashString);
    if (_module) // this constant is only used if there is a module
        sha1.UpdateData(reinterpret_cast<const uint8 *>(&magic), sizeof(magic));
    sha1.Finalize();

    memcpy(_hashSHA, sha1.GetDigest(), sizeof(_hashSHA));

    MD5_CTX md5;
    MD5_Init(&md5);
    MD5_Update(&md5, _hashString.c_str(), _hashString.size());
    MD5_Final(_hashMD5, &md5);    
}

void WardenMac::Update()
{
    Warden::Update();

    if (!_initialized)
    {
        // PPC no module, begin string hashing requests directly
        if (!_module)
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

    if (!_fingerprintSaved)
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

        _fingerprintSaved = true;

        // at this point if we have the character enum packet, it is okay to send
        if (!_charEnum.empty())
        {
            sWorld.GetMessager().AddMessage([pkt = std::move(_charEnum), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
            {
                if (WorldSession* session = world->FindSession(accountId))
                {
                    if (session->GetGUID() == sessionGuid)
                        session->SendPacket(&pkt);
                }
            });
            _charEnum.clear();
        }
    }
}

void WardenMac::SetCharEnumPacket(WorldPacket &&packet)
{
    // if we have already recorded system information, send the packet immediately.  otherwise delay
    if (_initialized)
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
        _charEnum = std::move(packet);
}

uint32 WardenMac::GetScanFlags() const
{
    return ScanFlags::MacAllBuild;
}

void WardenMac::InitializeClient()
{
    _initialized = true;
}
