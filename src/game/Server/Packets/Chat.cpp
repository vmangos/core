#include "Chat.h"

void WorldPackets::Chat::ChatMessage::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> type;
    recv_data >> lang;

    if (type == CHAT_MSG_CHANNEL || type == CHAT_MSG_WHISPER)
        recv_data >> whisperTargetOrChannel;

    recv_data >> message;
}
