#ifndef MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
#define MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H

#include "Common.h"
#include "Log.h"
#include "Policies/Singleton.h"
#include "./TimerHandle.h"

namespace IO { namespace Timer {
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
            return this->_ScheduleFunctionOnceMs(milliseconds, function);
        }
    private:
        std::shared_ptr<IO::Timer::TimerHandle> _ScheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function);

#if defined(WIN32)
        static void _timerQueueTimeoutCallback(PVOID opaquePointer, BOOLEAN _thisVariableIsNotUsedInTimers);
        std::mutex m_pendingTimers_mutex;
        std::unordered_set<std::shared_ptr<IO::Timer::TimerHandle>> m_pendingTimers;
        HANDLE m_nativeTimerQueueHandle;
#endif
    };
}} // namespace IO::Timer

#define sAsyncSystemTimer MaNGOS::Singleton<IO::Timer::AsyncSystemTimer>::Instance()

#endif //MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
