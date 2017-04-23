/* Copyright (C) 2006 - 2012 ScriptDev2 <http://www.scriptdev2.com/>
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
 SDName: Instance_Uldaman
 SD%Complete: 60
 SDComment:
 SDCategory: Uldaman
 EndScriptData
 */

#include "scriptPCH.h"
#include "uldaman.h"

struct instance_uldaman : public ScriptedInstance
{
    instance_uldaman(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    uint64 m_uiGoSealOfKhazMulGUID;

    /*****************************/

    uint64 uiArchaedasGUID;
    uint64 uiAltarOfArchaedas;
    uint64 uiIronayaGUID;
    uint64 uiWhoWokeIronayaGUID;
    uint64 uiAltarOfTheKeeper;
    uint64 uiAltarOfTheKeeperTempleDoor;
    uint64 uiAncientVaultDoor;
    uint64 uiIronayaSealDoor;
    uint64 uiKeystoneGUID;
    uint32 uiIronayaSealDoorTimer;
    ObjectGuid uiArchaedasTempleDoor;
    bool bKeystoneCheck;

    uint32 m_auiEncounter[ULDAMAN_MAX_ENCOUNTER];

    std::vector<uint64> vStoneKeeper;
    std::vector<uint64> vAltarOfTheKeeperCount;
    std::vector<uint64> vVaultWarder;
    std::vector<uint64> vVaultWarderFurniture;
    std::vector<uint64> vEarthenGuardian;
    std::vector<uint64> vArchaedasWallMinions; //Minions lined up around the wall

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        m_uiGoSealOfKhazMulGUID = 0;

        uiArchaedasGUID = 0;
        uiAltarOfArchaedas = 0;
        uiIronayaGUID = 0;
        uiWhoWokeIronayaGUID = 0;
        uiAltarOfTheKeeper = 0;
        uiAltarOfTheKeeperTempleDoor = 0;
        uiArchaedasTempleDoor.Clear();
        uiAncientVaultDoor = 0;
        uiIronayaSealDoor = 0;
        uiKeystoneGUID = 0;
        uiIronayaSealDoorTimer = 27000; //animation time
        bKeystoneCheck = false;
        vVaultWarder.reserve(2);
        vVaultWarderFurniture.reserve(2);
        vEarthenGuardian.reserve(6);
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < ULDAMAN_MAX_ENCOUNTER; ++i)
        {
            if (m_auiEncounter[i] == IN_PROGRESS)
            {
                return true;
            }
        }

        return false;
    }


    void OnCreatureCreate(Creature* pCreature)
    {
        switch (pCreature->GetEntry())
        {
            case NPC_STONE_KEEPER:
                vStoneKeeper.push_back(pCreature->GetGUID());
                break;
            case NPC_EARTHEN_CUSTODIAN:
                vArchaedasWallMinions.push_back(pCreature->GetGUID());
                break;
            case NPC_EARTHEN_HALLSHAPER:
                vArchaedasWallMinions.push_back(pCreature->GetGUID());
                break;
            case NPC_EARTHEN_GUARDIAN:
                vEarthenGuardian.push_back(pCreature->GetGUID());
                break;
            case NPC_IRONAYA:
                uiIronayaGUID = pCreature->GetGUID();
                if (m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR] != DONE)
                {
                    SetFrozenState(pCreature);
                }
                break;
            case NPC_VAULT_WARDER:
                // Only take the ones inside Archaedas room
                if (pCreature->IsWithinDist2d(104, 272, 35.0f))
                {
                    vVaultWarder.push_back(pCreature->GetGUID());
                }
                else
                {
                    vVaultWarderFurniture.push_back(pCreature->GetGUID());
                }
                break;
            case NPC_ARCHAEDAS:
                uiArchaedasGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* pGo)
    {
        //sLog.outError("%s %u",pGo->GetNameForLocaleIdx(0),pGo->GetEntry());
        switch (pGo->GetEntry())
        {
            case GO_ALTAR_ARCHAEDAS:
                uiAltarOfArchaedas = pGo->GetGUID();
                break;
            case GO_ALTAR_KEEPERS:
                uiAltarOfTheKeeper = pGo->GetGUID();
                break;
            case GO_ALTAR_OF_THE_KEEPER_TEMPLE_DOOR:
                uiAltarOfTheKeeperTempleDoor = pGo->GetGUID();
                break;
            case GO_ARCHAEDAS_TEMPLE_DOOR:
                uiArchaedasTempleDoor = pGo->GetObjectGuid();
                break;
            case GO_ANCIENT_VAULT_DOOR:
                pGo->SetGoState(GO_STATE_READY);
                pGo->SetUInt32Value(GAMEOBJECT_FLAGS, 33);
                uiAncientVaultDoor = pGo->GetGUID();
                break;
            case GO_IRONAYA_SEAL_DOOR:
                uiIronayaSealDoor = pGo->GetGUID();
                break;
            case GO_KEYSTONE:
                uiKeystoneGUID = pGo->GetGUID();
                if (m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR] == DONE)
                {
                    pGo->SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                }
                break;
        }
    }

    void SetFrozenState(Creature* creature)
    {
        creature->setFaction(FACTION_STONED);
        creature->RemoveAllAuras();
        creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        if (!creature->HasAura(SPELL_STONED))
        {
            creature->CastSpell(creature, SPELL_STONED, false);
        }
    }

    void SetUnFrozenState(Creature* creature)
    {
        creature->setFaction(FACTION_AWAKE);
        if (creature->HasAura(SPELL_STONED))
        {
            creature->RemoveAurasDueToSpell(SPELL_STONED);
        }
        creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        //creature->clearUnitState(UNIT_STAT_ROOT | UNIT_STAT_PENDING_ROOT);
        //creature->RemoveFlag(UNIT_FIELD_FLAGS,
    //                    UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
    }

    void SetData64(uint32 type, uint64 data)
    {
        // Ironaya's waker
        if (type == 0)
        {
            uiWhoWokeIronayaGUID = data;
        }
        // Unfreeze this creature
        else if (type == 1)
        {
            if (Creature* target = GetMap()->GetCreature(data))
            {
                SetUnFrozenState(target);
            }
        }
        // Freeze this creature
        else if (type == 2)
        {
            if (Creature* target = GetMap()->GetCreature(data))
            {
                SetFrozenState(target);
            }
        }
    }

    uint64 GetData64(uint32 uiData)
    {
        if (uiData == 0) return uiWhoWokeIronayaGUID;
        if (uiData == 1) return vVaultWarder[0]; // VaultWarder1
        if (uiData == 2) return vVaultWarder[1]; // VaultWarder2
        if (uiData == 5) return vEarthenGuardian[0];
        if (uiData == 6) return vEarthenGuardian[1];
        if (uiData == 7) return vEarthenGuardian[2];
        if (uiData == 8) return vEarthenGuardian[3];
        if (uiData == 9) return vEarthenGuardian[4];
        if (uiData == 10) return vEarthenGuardian[5];
        if (uiData == 11) return uiArchaedasGUID;
        if (uiData == 12) return vVaultWarderFurniture[0];
        if (uiData == 13) return vVaultWarderFurniture[1];

        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch (uiType)
        {
            case DATA_ALTAR_DOORS :
                m_auiEncounter[ULDAMAN_ENCOUNTER_ALTAR_DOORS] = uiData;
                if (uiData == DONE)
                {
                    DoOpenDoor(uiAltarOfTheKeeperTempleDoor);
                }
                break;
            case DATA_ANCIENT_DOOR:
                m_auiEncounter[ULDAMAN_ENCOUNTER_ANCIENT_DOOR] = uiData;
                if (uiData == DONE) //archeadas defeat
                {
                    DoOpenDoor(uiArchaedasTempleDoor); //re open enter door
                    DoOpenDoor(uiAncientVaultDoor);
                }
                else if (uiData == FAIL)
                {
                    DoOpenDoor(uiArchaedasTempleDoor);
                    if (GameObject* pGo = GetGameObject(uiArchaedasTempleDoor))
                    {
                        pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                    }
                }
                else if (uiData == IN_PROGRESS)
                {
                    DoResetDoor(uiArchaedasTempleDoor); //reset the door
                    if (GameObject* pGo = GetGameObject(uiArchaedasTempleDoor))
                    {
                        pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
                    }
                }
                break;
            case DATA_IRONAYA_DOOR:
                DoOpenDoor(m_uiGoSealOfKhazMulGUID);
                m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR] = uiData;
                break;
            case DATA_KEEPERS_ALTAR :
                if (uiData == IN_PROGRESS)
                {
                    if(GameObject* pGo = instance->GetGameObject(uiAltarOfTheKeeper))
                    {
                        pGo->SetGoState(GO_STATE_ACTIVE);
                    }
                }
                else if (uiData == NOT_STARTED)
                {
                    if(GameObject* pGo = instance->GetGameObject(uiAltarOfTheKeeper))
                    {
                        pGo->SetGoState(GO_STATE_READY);
                    }
                }
                break;
            case DATA_STONE_KEEPERS:
                switch (uiData)
                {
                    case IN_PROGRESS:
                    {
                        m_auiEncounter[ULDAMAN_ENCOUNTER_STONE_KEEPERS] = uiData;
                        /** Check the list of Stone Keeper created at instance creation */
                        Creature* target = nullptr;
                        for (const auto& it : vStoneKeeper)
                        {
                            Creature* current = instance->GetCreature(it);

                            /* Do nothing if one is already alive and awaken */
                            if (current && current->isAlive() && current->getFaction() == FACTION_AWAKE)
                            {
                                return;
                            }
                            /* Save a creature that can be awaken for later */
                            if (!target && current && current->isAlive() && current->getFaction() != FACTION_AWAKE)
                            {
                                target = current;
                            }
                        }
                        if (target)
                        {
                            /** Creature become alive */
                            SetUnFrozenState(target);
                            if (Unit* victim = target->SelectNearestTarget(80.0f))
                            {
                                target->AI()->AttackStart(victim);
                            }
                            else
                            {
                                SetData(DATA_STONE_KEEPERS, FAIL);
                            }
                            return;
                        }
                        if (GetData(DATA_ALTAR_DOORS) != DONE) //Never close these doors
                        {
                            SetData(DATA_ALTAR_DOORS, DONE); //Open the doors
                        }
                        break;
                    }
                    case FAIL:
                        m_auiEncounter[ULDAMAN_ENCOUNTER_STONE_KEEPERS] = uiData;
                        for (const auto& it : vStoneKeeper)
                        {
                            Creature* target = instance->GetCreature(it);
                            if (!target)
                            {
                                continue;
                            }
                            if (target->isDead())
                            {
                                target->Respawn();
                                SetFrozenState(target);
                            }
                            else if (target->getFaction() == FACTION_AWAKE)
                            {
                                target->SetDeathState(JUST_DIED);
                                target->RemoveCorpse();
                                target->Respawn();
                                SetFrozenState(target);
                            }
                        }
                        break;
                    default:
                        m_auiEncounter[ULDAMAN_ENCOUNTER_STONE_KEEPERS] = uiData;
                        break;
                }
                break;
            case DATA_MINIONS:
                switch (uiData)
                {
                    case NOT_STARTED:
                        // first respawn any aggroed wall minions
                        for (const auto& i : vArchaedasWallMinions)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->setFaction(FACTION_STONED);
                            }
                        }
                        // Vault Warders
                        for (const auto& i : vVaultWarder)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->setFaction(FACTION_STONED);
                            }
                        }
                        // Earthen Guardians
                        for (const auto& i : vEarthenGuardian)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->setFaction(FACTION_STONED);
                            }
                        }
                        // Furniture
                        for (const auto& i : vVaultWarderFurniture)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (target && target->IsDespawned())
                            {
                                target->Respawn();
                            }
                        }
                        break;
                    case IN_PROGRESS:
                    {
                        Creature* archaedas = instance->GetCreature(uiArchaedasGUID);
                        if (!archaedas)
                        {
                            return;
                        }
                        for (const auto& i : vArchaedasWallMinions)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || !target->isAlive() || target->getFaction() == FACTION_AWAKE)
                            {
                                continue;
                            }
                            archaedas->CastSpell(target, SPELL_AWAKEN_EARTHEN_DWARF, false);
                            target->setFaction(FACTION_AWAKE);
                            return; // only want the first one we find
                        }
                        break;
                    }
                    case SPECIAL:
                        // remove anything alive
                        // first despawn any aggroed wall minions
                        for (const auto& i : vArchaedasWallMinions)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead() || target->getFaction() != FACTION_AWAKE)
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Vault Warders
                        for (const auto& i : vVaultWarder)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead() || target->getFaction() != FACTION_AWAKE)
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Earthen Guardians
                        for (const auto& i : vEarthenGuardian)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead() || target->getFaction() != FACTION_AWAKE)
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        break;
                    case DONE:
                        // remove anything that isn't dead
                        // Wall minions
                        for (const auto& i : vArchaedasWallMinions)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead())
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Vault Warders
                        for (const auto& i : vVaultWarder)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead())
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Earthen Guardians
                        for (const auto& i : vEarthenGuardian)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (!target || target->isDead())
                            {
                                continue;
                            }
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Furniture
                        for (const auto& i : vVaultWarderFurniture)
                        {
                            Creature* target = instance->GetCreature(i);
                            if (target && target->IsDespawned())
                            {
                                target->Respawn();
                            }
                        }
                        break;
                    default:
                        break;
                }
                break;
            case DATA_IRONAYA_SEAL:
                bKeystoneCheck = true;
                break;
            case DATA_ARCHAEDAS_ALTAR :
                if (uiData == IN_PROGRESS)
                {
                    if(GameObject* pGo = instance->GetGameObject(uiAltarOfArchaedas))
                    {
                        pGo->SetGoState(GO_STATE_ACTIVE);
                    }
                }
                else if (uiData == NOT_STARTED)
                {
                    if(GameObject* pGo = instance->GetGameObject(uiAltarOfArchaedas))
                    {
                        pGo->SetGoState(GO_STATE_READY);
                    }
                }
                break;
            case DATA_ARCHAEDAS:
            {
                switch (uiData)
                {
                    case IN_PROGRESS: // Event is started
                    {
                        if (m_auiEncounter[ULDAMAN_ENCOUNTER_ARCHAEDAS] == IN_PROGRESS)
                        {
                            return;
                        }
                        m_auiEncounter[ULDAMAN_ENCOUNTER_ARCHAEDAS] = uiData;
                        if (Creature* archaedas = instance->GetCreature(uiArchaedasGUID))
                        {
                            if (archaedas->isAlive() && archaedas->getFaction() != FACTION_AWAKE)
                            {
                                archaedas->CastSpell(archaedas, SPELL_ARCHAEDAS_AWAKEN, false);
                                SetUnFrozenState(archaedas);
                            }
                        }
                        break;
                    }
                    case NOT_STARTED: // Archaedas reaches his spawn point
                        if (Creature* archaedas = instance->GetCreature(uiArchaedasGUID))
                        {
                            SetFrozenState(archaedas);
                        }
                        m_auiEncounter[ULDAMAN_ENCOUNTER_ARCHAEDAS] = uiData;
                        break;
                    case FAIL: // Archaedas resets and moves towards his spawn point
                    case DONE: // Archaedas is dead
                    default:
                        m_auiEncounter[ULDAMAN_ENCOUNTER_ARCHAEDAS] = uiData;
                        break;
                }
            }
        }
    }

    uint32 GetData(uint32 uiType)
    {
        if (uiType == DATA_IRONAYA) return m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR];
        if (uiType == DATA_ALTAR_DOORS) return m_auiEncounter[ULDAMAN_ENCOUNTER_ALTAR_DOORS];
        if (uiType == DATA_ARCHAEDAS) return m_auiEncounter[ULDAMAN_ENCOUNTER_ARCHAEDAS];
        if (uiType == DATA_STONE_KEEPERS) return m_auiEncounter[ULDAMAN_ENCOUNTER_STONE_KEEPERS];

        return 0;
    }

    void Update(uint32 uiDiff)
    {
        if (!bKeystoneCheck)
        {
            return;
        }
        if (uiIronayaSealDoorTimer <= uiDiff)
        {
            Creature* ironaya = instance->GetCreature(uiIronayaGUID);
            if (!ironaya)
            {
                return;
            }
            SetUnFrozenState(ironaya);

            DoUseDoorOrButton(uiIronayaSealDoor, true);

            GameObject* go = instance->GetGameObject(uiKeystoneGUID);
            if (!go)
            {
                return;
            }
            go->SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);

            SetData(DATA_IRONAYA_DOOR, DONE); //save state
            bKeystoneCheck = false;
        }
        else
        {
            uiIronayaSealDoorTimer -= uiDiff;
        }
    }
};

InstanceData* GetInstanceData_instance_uldaman(Map* pMap)
{
    return new instance_uldaman(pMap);
}

void AddSC_instance_uldaman()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "instance_uldaman";
    pNewScript->GetInstanceData = &GetInstanceData_instance_uldaman;
    pNewScript->RegisterSelf();
}
