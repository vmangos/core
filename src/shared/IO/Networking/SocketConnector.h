#ifndef MANGOS_IO_NETWORKING_ASYNCSOCKETCONNECTOR_H
#define MANGOS_IO_NETWORKING_ASYNCSOCKETCONNECTOR_H

#include <chrono>
#include "SocketDescriptor.h"
#include "NetworkError.h"

#include "nonstd/expected.hpp"

namespace IO { namespace Networking
{
    /** Helper class to create a SocketDescriptor which connects to another server
    \example

    // Create IpEndpoint
    auto maybeIp = IO::Networking::IpAddress::TryParseFromString("127.0.0.1");
    MANGOS_ASSERT(maybeIp.has_value());
    IO::Networking::IpAddress ip = maybeIp.value();
    uint16 port = 8080;
    IO::Networking::IpEndpoint endpoint(ip, port);

    // Try to connect
    auto maybeSocketDescriptor = IO::Networking::SocketConnector::ConnectBlocking(endpoint, std::chrono::seconds(10));
    MANGOS_ASSERT(maybeSocketDescriptor.has_value());

    // Bind socketDescriptor to AsyncSocket and initialize
    auto socket = std::make_shared<IO::Networking::AsyncSocket>(ctx, std::move(maybeSocketDescriptor.value()));
    MANGOS_ASSERT(!(socket->InitializeAndFixateMemoryLocation()));

    // Send example request
    std::string requestString = "Hello World!!!";
    std::vector<char> request(requestString.begin(), requestString.end());
    socket->Write(std::move(request), [socket](IO::NetworkError const& error)
    {
        MANGOS_ASSERT(!error);

        // Receive the response
        auto response = std::make_shared<std::vector<char>>();
        response->resize(1024);
        socket->ReadSome(response->data(), response->size(), [socket, response](IO::NetworkError const& error, size_t actuallyRead)
        {
            MANGOS_ASSERT(!error);

            std::string responseString(response->data(), actuallyRead);
            std::cout << responseString << std::endl;
            socket->CloseSocket();
        });
    });
     */
    class SocketConnector
    {
    public:
        SocketConnector() = delete;

        template <class Rep, class Period>
        static nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError> ConnectBlocking(IO::Networking::IpEndpoint const& target, std::chrono::duration<Rep, Period> timeout)
        {
            return ConnectBlocking(target, std::chrono::duration_cast<std::chrono::milliseconds>(timeout));
        }

        /// Creates a socket and connects it to the target endpoint.
        /// Check for errors in the return value.
        static nonstd::expected<IO::Networking::SocketDescriptor, IO::NetworkError> ConnectBlocking(IO::Networking::IpEndpoint const& target, std::chrono::milliseconds timeoutMs);
    };
}} // namespace IO::Networking

#endif // MANGOS_IO_NETWORKING_ASYNCSOCKETCONNECTOR_H
