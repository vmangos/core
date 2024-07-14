/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 * Copyright (C) 2017-2024 VMaNGOS Project <https://github.com/vmangos>
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

#ifndef MANGOS_GAME_SERVER_WORLDSOCKETMGR_H
#define MANGOS_GAME_SERVER_WORLDSOCKETMGR_H

#include <vector>
#include <memory>
#include "Policies/Singleton.h"
#include "IO/IoContext.h"
#include "IO/Networking/AsyncServerListener.h"

class WorldSocket;

struct WorldSocketMgrOptions
{
    std::string bindIp;
    uint16 bindPort;
    int ioNetworkThreadCount;
    int socketOutByteBufferSize;
    bool doExplicitTcpNoDelay;
};

class WorldSocketMgr : public MaNGOS::Singleton<WorldSocketMgr, MaNGOS::ClassLevelLockable<WorldSocketMgr, std::mutex>>
{
public:
    explicit WorldSocketMgr() = default;

    /// Will return true start was okay
    bool StartWorldNetworking(IO::IoContext* ioCtx, WorldSocketMgrOptions const& options);
    void StopWorldNetworking();
    void OnNewClientConnected(std::shared_ptr<WorldSocket> const& socket);

private:
    std::unique_ptr<IO::Networking::AsyncServerListener<WorldSocket>> m_listener{nullptr};
    volatile bool m_running = false;
    std::vector<std::thread> m_runningThreads{};
    WorldSocketMgrOptions m_settings{};
};

#define sWorldSocketMgr MaNGOS::Singleton<WorldSocketMgr>::Instance()

#endif //MANGOS_GAME_SERVER_WORLDSOCKETMGR_H
