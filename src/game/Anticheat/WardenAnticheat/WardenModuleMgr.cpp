/*
 * Copyright (C) 2017-2018 namreeb (legal@namreeb.org)
 *
 * This is private software and may not be shared under any circumstances,
 * absent permission of namreeb.
 */

#include "WardenModuleMgr.hpp"
#include "WardenModule.hpp"

#include "Platform/Define.h"
#include "Policies/SingletonImp.h"
#include "Util.h"
#include "World.h"

#include <ace/OS_NS_dirent.h>

#include <vector>
#include <string>
#include <fstream>

INSTANTIATE_SINGLETON_1(WardenModuleMgr);

namespace
{
std::vector<std::string> GetModuleNames(const std::string &moduleDir)
{
    ACE_DIR *dirp = ACE_OS::opendir(ACE_TEXT(moduleDir.c_str()));

    std::vector<std::string> results;

    if (dirp)
    {
        ACE_DIRENT *dp;

        // look only for .bin files, and assume (for now) that the corresponding .key and .cr files exist
        while (!!(dp = ACE_OS::readdir(dirp)))
            if (!memcmp(&dp->d_name[strlen(dp->d_name) - 4], ".bin", 4))
                results.emplace_back(moduleDir + "/" + dp->d_name);

#ifndef _WIN32
        // this causes a crash on Windows, so just accept a minor memory leak for now
        ACE_OS::closedir(dirp);
#endif
    }

    return results;
}
}

WardenModuleMgr::WardenModuleMgr()
{
    auto const moduleDir = sWorld.GetWardenModuleDirectory();
    auto const modules = GetModuleNames(moduleDir);

    for (auto const &mod : modules)
    {
        auto const key = mod.substr(0, mod.length() - 3) + "key";
        auto const cr = mod.substr(0, mod.length() - 3) + "cr";

        try
        {
            auto newMod = WardenModule(mod, key, cr);

            if (newMod.Windows())
                _winModules.emplace_back(std::move(newMod));
            else
                _macModules.emplace_back(std::move(newMod));
        }
        catch (const std::runtime_error &)
        {
            continue;
        }
    }
}

const WardenModule *WardenModuleMgr::GetWindowsModule() const
{
    MANGOS_ASSERT(!_winModules.empty());

    return &_winModules[urand(0, _winModules.size() - 1)];
}

const WardenModule *WardenModuleMgr::GetMacModule() const
{
    MANGOS_ASSERT(!_macModules.empty());

    return &_macModules[urand(0, _macModules.size() - 1)];
}