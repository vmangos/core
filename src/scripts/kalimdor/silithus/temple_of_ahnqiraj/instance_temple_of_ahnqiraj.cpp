/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
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

/* ScriptData
SDName: Instance_Temple_of_Ahnqiraj
SD%Complete: 80
SDComment:
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

instance_temple_of_ahnqiraj::instance_temple_of_ahnqiraj(Map* pMap) : ScriptedInstance_PTR(pMap),
    m_uiBugTrioDeathCount(0)
{
    Initialize();
};

void instance_temple_of_ahnqiraj::Initialize()
{
    memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
}

bool instance_temple_of_ahnqiraj::IsEncounterInProgress() const
{
    for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
    {
        if (m_auiEncounter[i] == IN_PROGRESS)
            return true;
    }

    return false;
}

void instance_temple_of_ahnqiraj::OnObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_SKERAM_GATE:
            if (m_auiEncounter[TYPE_SKERAM] == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_TWINS_ENTER_DOOR:
			if (m_auiEncounter[TYPE_HUHURAN] == DONE)
				pGo->SetGoState(GO_STATE_ACTIVE);
            break;
        case GO_TWINS_EXIT_DOOR:
            if (m_auiEncounter[TYPE_TWINS] == DONE)
                pGo->SetGoState(GO_STATE_ACTIVE);
            break;

        default:
            return;
    }

	m_mGoEntryGuidStore[pGo->GetEntry()] = pGo->GetObjectGuid();
}

void instance_temple_of_ahnqiraj::OnCreatureRespawn(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_ANUBISATH_SENTINEL:
		case NPC_OBSIDIAN_ERADICATOR:
            if (m_auiEncounter[TYPE_SKERAM] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
        case NPC_QIRAJI_BRAINWASHER:
        case NPC_VEKNISS_GUARDIAN:
        case NPC_VEKNISS_WARRIOR:
        case NPC_SARTURA_S_ROYAL_GUARD:
            if (m_auiEncounter[TYPE_SARTURA] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
        case NPC_VEKNISS_DRONE:
        case NPC_VEKNISS_SOLDIER:
            if (m_auiEncounter[TYPE_FANKRISS] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
        case NPC_VEKNISS_HIVE_CRAWLER:
        case NPC_VEKNISS_WASP:
		case NPC_QIRAJI_LASHER:
        case NPC_VEKNISS_STINGER:
            if (m_auiEncounter[TYPE_HUHURAN] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
        case NPC_ANUBISATH_DEFENDER:
        case NPC_QIRAJI_SCARAB:
        case NPC_QIRAJI_SCORPION:
            if (m_auiEncounter[TYPE_TWINS] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
		case NPC_QIRAJI_MINDSLAYER:
        case NPC_QIRAJI_SLAYER:
        case NPC_QIRAJI_CHAMPION:
        case NPC_ANUBISATH_WARDER:
        case NPC_OBSIDIAN_NULLIFIER:
            if (m_auiEncounter[TYPE_C_THUN] == DONE)
                pCreature->AddObjectToRemoveList();
            break;
    }
}

void instance_temple_of_ahnqiraj::OnCreatureCreate(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_PRINCESS_YAUJ:
        case NPC_VEM:
        case NPC_KRI:
		case NPC_BATTLEGUARD_SARTURA:
        case NPC_VEKLOR:
        case NPC_VEKNILASH:
        case NPC_EYE_OF_C_THUN:
        case NPC_CTHUN:
        case NPC_CTHUN_PORTAL:
            m_mNpcEntryGuidStore[pCreature->GetEntry()] = pCreature->GetObjectGuid();
            break;
		// Randomize C'thun trash packs
		case NPC_QIRAJI_SLAYER:
			if (urand(0, 1))
			{
				pCreature->SetEntry(15246);
				pCreature->UpdateEntry(15246);
				pCreature->AIM_Initialize();
			}
			break;
		case NPC_QIRAJI_MINDSLAYER:
			if (urand(0, 1))
			{
				pCreature->SetEntry(15250);
				pCreature->UpdateEntry(15250);
				pCreature->AIM_Initialize();
			}
			break;
		case NPC_SARTURA_S_ROYAL_GUARD: m_lRoyalGuardGUIDList.push_back(pCreature->GetObjectGuid()); break;
    }
    // Delete some creatures
    OnCreatureRespawn(pCreature);
}

void instance_temple_of_ahnqiraj::SetData(uint32 uiType, uint32 uiData)
{
    switch (uiType)
    {
        case TYPE_SKERAM:
            m_auiEncounter[uiType] = uiData;
            if (uiData == DONE)
                DoUseDoorOrButton(GO_SKERAM_GATE);
			break;
		case TYPE_BUG_TRIO:
			if (uiData == SPECIAL)
			{
				++m_uiBugTrioDeathCount;
				if (m_uiBugTrioDeathCount == 2)
					SetData(TYPE_BUG_TRIO, DONE);
				// don't store any special data
				break;
			}
			if (uiData == FAIL)
				m_uiBugTrioDeathCount = 0;
			m_auiEncounter[uiType] = uiData;
			break;
		case TYPE_HUHURAN:
			m_auiEncounter[uiType] = uiData;
			if (uiData == DONE)
				DoUseDoorOrButton(GO_TWINS_ENTER_DOOR);
			break;
		case TYPE_SARTURA:
		case TYPE_FANKRISS:
		case TYPE_VISCIDUS:
        case TYPE_CTHUN_PHASE:
            m_auiEncounter[uiType] = uiData;
            break;
        case TYPE_TWINS:
            // Either of the twins can set data, so return to avoid double changing
            if (m_auiEncounter[uiType] ==  uiData)
                return;

            m_auiEncounter[uiType] = uiData;
            DoUseDoorOrButton(GO_TWINS_ENTER_DOOR);
            if (uiData == DONE)
                DoUseDoorOrButton(GO_TWINS_EXIT_DOOR);
            break;

    }

    if (uiData == DONE)
    {
        OUT_SAVE_INST_DATA;

        std::ostringstream saveStream;
		for (int i = 0; i < MAX_ENCOUNTER; ++i)
            saveStream << m_auiEncounter[i] << " ";

        m_strInstData = saveStream.str();

        SaveToDB();
        OUT_SAVE_INST_DATA_COMPLETE;
    }
}

void instance_temple_of_ahnqiraj::Load(const char* chrIn)
{
    if (!chrIn)
    {
        OUT_LOAD_INST_DATA_FAIL;
        return;
    }

    OUT_LOAD_INST_DATA(chrIn);

    std::istringstream loadStream(chrIn);
	for (int i = 0; i < MAX_ENCOUNTER; ++i)
    {
        loadStream >> m_auiEncounter[i];
        if (m_auiEncounter[i] == IN_PROGRESS)
            m_auiEncounter[i] = NOT_STARTED;
    }
    m_auiEncounter[TYPE_CTHUN_PHASE] = 0;

    OUT_LOAD_INST_DATA_COMPLETE;
}

uint32 instance_temple_of_ahnqiraj::GetData(uint32 uiType)
{
    return m_auiEncounter[uiType];
}

InstanceData* GetInstanceData_instance_temple_of_ahnqiraj(Map* pMap)
{
    return new instance_temple_of_ahnqiraj(pMap);
}

bool AreaTrigger_at_temple_ahnqiraj(Player* pPlayer, const AreaTriggerEntry* pAt)
{
	if (!pPlayer->isAlive() || pPlayer->isGameMaster())
		return false;

	switch (pAt->id)
	{
	case AREATRIGGER_SARTURA:
		if (instance_temple_of_ahnqiraj* pInstance = (instance_temple_of_ahnqiraj*)pPlayer->GetInstanceData())
		{
			if (pInstance->GetData(TYPE_SARTURA) == NOT_STARTED || pInstance->GetData(TYPE_SARTURA) == FAIL)
			{
				if (Creature* pSartura = pInstance->GetSingleCreatureFromStorage(NPC_BATTLEGUARD_SARTURA))
					pSartura->SetInCombatWithZone();
			}
		}
		break;
	case AREATRIGGER_TWIN_EMPERORS:
		if (instance_temple_of_ahnqiraj* pInstance = (instance_temple_of_ahnqiraj*)pPlayer->GetInstanceData())
		{
			if (Creature* pEye = pInstance->GetSingleCreatureFromStorage(NPC_THE_MASTERS_EYE))
				pEye->ForcedDespawn(1000);
		}
		break;
	}
	return false;
}

void AddSC_instance_temple_of_ahnqiraj()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "instance_temple_of_ahnqiraj";
    pNewScript->GetInstanceData = &GetInstanceData_instance_temple_of_ahnqiraj;
    pNewScript->RegisterSelf();

	pNewScript = new Script;
	pNewScript->Name = "at_temple_ahnqiraj";
	pNewScript->pAreaTrigger = &AreaTrigger_at_temple_ahnqiraj;
	pNewScript->RegisterSelf();
}