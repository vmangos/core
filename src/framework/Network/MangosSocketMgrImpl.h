#include "MangosSocketMgr.h"


#include <ace/ACE.h>
#include <ace/Log_Msg.h>
#include <ace/Reactor.h>
#include <ace/Reactor_Impl.h>
#include <ace/TP_Reactor.h>
#include <ace/Dev_Poll_Reactor.h>
#include <ace/Guard_T.h>
#include <ace/os_include/arpa/os_inet.h>
#include <ace/os_include/netinet/os_tcp.h>
#include <ace/os_include/sys/os_types.h>
#include <ace/os_include/sys/os_socket.h>
#include <ace/Acceptor.h>
#include <ace/SOCK_Acceptor.h>

#include <set>
#include <atomic>

#include "Log.h"
#include "Common.h"
#include "Config/Config.h"
#include "Database/DatabaseEnv.h"

template <typename SocketType>
class MangosSocketAcceptor : public ACE_Acceptor<SocketType, ACE_SOCK_Acceptor>
{
public:
    MangosSocketAcceptor(void) { }
    virtual ~MangosSocketAcceptor(void)
    {
        if (this->reactor())
            this->reactor()->cancel_timer(this, 1);
    }

protected:

    virtual int handle_timeout(const ACE_Time_Value &current_time, const void *act = 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Resuming acceptor");
        this->reactor()->cancel_timer(this, 1);
        return this->reactor()->register_handler(this, ACE_Event_Handler::ACCEPT_MASK);
    }

    virtual int handle_accept_error(void)
    {
#if defined(ENFILE) && defined(EMFILE)
        if (errno == ENFILE || errno == EMFILE)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Out of file descriptors, suspending incoming connections for 10 seconds");
            this->reactor()->remove_handler(this, ACE_Event_Handler::ACCEPT_MASK | ACE_Event_Handler::DONT_CALL);
            this->reactor()->schedule_timer(this, NULL, ACE_Time_Value(10));
        }
#endif
        return 0;
    }
};

/**
* This is a helper class to WorldSocketMgr ,that manages
* network threads, and assigning connections from acceptor thread
* to other network threads
*/
template <typename SocketType>
class ReactorRunnable : protected ACE_Task_Base
{
public:
    ReactorRunnable() :
        m_Reactor(0),
        m_Connections(0),
        m_ThreadId(-1),
        m_Interval(0)
    {
        ACE_Reactor_Impl* imp = 0;

#if defined (ACE_HAS_EVENT_POLL) || defined (ACE_HAS_DEV_POLL)

        imp = new ACE_Dev_Poll_Reactor();

        imp->max_notify_iterations(128);
        imp->restart(1);

#else

        imp = new ACE_TP_Reactor();
        imp->max_notify_iterations(128);

#endif

        m_Reactor = new ACE_Reactor(imp, 1);
    }

    virtual ~ReactorRunnable()
    {
        Stop();
        Wait();

        delete m_Reactor;
    }

    void Stop()
    {
        m_Reactor->end_reactor_event_loop();
    }

    int Start(int interval)
    {
        m_Interval = interval;

        if (m_ThreadId != -1)
            return -1;

        return (m_ThreadId = activate());
    }

    void Wait()
    {
        ACE_Task_Base::wait();
    }

    long Connections()
    {
        return m_Connections;
    }

    int AddSocket(SocketType* sock)
    {
        std::unique_lock<std::mutex> lock(m_NewSockets_Lock);

        ++m_Connections;
        sock->AddReference();
        sock->reactor(m_Reactor);
        m_NewSockets.insert(sock);

        return 0;
    }

    ACE_Reactor* GetReactor()
    {
        return m_Reactor;
    }

protected:
    void AddNewSockets()
    {
        std::unique_lock<std::mutex> lock(m_NewSockets_Lock);

        if (m_NewSockets.empty())
            return;

        for (typename SocketSet::const_iterator i = m_NewSockets.begin(); i != m_NewSockets.end(); ++i)
        {
            SocketType* sock = (*i);

            if (sock->IsClosed())
            {
                sock->RemoveReference();
                --m_Connections;
            }
            else
                m_Sockets.insert(sock);
        }

        m_NewSockets.clear();
    }

    virtual int svc()
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Network Thread Starting");

        WorldDatabase.ThreadStart();

        MANGOS_ASSERT(m_Reactor);

        typename SocketSet::iterator i, t;

        while (!m_Reactor->reactor_event_loop_done())
        {
            // dont be too smart to move this outside the loop
            // the run_reactor_event_loop will modify interval
            ACE_Time_Value interval(0, m_Interval);

            if (m_Reactor->run_reactor_event_loop(interval) == -1)
                break;

            AddNewSockets();

            for (i = m_Sockets.begin(); i != m_Sockets.end();)
            {
                if ((*i)->Update() == -1)
                {
                    t = i;
                    ++i;
                    (*t)->CloseSocket();
                    (*t)->RemoveReference();
                    --m_Connections;
                    m_Sockets.erase(t);
                }
                else
                    ++i;
            }
        }

        WorldDatabase.ThreadEnd();

        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Network Thread Exitting");

        return 0;
    }

private:
    using AtomicInt = std::atomic<int>;
    typedef std::set<SocketType*> SocketSet;

    ACE_Reactor* m_Reactor;
    AtomicInt m_Connections;
    int m_ThreadId;
    int m_Interval;

    SocketSet m_Sockets;

    SocketSet m_NewSockets;
    std::mutex m_NewSockets_Lock;
};

template <typename SocketType>
MangosSocketMgr<SocketType>::MangosSocketMgr():
    m_NetThreads(0),
    m_NetThreadsCount(0),
    m_SockOutKBuff(-1),
    m_SockOutUBuff(65536),
    m_UseNoDelay(true),
    m_Interval(10000),
    m_port(0),
    m_Acceptor(0)
{
}

template <typename SocketType>
MangosSocketMgr<SocketType>::~MangosSocketMgr()
{
    Wait();

    delete [] m_NetThreads;
    delete m_Acceptor;
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::StartThreadsIfNeeded()
{
    if (m_NetThreads)
        return 0;
    m_NetThreads = new ReactorRunnable<SocketType>[m_NetThreadsCount];
    for (size_t i = 0; i < m_NetThreadsCount; ++i)
        m_NetThreads[i].Start(m_Interval);
    return 0;
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::StartReactiveIO(ACE_UINT16 port, const char* address)
{
    if (StartThreadsIfNeeded() == -1)
        return -1;

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Max allowed socket connections %d", ACE::max_handles());

    if (m_SockOutUBuff <= 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Network.OutUBuff is wrong in your config file");
        return -1;
    }

    m_Acceptor = new MangosSocketAcceptor<SocketType>();

    ACE_INET_Addr listen_addr(port, address);

    if (m_Acceptor->open(listen_addr, m_NetThreads[0].GetReactor(), ACE_NONBLOCK) == -1)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Failed to open acceptor, check if the port is free");
        return -1;
    }

    return 0;
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::StartNetwork(ACE_UINT16 port, std::string& address)
{
    if (!sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))
        ACE_Log_Msg::instance()->priority_mask(LM_ERROR, ACE_Log_Msg::PROCESS);

    if (StartReactiveIO(port, address.c_str()) == -1)
        return -1;

    return 0;
}

template <typename SocketType>
void MangosSocketMgr<SocketType>::StopNetwork()
{
    if (m_Acceptor)
        m_Acceptor->close();

    if (m_NetThreadsCount != 0)
    {
        for (size_t i = 0; i < m_NetThreadsCount; ++i)
            m_NetThreads[i].Stop();
    }
}

template <typename SocketType>
void MangosSocketMgr<SocketType>::Wait()
{
    if (m_NetThreadsCount != 0)
    {
        for (size_t i = 0; i < m_NetThreadsCount; ++i)
            m_NetThreads[i].Wait();
    }
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::OnSocketOpen(SocketType* sock)
{
    // set some options here
    if (m_SockOutKBuff >= 0)
    {
        if (sock->peer().set_option(SOL_SOCKET, SO_SNDBUF, (void*)&m_SockOutKBuff, sizeof(int)) == -1 && errno != ENOTSUP)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MangosSocketMgr<SocketType>::OnSocketOpen set_option SO_SNDBUF");
            return -1;
        }
    }

    static const int ndoption = 1;

    // Set TCP_NODELAY.
    if (m_UseNoDelay)
    {
        if (sock->peer().set_option(ACE_IPPROTO_TCP, TCP_NODELAY, (void*)&ndoption, sizeof(int)) == -1)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MangosSocketMgr<SocketType>::OnSocketOpen: peer().set_option TCP_NODELAY errno = %s", ACE_OS::strerror(errno));
            return -1;
        }
    }

    sock->m_OutBufferSize = static_cast<size_t>(m_SockOutUBuff);

    // we skip the Acceptor Thread
    size_t min = 1;

    MANGOS_ASSERT(m_NetThreadsCount >= 1);

    for (size_t i = 1; i < m_NetThreadsCount; ++i)
        if (m_NetThreads[i].Connections() < m_NetThreads[min].Connections())
            min = i;

    return m_NetThreads[min].AddSocket(sock);
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::Connect(int port, std::string const& address, SocketType*& handler)
{
    if (StartThreadsIfNeeded() == -1)
        return -1;

    ACE_INET_Addr addr(port, address.c_str());
    handler = new SocketType();
    handler->SetClientSocket();

    // Create the connector
    typename SocketType::Connector connector;

    //Connects to remote machine
    if (connector.connect(handler,addr) == -1)
    {
        // Handler is already deleted.
        handler = nullptr;
        return -1;
    }
    // Now add a reactor so our connnection gets updated
    OnSocketOpen(handler);

    return 0;
}
