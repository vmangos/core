#ifndef _AUCTION_HOUSE_BOT_MGR_H
#define _AUCTION_HOUSE_BOT_MGR_H

#include "Policies/Singleton.h"
#include "SharedDefines.h"

#include <vector>
#include <memory>

class Player;

struct AuctionHouseBotEntry
{
    uint32 item;
    uint32 avg_buyout;
};

struct AuctionHouseBotConfig
{
    uint32 ahfid;
    uint32 itemcount;

    bool enable;
    bool buyoutEnable;
};

class AuctionHouseBotMgr
{
    public :
        AuctionHouseBotMgr() = default;
        ~AuctionHouseBotMgr();

        void Load();

        // force - put items in AH even if bot is disabled
        void Update(bool force = false);
        void AddItem(AuctionHouseBotEntry e, AuctionHouseObject *auctionHouse);
        float getMultiplierForRandomItem(std::string suffx, uint32 itemSubclass);

    protected:
        std::vector<AuctionHouseBotEntry> m_items;
        std::unique_ptr<AuctionHouseBotConfig> m_config;
        AuctionHouseEntry const* m_auctionHouseEntry = nullptr;
        std::map<std::string, uint32> m_itemCategoryCount;

        bool m_loaded = false;
};

#define sAuctionHouseBotMgr MaNGOS::Singleton< AuctionHouseBotMgr >::Instance()
#endif
