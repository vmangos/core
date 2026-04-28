#include "MD5.h"

#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
#include <openssl/evp.h>
#else
#include <openssl/md5.h>
#endif

#include "Crypto/BigNumber.h"
#include "Errors.h"

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::ComputeFrom(std::vector<uint8> const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::ComputeFrom(std::string const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::ComputeFrom(BigNumber const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::ComputeFrom(uint8 const* data, size_t length)
{
    Generator generator;
    generator.UpdateData(data, length);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Generator::Generator()
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    m_ctx = EVP_MD_CTX_new();
    MANGOS_ASSERT(m_ctx != nullptr);
    MANGOS_ASSERT(EVP_DigestInit_ex(m_ctx, EVP_md5(), nullptr) == 1);
#else
    m_ctx = new MD5_CTX;
    MD5_Init(m_ctx);
#endif
}

Crypto::Hash::MD5::Generator::~Generator()
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    EVP_MD_CTX_free(m_ctx);
#else
    delete m_ctx;
#endif
}

void Crypto::Hash::MD5::Generator::UpdateData(std::vector<uint8> const& data)
{
    UpdateData(data.data(), data.size());
}

void Crypto::Hash::MD5::Generator::UpdateData(std::string const& data)
{
    UpdateData(reinterpret_cast<uint8 const*>(data.c_str()), data.size());
}

void Crypto::Hash::MD5::Generator::UpdateData(BigNumber const& data)
{
    std::vector<uint8> bytes = data.AsByteArray();
    UpdateData(bytes);
}

void Crypto::Hash::MD5::Generator::UpdateData(uint8 const* data, size_t length)
{
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    MANGOS_ASSERT(EVP_DigestUpdate(m_ctx, data, length) == 1);
#else
    MD5_Update(m_ctx, data, length);
#endif
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::Generator::GetDigest()
{
    Digest digest;
#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >= 3)
    uint32 length = 0;
    MANGOS_ASSERT(EVP_DigestFinal_ex(m_ctx, digest.data(), &length) == 1);
    MANGOS_ASSERT(length == digest.size());
#else
    MD5_Final(digest.data(), m_ctx);
#endif
    return digest;
}
