#ifndef _MANGOS_MD5_HASH_H
#define _MANGOS_MD5_HASH_H

#include "Platform/Define.h"

#include <array>
#include <string>
#include <vector>

typedef struct MD5state_st MD5_CTX;

namespace Crypto { namespace Hash { namespace MD5
{
    struct Digest : std::array<uint8, 16>
    {
        static constexpr size_t size() { return 16; }
    };

    constexpr Digest CreateEmpty() { return {}; }

    Digest CreateFrom(std::vector<uint8> const& data);
    Digest CreateFrom(std::string const& data);
    Digest CreateFrom(uint8 const* data, size_t length);

    class Generator
    {
    public:
        Generator();
        ~Generator();

        void UpdateData(std::vector<uint8> const& data);
        void UpdateData(std::string const& data);
        void UpdateData(uint8 const* data, size_t length);

        Digest GetDigest();

    private:
        MD5_CTX* m_ctx;
    };
}}} // namespace Crypto::Hash::MD5

#endif // _MANGOS_MD5_HASH_H
