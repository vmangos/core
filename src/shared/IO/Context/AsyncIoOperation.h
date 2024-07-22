#ifndef MANGOS_IO_IOOPERATION_H
#define MANGOS_IO_IOOPERATION_H

#include <cinttypes>
#if defined(WIN32)
#include <string>
#include <functional>
#include "../../Errors.h"

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN
#endif

namespace IO
{
#if defined(WIN32)
    class IocpOperationTask : public OVERLAPPED
    {
    public:
        void InitNew(const std::function<void(DWORD errorCode)>& callback)
        {
            MANGOS_ASSERT(m_callback == nullptr);

            Internal = 0;
            InternalHigh = 0;
            Offset = 0;
            OffsetHigh = 0;
            hEvent = nullptr;
            m_callback = callback;
        }

        void Reset()
        {
            MANGOS_ASSERT(m_callback != nullptr);

            m_callback = nullptr;
        }

        void OnComplete(DWORD errorCode)
        {
            m_callback(errorCode);
        }

        std::function<void(DWORD errorCode)> m_callback = nullptr;
    };

    typedef IocpOperationTask AsyncIoOperation;

#elif defined(__linux__)

    class UnixEpollEventReceiver
    {
    public:
        /// @param epollEvents will be 0 for immediate events or a bitmask or epoll events (e.g. EPOLLIN, EPOLLOUT, ...)
        virtual void OnEpollEvent(uint32_t epollEvents) = 0;
    };
    typedef UnixEpollEventReceiver AsyncIoOperation;
#endif
}

#endif //MANGOS_IO_IOOPERATION_H
