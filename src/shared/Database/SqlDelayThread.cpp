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

#include "Database/SqlDelayThread.h"
#include "Database/SqlOperations.h"
#include "DatabaseEnv.h"

SqlDelayThread::SqlDelayThread(Database* db, SqlConnection* conn, int workerId)
    : m_dbEngine(db), m_dbConnection(conn), m_running(true), m_workerId(workerId)
{
}

SqlDelayThread::~SqlDelayThread()
{
    //process all requests which might have been queued while thread was stopping
    ProcessRequests();
    delete m_dbConnection;
}

void SqlDelayThread::run()
{
    #ifndef DO_POSTGRESQL
    mysql_thread_init();
    #endif

    uint32 const loopSleepms = 10;

    uint32 const pingEveryLoop = m_dbEngine->GetPingIntervall() / loopSleepms;

    uint32 loopCounter = 0;
    while (m_running)
    {
        // if the running state gets turned off while sleeping
        // empty the queue before exiting
        ACE_Based::Thread::Sleep(loopSleepms);

        ProcessRequests();

        if((loopCounter++) >= pingEveryLoop)
        {
            loopCounter = 0;
            m_dbEngine->Ping();
            if (QueryResult* res = m_dbConnection->Query("SELECT 1"))
                delete res;
        }
    }

    #ifndef DO_POSTGRESQL
    mysql_thread_end();
    #endif
}

void SqlDelayThread::Stop()
{
    m_running = false;
}

void SqlDelayThread::ProcessRequests()
{
    SqlOperation* s = nullptr;
    while (m_dbEngine->NextDelayedOperation(s))
    {
        s->Execute(m_dbConnection);
        delete s;
    }

    // Process any serial operations for this worker
    while (m_dbEngine->NextSerialDelayedOperation(m_workerId, s))
    {
        s->Execute(m_dbConnection);
        delete s;
    }
}
