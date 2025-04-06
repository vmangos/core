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

#ifndef _TRANSACTION_LOG_H
#define _TRANSACTION_LOG_H

#include "Common.h"

struct TransactionPart
{
    static int const MAX_TRANSACTION_ITEMS = 6;
    TransactionPart()
    {
        memset(this, 0, sizeof(TransactionPart));
    }
    uint32 lowGuid;
    uint32 money;
    uint32 spell;
    uint16 itemsEntries[MAX_TRANSACTION_ITEMS];
    uint8 itemsCount[MAX_TRANSACTION_ITEMS];
    uint32 itemsGuid[MAX_TRANSACTION_ITEMS];
};

struct PlayerTransactionData
{
    char const* type;
    TransactionPart parts[2];
};

#endif
