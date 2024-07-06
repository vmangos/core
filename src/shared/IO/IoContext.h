#ifndef MANGOS_IO_IOCONTEXT_H
#define MANGOS_IO_IOCONTEXT_H

#include "./Windows_IocpOperationTask.h"

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

namespace IO
{
    class IoContext
    {
    public:
        /// Can return nullptr in case of an error
        static std::unique_ptr<IoContext> CreateIoContext();
        ~IoContext();
        IoContext(IoContext const&) = delete;
        IoContext& operator=(IoContext const&) = delete;
        IoContext(IoContext&&) = delete;
        IoContext& operator=(IoContext&&) = delete;

        void Run();
        void Shutdown();
        void PostCompletedTask(IocpOperationTask* task);

#if defined(WIN32)
        HANDLE GetWindowsCompletionPort() const;
#endif

    private:
        explicit IoContext(HANDLE completionPort);

        volatile bool m_isRunning;

#if defined(WIN32)
        HANDLE m_completionPort;
#endif

    };
}

#endif //MANGOS_IO_IOCONTEXT_H
