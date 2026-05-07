#ifndef MANGOS_PACKETS_SKILL_H
#define MANGOS_PACKETS_SKILL_H

#include "Packet.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Skill
{
    class LearnTalent final : public ClientPacket
    {
    public:
        uint32 talent_id;
        uint32 requested_rank;


        explicit LearnTalent() : ClientPacket(CMSG_LEARN_TALENT), talent_id(0), requested_rank(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class UnlearnSkill final : public ClientPacket
    {
    public:
        uint32 skillId = 0;

        explicit UnlearnSkill() : ClientPacket(CMSG_UNLEARN_SKILL) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class TalentWipeConfirm final : public ClientPacket
    {
    public:
        ObjectGuid trainerGuid;

        explicit TalentWipeConfirm() : ClientPacket(MSG_TALENT_WIPE_CONFIRM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class TalentWipeConfirmResponse final : public ServerPacket
    {
    public:
        ObjectGuid trainerGuid = 0; // guid of talent master (0 if player has no talents to reset)
        uint32 cost = 0; // cost in copper to reset talents

        explicit TalentWipeConfirmResponse() : ServerPacket(MSG_TALENT_WIPE_CONFIRM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
}} // namespace WorldPackets::Skill

#endif // MANGOS_PACKETS_SKILL_H
