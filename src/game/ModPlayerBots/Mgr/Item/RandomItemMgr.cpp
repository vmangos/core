/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "RandomItemMgr.h"

#include <algorithm>
#include <cctype>
#include <set>
#include <unordered_set>

#include "Bag.h"
#include "Bot/Factory/AiFactory.h"
#include "DBCStores.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotAIConfig.h"
#include "Playerbots.h"
#include "QuestDef.h"
#include "SharedDefines.h"
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

    if (proto->HasItemFlag(ITEM_FLAG_DEPRECATED))
        return true;

    if (ContainsInsensitive(proto->Name1, "qa") || ContainsInsensitive(proto->Name1, "test") ||
        ContainsInsensitive(proto->Name1, "deprecated") || ContainsInsensitive(proto->Name1, "unused") ||
        ContainsInsensitive(proto->Name1, "monster") || ContainsInsensitive(proto->Name1, "[ph]") ||
        ContainsInsensitive(proto->Name1, "zzold"))
        return true;

    return false;
}

uint32 NormalizeLevel(ItemTemplate const* proto)
{
    if (!proto)
        return 1;

    if (proto->RequiredLevel)
        return std::max<uint32>(1, proto->RequiredLevel);

    if (proto->SourceQuestLevel > 0)
        return std::max<uint32>(1, uint32(proto->SourceQuestLevel));

    return std::max<uint32>(1, proto->ItemLevel);
}

uint32 GetRandomItemBucket(uint32 level)
{
    return level > 0 ? (level - 1) / 10 : 0;
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

bool IsVanillaPlayableClass(uint8 clazz)
{
    switch (clazz)
    {
        case CLASS_WARRIOR:
        case CLASS_PALADIN:
        case CLASS_HUNTER:
        case CLASS_ROGUE:
        case CLASS_PRIEST:
        case CLASS_SHAMAN:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
        case CLASS_DRUID:
            return true;
        default:
            return false;
    }
}

bool GetWeightScaleTab(uint8 clazz, std::string const& name, uint8& tab)
{
    switch (clazz)
    {
        case CLASS_WARRIOR:
            if (name == "arms") tab = WARRIOR_TAB_ARMS;
            else if (name == "fury") tab = WARRIOR_TAB_FURY;
            else if (name == "prot") tab = WARRIOR_TAB_PROTECTION;
            else return false;
            return true;
        case CLASS_PALADIN:
            if (name == "holy") tab = PALADIN_TAB_HOLY;
            else if (name == "prot") tab = PALADIN_TAB_PROTECTION;
            else if (name == "retrib") tab = PALADIN_TAB_RETRIBUTION;
            else return false;
            return true;
        case CLASS_HUNTER:
            if (name == "beast") tab = HUNTER_TAB_BEAST_MASTERY;
            else if (name == "marks") tab = HUNTER_TAB_MARKSMANSHIP;
            else if (name == "surv") tab = HUNTER_TAB_SURVIVAL;
            else return false;
            return true;
        case CLASS_ROGUE:
            if (name == "assas") tab = ROGUE_TAB_ASSASSINATION;
            else if (name == "combat") tab = ROGUE_TAB_COMBAT;
            else if (name == "subtle") tab = ROGUE_TAB_SUBTLETY;
            else return false;
            return true;
        case CLASS_PRIEST:
            if (name == "disc") tab = PRIEST_TAB_DISCIPLINE;
            else if (name == "holy") tab = PRIEST_TAB_HOLY;
            else if (name == "shadow") tab = PRIEST_TAB_SHADOW;
            else return false;
            return true;
        case CLASS_SHAMAN:
            if (name == "elem") tab = SHAMAN_TAB_ELEMENTAL;
            else if (name == "enhance") tab = SHAMAN_TAB_ENHANCEMENT;
            else if (name == "resto") tab = SHAMAN_TAB_RESTORATION;
            else return false;
            return true;
        case CLASS_MAGE:
            if (name == "arcane") tab = MAGE_TAB_ARCANE;
            else if (name == "fire") tab = MAGE_TAB_FIRE;
            else if (name == "frost") tab = MAGE_TAB_FROST;
            else return false;
            return true;
        case CLASS_WARLOCK:
            if (name == "afflic") tab = WARLOCK_TAB_AFFLICTION;
            else if (name == "demo") tab = WARLOCK_TAB_DEMONOLOGY;
            else if (name == "destro") tab = WARLOCK_TAB_DESTRUCTION;
            else return false;
            return true;
        case CLASS_DRUID:
            if (name == "balance") tab = DRUID_TAB_BALANCE;
            else if (name == "feraldps") tab = DRUID_TAB_FERAL;
            else if (name == "resto") tab = DRUID_TAB_RESTORATION;
            else if (name == "feraltank") tab = DRUID_TAB_FERAL;
            else return false;
            return true;
        default:
            return false;
    }
}

uint32 GetItemCacheKey(uint32 itemId, uint32 skillId)
{
    return itemId * 1024u + (skillId & 1023u);
}

bool IsRecipeForSkill(ItemTemplate const* recipe, uint32 skillId)
{
    if (!recipe || recipe->Class != ITEM_CLASS_RECIPE)
        return false;

    switch (skillId)
    {
        case SKILL_LEATHERWORKING: return recipe->SubClass == ITEM_SUBCLASS_LEATHERWORKING_PATTERN;
        case SKILL_TAILORING: return recipe->SubClass == ITEM_SUBCLASS_TAILORING_PATTERN;
        case SKILL_ENGINEERING: return recipe->SubClass == ITEM_SUBCLASS_ENGINEERING_SCHEMATIC;
        case SKILL_BLACKSMITHING: return recipe->SubClass == ITEM_SUBCLASS_BLACKSMITHING;
        case SKILL_COOKING: return recipe->SubClass == ITEM_SUBCLASS_COOKING_RECIPE;
        case SKILL_ALCHEMY: return recipe->SubClass == ITEM_SUBCLASS_ALCHEMY_RECIPE;
        case SKILL_FIRST_AID: return recipe->SubClass == ITEM_SUBCLASS_FIRST_AID_MANUAL;
        case SKILL_ENCHANTING: return recipe->SubClass == ITEM_SUBCLASS_ENCHANTING_FORMULA;
        case SKILL_FISHING: return recipe->SubClass == ITEM_SUBCLASS_FISHING_MANUAL;
        default: return false;
    }
}

bool IsCraftedBySpellInfo(ItemTemplate const* proto, SpellEntry const* spellInfo)
{
    if (!proto || !spellInfo)
        return false;

    for (uint32 x = 0; x < MAX_SPELL_REAGENTS; ++x)
    {
        if (spellInfo->Reagent[x] > 0 && proto->ItemId == uint32(spellInfo->Reagent[x]))
            return true;
    }

    for (uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (spellInfo->Effect[i] == SPELL_EFFECT_CREATE_ITEM && spellInfo->EffectItemType[i] == proto->ItemId)
            return true;
    }

    return false;
}

bool IsCraftedBySpell(ItemTemplate const* proto, uint32 spellId)
{
    return IsCraftedBySpellInfo(proto, sSpellMgr.GetSpellEntry(spellId));
}

bool IsCraftedBy(ItemTemplate const* proto, uint32 spellId)
{
    if (IsCraftedBySpell(proto, spellId))
        return true;

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
    if (!spellInfo)
        return false;

    for (uint8 effect = 0; effect < MAX_EFFECT_INDEX; ++effect)
    {
        uint32 triggeredSpellId = spellInfo->EffectTriggerSpell[effect];
        if (!triggeredSpellId)
            continue;

        if (IsCraftedBySpellInfo(proto, sSpellMgr.GetSpellEntry(triggeredSpellId)))
            return true;
    }

    return false;
}

bool ContainsInternal(ItemTemplate const* proto, uint32 skillId)
{
    if (!proto)
        return false;

    if (proto->RequiredSkill == skillId)
        return true;

    for (uint32 row = 0; row < sObjectMgr.GetMaxSkillLineAbilityId(); ++row)
    {
        SkillLineAbilityEntry const* skillLine = sObjectMgr.GetSkillLineAbility(row);
        if (!skillLine || skillLine->skillId != skillId)
            continue;

        if (IsCraftedBy(proto, skillLine->spellId))
            return true;
    }

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* recipe = &itr->second;
        if (!IsRecipeForSkill(recipe, skillId))
            continue;

        for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        {
            if (!recipe->Spells[i].SpellId)
                continue;

            if (IsCraftedBy(proto, recipe->Spells[i].SpellId))
                return true;
        }
    }

    return false;
}

bool LoadVendorItems(std::set<uint32>& vendorItems)
{
    vendorItems.clear();

    std::unique_ptr<QueryResult> result = WorldDatabase.Query("SELECT DISTINCT `item` FROM `npc_vendor`");
    if (!result)
        return false;

    do
    {
        Field* fields = result->Fetch();
        vendorItems.insert(fields[0].GetUInt32());
    } while (result->NextRow());

    return true;
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
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_RELIC);
    viableSlots[EQUIPMENT_SLOT_RANGED].insert(INVTYPE_AMMO);
    viableSlots[EQUIPMENT_SLOT_TABARD].insert(INVTYPE_TABARD);
    viableSlots[EQUIPMENT_SLOT_BACK].insert(INVTYPE_CLOAK);
}

RandomItemMgr::~RandomItemMgr()
{
    for (std::map<RandomItemType, RandomItemPredicate*>::iterator itr = predicates.begin(); itr != predicates.end(); ++itr)
        delete itr->second;
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
    std::map<uint32, RandomItemCache>::iterator levelItr = randomItemCache.find(GetRandomItemBucket(level));
    if (levelItr == randomItemCache.end())
        return result;

    RandomItemCache::iterator typeItr = levelItr->second.find(type);
    if (typeItr == levelItr->second.end())
        return result;

    for (RandomItemList::const_iterator itr = typeItr->second.begin(); itr != typeItr->second.end(); ++itr)
    {
        ItemTemplate const* proto = sObjectMgr.GetItemTemplate(*itr);
        if (!proto)
            continue;

        if (predicate && !predicate->Apply(proto))
            continue;

        result.push_back(*itr);
    }

    return result;
}

RandomItemList RandomItemMgr::Query(uint32 level, uint8 clazz, uint8 slot, uint32 quality)
{
    RandomItemList result;
    std::vector<uint32> items = GetCachedEquipments(level, slot);
    for (std::vector<uint32>::const_iterator itr = items.begin(); itr != items.end(); ++itr)
    {
        ItemTemplate const* proto = sObjectMgr.GetItemTemplate(*itr);
        if (!proto)
            continue;

        if (quality && proto->Quality != quality)
            continue;

        if (proto->Class == ITEM_CLASS_WEAPON && !CanEquipWeapon(clazz, proto))
            continue;

        if (proto->Class == ITEM_CLASS_ARMOR && !CanEquipArmor(clazz, level, proto))
            continue;

        result.push_back(*itr);
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
    RandomItemList candidates = Query(player->GetLevel(), player->getClass(), slot, quality);
    for (RandomItemList::const_iterator itr = candidates.begin(); itr != candidates.end(); ++itr)
    {
        if (*itr == itemId)
            continue;

        if (calculator.CalculateItem(*itr) <= currentScore)
            continue;

        result.push_back(*itr);
        if (result.size() >= amount)
            break;
    }

    return result;
}

bool RandomItemMgr::HasStatWeight(uint32 itemId) { return itemInfoCache.find(itemId) != itemInfoCache.end(); }

uint32 RandomItemMgr::GetMinLevelFromCache(uint32 itemId)
{
    std::map<uint32, ItemInfoEntry>::iterator itr = itemInfoCache.find(itemId);
    return itr == itemInfoCache.end() ? 0 : itr->second.minLevel;
}

uint32 RandomItemMgr::GetStatWeight(Player* player, uint32 itemId)
{
    if (!player)
        return 0;

    std::map<uint32, ItemInfoEntry>::iterator infoItr = itemInfoCache.find(itemId);
    if (infoItr == itemInfoCache.end())
        return 0;

    uint8 clazz = player->getClass();
    uint8 spec = AiFactory::GetPlayerSpecTab(player);
    if (!m_weightScales[clazz].count(spec))
        return 0;

    uint32 scaleId = m_weightScales[clazz][spec].info.id;
    if (!scaleId)
        return 0;

    return infoItr->second.weights[scaleId];
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
        std::map<uint32, std::map<uint32, std::vector<uint32>>>::iterator levelItr = equipCacheNew.find(level);
        if (levelItr == equipCacheNew.end())
            continue;

        std::map<uint32, std::vector<uint32> >::iterator itemItr = levelItr->second.find(inventoryType);
        if (itemItr != levelItr->second.end() && !itemItr->second.empty())
            return itemItr->second;
    }

    return std::vector<uint32>();
}

std::vector<uint32> RandomItemMgr::GetAmmo(uint32 level, uint32 subClass)
{
    for (int32 current = static_cast<int32>(level); current >= 1; --current)
    {
        std::map<uint32, std::map<uint32, std::vector<uint32>>>::iterator levelItr = ammoCache.find(current);
        if (levelItr == ammoCache.end())
            continue;

        std::map<uint32, std::vector<uint32> >::iterator ammoItr = levelItr->second.find(subClass);
        if (ammoItr != levelItr->second.end() && !ammoItr->second.empty())
            return ammoItr->second;
    }

    return std::vector<uint32>();
}

uint32 RandomItemMgr::GetRandomPotion(uint32 level, uint32 effect)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 20); --current)
    {
        std::map<uint32, std::map<uint32, std::vector<uint32>>>::iterator levelItr = potionCache.find(current);
        if (levelItr == potionCache.end())
            continue;

        std::map<uint32, std::vector<uint32> >::iterator potionItr = levelItr->second.find(effect);
        if (potionItr != levelItr->second.end() && !potionItr->second.empty())
            return potionItr->second[urand(0, potionItr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::GetFood(uint32 level, uint32 category)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        std::map<uint32, std::map<uint32, std::vector<uint32>>>::iterator levelItr = foodCache.find(current);
        if (levelItr == foodCache.end())
            continue;

        std::map<uint32, std::vector<uint32> >::iterator foodItr = levelItr->second.find(category);
        if (foodItr != levelItr->second.end() && !foodItr->second.empty())
            return foodItr->second.front();
    }

    return 0;
}

uint32 RandomItemMgr::GetRandomFood(uint32 level, uint32 category)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        std::map<uint32, std::map<uint32, std::vector<uint32>>>::iterator levelItr = foodCache.find(current);
        if (levelItr == foodCache.end())
            continue;

        std::map<uint32, std::vector<uint32> >::iterator foodItr = levelItr->second.find(category);
        if (foodItr != levelItr->second.end() && !foodItr->second.empty())
            return foodItr->second[urand(0, foodItr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::GetRandomTrade(uint32 level)
{
    for (int32 current = static_cast<int32>(level); current >= std::max<int32>(1, static_cast<int32>(level) - 10); --current)
    {
        std::map<uint32, std::vector<uint32> >::iterator itr = tradeCache.find(current);
        if (itr != tradeCache.end() && !itr->second.empty())
            return itr->second[urand(0, itr->second.size() - 1)];
    }

    return 0;
}

uint32 RandomItemMgr::CalculateStatWeight(uint8 playerclass, uint8 spec, ItemTemplate const* proto)
{
    if (!proto)
        return 0;

    std::map<uint8, WeightScale>::iterator scaleItr = m_weightScales[playerclass].find(spec);
    if (scaleItr == m_weightScales[playerclass].end() || !scaleItr->second.info.id)
        return 0;

    if (proto->Class == ITEM_CLASS_ARMOR &&
        (proto->InventoryType == INVTYPE_HEAD || proto->InventoryType == INVTYPE_SHOULDERS ||
         proto->InventoryType == INVTYPE_CHEST || proto->InventoryType == INVTYPE_ROBE ||
         proto->InventoryType == INVTYPE_WAIST || proto->InventoryType == INVTYPE_LEGS ||
         proto->InventoryType == INVTYPE_FEET || proto->InventoryType == INVTYPE_WRISTS ||
         proto->InventoryType == INVTYPE_HANDS || proto->InventoryType == INVTYPE_HOLDABLE ||
         proto->InventoryType == INVTYPE_SHIELD || proto->InventoryType == INVTYPE_RANGED) &&
        !ShouldEquipArmorForSpec(playerclass, spec, proto))
        return 0;

    if ((proto->Class == ITEM_CLASS_WEAPON || proto->SubClass == ITEM_SUBCLASS_ARMOR_SHIELD ||
         proto->InventoryType == INVTYPE_HOLDABLE || proto->InventoryType == INVTYPE_RANGED ||
         proto->InventoryType == INVTYPE_THROWN || proto->InventoryType == INVTYPE_RANGEDRIGHT ||
         proto->InventoryType == INVTYPE_RELIC) &&
        !ShouldEquipWeaponForSpec(playerclass, spec, proto))
        return 0;

    uint32 statWeight = 0;
    uint32 spellPower = 0;
    uint32 spellHeal = 0;
    uint32 attackPower = 0;
    int32 basicStatsWeight = 0;
    bool isCasterItem = false;
    bool isAttackItem = false;
    bool hasInt = false;
    bool noCaster = playerclass == CLASS_WARRIOR || playerclass == CLASS_ROGUE || playerclass == CLASS_HUNTER;
    bool hasMana = !(playerclass == CLASS_WARRIOR || playerclass == CLASS_ROGUE);

    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_LIBRAM || proto->SubClass == ITEM_SUBCLASS_ARMOR_IDOL ||
        proto->SubClass == ITEM_SUBCLASS_ARMOR_TOTEM)
        return proto->Quality + proto->ItemLevel;

    for (uint8 j = 0; j < MAX_ITEM_PROTO_STATS; ++j)
    {
        uint32 statType = proto->ItemStat[j].ItemStatType;
        int32 val = proto->ItemStat[j].ItemStatValue;
        std::string weightName;

        if (!val)
            continue;

        switch (statType)
        {
            case ITEM_MOD_STAMINA: weightName = "sta"; break;
            case ITEM_MOD_STRENGTH: weightName = "str"; break;
            case ITEM_MOD_AGILITY: weightName = "agi"; break;
            case ITEM_MOD_INTELLECT: weightName = "int"; break;
            case ITEM_MOD_SPIRIT: weightName = "spi"; break;
            default: break;
        }

        if (weightName.empty())
            continue;

        basicStatsWeight += static_cast<int32>(CalculateSingleStatWeight(playerclass, spec, weightName, std::abs(val)));
        if (weightName == "int")
        {
            hasInt = true;
            if (!noCaster)
                isCasterItem = true;
        }
        else if (weightName == "spi")
            isCasterItem = true;
        else if (weightName == "str" || weightName == "agi")
            isAttackItem = true;
    }

    if (proto->Armor > 0)
        statWeight += CalculateSingleStatWeight(playerclass, spec, "armor", proto->Armor);
    if (proto->Block > 0)
        statWeight += CalculateSingleStatWeight(playerclass, spec, "block", proto->Block);

    if (proto->Class == ITEM_CLASS_WEAPON && proto->Delay)
    {
        for (uint8 i = 0; i < MAX_ITEM_PROTO_DAMAGES; ++i)
        {
            if (!proto->Damage[i].DamageMax)
                continue;

            uint32 dps = static_cast<uint32>(((proto->Damage[i].DamageMin + proto->Damage[i].DamageMax) / 2.0f) /
                (float(proto->Delay) / 1000.0f));
            if (!dps)
                continue;

            statWeight += CalculateSingleStatWeight(playerclass, spec, proto->IsRangedWeapon() ? "rgddps" : "mledps", dps);
        }
    }

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (!proto->Spells[i].SpellId || proto->Spells[i].SpellTrigger != ITEM_SPELLTRIGGER_ON_EQUIP)
            continue;

        SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(proto->Spells[i].SpellId);
        if (!spellInfo)
            continue;

        for (uint8 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            int32 base = spellInfo->EffectBasePoints[j] + 1;
            if (!base || spellInfo->Effect[j] != SPELL_EFFECT_APPLY_AURA)
                continue;

            switch (spellInfo->EffectApplyAuraName[j])
            {
                case SPELL_AURA_MOD_DAMAGE_DONE:
                    if (spellInfo->EffectMiscValue[j] & SPELL_SCHOOL_MASK_MAGIC)
                    {
                        isCasterItem = true;
                        spellPower += CalculateSingleStatWeight(playerclass, spec, "splpwr", std::abs(base));
                    }
                    break;
                case SPELL_AURA_MOD_HEALING_DONE:
                    isCasterItem = true;
                    spellHeal += CalculateSingleStatWeight(playerclass, spec, "splpwr", std::abs(base));
                    break;
                case SPELL_AURA_MOD_SPELL_HIT_CHANCE:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "spellhitrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_SPELL_CRIT_CHANCE:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "spellcritstrkrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_TARGET_RESISTANCE:
                    if (spellInfo->EffectMiscValue[j] == SPELL_SCHOOL_MASK_MAGIC)
                        statWeight += CalculateSingleStatWeight(playerclass, spec, "spellpenrtng", std::abs(base));
                    else if (spellInfo->EffectMiscValue[j] == SPELL_SCHOOL_MASK_NORMAL)
                        statWeight += CalculateSingleStatWeight(playerclass, spec, "armorpenrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_ATTACK_POWER:
                case SPELL_AURA_MOD_RANGED_ATTACK_POWER:
                    isAttackItem = true;
                    attackPower += CalculateSingleStatWeight(playerclass, spec, "atkpwr", std::abs(base));
                    break;
                case SPELL_AURA_MOD_SHIELD_BLOCKVALUE:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "block", std::abs(base));
                    break;
                case SPELL_AURA_MOD_BLOCK_PERCENT:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "blockrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_HIT_CHANCE:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "hitrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_CRIT_PERCENT:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "critstrkrtng", std::abs(base));
                    break;
                case SPELL_AURA_MOD_POWER_REGEN:
                    statWeight += CalculateSingleStatWeight(playerclass, spec, "manargn", std::abs(base));
                    break;
                default:
                    break;
            }
        }
    }

    if (isCasterItem || hasInt)
    {
        if ((!hasMana || noCaster) && spellPower)
            return 0;

        if (!hasMana && hasInt)
            return 0;

        bool playerCaster = false;
        for (WeightScaleStats::const_iterator itr = scaleItr->second.stats.begin(); itr != scaleItr->second.stats.end(); ++itr)
        {
            if (itr->stat == "splpwr" || itr->stat == "int" || itr->stat == "manargn" || itr->stat == "spi")
            {
                playerCaster = true;
                break;
            }
        }

        if (!playerCaster)
            return 0;
    }

    if (isAttackItem)
    {
        if (hasMana && !noCaster && !(hasInt || spellPower))
            return 0;

        bool playerAttacker = false;
        for (WeightScaleStats::const_iterator itr = scaleItr->second.stats.begin(); itr != scaleItr->second.stats.end(); ++itr)
        {
            if (itr->stat == "str" || itr->stat == "agi" || itr->stat == "atkpwr" ||
                itr->stat == "mledps" || itr->stat == "rgddps")
            {
                playerAttacker = true;
                break;
            }
        }

        if (!playerAttacker)
            return 0;
    }

    statWeight += spellPower + spellHeal + attackPower;
    if (basicStatsWeight > 0)
        statWeight += uint32(basicStatsWeight);

    return statWeight;
}

uint32 RandomItemMgr::CalculateSingleStatWeight(uint8 playerclass, uint8 spec, std::string stat, uint32 value)
{
    std::map<uint8, WeightScale>::iterator scaleItr = m_weightScales[playerclass].find(spec);
    if (scaleItr == m_weightScales[playerclass].end())
        return 0;

    for (WeightScaleStats::const_iterator itr = scaleItr->second.stats.begin(); itr != scaleItr->second.stats.end(); ++itr)
    {
        if (itr->stat == stat)
            return itr->weight * value;
    }

    return 0;
}

bool RandomItemMgr::CanEquipArmor(uint8 clazz, uint32 level, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->InventoryType == INVTYPE_TABARD || proto->InventoryType == INVTYPE_CLOAK)
        return true;

    if (proto->Class != ITEM_CLASS_ARMOR)
        return true;

    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_LIBRAM)
        return clazz == CLASS_PALADIN;
    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_IDOL)
        return clazz == CLASS_DRUID;
    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_TOTEM)
        return clazz == CLASS_SHAMAN;

    switch (proto->SubClass)
    {
        case ITEM_SUBCLASS_ARMOR_CLOTH:
            break;
        case ITEM_SUBCLASS_ARMOR_LEATHER:
            if (clazz == CLASS_MAGE || clazz == CLASS_PRIEST || clazz == CLASS_WARLOCK)
                return false;
            break;
        case ITEM_SUBCLASS_ARMOR_MAIL:
            if (!(clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN || (clazz == CLASS_HUNTER && level >= 40) ||
                  (clazz == CLASS_SHAMAN && level >= 40)))
                return false;
            break;
        case ITEM_SUBCLASS_ARMOR_PLATE:
            if (!((clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN) && level >= 40))
                return false;
            break;
        case ITEM_SUBCLASS_ARMOR_SHIELD:
        case ITEM_SUBCLASS_ARMOR_BUCKLER:
            return clazz == CLASS_WARRIOR || clazz == CLASS_PALADIN || clazz == CLASS_SHAMAN;
        default:
            break;
    }

    if (proto->Quality <= ITEM_QUALITY_NORMAL)
        return true;

    uint8 sp = 0, ap = 0, tank = 0;
    for (uint8 j = 0; j < MAX_ITEM_PROTO_STATS; ++j)
    {
        if (!proto->ItemStat[j].ItemStatValue)
            continue;

        AddItemStats(proto->ItemStat[j].ItemStatType, sp, ap, tank);
    }

    return CheckItemStats(clazz, sp, ap, tank);
}

bool RandomItemMgr::ShouldEquipArmorForSpec(uint8 playerclass, uint8 spec, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->InventoryType == INVTYPE_TABARD || proto->InventoryType == INVTYPE_CLOAK)
        return true;

    if (proto->InventoryType == INVTYPE_HOLDABLE)
    {
        switch (playerclass)
        {
            case CLASS_PRIEST:
            case CLASS_MAGE:
            case CLASS_WARLOCK:
                return true;
            case CLASS_PALADIN:
                return spec == PALADIN_TAB_HOLY;
            case CLASS_SHAMAN:
                return spec != SHAMAN_TAB_ENHANCEMENT;
            case CLASS_DRUID:
                return spec != DRUID_TAB_FERAL;
            default:
                return false;
        }
    }

    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_LIBRAM || proto->SubClass == ITEM_SUBCLASS_ARMOR_IDOL ||
        proto->SubClass == ITEM_SUBCLASS_ARMOR_TOTEM)
        return CanEquipArmor(playerclass, NormalizeLevel(proto), proto);

    return CanEquipArmor(playerclass, NormalizeLevel(proto), proto);
}

bool RandomItemMgr::CanEquipWeapon(uint8 clazz, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->Class != ITEM_CLASS_WEAPON)
        return true;

    switch (clazz)
    {
        case CLASS_PRIEST:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF || proto->SubClass == ITEM_SUBCLASS_WEAPON_WAND ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE || proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER;
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF || proto->SubClass == ITEM_SUBCLASS_WEAPON_WAND ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER || proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD;
        case CLASS_WARRIOR:
            return proto->SubClass != ITEM_SUBCLASS_WEAPON_obsolete && proto->SubClass != ITEM_SUBCLASS_WEAPON_MISC;
        case CLASS_PALADIN:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE2 || proto->SubClass == ITEM_SUBCLASS_WEAPON_POLEARM ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD2 || proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE2 ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE || proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD;
        case CLASS_SHAMAN:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE || proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST || proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE2 ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE2 || proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF;
        case CLASS_DRUID:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE || proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE2 ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER || proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_POLEARM;
        case CLASS_HUNTER:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER || proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE2 || proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD2 || proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST || proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_POLEARM;
        case CLASS_ROGUE:
            return proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER || proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST || proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN || proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_THROWN ||
                proto->SubClass == ITEM_SUBCLASS_WEAPON_AXE;
        default:
            return false;
    }
}

bool RandomItemMgr::ShouldEquipWeaponForSpec(uint8 playerclass, uint8 spec, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->SubClass == ITEM_SUBCLASS_ARMOR_LIBRAM || proto->SubClass == ITEM_SUBCLASS_ARMOR_IDOL ||
        proto->SubClass == ITEM_SUBCLASS_ARMOR_TOTEM)
        return CanEquipArmor(playerclass, NormalizeLevel(proto), proto);

    if (proto->InventoryType == INVTYPE_HOLDABLE)
        return ShouldEquipArmorForSpec(playerclass, spec, proto);

    if (proto->InventoryType == INVTYPE_SHIELD)
        return playerclass == CLASS_WARRIOR || playerclass == CLASS_PALADIN ||
            (playerclass == CLASS_SHAMAN && spec != SHAMAN_TAB_ENHANCEMENT);

    if (proto->InventoryType == INVTYPE_RANGED || proto->InventoryType == INVTYPE_RANGEDRIGHT ||
        proto->InventoryType == INVTYPE_THROWN)
    {
        switch (playerclass)
        {
            case CLASS_HUNTER:
                return proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN ||
                    proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW;
            case CLASS_ROGUE:
                return proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN ||
                    proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_THROWN;
            case CLASS_WARRIOR:
                return proto->SubClass == ITEM_SUBCLASS_WEAPON_BOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_GUN ||
                    proto->SubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW || proto->SubClass == ITEM_SUBCLASS_WEAPON_THROWN;
            case CLASS_PRIEST:
            case CLASS_MAGE:
            case CLASS_WARLOCK:
                return proto->SubClass == ITEM_SUBCLASS_WEAPON_WAND;
            default:
                return false;
        }
    }

    if (!CanEquipWeapon(playerclass, proto))
        return false;

    if (playerclass == CLASS_WARRIOR || playerclass == CLASS_PALADIN)
    {
        if (spec == WARRIOR_TAB_PROTECTION || spec == PALADIN_TAB_PROTECTION)
            return proto->InventoryType != INVTYPE_2HWEAPON;
    }

    if (playerclass == CLASS_DRUID && spec == DRUID_TAB_FERAL)
        return proto->SubClass == ITEM_SUBCLASS_WEAPON_STAFF || proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE2;

    if (playerclass == CLASS_ROGUE && proto->InventoryType == INVTYPE_WEAPONOFFHAND)
        return proto->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER || proto->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
            proto->SubClass == ITEM_SUBCLASS_WEAPON_MACE || proto->SubClass == ITEM_SUBCLASS_WEAPON_FIST;

    return true;
}

float RandomItemMgr::GetItemRarity(uint32 itemId)
{
    std::map<uint32, float>::iterator itr = rarityCache.find(itemId);
    return itr == rarityCache.end() ? 0.0f : itr->second;
}

uint32 RandomItemMgr::GetQuestIdForItem(uint32 itemId)
{
    std::vector<uint32> questIds = GetQuestIdsForItem(itemId);
    return questIds.empty() ? 0 : questIds.front();
}

std::vector<uint32> RandomItemMgr::GetQuestIdsForItem(uint32 itemId)
{
    std::vector<uint32> questIds;
    ObjectMgr::QuestMap const& questTemplates = sObjectMgr.GetQuestTemplates();
    for (ObjectMgr::QuestMap::const_iterator itr = questTemplates.begin(); itr != questTemplates.end(); ++itr)
    {
        Quest const* quest = itr->second.get();
        if (!quest)
            continue;

        for (uint32 i = 0; i < quest->GetRewItemsCount(); ++i)
        {
            if (quest->RewItemId[i] == itemId)
            {
                questIds.push_back(quest->GetQuestId());
                break;
            }
        }

        for (uint32 i = 0; i < quest->GetRewChoiceItemsCount(); ++i)
        {
            if (quest->RewChoiceItemId[i] == itemId)
            {
                questIds.push_back(quest->GetQuestId());
                break;
            }
        }
    }

    return questIds;
}

bool RandomItemMgr::IsUsedBySkill(ItemTemplate const* proto, uint32 skillId)
{
    if (!proto || !skillId)
        return false;

    uint32 cacheKey = GetItemCacheKey(proto->ItemId, skillId);
    if (itemCache.find(cacheKey) != itemCache.end())
        return true;

    switch (proto->Class)
    {
        case ITEM_CLASS_TRADE_GOODS:
        case ITEM_CLASS_REAGENT:
        case ITEM_CLASS_GEM:
        case ITEM_CLASS_MISC:
        case ITEM_CLASS_RECIPE:
            break;
        default:
            return false;
    }

    if (ContainsInternal(proto, skillId))
    {
        itemCache.insert(cacheKey);
        return true;
    }

    return false;
}

void RandomItemMgr::BuildRandomItemCache()
{
    randomItemCache.clear();

    std::unique_ptr<QueryResult> result = PlayerbotsDatabase.PQuery("SELECT `lvl`, `type`, `item` FROM `playerbots_rnditem_cache`");
    if (result)
    {
        uint32 count = 0;
        do
        {
            Field* fields = result->Fetch();
            randomItemCache[fields[0].GetUInt32()][RandomItemType(fields[1].GetUInt32())].push_back(fields[2].GetUInt32());
            ++count;
        } while (result->NextRow());

        LOG_INFO("server.loading", "Loaded %u random item cache rows", count);
        if (count)
            return;
    }

    PlayerbotsDatabase.BeginTransaction();
    PlayerbotsDatabase.PExecute("DELETE FROM `playerbots_rnditem_cache`");

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    uint32 count = 0;
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (IsIgnoredItem(proto))
            continue;

        uint32 bucket = GetRandomItemBucket(NormalizeLevel(proto));
        for (uint32 type = RANDOM_ITEM_GUILD_TASK; type <= RANDOM_ITEM_GUILD_TASK_REWARD_TRADE_RARE; ++type)
        {
            RandomItemType rit = RandomItemType(type);
            if (predicates[rit] && !predicates[rit]->Apply(proto))
                continue;

            randomItemCache[bucket][rit].push_back(proto->ItemId);
            PlayerbotsDatabase.PExecute(
                "INSERT INTO `playerbots_rnditem_cache` (`lvl`, `type`, `item`) VALUES (%u, %u, %u)",
                bucket, type, proto->ItemId);
            ++count;
        }
    }

    PlayerbotsDatabase.CommitTransaction();
    LOG_INFO("server.loading", "Built %u random item cache rows", count);
}

void RandomItemMgr::BuildEquipCache() { }

void RandomItemMgr::BuildEquipCacheNew()
{
    equipCacheNew.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (IsIgnoredItem(proto) || !CanEquipItemNew(proto) || !IsEquipClass(proto))
            continue;

        equipCacheNew[NormalizeLevel(proto)][proto->InventoryType].push_back(proto->ItemId);
    }

    LOG_INFO("server.loading", "Random item equipment cache built for %zu levels", equipCacheNew.size());
}

void RandomItemMgr::BuildItemInfoCache()
{
    itemInfoCache.clear();
    itemForTest.clear();
    for (uint32 clazz = 0; clazz < MAX_CLASSES; ++clazz)
        m_weightScales[clazz].clear();

    std::unique_ptr<QueryResult> scaleResult =
        PlayerbotsDatabase.PQuery("SELECT `id`, `name`, `class` FROM `playerbots_weightscales` ORDER BY `class`, `id`");
    if (scaleResult)
    {
        do
        {
            Field* fields = scaleResult->Fetch();
            uint32 id = fields[0].GetUInt32();
            std::string name = fields[1].GetCppString();
            uint8 clazz = fields[2].GetUInt8();
            uint8 tab = 0;
            if (!IsVanillaPlayableClass(clazz) || !GetWeightScaleTab(clazz, name, tab))
                continue;

            WeightScale& scale = m_weightScales[clazz][tab];
            scale.info.id = id;
            scale.info.name = name;
        } while (scaleResult->NextRow());
    }

    std::unique_ptr<QueryResult> scaleDataResult =
        PlayerbotsDatabase.PQuery("SELECT `id`, `field`, `val` FROM `playerbots_weightscale_data` ORDER BY `id`");
    if (scaleDataResult)
    {
        do
        {
            Field* fields = scaleDataResult->Fetch();
            uint32 id = fields[0].GetUInt32();
            std::string field = fields[1].GetCppString();
            uint32 weight = fields[2].GetUInt32();

            for (uint32 clazz = 0; clazz < MAX_CLASSES; ++clazz)
            {
                for (std::map<uint8, WeightScale>::iterator itr = m_weightScales[clazz].begin();
                     itr != m_weightScales[clazz].end(); ++itr)
                {
                    if (itr->second.info.id != id)
                        continue;

                    WeightScaleStat stat;
                    stat.stat = field;
                    stat.weight = weight;
                    itr->second.stats.push_back(stat);
                }
            }
        } while (scaleDataResult->NextRow());
    }

    std::unique_ptr<QueryResult> cacheResult = PlayerbotsDatabase.PQuery(
        "SELECT `id`, `quality`, `slot`, `source`, `sourceId`, `team`, `faction`, `factionRepRank`, `minLevel`, "
        "`scale_1`, `scale_2`, `scale_3`, `scale_4`, `scale_5`, `scale_6`, `scale_7`, `scale_8`, `scale_9`, `scale_10`, "
        "`scale_11`, `scale_12`, `scale_13`, `scale_14`, `scale_15`, `scale_16`, `scale_17`, `scale_18`, `scale_19`, "
        "`scale_20`, `scale_21`, `scale_22`, `scale_23`, `scale_24`, `scale_25`, `scale_26`, `scale_27`, `scale_28`, "
        "`scale_29`, `scale_30`, `scale_31`, `scale_32` FROM `playerbots_item_info_cache`");
    if (cacheResult)
    {
        uint32 count = 0;
        do
        {
            Field* fields = cacheResult->Fetch();
            ItemInfoEntry info;
            info.itemId = fields[0].GetUInt32();
            info.quality = fields[1].GetUInt32();
            info.slot = fields[2].GetUInt32();
            info.source = fields[3].GetUInt32();
            info.sourceId = fields[4].GetUInt32();
            info.team = fields[5].GetUInt32();
            info.repFaction = fields[6].GetUInt32();
            info.repRank = fields[7].GetUInt32();
            info.minLevel = fields[8].GetUInt32();
            for (uint32 scale = 1; scale <= MAX_STAT_SCALES; ++scale)
                info.weights[scale] = fields[8 + scale].GetUInt32();

            itemInfoCache[info.itemId] = info;
            ++count;
        } while (cacheResult->NextRow());

        LOG_INFO("server.loading", "Loaded %u item info cache rows", count);
        if (count)
            return;
    }

    std::set<uint32> vendorItems;
    LoadVendorItems(vendorItems);

    PlayerbotsDatabase.BeginTransaction();
    PlayerbotsDatabase.PExecute("DELETE FROM `playerbots_item_info_cache`");

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    uint32 count = 0;
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (!proto || IsIgnoredItem(proto))
            continue;

        ItemInfoEntry info;
        info.itemId = proto->ItemId;
        info.quality = proto->Quality;
        info.slot = proto->InventoryType;
        info.minLevel = NormalizeLevel(proto);
        info.repFaction = proto->RequiredReputationFaction;
        info.repRank = proto->RequiredReputationRank;

        if (proto->StartQuest || GetQuestIdForItem(proto->ItemId))
        {
            info.source = ITEM_SOURCE_QUEST;
            info.sourceId = proto->StartQuest ? proto->StartQuest : GetQuestIdForItem(proto->ItemId);
        }
        else if (vendorItems.find(proto->ItemId) != vendorItems.end())
            info.source = ITEM_SOURCE_VENDOR;
        else if (proto->RequiredHonorRank)
            info.source = ITEM_SOURCE_PVP;
        else if (proto->Class == ITEM_CLASS_RECIPE || proto->RequiredSkill)
            info.source = ITEM_SOURCE_CRAFT;
        else
            info.source = ITEM_SOURCE_DROP;

        if (proto->SourceQuestRaces)
        {
            bool ally = (proto->SourceQuestRaces & RACEMASK_ALLIANCE) != 0;
            bool horde = (proto->SourceQuestRaces & RACEMASK_HORDE) != 0;
            if (ally && !horde)
                info.team = ALLIANCE;
            else if (horde && !ally)
                info.team = HORDE;
        }

        if (IsEquipClass(proto))
        {
            for (uint8 clazz = CLASS_WARRIOR; clazz < MAX_CLASSES; ++clazz)
            {
                if (!IsVanillaPlayableClass(clazz))
                    continue;

                if (proto->AllowableClass && !(proto->AllowableClass & (1 << (clazz - 1))))
                    continue;

                for (std::map<uint8, WeightScale>::iterator scaleItr = m_weightScales[clazz].begin();
                     scaleItr != m_weightScales[clazz].end(); ++scaleItr)
                {
                    uint8 tab = scaleItr->first;
                    uint32 scaleId = scaleItr->second.info.id;
                    if (!scaleId)
                        continue;

                    uint32 weight = CalculateStatWeight(clazz, tab, proto);
                    if (!weight &&
                        ((proto->Class == ITEM_CLASS_ARMOR && CanEquipArmor(clazz, info.minLevel, proto)) ||
                         (proto->Class == ITEM_CLASS_WEAPON && CanEquipWeapon(clazz, proto))))
                        weight = 1;

                    info.weights[scaleId] = weight;
                }
            }
        }

        itemInfoCache[proto->ItemId] = info;
        PlayerbotsDatabase.PExecute(
            "REPLACE INTO `playerbots_item_info_cache` "
            "(`id`, `quality`, `slot`, `source`, `sourceId`, `team`, `faction`, `factionRepRank`, `minLevel`, "
            "`scale_1`, `scale_2`, `scale_3`, `scale_4`, `scale_5`, `scale_6`, `scale_7`, `scale_8`, `scale_9`, `scale_10`, "
            "`scale_11`, `scale_12`, `scale_13`, `scale_14`, `scale_15`, `scale_16`, `scale_17`, `scale_18`, `scale_19`, "
            "`scale_20`, `scale_21`, `scale_22`, `scale_23`, `scale_24`, `scale_25`, `scale_26`, `scale_27`, `scale_28`, "
            "`scale_29`, `scale_30`, `scale_31`, `scale_32`) VALUES "
            "(%u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u)",
            info.itemId, info.quality, info.slot, info.source, info.sourceId, info.team, info.repFaction, info.repRank,
            info.minLevel, info.weights[1], info.weights[2], info.weights[3], info.weights[4], info.weights[5],
            info.weights[6], info.weights[7], info.weights[8], info.weights[9], info.weights[10], info.weights[11],
            info.weights[12], info.weights[13], info.weights[14], info.weights[15], info.weights[16], info.weights[17],
            info.weights[18], info.weights[19], info.weights[20], info.weights[21], info.weights[22], info.weights[23],
            info.weights[24], info.weights[25], info.weights[26], info.weights[27], info.weights[28], info.weights[29],
            info.weights[30], info.weights[31], info.weights[32]);
        ++count;
    }

    PlayerbotsDatabase.CommitTransaction();
    LOG_INFO("server.loading", "Built %u item info cache rows", count);
}

void RandomItemMgr::BuildAmmoCache()
{
    ammoCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (IsIgnoredItem(proto) || proto->InventoryType != INVTYPE_AMMO)
            continue;

        ammoCache[NormalizeLevel(proto)][proto->SubClass].push_back(proto->ItemId);
    }
}

void RandomItemMgr::BuildFoodCache()
{
    foodCache.clear();

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
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
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
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
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (IsIgnoredItem(proto) || proto->Bonding != NO_BIND)
            continue;

        if (proto->Class == ITEM_CLASS_TRADE_GOODS ||
            proto->Class == ITEM_CLASS_REAGENT ||
            proto->Class == ITEM_CLASS_RECIPE ||
            (proto->Class == ITEM_CLASS_CONSUMABLE && proto->SubClass != ITEM_SUBCLASS_POTION))
        {
            tradeCache[NormalizeLevel(proto)].push_back(proto->ItemId);
        }
    }
}

void RandomItemMgr::BuildRarityCache()
{
    rarityCache.clear();

    std::unique_ptr<QueryResult> result = PlayerbotsDatabase.PQuery("SELECT `item`, `rarity` FROM `playerbots_rarity_cache`");
    if (result)
    {
        uint32 count = 0;
        do
        {
            Field* fields = result->Fetch();
            rarityCache[fields[0].GetUInt32()] = fields[1].GetFloat();
            ++count;
        } while (result->NextRow());

        LOG_INFO("server.loading", "Loaded %u rarity cache rows", count);
        if (count)
            return;
    }

    PlayerbotsDatabase.BeginTransaction();
    PlayerbotsDatabase.PExecute("DELETE FROM `playerbots_rarity_cache`");

    ItemTemplateContainer const& itemTemplates = sObjectMgr.GetItemTemplateStore();
    uint32 count = 0;
    for (ItemTemplateContainer::const_iterator itr = itemTemplates.begin(); itr != itemTemplates.end(); ++itr)
    {
        ItemTemplate const* proto = &itr->second;
        if (IsIgnoredItem(proto) || proto->Quality == ITEM_QUALITY_POOR)
            continue;

        float rarity = 100.0f / std::max<uint32>(1, proto->Quality + 1);
        rarityCache[proto->ItemId] = rarity;
        PlayerbotsDatabase.PExecute(
            "INSERT INTO `playerbots_rarity_cache` (`item`, `rarity`) VALUES (%u, %f)",
            proto->ItemId, rarity);
        ++count;
    }

    PlayerbotsDatabase.CommitTransaction();
    LOG_INFO("server.loading", "Built %u rarity cache rows", count);
}

bool RandomItemMgr::CanEquipItem(BotEquipKey key, ItemTemplate const* proto)
{
    if (!proto)
        return false;

    std::map<EquipmentSlots, std::set<InventoryType> >::iterator viable =
        viableSlots.find(static_cast<EquipmentSlots>(key.slot));
    if (viable == viableSlots.end())
        return false;

    return viable->second.find(static_cast<InventoryType>(proto->InventoryType)) != viable->second.end();
}

bool RandomItemMgr::CanEquipItemNew(ItemTemplate const* proto)
{
    if (!proto)
        return false;

    if (proto->Bonding == BIND_QUEST_ITEM || proto->Bonding == BIND_WHEN_USE)
        return false;

    if (proto->Class == ITEM_CLASS_CONTAINER)
        return false;

    for (std::map<EquipmentSlots, std::set<InventoryType> >::const_iterator itr = viableSlots.begin();
         itr != viableSlots.end(); ++itr)
    {
        if (itr->second.find(static_cast<InventoryType>(proto->InventoryType)) != itr->second.end())
            return true;
    }

    return false;
}

void RandomItemMgr::AddItemStats(uint32 mod, uint8& sp, uint8& ap, uint8& tank)
{
    switch (mod)
    {
        case ITEM_MOD_HEALTH:
        case ITEM_MOD_STAMINA:
        case ITEM_MOD_MANA:
        case ITEM_MOD_INTELLECT:
        case ITEM_MOD_SPIRIT:
            ++sp;
            break;
        default:
            break;
    }

    switch (mod)
    {
        case ITEM_MOD_AGILITY:
        case ITEM_MOD_STRENGTH:
        case ITEM_MOD_HEALTH:
        case ITEM_MOD_STAMINA:
            ++tank;
            break;
        default:
            break;
    }

    switch (mod)
    {
        case ITEM_MOD_HEALTH:
        case ITEM_MOD_STAMINA:
        case ITEM_MOD_AGILITY:
        case ITEM_MOD_STRENGTH:
            ++ap;
            break;
        default:
            break;
    }
}

bool RandomItemMgr::CheckItemStats(uint8 clazz, uint8 sp, uint8 ap, uint8 tank)
{
    switch (clazz)
    {
        case CLASS_PRIEST:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            if (!sp || ap > sp || tank > sp)
                return false;
            break;
        case CLASS_PALADIN:
        case CLASS_WARRIOR:
            if ((!ap && !tank) || sp > ap || sp > tank)
                return false;
            break;
        case CLASS_HUNTER:
        case CLASS_ROGUE:
            if (!ap || sp > ap || sp > tank)
                return false;
            break;
        default:
            break;
    }

    return sp || ap || tank;
}
