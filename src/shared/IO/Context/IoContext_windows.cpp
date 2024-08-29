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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::CreateIoCompletionPort(root, ...) Error: %u", GetLastError());
        return nullptr;
    }
    return std::unique_ptr<IoContext>(new IoContext(completionPort));
}

IO::IoContext::IoContext(HANDLE completionPort) : m_completionPort(completionPort), m_isRunning{true}
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
                sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::GetQueuedCompletionStatus(...) Has no TASK!!! Error: %u", errorCode);
            }
        }
    }
}

bool IO::IoContext::IsRunning() const
{
    return m_isRunning;
}

void IO::IoContext::Shutdown()
{
    if (m_isRunning)
    {
        m_isRunning = false;
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
        sLog.Out(LOG_NETWORK, LOG_LVL_ERROR, "[ERROR] ::PostQueuedCompletionStatus(...) Error: %u", error);
    }
}

HANDLE IO::IoContext::GetWindowsCompletionPort() const
{
    return m_completionPort;
}
