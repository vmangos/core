#pragma once
/*Giperion February - March 2017
  FaeireFire project
  [EUREKA] 3.1
  Based on:
    Mangos          2005 - 2009
    Mangos-Zero     2009 - 2011
    Nostalrius Core 2011 - 2016
    Elysium Core    2016 - 2017
*/


#include "PlayerBotAI.h"

//no flags, but bools. Memory expensive, but better performance and more friendly to debugger/reading
struct ConditionTable
{
    //see enemy and details
    bool SeeEnemy;
    bool SeeMonter;
    bool SeeHostilePlayer;

    bool IsDead;
    bool IsResurrectRequested;

    //see corpses and details
    bool SeeDead;
    bool SeeDeadPlayer;
    bool SeeDeadMonster;

    //low hp/mana
    bool LowHP;
    bool LowMana;

    //IsAttacked
    bool IsAttacked;

    ConditionTable()
    : SeeEnemy(false), SeeMonter(false), SeeHostilePlayer(false), IsDead(false), IsResurrectRequested(false),
    SeeDead(false), SeeDeadPlayer(false), SeeDeadMonster(false),
    LowHP(false), LowMana(false), IsAttacked(false)
    {}
};

class AdvancedPlayerBotAI : public PlayerCreatorAI
{
public:

    AdvancedPlayerBotAI(Player* pPlayer, uint8 _race_, uint8 _class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o)
        : PlayerCreatorAI(pPlayer, _race_, _class_, mapId, instanceId, x, y, z, o)
    {
        ThinkerTimer = 0;
        ThinkerInterval = 50;
        SeenCreature = nullptr;
    }

    ~AdvancedPlayerBotAI() override
    {}

    void UpdateAI(uint32 const delta) override;

protected:

    //ai entry points for every class and common
    //It works as hardcoded behaviour tree
    void CommonAI(uint32 const delta);

    void WarriorAI(uint32 const delta);
    void WarriorAttackTarget(Unit* NearestAttacker);

    void PaladinAI(uint32 const delta);
    void HunterAI(uint32 const delta);
    void RogueAI(uint32 const delta);
    void PriestAI(uint32 const delta);
    void ShamanAI(uint32 const delta);
    void MageAI(uint32 const delta);
    void WarlockAI(uint32 const delta);

    void WarlockBattleAI(Unit* NearestAttacker);

    void DruidAI(uint32 const delta);


    //Hello Source Engine ;)
    void GatherConditions();

    uint32 ThinkerTimer;
    uint32 ThinkerInterval;
    ConditionTable Conditions;
    Unit* SeenCreature;


private:

    Unit* PickNearestAttacker();
};