#pragma once

#include <unordered_map>

#include "Player.h"
#include "Serializer.h"
#include "ItemSerializer.h"
#include "MapManager.h"
#include "Formulas.h"
#include "ReputationMgr.h"

namespace MaNGOS {
namespace Serializer {

template <typename OP>
void Serialize(OP& buf, Player& player)
{
    player.Serialize<OP>(buf);
}

template <typename OP>
void Serialize(OP& buf, Position& pos)
{
    buf(pos.x);
    buf(pos.y);
    buf(pos.z);
    buf(pos.o);
}

} } // End namespace

inline ByteBuffer& operator<<(ByteBuffer& buf, Position const& p)
{
    buf << p.x << p.y << p.y << p.o;
    return buf;
}

inline ByteBuffer& operator>>(ByteBuffer& buf, Position& p)
{
    buf >> p.x >> p.y >> p.y >> p.o;
    return buf;
}

inline ByteBuffer& operator<<(ByteBuffer& buf, WorldLocation const& p)
{
    buf << p.coord_x << p.coord_y << p.coord_z << p.orientation << p.mapid;
    return buf;
}

inline ByteBuffer& operator>>(ByteBuffer& buf, WorldLocation& p)
{
    buf >> p.coord_x >> p.coord_y >> p.coord_z >> p.orientation >> p.mapid;
    return buf;
}

inline ByteBuffer& operator<<(ByteBuffer& buf, PlayerTaxi const& taxi)
{
    std::ostringstream oss;
    oss << taxi.SaveTaxiDestinationsToString();
    buf << oss.str();
    return buf;
}

inline ByteBuffer& operator>>(ByteBuffer& buf, PlayerTaxi& taxi)
{
    std::string s;
    buf >> s;
    taxi.LoadTaxiMask(s.c_str());
    return buf;
}

template <typename OP>
void Player::Serialize(OP& buf)
{
    if (!buf.IsRead())
        SaveToDB(); // Make sure there is no corrupted item - checked at DB save

    // Copy paste from Player::SaveToDB to be sure to forget nothing
    buf(m_name);

    SERIALIZE_VALUE(UNIT_FIELD_LEVEL);
    SERIALIZE_VALUE(PLAYER_XP);
    SERIALIZE_VALUE(PLAYER_FIELD_COINAGE);
    SERIALIZE_VALUE(PLAYER_FIELD_BYTES);
    SERIALIZE_VALUE(PLAYER_BYTES);
    SERIALIZE_VALUE(PLAYER_BYTES_2);
    SERIALIZE_VALUE(PLAYER_BYTES_3);
    SERIALIZE_VALUE(PLAYER_FLAGS);
    SERIALIZE_VALUE(PLAYER_AMMO_ID);
    for (uint32 i = UNIT_FIELD_HEALTH; i <= UNIT_FIELD_BYTES_0; ++i)
        SERIALIZE_VALUE(i);
    for (uint32 i = 0; i < PLAYER_EXPLORED_ZONES_SIZE; ++i)
        SERIALIZE_VALUE(PLAYER_EXPLORED_ZONES_1 + i);
    SERIALIZE_VALUE(PLAYER_FIELD_WATCHED_FACTION_INDEX);

    buf(m_position);
    buf(m_taxi);
    buf(m_cinematic);

    buf(m_Played_time[PLAYED_TIME_TOTAL]);
    buf(m_Played_time[PLAYED_TIME_LEVEL]);

    buf(m_rest_bonus);
    buf(m_resetTalentsMultiplier);
    buf(m_resetTalentsTime);

    buf(m_ExtraFlags);

    buf(m_stableSlots);                    // to prevent save uint8 as char

    buf(m_atLoginFlags);

    buf(m_zoneUpdateId);

    buf(m_deathExpireTime);

    uint8 rank = m_honorMgr.GetHighestRank().rank;
    uint32 standing = m_honorMgr.GetStanding();
    float rp = m_honorMgr.GetRankPoints();
    uint32 dk = m_honorMgr.GetStoredDK();

    buf(rank);
    buf(standing);
    buf(rp);
    buf(dk);

    buf(m_homebindX);
    buf(m_homebindY);
    buf(m_homebindZ);
    buf(m_homebindMapId);
    buf(m_homebindAreaId);

    buf(m_teleport_dest);
    buf(mSemaphoreTeleport_Far);

    // Nostalrius
    buf(worldMask);
    buf(customFlags);

    uint32 lastWeekHK = m_honorMgr.GetLastWeekHK();
    float lastWeekCP = m_honorMgr.GetLastWeekCP();
    buf(lastWeekHK);
    buf(lastWeekCP);

    if (buf.IsRead())
    {
        InitPlayerDisplayIds();
        setFactionForRace(getRace());
        SetCharm(NULL);
    }

    if (buf.IsRead())
    {
        InitTalentForLevel();
        learnDefaultSpells();

        SetMap(sMapMgr.CreateMap(GetMapId(), this));
    }

    SerializeSkills(buf);
    SerializeAuras(buf);
    if (buf.IsRead() && !isAlive())
        RemoveAllAurasOnDeath();
    SerializeSpells(buf);
    SerializeSpellCooldowns(buf);

    // Not needed:
    /*
    _LoadActions(QueryResult *result);
    _LoadMails(QueryResult *result);
    _LoadMailedItems(QueryResult *result);
    _LoadBoundInstances(QueryResult *result);
    _LoadGroup(QueryResult *result);
    _LoadFriendList(QueryResult *result);
    */
    // TODO:
    /**
     * Inventory loading
     *  Requires map loaded (map dependant items)
     *  Requires skills loaded (equipment items, can modify skill bonuses)
     */
    SerializeInventory(buf);
    SerializeQuestStatus(buf);
    m_reputationMgr.Serialize(buf);
    //_LoadHonorCP(QueryResult *result); // Needed for Player::CalculateTotalKills(victim)
}


template <>
void Player::SerializeAuras(MaNGOS::Serializer::WriteSerializer& buf)
{
    SpellAuraHolderMap const& auraHolders = GetSpellAuraHolderMap();

    uint32 size = auraHolders.size();
    buf(size);

    AuraSaveStruct s;
    for (SpellAuraHolderMap::const_iterator itr = auraHolders.begin(); itr != auraHolders.end(); ++itr)
    {
        uint8 hasAura = SaveAura(itr->second, s);
        buf(hasAura);
        if (hasAura)
            buf.DoStruct(s);
    }
}

template <>
void Player::SerializeAuras(MaNGOS::Serializer::ReadSerializer& buf)
{
    uint32 count = 0;
    buf(count);

    AuraSaveStruct s;
    for (uint32 i = 0; i < count; ++i)
    {
        uint8 hasAura;
        buf(hasAura);
        if (!hasAura)
            continue;

        buf.DoStruct(s);
        LoadAura(s, 0);
    }
}


template <>
void Player::SerializeInventory(MaNGOS::Serializer::WriteSerializer& buf)
{
    // List all items
    std::vector<Item*> items;
    for (int i = EQUIPMENT_SLOT_START; i < INVENTORY_SLOT_ITEM_END; ++i)
        if (Item *pItem = GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            items.push_back(pItem);
    for (int i = KEYRING_SLOT_START; i < KEYRING_SLOT_END; ++i)
        if (Item *pItem = GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            items.push_back(pItem);
    for (int i = INVENTORY_SLOT_BAG_START; i < INVENTORY_SLOT_BAG_END; ++i)
        if (Bag *pBag = (Bag*)GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            for (uint32 j = 0; j < pBag->GetBagSize(); ++j)
                if (Item* pItem = pBag->GetItemByPos(j))
                    items.push_back(pItem);
    for (int i = BANK_SLOT_ITEM_START; i < BANK_SLOT_ITEM_END; ++i)
        if (Item *pItem = GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            items.push_back(pItem);
    for (int i = BANK_SLOT_BAG_START; i < BANK_SLOT_BAG_END; ++i)
        if (Bag *pBag = (Bag*)GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            for (uint32 j = 0; j < pBag->GetBagSize(); ++j)
                if (Item* pItem = pBag->GetItemByPos(j))
                    items.push_back(pItem);

    uint32 items_count = items.size();
    buf(items_count);
    for (uint32 i = 0; i < items_count; ++i)
    {
        Item* item = items[i];
        if (!item)
            continue;

        Bag *container = item->GetContainer();
        uint32 bag_guid = container ? container->GetGUIDLow() : 0;
        uint32 item_guid_low = item->GetGUIDLow();
        uint32 item_entry = item->GetEntry();
        uint8 item_slot = item->GetSlot();

        buf(bag_guid);
        buf(item_slot);
        buf(item_guid_low);
        buf(item_entry);
        item->Serialize(buf);
    }
}


template <>
void Player::SerializeInventory(MaNGOS::Serializer::ReadSerializer& buf)
{
    m_itemUpdateQueueBlocked = true;
    uint32 items_count;
    uint32 zone = GetZoneId();
    buf(items_count);
    std::unordered_map<uint32, Bag*> bagMap;
    for (uint32 i = 0; i < items_count; ++i)
    {
        uint32 bag_guid, item_guid_low, item_entry;
        uint8 item_slot;

        buf(bag_guid);
        buf(item_slot);
        buf(item_guid_low);
        buf(item_entry);

        ItemPrototype const* proto = sObjectMgr.GetItemPrototype(item_entry);
        ASSERT(proto);

        Item* item = NewItemOrBag(proto);
        ASSERT(item->PrepareWakeUp(item_guid_low, proto, this));
        item->Serialize(buf);
        bool isValid = item->WakeUp();
        if (isAlive() && item->IsLimitedToAnotherMapOrZone(GetMapId(), zone))
            isValid = false;

        if (isValid)
        {
            // From Player::_LoadInventory:
            if (!bag_guid)
            {
                item->SetContainer(NULL);
                item->SetSlot(item_slot);

                if (IsInventoryPos(INVENTORY_SLOT_BAG_0, item_slot))
                {
                    ItemPosCountVec dest;
                    ASSERT(CanStoreItem(INVENTORY_SLOT_BAG_0, item_slot, dest, item, false) == EQUIP_ERR_OK);
                    item = StoreItem(dest, item, true);
                }
                else if (IsEquipmentPos(INVENTORY_SLOT_BAG_0, item_slot))
                {
                    uint16 dest;
                    ASSERT(CanEquipItem(item_slot, dest, item, false, false) == EQUIP_ERR_OK);
                    QuickEquipItem(dest, item);
                }
                else if (IsBankPos(INVENTORY_SLOT_BAG_0, item_slot))
                {
                    ItemPosCountVec dest;
                    ASSERT(CanBankItem(INVENTORY_SLOT_BAG_0, item_slot, dest, item, false, false) == EQUIP_ERR_OK);
                    item = BankItem(dest, item, true);
                }

                // store bags that may contain items in them
                if (item->IsBag() && IsBagPos(item->GetPos()))
                    bagMap[item->GetGUIDLow()] = (Bag*)item;
            }
            // the item/bag in a bag
            else
            {
                item->SetSlot(NULL_SLOT);
                // the item is in a bag, find the bag
                std::unordered_map<uint32, Bag*>::const_iterator itr = bagMap.find(bag_guid);
                ASSERT(itr != bagMap.end());
                ASSERT(item_slot < itr->second->GetBagSize());
                ItemPosCountVec dest;
                ASSERT(CanStoreItem(itr->second->GetSlot(), item_slot, dest, item, false) == EQUIP_ERR_OK);
                item = StoreItem(dest, item, true);
            }
        }

        if (!isValid && item)
            delete item;

        if (isValid && item)
        {
            // Do not update items for player
            item->SetState(ITEM_UNCHANGED, this);
            if (item->GetContainer())
                item->GetContainer()->SetState(ITEM_UNCHANGED, this);
        }
    }
    m_itemUpdateQueueBlocked = false;
    _ApplyAllItemMods();
}


template <>
void Player::SerializeSpells(MaNGOS::Serializer::WriteSerializer& buf)
{
    static uint32 last_spell_id = 0;
    uint32 spell_id;
    bool is_spell_active;
    bool is_spell_disabled;
    for (PlayerSpellMap::iterator itr = m_spells.begin(), next = m_spells.begin(); itr != m_spells.end(); ++itr)
    {
        // add only changed/new not dependent spells
        if (!itr->second.dependent)
        {
            spell_id = itr->first;
            is_spell_active = itr->second.active;
            is_spell_disabled = itr->second.disabled;

            buf(spell_id);
            buf(is_spell_active);
            buf(is_spell_disabled);
        }
    }
    buf(last_spell_id);
}

template <>
void Player::SerializeSpells(MaNGOS::Serializer::ReadSerializer& buf)
{
    uint32 spell_id;
    bool is_spell_active;
    bool is_spell_disabled;
    while (true)
    {
        buf(spell_id);
        if (!spell_id)
            break;

        buf(is_spell_active);
        buf(is_spell_disabled);
        addSpell(spell_id, is_spell_active, false, false, is_spell_disabled);
    }
}


template <>
void Player::SerializeSpellCooldowns(MaNGOS::Serializer::WriteSerializer& buf)
{
    static uint32 last_spell_id = 0;
    time_t currTime = time(NULL);
    for (SpellCooldowns::const_iterator itr = m_spellCooldowns.begin(); itr != m_spellCooldowns.end(); ++itr)
    {
        if (itr->second.end > currTime && itr->second.end <= currTime + infinityCooldownDelayCheck)
        {
            uint32 spell_id = itr->first;
            uint32 item_id = itr->second.itemid;
            uint64 cooldown_end = itr->second.end;
            uint64 cat_cooldown_end = itr->second.categoryEnd;

            buf(spell_id);
            buf(item_id);
            buf(cooldown_end);
            buf(cat_cooldown_end);
        }
    }
    buf(last_spell_id);
}

template <>
void Player::SerializeSpellCooldowns(MaNGOS::Serializer::ReadSerializer& buf)
{
    uint32 spell_id;
    uint32 item_id;
    uint64 cooldown_end;
    uint64 cat_cooldown_end;
    while (true)
    {
        buf(spell_id);
        if (!spell_id)
            break;

        buf(item_id);
        buf(cooldown_end);
        buf(cat_cooldown_end);

        SpellEntry const* spell = sSpellMgr.GetSpellEntry(spell_id);
        ASSERT(spell);
        AddSpellCooldown(spell_id, item_id, cooldown_end, cat_cooldown_end, spell->Category);
    }
}

template <typename OP>
void Player::SerializeSkills(OP& buf)
{
    uint16 num_skills;
    if (!buf.IsRead())
    {
        for (num_skills = PLAYER_MAX_SKILLS; num_skills > 0; --num_skills)
            if (GetUInt32Value(PLAYER_SKILL_INFO_1_1 + (num_skills-1)*3))
                break;
    }

    buf(num_skills);
    ASSERT(num_skills < PLAYER_MAX_SKILLS);
    for (int i = 0; i < num_skills; ++i)
    {
        SERIALIZE_VALUE(PLAYER_SKILL_INFO_1_1 + 3*i);
        SERIALIZE_VALUE(PLAYER_SKILL_INFO_1_1 + 3*i + 1);
        SERIALIZE_VALUE(PLAYER_SKILL_INFO_1_1 + 3*i + 2);
    }

    if (buf.IsRead())
        LoadSkillsFromFields();
}

template <typename OP>
void Player::SerializeQuestStatus(OP& buf)
{
    uint16 num_quests;
    uint32 slot = 0;
    if (!buf.IsRead())
        num_quests = mQuestStatus.size();
    buf(num_quests);

    QuestStatusMap::iterator it = mQuestStatus.begin();
    for (int i = 0; i < num_quests; ++i)
    {
        uint32 quest_id;
        if (!buf.IsRead())
        {
            quest_id = it->first;
            ++it;
        }
        buf(quest_id);
        Quest const* pQuest = sObjectMgr.GetQuestTemplate(quest_id);
        ASSERT(pQuest);
        QuestStatusData& questStatusData = mQuestStatus[quest_id];
        buf.DoStruct(questStatusData);
        questStatusData.uState = QUEST_UNCHANGED;

        if (buf.IsRead())
        {
            // Handle timed quests
            time_t quest_time = questStatusData.m_timer + sWorld.GetGameTime();

            if (pQuest->HasSpecialFlag(QUEST_SPECIAL_FLAG_TIMED) && !GetQuestRewardStatus(quest_id) && questStatusData.m_status != QUEST_STATUS_NONE)
            {
                AddTimedQuest(quest_id);

                if (quest_time <= sWorld.GetGameTime())
                    questStatusData.m_timer = 1;
                else
                    questStatusData.m_timer = uint32(quest_time - sWorld.GetGameTime()) * IN_MILLISECONDS;
            }
            else
                quest_time = 0;

            // add to quest log
            if (slot < MAX_QUEST_LOG_SIZE &&
                    ((questStatusData.m_status == QUEST_STATUS_INCOMPLETE ||
                      questStatusData.m_status == QUEST_STATUS_COMPLETE ||
                      questStatusData.m_status == QUEST_STATUS_FAILED) &&
                     (!questStatusData.m_rewarded || pQuest->IsRepeatable())))
            {
                SetQuestSlot(slot, quest_id, uint32(quest_time));

                if (questStatusData.m_explored)
                    SetQuestSlotState(slot, QUEST_STATE_COMPLETE);

                if (questStatusData.m_status == QUEST_STATUS_COMPLETE)
                    SetQuestSlotState(slot, QUEST_STATE_COMPLETE);

                if (questStatusData.m_status == QUEST_STATUS_FAILED)
                    SetQuestSlotState(slot, QUEST_STATE_FAIL);

                for (uint8 idx = 0; idx < QUEST_OBJECTIVES_COUNT; ++idx)
                    if (questStatusData.m_creatureOrGOcount[idx])
                        SetQuestSlotCounter(slot, idx, questStatusData.m_creatureOrGOcount[idx]);

                ++slot;
            }

            if (questStatusData.m_rewarded)
                learnQuestRewardedSpells(pQuest);
        }
    }
}

template <>
void ReputationMgr::Serialize(MaNGOS::Serializer::WriteSerializer& buf)
{
    for (FactionStateList::iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
    {
        ASSERT(itr->second.ID);
        buf(itr->second.ID);
        buf(itr->second.Standing);
        buf(itr->second.Flags);
    }
    uint32 last_faction = 0;
    buf(last_faction);
}

template <>
void ReputationMgr::Serialize(MaNGOS::Serializer::ReadSerializer& buf)
{
    Initialize();
    uint32 f_id;
    for (FactionStateList::iterator itr = m_factions.begin(); itr != m_factions.end(); ++itr)
    {
        buf(f_id);
        if (!f_id)
            break;

        FactionEntry const *factionEntry = sObjectMgr.GetFactionEntry(f_id);
        ASSERT(factionEntry);
        FactionState& faction = m_factions[factionEntry->reputationListID];

        faction.ID = f_id;
        buf(faction.Standing);
        buf(faction.Flags);
        faction.needSave = false;
        faction.needSend = true;
    }
}
