#ifndef MANGOS_PACKETS_CHARACTER_H
#define MANGOS_PACKETS_CHARACTER_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"

#include <string>
#include <vector>

namespace WorldPackets { namespace Character
{
    static constexpr uint8 CHAR_ENUM_EQUIPMENT_SLOTS = 20; // INVENTORY_SLOT_BAG_START + 1

    struct CharEnumEquipmentSlot
    {
        uint32 displayInfoId = 0;
        uint8  inventoryType = 0;
    };

    struct CharEnumData
    {
        ObjectGuid guid;
        std::string name;
        uint8  race = 0;
        uint8  class_ = 0;
        uint8  gender = 0;
        uint8  skin = 0;
        uint8  face = 0;
        uint8  hairStyle = 0;
        uint8  hairColor = 0;
        uint8  facialHair = 0;
        uint8  level = 0;
        uint32 zone = 0;
        uint32 map = 0;
        float  x = 0.f;
        float  y = 0.f;
        float  z = 0.f;
        uint32 guildId = 0;
        uint32 charFlags = 0;
        uint8  firstLogin = 0;
        uint32 petDisplayId = 0;
        uint32 petLevel = 0;
        uint32 petFamily = 0;
        CharEnumEquipmentSlot equipment[CHAR_ENUM_EQUIPMENT_SLOTS] = {};
    };

    class CharCreate final : public ClientPacket
    {
    public:
        std::string name;
        uint8 race, class_;
        uint8 gender, skin, face, hairStyle, hairColor, facialHair, outfitId;

        explicit CharCreate() : ClientPacket(CMSG_CHAR_CREATE),
        race(0), class_(0), gender(0), skin(0), face(0), hairStyle(0), hairColor(0), facialHair(0), outfitId(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class CharDelete final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit CharDelete() : ClientPacket(CMSG_CHAR_DELETE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PlayerLogin final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit PlayerLogin() : ClientPacket(CMSG_PLAYER_LOGIN) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class CharRename final : public ClientPacket
    {
    public:
        ObjectGuid  guid;
        std::string newname;

        explicit CharRename() : ClientPacket(CMSG_CHAR_RENAME) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class CharCreateResponse final : public ServerPacket
    {
    public:
        uint8 result = 0;

        explicit CharCreateResponse() : ServerPacket(SMSG_CHAR_CREATE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CharDeleteResponse final : public ServerPacket
    {
    public:
        uint8 result = 0;

        explicit CharDeleteResponse() : ServerPacket(SMSG_CHAR_DELETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class CharacterLoginFailed final : public ServerPacket
    {
    public:
        uint8 result = 0;

        explicit CharacterLoginFailed() : ServerPacket(SMSG_CHARACTER_LOGIN_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class LoginVerifyWorld final : public ServerPacket
    {
    public:
        WorldLocation location;

        explicit LoginVerifyWorld() : ServerPacket(SMSG_LOGIN_VERIFY_WORLD) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Character

#endif // MANGOS_PACKETS_CHARACTER_H
