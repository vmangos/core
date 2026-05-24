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

void WorldPackets::Chat::ChatWrongFaction::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
void WorldPackets::Chat::ChatRestricted::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}
#endif

void WorldPackets::Chat::ChatPlayerNotFound::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << name;
}
