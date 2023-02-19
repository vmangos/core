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

#ifndef _SNIFF_FILE_H
#define _SNIFF_FILE_H

#include "Common.h"
#include "WorldPacket.h"
#include "Timer.h"

struct LoggedPacket
{
    LoggedPacket(bool isClientPacket_, WorldPacket const& packet) : isClientPacket(isClientPacket_), data(packet), timestamp(time(nullptr))
    {
        if (!isClientPacket && !data.GetPacketTime())
            data.FillPacketTime(WorldTimer::getMSTime());
    }
    bool isClientPacket;
    time_t timestamp;
    WorldPacket data;
};

class SniffFile
{
public:
    SniffFile(FILE* pFile);
    SniffFile(char const* fileName);
    ~SniffFile();

    void WriteHeader();
    void WritePacket(LoggedPacket const& packet)
    {
        WritePacket(packet.data, packet.isClientPacket, packet.timestamp);
    }
    void WritePacket(WorldPacket const& packet, bool isClientPacket, time_t timestamp);

    template < template < class ... > class Container, class ... Args >
    void WriteToFile(Container<LoggedPacket, Args...> const& container)
    {
        WriteHeader();
        for (auto const itr : container)
            WritePacket(itr);
    }
private:
    FILE* m_file;
};

#endif
