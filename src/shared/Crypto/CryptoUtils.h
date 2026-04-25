// SPDX-FileCopyrightText: 2026-present VMaNGOS <https://github.com/vmangos>
// SPDX-License-Identifier: GPL-2.0-only

#pragma once

#include <cstddef>

namespace Crypto {
    // Constant-time memory compare. Returns true iff the first `length` bytes
    // of `a` and `b` are equal. Must be used for secret-dependent comparisons
    // (proofs, hashes, MACs) to avoid timing side-channels.
    bool ConstantTimeEquals(void const* a, void const* b, std::size_t length);
}
