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

#include "WardenModule.hpp"
#include "WardenKeyGenerator.h"

#include "Common.h"
#include "Language.h"
#include "Player.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "World.h"
#include "Log.h"
#include "Opcodes.h"
#include "ByteBuffer.h"
#include "Database/DatabaseEnv.h"
#include "Policies/SingletonImp.h"
#include "Crypto/BigNumber.h"
#include "Warden.hpp"
#include "WardenModuleMgr.hpp"
#include "Util.h"
#include "WardenWin.hpp"
#include "WardenMac.hpp"
#include "WardenScanMgr.hpp"
#include "AccountMgr.h"

#include <zlib.h>

#include <algorithm>
#include <memory>

void Log::OutWarden(Warden const* warden, LogLevel logLevel, char const* format, ...)
{
    if (m_wardenDebug && logLevel > LOG_LVL_MINIMAL)
        logLevel = LOG_LVL_MINIMAL;

    if (m_consoleLevel >= logLevel)
    {
        SetColor(stdout, g_logColors[logLevel]);

        if (m_includeTime)
            OutTime(stdout);

        // Append tag to console warden messages.
        printf("[Warden] (Name %s, Id %u, IP %s) ", warden->GetAccountName(), warden->GetAccountId(), warden->GetSessionIP());

        va_list ap;
        va_start(ap, format);
        vutf8printf(stdout, format, &ap);
        va_end(ap);

        ResetColor(stdout);

        printf("\n");
        fflush(stdout);
    }

    if (logFiles[LOG_ANTICHEAT] && m_fileLevel >= logLevel)
    {
        OutTimestamp(logFiles[LOG_ANTICHEAT]);
        fprintf(logFiles[LOG_ANTICHEAT], "[Warden] (Name %s, Id %u, IP %s) ", warden->GetAccountName(), warden->GetAccountId(), warden->GetSessionIP());

        va_list ap;
        va_start(ap, format);
        vfprintf(logFiles[LOG_ANTICHEAT], format, ap);
        va_end(ap);

        fprintf(logFiles[LOG_ANTICHEAT], "\n");
        fflush(logFiles[LOG_ANTICHEAT]);
    }
}

void Warden::LoadScriptedScans()
{
    auto const start = sWardenScanMgr.Count();

    WardenWin::LoadScriptedScans();
    WardenMac::LoadScriptedScans();

    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, ">> %u scripted Warden scans loaded from anticheat module", sWardenScanMgr.Count() - start);
}

Warden::Warden(WorldSession* session, WardenModule const* module, BigNumber const& K) :
    m_accountId(session->GetAccountId()), m_sessionGuid(session->GetGUID()), m_clientBuild(session->GetGameBuild()), m_accountName(session->GetUsername()),
    m_sessionIP(session->GetRemoteAddress()), m_clientOS(session->GetOS()), m_clientPlatform(session->GetPlatform()),
    m_inputCrypto(KeyLength), m_outputCrypto(KeyLength), m_initialized(false), m_module(module), m_crk(nullptr),
    m_timeoutClock(0), m_scanClock(0), m_moduleSendPending(false), m_maiev(true)
{
    auto const kBytes = K.AsByteArray();

    WardenKeyGenerator WK(kBytes.data(), kBytes.size());

    uint8 inputKey[KeyLength];
    WK.Generate(inputKey, sizeof(inputKey));

    uint8 outputKey[KeyLength];
    WK.Generate(outputKey, sizeof(outputKey));

    m_inputCrypto.Init(inputKey);
    m_outputCrypto.Init(outputKey);

    m_xor = inputKey[0];

    sLog.OutWarden(this, LOG_LVL_DEBUG, "Initializing");
    sLog.OutWarden(this, LOG_LVL_DEBUG, "C->S Key: %s", ByteArrayToHexStr(inputKey, 16).c_str());
    sLog.OutWarden(this, LOG_LVL_DEBUG, "S->C Key: %s", ByteArrayToHexStr(outputKey, 16).c_str());
}

void Warden::RequestChallenge()
{
    MANGOS_ASSERT(!!m_module && !m_module->crk.empty());

    StopTimeoutClock();

    // select a random challenge/response/key entry
    m_crk = &m_module->crk[urand(0, m_module->crk.size() - 1)];

    sLog.OutWarden(this, LOG_LVL_DEBUG, "Sending challenge");
    sLog.OutWarden(this, LOG_LVL_DEBUG, "Seed: %s", ByteArrayToHexStr(m_crk->seed, 16).c_str());

    ByteBuffer pkt(1 + sizeof(m_crk->seed));

    pkt << static_cast<uint8>(WARDEN_SMSG_HASH_REQUEST);
    pkt.append(m_crk->seed, sizeof(m_crk->seed));

    SendPacket(pkt);

    BeginTimeoutClock();
}

void Warden::HandleChallengeResponse(ByteBuffer& buff)
{
    buff.rpos(buff.wpos());

    // shouldn't happen under normal conditions
    if (!m_crk)
    {
        ApplyPenalty("sent challenge response without request having been made", WARDEN_ACTION_KICK);
        return;
    }

    // Verify key
    if (buff.wpos() != 1 + sizeof(m_crk->reply) || !!memcmp(buff.contents() + 1, m_crk->reply, sizeof(m_crk->reply)))
    {
        ApplyPenalty("failed challenge response", WARDEN_ACTION_KICK);
        return;
    }

    StopTimeoutClock();

    m_inputCrypto.Init(m_crk->clientKey);
    m_outputCrypto.Init(m_crk->serverKey);

    m_xor = m_crk->clientKey[0];

    sLog.OutWarden(this, LOG_LVL_DEBUG, "Challenge response validated.  Warden packet encryption initialized.");

    m_crk = nullptr;
}

void Warden::SendModuleUse()
{
    sLog.OutWarden(this, LOG_LVL_DEBUG, "Requesting module");
    sLog.OutWarden(this, LOG_LVL_DEBUG, "Hash: %s", ByteArrayToHexStr(m_module->hash.data(), m_module->hash.size()).c_str());

    ByteBuffer pkt(1 + m_module->hash.size() + m_module->key.size() + 4);

    pkt << static_cast<uint8>(WARDEN_SMSG_MODULE_USE);

    pkt.append(&m_module->hash[0], m_module->hash.size());
    pkt.append(&m_module->key[0], m_module->key.size());

    pkt << static_cast<uint32>(m_module->binary.size());

    SendPacket(pkt);

    StopScanClock();
    BeginTimeoutClock();

    m_maiev = false;
}

void Warden::SendModuleToClient()
{
    sLog.OutWarden(this, LOG_LVL_DEBUG, "Sending module");

    StopTimeoutClock();

    for (auto pos = 0u; pos < m_module->binary.size(); )
    {
        std::uint16_t const sizeLeft = m_module->binary.size() - pos;
        std::uint16_t const len = std::min(sizeLeft, static_cast<decltype(sizeLeft)>(500));

        ByteBuffer pkt(1 + 2 + len);

        pkt << static_cast<uint8>(WARDEN_SMSG_MODULE_CACHE) << len;
        pkt.append(&m_module->binary[pos], len);

        SendPacket(pkt);

        pos += len;
    }

    BeginTimeoutClock();

    m_moduleSendPending = true;

    sLog.OutWarden(this, LOG_LVL_DEBUG, "Module transfer complete");
}

std::vector<std::shared_ptr<Scan const>> Warden::SelectScans(ScanFlags flags) const
{
    return std::move(sWardenScanMgr.GetRandomScans(static_cast<ScanFlags>(flags | GetScanFlags()), m_clientBuild));
}

void Warden::EnqueueScans(std::vector<std::shared_ptr<Scan const>>&& scans)
{
    // append the requested scans to the queue
    m_enqueuedScans.insert(m_enqueuedScans.end(), scans.cbegin(), scans.cend());
}

void Warden::RequestScans(std::vector<std::shared_ptr<Scan const>>&& scans)
{
    // start by appending the requested scans to the queue, which will usually be empty when this is called
    m_enqueuedScans.insert(m_enqueuedScans.end(), scans.cbegin(), scans.cend());

    // if for whatever reason there is nothing to do, stop
    if (m_enqueuedScans.empty())
        return;

    // if there are already some scans pending, stop
    if (!m_pendingScans.empty())
        return;

    // begin building the scan request, taking as many scans from the queue as we can

    std::vector<std::string> strings;
    ByteBuffer scan;

    size_t request = 0, reply = 0;

    bool queueUpdated = false;

    for (auto i = m_enqueuedScans.begin(); i != m_enqueuedScans.end(); ++i)
    {
        // too many or too big? keep the current scan, as well as all following it, in the queue, and halt
        if (request + (*i)->requestSize > MaxRequest || reply + (*i)->replySize > MaxReply ||
            m_pendingScans.size() >= sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_NUM_SCANS))
        {
            m_enqueuedScans = std::move(std::vector<std::shared_ptr<Scan const>>(i, m_enqueuedScans.end()));
            queueUpdated = true;
            break;
        }

        // if we can fit this one, do it

        auto const startSize = scan.wpos();
        auto const startStringSize = strings.size();

        sLog.OutWarden(this, LOG_LVL_DEBUG, "Requesting scan \"%s\"", (*i)->comment.c_str());
        (*i)->Build(this, strings, scan);

        // if the scan did not change the buffer size or the string size, consider
        // it a NOP and don't bother marking it as pending
        if (scan.wpos() != startSize || strings.size() != startStringSize)
            m_pendingScans.push_back(*i);
    }

    // if there are still no pending scans, it means that there is a single scan which is too big.
    // this should never happen, so if it does, just crash
    MANGOS_ASSERT(!m_pendingScans.empty());

    // if the scan queue has not been updated, its because we were able to fit the entire queue into one request.
    // therefore, the queue can be emptied
    if (!queueUpdated)
        m_enqueuedScans.clear();

    // this buffer is where we will combine the different portions of the packet
    ByteBuffer buff;

    // warden opcode
    buff << static_cast<uint8>(WARDEN_SMSG_CHEAT_CHECKS_REQUEST);

    if (m_clientOS == CLIENT_OS_WIN && !m_maiev)
    {
        // string table for this request
        for (auto const& s : strings)
        {
            buff << static_cast<uint8>(s.length());
            buff.append(s.c_str(), s.length());
        }

        // end of string table
        buff << static_cast<uint8>(0);
    }

    // all scan requests
    buff.append(scan);

    if (m_clientOS == CLIENT_OS_WIN && !m_maiev)
    {
        // indicates to the client that there are no further requests in this packet
        buff << uint8(m_module->scanTerminator ^ m_xor);
    }

    BeginTimeoutClock();
    SendPacket(buff);
}

void Warden::ReadScanResults(ByteBuffer& buff)
{
    // move the scans to the stack because the check handlers we call may enqueue additional scans
    auto const scans = std::move(m_pendingScans);

    //auto const inWorld = _session->GetPlayer() && _session->GetPlayer()->IsInWorld();

    for (auto const& s : scans)
    {
        sLog.OutWarden(this, LOG_LVL_DEBUG, "Checking result for %s", s->comment.c_str());

        // checks return true when they have discovered a hack
        if (s->Check(this, buff))
        {
            // if this scan requires being in the world and they are not in the world (meaning they left
            // the world between the request and response), ignore the results
            //if (!!(s->flags & InWorld) && !inWorld)
            //    continue;

            ApplyPenalty("", WARDEN_ACTION_MAX, s);
            LogPositiveToDB(s);
        }
    }

    // if there are enqueued scans at this point, the check handlers must have requested them.
    // when this happens, request them to be sent immediately.
    if (!m_enqueuedScans.empty())
        RequestScans({});
}

void Warden::SendPacket(ByteBuffer const& buff)
{
    WorldPacket pkt(SMSG_WARDEN_DATA, buff.wpos());
    pkt.append(buff);

    // we specifically append the packet copy, rather than the input copy, to avoid
    // creating side-effects for this function
    EncryptData(const_cast<uint8*>(pkt.contents()), pkt.wpos());

    sWorld.GetMessager().AddMessage([packet = std::move(pkt), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
    {
        if (WorldSession* session = world->FindSession(accountId))
        {
            if (session->GetGUID() == sessionGuid)
                session->SendPacket(&packet);
        }
    });
}

void Warden::SendPacketDirect(ByteBuffer const& buff, WorldSession* session)
{
    WorldPacket pkt(SMSG_WARDEN_DATA, buff.wpos());
    pkt.append(buff);

    // we specifically append the packet copy, rather than the input copy, to avoid
    // creating side-effects for this function
    EncryptData(const_cast<uint8*>(pkt.contents()), pkt.wpos());

    session->SendPacket(&pkt);
}

void Warden::KickSession() const
{
    sWorld.GetMessager().AddMessage([accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
    {
        if (WorldSession* session = world->FindSession(accountId))
        {
            if (session->GetGUID() == sessionGuid)
                session->KickPlayer();
        }
    });
}

void Warden::DecryptData(uint8* buffer, size_t size)
{
    m_inputCrypto.UpdateData(buffer, size);
}

void Warden::EncryptData(uint8* buffer, size_t size)
{
    m_outputCrypto.UpdateData(buffer, size);
}

void Warden::BeginTimeoutClock()
{
    m_timeoutClock = WorldTimer::getMSTime() + (IN_MILLISECONDS * sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_RESPONSE_DELAY));
}

void Warden::StopTimeoutClock()
{
    m_timeoutClock = 0;
}

bool Warden::TimeoutClockStarted() const
{
    return m_timeoutClock != 0;
}

void Warden::BeginScanClock()
{
    m_scanClock = WorldTimer::getMSTime() + (IN_MILLISECONDS * sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_SCAN_FREQUENCY));
}

void Warden::StopScanClock()
{
    m_scanClock = 0;
}

uint32 Warden::BuildChecksum(uint8 const* data, size_t size)
{
    auto hash = Crypto::Hash::SHA1::ComputeFrom(data, size);

    uint32 checkSum = 0;
    checkSum ^= *reinterpret_cast<uint32*>(&hash[sizeof(uint32) * 0]);
    checkSum ^= *reinterpret_cast<uint32*>(&hash[sizeof(uint32) * 1]);
    checkSum ^= *reinterpret_cast<uint32*>(&hash[sizeof(uint32) * 2]);
    checkSum ^= *reinterpret_cast<uint32*>(&hash[sizeof(uint32) * 3]);
    checkSum ^= *reinterpret_cast<uint32*>(&hash[sizeof(uint32) * 4]);

    return checkSum;
}

void Warden::ApplyPenalty(std::string message, WardenActions penalty, std::shared_ptr<Scan const> scan)
{
    if (penalty >= WARDEN_ACTION_MAX)
    {
        if (scan && scan->penalty < WARDEN_ACTION_MAX)
            penalty = WardenActions(scan->penalty);
        else
            penalty = WardenActions(sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_DEFAULT_PENALTY));
    }

    switch (penalty)
    {
        case WARDEN_ACTION_KICK:
            KickSession();
            break;
        case WARDEN_ACTION_BAN:
        {
            std::stringstream duration;
            std::stringstream banReason;
            banReason << "Warden Anticheat Violation";
            // Check can be NULL, for example if the client sent a wrong signature in the warden packet (CHECKSUM FAIL)
            if (scan)
                banReason << ": " << (scan->comment.empty() ? std::string("Undocumented Check") : scan->comment);
            std::string banReasonStr = banReason.str();

            sWorld.GetMessager().AddMessage([accountName = m_accountName, banReasonStr](World* world)
            {
                world->BanAccount(BAN_ACCOUNT, accountName, sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_BAN_DURATION), banReasonStr, "Warden");
            });
        }
        default:
            break;
    }

    if (message.empty())
    {
        if (scan)
        {
            message = "failed check " + std::to_string(scan->checkId);
            if (!scan->comment.empty())
                message += " (" + scan->comment + ")";
        }
        else
            message = "failed an internal warden check";
    }

    sLog.OutWarden(this, LOG_LVL_BASIC, message.c_str());
    sWorld.GetMessager().AddMessage([message](World* world)
    {
        world->SendGMText(LANG_GM_ANNOUNCE_COLOR, "WardenAnticheat", message.c_str());
    });
}

void Warden::HandlePacket(WorldPacket& recvData)
{
    // initialize decrypt packet
    DecryptData(const_cast<uint8*>(recvData.contents()), recvData.size());

    uint8 opcode;
    recvData >> opcode;

    sLog.OutWarden(this, LOG_LVL_DEBUG, "Got packet, opcode %02X, size %u", opcode, uint32(recvData.size()));

    // when there is a challenge/response pending, the only packet we expect is the hash result
    if (!!m_crk && opcode != WARDEN_CMSG_HASH_RESULT)
    {
        recvData.rpos(recvData.wpos());
        std::string msg = "sent unexpected opcode (" + std::to_string(opcode) + ") while awaiting hash challenge response";
        ApplyPenalty(msg, WARDEN_ACTION_KICK);
        return;
    }

    switch (opcode)
    {
        case WARDEN_CMSG_MODULE_MISSING:
        {
            if (!m_module || m_maiev)
            {
                sLog.OutWarden(this, LOG_LVL_BASIC, "Requested module when none was offered.");
                KickSession();
                break;
            }

            if (m_moduleSendPending)
            {
                sLog.OutWarden(this, LOG_LVL_BASIC, "Failed to load module.  Kicking.");
                KickSession();
                m_moduleSendPending = false;
                break;
            }

            sLog.OutWarden(this, LOG_LVL_DEBUG, "Client needs module sent");
            SendModuleToClient();
            break;
        }

        case WARDEN_CMSG_MODULE_OK:
        {
            if (!m_module || m_maiev)
            {
                sLog.OutWarden(this, LOG_LVL_BASIC, "Loaded module without server request.");
                KickSession();
                break;
            }

            m_moduleSendPending = false;
            sLog.OutWarden(this, LOG_LVL_DEBUG, "Module loaded");
            RequestChallenge();
            break;
        }

        case WARDEN_CMSG_CHEAT_CHECKS_RESULT:
        {
            if (m_clientOS == CLIENT_OS_WIN && !m_maiev)
            {
                // verify checksum integrity
                uint16 length;
                uint32 checksum;
                recvData >> length >> checksum;

                if (length > (recvData.size() - recvData.rpos()))
                {
                    recvData.rpos(recvData.wpos());
                    ApplyPenalty("wrong checksum length", WARDEN_ACTION_KICK);
                    return;
                }

                if (BuildChecksum(recvData.contents() + recvData.rpos(), length) != checksum)
                {
                    recvData.rpos(recvData.wpos());
                    ApplyPenalty("failed packet checksum", WARDEN_ACTION_KICK);
                    return;
                }
            }

            // this function will also act on the results
            ReadScanResults(recvData);

            StopTimeoutClock();

            // if we have a module, stop using maiev now
            if (m_maiev && m_module)
                SendModuleUse();
            else
                BeginScanClock();

            // when there is no module, consider warden initialized after first check
            if (m_maiev && !m_module)
                InitializeClient();

            break;
        }

        // FIXME: Find when/why/how this actually happens and how to handle it
        case WARDEN_CMSG_MEM_CHECKS_RESULT:
        {
            sLog.OutWarden(this, LOG_LVL_DEBUG, "Received mem checks result");
            break;
        }

        case WARDEN_CMSG_HASH_RESULT:
        {
            sLog.OutWarden(this, LOG_LVL_DEBUG, "Received hash result");

            HandleChallengeResponse(recvData);

            // if the challenge failed, this will still be set.  by now, the session will be closed.  do nothing further.
            if (!!m_crk)
                return;

            // at this point the client has our module loaded.  send whatever packets are necessary to initialize Warden
            InitializeClient();

            // send any initial hack scans that the scan manager may have for us
            RequestScans(SelectScans(ScanFlags::InitialLogin));

            // begin the scan clock (note that even if the clock expires before any initial scans are answered, no new
            // checks will be requested until the reply is received).
            BeginScanClock();

            break;
        }

        case WARDEN_CMSG_MODULE_FAILED:
        {
            sLog.OutWarden(this, LOG_LVL_BASIC, "Module load failed.  Kicking.");
            KickSession();
            break;
        }

        default:
        {
            std::string msg = "sent unknown opcode " + std::to_string(opcode) + " of size " + std::to_string(recvData.size() - 1);
            ApplyPenalty(msg, WARDEN_ACTION_KICK);
            break;
        }
    }
}

void Warden::Update()
{
    {
        std::vector<WorldPacket> packetQueue;

        {
            std::lock_guard<std::mutex> lock(m_packetQueueMutex);
            std::swap(packetQueue, m_packetQueue);
        }

        for (auto& packet : packetQueue)
        {
            try
            {
                HandlePacket(packet);
            }
            catch (ByteBufferException &)
            {
                sLog.OutWarden(this, LOG_LVL_ERROR, "ByteBufferException occured while parsing packet.  Kicking.");
                KickSession();
                return;
            }
        }
    }

#ifndef _DEBUG // Ignore timeout when in debug mode (we might single step though code, which takes a long time)
    if (!!m_timeoutClock && WorldTimer::getMSTime() > m_timeoutClock)
    {
        sLog.OutWarden(this, LOG_LVL_BASIC, "Client response timeout.  Kicking.");
        KickSession();
        return;
    }
#endif

    if (m_pendingScans.empty())
    {
        // if there are enqueued scans which may now be requested, do so immediately (with no additional scans)
        if (!m_enqueuedScans.empty())
            RequestScans({});
        // otherwise, if the scan clock is running and has expired, request randomly selected scans
        else if (!!m_scanClock && WorldTimer::getMSTime() > m_scanClock)
        {
            //auto const inWorld = _session->GetPlayer() ? _session->GetPlayer()->IsInWorld() : false;

            RequestScans(SelectScans(/*inWorld ? InWorld :*/ ScanFlags::None));

            // if no scans were found, just begin the clock again, in case things change
            if (m_pendingScans.empty())
                BeginScanClock();
            else
            {
                // let us keep things simple and not request checks while others are pending, but only if scans were found and requested
                StopScanClock();
                BeginTimeoutClock();
            }
        }
    }
}

void Warden::LogPositiveToDB(std::shared_ptr<Scan const> scan)
{
    if (!scan)
        return;

    sLog.OutWarden(this, LOG_LVL_MINIMAL, "Check %u penalty %u", scan->checkId, scan->penalty);
}
