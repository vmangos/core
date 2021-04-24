#include "Timer.h"
#include "MovementBroadcaster.h"
#include "PlayerBroadcaster.h"
#include "World.h"
#include "Player.h"

MovementBroadcaster::MovementBroadcaster(std::size_t threads, std::chrono::milliseconds frequency)
    : m_num_threads(threads), m_sleep_timer(frequency)
{
    if (threads)
        sLog.outInfo("[NETWORK] Movement broadcaster configured to run every %ums "
                        "with %u threads", frequency.count(), threads);
    StartThreads();
}

bool MovementBroadcaster::IsEnabled()
{
    return (bool)m_num_threads; // explicit cast to shut msvc's warnings up
}

void MovementBroadcaster::StartThreads()
{
    ASSERT(m_threads.empty());

    // Create new mutex vector - can't resize a vector of locks (non-copyable)
    std::vector<std::mutex> locks(m_num_threads);
    m_thread_locks = std::move(locks);
    m_thread_players.resize(m_num_threads);
    m_thread_update_stats.resize(m_num_threads);

    m_stop = false;

    // start the workers
    for (std::size_t i = 0; i < m_num_threads; ++i) {
        auto mb = new MovementBroadcasterWorker(i, this);
        m_threads.emplace_back(new std::thread(
                                [mb, i](){mb->run();
        }),[mb](std::thread *thread) {
            if (thread->joinable())
                thread->join();
            delete thread;
            delete mb;
        });
    }

}

void MovementBroadcaster::RegisterPlayer(std::shared_ptr<PlayerBroadcaster> const& player)
{
    if (!m_num_threads)
        return;

    std::size_t index = player->GetGUID().GetRawValue() % m_num_threads;
    std::unique_lock<std::mutex> guard(m_thread_locks[index]);
    m_thread_players[index].insert(player);
}

void MovementBroadcaster::RemovePlayer(std::shared_ptr<PlayerBroadcaster> const& player)
{
    if (!m_num_threads)
        return;

    std::size_t index = player->GetGUID().GetRawValue() % m_num_threads;
    std::unique_lock<std::mutex> guard(m_thread_locks[index]);
    auto it = m_thread_players[index].find(player);

    if (it != m_thread_players[index].end())
        m_thread_players[index].erase(it);
}

void MovementBroadcasterWorker::run()
{
    m_broadcaster->Work(m_threadId);
}

void MovementBroadcaster::Work(std::size_t thread_id)
{
    while (!m_stop)
    {
        ThreadUpdateStats& stats = m_thread_update_stats[thread_id];
        uint32 num_packets = 0;
        uint32 begin_time = WorldTimer::getMSTime();
        BroadcastPackets(thread_id, num_packets);
        stats.num_packets = num_packets;
        stats.update_time = WorldTimer::getMSTimeDiffToNow(begin_time);

        if (sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET_BCAST) &&
            stats.update_time > sWorld.getConfig(CONFIG_UINT32_PERFLOG_SLOW_PACKET_BCAST))
            sLog.out(LOG_PERFORMANCE, "MovementBroadcaster thread %02u: %04ums to process queue [%u packets]",
                thread_id, stats.update_time, num_packets);

        if (sWorld.getConfig(CONFIG_UINT32_PBCAST_DIFF_LOWER_VISIBILITY_DISTANCE) &&
            stats.update_time > sWorld.getConfig(CONFIG_UINT32_PBCAST_DIFF_LOWER_VISIBILITY_DISTANCE))
            IdentifySlowMap(thread_id);
        else
            stats.slow_instance = -1;

        std::this_thread::sleep_for(m_sleep_timer);
    }
}

uint32 MovementBroadcaster::IdentifySlowMap(std::size_t thread_id)
{
    std::map<uint32 /* instanceId */, uint32 /* numPackets */> map_packets;

    std::unique_lock<std::mutex> guard(m_thread_locks[thread_id]);

    for (auto& player : m_thread_players[thread_id])
        map_packets[player->instanceId] += player->lastUpdatePackets;

    uint32 max_number_packets = 0;
    uint32 max_instance_id = 0;
    for (const auto& itr : map_packets)
    {
        if (itr.second > max_number_packets)
        {
            max_instance_id = itr.first;
            max_number_packets = itr.second;
        }
    }
    return max_instance_id;
}

void MovementBroadcaster::BroadcastPackets(std::size_t index, uint32& num_packets)
{
    PlayersBCastSet my_players;
    {
        std::unique_lock<std::mutex> guard(m_thread_locks[index]);
        my_players = m_thread_players[index];
    }

    for (auto& player : my_players)
        player->ProcessQueue(num_packets);
}

void MovementBroadcaster::Stop()
{
    sLog.outInfo("[NETWORK] Stopping movement broadcaster...");

    m_stop = true;

    m_threads.clear();
}

void MovementBroadcaster::UpdateConfiguration(std::size_t new_threads_count, std::chrono::milliseconds new_frequency)
{
    m_sleep_timer = new_frequency;

    if (m_num_threads == new_threads_count)
        return;

    std::size_t old_num_threads = m_num_threads;
    uint32 begin_time = WorldTimer::getMSTime();

    Stop();
    m_num_threads = new_threads_count;

    StartThreads();

    // Reregister all players
    auto const& sessions = sWorld.GetAllSessions();

    for (auto& session : sessions)
    {
        Player* player = session.second->GetPlayer();
        if (!player)
            continue;

        auto broadcaster = player->GetPacketBroadcaster();

        if (broadcaster)
            RegisterPlayer(broadcaster);
    }

    sLog.out(LOG_PERFORMANCE, "[MovementBroadcaster] Changing number of threads from %u to %u in %ums",
        old_num_threads, new_threads_count, WorldTimer::getMSTimeDiffToNow(begin_time));
}

MovementBroadcaster::~MovementBroadcaster()
{
    if (!m_stop)
        Stop();
}

bool MovementBroadcaster::IsMapSlow(uint32 instanceId)
{
    for (auto& stat : m_thread_update_stats)
        if (stat.slow_instance == instanceId)
        {
            stat.slow_instance = -1;
            return true;
        }
    return false;
}
