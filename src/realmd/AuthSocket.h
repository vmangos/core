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

#ifndef _AUTHSOCKET_H
#define _AUTHSOCKET_H

#include "Common.h"
#include "Crypto/BigNumber.h"
#include "Crypto/Hash/SHA1.h"
#include "Crypto/Authentication/SRP6.h"
#include "ByteBuffer.h"
#include "IO/Networking/AsyncSocket.h"
#include "IO/Timer/TimerHandle.h"
#include "IO/Filesystem/FileHandle.h"
#include "Policies/ObjectConstructorTraits.h"
#include "AuthPackets.h"

enum LockFlag
{
    NONE            = 0x00,
    IP_LOCK         = 0x01,
    FIXED_PIN       = 0x02,
    TOTP            = 0x04,
    ALWAYS_ENFORCE  = 0x08,
    GEO_COUNTRY     = 0x10,
    GEO_CITY        = 0x20
};

struct sAuthLogonProof_C;

/// Handle login commands
class AuthSocket : public std::enable_shared_from_this<AuthSocket>, MaNGOS::Policies::NoCopyNoMove
{
    public:
        explicit AuthSocket(IO::Networking::AsyncSocket socket);
        ~AuthSocket();

        void Start();

        void DoRecvIncomingData();
        std::shared_ptr<ByteBuffer> GenerateLogonProofResponse(Crypto::Hash::SHA1::Digest const& shaDigest);
        void LoadRealmlistAndWriteIntoBuffer(ByteBuffer& pkt);
        bool VerifyPinData(uint32 pin, PINData const& clientData);
        uint32 GenerateTotpPin(std::string const& secret, int interval);

        void _HandleLogonChallenge();
        void _HandleLogonProof();
        void _HandleLogonProof__PostRecv(std::shared_ptr<sAuthLogonProof_C const> const& lp, std::shared_ptr<PINData const> const& pinData);
        void _HandleLogonProof__PostRecv_HandleInvalidVersion(std::shared_ptr<sAuthLogonProof_C const> const& lp);
        void _HandleReconnectChallenge();
        void _HandleReconnectProof();
        void _HandleRealmList();

        //data transfer handle for patch
        void _HandleXferAccept();
        void _HandleXferResume();
        void _HandleXferCancel();

        /// Returns the IP of the peer e.g. "192.168.13.37"
        inline std::string const& GetRemoteIpString() const { return m_remoteIpAddressStringAfterProxy; }
        void CloseSocket();

    public: // A bit hacky, that this is public. In WorldSocket we have WorldSocketMgr as friend, this is not possible here
        IO::Networking::AsyncSocket m_socket;
        std::string m_remoteIpAddressStringAfterProxy; // might differ from `m_socket.m_descriptor` if behind proxy

    private:
        enum eStatus
        {
            STATUS_CHALLENGE,
            STATUS_LOGON_PROOF,
            STATUS_RECON_PROOF,
            STATUS_PATCH,
            STATUS_AUTHED,
            STATUS_INVALID,
        };

        bool VerifyVersion(uint8 const* a, int32 aLength, uint8 const* versionProof, bool isReconnect);

        SRP6 srp;
        BigNumber m_reconnectProof;

        bool m_promptPin = false;

        eStatus m_status = STATUS_CHALLENGE;

        std::string m_login;
        std::string m_safelogin;
        std::string m_securityInfo;
        std::string m_lastIP;
        std::string m_email;

        BigNumber m_serverSecuritySalt;
        LockFlag m_lockFlags = NONE;
        uint32 m_gridSeed = 0;
        uint32 m_geoUnlockPIN = 0;

        static constexpr uint32 Win = 'Win';
        static constexpr uint32 OSX = 'OSX';

        static constexpr uint32 X86 = 'x86';
        static constexpr uint32 PPC = 'PPC';

        std::string m_os;
        std::string m_platform;
        uint32 m_accountId = 0;
        nonstd::optional<std::chrono::steady_clock::time_point> m_lastRealmListRequest;

        // Since GetLocaleByName() is _NOT_ bijective, we have to store the locale as a string. Otherwise we can't differ
        // between enUS and enGB, which is important for the patch system
        std::string m_localizationName;
        uint16 m_build = 0;

        AccountTypes GetSecurityOn(uint32 realmId) const;
        void LoadAccountSecurityLevels(uint32 accountId);
        bool GeographicalLockCheck();

        AccountTypes m_accountDefaultSecurityLevel = SEC_PLAYER;
        typedef std::map<uint32, AccountTypes> AccountSecurityMap;
        AccountSecurityMap m_accountSecurityOnRealm;

        // Auto kick realmd client connection after some time
        std::shared_ptr<IO::Timer::TimerHandle> m_sessionDurationTimeout = nullptr;

        // Patching stuff
        void InitAndHandOverControlToPatchHandler();
        std::unique_ptr<IO::Filesystem::FileHandleReadonly> m_pendingPatchFile = nullptr;

        void RepeatInternalXferLoop(std::shared_ptr<XFER_DATA_CHUNK> const& chunkSharedPtr);
};

#endif
