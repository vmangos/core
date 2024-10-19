/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
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

#include "Sha1Hash.h"
#include "../BigNumber.h"

#include <cstdarg>
#include <openssl/sha.h>

Sha1Hash::Sha1Hash()
{
    m_ctx = new SHA_CTX;
    SHA1_Init(m_ctx);
}

Sha1Hash::~Sha1Hash()
{
    SHA1_Init(m_ctx);
    delete m_ctx;
}

void Sha1Hash::UpdateData(uint8 const* dta, int len)
{
    SHA1_Update(m_ctx, dta, len);
}

void Sha1Hash::UpdateData(std::vector<uint8> const& data)
{
    SHA1_Update(m_ctx, data.data(), data.size());
}

void Sha1Hash::UpdateData(std::string const& str)
{
    UpdateData((uint8 const*)str.c_str(), str.length());
}

void Sha1Hash::UpdateBigNumbers(BigNumber* bn0, ...)
{
    va_list v;
    BigNumber* bn;

    va_start(v, bn0);
    bn = bn0;
    while (bn)
    {
        UpdateData(bn->AsByteArray());
        bn = va_arg(v, BigNumber*);
    }
    va_end(v);
}

void Sha1Hash::Initialize()
{
    SHA1_Init(m_ctx);
}

void Sha1Hash::Finalize()
{
    SHA1_Final(m_digest, m_ctx);
}
