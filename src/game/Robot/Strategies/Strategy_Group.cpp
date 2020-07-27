#include "Strategy_Group.h"
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

void Strategy_Group::Reset()
{
	engageDelay = 0;
	combatTime = 0;
	teleportAssembleDelay = 0;
	eatDelay = 0;
	drinkDelay = 0;
	readyCheckDelay = 0;
	staying = false;
	holding = false;
	following = true;
	cure = true;
	moveDelay = 0;
	actionType = 0;
	actionDelay = 0;
	dpsDelay = sRobotConfig.DPSDelay;
	followDistance = FOLLOW_NORMAL_DISTANCE;
	switch (me->GetClass())
	{
	case Classes::CLASS_WARRIOR:
	{
		followDistance = MELEE_MIN_DISTANCE;
		break;
	}
	case Classes::CLASS_HUNTER:
	{
		break;
	}
	case Classes::CLASS_SHAMAN:
	{
		break;
	}
	case Classes::CLASS_PALADIN:
	{
		followDistance = MELEE_MIN_DISTANCE;
		break;
	}
	case Classes::CLASS_WARLOCK:
	{
		break;
	}
	case Classes::CLASS_PRIEST:
	{
		break;
	}
	case Classes::CLASS_ROGUE:
	{
		followDistance = MELEE_MIN_DISTANCE;
		break;
	}
	case Classes::CLASS_MAGE:
	{
		break;
	}
	case Classes::CLASS_DRUID:
	{
		followDistance = MELEE_MIN_DISTANCE;
		break;
	}
	default:
	{
		break;
	}
	}
}

void Strategy_Group::InitialStrategy()
{
	combatTime = 0;
	teleportAssembleDelay = 0;
	eatDelay = 0;
	drinkDelay = 0;
	readyCheckDelay = 0;
	dpsDelay = sRobotConfig.DPSDelay;
	staying = false;
	holding = false;
	following = true;
	cure = true;
	moveDelay = 0;
	actionType = 0;
	actionDelay = 0;
	assistDelay = 0;
	followDistance = FOLLOW_NORMAL_DISTANCE;
	if (me)
	{
		switch (me->GetClass())
		{
		case Classes::CLASS_WARRIOR:
		{
			followDistance = MELEE_MIN_DISTANCE;
			break;
		}
		case Classes::CLASS_HUNTER:
		{
			break;
		}
		case Classes::CLASS_SHAMAN:
		{
			break;
		}
		case Classes::CLASS_PALADIN:
		{
			followDistance = MELEE_MIN_DISTANCE;
			break;
		}
		case Classes::CLASS_WARLOCK:
		{
			break;
		}
		case Classes::CLASS_PRIEST:
		{
			followDistance = MID_RANGE;
			break;
		}
		case Classes::CLASS_ROGUE:
		{
			followDistance = MELEE_MIN_DISTANCE;
			break;
		}
		case Classes::CLASS_MAGE:
		{
			break;
		}
		case Classes::CLASS_DRUID:
		{
			followDistance = MELEE_MIN_DISTANCE;
			break;
		}
		default:
		{
			break;
		}
		}
	}
}

bool Strategy_Group::Chasing()
{
	if (holding)
	{
		return false;
	}
	return true;
}

bool Strategy_Group::Update0(uint32 pmDiff)
{
	if (!me)
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		if (!me->GetSession()->isRobotSession)
		{
			return false;
		}
		if (Player* leaderPlayer = ObjectAccessor::FindPlayer(myGroup->GetLeaderGuid()))
		{
			if (WorldSession* leaderWS = leaderPlayer->GetSession())
			{
				if (leaderWS->isRobotSession)
				{
					me->RemoveFromGroup();
					sb->Reset();
					return false;
				}
			}
		}
		if (readyCheckDelay > 0)
		{
			readyCheckDelay -= pmDiff;
			if (readyCheckDelay <= 0)
			{
				if (Group* myGroup = me->GetGroup())
				{
					if (Player* leaderPlayer = ObjectAccessor::FindPlayer(myGroup->GetLeaderGuid()))
					{
						if (WorldSession* leaderWS = leaderPlayer->GetSession())
						{
							if (!leaderWS->isRobotSession)
							{
								uint8 readyCheckValue = 0;
								if (!me->IsAlive())
								{
									readyCheckValue = 0;
								}
								else if (me->GetDistance(leaderPlayer) > VISIBILITY_DISTANCE_NORMAL)
								{
									readyCheckValue = 0;
								}
								else
								{
									readyCheckValue = 1;
								}
								WorldPacket data(MSG_RAID_READY_CHECK, 8);
								data << readyCheckValue;
								if (WorldSession* myWS = me->GetSession())
								{
									myWS->HandleRaidReadyCheckOpcode(data);
								}
							}
						}
					}
				}
			}
		}
		if (moveDelay > 0)
		{
			moveDelay -= pmDiff;
			return false;
		}
		if (teleportAssembleDelay > 0)
		{
			teleportAssembleDelay -= pmDiff;
			if (teleportAssembleDelay <= 0)
			{
				if (Player* leaderPlayer = ObjectAccessor::FindPlayer(myGroup->GetLeaderGuid()))
				{
					bool canTeleport = true;
					if (Group* myGroup = me->GetGroup())
					{
						for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
						{
							if (Player* member = groupRef->getSource())
							{
								if (member->IsBeingTeleported())
								{
									teleportAssembleDelay = 100;
									canTeleport = false;
									break;
								}
							}
						}
					}
					if (canTeleport)
					{
						if (!me->IsAlive())
						{
							me->ResurrectPlayer(0.2f);
							me->SpawnCorpseBones();
						}
						me->GetThreatManager().clearReferences();
						me->ClearInCombat();
						sb->ClearTarget();
						if (leaderPlayer->GetMapId() != me->GetMapId())
						{
							canTeleport = false;
							if (Map* leaderMap = leaderPlayer->GetMap())
							{
								if (leaderMap->CanEnter(me))
								{
									canTeleport = true;
								}
							}
						}
						if (canTeleport)
						{
							me->TeleportTo(leaderPlayer->GetMapId(), leaderPlayer->GetPositionX(), leaderPlayer->GetPositionY(), leaderPlayer->GetPositionZ(), leaderPlayer->GetOrientation());
							sRobotManager->WhisperTo(me, "I have come", Language::LANG_UNIVERSAL, leaderPlayer);
							return false;
						}
						else
						{
							sRobotManager->WhisperTo(me, "I can not come to you", Language::LANG_UNIVERSAL, leaderPlayer);
						}
					}
				}
			}
		}
		if (staying)
		{
			return false;
		}
	}

	return true;
}

void Strategy_Group::Update(uint32 pmDiff)
{
	Strategy_Base::Update(pmDiff);
	if (!Update0(pmDiff))
	{
		return;
	}
	if (Group* myGroup = me->GetGroup())
	{
		bool groupInCombat = GroupInCombat();
		if (groupInCombat)
		{
			eatDelay = 0;
			drinkDelay = 0;
			combatTime += pmDiff;
		}
		else
		{
			combatTime = 0;
		}
		if (engageDelay > 0)
		{
			engageDelay -= pmDiff;
			if (me->IsAlive())
			{
				switch (me->groupRole)
				{
				case GroupRole::GroupRole_DPS:
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
				case GroupRole::GroupRole_Healer:
				{
					if (Heal())
					{
						return;
					}
					break;
				}
				case GroupRole::GroupRole_Tank:
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
				default:
				{
					break;
				}
				}
			}
			return;
		}
		if (assistDelay > 0)
		{
			assistDelay -= pmDiff;
			if (sb->Assist())
			{
				return;
			}
			else
			{
				assistDelay = 0;
			}
		}
		if (groupInCombat)
		{
			if (sb->Assist())
			{
				return;
			}
			switch (me->groupRole)
			{
			case GroupRole::GroupRole_DPS:
			{
				if (DPS())
				{
					return;
				}
				break;
			}
			case GroupRole::GroupRole_Healer:
			{
				if (Heal())
				{
					return;
				}
				break;
			}
			case GroupRole::GroupRole_Tank:
			{
				if (Tank())
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
				if (drinkDelay > 0)
				{
					drinkDelay -= pmDiff;
					if (drinkDelay <= 0)
					{
						sb->Drink();
					}
				}
				return;
			}
			switch (me->groupRole)
			{
			case GroupRole::GroupRole_DPS:
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
			case GroupRole::GroupRole_Healer:
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
			case GroupRole::GroupRole_Tank:
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

bool Strategy_Group::GroupInCombat()
{
	if (!me)
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
		{
			if (Player* member = groupRef->getSource())
			{
				if (member->IsInCombat())
				{
					if (me->GetDistance(member) < ATTACK_RANGE_LIMIT)
					{
						return true;
					}
				}
				else if (Pet* memberPet = member->GetPet())
				{
					if (memberPet->IsAlive())
					{
						if (memberPet->IsInCombat())
						{
							if (me->GetDistance(memberPet) < ATTACK_RANGE_LIMIT)
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

Player* Strategy_Group::GetPlayerByGroupRole(uint32 pmGroupRole)
{
	if (!me)
	{
		return NULL;
	}
	if (Group* myGroup = me->GetGroup())
	{
		for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
		{
			if (Player* member = groupRef->getSource())
			{
				if (member->groupRole == pmGroupRole)
				{
					return member;
				}
			}
		}
	}

	return NULL;
}

std::unordered_set<Player*> Strategy_Group::GetPlayerSetByGroupRoleSet(std::unordered_set<uint32> pmGroupRoleSet)
{
	std::unordered_set<Player*> resultSet;
	resultSet.clear();

	if (me)
	{
		if (Group* myGroup = me->GetGroup())
		{
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (pmGroupRoleSet.find(member->groupRole) != pmGroupRoleSet.end())
					{
						resultSet.insert(member);
					}
				}
			}
		}
	}

	return resultSet;
}

std::unordered_set<ObjectGuid> Strategy_Group::GetPlayerGUIDSetByGroupRoleSet(std::unordered_set<uint32> pmGroupRoleSet)
{
	std::unordered_set<ObjectGuid> resultSet;
	resultSet.clear();

	if (me)
	{
		if (Group* myGroup = me->GetGroup())
		{
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (pmGroupRoleSet.find(member->groupRole) != pmGroupRoleSet.end())
					{
						resultSet.insert(member->GetGUID());
					}
				}
			}
		}
	}

	return resultSet;
}

bool Strategy_Group::Engage(Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	switch (me->groupRole)
	{
	case GroupRole::GroupRole_Tank:
	{
		return sb->Tank(pmTarget, Chasing());
	}
	case GroupRole::GroupRole_DPS:
	{
		return sb->DPS(pmTarget, Chasing());
	}
	case GroupRole::GroupRole_Healer:
	{
		return Heal();
	}
	default:
	{
		break;
	}
	}

	return false;
}

bool Strategy_Group::DPS()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	if (combatTime > dpsDelay)
	{
		if (Group* myGroup = me->GetGroup())
		{
			Player* tank = NULL;
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (member->IsAlive())
					{
						if (member->groupRole == GroupRole::GroupRole_Tank)
						{
							if (me->GetDistance(member) < ATTACK_RANGE_LIMIT)
							{
								tank = member;
								break;
							}
						}
					}
				}
			}
			if (tank)
			{
				if (Unit* rtiUnit = ObjectAccessor::GetUnit(*me, myGroup->GetOGByTargetIcon(7)))
				{
					if (rtiUnit->IsAlive())
					{
						if (sRobotManager->TankThreatOK(tank, rtiUnit))
						{
							if (sb->DPS(rtiUnit, Chasing()))
							{
								return true;
							}
						}
					}
				}
			}
			else
			{
				if (Unit* myTarget = me->GetSelectedUnit())
				{
					if (!sRobotManager->HasAura(myTarget, "Polymorph"))
					{
						if (sb->DPS(myTarget, Chasing()))
						{
							return true;
						}
					}
				}
				Unit* lowestAttacker = NULL;
				uint32 lowestHP = 0;
				for (std::unordered_map<ObjectGuid, Unit*>::iterator gaIT = myGroup->groupAttackersMap.begin(); gaIT != myGroup->groupAttackersMap.end(); gaIT++)
				{
					if (Unit* eachAttacker = gaIT->second)
					{
						if (me->GetDistance(eachAttacker) < INTERACTION_DISTANCE)
						{
							if (!sRobotManager->HasAura(eachAttacker, "Polymorph"))
							{
								uint32 eachHealth = eachAttacker->GetHealth();
								if (!lowestAttacker)
								{
									lowestAttacker = eachAttacker;
									lowestHP = eachHealth;
								}
								else
								{
									if (eachHealth < lowestHP)
									{
										lowestAttacker = eachAttacker;
										lowestHP = eachHealth;
									}
								}
							}
						}
					}
				}
				if (sb->DPS(lowestAttacker, Chasing()))
				{
					return true;
				}
			}
		}
	}

	return false;
}

bool Strategy_Group::Tank()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		// 1 check ot 
		if (Unit* rtiUnit = ObjectAccessor::GetUnit(*me, myGroup->GetOGByTargetIcon(7)))
		{
			if (rtiUnit->IsAlive())
			{
				if (rtiUnit->GetTargetGuid() != me->GetObjectGuid())
				{
					if (sb->Tank(rtiUnit, Chasing()))
					{
						sb->Taunt(rtiUnit);
						return true;
					}
				}
			}
		}
		for (std::unordered_map<ObjectGuid, Unit*>::iterator gaIT = myGroup->groupAttackersMap.begin(); gaIT != myGroup->groupAttackersMap.end(); gaIT++)
		{
			if (Unit* eachAttacker = gaIT->second)
			{
				if (eachAttacker->GetTargetGuid() != me->GetObjectGuid())
				{
					if (!sRobotManager->HasAura(eachAttacker, "Polymorph"))
					{
						if (sb->Tank(eachAttacker, Chasing()))
						{
							sb->Taunt(eachAttacker);
							myGroup->SetTargetIcon(7, eachAttacker->GetObjectGuid());
							return true;
						}
					}
				}
			}
		}
		// 2 check threat
		if (Unit* rtiUnit = ObjectAccessor::GetUnit(*me, myGroup->GetOGByTargetIcon(7)))
		{
			if (rtiUnit->IsAlive())
			{
				if (!sRobotManager->TankThreatOK(me, rtiUnit))
				{
					if (sb->Tank(rtiUnit, Chasing()))
					{
						return true;
					}
				}
			}
		}
		for (std::unordered_map<ObjectGuid, Unit*>::iterator gaIT = myGroup->groupAttackersMap.begin(); gaIT != myGroup->groupAttackersMap.end(); gaIT++)
		{
			if (Unit* eachAttacker = gaIT->second)
			{
				if (!sRobotManager->HasAura(eachAttacker, "Polymorph"))
				{
					if (!sRobotManager->TankThreatOK(me, eachAttacker))
					{
						if (sb->Tank(eachAttacker, Chasing()))
						{
							myGroup->SetTargetIcon(7, eachAttacker->GetObjectGuid());
							return true;
						}
					}
				}
			}
		}
		// 3 check lowest 
		ObjectGuid rtiOG = ObjectGuid();
		uint32 rtiHP = 0;
		ObjectGuid lowestOG = ObjectGuid();
		uint32 lowestHP = 0;
		if (Unit* rtiUnit = ObjectAccessor::GetUnit(*me, myGroup->GetOGByTargetIcon(7)))
		{
			if (rtiUnit->IsAlive())
			{
				rtiOG = rtiUnit->GetObjectGuid();
				rtiHP = rtiUnit->GetHealth();
			}
		}
		for (std::unordered_map<ObjectGuid, Unit*>::iterator gaIT = myGroup->groupAttackersMap.begin(); gaIT != myGroup->groupAttackersMap.end(); gaIT++)
		{
			if (Unit* eachAttacker = gaIT->second)
			{
				if (me->GetDistance(eachAttacker) < INTERACTION_DISTANCE)
				{
					if (!sRobotManager->HasAura(eachAttacker, "Polymorph"))
					{
						ObjectGuid eachOG = eachAttacker->GetObjectGuid();
						uint32 eachHealth = eachAttacker->GetHealth();
						if (lowestOG.IsEmpty())
						{
							lowestOG = eachOG;
							lowestHP = eachHealth;
						}
						else
						{
							if (eachHealth < lowestHP)
							{
								lowestHP = eachHealth;
								lowestOG = eachOG;
							}
						}
					}
				}
			}
		}
		if (!lowestOG.IsEmpty())
		{
			if (rtiOG.IsEmpty())
			{
				myGroup->SetTargetIcon(7, lowestOG);
			}
			else if (lowestHP < rtiHP)
			{
				myGroup->SetTargetIcon(7, lowestOG);
			}
		}
		// 4 attack X target 
		if (Unit* rtiUnit = ObjectAccessor::GetUnit(*me, myGroup->GetOGByTargetIcon(7)))
		{
			if (rtiUnit->IsAlive())
			{
				if (sb->Tank(rtiUnit, Chasing()))
				{
					return true;
				}
			}
		}
	}

	return false;
}

bool Strategy_Group::Tank(Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	switch (me->groupRole)
	{
	case GroupRole::GroupRole_Tank:
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

bool Strategy_Group::Rest()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	bool canTry = false;
	if (me->GetHealthPercent() < 40.0f)
	{
		canTry = true;
	}
	if (me->GetPowerType() == Powers::POWER_MANA)
	{
		if (me->GetPower(Powers::POWER_MANA) * 100 / me->GetMaxPower(Powers::POWER_MANA) < 40.0f)
		{
			canTry = true;
		}
	}
	if (canTry)
	{
		if (sb->Eat())
		{
			eatDelay = DEFAULT_REST_DELAY;
			drinkDelay = 1000;
			return true;
		}
	}

	return false;
}

bool Strategy_Group::Heal()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		int lowMemberCount = 0;
		uint8 mySubGroup = me->GetSubGroup();
		Player* mainTank = NULL;
		for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
		{
			if (Player* member = groupRef->getSource())
			{
				if (member->IsAlive())
				{
					if (member->groupRole == GroupRole::GroupRole_Tank)
					{
						mainTank = member;
					}
					if (member->GetSubGroup() == mySubGroup)
					{
						if (member->GetHealthPercent() < 60.0f)
						{
							if (me->GetDistance(member) < RANGED_FAR_DISTANCE)
							{
								lowMemberCount++;
							}
						}
					}
				}
			}
		}
		if (lowMemberCount > 2)
		{
			if (sb->GroupHeal())
			{
				return true;
			}
		}
		if (mainTank)
		{
			if (mainTank->GetHealthPercent() < 90.0f)
			{
				if (sb->Heal(mainTank, cure))
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
					if (member->GetHealthPercent() < 50.0f)
					{
						if (sb->Heal(member, cure))
						{
							return true;
						}
					}
				}
			}
		}
	}

	return false;
}

bool Strategy_Group::Buff()
{
	if (!me)
	{
		return false;
	}
	if (!me->IsAlive())
	{
		return false;
	}
	if (Group* myGroup = me->GetGroup())
	{
		for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
		{
			if (Player* member = groupRef->getSource())
			{
				if (sb->Buff(member, cure))
				{
					return true;
				}
			}
		}
	}

	return false;
}

bool Strategy_Group::Follow()
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
		if (me->groupRole != GroupRole::GroupRole_Tank)
		{
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (member->IsAlive())
					{
						if (member->groupRole == GroupRole::GroupRole_Tank)
						{
							if (sb->Follow(member, followDistance))
							{
								return true;
							}
						}
					}
				}
			}
		}
		if (Player* leader = ObjectAccessor::FindPlayer(myGroup->GetLeaderGuid()))
		{
			if (sb->Follow(leader, followDistance))
			{
				return true;
			}
		}
	}

	return false;
}

bool Strategy_Group::Stay(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole::GroupRole_DPS)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole::GroupRole_Healer)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole::GroupRole_Tank)
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

bool Strategy_Group::Hold(std::string pmTargetGroupRole)
{
	if (!me)
	{
		return false;
	}
	bool todo = true;
	if (pmTargetGroupRole == "dps")
	{
		if (me->groupRole != GroupRole::GroupRole_DPS)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "healer")
	{
		if (me->groupRole != GroupRole::GroupRole_Healer)
		{
			todo = false;
		}
	}
	else if (pmTargetGroupRole == "tank")
	{
		if (me->groupRole != GroupRole::GroupRole_Tank)
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

std::string Strategy_Group::GetGroupRoleName()
{
	if (!me)
	{
		return "";
	}
	switch (me->groupRole)
	{
	case GroupRole::GroupRole_DPS:
	{
		return "dps";
	}
	case GroupRole::GroupRole_Tank:
	{
		return "tank";
	}
	case GroupRole::GroupRole_Healer:
	{
		return "healer";
	}
	default:
	{
		break;
	}
	}
	return "dps";
}

void Strategy_Group::SetGroupRole(std::string pmRoleName)
{
	if (!me)
	{
		return;
	}
	if (pmRoleName == "dps")
	{
		me->groupRole = GroupRole::GroupRole_DPS;
	}
	else if (pmRoleName == "tank")
	{
		me->groupRole = GroupRole::GroupRole_Tank;
	}
	else if (pmRoleName == "healer")
	{
		me->groupRole = GroupRole::GroupRole_Healer;
	}
}

bool Strategy_Group::AngleInRange(float pmSourceAngle, float pmTargetAngle, float pmRange)
{
	float angleGap = std::abs(pmTargetAngle - pmSourceAngle);
	if (angleGap > M_PI)
	{
		angleGap = M_PI * 2 - angleGap;
	}
	if (angleGap < pmRange)
	{
		return true;
	}
	return false;
}

Position Strategy_Group::GetNearPoint(Position pmSourcePosition, float pmDistance, float pmAbsoluteAngle)
{
	Position targetPosition;
	targetPosition.x = pmSourcePosition.x + pmDistance * std::cos(pmAbsoluteAngle);
	targetPosition.y = pmSourcePosition.y + pmDistance * std::sin(pmAbsoluteAngle);
	targetPosition.z = pmSourcePosition.z + 10.0f;
	me->UpdateAllowedPositionZ(targetPosition.x, targetPosition.y, targetPosition.z);
	return targetPosition;
}
