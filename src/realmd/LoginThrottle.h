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

#pragma once

#include "Common.h"
#include <string>

struct WrongPasswordThrottleResult
{
    uint32 failedAttempts;
    uint32 maxAttempts;

    bool IsBeingThrottled() const
    {
        if (maxAttempts == 0)
            return false; // Per configuration, no throttling is applied

        return failedAttempts >= maxAttempts;
    }

    explicit WrongPasswordThrottleResult(uint32 failedAttempts, uint32 maxAttempts);
};

// Returns true if this IP has hit the wrong-password limit within the window. Read-only.
WrongPasswordThrottleResult GetWrongPasswordAttemptsForIp(std::string const& ip);

// Records one wrong-password event for this IP. Call after an SRP6 mismatch.
void RecordWrongPasswordAttempt(std::string const& ip);

// Clears the wrong-password counter for this IP. Call on any successful login.
void ClearWrongPasswordCount(std::string const& ip);

// Evicts stale entries from the throttle map. Call periodically from the realmd main loop.
void CleanupStaleLoginThrottles();
