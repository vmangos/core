#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "Policies/SingletonImp.h"
#include "Item.h"
#include "AuctionHouseMgr.h"
#include "ObjectMgr.h"
#include "AuctionHouseBotMgr.h"
#include "Config/Config.h"
#include "Chat.h"

#include "ItemEnchantmentMgr.h"

#include <random>

INSTANTIATE_SINGLETON_1(AuctionHouseBotMgr);

float linlin(float num, float source_left, float source_right, float target_left, float target_right){
    if (target_left == target_right)
        return target_right;
    
    if (source_left == source_right)
    {
        num = source_right;
        if (num <= target_left)
            return target_left;
        else if (num >= target_right)
            return target_right;
        else
            return num;
    }            

    return ( (num - source_left) / (source_right - source_left) * (target_right - target_left) + target_left );
};

float AuctionHouseBotMgr::getMultiplierForRandomItem(std::string suffx, uint32 itemSubclass){
    float multiplier = 1.0f;

    const std::set<std::string> casterSet{"of the Eagle", "of the Owl", "of Intellect", "of Magic", "of Arcane Wrath", 
        "of Frozen Wrath", "of Shadow Wrath", "of Fiery Wrath", "of Nature Wrath", "of Holy Wrath"};

    const std::set<std::string> physicalSet{"of the Tiger", "of the Bear", "of the Monkey", "of Strength", "of Agility",
        "of Power", "of Critical Strike", "of Marksmanship"};

    const std::set<std::string> tankingSet{"of Blocking", "of Eluding", "of Stamina", "of Regeneration", "of Defense"};

    const std::set<std::string> resistanceSet{"of Fire Resistance", "of Nature Resistance", "of Arcane Resistance",
        "of Frost Resistance", "of Shadow Resistance"};

    const std::set<std::string> healerSet{"of Spirit", "of the Whale", "of Healing", "of Concentration"};

    // armor rates
    if (itemSubclass == ITEM_SUBCLASS_ARMOR_CLOTH){
        if (casterSet.count(suffx))
            multiplier = 1.25f;
        else if (physicalSet.count(suffx))
            multiplier = 0.65f;
        else if (tankingSet.count(suffx))
            multiplier = 0.75f;
        else if (healerSet.count(suffx))
            multiplier = 0.8f;    
    }
    else if (itemSubclass == ITEM_SUBCLASS_ARMOR_LEATHER){
        if (casterSet.count(suffx))
            multiplier = 0.8f;
        else if (physicalSet.count(suffx))
            multiplier = 1.25f;
        else if (tankingSet.count(suffx))
            multiplier = 0.85f;
        else if (healerSet.count(suffx))
            multiplier = 0.7f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_ARMOR_MAIL){
        if (casterSet.count(suffx))
            multiplier = 0.65f;
        else if (physicalSet.count(suffx))
            multiplier = 1.25f;
        else if (tankingSet.count(suffx))
            multiplier = 1.1f;
        else if (healerSet.count(suffx))
            multiplier = 0.65f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_ARMOR_PLATE){
        if (casterSet.count(suffx))
            multiplier = 0.7f;
        else if (physicalSet.count(suffx))
            multiplier = 1.25f;
        else if (tankingSet.count(suffx))
            multiplier = 1.15f;
        else if (healerSet.count(suffx))
            multiplier = 0.85f;
    }
    // weapon rates
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_AXE2){
        if (casterSet.count(suffx))
            multiplier = 0.7f;
        else if (physicalSet.count(suffx))
            multiplier = 1.35f;
        else if (tankingSet.count(suffx))
            multiplier = 0.8f;
        else if (healerSet.count(suffx))
            multiplier = 0.65f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_AXE){
        if (casterSet.count(suffx))
            multiplier = 0.9f;
        else if (physicalSet.count(suffx))
            multiplier = 1.35f;
        else if (tankingSet.count(suffx))
            multiplier = 1.15f;
        else if (healerSet.count(suffx))
            multiplier = 0.85f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_DAGGER){
        if (casterSet.count(suffx))
            multiplier = 1.25f;
        else if (physicalSet.count(suffx))
            multiplier = 1.25f;
        else if (tankingSet.count(suffx))
            multiplier = 0.8f;
        else if (healerSet.count(suffx))
            multiplier = 0.75f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_MACE2){
        if (casterSet.count(suffx))
            multiplier = 0.6f;
        else if (physicalSet.count(suffx))
            multiplier = 1.35f;
        else if (tankingSet.count(suffx))
            multiplier = 0.8f;
        else if (healerSet.count(suffx))
            multiplier = 0.6f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_MACE){
        if (casterSet.count(suffx))
            multiplier = 1.15f;
        else if (physicalSet.count(suffx))
            multiplier = 1.25f;
        else if (tankingSet.count(suffx))
            multiplier = 0.9f;
        else if (healerSet.count(suffx))
            multiplier = 0.85f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_SWORD2){
        if (casterSet.count(suffx))
            multiplier = 0.6f;
        else if (physicalSet.count(suffx))
            multiplier = 1.35f;
        else if (tankingSet.count(suffx))
            multiplier = 0.8f;
        else if (healerSet.count(suffx))
            multiplier = 0.6f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_SWORD){
        if (casterSet.count(suffx))
            multiplier = 1.2f;
        else if (physicalSet.count(suffx))
            multiplier = 1.35f;
        else if (tankingSet.count(suffx))
            multiplier = 0.9f;
        else if (healerSet.count(suffx))
            multiplier = 0.7f;
    }
    else if (itemSubclass == ITEM_SUBCLASS_WEAPON_STAFF){
        if (casterSet.count(suffx))
            multiplier = 1.35f;
        else if (physicalSet.count(suffx))
            multiplier = 0.8f;
        else if (tankingSet.count(suffx))
            multiplier = 0.7f;
        else if (healerSet.count(suffx))
            multiplier = 1.1f;
    }
    else if (resistanceSet.count(suffx))
        multiplier = 0.5f;

    return multiplier;
}

AuctionHouseBotMgr::~AuctionHouseBotMgr()
{
    m_items.clear();

    if (m_config)
        m_config.reset();
}

void AuctionHouseBotMgr::Load()
{
    /* 1 - DELETE */
    m_items.clear();
    m_loaded = false;

    if (m_config)
        m_config.reset();

    /*2 - LOAD */
    std::unique_ptr<QueryResult> result(WorldDatabase.Query("SELECT `item_id`, `avg_buyout` FROM `auctionhousebot`"));

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded 0 AuctionHouseBot items");
        return;
    }

    uint32 count = 0;
    BarGoLink bar(result->GetRowCount());

    Field* fields;
    do
    {
        bar.step();
        AuctionHouseBotEntry e;
        fields    = result->Fetch();
        e.item    = fields[0].GetUInt32();
        e.avg_buyout  = fields[1].GetUInt32();

        const ItemPrototype* pProto = sObjectMgr.GetItemPrototype(e.item);
        if (!pProto){
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "AuctionHouseBotMgr::Load() : can't load item with `id`: %d", e.item);
            continue;
        }
        // filter some trash accidentaly added into `auctionhousebot` table
        if (pProto->Quality == ITEM_QUALITY_POOR)
            continue;

        uint32 itemClass = pProto->Class;
        if (itemClass == ITEM_CLASS_ARMOR){
            m_itemCategoryCount["armor"]++;
        }
        else if (itemClass == ITEM_CLASS_WEAPON){
            m_itemCategoryCount["weapon"]++;
        }
        else if (itemClass == ITEM_CLASS_CONSUMABLE){
            m_itemCategoryCount["consumable"]++;
        }
        else if (itemClass == ITEM_CLASS_CONTAINER){
            m_itemCategoryCount["container"]++;
        }
        else if (itemClass == ITEM_CLASS_PROJECTILE){
            m_itemCategoryCount["projectile"]++;
        }
        else if (itemClass == ITEM_CLASS_JUNK){
            m_itemCategoryCount["miscellaneous"]++;
        }
        else if (itemClass == ITEM_CLASS_REAGENT){
            m_itemCategoryCount["reagent"]++;
        }
        else if (itemClass == ITEM_CLASS_RECIPE){
            m_itemCategoryCount["recipe"]++;
        }
        else if (itemClass == ITEM_CLASS_TRADE_GOODS){
            m_itemCategoryCount["tradeGoods"]++;
        }

        m_items.push_back(e);

        ++count;
    }
    while (result->NextRow());

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u AuctionHouseBot items", count);
    
    /* CONFIG */
    m_config                 = std::make_unique<AuctionHouseBotConfig>();
    m_config->enable         = sConfig.GetBoolDefault("AHBot.Enable", false);
    m_config->itemcount      = sConfig.GetIntDefault("AHBot.itemcount", 4000);
    m_config->buyoutEnable   = sConfig.GetIntDefault("AHBot.buyout.enable", false);
    m_config->ahfid          = sConfig.GetIntDefault("AHBot.ah.fid", 120);

    m_auctionHouseEntry = sAuctionMgr.GetAuctionHouseEntry(m_config->ahfid);
    if (!m_auctionHouseEntry)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "AHBot::Load() : No auction house for faction %u.", m_config->ahfid);
        return;
    }
    m_loaded = true;
}

void AuctionHouseBotMgr::Update(bool force /* = false */)
{
    if (!m_loaded)
        return;

    ASSERT(m_config);
    ASSERT(m_auctionHouseEntry);

    if (!(m_config->enable || force))
        return;

    if (m_items.empty())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "AHBot::Update() : Bad config or empty table.");
        return;
    }

    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(m_auctionHouseEntry);
    if (!auctionHouse)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "AHBot::Update() : No auction house for faction %u.", m_config->ahfid);
        return;
    }

    uint32 auctionHouseCount     = auctionHouse->GetCount();
    uint32 auctionHouseBotTableLength = m_items.size();
    
    float itemCategoryMinimalCount = (std::min_element(m_itemCategoryCount.begin(), m_itemCategoryCount.end(),
        [](const auto& a, const auto& b) {
            return a.second < b.second;
    }))->second;
    
    uint32 itemCategoryMaximalCount = (std::max_element(m_itemCategoryCount.begin(), m_itemCategoryCount.end(),
        [](const auto& a, const auto& b) {
            return a.second > b.second;
    }))->second;

    // used to prevent possible infinite loop
    uint32 cycleCounter = 0;

    while (auctionHouseCount < m_config->itemcount){
        AuctionHouseBotEntry ahbotEntry = m_items[urand(0, m_items.size()-1)];

        const ItemPrototype* pProto = sObjectMgr.GetItemPrototype(ahbotEntry.item);

        uint32 itemQuality = pProto->Quality;
        uint32 itemClass = pProto->Class;
        float itemAddChance = 0.0f;
        
        if (itemClass == ITEM_CLASS_ARMOR){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["armor"];
        }
        else if (itemClass == ITEM_CLASS_WEAPON){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["weapon"];
        }
        else if (itemClass == ITEM_CLASS_CONSUMABLE){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["consumable"];
        }
        else if (itemClass == ITEM_CLASS_CONTAINER){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["container"];
        }
        else if (itemClass == ITEM_CLASS_JUNK){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["miscellaneous"];
        }
        else if (itemClass == ITEM_CLASS_PROJECTILE){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["projectile"];
        }
        else if (itemClass == ITEM_CLASS_REAGENT){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["reagent"];
        }
        else if (itemClass == ITEM_CLASS_RECIPE){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["recipe"];
        }
        else if (itemClass == ITEM_CLASS_TRADE_GOODS){
            itemAddChance = itemCategoryMinimalCount / m_itemCategoryCount["tradeGoods"];
        }
        
        bool needToAdd = false;
        if (frand(0.0f, 1.0f) < itemAddChance || cycleCounter >= itemCategoryMaximalCount){
            needToAdd = true;
        }
        else
            cycleCounter++;

        if (needToAdd){
            AddItem(ahbotEntry, auctionHouse);
            auctionHouseCount;
            cycleCounter = 0;
        }
    }
    
    // buyout feature
    if (!(m_config->buyoutEnable || force))
        return;

    AuctionHouseObject::AuctionEntryMap* auctionMap =  auctionHouse->GetAuctions();
    for (auto it = auctionMap->begin(); it != auctionMap->end(); it++){
        if (it->second->owner == 0)
            continue;
        
        AuctionHouseBotEntry entry;
        for (int i=0; i < m_items.size(); ++i){
            if (it->second->itemTemplate == m_items[i].item){
                entry = m_items[i];
                break;
            }
        }

        Item* pItem = sAuctionMgr.GetAItem(it->second->itemGuidLow);
        if (!pItem){
            sLog.Out(LOG_BASIC, LOG_LVL_BASIC, "AuctionHouseBotMgr: Item `%d` was not found.", it->second->itemGuidLow);
            continue;
        }

        float priceFromListing = entry.avg_buyout;

        float multiplier = 1.0f;

        uint32 randomPropertyId = pItem->GetItemRandomPropertyId();
        if (randomPropertyId){
            const char* internalName = sItemRandomPropertiesStore.LookupEntry(randomPropertyId)->internalName;
            if (internalName){
                std::string suffx{internalName};
                multiplier = getMultiplierForRandomItem(suffx, pItem->GetProto()->SubClass);
            }
        }

        uint32 ownerGUID = 0;
        Player* pOwner = pItem->GetOwner();
        if (pOwner)
            ownerGUID = pOwner->GetGUIDLow();
        float itemStack = pItem->GetCount();
        float buyoutChance = linlin(
            it->second->buyout/itemStack, 
            priceFromListing * multiplier * 0.6f, 
            priceFromListing * multiplier * 1.5f,
             10.0f, 0.01f);       
        if (frand(0.0f, 100.0f) <= buyoutChance){
            it->second->bid = it->second->buyout;
            it->second->bidder = ownerGUID;
            // it->second->bidder = 0;
            sAuctionMgr.SendAuctionSuccessfulMail(it->second);
            it->second->DeleteFromDB();
            sAuctionMgr.RemoveAItem(it->second->itemGuidLow);
            auctionHouse->RemoveAuction(it->second);
        }
    }
    
}

void AuctionHouseBotMgr::AddItem(AuctionHouseBotEntry e, AuctionHouseObject *auctionHouse)
{
    ASSERT(m_auctionHouseEntry);

    ItemPrototype const* prototype = sObjectMgr.GetItemPrototype(e.item);
    if (prototype == nullptr)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "AHBot::AddItem() : Item %u does not exist.", e.item);
        return;
    }

    Item* item = Item::CreateItem(e.item, 1);
    if (!item)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "AHBot::AddItem() : Cannot create item.");
        return;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "AHBot::AddItem() : Adding item %u.", e.item);

    float final_buyout = 1.0f;
    float multiplier = 1.0f;

    uint32 randomPropertyId = Item::GenerateItemRandomPropertyId(e.item);
    if (randomPropertyId != 0){
        item->SetItemRandomProperties(randomPropertyId);
        
        const char* internalName = sItemRandomPropertiesStore.LookupEntry(randomPropertyId)->internalName;
        if (internalName){
            std::string suffx{internalName};
            multiplier = getMultiplierForRandomItem(suffx, item->GetProto()->SubClass);
        }
    }

    uint32 etime = urand(1, 3);
    switch (etime)
    {
        case 1:
            etime = 43200;
            break;
        case 2:
            etime = 86400;
            break;
        case 3:
            etime = 172800;
            break;
        default:
            etime = 86400;
            break;
    }

    uint32 itemStack = 0;
    
    if (prototype->Quality == ITEM_QUALITY_EPIC)
        itemStack = urand(1, 3);
    else if (prototype->Quality == ITEM_QUALITY_RARE)
        itemStack = urand(1, 6);
    else if (prototype->Quality == ITEM_QUALITY_UNCOMMON)
        itemStack = urand(1, 12);
    else if (prototype->Quality == ITEM_QUALITY_NORMAL)
        itemStack = urand(2, prototype->Stackable);
    else 
        itemStack = 1;

    if (prototype->Class == ITEM_CLASS_PROJECTILE)
        itemStack += 75;

    if (itemStack > prototype->Stackable)
        itemStack = prototype->Stackable;

    item->SetCount(itemStack);
    e.avg_buyout = e.avg_buyout * multiplier * frand(0.6f, 1.55f);
    if (e.avg_buyout <= 0.0f)
        e.avg_buyout = 1.0f;

    uint32 dep = sAuctionMgr.GetAuctionDeposit(m_auctionHouseEntry, etime, item);

    AuctionEntry* auctionEntry       = new AuctionEntry;
    auctionEntry->Id                 = sObjectMgr.GenerateAuctionID();
    auctionEntry->auctionHouseEntry  = m_auctionHouseEntry;
    auctionEntry->itemGuidLow        = item->GetGUIDLow();
    auctionEntry->itemTemplate       = item->GetEntry();
    auctionEntry->owner              = 0;
    auctionEntry->startbid           = static_cast<uint32>( std::ceil(e.avg_buyout * itemStack * frand(0.65f, 0.9f)) );
    auctionEntry->buyout             = static_cast<uint32>( std::ceil(e.avg_buyout * itemStack) );
    auctionEntry->bidder             = 0;
    auctionEntry->bid                = 0;
    auctionEntry->deposit            = dep;
    auctionEntry->depositTime        = time(nullptr);
    auctionEntry->expireTime         = (time_t) etime + time(nullptr);

    item->SaveToDB();

    sAuctionMgr.AddAItem(item);
    auctionHouse->AddAuction(auctionEntry);
    auctionEntry->SaveToDB();
}

bool ChatHandler::HandleAHBotUpdateCommand(char *args)
{
    sAuctionHouseBotMgr.Update(true);
    SendSysMessage("[AHBot] Update finished.");
    return true;
}

bool ChatHandler::HandleAHBotReloadCommand(char *args)
{
    sAuctionHouseBotMgr.Load();
    SendSysMessage("[AHBot] Reload finished.");
    return true;
}
