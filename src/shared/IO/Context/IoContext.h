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
    EpollReceiverFunction = 0, // ptr will be a pointer to a IO::UnixEpollEventReceiver
    ContextSwitchRequest = 1, // will only be called by m_contextSwitchRequestPipe.readHead
};

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
        void PostOperationForImmediateExecution(IO::IocpOperationTask* operation);
        HANDLE GetWindowsCompletionPort() const;
#elif defined(__linux__)
        void PostEpollEventForImmediateExecution(IO::UnixEpollEventReceiver* eventReceiver);
        IO::Native::FileHandle GetUnixEpollDescriptor() const { return m_epollDescriptor; }
#endif

    private:
        volatile bool m_isRunning;

#if defined(WIN32)
        explicit IoContext(HANDLE completionPort);
        HANDLE m_completionPort;
#elif defined(__linux__)
        IO::Native::FileHandle const m_epollDescriptor;
        IO::Native::FileHandle const m_contextSwitchNotifyEventFd;

        std::mutex m_contextSwitchQueueLock;
        std::queue<IO::UnixEpollEventReceiver*> m_contextSwitchQueue;

        explicit IoContext(IO::Native::FileHandle epollDescriptor, IO::Native::FileHandle contextSwitchEventFd);
#endif

    };
}

#endif //MANGOS_IO_IOCONTEXT_H
