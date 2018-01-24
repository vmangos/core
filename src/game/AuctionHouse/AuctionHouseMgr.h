/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _AUCTION_HOUSE_MGR_H
#define _AUCTION_HOUSE_MGR_H

#include <vector>

#include "Common.h"
#include "SharedDefines.h"
#include "Policies/Singleton.h"
#include "DBCStructure.h"
#include "Log.h"

class Item;
class Player;
class Unit;
class WorldPacket;

#define MIN_AUCTION_TIME (2*HOUR)

enum AuctionError
{
    AUCTION_OK                          = 0,                // depends on enum AuctionAction
    AUCTION_ERR_INVENTORY               = 1,                // depends on enum InventoryChangeResult
    AUCTION_ERR_DATABASE                = 2,                // ERR_AUCTION_DATABASE_ERROR (default)
    AUCTION_ERR_NOT_ENOUGH_MONEY        = 3,                // ERR_NOT_ENOUGH_MONEY
    AUCTION_ERR_ITEM_NOT_FOUND          = 4,                // ERR_ITEM_NOT_FOUND
    AUCTION_ERR_HIGHER_BID              = 5,                // ERR_AUCTION_HIGHER_BID
    AUCTION_ERR_BID_INCREMENT           = 7,                // ERR_AUCTION_BID_INCREMENT
    AUCTION_ERR_BID_OWN                 = 10,               // ERR_AUCTION_BID_OWN
    AUCTION_ERR_RESTRICTED_ACCOUNT      = 13                // ERR_RESTRICTED_ACCOUNT
};

enum AuctionAction
{
    AUCTION_STARTED     = 0,                                // ERR_AUCTION_STARTED
    AUCTION_REMOVED     = 1,                                // ERR_AUCTION_REMOVED
    AUCTION_BID_PLACED  = 2                                 // ERR_AUCTION_BID_PLACED
};

enum AuctionClientQueryType
{
    AUCTION_QUERY_LIST,
    AUCTION_QUERY_LIST_OWNER,
    AUCTION_QUERY_LIST_BIDDER
};

struct AuctionEntry
{
    uint32 Id;
    uint32 itemGuidLow;
    uint32 itemTemplate;
    uint32 owner;
    uint32 ownerAccount;
    uint32 startbid;                                        // maybe useless
    uint32 bid;
    uint32 buyout;
    std::string lockedIpAddress;
    time_t depositTime;
    time_t expireTime;
    uint32 bidder;
    uint32 deposit;                                         // deposit can be calculated only when creating auction
    AuctionHouseEntry const* auctionHouseEntry;             // in AuctionHouse.dbc

    // helpers
    uint32 GetHouseId() const { return auctionHouseEntry->houseId; }
    uint32 GetHouseFaction() const { return auctionHouseEntry->faction; }
    uint32 GetAuctionCut() const;
    uint32 GetAuctionOutBid() const;
    bool BuildAuctionInfo(WorldPacket & data) const;
    void DeleteFromDB() const;
    void SaveToDB() const;
    bool IsAvailableFor(Player* player);
};

struct AuctionHouseClientQuery
{
    uint32 accountId;
    std::wstring wsearchedname;
    uint8 levelmin;
    uint8 levelmax;
    uint8 usable;
    uint32 listfrom, auctionSlotID, auctionMainCategory, auctionSubCategory, quality;
    uint32 outbiddedCount;
    std::vector<uint32> outbiddedAuctionIds;
};

//this class is used as auctionhouse instance
class AuctionHouseObject
{
    public:
        AuctionHouseObject() {}
        ~AuctionHouseObject()
        {
            for (AuctionEntryMap::const_iterator itr = AuctionsMap.begin(); itr != AuctionsMap.end(); ++itr)
                delete itr->second;
        }

        typedef std::map<uint32, AuctionEntry*> AuctionEntryMap;
        typedef std::multimap<uint32, AuctionEntry*> AuctionMultiMap;

        uint32 GetCount() { return AuctionsMap.size(); }

        AuctionEntryMap *GetAuctions() { return &AuctionsMap; }

        void AddAuction(AuctionEntry *ah);

        AuctionEntry* GetAuction(uint32 id) const
        {
            AuctionEntryMap::const_iterator itr = AuctionsMap.find( id );
            return itr != AuctionsMap.end() ? itr->second : NULL;
        }

        bool RemoveAuction(AuctionEntry* entry);

        void Update();

        void BuildListBidderItems(WorldPacket& data, Player* player, uint32 listfrom, uint32& count, uint32& totalcount);
        void BuildListOwnerItems(WorldPacket& data, Player* player, uint32 listfrom, uint32& count, uint32& totalcount);
        void BuildListAuctionItems(WorldPacket& data, Player* player,
                AuctionHouseClientQuery const& query,
            uint32& count, uint32& totalcount);
        uint32 GetAccountAuctionCount(uint32 accountId) { return AccountAuctionMap.count(accountId); }
    private:
        // Map BUYOUT prices to entry for pre-sorted results. We maintain it in
        // a map rather than build the list on query for performance reasons.
        // Similarly, maintain a map of account ID -> auction entry
        AuctionMultiMap OrderedAuctionMap;
        AuctionMultiMap AccountAuctionMap;
        AuctionEntryMap AuctionsMap;
};

class AuctionHouseMgr
{
    public:
        AuctionHouseMgr();
        ~AuctionHouseMgr();

        typedef UNORDERED_MAP<uint32, Item*> ItemMap;

        AuctionHouseObject* GetAuctionsMap(AuctionHouseEntry const* house);

        Item* GetAItem(uint32 id)
        {
            ItemMap::const_iterator itr = mAitems.find(id);
            if (itr != mAitems.end())
            {
                return itr->second;
            }
            return NULL;
        }

        //auction messages
        void SendAuctionWonMail( AuctionEntry * auction );
        void SendAuctionSuccessfulMail( AuctionEntry * auction );
        void SendAuctionExpiredMail( AuctionEntry * auction );
        static uint32 GetAuctionDeposit(AuctionHouseEntry const* entry, uint32 time, Item *pItem);

        static uint32 GetAuctionHouseTeam(AuctionHouseEntry const* house);
        static AuctionHouseEntry const* GetAuctionHouseEntry(Unit* unit);
        static AuctionHouseEntry const* GetAuctionHouseEntry(uint32 factionId);

    public:
        //load first auction items, because of check if item exists, when loading
        void LoadAuctionItems();
        void LoadAuctions();

        void AddAItem(Item* it);
        bool RemoveAItem(uint32 id);

        void Update();

    private:
        AuctionHouseObject  mHordeAuctions;
        AuctionHouseObject  mAllianceAuctions;
        AuctionHouseObject  mNeutralAuctions;

        ItemMap             mAitems;
};

#define sAuctionMgr MaNGOS::Singleton<AuctionHouseMgr>::Instance()

#endif
