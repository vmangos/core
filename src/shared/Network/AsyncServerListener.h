#ifndef MANGOS_ASYNCSERVERLISTENER_H
#define MANGOS_ASYNCSERVERLISTENER_H

#include <vector>
#include <memory>
#include <string>
#include <chrono>
#include <WinSock2.h>

/*
 * What to expect form TClientSocket
 * public:
 *   .ctor(std::string address, SOCKET nativeSocket);
 * protected: // friend with us
 *   PerformNonBlockingReadNow();
 *   SocketDescriptor m_socket;
 *
 */
template<typename TClientSocket>
class AsyncServerListener {
public:
    static std::unique_ptr<AsyncServerListener<TClientSocket>> CreateAndBindServer(std::string const& bindIp, uint16_t port)
    {
        int res;

        // TODO <static> check if WSA was already initialized
        WSADATA wsaData;
        res = WSAStartup(MAKEWORD(1, 1), &wsaData);

        if (res != 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Failed to initialize winsock.");
            return nullptr;
        }


        SOCKET nativeSocket = ::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

        if (nativeSocket == INVALID_SOCKET || nativeSocket == SOCKET_ERROR)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Failed to create a black socket");
            return nullptr;
        }

        SOCKADDR_IN m_serverAddress;
        m_serverAddress.sin_family = AF_INET;
        m_serverAddress.sin_addr.s_addr = ::inet_addr(bindIp.c_str());
        m_serverAddress.sin_port = ::htons(port);

        res = ::bind(nativeSocket, (SOCKADDR*)(&m_serverAddress), sizeof(m_serverAddress));
        if (res != 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Failed to bind socket.");
            return nullptr;
        }

        res = listen(nativeSocket, 8);
        if (res != 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Failed to listen on socket.");
            return nullptr;
        }

        // Make it server socket BLOCKING
        u_long nonBlockingMode = 0;
        ioctlsocket(nativeSocket, FIONBIO, &nonBlockingMode);

        return std::make_unique<AsyncServerListener<TClientSocket>>(nativeSocket);
    }


    //StopAcceptingNewConnections();
    //CloseAllClient();

    //template <class Rep, class Period>
    void RunEventLoop(std::chrono::milliseconds maxBlockingDuration)
    {
        timeval timeout {0};
        timeout.tv_sec = std::chrono::duration_cast<std::chrono::seconds>(maxBlockingDuration).count();
        timeout.tv_usec = std::chrono::duration_cast<std::chrono::microseconds>(maxBlockingDuration).count() % 1000000;

        // TODO Make accept a separate threat that checks if the client is event valid before adding it to the main list (m_clients)
        // TODO -- Must be impl specific (e.g. WorldSocket is a different check than AuthSocket)

        // This (acceptOrReadSet) FileDescriptorSet holds the server acceptor socket and all client
        // It will trigger whenever a new client connects or if a client in m_clients has data for us
        // the select() function does all the internal syscall magic. It will wait until maxBlockingDuration or _at least one_ event takes place
        // This way its much more performant than iterating over all sockets and force sleeping
        fd_set acceptOrReadSet;
        FD_ZERO(&acceptOrReadSet);

        FD_SET(m_acceptorNativeSocket, &acceptOrReadSet);

        { // Fill up acceptOrReadSet
            auto iter = m_clients.begin();
            while (iter != m_clients.end())
            {
                std::shared_ptr<TClientSocket>& client = *iter;

                SOCKET nativeSocket = client->m_socket.nativeSocket;
                if (client->m_disconnectRequest)
                { // client has disconnect intend, and since we are in the mainloop, we will disconnect it properly
                    sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "Close socket");
                    ::closesocket(nativeSocket);
                    iter = m_clients.erase(iter);
                }
                else
                {
                    // TODO!!! Important, we are currently limited to 64 clients (see FD_SETSIZE). Use pollfd / IOCP instead
                    // TODO: Dont recreate the fd_set from scratch, use the last one, and keep it in sync with m_clients
                    FD_SET(nativeSocket, &acceptOrReadSet);
                    ++iter;
                }
            }
        }

        // Select will check and fill the FDSet for us. It will set a flag for each SOCKET that has an event for us
        int result = ::select(0, &acceptOrReadSet, NULL, NULL, &timeout);

        if (result == SOCKET_ERROR)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] Socket select() error: WSAGetLastError() = %d", WSAGetLastError());
            MANGOS_ASSERT(0);
            return;
        }

        if (result == 0)
        {
            sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "select: No event");
            return;
        }

        if (FD_ISSET(m_acceptorNativeSocket, &acceptOrReadSet)) // Check if the main socket itself has some event for us
        { // Handle new incoming connections
            sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "select: accept");

            sockaddr_in nativeClientAddr;
            int sizeofAddr = sizeof(nativeClientAddr);
            SOCKET nativeSocket = ::accept(m_acceptorNativeSocket, (SOCKADDR*)&nativeClientAddr, &sizeofAddr);

            if (nativeSocket == 0 || nativeSocket == SOCKET_ERROR)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] select: accept() error: WSAGetLastError() = %d", WSAGetLastError());
                return;
            }

            std::string peerAddress(inet_ntoa(nativeClientAddr.sin_addr)); // inet_ntoa will "free" (reuse) the char* on its own

            SocketDescriptor socketDescriptor { peerAddress, nativeSocket };

            std::shared_ptr<TClientSocket> client = std::make_shared<TClientSocket>(socketDescriptor);
            m_clients.emplace_back(client);

            HandleAccept(client);
        }

        for (auto const& client : m_clients) // Check if any of the clients has an event for us
        {
            if (!FD_ISSET(client->m_socket.nativeSocket, &acceptOrReadSet))
                continue; // Socket has no event for us

            char buf[1];
            result = ::recv(client->m_socket.nativeSocket, buf, 1, MSG_PEEK);
            if (result == 0) // Disconnected
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "client has disconnected");
                ::closesocket(client->m_socket.nativeSocket);
                m_clients.erase(std::remove(m_clients.begin(), m_clients.end(), client), m_clients.end());
            }
            else if (result > 0) // Has data
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_DEBUG, "client has data");
                client->PerformNonBlockingRead();
            }
            else // Error? But how, the ::select should catch all errors
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] select: recv() error: WSAGetLastError() = %d", WSAGetLastError());
                // TODO: Should I disconnect the socket?
                client->CloseSocket();
            }
        }
    }

    explicit AsyncServerListener(SOCKET nativeSocket) : m_acceptorNativeSocket(nativeSocket) {}

private:
    void HandleAccept(std::shared_ptr<TClientSocket> newClient)
    {
        newClient->Start();
    }
    SOCKET m_acceptorNativeSocket;
    std::vector<std::shared_ptr<TClientSocket>> m_clients; // <-- This list might only be touched by the main thread / event loop
};

#endif //MANGOS_ASYNCSERVERLISTENER_H
