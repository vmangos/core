#ifndef USE_ANTICHEAT

#include "Anticheat.h"

AnticheatLibInterface* GetAnticheatLib()
{
    static AnticheatDefaultLib l;
    return &l;
}

#endif