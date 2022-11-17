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
#include "WardenKeyGeneration.h"

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
#include "Auth/BigNumber.h"
#include "Warden.hpp"
#include "WardenModuleMgr.hpp"
#include "Util.h"
#include "WardenWin.hpp"
#include "WardenMac.hpp"
#include "WardenScanMgr.hpp"
#include "AccountMgr.h"

#include <openssl/md5.h>
#include <openssl/sha.h>

#include <zlib.h>

#include <algorithm>
#include <memory>

void Warden::LoadScriptedScans()
{
    auto const start = sWardenScanMgr.Count();

    WardenWin::LoadScriptedScans();
    WardenMac::LoadScriptedScans();

    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, ">> %u scripted Warden scans loaded from anticheat module", sWardenScanMgr.Count() - start);
}

Warden::Warden(WorldSession *session, const WardenModule *module, const BigNumber &K) :
    _session(session), _inputCrypto(KeyLength), _outputCrypto(KeyLength), _initialized(false), _module(module), _crk(nullptr),
    _timeoutClock(0), _scanClock(0), _moduleSendPending(false)
{
    MANGOS_ASSERT(!!_module || session->GetPlatform() != CLIENT_PLATFORM_X86);

    auto const kBytes = K.AsByteArray();

    SHA1Randx WK(kBytes.data(), kBytes.size());

    uint8 inputKey[KeyLength];
    WK.Generate(inputKey, sizeof(inputKey));

    uint8 outputKey[KeyLength];
    WK.Generate(outputKey, sizeof(outputKey));

    _inputCrypto.Init(inputKey);
    _outputCrypto.Init(outputKey);

    _xor = inputKey[0];

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Initializing");
    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "C->S Key: %s", ByteArrayToHexStr(inputKey, 16).c_str());
    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "S->C Key: %s", ByteArrayToHexStr(outputKey, 16).c_str());

    if (_module)
    {
        ByteBuffer pkt(1 + _module->hash.size() + _module->key.size() + 4);

        pkt << static_cast<uint8>(WARDEN_SMSG_MODULE_USE);

        pkt.append(&_module->hash[0], _module->hash.size());
        pkt.append(&_module->key[0], _module->key.size());

        pkt << static_cast<uint32>(_module->binary.size());

        SendPacket(pkt);

        BeginTimeoutClock();
    }
}

void Warden::RequestChallenge()
{
    MANGOS_ASSERT(!!_module && !_module->crk.empty());

    StopTimeoutClock();

    // select a random challenge/response/key entry
    _crk = &_module->crk[urand(0, _module->crk.size() - 1)];

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Sending challenge");
    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Seed: %s", ByteArrayToHexStr(_crk->seed, 16).c_str());

    ByteBuffer pkt(1 + sizeof(_crk->seed));

    pkt << static_cast<uint8>(WARDEN_SMSG_HASH_REQUEST);
    pkt.append(_crk->seed, sizeof(_crk->seed));

    SendPacket(pkt);

    BeginTimeoutClock();
}

void Warden::HandleChallengeResponse(ByteBuffer &buff)
{
    buff.rpos(buff.wpos());

    // shouldn't happen under normal conditions
    if (!_crk)
    {
        ApplyPenalty("sent challenge response without request having been made", WARDEN_ACTION_KICK);
        return;
    }

    // Verify key
    if (buff.wpos() != 1 + sizeof(_crk->reply) || !!memcmp(buff.contents() + 1, _crk->reply, sizeof(_crk->reply)))
    {
        ApplyPenalty("failed challenge response", WARDEN_ACTION_KICK);
        return;
    }

    StopTimeoutClock();

    _inputCrypto.Init(_crk->clientKey);
    _outputCrypto.Init(_crk->serverKey);

    _xor = _crk->clientKey[0];

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Challenge response validated.  Warden packet encryption initialized.");

    _crk = nullptr;
}

void Warden::SendModuleToClient()
{
    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Sending module");

    StopTimeoutClock();

    for (auto pos = 0u; pos < _module->binary.size(); )
    {
        const std::uint16_t sizeLeft = _module->binary.size() - pos;
        const std::uint16_t len = std::min(sizeLeft, static_cast<decltype(sizeLeft)>(500));

        ByteBuffer pkt(1 + 2 + len);

        pkt << static_cast<uint8>(WARDEN_SMSG_MODULE_CACHE) << len;
        pkt.append(&_module->binary[pos], len);

        SendPacket(pkt);

        pos += len;
    }

    BeginTimeoutClock();

    _moduleSendPending = true;

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Module transfer complete");
}

std::vector<std::shared_ptr<const Scan>> Warden::SelectScans(ScanFlags flags) const
{
    return std::move(sWardenScanMgr.GetRandomScans(static_cast<ScanFlags>(flags | GetScanFlags())));
}

void Warden::EnqueueScans(std::vector<std::shared_ptr<const Scan>> &&scans)
{
    // append the requested scans to the queue
    _enqueuedScans.insert(_enqueuedScans.end(), scans.cbegin(), scans.cend());
}

void Warden::RequestScans(std::vector<std::shared_ptr<const Scan>> &&scans)
{
    // start by appending the requested scans to the queue, which will usually be empty when this is called
    _enqueuedScans.insert(_enqueuedScans.end(), scans.cbegin(), scans.cend());

    // if for whatever reason there is nothing to do, stop
    if (_enqueuedScans.empty())
        return;

    // if there are already some scans pending, stop
    if (!_pendingScans.empty())
        return;

    // begin building the scan request, taking as many scans from the queue as we can

    std::vector<std::string> strings;
    ByteBuffer scan;

    size_t request = 0, reply = 0;

    bool queueUpdated = false;

    for (auto i = _enqueuedScans.begin(); i != _enqueuedScans.end(); ++i)
    {
        // too many or too big? keep the current scan, as well as all following it, in the queue, and halt
        if (request + (*i)->requestSize > MaxRequest || reply + (*i)->replySize > MaxReply ||
            _pendingScans.size() >= sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_NUM_SCANS))
        {
            _enqueuedScans = std::move(std::vector<std::shared_ptr<const Scan>>(i, _enqueuedScans.end()));
            queueUpdated = true;
            break;
        }

        // if we can fit this one, do it

        auto const startSize = scan.wpos();
        auto const startStringSize = strings.size();

        sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Requesting scan \"%s\"", (*i)->comment.c_str());
        (*i)->Build(this, strings, scan);

        // if the scan did not change the buffer size or the string size, consider
        // it a NOP and don't bother marking it as pending
        if (scan.wpos() != startSize || strings.size() != startStringSize)
            _pendingScans.push_back(*i);
    }

    // if there are still no pending scans, it means that there is a single scan which is too big.
    // this should never happen, so if it does, just crash
    MANGOS_ASSERT(!_pendingScans.empty());

    // if the scan queue has not been updated, its because we were able to fit the entire queue into one request.
    // therefore, the queue can be emptied
    if (!queueUpdated)
        _enqueuedScans.clear();

    // this buffer is where we will combine the different portions of the packet
    ByteBuffer buff;

    // warden opcode
    buff << static_cast<uint8>(WARDEN_SMSG_CHEAT_CHECKS_REQUEST);

    if (_session->GetOS() == CLIENT_OS_WIN)
    {
        // string table for this request
        for (auto const &s : strings)
        {
            buff << static_cast<uint8>(s.length());
            buff.append(s.c_str(), s.length());
        }

        // end of string table
        buff << static_cast<uint8>(0);
    }

    // all scan requests
    buff.append(scan);

    if (_session->GetOS() == CLIENT_OS_WIN)
    {
        // indicates to the client that there are no further requests in this packet
        buff << _xor;
    }

    BeginTimeoutClock();
    SendPacket(buff);
}

void Warden::ReadScanResults(ByteBuffer &buff)
{
    // move the scans to the stack because the check handlers we call may enqueue additional scans
    auto const scans = std::move(_pendingScans);

    auto const inWorld = _session->GetPlayer() && _session->GetPlayer()->IsInWorld();

    for (auto const &s : scans)
    {
        // checks return true when they have discovered a hack 
        if (s->Check(this, buff))
        {
            // if this scan requires being in the world and they are not in the world (meaning they left
            // the world between the request and response), ignore the results
            if (!!(s->flags & InWorld) && !inWorld)
                continue;

            ApplyPenalty("", WARDEN_ACTION_MAX, s);
            LogPositiveToDB(s);
        }
    }

    // if there are enqueued scans at this point, the check handlers must have requested them.
    // when this happens, request them to be sent immediately.
    if (!_enqueuedScans.empty())
        RequestScans({});
}

void Warden::SendPacket(const ByteBuffer &buff)
{
    WorldPacket pkt(SMSG_WARDEN_DATA, buff.wpos());
    pkt.append(buff);

    // we specifically append the packet copy, rather than the input copy, to avoid
    // creating side-effects for this function
    EncryptData(const_cast<uint8 *>(pkt.contents()), pkt.wpos());

    _session->SendPacket(&pkt);
}

void Warden::DecryptData(uint8* buffer, size_t size)
{
    _inputCrypto.UpdateData(buffer, size);
}

void Warden::EncryptData(uint8* buffer, size_t size)
{
    _outputCrypto.UpdateData(buffer, size);
}

void Warden::BeginTimeoutClock()
{
#ifdef _DEBUG
    _timeoutClock = 0;
#else
    // we will expect a reply eventually
    _timeoutClock = WorldTimer::getMSTime() + IN_MILLISECONDS * sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_RESPONSE_DELAY);
#endif
}

void Warden::StopTimeoutClock()
{
    _timeoutClock = 0;
}

void Warden::BeginScanClock()
{
    _scanClock = WorldTimer::getMSTime() + 1000 * sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_SCAN_FREQUENCY);
}

void Warden::StopScanClock()
{
    _scanClock = 0;
}

uint32 Warden::BuildChecksum(const uint8* data, size_t size)
{
    uint8 hash[SHA_DIGEST_LENGTH];
    SHA1(data, size, hash);

    uint32 checkSum = 0;

    for (auto i = 0u; i < sizeof(hash) / sizeof(uint32); ++i)
        checkSum ^= *reinterpret_cast<uint32 *>(&hash[i * 4]);

    return checkSum;
}

void Warden::ApplyPenalty(std::string message, WardenActions penalty, std::shared_ptr<const Scan> scan)
{
    if (penalty >= WARDEN_ACTION_MAX)
    {
        if (scan && scan->penalty < WARDEN_ACTION_MAX)
            penalty = WardenActions(scan->penalty);
        else
            penalty = WardenActions(sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_DEFAULT_PENALTY));
    }

    std::string playerName = _session->GetPlayerName();
    std::string accountName = std::to_string(_session->GetAccountId());
    sAccountMgr.GetName(_session->GetAccountId(), accountName);

    switch (penalty)
    {
    case WARDEN_ACTION_KICK:
        _session->KickPlayer();
        break;
    case WARDEN_ACTION_BAN:
    {
        std::stringstream duration;
        std::stringstream banReason;
        banReason << "Warden Anticheat Violation";
        // Check can be NULL, for example if the client sent a wrong signature in the warden packet (CHECKSUM FAIL)
        if (scan)
            banReason << ": " << (scan->comment.empty() ? std::string("Undocumented Check") : scan->comment);

        sWorld.BanAccount(BAN_ACCOUNT, accountName, sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_CLIENT_BAN_DURATION), banReason.str(), "Warden");
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

    // Append names to message.
    message = "Player " + playerName + " (Account " + accountName + ") " + message;

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, message.c_str());
    sWorld.SendGMText(LANG_GM_ANNOUNCE_COLOR, "WardenAnticheat", message.c_str());
}

void Warden::HandlePacket(WorldPacket& recvData)
{
    // initialize decrypt packet
    DecryptData(const_cast<uint8*>(recvData.contents()), recvData.size());

    uint8 opcode;
    recvData >> opcode;

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Got packet, opcode %02X, size %u", opcode, uint32(recvData.size()));

    // when there is a challenge/response pending, the only packet we expect is the hash result
    if (!!_crk && opcode != WARDEN_CMSG_HASH_RESULT)
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
            if (!_module)
            {
                sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, "Requested module when none was offered.", _session->GetAccountId(), _session->GetRemoteAddress().c_str());
                _session->KickPlayer();
                break;
            }

            if (_moduleSendPending)
            {
                sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, "Failed to load module.  Kicking.", _session->GetAccountId(), _session->GetRemoteAddress().c_str());
                _session->KickPlayer();
                _moduleSendPending = false;
                break;
            }

            sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Client needs module sent");
            SendModuleToClient();
            break;
        }

        case WARDEN_CMSG_MODULE_OK:
        {
            if (!_module)
            {
                sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, "Loaded module without server request.", _session->GetAccountId(), _session->GetRemoteAddress().c_str());
                _session->KickPlayer();
                break;
            }

            _moduleSendPending = false;
            sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Module loaded");
            RequestChallenge();
            break;
        }

        case WARDEN_CMSG_CHEAT_CHECKS_RESULT:
        {
            if (_session->GetOS() == CLIENT_OS_WIN)
            {
                // verify checksum integrity
                uint16 length;
                uint32 checksum;
                recvData >> length >> checksum;

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
            BeginScanClock();

            break;
        }

        // FIXME: Find when/why/how this actually happens and how to handle it
        case WARDEN_CMSG_MEM_CHECKS_RESULT:
        {
            sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Received mem checks result");
            break;
        }

        case WARDEN_CMSG_HASH_RESULT:
        {
            sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_DEBUG, "Received hash result");

            HandleChallengeResponse(recvData);

            // if the challenge failed, this will still be set.  by now, the session will be closed.  do nothing further.
            if (!!_crk)
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
            sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, "Module load failed.  Kicking.");
            _session->KickPlayer();
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
    if (!!_timeoutClock && WorldTimer::getMSTime() > _timeoutClock)
    {
        sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_BASIC, "Client response timeout.  Kicking.");
        _session->KickPlayer();
        return;
    }

    if (_pendingScans.empty())
    {
        // if there are enqueued scans which may now be requested, do so immediately (with no additional scans)
        if (!_enqueuedScans.empty())
            RequestScans({});
        // otherwise, if the scan clock is running and has expired, request randomly selected scans
        else if (!!_scanClock && WorldTimer::getMSTime() > _scanClock)
        {
            auto const inWorld = _session->GetPlayer() ? _session->GetPlayer()->IsInWorld() : false;

            RequestScans(SelectScans(inWorld ? InWorld : None));

            // if no scans were found, just begin the clock again, in case things change
            if (_pendingScans.empty())
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

void Warden::LogPositiveToDB(std::shared_ptr<const Scan> scan)
{
    if (!scan || !_session)
        return;

    sLog.Player(_session, LOG_ANTICHEAT, "Warden", LOG_LVL_MINIMAL, "Check %u penalty %u", scan->checkId, scan->penalty);
}
