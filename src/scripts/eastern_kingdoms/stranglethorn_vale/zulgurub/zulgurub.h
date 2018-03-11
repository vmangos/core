/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_ZULGURUB_H
#define DEF_ZULGURUB_H

enum
{
    ZULGURUB_MAX_ENCOUNTER  = 11,

    NPC_LORKHAN             = 11347,
    NPC_ZATH                = 11348,
    NPC_THEKAL              = 14599,
    NPC_JINDO               = 11380,
    NPC_HAKKAR              = 14834,
    NPC_VENOXIS             = 14507,
    NPC_ARLOKK              = 14515,
    NPC_MARLI               = 14510,
    NPC_RAZZASHI_SKITTERER  = 14880,
    NPC_RAZZASHI_VENOMBROOD = 14532,
    NPC_HAKARI_SHADOWCASTER = 11338,
    NPC_RAZZASHI_BROODWIDOW = 11370,
    NPC_GAHZRANKA           = 15114,

    TYPE_ARLOKK             = 1,
    TYPE_JEKLIK             = 2,
    TYPE_VENOXIS            = 3,
    TYPE_MARLI              = 4,
    TYPE_OHGAN              = 5,
    TYPE_THEKAL             = 6,
    TYPE_ZATH               = 7,
    TYPE_LORKHAN            = 8,
    TYPE_HAKKAR             = 9,
    TYPE_RANDOM_BOSS        = 10,

    DATA_JINDO              = 11,
    DATA_LORKHAN            = 12,
    DATA_THEKAL             = 13,
    DATA_ZATH               = 14,
    DATA_HAKKAR             = 15,

    TYPE_GAHZRANKA          = 16,
    DATA_GAHZRANKA          = 17
};

class instance_zulgurub : public ScriptedInstance
{
    public:
        instance_zulgurub(Map* pMap) : ScriptedInstance(pMap), m_randomBossSpawned(false) {Initialize();};

        void Initialize();
                void Create();

        bool IsEncounterInProgress();
        void OnCreatureCreate(Creature* pCreature);
                void OnCreatureDeath(Creature * pCreature);
        void SetData(uint32 uiType, uint32 uiData);
        const char* Save();
        void Load(const char* chrIn);
                void HandleLoadCreature(uint32 dataType, uint64 &storeGuid, Creature* pCrea); // Nostalrius

        uint32 GetData(uint32 uiType);
        uint64 GetData64(uint32 uiData);

        // each time High Priest dies lower Hakkar's HP
        void LowerHakkarHitPoints();
        Unit* Thekal_GetUnitThatCanRez();
        uint32 GenerateRandomBoss();
        void SpawnRandomBoss();

    protected:
        std::string strInstData;
                bool m_randomBossSpawned;
                uint32 randomBossEntry;
        // If all High Priest bosses were killed. Lorkhan, Zath and Ohgan are added too.
        uint32 m_auiEncounter[ZULGURUB_MAX_ENCOUNTER];

        // Storing Lorkhan, Zath and Thekal because we need to cast on them later. Jindo is needed for heal function too.
        uint64 m_uiLorKhanGUID;
        uint64 m_uiZathGUID;
        uint64 m_uiThekalGUID;
        uint64 m_uiJindoGUID;
        uint64 m_uiHakkarGUID;
        uint64 m_uiGahzrankaGUID;

        uint64 m_uiMarliGUID;
                std::list<uint64> m_lMarliTrashGUIDList;
};

#endif
