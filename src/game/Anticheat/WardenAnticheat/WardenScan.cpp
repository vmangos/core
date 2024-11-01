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

#include "WardenScan.hpp"
#include "WardenWin.hpp"
#include "WardenModule.hpp"
#include "ByteBuffer.h"
#include "Util.h"
#include "Crypto/Hash/HMACSHA1.h"
#include "Crypto/Hash/SHA1.h"

#include <string>
#include <algorithm>
#include <functional>

ScanFlags operator|(ScanFlags lhs, ScanFlags rhs)
{
    return static_cast<ScanFlags> (
        static_cast<std::underlying_type<ScanFlags>::type>(lhs) |
        static_cast<std::underlying_type<ScanFlags>::type>(rhs)
        );
}

ScanFlags operator&(ScanFlags lhs, ScanFlags rhs)
{
    return static_cast<ScanFlags> (
        static_cast<std::underlying_type<ScanFlags>::type>(lhs) &
        static_cast<std::underlying_type<ScanFlags>::type>(rhs)
        );
}

bool operator!(ScanFlags flags)
{
    return !static_cast<std::underlying_type<ScanFlags>::type>(flags);
}

bool operator&&(ScanFlags lhs, ScanFlags rhs)
{
    return static_cast<std::underlying_type<ScanFlags>::type>(lhs) &&
           static_cast<std::underlying_type<ScanFlags>::type>(rhs);
}

Scan::BuildT StringHashScan::GetBuilder()
{
    return [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        std::string& string = warden->m_hashString;

        string.clear();
        uint8 size = urand(1, 255);
        string.reserve(size);
        for (uint8 i = 0; i < size; i++)
            string += (char)urand('a', 'z');

        MANGOS_ASSERT(string.size() <= 0xFF);

        scan << static_cast<uint8>(string.size());

        // skip null terminator this way
        scan.append(string.c_str(), string.size());
    };
}

Scan::CheckT StringHashScan::GetChecker()
{
    return [this](Warden const* warden, ByteBuffer& buff)
    {
        // calculate server side hashes


        static constexpr uint32 magic = 0xFEEDFACE;

        Crypto::Hash::SHA1::Generator sha1;
        sha1.UpdateData(warden->m_hashString);
        if (!warden->IsUsingMaiev()) // this constant is only used if there is a module
            sha1.UpdateData(reinterpret_cast<uint8 const*>(&magic), sizeof(magic));

        Crypto::Hash::SHA1::Digest serverSHA = sha1.GetDigest();
        Crypto::Hash::MD5::Digest serverMD5 = Crypto::Hash::MD5::ComputeFrom(warden->m_hashString);

        // compare with client side hashes
        Crypto::Hash::SHA1::Digest clientSHA;
        Crypto::Hash::MD5::Digest clientMD5;

        // read into buffer
        buff.read(clientSHA.data(), clientSHA.size());
        buff.read(clientMD5.data(), clientMD5.size());

        bool isCorrect = clientSHA == serverSHA && clientMD5 == serverMD5;
        return !isCorrect; // true if mismatch
    };
}

WindowsStringHashScan::WindowsStringHashScan()
    : StringHashScan(), WindowsScan(
    // builder
    GetBuilder(),
    // checker
    GetChecker(),
    128, sizeof(uint8) + Crypto::Hash::SHA1::Digest::size() + Crypto::Hash::MD5::Digest::size(), "Maiev string hash",
    ScanFlags::Maiev, 0, UINT16_MAX)
{
    
}

MacStringHashScan::MacStringHashScan(bool moduleLoaded)
    : StringHashScan(), MacScan(
        // builder
        GetBuilder(),
        // checker
        GetChecker(),
        128, sizeof(uint8) + Crypto::Hash::SHA1::Digest::size() + Crypto::Hash::MD5::Digest::size(), moduleLoaded ? "Mac string hash" : "Maiev string hash",
        (moduleLoaded ? ScanFlags::None : ScanFlags::Maiev), 0, UINT16_MAX)
{

}

WindowsModuleScan::WindowsModuleScan(std::string const& module, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_module(module), m_wanted(wanted),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[FIND_MODULE_BY_NAME] ^ winWarden->GetXor()) << seed;

        Crypto::Hash::HMACSHA1::Generator hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
        hash.UpdateData(this->m_module);
        auto digest = hash.GetDigest();

        scan.append(digest.data(), digest.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const found = buff.read<uint8>() == ModuleFound;
        return found != this->m_wanted;
    }, sizeof(uint8) + sizeof(uint32) + Crypto::Hash::SHA1::Digest::size(), sizeof(uint8), comment, flags, minBuild, maxBuild)
{
    // the game depends on uppercase module names being sent
    std::transform(m_module.begin(), m_module.end(), m_module.begin(), ::toupper);
}

WindowsModuleScan::WindowsModuleScan(std::string const& module, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_module(module),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[FIND_MODULE_BY_NAME] ^ winWarden->GetXor()) << seed;

        Crypto::Hash::HMACSHA1::Generator hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
        hash.UpdateData(this->m_module);
        auto digest = hash.GetDigest();

        scan.append(digest.data(), digest.size());
    },
    checker, sizeof(uint8) + sizeof(uint32) + Crypto::Hash::SHA1::Digest::size(), sizeof(uint8), comment, flags, minBuild, maxBuild)
{
    // the game depends on uppercase module names being sent
    std::transform(m_module.begin(), m_module.end(), m_module.begin(), ::toupper);
}

WindowsMemoryScan::WindowsMemoryScan(uint32 offset, void const* expected, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_expected(length), m_offset(offset),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[READ_MEMORY] ^ winWarden->GetXor())
             << static_cast<uint8>(0)   // no string associated with this form of the constructor
             << this->m_offset
             << static_cast<uint8>(this->m_expected.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        // non-zero value indicates failure
        if (!!buff.read<uint8>())
            return true;

        auto const result = !!memcmp(buff.contents() + buff.rpos(), &this->m_expected[0], this->m_expected.size());
        buff.rpos(buff.rpos() + this->m_expected.size());
        return result;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + length, comment, flags, minBuild, maxBuild)
{
    // must fit within uint8
    MANGOS_ASSERT(m_expected.size() <= 0xFF);

    ::memcpy(&m_expected[0], expected, m_expected.size());
}

WindowsMemoryScan::WindowsMemoryScan(std::string const& module, uint32 offset, void const* expected, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_expected(length), m_offset(offset), m_module(module),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_module);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[READ_MEMORY] ^ winWarden->GetXor())
             << static_cast<uint8>(strings.size())
             << this->m_offset
             << static_cast<uint8>(this->m_expected.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        // non-zero value indicates failure
        if (!!buff.read<uint8>())
            return true;

        auto const result = !!memcmp(buff.contents() + buff.rpos(), &this->m_expected[0], this->m_expected.size());
        buff.rpos(buff.rpos() + this->m_expected.size());
        return result;
    }, module.length() + sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + length, comment, flags, minBuild, maxBuild)
{
    // must fit within uint8
    MANGOS_ASSERT(m_expected.size() <= 0xFF);

    ::memcpy(&m_expected[0], expected, m_expected.size());

    // since this scan uses GetModuleHandle() rather than GetFirstModule()/GetNextModule(), this is case insensitive.
    // but still it seems prudent to be consistent
    std::transform(m_module.begin(), m_module.end(), m_module.begin(), ::toupper);
}

WindowsMemoryScan::WindowsMemoryScan(uint32 offset, size_t length, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_expected(length), m_offset(offset),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[READ_MEMORY] ^ winWarden->GetXor())
             << static_cast<uint8>(0)   // no string associated with this form of the constructor
             << this->m_offset
             << static_cast<uint8>(this->m_expected.size());
    }, checker, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + length, comment, flags, minBuild, maxBuild)
{
    MANGOS_ASSERT(m_expected.size() <= 0xFF);
}

WindowsMemoryScan::WindowsMemoryScan(std::string const& module, uint32 offset, size_t length, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_expected(length), m_offset(offset), m_module(module),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_module);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[READ_MEMORY] ^ winWarden->GetXor())
             << static_cast<uint8>(strings.size())
             << this->m_offset
             << static_cast<uint8>(this->m_expected.size());
    }, checker, module.length() + sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + length, comment, flags, minBuild, maxBuild) {}

WindowsCodeScan::WindowsCodeScan(uint32 offset, std::vector<uint8> const& pattern, bool memImageOnly, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_offset(offset), m_pattern(pattern), m_memImageOnly(memImageOnly), m_wanted(wanted),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[this->m_memImageOnly ? FIND_MEM_IMAGE_CODE_BY_HASH : FIND_CODE_BY_HASH] ^ winWarden->GetXor())
             << seed;

        Crypto::Hash::HMACSHA1::Generator hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
        hash.UpdateData(&this->m_pattern[0], this->m_pattern.size());
        auto digest = hash.GetDigest();

        scan.append(digest.data(), digest.size());

        scan << this->m_offset << static_cast<uint8>(this->m_pattern.size());
    },
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const found = buff.read<uint8>() == PatternFound;
        return found != this->m_wanted;
    }, sizeof(uint8) + sizeof(uint32) + Crypto::Hash::SHA1::Digest::size() + sizeof(uint32) + sizeof(uint8), sizeof(uint8), comment, flags, minBuild, maxBuild)
{
    MANGOS_ASSERT(m_pattern.size() <= 0xFF);
}

WindowsFileHashScan::WindowsFileHashScan(std::string const& file, nonstd::optional<Crypto::Hash::SHA1::Digest> const& expectedHash, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_file(file), m_wanted(wanted), m_expectedHash(expectedHash),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_file);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[HASH_CLIENT_FILE] ^ winWarden->GetXor())
             << static_cast<uint8>(strings.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const success = !buff.read<uint8>();

        // either we wanted it but didn't find it, or didn't want it but did find it
        if (this->m_wanted != success)
            return true;

        // if we didn't want it and didn't find it, succeed
        if (!this->m_wanted && !success)
            return false;

        Crypto::Hash::SHA1::Digest hashFromClient;
        buff.read(hashFromClient.data(), hashFromClient.size());

        // if a hash was given, check it (some checks may only be interested in existence)
        return m_expectedHash.has_value() && hashFromClient != m_expectedHash;
    }, sizeof(uint8) + sizeof(uint8) + file.length(), sizeof(uint8) + Crypto::Hash::SHA1::Digest::size(), comment, flags | ScanFlags::OffsetsInitialized, minBuild, maxBuild)
{
}

WindowsLuaScan::WindowsLuaScan(std::string const& lua, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_lua(lua), m_wanted(wanted),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_lua);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[GET_LUA_VARIABLE] ^ winWarden->GetXor())
            << static_cast<uint8>(strings.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const found = !buff.read<uint8>();

        // if its found we have to 'read' the string, even if we don't care what it is
        if (found)
        {
            auto const length = buff.read<uint8>();
            buff.rpos(buff.rpos() + length);
        }

        return found != this->m_wanted;
    }, sizeof(uint8) + sizeof(uint8) + lua.length(), sizeof(uint8) + 0xFF, comment, flags | ScanFlags::OffsetsInitialized, minBuild, maxBuild) {}

WindowsLuaScan::WindowsLuaScan(std::string const& lua, std::string const& expectedValue, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_lua(lua), m_expectedValue(expectedValue),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_lua);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[GET_LUA_VARIABLE] ^ winWarden->GetXor())
            << static_cast<uint8>(strings.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const result = buff.read<uint8>();

        if (!!result)
            return true;

        const size_t len = buff.read<uint8>();

        const std::string str(reinterpret_cast<char const*>(buff.contents() + buff.rpos()), len);

        buff.rpos(buff.rpos() + len);

        return str == this->m_expectedValue;
    }, sizeof(uint8) + sizeof(uint8) + lua.length(), sizeof(uint8) + 0xFF, comment, flags | ScanFlags::OffsetsInitialized, minBuild, maxBuild)
{
    MANGOS_ASSERT(expectedValue.length() <= 0xFF);
}

WindowsLuaScan::WindowsLuaScan(std::string const& lua, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild) : m_lua(lua),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_lua);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[GET_LUA_VARIABLE] ^ winWarden->GetXor())
            << static_cast<uint8>(strings.size());
    }, checker, sizeof(uint8) + sizeof(uint8) + lua.length(), sizeof(uint8) + 0xFF, comment, flags | ScanFlags::OffsetsInitialized, minBuild, maxBuild)
{
    MANGOS_ASSERT(checker);
}

WindowsHookScan::WindowsHookScan(std::string const& module, std::string const& proc, Crypto::Hash::SHA1::Digest const& hash,
    uint32 offset, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_module(module), m_proc(proc), m_hash(hash), m_offset(offset), m_length(length),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFE);

        strings.emplace_back(this->m_module);
        strings.emplace_back(this->m_proc);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[API_CHECK] ^ winWarden->GetXor()) << seed;

        scan.append(m_hash.data(), m_hash.size());
        scan << static_cast<uint8>(strings.size() - 1)
             << static_cast<uint8>(strings.size())
             << this->m_offset
             << static_cast<uint8>(this->m_length);
    },
    // checker
    [](Warden const*, ByteBuffer& buff)
    {
        return buff.read<uint8>() == Detoured;
    },
        sizeof(uint8) + sizeof(uint32) + Crypto::Hash::SHA1::Digest::size() + sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8),
        sizeof(uint8), comment, flags, minBuild, maxBuild)
{
    MANGOS_ASSERT(length <= 0xFF);
}

WindowsDriverScan::WindowsDriverScan(std::string const& name, std::string const& targetPath, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
    : m_name(name), m_wanted(wanted), m_targetPath(targetPath),
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() < 0xFF);

        strings.emplace_back(this->m_name);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[FIND_DRIVER_BY_NAME] ^ winWarden->GetXor()) << seed;

        Crypto::Hash::HMACSHA1::Generator hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
        hash.UpdateData(this->m_targetPath);
        auto digest = hash.GetDigest();

        scan.append(digest.data(), digest.size());
        scan << static_cast<uint8>(strings.size());
    },
    // checker
    [this](Warden const*, ByteBuffer& buff)
    {
        auto const found = buff.read<uint8>() == Found;

        return found != this->m_wanted;
    }, sizeof(uint8) + sizeof(uint32) + Crypto::Hash::SHA1::Digest::size() + sizeof(uint8) + name.length(), sizeof(uint8), comment, flags, minBuild, maxBuild) {}

WindowsTimeScan::WindowsTimeScan(CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild) :
    WindowsScan(
    // builder
    [this](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        scan << static_cast<uint8>(winWarden->GetModule()->opcodes[CHECK_TIMING_VALUES] ^ winWarden->GetXor());
    }, checker, sizeof(uint8), sizeof(uint8) + sizeof(uint32), comment, flags | ScanFlags::OffsetsInitialized, minBuild, maxBuild)
{
    MANGOS_ASSERT(!!checker);
}
