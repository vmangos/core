/*
 * This file is part of the CMaNGOS Project. See AUTHORS file for Copyright information
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

#include "Auth/Hmac.h"
#include "BigNumber.h"

HmacHash::HmacHash(uint8 const* data, int length)
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    m_mac = EVP_MAC_fetch(nullptr, "HMAC", nullptr);
    m_ctx = EVP_MAC_CTX_new(m_mac);

    OSSL_PARAM params[2];
    params[0] = OSSL_PARAM_construct_utf8_string("digest", const_cast<char*>("SHA1"), 0);
    params[1] = OSSL_PARAM_construct_end();

    EVP_MAC_init(m_ctx, data, length, params);
#else
    m_ctx = HMAC_CTX_new();
    HMAC_Init_ex(m_ctx, data, length, EVP_sha1(), nullptr);
#endif
}

HmacHash::~HmacHash()
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    EVP_MAC_CTX_free(m_ctx);
    EVP_MAC_free(m_mac);
#else
    HMAC_CTX_free(m_ctx);
#endif
}

void HmacHash::UpdateBigNumber(BigNumber* bn)
{
    UpdateData(bn->AsByteArray());
}

void HmacHash::UpdateData(std::vector<uint8> const& data)
{
    HMAC_Update(m_ctx, data.data(), data.size());
}

void HmacHash::UpdateData(uint8 const* data, int length)
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    EVP_MAC_update(m_ctx, data, length);
#else
    HMAC_Update(m_ctx, data, length);
#endif
}

void HmacHash::Finalize()
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    size_t length = 0;
    EVP_MAC_final(m_ctx, m_digest, &length, sizeof(m_digest));
#else
    uint32 length = 0;
    HMAC_Final(m_ctx, (uint8*)m_digest, &length);
#endif
    // MANGOS_ASSERT(length == SHA_DIGEST_LENGTH);
}

uint8* HmacHash::ComputeHash(BigNumber* bn)
{
    auto byteArray = bn->AsByteArray();
    HMAC_Update(m_ctx, byteArray.data(), byteArray.size());
    Finalize();
    return (uint8*)m_digest;
}
