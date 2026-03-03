#include "ModPlayerBots/Mgr/Item/RandomItemMgr.h"

std::set<uint32> RandomItemMgr::itemCache;

RandomItemMgr::RandomItemMgr() = default;
RandomItemMgr::~RandomItemMgr() = default;

void RandomItemMgr::Init() {}
void RandomItemMgr::InitAfterAhBot() {}

bool RandomItemMgr::HandleConsoleCommand(ChatHandler* /*handler*/, char const* /*args*/)
{
    return false;
}

RandomItemList RandomItemMgr::Query(uint32 /*level*/, RandomItemType /*type*/, RandomItemPredicate* /*predicate*/)
{
    return {};
}

RandomItemList RandomItemMgr::Query(uint32 /*level*/, uint8 /*clazz*/, uint8 /*slot*/, uint32 /*quality*/)
{
    return {};
}

uint32 RandomItemMgr::GetUpgrade(Player* /*player*/, std::string /*spec*/, uint8 /*slot*/, uint32 /*quality*/, uint32 /*itemId*/)
{
    return 0;
}

std::vector<uint32> RandomItemMgr::GetUpgradeList(Player* /*player*/, std::string /*spec*/, uint8 /*slot*/, uint32 /*quality*/,
                                                  uint32 /*itemId*/, uint32 /*amount*/)
{
    return {};
}

bool RandomItemMgr::HasStatWeight(uint32 /*itemId*/) { return false; }
uint32 RandomItemMgr::GetMinLevelFromCache(uint32 /*itemId*/) { return 0; }
uint32 RandomItemMgr::GetStatWeight(Player* /*player*/, uint32 /*itemId*/) { return 0; }
uint32 RandomItemMgr::GetLiveStatWeight(Player* /*player*/, uint32 /*itemId*/) { return 0; }

uint32 RandomItemMgr::GetRandomItem(uint32 /*level*/, RandomItemType /*type*/, RandomItemPredicate* /*predicate*/)
{
    return 0;
}

std::vector<uint32> RandomItemMgr::GetAmmo(uint32 /*level*/, uint32 /*subClass*/) { return {}; }
uint32 RandomItemMgr::GetRandomPotion(uint32 /*level*/, uint32 /*effect*/) { return 0; }
uint32 RandomItemMgr::GetRandomFood(uint32 /*level*/, uint32 /*category*/) { return 0; }
uint32 RandomItemMgr::GetFood(uint32 /*level*/, uint32 /*category*/) { return 0; }
uint32 RandomItemMgr::GetRandomTrade(uint32 /*level*/) { return 0; }

uint32 RandomItemMgr::CalculateStatWeight(uint8 /*playerclass*/, uint8 /*spec*/, ItemTemplate const* /*proto*/) { return 0; }
uint32 RandomItemMgr::CalculateSingleStatWeight(uint8 /*playerclass*/, uint8 /*spec*/, std::string /*stat*/, uint32 /*value*/) { return 0; }

bool RandomItemMgr::CanEquipArmor(uint8 /*clazz*/, uint32 /*level*/, ItemTemplate const* /*proto*/) { return true; }
bool RandomItemMgr::ShouldEquipArmorForSpec(uint8 /*playerclass*/, uint8 /*spec*/, ItemTemplate const* /*proto*/) { return true; }
bool RandomItemMgr::CanEquipWeapon(uint8 /*clazz*/, ItemTemplate const* /*proto*/) { return true; }
bool RandomItemMgr::ShouldEquipWeaponForSpec(uint8 /*playerclass*/, uint8 /*spec*/, ItemTemplate const* /*proto*/) { return true; }

float RandomItemMgr::GetItemRarity(uint32 /*itemId*/) { return 0.0f; }
uint32 RandomItemMgr::GetQuestIdForItem(uint32 /*itemId*/) { return 0; }
std::vector<uint32> RandomItemMgr::GetQuestIdsForItem(uint32 /*itemId*/) { return {}; }
bool RandomItemMgr::IsUsedBySkill(ItemTemplate const* /*proto*/, uint32 /*skillId*/) { return false; }
std::vector<uint32> RandomItemMgr::GetCachedEquipments(uint32 /*requiredLevel*/, uint32 /*inventoryType*/) { return {}; }

void RandomItemMgr::BuildRandomItemCache() {}
void RandomItemMgr::BuildEquipCache() {}
void RandomItemMgr::BuildEquipCacheNew() {}
void RandomItemMgr::BuildItemInfoCache() {}
void RandomItemMgr::BuildAmmoCache() {}
void RandomItemMgr::BuildFoodCache() {}
void RandomItemMgr::BuildPotionCache() {}
void RandomItemMgr::BuildTradeCache() {}
void RandomItemMgr::BuildRarityCache() {}
bool RandomItemMgr::CanEquipItem(BotEquipKey /*key*/, ItemTemplate const* /*proto*/) { return false; }
bool RandomItemMgr::CanEquipItemNew(ItemTemplate const* /*proto*/) { return false; }
void RandomItemMgr::AddItemStats(uint32 /*mod*/, uint8& /*sp*/, uint8& /*ap*/, uint8& /*tank*/) {}
bool RandomItemMgr::CheckItemStats(uint8 /*clazz*/, uint8 /*sp*/, uint8 /*ap*/, uint8 /*tank*/) { return false; }
