#include "Strategy_Group_Lethon.h"
#include "Script_Warrior.h"
#include "Script_Hunter.h"
#include "Script_Shaman.h"
#include "Script_Paladin.h"
#include "Script_Warlock.h"
#include "Script_Priest.h"
#include "Script_Rogue.h"
#include "Script_Mage.h"
#include "Script_Druid.h"
#include "RobotConfig.h"
#include "RobotManager.h"
#include "Group.h"
#include "MotionMaster.h"
#include "TargetedMovementGenerator.h"
#include "GridNotifiers.h"
#include "Map.h"
#include "Pet.h"

void Strategy_Group_Lethon::InitialStrategy()
{
	engageAngle = 0.0f;
	engageDistance = 0.0f;
	Strategy_Group::InitialStrategy();
}

std::string Strategy_Group_Lethon::GetGroupRoleName()
{
	if (!me)
	{
		return "";
	}
	switch (me->groupRole)
	{
	case GroupRole_Lethon::GroupRole_Lethon_Tank1:
	{
		return "tank1";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Tank2:
	{
		return "tank2";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer1:
	{
		return "healer1";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer2:
	{
		return "healer2";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer3:
	{
		return "healer3";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer4:
	{
		return "healer4";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer5:
	{
		return "healer5";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer6:
	{
		return "healer6";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer7:
	{
		return "healer7";
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer8:
	{
		return "healer8";
	}
	case GroupRole_Lethon::GroupRole_Lethon_DPS_Range:
	{
		return "dpsr";
	}
	case GroupRole_Lethon::GroupRole_Lethon_DPS_Melee:
	{
		return "dpsm";
	}
	default:
	{
		break;
	}
	}
	return "dps";
}

void Strategy_Group_Lethon::SetGroupRole(std::string pmRoleName)
{
	if (!me)
	{
		return;
	}
	else if (pmRoleName == "tank1")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Tank1;
	}
	else if (pmRoleName == "tank2")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Tank2;
	}
	else if (pmRoleName == "healer1")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer1;
	}
	else if (pmRoleName == "healer2")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer2;
	}
	else if (pmRoleName == "healer3")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer3;
	}
	else if (pmRoleName == "healer4")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer4;
	}
	else if (pmRoleName == "healer5")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer5;
	}
	else if (pmRoleName == "healer6")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer6;
	}
	else if (pmRoleName == "healer7")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer7;
	}
	else if (pmRoleName == "healer8")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_Healer8;
	}
	else if (pmRoleName == "dpsm")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Melee;
	}
	else if (pmRoleName == "dpsr")
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Range;
	}
	else
	{
		me->groupRole = GroupRole_Lethon::GroupRole_Lethon_DPS_Range;
	}
}

bool Strategy_Group_Lethon::Stay(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_DPS_Melee && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_DPS_Range)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer1 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer2 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer3 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer4 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer5 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer6 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer7 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer8)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Tank1 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Tank2)
		{
			todo = false;
		}
	}
	if (todo)
	{
		me->StopMoving();
		me->GetMotionMaster()->Clear();
		me->AttackStop();
		me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL);
		sb->PetStop();
		staying = true;
		return true;
	}
	return false;
}

bool Strategy_Group_Lethon::Hold(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_DPS_Melee && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_DPS_Range)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer1 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer2 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer3 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer4 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer5 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer6 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer7 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Healer8)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Tank1 && me->groupRole != GroupRole_Lethon::GroupRole_Lethon_Tank2)
		{
			todo = false;
		}
	}
	if (todo)
	{
		holding = true;
		staying = false;
		return true;
	}
	return false;
}

bool Strategy_Group_Lethon::Engage(Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	switch (me->groupRole)
	{
	case GroupRole_Lethon::GroupRole_Lethon_Tank1:
	{
		return sb->Tank(pmTarget, Chasing());
	}
	case GroupRole_Lethon::GroupRole_Lethon_Tank2:
	{
		return Tank();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer1:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer2:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer3:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer4:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer5:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer6:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer7:
	{
		return Heal();
	}
	case GroupRole_Lethon::GroupRole_Lethon_Healer8:
	{
		return Heal();
	}
	default:
	{
		return DPS();
	}
	}

	return false;
}

bool Strategy_Group_Lethon::Follow()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	if (holding)
	{
		return false;
	}
	if (!following)
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		if (Player* leader = ObjectAccessor::FindPlayer(myGroup->GetLeaderGuid()))
		{
			return sb->Follow(leader, followDistance);
		}
	}
	return false;
}

void Strategy_Group_Lethon::Update(uint32 pmDiff)
{
	Strategy_Base::Update(pmDiff);
	if (!Update0(pmDiff))
	{
		return;
	}
	if (Group* myGroup = me->GetGroup())
	{
		if (actionDelay > 0)
		{
			actionDelay -= pmDiff;
			switch (actionType)
			{
			case ActionType_Lethon::ActionType_Lethon_MarkMove:
			{
				if (me->GetDistance2d(markPos) < 0.5f)
				{
					actionDelay = 0;
				}
				break;
			}
			default:
			{
				break;
			}
			}
			return;
		}
		bool groupInCombat = GroupInCombat();
		if (groupInCombat)
		{
			eatDelay = 0;
			combatTime += pmDiff;
		}
		else
		{
			combatTime = 0;
		}
		if (engageDelay > 0)
		{
			engageDelay -= pmDiff;
			switch (me->groupRole)
			{
			case GroupRole_Lethon::GroupRole_Lethon_Tank1:
			{
				if (sb->Tank(engageTarget, Chasing()))
				{
					return;
				}
				else
				{
					engageTarget = NULL;
					engageDelay = 0;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Tank2:
			{
				if (sb->Tank(engageTarget, Chasing()))
				{
					return;
				}
				else
				{
					engageTarget = NULL;
					engageDelay = 0;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer1:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer2:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer3:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer4:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer5:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer6:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer7:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer8:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Range:
			{
				if (sb->DPS(engageTarget, Chasing()))
				{
					return;
				}
				else
				{
					engageTarget = NULL;
					engageDelay = 0;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Melee:
			{
				if (sb->DPS(engageTarget, Chasing()))
				{
					return;
				}
				else
				{
					engageTarget = NULL;
					engageDelay = 0;
				}
				break;
			}
			default:
			{
				break;
			}
			}
			return;
		}
		if (groupInCombat)
		{
			if (sb->Assist())
			{
				return;
			}
			switch (me->groupRole)
			{
			case GroupRole_Lethon::GroupRole_Lethon_Tank1:
			{
				if (Tank())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Tank2:
			{
				if (Tank())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer1:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer2:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer3:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer4:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer5:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer6:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer7:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer8:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Range:
			{
				if (DPS())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Melee:
			{
				if (DPS())
				{
					return;
				}
				break;
			}
			default:
			{
				break;
			}
			}
		}
		else
		{
			if (eatDelay > 0)
			{
				eatDelay -= pmDiff;
				return;
			}
			switch (me->groupRole)
			{

			case GroupRole_Lethon::GroupRole_Lethon_Tank1:
			{
				if (Rest())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Tank2:
			{
				if (Rest())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer1:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer2:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer3:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer4:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer5:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer6:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer7:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_Healer8:
			{
				if (Rest())
				{
					return;
				}
				if (Heal())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Range:
			{
				if (Rest())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			case GroupRole_Lethon::GroupRole_Lethon_DPS_Melee:
			{
				if (Rest())
				{
					return;
				}
				if (Buff())
				{
					return;
				}
				break;
			}
			default:
			{
				break;
			}
			}
		}
		Follow();
	}
}

bool Strategy_Group_Lethon::DPS()
{
	if (Group* myGroup = me->GetGroup())
	{
		if (Unit* boss = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Group_Lethon))
		{
			if (me->IsAlive())
			{
				bool moving = false;
				bool attacking = false;
				if (boss->GetTargetGuid() != me->GetObjectGuid())
				{
					attacking = true;
					if (Player* bossTarget = ObjectAccessor::FindPlayer(boss->GetTargetGuid()))
					{
						if (bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank1 || bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank2)
						{
							float bossDistance = boss->GetDistance2dToCenter(bossTarget);
							if (bossDistance < 20.0f)
							{
								if (AngleInRange(basePos.o, boss->GetOrientation(), ANGLE_RANGE) || AngleInRange(basePos.o + M_PI, boss->GetOrientation(), ANGLE_RANGE))
								{
									float myBossDistance = boss->GetDistance2dToCenter(me);
									float myBossAngle = boss->GetAngle(me);
									if (myBossDistance < engageDistance - 1.0f || myBossDistance>engageDistance + 1.0f)
									{
										moving = true;
									}
									else if (!AngleInRange(myBossAngle, engageAngle, ANGLE_RANGE))
									{
										moving = true;
									}
								}
							}
						}
					}
				}
				if (moving)
				{
					markPos = GetNearPoint(boss->GetPosition(), engageDistance, engageAngle);
					actionDelay = 3000;
					actionType = ActionType_Lethon::ActionType_Lethon_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(1, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(boss));
				}
				else if (attacking)
				{
					if (combatTime > dpsDelay)
					{
						sb->DPS(boss, false);
					}
				}
			}
		}
		return true;
	}
	return Strategy_Group::DPS();
}

bool Strategy_Group_Lethon::Tank()
{
	if (Group* myGroup = me->GetGroup())
	{
		if (Unit* boss = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Group_Lethon))
		{
			ObjectGuid activeOG = myGroup->GetOGByTargetIcon(0);
			if (!activeOG.IsEmpty())
			{
				bool moving = false;
				bool tanking = false;
				bool assisting = false;
				bool changing = false;
				if (activeOG == me->GetObjectGuid())
				{
					if (!me->IsAlive())
					{
						changing = true;
					}
					else if (me->GetNearbyCreatureWithEntry(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Dream_Fog, 3.0f))
					{
						changing = true;
					}
					else if (me->GetAuraStack(24818) >= 3)
					{
						changing = true;
					}
					else
					{
						tanking = true;
						float myBossDistance = boss->GetDistance2dToCenter(me);
						if (myBossDistance < 20.0f)
						{
							if (!AngleInRange(basePos.o, boss->GetOrientation(), ANGLE_RANGE) && !AngleInRange(basePos.o + M_PI, boss->GetOrientation(), ANGLE_RANGE))
							{
								moving = true;
							}
							else if (myBossDistance < engageDistance - 1.0f || myBossDistance>engageDistance + 1.0f)
							{
								moving = true;
							}
						}
					}
				}
				else
				{
					if (me->IsAlive())
					{
						if (boss->GetTargetGuid() != me->GetObjectGuid())
						{
							assisting = true;
							if (Player* bossTarget = ObjectAccessor::FindPlayer(boss->GetTargetGuid()))
							{
								if (bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank1 || bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank2)
								{
									float bossDistance = boss->GetDistance2dToCenter(bossTarget);
									if (bossDistance < 20.0f)
									{
										if (AngleInRange(basePos.o, boss->GetOrientation(), ANGLE_RANGE) || AngleInRange(basePos.o + M_PI, boss->GetOrientation(), ANGLE_RANGE))
										{
											float myBossDistance = boss->GetDistance2dToCenter(me);
											float myBossAngle = boss->GetAngle(me);
											if (myBossDistance < engageDistance - 1.0f || myBossDistance>engageDistance + 1.0f)
											{
												moving = true;
											}
											else if (!AngleInRange(myBossAngle, engageAngle, ANGLE_RANGE))
											{
												moving = true;
											}
										}
									}
								}
							}
						}
					}
				}
				if (moving)
				{
					markPos = GetNearPoint(boss->GetPosition(), engageDistance, engageAngle);
					actionDelay = 3000;
					actionType = ActionType_Lethon::ActionType_Lethon_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(1, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(boss));
				}
				else if (tanking)
				{
					sb->Taunt(boss);
					sb->Tank(boss, false);
				}
				else if (assisting)
				{
					sb->SubTank(boss, false);
				}
				else if (changing)
				{
					uint32 subRole = GroupRole_Lethon::GroupRole_Lethon_None;
					switch (me->groupRole)
					{
					case GroupRole_Lethon::GroupRole_Lethon_Tank1:
					{
						subRole = GroupRole_Lethon::GroupRole_Lethon_Tank2;
						break;
					}
					case GroupRole_Lethon::GroupRole_Lethon_Tank2:
					{
						subRole = GroupRole_Lethon::GroupRole_Lethon_Tank1;
						break;
					}
					default:
					{
						break;
					}
					}
					if (Player* subTank = GetPlayerByGroupRole(subRole))
					{
						if (subTank->IsAlive())
						{
							if (!subTank->GetNearbyCreatureWithEntry(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Dream_Fog, 3.0f))
							{
								if (subTank->GetAuraStack(24818) < 3)
								{
									myGroup->SetTargetIcon(0, subTank->GetObjectGuid());
								}
							}
						}
					}
				}
			}
		}
		return true;
	}
	return Strategy_Group::Tank();
}

bool Strategy_Group_Lethon::Tank(Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	switch (me->groupRole)
	{
	case GroupRole_Lethon::GroupRole_Lethon_Tank1:
	{
		sb->ClearTarget();
		sb->ChooseTarget(pmTarget);
		return sb->Tank(pmTarget, Chasing());
	}
	default:
	{
		break;
	}
	}

	return false;
}

bool Strategy_Group_Lethon::Heal()
{
	if (Group* myGroup = me->GetGroup())
	{
		if (Unit* boss = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Group_Lethon))
		{
			int myTargetIcon = -1;
			if (me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer1 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer2 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer3)
			{
				myTargetIcon = 1;
			}
			else if (me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer4 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer5 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer6)
			{
				myTargetIcon = 2;
			}
			else if (me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer7 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer8)
			{
				myTargetIcon = 3;
			}
			bool moving = false;
			bool healing = false;
			bool assisting = false;
			bool changing = false;
			if (me->IsAlive())
			{
				if (boss->GetTargetGuid() != me->GetObjectGuid())
				{
					assisting = true;
					if (Player* bossTarget = ObjectAccessor::FindPlayer(boss->GetTargetGuid()))
					{
						if (bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank1 || bossTarget->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank2)
						{
							float bossDistance = boss->GetDistance2dToCenter(bossTarget);
							if (bossDistance < 20.0f)
							{
								if (AngleInRange(basePos.o, boss->GetOrientation(), ANGLE_RANGE) || AngleInRange(basePos.o + M_PI, boss->GetOrientation(), ANGLE_RANGE))
								{
									float myBossDistance = boss->GetDistance2dToCenter(me);
									float myBossAngle = boss->GetAngle(me);
									if (myBossDistance < engageDistance - 1.0f || myBossDistance>engageDistance + 1.0f)
									{
										moving = true;
									}
									else if (!AngleInRange(myBossAngle, engageAngle, ANGLE_RANGE))
									{
										moving = true;
									}
								}
							}
						}
					}
				}
			}
			ObjectGuid activeOG = myGroup->GetOGByTargetIcon(myTargetIcon);
			if (!activeOG.IsEmpty())
			{
				if (activeOG == me->GetObjectGuid())
				{
					if (!me->IsAlive())
					{
						changing = true;
					}
					else if (me->GetNearbyCreatureWithEntry(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Dream_Fog, 3.0f))
					{
						changing = true;
					}
					else if (me->HasAura(24818))
					{
						changing = true;
					}
					else if (me->GetPower(Powers::POWER_MANA) < 500)
					{
						changing = true;
					}
					else
					{
						healing = true;
					}
				}
			}
			else
			{
				if (me->IsAlive())
				{
					healing = true;
				}
			}
			if (moving)
			{
				markPos = GetNearPoint(boss->GetPosition(), engageDistance, engageAngle);
				actionDelay = 3000;
				actionType = ActionType_Lethon::ActionType_Lethon_MarkMove;
				me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
				me->GetMotionMaster()->MovePoint(1, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(boss));
			}
			else if (healing)
			{
				uint32 myTankRole = GroupRole_Lethon::GroupRole_Lethon_None;
				if (me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer1 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer2 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer3)
				{
					myTankRole = GroupRole_Lethon::GroupRole_Lethon_Tank1;
				}
				else if (me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer4 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer5 || me->groupRole == GroupRole_Lethon::GroupRole_Lethon_Healer6)
				{
					myTankRole = GroupRole_Lethon::GroupRole_Lethon_Tank2;
				}
				if (Player* myTank = GetPlayerByGroupRole(myTankRole))
				{
					if (myTank->IsAlive())
					{
						if (myTank->GetHealthPercent() < 90.0f)
						{
							if (sb->Heal(myTank, true))
							{
								return true;
							}
						}
					}
					if (me->GetHealthPercent() < 50.0f)
					{
						if (sb->Heal(me, true))
						{
							return true;
						}
					}
				}
				else
				{
					for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
					{
						if (Player* member = groupRef->getSource())
						{
							if (member->IsAlive())
							{
								if (member->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank1 || member->groupRole == GroupRole_Lethon::GroupRole_Lethon_Tank2)
								{
									continue;
								}
								if (me->GetDistance2dToCenter(member) < HEAL_MAX_DISTANCE)
								{
									if (member->GetHealthPercent() < 50.0f)
									{
										if (sb->Heal(member, true))
										{
											return true;
										}
									}
								}
							}
						}
					}
				}
			}
			else if (assisting)
			{
				if (Player* activeTank = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(0)))
				{
					if (activeTank->IsAlive())
					{
						if (activeTank->GetHealthPercent() < 90.0f)
						{
							if (sb->SubHeal(activeTank))
							{
								return true;
							}
						}
					}
				}
				if (me->GetHealthPercent() < 50.0f)
				{
					if (sb->Heal(me, true))
					{
						return true;
					}
				}
			}
			else if (changing)
			{
				std::unordered_set<uint32> subRoleSet;
				switch (me->groupRole)
				{
				case GroupRole_Lethon::GroupRole_Lethon_Healer1:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer2);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer3);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer2:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer1);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer3);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer3:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer1);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer2);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer4:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer5);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer6);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer5:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer4);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer6);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer6:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer4);
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer5);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer7:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer8);
					break;
				}
				case GroupRole_Lethon::GroupRole_Lethon_Healer8:
				{
					subRoleSet.insert(GroupRole_Lethon::GroupRole_Lethon_Healer7);
					break;
				}
				default:
				{
					break;
				}
				}
				for (std::unordered_set<uint32>::iterator roleIT = subRoleSet.begin(); roleIT != subRoleSet.end(); roleIT++)
				{
					if (uint32 eachRole = *roleIT)
					{
						if (Player* eachHealer = GetPlayerByGroupRole(eachRole))
						{
							if (eachHealer->IsAlive())
							{
								if (!eachHealer->GetNearbyCreatureWithEntry(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Dream_Fog, 3.0f))
								{
									if (!eachHealer->HasAura(24818))
									{
										if (eachHealer->GetPower(Powers::POWER_MANA) > 500)
										{
											myGroup->SetTargetIcon(myTargetIcon, eachHealer->GetObjectGuid());
											break;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return true;
	}
	return Strategy_Group::Heal();
}
