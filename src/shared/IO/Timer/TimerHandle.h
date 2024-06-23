#ifndef MANGOS_IO_TIMER_TIMERHANDLE_H
#define MANGOS_IO_TIMER_TIMERHANDLE_H

#ifdef WIN32
#include "./impl/windows/TimerHandle.h"
#else
#error "IO::Timer not supported on your platform"
#endif


#endif //MANGOS_IO_TIMER_TIMERHANDLE_H
