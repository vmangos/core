#include "Script_Paladin.h"
#include "SpellMgr.h"
#include "RobotManager.h"
#include "Group.h"

Script_Paladin::Script_Paladin(Player* pmMe) :Script_Base(pmMe)
{
	blessingType = PaladinBlessingType::PaladinBlessingType_Kings;
	auraType = PaladinAuraType::PaladinAuraType_Retribution;
}

void Script_Paladin::Reset()
{
	blessingType = PaladinBlessingType::PaladinBlessingType_Kings;
	uint32 characterTalentTab = me->GetMaxTalentCountTab();
	switch (characterTalentTab)
	{
	case 0:
	{
		auraType = PaladinAuraType::PaladinAuraType_Concentration;
		break;
	}
	case 1:
	{
		auraType = PaladinAuraType::PaladinAuraType_Devotion;
		break;
	}
	case 2:
	{
		auraType = PaladinAuraType::PaladinAuraType_Retribution;
		break;
	}
	default:
	{
		auraType = PaladinAuraType::PaladinAuraType_Devotion;
		break;
	}
	}
}

bool Script_Paladin::Heal(Unit* pmTarget, bool pmCure)
{
	if (!me)
	{
		return false;
	}
	if ((me->GetPower(Powers::POWER_MANA) * 100 / me->GetMaxPower(Powers::POWER_MANA)) < 30)
	{
		UseManaPotion();
	}
	uint32 characterTalentTab = me->GetMaxTalentCountTab();
	switch (characterTalentTab)
	{
	case 0:
	{
		return Heal_Holy(pmTarget, pmCure);
	}
	case 1:
	{
		return Heal_Holy(pmTarget, pmCure);
	}
	case 2:
	{
		return Heal_Holy(pmTarget, pmCure);
	}
	default:
		return Heal_Holy(pmTarget, pmCure);
	}

	return false;
}

bool Script_Paladin::Heal_Holy(Unit* pmTarget, bool pmCure)
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
	if (me->GetDistance(pmTarget) > PALADIN_RANGE_DISTANCE)
	{
		return false;
	}
	float healthPCT = pmTarget->GetHealthPercent();
	if (healthPCT < 20.0f)
	{
		if (!HasAura(pmTarget, "Forbearance"))
		{
			if (CastSpell(pmTarget, "Lay on Hands", PALADIN_RANGE_DISTANCE))
			{
				return true;
			}
		}
	}
	if (healthPCT < 60.0f)
	{
		if (CastSpell(pmTarget, "Holy Light", PALADIN_RANGE_DISTANCE))
		{
			return true;
		}
	}
	if (healthPCT < 80.0f)
	{
		if (CastSpell(pmTarget, "Flash of Light", PALADIN_RANGE_DISTANCE))
		{
			return true;
		}
	}

	if (pmCure)
	{
		if (pmTarget->HasAuraWithDispelType(DispelType::DISPEL_POISON))
		{
			if (CastSpell(pmTarget, "Purify"))
			{
				return true;
			}
		}
		if (pmTarget->HasAuraWithDispelType(DispelType::DISPEL_DISEASE))
		{
			if (CastSpell(pmTarget, "Purify"))
			{
				return true;
			}
		}
	}

	return false;
}

bool Script_Paladin::Tank(Unit* pmTarget, bool pmChase, bool pmSingle)
{
	return false;
}

bool Script_Paladin::DPS(Unit* pmTarget, bool pmChase)
{
	if (!me)
	{
		return false;
	}
	if (me->GetHealthPercent() < 20.0f)
	{
		UseHealingPotion();
	}
	if ((me->GetPower(Powers::POWER_MANA) * 100 / me->GetMaxPower(Powers::POWER_MANA)) < 30)
	{
		UseManaPotion();
	}
	uint32 characterTalentTab = me->GetMaxTalentCountTab();
	switch (characterTalentTab)
	{
	case 0:
	{
		return DPS_Common(pmTarget, pmChase);
	}
	case 1:
	{
		return DPS_Common(pmTarget, pmChase);
	}
	case 2:
	{
		return DPS_Retribution(pmTarget, pmChase);
	}
	default:
		return DPS_Common(pmTarget, pmChase);
	}
}

bool Script_Paladin::DPS_Retribution(Unit* pmTarget, bool pmChase)
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
	else if (!me->IsValidAttackTarget(pmTarget))
	{
		return false;
	}
	float targetDistance = me->GetDistance(pmTarget);
	if (pmChase)
	{
		if (targetDistance > ATTACK_RANGE_LIMIT)
		{
			return false;
		}
		if (!Chase(pmTarget))
		{
			return false;
		}
	}
	else
	{
		if (targetDistance > RANGED_MAX_DISTANCE)
		{
			return false;
		}
		if (!me->isInFront(pmTarget, M_PI / 16))
		{
			me->SetFacingToObject(pmTarget);
		}
	}
	me->Attack(pmTarget, true);
	if (pmTarget->GetHealthPercent() < 20.0f)
	{
		if (CastSpell(pmTarget, "Hammer of Wrath", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (me->HasAura(AURA_THE_ART_OF_WAR_1) || me->HasAura(AURA_THE_ART_OF_WAR_2))
	{
		if (CastSpell(pmTarget, "Exorcism", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (pmTarget->IsNonMeleeSpellCasted(false))
	{
		if (CastSpell(pmTarget, "Hammer of Justice", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (CastSpell(pmTarget, "Judgement of Wisdom", MELEE_MAX_DISTANCE))
	{
		return true;
	}
	if (CastSpell(pmTarget, "Crusader Strike", MELEE_MAX_DISTANCE))
	{
		return true;
	}
	return true;
}

bool Script_Paladin::DPS_Common(Unit* pmTarget, bool pmChase)
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
	else if (!me->IsValidAttackTarget(pmTarget))
	{
		return false;
	}
	float targetDistance = me->GetDistance(pmTarget);
	if (pmChase)
	{
		if (targetDistance > ATTACK_RANGE_LIMIT)
		{
			return false;
		}
		if (!Chase(pmTarget))
		{
			return false;
		}
	}
	else
	{
		if (targetDistance > RANGED_MAX_DISTANCE)
		{
			return false;
		}
		if (!me->isInFront(pmTarget, M_PI / 16))
		{
			me->SetFacingToObject(pmTarget);
		}
	}
	me->Attack(pmTarget, true);
	if (pmTarget->GetHealthPercent() < 20.0f)
	{
		if (CastSpell(pmTarget, "Hammer of Wrath", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (pmTarget->IsNonMeleeSpellCasted(false))
	{
		if (CastSpell(pmTarget, "Hammer of Justice", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (CastSpell(pmTarget, "Judgement of Light", MELEE_MAX_DISTANCE))
	{
		return true;
	}

	return true;
}

bool Script_Paladin::Attack(Unit* pmTarget)
{
	if (!me)
	{
		return false;
	}
	if (me->GetHealthPercent() < 20.0f)
	{
		UseHealingPotion();
	}
	if ((me->GetPower(Powers::POWER_MANA) * 100 / me->GetMaxPower(Powers::POWER_MANA)) < 30)
	{
		UseManaPotion();
	}
	uint32 characterTalentTab = me->GetMaxTalentCountTab();
	switch (characterTalentTab)
	{
	case 0:
	{
		return Attack_Common(pmTarget);
	}
	case 1:
	{
		return Attack_Common(pmTarget);
	}
	case 2:
	{
		return Attack_Retribution(pmTarget);
	}
	default:
		return Attack_Common(pmTarget);
	}
}

bool Script_Paladin::Attack_Retribution(Unit* pmTarget)
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
	else if (!me->IsValidAttackTarget(pmTarget))
	{
		return false;
	}
	if (me->GetDistance(pmTarget) > ATTACK_RANGE_LIMIT)
	{
		return false;
	}
	if (!Chase(pmTarget))
	{
		return false;
	}
	me->Attack(pmTarget, true);
	if (pmTarget->GetHealthPercent() < 20.0f)
	{
		if (CastSpell(pmTarget, "Hammer of Wrath", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (me->HasAura(AURA_THE_ART_OF_WAR_1) || me->HasAura(AURA_THE_ART_OF_WAR_2))
	{
		if (CastSpell(pmTarget, "Exorcism", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (pmTarget->IsNonMeleeSpellCasted(false))
	{
		if (CastSpell(pmTarget, "Hammer of Justice", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (CastSpell(pmTarget, "Judgement of Light", MELEE_MAX_DISTANCE))
	{
		return true;
	}
	if (CastSpell(pmTarget, "Crusader Strike", MELEE_MAX_DISTANCE))
	{
		return true;
	}

	return true;
}

bool Script_Paladin::Attack_Common(Unit* pmTarget)
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
	else if (!me->IsValidAttackTarget(pmTarget))
	{
		return false;
	}
	float targetDistance = me->GetDistance(pmTarget);
	if (targetDistance > ATTACK_RANGE_LIMIT)
	{
		return false;
	}
	if (!Chase(pmTarget))
	{
		return false;
	}
	me->Attack(pmTarget, true);
	if (pmTarget->GetHealthPercent() < 20.0f)
	{
		if (CastSpell(pmTarget, "Hammer of Wrath", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (pmTarget->IsNonMeleeSpellCasted(false))
	{
		if (CastSpell(pmTarget, "Hammer of Justice", MELEE_MAX_DISTANCE))
		{
			return true;
		}
	}
	if (CastSpell(pmTarget, "Judgement of Light", MELEE_MAX_DISTANCE))
	{
		return true;
	}

	return true;
}

bool Script_Paladin::Buff(Unit* pmTarget, bool pmCure)
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
	if (me->GetGUID() == pmTarget->GetGUID())
	{
		if (FindSpellID("Seal of Command"))
		{
			if (CastSpell(me, "Seal of Command", PALADIN_RANGE_DISTANCE, true))
			{
				return true;
			}
		}
		else
		{
			if (CastSpell(me, "Seal of Righteousness", PALADIN_RANGE_DISTANCE, true))
			{
				return true;
			}
		}
	}
	switch (auraType)
	{
	case PaladinAuraType::PaladinAuraType_Concentration:
	{
		if (CastSpell(me, "Concentration Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	case PaladinAuraType::PaladinAuraType_Devotion:
	{
		if (CastSpell(me, "Devotion Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	case PaladinAuraType::PaladinAuraType_Retribution:
	{
		if (CastSpell(me, "Retribution Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	case PaladinAuraType::PaladinAuraType_FireResistant:
	{
		if (CastSpell(me, "Fire Resistance Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	case PaladinAuraType::PaladinAuraType_FrostResistant:
	{
		if (CastSpell(me, "Frost Resistance Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	case PaladinAuraType::PaladinAuraType_ShadowResistant:
	{
		if (CastSpell(me, "Shadow Resistance Aura", PALADIN_RANGE_DISTANCE, true))
		{
			return true;
		}
		break;
	}
	default:
	{
		break;
	}
	}
	switch (blessingType)
	{
	case PaladinBlessingType::PaladinBlessingType_Kings:
	{
		if (!HasAura(pmTarget, "Blessing of Kings") && !HasAura(pmTarget, "Greater Blessing of Kings"))
		{
			if (FindSpellID("Greater Blessing of Kings"))
			{
				if (CastSpell(pmTarget, "Greater Blessing of Kings", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
			else
			{
				if (CastSpell(pmTarget, "Blessing of Kings", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
		}
		break;
	}
	case PaladinBlessingType::PaladinBlessingType_Might:
	{
		if (!HasAura(pmTarget, "Blessing of Might") && !HasAura(pmTarget, "Greater Blessing of Might"))
		{
			if (FindSpellID("Greater Blessing of Might"))
			{
				if (CastSpell(pmTarget, "Greater Blessing of Might", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
			else
			{
				if (CastSpell(pmTarget, "Blessing of Might", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
		}
		break;
	}
	case PaladinBlessingType::PaladinBlessingType_Wisdom:
	{
		if (!HasAura(pmTarget, "Blessing of Wisdom") && !HasAura(pmTarget, "Greater Blessing of Wisdom"))
		{
			if (FindSpellID("Greater Blessing of Wisdom"))
			{
				if (CastSpell(pmTarget, "Greater Blessing of Wisdom", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
			else
			{
				if (CastSpell(pmTarget, "Blessing of Wisdom", PALADIN_RANGE_DISTANCE, true))
				{
					return true;
				}
			}
		}
		break;
	}
	default:
	{
		break;
	}
	}
	if (pmCure)
	{
		if (pmTarget->HasAuraWithDispelType(DispelType::DISPEL_POISON))
		{
			if (CastSpell(pmTarget, "Purify"))
			{
				return true;
			}
		}
		if (pmTarget->HasAuraWithDispelType(DispelType::DISPEL_DISEASE))
		{
			if (CastSpell(pmTarget, "Purify"))
			{
				return true;
			}
		}
	}

	return false;
}
