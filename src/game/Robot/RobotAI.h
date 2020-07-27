#ifndef ROBOT_AI_H
#define ROBOT_AI_H

#ifndef AI_CHECK_DELAY
# define AI_CHECK_DELAY 100
#endif

#ifndef MOVEMENT_CHECK_DELAY
# define MOVEMENT_CHECK_DELAY 200
#endif

#ifndef DEFAULT_MOVEMENT_LIMIT_DELAY
# define DEFAULT_MOVEMENT_LIMIT_DELAY 5000
#endif

#include "Strategy_Base.h"

enum RobotCharacterType :uint32
{
    RobotCharacterType_DPS = 0,
    RobotCharacterType_TANK = 1,
    RobotCharacterType_HEALER = 2,
};

enum Strategy_Index :uint32
{
    Strategy_Index_Solo = 0,
    Strategy_Index_Group,
    Strategy_Index_Group_BlackrockSpire,
    Strategy_Index_Group_DoctorWeavil,
    Strategy_Index_Group_Lethon,
    Strategy_Index_Group_Ysondre,
    Strategy_Index_Group_Emeriss,
    Strategy_Index_Group_Taerar,
    Strategy_Index_Group_Azuregos,
    Strategy_Index_Group_MoltenCore,
    Strategy_Index_Group_Test,
};

enum RobotMovementType :uint32
{
    RobotMovementType_None = 0,
    RobotMovementType_Point,
    RobotMovementType_Chase,
};

class RobotMovement
{
public:
    RobotMovement(Player* pmMe);
    void ResetMovement();
    void Update(uint32 pmDiff);

    void Chase(Unit* pmChaseTarget, float pmChaseDistanceMax = FOLLOW_MAX_DISTANCE, float pmChaseDistanceMin = 0.0f, uint32 pmLimitDelay = DEFAULT_MOVEMENT_LIMIT_DELAY);
    void MovePosition(Position pmTargetPosition, uint32 pmLimitDelay = DEFAULT_MOVEMENT_LIMIT_DELAY);
    void MovePosition(float pmX, float pmY, float pmZ, uint32 pmLimitDelay = DEFAULT_MOVEMENT_LIMIT_DELAY);

public:
    Player* me;
    Unit* chaseTarget;
    Position pointTarget;
    uint32 activeMovementType;
    float chaseDistanceMin;
    float chaseDistanceMax;
    int checkDelay;
    int limitDelay;
};

class RobotAI
{
public:
    RobotAI(Player* pmMe);
    void ResetStrategies();
    void Update(uint32 pmDiff);

public:
    Player* me;
    RobotMovement* rm;
    std::unordered_map<uint32, Strategy_Base*> strategyMap;
    uint32 robotType;
    int checkDelay;
};
#endif
