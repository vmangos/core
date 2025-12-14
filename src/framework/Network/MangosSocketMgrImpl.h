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
        m_reactor(0),
        m_connections(0),
        m_threadId(-1),
        m_interval(0)
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

        m_reactor = new ACE_Reactor(imp, 1);
    }

    virtual ~ReactorRunnable()
    {
        Stop();
        Wait();

        delete m_reactor;
    }

    void Stop()
    {
        m_reactor->end_reactor_event_loop();
    }

    int Start(int interval)
    {
        m_interval = interval;

        if (m_threadId != -1)
            return -1;

        return (m_threadId = activate());
    }

    void Wait()
    {
        ACE_Task_Base::wait();
    }

    long Connections()
    {
        return m_connections;
    }

    int AddSocket(SocketType* sock)
    {
        std::unique_lock<std::mutex> lock(m_newSocketsLock);

        ++m_connections;
        sock->AddReference();
        sock->reactor(m_reactor);
        m_newSockets.insert(sock);

        return 0;
    }

    ACE_Reactor* GetReactor()
    {
        return m_reactor;
    }

protected:
    void AddNewSockets()
    {
        std::unique_lock<std::mutex> lock(m_newSocketsLock);

        if (m_newSockets.empty())
            return;

        for (typename SocketSet::const_iterator i = m_newSockets.begin(); i != m_newSockets.end(); ++i)
        {
            SocketType* sock = (*i);

            if (sock->IsClosed())
            {
                sock->RemoveReference();
                --m_connections;
            }
            else
                m_sockets.insert(sock);
        }

        m_newSockets.clear();
    }

    virtual int svc()
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "Network Thread Starting");

        WorldDatabase.ThreadStart();

        MANGOS_ASSERT(m_reactor);

        typename SocketSet::iterator i, t;

        while (!m_reactor->reactor_event_loop_done())
        {
            // dont be too smart to move this outside the loop
            // the run_reactor_event_loop will modify interval
            ACE_Time_Value interval(0, m_interval);

            if (m_reactor->run_reactor_event_loop(interval) == -1)
                break;

            AddNewSockets();

            for (i = m_sockets.begin(); i != m_sockets.end();)
            {
                if ((*i)->Update() == -1)
                {
                    t = i;
                    ++i;
                    (*t)->CloseSocket();
                    (*t)->RemoveReference();
                    --m_connections;
                    m_sockets.erase(t);
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

    ACE_Reactor* m_reactor;
    AtomicInt m_connections;
    int m_threadId;
    int m_interval;

    SocketSet m_sockets;

    SocketSet m_newSockets;
    std::mutex m_newSocketsLock;
};

template <typename SocketType>
MangosSocketMgr<SocketType>::MangosSocketMgr():
    m_netThreads(0),
    m_netThreadsCount(0),
    m_sockOutKBuff(-1),
    m_sockOutUBuff(65536),
    m_useNoDelay(true),
    m_interval(10000),
    m_port(0),
    m_acceptor(0)
{
}

template <typename SocketType>
MangosSocketMgr<SocketType>::~MangosSocketMgr()
{
    Wait();

    delete [] m_netThreads;
    delete m_acceptor;
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::StartThreadsIfNeeded()
{
    if (m_netThreads)
        return 0;
    m_netThreads = new ReactorRunnable<SocketType>[m_netThreadsCount];
    for (size_t i = 0; i < m_netThreadsCount; ++i)
        m_netThreads[i].Start(m_interval);
    return 0;
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::StartReactiveIO(ACE_UINT16 port, const char* address)
{
    if (StartThreadsIfNeeded() == -1)
        return -1;

    sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "Max allowed socket connections %d", ACE::max_handles());

    if (m_sockOutUBuff <= 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Network.OutUBuff is wrong in your config file");
        return -1;
    }

    m_acceptor = new MangosSocketAcceptor<SocketType>();

    ACE_INET_Addr listen_addr(port, address);

    if (m_acceptor->open(listen_addr, m_netThreads[0].GetReactor(), ACE_NONBLOCK) == -1)
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
    if (m_acceptor)
        m_acceptor->close();

    if (m_netThreadsCount != 0)
    {
        for (size_t i = 0; i < m_netThreadsCount; ++i)
            m_netThreads[i].Stop();
    }
}

template <typename SocketType>
void MangosSocketMgr<SocketType>::Wait()
{
    if (m_netThreadsCount != 0)
    {
        for (size_t i = 0; i < m_netThreadsCount; ++i)
            m_netThreads[i].Wait();
    }
}

template <typename SocketType>
int MangosSocketMgr<SocketType>::OnSocketOpen(SocketType* sock)
{
    // set some options here
    if (m_sockOutKBuff >= 0)
    {
        if (sock->peer().set_option(SOL_SOCKET, SO_SNDBUF, (void*)&m_sockOutKBuff, sizeof(int)) == -1 && errno != ENOTSUP)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MangosSocketMgr<SocketType>::OnSocketOpen set_option SO_SNDBUF");
            return -1;
        }
    }

    static const int ndoption = 1;

    // Set TCP_NODELAY.
    if (m_useNoDelay)
    {
        if (sock->peer().set_option(ACE_IPPROTO_TCP, TCP_NODELAY, (void*)&ndoption, sizeof(int)) == -1)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "MangosSocketMgr<SocketType>::OnSocketOpen: peer().set_option TCP_NODELAY errno = %s", ACE_OS::strerror(errno));
            return -1;
        }
    }

    sock->m_outBufferSize = static_cast<size_t>(m_sockOutUBuff);

    // we skip the Acceptor Thread
    size_t min = 1;

    MANGOS_ASSERT(m_netThreadsCount >= 1);

    for (size_t i = 1; i < m_netThreadsCount; ++i)
        if (m_netThreads[i].Connections() < m_netThreads[min].Connections())
            min = i;

    return m_netThreads[min].AddSocket(sock);
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
