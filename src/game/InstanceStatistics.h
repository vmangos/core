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

#ifndef INSTANCE_STATISTICS_H
#define INSTANCE_STATISTICS_H

#include "Common.h"
#include "Threading.h"

enum eInstanceCustomCounter : int
{
    MR_BIGGLESWORTH_KILLS = 0,
};

struct InstanceCreatureKlls
{
    uint32 mapId;
    uint32 creatureEntry;
    std::map<uint32, uint32> killsBySpells; 
};

struct InstanceWipes
{
    uint32 mapId;
    uint32 creatureEntry;
    uint32 count;
};

class Creature;
class Player;
class SpellEntry;

class InstanceStatisticsMgr
{
public:
    InstanceStatisticsMgr() {}

    void LoadFromDB();

public:
    void IncrementWipeCounter(uint32 mapId, uint32 creatureEntry);
    void IncrementKillCounter(Creature* pKiller, Player* pVictim, SpellEntry const* spellProto);
    void IncrementCustomCounter(eInstanceCustomCounter index, bool save);

private:
    void Save(uint32 mapId, uint32 creatureEntry, uint32 spellId, uint32 count);
    void Save(uint32 mapId, uint32 creatureEntry, uint32 count);
    
    std::map<std::pair<uint32,uint32>,InstanceWipes>        m_instanceWipes;
    std::map<std::pair<uint32,uint32>,InstanceCreatureKlls> m_instanceCreatureKills;
    std::map<uint32, uint32> m_instanceCustomCounters;
    
    ACE_Thread_Mutex m_wipesMutex;
    ACE_Thread_Mutex m_creatureKillsMutex;
    ACE_Thread_Mutex m_customCountersMutex;
};



#define sInstanceStatistics MaNGOS::Singleton<InstanceStatisticsMgr>::Instance()

#endif