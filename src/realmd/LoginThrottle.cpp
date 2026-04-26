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
    class ThrottleEntry
    {
    public:
        bool IsEmpty() const { return m_failureAttempts.empty(); }

        std::chrono::steady_clock::time_point LastActivity() const
        {
            return m_failureAttempts.empty() ? std::chrono::steady_clock::time_point{} : m_failureAttempts.back();
        }

        size_t CountSince(std::chrono::steady_clock::time_point cutoff)
        {
            PruneOlderThan(cutoff);
            return m_failureAttempts.size();
        }

        void RegisterActivity(std::chrono::steady_clock::time_point now,
                              std::chrono::steady_clock::time_point cutoff)
        {
            PruneOlderThan(cutoff);
            m_failureAttempts.push_back(now);
        }

    private:
        void PruneOlderThan(std::chrono::steady_clock::time_point cutoff)
        {
            m_failureAttempts.erase(
                std::remove_if(m_failureAttempts.begin(), m_failureAttempts.end(),
                               [cutoff](auto const& t) { return t < cutoff; }),
                m_failureAttempts.end());
        }

        std::vector<std::chrono::steady_clock::time_point> m_failureAttempts;
    };

    // Hard cap on throttle map size to prevent memory exhaustion from IP spoofing / IPv6 fan-out.
    constexpr size_t kMaxThrottleEntries = 100000;

    std::mutex g_throttleMutex;
    std::unordered_map<std::string, ThrottleEntry> g_throttleMap;
} // namespace

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

    outCount = static_cast<uint32>(it->second.CountSince(cutoff));
    return outCount >= maxFailures;
}

void RecordWrongPassword(std::string const& ip, uint32 windowSeconds)
{
    auto now = std::chrono::steady_clock::now();
    auto cutoff = now - std::chrono::seconds(windowSeconds);

    std::lock_guard<std::mutex> lock(g_throttleMutex);

    // Defend against memory exhaustion: if the map is at its hard cap and this is a new IP,
    // evict stale entries first. If still full, drop the record.
    auto existing = g_throttleMap.find(ip);
    if (existing == g_throttleMap.end() && g_throttleMap.size() >= kMaxThrottleEntries)
    {
        for (auto it = g_throttleMap.begin(); it != g_throttleMap.end(); )
        {
            if (it->second.IsEmpty() || it->second.LastActivity() < cutoff)
                it = g_throttleMap.erase(it);
            else
                ++it;
        }
        if (g_throttleMap.size() >= kMaxThrottleEntries)
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[LoginThrottle] Map full (%zu entries). Dropping wrong-password record from %s",
                     g_throttleMap.size(), ip.c_str());
            return;
        }
    }

    g_throttleMap[ip].RegisterActivity(now, cutoff);
}

void ClearWrongPasswordCount(std::string const& ip)
{
    std::lock_guard<std::mutex> lock(g_throttleMutex);
    g_throttleMap.erase(ip);
}

void CleanupLoginThrottle(uint32 windowSeconds)
{
    std::lock_guard<std::mutex> lock(g_throttleMutex);

    auto cutoff = std::chrono::steady_clock::now() - std::chrono::seconds(windowSeconds);
    uint32 removed = 0;
    for (auto it = g_throttleMap.begin(); it != g_throttleMap.end(); )
    {
        if (it->second.IsEmpty() || it->second.LastActivity() < cutoff)
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
