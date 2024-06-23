#include "TimerHandle.h"
#include "./AsyncSystemTimer.h"
#include "Log.h"

void IO::Timer::TimerHandle::Cancel()
{
    m_asyncSystemTimer->m_pendingTimers_mutex.lock();
    bool wasRemoved = m_asyncSystemTimer->m_pendingTimers.erase(shared_from_this());
    m_asyncSystemTimer->m_pendingTimers_mutex.unlock();
    if (!wasRemoved)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[ERROR] TimerHandle->Cancel(): Timer was already removed?");
        return;
    }

    // To avoid race conditions:
    // MSDN: If this parameter (last one) is INVALID_HANDLE_VALUE, the function waits for any running timer callback functions to complete before returning.
    bool wasOkay = ::DeleteTimerQueueTimer(m_asyncSystemTimer->m_nativeTimerQueueHandle, m_nativeTimerHandle, INVALID_HANDLE_VALUE);
    if (!wasOkay)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "::DeleteTimerQueueTimer failed: %d", GetLastError());
    }
}
