#include "../../AsyncSystemTimer.h"
#include "Policies/SingletonImp.h"
#include "IO/Multithreading/CreateThread.h"
#include "Log.h"

INSTANTIATE_SINGLETON_1(IO::Timer::AsyncSystemTimer);

IO::Timer::AsyncSystemTimer::AsyncSystemTimer()
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "NotYetImplemented: AsyncSystemTimer::.ctor");
}

void IO::Timer::AsyncSystemTimer::RemoveAllTimersAndStopThread()
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "NotYetImplemented: AsyncSystemTimer::RemoveAllTimersAndStopThread");
}

std::shared_ptr<IO::Timer::TimerHandle> IO::Timer::AsyncSystemTimer::_ScheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function)
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "NotYetImplemented: AsyncSystemTimer::_ScheduleFunctionOnceMs");
    std::shared_ptr<TimerHandle> timerHandle = std::make_shared<IO::Timer::TimerHandle>();
}
