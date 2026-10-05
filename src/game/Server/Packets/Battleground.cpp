#include "Battleground.h"
#include "BattleGroundDefines.h"

void WorldPackets::Battleground::BattlefieldListRequest::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
void WorldPackets::Battleground::AreaSpiritHealerQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Battleground::AreaSpiritHealerQueue::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}
#endif

void WorldPackets::Battleground::BattlemasterHello::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Battleground::BattleFieldPort::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
    recv_data >> action;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
void WorldPackets::Battleground::LeaveBattlefield::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    recv_data >> mapId;
#endif
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
void WorldPackets::Battleground::BattlemasterJoin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;          // battlemaster guid, or player guid if joining queue from BG portal
    recv_data >> mapId;
    recv_data >> instanceId;    // instance id, 0 if First Available selected
    recv_data >> joinAsGroup;   // join as group
}
#endif

void WorldPackets::Battleground::BattlefieldJoin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mapId;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
size_t WorldPackets::Battleground::GroupJoinedBattleground::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Battleground::GroupJoinedBattleground::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}
#endif

size_t WorldPackets::Battleground::BattlefieldStatus::EstimateFinalSize() const
{
    return
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
           sizeof(queueSlot) +
#endif
           sizeof(mapId) +
           sizeof(bracketId) +
           sizeof(clientInstanceId) +
           sizeof(statusId) +
           sizeof(time1) +
           // STATUS_WAIT_JOIN does not write time2 on the wire.
           ((statusId == STATUS_WAIT_QUEUE || statusId == STATUS_IN_PROGRESS) ? sizeof(time2) : 0);
}

void WorldPackets::Battleground::BattlefieldStatus::AppendBodyTo(ByteBuffer& buffer) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << queueSlot;             // queue id (0...2) - player can be in 3 queues at the same time
#endif
    buffer << mapId;
    buffer << bracketId;
    buffer << clientInstanceId;
    buffer << statusId;

    // STATUS_WAIT_JOIN only writes time1 on the wire (the original byte-buffer builder
    // intentionally omitted time2 for that state). See BattleGroundStatus enum.
    buffer << time1;
    if (statusId == STATUS_WAIT_QUEUE || statusId == STATUS_IN_PROGRESS)
        buffer << time2;
}

size_t WorldPackets::Battleground::BattlefieldStatusEmpty::EstimateFinalSize() const
{
    return
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
           sizeof(queueSlot) +
#endif
           sizeof(uint32);
}

void WorldPackets::Battleground::BattlefieldStatusEmpty::AppendBodyTo(ByteBuffer& buffer) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << queueSlot;             // queue id (0...2)
#endif
    buffer << uint32(0);
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
size_t WorldPackets::Battleground::PvpLogData::EstimateFinalSize() const
{
    size_t size = sizeof(uint8) + /*bg ended*/
                  (ended ? sizeof(winner) : 0) +
                  sizeof(uint32) + /*player scores count*/
                  playerScores.size() * (sizeof(PlayerScore::playerGuid) +
                                         sizeof(PlayerScore::rank) +
                                         sizeof(PlayerScore::killingBlows) +
                                         sizeof(PlayerScore::honorableKills) +
                                         sizeof(PlayerScore::deaths) +
                                         sizeof(PlayerScore::bonusHonor) +
                                         sizeof(uint32) /*extra fields count*/);

    for (auto const& score : playerScores)
        size += score.extraFields.size() * sizeof(uint32);

    return size;
}

void WorldPackets::Battleground::PvpLogData::AppendBodyTo(ByteBuffer& buffer) const
{
    if (!ended)
    {
        buffer << uint8(0);          // bg not ended
    }
    else
    {
        buffer << uint8(1);          // bg ended
        buffer << winner;            // who wins
    }

    buffer << uint32(playerScores.size());
    for (auto const& score : playerScores)
    {
        buffer << score.playerGuid;
        buffer << score.rank;
        buffer << score.killingBlows;
        buffer << score.honorableKills;
        buffer << score.deaths;
        buffer << score.bonusHonor;
        buffer << static_cast<uint32>(score.extraFields.size());
        for (uint32 const& extra : score.extraFields)
            buffer << extra;
    }
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
size_t WorldPackets::Battleground::BattlegroundPlayerJoined::EstimateFinalSize() const
{
    return sizeof(playerGuid);
}

void WorldPackets::Battleground::BattlegroundPlayerJoined::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

size_t WorldPackets::Battleground::BattlegroundPlayerLeft::EstimateFinalSize() const
{
    return sizeof(playerGuid);
}

void WorldPackets::Battleground::BattlegroundPlayerLeft::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}
#endif

size_t WorldPackets::Battleground::BattlefieldList::EstimateFinalSize() const
{
    return
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
           sizeof(battlemasterGuid) +
#endif
           sizeof(mapId) +
           sizeof(bracketId) +
           sizeof(uint32) + /*number of bg instances*/
           instanceIds.size() * sizeof(uint32);
}

void WorldPackets::Battleground::BattlefieldList::AppendBodyTo(ByteBuffer& buffer) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    buffer << battlemasterGuid; // battlemaster guid
#endif
    buffer << mapId;
    buffer << bracketId;

    buffer << uint32(instanceIds.size()); // number of bg instances
    for (uint32 id : instanceIds)
        buffer << id;
}

size_t WorldPackets::Battleground::BattlefieldWin::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Battleground::BattlefieldWin::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Battleground::BattlefieldLose::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Battleground::BattlefieldLose::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}


