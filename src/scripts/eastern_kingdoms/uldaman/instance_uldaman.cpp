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

enum eSpells
{
    SPELL_ARCHAEDAS_AWAKEN    = 10347,
    SPELL_AWAKEN_VAULT_WALKER = 10258,
    SPELL_STONED              = 10255
};

struct instance_uldaman : public ScriptedInstance
{
    instance_uldaman(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    uint64 m_uiGoSealOfKhazMulGUID;

    /*****************************/

    uint64 uiArchaedasGUID;
    uint64 uiIronayaGUID;
    uint64 uiWhoWokeuiArchaedasGUID;
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
    std::vector<uint64> vVaultWalker;
    std::vector<uint64> vEarthenGuardian;
    std::vector<uint64> vArchaedasWallMinions; //Minions lined up around the wall

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
        m_uiGoSealOfKhazMulGUID = 0;

        uiArchaedasGUID = 0;
        uiIronayaGUID = 0;
        uiWhoWokeuiArchaedasGUID = 0;
        uiAltarOfTheKeeperTempleDoor = 0;
        uiArchaedasTempleDoor.Clear();
        uiAncientVaultDoor = 0;
        uiIronayaSealDoor = 0;
        uiKeystoneGUID = 0;
        uiIronayaSealDoorTimer = 27000; //animation time
        bKeystoneCheck = false;
        vVaultWalker.reserve(2);
        vEarthenGuardian.reserve(6);
    }

    bool IsEncounterInProgress() const
    {
        for (uint8 i = 0; i < ULDAMAN_MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS)
                return true;

        return false;
    }


    void OnCreatureCreate(Creature* pCreature)
    {
        switch (pCreature->GetEntry())
        {
            case 4857: // Stone Keeper
                SetFrozenState(pCreature);
                vStoneKeeper.push_back(pCreature->GetGUID());
                break;
            case 7309: // Earthen Custodian
                vArchaedasWallMinions.push_back(pCreature->GetGUID());
                break;
            case 7077: // Earthen Hallshaper
                vArchaedasWallMinions.push_back(pCreature->GetGUID());
                break;
            case 7076: // Earthen Guardian
                vEarthenGuardian.push_back(pCreature->GetGUID());
                break;
            case 7228: // Ironaya
                uiIronayaGUID = pCreature->GetGUID();
                if (m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR] != DONE)
                    SetFrozenState(pCreature);
                break;
            case 10120: // Vault Walker
                // Only take the ones inside Archaedas room
                if (pCreature->IsWithinDist2d(104, 272, 35.0f))
                    vVaultWalker.push_back(pCreature->GetGUID());
                break;
            case 2748: // Archaedas
                uiArchaedasGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* pGo)
    {
        switch (pGo->GetEntry())
        {
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
                    pGo->SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                break;
        }
    }

    void SetFrozenState(Creature* creature)
    {
        creature->setFaction(35);
        creature->RemoveAllAuras();
        //creature->RemoveFlag (UNIT_FIELD_FLAGS, UNIT_FLAG_ANIMATION_FROZEN);

        creature->CastSpell(creature, SPELL_STONED, false);

        creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
    }

    /**
     * Called from GOHello_go_altar_of_archaedas, when Archaedas event starts.
     */
    void SetData64(uint32 type, uint64 data)
    {
        // Archaedas
        if (type == 0)
        {
            Creature* archaedas = instance->GetCreature(uiArchaedasGUID);
            if (!archaedas)
                return;
            if (!archaedas->SelectHostileTarget() || !archaedas->getVictim())
            {
                archaedas->CastSpell(archaedas, SPELL_ARCHAEDAS_AWAKEN, false);
                uiWhoWokeuiArchaedasGUID = data;
            }
        }
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch (uiType)
        {
            case DATA_ALTAR_DOORS :
                m_auiEncounter[ULDAMAN_ENCOUNTER_ALTA_DOORS] = uiData;
                if (uiData == DONE)
                    DoUseDoorOrButton(uiAltarOfTheKeeperTempleDoor);
                break;
            case DATA_ANCIENT_DOOR:
                m_auiEncounter[ULDAMAN_ENCOUNTER_ANCIENT_DOOR] = uiData;
                if (uiData == DONE) //archeadas defeat
                {
                    DoUseDoorOrButton(uiArchaedasTempleDoor); //re open enter door
                    DoUseDoorOrButton(uiAncientVaultDoor);
                }
                else if (uiData == FAIL || uiData == IN_PROGRESS)
                    DoUseDoorOrButton(uiArchaedasTempleDoor); //toggle enter door
                break;
            case DATA_IRONAYA_DOOR:
                DoUseDoorOrButton(m_uiGoSealOfKhazMulGUID);
                m_auiEncounter[ULDAMAN_ENCOUNTER_IRONAYA_DOOR] = uiData;
                break;
            case DATA_STONE_KEEPERS:
                /** Check the list of Stone Keeper created at instance creation */
                for (std::vector<uint64>::const_iterator it = vStoneKeeper.begin(); it != vStoneKeeper.end(); ++it)
                {
                    Creature* target = instance->GetCreature(*it);

                    /** Check if a creature is available to become alive */
                    if (!target || !target->isAlive() || target->getFaction() == 14)
                        continue;
                    /** Creature become alive */
                    target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_STUNNED | UNIT_FLAG_NON_ATTACKABLE);
                    target->setFaction(14);
                    target->RemoveAurasDueToSpell(10255);
                    if (Unit* victim = target->SelectNearestTarget(18.0f))
                        target->AI()->AttackStart(victim);

                    return; // Only one Creature per action
                }
                SetData(DATA_ALTAR_DOORS, DONE); //Open the doors
                break;
            case DATA_MINIONS:
                switch (uiData)
                {
                    case NOT_STARTED:
                        if (m_auiEncounter[ULDAMAN_ENCOUNTER_ALTA_DOORS] == DONE) //if players opened the doors
                            DoUseDoorOrButton(uiArchaedasTempleDoor);

                        // first respawn any aggroed wall minions
                        for (std::vector<uint64>::const_iterator i = vArchaedasWallMinions.begin(); i != vArchaedasWallMinions.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->GetMotionMaster()->MoveTargetedHome();
                                SetFrozenState(target);
                            }
                        }
                        // Vault Walkers
                        for (std::vector<uint64>::const_iterator i = vVaultWalker.begin(); i != vVaultWalker.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->GetMotionMaster()->MoveTargetedHome();
                                SetFrozenState(target);
                            }
                        }
                        // Earthen Guardians
                        for (std::vector<uint64>::const_iterator i = vEarthenGuardian.begin(); i != vEarthenGuardian.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (target && target->isDead())
                            {
                                target->Respawn();
                                target->GetMotionMaster()->MoveTargetedHome();
//                                SetFrozenState(target);
                            }
                        }
                        break;
                    case IN_PROGRESS:
                    {
                        Creature* archaedas = instance->GetCreature(uiArchaedasGUID);
                        if (!archaedas)
                            return;
                        for (std::vector<uint64>::const_iterator i = vArchaedasWallMinions.begin(); i != vArchaedasWallMinions.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (!target || !target->isAlive() || target->getFaction() == 14)
                                continue;
                            archaedas->CastSpell(target, SPELL_AWAKEN_VAULT_WALKER, true);
                            target->CastSpell(target, SPELL_ARCHAEDAS_AWAKEN, true);
                            return; // only want the first one we find
                        }
                        break;
                    }
                    case SPECIAL:
                        // first despawn any aggroed wall minions
                        for (std::vector<uint64>::const_iterator i = vArchaedasWallMinions.begin(); i != vArchaedasWallMinions.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (!target || target->isDead() || target->getFaction() != 14)
                                continue;
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Vault Walkers
                        for (std::vector<uint64>::const_iterator i = vVaultWalker.begin(); i != vVaultWalker.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (!target || target->isDead() || target->getFaction() != 14)
                                continue;
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        // Earthen Guardians
                        for (std::vector<uint64>::const_iterator i = vEarthenGuardian.begin(); i != vEarthenGuardian.end(); ++i)
                        {
                            Creature* target = instance->GetCreature(*i);
                            if (!target || target->isDead() || target->getFaction() != 14)
                                continue;
                            target->SetDeathState(JUST_DIED);
                            target->RemoveCorpse();
                        }
                        break;
                    default:
                        break;
                }
                break;
            case DATA_IRONAYA_SEAL:
                bKeystoneCheck = true;
                break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        if (uiType == TYPE_IRONAYA)
            return m_auiEncounter[ULDAMAN_ENCOUNTER_ALTA_DOORS];
        return 0;
    }

    uint64 GetData64(uint32 uiData)
    {
        if (uiData == 0) return uiWhoWokeuiArchaedasGUID;
        if (uiData == 1) return vVaultWalker[0]; // VaultWalker1
        if (uiData == 2) return vVaultWalker[1]; // VaultWalker2
        if (uiData == 5) return vEarthenGuardian[0];
        if (uiData == 6) return vEarthenGuardian[1];
        if (uiData == 7) return vEarthenGuardian[2];
        if (uiData == 8) return vEarthenGuardian[3];
        if (uiData == 9) return vEarthenGuardian[4];
        if (uiData == 10) return vEarthenGuardian[5];

        return 0;
    }

    void Update(uint32 uiDiff)
    {
        if (!bKeystoneCheck)
            return;
        if (uiIronayaSealDoorTimer <= uiDiff)
        {
            Creature* ironaya = instance->GetCreature(uiIronayaGUID);
            if (!ironaya)
                return;
            ironaya->setFaction(415);
            ironaya->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            ironaya->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            DoUseDoorOrButton(uiIronayaSealDoor, true);

            GameObject* go = instance->GetGameObject(uiKeystoneGUID);
            if (!go)
                return;
            go->SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);

            SetData(DATA_IRONAYA_DOOR, DONE); //save state
            bKeystoneCheck = false;
        }
        else
            uiIronayaSealDoorTimer -= uiDiff;
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
