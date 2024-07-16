#ifndef MANGOS_IO_IOCONTEXT_H
#define MANGOS_IO_IOCONTEXT_H

#include "./AsyncIoOperation.h"

#if defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN
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

        /// Will will run the IO loop until .Shutdown() is called.
        /// It is allowed to execute this function from multiple threads at the same time.
        /// But try to limit this to a reasonable amount and not have more threads than (V)Cores on your CPU.
        void RunUntilShutdown();
        bool IsRunning() const;

        void Shutdown();
        void PostOperationForImmediateExecution(IO::AsyncIoOperation* operation);

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
