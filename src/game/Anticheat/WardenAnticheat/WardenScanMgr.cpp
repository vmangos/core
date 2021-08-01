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

#include "WardenScanMgr.hpp"
#include "WardenScan.hpp"
#include "Warden.hpp"

#include "Policies/SingletonImp.h"
#include "Database/DatabaseEnv.h"
#include "World.h"

#include <vector>
#include <algorithm>

INSTANTIATE_SINGLETON_1(WardenScanMgr);

namespace
{
bool BuildRawData(const std::string &hexData, std::vector<uint8> &out)
{
    if (!!(hexData.length() % 2))
        return false;

    auto curr = hexData;

    out.resize(hexData.length() / 2);

    for (auto i = 0; i < out.size(); ++i)
    {
        auto const byte = curr.substr(0, 2);
        curr = curr.substr(2);

        auto const a = byte[0];
        auto const b = byte[1];

        unsigned int an;
        if (a >= '0' && a <= '9')
            an = a - '0';
        else if (a >= 'A' && a <= 'F')
            an = 10 + a - 'A';
        else
            return false;

        unsigned int bn;
        if (b >= '0' && b <= '9')
            bn = b - '0';
        else if (b >= 'A' && b <= 'F')
            bn = 10 + b - 'A';
        else
            return false;

        out[i] = static_cast<uint8>(an * 16 + bn);
    }

    return true;
}
}

void WardenScanMgr::loadFromDB()
{
    //                                         0     1       2      3       4          5         6         7        8          9
    auto result = WorldDatabase.Query("SELECT `id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment` FROM `warden_scans`");

    // copy any non-database scans into a placeholder
    std::vector<std::shared_ptr<const Scan> > new_scans;
    new_scans.reserve(m_scans.size());

    for (auto const &s : m_scans)
        if (!(s->flags & ScanFlags::FromDatabase))
            new_scans.push_back(std::move(s));

    m_scans = std::move(new_scans);

    do
    {
        auto fields = result->Fetch();

        auto const id = fields[0].GetUInt16();
        auto const scanType = fields[1].GetUInt16();

        if (scanType >= MAX_SCAN_TYPE)
        {
            sLog.outError("Unknown Warden scan type %u.  Skipped.", scanType);
            continue;
        }

        Scan *scan = nullptr;

        auto const offset = fields[4].GetUInt32();
        auto const length = fields[5].GetUInt32();
        auto const flags = static_cast<ScanFlags>(fields[7].GetUInt32()) | ScanFlags::FromDatabase;
        int8 penalty = fields[8].GetUInt8();
        auto const comment = fields[9].GetCppString();

        if (penalty < WARDEN_ACTION_LOG || penalty >= WARDEN_ACTION_MAX)
            penalty = sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_DEFAULT_PENALTY);

        switch (scanType)
        {
            case READ_MEMORY:
            {
                std::vector<uint8> expected;

                if (!BuildRawData(fields[6].GetCppString(), expected) || expected.size() != length)
                {
                    sLog.outError("Failed to parse expected value in Warden scan id %u", id);
                    continue;
                }

                auto const moduleName = fields[2].GetCppString();

                // optional for this scan to specify a module name to use as a base
                if (moduleName.empty())
                    scan = new WindowsMemoryScan(offset, &expected[0], expected.size(), comment, flags);
                else
                    scan = new WindowsMemoryScan(moduleName, offset, &expected[0], expected.size(), comment, flags);

                break;
            }

            case FIND_MODULE_BY_NAME:
            {
                auto const moduleName = fields[2].GetCppString();
                auto const wanted = fields[6].GetBool();

                scan = new WindowsModuleScan(moduleName, wanted, comment, flags);
                break;
            }

            case FIND_MEM_IMAGE_CODE_BY_HASH:
            case FIND_CODE_BY_HASH:
            {
                auto const wanted = fields[6].GetBool();

                std::vector<uint8> pattern;
                if (!BuildRawData(fields[3].GetCppString(), pattern))
                {
                    sLog.outError("Failed to parse expected value in Warden scan id %u", id);
                    continue;
                }

                scan = new WindowsCodeScan(offset, pattern, scanType == FIND_MEM_IMAGE_CODE_BY_HASH, wanted, comment, flags);
                break;
            }

            case HASH_CLIENT_FILE:
            {
                auto const filename = fields[2].GetCppString();

                std::vector<uint8> expected;
                if (!BuildRawData(fields[6].GetCppString(), expected))
                {
                    sLog.outError("Failed to parse expected value in Warden scan id %u", id);
                    continue;
                }

                scan = new WindowsFileHashScan(filename, &expected[0], !expected.empty(), comment, flags);
                break;
            }

            case GET_LUA_VARIABLE:
            {
                auto const variable = fields[2].GetCppString();
                auto const expected = fields[3].GetCppString();

                if (expected.empty())
                    scan = new WindowsLuaScan(variable, fields[6].GetBool(), comment, flags);
                else
                    scan = new WindowsLuaScan(variable, expected, comment, flags);

                break;
            }

            case API_CHECK:
            {
                auto const module = fields[2].GetCppString();
                auto const proc = fields[3].GetCppString();
                
                std::vector<uint8> hash;
                if (!BuildRawData(fields[6].GetCppString(), hash))
                {
                    sLog.outError("Failed to parse expected value in Warden scan id %u", id);
                    continue;
                }

                scan = new WindowsHookScan(module, proc, &hash[0], offset, length, comment, flags);
            }

            case FIND_DRIVER_BY_NAME:
            {
                auto const driver = fields[2].GetCppString();
                auto const path = fields[3].GetCppString();
                auto const wanted = fields[6].GetBool();

                scan = new WindowsDriverScan(driver, path, wanted, comment, flags);
                break;
            }

            default:
            {
                sLog.outError("Unhandled Warden scan type %u id %u.  Skipped.", scanType, id);
                continue;
            }
        }

        if (!scan)
        {
            sLog.outError("Failed to allocate Warden scan type %u id %u", scanType, id);
            continue;
        }
        else
        {
            scan->checkId = id;
            scan->penalty = WardenActions(penalty);
        }

        m_scans.emplace_back(std::shared_ptr<const Scan>(scan));
    } while (result->NextRow());

    sLog.outBasic(">> %u Warden scans loaded from world database", m_scans.size());
}

void WardenScanMgr::AddMacScan(const MacScan *scan)
{
    m_scans.push_back(std::shared_ptr<const MacScan>(scan));
}

void WardenScanMgr::AddMacScan(std::shared_ptr<MacScan> scan)
{
    m_scans.push_back(scan);
}

void WardenScanMgr::AddWindowsScan(const WindowsScan *scan)
{
    m_scans.push_back(std::shared_ptr<const WindowsScan>(scan));
}

void WardenScanMgr::AddWindowsScan(std::shared_ptr<WindowsScan> scan)
{
    m_scans.push_back(scan);
}

std::vector<std::shared_ptr<const Scan>> WardenScanMgr::GetRandomScans(ScanFlags flags) const
{
    std::vector<std::shared_ptr<const Scan>> matches;
    matches.reserve(m_scans.size());

    // save those scans which match the requested flags
    for (auto const &scan : m_scans)
    {
        auto const buildMask = scan->flags & (WinAllBuild | MacAllBuild);

        // does the build part of the flags match? if not, continue
        if (!(flags & buildMask))
            continue;

        // if the scan is an initial-login scan, and that wasn't explicitly requested, do not include it
        if ((scan->flags & InitialLogin) && !(flags & InitialLogin))
            continue;

        // if the scan is not an initial-login scan, and that was explicitly requested, do not include it
        if (!(scan->flags & InitialLogin) && (flags & InitialLogin))
            continue;

        // if the scan is an in-world scan, and that wasn't explicitly requested, do not include it
        if (!!(scan->flags & InWorld) && !(flags & InWorld))
            continue;

        matches.push_back(scan);
    }

    // randomize the order of matching scans
    std::random_shuffle(matches.begin(), matches.end());

    // determine how many of the identified scans we can fit into the client's request and response buffers
    size_t request = 0, reply = 0;

    // if we have matched too many, shrink.  this will probably be shrunk even further, depending on buffer sizes
    if (matches.size() >= sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_NUM_SCANS))
        matches.resize(sWorld.getConfig(CONFIG_UINT32_AC_WARDEN_NUM_SCANS));

    for (auto i = 0u; i < matches.size(); ++i)
    {
        auto const &scan = matches[i];

        // if by including the current scan, the request or reply would become too large, stop here, shrinking the results to size
        if (request + scan->requestSize > Warden::MaxRequest || reply + scan->replySize > Warden::MaxReply)
        {
            matches.resize(i);
            break;
        }

        request += scan->requestSize;
        reply += scan->replySize;
    }

    return std::move(matches);
}