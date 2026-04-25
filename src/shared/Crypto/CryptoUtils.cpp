#include "CryptoUtils.h"
#include <openssl/crypto.h>

bool Crypto::ConstantTimeEquals(void const* a, void const* b, std::size_t length)
{
    return CRYPTO_memcmp(a, b, length) == 0;
}
