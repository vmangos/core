/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#pragma once

#include <cstddef>

namespace Crypto {
    // Constant-time memory compare. Returns true iff the first `length` bytes
    // of `a` and `b` are equal. Must be used for secret-dependent comparisons
    // (proofs, hashes, MACs) to avoid timing side-channels.
    bool ConstantTimeEquals(void const* a, void const* b, std::size_t length);
}
