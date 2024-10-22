#include "../../AsyncSystemTimer.h"
#include "Policies/SingletonImp.h"
#include "IO/Multithreading/CreateThread.h"
#include "Log.h"
#include "IO/SystemErrorToString.h"

INSTANTIATE_SINGLETON_1(IO::Timer::AsyncSystemTimer);

IO::Timer::AsyncSystemTimer::AsyncSystemTimer()
{
    m_thread = IO::Multithreading::CreateThread("SystemTimer", [this](){ _TimerThreadFunc(); });
}

void IO::Timer::AsyncSystemTimer::RemoveAllTimersAndStopThread()
{
    m_threadRunning = false;
    m_sleepSemaphore.notify_all();
    m_thread.join();
}

std::shared_ptr<IO::Timer::TimerHandle> IO::Timer::AsyncSystemTimer::_ScheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function)
{
    std::chrono::time_point<std::chrono::system_clock> whenToTriggerMe = std::chrono::system_clock::now() + std::chrono::milliseconds(milliseconds);
    std::shared_ptr<IO::Timer::TimerHandle> timerHandle(new IO::Timer::TimerHandle(this, function));
    InternalTimerEntry newEntry { whenToTriggerMe, timerHandle };

    {
        std::lock_guard<std::mutex> lock(m_orderedPendingTimer_mutex);

        bool isNewFirstEntry;
        if (m_orderedPendingTimer.empty() || (m_orderedPendingTimer.end()->m_whenToTriggerMe < newEntry.m_whenToTriggerMe))
        { // we can just append the new timer to the end
            isNewFirstEntry = m_orderedPendingTimer.empty();
            m_orderedPendingTimer.emplace_back(newEntry);
        }
        else
        { // we need to search, where we can insert it
            // TODO: binary search it
            for (auto it = m_orderedPendingTimer.begin(); it != m_orderedPendingTimer.end(); ++it)
            {
                if (it->m_whenToTriggerMe > newEntry.m_whenToTriggerMe)
                {
                    auto insertLocation = m_orderedPendingTimer.emplace(it, newEntry);
                    isNewFirstEntry = insertLocation == m_orderedPendingTimer.begin();
                    break;
                }
            }
        }

        if (isNewFirstEntry)
            m_sleepSemaphore.notify_all(); // wake the timer thread up
    }


    return newEntry.m_timerHandle;
}

void IO::Timer::AsyncSystemTimer::_TimerThreadFunc()
{
    std::unique_lock<std::mutex> lock(m_orderedPendingTimer_mutex, std::defer_lock);

    while (m_threadRunning)
    {
        auto now = std::chrono::system_clock::now();
        lock.lock();

        std::chrono::time_point<std::chrono::system_clock> sleepUntil = m_orderedPendingTimer.empty()
                                ? std::chrono::time_point<std::chrono::system_clock>::max() // INFINITE SLEEP
                                : m_orderedPendingTimer.begin()->m_whenToTriggerMe;

        if (sleepUntil <= now)
        { // we have something to process RIGHT NOW
            auto timerElement = m_orderedPendingTimer.front();
            m_orderedPendingTimer.pop_front();
            lock.unlock();
            timerElement.m_timerHandle->m_callback();
        }
        else
        {
            m_sleepSemaphore.wait_until(lock, sleepUntil);
            lock.unlock();
        }
    }
}

void IO::Timer::AsyncSystemTimer::_DeleteTimer(IO::Timer::TimerHandle* timerHandle)
{
    std::lock_guard<std::mutex> lock(m_orderedPendingTimer_mutex);
    for (auto it = m_orderedPendingTimer.begin(); it != m_orderedPendingTimer.end(); ++it)
    {
        if (it->m_timerHandle.get() == timerHandle)
        {
            m_orderedPendingTimer.erase(it);
            break;
        }
    }
}
