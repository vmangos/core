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

#include "Database/Database.h"
#include "Database/SqlOperations.h"

/// Function body definitions for the template function members of the Database class

#define ASYNC_QUERY_BODY(sql) if (!sql || !m_pResultQueue) return false;
#define ASYNC_DELAYHOLDER_BODY(holder) if (!holder || !m_pResultQueue) return false;

#define ASYNC_PQUERY_BODY(format, szQuery) \
    if(!format) return false; \
    \
    char szQuery [MAX_QUERY_LEN]; \
    \
    { \
        va_list ap; \
        \
        va_start(ap, format); \
        int res = vsnprintf( szQuery, MAX_QUERY_LEN, format, ap ); \
        va_end(ap); \
        \
        if(res==-1) \
        { \
            sLog.outError("SQL Query truncated (and not execute) for format: %s",format); \
            return false; \
        } \
    }

// -- Query / member --

template<class Class>
bool
Database::AsyncQuery(Class *object, void (Class::*method)(QueryResult*), const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::QueryCallback<Class>(object, method, (QueryResult*)NULL), m_pResultQueue));
    return true;
}

template<class Class>
bool
Database::AsyncQueryUnsafe(Class *object, void (Class::*method)(QueryResult*), const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    MaNGOS::QueryCallback<Class>* cb = new MaNGOS::QueryCallback<Class>(object, method, (QueryResult*)NULL);
    cb->threadSafe = false;
    AddToDelayQueue(new SqlQuery(sql, cb, m_pResultQueue));
    return true;
}

template<class Class, typename ParamType1>
bool
Database::AsyncQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1), ParamType1 param1, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::QueryCallback<Class, ParamType1>(object, method, (QueryResult*)NULL, param1), m_pResultQueue));
    return true;
}
template<class Class, typename ParamType1>
bool
Database::AsyncQueryUnsafe(Class *object, void (Class::*method)(QueryResult*, ParamType1), ParamType1 param1, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    MaNGOS::QueryCallback<Class, ParamType1>* cb = new MaNGOS::QueryCallback<Class, ParamType1>(object, method, (QueryResult*)NULL, param1);
    cb->threadSafe = false;
    AddToDelayQueue(new SqlQuery(sql, cb, m_pResultQueue));
    return true;
}

template<class Class, typename ParamType1, typename ParamType2>
bool
Database::AsyncQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::QueryCallback<Class, ParamType1, ParamType2>(object, method, (QueryResult*)NULL, param1, param2), m_pResultQueue));
    return true;
}

template<class Class, typename ParamType1, typename ParamType2, typename ParamType3>
bool
Database::AsyncQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1, ParamType2, ParamType3), ParamType1 param1, ParamType2 param2, ParamType3 param3, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::QueryCallback<Class, ParamType1, ParamType2, ParamType3>(object, method, (QueryResult*)NULL, param1, param2, param3), m_pResultQueue));
    return true;
}

// -- Query / static --

template<typename ParamType1>
bool
Database::AsyncQuery(void (*method)(QueryResult*, ParamType1), ParamType1 param1, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::SQueryCallback<ParamType1>(method, (QueryResult*)NULL, param1), m_pResultQueue));
    return true;
}

template<typename ParamType1, typename ParamType2>
bool
Database::AsyncQuery(void (*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::SQueryCallback<ParamType1, ParamType2>(method, (QueryResult*)NULL, param1, param2), m_pResultQueue));
    return true;
}

template<typename ParamType1, typename ParamType2, typename ParamType3>
bool
Database::AsyncQuery(void (*method)(QueryResult*, ParamType1, ParamType2, ParamType3), ParamType1 param1, ParamType2 param2, ParamType3 param3, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    AddToDelayQueue(new SqlQuery(sql, new MaNGOS::SQueryCallback<ParamType1, ParamType2, ParamType3>(method, (QueryResult*)NULL, param1, param2, param3), m_pResultQueue));
    return true;
}

template<typename ParamType1>
bool
Database::AsyncQueryUnsafe(void (*method)(QueryResult*, ParamType1), ParamType1 param1, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    MaNGOS::SQueryCallback<ParamType1>* cb = new MaNGOS::SQueryCallback<ParamType1>(method, (QueryResult*)NULL, param1);
    cb->threadSafe = false;
    AddToDelayQueue(new SqlQuery(sql, cb, m_pResultQueue));
    return true;
}

template<typename ParamType1, typename ParamType2>
bool
Database::AsyncQueryUnsafe(void(*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *sql)
{
    ASYNC_QUERY_BODY(sql)
    MaNGOS::SQueryCallback<ParamType1, ParamType2>* cb = new MaNGOS::SQueryCallback<ParamType1, ParamType2>(method, (QueryResult*)NULL, param1, param2);
    cb->threadSafe = false;
    AddToDelayQueue(new SqlQuery(sql, cb, m_pResultQueue));
    return true;
}

// -- PQuery / member --

template<class Class>
bool
Database::AsyncPQuery(Class *object, void (Class::*method)(QueryResult*), const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(object, method, szQuery);
}

template<class Class>
bool
Database::AsyncPQueryUnsafe(Class *object, void (Class::*method)(QueryResult*), const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQueryUnsafe(object, method, szQuery);
}

template<class Class, typename ParamType1>
bool
Database::AsyncPQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1), ParamType1 param1, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(object, method, param1, szQuery);
}
template<class Class, typename ParamType1>
bool
Database::AsyncPQueryUnsafe(Class *object, void (Class::*method)(QueryResult*, ParamType1), ParamType1 param1, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQueryUnsafe(object, method, param1, szQuery);
}
template<class Class, typename ParamType1, typename ParamType2>
bool
Database::AsyncPQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(object, method, param1, param2, szQuery);
}

template<class Class, typename ParamType1, typename ParamType2, typename ParamType3>
bool
Database::AsyncPQuery(Class *object, void (Class::*method)(QueryResult*, ParamType1, ParamType2, ParamType3), ParamType1 param1, ParamType2 param2, ParamType3 param3, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(object, method, param1, param2, param3, szQuery);
}

// -- PQuery / static --

template<typename ParamType1>
bool
Database::AsyncPQuery(void (*method)(QueryResult*, ParamType1), ParamType1 param1, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(method, param1, szQuery);
}

template<typename ParamType1, typename ParamType2>
bool
Database::AsyncPQuery(void (*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(method, param1, param2, szQuery);
}

template<typename ParamType1, typename ParamType2, typename ParamType3>
bool
Database::AsyncPQuery(void (*method)(QueryResult*, ParamType1, ParamType2, ParamType3), ParamType1 param1, ParamType2 param2, ParamType3 param3, const char *format,...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQuery(method, param1, param2, param3, szQuery);
}

template<typename ParamType1>
bool
Database::AsyncPQueryUnsafe(void (*method)(QueryResult*, ParamType1), ParamType1 param1, const char *format, ...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQueryUnsafe(method, param1, szQuery);
}

template<typename ParamType1, typename ParamType2>
bool
Database::AsyncPQueryUnsafe(void(*method)(QueryResult*, ParamType1, ParamType2), ParamType1 param1, ParamType2 param2, const char *format, ...)
{
    ASYNC_PQUERY_BODY(format, szQuery)
    return AsyncQueryUnsafe(method, param1, param2, szQuery);
}

// -- QueryHolder --

template<class Class>
bool
Database::DelayQueryHolder(Class *object, void (Class::*method)(QueryResult*, SqlQueryHolder*), SqlQueryHolder *holder)
{
    ASYNC_DELAYHOLDER_BODY(holder)
    return holder->Execute(new MaNGOS::QueryCallback<Class, SqlQueryHolder*>(object, method, (QueryResult*)NULL, holder), this, m_pResultQueue);
}
template<class Class>
bool
Database::DelayQueryHolderUnsafe(Class *object, void (Class::*method)(QueryResult*, SqlQueryHolder*), SqlQueryHolder *holder)
{
    ASYNC_DELAYHOLDER_BODY(holder)
    MaNGOS::QueryCallback<Class, SqlQueryHolder*> *cb = new MaNGOS::QueryCallback<Class, SqlQueryHolder*>(object, method, (QueryResult*)NULL, holder);
    cb->threadSafe = false;
    return holder->Execute(cb, this, m_pResultQueue);
}
template<class Class, typename ParamType1>
bool
Database::DelayQueryHolder(Class *object, void (Class::*method)(QueryResult*, SqlQueryHolder*, ParamType1), SqlQueryHolder *holder, ParamType1 param1)
{
    ASYNC_DELAYHOLDER_BODY(holder)
    return holder->Execute(new MaNGOS::QueryCallback<Class, SqlQueryHolder*, ParamType1>(object, method, (QueryResult*)NULL, holder, param1), this, m_pResultQueue);
}

// -- QueryHolder static --
template<typename ParamType1>
bool
Database::DelayQueryHolder(void (*method)(QueryResult*, SqlQueryHolder*, ParamType1), SqlQueryHolder *holder, ParamType1 param1)
{
    ASYNC_DELAYHOLDER_BODY(holder)
    return holder->Execute(new MaNGOS::SQueryCallback<SqlQueryHolder*, ParamType1>(method, (QueryResult*)NULL, holder, param1), this, m_pResultQueue);
}

template<typename ParamType1>
bool
Database::DelayQueryHolderUnsafe(void (*method)(QueryResult*, SqlQueryHolder*, ParamType1), SqlQueryHolder *holder, ParamType1 param1)
{
    ASYNC_DELAYHOLDER_BODY(holder)
    MaNGOS::SQueryCallback<SqlQueryHolder*, ParamType1> *cb = new MaNGOS::SQueryCallback<SqlQueryHolder*, ParamType1>(method, (QueryResult*)NULL, holder, param1);
    cb->threadSafe = false;
    return holder->Execute(cb, this, m_pResultQueue);
}
#undef ASYNC_QUERY_BODY
#undef ASYNC_PQUERY_BODY
#undef ASYNC_DELAYHOLDER_BODY
