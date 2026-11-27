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

#include "scriptPCH.h"
#include "Utilities/EventMap.h"
#include "deadmines.h"

enum DeadMinesEvents : uint16
{
    EVENT_IRON_DOOR_ALARM1   = 1,
    EVENT_IRON_DOOR_ALARM2   = 2,
    EVENT_GUNPOWDER_OVERSEER = 3
};

static uint32 const aIronDoorAlarmRunners[] = { GUID_IRON_DOOR_ALARM_1, GUID_IRON_DOOR_ALARM_2, GUID_IRON_DOOR_ALARM_3 };

struct instance_deadmines : public ScriptedInstance
{
    explicit instance_deadmines(Map* pMap) : ScriptedInstance(pMap)
    {
        Initialize();
    };

    uint32 m_auiEncounter[INSTANCE_DM_MAX_ENCOUNTER];

    uint64 m_uiIronCladGUID;
    uint64 m_uiSmiteGUID;

    uint64 m_uiDoor1GUID;
    uint64 m_uiDoor2GUID;
    uint64 m_uiDoor3GUID;

    uint32 m_uiGunPowderEvent;

    std::string m_strInstData;

    EventMap m_events;

    void Initialize() override
    {
        std::fill(std::begin(m_auiEncounter), std::end(m_auiEncounter), 0);

        m_uiIronCladGUID = 0;
        m_uiSmiteGUID    = 0;

        m_uiDoor1GUID = 0;
        m_uiDoor2GUID = 0;
        m_uiDoor3GUID = 0;

        m_uiGunPowderEvent = 0;

        m_events.Reset();
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        if (pCreature->GetEntry() == NPC_MR_SMITE)
        {
            m_uiSmiteGUID = pCreature->GetGUID();
        }
    }

    Creature* GetCreatureByDbGuid(uint32 dbGuid)
    {
        if (CreatureData const* pData = sObjectMgr.GetCreatureData(dbGuid))
        {
            return instance->GetCreature(pData->GetObjectGuid(dbGuid));
        }

        return nullptr;
    }

    // The boss-death patrols are linked with FLAG_CANT_SPAWN_IF_BOSS_ALIVE: they wait dead and would
    // spawn at the next update after the death. A respawn time set in the same tick delays that.
    void DelayPatrolSpawn(uint32 dbGuid, uint32 seconds)
    {
        if (Creature* pCreature = GetCreatureByDbGuid(dbGuid))
        {
            if (!pCreature->IsAlive())
            {
                pCreature->SetRespawnTime(seconds);
            }
        }
    }

    void OnCreatureDeath(Creature *who) override
    {
        switch (who->GetEntry())
        {
            case NPC_RHAHKZOR:
            {
                SetData(TYPE_RHAHKZOR, DONE);
                DelayPatrolSpawn(GUID_RHAHK_PATROL_OVERSEER, 45);
                DelayPatrolSpawn(GUID_RHAHK_PATROL_EVOKER, 45);
                break;
            }
            case NPC_SNEEDS_SHREDDER:
            {
                // Sneed's patrol is linked to the Shredder (Sneed is a summon), it comes after Sneed's death
                DelayPatrolSpawn(GUID_SNEED_PATROL_EVOKER, HOUR);
                DelayPatrolSpawn(GUID_SNEED_PATROL_OVERSEER, HOUR);
                break;
            }
            case NPC_SNEED:
            {
                SetData(TYPE_SNEED, DONE);
                DelayPatrolSpawn(GUID_SNEED_PATROL_EVOKER, 4);
                DelayPatrolSpawn(GUID_SNEED_PATROL_OVERSEER, 4);
                break;
            }
            case NPC_GILNID:
            {
                SetData(TYPE_GILNID, DONE);
                break;
            }
            case NPC_EDWIN_VAN_CLEEF:
            {
                // unused
                break;
            }
        }
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        if (pGo->GetEntry() == GO_IRON_CLAD)
        {
            m_uiIronCladGUID = pGo->GetGUID();
            if (m_auiEncounter[TYPE_DEFIAS_ENDDOOR] == DONE)
            {
                pGo->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
            }
        }

        if (pGo->GetEntry() == GO_DOOR1)
        {
            m_uiDoor1GUID = pGo->GetGUID();
            if (m_auiEncounter[TYPE_RHAHKZOR] == DONE)
            {
                pGo->SetGoState(GO_STATE_ACTIVE);
                pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
            }
        }

        if (pGo->GetEntry() == GO_DOOR2 && pGo->GetPositionX() > -291.0f && pGo->GetPositionX() < -290.0f)
        {
            m_uiDoor2GUID = pGo->GetGUID();
            if (m_auiEncounter[TYPE_SNEED] == DONE)
            {
                pGo->SetGoState(GO_STATE_ACTIVE);
                pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
            }
        }

        if (pGo->GetEntry() == GO_DOOR3 && pGo->GetPositionX() > -169.0f && pGo->GetPositionX() < -168.0f)
        {
            m_uiDoor3GUID = pGo->GetGUID();
            if (m_auiEncounter[TYPE_GILNID] == DONE)
            {
                pGo->SetGoState(GO_STATE_ACTIVE);
                pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
            }
        }

        if (pGo->GetEntry() == GO_DMF_CHEST)
        {
            pGo->SetVisible(false);
        }
    }

    // The boss doors are LOCKED by their template while closed, UseDoorOrButton keeps the flag
    void OpenDoor(uint64 guid)
    {
        if (GameObject* pGo = instance->GetGameObject(guid))
        {
            pGo->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_LOCKED);
            if (pGo->GetGoState() != GO_STATE_ACTIVE)
            {
                DoUseDoorOrButton(guid);
            }
        }
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        switch (uiType)
        {
            case TYPE_RHAHKZOR:
            {
                if (uiData == DONE)
                {
                    OpenDoor(m_uiDoor1GUID);
                }
                break;
            }
            case TYPE_SNEED:
            {
                if (uiData == DONE)
                {
                    OpenDoor(m_uiDoor2GUID);
                }
                break;
            }
            case TYPE_GILNID:
            {
                if (uiData == DONE)
                {
                    OpenDoor(m_uiDoor3GUID);
                }
                break;
            }
            case TYPE_DEFIAS_ENDDOOR:
            {
                if (uiData == DONE)
                {
                    if (GameObject* pGo = instance->GetGameObject(m_uiIronCladGUID))
                    {
                        // No breaking the door if it's open
                        if (pGo->GetGoState() != GO_STATE_ACTIVE)
                        {
                            pGo->UseDoorOrButton(0, true);
                        }

                        m_events.ScheduleEvent(EVENT_IRON_DOOR_ALARM1, Seconds(1));
                    }
                }
                break;
            }
            case GUN_POWDER_EVENT:
            {
                if (uiData == 1 && m_uiGunPowderEvent == 0)
                {
                    m_events.ScheduleEvent(EVENT_GUNPOWDER_OVERSEER, Seconds(1));
                }
                m_uiGunPowderEvent = uiData;
                return;
            }
            default:
            {
                return;
            }
        }

        m_auiEncounter[uiType] = uiData;

        if (uiData == DONE)
        {
            SaveToDB();
        }
    }

    uint32 GetData(uint32 uiType) override
    {
        if (uiType < INSTANCE_DM_MAX_ENCOUNTER)
        {
            return m_auiEncounter[uiType];
        }

        if (uiType == GUN_POWDER_EVENT)
        {
            return m_uiGunPowderEvent;
        }

        return 0;
    }

    char const* Save() override
    {
        std::ostringstream saveStream;
        for (uint32 const state : m_auiEncounter)
        {
            saveStream << state << " ";
        }

        m_strInstData = saveStream.str();
        return m_strInstData.c_str();
    }

    void Load(char const* chrIn) override
    {
        if (!chrIn)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(chrIn);

        std::istringstream loadStream(chrIn);
        for (uint32& state : m_auiEncounter)
        {
            loadStream >> state;
        }

        OUT_LOAD_INST_DATA_COMPLETE;
    }

    uint64 GetData64(uint32 uiData) override
    {
        if (uiData == DATA_DEFIAS_DOOR)
        {
            return m_uiIronCladGUID;
        }

        return 0;
    }

    void UpdateEvents()
    {
        while (uint32 const eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
                case EVENT_IRON_DOOR_ALARM1:
                {
                    if (Creature* pMrSmite = instance->GetCreature(m_uiSmiteGUID))
                    {
                        DoScriptText(INST_SAY_ALARM1, pMrSmite);
                    }

                    // The idle generator under the point keeps them at the door until alarm 2.
                    // An evade clears it (MoveTargetedHome).
                    for (uint32 const dbGuid : aIronDoorAlarmRunners)
                    {
                        Creature* pRunner = GetCreatureByDbGuid(dbGuid);
                        if (pRunner && pRunner->IsAlive() && !pRunner->IsInCombat())
                        {
                            pRunner->GetMotionMaster()->MoveIdle();
                            pRunner->GetMotionMaster()->MovePoint(0, -99.6611f, -671.071655f, 7.42241f, MOVE_PATHFINDING | MOVE_RUN_MODE);
                        }
                    }
                    m_events.ScheduleEvent(EVENT_IRON_DOOR_ALARM2, Seconds(15));
                    break;
                }
                case EVENT_IRON_DOOR_ALARM2:
                {
                    if (Creature* pMrSmite = instance->GetCreature(m_uiSmiteGUID))
                    {
                        DoScriptText(INST_SAY_ALARM2, pMrSmite);
                    }

                    for (uint32 const dbGuid : aIronDoorAlarmRunners)
                    {
                        Creature* pRunner = GetCreatureByDbGuid(dbGuid);
                        if (pRunner && pRunner->IsAlive() && pRunner->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE)
                        {
                            pRunner->GetMotionMaster()->MovementExpired();
                        }
                    }
                    break;
                }
                case EVENT_GUNPOWDER_OVERSEER:
                {
                    if (Creature* pOverseer = instance->SummonCreature(NPC_DEFIAS_OVERSEER, -130.7757f, -605.4729f, 15.23518f, 5.445427f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 310000))
                    {
                        pOverseer->SetHomePosition(-115.263672f, -617.396118f, 13.579387f, 6.182347f);
                        pOverseer->GetMotionMaster()->MovePoint(0, -115.263672f, -617.396118f, 13.579387f, MOVE_PATHFINDING | MOVE_RUN_MODE, 0.0f, 6.182347f);
                    }
                    break;
                }
            }
        }
    }

    void Update(uint32 uiDiff) override
    {
        m_events.Update(uiDiff);
        UpdateEvents();
    }
};

InstanceData* GetInstanceData_instance_deadmines(Map* pMap)
{
    return new instance_deadmines(pMap);
}

bool AreaTrigger_at_dmf_chest_dm(Player* pPlayer, AreaTriggerEntry const* pAt)
{
    // Darkmoon chest visible only for players on the quest
    if (pPlayer->GetQuestStatus(QUEST_FORTUNE_AWAITS) == QUEST_STATUS_COMPLETE)
    {
        if (GameObject* pGo = pPlayer->FindNearestGameObject(GO_DMF_CHEST, 100.0f))
            pGo->SetVisible(true);
    }

    return false;
}

void AddSC_instance_deadmines()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "instance_deadmines";
    newscript->GetInstanceData = &GetInstanceData_instance_deadmines;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_dmf_chest_dm";
    newscript->pAreaTrigger = &AreaTrigger_at_dmf_chest_dm;
    newscript->RegisterSelf();
}
