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

#ifndef _MANGOS_CRYPTO_HASH_HMACSHA1_H
#define _MANGOS_CRYPTO_HASH_HMACSHA1_H

#include "Platform/Define.h"

#include <array>
#include <string>
#include <vector>

#include "SHA1.h"

class BigNumber;

typedef struct hmac_ctx_st HMAC_CTX;

namespace Crypto { namespace Hash { namespace HMACSHA1
{
    typedef SHA1::Digest Digest;

    constexpr Digest CreateEmpty() { return {}; }

    class Generator
    {
    public:
        Generator(uint8 const* key, size_t len);
        ~Generator();

        template <std::size_t N>
        void UpdateData(std::array<uint8, N> const& data) { UpdateData(data.data(), data.size()); }
        void UpdateData(std::vector<uint8> const& data);
        void UpdateData(std::string const& data);
        void UpdateData(BigNumber const& data);
        void UpdateData(uint8 const* data, size_t length);

        Digest GetDigest();

    private:
        HMAC_CTX* m_ctx;
    };

}}} // namespace Crypto::Hash::HMACSHA1

#endif
