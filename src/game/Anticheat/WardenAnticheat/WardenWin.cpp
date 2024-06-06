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

#include "Warden.hpp"
#include "WardenWin.hpp"
#include "WardenModuleMgr.hpp"
#include "WardenScanMgr.hpp"
#include "WardenScan.hpp"
#include "../Anticheat.h"
#include "World.h"

#include "Unit.h"
#include "Chat.h"
#include "WorldSession.h"
#include "Auth/BigNumber.h"
#include "Auth/HMACSHA1.h"
#include "ByteBuffer.h"
#include "Database/DatabaseEnv.h"
#include "Player.h"
#include "Progression.h"

#include <string>
#include <vector>
#include <memory>
#include <sstream>
#include <iomanip>

namespace
{
// fixed offsets for classic client(s):
static constexpr struct ClientOffsets
{
    uint32 Build;

    // LuaScan
    uint32 GetText;

    // FileHashScan
    uint32 Open;
    uint32 Size;
    uint32 Read;
    uint32 Close;

    // TimeScan
    uint32 TickCount;

    // CWorld::enables memory scan
    uint32 WorldEnables;

    // LastHardwareAction memory scan (CSimpleTop::m_eventTime)
    uint32 LastHardwareAction;

    // EndScene memory scan
    uint32 g_theGxDevicePtr;
    uint32 OfsDevice2;
    uint32 OfsDevice3;
    uint32 OfsDevice4;

    // Warden memory scan
    uint32 WardenModule;
    uint32 OfsWardenSysInfo;
    uint32 OfsWardenWinSysInfo;

    // Click to move
    uint32 ClickToMovePosition;
} Offsets[] = {
    {
        5464,
        0x2FAE20,
        0x23F410, 0x240460, 0x2400D0, 0x24B560,
        0x2BDF0,
        0xC6F4CC,
        0xCE4BD0,
        0xC02F48, 0x38A8, 0x0, 0xA8,
        0xCDCB8C, 0x228, 0x08,
        0xC41B44
    },
    {
        5875,
        0x303BF0,
        0x2477A0, 0x2487F0, 0x248460, 0x253900,
        0x2C010,
        0xC7B2A4,
        0xCF0BC8,
        0xC0ED38, 0x38A8, 0x0, 0xA8,
        0xCE897C, 0x228, 0x08,
        0xC4D890
    },
    {
        6005,
        0x303C20,
        0x2477A0, 0x2487F0, 0x248460, 0x253900,
        0x2C010,
        0xC7B2A4,
        0xCF0BC8,
        0xC0ED38, 0x38A8, 0x0, 0xA8,
        0xCE897C, 0x228, 0x08,
        0xC4D890
    },
    {
        6141,
        0x305FC0,
        0x249B40, 0x24AB90, 0x24A800, 0x255CA0,
        0x2C010,
        0xC7F9C4,
        0xCF52E8,
        0xC133E0, 0x38A8, 0x0, 0xA8,
        0xCED09C, 0x228, 0x08,
        0xC51FB0
    }
};

// TODO: Identify drivers for other hypervisors and add detections for them too
static constexpr struct
{
    char const* Name;
    char const* Driver;
    char const* DeviceName;
} Hypervisors[] =
{
    { "VirtualBox", "VBoxGuest", "\\Device\\VBoxGuest"},
    { "ESXi", "vmmemctl", "\\Device\\vmmemctl"},
};

static auto constexpr HypervisorCount = sizeof(Hypervisors) / sizeof(Hypervisors[0]);

enum WorldEnables
{
    TerrainDoodads                  = 0x1,              // default, toggled by sub at 0x673130, which is never called.  should always be set
    Terrain                         = 0x2,              // default, toggled by sub at 0x6730F0, which is never called.  should always be set
    TerrainLOD                      = 0x4,              // lod console var
    Unk10                           = 0x10,             // default
    TerrainCulling                  = 0x20,             // default, showCull console command
    TerrainShadows                  = 0x40,             // default, mapShadows console var, showShadow console command
    TerrainDoodadCollisionVisuals   = 0x80,             // toggled by sub at 0x6731C0, which is never called.  should never be set
    MapObjects                      = 0x100,            // default, toggled by sub at 0x673430, which is never called.  should always be set
    MapObjectLighting               = 0x200,            // default, toggled by sub at 0x673360, which is never called.  should always be set
    FootPrints                      = 0x400,            // showfootprints console var
    MapObjectTextures               = 0x800,            // default, toggled by sub at 0x6733A0, which is never called.  should always be set
    PortalDisplay                   = 0x1000,           // toggled by sub at 0x673470, which is never called.  should never be set
    PortalVisual                    = 0x2000,           // toggled by sub at 0x6734B0, which is never called.  should never be set
    DisableDoodadFullAlpha          = 0x4000,           // fullAlpha console var
    DoodadAnimation                 = 0x8000,           // doodadAnim console var
    TriangleStrips                  = 0x10000,          // triangleStrips console var
    CrappyBatches                   = 0x20000,          // toggled by sub at 0x6733E0, which is never called.  should never be set
    ZoneBoundaryVisuals             = 0x40000,          // zoneBoundary disabled console command (should never be set, also sends CMSG_ZONE_MAP, sub at 0x673850)
    BSPRender                       = 0x80000,          // toggled by sub at 0x6730A0, which is never called.  should never be set
    DetailDoodads                   = 0x100000,         // default, showDetailDoodads console command
    ShowQuery                       = 0x200000,         // showQuery disabled console command (should never be set)
    TerrainDoodadAABoxVisuals       = 0x400000,         // toggled by sub at 0x673170, which is never called.  should never be set
    TrilinearFiltering              = 0x800000,         // trilinear console var
    Water                           = 0x1000000,        // default, toggled by sub at 0x673670, which is never called.  should always be set
    WaterParticulates               = 0x2000000,        // default, waterParticulates console command
    TerrainLowDetail                = 0x4000000,        // default, showLowDetail console command
    Specular                        = 0x8000000,        // specular console var
    PixelShaders                    = 0x10000000,       // pixelShaders console var
    Unknown6737F9                   = 0x20000000,       // unknown, set by sub at 0x6737F0, should never be set
    Unknown673820                   = 0x40000000,       // unknown, set by sub at 0x673820, should never be set
    Anisotropic                     = 0x80000000,       // anisotropic console var

    Required = (TerrainDoodads|Terrain| MapObjects| MapObjectLighting| MapObjectTextures| Water),
    Prohibited = (TerrainDoodadCollisionVisuals|CrappyBatches|ZoneBoundaryVisuals|BSPRender|ShowQuery|TerrainDoodadAABoxVisuals|Unknown6737F9|Unknown673820),
};

ClientOffsets const* GetClientOffets(uint32 build)
{
    static auto constexpr offset_count = sizeof(Offsets) / sizeof(Offsets[0]);

    for (auto i = 0; i < offset_count; ++i)
        if (Offsets[i].Build == build)
            return &Offsets[i];

    return nullptr;
}

std::string ArchitectureString(uint16 arch)
{
    switch (arch)
    {
        case 0:
            return "x86";
        case 5:
            return "ARM";
        case 6:
            return "IA64";
        case 9:
            return "x64";
        case 0xFFFF:
            return "Unknown";
        default:
            return "INVALID";
    }
}

std::string CPUTypeAndRevision(uint32 cpuType, uint16 revision)
{
    std::stringstream str;

    switch (cpuType)
    {
        case 386:
        {
            str << "i386";

            const uint8 firstByte = revision >> 8;
            const uint8 y = 0xF & (revision >> 4);
            const uint8 z = 0xF & (revision);

            if (firstByte == 0xFF)
                str << " Model: " << static_cast<uint32>(y) << " Stepping: " << z;
            else
                str << " Stepping: " << static_cast<char>('A' + firstByte) << static_cast<uint32>(firstByte & 0xFF);

            break;
        }
        case 486:
        {
            str << "i486";

            const uint8 firstByte = revision >> 8;
            const uint8 y = 0xF & (revision >> 4);
            const uint8 z = 0xF & (revision);

            if (firstByte == 0xFF)
                str << " Model: " << static_cast<uint32>(y) << " Stepping: " << z;
            else
                str << " Stepping: " << static_cast<char>('A' + firstByte) << static_cast<uint32>(firstByte & 0xFF);

            break;
        }
        case 586:
        {
            str << "Pentium (i586)";

            const uint8 model = 0xFF & (revision >> 8);
            const uint8 stepping = 0xFF & (revision);

            str << " Model: " << static_cast<uint32>(model) << " Stepping: " << static_cast<uint32>(stepping);

            break;
        }
        case 2200:
            str << "IA64";
            break;
        case 8664:
            str << "X8664";
            break;
        default:
            str << "ARM/Unknown";
            break;
    }

    return str.str();
}

// this function assumes that the given code begins with a valid instruction.  in other words, that
// it does not begin in random data or in the middle of an instruction.
void DeobfuscateAsm(std::vector<std::uint8_t>& code)
{
#define LSTRIP(c, l) do { if (c.size() <= l) { c.clear(); return; } else { c.erase(c.begin(), c.begin()+l); } } while(false)

    do
    {
        if (code.empty())
            return;

        // At the start of this loop we re-assume the entry condition that the code begins at a valid instruction.

        // remove NOP
        if (code[0] == 0x90)
        {
            LSTRIP(code, 1);
            continue;
        }

        // xchg statements which are either semantically equivalent to NOP or
        // which will be inverted later on.
        if (code[0] == 0x87)
        {
            // {"eax", "ebx", "ecx", "edx", "edi", "esi"};
            if (code[1] == 0xC9 ||  // xchg ecx, ecx
                code[1] == 0xCA ||  // xchg ecx, edx
                code[1] == 0xCB ||  // xchg ebx, ecx
                code[1] == 0xCE ||  // xchg esi, ecx
                code[1] == 0xCF ||  // xchg ecx, edi
                code[1] == 0xE4 ||  // xchg esp, esp
                code[1] == 0xED ||  // xchg ebp, ebp
                code[1] == 0xD1 ||  // xchg ecx, edx
                code[1] == 0xD2 ||  // xchg edx, edx
                code[1] == 0xD3 ||  // xchg ebx, edx
                code[1] == 0xD6 ||  // xchg esi, edx
                code[1] == 0xD7 ||  // xchg edx, edi
                code[1] == 0xD9 ||  // xchg ecx, ebx
                code[1] == 0xDA ||  // xchg ebx, edx
                code[1] == 0xDB ||  // xchg ebx, ebx
                code[1] == 0xDE ||  // xchg esi, ebx
                code[1] == 0xDF ||  // xchg ebx, edi
                code[1] == 0xF1 ||  // xchg ecx, esi
                code[1] == 0xF2 ||  // xchg edx, esi
                code[1] == 0xF3 ||  // xchg ebx, esi
                code[1] == 0xF7 ||  // xchg edi, esi
                code[1] == 0xF9 ||  // xchg ecx, edi
                code[1] == 0xFA ||  // xchg edx, edi
                code[1] == 0xFB ||  // xchg edi, esi
                code[1] == 0xFE)    // xchg ebx, edi
            {
                LSTRIP(code, 2);
                continue;
            }
        }
        // xchg one register with another.  in wrobot this is always repeated/inverted later
        else if (code[0] >= 0x91 && code[0] <= 0x97)
        {
            LSTRIP(code, 1);
            continue;
        }
        // simple NOP-equivalent mov statements
        else if (code[0] == 0x89)
        {
            if (code[1] == 0xC9 ||  // mov ecx, ecx
                code[1] == 0xD2 ||  // mov edx, edx
                code[1] == 0xDB ||  // mov ebx, ebx
                code[1] == 0xE4 ||  // mov esp, esp
                code[1] == 0xFF)    // mov edi, edi
            {
                LSTRIP(code, 2);
                continue;
            }
        }
        // near JMP past random junk
        else if (code[0] == 0xEB)   // JMP +1-0xFF
        {
            // not enough room? clear out anything left and finish
            if (code.size() < 2)
            {
                code.clear();
                return;
            }

            const unsigned int len = static_cast<unsigned int>(code[1]) + 2;

            LSTRIP(code, len);
            continue;
        }
        // far JMP past random junk
        else if (code[0] == 0xE9)
        {
            if (code.size() < 5)
            {
                code.clear();
                return;
            }

            const unsigned int len = *reinterpret_cast<unsigned int*>(&code[1]) + 5;

            LSTRIP(code, len);
            continue;
        }
        // short conditional jumps that always are followed by far jumps to the same place:
        // "JE", "JZ", "JNE", "JNZ", "JG", "JNLE", "JGE", "JNL", "JNGE", "JLE", "JNG", "JO", "JNO", "JP", "JPE", "JNP", "JPO", "JS"
        else if (code[0] == 0x70 ||
            code[0] == 0x71 ||
            code[0] == 0x74 ||
            code[0] == 0x75 ||
            code[0] == 0x78 ||
            code[0] == 0x7A ||
            code[0] == 0x7B ||
            code[0] == 0x7C ||
            code[0] == 0x7D ||
            code[0] == 0x7E ||
            code[0] == 0x7F)
        {
            const unsigned int target = static_cast<unsigned int>(code[1]) + 2;

            unsigned int secondJumpTarget = 0;

            // currently the far jump will come within 12 bytes
            for (auto i = 2u; i < 14; ++i)
            {
                if (code[i] == 0xE9)
                {
                    secondJumpTarget = *reinterpret_cast<unsigned int*>(&code[i + 1]) + 5;
                    break;
                }
                else if (code[i] == 0xEB)
                {
                    secondJumpTarget = static_cast<unsigned int>(code[i + 1]) + 2 + i;
                    break;
                }
            }

            if (secondJumpTarget && secondJumpTarget == target)
            {
                LSTRIP(code, target);
                continue;
            }
        }
        // these are instructions that are not part of the obfuscation.  so for now we will skip them and
        // deobfuscate whatever comes after them.  this will let us build up deobfuscated code.
        // pushfd.  this is currently not part of the obfuscation of wrobot but rather it appears to always be
        // the first non-obfuscated opcode.  therefore, lets skip it and debofuscate what comes after it.
        else if (code[0] == 0x9C || // pushfd
            code[0] == 0x60)   // pushad
        {
            std::vector<std::uint8_t> copy(code.begin() + 1, code.end());
            DeobfuscateAsm(copy);

            code.resize(1);
            code.insert(code.end(), copy.begin(), copy.end());

            // do nothing after this
            return;
        }

        // if we reach here, we haven't made any change.  stop
        break;
    } while (true);
#undef LSTRIP
}

// returns true when the given hook code is suspicious
bool ValidateEndSceneHook(std::vector<uint8> const& code)
{
    auto copy = code;

    // attempt asm deobfuscation to detect wrobot
    DeobfuscateAsm(copy);

    std::stringstream str;

    for (auto i = 0u; i < code.size(); ++i)
    {
        str << "0x" << std::hex << std::uppercase << std::setw(2) << std::setfill('0') << static_cast<int>(code[i]);

        if (i < code.size() - 1)
            str << " ";
    }

    sLog.Out(LOG_ANTICHEAT, LOG_LVL_DEBUG, "Deobfuscate debug.  Original code size: %u deobfuscated size: %u Code:\n%s",
        code.size(), copy.size(), str.str().c_str());

    // wrobot's deobfuscated endscene hook begins with pushfd, pushad.  if thats what this starts with,
    // assume it is wrobot, regardless of what comes after it.
    if (copy.size() >= 2 && copy[0] == 0x9C && copy[1] == 0x60)
        return true;

    return code.size() == 200 && copy.size() < 15;
}
}

void WardenWin::LoadScriptedScans()
{
    // sys info locate phase 2
    auto const wardenSysInfo2 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_sysInfo.dwOemId + offsets->OfsWardenWinSysInfo
             << static_cast<uint8>(sizeof(wardenWin->m_sysInfo));
    },
    // checker
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read SYSTEM_INFO");

            return true;
        }

        buff.read(reinterpret_cast<uint8*>(&wardenWin->m_sysInfo), sizeof(wardenWin->m_sysInfo));

        // for classic, tbc, and wotlk, the architecute should never be anything other than x86 (0)
        if (!!wardenWin->m_sysInfo.wProcessorArchitecture)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Incorrect architecture reported (%u)",
                wardenWin->m_sysInfo.wProcessorArchitecture);

            return true;
        }

        // for classic, tbc, and wotlk, the cpu type should never be anything other than i386, i486, or pentium (i586)
        if (wardenWin->m_sysInfo.dwProcessorType != 386 &&
            wardenWin->m_sysInfo.dwProcessorType != 486 &&
            wardenWin->m_sysInfo.dwProcessorType != 586)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Incorrect processor type: %u",
                wardenWin->m_sysInfo.dwProcessorType);

            return true;
        }

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(WIN_SYSTEM_INFO),
        "Sysinfo locate", ScanFlags::OffsetsInitialized, 0, UINT16_MAX);

    // sys info locate phase 1
    auto const wardenSysInfo1 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_wardenAddress + offsets->OfsWardenSysInfo
             << static_cast<uint8>(sizeof(wardenWin->m_sysInfo.dwOemId));
    },
    // checker
    [wardenSysInfo2](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read warden->SysInfo");

            return true;
        }

        // borrow this memory temporarily
        wardenWin->m_sysInfo.dwOemId = buff.read<uint32>();

        // immediately third second stage
        wardenWin->EnqueueScans({ wardenSysInfo2 });

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(uint32),
        "Intermediate sysinfo locate", ScanFlags::OffsetsInitialized, 0, UINT16_MAX);

    // find warden module
    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << offsets->WardenModule
             << static_cast<uint8>(sizeof(wardenWin->m_wardenAddress));
    },
    // checker
    [wardenSysInfo1](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read s_moduleInterface");

            return true;
        }

        wardenWin->m_wardenAddress = buff.read<uint32>();

        // immediately enqueue second stage
        wardenWin->EnqueueScans({ wardenSysInfo1 });

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(uint32),
        "Warden locate", ScanFlags::OffsetsInitialized | ScanFlags::InitialLogin, 0, UINT16_MAX));

    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << offsets->WorldEnables
             << static_cast<uint8>(sizeof(wardenWin->m_wardenAddress));
    },
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read CWorld::enables");

            return true;
        }

        auto const val = buff.read<uint32>();

        // if any required flags are missing, or prohibited flags are present
        if ((val & Required) != Required || !!(val & Prohibited))
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "CWorld::enables expected 0x%lx prohibited 0x%lx received 0x%lx",
                Required, Prohibited, val);

            return true;
        }

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8),
    sizeof(uint32), "CWorld::enables hack", ScanFlags::OffsetsInitialized, 0, UINT16_MAX));

    // read game time and last hardware action time together
    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        // NOTE: the order of these two scans is important because the client will not perform the checks
        // at the same time, and we want to safely assume that the last hardware action time is not
        // greater than the current time

        // last hardware action time
        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << offsets->LastHardwareAction
             << static_cast<uint8>(sizeof(uint32));

        // game time
        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[CHECK_TIMING_VALUES] ^ wardenWin->GetXor());
    },
    // checker
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        if (!!buff.read<uint8>())
        {
            sLog.OutWarden(wardenWin, LOG_LVL_DEBUG, "Timing check failed to read CSimpleTop::m_eventTime");
            return true;
        }

        auto const lastHardwareAction = buff.read<uint32>();

        auto const timeResult = buff.read<uint8>();
        auto const currentTime = buff.read<uint32>();

        if (!timeResult)
        {
            // the timing check can fail for innocuous reasons like running under wine, within a virtual machine,
            // or in XP compatibility mode.  there are probably other causes too.  therefore let us ignore this
            // failure, since the clock desync check will catch this same case if the clock is moving at an
            // unfair speed.
            sLog.OutWarden(wardenWin, LOG_LVL_DEBUG, "Timing check failed");
            return false;
        }

        // last hardware action cannot legitimately be past the current time
        if (lastHardwareAction > currentTime)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Current time: %u Last hardware action: %u (last hardware action in the future)",
                currentTime, lastHardwareAction);
            return true;
        }

        wardenWin->m_lastClientTime = currentTime;
        wardenWin->m_lastHardwareActionTime = lastHardwareAction;
        wardenWin->m_lastTimeCheckServer = WorldTimer::getMSTime();

        return false;
    }, 11, 10, "Anti-AFK hack", ScanFlags::OffsetsInitialized, 0, UINT16_MAX));

    // check for hypervisors
    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        MANGOS_ASSERT(strings.size() + HypervisorCount < 0xFF);

        auto const winWarden = reinterpret_cast<WardenWin const*>(warden);
        auto const opcode = static_cast<uint8>(winWarden->GetModule()->opcodes[FIND_DRIVER_BY_NAME] ^ winWarden->GetXor());

        for (auto i = 0u; i < HypervisorCount; ++i)
        {
            auto const& hypervisor = Hypervisors[i];

            strings.emplace_back(hypervisor.Driver);

            auto const seed = static_cast<uint32>(rand32());

            scan << opcode << seed;

            HMACSHA1 hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
            hash.UpdateData(hypervisor.DeviceName);
            hash.Finalize();

            scan.append(hash.GetDigest(), hash.GetLength());
            scan << static_cast<uint8>(strings.size());
        }
    },
    // checker
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const winWarden = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        winWarden->m_hypervisors = "";

        for (auto i = 0u; i < HypervisorCount; ++i)
        {
            auto const found = buff.read<uint8>() == 0x4A;

            if (!found)
                continue;

            winWarden->m_hypervisors += Hypervisors[i].Name;
        }

        // always return false because there is nothing necessary wrong with using a hypervisor
        return false;
    },
    // TODO: Replace the magic number below with combined driver string lengths
    (sizeof(uint8) + sizeof(uint32) + SHA_DIGEST_LENGTH + sizeof(uint8)) * HypervisorCount + 21,
    sizeof(uint8) * HypervisorCount,
    "Hypervisor check",
    ScanFlags::InitialLogin, 0, UINT16_MAX));

    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>& strings, ByteBuffer& scan)
    {
        auto const seed = static_cast<uint32>(rand32());

        scan << static_cast<uint8>(warden->GetModule()->opcodes[FIND_CODE_BY_HASH] ^ warden->GetXor())
             << seed;

        static constexpr std::uint8_t pattern[] =
        {
            0x56, 0x57, 0xFC, 0x8B, 0x54, 0x24, 0x14, 0x8B,
            0x74, 0x24, 0x10, 0x8B, 0x44, 0x24, 0x0C, 0x8B,
            0xCA, 0x8B, 0xF8, 0xC1, 0xE9, 0x02, 0x74, 0x02,
            0xF3, 0xA5, 0xB1, 0x03, 0x23, 0xCA, 0x74, 0x02,
            0xF3, 0xA4, 0x5F, 0x5E, 0xC3
        };

        static_assert(sizeof(pattern) <= 0xFF, "pattern length must fit into 8 bits");

        HMACSHA1 hash(reinterpret_cast<uint8 const*>(&seed), sizeof(seed));
        hash.UpdateData(&pattern[0], sizeof(pattern));
        hash.Finalize();

        scan.append(hash.GetDigest(), hash.GetLength());

        scan << warden->GetModule()->memoryRead << static_cast<uint8>(sizeof(pattern));
    },
    // checker
    [] (Warden const* warden, ByteBuffer& buff)
    {
        auto const found = buff.read<uint8>() == WindowsCodeScan::PatternFound;

        // if this is not found, it means someone has tampered with the function
        return !found;
    }, sizeof(uint8) + sizeof(uint32) + SHA_DIGEST_LENGTH + sizeof(uint32) + sizeof(uint8), sizeof(uint8),
    "Warden Memory Read check",
    ScanFlags::None, 0, UINT16_MAX));

    // end scene hook check 1
    static constexpr uint8 endSceneReadSize = 16u;
    auto const endSceneHookCheck1 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);

        // if we have not found EndScene, do nothing
        if (!wardenWin->m_endSceneFound)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_endSceneAddress
             << endSceneReadSize;
    },
    // checker
    [](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read EndScene (hook check stage 1)");

            return true;
        }

        std::vector<uint8> code(endSceneReadSize);
        buff.read(&code[0], code.size());

        wardenWin->ValidateEndScene(code);

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + endSceneReadSize,
    "EndScene hook check stage 1", ScanFlags::None, 0, UINT16_MAX);

    sWardenScanMgr.AddWindowsScan(endSceneHookCheck1);

    // end scene locate phase 4
    auto const endSceneLocate4 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_endSceneAddress + offsets->OfsDevice4
             << static_cast<uint8>(sizeof(uint32));
    },
    // checker
    [endSceneHookCheck1](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read EndScene (stage 4)");

            return true;
        }

        wardenWin->m_endSceneAddress = buff.read<uint32>();
        wardenWin->m_endSceneFound = true;

        // immediately request hook check
        wardenWin->EnqueueScans({ endSceneHookCheck1 });

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(uint32),
    "EndScene locate stage 4", ScanFlags::OffsetsInitialized, 0, UINT16_MAX);

    // end scene locate phase 3
    auto const endSceneLocate3 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_endSceneAddress + offsets->OfsDevice3
             << static_cast<uint8>(sizeof(uint32));
    },
    // checker
    [endSceneLocate4](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read EndScene (stage 3)");

            return true;
        }

        wardenWin->m_endSceneAddress = buff.read<uint32>();

        // immediately request fourth stage
        wardenWin->EnqueueScans({ endSceneLocate4 });

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(uint32),
    "EndScene locate stage 3", ScanFlags::OffsetsInitialized, 0, UINT16_MAX);

    // end scene locate phase 2
    auto const endSceneLocate2 = std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << wardenWin->m_endSceneAddress + offsets->OfsDevice2
             << static_cast<uint8>(sizeof(uint32));
    },
    // checker
    [endSceneLocate3](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read EndScene (stage 2)");

            return true;
        }

        wardenWin->m_endSceneAddress = buff.read<uint32>();

        // immediately request third stage
        wardenWin->EnqueueScans({ endSceneLocate3 });

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8), sizeof(uint8) + sizeof(uint32),
    "EndScene locate stage 2", ScanFlags::OffsetsInitialized, 0, UINT16_MAX);

    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
    // builder
    [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
             << static_cast<uint8>(0)
             << offsets->g_theGxDevicePtr
             << static_cast<uint8>(sizeof(uint32));
    },
    // checker
    [endSceneLocate2](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read g_theGxDevicePtr");

            return true;
        }

        buff.read(reinterpret_cast<uint8*>(&wardenWin->m_endSceneAddress), sizeof(wardenWin->m_endSceneAddress));

        // if for some reason we get nullptr, abort
        if (!wardenWin->m_endSceneAddress)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "g_theGxDevicePtr is nullptr");
            return true;
        }

        // immediately request second stage
        wardenWin->EnqueueScans({ endSceneLocate2 });

        return false;
    },
    sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8),
    sizeof(uint8) + sizeof(uint32),
    "EndScene locate stage 1", ScanFlags::OffsetsInitialized | ScanFlags::InitialLogin, 0, UINT16_MAX));

    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsModuleScan>("prxdrvpe.dll",
    // checker
    Scan::CheckT([](Warden const* warden, ByteBuffer& buff)
    {
        if (buff.read<uint8>() == WindowsModuleScan::ModuleFound)
        {
            auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));
            wardenWin->m_proxifierFound = true;

            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Proxifier found");
        }

        return false;
    }), "Proxifier check", ScanFlags::OffsetsInitialized | ScanFlags::InitialLogin, 0, UINT16_MAX));

    // click to move enabled check
    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsScan>(
        // builder
        [](Warden const* warden, std::vector<std::string>&, ByteBuffer& scan)
    {
        // no need to scan multiple times
        if (warden->HasUsedClickToMove())
            return;

        auto const wardenWin = reinterpret_cast<WardenWin const*>(warden);
        auto const offsets = GetClientOffets(wardenWin->m_clientBuild);

        if (!offsets)
            return;

        scan << static_cast<uint8>(wardenWin->GetModule()->opcodes[READ_MEMORY] ^ wardenWin->GetXor())
            << static_cast<uint8>(0)
            << offsets->ClickToMovePosition
            << static_cast<uint8>(sizeof(float) * 3);
    },
        // checker
        [](Warden const* warden, ByteBuffer& buff)
    {
        auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

        auto const result = buff.read<uint8>();

        if (!!result)
        {
            sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read click to move position!");
            return true;
        }

        float positionX = buff.read<float>();
        float positionY = buff.read<float>();
        float positionZ = buff.read<float>();
        if (positionX || positionY || positionZ)
            warden->SetHasUsedClickToMove();

        return false;
    }, sizeof(uint8) + sizeof(uint8) + sizeof(uint32) + sizeof(uint8),
       sizeof(uint8) + sizeof(float) + sizeof(float) + sizeof(float),
        "Click To Move Position", ScanFlags::OffsetsInitialized, 0, UINT16_MAX));

    // maiev string hashing
    sWardenScanMgr.AddWindowsScan(std::make_shared<WindowsStringHashScan>());
}

void WardenWin::BuildLuaInit(std::string const& module, bool fastcall, uint32 offset, ByteBuffer& out) const
{
    uint16 const len = 1 + 1 + 1 + module.length() + 4 + 1;

    out = ByteBuffer(1 + 2 + 4 + len);

    out << static_cast<uint8>(WARDEN_SMSG_MODULE_INITIALIZE)
        << static_cast<uint16>(len)
        << static_cast<uint32>(0)   // checksum placeholder
        << static_cast<uint8>(4)
        << static_cast<uint8>(0)
        << static_cast<uint8>(module.length());

    // avoid writing null terminator
    out.append(module.c_str(), module.length());

    out << offset
        << static_cast<uint8>(fastcall ? 0 : 1);

    // write checksum
    auto const oldwpos = out.wpos();
    out.wpos(3);
    out << BuildChecksum(out.contents() + 7, len);
    out.wpos(oldwpos);
}

void WardenWin::BuildFileHashInit(std::string const& module, bool asyncparam, uint32 openOffset,
    uint32 sizeOffset, uint32 readOffset, uint32 closeOffset, ByteBuffer& out) const
{
    uint16 const len = 1 + 1 + 1 + 1 + module.length() + 4 + 4 + 4 + 4;

    out = ByteBuffer(1 + 2 + 4 + len);

    out << static_cast<uint8>(WARDEN_SMSG_MODULE_INITIALIZE)
        << static_cast<uint16>(len)
        << static_cast<uint32>(0)   // checksum placeholder
        << static_cast<uint8>(1)
        << static_cast<uint8>(0)
        << static_cast<uint8>(asyncparam ? 2 : 1)
        << static_cast<uint8>(module.length());

    // avoid writing null terminator
    out.append(module.c_str(), module.length());

    out << openOffset
        << sizeOffset
        << readOffset
        << closeOffset;

    // write checksum
    auto const oldwpos = out.wpos();
    out.wpos(3);
    out << BuildChecksum(out.contents() + 7, len);
    out.wpos(oldwpos);
}

void WardenWin::BuildTimingInit(std::string const& module, uint32 offset, bool set, ByteBuffer& out) const
{
    uint16 const len = 1 + 1 + 1 + module.length() + 4 + 1;

    out = ByteBuffer(1 + 2 + 4 + len);

    out << static_cast<uint8>(WARDEN_SMSG_MODULE_INITIALIZE)
        << static_cast<uint16>(len)
        << static_cast<uint32>(0)   // checksum placeholder
        << static_cast<uint8>(1)
        << static_cast<uint8>(1)
        << static_cast<uint8>(module.length());

    // avoid writing null terminator
    out.append(module.c_str(), module.length());

    out << offset << static_cast<uint8>(set ? 1 : 0);

    // write checksum
    auto const oldwpos = out.wpos();
    out.wpos(3);
    out << BuildChecksum(out.contents() + 7, len);
    out.wpos(oldwpos);
}

WardenWin::WardenWin(WorldSession* session, BigNumber const& K) :
    m_wardenAddress(0), Warden(session, sWardenModuleMgr.GetWindowsModule(), K),
    m_lastClientTime(0), m_lastHardwareActionTime(0), m_lastTimeCheckServer(0), m_sysInfoSaved(false),
    m_proxifierFound(false), m_hypervisors(""), m_endSceneFound(false), m_endSceneAddress(0), m_offsetsInitialized(false)
{
    memset(&m_sysInfo, 0, sizeof(m_sysInfo));
}

// read the dx9 EndScene binary code to look for bad stuff
void WardenWin::ValidateEndScene(std::vector<uint8> const& code)
{
    auto p = &code[0];

    // skip any NOPs
    while (*p == 0x90) ++p;

    auto const nopCount = static_cast<int>(p - &code[0]);

    static constexpr size_t codeRequestLength = 200u;

    // int3 breakpoint
    if (*p == 0xCC)
    {
        sLog.OutWarden(this, LOG_LVL_BASIC, "Detected INT3 EndScene hook.  NOP count = %d.",
            nopCount);
    }
    // JMP hook
    else if (*p == 0xE9)
    {
        auto const dest = *reinterpret_cast<uint32 const*>(p + 1);

        auto const absoluteDest = m_endSceneAddress + nopCount + dest + 5;
        sLog.OutWarden(this, LOG_LVL_BASIC, "Detected JMP EndScene hook.  NOP count = %d.",
            nopCount);

        // request a custom scan just to check the JMP destination
        EnqueueScans({ std::make_shared<WindowsMemoryScan>(absoluteDest, codeRequestLength,
        // checker
        [](Warden const* warden, ByteBuffer& buff)
        {
            auto const wardenWin = const_cast<WardenWin*>(reinterpret_cast<WardenWin const*>(warden));

            auto const result = buff.read<uint8>();

            if (!!result)
            {
                sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Failed to read EndScene hook code");
                return true;
            }

            std::vector<uint8> code(codeRequestLength);

            buff.read(&code[0], code.size());

            if (ValidateEndSceneHook(code))
                sLog.OutWarden(wardenWin, LOG_LVL_BASIC, "Suspicious EndScene.  Probable bot.");

            return false;
        }, "EndScene hook validate scan", ScanFlags::None, 0, UINT16_MAX) });
    }
}

ScanFlags WardenWin::GetScanFlags() const
{
    ScanFlags scanFlags = ScanFlags::Windows;

    if (m_maiev)
        scanFlags = scanFlags | ScanFlags::Maiev;

    if (m_offsetsInitialized)
        scanFlags = scanFlags | ScanFlags::OffsetsInitialized;

    return scanFlags;
}

void WardenWin::InitializeClient()
{
    if (m_module)
    {
        // should never call this while still using maiev
        MANGOS_ASSERT(!m_maiev);

        if (auto const offsets = GetClientOffets(m_clientBuild))
        {
            // initialize lua
            ByteBuffer lua;
            BuildLuaInit("", true, offsets->GetText, lua);

            // initialize SFile*
            ByteBuffer file;
            BuildFileHashInit("", true, offsets->Open, offsets->Size, offsets->Read, offsets->Close, file);

            // initialize timing check
            ByteBuffer timing;
            BuildTimingInit("", offsets->TickCount, true, timing);

            ByteBuffer pkt(lua.wpos() + file.wpos() + timing.wpos());

            pkt.append(lua);
            pkt.append(file);
            pkt.append(timing);

            SendPacket(pkt);

            m_offsetsInitialized = true;
            sLog.OutWarden(this, LOG_LVL_DEBUG, "Initialized module offsets.");
        }
    }

    m_initialized = true;
}

void WardenWin::Update()
{
    Warden::Update();

    if (!m_initialized)
    {
        if (m_maiev && !TimeoutClockStarted())
        {
            RequestScans(SelectScans(ScanFlags::Maiev));

            if (!m_module)
                BeginScanClock();
        }
        return;
    }

    // 'lpMaximumApplicationAddress' should never be zero if the structure has been read
    if (!m_sysInfoSaved && !!m_sysInfo.lpMaximumApplicationAddress)
    {
        auto activeProcCount = 0;
        for (auto i = 0; i < 8 * sizeof(m_sysInfo.dwActiveProcessorMask); ++i)
            if (!!(m_sysInfo.dwActiveProcessorMask & (1 << i)))
                ++activeProcCount;

        LogsDatabase.BeginTransaction();

        static SqlStatementID fingerprintUpdate;

        auto stmt = LogsDatabase.CreateStatement(fingerprintUpdate,
            "INSERT INTO `system_fingerprint_usage` (`fingerprint`, `account`, `ip`, `realm`, `architecture`, `cputype`, `activecpus`, `totalcpus`, `pagesize`) "
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");

        stmt.addUInt32(0); // fingerprint not implemented
        stmt.addUInt32(m_accountId);
        stmt.addString(m_sessionIP);
        stmt.addUInt32(realmID);
        stmt.addString(ArchitectureString(m_sysInfo.wProcessorArchitecture));
        stmt.addString(CPUTypeAndRevision(m_sysInfo.dwProcessorType, m_sysInfo.wProcessorRevision));
        stmt.addUInt32(activeProcCount);
        stmt.addUInt32(m_sysInfo.dwNumberOfProcessors);
        stmt.addUInt32(m_sysInfo.dwPageSize);
        stmt.Execute();

        LogsDatabase.CommitTransaction();

        //_session->CleanupFingerprintHistory();

        m_sysInfoSaved = true;

        // at this point if we have the character enum packet, it is okay to send
        if (!m_charEnum.empty())
        {
            sWorld.GetMessager().AddMessage([pkt = std::move(m_charEnum), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
            {
                if (WorldSession* session = world->FindSession(accountId))
                {
                    if (session->GetGUID() == sessionGuid)
                        session->SendPacket(&pkt);
                }
            });
            m_charEnum.clear();
        }
    }
}

void WardenWin::SetCharEnumPacket(WorldPacket&& packet)
{
    // if we have already recorded system information, send the packet immediately.  otherwise delay
    if (m_sysInfoSaved)
    {
        sWorld.GetMessager().AddMessage([pkt = std::move(packet), accountId = m_accountId, sessionGuid = m_sessionGuid](World* world)
        {
            if (WorldSession* session = world->FindSession(accountId))
            {
                if (session->GetGUID() == sessionGuid)
                    session->SendPacket(&pkt);
            }
        });
    }
    else
        m_charEnum = std::move(packet);
}

void WardenWin::GetPlayerInfo(std::string& clock, std::string& fingerprint, std::string& hypervisors,
    std::string& endscene, std::string& proxifier) const
{
    if (!!m_lastTimeCheckServer)
    {
        std::stringstream s;
        s << "Last hardware action: " << m_lastHardwareActionTime
            << " client time: " << m_lastClientTime
            << " idle time: " << (m_lastClientTime - m_lastHardwareActionTime) / 1000
            << " seconds info age: " << WorldTimer::getMSTimeDiffToNow(m_lastTimeCheckServer) / 1000
            << " seconds";
        clock = s.str();
    }

    // 'lpMaximumApplicationAddress' should never be zero if the structure has been read
    if (!!m_sysInfo.lpMaximumApplicationAddress)
    {
        std::stringstream s;

        s << "Architecture: " << ArchitectureString(m_sysInfo.wProcessorArchitecture)
            << " CPU Type: " << CPUTypeAndRevision(m_sysInfo.dwProcessorType, m_sysInfo.wProcessorRevision)
            << " Page Size: 0x" << std::hex << std::uppercase << m_sysInfo.dwPageSize << std::dec;

        auto activeProcCount = 0;
        for (auto i = 0; i < 8*sizeof(m_sysInfo.dwActiveProcessorMask); ++i)
            if (!!(m_sysInfo.dwActiveProcessorMask & (1 << i)))
                ++activeProcCount;

        s << " Active CPUs: " << activeProcCount;
        s << " Total CPUs: " << m_sysInfo.dwNumberOfProcessors;

        fingerprint = s.str();
    }

    if (m_hypervisors.length() > 0)
        hypervisors = "Hypervisor(s) found: " + m_hypervisors;

    if (m_endSceneFound)
    {
        std::stringstream s;
        s << "EndScene: 0x" << std::hex << m_endSceneAddress;
        endscene = s.str();
    }

    if (m_proxifierFound)
        proxifier = "Proxifier is running";
}
