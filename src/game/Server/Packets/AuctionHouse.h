#ifndef MANGOS_PACKETS_AUCTIONHOUSE_H
#define MANGOS_PACKETS_AUCTIONHOUSE_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>
#include <vector>

namespace WorldPackets { namespace AuctionHouse
{
    class AuctionHello final : public ClientPacket
    {
    public:
        ObjectGuid auctioneerGuid; // NPC guid

        explicit AuctionHello() : ClientPacket(MSG_AUCTION_HELLO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionListBidderItem final : public ClientPacket
    {
    public:
        ObjectGuid          auctioneerGuid;          // NPC guid
        uint32              pagingElementStartIndex; // Page of auctions. (Should be a multiple of 50)
        std::vector<uint32> bidAuctionIdsToRefresh;  // Sent when the client needs specific auction id information. (Should be an auction where player previously bid on)

        explicit AuctionListBidderItem() : ClientPacket(CMSG_AUCTION_LIST_BIDDER_ITEMS), pagingElementStartIndex(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionListOwnerItems final : public ClientPacket
    {
    public:
        ObjectGuid auctioneerGuid;
        uint32     listfrom = 0;

        explicit AuctionListOwnerItems() : ClientPacket(CMSG_AUCTION_LIST_OWNER_ITEMS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionPlaceBid final : public ClientPacket
    {
    public:
        ObjectGuid auctioneerGuid;
        uint32     auctionId = 0;
        uint32     price = 0;

        explicit AuctionPlaceBid() : ClientPacket(CMSG_AUCTION_PLACE_BID) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionRemoveItem final : public ClientPacket
    {
    public:
        ObjectGuid auctioneerGuid;
        uint32     auctionId = 0;

        explicit AuctionRemoveItem() : ClientPacket(CMSG_AUCTION_REMOVE_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionSellItem final : public ClientPacket
    {
    public:
        ObjectGuid auctioneerGuid;
        ObjectGuid itemGuid;
        uint32     bid = 0;
        uint32     buyout = 0;
        uint32     etime = 0;

        explicit AuctionSellItem() : ClientPacket(CMSG_AUCTION_SELL_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AuctionListItems final : public ClientPacket
    {
    public:
        ObjectGuid  auctioneerGuid;
        uint32      listfrom = 0;
        std::string searchedname;
        uint8       levelmin = 0;
        uint8       levelmax = 0;
        uint32      auctionSlotID = 0;
        uint32      auctionMainCategory = 0;
        uint32      auctionSubCategory = 0;
        uint32      quality = 0;
        uint8       usable = 0;

        explicit AuctionListItems() : ClientPacket(CMSG_AUCTION_LIST_ITEMS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class AuctionRemovedNotification final : public ServerPacket
    {
    public:
        uint32 auctionId = 0;
        uint32 itemTemplate = 0;
        uint32 randomPropertyId = 0; // random property (value > 0) or suffix (value < 0)

        explicit AuctionRemovedNotification() : ServerPacket(SMSG_AUCTION_REMOVED_NOTIFICATION) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AuctionHelloResponse final : public ServerPacket
    {
    public:
        ObjectGuid auctioneerGuid;
        uint32 houseId = 0;

        explicit AuctionHelloResponse() : ServerPacket(MSG_AUCTION_HELLO) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AuctionBidderNotification final : public ServerPacket
    {
    public:
        uint32 houseId = 0;
        uint32 auctionId = 0;
        ObjectGuid bidderGuid;
        uint32 bidOrZero = 0;   // if 0, client shows ERR_AUCTION_WON_S, else ERR_AUCTION_OUTBID_S
        uint32 outBid = 0;
        uint32 itemTemplate = 0;
        uint32 randomPropertyId = 0;

        explicit AuctionBidderNotification() : ServerPacket(SMSG_AUCTION_BIDDER_NOTIFICATION) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class AuctionOwnerNotification final : public ServerPacket
    {
    public:
        uint32 auctionId = 0;
        uint32 bid = 0;
        uint32 outBid = 0;
        ObjectGuid bidderGuid;
        uint32 itemTemplate = 0;
        uint32 randomPropertyId = 0;

        explicit AuctionOwnerNotification() : ServerPacket(SMSG_AUCTION_OWNER_NOTIFICATION) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };
}} // namespace WorldPackets::AuctionHouse

#endif // MANGOS_PACKETS_AUCTIONHOUSE_H
