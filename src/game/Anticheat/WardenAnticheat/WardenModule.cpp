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

#include "WardenModule.hpp"

#include "Platform/Define.h"
#include "Crypto/Hash/MD5.h"

#include <zlib.h>

#include <string>
#include <vector>
#include <fstream>
#include <exception>


WardenModule::WardenModule(std::string const& bin, std::string const& kf, std::string const& cr)
{
    std::ifstream b(bin, std::ios::binary | std::ios::ate);

    if (b.fail())
        throw std::runtime_error("Failed to open Warden module binary");

    if (b.tellg() < SignatureSize + 4)
        throw std::runtime_error("Warden module too small.  Must be at least 264 bytes.");

    binary.resize(static_cast<size_t>(b.tellg()));
    b.seekg(0, std::ios::beg);

    if (!b.read(reinterpret_cast<char*>(&binary[0]), binary.size()))
        throw std::runtime_error("Failed to open: " + bin);

    b.close();

    // compute md5 hash of encrypted/compressed data
    hash = Crypto::Hash::MD5::ComputeFrom(binary);

    std::ifstream k(kf, std::ios::binary | std::ios::ate);

    if (k.fail())
        throw std::runtime_error("Failed to open Warden module key file");

    if (static_cast<size_t>(k.tellg()) != KeySize)
        throw std::runtime_error("Key file " + kf + " is incorrect size!");

    key.resize(KeySize);
    k.seekg(0, std::ios::beg);

    if (!k.read(reinterpret_cast<char*>(&key[0]), key.size()))
        throw std::runtime_error("Failed to open " + kf);

    k.close();

    std::ifstream c(cr, std::ios::binary | std::ios::ate);

    if (c.fail())
        throw std::runtime_error("Failed to open Warden challenge/response file");

    auto const crSize = static_cast<size_t>(c.tellg()) - sizeof(opcodes) - sizeof(memoryRead) - sizeof(pageScanCheck);

    if (!!(crSize % sizeof(ChallengeResponseEntry)))
        throw std::runtime_error("Unexpected data in Warden challenge/response file");

    crk.resize(crSize / sizeof(ChallengeResponseEntry));

    c.seekg(0, std::ios::beg);

    c.read(reinterpret_cast<char*>(&memoryRead), sizeof(memoryRead));
    c.read(reinterpret_cast<char*>(&pageScanCheck), sizeof(pageScanCheck));
    c.read(reinterpret_cast<char*>(&opcodes), sizeof(opcodes));
    c.read(reinterpret_cast<char*>(&crk[0]), crSize);

    c.close();

    if (Windows())
    {
        for (uint8 i = 0; i <= UINT8_MAX; i++)
        {
            if (opcodes[0] != i &&
                opcodes[1] != i &&
                opcodes[2] != i &&
                opcodes[3] != i &&
                opcodes[4] != i &&
                opcodes[5] != i &&
                opcodes[6] != i &&
                opcodes[7] != i &&
                opcodes[8] != i)
            {
                scanTerminator = i;
                break;
            }
        }

        if (!memoryRead)
            throw std::runtime_error("Module data does not include memory read information");

        if (!pageScanCheck)
            throw std::runtime_error("Module data does not include page scan check information");
    }
}

bool WardenModule::Windows() const
{
    // these values will be all zero for OSX modules

    for (auto i = 0; i < sizeof(opcodes); ++i)
        if (!!opcodes[i])
            return true;

    return false;
}