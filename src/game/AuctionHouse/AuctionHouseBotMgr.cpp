#include "Database/DatabaseEnv.h"
#include "World.h"
#include "Log.h"
#include "ProgressBar.h"
#include "Policies/SingletonImp.h"
#include "Player.h"
#include "Item.h"
#include "AuctionHouseMgr.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "AuctionHouseBotMgr.h"
#include "Config/Config.h"
#include "Chat.h"

INSTANTIATE_SINGLETON_1(AuctionHouseBotMgr);

AuctionHouseBotMgr::AuctionHouseBotMgr() : auctionHouseEntry(NULL), m_loaded(false)
{
    config = NULL;
}

AuctionHouseBotMgr::~AuctionHouseBotMgr()
{
    entries.clear();

    if (config)
    {
        delete config;
        config = NULL;
    }
}

void AuctionHouseBotMgr::load()
{
    /* 1 - DELETE */
    entries.clear();
    m_loaded = false;

    if (config)
    {
        delete config;
        config = NULL;
    }
    /*2 - LOAD */
    QueryResult* result = WorldDatabase.Query("SELECT item,stack,bid,buyout FROM auctionhousebot");

    if (!result)
    {
        sLog.outString();
        sLog.outString(">> Loaded 0 AuctionHouseBot item");
        return;
    }

    uint32 count = 0;

    Field *fields;
    do
    {
        AuctionHouseBotEntry e;
        fields    = result->Fetch();
        e.item    = fields[0].GetUInt32();
        e.stack   = fields[1].GetUInt32();
        e.bid     = fields[2].GetUInt32();
        e.buyout  = fields[3].GetUInt32();

        entries.push_back(e);

        ++count;
    }
    while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u AuctionHouseBot items", count);

    /* CONFIG */
    config                 = new AuctionHouseBotConfig();
    config->enable         = sConfig.GetBoolDefault("AHBot.Enable", false);
    config->ahid           = sConfig.GetIntDefault("AHBot.ah.id", 7);
    config->botguid        = sConfig.GetIntDefault("AHBot.bot.guid", 1123);
    config->botaccount     = sConfig.GetIntDefault("AHBot.bot.account", 32377);
    config->auctionnerguid = sConfig.GetIntDefault("AHBot.ah.guid", 23442);
    config->ahfid          = sConfig.GetIntDefault("AHBot.ah.fid", 120);
    config->itemcount      = sConfig.GetIntDefault("AHBot.itemcount", 2);

    auctionHouseEntry = sAuctionMgr.GetAuctionHouseEntry(config->ahfid);
    if (!auctionHouseEntry)
    {
        sLog.outInfo("AuctionHouseBotMgr::load() : Faction de l'AH incorrect : %u", config->ahfid);
        return;
    }
    m_loaded = true;
}

void AuctionHouseBotMgr::update(bool force /* = false */)
{
    if (!m_loaded)
        return;
    ASSERT(config);
    ASSERT(auctionHouseEntry);

    if (!(config->enable || force))
        return;

    if (entries.size() == 0 ||  /*config->botguid==0 ||*/ config->botaccount == 0)
    {
        sLog.outError("AuctionHouseBotMgr::update() : Mauvaise config, ou table vide.");
        return;
    }

    AuctionHouseObject* auctionHouse = sAuctionMgr.GetAuctionsMap(auctionHouseEntry);
    if (!auctionHouse)
    {
        sLog.outError("AuctionHouseBotMgr::update() : Faction erronee : %u", config->ahfid);
        return;
    }

    uint32 auctions     = auctionHouse->GetCount();
    uint32 items        = config->itemcount;
    uint32 entriesCount = entries.size();

    DEBUG_LOG("AuctionHouseBotMgr::update() : %u items, doit atteindre %u", auctions, items);

    while (auctions < items)
    {
        AuctionHouseBotEntry item = entries[urand(0, entriesCount - 1)];
        additem(item, auctionHouse);
        auctions++;
    }
}

void AuctionHouseBotMgr::additem(AuctionHouseBotEntry e, AuctionHouseObject *auctionHouse)
{
    ASSERT(auctionHouseEntry);

    ItemPrototype const* prototype = sObjectMgr.GetItemPrototype(e.item);
    if (prototype == NULL)
    {
        sLog.outInfo("AuctionHouseBotMgr::additem() : Item %u inexistant. Abandon.", e.item);
        return;
    }

    Item* item = Item::CreateItem(e.item, 1, NULL);
    if (!item)
    {
        sLog.outInfo("AuctionHouseBotMgr::additem() : Item::CreateItem a echoue.");
        return;
    }

    sLog.outInfo("AuctionHouseBotMgr::additem() : Ajout de l'item %u", e.item);

    uint32 randomPropertyId = Item::GenerateItemRandomPropertyId(e.item);
    if (randomPropertyId != 0)
        item->SetItemRandomProperties(randomPropertyId);

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
    item->SetCount(e.stack);

    uint32 dep = sAuctionMgr.GetAuctionDeposit(auctionHouseEntry, etime, item);

    AuctionEntry* auctionEntry       = new AuctionEntry;
    auctionEntry->Id                 = sObjectMgr.GenerateAuctionID();
    //auctionEntry->auctioneer       = config->auctionnerguid;
    auctionEntry->auctionHouseEntry  = auctionHouseEntry;
    auctionEntry->itemGuidLow       = item->GetGUIDLow();
    auctionEntry->itemTemplate       = item->GetEntry();
    auctionEntry->owner              = 0;
    auctionEntry->startbid           = e.bid;
    auctionEntry->buyout             = e.buyout;
    auctionEntry->bidder             = 0;
    auctionEntry->bid                = 0;
    auctionEntry->deposit            = dep;
    auctionEntry->depositTime       = time(NULL);
    auctionEntry->expireTime        = (time_t) etime + time(NULL);

    item->SaveToDB();

    sAuctionMgr.AddAItem(item);
    auctionHouse->AddAuction(auctionEntry);
    auctionEntry->SaveToDB();
}



bool ChatHandler::HandleAHBotUpdateCommand(char *args)
{
    sAuctionHouseBotMgr.update(true);
    SendSysMessage("[AHBot] objets ajoutes");
    return true;
}

bool ChatHandler::HandleAHBotReloadCommand(char *args)
{
    sAuctionHouseBotMgr.load();
    SendSysMessage("[AHBot] Recharge");
    return true;
}
