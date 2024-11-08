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

#include <functional>
#include "ItemEnchantmentMgr.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "ProgressBar.h"
#include <list>
#include <vector>
#include "Util.h"
#include "World.h"

struct EnchStoreItem
{
    uint32  ench;
    float   chance;

    EnchStoreItem()
        : ench(0), chance(0) {}

    EnchStoreItem(uint32 _ench, float _chance)
        : ench(_ench), chance(_chance) {}
};

typedef std::vector<EnchStoreItem> EnchStoreList;
typedef std::unordered_map<uint32, EnchStoreList> EnchantmentStore;

static EnchantmentStore RandomItemEnch;

void LoadRandomEnchantmentsTable()
{
    RandomItemEnch.clear();                                 // for reload case

    EnchantmentStore::const_iterator tab;
    uint32 entry, ench;
    uint32 count = 0;

    std::unique_ptr<QueryResult> result = WorldDatabase.PQuery("SELECT entry, ench, chance FROM item_enchantment_template WHERE ((%u >= patch_min) && (%u <= patch_max))", sWorld.GetWowPatch(), sWorld.GetWowPatch());

    if (result)
    {
        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();
            bar.step();

            entry = fields[0].GetUInt32();
            ench = fields[1].GetUInt32();
            float chance = fields[2].GetFloat();

            if (chance > 0.000001f && chance <= 100.0f)
            {
                RandomItemEnch[entry].push_back(EnchStoreItem(ench, chance));
            }
            else
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Entry %u ench %u has chance < 0.000001 or chance > 100 (%f), skipping.", entry, ench, chance);
            }

            ++count;
        }
        while (result->NextRow());

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u Item Enchantment definitions", count);
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, ">> Loaded 0 Item Enchantment definitions. DB table `item_enchantment_template` is empty.");
    }
}

uint32 GetItemEnchantMod(uint32 entry)
{
    if (!entry)
        return 0;

    EnchantmentStore::const_iterator tab = RandomItemEnch.find(entry);

    if (tab == RandomItemEnch.end())
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Item RandomProperty id #%u used in `item_template` but it doesn't have records in `item_enchantment_template` table.", entry);
        return 0;
    }

    float chance = 0;

    EnchStoreList const& enchantList = tab->second;
    for (auto const& ench_iter : enchantList)
    {
        chance += ench_iter.chance;
    }

    float const roll = rand_chance() * (chance / 100.f);
    chance = 0.f;

    for (auto const& ench_iter : enchantList)
    {
        chance += ench_iter.chance;

        if (chance >= roll)
            return ench_iter.ench;
    }

    return 0;
}
