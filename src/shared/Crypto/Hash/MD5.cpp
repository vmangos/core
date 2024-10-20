#include "MD5.h"

#include <openssl/md5.h>

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::CreateFrom(std::vector<uint8> const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::CreateFrom(std::string const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::CreateFrom(uint8 const* data, size_t length)
{
    Generator generator;
    generator.UpdateData(data, length);
    return generator.GetDigest();
}

Crypto::Hash::MD5::Generator::Generator()
{
    m_ctx = new MD5_CTX;
    MD5_Init(m_ctx);
}

Crypto::Hash::MD5::Generator::~Generator()
{
    delete m_ctx;
}

void Crypto::Hash::MD5::Generator::UpdateData(std::vector<uint8> const& data)
{
    UpdateData(data.data(), data.size());
}

void Crypto::Hash::MD5::Generator::UpdateData(std::string const& data)
{
    UpdateData(reinterpret_cast<uint8 const*>(data.c_str()), data.size());
}

void Crypto::Hash::MD5::Generator::UpdateData(uint8 const* data, size_t length)
{
    MD5_Update(m_ctx, data, length);
}

Crypto::Hash::MD5::Digest Crypto::Hash::MD5::Generator::GetDigest()
{
    Digest digest;
    MD5_Final(digest.data(), m_ctx);
    return digest;
}

