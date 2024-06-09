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

#include "LootMgr.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "ProgressBar.h"
#include "World.h"
#include "Util.h"
#include "Conditions.h"
#include "Group.h"
#include "BattleGroundMgr.h"

static eConfigFloatValues const qualityToRate[MAX_ITEM_QUALITY] =
{
    CONFIG_FLOAT_RATE_DROP_ITEM_POOR,                                    // ITEM_QUALITY_POOR
    CONFIG_FLOAT_RATE_DROP_ITEM_NORMAL,                                  // ITEM_QUALITY_NORMAL
    CONFIG_FLOAT_RATE_DROP_ITEM_UNCOMMON,                                // ITEM_QUALITY_UNCOMMON
    CONFIG_FLOAT_RATE_DROP_ITEM_RARE,                                    // ITEM_QUALITY_RARE
    CONFIG_FLOAT_RATE_DROP_ITEM_EPIC,                                    // ITEM_QUALITY_EPIC
    CONFIG_FLOAT_RATE_DROP_ITEM_LEGENDARY,                               // ITEM_QUALITY_LEGENDARY
    CONFIG_FLOAT_RATE_DROP_ITEM_ARTIFACT,                                // ITEM_QUALITY_ARTIFACT
};

LootStore LootTemplates_Creature(     "creature_loot_template",      "creature entry",                     true);
LootStore LootTemplates_Disenchant(   "disenchant_loot_template",    "item disenchant id",                 true);
LootStore LootTemplates_Fishing(      "fishing_loot_template",       "area id",                            true);
LootStore LootTemplates_Gameobject(   "gameobject_loot_template",    "gameobject lootid",                  true);
LootStore LootTemplates_Item(         "item_loot_template",          "item entry with ITEM_FLAG_LOOTABLE", true);
LootStore LootTemplates_Mail(         "mail_loot_template",          "mail template id",                   false);
LootStore LootTemplates_Pickpocketing("pickpocketing_loot_template", "creature pickpocket lootid",         true);
LootStore LootTemplates_Reference(    "reference_loot_template",     "reference id",                       false);
LootStore LootTemplates_Skinning(     "skinning_loot_template",      "creature skinning id",               true);

class LootTemplate::LootGroup                               // A set of loot definitions for items (refs are not allowed)
{
public:
    LootGroup() : hasConditionalEqualChancedItem(false) {}
    void AddEntry(LootStoreItem& item);                 // Adds an entry to the group (at loading stage)
    bool HasQuestDrop() const;                          // True if group includes at least 1 quest drop entry
    bool HasQuestDropForPlayer(Player const* player) const;
    // The same for active quests of the player
    void Process(Loot& loot) const;                     // Rolls an item from the group (if any) and adds the item to the loot
    float RawTotalChance() const;                       // Overall chance for the group (without equal chanced items)
    float TotalChance() const;                          // Overall chance for the group

    void Verify(LootStore const& lootstore, uint32 id, uint32 group_id) const;
    void CollectLootIds(LootIdSet& set) const;
    void CheckLootRefs(LootIdSet* ref_set) const;
private:
    LootStoreItemList ExplicitlyChanced;                // Entries with chances defined in DB
    LootStoreItemList EqualChanced;                     // Zero chances - every entry takes the same chance

    LootStoreItem const* Roll(Loot const& loot) const;                 // Rolls an item from the group, returns nullptr if all miss their chances
    bool hasConditionalEqualChancedItem;
};

//Remove all data and free all memory
void LootStore::Clear()
{
    for (const auto& itr : m_LootTemplates)
        delete itr.second;
    m_LootTemplates.clear();
}

// Checks validity of the loot store
// Actual checks are done within LootTemplate::Verify() which is called for every template
void LootStore::Verify() const
{
    for (const auto& itr : m_LootTemplates)
        itr.second->Verify(*this, itr.first);
}

// Loads a *_loot_template DB table into loot store
// All checks of the loaded template are called from here, no error reports at loot generation required
void LootStore::LoadLootTable()
{
    LootTemplateMap::const_iterator tab;
    uint32 count = 0;

    // Clearing store (for reloading case)
    Clear();

    sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "%s :", GetName());

    //                                                                 0      1     2                    3        4              5         6
    std::unique_ptr<QueryResult> result = WorldDatabase.PQuery("SELECT entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id FROM %s WHERE ((%u >= patch_min) && (%u <= patch_max)) && ((mincountOrRef < 0) || (item NOT IN (SELECT entry FROM forbidden_items WHERE (after_or_before = 0 && patch <= %u) || (after_or_before = 1 && patch >= %u))))", GetName(), sWorld.GetWowPatch(), sWorld.GetWowPatch(), sWorld.GetWowPatch(), sWorld.GetWowPatch());

    if (result)
    {
        BarGoLink bar(result->GetRowCount());

        do
        {
            Field* fields = result->Fetch();
            bar.step();

            uint32 entry               = fields[0].GetUInt32();
            uint32 item                = fields[1].GetUInt32();
            float  chanceOrQuestChance = fields[2].GetFloat();
            uint8  group               = fields[3].GetUInt8();
            int32  mincountOrRef       = fields[4].GetInt32();
            uint32 maxcount            = fields[5].GetUInt32();
            uint16 conditionId         = fields[6].GetUInt16();

            if (maxcount > std::numeric_limits<uint8>::max())
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table '%s' entry %d item %d: maxcount value (%u) to large. must be less %u - skipped", GetName(), entry, item, maxcount, std::numeric_limits<uint8>::max());
                sLog.Out(LOG_DBERRFIX, LOG_LVL_ERROR, "DELETE FROM %s WHERE entry=%u AND item=%u;", GetName(), entry, item);
                continue;                                   // error already printed to log/console.
            }

            if (mincountOrRef < 0 && conditionId)
            {
                sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table '%s' entry %u mincountOrRef %i < 0 and not allowed has condition, skipped",
                                GetName(), entry, mincountOrRef);
                sLog.Out(LOG_DBERRFIX, LOG_LVL_ERROR, "DELETE FROM %s WHERE entry=%u AND condition_id=%u AND mincountOrRef=%i;", GetName(), entry, conditionId, mincountOrRef);
                continue;
            }

            if (conditionId)
            {
                ConditionEntry const* condition = sConditionStorage.LookupEntry<ConditionEntry>(conditionId);
                if (!condition)
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table `%s` for entry %u, item %u has condition_id %u that does not exist in `conditions`, ignoring", GetName(), entry, item, conditionId);
                    sLog.Out(LOG_DBERRFIX, LOG_LVL_ERROR, "DELETE FROM %s WHERE entry=%u AND item=%u;", GetName(), entry, item);
                    continue;
                }

                if (mincountOrRef < 0 && !ConditionEntry::CanBeUsedWithoutPlayer(conditionId))
                {
                    sLog.Out(LOG_DBERROR, LOG_LVL_ERROR, "Table '%s' entry %u mincountOrRef %i < 0 and has condition %u that requires a player and is not supported, skipped", GetName(), entry, mincountOrRef, conditionId);
                    sLog.Out(LOG_DBERRFIX, LOG_LVL_ERROR, "DELETE FROM %s WHERE entry=%u AND item=%u;", GetName(), entry, item);
                    continue;
                }
            }

            LootStoreItem storeitem = LootStoreItem(item, chanceOrQuestChance, group, conditionId, mincountOrRef, maxcount);

            if (!storeitem.IsValid(*this, entry))           // Validity checks
            {
                sLog.Out(LOG_DBERRFIX, LOG_LVL_ERROR, "DELETE FROM %s WHERE entry=%u AND item=%u;", GetName(), entry, item);
                continue;
            }

            // Looking for the template of the entry
            // often entries are put together
            if (m_LootTemplates.empty() || tab->first != entry)
            {
                // Searching the template (in case template Id changed)
                tab = m_LootTemplates.find(entry);
                if (tab == m_LootTemplates.end())
                {
                    std::pair< LootTemplateMap::iterator, bool > pr = m_LootTemplates.insert(LootTemplateMap::value_type(entry, new LootTemplate));
                    tab = pr.first;
                }
            }
            // else is empty - template Id and iter are the same
            // finally iter refers to already existing or just created <entry, LootTemplate>

            // Adds current row to the template
            tab->second->AddEntry(storeitem);
            ++count;

        }
        while (result->NextRow());

        Verify();                                           // Checks validity of the loot store

        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, ">> Loaded %u loot definitions (%lu templates)", count, (unsigned long)m_LootTemplates.size());
    }
    else
    {
        sLog.Out(LOG_BASIC, LOG_LVL_MINIMAL, "");
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, ">> Loaded 0 loot definitions. DB table `%s` is empty.", GetName());
    }
}

bool LootStore::HaveQuestLootFor(uint32 loot_id) const
{
    LootTemplateMap::const_iterator itr = m_LootTemplates.find(loot_id);
    if (itr == m_LootTemplates.end())
        return false;

    // scan loot for quest items
    return itr->second->HasQuestDrop(m_LootTemplates);
}

bool LootStore::HaveQuestLootForPlayer(uint32 loot_id, Player const* player) const
{
    LootTemplateMap::const_iterator tab = m_LootTemplates.find(loot_id);
    if (tab != m_LootTemplates.end())
        if (tab->second->HasQuestDropForPlayer(m_LootTemplates, player))
            return true;

    return false;
}

LootTemplate const* LootStore::GetLootFor(uint32 loot_id) const
{
    LootTemplateMap::const_iterator tab = m_LootTemplates.find(loot_id);

    if (tab == m_LootTemplates.end())
        return nullptr;

    return tab->second;
}

void LootStore::LoadAndCollectLootIds(LootIdSet& ids_set)
{
    LoadLootTable();

    for (const auto& itr : m_LootTemplates)
        ids_set.insert(itr.first);
}

void LootStore::CheckLootRefs(LootIdSet* ref_set) const
{
    for (const auto& itr : m_LootTemplates)
        itr.second->CheckLootRefs(ref_set);
}

void LootStore::ReportUnusedIds(LootIdSet const& ids_set) const
{
    // all still listed ids isn't referenced
    for (const auto itr : ids_set)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d isn't %s and not referenced from loot, and then useless.", GetName(), itr, GetEntryName());
        sLog.Out(LOG_DBERRFIX, LOG_LVL_MINIMAL, "DELETE FROM %s WHERE entry=%u;", GetName(), itr);
    }
}

void LootStore::ReportNotExistedId(uint32 id) const
{
    sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d (%s) not exist but used as loot id in DB.", GetName(), id, GetEntryName());
}

//
// --------- LootStoreItem ---------
//

// Checks if the entry (quest, non-quest, reference) takes it's chance (at loot generation)
// RATE_DROP_ITEMS is no longer used for all types of entries
bool LootStoreItem::Roll(bool rate) const
{
    if (chance >= 100.0f)
        return true;

    if (mincountOrRef < 0)                                  // reference case
        return roll_chance_f(chance * (rate ? sWorld.getConfig(CONFIG_FLOAT_RATE_DROP_ITEM_REFERENCED) : 1.0f));

    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(itemid);

    float qualityModifier = pProto && rate ? sWorld.getConfig(qualityToRate[pProto->Quality]) : 1.0f;

    return roll_chance_f(chance * qualityModifier);
}

// Checks correctness of values
bool LootStoreItem::IsValid(LootStore const& store, uint32 entry) const
{
    if (group >= 1 << 7)                                    // it stored in 7 bit field
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: group (%u) must be less %u - skipped", store.GetName(), entry, itemid, group, 1 << 7);
        return false;
    }

    if (mincountOrRef == 0)
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: wrong mincountOrRef (%d) - skipped", store.GetName(), entry, itemid, mincountOrRef);
        return false;
    }

    if (mincountOrRef > 0)                                  // item (quest or non-quest) entry, maybe grouped
    {
        ItemPrototype const* proto = sObjectMgr.GetItemPrototype(itemid);
        if (!proto)
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: item entry not listed in `item_template` - skipped", store.GetName(), entry, itemid);
            return false;
        }

        if (chance == 0 && group == 0)                      // Zero chance is allowed for grouped entries only
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: equal-chanced grouped entry, but group not defined - skipped", store.GetName(), entry, itemid);
            return false;
        }

        if (chance != 0 && chance < 0.000001f)              // loot with low chance
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: low chance (%f) - skipped",
                            store.GetName(), entry, itemid, chance);
            return false;
        }

        if (maxcount < mincountOrRef)                       // wrong max count
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: max count (%u) less that min count (%i) - skipped", store.GetName(), entry, itemid, uint32(maxcount), mincountOrRef);
            return false;
        }

    }
    else                                                    // mincountOrRef < 0
    {
        if (needs_quest)
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: quest chance will be treated as non-quest chance", store.GetName(), entry, itemid);
        else if (chance == 0)                               // no chance for the reference
        {
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %d item %d: zero chance is specified for a reference, skipped", store.GetName(), entry, itemid);
            return false;
        }
    }
    return true;                                            // Referenced template existence is checked at whole store level
}

//
// --------- LootItem ---------
//

// Constructor, copies most fields from LootStoreItem and generates random count
LootItem::LootItem(LootStoreItem const& li)
{
    itemid      = li.itemid;
    conditionId = li.conditionId;

    ItemPrototype const* proto = sObjectMgr.GetItemPrototype(itemid);
    freeforall  = proto && (proto->Flags & ITEM_FLAG_PARTY_LOOT);

    needs_quest = li.needs_quest;

    count       = urand(li.mincountOrRef, li.maxcount);     // constructor called for mincountOrRef > 0 only
    randomPropertyId = Item::GenerateItemRandomPropertyId(itemid);
    is_looted = 0;
    is_blocked = 0;
    is_underthreshold = 0;
    is_counted = 0;
}

LootItem::LootItem(uint32 itemid_, uint32 count_, int32 randomPropertyId_)
{
    itemid      = itemid_;
    conditionId = 0;

    ItemPrototype const* proto = sObjectMgr.GetItemPrototype(itemid);
    freeforall  = proto && (proto->Flags & ITEM_FLAG_PARTY_LOOT);

    needs_quest = false;

    count       = count_;
    randomPropertyId = randomPropertyId_;
    is_looted = 0;
    is_blocked = 0;
    is_underthreshold = 0;
    is_counted = 0;
}

// Basic checks for player/item compatibility - if false no chance to see the item in the loot
bool LootItem::AllowedForPlayer(Player const* player, WorldObject const* lootTarget) const
{
    // DB conditions check
    if (conditionId && !IsConditionSatisfied(conditionId, player, player->GetMap(), lootTarget, CONDITION_FROM_LOOT))
        return false;

    ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(itemid);
    if (!pProto)
        return false;

    if (needs_quest)
    {
        // Checking quests for quest-only drop (check only quests requirements in this case)
        if (!player->HasQuestForItem(itemid))
            return false;
    }
    else
    {
        // Not quest only drop (check quest starting items for already accepted non-repeatable quests)
        if (pProto->StartQuest)
        {
            Quest const* pQuest = sObjectMgr.GetQuestTemplate(pProto->StartQuest);
            if (pQuest && !pQuest->IsRepeatable() && player->GetQuestStatus(pProto->StartQuest) != QUEST_STATUS_NONE && !player->HasQuestForItem(itemid) && !pProto->HasExtraFlag(ITEM_EXTRA_IGNORE_QUEST_STATUS))
                return false;
        }
    }
    if (!lootOwner.IsEmpty())
        return player->GetObjectGuid() == lootOwner;

    return true;
}

// Check for group wide item compatibility
bool LootStoreItem::AllowedForTeam(Loot const& loot) const
{
    if (conditionId)
    {
        ConditionEntry const* condition = sConditionStorage.LookupEntry<ConditionEntry>(conditionId);
        if (!condition)
            return false;

        // Team check
        Team conditionTeam = condition->GetTeam();
        if ((conditionTeam == ALLIANCE || conditionTeam == HORDE) && conditionTeam != loot.GetTeam())
            return false;

        // Check non-player dependant conditions
        if (ConditionEntry::CanBeUsedWithoutPlayer(conditionId))
        {
            WorldObject const* source = loot.GetLootTarget();
            Map const* map = source ? source->FindMap() : nullptr;
            if (!condition->Meets(nullptr, map, source, CONDITION_FROM_LOOT))
                return false;
        }
    }

    return true;
}

LootSlotType LootItem::GetSlotTypeForSharedLoot(PermissionTypes permission, Player* viewer, WorldObject const* lootTarget, bool condition_ok /*= false*/) const
{
    // ignore looted, FFA (each player get own copy) and not allowed items
    if (is_looted || freeforall || (conditionId && !condition_ok) || !AllowedForPlayer(viewer, lootTarget))
        return MAX_LOOT_SLOT_TYPE;
    switch (permission)
    {
        case GROUP_PERMISSION:
            return (is_blocked || is_underthreshold) ? LOOT_SLOT_TYPE_ALLOW_LOOT : LOOT_SLOT_TYPE_ROLL_ONGOING;
        case ALL_PERMISSION:
        case OWNER_PERMISSION:
            return LOOT_SLOT_TYPE_ALLOW_LOOT;
        case MASTER_PERMISSION:
            return !is_underthreshold ? LOOT_SLOT_TYPE_MASTER : LOOT_SLOT_TYPE_ALLOW_LOOT;
    }

    return MAX_LOOT_SLOT_TYPE;
}

//
// --------- Loot ---------
//

// Inserts the item into the loot (called by LootTemplate processors)
void Loot::AddItem(LootStoreItem const& item)
{
    ItemPrototype const* proto = sObjectMgr.GetItemPrototype(item.itemid);
    if (proto && !proto->Discovered)
        proto->Discovered = true;

    if (item.needs_quest && proto && (proto->Flags & ITEM_FLAG_PARTY_LOOT))
        m_hasFFAQuestItems = true;

    if (item.needs_quest)                                   // Quest drop
    {
        if (m_questItems.size() < MAX_NR_QUEST_ITEMS)
            m_questItems.push_back(LootItem(item));
    }
    else if (items.size() < MAX_NR_LOOT_ITEMS)              // Non-quest drop
    {
        items.push_back(LootItem(item));

        // non-conditional one-player only items are counted here,
        // free for all items are counted in FillFFALoot(),
        // non-ffa conditionals are counted in FillNonQuestNonFFAConditionalLoot()
        if (!item.conditionId)
        {
            if (!proto || !(proto->Flags & ITEM_FLAG_PARTY_LOOT))
                ++unlootedCount;
        }
    }
}

// Calls processor of corresponding LootTemplate (which handles everything including references)
bool Loot::FillLoot(uint32 loot_id, LootStore const& store, Player* loot_owner, bool personal, bool noEmptyError, WorldObject const* looted)
{
    LootTemplate const* tab = store.GetLootFor(loot_id);

    if (!tab)
    {
        if (!noEmptyError)
            sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' loot id #%u used but it doesn't have records.", store.GetName(), loot_id);
        return false;
    }

    m_personal = true;
    items.reserve(MAX_NR_LOOT_ITEMS);
    m_questItems.reserve(MAX_NR_QUEST_ITEMS);

    tab->Process(*this, store, store.IsRatesAllowed());     // Processing is done there, callback via Loot::AddItem()

    if (loot_owner)
        FillPlayerDependentLoot(loot_owner, personal, looted);

    return true;
}

void Loot::FillPlayerDependentLoot(Player* loot_owner, bool personal, WorldObject const* looted)
{
    // Setting access rights for group loot case
    Group* group = loot_owner->GetGroup();
    if (!personal && group)
    {
        roundRobinPlayer = loot_owner->GetGUID();
        m_personal = false;
        for (GroupReference* itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
            if (Player* pl = itr->getSource())
            {
                if (!looted || (pl->IsInWorld() && pl->IsAtGroupRewardDistance(looted)))
                {
                    m_allowedLooters.push_back(pl->GetObjectGuid());
                    FillNotNormalLootFor(pl);
                }
            }
        for (auto& item : items)
            if (ItemPrototype const* proto = sObjectMgr.GetItemPrototype(item.itemid))
                if (proto->Quality < uint32(group->GetLootThreshold()))
                    item.is_underthreshold = true;
    }
    // ... for personal loot
    else
        FillNotNormalLootFor(loot_owner);
}

bool Loot::IsAllowedLooter(ObjectGuid guid, bool doPersonalCheck) const
{
    if (doPersonalCheck && m_personal)
        return true;

    for (const auto& itr : m_allowedLooters)
        if (itr == guid)
            return true;
    return false;
}

void Loot::FillNotNormalLootFor(Player* pl)
{
    if (pl->IsInWorld())
        m_allowedLooters.push_back(pl->GetObjectGuid());
    
    uint32 plguid = pl->GetGUIDLow();

    QuestItemMap::const_iterator qmapitr = m_playerQuestItems.find(plguid);
    if (qmapitr == m_playerQuestItems.end())
        FillQuestLoot(pl);

    qmapitr = m_playerFFAItems.find(plguid);
    if (qmapitr == m_playerFFAItems.end())
        FillFFALoot(pl);

    qmapitr = m_playerNonQuestNonFFAConditionalItems.find(plguid);
    if (qmapitr == m_playerNonQuestNonFFAConditionalItems.end())
        FillNonQuestNonFFAConditionalLoot(pl);
}

QuestItemList* Loot::FillFFALoot(Player* player)
{
    if (!player->IsInWorld())
        return nullptr;

    QuestItemList *ql = new QuestItemList();

    for (uint8 i = 0; i < items.size(); ++i)
    {
        LootItem &item = items[i];
        if (!item.is_looted && item.freeforall && item.AllowedForPlayer(player, GetLootTarget()))
        {
            ql->push_back(QuestItem(i));
            ++unlootedCount;
        }
    }
    if (ql->empty())
    {
        delete ql;
        return nullptr;
    }

    m_playerFFAItems[player->GetGUIDLow()] = ql;
    return ql;
}

QuestItemList* Loot::FillQuestLoot(Player* player)
{
    if (!player->IsInWorld())
        return nullptr;

    if (items.size() == MAX_NR_LOOT_ITEMS) return nullptr;
    QuestItemList *ql = new QuestItemList();

    for (uint8 i = 0; i < m_questItems.size(); ++i)
    {
        LootItem &item = m_questItems[i];
        if (!item.is_looted && item.AllowedForPlayer(player, GetLootTarget()))
        {
            ql->push_back(QuestItem(i));

            // questitems get blocked when they first apper in a
            // player's quest vector
            //
            // increase once if one looter only, looter-times if free for all
            if (item.freeforall || !item.is_blocked)
                ++unlootedCount;

            item.is_blocked = true;

            if (items.size() + ql->size() == MAX_NR_LOOT_ITEMS)
                break;
        }
    }
    if (ql->empty())
    {
        delete ql;
        return nullptr;
    }

    m_playerQuestItems[player->GetGUIDLow()] = ql;
    return ql;
}

QuestItemList* Loot::FillNonQuestNonFFAConditionalLoot(Player* player)
{
    if (!player->IsInWorld())
        return nullptr;

    QuestItemList *ql = new QuestItemList();

    for (uint8 i = 0; i < items.size(); ++i)
    {
        LootItem &item = items[i];
        if (!item.is_looted && !item.freeforall && item.conditionId && item.AllowedForPlayer(player, GetLootTarget()))
        {
            ql->push_back(QuestItem(i));
            if (!item.is_counted)
            {
                ++unlootedCount;
                item.is_counted = true;
            }
        }
    }
    if (ql->empty())
    {
        delete ql;
        return nullptr;
    }

    m_playerNonQuestNonFFAConditionalItems[player->GetGUIDLow()] = ql;
    return ql;
}

//===================================================

void Loot::NotifyItemRemoved(uint8 lootIndex)
{
    // notify all players that are looting this that the item was removed
    // convert the index to the slot the player sees
    PlayersLooting::iterator i_next;
    for (PlayersLooting::iterator i = m_playersLooting.begin(); i != m_playersLooting.end(); i = i_next)
    {
        i_next = i;
        ++i_next;
        if (Player* pl = ObjectAccessor::FindPlayer(*i))
            pl->SendNotifyLootItemRemoved(lootIndex);
        else
            m_playersLooting.erase(i);
    }
}

void Loot::NotifyMoneyRemoved()
{
    // notify all players that are looting this that the money was removed
    PlayersLooting::iterator i_next;
    for (PlayersLooting::iterator i = m_playersLooting.begin(); i != m_playersLooting.end(); i = i_next)
    {
        i_next = i;
        ++i_next;
        if (Player* pl = ObjectAccessor::FindPlayer(*i))
            pl->SendNotifyLootMoneyRemoved();
        else
            m_playersLooting.erase(i);
    }
}

void Loot::NotifyQuestItemRemoved(uint8 questIndex)
{
    // when a free for all questitem is looted
    // all players will get notified of it being removed
    // (other questitems can be looted by each group member)
    // bit inefficient but isnt called often

    PlayersLooting::iterator i_next;
    for (PlayersLooting::iterator i = m_playersLooting.begin(); i != m_playersLooting.end(); i = i_next)
    {
        i_next = i;
        ++i_next;
        if (Player* pl = ObjectAccessor::FindPlayer(*i))
        {
            QuestItemMap::const_iterator pq = m_playerQuestItems.find(pl->GetGUIDLow());
            if (pq != m_playerQuestItems.end() && pq->second)
            {
                // find where/if the player has the given item in it's vector
                QuestItemList& pql = *pq->second;

                uint8 j;
                for (j = 0; j < pql.size(); ++j)
                    if (pql[j].index == questIndex)
                        break;

                if (j < pql.size())
                    pl->SendNotifyLootItemRemoved(items.size() + j);
            }
        }
        else
            m_playersLooting.erase(i);
    }
}

void Loot::GenerateMoneyLoot(uint32 minAmount, uint32 maxAmount)
{
    if (maxAmount > 0)
    {
        if (maxAmount <= minAmount)
            gold = uint32(maxAmount * sWorld.getConfig(CONFIG_FLOAT_RATE_DROP_MONEY));
        else if ((maxAmount - minAmount) < 32700)
            gold = uint32(urand(minAmount, maxAmount) * sWorld.getConfig(CONFIG_FLOAT_RATE_DROP_MONEY));
        else
            gold = uint32(urand(minAmount >> 8, maxAmount >> 8) * sWorld.getConfig(CONFIG_FLOAT_RATE_DROP_MONEY)) << 8;
    }
}

LootItem* Loot::LootItemInSlot(uint32 lootSlot, uint32 playerGuid, QuestItem** qitem, QuestItem** ffaitem, QuestItem** conditem)
{
    LootItem* item = nullptr;
    bool is_looted = true;
    if (lootSlot >= items.size())
    {
        uint32 questSlot = lootSlot - items.size();
        QuestItemMap::const_iterator itr = m_playerQuestItems.find(playerGuid);
        if (itr != m_playerQuestItems.end() && questSlot < itr->second->size())
        {
            QuestItem* qitem2 = &itr->second->at(questSlot);
            if (qitem)
                *qitem = qitem2;
            item = &m_questItems[qitem2->index];
            is_looted = item->is_looted || qitem2->is_looted;
        }
    }
    else
    {
        item = &items[lootSlot];
        is_looted = item->is_looted;
        if (item->freeforall)
        {
            QuestItemMap::const_iterator itr = m_playerFFAItems.find(playerGuid);
            if (itr != m_playerFFAItems.end())
            {
                for (const auto& iter : *itr->second)
                    if (iter.index == lootSlot)
                    {
                        QuestItem* ffaitem2 = (QuestItem*) & iter;
                        if (ffaitem)
                            *ffaitem = ffaitem2;
                        is_looted = ffaitem2->is_looted;
                        break;
                    }
            }
        }
        else if (item->conditionId && !is_looted)
        {
            QuestItemMap::const_iterator itr = m_playerNonQuestNonFFAConditionalItems.find(playerGuid);
            if (itr != m_playerNonQuestNonFFAConditionalItems.end())
            {
                for (const auto& iter : *itr->second)
                {
                    if (iter.index == lootSlot)
                    {
                        QuestItem* conditem2 = (QuestItem*) & iter;
                        if (conditem)
                            *conditem = conditem2;
                        is_looted = conditem2->is_looted;
                        break;
                    }
                }
            }
        }
    }

    if (is_looted)
        return nullptr;

    return item;
}

uint32 Loot::GetMaxSlotInLootFor(uint32 playerGuid) const
{
    QuestItemMap::const_iterator itr = m_playerQuestItems.find(playerGuid);
    return items.size() + (itr != m_playerQuestItems.end() ?  itr->second->size() : 0);
}

WorldObject const* Loot::GetLootTarget() const
{
    if (m_lootTarget)
    {
        if (Corpse const* pCorpse = m_lootTarget->ToCorpse())
            if (Player const* pPlayer = sObjectAccessor.FindPlayer(pCorpse->GetOwnerGuid()))
                return pPlayer;
    }
    
    return m_lootTarget;
}

ByteBuffer& operator<<(ByteBuffer& b, LootItem const& li)
{
    b << uint32(li.itemid);
    b << uint32(li.count);                                  // nr of items of this type
    b << uint32(sObjectMgr.GetItemPrototype(li.itemid)->DisplayInfoID);
    b << uint32(0);
    b << uint32(li.randomPropertyId);
    //b << uint8(0);                                        // slot type - will send after this function call
    return b;
}

ByteBuffer& operator<<(ByteBuffer& b, LootView const& lv)
{
    if (lv.permission == NONE_PERMISSION)
    {
        b << uint32(0);                                     //gold
        b << uint8(0);                                      // item count
        return b;                                           // nothing output more
    }

    Loot &l = lv.loot;

    uint8 itemsShown = 0;

    //gold
    b << uint32(l.gold);

    size_t count_pos = b.wpos();                            // pos of item count byte
    b << uint8(0);                                          // item count placeholder

    switch (lv.permission)
    {
        case GROUP_PERMISSION:
        {
            // if you are not the round-robin group looter, you can only see
            // blocked rolled items and !ffa items
            for (uint8 i = 0; i < l.items.size(); ++i)
            {
                if (!l.items[i].is_looted && !l.items[i].freeforall && l.items[i].AllowedForPlayer(lv.viewer, l.GetLootTarget()))
                {
                    uint8 slot_type;

                    if (l.items[i].is_blocked)
                        slot_type = LOOT_SLOT_TYPE_ROLL_ONGOING;
                    else if (l.roundRobinPlayer == 0 || !l.items[i].is_underthreshold || lv.viewer->GetGUID() == l.roundRobinPlayer)
                    {
                        // no round robin owner or he has released the loot
                        // or it IS the round robin group owner
                        // => item is lootable
                        slot_type = LOOT_SLOT_TYPE_ALLOW_LOOT;
                    }
                    else
                        // item shall not be displayed.
                        continue;

                    b << uint8(i) << l.items[i];
                    b << uint8(slot_type);
                    ++itemsShown;
                }
            }
            break;
        }
        case ROUND_ROBIN_PERMISSION:
        {
            for (uint8 i = 0; i < l.items.size(); ++i)
            {
                if (!l.items[i].is_looted && !l.items[i].freeforall && l.items[i].AllowedForPlayer(lv.viewer, l.GetLootTarget()))
                {
                    if (l.roundRobinPlayer != 0 && lv.viewer->GetGUID() != l.roundRobinPlayer)
                        // item shall not be displayed.
                        continue;

                    b << uint8(i) << l.items[i];
                    b << uint8(LOOT_SLOT_TYPE_ALLOW_LOOT);
                    ++itemsShown;
                }
            }
            break;
        }
        case ALL_PERMISSION:
        case MASTER_PERMISSION:
        case OWNER_PERMISSION:
        {
            uint8 slot_type = LOOT_SLOT_TYPE_ALLOW_LOOT;
            switch (lv.permission)
            {
                case MASTER_PERMISSION:
                    slot_type = LOOT_SLOT_TYPE_MASTER;
                    break;
                case OWNER_PERMISSION:
                    //slot_type = LOOT_SLOT_TYPE_OWNER;
                    slot_type = LOOT_SLOT_TYPE_ALLOW_LOOT; // Sinon pas de loot auto ...
                    break;
                default:
                    break;
            }

            for (uint8 i = 0; i < l.items.size(); ++i)
            {
                if (!l.items[i].is_looted && !l.items[i].freeforall && l.items[i].AllowedForPlayer(lv.viewer, l.GetLootTarget()))
                {
                    b << uint8(i) << l.items[i];
                    b << uint8(slot_type);
                    ++itemsShown;
                }
            }
            break;
        }
        default:
            return b;                                       // nothing output more
    }

    // in next cases used same slot type for all items
    LootSlotType slot_type = LOOT_SLOT_TYPE_ALLOW_LOOT;

    QuestItemMap const& lootPlayerQuestItems = l.GetPlayerQuestItems();
    QuestItemMap::const_iterator q_itr = lootPlayerQuestItems.find(lv.viewer->GetGUIDLow());
    if (q_itr != lootPlayerQuestItems.end())
    {
        QuestItemList *q_list = q_itr->second;
        for (QuestItemList::const_iterator qi = q_list->begin() ; qi != q_list->end(); ++qi)
        {
            LootItem &item = l.m_questItems[qi->index];

            if (qi->is_looted || item.is_looted)
                continue;

            // Allow only the round robin player unless that player is not elligible for item
            if (!item.freeforall && l.roundRobinPlayer != 0 && lv.viewer->GetGUID() != l.roundRobinPlayer
                && lootPlayerQuestItems.find(l.roundRobinPlayer) != lootPlayerQuestItems.end())
                continue;

            // allow loot
            b << uint8(l.items.size() + (qi - q_list->begin()));
            b << item;
            b << uint8(slot_type);
            ++itemsShown;
        }
    }

    QuestItemMap const& lootPlayerFFAItems = l.GetPlayerFFAItems();
    QuestItemMap::const_iterator ffa_itr = lootPlayerFFAItems.find(lv.viewer->GetGUIDLow());
    if (ffa_itr != lootPlayerFFAItems.end())
    {
        QuestItemList *ffa_list = ffa_itr->second;
        for (const auto& fi : *ffa_list)
        {
            LootItem &item = l.items[fi.index];
            if (!fi.is_looted && !item.is_looted)
            {
                b << uint8(fi.index) << item;
                b << uint8(slot_type);                      // allow loot
                ++itemsShown;
            }
        }
    }

    QuestItemMap const& lootPlayerNonQuestNonFFAConditionalItems = l.GetPlayerNonQuestNonFFAConditionalItems();
    QuestItemMap::const_iterator nn_itr = lootPlayerNonQuestNonFFAConditionalItems.find(lv.viewer->GetGUIDLow());
    if (nn_itr != lootPlayerNonQuestNonFFAConditionalItems.end())
    {
        QuestItemList *conditional_list =  nn_itr->second;
        for (const auto& ci : *conditional_list)
        {
            LootItem &item = l.items[ci.index];

            slot_type = item.GetSlotTypeForSharedLoot(lv.permission, lv.viewer, l.GetLootTarget(), !ci.is_looted);
            if (slot_type >= MAX_LOOT_SLOT_TYPE)
                continue;

            // Allow only the round robin player unless that player is not elligible for item
            if (!item.freeforall && l.roundRobinPlayer != 0 && lv.viewer->GetGUID() != l.roundRobinPlayer
                && lootPlayerNonQuestNonFFAConditionalItems.find(l.roundRobinPlayer) != lootPlayerNonQuestNonFFAConditionalItems.end())
                continue;

            b << uint8(ci.index) << item;
            b << uint8(slot_type);                          // allow loot
            ++itemsShown;
        }
    }

    //update number of items shown
    b.put<uint8>(count_pos, itemsShown);

    return b;
}

// TrinityCore
// return true if there is any item over the group threshold (i.e. not underthreshold).
bool Loot::hasOverThresholdItem() const
{
    for (const auto& item : items)
        if (!item.is_looted && !item.is_underthreshold && !item.freeforall)
            return true;

    return false;
}

// return true if there is any FFA, quest or conditional item for the player.
bool Loot::hasItemFor(Player* player) const
{
    QuestItemMap const& lootPlayerQuestItems = GetPlayerQuestItems();
    QuestItemMap::const_iterator q_itr = lootPlayerQuestItems.find(player->GetGUIDLow());
    if (q_itr != lootPlayerQuestItems.end())
    {
        QuestItemList *q_list = q_itr->second;
        for (const auto& qi : *q_list)
        {
            LootItem const& item = m_questItems[qi.index];
            if (!qi.is_looted && !item.is_looted)
                return true;
        }
    }

    QuestItemMap const& lootPlayerFFAItems = GetPlayerFFAItems();
    QuestItemMap::const_iterator ffa_itr = lootPlayerFFAItems.find(player->GetGUIDLow());
    if (ffa_itr != lootPlayerFFAItems.end())
    {
        QuestItemList* ffa_list = ffa_itr->second;
        for (const auto& fi : *ffa_list)
        {
            LootItem const& item = items[fi.index];
            if (!fi.is_looted && !item.is_looted)
                return true;
        }
    }

    QuestItemMap const& lootPlayerNonQuestNonFFAConditionalItems = GetPlayerNonQuestNonFFAConditionalItems();
    QuestItemMap::const_iterator nn_itr = lootPlayerNonQuestNonFFAConditionalItems.find(player->GetGUIDLow());
    if (nn_itr != lootPlayerNonQuestNonFFAConditionalItems.end())
    {
        QuestItemList* conditional_list =  nn_itr->second;
        for (const auto& ci : *conditional_list)
        {
            LootItem const& item = items[ci.index];
            if (!ci.is_looted && !item.is_looted)
                return true;
        }
    }

    return false;
}
// Fin TC

//
// --------- LootTemplate::LootGroup ---------
//

// Adds an entry to the group (at loading stage)
void LootTemplate::LootGroup::AddEntry(LootStoreItem& item)
{
    if (item.chance != 0)
        ExplicitlyChanced.push_back(item);
    else
    {
        EqualChanced.push_back(item);
        if (item.conditionId)
            hasConditionalEqualChancedItem = true;
    }
}

// Rolls an item from the group, returns nullptr if all miss their chances
LootStoreItem const* LootTemplate::LootGroup::Roll(Loot const& loot) const
{
    if (!ExplicitlyChanced.empty())                         // First explicitly chanced entries are checked
    {
        float Roll = rand_chance_f();

        for (const auto& i : ExplicitlyChanced) //check each explicitly chanced entry in the template and modify its chance based on quality.
        {
            if (!i.AllowedForTeam(loot))
                continue;

            if (i.chance >= 100.0f)
                return &i;

            Roll -= i.chance;
            if (Roll < 0)
                return &i;
        }
    }
    if (!EqualChanced.empty())                              // If nothing selected yet - an item is taken from equal-chanced part
    {
        if (!hasConditionalEqualChancedItem || loot.GetTeam() == TEAM_CROSSFACTION)
            return &EqualChanced[irand(0, EqualChanced.size() - 1)];
        // Select valid loots only, regarding looting group faction
        std::vector<uint32> indexesOk;
        indexesOk.reserve(EqualChanced.size());
        for (size_t i = 0; i < EqualChanced.size(); ++i)
        {
            if (!EqualChanced[i].AllowedForTeam(loot))
                continue;
            indexesOk.push_back(i);
        }
        if (!indexesOk.empty())
            return &EqualChanced[indexesOk[urand(0, indexesOk.size() - 1)]];
    }

    return nullptr;                                            // Empty drop from the group
}

// True if group includes at least 1 quest drop entry
bool LootTemplate::LootGroup::HasQuestDrop() const
{
    for (const auto& i : ExplicitlyChanced)
        if (i.needs_quest)
            return true;
    for (const auto& i : EqualChanced)
        if (i.needs_quest)
            return true;
    return false;
}

// True if group includes at least 1 quest drop entry for active quests of the player
bool LootTemplate::LootGroup::HasQuestDropForPlayer(Player const* player) const
{
    for (const auto& i : ExplicitlyChanced)
        if (player->HasQuestForItem(i.itemid))
            return true;
    for (const auto& i : EqualChanced)
        if (player->HasQuestForItem(i.itemid))
            return true;
    return false;
}

// Rolls an item from the group (if any takes its chance) and adds the item to the loot
void LootTemplate::LootGroup::Process(Loot& loot) const
{
    LootStoreItem const* item = Roll(loot);
    if (item != nullptr)
        loot.AddItem(*item);
}

// Overall chance for the group without equal chanced items
float LootTemplate::LootGroup::RawTotalChance() const
{
    float result = 0;

    for (const auto& i : ExplicitlyChanced)
        if (!i.needs_quest)
            result += i.chance;

    return result;
}

// Overall chance for the group
float LootTemplate::LootGroup::TotalChance() const
{
    float result = RawTotalChance();

    if (!EqualChanced.empty() && result < 100.0f)
        return 100.0f;

    return result;
}

void LootTemplate::LootGroup::Verify(LootStore const& lootstore, uint32 id, uint32 group_id) const
{
    float chance = RawTotalChance();
    if (chance > 101.0f)                                    // TODO: replace with 100% when DBs will be ready
    {
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %u group %d has total chance > 100%% (%f)", lootstore.GetName(), id, group_id, chance);
        sLog.Out(LOG_DBERRFIX, LOG_LVL_MINIMAL, "UPDATE %s SET ChanceOrQuestChance=ChanceOrQuestChance*%f WHERE groupid=%u;", lootstore.GetName(), 100.0f / chance, group_id);
    }

    if (chance >= 100.0f && !EqualChanced.empty())
        sLog.Out(LOG_DBERROR, LOG_LVL_MINIMAL, "Table '%s' entry %u group %d has items with chance=0%% but group total chance >= 100%% (%f)", lootstore.GetName(), id, group_id, chance);
}

void LootTemplate::LootGroup::CheckLootRefs(LootIdSet* ref_set) const
{
    for (const auto& ieItr : ExplicitlyChanced)
    {
        if (ieItr.mincountOrRef < 0)
        {
            if (!LootTemplates_Reference.GetLootFor(-ieItr.mincountOrRef))
                LootTemplates_Reference.ReportNotExistedId(-ieItr.mincountOrRef);
            else if (ref_set)
                ref_set->erase(-ieItr.mincountOrRef);
        }
    }

    for (const auto& ieItr : EqualChanced)
    {
        if (ieItr.mincountOrRef < 0)
        {
            if (!LootTemplates_Reference.GetLootFor(-ieItr.mincountOrRef))
                LootTemplates_Reference.ReportNotExistedId(-ieItr.mincountOrRef);
            else if (ref_set)
                ref_set->erase(-ieItr.mincountOrRef);
        }
    }
}

//
// --------- LootTemplate ---------
//

// Adds an entry to the group (at loading stage)
void LootTemplate::AddEntry(LootStoreItem& item)
{
    if (item.group > 0 && item.mincountOrRef > 0)           // Group
    {
        if (item.group >= Groups.size())
            Groups.resize(item.group);                      // Adds new group the the loot template if needed
        Groups[item.group - 1].AddEntry(item);              // Adds new entry to the group
    }
    else                                                    // Non-grouped entries and references are stored together
        Entries.push_back(item);
}

// Rolls for every item in the template and adds the rolled items the the loot
void LootTemplate::Process(Loot& loot, LootStore const& store, bool rate, uint8 groupId) const
{
    if (groupId)                                            // Group reference uses own processing of the group
    {
        if (groupId > Groups.size())
            return;                                         // Error message already printed at loading stage

        Groups[groupId - 1].Process(loot);
        return;
    }

    // Rolling non-grouped items
    for (const auto& itr : Entries)
    {
        if (!itr.Roll(rate))
            continue;                                       // Bad luck for the entry

        if (itr.mincountOrRef < 0)                          // References processing
        {
            LootTemplate const* Referenced = LootTemplates_Reference.GetLootFor(-itr.mincountOrRef);

            if (!Referenced)
                continue;                                   // Error message already printed at loading stage

            for (uint32 loop = 0; loop < itr.maxcount; ++loop) // Ref multiplicator
                Referenced->Process(loot, store, rate, itr.group);
        }
        else                                                // Plain entries (not a reference, not grouped)
            loot.AddItem(itr);                               // Chance is already checked, just add
    }

    // Now processing groups
    for (const auto& group : Groups)
        group.Process(loot);
}

// True if template includes at least 1 quest drop entry
bool LootTemplate::HasQuestDrop(LootTemplateMap const& store, uint8 groupId) const
{
    if (groupId)                                            // Group reference
    {
        if (groupId > Groups.size())
            return false;                                   // Error message [should be] already printed at loading stage
        return Groups[groupId - 1].HasQuestDrop();
    }

    for (const auto& itr : Entries)
    {
        if (itr.mincountOrRef < 0)                          // References
        {
            LootTemplateMap::const_iterator Referenced = store.find(-itr.mincountOrRef);
            if (Referenced == store.end())
                continue;                                   // Error message [should be] already printed at loading stage
            if (Referenced->second->HasQuestDrop(store, itr.group))
                return true;
        }
        else if (itr.needs_quest)
            return true;                                    // quest drop found
    }

    // Now processing groups
    for (const auto& group : Groups)
        if (group.HasQuestDrop())
            return true;

    return false;
}

// True if template includes at least 1 quest drop for an active quest of the player
bool LootTemplate::HasQuestDropForPlayer(LootTemplateMap const& store, Player const* player, uint8 groupId) const
{
    if (groupId)                                            // Group reference
    {
        if (groupId > Groups.size())
            return false;                                   // Error message already printed at loading stage
        return Groups[groupId - 1].HasQuestDropForPlayer(player);
    }

    // Checking non-grouped entries
    for (const auto& itr : Entries)
    {
        if (itr.mincountOrRef < 0)                          // References processing
        {
            LootTemplateMap::const_iterator Referenced = store.find(-itr.mincountOrRef);
            if (Referenced == store.end())
                continue;                                   // Error message already printed at loading stage
            if (Referenced->second->HasQuestDropForPlayer(store, player, itr.group))
                return true;
        }
        else if (player->HasQuestForItem(itr.itemid))
            return true;                                    // active quest drop found
    }

    // Now checking groups
    for (const auto& group : Groups)
        if (group.HasQuestDropForPlayer(player))
            return true;

    return false;
}

// Checks integrity of the template
void LootTemplate::Verify(LootStore const& lootstore, uint32 id) const
{
    // Checking group chances
    for (uint32 i = 0; i < Groups.size(); ++i)
        Groups[i].Verify(lootstore, id, i + 1);

    // TODO: References validity checks
}

void LootTemplate::CheckLootRefs(LootIdSet* ref_set) const
{
    for (const auto& itr : Entries)
    {
        if (itr.mincountOrRef < 0)
        {
            if (!LootTemplates_Reference.GetLootFor(-itr.mincountOrRef))
                LootTemplates_Reference.ReportNotExistedId(-itr.mincountOrRef);
            else if (ref_set)
                ref_set->erase(-itr.mincountOrRef);
        }
    }

    for (const auto& group : Groups)
        group.CheckLootRefs(ref_set);
}

void LoadLootTemplates_Creature()
{
    LootIdSet ids_set, ids_setUsed;
    LootTemplates_Creature.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto const& itr : sObjectMgr.GetCreatureInfoMap())
    {
        if (CreatureInfo const* cInfo = itr.second.get())
        {
            if (uint32 lootid = cInfo->loot_id)
            {
                if (ids_set.find(lootid) == ids_set.end())
                    LootTemplates_Creature.ReportNotExistedId(lootid);
                else
                    ids_setUsed.insert(lootid);
            }
        }
    }
    for (const auto itr : ids_setUsed)
        ids_set.erase(itr);

    // for alterac valley we've defined Player-loot inside creature_loot_template id=0
    // this hack is used, so that we won't need to create an extra table player_loot_template for just one case
    ids_set.erase(0);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Creature.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Disenchant()
{
    LootIdSet ids_set, ids_setUsed;
    LootTemplates_Disenchant.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto const& itr : sObjectMgr.GetItemPrototypeMap())
    {
        if (uint32 lootid = itr.second.DisenchantID)
        {
            if (ids_set.find(lootid) == ids_set.end())
                LootTemplates_Disenchant.ReportNotExistedId(lootid);
            else
                ids_setUsed.insert(lootid);
        }
    }
    for (const auto itr : ids_setUsed)
        ids_set.erase(itr);
    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Disenchant.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Fishing()
{
    LootIdSet ids_set;
    LootTemplates_Fishing.LoadAndCollectLootIds(ids_set);

    for (auto itr = sAreaStorage.begin<AreaEntry>(); itr < sAreaStorage.end<AreaEntry>(); ++itr)
        if (ids_set.find(itr->Id) != ids_set.end())
                ids_set.erase(itr->Id);

    // by default (look config options) fishing at fail provide junk loot, entry 0 use for store this loot
    ids_set.erase(0);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Fishing.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Gameobject()
{
    LootIdSet ids_set, ids_setUsed;
    LootTemplates_Gameobject.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto itr = sGOStorage.begin<GameObjectInfo>(); itr < sGOStorage.end<GameObjectInfo>(); ++itr)
    {
        if (uint32 lootid = itr->GetLootId())
        {
            if (ids_set.find(lootid) == ids_set.end())
                LootTemplates_Gameobject.ReportNotExistedId(lootid);
            else
                ids_setUsed.insert(lootid);
        }
    }
    for (const auto itr : ids_setUsed)
        ids_set.erase(itr);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Gameobject.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Item()
{
    LootIdSet ids_set;
    LootTemplates_Item.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto const& itr : sObjectMgr.GetItemPrototypeMap())
    {
        if (!(itr.second.Flags & ITEM_FLAG_LOOTABLE))
            continue;

        if (ids_set.find(itr.second.ItemId) != ids_set.end() || itr.second.MaxMoneyLoot > 0)
            ids_set.erase(itr.second.ItemId);
        // wdb have wrong data cases, so skip by default
        else if (!sLog.HasLogFilter(LOG_FILTER_DB_STRICTED_CHECK))
            LootTemplates_Item.ReportNotExistedId(itr.second.ItemId);
    }

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Item.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Pickpocketing()
{
    LootIdSet ids_set, ids_setUsed;
    LootTemplates_Pickpocketing.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto const& itr : sObjectMgr.GetCreatureInfoMap())
    {
        if (CreatureInfo const* cInfo = itr.second.get())
        {
            if (uint32 lootid = cInfo->pickpocket_loot_id)
            {
                if (ids_set.find(lootid) == ids_set.end())
                    LootTemplates_Pickpocketing.ReportNotExistedId(lootid);
                else
                    ids_setUsed.insert(lootid);
            }
        }
    }
    for (const auto itr : ids_setUsed)
        ids_set.erase(itr);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Pickpocketing.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Mail()
{
    LootIdSet ids_set;
    LootTemplates_Mail.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (uint32 i = 1; i < sMailTemplateStorage.GetMaxEntry(); ++i)
        if (sMailTemplateStorage.LookupEntry<MailTemplateEntry>(i))
            ids_set.erase(i);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Mail.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Skinning()
{
    LootIdSet ids_set, ids_setUsed;
    LootTemplates_Skinning.LoadAndCollectLootIds(ids_set);

    // remove real entries and check existence loot
    for (auto const& itr : sObjectMgr.GetCreatureInfoMap())
    {
        if (CreatureInfo const* cInfo = itr.second.get())
        {
            if (uint32 lootid = cInfo->skinning_loot_id)
            {
                if (ids_set.find(lootid) == ids_set.end())
                    LootTemplates_Skinning.ReportNotExistedId(lootid);
                else
                    ids_setUsed.insert(lootid);
            }
        }
    }
    for (const auto itr : ids_setUsed)
        ids_set.erase(itr);

    // output error for any still listed (not referenced from appropriate table) ids
    LootTemplates_Skinning.ReportUnusedIds(ids_set);
}

void LoadLootTemplates_Reference(LootIdSet& ids_set)
{
    LootTemplates_Reference.LoadAndCollectLootIds(ids_set);
}

void CheckLootTemplates_Reference(LootIdSet& ids_set)
{
    // check references and remove used
    LootTemplates_Creature.CheckLootRefs(&ids_set);
    LootTemplates_Fishing.CheckLootRefs(&ids_set);
    LootTemplates_Gameobject.CheckLootRefs(&ids_set);
    LootTemplates_Item.CheckLootRefs(&ids_set);
    LootTemplates_Pickpocketing.CheckLootRefs(&ids_set);
    LootTemplates_Skinning.CheckLootRefs(&ids_set);
    LootTemplates_Disenchant.CheckLootRefs(&ids_set);
    LootTemplates_Mail.CheckLootRefs(&ids_set);
    LootTemplates_Reference.CheckLootRefs(&ids_set);
    auto& usedIds = sBattleGroundMgr.GetUsedRefLootIds();
    for (uint32 refLootId : usedIds)
        ids_set.erase(refLootId);

    // output error for any still listed ids (not referenced from any loot table)
    LootTemplates_Reference.ReportUnusedIds(ids_set);
}

bool ExistsRefLootTemplate(uint32 refLootId)
{
    return LootTemplates_Reference.HaveLootFor(refLootId);
}
