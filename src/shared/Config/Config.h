/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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
#include "ace/Configuration_Import_Export.h"
#include "Policies/SingletonImp.h"
#include "Policies/ThreadingModel.h"
#include <shared_mutex>

class ACE_Configuration_Heap;

class Config
{
    public:
        using Lock = MaNGOS::ClassLevelLockable<Config, std::shared_timed_mutex>;

        Config();
        ~Config();

        bool SetSource(char const* file);
        bool Reload();

        std::string GetStringDefault(char const* name, char const* def);
        bool GetBoolDefault(char const* name, bool const def = false);
        int32 GetIntDefault(char const* name, int32 const def);
        float GetFloatDefault(char const* name, float const def);

        std::string GetFilename() const { return mFilename; }
        bool GetValueHelper(char const* name, ACE_TString &result);

    private:
        friend class MaNGOS::Singleton<Config, Lock>;

        std::string mFilename;
        ACE_Configuration_Heap* mConf;

        using LockType = std::mutex;
        using GuardType = std::unique_lock<LockType>;

        std::string _filename;
        LockType m_configLock;
};

// Nostalrius : multithreading lock
#define sConfig (MaNGOS::Singleton<Config, Config::Lock>::Instance())

#endif
