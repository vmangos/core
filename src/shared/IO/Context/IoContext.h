#ifndef MANGOS_IO_IOCONTEXT_H
#define MANGOS_IO_IOCONTEXT_H

#include <memory>
#include "./AsyncIoOperation.h"

#if defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN
#endif

#if defined(__linux__)
#include "../NativeAliases.h"
#include "mutex"
#include "queue"

enum class IoContextEpollTargetType // this is used in `(epoll_event).data.u32` to decide what to do with it
{
    IoEventReceiverFunction = 0, // ptr will be a pointer to a IO::SystemIoEventReceiver
    ContextSwitchRequest = 1, // will only be called by m_contextSwitchRequestPipe.readHead
};
#endif

#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include "../NativeAliases.h"
#endif

namespace IO
{
    class IoContext
    {
    public:
        /// Returns nullptr in case of an error
        static std::unique_ptr<IoContext> CreateIoContext();
        ~IoContext();
        IoContext(IoContext const&) = delete;
        IoContext& operator=(IoContext const&) = delete;
        IoContext(IoContext&&) = delete;
        IoContext& operator=(IoContext&&) = delete;

        /// Will run the IO loop until .Shutdown() is called.
        /// It is allowed to execute this function from multiple threads at the same time.
        /// But try to limit this to a reasonable amount and not have more threads than (V)Cores on your CPU.
        void RunUntilShutdown();
        bool IsRunning() const;

        void Shutdown();

#if defined(WIN32)
        HANDLE GetWindowsCompletionPort() const;
#elif defined(__linux__)
        IO::Native::FileHandle GetUnixEpollDescriptor() const { return m_epollDescriptor; }
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        IO::Native::FileHandle GetKqueueDescriptor() const { return m_kqueueDescriptor; }
#endif

#if defined(WIN32)
        void PostOperationForImmediateInvocation(IO::IocpOperationTask* operation);
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        /// On linux with epoll: Invokes {SystemIoEventReceiver::OnIoEvent} in IO thread with parameter 0
        /// On macos with kqueue: Invokes {SystemIoEventReceiver::OnIoEvent} in IO thread with parameter EVFILT_USER
        void PostForImmediateInvocation(IO::SystemIoEventReceiver* eventReceiver);
#endif

    private:
        volatile bool m_isRunning;

#if defined(WIN32)
        explicit IoContext(HANDLE completionPort);
        HANDLE m_completionPort;
        volatile uint32_t m_runningThreadsCount;
#elif defined(__linux__)
        IO::Native::FileHandle const m_epollDescriptor;
        IO::Native::FileHandle const m_contextSwitchNotifyEventFd;

        std::mutex m_contextSwitchQueueLock;
        std::queue<IO::SystemIoEventReceiver*> m_contextSwitchQueue;

        explicit IoContext(IO::Native::FileHandle epollDescriptor, IO::Native::FileHandle contextSwitchEventFd);
#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        IO::Native::FileHandle const m_kqueueDescriptor;
        explicit IoContext(IO::Native::FileHandle kqueueDescriptor);
#endif
    };
}

#endif //MANGOS_IO_IOCONTEXT_H
