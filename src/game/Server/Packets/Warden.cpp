#include "Warden.h"

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
void WorldPackets::Warden::WardenData::ReadFromWorldPacket(WorldPacket& recv_data)
{
    uint32 const remaining = recv_data.size() - recv_data.rpos();
    data.resize(remaining);
    if (!data.empty())
        recv_data.read(data.data(), data.size());
}

void WorldPackets::Warden::WardenDataServer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer.append(encryptedData);
}
#endif
