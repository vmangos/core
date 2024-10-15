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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "RASocket.h"
#include "World.h"
#include "Config/Config.h"
#include "Util.h"
#include "AccountMgr.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "Memory/ArrayDeleter.h"

#include <utility>
#include <vector>
#include <string>

static std::string const NEWLINE = "\r\n";
static std::string const PROMPT = "mangos>";

RASocket::RASocket(IO::Networking::AsyncSocket socket)
  : m_socket(std::move(socket)),
    m_connectionState(ConnectionState::FreshConnection),
    m_atLeastOnePacketWasReceived(false),
    m_accountId(0),
    m_username(),
    m_accountLevel(AccountTypes::SEC_PLAYER)
{
    if (sConfig.IsSet("Ra.Stricted"))
    {
        sLog.Out(LOG_RA, LOG_LVL_ERROR, "Deprecated config option Ra.Stricted being used. Use Ra.Restricted instead.");
        m_restricted = sConfig.GetBoolDefault("Ra.Stricted", true);
    }
    else
        m_restricted = sConfig.GetBoolDefault("Ra.Restricted", true);
}

RASocket::~RASocket()
{
    sLog.Out(LOG_RA, LOG_LVL_MINIMAL, "[%s] Connection was closed", m_socket.GetRemoteIpString().c_str());
}

void RASocket::Start()
{
    if (IO::NetworkError initError = m_socket.InitializeAndFixateMemoryLocation())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[%s] Failed to initialize RASocket %s", m_socket.GetRemoteIpString().c_str(), initError.ToString().c_str());
        return; // implicit close()
    }

    sLog.Out(LOG_RA, LOG_LVL_MINIMAL, "[%s] Incoming RA connection", m_socket.GetRemoteIpString().c_str());

    std::string welcomeMessage;
    welcomeMessage += sWorld.GetMotd(); // <-- technically, we should replace all '\n' in MOTD with NEWLINE
    welcomeMessage += NEWLINE;
    welcomeMessage += sObjectMgr.GetMangosStringForDBCLocale(LANG_RA_USER);

    SendAndRecvNextInput(welcomeMessage);
}

void RASocket::DoRecvIncomingData()
{
    sLog.Out(LOG_RA, LOG_LVL_DEBUG, "RASocket::DoRecvIncomingData");

    // Check if we got a full line in our buffer first
    std::string::size_type newLinePos = m_pendingInputBuffer.find_first_of(NEWLINE);
    if (newLinePos != std::string::npos)
    {
        // remove newline from buffer and forward line
        std::string line = m_pendingInputBuffer.substr(0, newLinePos);
        m_pendingInputBuffer.erase(0, newLinePos + NEWLINE.size());

        if (line.size() == 4095) // Exact length match of the terminal limit. Maybe the user tries to execute a really long command.
            sLog.Out(LOG_RA, LOG_LVL_ERROR, "[%s] A default telnet terminal only allows 4096 characters per line. This command could be executed incorrectly!", m_socket.GetRemoteIpString().c_str());

        HandleInput(line); // This function must ensure that DoRecvIncomingData() is executed when done
        return;
    }

    if (m_connectionState != ConnectionState::Authenticated && m_pendingInputBuffer.size() > MAX_INPUT_BUFFER_SIZE_WHILE_UNAUTHENTICATED)
    {
        sLog.Out(LOG_RA, LOG_LVL_ERROR, "[%s] Unauthenticated connection had too large buffer", m_socket.GetRemoteIpString().c_str());
        return; // implicit socket close
    }

    // we need more data to process this message
    std::shared_ptr<std::vector<char>> recvBuffer(new std::vector<char>(1024));
    m_socket.ReadSome(recvBuffer->data(), recvBuffer->size(), [self = shared_from_this(), recvBuffer](IO::NetworkError const& error, std::size_t amountRead)
    {
        if (error)
        {
            sLog.Out(LOG_RA, LOG_LVL_ERROR, "[%s] Connection had error: %s", self->m_socket.GetRemoteIpString().c_str(), error.ToString().c_str());
            return; // implicit socket close
        }

        if (!self->m_atLeastOnePacketWasReceived)
        {
            // Some terminals send a negotiation packet in the very first message
            self->m_atLeastOnePacketWasReceived = true;
            if (amountRead >= 1 && (static_cast<uint8>(recvBuffer->at(0)) == 0xFF))
            {
                // We got a telnet protocol packet, most likely the terminal wants us to tell the capabilities it has, but we are not really interested in it
                std::vector<uint8> endOfNegotiationResponse = { 0xFF, 0xF0 };
                self->m_socket.Write(std::move(endOfNegotiationResponse), [self](IO::NetworkError const& error) { self->DoRecvIncomingData(); });
                return;
            }
        }

        self->m_pendingInputBuffer.append(recvBuffer->data(), amountRead);
        self->DoRecvIncomingData(); // reprocesses our pending buffer
    });
}

void RASocket::HandleInput(std::string const& line)
{
    switch (m_connectionState)
    {
        // If the input is '<username>'
        case ConnectionState::FreshConnection:
            HandleInput_FreshConnection(line);
            break;

        // If the input is '<password>' (and the user already gave his username)
        case ConnectionState::GotUsername:
            HandleInput_GotUsername(line);
            break;

        // If user is logged in: parse and execute the command
        case ConnectionState::Authenticated:
            HandleInput_Authenticated(line);
            break;

        default:
            MANGOS_ASSERT(false);
    }
}

void RASocket::HandleInput_FreshConnection(std::string const& line)
{
    m_username = line;
    m_connectionState = ConnectionState::GotUsername;
    SendAndRecvNextInput(sObjectMgr.GetMangosStringForDBCLocale(LANG_RA_PASS));
}

void RASocket::HandleInput_GotUsername(std::string const& line)
{
    AccountTypes minRequiredAccLevel = static_cast<AccountTypes>(sConfig.GetIntDefault("Ra.MinLevel", AccountTypes::SEC_ADMINISTRATOR));

    bool loginSuccessful = true;

    if (loginSuccessful) // check username
    {
        m_accountId = sAccountMgr.GetId(m_username);
        if (!m_accountId)
        {
            sLog.Out(LOG_RA, LOG_LVL_MINIMAL, "[%s] Account '%s' does not exist", m_socket.GetRemoteIpString().c_str(), m_username.c_str());
            loginSuccessful = false;
        }
    }

    if (loginSuccessful) // check password
    {
        if (!sAccountMgr.CheckPassword(m_accountId, line))
        {
            sLog.Out(LOG_RA, LOG_LVL_MINIMAL,"[%s] Wrong password for account %s", m_socket.GetRemoteIpString().c_str(), m_username.c_str());
            loginSuccessful = false;
        }
    }

    if (loginSuccessful) // check account level
    {
        m_accountLevel = sAccountMgr.GetSecurity(m_accountId);

        if (m_accountLevel < minRequiredAccLevel)
        {
            sLog.Out(LOG_RA, LOG_LVL_MINIMAL,"[%s] Account %s has no privilege for RA", m_socket.GetRemoteIpString().c_str(), m_username.c_str());
            loginSuccessful = false;
        }
        else
        {
            // allow by remotely connected admin use console level commands dependent from config setting
            if (m_accountLevel >= SEC_ADMINISTRATOR && !m_restricted)
                m_accountLevel = SEC_CONSOLE;
        }
    }

    if (loginSuccessful)
    {
        sLog.Out(LOG_RA, LOG_LVL_MINIMAL,"[%s] Account %s has logged in", m_socket.GetRemoteIpString().c_str(), m_username.c_str());
        m_connectionState = ConnectionState::Authenticated;
        SendAndRecvNextInput("+Logged in." + NEWLINE + " " + PROMPT);
    }
    else
    {
        SendAndDisconnect("-Authentication failed. Verify username, password and required accountLevel." + NEWLINE);
        sLog.Out(LOG_RA, LOG_LVL_MINIMAL,"[%s] Account %s has failed to log in", m_socket.GetRemoteIpString().c_str(), m_username.c_str());
    }
}

void RASocket::HandleInput_Authenticated(std::string const& line)
{
    if (line.empty())
    {
        SendAndRecvNextInput(" " + PROMPT);
        return;
    }

    sLog.Out(LOG_RA, LOG_LVL_MINIMAL, "[%s/%s] Received command: %s", m_socket.GetRemoteIpString().c_str(), m_username.c_str(), line.c_str());

    // handle quit, exit and logout commands to terminate connection
    if (line == "quit" || line == "exit" || line == "logout")
        return;

    // TODO: Make CliCommandHolder able to use std::function
    struct InvokeOutputEnvironment
    {
        std::shared_ptr<RASocket> self;
        std::string output;
    };
    auto* invokeEnvironmentPtr = new InvokeOutputEnvironment
    {
        shared_from_this(),
        "",
    };

    sWorld.QueueCliCommand(new CliCommandHolder(
        m_accountId,
        m_accountLevel,
        invokeEnvironmentPtr,
        line.c_str(),
        [](void* opaquePointer, const char* buffer)
        {
            auto* invokeEnvironmentPtr = static_cast<InvokeOutputEnvironment*>(opaquePointer);
            invokeEnvironmentPtr->output.append(buffer);
        },
        [](void* opaquePointer, bool commandWasSuccessful)
        {
            char const* statusSymbol = commandWasSuccessful ? "+" : "-";

            auto* invokeEnvironmentPtr = static_cast<InvokeOutputEnvironment*>(opaquePointer);
            invokeEnvironmentPtr->output.append(statusSymbol + PROMPT);
            invokeEnvironmentPtr->self->SendAndRecvNextInput(invokeEnvironmentPtr->output);
            delete invokeEnvironmentPtr;
        }
    ));
}


void RASocket::SendAndDisconnect(std::string const& message)
{
    std::shared_ptr<uint8_t> rawMessage(new uint8_t[message.size()], MaNGOS::Memory::array_deleter<uint8_t>());
    memcpy(rawMessage.get(), message.c_str(), message.size());
    m_socket.Write({ rawMessage, message.size() }, [self = shared_from_this()](IO::NetworkError const& error)
    {
        if (error)
            sLog.Out(LOG_RA, LOG_LVL_ERROR, "[%s] Sending message failed: %s", self->m_socket.GetRemoteIpString().c_str(), error.ToString().c_str());
    });
}

void RASocket::SendAndRecvNextInput(std::string const& message)
{
    std::shared_ptr<uint8_t> rawMessage(new uint8_t[message.size()], MaNGOS::Memory::array_deleter<uint8_t>());
    memcpy(rawMessage.get(), message.c_str(), message.size());
    m_socket.Write({ rawMessage, message.size() }, [self = shared_from_this()](IO::NetworkError const& error)
    {
        if (error)
        {
            sLog.Out(LOG_RA, LOG_LVL_ERROR, "[%s] Sending message failed: %s", self->m_socket.GetRemoteIpString().c_str(), error.ToString().c_str());
            return;
        }
        self->DoRecvIncomingData();
    });
}
