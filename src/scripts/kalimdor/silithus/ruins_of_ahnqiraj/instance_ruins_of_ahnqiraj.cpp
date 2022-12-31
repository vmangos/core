/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Instance_Ruins_of_Ahnqiraj
SD%Complete: 80
SDComment: Add in DB and save/load for spawning andorov
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "Group.h"
#include "CreatureGroups.h"
#include "ruins_of_ahnqiraj.h"

instance_ruins_of_ahnqiraj::instance_ruins_of_ahnqiraj(Map* pMap) : ScriptedInstance(pMap)
{
    Initialize();
};

void instance_ruins_of_ahnqiraj::Initialize()
{
    m_uiKurinnaxxGUID = 0;
    m_uiBuruGUID = 0;
    m_uiAyamissGUID = 0;
    m_uiMoamGUID = 0;
    m_uiOssirianGUID = 0;
    m_uiAndorovGUID = 0;
    m_lKaldoreiElites.clear();
    m_lOssirianPylons.clear();

    m_doorGuid.Clear();

    m_uiGladiatorDeath = 0;

    m_uiQeezGUID = 0;
    m_uiTuubidGUID = 0;
    m_uiDrennGUID = 0;
    m_uiXurremGUID = 0;
    m_uiYeggethGUID = 0;
    m_uiPakkonGUID = 0;
    m_uiZerranGUID = 0;
    m_uiRajaxxGUID = 0;

    m_uiRajaxxEventResetTimer = 2000;
    m_bRajaxxEventIsToReset = false;
}

bool instance_ruins_of_ahnqiraj::IsEncounterInProgress() const
{
    for (uint32 i : m_auiEncounter)
        if (i == IN_PROGRESS || i == SPECIAL)
            return true;
    return false;
}

uint64 instance_ruins_of_ahnqiraj::GetData64(uint32 uiData)
{
    uint64 m_uiGUIDvalue;
    uint64 m_uiYeggethSizeList;
    uint64 m_uiRandomYeggethList;
    uint32 m_uiIterator;

    switch (uiData)
    {
        case DATA_OSSIRIAN:
            return m_uiOssirianGUID;
        case DATA_BURU:
            return m_uiBuruGUID;
        case DATA_AYAMISS:
            return m_uiAyamissGUID;
        case DATA_MOAM:
            return m_uiMoamGUID;
        case DATA_ANDOROV:
            return m_uiAndorovGUID;
        case DATA_KURINNAXX:
            return m_uiKurinnaxxGUID;
        case DATA_QEEZ:
            return m_uiQeezGUID;
        case DATA_TUUBID:
            return m_uiTuubidGUID;
        case DATA_DRENN:
            return m_uiDrennGUID;
        case DATA_XURREM:
            return m_uiXurremGUID;
        case DATA_YEGGETH:
            return m_uiYeggethGUID;
        case DATA_PAKKON:
            return m_uiPakkonGUID;
        case DATA_ZERRAN:
            return m_uiZerranGUID;
        case DATA_RAJAXX:
            return m_uiRajaxxGUID;

        case DATA_YEGGETH_SHIELD:
            m_uiGUIDvalue = 0;
            m_uiYeggethSizeList = m_lYeggethShieldList.size();
            m_uiRandomYeggethList = urand(0, m_uiYeggethSizeList);
            m_uiIterator = 0;

            for (std::list<uint64>::const_iterator itr = m_lYeggethShieldList.begin();
                    itr != m_lYeggethShieldList.end() || m_uiIterator != m_uiRandomYeggethList; itr++)
            {
                m_uiGUIDvalue = instance->GetCreature(*itr)->GetObjectGuid();
                m_uiIterator++;
            }
            return m_uiGUIDvalue;

        default:
            return 0;
    }
}

void instance_ruins_of_ahnqiraj::OnCreatureEnterCombat(Creature * pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_CAPTAIN_QEEZ:
        case NPC_CAPTAIN_TUUBID:
        case NPC_CAPTAIN_DRENN:
        case NPC_CAPTAIN_XURREM:
        case NPC_MAJOR_YEGGETH:
        case NPC_MAJOR_PAKKON:
        case NPC_COLONEL_ZERRAN:
        case NPC_SWARMGUARD_NEEDLER:
        case NPC_QIRAJI_WARRIOR:
            /** Create Yeggeth list for Rajaxx Shield ability */
            if (CreatureGroup* g = pCreature->GetCreatureGroup())
                if (g->GetOriginalLeaderGuid().GetEntry() == NPC_MAJOR_YEGGETH)
                    m_lYeggethShieldList.push_back(pCreature->GetGUID());

            // Fight Change in 1.10.1
            // https://wowpedia.fandom.com/wiki/General_Rajaxx?oldid=180046
            // "Second, the strategy to NOT talk to the NPCs before you start the fight,"
            // "and just call them at the end to help with Rajaxx himself no longer works,"
            // "as soon as you pull the liutenant runs in with his group and starts to fight,"
            // "and actually blizzard even goofed that, if u pull before talking to the NPCs,"
            // "the NPCs run right past the first wave and wait at the door for them."
            if (m_auiEncounter[TYPE_RAJAXX] != DONE &&
               (m_auiEncounter[TYPE_GENERAL_ANDOROV] == NOT_STARTED || m_auiEncounter[TYPE_GENERAL_ANDOROV] == FAIL) &&
                sWorld.GetWowPatch() >= WOW_PATCH_110)
            {
                if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
                {
                    if (!pAndorov->IsAlive())
                        pAndorov->Respawn();
                    GetMap()->ScriptsStart(sGenericScripts, ANDOROV_START_SCRIPT, pAndorov->GetObjectGuid(), pAndorov->GetObjectGuid());
                    SetData(TYPE_GENERAL_ANDOROV, IN_PROGRESS);
                }
            }
            m_bRajaxxEventIsToReset = false;
            break;
        default:
            break;
    }
}

void instance_ruins_of_ahnqiraj::OnCreatureEvade(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_CAPTAIN_QEEZ:
        case NPC_CAPTAIN_TUUBID:
        case NPC_CAPTAIN_DRENN:
        case NPC_CAPTAIN_XURREM:
        case NPC_MAJOR_YEGGETH:
        case NPC_MAJOR_PAKKON:
        case NPC_COLONEL_ZERRAN:
        case NPC_SWARMGUARD_NEEDLER:
        case NPC_QIRAJI_WARRIOR:
            // If any creature from Rajaxx's wave is on evade mode, reset Rajaxx.
            m_uiRajaxxEventResetTimer = 2000;
            m_bRajaxxEventIsToReset = true;
            break;
        case NPC_KALDOREI_ELITE:
            if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
            {
                if (pAndorov->IsInCombat())
                {
                    pCreature->AddThreatsOf(pAndorov);
                    break;
                }
            }
            break;
        default:
            break;
    }
}

void instance_ruins_of_ahnqiraj::OnCreatureCreate(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_KURINNAXX:
            m_uiKurinnaxxGUID = pCreature->GetGUID();
            break;
        case NPC_CAPTAIN_QEEZ:
            m_uiQeezGUID = pCreature->GetGUID();
            break;
        case NPC_CAPTAIN_TUUBID:
            m_uiTuubidGUID = pCreature->GetGUID();
            break;
        case NPC_CAPTAIN_DRENN:
            m_uiDrennGUID = pCreature->GetGUID();
            break;
        case NPC_CAPTAIN_XURREM:
            m_uiXurremGUID = pCreature->GetGUID();
            break;
        case NPC_MAJOR_YEGGETH:
            m_uiYeggethGUID = pCreature->GetGUID();
            break;
        case NPC_MAJOR_PAKKON:
            m_uiPakkonGUID = pCreature->GetGUID();
            break;
        case NPC_COLONEL_ZERRAN:
            m_uiZerranGUID = pCreature->GetGUID();
            break;
        case NPC_RAJAXX:
            m_uiRajaxxGUID = pCreature->GetGUID();
            break;
        case NPC_BURU:
            m_uiBuruGUID = pCreature->GetGUID();
            break;
        case NPC_AYAMISS:
            m_uiAyamissGUID = pCreature->GetGUID();
            break;
        case NPC_MOAM:
            m_uiMoamGUID = pCreature->GetGUID();
            break;
        case NPC_OSSIRIAN:
            m_uiOssirianGUID = pCreature->GetGUID();
            break;
        case NPC_GENERAL_ANDOROV:
            m_uiAndorovGUID = pCreature->GetGUID();
            break;
        case NPC_KALDOREI_ELITE:
            m_lKaldoreiElites.push_back(pCreature->GetGUID());
            break;
        default:
            break;
    }
}

void instance_ruins_of_ahnqiraj::OnObjectCreate(GameObject *pGo)
{
    switch (pGo->GetEntry())
    {
        case 180619:
            m_lOssirianPylons.push_back(pGo->GetGUID());
            if (pGo->GetGUID() == 399461)
            {
                pGo->SetSpawnedByDefault(false);
                pGo->SetRespawnTime(-10);
                pGo->Refresh();
                pGo->Respawn();
            }
            else
            {
                pGo->SetSpawnedByDefault(false);
                pGo->SetRespawnTime(-5);
                pGo->UpdateObjectVisibility();
            }
            break;
    }
}

void instance_ruins_of_ahnqiraj::OnCreatureDeath(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_RAJAXX:
            GiveRepAfterRajaxxDeath(pCreature);
            break;
        case NPC_CAPTAIN_QEEZ:
        case NPC_CAPTAIN_TUUBID:
        case NPC_CAPTAIN_DRENN:
        case NPC_CAPTAIN_XURREM:
        case NPC_MAJOR_YEGGETH:
        case NPC_MAJOR_PAKKON:
        case NPC_COLONEL_ZERRAN:
        case NPC_SWARMGUARD_NEEDLER:
        case NPC_QIRAJI_WARRIOR:
            if (pCreature->GetEntry() == NPC_SWARMGUARD_NEEDLER || pCreature->GetEntry() == NPC_QIRAJI_WARRIOR)
            {
                pCreature->ForcedDespawn(3000);
                pCreature->SetRespawnTime(AQ_RESPAWN_FOUR_DAYS);
            }
            break;
        case NPC_GENERAL_ANDOROV:
            pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
        // no break
        case NPC_KALDOREI_ELITE:
            // No respawn before Kurinaxx's death or during Rajaxx event.
            if ((m_auiEncounter[TYPE_KURINNAXX] != DONE) || (m_auiEncounter[TYPE_RAJAXX] == IN_PROGRESS))
                pCreature->SetRespawnTime(AQ_RESPAWN_FOUR_DAYS);
            else
                pCreature->SetRespawnTime(AQ_RESPAWN_15_MINUTES);
            break;
        default:
            break;
    }
}

uint32 instance_ruins_of_ahnqiraj::GetData(uint32 uiType)
{
    switch (uiType)
    {
        case TYPE_QIRAJI_GLADIATOR:
            return m_uiGladiatorDeath;
            break;
        case TYPE_KURINNAXX:
        case TYPE_GENERAL_ANDOROV:
        case TYPE_RAJAXX:
        case TYPE_BURU:
        case TYPE_MOAM:
        case TYPE_AYAMISS:
        case TYPE_OSSIRIAN:
            return m_auiEncounter[uiType];
        default:
            return 0;
    }
}

void instance_ruins_of_ahnqiraj::SetData(uint32 uiType, uint32 uiData)
{
    switch (uiType)
    {
        case TYPE_QIRAJI_GLADIATOR:
            if (uiData > 0)
                m_uiGladiatorDeath = m_uiGladiatorDeath + uiData;
            else
                m_uiGladiatorDeath = 0;
            return;
        case TYPE_KURINNAXX:
            m_auiEncounter[TYPE_KURINNAXX] = uiData;
            break;
        case TYPE_GENERAL_ANDOROV:
            if (uiData == NOT_STARTED || uiData == FAIL)
            {
                if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
                    pAndorov->SetDefaultGossipMenuId(ANDOROV_GOSSIP_NOT_STARTED);
            }
            if (uiData == IN_PROGRESS)
            {
                SetAndorovSquadImmunity(false);
                if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
                {
                    pAndorov->SetDefaultGossipMenuId(ANDOROV_GOSSIP_IN_PROGRESS);
                    pAndorov->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_VENDOR);
                }
            }
            m_auiEncounter[TYPE_GENERAL_ANDOROV] = uiData;
            break;
        case TYPE_RAJAXX:
            if (uiData == NOT_STARTED)
            {
                /** Respawn Andorov and elite in 15 minutes */
                if (m_auiEncounter[TYPE_KURINNAXX] == DONE)
                    SetAndorovSquadRespawnTime(AQ_RESPAWN_15_MINUTES);
            }
            if (uiData == DONE)
            {
                if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
                {
                    // World of Warcraft Client Patch 1.10.0 (2006-03-28)
                    // - Lieutenant General Andorov will now offer supplies if kept alive
                    //   through the battle.
                    if (sWorld.GetWowPatch() >= WOW_PATCH_110)
                        pAndorov->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_VENDOR);

                    pAndorov->SetDefaultGossipMenuId(ANDOROV_GOSSIP_DONE);
                    pAndorov->SetRespawnTime(AQ_RESPAWN_FOUR_DAYS);
                }
                SetAndorovSquadImmunity(true);
            }
            m_bRajaxxEventIsToReset = false;
            m_auiEncounter[TYPE_RAJAXX] = uiData;
            break;
        case TYPE_OSSIRIAN:
            if (uiData == FAIL || uiData == DONE)
            {
                for (const auto& crystalGuid : crystalGuids)
                {
                    if (GameObject* invoc = instance->GetGameObject(crystalGuid))
                        invoc->AddObjectToRemoveList();
                }

                crystalGuids.clear();
                crystalIndexes.clear();
                crystalIndexHistory.clear();
            }
            m_auiEncounter[TYPE_OSSIRIAN] = uiData;
            break;
        case TYPE_BURU:
        case TYPE_MOAM:
        case TYPE_AYAMISS:
            m_auiEncounter[uiType] = uiData;
            break;
        default:
            return;
    }

    /** What is the goal of this ???? */
    if (uiType < INSTANCE_RUINS_AQ_MAX_ENCOUNTER && uiData == DONE)
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " "
            << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " << m_auiEncounter[5] << " " << m_auiEncounter[6];

        strInstData = saveStream.str();

        SaveToDB();
        OUT_SAVE_INST_DATA_COMPLETE;
    }
}

char const* instance_ruins_of_ahnqiraj::Save()
{
    return strInstData.c_str();
}

void instance_ruins_of_ahnqiraj::Load(char const* chrIn)
{
    if (!chrIn)
    {
        OUT_LOAD_INST_DATA_FAIL;
        return;
    }

    OUT_LOAD_INST_DATA(chrIn);

    std::istringstream loadStream(chrIn);

    loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3]
        >> m_auiEncounter[4] >> m_auiEncounter[5] >> m_auiEncounter[6];

    for (uint32 & i : m_auiEncounter)
        if (i == IN_PROGRESS || i > SPECIAL)           // Do not load an encounter as "In Progress" - reset it instead.
            i = NOT_STARTED;

    if (m_auiEncounter[TYPE_GENERAL_ANDOROV] == DONE)
        m_auiEncounter[TYPE_GENERAL_ANDOROV] = NOT_STARTED;

    OUT_LOAD_INST_DATA_COMPLETE;
}

void instance_ruins_of_ahnqiraj::Update(uint32 uiDiff)
{
    /*
    Fight Change in 1.10.1

    This fight has changed somewhat, first off if someone dies
    they are no longer able to return via release and run back,
    there is a big door that closes and you cannot get past it.

    https://wowwiki-archive.fandom.com/wiki/General_Rajaxx?oldid=121120#Fight_Change_in_1.10.1
    */
    if (sWorld.GetWowPatch() > WOW_PATCH_109)
    {
        if (IsAnyBossInCombat())
        {
            if (m_doorGuid.IsEmpty())
            {
                if (GameObject* pAQDoor = GetMap()->SummonGameObject(176149,
                    -8526,
                    1507.4f,
                    49,
                    4.20662f, 0, 0, 0.861534f, -0.5077f, -1, 0))
                    m_doorGuid = pAQDoor->GetObjectGuid();
            }
        }
        else
        {
            if (!m_doorGuid.IsEmpty())
            {
                if (GameObject* pAQDoor = GetMap()->GetGameObject(m_doorGuid))
                    pAQDoor->AddObjectToRemoveList();
                m_doorGuid.Clear();
            }
        }
    }

    if (m_auiEncounter[TYPE_KURINNAXX] == DONE && m_auiEncounter[TYPE_RAJAXX] != DONE && !m_uiAndorovGUID)
    {
        if (Creature* pAndorov = GetMap()->LoadCreatureSpawnWithGroup(ANDOROV_DB_GUID))
        {
            pAndorov->SetDefaultGossipMenuId(ANDOROV_GOSSIP_IN_PROGRESS);
            pAndorov->GetMotionMaster()->MoveWaypoint(0, 0, 0, 0, 0, false);
        }
    }

    if (m_bRajaxxEventIsToReset)
    {
        if (m_uiRajaxxEventResetTimer < uiDiff)
        {
            if (Creature* pRajaxx = instance->GetCreature(m_uiRajaxxGUID))
                pRajaxx->AI()->EnterEvadeMode();
            m_bRajaxxEventIsToReset = false;
        }
        else
            m_uiRajaxxEventResetTimer -= uiDiff;
    }

    for (auto iter = crystalIndexes.begin(); iter != crystalIndexes.end();)
    {
        // Crystal was despawned but still in our index for some reason
        if (!instance->GetGameObject(iter->first))
        {
            iter = crystalIndexes.erase(iter);
        }
        else
            ++iter;
    }
}

/* Private methods */

bool instance_ruins_of_ahnqiraj::IsAnyBossInCombat()
{
    if (GetData(TYPE_GENERAL_ANDOROV) == IN_PROGRESS)
        return true;

    for (int i = DATA_KURINNAXX; i <= DATA_ZERRAN; i++)
    {
        if (uint64 guid = GetData64(i))
        {
            if (Creature* pCreature = GetMap()->GetCreature(guid))
                if (pCreature->IsAlive() && pCreature->GetVictim())
                    return true;
        }
    }
    return false;
}

void instance_ruins_of_ahnqiraj::SetAndorovSquadRespawnTime(uint32 nextRespawnDelay)
{
    if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
    {
        if (!pAndorov->IsAlive())
            pAndorov->SetRespawnTime(nextRespawnDelay);
    }
    for (const auto& guid : m_lKaldoreiElites)
    {
        if (Creature* pElite = instance->GetCreature(guid))
        {
            if (!pElite->IsAlive())
                pElite->SetRespawnTime(nextRespawnDelay);
        }
    }
}

void instance_ruins_of_ahnqiraj::SetAndorovSquadImmunity(bool immune)
{
    if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
    {
        if (immune)
            pAndorov->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
        else
            pAndorov->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
    }
    for (const auto& guid : m_lKaldoreiElites)
    {
        if (Creature* pElite = instance->GetCreature(guid))
        {
            if (immune)
                pElite->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            else
                pElite->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
        }
    }
}

void instance_ruins_of_ahnqiraj::GiveRepAfterRajaxxDeath(Creature* pRajaxx)
{
    FactionEntry const *factionEntry = sObjectMgr.GetFactionEntry(609); // Cenarion Circle
    if (!factionEntry)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Rajaxx just died, unable to find Cenarion Circle faction");
        return;
    }

    bool andorovAlive = false;
    if (Creature* pAndorov = instance->GetCreature(m_uiAndorovGUID))
        if (pAndorov->IsAlive())
            andorovAlive = true;

    std::list<Creature*> helpers;
    GetCreatureListWithEntryInGrid(helpers, pRajaxx, NPC_KALDOREI_ELITE, 400.0f);

    int helpersAlive = 0;
    for (const auto it : helpers)
    {
        if (it->IsAlive())
        {
            helpersAlive++;
            if (!andorovAlive)
            {
                it->DespawnOrUnsummon(); // kaldorei despawn if andorov is dead
                it->SetRespawnTime(AQ_RESPAWN_FOUR_DAYS);
            }
        }
    }

    if (andorovAlive)
        helpersAlive++;

    // Rep gain was buffed in patch 1.10.
    // Old - https://www.youtube.com/watch?v=NOF6xI7Iwj8
    // New - https://www.youtube.com/watch?v=ETO4UsKbKOY
    int const repForKill = sWorld.GetWowPatch() >= WOW_PATCH_110 ? 50 : irand(33, 34);
    int const repPerHelper = sWorld.GetWowPatch() >= WOW_PATCH_110 ? 45 : 30;

    auto GiveRep = [factionEntry, helpersAlive, repForKill, repPerHelper](Player* pPlayer)
    {
        uint32 current_reputation_rank1 = pPlayer->GetReputationMgr().GetRank(factionEntry);
        if (factionEntry && current_reputation_rank1 <= 7)
        {
            for (int i = 0; i < 3; i++)
                pPlayer->GetReputationMgr().ModifyReputation(factionEntry, repForKill);

            // you get 45 rep for every alive helper
            for (int i = 0; i < helpersAlive; i++)
                pPlayer->GetReputationMgr().ModifyReputation(factionEntry, repPerHelper);
        }
    };

    if (Player* pLootRecepient = pRajaxx->GetLootRecipient())
    {
        GiveRep(pLootRecepient);

        if (Group* pGroup = pLootRecepient->GetGroup())
        {
            for (GroupReference *itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
            {
                Player* pGroupGuy = itr->getSource();
                if (!pGroupGuy || !pGroupGuy->IsInWorld() || pGroupGuy == pLootRecepient)
                    continue;

                GiveRep(pGroupGuy);
            }
        }
    }
}

/**
* The spawn logic is as follows (approximated as much as possible from
* multiple videos):
* https://www.youtube.com/watch?v=Y2ITGk5_8hc
* https://www.youtube.com/watch?v=fyivFwDIAtI
* https://www.youtube.com/watch?v=qb0zZ3xkKLk
* https://www.youtube.com/watch?v=Mlh8lSaBqPk
* https://www.youtube.com/watch?v=Je2USKK2qhs
* 1. From the last crystal used, find a crystal location within 80 yards.
* 2. Spawn two crystals. One at, and one near to, this location
* There are some rules regarding how many crystals should be spawned and
* where.
* 1. Only 2 crystals should be spawned at once
* 2. We should not spawn the same crystal as the one used
* 3. We should maintain a short history of spawned locations to ensure some variety
*/
void instance_ruins_of_ahnqiraj::SpawnNewCrystals(ObjectGuid usedCrystal)
{
    uint32 used = 0;
    auto previous = crystalIndexes.find(usedCrystal);
    if (previous != crystalIndexes.end())
    {
        used = previous->second;
        crystalIndexes.erase(previous);
    }

    // Truncate the history first
    crystalIndexHistory.resize(2);

    crystalIndexHistory.push_front(used);

    SpawnLocations previousLoc = CrystalSpawn.at(used);
    // Expand the search after a certain number of attempts otherwise
    // it may be impossible to spawn one within range and we deadlock
    uint32 attempts = 0;
    float maxDistanceLimit = OSSIRIAN_CRYSTAL_INITIAL_DIST;
    float minDistanceLimit = maxDistanceLimit / 2;

    // We already have another crystal spawned. Use that as the hint
    if (!crystalIndexes.empty())
    {
        maxDistanceLimit *= 0.75f;
        minDistanceLimit *= 0.75f;
        uint32 hint = crystalIndexes.begin()->second;
        previousLoc = CrystalSpawn.at(hint);
        crystalIndexHistory.push_front(hint);
    }

    std::vector<uint32> possibleIndexes;
    possibleIndexes.reserve(CrystalSpawn.size());
    for (uint32 i = 0; i < CrystalSpawn.size(); ++i)
    {
        auto iter = std::find(crystalIndexHistory.cbegin(), crystalIndexHistory.cend(), i);
        if (iter != crystalIndexHistory.end())
            continue;

        possibleIndexes.push_back(i);
    }

    std::random_shuffle(possibleIndexes.begin(), possibleIndexes.end());

    while (crystalIndexes.size() < OSSIRIAN_CRYSTAL_NUM_ACTIVE)
    {
        for (auto iter = possibleIndexes.begin(); iter != possibleIndexes.end() && crystalIndexes.size() < OSSIRIAN_CRYSTAL_NUM_ACTIVE;)
        {
            if (++attempts >= 5)
            {
                // increase distance to search further each extra attempt
                minDistanceLimit *= 0.9f;
                maxDistanceLimit *= 1.1f;
            }

            uint32 newIndex = *iter;
            const SpawnLocations& newLoc = CrystalSpawn.at(newIndex);
            float dist = sqrt(pow(newLoc.x - previousLoc.x, 2) + pow(newLoc.y - previousLoc.y, 2));
            if (dist > maxDistanceLimit || dist < minDistanceLimit)
            {
                ++iter;
                continue;
            }

            GameObject* pCrystal = instance->SummonGameObject(GO_OSSIRIAN_CRYSTAL,
                newLoc.x,
                newLoc.y,
                newLoc.z,
                0, 0, 0, 0, 0, -1, 1);

            if (!pCrystal)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "[OSSIRIAN] Unable to spawn crystal %u at position #%u", GO_OSSIRIAN_CRYSTAL, newIndex);
                return;
            }

            // Use the new location as a hint and reduce the limit so the next one
            // spawns close as well
            maxDistanceLimit *= 0.50f;
            minDistanceLimit *= 0.50f;
            previousLoc = newLoc;
            iter = possibleIndexes.erase(iter); // remove selected index

            crystalGuids.push_back(pCrystal->GetObjectGuid());
            crystalIndexes[pCrystal->GetObjectGuid()] = newIndex;
        }
    }
}

InstanceData* GetInstanceData_instance_ruins_of_ahnqiraj(Map* pMap)
{
    return new instance_ruins_of_ahnqiraj(pMap);
}

void AddSC_instance_ruins_of_ahnqiraj()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "instance_ruins_of_ahnqiraj";
    newscript->GetInstanceData = &GetInstanceData_instance_ruins_of_ahnqiraj;
    newscript->RegisterSelf();
}

