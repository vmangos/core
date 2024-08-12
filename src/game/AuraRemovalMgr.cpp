/*
* Copyright (C) 2017 Elysium Project <https://github.com/elysium-project>
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

#include "AuraRemovalMgr.h"
#include "Policies/Singleton.h"
#include "Database/DatabaseEnv.h"
#include "Policies/SingletonImp.h"
#include "Player.h"
#include "ProgressBar.h"

INSTANTIATE_SINGLETON_1(AuraRemovalManager);

void AuraRemovalManager::LoadFromDB()
{
    m_data.clear();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "> Loading table `instance_buff_removal`");
    uint32 count = 0;
    std::unique_ptr<QueryResult> result = WorldDatabase.Query("SELECT map_id, spell_id, enabled, flags, comment FROM instance_buff_removal");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Table instance_buff_removal is empty.");
    }
    else
    {
        BarGoLink bar((int)result->GetRowCount());
        do
        {
            bar.step();

            Field* fields = result->Fetch();

            uint32 mapId  = fields[0].GetUInt32();
            uint32 auraId = fields[1].GetUInt32();
            bool enabled = (bool)fields[2].GetUInt8();
            uint32 flags = fields[3].GetUInt32();

            ++count;

            if (enabled)
                m_data[mapId].push_back(AuraRemovalEntry{ auraId, flags });

        } while (result->NextRow());

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u entries from instance_buff_removal", count);
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    }
}

void AuraRemovalManager::PlayerEnterMap(uint32 mapId, Player* pPlayer)
{
    if (!pPlayer)
        return;

    auto it = m_data.find(mapId);
    if (it == m_data.end()) 
        return;

    for(const auto& aura : it->second)
    {
        
        if (pPlayer->GetTeam() == Team::HORDE && (aura.flags & AURA_REM_FLAG_EXCLUDE_HORDE))
            continue;
        else if (pPlayer->GetTeam() == Team::ALLIANCE && (aura.flags & AURA_REM_FLAG_EXCLUDE_ALLIANCE))
            continue;

        if (pPlayer->HasAura(aura.auraEntry))
            pPlayer->RemoveAurasDueToSpellByCancel(aura.auraEntry);
    }
}
