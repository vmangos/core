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

#ifndef _DatabasePostgre_H
#define _DatabasePostgre_H

#include "Common.h"
#include "Database.h"
#include "Policies/Singleton.h"
#include <stdarg.h>

#ifdef WIN32
#define FD_SETSIZE 1024
#include <winsock2.h>
#include <postgre/libpq-fe.h>
#else
#include <libpq-fe.h>
#endif

class PostgreSQLConnection : public SqlConnection
{
    public:
        PostgreSQLConnection() : mPGconn(nullptr) {}
        ~PostgreSQLConnection();

        bool OpenConnection(bool reconnect);

        std::unique_ptr<QueryResult> Query(std::string const& sql) override;
        std::unique_ptr<QueryNamedResult> QueryNamed(std::string const& sql) override;
        bool Execute(std::string const& sql) override;

        unsigned long escape_string(char* to, char const* from, unsigned long length);

        bool BeginTransaction() override;
        bool CommitTransaction() override;
        bool RollbackTransaction() override;

    private:
        bool _TransactionCmd(std::string const& sql);
        bool _Query(std::string const& sql, PGresult** pResult, uint64* pRowCount, uint32* pFieldCount);

        PGconn* mPGconn;
};

class DatabasePostgre : public Database
{
    friend class MaNGOS::OperatorNew<DatabasePostgre>;

    public:
        DatabasePostgre();
        ~DatabasePostgre();

        //! Initializes Postgres and connects to a server.
        /*! infoString should be formated like hostname;username;password;database. */

    protected:
        virtual SqlConnection* CreateConnection();

    private:
        static size_t db_count;
};
#endif
