#include "AuctionHouse.h"

void WorldPackets::AuctionHouse::AuctionHello::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
}

void WorldPackets::AuctionHouse::AuctionListBidderItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> pagingElementStartIndex;

    uint32 idsToRefresh;
    recv_data >> idsToRefresh;
    for (uint32 i = 0; i < idsToRefresh; i++)
    {
        uint32 auctionId;
        recv_data >> auctionId;
        bidAuctionIdsToRefresh.push_back(auctionId);
    }
}

void WorldPackets::AuctionHouse::AuctionListOwnerItems::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> listfrom;
}

void WorldPackets::AuctionHouse::AuctionPlaceBid::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> auctionId;
    recv_data >> price;
}

void WorldPackets::AuctionHouse::AuctionRemoveItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> auctionId;
}

void WorldPackets::AuctionHouse::AuctionSellItem::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> itemGuid;
    recv_data >> bid;
    recv_data >> buyout;
    recv_data >> etime;
}

void WorldPackets::AuctionHouse::AuctionListItems::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> auctioneerGuid;
    recv_data >> listfrom;
    recv_data >> searchedname;
    recv_data >> levelmin;
    recv_data >> levelmax;
    recv_data >> auctionSlotID;
    recv_data >> auctionMainCategory;
    recv_data >> auctionSubCategory;
    recv_data >> quality;
    recv_data >> usable;
}

void WorldPackets::AuctionHouse::AuctionRemovedNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << auctionId;
    buffer << itemTemplate;
    buffer << randomPropertyId;
}

void WorldPackets::AuctionHouse::AuctionHelloResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << auctioneerGuid;
    buffer << houseId;
}

void WorldPackets::AuctionHouse::AuctionBidderNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << houseId;
    buffer << auctionId;
    buffer << bidderGuid;
    buffer << bidOrZero;
    buffer << outBid;
    buffer << itemTemplate;
    buffer << randomPropertyId;
}

void WorldPackets::AuctionHouse::AuctionOwnerNotification::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << auctionId;
    buffer << bid;
    buffer << outBid;
    buffer << bidderGuid;
    buffer << itemTemplate;
    buffer << randomPropertyId;
}
