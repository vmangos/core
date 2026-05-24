#ifndef MANGOS_PLAYER_BROADCASTER_H
#define MANGOS_PLAYER_BROADCASTER_H

#include "ObjectGuid.h"
#include "WorldPacket.h"
#include "Opcodes.h"
#include <mutex>
#include <vector>
#include <cstddef>

class WorldSocket;
class MovementBroadcaster;
class Player;

class PlayerBroadcaster final
{
    struct BroadcastData
    {
        WorldPacket packet;
        bool sendToSelf;
        ObjectGuid except;
    };

    std::size_t const MAX_QUEUE_SIZE;

    std::shared_ptr<WorldSocket> m_socket;
    ObjectGuid m_self;

    std::map<ObjectGuid, std::shared_ptr<PlayerBroadcaster> > m_listeners;
    std::vector<BroadcastData> m_queue;
    std::mutex m_listeners_lock;
    std::mutex m_queue_lock;

    void ProcessQueue(uint32& num_packets);
    void SendPacket(WorldPacket const& packet);

    static inline bool CanSkipPacket(uint32 opcode)
    {
        return (opcode < MSG_MOVE_SET_RUN_SPEED_CHEAT ||
                (opcode > MSG_MOVE_SET_TURN_RATE &&
                 opcode != MSG_MOVE_HEARTBEAT));
    }

    uint32 instanceId;
    uint32 lastUpdatePackets;

public:
    PlayerBroadcaster(std::shared_ptr<WorldSocket> socket, ObjectGuid const& self, std::size_t max_queue = 500);
    ~PlayerBroadcaster();

    static uint32 num_bcaster_created;
    static uint32 num_bcaster_deleted;

    void ChangeSocket(std::shared_ptr<WorldSocket> const& new_socket);
    void FreeAtLogout();

    ObjectGuid GetGUID() const;

    void QueuePacket(WorldPacket packet, bool self, ObjectGuid except);

    void AddListener(Player const* player);
    void RemoveListener(Player const* player);

    void ClearListeners();
    void SetInstanceId(uint32 id) { instanceId = id; }

    friend class MovementBroadcaster;
};

#endif
