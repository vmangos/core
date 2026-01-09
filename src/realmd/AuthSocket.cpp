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
#include "Crypto/Encoding/Base32.h"
#include "Database/DatabaseEnv.h"
#include "Config/Config.h"
#include "Log.h"
#include "RealmList.h"
#include "AuthSocket.h"
#include "AuthCodes.h"
#include "Util.h"
#include "ClientPatchCache.h"
#include "Memory/NoDeleter.h"
#include "Errors.h"

#include "IO/Networking/Utils.h"
#include "IO/Networking/AsyncSocket.h"
#include "IO/Timer/AsyncSystemTimer.h"
#include "IO/Filesystem/FileSystem.h"
#include "ProxyProtocol/ProxyV2Reader.h"

#ifdef ENABLE_MAILSENDER
#include "MailerService.h"
#include "SendgridMail.h"
#endif

#include <ctime>
//#include "Util.h" -- for commented utf8ToUpperOnlyLatin

typedef struct AuthHandler
{
    eAuthCmd cmd;
    uint32 status;
    void (AuthSocket::*asyncHandler)();
} AuthHandler;

std::array<uint8, 16> VersionChallenge = { { 0xBA, 0xA3, 0x1E, 0x99, 0xA0, 0x0B, 0x21, 0x57, 0xFC, 0x37, 0x3F, 0xB3, 0x69, 0xCD, 0xD2, 0xF1 } };

// Accept the connection and set the s random value for SRP6 // TODO where is this SRP6 done?
AuthSocket::AuthSocket(IO::Networking::AsyncSocket socket) :
    m_socket(std::move(socket)),
    m_remoteIpAddressStringAfterProxy(m_socket.GetRemoteIpString())
{
}

void AuthSocket::Start()
{
    if (int secs = sConfig.GetIntDefault("MaxSessionDuration", 300))
    {
        m_sessionDurationTimeout = sAsyncSystemTimer.ScheduleFunctionOnce(std::chrono::seconds(secs), [this]()
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[%s] Connection has reached MaxSessionDuration. Closing socket...", this->GetRemoteIpString().c_str());
            // It's correct that we capture _this_ and not a shared_ptr, since the timer will be canceled in destructor
            this->CloseSocket();
        });
    }

    DoRecvIncomingData();
}

AuthSocket::~AuthSocket()
{
    CloseSocket();

    if (m_sessionDurationTimeout)
        m_sessionDurationTimeout->Cancel();

    sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "[%s] Connection closed", GetRemoteIpString().c_str());
}

AccountTypes AuthSocket::GetSecurityOn(uint32 realmId) const
{
    AccountSecurityMap::const_iterator it = m_accountSecurityOnRealm.find(realmId);
    if (it == m_accountSecurityOnRealm.end())
        return m_accountDefaultSecurityLevel;
    return it->second;
}

// Read the packet from the client
void AuthSocket::DoRecvIncomingData()
{
    std::shared_ptr<eAuthCmd> cmd = std::make_shared<eAuthCmd>();

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[%s] DoRecvIncomingData() Reading... Ready for next opcode", GetRemoteIpString().c_str());
    m_socket.Read((char*)cmd.get(), sizeof(eAuthCmd), [self = shared_from_this(), cmd](IO::NetworkError const& error, size_t) -> void
    {
        if (error)
        {
            if (error.GetErrorType() != IO::NetworkError::ErrorType::SocketClosed)
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[%s] DoRecvIncomingData Read(cmd) error: %s", self->GetRemoteIpString().c_str(), error.ToString().c_str());
            return;
        }

        // benchmarking has demonstrated that this lookup method is faster than std::map
        constexpr AuthHandler table[] =
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

        constexpr size_t tableLength = sizeof(table) / sizeof(AuthHandler);

        size_t i;
        // Circle through known commands and call the correct command handler
        for (i = 0; i < tableLength; ++i)
        {
            if (table[i].cmd != *cmd)
                continue;

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[%s] CMD: %u requires status %u, user has %u", self->GetRemoteIpString().c_str(), *cmd, table[i].status, self->m_status);

            if (table[i].status != self->m_status)
            { // unauthorized
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[%s] Received unauthorized command %u", self->GetRemoteIpString().c_str(), *cmd);
                return;
            }

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[%s] Got data for cmd %u", self->GetRemoteIpString().c_str(), *cmd);

            // this handler will async call Read and Write, and hopefully will call DoRecvIncomingData or CloseSocket when done.
            ((*self).*table[i].asyncHandler)();

            break;
        }

        // Report unknown commands in the debug log
        if (i == tableLength)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Auth] got unknown packet cmd %u", *cmd);
            return;
        }

        // if we reach here, it means that a valid opcode was found and the handler completed successfully
        // TODO: self->m_timeoutTimer.reset();
    });
}

std::shared_ptr<ByteBuffer> AuthSocket::GenerateLogonProofResponse(Crypto::Hash::SHA1::Digest const& shaDigest)
{
    std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());

    if (m_build < 6299)  // before version 2.0.3 (exclusive)
    {
        AUTH_LOGON_PROOF_S proof{};
        memcpy(proof.M2, shaDigest.data(), 20);
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.surveyId = 0x00000000;

        pkt->append(&proof, 1);
    }
    else if (m_build < 8089) // before version 2.4.0 (exclusive)
    {
        AUTH_LOGON_PROOF_S_BUILD_6299 proof{};
        memcpy(proof.M2, shaDigest.data(), 20);
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.surveyId = 0x00000000;
        proof.loginFlags = 0x0000;

        pkt->append(&proof, 1);
    }
    else
    {
        AUTH_LOGON_PROOF_S_BUILD_8089 proof{};
        memcpy(proof.M2, shaDigest.data(), 20);
        proof.cmd = CMD_AUTH_LOGON_PROOF;
        proof.error = 0;
        proof.accountFlags = ACCOUNT_FLAG_PROPASS;
        proof.surveyId = 0x00000000;
        proof.loginFlags = 0x0000;

        pkt->append(&proof, 1);
    }

    return pkt;
}

// Logon Challenge command handler
void AuthSocket::_HandleLogonChallenge()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleLogonChallenge");
    m_status = STATUS_INVALID;

    std::shared_ptr<sAuthLogonChallengeHeader> header = std::make_shared<sAuthLogonChallengeHeader>();

    // Read the header first, to get the length of the remaining packet
    m_socket.Read((char*)header.get(), sizeof(sAuthLogonChallengeHeader), [self = shared_from_this(), header](IO::NetworkError const& error, size_t) -> void
    {
        if (error)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[Auth] HandleLogonChallenge Read(header) error");
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }

        uint16* pUint16 = reinterpret_cast<uint16*>(header.get());
        EndianConvert(*pUint16);
        uint16 actualBodySize = header->size;

        if ((actualBodySize < sizeof(sAuthLogonChallengeBody) - AUTH_LOGON_MAX_NAME))
        { // The paket is too small and has no username???
            return;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] got header, body is %#04x bytes", actualBodySize);

        // Read the remaining of the packet
        std::shared_ptr<sAuthLogonChallengeBody> body = std::make_shared<sAuthLogonChallengeBody>();
        self->m_socket.Read((char*)body.get(), actualBodySize, [self, header, body](IO::NetworkError const& error, size_t)
        {
            if (error)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleLogonChallenge self->m_socket.Read(body): ERROR");
                self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
                return;
            }

            if (body->username_len > AUTH_LOGON_MAX_NAME)
                return;
            body->username[body->username_len] = '\0';

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] got full packet, %#04x bytes", header->size);
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] name(%d): '%s'", body->username_len, body->username);

            // BigEndian code, nop in little endian case
            // size already converted
            EndianConvert(*((uint32*)(&body->gamename[0])));
            EndianConvert(body->build);
            EndianConvert(*((uint32*)(&body->platform[0])));
            EndianConvert(*((uint32*)(&body->os[0])));
            EndianConvert(*((uint32*)(&body->country[0])));
            EndianConvert(body->timezone_bias);
            EndianConvert(body->ip);

            std::shared_ptr<ByteBuffer> pkt = std::make_shared<ByteBuffer>();

            self->m_build = body->build;

            // Convert uint8[4] to string, restore string order as its byte order is reversed
            // To it for os
            body->os[3] = '\0';
            self->m_os = (char*)body->os;
            std::reverse(self->m_os.begin(), self->m_os.end());
            // To it for platform
            body->platform[3] = '\0';
            self->m_platform = (char*)body->platform;
            std::reverse(self->m_platform.begin(), self->m_platform.end());
            // Do it for locale
            self->m_localizationName.resize(sizeof(body->country));
            self->m_localizationName.assign(body->country, (body->country + sizeof(body->country)));
            std::reverse(self->m_localizationName.begin(), self->m_localizationName.end());

            // Escape the user input used in DB to avoid further SQL injection
            // Memory will be freed on AuthSocket object destruction
            self->m_login = (const char*)body->username;
            self->m_safelogin = self->m_login;
            LoginDatabase.escape_string(self->m_safelogin);

            *pkt << (uint8) CMD_AUTH_LOGON_CHALLENGE;
            *pkt << (uint8) 0x00;

            // Verify that this IP is not in the ip_banned table
            // No SQL injection possible (paste the IP address as passed by the socket)
            //                                                                                                              permanent ban          OR  still banned
            std::unique_ptr<QueryResult> sqlIpBanResult = LoginDatabase.PQuery("SELECT `unbandate` FROM `ip_banned` WHERE (`unbandate` = `bandate` OR `unbandate` > UNIX_TIMESTAMP()) AND `ip` = '%s'", self->GetRemoteIpString().c_str());
            if (sqlIpBanResult)
            {
                *pkt << uint8(WOW_FAIL_FAIL_NOACCESS);
                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Banned ip '%s' tries to login with account '%s'!", self->GetRemoteIpString().c_str(), self->m_login.c_str());
            }
            else
            {
                // Get the account details from the account table
                // No SQL injection (escaped username)
                //                                                                            0     1         2          3    4    5           6              7              8       9
                std::unique_ptr<QueryResult> sqlAccountResult = LoginDatabase.PQuery("SELECT `id`, `locked`, `last_ip`, `v`, `s`, `security`, `email_verif`, `geolock_pin`, `email`, UNIX_TIMESTAMP(`joindate`) FROM `account` WHERE `username` = '%s'", self->m_safelogin.c_str());
                if (sqlAccountResult)
                {
                    Field* fields = sqlAccountResult->Fetch();

                    // Prevent login if the user's email address has not been verified
                    bool requireVerification = sConfig.GetBoolDefault("ReqEmailVerification", false);
                    int32 requireEmailSince = sConfig.GetIntDefault("ReqEmailSince", 0);
                    bool isVerified = fields[6].GetBool();

                    // Prevent login if the user's join date is bigger than the timestamp in configuration
                    if (requireEmailSince > 0)
                    {
                        uint32 t = fields[9].GetUInt32();
                        requireVerification = requireVerification && (t >= uint32(requireEmailSince));
                    }

                    if (requireVerification && !isVerified)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s 'email address requires email verification - rejecting login", self->m_login.c_str(), self->GetRemoteIpString().c_str());
                        *pkt << (uint8) WOW_FAIL_UNKNOWN_ACCOUNT;

                        self->m_socket.Write(std::move(pkt), [self](IO::NetworkError const& error) {
                            if (error)
                                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleLogonChallenge self->Write() Error: %s", error.ToString().c_str());
                            else
                                self->DoRecvIncomingData();
                        });
                        return; // TODO refactor?
                    }

                    // If the IP is 'locked', check that the player comes indeed from the correct IP address
                    bool locked = false;
                    self->m_lockFlags = (LockFlag)fields[1].GetUInt32();
                    self->m_securityInfo = fields[5].GetCppString();
                    self->m_lastIP = fields[2].GetString();
                    self->m_geoUnlockPIN = fields[7].GetUInt32();
                    self->m_email = fields[8].GetCppString();

                    if (self->m_lockFlags & IP_LOCK)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account '%s' is locked to IP - '%s'", self->m_login.c_str(), self->m_lastIP.c_str());
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Player address is '%s'", self->GetRemoteIpString().c_str());

                        if (self->m_lastIP != self->GetRemoteIpString())
                        {
                            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account IP differs");

                            // account is IP locked and the player does not have 2FA enabled
                            if (((self->m_lockFlags & TOTP) != TOTP && (self->m_lockFlags & FIXED_PIN) != FIXED_PIN))
                                *pkt << (uint8) WOW_FAIL_SUSPENDED;

                            locked = true;
                        }
                        else
                        {
                            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account IP matches");
                        }
                    }
                    else
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Account '%s' is not locked to ip", self->m_login.c_str());
                    }

                    std::string databaseV = fields[3].GetCppString();
                    std::string databaseS = fields[4].GetCppString();
                    bool broken = false;

                    if (!self->srp.SetVerifier(databaseV.c_str()) || !self->srp.SetSalt(databaseS.c_str()))
                    {
                        *pkt << uint8(WOW_FAIL_FAIL_NOACCESS);
                        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[AuthChallenge] Broken v/s values in database for account %s!", self->m_login.c_str());
                        broken = true;
                    }

                    if ((!locked || (locked && (self->m_lockFlags & FIXED_PIN || self->m_lockFlags & TOTP))) && !broken)
                    {
                        uint32 pendingAccountId = fields[0].GetUInt32();

                        // If the account is banned, reject the logon attempt
                        std::unique_ptr<QueryResult> sqlAccountBanResult = LoginDatabase.PQuery("SELECT `bandate`, `unbandate` FROM `account_banned` WHERE `id` = %u AND `active` = 1 AND (`unbandate` > UNIX_TIMESTAMP() OR `unbandate` = `bandate`) LIMIT 1", pendingAccountId);
                        if (sqlAccountBanResult)
                        {
                            uint64_t banTimestamp = (*sqlAccountBanResult)[0].GetUInt64();
                            uint64_t unbanTimestamp = (*sqlAccountBanResult)[1].GetUInt64();
                            if (banTimestamp == unbanTimestamp)
                            {
                                *pkt << (uint8) WOW_FAIL_BANNED;
                                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Banned account '%s' using IP '%s' tries to login!", self->m_login.c_str(), self->GetRemoteIpString().c_str());
                            }
                            else
                            {
                                *pkt << (uint8) WOW_FAIL_SUSPENDED;
                                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Temporarily banned account '%s' using IP '%s' tries to login!", self->m_login.c_str(), self->GetRemoteIpString().c_str());
                            }
                        }
                        else
                        {
                            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "database authentication values: v='%s' s='%s'", databaseV.c_str(), databaseS.c_str());

                            BigNumber s;
                            s.SetHexStr(databaseS.c_str());

                            self->srp.CalculateHostPublicEphemeral();

                            // Fill the response packet with the result
                            *pkt << uint8(WOW_SUCCESS);

                            // B may be calculated < 32B so we force minimal length to 32B
                            pkt->append(self->srp.GetHostPublicEphemeral().AsByteArray(32)); // 32 bytes
                            *pkt << uint8(1);
                            pkt->append(self->srp.GetGeneratorModulo().AsByteArray());
                            *pkt << uint8(32);
                            pkt->append(self->srp.GetPrime().AsByteArray(32));
                            pkt->append(s.AsByteArray());// 32 bytes
                            pkt->append(VersionChallenge.data(), VersionChallenge.size());

                            // figure out whether we need to display the PIN grid
                            self->m_promptPin = locked; // always prompt if the account is IP locked & 2FA is enabled

                            if ((!locked && ((self->m_lockFlags & ALWAYS_ENFORCE) == ALWAYS_ENFORCE)) || self->m_geoUnlockPIN)
                            {
                                self->m_promptPin = true; // prompt if the lock hasn't been triggered but ALWAYS_ENFORCE is set
                            }

                            if (self->m_promptPin)
                            {
                                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' requires PIN authentication", self->m_login.c_str(), self->GetRemoteIpString().c_str());

                                uint32 gridSeedPkt = self->m_gridSeed = static_cast<uint32>(rand32());
                                EndianConvert(gridSeedPkt);
                                self->m_serverSecuritySalt.SetRand(16 * 8); // 16 bytes random

                                *pkt << uint8(1); // securityFlags, only '1' is available in classic (PIN input)
                                *pkt << gridSeedPkt;
                                pkt->append(self->m_serverSecuritySalt.AsByteArray(16).data(), 16);
                            }
                            else
                            {
                                if (self->m_build >= 5428)        // version 1.11.0 or later
                                    *pkt << uint8(0);
                            }

                            self->LoadAccountSecurityLevels(pendingAccountId);
                            self->m_accountId = pendingAccountId;

                            // All good, await client's proof
                            self->m_status = STATUS_LOGON_PROOF;
                        }
                    }
                }
                else
                { // no account
                    *pkt << (uint8) WOW_FAIL_UNKNOWN_ACCOUNT;
                }
            }

            self->m_socket.Write(std::move(pkt), [self](IO::NetworkError const& error)
            {
                if (error)
                    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleLogonChallenge self->Write() Error: %s", error.ToString().c_str());
                else
                    self->DoRecvIncomingData();
            });
        });
    });
}

// Logon Proof command handler
void AuthSocket::_HandleLogonProof()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleLogonProof");
    m_status = STATUS_INVALID;

    // Read the packet
    std::shared_ptr<sAuthLogonProof_C> lp = std::make_shared<sAuthLogonProof_C>();
    size_t expectedSize = sizeof(sAuthLogonProof_C);
    if (m_build < 5428) { // Pin support was added in 1.11.0, so if an older client connects, we need to skip those fields
        lp->securityFlags = SECURITY_FLAG_NONE;
        expectedSize = sizeof(sAuthLogonProof_C_Pre_1_11_0);
    }

    m_socket.Read((char*) lp.get(), expectedSize, [self = shared_from_this(), lp](IO::NetworkError const& error, size_t)
    {
        if (error)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleLogonChallenge Read(): ERROR");
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }

        if (lp->securityFlags)
        {
            if (!(lp->securityFlags & SECURITY_FLAG_PIN))
            {
                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "_HandleLogonChallenge Invalid/Unsupported securityFlags: %u", lp->securityFlags);
                self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
                return;
            }

            std::shared_ptr<PINData> pinData(new PINData());
            self->m_socket.Read((char*) pinData.get(), sizeof(PINData), [self, lp, pinData](IO::NetworkError const& error, size_t)
            {
                self->_HandleLogonProof__PostRecv(lp, pinData);
            });
            return;
        }

        self->_HandleLogonProof__PostRecv(lp, nullptr);
    });
}

void AuthSocket::_HandleLogonProof__PostRecv_HandleInvalidVersion(std::shared_ptr<sAuthLogonProof_C const> const& lp)
{
    if (m_pendingPatchFile)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "_HandleLogonProof__PostRecv m_patch is already set?? The client should accept the XFER!");
        return;
    }

    // Check if we have the apropriate patch on the disk
    // file looks like: 65535enGB.mpq
    char tmp[256];

    snprintf(tmp, 256, "%s/%d%s.mpq", sConfig.GetStringDefault("PatchesDir","./patches").c_str(), m_build, m_localizationName.c_str());

    std::string pathFilePath = IO::Filesystem::ToAbsolutePath(tmp);
    m_pendingPatchFile = IO::Filesystem::TryOpenFileReadonly(pathFilePath);

    if (m_pendingPatchFile == nullptr)
    {
        // no patch found
        std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
        *pkt << (uint8) CMD_AUTH_LOGON_CHALLENGE;
        *pkt << (uint8) 0x00;
        *pkt << (uint8) WOW_FAIL_VERSION_INVALID;
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] %u is not a valid client version!", m_build);
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[AuthChallenge] Patch %s not found", tmp);
        m_socket.Write(std::move(pkt), [self = shared_from_this(), pkt](IO::NetworkError const& error)
        {
            if (error)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "_HandleLogonProof__PostRecv Write(...) failed");
                self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
                return;
            }
            self->DoRecvIncomingData();
        });
    }
    else
    {
        Crypto::Hash::MD5::Digest md5Hash = sRealmdPatchCache.GetOrCalculateHash(m_pendingPatchFile);
        std::string wowClientPathType = "Patch"; // Must be patch "Patch"
        MANGOS_ASSERT(wowClientPathType.size() <= 255); // Filename must fit inside a byte

        std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());

        // packet 1
        *pkt << (uint8) CMD_AUTH_LOGON_PROOF;
        *pkt << (uint8) WOW_FAIL_VERSION_UPDATE;

        // packet 2 - XFER_INIT
        XFER_INIT initPkt{};
        initPkt.cmd = CMD_XFER_INITIATE;
        initPkt.fileTypeNameLength = wowClientPathType.size();
        memcpy(initPkt.fileTypeName, wowClientPathType.c_str(), wowClientPathType.size());
        initPkt.fileSize = m_pendingPatchFile->GetTotalFileSize();
        memcpy(initPkt.md5, md5Hash.data(), md5Hash.size());
        pkt->append(&initPkt, 1);

        // Set right status
        m_status = STATUS_PATCH;

        m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
        {
            self->DoRecvIncomingData();
        });
    }
}

void AuthSocket::_HandleLogonProof__PostRecv(std::shared_ptr<sAuthLogonProof_C const> const& lp, std::shared_ptr<PINData const> const& pinData)
{
    MANGOS_ASSERT(!lp->securityFlags || pinData.get() != nullptr); // PinData must be present, when securityFlags is set

    // Check if the client has one of the expected version numbers
    bool valid_version = FindBuildInfo(m_build) != nullptr;

    // If the client has no valid version
    if(!valid_version)
    {
        _HandleLogonProof__PostRecv_HandleInvalidVersion(lp);
        return;
    }

    // Continue the SRP6 calculation based on data received from the client
    if (!srp.CalculateSessionKey(lp->A, 32))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Session calculation failed for account %s!", this->m_login.c_str());
        return;
    }

    srp.HashSessionKey();
    srp.CalculateProof(this->m_login);

    // Check PIN data is correct
    bool pinResult = true;

    if (m_promptPin && !lp->securityFlags)
        pinResult = false; // expected PIN data but did not receive it

    if (m_promptPin && lp->securityFlags)
    {
        if ((m_lockFlags & FIXED_PIN) == FIXED_PIN)
        {
            pinResult = VerifyPinData(std::stoi(m_securityInfo), *pinData);
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' PIN result: %u", m_login.c_str(), GetRemoteIpString().c_str(), pinResult);
        }
        else if ((m_lockFlags & TOTP) == TOTP)
        {
            for (int i = -2; i != 2; ++i)
            {
                auto pin = GenerateTotpPin(m_securityInfo, i);

                if (pin == uint32(-1))
                    break;

                if ((pinResult = VerifyPinData(pin, *pinData)))
                    break;
            }
        }
        else if (m_geoUnlockPIN)
        {
            pinResult = VerifyPinData(m_geoUnlockPIN, *pinData);
        }
        else
        {
            pinResult = false;
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Invalid PIN flags set for user %s - user cannot log-in until fixed", m_login.c_str());
        }
    }

    // Check if SRP6 results match (password is correct), else send an error
    if (!srp.Proof(lp->M1, 20) && pinResult)
    {
        if (!VerifyVersion(lp->A, sizeof(lp->A), lp->crc_hash, false))
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account %s tried to login with modified client!", m_login.c_str());

            std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
            *pkt << (uint8) CMD_AUTH_LOGON_PROOF;
            *pkt << (uint8) WOW_FAIL_VERSION_INVALID;
            m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
            {
                self->DoRecvIncomingData();
            });
            return;
        }

        // Geolocking checks must be done after an otherwise successful login to prevent lockout attacks
        if (m_geoUnlockPIN) // remove the PIN to unlock the account since login succeeded
        {
            bool result = LoginDatabase.PExecute("UPDATE `account` SET `geolock_pin` = 0 WHERE `username` = '%s'", m_safelogin.c_str());
            if (!result)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to remove geolock PIN for %s - account has not been unlocked", m_safelogin.c_str());
            }
        }
        else if (GeographicalLockCheck())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Account '%s' (%u) using IP '%s' has been geolocked", m_login.c_str(), m_accountId, GetRemoteIpString().c_str()); // todo, add additional logging info

            uint32_t pin = urand(100000, 999999); // check rand32_max
            bool result = LoginDatabase.PExecute("UPDATE `account` SET `geolock_pin` = %u WHERE `username` = '%s'", pin, m_safelogin.c_str());
            if (!result)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to write geolock PIN for %s - account has not been locked", m_safelogin.c_str());

                std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
                *pkt << (uint8) CMD_AUTH_LOGON_PROOF;
                *pkt << (uint8) WOW_FAIL_DB_BUSY;
                m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
                {
                    self->DoRecvIncomingData();
                });
                return;
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
                mail->substitution("%originating_ip%", GetRemoteIpString());

                MailerService::get_global_mailer()->send(std::move(mail),
                    [](SendgridMail::Result res)
                    {
                        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Mail result: %d", res);
                    }
                );
            }
#endif

            std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
            *pkt << (uint8) CMD_AUTH_LOGON_PROOF;
            *pkt << (uint8) WOW_FAIL_PARENTCONTROL;
            m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
            {
                self->DoRecvIncomingData();
            });
            return;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' successfully authenticated", m_login.c_str(), GetRemoteIpString().c_str());

        // Update the sessionkey, last_ip, last login time and reset number of failed logins in the account table for this account
        // No SQL injection (escaped username) and IP address as received by socket
        std::string K_hex = srp.GetStrongSessionKey().AsHexStr();
        // Why it must be sync: The new network implementation is so fast that the async db cant execute the UPDATE statement before the client tries to reach mangosd
        // If it is async there would be a race condition
        bool result = LoginDatabase.PExecute(DbExecMode::MustBeSync, "UPDATE `account` SET `sessionkey` = '%s', `last_ip` = '%s', `last_login` = NOW(), `locale` = '%u', `failed_logins` = 0, `os` = '%s', `platform` = '%s' WHERE `username` = '%s'",
                                             K_hex.c_str(), GetRemoteIpString().c_str(), GetLocaleByName(m_localizationName), m_os.c_str(), m_platform.c_str(), m_safelogin.c_str() );
        if (!result)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unable to update login stats for account '%s'", m_safelogin.c_str());
        }

        // Finish SRP6 and send the final result to the client
        Crypto::Hash::SHA1::Digest shaDigest = srp.Finalize();

        std::shared_ptr<ByteBuffer> pkt = GenerateLogonProofResponse(shaDigest);
        m_status = STATUS_AUTHED;

        m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
        {
            self->DoRecvIncomingData();
        });
    }
    else
    {
        // We are here because the password was incorrect
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] Account '%s' using IP '%s' tried to login with wrong password!", m_login.c_str (), GetRemoteIpString().c_str());

        uint32 MaxWrongPassCount = sConfig.GetIntDefault("WrongPass.MaxCount", 0);
        if(MaxWrongPassCount > 0)
        {
            //Increment number of failed logins by one and if it reaches the limit temporarily ban that account or IP
            LoginDatabase.PExecute("UPDATE `account` SET `failed_logins` = `failed_logins` + 1 WHERE `username` = '%s'",m_safelogin.c_str());

            if (std::unique_ptr<QueryResult> failedLoginsDbResult = LoginDatabase.PQuery("SELECT `id`, `failed_logins` FROM `account` WHERE `username` = '%s'", m_safelogin.c_str()))
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
                                 m_login.c_str(), GetRemoteIpString().c_str(), WrongPassBanTime, failed_logins);
                    }
                    else
                    {
                        std::string current_ip = GetRemoteIpString();
                        LoginDatabase.escape_string(current_ip);
                        LoginDatabase.PExecute("INSERT INTO `ip_banned` VALUES ('%s',UNIX_TIMESTAMP(),UNIX_TIMESTAMP()+'%u','MaNGOS realmd','Failed login autoban')",
                            current_ip.c_str(), WrongPassBanTime);
                        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[AuthChallenge] IP '%s' got banned for '%u' seconds because account '%s' failed to authenticate '%u' times",
                            current_ip.c_str(), WrongPassBanTime, m_login.c_str(), failed_logins);
                    }
                }
            }
        }

        std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
        *pkt << (uint8) CMD_AUTH_LOGON_PROOF;
        *pkt << (uint8) WOW_FAIL_UNKNOWN_ACCOUNT;
        if (m_build > 6005) // > 1.12.2
        {
            *pkt << (uint8) 0;
            *pkt << (uint8) 0;
        }
        m_socket.Write(std::move(pkt), [self = shared_from_this()](IO::NetworkError const& error)
        {
            self->DoRecvIncomingData();
        });
    }
}

// Reconnect Challenge command handler
void AuthSocket::_HandleReconnectChallenge()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleReconnectChallenge");
    m_status = STATUS_INVALID;

    // Read the header first, to get the length of the remaining packet
    std::shared_ptr<sAuthLogonChallengeHeader> header = std::make_shared<sAuthLogonChallengeHeader>();
    m_socket.Read((char*)header.get(), sizeof(sAuthLogonChallengeHeader), [self = shared_from_this(), header](IO::NetworkError const& error, size_t)
    {
        if (error)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleReconnectChallenge Read(header): ERROR");
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }

        uint16* pUint16 = reinterpret_cast<uint16*>(header.get());
        EndianConvert(*pUint16);
        uint16 actualBodySize = header->size;

        if (actualBodySize < sizeof(sAuthLogonChallengeBody) - AUTH_LOGON_MAX_NAME) // TODO: @cMangos: Why is here "-10" and not AUTH_LOGON_MAX_NAME
        { // The paket is too small and has no username???
            return;
        }

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] got header, body is %#04x bytes", actualBodySize);

        // Read the remaining of the packet
        std::shared_ptr<sAuthLogonChallengeBody> body = std::make_shared<sAuthLogonChallengeBody>();
        self->m_socket.Read((char*)body.get(), actualBodySize, [self, header, body](IO::NetworkError const& error, size_t)
        {
            if (error)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleReconnectChallenge self->m_socket.Read(body): ERROR");
                self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
                return;
            }

            if (body->username_len > AUTH_LOGON_MAX_NAME)
                return;
            body->username[body->username_len] = '\0';

            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] got full packet, %#04x bytes", header->size);
            sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[ReconnectChallenge] name(%d): '%s'", body->username_len, body->username);

            // BigEndian code, nop in little endian case
            // size already converted
            EndianConvert(*((uint32*)(&body->gamename[0])));
            EndianConvert(body->build);
            EndianConvert(*((uint32*)(&body->platform[0])));
            EndianConvert(*((uint32*)(&body->os[0])));
            EndianConvert(*((uint32*)(&body->country[0])));
            EndianConvert(body->timezone_bias);
            EndianConvert(body->ip);

            self->m_build = body->build;

            // Convert uint8[4] to string, restore string order as its byte order is reversed
            // To it for os
            body->os[3] = '\0';
            self->m_os = (char*)body->os;
            std::reverse(self->m_os.begin(), self->m_os.end());
            // To it for platform
            body->platform[3] = '\0';
            self->m_platform = (char*)body->platform;
            std::reverse(self->m_platform.begin(), self->m_platform.end());
            // Do it for locale
            self->m_localizationName.resize(sizeof(body->country));
            self->m_localizationName.assign(body->country, (body->country + sizeof(body->country)));
            std::reverse(self->m_localizationName.begin(), self->m_localizationName.end());

            // Escape the user input used in DB to avoid further SQL injection
            // Memory will be freed on AuthSocket object destruction
            self->m_login = (char const*)body->username;
            self->m_safelogin = self->m_login;
            LoginDatabase.escape_string(self->m_safelogin);

            std::unique_ptr<QueryResult> queryResult = LoginDatabase.PQuery("SELECT `sessionkey`, `id` FROM `account` WHERE `username` = '%s'", self->m_safelogin.c_str());

            // Stop if the account is not found
            if (!queryResult)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "user %s tried to login and we cannot find his session key in the database.", self->m_login.c_str());
                self->CloseSocket();
                return;
            }

            Field* fields = queryResult->Fetch();
            self->srp.SetStrongSessionKey(fields[0].GetString());
            self->m_accountId = fields[1].GetUInt32();

            // All good, await client's proof
            self->m_status = STATUS_RECON_PROOF;

            // Sending response
            std::shared_ptr<ByteBuffer> pkt = std::make_shared<ByteBuffer>();
            *pkt << (uint8)CMD_AUTH_RECONNECT_CHALLENGE;
            *pkt << (uint8)0x00;
            self->m_reconnectProof.SetRand(16 * 8);
            pkt->append(self->m_reconnectProof.AsByteArray(16));        // 16 bytes random
            pkt->append(VersionChallenge.data(), VersionChallenge.size());
            self->m_socket.Write(std::move(pkt), [self](IO::NetworkError const& error)
            {
                self->DoRecvIncomingData();
            });
        });
    });
}

// Reconnect Proof command handler
void AuthSocket::_HandleReconnectProof()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleReconnectProof");
    m_status = STATUS_INVALID;

    // Read the packet
    std::shared_ptr<AUTH_RECONNECT_PROOF_C> lp(new AUTH_RECONNECT_PROOF_C());
    m_socket.Read((char*) lp.get(), sizeof(AUTH_RECONNECT_PROOF_C), [self = shared_from_this(), lp](IO::NetworkError const& error, size_t)
    {
        if (error)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "_HandleReconnectProof self->m_socket.Read(): ERROR");
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }

        BigNumber K = self->srp.GetStrongSessionKey();
        if (self->m_login.empty() || !self->m_reconnectProof.GetNumBytes() || !K.GetNumBytes())
            return;

        BigNumber t1;
        t1.SetBinary(lp->R1, 16);

        Crypto::Hash::SHA1::Generator sha;
        sha.UpdateData(self->m_login);
        sha.UpdateData(t1);
        sha.UpdateData(self->m_reconnectProof);
        sha.UpdateData(K);
        Crypto::Hash::SHA1::Digest digest = sha.GetDigest();

        if (!memcmp(digest.data(), lp->R2, digest.size()))
        {
            if (!self->VerifyVersion(lp->R1, sizeof(lp->R1), lp->R3, true))
            {
                std::shared_ptr<ByteBuffer> pkt = std::make_shared<ByteBuffer>();
                *pkt << uint8(CMD_AUTH_RECONNECT_PROOF);
                *pkt << uint8(WOW_FAIL_VERSION_INVALID);
                return;
            }

            // Sending response
            std::shared_ptr<ByteBuffer> pkt = std::make_shared<ByteBuffer>();
            *pkt << uint8(CMD_AUTH_RECONNECT_PROOF);
            *pkt << uint8(WOW_SUCCESS);
            self->m_socket.Write(std::move(pkt), [self](IO::NetworkError const& error)
            {
                self->DoRecvIncomingData();
            });

            self->m_status = STATUS_AUTHED;
            return;
        }
        else
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "user %s tried to login, but session invalid.", self->m_login.c_str());
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }
    });
}

// %Realm List command handler
void AuthSocket::_HandleRealmList()
{
    assert(this->m_accountId);

    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleRealmList");
    m_socket.ReadSkip(4, [self = shared_from_this()](IO::NetworkError const& error)
    {
        if (error)
        {
            self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
            return;
        }

        // check for too frequent requests
        auto const minDelay = sConfig.GetIntDefault("MinRealmListDelay", 1);
        auto const now = std::chrono::steady_clock::now();
        if (self->m_lastRealmListRequest.has_value())
        {
            auto const delay = std::chrono::duration_cast<std::chrono::seconds>(now - self->m_lastRealmListRequest.value()).count();
            if (delay < minDelay)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "user %s IP %s is sending CMD_REALM_LIST too frequently. Delay = %d seconds", self->m_login.c_str(), self->GetRemoteIpString().c_str(), delay);

                self->CloseSocket(); // TODO: Remove me. Closing the socket will be done implicitly if all references to this socket are deleted (when there is no IO anymore)
                return;
            }
        }

        self->m_lastRealmListRequest = now;

        // Update realm list if need
        sRealmList.UpdateIfNeed();

        // Circle through realms in the RealmList and construct the return packet (including # of user characters in each realm)
        ByteBuffer realmlistBuffer;
        self->LoadRealmlistAndWriteIntoBuffer(realmlistBuffer);

        std::shared_ptr<ByteBuffer> pkt(new ByteBuffer());
        *pkt << (uint8) CMD_REALM_LIST;
        *pkt << (uint16)realmlistBuffer.size();
        pkt->append(realmlistBuffer);

        self->m_socket.Write(std::move(pkt), [self](IO::NetworkError const& error)
        {
            self->DoRecvIncomingData();
        });
    });
}

void AuthSocket::LoadRealmlistAndWriteIntoBuffer(ByteBuffer &pkt)
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

            std::string realmIpPortStr = i->second.GetAddressForClient(m_socket.GetRemoteEndpoint().ip).toString();
            uint8 const categoryId = GetRealmCategoryIdByBuildAndZone(m_build, RealmZone(i->second.timeZone));

            pkt << uint32(i->second.icon);              // realm type
            pkt << uint8(realmflags);                   // realmflags
            pkt << name;                                // name
            pkt << realmIpPortStr;                      // address
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

            std::string realmIpPortStr = i->second.GetAddressForClient(m_socket.GetRemoteEndpoint().ip).toString();
            uint8 const categoryId = GetRealmCategoryIdByBuildAndZone(m_build, RealmZone(i->second.timeZone));

            pkt << uint8(i->second.icon);               // realm type (this is second column in Cfg_Configs.dbc)
            pkt << uint8(lock);                         // flags, if 0x01, then realm locked
            pkt << uint8(realmFlags);                   // see enum RealmFlags
            pkt << i->first;                            // name
            pkt << realmIpPortStr;                      // address
            pkt << float(i->second.populationLevel);
            pkt << uint8(AmountOfCharacters);
            pkt << uint8(categoryId);                   // realm category (Cfg_Categories.dbc)
            pkt << uint8(i->second.id);                 // realm id

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

// Accept patch transfer
void AuthSocket::_HandleXferAccept()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferAccept");

    if (!m_pendingPatchFile)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "User '%s' tried to get patch file, but there is no patch file defined?", m_safelogin.c_str());
        return;
    }

    InitAndHandOverControlToPatchHandler();
}

// Resume transfer.
// This function is called when the user disconnected during transfer and already has a `wow-patch.mpq.partial`.
// The client may not be closed, this only works if the client is not closed.
void AuthSocket::_HandleXferResume()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferResume");

    if (!m_pendingPatchFile)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "User '%s' tried to get patch file, but there is no patch file defined?", m_safelogin.c_str());
        return;
    }

    auto startPosPtr = std::make_shared<int64>();
    m_socket.Read(reinterpret_cast<char*>(startPosPtr.get()), sizeof(int64), [self = shared_from_this(), startPosPtr](IO::NetworkError const& error, std::size_t)
    {
        int64 startPos = *startPosPtr;
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[XFER] User '%s' wants to resume download at byte %llu", self->m_safelogin.c_str(), startPos);

        if (startPos >= self->m_pendingPatchFile->GetTotalFileSize() || startPos < 0)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "[XFER] User '%s' tried to resume download outside file bounds", self->m_safelogin.c_str());
            return;
        }

        self->m_pendingPatchFile->Seek(IO::Filesystem::SeekDirection::Start, startPos);
        self->InitAndHandOverControlToPatchHandler();
    });
}

// Cancel patch transfer
void AuthSocket::_HandleXferCancel()
{
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Entering _HandleXferCancel");
    // Socket will close implicitly
}

// Verify PIN entry data
bool AuthSocket::VerifyPinData(uint32 pin, PINData const& clientData)
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

uint32 AuthSocket::GenerateTotpPin(std::string const& secret, int interval)
{
    nonstd::optional<std::vector<uint8>> maybe_decoded_key = Crypto::Encoding::Base32::Decode(secret, 64);
    if (!maybe_decoded_key.has_value())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Unable to base32 decode TOTP key for user %s", m_safelogin.c_str());
        return -1;
    }

    // not guaranteed by the standard to be the UNIX epoch but it is on all supported platforms
    auto time = std::time(nullptr);
    uint64 now = static_cast<uint64>(time);
    uint64 step = static_cast<uint64>((floor(now / 30))) + interval;
    EndianConvertReverse(step);

    Crypto::Hash::HMACSHA1::Generator hmac(maybe_decoded_key.value());
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

/// Will Read() a chunk from m_pendingPatchFile into dataChunkHolder->data
/// This function will recursion call itself when the the sending callback is invoked
void AuthSocket::RepeatInternalXferLoop(std::shared_ptr<XFER_DATA_CHUNK> const& chunk)
{
    // Will the `chunk->data` array with actual data from the file
    uint64_t actualReadAmount = m_pendingPatchFile->ReadSync(&(chunk->data[0]), sizeof(chunk->data));
    if (actualReadAmount == 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "[XFER]: Done");
        return;
    }
    chunk->data_size = (uint16_t) actualReadAmount;

    // This `fakeSharedPtr` is a bit hacky, we cannot simply Write() a XFER_DATA_CHUNK pointer.
    // This is why we convert it to an uint8 pointer without a deallocator.
    std::shared_ptr<uint8 const> fakeSharedPtr((uint8_t const*)chunk.get(), MaNGOS::Memory::no_deleter<uint8>());
    m_socket.Write({ fakeSharedPtr, size_t(sizeof(chunk->cmd) + sizeof(chunk->data_size) + actualReadAmount) }, [self = shared_from_this(), chunk](IO::NetworkError const& error)
    {
        if (error)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[XFER]: Write(...) failed: %s", error.ToString().c_str());
            return;
        }
        self->RepeatInternalXferLoop(chunk); // Do it again, until everything is transferred
    });
}

void AuthSocket::InitAndHandOverControlToPatchHandler()
{
    MANGOS_ASSERT(m_pendingPatchFile);

    std::shared_ptr<XFER_DATA_CHUNK> rawChunk(new XFER_DATA_CHUNK());
    rawChunk->cmd = CMD_XFER_DATA;

    RepeatInternalXferLoop(rawChunk);
}

void AuthSocket::LoadAccountSecurityLevels(uint32 accountId)
{
    std::unique_ptr<QueryResult> result = LoginDatabase.PQuery("SELECT `gmlevel`, `RealmID` FROM `account_access` WHERE `id` = %u", accountId);
    if (!result)
        return; // The account has no special permissions (most likely a normal user)

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

    if (m_lastIP.empty() || m_lastIP == GetRemoteIpString())
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
        GetRemoteIpString().c_str(), GetRemoteIpString().c_str())
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

    // The optimised query will return the next highest range in the event
    // of the address not being found in the database. Therefore, we need
    // to perform a second check to ensure our address falls within
    // the returned range.
    // See: https://blog.jcole.us/2007/11/24/on-efficiently-geo-referencing-ips-with-maxmind-geoip-and-mysql-gis/
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

void AuthSocket::CloseSocket()
{
    m_socket.CloseSocket();
}
