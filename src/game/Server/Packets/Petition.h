#ifndef MANGOS_PACKETS_PETITION_H
#define MANGOS_PACKETS_PETITION_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>
#include <vector>

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
    // --- Server Packets ---

    class PetitionSignResults final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;
        ObjectGuid playerGuid;
        uint32 result = 0;

        explicit PetitionSignResults() : ServerPacket(SMSG_PETITION_SIGN_RESULTS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class TurnInPetitionResults final : public ServerPacket
    {
    public:
        uint32 result = 0;

        explicit TurnInPetitionResults() : ServerPacket(SMSG_TURN_IN_PETITION_RESULTS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PetitionQueryResponse final : public ServerPacket
    {
    public:
        uint32 petitionGuid = 0;
        ObjectGuid ownerGuid;
        std::string name;
        std::string bodyText;
        uint32 flags = 0;

        // All those fields below don't really change anything in the UI
        uint32 minSignatures = 0;
        uint32 maxSignatures = 0;
        uint32 deadlineTimestamp = 0;
        uint32 creationTimestamp = 0;
        uint32 allowedGuildID = 0;
        uint32 allowedClasses = 0;
        uint32 allowedRaces = 0;
        uint16 allowedGender = 0;
        uint32 allowedMinLevel = 0;
        uint32 allowedMaxLevel = 0;
        std::vector<std::string> choices;
        uint32 defaultChoice = 0;

        explicit PetitionQueryResponse() : ServerPacket(SMSG_PETITION_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PetitionRenameResult final : public ServerPacket
    {
    public:
        ObjectGuid itemGuid;
        std::string newName;

        explicit PetitionRenameResult() : ServerPacket(MSG_PETITION_RENAME) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PetitionDeclineResult final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid;

        explicit PetitionDeclineResult() : ServerPacket(MSG_PETITION_DECLINE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct PetitionShowListEntry
    {
        uint32 index = 0;
        uint32 charterEntry = 0;
        uint32 charterDisplayId = 0;
        int32 charterCost = 0;
        int32 entryFlags = 0; // must be `&1` to show it in the UI
    };

    class PetitionShowList final : public ServerPacket
    {
    public:
        ObjectGuid npcGuid;
        std::vector<PetitionShowListEntry> entries; // only 1 element is supported in the client

        explicit PetitionShowList() : ServerPacket(SMSG_PETITION_SHOWLIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Petition

#endif // MANGOS_PACKETS_PETITION_H
