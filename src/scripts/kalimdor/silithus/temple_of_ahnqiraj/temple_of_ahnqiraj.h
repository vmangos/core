/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_TEMPLE_OF_AHNQIRAJ_H
#define DEF_TEMPLE_OF_AHNQIRAJ_H

enum
{
    MAX_ENCOUNTER               = 10,
    
    TYPE_SKERAM                 = 0,
    TYPE_SARTURA                = 1,
    TYPE_FANKRISS               = 2,
    TYPE_HUHURAN                = 3,
    TYPE_TWINS                  = 4,
    TYPE_C_THUN                 = 5,
    TYPE_BUG_TRIO               = 6,
    TYPE_VISCIDUS               = 7,
    TYPE_OURO                   = 8,
    TYPE_CTHUN_PHASE            = 9,
};

enum
{
    NPC_VEKNISS_SOLDIER         = 15229,
    NPC_VEKNISS_WARRIOR         = 15230,
    NPC_VEKNISS_GUARDIAN        = 15233,
    NPC_VEKNISS_STINGER         = 15235,
    NPC_VEKNISS_WASP            = 15236,
    NPC_VEKNISS_HIVE_CRAWLER    = 15240,
    NPC_QIRAJI_MINDSLAYER       = 15246,
    NPC_QIRAJI_BRAINWASHER      = 15247,
    NPC_QIRAJI_LASHER           = 15249,
    NPC_QIRAJI_SLAYER           = 15250,
    NPC_QIRAJI_CHAMPION         = 15252,
    NPC_OBSIDIAN_ERADICATOR     = 15262,
    NPC_SKERAM                  = 15263,
    NPC_ANUBISATH_SENTINEL      = 15264,
    NPC_VEKNILASH               = 15275,
    NPC_VEKLOR                  = 15276,
    NPC_ANUBISATH_DEFENDER      = 15277,
    NPC_VISCIDUS                = 15299,
    NPC_VEKNISS_DRONE           = 15300,
    NPC_ANUBISATH_WARDER        = 15311,
    NPC_OBSIDIAN_NULLIFIER      = 15312,
    NPC_QIRAJI_SCARAB           = 15316,
    NPC_QIRAJI_SCORPION         = 15317,
    NPC_MERITHRA_OF_THE_DREAM   = 15378,
    NPC_CAELESTRASZ             = 15379,
    NPC_ARYGOS                  = 15380,
    NPC_ANDORGOS                = 15502,
    NPC_KANDROSTRASZ            = 15503,
    NPC_VETHSERA                = 15504,
    NPC_PRINCESS_HUHURAN        = 15509,
    NPC_FANKRISS_THE_UNYIELDING = 15510,
    NPC_KRI                     = 15511,
    NPC_BATTLEGUARD_SARTURA     = 15516,
    NPC_OURO                    = 15517,
    NPC_ANUBISATH_WARRIOR       = 15537,
    NPC_ANUBISATH_SWARMGUARD    = 15538,
    NPC_PRINCESS_YAUJ           = 15543,
    NPC_VEM                     = 15544,
    NPC_EYE_OF_C_THUN           = 15589,
    NPC_YAUJ_BROOD              = 15621,
    NPC_VEKNISS_BORER           = 15622,
    NPC_SPAWN_OF_FANKRISS       = 15630,
    NPC_OURO_SCARAB             = 15718,
    NPC_CTHUN                   = 15727,
    NPC_CTHUN_PORTAL            = 15896,
    NPC_VEKNISS_HATCHLING       = 15962,
    NPC_THE_MASTERS_EYE         = 15963,
    NPC_SARTURA_S_ROYAL_GUARD   = 15984,

    //GO_SKERAM_GATE              = 180636,
    //GO_TWINS_ENTER_DOOR         = 180634,
    //GO_TWINS_EXIT_DOOR          = 180635,

	GO_SKERAM_GATE				= 21785,
	GO_TWINS_ENTER_DOOR			= 21783,
	GO_TWINS_EXIT_DOOR			= 21784,

	AREATRIGGER_TWIN_EMPERORS	= 4047,
	AREATRIGGER_SARTURA			= 4052,
};

class instance_temple_of_ahnqiraj : public ScriptedInstance_PTR
{
    public:
        instance_temple_of_ahnqiraj(Map* pMap);

        void Initialize();
        
        bool IsEncounterInProgress() const override;

        void OnCreatureRespawn(Creature* pCreature);
        void OnCreatureCreate(Creature* pCreature);
        void OnObjectCreate(GameObject* pGo);

        void SetData(uint32 uiType, uint32 uiData);
        uint32 GetData(uint32 uiType);

		void GetRoyalGuardGUIDList(GuidList& lList) { lList = m_lRoyalGuardGUIDList; }

        const char* Save() { return m_strInstData.c_str(); }
        void Load(const char* chrIn);

    private:
        uint32 m_auiEncounter[MAX_ENCOUNTER];
        std::string m_strInstData;

        uint32 m_uiBugTrioDeathCount;
        uint32 m_uiCthunPhase;

		GuidList m_lRoyalGuardGUIDList;
};

#endif