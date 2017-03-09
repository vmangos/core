#ifndef _AUCTION_HOUSE_BOT_MGR_H
#define _AUCTION_HOUSE_BOT_MGR_H

#include "Policies/Singleton.h"
#include "SharedDefines.h"

#include <vector>

class Player;

struct AuctionHouseBotEntry
{
    uint32 item;
    uint32 stack;
    uint32 bid;
    uint32 buyout;
};

struct AuctionHouseBotConfig
{
    uint32 itemcount;
    uint32 ahid;
    uint32 ahfid;

    uint64 botguid;
    uint32 botaccount;

    uint64 auctionnerguid;
    bool enable;
};

class AuctionHouseBotMgr
{
    public :
        AuctionHouseBotMgr();
        ~AuctionHouseBotMgr();

        void load();

        /**
        void update(bool force = false);
        Si force = true, met des items en vente meme si le bot est desactive
        */
        void update(bool force = false);
        void additem(AuctionHouseBotEntry e, AuctionHouseObject *auctionHouse );

    protected:
        std::vector<AuctionHouseBotEntry> entries;
        AuctionHouseBotConfig* config;
        AuctionHouseEntry const* auctionHouseEntry;

        bool m_loaded;
};

#define sAuctionHouseBotMgr MaNGOS::Singleton< AuctionHouseBotMgr >::Instance()
#endif
