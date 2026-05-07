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
#include "Errors.h"

#include <openssl/hmac.h>
#include <openssl/sha.h>


Crypto::Hash::HMACSHA1::Generator::Generator(std::vector<uint8> const& key)
  : Generator(key.data(), key.size())
{
    // use base ctor
}

Crypto::Hash::HMACSHA1::Generator::Generator(uint8 const* key, size_t len)
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    // OpenSSL 3.x
    m_mac = EVP_MAC_fetch(nullptr, "HMAC", nullptr);
    MANGOS_ASSERT(m_mac != nullptr);
    m_ctx = EVP_MAC_CTX_new(m_mac);
    MANGOS_ASSERT(m_ctx != nullptr);

    OSSL_PARAM params[2];
    params[0] = OSSL_PARAM_construct_utf8_string("digest", const_cast<char*>("SHA1"), 0);
    params[1] = OSSL_PARAM_construct_end();

    MANGOS_ASSERT(EVP_MAC_init(m_ctx, key, len, params) == 1);
#elif OPENSSL_VERSION_NUMBER < 0x10100000L
    // OpenSSL 1.0.x
    m_ctx = new HMAC_CTX;
    HMAC_CTX_init(m_ctx);
    HMAC_Init_ex(m_ctx, key, static_cast<int>(len), EVP_sha1(), nullptr);
#else
    // OpenSSL 1.1.x
    m_ctx = HMAC_CTX_new();
    HMAC_Init_ex(m_ctx, key, static_cast<int>(len), EVP_sha1(), nullptr);
#endif
}

Crypto::Hash::HMACSHA1::Generator::~Generator()
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    // OpenSSL 3.x
    EVP_MAC_CTX_free(m_ctx);
    EVP_MAC_free(m_mac);
#elif OPENSSL_VERSION_NUMBER < 0x10100000L
    // OpenSSL 1.0.x
    HMAC_CTX_cleanup(m_ctx);
    delete m_ctx;
#else
    // OpenSSL 1.1.x
    HMAC_CTX_free(m_ctx);
#endif
}

void Crypto::Hash::HMACSHA1::Generator::UpdateData(std::vector<uint8> const& data)
{
    UpdateData(data.data(), data.size());
}

void Crypto::Hash::HMACSHA1::Generator::UpdateData(std::string const& str)
{
    UpdateData(reinterpret_cast<uint8 const*>(str.c_str()), str.length());
}

void Crypto::Hash::HMACSHA1::Generator::UpdateData(BigNumber const& bn)
{
    UpdateData(bn.AsByteArray());
}

void Crypto::Hash::HMACSHA1::Generator::UpdateData(uint8 const* data, size_t length)
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    MANGOS_ASSERT(EVP_MAC_update(m_ctx, data, length) == 1);
#else
    HMAC_Update(m_ctx, data, length);
#endif
}

Crypto::Hash::HMACSHA1::Digest Crypto::Hash::HMACSHA1::Generator::GetDigest()
{
    Digest digest;
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    size_t length = 0;
    MANGOS_ASSERT(EVP_MAC_final(m_ctx, digest.data(), &length, digest.size()) == 1);
#else
    uint32 length = 0;
    HMAC_Final(m_ctx, digest.data(), &length);
#endif
    MANGOS_ASSERT(length == SHA_DIGEST_LENGTH);
    return digest;
}
