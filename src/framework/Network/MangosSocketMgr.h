#ifndef MANGOSSOCKETMGR_H
#define MANGOSSOCKETMGR_H

#include <ace/Basic_Types.h>

#include <string>

template <typename T>
class MangosSocketAcceptor;
template <typename T>
class ReactorRunnable;
class ACE_Event_Handler;

// Manages all sockets connected to peers and network threads
template <typename SocketType>
class MangosSocketMgr
{
    public:

        // Start network, listen at address:port .
        int StartNetwork(ACE_UINT16 port, std::string& address);

        // Stops all network threads, It will wait for all running threads .
        void StopNetwork();

        // Wait untill all network threads have "joined" .
        void Wait();

        void SetOutKBuff(int v) { m_sockOutKBuff = v; }
        void SetOutUBuff(int v) { m_sockOutUBuff = v; }
        void SetThreads(int v) { m_netThreadsCount = v; }
        void SetTcpNodelay(bool v) { m_useNoDelay = v; }
        void SetInterval(int v) { m_interval = v * 1000; /* to microseconds */ }

        int Connect(int port, std::string const& address, SocketType*& sock);
    protected:
        int OnSocketOpen(SocketType* sock);
        int StartReactiveIO(ACE_UINT16 port, const char* address);
        int StartThreadsIfNeeded();

        MangosSocketMgr();
        ~MangosSocketMgr();

        ReactorRunnable<SocketType>* m_netThreads;
        size_t m_netThreadsCount;

        int m_sockOutKBuff;
        int m_sockOutUBuff;
        bool m_useNoDelay;
        int m_interval;

        std::string m_addr;
        ACE_UINT16 m_port;

        MangosSocketAcceptor<SocketType>* m_acceptor;
};

#endif // MANGOSSOCKETMGR_H
