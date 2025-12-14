#include "SHA1.h"

#include <openssl/sha.h>

#include "Crypto/BigNumber.h"

Crypto::Hash::SHA1::Digest Crypto::Hash::SHA1::ComputeFrom(std::vector<uint8> const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::SHA1::Digest Crypto::Hash::SHA1::ComputeFrom(std::string const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::SHA1::Digest Crypto::Hash::SHA1::ComputeFrom(BigNumber const& data)
{
    Generator generator;
    generator.UpdateData(data);
    return generator.GetDigest();
}

Crypto::Hash::SHA1::Digest Crypto::Hash::SHA1::ComputeFrom(uint8 const* data, size_t length)
{
    Generator generator;
    generator.UpdateData(data, length);
    return generator.GetDigest();
}

Crypto::Hash::SHA1::Generator::Generator()
{
    m_ctx = new SHA_CTX;
    SHA1_Init(m_ctx);
}

Crypto::Hash::SHA1::Generator::~Generator()
{
    delete m_ctx;
}

void Crypto::Hash::SHA1::Generator::UpdateData(std::vector<uint8> const& data)
{
    UpdateData(data.data(), data.size());
}

void Crypto::Hash::SHA1::Generator::UpdateData(std::string const& data)
{
    UpdateData(reinterpret_cast<uint8 const*>(data.c_str()), data.size());
}

void Crypto::Hash::SHA1::Generator::UpdateData(BigNumber const& data)
{
    std::vector<uint8> bytes = data.AsByteArray();
    UpdateData(bytes);
}

void Crypto::Hash::SHA1::Generator::UpdateData(uint8 const* data, size_t length)
{
    SHA1_Update(m_ctx, data, length);
}

Crypto::Hash::SHA1::Digest Crypto::Hash::SHA1::Generator::GetDigest()
{
    Digest digest;
    SHA1_Final(digest.data(), m_ctx);
    return digest;
}
