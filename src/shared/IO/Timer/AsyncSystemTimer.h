#ifndef MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
#define MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H

#include "Common.h"
#include "Log.h"
#include "Policies/Singleton.h"
#include "./TimerHandle.h"

#if defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#include <condition_variable>
#include <thread>
#elif defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN
#endif

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
        static void CALLBACK _timerQueueTimeoutCallback(PVOID opaquePointer, BOOLEAN _thisVariableIsNotUsedInTimers);
        std::mutex m_pendingTimers_mutex;
        std::unordered_set<std::shared_ptr<IO::Timer::TimerHandle>> m_pendingTimers;
        HANDLE m_nativeTimerQueueHandle;
#elif defined(__linux__) || defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
        struct InternalTimerEntry {
            std::chrono::time_point<std::chrono::system_clock> m_whenToTriggerMe;
            std::shared_ptr<IO::Timer::TimerHandle> m_timerHandle;
        };

        void _TimerThreadFunc();
        void _DeleteTimer(TimerHandle* timerHandle);

        std::mutex m_orderedPendingTimer_mutex;
        std::deque<InternalTimerEntry> m_orderedPendingTimer;

        std::condition_variable m_sleepSemaphore; // used to wake up the thread, if something changed at the front() of the timer queue
        volatile bool m_threadRunning = true;
        std::thread m_thread;
#endif
    };
}} // namespace IO::Timer

#define sAsyncSystemTimer MaNGOS::Singleton<IO::Timer::AsyncSystemTimer>::Instance()

#endif //MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
