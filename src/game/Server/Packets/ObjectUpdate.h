#ifndef MANGOS_PACKETS_UPDATE_OBJECT_H
#define MANGOS_PACKETS_UPDATE_OBJECT_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "nonstd/optional.hpp"

namespace WorldPackets { namespace ObjectUpdate
{
    class DestroyObject final : public ServerPacket
    {
    public:
        ObjectGuid objectGuid; // guid of the object to destroy

        explicit DestroyObject() : ServerPacket(SMSG_DESTROY_OBJECT) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class UpdateObject final : public ServerPacket
    {
    public:
        class UpdatePacket
        {
            public:
                UpdatePacket() : blockCount(0) {}
                ByteBuffer data;
                uint32 blockCount;
        };

        ObjectGuidSet outOfRangeGUIDs;
        nonstd::optional<UpdatePacket> updatePacket;
        bool hasTransport = false;

        // Builder will change opcode if it needs to be compressed.
        explicit UpdateObject() : ServerPacket(SMSG_UPDATE_OBJECT) {}
        size_t EstimateFinalSize() const override;
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::ObjectUpdate

#endif // MANGOS_PACKETS_UPDATE_OBJECT_H
