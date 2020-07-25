#ifndef ROBOT_STRATEGY_GROUP_H
#define ROBOT_STRATEGY_GROUP_H

#include "Strategy_Base.h"

enum CreatureEntry_RobotStrategy :uint32
{
    CreatureEntry_Strategy_Gyth = 10339,
    CreatureEntry_Strategy_Rend = 10429,
    CreatureEntry_Strategy_Drakkisath = 10363,
    CreatureEntry_Strategy_Doctor_Weavil = 15552,
    CreatureEntry_Strategy_Group_Ysondre = 14887,
    CreatureEntry_Strategy_Group_Lethon = 14888,
    CreatureEntry_Strategy_Emeriss = 14889,
    CreatureEntry_Strategy_Group_Taerar = 14890,
    CreatureEntry_Strategy_Dream_Fog = 15224,
    CreatureEntry_Strategy_Demented_Druid = 15260,
    CreatureEntry_Strategy_Shade_of_Taerar = 15302,
    CreatureEntry_Strategy_Spirit_Shade = 15261,
    CreatureEntry_Strategy_Azuregos = 6109,
    CreatureEntry_Strategy_Magmadar = 11982,
    CreatureEntry_Strategy_Garr = 12057,
    CreatureEntry_Strategy_Firesworn = 12099,
    CreatureEntry_Strategy_Baron_Geddon = 12056,
    CreatureEntry_Strategy_Golemagg_the_Incinerator = 11988,
    CreatureEntry_Strategy_Flamewaker_Healer = 11663,
    CreatureEntry_Strategy_Flamewaker_Elite = 11664,
    CreatureEntry_Strategy_Majordomo_Executus = 12018,
    CreatureEntry_Strategy_Ragnaros = 11502,
    CreatureEntry_Strategy_Ragnaros_Adds = 12143,
    CreatureEntry_Strategy_Core_Rager = 11672,
};

enum GroupRole :uint32
{
    GroupRole_DPS = 0,
    GroupRole_Tank = 1,
    GroupRole_Healer = 2,
};

class EngagePosition
{
public:
    EngagePosition()
    {
        engageAngle = 0.0f;
        engageDistance = 0.0f;
    }

public:
    float engageAngle;
    float engageDistance;
};

class Strategy_Group :public Strategy_Base
{
public:
    Strategy_Group(Player* pmMe) :Strategy_Base(pmMe)
    {
        InitialStrategy();
    }
    void Reset();
    void InitialStrategy();
    bool GroupInCombat();    
    Player* GetPlayerByGroupRole(uint32 pmGroupRole);
    std::unordered_set<Player*> GetPlayerSetByGroupRoleSet(std::unordered_set<uint32> pmGroupRoleSet);
    std::unordered_set<ObjectGuid> GetPlayerGUIDSetByGroupRoleSet(std::unordered_set<uint32> pmGroupRoleSet);

    bool Update0(uint32 pmDiff);
    void Update(uint32 pmDiff) override;

    virtual bool Engage(Unit* pmTarget);
    virtual bool DPS();
    virtual Player* GetMainTank();
    virtual Player* GetSubTank();
    virtual bool Tank();
    virtual bool Tank(Unit* pmTarget);
    virtual bool Rest();
    virtual bool Heal();
    virtual bool Buff();
    virtual bool Follow();
    virtual bool Stay(std::string pmTargetGroupRole);
    virtual bool Hold(std::string pmTargetGroupRole);
    virtual bool Chasing();
    virtual std::string GetGroupRoleName();
    virtual void SetGroupRole(std::string pmRoleName);    
    bool AngleInRange(float pmSourceAngle, float pmTargetAngle, float pmRange);
    Position GetNearPoint(Position pmSourcePosition, float pmDistance, float pmAbsoluteAngle);

public:
    int combatTime;    
    int teleportAssembleDelay;    
    int dpsDelay;
    int engageDelay;
    int readyCheckDelay;
    float followDistance;
    bool staying;
    bool holding;
    bool following;
    bool cure;
    uint32 paladinAura;
    bool marked;
    Position markPos;
    Position basePos;
    int moveDelay;
    uint32 actionType;
    int actionDelay;
    int assistDelay;
};
#endif
