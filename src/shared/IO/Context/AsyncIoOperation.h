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
        void InitNew(std::function<void(DWORD errorCode)> const& callback)
        {
            MANGOS_DEBUG_ASSERT(m_callback == nullptr && callback != nullptr);

            Internal = 0;
            InternalHigh = 0;
            Offset = 0;
            OffsetHigh = 0;
            hEvent = nullptr;
            m_callback = callback;
        }

        void Reset()
        {
            MANGOS_DEBUG_ASSERT(m_callback != nullptr);

            m_callback = nullptr;
        }

        void OnComplete(DWORD errorCode)
        {
            m_callback(errorCode);
        }

        std::function<void(DWORD errorCode)> m_callback = nullptr;
    };

    typedef IocpOperationTask AsyncIoOperation;
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
    class SystemIoEventReceiver
    {
    public:
        /// @param event On Linux: EPOLL flags, will be 0 for immediate events or a bitmask (multiple) of epoll events (e.g. EPOLLIN, EPOLLOUT, ...)
        /// @param event On Macos: kqueue filter, will be EVFILT_USER for immediate events one of kqueue filter (e.g. EVFILT_READ, EVFILT_WRITE, ...)
        virtual void OnIoEvent(uint32_t event) = 0;
    };
    typedef SystemIoEventReceiver AsyncIoOperation;
#endif
}

#endif //MANGOS_IO_IOOPERATION_H
