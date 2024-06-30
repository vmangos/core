#ifndef MANGOS_IO_TIMER_TIMERHANDLE_H
#define MANGOS_IO_TIMER_TIMERHANDLE_H

#include <functional>
#include <memory>
#include <utility>

namespace IO { namespace Timer {
    class AsyncSystemTimer;

    class TimerHandle : public std::enable_shared_from_this<TimerHandle>
    {
        friend IO::Timer::AsyncSystemTimer;
    public:
        void Cancel();
    private:
        explicit TimerHandle(IO::Timer::AsyncSystemTimer* systemTimer, std::function<void()> callbackFunction);

        IO::Timer::AsyncSystemTimer* m_asyncSystemTimer = nullptr;
        std::function<void()> m_callback = nullptr;
#if defined(WIN32)
        void* m_nativeTimerHandle = nullptr;
#endif
    };
}} // namespace IO::Timer

#endif //MANGOS_IO_TIMER_TIMERHANDLE_H
