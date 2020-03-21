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

    sLog.outString("> Loading table `instance_buff_removal`");
    uint32 count = 0;
    QueryResult* result = WorldDatabase.Query("SELECT map_id, spell_id, enabled, flags, comment FROM instance_buff_removal");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Table instance_buff_removal is empty.");
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

        sLog.outString(">> Loaded %u entries from instance_buff_removal", count);
        sLog.outString();

        delete result;
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

void AuraRemovalManager::Update(uint32 timer)
{
    m_timer.Update(timer);
    if (m_timer.Passed())
        m_timer.Reset(AURA_REMOVAL_INTERVAL);
    else
        return;

    uint32 const currentCount = m_counter;
    m_maxCount = std::max(currentCount, m_maxCount);
    for (uint32 i = 0; i < m_maxCount; i++)
    {
        AuraReference& entry = m_auras[i];
        if (entry.aura && entry.references <= 0 && !entry.aura->IsInUse())
        {
            delete entry.aura;
            entry.aura = nullptr;
            entry.references = 0;
        }
    }
    if (currentCount > AURA_HOLDER_COUNT_SOFT_LIMIT)
    {
        sLog.outInfo("[AuraRemovalManager] Resetting aura counter to prevent overflow.");
        m_counter = 0;
    }
}
