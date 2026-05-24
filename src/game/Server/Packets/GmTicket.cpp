#include "GmTicket.h"

#include "GMTicketMgr.h"

void WorldPackets::GmTicket::GmTicketCreate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    uint8 type;
    recv_data >> type;
    ticketType = static_cast<TicketType>(type);

    recv_data >> mapId;
    recv_data >> x;
    recv_data >> y;
    recv_data >> z;
    recv_data >> ticketText;
    recv_data >> reservedForFutureUse;
}

void WorldPackets::GmTicket::GmTicketUpdateText::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> type;
    recv_data >> ticketText;
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
void WorldPackets::GmTicket::GMSurveySubmit::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> mainSurvey;

    for (uint8 i = 0; i < 10; i++)
    {
        SubSurvey sub;
        recv_data >> sub.subSurveyId;
        if (!sub.subSurveyId)
            break;

        recv_data >> sub.rank;
        recv_data >> sub.comment;
        subSurveys.push_back(std::move(sub));
    }

    recv_data >> comment;
}
#endif

void WorldPackets::GmTicket::GmTicketUpdateTextResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << response;
}

void WorldPackets::GmTicket::GmTicketDeleteTicketResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << response;
}

void WorldPackets::GmTicket::GmTicketCreateResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << response;
}

void WorldPackets::GmTicket::GmTicketSystemStatus::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << status;
}

void WorldPackets::GmTicket::GmTicketGetTicket::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << status;
    if (status == GMTICKET_STATUS_HASTEXT)
    {
        buffer << message;
        buffer << ticketType;
        buffer << lastModifiedAge;
        buffer << oldestTicketAge;
        buffer << estimatedWaitTime;
        buffer << escalationStatus;
        buffer << openedByGMStatus;
    }
}


