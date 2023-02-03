/*
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

#include "SniffFile.h"
#include "Log.h"

SniffFile::SniffFile(FILE* pFile) : m_file(pFile)
{
    MANGOS_ASSERT(m_file);
}

SniffFile::SniffFile(char const* fileName)
{
    m_file = fopen(fileName, "wb");
    MANGOS_ASSERT(m_file);
}

SniffFile::~SniffFile()
{
    if (m_file)
        fclose(m_file);
}

void SniffFile::WriteHeader()
{
    // Write header
    fwrite("PKT", 1, 3, m_file);
    uint16 sniffVersion = 0x201;
    fwrite(&sniffVersion, sizeof(uint16), 1, m_file);
    uint16 gameBuild = SUPPORTED_CLIENT_BUILD;
    fwrite(&gameBuild, sizeof(uint16), 1, m_file);
    uint8 zero = 0;
    for (int i = 0; i < 40; i++)
        fwrite(&zero, 1, 1, m_file);
}

void SniffFile::WritePacket(WorldPacket const& packet, bool isClientPacket, time_t timestamp)
{
    uint8 direction = isClientPacket ? 0x00 : 0xff;
    fwrite(&direction, 1, 1, m_file);
    uint32 unixTime = timestamp;
    fwrite(&unixTime, sizeof(uint32), 1, m_file);
    uint32 msTime = packet.GetPacketTime();
    fwrite(&msTime, sizeof(uint32), 1, m_file);

    if (isClientPacket)
    {
        uint32 packetSize = packet.size() + sizeof(uint32);
        fwrite(&packetSize, sizeof(uint32), 1, m_file);
        uint32 opcode = packet.GetOpcode();
        fwrite(&opcode, sizeof(uint32), 1, m_file);
    }
    else
    {
        uint32 packetSize = packet.size() + sizeof(uint16);
        fwrite(&packetSize, sizeof(uint32), 1, m_file);
        uint16 opcode = packet.GetOpcode();
        fwrite(&opcode, sizeof(uint16), 1, m_file);
    }

    if (packet.size())
        fwrite(packet.contents(), sizeof(uint8), packet.size(), m_file);
}
