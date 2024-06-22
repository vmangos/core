#ifndef MANGOS_IO_NETWORKING_WIN32_IOCPOPERATIONEVENT_H
#define MANGOS_IO_NETWORKING_WIN32_IOCPOPERATIONEVENT_H

#include <WinSock2.h>
#include <string>
#include <functional>

class IocpOperationTask : public OVERLAPPED
{
public:
    explicit IocpOperationTask(std::function<void(IocpOperationTask* thisTask, DWORD errorCode)> const& callback): OVERLAPPED()
    {
        Reset();
        m_callback = callback;
    };
    IocpOperationTask(const IocpOperationTask&) = delete;
    IocpOperationTask& operator=(const IocpOperationTask&) = delete;
    IocpOperationTask(IocpOperationTask&&) = delete;
    IocpOperationTask& operator=(IocpOperationTask&&) = delete;

private:
    std::function<void(IocpOperationTask* thisTask, DWORD errorCode)> m_callback;

    void Reset()
    {
        Internal = 0;
        InternalHigh = 0;
        Offset = 0;
        OffsetHigh = 0;
        hEvent = nullptr;
        m_callback = nullptr;
    }

public:
    void OnComplete(DWORD errorCode)
    {
        m_callback(this, errorCode);
    }
};

#endif //MANGOS_IO_NETWORKING_WIN32_IOCPOPERATIONEVENT_H
