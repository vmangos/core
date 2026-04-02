#ifndef MANGOS_PACKETS_CHAT_H
#define MANGOS_PACKETS_CHAT_H

#include "Packet.h"
#include "SharedDefines.h"

namespace WorldPackets { namespace Chat
{
    class ChatMessage final : public ClientPacket
    {
    public:
        uint32 type;
        uint32 lang;
        std::string whisperTargetOrChannel;
        std::string message;

        explicit ChatMessage() : ClientPacket(CMSG_MESSAGECHAT), type(0), lang(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
}} // namespace WorldPackets::Chat

#endif // MANGOS_PACKETS_CHAT_H
