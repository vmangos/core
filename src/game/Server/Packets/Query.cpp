#include "Query.h"
#include "ObjectMgr.h"

void WorldPackets::Query::QueryPlayerName::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> playerGuid;
}

void WorldPackets::Query::QueryCreature::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> entry;
    recv_data >> guid;
}

void WorldPackets::Query::QueryGameObject::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> entryID;
    recv_data >> guid;
}

void WorldPackets::Query::QueryPageText::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> pageID;
    if (recv_data.rpos() < recv_data.size())
    { // optional, see 5875 at 0x0056485D
        recv_data.read_skip<uint64>(); // object guid, not used
    }
}

void WorldPackets::Query::Whois::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> charName;
}

void WorldPackets::Query::ItemNameQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> itemId;
    recv_data.read_skip<uint64>(); // guid, not used
}

void WorldPackets::Query::QueryTimeResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << time;
}

void WorldPackets::Query::NameQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << playerGuid;
    buffer << name;
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    buffer << realmName;
#endif
    buffer << race;
    buffer << gender;
    buffer << class_;
}

void WorldPackets::Query::PageTextQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << pageId;
    buffer << text;
    buffer << nextPageId;
}

void WorldPackets::Query::CreatureQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    if (!maybeCreatureInfo.has_value())
    {
        uint32 const entry = maybeCreatureInfo.error();
        buffer << (entry | 0x80000000);
        return;
    }

    CreatureInfo const* creatureInfo = maybeCreatureInfo.value();
    std::string const* name = &creatureInfo->name;
    std::string const* subName = &creatureInfo->subname;

    int const locIdx = sessionDbLocaleIndex;
    if (locIdx >= 0)
    {
        if (CreatureLocale const* creatureLocale = sObjectMgr.GetCreatureLocale(creatureInfo->entry))
        {
            if (creatureLocale->Name.size() > static_cast<size_t>(locIdx) && !creatureLocale->Name[locIdx].empty())
                name = &creatureLocale->Name[locIdx];
            if (creatureLocale->SubName.size() > static_cast<size_t>(locIdx) && !creatureLocale->SubName[locIdx].empty())
                subName = &creatureLocale->SubName[locIdx];
        }
    }

    buffer << creatureInfo->entry;
    buffer << *name;
    buffer << ""; // name2
    buffer << ""; // name3
    buffer << ""; // name4
    buffer << *subName;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
    buffer << creatureInfo->GetTypeFlags();
#else
    buffer << creatureInfo->static_flags1;
#endif
    buffer << creatureInfo->type;
    buffer << creatureInfo->pet_family;
    buffer << creatureInfo->rank;
    // This field is reserved in the classic creature query response payload and clients expect it as 0.
    // Keeping it explicit preserves packet alignment with the legacy opcode layout.
    buffer << uint32(0);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
    buffer << creatureInfo->pet_spell_list_id;
#endif
    buffer << creatureInfo->display_id[0];
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    buffer << creatureInfo->civilian;
#endif
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
    buffer << creatureInfo->racial_leader;
#endif
}

void WorldPackets::Query::GameObjectQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    if (!maybeGameObjectInfo.has_value())
    {
        uint32 const entry = maybeGameObjectInfo.error();
        buffer << (entry | 0x80000000);
        return;
    }

    GameObjectInfo const* gameObjectInfo = maybeGameObjectInfo.value();
    std::string const* name = &gameObjectInfo->name;

    int const locIdx = sessionDbLocaleIndex;
    if (locIdx >= 0)
    {
        if (GameObjectLocale const* gameObjectLocale = sObjectMgr.GetGameObjectLocale(gameObjectInfo->id))
        {
            if (gameObjectLocale->Name.size() > static_cast<size_t>(locIdx) && !gameObjectLocale->Name[locIdx].empty())
                name = &gameObjectLocale->Name[locIdx];
        }
    }

    buffer << gameObjectInfo->id;
    buffer << gameObjectInfo->type;
    buffer << gameObjectInfo->displayId;
    buffer << *name;
    buffer << ""; // name2
    buffer << ""; // name3
    buffer << ""; // name4
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
    buffer << gameObjectInfo->icon;
    // The client interprets this as 24 int32 values (96 bytes) on 1.12.1+.
    buffer.append(reinterpret_cast<uint8 const*>(gameObjectInfo->raw.data), RawDataSize_1_12_1);
#else
    // Legacy clients consume the same blob format but only the first 16 int32 values (64 bytes).
    buffer.append(reinterpret_cast<uint8 const*>(gameObjectInfo->raw.data), RawDataSize_Legacy);
#endif
}

void WorldPackets::Query::NpcTextUpdate::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << textId;
    for (auto const& option : options)
    {
        buffer << option.probability;
        buffer << option.maleText;
        buffer << option.femaleText;
        buffer << option.language;
        buffer << option.emoteDelay1;
        buffer << option.emote1;
        buffer << option.emoteDelay2;
        buffer << option.emote2;
        buffer << option.emoteDelay3;
        buffer << option.emote3;
    }
}
