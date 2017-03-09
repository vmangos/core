#pragma once
/*Giperion February - March 2017
  FaeireFire project
  [EUREKA] 3.1
  Based on:
	Mangos			2005 - 2009
	Mangos-Zero		2009 - 2011
	Nostalrius Core 2011 - 2016
	Elysium Core	2016 - 2017
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

	virtual ~AdvancedPlayerBotAI()
	{}

	virtual void UpdateAI(const uint32 delta) override;

protected:

	//ai entry points for every class and common
	//It works as hardcoded behaviour tree
	void CommonAI(const uint32 delta);

	void WarriorAI(const uint32 delta);
	void WarriorAttackTarget(Unit* NearestAttacker);

	void PaladinAI(const uint32 delta);
	void HunterAI(const uint32 delta);
	void RogueAI(const uint32 delta);
	void PriestAI(const uint32 delta);
	void ShamanAI(const uint32 delta);
	void MageAI(const uint32 delta);
	void WarlockAI(const uint32 delta);

	void WarlockBattleAI(Unit* NearestAttacker);

	void DruidAI(const uint32 delta);


	//Hello Source Engine ;)
	void GatherConditions();

	uint32 ThinkerTimer;
	uint32 ThinkerInterval;
	ConditionTable Conditions;
	Unit* SeenCreature;


private:

	Unit* PickNearestAttacker();
};