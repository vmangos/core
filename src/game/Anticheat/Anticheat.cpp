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

#include "Anticheat.h"

AnticheatManager* AnticheatManager::instance()
{
    static AnticheatManager i;
    return &i;
}

AnticheatManager* GetAnticheatLib()
{
    return AnticheatManager::instance();
}

#include "World.h"
#include "WorldSession.h"

#include "MovementAnticheat/MovementAnticheat.h"
#include "WardenAnticheat/Warden.hpp"
#include "WardenAnticheat/WardenScanMgr.hpp"
#include "WardenAnticheat/WardenModuleMgr.hpp"
#include "WardenAnticheat/WardenWin.hpp"
#include "WardenAnticheat/WardenMac.hpp"

AnticheatManager::~AnticheatManager()
{
    StopWardenUpdateThread();

    AddOrRemovePendingSessions();
    for (auto const& warden : m_wardenSessions)
        if (warden)
            delete warden;
}

void AnticheatManager::LoadAnticheatData()
{
    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, "Loading warden checks...");
    sWardenScanMgr.LoadFromDB();
    Warden::LoadScriptedScans();

    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_ANTICHEAT, LOG_LVL_MINIMAL, "Loading warden modules...");
    sWardenModuleMgr;
}

MovementAnticheat* AnticheatManager::CreateAnticheatFor(Player* player)
{
    MovementAnticheat* cd = new MovementAnticheat(player);
    cd->Init();
    return cd;
}

Warden* AnticheatManager::CreateWardenForInternal(WorldSession* client, BigNumber* K)
{
    if ((client->GetSecurity() != SEC_PLAYER) &&
        sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_PLAYERS_ONLY))
        return nullptr;

    ClientOSType os = client->GetOS();

    if (os == CLIENT_OS_MAC && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_OSX_ENABLED))
        return new WardenMac(client, *K);
    else if (os == CLIENT_OS_WIN && sWorld.getConfig(CONFIG_BOOL_AC_WARDEN_WIN_ENABLED))
        return new WardenWin(client, *K);

    return nullptr;
}

Warden* AnticheatManager::CreateWardenFor(WorldSession* client, BigNumber* K)
{
    Warden* warden = CreateWardenForInternal(client, K);
    if (warden)
        AddWardenSession(warden);

    return warden;
}

void AnticheatManager::StartWardenUpdateThread()
{
   m_wardenUpdateThread = std::thread(&AnticheatManager::UpdateWardenSessions, this);
}

void AnticheatManager::StopWardenUpdateThread()
{
    if (m_wardenUpdateThread.joinable())
        m_wardenUpdateThread.join();
}

void AnticheatManager::UpdateWardenSessions()
{
    while (!World::IsStopped())
    {
        {
            std::lock_guard<std::mutex> guard(m_wardenSessionsMutex);
            AddOrRemovePendingSessions();
        }

        for (uint32 i = 0; i < m_wardenSessions.size(); i++)
        {
            if (Warden* warden = m_wardenSessions[i])
                warden->Update();
        }

        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void AnticheatManager::AddOrRemovePendingSessions()
{
    if (!m_wardenSessionsToAdd.empty())
    {
        for (auto const& warden : m_wardenSessionsToAdd)
            AddWardenSessionInternal(warden);
        m_wardenSessionsToAdd.clear();
    }
    if (!m_wardenSessionsToRemove.empty())
    {
        for (auto const& warden : m_wardenSessionsToRemove)
            RemoveWardenSessionInternal(warden);
        m_wardenSessionsToRemove.clear();
    }
}

void AnticheatManager::AddWardenSessionInternal(Warden* warden)
{
    for (uint32 i = 0; i < m_wardenSessions.size(); i++)
    {
        if (m_wardenSessions[i] == nullptr)
        {
            m_wardenSessions[i] = warden;
            return;
        }
    }

    m_wardenSessions.push_back(warden);
}

void AnticheatManager::RemoveWardenSessionInternal(Warden* warden)
{
    for (uint32 i = 0; i < m_wardenSessions.size(); i++)
    {
        if (m_wardenSessions[i] == warden)
        {
            m_wardenSessions[i] = nullptr;
            break;
        }
    }

    delete warden;
}

void AnticheatManager::AddWardenSession(Warden* warden)
{
    std::lock_guard<std::mutex> guard(m_wardenSessionsMutex);
    m_wardenSessionsToAdd.push_back(warden);
}

void AnticheatManager::RemoveWardenSession(Warden* warden)
{
    std::lock_guard<std::mutex> guard(m_wardenSessionsMutex);
    m_wardenSessionsToRemove.push_back(warden);
}

