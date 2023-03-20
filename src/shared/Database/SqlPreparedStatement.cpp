/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#include "DatabaseEnv.h"
#include "Log.h"

bool SqlStmtFieldData::toBool() const { MANGOS_ASSERT(m_type == FIELD_BOOL); return m_binaryData.boolean; }
uint8 SqlStmtFieldData::toUint8() const { MANGOS_ASSERT(m_type == FIELD_UI8); return m_binaryData.ui8; }
int8 SqlStmtFieldData::toInt8() const { MANGOS_ASSERT(m_type == FIELD_I8); return m_binaryData.i8; }
uint16 SqlStmtFieldData::toUint16() const { MANGOS_ASSERT(m_type == FIELD_UI16); return m_binaryData.ui16; }
int16 SqlStmtFieldData::toInt16() const { MANGOS_ASSERT(m_type == FIELD_I16); return m_binaryData.i16; }
uint32 SqlStmtFieldData::toUint32() const { MANGOS_ASSERT(m_type == FIELD_UI32); return m_binaryData.ui32; }
int32 SqlStmtFieldData::toInt32() const { MANGOS_ASSERT(m_type == FIELD_I32); return m_binaryData.i32; }
uint64 SqlStmtFieldData::toUint64() const { MANGOS_ASSERT(m_type == FIELD_UI64); return m_binaryData.ui64; }
int64 SqlStmtFieldData::toInt64() const { MANGOS_ASSERT(m_type == FIELD_I64); return m_binaryData.i64; }
float SqlStmtFieldData::toFloat() const { MANGOS_ASSERT(m_type == FIELD_FLOAT); return m_binaryData.f; }
double SqlStmtFieldData::toDouble() const { MANGOS_ASSERT(m_type == FIELD_DOUBLE); return m_binaryData.d; }
char const* SqlStmtFieldData::toStr() const { MANGOS_ASSERT(m_type == FIELD_STRING); return m_szStringData.c_str(); }

SqlStmtParameters::SqlStmtParameters(int nParams)
{
    //reserve memory if needed
    if(nParams > 0)
        m_params.reserve(nParams);
}

void SqlStmtParameters::reset(SqlStatement const& stmt)
{
    m_params.clear();
    //reserve memory if needed
    if(stmt.arguments() > 0)
        m_params.reserve(stmt.arguments());
}

//////////////////////////////////////////////////////////////////////////
SqlStatement& SqlStatement::operator=(SqlStatement const& index)
{
    if(this != &index)
    {
        m_index = index.m_index;
        m_pDB = index.m_pDB;

        if(m_pParams)
        {
            delete m_pParams;
            m_pParams = nullptr;
        }

        if(index.m_pParams)
            m_pParams = new SqlStmtParameters(*(index.m_pParams));
    }

    return *this;
}

bool SqlStatement::Execute()
{
    SqlStmtParameters* args = detach();
    //verify amount of bound parameters
    if(args->boundParams() != arguments())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL ERROR: wrong amount of parameters (%i instead of %i)", args->boundParams(), arguments());
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL ERROR: statement: %s", m_pDB->GetStmtString(ID()).c_str());
        MANGOS_ASSERT(false);
        return false;
    }

    return m_pDB->ExecuteStmt(m_index, args);
}

bool SqlStatement::DirectExecute()
{
    SqlStmtParameters* args = detach();
    //verify amount of bound parameters
    if(args->boundParams() != arguments())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL ERROR: wrong amount of parameters (%i instead of %i)", args->boundParams(), arguments());
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "SQL ERROR: statement: %s", m_pDB->GetStmtString(ID()).c_str());
        MANGOS_ASSERT(false);
        return false;
    }

    return m_pDB->DirectExecuteStmt(m_index, args);
}

//////////////////////////////////////////////////////////////////////////
SqlPlainPreparedStatement::SqlPlainPreparedStatement(std::string const& fmt, SqlConnection& conn) : SqlPreparedStatement(fmt, conn)
{
    m_bPrepared = true;
    m_nParams = std::count(m_szFmt.begin(), m_szFmt.end(), '?');
    m_bIsQuery = strnicmp(m_szFmt.c_str(), "select", 6) == 0;
}

void SqlPlainPreparedStatement::bind(SqlStmtParameters const& holder)
{
    //verify if we bound all needed input parameters
    if(m_nParams != holder.boundParams())
    {
        MANGOS_ASSERT(false);
        return;
    }

    //reset resulting plain SQL request
    m_szPlainRequest = m_szFmt;
    size_t nLastPos = 0;

    SqlStmtParameters::ParameterContainer const& _args = holder.params();

    SqlStmtParameters::ParameterContainer::const_iterator iter_last = _args.end();
    for (SqlStmtParameters::ParameterContainer::const_iterator iter = _args.begin(); iter != iter_last; ++iter)
    {
        //bind parameter
        SqlStmtFieldData const& data = (*iter);

        std::ostringstream fmt;
        DataToString(data, fmt);

        nLastPos = m_szPlainRequest.find('?', nLastPos);
        if(nLastPos != std::string::npos)
        {
            std::string tmp = fmt.str();
            m_szPlainRequest.replace(nLastPos, 1, tmp);
            nLastPos += tmp.length();
        }
    }
}

bool SqlPlainPreparedStatement::execute()
{
    if(m_szPlainRequest.empty())
        return false;

    return m_pConn.Execute(m_szPlainRequest.c_str());
}

void SqlPlainPreparedStatement::DataToString(SqlStmtFieldData const& data, std::ostringstream& fmt)
{
    switch (data.type())
    {
        case FIELD_BOOL:    fmt << "'" << uint32(data.toBool()) << "'";     break;
        case FIELD_UI8:     fmt << "'" << uint32(data.toUint8()) << "'";    break;
        case FIELD_UI16:    fmt << "'" << uint32(data.toUint16()) << "'";   break;
        case FIELD_UI32:    fmt << "'" << data.toUint32() << "'";           break;
        case FIELD_UI64:    fmt << "'" << data.toUint64() << "'";           break;
        case FIELD_I8:      fmt << "'" << int32(data.toInt8()) << "'";      break;
        case FIELD_I16:     fmt << "'" << int32(data.toInt16()) << "'";     break;
        case FIELD_I32:     fmt << "'" << data.toInt32() << "'";            break;
        case FIELD_I64:     fmt << "'" << data.toInt64() << "'";            break;
        case FIELD_FLOAT:   fmt << "'" << data.toFloat() << "'";            break;
        case FIELD_DOUBLE:  fmt << "'" << data.toDouble() << "'";           break;
        case FIELD_STRING:
        {
            std::string tmp = data.toStr();
            m_pConn.DB().escape_string(tmp);
            fmt << "'" << tmp << "'";
        }
        break;
    }
}
