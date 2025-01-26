#ifndef _MANGOS_CRYPTO_HASH_SHA1_H
#define _MANGOS_CRYPTO_HASH_SHA1_H

#include "Platform/Define.h"

#include <array>
#include <string>
#include <vector>

class BigNumber;

typedef struct SHAstate_st SHA_CTX;

namespace Crypto { namespace Hash { namespace SHA1
{
    struct Digest : std::array<uint8, 20>
    {
        static constexpr size_t size() { return 20; }
    };

    constexpr Digest CreateZero() { return {}; }

    template <std::size_t N>
    Digest ComputeFrom(std::array<uint8, N> const& data) { return ComputeFrom(data.data(), data.size()); }
    Digest ComputeFrom(std::vector<uint8> const& data);
    Digest ComputeFrom(std::string const& data);
    Digest ComputeFrom(BigNumber const& data);
    Digest ComputeFrom(uint8 const* data, size_t length);

    class Generator
    {
    public:
        Generator();
        ~Generator();

        template <std::size_t N>
        void UpdateData(std::array<uint8, N> const& data) { UpdateData(data.data(), data.size()); }
        void UpdateData(std::vector<uint8> const& data);
        void UpdateData(std::string const& data);
        void UpdateData(BigNumber const& data);
        void UpdateData(uint8 const* data, size_t length);

        Digest GetDigest();

    private:
        SHA_CTX* m_ctx;
    };
}}} // namespace Crypto::Hash::SHA1

#endif
