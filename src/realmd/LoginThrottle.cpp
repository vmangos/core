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

#include "LoginThrottle.h"
#include "Log.h"
#include <algorithm>
#include <chrono>
#include <mutex>
#include <unordered_map>
#include <vector>

namespace
{
    struct ThrottleEntry
    {
        std::vector<std::chrono::steady_clock::time_point> challengeAttempts;
        std::vector<std::chrono::steady_clock::time_point> failureAttempts;

        bool Empty() const { return challengeAttempts.empty() && failureAttempts.empty(); }

        std::chrono::steady_clock::time_point LastActivity() const
        {
            auto lastChallenge = challengeAttempts.empty() ? std::chrono::steady_clock::time_point{} : challengeAttempts.back();
            auto lastFailure   = failureAttempts.empty()   ? std::chrono::steady_clock::time_point{} : failureAttempts.back();
            return std::max(lastChallenge, lastFailure);
        }
    };

    // Hard cap on throttle map size to prevent memory exhaustion from IP spoofing / IPv6 fan-out.
    constexpr size_t kMaxThrottleEntries = 100000;

    std::mutex g_throttleMutex;
    std::unordered_map<std::string, ThrottleEntry> g_throttleMap;

    void PruneOldTimestamps(std::vector<std::chrono::steady_clock::time_point>& v,
                            std::chrono::steady_clock::time_point cutoff)
    {
        v.erase(std::remove_if(v.begin(), v.end(), [cutoff](auto const& t) { return t < cutoff; }), v.end());
    }
} // namespace

bool RecordLoginChallenge(std::string const& ip, uint32 maxAttempts, uint32 windowSeconds, uint32& outCount)
{
    auto now = std::chrono::steady_clock::now();
    auto cutoff = now - std::chrono::seconds(windowSeconds);

    std::lock_guard<std::mutex> lock(g_throttleMutex);

    // Defend against memory exhaustion: if the map is at its hard cap and this is a new IP,
    // evict stale entries first. If still full, treat the attempt as throttled.
    auto existing = g_throttleMap.find(ip);
    if (existing == g_throttleMap.end() && g_throttleMap.size() >= kMaxThrottleEntries)
    {
        auto staleCutoff = now - std::chrono::minutes(10);
        for (auto it = g_throttleMap.begin(); it != g_throttleMap.end(); )
        {
            if (it->second.Empty() || it->second.LastActivity() < staleCutoff)
                it = g_throttleMap.erase(it);
            else
                ++it;
        }
        if (g_throttleMap.size() >= kMaxThrottleEntries)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[LoginThrottle] Map full (%zu entries). Dropping challenge from %s",
                     g_throttleMap.size(), ip.c_str());
            outCount = maxAttempts;
            return true;
        }
    }

    auto& entry = g_throttleMap[ip];
    PruneOldTimestamps(entry.challengeAttempts, cutoff);

    if (entry.challengeAttempts.size() >= maxAttempts)
    {
        outCount = static_cast<uint32>(entry.challengeAttempts.size());
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[LoginThrottle] Challenge limit hit for IP %s: %u attempts in last %u seconds (limit: %u)",
                 ip.c_str(), outCount, windowSeconds, maxAttempts);
        return true;
    }

    entry.challengeAttempts.push_back(now);
    outCount = static_cast<uint32>(entry.challengeAttempts.size());
    return false;
}

bool IsWrongPassLimitReached(std::string const& ip, uint32 maxFailures, uint32 windowSeconds, uint32& outCount)
{
    if (maxFailures == 0)
    {
        outCount = 0;
        return false;
    }

    auto cutoff = std::chrono::steady_clock::now() - std::chrono::seconds(windowSeconds);

    std::lock_guard<std::mutex> lock(g_throttleMutex);
    auto it = g_throttleMap.find(ip);
    if (it == g_throttleMap.end())
    {
        outCount = 0;
        return false;
    }

    PruneOldTimestamps(it->second.failureAttempts, cutoff);
    outCount = static_cast<uint32>(it->second.failureAttempts.size());
    return outCount >= maxFailures;
}

void RecordWrongPassword(std::string const& ip, uint32 windowSeconds)
{
    auto now = std::chrono::steady_clock::now();
    auto cutoff = now - std::chrono::seconds(windowSeconds);

    std::lock_guard<std::mutex> lock(g_throttleMutex);
    auto& entry = g_throttleMap[ip];
    PruneOldTimestamps(entry.failureAttempts, cutoff);
    entry.failureAttempts.push_back(now);
}

void ClearWrongPasswordCount(std::string const& ip)
{
    std::lock_guard<std::mutex> lock(g_throttleMutex);
    auto it = g_throttleMap.find(ip);
    if (it != g_throttleMap.end())
        it->second.failureAttempts.clear();
}

void CleanupLoginThrottle()
{
    std::lock_guard<std::mutex> lock(g_throttleMutex);

    // Drop entries that have been inactive for 10 minutes
    auto cutoff = std::chrono::steady_clock::now() - std::chrono::minutes(10);
    uint32 removed = 0;
    for (auto it = g_throttleMap.begin(); it != g_throttleMap.end(); )
    {
        if (it->second.Empty() || it->second.LastActivity() < cutoff)
        {
            it = g_throttleMap.erase(it);
            ++removed;
        }
        else
        {
            ++it;
        }
    }

    if (removed > 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "[LoginThrottle] Cleaned up %u expired entries, %zu remaining",
                 removed, g_throttleMap.size());
    }
}
