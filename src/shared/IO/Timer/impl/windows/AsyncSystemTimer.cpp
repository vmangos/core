#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN

#include "../../AsyncSystemTimer.h"
#include "IO/Multithreading/CreateThread.h"
#include "Log.h"
#include "Policies/SingletonImp.h"
#include "Errors.h"

INSTANTIATE_SINGLETON_1(IO::Timer::AsyncSystemTimer);

IO::Timer::AsyncSystemTimer::AsyncSystemTimer()
{
    m_nativeTimerQueueHandle = ::CreateTimerQueue();
    if (!m_nativeTimerQueueHandle)
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "::CreateTimerQueue() failed: %d", GetLastError());
    MANGOS_ASSERT(m_nativeTimerQueueHandle);

    ScheduleFunctionOnce(std::chrono::seconds(0), []() {
        // Since we are single threaded, we can rename this Thread, so we know what's up
        IO::Multithreading::RenameCurrentThread("SystemTimer");
    });
}

void IO::Timer::AsyncSystemTimer::RemoveAllTimersAndStopThread()
{
    HANDLE timerQueueHandle = m_nativeTimerQueueHandle;
    m_nativeTimerQueueHandle = nullptr;
    if (timerQueueHandle)
    {
        ::DeleteTimerQueueEx(
            timerQueueHandle,
            INVALID_HANDLE_VALUE // MSDN: If this parameter is INVALID_HANDLE_VALUE, the function waits for all callback functions to complete before returning.
        );
    }

    m_pendingTimers_mutex.lock();
    m_pendingTimers.clear();
    m_pendingTimers_mutex.unlock();
}

void CALLBACK IO::Timer::AsyncSystemTimer::_timerQueueTimeoutCallback(PVOID opaquePointer, BOOLEAN _thisVariableIsNotUsedInTimers)
{
    (void)_thisVariableIsNotUsedInTimers;

    auto handleRawSharedPtr = (std::shared_ptr<IO::Timer::TimerHandle>*)opaquePointer;
    std::shared_ptr<IO::Timer::TimerHandle> timerHandle = *handleRawSharedPtr;
    delete handleRawSharedPtr;

    timerHandle->m_asyncSystemTimer->m_pendingTimers_mutex.lock();
    bool wasRemovedByMe = timerHandle->m_asyncSystemTimer->m_pendingTimers.erase(timerHandle);
    timerHandle->m_asyncSystemTimer->m_pendingTimers_mutex.unlock();
    if (!wasRemovedByMe)
        return; // The timer was already removed, so we don't want to re-execute it again.

    timerHandle->m_callback();
}

std::shared_ptr<IO::Timer::TimerHandle> IO::Timer::AsyncSystemTimer::_ScheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function)
{
    MANGOS_ASSERT(this->m_nativeTimerQueueHandle);

    std::shared_ptr<TimerHandle> timerHandle(new IO::Timer::TimerHandle(this, function));
    timerHandle->m_asyncSystemTimer = this;
    timerHandle->m_callback = function;

    // since we are using an opaque pointer model of the kernel here,
    // we have to allocate unsafe memory which we will free inside the function
    auto handleRawSharedPtr = new std::shared_ptr<TimerHandle>(timerHandle);
    bool wasOkay = ::CreateTimerQueueTimer(
            &timerHandle->m_nativeTimerHandle,
            m_nativeTimerQueueHandle,
            _timerQueueTimeoutCallback,
            handleRawSharedPtr,
            milliseconds,
            0, // Period = 0: Don't repeat the timer
            WT_EXECUTEONLYONCE | WT_EXECUTEINTIMERTHREAD); // Only execute in WT_EXECUTEINTIMERTHREAD (single thread), otherwise we would spam spawn new system threads.

    if (!wasOkay)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "::CreateTimerQueueTimer failed: %d", GetLastError());
        delete handleRawSharedPtr;
        return nullptr;
    }

    timerHandle->m_asyncSystemTimer->m_pendingTimers_mutex.lock();
    timerHandle->m_asyncSystemTimer->m_pendingTimers.insert(timerHandle);
    timerHandle->m_asyncSystemTimer->m_pendingTimers_mutex.unlock();

    return timerHandle;
}
