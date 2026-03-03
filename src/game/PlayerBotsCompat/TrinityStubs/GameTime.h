#pragma once

#include <ctime>
#include <chrono>
#include "Common.h"

namespace GameTime
{
    inline time_t GetGameTime()
    {
        return std::time(nullptr);
    }

    inline uint32 GetGameTimeMS()
    {
        using namespace std::chrono;
        return static_cast<uint32>(
            duration_cast<milliseconds>(steady_clock::now().time_since_epoch()).count()
        );
    }

    inline uint32 GetUptime()
    {
        using namespace std::chrono;
        static const steady_clock::time_point s_start = steady_clock::now();
        return static_cast<uint32>(duration_cast<seconds>(steady_clock::now() - s_start).count());
    }

    inline time_t GetStartTime()
    {
        static const time_t s_start = std::time(nullptr);
        return s_start;
    }
}
