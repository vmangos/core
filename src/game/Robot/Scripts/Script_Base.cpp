#include "Script_Base.h"
#include "RobotConfig.h"
#include "MapManager.h"
#include "Pet.h"
#include "PetAI.h"
#include "Bag.h"
#include "Spell.h"
#include "SpellMgr.h"
#include "MotionMaster.h"
#include "GridNotifiers.h"
#include "Group.h"
#include "TargetedMovementGenerator.h"

Script_Base::Script_Base(Player* pmMe)
{
	me = pmMe;
	spellIDMap.clear();
	spellLevelMap.clear();
	characterType = 0;
	petting = true;

	float chaseDistanceMin = MIN_DISTANCE_GAP;
	float chaseDistanceMax = MELEE_MIN_DISTANCE;

	rti = -1;
}

void Script_Base::Reset()
{
	rti = -1;
}

std::set<Unit*> Script_Base::GetAttackersInRange(float pmRangeLimit)
{
	std::set<Unit*> attackers;
	attackers.clear();
	if (me)
	{
		if (Group* myGroup = me->GetGroup())
		{
			std::unordered_set<ObjectGuid> CheckedAttackerOGSet;
			CheckedAttackerOGSet.clear();
			for (GroupReference* groupRef = myGroup->GetFirstMember(); groupRef != nullptr; groupRef = groupRef->next())
			{
				if (Player* member = groupRef->getSource())
				{
					if (member->IsAlive())
					{
						for (Unit::AttackerSet::const_iterator attackerIT = member->GetAttackers().begin(); attackerIT != member->GetAttackers().end(); ++attackerIT)
						{
							if (Unit* eachAttacker = *attackerIT)
							{
								if (CheckedAttackerOGSet.find(eachAttacker->GetGUID()) == CheckedAttackerOGSet.end())
								{
									if (me->GetDistance(eachAttacker) < pmRangeLimit)
									{
										CheckedAttackerOGSet.insert(eachAttacker->GetGUID());
										attackers.insert(eachAttacker);
									}
								}
							}
						}
						if (Pet* memberPet = member->GetPet())
						{
							if (memberPet->IsAlive())
							{
								for (Unit::AttackerSet::const_iterator attackerIT = memberPet->GetAttackers().begin(); attackerIT != memberPet->GetAttackers().end(); ++attackerIT)
								{
									if (Unit* eachAttacker = *attackerIT)
									{
										if (CheckedAttackerOGSet.find(eachAttacker->GetGUID()) == CheckedAttackerOGSet.end())
										{
											if (me->GetDistance(eachAttacker) < pmRangeLimit)
											{
												CheckedAttackerOGSet.insert(eachAttacker->GetGUID());
												attackers.insert(eachAttacker);
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			attackers = me->GetAttackers();
		}
	}

	return attackers;
}

bool Script_Base::Update(uint32 pmDiff)
{
	return false;
}

bool Script_Base::DPS(Unit* pmTarget, bool pmChase)
{
	return false;
}

bool Script_Base::Tank(Unit* pmTarget, bool pmChase, bool pmSingle)
{
	return false;
}

bool Script_Base::SubTank(Unit* pmTarget, bool pmChase)
{
	if (!pmTarget)
	{
		return false;
	}
	else if (!pmTarget->IsAlive())
	{
		return false;
	}
	if (!me)
	{
		return false;
	}
	if (!me->IsValidAttackTarget(pmTarget))
	{
		return false;
	}
	if (me->GetDistance(pmTarget) > ATTACK_RANGE_LIMIT)
	{
		return false;
	}
	if (pmChase)
	{
		if (!Chase(pmTarget))
		{
			return false;
		}
	}
	else
	{
		if (!me->isInFront(pmTarget, M_PI / 16))
		{
			me->SetFacingToObject(pmTarget);
		}
	}
	if (me->GetHealthPercent() < 20.0f)
	{
		UseHealingPotion();
	}
	me->Attack(pmTarget, true);
	return true;
}

bool Script_Base::Taunt(Unit* pmTarget)
{
	return false;
}

bool Script_Base::InterruptCasting(Unit* pmTarget)
{
	return false;
}

bool Script_Base::Heal(Unit* pmTarget, bool pmCure)
{
	return false;
}

bool Script_Base::SubHeal(Unit* pmTarget, bool pmCure)
{
	return false;
}

bool Script_Base::GroupHeal(float pmMaxHealthPercent)
{
	return false;
}

bool Script_Base::Attack(Unit* pmTarget)
{
	return false;
}

bool Script_Base::Buff(Unit* pmTarget, bool pmCure)
{
	return false;
}

bool Script_Base::Assist()
{
	return false;
}

void Script_Base::IdentifyCharacterSpells()
{
	if (!me)
	{
		return;
	}

	spellLevelMap.clear();
	characterType = 0;
	uint32 characterTalentTab = me->GetMaxTalentCountTab();

	bool typeChecked = false;
	switch (me->GetClass())
	{
	case Classes::CLASS_WARRIOR:
	{
		if (characterTalentTab == 2)
		{
			characterType = 1;
		}
		break;
	}
	case Classes::CLASS_SHAMAN:
	{
		if (characterTalentTab == 2)
		{
			characterType = 2;
		}
		break;
	}
	case Classes::CLASS_PALADIN:
	{
		if (characterTalentTab == 0)
		{
			characterType = 2;
		}
		else if (characterTalentTab == 1)
		{
			characterType = 1;
		}
		break;
	}
	case Classes::CLASS_PRIEST:
	{
		if (characterTalentTab == 0)
		{
			characterType = 2;
		}
		else if (characterTalentTab == 1)
		{
			characterType = 2;
		}
		break;
	}
	case Classes::CLASS_DRUID:
	{
		if (characterTalentTab == 1)
		{
			characterType = 1;
		}
		else  if (characterTalentTab == 2)
		{
			characterType = 2;
		}
		break;
	}
	default:
	{
		break;
	}
	}
	for (PlayerSpellMap::iterator it = me->GetSpellMap().begin(); it != me->GetSpellMap().end(); it++)
	{
		const SpellEntry* pS = sSpellMgr.GetSpellEntry(it->first);
		if (pS)
		{
			std::string checkNameStr = std::string(pS->SpellName[0]);
			if (spellLevelMap.find(checkNameStr) == spellLevelMap.end())
			{
				spellLevelMap[checkNameStr] = pS->baseLevel;
				spellIDMap[checkNameStr] = it->first;
			}
			else
			{
				if (pS->baseLevel > spellLevelMap[checkNameStr])
				{
					spellLevelMap[checkNameStr] = pS->baseLevel;
					spellIDMap[checkNameStr] = it->first;
				}
			}
		}
	}
}

Item* Script_Base::GetItemInInventory(uint32 pmEntry)
{
	if (!me)
	{
		return NULL;
	}
	for (uint8 i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; i++)
	{
		Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, i);
		if (pItem)
		{
			if (pItem->GetEntry() == pmEntry)
			{
				return pItem;
			}
		}
	}

	for (uint8 i = INVENTORY_SLOT_BAG_START; i < INVENTORY_SLOT_BAG_END; i++)
	{
		if (Bag* pBag = (Bag*)me->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
		{
			for (uint32 j = 0; j < pBag->GetBagSize(); j++)
			{
				Item* pItem = me->GetItemByPos(i, j);
				if (pItem)
				{
					if (pItem->GetEntry() == pmEntry)
					{
						return pItem;
					}
				}
			}
		}
	}

	return NULL;
}

bool Script_Base::UseItem(Item* pmItem, Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	if (me->CanUseItem(pmItem) != EQUIP_ERR_OK)
	{
		return false;
	}

	if (me->IsNonMeleeSpellCasted(true))
	{
		return false;
	}

	if (const ItemPrototype* proto = pmItem->GetProto())
	{
		SpellCastTargets targets;
		targets.Update(pmTarget);
		me->CastItemUseSpell(pmItem, targets);
		return true;
	}

	return false;
}

bool Script_Base::Follow(Unit* pmTarget, float pmDistance)
{
	if (!me)
	{
		return false;
	}
	if (me->HasAuraType(SPELL_AURA_MOD_PACIFY))
	{
		return false;
	}
	if (me->HasUnitState(UnitState::UNIT_STAT_NOT_MOVE))
	{
		return false;
	}
	if (me->HasUnitState(UnitState::UNIT_STAT_ROAMING_MOVE))
	{
		return false;
	}
	if (me->IsNonMeleeSpellCasted(true, false, true))
	{
		return false;
	}
	float currentDistance = me->GetDistance(pmTarget);
	if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == MovementGeneratorType::CHASE_MOTION_TYPE)
	{
		if (ChaseMovementGenerator<Player> const* mg = dynamic_cast<ChaseMovementGenerator<Player> const*>(me->GetMotionMaster()->GetCurrent()))
		{
			if (Unit* mgTarget = mg->GetTarget())
			{
				if (mgTarget->GetGUID() == pmTarget->GetGUID())
				{
					if (currentDistance > ATTACK_RANGE_LIMIT)
					{
						me->AttackStop();
						me->StopMoving();
						me->GetMotionMaster()->Clear();
						ClearTarget();
						return false;
					}
					if (me->GetTargetGuid() != pmTarget->GetObjectGuid())
					{
						ChooseTarget(pmTarget);
					}
					return true;
				}
			}
		}
	}
	if (currentDistance > ATTACK_RANGE_LIMIT)
	{
		return false;
	}
	me->AttackStop();
	me->StopMoving();
	me->GetMotionMaster()->Clear();
	ClearTarget();
	if (me->GetStandState() != UnitStandStateType::UNIT_STAND_STATE_STAND)
	{
		me->SetStandState(UNIT_STAND_STATE_STAND);
	}
	if (me->IsWalking())
	{
		me->SetWalk(false);
	}
	ChooseTarget(pmTarget);
	me->GetMotionMaster()->MoveChase(pmTarget, pmDistance);

	return true;
}

bool Script_Base::Chase(Unit* pmTarget, float pmMaxDistance, float pmMinDistance)
{
	if (!me)
	{
		return false;
	}
	if (me->IsNonMeleeSpellCasted(false, false, true))
	{
		return false;
	}
	if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == MovementGeneratorType::POINT_MOTION_TYPE)
	{
		return true;
	}
	float currentDistance = me->GetDistance(pmTarget);
	if (pmMinDistance > INTERACTION_DISTANCE)
	{
		if (currentDistance < pmMinDistance)
		{
			if (pmTarget->GetTargetGuid() != me->GetObjectGuid())
			{
				me->AttackStop();
				me->StopMoving();
				me->GetMotionMaster()->Clear();
				ClearTarget();

				float destX = 0.0f;
				float destY = 0.0f;
				float destZ = 0.0f;
				pmTarget->GetNearPoint(pmTarget, destX, destY, destZ, pmTarget->GetObjectBoundingRadius(), pmMinDistance + MELEE_MIN_DISTANCE, pmTarget->GetAngle(me));
				me->GetMotionMaster()->MovePoint(0, destX, destY, destZ, MoveOptions::MOVE_PATHFINDING | MoveOptions::MOVE_RUN_MODE, 0.0f, me->GetAngle(pmTarget));
				return true;
			}
		}
	}
	if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == MovementGeneratorType::CHASE_MOTION_TYPE)
	{
		if (ChaseMovementGenerator<Player> const* mg = dynamic_cast<ChaseMovementGenerator<Player> const*>(me->GetMotionMaster()->GetCurrent()))
		{
			if (Unit* mgTarget = mg->GetTarget())
			{
				if (mgTarget->GetGUID() == pmTarget->GetGUID())
				{
					if (currentDistance > ATTACK_RANGE_LIMIT)
					{
						me->AttackStop();
						me->StopMoving();
						me->GetMotionMaster()->Clear();
						ClearTarget();
						return false;
					}
					if (me->GetTargetGuid() != pmTarget->GetObjectGuid())
					{
						ChooseTarget(pmTarget);
					}
					return true;
				}
			}
		}
	}
	if (currentDistance > ATTACK_RANGE_LIMIT)
	{
		return false;
	}
	me->AttackStop();
	me->StopMoving();
	me->GetMotionMaster()->Clear();
	ClearTarget();
	if (me->GetStandState() != UnitStandStateType::UNIT_STAND_STATE_STAND)
	{
		me->SetStandState(UNIT_STAND_STATE_STAND);
	}
	if (me->IsWalking())
	{
		me->SetWalk(false);
	}
	ChooseTarget(pmTarget);
	me->GetMotionMaster()->MoveChase(pmTarget, pmMaxDistance);
	return true;
}

uint32 Script_Base::FindSpellID(std::string pmSpellName)
{
	if (spellIDMap.find(pmSpellName) != spellIDMap.end())
	{
		return spellIDMap[pmSpellName];
	}

	return 0;
}

bool Script_Base::SpellValid(uint32 pmSpellID)
{
	if (pmSpellID == 0)
	{
		return false;
	}
	if (!me)
	{
		return false;
	}
	if (me->HasSpellCooldown(pmSpellID))
	{
		return false;
	}
	return true;
}

bool Script_Base::CastSpell(Unit* pmTarget, std::string pmSpellName, float pmDistance, bool pmCheckAura, bool pmOnlyMyAura, bool pmClearShapeShift)
{
	if (!pmTarget)
	{
		return false;
	}
	if (!me)
	{
		return false;
	}
	if (me->IsNonMeleeSpellCasted(true, false, true))
	{
		return true;
	}
	if (pmCheckAura)
	{
		if (HasAura(pmTarget, pmSpellName, pmOnlyMyAura))
		{
			return false;
		}
	}
	uint32 spellID = FindSpellID(pmSpellName);
	if (!SpellValid(spellID))
	{
		return false;
	}
	const SpellEntry* pS = sSpellMgr.GetSpellEntry(spellID);
	if (pmTarget->GetGUID() != me->GetGUID())
	{
		float actualDistance = me->GetDistance(pmTarget);
		if (actualDistance > pmDistance)
		{
			return false;
		}
	}
	if (!me->IsWithinLOSInMap(pmTarget))
	{
		return false;
	}
	if (!pS)
	{
		return false;
	}
	if (pmTarget->IsImmuneToSpell(pS, false))
	{
		return false;
	}
	for (size_t i = 0; i < MAX_SPELL_REAGENTS; i++)
	{
		if (pS->Reagent[i] > 0)
		{
			if (!me->HasItemCount(pS->Reagent[i], pS->ReagentCount[i]))
			{
				me->StoreNewItemInBestSlots(pS->Reagent[i], pS->ReagentCount[i] * 10);
			}
		}
	}
	if (me->GetStandState() != UnitStandStateType::UNIT_STAND_STATE_STAND)
	{
		me->SetStandState(UNIT_STAND_STATE_STAND);
	}
	if (me->GetTargetGuid() != pmTarget->GetObjectGuid())
	{
		ChooseTarget(pmTarget);
	}
	if (!me->isInFront(pmTarget, pmDistance))
	{
		me->SetFacingToObject(pmTarget);
		return true;
	}
	if (pmClearShapeShift)
	{
		ClearShapeshift();
	}
	SpellCastResult scr = me->CastSpell(pmTarget, spellID, false);
	if (scr == SpellCastResult::SPELL_CAST_OK)
	{
		return true;
	}
	else
	{
		//std::ostringstream scrStream;
		//scrStream << enum_to_string(scr);
		//me->Say(scrStream.str(), Language::LANG_UNIVERSAL);
	}

	return false;
}

bool Script_Base::HasAura(Unit* pmTarget, std::string pmSpellName, bool pmOnlyMyAura)
{
	if (!me)
	{
		return false;
	}
	Unit* target = pmTarget;
	if (!pmTarget)
	{
		target = me;
	}
	std::set<uint32> spellIDSet = sRobotManager->spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmOnlyMyAura)
		{
			if (target->HasCasterAura(spellID, me->GetGUID()))
			{
				return true;
			}
		}
		else
		{
			if (target->HasAura(spellID))
			{
				return true;
			}
		}
	}

	return false;
}

uint32 Script_Base::GetAuraDuration(Unit* pmTarget, std::string pmSpellName, bool pmOnlyMyAura)
{
	uint32 duration = 0;
	if (!me)
	{
		return false;
	}
	Unit* target = pmTarget;
	if (!pmTarget)
	{
		target = me;
	}
	std::set<uint32> spellIDSet = sRobotManager->spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmOnlyMyAura)
		{
			duration = target->GetAuraDuration(spellID, me->GetObjectGuid());
		}
		else
		{
			duration = target->GetAuraDuration(spellID);
		}
		if (duration > 0)
		{
			break;
		}
	}

	return duration;
}

uint32 Script_Base::GetAuraStack(Unit* pmTarget, std::string pmSpellName, bool pmOnlyMyAura)
{
	uint32 auraCount = 0;
	if (!me)
	{
		return false;
	}
	Unit* target = pmTarget;
	if (!pmTarget)
	{
		target = me;
	}
	std::set<uint32> spellIDSet = sRobotManager->spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		uint32 spellID = *it;
		if (pmOnlyMyAura)
		{
			auraCount = target->GetAuraStack(spellID, me->GetObjectGuid());
		}
		else
		{
			auraCount = target->GetAuraStack(spellID);
		}
		if (auraCount > 0)
		{
			break;
		}
	}

	return auraCount;
}

void Script_Base::ClearShapeshift()
{
	if (!me)
	{
		return;
	}
	uint32 spellID = 0;
	switch (me->GetShapeshiftForm())
	{
	case ShapeshiftForm::FORM_NONE:
	{
		break;
	}
	case ShapeshiftForm::FORM_CAT:
	{
		spellID = FindSpellID("Cat Form");
		break;
	}
	case ShapeshiftForm::FORM_DIREBEAR:
	{
		spellID = FindSpellID("Dire Bear Form");
		break;
	}
	case ShapeshiftForm::FORM_BEAR:
	{
		spellID = FindSpellID("Bear Form");
		break;
	}
	case ShapeshiftForm::FORM_MOONKIN:
	{
		spellID = FindSpellID("Moonkin Form");
		break;
	}
	default:
	{
		break;
	}
	}
	CancelAura(spellID);
}

bool Script_Base::CancelAura(std::string pmSpellName)
{
	if (!me)
	{
		return false;
	}
	std::set<uint32> spellIDSet = sRobotManager->spellNameEntryMap[pmSpellName];
	for (std::set<uint32>::iterator it = spellIDSet.begin(); it != spellIDSet.end(); it++)
	{
		if (me->HasAura((*it)))
		{
			CancelAura((*it));
			return true;
		}
	}

	return false;
}

void Script_Base::CancelAura(uint32 pmSpellID)
{
	if (pmSpellID == 0)
	{
		return;
	}
	if (!me)
	{
		return;
	}

	const SpellEntry* pS = sSpellMgr.GetSpellEntry(pmSpellID);
	if (!pS)
	{
		return;
	}
	if (pS->HasAttribute(SpellAttributes::SPELL_ATTR_CANT_CANCEL))
	{
		return;
	}
	if (pS->IsChanneledSpell())
	{
		if (Spell* curSpell = me->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
		{
			if (curSpell->m_spellInfo->Id == pmSpellID)
			{
				me->InterruptSpell(CURRENT_CHANNELED_SPELL);
			}
		}
		return;
	}
	if (!pS->IsPositiveSpell() || pS->IsPassiveSpell())
	{
		return;
	}
}

bool Script_Base::Rest()
{
	bool result = false;

	if (!me)
	{
		return false;
	}
	if (me->IsInCombat())
	{
		return false;
	}
	uint32 foodEntry = 0;
	if (me->GetLevel() >= 45)
	{
		foodEntry = 8932;
	}
	else if (me->GetLevel() >= 35)
	{
		foodEntry = 3927;
	}
	else if (me->GetLevel() >= 25)
	{
		foodEntry = 1707;
	}
	else if (me->GetLevel() >= 15)
	{
		foodEntry = 422;
	}
	else
	{
		return false;
	}
	uint32 drinkEntry = 0;
	if (me->GetLevel() >= 45)
	{
		drinkEntry = 8766;
	}
	else if (me->GetLevel() >= 45)
	{
		drinkEntry = 8766;
	}
	else if (me->GetLevel() >= 35)
	{
		drinkEntry = 1645;
	}
	else if (me->GetLevel() >= 25)
	{
		drinkEntry = 1708;
	}
	else if (me->GetLevel() >= 15)
	{
		drinkEntry = 1205;
	}

	if (!me->HasItemCount(foodEntry, 1))
	{
		me->StoreNewItemInBestSlots(foodEntry, 20);
	}
	if (!me->HasItemCount(drinkEntry, 1))
	{
		me->StoreNewItemInBestSlots(drinkEntry, 20);
	}

	me->CombatStop(true);
	me->GetMotionMaster()->Clear();
	me->StopMoving();
	ClearTarget();

	Item* pFood = GetItemInInventory(foodEntry);
	if (pFood && !pFood->IsInTrade())
	{
		if (UseItem(pFood, me))
		{
			//std::ostringstream useRemarksStream;
			//useRemarksStream << "Use item " << pFood->GetTemplate()->Name1;
			//me->Say(useRemarksStream.str(), Language::LANG_UNIVERSAL);
			result = true;
		}
	}
	Item* pDrink = GetItemInInventory(drinkEntry);
	if (pDrink && !pDrink->IsInTrade())
	{
		if (UseItem(pDrink, me))
		{
			//std::ostringstream useRemarksStream;
			//useRemarksStream << "Use item " << pDrink->GetTemplate()->Name1;
			//me->Say(useRemarksStream.str(), Language::LANG_UNIVERSAL);
			result = true;
		}
	}

	return result;
}

void Script_Base::PetAttack(Unit* pmTarget)
{
	if (me)
	{
		if (Pet* myPet = me->GetPet())
		{
			if (CharmInfo* pci = myPet->GetCharmInfo())
			{
				if (!pci->IsCommandAttack())
				{
					pci->SetIsCommandAttack(true);
					CreatureAI* AI = myPet->ToCreature()->AI();
					if (PetAI* petAI = dynamic_cast<PetAI*>(AI))
					{
						petAI->AttackStart(pmTarget);
					}
					else
					{
						AI->AttackStart(pmTarget);
					}
				}
			}
		}
	}
}

void Script_Base::PetStop()
{
	// EJ debug
	return;
	if (me)
	{
		if (Pet* myPet = me->GetPet())
		{
			myPet->AttackStop();
			if (CharmInfo* pci = myPet->GetCharmInfo())
			{
				if (pci->IsCommandAttack())
				{
					pci->SetIsCommandAttack(false);
				}
				if (!pci->IsCommandFollow())
				{
					pci->SetIsCommandFollow(true);
				}
			}
		}
	}
}

bool Script_Base::UseHealingPotion()
{
	bool result = false;

	if (!me)
	{
		return false;
	}
	if (!me->IsInCombat())
	{
		return false;
	}
	uint32 itemEntry = 0;
	if (me->GetLevel() >= 45)
	{
		itemEntry = 13446;
	}
	else if (me->GetLevel() >= 35)
	{
		itemEntry = 3928;
	}
	else if (me->GetLevel() >= 21)
	{
		itemEntry = 1710;
	}
	else if (me->GetLevel() >= 12)
	{
		itemEntry = 929;
	}
	else
	{
		itemEntry = 118;
	}
	if (!me->HasItemCount(itemEntry, 1))
	{
		me->StoreNewItemInBestSlots(itemEntry, 20);
	}
	Item* pItem = GetItemInInventory(itemEntry);
	if (pItem && !pItem->IsInTrade())
	{
		if (UseItem(pItem, me))
		{
			result = true;
		}
	}

	return result;
}

bool Script_Base::UseManaPotion()
{
	bool result = false;

	if (!me)
	{
		return false;
	}
	if (!me->IsInCombat())
	{
		return false;
	}
	uint32 itemEntry = 0;
	if (me->GetLevel() >= 49)
	{
		itemEntry = 13444;
	}
	else if (me->GetLevel() >= 41)
	{
		itemEntry = 13443;
	}
	else if (me->GetLevel() >= 31)
	{
		itemEntry = 6149;
	}
	else if (me->GetLevel() >= 22)
	{
		itemEntry = 3827;
	}
	else if (me->GetLevel() >= 14)
	{
		itemEntry = 3385;
	}
	else
	{
		itemEntry = 2455;
	}
	if (!me->HasItemCount(itemEntry, 1))
	{
		me->StoreNewItemInBestSlots(itemEntry, 20);
	}
	Item* pItem = GetItemInInventory(itemEntry);
	if (pItem && !pItem->IsInTrade())
	{
		if (UseItem(pItem, me))
		{
			result = true;
		}
	}

	return result;
}

void Script_Base::ChooseTarget(Unit* pmTarget)
{
	if (pmTarget)
	{
		if (me)
		{
			me->SetSelectionGuid(pmTarget->GetObjectGuid());
			me->SetTargetGuid(pmTarget->GetObjectGuid());
		}
	}
}

void Script_Base::ClearTarget()
{
	if (me)
	{
		me->SetSelectionGuid(ObjectGuid());
		me->SetTargetGuid(ObjectGuid());
	}
}
