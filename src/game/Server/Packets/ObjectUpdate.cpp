#include "ObjectUpdate.h"
#include "Errors.h"
#include "Log.h"
#include "UpdateData.h"
#include "World.h"
#include <zlib.h>

size_t WorldPackets::ObjectUpdate::DestroyObject::EstimateFinalSize() const
{
    return sizeof(objectGuid);
}

void WorldPackets::ObjectUpdate::DestroyObject::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << objectGuid;
}

size_t WorldPackets::ObjectUpdate::UpdateObject::EstimateFinalSize() const
{
    // The size depends on whether the packet ends up compressed, so
    // AppendBodyTo reserves or resizes the buffer itself.
    return 0;
}

void WorldPackets::ObjectUpdate::UpdateObject::AppendBodyTo(ByteBuffer& buffer) const
{
    size_t size = sizeof(uint32) /*blockCount*/
                + sizeof(uint8) /*hasTransport*/
                + (outOfRangeGUIDs.empty() ? 0 : 
                      sizeof(uint8) /*updateType*/ + 
                      sizeof(uint32) /*outOfRangeGUIDs.size*/ + 
                     (sizeof(uint8) + sizeof(uint64)) * outOfRangeGUIDs.size())
                + (updatePacket ? updatePacket->data.wpos() : 0);

    auto WriteContentsToBuffer = [&](ByteBuffer& buf)
    {
        buf.reserve(size);
        uint32 blockCount = updatePacket ? updatePacket->blockCount : 0;
        buf << (uint32)(!outOfRangeGUIDs.empty() ? blockCount + 1 : blockCount);
        buf << (uint8)(hasTransport ? 1 : 0);

        if (!outOfRangeGUIDs.empty())
        {
            buf << (uint8)UPDATETYPE_OUT_OF_RANGE_OBJECTS;
            buf << (uint32)outOfRangeGUIDs.size();

            for (const auto& guid : outOfRangeGUIDs)
                buf << guid.WriteAsPackedClientBuildAware();
        }

        if (updatePacket)
            buf.append(updatePacket->data);
    };

    // compress large packets
    if (size > sWorld.getConfig(CONFIG_UINT32_COMPRESSION_UPDATE_SIZE))
    {
        ByteBuffer buffer2;
        WriteContentsToBuffer(buffer2);
        size = buffer2.wpos();

        if (size >= 900000)
            sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH-CLIENT] Too large packet: %u", size);

        uint32 destsize = compressBound(size);
        buffer.resize(destsize + sizeof(uint32));

        buffer.put<uint32>(0, size);
        PacketCompressor::Compress(const_cast<uint8*>(buffer.contents()) + sizeof(uint32), &destsize, (void*)buffer2.contents(), size);
        MANGOS_ASSERT(destsize != 0);

        buffer.resize(destsize + sizeof(uint32));
        SetOpcode(SMSG_COMPRESSED_UPDATE_OBJECT);
    }
    else                                                    // send small packets without compression
    {
        WriteContentsToBuffer(buffer);
        SetOpcode(SMSG_UPDATE_OBJECT);
    }

}
