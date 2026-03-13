/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "UseItemAction.h"

#include "ChatHelper.h"
#include "Event.h"
#include "ItemUsageValue.h"
#include "Playerbots.h"
#include "ItemPackets.h"
#include "TradeData.h"

bool UseItemAction::Execute(Event event)
{
    std::string name = event.getParam();
    if (name.empty())
        name = getName();

    std::vector<Item*> items = AI_VALUE2(std::vector<Item*>, "inventory items", name);
    GuidVector gos = chat->parseGameobjects(name);

    if (gos.empty())
    {
        if (!items.empty())
        {
            return UseItemAuto(*items.begin());
        }
    }
    else
    {
        if (items.empty())
            return UseGameObject(*gos.begin());
        else
            return UseItemOnGameObject(*items.begin(), *gos.begin());
    }

    botAI->TellError("No items (or game objects) available");
    return false;
}

bool UseItemAction::UseGameObject(ObjectGuid guid)
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : GetMaster();
    GameObject* go = botAI->GetGameObject(guid);
    if (!go || !go->isSpawned() /* || go->GetGoState() != GO_STATE_READY*/)
        return false;

    go->Use(bot);

    std::ostringstream out;
    out << "Using " << chat->FormatGameobject(go, viewer);
    botAI->TellMasterNoFacing(out.str());
    return true;
}

bool UseItemAction::UseItemAuto(Item* item) { return UseItem(item, ObjectGuid::Empty, nullptr); }

bool UseItemAction::UseItemOnGameObject(Item* item, ObjectGuid go) { return UseItem(item, go, nullptr); }

bool UseItemAction::UseItemOnItem(Item* item, Item* itemTarget) { return UseItem(item, ObjectGuid::Empty, itemTarget); }

bool UseItemAction::UseItem(Item* item, ObjectGuid goGuid, Item* itemTarget, Unit* unitTarget)
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : GetMaster();
    if (bot->CanUseItem(item) != EQUIP_ERR_OK)
        return false;

    if (bot->IsNonMeleeSpellCast(false))
        return false;

    uint8 bagIndex = item->GetBagSlot();
    uint8 slot = item->GetSlot();
    uint8 spell_index = 0;
    uint16 targetFlag = TARGET_FLAG_NONE;
    ObjectGuid item_guid = item->GetGUID();
    uint32 spellId = 0;
    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (item->GetTemplate()->Spells[i].SpellId > 0)
        {
            spell_index = i;
            spellId = item->GetTemplate()->Spells[i].SpellId;
            if (!botAI->CanCastSpell(spellId, bot, false, itemTarget, item))
            {
                return false;
            }
        }
    }

    WorldPacket packet(CMSG_USE_ITEM);
    packet << bagIndex << slot << spell_index;

    bool targetSelected = false;

    std::ostringstream out;
    out << "Using " << chat->FormatItem(item->GetTemplate(), 0, 0, viewer);

    if (item->GetTemplate()->Stackable > 1)
    {
        uint32 count = item->GetCount();
        if (count > 1)
            out << " (" << count << " available) ";
        else
            out << " (the last one!)";
    }

    if (goGuid)
    {
        GameObject* go = botAI->GetGameObject(goGuid);
        if (!go || !go->isSpawned())
            return false;

        targetFlag = TARGET_FLAG_OBJECT;

        packet << targetFlag;
        packet << goGuid.WriteAsPacked();
        out << " on " << chat->FormatGameobject(go, viewer);
        targetSelected = true;
    }

    if (itemTarget)
    {
        if (item->GetTemplate()->Class == ITEM_CLASS_GEM)
        {
            bool fit = SocketItem(itemTarget, item) || SocketItem(itemTarget, item, true);
            if (!fit)
                botAI->TellMaster("Socket does not fit");

            return fit;
        }
        else
        {
            targetFlag = TARGET_FLAG_ITEM;
            packet << targetFlag;
            packet << itemTarget->GetPackGUID();
            out << " on " << chat->FormatItem(itemTarget->GetTemplate(), 0, 0, viewer);
            targetSelected = true;
        }
    }

    Player* master = GetMaster();
    if (!targetSelected && item->GetTemplate()->Class != ITEM_CLASS_CONSUMABLE && master &&
        botAI->HasActivePlayerMaster() && !selfOnly)
    {
        if (ObjectGuid masterSelection = master->GetTarget())
        {
            Unit* unit = botAI->GetUnit(masterSelection);
            if (unit)
            {
                targetFlag = TARGET_FLAG_UNIT;
                packet << targetFlag << masterSelection.WriteAsPacked();
                out << " on " << unit->GetName();
                targetSelected = true;
            }
        }
    }

    if (!targetSelected && item->GetTemplate()->Class != ITEM_CLASS_CONSUMABLE && unitTarget)
    {
        targetFlag = TARGET_FLAG_UNIT;
        packet << targetFlag << unitTarget->GetPackGUID();
        out << " on " << unitTarget->GetName();
        targetSelected = true;
    }

    if (uint32 questid = item->GetTemplate()->StartQuest)
    {
        if (Quest const* qInfo = sObjectMgr.GetQuestTemplate(questid))
        {
            WorldPacket packet(CMSG_QUESTGIVER_ACCEPT_QUEST, 8 + 4 + 4);
            packet << item_guid;
            packet << questid;
            packet << uint32(0);
            bot->GetSession()->HandleQuestgiverAcceptQuestOpcode(packet);

            std::ostringstream out;
            out << "Got quest " << chat->FormatQuest(qInfo, viewer);
            botAI->TellMasterNoFacing(out.str());
            return true;
        }
    }

    bot->ClearUnitState(UNIT_STATE_CHASE);
    bot->ClearUnitState(UNIT_STATE_FOLLOW);

    if (bot->isMoving())
    {
        bot->StopMoving();
        botAI->SetNextCheckDelay(sPlayerbotAIConfig.globalCoolDown);
        return false;
    }

    for (uint8 i = 0; i < MAX_ITEM_PROTO_SPELLS; i++)
    {
        uint32 spellId = item->GetTemplate()->Spells[i].SpellId;
        if (!spellId)
            continue;

        if (!botAI->CanCastSpell(spellId, bot, false))
            continue;

        SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(spellId);
        if (spellInfo->Targets & TARGET_FLAG_ITEM)
        {
            Item* itemForSpell = AI_VALUE2(Item*, "item for spell", spellId);
            if (!itemForSpell)
                continue;

            if (itemForSpell->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT))
                continue;

            if (bot->GetTrader())
            {
                if (selfOnly)
                    return false;

                targetFlag = TARGET_FLAG_TRADE_ITEM;
                packet << targetFlag << ObjectGuid(uint64(TRADE_SLOT_NONTRADED)).WriteAsPacked();
                targetSelected = true;
                out << " on traded item";
            }
            else
            {
                targetFlag = TARGET_FLAG_ITEM;
                packet << targetFlag;
                packet << itemForSpell->GetPackGUID();
                targetSelected = true;
                out << " on " << chat->FormatItem(itemForSpell->GetTemplate(), 0, 0, viewer);
            }
            uint32 castTime = spellInfo->GetCastTime(bot);
            botAI->SetNextCheckDelay(castTime + sPlayerbotAIConfig.reactDelay);
        }

        break;
    }

    if (!targetSelected)
    {
        targetFlag = 0;
        packet << targetFlag;
        out << " on self";
    }

    ItemTemplate const* proto = item->GetTemplate();
    bool isDrink = proto->Spells[0].SpellCategory == 59;
    bool isFood = proto->Spells[0].SpellCategory == 11;
    if (proto->Class == ITEM_CLASS_CONSUMABLE &&
        (proto->SubClass == ITEM_SUBCLASS_FOOD || proto->SubClass == ITEM_SUBCLASS_CONSUMABLE) && (isFood || isDrink))
    {
        if (bot->IsInCombat())
            return false;

        // bot->SetStandState(UNIT_STAND_STATE_SIT);
        botAI->InterruptSpell();
        float hp = bot->GetHealthPct();
        float mp = bot->GetPower(POWER_MANA) * 100.0f / bot->GetMaxPower(POWER_MANA);
        float p = 0.f;
        if (isDrink && isFood)
        {
            p = std::min(hp, mp);
            TellConsumableUse(item, "Feasting", p);
        }
        else if (isDrink)
        {
            p = mp;
            TellConsumableUse(item, "Drinking", p);
        }
        else if (isFood)
        {
            p = std::min(hp, mp);
            TellConsumableUse(item, "Eating", p);
        }

        if (!bot->IsInCombat() && !bot->InBattleground())
            botAI->SetNextCheckDelay(std::max(10000.0f, 27000.0f * (100 - p) / 100.0f));

        if (!bot->IsInCombat() && bot->InBattleground())
            botAI->SetNextCheckDelay(std::max(10000.0f, 20000.0f * (100 - p) / 100.0f));

        // botAI->SetNextCheckDelay(27000.0f * (100 - p) / 100.0f);
        //  botAI->SetNextCheckDelay(20000);
        bot->GetSession()->HandleUseItemOpcode(packet);

        return true;
    }

    if (!spellId)
        return false;

    // botAI->SetNextCheckDelay(sPlayerbotAIConfig.globalCoolDown);
    botAI->TellMasterNoFacing(out.str());
    bot->GetSession()->HandleUseItemOpcode(packet);
    return true;
}

void UseItemAction::TellConsumableUse(Item* item, std::string const action, float percent)
{
    std::ostringstream out;
    out << action << " " << chat->FormatItem(item->GetTemplate());

    if (item->GetTemplate()->Stackable > 1)
        out << "/x" << item->GetCount();

    out << " (" << round(percent) << "%)";
    botAI->TellMasterNoFacing(out.str());
}

bool UseItemAction::SocketItem(Item* item, Item* gem, bool replace)
{
    return false;
}

bool UseItemAction::isPossible() { return getName() == "use" || AI_VALUE2(uint32, "item count", getName()) > 0; }

bool UseSpellItemAction::isUseful() { return AI_VALUE2(bool, "spell cast useful", getName()); }

bool UseHealingPotion::isUseful() { return AI_VALUE2(bool, "combat", "self target"); }

bool UseManaPotion::isUseful() { return AI_VALUE2(bool, "combat", "self target"); }

bool UseHearthStone::Execute(Event event)
{
    if (bot->isMoving())
    {
        MotionMaster& mm = *bot->GetMotionMaster();
        bot->StopMoving();
        mm.Clear();
    }

    bool used = UseItemAction::Execute(event);
    if (used)
    {
        RESET_AI_VALUE(bool, "combat::self target");
        RESET_AI_VALUE(WorldPosition, "current position");
        botAI->SetNextCheckDelay(10 * IN_MILLISECONDS);
    }

    return used;
}

bool UseHearthStone::isUseful() { return !bot->InBattleground(); }

bool UseRandomRecipe::isUseful()
{
    return !bot->IsInCombat() && !botAI->HasActivePlayerMaster() && !bot->InBattleground();
}

bool UseRandomRecipe::isPossible() { return AI_VALUE2(uint32, "item count", "recipe") > 0; }

bool UseRandomRecipe::Execute(Event event)
{
    std::vector<Item*> recipes = AI_VALUE2(std::vector<Item*>, "inventory items", "recipe");

    std::string recipeName = "";

    for (auto& recipe : recipes)
    {
        recipeName = recipe->GetTemplate()->Name1;
    }

    if (recipeName.empty())
        return false;

    bool used = UseItemAction::Execute(Event(name, recipeName));

    if (used)
        botAI->SetNextCheckDelay(3.0 * IN_MILLISECONDS);

    return used;
}

bool UseRandomQuestItem::isUseful()
{
    return !botAI->HasActivePlayerMaster() && !bot->InBattleground() && !bot->HasUnitState(UNIT_STATE_IN_FLIGHT);
}

bool UseRandomQuestItem::isPossible() { return AI_VALUE2(uint32, "item count", "quest") > 0; }

bool UseRandomQuestItem::Execute(Event event)
{
    Unit* unitTarget = nullptr;
    ObjectGuid goTarget;

    std::vector<Item*> questItems = AI_VALUE2(std::vector<Item*>, "inventory items", "quest");
    if (questItems.empty())
        return false;

    Item* item = nullptr;
    for (uint8 i = 0; i < 5; i++)
    {
        auto itr = questItems.begin();
        std::advance(itr, urand(0, questItems.size() - 1));
        Item* questItem = *itr;

        ItemTemplate const* proto = questItem->GetTemplate();
        if (proto->StartQuest)
        {
            Quest const* qInfo = sObjectMgr.GetQuestTemplate(proto->StartQuest);
            if (bot->CanTakeQuest(qInfo, false))
            {
                item = questItem;
                break;
            }
        }

    }

    if (!item)
        return false;

    bool used = UseItem(item, goTarget, nullptr, unitTarget);
    if (used)
        botAI->SetNextCheckDelay(sPlayerbotAIConfig.globalCoolDown);

    return used;
}
