// SPDX-FileCopyrightText: 2026-present VMaNGOS <https://github.com/vmangos>
// SPDX-License-Identifier: GPL-2.0-only

#include "CryptoUtils.h"
#include <openssl/crypto.h>

bool Crypto::ConstantTimeEquals(void const* a, void const* b, std::size_t length)
{
    return CRYPTO_memcmp(a, b, length) == 0;
}
