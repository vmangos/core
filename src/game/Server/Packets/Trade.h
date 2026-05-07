#ifndef MANGOS_PACKETS_TRADE_H
#define MANGOS_PACKETS_TRADE_H

#include "Packet.h"
#include "ObjectGuid.h"
#include <vector>

namespace WorldPackets { namespace Trade
{
    class InitiateTrade final : public ClientPacket
    {
    public:
        ObjectGuid tradeTargetGuid;

        explicit InitiateTrade() : ClientPacket(CMSG_INITIATE_TRADE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetTradeGold final : public ClientPacket
    {
    public:
        uint32 gold = 0;

        explicit SetTradeGold() : ClientPacket(CMSG_SET_TRADE_GOLD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class SetTradeItem final : public ClientPacket
    {
    public:
        uint8 tradeSlot = 0;
        uint8 bag = 0;
        uint8 slot = 0;

        explicit SetTradeItem() : ClientPacket(CMSG_SET_TRADE_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ClearTradeItem final : public ClientPacket
    {
    public:
        uint8 tradeSlot = 0;

        explicit ClearTradeItem() : ClientPacket(CMSG_CLEAR_TRADE_ITEM) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class AcceptTrade final : public ClientPacket
    {
    public:
        explicit AcceptTrade() : ClientPacket(CMSG_ACCEPT_TRADE) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class TradeStatus final : public ServerPacket
    {
    public:
        uint32 status = 0;
        // BEGIN_TRADE: guid of the player initiating trade
        ObjectGuid playerGuid;
        // CLOSE_WINDOW extra fields
        uint32 closeResult = 0;
        uint8 closeUnk = 0;
        uint32 closeItemLimitCategory = 0;
        // ONLY_CONJURED extra field
        uint8 slot = 0;

        explicit TradeStatus() : ServerPacket(SMSG_TRADE_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Trade

#endif // MANGOS_PACKETS_TRADE_H
