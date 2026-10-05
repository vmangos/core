#include "Chat.h"

void WorldPackets::Chat::ChatMessage::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> type;
    recv_data >> lang;

    if (type == CHAT_MSG_CHANNEL || type == CHAT_MSG_WHISPER)
        recv_data >> whisperTargetOrChannel;

    recv_data >> message;
}

// --- Server Packets ---

size_t WorldPackets::Chat::ChatWrongFaction::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Chat::ChatWrongFaction::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
size_t WorldPackets::Chat::ChatRestricted::EstimateFinalSize() const
{
    return 0;
}

void WorldPackets::Chat::ChatRestricted::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}
#endif

size_t WorldPackets::Chat::ChatPlayerNotFound::EstimateFinalSize() const
{
    return name.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Chat::ChatPlayerNotFound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << name;
}
