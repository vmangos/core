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
    TYPE_CTHUN                  = 5,
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
    NPC_OURO_SPAWNER            = 15957,
    NPC_CTHUN                   = 15727,
    NPC_CTHUN_PORTAL            = 15896,
    NPC_VEKNISS_HATCHLING       = 15962,
    NPC_MASTERS_EYE             = 15963,
    NPC_SARTURA_S_ROYAL_GUARD   = 15984,

    GO_SKERAM_GATE              = 180636,
    GO_TWINS_ENTER_DOOR         = 180634,
    GO_TWINS_EXIT_DOOR          = 180635,
    GO_SANDWORM_BASE            = 180795,

    AREATRIGGER_TWIN_EMPERORS	= 4047,
    AREATRIGGER_SARTURA		= 4052,

    EMOTE_EYE_INTRO             = -1531012,
    SAY_EMPERORS_INTRO_1        = -1531013,
    SAY_EMPERORS_INTRO_2        = -1531014,
    SAY_EMPERORS_INTRO_3        = -1531015,
    SAY_EMPERORS_INTRO_4        = -1531016,
    SAY_EMPERORS_INTRO_5        = -1531017,
    SAY_EMPERORS_INTRO_6        = -1531018,

    // Whispered on players around the map
    SAY_CTHUN_WHISPER_1         = -1531033,
    SAY_CTHUN_WHISPER_2         = -1531034,
    SAY_CTHUN_WHISPER_3         = -1531035,
    SAY_CTHUN_WHISPER_4         = -1531036,
    SAY_CTHUN_WHISPER_5         = -1531037,
    SAY_CTHUN_WHISPER_6         = -1531038,
    SAY_CTHUN_WHISPER_7         = -1531039,
    SAY_CTHUN_WHISPER_8         = -1531040,
    SPELL_SUMMON_PLAYER         = 20477,

    // Cast periodically on players around the instance
    SPELL_WHISPERINGS_CTHUN_1   = 26195,
    SPELL_WHISPERINGS_CTHUN_2   = 26197,
    SPELL_WHISPERINGS_CTHUN_3   = 26198,
    SPELL_WHISPERINGS_CTHUN_4   = 26258,
    SPELL_WHISPERINGS_CTHUN_5   = 26259,
};


// Used for C'thun only, but needed by multiple mobs so putting in instance
struct StomachTimers {
    uint32 acidDebuff;
    uint32 puntCastTime;
    uint32 removeFromListIn;
    bool playerHasLeftStomach;
    StomachTimers() :
        acidDebuff(StomachTimers::ACID_REFRESH_RATE),
        puntCastTime(StomachTimers::PUNT_CAST_TIME),
        removeFromListIn(REMOVE_FROM_STOMACH_LIST_DELAY),
        playerHasLeftStomach(false)
    {}

    static const int32 ACID_REFRESH_RATE = 5000;
    static const int32 PUNT_CAST_TIME = 3000;
    // Player is removed from players in stomach list after a delay of this
    // length after the teleport has found place.
    // If set to 0, the player is instantly removed from the list.
    static const uint32 REMOVE_FROM_STOMACH_LIST_DELAY = 3000;
};

class instance_temple_of_ahnqiraj : public ScriptedInstance
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

    void Update(uint32 uiDiff);

    void DoHandleTempleAreaTrigger(uint32 uiTriggerId);

    using CThunStomachList = std::vector<std::pair<ObjectGuid, StomachTimers>>;
    CThunStomachList& GetPlayersInStomach();

private:
    uint32 m_auiEncounter[MAX_ENCOUNTER];
    std::string m_strInstData;

    uint32 m_uiBugTrioDeathCount;
    uint32 m_uiCthunPhase;
    uint32 m_uiCthunWhisperTimer;

    GuidList m_lRoyalGuardGUIDList;

    bool m_bIsEmperorsIntroDone;

    DialogueHelper m_dialogueHelper;

    // Used for C'thun only, but needed by multiple mobs so putting in instance
    std::vector<std::pair<ObjectGuid, StomachTimers>> playersInStomach;
};

#endif
