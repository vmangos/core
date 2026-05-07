#ifndef MANGOS_PACKETS_MAIL_H
#define MANGOS_PACKETS_MAIL_H

#include "Packet.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include <string>
#include <vector>

namespace WorldPackets { namespace Mail
{
    class SendMail final : public ClientPacket
    {
    public:
        ObjectGuid  mailboxGuid;
        std::string receiverName;
        std::string subject;
        std::string body;
        uint32      stationeryId;
        uint32      packageId;
        ObjectGuid  itemGuid;
        uint32      money;
        uint32      COD; // Cash On Delivery

        explicit SendMail() : ClientPacket(CMSG_SEND_MAIL), stationeryId(0), packageId(0), money(0), COD(0) {}

        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailReturnToSender final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32 mailId = 0;

        explicit MailReturnToSender() : ClientPacket(CMSG_MAIL_RETURN_TO_SENDER) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailMarkAsRead final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32 mailId = 0;

        explicit MailMarkAsRead() : ClientPacket(CMSG_MAIL_MARK_AS_READ) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailTakeItem final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32 mailId = 0;

        explicit MailTakeItem() : ClientPacket(CMSG_MAIL_TAKE_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailTakeMoney final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32 mailId = 0;

        explicit MailTakeMoney() : ClientPacket(CMSG_MAIL_TAKE_MONEY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GetMailList final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;

        explicit GetMailList() : ClientPacket(CMSG_GET_MAIL_LIST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailDelete final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32 mailId = 0;

        explicit MailDelete() : ClientPacket(CMSG_MAIL_DELETE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class MailCreateTextItem final : public ClientPacket
    {
    public:
        ObjectGuid mailboxGuid;
        uint32     mailId = 0;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
        uint32     mailTemplateId = 0;
#endif

        explicit MailCreateTextItem() : ClientPacket(CMSG_MAIL_CREATE_TEXT_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class ReceivedMail final : public ServerPacket
    {
    public:
        uint32 notifyDelay = 0;

        explicit ReceivedMail() : ServerPacket(SMSG_RECEIVED_MAIL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class ItemTextQueryResponse final : public ServerPacket
    {
    public:
        uint32 itemTextId = 0;
        std::string text;

        explicit ItemTextQueryResponse() : ServerPacket(SMSG_ITEM_TEXT_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QueryNextMailTimeResponse final : public ServerPacket
    {
    public:
        float nextMailTime = 0.0f;

        explicit QueryNextMailTimeResponse() : ServerPacket(MSG_QUERY_NEXT_MAIL_TIME) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Mail

#endif // MANGOS_PACKETS_MAIL_H
