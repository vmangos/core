/*
* Copyright (C) 2024 Vanilla MaNGOS <https://github.com/vmangos>
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

#include "PlayerImmunityMgr.h"
#include "Policies/Singleton.h"
#include "Database/DatabaseEnv.h"
#include "Policies/SingletonImp.h"
#include "Player.h"
#include "ProgressBar.h"

INSTANTIATE_SINGLETON_1(PlayerImmunityManager);

void PlayerImmunityManager::LoadFromDB()
{
    m_data.clear();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "> Loading table `instance_player_immunity`");
    uint32 count = 0;
    std::unique_ptr<QueryResult> result = WorldDatabase.Query("SELECT map_id, immunity_flags, enabled FROM instance_player_immunity");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Table instance_player_immunity is empty.");
    }
    else
    {
        BarGoLink bar((int)result->GetRowCount());
        do
        {
            bar.step();

            Field* fields = result->Fetch();

            uint32 mapId  = fields[0].GetUInt32();
            uint32 immunityFlags = fields[1].GetUInt32();
            bool enabled = (bool)fields[2].GetUInt8();

            ++count;

            if (enabled)
                m_data[mapId] = immunityFlags;

        } while (result->NextRow());

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u entries from instance_player_immunity", count);
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    }
}

void PlayerImmunityManager::PlayerEnterMap(uint32 mapId, Player* pPlayer)
{
    if (!pPlayer || m_data.empty())
        return;

    auto it = m_data.find(mapId);
    if (it != m_data.end())
    {
        // apply immunities
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_CHARM, SPELL_SRC_IMMUNITY_CHARM, IMMUNITY_MECHANIC, MECHANIC_CHARM);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_FEAR, SPELL_SRC_IMMUNITY_FEAR, IMMUNITY_MECHANIC, MECHANIC_FEAR);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_SILENCE, SPELL_SRC_IMMUNITY_SILENCE, IMMUNITY_MECHANIC, MECHANIC_SILENCE);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_SLEEP, SPELL_SRC_IMMUNITY_SLEEP, IMMUNITY_MECHANIC, MECHANIC_SLEEP);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_STUN, SPELL_SRC_IMMUNITY_STUN, IMMUNITY_MECHANIC, MECHANIC_STUN);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_FREEZE, SPELL_SRC_IMMUNITY_FREEZE, IMMUNITY_MECHANIC, MECHANIC_FREEZE);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_KNOCKOUT, SPELL_SRC_IMMUNITY_KNOCKOUT, IMMUNITY_MECHANIC, MECHANIC_KNOCKOUT);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_POLYMORPH, SPELL_SRC_IMMUNITY_POLYMORPH, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_HORROR, SPELL_SRC_IMMUNITY_HORROR, IMMUNITY_MECHANIC, MECHANIC_HORROR);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_DAZE, SPELL_SRC_IMMUNITY_DAZE, IMMUNITY_MECHANIC, MECHANIC_DAZE);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_SAPPED, SPELL_SRC_IMMUNITY_SAPPED, IMMUNITY_MECHANIC, MECHANIC_SAPPED);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_KNOCK_BACK, SPELL_SRC_IMMUNITY_KNOCK_BACK, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK);
        ApplyImmunity(pPlayer, it->second, PLAYER_IMMUNITY_POWER_DRAIN, SPELL_SRC_IMMUNITY_POWER_DRAIN, IMMUNITY_EFFECT, SPELL_EFFECT_POWER_DRAIN);
    }
    else
    {
        // remove all immunities
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_CHARM, IMMUNITY_MECHANIC, MECHANIC_CHARM, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_FEAR, IMMUNITY_MECHANIC, MECHANIC_FEAR, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_SILENCE, IMMUNITY_MECHANIC, MECHANIC_SILENCE, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_SLEEP, IMMUNITY_MECHANIC, MECHANIC_SLEEP, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_STUN, IMMUNITY_MECHANIC, MECHANIC_STUN, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_FREEZE, IMMUNITY_MECHANIC, MECHANIC_FREEZE, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_KNOCKOUT, IMMUNITY_MECHANIC, MECHANIC_KNOCKOUT, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_POLYMORPH, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_HORROR, IMMUNITY_MECHANIC, MECHANIC_HORROR, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_DAZE, IMMUNITY_MECHANIC, MECHANIC_DAZE, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_SAPPED, IMMUNITY_MECHANIC, MECHANIC_SAPPED, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_KNOCK_BACK, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, false);
        pPlayer->ApplySpellImmune(SPELL_SRC_IMMUNITY_POWER_DRAIN, IMMUNITY_EFFECT, SPELL_EFFECT_POWER_DRAIN, false);
    }
}

void PlayerImmunityManager::ApplyImmunity(Player* pPlayer, uint32 immunityFlags, uint32 playerImmunity, uint32 spellId, uint32 op, uint32 type)
{
    if (immunityFlags & playerImmunity)
        pPlayer->ApplySpellImmune(spellId, op, type, true);
    else
        pPlayer->ApplySpellImmune(spellId, op, type, false);
}
