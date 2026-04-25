#pragma once

#include "Common.h"
#include <string>

// Returns true if this IP has hit the wrong-password limit within the window. Read-only.
bool IsWrongPassLimitReached(std::string const& ip, uint32 maxFailures, uint32 windowSeconds, uint32& outCount);

// Records one wrong-password event for this IP. Call after an SRP6 mismatch.
void RecordWrongPassword(std::string const& ip, uint32 windowSeconds);

// Clears the wrong-password counter for this IP. Call on any successful login.
void ClearWrongPasswordCount(std::string const& ip);

// Evicts stale entries from the throttle map. Call periodically from the realmd main loop.
void CleanupLoginThrottle();
