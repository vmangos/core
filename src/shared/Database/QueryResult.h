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

#ifndef QUERYRESULT_H
#define QUERYRESULT_H

#include "Common.h"
#include "Field.h"
#include <memory>

class QueryResult
{
    public:
        QueryResult(uint64 rowCount, uint32 fieldCount)
            : mCurrentRow(nullptr), mFieldCount(fieldCount), mRowCount(rowCount) {}

        virtual ~QueryResult() {}

        virtual bool NextRow() = 0;

        Field* Fetch() const { return mCurrentRow; }

        Field const& operator [] (int index) const { return mCurrentRow[index]; }

        uint32 GetFieldCount() const { return mFieldCount; }
        uint64 GetRowCount() const { return mRowCount; }

    protected:
        Field* mCurrentRow;
        uint32 mFieldCount;
        uint64 mRowCount;
};

typedef std::vector<std::string> QueryFieldNames;

class QueryNamedResult
{
    public:
        explicit QueryNamedResult(std::unique_ptr<QueryResult> query, QueryFieldNames names) : mQuery(std::move(query)), mFieldNames(std::move(names)) {}

        // compatible interface with QueryResult
        bool NextRow() { return mQuery->NextRow(); }
        Field* Fetch() const { return mQuery->Fetch(); }
        uint32 GetFieldCount() const { return mQuery->GetFieldCount(); }
        uint64 GetRowCount() const { return mQuery->GetRowCount(); }
        Field const& operator[] (int index) const { return (*mQuery)[index]; }

        // named access
        Field const& operator[] (std::string const& name) const { return mQuery->Fetch()[GetField_idx(name)]; }
        QueryFieldNames const& GetFieldNames() const { return mFieldNames; }

        uint32 GetField_idx(std::string const& name) const
        {
            for(size_t idx = 0; idx < mFieldNames.size(); ++idx)
            {
                if(mFieldNames[idx] == name)
                    return idx;
            }
            throw std::runtime_error("unknown field name");
            return uint32(-1);
        }

    protected:
        std::unique_ptr<QueryResult> mQuery;
        QueryFieldNames mFieldNames;
};

#endif
