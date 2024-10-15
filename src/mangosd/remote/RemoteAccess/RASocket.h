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

#ifndef _RASOCKET_H
#define _RASOCKET_H

#include "Common.h"

#include "IO/Networking/AsyncSocket.h"

#include <functional>
#include <vector>
#include <string>

/// Remote Administration socket
class RASocket final : public std::enable_shared_from_this<RASocket>
{
 public:
    RASocket(IO::Networking::AsyncSocket socket);
    virtual ~RASocket();

    void Start();

 private:
    IO::Networking::AsyncSocket m_socket;

    enum class ConnectionState
    {
        FreshConnection,
        GotUsername,
        Authenticated,
    };

    bool m_restricted;

    std::string m_pendingInputBuffer; // might contain multiple lines
    std::size_t static constexpr MAX_INPUT_BUFFER_SIZE_WHILE_UNAUTHENTICATED = 128;

    ConnectionState m_connectionState;
    bool m_atLeastOnePacketWasReceived;
    std::string m_username;
    uint32 m_accountId;
    AccountTypes m_accountLevel;

    void DoRecvIncomingData();
    void HandleInput(std::string const& line);
    void HandleInput_FreshConnection(std::string const& line);
    void HandleInput_GotUsername(std::string const& line);
    void HandleInput_Authenticated(std::string const& line);

    void SendAndDisconnect(std::string const& message);
    void SendAndRecvNextInput(std::string const& message);
};
#endif
