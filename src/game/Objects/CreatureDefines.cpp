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

#include "CreatureDefines.h"

#include "Random.h"

uint32 CreatureData::GetRandomRespawnTime() const
{
    return urand(spawntimesecsmin, spawntimesecsmax);
}

uint32 CreatureData::ChooseCreatureId() const
{
    uint32 creatureId = 0;
    uint32 creatureIdCount = 0;
    for (; creatureIdCount < MAX_CREATURE_IDS_PER_SPAWN && creature_id[creatureIdCount]; ++creatureIdCount);

    if (creatureIdCount)
        creatureId = creature_id[urand(0, creatureIdCount - 1)];

    if (!creatureId)
        creatureId = 1;

    return creatureId;
}

bool CreatureData::HasCreatureId(uint32 id) const
{
    return std::find(creature_id.begin(), creature_id.end(), id) != creature_id.end();
}

uint32 CreatureData::GetCreatureIdCount() const
{
    uint32 creatureIdCount = 0;
    while (creatureIdCount < MAX_CREATURE_IDS_PER_SPAWN && creature_id[creatureIdCount])
        ++creatureIdCount;
    return creatureIdCount;
}

EquipmentEntry const* EquipmentTemplate::ChooseEquipmentEntry() const
{
    if (!totalProbability)
        return nullptr;

    uint32 const roll = urand(0, totalProbability - 1);
    uint32 sum = 0;

    for (auto const& itr : equipment)
    {
        if (!itr.probability)
            continue;

        sum += itr.probability;
        if (roll < sum)
            return &itr;
    }

    return nullptr;
}


