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
#include "Config/Config.h"
#include "nonstd/saturating_cast.hpp"

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

        uint32 CountSince(std::chrono::steady_clock::time_point cutoff)
        {
            PruneOlderThan(cutoff);
            return nonstd::saturating_cast<uint32>(m_failureAttempts.size());
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

WrongPasswordThrottleResult GetWrongPasswordAttemptsForIp(std::string const& ip)
{
    uint32 windowSeconds = sConfig.GetIntDefault("WrongPass.ThrottleWindowDurationSec", 60);
    uint32 maxFailures = sConfig.GetIntDefault("WrongPass.MaxAttempts", 10);

    auto cutoff = std::chrono::steady_clock::now() - std::chrono::seconds(windowSeconds);

    std::lock_guard<std::mutex> lock(g_throttleMutex);
    auto it = g_throttleMap.find(ip);
    if (it == g_throttleMap.end())
    {
        return WrongPasswordThrottleResult(0, maxFailures); // So far no failed attempts were recorded for this IP
    }

    uint32 failedAttempts = it->second.CountSince(cutoff);
    return WrongPasswordThrottleResult(failedAttempts, maxFailures);
}

WrongPasswordThrottleResult::WrongPasswordThrottleResult(uint32 failedAttempts, uint32 maxAttempts) : failedAttempts(failedAttempts), maxAttempts(maxAttempts)
{
}

void RecordWrongPasswordAttempt(std::string const& ip)
{
    uint32 windowSeconds = sConfig.GetIntDefault("WrongPass.ThrottleWindowDurationSec", 60);

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

void CleanupStaleLoginThrottles()
{
    uint32 windowSeconds = sConfig.GetIntDefault("WrongPass.ThrottleWindowDurationSec", 60);

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
