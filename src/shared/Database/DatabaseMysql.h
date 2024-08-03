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

#ifndef DO_POSTGRESQL

#ifndef _DATABASEMYSQL_H
#define _DATABASEMYSQL_H

//#include "Common.h"
#include "Database.h"
#include "Policies/Singleton.h"

#ifdef WIN32
#include <winsock2.h>
#endif
#include <mysql.h>

// my_bool declaration is removed in 8.0
#if MYSQL_VERSION_ID >= 80000
typedef char my_bool;
#ifdef _MSC_VER
#pragma message("You are using an incompatible mysql version!")
#else
#warning "You are using an incompatible mysql version!"
#endif
#endif

//MySQL prepared statement class
class MySqlPreparedStatement : public SqlPreparedStatement
{
public:
    MySqlPreparedStatement(std::string const& fmt, SqlConnection& conn, MYSQL* mysql);
    ~MySqlPreparedStatement() override;

    //prepare statement
    bool prepare() override;

    //bind input parameters
    void bind(SqlStmtParameters const& holder) override;

    //execute DML statement
    bool execute() override;

protected:
    //bind parameters
    void addParam(int nIndex, SqlStmtFieldData const& data);

    static enum_field_types ToMySQLType(SqlStmtFieldData const& data, my_bool& bUnsigned);

private:
    void RemoveBinds();

    MYSQL* m_pMySQLConn;
    MYSQL_STMT* m_stmt;
    MYSQL_BIND* m_pInputArgs;
    MYSQL_BIND* m_pResult;
    MYSQL_RES* m_pResultMetadata;
};

class MySQLConnection : public SqlConnection
{
    public:
        MySQLConnection(Database& db) : SqlConnection(db), mMysql(nullptr) {}
        ~MySQLConnection() override;

        bool OpenConnection(bool reconnect) override;
        bool Reconnect();
        bool HandleMySQLError(uint32 errNo);

        std::unique_ptr<QueryResult> Query(std::string const& sql) override;
        std::unique_ptr<QueryNamedResult> QueryNamed(std::string const& sql) override;
        bool Execute(std::string const& sql) override;

        unsigned long escape_string(char* to, char const* from, unsigned long length) override;

        bool BeginTransaction() override;
        bool CommitTransaction() override;
        bool RollbackTransaction() override;

    protected:
        SqlPreparedStatement* CreateStatement(std::string const& fmt) override;

    private:
        bool _TransactionCmd(std::string const& sql);
        bool _Query(std::string const& sql, MYSQL_RES** pResult, MYSQL_FIELD** pFields, uint64* pRowCount, uint32* pFieldCount);

        MYSQL* mMysql;
};

class DatabaseMysql : public Database
{
    friend class MaNGOS::OperatorNew<DatabaseMysql>;

    public:
        DatabaseMysql();
        ~DatabaseMysql() override;

        //! Initializes Mysql and connects to a server.
        /*! infoString should be formated like hostname;username;password;database. */

        // must be call before first query in thread
        void ThreadStart() override;
        // must be call before finish thread run
        void ThreadEnd() override;

    protected:
        SqlConnection* CreateConnection() override;

    private:
        static size_t db_count;
};

#endif
#endif
