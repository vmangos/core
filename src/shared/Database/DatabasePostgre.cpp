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

#ifdef DO_POSTGRESQL

#include "Util.h"
#include "Policies/SingletonImp.h"
#include "Platform/Define.h"
#include "DatabaseEnv.h"
#include "Database/SqlOperations.h"
#include "Timer.h"

size_t DatabasePostgre::db_count = 0;

DatabasePostgre::DatabasePostgre()
{
    // before first connection
    if(db_count++ == 0)
    {
        if (!PQisthreadsafe())
        {
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "FATAL ERROR: PostgreSQL libpq isn't thread-safe.");
            exit(1);
        }
    }
}

DatabasePostgre::~DatabasePostgre()
{

}

SqlConnection* DatabasePostgre::CreateConnection()
{
    return new PostgreSQLConnection();
}

PostgreSQLConnection::~PostgreSQLConnection()
{
    PQfinish(mPGconn);
}

bool PostgreSQLConnection::OpenConnection(bool reconnect)
{
    if (m_socket)
        mPGconn = PQsetdbLogin(nullptr, m_port_or_socket == "localhost" ? nullptr : m_port_or_socket.c_str(), nullptr, nullptr, m_database.c_str(), m_user.c_str(), m_password.c_str());
    else
        mPGconn = PQsetdbLogin(m_host.c_str(), m_port_or_socket.c_str(), nullptr, nullptr, m_database.c_str(), m_user.c_str(), m_password.c_str());

    /* check to see that the backend connection was successfully made */
    if (PQstatus(mPGconn) != CONNECTION_OK)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Could not connect to Postgre database at %s: %s",
            m_host.c_str(), PQerrorMessage(mPGconn));
        PQfinish(mPGconn);
        mPGconn = nullptr;
        return false;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Connected to Postgre database at %s", m_host.c_str());
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "PostgreSQL server ver: %d", PQserverVersion(mPGconn));
    return true;
}

bool PostgreSQLConnection::_Query(std::string const& sql, PGresult** pResult, uint64* pRowCount, uint32* pFieldCount)
{
    if (!mPGconn)
        return false;

    uint32 _s = WorldTimer::getMSTime();
    // Send the query
    *pResult = PQexec(mPGconn, sql.c_str());
    if(!*pResult)
        return false;

    if (PQresultStatus(*pResult) != PGRES_TUPLES_OK)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "SQL : %s", sql.c_str());
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "SQL %s", PQerrorMessage(mPGconn));
        PQclear(*pResult);
        return false;
    }
    else
    {
        DEBUG_FILTER_LOG(LOG_FILTER_SQL_TEXT, "[%u ms] SQL: %s", WorldTimer::getMSTimeDiff(_s,WorldTimer::getMSTime()), sql.c_str());
    }

    *pRowCount = PQntuples(*pResult);
    *pFieldCount = PQnfields(*pResult);
    // end guarded block

    if (!*pRowCount)
    {
        PQclear(*pResult);
        return false;
    }

    return true;
}

std::unique_ptr<QueryResult> PostgreSQLConnection::Query(std::string const& sql)
{
    if (!mPGconn)
        return nullptr;

    PGresult* result = nullptr;
    uint64 rowCount = 0;
    uint32 fieldCount = 0;

    if(!_Query(sql, &result, &rowCount, &fieldCount))
        return nullptr;

    std::unique_ptr<QueryResultPostgre> queryResult(new QueryResultPostgre(result, rowCount, fieldCount));

    queryResult->NextRow();
    return queryResult;
}

std::unique_ptr<QueryNamedResult> PostgreSQLConnection::QueryNamed(std::string const& sql)
{
    if (!mPGconn)
        return nullptr;

    PGresult* result = nullptr;
    uint64 rowCount = 0;
    uint32 fieldCount = 0;

    if(!_Query(sql, &result, &rowCount, &fieldCount))
        return nullptr;

    QueryFieldNames names(fieldCount);
    for (uint32 i = 0; i < fieldCount; i++)
        names[i] = PQfname(result, i);

    std::unique_ptr<QueryResultPostgre> queryResult(new QueryResultPostgre(result, rowCount, fieldCount));

    queryResult->NextRow();
    return std::make_unique<QueryNamedResult>(std::move(queryResult), names);
}

bool PostgreSQLConnection::Execute(std::string const& sql)
{
    if (!mPGconn)
        return false;

    uint32 _s = WorldTimer::getMSTime();

    PGresult* res = PQexec(mPGconn, sql.c_str());
    if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "SQL: %s", sql.c_str());
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "SQL %s", PQerrorMessage(mPGconn));
        return false;
    }
    else
    {
        DEBUG_FILTER_LOG(LOG_FILTER_SQL_TEXT, "[%u ms] SQL: %s", WorldTimer::getMSTimeDiff(_s,WorldTimer::getMSTime()), sql.c_str());
    }

    PQclear(res);
    return true;
}

bool PostgreSQLConnection::_TransactionCmd(std::string const& sql)
{
    if (!mPGconn)
        return false;

    PGresult* res = PQexec(mPGconn, sql.c_str());
    if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL: %s", sql.c_str());
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL ERROR: %s", PQerrorMessage(mPGconn));
        return false;
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_DEBUG, "SQL: %s", sql.c_str());
    }
    return true;
}

bool PostgreSQLConnection::BeginTransaction()
{
    return _TransactionCmd("START TRANSACTION");
}

bool PostgreSQLConnection::CommitTransaction()
{
    return _TransactionCmd("COMMIT");
}

bool PostgreSQLConnection::RollbackTransaction()
{
    return _TransactionCmd("ROLLBACK");
}

unsigned long PostgreSQLConnection::escape_string(char* to, char const* from, unsigned long length)
{
    if (!mPGconn || !to || !from || !length)
        return 0;

    return PQescapeString(to, from, length);
}

#endif
