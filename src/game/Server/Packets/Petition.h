#ifndef MANGOS_PACKETS_PETITION_H
#define MANGOS_PACKETS_PETITION_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>

namespace WorldPackets { namespace Petition
{
    class PetitionShow final : public ClientPacket
    {
    public:
        ObjectGuid petitionerNpcGuid;

        explicit PetitionShow() : ClientPacket(CMSG_PETITION_SHOWLIST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetitionShowSignatures final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;

        explicit PetitionShowSignatures() : ClientPacket(CMSG_PETITION_SHOW_SIGNATURES) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QueryPetition final : public ClientPacket
    {
    public:
        uint32 petitionGuid = 0;
        ObjectGuid itemGuid;

        explicit QueryPetition() : ClientPacket(CMSG_PETITION_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetitionDecline final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;

        explicit PetitionDecline() : ClientPacket(MSG_PETITION_DECLINE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TurnInPetition final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;

        explicit TurnInPetition() : ClientPacket(CMSG_TURN_IN_PETITION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetitionRename final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;
        std::string newName;

        explicit PetitionRename() : ClientPacket(MSG_PETITION_RENAME) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetitionSign final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;

        explicit PetitionSign() : ClientPacket(CMSG_PETITION_SIGN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class OfferPetition final : public ClientPacket
    {
    public:
        ObjectGuid itemGuid;
        ObjectGuid playerGuid;

        explicit OfferPetition() : ClientPacket(CMSG_OFFER_PETITION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetitionBuy final : public ClientPacket
    {
    public:
        ObjectGuid  guidNPC;
        std::string name;

        explicit PetitionBuy() : ClientPacket(CMSG_PETITION_BUY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
}} // namespace WorldPackets::Petition

#endif // MANGOS_PACKETS_PETITION_H
