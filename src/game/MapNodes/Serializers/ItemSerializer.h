#pragma once

#include "Item.h"
#include "ItemPrototype.h"

#define SERIALIZE_VALUE(v) buf(m_uint32Values[v]);
#define SERIALIZE_VALUE_GUID(v) buf(m_uint32Values[v]);buf(m_uint32Values[v+1]);

namespace MaNGOS {
namespace Serializer {

template <typename OP>
void Serialize(OP& buf, Item& item)
{
    item.Serialize<OP>(buf);
}

} }

template <typename OP>
void Item::Serialize(OP& buf)
{
    // Copy pasted from Item::LoadFromDB to be sure to forget nothing

    SERIALIZE_VALUE(OBJECT_FIELD_ENTRY);
    SERIALIZE_VALUE_GUID(ITEM_FIELD_OWNER);
    SERIALIZE_VALUE_GUID(ITEM_FIELD_CREATOR);
    SERIALIZE_VALUE_GUID(ITEM_FIELD_GIFTCREATOR);
    SERIALIZE_VALUE(ITEM_FIELD_STACK_COUNT);
    SERIALIZE_VALUE(ITEM_FIELD_DURATION);
    SERIALIZE_VALUE(ITEM_FIELD_FLAGS);
    SERIALIZE_VALUE(ITEM_FIELD_RANDOM_PROPERTIES_ID);
    SERIALIZE_VALUE(ITEM_FIELD_DURABILITY);
    SERIALIZE_VALUE(ITEM_FIELD_ITEM_TEXT_ID);
    for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
        SERIALIZE_VALUE(ITEM_FIELD_SPELL_CHARGES + i);
    for (int i = 0; i < MAX_ENCHANTMENT_SLOT * MAX_ENCHANTMENT_OFFSET; ++i)
        SERIALIZE_VALUE(ITEM_FIELD_ENCHANTMENT + i);
    buf(loot.gold);
    uint32 lootItemsCount = loot.items.size();
    buf(lootItemsCount);
    for (uint32 i = 0; i < lootItemsCount; ++i)
    {
        if (buf.IsRead())
        {
            uint32 item_id;
            uint32 item_amount;
            int32  item_propid;
            buf(item_id);
            buf(item_amount);
            buf(item_propid);
            loot.items.push_back(LootItem(item_id, item_amount, item_propid));
            ++loot.unlootedCount;
        }
        else
        {
            uint32 item_id = loot.items[i].itemid;
            uint32 item_amount = loot.items[i].count;
            int32  item_propid = loot.items[i].randomPropertyId;
            buf(item_id);
            buf(item_amount);
            buf(item_propid);
        }
    }
}
