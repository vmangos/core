/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Instance_Scarlet_Monastery
SD%Complete: 50
SDComment:
SDCategory: Scarlet Monastery
EndScriptData */

#include "scriptPCH.h"
#include "scarlet_monastery.h"

struct instance_scarlet_monastery : ScriptedInstance
{
    explicit instance_scarlet_monastery(Map* pMap) : ScriptedInstance(pMap)
    {
        instance_scarlet_monastery::Initialize();
    }

    uint32 m_auiEncounter[INSTANCE_SM_MAX_ENCOUNTER];

    uint64 m_uiMograineGUID;
    uint64 m_uiWhitemaneGUID;
    uint64 m_uiVorrelGUID;
    uint64 m_uiDoorHighInquisitorGUID;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        m_uiMograineGUID = 0;
        m_uiWhitemaneGUID = 0;
        m_uiVorrelGUID = 0;
        m_uiDoorHighInquisitorGUID = 0;
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case 3976:
                m_uiMograineGUID = pCreature->GetGUID();
                break;
            case 3977:
                m_uiWhitemaneGUID = pCreature->GetGUID();
                break;
            case 3981:
                m_uiVorrelGUID = pCreature->GetGUID();
                break;
        }
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        if (pGo->GetEntry() == 104600)
            m_uiDoorHighInquisitorGUID = pGo->GetGUID();
    }

    uint64 GetData64(uint32 data) override
    {
        switch (data)
        {
            case DATA_MOGRAINE:
                return m_uiMograineGUID;
            case DATA_WHITEMANE:
                return m_uiWhitemaneGUID;
            case DATA_VORREL:
                return m_uiVorrelGUID;
            case DATA_DOOR_WHITEMANE:
                return m_uiDoorHighInquisitorGUID;
        }

        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        if (uiType == TYPE_MOGRAINE_AND_WHITE_EVENT)
        {
            if (uiData == IN_PROGRESS)
                DoUseDoorOrButton(m_uiDoorHighInquisitorGUID);
            if (uiData == FAIL)
                DoUseDoorOrButton(m_uiDoorHighInquisitorGUID);

            m_auiEncounter[0] = uiData;
        }
    }

    uint32 GetData(uint32 uiData) override
    {
        if (uiData == TYPE_MOGRAINE_AND_WHITE_EVENT)
            return m_auiEncounter[0];

        return 0;
    }
};

InstanceData* GetInstanceData_instance_scarlet_monastery(Map* pMap)
{
    return new instance_scarlet_monastery(pMap);
}

void AddSC_instance_scarlet_monastery()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_scarlet_monastery";
    newscript->GetInstanceData = &GetInstanceData_instance_scarlet_monastery;
    newscript->RegisterSelf();
}
