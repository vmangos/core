#ifndef MANGOSSOCKETMGR_H
#define MANGOSSOCKETMGR_H

#include <ace/Basic_Types.h>
#include <ace/Singleton.h>
#include <ace/Thread_Mutex.h>

#include <string>

template <typename T>
class ReactorRunnable;
class ACE_Event_Handler;

/// Manages all sockets connected to peers and network threads
template <typename SocketType>
class MangosSocketMgr
{
    public:

        /// Start network, listen at address:port .
        int StartNetwork(ACE_UINT16 port, std::string& address);

        /// Stops all network threads, It will wait for all running threads .
        void StopNetwork();

        /// Wait untill all network threads have "joined" .
        void Wait();

        void SetOutKBuff(int v) { m_SockOutKBuff = v; }
        void SetOutUBuff(int v) { m_SockOutUBuff = v; }
        void SetThreads(int v) { m_NetThreadsCount = v; }
        void SetTcpNodelay(bool v) { m_UseNoDelay = v; }
        void SetInterval(int v) { m_Interval = v * 1000; /* to microseconds */ }

        int Connect(int port, std::string const& address, SocketType*& sock);
    protected:
        int OnSocketOpen(SocketType* sock);
        int StartReactiveIO(ACE_UINT16 port, const char* address);
        int StartThreadsIfNeeded();

        MangosSocketMgr();
        ~MangosSocketMgr();

        ReactorRunnable<SocketType>* m_NetThreads;
        size_t m_NetThreadsCount;

        int m_SockOutKBuff;
        int m_SockOutUBuff;
        bool m_UseNoDelay;
        int m_Interval;

        std::string m_addr;
        ACE_UINT16 m_port;

        ACE_Event_Handler* m_Acceptor;
};

#endif // MANGOSSOCKETMGR_H
