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

// Unlocks the escort without the four lords.
// #define DEBUG_DISCIPLE

// Index of the saved instance data. The DB scripts set and check 0-5 and DATA_DISCIPLE_REGEN.
enum WailingCavernsData : uint32
{
    TYPE_ANACONDRA                = 0,
    TYPE_COBRAHN                  = 1,
    TYPE_PYTHAS                   = 2,
    TYPE_SERPENTIS                = 3,
    TYPE_DISCIPLE                 = 4,
    TYPE_MUTANUS                  = 5,
    TYPE_KRESH                    = 6,
    TYPE_SKUM                     = 7,
    TYPE_VERDAN                   = 8,
    WAILING_CAVERNS_MAX_ENCOUNTER = 9,

    // Not saved. The escort DB scripts set it to 0 while the players protect the Disciple (circle, ritual), so an
    // evade between two attacks does not heal him up, and back to 1 afterwards.
    DATA_DISCIPLE_REGEN           = 9
};

enum WailingCaverns : uint32
{
    YELL_NARALEX_CAN_BE_AWAKENED = 2101,

    NPC_KRESH                    = 3653,
    NPC_LORD_COBRAHN             = 3669,
    NPC_LORD_PYTHAS              = 3670,
    NPC_LADY_ANACONDRA           = 3671,
    NPC_LORD_SERPENTIS           = 3673,
    NPC_SKUM                     = 3674,
    NPC_DISCIPLE_OF_NARALEX      = 3678,
    NPC_VERDAN_THE_EVERLIVING    = 5775,

    GO_DMF_CHEST                 = 180055,

    QUEST_FORTUNE_AWAITS         = 7944,

    FACTION_FRIENDLY_TO_ALL      = 35
};

struct WailingCavernsBoss
{
    uint32 entry;
    uint32 type;
};

static WailingCavernsBoss const WailingCavernsBosses[] =
{
    { NPC_LADY_ANACONDRA,        TYPE_ANACONDRA },
    { NPC_LORD_COBRAHN,          TYPE_COBRAHN   },
    { NPC_LORD_PYTHAS,           TYPE_PYTHAS    },
    { NPC_LORD_SERPENTIS,        TYPE_SERPENTIS },
    { NPC_KRESH,                 TYPE_KRESH     },
    { NPC_SKUM,                  TYPE_SKUM      },
    { NPC_VERDAN_THE_EVERLIVING, TYPE_VERDAN    }
};

struct instance_wailing_caverns : public ScriptedInstance
{
    uint32 m_auiEncounter[WAILING_CAVERNS_MAX_ENCOUNTER];
    std::string m_strInstData;
    ObjectGuid m_discipleGuid;

    // Hostile creatures removed once Mutanus is dead.
    std::vector<ObjectGuid> m_despawnAfterMutanus;

    explicit instance_wailing_caverns(Map* pMap) : ScriptedInstance(pMap)
    {
        instance_wailing_caverns::Initialize();
    }

    void Initialize() override
    {
        std::fill(std::begin(m_auiEncounter), std::end(m_auiEncounter), 0);

        m_discipleGuid.Clear();
        m_despawnAfterMutanus.clear();
    }

    static uint32 GetBossType(uint32 entry)
    {
        for (WailingCavernsBoss const& boss : WailingCavernsBosses)
        {
            if (boss.entry == entry)
            {
                return boss.type;
            }
        }

        return WAILING_CAVERNS_MAX_ENCOUNTER;
    }

    // All four lords dead: the escort becomes available (TYPE_DISCIPLE SPECIAL).
    void CheckUnlockEscort()
    {
#ifndef DEBUG_DISCIPLE
        if (m_auiEncounter[TYPE_ANACONDRA] != DONE ||
            m_auiEncounter[TYPE_COBRAHN] != DONE ||
            m_auiEncounter[TYPE_PYTHAS] != DONE ||
            m_auiEncounter[TYPE_SERPENTIS] != DONE)
        {
            return;
        }
#endif

        if (m_auiEncounter[TYPE_DISCIPLE] != NOT_STARTED || m_discipleGuid.IsEmpty())
        {
            return;
        }

        SetData(TYPE_DISCIPLE, SPECIAL);

        if (Creature* pDisciple = instance->GetCreature(m_discipleGuid))
        {
            DoScriptText(YELL_NARALEX_CAN_BE_AWAKENED, pDisciple);
        }
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        // Load resets SPECIAL, the escort is unlocked again once the Disciple exists.
        if (pCreature->GetEntry() == NPC_DISCIPLE_OF_NARALEX)
        {
            m_discipleGuid = pCreature->GetObjectGuid();
            CheckUnlockEscort();
        }

        // Critters, the Disciple and Naralex (friendly to all) and Kresh stay after Mutanus' death.
        if (pCreature->GetCreatureType() != CREATURE_TYPE_CRITTER &&
            pCreature->GetFactionTemplateId() != FACTION_FRIENDLY_TO_ALL &&
            pCreature->GetEntry() != NPC_KRESH)
        {
            m_despawnAfterMutanus.push_back(pCreature->GetObjectGuid());
        }

        OnCreatureRespawn(pCreature);
    }

    // The lords report their death by EventAI.
    void OnCreatureDeath(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_KRESH:
            case NPC_SKUM:
            case NPC_VERDAN_THE_EVERLIVING:
            {
                SetData(GetBossType(pCreature->GetEntry()), DONE);
                break;
            }
        }
    }

    // A killed boss stays dead for the life of the instance, also after his respawn time or a server restart.
    void OnCreatureRespawn(Creature* pCreature) override
    {
        uint32 const type = GetBossType(pCreature->GetEntry());
        if (type < WAILING_CAVERNS_MAX_ENCOUNTER && m_auiEncounter[type] == DONE)
        {
            pCreature->AddObjectToRemoveList();
        }
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        if (pGo->GetEntry() == GO_DMF_CHEST)
        {
            pGo->SetVisible(false);
        }
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        // A respawn restores the regeneration (Creature::UpdateEntry).
        if (uiType == DATA_DISCIPLE_REGEN)
        {
            if (Creature* pDisciple = instance->GetCreature(m_discipleGuid))
            {
                if (uiData)
                {
                    pDisciple->AddCreatureState(CSTATE_REGEN_HEALTH);
                }
                else
                {
                    pDisciple->ClearCreatureState(CSTATE_REGEN_HEALTH);
                }
            }
            return;
        }

        if (uiType >= WAILING_CAVERNS_MAX_ENCOUNTER)
        {
            return;
        }

        m_auiEncounter[uiType] = uiData;

        // Every hostile creature leaves with Mutanus' death, a corpse only once it holds no more loot.
        if (uiType == TYPE_MUTANUS && uiData == DONE)
        {
            for (ObjectGuid const& guid : m_despawnAfterMutanus)
            {
                if (Creature* pCreature = instance->GetCreature(guid))
                {
                    if (pCreature->IsAlive() || pCreature->loot.empty())
                    {
                        pCreature->ForcedDespawn();
                    }
                }
            }

            m_despawnAfterMutanus.clear();
        }

        CheckUnlockEscort();

        if (uiData == DONE)
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            for (uint32 data : m_auiEncounter)
            {
                saveStream << data << " ";
            }
            m_strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    char const* Save() override
    {
        return m_strInstData.c_str();
    }

    uint32 GetData(uint32 uiType) override
    {
        return uiType < WAILING_CAVERNS_MAX_ENCOUNTER ? m_auiEncounter[uiType] : 0;
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
        for (uint32& data : m_auiEncounter)
        {
            loadStream >> data;

            // A fight or the escort running at the save starts over.
            if (data == IN_PROGRESS || data == SPECIAL)
            {
                data = NOT_STARTED;
            }
        }

        OUT_LOAD_INST_DATA_COMPLETE;
    }
};

InstanceData* GetInstanceData_instance_wailing_caverns(Map* pMap)
{
    return new instance_wailing_caverns(pMap);
}

// Darkmoon chest visible only for players on the quest
bool AreaTrigger_at_dmf_chest_wc(Player* pPlayer, AreaTriggerEntry const* /*pAt*/)
{
    if (pPlayer->GetQuestStatus(QUEST_FORTUNE_AWAITS) == QUEST_STATUS_COMPLETE)
    {
        if (GameObject* pGo = pPlayer->FindNearestGameObject(GO_DMF_CHEST, 100.0f))
        {
            pGo->SetVisible(true);
        }
    }

    return false;
}

void AddSC_instance_wailing_caverns()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "instance_wailing_caverns";
    newscript->GetInstanceData = &GetInstanceData_instance_wailing_caverns;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_dmf_chest_wc";
    newscript->pAreaTrigger = &AreaTrigger_at_dmf_chest_wc;
    newscript->RegisterSelf();
}
