/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "UpdateData.h"
#include "ByteBuffer.h"
#include "WorldPacket.h"
#include "Log.h"
#include "Opcodes.h"
#include "World.h"
#include "ObjectGuid.h"
#include "Errors.h"
#include <zlib.h>

#define MAX_UNCOMPRESSED_PACKET_SIZE 0x8000 // 32ko

UpdateData::UpdateData()
{
}

UpdateData::~UpdateData()
{
    Clear();
}

void UpdateData::AddOutOfRangeGUID(ObjectGuidSet& guids)
{
    m_outOfRangeGUIDs.insert(guids.begin(), guids.end());
}

void UpdateData::AddOutOfRangeGUID(ObjectGuid const& guid)
{
    m_outOfRangeGUIDs.insert(guid);
}

ByteBuffer& UpdateData::AddUpdateBlockAndGetBuffer()
{
    if (m_datas.empty())
        m_datas.emplace_back(); // m_datas.push_back(UpdatePacket());
    std::list<UpdatePacket>::iterator it = m_datas.end();
    --it;
    if (it->data.wpos() > MAX_UNCOMPRESSED_PACKET_SIZE)
    {
        m_datas.emplace_back(); // m_datas.push_back(UpdatePacket());
        it = m_datas.end();
        --it;
    }
    ++it->blockCount;
    return it->data;
}

void PacketCompressor::Compress(void* dst, uint32* dst_size, void* src, int src_size)
{
    z_stream c_stream;

    c_stream.zalloc = (alloc_func)0;
    c_stream.zfree = (free_func)0;
    c_stream.opaque = (voidpf)0;

    // default Z_BEST_SPEED (1)
    int z_res = deflateInit(&c_stream, sWorld.getConfig(CONFIG_UINT32_COMPRESSION_LEVEL));
    if (z_res != Z_OK)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't compress update packet (zlib: deflateInit) Error code: %i (%s)", z_res, zError(z_res));
        *dst_size = 0;
        return;
    }

    c_stream.next_out = (Bytef*)dst;
    c_stream.avail_out = *dst_size;
    c_stream.next_in = (Bytef*)src;
    c_stream.avail_in = (uInt)src_size;

    z_res = deflate(&c_stream, Z_NO_FLUSH);
    if (z_res != Z_OK)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't compress update packet (zlib: deflate) Error code: %i (%s)", z_res, zError(z_res));
        *dst_size = 0;
        return;
    }

    if (c_stream.avail_in != 0)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't compress update packet (zlib: deflate not greedy)");
        *dst_size = 0;
        return;
    }

    z_res = deflate(&c_stream, Z_FINISH);
    if (z_res != Z_STREAM_END)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't compress update packet (zlib: deflate should report Z_STREAM_END instead %i (%s)", z_res, zError(z_res));
        *dst_size = 0;
        return;
    }

    z_res = deflateEnd(&c_stream);
    if (z_res != Z_OK)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Can't compress update packet (zlib: deflateEnd) Error code: %i (%s)", z_res, zError(z_res));
        *dst_size = 0;
        return;
    }

    *dst_size = c_stream.total_out;
}

void UpdateData::BuildPacket(std::unique_ptr<WorldPackets::ObjectUpdate::UpdateObject>& packet, bool hasTransport)
{
    if (m_datas.empty())
        return BuildPacket(packet, nullptr, hasTransport);

    // Only the first update block ends up in the packet. Callers that fill more
    // than one block must use `Send` instead, or the rest is silently dropped.
    MANGOS_ASSERT(m_datas.size() == 1);

    return BuildPacket(packet, &(m_datas.front()), hasTransport);
}

void UpdateData::BuildPacket(std::unique_ptr<WorldPackets::ObjectUpdate::UpdateObject>& packet, UpdatePacket* updPacket, bool hasTransport)
{
    // shouldn't happen
    MANGOS_ASSERT(packet->outOfRangeGUIDs.empty() && !packet->updatePacket.has_value());

    packet->hasTransport = hasTransport;
    if (!m_outOfRangeGUIDs.empty())
        packet->outOfRangeGUIDs = std::move(m_outOfRangeGUIDs);
    if (updPacket)
        packet->updatePacket = std::move(*updPacket);
}

void UpdateData::Send(WorldSession* session, bool hasTransport)
{
    if (m_datas.empty() && !m_outOfRangeGUIDs.empty())
    {
        auto data = std::make_unique<WorldPackets::ObjectUpdate::UpdateObject>();
        BuildPacket(data, nullptr, hasTransport);
        session->SendPacket(std::move(data));
        m_outOfRangeGUIDs.clear();
        return;
    }
    for (auto& itr : m_datas)
    {
        auto data = std::make_unique<WorldPackets::ObjectUpdate::UpdateObject>();
        BuildPacket(data, &itr, hasTransport);
        session->SendPacket(std::move(data));
        m_outOfRangeGUIDs.clear();
    }
}

void UpdateData::Clear()
{
    m_datas.clear();
    m_outOfRangeGUIDs.clear();
}

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
bool MovementData::CanAddPacket(WorldPacket const& data)
{
    // Since packet size is stored with an uint8, packet size is limited for compressed packets
    if ((data.wpos() + 2) > 0xFF)
        return false;

    if ((m_buffer.wpos() + (data.wpos() + 2)) >= 900000)
        return false;

    return true;
}

void MovementData::AddPacket(WorldPacket const& data)
{
    ASSERT(data.wpos() + 2 <= 0xFF); // Max packet size to be stored on uint8. Client crash else.
    m_buffer << uint8(data.wpos() + 2); // Packet + opcode size
    m_buffer << uint16(data.GetOpcode());
    m_buffer.append(data.contents(), data.wpos());
}

bool MovementData::BuildPacket(WorldPacket& packet)
{
    MANGOS_ASSERT(packet.empty()); // We want a clean packet !

    size_t pSize = m_buffer.wpos();                              // use real used data size

    if (pSize >= 900000)
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "[CRASH-CLIENT] Too large packet size %u (SMSG_COMPRESSED_MOVES)", pSize);

    uint32 destsize = compressBound(pSize);
    packet.resize(destsize + sizeof(uint32));
    packet.put<uint32>(0, pSize);
    PacketCompressor::Compress(const_cast<uint8*>(packet.contents()) + sizeof(uint32), &destsize, (void*)m_buffer.contents(), pSize);
    if (destsize == 0)
        return false;

    packet.resize(destsize + sizeof(uint32));
    packet.SetOpcode(SMSG_COMPRESSED_MOVES);
    return true;
}
#endif
