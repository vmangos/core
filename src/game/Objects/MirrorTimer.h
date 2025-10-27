/*
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

#ifndef _MIRROR_TIMER_H
#define _MIRROR_TIMER_H

#include "Common.h"
#include "Timer.h"

class MirrorTimer
{
public:
    enum Type
    {
        FATIGUE = 0,
        BREATH = 1,
        FEIGNDEATH = 2,

        NUM_CLIENT_TIMERS,

        ENVIRONMENTAL = NUM_CLIENT_TIMERS,

        NUM_TIMERS
    };

    enum Status
    {
        UNCHANGED = 0,
        FULL_UPDATE = 1,
        STATUS_UPDATE = 2,
    };

    MirrorTimer(Type type) : m_type(type), m_scale(-1), m_spellId(0), m_status(UNCHANGED), m_active(false), m_frozen(false) {}

    bool     IsActive() const { return m_active; }
    bool     IsRegenerating() const { return (m_scale > 0); }
    bool     IsFrozen() const { return (m_frozen && !IsRegenerating()); }

    Type     GetType() const { return m_type; }
    uint32   GetRemaining() const { return (m_tracker.GetInterval() - m_tracker.GetCurrent()); }
    uint32   GetDuration() const { return m_tracker.GetInterval(); }
    int32    GetScale() const { return m_scale; }
    uint32   GetSpellId() const { return m_spellId; }

    Status   FetchStatus();

    void Stop();

    void Start(uint32 interval, uint32 spellId = 0);
    void Start(uint32 current, uint32 max, uint32 spellId);

    void SetRemaining(uint32 duration);
    void SetDuration(uint32 duration);

    void SetFrozen(bool state);

    void SetScale(int32 scale);

    bool Update(uint32 diff);

private:
    Type m_type;
    int32 m_scale;
    uint32 m_spellId;

    ShortIntervalTimer m_tracker;
    ShortIntervalTimer m_pulse;

    Status m_status;

    bool m_active;
    bool m_frozen;
};

#endif
