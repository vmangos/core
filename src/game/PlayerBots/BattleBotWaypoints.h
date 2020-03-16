#ifndef MANGOS_BattleBotWaypoints_H
#define MANGOS_BattleBotWaypoints_H

enum BattleBotWaypointsMaps
{
    BB_MAP_WS = 489,
    BB_MAP_AB = 529,
    BB_MAP_AV = 30
};

class BattleBotWaypoints
{
public:
    void Think(Player* me);
};

#endif
