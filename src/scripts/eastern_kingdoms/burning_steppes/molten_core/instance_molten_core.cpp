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
#include "molten_core.h"

struct instance_molten_core : ScriptedInstance
{
    explicit instance_molten_core(Map* pMap) : ScriptedInstance(pMap)
    {
        instance_molten_core::Initialize();
    }

    uint32 m_auiEncounter[INSTANCE_MC_MAX_ENCOUNTER];

    uint64 m_uiLucifronGUID, m_uiMagmadarGUID, m_uiGehennasGUID, m_uiGarrGUID, m_uiGeddonGUID, m_uiShazzrahGUID, m_uiSulfuronGUID, m_uiGolemaggGUID, m_uiMajorDomoGUID, m_uiRagnarosGUID, m_uiFlamewakerPriestGUID;
    uint64 m_uiRuneKoroGUID, m_uiRuneZethGUID, m_uiRuneMazjGUID, m_uiRuneTheriGUID, m_uiRuneBlazGUID, m_uiRuneKressGUID, m_uiRuneMohnGUID, m_uiHotCoalsGUID, m_uiFirelordCacheGUID;
    uint64 m_RuneSates[7];
    uint64 m_GOUseGuidList[7];
    uint32 m_dataDomoSpawned;
    uint32 m_ObjectRemoveTimer;

    std::string strInstData;

    void Initialize() override
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        m_uiLucifronGUID  = 0;
        m_uiMagmadarGUID  = 0;
        m_uiGehennasGUID  = 0;
        m_uiGarrGUID      = 0;
        m_uiGeddonGUID    = 0;
        m_uiShazzrahGUID  = 0;
        m_uiSulfuronGUID  = 0;
        m_uiGolemaggGUID  = 0;
        m_uiMajorDomoGUID = 0;
        m_uiRagnarosGUID  = 0;
        m_uiFlamewakerPriestGUID = 0;

        m_uiRuneKoroGUID  = 0;
        m_uiRuneZethGUID  = 0;
        m_uiRuneMazjGUID  = 0;
        m_uiRuneTheriGUID = 0;
        m_uiRuneBlazGUID  = 0;
        m_uiRuneKressGUID = 0;
        m_uiRuneMohnGUID  = 0;

        m_uiHotCoalsGUID = 0;
        m_uiFirelordCacheGUID = 0;

        m_ObjectRemoveTimer = 5000;

        for (uint8 i = 0; i < 7; ++i)
        {
            m_RuneSates[i] = NOT_STARTED;
            m_GOUseGuidList[i] = 0;
        }

        m_dataDomoSpawned = NOT_STARTED;
    }

    bool IsEncounterInProgress() const override
    {
        for (uint32 const& i : m_auiEncounter)
        {
            if (i == IN_PROGRESS || i == SPECIAL)
            {
                return true;
            }
        }

        return false;
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        switch (pGo->GetEntry())
        {
            case RUNE_SULFURON:
            {
                m_uiRuneKoroGUID = pGo->GetGUID();
                if (m_RuneSates[0] == DONE)
                {
                    m_GOUseGuidList[0] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_GEDDON:
            {
                m_uiRuneZethGUID = pGo->GetGUID();
                if (m_RuneSates[1] == DONE)
                {
                    m_GOUseGuidList[1] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_SHAZZRAH:
            {
                m_uiRuneMazjGUID = pGo->GetGUID();
                if (m_RuneSates[2] == DONE)
                {
                    m_GOUseGuidList[2] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_GOLEMAGG:
            {
                m_uiRuneTheriGUID = pGo->GetGUID();
                if (m_RuneSates[3] == DONE)
                {
                    m_GOUseGuidList[3] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_GARR:
            {
                m_uiRuneBlazGUID = pGo->GetGUID();
                if (m_RuneSates[4] == DONE)
                {
                    m_GOUseGuidList[4] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_MAGMADAR:
            {
                m_uiRuneKressGUID = pGo->GetGUID();
                if (m_RuneSates[5] == DONE)
                {
                    m_GOUseGuidList[5] = pGo->GetGUID();
                }
                break;
            }
            case RUNE_GEHENNAS:
            {
                m_uiRuneMohnGUID = pGo->GetGUID();
                if (m_RuneSates[6] == DONE)
                {
                    m_GOUseGuidList[6] = pGo->GetGUID();
                }
                break;
            }
            case GO_HOT_COALS:
            {
                m_uiHotCoalsGUID = pGo->GetGUID();
                pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
                break;
            }
            case RUNE_MAJORDOMO:
            {
                m_uiFirelordCacheGUID = pGo->GetGUID();
                break;
            }
        }
    }

    void OnCreatureRespawn(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_FLAMEWAKER_PRIEST:
            {
                if (m_auiEncounter[TYPE_SULFURON] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_CORE_RAGER:
            {
                if (m_auiEncounter[TYPE_GOLEMAGG] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_FLAMEWAKER:
            {
                if (m_auiEncounter[TYPE_GEHENNAS] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_FLAMEWAKER_PROTECTOR:
            {
                if (m_auiEncounter[TYPE_LUCIFRON] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_CORE_HOUND:
            case NPC_ANCIENT_CORE_HOUND:
            {
                if (m_auiEncounter[TYPE_MAGMADAR] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_GARR:
            case NPC_FIRESWORN:
            case NPC_LAVA_SURGER:
            {
                if (m_auiEncounter[TYPE_GARR] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_MAJORDOMO:
            {
                m_auiEncounter[TYPE_MAJORDOMO] = DONE;
                pCreature->AddObjectToRemoveList();
                break;
            }
            case NPC_RAGNAROS:
            {
                m_auiEncounter[TYPE_RAGNAROS] = DONE;
                pCreature->AddObjectToRemoveList();
                break;
            }
            case NPC_LAVA_ANNIHILATOR:
            {
                if (urand(0, 1))
                {
                    pCreature->SetEntry(NPC_FIRELORD);
                    pCreature->UpdateEntry(NPC_FIRELORD);
                }
                pCreature->AIM_Initialize();
                break;
            }
            case NPC_FIRELORD:
            {
                if (urand(0, 1))
                {
                    pCreature->SetEntry(NPC_LAVA_ANNIHILATOR);
                    pCreature->UpdateEntry(NPC_LAVA_ANNIHILATOR);
                }
                pCreature->AIM_Initialize();
                break;
            }
        }
    }

    void OnCreatureEnterCombat(Creature* pCreature) override
    {
        if (pCreature->GetEntry() != NPC_MAJORDOMO &&
            pCreature->GetEntry() != NPC_FLAMEWAKER_HEALER &&
            pCreature->GetEntry() != NPC_FLAMEWAKER_ELITE)
        {
            return;
        }

        Unit* pVictim = pCreature->GetVictim();
        if (!pVictim)
            return;

        // Mob linking (can't be done in db, since Majordomo is summoned?)
        std::list<Creature*> DomoAndHisAdds;
        GetCreatureListWithEntryInGrid(DomoAndHisAdds, pCreature, NPC_FLAMEWAKER_HEALER, 150.f);
        GetCreatureListWithEntryInGrid(DomoAndHisAdds, pCreature, NPC_FLAMEWAKER_ELITE, 150.f);
        GetCreatureListWithEntryInGrid(DomoAndHisAdds, pCreature, NPC_MAJORDOMO, 150.f);
        if (DomoAndHisAdds.empty())
            return;

        for (auto const& itr : DomoAndHisAdds)
        {
            if (itr->IsAlive() && !itr->IsInCombat())
            {
                itr->SetInCombatWith(pVictim);
            }
        }
    }

    void OnCreatureCreate(Creature* pCreature) override
    {
        switch (pCreature->GetEntry())
        {
            case NPC_LUCIFRON:
            {
                m_uiLucifronGUID = pCreature->GetGUID();
                break;
            }
            case NPC_MAGMADAR:
            {
                m_uiMagmadarGUID = pCreature->GetGUID();
                break;
            }
            case NPC_GEHENNAS:
            {
                m_uiGehennasGUID = pCreature->GetGUID();
                break;
            }
            case NPC_GEDDON:
            {
                m_uiGeddonGUID = pCreature->GetGUID();
                break;
            }
            case NPC_SHAZZRAH:
            {
                m_uiShazzrahGUID = pCreature->GetGUID();
                break;
            }
            case NPC_SULFURON:
            {
                m_uiSulfuronGUID = pCreature->GetGUID();
                break;
            }
            case NPC_GOLEMAGG:
            {
                m_uiGolemaggGUID = pCreature->GetGUID();
                break;
            }
            case NPC_MAJORDOMO:
            {
                m_uiMajorDomoGUID = pCreature->GetGUID();
                break;
            }
            case NPC_RAGNAROS:
            {
                m_uiRagnarosGUID = pCreature->GetGUID();
                break;
            }
            case NPC_FLAMEWAKER_PRIEST:
            {
                m_uiFlamewakerPriestGUID = pCreature->GetGUID();
                if (m_auiEncounter[TYPE_SULFURON] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_CORE_RAGER:
            {
                if (m_auiEncounter[TYPE_GOLEMAGG] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_FLAMEWAKER:
            {
                if (m_auiEncounter[TYPE_GEHENNAS] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_FLAMEWAKER_PROTECTOR:
            {
                if (m_auiEncounter[TYPE_LUCIFRON] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_LAVA_ANNIHILATOR:
            {
                if (urand(0, 1))
                {
                    pCreature->UpdateEntry(NPC_FIRELORD);
                    pCreature->SetEntry(NPC_FIRELORD);
                    pCreature->AIM_Initialize();
                }
                break;
            }
            case NPC_FIRELORD:
            {
                if (urand(0, 1))
                {
                    pCreature->UpdateEntry(NPC_LAVA_ANNIHILATOR);
                    pCreature->SetEntry(NPC_LAVA_ANNIHILATOR);
                    pCreature->AIM_Initialize();
                }
                break;
            }
            case NPC_CORE_HOUND:
            case NPC_ANCIENT_CORE_HOUND:
            {
                if (m_auiEncounter[TYPE_MAGMADAR] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_GARR:
            {
                m_uiGarrGUID = pCreature->GetGUID();
                m_mNpcEntryGuidStore[pCreature->GetEntry()] = pCreature->GetObjectGuid();
                break;
            }
            case NPC_FIRESWORN:
            case NPC_LAVA_SURGER:
            {
                if (m_auiEncounter[TYPE_GARR] == DONE)
                {
                    pCreature->AddObjectToRemoveList();
                }
                break;
            }
            case NPC_LAVA_SPAWN:
            {
                // Prevent exponential lava spawn creation in case of evade bug
                std::list<Creature*> LavaSpawnList;
                GetCreatureListWithEntryInGrid(LavaSpawnList, pCreature, NPC_LAVA_SPAWN, 100.0f);
                if (LavaSpawnList.size() > MAX_LAVA_SPAWNS)
                {
                    pCreature->ForcedDespawn();
                }
                break;
            }
        }
    }

    void SetData(uint32 uiType, uint32 uiData) override
    {
        switch (uiType)
        {
            case TYPE_SULFURON:
            case TYPE_GEDDON:
            case TYPE_SHAZZRAH:
            case TYPE_GOLEMAGG:
            case TYPE_GARR:
            case TYPE_MAGMADAR:
            case TYPE_GEHENNAS:
            case TYPE_LUCIFRON:
            {
                m_auiEncounter[uiType] = uiData;
                break;
            }
            case TYPE_MAJORDOMO:
            {
                m_auiEncounter[TYPE_MAJORDOMO] = uiData;
                if (uiData == DONE)
                {
                    DoRespawnGameObject(m_uiFirelordCacheGUID, HOUR);
                }
                break;
            }
            case TYPE_RAGNAROS:
            {
                m_auiEncounter[9] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_0:
            {
                m_RuneSates[0] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_1:
            {
                m_RuneSates[1] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_2:
            {
                m_RuneSates[2] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_3:
            {
                m_RuneSates[3] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_4:
            {
                m_RuneSates[4] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_5:
            {
                m_RuneSates[5] = uiData;
                break;
            }
            case DATA_RUNE_ACTIVE_6:
            {
                m_RuneSates[6] = uiData;
                break;
            }
            case DATA_DOMO_SPAWNED:
            {
                m_dataDomoSpawned = uiData;
                break;
            }
        }

        if (uiData == DONE)
        {
            OUT_SAVE_INST_DATA;
            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }

    char const* Save() override
    {
        std::ostringstream saveStream;
        saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " "
                   << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " << m_auiEncounter[5] << " "
                   << m_auiEncounter[6] << " " << m_auiEncounter[7] << " " << m_auiEncounter[8] << " "
                   << m_auiEncounter[9] << " " << m_RuneSates[0] << " " << m_RuneSates[1] << " "
                   << m_RuneSates[2] << " " << m_RuneSates[3] << " " << m_RuneSates[4] << " "
                   << m_RuneSates[5] << " " << m_RuneSates[6];
        strInstData = saveStream.str();
        return strInstData.c_str();
    }

    uint32 GetData(uint32 uiType) override
    {
        switch (uiType)
        {
            case TYPE_SULFURON:
            case TYPE_GEDDON:
            case TYPE_SHAZZRAH:
            case TYPE_GOLEMAGG:
            case TYPE_GARR:
            case TYPE_MAGMADAR:
            case TYPE_GEHENNAS:
            case TYPE_LUCIFRON:
            case TYPE_MAJORDOMO:
            case TYPE_RAGNAROS:
            {
                return m_auiEncounter[uiType];
            }
            case DATA_RUNE_ACTIVE_0:
            {
                return m_RuneSates[0];
            }
            case DATA_RUNE_ACTIVE_1:
            {
                return m_RuneSates[1];
            }
            case DATA_RUNE_ACTIVE_2:
            {
                return m_RuneSates[2];
            }
            case DATA_RUNE_ACTIVE_3:
            {
                return m_RuneSates[3];
            }
            case DATA_RUNE_ACTIVE_4:
            {
                return m_RuneSates[4];
            }
            case DATA_RUNE_ACTIVE_5:
            {
                return m_RuneSates[5];
            }
            case DATA_RUNE_ACTIVE_6:
            {
                return m_RuneSates[6];
            }
            case DATA_DOMO_SPAWNED:
            {
                return m_dataDomoSpawned;
            }
        }

        return 0;
    }

    uint64 GetData64(uint32 uiData) override
    {
        switch (uiData)
        {
            case DATA_SULFURON:
            {
                return m_uiSulfuronGUID;
            }
            case DATA_GOLEMAGG:
            {
                return m_uiGolemaggGUID;
            }
            case DATA_GARR:
            {
                return m_uiGarrGUID;
            }
            case DATA_MAJORDOMO:
            {
                return m_uiMajorDomoGUID;
            }
        }

        return 0;
    }

    void RemoveRuneFire(GameObject* pRune, Unit* pUser, uint32 goEntry, uint64& i)
    {
        if (GameObject* pGoFireAnim = pRune->FindNearestGameObject(goEntry, 20.f))
        {
            pGoFireAnim->Delete();
            pRune->Use(pUser);
            i = 0;
        }
    }

    void Update(uint32 const uiDiff) override
    {
        if (m_ObjectRemoveTimer < uiDiff)
        {
            instance->RemoveAllObjectsInRemoveList();
            m_ObjectRemoveTimer = 5000;
        }
        else
        {
            m_ObjectRemoveTimer -= uiDiff;
        }

        Map::PlayerList const& liste = instance->GetPlayers();
        if (liste.getFirst() != nullptr)
        {
            for (uint64& i : m_GOUseGuidList)
            {
                if (i)
                {
                    GameObject* pRune = instance->GetGameObject(i);
                    if (!pRune)
                    {
                        continue;
                    }

                    switch (pRune->GetEntry())
                    {
                        case RUNE_SULFURON:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178187, i);
                            break;
                        }
                        case RUNE_GEDDON:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178188, i);
                            break;
                        }
                        case RUNE_SHAZZRAH:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178189, i);
                            break;
                        }
                        case RUNE_GOLEMAGG:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178190, i);
                            break;
                        }
                        case RUNE_GARR:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178191, i);
                            break;
                        }
                        case RUNE_MAGMADAR:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178192, i);
                            break;
                        }
                        case RUNE_GEHENNAS:
                        {
                            RemoveRuneFire(pRune, liste.getFirst()->getSource(), 178193, i);
                            break;
                        }
                    }
                }
            }
        }
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

        loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3]
                   >> m_auiEncounter[4] >> m_auiEncounter[5] >> m_auiEncounter[6]
                   >> m_auiEncounter[7] >> m_auiEncounter[8] >> m_auiEncounter[9]
                   >> m_RuneSates[0] >> m_RuneSates[1] >> m_RuneSates[2] >> m_RuneSates[3]
                   >> m_RuneSates[4] >> m_RuneSates[5] >> m_RuneSates[6];

        for (uint32& i : m_auiEncounter)
        {
            if (i == IN_PROGRESS) // Do not load an encounter as "In Progress" - reset it instead.
            {
                i = NOT_STARTED;
            }
        }

        for (uint8 i = 0; i < INSTANCE_MC_MAX_ENCOUNTER; ++i)
        {
            SetData(i, m_auiEncounter[i]);
        }

        for (uint32 const& i : m_RuneSates)
        {
            SetData((DATA_RUNE_ACTIVE_0 + 16), i);
        }
    }
};

bool UpdateRune(ScriptedInstance* pInstance, GameObject* pGo, uint32 typeBoss, uint32 typeRune, uint32 objectEntry)
{
    if (pInstance->GetData(typeBoss) == DONE)
    {
        if (pInstance->GetData(typeRune) != DONE)
        {
            pInstance->SetData(typeRune, DONE);
        }

        if (GameObject* Rune = pGo->FindNearestGameObject(objectEntry, 20.f))
        {
            Rune->Delete();
        }

        return true; // Updated!
    }
    return false; // Not Updated!
}

bool GOHello_go_rune_MC(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = static_cast<ScriptedInstance*>(pGo->GetInstanceData());
    if (!pInstance)
    {
        return false;
    }

    switch (pGo->GetEntry())
    {
        case RUNE_SULFURON:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_SULFURON, DATA_RUNE_ACTIVE_0, 178187))
            {
                return true;
            }
            break;
        }
        case RUNE_GEDDON:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_GEDDON, DATA_RUNE_ACTIVE_1, 178188))
            {
                return true;
            }
            break;
        }
        case RUNE_SHAZZRAH:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_SHAZZRAH, DATA_RUNE_ACTIVE_2, 178189))
            {
                return true;
            }
            break;
        }
        case RUNE_GOLEMAGG:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_GOLEMAGG, DATA_RUNE_ACTIVE_3, 178190))
            {
                return true;
            }
            break;
        }
        case RUNE_GARR:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_GARR, DATA_RUNE_ACTIVE_4, 178191))
            {
                return true;
            }
            break;
        }
        case RUNE_MAGMADAR:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_MAGMADAR, DATA_RUNE_ACTIVE_5, 178192))
            {
                return true;
            }
            break;
        }
        case RUNE_GEHENNAS:
        {
            if (!UpdateRune(pInstance, pGo, TYPE_GEHENNAS, DATA_RUNE_ACTIVE_6, 178193))
            {
                return true;
            }
            break;
        }
    }

    if (pInstance->GetData(TYPE_RAGNAROS) == DONE ||
        pInstance->GetData(DATA_DOMO_SPAWNED) == DONE)
    {
        return false;
    }

    if (pInstance->GetData(DATA_RUNE_ACTIVE_0) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_1) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_2) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_3) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_4) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_5) != DONE ||
        pInstance->GetData(DATA_RUNE_ACTIVE_6) != DONE)
    {
        return false;
    }

    pInstance->SetData(DATA_DOMO_SPAWNED, DONE);

    // Summon Majordomus
    if (pInstance->GetData(TYPE_MAJORDOMO) != DONE)
    {
        // Default case
        if (Creature* pMajorDomo = pPlayer->SummonCreature(NPC_MAJORDOMO, 758.089f, -1176.71f, -118.640f, 3.12414f, TEMPSUMMON_MANUAL_DESPAWN, (2 * HOUR * IN_MILLISECONDS)))
        {
            DoScriptText(SAY_RUNES_DESTROYED, pMajorDomo);
        }
    }
    else
    {
        // Server crash/shutdown during Ragnaros encounter.
        // Summon Majordomus in Ragnaros chamber and add gossip to resummon Ragnaros.
        if (Creature* pMajorDomo = pPlayer->SummonCreature(NPC_MAJORDOMO, 847.103f, -816.153f, -229.775f, 4.344f, TEMPSUMMON_TIMED_DESPAWN, (2 * HOUR * IN_MILLISECONDS)))
        {
            pMajorDomo->SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME | UNIT_FLAG_IMMUNE_TO_PLAYER | UNIT_FLAG_IN_COMBAT);
            pMajorDomo->SetFactionTemplateId(1080);
            pMajorDomo->CombatStop();
            pMajorDomo->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
        }
    }

    return false;
}

InstanceData* GetInstance_instance_molten_core(Map* pMap)
{
    return new instance_molten_core(pMap);
}

void AddSC_instance_molten_core()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "instance_molten_core";
    newscript->GetInstanceData = &GetInstance_instance_molten_core;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_rune_MC";
    newscript->pGOHello = &GOHello_go_rune_MC;
    newscript->RegisterSelf();
}
