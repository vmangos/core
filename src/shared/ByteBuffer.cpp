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

#include "ByteBuffer.h"
#include "Log.h"

void ByteBufferException::PrintPosError() const
{
    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Attempted to %s in ByteBuffer (pos: " SIZEFMTD " size: " SIZEFMTD ") value with size: " SIZEFMTD,
        (add ? "put" : "get"), pos, size, esize);
}

void ByteBuffer::append(uint8 const* src, size_t cnt)
{
    if (!cnt)
        return;

    MANGOS_ASSERT(size() < 10000000);

    if (_storage.size() < _wpos + cnt)
        _storage.resize(_wpos + cnt);
    memcpy(&_storage[_wpos], src, cnt);
    _wpos += cnt;
}

void ByteBuffer::hexlike() const
{
    if (!sLog.HasLogLevelOrHigher(LOG_LVL_DEBUG))   // optimize disabled debug output
        return;

    std::ostringstream ss;
    ss << "STORAGE_SIZE: " << size() << "\n";

    if (sLog.IsIncludeTime())
        ss << "         ";

    size_t j = 1, k = 1;

    for (size_t i = 0; i < size(); ++i)
    {
        if ((i == (j * 8)) && ((i != (k * 16))))
        {
            ss << "| ";
            ++j;
        }
        else if (i == (k * 16))
        {
            ss << "\n";

            if (sLog.IsIncludeTime())
                ss << "         ";

            ++k;
            ++j;
        }

        char buf[4];
        snprintf(buf, 4, "%02X", read<uint8>(i));
        ss << buf << " ";

    }
    sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, ss.str().c_str());
}
