#include "PartyBotEquip.h"
#include "PartyBotAI.h"

void PartyBotAI::PartyBotEquipPremadeGear(uint8 pLeaderItl, Player* pPlayer)
{
	LearnArmorProficiencies();
	LearnAllTrainer();

	if (pPlayer->GetClass() == CLASS_WARRIOR)
	{
		if (m_role == ROLE_TANK)
			PartyBotEquipWarriorTankPre(pPlayer);
		if (m_role == ROLE_MELEE_DPS)
			PartyBotEquipWarriorMddPre(pPlayer);		
	}

	if (pPlayer->GetClass() == CLASS_WARLOCK)
	{
		PartyBotEquipWarlockPre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_SHAMAN)
	{
		if (m_role == ROLE_RANGE_DPS)
			PartyBotEquipShamanRddPre(pPlayer);		
		if (m_role == ROLE_MELEE_DPS)
			PartyBotEquipShamanMddPre(pPlayer);
		if (m_role == ROLE_HEALER)
			PartyBotEquipShamanHealPre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_ROGUE)
	{
		PartyBotEquipRoguePre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_PRIEST)
	{		
		if (m_role == ROLE_RANGE_DPS)
			PartyBotEquipPriestRddPre(pPlayer);
		if (m_role == ROLE_HEALER)
			PartyBotEquipPriestHealPre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_PALADIN)
	{
		if (m_role == ROLE_TANK)
			PartyBotEquipPaladinTankPre(pPlayer);
		if (m_role == ROLE_MELEE_DPS)
			PartyBotEquipPaladinMddPre(pPlayer);		
		if (m_role == ROLE_HEALER)
			PartyBotEquipPaladinHealPre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_MAGE)
	{
		PartyBotEquipMagePre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_HUNTER)
	{
		PartyBotEquipHunterPre(pPlayer);
	}

	if (pPlayer->GetClass() == CLASS_DRUID)
	{
		if (m_role == ROLE_TANK)
			PartyBotEquipDruidTankPre(pPlayer);
		if (m_role == ROLE_MELEE_DPS)
			PartyBotEquipDruidMddPre(pPlayer);
		if (m_role == ROLE_RANGE_DPS)
			PartyBotEquipDruidRddPre(pPlayer);
		if (m_role == ROLE_HEALER)
			PartyBotEquipDruidHealPre(pPlayer);
	}
}

void PartyBotEquipWarriorTankPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipWarriorTankOnePre;
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(12952, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(13091, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(14552, 2488, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 18413 : 18495, 1889, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(14624, 1892, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(12550, urand(0, 1) ? 923 : 1886, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(13072, 1887, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(14620, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(11927, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(14621, 911, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(11669, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(22331, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(11810, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(10779, 0, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(15806, 1900, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(12602, 929, 0));
	EquipWarriorTankOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12651 : 18323, 0, 0));	

	for (uint32 i = 0; i < EquipWarriorTankOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipWarriorTankOnePre[i]->itemId, 1, EquipWarriorTankOnePre[i]->enchantId);
	}
}

void PartyBotEquipWarriorMddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipWarriorDPSOnePre;
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(13404, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(11726, 1891, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12936, 1885, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(15063, 927, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(13959, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(15062, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12555, 911, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(17713, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(13098, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(11815, 0, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12940, 1900, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12939, 1900, 0));
	EquipWarriorDPSOnePre.push_back(new PlayerPremadeItem(12651, 0, 0));

	for (uint32 i = 0; i < EquipWarriorDPSOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipWarriorDPSOnePre[i]->itemId, 1, EquipWarriorDPSOnePre[i]->enchantId);
	}
}

void PartyBotEquipWarlockPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipWarlockDPSOnePre;
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(10504, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(18691, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(14112, 2488, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13386, 1888, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(14153, 1891, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13107, 1883, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13253, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13956, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13170, 2544, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(18735, 911, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(12545, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13001, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(13968, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13964 : 18372, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(10796, 0, 0));
	EquipWarlockDPSOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13396 : 18467, 0, 0));

	for (uint32 i = 0; i < EquipWarlockDPSOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipWarlockDPSOnePre[i]->itemId, 1, EquipWarlockDPSOnePre[i]->enchantId);
	}
}

void PartyBotEquipShamanMddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipChamanEnhOnePre;
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(12587, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(11726, 1891, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(13211, 1885, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(13957, 1887, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(22232, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(15062, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(14616, 911, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(13098, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(17713, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(11815, 0, 0));
	EquipChamanEnhOnePre.push_back(new PlayerPremadeItem(12784, 1900, 0));

	for (uint32 i = 0; i < EquipChamanEnhOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipChamanEnhOnePre[i]->itemId, 1, EquipChamanEnhOnePre[i]->enchantId);
	}
}

void PartyBotEquipShamanRddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipChamanElemOnePre;
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(10504, urand(0, 1) ? 2544 : 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13141, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13013 : 18494, 2488, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 15421 : 18496, 1888, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(11924, 1891, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13107, 1883, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13253, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13956, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13170, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13954, 911, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(12545, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13001, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13968, 0, 0));

	if (urand(0, 1))
	{
		EquipChamanElemOnePre.push_back(new PlayerPremadeItem(13964, 0, 0));
		EquipChamanElemOnePre.push_back(new PlayerPremadeItem(11904, 0, 0));
	}
	else
		EquipChamanElemOnePre.push_back(new PlayerPremadeItem(18534, 0, 0));	

	for (uint32 i = 0; i < EquipChamanElemOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipChamanElemOnePre[i]->itemId, 1, EquipChamanElemOnePre[i]->enchantId);
	}
}

void PartyBotEquipShamanHealPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipChamanHealOnePre;
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13216, urand(0, 1) ? 0 : 2544, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 15061 : 18757, 2488, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13386, 1888, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13346, 1891, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13969, 1883, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(12554, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(14553, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13170 : 18386, urand(0, 1) ? 0 : 2544, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13954, 911, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(16058, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(13178, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18371, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(11923, 0, 0));
	EquipChamanHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	for (uint32 i = 0; i < EquipChamanHealOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipChamanHealOnePre[i]->itemId, 1, EquipChamanHealOnePre[i]->enchantId);
	}
}

void PartyBotEquipRoguePre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipRogueOnePre;
	EquipRogueOnePre.push_back(new PlayerPremadeItem(13404, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(14637, 1891, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(13120, 1885, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(15063, 1887, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(13252, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(12553, 911, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13098 : 18500, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 17713 : 18500, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(11815, 0, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(12940, 1900, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(12939, 1900, 0));
	EquipRogueOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12651 : 18323, 0, 0));

	for (uint32 i = 0; i < EquipRogueOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipRogueOnePre[i]->itemId, 1, EquipRogueOnePre[i]->enchantId);
	}
}

void PartyBotEquipPriestRddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPriestShadowOnePre;
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(10504, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(18691, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(14112, 2488, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13386, 1888, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(14136, 1891, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13107, 1884, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13253 : 18407, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13956, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13170, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(18735, 911, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(12545, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13001, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13349, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(10796, 0, 0));
	EquipPriestShadowOnePre.push_back(new PlayerPremadeItem(13396, 0, 0));

	for (uint32 i = 0; i < EquipPriestShadowOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPriestShadowOnePre[i]->itemId, 1, EquipPriestShadowOnePre[i]->enchantId);
	}
}

void PartyBotEquipPriestHealPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPriestHealOnePre;
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(13102, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(13141, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(13013, 2488, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(14154, 1891, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(13107, 1884, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(12554, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 14143 : 18327, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(11841, urand(0, 1) ? 0 : 2544, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(11822, 911, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(16058, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(13178, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18469, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18371, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(11923, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));
	EquipPriestHealOnePre.push_back(new PlayerPremadeItem(16997, 0, 0));

	for (uint32 i = 0; i < EquipPriestHealOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPriestHealOnePre[i]->itemId, 1, EquipPriestHealOnePre[i]->enchantId);
	}
}

void PartyBotEquipPaladinTankPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPaladinProtOnePre;
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(12952, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(13091, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(14552, 2488, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(18413, 1889, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(14624, 1892, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(12550, 923, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(13072, 1887, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(14620, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(11927, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(14621, 911, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(11669, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(22331, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(11810, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(10779, 0, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(15806, 1900, 0));
	EquipPaladinProtOnePre.push_back(new PlayerPremadeItem(12602, 929, 0));

	for (uint32 i = 0; i < EquipPaladinProtOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPaladinProtOnePre[i]->itemId, 1, EquipPaladinProtOnePre[i]->enchantId);
	}
}

void PartyBotEquipPaladinMddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPaladinRetOnePre;
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13404, urand(0, 1) ? 0 : 1508, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(11726, 1891, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(12936, 1885, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13957, 1887, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13959, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(14554, urand(0, 1) ? 0 : 1508, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(14616, 1887, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13098, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(12548, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(11815, 0, 0));
	EquipPaladinRetOnePre.push_back(new PlayerPremadeItem(12784, 1900, 0));

	for (uint32 i = 0; i < EquipPaladinRetOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPaladinRetOnePre[i]->itemId, 1, EquipPaladinRetOnePre[i]->enchantId);
	}
}

void PartyBotEquipPaladinHealPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPaladinHealOnePre;
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12633 : 18490, urand(0, 1) ? 0 : 1509, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(18720, 2488, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13346, 1891, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13969, 1883, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12554 : 18527, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(18702, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13170 : 18386, urand(0, 1) ? 0 : 1509, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13954 : 18507, 911, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(16058, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(18103, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(11819, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(11923, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	for (uint32 i = 0; i < EquipPaladinHealOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPaladinHealOnePre[i]->itemId, 1, EquipPaladinHealOnePre[i]->enchantId);
	}
}

void PartyBotEquipMagePre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipPaladinHealOnePre;
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(10504, urand(0, 1) ? 0 : 2544, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(12103, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(11782, 2488, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13386, 1888, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(14152, 1891, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13107, 1883, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13253 : 23290, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(11662, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13170, urand(0, 1) ? 0 : 2544, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(11822, 911, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(942, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(942, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13968, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13964, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(10796, 0, 0));
	EquipPaladinHealOnePre.push_back(new PlayerPremadeItem(13938, 0, 0));

	for (uint32 i = 0; i < EquipPaladinHealOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipPaladinHealOnePre[i]->itemId, 1, EquipPaladinHealOnePre[i]->enchantId);
	}
}

void PartyBotEquipHunterPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipHunterOnePre;
	EquipHunterOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13404 : 18421, urand(0, 1) ? 0 : 1508, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(11726, 1891, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13211, 1883, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15063, 1887, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 14502 : 18393, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13967, 911, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13098 : 18500, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 17713 : 18500, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11815 : 18473, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(12940, 2564, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(12939, 2564, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(2099, 664, 0));

	for (uint32 i = 0; i < EquipHunterOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipHunterOnePre[i]->itemId, 1, EquipHunterOnePre[i]->enchantId);
	}
}

void PartyBotEquipDruidTankPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipHunterOnePre;
	EquipHunterOnePre.push_back(new PlayerPremadeItem(14539, urand(0, 1) ? 0 : 2545, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13091, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15058, 2488, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(18413, 1889, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15064, 1892, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(18700, 923, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13258, 1887, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13258, 1887, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(14502, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(11821, urand(0, 1) ? 0 : 2545, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(14641, 911, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(15855, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(11669, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(13966, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(11811, 0, 0));
	EquipHunterOnePre.push_back(new PlayerPremadeItem(943, 1904, 0));

	for (uint32 i = 0; i < EquipHunterOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipHunterOnePre[i]->itemId, 1, EquipHunterOnePre[i]->enchantId);
	}
}

void PartyBotEquipDruidMddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipDruidMddOnePre;
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(8345, urand(0, 1) ? 0 : 1508, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(15411, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(12927, 2488, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(13340, 849, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(14637, 1891, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(16710, 1885, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(15063, 1887, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(13252, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(15062, urand(0, 1) ? 0 : 1508, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(12553, 911, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(17713, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 2246 : 18500, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(13965, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(11815, 0, 0));
	EquipDruidMddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13167 : 18420, 1904, 0));

	for (uint32 i = 0; i < EquipDruidMddOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipDruidMddOnePre[i]->itemId, 1, EquipDruidMddOnePre[i]->enchantId);
	}
}

void PartyBotEquipDruidRddPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipDruidRddOnePre;
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(10504, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(12103, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13013, 2488, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13386, 1888, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 22409 : 18385, 1891, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(11766, 1883, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13258, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(11662, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13170, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(11822, 911, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(12545, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13001, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(12930, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13968, 0, 0));

	if (urand(0, 1))
	{
		EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13964, 0, 0));
		EquipDruidRddOnePre.push_back(new PlayerPremadeItem(10796, 0, 0));
	}
	else
		EquipDruidRddOnePre.push_back(new PlayerPremadeItem(18534, 0, 0));
	

	for (uint32 i = 0; i < EquipDruidRddOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipDruidRddOnePre[i]->itemId, 1, EquipDruidRddOnePre[i]->enchantId);
	}
}

void PartyBotEquipDruidHealPre(Player* pPlayer)
{
	std::vector<PlayerPremadeItem const*> EquipDruidRddOnePre;
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13102, urand(0, 1) ? 0 : 2544, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13141 : 18723, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(15061, 2488, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13386 : 18510, 1888, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13346, 1891, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 13208 : 18525, 1884, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(12554, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(14553, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 15060 : 18386, urand(0, 1) ? 0 : 2544, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13954, 911, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(13178, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(16058, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 12930 : 18470, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11819 : 18371, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(11923, 0, 0));
	EquipDruidRddOnePre.push_back(new PlayerPremadeItem(urand(0, 1) ? 11928 : 18523, 0, 0));

	for (uint32 i = 0; i < EquipDruidRddOnePre.size(); i++)
	{
		pPlayer->StoreNewItemInBestSlots(EquipDruidRddOnePre[i]->itemId, 1, EquipDruidRddOnePre[i]->enchantId);
	}
}