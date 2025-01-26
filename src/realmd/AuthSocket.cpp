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
#include "Crypto/Hash/HMACSHA1.h"
#include "Auth/base32.h"
#include "Database/DatabaseEnv.h"
#include "Config/Config.h"
#include "Log.h"
#include "RealmList.h"
#include "AuthSocket.h"
#include "AuthCodes.h"
#include "PatchHandler.h"
#include "Util.h"

#ifdef ENABLE_MAILSENDER
#include "MailerService.h"
#include "SendgridMail.h"
#endif

#include <ctime>
//#include "Util.h" -- for commented utf8ToUpperOnlyLatin

#include <ace/OS_NS_unistd.h>
#include <ace/OS_NS_fcntl.h>
#include <ace/OS_NS_sys_stat.h>

enum AccountFlags
{
    ACCOUNT_FLAG_GM         = 0x00000001,
    ACCOUNT_FLAG_TRIAL      = 0x00000008,
    ACCOUNT_FLAG_PROPASS    = 0x00800000,
};

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push,N), also any gcc version not support it at some paltform
#if defined( __GNUC__ )
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

typedef struct AUTH_LOGON_CHALLENGE_C
{
    uint8   cmd;
    uint8   error;
    uint16  size;
    uint8   gamename[4];
    uint8   version1;
    uint8   version2;
    uint8   version3;
    uint16  build;
    uint8   platform[4];
    uint8   os[4];
    uint8   country[4];
    uint32  timezone_bias;
    uint32  ip;
    uint8   I_len;
    uint8   I[1];
} sAuthLogonChallenge_C;

//typedef sAuthLogonChallenge_C sAuthReconnectChallenge_C;
/*
typedef struct
{
    uint8   cmd;
    uint8   error;
    uint8   unk2;
    uint8   B[32];
    uint8   g_len;
    uint8   g[1];
    uint8   N_len;
    uint8   N[32];
    uint8   s[32];
    uint8   unk3[16];
} sAuthLogonChallenge_S;
*/

struct sAuthLogonProof_C_Base
{
    uint8   cmd;
    uint8   A[32];
    uint8   M1[20];
    uint8   crc_hash[20];
    uint8   number_of_keys;
};

struct sAuthLogonProof_C_1_11 : public sAuthLogonProof_C_Base
{
    uint8   securityFlags;                                  // 0x00-0x04
};
/*
typedef struct
{
    uint16  unk1;
    uint32  unk2;
    uint8   unk3[4];
    uint16  unk4[20];
}  sAuthLogonProofKey_C;
*/
typedef struct AUTH_LOGON_PROOF_S_BUILD_8089
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  accountFlags;                                   // see enum AccountFlags
    uint32  surveyId;                                       // SurveyId
    uint16  loginFlags;                                     // some flags (AccountMsgAvailable = 0x01)
} sAuthLogonProof_S_BUILD_8089;

typedef struct AUTH_LOGON_PROOF_S_BUILD_6299
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  surveyId;                                       // SurveyId
    uint16  loginFlags;                                     // some flags (AccountMsgAvailable = 0x01)
} sAuthLogonProof_S_BUILD_6299;

typedef struct AUTH_LOGON_PROOF_S
{
    uint8   cmd;
    uint8   error;
    uint8   M2[20];
    uint32  surveyId;                                       // SurveyId
} sAuthLogonProof_S;

typedef struct AUTH_RECONNECT_PROOF_C
{
    uint8   cmd;
    uint8   R1[16];
    uint8   R2[20];
    uint8   R3[20];
    uint8   number_of_keys;
} sAuthReconnectProof_C;

typedef struct XFER_INIT
{
    uint8 cmd;                                              // XFER_INITIATE
    uint8 fileNameLen;                                      // strlen(fileName);
    uint8 fileName[5];                                      // fileName[fileNameLen]
    uint64 file_size;                                       // file size (bytes)
    uint8 md5[Crypto::Hash::MD5::Digest::size()];           // MD5
}XFER_INIT;

typedef struct AuthHandler
{
    eAuthCmd cmd;
    uint32 status;
    bool (AuthSocket::*handler)(void);
}AuthHandler;

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some paltform
#if defined( __GNUC__ )
#pragma pack()
#else
#pragma pack(pop)
#endif

#define AUTH_TOTAL_COMMANDS sizeof(table)/sizeof(AuthHandler)

std::array<uint8, 16> VersionChallenge = { { 0xBA, 0xA3, 0x1E, 0x99, 0xA0, 0x0B, 0x21, 0x57, 0xFC, 0x37, 0x3F, 0xB3, 0x69, 0xCD, 0xD2, 0xF1 } };

// Close patch file descriptor before leaving
AuthSocket::~AuthSocket()
{
    if(m_patch != ACE_INVALID_HANDLE)
        ACE_OS::close(m_patch);
}

AccountTypes AuthSocket::GetSecurityOn(uint32 realmId) const
{
    AccountSecurityMap::const_iterator it = m_accountSecurityOnRealm.find(realmId);
    if (it == m_accountSecurityOnRealm.end())
        return m_accountDefaultSecurityLevel;
    return it->second;
}

// Accept the connection and set the s random value for SRP6
void AuthSocket::OnAccept()
{
    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Accepting connection from '%s'", get_remote_address().c_str());
}

// Read the packet from the client
void AuthSocket::OnRead()
{
    // benchmarking has demonstrated that this lookup method is faster than std::map
    const static AuthHandler table[] =
    {
        { CMD_AUTH_LOGON_CHALLENGE,     STATUS_CHALLENGE,   &AuthSocket::_HandleLogonChallenge },
        { CMD_AUTH_LOGON_PROOF,         STATUS_LOGON_PROOF, &AuthSocket::_HandleLogonProof },
        { CMD_AUTH_RECONNECT_CHALLENGE, STATUS_CHALLENGE,   &AuthSocket::_HandleReconnectChallenge },
        { CMD_AUTH_RECONNECT_PROOF,     STATUS_RECON_PROOF, &AuthSocket::_HandleReconnectProof },
        { CMD_REALM_LIST,               STATUS_AUTHED,      &AuthSocket::_HandleRealmList },
        { CMD_XFER_ACCEPT,              STATUS_PATCH,       &AuthSocket::_HandleXferAccept },
        { CMD_XFER_RESUME,              STATUS_PATCH,       &AuthSocket::_HandleXferResume },
        { CMD_XFER_CANCEL,              STATUS_PATCH,       &AuthSocket::_HandleXferCancel }
    };

    uint8 _cmd;
    while (1)
    {
        if(!recv_soft((char *)&_cmd, 1))
            return;

        size_t i;

        // Circle through known commands and call the correct command handler
        for (i = 0; i < AUTH_TOTAL_COMMANDS; ++i)
        {
            if (table[i].cmd != _cmd)
                continue;

            // unauthorized
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[Auth] Status %u, table status %u", m_status, table[i].status);

            if (table[i].status != m_status)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[Auth] Received unauthorized command %u length %u", _cmd, (uint32)recv_len());
                return;
            }

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[Auth] Got data for cmd %u recv length %u", _cmd, (uint32)recv_len());

            if (!(*this.*table[i].handler)())
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[Auth] Command handler failed for cmd %u recv length %u", _cmd, (uint32)recv_len());
                close_connection();
                return;
            }

            break;
        }

        // Report unknown commands in the debug log
        if (i == AUTH_TOTAL_COMMANDS)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[Auth] got unknown packet %u", (uint32)_cmd);
            return;
        }
    }
}

void AuthSocket::SendProof(Crypto::Hash::SHA1::Digest sha)
{
    if (m_build < 6299)  // before version 2.0.3 (exclusive)
    {
        sAuthLogonProof_S proof;
        memcpy(proof.M2, sha.data(), sha.size());
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.surveyId = 0x00000000;

        send((char *)&proof, sizeof(proof));
    }
    else if (m_build < 8089) // before version 2.4.0 (exclusive)
    {
        sAuthLogonProof_S_BUILD_6299 proof;
        memcpy(proof.M2, sha.data(), sha.size());
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.surveyId = 0x00000000;
        proof.loginFlags = 0x0000;

        send((char *)&proof, sizeof(proof));
    }
    else
    {
        sAuthLogonProof_S_BUILD_8089 proof;
        memcpy(proof.M2, sha.data(), sha.size());
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.accountFlags = ACCOUNT_FLAG_PROPASS;
        proof.surveyId = 0x00000000;
        proof.loginFlags = 0x0000;

        send((char *)&proof, sizeof(proof));
    }
}

// Logon Challenge command handler
bool AuthSocket::_HandleLogonChallenge()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleLogonChallenge");
    if (recv_len() < sizeof(sAuthLogonChallenge_C))
        return false;

    // Read the first 4 bytes (header) to get the length of the remaining of the packet
    std::vector<uint8> buf;
    buf.resize(4);

    recv((char *)&buf[0], 4);

    EndianConvert(*((uint16*)(&buf[0])));
    uint16 remaining = ((sAuthLogonChallenge_C *)&buf[0])->size;
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] got header, body is %#04x bytes", remaining);

    if ((remaining < sizeof(sAuthLogonChallenge_C) - buf.size()) || (recv_len() < remaining))
        return false;

    // Session is closed unless overriden
    m_status = STATUS_CLOSED;

    // No big fear of memory outage (size is int16, i.e. < 65536)
    buf.resize(remaining + buf.size() + 1);
    buf[buf.size() - 1] = 0;
    sAuthLogonChallenge_C *ch = (sAuthLogonChallenge_C*)&buf[0];

    // Read the remaining of the packet
    recv((char *)&buf[4], remaining);
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] got full packet, %#04x bytes", ch->size);
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] name(%d): '%s'", ch->I_len, ch->I);

    // BigEndian code, nop in little endian case
    // size already converted
    EndianConvert(*((uint32*)(&ch->gamename[0])));
    EndianConvert(ch->build);
    EndianConvert(*((uint32*)(&ch->os[0])));
    EndianConvert(*((uint32*)(&ch->country[0])));
    EndianConvert(ch->timezone_bias);
    EndianConvert(ch->ip);

    ByteBuffer pkt;

    m_login = (const char*)ch->I;
    m_build = ch->build;

    ch->os[3] = '\0';
    std::reverse(ch->os, ch->os + 3);
    memcpy(&m_os, ch->os, sizeof(m_os));

    ch->platform[3] = '\0';
    std::reverse(ch->platform, ch->platform + 3);
    memcpy(&m_platform, ch->platform, sizeof(m_platform));

    // Normalize account name
    // utf8ToUpperOnlyLatin(m_login); -- client already send account in expected form

    // Escape the user login to avoid further SQL injection
    // Memory will be freed on AuthSocket object destruction
    m_safelogin = m_login;
    LoginDatabase.escape_string(m_safelogin);

    pkt << (uint8) CMD_AUTH_LOGON_CHALLENGE;
    pkt << (uint8) 0x00;

    // Verify that this IP is not in the ip_banned table
    // No SQL injection possible (paste the IP address as passed by the socket)
    std::string address = get_remote_address();
    LoginDatabase.escape_string(address);
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `unbandate` FROM `ip_banned` WHERE "
    //    permanent                    still banned
        "(`unbandate` = `bandate` OR `unbandate` > UNIX_TIMESTAMP()) AND `ip` = '%s'", address.c_str());
    if (result)
    {
        pkt << (uint8)WOW_FAIL_DB_BUSY;
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Banned ip '%s' tries to login with account '%s'!", get_remote_address().c_str(), m_login.c_str());
    }
    else
    {
        // Get the account details from the account table
        // No SQL injection (escaped user name)
        //                                     0     1         2          3    4    5           6              7              8       9
        result = LoginDatabase.PQuery("SELECT `id`, `locked`, `last_ip`, `v`, `s`, `security`, `email_verif`, `geolock_pin`, `email`, UNIX_TIMESTAMP(`joindate`) FROM `account` WHERE `username` = '%s'",m_safelogin.c_str ());
        if (result)
        {
            Field* fields = result->Fetch();

            // Prevent login if the user's email address has not been verified
            bool requireVerification = sConfig.GetBoolDefault("ReqEmailVerification", false);
            int32 requireEmailSince = sConfig.GetIntDefault("ReqEmailSince", 0);
            bool verified = (*result)[6].GetBool();
            
            // Prevent login if the user's join date is bigger than the timestamp in configuration
            if (requireEmailSince > 0)
            {
                uint32 t = (*result)[9].GetUInt32();
                requireVerification = requireVerification && (t >= uint32(requireEmailSince));
            }

            if (requireVerification && !verified)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s 'email address requires email verification - rejecting login", m_login.c_str(), get_remote_address().c_str());
                pkt << (uint8)WOW_FAIL_UNKNOWN_ACCOUNT;
                send((char const*)pkt.contents(), pkt.size());
                return true;
            }

            // If the IP is 'locked', check that the player comes indeed from the correct IP address
            bool locked = false;
            m_lockFlags = (LockFlag)(*result)[1].GetUInt32();
            m_securityInfo = (*result)[5].GetCppString();
            m_lastIP = fields[2].GetString();
            m_geoUnlockPIN = fields[7].GetUInt32();
            m_email = fields[8].GetCppString();

            if (m_lockFlags & IP_LOCK)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account '%s' is locked to IP - '%s'", m_login.c_str(), m_lastIP.c_str());
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Player address is '%s'", get_remote_address().c_str());

                if (m_lastIP != get_remote_address())
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account IP differs");

                    // account is IP locked and the player does not have 2FA enabled
                    if (((m_lockFlags & TOTP) != TOTP && (m_lockFlags & FIXED_PIN) != FIXED_PIN))
                        pkt << (uint8) WOW_FAIL_SUSPENDED;

                    locked = true;
                }
                else
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account IP matches");
                }
            }
            else
            {
                sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account '%s' is not locked to ip", m_login.c_str());
            }

            std::string databaseV = fields[3].GetCppString();
            std::string databaseS = fields[4].GetCppString();
            bool broken = false;

            if (!srp.SetVerifier(databaseV.c_str()) || !srp.SetSalt(databaseS.c_str()))
            {
                pkt << (uint8)WOW_FAIL_FAIL_NOACCESS;
                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Broken v/s values in database for account %s!", m_login.c_str());
                broken = true;
            }

            if ((!locked || (locked && (m_lockFlags & FIXED_PIN || m_lockFlags & TOTP))) && !broken)
            {
                uint32 account_id = fields[0].GetUInt32();
                // If the account is banned, reject the logon attempt
                std::unique_ptr<QueryResult> banResult = LoginDatabase.PQuery("SELECT `bandate`, `unbandate` FROM `account_banned` WHERE "
                    "`id` = %u AND `active` = 1 AND (`unbandate` > UNIX_TIMESTAMP() OR `unbandate` = `bandate`) LIMIT 1", account_id);
                if (banResult)
                {
                    if((*banResult)[0].GetUInt64() == (*banResult)[1].GetUInt64())
                    {
                        pkt << (uint8) WOW_FAIL_BANNED;
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Banned account '%s' using IP '%s' tries to login!",m_login.c_str (), get_remote_address().c_str());
                    }
                    else
                    {
                        pkt << (uint8) WOW_FAIL_SUSPENDED;
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Temporarily banned account '%s' using IP '%s' tries to login!",m_login.c_str (), get_remote_address().c_str());
                    }
                }
                else
                {
                    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "database authentication values: v='%s' s='%s'", databaseV.c_str(), databaseS.c_str());

                    BigNumber s;
                    s.SetHexStr(databaseS.c_str());

                    srp.CalculateHostPublicEphemeral();

                    // Fill the response packet with the result
                    pkt << uint8(WOW_SUCCESS);

                    // B may be calculated < 32B so we force minimal length to 32B
                    pkt.append(srp.GetHostPublicEphemeral().AsByteArray(32).data(), 32); // 32 bytes
                    pkt << uint8(1);
                    pkt.append(srp.GetGeneratorModulo().AsByteArray().data(), 1);
                    pkt << uint8(32);
                    pkt.append(srp.GetPrime().AsByteArray(32).data(), 32);
                    pkt.append(s.AsByteArray());        // 32 bytes
                    pkt.append(VersionChallenge.data(), VersionChallenge.size());

                    // figure out whether we need to display the PIN grid
                    m_promptPin = locked; // always prompt if the account is IP locked & 2FA is enabled

                    if ((!locked && ((m_lockFlags & ALWAYS_ENFORCE) == ALWAYS_ENFORCE)) || m_geoUnlockPIN)
                    {
                        m_promptPin = true; // prompt if the lock hasn't been triggered but ALWAYS_ENFORCE is set
                    }

                    if (m_promptPin)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' requires PIN authentication", m_login.c_str(), get_remote_address().c_str());

                        uint32 gridSeedPkt = m_gridSeed = static_cast<uint32>(rand32());
                        EndianConvert(gridSeedPkt);
                        m_serverSecuritySalt.SetRand(16 * 8); // 16 bytes random

                        pkt << uint8(1); // securityFlags, only '1' is available in classic (PIN input)
                        pkt << gridSeedPkt;
                        pkt.append(m_serverSecuritySalt.AsByteArray(16).data(), 16);
                    }
                    else
                    {
                        if (m_build >= 5428)        // version 1.11.0 or later
                            pkt << uint8(0);
                    }

                    m_localizationName.resize(4);
                    for(int i = 0; i < 4; ++i)
                        m_localizationName[i] = ch->country[4-i-1];

                    LoadAccountSecurityLevels(account_id);
                    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' is using '%c%c%c%c' locale (%u)", m_login.c_str (), get_remote_address().c_str(), ch->country[3], ch->country[2], ch->country[1], ch->country[0], GetLocaleByName(m_localizationName));

                    m_accountId = account_id;

                    // All good, await client's proof
                    m_status = STATUS_LOGON_PROOF;
                }
            }
        }
        else                                                // no account
        {
            pkt<< (uint8) WOW_FAIL_UNKNOWN_ACCOUNT;
        }
    }
    send((char const*)pkt.contents(), pkt.size());
    return true;
}

// Logon Proof command handler
bool AuthSocket::_HandleLogonProof()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleLogonProof");

    sAuthLogonProof_C_1_11 lp;
    
    // Read the packet
    if (m_build < 5428)        // before version 1.11.0 (exclusive)
    {
        if (!recv((char *)&lp, sizeof(sAuthLogonProof_C_Base)))
            return false;
        lp.securityFlags = 0;
    }
    else
    {
        if (!recv((char *)&lp, sizeof(sAuthLogonProof_C_1_11)))
            return false;  
    }

    PINData pinData;

    if (lp.securityFlags)
    {
        if (!recv((char*)&pinData, sizeof(pinData)))
            return false;
    }

    // Check if the client has one of the expected version numbers
    bool valid_version = FindBuildInfo(m_build) != nullptr;

    // Session is closed unless overriden
    m_status = STATUS_CLOSED;

    // <ul><li> If the client has no valid version
    if(!valid_version)
    {
        if (this->m_patch != ACE_INVALID_HANDLE)
            return false;

        // Check if we have the apropriate patch on the disk
        // file looks like: 65535enGB.mpq
        char tmp[256];

        snprintf(tmp, 256, "%s/%d%s.mpq", sConfig.GetStringDefault("PatchesDir","./patches").c_str(), m_build, m_localizationName.c_str());

        char filename[PATH_MAX];
        if (ACE_OS::realpath(tmp, filename) != nullptr)
        {
            m_patch = ACE_OS::open(filename, GENERIC_READ | FILE_FLAG_SEQUENTIAL_SCAN);
        }

        if (m_patch == ACE_INVALID_HANDLE)
        {
            // no patch found
            ByteBuffer pkt;
            pkt << (uint8) CMD_AUTH_LOGON_CHALLENGE;
            pkt << (uint8) 0x00;
            pkt << (uint8) WOW_FAIL_VERSION_INVALID;
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] %u is not a valid client version!", m_build);
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Patch %s not found", tmp);
            send((char const*)pkt.contents(), pkt.size());
            return true;
        }

        XFER_INIT xferh;

        ACE_OFF_T file_size = ACE_OS::filesize(this->m_patch);

        if (file_size == -1)
        {
            close_connection();
            return false;
        }

        if (!PatchCache::instance()->GetHash(tmp, (uint8*)&xferh.md5))
        {
            // calculate patch md5, happens if patch was added while realmd was running
            PatchCache::instance()->LoadPatchMD5(tmp);
            PatchCache::instance()->GetHash(tmp, (uint8*)&xferh.md5);
        }

        uint8 data[2] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_VERSION_UPDATE};
        send((const char*)data, sizeof(data));

        memcpy(&xferh, "0\x05Patch", 7);
        xferh.cmd = CMD_XFER_INITIATE;
        xferh.file_size = file_size;

        send((const char*)&xferh, sizeof(xferh));

        // Set right status
        m_status = STATUS_PATCH;

        return true;
    }
    // </ul>

    // Continue the SRP6 calculation based on data received from the client
    if (!srp.CalculateSessionKey(lp.A, 32))
        return false;

    srp.HashSessionKey();
    srp.CalculateProof(m_login);

    // Check PIN data is correct
    bool pinResult = true;

    if (m_promptPin && !lp.securityFlags)
        pinResult = false; // expected PIN data but did not receive it

    if (m_promptPin && lp.securityFlags)
    {
        if ((m_lockFlags & FIXED_PIN) == FIXED_PIN)
        {
            pinResult = VerifyPinData(std::stoi(m_securityInfo), pinData);
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' PIN result: %u", m_login.c_str(), get_remote_address().c_str(), pinResult);
        }
        else if ((m_lockFlags & TOTP) == TOTP)
        {
            for (int i = -2; i != 2; ++i)
            {
                auto pin = GenerateTotpPin(m_securityInfo, i);

                if (pin == uint32(-1))
                    break;

                if ((pinResult = VerifyPinData(pin, pinData)))
                    break;
            }
        }
        else if (m_geoUnlockPIN)
        {
            pinResult = VerifyPinData(m_geoUnlockPIN, pinData);
        }
        else
        {
            pinResult = false;
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] Invalid PIN flags set for user %s - user cannot log-in until fixed", m_login.c_str());
        }
    }

    // Check if SRP6 results match (password is correct), else send an error
    if (!srp.Proof(lp.M1, 20) && pinResult)
    {
        if (!VerifyVersion(lp.A, sizeof(lp.A), lp.crc_hash, false))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account %s tried to login with modified client!", m_login.c_str());
            char data[2] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_VERSION_INVALID };
            send(data, sizeof(data));
            return true;
        }

        // Geolocking checks must be done after an otherwise successful login to prevent lockout attacks
        if (m_geoUnlockPIN) // remove the PIN to unlock the account since login succeeded
        {
            auto result = LoginDatabase.PExecute("UPDATE `account` SET `geolock_pin` = 0 WHERE `username` = '%s'",
                m_safelogin.c_str());

            if (!result)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to remove geolock PIN for %s - account has not been unlocked", m_safelogin.c_str());
            }
        }
        else if (GeographicalLockCheck())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Account '%s' (%u) using IP '%s' has been geolocked", m_login.c_str(), m_accountId, get_remote_address().c_str()); // todo, add additional logging info

            auto pin = urand(100000, 999999); // check rand32_max
            auto result = LoginDatabase.PExecute("UPDATE `account` SET `geolock_pin` = %u WHERE `username` = '%s'",
                pin, m_safelogin.c_str());

            if (!result)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to write geolock PIN for %s - account has not been locked", m_safelogin.c_str());

                char data[2] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_DB_BUSY };
                send(data, sizeof(data));
                return true;
            }

#ifdef ENABLE_MAILSENDER
            if (sConfig.GetBoolDefault("SendMail", false))
            {
                auto mail = std::make_unique<SendgridMail>
                (
                    sConfig.GetStringDefault("SendGridKey", ""),
                    sConfig.GetStringDefault("GeolockGUID", "")
                );

                mail->recipient(m_email);
                mail->from(sConfig.GetStringDefault("MailFrom", ""));
                mail->substitution("%username%", m_login);
                mail->substitution("%unlock_pin%", std::to_string(pin));
                mail->substitution("%originating_ip%", get_remote_address());

                MailerService::get_global_mailer()->send(std::move(mail),
                    [](SendgridMail::Result res)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Mail result: %d", res);
                    }
                );
            }
#endif

            char data[2] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_PARENTCONTROL };
            send(data, sizeof(data));
            return true;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' successfully authenticated", m_login.c_str(), get_remote_address().c_str());

        // Update the sessionkey, last_ip, last login time and reset number of failed logins in the account table for this account
        // No SQL injection (escaped user name) and IP address as received by socket
        std::string K_hex = srp.GetStrongSessionKey().AsHexStr();
        const char *os = reinterpret_cast<char *>(&m_os); // no injection as there are only two possible values
        const char *platform = reinterpret_cast<char *>(&m_platform); // no injection as there are only two possible values
        std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("UPDATE `account` SET `sessionkey` = '%s', `last_ip` = '%s', `last_login` = NOW(), `locale` = '%u', `failed_logins` = 0, `os` = '%s', `platform` = '%s' WHERE `username` = '%s'",
            K_hex.c_str(), get_remote_address().c_str(), GetLocaleByName(m_localizationName), os, platform, m_safelogin.c_str() );

        // Finish SRP6 and send the final result to the client
        Crypto::Hash::SHA1::Digest sha = srp.Finalize();

        SendProof(sha);
        m_status = STATUS_AUTHED;
    }
    else
    {
        if (m_build > 6005)                                  // > 1.12.2
        {
            char data[4] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_UNKNOWN_ACCOUNT, 0, 0};
            send(data, sizeof(data));
        }
        else
        {
            // 1.x not react incorrectly at 4-byte message use 3 as real error
            char data[2] = { CMD_AUTH_LOGON_PROOF, WOW_FAIL_UNKNOWN_ACCOUNT};
            send(data, sizeof(data));
        }
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' tried to login with wrong password!", m_login.c_str (), get_remote_address().c_str());

        uint32 MaxWrongPassCount = sConfig.GetIntDefault("WrongPass.MaxCount", 0);
        if(MaxWrongPassCount > 0)
        {
            //Increment number of failed logins by one and if it reaches the limit temporarily ban that account or IP
            LoginDatabase.PExecute("UPDATE `account` SET `failed_logins` = `failed_logins` + 1 WHERE `username` = '%s'",m_safelogin.c_str());

            if(std::unique_ptr<QueryResult> failedLoginsDbResult = LoginDatabase.PQuery("SELECT `id`, `failed_logins` FROM `account` WHERE `username` = '%s'", m_safelogin.c_str()))
            {
                Field* fields = failedLoginsDbResult->Fetch();
                uint32 failed_logins = fields[1].GetUInt32();

                if( failed_logins >= MaxWrongPassCount )
                {
                    uint32 WrongPassBanTime = sConfig.GetIntDefault("WrongPass.BanTime", 600);
                    bool WrongPassBanType = sConfig.GetBoolDefault("WrongPass.BanType", false);

                    if(WrongPassBanType)
                    {
                        uint32 acc_id = fields[0].GetUInt32();
                        LoginDatabase.PExecute("INSERT INTO `account_banned` (`id`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`, `realm`) "
                            "VALUES ('%u',UNIX_TIMESTAMP(),UNIX_TIMESTAMP()+'%u','MaNGOS realmd','Failed login autoban',1,1)",
                            acc_id, WrongPassBanTime);
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using  IP '%s' got banned for '%u' seconds because it failed to authenticate '%u' times",
                            m_login.c_str(), get_remote_address().c_str(), WrongPassBanTime, failed_logins);
                    }
                    else
                    {
                        std::string current_ip = get_remote_address();
                        LoginDatabase.escape_string(current_ip);
                        LoginDatabase.PExecute("INSERT INTO `ip_banned` VALUES ('%s',UNIX_TIMESTAMP(),UNIX_TIMESTAMP()+'%u','MaNGOS realmd','Failed login autoban')",
                            current_ip.c_str(), WrongPassBanTime);
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] IP '%s' got banned for '%u' seconds because account '%s' failed to authenticate '%u' times",
                            current_ip.c_str(), WrongPassBanTime, m_login.c_str(), failed_logins);
                    }
                }
            }
        }
    }
    return true;
}

// Reconnect Challenge command handler
bool AuthSocket::_HandleReconnectChallenge()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleReconnectChallenge");
    if (recv_len() < sizeof(sAuthLogonChallenge_C))
        return false;

    // Read the first 4 bytes (header) to get the length of the remaining of the packet
    std::vector<uint8> buf;
    buf.resize(4);

    recv((char *)&buf[0], 4);

    EndianConvert(*((uint16*)(&buf[0])));
    uint16 remaining = ((sAuthLogonChallenge_C *)&buf[0])->size;
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] got header, body is %#04x bytes", remaining);

    if ((remaining < sizeof(sAuthLogonChallenge_C) - buf.size()) || (recv_len() < remaining))
        return false;

    // Session is closed unless overriden
    m_status = STATUS_CLOSED;

    //No big fear of memory outage (size is int16, i.e. < 65536)
    buf.resize(remaining + buf.size() + 1);
    buf[buf.size() - 1] = 0;
    sAuthLogonChallenge_C *ch = (sAuthLogonChallenge_C*)&buf[0];

    // Read the remaining of the packet
    recv((char *)&buf[4], remaining);
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] got full packet, %#04x bytes", ch->size);
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] name(%d): '%s'", ch->I_len, ch->I);

    EndianConvert(ch->build);
    m_build = ch->build;

    ch->os[3] = '\0';
    std::reverse(ch->os, ch->os + 3);
    memcpy(&m_os, ch->os, sizeof(m_os));

    ch->platform[3] = '\0';
    std::reverse(ch->platform, ch->platform + 3);
    memcpy(&m_platform, ch->platform, sizeof(m_platform));

    m_login = (const char*)ch->I;
    m_safelogin = m_login;
    LoginDatabase.escape_string(m_safelogin);

    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `sessionkey`, `id` FROM `account` WHERE `username` = '%s'", m_safelogin.c_str());

    // Stop if the account is not found
    if (!result)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] user %s tried to login and we cannot find his session key in the database.", m_login.c_str());
        close_connection();
        return false;
    }

    Field* fields = result->Fetch ();
    srp.SetStrongSessionKey(fields[0].GetString());
    m_accountId = fields[1].GetUInt32();

    // All good, await client's proof
    m_status = STATUS_RECON_PROOF;

    // Sending response
    ByteBuffer pkt;
    pkt << (uint8)  CMD_AUTH_RECONNECT_CHALLENGE;
    pkt << (uint8)  0x00;
    m_reconnectProof.SetRand(16 * 8);
    pkt.append(m_reconnectProof.AsByteArray(16));            // 16 bytes random
    pkt.append(VersionChallenge.data(), VersionChallenge.size());
    send((char const*)pkt.contents(), pkt.size());
    return true;
}

// Reconnect Proof command handler
bool AuthSocket::_HandleReconnectProof()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleReconnectProof");
    // Read the packet
    sAuthReconnectProof_C lp;
    if(!recv((char *)&lp, sizeof(sAuthReconnectProof_C)))
        return false;

    // Session is closed unless overriden
    m_status = STATUS_CLOSED;

    BigNumber K = srp.GetStrongSessionKey();
    if (m_login.empty() || !m_reconnectProof.GetNumBytes() || !K.GetNumBytes())
        return false;

    BigNumber t1;
    t1.SetBinary(lp.R1, 16);

    Crypto::Hash::SHA1::Generator sha;
    sha.UpdateData(m_login);
    sha.UpdateData(t1);
    sha.UpdateData(m_reconnectProof);
    sha.UpdateData(K);
    Crypto::Hash::SHA1::Digest digest = sha.GetDigest();

    if (!memcmp(digest.data(), lp.R2, digest.size()))
    {
        if (!VerifyVersion(lp.R1, sizeof(lp.R1), lp.R3, true))
        {
            ByteBuffer pkt;
            pkt << uint8(CMD_AUTH_RECONNECT_PROOF);
            pkt << uint8(WOW_FAIL_VERSION_INVALID);
            send((char const*)pkt.contents(), pkt.size());
            return true;
        }

        // Sending response
        ByteBuffer pkt;
        pkt << uint8(CMD_AUTH_RECONNECT_PROOF);
        pkt << uint8(WOW_SUCCESS);
        send((char const*)pkt.contents(), pkt.size());

        m_status = STATUS_AUTHED;
        return true;
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] user %s tried to login, but session invalid.", m_login.c_str());
        close_connection();
        return false;
    }
}

// %Realm List command handler
bool AuthSocket::_HandleRealmList()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleRealmList");
    if (recv_len() < 5)
        return false;

    recv_skip(5);

    // this shouldn't be possible, but just in case
    if (!m_accountId)
        return false;

    // check for too frequent requests
    auto const minDelay = sConfig.GetIntDefault("MinRealmListDelay", 1);
    auto const now = time(nullptr);
    auto const delay = now - m_lastRealmListRequest;

    m_lastRealmListRequest = now;

    if (delay < minDelay)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] user %s IP %s is sending CMD_REALM_LIST too frequently.  Delay = %d seconds", m_login.c_str(), get_remote_address().c_str(), delay);
        return false;
    }

    // Update realm list if need
    sRealmList.UpdateIfNeed();

    // Circle through realms in the RealmList and construct the return packet (including # of user characters in each realm)
    ByteBuffer pkt;
    LoadRealmlist(pkt);

    ByteBuffer hdr;
    hdr << (uint8) CMD_REALM_LIST;
    hdr << (uint16)pkt.size();
    hdr.append(pkt);

    send((char const*)hdr.contents(), hdr.size());

    return true;
}

std::string AuthSocket::GetRealmAddress(Realm const& realm) const
{
    ACE_INET_Addr addr;
    if (peer().get_remote_addr(addr) == 0)
    {
        ACE_INET_Addr localAddress;
        if (localAddress.set(realm.localAddress.c_str()) == 0)
        {
            if ((addr.get_ip_address() & realm.localSubnetMask) == (localAddress.get_ip_address() & realm.localSubnetMask))
                return realm.localAddress;
        }
    }

    return realm.address;
}

void AuthSocket::LoadRealmlist(ByteBuffer &pkt)
{
    if (m_build < 6299)        // before version 2.0.3 (exclusive)
    {
        pkt << uint32(0);                               // unused value
        pkt << uint8(sRealmList.size());

        for (RealmList::RealmMap::const_iterator i = sRealmList.begin(); i != sRealmList.end(); ++i)
        {
            uint8 AmountOfCharacters;

            // No SQL injection. id of realm is controlled by the database.
            std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `numchars` FROM `realmcharacters` WHERE `realmid` = '%d' AND `acctid`='%u'", i->second.id, m_accountId);
            if (result)
            {
                Field *fields = result->Fetch();
                AmountOfCharacters = fields[0].GetUInt8();
            }
            else
                AmountOfCharacters = 0;

            bool ok_build = std::find(i->second.realmBuilds.begin(), i->second.realmBuilds.end(), m_build) != i->second.realmBuilds.end();

            RealmBuildInfo const* buildInfo = ok_build ? FindBuildInfo(m_build) : nullptr;
            if (!buildInfo)
                buildInfo = &i->second.realmBuildInfo;

            RealmFlags realmflags = i->second.realmFlags;

            // 1.x clients not support explicitly REALM_FLAG_SPECIFYBUILD, so manually form similar name as show in more recent clients
            std::string name = i->first;
            if (realmflags & REALM_FLAG_SPECIFYBUILD)
            {
                char buf[20];
                snprintf(buf, 20, " (%u,%u,%u)", buildInfo->majorVersion, buildInfo->minorVersion, buildInfo->bugfixVersion);
                name += buf;
            }

            // Show offline state for unsupported client builds and locked realms (1.x clients not support locked state show)
            if (!ok_build || (i->second.allowedSecurityLevel > GetSecurityOn(i->second.id)))
                realmflags = RealmFlags(realmflags | REALM_FLAG_OFFLINE);

            uint8 const categoryId = GetRealmCategoryIdByBuildAndZone(m_build, RealmZone(i->second.timeZone));

            pkt << uint32(i->second.icon);              // realm type
            pkt << uint8(realmflags);                   // realmflags
            pkt << name;                                // name
            pkt << GetRealmAddress(i->second);          // address
            pkt << float(i->second.populationLevel);
            pkt << uint8(AmountOfCharacters);
            pkt << uint8(categoryId);                   // realm category
            pkt << uint8(0x00);                         // unk, may be realm number/id?
        }

        pkt << uint16(0x0002);                          // unused value (why 2?)
    }
    else
    {
        pkt << uint32(0);                               // unused value
        pkt << uint16(sRealmList.size());

        for (RealmList::RealmMap::const_iterator i = sRealmList.begin(); i != sRealmList.end(); ++i)
        {
            uint8 AmountOfCharacters;

            // No SQL injection. id of realm is controlled by the database.
            std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `numchars` FROM `realmcharacters` WHERE `realmid` = '%d' AND `acctid`='%u'", i->second.id, m_accountId);
            if (result)
            {
                Field *fields = result->Fetch();
                AmountOfCharacters = fields[0].GetUInt8();
            }
            else
                AmountOfCharacters = 0;

            bool ok_build = std::find(i->second.realmBuilds.begin(), i->second.realmBuilds.end(), m_build) != i->second.realmBuilds.end();

            RealmBuildInfo const* buildInfo = ok_build ? FindBuildInfo(m_build) : nullptr;
            if (!buildInfo)
                buildInfo = &i->second.realmBuildInfo;

            uint8 lock = (i->second.allowedSecurityLevel > GetSecurityOn(i->second.id)) ? 1 : 0;

            RealmFlags realmFlags = i->second.realmFlags;

            // Show offline state for unsupported client builds
            if (!ok_build)
                realmFlags = RealmFlags(realmFlags | REALM_FLAG_OFFLINE);

            if (!buildInfo)
                realmFlags = RealmFlags(realmFlags & ~REALM_FLAG_SPECIFYBUILD);

            uint8 const categoryId = GetRealmCategoryIdByBuildAndZone(m_build, RealmZone(i->second.timeZone));

            pkt << uint8(i->second.icon);               // realm type (this is second column in Cfg_Configs.dbc)
            pkt << uint8(lock);                         // flags, if 0x01, then realm locked
            pkt << uint8(realmFlags);                   // see enum RealmFlags
            pkt << i->first;                            // name
            pkt << GetRealmAddress(i->second);          // address
            pkt << float(i->second.populationLevel);
            pkt << uint8(AmountOfCharacters);
            pkt << uint8(categoryId);                   // realm category (Cfg_Categories.dbc)
            pkt << uint8(0x2C);                         // unk, may be realm number/id?

            if (realmFlags & REALM_FLAG_SPECIFYBUILD)
            {
                pkt << uint8(buildInfo->majorVersion);
                pkt << uint8(buildInfo->minorVersion);
                pkt << uint8(buildInfo->bugfixVersion);
                pkt << uint16(m_build);
            }
        }

        pkt << uint16(0x0010);                          // unused value (why 10?)
    }
}

// Resume patch transfer
bool AuthSocket::_HandleXferResume()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferResume");

    if(recv_len() < 9)
        return false;

    recv_skip(1);

    uint64 start_pos;
    recv((char *)&start_pos, 8);

    if(m_patch == ACE_INVALID_HANDLE)
    {
        close_connection();
        return false;
    }

    ACE_OFF_T file_size = ACE_OS::filesize(m_patch);

    if(file_size == -1 || start_pos >= (uint64)file_size)
    {
        close_connection();
        return false;
    }

    if(ACE_OS::lseek(m_patch, start_pos, SEEK_SET) == -1)
    {
        close_connection();
        return false;
    }

    InitPatch();

    return true;
}

// Cancel patch transfer
bool AuthSocket::_HandleXferCancel()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferCancel");

    recv_skip(1);
    close_connection();

    return true;
}

// Accept patch transfer
bool AuthSocket::_HandleXferAccept()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferAccept");

    recv_skip(1);

    InitPatch();

    return true;
}

// Verify PIN entry data
bool AuthSocket::VerifyPinData(uint32 pin, const PINData& clientData)
{
    // remap the grid to match the client's layout
    std::vector<uint8> grid { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    std::vector<uint8> remappedGrid(grid.size());

    uint8* remappedIndex = remappedGrid.data();
    uint32 seed = m_gridSeed;

    for (size_t i = grid.size(); i > 0; --i)
    {
        auto remainder = seed % i;
        seed /= i;
        *remappedIndex = grid[remainder];

        size_t copySize = i;
        copySize -= remainder;
        --copySize;

        uint8* srcPtr = grid.data() + remainder + 1;
        uint8* dstPtr = grid.data() + remainder;

        std::copy(srcPtr, srcPtr + copySize, dstPtr);
        ++remappedIndex;
    }

    // convert the PIN to bytes (for ex. '1234' to {1, 2, 3, 4})
    std::vector<uint8> pinBytes;

    while (pin != 0)
    {
        pinBytes.push_back(pin % 10);
        pin /= 10;
    }

    std::reverse(pinBytes.begin(), pinBytes.end());

    // validate PIN length
    if (pinBytes.size() < 4 || pinBytes.size() > 10)
        return false; // PIN outside of expected range

    // remap the PIN to calculate the expected client input sequence
    for (size_t i = 0; i < pinBytes.size(); ++i)
    {
        auto index = std::find(remappedGrid.begin(), remappedGrid.end(), pinBytes[i]);
        pinBytes[i] = std::distance(remappedGrid.begin(), index);
    }

    // convert PIN bytes to their ASCII values
    for (size_t i = 0; i < pinBytes.size(); ++i)
        pinBytes[i] += 0x30;

    // validate the PIN, x = H(client_salt | H(server_salt | ascii(pin_bytes)))
    Crypto::Hash::SHA1::Generator shaFirst;
    shaFirst.UpdateData(m_serverSecuritySalt.AsByteArray());
    shaFirst.UpdateData(pinBytes.data(), pinBytes.size());
    auto shaFirstHash = shaFirst.GetDigest();

    BigNumber hash, clientHash;
    hash.SetBinary(shaFirstHash.data(), shaFirstHash.size());
    clientHash.SetBinary(clientData.hash, 20);

    Crypto::Hash::SHA1::Generator shaSecond;
    shaSecond.UpdateData(clientData.salt, sizeof(clientData.salt));
    shaSecond.UpdateData(hash);
    auto shaSecondHash = shaSecond.GetDigest();

    hash.SetBinary(shaSecondHash.data(), shaSecondHash.size());

    return hash.AsDecStr() == clientHash.AsDecStr();
}

uint32 AuthSocket::GenerateTotpPin(const std::string& secret, int interval) {
    std::vector<uint8> decoded_key((secret.size() + 7) / 8 * 5);
    int key_size = base32_decode((const uint8_t*)secret.data(), decoded_key.data(), decoded_key.size());

    if (key_size == -1)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Unable to base32 decode TOTP key for user %s", m_safelogin.c_str());
        return -1;
    }

    // not guaranteed by the standard to be the UNIX epoch but it is on all supported platforms
    auto time = std::time(nullptr);
    uint64 now = static_cast<uint64>(time);
    uint64 step = static_cast<uint64>((floor(now / 30))) + interval;
    EndianConvertReverse(step);

    Crypto::Hash::HMACSHA1::Generator hmac(decoded_key.data(), key_size);
    hmac.UpdateData((uint8*)&step, sizeof(step));

    auto hmac_result = hmac.GetDigest();

    unsigned int offset = hmac_result[19] & 0xF;
    std::uint32_t pin = (hmac_result[offset] & 0x7f) << 24 | (hmac_result[offset + 1] & 0xff) << 16
        | (hmac_result[offset + 2] & 0xff) << 8 | (hmac_result[offset + 3] & 0xff);
    EndianConvert(pin);

    pin &= 0x7FFFFFFF;
    pin %= 1000000;
    return pin;
}

void AuthSocket::InitPatch()
{
    PatchHandler* handler = new PatchHandler(ACE_OS::dup(get_handle()), m_patch);

    m_patch = ACE_INVALID_HANDLE;

    if(handler->open() == -1)
    {
        handler->close();
        close_connection();
    }
}

void AuthSocket::LoadAccountSecurityLevels(uint32 accountId)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `gmlevel`, `RealmID` FROM `account_access` WHERE `id` = %u",
        accountId);
    if (!result)
        return;

    do
    {
        Field *fields = result->Fetch();
        AccountTypes security = AccountTypes(fields[0].GetUInt32());
        int realmId = fields[1].GetInt32();
        if (realmId < 0)
            m_accountDefaultSecurityLevel = security;
        else
            m_accountSecurityOnRealm[realmId] = security;
    } while (result->NextRow());
}

bool AuthSocket::GeographicalLockCheck()
{
    if (!sConfig.GetBoolDefault("GeoLocking", false))
    {
        return false;
    }

    if (m_lastIP.empty() || m_lastIP == get_remote_address())
    {
        return false;
    }

    if ((m_lockFlags & GEO_CITY) == 0 && (m_lockFlags & GEO_COUNTRY) == 0)
    {
        return false;
    }

    auto result = std::unique_ptr<QueryResult>(LoginDatabase.PQuery(
        "SELECT INET_ATON('%s') AS ip, network_start_integer, geoname_id, registered_country_geoname_id "
        "FROM geoip "
        "WHERE network_last_integer >= INET_ATON('%s') "
        "ORDER BY network_last_integer ASC LIMIT 1",
        get_remote_address().c_str(), get_remote_address().c_str())
        );

    auto result_prev = std::unique_ptr<QueryResult>(LoginDatabase.PQuery(
        "SELECT INET_ATON('%s') AS ip, network_start_integer, geoname_id, registered_country_geoname_id "
        "FROM geoip "
        "WHERE network_last_integer >= INET_ATON('%s') "
        "ORDER BY network_last_integer ASC LIMIT 1",
        m_lastIP.c_str(), m_lastIP.c_str())
        );

    if (!result && !result_prev)
    {
        return false;
    }

    // If only one of the queries returns a result, assume location has changed
    if ((result && !result_prev) || (!result && result_prev))
    {
        return true;
    }

    uint32_t net_start = result->Fetch()[1].GetUInt32();
    uint32_t net_start_prev = result_prev->Fetch()[1].GetUInt32();
    uint32_t ip = result->Fetch()[0].GetUInt32();
    uint32_t ip_prev = result_prev->Fetch()[0].GetUInt32();

    /* The optimised query will return the next highest range in the event
     * of the address not being found in the database. Therefore, we need
     * to perform a second check to ensure our address falls within
     * the returned range.
     * See: https://blog.jcole.us/2007/11/24/on-efficiently-geo-referencing-ips-with-maxmind-geoip-and-mysql-gis/
     */
    if (net_start > ip || net_start_prev > ip_prev)
    {
        return false;
    }

    std::string geoname_id = result->Fetch()[2].GetString();
    std::string country_geoname_id = result->Fetch()[3].GetString();
    std::string prev_geoname_id = result_prev->Fetch()[2].GetString();
    std::string prev_country_geoname_id = result_prev->Fetch()[3].GetString();

    if (m_lockFlags & GEO_CITY)
    {
        return geoname_id != prev_geoname_id;
    }
    else
    {
        return country_geoname_id != prev_country_geoname_id;
    }
}

bool AuthSocket::VerifyVersion(uint8 const* a, int32 aLength, uint8 const* versionProof, bool isReconnect)
{
    std::vector<RealmBuildInfo const*> allowedClients = FindBuildInfo(m_build, m_os, m_platform);
    if (allowedClients.empty())
        return false;

    if (!sConfig.GetBoolDefault("StrictVersionCheck", false))
        return true;

    for (RealmBuildInfo const* pBuildInfo : allowedClients)
    {
        std::array<uint8, 20> zeros = { {} };
        std::array<uint8, 20> const* versionHash = nullptr;
        if (!isReconnect)
        {
            versionHash = &pBuildInfo->integrityHash;

            if (!versionHash)
                return false;

            if (!memcmp(versionHash->data(), zeros.data(), zeros.size()))
                return true;                                                            // not filled serverside
        }
        else
            versionHash = &zeros;

        Crypto::Hash::SHA1::Generator version;
        version.UpdateData(a, aLength);
        version.UpdateData(versionHash->data(), versionHash->size());
        auto expectedHash = version.GetDigest();

        if (memcmp(versionProof, expectedHash.data(), expectedHash.size()) == 0)
            return true;
    }

    return false;
}
