#ifndef MANGOS_PACKETS_QUERY_H
#define MANGOS_PACKETS_QUERY_H

#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets { namespace Query
{
    class QueryPlayerName final : public ClientPacket
    {
    public:
        ObjectGuid playerGuid;

        explicit QueryPlayerName() : ClientPacket(CMSG_NAME_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QueryCreature final : public ClientPacket
    {
    public:
        uint32 entry = 0;
        ObjectGuid guid;

        explicit QueryCreature() : ClientPacket(CMSG_CREATURE_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QueryGameObject final : public ClientPacket
    {
    public:
        uint32 entryID = 0;
        ObjectGuid guid;

        explicit QueryGameObject() : ClientPacket(CMSG_GAMEOBJECT_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QueryPageText final : public ClientPacket
    {
    public:
        uint32 pageID = 0;

        explicit QueryPageText() : ClientPacket(CMSG_PAGE_TEXT_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class Whois final : public ClientPacket
    {
    public:
        std::string charName;

        explicit Whois() : ClientPacket(CMSG_WHOIS) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class ItemNameQuery final : public ClientPacket
    {
    public:
        uint32 itemId = 0;

        explicit ItemNameQuery() : ClientPacket(CMSG_ITEM_NAME_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QueryTimeResponse final : public ServerPacket
    {
    public:
        uint32 time = 0;

        explicit QueryTimeResponse() : ServerPacket(SMSG_QUERY_TIME_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class NameQueryResponse final : public ServerPacket
    {
    public:
        ObjectGuid playerGuid;
        std::string name;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
        std::string realmName; // realm name for cross-realm BG usage
#endif
        uint32 race = 0;
        uint32 gender = 0;
        uint32 class_ = 0;

        explicit NameQueryResponse() : ServerPacket(SMSG_NAME_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class PageTextQueryResponse final : public ServerPacket
    {
    public:
        uint32 pageId = 0;
        std::string text;
        uint32 nextPageId = 0;

        explicit PageTextQueryResponse() : ServerPacket(SMSG_PAGE_TEXT_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Query

#endif // MANGOS_PACKETS_QUERY_H
