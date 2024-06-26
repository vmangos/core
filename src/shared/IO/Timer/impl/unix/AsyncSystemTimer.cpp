#include "../../AsyncSystemTimer.h"
#include "Policies/SingletonImp.h"
#include "IO/Multithreading/CreateThread.h"
#include "Log.h"

INSTANTIATE_SINGLETON_1(IO::Timer::AsyncSystemTimer);

IO::Timer::AsyncSystemTimer::AsyncSystemTimer()
{
    throw std::runtime_error("Not implemented: AsyncSystemTimer::AsyncSystemTimer");
}

void IO::Timer::AsyncSystemTimer::RemoveAllTimersAndStopThread()
{
    throw std::runtime_error("Not implemented: AsyncSystemTimer::RemoveAllTimersAndStopThread");
}

std::shared_ptr<IO::Timer::TimerHandle> IO::Timer::AsyncSystemTimer::_ScheduleFunctionOnceMs(uint64_t milliseconds, std::function<void()> const& function)
{
    throw std::runtime_error("Not implemented: AsyncSystemTimer::_ScheduleFunctionOnceMs");
}
