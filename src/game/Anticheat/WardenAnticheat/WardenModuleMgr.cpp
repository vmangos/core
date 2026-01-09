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

#include "WardenModuleMgr.hpp"
#include "WardenModule.hpp"

#include "Platform/Define.h"
#include "Policies/SingletonImp.h"
#include "Util.h"
#include "World.h"
#include "Log.h"

#include "IO/Filesystem/FileSystem.h"

#include <vector>
#include <string>
#include <fstream>

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1

INSTANTIATE_SINGLETON_1(WardenModuleMgr);

std::vector<std::string> GetModuleNames(std::string const& moduleDir)
{
    // Get all the files in warden folder, might also include ".cr" or ".key" files
    std::vector<std::string> result = IO::Filesystem::GetAllFilesInFolder(moduleDir, IO::Filesystem::OutputFilePath::FullFilePath);

    // Remove all elements that don't end with ".bin"
    std::function<bool(std::string const& filePath)> MustEndWithBin = [](const std::string &s) { return s.size() < 4 || s.substr(s.size() - 4) != ".bin"; };
    result.erase(std::remove_if(result.begin(), result.end(), MustEndWithBin), result.end());

    return result;
}

WardenModuleMgr::WardenModuleMgr()
{
    auto const moduleDir = sWorld.GetWardenModuleDirectory();
    auto const modules = GetModuleNames(moduleDir);

    for (auto const& mod : modules)
    {
        auto const key = mod.substr(0, mod.length() - 3) + "key";
        auto const cr = mod.substr(0, mod.length() - 3) + "cr";

        try
        {
            auto newMod = WardenModule(mod, key, cr);

            if (newMod.Windows())
                m_winModules.emplace_back(std::move(newMod));
            else
                m_macModules.emplace_back(std::move(newMod));
        }
        catch (std::runtime_error const& e)
        {
            sLog.Out(LOG_ANTICHEAT, LOG_LVL_ERROR, "Failed to load %s - %s\n", mod.c_str(), e.what());
            continue;
        }
    }

    bool isMissingModules = false;

    if (m_winModules.empty() && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_WIN_ENABLED))
    {
        sLog.Out(LOG_ANTICHEAT, LOG_LVL_ERROR, "No Windows Warden module found - reduced cheat detection capabilities! Check your `Warden.ModuleDir` in config!");
        isMissingModules = true;
    }

    if (m_macModules.empty() && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_OSX_ENABLED))
    {
        sLog.Out(LOG_ANTICHEAT, LOG_LVL_ERROR, "No macOS Warden module found - reduced cheat detection capabilities! Check your `Warden.ModuleDir` in config!");
        isMissingModules = true;
    }

    if (isMissingModules)
    {
        sLog.WaitBeforeContinueIfNeed();
    }
}

WardenModule const* WardenModuleMgr::GetWindowsModule() const
{
    if (m_winModules.empty())
        return nullptr;

    return &m_winModules[urand(0, m_winModules.size() - 1)];
}

WardenModule const* WardenModuleMgr::GetMacModule() const
{
    if (m_macModules.empty())
        return nullptr;

    return &m_macModules[urand(0, m_macModules.size() - 1)];
}

#endif
