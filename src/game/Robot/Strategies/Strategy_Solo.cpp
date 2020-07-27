#include "Strategy_Solo.h"
#include "RobotAI.h"
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

void Strategy_Solo::InitialStrategy()
{
	soloState = RobotSoloState::RobotSoloState_Wander;

	deathDelay = 0;
	soloDelay = urand(sRobotConfig.SoloMinDelay, sRobotConfig.SoloMaxDelay);
	eatDelay = 0;
	drinkDelay = 0;
	waitDelay = 0;
	strollDelay = 0;
	confuseDelay = 0;
	interestsDelay = 0;
}

void Strategy_Solo::Update(uint32 pmDiff)
{
	Strategy_Base::Update(pmDiff);
	if (!me)
	{
		return;
	}
	if (!me->GetSession()->isRobotSession)
	{
		return;
	}
	if (interestsDelay > 0)
	{
		interestsDelay -= pmDiff;
	}
	if (!me->IsAlive())
	{
		if (deathDelay > 0)
		{
			deathDelay -= pmDiff;
			if (deathDelay <= 0)
			{
				sRobotManager->RandomTeleport(me);
				return;
			}
		}
		else
		{
			deathDelay = urand(sRobotConfig.DeathMinDelay, sRobotConfig.DeathMaxDelay);
		}
		return;
	}
	soloDelay -= pmDiff;
	if (soloDelay < 0)
	{
		soloDelay = urand(sRobotConfig.SoloMinDelay, sRobotConfig.SoloMaxDelay);
		sRobotManager->RandomTeleport(me);
		return;
	}
	switch (soloState)
	{
	case RobotSoloState::RobotSoloState_None:
	{
		return;
	}
	case RobotSoloState::RobotSoloState_Wander:
	{
		if (me->IsInCombat())
		{
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Battle;
			return;
		}
		if (Rest())
		{
			return;
		}
		if (Buff())
		{
			return;
		}
		if (PVP())
		{
			engageDelay = 20 * TimeConstants::IN_MILLISECONDS;
			return;
		}
		if (urand(0, 1) == 0)
		{
			if (Confuse())
			{
				return;
			}
		}
		if (urand(0, 1) == 0)
		{
			if (Stroll())
			{
				return;
			}
		}
		if (Battle())
		{
			soloState = RobotSoloState::RobotSoloState_Battle;
			engageDelay = 10 * TimeConstants::IN_MILLISECONDS;
			return;
		}
		if (Wait())
		{
			return;
		}
		break;
	}
	case RobotSoloState::RobotSoloState_Battle:
	{
		if (me->IsInCombat())
		{
			engageDelay = 0;
			if (me->GetHealthPercent() < 40.0f)
			{
				if (Heal())
				{
					return;
				}
			}
			if (Battle())
			{
				return;
			}
			if (me->GetClass() == Classes::CLASS_HUNTER)
			{
				me->HandleEmoteCommand(Emote::EMOTE_ONESHOT_CHEER);
			}
		}
		else
		{
			if (engageDelay > 0)
			{
				engageDelay -= pmDiff;
			}
			if (engageDelay <= 0)
			{
				engageDelay = 0;
				soloState = RobotSoloState::RobotSoloState_Wander;
				return;
			}
			if (sb->Attack(engageTarget))
			{
				return;
			}
			else
			{
				engageTarget = NULL;
				engageDelay = 0;
			}
		}
		break;
	}
	case RobotSoloState::RobotSoloState_Rest:
	{
		if (me->IsInCombat())
		{
			eatDelay = 0;
			drinkDelay = 0;
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Battle;
			return;
		}
		eatDelay -= pmDiff;
		if (drinkDelay > 0)
		{
			drinkDelay -= pmDiff;
			if (drinkDelay <= 0)
			{
				sb->Drink();
			}
		}
		if (eatDelay < 0)
		{
			drinkDelay = 0;
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Wander;
			return;
		}
		break;
	}
	case RobotSoloState::RobotSoloState_Wait:
	{
		if (me->IsInCombat())
		{
			waitDelay = 0;
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Battle;
			return;
		}
		waitDelay -= pmDiff;
		if (waitDelay < 0)
		{
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Wander;
			return;
		}
		break;
	}
	case RobotSoloState::RobotSoloState_Stroll:
	{
		if (me->IsInCombat())
		{
			strollDelay = 0;
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Battle;
			return;
		}
		strollDelay -= pmDiff;
		if (strollDelay < 0)
		{
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Wander;
			return;
		}
		break;
	}
	case RobotSoloState::RobotSoloState_Confuse:
	{
		if (me->IsInCombat())
		{
			confuseDelay = 0;
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Battle;
			return;
		}
		confuseDelay -= pmDiff;
		if (confuseDelay < 0)
		{
			me->StopMoving();
			me->GetMotionMaster()->Clear();
			soloState = RobotSoloState::RobotSoloState_Wander;
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

bool Strategy_Solo::Buff()
{
	if (me)
	{
		return sb->Buff(me, true);
	}
	return false;
}

bool Strategy_Solo::Rest()
{
	if (!me)
	{
		return false;
	}
	if (me->IsInCombat())
	{
		return false;
	}
	else
	{
		float hpRate = me->GetHealthPercent();
		float mpRate = 100;
		if (me->GetPowerType() == Powers::POWER_MANA)
		{
			mpRate = me->GetPower(Powers::POWER_MANA) * 100 / me->GetMaxPower(Powers::POWER_MANA);
		}
		if (hpRate > 50 && mpRate > 50)
		{
			return false;
		}
		else
		{
			if (sb->Eat())
			{
				soloState = RobotSoloState::RobotSoloState_Rest;
				eatDelay = DEFAULT_REST_DELAY;
				drinkDelay = 1000;
				return true;
			}
		}
	}

	return false;
}

bool Strategy_Solo::Battle()
{
	if (!me)
	{
		return false;
	}
	if (Unit* myTarget = me->GetSelectedUnit())
	{
		if (Player* targetPlayer = myTarget->ToPlayer())
		{
			if (sb->Attack(targetPlayer))
			{
				engageTarget = targetPlayer;
				return true;
			}
		}
	}
	for (Unit::AttackerSet::const_iterator attackerIT = me->GetAttackers().begin(); attackerIT != me->GetAttackers().end(); attackerIT++)
	{
		if (Unit* pTarget = *attackerIT)
		{
			if (Player* targetPlayer = pTarget->ToPlayer())
			{
				if (sb->Attack(targetPlayer))
				{
					engageTarget = targetPlayer;
					return true;
				}
			}
		}
	}
	if (Pet* memberPet = me->GetPet())
	{
		if (memberPet->IsAlive())
		{
			for (Unit::AttackerSet::const_iterator attackerIT = memberPet->GetAttackers().begin(); attackerIT != memberPet->GetAttackers().end(); ++attackerIT)
			{
				if (Unit* eachAttacker = *attackerIT)
				{
					if (Player* targetPlayer = eachAttacker->ToPlayer())
					{
						if (sb->Attack(targetPlayer))
						{
							engageTarget = targetPlayer;
							return true;
						}
					}
				}
			}
		}
	}
	if (Unit* myTarget = me->GetSelectedUnit())
	{
		if (sb->Attack(myTarget))
		{
			engageTarget = myTarget;
			return true;
		}
	}
	Unit* closestAttacker = NULL;
	float closestDistance = DEFAULT_VISIBILITY_DISTANCE;
	for (Unit::AttackerSet::const_iterator attackerIT = me->GetAttackers().begin(); attackerIT != me->GetAttackers().end(); attackerIT++)
	{
		if (Unit* pTarget = *attackerIT)
		{
			float distance = me->GetDistance(pTarget);
			if (distance < closestDistance)
			{
				closestDistance = distance;
				closestAttacker = pTarget;
			}
		}
	}
	if (Pet* memberPet = me->GetPet())
	{
		if (memberPet->IsAlive())
		{
			for (Unit::AttackerSet::const_iterator attackerIT = memberPet->GetAttackers().begin(); attackerIT != memberPet->GetAttackers().end(); ++attackerIT)
			{
				if (Unit* eachAttacker = *attackerIT)
				{
					float distance = me->GetDistance(eachAttacker);
					if (distance < closestDistance)
					{
						closestDistance = distance;
						closestAttacker = eachAttacker;
					}
				}
			}
		}
	}
	if (sb->Attack(closestAttacker))
	{
		engageTarget = closestAttacker;
		return true;
	}

	std::list<Unit*> attackTargets;
	MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(me, me, DEFAULT_VISIBILITY_DISTANCE);
	MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(attackTargets, u_check);
	Cell::VisitAllObjects(me, searcher, DEFAULT_VISIBILITY_DISTANCE);
	Unit* nearestAttackableTarget = NULL;
	float nearestDistance = MAX_VISIBILITY_DISTANCE;
	for (std::list<Unit*>::iterator it = attackTargets.begin(); it != attackTargets.end(); it++)
	{
		if (Unit* eachU = *it)
		{
			if (eachU->IsPet())
			{
				if (Pet* pet = eachU->ToPet())
				{
					if (pet->GetCharmerOrOwner())
					{
						continue;
					}
				}
			}
			if (!me->IsValidAttackTarget(eachU))
			{
				continue;
			}
			if (!me->IsWithinLOSInMap(eachU))
			{
				continue;
			}
			if (eachU->GetTypeId() == TypeID::TYPEID_PLAYER)
			{
				if (sb->Attack(eachU))
				{
					engageTarget = eachU;
					return true;
				}
			}
			float checkDistance = me->GetDistance(eachU);
			if (checkDistance < nearestDistance)
			{
				nearestDistance = checkDistance;
				nearestAttackableTarget = eachU;
			}
		}
	}
	if (sb->Attack(nearestAttackableTarget))
	{
		engageTarget = nearestAttackableTarget;
		return true;
	}

	return false;
}

bool Strategy_Solo::PVP()
{
	if (!me)
	{
		return false;
	}
	std::list<Unit*> attackTargets;
	MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck u_check(me, me, DEFAULT_VISIBILITY_DISTANCE);
	MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyUnitInObjectRangeCheck> searcher(attackTargets, u_check);
	Cell::VisitAllObjects(me, searcher, DEFAULT_VISIBILITY_DISTANCE);
	for (std::list<Unit*>::iterator it = attackTargets.begin(); it != attackTargets.end(); it++)
	{
		if (Unit* eachU = *it)
		{
			if (Player* eachPlayer = eachU->ToPlayer())
			{
				if (sb->Attack(eachPlayer))
				{
					engageTarget = eachPlayer;
					return true;
				}
			}
		}
	}

	return false;
}

bool Strategy_Solo::Heal()
{
	if (me)
	{
		return sb->Heal(me, true);
	}
	return false;
}

bool Strategy_Solo::Wait()
{
	if (me)
	{
		sb->ClearTarget();
		me->AttackStop();
		me->GetMotionMaster()->Clear();
		me->StopMoving();
		waitDelay = 5 * TimeConstants::IN_MILLISECONDS;
		soloState = RobotSoloState::RobotSoloState_Wait;
		return true;
	}
	return false;
}

bool Strategy_Solo::Stroll()
{
	if (me)
	{
		float distance = frand(10.0f, VISIBILITY_DISTANCE_SMALL);
		float destX = 0;
		float destY = 0;
		float destZ = 0;
		if (me->GetRandomPoint(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), distance, destX, destY, destZ))
		{
			me->rai->rm->MovePosition(destX, destY, destZ);
		}
		strollDelay = 5 * TimeConstants::IN_MILLISECONDS;
		soloState = RobotSoloState::RobotSoloState_Stroll;
		return true;
	}
	return false;
}

bool Strategy_Solo::Confuse()
{
	// EJ confuse issue use wait instead
	//return Wait();

	if (me)
	{
		me->StopMoving();
		me->GetMotionMaster()->Clear();
		me->GetMotionMaster()->MoveConfused();
		confuseDelay = 5 * TimeConstants::IN_MILLISECONDS;
		soloState = RobotSoloState::RobotSoloState_Confuse;
		return true;
	}
	return false;
}

void Strategy_Solo::HandleChatCommand(Player* pmSender, std::string pmCMD)
{
	if (!me)
	{
		return;
	}
	std::vector<std::string> commandVector = sRobotManager->SplitString(pmCMD, " ", true);
	std::string commandName = commandVector.at(0);
	if (commandName == "who")
	{
		sRobotManager->WhisperTo(me, sRobotManager->characterTalentTabNameMap[me->GetClass()][me->GetMaxTalentCountTab()], Language::LANG_UNIVERSAL, pmSender);
	}
}

void Strategy_Solo::Reset()
{
	deathDelay = 0;
	confuseDelay = 0;
	engageDelay = 0;
	eatDelay = 0;
	drinkDelay = 0;
	soloDelay = urand(sRobotConfig.SoloMinDelay, sRobotConfig.SoloMaxDelay);
	waitDelay = 0;
	strollDelay = 0;
	soloState = RobotSoloState::RobotSoloState_Wander;
}
