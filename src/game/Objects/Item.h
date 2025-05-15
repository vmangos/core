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

#ifndef MANGOSSERVER_ITEM_H
#define MANGOSSERVER_ITEM_H

#include "Common.h"
#include "Object.h"
#include "LootMgr.h"
#include "ItemPrototype.h"
#include "ItemDefines.h"

class SpellEntry;
class Bag;
class Field;
class Unit;
struct ItemRandomPropertiesEntry;

bool ItemCanGoIntoBag(ItemPrototype const* proto, ItemPrototype const* pBagProto);

class Item : public Object
{
    public:
        static Item* CreateItem(uint32 item, uint32 count, ObjectGuid playerGuid = ObjectGuid());
        Item* CloneItem(uint32 count, Player const* player = nullptr) const;

        Item();

        virtual bool Create(uint32 guidlow, uint32 itemid, ObjectGuid ownerGuid = ObjectGuid());
        void RemoveFromWorld() override;

        ItemPrototype const* GetProto() const;
        bool ChangeEntry(ItemPrototype const* pNewProto);

        ObjectGuid const& GetOwnerGuid() const { return GetGuidValue(ITEM_FIELD_OWNER); }
        void SetOwnerGuid(ObjectGuid guid) { SetGuidValue(ITEM_FIELD_OWNER, guid); }
        Player* GetOwner() const;

        void SetBinding(bool val) { ApplyModFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOUND, val); }
        bool IsSoulBound() const { return HasFlag(ITEM_FIELD_FLAGS, ITEM_DYNFLAG_BOUND); }
        bool IsBindedNotWith(Player const* player) const;
        bool IsBoundByEnchant() const;
        virtual void SaveToDB();
        virtual bool LoadFromDB(uint32 guidLow, ObjectGuid ownerGuid, Field* fields, uint32 entry);
        virtual void DeleteFromDB();
        void DeleteFromInventoryDB();
        void LoadLootFromDB(Field* fields);

        void DeleteAllFromDB();
        static void DeleteAllFromDB(uint32 guidLow);

        bool isWeapon() const{ return GetProto()->Class == ITEM_CLASS_WEAPON; }
        bool isOneHandedWeapon() const 
        {
            return (isWeapon() &&
                (GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_AXE ||
                GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_SWORD ||
                GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_MACE ||
                GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_FIST ||
                GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_DAGGER ||
                GetProto()->SubClass == ITEM_SUBCLASS_WEAPON_EXOTIC));
        }

        bool IsBag() const { return GetProto()->InventoryType == INVTYPE_BAG; }
        bool IsBroken() const { return GetUInt32Value(ITEM_FIELD_MAXDURABILITY) > 0 && GetUInt32Value(ITEM_FIELD_DURABILITY) == 0; }
        bool CanBeTraded() const;
        void SetInTrade(bool b = true) { mb_in_trade = b; }
        bool IsInTrade() const { return mb_in_trade; }

        static bool IsFitToSpellRequirements(SpellEntry const* spellInfo, uint32 itemClass, uint32 itemSubClass, uint32 itemInventoryType);
        bool IsFitToSpellRequirements(SpellEntry const* spellInfo) const;
        bool IsTargetValidForItemUse(Unit* pUnitTarget);
        bool IsLimitedToAnotherMapOrZone(uint32 cur_mapId, uint32 cur_zoneId) const;

        uint32 GetCount() const { return GetUInt32Value (ITEM_FIELD_STACK_COUNT); }
        void SetCount(uint32 value) { SetUInt32Value (ITEM_FIELD_STACK_COUNT, value); }
        uint32 GetMaxStackCount() const { return GetProto()->GetMaxStackSize(); }
        InventoryResult CanBeMergedPartlyWith(ItemPrototype const* proto) const;

        uint8 GetSlot() const {return m_slot;}
        Bag* GetContainer() const { return m_container; }
        uint8 GetBagSlot() const;
        void SetSlot(uint8 slot) {m_slot = slot;}
        uint16 GetPos() const { return uint16(GetBagSlot()) << 8 | GetSlot(); }
        void SetContainer(Bag *container) { m_container = container; }

        bool IsInBag() const { return m_container != nullptr; }
        bool IsEquipped() const;

        // RandomPropertyId (signed but stored as unsigned)
        int32 GetItemRandomPropertyId() const { return GetInt32Value(ITEM_FIELD_RANDOM_PROPERTIES_ID); }
        uint32 GetItemSuffixFactor() const { return GetUInt32Value(ITEM_FIELD_PROPERTY_SEED); }
        void SetItemRandomProperties(int32 randomPropId);
        static int32 GenerateItemRandomPropertyId(uint32 item_id);
        void SetEnchantment(EnchantmentSlot slot, uint32 id, uint32 duration, uint32 charges, ObjectGuid casterGuid = ObjectGuid());
        void SetEnchantmentDuration(EnchantmentSlot slot, uint32 duration);
        void SetEnchantmentCharges(EnchantmentSlot slot, uint32 charges);
        void ClearEnchantment(EnchantmentSlot slot, bool sendToClient = false);
        uint32 GetEnchantmentId(EnchantmentSlot slot)       const { return GetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot*MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_ID_OFFSET);}
        uint32 GetEnchantmentDuration(EnchantmentSlot slot) const { return GetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot*MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_DURATION_OFFSET);}
        uint32 GetEnchantmentCharges(EnchantmentSlot slot)  const { return GetUInt32Value(ITEM_FIELD_ENCHANTMENT + slot*MAX_ENCHANTMENT_OFFSET + ENCHANTMENT_CHARGES_OFFSET);}

        void SendTimeUpdate(Player const* owner) const;
        void UpdateDuration(Player* owner, uint32 diff);

        // spell charges (negative means that once charges are consumed the item should be deleted)
        int32 GetSpellCharges(uint8 index/*0..5*/ = 0) const { return GetInt32Value(ITEM_FIELD_SPELL_CHARGES + index); }
        void SetSpellCharges(uint8 index/*0..5*/, int32 value) { SetInt32Value(ITEM_FIELD_SPELL_CHARGES + index,value); }

        Loot loot;

        void SetLootState(ItemLootUpdateState state);
        bool HasGeneratedLoot() const { return !loot.empty() && m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_REMOVED; }
        bool HasTemporaryLoot() const { return !loot.empty() && m_lootState == ITEM_LOOT_TEMPORARY; }

        bool HasSavedLoot() const { return m_lootState != ITEM_LOOT_NONE && m_lootState != ITEM_LOOT_NEW && m_lootState != ITEM_LOOT_TEMPORARY; }

        // Update States
        ItemUpdateState GetState() const { return uState; }
        void SetState(ItemUpdateState state, Player* forplayer = nullptr);
        void AddToUpdateQueueOf(Player* player);
        void RemoveFromUpdateQueueOf(Player* player);
        bool IsInUpdateQueue() const { return uQueuePos != -1; }
        uint16 GetQueuePos() const { return uQueuePos; }
        void FSetState(ItemUpdateState state)               // forced
        {
            uState = state;
        }

        bool HasQuest(uint32 quest_id) const override { return GetProto()->StartQuest == quest_id; }
        bool HasInvolvedQuest(uint32 /*quest_id*/) const override { return false; }
        bool IsConjuredConsumable() const { return GetProto()->IsConjuredConsumable(); }

        void AddToClientUpdateList() override;
        void RemoveFromClientUpdateList() override;
        void BuildUpdateData(UpdateDataMapType& update_players) override;
        void SetGeneratedLoot(bool value) { generatedLoot = value; }
        bool HasGeneratedLootSecondary() const {  return generatedLoot; } // todo, remove and add condition to HasGeneratedLoot

        bool IsCharter() const { return GetEntry() == 5863u; }
        static void GetLocalizedNameWithSuffix(std::string& name, ItemPrototype const* proto, ItemRandomPropertiesEntry const* randomProp, int dbLocale, LocaleConstant dbcLocale);

    private:
        bool generatedLoot;
        uint8 m_slot;
        Bag* m_container;
        ItemUpdateState uState;
        int16 uQueuePos;
        bool mb_in_trade;                                   // true if item is currently in trade-window
        ItemLootUpdateState m_lootState;
};

#endif
