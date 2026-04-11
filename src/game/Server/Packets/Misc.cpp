#include "Misc.h"

void WorldPackets::Misc::WorldTeleport::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> timeMs;
    recv_data >> location.mapId;
    recv_data >> location.x;
    recv_data >> location.y;
    recv_data >> location.z;
    recv_data >> location.o;
}

void WorldPackets::Misc::AddFriend::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> friendName;
}

void WorldPackets::Misc::DelFriend::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> friendGuid;
}

void WorldPackets::Misc::AddIgnore::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> ignoreName;
}

void WorldPackets::Misc::DelIgnore::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> ignoreGuid;
}

void WorldPackets::Misc::StandStateChange::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> animState;
}

void WorldPackets::Misc::AreaTrigger::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> triggerId;
}

void WorldPackets::Misc::Inspect::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::GameObjectUse::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::Emote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> emote;
}

void WorldPackets::Misc::TextEmote::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> textEmote;
    recv_data >> emoteNum;
    recv_data >> guid;
}

void WorldPackets::Misc::SetSelection::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::SetTarget::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::FarSight::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> op;
}

void WorldPackets::Misc::TutorialFlag::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> iFlag;
}

void WorldPackets::Misc::SetActionButton::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> button;
    recv_data >> packetData;
}

void WorldPackets::Misc::InspectHonorStats::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::SetActiveMover::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::SetFactionAtWar::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> repListId;
    recv_data >> flag;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Misc::SetFactionInactive::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> replistid;
    recv_data >> inactive;
}
#endif

void WorldPackets::Misc::ZoneUpdate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> newZone;
}

void WorldPackets::Misc::ReclaimCorpse::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::ChatIgnored::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::ResurrectResponse::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> resurrectorGuid;
    recv_data >> accept;
}

void WorldPackets::Misc::ItemTextQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemTextId;
    recv_data >> mailId;
    recv_data >> unk;
}

void WorldPackets::Misc::SummonResponse::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> summonerGuid;
}

void WorldPackets::Misc::SetActionBarToggles::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> actionBar;
}

void WorldPackets::Misc::MeetingStoneJoin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Misc::TeleportToUnit::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerName;
}

void WorldPackets::Misc::RequestAccountData::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> type;
}

void WorldPackets::Misc::UpdateAccountData::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> type;
    recv_data >> decompressedSize;
    uint32 remaining = recv_data.size() - recv_data.rpos();
    compressedData.resize(remaining);
    if (compressedData.size() > 0)
    {
        recv_data.read(compressedData.data(), compressedData.size());
    }
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Misc::SetWatchedFaction::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> repId;
}
#endif

void WorldPackets::Misc::MoveSetRawPosition::ReadFromWorldPacket(WorldPacket& recv_data)
{
    opcode = recv_data.GetOpcode();
    recv_data >> location.x;
    recv_data >> location.y;
    recv_data >> location.z;
    recv_data >> location.o;
}

void WorldPackets::Misc::TogglePvP::ReadFromWorldPacket(WorldPacket& recv_data)
{
    if (recv_data.size() == 1)
    {
        bool state;
        recv_data >> state;
        targetState = state;
    }
}

void WorldPackets::Misc::Who::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> levelMin;
    recv_data >> levelMax;
    recv_data >> playerName;
    recv_data >> guildName;
    recv_data >> raceMask;
    recv_data >> classMask;

    uint32 zonesCount;
    recv_data >> zonesCount;
    for (uint32 i = 0; i < zonesCount; ++i)
    {
        uint32 zone;
        recv_data >> zone;
        zoneIds.push_back(zone);
    }

    uint32 strCount;
    recv_data >> strCount;
    for (uint32 i = 0; i < strCount; ++i)
    {
        std::string term;
        recv_data >> term;
        searchTerms.push_back(std::move(term));
    }
}

void WorldPackets::Misc::Bug::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> suggestion;
    recv_data.read_skip<uint32>(); // contentLen
    recv_data >> content;
    recv_data.read_skip<uint32>(); // typeLen
    recv_data >> type;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
void WorldPackets::Misc::WardenData::ReadFromWorldPacket(WorldPacket& recv_data)
{
    uint32 const remaining = recv_data.size() - recv_data.rpos();
    data.resize(remaining);
    if (!data.empty())
        recv_data.read(data.data(), data.size());
}
#endif

// --- Server Packets ---

void WorldPackets::Misc::LogoutComplete::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::LogoutCancelAck::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::StandStateUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << standState;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
void WorldPackets::Misc::PlayTimeWarning::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << flag;
    buffer << timeLeftInSeconds;
}
#endif

void WorldPackets::Misc::LogoutResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    buffer << instant;
}

void WorldPackets::Misc::PlayedTime::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << totalPlayedTime;
    buffer << levelPlayedTime;
}

void WorldPackets::Misc::InspectResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << guid;
}

void WorldPackets::Misc::WhoisResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << message;
}

void WorldPackets::Misc::UpdateAccountDataResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << type;
    buffer << decompressedLength;
    buffer.append(compressedData.data(), compressedData.size());
}

void WorldPackets::Misc::InspectHonorStatsResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
    buffer << highestRank;
    buffer << sessionKills;
    buffer << yesterdayHK;
    buffer << unknownOld1;
    buffer << lastWeekHK;
    buffer << unknownOld2;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    buffer << thisWeekHK;
    buffer << unknownOld3;
#endif
    buffer << lifetimeHK;
    buffer << lifetimeDHK;
    buffer << yesterdayHonor;
    buffer << lastWeekHonor;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    buffer << thisWeekHonor;
#endif
    buffer << lastWeekRank;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
    buffer << rankBar;
#endif
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
void WorldPackets::Misc::WeatherUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << weatherType;
    buffer << grade;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << soundId;
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    buffer << instantChange;
#endif
}
#endif

void WorldPackets::Misc::ServerMessage::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << messageType;
    buffer << text;
}

void WorldPackets::Misc::MeetingstoneJoinFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
}

void WorldPackets::Misc::MeetingstoneSetQueue::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << areaId;
    buffer << status;
}


