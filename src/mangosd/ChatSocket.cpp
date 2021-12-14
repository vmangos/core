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
    \ingroup mangosd
*/

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "ChatSocket.h"
#include "World.h"
#include "Util.h"
#include "SharedDefines.h"
#include "ObjectAccessor.h"
#include "PlayerBotMgr.h"
#include "ObjectMgr.h"
#include "AccountMgr.h"
#include "Chat.h"
#include "Opcodes.h"

#define DEBUG_OUT_CHAT(...) //sLog.outString(__VA_ARGS__)

class OfflineChatCommandsHandler: public ChatHandler
{
public:
    OfflineChatCommandsHandler(WorldSession* session, std::stringstream& buf) : ChatHandler(session), m_buff(buf)
    {
    }
    virtual ~OfflineChatCommandsHandler() {}
    void SendSysMessage(const char *str)
    {
        m_buff << str << std::endl;
    }
protected:
    std::stringstream& m_buff;
};

/// OfflineChatSocket constructor
OfflineChatSocket::OfflineChatSocket() : OfflineChatHandler(),
    pendingCommands(0, USYNC_THREAD, "pendingCommands"),
    outActive(false),
    inputBufferLen(0),
    outputBufferLen(0),
    stage(NONE)
{
    reference_counting_policy ().value (ACE_Event_Handler::Reference_Counting_Policy::ENABLED);
}

/// OfflineChatSocket destructor
OfflineChatSocket::~OfflineChatSocket()
{
    peer().close();
}

/// Accept an incoming connection
int OfflineChatSocket::open(void* )
{
    if (reactor ()->register_handler(this, ACE_Event_Handler::READ_MASK | ACE_Event_Handler::WRITE_MASK) == -1)
    {
        sLog.outError ("OfflineChatSocket::open: unable to register client handler errno = %s", ACE_OS::strerror (errno));
        return -1;
    }

    ACE_INET_Addr remote_addr;

    if (peer ().get_remote_addr (remote_addr) == -1)
    {
        sLog.outError ("OfflineChatSocket::open: peer ().get_remote_addr errno = %s", ACE_OS::strerror (errno));
        return -1;
    }
    return 0;
}

int OfflineChatSocket::close(int)
{
    if(closing_)
        return -1;
    shutdown();

    closing_ = true;

    remove_reference();
    return 0;
}

int OfflineChatSocket::handle_close (ACE_HANDLE h, ACE_Reactor_Mask)
{
    if(closing_)
        return -1;
    std::unique_lock<std::mutex> lock (outBufferLock);

    closing_ = true;

    if (h == ACE_INVALID_HANDLE)
        peer ().close_writer ();
    remove_reference();
    return 0;
}

int OfflineChatSocket::handle_output (ACE_HANDLE)
{
    std::unique_lock<std::mutex> lock (outBufferLock);

    if(closing_)
        return -1;

    if (!outputBufferLen)
    {
        if(reactor()->cancel_wakeup(this, ACE_Event_Handler::WRITE_MASK) == -1)
        {
            sLog.outError ("OfflineChatSocket::handle_output: error while cancel_wakeup");
            return -1;
        }
        outActive = false;
        return 0;
    }
#ifdef MSG_NOSIGNAL
    ssize_t n = peer ().send (outputBuffer, outputBufferLen, MSG_NOSIGNAL);
#else
    ssize_t n = peer ().send (outputBuffer, outputBufferLen);
#endif // MSG_NOSIGNAL

    if(n<=0)
        return -1;

    ACE_OS::memmove(outputBuffer, outputBuffer+n, outputBufferLen-n);

    outputBufferLen -= n;

    return 0;
}

/// Read data from the network
std::string TrimLeft(const std::string& s)
{
    size_t startpos = s.find_first_not_of(' ');
    return (startpos == std::string::npos) ? "" : s.substr(startpos);
}

int OfflineChatSocket::handle_input(ACE_HANDLE)
{
    DEBUG_LOG("OfflineChatSocket::handle_input");
    if (closing_)
    {
        sLog.outError("Called OfflineChatSocket::handle_input with closing_ = true");
        return -1;
    }

    int readBytes = peer().recv(inputBuffer+inputBufferLen, OFFCHAT_BUFF_SIZE-inputBufferLen-1);

    if (readBytes <= 0)
    {
        DEBUG_LOG("read %i bytes in OfflineChatSocket::handle_input", readBytes);
        return -1;
    }
    DEBUG_OUT_CHAT("OfflineChatSocket::handle_input %i bytes read", readBytes);

    ///- Discard data after line break or line feed
    bool endofpacket = false;
    for (; readBytes > 0 ; --readBytes)
    {
        char c = inputBuffer[inputBufferLen];
        if (c == '\r'|| c == '\n')
        {
            endofpacket = true;
            break;
        }
        ++inputBufferLen;
    }
    if (!endofpacket)
        return -1;
    inputBuffer[inputBufferLen] = '\0';
    inputBufferLen              = 0;

    // Entree (texte) : plguid msgtype chanordest message
    /* Input (text):
        - Sessionkey
        - UserIP [to check IP ban]
        - PlayerGuid
        - Type [Cf enum ChatMsg, -1 = ExecuteCommand, -2 = Get chat messages in queue]
        [- Channel if pertinent]
        - Message
    */
    std::stringstream oss(inputBuffer);
    uint32 playerGuid = 0;
    int32 messageType = 0;
    std::string chanOrDest;
    std::string sessionKey;
    std::string userIP;
    std::string message;

    oss >> sessionKey;
    oss >> userIP;
    oss >> playerGuid;
    oss >> messageType;

    switch (messageType)
    {
        case CHAT_MSG_CHANNEL:
        case CHAT_MSG_CHANNEL_JOIN:
        case CHAT_MSG_CHANNEL_LEAVE:
        case CHAT_MSG_WHISPER:
            oss >> chanOrDest;
            break;
    }
    getline(oss, message);
    message = TrimLeft(message);

    DEBUG_OUT_CHAT("Raw='%s' SessionKey=%s Guid=%u MsgType=%i Chan=%s Msg=\"%s\"",
        inputBuffer, sessionKey.c_str(), playerGuid, messageType,
        chanOrDest.c_str(), message.c_str());

    // Let's login the player, if not already online
    uint32 acc = sObjectMgr.GetPlayerAccountIdByGUID(playerGuid);
    QueryResult* auth = LoginDatabase.PQuery("SELECT 1 FROM `account` WHERE `id`=%u AND `sessionkey`=\"%s\"", acc, sessionKey.c_str());
    if (!auth)
    {
        sendf("err_auth\n");
        return 0;
    }
    delete auth;

    WorldSession* sess = sWorld.FindSession(acc);
    if (sess && sess->GetSocket())
    {
        sendf("err_online\n");
        return 0;
    }

    // Check ban
    if (sAccountMgr.IsAccountBanned(acc) || sAccountMgr.IsIPBanned(userIP))
    {
        sendf("err_banned\n");
        return 0;
    }

    std::stringstream out;
    out << "ok\n";
    Player* player = sObjectAccessor.FindPlayer(ObjectGuid(playerGuid));
    if (!player)
    {
        if (sess && sess->PlayerLoading())
        {
            sendf("err_loading\n");
            return 0;
        }
        if (!sPlayerBotMgr.AddBot(playerGuid, true))
        {
            sendf("err_internal\n");
            return 0;
        }
    }
    else
    {
        sPlayerBotMgr.AddTempBot(player->GetSession()->GetAccountId(), 20000);

        // Retrieve messages in queue
        if (messageType == OFFLINE_CHAT_GET_MESSAGES)
        {
            out << player->GetSession()->m_chatBotHistory.str();
            player->GetSession()->m_chatBotHistory.str("");
        }
        else if (messageType == OFFLINE_CHAT_GM_COMMAND)
        {
            if (message.empty())
            {
                sendf("err_empty\n");
                return 0;
            }
            // Disabled. Needs to be thread safe!
            //OfflineChatCommandsHandler(player->GetSession(), out).ParseCommands(message.c_str());
        }
        else
        {
            // Or just queue a normal chat packet
            WorldPacket* data = new WorldPacket(CMSG_MESSAGECHAT, 100);
            uint32 lang = player->GetTeam() == ALLIANCE ? LANG_COMMON : LANG_ORCISH;
            *data << messageType;
            *data << lang;
            switch (messageType)
            {
                case CHAT_MSG_CHANNEL:
                case CHAT_MSG_WHISPER:
                    *data << chanOrDest;
                case CHAT_MSG_YELL:
                case CHAT_MSG_SAY:
                case CHAT_MSG_GUILD:
                case CHAT_MSG_OFFICER:
                case CHAT_MSG_PARTY:
                    *data << message;
                    break;
                case CHAT_MSG_CHANNEL_JOIN:
                    data->Initialize(CMSG_JOIN_CHANNEL, 20);
                    *data << chanOrDest;
                    *data << ""; // Password
                    break;
                case CHAT_MSG_CHANNEL_LEAVE:
                    data->Initialize(CMSG_LEAVE_CHANNEL, 20);
                    *data << chanOrDest;
                    break;
                default:
                    DEBUG_OUT_CHAT(">> Packet err");
                    sendf("err_packet\n");
                    return 0;
            }
            player->GetSession()->QueuePacket(data);
            DEBUG_OUT_CHAT(">> Queue packet.");
        }
    }
    out << "end\n";
    sendf(out.str().c_str());
    return 0;
}

/// Output function
int OfflineChatSocket::sendf(const char* msg)
{
    std::unique_lock<std::mutex> lock (outBufferLock);

    if (closing_)
        return -1;

    int msgLen = strlen(msg);

    if (msgLen+outputBufferLen > OFFCHAT_BUFF_SIZE)
        return -1;

    ACE_OS::memcpy(outputBuffer+outputBufferLen, msg, msgLen);
    outputBufferLen += msgLen;

    if (!outActive)
    {
        if (reactor ()->schedule_wakeup
            (this, ACE_Event_Handler::WRITE_MASK) == -1)
        {
            sLog.outError ("OfflineChatSocket::sendf error while schedule_wakeup");
            return -1;
        }
        outActive = true;
    }
    DEBUG_OUT_CHAT("Sending: \"%s\"", msg);
    return 0;
}
