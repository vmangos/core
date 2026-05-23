#include "Misc.h"

#include "SpellEntry.h"

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
// NOTE: WardenData (CMSG) / WardenDataServer (SMSG) serialization lives in `Packets/Warden.cpp`.
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
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    buffer << areaId;
    buffer << status;
#else
    buffer << idempotencyToken;
    buffer << areaId;
#endif
}

void WorldPackets::Misc::MeetingstoneMemberAdded::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

void WorldPackets::Misc::MeetingstoneInProgress::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::MeetingstoneComplete::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::PvpCredit::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << honor;
    buffer << victimGuid;
    buffer << victimRank;
}

void WorldPackets::Misc::SetForcedReactions::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint32>(forcedReactions.size());
    for (const auto& reaction : forcedReactions)
    {
        buffer << reaction.factionId;       // faction_id (Faction.dbc)
        buffer << reaction.reputationRank;  // reputation rank
    }
}

void WorldPackets::Misc::SetFactionStanding::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint32>(factionStandings.size());
    for (const auto& entry : factionStandings)
    {
        buffer << entry.reputationListId;
        buffer << entry.standing;
    }
}

void WorldPackets::Misc::InitializeFactions::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << static_cast<uint32>(factions.size());
    for (const auto& faction : factions)
    {
        buffer << faction.flags;
        buffer << faction.standing;
    }
}

void WorldPackets::Misc::SetFactionVisible::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reputationListId;
}

void WorldPackets::Misc::PlayMusic::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << musicId;
}

void WorldPackets::Misc::PlaySound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << soundId;
}

void WorldPackets::Misc::Notification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << message;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Misc::InvalidatePlayer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}
#endif

void WorldPackets::Misc::DestroyObject::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << objectGuid;
}

void WorldPackets::Misc::AiReaction::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << unitGuid;
    buffer << reaction;
}

void WorldPackets::Misc::ZoneUnderAttack::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << areaId;
}

void WorldPackets::Misc::PlayObjectSound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << soundId;
    buffer << sourceGuid;
}

void WorldPackets::Misc::GameObjectSpawnAnim::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << gameObjectGuid;
}

void WorldPackets::Misc::GameObjectDespawnAnim::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << gameObjectGuid;
}

void WorldPackets::Misc::StartMirrorTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timerType;
    buffer << remaining;
    buffer << duration;
    buffer << scale;
    buffer << paused;
    buffer << spellId;
}

void WorldPackets::Misc::StopMirrorTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timerType;
}

void WorldPackets::Misc::PauseMirrorTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timerType;
    buffer << paused;
}

void WorldPackets::Misc::TransferPending::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
    if (transportInfo)
    {
        buffer << transportInfo->transportEntry;
        buffer << transportInfo->oldMapId;
    }
}

void WorldPackets::Misc::NewWorld::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << location.mapId;
    buffer << location.x;
    buffer << location.y;
    buffer << location.z;
    buffer << location.o;
}

void WorldPackets::Misc::LogXpGain::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << victimGuid;
    buffer << totalXp;
    buffer << xpType;
    if (xpType == 0) // kill xp
    {
        buffer << baseXp;
        buffer << groupBonus;
    }
}

void WorldPackets::Misc::LevelUpInfo::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << level;
    buffer << healthGain;
    for (uint32 i = 0; i < 5; ++i)
        buffer << powerGains[i];
    for (uint32 i = 0; i < 5; ++i)
        buffer << statGains[i];
}

void WorldPackets::Misc::TriggerCinematic::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << cinematicSequenceId;
}

void WorldPackets::Misc::PlayerSkinned::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << freeRepop;
}

void WorldPackets::Misc::DurabilityDamageDeath::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::CancelAutoRepeat::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Misc::ExplorationExperience::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << areaId;
    buffer << experience;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Misc::FactionAtWarChange::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reputationId;
    buffer << flags;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldPackets::Misc::InstanceReset::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}

void WorldPackets::Misc::InstanceResetFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    buffer << mapId;
}
#endif

void WorldPackets::Misc::MountResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Misc::DismountResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Misc::RaidGroupOnly::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timer;
    buffer << errorCode;
}

void WorldPackets::Misc::SetRestStart::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << restStateTime;
}

void WorldPackets::Misc::BindpointUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << location.x;
    buffer << location.y;
    buffer << location.z;
    buffer << location.mapId;
    buffer << areaId;
}

void WorldPackets::Misc::PlayerBound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << binderGuid;
    buffer << areaId;
}

static uint32 secsToTimeBitFields(time_t secs)
{
    tm localTime;
#if PLATFORM == PLATFORM_WINDOWS
    localtime_s(&localTime, &secs);
#else
    localtime_r(&secs, &localTime);
#endif
    return (localTime.tm_year - 100) << 24 | localTime.tm_mon  << 20 | (localTime.tm_mday - 1) << 14 | localTime.tm_wday << 11 | localTime.tm_hour << 6 | localTime.tm_min;
}

void WorldPackets::Misc::LoginSetTimeSpeed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << secsToTimeBitFields(gameTime);
    buffer << gameSpeedMinutesPerSecond;
}

void WorldPackets::Misc::TransferAborted::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
void WorldPackets::Misc::RaidInstanceMessage::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << messageType;
    buffer << mapId;
    buffer << resetTime;
}
#endif

void WorldPackets::Misc::SummonRequest::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << summonerGuid;
    buffer << zoneId;
    buffer << autoDeclineDelay;
}

void WorldPackets::Misc::CorpseReclaimDelay::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << delayMs;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldPackets::Misc::UpdateInstanceOwnership::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << hasBeenSaved;
}

void WorldPackets::Misc::UpdateLastInstance::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}
#endif

void WorldPackets::Misc::EmoteNotify::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << emoteId;
    buffer << unitGuid;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
void WorldPackets::Misc::ClientControlUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    // This packet uses the packed guid format; the old sender serialized target->GetPackGUID() directly.
    buffer << moverGuid.WriteAsPacked();
    buffer << allowMove;
}
#endif

void WorldPackets::Misc::UpdateWorldState::AppendBodyTo(ByteBuffer& buffer) const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    buffer << field;
    buffer << value;
#else
    buffer << static_cast<uint16>(field);
    buffer << static_cast<uint16>(value);
#endif
}
