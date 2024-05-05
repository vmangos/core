#include "PartyBotEquip.h"
#include "PartyBotAI.h"

void PartyBotAI::PartyBotEquipPremadeGear(uint8 pLeaderItl, Player* pPlayer)
{
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
	equip.push_back(new PlayerPremadeItem(14620, 0, 0));
	equip.push_back(new PlayerPremadeItem(11927, 0, 0));
	equip.push_back(new PlayerPremadeItem(14621, 911, 0));
	equip.push_back(new PlayerPremadeItem(11669, 0, 0));
	equip.push_back(new PlayerPremadeItem(22331, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(10779, 0, 0));
	equip.push_back(new PlayerPremadeItem(15806, 1900, 0));
	equip.push_back(new PlayerPremadeItem(12602, 929, 0));
	equip.push_back(new PlayerPremadeItem(urand(0, 1) ? 12651 : 18323, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankTwo(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16963, 1503, 0));
	equip.push_back(new PlayerPremadeItem(17065, 0, 0));
	equip.push_back(new PlayerPremadeItem(16868, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(14624, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16861, 923, 0));
	equip.push_back(new PlayerPremadeItem(13072, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16864, 0, 0));
	equip.push_back(new PlayerPremadeItem(16962, 2503, 0));
	equip.push_back(new PlayerPremadeItem(16862, 2503, 0));
	equip.push_back(new PlayerPremadeItem(22331, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(11810, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(18348, 1900, 0));
	equip.push_back(new PlayerPremadeItem(17066, 20017, 0));
	equip.push_back(new PlayerPremadeItem(18323, 0, 0));

	PartyBotEquipItems(pPlayer, equip);
}

void PartyBotEquipWarriorTankThree(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> equip;
	equip.push_back(new PlayerPremadeItem(16963, 1503, 0));
	equip.push_back(new PlayerPremadeItem(19383, 0, 0));
	equip.push_back(new PlayerPremadeItem(16961, 2488, 0));
	equip.push_back(new PlayerPremadeItem(18495, 1889, 0));
	equip.push_back(new PlayerPremadeItem(16966, 1892, 0));
	equip.push_back(new PlayerPremadeItem(16959, 923, 0));
	equip.push_back(new PlayerPremadeItem(16964, 1887, 0));
	equip.push_back(new PlayerPremadeItem(16960, 0, 0));
	equip.push_back(new PlayerPremadeItem(16962, 1503, 0));
	equip.push_back(new PlayerPremadeItem(16965, 911, 0));
	equip.push_back(new PlayerPremadeItem(22331, 0, 0));
	equip.push_back(new PlayerPremadeItem(18879, 0, 0));
	equip.push_back(new PlayerPremadeItem(19431, 0, 0));
	equip.push_back(new PlayerPremadeItem(18406, 0, 0));
	equip.push_back(new PlayerPremadeItem(19335, 1900, 0));
	equip.push_back(new PlayerPremadeItem(19349, 929, 0));
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

void PartyBotEquipHunterTwo(Player* pPlayer)
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

void PartyBotEquipDruidRddTwo(Player* pPlayer)
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