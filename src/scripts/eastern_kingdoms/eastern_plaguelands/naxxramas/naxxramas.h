/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_NAXXRAMAS_H
#define DEF_NAXXRAMAS_H

enum NAXX_ENCOUNTERS_TYPES
{
    TYPE_ANUB_REKHAN            = 0,
    TYPE_FAERLINA               = 1,
    TYPE_MAEXXNA                = 2,

    TYPE_NOTH                   = 3,
    TYPE_HEIGAN                 = 4,
    TYPE_LOATHEB                = 5,

    TYPE_RAZUVIOUS              = 6,
    TYPE_GOTHIK                 = 7,
    TYPE_FOUR_HORSEMEN          = 8,

    TYPE_PATCHWERK              = 9,
    TYPE_GROBBULUS              = 10,
    TYPE_GLUTH                  = 11,
    TYPE_THADDIUS               = 12,

    TYPE_SAPPHIRON              = 13,
    TYPE_KELTHUZAD              = 14,
    
    MAX_ENCOUNTER               = 15,
};

enum NaxxNPCs : uint32
{
    NPC_ANUB_REKHAN             = 15956,
    NPC_FAERLINA                = 15953,
    NPC_MAEXXNA                 = 15952,

    NPC_PATCHWERK               = 16028,
    NPC_GROBBULUS               = 15931,
    NPC_GLUTH                   = 15932,
    NPC_THADDIUS                = 15928,
    NPC_STALAGG                 = 15929,
    NPC_FEUGEN                  = 15930,
    NPC_TESLA_COIL              = 16218,

    NPC_NOTH                    = 15954,
    NPC_HEIGAN                  = 15936,
    NPC_LOATHEB                 = 16011, 
    
    NPC_RAZUVIOUS               = 16061,
    NPC_GOTHIK                  = 16060,
    NPC_ZELIEK                  = 16063,
    NPC_THANE                   = 16064,
    NPC_BLAUMEUX                = 16065,
    NPC_RIVENDARE               = 30549,

    NPC_SAPPHIRON               = 15989,
    NPC_KELTHUZAD               = 15990,

    // Gothik adds
    NPC_SUB_BOSS_TRIGGER        = 16137,    //summon locations
    NPC_UNREL_TRAINEE           = 16124,
    NPC_UNREL_DEATH_KNIGHT      = 16125,
    NPC_UNREL_RIDER             = 16126,
    NPC_SPECT_TRAINEE           = 16127,
    NPC_SPECT_DEATH_KNIGTH      = 16148,
    NPC_SPECT_RIDER             = 16150,
    NPC_SPECT_HORSE             = 16149,

    // Kel'Thuzad adds
    NPC_SOLDIER_FROZEN          = 16427,
    NPC_UNSTOPPABLE_ABOM        = 16428,
    NPC_SOUL_WEAVER             = 16429,
    NPC_GUARDIAN                = 16441,
};

enum NaxxAreaTriggers : uint32
{
    AREATRIGGER_KELTHUZAD       = 4112,
    AREATRIGGER_FAERLINA        = 4115,     // Used for faerlinas greet message
    AREATRIGGER_GOTHIK          = 4116,
    AREATRIGGER_ANUB            = 4119,     // Triggers the greet-message from anub
    
    // AREATRIGGER_EXIT_NAXXRAMAS      = 
    AREATRIGGER_BEHIND_FROSTWYRM_TP = 4120, // not sure why this one is there.
    AREATRIGGER_FROSTWYRM_TP        = 4167,
    AREATRIGGER_HUB_TO_FROSTWYRM    = 4156,     // Teleport to sapphiron from center of naxx
};
static const WorldLocation toFrostwyrmTPPos(533, 3498.0f, -5349.68f, 144.97f, 1.3f);
static const WorldLocation entranceHubTPPos(533, 3023.52f, -3434.31f, 296.1f, 0.0f);

enum NaxxGOs : uint32
{
    // Arachnid Quarter
    GO_ARAC_ANUB_DOOR           = 181126,   //encounter door - open on click after click auto open/close on encounter pull/kill/reset
    GO_ARAC_ANUB_GATE           = 181195,   //open after boss is dead 
    GO_ARAC_FAER_WEB            = 181235,   //encounter door
    GO_ARAC_FAER_DOOR           = 194022,   //after faerlina, to outer ring
    GO_ARAC_MAEX_INNER_DOOR     = 181197,   //encounter door
    GO_ARAC_MAEX_OUTER_DOOR     = 181209,   //right before maex

    // Plague Quarter
    GO_PLAG_NOTH_ENTRY_DOOR     = 181200,   //encounter door
    GO_PLAG_NOTH_EXIT_DOOR      = 181201,   //exit, open when boss dead
    GO_PLAG_HEIG_ENTRY_DOOR     = 181202,
    GO_PLAG_HEIG_EXIT_DOOR      = 181203,   //exit, open when boss dead
    GO_PLAG_HEIG_OLD_EXIT_DOOR  = 181496,   //between heigan and loatheb. Unsure if used
    GO_PLAG_LOAT_DOOR           = 181241,   //encounter door

    // Military Quarter
    GO_PLAG_SLIME01_DOOR        = 181198,   //not used
    GO_PLAG_SLIME02_DOOR        = 181199,   //not used
    GO_MILI_GOTH_ENTRY_GATE     = 181124,   //open after razuvious died
    GO_MILI_GOTH_EXIT_GATE      = 181125,   //exit, open at boss dead
    GO_MILI_GOTH_COMBAT_GATE    = 181170,   //used while encounter is in progress
    GO_MILI_HORSEMEN_DOOR       = 181119,   //encounter door

    GO_CHEST_HORSEMEN_NORM      = 181366,   //four horsemen event, DoRespawnGameObject() when event == DONE
    GO_CHEST_HORSEMEN_HERO      = 193426,

    // Construct Quarter
    GO_CONS_PATH_EXIT_DOOR      = 181123,
    GO_CONS_GLUT_EXIT_DOOR      = 181120,
    GO_CONS_THAD_DOOR           = 181121,   // Thaddius encounter door

    GO_HUB_PORTAL               = 181229,   // portal to frostwyrm lair
    // Frostwyrm Lair
    GO_KELTHUZAD_WATERFALL_DOOR = 181225,   // open after sapphiron is dead
    GO_KELTHUZAD_DOOR           = 181228,   // open after sapphiron is dead. Possibly not until players are close?

    // Shiny things appearing at central hub eyes when killing boss
    GO_MILI_EYE_RAMP            = 181210,
    GO_PLAG_EYE_RAMP            = 181211,
    GO_ARAC_EYE_RAMP            = 181212,
    GO_CONS_EYE_RAMP            = 181213,

    // eye looking things at end of wings. Ports ut to central hub.
    GO_ARAC_PORTAL              = 181575,
    GO_CONS_PORTAL              = 181576,
    GO_PLAG_PORTAL              = 181577,
    GO_MILI_PORTAL              = 181578,

    // Shiny things appearing at above GObs when killing boss.
    GO_MILI_EYE_BOSS            = 181230,
    GO_PLAG_EYE_BOSS            = 181231,
    GO_CONS_EYE_BOSS            = 181232,
    GO_ARAC_EYE_BOSS            = 181233,

    // Kel'Thuzad window portals. "opening" on 40%
    // NOTE: the ids are used to loop over the GObjs, 
    // so if they change, update code in instance_naxxramas::ToggleKelThuzadWindows
    GO_KT_WINDOW_1              = 181402,
    GO_KT_WINDOW_2              = 181403,
    GO_KT_WINDOW_3              = 181404,
    GO_KT_WINDOW_4              = 181405,

    GO_CONS_NOX_TESLA_FEUGEN    = 181477,
    GO_CONS_NOX_TESLA_STALAGG   = 181478,
};

struct GothTrigger
{
    bool bIsRightSide;
    bool bIsAnchorHigh;
};

class instance_naxxramas : public ScriptedInstance
{
public:
    instance_naxxramas(Map* pMap);
    ~instance_naxxramas() {}

    void Initialize();

    bool IsEncounterInProgress();

    void OnCreatureCreate(Creature* pCreature);
    void OnObjectCreate(GameObject* pGo);

    void SetData(uint32 uiType, uint32 uiData);
    uint32 GetData(uint32 uiType);
    uint64 GetData64(uint32 uiData);

    uint64 GetGOUuid(NaxxGOs which);

    const char* Save() { return strInstData.c_str(); }
    void Load(const char* chrIn);

    // goth
    void SetGothTriggers();
    Creature* GetClosestAnchorForGoth(Creature* pSource, bool bRightSide);
    void GetGothSummonPointCreatures(std::list<Creature*> &lList, bool bRightSide);
    bool IsInRightSideGothArea(Unit* pUnit);

    // kel
    void SetChamberCenterCoords(float fX, float fY, float fZ);
    void GetChamberCenterCoords(float &fX, float &fY, float &fZ) { fX = m_fChamberCenterX; fY = m_fChamberCenterY; fZ = m_fChamberCenterZ; }
    void ToggleKelThuzadWindows(bool setOpen);

    void OnPlayerDeath(Player* p) override;

    void onNaxxramasAreaTrigger(Player* pPlayer, const AreaTriggerEntry* pAt);

    void UpdateBossEntranceDoor(NaxxGOs which, uint32 uiData);  // GO closes when uiData==IN_PROGRESS, otherwise opens
    void UpdateBossEntranceDoor(GameObject* pGO, uint32 uiData);// GO closes when uiData==IN_PROGRESS, otherwise opens
    void UpdateBossGate(NaxxGOs which, uint32 uiData);          // GO_STATE_ACTIVE when uiData==DONE, otherwise GO_STATE_READY
    void UpdateBossGate(GameObject* pGO, uint32 uiData);        // GO_STATE_ACTIVE when uiData==DONE, otherwise GO_STATE_READY

    // thaddius
    void GetThadTeslaCreatures(GuidList& lList) { lList = m_lThadTeslaCoilList; };


    void UpdateTeleporters(uint32 uiType, uint32 uiData);           // Updates all portals related to an endboss specified by uiType
    void SetTeleporterVisualState(GameObject* pGO, uint32 uiData);  // Sets the state of a specific eye-portal
    void SetTeleporterState(GameObject* pGO, uint32 uiData);        // Sets the state of a specific eye-portal visual GO

private:
    bool m_faerlinaHaveGreeted;
    uint32 m_horsemenDeathCounter;
protected:
    uint32 m_auiEncounter[MAX_ENCOUNTER];
    std::string strInstData;

    std::list<uint64> m_lGothTriggerList;
    UNORDERED_MAP<uint64, GothTrigger> m_mGothTriggerMap;
    GuidList m_lThadTeslaCoilList;
   
    float m_fChamberCenterX;
    float m_fChamberCenterY;
    float m_fChamberCenterZ;
};

#endif
