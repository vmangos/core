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
void WorldPackets::Battleground::GroupJoinedBattleground::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}
#endif

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

void WorldPackets::Battleground::BattlefieldStatusEmpty::AppendBodyTo(ByteBuffer& buffer) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << queueSlot;             // queue id (0...2)
#endif
    buffer << uint32(0);
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
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

void WorldPackets::Battleground::UpdateWorldState::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << field;
    buffer << value;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
void WorldPackets::Battleground::BattlegroundPlayerJoined::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

void WorldPackets::Battleground::BattlegroundPlayerLeft::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}
#endif

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

void WorldPackets::Battleground::BattlefieldWin::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Battleground::BattlefieldLose::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}


