#include "Group.h"
#include "Group/Group.h"

void WorldPackets::Group::GroupInvite::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> memberName;
}

void WorldPackets::Group::GroupUninvite::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> memberName;
}

void WorldPackets::Group::GroupUninviteGuid::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
void WorldPackets::Group::RequestPartyMemberStats::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}
#endif

void WorldPackets::Group::LootMethod::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> lootMethod;
    recv_data >> lootMaster;
    recv_data >> lootThreshold;
}

void WorldPackets::Group::MinimapPing::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> x;
    recv_data >> y;
}

void WorldPackets::Group::RandomRoll::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> minimum;
    recv_data >> maximum;
}

void WorldPackets::Group::GroupChangeSubGroup::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> name;
    recv_data >> groupNr;
}

void WorldPackets::Group::GroupSwapSubGroup::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> name;
    recv_data >> nameSwapWith;
}

void WorldPackets::Group::GroupSetLeader::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    recv_data >> guid;
#else
    recv_data >> name;
#endif
}

void WorldPackets::Group::GroupAssistantLeader::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
    recv_data >> guid;
#else
    recv_data >> name;
#endif
    recv_data >> flag;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldPackets::Group::RaidTargetUpdate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> iconId;
    if (iconId != 0xFF) // target icon update (not a request)
        recv_data >> guid;
}

void WorldPackets::Group::RaidReadyCheckFromClient::ReadFromWorldPacket(WorldPacket& recv_data)
{
    if (!recv_data.empty())
    {
        uint8 s;
        recv_data >> s;
        state = s;
    }
}

void WorldPackets::Group::RaidReadyCheckFromServer_Request::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#endif

void WorldPackets::Group::PartyCommandResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << operation;
    buffer << memberName;
    buffer << result;
}

void WorldPackets::Group::GroupInviteNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << inviterName;
}

void WorldPackets::Group::GroupDeclineNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerName;
}

void WorldPackets::Group::GroupUninviteNotification::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Group::GroupDestroyed::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldPackets::Group::RaidReadyCheckFromServer_Response::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << senderGuid;
    buffer << state;
}

void WorldPackets::Group::RaidTargetUpdateDelta::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(0); // 0 = delta update
    buffer << iconId;
    buffer << targetGuid;
}

void WorldPackets::Group::RaidTargetUpdateAll::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(1); // 1 - full icon list, 0 - delta update
    for (auto const& icon : icons)
    {
        buffer << icon.iconId;
        buffer << icon.targetGuid;
    }
}
#endif

void WorldPackets::Group::GroupSetLeaderNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << leaderName;
}

void WorldPackets::Group::GroupList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << groupType;
    buffer << ownGroupAndAssistantFlag;

    buffer << uint32(members.size());
    for (auto const& member : members)
    {
        buffer << member.name;
        buffer << member.guid;
        buffer << member.onlineStatus;
        buffer << member.groupAndAssistantFlag;
    }

    buffer << leaderGuid;
    if (!members.empty())
    {
        buffer << lootMethod;
        buffer << looterGuid;              // master looter guid (MASTER_LOOT) or 0
        buffer << lootThreshold;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
        buffer << dungeonDifficulty;
#endif
    }
}

void WorldPackets::Group::LootMasterList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(eligibleLooters.size());
    for (auto const& guid : eligibleLooters)
        buffer << guid;
}
