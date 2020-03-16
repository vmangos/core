#ifndef MANGOS_BattleBotWaypoints_H
#define MANGOS_BattleBotWaypoints_H

enum BattleBotWaypointsMaps
{
    BB_MAP_WS = 489,
    BB_MAP_AB = 529,
    BB_MAP_AV = 30
};

Position const WS_WAITING_POS_HORDE = { 944.981f, 1423.478f, 345.434f, 6.188937f };
Position const WS_WAITING_POS_ALLIANCE = { 1510.502f, 1493.385f, 351.995f, 6.188937f };
Position const WS_FLAG_POS_HORDE = { 915.958f, 1433.925f, 346.193f, 0.000000f };
Position const WS_FLAG_POS_ALLIANCE = { 1539.219f, 1481.747f, 352.458f, 0.000000f };

class BattleBotWaypoints
{
public:
    void Think(Player* me);
};

#endif
