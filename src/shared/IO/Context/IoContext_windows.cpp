#include "IoContext.h"
#include "Log.h"
#include <Windows.h>

std::unique_ptr<IO::IoContext> IO::IoContext::CreateIoContext()
{
    DWORD constexpr numberOfMaxThreads = 0; // 0 means as many as there are threads on the system
    ULONG_PTR completionKey = 0;
    HANDLE completionPort = ::CreateIoCompletionPort(INVALID_HANDLE_VALUE, nullptr, completionKey, numberOfMaxThreads);
    if (completionPort == nullptr)
    {
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::CreateIoCompletionPort(root, ...) Error: %u", GetLastError());
        return nullptr;
    }
    return std::unique_ptr<IoContext>(new IoContext(completionPort));
}

IO::IoContext::IoContext(HANDLE completionPort) : m_isRunning(true), m_completionPort(completionPort), m_runningThreadsCount(0)
{
}

IO::IoContext::~IoContext()
{
    if (m_isRunning)
    {
        Shutdown();
    }
}

void IO::IoContext::RunUntilShutdown()
{
    ULONG_PTR completionKey = 0;
    IocpOperationTask* task = nullptr;

    DWORD bytesWritten = 0;
    DWORD constexpr maxWait = INFINITE;

    m_runningThreadsCount++;
    while (m_isRunning)
    {
        bool isOkay = ::GetQueuedCompletionStatus(m_completionPort, &bytesWritten, &completionKey, reinterpret_cast<LPOVERLAPPED *>(&task), maxWait);

        if (task)
        {
            task->OnComplete(isOkay ? 0 : ::GetLastError());
        }
        else
        {
            DWORD errorCode = ::GetLastError();
            if (errorCode != WAIT_TIMEOUT && m_isRunning)
            {
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::GetQueuedCompletionStatus(...) Has no TASK!!! Error: %u", errorCode);
            }
            std::this_thread::yield(); // wait one os tick to try again
        }
    }
    m_runningThreadsCount--;
}

bool IO::IoContext::IsRunning() const
{
    return m_isRunning;
}

void IO::IoContext::Shutdown()
{
    if (m_isRunning)
    {
        uint32_t runningThreadsCountLocal = m_runningThreadsCount; // local count to prevent race condition after `running = false`
        m_isRunning = false;

        // We need to wake up the running threads by sending a "null-completion-event" and wait until all thread stopped
        for (uint32_t i = 0; i < runningThreadsCountLocal; i++)
        {
            ::PostQueuedCompletionStatus(m_completionPort, 0, 0, nullptr);
        }
        while (m_runningThreadsCount > 0)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(50));
        }

        ::CloseHandle(m_completionPort);
        m_completionPort = nullptr;
    }
}

void IO::IoContext::PostOperationForImmediateInvocation(IO::AsyncIoOperation* task)
{
    ULONG_PTR completionKey = 0;
    if (!::PostQueuedCompletionStatus(m_completionPort, 0, completionKey, task))
    {
        DWORD error = ::GetLastError();
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "::PostQueuedCompletionStatus(...) Error: %u", error);
    }
}

HANDLE IO::IoContext::GetWindowsCompletionPort() const
{
    return m_completionPort;
}
