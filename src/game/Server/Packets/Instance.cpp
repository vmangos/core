#include "Instance.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
size_t WorldPackets::Instance::InstanceReset::EstimateFinalSize() const
{
    return sizeof(mapId);
}
void WorldPackets::Instance::InstanceReset::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}

size_t WorldPackets::Instance::InstanceResetFailed::EstimateFinalSize() const
{
    return sizeof(reason) +
           sizeof(mapId);
}
void WorldPackets::Instance::InstanceResetFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << reason;
    buffer << mapId;
}

size_t WorldPackets::Instance::UpdateInstanceOwnership::EstimateFinalSize() const
{
    return sizeof(hasBeenSaved);
}
void WorldPackets::Instance::UpdateInstanceOwnership::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << hasBeenSaved;
}

size_t WorldPackets::Instance::UpdateLastInstance::EstimateFinalSize() const
{
    return sizeof(mapId);
}
void WorldPackets::Instance::UpdateLastInstance::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mapId;
}
#endif

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
size_t WorldPackets::Instance::RaidInstanceMessage::EstimateFinalSize() const
{
    return sizeof(messageType) +
           sizeof(mapId) +
           sizeof(resetTime);
}
void WorldPackets::Instance::RaidInstanceMessage::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << messageType;
    buffer << mapId;
    buffer << resetTime;
}
#endif
