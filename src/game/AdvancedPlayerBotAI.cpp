/*Giperion February - March 2017
  FaeireFire project
  [EUREKA] 3.1
  Based on:
	Mangos			2005 - 2009
	Mangos-Zero		2009 - 2011
	Nostalrius Core 2011 - 2016
	Elysium Core	2016 - 2017
*/
#include "Common.h"
#include "AdvancedPlayerBotAI.h"
#include "Player.h"
#include "MoveSpline.h"
#include "CinematicStuff.h"



void AdvancedPlayerBotAI::UpdateAI(const uint32 delta)
{
	PlayerCreatorAI::UpdateAI(delta);

	//main ai entry point
	//thinker timing
	ThinkerTimer += delta;
	if (ThinkerTimer > ThinkerInterval)
	{
		ThinkerTimer = 0;
		CommonAI(ThinkerTimer);
	}
}

void AdvancedPlayerBotAI::CommonAI(const uint32 delta)
{
	//first - conditions
	GatherConditions();


	if (Conditions.IsDead)
	{
		if (Conditions.IsResurrectRequested)
		{
			WorldPacket ResurrectAnswer(CMSG_RESURRECT_RESPONSE);
			me->ResurectUsingRequestData();
		}
		return;
	}

	//movement different from range class and melee, so relocate code

	/// CLASS CODE

	switch (_class)
	{
	case CLASS_WARRIOR:
		WarriorAI(delta);
		break;
	case CLASS_PALADIN:
		PaladinAI(delta);
		break;
	case CLASS_HUNTER:
		HunterAI(delta);
		break;
	case CLASS_ROGUE:
		RogueAI(delta);
		break;
	case CLASS_PRIEST:
		PriestAI(delta);
		break;
	case CLASS_SHAMAN:
		ShamanAI(delta);
		break;
	case CLASS_MAGE:
		MageAI(delta);
		break;
	case CLASS_WARLOCK:
		WarlockAI(delta);
		break;
	case CLASS_DRUID:
		DruidAI(delta);
		break;
	}
}

void AdvancedPlayerBotAI::WarriorAI(const uint32 delta)
{
	//alright, react first to nearest attacker, then our target
	//first of all - if we not on battle stance - ENABLE
	if (me->HasAura(2457))
	{
		me->CastSpell(me, 2457, false);
	}

	if (Conditions.IsAttacked)
	{
		if (Unit* NearestAttacker = PickNearestAttacker())
		{
			//keep target in front of us
			WarriorAttackTarget(NearestAttacker);
		}
	}
	else
	{
		//Search
		if (me->getVictim() == nullptr)
		{
			if (Unit* NewTarget = me->SelectNearestTarget(50.0f))
			{
				me->Attack(NewTarget, true);
				WarriorAttackTarget(NewTarget);
			}
		}
		else
		{
			WarriorAttackTarget(me->getVictim());
		}
	}
}

void AdvancedPlayerBotAI::WarriorAttackTarget(Unit* NearestAttacker)
{
	me->SetFacingToObject(NearestAttacker);
	me->SetInFront(NearestAttacker);

	if (me->IsWithinMeleeRange(NearestAttacker))
	{
		uint32 Rage = me->GetPower(POWER_RAGE);

		const ObjectGuid& TargetGuid = me->GetTargetGuid();
		if (TargetGuid != NearestAttacker->GetObjectGuid())
		{
			me->Attack(NearestAttacker, true);
		}
		//always use thunder clap
		if (!me->HasSpellCooldown(11581))
		{
			if (Rage > 19)
			{
				me->CastSpell(me, 11581, false);
			}

			return;
		}

		//Rend
		if (!me->HasSpellCooldown(11574))
		{
			if (Rage > 9)
			{
				me->CastSpell(NearestAttacker, 11574, false);
			}
		}

		//Heroic strike
		if (!me->HasSpellCooldown(25286))
		{
			if (Rage > 29)
			{
				me->CastSpell(NearestAttacker, 25286, false);
			}
		}
	}
	else
	{
		//As long as i remember, there is a Charge ability
// 		me->CastSpell(NearestAttacker, 11578, false);
// 
 		me->GetMotionMaster()->MoveChase(NearestAttacker);
	}
}

void AdvancedPlayerBotAI::PaladinAI(const uint32 delta)
{

}

void AdvancedPlayerBotAI::HunterAI(const uint32 delta)
{

}

void AdvancedPlayerBotAI::RogueAI(const uint32 delta)
{

}

void AdvancedPlayerBotAI::PriestAI(const uint32 delta)
{
	//if we already cast something - no need to update
	if (me->IsNonMeleeSpellCasted(false)) return;


}

void AdvancedPlayerBotAI::ShamanAI(const uint32 delta)
{

}

void AdvancedPlayerBotAI::WarlockAI(const uint32 delta)
{
	//if we already cast something - no need to update
	if (me->IsNonMeleeSpellCasted(false)) return;

// 	//if we don't have our glorious imp - summon a new one
// 	if (me->GetPet() == nullptr)
// 	{
// 		me->CastSpell(me, 688, false);
// 		return;
// 	}

	if (Conditions.IsAttacked)
	{
		if (Unit* NearestAttacker = PickNearestAttacker())
		{
			WarlockBattleAI(NearestAttacker);
		}
	}
	else
	{
		//Search
		if (me->getVictim() == nullptr)
		{
			if (Unit* NewTarget = me->SelectNearestTarget(50.0f))
			{
				WarlockBattleAI(NewTarget);
			}
		}
		else
		{
			WarlockBattleAI(me->getVictim());
		}
	}

}

void AdvancedPlayerBotAI::WarlockBattleAI(Unit* NearestAttacker)
{
	me->SetFacingToObject(NearestAttacker);
	me->SetInFront(NearestAttacker);

	const ObjectGuid& TargetGuid = me->GetTargetGuid();
	if (TargetGuid != NearestAttacker->GetObjectGuid())
	{
		me->Attack(NearestAttacker, true);
	}

	float Dis = me->GetDistance(NearestAttacker);

	if (Dis > 20.0f)
	{
		//go to target
		me->GetMotionMaster()->MoveChase(NearestAttacker);
		return;
	}

	if (!me->movespline->Finalized())
		me->StopMoving();

	uint32 mana = me->GetPower(POWER_MANA);

	float RandFactor = frand(0.0f, 1.0f);

	if (RandFactor < 0.1f)
	{
		if (!me->HasSpellCooldown(11700))
		{
			me->CastSpell(NearestAttacker, 11700, false);
		}
	}
	else if (RandFactor < 0.6f)
	{
		if (!me->HasSpellCooldown(25309))
		{
			me->CastSpell(NearestAttacker, 25309, false);
		}
	}
	else
	{
		if (!me->HasSpellCooldown(25307))
		{
			me->CastSpell(NearestAttacker, 25307, false);
		}
	}
}

void AdvancedPlayerBotAI::DruidAI(const uint32 delta)
{

}


enum
{
	SPELL_FROST_NOVA = 122,
	SPELL_FIREBOLT = 133,
	AURA_REGEN_MANA = 430,
};

void AdvancedPlayerBotAI::MageAI(const uint32 delta)
{
	//if we already cast something - no need to update
	if (me->IsNonMeleeSpellCasted(false)) return;

	float range = me->isInCombat() ? 30.0f : frand(15, 30);
	Unit* target = me->SelectNearestTarget(range);
	if (target && !me->IsWithinLOSInMap(target))
		target = NULL;
	// OOM ?
	if (me->GetPower(POWER_MANA) < 40 && target && me->isInCombat())
	{
		if (me->Attack(target, true))
			me->GetMotionMaster()->MoveChase(target);
		return;
	}
	// Stop chase if has mana
	if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE)
		me->GetMotionMaster()->MovementExpired();
	bool nearTarget = target && target->IsWithinMeleeRange(me);
	if (!me->HasSpellCooldown(SPELL_FROST_NOVA) && me->GetPower(POWER_MANA) > 50)
		if (nearTarget)
			me->CastSpell(me, SPELL_FROST_NOVA, false);
	if (nearTarget && target->hasUnitState(UNIT_STAT_CAN_NOT_MOVE))
	{
		// already runing
		if (!me->movespline->Finalized())
			return;
		// Try to kit
		float x, y, z;
		me->GetPosition(x, y, z);
		float d = me->GetDistance(target);
		d += me->GetObjectBoundingRadius();
		d += target->GetObjectBoundingRadius();
		x += (x - target->GetPositionX()) * 5.0f / d;
		y += (y - target->GetPositionY()) * 5.0f / d;
		me->UpdateGroundPositionZ(x, y, z);
		me->GetMotionMaster()->MovePoint(0, x, y, z, MOVE_PATHFINDING);
		return;
	}

	if (target && me->GetPower(POWER_MANA) > 50)
	{
		uint32 spellId = SPELL_FIREBOLT;
		me->SetFacingToObject(target);
		if (!me->movespline->Finalized())
			me->StopMoving();

		/*float z = me->GetPositionZ();
		me->UpdateGroundPositionZ(me->GetPositionX(), me->GetPositionY(), z);
		me->Relocate(me->GetPositionX(), me->GetPositionY(), z);
		me->m_movementInfo.moveFlags = 0;
		me->SendHeartBeat();*/

		me->CastSpell(target, spellId, false);
		return;
	}
	/// OUT OF COMBAT REGEN
	if (!me->isInCombat() && me->GetPower(POWER_MANA) < 150)
	{
		if (!me->movespline->Finalized())
			me->StopMoving();
		me->CastSpell(target, AURA_REGEN_MANA, false);
		return;
	}
}

void AdvancedPlayerBotAI::GatherConditions()
{
	SeenCreature = nullptr;

	Conditions.IsDead = me->isDead();
	if (Conditions.IsDead) 
	{
		Conditions.IsResurrectRequested = me->isRessurectRequested();
		return;
	}

	//look around
	WorldLocation PlayerPos;
	me->GetPosition(PlayerPos);

	Map* PlayerLoc = me->GetMap();
	float MapVisibilityDis = PlayerLoc->GetVisibilityDistance();
	if (Unit* Target = me->SelectNearestTarget(MapVisibilityDis * 2))
	{
		Conditions.SeeEnemy = true;
		if (Target->IsPlayer())
		{
			Conditions.SeeHostilePlayer = true;
		}
		else
		{
			Conditions.SeeMonter = true;
		}
		SeenCreature = Target;
	}

	//Is attacked?
	Conditions.IsAttacked = me->isInCombat();

	if (Conditions.IsAttacked)
	{
		Unit::AttackerSet AttackerTable = me->getAttackers();
		if (AttackerTable.size() == 0)
		{
			Conditions.IsAttacked = false;
		}
	}

	//PlayerLoc->SummonCreature()
}

Unit* AdvancedPlayerBotAI::PickNearestAttacker()
{
	Unit::AttackerSet AttackerTable = me->getAttackers();
	if (AttackerTable.size() > 0)
	{
		//pick nearest
		Unit* NearestUnit = nullptr;
		float MinSeenRadius = 999999.0f;
		for (Unit* Attacker : AttackerTable)
		{
			float AttackerRadius = Attacker->GetDistance(me);
			if (AttackerRadius < MinSeenRadius)
			{
				MinSeenRadius = AttackerRadius;
				NearestUnit = Attacker;
			}
		}

		return NearestUnit;
	}

	return nullptr;
}
