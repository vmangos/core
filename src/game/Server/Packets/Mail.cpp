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
