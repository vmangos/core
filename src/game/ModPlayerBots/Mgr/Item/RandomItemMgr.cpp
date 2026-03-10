/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "RandomItemMgr.h"

#include <algorithm>
#include <cctype>
#include <unordered_set>

#include "Bag.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotAIConfig.h"
#include "Playerbots.h"
#include "SpellMgr.h"
#include "StatsWeightCalculator.h"

std::set<uint32> RandomItemMgr::itemCache;

namespace
{
bool ContainsInsensitive(char const* haystack, char const* needle)
{
    if (!haystack || !needle)
        return false;

    std::string hay(haystack);
    std::string nee(needle);
    std::transform(hay.begin(), hay.end(), hay.begin(), [](unsigned char c) { return std::tolower(c); });
    std::transform(nee.begin(), nee.end(), nee.begin(), [](unsigned char c) { return std::tolower(c); });
    return hay.find(nee) != std::string::npos;
}

bool IsIgnoredItem(ItemTemplate const* proto)
{
    if (!proto)
        return true;

    if (proto->Duration & 0x80000000)
        return true;

    if (!proto->SellPrice || !proto->ItemLevel)
        return true;

    if (ContainsInsensitive(proto->Name1, "qa") || ContainsInsensitive(proto->Name1, "test") ||
        ContainsInsensitive(proto->Name1, "deprecated"))
        return true;

    return false;
}

uint32 NormalizeLevel(ItemTemplate const* proto)
{
    if (!proto)
        return 1;

    uint32 level = proto->RequiredLevel ? proto->RequiredLevel : proto->ItemLevel;
    return std::max<uint32>(1, level);
}

bool IsEquipClass(ItemTemplate const* proto)
{
    return proto && (proto->Class == ITEM_CLASS_WEAPON || proto->Class == ITEM_CLASS_ARMOR);
}

bool HasSpellEffect(ItemTemplate const* proto, uint32 effect)
{
    if (!proto)
        return false;

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (!proto->Spells[i].SpellId)
            continue;

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(proto->Spells[i].SpellId);
        if (!spellInfo)
            continue;

        for (uint8 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellInfo->Effect[j] == effect)
                return true;
        }
    }

    return false;
}

bool HasFoodCategory(ItemTemplate const* proto, uint32 category)
{
    if (!proto)
        return false;

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (proto->Spells[i].SpellCategory == category)
            return true;
    }

    return false;
}
}  // namespace

uint64 BotEquipKey::GetKey() { return level + 100 * clazz + 10000 * slot + 1000000 * quality; }

class RandomItemGuildTaskPredicate : public RandomItemPredicate
{
public:
    bool Apply(ItemTemplate const* proto) override
    {
        if (!proto)
            return false;

        if (proto->Bonding == BIND_WHEN_PICKED_UP || proto->Bonding == BIND_QUEST_ITEM ||
            proto->Bonding == BIND_WHEN_USE)
            return false;

        if (proto->Quality < ITEM_QUALITY_NORMAL)
            return false;

        if ((proto->Class == ITEM_CLASS_ARMOR || proto->Class == ITEM_CLASS_WEAPON) &&
            proto->Quality >= ITEM_QUALITY_RARE)
            return true;

        if (proto->Class == ITEM_CLASS_TRADE_GOODS || proto->Class == ITEM_CLASS_CONSUMABLE)
            return true;

        return false;
    }
};

class RandomItemGuildTaskRewardPredicate : public RandomItemPredicate
{
public:
    RandomItemGuildTaskRewardPredicate(bool equip, bool rare) : equip_(equip), rare_(rare) { }

    bool Apply(ItemTemplate const* proto) override
    {
        if (!proto)
            return false;

        if (proto->Bonding == BIND_WHEN_PICKED_UP || proto->Bonding == BIND_QUEST_ITEM ||
            proto->Bonding == BIND_WHEN_USE)
            return false;

        if (proto->Class == ITEM_CLASS_QUEST)
            return false;

        if (equip_)
        {
            uint32 desiredQuality = rare_ ? ITEM_QUALITY_RARE : ITEM_QUALITY_UNCOMMON;
            return IsEquipClass(proto) && proto->Quality >= desiredQuality && proto->Quality < ITEM_QUALITY_EPIC;
        }

        uint32 desiredQuality = rare_ ? ITEM_QUALITY_UNCOMMON : ITEM_QUALITY_NORMAL;
        return (proto->Class == ITEM_CLASS_TRADE_GOODS || proto->Class == ITEM_CLASS_CONSUMABLE) &&
            proto->Quality >= desiredQuality && proto->Quality < ITEM_QUALITY_RARE;
    }

private:
    bool equip_;
    bool rare_;
};

RandomItemMgr::RandomItemMgr()
{
    predicates[RANDOM_ITEM_GUILD_TASK] = new RandomItemGuildTaskPredicate();
    predicates[RANDOM_ITEM_GUILD_TASK_REWARD_EQUIP_GREEN] = new RandomItemGuildTaskRewardPredicate(true, false);
    predicates[RANDOM_ITEM_GUILD_TASK_REWARD_EQUIP_BLUE] = new RandomItemGuildTaskRewardPredicate(true, true);
    predicates[RANDOM_ITEM_GUILD_TASK_REWARD_TRADE] = new RandomItemGuildTaskRewardPredicate(false, false);
    predicates[RANDOM_ITEM_GUILD_TASK_REWARD_TRADE_RARE] = new RandomItemGuildTaskRewardPredicate(false, true);

    viableSlots[EQUIPMENT_SLOT_HEAD].insert(INVTYPE_HEAD);
    viableSlots[EQUIPMENT_SLOT_NECK].insert(INVTYPE_NECK);
    viableSlots[EQUIPMENT_SLOT_SHOULDERS].insert(INVTYPE_SHOULDERS);
    viableSlots[EQUIPMENT_SLOT_BODY].insert(INVTYPE_BODY);
    viableSlots[EQUIPMENT_SLOT_CHEST].insert(INVTYPE_CHEST);
    viableSlots[EQUIPMENT_SLOT_CHEST].insert(INVTYPE_ROBE);
    viableSlots[EQUIPMENT_SLOT_WAIST].insert(INVTYPE_WAIST);
    viableSlots[EQUIPMENT_SLOT_LEGS].insert(INVTYPE_LEGS);
    viableSlots[EQUIPMENT_SLOT_FEET].insert(INVTYPE_FEET);
    viableSlots[EQUIPMENT_SLOT_WRISTS].insert(INVTYPE_WRISTS);
    viableSlots[EQUIPMENT_SLOT_HANDS].insert(INVTYPE_HANDS);
    viableSlots[EQUIPMENT_SLOT_FINGER1].insert(INVTYPE_FINGER);
    viableSlots[EQUIPMENT_SLOT_FINGER2].insert(INVTYPE_FINGER);
    viableSlots[EQUIPMENT_SLOT_TRINKET1].insert(INVTYPE_TRINKET);
    viableSlots[EQUIPMENT_SLOT_TRINKET2].insert(INVTYPE_TRINKET);
    viableSlots[EQUIPMENT_SLOT_MAINHAND].insert(INVTYPE_WEAPON);
    viableSlots[EQUIPMENT_SLOT_MAINHAND].insert(INVTYPE_2HWEAPON);
    viableSlots[EQUIPMENT_SLOT_MAINHAND].insert(INVTYPE_WEAPONMAINHAND);
    viableSlots[EQUIPMENT_SLOT_OFFHAND].insert(INVTYPE_WEAPON);
    viableSlots[EQUIPMENT_SLOT_OFFHAND].insert(INVTYPE_WEAPONOFFHAND);
    viableSlots[EQUIPMENT_SLOT_OFFHAND].insert(INVTYPE_SHIELD);
    viableSlots[EQUIPMENT_SLOT_OFFHAND].insert(INVTYPE_HOLDABLE);
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_RANGED);
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_THROWN);
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_RANGEDRIGHT);
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_AMMO);
    viableSlots[EQUIPMENT_SLOT_TABARD].insert(INVTYPE_TABARD);
    viableSlots[EQUIPMENT_SLOT_BACK].insert(INVTYPE_CLOAK);
}

RandomItemMgr::~RandomItemMgr()
{
    for (auto& predicate : predicates)
        delete predicate.second;
    predicates.clear();
}

void RandomItemMgr::Init()
{
    BuildItemInfoCache();
    BuildEquipCacheNew();
    BuildAmmoCache();
    BuildPotionCache();
    BuildFoodCache();
    BuildTradeCache();
}

void RandomItemMgr::InitAfterAhBot()
{
    BuildRandomItemCache();
    BuildRarityCache();
}

bool RandomItemMgr::HandleConsoleCommand(ChatHandler* /*handler*/, char const* /*args*/)
{
    return false;
}

RandomItemList RandomItemMgr::Query(uint32 level, RandomItemType type, RandomItemPredicate* predicate)
{
    RandomItemList result;
    auto levelItr = randomItemCache.find(level / 10);
    if (levelItr == randomItemCache.end())
        return result;

    auto typeItr = levelItr->second.find(type);
    if (typeItr == levelItr->second.end())
        return result;

    for (uint32 itemId : typeItr->second)
    {
        ItemTemplate const* proto = sObjectMgr.GetItemTemplate(itemId);
        if (!proto)
            continue;

        if (predicate && !predicate->Apply(proto))
            continue;

        result.push_back(itemId);
    }

    return result;
}

RandomItemList RandomItemMgr::Query(uint32 level, uint8 clazz, uint8 slot, uint32 quality)
{
    RandomItemList result;
    for (uint32 itemId : GetCachedEquipments(level, slot))
    {
        ItemTemplate const* proto = sObjectMgr.GetItemTemplate(itemId);
        if (!proto)
            continue;

        if (quality && proto->Quality != quality)
            continue;

        if (proto->Class == ITEM_CLASS_WEAPON && !CanEquipWeapon(clazz, proto))
            continue;

        if (proto->Class == ITEM_CLASS_ARMOR && !CanEquipArmor(clazz, level, proto))
            continue;

        result.push_back(itemId);
    }

    return result;
}

uint32 RandomItemMgr::GetUpgrade(Player* player, std::string /*spec*/, uint8 slot, uint32 quality, uint32 itemId)
{
    std::vector<uint32> upgrades = GetUpgradeList(player, "", slot, quality, itemId, 1);
    return upgrades.empty() ? 0 : upgrades.front();
}

std::vector<uint32> RandomItemMgr::GetUpgradeList(Player* player, std::string /*spec*/, uint8 slot, uint32 quality,
    uint32 itemId, uint32 amount)
{
    std::vector<uint32> result;
    if (!player || !amount)
        return result;

    StatsWeightCalculator calculator(player);
    calculator.SetItemSetBonus(false);
    calculator.SetOverflowPenalty(false);

    float currentScore = calculator.CalculateItem(itemId);
    for (uint32 candidate : Query(player->GetLevel(), player->getClass(), slot, quality))
    {
        if (candidate == itemId)
            continue;

        if (calculator.CalculateItem(candidate) <= currentScore)
            continue;

        result.push_back(candidate);
        if (result.size() >= amount)
            break;
    }

    return result;
}

bool RandomItemMgr::HasStatWeight(uint32 itemId) { return itemInfoCache.find(itemId) != itemInfoCache.end(); }

uint32 RandomItemMgr::GetMinLevelFromCache(uint32 itemId)
{
    auto itr = itemInfoCache.find(itemId);
    return itr == itemInfoCache.end() ? 0 : itr->second.minLevel;
}

uint32 RandomItemMgr::GetStatWeight(Player* /*player*/, uint32 itemId)
{
    auto itr = itemInfoCache.find(itemId);
    return itr == itemInfoCache.end() ? 0 : itr->second.itemId;
}

uint32 RandomItemMgr::GetLiveStatWeight(Player* player, uint32 itemId)
{
    if (!player)
        return 0;

    StatsWeightCalculator calculator(player);
    calculator.SetItemSetBonus(false);
    calculator.SetOverflowPenalty(false);
    return static_cast<uint32>(std::max(0.0f, calculator.CalculateItem(itemId)));
}

uint32 RandomItemMgr::GetRandomItem(uint32 level, RandomItemType type, RandomItemPredicate* predicate)
{
    RandomItemList items = Query(level, type, predicate ? predicate : predicates[type]);
    return items.empty() ? 0 : items[urand(0, items.size() - 1)];
}

std::vector<uint32> RandomItemMgr::GetCachedEquipments(uint32 requiredLevel, uint32 inventoryType)
{
    for (int32 level = static_cast<int32>(requiredLevel); level >= 1; --level)
    {
        auto levelItr = equipCacheNew.find(level);
        if (levelItr == equipCacheNew.end())
            continue;

        auto itemItr = levelItr->second.find(inventoryType);
        if (itemItr != levelItr->second.end() && !itemItr->second.empty())
            return itemItr->second;
    }

    return {};
}

std::vector<uint32> RandomItemMgr::GetAmmo(uint32 level, uint32 subClass)
{
    for (int32 current = static_cast<int32>(level); current >= 1; --current)
    {
        auto levelItr = ammoCache.find(current);
        if (levelItr == ammoCache.end())
            continue;

        auto ammoItr = levelItr->second.find(subClass);
        if (ammoItr != levelItr->second.end() && !ammoItr->second.empty())
            return ammoItr->second;
    }

    return {};
}

uint32 RandomItemMgr::GetRandomPotion(uint32 level, uint32 effect)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 20); --current)
    {
        auto levelItr = potionCache.find(current);
        if (levelItr == potionCache.end())
            continue;

        auto potionItr = levelItr->second.find(effect);
        if (potionItr != levelItr->second.end() && !potionItr->second.empty())
            return potionItr->second[urand(0, potionItr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::GetFood(uint32 level, uint32 category)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        auto levelItr = foodCache.find(current);
        if (levelItr == foodCache.end())
            continue;

        auto foodItr = levelItr->second.find(category);
        if (foodItr != levelItr->second.end() && !foodItr->second.empty())
            return foodItr->second.front();
    }

    return 0;
}

uint32 RandomItemMgr::GetRandomFood(uint32 level, uint32 category)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        auto levelItr = foodCache.find(current);
        if (levelItr == foodCache.end())
            continue;

        auto foodItr = levelItr->second.find(category);
        if (foodItr != levelItr->second.end() && !foodItr->second.empty())
            return foodItr->second[urand(0, foodItr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::GetRandomTrade(uint32 level)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        auto itr = tradeCache.find(current);
        if (itr != tradeCache.end() && !itr->second.empty())
            return itr->second[urand(0, itr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::CalculateStatWeight(uint8 /*playerclass*/, uint8 /*spec*/, ItemTemplate const* /*proto*/) { return 0; }
uint32 RandomItemMgr::CalculateSingleStatWeight(uint8 /*playerclass*/, uint8 /*spec*/, std::string /*stat*/, uint32 /*value*/) { return 0; }

bool RandomItemMgr::CanEquipArmor(uint8 clazz, uint32 level, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->Class != ITEM_CLASS_ARMOR)
        return true;

    switch (proto->SubClass)
    {
        case ITEM_SUBCLASS_ARMOR_CLOTH:
            return true;
        case ITEM_SUBCLASS_ARMOR_LEATHER:
            return clazz != CLASS_MAGE && clazz != CLASS_PRIEST && clazz != CLASS_WARLOCK;
        case ITEM_SUBCLASS_ARMOR_MAIL:
            return clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN || (clazz == CLASS_HUNTER && level >= 40) ||
                (clazz == CLASS_SHAMAN && level >= 40);
        case ITEM_SUBCLASS_ARMOR_PLATE:
            return (clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN) && level >= 40;
        case ITEM_SUBCLASS_ARMOR_SHIELD:
            return clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN || clazz == CLASS_SHAMAN;
        default:
            return true;
    }
}

bool RandomItemMgr::ShouldEquipArmorForSpec(uint8 playerclass, uint8 /*spec*/, ItemTemplate const* proto)
{
    return CanEquipArmor(playerclass, proto ? NormalizeLevel(proto) : 1, proto);
}

bool RandomItemMgr::CanEquipWeapon(uint8 clazz, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->Class != ITEM_CLASS_WEAPON)
        return true;

    switch (clazz)
    {
        case CLASS_WARRIOR:
            return true;
        case CLASS_PALADIN:
            return proto->SubClass != ITEM_SUBCLASS_WEAPON_WAND &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_THROWN &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_BOW &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_GUN;
        case CLASS_HUNTER:
            return proto->SubClass != ITEM_SUBCLASS_WEAPON_MACE2 &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_SWORD2 &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_WAND;
        case CLASS_ROGUE:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_THROWN;
        case CLASS_PRIEST:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_WAND;
        case CLASS_SHAMAN:
            return proto->SubClass != ITEM_SUBCLASS_WEAPON_SWORD &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_SWORD2 &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_POLEARM &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_BOW &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_GUN &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_CROSSBOW &&
                proto->SubClass != ITEM_SUBCLASS_WEAPON_WAND;
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_WAND;
        case CLASS_DRUID:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE2 ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST;
        default:
            return true;
    }
}

bool RandomItemMgr::ShouldEquipWeaponForSpec(uint8 playerclass, uint8 /*spec*/, ItemTemplate const* proto)
{
    return CanEquipWeapon(playerclass, proto);
}

float RandomItemMgr::GetItemRarity(uint32 itemId)
{
    auto itr = rarityCache.find(itemId);
    return itr == rarityCache.end() ? 0.0f : itr->second;
}

uint32 RandomItemMgr::GetQuestIdForItem(uint32 /*itemId*/) { return 0; }
std::vector<uint32> RandomItemMgr::GetQuestIdsForItem(uint32 /*itemId*/) { return {}; }
bool RandomItemMgr::IsUsedBySkill(ItemTemplate const* /*proto*/, uint32 /*skillId*/) { return false; }

void RandomItemMgr::BuildRandomItemCache()
{
    randomItemCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto))
            continue;

        uint32 level = NormalizeLevel(proto) / 10;
        for (auto& predicate : predicates)
        {
            if (predicate.second->Apply(proto))
                randomItemCache[level][predicate.first].push_back(proto->ItemId);
        }
    }
}

void RandomItemMgr::BuildEquipCache() { }

void RandomItemMgr::BuildEquipCacheNew()
{
    equipCacheNew.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto) || !CanEquipItemNew(proto) || !IsEquipClass(proto))
            continue;

        equipCacheNew[NormalizeLevel(proto)][proto->InventoryType].push_back(proto->ItemId);
    }

    LOG_INFO("server.loading", "Random item equipment cache built for %zu levels", equipCacheNew.size());
}

void RandomItemMgr::BuildItemInfoCache()
{
    itemInfoCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto))
            continue;

        ItemInfoEntry info;
        info.minLevel = NormalizeLevel(proto);
        info.quality = proto->Quality;
        info.slot = proto->InventoryType;
        info.itemId = proto->ItemId;
        itemInfoCache[proto->ItemId] = info;
    }
}

void RandomItemMgr::BuildAmmoCache()
{
    ammoCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto) || proto->InventoryType != INVTYPE_AMMO)
            continue;

        ammoCache[NormalizeLevel(proto)][proto->SubClass].push_back(proto->ItemId);
    }
}

void RandomItemMgr::BuildFoodCache()
{
    foodCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto))
            continue;

        if (proto->Class != ITEM_CLASS_CONSUMABLE || proto->SubClass != ITEM_SUBCLASS_FOOD || proto->Bonding != NO_BIND)
            continue;

        if (HasFoodCategory(proto, 11))
            foodCache[NormalizeLevel(proto)][11].push_back(proto->ItemId);
        if (HasFoodCategory(proto, 59))
            foodCache[NormalizeLevel(proto)][59].push_back(proto->ItemId);
    }
}

void RandomItemMgr::BuildPotionCache()
{
    potionCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto))
            continue;

        if (proto->Class != ITEM_CLASS_CONSUMABLE)
            continue;

        if (HasSpellEffect(proto, SPELL_EFFECT_HEAL))
            potionCache[NormalizeLevel(proto)][SPELL_EFFECT_HEAL].push_back(proto->ItemId);
        if (HasSpellEffect(proto, SPELL_EFFECT_ENERGIZE))
            potionCache[NormalizeLevel(proto)][SPELL_EFFECT_ENERGIZE].push_back(proto->ItemId);
    }
}

void RandomItemMgr::BuildTradeCache()
{
    tradeCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto) || proto->Bonding != NO_BIND)
            continue;

        if (proto->Class == ITEM_CLASS_TRADE_GOODS ||
            (proto->Class == ITEM_CLASS_CONSUMABLE && proto->SubClass != ITEM_SUBCLASS_POTION))
        {
            tradeCache[NormalizeLevel(proto)].push_back(proto->ItemId);
        }
    }
}

void RandomItemMgr::BuildRarityCache()
{
    rarityCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (auto const& entry : itemTemplates)
    {
        ItemTemplate const* proto = &entry.second;
        if (IsIgnoredItem(proto))
            continue;

        rarityCache[proto->ItemId] = static_cast<float>(proto->Quality);
    }
}

bool RandomItemMgr::CanEquipItem(BotEquipKey key, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    auto viable = viableSlots.find(static_cast<EquipmentSlots>(key.slot));
    if (viable == viableSlots.end())
        return false;

    return viable->second.find(static_cast<InventoryType>(proto->InventoryType)) != viable->second.end();
}

bool RandomItemMgr::CanEquipItemNew(ItemTemplate const* proto)
{
    if (!proto)
        return false;

    for (auto const& slots : viableSlots)
    {
        if (slots.second.find(static_cast<InventoryType>(proto->InventoryType)) != slots.second.end())
            return true;
    }

    return false;
}

void RandomItemMgr::AddItemStats(uint32 /*mod*/, uint8& /*sp*/, uint8& /*ap*/, uint8& /*tank*/) { }
bool RandomItemMgr::CheckItemStats(uint8 /*clazz*/, uint8 /*sp*/, uint8 /*ap*/, uint8 /*tank*/) { return true; }
