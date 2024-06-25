#ifndef MANGOS_IO_TIMER_WIN32_ASYNCSYSTEMTIMER_H
#define MANGOS_IO_TIMER_WIN32_ASYNCSYSTEMTIMER_H

#include <thread>
#include <memory>
#include <mutex>
#include <functional>
#include <mutex>
#include <unordered_set>
#include "Policies/SingletonImp.h"
#include "Policies/ThreadingModel.h"
#include "./TimerHandle.h"

namespace IO { namespace Timer { namespace impl { namespace windows {
    class AsyncSystemTimer : public MaNGOS::Singleton<AsyncSystemTimer, MaNGOS::ClassLevelLockable<AsyncSystemTimer, std::mutex>> {
        friend IO::Timer::TimerHandle;
    public:
        explicit AsyncSystemTimer();
        ~AsyncSystemTimer() = default;
        AsyncSystemTimer(AsyncSystemTimer const&) = delete;
        AsyncSystemTimer& operator=(AsyncSystemTimer const&) = delete;
        AsyncSystemTimer(AsyncSystemTimer&&) = delete;
        AsyncSystemTimer& operator=(AsyncSystemTimer&&) = delete;

        void RemoveAllTimersAndStopThread();

        /// Low resolution async clock system clock with ~16ms accuracy.
        /// Do not use this function for in-game-logic inside mangosd!
        /// Use `player->m_Events.AddEvent` instead.
        /// Please lock the necessary resources inside this function
        template <class Rep, class Period>
        std::shared_ptr<IO::Timer::TimerHandle> ScheduleFunctionOnce(std::chrono::duration<Rep, Period> timeFromNow, std::function<void()> const& function)
        {
            uint64_t milliseconds = std::chrono::duration_cast<std::chrono::milliseconds>(timeFromNow).count();
            return this->_scheduleFunctionOnceMs(milliseconds, std::move(function));
        }
    private:
        std::shared_ptr<IO::Timer::TimerHandle> _scheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function);
        static void _timerQueueTimeoutCallback(PVOID opaquePointer, BOOLEAN _thisVariableIsNotUsedInTimers);

        std::mutex m_pendingTimers_mutex;
        std::unordered_set<std::shared_ptr<IO::Timer::TimerHandle>> m_pendingTimers;
        HANDLE m_nativeTimerQueueHandle;
    };
}}}} // namespace IO::Timer::impl::windows
#define sAsyncSystemTimer MaNGOS::Singleton<IO::Timer::impl::windows::AsyncSystemTimer>::Instance()

#endif //MANGOS_IO_TIMER_WIN32_ASYNCSYSTEMTIMER_H
