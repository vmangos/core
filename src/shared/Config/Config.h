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

#ifndef CONFIG_H
#define CONFIG_H

#include "Common.h"
#include "Platform/Define.h"
#include "Policies/SingletonImp.h"
#include "Policies/ThreadingModel.h"
#include <shared_mutex>
#include <unordered_map>

class Config
{
public:
    using Lock = MaNGOS::ClassLevelLockable<Config, std::shared_timed_mutex>;

    bool LoadFromFile(std::string const& filename);
    bool Reload();

    std::string GetStringDefault(char const* name, char const* def);
    bool GetBoolDefault(char const* name, bool def = false);
    int32 GetIntDefault(char const* name, int32 def);
    float GetFloatDefault(char const* name, float def);

    std::string GetFilename() const { return m_fileName; }
    bool GetValueHelper(char const* name, std::string &result);
    size_t GetSettingsCount() const { return m_configMap.size(); }

private:
    friend class MaNGOS::Singleton<Config, Lock>;

    bool ProcessLine(char const* line);

    std::string m_fileName;
    std::unordered_map<std::string, std::string> m_configMap;

    using LockType = std::shared_timed_mutex;
    LockType m_configLock;
};

#define sConfig (MaNGOS::Singleton<Config, Config::Lock>::Instance())

#endif
