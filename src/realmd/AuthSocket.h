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

/// \addtogroup realmd
/// @{
/// \file

#ifndef _AUTHSOCKET_H
#define _AUTHSOCKET_H

#include "Common.h"
#include "Auth/BigNumber.h"
#include "Auth/Sha1.h"
#include "ByteBuffer.h"

#include "BufferedSocket.h"

struct PINData
{
    uint8 salt[16];
    uint8 hash[20];
};

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

/// Handle login commands
class AuthSocket: public BufferedSocket
{
    public:
        const static int s_BYTE_SIZE = 32;

        AuthSocket();
        ~AuthSocket();

        void OnAccept();
        void OnRead();
        void SendProof(Sha1Hash sha);
        void LoadRealmlist(ByteBuffer &pkt);
        bool VerifyPinData(uint32 pin, const PINData& clientData);
        uint32 GenerateTotpPin(const std::string& secret, int interval);

        bool _HandleLogonChallenge();
        bool _HandleLogonProof();
        bool _HandleReconnectChallenge();
        bool _HandleReconnectProof();
        bool _HandleRealmList();
        //data transfer handle for patch

        bool _HandleXferResume();
        bool _HandleXferCancel();
        bool _HandleXferAccept();

        void _SetVSFields(const std::string& rI);

    private:
        enum eStatus
        {
            STATUS_CHALLENGE,
            STATUS_LOGON_PROOF,
            STATUS_RECON_PROOF,
            STATUS_PATCH,      // unused in CMaNGOS
            STATUS_AUTHED,
            STATUS_CLOSED
        };

        BigNumber N, s, g, v;
        BigNumber b, B;
        BigNumber K;
        BigNumber _reconnectProof;

        bool _authed, promptPin;

        eStatus _status;

        std::string _login;
        std::string _safelogin;
        std::string securityInfo;
        std::string _lastIP;
        std::string _email;

        BigNumber serverSecuritySalt;
        LockFlag lockFlags;
        uint32 gridSeed;
        bool _geolocked;
        uint32_t _geoUnlockPIN;

        static constexpr uint32 Win = 'Win';
        static constexpr uint32 OSX = 'OSX';

        static constexpr uint32 X86 = 'x86';
        static constexpr uint32 PPC = 'PPC';

        uint32 _os;
        uint32 _platform;
        uint32 _accountId;
        uint32 _lastRealmListRequest;

        // Since GetLocaleByName() is _NOT_ bijective, we have to store the locale as a string. Otherwise we can't differ
        // between enUS and enGB, which is important for the patch system
        std::string _localizationName;
        uint16 _build;

        AccountTypes GetSecurityOn(uint32 realmId) const;
        void LoadAccountSecurityLevels(uint32 accountId);
        bool GeographicalLockCheck();

        AccountTypes _accountDefaultSecurityLevel;
        typedef std::map<uint32, AccountTypes> AccountSecurityMap;
        AccountSecurityMap _accountSecurityOnRealm;

        ACE_HANDLE patch_;

        void InitPatch();
};
#endif
/// @}
