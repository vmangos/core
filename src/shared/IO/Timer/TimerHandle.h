#ifndef MANGOS_IO_TIMER_TIMERHANDLE_H
#define MANGOS_IO_TIMER_TIMERHANDLE_H

#include <functional>
#include <memory>

namespace IO { namespace Timer {
    class AsyncSystemTimer;

    class TimerHandle : public std::enable_shared_from_this<TimerHandle>
    {
        friend IO::Timer::AsyncSystemTimer;
    public:
        void Cancel();
    private:
        void* m_nativeTimerHandle = nullptr;
        IO::Timer::AsyncSystemTimer* m_asyncSystemTimer = nullptr;
        std::function<void()> m_callback = nullptr;
    };
}} // namespace IO::Timer

#endif //MANGOS_IO_TIMER_TIMERHANDLE_H
