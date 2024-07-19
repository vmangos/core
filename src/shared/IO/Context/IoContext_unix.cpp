#include <unistd.h>
#include <sys/epoll.h>
#include <thread>
#include "Log.h"
#include "IoContext.h"
#include "IO/Utils_Unix.h"
#include "IO/SystemErrorToString.h"

IO::IoContext::IoContext(IO::Native::FileHandle epollDescriptor, PipeFileDescriptors contextSwitchRequestPipe)
        : m_epollDescriptor(epollDescriptor), m_contextSwitchRequestPipe(contextSwitchRequestPipe), m_isRunning{true}
{
}


IO::IoContext::~IoContext()
{
}

std::unique_ptr<IO::IoContext> IO::IoContext::CreateIoContext()
{
    PipeFileDescriptors pipeFds{}; // we just hope that those two ints are aligned like int[2]
    if (::pipe(reinterpret_cast<int*>(&pipeFds)) != 0)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateIoContext() -> ::pipe(...) : %s", SystemErrorToCString(errno));
        return nullptr;
    }

    MANGOS_ASSERT(!IO::Utils::SetFdStatusFlag(pipeFds.readHead, O_NONBLOCK));
    MANGOS_ASSERT(!IO::Utils::SetFdStatusFlag(pipeFds.writeHead, O_NONBLOCK));

    int const epollSizeHint = 50; // <-- hint, how many epoll space we want to have initially. But in modern kernels this is ignored anyway
    int epollDescriptor = ::epoll_create(epollSizeHint);
    if (epollDescriptor == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateIoContext() -> ::epoll_create(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    struct epoll_event event{};
    event.events = EPOLLIN; // dont use EDGE here, since we might not be able to process all context switch requests in one loop
    event.data.u32 = static_cast<uint32_t>(IoContextEpollTargetType::ContextSwitchRequest);
    if (::epoll_ctl(epollDescriptor, EPOLL_CTL_ADD, pipeFds.readHead, &event) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] CreateIoContext() -> ::epoll_ctl(...) Error: %s", SystemErrorToCString(errno));
        return nullptr;
    }

    return std::unique_ptr<IO::IoContext>(new IO::IoContext(epollDescriptor, pipeFds));
}

void IO::IoContext::RunUntilShutdown()
{
    int const maxEvents = 100;

    struct epoll_event events[maxEvents];
    IO::UnixEpollEventReceiver* contextSwitchPtrs[500]; // max 500 requests per loop (we might have multiple threads and don't want to imbalance them)

    while (m_isRunning)
    {
        int numEvents = ::epoll_wait(m_epollDescriptor, events, maxEvents, 50);
        if (numEvents == -1)
        {
            if (errno != EINTR) // ignore interrupted system call
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] RunEventLoop -> ::epoll_wait(...) Error: %s", SystemErrorToCString(errno));
            continue;
        }

        if (numEvents == 0)
            continue; // no events

        sLog.Out(LOG_NETWORK, LOG_LVL_BASIC, "numEvents = %d", numEvents);

        for (int i = 0; i < numEvents; i++)
        {
            struct epoll_event const &event = events[i];

            if (event.data.u32 == static_cast<uint32_t>(IoContextEpollTargetType::ContextSwitchRequest))
            {
                static_assert(sizeof(contextSwitchPtrs) < 0x7FFFF000);
                ssize_t bytesRead = ::read(m_contextSwitchRequestPipe.readHead, contextSwitchPtrs, (int) sizeof(contextSwitchPtrs));
                if (bytesRead == -1)
                {
                    if (errno != EWOULDBLOCK)
                    {
                        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "Error reading context switch pipe: %s", SystemErrorToCString(errno));
                    }
                }
                else
                {
                    MANGOS_ASSERT(bytesRead % sizeof(contextSwitchPtrs[0]) == 0);// If this is not aligned, something terribly went wrong.

                    int amountOfContextSwitches = ((int)bytesRead) / sizeof(contextSwitchPtrs[0]);
                    for (int switchIdx = 0; switchIdx < amountOfContextSwitches; switchIdx++)
                    {
                        (contextSwitchPtrs[switchIdx])->OnEpollEvent(0); // the task wanted to be executed in the IO thread
                    }
                }
            }
            else
            {
                ((UnixEpollEventReceiver*)(event.data.ptr))->OnEpollEvent(event.events);
            }
        }
    }
}

void IO::IoContext::Shutdown()
{
    throw std::runtime_error("TODO, not implemented");
}

void IO::IoContext::PostEpollEventForImmediateExecution(IO::UnixEpollEventReceiver* eventReceiver)
{
    ssize_t amountWritten = ::write(m_contextSwitchRequestPipe.writeHead, &(eventReceiver), sizeof(IO::UnixEpollEventReceiver*));
    if (amountWritten != sizeof(IO::UnixEpollEventReceiver*))
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[FATAL] Unable to write to context switch pipe");
        MANGOS_ASSERT(amountWritten == sizeof(IO::UnixEpollEventReceiver*));
    }
}
