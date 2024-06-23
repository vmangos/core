#ifndef MANGOS_IO_TIMER_WIN32_TIMERHANDLE_H
#define MANGOS_IO_TIMER_WIN32_TIMERHANDLE_H

#include <functional>
#include <memory>

namespace IO { namespace Timer { namespace impl { namespace windows {
    class AsyncSystemTimer;
}}}} // namespace IO::Timer::impl::windows

namespace IO { namespace Timer
{
    class TimerHandle : public std::enable_shared_from_this<TimerHandle>
    {
        friend IO::Timer::impl::windows::AsyncSystemTimer;
    public:
        void Cancel();
    private:
        void* m_nativeTimerHandle = nullptr;
        IO::Timer::impl::windows::AsyncSystemTimer* m_asyncSystemTimer = nullptr;
        std::function<void()> m_callback = nullptr;
    };
}} // namespace IO::Timer


#endif //MANGOS_IO_TIMER_WIN32_TIMERHANDLE_H
