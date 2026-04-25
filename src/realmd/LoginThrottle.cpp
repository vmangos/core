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
        std::vector<std::chrono::steady_clock::time_point> failureAttempts;

        bool IsEmpty() const { return failureAttempts.empty(); }

        std::chrono::steady_clock::time_point LastActivity() const
        {
            return failureAttempts.empty() ? std::chrono::steady_clock::time_point{} : failureAttempts.back();
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

    // Defend against memory exhaustion: if the map is at its hard cap and this is a new IP,
    // evict stale entries first. If still full, drop the record.
    auto existing = g_throttleMap.find(ip);
    if (existing == g_throttleMap.end() && g_throttleMap.size() >= kMaxThrottleEntries)
    {
        auto staleCutoff = now - std::chrono::minutes(10);
        for (auto it = g_throttleMap.begin(); it != g_throttleMap.end(); )
        {
            if (it->second.IsEmpty() || it->second.LastActivity() < staleCutoff)
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
