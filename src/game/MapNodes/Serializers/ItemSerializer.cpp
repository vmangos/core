#include "Item.h"
#include "Player.h"
#include "ItemPrototype.h"

bool Item::PrepareWakeUp(uint32 low_guid, ItemPrototype const* proto, Player const* owner)
{
    return Item::Create(low_guid, proto->ItemId, owner->GetObjectGuid());
}

bool Item::WakeUp()
{
    ItemPrototype const* proto = GetProto();
    if (!proto)
        return false;
    SetUInt32Value(ITEM_FIELD_MAXDURABILITY, proto->MaxDurability);
    return true;
}

bool Bag::PrepareWakeUp(uint32 low_guid, ItemPrototype const* proto, Player const* owner)
{
    return Bag::Create(low_guid, proto->ItemId, owner->GetObjectGuid());
}
