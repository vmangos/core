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

#include "HMACSHA1.h"
#include "../BigNumber.h"

HMACSHA1::HMACSHA1(const uint8* seed, size_t len)
{
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    m_ctx = HMAC_CTX_new();
    HMAC_Init_ex(m_ctx, seed, len, EVP_sha1(), nullptr);
#else
    HMAC_CTX_init(&m_ctx);
    HMAC_Init_ex(&m_ctx, seed, static_cast<int>(len), EVP_sha1(), nullptr);
#endif
}

HMACSHA1::~HMACSHA1()
{
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_CTX_free(m_ctx);
#else
    HMAC_CTX_cleanup(&m_ctx);
#endif
}

void HMACSHA1::UpdateBigNumber(BigNumber* bn)
{
    UpdateData(bn->AsByteArray());
}

void HMACSHA1::UpdateData(std::vector<uint8> const& data)
{
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_Update(m_ctx, data.data(), data.size());
#else
    HMAC_Update(&m_ctx, data.data(), data.size());
#endif
}

void HMACSHA1::UpdateData(uint8 const* data, int length)
{
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_Update(m_ctx, data, length);
#else
    HMAC_Update(&m_ctx, data, length);
#endif
}

void HMACSHA1::UpdateData(std::string const& str)
{
    UpdateData((uint8 const*)str.c_str(), str.length());
}

void HMACSHA1::Finalize()
{
    uint32 length = 0;
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_Final(m_ctx, (uint8*)m_digest, &length);
#else
    HMAC_Final(&m_ctx, (uint8*)m_digest, &length);
#endif
    //MANGOS_ASSERT(length == SHA_DIGEST_LENGTH);
}

uint8* HMACSHA1::ComputeHash(BigNumber* bn)
{
    auto byteArray = bn->AsByteArray();
#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER >= 0x10100000L
    HMAC_Update(m_ctx, byteArray.data(), byteArray.size());
#else
    HMAC_Update(&m_ctx, byteArray.data(), byteArray.size());
#endif
    Finalize();
    return (uint8*)m_digest;
}
