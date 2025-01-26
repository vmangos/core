#include "MD5.h"

#include <openssl/md5.h>

#include "Crypto/BigNumber.h"

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

void Crypto::Hash::MD5::Generator::UpdateData(BigNumber const& data)
{
    std::vector<uint8> bytes = data.AsByteArray();
    UpdateData(bytes);
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
