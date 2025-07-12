#include <unistd.h>
#include <sys/event.h>
#include "Log.h"
#include "IoContext.h"
#include "IO/SystemErrorToString.h"

IO::IoContext::IoContext(IO::Native::FileHandle kqueueDescriptor)
        : m_kqueueDescriptor(kqueueDescriptor), m_isRunning{true}
{
}

IO::IoContext::~IoContext()
{
    ::close(m_kqueueDescriptor);
}

std::unique_ptr<IO::IoContext> IO::IoContext::CreateIoContext()
{
    // Initialize our main kqueue
    int kqueueDescriptor = ::kqueue();
    if (kqueueDescriptor == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "CreateIoContext() -> ::kqueue(...) Error: %s", SystemErrorToString(errno).c_str());
        return nullptr;
    }

    return std::unique_ptr<IO::IoContext>(new IO::IoContext(kqueueDescriptor));
}

void IO::IoContext::RunUntilShutdown()
{
    int const maxEventsPerLoop = 250;

    struct timespec timeout;
    timeout.tv_sec = 0;
    timeout.tv_nsec = 500 * 1000000; // 500 milliseconds in nanoseconds

    struct kevent events[maxEventsPerLoop];

    while (m_isRunning)
    {
        int numEvents = ::kevent(m_kqueueDescriptor, nullptr, 0, events, maxEventsPerLoop, &timeout);
        if (numEvents == -1)
        {
            if (errno != EINTR) // ignore interrupted system call
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "RunEventLoop -> ::kevent(...) Error: %s", SystemErrorToString(errno).c_str());
            continue;
        }

        for (int i = 0; i < numEvents; i++)
        {
            struct kevent const& event = events[i];
            ((SystemIoEventReceiver*)(event.udata))->OnIoEvent(event.filter);
        }
    }
}

bool IO::IoContext::IsRunning() const
{
    return m_isRunning;
}

void IO::IoContext::Shutdown()
{
    m_isRunning = false;
}

void IO::IoContext::PostForImmediateInvocation(IO::SystemIoEventReceiver* eventReceiver)
{
    struct kevent addedEvent{};

    // Create and trigger a one-time event
#if defined(__APPLE__)
    // Apple allow this in just one system call
    EV_SET(&addedEvent, (uint64_t)(eventReceiver), EVFILT_USER, EV_ADD | EV_ONESHOT, NOTE_TRIGGER, 0, eventReceiver);
    if (::kevent(m_kqueueDescriptor, &addedEvent, 1, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "PostForImmediateInvocation() -> ::kevent(...) Error: %s", SystemErrorToString(errno).c_str());
    }
#else
    // On BSD we have to make two system calls, one to post the event, one to trigger it :/
    EV_SET(&addedEvent, (uint64_t)(eventReceiver), EVFILT_USER, EV_ADD | EV_ONESHOT, 0, 0, eventReceiver);
    if (::kevent(m_kqueueDescriptor, &addedEvent, 1, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "PostForImmediateInvocation() -> ::kevent(post, ...) Error: %s", SystemErrorToString(errno).c_str());
    }

    // trigger it
    EV_SET(&addedEvent, (uint64_t)(eventReceiver), EVFILT_USER, 0, NOTE_TRIGGER, 0, eventReceiver);
    if (::kevent(m_kqueueDescriptor, &addedEvent, 1, nullptr, 0, nullptr) == -1)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "PostForImmediateInvocation() -> ::kevent(trigger, ...) Error: %s", SystemErrorToString(errno).c_str());
    }
#endif
}
