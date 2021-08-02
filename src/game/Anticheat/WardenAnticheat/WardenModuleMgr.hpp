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

#ifndef __WARDENMODULEMGR_HPP_
#define __WARDENMODULEMGR_HPP_

#include "WardenModule.hpp"

#include "Policies/Singleton.h"
#include "Platform/Define.h"

#include <vector>

class WardenModuleMgr
{
private:
    std::vector<WardenModule> _winModules;
    std::vector<WardenModule> _macModules;

public:
    WardenModuleMgr();

    const WardenModule *GetWindowsModule() const;
    const WardenModule *GetMacModule() const;
};

#define sWardenModuleMgr MaNGOS::Singleton<WardenModuleMgr>::Instance()

#endif /* !__WARDENMODULEMGR_HPP_ */