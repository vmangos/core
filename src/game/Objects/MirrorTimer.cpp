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

#include "MirrorTimer.h"

MirrorTimer::Status MirrorTimer::FetchStatus()
{
    Status status = m_status;
    m_status = UNCHANGED;
    return status;
}

void MirrorTimer::Stop()
{
    if (m_active)
    {
        m_active = false;
        m_pulse.SetCurrent(0);
        m_tracker.SetCurrent(0);
        m_status = STATUS_UPDATE;
    }
}

void MirrorTimer::Start(uint32 interval, uint32 spellId/* = 0*/)
{
    if (m_scale < 0)
    {
        m_active = true;
        m_pulse.SetCurrent(0);
        m_pulse.SetInterval(2 * IN_MILLISECONDS);
        m_tracker.SetCurrent(0);
        m_tracker.SetInterval(interval);
        m_spellId = spellId;
        m_status = FULL_UPDATE;
    }
    else
        Stop();
}

void MirrorTimer::Start(uint32 current, uint32 max, uint32 spellId)
{
    Start(max, spellId);

    if (m_active)
    {
        m_tracker.SetCurrent(max - current);
        SetFrozen(false);
    }
}

void MirrorTimer::SetRemaining(uint32 duration)
{
    if (!duration)
        return Stop();

    if (IsActive() && duration != GetRemaining())
        m_status = FULL_UPDATE;

    m_tracker.SetCurrent(GetDuration() - duration);
}

void MirrorTimer::SetDuration(uint32 duration)
{
    if (!duration)
        return Stop();

    if (IsActive() && duration != GetDuration())
        m_status = FULL_UPDATE;

    m_tracker.SetInterval(duration);
}

void MirrorTimer::SetFrozen(bool state)
{
    if (IsActive() && state != IsFrozen())
        m_status = STATUS_UPDATE;

    m_frozen = state;
}

void MirrorTimer::SetScale(int32 scale)
{
    if (!scale)
        return SetFrozen(true);

    if (IsActive() && scale != m_scale)
        m_status = FULL_UPDATE;

    m_scale = scale;
}

bool MirrorTimer::Update(uint32 diff)
{
    if (!IsActive() || IsFrozen())
        return true;

    diff *= uint32(std::abs(m_scale));

    if (m_scale < 0)    // Timer running out
    {
        m_tracker.Update(diff);

        if (!m_tracker.Passed())
            return true;

        uint32 const interval = m_tracker.GetInterval();
        uint32 const overflow = (m_tracker.GetCurrent() - interval);

        m_tracker.SetCurrent(interval);

        if (overflow == diff)   // Pulse: subsequent ticks after instant tick on expiration
        {
            m_pulse.Update(overflow);

            if (!m_pulse.Passed())
                return true;

            m_pulse.Reset();
        }

        return false;
    }
    else                // Timer regenerating
    {
        uint32 const current = m_tracker.GetCurrent();

        if (current > diff)
        {
            m_tracker.SetCurrent(current - diff);
            m_pulse.SetCurrent(0);
        }
        else
            Stop();

        return true;
    }
}
