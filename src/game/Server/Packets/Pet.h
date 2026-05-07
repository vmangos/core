#ifndef MANGOS_PACKETS_PET_H
#define MANGOS_PACKETS_PET_H

#include "Packet.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "SpellCastTargetsInfo.h"
#include <string>

namespace WorldPackets { namespace Pet
{
    class QueryPetName final : public ClientPacket
    {
    public:
        uint32 petNumber;
        ObjectGuid petGuid;

        explicit QueryPetName() : ClientPacket(CMSG_PET_NAME_QUERY), petNumber(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetAction final : public ClientPacket
    {
    public:
        ObjectGuid petGuid;
        uint32 data;
        ObjectGuid targetGuid;

        explicit PetAction() : ClientPacket(CMSG_PET_ACTION), data(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetAbandon final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit PetAbandon() : ClientPacket(CMSG_PET_ABANDON) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetRename final : public ClientPacket
    {
    public:
        ObjectGuid petGuid;
        std::string name;

        explicit PetRename() : ClientPacket(CMSG_PET_RENAME) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    class PetStopAttack final : public ClientPacket
    {
    public:
        ObjectGuid petGuid;

        explicit PetStopAttack() : ClientPacket(CMSG_PET_STOP_ATTACK) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PetUnlearn final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit PetUnlearn() : ClientPacket(CMSG_PET_UNLEARN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class PetCancelAura final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 spellId = 0;

        explicit PetCancelAura() : ClientPacket(CMSG_PET_CANCEL_AURA) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    class PetSpellAutocast final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 spellId = 0;
        uint8 state = 0;

        explicit PetSpellAutocast() : ClientPacket(CMSG_PET_SPELL_AUTOCAST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    class PetSetAction final : public ClientPacket
    {
    public:
        struct ActionEntry
        {
            uint32 position = 0;
            uint32 data = 0;
        };

        ObjectGuid  petGuid;
        uint8       count = 0;
        ActionEntry actions[2];

        explicit PetSetAction() : ClientPacket(CMSG_PET_SET_ACTION) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    class PetCastSpell final : public ClientPacket
    {
    public:
        ObjectGuid           petGuid;
        uint32               spellId = 0;
        SpellCastTargets     targets;

        explicit PetCastSpell() : ClientPacket(CMSG_PET_CAST_SPELL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
#endif

    // --- Server Packets ---

    class PetNameInvalid final : public ServerPacket
    {
    public:
        explicit PetNameInvalid() : ServerPacket(SMSG_PET_NAME_INVALID) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PetNameQueryResponse final : public ServerPacket
    {
    public:
        uint32 petNumber = 0;
        std::string name;
        uint32 nameTimestamp = 0;

        explicit PetNameQueryResponse() : ServerPacket(SMSG_PET_NAME_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Pet

#endif // MANGOS_PACKETS_PET_H
