/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef MANGOS_TIMER_H
#define MANGOS_TIMER_H

#include "Common.h"
#include <ace/OS_NS_sys_time.h>

class WorldTimer
{
public:
    //get current server time
    static uint32 getMSTime();

    //get time difference between two timestamps
    static uint32 getMSTimeDiff(uint32 const& oldMSTime, uint32 const& newMSTime)
    {
        if (oldMSTime > newMSTime)
        {
            uint32 const diff_1 = (uint32(0xFFFFFFFF) - oldMSTime) + newMSTime;
            uint32 const diff_2 = oldMSTime - newMSTime;

            return std::min(diff_1, diff_2);
        }

        return newMSTime - oldMSTime;
    }
    static uint32 getMSTimeDiffToNow(uint32 t) { return getMSTimeDiff(t, getMSTime()); }

    //get last world tick time
    static uint32 tickTime();
    //get previous world tick time
    static uint32 tickPrevTime();
    //tick world timer
    static uint32 tick();

private:
    WorldTimer();
    WorldTimer(WorldTimer const&);

    //analogue to getMSTime() but it persists m_SystemTickTime
    static uint32 getMSTime_internal();

    static uint32 m_iTime;
    static uint32 m_iPrevTime;
};

class IntervalTimer
{
public:
    IntervalTimer() : _interval(0), _current(0) {}

    void Update(time_t diff)
    {
        _current += diff;
        if (_current < 0)
            _current = 0;
    }
    bool Passed() const { return _current >= _interval; }
    void Reset()
    {
        if (_current >= _interval)
            _current -= _interval;
    }

    void SetCurrent(time_t current) { _current = current; }
    void SetInterval(time_t interval) { _interval = interval; }
    time_t GetInterval() const { return _interval; }
    time_t GetCurrent() const { return _current; }

private:
    time_t _interval;
    time_t _current;
};

class ShortIntervalTimer
{
public:
    ShortIntervalTimer() : _interval(0), _current(0) {}

    void Update(uint32 diff)
    {
        _current += diff;
    }

    bool Passed() const { return _current >= _interval; }
    void Reset()
    {
        if (_current >= _interval)
            _current -= _interval;
    }

    void SetCurrent(uint32 current) { _current = current; }
    void SetInterval(uint32 interval) { _interval = interval; }
    uint32 GetInterval() const { return _interval; }
    uint32 GetCurrent() const { return _current; }

private:
    uint32 _interval;
    uint32 _current;
};

struct TimeTracker
{
    explicit TimeTracker(time_t expiry) : i_expiryTime(expiry) {}
    void Update(time_t diff) { i_expiryTime -= diff; }
    bool Passed() const { return i_expiryTime <= 0; }
    void Reset(time_t interval) { i_expiryTime = interval; }
    time_t GetExpiry() const { return i_expiryTime; }

private:
    time_t i_expiryTime;
};

struct ShortTimeTracker
{
    explicit ShortTimeTracker(int32 expiry=0) : i_expiryTime(expiry) {}
    void Update(int32 diff) { i_expiryTime -= diff; }
    bool Passed() const { return i_expiryTime <= 0; }
    void Reset(int32 interval) { i_expiryTime = interval; }
    int32 GetExpiry() const { return i_expiryTime; }

private:
    int32 i_expiryTime;
};

#endif
