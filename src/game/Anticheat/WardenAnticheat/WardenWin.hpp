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

#ifndef __WARDENWIN_HPP_
#define __WARDENWIN_HPP_

#include "Warden.hpp"
#include "WardenScan.hpp"
#include "WorldPacket.h"

#include <vector>

struct ChallengeResponseEntry;
class WorldSession;
class BigNumber;

#pragma pack (push, 1)
struct WIN_SYSTEM_INFO {
    union {
        uint32  dwOemId;
        struct {
            uint16 wProcessorArchitecture;
            uint16 wReserved;
        };
    };
    uint32 dwPageSize;
    uint32 lpMinimumApplicationAddress;
    uint32 lpMaximumApplicationAddress;
    uint32 dwActiveProcessorMask;
    uint32 dwNumberOfProcessors;
    uint32 dwProcessorType;
    uint32 dwAllocationGranularity;
    uint16 wProcessorLevel;
    uint16 wProcessorRevision;
};
#pragma pack (pop)

static_assert(sizeof(WIN_SYSTEM_INFO) == 0x24, "WIN_SYSTEM_INFO wrong size");

class WardenWin final : public Warden
{
    private:
        // pointer in client memory to the loaded warden module.  as this should never change once the module is loaded,
        // it is only read once (upon initial login)
        uint32 _wardenAddress;

        WIN_SYSTEM_INFO _sysInfo;

        bool _sysInfoSaved;
        bool _proxifierFound;

        std::string _hypervisors;

        WorldPacket _charEnum;

        uint32 _lastClientTime;
        uint32 _lastHardwareActionTime;
        uint32 _lastTimeCheckServer;

        virtual uint32 GetScanFlags() const;

        // send module initialization information (function offsets, etc.)
        virtual void InitializeClient();

        /* 
            (a, b) initialization packet options:

            (4, 0) -> "lua string check" initialization
                <uint8 len><module name>
                    -- no null terminator
                    -- passed to GetModuleHandle(), therefore passing 0 means wow.exe
                <uint32 offset from module base>
                <uint8, 0 or 1 for which function pointer, __fastcall or __cdecl)
                    -- funcptr[0] has preference
                    -- if (!funcptr[0]) funcptr[1]();
                    -- 'str' given in lua string check packet
                    -- 0: const char * (__fastcall *)(str, 0, 0)
                    -- 1: const char * (__cdecl *)(str, 0, 0)

            (1, 0) -> "file hash check" initialization
                <uint8 option>
                        int __stdcall SFileOpenFile(const char *filename, SFile **result)
                        int __stdcall SFileGetFileSize(SFile *file, unsigned int *result)
                        void __stdcall SFileCloseFile(SFile *file)

                    -- 1:
                        int __stdcall SFileReadFile(SFile *file, void *buffer, unsigned int bytesToRead, unsigned int *bytesRead, void *overlap)
                    -- 2:
                        int __stdcall SFileReadFile(SFile *file, void *buffer, unsigned int bytesToRead, unsigned int *bytesRead, void *overlap, void *asyncparam)

                <uint8 len><module name>
                    -- no null terminator
                    -- passed to GetModuleHandle(), therefore passing 0 means wow.exe
                <uint32 SFileOpenFile offset>
                <uint32 SFileGetFileSize offset>
                <uint32 SFileReadFile offset>
                <uint32 SFileCloseFile offset>

            (1, 1) -> "timing check" initialization
                <uint8 len><module name>
                    -- no null terminator
                    -- passed to GetModuleHandle(), therefore passing 0 means wow.exe
                <uint32 offset from module base>
                    -- int (__thiscall *)(WardenSysInfo *)
                <uint8 option>
                    -- 0 to clear function pointer, 1 to write
            */

        // initialization packets
        void BuildLuaInit(const std::string &module, bool fastcall, uint32 offset, ByteBuffer &out) const;
        void BuildFileHashInit(const std::string &module, bool asyncparam, uint32 openOffset, uint32 sizeOffset,
            uint32 readOffset, uint32 closeOffset, ByteBuffer &out) const;
        void BuildTimingInit(const std::string &module, uint32 offset, bool set, ByteBuffer &out) const;

    public:
        static void LoadScriptedScans();

        WardenWin(WorldSession *session, const BigNumber &K);

        void Update();

        // set pending character enum packet (to be sent once we are satisfied that Warden is loaded)
        virtual void SetCharEnumPacket(WorldPacket &&packet);

        virtual void GetPlayerInfo(std::string& clock, std::string& fingerprint, std::string& hypervisors,
            std::string& proxifier) const;
};

#endif /*!__WARDENWIN_HPP_*/