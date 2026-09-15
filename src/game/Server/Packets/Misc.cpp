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

size_t WorldPackets::Misc::LogoutComplete::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::LogoutComplete::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::LogoutCancelAck::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::LogoutCancelAck::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::StandStateUpdate::EstimateFinalSize() const
{
    return sizeof(standState);
}

void WorldPackets::Misc::StandStateUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << standState;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
size_t WorldPackets::Misc::PlayTimeWarning::EstimateFinalSize() const
{
    return sizeof(flag) +
           sizeof(timeLeftInSeconds);
}
void WorldPackets::Misc::PlayTimeWarning::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << flag;
    buffer << timeLeftInSeconds;
}
#endif

size_t WorldPackets::Misc::LogoutResponse::EstimateFinalSize() const
{
    return sizeof(reason) +
           sizeof(instant);
}

void WorldPackets::Misc::LogoutResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    buffer << instant;
}

size_t WorldPackets::Misc::PlayedTime::EstimateFinalSize() const
{
    return sizeof(totalPlayedTime) +
           sizeof(levelPlayedTime);
}

void WorldPackets::Misc::PlayedTime::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << totalPlayedTime;
    buffer << levelPlayedTime;
}

size_t WorldPackets::Misc::InspectResponse::EstimateFinalSize() const
{
    return sizeof(guid);
}

void WorldPackets::Misc::InspectResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << guid;
}

size_t WorldPackets::Misc::WhoisResponse::EstimateFinalSize() const
{
    return message.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Misc::WhoisResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << message;
}

size_t WorldPackets::Misc::UpdateAccountDataResponse::EstimateFinalSize() const
{
    return sizeof(type) +
           sizeof(decompressedLength) +
           compressedData.size();
}

void WorldPackets::Misc::UpdateAccountDataResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << type;
    buffer << decompressedLength;
    buffer.append(compressedData.data(), compressedData.size());
}

size_t WorldPackets::Misc::InspectHonorStatsResponse::EstimateFinalSize() const
{
    return sizeof(playerGuid) +
           sizeof(highestRank) +
           sizeof(sessionKills) +
           sizeof(yesterdayHK) +
           sizeof(unknownOld1) +
           sizeof(lastWeekHK) +
           sizeof(unknownOld2) +
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
           sizeof(thisWeekHK) +
           sizeof(unknownOld3) +
#endif
           sizeof(lifetimeHK) +
           sizeof(lifetimeDHK) +
           sizeof(yesterdayHonor) +
           sizeof(lastWeekHonor) +
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
           sizeof(thisWeekHonor) +
#endif
           sizeof(lastWeekRank) +
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_6_1
           sizeof(rankBar) +
#endif
           0;
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
size_t WorldPackets::Misc::WeatherUpdate::EstimateFinalSize() const
{
    return sizeof(weatherType) +
           sizeof(grade) +
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
           sizeof(soundId) +
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
           sizeof(instantChange) +
#endif
           0;
}
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

size_t WorldPackets::Misc::ServerMessage::EstimateFinalSize() const
{
    return sizeof(messageType) +
           text.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Misc::ServerMessage::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << messageType;
    buffer << text;
}

size_t WorldPackets::Misc::MeetingstoneJoinFailed::EstimateFinalSize() const
{
    return sizeof(reason);
}

void WorldPackets::Misc::MeetingstoneJoinFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
}

size_t WorldPackets::Misc::MeetingstoneSetQueue::EstimateFinalSize() const
{
    return
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
           sizeof(areaId) +
           sizeof(status);
#else
           sizeof(idempotencyToken) +
           sizeof(areaId);
#endif
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

size_t WorldPackets::Misc::MeetingstoneMemberAdded::EstimateFinalSize() const
{
    return sizeof(playerGuid);
}

void WorldPackets::Misc::MeetingstoneMemberAdded::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}

size_t WorldPackets::Misc::MeetingstoneInProgress::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::MeetingstoneInProgress::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::MeetingstoneComplete::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::MeetingstoneComplete::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::PvpCredit::EstimateFinalSize() const
{
    return sizeof(honor) +
           sizeof(victimGuid) +
           sizeof(victimRank);
}

void WorldPackets::Misc::PvpCredit::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << honor;
    buffer << victimGuid;
    buffer << victimRank;
}

size_t WorldPackets::Misc::SetForcedReactions::EstimateFinalSize() const
{
    return sizeof(uint32) /*size*/ +
           forcedReactions.size() * sizeof(ForcedReactionEntry);
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

size_t WorldPackets::Misc::SetFactionStanding::EstimateFinalSize() const
{
    return sizeof(uint32) /*size*/ +
           factionStandings.size() * sizeof(FactionStandingEntry);
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

size_t WorldPackets::Misc::InitializeFactions::EstimateFinalSize() const
{
    return sizeof(uint32) /*size*/ +
           factions.size() * (sizeof(FactionInitEntry::flags) + sizeof(FactionInitEntry::standing));
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

size_t WorldPackets::Misc::SetFactionVisible::EstimateFinalSize() const
{
    return sizeof(reputationListId);
}

void WorldPackets::Misc::SetFactionVisible::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reputationListId;
}

size_t WorldPackets::Misc::PlayMusic::EstimateFinalSize() const
{
    return sizeof(musicId);
}

void WorldPackets::Misc::PlayMusic::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << musicId;
}

size_t WorldPackets::Misc::PlaySound::EstimateFinalSize() const
{
    return sizeof(soundId);
}

void WorldPackets::Misc::PlaySound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << soundId;
}

size_t WorldPackets::Misc::Notification::EstimateFinalSize() const
{
    return message.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Misc::Notification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << message;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
size_t WorldPackets::Misc::InvalidatePlayer::EstimateFinalSize() const
{
    return sizeof(playerGuid);
}
void WorldPackets::Misc::InvalidatePlayer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
}
#endif

size_t WorldPackets::Misc::AiReaction::EstimateFinalSize() const
{
    return sizeof(unitGuid) +
           sizeof(reaction);
}

void WorldPackets::Misc::AiReaction::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << unitGuid;
    buffer << reaction;
}

size_t WorldPackets::Misc::ZoneUnderAttack::EstimateFinalSize() const
{
    return sizeof(areaId);
}

void WorldPackets::Misc::ZoneUnderAttack::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << areaId;
}

size_t WorldPackets::Misc::PlayObjectSound::EstimateFinalSize() const
{
    return sizeof(soundId) +
           sizeof(sourceGuid);
}

void WorldPackets::Misc::PlayObjectSound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << soundId;
    buffer << sourceGuid;
}

size_t WorldPackets::Misc::GameObjectSpawnAnim::EstimateFinalSize() const
{
    return sizeof(gameObjectGuid);
}

void WorldPackets::Misc::GameObjectSpawnAnim::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << gameObjectGuid;
}

size_t WorldPackets::Misc::GameObjectDespawnAnim::EstimateFinalSize() const
{
    return sizeof(gameObjectGuid);
}

void WorldPackets::Misc::GameObjectDespawnAnim::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << gameObjectGuid;
}

size_t WorldPackets::Misc::StartMirrorTimer::EstimateFinalSize() const
{
    return sizeof(timerType) +
           sizeof(remaining) +
           sizeof(duration) +
           sizeof(scale) +
           sizeof(paused) +
           sizeof(spellId);
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

size_t WorldPackets::Misc::StopMirrorTimer::EstimateFinalSize() const
{
    return sizeof(timerType);
}

void WorldPackets::Misc::StopMirrorTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timerType;
}

size_t WorldPackets::Misc::PauseMirrorTimer::EstimateFinalSize() const
{
    return sizeof(timerType) +
           sizeof(paused);
}

void WorldPackets::Misc::PauseMirrorTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timerType;
    buffer << paused;
}

size_t WorldPackets::Misc::TransferPending::EstimateFinalSize() const
{
    size_t result = sizeof(mapId);
    if (transportInfo)
    {
        result += sizeof(TransferPendingTransportInfo::transportEntry) +
                  sizeof(TransferPendingTransportInfo::oldMapId);
    }
    return result;
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

size_t WorldPackets::Misc::NewWorld::EstimateFinalSize() const
{
    return sizeof(WorldLocation);
}

void WorldPackets::Misc::NewWorld::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << location.mapId;
    buffer << location.x;
    buffer << location.y;
    buffer << location.z;
    buffer << location.o;
}

size_t WorldPackets::Misc::LogXpGain::EstimateFinalSize() const
{
    size_t result = sizeof(victimGuid) +
                    sizeof(totalXp) +
                    sizeof(xpType);
    if (xpType == 0)
    {
        result += sizeof(baseXp) +
                  sizeof(groupBonus);
    }
    return result;
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

size_t WorldPackets::Misc::LevelUpInfo::EstimateFinalSize() const
{
    return sizeof(level) +
           sizeof(healthGain) +
           sizeof(powerGains) +
           sizeof(statGains);
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

size_t WorldPackets::Misc::TriggerCinematic::EstimateFinalSize() const
{
    return sizeof(cinematicSequenceId);
}

void WorldPackets::Misc::TriggerCinematic::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << cinematicSequenceId;
}

size_t WorldPackets::Misc::PlayerSkinned::EstimateFinalSize() const
{
    return sizeof(freeRepop);
}

void WorldPackets::Misc::PlayerSkinned::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << freeRepop;
}

size_t WorldPackets::Misc::DurabilityDamageDeath::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::DurabilityDamageDeath::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::CancelAutoRepeat::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Misc::CancelAutoRepeat::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

size_t WorldPackets::Misc::ExplorationExperience::EstimateFinalSize() const
{
    return sizeof(areaId) +
           sizeof(experience);
}

void WorldPackets::Misc::ExplorationExperience::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << areaId;
    buffer << experience;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
size_t WorldPackets::Misc::FactionAtWarChange::EstimateFinalSize() const
{
    return sizeof(reputationId) +
           sizeof(flags);
}
void WorldPackets::Misc::FactionAtWarChange::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reputationId;
    buffer << flags;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
size_t WorldPackets::Misc::InstanceReset::EstimateFinalSize() const
{
    return sizeof(mapId);
}
void WorldPackets::Misc::InstanceReset::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}

size_t WorldPackets::Misc::InstanceResetFailed::EstimateFinalSize() const
{
    return sizeof(reason) +
           sizeof(mapId);
}
void WorldPackets::Misc::InstanceResetFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    buffer << mapId;
}
#endif

size_t WorldPackets::Misc::MountResult::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Misc::MountResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

size_t WorldPackets::Misc::DismountResult::EstimateFinalSize() const
{
    return sizeof(result);
}

void WorldPackets::Misc::DismountResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

size_t WorldPackets::Misc::RaidGroupOnly::EstimateFinalSize() const
{
    return sizeof(timer) +
           sizeof(errorCode);
}

void WorldPackets::Misc::RaidGroupOnly::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << timer;
    buffer << errorCode;
}

size_t WorldPackets::Misc::SetRestStart::EstimateFinalSize() const
{
    return sizeof(restStateTime);
}

void WorldPackets::Misc::SetRestStart::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << restStateTime;
}

size_t WorldPackets::Misc::BindpointUpdate::EstimateFinalSize() const
{
    return sizeof(WorldLocation::x) +
           sizeof(WorldLocation::y) +
           sizeof(WorldLocation::z) +
           sizeof(WorldLocation::mapId) +
           sizeof(areaId);
}

void WorldPackets::Misc::BindpointUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << location.x;
    buffer << location.y;
    buffer << location.z;
    buffer << location.mapId;
    buffer << areaId;
}

size_t WorldPackets::Misc::PlayerBound::EstimateFinalSize() const
{
    return sizeof(binderGuid) +
           sizeof(areaId);
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

size_t WorldPackets::Misc::LoginSetTimeSpeed::EstimateFinalSize() const
{
    return sizeof(decltype(secsToTimeBitFields(0))) +
           sizeof(gameSpeedMinutesPerSecond);
}

void WorldPackets::Misc::LoginSetTimeSpeed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << secsToTimeBitFields(gameTime);
    buffer << gameSpeedMinutesPerSecond;
}

size_t WorldPackets::Misc::TransferAborted::EstimateFinalSize() const
{
    return sizeof(reason);
}

void WorldPackets::Misc::TransferAborted::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
size_t WorldPackets::Misc::RaidInstanceMessage::EstimateFinalSize() const
{
    return sizeof(messageType) +
           sizeof(mapId) +
           sizeof(resetTime);
}
void WorldPackets::Misc::RaidInstanceMessage::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << messageType;
    buffer << mapId;
    buffer << resetTime;
}
#endif

size_t WorldPackets::Misc::SummonRequest::EstimateFinalSize() const
{
    return sizeof(summonerGuid) +
           sizeof(zoneId) +
           sizeof(autoDeclineDelay);
}

void WorldPackets::Misc::SummonRequest::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << summonerGuid;
    buffer << zoneId;
    buffer << autoDeclineDelay;
}

size_t WorldPackets::Misc::CorpseReclaimDelay::EstimateFinalSize() const
{
    return sizeof(delayMs);
}

void WorldPackets::Misc::CorpseReclaimDelay::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << delayMs;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
size_t WorldPackets::Misc::UpdateInstanceOwnership::EstimateFinalSize() const
{
    return sizeof(hasBeenSaved);
}
void WorldPackets::Misc::UpdateInstanceOwnership::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << hasBeenSaved;
}

size_t WorldPackets::Misc::UpdateLastInstance::EstimateFinalSize() const
{
    return sizeof(mapId);
}
void WorldPackets::Misc::UpdateLastInstance::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}
#endif

size_t WorldPackets::Misc::EmoteNotify::EstimateFinalSize() const
{
    return sizeof(emoteId) +
           sizeof(unitGuid);
}

void WorldPackets::Misc::EmoteNotify::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << emoteId;
    buffer << unitGuid;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
size_t WorldPackets::Misc::ClientControlUpdate::EstimateFinalSize() const
{
    return sizeof(uint8) + sizeof(uint64) + /*moverGuid, packed*/
           sizeof(allowMove);
}
void WorldPackets::Misc::ClientControlUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    // This packet uses the packed guid format; the old sender serialized target->GetPackGUID() directly.
    buffer << moverGuid.WriteAsPacked();
    buffer << allowMove;
}
#endif

size_t WorldPackets::Misc::UpdateWorldState::EstimateFinalSize() const
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    return sizeof(field) +
           sizeof(value);
#else
    return sizeof(uint16) + /*field*/
           sizeof(uint16); /*value*/
#endif
}

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
