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

void SniffFile::WriteHeader(FILE* pFile)
{
    // Write header
    fwrite("PKT", 1, 3, pFile);
    uint16 sniffVersion = 0x201;
    fwrite(&sniffVersion, sizeof(uint16), 1, pFile);
    uint16 gameBuild = SUPPORTED_CLIENT_BUILD;
    fwrite(&gameBuild, sizeof(uint16), 1, pFile);
    uint8 zero = 0;
    for (int i = 0; i < 40; i++)
        fwrite(&zero, 1, 1, pFile);
}

void SniffFile::WritePacket(FILE* pFile, LoggedPacket const& packet)
{
    uint8 direction = packet.isClientPacket ? 0x00 : 0xff;
    fwrite(&direction, 1, 1, pFile);
    uint32 unixTime = packet.timestamp;
    fwrite(&unixTime, sizeof(uint32), 1, pFile);
    uint32 msTime = packet.data.GetPacketTime();
    fwrite(&msTime, sizeof(uint32), 1, pFile);

    if (packet.isClientPacket)
    {
        uint32 packetSize = packet.data.size() + sizeof(uint32);
        fwrite(&packetSize, sizeof(uint32), 1, pFile);
        uint32 opcode = packet.data.GetOpcode();
        fwrite(&opcode, sizeof(uint32), 1, pFile);
    }
    else
    {
        uint32 packetSize = packet.data.size() + sizeof(uint16);
        fwrite(&packetSize, sizeof(uint32), 1, pFile);
        uint16 opcode = packet.data.GetOpcode();
        fwrite(&opcode, sizeof(uint16), 1, pFile);
    } 

    if (packet.data.size())
        fwrite(packet.data.contents(), sizeof(uint8), packet.data.size(), pFile);
}