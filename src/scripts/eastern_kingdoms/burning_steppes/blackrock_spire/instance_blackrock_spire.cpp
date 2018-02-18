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
SDName: instance_blackrock_spire
SD%Complete: 50
SDComment: To really get this instance working, many encounters will need more love - and also the DB content is surely not yet perfect.
SDCategory: Blackrock Spire
EndScriptData */

#include "scriptPCH.h"
#include "blackrock_spire.h"

//#define DEBUG_ON

enum
{
    AREATRIGGER_ENTER_UBRS      = 2046,
    AREATRIGGER_STADIUM         = 2026
};

/* Areatrigger
1470 Instance Entry
1628 LBRS, between Spiders and Ogres
1946 LBRS, ubrs pre-quest giver (1)
1986 LBRS, ubrs pre-quest giver (2)
1987 LBRS, ubrs pre-quest giver (3)
2026 UBRS, stadium event trigger
2046 UBRS, way to upper
2066 UBRS, The Beast - Exit (to the dark chamber)
2067 UBRS, The Beast - Entry
2068 LBRS, fall out of map
3726 UBRS, entrance to BWL
*/

instance_blackrock_spire::instance_blackrock_spire(Map* pMap) : ScriptedInstance(pMap),
    m_uiEmberseerGUID(0),
    m_uiNefariusGUID(0),
    m_uiGythGUID(0),
    m_uiInfiltratorGUID(0),
    m_uiDrakkisathGUID(0),

    m_uiEmberseerInDoorGUID(0),
    m_uiEmberseerCombatDoorGUID(0),
    m_uiEmberseerOutDoorGUID(0),

    m_uiGythEntryDoorGUID(0),
    m_uiGythCombatDoorGUID(0),
    m_uiGythExitDoorGUID(0),

    m_uiFatherFlameGUID(0),
    m_uiFatherFlame_timer(0),
    m_uiFatherFlame_WaveCount(0),
    m_uiSolakarTriggerGUID(0),

    m_uiUBRSDoorGUID(0),
    m_uiBrazier01GUID(0),
    m_uiBrazier02GUID(0),
    m_uiBrazier03GUID(0),
    m_uiBrazier04GUID(0),
    m_uiBrazier05GUID(0),
    m_uiBrazier06GUID(0),

    m_uiEmberseerRune01GUID(0),
    m_uiEmberseerRune02GUID(0),
    m_uiEmberseerRune03GUID(0),
    m_uiEmberseerRune04GUID(0),
    m_uiEmberseerRune05GUID(0),
    m_uiEmberseerRune06GUID(0),
    m_uiEmberseerRune07GUID(0),

    m_uiBlackRockAltarGUID(0),

    m_uiUBRSDoor_Timer(0),
    m_uiUBRSDoor_Step(0),

    m_bBannokSpawned(false)

{
    Initialize();
}

void instance_blackrock_spire::Initialize()
{
    memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
    memset(&m_auiRoomRuneGUID, 0, sizeof(m_auiRoomRuneGUID));
#ifdef DEBUG_ON
    sLog.outString("Instance BlackRockSpire : Initialize");
#endif
}

void instance_blackrock_spire::OnObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_BLACKROCK_ALTAR:
            m_uiBlackRockAltarGUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_IN:
            m_uiEmberseerInDoorGUID = pGo->GetGUID();
            if (GetData(TYPE_ROOM_EVENT) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_DOORS:
            m_uiEmberseerCombatDoorGUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_OUT:
            m_uiEmberseerOutDoorGUID = pGo->GetGUID();
            if (GetData(TYPE_EMBERSEER) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_GYTH_ENTRY_DOOR:
            m_uiGythEntryDoorGUID = pGo->GetGUID();
            break;
        case GO_GYTH_COMBAT_DOOR:
            m_uiGythCombatDoorGUID = pGo->GetGUID();
            break;
        case GO_GYTH_EXIT_DOOR:
            m_uiGythExitDoorGUID = pGo->GetGUID();
            if (GetData(TYPE_GYTH) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;

        case GO_ROOM_1_RUNE:
            m_auiRoomRuneGUID[0] = pGo->GetGUID();
            break;
        case GO_ROOM_2_RUNE:
            m_auiRoomRuneGUID[1] = pGo->GetGUID();
            break;
        case GO_ROOM_3_RUNE:
            m_auiRoomRuneGUID[2] = pGo->GetGUID();
            break;
        case GO_ROOM_4_RUNE:
            m_auiRoomRuneGUID[3] = pGo->GetGUID();
            break;
        case GO_ROOM_5_RUNE:
            m_auiRoomRuneGUID[4] = pGo->GetGUID();
            break;
        case GO_ROOM_6_RUNE:
            m_auiRoomRuneGUID[5] = pGo->GetGUID();
            break;
        case GO_ROOM_7_RUNE:
            m_auiRoomRuneGUID[6] = pGo->GetGUID();
            break;

        case GO_ROOKERY_EGG:
            m_lRookeryEggGUIDList.push_back(pGo->GetGUID());
            break;
        case GO_FATHER_FLAME:
            m_uiFatherFlameGUID = pGo->GetGUID();
            /*if (GetData(TYPE_SOLAKAR) == FAIL)
                DoRespawnGameObject(m_uiFatherFlameGUID, HOUR*IN_MILLISECONDS);*/
            break;

        case GO_DOOR_URBS:
            m_uiUBRSDoorGUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_BRAZIER01:
            m_uiBrazier01GUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_BRAZIER02:
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            m_uiBrazier02GUID = pGo->GetGUID();
            break;
        case GO_BRAZIER03:
            m_uiBrazier03GUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_BRAZIER04:
            m_uiBrazier04GUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_BRAZIER05:
            m_uiBrazier05GUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_BRAZIER06:
            m_uiBrazier06GUID = pGo->GetGUID();
            if (GetData(TYPE_EVENT_DOOR_UBRS) == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;

        case GO_EMBERSEER_RUNE01:
            m_uiEmberseerRune01GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE02:
            m_uiEmberseerRune02GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE03:
            m_uiEmberseerRune03GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE04:
            m_uiEmberseerRune04GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE05:
            m_uiEmberseerRune05GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE06:
            m_uiEmberseerRune06GUID = pGo->GetGUID();
            break;
        case GO_EMBERSEER_RUNE07:
            m_uiEmberseerRune07GUID = pGo->GetGUID();
            break;
    }
}

void instance_blackrock_spire::OnCreatureCreate(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_PYROGUARD_EMBERSEER:
            m_uiEmberseerGUID = pCreature->GetGUID();
            break;
        case NPC_LORD_VICTOR_NEFARIUS:
            m_uiNefariusGUID = pCreature->GetGUID();
            break;
        case NPC_GYTH:
            m_uiGythGUID = pCreature->GetGUID();
            break;
        case NPC_SCARSHIELD_INFILTRATOR:
            m_uiInfiltratorGUID = pCreature->GetGUID();
            break;
        case NPC_DRAKKISATH:
            m_uiDrakkisathGUID = pCreature->GetGUID();
            break;
        case NPC_THE_BEAST:
            m_uiBeastGUID = pCreature->GetGUID();
            break;

        case NPC_BLACKHAND_SUMMONER:
        case NPC_BLACKHAND_VETERAN:
            m_lRoomEventMobGUIDList.push_back(pCreature->GetGUID());
            break;
        case NPC_BLACKHAND_INCANCERATOR:
            m_lIncanceratorGUIDList.push_back(pCreature->GetGUID());
            break;
        case NPC_SOLAKAR_TRIGGER:
            m_uiSolakarTriggerGUID = pCreature->GetGUID();
            break;
        case NPC_ROOKERY_HATCHER:
            pCreature->SetInCombatWithZone();
            break;

        case NPC_FIREBRAND_GRUNT:
            // 14.26% chance to spawn Bannok Grimaxe instead of one of his 3 placeholders
            switch (pCreature->GetGUIDLow())
            {
                case 44020:
                case 43764:
                case 44327:
                    if (!m_bBannokSpawned && urand(0,99) < 5)
                    {
                        pCreature->UpdateEntry(NPC_BANNOK_GRIMAXE);
                        m_bBannokSpawned = true;
                    }
            }
            break;
    }
}

void instance_blackrock_spire::SetData(uint32 uiType, uint32 uiData)
{
    switch (uiType)
    {
        case TYPE_ROOM_EVENT:
            if (uiData == DONE)
                DoUseDoorOrButton(m_uiEmberseerInDoorGUID);
            m_auiEncounter[TYPE_ROOM_EVENT] = uiData;
            break;
        case TYPE_EMBERSEER:
            if (uiData == IN_PROGRESS || uiData == FAIL)
                DoUseDoorOrButton(m_uiEmberseerCombatDoorGUID);
            else if (uiData == DONE)
            {
                DoUseDoorOrButton(m_uiEmberseerCombatDoorGUID);
                DoUseDoorOrButton(m_uiEmberseerOutDoorGUID);
                DoUseDoorOrButton(m_uiEmberseerRune01GUID);
                DoUseDoorOrButton(m_uiEmberseerRune02GUID);
                DoUseDoorOrButton(m_uiEmberseerRune03GUID);
                DoUseDoorOrButton(m_uiEmberseerRune04GUID);
                DoUseDoorOrButton(m_uiEmberseerRune05GUID);
                DoUseDoorOrButton(m_uiEmberseerRune06GUID);
                DoUseDoorOrButton(m_uiEmberseerRune07GUID);
            }
            m_auiEncounter[TYPE_EMBERSEER] = uiData;
            break;
        case TYPE_FLAMEWREATH:
            m_auiEncounter[TYPE_FLAMEWREATH] = uiData;
            break;
        case TYPE_GYTH:
            if (uiData == IN_PROGRESS || uiData == FAIL)
                DoUseDoorOrButton(m_uiGythEntryDoorGUID);
            else if (uiData == DONE)
            {
                DoUseDoorOrButton(m_uiGythEntryDoorGUID);
                DoUseDoorOrButton(m_uiGythExitDoorGUID);
            }
            m_auiEncounter[TYPE_GYTH] = uiData;
            break;
        case TYPE_VALTHALAK:
            m_auiEncounter[TYPE_VALTHALAK] = uiData;
            break;
        case TYPE_EVENT_DOOR_UBRS:
            if (uiData == DONE)
                m_uiUBRSDoor_Timer = 2000;
            m_auiEncounter[TYPE_EVENT_DOOR_UBRS] = uiData;
            break;
        case TYPE_SOLAKAR:
            if ((uiData == FAIL && m_uiFatherFlame_timer != 0) || uiData == SPECIAL)
            {
                //DoRespawnGameObject(m_uiFatherFlameGUID, HOUR*IN_MILLISECONDS);
                m_uiFatherFlame_timer = 0;
                m_uiFatherFlame_WaveCount = 0;
            }
            if (uiData == IN_PROGRESS)
                m_uiFatherFlame_timer = 5000;

            m_auiEncounter[TYPE_SOLAKAR] = uiData;
            break;
    }

    if (uiData == DONE)
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
        saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " " << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " << m_auiEncounter[5] << " " << m_auiEncounter[6];

        strInstData = saveStream.str();

        SaveToDB();
        OUT_SAVE_INST_DATA_COMPLETE;
    }
}

enum
{
    SAY_ROOKERY_EVENT_START = -1229020
};

void instance_blackrock_spire::Update(uint32 uiDiff)
{
    if (m_uiUBRSDoor_Timer)
    {
        if (m_uiUBRSDoor_Timer <= uiDiff)
        {
            switch (m_uiUBRSDoor_Step)
            {
                case 0:
                    DoUseDoorOrButton(m_uiBrazier01GUID);
                    DoUseDoorOrButton(m_uiBrazier02GUID);
                    m_uiUBRSDoor_Timer = 3000;
                    ++m_uiUBRSDoor_Step;
                    break;
                case 1:
                    DoUseDoorOrButton(m_uiBrazier03GUID);
                    DoUseDoorOrButton(m_uiBrazier04GUID);
                    m_uiUBRSDoor_Timer = 3000;
                    ++m_uiUBRSDoor_Step;
                    break;
                case 2:
                    DoUseDoorOrButton(m_uiBrazier05GUID);
                    DoUseDoorOrButton(m_uiBrazier06GUID);
                    m_uiUBRSDoor_Timer = 3000;
                    ++m_uiUBRSDoor_Step;
                    break;
                case 3:
                    DoUseDoorOrButton(m_uiUBRSDoorGUID);
                    m_uiUBRSDoor_Step = 0;
                    m_uiUBRSDoor_Timer = 0;
                    break;
            }
        }
        else
            m_uiUBRSDoor_Timer -= uiDiff;
    }

    if (GetData(TYPE_SOLAKAR) == IN_PROGRESS)
    {
        if (Creature* Crea = GetCreature(m_uiSolakarTriggerGUID))
        {
            if (m_uiFatherFlame_timer <= uiDiff)
            {
                if (m_uiFatherFlame_WaveCount == 0) // First wave should be a Rookery Hatcher and there is a text that it has to say.
                {
                    Creature* pFirstHatcher = Crea->SummonCreature(NPC_ROOKERY_HATCHER, 55.232342f, -265.751282f, 93.883f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    if (pFirstHatcher)
                        DoScriptText(SAY_ROOKERY_EVENT_START, pFirstHatcher);
                    Crea->SummonCreature(NPC_ROOKERY_HATCHER, 60.011333f, -263.914703f, 94.022f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    m_uiFatherFlame_timer = urand(30000, 40000);
                    ++m_uiFatherFlame_WaveCount;
                }
                else if (m_uiFatherFlame_WaveCount < 5)
                {
                    switch (urand(0, 2))
                    {
                        case 0:
                        {
                            Crea->SummonCreature(NPC_ROOKERY_GUARDIAN, 55.232342f, -265.751282f, 93.883f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            Crea->SummonCreature(NPC_ROOKERY_GUARDIAN, 60.011333f, -263.914703f, 94.022f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            break;
                        }
                        case 1:
                        {
                            Crea->SummonCreature(NPC_ROOKERY_HATCHER, 55.232342f, -265.751282f, 93.883f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            Crea->SummonCreature(NPC_ROOKERY_HATCHER, 60.011333f, -263.914703f, 94.022f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            break;
                        }
                        case 2:
                        {
                            Crea->SummonCreature(NPC_ROOKERY_GUARDIAN, 55.232342f, -265.751282f, 93.883f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            Crea->SummonCreature(NPC_ROOKERY_HATCHER, 60.011333f, -263.914703f, 94.022f, 5, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                            break;
                        }
                    }
                    m_uiFatherFlame_timer = urand(30000, 40000);
                    ++m_uiFatherFlame_WaveCount;
                }
                else
                {
                    Crea->SummonCreature(NPC_SOLAKAR, 43.7685f, -259.82f, 91.6483f, 0, TEMPSUMMON_DEAD_DESPAWN, HOUR * IN_MILLISECONDS);
                    SetData(TYPE_SOLAKAR, DONE);
                    m_uiFatherFlame_timer = 0;
                }
            }
            else
                m_uiFatherFlame_timer -= uiDiff;
        }
    }
}

void instance_blackrock_spire::SetData64(uint32 uiType, uint64 uiData)
{
    if (uiType == TYPE_ROOM_EVENT && GetData(TYPE_ROOM_EVENT) == IN_PROGRESS)
    {
        uint8 uiNotEmptyRoomsCount = 0;
        for (uint8 i = 0; i < MAX_ROOMS; i++)
        {
            if (m_auiRoomRuneGUID[i])                       // This check is used, to ensure which runes still need processing
            {
                m_alRoomEventMobGUIDSorted[i].remove(uiData);
                if (m_alRoomEventMobGUIDSorted[i].empty())
                {
                    DoUseDoorOrButton(m_auiRoomRuneGUID[i]);
                    m_auiRoomRuneGUID[i] = 0;
                }
                else
                    uiNotEmptyRoomsCount++;                 // found an not empty room
            }
        }
        if (!uiNotEmptyRoomsCount)
            SetData(TYPE_ROOM_EVENT, DONE);
    }
}

void instance_blackrock_spire::Load(const char* chrIn)
{
    if (!chrIn)
    {
        OUT_LOAD_INST_DATA_FAIL;
        return;
    }

    OUT_LOAD_INST_DATA(chrIn);

    std::istringstream loadStream(chrIn);
    loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3] >> m_auiEncounter[4] >> m_auiEncounter[5] >> m_auiEncounter[6];

    for (uint8 i = 0; i < INSTANCE_BRS_MAX_ENCOUNTER; ++i)
    {
        if (m_auiEncounter[i] == IN_PROGRESS)
            m_auiEncounter[i] = NOT_STARTED;
    }

    OUT_LOAD_INST_DATA_COMPLETE;
}

uint32 instance_blackrock_spire::GetData(uint32 uiType)
{
    switch (uiType)
    {
        case TYPE_ROOM_EVENT:
        case TYPE_EMBERSEER:
        case TYPE_FLAMEWREATH:
        case TYPE_GYTH:
        case TYPE_VALTHALAK:
        case TYPE_EVENT_DOOR_UBRS:
        case TYPE_SOLAKAR:
            return m_auiEncounter[uiType];
    }
    return 0;
}

uint64 instance_blackrock_spire::GetData64(uint32 uiType)
{
    switch (uiType)
    {
        case GO_BLACKROCK_ALTAR:
            return m_uiBlackRockAltarGUID;
        case NPC_PYROGUARD_EMBERSEER:
            return m_uiEmberseerGUID;
        case NPC_LORD_VICTOR_NEFARIUS:
            return m_uiNefariusGUID;
        case NPC_GYTH:
            return m_uiGythGUID;
        case NPC_SCARSHIELD_INFILTRATOR:
            return m_uiInfiltratorGUID;
        case GO_GYTH_COMBAT_DOOR:
            return m_uiGythCombatDoorGUID;
        case NPC_DRAKKISATH:
            return m_uiDrakkisathGUID;
        case NPC_THE_BEAST:
            return m_uiBeastGUID;
    }
    return 0;
}

void instance_blackrock_spire::DoSortRoomEventMobs()
{
    if (GetData(TYPE_ROOM_EVENT) != NOT_STARTED)
        return;
#ifdef DEBUG_ON
    sLog.outString("instance_blackrock_spire::DoSortRoomEventMobs");
#endif
    for (uint8 i = 0; i < MAX_ROOMS; i++)
    {
        if (GameObject* pRune = instance->GetGameObject(m_auiRoomRuneGUID[i]))
        {
            for (std::list<uint64>::const_iterator itr = m_lRoomEventMobGUIDList.begin(); itr != m_lRoomEventMobGUIDList.end(); itr++)
            {
                if (Creature* pCreature = instance->GetCreature(*itr))
                {
                    if (pCreature->isAlive() && pCreature->GetDistance(pRune) < 10.0f)
                        m_alRoomEventMobGUIDSorted[i].push_back(*itr);
                }
#ifdef DEBUG_ON
                sLog.outString("Alcove %u : %u mobs", i,  m_alRoomEventMobGUIDSorted[i].size());
#endif
            }
        }
    }

    SetData(TYPE_ROOM_EVENT, IN_PROGRESS);
}

InstanceData* GetInstanceData_instance_blackrock_spire(Map* pMap)
{
    return new instance_blackrock_spire(pMap);
}

bool AreaTrigger_at_blackrock_spire(Player* pPlayer, const AreaTriggerEntry* pAt)
{
    if (pPlayer->isDead())
        return false;

    switch (pAt->id)
    {
        case AREATRIGGER_ENTER_UBRS:
            if (instance_blackrock_spire* pInstance = (instance_blackrock_spire*) pPlayer->GetInstanceData())
            {
                pInstance->DoSortRoomEventMobs();
                if (pPlayer->HasItemCount(12344, 1)) // le joueur a le sceau de l'ascension
                    if (pInstance->GetData(TYPE_EVENT_DOOR_UBRS) != DONE)
                        pInstance->SetData(TYPE_EVENT_DOOR_UBRS, DONE);
            }
            break;
        case AREATRIGGER_STADIUM:
            if (instance_blackrock_spire* pInstance = (instance_blackrock_spire*) pPlayer->GetInstanceData())
                if (Creature* pGyth = pInstance->instance->GetCreature(pInstance->GetData64(NPC_GYTH)))
                    if (pGyth->isAlive() && !pGyth->isInCombat())
                        pGyth->AI()->AttackStart(pPlayer);
            break;
    }
    return false;
}


struct go_father_flameAI: public GameObjectAI
{
    go_father_flameAI(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* pUser)
    {
        if (ScriptedInstance* pInstance = (instance_blackrock_spire*)me->GetInstanceData())
            if (pInstance->GetData(TYPE_SOLAKAR) != IN_PROGRESS && pInstance->GetData(TYPE_SOLAKAR) != DONE)
                if (Creature* pDrakki = pInstance->instance->GetCreature(pInstance->GetData64(NPC_DRAKKISATH)))
                    if (pDrakki->isAlive())
                        pInstance->SetData(TYPE_SOLAKAR, IN_PROGRESS);
        return true;
    }
};

GameObjectAI* GetAIgo_father_flame(GameObject *pGo)
{
    return new go_father_flameAI(pGo);
}

struct npc_solakar_triggerAI : public ScriptedAI
{
    npc_solakar_triggerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (instance_blackrock_spire*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* instance;

    void Reset()
    {
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (!instance)
            return;

        if (who->GetTypeId() == TYPEID_UNIT && m_creature->IsWithinDistInMap(who, 5.0f) && instance->GetData(TYPE_SOLAKAR) == IN_PROGRESS)
        {
            Creature* CreaGuardian = m_creature->FindNearestCreature(10258, 5.0f); // NPC_ROOKERY_GUARDIAN = 10258
            Creature* CreaHatcher = m_creature->FindNearestCreature(10683, 5.0f); // NPC_ROOKERY_HATCHER = 10683
            if (CreaGuardian || CreaHatcher)
            {
                instance->SetData(TYPE_SOLAKAR, SPECIAL);

                std::list<Creature*> listHatcher;
                GetCreatureListWithEntryInGrid(listHatcher, m_creature, 10683, 10.0f);
                for (std::list<Creature*>::const_iterator itr = listHatcher.begin(); itr != listHatcher.end(); ++itr)
                {
                    if (listHatcher.empty())
                        break;
                    if (!(*itr)->isAlive())
                        continue;

                    (*itr)->AI()->EnterEvadeMode();
                }
                listHatcher.clear();
            }
        }
    }
};

CreatureAI* GetAI_npc_solakar_trigger(Creature* pCreature)
{
    return new npc_solakar_triggerAI(pCreature);
}

/****************************************
** Rookery Hatcher npc_rookery_hatcher **
****************************************/

enum
{
    SPELL_SUNDER_ARMOR       = 15572,
    SPELL_STRIKE             = 15580,
    SPELL_HATCH_ROOKERY_EGG  = 15746
};

struct npc_rookery_hatcherAI : public ScriptedAI
{
    npc_rookery_hatcherAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_blackrock_spire*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 SunderArmor_Timer;
    uint32 Strike_Timer;
    uint32 HatchRookeryEgg_Timer;

    void Reset()
    {
        SunderArmor_Timer = urand(8000, 12000);
        Strike_Timer = urand(5000, 7000);
        HatchRookeryEgg_Timer = urand(5000, 10000);
    }

    void JustReachedHome()
    {
        if (m_pInstance->GetData(TYPE_SOLAKAR) == SPECIAL)
            HatchRookeryEgg();
        else
            m_pInstance->SetData(TYPE_SOLAKAR, FAIL);
        m_creature->ForcedDespawn();
    }

    void HatchRookeryEgg()
    {
        uint8 uiHatchedEgg = 0;
        uint8 uiMaxHatchedEgg = 4;
        std::list<GameObject*> listRookeryEgg;
        GetGameObjectListWithEntryInGrid(listRookeryEgg, m_creature, 175124, 50.0f);
        for (std::list<GameObject*>::const_iterator itr = listRookeryEgg.begin(); itr != listRookeryEgg.end(); ++itr)
        {
            if (listRookeryEgg.empty())
                break;
            if (!(*itr)->isSpawned())
                continue;

            if (uiHatchedEgg < uiMaxHatchedEgg)
            {
                (*itr)->SetLootState(GO_JUST_DEACTIVATED);
                if (m_pInstance->GetData(TYPE_SOLAKAR) == SPECIAL)
                {
                    m_creature->SummonCreature(160015, (*itr)->GetPositionX(), (*itr)->GetPositionY(), (*itr)->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                    uiMaxHatchedEgg = 24;
                }
                else
                    m_creature->SummonCreature(10161, (*itr)->GetPositionX(), (*itr)->GetPositionY(), (*itr)->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);

                uiHatchedEgg++;
            }
            else
                break;
        }
        listRookeryEgg.clear();
    }

    void JustSummoned(Creature* pSummoned)
    {
        if (pSummoned->GetEntry() == 10161)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                pSummoned->AI()->AttackStart(pTarget);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_pInstance || !m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //  Sunder Armor
        if (SunderArmor_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SUNDER_ARMOR) == CAST_OK)
                SunderArmor_Timer = urand(10000, 15000);
        }
        else
            SunderArmor_Timer -= uiDiff;

        //  Strike
        if (Strike_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_STRIKE) == CAST_OK)
                Strike_Timer = urand(4000, 6000);
        }
        else
            Strike_Timer -= uiDiff;

        //  Hatch Rookery Egg
        if (HatchRookeryEgg_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_HATCH_ROOKERY_EGG) == CAST_OK)
            {
                HatchRookeryEgg();
                HatchRookeryEgg_Timer = urand(15000, 20000);
            }
        }
        else
            HatchRookeryEgg_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_rookery_hatcher(Creature* pCreature)
{
    return new npc_rookery_hatcherAI(pCreature);
}

/*struct go_rookey_eggAI : public GameObjectAI
{
    go_rookey_eggAI(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* pUser)
    {
        if (me->isSpawned())
        {
            me->SetLootState(GO_JUST_DEACTIVATED);
            float x,y,z;
            me->GetPosition(x,y,z);
            ((Creature *)pUser)->SummonCreature(160015, x, y, z, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
        }
    }

    void SummonWelp()
    {
        Map::PlayerList const &liste = me->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator i = liste.begin(); i != liste.end(); ++i)
        {
            if (me->GetDistance(i->getSource()) <= 4.0f)
            {
                me->SetLootState(GO_JUST_DEACTIVATED);
                float x,y,z;
                me->GetPosition(x,y,z);
                i->getSource()->SummonCreature(10161, x, y, z, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                Actif = true;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!Actif && me->isSpawned())
        {
            if (CheckTimer <= uiDiff)
            {
                SummonWelp();
                CheckTimer = 500;
            }
            else
                CheckTimer -= uiDiff;
        }
    }
};

GameObjectAI* GetAIgo_rookey_egg(GameObject *pGo)
{
    return new go_rookey_eggAI(pGo);
}*/

bool AreaTrigger_at_ubrs_the_beast(Player* pPlayer, const AreaTriggerEntry* pAt)
{
    if (pPlayer->isDead())
        return false;

    if (instance_blackrock_spire* pInstance = (instance_blackrock_spire*)pPlayer->GetInstanceData())
        if (Creature* pBeast = pInstance->instance->GetCreature(pInstance->GetData64(NPC_THE_BEAST)))
            if (pBeast->isAlive() && !pBeast->isInCombat())
                pBeast->AI()->AttackStart(pPlayer);

    return false;
}

void AddSC_instance_blackrock_spire()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "instance_blackrock_spire";
    pNewScript->GetInstanceData = &GetInstanceData_instance_blackrock_spire;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "at_blackrock_spire";
    pNewScript->pAreaTrigger = &AreaTrigger_at_blackrock_spire;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "go_father_flame";
    pNewScript->GOGetAI = &GetAIgo_father_flame;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_solakar_trigger";
    pNewScript->GetAI = &GetAI_npc_solakar_trigger;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_rookery_hatcher";
    pNewScript->GetAI = &GetAI_npc_rookery_hatcher;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "at_ubrs_the_beast";
    pNewScript->pAreaTrigger = &AreaTrigger_at_ubrs_the_beast;
    pNewScript->RegisterSelf();

    /*    pNewScript = new Script;
        pNewScript->Name = "go_rookey_egg";
        pNewScript->GOGetAI = &GetAIgo_rookey_egg;
        pNewScript->RegisterSelf();*/
}
