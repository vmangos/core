#include "PlayerBroadcaster.h"
#include "MovementBroadcaster.h"
#include "World.h"
#include "Player.h"

uint32 PlayerBroadcaster::num_bcaster_created = 0;
uint32 PlayerBroadcaster::num_bcaster_deleted = 0;

PlayerBroadcaster::PlayerBroadcaster(WorldSocket* w_socket, ObjectGuid const& self, std::size_t max_queue)
    : MAX_QUEUE_SIZE(max_queue), m_socket(w_socket), m_self(self), instanceId(0), lastUpdatePackets(0)
{
    if (m_socket)
        m_socket->AddReference();

    m_queue.reserve(max_queue);
    ++num_bcaster_created;
}

void PlayerBroadcaster::ChangeSocket(WorldSocket* new_socket)
{
    if (m_socket)
        m_socket->RemoveReference();
    if (new_socket)
        new_socket->AddReference();
    m_socket = new_socket;
}

void PlayerBroadcaster::AddListener(Player const* player)
{
    ASSERT(player);
    if (player->GetObjectGuid() == m_self)
        return;

    const std::lock_guard<std::mutex> guard(m_listeners_lock);
    m_listeners[player->GetObjectGuid()] = player->m_broadcaster;
}

void PlayerBroadcaster::RemoveListener(Player const* player)
{
    ASSERT(player);
    const std::lock_guard<std::mutex> guard(m_listeners_lock);
    m_listeners.erase(player->GetObjectGuid());
}

void PlayerBroadcaster::ClearListeners()
{
    const std::lock_guard<std::mutex> guard(m_listeners_lock);
    m_listeners.clear();
}

void PlayerBroadcaster::SendPacket(WorldPacket const& packet)
{
    if (m_socket)
        m_socket->SendPacket(packet);
}

void PlayerBroadcaster::ProcessQueue(uint32& num_packets)
{
    if (m_queue.empty())
        return;

    std::unique_lock<std::mutex> q_g(m_queue_lock), v_g(m_listeners_lock);
    auto queue = std::move(m_queue);
    q_g.unlock();

    lastUpdatePackets = queue.size() * m_listeners.size();
    num_packets += lastUpdatePackets;

    for (auto& data : queue)
    {
        // Send to self?
        if (data.sendToSelf && data.except != GetGUID())
            SendPacket(data.packet);

        for (const auto& itr : m_listeners)
        {
            if (itr.first == data.except)
                continue;

            itr.second->SendPacket(data.packet);
        }
    }
}

void PlayerBroadcaster::QueuePacket(WorldPacket packet, bool self, ObjectGuid except)
{
    BroadcastData data;
    data.packet = std::move(packet);
    data.sendToSelf = self;
    data.except = except;

    std::unique_lock<std::mutex> guard(m_queue_lock);

    // We need to drop a packet here - if possible
    if (m_queue.size() >= MAX_QUEUE_SIZE)
    {
        BroadcastData& last_in_queue = m_queue[m_queue.size() - 1];
        if (CanSkipPacket(last_in_queue.packet.GetOpcode()) && CanSkipPacket(packet.GetOpcode()))
        {
            m_queue[m_queue.size() - 1] = std::move(data);
            guard.unlock();
            return;
        }
    }
    m_queue.emplace_back(std::move(data));

    guard.release();
}

ObjectGuid PlayerBroadcaster::GetGUID() const
{
    return m_self;
}

void PlayerBroadcaster::FreeAtLogout()
{
    if (m_socket)
    {
        m_socket->RemoveReference();
        m_socket = nullptr;
    }
    const std::lock_guard<std::mutex> q_g(m_queue_lock), v_g(m_listeners_lock);
    m_queue.clear();
    m_listeners.clear();
}

PlayerBroadcaster::~PlayerBroadcaster()
{
    if (m_socket)
        m_socket->RemoveReference();
    ++num_bcaster_deleted;
}
