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

// Records one logon/reconnect challenge from this IP, regardless of outcome.
// Returns true if the challenge-per-window limit is already exceeded and the
// request should be rejected before expensive processing (SRP6 etc.).
// On return, outCount holds the attempt count currently associated with the IP.
bool RecordLoginChallenge(std::string const& ip, uint32 maxAttempts, uint32 windowSeconds, uint32& outCount);

// Returns true if this IP has reached the wrong-password failure limit within
// the window and further logon challenges should be rejected outright.
// Does not mutate the entry — failures are recorded only on actual password mismatch.
bool IsWrongPassLimitReached(std::string const& ip, uint32 maxFailures, uint32 windowSeconds, uint32& outCount);

// Records one wrong-password event for this IP. Call after an SRP6 mismatch.
void RecordWrongPassword(std::string const& ip, uint32 windowSeconds);

// Clears the wrong-password counter for this IP. Call on any successful login.
void ClearWrongPasswordCount(std::string const& ip);

// Periodically evicts stale entries from the in-memory login-throttle map.
// Call regularly from the realmd main loop.
void CleanupLoginThrottle();
