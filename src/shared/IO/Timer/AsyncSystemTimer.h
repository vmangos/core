#ifndef MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
#define MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H

#include "Common.h"
#include "Log.h"
#include "Policies/Singleton.h"

#ifdef WIN32
#include "./impl/windows/AsyncSystemTimer.h"
#else
#error "IO::Timer not supported on your platform"
#endif


#endif //MANGOS_IO_TIMER_ASYNCSYSTEMTIMER_H
