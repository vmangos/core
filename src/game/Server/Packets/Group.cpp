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

size_t WorldPackets::Group::RaidReadyCheckFromServer_Request::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Group::RaidReadyCheckFromServer_Request::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#endif

size_t WorldPackets::Group::PartyCommandResult::EstimateFinalSize() const
{
    return sizeof(operation) +
           memberName.size() + sizeof(char) + /*null terminator*/
           sizeof(result);
}

void WorldPackets::Group::PartyCommandResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << operation;
    buffer << memberName;
    buffer << result;
}

size_t WorldPackets::Group::GroupInviteNotification::EstimateFinalSize() const
{
    return inviterName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Group::GroupInviteNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << inviterName;
}

size_t WorldPackets::Group::GroupDeclineNotification::EstimateFinalSize() const
{
    return playerName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Group::GroupDeclineNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerName;
}

size_t WorldPackets::Group::GroupUninviteNotification::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Group::GroupUninviteNotification::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Group::GroupDestroyed::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Group::GroupDestroyed::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
size_t WorldPackets::Group::RaidReadyCheckFromServer_Response::EstimateFinalSize() const
{
    return sizeof(senderGuid) +
           sizeof(state);
}

void WorldPackets::Group::RaidReadyCheckFromServer_Response::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << senderGuid;
    buffer << state;
}

size_t WorldPackets::Group::RaidTargetUpdateDelta::EstimateFinalSize() const
{
    return sizeof(uint8) + /*delta update*/
           sizeof(iconId) +
           sizeof(targetGuid);
}

void WorldPackets::Group::RaidTargetUpdateDelta::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(0); // 0 = delta update
    buffer << iconId;
    buffer << targetGuid;
}

size_t WorldPackets::Group::RaidTargetUpdateAll::EstimateFinalSize() const
{
    return sizeof(uint8) + /*full icon list*/
           icons.size() * (sizeof(IconEntry::iconId) +
                           sizeof(IconEntry::targetGuid));
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

size_t WorldPackets::Group::GroupSetLeaderNotification::EstimateFinalSize() const
{
    return leaderName.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Group::GroupSetLeaderNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << leaderName;
}

size_t WorldPackets::Group::GroupList::EstimateFinalSize() const
{
    size_t size = sizeof(groupType) +
                  sizeof(ownGroupAndAssistantFlag) +
                  sizeof(uint32) + /*members count*/
                  members.size() * (sizeof(char) + /*name null terminator*/
                                    sizeof(Member::guid) +
                                    sizeof(Member::onlineStatus) +
                                    sizeof(Member::groupAndAssistantFlag)) +
                  sizeof(leaderGuid);

    for (auto const& member : members)
        size += member.name.size();

    if (!members.empty())
        size += sizeof(lootMethod) +
                sizeof(looterGuid) +
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
                sizeof(dungeonDifficulty) +
#endif
                sizeof(lootThreshold);

    return size;
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

size_t WorldPackets::Group::LootMasterList::EstimateFinalSize() const
{
    return sizeof(uint8) + /*eligible looters count*/
           eligibleLooters.size() * sizeof(ObjectGuid);
}

void WorldPackets::Group::LootMasterList::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << uint8(eligibleLooters.size());
    for (auto const& guid : eligibleLooters)
        buffer << guid;
}
