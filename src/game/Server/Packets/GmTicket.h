#ifndef MANGOS_PACKETS_GMTICKET_H
#define MANGOS_PACKETS_GMTICKET_H

#include "Packet.h"
#include "SharedDefines.h"
#include <string>
#include <vector>

namespace WorldPackets { namespace GmTicket
{
    class GmTicketCreate final : public ClientPacket
    {
    public:
        TicketType ticketType;
        uint32 mapId;
        float x, y, z;
        std::string ticketText;
        std::string reservedForFutureUse;

        explicit GmTicketCreate() : ClientPacket(CMSG_GMTICKET_CREATE), ticketType(), mapId(0), x(0), y(0), z(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class GmTicketUpdateText final : public ClientPacket
    {
    public:
        uint8 type = 0;
        std::string ticketText;

        explicit GmTicketUpdateText() : ClientPacket(CMSG_GMTICKET_UPDATETEXT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    class GMSurveySubmit final : public ClientPacket
    {
    public:
        struct SubSurvey
        {
            uint32      subSurveyId = 0;
            uint8       rank = 0;
            std::string comment;
        };

        uint32                 mainSurvey = 0;
        std::vector<SubSurvey> subSurveys;
        std::string            comment;

        explicit GMSurveySubmit() : ClientPacket(CMSG_GMSURVEY_SUBMIT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    // --- Server Packets ---

    class GmTicketUpdateTextResponse final : public ServerPacket
    {
    public:
        uint32 response = 0;

        explicit GmTicketUpdateTextResponse() : ServerPacket(SMSG_GMTICKET_UPDATETEXT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GmTicketDeleteTicketResponse final : public ServerPacket
    {
    public:
        uint32 response = 0;

        explicit GmTicketDeleteTicketResponse() : ServerPacket(SMSG_GMTICKET_DELETETICKET) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GmTicketCreateResponse final : public ServerPacket
    {
    public:
        uint32 response = 0;

        explicit GmTicketCreateResponse() : ServerPacket(SMSG_GMTICKET_CREATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GmTicketSystemStatus final : public ServerPacket
    {
    public:
        uint32 status = 0;

        explicit GmTicketSystemStatus() : ServerPacket(SMSG_GMTICKET_SYSTEMSTATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class GmTicketGetTicket final : public ServerPacket
    {
    public:
        uint32 status = 0;         // GMTICKET_STATUS_HASTEXT (0x06) or GMTICKET_STATUS_DEFAULT (0x0A)

        // following fields are only serialized when status == GMTICKET_STATUS_HASTEXT (0x06)
        std::string message;
        uint8 ticketType = 0;
        float lastModifiedAge = 0.0f;
        float oldestTicketAge = 0.0f;
        float estimatedWaitTime = 0.0f; // Estimated wait time ?
        uint8 escalationStatus = 0;     // escalated data
        uint8 openedByGMStatus = 0;     // whether or not it has been viewed

        explicit GmTicketGetTicket() : ServerPacket(SMSG_GMTICKET_GETTICKET) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::GmTicket

#endif // MANGOS_PACKETS_GMTICKET_H
