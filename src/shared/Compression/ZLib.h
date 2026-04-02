#ifndef MANGOS_COMPRESSION_ZLIB_H
#define MANGOS_COMPRESSION_ZLIB_H

#include "Platform/Define.h"
#include "nonstd/optional.hpp"

#include <cstddef>
#include <vector>

namespace Compression { namespace ZLib
{
    /// Decompress `input` into a buffer of `decompressedSize` bytes.
    /// Returns nullopt if decompression fails.
    nonstd::optional<std::vector<uint8>> Decompress(std::vector<uint8> const& input, uint32 decompressedSize);

    /// Compress `data` using zlib's default compression level.
    /// Returns nullopt if compression fails.
    nonstd::optional<std::vector<uint8>> Compress(uint8 const* data, size_t length);
    nonstd::optional<std::vector<uint8>> Compress(std::vector<uint8> const& data);
}} // namespace Compression::ZLib

#endif // MANGOS_COMPRESSION_ZLIB_H
