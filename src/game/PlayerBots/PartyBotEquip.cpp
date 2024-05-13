#include "PartyBotEquip.h"
#include "PartyBotAI.h"

void PartyBotAI::PartyBotEquipPremadeGear(uint8 pLeaderItl, Player* pPlayer)
{
	PartyBotAI* pAI = dynamic_cast<PartyBotAI*>(pPlayer->AI());

	LearnArmorProficiencies();
	LearnAllTrainer();

	if (pLeaderItl <= 60)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankPreOne(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRoguePreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddPreOne(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMagePreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddPreOne(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealPreOne(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealPreOne(pPlayer);
		}

		pAI->m_equip = 1;
	}

	if (pLeaderItl > 60 && pLeaderItl <= 65)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankTwo(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRogueTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddTwo(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMageTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddTwo(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealTwo(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealTwo(pPlayer);
		}

		pAI->m_equip = 2;
	}

	if (pLeaderItl > 65 && pLeaderItl <= 70)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankThree(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRogueThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddThree(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMageThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddThree(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealThree(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealThree(pPlayer);
		}

		pAI->m_equip = 3;
	}

	if (pLeaderItl > 70 && pLeaderItl <= 75)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankFour(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRogueFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddFour(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMageFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddFour(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealFour(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealFour(pPlayer);
		}

		pAI->m_equip = 4;
	}

	if (pLeaderItl > 75 && pLeaderItl <= 80)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankFive(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRogueFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddFive(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMageFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddFive(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealFive(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealFive(pPlayer);
		}

		pAI->m_equip = 5;
	}

	if (pLeaderItl > 80)
	{
		if (m_role == ROLE_TANK)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorTankSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinTankSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidTankSix(pPlayer);
		}

		if (m_role == ROLE_MELEE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARRIOR)
				PartyBotEquipWarriorMddSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanMddSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_ROGUE)
				PartyBotEquipRogueSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinMddSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidMddSix(pPlayer);
		}

		if (m_role == ROLE_RANGE_DPS)
		{
			if (pPlayer->GetClass() == CLASS_WARLOCK)
				PartyBotEquipWarlockSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanRddSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestRddSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_MAGE)
				PartyBotEquipMageSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_HUNTER)
				PartyBotEquipHunterSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidRddSix(pPlayer);
		}

		if (m_role == ROLE_HEALER)
		{
			if (pPlayer->GetClass() == CLASS_SHAMAN)
				PartyBotEquipShamanHealSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_PRIEST)
				PartyBotEquipPriestHealSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_PALADIN)
				PartyBotEquipPaladinHealSix(pPlayer);
			if (pPlayer->GetClass() == CLASS_DRUID)
				PartyBotEquipDruidHealSix(pPlayer);
		}

		pAI->m_equip = 6;
	}
}

void PartyBotEquipItems(Player* pPlayer, std::vector<PlayerPremadeItem const*> equip)
{
	for (uint32 i = 0; i < equip.size(); i++)
	{
		pPlayer->SatisfyItemRequirements(sObjectMgr.GetItemPrototype(equip[i]->itemId));
		pPlayer->StoreNewItemInBestSlots(equip[i]->itemId, 1, equip[i]->enchantId);
	}
}

void PartyBotEquipWarriorTankPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12952, 0, 0));
	equip.push_back(new PlayerPremadeItem(13091, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2488, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 18413 : 18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(14624, 1892, 0));
	equip.push_back(new PlayerPremadeItem(12550, urand(0, 1) ? 923 : 1886, 0));
	equip.push_back(new PlayerPremadeItem(13072, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13142, 0, 0));
	equip.push_back(new PlayerPremadeItem(11927, 0, 0));
	equip.push_back(new PlayerPremadeItem(14621, 911, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(15806, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12602, 929, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12651 : 18323, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16963, 1503, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(16868, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(16865, 2503, 0));
	equip.push_back(new PlayerPremadeItem(12936, 923, 0));
	equip.push_back(new PlayerPremadeItem(16863, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16864, 0, 0));
	equip.push_back(new PlayerPremadeItem(16962, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16862, 2503, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(18348, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17066, 20017, 0));
	equip.push_back(new PlayerPremadeItem(18323, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16963, 1503, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(16961, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(16966, 1892, 0));
	equip.push_back(new PlayerPremadeItem(12936, 923, 0));
	equip.push_back(new PlayerPremadeItem(16863, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16864, 0, 0));
	equip.push_back(new PlayerPremadeItem(16962, 1503, 0));
	equip.push_back(new PlayerPremadeItem(16965, 911, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19335, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19349, 929, 0));
	equip.push_back(new PlayerPremadeItem(19368, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16963, 2583, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(16961, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(16966, 1892, 0));
	equip.push_back(new PlayerPremadeItem(12936, 923, 0));
	equip.push_back(new PlayerPremadeItem(16863, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16864, 0, 0));
	equip.push_back(new PlayerPremadeItem(16962, 2583, 0));
	equip.push_back(new PlayerPremadeItem(16965, 911, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19363, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19349, 929, 0));
	equip.push_back(new PlayerPremadeItem(19368, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21329, 2583, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(21330, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21621, 903, 0));
	equip.push_back(new PlayerPremadeItem(21331, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16959, 1886, 0));
	equip.push_back(new PlayerPremadeItem(21674, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21598, 0, 0));
	equip.push_back(new PlayerPremadeItem(21332, 2583, 0));
	equip.push_back(new PlayerPremadeItem(21333, 1887, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19363, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21269, 929, 0));
	equip.push_back(new PlayerPremadeItem(19368, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22418, 2583, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(22419, 2716, 0));
	equip.push_back(new PlayerPremadeItem(22938, 2622, 0));
	equip.push_back(new PlayerPremadeItem(22416, 1892, 0));
	equip.push_back(new PlayerPremadeItem(22423, 1886, 0));
	equip.push_back(new PlayerPremadeItem(22421, 2613, 0));
	equip.push_back(new PlayerPremadeItem(22422, 0, 0));
	equip.push_back(new PlayerPremadeItem(22417, 2583, 0));
	equip.push_back(new PlayerPremadeItem(22420, 911, 0));
	equip.push_back(new PlayerPremadeItem(23059, 0, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(23577, 1900, 0));
	equip.push_back(new PlayerPremadeItem(23043, 929, 0));
	equip.push_back(new PlayerPremadeItem(19368, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, 0, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(12936, 1885, 0));
	equip.push_back(new PlayerPremadeItem(15063, 927, 0));
	equip.push_back(new PlayerPremadeItem(13959, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 0, 0));
	equip.push_back(new PlayerPremadeItem(12555, 911, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(13098, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(12940, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12939, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12651, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, 1506, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(14551, 927, 0));
	equip.push_back(new PlayerPremadeItem(19137, 0, 0));
	equip.push_back(new PlayerPremadeItem(14554, 1506, 0));
	equip.push_back(new PlayerPremadeItem(14616, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(17075, 1900, 0));
	equip.push_back(new PlayerPremadeItem(18832, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, 1506, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(19394, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(14551, 927, 0));
	equip.push_back(new PlayerPremadeItem(19137, 0, 0));
	equip.push_back(new PlayerPremadeItem(19402, 1506, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19352, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19351, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12640, 1506, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(19394, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(14551, 927, 0));
	equip.push_back(new PlayerPremadeItem(19137, 0, 0));
	equip.push_back(new PlayerPremadeItem(19402, 1506, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19352, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19351, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12640, 1506, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21330, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21701, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21814, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21618, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21581, 927, 0));
	equip.push_back(new PlayerPremadeItem(19137, 0, 0));
	equip.push_back(new PlayerPremadeItem(22385, 1506, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(21670, 0, 0));
	equip.push_back(new PlayerPremadeItem(21650, 1900, 0));
	equip.push_back(new PlayerPremadeItem(21650, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorMddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12640, 1506, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21330, 2717, 0));
	equip.push_back(new PlayerPremadeItem(23045, 2621, 0));
	equip.push_back(new PlayerPremadeItem(23000, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22936, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21581, 927, 0));
	equip.push_back(new PlayerPremadeItem(19137, 0, 0));
	equip.push_back(new PlayerPremadeItem(22385, 1506, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(23038, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(21670, 0, 0));
	equip.push_back(new PlayerPremadeItem(23054, 1900, 0));
	equip.push_back(new PlayerPremadeItem(23577, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 0, 0));
	equip.push_back(new PlayerPremadeItem(18691, 0, 0));
	equip.push_back(new PlayerPremadeItem(14112, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14153, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13107, 1883, 0));
	equip.push_back(new PlayerPremadeItem(13253, 0, 0));
	equip.push_back(new PlayerPremadeItem(13956, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18735, 911, 0));
	equip.push_back(new PlayerPremadeItem(12545, 0, 0));
	equip.push_back(new PlayerPremadeItem(13001, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(13968, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13964 : 18372, 0, 0));
	equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13396 : 18467, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16929, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(14112, 2488, 0));
	equip.push_back(new PlayerPremadeItem(17078, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18497, 1883, 0));
	equip.push_back(new PlayerPremadeItem(18407, 0, 0));
	equip.push_back(new PlayerPremadeItem(18809, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18735, 911, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(17103, 2504, 0));
	equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	equip.push_back(new PlayerPremadeItem(13396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(19407, 0, 0));
	equip.push_back(new PlayerPremadeItem(18809, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18735, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19434, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19356, 2504, 0));
	equip.push_back(new PlayerPremadeItem(13396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2589, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19857, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(19407, 0, 0));
	equip.push_back(new PlayerPremadeItem(18809, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2589, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19434, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19356, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19861, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21337, 2589, 0));
	equip.push_back(new PlayerPremadeItem(21608, 0, 0));
	equip.push_back(new PlayerPremadeItem(21335, 2605, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21186, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2614, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2589, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(21417, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(21622, 2504, 0));
	equip.push_back(new PlayerPremadeItem(21597, 0, 0));
	equip.push_back(new PlayerPremadeItem(21603, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarlockSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22506, 2589, 0));
	equip.push_back(new PlayerPremadeItem(21608, 0, 0));
	equip.push_back(new PlayerPremadeItem(22507, 2721, 0));
	equip.push_back(new PlayerPremadeItem(23050, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22504, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21186, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2614, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(23070, 2589, 0));
	equip.push_back(new PlayerPremadeItem(22508, 911, 0));
	equip.push_back(new PlayerPremadeItem(23031, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(23046, 0, 0));
	equip.push_back(new PlayerPremadeItem(22807, 2504, 0));
	equip.push_back(new PlayerPremadeItem(23049, 0, 0));
	equip.push_back(new PlayerPremadeItem(22820, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12587, 0, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13211, 1885, 0));
	equip.push_back(new PlayerPremadeItem(13957, 1887, 0));
	equip.push_back(new PlayerPremadeItem(22232, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 0, 0));
	equip.push_back(new PlayerPremadeItem(14616, 911, 0));
	equip.push_back(new PlayerPremadeItem(13098, 0, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(12784, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18817, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22232, 1885, 0));
	equip.push_back(new PlayerPremadeItem(13957, 1887, 0));
	equip.push_back(new PlayerPremadeItem(18393, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(14616, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(17104, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18817, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(19157, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19380, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(17104, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18817, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2606, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(19157, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19380, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(17104, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18817, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21684, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21701, 849, 0));
	equip.push_back(new PlayerPremadeItem(21374, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21602, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21624, 1887, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(21651, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21705, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(22321, 0, 0));
	equip.push_back(new PlayerPremadeItem(19289, 0, 0));
	equip.push_back(new PlayerPremadeItem(21134, 1900, 0));
	equip.push_back(new PlayerPremadeItem(22395, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanMddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18817, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21684, 2606, 0));
	equip.push_back(new PlayerPremadeItem(23045, 849, 0));
	equip.push_back(new PlayerPremadeItem(21374, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21602, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21624, 1887, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(21651, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21705, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(23038, 0, 0));
	equip.push_back(new PlayerPremadeItem(22321, 0, 0));
	equip.push_back(new PlayerPremadeItem(19289, 0, 0));
	equip.push_back(new PlayerPremadeItem(22798, 1900, 0));
	equip.push_back(new PlayerPremadeItem(22395, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, urand(0, 1) ? 2544 : 0, 0));
	equip.push_back(new PlayerPremadeItem(13141, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13013 : 18494, 2488, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 15421 : 18496, 1888, 0));
	equip.push_back(new PlayerPremadeItem(11924, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13107, 1883, 0));
	equip.push_back(new PlayerPremadeItem(13253, 0, 0));
	equip.push_back(new PlayerPremadeItem(13956, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 0, 0));
	equip.push_back(new PlayerPremadeItem(13954, 911, 0));
	equip.push_back(new PlayerPremadeItem(12545, 0, 0));
	equip.push_back(new PlayerPremadeItem(13001, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(13968, 0, 0));

	if (urand(0, 1))
	{
		equip.push_back(new PlayerPremadeItem(13964, 0, 0));
		equip.push_back(new PlayerPremadeItem(11904, 0, 0));
	}
	else
		equip.push_back(new PlayerPremadeItem(18534, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(18829, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18496, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18497, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16839, 0, 0));
	equip.push_back(new PlayerPremadeItem(19136, 0, 0));
	equip.push_back(new PlayerPremadeItem(16946, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18322, 911, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(18842, 2504, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(18829, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 20025, 0));
	equip.push_back(new PlayerPremadeItem(19374, 2565, 0));
	equip.push_back(new PlayerPremadeItem(16839, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(16946, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18322, 911, 0));
	equip.push_back(new PlayerPremadeItem(19397, 0, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19344, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(18829, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19857, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 2565, 0));
	equip.push_back(new PlayerPremadeItem(16839, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2587, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(19397, 0, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19344, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21608, 0, 0));
	equip.push_back(new PlayerPremadeItem(21376, 2605, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21671, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21464, 2565, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2617, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(21375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21373, 911, 0));
	equip.push_back(new PlayerPremadeItem(21707, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19344, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));
	equip.push_back(new PlayerPremadeItem(23199, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanRddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(22943, 0, 0));
	equip.push_back(new PlayerPremadeItem(21376, 2721, 0));
	equip.push_back(new PlayerPremadeItem(23050, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21671, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21464, 2565, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2617, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(21375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21373, 911, 0));
	equip.push_back(new PlayerPremadeItem(21707, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(23046, 0, 0));
	equip.push_back(new PlayerPremadeItem(22988, 2504, 0));
	equip.push_back(new PlayerPremadeItem(23049, 929, 0));
	equip.push_back(new PlayerPremadeItem(23199, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13216, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 15061 : 18757, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(12554, 0, 0));
	equip.push_back(new PlayerPremadeItem(14553, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13170 : 18386, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(13954, 911, 0));
	equip.push_back(new PlayerPremadeItem(16058, 0, 0));
	equip.push_back(new PlayerPremadeItem(13178, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(11923, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16842, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(12554, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(18875, 2544, 0));
	equip.push_back(new PlayerPremadeItem(13954, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(17105, 22750, 0));
	equip.push_back(new PlayerPremadeItem(18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16947, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19371, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16943, 2565, 0));
	equip.push_back(new PlayerPremadeItem(16948, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(18875, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19391, 911, 0));
	equip.push_back(new PlayerPremadeItem(19397, 0, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(19347, 22750, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16947, 2587, 0));
	equip.push_back(new PlayerPremadeItem(19371, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2604, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16943, 2565, 0));
	equip.push_back(new PlayerPremadeItem(16948, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(18875, 2587, 0));
	equip.push_back(new PlayerPremadeItem(19391, 911, 0));
	equip.push_back(new PlayerPremadeItem(19397, 0, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(19347, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21372, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(21376, 2604, 0));
	equip.push_back(new PlayerPremadeItem(21583, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21374, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16943, 2565, 0));
	equip.push_back(new PlayerPremadeItem(16948, 2617, 0));
	equip.push_back(new PlayerPremadeItem(16944, 0, 0));
	equip.push_back(new PlayerPremadeItem(21375, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21373, 911, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(21681, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(21839, 2505, 0));
	equip.push_back(new PlayerPremadeItem(21610, 929, 0));
	equip.push_back(new PlayerPremadeItem(22396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipShamanHealSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22466, 2587, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(22467, 2715, 0));
	equip.push_back(new PlayerPremadeItem(21583, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22464, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22471, 2565, 0));
	equip.push_back(new PlayerPremadeItem(21619, 2617, 0));
	equip.push_back(new PlayerPremadeItem(22470, 0, 0));
	equip.push_back(new PlayerPremadeItem(22465, 2587, 0));
	equip.push_back(new PlayerPremadeItem(22468, 911, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(23065, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(23056, 2505, 0));
	equip.push_back(new PlayerPremadeItem(22819, 929, 0));
	equip.push_back(new PlayerPremadeItem(22396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRoguePreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, 0, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(14637, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13120, 1885, 0));
	equip.push_back(new PlayerPremadeItem(15063, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13252, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(12553, 911, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13098 : 18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 17713 : 18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(12940, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12939, 1900, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12651 : 18323, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRogueTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16908, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(16823, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(16820, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18375, 1885, 0));
	equip.push_back(new PlayerPremadeItem(16826, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16827, 0, 0));
	equip.push_back(new PlayerPremadeItem(16909, 1508, 0));
	equip.push_back(new PlayerPremadeItem(16824, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(17075, 1900, 0));
	equip.push_back(new PlayerPremadeItem(18832, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRogueThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16908, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(16832, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19398, 849, 0));
	equip.push_back(new PlayerPremadeItem(16905, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16911, 1885, 0));
	equip.push_back(new PlayerPremadeItem(16907, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16910, 0, 0));
	equip.push_back(new PlayerPremadeItem(16909, 1508, 0));
	equip.push_back(new PlayerPremadeItem(16906, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19352, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19351, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRogueFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16908, 2585, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(16832, 2606, 0));
	equip.push_back(new PlayerPremadeItem(19398, 849, 0));
	equip.push_back(new PlayerPremadeItem(16905, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16911, 1885, 0));
	equip.push_back(new PlayerPremadeItem(16907, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16910, 0, 0));
	equip.push_back(new PlayerPremadeItem(16909, 2585, 0));
	equip.push_back(new PlayerPremadeItem(16906, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19352, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19351, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRogueFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21360, 2585, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(21361, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21701, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21364, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21602, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21672, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(21362, 2585, 0));
	equip.push_back(new PlayerPremadeItem(21359, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(23570, 0, 0));
	equip.push_back(new PlayerPremadeItem(21650, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19351, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17069, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipRogueSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22478, 2585, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(22479, 2717, 0));
	equip.push_back(new PlayerPremadeItem(23045, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22476, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22483, 1885, 0));
	equip.push_back(new PlayerPremadeItem(22481, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(22477, 2585, 0));
	equip.push_back(new PlayerPremadeItem(22480, 911, 0));
	equip.push_back(new PlayerPremadeItem(23060, 0, 0));
	equip.push_back(new PlayerPremadeItem(23038, 0, 0));
	equip.push_back(new PlayerPremadeItem(23041, 0, 0));
	equip.push_back(new PlayerPremadeItem(22954, 0, 0));
	equip.push_back(new PlayerPremadeItem(23054, 1900, 0));
	equip.push_back(new PlayerPremadeItem(23577, 1900, 0));
	equip.push_back(new PlayerPremadeItem(22812, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 0, 0));
	equip.push_back(new PlayerPremadeItem(18691, 0, 0));
	equip.push_back(new PlayerPremadeItem(14112, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14136, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13107, 1884, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13253 : 18407, 0, 0));
	equip.push_back(new PlayerPremadeItem(13956, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 0, 0));
	equip.push_back(new PlayerPremadeItem(18735, 911, 0));
	equip.push_back(new PlayerPremadeItem(12545, 0, 0));
	equip.push_back(new PlayerPremadeItem(13001, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(13349, 0, 0));
	equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	equip.push_back(new PlayerPremadeItem(13396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(14112, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14136, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18497, 1884, 0));
	equip.push_back(new PlayerPremadeItem(18407, 0, 0));
	equip.push_back(new PlayerPremadeItem(18809, 0, 0));
	equip.push_back(new PlayerPremadeItem(19133, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19131, 911, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(18609, 2504, 0));
	equip.push_back(new PlayerPremadeItem(13396, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14136, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 2565, 0));
	equip.push_back(new PlayerPremadeItem(19407, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19133, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19131, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19434, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));
	equip.push_back(new PlayerPremadeItem(13938, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19886, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19857, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 2565, 0));
	equip.push_back(new PlayerPremadeItem(19407, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19133, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19131, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19434, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));
	equip.push_back(new PlayerPremadeItem(19861, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21348, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21351, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21611, 2565, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2614, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19133, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19131, 911, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(21210, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19366, 0, 0));
	equip.push_back(new PlayerPremadeItem(21603, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestRddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(23035, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(22983, 2721, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(23220, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21611, 2565, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2614, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19133, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19131, 911, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(21210, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(23046, 0, 0));
	equip.push_back(new PlayerPremadeItem(22988, 2504, 0));
	equip.push_back(new PlayerPremadeItem(23049, 0, 0));
	equip.push_back(new PlayerPremadeItem(21603, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13102, 0, 0));
	equip.push_back(new PlayerPremadeItem(13141, 0, 0));
	equip.push_back(new PlayerPremadeItem(13013, 2488, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14154, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13107, 1884, 0));
	equip.push_back(new PlayerPremadeItem(12554, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 14143 : 18327, 0, 0));
	equip.push_back(new PlayerPremadeItem(11841, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(11822, 911, 0));
	equip.push_back(new PlayerPremadeItem(16058, 0, 0));
	equip.push_back(new PlayerPremadeItem(13178, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18469, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(11923, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));
	equip.push_back(new PlayerPremadeItem(16997, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16921, 2544, 0));
	equip.push_back(new PlayerPremadeItem(17109, 0, 0));
	equip.push_back(new PlayerPremadeItem(16816, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14154, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16819, 1884, 0));
	equip.push_back(new PlayerPremadeItem(16812, 0, 0));
	equip.push_back(new PlayerPremadeItem(16817, 0, 0));
	equip.push_back(new PlayerPremadeItem(16922, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16811, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(18469, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(18608, 2505, 0));
	equip.push_back(new PlayerPremadeItem(18483, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16921, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(16924, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(16923, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16926, 1884, 0));
	equip.push_back(new PlayerPremadeItem(16920, 0, 0));
	equip.push_back(new PlayerPremadeItem(16925, 0, 0));
	equip.push_back(new PlayerPremadeItem(16922, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16919, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(18608, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19435, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16921, 2590, 0));
	equip.push_back(new PlayerPremadeItem(19885, 0, 0));
	equip.push_back(new PlayerPremadeItem(16924, 2604, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(16923, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16926, 1884, 0));
	equip.push_back(new PlayerPremadeItem(16920, 0, 0));
	equip.push_back(new PlayerPremadeItem(16925, 0, 0));
	equip.push_back(new PlayerPremadeItem(16922, 2590, 0));
	equip.push_back(new PlayerPremadeItem(16919, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(18608, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19435, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21615, 2590, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(16924, 2604, 0));
	equip.push_back(new PlayerPremadeItem(21583, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21663, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16926, 1884, 0));
	equip.push_back(new PlayerPremadeItem(21619, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(16922, 2590, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(21839, 2505, 0));
	equip.push_back(new PlayerPremadeItem(21666, 0, 0));
	equip.push_back(new PlayerPremadeItem(21801, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPriestHealSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22514, 2590, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(22515, 2715, 0));
	equip.push_back(new PlayerPremadeItem(22960, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22512, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21604, 1884, 0));
	equip.push_back(new PlayerPremadeItem(22517, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(22513, 2590, 0));
	equip.push_back(new PlayerPremadeItem(22516, 911, 0));
	equip.push_back(new PlayerPremadeItem(23061, 0, 0));
	equip.push_back(new PlayerPremadeItem(22939, 0, 0));
	equip.push_back(new PlayerPremadeItem(23027, 0, 0));
	equip.push_back(new PlayerPremadeItem(23047, 0, 0));
	equip.push_back(new PlayerPremadeItem(23056, 2505, 0));
	equip.push_back(new PlayerPremadeItem(23048, 0, 0));
	equip.push_back(new PlayerPremadeItem(23009, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12952, 0, 0));
	equip.push_back(new PlayerPremadeItem(13091, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18413, 1889, 0));
	equip.push_back(new PlayerPremadeItem(14624, 1892, 0));
	equip.push_back(new PlayerPremadeItem(12550, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 1887, 0));
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(11927, 0, 0));
	equip.push_back(new PlayerPremadeItem(14621, 911, 0));
	equip.push_back(new PlayerPremadeItem(11669, 0, 0));
	equip.push_back(new PlayerPremadeItem(22331, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(10779, 0, 0));
	equip.push_back(new PlayerPremadeItem(15806, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12602, 929, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12952, 0, 0));
	equip.push_back(new PlayerPremadeItem(13091, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18413, 1889, 0));
	equip.push_back(new PlayerPremadeItem(14624, 1892, 0));
	equip.push_back(new PlayerPremadeItem(12550, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 1887, 0));
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(11927, 0, 0));
	equip.push_back(new PlayerPremadeItem(14621, 911, 0));
	equip.push_back(new PlayerPremadeItem(11669, 0, 0));
	equip.push_back(new PlayerPremadeItem(22331, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(10779, 0, 0));
	equip.push_back(new PlayerPremadeItem(15806, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12602, 929, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12620, 1483, 0));
	equip.push_back(new PlayerPremadeItem(19383, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(12618, 2503, 0));
	equip.push_back(new PlayerPremadeItem(18754, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 2503, 0));
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(12619, 2503, 0));
	equip.push_back(new PlayerPremadeItem(18806, 2503, 0));
	equip.push_back(new PlayerPremadeItem(10795, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19335, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19349, 929, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16955, 2584, 0));
	equip.push_back(new PlayerPremadeItem(19383, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19888, 1889, 0));
	equip.push_back(new PlayerPremadeItem(12618, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16951, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 2503, 0));
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(19855, 2584, 0));
	equip.push_back(new PlayerPremadeItem(16957, 2503, 0));
	equip.push_back(new PlayerPremadeItem(19912, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19335, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19349, 929, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21387, 2584, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(21639, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19888, 1889, 0));
	equip.push_back(new PlayerPremadeItem(21389, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16951, 923, 0));
	equip.push_back(new PlayerPremadeItem(21674, 2503, 0));
	equip.push_back(new PlayerPremadeItem(21598, 0, 0));
	equip.push_back(new PlayerPremadeItem(19855, 2584, 0));
	equip.push_back(new PlayerPremadeItem(21706, 2503, 0));
	equip.push_back(new PlayerPremadeItem(21200, 0, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19335, 2504, 0));
	equip.push_back(new PlayerPremadeItem(21269, 929, 0));
	equip.push_back(new PlayerPremadeItem(22401, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinTankSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21387, 2584, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(21639, 2721, 0));
	equip.push_back(new PlayerPremadeItem(22938, 1889, 0));
	equip.push_back(new PlayerPremadeItem(21389, 2503, 0));
	equip.push_back(new PlayerPremadeItem(18754, 2503, 0));
	equip.push_back(new PlayerPremadeItem(21674, 2503, 0));
	equip.push_back(new PlayerPremadeItem(21598, 0, 0));
	equip.push_back(new PlayerPremadeItem(19855, 2584, 0));
	equip.push_back(new PlayerPremadeItem(21706, 2503, 0));
	equip.push_back(new PlayerPremadeItem(21200, 0, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(23577, 2504, 0));
	equip.push_back(new PlayerPremadeItem(22818, 929, 0));
	equip.push_back(new PlayerPremadeItem(22401, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(12936, 1885, 0));
	equip.push_back(new PlayerPremadeItem(13957, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13959, 0, 0));
	equip.push_back(new PlayerPremadeItem(14554, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(14616, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13098, 0, 0));
	equip.push_back(new PlayerPremadeItem(12548, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(12784, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12952, 1483, 0));
	equip.push_back(new PlayerPremadeItem(17065, 0, 0));
	equip.push_back(new PlayerPremadeItem(14552, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(14624, 2503, 0));
	equip.push_back(new PlayerPremadeItem(18754, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 2503, 0));
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(11927, 2503, 0));
	equip.push_back(new PlayerPremadeItem(18806, 2503, 0));
	equip.push_back(new PlayerPremadeItem(19138, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(18348, 2504, 0));
	equip.push_back(new PlayerPremadeItem(17066, 929, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13404, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(19394, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(19143, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19380, 0, 0));
	equip.push_back(new PlayerPremadeItem(19402, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19387, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19432, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19334, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(12640, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(19394, 2606, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(19143, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19380, 0, 0));
	equip.push_back(new PlayerPremadeItem(19402, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19387, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19432, 0, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19334, 1900, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21387, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21391, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21701, 849, 0));
	equip.push_back(new PlayerPremadeItem(21389, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21618, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21623, 1887, 0));
	equip.push_back(new PlayerPremadeItem(21463, 0, 0));
	equip.push_back(new PlayerPremadeItem(21390, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21388, 1887, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(21205, 0, 0));
	equip.push_back(new PlayerPremadeItem(22321, 0, 0));
	equip.push_back(new PlayerPremadeItem(19289, 0, 0));
	equip.push_back(new PlayerPremadeItem(21134, 1900, 0));
	equip.push_back(new PlayerPremadeItem(23203, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinMddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21387, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(21391, 2721, 0));
	equip.push_back(new PlayerPremadeItem(23045, 849, 0));
	equip.push_back(new PlayerPremadeItem(21389, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22936, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21623, 1887, 0));
	equip.push_back(new PlayerPremadeItem(23219, 0, 0));
	equip.push_back(new PlayerPremadeItem(21390, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21388, 1887, 0));
	equip.push_back(new PlayerPremadeItem(23038, 0, 0));
	equip.push_back(new PlayerPremadeItem(21205, 0, 0));
	equip.push_back(new PlayerPremadeItem(22321, 0, 0));
	equip.push_back(new PlayerPremadeItem(19289, 0, 0));
	equip.push_back(new PlayerPremadeItem(22691, 1900, 0));
	equip.push_back(new PlayerPremadeItem(23203, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12633 : 18490, urand(0, 1) ? 0 : 1509, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(18720, 2488, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12554 : 18527, 0, 0));
	equip.push_back(new PlayerPremadeItem(18702, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13170 : 18386, urand(0, 1) ? 0 : 1509, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13954 : 18507, 911, 0));
	equip.push_back(new PlayerPremadeItem(16058, 0, 0));
	equip.push_back(new PlayerPremadeItem(18103, 0, 0));
	equip.push_back(new PlayerPremadeItem(11819, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(11923, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(18490, 1509, 0));
	equip.push_back(new PlayerPremadeItem(18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(18527, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(18875, 1509, 0));
	equip.push_back(new PlayerPremadeItem(18507, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(17103, 2505, 0));
	equip.push_back(new PlayerPremadeItem(18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 1509, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(19390, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(19385, 1509, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2584, 0));
	equip.push_back(new PlayerPremadeItem(19885, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2604, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13969, 1883, 0));
	equip.push_back(new PlayerPremadeItem(20264, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(19385, 2584, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2584, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2604, 0));
	equip.push_back(new PlayerPremadeItem(21583, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21663, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21604, 1883, 0));
	equip.push_back(new PlayerPremadeItem(20264, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(21667, 2584, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(21839, 2505, 0));
	equip.push_back(new PlayerPremadeItem(21666, 0, 0));
	equip.push_back(new PlayerPremadeItem(22402, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipPaladinHealSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2584, 0));
	equip.push_back(new PlayerPremadeItem(23057, 0, 0));
	equip.push_back(new PlayerPremadeItem(22429, 2715, 0));
	equip.push_back(new PlayerPremadeItem(23050, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22425, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21604, 1883, 0));
	equip.push_back(new PlayerPremadeItem(20264, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(22427, 2584, 0));
	equip.push_back(new PlayerPremadeItem(22430, 911, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(23066, 0, 0));
	equip.push_back(new PlayerPremadeItem(23047, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(23056, 2505, 0));
	equip.push_back(new PlayerPremadeItem(23075, 929, 0));
	equip.push_back(new PlayerPremadeItem(23006, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMagePreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(12103, 0, 0));
	equip.push_back(new PlayerPremadeItem(11782, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14152, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13107, 1883, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13253 : 23290, 0, 0));
	equip.push_back(new PlayerPremadeItem(11662, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(11822, 911, 0));
	equip.push_back(new PlayerPremadeItem(942, 0, 0));
	equip.push_back(new PlayerPremadeItem(942, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(13968, 0, 0));
	equip.push_back(new PlayerPremadeItem(13964, 0, 0));
	equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	equip.push_back(new PlayerPremadeItem(13938, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMageTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16914, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(11782, 2488, 0));
	equip.push_back(new PlayerPremadeItem(17078, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14152, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18497, 1883, 0));
	equip.push_back(new PlayerPremadeItem(23290, 0, 0));
	equip.push_back(new PlayerPremadeItem(19136, 0, 0));
	equip.push_back(new PlayerPremadeItem(16915, 2544, 0));
	equip.push_back(new PlayerPremadeItem(23291, 911, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(17103, 2504, 0));
	equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	equip.push_back(new PlayerPremadeItem(13938, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMageThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(14152, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16913, 0, 0));
	equip.push_back(new PlayerPremadeItem(19136, 0, 0));
	equip.push_back(new PlayerPremadeItem(16915, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19438, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19339, 0, 0));
	equip.push_back(new PlayerPremadeItem(19356, 2504, 0));
	equip.push_back(new PlayerPremadeItem(13938, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMageFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2588, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19857, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16913, 0, 0));
	equip.push_back(new PlayerPremadeItem(19136, 0, 0));
	equip.push_back(new PlayerPremadeItem(16915, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19438, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19339, 0, 0));
	equip.push_back(new PlayerPremadeItem(19356, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19861, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMageFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2588, 0));
	equip.push_back(new PlayerPremadeItem(21608, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21186, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2616, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(21461, 2588, 0));
	equip.push_back(new PlayerPremadeItem(21344, 911, 0));
	equip.push_back(new PlayerPremadeItem(21836, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(19339, 0, 0));
	equip.push_back(new PlayerPremadeItem(21622, 2504, 0));
	equip.push_back(new PlayerPremadeItem(21597, 0, 0));
	equip.push_back(new PlayerPremadeItem(19861, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipMageSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22498, 2588, 0));
	equip.push_back(new PlayerPremadeItem(23057, 0, 0));
	equip.push_back(new PlayerPremadeItem(22983, 2721, 0));
	equip.push_back(new PlayerPremadeItem(23050, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22496, 1891, 0));
	equip.push_back(new PlayerPremadeItem(23021, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2616, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(23070, 2588, 0));
	equip.push_back(new PlayerPremadeItem(22500, 911, 0));
	equip.push_back(new PlayerPremadeItem(23237, 0, 0));
	equip.push_back(new PlayerPremadeItem(23062, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(23046, 0, 0));
	equip.push_back(new PlayerPremadeItem(22807, 2504, 0));
	equip.push_back(new PlayerPremadeItem(23049, 0, 0));
	equip.push_back(new PlayerPremadeItem(22821, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13404 : 18421, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(11726, 1891, 0));
	equip.push_back(new PlayerPremadeItem(13211, 1883, 0));
	equip.push_back(new PlayerPremadeItem(15063, 1887, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 14502 : 18393, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(13967, 911, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13098 : 18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 17713 : 18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11815 : 18473, 0, 0));
	equip.push_back(new PlayerPremadeItem(12940, 2564, 0));
	equip.push_back(new PlayerPremadeItem(12939, 2564, 0));
	equip.push_back(new PlayerPremadeItem(2099, 664, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16846, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(16848, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(16845, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16850, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16852, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16851, 0, 0));
	equip.push_back(new PlayerPremadeItem(16847, 1508, 0));
	equip.push_back(new PlayerPremadeItem(16849, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(18473, 0, 0));
	equip.push_back(new PlayerPremadeItem(18832, 2564, 0));
	equip.push_back(new PlayerPremadeItem(18805, 2564, 0));
	equip.push_back(new PlayerPremadeItem(18713, 2523, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16939, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(16937, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(16942, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16935, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16940, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16936, 0, 0));
	equip.push_back(new PlayerPremadeItem(16938, 1508, 0));
	equip.push_back(new PlayerPremadeItem(16941, 911, 0));
	equip.push_back(new PlayerPremadeItem(19325, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(18832, 2564, 0));
	equip.push_back(new PlayerPremadeItem(18805, 2564, 0));
	equip.push_back(new PlayerPremadeItem(19361, 2523, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16939, 2586, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(16937, 2606, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(16942, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16935, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16940, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16936, 0, 0));
	equip.push_back(new PlayerPremadeItem(16938, 2586, 0));
	equip.push_back(new PlayerPremadeItem(16941, 911, 0));
	equip.push_back(new PlayerPremadeItem(19325, 0, 0));
	equip.push_back(new PlayerPremadeItem(18821, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19865, 2564, 0));
	equip.push_back(new PlayerPremadeItem(19859, 2564, 0));
	equip.push_back(new PlayerPremadeItem(19361, 2523, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16939, 2586, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(16937, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21710, 849, 0));
	equip.push_back(new PlayerPremadeItem(16942, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16935, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16940, 2564, 0));
	equip.push_back(new PlayerPremadeItem(16936, 0, 0));
	equip.push_back(new PlayerPremadeItem(16938, 2586, 0));
	equip.push_back(new PlayerPremadeItem(16941, 911, 0));
	equip.push_back(new PlayerPremadeItem(19325, 0, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(21670, 0, 0));
	equip.push_back(new PlayerPremadeItem(23570, 0, 0));
	equip.push_back(new PlayerPremadeItem(21673, 2564, 0));
	equip.push_back(new PlayerPremadeItem(19859, 2564, 0));
	equip.push_back(new PlayerPremadeItem(19361, 2523, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipHunterSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(22438, 2586, 0));
	equip.push_back(new PlayerPremadeItem(23053, 0, 0));
	equip.push_back(new PlayerPremadeItem(22439, 2717, 0));
	equip.push_back(new PlayerPremadeItem(23045, 849, 0));
	equip.push_back(new PlayerPremadeItem(22436, 1891, 0));
	equip.push_back(new PlayerPremadeItem(22443, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16571, 2564, 0));
	equip.push_back(new PlayerPremadeItem(22442, 0, 0));
	equip.push_back(new PlayerPremadeItem(22437, 2586, 0));
	equip.push_back(new PlayerPremadeItem(22440, 911, 0));
	equip.push_back(new PlayerPremadeItem(23067, 0, 0));
	equip.push_back(new PlayerPremadeItem(22961, 0, 0));
	equip.push_back(new PlayerPremadeItem(21670, 0, 0));
	equip.push_back(new PlayerPremadeItem(23041, 0, 0));
	equip.push_back(new PlayerPremadeItem(22816, 2564, 0));
	equip.push_back(new PlayerPremadeItem(22802, 2564, 0));
	equip.push_back(new PlayerPremadeItem(22812, 2523, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(14539, urand(0, 1) ? 0 : 2545, 0));
	equip.push_back(new PlayerPremadeItem(13091, 0, 0));
	equip.push_back(new PlayerPremadeItem(15058, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18413, 1889, 0));
	equip.push_back(new PlayerPremadeItem(15064, 1892, 0));
	equip.push_back(new PlayerPremadeItem(18700, 923, 0));
	equip.push_back(new PlayerPremadeItem(13258, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13258, 1887, 0));
	equip.push_back(new PlayerPremadeItem(14502, 0, 0));
	equip.push_back(new PlayerPremadeItem(11821, urand(0, 1) ? 0 : 2545, 0));
	equip.push_back(new PlayerPremadeItem(14641, 911, 0));
	equip.push_back(new PlayerPremadeItem(15855, 0, 0));
	equip.push_back(new PlayerPremadeItem(11669, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 1904, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(14539, 2545, 0));
	equip.push_back(new PlayerPremadeItem(17065, 0, 0));
	equip.push_back(new PlayerPremadeItem(19139, 2488, 0));
	equip.push_back(new PlayerPremadeItem(17107, 1889, 0));
	equip.push_back(new PlayerPremadeItem(15064, 1892, 0));
	equip.push_back(new PlayerPremadeItem(18700, 923, 0));
	equip.push_back(new PlayerPremadeItem(13258, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19149, 0, 0));
	equip.push_back(new PlayerPremadeItem(11821, 2545, 0));
	equip.push_back(new PlayerPremadeItem(14641, 911, 0));
	equip.push_back(new PlayerPremadeItem(15855, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 1904, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(14539, 2545, 0));
	equip.push_back(new PlayerPremadeItem(17065, 0, 0));
	equip.push_back(new PlayerPremadeItem(19389, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19386, 1889, 0));
	equip.push_back(new PlayerPremadeItem(19405, 1892, 0));
	equip.push_back(new PlayerPremadeItem(18700, 923, 0));
	equip.push_back(new PlayerPremadeItem(13258, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19149, 0, 0));
	equip.push_back(new PlayerPremadeItem(11821, 2545, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19376, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 2564, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(20623, 2545, 0));
	equip.push_back(new PlayerPremadeItem(17065, 0, 0));
	equip.push_back(new PlayerPremadeItem(19389, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19386, 1889, 0));
	equip.push_back(new PlayerPremadeItem(19405, 1892, 0));
	equip.push_back(new PlayerPremadeItem(18700, 923, 0));
	equip.push_back(new PlayerPremadeItem(13258, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19396, 0, 0));
	equip.push_back(new PlayerPremadeItem(20627, 2545, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19376, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 2564, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21693, 2545, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(20194, 2606, 0));
	equip.push_back(new PlayerPremadeItem(19386, 2622, 0));
	equip.push_back(new PlayerPremadeItem(19405, 1892, 0));
	equip.push_back(new PlayerPremadeItem(21602, 923, 0));
	equip.push_back(new PlayerPremadeItem(21605, 2613, 0));
	equip.push_back(new PlayerPremadeItem(21675, 0, 0));
	equip.push_back(new PlayerPremadeItem(22740, 2545, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 2646, 0));
	equip.push_back(new PlayerPremadeItem(23198, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidTankSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21693, 2545, 0));
	equip.push_back(new PlayerPremadeItem(22732, 0, 0));
	equip.push_back(new PlayerPremadeItem(20194, 2606, 0));
	equip.push_back(new PlayerPremadeItem(22938, 2622, 0));
	equip.push_back(new PlayerPremadeItem(23226, 1892, 0));
	equip.push_back(new PlayerPremadeItem(22663, 923, 0));
	equip.push_back(new PlayerPremadeItem(21605, 2613, 0));
	equip.push_back(new PlayerPremadeItem(21675, 0, 0));
	equip.push_back(new PlayerPremadeItem(22740, 2545, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(21601, 0, 0));
	equip.push_back(new PlayerPremadeItem(23018, 0, 0));
	equip.push_back(new PlayerPremadeItem(13966, 0, 0));
	equip.push_back(new PlayerPremadeItem(11811, 0, 0));
	equip.push_back(new PlayerPremadeItem(943, 2646, 0));
	equip.push_back(new PlayerPremadeItem(23198, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(15411, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(14637, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16710, 1885, 0));
	equip.push_back(new PlayerPremadeItem(15063, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13252, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	equip.push_back(new PlayerPremadeItem(12553, 911, 0));
	equip.push_back(new PlayerPremadeItem(17713, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 2246 : 18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13167 : 18420, 1904, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, 1508, 0));
	equip.push_back(new PlayerPremadeItem(18404, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13340, 849, 0));
	equip.push_back(new PlayerPremadeItem(14637, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(18823, 1887, 0));
	equip.push_back(new PlayerPremadeItem(13252, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(12553, 911, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(18500, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(18420, 1904, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(19405, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(18823, 1887, 0));
	equip.push_back(new PlayerPremadeItem(19396, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19432, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19358, 2563, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(12927, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19436, 849, 0));
	equip.push_back(new PlayerPremadeItem(19405, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19146, 1885, 0));
	equip.push_back(new PlayerPremadeItem(20259, 1887, 0));
	equip.push_back(new PlayerPremadeItem(20216, 0, 0));
	equip.push_back(new PlayerPremadeItem(15062, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19381, 911, 0));
	equip.push_back(new PlayerPremadeItem(19384, 0, 0));
	equip.push_back(new PlayerPremadeItem(19432, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(11815, 0, 0));
	equip.push_back(new PlayerPremadeItem(19358, 2563, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(21665, 2606, 0));
	equip.push_back(new PlayerPremadeItem(21701, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21680, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21602, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21672, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(20665, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21493, 911, 0));
	equip.push_back(new PlayerPremadeItem(21205, 0, 0));
	equip.push_back(new PlayerPremadeItem(17063, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(13965, 0, 0));
	equip.push_back(new PlayerPremadeItem(21268, 2563, 0));
	equip.push_back(new PlayerPremadeItem(13385, 0, 0));
	equip.push_back(new PlayerPremadeItem(23198, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidMddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(8345, 1508, 0));
	equip.push_back(new PlayerPremadeItem(19377, 0, 0));
	equip.push_back(new PlayerPremadeItem(21665, 2717, 0));
	equip.push_back(new PlayerPremadeItem(21710, 2621, 0));
	equip.push_back(new PlayerPremadeItem(23226, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21602, 1885, 0));
	equip.push_back(new PlayerPremadeItem(21672, 2564, 0));
	equip.push_back(new PlayerPremadeItem(21586, 0, 0));
	equip.push_back(new PlayerPremadeItem(23071, 1508, 0));
	equip.push_back(new PlayerPremadeItem(21493, 911, 0));
	equip.push_back(new PlayerPremadeItem(23038, 0, 0));
	equip.push_back(new PlayerPremadeItem(19432, 0, 0));
	equip.push_back(new PlayerPremadeItem(19406, 0, 0));
	equip.push_back(new PlayerPremadeItem(23041, 0, 0));
	equip.push_back(new PlayerPremadeItem(22988, 2563, 0));
	equip.push_back(new PlayerPremadeItem(13385, 0, 0));
	equip.push_back(new PlayerPremadeItem(23198, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 0, 0));
	equip.push_back(new PlayerPremadeItem(12103, 0, 0));
	equip.push_back(new PlayerPremadeItem(13013, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 22409 : 18385, 1891, 0));
	equip.push_back(new PlayerPremadeItem(11766, 1883, 0));
	equip.push_back(new PlayerPremadeItem(13258, 0, 0));
	equip.push_back(new PlayerPremadeItem(11662, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 0, 0));
	equip.push_back(new PlayerPremadeItem(11822, 911, 0));
	equip.push_back(new PlayerPremadeItem(12545, 0, 0));
	equip.push_back(new PlayerPremadeItem(13001, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(13968, 0, 0));

	if (urand(0, 1))
	{
		equip.push_back(new PlayerPremadeItem(13964, 0, 0));
		equip.push_back(new PlayerPremadeItem(10796, 0, 0));
	}
	else
		equip.push_back(new PlayerPremadeItem(18534, 0, 0));


	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(10504, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(16836, 2488, 0));
	equip.push_back(new PlayerPremadeItem(13386, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(11766, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16831, 0, 0));
	equip.push_back(new PlayerPremadeItem(19136, 0, 0));
	equip.push_back(new PlayerPremadeItem(13170, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16829, 911, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(12930, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(18842, 2504, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19145, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16831, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(16835, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16829, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19308, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18814, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(19378, 1888, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(19374, 1883, 0));
	equip.push_back(new PlayerPremadeItem(16831, 0, 0));
	equip.push_back(new PlayerPremadeItem(19400, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(19147, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(19308, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(21608, 0, 0));
	equip.push_back(new PlayerPremadeItem(19370, 2605, 0));
	equip.push_back(new PlayerPremadeItem(22731, 2621, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21186, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2617, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(19403, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(18820, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2504, 0));
	equip.push_back(new PlayerPremadeItem(21597, 0, 0));
	equip.push_back(new PlayerPremadeItem(23197, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidRddSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(23057, 0, 0));
	equip.push_back(new PlayerPremadeItem(22983, 2721, 0));
	equip.push_back(new PlayerPremadeItem(23050, 2621, 0));
	equip.push_back(new PlayerPremadeItem(19682, 1891, 0));
	equip.push_back(new PlayerPremadeItem(23021, 1883, 0));
	equip.push_back(new PlayerPremadeItem(21585, 2617, 0));
	equip.push_back(new PlayerPremadeItem(22730, 0, 0));
	equip.push_back(new PlayerPremadeItem(19683, 2544, 0));
	equip.push_back(new PlayerPremadeItem(19684, 911, 0));
	equip.push_back(new PlayerPremadeItem(23025, 0, 0));
	equip.push_back(new PlayerPremadeItem(21709, 0, 0));
	equip.push_back(new PlayerPremadeItem(19379, 0, 0));
	equip.push_back(new PlayerPremadeItem(23046, 0, 0));
	equip.push_back(new PlayerPremadeItem(22988, 2504, 0));
	equip.push_back(new PlayerPremadeItem(23049, 0, 0));
	equip.push_back(new PlayerPremadeItem(23197, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealPreOne(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(13102, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(15061, 2488, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 13208 : 18525, 1884, 0));
	equip.push_back(new PlayerPremadeItem(12554, 0, 0));
	equip.push_back(new PlayerPremadeItem(14553, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 15060 : 18386, urand(0, 1) ? 0 : 2544, 0));
	equip.push_back(new PlayerPremadeItem(13954, 911, 0));
	equip.push_back(new PlayerPremadeItem(13178, 0, 0));
	equip.push_back(new PlayerPremadeItem(16058, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18470, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	equip.push_back(new PlayerPremadeItem(11923, 0, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16900, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18510, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(18263, 1884, 0));
	equip.push_back(new PlayerPremadeItem(12554, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(18875, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16829, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(18470, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(17105, 2505, 0));
	equip.push_back(new PlayerPremadeItem(17105, 2505, 0));
	equip.push_back(new PlayerPremadeItem(18523, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2544, 0));
	equip.push_back(new PlayerPremadeItem(18723, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2488, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 1891, 0));
	equip.push_back(new PlayerPremadeItem(16904, 2566, 0));
	equip.push_back(new PlayerPremadeItem(16899, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(19385, 2544, 0));
	equip.push_back(new PlayerPremadeItem(16898, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0., 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealFour(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(19375, 2591, 0));
	equip.push_back(new PlayerPremadeItem(19885, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2604, 0));
	equip.push_back(new PlayerPremadeItem(19430, 1888, 0));
	equip.push_back(new PlayerPremadeItem(13346, 20025, 0));
	equip.push_back(new PlayerPremadeItem(16904, 2566, 0));
	equip.push_back(new PlayerPremadeItem(16899, 0, 0));
	equip.push_back(new PlayerPremadeItem(19162, 0, 0));
	equip.push_back(new PlayerPremadeItem(19385, 2591, 0));
	equip.push_back(new PlayerPremadeItem(16898, 911, 0));
	equip.push_back(new PlayerPremadeItem(19140, 0, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(19360, 2505, 0));
	equip.push_back(new PlayerPremadeItem(19312, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealFive(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21615, 2591, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(18810, 2604, 0));
	equip.push_back(new PlayerPremadeItem(21583, 2621, 0));
	equip.push_back(new PlayerPremadeItem(21663, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21604, 2566, 0));
	equip.push_back(new PlayerPremadeItem(21617, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(19385, 2591, 0));
	equip.push_back(new PlayerPremadeItem(19437, 911, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(19382, 0, 0));
	equip.push_back(new PlayerPremadeItem(19395, 0, 0));
	equip.push_back(new PlayerPremadeItem(17064, 0, 0));
	equip.push_back(new PlayerPremadeItem(21839, 2505, 0));
	equip.push_back(new PlayerPremadeItem(21666, 0, 0));
	equip.push_back(new PlayerPremadeItem(22399, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipDruidHealSix(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(21615, 2591, 0));
	equip.push_back(new PlayerPremadeItem(21712, 0, 0));
	equip.push_back(new PlayerPremadeItem(22491, 2715, 0));
	equip.push_back(new PlayerPremadeItem(22960, 2621, 0));
	equip.push_back(new PlayerPremadeItem(22488, 1891, 0));
	equip.push_back(new PlayerPremadeItem(21604, 2566, 0));
	equip.push_back(new PlayerPremadeItem(22493, 2617, 0));
	equip.push_back(new PlayerPremadeItem(21582, 0, 0));
	equip.push_back(new PlayerPremadeItem(22489, 2591, 0));
	equip.push_back(new PlayerPremadeItem(22492, 911, 0));
	equip.push_back(new PlayerPremadeItem(21620, 0, 0));
	equip.push_back(new PlayerPremadeItem(22939, 0, 0));
	equip.push_back(new PlayerPremadeItem(23047, 0, 0));
	equip.push_back(new PlayerPremadeItem(23027, 0, 0));
	equip.push_back(new PlayerPremadeItem(23056, 2505, 0));
	equip.push_back(new PlayerPremadeItem(23048, 0, 0));
	equip.push_back(new PlayerPremadeItem(22399, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}