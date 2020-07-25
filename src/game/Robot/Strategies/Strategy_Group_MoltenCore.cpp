#include "Strategy_Group_MoltenCore.h"
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

void Strategy_Group_MoltenCore::InitialStrategy()
{
	engageAngle = 0.0f;
	engageDistance = 0.0f;
	majordomoDPSDelay = 15000;
	Strategy_Group::InitialStrategy();
}

std::string Strategy_Group_MoltenCore::GetGroupRoleName()
{
	if (!me)
	{
		return "";
	}
	switch (me->groupRole)
	{
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
	{
		return "tank1";
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2:
	{
		return "tank2";
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Healer:
	{
		return "healer";
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range:
	{
		return "dpsr";
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee:
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

void Strategy_Group_MoltenCore::SetGroupRole(std::string pmRoleName)
{
	if (!me)
	{
		return;
	}
	else if (pmRoleName == "tank1")
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1;
	}
	else if (pmRoleName == "tank2")
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2;
	}
	else if (pmRoleName == "healer")
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_Healer;
	}
	else if (pmRoleName == "dpsm")
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee;
	}
	else if (pmRoleName == "dpsr")
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range;
	}
	else
	{
		me->groupRole = GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range;
	}
}

bool Strategy_Group_MoltenCore::Stay(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee && me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Healer)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1 && me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
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

bool Strategy_Group_MoltenCore::Hold(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee && me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Healer)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1 && me->groupRole != GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
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

bool Strategy_Group_MoltenCore::Engage(Unit* pmTarget)
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
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
	{
		return sb->Tank(pmTarget, Chasing());
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2:
	{
		return Tank();
	}
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Healer:
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

void Strategy_Group_MoltenCore::Update(uint32 pmDiff)
{
	Strategy_Base::Update(pmDiff);
	if (!Update0(pmDiff))
	{
		return;
	}
	if (me->IsAlive())
	{
		if (me->HasAura(19659))
		{
			if (!me->HasAura(11359))
			{
				if (!me->HasItemCount(9030, 1))
				{
					me->StoreNewItemInBestSlots(9030, 20);
				}
				if (Item* pPotion = sb->GetItemInInventory(9030))
				{
					sb->UseItem(pPotion, me);
				}
			}
		}
	}
	if (Group* myGroup = me->GetGroup())
	{
		if (actionDelay > 0)
		{
			actionDelay -= pmDiff;
			switch (actionType)
			{
			case ActionType_MoltenCore::ActionType_MoltenCore_MarkMove:
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
			restDelay = 0;
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2:
			{
				if (Tank())
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Healer:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
			{
				if (Tank())
				{
					return;
				}
				break;
			}
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2:
			{
				if (Tank())
				{
					return;
				}
				break;
			}
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Healer:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range:
			{
				if (DPS())
				{
					return;
				}
				break;
			}
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee:
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
			if (restDelay > 0)
			{
				restDelay -= pmDiff;
				return;
			}
			switch (me->groupRole)
			{

			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_Healer:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Range:
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
			case GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee:
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

bool Strategy_Group_MoltenCore::DPS()
{
	if (!me->IsAlive())
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		if (Unit* magmadar = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Magmadar))
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_DPS_Melee)
			{
				if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
				{
					markPos = GetNearPoint(magmadar->GetPosition(), 10.0f, magmadar->GetAngle(activeHealer));
					if (me->GetDistance2d(markPos) > 1.0f)
					{
						actionDelay = 3000;
						actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
						me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
						me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(magmadar));
						return true;
					}
					if (sb->DPS(magmadar, false))
					{
						return true;
					}
				}
			}
			else
			{
				if (magmadar->HasAura(19451))
				{
					if (me->GetClass() == Classes::CLASS_HUNTER)
					{
						if (sb->CastSpell(magmadar, "Tranquilizing Shot", RANGED_MAX_DISTANCE))
						{
							return true;
						}
					}
				}
			}
		}
		if (myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Firesworn).size() > 0)
		{
			if (combatTime > dpsDelay)
			{
				if (Player* mainTank = GetMainTank())
				{
					return sb->DPS(mainTank->GetSelectedUnit(), true);
				}
			}
		}
		if (Unit* geddon = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Baron_Geddon))
		{
			if (geddon->HasAura(19695))
			{
				if (me->GetDistance2dToCenter(geddon) < 30.0f)
				{
					if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(activeHealer));
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(activeHealer));
					}
					else
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(me));
					}
					actionDelay = 3000;
					actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(geddon));
				}
				return true;
			}
			if (combatTime > dpsDelay)
			{
				return sb->DPS(geddon, true);
			}
		}
		if (Unit* golemagg = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Golemagg_the_Incinerator))
		{
			if (combatTime > dpsDelay)
			{
				return sb->DPS(golemagg, true);
			}
		}
		if (myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Elite).size() > 0)
		{
			if (combatTime > majordomoDPSDelay)
			{
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						return sb->DPS(activeTarget);
					}
				}
			}
			else
			{
				return false;
			}
		}
		if (myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Healer).size() > 0)
		{
			if (combatTime > majordomoDPSDelay)
			{
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						return sb->DPS(activeTarget, true);
					}
				}
			}
			else
			{
				return true;
			}
		}
		std::unordered_map<ObjectGuid, Unit*> ragAddsMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros_Adds);
		if (ragAddsMap.size() > 0)
		{
			if (Player* tank2 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2))
			{
				if (tank2->IsAlive())
				{
					return sb->DPS(tank2->GetSelectedUnit(), false);
				}
			}
		}
		if (Unit* rag = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros))
		{
			if (combatTime > dpsDelay)
			{
				float markDistance = me->GetDistance2d(markPos);
				if (markDistance > 1.0f)
				{
					actionDelay = 3000;
					actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(rag));
					return true;
				}
				return sb->DPS(rag, false);
			}
			return true;
		}
	}

	return Strategy_Group::DPS();
}

bool Strategy_Group_MoltenCore::Tank()
{
	if (Group* myGroup = me->GetGroup())
	{
		if (Unit* magmadar = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Magmadar))
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
				{
					markPos = GetNearPoint(magmadar->GetPosition(), 10.0f, activeHealer->GetAngle(magmadar));
					if (me->GetDistance2d(markPos) > 1.0f)
					{
						actionDelay = 3000;
						actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
						me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
						me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(magmadar));
						return true;
					}
					if (sb->Tank(magmadar, false))
					{
						return true;
					}
				}
			}
			else
			{
				if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
				{
					markPos = GetNearPoint(magmadar->GetPosition(), 15.0f, magmadar->GetAngle(activeHealer));
					if (me->GetDistance2d(markPos) > 1.0f)
					{
						actionDelay = 3000;
						actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
						me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
						me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(magmadar));
						return true;
					}
					if (sb->DPS(magmadar, false))
					{
						return true;
					}
				}
			}
		}
		std::unordered_map<ObjectGuid, Unit*> fireswornMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Firesworn);
		if (fireswornMap.size() > 0)
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				if (Unit* myTarget = me->GetSelectedUnit())
				{
					if (myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Firesworn || myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Garr)
					{
						if (myTarget->GetTargetGuid() != me->GetObjectGuid())
						{
							return sb->Tank(myTarget, true);
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = myGroup->groupAttackersMap.begin(); eIT != myGroup->groupAttackersMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						if (eachAdd->GetTargetGuid() != me->GetObjectGuid())
						{
							return sb->Tank(eachAdd, true);
						}
					}
				}
				if (Unit* myTarget = me->GetSelectedUnit())
				{
					if (myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Firesworn || myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Garr)
					{
						return sb->Tank(myTarget, true);
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = myGroup->groupAttackersMap.begin(); eIT != myGroup->groupAttackersMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						return sb->Tank(eachAdd, true);
					}
				}
			}
			else
			{
				if (combatTime > dpsDelay)
				{
					if (Player* mainTank = GetMainTank())
					{
						return sb->DPS(mainTank->GetSelectedUnit());
					}
				}
			}
		}
		if (Unit* geddon = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Baron_Geddon))
		{
			if (geddon->HasAura(19695))
			{
				if (me->GetDistance2dToCenter(geddon) < 30.0f)
				{
					if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(activeHealer));
					}
					else
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(me));
					}
					actionDelay = 3000;
					actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(geddon));
				}
				return true;
			}
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				return sb->Tank(geddon, true);
			}
			else
			{
				if (combatTime > dpsDelay)
				{
					return sb->DPS(geddon);
				}
			}
		}
		if (Unit* golemagg = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Golemagg_the_Incinerator))
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				return sb->Tank(golemagg, true, true);
			}
			else if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
			{
				std::unordered_map<ObjectGuid, Unit*> houndMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Core_Rager);
				if (houndMap.size() > 0)
				{
					for (std::unordered_map<ObjectGuid, Unit*>::iterator hIT = houndMap.begin(); hIT != houndMap.end(); hIT++)
					{
						if (Unit* eachHound = hIT->second)
						{
							if (eachHound->GetTargetGuid() != me->GetObjectGuid())
							{
								return sb->Tank(eachHound, true, true);
							}
						}
					}
					if (me->GetDistance2dToCenter(golemagg) < 30.0f)
					{
						if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
						{
							markPos = GetNearPoint(golemagg->GetPosition(), 40.0f, golemagg->GetAngle(activeHealer) + M_PI / 2);
						}
						else
						{
							markPos = GetNearPoint(golemagg->GetPosition(), 40.0f, golemagg->GetAngle(me) + M_PI / 2);
						}
						actionDelay = 3000;
						actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
						me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
						me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
						me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(golemagg));
						return true;
					}
					if (Creature* myHound = me->GetMap()->GetCreature(me->GetTargetGuid()))
					{
						if (myHound->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Core_Rager)
						{
							return sb->Tank(myHound, true, true);
						}
					}
					for (std::unordered_map<ObjectGuid, Unit*>::iterator hIT = houndMap.begin(); hIT != houndMap.end(); hIT++)
					{
						if (Unit* eachHound = hIT->second)
						{
							return sb->Tank(eachHound, true, true);
						}
					}
				}
			}
		}
		std::unordered_map<ObjectGuid, Unit*> eliteMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Elite);
		if (eliteMap.size() > 0)
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						if (activeTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Elite)
						{
							if (activeTarget->GetTargetGuid() != me->GetObjectGuid())
							{
								if (sb->Tank(activeTarget, true, true))
								{
									return true;
								}
							}
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = eliteMap.begin(); eIT != eliteMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						if (eachAdd->GetTargetGuid() != me->GetObjectGuid())
						{
							myGroup->SetTargetIcon(7, eachAdd->GetObjectGuid());
							if (sb->Tank(eachAdd, true, true))
							{
								return true;
							}
						}
					}
				}
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						if (activeTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Elite)
						{
							if (sb->Tank(activeTarget, true, true))
							{
								return true;
							}
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = eliteMap.begin(); eIT != eliteMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						myGroup->SetTargetIcon(7, eachAdd->GetObjectGuid());
						if (sb->Tank(eachAdd, true, true))
						{
							return true;
						}
					}
				}
			}
		}
		std::unordered_map<ObjectGuid, Unit*> healerMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Healer);
		if (healerMap.size() > 0)
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						if (activeTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Healer)
						{
							if (activeTarget->GetTargetGuid() != me->GetObjectGuid())
							{
								if (sb->Tank(activeTarget, true, true))
								{
									return true;
								}
							}
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = healerMap.begin(); eIT != healerMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						if (eachAdd->GetTargetGuid() != me->GetObjectGuid())
						{
							myGroup->SetTargetIcon(7, eachAdd->GetObjectGuid());
							if (sb->Tank(eachAdd, true, true))
							{
								return true;
							}
						}
					}
				}
				if (Unit* activeTarget = me->GetMap()->GetCreature(myGroup->GetOGByTargetIcon(7)))
				{
					if (activeTarget->IsAlive())
					{
						if (activeTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Flamewaker_Healer)
						{
							if (sb->Tank(activeTarget, true, true))
							{
								return true;
							}
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator eIT = healerMap.begin(); eIT != healerMap.end(); eIT++)
				{
					if (Unit* eachAdd = eIT->second)
					{
						myGroup->SetTargetIcon(7, eachAdd->GetObjectGuid());
						if (sb->Tank(eachAdd, true, true))
						{
							return true;
						}
					}
				}
			}
		}
		if (Unit* majordomo = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Majordomo_Executus))
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
			{
				if (majordomo->GetTargetGuid() == me->GetObjectGuid())
				{
					float majordomoDistance = me->GetDistance2dToCenter(majordomo);
					if (majordomoDistance < 10.0f)
					{
						if (Player* tank1 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1))
						{
							if (tank1->IsAlive())
							{
								if (me->GetDistance2dToCenter(tank1) < 50.0f)
								{
									if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
									{
										markPos = GetNearPoint(tank1->GetPosition(), 60.0f, tank1->GetAngle(activeHealer));
									}
									else
									{
										markPos = GetNearPoint(tank1->GetPosition(), 60.0f, tank1->GetAngle(me));
									}
									actionDelay = 3000;
									actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
									me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
									me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
									me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
									me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
									me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(majordomo));
									return true;
								}
							}
						}
					}
				}
				return sb->Tank(majordomo, true, true);
			}
		}
		std::unordered_map<ObjectGuid, Unit*> ragAddsMap = myGroup->GetGroupAttackers(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros_Adds);
		if (ragAddsMap.size() > 0)
		{
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				return true;
			}
			else if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
			{
				if (Unit* myTarget = me->GetSelectedUnit())
				{
					if (myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros_Adds)
					{
						if (myTarget->GetTargetGuid() != me->GetObjectGuid())
						{
							return sb->Tank(myTarget, true);
						}
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator addsIT = ragAddsMap.begin(); addsIT != ragAddsMap.end(); addsIT++)
				{
					if (Unit* eachAdd = addsIT->second)
					{
						if (eachAdd->GetTargetGuid() != me->GetObjectGuid())
						{
							return sb->Tank(eachAdd, true);
						}
					}
				}
				if (Unit* myTarget = me->GetSelectedUnit())
				{
					if (myTarget->GetEntry() == CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros_Adds)
					{
						return sb->Tank(myTarget, true);
					}
				}
				for (std::unordered_map<ObjectGuid, Unit*>::iterator addsIT = ragAddsMap.begin(); addsIT != ragAddsMap.end(); addsIT++)
				{
					if (Unit* eachAdd = addsIT->second)
					{
						return sb->Tank(eachAdd, true);
					}
				}
			}
		}
		if (Unit* rag = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros))
		{
			float markDistance = me->GetDistance2d(markPos);
			if (markDistance > 1.0f)
			{
				actionDelay = 3000;
				actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
				me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
				me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(rag));
				return true;
			}
			if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
			{
				return sb->Tank(rag, false);
			}
			else if (me->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2)
			{
				return true;
			}
		}
	}
	return Strategy_Group::Tank();
}

bool Strategy_Group_MoltenCore::Tank(Unit* pmTarget)
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
	case GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1:
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

bool Strategy_Group_MoltenCore::Heal()
{
	if (Group* myGroup = me->GetGroup())
	{
		int myTargetIcon = myGroup->GetTargetIconByOG(me->GetGUID());
		if (Unit* magmadar = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Magmadar))
		{
			if (Player* tank1 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1))
			{
				if (tank1->IsAlive())
				{
					if (me->GetClass() == Classes::CLASS_PRIEST)
					{
						if (sb->CastSpell(tank1, "Fear Ward", 35.0f, true))
						{
							return true;
						}
					}
				}
			}
		}
		if (Unit* geddon = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Baron_Geddon))
		{
			if (geddon->HasAura(19695))
			{
				if (me->GetDistance2dToCenter(geddon) < 30.0f)
				{
					if (Player* activeHealer = ObjectAccessor::FindPlayer(myGroup->GetOGByTargetIcon(6)))
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(activeHealer));
					}
					else
					{
						markPos = GetNearPoint(geddon->GetPosition(), 32.0f, geddon->GetAngle(me));
					}
					actionDelay = 3000;
					actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
					me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
					me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
					me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(geddon));
					return true;
				}
			}
		}
		if (Unit* majordomo = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Majordomo_Executus))
		{
			ObjectGuid tank2HealerOG = myGroup->GetOGByTargetIcon(5);
			if (tank2HealerOG.IsEmpty())
			{
				if (myTargetIcon == -1)
				{
					if (me->IsAlive())
					{
						if (me->GetPower(Powers::POWER_MANA) > 1000)
						{
							myGroup->SetTargetIcon(5, me->GetObjectGuid());
						}
					}
				}
			}
			tank2HealerOG = myGroup->GetOGByTargetIcon(5);
			if (tank2HealerOG == me->GetObjectGuid())
			{
				if (me->GetPower(Powers::POWER_MANA) < 500)
				{
					myGroup->SetTargetIcon(5, ObjectGuid());
					return false;
				}
				if (Player* tank2 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2))
				{
					if (tank2->IsAlive())
					{
						if (tank2->GetHealthPercent() < 90.0f)
						{
							if (sb->Heal(tank2, cure))
							{
								return true;
							}
						}
					}
				}
			}
			else if (myTargetIcon == -1)
			{
				if (Player* tank2 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2))
				{
					if (tank2->IsAlive())
					{
						if (tank2->GetHealthPercent() < 90.0f)
						{
							if (sb->SubHeal(tank2))
							{
								return true;
							}
						}
					}
				}
			}
		}
		if (Unit* rag = myGroup->GetGroupAttacker(CreatureEntry_RobotStrategy::CreatureEntry_Strategy_Ragnaros))
		{
			float markDistance = me->GetDistance2d(markPos);
			if (markDistance > 1.0f)
			{
				actionDelay = 3000;
				actionType = ActionType_MoltenCore::ActionType_MoltenCore_MarkMove;
				me->InterruptSpell(CurrentSpellTypes::CURRENT_AUTOREPEAT_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_CHANNELED_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_GENERIC_SPELL);
				me->InterruptSpell(CurrentSpellTypes::CURRENT_MELEE_SPELL);
				me->GetMotionMaster()->MovePoint(0, markPos.x, markPos.y, markPos.z, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(rag));
				return true;
			}
		}

		ObjectGuid activeHealerOG = myGroup->GetOGByTargetIcon(6);
		if (activeHealerOG.IsEmpty())
		{
			if (me->IsAlive())
			{
				if (me->GetPower(Powers::POWER_MANA) > 1000)
				{
					if (myTargetIcon == -1)
					{
						myGroup->SetTargetIcon(6, me->GetObjectGuid());
					}
				}
			}
		}
		activeHealerOG = myGroup->GetOGByTargetIcon(6);
		if (activeHealerOG == me->GetObjectGuid())
		{
			if (me->GetPower(Powers::POWER_MANA) < 500)
			{
				myGroup->SetTargetIcon(6, ObjectGuid());
				return false;
			}
			if (Player* mainTank = GetMainTank())
			{
				if (mainTank->GetHealthPercent() < 90.0f)
				{
					if (sb->Heal(mainTank, cure))
					{
						return true;
					}
				}
			}
		}
		else
		{
			if (Player* mainTank = GetMainTank())
			{
				if (mainTank->GetHealthPercent() < 90.0f)
				{
					if (sb->SubHeal(mainTank))
					{
						return true;
					}
				}
			}
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (member->IsAlive())
					{
						if (member->groupRole == GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1)
						{
							continue;
						}
						if (member->GetHealthPercent() < 40.0f)
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

	return false;
}

Player* Strategy_Group_MoltenCore::GetMainTank()
{
	if (Player* tank1 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank1))
	{
		if (tank1->IsAlive())
		{
			return tank1;
		}
	}
	if (Player* tank2 = GetPlayerByGroupRole(GroupRole_MoltenCore::GroupRole_MoltenCore_Tank2))
	{
		if (tank2->IsAlive())
		{
			return tank2;
		}
	}

	return NULL;
}
