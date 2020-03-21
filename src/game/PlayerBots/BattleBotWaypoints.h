#ifndef MANGOS_BattleBotWaypoints_H
#define MANGOS_BattleBotWaypoints_H

enum BattleBotWaypointsMaps
{
    WS_MAP = 489,
    AB_MAP = 529,
    AV_MAP = 30
};

enum WarsongObjectives : uint8
{
    WS_FLAG,
    WS_POWERUP,
    WS_FLAG_CARRIER,
    OBJECTIVE_INVALID
};

enum WarsongFlagSpells
{
    WS_SPELL_WARSONG_FLAG = 23333,
    WS_SPELL_SILVERWING_FLAG = 23335,
};

Position const WS_WAITING_POS_HORDE = { 944.981f, 1423.478f, 345.434f, 6.188937f };
Position const WS_WAITING_POS_ALLIANCE = { 1510.502f, 1493.385f, 351.995f, 6.188937f };
Position const WS_FLAG_POS_HORDE = { 915.958f, 1433.925f, 346.193f, 0.000000f };
Position const WS_FLAG_POS_ALLIANCE = { 1539.219f, 1481.747f, 352.458f, 0.000000f };

class BattleBotWaypoints
{
public:
    void WaypointAI(Player* me);
    void GetBattleGround(Player* me);
    void WarsongGulchAI(Player* me, BattleGround* bg);
    void ArathiBasinAI(Player* me, BattleGround* bg);
    void AlteracValleyAI(Player* me, BattleGround* bg);
    void SetObjective(Player* me, WarsongObjectives objective);
    void SetNextWaypoint(Player* me, float waypoint_x, float waypoint_y, float waypoint_z);
    void StartMove(Player* me, float waypoint_x, float waypoint_y, float waypoint_z);
    bool ReachedWaypoint(Player* me);

    bool m_setWaypoint = false;
    float currentWaypointX = 0.f;
    float currentWaypointY = 0.f;
    float currentWaypointZ = 0.f;
    bool m_reachedWaypoint = true;
    float nextWaypointX = 0.f;
    float nextWaypointY = 0.f;
    float nextWaypointZ = 0.f;

};

#endif
