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

#ifndef __WARDENSCAN_HPP_
#define __WARDENSCAN_HPP_

#include "ByteBuffer.h"
#include "World.h"
#include "Log.h"
#include "Crypto/Hash/SHA1.h"

#include <functional>
#include <vector>
#include <memory>
#include <string>

#include "nonstd/optional.hpp"

enum class ScanFlags : uint32
{
    None               = 0x00000,
    FromDatabase       = 0x00001,  // this scan came from the database, and should be deleted on reload
    Windows            = 0x00002,  // this scan is for windows clients
    Mac                = 0x00004,  // this scan is for mac clients
    InitialLogin       = 0x00008,  // this scan is sent when world session is first created
    //InWorld          = 0x00010,  // this scan is only sent when player is in world
    Maiev              = 0x00020,  // this scan is only for the default module
    OffsetsInitialized = 0x00040,  // requires MODULE_INITIALIZE packet to be sent first (File, Lua, Timing)
};

ScanFlags operator|(ScanFlags lhs, ScanFlags rhs);
ScanFlags operator&(ScanFlags lhs, ScanFlags rhs);
bool operator!(ScanFlags flags);
bool operator&&(ScanFlags lhs, ScanFlags rhs);

enum WindowsScanType
{
    READ_MEMORY = 0,
    FIND_MODULE_BY_NAME,
    FIND_MEM_IMAGE_CODE_BY_HASH,
    FIND_CODE_BY_HASH,
    HASH_CLIENT_FILE,
    GET_LUA_VARIABLE,
    API_CHECK,
    FIND_DRIVER_BY_NAME,
    CHECK_TIMING_VALUES,
    MAX_SCAN_TYPE
};

class Warden;

class Scan
{
    public:
        using BuildT = std::function<void(Warden const*, std::vector<std::string>&, ByteBuffer&)>;
        using CheckT = std::function<bool(Warden const*, ByteBuffer&)>;

    private:
        BuildT m_builder;
        CheckT m_checker;

    protected:  // should not be called by the user
        Scan(BuildT builder, CheckT checker, ScanFlags f, size_t req, size_t rep, uint32 minBuild, uint32 maxBuild, std::string const&c)
            : m_builder(builder), m_checker(checker), checkId(0), flags(f), buildMin(minBuild), buildMax(maxBuild), comment(c), requestSize(req), replySize(rep)
        { 
            MANGOS_ASSERT(!((flags & ScanFlags::Windows) && (flags & ScanFlags::Mac)));
            penalty = sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_DEFAULT_PENALTY);
        }

    public:
        uint32 checkId;
        ScanFlags flags;
        uint8 penalty;
        uint32 buildMin;
        uint32 buildMax;
        std::string comment;
        size_t requestSize;     // maximum size of request
        size_t replySize;       // maximum size of reply

        Scan() = delete;
        virtual ~Scan() = default;

        void Build(Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan) const { m_builder(warden, strings, scan); }

        // return true when the scan revealed a hack
        bool Check(Warden const* warden, ByteBuffer& buff) const { return m_checker(warden, buff); }
};

class MacScan : public Scan
{
    public:
        MacScan(BuildT builder, CheckT checker, size_t requestSize, size_t replySize, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
            : Scan(builder, checker, flags | ScanFlags::Mac, requestSize, replySize, minBuild, maxBuild, comment) {}
};

class WindowsScan : public Scan
{
    public:
        WindowsScan(BuildT builder, CheckT checker, size_t requestSize, size_t replySize, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild)
            : Scan(builder, checker, flags | ScanFlags::Windows, requestSize, replySize, minBuild, maxBuild, comment) {}

        WindowsScan() = delete;
};

class StringHashScan
{
public:
    Scan::BuildT GetBuilder();
    Scan::CheckT GetChecker();
};

// only supported by maiev
class WindowsStringHashScan : public WindowsScan, public StringHashScan
{
    public:
        WindowsStringHashScan();
};

// supported by both maiev and the mac module, but extra constant used
class MacStringHashScan : public MacScan, public StringHashScan
{
    public:
        MacStringHashScan(bool moduleLoaded);
};

// check to see if a module is loaded
class WindowsModuleScan : public WindowsScan
{
    private:
        std::string m_module;
        bool m_wanted;

    public:
        static constexpr uint8 ModuleFound = 0x4A;

        WindowsModuleScan(std::string const& module, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsModuleScan(std::string const& module, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// read arbitrary memory from the client, optionally offset from the base of a module by name
class WindowsMemoryScan : public WindowsScan
{
    private:
        std::vector<uint8> m_expected;
        uint32 m_offset;
        std::string m_module;

    public:
        WindowsMemoryScan(uint32 offset, void const* expected, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsMemoryScan(std::string const& module, uint32 offset, void const* expected, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsMemoryScan(uint32 offset, size_t length, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsMemoryScan(std::string const& module, uint32 offset, size_t length, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// scan the start of each executable memory segment, optionally filtered by those belonging to regions marked by type MEM_IMAGE (as reported by VirtualQuery())
class WindowsCodeScan : public WindowsScan
{
    private:
        uint32 m_offset;
        std::vector<uint8> m_pattern;
        bool m_memImageOnly;
        bool m_wanted;

    public:
        static constexpr uint8 PatternFound = 0x4A;

        WindowsCodeScan(uint32 offset, std::vector<uint8> const& pattern, bool memImageOnly, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// reads the specified file from the client MPQs, hashes it, and sends back the hash
class WindowsFileHashScan : public WindowsScan
{
    private:
        std::string m_file;
        nonstd::optional<Crypto::Hash::SHA1::Digest> m_expectedHash;
        bool m_wanted;

    public:
        WindowsFileHashScan(std::string const& file, nonstd::optional<Crypto::Hash::SHA1::Digest> const& expectedHash, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// reads the value of a lua variable and returns it.  keep in mind when using this that different states
// of the game have different variables set.
class WindowsLuaScan : public WindowsScan
{
    private:
        std::string m_lua;
        std::string m_expectedValue;
        bool m_wanted;

    public:
        WindowsLuaScan(std::string const& lua, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsLuaScan(std::string const& lua, std::string const& expectedValue, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
        WindowsLuaScan(std::string const& lua, CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// this scan will examine a procedure defined by its module and export name (for GetModuleHandle() and GetProcAddress()).
// it will skip any NOPs it encounters at the start of the function and at the first non-NOP (0x90) it encounters, if
// a JMP (0xE9) is encountered, it will read the requested number of bytes ('length') from the jump target, and compare
// a hash of those bytes to the given hash.
class WindowsHookScan : public WindowsScan
{
    private:
        static constexpr uint8 Detoured = 0x4A;

        std::string m_module;
        std::string m_proc;
        Crypto::Hash::SHA1::Digest m_hash;
        uint32 m_offset;
        size_t m_length;

    public:
        WindowsHookScan(std::string const& module, std::string const& proc, Crypto::Hash::SHA1::Digest const& hash, uint32 offset, size_t length, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// this scan will search for call kernel32!QueryDosDevice() and search for a device with the given name.
// if the named device was found, and its full path matches the given string, this scan will succeed.
// it is believed that this scan was created in order to target WoWGlider.
class WindowsDriverScan : public WindowsScan
{
    private:
        static constexpr uint8 Found = 0x4A;

        std::string m_name;
        std::string m_targetPath;
        bool m_wanted;

    public:
        WindowsDriverScan(std::string const& name, std::string const& targetPath, bool wanted, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};

// this scan will call the game's function 'OsGetAsyncTimeMs()' as well as kernel32!GetTickCount() up to five times
// if the two functions ever return a different value, the first portion of the reply will indicate a failure.
// NOTE: this can happen when the client runs on a newer version of Windows under Windows XP emulation mode, and
// therefore is not sufficient grounds to consider a hack as being detected.
class WindowsTimeScan : public WindowsScan
{
    public:
        WindowsTimeScan(CheckT checker, std::string const& comment, ScanFlags flags, uint32 minBuild, uint32 maxBuild);
};
#endif /*!__WARDENSCAN_HPP_*/