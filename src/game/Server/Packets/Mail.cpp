#include "Mail.h"

void WorldPackets::Mail::SendMail::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> receiverName;
    recv_data >> subject;
    recv_data >> body;
    recv_data >> stationeryId;
    recv_data >> packageId;
    recv_data >> itemGuid;
    recv_data >> money;
    recv_data >> COD;

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data.read_skip<uint64>(); // const 0
    recv_data.read_skip<uint8>(); // const 0
#endif

}


void WorldPackets::Mail::MailReturnToSender::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
}

void WorldPackets::Mail::MailMarkAsRead::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
}

void WorldPackets::Mail::MailTakeItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
}

void WorldPackets::Mail::MailTakeMoney::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
}

void WorldPackets::Mail::GetMailList::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
}

void WorldPackets::Mail::MailDelete::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
}

void WorldPackets::Mail::MailCreateTextItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mailboxGuid;
    recv_data >> mailId;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> mailTemplateId;
#endif
}

// --- Server Packets ---

size_t WorldPackets::Mail::ReceivedMail::EstimateFinalSize() const
{
    return sizeof(notifyDelay);
}

void WorldPackets::Mail::ReceivedMail::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << notifyDelay;
}

size_t WorldPackets::Mail::ItemTextQueryResponse::EstimateFinalSize() const
{
    return sizeof(itemTextId) +
           text.size() + sizeof(char) /*null terminator*/;
}

void WorldPackets::Mail::ItemTextQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemTextId;
    buffer << text;
}

size_t WorldPackets::Mail::QueryNextMailTimeResponse::EstimateFinalSize() const
{
    return sizeof(nextMailTime);
}

void WorldPackets::Mail::QueryNextMailTimeResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << nextMailTime;
}

size_t WorldPackets::Mail::SendMailResult::EstimateFinalSize() const
{
    size_t size = sizeof(mailId) +
                  sizeof(mailAction) +
                  sizeof(mailError);

    if (mailError == MAIL_ERR_EQUIP_ERROR)
        size += sizeof(equipError);
    else if (mailAction == MAIL_ITEM_TAKEN)
        size += sizeof(itemGuidLow) +
                sizeof(itemCount);

    return size;
}

void WorldPackets::Mail::SendMailResult::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << mailId;
    buffer << mailAction;
    buffer << mailError;
    if (mailError == MAIL_ERR_EQUIP_ERROR)
    {
        buffer << equipError;
    }
    else if (mailAction == MAIL_ITEM_TAKEN)
    {
        buffer << itemGuidLow;
        buffer << itemCount;
    }
}
