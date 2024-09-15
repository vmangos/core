/*
 *
 */

#pragma once

#include "GameEventMgr.h"
#include "ObjectMgr.h"

/*
 * Elemental Invasion
 */

enum
{
    EVENT_INVASION = 13,
    EVENT_FIRE = 68,
    EVENT_AIR = 69,
    EVENT_EARTH = 70,
    EVENT_WATER = 71,
    EVENT_BOSS_F = 72,
    EVENT_BOSS_A = 73,
    EVENT_BOSS_E = 74,
    EVENT_BOSS_W = 75,

    BOSS_A_GUID = 58000,
    BOSS_W_GUID = 1184054,
    BOSS_F_GUID = 58300,
    BOSS_E_GUID = 58100,
};

struct InvasionDataStruct
{
    uint32 eventRift;
    uint32 eventBoss;
    uint32 varDelay;
    uint32 varKills;
    uint32 varStage;
    uint32 bossGuid;
};

const static InvasionDataStruct InvasionData[] =
{
    { EVENT_FIRE,   EVENT_BOSS_F, VAR_DELAY_FIRE,   VAR_FIRE_KILLS,     VAR_FIRE,   BOSS_F_GUID },
    { EVENT_AIR,    EVENT_BOSS_A, VAR_DELAY_AIR,    VAR_AIR_KILLS,      VAR_AIR,    BOSS_A_GUID },
    { EVENT_EARTH,  EVENT_BOSS_E, VAR_DELAY_EARTH,  VAR_EARTH_KILLS,    VAR_EARTH,  BOSS_E_GUID },
    { EVENT_WATER,  EVENT_BOSS_W, VAR_DELAY_WATER,  VAR_WATER_KILLS,    VAR_WATER,  BOSS_W_GUID }
};

struct ElementalInvasion : WorldEvent
{
    ElementalInvasion() : WorldEvent(EVENT_INVASION) {}

    void Update() override;
    void Enable() override;
    void Disable() override;

private:
    void StartLocalInvasion(uint8 index, uint32 stage);
    void StartLocalBoss(uint8 index, uint32 stage, uint8 delay);
    void StopLocalInvasion(uint8 index, uint32 stage, uint8 delay);
    void ResetThings();
};

/*
 * Dragons of Nightmare
 */

enum
{
    EVENT_NIGHTMARE = 66,       // spawn of all 4 Dragons of Nightmare
};

static uint32 NightmareDragons[] =
{
    NPC_YSONDRE, NPC_LETHON, NPC_EMERISS, NPC_TAERAR
};

struct DragonsOfNightmare : WorldEvent
{
    DragonsOfNightmare() : WorldEvent(EVENT_NIGHTMARE) {}

    void Update() override;
    void Enable() override;
    void Disable() override;

    static void CheckSingleVariable(uint32 idx, uint32& value);

private:
    void GetAliveCountAndUpdateRespawnTime(std::vector<ObjectGuid>& dragons, uint32& alive, time_t respawnTime);
    bool LoadDragons(std::vector<ObjectGuid>& dragonGUIDs);
    //void GetExistingDragons(std::vector<ObjectGuid>& dragonGUIDs, std::vector<Creature*>& existingDragons);
    void PermutateDragons();
};

/*
 * Darkmoon Faire
 */

enum DarkmoonState
{
    DARKMOON_NONE = 0,
    DARKMOON_A2_INSTALLATION = 23, // TODO (spawns, game_event)
    DARKMOON_A2 = 4,
    DARKMOON_H2_INSTALLATION = 24, // TODO (spawns, game_event)
    DARKMOON_H2 = 5,
};

static uint16 const DMFValidEvent[] =
{
    DARKMOON_A2_INSTALLATION, DARKMOON_A2,
    DARKMOON_H2_INSTALLATION, DARKMOON_H2
};

struct DarkmoonFaire : WorldEvent
{
    DarkmoonFaire() : WorldEvent(DARKMOON_A2) {} // TODO - should not be used that way

    void Update() override;
    void Enable() override;
    void Disable() override;

private:
    uint32 FindMonthFirstMonday(bool& foireAlly, struct tm *timeinfo);
    DarkmoonState GetDarkmoonState();
};

/*
 * Lunar Festival Firework
 */

enum
{
    EVENT_FIREWORKS         = 6,
    EVENT_NEW_YEAR          = 34,
    EVENT_LUNAR_NEW_YEAR    = 38,
    EVENT_TOASTING_GOBLETS  = 39,
    EVENT_JULY_4TH          = 41,
    EVENT_SEPTEMBER_30TH    = 42,

    FIREWORKS_DURATION      = 10
};

struct FireworksShow : WorldEvent
{
    FireworksShow() : WorldEvent(EVENT_FIREWORKS) {}

    void Update() override;
    void Enable() override;
    void Disable() override;

private:
    bool IsHourBeginning(uint8 minutes = FIREWORKS_DURATION) const;
};

struct ToastingGoblets : WorldEvent
{
    ToastingGoblets() : WorldEvent(EVENT_TOASTING_GOBLETS) {}

    void Update() override;
    void Enable() override;
    void Disable() override;

private:
    bool ShouldEnable() const;
};

struct ScourgeInvasionEvent : WorldEvent
{
    ScourgeInvasionEvent();

    void Update() override;
    uint32 GetZoneTime(uint32 zoneId);
    void LogNextZoneTime();
    void EnableAndStartEvent(uint16 event_id);
    void DisableAndStopEvent(uint16 event_id);
    void HandleDefendedZones();
    void Enable() override;
    void Disable() override;
    uint32 GetNextUpdateDelay() override;

private:
    struct InvasionZone
    {
        uint32 map;
        uint32 zoneId;
        uint32 remainingVar;
        uint32 necroAmount;
        ObjectGuid mouthGuid;
        std::vector<Position> mouth;
    };

    struct CityAttack
    {
        uint32 map;
        uint32 zoneId;
        ObjectGuid pallidGuid;
        std::vector<Position> pallid;
    };

    bool invasion1Loaded;
    bool invasion2Loaded;
    bool invasion3Loaded;
    bool invasion4Loaded;
    bool invasion5Loaded;
    bool invasion6Loaded;

    bool undercityLoaded;
    bool stormwindLoaded;

    void HandleActiveZone(uint32 attackTimeVar, uint32 zoneId, uint32 remainingVar, time_t now);
    void HandleActiveCity(uint32 attackTimeVar, time_t now, uint32 zoneId);

    bool OnEnable(uint32 zoneId, uint32 attackTimeVar);

    void StartNewInvasionIfTime(uint32 timeVariable, uint32 zoneVariable);
    void StartNewCityAttackIfTime(uint32 timeVariable, uint32 zoneVariable);
    bool ResumeInvasion(uint32 zoneId);
    bool SummonMouth(Map* pMap, InvasionZone* zone, Position position);
    bool SummonPallid(Map* pMap, CityAttack* zone, Position position, uint32 spawnLoc);

    Map* GetMap(uint32 mapId, Position const& invZone);
    bool isValidZoneId(uint32 zoneId);
    bool isActiveZone(uint32 zoneId);
    uint32 GetActiveZones();
    InvasionZone* GetInvasionZone(uint32 zoneId);
    CityAttack* GetCityZone(uint32 zoneId);

    void UpdateWorldState();

    std::vector<InvasionZone> invasionPoints;
    std::vector<CityAttack> attackPoints;
    int previousRemainingCounts[6];
};

enum WarEffortEventStage
{
    WAR_EFFORT_STAGE_COLLECTION     = 0,
    WAR_EFFORT_STAGE_READY          = 1,
    WAR_EFFORT_STAGE_MOVE_1         = 2,
    WAR_EFFORT_STAGE_MOVE_2         = 3,
    WAR_EFFORT_STAGE_MOVE_3         = 4,
    WAR_EFFORT_STAGE_MOVE_4         = 5,
    WAR_EFFORT_STAGE_MOVE_5         = 6,
    WAR_EFFORT_STAGE_GONG_WAIT      = 7,
    WAR_EFFORT_STAGE_GONG_RUNG      = 8,
    WAR_EFFORT_STAGE_BATTLE         = 9,
    WAR_EFFORT_STAGE_CH_ATTACK      = 10,
    WAR_EFFORT_STAGE_FINALBATTLE    = 11,
    WAR_EFFORT_STAGE_COMPLETE       = 12
};

inline char const* WarEffortStageToString(uint32 stage)
{
    switch (stage)
    {
        case WAR_EFFORT_STAGE_COLLECTION:
            return "Collection of Materials";
        case WAR_EFFORT_STAGE_READY:
            return "Material Collection Ready";
        case WAR_EFFORT_STAGE_MOVE_1:
            return "Moving to Silithus Day 1";
        case WAR_EFFORT_STAGE_MOVE_2:
            return "Moving to Silithus Day 2";
        case WAR_EFFORT_STAGE_MOVE_3:
            return "Moving to Silithus Day 3";
        case WAR_EFFORT_STAGE_MOVE_4:
            return "Moving to Silithus Day 4";
        case WAR_EFFORT_STAGE_MOVE_5:
            return "Moving to Silithus Day 5";
        case WAR_EFFORT_STAGE_GONG_WAIT:
            return "Waiting for Gong to be Rung";
        case WAR_EFFORT_STAGE_GONG_RUNG:
            return "Gong has been Rung";
        case WAR_EFFORT_STAGE_BATTLE:
            return "Battle at Gate";
        case WAR_EFFORT_STAGE_CH_ATTACK:
            return "Cenarion Hold Attack";
        case WAR_EFFORT_STAGE_FINALBATTLE:
            return "Final Battle";
        case WAR_EFFORT_STAGE_COMPLETE:
            return "Completed";
    }
    return "UNKNOWN";
}

enum WarEffortEnums
{
    WAR_EFFORT_COLLECTION_TRANSITION_TIME   = 10 * MINUTE,  // 10 minutes between the event ending and starting the transition (what is the blizzlike thing here?)
    WAR_EFFORT_MOVE_TRANSITION_TIME         = DAY,          // 1 day transition time default when the effort is moving to Silithus
    WAR_EFFORT_GONG_DURATION                = 10 * HOUR,    // gong lasts 10 hours after the first dong
    WAR_EFFORT_CH_ATTACK_TIME               = 4 * HOUR,     // 4h after gong bang, CH gets attacked
    WAR_EFFORT_FINAL_BATTLE_TIME            = 4 * HOUR,     // 4h after CH attack, final battle begins
    WAR_EFFORT_TEXT_CRYSTALS                = -1000008,     // Crystals emerge from the ground...
    WAR_EFFORT_TEXT_BATTLE_OVER             = -1780312,     // The Might of Kalimdor is victorious...
    WAR_EFFORT_ASHI_REWARD                  = 0x01,
    WAR_EFFORT_ZORA_REWARD                  = 0x02,
    WAR_EFFORT_REGAL_REWARD                 = 0x04
};

struct WarEffortEvent : WorldEvent
{
    WarEffortEvent();

    WarEffortEventStage stage;
    uint32 lastStageTransitionTime;
    uint32 gongRingTime;
    uint32 lastAutoCompleteTime;

    void Update() override;
    void Enable() override;
    void Disable() override;
    uint32 GetNextUpdateDelay() override;

private:
    void UpdateWarEffortCollection(uint32 now);
    void UpdateStageTransitionTime();
    void IncrementWarEffortTransition();
    void UpdateVariables();
    void BeginWar();
    void CompleteWarEffort();
    void UpdateStageEvents();
    void EnableAndStartEvent(uint16 event_id);
    void DisableAndStopEvent(uint16 event_id);
    void UpdateHiveColossusEvents();
};
