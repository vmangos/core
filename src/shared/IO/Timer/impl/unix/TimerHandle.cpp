#include "../../AsyncSystemTimer.h"

IO::Timer::TimerHandle::TimerHandle(IO::Timer::AsyncSystemTimer *systemTimer, std::function<void()> callbackFunction)
        : m_asyncSystemTimer{systemTimer}, m_callback{std::move(callbackFunction)}
{
}

void IO::Timer::TimerHandle::Cancel()
{
    m_asyncSystemTimer->_DeleteTimer(this);
}
