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

 /*
  *
  * This code was written by namreeb (legal@namreeb.org) and is released with
  * permission as part of vmangos (https://github.com/vmangos/core)
  *
  */

#ifndef __WARDENMODULE_HPP_
#define __WARDENMODULE_HPP_

#include "Platform/Define.h"

#include <string>
#include <vector>

#include "Crypto/Hash/MD5.h"

#pragma pack(push, 1)
struct ChallengeResponseEntry
{
    uint8 seed[16];
    uint8 reply[20];
    uint8 clientKey[16];
    uint8 serverKey[16];
};
#pragma pack(pop)

class WardenModule
{
private:
    static constexpr size_t SignatureSize = 260;
    static constexpr size_t KeySize = 16;
    static constexpr size_t ScanTypeCount = 9;

public:
    // windows module
    WardenModule(std::string const& binary, std::string const& key, std::string const& cr);

    WardenModule(WardenModule&& other) = default;

    // true when this module is for windows (otherwise it is for Mac x86)
    bool Windows() const;

    // compressed and rc4 encrypted form of the module (as it should be sent to the client)
    std::vector<uint8> binary;

    // rc4 key to send to client
    std::vector<uint8> key;

    // md5 hash of 'm_binary'
    Crypto::Hash::MD5::Digest hash;

    // offset into module of the memory reading function which is modified by some hacks
    std::uint32_t memoryRead;

    // offset into module of the page scan check function which is modified by some hacks
    std::uint32_t pageScanCheck;

    // mapping of scan function to the numerical value of the opcode
    uint8_t opcodes[ScanTypeCount];

    // invalid opcode value that signifies scans are over
    uint8 scanTerminator;

    // pregenerated challenge, responses, and encryption keys for this module
    std::vector<ChallengeResponseEntry> crk;
};

#endif /*!__WARDENMODULE_HPP_*/